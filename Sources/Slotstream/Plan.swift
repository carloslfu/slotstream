// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Foundation

/// Model geometry the cache math speaks in. The planner needs these before the
/// checkpoint is opened, so they are constants — `check(against:recordBytes:)`
/// rejects a checkpoint that does not match once the engine has it.
public enum Geometry {
    public static let layers = 48
    public static let expertsPerLayer = 512
    public static let recordBytes = 2_764_800.0
    public static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    public static let floorSlots = 640

    public static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    public static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
    /// Convert a raw GB budget without ever converting an attacker-sized
    /// Double directly to Int (which traps in Swift when it is out of range).
    public static func slotsForPoolGB(_ poolGB: Double) -> Int {
        guard poolGB.isFinite else { return poolGB > 0 ? totalRecords : floorSlots }
        if poolGB >= gb(totalRecords) { return totalRecords }
        if poolGB <= gb(floorSlots) { return floorSlots }
        return Int(poolGB * 1e9 / recordBytes)
    }
    /// GB of pool per expert-per-layer (N experts/layer costs N × this).
    public static var gbPerExpertPerLayer: Double { Double(layers) * recordBytes / 1e9 }

    /// The planner sizes memory from the constants above while the engine
    /// allocates from config.json. If they ever disagree, every memory number
    /// the user is shown is wrong, so fail loudly instead of drifting.
    public static func check(against cfg: ModelConfig, recordBytes actual: Int) throws {
        guard cfg.numLayers == layers, cfg.numExperts == expertsPerLayer,
            Double(actual) == recordBytes
        else {
            throw ModelError(
                "model geometry does not match the supported checkpoint: config has "
                    + "\(cfg.numLayers) layers x \(cfg.numExperts) experts x \(actual) "
                    + "B/record, expected \(layers) x \(expertsPerLayer) x "
                    + "\(Int(recordBytes)) B — check --model")
        }
    }
}

public struct PlanError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

/// Explicit process controls whose unused reservations can become expert
/// capacity. Kept with the plan so vision loading and the governor cannot
/// silently restore an allocation after its budget has been spent.
public struct RuntimeAllocationPolicy: Equatable, Sendable {
    public let prefillChunkOverride: Int?
    public let prefixCacheEnabled: Bool

    public init(prefillChunkOverride: Int? = nil, prefixCacheEnabled: Bool = true) throws {
        if let chunk = prefillChunkOverride, !(256 ... 4096).contains(chunk) {
            throw PlanError("runtime allocation planning requires a prefill chunk between 256 and 4096")
        }
        self.prefillChunkOverride = prefillChunkOverride
        self.prefixCacheEnabled = prefixCacheEnabled
    }
}

/// The resolved memory decision: which knob decided it, what it costs, and
/// what to expect. Everything user-facing about memory comes from here.
public struct MemoryPlan {
    public enum Source: String {
        case expertsPerLayer = "--experts-per-layer"
        case poolGB = "--pool-gb"
        case memoryGB = "--memory-gb"
        case auto = "auto"
    }

    public let source: Source
    public let slots: Int
    /// Total-process target in GB when the plan came from --memory-gb or auto.
    public let targetGB: Double?
    /// The user's saved adaptive ceiling, independent of today's smaller target.
    public let memoryLimitGB: Double?
    public let ramGB: Double
    public let workingSetGB: Double
    /// The RAM share auto was allowed (--max-ram-percent, default 70). Carried
    /// so the elastic governor grows back to the user's policy, not the default.
    public let ramPercent: Double
    /// Memory reclaimable at planning time (nil = could not be read).
    public let availableGB: Double?
    /// True when auto sized itself down because of what other apps hold now.
    public let clamped: Bool
    /// Tokens per prefill pass, chosen with the pool from the same budget.
    public let prefillChunk: Int
    /// Conversation state the prefix cache may retain, in tokens. Sized and
    /// charged from the same budget as the pool.
    public let prefixCacheTokens: Int
    /// Whether the MTP draft head loads (self-speculative decode). Charged as
    /// a fixed resident block; the pool is sized from what remains.
    public let mtpEnabled: Bool
    /// Whether an image request may load the tower in this process.
    public let visionEnabled: Bool
    /// A loaded tower is charged inside the total-process target. Merely
    /// accepting images does not take expert capacity from text requests.
    public let visionResidentReserved: Bool
    /// True when this plan was made for a simulated device (`doctor --sim-*`).
    /// Such a plan may be printed and compared, never loaded: a simulated
    /// availability figure still produces a real allocation.
    public var simulated = false
    /// Longest prompt plus reply a request may hold (`--max-context`). State
    /// for the first `ContextPolicy.tokensInFixedFootprint` tokens is inside
    /// the fixed footprint; anything above is charged separately.
    public let maxContextTokens: Int
    public let notes: [String]
    public let runtimeAllocationPolicy: RuntimeAllocationPolicy?
    public let maxPrefillWaitMinutes: Double
    public let contextQualification: Bool
    /// Decode lookahead reservation (the qualified default's staging reserve
    /// and router cache, or an experimental reserve), charged before the pool
    /// was sized. Zero when neither is on.
    public let lookaheadReserveBytes: Int
    /// Whether the engine runs the qualified decode lookahead. It rides the
    /// draft head where the cache still reaches its floor (`DecodeLookahead`).
    public let decodeLookahead: Bool

    /// Preserve the original initializer, including its function-value type.
    public init(
        source: Source, slots: Int, targetGB: Double?,
        ramGB: Double, workingSetGB: Double, ramPercent: Double,
        availableGB: Double?, clamped: Bool,
        prefillChunk: Int, prefixCacheTokens: Int, mtpEnabled: Bool = false,
        visionEnabled: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        notes: [String], simulated: Bool = false,
        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false,
        lookaheadReserveBytes: Int = 0, decodeLookahead: Bool = false
    ) {
        self.init(
            source: source, slots: slots, targetGB: targetGB,
            ramGB: ramGB, workingSetGB: workingSetGB, ramPercent: ramPercent,
            availableGB: availableGB, clamped: clamped, prefillChunk: prefillChunk,
            prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled, visionEnabled: visionEnabled,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens, notes: notes,
            simulated: simulated, runtimeAllocationPolicy: runtimeAllocationPolicy, maxPrefillWaitMinutes: maxPrefillWaitMinutes,
            contextQualification: contextQualification, lookaheadReserveBytes: lookaheadReserveBytes, decodeLookahead: decodeLookahead,
            memoryLimitGB: nil)
    }

    public init(
        source: Source, slots: Int, targetGB: Double?,
        ramGB: Double, workingSetGB: Double, ramPercent: Double,
        availableGB: Double?, clamped: Bool,
        prefillChunk: Int, prefixCacheTokens: Int, mtpEnabled: Bool = false,
        visionEnabled: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        notes: [String], simulated: Bool = false,
        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false,
        lookaheadReserveBytes: Int = 0, decodeLookahead: Bool = false,
        memoryLimitGB: Double?
    ) {
        self.lookaheadReserveBytes = max(0, lookaheadReserveBytes)
        self.decodeLookahead = decodeLookahead
        self.source = source
        self.slots = slots
        self.targetGB = targetGB
        self.memoryLimitGB = memoryLimitGB
        self.ramGB = ramGB
        self.workingSetGB = workingSetGB
        self.ramPercent = ramPercent
        self.availableGB = availableGB
        self.clamped = clamped
        self.prefillChunk = prefillChunk
        self.prefixCacheTokens = prefixCacheTokens
        self.mtpEnabled = mtpEnabled
        self.visionEnabled = visionEnabled
        self.visionResidentReserved = visionResidentReserved
        self.maxContextTokens = maxContextTokens
        self.notes = notes
        self.simulated = simulated
        self.runtimeAllocationPolicy = runtimeAllocationPolicy
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.contextQualification = contextQualification
    }

    public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
    public var poolGB: Double { Geometry.gb(slots) }
    public var memoryLedger: ContextMemoryLedger {
        ContextMemoryLedger(slots: slots, context: maxContextTokens, chunk: prefillChunk,
            retentionTokens: prefixCacheTokens, mtp: mtpEnabled, visionResident: visionResidentReserved,
            lookaheadReserveBytes: lookaheadReserveBytes)
    }
    public var expectedPeakGB: Double { Double(memoryLedger.expectedPeakBytes) / 1e9 }
    /// Remaining planned budget, not currently available physical memory. The
    /// minimum-cache policy may consume part of the nominal planning margin;
    /// full residency can leave more than that margin unassigned.
    public var plannedHeadroomGB: Double? { targetGB.map { max(0, $0 - expectedPeakGB) } }

