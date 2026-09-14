import Foundation

/// A requested context window: automatic (the default for `serve`, `run` and
/// `doctor`) or an explicit token count.
public enum ContextWindowChoice: Sendable, Equatable {
    case automatic
    case tokens(Int)
}

/// The automatic context window for one machine and memory mode, with the
/// evaluation of every candidate so a report can show the tradeoff.
///
/// Auto takes the largest window in `ContextPolicy.automaticWindows` whose
/// plan on this machine's hardware tier (RAM and Metal working set, never how
/// busy the machine happens to be):
/// - keeps speculative decoding and the decode lookahead as they are at the
///   default window,
/// - retains one complete conversation of the window, so follow-up turns read
///   only what is new, and
/// - adds at most `ContextPolicy.automaticRequestTimeTolerance` to the
///   planner's estimated time for its representative request.
/// A raw cache size (--experts-per-layer, --pool-gb) keeps the default window.
/// The comparison uses planner estimates from measured anchors, not benchmarks.
/// Evidence and revision criteria:
/// db/records/decisions/automatic-context-window-per-machine.md
public struct AutomaticContextWindow {
    public struct Candidate {
        public let window: Int
        /// The plan on the machine's tier with one complete conversation retained.
        public let plan: MemoryPlan?
        public let refusal: String?
        public let requestSeconds: Double?
        public let relativeRequestCost: Double?
        public let accepted: Bool
        public let reason: String
    }

    public let window: Int
    public let candidates: [Candidate]

    public var json: [String: Any] {
        [
            "window": window,
            "candidate_windows": ContextPolicy.automaticWindows,
            "request_time_tolerance": ContextPolicy.automaticRequestTimeTolerance,
            "representative_request": ["prompt_tokens": Int(Planner.tuningPromptTokens),
                                       "reply_tokens": Int(Planner.tuningReplyTokens)],
            "tier_inputs": "RAM, Metal working set and memory knobs; current availability can only lower the window at startup",
            "candidates": candidates.map { c -> [String: Any] in
                var d: [String: Any] = ["window": c.window, "accepted": c.accepted, "reason": c.reason]
                if let p = c.plan {
                    d["experts_per_layer_cached"] = p.expertsPerLayerCached
                    d["mtp"] = p.mtpEnabled
                    d["decode_lookahead"] = p.decodeLookahead
                    d["prefill_chunk"] = p.prefillChunk
                    d["prefix_cache_max_tokens"] = p.prefixCacheTokens
                    d["expected_peak_gb"] = p.expectedPeakGB
                    d["target_gb"] = p.targetGB as Any? ?? NSNull()
                    let wait = p.estPrefillSecondsAtMaxContext
                    d["est_prefill_s_at_window"] = wait.isFinite ? wait as Any : NSNull()
                }
                if let s = c.requestSeconds { d["request_seconds"] = s }
                if let r = c.relativeRequestCost { d["relative_request_cost"] = r }
                if let refusal = c.refusal { d["refusal"] = refusal }
                return d
            },
        ]
    }

    /// The startup line under the plan banner.
    public func announcement(served: Int) -> String {
        let windows = ContextPolicy.automaticWindows.map(String.init).joined(separator: ", ")
        let percent = Int((ContextPolicy.automaticRequestTimeTolerance * 100).rounded())
        return "  window: automatic for this Mac, \(served) tokens: the largest of \(windows) that keeps "
            + "speculative decoding, retains one complete conversation and adds at most \(percent)% to a "
            + "typical request; --max-context N chooses another window up to \(ContextPolicy.maxTokens)"
    }

