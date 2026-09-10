import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPackedStorage(modelDir: URL) throws -> CheckReport {
        guard let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] else {
            throw ModelError("packed storage check requires SLOTSTREAM_EXPERT_LAYOUT")
        }
        MLX.Memory.cacheLimit = 64 << 20
        let directory = URL(fileURLWithPath:path,isDirectory:true)
        let store = try ExpertStore(index:CheckpointIndex(dir:modelDir))
        var c = CheckBuilder("optimization-packed-storage")
        let loaded = try store.loadPackedLayout(at:directory)
        c.measure("verified_bytes",Double(loaded.bytes))
        func exact(_ name: String,_ actual: [MLXArray],_ reference: [MLXArray]) {
            for piece in 0..<9 {
                c.expect("\(name), piece \(piece): byte identity",
                    actual[piece].shape == reference[piece].shape && actual[piece].dtype == reference[piece].dtype &&
                    (actual[piece].view(dtype:.uint8) .== reference[piece].view(dtype:.uint8)).all().item(Bool.self))
            }
        }
        for layer in 0..<48 {
            let ids = [511,0,(layer*31)%512,1,511,2]
            for depth in [1,32] {
                let packed = try store.readBatchChecked(ids.map { ExpertKey(layer,$0) },queueDepth:depth)
                let columns = try store.readRunsChecked(layer:layer,experts:ids,queueDepth:depth)
                exact("layer \(layer) depth \(depth)",packed,columns)
            }
        }
        c.equal("all selected reads used packed payload",store.packedRecordsRead,48*6*2)
        for failAfter in [0,32] {
            if !store.hasPackedLayout { try store.loadPackedLayout(at:directory) }
            let pool = SlotPool(slots:40,store:store)
            let old = (0..<40).map { ExpertKey(5,$0) }
            let incoming = (0..<34).map { ExpertKey(0,$0) }
            _ = try pool.ensureChecked(old); pool.unpinAll()
            _ = try pool.ensureChecked([old[0]])
            pool.resetStats()
            let fault = ReadFault(afterJobs:failAfter); store.packedReadFault = fault
            let request = [old[0],old[1]] + incoming + [incoming[0],incoming[33]]
            do { _ = try pool.ensureChecked(request); c.expect("failure \(failAfter) returned",false) }
            catch { c.expect("failure \(failAfter) returned",true) }
            c.expect("failure \(failAfter) actually fired",fault.hasFired)
            c.expect("failure \(failAfter) disables derived reads",!store.hasPackedLayout)
            c.equal("failure \(failAfter) restores prior pins",pool.pinnedSlotCount,1)
            c.equal("failure \(failAfter) counts complete batches",pool.recordsFetched,failAfter)
            c.expect("failure \(failAfter) never publishes incomplete mappings",incoming.dropFirst(failAfter).allSatisfy { !pool.isResident($0) })
            c.expect("failure \(failAfter) preserves prior requested hits",pool.isResident(old[0]) && pool.isResident(old[1]))
            let locations = try pool.ensureChecked(request)
            c.equal("failure \(failAfter) retry completes through original",pool.recordsFetched,34)
            c.equal("failure \(failAfter) retry aliases first duplicate",locations[2],locations[36])
            c.equal("failure \(failAfter) retry aliases last duplicate",locations[35],locations[37])
            for lo in stride(from:0,to:34,by:8) {
                let keys = Array(incoming[lo..<min(34,lo+8)])
                exact("failure \(failAfter) recovered pool rows \(lo)",pool.gatherResident(keys),try store.readBatchChecked(keys))
            }
            pool.unpinAll(); pool.resize(to:2)
            _ = try pool.ensureChecked(Array(incoming.suffix(2)))
            exact("failure \(failAfter) resize/retry",pool.gatherResident(Array(incoming.suffix(2))),try store.readBatchChecked(Array(incoming.suffix(2))))
            pool.unpinAll()
        }
        return c.report()
    }

    public static func optimizationPackedRecovery(modelDir: URL, mtp: Bool) throws -> CheckReport {
        guard ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] != nil else {
            throw ModelError("packed recovery requires SLOTSTREAM_EXPERT_LAYOUT")
        }
        MLX.Memory.cacheLimit = 64 << 20
        let model = try Qwen4ExpModel(index:CheckpointIndex(dir:modelDir),poolSlots:640)
        if mtp { try model.enableMTP(modelDir:modelDir) }
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true; options.skipUnusedFinalForward = true
        model.optimizations = options
        let generator = Generator(model:model)
        generator.prefillChunk = 256; generator.speculationEnabled = mtp; generator.draftDepth = 1
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        let prompt = (0..<17).map { 1000+$0*79 }
        var c = CheckBuilder("optimization-packed-recovery\(mtp ? "-mtp" : "")")
        model.pool.usePackedLayout = false
        let reference = generator.generate(promptIds:prompt,params:params,eosIds:[])
        c.expect("original reference succeeds",reference.1.runtimeError == nil)
        model.pool.usePackedLayout = true
        let candidate = generator.generate(promptIds:prompt,params:params,eosIds:[])
        c.expect("packed candidate succeeds",candidate.1.runtimeError == nil)
        c.equal("packed candidate exact token IDs",candidate.0,reference.0)
        c.expect("packed candidate performs real reads",model.pool.packedRecordsRead > 0)
        if mtp { c.expect("packed candidate verifies drafts",candidate.1.verifyPasses > 0) }
        let cache = PrefixCache(maxTokens:4096)
        let fault = ReadFault(afterJobs:0)
        var emitted: [Int] = []
        let savedLimit = MLX.Memory.cacheLimit
        let failed = generator.generate(promptIds:prompt,params:params,eosIds:[],cache:cache,onToken:{ id in
            emitted.append(id)
            if emitted.count == 1 { model.pool.packedReadFault = fault }
            return true
        })
        c.expect("failure after emitted token fires",fault.hasFired)
        c.equal("failed request reports error completion",failed.1.finishReason,"error")
        c.expect("failed request carries explicit error",failed.1.runtimeError != nil)
        c.equal("emitted prefix preserved",failed.0,Array(reference.0.prefix(1)))
        c.equal("callbacks match preserved prefix",emitted,failed.0)
        c.expect("failed derived source disabled",!model.pool.hasPackedLayout)
        c.equal("partially advanced state never cached",cache.heldTokens,0)
        c.equal("pins released",model.pool.pinnedSlotCount,0)
        c.expect("admission disabled",!model.pool.admitOnSweep)
        c.equal("allocator limit restored",MLX.Memory.cacheLimit,savedLimit)
        let retry = generator.generate(promptIds:prompt,params:params,eosIds:[],cache:cache)
        c.expect("retry through original succeeds",retry.1.runtimeError == nil)
        c.equal("retry through original exact IDs",retry.0,reference.0)
        if mtp { c.expect("retry restores draft alignment",retry.1.verifyPasses > 0) }
        return c.report()
    }

    public static func optimizationPackedLayout() throws -> CheckReport {
        var c = CheckBuilder("optimization-packed-layout")
        let fm = FileManager.default
        let root = fm.temporaryDirectory.appendingPathComponent("slotstream-packed-check-\(UUID().uuidString)")
        try fm.createDirectory(at:root,withIntermediateDirectories:false)
        defer { try? fm.removeItem(at:root) }
        let pieces = [31,7,7,31,7,7,31,7,7]
        let layers = 3, experts = 5, identity = String(repeating:"a",count:64)
        func bytes(_ layer: Int,_ expert: Int,_ piece: Int) -> [UInt8] {
            (0..<pieces[piece]).map { UInt8(truncatingIfNeeded:layer*101+expert*31+piece*13+$0) }
        }
        func construct(_ directory: URL, unchanged: () throws -> Void = {},
            fault: ((String,Int) throws -> Void)? = nil) throws {
            _ = try PackedExpertLayout.build(directory:directory,identity:identity,layers:layers,
                experts:experts,pieces:pieces,sourceUnchanged:unchanged,
                reader:{ layer,expert,piece,dst in
                    bytes(layer,expert,piece).withUnsafeBytes { raw in _ = memcpy(dst,raw.baseAddress!,raw.count) }
                },fault:fault)
        }
        func load(_ directory: URL, id: String? = nil, after: (() throws -> Void)? = nil) throws -> PackedExpertLayout {
            try PackedExpertLayout(directory:directory,identity:id ?? identity,layers:layers,
                experts:experts,pieces:pieces,afterVerification:after)
        }
        func rejected(_ name: String,_ action: () throws -> Void) {
            do { try action(); c.expect(name,false) }
            catch { c.expect(name,true) }
        }
        let good = root.appendingPathComponent("good")
        try construct(good)
        let packed = try load(good)
        c.equal("complete payload verified",packed.verifiedBytes,layers*experts*pieces.reduce(0,+))
        c.expect("load verification has observed duration",packed.verificationSeconds > 0)
        let keys = [ExpertKey(2,4),ExpertKey(0,0),ExpertKey(1,2),ExpertKey(2,4)]
        let buffers = pieces.map { UnsafeMutableRawPointer.allocate(byteCount:keys.count*$0,alignment:16) }
        defer { buffers.forEach { $0.deallocate() } }
        for depth in [0,1,2,32,128] {
            try packed.readBatch(keys,buffers:buffers,queueDepth:depth)
            for (row,key) in keys.enumerated() { for piece in pieces.indices {
                let got = Array(UnsafeBufferPointer(start:(buffers[piece]+row*pieces[piece]).assumingMemoryBound(to:UInt8.self),count:pieces[piece]))
                c.equal("depth \(depth), row \(row), piece \(piece): exact original bytes",got,bytes(key.layer,key.expert,piece))
            } }
        }
        for keys in [[],[ExpertKey(-1,0)],[ExpertKey(0,5)],[ExpertKey(3,0)],[ExpertKey(0,-1)]] {
            rejected("invalid key/span rejected") { try packed.readBatch(keys,buffers:buffers,queueDepth:2) }
        }
        rejected("model/quantization identity mismatch rejected") { _ = try load(good,id:String(repeating:"b",count:64)) }
        for after in [0,1,3] {
            let fault = ReadFault(afterJobs:after); packed.readFault = fault
            rejected("read job \(after) aborts joined batch") { try packed.readBatch(keys,buffers:buffers,queueDepth:2) }
            c.expect("fault \(after) fired",fault.hasFired)
            packed.readFault = nil
            try packed.readBatch(keys,buffers:buffers,queueDepth:2)
            c.expect("joined batch permits subsequent read \(after)",true)
        }
        rejected("existing artifact cannot be overwritten") { try construct(good) }
        let collision = root.appendingPathComponent("publish-collision")
        rejected("publication race never overwrites another destination") {
            try construct(collision,fault:{ stage,_ in
                if stage == "publish" {
                    try fm.createDirectory(at:collision,withIntermediateDirectories:false)
                    try Data("preserve".utf8).write(to:collision.appendingPathComponent("sentinel"))
                }
            })
        }
        c.equal("publication collision preserves existing bytes",
            try Data(contentsOf:collision.appendingPathComponent("sentinel")),Data("preserve".utf8))
        for stage in ["disk-full","interrupt","publish","source-change"] {
            let dest = root.appendingPathComponent(stage)
            var sourceChecks = 0
            rejected("\(stage) aborts construction") {
                try construct(dest,unchanged:{
                    sourceChecks += 1
                    if stage == "source-change", sourceChecks == 2 { throw ModelError("source changed") }
                },fault:{ point,index in
                    if stage == "disk-full", point == "write", index == 0 { throw CheckpointReadError.system(offset:0,code:ENOSPC) }
                    if stage == "interrupt", point == "write", index == 0 { throw CheckpointReadError.cancelled }
                    if stage == "publish", point == "publish" { throw ModelError("interrupted before publish") }
                })
            }
            c.expect("\(stage): no incomplete publication",!fm.fileExists(atPath:dest.path))
            let names = try fm.contentsOfDirectory(atPath:root.path)
            c.expect("\(stage): joined scratch directory removed",!names.contains(where:{$0.hasPrefix(".slotstream-pack-")}))
            try packed.readBatch(keys,buffers:buffers,queueDepth:2)
            c.expect("\(stage): original valid artifact usable",true)
        }
        func copy(_ name: String) throws -> URL {
            let dest = root.appendingPathComponent(name); try fm.copyItem(at:good,to:dest); return dest
        }
        let corrupt = try copy("corrupt")
        let corruptFile = corrupt.appendingPathComponent("experts.bin")
        let fh = try FileHandle(forWritingTo:corruptFile)
        try fh.seek(toOffset:0); try fh.write(contentsOf:Data([255])); try fh.close()
        rejected("stored payload corruption rejected at load") { _ = try load(corrupt) }
        let short = try copy("short")
        let sh = try FileHandle(forWritingTo:short.appendingPathComponent("experts.bin")); try sh.truncate(atOffset:1); try sh.close()
        rejected("truncated payload rejected at load") { _ = try load(short) }
        for (name,key,value) in [("version","version",2 as Any),("geometry","experts",6 as Any),("piece","pieces",[Int.max,7,7,31,7,7,31,7,7] as Any)] {
            let dest = try copy(name); let meta = dest.appendingPathComponent("manifest.json")
            var object = try JSONSerialization.jsonObject(with:Data(contentsOf:meta)) as! [String:Any]
            object[key] = value; try JSONSerialization.data(withJSONObject:object).write(to:meta)
            rejected("\(name) manifest rejected") { _ = try load(dest) }
        }
        let oversized = try copy("large-manifest")
        try Data(repeating:32,count:(1 << 20)+1).write(to:oversized.appendingPathComponent("manifest.json"))
        rejected("oversized manifest rejected before decode") { _ = try load(oversized) }
        let symlink = try copy("symlink")
        try fm.removeItem(at:symlink.appendingPathComponent("experts.bin"))
        try fm.createSymbolicLink(at:symlink.appendingPathComponent("experts.bin"),withDestinationURL:good.appendingPathComponent("experts.bin"))
        rejected("payload symlink rejected") { _ = try load(symlink) }
        let duringLoad = try copy("changed-during-load")
        rejected("change during verification prevents publication") {
            _ = try load(duringLoad,after:{
                let h = try FileHandle(forWritingTo:duringLoad.appendingPathComponent("experts.bin"))
                try h.truncate(atOffset:1); try h.close()
            })
        }
        let duringRead = try copy("changed-during-read")
        let reading = try load(duringRead)
        reading.beforeReadCommit = {
            let h = try FileHandle(forWritingTo:duringRead.appendingPathComponent("experts.bin"))
            try h.truncate(atOffset:1); try h.close()
        }
        rejected("post-read mutation rejects the complete batch") { try reading.readBatch(keys,buffers:buffers,queueDepth:2) }
        reading.beforeReadCommit = nil
        rejected("subsequent read rejects stale descriptor before I/O") { try reading.readBatch(keys,buffers:buffers,queueDepth:2) }
        return c.report()
    }
}
