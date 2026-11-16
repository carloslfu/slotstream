import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// What the opt-in wired limit asks for. Pure arithmetic, no MLX.
    public static func wiredLimitPolicy() -> CheckReport {
        var c = CheckBuilder("wired-limit-policy")
        c.equal("wiring is off unless asked for", try? WiredLimit.requested([:]), false)
        c.equal("zero leaves buffers pageable", try? WiredLimit.requested([WiredLimit.variable: "0"]), false)
        c.equal("one asks for the limit", try? WiredLimit.requested([WiredLimit.variable: "1"]), true)
        for value in ["", "yes", "true", "2", " 1"] {
            c.expect("\"\(value)\" is refused, not read as off", (try? WiredLimit.requested([WiredLimit.variable: value])) == nil)
        }
        // Wiring is memory policy. It must not enter the settings that
        // identify a saved prefix, or turning it on would discard them.
        c.equal("the switch is not an inference option",
            try? InferenceOptimizations.resolving(environment: [WiredLimit.variable: "1"],
                defaults: InferenceOptimizations()), InferenceOptimizations())
        c.equal("the limit is the plan target when it is inside the working set",
            WiredLimit.bytes(targetGB: 10, workingSetGB: 40), 10_000_000_000)
        c.equal("a target above the working set is clamped to the working set",
            WiredLimit.bytes(targetGB: 27, workingSetGB: 22.5), 22_500_000_000)
        c.equal("a target equal to the working set is kept",
            WiredLimit.bytes(targetGB: 22.5, workingSetGB: 22.5), 22_500_000_000)
        c.equal("a plan without a total-process target wires nothing",
            WiredLimit.bytes(targetGB: nil, workingSetGB: 40), nil)
        c.equal("an unknown working set wires nothing", WiredLimit.bytes(targetGB: 10, workingSetGB: 0), nil)
        c.equal("a zero target wires nothing", WiredLimit.bytes(targetGB: 0, workingSetGB: 40), nil)
        c.equal("a negative target wires nothing", WiredLimit.bytes(targetGB: -1, workingSetGB: 40), nil)
        c.equal("a non-finite target wires nothing", WiredLimit.bytes(targetGB: .infinity, workingSetGB: 40), nil)
        c.equal("a non-finite working set wires nothing", WiredLimit.bytes(targetGB: 10, workingSetGB: .nan), nil)
        return c.report()
    }

    /// The process-wide limit itself: holders, the refusal MLX gives above the
    /// working set, and the restore. Limits here are a few megabytes, so the
    /// check wires almost nothing while it runs.
    public static func wiredLimitProcess() throws -> CheckReport {
        var c = CheckBuilder("wired-limit-process")
        guard let ceiling = GPU.maxRecommendedWorkingSetBytes() else {
            var refused = false
            do { _ = try WiredLimit.apply(bytes: 1 << 20) } catch is WiredLimit.Refused { refused = true }
            c.expect("without a Metal working set the limit is refused, not fatal", refused)
            return c.report()
        }
        var first: WiredLimit? = try WiredLimit.apply(bytes: 1 << 20)
        let baseline = first?.previousBytes ?? -1
        c.equal("the first holder gets the limit it asked for", first?.bytes, 1 << 20)
        var second: WiredLimit? = try WiredLimit.apply(bytes: 2 << 20)
        c.equal("a second holder replaces the first holder's limit", second?.previousBytes, 1 << 20)
        try second?.update(bytes: 3 << 20)
        c.equal("a holder can move its limit", second?.bytes, 3 << 20)

        // MLX refuses a limit above the working set. An unhandled MLX error
        // ends the process, so the refusal has to arrive as a Swift error.
        if ceiling < Int.max {
            var refused = false
            do { try WiredLimit.set(ceiling + 1) } catch is WiredLimit.Refused { refused = true }
            c.expect("a limit above the working set is refused without ending the process", refused)
            c.equal("a refused limit changes nothing", try WiredLimit.set(3 << 20), 3 << 20)
        }
        var clamped: WiredLimit? = try WiredLimit.apply(bytes: Int.max)
        c.equal("a request above the working set is clamped to it", clamped?.bytes, ceiling)
        try clamped?.update(bytes: 3 << 20)
        clamped = nil

        // The limit that was in force before the first holder comes back only
        // when the last holder goes away.
        second = nil
        c.equal("an earlier holder keeps the limit in force", try WiredLimit.set(3 << 20), 3 << 20)
        first = nil
        let probe = try WiredLimit.apply(bytes: 1 << 20)
        c.equal("the last holder restores the limit that was in force before", probe.previousBytes, baseline)
        return c.report()
    }
}