    public func withRequestPolicy(_ configuration: ContextConfiguration) throws -> MemoryPlan {
        guard configuration.maxContextTokens == maxContextTokens else {
            throw PlanError("request policy must use the context window priced by the memory plan")
        }
        return MemoryPlan(source: source, slots: slots, targetGB: targetGB, ramGB: ramGB,
            workingSetGB: workingSetGB, ramPercent: ramPercent, availableGB: availableGB, clamped: clamped,
            prefillChunk: prefillChunk, prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
            maxContextTokens: maxContextTokens, notes: notes, simulated: simulated,
            runtimeAllocationPolicy: runtimeAllocationPolicy,
            maxPrefillWaitMinutes: configuration.maxPrefillWaitMinutes,
            contextQualification: configuration.qualification,
            lookaheadReserveBytes: lookaheadReserveBytes, decodeLookahead: decodeLookahead,
            memoryLimitGB: memoryLimitGB)
    }
    /// Seconds a prompt filling the whole context takes before its first
    /// token, priced through the prefill schedule this plan runs.
    public var estPrefillSecondsAtMaxContext: Double {
        PrefillSchedule.estSeconds(tokens: maxContextTokens, maxChunk: prefillChunk)
    }
    public var estWarmTokS: Double { Planner.estWarmTokS(expertsPerLayer: expertsPerLayerCached) }
    public var fullyResident: Bool { slots >= Geometry.totalRecords }

