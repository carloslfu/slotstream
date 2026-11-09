import Foundation
import Slotstream

extension Diagnostics {
    /// The qualified decode lookahead default: it is exactly the configuration
    /// the held-out B1 cohort measured, the planner turns it on with the draft
    /// head at or above the head's floor, or in plain decode at or above its
    /// own floor, places the head's experts and charges its bytes, the
    /// environment can turn it off or select an experiment, and a deferred
    /// barrier falls back to draining every layer whenever the pool could not
    /// keep that many layers pinned.
    public static func decodeLookaheadDefaults() throws -> CheckReport {
        var c = CheckBuilder("decode-lookahead-defaults")

        // The environment of the B1 replication's candidate arm, verbatim.
        let tested = [
            "SLOTSTREAM_DECODE_BARRIER_LAYERS": "4", "SLOTSTREAM_DRAFT_DEPTH": "2",
            "SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB": "128", "SLOTSTREAM_EXPERT_PREFETCH_ADOPT": "slot",
            "SLOTSTREAM_EXPERT_PREFETCH_CAP": "32", "SLOTSTREAM_EXPERT_PREFETCH_DEVICE": "gpu",
            "SLOTSTREAM_EXPERT_PREFETCH_ISSUE_CAP": "32", "SLOTSTREAM_EXPERT_PREFETCH_LANES": "16",
            "SLOTSTREAM_EXPERT_PREFETCH_MEMO_LAYERS": "0", "SLOTSTREAM_EXPERT_PREFETCH_POLICY": "router",
            "SLOTSTREAM_EXPERT_PREFETCH_SLOT_CAP": "64", "SLOTSTREAM_EXPERT_PREFETCH_STRIDES": "2",
            "SLOTSTREAM_EXPERT_PREFETCH_THRESHOLD": "0.062", "SLOTSTREAM_EXPERT_PREFETCH_TOP": "24",
            "SLOTSTREAM_EXPERT_PREFETCH_WINDOW": "4", "SLOTSTREAM_OPT_EXPERT_PREFETCH": "1",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
        ]
        let testedOptimizations = try InferenceOptimizations.environment(tested)
        let parsed = try ExpertPrefetchConfiguration.environment(tested, optimizations: testedOptimizations)
        c.expect("qualified prefetch equals the tested environment", parsed == ExpertPrefetchConfiguration.qualifiedDecode)
        c.expect("tested environment enabled the router cache", testedOptimizations.cachedRouterWeights)
        c.equal("tested barrier period", Int(tested["SLOTSTREAM_DECODE_BARRIER_LAYERS"]!), DecodeLookahead.barrierLayers)
        c.equal("tested staging reserve", parsed.reserveBytes, DecodeLookahead.stagingReserveBytes)
        c.equal("router cache is 49 FP32 routers of 512 x 2560", DecodeLookahead.routerCacheBytes, 256_901_120)
        c.equal("whole charge is 373 MiB", DecodeLookahead.reserveBytes, 373 << 20)

        c.equal("no environment selects the automatic default", DecodeLookaheadPlanning.environment([:]), .automatic)
        c.equal("tuning variables alone keep the default",
            DecodeLookaheadPlanning.environment(["SLOTSTREAM_EXPERT_PREFETCH_TOP": "8"]), .automatic)
        c.equal("switch 0 turns it off", DecodeLookaheadPlanning.environment(["SLOTSTREAM_OPT_EXPERT_PREFETCH": "0"]), .off)
        c.equal("an explicit reserve is the capacity control",
            DecodeLookaheadPlanning.environment(["SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB": "128"]), .reserved(bytes: 128 << 20))
        c.equal("switch 1 selects the experiment and its reserve",
            DecodeLookaheadPlanning.environment(["SLOTSTREAM_OPT_EXPERT_PREFETCH": "1", "SLOTSTREAM_EXPERT_PREFETCH_POLICY": "router"]),
            .reserved(bytes: 128 << 20))

        func plan(_ memoryGB: Double?, mtp: Planner.MTPMode = .auto, ram: Double = 51.5,
                  lookahead: DecodeLookaheadPlanning = .automatic,
                  experts: Planner.MTPExpertPlacement = .automatic) throws -> MemoryPlan {
            try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: memoryGB,
                ramGB: ram, workingSetGB: ram * 0.75, availableGB: .infinity,
                mtp: mtp, mtpAvailable: true, simulated: true, qualification: false, decodeLookahead: lookahead,
                mtpExperts: experts)
        }
        // With the default prefix cache, 22 GB (a 32 GB Mac's automatic target)
        // is the smallest ordinary target whose cache reaches the resident
        // floor after the head's charge; the lookahead's own bytes then come
        // out of the pool.
        let at22 = try plan(22)
        let at22off = try plan(22, lookahead: .off)
        c.expect("22 GB target: head on with resident experts", at22.mtpEnabled && !at22.mtpStreamedExperts)
        c.expect("22 GB target: the cache after the head reaches the resident floor",
            at22off.expertsPerLayerCached >= Planner.mtpResidentFloorPerLayer, "\(at22off.expertsPerLayerCached)")
        c.expect("22 GB target: lookahead rides the head", at22.decodeLookahead)
        c.equal("22 GB target: whole charge reserved", at22.lookaheadReserveBytes, DecodeLookahead.reserveBytes)
        c.equal("ledger carries the charge", at22.memoryLedger.lookaheadReserveBytes, DecodeLookahead.reserveBytes)
        c.equal("ledger charges the resident head", at22.memoryLedger.mtpResidentBytes, PlannerCostModel.mtpResidentBytes)
        c.equal("json reports the decision", at22.json()["decode_lookahead"] as? Bool, true)
        c.equal("json reports resident experts", at22.json()["mtp_streamed_experts"] as? Bool, false)
        c.expect("off: same head, no lookahead, no charge",
            at22off.mtpEnabled && !at22off.decodeLookahead && at22off.lookaheadReserveBytes == 0)
        c.expect("the charge comes out of the expert pool", at22off.slots > at22.slots)
        // The checkpoint's shipped tap correction (37,540,708 bytes) joins the
        // charge in whole MiB: 373 + 36 = 409 MiB, all of it out of the pool.
        c.equal("no correction adds nothing", DecodeLookahead.reserveBytes(correctionBytes: 0), DecodeLookahead.reserveBytes)
        c.equal("the shipped file rounds up to 36 MiB", DecodeLookahead.roundedMiB(37_540_708), 36 << 20)
        c.equal("corrected charge is 409 MiB", DecodeLookahead.reserveBytes(correctionBytes: 37_540_708), 409 << 20)
        let corrected = try plan(22, lookahead: .automaticCorrected(bytes: 37_540_708))
        c.expect("22 GB target, corrected: head and lookahead on", corrected.mtpEnabled && corrected.decodeLookahead)
        c.equal("22 GB target, corrected: whole charge reserved", corrected.lookaheadReserveBytes, 409 << 20)
        c.equal("corrected ledger carries the charge", corrected.memoryLedger.lookaheadReserveBytes, 409 << 20)
        c.expect("the correction's bytes come out of the pool", corrected.slots <= at22.slots)

