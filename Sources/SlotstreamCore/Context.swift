// Context length: the cap, why it is what it is, and the prefill schedule that
// keeps a long prompt's transient memory inside what has been measured.

import Foundation

public enum ContextPolicy {
    /// Longest prompt plus reply any one request may hold, in tokens.
    ///
    /// This is the largest context slotstream has measured, not a limit of the
    /// model or the machine: the model is trained for 262,144 tokens and the
    /// state a context carries (KV plus indexer, 27 KiB per token) makes 32k
    /// under 1 GB. The planner's fixed footprint already covers a full 32k
    /// active context, and every peak-memory number in MEASUREMENTS.md comes
    /// from prompts of at most 7,960 tokens. Raising the cap is a two-step
    /// job: measure past 8k on real hardware (`slotstream context-check`), then
    /// let the planner charge the state above `tokensInFixedFootprint`.
    public static let maxTokens = 32_768
    /// Context the fixed footprint (Planner.fixedFootprintGB) already pays for.
    public static let tokensInFixedFootprint = 32_768

    /// nil when `tokens` is an acceptable --max-context, otherwise the reason.
    public static func validationError(_ tokens: Int) -> String? {
        if tokens >= 1, tokens <= maxTokens { return nil }
        return "--max-context must be between 1 and \(maxTokens): that ceiling is the "
            + "largest context slotstream has measured on this hardware, not a memory limit "
            + "(context state costs ~27 KiB per token). Measure a longer one with "
            + "`slotstream context-check --tokens N` before the ceiling moves; see README, Context."
    }
}

/// How a prompt is split into prefill passes.
///
/// A pass is faster the bigger it is (the expert stream is re-read roughly once
/// per pass), but the sparse-attention layers score every query token of the
/// pass against every key already in the context, so the pass's transient
/// memory grows with chunk × context, not with the chunk alone. Every number
/// the planner charges for a pass was measured with that product at most
/// `measuredQueryKeyProduct`. Past that point the schedule halves the pass
/// instead of letting the transient grow into space nothing has measured.
public enum PrefillSchedule {
    /// The largest query-by-key product any prefill measurement covered: a
    /// 4096-token pass finishing an 8,016-token prompt (MEASUREMENTS.md,
    /// "Prefill, second pass"). Do not raise it without a new measurement.
    public static let measuredQueryKeyProduct = 4096 * 8016
    /// Smallest pass. Below it the eviction scan can find no victim (the
    /// floor pool is sized for a 256-token pass), and the throughput anchors
    /// stop at 256.
    public static let minChunk = 256

    /// The pass to run when the state already holds `position` tokens and the
    /// plan allows `maxChunk`: halve from `maxChunk` until the product with
    /// the context the pass attends over is inside the measured bound, never
    /// below `minChunk`.
    public static func chunk(at position: Int, maxChunk: Int) -> Int {
        var c = max(minChunk, maxChunk)
        while c > minChunk, c * (max(0, position) + c) > measuredQueryKeyProduct {
            c = max(minChunk, c / 2)
        }
        return c
    }

    /// The passes that reading `tokens` new tokens from `position` runs.
    public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int) -> [Int] {
        var out: [Int] = []
        var pos = max(0, position)
        var left = max(0, tokens)
        while left > 0 {
            let c = min(chunk(at: pos, maxChunk: maxChunk), left)
            out.append(c)
            pos += c
            left -= c
        }
        return out
    }

    /// Seconds to read `tokens` new prompt tokens at this plan: the schedule's
    /// passes priced at the measured per-pass throughput anchors
    /// (Planner.estPrefillTokS). The last, partial pass is priced at the rate
    /// of the pass size it was cut from — slightly pessimistic, on purpose.
    public static func estSeconds(tokens: Int, from position: Int = 0, maxChunk: Int) -> Double {
        var secs = 0.0
        var pos = max(0, position)
        var left = max(0, tokens)
        while left > 0 {
            let full = chunk(at: pos, maxChunk: maxChunk)
            let c = min(full, left)
            secs += Double(c) / Planner.estPrefillTokS(chunk: full)
            pos += c
            left -= c
        }
        return secs
    }

    /// "18 s" / "1.2 min" / "1.5 h": the same rounding everywhere it is shown.
    public static func describe(seconds: Double) -> String {
        if seconds < 60 { return String(format: "%.0f s", seconds.rounded()) }
        if seconds < 3600 { return String(format: "%.1f min", seconds / 60) }
        return String(format: "%.1f h", seconds / 3600)
    }
}

/// Progress lines for a long prefill, shared by `run` (stderr) and `serve`
/// (its log). A prompt under `quietBelowTokens` prints nothing: the wait is
/// seconds and the lines would be noise.
public final class PrefillProgressReporter {
    public let quietBelowTokens: Int
    public let maxChunk: Int
    private let sink: (String) -> Void
    private var announced = 0  // total the running announcement was made for
    private var nextMark = 0.25
    private var lastLine = Date.distantPast

    public init(quietBelowTokens: Int, maxChunk: Int, sink: @escaping (String) -> Void) {
        self.quietBelowTokens = quietBelowTokens
        self.maxChunk = maxChunk
        self.sink = sink
    }

    /// Generator.onPrefillProgress: called after every pass with the tokens
    /// read so far this request, the tokens it will read, and elapsed seconds.
    public func report(done: Int, total: Int, elapsed: Double) {
        guard total >= quietBelowTokens, total > 0 else { return }
        if announced != total {
            announced = total
            nextMark = 0.25
            let eta = PrefillSchedule.estSeconds(tokens: total, maxChunk: maxChunk)
            sink("prefill: reading \(total) prompt tokens, ~\(PrefillSchedule.describe(seconds: eta)) "
                + "to the first token at this plan (follow-up turns read only what is new)")
        }
        if done <= 0 { return }
        let frac = Double(done) / Double(total)
        if done >= total {
            let rate = elapsed > 0 ? Double(total) / elapsed : 0
            sink(String(format: "prefill: done, %d tokens in %@ (%.0f tok/s)",
                        total, PrefillSchedule.describe(seconds: elapsed), rate))
            announced = 0
            return
        }
        // One line per quarter, never more often than every 5 s.
        guard frac >= nextMark, Date().timeIntervalSince(lastLine) >= 5 else { return }
        while nextMark <= frac { nextMark += 0.25 }
        lastLine = Date()
        let rate = elapsed > 0 ? Double(done) / elapsed : 0
        let left = rate > 0 ? Double(total - done) / rate : 0
        sink(String(format: "prefill: %d/%d tokens (%.0f%%), ~%@ left",
                    done, total, frac * 100, PrefillSchedule.describe(seconds: left)))
    }
}
