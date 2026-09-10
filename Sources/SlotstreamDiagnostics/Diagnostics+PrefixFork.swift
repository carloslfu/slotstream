import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPrefixFork(modelDir: URL, tokens: Int, mtp: Bool) throws -> CheckReport {
        guard [255, 256, 1023, 1024, 2051].contains(tokens) else {
            throw ModelError("prefix fork tokens must be 255, 256, 1023, 1024 or 2051")
        }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.skipUnusedFinalForward = true
        options.incrementalIndexer = true; options.compactIndexerRaw = true
        model.optimizations = options
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var c = CheckBuilder("optimization-prefix-fork\(mtp ? "-mtp" : "")")
        let prefix = (0 ..< tokens).map { 1000 + ($0 * 7919) % 200_000 }
        let suffixes = [Array(repeating: 907, count: 17),
            (0 ..< 259).map { 1100 + ($0 * 107) % 200_000 }, [8, 19, 907, 997, 1123]]
        func hash(_ array: MLXArray) -> String {
            let bytes = array.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
            return SHA256.hash(data: Data(bytes)).map { String(format: "%02x", $0) }.joined()
        }
        // Only digests survive comparisons. Holding diagnostic MLX views
        // across writes could itself force COW and conceal an ownership bug.
        func snapshot(_ state: Qwen4ExpModel.State) -> [String: String] {
            var result: [String: String] = [:]
            for (name, array) in state.prefixForkDiagnosticTensors() {
                result[name] = "\(array.dtype):\(array.shape):\(hash(array))"
            }
            return result
        }
        func exact(_ name: String, _ state: Qwen4ExpModel.State, _ expected: [String: String]) {
            let actual = snapshot(state)
            c.equal("\(name): fields", Set(actual.keys), Set(expected.keys))
            for key in expected.keys.sorted() { c.equal("\(name): \(key)", actual[key], expected[key]) }
        }
        // Stop immediately after completed prefill. This obtains exact main
        // and MTP states at the requested token boundary without consuming a
        // sampled token or reconstructing an offset from returned output.
        func consume(_ state: Qwen4ExpModel.State?, base: [Int], suffix: [Int]) throws -> Qwen4ExpModel.State {
            let cache = PrefixCache(maxTokens: 8192)
            if let state { cache.store(state: state, tokens: base) }
            var keepGoing = true
            generator.onPrefillProgress = { done, total, _ in if done == total && done > 0 { keepGoing = false } }
            defer { generator.onPrefillProgress = nil }
            var params = SampleParams.greedy; params.maxTokens = 1; params.seed = 7
            let prompt = base + suffix
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                shouldContinue: { keepGoing })
            guard result.1.runtimeError == nil,
                  let held = cache.take(matching: prompt + [155], reserveTokens: prompt.count + 1) else {
                throw ModelError("prefix fork fixture could not retain its completed prefill")
            }
            c.expect("prefill cancellation emits no token", result.0.isEmpty)
            c.equal("exact committed boundary", held.state.tokenCount, prompt.count)
            c.equal("explicit reused boundary", result.1.reusedPrefixTokens, state == nil ? 0 : base.count)
            if mtp { c.expect("draft remains aligned at committed prefix", held.state.hasValidMTP) }
            guard ProcessMemory.residentBytes() < 10_000_000_000 else { throw ModelError("prefix fork correctness probe exceeded 10 GB") }
            return held.state
        }
        let root = try consume(nil, base: [], suffix: prefix)
        let initial = snapshot(root)
        root.setRecording(true)
        do { _ = try root.forkForPrefix(); c.expect("recording fork rejected", false) }
        catch { c.expect("recording fork rejected", true) }
        root.setRecording(false)
        let a = try root.forkForPrefix(), b = try root.forkForPrefix()
        c.expect("independent state objects", a !== root && b !== root && a !== b)
        c.equal("A charges full sequence capacity", a.allocatedSequenceBytes, root.allocatedSequenceBytes)
        c.equal("B charges full sequence capacity", b.allocatedSequenceBytes, root.allocatedSequenceBytes)
        exact("initial A", a, initial); exact("initial B", b, initial)
        var referenceStates: [[String: String]] = []
        var referenceLogits: [String] = []
        for suffix in suffixes {
            let fresh = try consume(nil, base: [], suffix: prefix)
            let advanced = try consume(fresh, base: prefix, suffix: suffix)
            referenceStates.append(snapshot(advanced))
            referenceLogits.append(hash(try model.lastLogitsChecked([155], state: advanced)))
        }
        _ = try consume(a, base: prefix, suffix: suffixes[0])
        exact("A diverges", a, referenceStates[0])
        exact("parent unchanged after A", root, initial)
        exact("B unchanged after A", b, initial)
        _ = try consume(b, base: prefix, suffix: suffixes[1])
        exact("B diverges and grows", b, referenceStates[1])
        exact("A survives overlapping B writes", a, referenceStates[0])
        exact("parent survives both branches", root, initial)
        _ = try consume(root, base: prefix, suffix: suffixes[2])
        exact("parent can diverge independently", root, referenceStates[2])
        exact("A survives parent writes", a, referenceStates[0])
        exact("B survives parent writes", b, referenceStates[1])
        for (i, state) in [a, b, root].enumerated() {
            let next = try state.forkForPrefix()
            c.equal("branch \(i): exact continued logits", hash(try model.lastLogitsChecked([155], state: next)), referenceLogits[i])
            exact("branch \(i): descendant leaves parent unchanged", state, referenceStates[i])
        }
        c.measure("tokens", Double(tokens))
        c.measure("sampled_end_physical_bytes", Double(ProcessMemory.residentBytes()))
        c.measure("root_sequence_bytes", Double(root.allocatedSequenceBytes))
        c.measure("a_sequence_bytes", Double(a.allocatedSequenceBytes))
        c.measure("b_sequence_bytes", Double(b.allocatedSequenceBytes))
        return c.report()
    }
}
