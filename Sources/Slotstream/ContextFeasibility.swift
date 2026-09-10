import Foundation

public struct ContextFeasibility {
    public let requestedWindow: Int
    public let maximumFeasibleWindow: Int
    public let limitingResource: String
    public let requestedPlan: MemoryPlan?
    /// Preserve a priced proposal when the physical-memory check refuses it.
    /// It is evidence for the refusal, never a loadable plan.
    public let requestedLedger: ContextMemoryLedger?
    public let maximumPlan: MemoryPlan?
    public let refusal: String?
    public var json: [String: Any] {
        ["requested_window": requestedWindow, "maximum_feasible_window": maximumFeasibleWindow,
         "limiting_resource": limitingResource, "refusal": refusal as Any? ?? NSNull(),
         "requested_memory_ledger": requestedLedger?.json as Any? ?? NSNull(),
         "maximum_memory_ledger": maximumPlan?.memoryLedger.json as Any? ?? NSNull(),
         "maximum_prefill_chunk": maximumPlan?.prefillChunk as Any? ?? NSNull(),
         "maximum_pool_slots": maximumPlan?.slots as Any? ?? NSNull(),
         "scope": "memory feasibility; independent of prefill deadline"]
    }
}

extension Planner {
    /// Exact discrete search. No monotonicity assumption about pass selection,
    /// MTP or retained-state transitions is needed. Do this at planning time,
    /// never on a metadata connection or while holding the generation lock.
    public static func contextFeasibility(_ request: PlanRequest, on device: Machine,
        mtpAvailable: Bool = false, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false, runtimePolicy: RuntimeAllocationPolicy? = nil,
        qualification: Bool = false) -> ContextFeasibility {
        // Freeze a nil real reading once; it must not drift during search.
        guard let availability = device.availableGB ?? (device.isSimulated ? .infinity : deviceAvailableGB()) else {
            return ContextFeasibility(requestedWindow: request.maxContextTokens,
                maximumFeasibleWindow: 0, limitingResource: "memory_reading_unavailable",
                requestedPlan: nil, requestedLedger: nil, maximumPlan: nil,
                refusal: "insufficient_memory: reclaimable memory is unreadable; feasibility cannot be established")
        }
        var requestedLedger: ContextMemoryLedger?
        func candidate(_ cap: Int) throws -> MemoryPlan {
            let value = try plan(expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
                memoryGB: request.memoryGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                availableGB: availability, ramPercent: request.maxRAMPercent,
                mtp: request.mtp, mtpAvailable: mtpAvailable, vision: request.vision,
                visionAvailable: visionAvailable, visionResidentReserved: visionResidentReserved,
                maxContextTokens: cap, simulated: device.isSimulated, qualification: qualification,
                runtimePolicy: runtimePolicy)
            if cap == request.maxContextTokens { requestedLedger = value.memoryLedger }
            let physical = min(device.workingSetGB, availability - availabilitySlackGB(ramGB: device.ramGB))
            guard Double(value.memoryLedger.expectedPeakBytes) <= physical * 1e9 else {
                throw PlanError("insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom")
            }
            if let target = value.targetGB, Double(value.memoryLedger.expectedPeakBytes) > target * 1e9 {
                throw PlanError("insufficient_memory: allocation exceeds the total-memory target")
            }
            return value
        }
        let resolved: MemoryPlan?
        let refusal: String?
        do { resolved = try candidate(request.maxContextTokens); refusal = nil }
        catch { resolved = nil; refusal = String(describing: error) }
        let limit = qualification ? ContextPolicy.modelLimit : ContextPolicy.implementationLimit
        var maximum: MemoryPlan?
        for cap in stride(from: limit, through: 1, by: -1) {
            if let value = try? candidate(cap) { maximum = value; break }
        }
        return ContextFeasibility(requestedWindow: request.maxContextTokens,
            maximumFeasibleWindow: maximum?.maxContextTokens ?? 0,
            limitingResource: maximum?.maxContextTokens == limit ? (qualification ? "model_limit" : "implementation_limit") : "memory_or_required_components",
            requestedPlan: resolved, requestedLedger: requestedLedger,
            maximumPlan: maximum, refusal: refusal)
    }
}
