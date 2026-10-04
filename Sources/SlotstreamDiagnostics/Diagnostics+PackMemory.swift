import Foundation
import Slotstream

extension Diagnostics {
    public static func packMemory() throws -> CheckReport {
        var c = CheckBuilder("pack-memory")
        let profile = PackMemoryProfile.affine3Control
        func plan(_ resources: PackMemoryProfile, target: Double = 14,
                  mtp: Planner.MTPMode = .off, context: Int = 8192,
                  policy: RuntimeAllocationPolicy? = nil,
                  vision: Planner.VisionMode = .off,
                  placement: Planner.MTPExpertPlacement = .automatic,
                  lookahead: DecodeLookaheadPlanning = .automatic) throws -> MemoryPlan {
            try Planner.plan(resources: resources, expertsPerLayer: nil, poolGB: nil,
                memoryGB: target, ramGB: 48, workingSetGB: 36, availableGB: 40,
                mtp: mtp, mtpAvailable: true, vision: vision, visionAvailable: true,
                maxContextTokens: context, simulated: true, qualification: false,
                runtimePolicy: policy, decodeLookahead: lookahead, mtpExperts: placement)
        }
        let original = try plan(.original)
        let legacy = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 14,
            ramGB: 48, workingSetGB: 36, availableGB: 40, mtp: .off, mtpAvailable: true,
            vision: .off, visionAvailable: true, maxContextTokens: 8192,
            simulated: true, qualification: false, mtpExperts: .automatic)
        func json(_ p: MemoryPlan) throws -> Data {
            try JSONSerialization.data(withJSONObject: p.json(), options: [.sortedKeys])
        }
        c.equal("legacy planner retains exact original decisions", try json(original), try json(legacy))
        for slots in [640, 1000, 7000, Geometry.totalRecords] {
            let bytes = profile.poolBytes(slots)
            c.equal("three-bit complete-record byte cost \(slots)", bytes, slots * 2_150_400)
            c.equal("original complete-record byte cost \(slots)", PackMemoryProfile.original.poolBytes(slots), slots * 2_764_800)
            c.expect("byte conversion never overallocates \(slots)",
                profile.poolBytes(profile.slotsForPoolGB(Double(bytes) / 1e9)) <= bytes)
        }
        c.equal("invalid negative count saturates", profile.poolBytes(-1), Int.max)
        c.equal("overflow count saturates", profile.poolBytes(Int.max), Int.max)
        c.equal("huge finite pool capped before integer conversion", profile.slotsForPoolGB(1e300), Geometry.totalRecords)
        let candidate = try plan(profile)
        c.equal("ledger uses the authenticated expert recipe", candidate.memoryLedger.poolBytes, candidate.slots * 2_150_400)
        c.equal("eager embedding and rotary component reserved independently", candidate.memoryLedger.packResidentReserveBytes, 424_689_664)
        c.equal("floor layer, admission replacement and retained routes reserved", profile.workspaceBytes(slots: 640), 2_517_897_216)
        c.expect("larger arena includes a replacement alongside the layer", candidate.memoryLedger.expertWorkspaceBytes >= candidate.memoryLedger.poolBytes + 1_101_004_800)
        let piecewise = PackMemoryProfile.affine3PiecewiseControl
        c.equal("sequential pieces retain full source and bounded replacement", piecewise.workspaceBytes(slots: 640), 1_566_031_872)
        c.equal("sequential floor matches independently priced allowance", piecewise.workspaceBytes(slots: 640), piecewise.expertWorkspaceBytes)
        for slots in [640, 1000, 7000, Geometry.totalRecords] {
            c.expect("sequential admission still owns its largest replacement/\(slots)",
                piecewise.workspaceBytes(slots: slots) >= 512 * 2_150_400 + slots * 614_400
                    + min(512, slots / 48) * 2_150_400)
            c.expect("sequential copies do not grow the conservative allowance/\(slots)",
                piecewise.workspaceBytes(slots: slots) <= profile.workspaceBytes(slots: slots))
        }
        for budget in stride(from: 2.0, through: 20.0, by: 0.125) {
            let slots = piecewise.slotsForCapacityBudgetGB(budget)
            c.expect("sequential capacity pays for live replacement storage", piecewise.capacityBudgetGB(slots) <= budget)
            c.expect("sequential next record cannot fit", slots == Geometry.totalRecords || piecewise.capacityBudgetGB(slots + 1) > budget)
        }
        let piecewisePlan = try plan(piecewise)
        c.expect("sequential allocation admits more records at an equal ceiling", piecewisePlan.slots > candidate.slots)
        c.expect("sequential allocation keeps unknown speed and conservative features",
            piecewisePlan.json()["est_warm_tok_s"] is NSNull && !piecewisePlan.mtpEnabled && !piecewisePlan.decodeLookahead)
        c.expect("sequential allocation ledger respects its saved ceiling", piecewisePlan.expectedPeakGB <= 14)
        let grouped = PackMemoryProfile.affine3GroupedControl
        c.equal("grouped floor includes its independent allocation witness", grouped.workspaceBytes(slots: 640), 623_597_568)
        c.equal("grouped floor is charged exactly once", grouped.workspaceBytes(slots: 640), grouped.expertWorkspaceBytes)
        c.equal("grouped larger arena includes a larger live replacement", grouped.workspaceBytes(slots: 1000), 874_887_168)
        for slots in [640, 1000, 2000, 7000, Geometry.totalRecords] {
            c.expect("grouped hot rows and destination overlap remain charged/\(slots)",
                grouped.workspaceBytes(slots: slots) >= slots * 614_400 + 2 * min(512, slots / 48) * 2_150_400)
            if slots <= 7000 {
                c.expect("grouped weights release the unneeded full expert domain/\(slots)",
                    grouped.workspaceBytes(slots: slots) < piecewise.workspaceBytes(slots: slots))
            }
            var prior = 0
            for tokens in 1...512 {
                let workspace = ContextWorkspace.affineGroupedWorkspaceBytes(tokens: tokens, slots: slots, admits: true)
                c.expect("grouped query reservation is monotonic", workspace >= prior)
                c.expect("grouped no-admission cannot exceed admission",
                    ContextWorkspace.affineGroupedWorkspaceBytes(tokens: tokens, slots: slots, admits: false) <= workspace)
                prior = workspace
            }
        }
        for (tokens, slots) in [(0, 640), (-1, 640), (513, 640), (Int.max, 640), (512, 639), (512, -1), (512, Int.max)] {
            c.equal("invalid grouped geometry refuses before arithmetic/\(tokens)/\(slots)",
                ContextWorkspace.affineGroupedWorkspaceBytes(tokens: tokens, slots: slots, admits: true), Int.max)
        }
        for budget in stride(from: 2.0, through: 20.0, by: 0.125) {
            let slots = grouped.slotsForCapacityBudgetGB(budget)
            c.expect("grouped capacity pays for its larger admission overlap", grouped.capacityBudgetGB(slots) <= budget)
            c.expect("grouped capacity does not leave an unpriced record", slots == Geometry.totalRecords || grouped.capacityBudgetGB(slots + 1) > budget)
        }
        let groupedPlan = try plan(grouped)
        c.expect("grouped allocation returns released workspace to cache", groupedPlan.slots > piecewisePlan.slots)
        c.expect("grouped ledger remains within the saved ceiling", groupedPlan.expectedPeakGB <= 14)
        c.expect("grouped accounting does not inherit baseline speed or features",
            groupedPlan.json()["est_warm_tok_s"] is NSNull && !groupedPlan.mtpEnabled && !groupedPlan.decodeLookahead)
        for replacement in [-1, 0, 640 * 2_150_400 + 1, Int.max] {
            c.equal("invalid replacement bound refuses before allocation/\(replacement)",
                ContextWorkspace.expertWorkspaceBytes(tokens: 512, tile: 512, experts: 512,
                    topK: 10, hidden: 2560, intermediate: 640, recordBytes: 2_150_400, loadBatch: 32,
                    admissionPoolBytes: 640 * 2_150_400, admissionRecords: 13,
                    largestAdmissionWriteBytes: replacement), Int.max)
        }
        for budget in stride(from: 2.0, through: 20.0, by: 0.125) {
            let slots = profile.slotsForCapacityBudgetGB(budget)
            c.expect("capacity solve includes its own scratch", profile.capacityBudgetGB(slots) <= budget)
            c.expect("next record cannot fit the same capacity budget", slots == Geometry.totalRecords || profile.capacityBudgetGB(slots + 1) > budget)
        }
        c.expect("research defaults do not inherit feature timing thresholds", !candidate.mtpEnabled && !candidate.decodeLookahead)
        c.expect("candidate carries unknown speed through serialization", candidate.json()["est_warm_tok_s"] is NSNull)
        c.expect("candidate prefill estimate is also unknown", candidate.json()["est_prefill_tok_s"] is NSNull)
        c.equal("draft metadata respects the candidate context bound", candidate.json()["mtp_context_limit"] as? Int, 32768)
        c.equal("image metadata does not advertise an unsupported path", candidate.json()["vision_context_limit"] as? Int, 0)
        _ = try json(candidate)
        c.expect("candidate banner makes no original speed claim", !candidate.banner().contains("M5 Pro anchors"))
        let head = try plan(profile, mtp: .on, placement: .resident)
        c.equal("draft keeps its own four-bit cost", head.memoryLedger.mtpResidentBytes, 1_600_000_000)
        c.expect("explicit draft uses admitted resident placement", head.mtpEnabled && !head.mtpStreamedExperts)
        c.expect("candidate automatic placement does not inherit original timing floors", !(try plan(profile, mtp: .on)).mtpStreamedExperts)
        let streamed = try plan(profile, mtp: .on, placement: .streamed)
        c.expect("independent streamed draft is explicitly admitted", streamed.mtpEnabled && streamed.mtpStreamedExperts)
        c.equal("independent streamed draft retains original record cost", streamed.memoryLedger.mtpResidentBytes,
            PlannerCostModel.mtpStreamedBytes)
        c.expect("streaming leaves more budget for target capacity", streamed.slots > head.slots)
        let autoHead = try plan(profile, mtp: .auto)
        c.expect("unmeasured draft floor is not inherited", !autoHead.mtpEnabled)
        let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: false)
        let controlled = try Planner.applyingRuntimePolicy(candidate, policy: policy)
        c.equal("allocation override preserves resource identity", controlled.resources, profile)
        c.equal("reassigned capacity uses three-bit bytes", controlled.memoryLedger.poolBytes, controlled.slots * 2_150_400)
        c.expect("explicit controls keep the total target", controlled.expectedPeakGB <= 14)
        let request = try ContextConfiguration(maxContextTokens: candidate.maxContextTokens, maxPrefillWaitMinutes: 2)
        c.equal("request policy preserves resource identity", try candidate.withRequestPolicy(request).resources, profile)
        c.expect("different pack costs cannot satisfy fixed-capacity feasibility", !GovernorPolicy.fixedCapacityFits(current: original, availablePlan: candidate))
        for operation: () throws -> Void in [
            { _ = try plan(profile, target: profile.minimumMemoryGB - 0.01) },
            { _ = try plan(profile, context: 32769) },
            { _ = try plan(profile, policy: RuntimeAllocationPolicy(prefillChunkOverride: 1024)) },
            { _ = try plan(profile, vision: .on) },
            { _ = try plan(profile, lookahead: .retained(enabled: true, bytes: 1024)) },
            { _ = try Planner.applyingRuntimePolicy(candidate, policy: RuntimeAllocationPolicy(prefillChunkOverride: 1024)) }
        ] {
            do { try operation(); c.expect("unsupported pack configuration refused before load", false) }
            catch { c.expect("unsupported pack configuration refused before load", true) }
        }
        for ram in [16.0, 24, 32, 48, 64] {
            for limit in [profile.minimumMemoryGB, 12, 16, 24, 32] {
                for context in [2048, 8192, 32768] {
                    // Pure geometry fixture. Simulated RAM never grants an allocation.
                    do {
                        let p = try Planner.plan(resources: profile, expertsPerLayer: nil, poolGB: nil,
                            memoryGB: nil, memoryLimitGB: limit, ramGB: ram, workingSetGB: ram * 0.75,
                            availableGB: ram - 4, mtp: .auto, mtpAvailable: true,
                            maxContextTokens: context, simulated: true, qualification: false, mtpExperts: .automatic)
                        c.expect("simulated candidate remains bounded", p.simulated && p.expectedPeakGB <= limit && p.prefillChunk <= 512)
                        try Planner.validateMemoryBudget(p, availableGB: ram - 4)
                        c.equal("matrix retains exact pool geometry", p.memoryLedger.poolBytes, p.slots * 2_150_400)
                    } catch {
                        c.expect("infeasible matrix cell returns a typed refusal", error is PlanError)
                    }
                }
            }
        }
        var inputs = GovernorPolicy.Inputs(currentSlots: 7000, availableGB: 80,
            ramGB: 128, workingSetGB: 96, pressure: .warning, maxContextTokens: 8192)
        inputs.resources = profile
        // Isolate the pressure donation from the separate automatic ceiling.
        // This is a pure fixture; simulated capacity authorizes no allocation.
        inputs.memoryLimitGB = 48
        let currentGB = 7000.0 * 2_150_400 / 1e9
        let expected = max(Geometry.floorSlots, Int((currentGB - max(2, currentGB * 0.15)) * 1e9 / 2_150_400))
        c.expect("pressure fixture is below its independently planned ceiling", (GovernorPolicy.desiredSlots(inputs) ?? 0) >= expected)
        if case .resize(let slots, _) = GovernorPolicy.decide(inputs) {
            c.equal("pressure converts donated bytes using active pack", slots, expected)
        } else { c.expect("pressure shrinks candidate pool", false) }
        let controls = GovernorPolicy.liveControls(for: expected, inputs: inputs)
        c.expect("pressure cannot restore an unsupported prefill size", controls.prefillChunk <= 512)
        inputs.availableGB = 20; inputs.pressure = nil; inputs.ownedFootprintBytes = 2_000_000_000
        if let p = GovernorPolicy.desiredPlan(inputs) {
            c.equal("governor retains resource identity", p.resources, profile)
            c.expect("restart credits no more than observed ownership", (p.availableGB ?? .infinity) <= 22)
            c.expect("replan prices active pack within real credit", p.expectedPeakGB <= 22 - Planner.availabilitySlackGB(ramGB: 128))
        } else { c.expect("bounded ownership replan is feasible", false) }
        inputs.ownedFootprintBytes = 0
        c.expect("failed physical observation grants no resize credit", GovernorPolicy.desiredPlan(inputs) == nil)
        var time: UInt64 = 0
        let unknownSpeed = RequestController(configuration: try ContextConfiguration(maxContextTokens: 8192,
            maxPrefillWaitMinutes: 1), slackBytes: 0, clock: { time }, availableGB: { 30 })
        unknownSpeed.useBaselinePrefillEstimate(false)
        try unknownSpeed.admit(missingTokens: 8192, from: 0, maxChunk: 256)
        c.expect("unknown pack cannot inherit a baseline ETA", unknownSpeed.estimatedPrefillSeconds == nil)
        time = 60_000_000_000
        do {
            try unknownSpeed.check(phase: "unmeasured prefill")
            c.expect("unknown ETA retains the real wall deadline", false)
        } catch let failure as RequestFailure {
            c.equal("unknown ETA retains the real wall deadline", failure.code, .prefillDeadlineExceeded)
        }
        return c.report()
    }
}
