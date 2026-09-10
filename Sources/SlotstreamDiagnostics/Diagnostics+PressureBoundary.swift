import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPressureBoundary() -> CheckReport {
        var c = CheckBuilder("optimization-pressure-boundary")
        let boundary = PressureBoundary()
        c.expect("initially no cancellation request", boundary.snapshot() == nil)
        let first = boundary.request()
        c.expect("request is visible", boundary.snapshot() === first)
        let second = boundary.request()
        boundary.acknowledge(first)
        c.expect("late acknowledgement preserves newer pressure", boundary.snapshot() === second)
        boundary.acknowledge(second)
        c.expect("matching acknowledgement clears pressure", boundary.snapshot() == nil)
        boundary.acknowledge(first)
        c.expect("duplicate acknowledgement is harmless", boundary.snapshot() == nil)
        for _ in 0 ..< 64 {
            let older = boundary.request(), newer = boundary.request()
            boundary.acknowledge(older)
            c.expect("superseded event cannot clear current generation", boundary.snapshot() === newer)
            boundary.acknowledge(newer)
        }
        let gate = GenerationGate()
        let queue = DispatchQueue(label: "slotstream.pressure-boundary.check")
        let completed = DispatchSemaphore(value: 0)
        var entered = false, acquired = true
        gate.lock()
        queue.async {
            acquired = gate.tryWithExclusive { entered = true }
            _ = boundary.request()
            completed.signal()
        }
        let wait = completed.wait(timeout: .now() + 2)
        gate.unlock()
        c.expect("a busy poll leaves the pressure queue runnable", wait == .success)
        if wait == .success {
            c.expect("busy poll did not enter the mutation boundary", !acquired && !entered)
            c.expect("pressure reaches its latch during generation", boundary.snapshot() != nil)
        }
        c.expect("idle gate admits an exclusive mutation", gate.tryWithExclusive { entered = true })
        c.expect("idle mutation executed", entered)
        return c.report()
    }

    public static func optimizationGovernorBoundary(modelDir: URL, mtp: Bool) async throws -> CheckReport {
        let base = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
            mtp: mtp ? .on : .off, mtpAvailable: mtp, vision: .off)
        let engine = try await Engine(modelDir: modelDir, plan: base)
        guard engine.responsiveGovernor else { throw ModelError("diagnostic requires SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR=1") }
        MLX.Memory.cacheLimit = 128 << 20
        engine.generator.prefillChunk = 256
        engine.generator.draftDepth = 1
        engine.model.optimizations.compactStateWindows = true
        engine.model.optimizations.compactMTPRow = true
        engine.model.optimizations.skipUnusedFinalForward = true
        engine.model.optimizations.boundedDraftTail = true
        engine.prefixCache.configure(maxTokens: 1024)
        let governor = MemoryGovernor(engine: engine)
        var c = CheckBuilder("optimization-governor-boundary-\(mtp ? "mtp" : "plain")")
        let prompt = engine.tokenizer.encode(text: "Explain how a computer uses a stack to remember where a function should return.")
        var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
        let baseline = engine.generate(promptIds: prompt, params: params)
        c.equal("baseline delivers the bounded output", baseline.ids.count, 8)
        engine.withExclusive {
            governor.pressureNow(.critical)
            c.expect("explicit plans never receive a pressure cancellation", engine.pressureBoundary.snapshot() == nil)
            c.equal("explicit plans never donate capacity", engine.poolSnapshot().slots, base.slots)
        }
        engine.dropPrefixCache()
        // Reclassify only this existing bounded allocation. Zero availability
        // can shrink it but cannot invent room for another allocation.
        engine.updatePlan(MemoryPlan(source: .auto, slots: base.slots, targetGB: base.targetGB,
            ramGB: base.ramGB, workingSetGB: base.workingSetGB, ramPercent: base.ramPercent,
            availableGB: 0, clamped: true, prefillChunk: 256, prefixCacheTokens: 1024,
            mtpEnabled: base.mtpEnabled, visionEnabled: false,
            maxContextTokens: base.maxContextTokens, notes: ["bounded pressure diagnostic; shrink only"]))
        let saved = Planner.availabilityOverride
        defer { Planner.availabilityOverride = saved }
        Planner.availabilityOverride = 0
        engine.withExclusive {
            governor.pollNow()
            c.equal("busy polling skips resizing", engine.poolSnapshot().slots, base.slots)
        }
        let queued = engine.pressureBoundary.request()
        let refused = engine.generate(promptIds: prompt, params: params)
        c.expect("queued request observes pending pressure before work", refused.ids.isEmpty && refused.stats.memoryPressureCancelled)
        c.expect("queued refusal reports a runtime error", refused.stats.runtimeError?.contains("memory pressure") == true && refused.stats.finishReason == "error")
        c.equal("queued refusal reads no experts", refused.stats.prefillRecords + refused.stats.decodeRecords, 0)
        c.equal("queued refusal takes no retained state", engine.prefixCache.heldTokens, 0)
        engine.visionAllowed = true
        do {
            _ = try engine.ensureVisionTower()
            c.expect("queued pressure refuses tower allocation", false)
        } catch {
            c.expect("queued pressure has an explicit image refusal", String(describing: error).contains("memory pressure"))
        }
        engine.visionAllowed = false
        c.expect("queued pressure never loads the tower", engine.visionTower == nil)
        engine.pressureBoundary.acknowledge(queued)

        for phase in ["scope", "prefill", "decode", "nonstream"] {
            engine.dropPrefixCache()
            let scoped = phase == "scope"
            engine.model.optimizations.layerExpertWorkspace = scoped
            engine.model.optimizations.boundedIndexer = scoped
            engine.model.optimizations.boundedPLE = scoped
            engine.model.optimizations.readScopeTokens = scoped ? 1024 : 0
            engine.model.optimizations.workspaceTokenTile = 512
            let input = phase == "prefill" || scoped ? Array(repeating: 907, count: 513) : prompt
            let requested = DispatchSemaphore(value: 0), finished = DispatchSemaphore(value: 0)
            var triggered = false, eventAcknowledged = false
            func trigger() {
                guard !triggered else { return }
                triggered = true
                DispatchQueue.global().async {
                    governor.pressureNow(.critical) { requested.signal() }
                    finished.signal()
                }
                eventAcknowledged = requested.wait(timeout: .now() + 5) == .success
                // The pressure handler is waiting for the generation lock
                // held by this callback. stop() must not form a lock cycle.
                governor.stop()
            }
            engine.generator.onPrefillProgress = { done, _, _ in
                if phase == "prefill", done >= 256 { trigger() }
            }
            var polls = 0
            let token: ((Int, String) -> Bool)? = phase == "nonstream" ? nil : { _, _ in
                if phase == "decode" { trigger() }
                return true
            }
            let result = engine.generate(promptIds: input, params: params, shouldContinue: {
                polls += 1
                if scoped && polls == 3 || phase == "nonstream" && polls == 2 { trigger() }
                return true
            }, onToken: token)
            engine.generator.onPrefillProgress = nil
            engine.model.optimizations.layerExpertWorkspace = false
            engine.model.optimizations.boundedIndexer = false
            engine.model.optimizations.boundedPLE = false
            engine.model.optimizations.readScopeTokens = 0
            let drained = !triggered || finished.wait(timeout: .now() + 10) == .success
            c.expect("\(phase): actual pressure event reaches busy engine", triggered && eventAcknowledged)
            c.expect("\(phase): governor finishes after safe cancellation", drained)
            guard drained else { throw ModelError("governor boundary did not drain") }
            c.expect("\(phase): cancellation is explicitly observed", result.stats.memoryPressureCancelled)
            c.expect("\(phase): pressure reports an explicit error", result.stats.runtimeError?.contains("memory pressure") == true && result.stats.finishReason == "error")
            c.expect("\(phase): boundary latency is finite and bounded", result.stats.memoryPressureBoundarySeconds.map { $0.isFinite && $0 >= 0 && $0 < 5 } ?? false)
            c.expect("\(phase): completion stops before the output allowance", result.ids.count < params.maxTokens)
            if scoped {
                c.equal("cancelled scope retains only its prior commit", result.stats.prefillTokens, 0)
                c.expect("scope cancellation emits no token", result.ids.isEmpty)
            } else if phase == "prefill" {
                c.equal("prefill stops at one complete chronological pass", result.stats.prefillTokens, 256)
                c.expect("prefill cancellation emits no token", result.ids.isEmpty)
            } else {
                c.expect("decode emits a coherent prefix before cancellation", !result.ids.isEmpty && Array(baseline.ids.prefix(result.ids.count)) == result.ids)
            }
            c.equal("\(phase): pressure cannot exceed the arena floor", engine.poolSnapshot().slots, Geometry.floorSlots)
            c.equal("\(phase): prefix ownership is released even when already at floor", engine.prefixCache.heldTokens, 0)
            c.expect("\(phase): acknowledged pressure cannot stop the next request", engine.pressureBoundary.snapshot() == nil)
            let unavailable = engine.generate(promptIds: prompt, params: params)
            c.expect("\(phase): infeasible context refuses new work until recovery",
                unavailable.ids.isEmpty && unavailable.stats.requestFailure?.code == .insufficientMemory)
            c.equal("\(phase): infeasible refusal reads no experts",
                unavailable.stats.prefillRecords + unavailable.stats.decodeRecords, 0)
            // The pressure ticket has drained, but the new plan must fit before
            // another request is admitted. Find a bounded recovery reading using
            // only the pure policy, never more than real reclaimable memory.
            guard let current = engine.currentPlan, let available = Planner.deviceAvailableGB() else {
                throw ModelError("governor recovery requires a real memory reading")
            }
            let recovery = stride(from: 0.0, through: min(10, available), by: 0.125).first { value in
                let inputs = GovernorPolicy.Inputs(currentSlots: engine.poolSnapshot().slots,
                    availableGB: value, ramGB: current.ramGB, workingSetGB: current.workingSetGB,
                    ramPercent: current.ramPercent, secondsSincePressure: 0,
                    mtpEnabled: current.mtpEnabled, visionEnabled: current.visionEnabled,
                    visionResidentReserved: current.visionResidentReserved,
                    maxContextTokens: current.maxContextTokens,
                    runtimeAllocationPolicy: current.runtimeAllocationPolicy,
                    contextQualification: current.contextQualification)
                return GovernorPolicy.desiredPlan(inputs) != nil && GovernorPolicy.decide(inputs) == .hold
            }
            guard let recovery else { throw ModelError("no bounded feasible governor recovery is available") }
            Planner.availabilityOverride = recovery
            governor.pollNow()
            c.equal("\(phase): recovery keeps the bounded arena", engine.poolSnapshot().slots, Geometry.floorSlots)
            c.expect("\(phase): feasible recovery clears the admission latch",
                engine.contextPolicyJSON["allocation_available"] as? Bool == true)
            let retry = engine.generate(promptIds: prompt, params: params)
            c.equal("\(phase): retry preserves the exact baseline IDs", retry.ids, baseline.ids)
            c.equal("\(phase): retry preserves exact text", retry.text, baseline.text)
            c.expect("\(phase): retry is not spuriously cancelled", !retry.stats.memoryPressureCancelled)
            Planner.availabilityOverride = 0
            c.measure("\(phase).pressure_to_boundary_seconds", result.stats.memoryPressureBoundarySeconds ?? -1)
        }
        return c.report()
    }
}