    /// The doctor section: each candidate and why auto took or declined it.
    public func report(served: Int) -> String {
        func pad(_ s: String, _ width: Int) -> String {
            s.count >= width ? s : String(repeating: " ", count: width - s.count) + s
        }
        let percent = Int((ContextPolicy.automaticRequestTimeTolerance * 100).rounded())
        var lines = [
            "",
            "context window: automatic, \(window) tokens on this machine's memory tier. Auto takes the largest",
            "window that keeps speculative decoding, retains one complete conversation, and adds at most \(percent)%",
            "to the estimated time of a \(Int(Planner.tuningPromptTokens))-token prompt with a \(Int(Planner.tuningReplyTokens))-token reply:",
        ]
        if served < window {
            lines.append("  lowered to \(served) tokens right now: with the memory reclaimable now, a larger window would not fit or would turn speculative decoding off")
        }
        lines.append("   window   experts/layer   draft   lookahead    pass   typical request   full-window wait")
        for c in candidates {
            guard let p = c.plan, let seconds = c.requestSeconds else {
                lines.append("   \(pad(String(c.window), 6))   \(c.reason)")
                continue
            }
            let marker = c.window == window ? "   <- auto" : (c.accepted ? "" : "   (\(c.reason))")
            let wait = p.estPrefillSecondsAtMaxContext
            let waitText = wait.isFinite ? "~" + PrefillSchedule.describe(seconds: wait) : "not yet calibrated"
            lines.append("   \(pad(String(c.window), 6))   \(pad(String(format: "%.0f/512", p.expertsPerLayerCached), 13))   "
                + "\(pad(p.mtpEnabled ? "on" : "off", 5))   \(pad(p.decodeLookahead ? "on" : "off", 9))   "
                + "\(pad(String(p.prefillChunk), 5))   "
                + "\(pad(String(format: "%.1f s (%+.1f%%)", seconds, (c.relativeRequestCost ?? 0) * 100), 16))   "
                + waitText + marker)
        }
        lines.append("  --max-context N chooses any window up to \(ContextPolicy.maxTokens). A larger window costs memory and")
        lines.append("  reading time; it does not guarantee answer quality over very long context.")
        return lines.joined(separator: "\n")
    }
}

extension Planner {
    /// The planner's estimated seconds for its representative request at a
    /// plan (a tuningPromptTokens prompt and a tuningReplyTokens reply): the
    /// score that already sizes the prefill pass. It is built from measured
    /// anchors but remains an estimate, and it leaves out speculative decoding,
    /// which the automatic window rule holds fixed instead.
    public static func estimatedRequestSeconds(_ plan: MemoryPlan) -> Double {
        tuningPromptTokens / estPrefillTokS(chunk: plan.prefillChunk)
            + tuningReplyTokens / estWarmTokS(expertsPerLayer: plan.expertsPerLayerCached)
    }

    /// Choose the automatic window for a request's memory mode on a machine's
    /// tier. Plans are simulated and never allocated.
    public static func automaticContextWindow(
        _ request: PlanRequest, on device: Machine,
        mtpAvailable: Bool = false, visionAvailable: Bool = false,
        runtimePolicy: RuntimeAllocationPolicy? = nil,
        decodeLookahead: DecodeLookaheadPlanning = .automatic
    ) -> AutomaticContextWindow {
        typealias Candidate = AutomaticContextWindow.Candidate
        let base = ContextPolicy.defaultTokens
        func evaluate(_ window: Int) -> (MemoryPlan?, String?) {
            do {
                // The machine's tier decides, not how busy it is right now.
                let value = try plan(expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
                    memoryGB: request.memoryGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                    availableGB: .infinity, ramPercent: request.maxRAMPercent,
                    mtp: request.mtp, mtpAvailable: mtpAvailable,
                    vision: request.vision, visionAvailable: visionAvailable,
                    maxContextTokens: window, simulated: true, qualification: false,
                    runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead,
                    retention: window > base ? .completeWindow : .automatic)
                return (value, nil)
            } catch {
                return (nil, String(describing: error))
            }
        }
        let (basePlan, baseRefusal) = evaluate(base)
        guard let basePlan else {
            return AutomaticContextWindow(window: base, candidates: [Candidate(
                window: base, plan: nil, refusal: baseRefusal, requestSeconds: nil, relativeRequestCost: nil,
                accepted: true, reason: "default window; no plan on this machine to compare against")])
        }
        let baseSeconds = estimatedRequestSeconds(basePlan)
        var chosen = base
        var candidates = [Candidate(window: base, plan: basePlan, refusal: nil, requestSeconds: baseSeconds,
            relativeRequestCost: 0, accepted: true, reason: "default window")]
        let fixedCache = request.expertsPerLayer != nil || request.poolGB != nil
        for window in ContextPolicy.automaticWindows where window > base {
            if window > ContextPolicy.implementationLimit || fixedCache {
                candidates.append(Candidate(window: window, plan: nil, refusal: nil, requestSeconds: nil,
                    relativeRequestCost: nil, accepted: false,
                    reason: fixedCache ? "a fixed cache size keeps the default window" : "above the supported limit"))
                continue
            }
            let (value, refusal) = evaluate(window)
            guard let value else {
                candidates.append(Candidate(window: window, plan: nil, refusal: refusal, requestSeconds: nil,
                    relativeRequestCost: nil, accepted: false,
                    reason: "does not fit with one complete conversation retained"))
                continue
            }
            let seconds = estimatedRequestSeconds(value)
            let cost = seconds / baseSeconds - 1
            var accepted = true
            var reason = String(format: "adds %.1f%% to a typical request", max(0, cost) * 100)
            if basePlan.mtpEnabled && !value.mtpEnabled {
                accepted = false
                reason = "turns speculative decoding off"
            } else if basePlan.decodeLookahead && !value.decodeLookahead {
                accepted = false
                reason = "turns the decode lookahead off"
            } else if cost > ContextPolicy.automaticRequestTimeTolerance + 1e-9 {
                accepted = false
                reason = String(format: "adds %.1f%% to a typical request, above the %.0f%% limit",
                    cost * 100, ContextPolicy.automaticRequestTimeTolerance * 100)
            }
            if accepted { chosen = max(chosen, window) }
            candidates.append(Candidate(window: window, plan: value, refusal: nil, requestSeconds: seconds,
                relativeRequestCost: cost, accepted: accepted, reason: reason))
        }
        return AutomaticContextWindow(window: chosen, candidates: candidates)
    }

