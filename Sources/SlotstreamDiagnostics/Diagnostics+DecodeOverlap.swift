import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Direct demand reads leave generation exact: the same
    /// ids with staged and direct reads, with and without the draft head, on a cold
    /// floor-sized pool where decode misses at every layer. Then the failure
    /// paths of the direct reads, at the pool and request levels. The
    /// experimental demand-read threads get the same treatment: the same ids,
    /// and the same recovery from a failed read on both read paths. Each part
    /// loads and releases its own model, so only one is resident at a time.
    public static func decodeOverlap(modelDir: URL, tokens: Int = 24) throws -> [CheckReport] {
        let generation = try decodeOverlapGeneration(modelDir: modelDir, tokens: tokens)
        MLX.Memory.clearCache()
        let head = MTPWeights.present(modelDir: modelDir)
        return [
            generation,
            try optimizationReadRecovery(modelDir: modelDir, directReads: true),
            try optimizationRequestReadRecovery(modelDir: modelDir, mtp: false, directReads: true),
            try optimizationReadRecovery(modelDir: modelDir, demandThreads: true),
            try optimizationReadRecovery(modelDir: modelDir, directReads: true, demandThreads: true),
            try optimizationRequestReadRecovery(modelDir: modelDir, mtp: false, directReads: true, demandThreads: true),
        ] + (head ? [try optimizationRequestReadRecovery(modelDir: modelDir, mtp: true, directReads: true)] : [])
    }

    static func decodeOverlapGeneration(modelDir: URL, tokens: Int) throws -> CheckReport {
        var c = CheckBuilder("decode-overlap")
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: Geometry.floorSlots)
        let head = MTPWeights.present(modelDir: modelDir)
        if head { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        var params = SampleParams.greedy
        params.maxTokens = tokens
        let prompt = (0 ..< 40).map { 1000 + (($0 * 7919) % 200_000) }
        func cold() {
            // Shrinking starts a pool cold; growing back keeps it empty.
            model.pool.unpinAll()
            model.pool.resize(to: Geometry.floorSlots - 1)
            model.pool.resize(to: Geometry.floorSlots)
        }
        for speculative in head ? [false, true] : [false] {
            let mode = speculative ? "speculative" : "plain"
            generator.speculationEnabled = speculative
            var staged = InferenceOptimizations.deploymentCandidate()
            staged.directDemandReads = nil
            var direct = staged
            direct.directDemandReads = true
            model.optimizations = staged
            cold()
            let a = generator.generate(promptIds: prompt, params: params, eosIds: [])
            model.optimizations = direct
            cold()
            let b = generator.generate(promptIds: prompt, params: params, eosIds: [])
            c.expect("\(mode): every run succeeds",
                a.1.runtimeError == nil && b.1.runtimeError == nil)
            c.equal("\(mode): staged run generated every token", a.0.count, tokens)
            c.equal("\(mode): direct reads leave the ids unchanged", b.0, a.0)
            c.expect("\(mode): the staged run scattered its misses",
                a.1.decodeSlotScatterBatches > 0 && (a.1.decodeSlotDirectBatches ?? 0) == 0)
            c.expect("\(mode): the direct run read its misses in place",
                (b.1.decodeSlotDirectBatches ?? 0) > 0 && b.1.decodeSlotScatterBatches == 0)
            c.equal("\(mode): both runs read the same records", b.1.decodeRecords, a.1.decodeRecords)
            if speculative {
                c.expect("\(mode): the draft head verified", b.1.verifyPasses > 0)
            }
            // The experimental read threads change how many reads wait on the
            // disk at once, never which records are read or where they land.
            var threaded = direct
            threaded.demandReadThreads = true
            model.optimizations = threaded
            cold()
            let t = generator.generate(promptIds: prompt, params: params, eosIds: [])
            c.expect("\(mode): the read-thread run succeeds", t.1.runtimeError == nil)
            c.equal("\(mode): demand read threads leave the ids unchanged", t.0, b.0)
            c.equal("\(mode): demand read threads read the same records", t.1.decodeRecords, b.1.decodeRecords)
            c.expect("\(mode): the read-thread run read its misses in place",
                (t.1.decodeSlotDirectBatches ?? 0) > 0 && t.1.decodeSlotScatterBatches == 0)
        }
        return c.report()
    }
}
