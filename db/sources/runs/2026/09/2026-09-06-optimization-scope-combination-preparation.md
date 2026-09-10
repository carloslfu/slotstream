---
type: run
id: 01m1vs1hycyw12sjv24txpjrez
created: 2026-09-06T16:32:52.172372+00:00
updated: 2026-09-06T16:32:52.559680+00:00
summary: Combined-base long-prefill scope qualification preparation
binary: FINAL_BINARY_REQUIRED; native checks unbuilt/unrun
captured_at: 2026-09-06
command: python3 prepare-scope-draft-v170.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Combined-base long-prefill scope qualification preparation
tool: Source review and Python static protocol validation
---
V170 prepares a new combined-base long-prefill qualification without running a model or build. Re-reading V22's actual records shows several clean candidate observations within the 10 GB ceiling (including 9,545,388,136 and 9,589,952,616 bytes); the corresponding reference observations swap, so none of those observations establishes a paired speedup. V98's separate 16 GB reference-warmup stop is preserved and is not rerun.

The new UNRUN draft remains intentionally unbound (FINAL_BINARY_REQUIRED). It combines the qualified row-backed embedding/core/RoPE base with the exact existing bounded-indexer/PLE reference, comparing original 256-token compute against a 4096-token read scope with 1024-row expert workspace and compact frontier. Both use the same native 10 GB target and no explicit pool override or planner credit. The 3,730-token templated code prompt requests sixteen greedy outputs with MTP/prefix off. The separately measured embedding resource saving motivates this new base; it is not subtracted arithmetically from historical peaks or multiplied into a latency claim.

Sixteen fixed alternating pairs, minimum five clean, five-percent median full-client reduction and eighty-percent positive are declared prospectively. First-job nonregression is a separate min-five/exact/five-percent gate. Six logical/model-work counters must match; prefill record bounds require at least 150,000 reference records and at most 50,000 candidate records, thereby demonstrating substantial actual read reuse. All outputs must match. Peak ceiling is 10,000,000,000 sampled whole-process bytes, with unchanged strict VM/power exclusion, immediate resource stop, 180-second initial quiet, 60-second reserved cooldown and no replacement. Base preflight is 13 GB plus 7.112 GB candidate allowance. All 54 current controls are explicit. Static declaration/fixture/request checks pass; no binary identity or native evidence is bound yet.

Three new explicit diagnostic variants apply the joint base to the existing full-state/route/continuation/rollback family, scope cancellation/retry and MTP/image scope checks. They require bounded embedding rows and observed fused rotation. Their previous default behavior remains available. Family 2051/4096 with workspace tile1024/compact frontier plus both lifecycle variants must pass on a fresh source build before this draft can become executable. These native checks are added but unbuilt/unrun; no defaults change. Automatic use, short-prefill guard and coherent planner policy remain later gates if benefit qualifies.

The same source captures a package-visible memberwise initializer for V169's platform identity, needed by the separate diagnostics module. This is an unbuilt source correction, not a passing compiler result. Transport still owns the local model/build/storage interval; pending frozen V156/V159/V160 studies and all final OPT32/33 acceptance remain open.


Artifact `/Users/carlos/Projects/slotstream/.build/optimization/scope-combination-preparation-v170/Diagnostics+Optimization.swift.before` — 55137 bytes, SHA-256 `5c9265c1df93607a3d9d42cf691aa462b68d01e3b551178c5301134b1de8f6ff`.

