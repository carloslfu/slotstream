// T0: pure Swift. No MLX, no GPU, no files, no weights. Everything here runs
// on any Mac in milliseconds, which is what makes it a gate on every push.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static var t0Checks: [Check] {
        [
            Check("prefill-schedule", tier: .t0) { Diagnostics.prefillSchedule() },
            Check("context-policy", tier: .t0) { contextPolicy() },
            Check("automatic-context-window", tier: .t0) { try automaticContextWindow() },
            Check("memory-budget-context", tier: .t0) { try memoryBudgetContext() },
            Check("configurable-context", tier: .t0) { try Diagnostics.configurableContext() },
            Check("exact-read", tier: .t0) { Diagnostics.optimizationExactRead() },
            Check("packed-layout", tier: .t0) { try Diagnostics.optimizationPackedLayout() },
            Check("ngram-prefetch-ticket", tier: .t0) { try Diagnostics.optimizationNgramPrefetchTicket() },
            Check("cache-bookkeeping", tier: .t0) { Diagnostics.optimizationCacheBookkeeping() },
            Check("adaptive-speculation-policy", tier: .t0) { Diagnostics.optimizationAdaptivePolicy() },
            Check("runtime-allocation-budget", tier: .t0) { try Diagnostics.optimizationRuntimeBudget() },
            Check("layer-local-victim", tier: .t0) { Diagnostics.optimizationLayerLocalVictim() },
            Check("pressure-boundary", tier: .t0) { Diagnostics.optimizationPressureBoundary() },
            Check("runtime-check", tier: .t0) { try Diagnostics.runtime() },
            Check("prefix-client-capacity", tier: .t0) { try Diagnostics.optimizationPrefixCapacity() },
            Check("persistent-prefix-policy", tier: .t0) { Diagnostics.persistentPrefixPolicy() },
            Check("persistent-prefix-clear", tier: .t0) { try persistentPrefixClear() },
            Check("persistent-conversation-ids", tier: .t0) { try Diagnostics.persistentConversationIDs() },
            Check("governor-check", tier: .t0) { Diagnostics.governorPolicy() },
            Check("pull-check", tier: .t0) { try Diagnostics.pullIntegrity() },
            Check("machine-planning", tier: .t0) { try Diagnostics.machinePlanning() },
            Check("http-framing", tier: .t0) { Diagnostics.httpFraming() },
            Check("http-routing", tier: .t0) { Diagnostics.httpRouting() },
            Check("bounded-output", tier: .t0) { try Diagnostics.optimizationOutput() },
            Check("expert-lookahead-lane-budget", tier: .t0) { try Diagnostics.expertLookaheadLaneBudget() },
            Check("expert-lookahead-tickets", tier: .t0) { try Diagnostics.expertLookaheadTickets() },
            Check("expert-lookahead-scheduler", tier: .t0) { try Diagnostics.expertLookaheadScheduler() },
            Check("expert-lookahead-forecast-merge", tier: .t0) { try Diagnostics.expertLookaheadForecastMerge() },
            Check("expert-lookahead-forecast-tap", tier: .t0) { try Diagnostics.expertLookaheadForecastTap() },
            Check("decode-lookahead-defaults", tier: .t0) { try Diagnostics.decodeLookaheadDefaults() },
            Check("gpu-keepalive-policy", tier: .t0) { try Diagnostics.gpuKeepAlivePolicy() },
            Check("vision-check", tier: .t0) { Diagnostics.vision() },
            Check("prefill-read-policy", tier: .t0) { Diagnostics.fusedWorkspaceReservation() },
            // T1: touches MLX, so it needs the Metal library beside the runner.
            Check("fused-prefill-attention", tier: .t1) { Diagnostics.fusedPrefillAttention() },
            Check("sampler-behaviour", tier: .t1) { try Diagnostics.samplerBehaviour() },
            Check("expert-lookahead-adoption", tier: .t1) { try Diagnostics.expertLookaheadAdoption() },
            Check("expert-lookahead-routing-readback", tier: .t1) { try Diagnostics.expertLookaheadRoutingReadback() },
            Check("compact-indexer", tier: .t1) { Diagnostics.optimizationCompactIndexer() },
            Check("persistent-prefix-round-trip", tier: .t1) { try Diagnostics.persistentPrefixRoundTrip() },
            Check("aligned-prefix-resume", tier: .t0) { try Diagnostics.alignedPrefixResume() },
            Check("slot-slices", tier: .t1) { Diagnostics.optimizationSlotSlices() },
            Check("slot-words", tier: .t1) { Diagnostics.optimizationSlotSlices(wordWrites: true) },
            Check("vision-splice", tier: .t1) { Diagnostics.visionSplice() },
            Check("vision-attention", tier: .t1) { Diagnostics.optimizationVisionAttention() },
            Check("router-selection", tier: .t1) { Diagnostics.optimizationRouterSelection() },
            Check("compiled-norm", tier: .t1) { try Diagnostics.optimizationCompiledNorm() },
            Check("router-projection", tier: .t1) { Diagnostics.optimizationRouterProjection() },
            Check("verify-pass-rows", tier: .t1) { Diagnostics.verifyPassRows() },
            Check("block-selection", tier: .t1) { Diagnostics.optimizationBlockSelection() },
            Check("indexer-visibility", tier: .t1) { Diagnostics.optimizationIndexerVisibility() },
            Check("gpu-keepalive-runs", tier: .t1) { Diagnostics.gpuKeepAliveRuns() },
        ] + toolCallChecks + gatewayChecks + openAIChecks + responsesChecks + anthropicChecks + launchChecks + weightStoreChecks
    }

    static func memoryBudgetContext() throws -> CheckReport {
        var c = CheckBuilder("memory-budget-context")
        // Both the decimal tier used by doctor and a physical 64 GiB device.
        for ram in [64.0, 64 * pow(1024, 3) / 1e9] {
            let device = Machine(ramGB: ram, workingSetGB: ram * 0.75, availableGB: ram, isSimulated: true)
            for mtp in [Planner.MTPMode.off, .on, .auto] {
                let request = PlanRequest(memoryGB: 48, mtp: mtp)
                let baseline = try Planner.resolveContextWindow(.tokens(32_768), request: request,
                    on: device, mtpAvailable: true).plan
                let resolved = try Planner.resolveContextWindow(.automatic, request: request,
                    on: device, mtpAvailable: true)
                let label = "\(ram)/\(mtp.rawValue)"
                c.expect("\(label) preserves the larger expert cache", resolved.plan.slots == baseline.slots
                    && resolved.plan.maxContextTokens == 32_768 && resolved.plan.targetGB == 48)
                c.expect("\(label) budget still covers the whole plan",
                    resolved.plan.expectedPeakGB + Planner.planningMarginGB <= 48)
                c.expect("\(label) reports budget semantics",
                    resolved.plan.banner().contains("not a RAM usage goal")
                        && resolved.plan.banner().contains("Short requests can use less"))
                let json = resolved.plan.json()
                c.expect("\(label) machine-readable breakdown reconciles",
                    json["non_cache_allowance_bytes"] as? Int == resolved.plan.memoryLedger.expectedPeakBytes
                        - resolved.plan.memoryLedger.poolBytes)
                guard let automatic = resolved.automatic else { throw ModelError("missing automatic context report") }
                c.expect("\(label) unknown tradeoffs do not masquerade as zero cost",
                    automatic.candidates.dropFirst().allSatisfy {
                        !$0.accepted && $0.relativeRequestCost == nil && $0.reason.contains("unmeasured")
                    } && automatic.report(served: resolved.plan.maxContextTokens).contains("unmeasured cost"))
                for window in [65_536, 131_072, 262_144] {
                    let manual = try Planner.resolveContextWindow(.tokens(window), request: request,
                        on: device, mtpAvailable: true)
                    c.expect("\(label) explicit \(window) remains available",
                        manual.plan.maxContextTokens == window && manual.automatic == nil
                            && manual.plan.expectedPeakGB + Planner.planningMarginGB <= 48)
                }
            }
        }
        // Exercise tier and busy-start decisions across the supported range.
        for ram in [16.0, 24, 32, 36, 48, 64, 96, 128] {
            for available in [ram, ram * 0.8, ram * 0.6] {
                let device = Machine(ramGB: ram, workingSetGB: ram * 0.75, availableGB: available, isSimulated: true)
                let request = PlanRequest()
                guard let baseline = try? Planner.resolveContextWindow(.tokens(32_768), request: request,
                    on: device, mtpAvailable: true).plan else { continue }
                let resolved = try Planner.resolveContextWindow(.automatic, request: request,
                    on: device, mtpAvailable: true)
                c.expect("\(ram)/\(available) live selection obeys the same tradeoff rule",
                    Planner.automaticWindowRefusal(resolved.plan, from: baseline) == nil)
                if baseline.expertsPerLayerCached > Planner.decodePlateauPerLayer {
                    c.expect("\(ram)/\(available) preserves unmeasured cache capacity", resolved.plan.slots >= baseline.slots)
                }
            }
        }
        let roomy = Machine(ramGB: 128, workingSetGB: 96, availableGB: 128, isSimulated: true)
        for target in [8.1, 9, 10, 12, 48, 90] {
            for mtp in [Planner.MTPMode.off, .on] {
                guard let plan = try? Planner.resolveContextWindow(.tokens(32_768),
                    request: PlanRequest(memoryGB: target, mtp: mtp), on: roomy, mtpAvailable: true).plan else { continue }
                let headroom = plan.plannedHeadroomGB ?? -1
                c.expect("\(target)/\(mtp.rawValue) displayed budget reconciles, including the cache floor",
                    headroom >= 0 && abs(plan.expectedPeakGB + headroom - target) < 1e-9
                        && plan.banner().contains(String(format: "%.1f GB budget headroom", headroom)))
            }
        }
        let raw = try Planner.resolveContextWindow(.tokens(32_768), request: PlanRequest(poolGB: 4), on: roomy).plan
        c.expect("a raw pool size does not invent a total budget", raw.plannedHeadroomGB == nil
            && raw.json()["planned_headroom_gb"] == nil && !raw.banner().contains("budget headroom"))
        return c.report()
    }

    /// The automatic context window on simulated Macs: each tier's choice, the
    /// startup step-down on a busy machine, fixed caches, explicit windows and
    /// the retention fallback. Planning only; nothing reads this Mac's memory.
    static func automaticContextWindow() throws -> CheckReport {
        var c = CheckBuilder("automatic-context-window")
        let tiers: [(Double, Int)] = [(16, 32_768), (24, 32_768), (32, 32_768), (36, 65_536),
                                      (48, 32_768), (64, 131_072), (96, 262_144), (128, 262_144)]
        for (ram, window) in tiers {
            let gb = Int(ram)
            let device = Machine(ramGB: ram, workingSetGB: ram * 0.75, availableGB: ram, isSimulated: true)
            let choice = Planner.automaticContextWindow(PlanRequest(), on: device, mtpAvailable: true, visionAvailable: true)
            c.expect("\(gb) GB picks \(window) tokens", choice.window == window, "picked \(choice.window)")
            c.expect("\(gb) GB evaluates every candidate", choice.candidates.map(\.window) == ContextPolicy.automaticWindows)
            c.expect("\(gb) GB names why each declined window was declined",
                choice.candidates.allSatisfy { $0.accepted || !$0.reason.isEmpty })
            let resolved = try Planner.resolveContextWindow(.automatic, request: PlanRequest(), on: device,
                mtpAvailable: true, visionAvailable: true)
            c.expect("\(gb) GB serves its automatic window on a quiet machine", resolved.plan.maxContextTokens == window,
                "served \(resolved.plan.maxContextTokens)")
            if let base = choice.candidates.first?.plan {
                let seconds = Planner.estimatedRequestSeconds(base)
                c.expect("\(gb) GB prices the representative request", seconds.isFinite && seconds > 0)
                if window > ContextPolicy.defaultTokens {
                    c.expect("\(gb) GB retains one complete conversation", resolved.plan.prefixCacheTokens >= window)
                    c.expect("\(gb) GB keeps speculative decoding as the default plan has it",
                        resolved.plan.mtpEnabled == base.mtpEnabled && resolved.plan.decodeLookahead == base.decodeLookahead)
                }
            }
            let report = choice.report(served: window)
            c.expect("\(gb) GB report marks the automatic window",
                report.contains("context window: automatic, \(window) tokens") && report.contains("<- auto"), report)
            c.expect("\(gb) GB startup line names the window and the ceiling",
                choice.announcement(served: window).contains("\(window) tokens")
                    && choice.announcement(served: window).contains("\(ContextPolicy.maxTokens)"))
            let json = choice.json
            c.expect("\(gb) GB JSON carries the window and every candidate",
                (json["window"] as? Int) == window
                    && (json["candidates"] as? [[String: Any]])?.count == ContextPolicy.automaticWindows.count)
            c.measure("window_at_\(gb)_gb", Double(choice.window))
        }
        // The estimate holds speculative decoding fixed, so a larger window
        // that would move the head's experts from resident to streamed is
        // declined; asked for explicitly, that window keeps the head.
        let mac32 = Machine(ramGB: 32, workingSetGB: 24, availableGB: 32, isSimulated: true)
        let choice32 = Planner.automaticContextWindow(PlanRequest(), on: mac32, mtpAvailable: true, visionAvailable: true)
        let declined32 = choice32.candidates.first { $0.window == 65_536 }
        c.expect("32 GB declines 65,536 because the head's experts would stream",
            declined32?.accepted == false && declined32?.reason.contains("streams the draft head's experts") == true,
            declined32?.reason ?? "no candidate")
        let explicit32 = try Planner.resolveContextWindow(.tokens(65_536), request: PlanRequest(), on: mac32,
            mtpAvailable: true, visionAvailable: true)
        c.expect("an explicit 65,536 on 32 GB keeps the head by streaming its experts",
            explicit32.plan.mtpEnabled && explicit32.plan.mtpStreamedExperts && explicit32.plan.decodeLookahead)
        let big = Machine(ramGB: 128, workingSetGB: 96, availableGB: 128, isSimulated: true)
        c.expect("a fixed cache size keeps the default window",
            Planner.automaticContextWindow(PlanRequest(expertsPerLayer: 120), on: big, mtpAvailable: true).window
                == ContextPolicy.defaultTokens)
        let fixedTarget = Planner.automaticContextWindow(PlanRequest(memoryGB: 20),
            on: Machine(ramGB: 51.5, workingSetGB: 40.2, availableGB: 51.5, isSimulated: true), mtpAvailable: true)
        c.expect("a fixed memory target prices every candidate inside it",
            fixedTarget.candidates.compactMap(\.plan).allSatisfy { $0.targetGB == 20 })
        let explicit = try Planner.resolveContextWindow(.tokens(65_536), request: PlanRequest(), on: big, mtpAvailable: true)
        c.expect("an explicit window is planned as given", explicit.plan.maxContextTokens == 65_536 && explicit.automatic == nil)
        let busy = try Planner.resolveContextWindow(.automatic, request: PlanRequest(),
            on: Machine(ramGB: 128, workingSetGB: 96, availableGB: 40, isSimulated: true), mtpAvailable: true)
        c.expect("a busy machine lowers the automatic window and says so",
            busy.plan.maxContextTokens < 262_144 && busy.plan.notes.contains { $0.contains("lowered from 262144") },
            "\(busy.plan.maxContextTokens): \(busy.plan.notes)")
        c.expect("a busy machine keeps speculative decoding", busy.plan.mtpEnabled)
        if let automatic = busy.automatic {
            c.expect("the doctor report says the window was lowered",
                automatic.report(served: busy.plan.maxContextTokens).contains("lowered to \(busy.plan.maxContextTokens) tokens right now"))
        } else {
            c.expect("a busy automatic start reports its automatic choice", false)
        }
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil, ramGB: 17.2, workingSetGB: 11.8,
            availableGB: 12.5, maxContextTokens: 65_536, simulated: true)
        c.expect("an explicit window too large to retain keeps the budget share with a note",
            small.prefixCacheTokens < 65_536 && small.notes.contains { $0.contains("does not fit retained") }, "\(small.notes)")
        let legacy = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil, ramGB: 51.5, workingSetGB: 40.2,
            availableGB: 44, maxContextTokens: 32_768, simulated: true)
        let share = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil, ramGB: 51.5, workingSetGB: 40.2,
            availableGB: 44, maxContextTokens: 32_768, simulated: true, qualification: false, retention: .budgetShare)
        c.expect("the default window is unchanged by retention policy",
            legacy.slots == share.slots && legacy.prefixCacheTokens == share.prefixCacheTokens && legacy.targetGB == share.targetGB)
        return c.report()
    }

    /// `--max-context` validation: the bounds, and that the message explains
    /// the ceiling for what it is rather than telling people to raise a flag
    /// that cannot go past it.
    static func contextPolicy() -> CheckReport {
        var c = CheckBuilder("context-policy")
        c.expect("1 is accepted", ContextPolicy.validationError(1) == nil)
        c.expect(
            "the ceiling is accepted",
            ContextPolicy.validationError(ContextPolicy.maxTokens) == nil)
        c.expect("0 is refused", ContextPolicy.validationError(0) != nil)
        c.expect("-1 is refused", ContextPolicy.validationError(-1) != nil)
        c.expect(
            "one past the ceiling is refused",
            ContextPolicy.validationError(ContextPolicy.maxTokens + 1) != nil)

        let msg = ContextPolicy.validationError(ContextPolicy.maxTokens + 1) ?? ""
        c.expect(
            "the refusal names the ceiling",
            msg.contains("\(ContextPolicy.maxTokens)"), msg)
        c.expect(
            "the refusal names the model limit and the automatic choice",
            msg.contains("pinned model") && msg.contains("pass auto"), msg)
        c.expect(
            "the refusal does not promise capacity or quality",
            msg.contains("memory fit or answer quality"), msg)
        c.measure("max_tokens", Double(ContextPolicy.maxTokens))
        return c.report()
    }
}
