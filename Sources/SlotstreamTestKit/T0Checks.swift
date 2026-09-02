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
            Check("runtime-check", tier: .t0) { try Diagnostics.runtime() },
            Check("governor-check", tier: .t0) { Diagnostics.governorPolicy() },
            Check("pull-check", tier: .t0) { try Diagnostics.pullIntegrity() },
            Check("machine-planning", tier: .t0) { try Diagnostics.machinePlanning() },
            // T1: touches MLX, so it needs the Metal library beside the runner.
            Check("sampler-behaviour", tier: .t1) { try Diagnostics.samplerBehaviour() },
        ]
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
            "the refusal says the ceiling is measured, not a memory limit",
            msg.contains("measured") && msg.contains("not a memory limit"), msg)
        c.expect(
            "the refusal names the tool that moves it",
            msg.contains("context-check"), msg)
        c.measure("max_tokens", Double(ContextPolicy.maxTokens))
        return c.report()
    }
}
