import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// A fixed next-token replay isolates full-model compute from SSD misses.
    /// This is a component measurement, never a request-throughput benchmark.
    public static func optimizationAllHitReplay(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-all-hit-replay")
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        var common = InferenceOptimizations()
        common.compactStateWindows = true
        common.compactMTPRow = true
        common.boundedIndexer = true
        common.boundedPLE = true
        model.optimizations = common
        let state = model.makeState()
        let prefix = (0 ..< 1024).map { 1000 + ($0 * 7919) % 200_000 }
        for base in stride(from: 0, to: prefix.count, by: 256) {
            eval(model.lastLogits(Array(prefix[base ..< base + 256]), state: state))
        }
        let checkpoint = state.checkpoint()
        var expectedRoutes: [Int: [Int32]] = [:]
        model.routerObserver = { expectedRoutes[$0] = $1 }
        let expected = model.lastLogits([907], state: state)
        eval(expected)
        model.routerObserver = nil
        c.equal("reference observes all layers", expectedRoutes.count, 48)
        c.expect("one step fits the bounded pool", expectedRoutes.values.reduce(0) { $0 + Set($1).count } <= 480)
        c.measure("context_tokens", 1024)
        c.measure("next_token_id", 907)
        c.measure("pool_slots", 640)
        c.measure("replays_per_cell", 8)
        let arms = ["reference", "router-weights", "compiled-norm"]
        var reductions: [String: [Double]] = [:]
        for round in 1 ... 5 {
            var seconds: [String: Double] = [:]
            var valid: [String: Bool] = [:]
            let order = round % 2 == 1 ? arms : Array(arms.reversed())
            for arm in order {
                var options = common
                options.cachedRouterWeights = arm == "router-weights"
                options.compiledNormFinish = arm == "compiled-norm"
                model.optimizations = options
                // Cache promotion, kernel compilation and capacity growth are
                // completed before measurement, including after arm switches.
                var routes: [Int: [Int32]] = [:]
                model.routerObserver = { routes[$0] = $1 }
                state.restore(checkpoint)
                let first = model.lastLogits([907], state: state)
                eval(first)
                model.routerObserver = nil
                let exact = (first .== expected).all().item(Bool.self) && routes == expectedRoutes
                state.restore(checkpoint)
                eval(model.lastLogits([907], state: state))
                model.pool.resetStats()
                model.ngram.resetStats()
                let compiledBefore = model.compiledNormFinishes
                let vmBefore = ProcessMemory.vmActivity()
                let conditionsBefore = ProcessMemory.operatingConditions()
                let sampler = FootprintSampler(intervalMilliseconds: 5)
                let start = RuntimeClock.now()
                var final: MLXArray?
                for _ in 0 ..< 8 {
                    state.restore(checkpoint)
                    let logits = model.lastLogits([907], state: state)
                    eval(logits)
                    final = logits
                }
                let elapsed = RuntimeClock.seconds(since: start)
                let footprint = sampler.finish()
                let conditionsAfter = ProcessMemory.operatingConditions()
                let vmAfter = ProcessMemory.vmActivity()
                let key = "round_\(round).\(arm)"
                let finalExact = (final! .== expected).all().item(Bool.self)
                let allHits = model.pool.recordsFetched == 0 && model.pool.hitRate == 1
                let noSwap = vmBefore != nil && vmAfter != nil
                    && vmBefore!.swapins == vmAfter!.swapins && vmBefore!.swapouts == vmAfter!.swapouts
                let nominal = conditionsBefore.thermalState == "nominal" && conditionsAfter.thermalState == "nominal"
                    && !conditionsBefore.lowPowerModeEnabled && !conditionsAfter.lowPowerModeEnabled
                let resourceFits = footprint.samples > 1 && footprint.peakBytes > 0 && footprint.peakBytes <= 10_000_000_000
                let executed = arm != "compiled-norm" || model.compiledNormFinishes > compiledBefore
                c.expect("\(key): exact logits and ordered routes", exact && finalExact)
                c.expect("\(key): zero expert reads and all hits", allHits)
                c.expect("\(key): no interval swap", noSwap)
                c.expect("\(key): nominal operating conditions", nominal)
                c.expect("\(key): sampled footprint within 10 GB", resourceFits)
                c.expect("\(key): requested compute path executed", executed)
                c.equal("\(key): fixed context restored every replay", state.tokenCount, 1025)
                c.measure("\(key).seconds", elapsed)
                c.measure("\(key).records_fetched", Double(model.pool.recordsFetched))
                c.measure("\(key).hit_rate", model.pool.hitRate)
                c.measure("\(key).sampled_peak_bytes", Double(footprint.peakBytes))
                c.measure("\(key).samples", Double(footprint.samples))
                c.measure("\(key).router_cache_bytes", Double(model.cachedRouterBytes))
                c.measure("\(key).compiled_finishes", Double(model.compiledNormFinishes - compiledBefore))
                if let before = vmBefore, let after = vmAfter {
                    c.measure("\(key).swapins_before", Double(before.swapins))
                    c.measure("\(key).swapins_after", Double(after.swapins))
                    c.measure("\(key).swapouts_before", Double(before.swapouts))
                    c.measure("\(key).swapouts_after", Double(after.swapouts))
                }
                seconds[arm] = elapsed
                valid[arm] = exact && finalExact && allHits && noSwap && nominal && resourceFits && executed
                // Preserve completed cells and stop safely on resource changes.
                if !noSwap || !nominal || !resourceFits { return c.report() }
            }
            for arm in arms.dropFirst() where valid["reference"] == true && valid[arm] == true {
                reductions[arm, default: []].append(1 - seconds[arm]! / seconds["reference"]!)
            }
        }
        for arm in arms.dropFirst() {
            let values = (reductions[arm] ?? []).sorted()
            c.measure("\(arm).valid_pairs", Double(values.count))
            c.expect("\(arm): five exact all-hit resource-valid pairs", values.count == 5)
            if values.count == 5 {
                let median = values[2], positive = Double(values.filter { $0 > 0 }.count) / 5
                c.measure("\(arm).median_reduction_fraction", median)
                c.measure("\(arm).positive_fraction", positive)
                // Performance failure is a result, distinct from correctness.
                c.measure("\(arm).performance_gate_passed", median >= 0.05 && positive >= 0.8 ? 1 : 0)
            }
        }
        return c.report()
    }
}
