---
type: run
id: 01m21qprb6rdbyd8tc6f2msnns
created: 2026-09-09T00:04:56.293806+00:00
updated: 2026-09-09T00:04:57.076749+00:00
summary: Scope allocation refusal native checks prepared; compilation and execution pending
binary: V402 source base; diagnostic delta not compiled
captured_at: 2026-09-08
command: Source-only review and git apply --check; no model or compiler launch
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Scope allocation refusal native checks prepared; compilation and execution pending
tool: Slotstream exact native and source qualification capture
---
V416 adds 56 prospective native assertions to the actual scope lifecycle diagnostic on exact V402 source. Four cases cover cold and 256-token cached prefixes with direct and shared request reservations. After ordinary request admission the test lowers its observed available memory to at most 500 MB and expects a typed prefill-allocation refusal before router callbacks, expert reads, sequence growth, state commit or token emission. Prefix tensors are independently copied and SHA-256 hashed to avoid aliasing a mutated snapshot. Cache limits, pool pins and reservation ownership must restore. The injected observation never exceeds actual live availability; the original outer native resource guard remains unchanged. The patch has only been source-reviewed and apply-checked. It has not been compiled or executed and earns no native gate. Existing V402 seven-case evidence and the live V409 benchmark are unmodified.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/scope-allocation-refusal-native-v416/after/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
    "bytes": 65839,
    "sha256": "3e508f97a36bcea68b8f21f0731b4bf5ddaf5aae5d33ff8987b69c9db66336a4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/scope-allocation-refusal-native-v416/before/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
    "bytes": 61362,
    "sha256": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/scope-allocation-refusal-native-v416/diagnostic.patch",
    "bytes": 5127,
    "sha256": "d7e8c24516834c9e4512ee33259ffa5bbad5035616fbe98cc6189a2585286a61"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/scope-allocation-refusal-native-v416/preparation.json",
    "bytes": 799,
    "sha256": "bf2466b61bf758cb8a45748e2ea9e6c8b5484c22017400f3ae8feb2e342471b2"
  }
]
```

## Artifact SHA-256 3e508f97a36bcea68b8f21f0731b4bf5ddaf5aae5d33ff8987b69c9db66336a4

Encoding: `gzip+base64`. Original bytes: 65839.

````````````text
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
````````````

## Artifact SHA-256 77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542

Encoding: `utf-8`. Original bytes: 61362.

````````````text
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
            // A cold read scope must not erase the independently qualified
            // common-prefix checkpoint merely by grouping past its boundary.
            let coldCache = PrefixCache(maxTokens: 8192)
            let cold = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: coldCache)
            c.equal("cold combined scope preserves exact output", cold.0, referenceIds)
            c.equal("cold combined scope stores the requested checkpoint", cold.1.prefixCheckpointStores, 1)
            c.equal("checkpoint splits only the read group", cold.1.prefillPasses, [256, 1024])
            c.equal("checkpoint preserves every compute pass", cold.1.prefillComputePasses, Array(repeating: 256, count: 5))
            if let complete = coldCache.take(matching: prompt + cold.0 + [907], reserveTokens: 2048) {
                equalState(referenceState, complete.state, "cold combined scope exact continuation")
            } else { c.expect("cold combined scope retains complete state", false) }
            let divergent = Array(prompt.prefix(256)) + [999]
            if let common = coldCache.take(matching: divergent, reserveTokens: 2048) {
                c.equal("divergent followup reuses the common checkpoint", common.reused, 256)
                equalState(seedState, common.state, "cold scope checkpoint matches chronological seed")
            } else { c.expect("cold scope retains the divergent followup checkpoint", false) }
            c.equal("cold scope and checkpoint forks release pool pins", model.pool.pinnedSlotCount, 0)
            for disabled in [PrefixCache(maxTokens: 8192, enabled: false), PrefixCache(maxTokens: 0)] {
                let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: disabled)
                c.equal("inactive cache preserves the original read groups", result.1.prefillPasses, [1024, 256])
                c.equal("inactive cache creates no checkpoint", result.1.prefixCheckpointStores, 0)
                c.equal("inactive cache retains exact scoped output", result.0, referenceIds)
            }
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
        let callerCacheLimit = MLX.Memory.cacheLimit
        let cancelled = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: {
                if layer == model.runLayers - 1 { checksAfterLast += 1; return checksAfterLast < 3 }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel during second draft-head tile", !cancelled.committed && checksAfterLast == 3)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        c.equal("direct scope cancellation restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        c.expect("cancel restores valid draft prefix", candidate.hasValidMTP)
        equal(seedState, candidate, "image/MTP rollback")
        let result = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("retry commits scope", result.committed && result.logits != nil)
        c.equal("direct scope success restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        c.expect("retry draft aligned", candidate.hasValidMTP)
        equal(reference, candidate, "image/MTP continuation")
        // A checked expert-read error exits the model directly, without the
        // generator's outer cache-limit restoration masking a leaked setting.
        let failedState = seed()
        let fault = ReadFault(afterJobs: 17)
        model.pool.readFault = fault
        do {
            defer { model.pool.readFault = nil }
            do {
                _ = try model.consumeReadScopeChecked(remaining, passes: [256, 256, 256], state: failedState,
                    vision: vision, head: head, final: true, shouldContinue: nil)
                c.expect("direct scope read error returned", false)
            } catch is CheckpointReadError {
                c.expect("direct scope read error returned", true)
            }
        }
        c.expect("direct scope read fault fired", fault.hasFired)
        c.equal("direct scope error restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        equal(seedState, failedState, "direct scope read-error rollback")
        let recovered = try model.consumeReadScopeChecked(remaining, passes: [256, 256, 256], state: failedState,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("direct scope read-error retry commits", recovered.committed && recovered.logits != nil)
        c.equal("direct scope read-error retry restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        equal(reference, failedState, "direct scope read-error retry exact")
        let r = model.lastLogits([907], state: reference), n = model.lastLogits([907], state: candidate)
        c.expect("next target logits exact", (r .== n).all().item(Bool.self))
        if integratedBase {
            c.expect("combined MTP/vision scope executes fused rotation", model.fusedRoPERotationsScheduled > 0)
        }
        return c.report()
    }

    public static func optimizationMTPWork(modelDir: URL) throws -> CheckReport {
        try optimizationMTPWork(modelDir: modelDir, integratedBase: false)
    }

    package static func optimizationMTPWork(modelDir: URL, integratedBase: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        model.optimizations = integratedBase ? .integrationCandidate : InferenceOptimizations()
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.fusedGDNRecording = !integratedBase
        var c = CheckBuilder(integratedBase ? "optimization-mtp-work-integrated" : "optimization-mtp-work")
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for depth in [1, 3] {
            generator.draftDepth = depth
            for sampled in [false, true] { for limit in [1, 2, 5] {
                var params = SampleParams.greedy; params.maxTokens = limit; params.seed = 7
                if sampled {
                    params.temperature = 0.7; params.topK = 40
                    params.topP = 0.8; params.minP = 0.05; params.presencePenalty = 1.1
                }
                model.optimizations.reuseFirstMTPEntry = false
                model.optimizations.boundedDraftTail = false
                let (reference, referenceStats) = generator.generate(promptIds: prompt, params: params, eosIds: [])
                for mode in ["first", "tail", "both"] {
                    model.optimizations.reuseFirstMTPEntry = mode != "tail"
                    model.optimizations.boundedDraftTail = mode != "first"
                    let cache = PrefixCache(maxTokens: 4096)
                    let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
                    let name = "depth \(depth), sampled \(sampled), limit \(limit), \(mode)"
                    c.equal("\(name): emitted count", ids.count, limit)
                    c.equal("\(name): stable fixture output", ids, reference)
                    if sampled && mode != "first" {
                        c.equal("\(name): sampled fallback preserves draft work", stats.draftedTokens, referenceStats.draftedTokens)
                        c.equal("\(name): sampled fallback preserves target shape", stats.decodeModelTokens, referenceStats.decodeModelTokens)
                        c.equal("\(name): sampled fallback preserves verification count", stats.verifyPasses, referenceStats.verifyPasses)
                    }
                    let retained = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)
                    c.expect("\(name): retained committed prefix", retained != nil)
                    guard let hit = retained else { continue }
                    c.expect("\(name): aligned draft", hit.state.hasValidMTP)
                    c.expect("\(name): consumed prefix within emitted tokens",
                        hit.state.tokenCount >= prompt.count && hit.state.tokenCount <= prompt.count + ids.count)
                    c.equal("\(name): reconciliation covers committed positions",
                        stats.reconciledHeadTokens + stats.reusedHeadTokens, hit.state.tokenCount - prompt.count)
                    if limit == 1 { c.equal("\(name): no terminal verification", stats.verifyPasses, 0) }
                    if limit == 2 && mode != "first" && !sampled {
                        c.equal("\(name): terminal output needs zero drafts", stats.draftedTokens, 0)
                        c.equal("\(name): one target position suffices", stats.decodeModelTokens, 1)
                        c.equal("\(name): final emission stays pending", hit.state.tokenCount, prompt.count + 1)
                    }
                    if limit > 1 && mode == "first" {
                        c.equal("\(name): first entry reused each round", stats.reusedHeadTokens, stats.verifyPasses)
                    }
                }
            } }
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

````````````

## Artifact SHA-256 d7e8c24516834c9e4512ee33259ffa5bbad5035616fbe98cc6189a2585286a61

Encoding: `utf-8`. Original bytes: 5127.

````````````text
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift
@@ -1,3 +1,4 @@
+import CryptoKit
 import Foundation
 import MLX
 import Slotstream
@@ -190,6 +191,70 @@
                 c.equal("inactive cache preserves the original read groups", result.1.prefillPasses, [1024, 256])
                 c.equal("inactive cache creates no checkpoint", result.1.prefixCheckpointStores, 0)
                 c.equal("inactive cache retains exact scoped output", result.0, referenceIds)
+            }
+        }
+        // Refuse a workspace before any forward or expert read. Only the
+        // request observation is lowered; the outer native resource guard
+        // still observes the real machine. Test the direct controller and
+        // Engine's shared reservation path, both cold and after prefix reuse.
+        func stateFingerprint(_ state: Qwen4ExpModel.State) -> [String: String] {
+            state.diagnosticTensors().mapValues { array in
+                "\(array.dtype):\(array.shape):\(SHA256.hash(data: array.asData(access: .copy).data))"
+            }
+        }
+        for seeded in [false, true] {
+            for sharedReservations in [false, true] {
+                let label = "scope allocation refusal/seeded=\(seeded)/shared=\(sharedReservations)"
+                let guardedCache = seeded ? PrefixCache(maxTokens: 8192) : nil
+                let observedState = seeded ? model.makeState() : nil
+                if let observedState {
+                    eval(model.lastLogits(Array(prompt.prefix(256)), state: observedState))
+                    guardedCache!.store(state: observedState, tokens: Array(prompt.prefix(256)))
+                }
+                let beforeState = observedState.map(stateFingerprint)
+                let beforeSequenceBytes = observedState?.allocatedSequenceBytes ?? 0
+                let savedCacheLimit = MLX.Memory.cacheLimit
+                var availableGB = min(Planner.deviceAvailableGB() ?? 0, 3.0)
+                var admitted = false, numericCallbacks = 0, routerCallbacks = 0
+                let reservations = RequestMemoryReservations()
+                var request: RequestController? = RequestController(
+                    configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
+                    slackBytes: 0, availableGB: { availableGB })
+                if sharedReservations { try request!.attachReservations(reservations) }
+                model.contextNumericsObserver = { _, _, _ in numericCallbacks += 1 }
+                model.routerObserver = { _, _ in routerCallbacks += 1 }
+                let result = generator.generate(promptIds: prompt, params: params, eosIds: [],
+                    cache: guardedCache, request: request, onAdmitted: {
+                        admitted = true
+                        // Ordinary 256-row compute plus bounded frontier and
+                        // sequence growth fit 500 MB here; full expert
+                        // workspace cannot. Never inject more than live RAM.
+                        availableGB = min(Planner.deviceAvailableGB() ?? 0, 0.5)
+                        return true
+                    })
+                model.contextNumericsObserver = nil
+                model.routerObserver = nil
+                c.expect("\(label): reached post-admission dispatch", admitted)
+                c.equal("\(label): typed memory refusal", request?.failure?.code, .insufficientMemory)
+                c.expect("\(label): refused the actual prefill allocation",
+                    request?.failure?.message.contains("prefill pass") == true
+                        && (request?.failure?.requiredBytes ?? 0) > 500_000_000)
+                c.expect("\(label): emits no token", result.0.isEmpty)
+                c.equal("\(label): no forward math", numericCallbacks, 0)
+                c.equal("\(label): no router execution", routerCallbacks, 0)
+                c.equal("\(label): no expert reads", model.pool.recordsFetched, 0)
+                c.equal("\(label): no committed new tokens", result.1.prefillTokens, 0)
+                c.expect("\(label): no completed compute passes", result.1.prefillComputePasses.isEmpty)
+                c.equal("\(label): no sequence allocation before refusal",
+                    result.1.allocatedSequenceBytes, beforeSequenceBytes)
+                c.equal("\(label): restores caller buffer-cache limit", MLX.Memory.cacheLimit, savedCacheLimit)
+                c.equal("\(label): releases every pool pin", model.pool.pinnedSlotCount, 0)
+                if let observedState, let beforeState {
+                    c.equal("\(label): committed prefix bytes unchanged", stateFingerprint(observedState), beforeState)
+                    c.equal("\(label): committed prefix offset unchanged", observedState.tokenCount, 256)
+                }
+                request = nil
+                c.equal("\(label): releases shared reservation ownership", reservations.reservedBytes, 0)
             }
         }
         return c.report()

````````````

## Artifact SHA-256 bf2466b61bf758cb8a45748e2ea9e6c8b5484c22017400f3ae8feb2e342471b2

Encoding: `utf-8`. Original bytes: 799.

````````````text
{
  "classification": "Unapplied native diagnostic addition on exact V402. Tests real Generator refusal after initial admission, direct/shared reservation ownership, cold/256-token cached prefix, zero forward/router/read/commit/allocation and byte-exact prefix preservation. No compiler/model run; current V409 is independent and unmodified.",
  "source_base": "scope-allocation-build-v402",
  "file": "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
  "before_sha256": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542",
  "after_sha256": "3e508f97a36bcea68b8f21f0731b4bf5ddaf5aae5d33ff8987b69c9db66336a4",
  "patch_sha256": "d7e8c24516834c9e4512ee33259ffa5bbad5035616fbe98cc6189a2585286a61",
  "new_assertions": 56,
  "compiled": false,
  "native_executed": false
}

````````````
