import Foundation
import CSlotpack

@main struct ManifestChecks {
    static func main() throws {
        var checks = [String]()
        func expect(_ name: String, _ valid: Bool) throws {
            guard valid else { throw SlotstreamError.pull("FAIL: \(name)") }; checks.append(name)
        }
        func rejects(_ name: String, _ operation: () throws -> Void) throws {
            var rejected = false
            do { try operation() } catch { rejected = true }
            try expect(name, rejected)
        }
        let embedded = try PinnedTransport.manifest.get()
        try expect("embedded manifest and original pins agree", embedded.files.count == PinnedModel.files.count)
        try expect("new installs use an exact public Hugging Face commit",
                   PinnedTransport.revision.range(of: "^[0-9a-f]{40}$", options: .regularExpression) != nil &&
                   PinnedTransport.defaults == ["https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/\(PinnedTransport.revision)/slotpack/v1/\(PinnedTransport.manifestSHA256)"])
        try expect("Hugging Face reset survives the old one-minute cap",
                   DownloadRetry.delay(status: 429, retryAfter: nil, rateLimit: "\"resolvers\";r=0;t=299") == 300)
        try expect("long Retry-After is respected",
                   DownloadRetry.delay(status: 429, retryAfter: "300", rateLimit: nil) == 300)
        try expect("the later server retry boundary wins",
                   DownloadRetry.delay(status: 429, retryAfter: "100", rateLimit: "\"resolvers\";r=0;t=299") == 300)
        try expect("unbounded waits are capped and remain cancellable",
                   DownloadRetry.delay(status: 429, retryAfter: "1000000", rateLimit: nil) == 600)
        try expect("invalid throttle headers wait one resolver window",
                   DownloadRetry.delay(status: 429, retryAfter: "nan", rateLimit: "\"resolvers\";t=inf") == 300)
        try expect("ordinary transient errors retain exponential backoff",
                   DownloadRetry.delay(status: 503, retryAfter: nil, rateLimit: "\"resolvers\";t=299") == nil)
        let retryDate = Date(timeIntervalSince1970: 0)
        try expect("HTTP-date retry boundaries are honored",
                   DownloadRetry.delay(status: 429, retryAfter: "Thu, 01 Jan 1970 00:05:00 GMT", rateLimit: nil, now: retryDate) == 300)
        let raw = Data((0..<4096).map { UInt8($0 % 8) })
        var buffer = Data(count: raw.count+32)
        let capacity = buffer.count
        let length = buffer.withUnsafeMutableBytes { dst in raw.withUnsafeBytes { src in
            slotpack_encode(src.bindMemory(to: UInt8.self).baseAddress, raw.count, 0, 0, 0, dst.bindMemory(to: UInt8.self).baseAddress, capacity)
        } }
        try expect("C encoder accepts Swift data", length > 0)
        let encoded = Data(buffer.prefix(Int(length)))
        let digest = SlotpackManifest.digest(raw)
        let files = [PinnedModel.File(path: "weights.bin", size: Int64(raw.count), sha256: digest)]
        let object = SlotpackManifest.Object(sha256: SlotpackManifest.digest(encoded), size: encoded.count, rawSize: raw.count, rawSHA256: digest,
            ranges: [.init(file: 0, offset: 0, length: raw.count)])
        let manifest = SlotpackManifest(format: "slotpack-v1", files: files, objects: [object])
        let json = try JSONEncoder().encode(manifest)
        let hash = SlotpackManifest.digest(json)
        _ = try SlotpackManifest.load(json, digest: hash, files: files)
        try expect("Swift C roundtrip is exact", try SlotpackManifest.decode(encoded, object: object) == raw)
        try rejects("manifest hash is mandatory") { _ = try SlotpackManifest.load(json, digest: String(repeating: "0", count: 64), files: files) }
        try rejects("pinned file identity cannot change") {
            _ = try SlotpackManifest.load(json, digest: hash, files: [.init(path: "other", size: Int64(raw.count), sha256: digest)])
        }
        func mutated(_ name: String, _ edit: (inout [String: Any]) -> Void) throws {
            var document = try JSONSerialization.jsonObject(with: json) as! [String: Any]
            edit(&document)
            let data = try JSONSerialization.data(withJSONObject: document)
            try rejects(name) { _ = try SlotpackManifest.load(data, digest: SlotpackManifest.digest(data), files: files) }
        }
        try mutated("unknown version") { $0["format"] = "slotpack-v999" }
        try mutated("empty object list") { $0["objects"] = [] }
        for (key,value) in [("size",Int.max),("rawSize",Int.max),("rawSize",0),("size",0)] {
            try mutated("invalid \(key)=\(value)") { d in var rows = d["objects"] as! [[String: Any]]; rows[0][key] = value; d["objects"] = rows }
        }
        try mutated("overlapping ranges") { d in d["objects"] = [d["objects"] as! [Any], d["objects"] as! [Any]].flatMap { $0 } }
        try mutated("range escapes file") { d in var rows = d["objects"] as! [[String: Any]]; rows[0]["ranges"] = [["file":0,"offset":1,"length":raw.count]]; d["objects"] = rows }
        try mutated("range references unknown file") { d in var rows = d["objects"] as! [[String: Any]]; rows[0]["ranges"] = [["file":Int.max,"offset":0,"length":raw.count]]; d["objects"] = rows }
        try mutated("path traversal") { d in var rows = d["files"] as! [[String: Any]]; rows[0]["path"] = "../escape"; d["files"] = rows }
        var corrupt = encoded; corrupt[corrupt.count-1] ^= 1
        try rejects("compressed corruption") { _ = try SlotpackManifest.decode(corrupt, object: object) }
        let wrongRaw = SlotpackManifest.Object(sha256: object.sha256, size: object.size, rawSize: object.rawSize, rawSHA256: String(repeating: "0",count:64), ranges: object.ranges)
        try rejects("reconstruction digest is mandatory") { _ = try SlotpackManifest.decode(encoded, object: wrongRaw) }

        var tuner = DownloadConcurrency()
        try expect("trial starts at 16", tuner.observe(bytesPerSecond: 100, decodeBacklog: false, hadRetries: false) == 16)
        try expect("plateau rolls back to 8", tuner.observe(bytesPerSecond: 105, decodeBacklog: false, hadRetries: false) == 8 && tuner.finished)
        tuner = DownloadConcurrency()
        _ = tuner.observe(bytesPerSecond: 100, decodeBacklog: false, hadRetries: false)
        try expect("useful gain trials 32", tuner.observe(bytesPerSecond: 125, decodeBacklog: false, hadRetries: false) == 32)
        _ = tuner.observe(bytesPerSecond: 150, decodeBacklog: false, hadRetries: false)
        try expect("cap stays at 32", tuner.active == 32 && tuner.finished)
        for backlog in [true,false] {
            tuner = DownloadConcurrency(); _ = tuner.observe(bytesPerSecond: 100, decodeBacklog: backlog, hadRetries: !backlog)
            try expect("CPU backlog or retries stops expansion", tuner.active == 8 && tuner.finished)
        }
        let temp = FileManager.default.temporaryDirectory.appendingPathComponent("slotpack-manifest-check-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: temp, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: temp) }
        let originalOptions: ([String]?, Int?) -> PullOptions = PullOptions.init
        let originalDownload: (URL, Int?, [String]?, WeightStore.Log) throws -> Void = WeightStore.download
        _ = originalDownload
        try expect("original public API signatures remain available", originalOptions(nil, nil).transport == .automatic)
        let cancelled = PullCancellation(); cancelled.cancel()
        try rejects("public synchronous log lifetime closes on cancellation") {
            try WeightStore.download(to: temp, transport: .automatic, cancellation: cancelled, log: { _ in })
        }
        // Progress reports original bytes represented by a complete object,
        // including its separate weight/scale/bias ranges. Sparse fixtures
        // exercise the real embedded pin without allocating model data.
        let progressRoot = temp.appendingPathComponent("resume-progress")
        try FileManager.default.createDirectory(at: progressRoot, withIntermediateDirectories: true)
        let progressIndex = embedded.objects.firstIndex {
            $0.ranges.count == 3 && Set($0.ranges.map(\.file)).count == 1
        }!
        let progressObject = embedded.objects[progressIndex]
        let progressFile = embedded.files[progressObject.ranges[0].file]
        let progressPart = progressRoot.appendingPathComponent(progressFile.path).appendingPathExtension("slotpack.part")
        var done = [UInt8](repeating: 0, count: embedded.objects.count); done[progressIndex] = 1
        func writeProgressMap() throws {
            let map: [String: Any] = ["manifest": PinnedTransport.manifestSHA256, "done": done]
            try JSONSerialization.data(withJSONObject: map).write(to: progressRoot.appendingPathComponent(".slotpack-state.json"))
        }
        try writeProgressMap()
        try expect("dangling resume bits do not report downloaded bytes", SlotpackDownload.resumeModelBytes(at: progressRoot).isEmpty)
        try Data().write(to: progressPart)
        let progressHandle = try FileHandle(forWritingTo: progressPart)
        try progressHandle.truncate(atOffset: UInt64(progressFile.size)); try progressHandle.close()
        try expect("resume progress combines original weight and metadata bytes",
                   SlotpackDownload.resumeModelBytes(at: progressRoot) == [progressFile.path: Int64(progressObject.rawSize)])
        let progressFinal = progressRoot.appendingPathComponent(progressFile.path)
        try FileManager.default.moveItem(at: progressPart, to: progressFinal)
        try expect("finalized files are not counted as partial progress", SlotpackDownload.resumeModelBytes(at: progressRoot).isEmpty)
        try FileManager.default.moveItem(at: progressFinal, to: progressPart)
        done[progressIndex] = 2; try writeProgressMap()
        try expect("invalid resume bits do not report downloaded bytes", SlotpackDownload.resumeModelBytes(at: progressRoot).isEmpty)
        let impossibleSize = WeightStore.freeDiskBytes(near: temp) + 4_000_000_000
        let largeFile = PinnedModel.File(path: "impossible.bin", size: impossibleSize, sha256: digest)
        var objects = [SlotpackManifest.Object]()
        var offset: Int64 = 0
        while offset < impossibleSize {
            let size = Int(min(Int64(SLOTPACK_MAX_RAW), impossibleSize-offset))
            objects.append(.init(sha256: object.sha256, size: 32, rawSize: size, rawSHA256: digest, ranges: [.init(file:0,offset:offset,length:size)])); offset += Int64(size)
        }
        let large = SlotpackManifest(format: "slotpack-v1", files: [largeFile], objects: objects)
        var diskRejected = false
        do { try SlotpackDownload(manifest: large, digest: hash, dest: temp, bases: [], rawBases: [], connections: 1, cancellation: .init(), log: { _ in }).run() }
        catch { diskRejected = String(describing: error).contains("not enough disk") }
        try expect("disk space checked before creating large parts", diskRejected && !FileManager.default.fileExists(atPath: temp.appendingPathComponent("impossible.bin.slotpack.part").path))
        print(String(data: try JSONSerialization.data(withJSONObject: ["pass":true,"checks":checks], options: [.prettyPrinted,.sortedKeys]), encoding:.utf8)!)
    }
}