    /// The window and plan a process uses. An explicit window is planned as
    /// given. The automatic window comes from the machine's tier and is then
    /// planned against live memory; when other apps hold too much for it right
    /// now, the next smaller candidate is used and the plan says so.
    public static func resolveContextWindow(
        _ choice: ContextWindowChoice, request: PlanRequest, on device: Machine,
        mtpAvailable: Bool = false, visionAvailable: Bool = false,
        runtimePolicy: RuntimeAllocationPolicy? = nil,
        decodeLookahead: DecodeLookaheadPlanning = .automatic
    ) throws -> (plan: MemoryPlan, automatic: AutomaticContextWindow?) {
        func live(_ window: Int, _ retention: ContextRetention) throws -> MemoryPlan {
            try plan(expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
                memoryGB: request.memoryGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                availableGB: device.availableGB, ramPercent: request.maxRAMPercent,
                mtp: request.mtp, mtpAvailable: mtpAvailable,
                vision: request.vision, visionAvailable: visionAvailable,
                maxContextTokens: window, simulated: device.isSimulated, qualification: false,
                runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead, retention: retention)
        }
        switch choice {
        case .tokens(let tokens):
            return (try live(tokens, .automatic), nil)
        case .automatic:
            let automatic = automaticContextWindow(request, on: device, mtpAvailable: mtpAvailable,
                visionAvailable: visionAvailable, runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead)
            let base = ContextPolicy.defaultTokens
            // A startup plan fixes the draft head for the life of the process
            // (the governor never loads or unloads it), so a busy start must
            // not trade speculative decoding for the larger window.
            let baseline = try live(base, .automatic)
            for window in ContextPolicy.automaticWindows.reversed() where window > base && window <= automatic.window {
                guard let value = try? live(window, .completeWindow),
                      value.mtpEnabled || !baseline.mtpEnabled,
                      value.decodeLookahead || !baseline.decodeLookahead else { continue }
                let notes = window < automatic.window ? [loweredNote(automatic.window, window, device)] : []
                return (value.addingNotes(notes), automatic)
            }
            let notes = automatic.window > base ? [loweredNote(automatic.window, base, device)] : []
            return (baseline.addingNotes(notes), automatic)
        }
    }

    private static func loweredNote(_ full: Int, _ used: Int, _ device: Machine) -> String {
        let reading = device.availableGB.flatMap { $0.isFinite ? String(format: " (%.1f GB reclaimable now)", $0) : nil } ?? ""
        return "automatic context window lowered from \(full) to \(used) tokens for this run: other apps hold memory\(reading), and the larger window would not fit or would turn speculative decoding off; restart after they release it for the full window"
    }
}
