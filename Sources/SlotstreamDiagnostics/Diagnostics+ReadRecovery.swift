import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationRequestReadRecovery(modelDir: URL, mtp: Bool, lookahead: Bool = false, slotSlices: Bool = false, wordWrites: Bool = false, cpuWrites: Bool = false, residentOverlap: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.footprintSampling = true; generator.speculationEnabled = mtp; generator.draftDepth = 1
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        let seedIds = (0..<17).map { 1000 + $0*79 }
        var c = CheckBuilder("optimization-request-read-recovery\(mtp ? "-mtp" : "")\(lookahead ? "-lookahead" : "")")
        let cases: [(String,Int,Bool,Bool,Bool)] = [
            ("pool prefill",17,false,false,false),
            ("ngram prefill",17,true,false,false),
            ("sweep prefill",256,false,false,false),
            ("cached-prefix append",273,false,true,false),
            ("second chronological pass",513,false,false,false),
            ("read-scope transaction",513,false,false,true),
            ("ngram read-scope transaction",513,true,false,true),
        ]
        for (name,count,ngram,prefix,scope) in cases {
            var options = InferenceOptimizations()
            options.ngramLookahead = lookahead
            options.contiguousSlotWrites = slotSlices
            options.wordSlotWrites = wordWrites
            options.cpuSlotWrites = cpuWrites
            options.overlapResidentExperts = residentOverlap
            options.compactStateWindows = true; options.skipUnusedFinalForward = true
            options.compactMTPRow = true
            if scope {
                options.boundedIndexer = true; options.boundedPLE = true
                options.layerExpertWorkspace = true; options.readScopeTokens = 1024
                options.workspaceTokenTile = 1024; options.compactScopeFrontier = true
            }
            model.optimizations = options
            let prompt = seedIds + (17..<count).map { 1000 + (($0*7919)%200000) }
            let cache = PrefixCache(maxTokens: 4096)
            let reference = generator.generate(promptIds: prompt,params: params,eosIds: [])
            c.expect("\(name): reference succeeds",reference.1.runtimeError == nil)
            if prefix {
                var seedParams = params; seedParams.maxTokens = 1
                _ = generator.generate(promptIds: seedIds,params: seedParams,eosIds: [],cache: cache,onToken: { _ in false })
                c.equal("\(name): seed owns exactly the prompt",cache.heldTokens,seedIds.count)
            }
            // Force actual row I/O in this diagnostic without changing any
            // recurrent state or the model's numerical/cache configuration.
            if ngram || lookahead { model.ngram.compactRows = true; model.ngram.compactRows = false }
            let fault = ReadFault(afterJobs: ngram ? 0 : 17)
            let secondPass = name == "second chronological pass"
            if !secondPass {
                if ngram { model.ngram.readFault = fault } else { model.pool.readFault = fault }
            }
            generator.onPrefillProgress = { done,_,_ in
                if secondPass && done == 256 { model.pool.readFault = fault }
            }
            var delivered: [Int] = []
            let saved = MLX.Memory.cacheLimit
            let failed = generator.generate(promptIds: prompt,params: params,eosIds: [],cache: cache,
                onToken: { delivered.append($0); return true })
            model.pool.readFault = nil; model.ngram.readFault = nil; generator.onPrefillProgress = nil
            c.expect("\(name): injected read actually fails",fault.hasFired)
            c.expect("\(name): read error is reported",failed.1.runtimeError?.contains("model execution failed") == true)
            c.equal("\(name): error completion",failed.1.finishReason,"error")
            c.equal("\(name): no provisional output",failed.0,[])
            c.equal("\(name): no provisional callback",delivered,[])
            c.equal("\(name): invalid state is never cached",cache.heldTokens,0)
            c.equal("\(name): all request pins released",model.pool.pinnedSlotCount,0)
            c.expect("\(name): admission reset",!model.pool.admitOnSweep)
            c.equal("\(name): allocator limit restored",MLX.Memory.cacheLimit,saved)
            c.equal("\(name): only completed chronological passes counted",failed.1.prefillTokens,secondPass ? 256 : 0)
            c.equal("\(name): cached prefix really reused",failed.1.reusedPrefixTokens,prefix ? seedIds.count : 0)
            if scope { c.equal("\(name): failed scope counted",failed.1.abortedReadScopes,1) }
            if ngram { c.equal("\(name): failed prefetch publishes no partial row batch",model.ngram.cachedRowCount,0) }
            c.expect("\(name): failure retains physical observations",(failed.1.sampledFootprint?.samples ?? 0)>0)
            c.expect("\(name): failure retains VM interval",failed.1.generatorVMBefore != nil && failed.1.generatorVMAfter != nil)
            let retry = generator.generate(promptIds: prompt,params: params,eosIds: [],cache: cache)
            c.expect("\(name): retry succeeds",retry.1.runtimeError == nil)
            c.equal("\(name): retry does a coherent rebuild",retry.1.reusedPrefixTokens,0)
            c.equal("\(name): retry has exact reference output",retry.0,reference.0)
            if lookahead { c.expect("\(name): all lookahead joined",!model.ngram.hasPendingPrefetch) }
            c.expect("\(name): successful retry can be cached",cache.heldTokens>0)
            if mtp { c.expect("\(name): speculative verification works after recovery",retry.1.verifyPasses>0) }
        }
        for ngram in [false,true] {
            let name = "\(ngram ? "ngram" : "expert") \(mtp ? "speculative verify" : "decode")"
            var options = InferenceOptimizations()
            options.ngramLookahead = lookahead
            options.contiguousSlotWrites = slotSlices
            options.wordSlotWrites = wordWrites
            options.cpuSlotWrites = cpuWrites
            options.overlapResidentExperts = residentOverlap
            options.compactStateWindows = true; options.compactMTPRow = true; options.skipUnusedFinalForward = true
            model.optimizations = options
            let reference = generator.generate(promptIds: seedIds,params: params,eosIds: [])
            let cache = PrefixCache(maxTokens: 4096)
            let fault = ReadFault(afterJobs: 0)
            var delivered: [Int] = []
            let failed = generator.generate(promptIds: seedIds,params: params,eosIds: [],cache: cache,onToken: { id in
                delivered.append(id)
                if delivered.count == 1 {
                    if ngram {
                        model.ngram.compactRows = true; model.ngram.compactRows = false
                        model.ngram.readFault = fault
                    } else { model.pool.readFault = fault }
                }
                return true
            })
            model.pool.readFault = nil; model.ngram.readFault = nil
            c.expect("\(name): actual read failure",fault.hasFired)
            c.equal("\(name): error finish",failed.1.finishReason,"error")
            c.expect("\(name): explicit error",failed.1.runtimeError != nil)
            c.equal("\(name): emitted prefix preserved",failed.0,Array(reference.0.prefix(1)))
            c.equal("\(name): callbacks equal committed output",delivered,failed.0)
            c.equal("\(name): no partial state cached",cache.heldTokens,0)
            c.equal("\(name): pins released",model.pool.pinnedSlotCount,0)
            c.expect("\(name): admission reset",!model.pool.admitOnSweep)
            let retry = generator.generate(promptIds: seedIds,params: params,eosIds: [],cache: cache)
            c.expect("\(name): retry succeeds",retry.1.runtimeError == nil)
            c.equal("\(name): exact retry",retry.0,reference.0)
            if lookahead { c.expect("\(name): lookahead cannot escape decode recovery",!model.ngram.hasPendingPrefetch) }
            if mtp { c.expect("\(name): draft alignment restored on new state",retry.1.verifyPasses>0) }
        }
        return c.report()
    }

    public static func optimizationReadRecovery(modelDir: URL, slotSlices: Bool = false, wordWrites: Bool = false, cpuWrites: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let store = try ExpertStore(index: CheckpointIndex(dir: modelDir))
        var c = CheckBuilder("optimization-read-recovery")
        let old = (0..<40).map { ExpertKey(5, $0) }
        let incoming = (0..<34).map { ExpertKey(0, $0) }
        func bytesEqual(_ label: String, _ pool: SlotPool, _ keys: [ExpertKey]) throws {
            for lo in stride(from: 0, to: keys.count, by: 8) {
                let group = Array(keys[lo..<min(keys.count,lo+8)])
                let actual = pool.gatherResident(group), expected = try store.readBatchChecked(group)
                for piece in 0..<9 {
                    c.expect("\(label): rows \(lo), piece \(piece) exact",
                        (actual[piece] .== expected[piece]).all().item(Bool.self))
                }
            }
        }
        for dense in [false,true] {
            for sparse in [false,true] {
                for direct in [false,true] {
                    let label = "dense=\(dense), sparse=\(sparse), descriptors=\(direct)"
                    let pool = SlotPool(slots: 40, store: store)
                    pool.contiguousSlotWrites = slotSlices
                    pool.wordSlotWrites = wordWrites
                    pool.cpuSlotWrites = cpuWrites
                    pool.denseLookup = dense; pool.sparsePinClearing = sparse; pool.directReadHandles = direct
                    _ = try pool.ensureChecked(old); pool.unpinAll()
                    _ = try pool.ensureChecked([old[0]])
                    pool.resetStats()
                    pool.readFault = ReadFault(afterJobs: 0)
                    do {
                        _ = try pool.ensureChecked([old[0],old[1],incoming[0]])
                        c.expect("\(label): first-batch failure is returned",false)
                    } catch is CheckpointReadError {
                        c.expect("\(label): first-batch failure is returned",true)
                    }
                    c.equal("\(label): first failure restores prior pins",pool.pinnedSlotCount,1)
                    c.equal("\(label): no failed record counted complete",pool.recordsFetched,0)
                    c.expect("\(label): no new mapping after failed first batch",!pool.isResident(incoming[0]))
                    c.expect("\(label): all original mappings remain",old.allSatisfy { pool.isResident($0) })
                    pool.readFault = nil
                    try bytesEqual("\(label): original data after failure",pool,old)

                    // First 32-record batch succeeds; the next batch has one
                    // failed piece and other successful worker writes. None of
                    // that second batch may become a resident mapping.
                    let before = pool.recordsFetched
                    pool.readFault = ReadFault(afterJobs: 32*9)
                    let request = [old[0],old[1]] + incoming + [incoming[0],incoming[33]]
                    do {
                        _ = try pool.ensureChecked(request)
                        c.expect("\(label): later-batch failure is returned",false)
                    } catch is CheckpointReadError {
                        c.expect("\(label): later-batch failure is returned",true)
                    }
                    c.equal("\(label): later failure restores prior pins",pool.pinnedSlotCount,1)
                    c.equal("\(label): only complete records counted",pool.recordsFetched-before,32)
                    c.expect("\(label): completed batch mappings retained",incoming.prefix(32).allSatisfy { pool.isResident($0) })
                    c.expect("\(label): partial batch mappings absent",incoming.suffix(2).allSatisfy { !pool.isResident($0) })
                    c.expect("\(label): requested prior hits never evicted",pool.isResident(old[0]) && pool.isResident(old[1]))
                    pool.readFault = nil
                    let valid = old.filter { pool.isResident($0) } + Array(incoming.prefix(32))
                    try bytesEqual("\(label): every published mapping after failure",pool,valid)
                    let readBeforeRetry = pool.recordsFetched
                    let locations = try pool.ensureChecked(request)
                    c.equal("\(label): retry reads only the two uncommitted records",pool.recordsFetched-readBeforeRetry,2)
                    c.equal("\(label): retry restores unique requested pin count",pool.pinnedSlotCount,36)
                    c.equal("\(label): first duplicate retains alias",locations[2],locations[36])
                    c.equal("\(label): last duplicate retains alias",locations[35],locations[37])
                    try bytesEqual("\(label): successful retry",pool,[old[0],old[1]]+incoming)
                    pool.unpinAll(); pool.resize(to: 2)
                    _ = try pool.ensureChecked([incoming[32],incoming[33]])
                    try bytesEqual("\(label): resize after recovery",pool,Array(incoming.suffix(2)))
                    pool.unpinAll()
                }
            }
        }
        store.configureReadHandles(false)
        for depth in [0,1,32,128] {
            let ids = [0,1,3,2,2,511]
            store.readFault = ReadFault(afterJobs: 3)
            do {
                _ = try store.readRunsChecked(layer: 0,experts: ids,queueDepth: depth)
                c.expect("runs depth \(depth): failure returned",false)
            } catch is CheckpointReadError { c.expect("runs depth \(depth): failure returned",true) }
            store.readFault = nil
            let actual = try store.readRunsChecked(layer: 0,experts: ids,queueDepth: depth)
            let expected = try store.readBatchChecked(ids.map { ExpertKey(0,$0) },queueDepth: depth)
            for p in 0..<9 {
                c.expect("runs depth \(depth): retries preserve unsorted/duplicate row \(p)",
                    (actual[p] .== expected[p]).all().item(Bool.self))
            }
        }
        for (layer,ids) in [(-1,[0]),(48,[0]),(0,[-1]),(0,[512]),(0,[])] {
            do {
                _ = try store.readRunsChecked(layer: layer,experts: ids)
                c.expect("invalid runs \(layer)/\(ids) rejected",false)
            } catch CheckpointReadError.invalidRange { c.expect("invalid runs \(layer)/\(ids) rejected",true) }
        }
        do {
            _ = try store.readBatchChecked([])
            c.expect("empty raw batch rejected",false)
        } catch CheckpointReadError.invalidRange { c.expect("empty raw batch rejected",true) }
        for key in [ExpertKey(-1,0),ExpertKey(48,0),ExpertKey(0,-1),ExpertKey(0,512)] {
            do {
                _ = try store.readBatchChecked([key])
                c.expect("invalid batch key \(key) rejected",false)
            } catch SlotPoolError.invalidKey(let rejected) { c.equal("invalid batch key identified",rejected,key) }
        }
        return c.report()
    }
}
