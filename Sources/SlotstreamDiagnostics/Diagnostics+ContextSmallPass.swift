import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Preregistered C07: 515 deterministic IDs, 256 reference / 512 rechunk
    /// control / 64 or 128 candidate / identical repeat, followed by three
    /// teacher-forced tokens and every keep count of a three-row rollback.
    /// Existing control band is max(3 * control drift, 1%); fixed before runs.
    /// Timings describe this short pass family, not late-context throughput.
    public static func contextSmallPass(modelDir: URL, pass: Int, swept: Bool = false, paddedRouter: Bool = false, paddedAttention: Bool = false,
                                        tokens: Int = 515, prefix: Int = 0, paddedProjections: Bool = false) throws -> CheckReport {
        guard [64, 128].contains(pass) else { throw ModelError("context small pass must be 64 or 128") }
        guard tokens >= 16, tokens <= 4096, prefix >= 0, prefix < tokens else {
            throw ModelError("context numerical fixture length or prefix is invalid")
        }
        let scoped = false, selectedAttention = false, terminalPrefill = false, terminalQuery = false
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        var options = InferenceOptimizations()
        // This feature must qualify the shipped arithmetic without enabling
        // unrelated optimization candidates to make the gate pass.
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        options.workspacePiecewiseWrites = model.optimizations.workspacePiecewiseWrites
        model.optimizations = options
        model.pool.admitOnSweep = false
        model.stableSmallPrefillRouting = paddedRouter
        model.stableSmallPrefillAttention = paddedAttention
        model.stableSmallPrefillProjections = paddedProjections
        model.alignSmallReferenceDispatch = paddedAttention
        model.smallPrefillReferenceEnd = tokens
        model.smallPrefillReferenceStart = prefix
        var c = CheckBuilder("context-small-pass-\(pass)\(swept ? "-swept" : "")\(paddedRouter ? "-router-padded" : "")\(paddedAttention ? "-attention-aligned" : "")\(paddedProjections ? "-projections-aligned" : "")/tokens=\(tokens)/prefix=\(prefix)")
        c.measure("workspace_token_tile", Double(options.workspaceTokenTile))
        c.measure("compact_scope_frontier", options.compactScopeFrontier ? 1 : 0)
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        let chunks = [256, 512, pass, pass]
        let states = chunks.map { _ in model.makeState() }
        var logits: [MLXArray] = []
        var traces: [[Int: [Int32]]] = []
        for (arm, chunk) in chunks.enumerated() {
            model.smallPrefillSweep = false
            if prefix > 0 {
                for lo in stride(from: 0, to: prefix, by: 256) {
                    let seed = model.lastLogits(Array(ids[lo ..< min(prefix, lo + 256)]), state: states[arm]); eval(seed)
                }
            }
            model.smallPrefillSweep = swept && arm >= 2
            let smallSweepsBefore = model.smallPrefillSweeps
            let paddedQueriesBefore = model.paddedSmallQueryRows
            let started = RuntimeClock.now()
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
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
                for lo in stride(from: prefix, to: tokens, by: chunk) {
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
            Stream.gpu.synchronize(); model.pool.unpinAll()
            let grouped = stride(from: prefix, to: tokens, by: chunk).filter { lo in
                let canonicalStart = prefix + ((lo - prefix) / 256) * 256
                return min(chunk, tokens - lo) >= 64 && (!paddedAttention || tokens - canonicalStart >= 256)
            }.count
            c.equal("arm\(arm): requested grouped small-pass dispatch", model.smallPrefillSweeps - smallSweepsBefore,
                swept && arm >= 2 ? grouped * model.runLayers : 0)
            c.measure("arm\(arm).seconds", RuntimeClock.seconds(since: started))
            c.measure("arm\(arm).allocated_bytes", Double(states[arm].allocatedSequenceBytes))
            c.equal("arm\(arm): correct absolute token count", states[arm].tokenCount, tokens)
            c.equal("arm\(arm): no pins survive dispatch", model.pool.pinnedSlotCount, 0)
            c.measure("arm\(arm).chunk", Double(chunk))
            c.measure("arm\(arm).read_records", Double(model.pool.recordsFetched))
            c.measure("arm\(arm).workspace_piece_writes", Double(model.pool.workspacePieceWriteCompletions - pieceWrites))
            c.measure("arm\(arm).padded_query_rows", Double(model.paddedSmallQueryRows - paddedQueriesBefore))
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
        model.smallPrefillSweep = false
        c.equal("identical small-pass routing on repeat", traces[2], traces[3])
        c.expect("identical small-pass logits on repeat", (logits[2] .== logits[3]).all().item(Bool.self))
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
            c.equal("\(label): deterministic field names", Set(fields[2].keys), Set(fields[3].keys))
            for (key, value) in fields[2] {
                c.expect("\(label): deterministic repeated \(key)", fields[3][key].map {
                    value.shape == $0.shape && (value .== $0).all().item(Bool.self)
                } ?? false)
            }
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
        if paddedAttention { c.expect("padded small key domains actually execute", model.paddedSmallKeyDomains > 0) }
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

extension Diagnostics {
    /// Bounded mechanistic probe, not a replacement for C07 qualification.
    public static func contextSmallComponents(modelDir: URL, paddedRouter: Bool = false, fullModel: Bool = false,
                                              layers: Int = 4, paddedProjections: Bool = false) throws -> CheckReport {
        guard [4, 12].contains(layers) else { throw ModelError("component probe supports four or twelve layers") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640, runLayers: fullModel ? nil : layers)
        model.optimizations = InferenceOptimizations()
        model.pool.admitOnSweep = false
        model.stableSmallPrefillRouting = paddedRouter
        model.stableSmallPrefillProjections = paddedProjections
        model.alignSmallReferenceDispatch = paddedProjections
        model.stableSmallPrefillAttention = paddedProjections
        model.smallPrefillReferenceEnd = 515
        let ids = (0 ..< 515).map { 1000 + (($0 * 7919) % 200_000) }
        var c = CheckBuilder("context-small-components\(fullModel ? "-full" : "")\(paddedRouter ? "-router-padded" : "")\(paddedProjections ? "-projections" : "")/layers=\(layers)")
        c.measure("model_layers", Double(model.runLayers))
        var arms: [[String: MLXArray]] = []
        for chunk in [256, 512, 64] {
            model.smallPrefillSweep = chunk == 64
            var collected: [String: [MLXArray]] = [:]
            model.contextNumericsObserver = { layer, stage, value in
                guard layer < layers else { return }
                eval(value); collected["\(layer).\(stage)", default: []].append(value)
            }
            let state = model.makeState()
            for lo in stride(from: 0, to: ids.count, by: chunk) {
                let rows = Array(ids[lo ..< min(ids.count, lo + chunk)])
                let out: MLXArray
                if fullModel { out = try model.lastLogitsChecked(rows, state: state) }
                else { out = try model.hiddenStatesChecked(rows, state: state) }
                eval(out)
            }
            Stream.gpu.synchronize(); model.pool.unpinAll()
            c.equal("\(chunk): exact committed count", state.tokenCount, ids.count)
            arms.append(collected.mapValues { concatenated($0, axis: 1) })
        }
        for key in arms[0].keys.sorted() {
            let reference = arms[0][key]!.asType(.float32)
            for arm in 1 ... 2 {
                let candidate = arms[arm][key]!.asType(.float32)
                let delta = abs(candidate - reference)
                c.measure("\(key).arm\(arm).relative", Double(delta.max().item(Float.self) / max(abs(reference).max().item(Float.self), 1e-6)))
                c.measure("\(key).arm\(arm).different", Double((candidate .!= reference).sum().item(Int.self)))
                let rows = delta.reshaped([515, -1]).max(axis: 1).asArray(Float.self)
                c.measure("\(key).arm\(arm).first_row", Double(rows.firstIndex(where: { $0 != 0 }) ?? -1))
                c.expect("\(key).arm\(arm): finite", isFinite(candidate).all().item(Bool.self))
            }
        }
        model.contextNumericsObserver = nil
        return c.report()
    }
}
