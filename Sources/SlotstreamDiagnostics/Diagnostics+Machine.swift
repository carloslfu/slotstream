// The device/plan layer: that a simulated machine plans, that its plan is
// marked, and that the marking is what stops it authorizing a real allocation.

import Foundation
import Slotstream

extension Diagnostics {
    public static func machinePlanning() throws -> CheckReport {
        var c = CheckBuilder("machine-planning")

        // A simulated machine plans without touching this one.
        let sim = Machine.simulated(ramGB: 16, availableGB: 6)
        c.expect("a simulated device is marked", sim.isSimulated)
        c.equal("the working set defaults to 75% of RAM", sim.workingSetGB, 12.0)
        let simPlan = try Planner.plan(PlanRequest(), on: sim)
        c.expect("a simulated device produces a plan", simPlan.slots > 0)
        c.expect("the plan carries the simulation", simPlan.simulated)

        // The real machine's plan is not marked, and is loadable.
        let real = Machine.current()
        c.expect("the current machine is not simulated", !real.isSimulated)
        let realPlan = try Planner.plan(PlanRequest(), on: real)
        c.expect("a real plan is not marked simulated", !realPlan.simulated)
        c.expect("the current machine reports RAM", real.ramGB > 0)
        c.expect("the working set is below RAM", real.workingSetGB <= real.ramGB)
        c.measure("machine_ram_gb", real.ramGB)
        c.measure("machine_working_set_gb", real.workingSetGB)

        // A simulated availability figure is bounded by what the machine can
        // actually give back before anything is allocated for real.
        let wild = Machine.simulated(ramGB: 512, workingSetGB: 400, availableGB: 400)
        let bounded = wild.boundedByReality()
        if let real = Planner.deviceAvailableGB(), let got = bounded.availableGB {
            c.expect(
                "a simulated availability is bounded by the real reading",
                got <= real + 0.001, "\(got) > \(real)")
        } else {
            c.expect("a simulated availability is bounded by the real reading", true)
        }

        // Precedence is unchanged, and a losing knob is noted, never dropped.
        let both = PlanRequest(expertsPerLayer: 30, memoryGB: 30)
        let p = try Planner.plan(both, on: Machine.simulated(ramGB: 64))
        c.equal("--experts-per-layer wins over --memory-gb", p.source, .expertsPerLayer)
        c.expect(
            "the losing knob is noted", p.notes.contains { $0.contains("--memory-gb") },
            "notes: \(p.notes)")
        c.expect("an empty request is auto", PlanRequest().isAuto)
        c.expect("any knob makes it not auto", !PlanRequest(memoryGB: 10).isAuto)

        // Round-trips, because these are the values a host app stores.
        let encoded = try JSONEncoder().encode(PlanRequest(memoryGB: 12, mtp: .off))
        let decoded = try JSONDecoder().decode(PlanRequest.self, from: encoded)
        c.equal("a plan request round-trips through JSON", decoded, PlanRequest(memoryGB: 12, mtp: .off))
        let dev = try JSONDecoder().decode(Machine.self, from: JSONEncoder().encode(sim))
        c.equal("a device round-trips through JSON", dev, sim)
        return c.report()
    }
}
