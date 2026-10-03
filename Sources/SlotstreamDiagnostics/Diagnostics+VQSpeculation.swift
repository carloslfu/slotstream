import CryptoKit
import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func quantizationSpeculation(source: URL, inventory: URL, baseline: URL,
        composite: URL, profile: URL, output: URL) throws -> Data {
        guard !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("candidate generation requires a new output and no ambient overrides") }
        let fd = open(profile.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open frozen generation profile") }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? handle.close() }
        var info = stat()
        guard fstat(fd, &info) == 0, info.st_mode & S_IFMT == S_IFREG, info.st_size == 2023,
              let profileData = try handle.read(upToCount: 2024), profileData.count == 2023 else {
            throw ModelError("candidate generation profile has an invalid extent")
        }
        let profileSHA = SHA256.hash(data: profileData).map { String(format: "%02x", $0) }.joined()
        guard profileSHA == "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c",
              let object = try JSONSerialization.jsonObject(with: profileData) as? [String: Any],
              let prompt = object["prompt"] as? [Int] else { throw ModelError("candidate generation needs its frozen token profile") }
        try ModelProcessGuard.acquire()
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("candidate generation requires 13 GB real reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 9_000_000_000)
        defer {
            Stream.gpu.synchronize(); MLX.Memory.clearCache()
            MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit
        }
        let checkpoint = try VQCheckpoint(directory: source, inventory: inventory,
            denseOverlayBaseline: baseline, denseOverlayManifest: composite)
        let model = VQModelProbe(checkpoint, verificationArithmetic: true)
        try model.enableResidentText()
        try model.enableResidentRecords(wide: true, parallelReads: true)
        try model.enableOriginalDraft(baseline: baseline)
        let empty = try model.snapshot()
        var c = CheckBuilder("quantization-generation")
        var observations: [[String: Any]] = []
        var totalAccepted = 0
        func hashes() -> [String: String] {
            model.diagnosticTensors().mapValues { value in
                eval(value)
                let sha = SHA256.hash(data: value.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined()
                return "\(value.dtype):\(value.shape):\(sha)"
            }
        }
        func exact(_ name: String, _ lhs: [String: String], _ rhs: [String: String]) {
            c.equal(name + " fields", Set(lhs.keys), Set(rhs.keys))
            for key in lhs.keys.sorted() { c.equal(name + " " + key, lhs[key], rhs[key]) }
        }
        func run(_ name: String, _ params: SampleParams, _ depth: Int,
                 eos: Set<Int> = [248044], stopAfter: Int? = nil) throws -> (VQGenerationProbe.Result, [String: String]) {
            try model.restore(empty)
            var callbacks: [Int] = []
            let result = try VQGenerationProbe.generate(model: model, prompt: prompt, params: params,
                draftDepth: depth, eosIDs: eos, onToken: { token in
                    callbacks.append(token)
                    return stopAfter.map { callbacks.count < $0 } ?? true
                })
            c.equal(name + " callbacks match returned tokens", callbacks, result.tokens)
            c.expect(name + " leaves a committed aligned boundary", model.hasCommittedBoundary)
            let state = hashes()
            totalAccepted += result.accepted
            observations.append(["name": name, "tokens": result.tokens, "consumed": result.consumedTokens,
                "reason": result.reason, "drafted": result.drafted, "accepted": result.accepted,
                "rng_state": String(result.rngState), "state": state])
            return (result, state)
        }
        func compare(_ name: String, _ a: (VQGenerationProbe.Result, [String: String]),
                     _ b: (VQGenerationProbe.Result, [String: String])) {
            c.equal(name + " token stream", a.0.tokens, b.0.tokens)
            c.equal(name + " consumed boundary", a.0.consumedTokens, b.0.consumedTokens)
            c.equal(name + " finish reason", a.0.reason, b.0.reason)
            c.equal(name + " sampler stream", a.0.rngState, b.0.rngState)
            exact(name + " logical state", a.1, b.1)
        }
        func receipt(_ failure: String? = nil) throws -> Data {
            let report = try JSONSerialization.jsonObject(with: JSONEncoder().encode(c.report()))
            var object: [String: Any] = ["schema": 1, "qualification": "unproven",
                "scope": "bounded candidate target-verified generation and state recovery, not quality or speed qualification",
                "arithmetic": "vq-reference-with-row-invariant-verification-v1",
                "inventory_sha256": checkpoint.inventorySHA256, "composite_sha256": checkpoint.compositeSHA256 ?? "",
                "profile_sha256": profileSHA, "draft_sha256": VQDraftWeights.fileSHA256,
                "observations": observations, "report": report, "accepted_drafts": totalAccepted,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(), "process_bound_bytes": model.processByteLimit]
            object["failure"] = failure
            let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        do {
            try withError {
                var greedy = SampleParams.greedy; greedy.maxTokens = 16; greedy.seed = 42
                let plain = try run("greedy-plain", greedy, 0)
                guard plain.0.tokens.count == greedy.maxTokens else {
                    throw ModelError("frozen generation ended before the complete comparison")
                }
                for depth in [1, 2, 4] {
                    let speculative = try run("greedy-depth-\(depth)", greedy, depth)
                    compare("greedy depth \(depth)", plain, speculative)
                    c.expect("greedy depth \(depth) proposes tokens", speculative.0.drafted > 0)
                }
                var sampled = SampleParams.instruct
                sampled.maxTokens = 12; sampled.seed = 42; sampled.minP = 0.02
                let sampledPlain = try run("sampled-plain", sampled, 0)
                for depth in [2, 4] {
                    compare("sampled depth \(depth)", sampledPlain, try run("sampled-depth-\(depth)", sampled, depth))
                }
                for stop in [1, 5] {
                    compare("callback stop \(stop)", try run("stop-\(stop)-plain", greedy, 0, stopAfter: stop),
                        try run("stop-\(stop)-draft", greedy, 2, stopAfter: stop))
                }
                for (name, eos) in [("first", Set([plain.0.tokens[0]])),
                                    ("later", Set([plain.0.tokens[min(7, plain.0.tokens.count - 1)]]))] {
                    compare("EOS " + name, try run("eos-" + name + "-plain", greedy, 0, eos: eos),
                        try run("eos-" + name + "-draft", greedy, 2, eos: eos))
                }
                c.expect("real draft acceptance path exercised", totalAccepted > 0)
                try model.restore(empty)
                try model.forward(prompt, observe: { _, _, _ in }, inspectState: false)
                let base = try model.snapshot(), before = hashes()
                var checks = 0
                do {
                    _ = try model.proposeDraft(pending: plain.0.tokens[0], count: 4, shouldContinue: {
                        checks += 1; return checks <= 2
                    })
                    throw ModelError("draft cancellation was not reached")
                } catch CheckpointReadError.cancelled {}
                c.expect("partial draft is not reusable", !model.hasCommittedBoundary)
                try model.restore(base)
                exact("cancelled draft restores every target and head tensor", before, hashes())
                let proposals = try model.proposeDraft(pending: plain.0.tokens[0], count: 2)
                do { _ = try model.snapshot(); c.expect("provisional draft snapshot refused", false) }
                catch { c.expect("provisional draft snapshot refused", true) }
                try model.beginRecording()
                struct Injected: Error {}
                do {
                    try model.forward([plain.0.tokens[0]] + proposals, observe: { layer, name, _ in
                        if layer == 17, name == "hidden" { throw Injected() }
                    })
                    throw ModelError("target verification failure was not reached")
                } catch is Injected {}
                try model.restore(base)
                exact("failed verification restores target and provisional head", before, hashes())
                c.equal("all expert pins released", model.recordCacheStats?["pinned_records"], 0)
                c.expect("complete campaign fits process envelope", ProcessMemory.peakResidentBytes() <= model.processByteLimit)
            }
            let data = try receipt()
            guard c.report().passed else { throw ModelError("candidate speculative generation parity failed") }
            return data
        } catch {
            _ = try receipt(String(describing: error))
            throw error
        }
    }
}
