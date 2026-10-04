import Foundation

/// Engine-owned allocation contract, never decoded from a model card. A
/// descriptor proves expert bytes; it does not qualify arithmetic or speed.
/// Public legacy planning keeps the original contract. Candidate entry points
/// must bind this profile to their authenticated loader before allocation.
package struct PackMemoryProfile: Equatable, Sendable {
    package let identity: String
    package let expertRecordBytes: Int
    package let residentReserveBytes: Int
    package let expertWorkspaceBytes: Int
    package let maximumPrefill: Int
    package let maximumContext: Int
    package let usesBaselineSpeedEvidence: Bool
    package let supportsStreamedDraft: Bool
    package let supportsVision: Bool
    package let automaticOptimizations: Bool

    private init(identity: String, expertRecordBytes: Int, residentReserveBytes: Int = 0,
                 expertWorkspaceBytes: Int = 0, maximumPrefill: Int,
                 maximumContext: Int, usesBaselineSpeedEvidence: Bool,
                 supportsStreamedDraft: Bool, supportsVision: Bool, automaticOptimizations: Bool) {
        self.identity = identity
        self.expertRecordBytes = expertRecordBytes
        self.residentReserveBytes = residentReserveBytes
        self.expertWorkspaceBytes = expertWorkspaceBytes
        self.maximumPrefill = maximumPrefill
        self.maximumContext = maximumContext
        self.usesBaselineSpeedEvidence = usesBaselineSpeedEvidence
        self.supportsStreamedDraft = supportsStreamedDraft
        self.supportsVision = supportsVision
        self.automaticOptimizations = automaticOptimizations
    }

    package static let original = Self(identity: "original-affine4-memory-v1",
        expertRecordBytes: 2_764_800, maximumPrefill: 4096,
        maximumContext: ContextPolicy.modelLimit, usesBaselineSpeedEvidence: true,
        supportsStreamedDraft: true, supportsVision: true, automaticOptimizations: true)

    /// Conservative research envelope, not a published supported pack. Keep
    /// the original fixed allowance and independently priced four-bit head.
    /// Reserve the eager embedding, authenticated rotary table, canonical RHS
    /// workspace and replacement scatter backing. Sweep admission can replace
    /// the pool while that layer remains live, so larger pools also increase
    /// workspaceBytes(slots:). Existing
    /// staging and allocator allowances are not credited away. These reserves
    /// may shrink only after owned-allocation and physical-peak qualification.
    /// The exact reference profile currently admits at most 512 query rows and
    /// the locally checked 32K context. Its speed and feature activation floors
    /// cannot inherit the original arithmetic's timing evidence.
    package static let affine3Control = Self(identity: "affine3-reference-memory-v2",
        expertRecordBytes: 2_150_400, residentReserveBytes: 357_580_800 + 67_108_864,
        expertWorkspaceBytes: 2_517_897_216, maximumPrefill: 512,
        maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: false, supportsVision: false, automaticOptimizations: false)

    package var fixedAllowanceBytes: Int {
        ContextBytes.sum(PlannerCostModel.fixedBytes, residentReserveBytes, expertWorkspaceBytes)
    }
    package var fixedAllowanceGB: Double { Double(fixedAllowanceBytes) / 1e9 }
    package func poolBytes(_ slots: Int) -> Int { ContextBytes.product(slots, expertRecordBytes) }
    package func poolGB(_ slots: Int) -> Double { Double(poolBytes(slots)) / 1e9 }
    package func workspaceBytes(slots: Int) -> Int {
        guard expertWorkspaceBytes > 0 else { return 0 }
        return ContextWorkspace.expertWorkspaceBytes(tokens: maximumPrefill, tile: 512,
            experts: 512, topK: 10, hidden: 2560, intermediate: 640,
            recordBytes: expertRecordBytes, loadBatch: 32,
            admissionPoolBytes: poolBytes(slots), admissionRecords: min(512, max(1, slots / 48)))
    }

    /// The fixed allowance already includes the floor workspace. Capacity
    /// must also pay for any extra scratch required by a larger arena.
    package func capacityBudgetGB(_ slots: Int) -> Double {
        Double(ContextBytes.sum(poolBytes(slots), max(0, workspaceBytes(slots: slots) - expertWorkspaceBytes))) / 1e9
    }

    package func slotsForCapacityBudgetGB(_ value: Double) -> Int {
        guard expertWorkspaceBytes > 0 else { return slotsForPoolGB(value) }
        if value >= capacityBudgetGB(Geometry.totalRecords) { return Geometry.totalRecords }
        if !value.isFinite || value <= capacityBudgetGB(Geometry.floorSlots) { return Geometry.floorSlots }
        var low = Geometry.floorSlots, high = Geometry.totalRecords
        while low < high {
            let mid = low + (high - low + 1) / 2
            if capacityBudgetGB(mid) <= value { low = mid } else { high = mid - 1 }
        }
        return low
    }
    package func slotsForPoolGB(_ value: Double) -> Int {
        guard value.isFinite else { return value > 0 ? Geometry.totalRecords : Geometry.floorSlots }
        if value >= poolGB(Geometry.totalRecords) { return Geometry.totalRecords }
        if value <= poolGB(Geometry.floorSlots) { return Geometry.floorSlots }
        return Int(value * 1e9 / Double(expertRecordBytes))
    }
    package var minimumMemoryGB: Double {
        ((poolGB(Geometry.floorSlots) + fixedAllowanceGB + Planner.planningMarginGB) * 10).rounded(.up) / 10
    }
}
