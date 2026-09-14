import Foundation
import Slotstream

extension Diagnostics {
    /// The qualified decode lookahead default: it is exactly the configuration
    /// the held-out B1 cohort measured, the planner turns it on only with the
    /// draft head at or above the activation floor and charges its bytes, the
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
                  lookahead: DecodeLookaheadPlanning = .automatic) throws -> MemoryPlan {
            try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: memoryGB,
                ramGB: ram, workingSetGB: ram * 0.75, availableGB: .infinity,
                mtp: mtp, mtpAvailable: true, simulated: true, qualification: false, decodeLookahead: lookahead)
        }
        // With the default prefix cache, 22 GB (a 32 GB Mac's automatic target)
        // is the smallest ordinary target whose cache reaches the floor after
        // the head's charge; the lookahead's own bytes then come out of the pool.
        let at22 = try plan(22)
        let at22off = try plan(22, lookahead: .off)
        c.expect("22 GB target: head on", at22.mtpEnabled)
        c.expect("22 GB target: the cache after the head reaches the floor",
            at22off.expertsPerLayerCached >= Planner.mtpAutoFloorPerLayer, "\(at22off.expertsPerLayerCached)")
        c.expect("22 GB target: lookahead rides the head", at22.decodeLookahead)
        c.equal("22 GB target: whole charge reserved", at22.lookaheadReserveBytes, DecodeLookahead.reserveBytes)
        c.equal("ledger carries the charge", at22.memoryLedger.lookaheadReserveBytes, DecodeLookahead.reserveBytes)
        c.equal("json reports the decision", at22.json()["decode_lookahead"] as? Bool, true)
        c.expect("off: same head, no lookahead, no charge",
            at22off.mtpEnabled && !at22off.decodeLookahead && at22off.lookaheadReserveBytes == 0)
        c.expect("the charge comes out of the expert pool", at22off.slots > at22.slots)
        let at20 = try plan(20)
        c.expect("20 GB target: below the floor after the head", !at20.mtpEnabled && !at20.decodeLookahead)
        let at16 = try plan(16)
        c.expect("16 GB target: below the floor, neither head nor lookahead",
            !at16.mtpEnabled && !at16.decodeLookahead && at16.lookaheadReserveBytes == 0)
        let forced = try plan(12, mtp: .on)
        c.expect("a head forced below the floor runs without the lookahead", forced.mtpEnabled && !forced.decodeLookahead)
        let big = try plan(nil, ram: 137.4)
        c.expect("auto on a large machine: 34.6 GB with head and lookahead",
            abs((big.targetGB ?? 0) - 34.6) < 0.05 && big.mtpEnabled && big.decodeLookahead)
        let retained = try plan(12, mtp: .on, lookahead: .retained(enabled: true, bytes: DecodeLookahead.reserveBytes))
        c.expect("a retained decision survives re-planning",
            retained.decodeLookahead && retained.lookaheadReserveBytes == DecodeLookahead.reserveBytes)
        // An experiment's reserve is charged before the head's floor is tested,
        // so the bench forces the head on; so does this check.
        let experiment = try plan(22, mtp: .on, lookahead: .reserved(bytes: 128 << 20))
        c.expect("an experiment keeps its reserve without the default",
            experiment.mtpEnabled && !experiment.decodeLookahead && experiment.lookaheadReserveBytes == 128 << 20)
        let plain = try plan(22, mtp: .off)
        c.expect("no head, no lookahead", !plain.decodeLookahead && plain.lookaheadReserveBytes == 0)

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
