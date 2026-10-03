import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Bounded recovery and recording checks against an ordinary target pass.
    /// This checks state arithmetic and ownership, not draft acceptance or speed.
    public static func quantizationState(source: URL, inventory: URL, output: URL,
        denseOverlayBaseline: URL?, denseOverlayManifest: URL?, sparseBoundary: Bool = false) throws -> Data {
        guard (denseOverlayBaseline == nil) == (denseOverlayManifest == nil),
              !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("VQ state checks require a new output, paired overlay arguments and no ambient overrides") }
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("VQ state checks require 13 GB real reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 9_000_000_000)
        defer {
            Stream.gpu.synchronize(); MLX.Memory.clearCache()
            MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit
        }
        let checkpoint = try VQCheckpoint(directory: source, inventory: inventory,
            denseOverlayBaseline: denseOverlayBaseline, denseOverlayManifest: denseOverlayManifest)
        let model = VQModelProbe(checkpoint, verificationArithmetic: true)
        try model.enableResidentText()
        try model.enableResidentRecords(wide: true, parallelReads: true)
        // The sparse fixture crosses the indexer's 2048-token dense threshold
        // and a complete compressed-key block inside the recorded pass.
        let prompt = sparseBoundary
            ? (0..<2048).map { 100 + ($0 * 17 % 1000) }
            : [100, 101, 248044, 102, 103, 104, 105, 106]
        let tokens = [107, 108, 109, 110, 111]
        var c = CheckBuilder("quantization-state-recovery")
        var observations: [String: [String: String]] = [:]
        func hashes(_ tensors: [String: MLXArray]) -> [String: String] {
            var result: [String: String] = [:]
            for (name, value) in tensors {
                eval(value)
                let raw = value.asData(access: .copy).data
                let digest = SHA256.hash(data: raw).map { String(format: "%02x", $0) }.joined()
                result[name] = "\(value.dtype):\(value.shape):\(digest)"
            }
            return result
        }
        func capture(_ name: String, result: VQModelProbe.Output? = nil) -> [String: String] {
            var tensors = model.diagnosticTensors()
            if let result { tensors["logits"] = result.logits; tensors["multi"] = result.multi }
            let value = hashes(tensors); observations[name] = value; return value
        }
        func exact(_ name: String, _ a: [String: String], _ b: [String: String]) {
            c.equal(name + " fields", Set(a.keys), Set(b.keys))
            for key in a.keys.sorted() { c.equal(name + " " + key, a[key], b[key]) }
        }
        func rejected(_ name: String, _ operation: () throws -> Void) {
            let prior = hashes(model.diagnosticTensors())
            do { try operation(); c.expect(name, false) }
            catch { c.expect(name, true) }
            exact(name + " does not mutate state", prior, hashes(model.diagnosticTensors()))
        }
        func receipt(_ failure: String? = nil) throws -> Data {
            let encoder = JSONEncoder()
            var value: [String: Any] = ["schema": 1, "qualification": "unproven",
                "scope": "bounded candidate recording, exact recovery and rejected checkpoint ownership",
                "arithmetic": "vq-reference-with-row-invariant-verification-v1",
                "sparse_boundary": sparseBoundary,
                "inventory_sha256": checkpoint.inventorySHA256, "prompt": prompt, "verification_tokens": tokens,
                "report": try JSONSerialization.jsonObject(with: encoder.encode(c.report())),
                "observations": observations, "peak_process_bytes": ProcessMemory.peakResidentBytes(),
                "process_bound_bytes": model.processByteLimit, "minimum_headroom_bytes": 3_000_000_000,
                "record_cache": model.recordCacheStats ?? [:], "resident_text": model.residentTextStats ?? [:]]
            value["composite_sha256"] = checkpoint.compositeSHA256
            value["failure"] = failure
            let data = try JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        do {
            try withError {
                let empty = try model.snapshot()
                for start in stride(from: 0, to: prompt.count, by: 512) {
                    try model.forward(Array(prompt[start..<min(start + 512, prompt.count)]),
                                      observe: { _, _, _ in }, inspectState: false)
                }
                let base = try model.snapshot(), baseBits = capture("base")
                rejected("foreign snapshot refused") { try model.restore(VQModelProbe(checkpoint).snapshot()) }
                rejected("invalid token refused") { try model.forward([-1], observe: { _, _, _ in }) }
                rejected("early cancellation refused") {
                    try model.forward([107], observe: { _, _, _ in }, shouldContinue: { false })
                }
                let plain = try model.forward(tokens, observe: { _, _, _ in }, inspectState: false)
                let expected = capture("ordinary-full-pass", result: plain)
                let future = try model.snapshot()
                try model.restore(base)
                exact("restore after full pass", baseBits, capture("restored-base"))
                rejected("discarded future refused") { try model.restore(future) }
                try model.beginRecording()
                rejected("oversized recording refused") {
                    try model.forward(tokens + [112], observe: { _, _, _ in }, inspectState: false)
                }
                let recorded = try model.forward(tokens, observe: { _, _, _ in }, inspectState: false)
                exact("recording leaves full pass unchanged", expected, capture("recorded-full-pass", result: recorded))
                rejected("completed recording cannot be overwritten") {
                    try model.forward([112], observe: { _, _, _ in }, inspectState: false)
                }
                rejected("wrong rollback tokens refused") {
                    try model.rollbackRecorded(keeping: 2, of: [1, 2, 3, 4, 5], from: base)
                }
                rejected("empty rollback refused") { try model.rollbackRecorded(keeping: 0, of: tokens, from: base) }
                try model.rollbackRecorded(keeping: tokens.count, of: tokens, from: base)
                exact("keep-all recording", expected.filter { $0.key != "logits" && $0.key != "multi" }, capture("keep-all"))
                for keep in 1..<tokens.count {
                    try model.restore(base)
                    try model.forward(Array(tokens.prefix(keep)), observe: { _, _, _ in }, inspectState: false)
                    let direct = capture("direct-prefix-\(keep)")
                    let directNext = try model.forward([112], observe: { _, _, _ in }, inspectState: false)
                    let continued = capture("direct-next-\(keep)", result: directNext)
                    try model.restore(base); try model.beginRecording()
                    try model.forward(tokens, observe: { _, _, _ in }, inspectState: false)
                    try model.rollbackRecorded(keeping: keep, of: tokens, from: base)
                    exact("recorded prefix \(keep)", direct, capture("rollback-prefix-\(keep)"))
                    let next = try model.forward([112], observe: { _, _, _ in }, inspectState: false)
                    exact("rollback continuation \(keep)", continued, capture("rollback-next-\(keep)", result: next))
                }
                for layer in [0, 17, 47, 48] {
                    try model.restore(base)
                    struct Injected: Error {}
                    do {
                        try model.forward(tokens, observe: { seen, name, _ in
                            if seen == layer, name == (layer == 48 ? "logits" : "hidden") { throw Injected() }
                        })
                        throw ModelError("VQ injected failure was not reached")
                    } catch is Injected {}
                    c.expect("partial failure invalidates boundary \(layer)", !model.hasCommittedBoundary)
                    rejected("partial state cannot advance \(layer)") { try model.forward([112], observe: { _, _, _ in }) }
                    try model.restore(base)
                    exact("partial failure restores all state \(layer)", baseBits, capture("restored-failure-\(layer)"))
                    let retried = try model.forward(tokens, observe: { _, _, _ in }, inspectState: false)
                    exact("retry after partial failure \(layer)", expected, capture("retry-\(layer)", result: retried))
                }
                // Exercise cancellation at actual layer/commit checks rather
                // than only an observer throwing before the guard is reached.
                for layer in [0, 17, 47, 48] {
                    try model.restore(base)
                    var continuePass = true
                    do {
                        try model.forward(tokens, observe: { seen, name, _ in
                            if seen == layer, name == (layer == 48 ? "logits" : "hidden") {
                                continuePass = false
                            }
                        }, shouldContinue: { continuePass })
                        throw ModelError("VQ cancellation was not reached")
                    } catch CheckpointReadError.cancelled {}
                    c.expect("cancellation invalidates partial boundary \(layer)", !model.hasCommittedBoundary)
                    rejected("cancelled state cannot advance \(layer)") { try model.forward([112], observe: { _, _, _ in }) }
                    try model.restore(base)
                    exact("cancelled pass restores all state \(layer)", baseBits, capture("restored-cancel-\(layer)"))
                    let retried = try model.forward(tokens, observe: { _, _, _ in }, inspectState: false)
                    exact("retry after cancellation \(layer)", expected, capture("retry-cancel-\(layer)", result: retried))
                }
                try model.restore(empty)
                rejected("old branch stays invalid after rewind") { try model.restore(base) }
                c.equal("empty checkpoint consumes no tokens", model.consumedTokens, 0)
                c.equal("all record pins released", model.recordCacheStats?["pinned_records"], 0)
                c.expect("process fits declared bound", ProcessMemory.peakResidentBytes() <= model.processByteLimit)
            }
            let result = try receipt()
            guard c.report().passed else { throw ModelError("VQ state recovery or recording parity failed") }
            return result
        } catch {
            _ = try receipt(String(describing: error))
            throw error
        }
    }
}
