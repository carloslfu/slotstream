import CryptoKit
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
        // Refuse a workspace before any forward or expert read. Only the
        // request observation is lowered; the outer native resource guard
        // still observes the real machine. Test the direct controller and
        // Engine's shared reservation path, both cold and after prefix reuse.
        func stateFingerprint(_ state: Qwen4ExpModel.State) -> [String: String] {
            state.diagnosticTensors().mapValues { array in
                "\(array.dtype):\(array.shape):\(SHA256.hash(data: array.asData(access: .copy).data))"
            }
        }
        for seeded in [false, true] {
            for sharedReservations in [false, true] {
                let label = "scope allocation refusal/seeded=\(seeded)/shared=\(sharedReservations)"
                let guardedCache = seeded ? PrefixCache(maxTokens: 8192) : nil
                let observedState = seeded ? model.makeState() : nil
                if let observedState {
                    eval(model.lastLogits(Array(prompt.prefix(256)), state: observedState))
                    guardedCache!.store(state: observedState, tokens: Array(prompt.prefix(256)))
                }
                let beforeState = observedState.map(stateFingerprint)
                let beforeSequenceBytes = observedState?.allocatedSequenceBytes ?? 0
                let savedCacheLimit = MLX.Memory.cacheLimit
                var availableGB = min(Planner.deviceAvailableGB() ?? 0, 3.0)
                var admitted = false, numericCallbacks = 0, routerCallbacks = 0
                let reservations = RequestMemoryReservations()
                var request: RequestController? = RequestController(
                    configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
                    slackBytes: 0, availableGB: { availableGB })
                if sharedReservations { try request!.attachReservations(reservations) }
                model.contextNumericsObserver = { _, _, _ in numericCallbacks += 1 }
                model.routerObserver = { _, _ in routerCallbacks += 1 }
                let result = generator.generate(promptIds: prompt, params: params, eosIds: [],
                    cache: guardedCache, request: request, onAdmitted: {
                        admitted = true
                        // Ordinary 256-row compute plus bounded frontier and
                        // sequence growth fit 500 MB here; full expert
                        // workspace cannot. Never inject more than live RAM.
                        availableGB = min(Planner.deviceAvailableGB() ?? 0, 0.5)
                        return true
                    })
                model.contextNumericsObserver = nil
                model.routerObserver = nil
                c.expect("\(label): reached post-admission dispatch", admitted)
                c.equal("\(label): typed memory refusal", request?.failure?.code, .insufficientMemory)
                c.expect("\(label): refused the actual prefill allocation",
                    request?.failure?.message.contains("prefill pass") == true
                        && (request?.failure?.requiredBytes ?? 0) > 500_000_000)
                c.expect("\(label): emits no token", result.0.isEmpty)
                c.equal("\(label): no forward math", numericCallbacks, 0)
                c.equal("\(label): no router execution", routerCallbacks, 0)
                c.equal("\(label): no expert reads", model.pool.recordsFetched, 0)
                c.equal("\(label): no committed new tokens", result.1.prefillTokens, 0)
                c.expect("\(label): no completed compute passes", result.1.prefillComputePasses.isEmpty)
                c.equal("\(label): no sequence allocation before refusal",
                    result.1.allocatedSequenceBytes, beforeSequenceBytes)
                c.equal("\(label): restores caller buffer-cache limit", MLX.Memory.cacheLimit, savedCacheLimit)
                c.equal("\(label): releases every pool pin", model.pool.pinnedSlotCount, 0)
                if let observedState, let beforeState {
                    c.equal("\(label): committed prefix bytes unchanged", stateFingerprint(observedState), beforeState)
                    c.equal("\(label): committed prefix offset unchanged", observedState.tokenCount, 256)
                }
                request = nil
                c.equal("\(label): releases shared reservation ownership", reservations.reservedBytes, 0)
            }
        }
        if integratedBase {
            // Exercise the actual Generator choice, not merely the schedule
            // helper. Every paired state uses its own planner compute shape.
            enum ScopeBudget: Equatable { case process, device }
            func automaticRun(_ ids: [Int], chunk: Int, enabled: Bool,
                              cache: PrefixCache = PrefixCache(maxTokens: 8192),
                              processLimit: Int? = nil, roomAfterAdmission: Double? = nil,
                              smallerScopeBudget: ScopeBudget? = nil)
                throws -> (ids: [Int], stats: GenStats, state: Qwen4ExpModel.State?,
                           routes: [Int: [Int32]], cache: PrefixCache) {
                let savedOptions = model.optimizations, savedChunk = generator.prefillChunk
                let savedLimit = generator.readScopeFootprintLimitBytes
                let savedObserver = model.routerObserver
                let savedPricingObserver = generator.automaticScopePricingObserver
                defer {
                    model.optimizations = savedOptions; generator.prefillChunk = savedChunk
                    generator.readScopeFootprintLimitBytes = savedLimit; model.routerObserver = savedObserver
                    generator.automaticScopePricingObserver = savedPricingObserver
                }
                var selected = InferenceOptimizations.integrationCandidate
                selected.automaticReadScope = enabled ? true : nil
                model.optimizations = selected; generator.prefillChunk = chunk
                generator.readScopeFootprintLimitBytes = processLimit
                var room = min(Planner.deviceAvailableGB() ?? 0, 3.0)
                var constrainedLargerChoice = false
                generator.automaticScopePricingObserver = nil
                if let smallerScopeBudget {
                    generator.automaticScopePricingObserver = { groups, bytes, footprint in
                        guard let index = groups.firstIndex(where: { $0.count == 4 }) else { return }
                        // Constrain an actual priced allocation. Never grant
                        // more live device memory than the real reading.
                        let bound = ContextBytes.sum(bytes[index], 1024)
                        constrainedLargerChoice = constrainedLargerChoice || groups.contains { $0.count > 4 }
                        c.expect("smaller automatic scope excludes each larger priced group/\(smallerScopeBudget)",
                            zip(groups, bytes).allSatisfy { $0.0.count == 4 || $0.1 > bound })
                        switch smallerScopeBudget {
                        case .process:
                            generator.readScopeFootprintLimitBytes = min(processLimit ?? Int.max,
                                ContextBytes.sum(footprint, bound))
                        case .device:
                            room = min(Planner.deviceAvailableGB() ?? 0, Double(bound) / 1e9)
                        }
                    }
                }
                let request = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
                    slackBytes: 0, availableGB: {
                        if roomAfterAdmission != nil || smallerScopeBudget == .device {
                            return min(Planner.deviceAvailableGB() ?? 0, room)
                        }
                        return Planner.deviceAvailableGB()
                    })
                let shared = RequestMemoryReservations()
                try request.attachReservations(shared)
                var routes: [Int: [Int32]] = [:], controlsStayedPublic = true
                model.routerObserver = { layer, values in
                    controlsStayedPublic = controlsStayedPublic && model.optimizations == selected
                    routes[layer, default: []].append(contentsOf: values)
                }
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    request: request, onAdmitted: {
                        if let roomAfterAdmission { room = min(Planner.deviceAvailableGB() ?? 0, roomAfterAdmission) }
                        return true
                    })
                model.routerObserver = savedObserver
                c.expect("automatic choice preserves public controls during every router callback/\(chunk)/\(ids.count)/\(enabled)", controlsStayedPublic)
                c.equal("automatic actual choice restores all controls/\(chunk)/\(ids.count)/\(enabled)", model.optimizations, selected)
                c.equal("automatic actual choice does not poison request/\(chunk)/\(ids.count)/\(enabled)", request.failure, nil)
                c.equal("automatic actual choice releases pins/\(chunk)/\(ids.count)/\(enabled)", model.pool.pinnedSlotCount, 0)
                if let smallerScopeBudget {
                    c.expect("smaller automatic scope actually rejects a larger candidate/\(smallerScopeBudget)", constrainedLargerChoice)
                    c.expect("smaller automatic scope commits four-pass groups/\(smallerScopeBudget)",
                        result.1.prefillPasses.contains(4 * chunk)
                            && result.1.prefillPasses.allSatisfy { $0 <= 4 * chunk })
                }
                let retained = cache.take(matching: ids + result.0 + [907], reserveTokens: ids.count + 4)?.state
                return (result.0, result.1, retained, routes, cache)
            }
            let longPrompt = (0 ..< 4099).map { 1000 + (($0 * 7919) % 200_000) }
            for chunk in [256, 512, 1024] {
                let original = try automaticRun(longPrompt, chunk: chunk, enabled: false)
                let automatic = try automaticRun(longPrompt, chunk: chunk, enabled: true)
                c.equal("automatic planner shape retains exact output/\(chunk)", automatic.ids, original.ids)
                c.equal("automatic planner shape retains all numerical passes/\(chunk)",
                    automatic.stats.prefillComputePasses, original.stats.prefillComputePasses)
                c.equal("automatic planner shape retains exact ordered routes/\(chunk)", automatic.routes, original.routes)
                c.expect("automatic planner shape actually shares reads/\(chunk)",
                    automatic.stats.prefillPasses.contains { $0 > chunk })
                c.expect("automatic planner shape reduces actual expert reads/\(chunk)",
                    automatic.stats.prefillRecords < original.stats.prefillRecords)
                c.equal("automatic odd tail stays an original pass/\(chunk)", automatic.stats.prefillPasses.last, 3)
                var smallerStates: [(ScopeBudget, Qwen4ExpModel.State?)] = []
                if chunk == 256 {
                    for budget in [ScopeBudget.process, .device] {
                        let smaller = try automaticRun(longPrompt, chunk: chunk, enabled: true, smallerScopeBudget: budget)
                        c.equal("smaller automatic scope retains exact output/\(budget)", smaller.ids, original.ids)
                        c.equal("smaller automatic scope retains every compute shape/\(budget)",
                            smaller.stats.prefillComputePasses, original.stats.prefillComputePasses)
                        c.equal("smaller automatic scope retains exact ordered routes/\(budget)", smaller.routes, original.routes)
                        c.expect("smaller automatic scope reduces actual expert reads/\(budget)",
                            smaller.stats.prefillRecords < original.stats.prefillRecords)
                        c.equal("smaller automatic scope preserves the cold checkpoint/\(budget)", smaller.stats.prefixCheckpointStores, 1)
                        c.equal("smaller automatic scope preserves the odd tail/\(budget)", smaller.stats.prefillPasses.last, 3)
                        if let a = original.state, let b = smaller.state {
                            equalState(a, b, "smaller automatic scope exact state/\(budget)")
                        } else { c.expect("smaller automatic scope retains both states/\(budget)", false) }
                        smallerStates.append((budget, smaller.state))
                    }
                }
                if let originalState = original.state, let automaticState = automatic.state {
                    equalState(originalState, automaticState, "automatic planner shape exact state/\(chunk)")
                    let referenceNext = model.lastLogits([907], state: originalState)
                    let automaticNext = model.lastLogits([907], state: automaticState)
                    eval(referenceNext, automaticNext)
                    c.expect("automatic teacher-forced continuation is exact/\(chunk)",
                        referenceNext.shape == automaticNext.shape && (referenceNext .== automaticNext).all().item(Bool.self))
                    for (budget, state) in smallerStates {
                        if let state {
                            let next = model.lastLogits([907], state: state)
                            eval(next)
                            c.expect("smaller automatic scope teacher-forced continuation is exact/\(budget)",
                                referenceNext.shape == next.shape && (referenceNext .== next).all().item(Bool.self))
                        } else { c.expect("smaller automatic scope retains continuation state/\(budget)", false) }
                    }
                } else { c.expect("automatic planner pair retains both complete states/\(chunk)", false) }
                if chunk == 256 {
                    c.equal("automatic cold request retains common checkpoint", automatic.stats.prefixCheckpointStores, 1)
                    let followup = Array(longPrompt.prefix(256)) + Array(longPrompt[512 ..< 1792])
                    let originalHit = try automaticRun(followup, chunk: chunk, enabled: false, cache: original.cache)
                    let automaticHit = try automaticRun(followup, chunk: chunk, enabled: true, cache: automatic.cache)
                    c.equal("automatic followup reuses the exact common prefix", automaticHit.stats.reusedPrefixTokens, 256)
                    c.equal("automatic prefix followup retains exact output", automaticHit.ids, originalHit.ids)
                    c.equal("automatic prefix followup retains compute shape", automaticHit.stats.prefillComputePasses, originalHit.stats.prefillComputePasses)
                    c.expect("automatic prefix followup shares the remaining reads", automaticHit.stats.prefillPasses.contains { $0 > 256 })
                    if let originalState = originalHit.state, let automaticState = automaticHit.state {
                        equalState(originalState, automaticState, "automatic reused prefix exact state")
                    } else { c.expect("automatic followup retains both states", false) }
                }
            }
            let boundedPrompt = Array(longPrompt.prefix(1280))
            let ordinary = try automaticRun(boundedPrompt, chunk: 256, enabled: false)
            let limited = try automaticRun(boundedPrompt, chunk: 256, enabled: true, processLimit: 1)
            let tight = try automaticRun(boundedPrompt, chunk: 256, enabled: true, roomAfterAdmission: 0.5)
            for (label, candidate) in [("process target", limited), ("live headroom", tight)] {
                c.equal("automatic \(label) fallback retains exact output", candidate.ids, ordinary.ids)
                c.equal("automatic \(label) fallback retains original read groups", candidate.stats.prefillPasses, ordinary.stats.prefillPasses)
                c.equal("automatic \(label) fallback retains exact routes", candidate.routes, ordinary.routes)
                if let a = ordinary.state, let b = candidate.state {
                    equalState(a, b, "automatic \(label) fallback exact state")
                } else { c.expect("automatic \(label) fallback retains both states", false) }
            }
            let shortPrompt = Array(longPrompt.prefix(255))
            let shortOriginal = try automaticRun(shortPrompt, chunk: 256, enabled: false)
            let shortAutomatic = try automaticRun(shortPrompt, chunk: 256, enabled: true)
            c.equal("automatic short request retains exact output", shortAutomatic.ids, shortOriginal.ids)
            c.equal("automatic short request retains original read group", shortAutomatic.stats.prefillPasses, [255])
            c.equal("automatic short request retains exact routes", shortAutomatic.routes, shortOriginal.routes)
            let callerOptions = model.optimizations, callerChunk = generator.prefillChunk
            let callerLimit = generator.readScopeFootprintLimitBytes
            var automaticOptions = InferenceOptimizations.integrationCandidate
            automaticOptions.automaticReadScope = true
            model.optimizations = automaticOptions; generator.prefillChunk = 256
            generator.readScopeFootprintLimitBytes = nil
            defer {
                model.optimizations = callerOptions; generator.prefillChunk = callerChunk
                generator.readScopeFootprintLimitBytes = callerLimit
                model.routerObserver = nil; model.pool.readFault = nil
            }
            let beforeCancelCache = MLX.Memory.cacheLimit
            var reachedLayer = -1
            model.routerObserver = { layer, _ in reachedLayer = layer }
            let cancelRequest = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
                slackBytes: 0)
            let cancelled = generator.generate(promptIds: boundedPrompt, params: params, eosIds: [],
                shouldContinue: { reachedLayer < 1 }, request: cancelRequest)
            model.routerObserver = nil
            c.expect("automatic grouped cancellation emits nothing and commits no rows",
                cancelled.0.isEmpty && cancelled.1.prefillTokens == 0 && cancelled.1.abortedReadScopes == 1)
            c.equal("automatic grouped cancellation restores caller controls", model.optimizations, automaticOptions)
            c.equal("automatic grouped cancellation restores buffer-cache limit", MLX.Memory.cacheLimit, beforeCancelCache)
            c.equal("automatic grouped cancellation releases all pins", model.pool.pinnedSlotCount, 0)
            let fault = ReadFault(afterJobs: 17)
            model.pool.readFault = fault
            let faultRequest = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
                slackBytes: 0)
            let failed = generator.generate(promptIds: boundedPrompt, params: params, eosIds: [], request: faultRequest)
            model.pool.readFault = nil
            c.expect("automatic grouped checked read fault actually fires", fault.hasFired)
            c.expect("automatic grouped read error returns no partial output",
                failed.0.isEmpty && failed.1.runtimeError != nil && failed.1.prefillTokens == 0)
            c.equal("automatic grouped read error restores caller controls", model.optimizations, automaticOptions)
            c.equal("automatic grouped read error restores buffer-cache limit", MLX.Memory.cacheLimit, beforeCancelCache)
            c.equal("automatic grouped read error releases all pins", model.pool.pinnedSlotCount, 0)
            let retryRequest = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
                slackBytes: 0)
            let retry = generator.generate(promptIds: boundedPrompt, params: params, eosIds: [], request: retryRequest)
            c.equal("automatic checked read-error retry has exact output", retry.0, ordinary.ids)
            c.expect("automatic checked read-error retry completes a real scope", retry.1.prefillPasses.contains { $0 > 256 })
            c.measure("automatic_planner_geometries", 3)
            c.measure("automatic_memory_fallbacks", 2)
            c.measure("automatic_intermediate_memory_choices", 2)
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
            let generator = Generator(model: model)
            generator.prefillCacheLimit = 128 << 20
            var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
            let prompt = (0 ..< 4096).map { 1000 + (($0 * 7919) % 200_000) }
            for chunk in [256, 512, 1024] {
                var outputs: [[Int]] = [], stats: [GenStats] = [], states: [Qwen4ExpModel.State] = []
                for automatic in [false, true] {
                    var selected = InferenceOptimizations.integrationCandidate
                    selected.automaticReadScope = automatic ? true : nil
                    model.optimizations = selected; generator.prefillChunk = chunk
                    let cache = PrefixCache(maxTokens: 8192)
                    let control = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0),
                        slackBytes: 0)
                    try control.attachReservations(RequestMemoryReservations())
                    let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                        request: control)
                    c.equal("automatic MTP selection restores controls/\(chunk)/\(automatic)", model.optimizations, selected)
                    c.equal("automatic MTP head restores configured indexer dispatch/\(chunk)/\(automatic)",
                        model.mtpHead!.usesBoundedIndexer, selected.boundedIndexer)
                    c.equal("automatic MTP selection succeeds/\(chunk)/\(automatic)", control.failure, nil)
                    c.equal("automatic MTP selection releases pool pins/\(chunk)/\(automatic)", model.pool.pinnedSlotCount, 0)
                    outputs.append(result.0); stats.append(result.1)
                    if let saved = cache.take(matching: prompt + result.0 + [907], reserveTokens: prompt.count + 8) {
                        states.append(saved.state)
                    }
                }
                c.equal("automatic MTP has exact greedy continuation/\(chunk)", outputs[1], outputs[0])
                c.equal("automatic MTP retains all prefill compute shapes/\(chunk)", stats[1].prefillComputePasses, stats[0].prefillComputePasses)
                c.expect("automatic MTP actually executes grouped prefill/\(chunk)", stats[1].prefillPasses.contains { $0 > chunk })
                c.expect("automatic MTP reduces actual expert reads/\(chunk)", stats[1].prefillRecords < stats[0].prefillRecords)
                c.equal("automatic MTP retains both complete states/\(chunk)", states.count, 2)
                if states.count == 2 { equal(states[0], states[1], "automatic MTP exact state/\(chunk)") }
            }
            c.measure("automatic_mtp_planner_geometries", 3)
            c.measure("automatic_mtp_prompt_tokens", 4096)
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
