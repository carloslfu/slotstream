import Foundation
import Slotstream

extension Diagnostics {
    public static func modelPackPlanning() throws -> CheckReport {
        var c = CheckBuilder("model-pack-planning")
        let pack = ModelPackRegistry.baseline
        let request = PlanRequest(mtp: .auto, vision: .off, maxContextTokens: 32768)
        func bytes(_ plan: MemoryPlan) throws -> Data {
            try JSONSerialization.data(withJSONObject: plan.json(), options: [.sortedKeys])
        }
        for ram in [16.0, 24, 32, 48, 64, 96] {
            let quiet = Machine.simulated(ramGB: ram, availableGB: ram)
            let busy = Machine.simulated(ramGB: ram, availableGB: 1)
            let range = try pack.memoryRange(for: request, on: quiet)
            c.equal("hardware range does not follow live pressure/\(ram)", range,
                try pack.memoryRange(for: request, on: busy))
            c.expect("range uses stable hardware bounds/\(ram)",
                range.minimumBytes <= range.hardwareMaximumBytes && range.incrementBytes == 500_000_000 &&
                range.maximumGB <= Planner.maximumMemoryLimitGB(ramGB: ram, workingSetGB: ram * 0.75))
            for bound in [range.minimumBytes, range.hardwareMaximumBytes] {
                let budget = Double(bound) / 1e9
                let proposal = PlanRequest(memoryLimitGB: budget, mtp: .auto, vision: .off, maxContextTokens: 32768)
                let plan = try pack.plan(proposal, on: quiet)
                try Planner.validateMemoryBudget(plan, availableGB: quiet.availableGB)
                c.expect("range endpoint prices its entire allocation/\(ram)/\(bound)",
                    plan.simulated && Int64(plan.memoryLedger.expectedPeakBytes) <= bound)
                c.equal("registered original planning preserves the public planner/\(ram)/\(bound)",
                    try bytes(plan), try bytes(Planner.plan(proposal, on: quiet)))
            }
            // Include optional-component and pass-size transitions inside the
            // displayed range, not just its endpoints. These are planner-only
            // fixtures; they do not simulate another Mac's actual speed.
            for bound in stride(from: range.minimumBytes, through: range.hardwareMaximumBytes, by: range.incrementBytes) {
                for draftPresent in [false, true] {
                    let plan = try pack.plan(PlanRequest(memoryLimitGB: Double(bound) / 1e9,
                        mtp: .auto, vision: .off, maxContextTokens: 32768), on: quiet, mtpAvailable: draftPresent)
                    try Planner.validateMemoryBudget(plan, availableGB: quiet.availableGB)
                    c.expect("interior control value keeps full context and safe optional transitions",
                        plan.maxContextTokens == 32768 && Int64(plan.memoryLedger.expectedPeakBytes) <= bound)
                }
            }
            let before = Double(range.minimumBytes - range.incrementBytes) / 1e9
            do {
                let plan = try pack.plan(PlanRequest(memoryLimitGB: before, mtp: .auto, vision: .off,
                    maxContextTokens: 32768), on: quiet)
                try Planner.validateMemoryBudget(plan, availableGB: quiet.availableGB)
                c.expect("preceding control step is not an admitted minimum/\(ram)",
                    Int64(plan.memoryLedger.expectedPeakBytes) > range.minimumBytes - range.incrementBytes)
            } catch { c.expect("preceding control step is not an admitted minimum/\(ram)", true) }
            do {
                let plan = try pack.plan(PlanRequest(memoryLimitGB: range.minimumGB, mtp: .auto,
                    vision: .off, maxContextTokens: 32768), on: busy)
                try Planner.validateMemoryBudget(plan, availableGB: busy.availableGB)
                c.expect("a displayed range cannot bypass actual headroom/\(ram)", false)
            } catch { c.expect("a displayed range cannot bypass actual headroom/\(ram)", true) }
        }
        let roomy = Machine.simulated(ramGB: 64, availableGB: 60)
        let base = try pack.memoryRange(for: .init(mtp: .off, vision: .off, maxContextTokens: 8192), on: roomy)
        let long = try pack.memoryRange(for: .init(mtp: .off, vision: .off, maxContextTokens: 131072), on: roomy)
        let draft = try pack.memoryRange(for: .init(mtp: .on, vision: .off, maxContextTokens: 8192), on: roomy, mtpAvailable: true)
        let vision = try pack.memoryRange(for: .init(mtp: .off, vision: .on, maxContextTokens: 8192), on: roomy, visionAvailable: true)
        c.expect("long context pays for its retained state before raising the floor", long.minimumBytes > base.minimumBytes)
        c.expect("required draft pays for its own weights before raising the floor", draft.minimumBytes > base.minimumBytes)
        c.expect("required images price tower residency before raising the floor", vision.minimumBytes > base.minimumBytes)
        for proposed in [PlanRequest(mtp: .on, vision: .off), PlanRequest(mtp: .off, vision: .on),
                         PlanRequest(maxContextTokens: 0), PlanRequest(memoryGB: 10), PlanRequest(memoryLimitGB: 10),
                         PlanRequest(expertsPerLayer: 20), PlanRequest(poolGB: 3), PlanRequest(maxRAMPercent: 50)] {
            do { _ = try pack.memoryRange(for: proposed, on: roomy); c.expect("range cannot ignore required components or conflicting knobs", false) }
            catch { c.expect("range cannot ignore required components or conflicting knobs", true) }
        }
        for increment: Int64 in [0, -1, 1, 333_333_333, 1_000_000_001, Int64.max] {
            do { _ = try pack.memoryRange(for: request, on: roomy, incrementBytes: increment); c.expect("invalid display increment is refused", false) }
            catch { c.expect("invalid display increment is refused", true) }
        }
        for machine in [Machine.simulated(ramGB: 8), .simulated(ramGB: .nan), .simulated(ramGB: .infinity),
                        .simulated(ramGB: 48, workingSetGB: 49), .simulated(ramGB: 48, workingSetGB: 1)] {
            do { _ = try pack.memoryRange(for: request, on: machine); c.expect("invalid or insufficient hardware cannot publish a range", false) }
            catch { c.expect("invalid or insufficient hardware cannot publish a range", true) }
        }
        let fine = try pack.memoryRange(for: request, on: roomy, incrementBytes: 100_000_000)
        let standard = try pack.memoryRange(for: request, on: roomy)
        c.expect("coarser accessible display cannot lower the admitted minimum", standard.minimumBytes >= fine.minimumBytes)
        c.expect("coarser display never exceeds the hardware maximum", standard.hardwareMaximumBytes <= fine.hardwareMaximumBytes)
        return c.report()
    }
}
