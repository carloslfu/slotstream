import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Three chronological schedules, one model and one bounded pool. The
    /// 512-token control measures existing rechunking drift relative to 256;
    /// the bounded candidate uses up to 4096 tokens. These are numerical and
    /// state gates only, never performance or peak-memory observations.
    public static func optimizationPrefillFamily(modelDir: URL, tokens: Int, scoped: Bool = false, selectedAttention: Bool = false, terminalPrefill: Bool = false, terminalQuery: Bool = false, integratedBase: Bool = false) throws -> CheckReport {
        guard [1024, 2051, 4096, 8192].contains(tokens) else {
            throw ModelError("prefill family tokens must be 1024, 2051, 4096 or 8192")
        }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true
        options.compactMTPRow = true
        options.boundedIndexer = true
        options.boundedPLE = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        options.workspacePiecewiseWrites = model.optimizations.workspacePiecewiseWrites
        model.optimizations = options
        model.pool.admitOnSweep = false
        var c = CheckBuilder(terminalPrefill ? "optimization-terminal-prefill-family" : selectedAttention ? "optimization-selected-attention-family" : scoped ? "optimization-256-compute-read-scope" : "optimization-chronological-prefill-family")
        c.measure("workspace_token_tile", Double(options.workspaceTokenTile))
        c.measure("compact_scope_frontier", options.compactScopeFrontier ? 1 : 0)
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined scope base uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        let chunks = [256, 512, (selectedAttention || terminalPrefill) ? 256 : min(4096, tokens)]
        let states = chunks.map { _ in model.makeState() }
        var logits: [MLXArray] = []
        var traces: [[Int: [Int32]]] = []
        for (arm, chunk) in chunks.enumerated() {
            let rotationsBefore = model.fusedRoPERotationsScheduled
            var routes: [Int: [Int32]] = [:]
            let callerCacheLimit = MLX.Memory.cacheLimit
            var workspaceCacheObservations = 0
            var workspaceCacheEmpty = true
            model.routerObserver = { layer, ids in
                routes[layer, default: []].append(contentsOf: ids)
                if scoped && arm == 2 && model.optimizations.layerExpertWorkspace {
                    workspaceCacheObservations += 1
                    workspaceCacheEmpty = workspaceCacheEmpty && MLX.Memory.cacheLimit == 0
                        && MLX.Memory.cacheMemory == 0
                }
            }
            model.pool.resetStats()
            let pieceWrites = model.pool.workspacePieceWriteCompletions
            var last = MLXArray(Float(0))
            model.optimizations = options
            model.optimizations.selectedTextAttention = selectedAttention && arm == 2
            model.optimizations.terminalPrefillPruning = terminalPrefill && arm == 2
            model.optimizations.terminalLastQuery = terminalQuery && arm == 2
            if arm == 2 && scoped {
                var lo = 0
                while lo < tokens {
                    let passes = PrefillSchedule.scopePasses(remaining: tokens - lo, at: lo,
                        maxChunk: 256, maxScope: chunk, tailAware: false)
                    let hi = lo + passes.reduce(0, +)
                    model.optimizations.layerExpertWorkspace = passes.count > 1
                    if passes.count > 1 {
                        let result = model.consumeReadScope(Array(ids[lo ..< hi]), passes: passes,
                            state: states[arm], vision: [], head: nil, final: hi == tokens, shouldContinue: nil)
                        c.expect("scope through \(hi) commits", result.committed)
                        if let value = result.logits { last = value }
                    } else { last = model.lastLogits(Array(ids[lo ..< hi]), state: states[arm]) }
                    eval(last); lo = hi
                }
            } else {
                for lo in stride(from: 0, to: tokens, by: chunk) {
                    let hi = min(tokens, lo + chunk)
                    if terminalPrefill && arm == 2 && hi < tokens {
                        model.consumePrompt(Array(ids[lo ..< hi]), state: states[arm])
                    } else {
                        last = model.lastLogits(Array(ids[lo ..< hi]), state: states[arm])
                        eval(last)
                    }
                }
            }
            model.routerObserver = nil
            c.equal("arm\(arm): caller buffer-cache limit restored", MLX.Memory.cacheLimit, callerCacheLimit)
            if scoped && arm == 2 {
                c.expect("workspace allocation actually observed", workspaceCacheObservations > 0)
                c.expect("workspace retains no disposable MLX buffers", workspaceCacheEmpty)
            }
            if integratedBase {
                c.expect("arm\(arm): combined scope base executes fused rotation",
                    model.fusedRoPERotationsScheduled > rotationsBefore)
            }
            c.measure("arm\(arm).chunk", Double(chunk))
            c.measure("arm\(arm).read_records", Double(model.pool.recordsFetched))
            c.measure("arm\(arm).workspace_piece_writes", Double(model.pool.workspacePieceWriteCompletions - pieceWrites))
            if scoped && arm == 2 && options.workspacePiecewiseWrites {
                c.expect("piecewise workspace writes actually complete", model.pool.workspacePieceWriteCompletions > pieceWrites)
            }
            logits.append(last); traces.append(routes)
        }
        if terminalPrefill {
            c.equal("all undemanded terminal queries skipped", model.terminalQueryRowsSkipped,
                terminalQuery ? tokens - min(64, (tokens - 1) % 256 + 1) : tokens - ((tokens - 1) % 256 + 1))
            c.equal("all unused terminal MoE rows skipped", model.terminalMoERowsSkipped, tokens - 1)
            c.equal("last-row final router IDs", Array((traces[2][model.runLayers - 1] ?? []).suffix(model.cfg.topK)),
                Array((traces[0][model.runLayers - 1] ?? []).suffix(model.cfg.topK)))
        }
        if selectedAttention {
            c.expect("selected attention actually executed", model.selectedAttentionTiles > 0)
            c.measure("selected_attention_tiles", Double(model.selectedAttentionTiles))
        }
        model.optimizations = options
        func relative(_ value: MLXArray, _ reference: MLXArray, spread: Bool = false) -> Double {
            guard value.shape == reference.shape, value.dtype == reference.dtype else { return .infinity }
            let a = value.asType(.float32), b = reference.asType(.float32)
            let delta = abs(a - b).max().item(Float.self)
            let denominator = spread ? (b.max() - b.min()).item(Float.self) : abs(b).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        func band(_ label: String, _ values: [MLXArray], spread: Bool = false) {
            let control = relative(values[1], values[0], spread: spread)
            let candidate = relative(values[2], values[0], spread: spread)
            c.measure("\(label).control", control); c.measure("\(label).candidate", candidate)
            if scoped || (terminalPrefill && !spread) {
                c.expect("\(label): exact original 256-token arithmetic", candidate == 0)
            } else {
                c.expect("\(label): existing rechunk band", control.isFinite && candidate.isFinite
                    && candidate <= max(3 * control, 0.01))
            }
        }
        func compare(_ label: String, _ outputs: [MLXArray]) {
            band("\(label).logits", outputs, spread: true)
            c.equal("\(label): greedy final token", argMax(outputs[2].reshaped([-1])).item(Int.self),
                    argMax(outputs[0].reshaped([-1])).item(Int.self))
            let fields = states.map { $0.diagnosticTensors() }
            c.equal("\(label): control fields", Set(fields[1].keys), Set(fields[0].keys))
            c.equal("\(label): candidate fields", Set(fields[2].keys), Set(fields[0].keys))
            for key in fields[0].keys.sorted() {
                guard let control = fields[1][key], let candidate = fields[2][key] else { continue }
                let values = [fields[0][key]!, control, candidate]
                if key == "tokens" || key == "ngram" {
                    c.expect("\(label): exact \(key)", (values[0] .== values[1]).all().item(Bool.self)
                        && (values[0] .== values[2]).all().item(Bool.self))
                } else { band("\(label).\(key)", values) }
            }
        }
        compare("prefill", logits)
        func disagreement(_ got: [Int: [Int32]]) -> Double {
            var missing = 0, count = 0
            for layer in traces[0].keys.sorted() where !terminalPrefill || layer != model.runLayers - 1 {
                let reference = traces[0][layer]!, candidate = got[layer] ?? []
                guard candidate.count == reference.count else { return .infinity }
                for lo in stride(from: 0, to: reference.count, by: model.cfg.topK) {
                    let selected = Set(reference[lo ..< lo + model.cfg.topK])
                    for id in candidate[lo ..< lo + model.cfg.topK] {
                        if !selected.contains(id) { missing += 1 }
                        count += 1
                    }
                }
            }
            return Double(missing) / Double(max(1, count))
        }
        let controlRoutes = disagreement(traces[1]), candidateRoutes = disagreement(traces[2])
        c.measure("routing.control", controlRoutes); c.measure("routing.candidate", candidateRoutes)
        c.expect("route keep sets inside existing rechunk band", candidateRoutes <= max(3 * controlRoutes, 0.01))
        if scoped { c.equal("exact ordered router traces", traces[2], traces[0]) }
        if terminalPrefill {
            c.equal("all state-producing layers retain ordered routes", traces[2].filter { $0.key != model.runLayers - 1 },
                traces[0].filter { $0.key != model.runLayers - 1 })
        }
        // Teacher-forced continuation exposes drift hidden by a final-logit
        // check. The same suffix is actual work in every arm, regardless of
        // its free-generation choice.
        for token in [907, 1337, 2103] {
            logits = states.map { state in
                let value = model.lastLogits([token], state: state); eval(value); return value
            }
            compare("continued-\(token)", logits)
        }
        // Rejected speculative rows must restore the accepted prefix in all
        // schedule families, including a partial four-token indexer block.
        let checkpoints = states.map { $0.checkpoint() }
        let verify = [1137, 732, 2091]
        for keep in 1 ... verify.count {
            for (arm, state) in states.enumerated() {
                state.restore(checkpoints[arm]); state.setRecording(true)
                let verified = model.allLogitsWithMulti(verify, state: state)
                eval(verified.logits, verified.multi)
                state.rollback(keeping: keep, of: verify, from: checkpoints[arm], ngramWindow: model.cfg.ngramSize - 1)
            }
            logits = states.map { state in
                let value = model.lastLogits([907], state: state); eval(value); return value
            }
            compare("rollback-\(keep)", logits)
        }
        return c.report()
    }
}
