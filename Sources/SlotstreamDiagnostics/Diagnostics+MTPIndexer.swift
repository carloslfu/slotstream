import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// First enable the selector on an already cached speculative prefix, then
    /// disable/re-enable it. This also exercises cold JIT preparation before a
    /// request can advance its draft state. All arms use the same compute shapes.
    public static func optimizationMTPIndexer(modelDir: URL, rawCompact: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        let referenceCache = PrefixCache(maxTokens: 4096)
        let candidateCache = PrefixCache(maxTokens: 4096)
        var c = CheckBuilder(rawCompact ? "optimization-mtp-indexer-raw" : "optimization-mtp-indexer")
        var options = InferenceOptimizations()
        options.compactStateWindows = true
        options.compactMTPRow = true
        options.boundedIndexer = true
        options.boundedPLE = true
        var prompt = (0 ..< 2112).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy
        params.seed = 7
        params.maxTokens = 3
        var referenceRoutes: [Int: [Int32]] = [:], candidateRoutes: [Int: [Int32]] = [:]
        var referenceDraftRoutes: [[Int32]] = [], candidateDraftRoutes: [[Int32]] = []
        var candidate = false
        model.routerObserver = { layer, ids in
            if candidate { candidateRoutes[layer, default: []].append(contentsOf: ids) }
            else { referenceRoutes[layer, default: []].append(contentsOf: ids) }
        }
        model.mtpHead!.routerObserver = { ids in
            if candidate { candidateDraftRoutes.append(ids) }
            else { referenceDraftRoutes.append(ids) }
        }
        // The seed uses only the established selector, including in the head.
        // Enabling the new selector first happens on a genuine prefix-cache hit.
        let schedule: [Bool] = rawCompact ? [true, false, true, false] : [false, true, false, true]
        for (step, enabled) in schedule.enumerated() {
            referenceRoutes.removeAll(); candidateRoutes.removeAll()
            referenceDraftRoutes.removeAll(); candidateDraftRoutes.removeAll()
            candidate = false
            options.indexerBlockTopK = false
            options.compactIndexerRaw = false
            options.incrementalIndexer = false
            model.optimizations = options
            let (ri, rs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: referenceCache)
            let beforeMain = model.indexerSpecializedRows
            let beforeHead = model.mtpHead!.indexerSpecializedRows
            candidate = true
            options.indexerBlockTopK = !rawCompact && enabled
            options.compactIndexerRaw = rawCompact && enabled
            options.incrementalIndexer = rawCompact && enabled
            model.optimizations = options
            let (ci, cs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache)
            c.equal("step \(step): exact output IDs", ci, ri)
            c.equal("step \(step): output count", ci.count, 3)
            c.equal("step \(step): finish reason", cs.finishReason, rs.finishReason)
            c.equal("step \(step): ordered main routes", candidateRoutes, referenceRoutes)
            c.equal("step \(step): ordered draft routes", candidateDraftRoutes, referenceDraftRoutes)
            c.expect("step \(step): verification executes", rs.verifyPasses > 0 && cs.verifyPasses > 0)
            if step > 0 {
                c.expect("step \(step): both reuse cached prefixes", rs.reusedPrefixTokens > 0 && cs.reusedPrefixTokens > 0)
                c.equal("step \(step): same reused prefix", cs.reusedPrefixTokens, rs.reusedPrefixTokens)
            }
            let mainRows = model.indexerSpecializedRows - beforeMain
            let headRows = model.mtpHead!.indexerSpecializedRows - beforeHead
            c.expect("step \(step): main selector dispatch", enabled && !rawCompact ? mainRows > 0 : mainRows == 0)
            c.expect("step \(step): head selector dispatch", enabled && !rawCompact ? headRows > 0 : headRows == 0)
            c.measure("step_\(step)_main_specialized_rows", Double(mainRows))
            c.measure("step_\(step)_head_specialized_rows", Double(headRows))
            let next = prompt + ri + [907]
            guard let r = referenceCache.take(matching: next, reserveTokens: 32),
                  let g = candidateCache.take(matching: next, reserveTokens: 32) else {
                c.expect("step \(step): both states retained", false)
                return c.report()
            }
            c.expect("step \(step): both draft states aligned", r.state.hasValidMTP && g.state.hasValidMTP)
            c.equal("step \(step): consumed tokens", g.state.tokenCount, r.state.tokenCount)
            let rt = r.state.diagnosticTensors(), gt = g.state.diagnosticTensors()
            let bases = g.state.diagnosticIndexerBases()
            if rawCompact {
                c.expect("step \(step): compact main history survives option toggles", bases.values.allSatisfy { $0 > 0 })
                c.equal("step \(step): draft head retains arbitrary public rewind support", g.state.diagnosticDraftIndexerBase, 0)
                c.expect("step \(step): less allocated sequence storage including head", g.state.allocatedSequenceBytes < r.state.allocatedSequenceBytes)
            }
            c.equal("step \(step): fields", Set(gt.keys), Set(rt.keys))
            for key in rt.keys.sorted() {
                if let value = gt[key] {
                    let original = rt[key]!, base = bases[key] ?? 0
                    let expected = base > 0 ? original[0..., base ..< original.dim(1), 0...] : original
                    c.expect("step \(step): exact \(key)", expected.shape == value.shape
                        && expected.dtype == value.dtype && (expected .== value).all().item(Bool.self))
                }
            }
            referenceCache.store(state: r.state, tokens: Array(next.prefix(r.state.tokenCount)))
            candidateCache.store(state: g.state, tokens: Array(next.prefix(g.state.tokenCount)))
            prompt = next
        }
        return c.report()
    }
}
