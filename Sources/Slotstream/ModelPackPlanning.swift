import Foundation

/// A control range for one pack and the requested context/components. Current
/// headroom is deliberately absent: opening another app must not move a saved
/// slider value. Every actual load still runs current-memory admission.
public struct ModelPackMemoryRange: Equatable, Sendable {
    public let minimumBytes: Int64
    public let hardwareMaximumBytes: Int64
    public let incrementBytes: Int64
    public var minimumGB: Double { Double(minimumBytes) / 1e9 }
    public var maximumGB: Double { Double(hardwareMaximumBytes) / 1e9 }
}

public extension ModelPack {
    /// The pack owns its resource arithmetic. Optional components keep their
    /// independent availability and required/automatic choices; a plan never
    /// reinterprets a newly registered pack using the original byte geometry.
    func plan(_ request: PlanRequest, on machine: Machine, mtpAvailable: Bool = false,
              visionAvailable: Bool = false, visionResidentReserved: Bool = false,
              runtimePolicy: RuntimeAllocationPolicy? = nil,
              decodeLookahead: DecodeLookaheadPlanning = .automatic) throws -> MemoryPlan {
        try Planner.plan(resources: memoryProfile, expertsPerLayer: request.expertsPerLayer,
            poolGB: request.poolGB, memoryGB: request.memoryGB, memoryLimitGB: request.memoryLimitGB,
            ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: machine.availableGB,
            ramPercent: request.maxRAMPercent, mtp: request.mtp, mtpAvailable: mtpAvailable,
            vision: request.vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: request.maxContextTokens,
            simulated: machine.isSimulated, qualification: false, runtimePolicy: runtimePolicy,
            decodeLookahead: decodeLookahead, mtpExperts: request.mtpExperts ?? .automatic)
    }

    /// Find the first admitted control value using the same complete ledger as
    /// loading. Context and component choices are accepted here, memory knobs
    /// are not: they are the values this inquiry helps the user choose.
    ///
    /// The default half-GB increment matches the native control's existing
    /// accessibility policy. It is a display resolution, not an engine floor.
    /// The search is discrete and does not assume monotonicity across draft,
    /// lookahead or prefill transitions. Call at setup/settings boundaries,
    /// not from the governor or an inference metadata connection.
    func memoryRange(for request: PlanRequest, on machine: Machine, mtpAvailable: Bool = false,
                     visionAvailable: Bool = false, visionResidentReserved: Bool = false,
                     runtimePolicy: RuntimeAllocationPolicy? = nil,
                     decodeLookahead: DecodeLookaheadPlanning = .automatic,
                     incrementBytes: Int64 = 500_000_000) throws -> ModelPackMemoryRange {
        guard request.expertsPerLayer == nil, request.poolGB == nil, request.memoryGB == nil,
              request.memoryLimitGB == nil, request.maxRAMPercent == nil else {
            throw PlanError("A memory-range inquiry accepts context and component choices, not a memory override")
        }
        guard (100_000_000...1_000_000_000).contains(incrementBytes),
              1_000_000_000 % incrementBytes == 0,
              let ram = AutomaticPackPolicy.bytes(machine.ramGB), ram > 0,
              let working = AutomaticPackPolicy.bytes(machine.workingSetGB), working > 0, working <= ram,
              let maximum = AutomaticPackPolicy.bytes(Planner.maximumMemoryLimitGB(
                ramGB: machine.ramGB, workingSetGB: machine.workingSetGB)),
              let floor = AutomaticPackPolicy.bytes(memoryProfile.minimumMemoryGB) else {
            throw PlanError("Cannot derive a memory range from invalid hardware or control increments")
        }
        let maximumStep = maximum / incrementBytes
        let firstStep = floor / incrementBytes + (floor % incrementBytes == 0 ? 0 : 1)
        guard firstStep > 0, firstStep <= maximumStep else {
            throw PlanError("This Mac's supported memory budget cannot fit this pack")
        }
        // Every probe is explicitly simulated. No availability override or
        // actual allocation is involved; returned ranges are never load plans.
        let hardware = Machine.simulated(ramGB: machine.ramGB, workingSetGB: machine.workingSetGB,
            availableGB: machine.ramGB)
        func probe(_ step: Int64) throws -> MemoryPlan {
            var proposal = request
            proposal.memoryLimitGB = Double(step * incrementBytes) / 1e9
            let priced = try plan(proposal, on: hardware, mtpAvailable: mtpAvailable,
                visionAvailable: visionAvailable, visionResidentReserved: visionResidentReserved || request.vision == .on,
                runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead)
            try Planner.validateMemoryBudget(priced, availableGB: hardware.availableGB)
            guard Int64(priced.memoryLedger.expectedPeakBytes) <= step * incrementBytes,
                  let target = priced.targetGB.flatMap(AutomaticPackPolicy.bytes), target <= step * incrementBytes else {
                throw PlanError("This control value cannot hold the complete requested configuration")
            }
            return priced
        }
        // Invalid or unavailable required components fail once at the upper
        // endpoint, rather than causing a scan over an impossible request.
        _ = try probe(maximumStep)
        for step in firstStep...maximumStep {
            guard (try? probe(step)) != nil else { continue }
            return ModelPackMemoryRange(minimumBytes: step * incrementBytes,
                hardwareMaximumBytes: maximumStep * incrementBytes, incrementBytes: incrementBytes)
        }
        throw PlanError("No supported control value can hold this pack and its requested components")
    }
}
