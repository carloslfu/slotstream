import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationRuntimeBudgetLifecycle(modelDir: URL) async throws -> CheckReport {
        let base = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
            mtp: .off, vision: .on, visionAvailable: true)
        let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: false)
        let plan = try Planner.applyingRuntimePolicy(base, policy: policy)
        let engine = try await Engine(modelDir: modelDir, plan: plan)
        MLX.Memory.cacheLimit = 128 << 20
        engine.model.optimizations.compactStateWindows = true
        engine.model.optimizations.skipUnusedFinalForward = true
        var c = CheckBuilder("optimization-runtime-budget-lifecycle")
        c.equal("initial pool is the resolved allocation", engine.model.pool.slots, plan.slots)
        c.expect("released reservations buy real expert capacity", plan.slots > base.slots)
        c.equal("initial prefill matches the reservation", engine.generator.prefillChunk, 256)
        c.equal("initial retained-state allowance is zero", engine.prefixCache.maxTokens, 0)
        engine.generator.prefillChunk = 4096
        c.equal("public prefill change cannot spend a released reservation", engine.generator.prefillChunk, 256)
        engine.prefixCache.enabled = true; engine.prefixCache.maxTokens = Int.max
        c.equal("public prefix toggle cannot spend a released reservation", engine.prefixCache.maxTokens, 0)
        let prompt = engine.tokenizer.encode(text: "Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because")
        var params = SampleParams.greedy; params.maxTokens = 16; params.seed = 7
        let original = engine.generate(promptIds: prompt, params: params)
        c.equal("initial request completes its requested output", original.ids.count, 16)
        c.equal("disabled cache never retains generated state", engine.prefixCache.heldTokens, 0)
        // Exercise the actual governor wiring using a bounded lower reading.
        // No synthetic value can allocate above the already loaded 10 GB plan.
        let priorAvailability = Planner.availabilityOverride
        defer { Planner.availabilityOverride = priorAvailability }
        Planner.availabilityOverride = 0
        engine.updatePlan(MemoryPlan(source: .auto, slots: plan.slots, targetGB: plan.targetGB,
            ramGB: plan.ramGB, workingSetGB: plan.workingSetGB, ramPercent: plan.ramPercent,
            availableGB: 0, clamped: true, prefillChunk: plan.prefillChunk,
            prefixCacheTokens: plan.prefixCacheTokens, mtpEnabled: plan.mtpEnabled,
            visionEnabled: plan.visionEnabled, maxContextTokens: plan.maxContextTokens,
            notes: ["bounded governor diagnostic: only shrinking is exercised"], runtimeAllocationPolicy: policy))
        let governor = MemoryGovernor(engine: engine)
        let expectedDonation = GovernorPolicy.desiredSlots(GovernorPolicy.Inputs(
            currentSlots: plan.slots, availableGB: 0, ramGB: plan.ramGB,
            workingSetGB: plan.workingSetGB, ramPercent: plan.ramPercent,
            visionEnabled: plan.visionEnabled, maxContextTokens: plan.maxContextTokens,
            runtimeAllocationPolicy: policy))
        governor.pollNow()
        c.equal("live governor applies the policy's resolved lower allocation", Optional(engine.model.pool.slots), expectedDonation)
        c.expect("live governor releases real expert capacity", engine.model.pool.slots < plan.slots)
        c.equal("live governor preserves the runtime policy", engine.currentPlan?.runtimeAllocationPolicy, policy)
        c.equal("live governor preserves prefill ceiling", engine.generator.prefillChunk, 256)
        c.equal("live governor preserves disabled retention", engine.prefixCache.maxTokens, 0)
        engine.generator.prefillChunk = 4096; engine.prefixCache.maxTokens = Int.max
        c.equal("post-shrink prefill cannot bypass the budget", engine.generator.prefillChunk, 256)
        c.equal("post-shrink retention cannot bypass the budget", engine.prefixCache.maxTokens, 0)
        Planner.availabilityOverride = priorAvailability
        let smaller = engine.generate(promptIds: prompt, params: params)
        c.equal("live cache donation preserves exact output IDs", smaller.ids, original.ids)
        c.equal("live cache donation preserves exact text", smaller.text, original.text)
        let slotsBeforeImage = engine.model.pool.slots
        _ = try engine.ensureVisionTower()
        c.equal("first image cannot regrow a donated arena", engine.model.pool.slots, slotsBeforeImage)
        c.equal("first image preserves disabled retention", engine.prefixCache.maxTokens, 0)
        c.equal("first image preserves prefill ceiling", engine.generator.prefillChunk, 256)
        c.equal("first image preserves runtime policy", engine.currentPlan?.runtimeAllocationPolicy, policy)
        c.expect("first image charges resident tower", engine.currentPlan?.visionResidentReserved == true)
        c.expect("reported image plan remains inside explicit target", (engine.currentPlan?.expectedPeakGB ?? .infinity) <= 10)
        let afterImage = engine.generate(promptIds: prompt, params: params)
        c.equal("text after tower loading preserves exact output", afterImage.ids, original.ids)
        c.measure("base_pool_slots", Double(base.slots))
        c.measure("resolved_pool_slots", Double(plan.slots))
        c.measure("base_expected_peak_gb", base.expectedPeakGB)
        c.measure("resolved_expected_peak_gb", plan.expectedPeakGB)
        return c.report()
    }

    public static func optimizationRuntimeBudget() throws -> CheckReport {
        var c = CheckBuilder("optimization-runtime-budget")
        let disabled = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: false)
        for target in [8.1, 10, 16, 24, 33] {
            for head in [false, true] where !head || target >= Planner.minMemoryGB + Planner.mtpResidentGB {
                let base = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: 51.54, workingSetGB: 40, availableGB: 40,
                    mtp: head ? .on : .off, mtpAvailable: head,
                    vision: .on, visionAvailable: true, simulated: true)
                for chunk in [256, min(512, base.prefillChunk), base.prefillChunk] {
                    for retained in [false, true] {
                        let label = "\(target)/head=\(head)/chunk=\(chunk)/cache=\(retained)"
                        let policy = try RuntimeAllocationPolicy(prefillChunkOverride: chunk, prefixCacheEnabled: retained)
                        let p = try Planner.applyingRuntimePolicy(base, policy: policy)
                        c.equal("\(label): effective prefill", p.prefillChunk, chunk)
                        c.equal("\(label): retention allowance", p.prefixCacheTokens, retained ? base.prefixCacheTokens : 0)
                        c.expect("\(label): original peak envelope retained", p.expectedPeakGB <= base.expectedPeakGB + 1e-8)
                        c.expect("\(label): no missing record worth of budget", base.expectedPeakGB - p.expectedPeakGB < Geometry.gb(1) + 1e-8)
                        c.expect("\(label): capacity never decreases for released reservations", p.slots >= base.slots)
                        c.equal("\(label): resident head preserved", p.mtpEnabled, head)
                        c.equal("\(label): simulated allocation cannot become loadable", p.simulated, true)
                        let twice = try Planner.applyingRuntimePolicy(p, policy: policy)
                        c.equal("\(label): cannot credit reservations twice", twice.slots, p.slots)
                        c.equal("\(label): policy survives repeated resolution", twice.runtimeAllocationPolicy, policy)
                    }
                }
                if target >= Planner.minMemoryGB + Planner.visionResidentGB + (head ? Planner.mtpResidentGB : 0) {
                    let resolved = try Planner.applyingRuntimePolicy(base, policy: disabled)
                    let loaded = try Planner.loadingVision(resolved)
                    c.equal("\(target)/\(head): image preserves runtime policy", loaded.runtimeAllocationPolicy, disabled)
                    c.equal("\(target)/\(head): image cannot restore disabled retention", loaded.prefixCacheTokens, 0)
                    c.equal("\(target)/\(head): image preserves declared prefill", loaded.prefillChunk, 256)
                    c.expect("\(target)/\(head): image resident bytes are charged", loaded.visionResidentReserved)
                    c.expect("\(target)/\(head): image stays within target", loaded.expectedPeakGB <= target)
                }
            }
        }
        for (experts, pool) in [(Optional(20), Optional<Double>.none), (nil, Optional(3.0))] {
            let base = try Planner.plan(expertsPerLayer: experts, poolGB: pool, memoryGB: nil,
                ramGB: 51.54, workingSetGB: 40, availableGB: 40, simulated: true)
            let resolved = try Planner.applyingRuntimePolicy(base, policy: disabled)
            c.equal("raw \(base.source): explicit expert capacity is preserved", resolved.slots, base.slots)
            c.expect("raw \(base.source): smaller reservations lower expected peak", resolved.expectedPeakGB < base.expectedPeakGB)
        }
        for invalid in [Int.min, -1, 0, 1, 255, 4097, Int.max] {
            do {
                _ = try RuntimeAllocationPolicy(prefillChunkOverride: invalid)
                c.expect("invalid chunk \(invalid) refuses before allocation", false)
            } catch { c.expect("invalid chunk \(invalid) refuses before allocation", true) }
        }
        let floor = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 8.1,
            ramGB: 51.54, workingSetGB: 40, availableGB: 40, simulated: true)
        do {
            _ = try Planner.applyingRuntimePolicy(floor, policy: RuntimeAllocationPolicy(prefillChunkOverride: 4096))
            c.expect("oversized prefill cannot borrow unreserved memory", false)
        } catch { c.expect("oversized prefill cannot borrow unreserved memory", true) }
        let pinned = try Planner.applyingRuntimePolicy(floor, policy: disabled)
        do {
            _ = try Planner.applyingRuntimePolicy(pinned, policy: RuntimeAllocationPolicy())
            c.expect("changing an applied policy needs a fresh base plan", false)
        } catch { c.expect("changing an applied policy needs a fresh base plan", true) }
        let cache = PrefixCache(maxTokens: 4096)
        cache.setBudgetLimit(0); cache.enabled = true; cache.maxTokens = Int.max
        c.equal("cache toggle cannot restore spent reservation", cache.maxTokens, 0)
        cache.setBudgetLimit(1024); cache.maxTokens = 2048
        c.equal("a new plan can restore only its charged cache allowance", cache.maxTokens, 1024)
        cache.setBudgetLimit(512)
        c.equal("shrinking a live allowance clamps immediately", cache.maxTokens, 512)
        for pressure: GovernorPolicy.Pressure? in [nil, .warning, .critical] {
            let inputs = GovernorPolicy.Inputs(currentSlots: 4096, availableGB: 12, ramGB: 51.54,
                workingSetGB: 40, secondsSincePressure: 120, secondsSinceResize: 120,
                pressure: pressure, runtimeAllocationPolicy: disabled)
            if let plan = GovernorPolicy.desiredPlan(inputs) {
                c.equal("governor \(String(describing: pressure)): policy preserved", plan.runtimeAllocationPolicy, disabled)
                c.equal("governor \(String(describing: pressure)): retention remains disabled", plan.prefixCacheTokens, 0)
            } else { c.expect("governor can derive a bounded plan", false) }
            for slots in [Geometry.floorSlots, 1024, 4096] {
                let controls = GovernorPolicy.liveControls(for: slots, inputs: inputs)
                c.equal("governor \(String(describing: pressure))/\(slots): prefill override bounds recovery", controls.prefillChunk, 256)
                c.equal("governor \(String(describing: pressure))/\(slots): retention never restored", controls.prefixCacheTokens, 0)
            }
        }
        return c.report()
    }
}
