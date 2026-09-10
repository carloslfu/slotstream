import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Isolate scheduling sensitivity from random sampling: identical greedy
    /// inputs and weights, with only timing observations changed. A failure is
    /// a counterexample to transparent timing-driven adaptive batching.
    public static func optimizationAdaptiveSensitivity(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.skipUnusedFinalForward = true; options.boundedDraftTail = true
        let generator = Generator(model: model)
        generator.draftDepth = 1
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        var params = SampleParams.greedy; params.maxTokens = 32; params.seed = 7
        var outputs: [String: [Int]] = [:]
        var c = CheckBuilder("optimization-adaptive-schedule-sensitivity")
        for name in ["plain", "fixed", "cheap", "expensive", "runtime-a", "runtime-b"] {
            options.adaptiveSpeculation = name != "plain" && name != "fixed"
            model.optimizations = options
            generator.speculationEnabled = name != "plain"
            if name == "cheap" { generator.adaptiveCostOverride = { _, draft in draft ? 0.5 : 1 } }
            else if name == "expensive" { generator.adaptiveCostOverride = { _, draft in draft ? 1000 : 1 } }
            else { generator.adaptiveCostOverride = nil }
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [])
            outputs[name] = result.0
            c.equal("\(name): requested token count", result.0.count, 32)
            for (position, id) in result.0.enumerated() { c.measure("\(name).token.\(position)", Double(id)) }
            for (round, depth) in result.1.adaptiveDraftDepths.enumerated() { c.measure("\(name).depth.\(round)", Double(depth)) }
            c.measure("\(name).drafted_tokens", Double(result.1.draftedTokens))
            c.measure("\(name).accepted_drafts", Double(result.1.acceptedDrafts))
            c.measure("\(name).plain_tokens", Double(result.1.adaptivePlainTokens))
        }
        c.equal("changing only observed costs preserves exact output", outputs["cheap"], outputs["expensive"])
        c.equal("repeated runtime policy preserves exact output", outputs["runtime-a"], outputs["runtime-b"])
        for name in ["fixed", "cheap", "expensive", "runtime-a", "runtime-b"] {
            let first = zip(outputs["plain"]!, outputs[name]!).enumerated().first { $0.element.0 != $0.element.1 }?.offset
            c.measure("\(name).first_difference_from_plain", Double(first ?? -1))
        }
        return c.report()
    }

    public static func optimizationAdaptivePolicy() -> CheckReport {
        var c = CheckBuilder("optimization-adaptive-policy")
        func calibrated(_ depth: Int) -> AdaptiveSpeculationPolicy {
            var p = AdaptiveSpeculationPolicy(maximumDepth: depth)
            for context in 1 ... 3 {
                c.equal("calibration \(depth)/\(context) precedes drafting", p.action(contextTokens: context), .calibrate)
                p.observePlain(seconds: 1, contextTokens: context)
            }
            return p
        }
        var boundedLow = calibrated(Int.min), boundedHigh = calibrated(Int.max)
        c.equal("depth has a nonzero lower bound", boundedLow.action(contextTokens: 4), .draft(1))
        c.equal("depth has a finite recording bound", boundedHigh.action(contextTokens: 4), .draft(16))
        var slow = calibrated(4)
        for (before, after) in [(4, 2), (2, 1), (1, 0)] {
            for n in 0 ..< 3 {
                c.equal("depth \(before) retains observations before decision \(n)", slow.action(contextTokens: 4), .draft(before))
                slow.observeDraft(seconds: 10, emitted: 1, drafted: before, accepted: 0)
            }
            c.equal("slow depth \(before) is reduced or disabled", slow.action(contextTokens: 4), after == 0 ? .plain : .draft(after))
        }
        slow.observePlain(seconds: 1000, contextTokens: 5)
        c.equal("disabled policy never resurrects a stale head", slow.action(contextTokens: 5), .plain)
        var fast = calibrated(2)
        for _ in 0 ..< 3 { fast.observeDraft(seconds: 1.5, emitted: 3, drafted: 2, accepted: 2) }
        c.equal("cost is divided by actual emitted tokens", fast.action(contextTokens: 4), .draft(2))
        var zeroAcceptance = calibrated(1)
        for _ in 0 ..< 3 { zeroAcceptance.observeDraft(seconds: 0.5, emitted: 1, drafted: 1, accepted: 0) }
        c.equal("acceptance alone cannot reject a faster measured path", zeroAcceptance.action(contextTokens: 4), .draft(1))
        var boundary = calibrated(1)
        for _ in 0 ..< 3 { boundary.observeDraft(seconds: 1.05, emitted: 1, drafted: 1, accepted: 0) }
        c.equal("exact five-percent boundary is retained", boundary.action(contextTokens: 4), .draft(1))
        for _ in 0 ..< 3 { boundary.observeDraft(seconds: 1.050001, emitted: 1, drafted: 1, accepted: 0) }
        c.equal("cost beyond the boundary disables depth one", boundary.action(contextTokens: 4), .plain)
        var context = calibrated(1)
        c.equal("context growth refreshes the target baseline", context.action(contextTokens: 259), .calibrate)
        c.equal("context refresh needs fresh observations", context.action(contextTokens: 259), .calibrate)
        for value in [Double.nan, .infinity, -1, 0] {
            var p = calibrated(1)
            p.observeDraft(seconds: value, emitted: 1, drafted: 1, accepted: 0)
            c.equal("invalid cost fails closed", p.action(contextTokens: 4), .plain)
        }
        var rewind = calibrated(1)
        c.equal("context rewind discards the cost history", rewind.action(contextTokens: 2), .plain)
        return c.report()
    }

    public static func optimizationAdaptiveMTP(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.skipUnusedFinalForward = true; options.boundedDraftTail = true
        options.adaptiveSpeculation = true
        model.optimizations = options
        let generator = Generator(model: model)
        generator.draftDepth = 1
        generator.adaptiveCostOverride = { _, draft in draft ? 1000 : 1 }
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        var params = SampleParams.greedy; params.maxTokens = 16; params.seed = 7
        let aCache = PrefixCache(maxTokens: 4096), bCache = PrefixCache(maxTokens: 4096)
        let a = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: aCache)
        let b = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: bCache)
        var c = CheckBuilder("optimization-adaptive-mtp")
        c.equal("replayed cost observations preserve exact IDs", a.0, b.0)
        c.equal("replayed cost observations preserve exact decisions", a.1.adaptiveDraftDepths, b.1.adaptiveDraftDepths)
        c.equal("three useful target steps calibrate before drafting", Array(a.1.adaptiveDraftDepths.prefix(3)), [0, 0, 0])
        c.equal("three expensive draft rounds then disable", a.1.adaptiveDraftDepths, [0, 0, 0, 1, 1, 1, -1])
        c.equal("requested output count is preserved", a.0.count, 16)
        c.expect("plain fallback emits real target tokens", a.1.adaptivePlainTokens > 0)
        let held = prompt + Array(a.0.dropLast())
        guard let retainedA = aCache.take(matching: prompt + a.0 + [907], reserveTokens: 128),
              let retainedB = bCache.take(matching: prompt + b.0 + [907], reserveTokens: 128),
              let disabledAt = a.1.adaptiveDisabledAtOutput else {
            c.expect("fallback produces retained states and a decision boundary", false)
            return c.report()
        }
        let aState = retainedA.state, bState = retainedB.state
        c.equal("plain fallback leaves the final emitted token pending", aState.tokenCount, held.count)
        c.expect("disabled head state is invalidated", aState.mtp == nil && !aState.hasValidMTP)
        let expected = aState.diagnosticTensors(), actual = bState.diagnosticTensors()
        c.equal("replayed state has exactly the same fields", Set(actual.keys), Set(expected.keys))
        for key in expected.keys.sorted() {
            if let value = actual[key] {
                c.expect("replayed state \(key) is exact", value.shape == expected[key]!.shape
                    && (value .== expected[key]!).all().item(Bool.self))
            }
        }
        aCache.store(state: aState, tokens: held); bCache.store(state: bState, tokens: held)
        params.maxTokens = 4
        let nextA = generator.generate(promptIds: prompt + a.0 + [907], params: params, eosIds: [], cache: aCache)
        let nextB = generator.generate(promptIds: prompt + b.0 + [907], params: params, eosIds: [], cache: bCache)
        c.equal("continued invalid-head prefix emits exact tokens", nextA.0, nextB.0)
        c.equal("continued invalid-head prefix is reused", nextA.1.reusedPrefixTokens, held.count)
        c.equal("continued prefix never drafts on stale head state", nextA.1.draftedTokens, 0)
        c.expect("continued prefix has no adaptive head decisions", nextA.1.adaptiveDraftDepths.isEmpty)
        params.maxTokens = 16
        let stopAt = disabledAt + 1
        var emitted = 0
        let cancelledCache = PrefixCache(maxTokens: 4096)
        let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cancelledCache,
            onToken: { _ in emitted += 1; return emitted < stopAt })
        c.equal("stop at first plain output preserves exact prefix", cancelled.0, Array(a.0.prefix(stopAt)))
        c.equal("stop at first plain output is reported", cancelled.1.finishReason, "stop")
        guard let stopped = cancelledCache.take(matching: prompt + cancelled.0 + [907], reserveTokens: 128)?.state else {
            c.expect("stopped plain state is retained", false)
            return c.report()
        }
        c.equal("stop leaves its emitted token unconsumed", stopped.tokenCount, prompt.count + cancelled.0.count - 1)
        c.expect("stop cannot reactivate the head", !stopped.hasValidMTP)
        c.expect("resident head stays loaded and must remain charged", model.mtpHead != nil)
        // Compare emitted tokens with an independently selected target-only
        // loop at the same resident-head and pool footprint. No cost override
        // can influence that loop's model or sampler.
        generator.speculationEnabled = false
        let plain = generator.generate(promptIds: prompt, params: params, eosIds: [])
        c.equal("adaptive greedy IDs agree with target-only decode", a.0, plain.0)
        generator.speculationEnabled = true
        for limit in 1 ... 4 {
            params.maxTokens = limit
            let cache = PrefixCache(maxTokens: 4096)
            let short = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
            c.equal("short \(limit): exact target prefix", short.0, Array(a.0.prefix(limit)))
            c.equal("short \(limit): no unused draft", short.1.draftedTokens, 0)
            c.equal("short \(limit): exact useful calibration count", short.1.adaptiveDraftDepths.count, limit - 1)
            if let state = cache.take(matching: prompt + short.0 + [907], reserveTokens: 32)?.state {
                c.equal("short \(limit): pending output accounting", state.tokenCount, prompt.count + limit - 1)
                c.expect("short \(limit): aligned head", state.hasValidMTP)
            } else { c.expect("short \(limit): state retained", false) }
        }
        params.maxTokens = 16
        // All callback stop positions cover calibration, speculative verify,
        // committed fallback and ordinary target steps, including their tails.
        for limit in 1 ... a.0.count {
            let cache = PrefixCache(maxTokens: 4096)
            var count = 0
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                onToken: { _ in count += 1; return count < limit })
            c.equal("callback \(limit): exact emitted prefix", result.0, Array(a.0.prefix(limit)))
            c.equal("callback \(limit): stop reason", result.1.finishReason, "stop")
            if let state = cache.take(matching: prompt + result.0 + [907], reserveTokens: 32)?.state {
                c.equal("callback \(limit): no consumed unobserved output", state.tokenCount, prompt.count + limit - 1)
                c.equal("callback \(limit): head validity", state.hasValidMTP, limit <= disabledAt)
            } else { c.expect("callback \(limit): state retained", false) }
        }
        // An EOS never reaches the callback. Distinct first occurrences avoid
        // pretending that a repeated ID can be made EOS only at a later step.
        var eosSeen = Set<Int>()
        for (position, eos) in a.0.enumerated() where eosSeen.insert(eos).inserted {
            let cache = PrefixCache(maxTokens: 4096)
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [eos], cache: cache)
            c.equal("EOS \(position): exact preceding prefix", result.0, Array(a.0.prefix(position)))
            c.equal("EOS \(position): stop reason", result.1.finishReason, "stop")
            if let state = cache.take(matching: prompt + a.0 + [907], reserveTokens: 32)?.state {
                c.equal("EOS \(position): only emitted tokens consumed", state.tokenCount, prompt.count + position)
            } else { c.expect("EOS \(position): state retained", false) }
        }
        for rounds in [1, 3] {
            var observed = 0, running = true
            generator.adaptiveCostOverride = { _, draft in
                if draft { observed += 1; if observed == rounds { running = false } }
                return draft ? 1000 : 1
            }
            let cache = PrefixCache(maxTokens: 4096)
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                shouldContinue: { running })
            c.equal("committed cancellation \(rounds): exact prefix", result.0, Array(a.0.prefix(result.0.count)))
            c.equal("committed cancellation \(rounds): cancellation reason", result.1.finishReason, "cancelled")
            c.equal("committed cancellation \(rounds): typed cancellation", result.1.requestFailure?.code, .clientCancelled)
            c.equal("committed cancellation \(rounds): no unrequested fallback", result.1.adaptivePlainTokens, 0)
            if let state = cache.take(matching: prompt + result.0 + [907], reserveTokens: 32)?.state {
                c.equal("committed cancellation \(rounds): pending output accounting", state.tokenCount, prompt.count + result.0.count - 1)
                c.expect("committed cancellation \(rounds): aligned reusable head", state.hasValidMTP)
            } else { c.expect("committed cancellation \(rounds): state retained", false) }
        }
        return c.report()
    }
}
