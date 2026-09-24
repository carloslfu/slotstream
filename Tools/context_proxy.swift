import Foundation

/// Tests execute production policy. Observations are values; no model exists.
@main enum ContextContracts {
    static var counts: [String: Int] = [:]
    static var failures: [String] = []
    static func check(_ gate: String, _ name: String, _ ok: Bool) {
        counts[gate, default: 0] += 1
        if !ok { failures.append("\(gate): \(name)") }
    }
    static func failure(_ code: RequestFailure.Code, _ action: () throws -> Void) -> Bool {
        do { try action(); return false }
        catch let error as RequestFailure { return error.code == code }
        catch { return false }
    }

    static func main() throws {
        do {
            try defaults()
            try planning()
            try automaticWindows()
            try adaptiveBudgets()
            schedules()
            try requests()
        } catch { failures.append("unexpected error: \(error)") }
        let report: [String: Any] = ["passed": failures.isEmpty, "assertions": counts.values.reduce(0, +),
                                    "gates": counts, "failures": failures,
                                    "hardware_qualified": false, "model_loaded": false]
        print(String(decoding: try JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]), as: UTF8.self))
        if !failures.isEmpty { exit(1) }
    }

    static func adaptiveBudgets() throws {
        let legacyPlanRequest: (Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest = PlanRequest.init
        let legacyMemoryPlan: (MemoryPlan.Source, Int, Double?, Double, Double, Double, Double?, Bool, Int, Int, Bool, Bool, Bool, Int, [String], Bool, RuntimeAllocationPolicy?, Double, Bool, Int, Bool) -> MemoryPlan = MemoryPlan.init
        let legacyGovernorPolicyInputs: (Int, Double, Double, Double, Double, Double?, Double?, GovernorPolicy.Pressure?, Bool, Bool, Bool, Int, RuntimeAllocationPolicy?, Int, Bool, Bool, Int) -> GovernorPolicy.Inputs = GovernorPolicy.Inputs.init
        let legacyPlanner2: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool, Bool, RuntimeAllocationPolicy?, DecodeLookaheadPlanning, Planner.ContextRetention) throws -> MemoryPlan = Planner.plan
        let legacyPlanner1: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool, RuntimeAllocationPolicy?) throws -> MemoryPlan = Planner.plan
        let legacyPlanner0: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
        _ = (legacyPlanRequest, legacyMemoryPlan, legacyGovernorPolicyInputs, legacyPlanner2, legacyPlanner1, legacyPlanner0)
        let machine = Machine.simulated(ramGB: 64 * 1.073741824,
            workingSetGB: 64 * 1.073741824 * 0.75, availableGB: 62)
        let legacyRequest = legacyPlanRequest(nil, nil, 10, nil, .off, .off, 32768)
        check("M01", "legacy request initializer keeps its policy", legacyRequest.memoryGB == 10 && legacyRequest.memoryLimitGB == nil)
        for legacy in [
            try legacyPlanner0(nil, nil, 10, machine.ramGB, machine.workingSetGB, 62, nil, .off, false, .off, false, false, 32768, true),
            try legacyPlanner1(nil, nil, 10, machine.ramGB, machine.workingSetGB, 62, nil, .off, false, .off, false, false, 32768, true, nil),
            try legacyPlanner2(nil, nil, 10, machine.ramGB, machine.workingSetGB, 62, nil, .off, false, .off, false, false, 32768, true, false, nil, .automatic, .automatic)
        ] {
            check("M01", "legacy planner function value retains fixed behavior", legacy.source == .memoryGB && legacy.targetGB == 10 && legacy.memoryLimitGB == nil)
        }
        let legacyPlan = legacyMemoryPlan(.auto, Geometry.floorSlots, 10, machine.ramGB, machine.workingSetGB, 70,
            62, false, 256, 0, false, false, false, 32768, [], true, nil, 17, false, 0, false)
        check("M01", "legacy plan initializer preserves values", legacyPlan.memoryLimitGB == nil && legacyPlan.maxPrefillWaitMinutes == 17 && legacyPlan.simulated)
        let legacyInput = legacyGovernorPolicyInputs(Geometry.floorSlots, 30, machine.ramGB, machine.workingSetGB, 70,
            61, 61, nil, false, false, false, 32768, nil, 0, false, false, 0)
        check("M01", "legacy governor input initializer preserves policy", legacyInput.memoryLimitGB == nil && legacyInput.ramPercent == 70)
        let automatic = try Planner.plan(PlanRequest(mtp: .off), on: machine)
        for limit in [10.0, 24, 33, 40, 48, 60, 64] {
            for available in [13.0, 18, 30, 62] {
                var device = machine; device.availableGB = available
                let request = PlanRequest(memoryLimitGB: limit, mtp: .off, vision: .auto)
                let plan = try Planner.plan(request, on: device, visionAvailable: true)
                check("M01", "saved adaptive limit", plan.memoryLimitGB == limit && plan.source == .auto)
                check("M01", "available target fits all bounds", plan.targetGB! <= min(limit,
                    Planner.maximumMemoryLimitGB(ramGB: device.ramGB, workingSetGB: device.workingSetGB),
                    available - Planner.availabilitySlackGB(ramGB: device.ramGB)))
                check("M01", "complete ledger fits target", plan.expectedPeakGB <= plan.targetGB!)
                let input = GovernorPolicy.Inputs(currentSlots: plan.slots, availableGB: 62,
                    ramGB: device.ramGB, workingSetGB: device.workingSetGB, ramPercent: plan.ramPercent,
                    secondsSincePressure: 100, secondsSinceResize: 100, visionEnabled: true, memoryLimitGB: limit)
                let recovered = GovernorPolicy.desiredPlan(input)
                check("M01", "recovery preserves selected limit", recovered?.memoryLimitGB == limit)
                check("M01", "recovery stays below selected limit", (recovered?.targetGB ?? .infinity) <= limit)
                if limit > 33, available == 62 {
                    check("M01", "custom exceeds automatic cache", plan.slots > automatic.slots)
                }
                if limit >= 24 {
                    let vision = try Planner.loadingVision(plan)
                    check("M01", "vision preserves limit", vision.memoryLimitGB == limit)
                    check("M01", "vision ledger fits limit", vision.expectedPeakGB <= limit)
                }
                let configured = try plan.withRequestPolicy(ContextConfiguration())
                let policy = try RuntimeAllocationPolicy(prefixCacheEnabled: false)
                let adjusted = try Planner.applyingRuntimePolicy(plan, policy: policy)
                check("M01", "plan transformations preserve ceiling", configured.memoryLimitGB == limit
                    && adjusted.memoryLimitGB == limit && plan.addingNotes(["test"]).memoryLimitGB == limit)
            }
        }
        let bounded = try Planner.plan(PlanRequest(memoryLimitGB: 48, maxRAMPercent: 40, mtp: .off), on: machine)
        check("M01", "explicit RAM share can lower adaptive ceiling", bounded.targetGB! <= machine.ramGB * 0.4)
        for limit in [8.15, 9.99, 12.345678901234, 48.123456789] {
            let p = try Planner.plan(PlanRequest(memoryLimitGB: limit, mtp: .off), on: machine)
            let json = p.json()
            check("M01", "fractional target survives JSON without rounding above ceiling",
                json["target_gb"] as? Double == p.targetGB && p.targetGB! <= limit)
        }
        var busy = machine; busy.availableGB = 18
        let capped = try Planner.plan(PlanRequest(memoryLimitGB: 64, mtp: .off), on: busy)
        check("M01", "busy oversized ceiling explains its hardware bound",
            capped.notes.contains { $0.contains("bounded by this Mac") }
                && !capped.notes.contains { $0.contains("toward your 64.0 GB limit") })
        let small = try Planner.plan(PlanRequest(memoryLimitGB: 10, mtp: .off), on: machine)
        var recovery = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots, availableGB: 30,
            ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, ramPercent: 100,
            secondsSincePressure: 61, secondsSinceResize: 61, memoryLimitGB: 10)
        check("M01", "small recovery is below ordinary growth deadband",
            Geometry.gb(small.slots - Geometry.floorSlots) < 2)
        if case .resize(let slots, _) = GovernorPolicy.decide(recovery) {
            check("M01", "small cache returns to its prior budget", slots == small.slots)
        } else { check("M01", "small cache returns to its prior budget", false) }
        recovery.secondsSinceResize = 1
        check("M01", "small recovery respects resize cooldown", GovernorPolicy.decide(recovery) == .hold)
        recovery.secondsSinceResize = 61; recovery.secondsSincePressure = 1
        check("M01", "small recovery respects pressure cooldown", GovernorPolicy.decide(recovery) == .hold)
        recovery.secondsSincePressure = 61; recovery.availableGB = 0
        check("M01", "recovery never invents available memory", GovernorPolicy.decide(recovery) == .hold)
        recovery.availableGB = 30; recovery.memoryLimitGB = 9
        check("M01", "a lower saved ceiling still bounds recovery",
            (GovernorPolicy.desiredPlan(recovery)?.targetGB ?? .infinity) <= 9)
        var startupMachine = machine; startupMachine.availableGB = 12
        let busyStart = try Planner.plan(PlanRequest(memoryLimitGB: 10, mtp: .off), on: startupMachine)
        recovery.currentSlots = busyStart.slots; recovery.memoryLimitGB = 10
        recovery.secondsSinceResize = nil; recovery.secondsSincePressure = nil
        check("M01", "busy startup begins below its saved ceiling", busyStart.clamped && busyStart.slots < small.slots)
        if case .resize(let slots, _) = GovernorPolicy.decide(recovery) {
            check("M01", "busy startup reaches a fully available small ceiling", slots == small.slots)
        } else { check("M01", "busy startup reaches a fully available small ceiling", false) }
        recovery.currentSlots = Geometry.floorSlots; recovery.availableGB = 4.5
        check("M01", "partial availability keeps the ordinary growth deadband",
            GovernorPolicy.desiredPlan(recovery)?.clamped == true && GovernorPolicy.decide(recovery) == .hold)
        for invalid in [Double.nan, .infinity, -1, 0, 8] {
            check("M01", "invalid adaptive budget refused", (try? Planner.plan(
                PlanRequest(memoryLimitGB: invalid, mtp: .off), on: machine)) == nil)
        }
        for request in [PlanRequest(memoryGB: 20, memoryLimitGB: 48),
                        PlanRequest(poolGB: 10, memoryLimitGB: 48),
                        PlanRequest(expertsPerLayer: 40, memoryLimitGB: 48)] {
            check("M01", "conflicting fixed budget refused", (try? Planner.plan(request, on: machine)) == nil)
        }
        for target in [48.0, 60] {
            let request = PlanRequest(memoryGB: target, mtp: .off)
            let p = try Planner.plan(request, on: machine)
            let startupAccepts = (try? Planner.validateMemoryBudget(p, availableGB: machine.availableGB)) != nil
            let diagnosticAccepts = Planner.contextFeasibility(request, on: machine).requestedPlan != nil
            check("M01", "startup and doctor agree", startupAccepts == diagnosticAccepts)
            check("M01", "Metal excess refused by both", startupAccepts == (target == 48))
        }
        check("M01", "startup fails closed on unavailable reading", (try? Planner.validateMemoryBudget(automatic, availableGB: nil)) == nil)
        let request = PlanRequest(memoryLimitGB: 48, mtp: .off)
        let autoWindow = try Planner.resolveContextWindow(.automatic, request: request, on: machine).plan
        check("M01", "automatic context retains larger adaptive cache", autoWindow.maxContextTokens == 32768
            && autoWindow.memoryLimitGB == 48 && autoWindow.slots > automatic.slots)
        let legacy = Data("{\"mtp\":\"off\",\"vision\":\"off\",\"maxContextTokens\":32768}".utf8)
        check("M01", "legacy request still decodes", try JSONDecoder().decode(PlanRequest.self, from: legacy).memoryLimitGB == nil)
        let pristine = Machine.simulated(ramGB: machine.ramGB, workingSetGB: machine.workingSetGB)
        let unconstrained = try Planner.plan(request, on: pristine)
        let explicitInfinity = try Planner.plan(request, on: Machine.simulated(ramGB: machine.ramGB,
            workingSetGB: machine.workingSetGB, availableGB: .infinity))
        check("M01", "simulated nil availability never reads the host", unconstrained.slots == explicitInfinity.slots
            && unconstrained.targetGB == 48 && unconstrained.availableGB == .infinity)
        let pristineWindow = try Planner.resolveContextWindow(.automatic, request: request, on: pristine).plan
        check("M01", "automatic simulated window is independent of host availability",
            pristineWindow.slots == explicitInfinity.slots && pristineWindow.memoryLimitGB == 48)
        var fitted = 0, refused = 0
        for limit in [8.1, 10, 13, 33, 48, 64, 1e300] {
            for window in [1, 32768, 65536, 262144] {
                for mtp: Planner.MTPMode in [.off, .auto, .on] {
                    for policy in [try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: false),
                                   try RuntimeAllocationPolicy(prefillChunkOverride: 4096)] {
                        do {
                            let value = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                                memoryLimitGB: limit, ramGB: machine.ramGB, workingSetGB: machine.workingSetGB,
                                availableGB: 62, mtp: mtp, mtpAvailable: true,
                                vision: .on, visionAvailable: true, visionResidentReserved: true,
                                maxContextTokens: window, simulated: true, qualification: false, runtimePolicy: policy,
                                decodeLookahead: .reserved(bytes: 512 << 20))
                            fitted += 1
                            check("M01", "combined resident and workspace charges fit adaptive ceiling",
                                value.memoryLimitGB == limit && value.targetGB! <= limit
                                && value.expectedPeakGB <= value.targetGB!)
                            check("M01", "combined plan passes physical feasibility",
                                (try? Planner.validateMemoryBudget(value, availableGB: 62)) != nil)
                            let next = GovernorPolicy.desiredPlan(.init(currentSlots: value.slots,
                                availableGB: 30, ramGB: machine.ramGB, workingSetGB: machine.workingSetGB,
                                ramPercent: value.ramPercent, mtpEnabled: value.mtpEnabled,
                                visionEnabled: true, visionResidentReserved: true, maxContextTokens: window,
                                runtimeAllocationPolicy: policy, lookaheadReserveBytes: value.lookaheadReserveBytes,
                                memoryLimitGB: limit))
                            check("M01", "combined live replan retains adaptive policy", next == nil
                                || (next!.memoryLimitGB == limit && next!.expectedPeakGB <= limit
                                    && next!.visionResidentReserved && next!.mtpEnabled == value.mtpEnabled))
                        } catch { refused += 1 }
                    }
                }
            }
        }
        check("M01", "combined feature sweep includes fits and refusals", fitted > 0 && refused > 0)
        for invalid in [Double.nan, .infinity, -.infinity, -1, 0] {
            let manual = MemoryPlan(source: .auto, slots: Geometry.floorSlots, targetGB: 10,
                ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, ramPercent: 100,
                availableGB: 62, clamped: false, prefillChunk: 256, prefixCacheTokens: 0,
                notes: [], simulated: true, memoryLimitGB: invalid)
            check("M01", "hand-built invalid adaptive plan is refused at startup",
                (try? Planner.validateMemoryBudget(manual, availableGB: 62)) == nil)
        }
        for (source, target) in [(MemoryPlan.Source.auto, Optional(11.0)), (.auto, nil), (.poolGB, 10.0)] {
            let manual = MemoryPlan(source: source, slots: Geometry.floorSlots, targetGB: target,
                ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, ramPercent: 100,
                availableGB: 62, clamped: false, prefillChunk: 256, prefixCacheTokens: 0,
                notes: [], simulated: true, memoryLimitGB: 10)
            check("M01", "inconsistent hand-built adaptive policy is refused",
                (try? Planner.validateMemoryBudget(manual, availableGB: 62)) == nil)
        }
        // Direct callers can bypass planning. Validate their device values,
        // unavailable observations and underfunded targets before allocation.
        func manualBudget(ram: Double = 64, workingSet: Double = 48,
                          target: Double? = 10) -> MemoryPlan {
            MemoryPlan(source: .memoryGB, slots: Geometry.floorSlots, targetGB: target,
                ramGB: ram, workingSetGB: workingSet, ramPercent: 70,
                availableGB: 62, clamped: false, prefillChunk: 256,
                prefixCacheTokens: 0, notes: [], simulated: true)
        }
        for invalid in [Double.nan, .infinity, -1, 0] {
            for plan in [manualBudget(ram: invalid), manualBudget(workingSet: invalid),
                         manualBudget(target: invalid)] {
                check("M01", "invalid direct memory budget is refused",
                    (try? Planner.validateMemoryBudget(plan, availableGB: 62)) == nil)
            }
        }
        let valid = manualBudget()
        check("M01", "valid direct budget is accepted",
            (try? Planner.validateMemoryBudget(valid, availableGB: 62)) != nil)
        for unavailable in [nil, Double.nan, -1.0] as [Double?] {
            check("M01", "unknown or invalid availability cannot authorize allocation",
                (try? Planner.validateMemoryBudget(valid, availableGB: unavailable)) == nil)
        }
        check("M01", "a direct target below the allocation is refused",
            (try? Planner.validateMemoryBudget(manualBudget(target: valid.expectedPeakGB / 2),
                                               availableGB: 62)) == nil)
    }

    static func defaults() throws {
        let fixture = try JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: CommandLine.arguments[1]))) as! [String: Any]
        let fields = fixture["projection_fields"] as! [String]
        for tier in fixture["tiers"] as! [[String: Any]] {
            let args = tier["args"] as! [String]
            func value(_ flag: String) -> Double { Double(args[args.firstIndex(of: flag)! + 1])! }
            var previous: NSDictionary?
            for _ in 0..<2 {
                let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                    ramGB: value("--sim-ram"), workingSetGB: value("--sim-working-set"), availableGB: value("--sim-available"),
                    mtp: .off, vision: .off, simulated: true)
                let projection = p.json().filter { fields.contains($0.key) } as NSDictionary
                check("C01", "frozen default tier \(tier["tier"]!)", projection.isEqual(tier["expected"] as! NSDictionary))
                if let previous { check("C01", "repeated default projection", projection.isEqual(previous)) }
                previous = projection
            }
        }
        check("C09", "legacy default", (try ContextConfiguration()).maxContextTokens == 32768)
        check("C09", "public limit is the pinned model limit", ContextPolicy.maxTokens == ContextPolicy.modelLimit
            && ContextPolicy.implementationLimit == 262144)
        for cap in [65537, 131072, 262144] {
            check("C09", "public configuration \(cap)", (try? ContextConfiguration(maxContextTokens: cap))?.maxContextTokens == cap)
        }
        check("C09", "model limit available through explicit qualification", (try ContextConfiguration(maxContextTokens: 262144, qualification: true)).maxContextTokens == 262144)
        for cap in [Int.min, -1, 0, 262145, Int.max] {
            check("C09", "invalid public configuration \(cap)", failure(.contextLengthExceeded) { _ = try ContextConfiguration(maxContextTokens: cap) })
        }
    }

    static func automaticWindows() throws {
        let tiers: [(Double, Int)] = [(16, 32768), (24, 32768), (32, 32768), (36, 65536), (48, 32768),
                                      (64, 131072), (96, 262144), (128, 262144)]
        for (ram, window) in tiers {
            let device = Machine(ramGB: ram, workingSetGB: ram * 0.75, availableGB: ram, isSimulated: true)
            let choice = Planner.automaticContextWindow(PlanRequest(), on: device, mtpAvailable: true, visionAvailable: true)
            check("C23", "automatic window at \(Int(ram)) GB", choice.window == window)
            check("C23", "every candidate evaluated at \(Int(ram)) GB", choice.candidates.map(\.window) == ContextPolicy.automaticWindows)
            let resolved = try Planner.resolveContextWindow(.automatic, request: PlanRequest(), on: device,
                mtpAvailable: true, visionAvailable: true)
            check("C23", "quiet machine serves its automatic window at \(Int(ram)) GB", resolved.plan.maxContextTokens == window)
            if window > ContextPolicy.defaultTokens, let base = choice.candidates.first?.plan {
                check("C23", "automatic window retains one complete conversation at \(Int(ram)) GB", resolved.plan.prefixCacheTokens >= window)
                check("C23", "automatic window keeps speculative decoding at \(Int(ram)) GB",
                    resolved.plan.mtpEnabled == base.mtpEnabled && resolved.plan.decodeLookahead == base.decodeLookahead)
            }
        }
        let big = Machine(ramGB: 128, workingSetGB: 96, availableGB: 128, isSimulated: true)
        // A clamped estimate is missing evidence, not a free cache reduction.
        for ram in [64.0, 64 * 1024 * 1024 * 1024 / 1e9] {
            let device = Machine(ramGB: ram, workingSetGB: ram * 0.75, availableGB: ram, isSimulated: true)
            for mtp in [Planner.MTPMode.off, .on, .auto] {
                let request = PlanRequest(memoryGB: 48, mtp: mtp)
                let choice = Planner.automaticContextWindow(request, on: device, mtpAvailable: true)
                let base = try Planner.resolveContextWindow(.tokens(32768), request: request, on: device, mtpAvailable: true).plan
                let selected = try Planner.resolveContextWindow(.automatic, request: request, on: device, mtpAvailable: true).plan
                check("C23", "48 GB default keeps the explicit 32K cache", selected.slots == base.slots && selected.maxContextTokens == 32768)
                check("C23", "48 GB candidates explain unmeasured cache loss", choice.candidates.dropFirst().allSatisfy {
                    !$0.accepted && $0.relativeRequestCost == nil && $0.reason.contains("unmeasured")
                })
                for window in [65536, 131072, 262144] {
                    let explicit = try Planner.resolveContextWindow(.tokens(window), request: request, on: device, mtpAvailable: true)
                    check("C23", "48 GB explicit context stays available", explicit.plan.maxContextTokens == window && explicit.automatic == nil)
                }
            }
        }
        check("C23", "a fixed cache size keeps the default window",
            Planner.automaticContextWindow(PlanRequest(expertsPerLayer: 120), on: big, mtpAvailable: true).window == ContextPolicy.defaultTokens)
        let explicit = try Planner.resolveContextWindow(.tokens(65536), request: PlanRequest(), on: big, mtpAvailable: true)
        check("C23", "an explicit window is planned as given", explicit.plan.maxContextTokens == 65536 && explicit.automatic == nil)
        let busy = try Planner.resolveContextWindow(.automatic, request: PlanRequest(),
            on: Machine(ramGB: 128, workingSetGB: 96, availableGB: 40, isSimulated: true), mtpAvailable: true)
        check("C23", "a busy machine lowers the automatic window and says so",
            busy.plan.maxContextTokens < 262144 && busy.plan.notes.contains { $0.contains("lowered from 262144") })
        check("C23", "a busy machine keeps speculative decoding", busy.plan.mtpEnabled)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil, ramGB: 17.2, workingSetGB: 11.8,
            availableGB: 12.5, maxContextTokens: 65536, simulated: true)
        check("C23", "an explicit window too large to retain keeps the budget share with a note",
            small.prefixCacheTokens < 65536 && small.notes.contains { $0.contains("does not fit retained") })
        let legacy = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil, ramGB: 51.5, workingSetGB: 40.2,
            availableGB: 44, maxContextTokens: 32768, simulated: true)
        let share = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil, ramGB: 51.5, workingSetGB: 40.2,
            availableGB: 44, maxContextTokens: 32768, simulated: true, qualification: false, retention: .budgetShare)
        check("C23", "the default window is unchanged by retention policy", legacy.slots == share.slots
            && legacy.prefixCacheTokens == share.prefixCacheTokens && legacy.targetGB == share.targetGB)
    }

    static func planning() throws {
        let caps = [1, 1023, 1024, 1025, 4096, 8192, 32767, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let rows = ((cap + 1023) / 1024) * 1024
            check("C04", "allocated main rows", ContextGeometry.sequenceBytes(tokens: cap) == rows * 12 * 2304)
            check("C04", "allocated draft rows", ContextGeometry.sequenceBytes(tokens: cap, mtp: true) == rows * 13 * 2304)
            for target in [8.1, 10, 16, 22, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    for vision in [Planner.VisionMode.off, .on, .auto] {
                        for cache in [false, true] {
                            do {
                                let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                                    ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                                    mtp: mtp, mtpAvailable: true, vision: vision, visionAvailable: true,
                                    visionResidentReserved: vision != .off, maxContextTokens: cap,
                                    simulated: true, qualification: true,
                                    runtimePolicy: RuntimeAllocationPolicy(prefixCacheEnabled: cache))
                                check("C02", "resolved plan fits target", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                                check("C02", "requested context preserved", p.maxContextTokens == cap)
                                check("C02", "explicit draft preserved", mtp != .on || p.mtpEnabled)
                                check("C04", "disabled retention spends no capacity", cache || p.prefixCacheTokens == 0)
                            } catch {
                                check("C02", "typed plan refusal", error is PlanError && !String(describing: error).isEmpty)
                            }
                        }
                    }
                }
            }
        }
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 22] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: 262144)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            check("C03", "solver maximum accepted", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < 262144 {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
                    maxContextTokens: result.maximumFeasibleWindow + 1, simulated: true, qualification: true)
                check("C03", "next token refused", next == nil)
            }
        }
        for invalid in [-1, Int.max] {
            check("C04", "invalid capacity refuses", ContextGeometry.sequenceBytes(tokens: invalid) == Int.max)
        }
        check("C04", "growth charges replacement", ContextGeometry.nextBufferAllocationBytes(tokens: 1025, rowBytes: 1024, allocatedBytes: 1024 * 1024) == 2048 * 1024)
        check("C04", "same buffer can reuse capacity", ContextGeometry.nextBufferAllocationBytes(tokens: 1024, rowBytes: 1024, allocatedBytes: 4096 * 1024) == 0)
        check("C04", "Hermes reserve anchor", ContextMemoryLedger.transientReserveBytes(context: 65536) == 905969664)
        for cap in [1024, 32768, 65536, 131072, 262144] {
            for available in [0.0, 4, 16, 32] {
                for owned in [0, ContextGeometry.additionalActiveBytes(tokens: cap)] {
                    let input = GovernorPolicy.Inputs(currentSlots: 4000, availableGB: available, ramGB: 51.5,
                        workingSetGB: 40.2, maxContextTokens: cap, ownedAdditionalBytes: owned, contextQualification: true)
                    if let plan = GovernorPolicy.desiredPlan(input) {
                        check("C05", "governor keeps window", plan.maxContextTokens == cap)
                        let budget = min(40.2, available + Geometry.gb(4000) + Planner.fixedFootprintGB + Double(owned) / 1e9 - Planner.availabilitySlackGB(ramGB: 51.5))
                        check("C05", "owned credit used once", Double(plan.memoryLedger.expectedPeakBytes) <= budget * 1e9)
                    } else { check("C05", "infeasible replan does not grant admission", GovernorPolicy.desiredSlots(input) == nil) }
                }
            }
        }
    }

    static func schedules() {
        var seed: UInt64 = 713
        for index in 0..<400 {
            seed = seed &* 6364136223846793005 &+ 1
            let start = index < 8 ? [0, 1, 65535, 128255, 128256, 131071, 262079, 262143][index] : Int(seed % 262144)
            let count = 262144 - start
            let chunk = [64, 128, 256, 511, 512, 1024, 4095, 4096][index % 8]
            for tail in [false, true] {
                let passes = PrefillSchedule.computePasses(tokens: count, from: start, maxChunk: chunk, tailAware: tail)
                var position = start
                for pass in passes {
                    position += pass.tokens
                    check("C06", "actual padded product bound", pass.tokens > 0 && pass.queryRows >= pass.tokens
                        && pass.keyExtent >= position && pass.queryRows * pass.keyExtent <= 4096 * 8016)
                }
                check("C06", "complete arbitrary-prefix schedule", !passes.isEmpty && position == 262144)
            }
        }
        for pair in [(Int.max, 1), (1, Int.max), (-1, 1), (1, -1), (262144, 1)] {
            check("C08", "overflow/out-of-model diagnostic", PrefillSchedule.computePasses(tokens: pair.0, from: pair.1, maxChunk: 4096).isEmpty)
        }
        check("C06", "unmeasured late cost stays unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        check("C06", "Hermes measured schedule keeps estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        for room in 0...18 {
            check("C10", "draft plus pending token stays in window", ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536) == min(16, max(0, room - 1)))
        }
    }

    static func requests() throws {
        for wait in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            check("C13", "invalid wait fails before allocation", failure(.invalidConfiguration) { _ = try ContextConfiguration(maxPrefillWaitMinutes: wait) })
        }
        for phase in ["queue", "tokenization", "image preparation", "prefill", "decode"] {
            var tick: UInt64 = 0
            var available: Double? = 10
            var pressure = false
            let config = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
            let deadline = RequestController(configuration: config, slackBytes: 100, clock: { tick }, availableGB: { available })
            tick = 61_000_000_000
            if phase == "decode" { deadline.sampledFirstToken(); try deadline.check(phase: phase) }
            else { check("C13", "deadline includes \(phase)", failure(.prefillDeadlineExceeded) { try deadline.check(phase: phase) }) }
            tick = 0
            let control = RequestController(configuration: config, slackBytes: 100, clock: { tick }, availableGB: { available }, pressure: { pressure })
            available = nil
            check("C14", "unreadable observation cannot authorize growth", failure(.insufficientMemory) { try control.check(nextAllocationBytes: 1, phase: phase) })
            available = 10
            check("C15", "failed controller stays failed", failure(.insufficientMemory) { try control.check() })
            let fresh = RequestController(configuration: config, slackBytes: 100, availableGB: { available }, pressure: { pressure })
            try fresh.check(nextAllocationBytes: 1, phase: phase)
            check("C15", "fresh request recovers", fresh.failure == nil)
            pressure = true
            check("C14", "injected pressure \(phase)", failure(.insufficientMemory) { try fresh.check(phase: phase) })
            check("C15", "pressure state cannot be retained", !fresh.mayRetainState)
        }
        var tick: UInt64 = 0
        let config = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
        let estimate = RequestController(configuration: config, slackBytes: 0, clock: { tick }, availableGB: { 10 })
        check("C13", "cold estimate refuses", failure(.prefillWaitExceeded) { try estimate.admit(missingTokens: 32768, from: 0, maxChunk: 256) })
        let reuse = RequestController(configuration: config, slackBytes: 0, clock: { tick }, availableGB: { 10 })
        try reuse.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        check("C13", "real prefix position prices missing work", reuse.failure == nil)
        tick = 61_000_000_000
        check("C13", "estimate never resets deadline", failure(.prefillDeadlineExceeded) { try reuse.check() })
        let pool = RequestMemoryReservations()
        var controllers: [RequestController] = []
        for _ in 0..<8 {
            let c = RequestController(configuration: config, slackBytes: 1_000_000, availableGB: { 0.010 })
            try c.attachReservations(pool)
            do { try c.reservePreparedImageBytes(4_000_000); controllers.append(c) } catch {}
        }
        check("C14", "queued images cannot spend same headroom", controllers.count == 2 && pool.reservedBytes == 8_000_000)
        controllers.removeAll()
        check("C15", "request lifetime releases reservations", pool.reservedBytes == 0)
        let zero = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 0), slackBytes: 1, clock: { tick }, availableGB: { 0 })
        check("C14", "zero wait retains memory guard", failure(.insufficientMemory) { try zero.check(nextAllocationBytes: 1) })
        let cancelled = RequestController(configuration: config, slackBytes: 0, connected: { false })
        check("C13", "disconnect before allocation", failure(.clientCancelled) { try cancelled.check() })
    }
}
