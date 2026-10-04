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
    /// Maximum per-record destination piece for an explicitly sequential
    /// assembly/admission contract. Nil retains full replacement accounting.
    private let largestReplacementPieceBytes: Int?

    private init(identity: String, expertRecordBytes: Int, residentReserveBytes: Int = 0,
                 expertWorkspaceBytes: Int = 0, maximumPrefill: Int,
                 maximumContext: Int, usesBaselineSpeedEvidence: Bool,
                 supportsStreamedDraft: Bool, supportsVision: Bool, automaticOptimizations: Bool,
                 largestReplacementPieceBytes: Int? = nil) {
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
        self.largestReplacementPieceBytes = largestReplacementPieceBytes
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
    package static let affine3Control = Self(identity: "affine3-reference-memory-v3",
        expertRecordBytes: 2_150_400, residentReserveBytes: 357_580_800 + 67_108_864,
        expertWorkspaceBytes: 2_517_897_216, maximumPrefill: 512,
        maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: false, automaticOptimizations: false)

    /// Separate, explicit research contract. The three packed weight pieces
    /// are 614,400 bytes per record; each of the six BF16 scale/bias pieces is
    /// 51,200. Sequential evaluated writes bound replacement backing by one
    /// largest piece while retaining the full source workspace and hot rows.
    /// The floor is the same conservative formula at 640 slots and 512 rows.
    /// This allocation mode does not qualify speed, quality or Auto selection.
    package static let affine3PiecewiseControl = Self(identity: "affine3-piecewise-memory-v1",
        expertRecordBytes: 2_150_400, residentReserveBytes: 357_580_800 + 67_108_864,
        expertWorkspaceBytes: 1_566_031_872, maximumPrefill: 512,
        maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: false, automaticOptimizations: false,
        largestReplacementPieceBytes: 614_400)

    /// Explicit grouped execution bounds expert weights independently of the
    /// full 512-expert domain. Owned hot gathers still coexist with a complete
    /// destination-piece replacement. The floor prices every allocation phase
    /// at 640 slots and 512 query rows; larger pools pay their own overlap.
    /// This remains a research profile with unknown speed and no Auto entry.
    package static let affine3GroupedControl = Self(identity: "affine3-grouped-memory-v1",
        expertRecordBytes: 2_150_400, residentReserveBytes: 357_580_800 + 67_108_864,
        expertWorkspaceBytes: 623_597_568, maximumPrefill: 512,
        maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: false, automaticOptimizations: false,
        largestReplacementPieceBytes: 614_400)

    package var fixedAllowanceBytes: Int {
        ContextBytes.sum(PlannerCostModel.fixedBytes, residentReserveBytes, expertWorkspaceBytes)
    }
    package var fixedAllowanceGB: Double { Double(fixedAllowanceBytes) / 1e9 }
    package func poolBytes(_ slots: Int) -> Int { ContextBytes.product(slots, expertRecordBytes) }
    package func poolGB(_ slots: Int) -> Double { Double(poolBytes(slots)) / 1e9 }
    package func workspaceBytes(slots: Int) -> Int {
        guard expertWorkspaceBytes > 0 else { return 0 }
        if self == .affine3GroupedControl {
            return ContextWorkspace.affineGroupedWorkspaceBytes(tokens: maximumPrefill, slots: slots, admits: true)
        }
        return ContextWorkspace.expertWorkspaceBytes(tokens: maximumPrefill, tile: 512,
            experts: 512, topK: 10, hidden: 2560, intermediate: 640,
            recordBytes: expertRecordBytes, loadBatch: 32,
            admissionPoolBytes: poolBytes(slots), admissionRecords: min(512, max(1, slots / 48)),
            largestWriteBytes: largestReplacementPieceBytes.map { ContextBytes.product(512, $0) },
            largestAdmissionWriteBytes: largestReplacementPieceBytes.map { ContextBytes.product(slots, $0) })
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
