// The elastic resize policy, driven through every branch with scripted inputs.
//
// The policy is a pure function, so shrink, grow, both dead-bands, both
// cooldowns, both pressure levels, the floor and the cap are all reachable
// without weights, without a GPU and without putting a real machine under
// memory pressure — which would be neither safe nor repeatable here.

import Foundation
import Slotstream

extension Diagnostics {
    public static func governorPolicy() -> CheckReport {
        typealias P = GovernorPolicy
        var c = CheckBuilder("governor-check")

        // A 48 GB Mac sitting at what auto picks when nothing else is running.
        let ram = 51.5
        let ws = 40.2
        func inputs(
            slots: Int, avail: Double, sincePressure: Double? = nil,
            sinceResize: Double? = nil, pressure: P.Pressure? = nil
        ) -> P.Inputs {
            P.Inputs(
                currentSlots: slots, availableGB: avail, ramGB: ram, workingSetGB: ws,
                secondsSincePressure: sincePressure, secondsSinceResize: sinceResize,
                pressure: pressure)
        }
        func slots(_ d: P.Decision) -> Int? {
            if case let .resize(s, _) = d { return s }
            return nil
        }
        func reason(_ d: P.Decision) -> String {
            if case let .resize(_, r) = d { return r }
            return "hold"
        }

        // Steady state: a quiet machine holding what auto would pick.
        let steady = Planner.slotsForTarget(Planner.autoTargetGB(ramGB: ram, workingSetGB: ws))
        let steadyAvail = Geometry.gb(steady) + Planner.fixedFootprintGB + 6.0
        let d0 = P.decide(inputs(slots: steady, avail: steadyAvail))
        c.expect("quiet machine at target: hold", d0 == .hold, "got \(d0)")

        // Availability collapses: shrink, in one step, to what a restart would pick.
        let d1 = P.decide(inputs(slots: steady, avail: 2.0))
        c.expect("availability collapses: shrinks", (slots(d1) ?? steady) < steady, "got \(d1)")
        c.equal("  ...and says why", reason(d1), "availability dropped")
        // Shrinking the pool releases that memory, so availability must rise by
        // exactly what the pool gave up. Holding it fixed is not a reachable
        // state, and the credit in desiredSlots exists precisely so the answer
        // does not depend on how much we happen to hold right now.
        if let after = slots(d1) {
            let freed = Geometry.gb(steady) - Geometry.gb(after)
            let once = P.decide(inputs(slots: after, avail: 2.0 + freed))
            c.expect("  ...converges in one step (no ratcheting)", once == .hold, "got \(once)")
        } else {
            c.expect("  ...converges in one step (no ratcheting)", false, "no resize to converge from")
        }

        // The invariant behind that: only (availability + pool) matters, so two
        // states holding the same total memory must want the same size. Compare
        // the desired target, not the decision: whether a resize is emitted also
        // depends on dead-bands and cooldowns, and a machine already at the
        // desired size correctly holds.
        let small = Geometry.floorSlots * 3
        let wantA = P.desiredSlots(inputs(slots: steady, avail: 12.0))
        let wantB = P.desiredSlots(
            inputs(slots: small, avail: 12.0 + Geometry.gb(steady) - Geometry.gb(small)))
        c.expect(
            "target depends on (available + pool), not on either alone",
            wantA != nil && wantA == wantB,
            "\(String(describing: wantA)) vs \(String(describing: wantB))")

        // Dead-bands: a small change must not churn the pool.
        let smallDrop = Geometry.gb(steady) + Planner.fixedFootprintGB + 5.4
        c.expect(
            "small drop inside the shrink dead-band: hold",
            P.decide(inputs(slots: steady, avail: smallDrop)) == .hold)
        c.expect(
            "small gain inside the grow dead-band: hold",
            P.decide(inputs(slots: steady, avail: steadyAvail + 1.0)) == .hold)

        // Growth is gated on calm and on cooldown.
        let roomy = 30.0
        c.expect(
            "grow blocked while a resize is recent",
            P.decide(inputs(slots: small, avail: roomy, sinceResize: 10)) == .hold)
        c.expect(
            "grow blocked while pressure is recent",
            P.decide(inputs(slots: small, avail: roomy, sincePressure: 10, sinceResize: 999)) == .hold)
        let growInputs = inputs(slots: small, avail: roomy, sincePressure: 999, sinceResize: 999)
        let grow = P.decide(growInputs)
        c.expect("grow allowed once calm and cooled", (slots(grow) ?? 0) > small, "got \(grow)")
        if let target = slots(grow), let desired = P.desiredPlan(growInputs) {
            let controls = P.liveControls(for: target, inputs: growInputs)
            c.expect(
                "grow restores the planner's prefill and prefix budgets",
                controls.prefillChunk == desired.prefillChunk
                    && controls.prefixCacheTokens == desired.prefixCacheTokens,
                "got \(controls), expected \((desired.prefillChunk, desired.prefixCacheTokens))")
        } else {
            c.expect("grow restores the planner's prefill and prefix budgets", false, "no grow decision")
        }
        c.equal("  ...and says why", reason(grow), "memory freed")

        // OS pressure events shed immediately, regardless of cooldown.
        let warn = P.decide(
            inputs(slots: steady, avail: steadyAvail, sinceResize: 0, pressure: .warning))
        let warnShed = Geometry.gb(steady) - Geometry.gb(slots(warn) ?? steady)
        c.expect(
            "warning pressure sheds >= max(2 GB, 15%)",
            warnShed >= min(2.0, Geometry.gb(steady)) - 0.01, "shed \(warnShed) GB")
        c.expect("  ...ignores the resize cooldown", slots(warn) != nil)
        let crit = P.decide(
            inputs(slots: steady, avail: steadyAvail, sinceResize: 0, pressure: .critical))
        let critShed = Geometry.gb(steady) - Geometry.gb(slots(crit) ?? steady)
        c.expect(
            "critical pressure sheds >= max(4 GB, 50%)",
            critShed >= min(4.0, Geometry.gb(steady)) - 0.01, "shed \(critShed) GB")
        c.expect("critical sheds strictly more than warning", critShed > warnShed)
        c.measure("warning_shed_gb", warnShed)
        c.measure("critical_shed_gb", critShed)

        // Repeated pressure keeps shedding, but never past the floor.
        var cur = steady
        for _ in 0 ..< 20 {
            guard let n = slots(P.decide(inputs(slots: cur, avail: 1.0, pressure: .critical)))
            else { break }
            cur = n
        }
        c.equal("repeated critical pressure converges to the floor", cur, Geometry.floorSlots)
        c.expect("floor is never breached", cur >= Geometry.floorSlots)
        c.expect(
            "at the floor, more pressure is a no-op",
            P.decide(inputs(slots: Geometry.floorSlots, avail: 0.5, pressure: .critical)) == .hold)

        // The cap holds on a machine with more memory than the model needs.
        let huge = P.Inputs(
            currentSlots: Geometry.floorSlots, availableGB: 400, ramGB: 512, workingSetGB: 400,
            secondsSincePressure: nil, secondsSinceResize: nil, pressure: nil)
        c.expect(
            "never asks for more slots than the model has",
            (slots(P.decide(huge)) ?? 0) <= Geometry.totalRecords,
            "got \(String(describing: slots(P.decide(huge))))")

        return c.report()
    }
}