````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Numerical/read-count probe only. Several states coexist for comparison;
    /// its resource and duration observations are not fresh-process A/B claims.
    public static func optimizationReadScope(modelDir: URL, tokens: Int) throws -> CheckReport {
        guard [4096, 8192].contains(tokens) else { throw ModelError("scope probe tokens must be 4096 or 8192") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var c = CheckBuilder("optimization-layer-read-scope")
        c.measure("workspace_token_tile", Double(model.optimizations.workspaceTokenTile))
        func build(chunk: Int, workspace: Bool) -> (Qwen4ExpModel.State, MLXArray, [Int: [Int32]], Int) {
            var options = InferenceOptimizations()
            options.compactStateWindows = true
            options.boundedIndexer = true
            options.boundedPLE = true
            options.layerExpertWorkspace = workspace
            options.workspaceTokenTile = model.optimizations.workspaceTokenTile
            options.compactScopeFrontier = model.optimizations.compactScopeFrontier
            model.optimizations = options
            model.pool.resetStats()
            model.pool.admitOnSweep = false
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
            let state = model.makeState()
            var last = MLXArray(Float(0))
            for lo in stride(from: 0, to: tokens, by: chunk) {
                last = model.lastLogits(Array(ids[lo ..< min(tokens, lo + chunk)]), state: state)
                eval(last)
            }
            model.routerObserver = nil
            return (state, last, routes, model.pool.recordsFetched)
        }
        let (reference, referenceLogits, referenceRoutes, referenceReads) = build(chunk: 4096, workspace: false)
        let (control, controlLogits, controlRoutes, controlReads) = build(chunk: 1024, workspace: false)
        let (candidate, candidateLogits, candidateRoutes, candidateReads) = build(chunk: tokens, workspace: true)
        func relative(_ a: MLXArray, _ b: MLXArray, spread: Bool = false) -> Double {
            guard a.shape == b.shape, a.dtype == b.dtype else { return .infinity }
            let af = a.asType(.float32), bf = b.asType(.float32)
            let delta = abs(af - bf).max().item(Float.self)
            let denominator = spread ? (bf.max() - bf.min()).item(Float.self) : abs(bf).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        let controlDelta = relative(controlLogits, referenceLogits, spread: true)
        let candidateDelta = relative(candidateLogits, referenceLogits, spread: true)
        c.measure("control_logit_spread_fraction", controlDelta)
        c.measure("candidate_logit_spread_fraction", candidateDelta)
        c.expect("logits inside preregistered rechunk band", candidateDelta <= max(3 * controlDelta, 0.01))
        c.equal("greedy final token", argMax(candidateLogits.reshaped([-1])).item(Int.self), argMax(referenceLogits.reshaped([-1])).item(Int.self))
        let rt = reference.diagnosticTensors(), ct = control.diagnosticTensors(), nt = candidate.diagnosticTensors()
        c.equal("candidate state fields", Set(nt.keys), Set(rt.keys))
        for key in rt.keys.sorted() {
            if let controlValue = ct[key], let candidateValue = nt[key] {
                if key == "tokens" || key == "ngram" {
                    c.expect("exact \(key)", (rt[key]! .== candidateValue).all().item(Bool.self))
                } else {
                    let baseline = relative(controlValue, rt[key]!)
                    let changed = relative(candidateValue, rt[key]!)
                    c.measure("control.\(key)", baseline)
                    c.measure("candidate.\(key)", changed)
                    c.expect("state band \(key)", changed <= max(3 * baseline, 0.01))
                }
            }
        }
        func routeDisagreement(_ routes: [Int: [Int32]]) -> Double {
            var different = 0, total = 0
            var stamps = [Int](repeating: 0, count: model.cfg.numExperts)
            var stamp = 0
            for layer in referenceRoutes.keys.sorted() {
                let ref = referenceRoutes[layer]!, got = routes[layer] ?? []
                guard ref.count == got.count else { return .infinity }
                for lo in stride(from: 0, to: ref.count, by: model.cfg.topK) {
                    stamp += 1
                    for i in lo ..< lo + model.cfg.topK { stamps[Int(ref[i])] = stamp }
                    for i in lo ..< lo + model.cfg.topK {
                        if stamps[Int(got[i])] != stamp { different += 1 }
                        total += 1
                    }
                }
            }
            return Double(different) / Double(max(1, total))
        }
        let ctrlRoutes = routeDisagreement(controlRoutes), newRoutes = routeDisagreement(candidateRoutes)
        c.measure("control_route_set_disagreement", ctrlRoutes)
        c.measure("candidate_route_set_disagreement", newRoutes)
        c.expect("routing inside preregistered rechunk band", newRoutes <= max(3 * ctrlRoutes, 0.01))
        c.measure("reference_read_records", Double(referenceReads))
        c.measure("control_read_records", Double(controlReads))
        c.measure("candidate_read_records", Double(candidateReads))
        c.expect("one record at most per layer/expert in a scope", candidateReads <= model.runLayers * model.cfg.numExperts)
        if tokens > 4096 { c.expect("larger scope reads fewer records", candidateReads < referenceReads) }
        c.measure("probe_process_footprint_end_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }

    public static func optimizationScopeLifecycle(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true
        options.layerExpertWorkspace = true; options.skipUnusedFinalForward = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        var c = CheckBuilder("optimization-scope-lifecycle")
        let prompt = (0 ..< 1280).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy; params.maxTokens = 1; params.seed = 7
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        func seed() -> PrefixCache {
            let cache = PrefixCache(maxTokens: 8192)
            let state = model.makeState()
            eval(model.lastLogits(Array(prompt.prefix(256)), state: state))
            cache.store(state: state, tokens: Array(prompt.prefix(256)))
            return cache
        }
        let referenceCache = seed(), candidateCache = seed()
        let seedState = referenceCache.take(matching: prompt, reserveTokens: 2048)!.state
        let untouched = seed()
        params.maxTokens = 1
        let (referenceIds, referenceStats) = generator.generate(promptIds: prompt, params: params,
            eosIds: [], cache: untouched)
        let referenceState = untouched.take(matching: prompt + referenceIds + [907], reserveTokens: 2048)!.state
        model.optimizations.readScopeTokens = 1024
        for cutLayer in [0, 1, 3, 47] {
            var layer = -1
            model.routerObserver = { current, _ in layer = current }
            let savedLimit = MLX.Memory.cacheLimit
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache,
                shouldContinue: { layer < cutLayer })
            model.routerObserver = nil
            c.expect("layer \(cutLayer): cancel emits no token", ids.isEmpty)
            c.equal("layer \(cutLayer): abort counted", stats.abortedReadScopes, 1)
            c.equal("layer \(cutLayer): no partial commit", stats.prefillTokens, 0)
            c.expect("layer \(cutLayer): no completed passes", stats.prefillPasses.isEmpty)
            c.equal("layer \(cutLayer): cache limit restored", MLX.Memory.cacheLimit, savedLimit)
            c.expect("layer \(cutLayer): admission restored", !model.pool.admitOnSweep)
            let hit = candidateCache.take(matching: prompt, reserveTokens: 2048)!
            c.equal("layer \(cutLayer): exact committed prefix", hit.reused, 256)
            equalState(seedState, hit.state, "layer \(cutLayer): restored state")
            candidateCache.store(state: hit.state, tokens: Array(prompt.prefix(256)))
        }
        let (candidateIds, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache)
        c.equal("retry exact output", candidateIds, referenceIds)
        c.equal("reference compute schedule", referenceStats.prefillComputePasses, [256, 256, 256, 256])
        c.equal("candidate preserves compute schedule", stats.prefillComputePasses, referenceStats.prefillComputePasses)
        c.equal("candidate commits one read scope", stats.prefillPasses, [1024])
        let candidateState = candidateCache.take(matching: prompt + candidateIds + [907], reserveTokens: 2048)!.state
        equalState(referenceState, candidateState, "retry exact continuation")
        c.expect("capacity remains charged after abort and growth", candidateState.allocatedSequenceBytes > 0)
        return c.report()
    }

    /// Synthetic already-encoded image rows isolate span/offset/state
    /// handling. The separate real-image serving gate covers tower execution.
    public static func optimizationScopeMTPVision(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let head = model.mtpHead!
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true; options.layerExpertWorkspace = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        let ids = (0 ..< 1024).map { 1000 + (($0 * 7919) % 200_000) }
        let rows = MLXArray((0 ..< 640 * model.cfg.hiddenSize).map { Float($0 % 29 - 14) / 32 },
            [640, model.cfg.hiddenSize]).asType(.bfloat16)
        eval(rows)
        let run = VisionRun(start: 128, rows: rows)
        var c = CheckBuilder("optimization-scope-mtp-vision")
        func equal(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let av = a.diagnosticTensors(), bv = b.diagnosticTensors()
            c.equal("\(name): fields", Set(av.keys), Set(bv.keys))
            for key in av.keys.sorted() {
                if let v = bv[key] { c.expect("\(name): \(key)", av[key]!.shape == v.shape && (av[key]! .== v).all().item(Bool.self)) }
            }
        }
        func consume(_ state: Qwen4ExpModel.State, _ range: Range<Int>) -> MLXArray {
            let chunk = Array(ids[range]), vision = [run.clipped(to: range.lowerBound, range.upperBound)].compactMap { $0 }
            let (mixed, multi) = model.hiddenStatesWithMulti(chunk, state: state, vision: vision)
            state.lastMulti = head.consume(chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                resident: model.resident, rope: model.sharedRope, state: state.mtp!, vision: vision, compactRetainedRow: true)
            eval(mixed); return mixed
        }
        func seed() -> Qwen4ExpModel.State {
            let state = model.makeState(); state.mtp = MTPState()
            _ = consume(state, 0 ..< 256); return state
        }
        let seedState = seed(), reference = seed(), candidate = seed()
        for lo in stride(from: 256, to: 1024, by: 256) { _ = consume(reference, lo ..< lo + 256) }
        let remaining = Array(ids[256...]), vision = [run.clipped(to: 256, 1024)!]
        var layer = -1, checksAfterLast = 0
        model.routerObserver = { current, _ in layer = current }
        let cancelled = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: {
                if layer == model.runLayers - 1 { checksAfterLast += 1; return checksAfterLast < 3 }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel during second draft-head tile", !cancelled.committed && checksAfterLast == 3)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        c.expect("cancel restores valid draft prefix", candidate.hasValidMTP)
        equal(seedState, candidate, "image/MTP rollback")
        let result = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("retry commits scope", result.committed && result.logits != nil)
        c.expect("retry draft aligned", candidate.hasValidMTP)
        equal(reference, candidate, "image/MTP continuation")
        let r = model.lastLogits([907], state: reference), n = model.lastLogits([907], state: candidate)
        c.expect("next target logits exact", (r .== n).all().item(Bool.self))
        return c.report()
    }

    public static func optimizationMTPWork(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        model.optimizations = InferenceOptimizations()
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.fusedGDNRecording = true
        var c = CheckBuilder("optimization-mtp-work")
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for depth in [1, 3] {
            generator.draftDepth = depth
            for limit in [1, 2, 5] {
                var params = SampleParams.greedy; params.maxTokens = limit; params.seed = 7
                model.optimizations.reuseFirstMTPEntry = false
                model.optimizations.boundedDraftTail = false
                let (reference, _) = generator.generate(promptIds: prompt, params: params, eosIds: [])
                for mode in ["first", "tail", "both"] {
                    model.optimizations.reuseFirstMTPEntry = mode != "tail"
                    model.optimizations.boundedDraftTail = mode != "first"
                    let cache = PrefixCache(maxTokens: 4096)
                    let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
                    let name = "depth \(depth), limit \(limit), \(mode)"
                    c.equal("\(name): emitted count", ids.count, limit)
                    c.equal("\(name): stable fixture output", ids, reference)
                    let hit = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)!
                    c.expect("\(name): aligned draft", hit.state.hasValidMTP)
                    c.expect("\(name): consumed prefix within emitted tokens",
                        hit.state.tokenCount >= prompt.count && hit.state.tokenCount <= prompt.count + ids.count)
                    c.equal("\(name): reconciliation covers committed positions",
                        stats.reconciledHeadTokens + stats.reusedHeadTokens, hit.state.tokenCount - prompt.count)
                    if limit == 1 { c.equal("\(name): no terminal verification", stats.verifyPasses, 0) }
                    if limit == 2 && mode != "first" {
                        c.equal("\(name): terminal output needs zero drafts", stats.draftedTokens, 0)
                        c.equal("\(name): one target position suffices", stats.decodeModelTokens, 1)
                        c.equal("\(name): final emission stays pending", hit.state.tokenCount, prompt.count + 1)
                    }
                    if limit > 1 && mode == "first" {
                        c.equal("\(name): first entry reused each round", stats.reusedHeadTokens, stats.verifyPasses)
                    }
                }
            }
        }
        return c.report()
    }

    public static func optimizationGDNKernel() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-gdn-recording-kernel")
        func values(_ shape: [Int], scale: Float) -> MLXArray {
            let count = shape.reduce(1, *)
            return MLXArray((0 ..< count).map { Float(($0 * 7919) % 127 - 63) * scale }, shape)
        }
        for T in [1, 2, 3, 5, 17, 18] {
            for dims in [(2, 4, 32, 8), (2, 4, 128, 128), (1, 2, 33, 8)] {
                let (Hk, Hv, Dk, Dv) = dims
                let B = 2
                let q = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let k = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let v = values([B, T, Hv, Dv], scale: 0.01).asType(.bfloat16)
                let a = values([B, T, Hv], scale: 0.1).asType(.bfloat16)
                let b = -a
                // exp(aLog) overflows for the first head, giving exact zero
                // decay; all other heads retain finite nontrivial memory.
                let aLog = MLXArray((0 ..< Hv).map { $0 == 0 ? Float(100) : Float(-2) })
                let bias = MLXArray.zeros([Hv], dtype: .bfloat16)
                let initial = values([B, Hv, Dv, Dk], scale: 0.01)
                for pattern in 0 ..< 3 {
                    let mask: MLXArray? = pattern == 0 ? nil : MLXArray((0 ..< B * T).map { pattern == 1 && $0 % 2 == 0 }, [B, T])
                    let result = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: a, b: b,
                        aLog: aLog, dtBias: bias, state: initial, mask: mask)
                    eval([result.output] + result.states)
                    var reference = initial
                    var outputs: [MLXArray] = []
                    for t in 0 ..< T {
                        let (y, state) = gatedDeltaUpdate(
                            q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                            a: a[0..., t ..< (t + 1)], b: b[0..., t ..< (t + 1)], aLog: aLog, dtBias: bias,
                            state: reference, mask: mask?[0..., t ..< (t + 1)])
                        reference = state; outputs.append(y)
                        c.expect("T\(T) Dk\(Dk) mask\(pattern) state\(t)", (state .== result.states[t]).all().item(Bool.self))
                    }
                    c.expect("T\(T) Dk\(Dk) mask\(pattern) outputs", (concatenated(outputs, axis: 1) .== result.output).all().item(Bool.self))
                    c.equal("T\(T) Dk\(Dk) mask\(pattern) owns every state", result.states.count, T)
                }
            }
        }
        return c.report()
    }

    public static func optimizationLifecycle(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.skipUnusedFinalForward = true
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var c = CheckBuilder("optimization-lifecycle")
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        let prompt = (0 ..< 270).map { 1000 + $0 * 7 }
        var params = SampleParams.greedy; params.maxTokens = 2; params.seed = 7
        let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
        let (rids, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
        var completed = 0
        var observedBase = -1
        generator.onPrefillProgressAbsolute = { done, _, _, base in completed = done; observedBase = base }
        let beforeLimit = MLX.Memory.cacheLimit
        let (cancelled, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc,
                                                    shouldContinue: { completed < 256 })
        c.expect("cancel emits no token", cancelled.isEmpty)
        c.equal("cancel stores whole pass only", stats.prefillTokens, 256)
        c.equal("cancel restores allocator limit", MLX.Memory.cacheLimit, beforeLimit)
        c.expect("cancel clears admission", !model.pool.admitOnSweep)
        c.equal("cancel prefix retained", cc.heldTokens, 256)
        c.equal("initial absolute base", observedBase, 0)
        let (cids, resumed) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
        c.equal("resume exact IDs", cids, rids)
        c.equal("resume uses committed pass", resumed.reusedPrefixTokens, 256)
        c.equal("resume absolute base", observedBase, 256)
        let next = prompt + cids + [907]
        let rs = rc.take(matching: next, reserveTokens: 512)!.state
        let cs = cc.take(matching: next, reserveTokens: 512)!.state
        equalState(rs, cs, "cancel/retry matches uninterrupted")
        c.expect("actual sequence buffers charge their capacity", cs.allocatedSequenceBytes > cs.tokenCount * PrefixCache.bytesPerToken)
        c.expect("capacity reservation covers buffers", model.sequenceCapacityBytes(tokens: cs.tokenCount, mtp: false) >= cs.allocatedSequenceBytes)
        let logicalOnly = PrefixCache(maxTokens: cs.tokenCount)
        logicalOnly.store(state: cs, tokens: Array(next.prefix(cs.tokenCount)))
        c.equal("token-only allowance cannot hide unused buffer capacity", logicalOnly.heldTokens, 0)
        generator.onPrefillProgressAbsolute = nil
        try model.enableMTP(modelDir: modelDir)
        for firstLimit in [1, 3] {
            let cache = PrefixCache(maxTokens: 4096)
            var ids = [1000, 1079, 25, 1237, 460, 11, 279, 1917]
            generator.speculationEnabled = true
            params.maxTokens = firstLimit
            let (first, _) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            ids += first + [908]
            let hit = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("on \(firstLimit): aligned draft", hit.state.hasValidMTP)
            cache.store(state: hit.state, tokens: Array(ids.prefix(hit.state.tokenCount)))
            generator.speculationEnabled = false
            params.maxTokens = 3
            let (plain, ps) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("off \(firstLimit): reused main prefix", ps.reusedPrefixTokens > 0)
            c.equal("off \(firstLimit): no verification", ps.verifyPasses, 0)
            ids += plain + [909]
            let off = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("off \(firstLimit): draft invalidated", off.state.mtp == nil && off.state.lastMulti == nil)
            cache.store(state: off.state, tokens: Array(ids.prefix(off.state.tokenCount)))
            generator.speculationEnabled = true
            let (_, resumed) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("on again \(firstLimit): reuses main state", resumed.reusedPrefixTokens > 0)
            c.equal("on again \(firstLimit): stale draft never used", resumed.verifyPasses, 0)
            let (_, fresh) = generator.generate(promptIds: [2000, 21, 907, 34], params: params, eosIds: [])
            c.expect("fresh \(firstLimit): speculation available", fresh.verifyPasses > 0)
        }
        return c.report()
    }

    public static func optimizationMTP(modelDir: URL, router: Bool = false) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: router, cachedWeights: false)
    }

    public static func optimizationMTPRouterWeights(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: true)
    }

    public static func optimizationMTPCacheBookkeeping(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, bookkeeping: true)
    }

    public static func optimizationMTPCompiledNorm(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, compiledNorm: true)
    }

    public static func optimizationMTPReadHandles(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, readHandles: true)
    }

    public static func optimizationMTPTerminalPrefill(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, terminalPrefill: true)
    }

    public static func optimizationMTPTerminalQuery(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false,
            terminalPrefill: true, terminalQuery: true)
    }

    public static func optimizationMTPFloorCache(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, floorCache: true)
    }

    private static func optimizationMTPImplementation(modelDir: URL, router: Bool, cachedWeights: Bool, bookkeeping: Bool = false, compiledNorm: Bool = false, readHandles: Bool = false, terminalPrefill: Bool = false, floorCache: Bool = false, terminalQuery: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        var c = CheckBuilder(floorCache ? "optimization-mtp-floor-cache" : terminalPrefill ? "optimization-mtp-terminal-prefill" : readHandles ? "optimization-mtp-read-handles" : compiledNorm ? "optimization-mtp-compiled-norm" : bookkeeping ? "optimization-mtp-cache-bookkeeping" : cachedWeights ? "optimization-mtp-router-weights" : (router ? "optimization-mtp-router" : "optimization-mtp-row"))
        var candidateRouting = false
        var referenceRoutes: [[Int32]] = [], candidateRoutes: [[Int32]] = []
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache {
            model.mtpHead!.routerObserver = { ids in
                if candidateRouting { candidateRoutes.append(ids) }
                else { referenceRoutes.append(ids) }
            }
        }
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for limit in [1, 2, 5] {
            var params = SampleParams.greedy; params.maxTokens = limit
            params.seed = 7
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            candidateRouting = false
            model.optimizations = InferenceOptimizations()
            let (ri, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            candidateRouting = true
            model.optimizations.compactMTPRow = !router && !cachedWeights && !bookkeeping && !compiledNorm && !readHandles && !terminalPrefill && !floorCache
            model.optimizations.routerTopK = router
            model.optimizations.cachedRouterWeights = cachedWeights
            model.optimizations.compiledNormFinish = compiledNorm
            model.optimizations.directReadHandles = readHandles
            model.optimizations.terminalPrefillPruning = terminalPrefill
            model.optimizations.terminalLastQuery = terminalQuery
            model.optimizations.ngramRingOrder = bookkeeping
            model.optimizations.denseExpertLookup = bookkeeping
            model.optimizations.sparsePoolPins = bookkeeping
            model.optimizations.layerLocalFloorCache = floorCache
            let (ci, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            if readHandles { c.equal("MTP handles cover expert and n-gram tensors", model.readHandleCount, 816) }
            if cachedWeights {
                c.equal("MTP limit \(limit): all main/head copies charged", model.cachedRouterBytes,
                    (model.runLayers + 1) * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            }
            c.equal("MTP limit \(limit): exact emitted tokens", ci, ri)
            let r = rc.take(matching: prompt + ri + [907], reserveTokens: 100)!.state
            let g = cc.take(matching: prompt + ci + [907], reserveTokens: 100)!.state
            let rt = r.diagnosticTensors(), gt = g.diagnosticTensors()
            c.equal("MTP limit \(limit): fields", Set(rt.keys), Set(gt.keys))
            for k in rt.keys.sorted() {
                if let v = gt[k] { c.expect("MTP limit \(limit): \(k)", rt[k]!.shape == v.shape && (rt[k]! .== v).all().item(Bool.self)) }
            }
            c.equal("MTP limit \(limit): aligned reference", r.mtp!.offset, r.tokenCount - 1)
            c.equal("MTP limit \(limit): aligned candidate", g.mtp!.offset, g.tokenCount - 1)
            let e = model.resident.embed(MLXArray([Int32(907)], [1, 1])).asType(.bfloat16)
            candidateRouting = false
            model.mtpHead!.usesSpecializedRouter = false
            model.mtpHead!.usesCompiledNorm = false
            let (rs, rm) = model.mtpHead!(embedded: e, hiddenMulti: r.lastMulti!, rope: model.sharedRope, state: r.mtp!)
            candidateRouting = true
            model.mtpHead!.usesSpecializedRouter = router
            model.mtpHead!.usesCompiledNorm = compiledNorm
            let (gs, gm) = model.mtpHead!(embedded: e, hiddenMulti: g.lastMulti!, rope: model.sharedRope, state: g.mtp!)
            c.expect("MTP limit \(limit): future draft sample", (rs .== gs).all().item(Bool.self))
            c.expect("MTP limit \(limit): future draft multi", (rm .== gm).all().item(Bool.self))
        }
        if terminalPrefill {
            let queryStart = model.terminalQueryRowsSkipped, moeStart = model.terminalMoERowsSkipped
            model.optimizations.terminalPrefillPruning = false
            let reference = model.lastLogits(prompt, state: model.makeState())
            model.optimizations.terminalPrefillPruning = true
            let candidate = model.lastLogits(prompt, state: model.makeState())
            c.expect("loaded MTP disables even direct last-row pruning", (reference .== candidate).all().item(Bool.self))
            c.equal("loaded MTP preserves all query rows", model.terminalQueryRowsSkipped, queryStart)
            c.equal("loaded MTP preserves all MoE rows", model.terminalMoERowsSkipped, moeStart)
        }
        if compiledNorm { c.expect("draft norm fusion actually ran", model.mtpHead!.compiledNormFinishes > 0) }
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache { c.equal("ordered draft router traces", candidateRoutes, referenceRoutes) }
        return c.report()
    }

    public static func optimizationGeneration(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        generator.speculationEnabled = false
        var c = CheckBuilder("optimization-generation")
        let prompt = [1000, 1013, 2087, 1102]
        func compare(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ label: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(label): fields", Set(at.keys), Set(bt.keys))
            for k in at.keys.sorted() {
                if let v = bt[k] {
                    c.expect("\(label): \(k)", at[k]!.shape == v.shape && (at[k]! .== v).all().item(Bool.self))
                }
            }
        }
        for limit in [1, 2, 4] {
            var params = SampleParams.greedy; params.maxTokens = limit
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            model.optimizations.skipUnusedFinalForward = false
            let (ri, rs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            model.optimizations.skipUnusedFinalForward = true
            let (ci, cs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            c.equal("limit \(limit): emitted IDs", ci, ri)
            c.equal("limit \(limit): finish", cs.finishReason, rs.finishReason)
            c.equal("limit \(limit): output count", ci.count, limit)
            let next = prompt + ci + [901]
            let r = rc.take(matching: next, reserveTokens: next.count)!
            let g = cc.take(matching: next, reserveTokens: next.count)!
            c.equal("limit \(limit): reference consumed", r.state.tokenCount, prompt.count + limit)
            c.equal("limit \(limit): final token pending", g.state.tokenCount, prompt.count + limit - 1)
            let last = model.lastLogits([ci.last!], state: g.state); eval(last)
            compare(r.state, g.state, "limit \(limit): pending consumed once")
            let rl = model.lastLogits([901], state: r.state); eval(rl)
            let gl = model.lastLogits([901], state: g.state); eval(gl)
            c.expect("limit \(limit): next logits", (rl .== gl).all().item(Bool.self))
            compare(r.state, g.state, "limit \(limit): continuation")
        }
        for optimized in [false, true] {
            model.optimizations.skipUnusedFinalForward = optimized
            var params = SampleParams.greedy; params.maxTokens = 4
            let cache = PrefixCache(maxTokens: 4096)
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                                                  onToken: { _ in false })
            c.equal("callback stop \(optimized): one emission", ids.count, 1)
            c.equal("callback stop \(optimized): reason", stats.finishReason, "stop")
            let state = cache.take(matching: prompt + ids, reserveTokens: 10)!.state
            c.equal("callback stop \(optimized): token remains pending", state.tokenCount, prompt.count)
            let (cancelled, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], shouldContinue: { false })
            c.expect("cancel before prefill \(optimized)", cancelled.isEmpty)
            let (empty, _) = generator.generate(promptIds: [], params: params, eosIds: [])
            c.expect("empty prompt \(optimized)", empty.isEmpty)
            let logits = model.lastLogits(prompt, state: model.makeState()); eval(logits)
            let eos = argMax(logits.reshaped([-1])).item(Int.self)
            let (stopped, es) = generator.generate(promptIds: prompt, params: params, eosIds: [eos])
            c.expect("EOS \(optimized)", stopped.isEmpty && es.finishReason == "stop")
        }
        return c.report()
    }

    /// Same model arithmetic, all logical state, and continuation, tested with
    /// both cache ownership modes. Uses one model and a bounded 640-slot pool.
    public static func optimizationState(modelDir: URL, tokens: Int, variant: String = "compact-state") throws -> CheckReport {
        guard tokens >= 1, tokens <= 2112 else { throw ModelError("state check tokens must be 1...2112") }
        var candidateOptions = InferenceOptimizations()
        switch variant {
        case "packed-layout": break
        case "ngram-lookahead": candidateOptions.ngramLookahead = true
        case "slot-slices": candidateOptions.contiguousSlotWrites = true
        case "slot-words": candidateOptions.wordSlotWrites = true
        case "slot-cpu": candidateOptions.cpuSlotWrites = true
        case "floor-cache": candidateOptions.layerLocalFloorCache = true
        case "read-handles": candidateOptions.directReadHandles = true
        case "compiled-norm": candidateOptions.compiledNormFinish = true
        case "compact-state": candidateOptions.compactStateWindows = true
        case "ngram": candidateOptions.compactNgramRows = true
        case "cache-bookkeeping":
            candidateOptions.ngramRingOrder = true
            candidateOptions.denseExpertLookup = true
            candidateOptions.sparsePoolPins = true
        case "indexer": candidateOptions.incrementalIndexer = true
        case "indexer-raw":
            candidateOptions.incrementalIndexer = true
            candidateOptions.compactIndexerRaw = true
        case "indexer-tiles": candidateOptions.boundedIndexer = true
        case "indexer-dense": candidateOptions.denseIndexerBypass = true
        case "indexer-dense-tiles":
            candidateOptions.denseIndexerBypass = true
            candidateOptions.boundedIndexer = true
        case "indexer-topk":
            candidateOptions.indexerBlockTopK = true
            candidateOptions.boundedIndexer = true
        case "rope": candidateOptions.sharedRoPE = true
        case "rope-fused": candidateOptions.fusedRoPE = true
        case "rope-both":
            candidateOptions.sharedRoPE = true
            candidateOptions.fusedRoPE = true
        case "router": candidateOptions.routerTopK = true
        case "router-weights": candidateOptions.cachedRouterWeights = true
        case "shared-overlap": candidateOptions.overlapSharedExpert = true
        case "resident-overlap": candidateOptions.overlapResidentExperts = true
        case "gdn-record": candidateOptions.fusedGDNRecording = true
        case "gdn-projection": candidateOptions.fusedGDNProjection = true
        case "ple": candidateOptions.boundedPLE = true
        case "workspace":
            candidateOptions.layerExpertWorkspace = true
            candidateOptions.workspaceTokenTile = try InferenceOptimizations.environment().workspaceTokenTile
        case "sweep-placement": candidateOptions.disjointSweepOutput = true
        case "sweep-tiles": candidateOptions.boundedSweepRows = true
        case "sweep-both":
            candidateOptions.disjointSweepOutput = true
            candidateOptions.boundedSweepRows = true
        default: throw ModelError("unknown state-check variant: \(variant)")
        }
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: nil, packGDNProjections: variant == "gdn-projection")
        var c = CheckBuilder("optimization-state-\(variant)")
        if variant == "packed-layout", !model.pool.hasPackedLayout {
            throw ModelError("packed-layout state check requires SLOTSTREAM_EXPERT_LAYOUT")
        }
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var candidateRouting = false
        var referenceRoutes: [Int: [Int32]] = [:], candidateRoutes: [Int: [Int32]] = [:]
        var latestReferenceRoutes: [Int: [Int32]] = [:]
        if variant == "resident-overlap" || variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            model.routerObserver = { layer, ids in
                if candidateRouting { candidateRoutes[layer, default: []].append(contentsOf: ids) }
                else {
                    referenceRoutes[layer, default: []].append(contentsOf: ids)
                    latestReferenceRoutes[layer] = ids
                }
            }
        }
        func controls(_ candidate: Bool) {
            candidateRouting = candidate
            // A reference immediately followed by the same one-token candidate
            // otherwise warms all requested experts and never exercises overlap.
            // Deliberately retain half of each observed route at the same pool
            // capacity. Only correctness runs do this; serving remains natural.
            if variant == "resident-overlap", candidate,
               latestReferenceRoutes.count == model.runLayers,
               latestReferenceRoutes.values.allSatisfy({ $0.count == model.cfg.topK }) {
                model.pool.unpinAll(); model.pool.resize(to: 1)
                let absent = (0..<model.cfg.numExperts).first {
                    !latestReferenceRoutes[0]!.contains(Int32($0))
                }!
                _ = model.pool.ensure([ExpertKey(0, absent)])
                model.pool.unpinAll(); model.pool.resize(to: 640)
                let warm = latestReferenceRoutes.keys.sorted().flatMap { layer in
                    latestReferenceRoutes[layer]!.prefix(model.cfg.topK / 2).map { ExpertKey(layer, Int($0)) }
                }
                _ = model.pool.ensure(warm); model.pool.unpinAll()
            }
            if !candidate { latestReferenceRoutes.removeAll(keepingCapacity: true) }
            if variant == "packed-layout" { model.pool.usePackedLayout = candidate }
            if variant == "ngram-lookahead" {
                model.ngram.compactRows = true; model.ngram.compactRows = false
            }
            model.optimizations = candidate ? candidateOptions : InferenceOptimizations()
        }
        func run(_ compact: Bool) -> (Qwen4ExpModel.State, MLXArray) {
            controls(compact)
            let state = model.makeState()
            let logits = model.lastLogits(ids, state: state)
            eval(logits)
            return (state, logits)
        }
        let (reference, refLogits) = run(false)
        let (candidate, gotLogits) = run(true)
        func equal(_ name: String, _ a: MLXArray, _ b: MLXArray) {
            c.expect(name, a.shape == b.shape && a.dtype == b.dtype && (a .== b).all().item(Bool.self))
        }
        func compare(_ label: String) {
            let a = reference.diagnosticTensors(), b = candidate.diagnosticTensors()
            let bases = candidate.diagnosticIndexerBases()
            c.equal("\(label): state fields", Set(a.keys), Set(b.keys))
            for k in a.keys.sorted() {
                if let v = b[k] {
                    let original = a[k]!
                    let base = bases[k] ?? 0
                    let expected = base > 0 ? original[0..., base ..< original.dim(1), 0...] : original
                    equal("\(label): \(k)", expected, v)
                }
            }
        }
        equal("prefill logits", refLogits, gotLogits)
        compare("prefill")
        if variant == "indexer-raw", tokens > model.cfg.indexerBudget {
            c.expect("completed main indexers release raw prefixes", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > 0 })
            c.measure("reference_sequence_bytes", Double(reference.allocatedSequenceBytes))
            c.measure("candidate_sequence_bytes", Double(candidate.allocatedSequenceBytes))
        }
        // Rollback from every possible kept length of a verify pass, followed
        // by a different continuation. Captures GDN/PLE, KV/indexer and history.
        for keep in 1 ... 3 {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let verify = [1137, 732, 2091]
            controls(false)
            reference.setRecording(true)
            let r = model.allLogitsWithMulti(verify, state: reference); eval(r.logits, r.multi)
            reference.rollback(keeping: keep, of: verify, from: rc, ngramWindow: model.cfg.ngramSize - 1)
            controls(true)
            candidate.setRecording(true)
            let g = model.allLogitsWithMulti(verify, state: candidate); eval(g.logits, g.multi)
            candidate.rollback(keeping: keep, of: verify, from: cc, ngramWindow: model.cfg.ngramSize - 1)
            equal("verify \(keep) logits", r.logits, g.logits)
            compare("rollback \(keep)")
            controls(false)
            let rn = model.lastLogits([907], state: reference); eval(rn)
            controls(true)
            let gn = model.lastLogits([907], state: candidate); eval(gn)
            equal("continued logits after keep \(keep)", rn, gn)
            compare("continuation \(keep)")
            reference.restore(rc); candidate.restore(cc)
            compare("restored \(keep)")
        }
        if variant == "indexer-raw" {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let extensionIds = Array(repeating: 907, count: 513)
            controls(false)
            let r = model.lastLogits(extensionIds, state: reference); eval(r)
            controls(true)
            let g = model.lastLogits(extensionIds, state: candidate); eval(g)
            equal("long transaction logits", r, g)
            compare("long transaction")
            if tokens > model.cfg.indexerBudget {
                c.expect("long append releases rows beyond checkpoint offset", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > tokens })
            }
            reference.restore(rc); candidate.restore(cc)
            compare("long transaction restored")
            controls(false); let rNext = model.lastLogits([1137, 908], state: reference); eval(rNext)
            controls(true); let gNext = model.lastLogits([1137, 908], state: candidate); eval(gNext)
            equal("continuation after restoring released history", rNext, gNext)
            compare("restored long continuation")
        }
        if variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            c.equal("ordered router traces across prefill, verify and continuation", candidateRoutes, referenceRoutes)
        }
        if variant == "packed-layout" {
            c.expect("candidate performed verified-layout reads",model.pool.packedRecordsRead > 0)
            c.expect("layout stayed valid through all transactions",model.pool.hasPackedLayout)
            c.measure("packed_records_read",Double(model.pool.packedRecordsRead))
        }
        if variant == "ngram-lookahead" {
            c.expect("candidate consumed asynchronous rows",model.ngram.lookaheadRowsConsumed > 0)
            c.expect("all lookahead workers joined",!model.ngram.hasPendingPrefetch)
            c.measure("lookahead_rows_consumed",Double(model.ngram.lookaheadRowsConsumed))
        }
        if variant == "slot-slices" {
            c.expect("candidate used contiguous slot writes", model.pool.slotSliceBatches > 0)
            c.measure("slot_slice_batches", Double(model.pool.slotSliceBatches))
            c.measure("slot_slice_runs", Double(model.pool.slotSliceRuns))
            c.measure("slot_scatter_batches", Double(model.pool.slotScatterBatches))
        }
        if variant == "slot-cpu" {
            c.expect("candidate used CPU slot writes", model.pool.slotCPUBatches > 0)
            c.measure("slot_cpu_batches", Double(model.pool.slotCPUBatches))
        }
        if variant == "slot-words" {
            c.expect("candidate used word slot writes", model.pool.slotWordBatches > 0)
            c.equal("six packed BF16 pieces per used batch", model.pool.slotWordBuffers, model.pool.slotWordBatches * 6)
            c.measure("slot_word_batches", Double(model.pool.slotWordBatches))
            c.measure("slot_word_buffers", Double(model.pool.slotWordBuffers))
        }
        if variant == "router-weights" {
            c.equal("promoted routers charged in full", model.cachedRouterBytes,
                model.runLayers * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            c.measure("additional_cached_router_bytes", Double(model.cachedRouterBytes))
            controls(false)
            let released = model.lastLogits([908], state: reference); eval(released)
            c.equal("disabling router cache releases promoted tensors", model.cachedRouterBytes, 0)
        }
        if variant == "cache-bookkeeping" {
            c.equal("direct map actually allocated", model.pool.denseLookupBytes, model.cfg.numLayers * model.cfg.numExperts * 4)
            controls(false)
            eval(model.lastLogits([908], state: reference))
            c.equal("direct map released after disabling", model.pool.denseLookupBytes, 0)
        }
        if variant == "compiled-norm" {
            c.expect("compiled pointwise normalization actually executed", model.compiledNormFinishes > 0)
            c.measure("compiled_norm_calls", Double(model.compiledNormFinishes))
        }
        if variant == "read-handles" {
            c.equal("all stream tensors have owned descriptors", model.readHandleCount,
                model.cfg.numLayers * 9 + model.cfg.splitNgramParts * 3)
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling releases direct read handles", model.readHandleCount, 0)
        }
        if variant == "resident-overlap" {
            c.expect("resident expert operations actually prelaunched", model.residentExpertPrelaunches > 0)
            c.measure("resident_expert_prelaunches", Double(model.residentExpertPrelaunches))
            c.measure("resident_expert_join_seconds", model.residentExpertJoinSeconds)
        }
        if variant == "shared-overlap" {
            c.expect("resident shared projections actually prelaunched", model.sharedExpertPrelaunches > 0)
            c.measure("shared_projection_prelaunches", Double(model.sharedExpertPrelaunches))
        }
        if variant == "gdn-projection" {
            c.equal("every recurrent layer has a shared projection backing", model.resident.packedGDNProjectionLayers,
                model.cfg.layerTypes.filter { $0 == "linear_attention" }.count)
            c.expect("single-token fusion actually scheduled", model.fusedGDNProjectionsScheduled > 0)
            let before = model.fusedGDNProjectionsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabled fusion preserves separate projection dispatch", model.fusedGDNProjectionsScheduled, before)
            c.measure("shared_projection_payload_bytes", Double(model.resident.packedGDNProjectionPayloadBytes))
        }
        if variant == "rope-fused" || variant == "rope-both" {
            c.expect("fused rotations scheduled on evaluated paths", model.fusedRoPERotationsScheduled > 0)
            c.measure("fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            let before = model.fusedRoPERotationsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling fusion returns to original dispatch", model.fusedRoPERotationsScheduled, before)
        }
        if variant == "rope" || variant == "rope-both" {
            c.expect("angle tables actually reused", model.ropeTableHits > 0)
            c.measure("rope_table_hits", Double(model.ropeTableHits))
            c.measure("rope_table_builds", Double(model.ropeTableBuilds))
        }
        if variant == "indexer-topk" {
            c.expect("specialized block rows actually scheduled", model.indexerSpecializedRows > 0)
            c.measure("specialized_block_rows", Double(model.indexerSpecializedRows))
        }
        c.measure("prompt_tokens", Double(tokens))
        if variant == "ngram" || variant == "cache-bookkeeping" {
            // Force FIFO eviction, a prefetch larger than capacity, row hits,
            // mode changes, and EOS history boundaries without huge fixtures.
            let index = try CheckpointIndex(dir: modelDir)
            for capacity in [1, 7, 31] {
                let a = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                let b = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                b.compactRows = true
                b.ringEvictionOrder = variant == "cache-bookkeeping"
                for history in [[Int64(model.cfg.eosTokenId), 37, 52, 81], [37, Int64(model.cfg.eosTokenId), 81, 52], [37, 52, 81, 37]] {
                    let av = a.embedding(history: history, nNew: 2)
                    let bv = b.embedding(history: history, nNew: 2)
                    equal("ngram capacity \(capacity), history \(history)", av, bv)
                    c.equal("ngram cache size \(capacity)", a.cachedRowCount, b.cachedRowCount)
                    c.equal("ngram payload halves \(capacity)", a.cachedPayloadBytes, 2 * b.cachedPayloadBytes)
                }
                c.equal("ngram repeated row \(capacity)", a.debugRow(12345), b.debugRow(12345))
                c.equal("ngram row reuse \(capacity)", a.debugRow(12345), b.debugRow(12345))
            }
        }
        c.measure("physical_footprint_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/scope-combination-preparation-v170/Diagnostics+PrefillQualification.swift.before` — 10741 bytes, SHA-256 `c04eef5fdb8c51f98603ab09e4c4f3be8047e2df425118d5016ca779ba2ac246`.

````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Three chronological schedules, one model and one bounded pool. The
    /// 512-token control measures existing rechunking drift relative to 256;
    /// the bounded candidate uses up to 4096 tokens. These are numerical and
    /// state gates only, never performance or peak-memory observations.
    public static func optimizationPrefillFamily(modelDir: URL, tokens: Int, scoped: Bool = false, selectedAttention: Bool = false, terminalPrefill: Bool = false, terminalQuery: Bool = false) throws -> CheckReport {
        guard [1024, 2051, 4096, 8192].contains(tokens) else {
            throw ModelError("prefill family tokens must be 1024, 2051, 4096 or 8192")
        }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        var options = InferenceOptimizations()
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
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        let chunks = [256, 512, (selectedAttention || terminalPrefill) ? 256 : min(4096, tokens)]
        let states = chunks.map { _ in model.makeState() }
        var logits: [MLXArray] = []
        var traces: [[Int: [Int32]]] = []
        for (arm, chunk) in chunks.enumerated() {
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

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/scope-combination-preparation-v170/OptimizationCommands.swift.before` — 17811 bytes, SHA-256 `5c1b9570a4836d01312bff2c8af8c565df12598e79e724831fa20fafc6aa2eef`.

````text
import ArgumentParser
import Foundation
import Slotstream
import SlotstreamDiagnostics

struct OptimizationStateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "optimization-state-check",
        abstract: "Compare retained state and continued logits across optimization controls")
    @OptionGroup var model: ModelOptions
    @Option var tokens: Int = 256
    @Flag var json = false
    @Flag(help: "Check output limits, pending token ownership, EOS and cancellation")
    var generation = false
    @Option(help: "Candidate to compare: integrated | integrated-mtp | compute-islands | compute-islands-performance | slot-cpu-component | terminal-prefill-lifecycle | mtp-terminal-prefill | terminal-prefill-family | selected-attention-component | selected-attention-family | compact-state | compiled-norm | compiled-norm-component | mtp-compiled-norm | ngram | cache-bookkeeping | cache-containers | exact-read | read-handles | mtp-read-handles | read-handle-lifetime | mtp-cache-bookkeeping | mtp | indexer | sweep-placement | sweep-tiles | sweep-both | indexer-tiles | indexer-dense | indexer-dense-tiles | indexer-topk | indexer-visibility | rope | gdn-record | gdn-kernel | ple | workspace | scope | scope-256 | scope-lifecycle | scope-mtp-vision | mtp-work | lifecycle | output | router-weights | mtp-router-weights | router-projection | router-selection | block-selection | router | mtp-router | mtp-indexer | image-reuse | vision-attention | shared-overlap | prefill-family") var variant = "compact-state"

    func run() throws {
        let report: CheckReport
        if generation { report = try Diagnostics.optimizationGeneration(modelDir: model.modelURL) }
        else if ["runtime-budget-lifecycle", "governor-boundary", "governor-boundary-mtp", "read-failure-serving", "output-serving"].contains(variant) {
            // This executable has a synchronous root, as do its existing
            // Engine-backed commands. Bridge only the tokenizer load here.
            let ready = DispatchSemaphore(value: 0)
            var result: Result<CheckReport, Error>?
            Task {
                do {
                    if variant == "output-serving" {
                        result = .success(try await Diagnostics.optimizationOutputServing(modelDir: model.modelURL))
                    } else if variant == "read-failure-serving" {
                        result = .success(try await Diagnostics.optimizationReadFailureServing(modelDir: model.modelURL))
                    } else if variant == "runtime-budget-lifecycle" {
                        result = .success(try await Diagnostics.optimizationRuntimeBudgetLifecycle(modelDir: model.modelURL))
                    } else {
                        result = .success(try await Diagnostics.optimizationGovernorBoundary(modelDir: model.modelURL, mtp: variant == "governor-boundary-mtp"))
                    }
                }
                catch { result = .failure(error) }
                ready.signal()
            }
            ready.wait()
            report = try result!.get()
        }
        else if variant == "all-hit-replay" { report = try Diagnostics.optimizationAllHitReplay(modelDir: model.modelURL) }
        else if variant == "compute-islands" || variant == "compute-islands-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL, timed: variant == "compute-islands-performance")
        }
        else if variant == "compute-islands-quantized" || variant == "compute-islands-quantized-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL,
                timed: variant == "compute-islands-quantized-performance", quantizedOnly: true)
        }
        else if variant == "gdn-projection-packing" { report = try Diagnostics.optimizationGDNProjectionPacking(modelDir: model.modelURL) }
        else if variant == "gdn-profile" { report = try Diagnostics.optimizationGDNProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "vision-capacity" { report = Diagnostics.optimizationVisionCapacity() }
        else if variant == "vision-tower-capacity" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL) }
        else if variant == "vision-prescaled-capacity" { report = Diagnostics.optimizationVisionCapacity(preserveQueryRounding: true) }
        else if variant == "vision-prescaled-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, preserveQueryRounding: true) }
        else if variant == "resident-overlap-component" { report = try Diagnostics.optimizationResidentOverlap(modelDir: model.modelURL) }
        else if variant == "resident-overlap-recovery" || variant == "resident-overlap-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "resident-overlap-recovery-mtp", residentOverlap: true)
        }
        else if variant == "state-recovery-lineage" { report = try Diagnostics.optimizationStateRecovery(modelDir: model.modelURL) }
        else if variant == "prefix-client-capacity" { report = try Diagnostics.optimizationPrefixCapacity() }
        else if variant == "rope-performance" { report = Diagnostics.optimizationRopePerformance() }
        else if variant == "rope-rotation-component" { report = Diagnostics.optimizationPartialRotation() }
        else if variant == "vision-query-tile-capacity" { report = Diagnostics.optimizationVisionCapacity(queryTile: 256) }
        else if variant == "vision-query-tile-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, queryTile: 256) }
        else if variant == "vision-query-maximum-reference" {
            report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL,
                queryTile: 256, maximumReferenceOnly: true)
        }
        else if variant == "transfer-profile" { report = try Diagnostics.optimizationTransferProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "slot-slices-component" { report = Diagnostics.optimizationSlotSlices() }
        else if variant == "slot-words-component" { report = Diagnostics.optimizationSlotSlices(wordWrites: true) }
        else if variant == "slot-cpu-component" { report = try Diagnostics.optimizationCPUSlotWrites() }
        else if variant == "slot-cpu-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-recovery" || variant == "slot-cpu-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-cpu-recovery-mtp", cpuWrites: true)
        }
        else if variant == "embedding-rows" { report = try Diagnostics.optimizationEmbeddingRows(modelDir: model.modelURL) }
        else if variant == "embedding-runtime" || variant == "embedding-runtime-mtp" {
            report = try Diagnostics.optimizationEmbeddingRuntime(modelDir: model.modelURL, mtp: variant == "embedding-runtime-mtp")
        }
        else if variant == "integrated-gdn-projection" || variant == "integrated-gdn-projection-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-gdn-projection-mtp", gdnProjection: true)
        }
        else if variant == "integrated-rope" || variant == "integrated-rope-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-rope-mtp", ropeFusion: true)
        }
        else if variant == "integrated" || variant == "integrated-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL, mtp: variant == "integrated-mtp")
        }
        else if variant == "integrated-vision-query" || variant == "integrated-vision-query-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-vision-query-mtp", visionQueryTile: true)
        }
        else if variant == "prefix-vision" || variant == "prefix-vision-mtp" {
            report = try Diagnostics.optimizationPrefixVision(modelDir: model.modelURL, mtp: variant == "prefix-vision-mtp")
        }
        else if variant == "complete-prompt" || variant == "complete-prompt-mtp" {
            report = try Diagnostics.optimizationCompletePrompt(modelDir: model.modelURL, mtp: variant == "complete-prompt-mtp")
        }
        else if variant == "prefix-retention" || variant == "prefix-retention-mtp" {
            report = try Diagnostics.optimizationPrefixRetention(modelDir: model.modelURL, mtp: variant == "prefix-retention-mtp")
        }
        else if variant == "prefix-fork" || variant == "prefix-fork-mtp" {
            report = try Diagnostics.optimizationPrefixFork(modelDir: model.modelURL, tokens: tokens, mtp: variant == "prefix-fork-mtp")
        }
        else if variant == "slot-words-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-recovery" || variant == "slot-words-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-words-recovery-mtp", wordWrites: true)
        }
        else if variant == "slot-slices-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-recovery" || variant == "slot-slices-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-slices-recovery-mtp", slotSlices: true)
        }
        else if variant == "image-failure" { report = try Diagnostics.optimizationImageFailure(modelDir: model.modelURL) }
        else if variant == "pool-requests" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL) }
        else if variant == "packed-layout-component" { report = try Diagnostics.optimizationPackedLayout() }
        else if variant == "ngram-lookahead-rows" { report = try Diagnostics.optimizationNgramLookahead(modelDir:model.modelURL) }
        else if variant == "ngram-lookahead-ticket" { report = try Diagnostics.optimizationNgramPrefetchTicket() }
        else if variant == "ngram-lookahead-recovery" || variant == "ngram-lookahead-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir:model.modelURL,
                mtp:variant == "ngram-lookahead-recovery-mtp",lookahead:true)
        }
        else if variant == "packed-layout-storage" { report = try Diagnostics.optimizationPackedStorage(modelDir:model.modelURL) }
        else if variant == "packed-layout-recovery" || variant == "packed-layout-recovery-mtp" {
            report = try Diagnostics.optimizationPackedRecovery(modelDir:model.modelURL,mtp:variant == "packed-layout-recovery-mtp")
        }
        else if variant == "read-recovery" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL) }
        else if variant == "request-read-recovery" || variant == "request-read-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL, mtp: variant == "request-read-recovery-mtp")
        }
        else if variant == "sampler-performance" { report = Diagnostics.optimizationSamplerPerformance() }
        else if variant == "adaptive-mtp" { report = try Diagnostics.optimizationAdaptiveMTP(modelDir: model.modelURL) }
        else if variant == "adaptive-sensitivity" { report = try Diagnostics.optimizationAdaptiveSensitivity(modelDir: model.modelURL) }
        else if variant == "mtp-floor-cache" { report = try Diagnostics.optimizationMTPFloorCache(modelDir: model.modelURL) }
        else if variant == "floor-cache-mechanism" { report = try Diagnostics.optimizationFloorCacheMechanism(modelDir: model.modelURL) }
        else if variant == "indexer-raw-component" { report = Diagnostics.optimizationCompactIndexer() }
        else if variant == "read-handle-lifetime" { report = try Diagnostics.optimizationReadHandles(modelDir: model.modelURL) }
        else if variant == "mtp-read-handles" { report = try Diagnostics.optimizationMTPReadHandles(modelDir: model.modelURL) }
        else if variant == "selected-attention-component" { report = Diagnostics.optimizationSelectedAttention() }
        else if variant == "selected-attention-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, selectedAttention: true) }
        else if variant == "terminal-query-family" {
            report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                terminalPrefill: true, terminalQuery: true)
        }
        else if variant == "terminal-query-lifecycle" {
            report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL, lastQuery: true)
        }
        else if variant == "terminal-prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, terminalPrefill: true) }
        else if variant == "terminal-prefill-lifecycle" { report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-terminal-query" {
            report = try Diagnostics.optimizationMTPTerminalQuery(modelDir: model.modelURL)
        }
        else if variant == "mtp-terminal-prefill" { report = try Diagnostics.optimizationMTPTerminalPrefill(modelDir: model.modelURL) }
        else if variant == "exact-read" { report = Diagnostics.optimizationExactRead() }
        else if variant == "mtp-compiled-norm" { report = try Diagnostics.optimizationMTPCompiledNorm(modelDir: model.modelURL) }
        else if variant == "compiled-norm-component" { report = try Diagnostics.optimizationCompiledNorm() }
        else if variant == "cache-containers" { report = Diagnostics.optimizationCacheBookkeeping() }
        else if variant == "mtp-cache-bookkeeping" { report = try Diagnostics.optimizationMTPCacheBookkeeping(modelDir: model.modelURL) }
        else if variant == "router-selection" { report = Diagnostics.optimizationRouterSelection() }
        else if variant == "router-projection" { report = Diagnostics.optimizationRouterProjection() }
        else if variant == "block-selection" { report = Diagnostics.optimizationBlockSelection() }
        else if variant == "indexer-visibility" { report = Diagnostics.optimizationIndexerVisibility() }
        else if variant == "prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "scope-256" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, scoped: true) }
        else if variant == "output" { report = try Diagnostics.optimizationOutput() }
        else if variant == "output-tcp" { report = try Diagnostics.optimizationOutputTCP() }
        else if variant == "scope-mtp-vision" { report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL) }
        else if variant == "mtp-work" { report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL) }
        else if variant == "scope-lifecycle" { report = try Diagnostics.optimizationScopeLifecycle(modelDir: model.modelURL) }
        else if variant == "scope" { report = try Diagnostics.optimizationReadScope(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "gdn-kernel" { report = Diagnostics.optimizationGDNKernel() }
        else if variant == "lifecycle" { report = try Diagnostics.optimizationLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-indexer" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL) }
        else if variant == "mtp-indexer-raw" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL, rawCompact: true) }
        else if variant == "image-reuse" { report = try Diagnostics.optimizationImageReuse(modelDir: model.modelURL) }
        else if variant == "vision-attention" { report = Diagnostics.optimizationVisionAttention() }
        else if variant == "mtp-router" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL, router: true) }
        else if variant == "mtp-router-weights" { report = try Diagnostics.optimizationMTPRouterWeights(modelDir: model.modelURL) }
        else if variant == "mtp" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL) }
        else { report = try Diagnostics.optimizationState(modelDir: model.modelURL, tokens: tokens, variant: variant) }
        if json {
            let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            print(String(data: try encoder.encode(report), encoding: .utf8)!)
        } else {
            for item in report.items { print("\(item.passed ? "PASS" : "FAIL")  \(item.name)") }
        }
        if !report.passed { throw ExitCode.failure }
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/scope-combination-preparation-v170/static.txt` — 347 bytes, SHA-256 `f2a92fc216f8bc8257bff3feb872add98e9e88d5ffbf38cc3090fb28c3b7eda1`.

````text
{"draft": "/tmp/slotstream-optimization-execution/scope-combined-serving-draft-v170.json", "sha256": "8fd8e7fd29ebcc909b384a6ee41336fc8b159ac2c1415d9ccbe2482c9c691048", "passed_static_checks": true, "unrun": true, "required_base_reclaimable_gb": 13, "candidate_additional_preflight_gb": 7.112, "explicit_controls": {"reference": 54, "scope": 54}}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift` — 56225 bytes, SHA-256 `09740bc89178780c21bd778a3a8e07d55ad867691e050619a4d29c9e1d6ab8be`.

````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Numerical/read-count probe only. Several states coexist for comparison;
    /// its resource and duration observations are not fresh-process A/B claims.
    public static func optimizationReadScope(modelDir: URL, tokens: Int) throws -> CheckReport {
        guard [4096, 8192].contains(tokens) else { throw ModelError("scope probe tokens must be 4096 or 8192") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var c = CheckBuilder("optimization-layer-read-scope")
        c.measure("workspace_token_tile", Double(model.optimizations.workspaceTokenTile))
        func build(chunk: Int, workspace: Bool) -> (Qwen4ExpModel.State, MLXArray, [Int: [Int32]], Int) {
            var options = InferenceOptimizations()
            options.compactStateWindows = true
            options.boundedIndexer = true
            options.boundedPLE = true
            options.layerExpertWorkspace = workspace
            options.workspaceTokenTile = model.optimizations.workspaceTokenTile
            options.compactScopeFrontier = model.optimizations.compactScopeFrontier
            model.optimizations = options
            model.pool.resetStats()
            model.pool.admitOnSweep = false
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
            let state = model.makeState()
            var last = MLXArray(Float(0))
            for lo in stride(from: 0, to: tokens, by: chunk) {
                last = model.lastLogits(Array(ids[lo ..< min(tokens, lo + chunk)]), state: state)
                eval(last)
            }
            model.routerObserver = nil
            return (state, last, routes, model.pool.recordsFetched)
        }
        let (reference, referenceLogits, referenceRoutes, referenceReads) = build(chunk: 4096, workspace: false)
        let (control, controlLogits, controlRoutes, controlReads) = build(chunk: 1024, workspace: false)
        let (candidate, candidateLogits, candidateRoutes, candidateReads) = build(chunk: tokens, workspace: true)
        func relative(_ a: MLXArray, _ b: MLXArray, spread: Bool = false) -> Double {
            guard a.shape == b.shape, a.dtype == b.dtype else { return .infinity }
            let af = a.asType(.float32), bf = b.asType(.float32)
            let delta = abs(af - bf).max().item(Float.self)
            let denominator = spread ? (bf.max() - bf.min()).item(Float.self) : abs(bf).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        let controlDelta = relative(controlLogits, referenceLogits, spread: true)
        let candidateDelta = relative(candidateLogits, referenceLogits, spread: true)
        c.measure("control_logit_spread_fraction", controlDelta)
        c.measure("candidate_logit_spread_fraction", candidateDelta)
        c.expect("logits inside preregistered rechunk band", candidateDelta <= max(3 * controlDelta, 0.01))
        c.equal("greedy final token", argMax(candidateLogits.reshaped([-1])).item(Int.self), argMax(referenceLogits.reshaped([-1])).item(Int.self))
        let rt = reference.diagnosticTensors(), ct = control.diagnosticTensors(), nt = candidate.diagnosticTensors()
        c.equal("candidate state fields", Set(nt.keys), Set(rt.keys))
        for key in rt.keys.sorted() {
            if let controlValue = ct[key], let candidateValue = nt[key] {
                if key == "tokens" || key == "ngram" {
                    c.expect("exact \(key)", (rt[key]! .== candidateValue).all().item(Bool.self))
                } else {
                    let baseline = relative(controlValue, rt[key]!)
                    let changed = relative(candidateValue, rt[key]!)
                    c.measure("control.\(key)", baseline)
                    c.measure("candidate.\(key)", changed)
                    c.expect("state band \(key)", changed <= max(3 * baseline, 0.01))
                }
            }
        }
        func routeDisagreement(_ routes: [Int: [Int32]]) -> Double {
            var different = 0, total = 0
            var stamps = [Int](repeating: 0, count: model.cfg.numExperts)
            var stamp = 0
            for layer in referenceRoutes.keys.sorted() {
                let ref = referenceRoutes[layer]!, got = routes[layer] ?? []
                guard ref.count == got.count else { return .infinity }
                for lo in stride(from: 0, to: ref.count, by: model.cfg.topK) {
                    stamp += 1
                    for i in lo ..< lo + model.cfg.topK { stamps[Int(ref[i])] = stamp }
                    for i in lo ..< lo + model.cfg.topK {
                        if stamps[Int(got[i])] != stamp { different += 1 }
                        total += 1
                    }
                }
            }
            return Double(different) / Double(max(1, total))
        }
        let ctrlRoutes = routeDisagreement(controlRoutes), newRoutes = routeDisagreement(candidateRoutes)
        c.measure("control_route_set_disagreement", ctrlRoutes)
        c.measure("candidate_route_set_disagreement", newRoutes)
        c.expect("routing inside preregistered rechunk band", newRoutes <= max(3 * ctrlRoutes, 0.01))
        c.measure("reference_read_records", Double(referenceReads))
        c.measure("control_read_records", Double(controlReads))
        c.measure("candidate_read_records", Double(candidateReads))
        c.expect("one record at most per layer/expert in a scope", candidateReads <= model.runLayers * model.cfg.numExperts)
        if tokens > 4096 { c.expect("larger scope reads fewer records", candidateReads < referenceReads) }
        c.measure("probe_process_footprint_end_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }

    public static func optimizationScopeLifecycle(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true
        options.layerExpertWorkspace = true; options.skipUnusedFinalForward = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        var c = CheckBuilder("optimization-scope-lifecycle")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined scope lifecycle uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        let prompt = (0 ..< 1280).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy; params.maxTokens = 1; params.seed = 7
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        func seed() -> PrefixCache {
            let cache = PrefixCache(maxTokens: 8192)
            let state = model.makeState()
            eval(model.lastLogits(Array(prompt.prefix(256)), state: state))
            cache.store(state: state, tokens: Array(prompt.prefix(256)))
            return cache
        }
        let referenceCache = seed(), candidateCache = seed()
        let seedState = referenceCache.take(matching: prompt, reserveTokens: 2048)!.state
        let untouched = seed()
        params.maxTokens = 1
        let (referenceIds, referenceStats) = generator.generate(promptIds: prompt, params: params,
            eosIds: [], cache: untouched)
        let referenceState = untouched.take(matching: prompt + referenceIds + [907], reserveTokens: 2048)!.state
        model.optimizations.readScopeTokens = 1024
        for cutLayer in [0, 1, 3, 47] {
            var layer = -1
            model.routerObserver = { current, _ in layer = current }
            let savedLimit = MLX.Memory.cacheLimit
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache,
                shouldContinue: { layer < cutLayer })
            model.routerObserver = nil
            c.expect("layer \(cutLayer): cancel emits no token", ids.isEmpty)
            c.equal("layer \(cutLayer): abort counted", stats.abortedReadScopes, 1)
            c.equal("layer \(cutLayer): no partial commit", stats.prefillTokens, 0)
            c.expect("layer \(cutLayer): no completed passes", stats.prefillPasses.isEmpty)
            c.equal("layer \(cutLayer): cache limit restored", MLX.Memory.cacheLimit, savedLimit)
            c.expect("layer \(cutLayer): admission restored", !model.pool.admitOnSweep)
            let hit = candidateCache.take(matching: prompt, reserveTokens: 2048)!
            c.equal("layer \(cutLayer): exact committed prefix", hit.reused, 256)
            equalState(seedState, hit.state, "layer \(cutLayer): restored state")
            candidateCache.store(state: hit.state, tokens: Array(prompt.prefix(256)))
        }
        let (candidateIds, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache)
        c.equal("retry exact output", candidateIds, referenceIds)
        c.equal("reference compute schedule", referenceStats.prefillComputePasses, [256, 256, 256, 256])
        c.equal("candidate preserves compute schedule", stats.prefillComputePasses, referenceStats.prefillComputePasses)
        c.equal("candidate commits one read scope", stats.prefillPasses, [1024])
        let candidateState = candidateCache.take(matching: prompt + candidateIds + [907], reserveTokens: 2048)!.state
        equalState(referenceState, candidateState, "retry exact continuation")
        c.expect("capacity remains charged after abort and growth", candidateState.allocatedSequenceBytes > 0)
        if integratedBase {
            c.expect("combined scope lifecycle executes fused rotation", model.fusedRoPERotationsScheduled > 0)
            c.equal("combined scope lifecycle returns an idle pool", model.pool.pinnedSlotCount, 0)
        }
        return c.report()
    }

    /// Synthetic already-encoded image rows isolate span/offset/state
    /// handling. The separate real-image serving gate covers tower execution.
    public static func optimizationScopeMTPVision(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let head = model.mtpHead!
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true; options.layerExpertWorkspace = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        let ids = (0 ..< 1024).map { 1000 + (($0 * 7919) % 200_000) }
        let rows = MLXArray((0 ..< 640 * model.cfg.hiddenSize).map { Float($0 % 29 - 14) / 32 },
            [640, model.cfg.hiddenSize]).asType(.bfloat16)
        eval(rows)
        let run = VisionRun(start: 128, rows: rows)
        var c = CheckBuilder("optimization-scope-mtp-vision")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined MTP/vision scope uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        func equal(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let av = a.diagnosticTensors(), bv = b.diagnosticTensors()
            c.equal("\(name): fields", Set(av.keys), Set(bv.keys))
            for key in av.keys.sorted() {
                if let v = bv[key] { c.expect("\(name): \(key)", av[key]!.shape == v.shape && (av[key]! .== v).all().item(Bool.self)) }
            }
        }
        func consume(_ state: Qwen4ExpModel.State, _ range: Range<Int>) -> MLXArray {
            let chunk = Array(ids[range]), vision = [run.clipped(to: range.lowerBound, range.upperBound)].compactMap { $0 }
            let (mixed, multi) = model.hiddenStatesWithMulti(chunk, state: state, vision: vision)
            state.lastMulti = head.consume(chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                resident: model.resident, rope: model.sharedRope, state: state.mtp!, vision: vision, compactRetainedRow: true)
            eval(mixed); return mixed
        }
        func seed() -> Qwen4ExpModel.State {
            let state = model.makeState(); state.mtp = MTPState()
            _ = consume(state, 0 ..< 256); return state
        }
        let seedState = seed(), reference = seed(), candidate = seed()
        for lo in stride(from: 256, to: 1024, by: 256) { _ = consume(reference, lo ..< lo + 256) }
        let remaining = Array(ids[256...]), vision = [run.clipped(to: 256, 1024)!]
        var layer = -1, checksAfterLast = 0
        model.routerObserver = { current, _ in layer = current }
        let cancelled = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: {
                if layer == model.runLayers - 1 { checksAfterLast += 1; return checksAfterLast < 3 }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel during second draft-head tile", !cancelled.committed && checksAfterLast == 3)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        c.expect("cancel restores valid draft prefix", candidate.hasValidMTP)
        equal(seedState, candidate, "image/MTP rollback")
        let result = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("retry commits scope", result.committed && result.logits != nil)
        c.expect("retry draft aligned", candidate.hasValidMTP)
        equal(reference, candidate, "image/MTP continuation")
        let r = model.lastLogits([907], state: reference), n = model.lastLogits([907], state: candidate)
        c.expect("next target logits exact", (r .== n).all().item(Bool.self))
        if integratedBase {
            c.expect("combined MTP/vision scope executes fused rotation", model.fusedRoPERotationsScheduled > 0)
        }
        return c.report()
    }

    public static func optimizationMTPWork(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        model.optimizations = InferenceOptimizations()
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.fusedGDNRecording = true
        var c = CheckBuilder("optimization-mtp-work")
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for depth in [1, 3] {
            generator.draftDepth = depth
            for limit in [1, 2, 5] {
                var params = SampleParams.greedy; params.maxTokens = limit; params.seed = 7
                model.optimizations.reuseFirstMTPEntry = false
                model.optimizations.boundedDraftTail = false
                let (reference, _) = generator.generate(promptIds: prompt, params: params, eosIds: [])
                for mode in ["first", "tail", "both"] {
                    model.optimizations.reuseFirstMTPEntry = mode != "tail"
                    model.optimizations.boundedDraftTail = mode != "first"
                    let cache = PrefixCache(maxTokens: 4096)
                    let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
                    let name = "depth \(depth), limit \(limit), \(mode)"
                    c.equal("\(name): emitted count", ids.count, limit)
                    c.equal("\(name): stable fixture output", ids, reference)
                    let hit = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)!
                    c.expect("\(name): aligned draft", hit.state.hasValidMTP)
                    c.expect("\(name): consumed prefix within emitted tokens",
                        hit.state.tokenCount >= prompt.count && hit.state.tokenCount <= prompt.count + ids.count)
                    c.equal("\(name): reconciliation covers committed positions",
                        stats.reconciledHeadTokens + stats.reusedHeadTokens, hit.state.tokenCount - prompt.count)
                    if limit == 1 { c.equal("\(name): no terminal verification", stats.verifyPasses, 0) }
                    if limit == 2 && mode != "first" {
                        c.equal("\(name): terminal output needs zero drafts", stats.draftedTokens, 0)
                        c.equal("\(name): one target position suffices", stats.decodeModelTokens, 1)
                        c.equal("\(name): final emission stays pending", hit.state.tokenCount, prompt.count + 1)
                    }
                    if limit > 1 && mode == "first" {
                        c.equal("\(name): first entry reused each round", stats.reusedHeadTokens, stats.verifyPasses)
                    }
                }
            }
        }
        return c.report()
    }

    public static func optimizationGDNKernel() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-gdn-recording-kernel")
        func values(_ shape: [Int], scale: Float) -> MLXArray {
            let count = shape.reduce(1, *)
            return MLXArray((0 ..< count).map { Float(($0 * 7919) % 127 - 63) * scale }, shape)
        }
        for T in [1, 2, 3, 5, 17, 18] {
            for dims in [(2, 4, 32, 8), (2, 4, 128, 128), (1, 2, 33, 8)] {
                let (Hk, Hv, Dk, Dv) = dims
                let B = 2
                let q = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let k = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let v = values([B, T, Hv, Dv], scale: 0.01).asType(.bfloat16)
                let a = values([B, T, Hv], scale: 0.1).asType(.bfloat16)
                let b = -a
                // exp(aLog) overflows for the first head, giving exact zero
                // decay; all other heads retain finite nontrivial memory.
                let aLog = MLXArray((0 ..< Hv).map { $0 == 0 ? Float(100) : Float(-2) })
                let bias = MLXArray.zeros([Hv], dtype: .bfloat16)
                let initial = values([B, Hv, Dv, Dk], scale: 0.01)
                for pattern in 0 ..< 3 {
                    let mask: MLXArray? = pattern == 0 ? nil : MLXArray((0 ..< B * T).map { pattern == 1 && $0 % 2 == 0 }, [B, T])
                    let result = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: a, b: b,
                        aLog: aLog, dtBias: bias, state: initial, mask: mask)
                    eval([result.output] + result.states)
                    var reference = initial
                    var outputs: [MLXArray] = []
                    for t in 0 ..< T {
                        let (y, state) = gatedDeltaUpdate(
                            q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                            a: a[0..., t ..< (t + 1)], b: b[0..., t ..< (t + 1)], aLog: aLog, dtBias: bias,
                            state: reference, mask: mask?[0..., t ..< (t + 1)])
                        reference = state; outputs.append(y)
                        c.expect("T\(T) Dk\(Dk) mask\(pattern) state\(t)", (state .== result.states[t]).all().item(Bool.self))
                    }
                    c.expect("T\(T) Dk\(Dk) mask\(pattern) outputs", (concatenated(outputs, axis: 1) .== result.output).all().item(Bool.self))
                    c.equal("T\(T) Dk\(Dk) mask\(pattern) owns every state", result.states.count, T)
                }
            }
        }
        return c.report()
    }

    public static func optimizationLifecycle(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.skipUnusedFinalForward = true
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var c = CheckBuilder("optimization-lifecycle")
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        let prompt = (0 ..< 270).map { 1000 + $0 * 7 }
        var params = SampleParams.greedy; params.maxTokens = 2; params.seed = 7
        let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
        let (rids, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
        var completed = 0
        var observedBase = -1
        generator.onPrefillProgressAbsolute = { done, _, _, base in completed = done; observedBase = base }
        let beforeLimit = MLX.Memory.cacheLimit
        let (cancelled, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc,
                                                    shouldContinue: { completed < 256 })
        c.expect("cancel emits no token", cancelled.isEmpty)
        c.equal("cancel stores whole pass only", stats.prefillTokens, 256)
        c.equal("cancel restores allocator limit", MLX.Memory.cacheLimit, beforeLimit)
        c.expect("cancel clears admission", !model.pool.admitOnSweep)
        c.equal("cancel prefix retained", cc.heldTokens, 256)
        c.equal("initial absolute base", observedBase, 0)
        let (cids, resumed) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
        c.equal("resume exact IDs", cids, rids)
        c.equal("resume uses committed pass", resumed.reusedPrefixTokens, 256)
        c.equal("resume absolute base", observedBase, 256)
        let next = prompt + cids + [907]
        let rs = rc.take(matching: next, reserveTokens: 512)!.state
        let cs = cc.take(matching: next, reserveTokens: 512)!.state
        equalState(rs, cs, "cancel/retry matches uninterrupted")
        c.expect("actual sequence buffers charge their capacity", cs.allocatedSequenceBytes > cs.tokenCount * PrefixCache.bytesPerToken)
        c.expect("capacity reservation covers buffers", model.sequenceCapacityBytes(tokens: cs.tokenCount, mtp: false) >= cs.allocatedSequenceBytes)
        let logicalOnly = PrefixCache(maxTokens: cs.tokenCount)
        logicalOnly.store(state: cs, tokens: Array(next.prefix(cs.tokenCount)))
        c.equal("token-only allowance cannot hide unused buffer capacity", logicalOnly.heldTokens, 0)
        generator.onPrefillProgressAbsolute = nil
        try model.enableMTP(modelDir: modelDir)
        for firstLimit in [1, 3] {
            let cache = PrefixCache(maxTokens: 4096)
            var ids = [1000, 1079, 25, 1237, 460, 11, 279, 1917]
            generator.speculationEnabled = true
            params.maxTokens = firstLimit
            let (first, _) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            ids += first + [908]
            let hit = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("on \(firstLimit): aligned draft", hit.state.hasValidMTP)
            cache.store(state: hit.state, tokens: Array(ids.prefix(hit.state.tokenCount)))
            generator.speculationEnabled = false
            params.maxTokens = 3
            let (plain, ps) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("off \(firstLimit): reused main prefix", ps.reusedPrefixTokens > 0)
            c.equal("off \(firstLimit): no verification", ps.verifyPasses, 0)
            ids += plain + [909]
            let off = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("off \(firstLimit): draft invalidated", off.state.mtp == nil && off.state.lastMulti == nil)
            cache.store(state: off.state, tokens: Array(ids.prefix(off.state.tokenCount)))
            generator.speculationEnabled = true
            let (_, resumed) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("on again \(firstLimit): reuses main state", resumed.reusedPrefixTokens > 0)
            c.equal("on again \(firstLimit): stale draft never used", resumed.verifyPasses, 0)
            let (_, fresh) = generator.generate(promptIds: [2000, 21, 907, 34], params: params, eosIds: [])
            c.expect("fresh \(firstLimit): speculation available", fresh.verifyPasses > 0)
        }
        return c.report()
    }

    public static func optimizationMTP(modelDir: URL, router: Bool = false) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: router, cachedWeights: false)
    }

    public static func optimizationMTPRouterWeights(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: true)
    }

    public static func optimizationMTPCacheBookkeeping(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, bookkeeping: true)
    }

    public static func optimizationMTPCompiledNorm(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, compiledNorm: true)
    }

    public static func optimizationMTPReadHandles(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, readHandles: true)
    }

    public static func optimizationMTPTerminalPrefill(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, terminalPrefill: true)
    }

    public static func optimizationMTPTerminalQuery(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false,
            terminalPrefill: true, terminalQuery: true)
    }

    public static func optimizationMTPFloorCache(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, floorCache: true)
    }

    private static func optimizationMTPImplementation(modelDir: URL, router: Bool, cachedWeights: Bool, bookkeeping: Bool = false, compiledNorm: Bool = false, readHandles: Bool = false, terminalPrefill: Bool = false, floorCache: Bool = false, terminalQuery: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        var c = CheckBuilder(floorCache ? "optimization-mtp-floor-cache" : terminalPrefill ? "optimization-mtp-terminal-prefill" : readHandles ? "optimization-mtp-read-handles" : compiledNorm ? "optimization-mtp-compiled-norm" : bookkeeping ? "optimization-mtp-cache-bookkeeping" : cachedWeights ? "optimization-mtp-router-weights" : (router ? "optimization-mtp-router" : "optimization-mtp-row"))
        var candidateRouting = false
        var referenceRoutes: [[Int32]] = [], candidateRoutes: [[Int32]] = []
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache {
            model.mtpHead!.routerObserver = { ids in
                if candidateRouting { candidateRoutes.append(ids) }
                else { referenceRoutes.append(ids) }
            }
        }
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for limit in [1, 2, 5] {
            var params = SampleParams.greedy; params.maxTokens = limit
            params.seed = 7
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            candidateRouting = false
            model.optimizations = InferenceOptimizations()
            let (ri, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            candidateRouting = true
            model.optimizations.compactMTPRow = !router && !cachedWeights && !bookkeeping && !compiledNorm && !readHandles && !terminalPrefill && !floorCache
            model.optimizations.routerTopK = router
            model.optimizations.cachedRouterWeights = cachedWeights
            model.optimizations.compiledNormFinish = compiledNorm
            model.optimizations.directReadHandles = readHandles
            model.optimizations.terminalPrefillPruning = terminalPrefill
            model.optimizations.terminalLastQuery = terminalQuery
            model.optimizations.ngramRingOrder = bookkeeping
            model.optimizations.denseExpertLookup = bookkeeping
            model.optimizations.sparsePoolPins = bookkeeping
            model.optimizations.layerLocalFloorCache = floorCache
            let (ci, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            if readHandles { c.equal("MTP handles cover expert and n-gram tensors", model.readHandleCount, 816) }
            if cachedWeights {
                c.equal("MTP limit \(limit): all main/head copies charged", model.cachedRouterBytes,
                    (model.runLayers + 1) * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            }
            c.equal("MTP limit \(limit): exact emitted tokens", ci, ri)
            let r = rc.take(matching: prompt + ri + [907], reserveTokens: 100)!.state
            let g = cc.take(matching: prompt + ci + [907], reserveTokens: 100)!.state
            let rt = r.diagnosticTensors(), gt = g.diagnosticTensors()
            c.equal("MTP limit \(limit): fields", Set(rt.keys), Set(gt.keys))
            for k in rt.keys.sorted() {
                if let v = gt[k] { c.expect("MTP limit \(limit): \(k)", rt[k]!.shape == v.shape && (rt[k]! .== v).all().item(Bool.self)) }
            }
            c.equal("MTP limit \(limit): aligned reference", r.mtp!.offset, r.tokenCount - 1)
            c.equal("MTP limit \(limit): aligned candidate", g.mtp!.offset, g.tokenCount - 1)
            let e = model.resident.embed(MLXArray([Int32(907)], [1, 1])).asType(.bfloat16)
            candidateRouting = false
            model.mtpHead!.usesSpecializedRouter = false
            model.mtpHead!.usesCompiledNorm = false
            let (rs, rm) = model.mtpHead!(embedded: e, hiddenMulti: r.lastMulti!, rope: model.sharedRope, state: r.mtp!)
            candidateRouting = true
            model.mtpHead!.usesSpecializedRouter = router
            model.mtpHead!.usesCompiledNorm = compiledNorm
            let (gs, gm) = model.mtpHead!(embedded: e, hiddenMulti: g.lastMulti!, rope: model.sharedRope, state: g.mtp!)
            c.expect("MTP limit \(limit): future draft sample", (rs .== gs).all().item(Bool.self))
            c.expect("MTP limit \(limit): future draft multi", (rm .== gm).all().item(Bool.self))
        }
        if terminalPrefill {
            let queryStart = model.terminalQueryRowsSkipped, moeStart = model.terminalMoERowsSkipped
            model.optimizations.terminalPrefillPruning = false
            let reference = model.lastLogits(prompt, state: model.makeState())
            model.optimizations.terminalPrefillPruning = true
            let candidate = model.lastLogits(prompt, state: model.makeState())
            c.expect("loaded MTP disables even direct last-row pruning", (reference .== candidate).all().item(Bool.self))
            c.equal("loaded MTP preserves all query rows", model.terminalQueryRowsSkipped, queryStart)
            c.equal("loaded MTP preserves all MoE rows", model.terminalMoERowsSkipped, moeStart)
        }
        if compiledNorm { c.expect("draft norm fusion actually ran", model.mtpHead!.compiledNormFinishes > 0) }
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache { c.equal("ordered draft router traces", candidateRoutes, referenceRoutes) }
        return c.report()
    }

    public static func optimizationGeneration(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        generator.speculationEnabled = false
        var c = CheckBuilder("optimization-generation")
        let prompt = [1000, 1013, 2087, 1102]
        func compare(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ label: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(label): fields", Set(at.keys), Set(bt.keys))
            for k in at.keys.sorted() {
                if let v = bt[k] {
                    c.expect("\(label): \(k)", at[k]!.shape == v.shape && (at[k]! .== v).all().item(Bool.self))
                }
            }
        }
        for limit in [1, 2, 4] {
            var params = SampleParams.greedy; params.maxTokens = limit
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            model.optimizations.skipUnusedFinalForward = false
            let (ri, rs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            model.optimizations.skipUnusedFinalForward = true
            let (ci, cs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            c.equal("limit \(limit): emitted IDs", ci, ri)
            c.equal("limit \(limit): finish", cs.finishReason, rs.finishReason)
            c.equal("limit \(limit): output count", ci.count, limit)
            let next = prompt + ci + [901]
            let r = rc.take(matching: next, reserveTokens: next.count)!
            let g = cc.take(matching: next, reserveTokens: next.count)!
            c.equal("limit \(limit): reference consumed", r.state.tokenCount, prompt.count + limit)
            c.equal("limit \(limit): final token pending", g.state.tokenCount, prompt.count + limit - 1)
            let last = model.lastLogits([ci.last!], state: g.state); eval(last)
            compare(r.state, g.state, "limit \(limit): pending consumed once")
            let rl = model.lastLogits([901], state: r.state); eval(rl)
            let gl = model.lastLogits([901], state: g.state); eval(gl)
            c.expect("limit \(limit): next logits", (rl .== gl).all().item(Bool.self))
            compare(r.state, g.state, "limit \(limit): continuation")
        }
        for optimized in [false, true] {
            model.optimizations.skipUnusedFinalForward = optimized
            var params = SampleParams.greedy; params.maxTokens = 4
            let cache = PrefixCache(maxTokens: 4096)
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                                                  onToken: { _ in false })
            c.equal("callback stop \(optimized): one emission", ids.count, 1)
            c.equal("callback stop \(optimized): reason", stats.finishReason, "stop")
            let state = cache.take(matching: prompt + ids, reserveTokens: 10)!.state
            c.equal("callback stop \(optimized): token remains pending", state.tokenCount, prompt.count)
            let (cancelled, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], shouldContinue: { false })
            c.expect("cancel before prefill \(optimized)", cancelled.isEmpty)
            let (empty, _) = generator.generate(promptIds: [], params: params, eosIds: [])
            c.expect("empty prompt \(optimized)", empty.isEmpty)
            let logits = model.lastLogits(prompt, state: model.makeState()); eval(logits)
            let eos = argMax(logits.reshaped([-1])).item(Int.self)
            let (stopped, es) = generator.generate(promptIds: prompt, params: params, eosIds: [eos])
            c.expect("EOS \(optimized)", stopped.isEmpty && es.finishReason == "stop")
        }
        return c.report()
    }

    /// Same model arithmetic, all logical state, and continuation, tested with
    /// both cache ownership modes. Uses one model and a bounded 640-slot pool.
    public static func optimizationState(modelDir: URL, tokens: Int, variant: String = "compact-state") throws -> CheckReport {
        guard tokens >= 1, tokens <= 2112 else { throw ModelError("state check tokens must be 1...2112") }
        var candidateOptions = InferenceOptimizations()
        switch variant {
        case "packed-layout": break
        case "ngram-lookahead": candidateOptions.ngramLookahead = true
        case "slot-slices": candidateOptions.contiguousSlotWrites = true
        case "slot-words": candidateOptions.wordSlotWrites = true
        case "slot-cpu": candidateOptions.cpuSlotWrites = true
        case "floor-cache": candidateOptions.layerLocalFloorCache = true
        case "read-handles": candidateOptions.directReadHandles = true
        case "compiled-norm": candidateOptions.compiledNormFinish = true
        case "compact-state": candidateOptions.compactStateWindows = true
        case "ngram": candidateOptions.compactNgramRows = true
        case "cache-bookkeeping":
            candidateOptions.ngramRingOrder = true
            candidateOptions.denseExpertLookup = true
            candidateOptions.sparsePoolPins = true
        case "indexer": candidateOptions.incrementalIndexer = true
        case "indexer-raw":
            candidateOptions.incrementalIndexer = true
            candidateOptions.compactIndexerRaw = true
        case "indexer-tiles": candidateOptions.boundedIndexer = true
        case "indexer-dense": candidateOptions.denseIndexerBypass = true
        case "indexer-dense-tiles":
            candidateOptions.denseIndexerBypass = true
            candidateOptions.boundedIndexer = true
        case "indexer-topk":
            candidateOptions.indexerBlockTopK = true
            candidateOptions.boundedIndexer = true
        case "rope": candidateOptions.sharedRoPE = true
        case "rope-fused": candidateOptions.fusedRoPE = true
        case "rope-both":
            candidateOptions.sharedRoPE = true
            candidateOptions.fusedRoPE = true
        case "router": candidateOptions.routerTopK = true
        case "router-weights": candidateOptions.cachedRouterWeights = true
        case "shared-overlap": candidateOptions.overlapSharedExpert = true
        case "resident-overlap": candidateOptions.overlapResidentExperts = true
        case "gdn-record": candidateOptions.fusedGDNRecording = true
        case "gdn-projection": candidateOptions.fusedGDNProjection = true
        case "ple": candidateOptions.boundedPLE = true
        case "workspace":
            candidateOptions.layerExpertWorkspace = true
            candidateOptions.workspaceTokenTile = try InferenceOptimizations.environment().workspaceTokenTile
        case "sweep-placement": candidateOptions.disjointSweepOutput = true
        case "sweep-tiles": candidateOptions.boundedSweepRows = true
        case "sweep-both":
            candidateOptions.disjointSweepOutput = true
            candidateOptions.boundedSweepRows = true
        default: throw ModelError("unknown state-check variant: \(variant)")
        }
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: nil, packGDNProjections: variant == "gdn-projection")
        var c = CheckBuilder("optimization-state-\(variant)")
        if variant == "packed-layout", !model.pool.hasPackedLayout {
            throw ModelError("packed-layout state check requires SLOTSTREAM_EXPERT_LAYOUT")
        }
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var candidateRouting = false
        var referenceRoutes: [Int: [Int32]] = [:], candidateRoutes: [Int: [Int32]] = [:]
        var latestReferenceRoutes: [Int: [Int32]] = [:]
        if variant == "resident-overlap" || variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            model.routerObserver = { layer, ids in
                if candidateRouting { candidateRoutes[layer, default: []].append(contentsOf: ids) }
                else {
                    referenceRoutes[layer, default: []].append(contentsOf: ids)
                    latestReferenceRoutes[layer] = ids
                }
            }
        }
        func controls(_ candidate: Bool) {
            candidateRouting = candidate
            // A reference immediately followed by the same one-token candidate
            // otherwise warms all requested experts and never exercises overlap.
            // Deliberately retain half of each observed route at the same pool
            // capacity. Only correctness runs do this; serving remains natural.
            if variant == "resident-overlap", candidate,
               latestReferenceRoutes.count == model.runLayers,
               latestReferenceRoutes.values.allSatisfy({ $0.count == model.cfg.topK }) {
                model.pool.unpinAll(); model.pool.resize(to: 1)
                let absent = (0..<model.cfg.numExperts).first {
                    !latestReferenceRoutes[0]!.contains(Int32($0))
                }!
                _ = model.pool.ensure([ExpertKey(0, absent)])
                model.pool.unpinAll(); model.pool.resize(to: 640)
                let warm = latestReferenceRoutes.keys.sorted().flatMap { layer in
                    latestReferenceRoutes[layer]!.prefix(model.cfg.topK / 2).map { ExpertKey(layer, Int($0)) }
                }
                _ = model.pool.ensure(warm); model.pool.unpinAll()
            }
            if !candidate { latestReferenceRoutes.removeAll(keepingCapacity: true) }
            if variant == "packed-layout" { model.pool.usePackedLayout = candidate }
            if variant == "ngram-lookahead" {
                model.ngram.compactRows = true; model.ngram.compactRows = false
            }
            model.optimizations = candidate ? candidateOptions : InferenceOptimizations()
        }
        func run(_ compact: Bool) -> (Qwen4ExpModel.State, MLXArray) {
            controls(compact)
            let state = model.makeState()
            let logits = model.lastLogits(ids, state: state)
            eval(logits)
            return (state, logits)
        }
        let (reference, refLogits) = run(false)
        let (candidate, gotLogits) = run(true)
        func equal(_ name: String, _ a: MLXArray, _ b: MLXArray) {
            c.expect(name, a.shape == b.shape && a.dtype == b.dtype && (a .== b).all().item(Bool.self))
        }
        func compare(_ label: String) {
            let a = reference.diagnosticTensors(), b = candidate.diagnosticTensors()
            let bases = candidate.diagnosticIndexerBases()
            c.equal("\(label): state fields", Set(a.keys), Set(b.keys))
            for k in a.keys.sorted() {
                if let v = b[k] {
                    let original = a[k]!
                    let base = bases[k] ?? 0
                    let expected = base > 0 ? original[0..., base ..< original.dim(1), 0...] : original
                    equal("\(label): \(k)", expected, v)
                }
            }
        }
        equal("prefill logits", refLogits, gotLogits)
        compare("prefill")
        if variant == "indexer-raw", tokens > model.cfg.indexerBudget {
            c.expect("completed main indexers release raw prefixes", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > 0 })
            c.measure("reference_sequence_bytes", Double(reference.allocatedSequenceBytes))
            c.measure("candidate_sequence_bytes", Double(candidate.allocatedSequenceBytes))
        }
        // Rollback from every possible kept length of a verify pass, followed
        // by a different continuation. Captures GDN/PLE, KV/indexer and history.
        for keep in 1 ... 3 {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let verify = [1137, 732, 2091]
            controls(false)
            reference.setRecording(true)
            let r = model.allLogitsWithMulti(verify, state: reference); eval(r.logits, r.multi)
            reference.rollback(keeping: keep, of: verify, from: rc, ngramWindow: model.cfg.ngramSize - 1)
            controls(true)
            candidate.setRecording(true)
            let g = model.allLogitsWithMulti(verify, state: candidate); eval(g.logits, g.multi)
            candidate.rollback(keeping: keep, of: verify, from: cc, ngramWindow: model.cfg.ngramSize - 1)
            equal("verify \(keep) logits", r.logits, g.logits)
            compare("rollback \(keep)")
            controls(false)
            let rn = model.lastLogits([907], state: reference); eval(rn)
            controls(true)
            let gn = model.lastLogits([907], state: candidate); eval(gn)
            equal("continued logits after keep \(keep)", rn, gn)
            compare("continuation \(keep)")
            reference.restore(rc); candidate.restore(cc)
            compare("restored \(keep)")
        }
        if variant == "indexer-raw" {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let extensionIds = Array(repeating: 907, count: 513)
            controls(false)
            let r = model.lastLogits(extensionIds, state: reference); eval(r)
            controls(true)
            let g = model.lastLogits(extensionIds, state: candidate); eval(g)
            equal("long transaction logits", r, g)
            compare("long transaction")
            if tokens > model.cfg.indexerBudget {
                c.expect("long append releases rows beyond checkpoint offset", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > tokens })
            }
            reference.restore(rc); candidate.restore(cc)
            compare("long transaction restored")
            controls(false); let rNext = model.lastLogits([1137, 908], state: reference); eval(rNext)
            controls(true); let gNext = model.lastLogits([1137, 908], state: candidate); eval(gNext)
            equal("continuation after restoring released history", rNext, gNext)
            compare("restored long continuation")
        }
        if variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            c.equal("ordered router traces across prefill, verify and continuation", candidateRoutes, referenceRoutes)
        }
        if variant == "packed-layout" {
            c.expect("candidate performed verified-layout reads",model.pool.packedRecordsRead > 0)
            c.expect("layout stayed valid through all transactions",model.pool.hasPackedLayout)
            c.measure("packed_records_read",Double(model.pool.packedRecordsRead))
        }
        if variant == "ngram-lookahead" {
            c.expect("candidate consumed asynchronous rows",model.ngram.lookaheadRowsConsumed > 0)
            c.expect("all lookahead workers joined",!model.ngram.hasPendingPrefetch)
            c.measure("lookahead_rows_consumed",Double(model.ngram.lookaheadRowsConsumed))
        }
        if variant == "slot-slices" {
            c.expect("candidate used contiguous slot writes", model.pool.slotSliceBatches > 0)
            c.measure("slot_slice_batches", Double(model.pool.slotSliceBatches))
            c.measure("slot_slice_runs", Double(model.pool.slotSliceRuns))
            c.measure("slot_scatter_batches", Double(model.pool.slotScatterBatches))
        }
        if variant == "slot-cpu" {
            c.expect("candidate used CPU slot writes", model.pool.slotCPUBatches > 0)
            c.measure("slot_cpu_batches", Double(model.pool.slotCPUBatches))
        }
        if variant == "slot-words" {
            c.expect("candidate used word slot writes", model.pool.slotWordBatches > 0)
            c.equal("six packed BF16 pieces per used batch", model.pool.slotWordBuffers, model.pool.slotWordBatches * 6)
            c.measure("slot_word_batches", Double(model.pool.slotWordBatches))
            c.measure("slot_word_buffers", Double(model.pool.slotWordBuffers))
        }
        if variant == "router-weights" {
            c.equal("promoted routers charged in full", model.cachedRouterBytes,
                model.runLayers * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            c.measure("additional_cached_router_bytes", Double(model.cachedRouterBytes))
            controls(false)
            let released = model.lastLogits([908], state: reference); eval(released)
            c.equal("disabling router cache releases promoted tensors", model.cachedRouterBytes, 0)
        }
        if variant == "cache-bookkeeping" {
            c.equal("direct map actually allocated", model.pool.denseLookupBytes, model.cfg.numLayers * model.cfg.numExperts * 4)
            controls(false)
            eval(model.lastLogits([908], state: reference))
            c.equal("direct map released after disabling", model.pool.denseLookupBytes, 0)
        }
        if variant == "compiled-norm" {
            c.expect("compiled pointwise normalization actually executed", model.compiledNormFinishes > 0)
            c.measure("compiled_norm_calls", Double(model.compiledNormFinishes))
        }
        if variant == "read-handles" {
            c.equal("all stream tensors have owned descriptors", model.readHandleCount,
                model.cfg.numLayers * 9 + model.cfg.splitNgramParts * 3)
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling releases direct read handles", model.readHandleCount, 0)
        }
        if variant == "resident-overlap" {
            c.expect("resident expert operations actually prelaunched", model.residentExpertPrelaunches > 0)
            c.measure("resident_expert_prelaunches", Double(model.residentExpertPrelaunches))
            c.measure("resident_expert_join_seconds", model.residentExpertJoinSeconds)
        }
        if variant == "shared-overlap" {
            c.expect("resident shared projections actually prelaunched", model.sharedExpertPrelaunches > 0)
            c.measure("shared_projection_prelaunches", Double(model.sharedExpertPrelaunches))
        }
        if variant == "gdn-projection" {
            c.equal("every recurrent layer has a shared projection backing", model.resident.packedGDNProjectionLayers,
                model.cfg.layerTypes.filter { $0 == "linear_attention" }.count)
            c.expect("single-token fusion actually scheduled", model.fusedGDNProjectionsScheduled > 0)
            let before = model.fusedGDNProjectionsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabled fusion preserves separate projection dispatch", model.fusedGDNProjectionsScheduled, before)
            c.measure("shared_projection_payload_bytes", Double(model.resident.packedGDNProjectionPayloadBytes))
        }
        if variant == "rope-fused" || variant == "rope-both" {
            c.expect("fused rotations scheduled on evaluated paths", model.fusedRoPERotationsScheduled > 0)
            c.measure("fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            let before = model.fusedRoPERotationsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling fusion returns to original dispatch", model.fusedRoPERotationsScheduled, before)
        }
        if variant == "rope" || variant == "rope-both" {
            c.expect("angle tables actually reused", model.ropeTableHits > 0)
            c.measure("rope_table_hits", Double(model.ropeTableHits))
            c.measure("rope_table_builds", Double(model.ropeTableBuilds))
        }
        if variant == "indexer-topk" {
            c.expect("specialized block rows actually scheduled", model.indexerSpecializedRows > 0)
            c.measure("specialized_block_rows", Double(model.indexerSpecializedRows))
        }
        c.measure("prompt_tokens", Double(tokens))
        if variant == "ngram" || variant == "cache-bookkeeping" {
            // Force FIFO eviction, a prefetch larger than capacity, row hits,
            // mode changes, and EOS history boundaries without huge fixtures.
            let index = try CheckpointIndex(dir: modelDir)
            for capacity in [1, 7, 31] {
                let a = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                let b = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                b.compactRows = true
                b.ringEvictionOrder = variant == "cache-bookkeeping"
                for history in [[Int64(model.cfg.eosTokenId), 37, 52, 81], [37, Int64(model.cfg.eosTokenId), 81, 52], [37, 52, 81, 37]] {
                    let av = a.embedding(history: history, nNew: 2)
                    let bv = b.embedding(history: history, nNew: 2)
                    equal("ngram capacity \(capacity), history \(history)", av, bv)
                    c.equal("ngram cache size \(capacity)", a.cachedRowCount, b.cachedRowCount)
                    c.equal("ngram payload halves \(capacity)", a.cachedPayloadBytes, 2 * b.cachedPayloadBytes)
                }
                c.equal("ngram repeated row \(capacity)", a.debugRow(12345), b.debugRow(12345))
                c.equal("ngram row reuse \(capacity)", a.debugRow(12345), b.debugRow(12345))
            }
        }
        c.measure("physical_footprint_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift` — 11349 bytes, SHA-256 `71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c`.

````text
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

````

Artifact `/Users/carlos/Projects/slotstream/Sources/slotstream-cli/OptimizationCommands.swift` — 18394 bytes, SHA-256 `d287a7d59b2074c5f6a4f34e0cd3c6b0cbd02786779d6328c04f9007106d12ad`.

````text
import ArgumentParser
import Foundation
import Slotstream
import SlotstreamDiagnostics

struct OptimizationStateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "optimization-state-check",
        abstract: "Compare retained state and continued logits across optimization controls")
    @OptionGroup var model: ModelOptions
    @Option var tokens: Int = 256
    @Flag var json = false
    @Flag(help: "Check output limits, pending token ownership, EOS and cancellation")
    var generation = false
    @Option(help: "Candidate to compare: integrated | integrated-mtp | compute-islands | compute-islands-performance | slot-cpu-component | terminal-prefill-lifecycle | mtp-terminal-prefill | terminal-prefill-family | selected-attention-component | selected-attention-family | compact-state | compiled-norm | compiled-norm-component | mtp-compiled-norm | ngram | cache-bookkeeping | cache-containers | exact-read | read-handles | mtp-read-handles | read-handle-lifetime | mtp-cache-bookkeeping | mtp | indexer | sweep-placement | sweep-tiles | sweep-both | indexer-tiles | indexer-dense | indexer-dense-tiles | indexer-topk | indexer-visibility | rope | gdn-record | gdn-kernel | ple | workspace | scope | scope-256 | scope-lifecycle | scope-mtp-vision | mtp-work | lifecycle | output | router-weights | mtp-router-weights | router-projection | router-selection | block-selection | router | mtp-router | mtp-indexer | image-reuse | vision-attention | shared-overlap | prefill-family") var variant = "compact-state"

    func run() throws {
        let report: CheckReport
        if generation { report = try Diagnostics.optimizationGeneration(modelDir: model.modelURL) }
        else if ["runtime-budget-lifecycle", "governor-boundary", "governor-boundary-mtp", "read-failure-serving", "output-serving"].contains(variant) {
            // This executable has a synchronous root, as do its existing
            // Engine-backed commands. Bridge only the tokenizer load here.
            let ready = DispatchSemaphore(value: 0)
            var result: Result<CheckReport, Error>?
            Task {
                do {
                    if variant == "output-serving" {
                        result = .success(try await Diagnostics.optimizationOutputServing(modelDir: model.modelURL))
                    } else if variant == "read-failure-serving" {
                        result = .success(try await Diagnostics.optimizationReadFailureServing(modelDir: model.modelURL))
                    } else if variant == "runtime-budget-lifecycle" {
                        result = .success(try await Diagnostics.optimizationRuntimeBudgetLifecycle(modelDir: model.modelURL))
                    } else {
                        result = .success(try await Diagnostics.optimizationGovernorBoundary(modelDir: model.modelURL, mtp: variant == "governor-boundary-mtp"))
                    }
                }
                catch { result = .failure(error) }
                ready.signal()
            }
            ready.wait()
            report = try result!.get()
        }
        else if variant == "all-hit-replay" { report = try Diagnostics.optimizationAllHitReplay(modelDir: model.modelURL) }
        else if variant == "compute-islands" || variant == "compute-islands-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL, timed: variant == "compute-islands-performance")
        }
        else if variant == "compute-islands-quantized" || variant == "compute-islands-quantized-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL,
                timed: variant == "compute-islands-quantized-performance", quantizedOnly: true)
        }
        else if variant == "gdn-projection-packing" { report = try Diagnostics.optimizationGDNProjectionPacking(modelDir: model.modelURL) }
        else if variant == "gdn-profile" { report = try Diagnostics.optimizationGDNProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "vision-capacity" { report = Diagnostics.optimizationVisionCapacity() }
        else if variant == "vision-tower-capacity" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL) }
        else if variant == "vision-prescaled-capacity" { report = Diagnostics.optimizationVisionCapacity(preserveQueryRounding: true) }
        else if variant == "vision-prescaled-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, preserveQueryRounding: true) }
        else if variant == "resident-overlap-component" { report = try Diagnostics.optimizationResidentOverlap(modelDir: model.modelURL) }
        else if variant == "resident-overlap-recovery" || variant == "resident-overlap-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "resident-overlap-recovery-mtp", residentOverlap: true)
        }
        else if variant == "state-recovery-lineage" { report = try Diagnostics.optimizationStateRecovery(modelDir: model.modelURL) }
        else if variant == "prefix-client-capacity" { report = try Diagnostics.optimizationPrefixCapacity() }
        else if variant == "rope-performance" { report = Diagnostics.optimizationRopePerformance() }
        else if variant == "rope-rotation-component" { report = Diagnostics.optimizationPartialRotation() }
        else if variant == "vision-query-tile-capacity" { report = Diagnostics.optimizationVisionCapacity(queryTile: 256) }
        else if variant == "vision-query-tile-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, queryTile: 256) }
        else if variant == "vision-query-maximum-reference" {
            report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL,
                queryTile: 256, maximumReferenceOnly: true)
        }
        else if variant == "transfer-profile" { report = try Diagnostics.optimizationTransferProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "slot-slices-component" { report = Diagnostics.optimizationSlotSlices() }
        else if variant == "slot-words-component" { report = Diagnostics.optimizationSlotSlices(wordWrites: true) }
        else if variant == "slot-cpu-component" { report = try Diagnostics.optimizationCPUSlotWrites() }
        else if variant == "slot-cpu-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-recovery" || variant == "slot-cpu-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-cpu-recovery-mtp", cpuWrites: true)
        }
        else if variant == "embedding-rows" { report = try Diagnostics.optimizationEmbeddingRows(modelDir: model.modelURL) }
        else if variant == "embedding-runtime" || variant == "embedding-runtime-mtp" {
            report = try Diagnostics.optimizationEmbeddingRuntime(modelDir: model.modelURL, mtp: variant == "embedding-runtime-mtp")
        }
        else if variant == "integrated-gdn-projection" || variant == "integrated-gdn-projection-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-gdn-projection-mtp", gdnProjection: true)
        }
        else if variant == "integrated-rope" || variant == "integrated-rope-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-rope-mtp", ropeFusion: true)
        }
        else if variant == "integrated" || variant == "integrated-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL, mtp: variant == "integrated-mtp")
        }
        else if variant == "integrated-vision-query" || variant == "integrated-vision-query-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-vision-query-mtp", visionQueryTile: true)
        }
        else if variant == "prefix-vision" || variant == "prefix-vision-mtp" {
            report = try Diagnostics.optimizationPrefixVision(modelDir: model.modelURL, mtp: variant == "prefix-vision-mtp")
        }
        else if variant == "complete-prompt" || variant == "complete-prompt-mtp" {
            report = try Diagnostics.optimizationCompletePrompt(modelDir: model.modelURL, mtp: variant == "complete-prompt-mtp")
        }
        else if variant == "prefix-retention" || variant == "prefix-retention-mtp" {
            report = try Diagnostics.optimizationPrefixRetention(modelDir: model.modelURL, mtp: variant == "prefix-retention-mtp")
        }
        else if variant == "prefix-fork" || variant == "prefix-fork-mtp" {
            report = try Diagnostics.optimizationPrefixFork(modelDir: model.modelURL, tokens: tokens, mtp: variant == "prefix-fork-mtp")
        }
        else if variant == "slot-words-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-recovery" || variant == "slot-words-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-words-recovery-mtp", wordWrites: true)
        }
        else if variant == "slot-slices-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-recovery" || variant == "slot-slices-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-slices-recovery-mtp", slotSlices: true)
        }
        else if variant == "image-failure" { report = try Diagnostics.optimizationImageFailure(modelDir: model.modelURL) }
        else if variant == "pool-requests" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL) }
        else if variant == "packed-layout-component" { report = try Diagnostics.optimizationPackedLayout() }
        else if variant == "ngram-lookahead-rows" { report = try Diagnostics.optimizationNgramLookahead(modelDir:model.modelURL) }
        else if variant == "ngram-lookahead-ticket" { report = try Diagnostics.optimizationNgramPrefetchTicket() }
        else if variant == "ngram-lookahead-recovery" || variant == "ngram-lookahead-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir:model.modelURL,
                mtp:variant == "ngram-lookahead-recovery-mtp",lookahead:true)
        }
        else if variant == "packed-layout-storage" { report = try Diagnostics.optimizationPackedStorage(modelDir:model.modelURL) }
        else if variant == "packed-layout-recovery" || variant == "packed-layout-recovery-mtp" {
            report = try Diagnostics.optimizationPackedRecovery(modelDir:model.modelURL,mtp:variant == "packed-layout-recovery-mtp")
        }
        else if variant == "read-recovery" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL) }
        else if variant == "request-read-recovery" || variant == "request-read-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL, mtp: variant == "request-read-recovery-mtp")
        }
        else if variant == "sampler-performance" { report = Diagnostics.optimizationSamplerPerformance() }
        else if variant == "adaptive-mtp" { report = try Diagnostics.optimizationAdaptiveMTP(modelDir: model.modelURL) }
        else if variant == "adaptive-sensitivity" { report = try Diagnostics.optimizationAdaptiveSensitivity(modelDir: model.modelURL) }
        else if variant == "mtp-floor-cache" { report = try Diagnostics.optimizationMTPFloorCache(modelDir: model.modelURL) }
        else if variant == "floor-cache-mechanism" { report = try Diagnostics.optimizationFloorCacheMechanism(modelDir: model.modelURL) }
        else if variant == "indexer-raw-component" { report = Diagnostics.optimizationCompactIndexer() }
        else if variant == "read-handle-lifetime" { report = try Diagnostics.optimizationReadHandles(modelDir: model.modelURL) }
        else if variant == "mtp-read-handles" { report = try Diagnostics.optimizationMTPReadHandles(modelDir: model.modelURL) }
        else if variant == "selected-attention-component" { report = Diagnostics.optimizationSelectedAttention() }
        else if variant == "selected-attention-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, selectedAttention: true) }
        else if variant == "terminal-query-family" {
            report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                terminalPrefill: true, terminalQuery: true)
        }
        else if variant == "terminal-query-lifecycle" {
            report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL, lastQuery: true)
        }
        else if variant == "terminal-prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, terminalPrefill: true) }
        else if variant == "terminal-prefill-lifecycle" { report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-terminal-query" {
            report = try Diagnostics.optimizationMTPTerminalQuery(modelDir: model.modelURL)
        }
        else if variant == "mtp-terminal-prefill" { report = try Diagnostics.optimizationMTPTerminalPrefill(modelDir: model.modelURL) }
        else if variant == "exact-read" { report = Diagnostics.optimizationExactRead() }
        else if variant == "mtp-compiled-norm" { report = try Diagnostics.optimizationMTPCompiledNorm(modelDir: model.modelURL) }
        else if variant == "compiled-norm-component" { report = try Diagnostics.optimizationCompiledNorm() }
        else if variant == "cache-containers" { report = Diagnostics.optimizationCacheBookkeeping() }
        else if variant == "mtp-cache-bookkeeping" { report = try Diagnostics.optimizationMTPCacheBookkeeping(modelDir: model.modelURL) }
        else if variant == "router-selection" { report = Diagnostics.optimizationRouterSelection() }
        else if variant == "router-projection" { report = Diagnostics.optimizationRouterProjection() }
        else if variant == "block-selection" { report = Diagnostics.optimizationBlockSelection() }
        else if variant == "indexer-visibility" { report = Diagnostics.optimizationIndexerVisibility() }
        else if variant == "prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "scope-256" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, scoped: true) }
        else if variant == "output" { report = try Diagnostics.optimizationOutput() }
        else if variant == "output-tcp" { report = try Diagnostics.optimizationOutputTCP() }
        else if variant == "scope-mtp-vision" { report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL) }
        else if variant == "mtp-work" { report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL) }
        else if variant == "scope-integrated-family" {
            report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                scoped: true, integratedBase: true)
        }
        else if variant == "scope-integrated-lifecycle" {
            report = try Diagnostics.optimizationScopeLifecycle(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-integrated-mtp-vision" {
            report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-lifecycle" { report = try Diagnostics.optimizationScopeLifecycle(modelDir: model.modelURL) }
        else if variant == "scope" { report = try Diagnostics.optimizationReadScope(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "gdn-kernel" { report = Diagnostics.optimizationGDNKernel() }
        else if variant == "lifecycle" { report = try Diagnostics.optimizationLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-indexer" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL) }
        else if variant == "mtp-indexer-raw" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL, rawCompact: true) }
        else if variant == "image-reuse" { report = try Diagnostics.optimizationImageReuse(modelDir: model.modelURL) }
        else if variant == "vision-attention" { report = Diagnostics.optimizationVisionAttention() }
        else if variant == "mtp-router" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL, router: true) }
        else if variant == "mtp-router-weights" { report = try Diagnostics.optimizationMTPRouterWeights(modelDir: model.modelURL) }
        else if variant == "mtp" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL) }
        else { report = try Diagnostics.optimizationState(modelDir: model.modelURL, tokens: tokens, variant: variant) }
        if json {
            let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            print(String(data: try encoder.encode(report), encoding: .utf8)!)
        } else {
            for item in report.items { print("\(item.passed ? "PASS" : "FAIL")  \(item.name)") }
        }
        if !report.passed { throw ExitCode.failure }
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/OptimizationPlatform.swift` — 2036 bytes, SHA-256 `e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf`.

````text
import Darwin
import Foundation

/// Qualification identity for automatic activation of a new Metal kernel.
/// This is independent of simulated planner inputs and environment controls.
/// It grants neither a memory allowance nor a throughput estimate.
package struct OptimizationPlatform: Equatable {
    package let machineModel: String?
    package let chip: String?
    package let osBuild: String?
    package let nativeARM64: Bool

    package init(machineModel: String?, chip: String?, osBuild: String?, nativeARM64: Bool) {
        self.machineModel = machineModel; self.chip = chip
        self.osBuild = osBuild; self.nativeARM64 = nativeARM64
    }

    /// The complete native/serving RoPE gates currently cover this machine
    /// family and OS build only. An OS update, another SoC or failed identity
    /// read keeps the existing MLX implementation as the automatic fallback.
    package var qualifiedPartialRotation: Bool {
        nativeARM64 && machineModel == "Mac17,9" && chip == "Apple M5 Pro" && osBuild == "25G83"
    }

    private static func systemString(_ name: String) -> String? {
        var count = 0
        guard sysctlbyname(name, nil, &count, nil, 0) == 0, 1 < count, count <= 256 else { return nil }
        var bytes = [UInt8](repeating: 0, count: count)
        let capacity = count
        let result = bytes.withUnsafeMutableBytes { buffer in
            sysctlbyname(name, buffer.baseAddress, &count, nil, 0)
        }
        guard result == 0, 1 < count, count <= capacity, bytes[count - 1] == 0,
              !bytes[..<(count - 1)].contains(0) else { return nil }
        return String(bytes: bytes[..<(count - 1)], encoding: .utf8)
    }

    package static let current: Self = {
        #if arch(arm64)
        let native = true
        #else
        let native = false
        #endif
        return Self(machineModel: systemString("hw.model"), chip: systemString("machdep.cpu.brand_string"),
                    osBuild: systemString("kern.osversion"), nativeARM64: native)
    }()
}

````

Artifact `/tmp/slotstream-optimization-execution/prepare-scope-draft-v170.py` — 5089 bytes, SHA-256 `aa8f05f510a287647c6b492e969ce980e73dad5e67802d2a944dc0bab55e6e76`.

````text
from pathlib import Path
import copy,json,sys
r=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(r/'Tools'))
import serve_bench as b
base=json.loads(Path('/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/unique-prose.json').read_text())
old=json.loads((r/'.build/optimization/scope-256-tile-1024-code-development-v22/manifest.json').read_text())['protocol']
d=copy.deepcopy(base)
d.update(label='scope-combined-long-prefill-draft-v170',classification='UNRUN DRAFT: final binary/source and combined scope native prerequisites must be bound',fixture=old['fixture'],fixture_sha256=old['fixture_sha256'],memory_gb=10,maximum_sampled_footprint_bytes=10000000000,raw=False,think=False,max_tokens=16,minimum_output_tokens=16,rounds=16)
common=copy.deepcopy(base['arms']['combined']['env'])
common.update(SLOTSTREAM_OPT_INDEXER_TILES='1',SLOTSTREAM_OPT_PLE_TILES='1',SLOTSTREAM_OPT_PREFIX_CHECKPOINT='0',SLOTSTREAM_OPT_COMPLETE_PROMPT='0')
d['arms']={'reference':{'binary':'FINAL_BINARY_REQUIRED','chunk':256,'env':common},'scope':{'binary':'FINAL_BINARY_REQUIRED','chunk':256,'env':copy.deepcopy(common)}}
d['arms']['scope']['env'].update(SLOTSTREAM_OPT_LAYER_WORKSPACE='1',SLOTSTREAM_OPT_READ_SCOPE='4096',SLOTSTREAM_OPT_WORKSPACE_TILE='1024',SLOTSTREAM_OPT_SCOPE_FRONTIER='1')
d['acceptance']={'minimum_pairs':5,'minimum_median_client_reduction':.05,'minimum_positive_fraction':.8,'all_outputs_exact':True,'replacement_rounds':0}
d['required_equal_work']=['prefillTokens','decodeTokens','decodeModelTokens','decodeForwardPasses','draftedTokens','verifyPasses']
d['work_constraints']={}
for name in d['arms']:
 d['work_constraints'][name]={k:{'min':v,'max':v} for k,v in [('prefillTokens',3730),('decodeTokens',16),('decodeModelTokens',15),('decodeForwardPasses',15),('draftedTokens',0),('verifyPasses',0)]}
 d['work_constraints'][name]['prefillRecords']={'min':150000} if name=='reference' else {'max':50000}
d['conditions']='New combined-base long-prefill qualification, not a repeat or pooling of consumed V22/V98 evidence. Same10GB native target, original256-token chronological compute,16output tokens, MTP/prefix off,54explicit controls in each arm. Common compact-state/MTP-row/final-forward/sampler/queue/governor/embedding-row/shared/fused-RoPE plus bounded indexer/PLE; only candidate enables4096read scope,1024workspace tile and compact frontier. Both arms retain native target-driven pool sizing; no simulated availability, fixed-pool override or estimator credit. Read-work bounds require reference>=150000 and candidate<=50000 actualprefillrecords at identical3730prompt tokens; decode record differences are allowed and reported because scope tail admission may change residency. Six equal logical/model-work counters and exact IDs/wire output are required. Sixteen fixed alternating fresh-server pairs,180second initial quiet,60second reserved cooldown, min5clean/5percent median client gain/80percent positive; separate min5exactclean firstjobs/atmost5percent regression. Whole-request sampled physical peak<=10GB, nominal power and unchanged VM, immediate resource stop/no replacements. Baseline V22 observed candidate peaks<=9.613GB but no clean paired result; row-backed embeddings now remove a separately qualified resident payload, without arithmetically claiming a peak saving or prior speedup. Native combined-base4096/2051family, scope cancellation/retry and MTP/image parity must pass on the final bound source before launch. Full automatic/planner adoption remains a separate decision.'
d['primary_metric']='Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.'
d['candidate_prerequisites_pending']=['New final source/binary including V168pin cleanup and V169platform policy','scope-integrated-family tokens2051 and4096 with workspaceTile1024/compactFrontier1','scope-integrated-lifecycle and scope-integrated-mtp-vision with bounded embedding rows and joint core','Existing strict numerical/state/route/cancellation gates unchanged; no historical timing pooled','If qualified, independent short-prefill guard and coherent runtime/planner activation policy before default adoption']
p=Path('/tmp/slotstream-optimization-execution/scope-combined-serving-draft-v170.json');p.write_text(json.dumps(d,indent=2)+'\n')
b.validate_arms(d['arms']);b.work_constraints(d);b.summaries([],'reference',d['comparison_basis'],d['required_equal_work']);b.acceptance_results([],d['acceptance']);b.startup_acceptance_results([],'reference',d['startup_acceptance']);b.prefix_study(d);b.resource_exclusions({},d);b.workspace_quiet_requirement(d)
assert b.digest(Path(d['fixture']))==d['fixture_sha256']
b.request_body(d,Path(d['fixture']).read_text())
print(json.dumps({'draft':str(p),'sha256':b.digest(p),'passed_static_checks':True,'unrun':True,'required_base_reclaimable_gb':b.measurement_memory(d),'candidate_additional_preflight_gb':2+(4096-256)*.0013+.12,'explicit_controls':{k:len(v['env']) for k,v in d['arms'].items()}}))

````

Artifact `/tmp/slotstream-optimization-execution/scope-combined-serving-draft-v170.json` — 9903 bytes, SHA-256 `8fd8e7fd29ebcc909b384a6ee41336fc8b159ac2c1415d9ccbe2482c9c691048`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "FINAL_BINARY_REQUIRED",
  "memory_gb": 10,
  "mtp": "off",
  "raw": false,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "FINAL_BINARY_REQUIRED",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "scope": {
      "binary": "FINAL_BINARY_REQUIRED",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "1",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "4096",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "1024",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "scope-combined-long-prefill-draft-v170",
  "classification": "UNRUN DRAFT: final binary/source and combined scope native prerequisites must be bound",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/code.txt",
  "fixture_sha256": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "New combined-base long-prefill qualification, not a repeat or pooling of consumed V22/V98 evidence. Same10GB native target, original256-token chronological compute,16output tokens, MTP/prefix off,54explicit controls in each arm. Common compact-state/MTP-row/final-forward/sampler/queue/governor/embedding-row/shared/fused-RoPE plus bounded indexer/PLE; only candidate enables4096read scope,1024workspace tile and compact frontier. Both arms retain native target-driven pool sizing; no simulated availability, fixed-pool override or estimator credit. Read-work bounds require reference>=150000 and candidate<=50000 actualprefillrecords at identical3730prompt tokens; decode record differences are allowed and reported because scope tail admission may change residency. Six equal logical/model-work counters and exact IDs/wire output are required. Sixteen fixed alternating fresh-server pairs,180second initial quiet,60second reserved cooldown, min5clean/5percent median client gain/80percent positive; separate min5exactclean firstjobs/atmost5percent regression. Whole-request sampled physical peak<=10GB, nominal power and unchanged VM, immediate resource stop/no replacements. Baseline V22 observed candidate peaks<=9.613GB but no clean paired result; row-backed embeddings now remove a separately qualified resident payload, without arithmetically claiming a peak saving or prior speedup. Native combined-base4096/2051family, scope cancellation/retry and MTP/image parity must pass on the final bound source before launch. Full automatic/planner adoption remains a separate decision.",
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "candidate_prerequisites_pending": [
    "New final source/binary including V168pin cleanup and V169platform policy",
    "scope-integrated-family tokens2051 and4096 with workspaceTile1024/compactFrontier1",
    "scope-integrated-lifecycle and scope-integrated-mtp-vision with bounded embedding rows and joint core",
    "Existing strict numerical/state/route/cancellation gates unchanged; no historical timing pooled",
    "If qualified, independent short-prefill guard and coherent runtime/planner activation policy before default adoption"
  ],
  "think": false,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses"
  ],
  "work_constraints": {
    "reference": {
      "prefillTokens": {
        "min": 3730,
        "max": 3730
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      },
      "prefillRecords": {
        "min": 150000
      }
    },
    "scope": {
      "prefillTokens": {
        "min": 3730,
        "max": 3730
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      },
      "prefillRecords": {
        "max": 50000
      }
    }
  },
  "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent."
}

````
