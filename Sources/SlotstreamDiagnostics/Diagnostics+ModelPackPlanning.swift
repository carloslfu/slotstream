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
            for bound in stride(from: range.minimumBytes, through: range.hardwareMaximumBytes, by: Int(range.incrementBytes)) {
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
        var residentRequest = PlanRequest(mtp: .on, vision: .off, maxContextTokens: 8192)
        residentRequest.mtpExperts = .resident
        let residentDraft = try pack.memoryRange(for: residentRequest, on: roomy, mtpAvailable: true)
        let vision = try pack.memoryRange(for: .init(mtp: .off, vision: .on, maxContextTokens: 8192), on: roomy, visionAvailable: true)
        c.expect("long context pays for its retained state before raising the floor", long.minimumBytes > base.minimumBytes)
        // A streamed draft can fit within the same rounded control step as
        // plain decode. Require its real charge, not an invented higher floor.
        c.expect("required draft cannot lower the admitted control minimum", draft.minimumBytes >= base.minimumBytes)
        let draftPlan = try pack.plan(.init(memoryLimitGB: draft.minimumGB, mtp: .on,
            vision: .off, maxContextTokens: 8192), on: roomy, mtpAvailable: true)
        try Planner.validateMemoryBudget(draftPlan, availableGB: roomy.availableGB)
        c.expect("the draft floor admits its required head and complete byte charge",
            draftPlan.mtpEnabled && draftPlan.memoryLedger.mtpResidentBytes == (draftPlan.mtpStreamedExperts
                ? PlannerCostModel.mtpStreamedBytes : PlannerCostModel.mtpResidentBytes)
                && Int64(draftPlan.memoryLedger.expectedPeakBytes) <= draft.minimumBytes)
        c.expect("requiring full draft residency raises this control floor", residentDraft.minimumBytes > base.minimumBytes)
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

        // These paths feed serving and doctor. Compare the complete original
        // decision, not just a slot count, to preserve the independent API.
        let contextRequest = PlanRequest(memoryLimitGB: 20, mtp: .off, vision: .off)
        for choice: ContextWindowChoice in [.automatic, .tokens(8192)] {
            let owned = try pack.resolveContextWindow(choice, request: contextRequest, on: roomy)
            let legacy = try Planner.resolveContextWindow(choice, request: contextRequest, on: roomy)
            c.equal("pack context selection preserves original plan/\(choice)", try bytes(owned.plan), try bytes(legacy.plan))
            let ownedJSON = owned.automatic?.json ?? [:]
            let legacyJSON = legacy.automatic?.json ?? [:]
            c.equal("pack context selection preserves original explanation/\(choice)",
                try JSONSerialization.data(withJSONObject: ownedJSON, options: [.sortedKeys]),
                try JSONSerialization.data(withJSONObject: legacyJSON, options: [.sortedKeys]))
        }

        // Exercise genuinely different geometry without registering a research
        // pack or loading weights. Its explicit upper bound prevents a costly
        // search through windows the format cannot serve.
        let resources = PackMemoryProfile.affine3GroupedVisionControl
        let candidateMachine = Machine.simulated(ramGB: 48, availableGB: 40)
        var candidateRequest = PlanRequest(memoryLimitGB: 14, mtp: .on, vision: .off)
        candidateRequest.mtpExperts = .streamed
        let automatic = try Planner.resolveContextWindow(resources: resources, .automatic,
            request: candidateRequest, on: candidateMachine, mtpAvailable: true)
        c.expect("uncalibrated pack keeps its supported default and complete geometry",
            automatic.plan.resources == resources && automatic.plan.maxContextTokens == 32768 &&
            automatic.plan.mtpEnabled && automatic.plan.mtpStreamedExperts && automatic.plan.simulated)
        c.expect("uncalibrated pack does not inherit original request estimates",
            !Planner.estimatedRequestSeconds(automatic.plan).isFinite &&
            automatic.automatic?.candidates.allSatisfy { $0.requestSeconds == nil && $0.relativeRequestCost == nil } == true)
        c.expect("uncalibrated context explanation does not imply a measured tradeoff",
            automatic.automatic?.announcement(served: 32768).contains("no calibrated") == true &&
            automatic.automatic?.report(served: 32768).contains("no context-speed estimate") == true)
        try Planner.validateMemoryBudget(automatic.plan, availableGB: candidateMachine.availableGB)
        let explicit = try Planner.resolveContextWindow(resources: resources, .tokens(8192),
            request: candidateRequest, on: candidateMachine, mtpAvailable: true)
        c.expect("explicit candidate context retains its selected allocation contract",
            explicit.plan.resources == resources && explicit.plan.maxContextTokens == 8192 && explicit.automatic == nil)
        candidateRequest.maxContextTokens = 65536
        let refusal = Planner.contextFeasibility(resources: resources, candidateRequest,
            on: candidateMachine, mtpAvailable: true)
        c.expect("candidate context diagnostics refuse the unsupported window and name the real limit",
            refusal.requestedPlan == nil && refusal.refusal != nil &&
            refusal.maximumFeasibleWindow == resources.maximumContext && refusal.limitingResource == "pack_limit" &&
            refusal.maximumPlan?.resources == resources)
        // Qualification bypasses a global rollout limit, never an unsupported
        // pack layout. More simulated RAM must not authorize another context.
        let qualified = Planner.contextFeasibility(resources: resources, candidateRequest,
            on: candidateMachine, mtpAvailable: true, qualification: true)
        c.expect("qualification cannot bypass the selected pack's context limit",
            qualified.requestedPlan == nil && qualified.maximumFeasibleWindow == resources.maximumContext)
        let impossible = Planner.automaticContextWindow(resources: resources,
            PlanRequest(memoryLimitGB: 1, mtp: .off, vision: .off), on: candidateMachine)
        c.expect("an impossible candidate retains unknown timing in both context explanations",
            impossible.candidates.allSatisfy { $0.plan == nil && $0.requestSeconds == nil } &&
            impossible.announcement(served: impossible.window).contains("no calibrated") &&
            impossible.report(served: impossible.window).contains("no context-speed estimate"))
        for outcome in [automatic.automatic!, impossible] {
            c.expect("uncalibrated JSON does not advertise the original request-cost policy",
                outcome.json["timing_calibrated"] as? Bool == false &&
                outcome.json["request_time_tolerance"] is NSNull &&
                outcome.json["representative_request"] is NSNull &&
                outcome.json["pack_context_limit"] as? Int == resources.maximumContext)
            _ = try JSONSerialization.data(withJSONObject: outcome.json, options: [.sortedKeys])
        }
        return c.report()
    }
}