        // Below the resident floor the head streams its experts: 0.39 GB
        // instead of 1.6, and the cache keeps the difference.
        c.equal("streamed charge: the head without its experts, 74 expert records",
            PlannerCostModel.mtpStreamedBytes, 1_600_000_000 - 512 * 2_764_800 + 74 * 2_764_800)
        let at20 = try plan(20)
        c.expect("20 GB target: streamed head and lookahead", at20.mtpEnabled && at20.mtpStreamedExperts && at20.decodeLookahead)
        let at16 = try plan(16)
        c.expect("16 GB target: streamed head and lookahead",
            at16.mtpEnabled && at16.mtpStreamedExperts && at16.decodeLookahead)
        c.equal("ledger charges the streamed head", at16.memoryLedger.mtpResidentBytes, PlannerCostModel.mtpStreamedBytes)
        c.equal("json reports streamed experts", at16.json()["mtp_streamed_experts"] as? Bool, true)
        let at12 = try plan(12)
        let at12off = try plan(12, lookahead: .off)
        c.expect("12 GB target: streamed head and lookahead", at12.mtpEnabled && at12.mtpStreamedExperts && at12.decodeLookahead)
        c.expect("12 GB target: the cache after the streamed head reaches the head's floor",
            at12off.expertsPerLayerCached >= Planner.mtpAutoFloorPerLayer, "\(at12off.expertsPerLayerCached)")
        let at11 = try plan(11)
        c.expect("11 GB target: below the head's floor, plain decode with the lookahead",
            !at11.mtpEnabled && at11.decodeLookahead && at11.lookaheadReserveBytes > 0)
        let residentAt16 = try plan(16, experts: .resident)
        c.expect("forced resident experts keep the resident floor",
            !residentAt16.mtpEnabled && residentAt16.decodeLookahead)
        let streamedAt22 = try plan(22, experts: .streamed)
        c.expect("forced streamed experts free the head's expert bytes for the cache",
            streamedAt22.mtpEnabled && streamedAt22.mtpStreamedExperts && streamedAt22.slots > at22.slots)
        c.equal("unset environment places experts automatically", try Planner.MTPExpertPlacement.environment([:]), .automatic)
        c.equal("environment selects streamed experts",
            try Planner.MTPExpertPlacement.environment(["SLOTSTREAM_MTP_EXPERTS": "streamed"]), .streamed)
        var refused = false
        do { _ = try Planner.MTPExpertPlacement.environment(["SLOTSTREAM_MTP_EXPERTS": "partial"]) } catch { refused = true }
        c.expect("an unknown placement is refused", refused)

