// The machine, as a value.
//
// Named Machine, not Device: MLX exports its own `Device`, and any app using
// this library imports MLX too, so `Device` would be ambiguous at exactly the
// call sites that matter. It also matches what the measurement store calls
// these — records/machines/.
//
// The planner has always been able to answer "what would you do on a machine
// like this?" — that is what `doctor --sim-ram` asks — but the answer arrived
// through loose optional arguments, and the governor's simulated availability
// went through a global mutable static. A simulated figure still produces a
// real allocation: on 2026-08-30 pretending 60 GB was free made the governor
// allocate 25.4 GB for real and drove swap to 39 GB.
//
// So simulation is a property of a value here, and it travels with the plan it
// produced. `Engine.load` refuses a plan made for a simulated device, which
// turns that incident's rule into something the type system enforces rather
// than something a reader has to remember.

import Foundation

public struct Machine: Sendable, Codable, Equatable {
    /// Physical memory, in GB.
    public var ramGB: Double
    /// The Metal working-set limit: the real ceiling on this machine, always
    /// below RAM (40.2 of 51.5 GB on the 48 GB dev Mac).
    public var workingSetGB: Double
    /// Memory that can be taken right now without pushing anything else out —
    /// free plus purgeable plus file-backed. Nil means "do not clamp".
    public var availableGB: Double?
    /// True when any figure above was supplied rather than measured.
    public var isSimulated: Bool

    public init(ramGB: Double, workingSetGB: Double, availableGB: Double?, isSimulated: Bool) {
        self.ramGB = ramGB
        self.workingSetGB = workingSetGB
        self.availableGB = availableGB
        self.isSimulated = isSimulated
    }

    /// This Mac, measured now.
    public static func current() -> Machine {
        Machine(
            ramGB: Planner.deviceRAMGB(),
            workingSetGB: Planner.deviceWorkingSetGB(),
            availableGB: Planner.deviceAvailableGB(),
            isSimulated: false)
    }

    /// A machine that does not exist, for planning only.
    ///
    /// The working set defaults to 75% of RAM, which is what the measured
    /// machines sit near. `availableGB` nil means a pristine machine: nothing
    /// else is holding memory, so the availability clamp never binds.
    public static func simulated(
        ramGB: Double, workingSetGB: Double? = nil, availableGB: Double? = nil
    ) -> Machine {
        Machine(
            ramGB: ramGB, workingSetGB: workingSetGB ?? ramGB * 0.75,
            availableGB: availableGB, isSimulated: true)
    }

    /// The real reading, used to bound a simulated one before anything is
    /// allocated for real. A simulated availability above what the machine can
    /// actually give back is the shape of the 2026-08-30 incident.
    public func boundedByReality() -> Machine {
        guard isSimulated, let simulated = availableGB,
            let real = Planner.deviceAvailableGB()
        else { return self }
        var d = self
        d.availableGB = min(simulated, real)
        return d
    }
}

/// What the memory knobs asked for, before the planner resolves them.
///
/// Precedence is unchanged and lives in one place: `expertsPerLayer` beats
/// `poolGB`, which beats `memoryGB`, and a losing knob is noted in the plan
/// rather than silently dropped.
public struct PlanRequest: Sendable, Codable, Equatable {
    public var expertsPerLayer: Int?
    public var poolGB: Double?
    public var memoryGB: Double?
    /// Auto only: the largest share of RAM auto may target.
    public var maxRAMPercent: Double?
    public var mtp: Planner.MTPMode
    public var maxContextTokens: Int

    public init(
        expertsPerLayer: Int? = nil, poolGB: Double? = nil, memoryGB: Double? = nil,
        maxRAMPercent: Double? = nil, mtp: Planner.MTPMode = .auto,
        maxContextTokens: Int = ContextPolicy.maxTokens
    ) {
        self.expertsPerLayer = expertsPerLayer
        self.poolGB = poolGB
        self.memoryGB = memoryGB
        self.maxRAMPercent = maxRAMPercent
        self.mtp = mtp
        self.maxContextTokens = maxContextTokens
    }

    /// True when nothing was asked for, so the planner sizes to the machine.
    public var isAuto: Bool { expertsPerLayer == nil && poolGB == nil && memoryGB == nil }
}

extension Planner {
    /// Plan for a device. The same policy the loose-argument form runs; this
    /// one keeps the machine and the request together so neither can be half
    /// supplied by accident.
    public static func plan(
        _ request: PlanRequest, on device: Machine, mtpAvailable: Bool = false
    ) throws -> MemoryPlan {
        try plan(
            expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
            memoryGB: request.memoryGB, ramGB: device.ramGB,
            workingSetGB: device.workingSetGB, availableGB: device.availableGB,
            ramPercent: request.maxRAMPercent, mtp: request.mtp, mtpAvailable: mtpAvailable,
            maxContextTokens: request.maxContextTokens, simulated: device.isSimulated)
    }
}
