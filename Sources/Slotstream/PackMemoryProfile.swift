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
    /// Explicit capability is separate from measured automatic activation.
    package let supportsDecodeLookahead: Bool
    package let automaticOptimizations: Bool
    /// An explicit research forecast must retain its exact charge through
    /// initial planning and later governor replans.
    package let explicitLookaheadReserveBytes: Int?
    /// Maximum per-record destination piece for an explicitly sequential
    /// assembly/admission contract. Nil retains full replacement accounting.
    private let largestReplacementPieceBytes: Int?
    private let groupedWorkspace: Bool

    private init(identity: String, expertRecordBytes: Int, residentReserveBytes: Int = 0,
                 expertWorkspaceBytes: Int = 0, maximumPrefill: Int,
                 maximumContext: Int, usesBaselineSpeedEvidence: Bool,
                 supportsStreamedDraft: Bool, supportsVision: Bool, automaticOptimizations: Bool,
                 largestReplacementPieceBytes: Int? = nil, groupedWorkspace: Bool = false,
                 supportsDecodeLookahead: Bool = false, explicitLookaheadReserveBytes: Int? = nil) {
        self.identity = identity
        self.expertRecordBytes = expertRecordBytes
        self.residentReserveBytes = residentReserveBytes
        self.expertWorkspaceBytes = expertWorkspaceBytes
        self.maximumPrefill = maximumPrefill
        self.maximumContext = maximumContext
        self.usesBaselineSpeedEvidence = usesBaselineSpeedEvidence
        self.supportsStreamedDraft = supportsStreamedDraft
        self.supportsVision = supportsVision
        self.supportsDecodeLookahead = supportsDecodeLookahead
        self.automaticOptimizations = automaticOptimizations
        self.explicitLookaheadReserveBytes = explicitLookaheadReserveBytes
        self.largestReplacementPieceBytes = largestReplacementPieceBytes
        self.groupedWorkspace = groupedWorkspace
    }

    package static let original = Self(identity: "original-affine4-memory-v1",
        expertRecordBytes: 2_764_800, maximumPrefill: 4096,
        maximumContext: ContextPolicy.modelLimit, usesBaselineSpeedEvidence: true,
        supportsStreamedDraft: true, supportsVision: true, automaticOptimizations: true,
        supportsDecodeLookahead: true)

    /// Explicit standalone trial using the deployed arithmetic and bounded
    /// 32-record sweep. Expert records shrink; the original fixed, staging,
    /// allocator and per-token workspace allowances remain unchanged. Retain
    /// the reference pack's additional resident allowance conservatively.
    /// No original speed curve or automatic activation threshold is inherited.
    package static let affine3Native = Self(identity: "affine3-native-memory-v1",
        expertRecordBytes: 2_150_400, residentReserveBytes: 357_580_800 + 67_108_864,
        maximumPrefill: 4096, maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: false, automaticOptimizations: false,
        supportsDecodeLookahead: true)

    /// Diagnostic control: original expert bytes under the native candidate's
    /// conservative allocation policy. This is not a selectable product pack.
    package static let originalCandidateControl = Self(identity: "original-candidate-control-memory-v1",
        expertRecordBytes: original.expertRecordBytes,
        residentReserveBytes: affine3Native.residentReserveBytes,
        maximumPrefill: affine3Native.maximumPrefill, maximumContext: affine3Native.maximumContext,
        usesBaselineSpeedEvidence: false, supportsStreamedDraft: true,
        supportsVision: false, automaticOptimizations: false, supportsDecodeLookahead: true)

    /// Correction bytes come from the authenticated header, not a new speed
    /// estimate. Keep this distinct from every frozen uncorrected recipe.
    package static func affine3NativeCorrected(correctionBytes: Int) -> Self {
        Self(identity: "affine3-native-corrected-memory-v1", expertRecordBytes: affine3Native.expertRecordBytes,
            residentReserveBytes: affine3Native.residentReserveBytes, maximumPrefill: affine3Native.maximumPrefill,
            maximumContext: affine3Native.maximumContext, usesBaselineSpeedEvidence: false,
            supportsStreamedDraft: true, supportsVision: false, automaticOptimizations: false,
            supportsDecodeLookahead: true,
            explicitLookaheadReserveBytes: DecodeLookahead.reserveBytes(correctionBytes: correctionBytes))
    }

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
        largestReplacementPieceBytes: 614_400, groupedWorkspace: true)

    /// Separate capability identity for bounded, owned vision loading. The
    /// usual context ledger additionally charges tower residency and image
    /// workspace. Text arithmetic and the grouped expert allowance are shared;
    /// this explicit image probe is not a product or quality qualification.
    package static let affine3GroupedVisionControl = Self(identity: "affine3-grouped-vision-memory-v1",
        expertRecordBytes: 2_150_400, residentReserveBytes: 357_580_800 + 67_108_864,
        expertWorkspaceBytes: 623_597_568, maximumPrefill: 512,
        maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: true, automaticOptimizations: false,
        largestReplacementPieceBytes: 614_400, groupedWorkspace: true)

    /// Prospective text-only experiment. The planner must separately charge
    /// the complete original uncorrected-lookahead reserve: FP32 target/draft
    /// routers plus 128 MiB for staging and lane scratch. Candidate records
    /// and pieces are smaller than the original reserve's ownership envelope.
    /// It does not inherit original activation floors, forecasts or speed.
    package static let affine3GroupedLookaheadControl = Self(identity: "affine3-grouped-lookahead-memory-v1",
        expertRecordBytes: 2_150_400, residentReserveBytes: 357_580_800 + 67_108_864,
        expertWorkspaceBytes: 623_597_568, maximumPrefill: 512,
        maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: false, automaticOptimizations: false,
        largestReplacementPieceBytes: 614_400, groupedWorkspace: true,
        supportsDecodeLookahead: true)

    /// Exact GSQ224 research overlay. The original down weight is the largest
    /// replacement piece despite the smaller total record. Keep all resident,
    /// staging, allocator and grouped ownership allowances; no speed or Auto
    /// qualification follows from the byte saving. Text-only, explicit pilots.
    package static let gsq224GroupedControl = Self(identity: "gsq224-grouped-memory-v1",
        expertRecordBytes: 1_945_600, residentReserveBytes: 357_580_800 + 67_108_864,
        expertWorkspaceBytes: ContextWorkspace.affineGroupedWorkspaceBytes(tokens: 512,
            slots: Geometry.floorSlots, admits: true, recordBytes: 1_945_600, largestPieceBytes: 819_200),
        maximumPrefill: 512, maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: false, automaticOptimizations: false,
        largestReplacementPieceBytes: 819_200, groupedWorkspace: true,
        supportsDecodeLookahead: true)

    /// Explicit image qualification for the exact GSQ224 overlay, with the
    /// unchanged owned vision tower. Its residency and workspace are charged
    /// separately by the context ledger. The text-only timing recipe remains
    /// unchanged; this profile does not admit combined image/lookahead work.
    package static let gsq224GroupedVisionControl = Self(identity: "gsq224-grouped-vision-memory-v1",
        expertRecordBytes: gsq224GroupedControl.expertRecordBytes,
        residentReserveBytes: gsq224GroupedControl.residentReserveBytes,
        expertWorkspaceBytes: gsq224GroupedControl.expertWorkspaceBytes,
        maximumPrefill: 512, maximumContext: 32_768, usesBaselineSpeedEvidence: false,
        supportsStreamedDraft: true, supportsVision: true, automaticOptimizations: false,
        largestReplacementPieceBytes: 819_200, groupedWorkspace: true)

    package var fixedAllowanceBytes: Int {
        ContextBytes.sum(PlannerCostModel.fixedBytes, residentReserveBytes, expertWorkspaceBytes)
    }
    package var fixedAllowanceGB: Double { Double(fixedAllowanceBytes) / 1e9 }
    package func poolBytes(_ slots: Int) -> Int { ContextBytes.product(slots, expertRecordBytes) }
    package func poolGB(_ slots: Int) -> Double { Double(poolBytes(slots)) / 1e9 }
    package func workspaceBytes(slots: Int) -> Int {
        guard expertWorkspaceBytes > 0 else { return 0 }
        if groupedWorkspace {
            return ContextWorkspace.affineGroupedWorkspaceBytes(tokens: maximumPrefill, slots: slots, admits: true,
                recordBytes: expertRecordBytes, largestPieceBytes: largestReplacementPieceBytes!)
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