        let forced = try plan(10, mtp: .on)
        c.expect("a head forced below its floor streams and runs without the lookahead",
            forced.mtpEnabled && forced.mtpStreamedExperts && !forced.decodeLookahead)
        let big = try plan(nil, ram: 137.4)
        c.expect("auto on a large machine: 34.6 GB with the resident head and lookahead",
            abs((big.targetGB ?? 0) - 34.6) < 0.05 && big.mtpEnabled && !big.mtpStreamedExperts && big.decodeLookahead)
        let retained = try plan(12, mtp: .on, lookahead: .retained(enabled: true, bytes: DecodeLookahead.reserveBytes))
        c.expect("a retained decision survives re-planning",
            retained.decodeLookahead && retained.lookaheadReserveBytes == DecodeLookahead.reserveBytes)
        let retainedResident = try plan(16, mtp: .on, experts: .resident)
        c.expect("a retained resident head stays resident on a small cache",
            retainedResident.mtpEnabled && !retainedResident.mtpStreamedExperts
                && retainedResident.memoryLedger.mtpResidentBytes == PlannerCostModel.mtpResidentBytes)
        // An experiment's reserve is charged before the head's floor is tested,
        // so the bench forces the head on; so does this check.
        let experiment = try plan(22, mtp: .on, lookahead: .reserved(bytes: 128 << 20))
        c.expect("an experiment keeps its reserve without the default",
            experiment.mtpEnabled && !experiment.decodeLookahead && experiment.lookaheadReserveBytes == 128 << 20)

        // Without the head the lookahead runs in plain decode from its own
        // floor, and its bytes still come out of the pool.
        let plain = try plan(22, mtp: .off)
        let plainOff = try plan(22, mtp: .off, lookahead: .off)
        c.expect("no head: the lookahead runs in plain decode",
            !plain.mtpEnabled && plain.decodeLookahead && plain.lookaheadReserveBytes == DecodeLookahead.reserveBytes)
        c.expect("no head: the charge comes out of the expert pool", plainOff.slots > plain.slots)
        let plain10 = try plan(10, mtp: .off, lookahead: .off)
        c.expect("10 GB target: the cache before the charge reaches the plain floor",
            plain10.expertsPerLayerCached >= Planner.plainLookaheadFloorPerLayer, "\(plain10.expertsPerLayerCached)")
        let plain10On = try plan(10, mtp: .off)
        let plain9 = try plan(9, mtp: .off)
        c.expect("10 GB target: plain decode with the lookahead", plain10On.decodeLookahead)
        c.expect("9 GB target: below the plain floor, no lookahead", !plain9.decodeLookahead)

        func period(_ rows: Int, slots: Int, requested: Int = 4) -> Int {
            DecodeLookahead.barrierPeriod(requested: requested, rows: rows, topK: 10, experts: 512,
                slots: slots, reservedSlots: 64)
        }
        c.equal("period 1 stays 1", period(3, slots: 3648, requested: 1), 1)
        c.equal("decode pass at the floor pool keeps the period", period(3, slots: 3648), 4)
        c.equal("255-row pool pass fits a 76-per-layer pool", period(255, slots: 3648), 4)
        c.equal("255-row pool pass on a shrunken pool drains every layer", period(255, slots: 2800), 1)
        c.equal("decode pass on the minimum pool keeps the period", period(3, slots: 624), 4)
        c.equal("a long draft chain on the minimum pool drains every layer", period(17, slots: 624), 1)
        return c.report()
    }
}

extension Diagnostics {
    /// The timeline's analysis tools read these JSON field names, so they are a
    /// file format and every span has to produce them.
    public static func decodeTimelineFormat() throws -> CheckReport {
        var c = CheckBuilder("decode-timeline-format")
        for span in DecodeTimeline.Span.allCases {
            let event = DecodeTimeline.Event(span: span, layer: 47, count: 3, startNanos: 10, endNanos: 25)
            c.expect("\(span.rawValue) ends its line", event.jsonLine.hasSuffix("}\n"))
            let object = try JSONSerialization.jsonObject(with: Data(event.jsonLine.utf8)) as? [String: Any]
            c.equal("\(span.rawValue) span", object?["span"] as? String, span.rawValue)
            c.equal("\(span.rawValue) layer", object?["layer"] as? Int, 47)
            c.equal("\(span.rawValue) count", object?["count"] as? Int, 3)
            c.equal("\(span.rawValue) start", object?["start_ns"] as? Int, 10)
            c.equal("\(span.rawValue) end", object?["end_ns"] as? Int, 25)
        }
        return c.report()
    }
}