    /// The startup announce: device, decision, expectation, override hint.
    public func banner() -> String {
        var l: [String] = []
        l.append("slotstream memory plan (\(source.rawValue))")
        if let a = availableGB, a.isFinite {
            l.append(String(
                format: "  device: %.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                ramGB, a, workingSetGB))
        } else {
            l.append(String(
                format: "  device: %.0f GB RAM, %.1f GB Metal working set", ramGB, workingSetGB))
        }
        if let t = targetGB {
            let hint = source == .auto
                ? "   (adaptive limit: --memory-limit-gb N; fixed cache: --memory-gb N)"
                : ""
            l.append(String(format: "  target: %.1f GB total process budget, not a RAM usage goal%@", t, hint))
        }
        if let limit = memoryLimitGB {
            l.append(String(format: "  limit:  %.1f GB; cache adapts to available memory", limit))
        }
        if fullyResident {
            l.append(String(
                format: "  cache:  all %d experts per layer resident (%.1f GB pool)",
                Geometry.expertsPerLayer, poolGB))
        } else {
            l.append(String(
                format: "  cache:  ~%.0f of %d experts per layer  (%d global slots = %.1f GB pool)",
                expertsPerLayerCached, Geometry.expertsPerLayer, slots, poolGB))
        }
        l.append(String(
            format: "  plan:   ~%.1f GB full-workload envelope, ~%.0f tok/s warm decode (est. from M5 Pro anchors)",
            expectedPeakGB, estWarmTokS))
        var memory = String(format: "  memory: %.1f GB expert cache at load; %.1f GB allowed for runtime, context and workspace",
            poolGB, Double(memoryLedger.expectedPeakBytes - memoryLedger.poolBytes) / 1e9)
        if let headroom = plannedHeadroomGB { memory += String(format: "; %.1f GB budget headroom", headroom) }
        l.append(memory + ". Short requests can use less.")
        if expertsPerLayerCached > Planner.decodePlateauPerLayer {
            l.append("  speed:  this cache exceeds the measured decode range; the estimate is capped, but extra cache may still improve speed")
        }
        // The decode curve is a function of experts per layer alone. It carries
        // no term for read bandwidth, and it was anchored on a 17.3 GB/s SSD
        // (MEASUREMENTS, M0.5). The first machine measured that was not the dev
        // Mac reads at 1.5 GB/s, where the misses of a single token cost more
        // time than the whole estimated step (MEASUREMENTS, C1). Until the
        // planner can measure this disk and price those reads, the estimate
        // says out loud what it assumes rather than quietly assuming it.
        l.append(
            "  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). "
            + "A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 "
            + "estimate, so on base storage expect well under the number above — see docs/HARDWARE.md")
        l.append(String(
            format: "  prefill: %d tokens per pass (~%.0f tok/s here; costs ~%.1f GB of the target)",
            prefillChunk, Planner.estPrefillTokS(chunk: prefillChunk),
            Planner.prefillCostGB(prefillChunk)))
        if mtpEnabled {
            l.append(String(
                format: "  mtp:    draft head on — speculative decode (%.1f GB resident, charged above)",
                Planner.mtpResidentGB))
        }
        if visionEnabled {
            l.append(visionResidentReserved
                ? String(format: "  vision: tower memory reserved (%.1f GB resident, charged above)", Planner.visionResidentGB)
                : String(format: "  vision: images accepted — first image reserves +%.1f GB inside the target; refused if it cannot fit", Planner.visionResidentGB))
        }
        let extra = Planner.extraContextMemoryGB(maxContextTokens: maxContextTokens)
        let fullWait = estPrefillSecondsAtMaxContext.isFinite
            ? "takes ~" + PrefillSchedule.describe(seconds: estPrefillSecondsAtMaxContext) + " before its first token here"
            : "has no calibrated wait yet (passes under 256 tokens are not yet measured)"
        l.append(String(
            format: "  context: up to %d tokens per request (prompt + reply%@); a full-length prompt "
                + "%@, follow-up turns read only what is new",
            maxContextTokens,
            extra > 0 ? String(format: ", +%.1f GB state and transient reserve charged above", extra) : "",
            fullWait))
        if prefixCacheTokens > 0 {
            l.append(String(
                format: "  reuse:  up to %d tokens across %d conversations (~%.1f GB), so a "
                    + "follow-up turn re-prefills only what is new",
                prefixCacheTokens, PrefixCache.maxEntries,
                Planner.prefixCacheCostGB(tokens: prefixCacheTokens)))
        }
        if decodeLookahead {
            l.append(String(format: "  lookahead: on, expert prefetch with the draft head, router cache and a GPU barrier every %d layers (%.0f MiB, charged above)",
                DecodeLookahead.barrierLayers, Double(lookaheadReserveBytes) / Double(1 << 20)))
        } else if lookaheadReserveBytes > 0 {
            l.append(String(format: "  lookahead: %.0f MiB reserved for experimental expert prefetch (charged above)",
                Double(lookaheadReserveBytes) / Double(1 << 20)))
        }
        for n in notes { l.append("  note:   \(n)") }
        return l.joined(separator: "\n")
    }

    /// Machine-readable form for /api/show.
    public func json() -> [String: Any] {
        func tenth(_ value: Double) -> Double {
            let scaled = value * 10
            return scaled.isFinite ? scaled.rounded() / 10 : value
        }
        var d: [String: Any] = [
            "source": source.rawValue,
            "experts_per_layer_cached": Int(expertsPerLayerCached.rounded()),
            "pool_slots": slots,
            "pool_gb": tenth(poolGB),
            "expected_peak_gb": tenth(expectedPeakGB),
            // Preserve the legacy envelope field; make its meaning explicit
            // without passing it off as sampled physical memory.
            "memory_target_semantics": "process_budget_not_allocation_goal",
            "expected_peak_semantics": "planned_full_workload_envelope_not_measured_usage",
            "non_cache_allowance_bytes": memoryLedger.expectedPeakBytes - memoryLedger.poolBytes,
            "decode_estimate_cache_in_measured_range": expertsPerLayerCached <= Planner.decodePlateauPerLayer,
            "device_ram_gb": tenth(ramGB),
            "device_working_set_gb": tenth(workingSetGB),
            "max_ram_percent": ramPercent,
            "availability_clamped": clamped,
            "fully_resident": fullyResident,
            "prefill_chunk": prefillChunk,
            "prefix_cache_max_tokens": prefixCacheTokens,
            "mtp": mtpEnabled,
            "vision": visionEnabled,
            "vision_resident_reserved": visionResidentReserved,
            "vision_charged_gb": visionResidentReserved ? Planner.visionResidentGB : 0,
            "vision_resident_gb": visionEnabled ? Planner.visionResidentGB : 0,
            "max_context_tokens": maxContextTokens,
            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext.isFinite
                ? estPrefillSecondsAtMaxContext as Any : NSNull(),
            "model_context_limit": ContextPolicy.modelLimit,
            "implementation_context_limit": ContextPolicy.implementationLimit,
            "mtp_context_limit": ContextPolicy.mtpLimit,
            "vision_context_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": maxPrefillWaitMinutes,
            "prefill_wait_scope": "accepted_request_to_first_model_token",
            "context_qualification": contextQualification,
            "memory_ledger": memoryLedger.json,
            "lookahead_reserve_bytes": lookaheadReserveBytes,
            "decode_lookahead": decodeLookahead,
            // Unrounded on purpose: the banner rounds these to whole tok/s,
            // and a caller comparing two plans across a rounding boundary sees
            // a step that is not there. Anything asserting on the plan should
            // read these, not the printed line.
            "est_warm_tok_s": estWarmTokS,
            "est_prefill_tok_s": Planner.estPrefillTokS(chunk: prefillChunk),
        ]
        if let a = availableGB, a.isFinite { d["device_available_gb"] = tenth(a) }
        // Policy values must round-trip exactly. Rounding 9.99 to 10 made a
        // bounded adaptive plan appear to exceed its saved ceiling.
        if let t = targetGB { d["target_gb"] = t }
        if let limit = memoryLimitGB { d["memory_limit_gb"] = limit }
        if let headroom = plannedHeadroomGB { d["planned_headroom_gb"] = tenth(headroom) }
        if let policy = runtimeAllocationPolicy {
            d["runtime_prefix_cache_enabled"] = policy.prefixCacheEnabled
            if let chunk = policy.prefillChunkOverride { d["runtime_prefill_override"] = chunk }
        }
        if !notes.isEmpty { d["notes"] = notes }
        return d
    }
}

extension MemoryPlan {
    /// The same plan with notes appended.
    func addingNotes(_ extra: [String]) -> MemoryPlan {
        guard !extra.isEmpty else { return self }
        return MemoryPlan(source: source, slots: slots, targetGB: targetGB,
            ramGB: ramGB, workingSetGB: workingSetGB, ramPercent: ramPercent,
            availableGB: availableGB, clamped: clamped, prefillChunk: prefillChunk,
            prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
            maxContextTokens: maxContextTokens, notes: notes + extra,
            simulated: simulated, runtimeAllocationPolicy: runtimeAllocationPolicy,
            maxPrefillWaitMinutes: maxPrefillWaitMinutes, contextQualification: contextQualification,
            lookaheadReserveBytes: lookaheadReserveBytes, decodeLookahead: decodeLookahead,
            memoryLimitGB: memoryLimitGB)
    }
}

public enum Planner {
    /// Reassign only reservations already present in a resolved plan. This
    /// preserves its existing margin, active context and resident charges;
    /// it does not infer extra headroom from a short current request.
    public static func applyingRuntimePolicy(
        _ p: MemoryPlan, policy: RuntimeAllocationPolicy
    ) throws -> MemoryPlan {
        if let previous = p.runtimeAllocationPolicy {
            guard previous == policy else { throw PlanError("runtime allocation policy requires a fresh base plan") }
            return p // Never credit the same reservation twice.
        }
        let chunk = policy.prefillChunkOverride ?? p.prefillChunk
        let prefixTokens = policy.prefixCacheEnabled ? p.prefixCacheTokens : 0
        let freed = prefillCostGB(p.prefillChunk) - prefillCostGB(chunk)
            + prefixCacheCostGB(tokens: p.prefixCacheTokens) - prefixCacheCostGB(tokens: prefixTokens)
        var slots = p.slots
        if p.targetGB != nil, freed != 0 {
            let remaining = p.poolGB + freed
            guard remaining.isFinite, remaining + 1e-9 >= Geometry.gb(Geometry.floorSlots) else {
                throw PlanError("runtime prefill reservation cannot fit above the minimum expert pool; lower the chunk or raise the memory target")
            }
            slots = Geometry.slotsForPoolGB(remaining)
        }
        return MemoryPlan(source: p.source, slots: slots, targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: chunk,
            prefixCacheTokens: prefixTokens, mtpEnabled: p.mtpEnabled,
            visionEnabled: p.visionEnabled, visionResidentReserved: p.visionResidentReserved,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + (chunk != p.prefillChunk || prefixTokens != p.prefixCacheTokens
                ? ["prefill and prefix retention reservations match the explicit runtime controls"] : []),
            simulated: p.simulated, runtimeAllocationPolicy: policy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification,
            lookaheadReserveBytes: p.lookaheadReserveBytes, decodeLookahead: p.decodeLookahead,
            memoryLimitGB: p.memoryLimitGB)
    }

    /// Non-pool footprint: resident weights, the 256 MB n-gram payload plus
    /// collection overhead, Swift and MLX runtime allocations, one fixed GDN
    /// recurrent state, and a full 32k active context. Expert staging is now
    /// transferred directly into MLX in batches of at most 32 records,
    /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
    /// transient.
    public static let fixedFootprintGB = Double(PlannerCostModel.fixedBytes) / 1e9
    /// Extra slack when deriving a pool from a total-memory target, so the
    /// promise ("stays under G") survives transients.
    public static let planningMarginGB = Double(PlannerCostModel.planningMarginBytes) / 1e9

    /// What a prefill pass costs in transient activations.
    ///
    /// **Recalibrated 2026-08-30, and the old figure was costing real speed.**
    /// The previous model charged `(chunk - 256) x 1.8 MB` because it folded
    /// two different things into one term: the pass activations, which scale
    /// with the *chunk*, and the KV plus indexer state, which scales with the
    /// *context*. Conflating them made a big pass look twice as expensive as it
    /// is, so the planner kept choosing 1024 where 2048 is strictly better.
    ///
    /// Measured directly (`--memory-gb 16`, pool pinned at 77/layer, so peak
    /// minus the 14.1 GB base is the pass): chunk 1024 -> 1.30 GB, 2048 -> 2.19,
    /// 4096 -> 4.30. That is ~1.0 to 1.3 MB per chunk token, linear from zero
    /// rather than from 256. Context state is a separate ~27.6 KB per token and
    /// is genuinely small: going from a 4,016 to an 8,016-token prompt moved
    /// peak by 0.1 GB. 1.30 MB/token is charged here so the estimate errs high
    /// at every measured point.
    public static func prefillCostGB(_ chunk: Int) -> Double {
        Double(chunk) * (Double(PlannerCostModel.prefillBytesPerToken) / 1e9)
    }

    /// KV plus indexer state for a context of `tokens`, which the pool math
    /// does not model. Separate from the pass cost above because it scales with
    /// the conversation, not with the batch: a 32k prompt carries ~0.9 GB.
    public static func contextStateGB(_ tokens: Int) -> Double {
        Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
    }

    /// Context state above what the fixed footprint already covers. Zero at
    /// the default window; an explicitly larger --max-context reduces the
    /// expert pool before allocation instead of consuming the safety margin.
    public static func extraContextStateGB(maxContextTokens: Int) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens)) / 1e9
    }

    /// The larger window also needs transient headroom. A completed 65,520
    /// token check at chunk 512 peaked at 10.056 GB against the state-only
    /// plan's 9.260 GB (20 ms physical-footprint sampling, not just RSS).
    /// Reserve a full additional window's growth above the fixed footprint
    /// throughout the supported long-context range. This conservative envelope
    /// covers that measured gap without claiming its exact buffer attribution
    /// or interpolating unmeasured peaks. Ordinary windows retain their budget.
    /// See the Hermes measurement and its preserved failed run.
    public static func extraContextMemoryGB(maxContextTokens: Int, mtp: Bool = false) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens, mtp: mtp)
            + ContextMemoryLedger.transientReserveBytes(context: maxContextTokens, mtp: mtp)) / 1e9
    }

    /// Sizes the prefill pass from the same budget as the pool.
    ///
    /// Prefill is expert-stream-bound: a pass touches nearly every expert of
    /// every layer, so the whole expert set is re-read roughly once per pass
    /// and halving the number of passes halves the bytes moved. Measured on a
    /// 7,960-token prompt: 40 tok/s at 256, 50 at 512, 67 at 1024, 92 to 105 at
    /// 2048 — with byte-identical output at every size.
    ///
    /// The cap is a quarter of the pool budget, raised from a fifth once the
    /// cost above was measured honestly. The deciding experiment held total
    /// memory fixed and traded pool for pass size on a 4,021-token prompt:
    ///
    /// | chunk | pool | prefill | decode | peak |
    /// |---|---|---|---|---|
    /// | 1024 | 77/layer | 65.2 s | 7.3 s | 15.4 GB |
    /// | 2048 | 67/layer | **47.9 s** | **6.6 s** | **14.9 GB** |
    /// | 4096 | 47/layer | 42.9 s | 9.0 s | 14.4 GB |
    ///
    /// 2048 dominates 1024 on every axis, so a fifth was simply too tight; 4096
    /// buys a little more prefill and gives back more decode. The current cost
    /// model therefore favors the larger pass once its decode estimate flattens.
    /// This is a measured tradeoff on the tested setup plus a bounded estimate,
    /// not evidence that additional cache has no value on every machine.
    /// A request this plan is tuned for: prompt tokens, then generated tokens.
    /// Only ever used to choose the prefill pass size — never correctness.
    static let tuningPromptTokens = PlannerCostModel.tuningPromptTokens
    static let tuningReplyTokens = PlannerCostModel.tuningReplyTokens

    /// The prefill pass to run at a given pool budget: the one that finishes a
    /// representative request soonest.
    ///
    /// Pass size is a real trade, not a free choice. A bigger pass prefills
    /// faster but costs pool, and every GB it takes is expert cache the decode
    /// loop no longer has. The old rule — "biggest pass fitting in a quarter of
    /// the budget" — ignored the decode side, so crossing the quarter line
    /// doubled the pass from 2.7 to 5.3 GB and made `--memory-gb 26` plan a
    /// *smaller* cache than 25 (116 against 128 per layer) and a slower decode.
    /// Giving more memory made it slower.
    ///
    /// Scoring `prompt/prefill + reply/decode` prices both sides in the one
    /// unit that matters, seconds, and picks the estimated trade the budget can
    /// afford. Above the last decode anchor the estimate credits no further
    /// cache gain; below it, a pass grows when its estimated prefill saving
    /// outweighs its decode cost. These are model scores, not new benchmarks.
    /// Swept a GB at a time from 7 to 90 GB, the estimate never gets worse as
    /// the target grows.
    public static func prefillChunkFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens,
                                       retentionFloor: Int = 0) -> Int {
        // 8192 is not a candidate: nothing has measured it, and the prefill
        // schedule would cut it to 4096 on the first pass anyway
        // (PrefillSchedule.measuredQueryKeyProduct), so offering it only
        // charged 10.6 GB for a pass that never ran.
        let candidates = [256] + [512, 1024, 2048, 4096].filter {
            prefillCostGB($0) <= 0.25 * poolBudgetGB
        }
        func seconds(_ c: Int) -> Double {
            let pool = poolBudgetGB - prefillCostGB(c)
                - prefixCacheGB(poolBudgetGB: poolBudgetGB, contextCap: contextCap, retentionFloor: retentionFloor)
            let slots = Geometry.slotsForPoolGB(max(0, pool))
            let decode = estWarmTokS(expertsPerLayer: Geometry.perLayer(slots))
            return tuningPromptTokens / estPrefillTokS(chunk: c) + tuningReplyTokens / decode
        }
        // Ties (identical seconds) go to the larger pass: same request time,
        // more headroom on a prompt longer than the one we tuned for.
        return candidates.min { a, b in
            let (sa, sb) = (seconds(a), seconds(b))
            return sa != sb ? sa < sb : a > b
        } ?? 256
    }

    /// How many tokens of conversation state the prefix cache may retain.
    ///
    /// The held state is ~27 KiB per token, and this is a ceiling on the total
    /// across every conversation held, not per conversation.
    ///
    /// It **is** charged against the budget. The first design held one
    /// conversation and evicted on any miss, so exactly one state was ever live
    /// and peak was unchanged; that design was then measured against a real
    /// client and never hit at all — Open WebUI interleaves a title-generation
    /// request between turns and evicted the chat every time. Holding several
    /// conversations is what makes the cache work, and several held states are
    /// genuinely additive memory, so the budget pays for them. A tenth of the
    /// pool budget is the ceiling, capped by the context limit above which
    /// reuse is impossible anyway (a match needs `prompt.count > held.count`,
    /// and a prompt that long is already refused).
    ///
    /// `retentionFloor` raises the ceiling so one complete conversation of a
    /// window above the default stays retained. Past the retained length every
    /// follow-up turn re-reads the whole conversation, so a larger window
    /// without it cannot be continued cheaply. `plan(retention:)` decides it.
    public static func prefixCacheTokensFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens,
                                            retentionFloor: Int = 0) -> Int {
        let cap = max(0, contextCap)
        let gb = 0.10 * max(0, poolBudgetGB)
        let full = Double(cap) * Double(PrefixCache.bytesPerToken) / 1e9
        let share = gb >= full ? cap : max(0, min(Int(gb * 1e9 / Double(PrefixCache.bytesPerToken)), cap))
        return max(share, min(max(0, retentionFloor), cap))
    }

    /// What that retention ceiling costs, which the plan reserves.
    public static func prefixCacheGB(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens,
                                     retentionFloor: Int = 0) -> Double {
        prefixCacheCostGB(tokens: prefixCacheTokensFor(
            poolBudgetGB: poolBudgetGB, contextCap: contextCap, retentionFloor: retentionFloor))
    }

    /// PrefixCache evicts before a miss allocation, so no more than four
    /// states coexist: the active state already in fixedFootprintGB plus three
    /// retained states. Their fixed GDN memory is additive to KV/indexer bytes.
    public static func prefixCacheCostGB(tokens: Int) -> Double {
        guard tokens > 0 else { return 0 }
        let tokenGB = Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
        let fixedGB = Double(PrefixCache.maxEntries - 1)
            * Double(PrefixCache.fixedBytesPerEntry) / 1e9
        return tokenGB + fixedGB
    }

    /// Prefill throughput estimate for the banner, from the anchors above.
    /// Prefill throughput estimate, from measurement plus one measured ratio.
    ///
    /// 2048 is the solid anchor: **112.9 tok/s** on an 8,016-token prompt at a
    /// 16 GB target, mean of three interleaved runs. 4096 could not be measured
    /// at *its* natural home (a 36 GB target needs ~33 GB free, which has not
    /// been available), so it is derived from a ratio measured at a matched
    /// pool of 60 experts/layer, where 4096 beat 2048 in all three paired
    /// rounds — 108.8/96.6, 92.2/76.3, 103.9/91.4, a mean 101.6 against 88.1,
    /// or 1.15x. Applied to the anchor that implies ~130; 125 is quoted so the
    /// estimate stays under the evidence rather than over it, and 8192 is not
    /// credited with any further gain because nothing has measured one.
    ///
    /// Caveat this does not model: prefill also depends on pool size, because
    /// a bigger cache means fewer expert misses per pass. The same chunk gives
    /// 88 tok/s at 60 experts/layer and 113 at 67, so treat these as typical
    /// for a machine that would *choose* that chunk, not as a pure function.
    public static func estPrefillTokS(chunk: Int) -> Double {
        // The sweep's ladder on the 8k acceptance prompt at a matched pool of
        // 60 experts per layer (MEASUREMENTS.md, "N2 — the prefill sweep"):
        // 88 / 128 / 169 / 211 / 222 tok/s from 256 to 4096, rounded down.
        // The floor's 256-token pass read 88 at 13 per layer too: below 1024
        // the pass is read-bound and the pool barely matters. Ordinary prose
        // reads about 40% slower than this prompt at every size; these are the
        // acceptance prompt's numbers, as the previous ladder's were.
        switch chunk {
        case ..<512: return PlannerCostModel.prefill256TokensPerSecond
        case ..<1024: return PlannerCostModel.prefill512TokensPerSecond
        case ..<2048: return PlannerCostModel.prefill1024TokensPerSecond
        case ..<4096: return PlannerCostModel.prefill2048TokensPerSecond
        default: return PlannerCostModel.prefill4096TokensPerSecond
        }
    }
    /// Smallest honest total-memory target: floor pool + footprint + margin.
    public static var minMemoryGB: Double {
        ((Geometry.gb(Geometry.floorSlots) + fixedFootprintGB + planningMarginGB) * 10)
            .rounded(.up) / 10
    }

    /// Memory reclaimable RIGHT NOW without compressing or swapping any other
    /// process's memory: free pages (the raw counter includes speculative) +
    /// purgeable + file-backed cache. Deliberately NOT `kern.memorystatus_level`
    /// (the `memory_pressure` "free percentage"): that counts other apps'
    /// compressible/swappable memory as available, and sizing a GPU pool
    /// against it is exactly how you cause the swap storm. nil if the mach
    /// call fails (then no clamp is applied).
    /// Test seam: when set, stands in for the live availability reading so the
    /// governor can be driven without putting the machine under real memory
    /// pressure. Never set in normal operation.
    ///
    /// **It does not make the resulting allocation imaginary.** The governor
    /// acts on this number, so setting it *above* what the machine has makes it
    /// allocate a pool the machine cannot hold: simulating 60 GB free on a Mac
    /// with 7 GB took a real 25 GB pool and drove tens of GB of swap. Anything
    /// using this seam must bound the value by `deviceAvailableGB()`.
    public nonisolated(unsafe) static var availabilityOverride: Double?

    /// Headroom kept between our expected peak and what is reclaimable, so
    /// claiming it doesn't leave the machine at zero.
    public static func availabilitySlackGB(ramGB: Double) -> Double {
        max(1.5, 0.05 * ramGB)
    }

    /// Supported adaptive budget in decimal GB. Metal supplies a recommendation,
    /// not current free RAM. Keep the existing GPU and OS margins; availability
    /// is checked separately. This is not a measured performance optimum.
    public static func maximumMemoryLimitGB(ramGB: Double, workingSetGB: Double) -> Double {
        max(0, min(workingSetGB - 2, ramGB - availabilitySlackGB(ramGB: ramGB)))
    }

    /// The share of RAM auto may target before other limits apply. Overridable
    /// per run with --max-ram-percent. It bounds the user's RAM share separately
    /// from the model-specific operating default and the physical constraints.
    public static let defaultRAMPercent = 70.0

    /// Base automatic total-process ceiling in decimal GB, before an enabled
    /// draft head's separately charged cost. This is an operating default for
    /// the implemented model, not a hardware or correctness limit.
    ///
    /// The clean M5 Pro cache ladder showed diminishing returns (11.2 tok/s at
    /// 120 experts/layer, 11.6 at 150). This target also affords the selected
    /// prefill workspace. It is our best-supported memory/speed tradeoff so far.
    /// The historical 34-to-84-GB sweep read planner estimates already held flat
    /// beyond their verified anchors; it did not benchmark those allocations.
    ///
    /// Keep this default until comparable real runs justify a better tradeoff.
    /// More RAM alone neither proves a gain nor requires a live autotuner.
    /// Explicit --memory-gb / --pool-gb / --experts-per-layer bypass this policy
    /// ceiling and pin the cache; they do not change physical feasibility.
    /// Evidence and revision contract:
    /// db/records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram.md
    /// db/records/design/measured-operating-policies.md
    public static let usefulCeilingGB = 33.0

    /// Combine the operating default, the user's RAM-share bound and a Metal
    /// working-set margin. The caller separately clamps to live availability.
    /// The policy ceiling expresses current evidence, not maximum useful RAM.
    public static func autoTargetGB(
        ramGB: Double, workingSetGB: Double, ramPercent: Double = defaultRAMPercent,
        ceilingGB: Double = usefulCeilingGB
    ) -> Double {
        min(ceilingGB, (ramPercent / 100) * ramGB, workingSetGB - 2.0)
    }

    /// Warm decode estimate, re-anchored 2026-08-30 on measured points.
    ///
    /// The old curve interpolated between 30/layer = 5.6 and 181/layer = 20.0
    /// and **over-promised by 25 to 45% across the middle of its own range**,
    /// which is the part most machines actually land in. Re-measured on 0.1.6
    /// with the pool properly warmed (throughput plateaus by the second
    /// generation, so three samples is enough — verified over 14 consecutive
    /// runs):
    ///
    /// | experts/layer | measured | old estimate |
    /// |---|---|---|
    /// | 30 | 6.0 | 5.6 |
    /// | 60 | 8.2 | 9.2 |
    /// | 120 | 11.2 | 14.8 |
    /// | 150 | 11.6 | 17.3 |
    ///
    /// It is also nearly flat from 120 to 150, so the plateau starts far below
    /// the 181 the old curve assumed. The 20.0 figure at 181/layer could not be
    /// re-verified: that config peaks at 27.4 GB and the machine had 26.6 GB
    /// reclaimable, and forcing it once already drove 13 GB of swap. One run
    /// under that pressure produced a 15 to 18 band, consistent with a
    /// threshold once the working set fits, but it is not a clean measurement.
    ///
    /// So this now interpolates the verified points and **holds flat above
    /// them** rather than extrapolating to an unconfirmed number. It
    /// under-promises above 150/layer on purpose: a plan that quotes a speed
    /// the machine does not reach is worse than one that quotes less.
    /// Upper verified cache anchor, retained under its public compatibility
    /// name. The estimator holds flat after this point to avoid extrapolation;
    /// that does not prove that actual throughput is flat above it. Both the
    /// estimate and prefill-pass sizing use this bound. See the operating policy.
    public static let decodePlateauPerLayer = PlannerCostModel.decodePlateauPerLayer

    public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
        let (e0, r0) = (PlannerCostModel.decodeLowExpertsPerLayer, PlannerCostModel.decodeLowTokensPerSecond)
        let (e1, r1) = (decodePlateauPerLayer, PlannerCostModel.decodePlateauTokensPerSecond)
        if e >= e1 { return r1 }
        if e <= e0 { return r0 * (max(e, 1) / e0) }
        let t = log(e / e0) / log(e1 / e0)
        return r0 * pow(r1 / r0, t)
    }

    /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
    /// activations and cache growth ride the existing margins).
    public static let mtpResidentGB = Double(PlannerCostModel.mtpResidentBytes) / 1e9

    /// The vision tower's resident cost, paid only by a process that is handed
    /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
    /// checkpoint's own header (`VisionTower.residentBytes`), rounded up.
    ///
    /// Engine reserves this inside a target-driven plan before loading the
    /// tower. A raw pool-size request keeps that explicit pool size and reports
    /// the additional resident bytes in its expected peak.
    public static let visionResidentGB = Double(PlannerCostModel.visionResidentBytes) / 1e9

    /// Headroom demanded on top of the tower's own bytes before loading it.
    /// The load briefly holds arrays twice while MLX materializes them.
    /// Attention transients depend on the actual dispatch: the established
    /// 72-wide fallback can form an N² matrix and are not bounded by this term.
    public static let visionLoadMarginGB = Double(PlannerCostModel.visionLoadMarginBytes) / 1e9
    /// Auto enables the draft head only when the cache still affords this
    /// many experts per layer AFTER paying for it. The former 120 came from the
    /// M9 ladder, measured before rejected drafts rolled back instead of
    /// re-running. Since then two drafts decoded 31.7% faster than plain decode
    /// at 76 experts per layer (automatic 40% RAM study on 0.2.14, small
    /// samples), and the decode lookahead riding the head measured 1.114 at 88.
    /// The floor is the smallest cache where the head was measured faster.
    /// Revision: a clean paired loss between this floor and 120.
    /// db/records/decisions/draft-head-auto-floor-76-per-layer.md
    public static let mtpAutoFloorPerLayer = 76.0

    /// Pool budget before the prefill pass takes its share.
    public static func poolBudgetGB(_ targetGB: Double) -> Double {
        targetGB - fixedFootprintGB - planningMarginGB
    }

    public static func slotsForTarget(_ targetGB: Double, contextCap: Int = ContextPolicy.defaultTokens,
                                      retentionFloor: Int = 0) -> Int {
        let budget = poolBudgetGB(targetGB)
        let pool = budget
            - prefillCostGB(prefillChunkFor(poolBudgetGB: budget, contextCap: contextCap, retentionFloor: retentionFloor))
            - prefixCacheGB(poolBudgetGB: budget, contextCap: contextCap, retentionFloor: retentionFloor)
        return Geometry.slotsForPoolGB(pool)
    }

    /// Resolve the knobs. Precedence: --experts-per-layer > --pool-gb >
    /// --memory-gb > auto. Losing knobs are noted, never silently dropped.
    ///
    /// Auto (and only auto) also clamps to what is reclaimable right now, so a
    /// busy machine degrades gracefully instead of swap-storming — explicit
    /// knobs mean the user chose, so they only get an informational note. On a
    /// quiet machine the clamp never binds and auto stays deterministic.
    public enum MTPMode: String, Sendable, Codable {
        case on, off, auto
    }

    /// Whether this process will answer requests that carry images. `auto` is
    /// "yes when the checkpoint has a tower", which the shipped one does.
    public enum VisionMode: String, Sendable, Codable {
        case on, off, auto
    }

    /// Preserve the original callable signature for embedding clients.
    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false
    ) throws -> MemoryPlan {
        try plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            memoryLimitGB: nil, ramGB: ramGB, workingSetGB: workingSetGB,
            availableGB: availableGB, ramPercent: ramPercent, mtp: mtp,
            mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens, simulated: simulated)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?, memoryLimitGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: nil)
    }

    /// Preserve the original callable signature for embedding clients.
    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
    ) throws -> MemoryPlan {
        try plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            memoryLimitGB: nil, ramGB: ramGB, workingSetGB: workingSetGB,
            availableGB: availableGB, ramPercent: ramPercent, mtp: mtp,
            mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens, simulated: simulated,
            runtimePolicy: runtimePolicy)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?, memoryLimitGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: runtimePolicy)
    }

    /// How much conversation state a window above the default retains.
    public enum ContextRetention: String, Sendable, Codable {
        /// One complete conversation of the window when the plan can hold it;
        /// otherwise a tenth of the pool budget, with a note saying how long a
        /// conversation follow-up turns can still reuse.
        case automatic
        /// One complete conversation or the plan is refused. The automatic
        /// window uses this, so an automatic window can always be continued.
        case completeWindow
        /// A tenth of the pool budget only (the rule before 0.2.17).
        case budgetShare
    }

    /// Preserve the original callable signature for embedding clients.
    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil,
        decodeLookahead: DecodeLookaheadPlanning = .automatic,
        retention: ContextRetention = .automatic
    ) throws -> MemoryPlan {
        try plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            memoryLimitGB: nil, ramGB: ramGB, workingSetGB: workingSetGB,
            availableGB: availableGB, ramPercent: ramPercent, mtp: mtp,
            mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens, simulated: simulated,
            qualification: qualification, runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead,
            retention: retention)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?, memoryLimitGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil,
        decodeLookahead: DecodeLookaheadPlanning = .automatic,
        retention: ContextRetention = .automatic
    ) throws -> MemoryPlan {
        func resolve(_ floor: Int) throws -> MemoryPlan {
            try resolvePlan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
                ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
                mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
                visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
                simulated: simulated, qualification: qualification, runtimePolicy: runtimePolicy,
                decodeLookahead: decodeLookahead, retentionFloor: floor)
        }
        guard retention != .budgetShare, maxContextTokens > ContextPolicy.defaultTokens,
              ContextPolicy.validationError(maxContextTokens, qualification: qualification) == nil else {
            return try resolve(0)
        }
        do {
            return try resolve(maxContextTokens)
        } catch {
            guard retention == .automatic else { throw error }
            let shared = try resolve(0)
            guard shared.prefixCacheTokens > 0 else { return shared }
            return shared.addingNotes([String(
                format: "one complete %d-token conversation does not fit retained at this size: follow-up turns reuse up to %d tokens, and a longer conversation is read again",
                maxContextTokens, shared.prefixCacheTokens)])
        }
    }

    private static func resolvePlan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?, memoryLimitGB: Double? = nil,
        ramGB: Double?, workingSetGB: Double?,
        availableGB: Double?, ramPercent: Double?,
        mtp: MTPMode, mtpAvailable: Bool,
        vision: VisionMode, visionAvailable: Bool,
        visionResidentReserved: Bool,
        maxContextTokens: Int,
        simulated: Bool, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy?,
        decodeLookahead: DecodeLookaheadPlanning, retentionFloor: Int
    ) throws -> MemoryPlan {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) { throw PlanError(why) }
        // nil: decide automatically below. A fixed reservation (experimental, or
        // retained from a loaded engine) is charged whether or not it is enabled.
        let retainedLookahead: Bool?
        let fixedLookaheadBytes: Int
        // The shipped tap correction's bytes, charged with the automatic default only when it is on.
        let automaticCorrectionBytes: Int
        switch decodeLookahead {
        case .automatic: retainedLookahead = nil; fixedLookaheadBytes = 0; automaticCorrectionBytes = 0
        case .automaticCorrected(let bytes): retainedLookahead = nil; fixedLookaheadBytes = 0; automaticCorrectionBytes = max(0, bytes)
        case .off: retainedLookahead = false; fixedLookaheadBytes = 0; automaticCorrectionBytes = 0
        case .reserved(let bytes): retainedLookahead = false; fixedLookaheadBytes = bytes; automaticCorrectionBytes = 0
        case .retained(let enabled, let bytes): retainedLookahead = enabled; fixedLookaheadBytes = bytes; automaticCorrectionBytes = 0
        }
        guard fixedLookaheadBytes >= 0, fixedLookaheadBytes <= (4096 << 20) else {
            throw PlanError("expert lookahead reserve must be between 0 and 4096 MiB")
        }
        // The fixed footprint pays for the default context; larger windows
        // reduce the pool budget by their additional active state and measured
        // transient envelope, before sizing either the pool or prefill pass.
        // A fixed lookahead reservation is deducted here too, before the pool
        // is solved, so its buffers never hide inside the target.
        let contextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens)
            + (visionResidentReserved ? visionResidentGB : 0)
            + Double(fixedLookaheadBytes) / 1e9
        let mtpContextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens, mtp: true)
            - extraContextMemoryGB(maxContextTokens: maxContextTokens)
        let mtpTotalCharge = mtpResidentGB + mtpContextCharge
        // Auto lifts its model ceiling by a larger window's own memory, as it
        // does for the draft head: the window's active state and transient
        // reserve, plus the retention that keeps one complete conversation.
        // The expert cache keeps its budget where the RAM share, working set
        // and live availability allow; they still bound the total.
        let windowChargeGB = extraContextMemoryGB(maxContextTokens: maxContextTokens)
            + (retentionFloor > ContextPolicy.defaultTokens
                ? prefixCacheCostGB(tokens: retentionFloor) - prefixCacheCostGB(tokens: ContextPolicy.defaultTokens) : 0)
        let ram = ramGB ?? deviceRAMGB()
        let ws = workingSetGB ?? deviceWorkingSetGB()
        // A simulated machine with no availability constraint must never
        // borrow today's host reading. Real planning still observes the host.
        let avail = availableGB ?? (simulated ? .infinity : deviceAvailableGB())
        let pct = ramPercent ?? (memoryLimitGB == nil ? defaultRAMPercent : 100)
        guard ram.isFinite, ram > 0 else {
            throw PlanError("RAM must be a finite number > 0")
        }
        guard ws.isFinite, ws > 0 else {
            throw PlanError("Metal working-set size must be a finite number > 0")
        }
        // +infinity is meaningful here: it is how doctor --sim-ram says
        // "availability is not a constraint on this simulated machine". Only
        // NaN and negatives are garbage.
        if let a = avail, a.isNaN || a < 0 {
            throw PlanError("available memory must be a number >= 0")
        }
        guard pct.isFinite, pct > 0, pct <= 100 else {
            throw PlanError(String(
                format: "--max-ram-percent %.0f is out of range — give a share between 1 and 100",
                pct))
        }
        var notes: [String] = []
        var clamped = false
        if let limit = memoryLimitGB {
            guard limit.isFinite, limit >= minMemoryGB else {
                throw PlanError("--memory-limit-gb must be finite and at least \(minMemoryGB) GB")
            }
            guard expertsPerLayer == nil, poolGB == nil, memoryGB == nil else {
                throw PlanError("--memory-limit-gb cannot be combined with a fixed memory or cache size")
            }
        }
        if ramPercent != nil, expertsPerLayer != nil || poolGB != nil || memoryGB != nil {
            notes.append("--max-ram-percent ignored (it only bounds auto; an explicit memory knob is already the target)")
        }
        if vision == .on, !visionAvailable {
            throw PlanError(
                "--vision on, but this checkpoint has no vision_tower tensors — it is a "
                    + "text-only model; use --vision auto/off")
        }
        let visionOn = vision != .off && visionAvailable
        guard !visionResidentReserved || visionOn else {
            throw PlanError("a loaded vision tower requires an available, enabled vision model")
        }
        if mtp == .on, !mtpAvailable {
            throw PlanError(
                "--mtp on, but mtp.safetensors is not next to the model — the draft head "
                    + "is a separate 1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); convert it first or use --mtp auto/off")
        }

        /// The draft-head decision for a pool of `slots` when the head costs
        /// pool budget (target-driven sources already shrank the pool).
        if mtp == .on, maxContextTokens > ContextPolicy.mtpLimit, !qualification {
            throw PlanError("MTP is qualified only through \(ContextPolicy.mtpLimit) tokens; use --mtp off at this window")
        }
        if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit {
            notes.append("MTP stays off because this context exceeds its qualified window")
        }
        func resolveMTP(slotsAfterCharge: Int) -> Bool {
            if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit { return false }
            switch mtp {
            case .off: return false
            case .on: return true
            case .auto:
                return mtpAvailable
                    && Geometry.perLayer(slotsAfterCharge) >= mtpAutoFloorPerLayer
            }
        }
        /// The decode lookahead rides the draft head. Automatically it turns on
        /// where the cache after the head's charge still reaches the head's
        /// floor, the cache sizes it was measured at; a head forced onto a
        /// smaller cache runs without it. Its own bytes then come out of the pool.
        func resolveLookahead(mtpOn: Bool, slotsAfterHead: Int) -> Bool {
            guard mtpOn else { return false }
            if let retainedLookahead { return retainedLookahead }
            return Geometry.perLayer(slotsAfterHead) >= mtpAutoFloorPerLayer
        }
        /// Budget the automatic lookahead takes when it is on.
        func lookaheadChargeGB(_ on: Bool) -> Double {
            on && retainedLookahead == nil ? Double(DecodeLookahead.reserveBytes(correctionBytes: automaticCorrectionBytes)) / 1e9 : 0
        }

        func finish(
            _ source: MemoryPlan.Source, _ slots: Int, target: Double?, mtpOn: Bool, lookaheadOn: Bool
        ) throws -> MemoryPlan {
            // An explicit pool knob states the cache size, not the whole budget,
            // so size the prefill pass from the pool the user asked for.
            let mtpCharge = (mtpOn ? mtpResidentGB + mtpContextCharge : 0) + lookaheadChargeGB(lookaheadOn)
            let budgetForCaches = target.map { poolBudgetGB($0) - mtpCharge - contextCharge }
                ?? Geometry.gb(slots)
            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens, retentionFloor: retentionFloor)
            let capped = min(slots, Geometry.totalRecords)
            let floored = max(capped, Geometry.floorSlots)
            if floored > capped {
                notes.append(String(
                    format: "raised to the floor of %d slots (~%.0f/layer): below it a prefill chunk can pin every slot",
                    Geometry.floorSlots, Geometry.perLayer(Geometry.floorSlots)))
            }
            let peak = Geometry.gb(floored) + fixedFootprintGB + prefillCostGB(chunk)
                + prefixCacheGB(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens, retentionFloor: retentionFloor) + mtpCharge + contextCharge
            if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                notes.append(String(
                    format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
                    peak, ws))
            }
            // Explicit raw knobs: warn (don't resize) when the machine is busy.
            if source == .expertsPerLayer || source == .poolGB, let a = avail, peak > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory (auto would size to the machine)",
                    a))
            }
            let base = MemoryPlan(
                source: source, slots: floored, targetGB: target,
                ramGB: ram, workingSetGB: ws, ramPercent: pct,
                availableGB: avail, clamped: clamped,
                prefillChunk: chunk,
                prefixCacheTokens: prefixCacheTokensFor(
                    poolBudgetGB: budgetForCaches, contextCap: maxContextTokens, retentionFloor: retentionFloor),
                mtpEnabled: mtpOn,
                visionEnabled: visionOn,
                visionResidentReserved: visionResidentReserved,
                maxContextTokens: maxContextTokens,
                notes: notes,
                simulated: simulated, contextQualification: qualification,
                lookaheadReserveBytes: fixedLookaheadBytes
                    + (lookaheadOn && retainedLookahead == nil ? DecodeLookahead.reserveBytes(correctionBytes: automaticCorrectionBytes) : 0),
                decodeLookahead: lookaheadOn, memoryLimitGB: memoryLimitGB)
            let resolved = try runtimePolicy.map { try applyingRuntimePolicy(base, policy: $0) } ?? base
            let bytes = resolved.memoryLedger.expectedPeakBytes
            if memoryLimitGB != nil {
                try validateMemoryBudget(resolved, availableGB: avail)
            }
            if maxContextTokens > ContextPolicy.defaultTokens || visionResidentReserved {
                if let target, Double(bytes) > target * 1e9 {
                    throw PlanError("insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target")
                }
                let physical = min(ws, (avail ?? ws) - availabilitySlackGB(ramGB: ram))
                if Double(bytes) > physical * 1e9 {
                    throw PlanError("insufficient_memory: requested context and expert pool exceed reclaimable memory with safety headroom or the Metal working set")
                }
            }
            return resolved
        }

        if let n = expertsPerLayer {
            guard n >= 1 else { throw PlanError("--experts-per-layer must be ≥ 1") }
            if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
            let slots = min(n, Geometry.expertsPerLayer) * Geometry.layers
            let mtpOn = resolveMTP(slotsAfterCharge: slots)
            return try finish(.expertsPerLayer, slots, target: nil, mtpOn: mtpOn,
                lookaheadOn: resolveLookahead(mtpOn: mtpOn, slotsAfterHead: slots))
        }
        if let g = poolGB {
            guard g.isFinite, g > 0 else {
                throw PlanError("--pool-gb must be a finite number > 0")
            }
            if memoryGB != nil { notes.append("--memory-gb ignored (--pool-gb takes precedence)") }
            // Preserve a below-floor request so `finish` can explain that it
            // raised it; cap before Double->Int so huge finite input is safe.
            let requested = g >= Geometry.gb(Geometry.totalRecords)
                ? Geometry.totalRecords : Int(g * 1e9 / Geometry.recordBytes)
            let mtpOn = resolveMTP(slotsAfterCharge: requested)
            return try finish(.poolGB, requested, target: nil, mtpOn: mtpOn,
                lookaheadOn: resolveLookahead(mtpOn: mtpOn, slotsAfterHead: requested))
        }
        if let m = memoryGB {
            guard m.isFinite else { throw PlanError("--memory-gb must be finite") }
            guard m >= minMemoryGB else {
                throw PlanError(String(
                    format: "--memory-gb %.1f is below the minimum %.1f GB (floor cache of ~%.0f experts/layer = %.1f GB pool, plus the %.1f GB fixed footprint of resident weights + n-gram cache, plus %.1f GB margin)",
                    m, minMemoryGB, Geometry.perLayer(Geometry.floorSlots),
                    Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                    planningMarginGB))
            }
            if m > ws {
                notes.append(String(
                    format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
                    m, ws, max(minMemoryGB, autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct))))
            }
            if let a = avail, m > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory",
                    a))
            }
            var mtpOn = resolveMTP(
                slotsAfterCharge: slotsForTarget(max(m - mtpTotalCharge - contextCharge, minMemoryGB), contextCap: maxContextTokens, retentionFloor: retentionFloor))
            if mtpOn, m - mtpTotalCharge - contextCharge < minMemoryGB {
                if mtp == .on {
                    throw PlanError(String(
                        format: "--memory-gb %.1f cannot fit the %.1f GB draft head above the %.1f GB minimum — raise the target or drop --mtp on",
                        m, mtpTotalCharge, minMemoryGB))
                }
                mtpOn = false
            }
            let slotsAfterHead = slotsForTarget(m - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens, retentionFloor: retentionFloor)
            let lookaheadOn = resolveLookahead(mtpOn: mtpOn, slotsAfterHead: slotsAfterHead)
            let slots = lookaheadOn && retainedLookahead == nil
                ? slotsForTarget(m - mtpTotalCharge - lookaheadChargeGB(true) - contextCharge, contextCap: maxContextTokens, retentionFloor: retentionFloor)
                : slotsAfterHead
            return try finish(.memoryGB, slots, target: m, mtpOn: mtpOn, lookaheadOn: lookaheadOn)
        }

        // auto: the default. The draft head is worth its 1.6 GB only when the
        // cache still reaches ~120+ experts/layer after paying for it in the
        // measured setup. Preserve that cache budget when the head is enabled
        // by raising the policy ceiling by its separately charged cost.
        let mtpWanted = mtp != .off && mtpAvailable
            && (mtp == .on || maxContextTokens <= ContextPolicy.mtpLimit)
        func autoRaw(ceilingGB: Double) -> (Double, Bool) {
            var c = autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct,
                ceilingGB: memoryLimitGB ?? ceilingGB)
            if memoryLimitGB != nil {
                c = min(c, maximumMemoryLimitGB(ramGB: ram, workingSetGB: ws))
            }
            var raw = c
            var didClamp = false
            if let a = avail, a - availabilitySlackGB(ramGB: ram) < raw {
                raw = a - availabilitySlackGB(ramGB: ram)
                didClamp = true
            }
            return (raw, didClamp)
        }
        var mtpOn = false
        if mtpWanted {
            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpTotalCharge + windowChargeGB)
            let targetM = max(minMemoryGB, rawM)
            let charged = targetM - mtpTotalCharge - contextCharge
            mtpOn = charged >= minMemoryGB
                && (mtp == .on
                    || Geometry.perLayer(slotsForTarget(charged, contextCap: maxContextTokens, retentionFloor: retentionFloor)) >= mtpAutoFloorPerLayer)
        }
        if mtp == .on, !mtpOn {
            throw PlanError("insufficient_memory: auto cannot keep the requested MTP head loaded at this context; close other apps or use --mtp off")
        }
        // `ceiling` is what this machine's auto would pick unclamped (the
        // notes below compare against it); the knee itself rises by the
        // head's cost when the head is on.
        let kneeGB = memoryLimitGB ?? (usefulCeilingGB + (mtpOn ? mtpTotalCharge : 0) + windowChargeGB)
        var ceiling = autoTargetGB(
            ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: kneeGB)
        if memoryLimitGB != nil {
            ceiling = min(ceiling, maximumMemoryLimitGB(ramGB: ram, workingSetGB: ws))
        }
        let raw: Double
        (raw, clamped) = autoRaw(ceilingGB: kneeGB)
        let target = max(minMemoryGB, raw)
        if memoryLimitGB != nil, raw < minMemoryGB {
            throw PlanError("insufficient_memory: available memory cannot fit the minimum model budget with safety headroom")
        }
        if mtpOn, target - mtpTotalCharge - contextCharge < minMemoryGB { mtpOn = false }
        // Exactly one note tells the story of why the target is what it is.
        if raw < minMemoryGB, ceiling < minMemoryGB {
            notes.append(String(
                format: "this machine (%.0f GB RAM) is below the comfortable minimum — running at the %.1f GB floor; expect slow decode and close other apps",
                ram, minMemoryGB))
        } else if raw < minMemoryGB {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now — running at the %.1f GB floor anyway; expect heavy paging until other apps release memory",
                avail ?? 0, ram, minMemoryGB))
        } else if clamped, let limit = memoryLimitGB {
            var note = String(format: "using up to %.1f GB now; the cache can grow back toward %.1f GB when memory is available", target, ceiling)
            if ceiling < limit {
                note += String(format: "; your %.1f GB limit is bounded by this Mac's supported budget and RAM share", limit)
            }
            notes.append(note)
        } else if let limit = memoryLimitGB, ceiling < limit {
            notes.append(String(format: "your %.1f GB limit is bounded to %.1f GB by this Mac's supported budget and RAM share", limit, ceiling))
        } else if clamped {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual %.1f GB; close apps and restart for full speed, or force a size with --memory-gb",
                avail ?? 0, ram, ceiling))
        } else if memoryLimitGB == nil, ceiling >= kneeGB,
            min((pct / 100) * ram, ws - 2.0) > 1.25 * kneeGB
        {
            // This machine could hold more and auto declined. Say so, or it
            // reads as slotstream failing to use the hardware.
            notes.append(String(
                format: "auto's default memory ceiling is %.1f GB for this model%@, based on diminishing returns in development-Mac tests; other hardware may benefit from more. We revise defaults using real measurements; --memory-limit-gb N selects a larger adaptive budget",
                kneeGB - windowChargeGB,
                windowChargeGB > 0
                    ? String(format: " plus %.1f GB for the %d-token context window", windowChargeGB, maxContextTokens) : ""))
        }
        let slotsAfterHead = slotsForTarget(target - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens, retentionFloor: retentionFloor)
        let lookaheadOn = resolveLookahead(mtpOn: mtpOn, slotsAfterHead: slotsAfterHead)
        let slots = lookaheadOn && retainedLookahead == nil
            ? slotsForTarget(target - mtpTotalCharge - lookaheadChargeGB(true) - contextCharge, contextCap: maxContextTokens, retentionFloor: retentionFloor)
            : slotsAfterHead
        return try finish(.auto, slots, target: target, mtpOn: mtpOn, lookaheadOn: lookaheadOn)
    }

    /// Resolve the first image against the existing policy, before allocating
    /// its tower. The source and target remain the user's original decision.
    public static func loadingVision(_ p: MemoryPlan) throws -> MemoryPlan {
        try validateAdaptiveMemoryPolicy(p)
        guard p.visionEnabled else { throw PlanError("vision is disabled") }
        if p.visionResidentReserved { return p }
        var sized: MemoryPlan
        var notes = p.notes + ["vision tower resident memory reserved before loading"]
        if let target = p.targetGB {
            sized = try plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB,
                mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                vision: .on, visionAvailable: true, visionResidentReserved: true,
                maxContextTokens: p.maxContextTokens, simulated: p.simulated, qualification: p.contextQualification,
                runtimePolicy: p.runtimeAllocationPolicy,
                decodeLookahead: .retained(enabled: p.decodeLookahead, bytes: p.lookaheadReserveBytes))
            // A plan that retained one complete conversation falls back to the
            // budget share when the tower leaves no room for all of it. The
            // pool cannot grow back here, so the memory that fallback frees
            // would sit unused while every conversation longer than the share
            // is read again from the start, turn after turn. Keep the largest
            // retention that leaves the pool and the prefill pass as the
            // fallback sizes them. Measured at a 12 GB target with a
            // 65,536-token window: 65,536 retained before the first image,
            // 10,807 after it, and Codex's 10,400-token turns lost all reuse.
            // db/records/design/measured-operating-policies.md
            if p.prefixCacheTokens > sized.prefixCacheTokens, p.prefixCacheTokens >= p.maxContextTokens {
                let slots = min(p.slots, sized.slots), chunk = min(p.prefillChunk, sized.prefillChunk)
                func fitting(_ floor: Int) -> MemoryPlan? {
                    guard let candidate = try? resolvePlan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                        ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB, ramPercent: nil,
                        mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                        vision: .on, visionAvailable: true, visionResidentReserved: true,
                        maxContextTokens: p.maxContextTokens, simulated: p.simulated,
                        qualification: p.contextQualification, runtimePolicy: p.runtimeAllocationPolicy,
                        decodeLookahead: .retained(enabled: p.decodeLookahead, bytes: p.lookaheadReserveBytes),
                        retentionFloor: floor),
                        candidate.slots >= slots, candidate.prefillChunk >= chunk
                    else { return nil }
                    return candidate
                }
                // More retention only ever takes memory from the pool and the
                // prefill pass, so the floors that fit form a prefix.
                var low = sized.prefixCacheTokens, high = p.prefixCacheTokens - 1
                var best: MemoryPlan?
                while low < high {
                    let mid = low + (high - low + 1) / 2
                    if let candidate = fitting(mid) { best = candidate; low = mid } else { high = mid - 1 }
                }
                if let best, best.prefixCacheTokens > sized.prefixCacheTokens {
                    sized = best
                    notes.append("with the vision tower loaded, follow-up turns reuse up to \(best.prefixCacheTokens) tokens")
                }
            }
        } else { sized = p }
        // Loading a tower never justifies restoring capacity already donated
        // by the governor. Its original target can outlive a pressure shrink.
        return MemoryPlan(source: p.source, slots: min(p.slots, sized.slots), targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: min(p.prefillChunk, sized.prefillChunk),
            prefixCacheTokens: min(p.prefixCacheTokens, sized.prefixCacheTokens), mtpEnabled: p.mtpEnabled,
            visionEnabled: true, visionResidentReserved: true,
            maxContextTokens: p.maxContextTokens,
            notes: notes, simulated: p.simulated,
            runtimeAllocationPolicy: p.runtimeAllocationPolicy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification,
            lookaheadReserveBytes: p.lookaheadReserveBytes, decodeLookahead: p.decodeLookahead,
            memoryLimitGB: p.memoryLimitGB)
    }
}
