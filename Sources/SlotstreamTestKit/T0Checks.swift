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
            Check("decode-lookahead-defaults", tier: .t0) { try Diagnostics.decodeLookaheadDefaults() },
            Check("vision-check", tier: .t0) { Diagnostics.vision() },
            // T1: touches MLX, so it needs the Metal library beside the runner.
            Check("sampler-behaviour", tier: .t1) { try Diagnostics.samplerBehaviour() },
            Check("expert-lookahead-adoption", tier: .t1) { try Diagnostics.expertLookaheadAdoption() },
            Check("expert-lookahead-routing-readback", tier: .t1) { try Diagnostics.expertLookaheadRoutingReadback() },
            Check("compact-indexer", tier: .t1) { Diagnostics.optimizationCompactIndexer() },
            Check("slot-slices", tier: .t1) { Diagnostics.optimizationSlotSlices() },
            Check("slot-words", tier: .t1) { Diagnostics.optimizationSlotSlices(wordWrites: true) },
            Check("vision-splice", tier: .t1) { Diagnostics.visionSplice() },
            Check("vision-attention", tier: .t1) { Diagnostics.optimizationVisionAttention() },
            Check("router-selection", tier: .t1) { Diagnostics.optimizationRouterSelection() },
            Check("compiled-norm", tier: .t1) { try Diagnostics.optimizationCompiledNorm() },
            Check("router-projection", tier: .t1) { Diagnostics.optimizationRouterProjection() },
            Check("block-selection", tier: .t1) { Diagnostics.optimizationBlockSelection() },
            Check("indexer-visibility", tier: .t1) { Diagnostics.optimizationIndexerVisibility() },
        ] + toolCallChecks + gatewayChecks + openAIChecks
    }

    /// The automatic context window on simulated Macs: each tier's choice, the
    /// startup step-down on a busy machine, fixed caches, explicit windows and
    /// the retention fallback. Planning only; nothing reads this Mac's memory.
    static func automaticContextWindow() throws -> CheckReport {
        var c = CheckBuilder("automatic-context-window")
        let tiers: [(Double, Int)] = [(16, 32_768), (24, 32_768), (32, 32_768), (36, 65_536),
                                      (48, 65_536), (64, 131_072), (96, 262_144), (128, 262_144)]
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
