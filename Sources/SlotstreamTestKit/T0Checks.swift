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
            Check("vision-check", tier: .t0) { Diagnostics.vision() },
            // T1: touches MLX, so it needs the Metal library beside the runner.
            Check("sampler-behaviour", tier: .t1) { try Diagnostics.samplerBehaviour() },
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
            "the refusal distinguishes model configuration from implementation qualification",
            msg.contains("model limit") && msg.contains("implementation limit"), msg)
        c.expect(
            "the refusal does not promise capacity or quality",
            msg.contains("memory fit or answer quality"), msg)
        c.measure("max_tokens", Double(ContextPolicy.maxTokens))
        return c.report()
    }
}
