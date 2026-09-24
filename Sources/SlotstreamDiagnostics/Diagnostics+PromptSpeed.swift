import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Loaded-engine paired experiment: two untimed warmups followed by five
    /// alternating pairs. Paging excludes a timing pair, never its functional
    /// result. No deployment setting is changed by this diagnostic.
    public static func promptSpeedScopes(modelDir: URL) async throws -> CheckReport {
        let engine = try await Engine(modelDir: modelDir, poolSlots: Geometry.floorSlots)
        engine.prefixCache.enabled = false
        engine.generator.prefillChunk = 256
        engine.generator.prefillCacheLimit = 128 << 20
        engine.generator.footprintSampling = true
        let text = (1 ... 999).map {
            "Crate \($0) holds \($0 * 3) bolts, ships on day \($0 % 7 + 1), and belongs to warehouse \($0 % 19 + 1). Check the inventory counts carefully."
        }.joined(separator: "\n")
        let ids = Array(engine.tokenizer.encode(text: text, addSpecialTokens: false).prefix(8195))
        var options = InferenceOptimizations.integrationCandidate
        options.automaticReadScope = false; options.layerExpertWorkspace = true
        options.boundedIndexer = true; options.boundedPLE = true
        options.compactScopeFrontier = true; options.workspaceTokenTile = 1024
        var params = SampleParams.greedy; params.maxTokens = 1
        var c = CheckBuilder("prompt-speed-scopes")
        var ratios: [Double] = []
        for round in -1 ..< 5 {
            var rows: [Int: (Engine.GenerationResult, Bool)] = [:]
            for scope in (round % 2 == 0 ? [4096, 8192] : [8192, 4096]) {
                guard (Planner.deviceAvailableGB() ?? 0) >= 7 else { throw ModelError("insufficient headroom for scope comparison") }
                options.readScopeTokens = scope; engine.model.optimizations = options
                MLX.Memory.clearCache()
                let before = ProcessMemory.vmActivity()
                let result = engine.generate(promptIds: ids, params: params)
                let after = ProcessMemory.vmActivity()
                if let error = result.stats.runtimeError { throw ModelError(error) }
                let clean = before != nil && after != nil && before!.swapins == after!.swapins && before!.swapouts == after!.swapouts
                rows[scope] = (result, clean)
                guard round >= 0 else { continue }
                let label = "round\(round).scope\(scope)"
                c.equal("\(label): whole prompt computed", result.stats.prefillTokens, 8195)
                c.expect("\(label): process stays within 10 GB", result.stats.peakMemoryGB <= 10)
                c.measure("\(label).prefill_seconds", result.stats.prefillSeconds)
                c.measure("\(label).read_bytes", Double(result.stats.prefillReadBytes))
                c.measure("\(label).peak_gb", result.stats.peakMemoryGB)
                c.measure("\(label).clean", clean ? 1 : 0)
                c.measure("\(label).swapins", Double((after?.swapins ?? 0) - (before?.swapins ?? 0)))
                c.measure("\(label).swapouts", Double((after?.swapouts ?? 0) - (before?.swapouts ?? 0)))
                FileHandle.standardError.write(Data("scope pair \(round), \(scope): \(result.stats.prefillSeconds)s, clean=\(clean)\n".utf8))
            }
            guard round >= 0, let a = rows[4096], let b = rows[8192] else { continue }
            c.equal("pair \(round): identical output", a.0.ids, b.0.ids)
            c.equal("pair \(round): identical compute shapes", a.0.stats.prefillComputePasses, b.0.stats.prefillComputePasses)
            c.expect("pair \(round): fewer expert bytes read", b.0.stats.prefillReadBytes < a.0.stats.prefillReadBytes)
            if a.1 && b.1 { ratios.append(a.0.stats.prefillSeconds / b.0.stats.prefillSeconds) }
        }
        let sorted = ratios.sorted()
        let median = sorted.isEmpty ? 0 : (sorted[(sorted.count - 1) / 2] + sorted[sorted.count / 2]) / 2
        c.measure("valid_pairs", Double(sorted.count)); c.measure("median_speedup", median)
        c.expect("at least three clean paired rounds", sorted.count >= 3)
        c.expect("at least five percent faster in eligible pairs", median >= 1.05)
        return c.report()
    }

    /// A complete-prompt hit must not hide a skipped interior checkpoint.
    /// Exercise both schedulers, then compare an extended prompt with a cold
    /// read at the raw-logit boundary. Uses one floor-sized model process.
    public static func promptSpeedCheckpoint(modelDir: URL, fused: Bool = false) throws -> CheckReport {
        try promptSpeedCheckpoint(modelDir: modelDir, fused: fused, followup: false)
    }

    package static func promptSpeedCheckpoint(modelDir: URL, fused: Bool, followup: Bool) throws -> CheckReport {
        var baseOptions = InferenceOptimizations.integrationCandidate
        if followup { baseOptions = try InferenceOptimizations.environment() }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: Geometry.floorSlots)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        generator.readScopeFootprintLimitBytes = 10_000_000_000
        let ids = (0 ..< 2051).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy; params.maxTokens = 1
        var c = CheckBuilder("prompt-speed-checkpoint")
        var logits: [Float] = []
        generator.promptLogitsObserver = { logits = $0 }
        func run(_ prompt: [Int], cache: PrefixCache?, persists: Bool = true) throws -> ([Int], GenStats, [Float]) {
            logits = []
            let request = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0), slackBytes: 3_000_000_000)
            request.persistsPrefixState = persists
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache, request: request)
            if let error = result.1.runtimeError { throw ModelError(error) }
            return (result.0, result.1, logits)
        }
        for explicit in [false, true] {
            var options = baseOptions
            options.fusedPrefillAttention = fused ? true : nil
            options.completePromptCheckpoint = false
            if explicit {
                options.automaticReadScope = false
                options.layerExpertWorkspace = true; options.readScopeTokens = 4096
                options.boundedIndexer = true; options.boundedPLE = true
                options.compactScopeFrontier = true; options.workspaceTokenTile = 1024
            }
            model.optimizations = options
            let label = explicit ? "explicit" : "automatic"
            let cache = PrefixCache(maxTokens: 16384)
            let first = try run(Array(ids.prefix(2048)), cache: cache)
            c.equal("\(label): the deepest interior checkpoint is saved", first.1.prefixCheckpointStores, 1)
            c.expect("\(label): read sharing actually ran", first.1.prefillPasses.contains { $0 >= 1024 })
            c.equal("\(label): unchanged chronological compute", first.1.prefillComputePasses, Array(repeating: 256, count: 8))
            let warm = try run(ids, cache: cache)
            c.equal("\(label): next request resumes the selected checkpoint", warm.1.reusedPrefixTokens, 1792)
            cache.drop()
            let cold = try run(ids, cache: nil)
            c.equal("\(label): cached and cold output ids", warm.0, cold.0)
            c.expect("\(label): cached and cold logits are bit exact", !warm.2.isEmpty && warm.2.map(\.bitPattern) == cold.2.map(\.bitPattern))
            c.measure("\(label).warm_prefill_tokens", Double(warm.1.prefillTokens))
            c.measure("\(label).cold_prefill_tokens", Double(cold.1.prefillTokens))
            c.measure("\(label).warm_prefill_seconds", warm.1.prefillSeconds)
            c.measure("\(label).cold_prefill_seconds", cold.1.prefillSeconds)
        }
        // Persist a boundary shared by 256- and 512-token schedules. A token
        // match alone cannot certify that both schedules produced these bits.
        var options = baseOptions
        options.fusedPrefillAttention = fused ? true : nil
        options.completePromptCheckpoint = false
        model.optimizations = options
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("slotstream-pass-provenance-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let persistedOptions = model.optimizations
        let identity = try PersistentPrefixIdentity.make(model: model, modelDirectory: modelDir)
        let configuration = PersistentPrefixConfiguration(directory: directory, minimumTokens: 256)
        let diskIDs = (0 ..< 2307).map { 1000 + (($0 * 7919) % 200_000) }
        let cache = PrefixCache(maxTokens: 16384)
        cache.attachPersistent(try PersistentPrefixCache(configuration: configuration, identity: identity))
        let saved = try run(Array(diskIDs.prefix(2304)), cache: cache)
        c.equal("disk: saves deepest aligned checkpoint", saved.1.persistentPrefix?.savedTokens, 2048)
        cache.drop(); cache.attachPersistent(nil)
        cache.attachPersistent(try PersistentPrefixCache(configuration: configuration, identity: identity))
        c.equal("disk: reopened head retains producing pass size", cache.persistent?.indexedEntries.first?.prefillChunk, 256)
        generator.prefillChunk = 512
        let changed = try run(diskIDs, cache: cache, persists: false)
        c.equal("disk: changed pass arithmetic is not restored", changed.1.reusedPrefixTokens, 0)
        cache.drop(); generator.prefillChunk = 256
        let restored = try run(diskIDs, cache: cache, persists: false)
        c.equal("disk: matching arithmetic restores after reopen", restored.1.persistentPrefix?.restoredTokens, 2048)
        cache.drop()
        let cold = try run(diskIDs, cache: nil)
        c.equal("disk: restored output ids equal cold", restored.0, cold.0)
        c.expect("disk: restored logits are bit exact", !restored.2.isEmpty && restored.2.map(\.bitPattern) == cold.2.map(\.bitPattern))
        model.optimizations = baseOptions
        model.optimizations.fusedPrefillAttention = fused ? true : nil
        generator.footprintSampling = true
        let largeIDs = (0 ..< 8195).map { 1000 + (($0 * 7919) % 200_000) }
        let large = try run(largeIDs, cache: nil)
        c.equal("automatic: guarded request selects the qualified larger scope", large.1.prefillPasses.first, 8192)
        c.equal("automatic: compute shapes stay chronological", large.1.prefillComputePasses,
            Array(repeating: 256, count: 32) + [3])
        c.expect("automatic: physical peak stays within 10 GB", large.1.peakMemoryGB <= 10)
        c.measure("automatic.large_scope_peak_gb", large.1.peakMemoryGB)
        if fused {
            c.expect("upstream fused prefill actually executed", model.fusedPrefillAttentionTiles > 0)
            c.measure("fused_prefill_tiles", Double(model.fusedPrefillAttentionTiles))
            var fallbackOptions = persistedOptions; fallbackOptions.fusedPrefillAttention = nil
            model.optimizations = fallbackOptions
            let fallbackIdentity = try PersistentPrefixIdentity.make(model: model, modelDirectory: modelDir)
            c.expect("different attention settings separate persisted arithmetic", fallbackIdentity.digest != identity.digest)
            model.optimizations = persistedOptions
            let equalIdentity = try PersistentPrefixIdentity.make(model: model, modelDirectory: modelDir)
            c.equal("identical saved controls reproduce cache identity", equalIdentity.digest, identity.digest)
            c.equal("effective backend identity remains stable", equalIdentity.components["attention_backend"], identity.components["attention_backend"])
        }
        return c.report()
    }
}
