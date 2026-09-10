// Context length: the cap, why it is what it is, and the prefill schedule that
// keeps a long prompt's transient memory inside what has been measured.

import Foundation

public enum ContextPolicy {
    /// Pinned checkpoint configuration. This is independent of qualification.
    public static let modelLimit = 262_144
    /// Longest prompt plus reply any one request may hold, in tokens.
    ///
    /// The Hermes qualification read 65,520 prompt tokens plus a reply; the
    /// remainder is reserved reply room. This is a measured serving envelope,
    /// not the model's 262,144-token configured limit or an answer-quality claim.
    /// The larger requested window is priced before allocating the expert pool.
    /// See MEASUREMENTS.md, Hermes integration, for the initial budget failure
    /// and the planned-context qualification. Keep ordinary defaults unchanged.
    public static let maxTokens = 65_536
    public static let implementationLimit = maxTokens
    public static let mtpLimit = 65_536
    public static let visionLimit = 65_536
    public static let defaultTokens = 32_768
    /// Context the fixed footprint (Planner.fixedFootprintGB) already pays for.
    public static let tokensInFixedFootprint = 32_768

    package static func maximumDraftDepth(requested: Int, at consumed: Int, limit: Int) -> Int {
        guard requested >= 0, consumed >= 0, consumed <= limit,
              limit > 0, limit <= modelLimit else { return 0 }
        return min(requested, max(0, limit - consumed - 1))
    }

    /// nil when `tokens` is an acceptable --max-context, otherwise the reason.
    public static func validationError(_ tokens: Int) -> String? {
        validationError(tokens, qualification: false)
    }

    public static func validationError(_ tokens: Int, qualification: Bool) -> String? {
        let limit = qualification ? modelLimit : implementationLimit
        if (1 ... limit).contains(tokens) { return nil }
        return "--max-context must be between 1 and \(limit) (prompt plus reply). "
            + "The pinned model limit is \(modelLimit); the released implementation limit is "
            + "\(implementationLimit). A model limit does not guarantee memory fit or answer quality."
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
    /// Late-context passes use the existing small-pass pool path. Their cost
    /// stays unknown until a matching measurement has been registered.
    public static let minChunk = 64

    /// The pass to run when the state already holds `position` tokens and the
    /// plan allows `maxChunk`: halve from `maxChunk` until the product with
    /// the context the pass attends over is inside the measured bound, never
    /// below `minChunk`.
    public static func chunk(at position: Int, maxChunk: Int) -> Int {
        guard position >= 0, position < ContextPolicy.modelLimit else { return 0 }
        // Preserve the original 256-row dispatch while it fits. An odd
        // override such as 4095 must not halve through 511 to 255 inside the
        // existing serving window and silently select small-pass arithmetic.
        let floor = fits(256, at: position) ? 256 : minChunk
        var c = min(4096, max(floor, maxChunk))
        while c > floor, !fits(c, at: position) {
            c = max(floor, c / 2)
        }
        while c > 1, !fits(c, at: position) { c /= 2 }
        return fits(c, at: position) ? c : 0
    }

    /// Division avoids overflowing arbitrary diagnostic inputs. The accepted
    /// context ceiling is unchanged; within it even the minimum pass fits.
    public static func fits(_ count: Int, at position: Int) -> Bool {
        count > 0 && position >= 0 && position <= measuredQueryKeyProduct / count - count
    }

    /// Check the actual remaining rows before shrinking a hypothetical full
    /// pass. A 3,864-row tail after 4,096 fits the existing measured envelope.
    public static func next(remaining: Int, at position: Int, maxChunk: Int, tailAware: Bool) -> Int {
        guard remaining > 0 else { return 0 }
        guard position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return 0 }
        let candidate = min(remaining, min(4096, max(1, maxChunk)))
        if tailAware, fits(candidate, at: position) { return candidate }
        return min(remaining, chunk(at: position, maxChunk: maxChunk))
    }

    /// Group existing chronological compute passes without enlarging any
    /// query-by-key product. A scope shares reads; it is not a compute pass.
    public static func scopePasses(remaining: Int, at position: Int, maxChunk: Int,
                                   maxScope: Int, tailAware: Bool) -> [Int] {
        guard remaining > 0, position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return [] }
        var result: [Int] = [], count = 0
        let bound = max(minChunk, min(8192, maxScope))
        while count < remaining {
            let (pos, overflow) = max(0, position).addingReportingOverflow(count)
            guard !overflow else { break }
            let n = next(remaining: remaining - count, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            // A short final pass uses the reference cached kernel family;
            // keep it separate until swept short tails have their own gate.
            if n == 0 || (count > 0 && (n < SweepTuning.minTokens || n > bound - count)) { break }
            result.append(n); count += n
            if count >= bound { break }
        }
        return result
    }

    /// Candidate automatic policy: amortize a full-layer workspace over at
    /// least four identical, full matrix passes. Short/odd tails and a common
    /// prefix checkpoint keep their original dispatch. The actual scheduled
    /// pass may be smaller than the planner ceiling at a long context.
    package static func automaticScopePasses(remaining: Int, at position: Int,
                                            maxChunk: Int, checkpoint: Int?) -> [Int]? {
        guard (256 ... 4096).contains(maxChunk) else { return nil }
        let scheduled = chunk(at: position, maxChunk: maxChunk)
        guard [256, 512, 1024].contains(scheduled), scheduled >= SweepTuning.minTokens else { return nil }
        var proposed = scopePasses(remaining: remaining, at: position,
            maxChunk: maxChunk, maxScope: 4096, tailAware: false)
        if let checkpoint { proposed = preservingCheckpoint(proposed, from: position, checkpoint: checkpoint) }
        proposed = Array(proposed.prefix(while: { $0 == scheduled }))
        return proposed.count >= 4 ? proposed : nil
    }

    /// Prefer the largest useful read scope that fits the current budget.
    /// Every alternative is a prefix of the unchanged compute schedule and
    /// retains the four-pass minimum. There are at most thirteen choices.
    package static func automaticScopeChoices(remaining: Int, at position: Int,
                                             maxChunk: Int, checkpoint: Int?) -> [[Int]]? {
        guard let largest = automaticScopePasses(remaining: remaining, at: position,
            maxChunk: maxChunk, checkpoint: checkpoint) else { return nil }
        return stride(from: largest.count, through: 4, by: -1).map {
            Array(largest.prefix($0))
        }
    }

    /// End a read-sharing group at a requested checkpoint only when one of
    /// its existing compute passes already ends there. This preserves every
    /// arithmetic shape; an interior token never manufactures a new pass.
    package static func preservingCheckpoint(_ passes: [Int], from position: Int,
                                             checkpoint: Int) -> [Int] {
        guard position >= 0, checkpoint > position,
              checkpoint <= ContextPolicy.modelLimit else { return passes }
        var end = position
        for (index, count) in passes.enumerated() {
            guard count > 0, count <= ContextPolicy.modelLimit - end else { return passes }
            end += count
            if end == checkpoint { return Array(passes.prefix(index + 1)) }
            if end > checkpoint { return passes }
        }
        return passes
    }

    /// The passes that reading `tokens` new tokens from `position` runs.
    public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> [Int] {
        computePasses(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware).map(\.tokens)
    }

    public struct ComputePass: Sendable {
        public let tokens: Int
        public let queryRows: Int
        public let keyExtent: Int
    }

    /// Include the canonical late-context dispatch shape and masked columns,
    /// using the same bounded geometry as Generator. A nominal odd pass can
    /// shrink again for numerical alignment; diagnostics must report that.
    public static func computePasses(tokens: Int, from position: Int = 0,
                                     maxChunk: Int, tailAware: Bool = false) -> [ComputePass] {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return [] }
        var out: [ComputePass] = []
        var pos = position
        var left = tokens
        let end = position + tokens
        var referenceStart: Int?
        while left > 0 {
            var c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            let small = chunk(at: pos, maxChunk: 256) < 256
            if small {
                if referenceStart == nil { referenceStart = pos }
                c = ContextWorkspace.boundedSmallPass(requested: c, at: pos,
                    referenceStart: referenceStart!, referenceEnd: end)
            }
            guard c > 0 else { return [] }
            let extent = small ? ContextWorkspace.keyExtent(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : pos + c
            let queries = small ? ContextWorkspace.queryRows(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : c
            guard extent > 0, queries <= measuredQueryKeyProduct / extent else { return [] }
            out.append(ComputePass(tokens: c, queryRows: queries, keyExtent: extent))
            pos += c
            left -= c
        }
        return out
    }

    /// Seconds to read `tokens` new prompt tokens at this plan: the schedule's
    /// passes priced at the measured per-pass throughput anchors
    /// (Planner.estPrefillTokS). The last, partial pass is priced at the rate
    /// of the pass size it was cut from — slightly pessimistic, on purpose.
    public static func estSeconds(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> Double {
        estimateSeconds(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware) ?? .infinity
    }

    /// nil means there is no qualified throughput anchor for this schedule.
    public static func estimateSeconds(tokens: Int, from position: Int = 0, maxChunk: Int,
                                       tailAware: Bool = false) -> Double? {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return nil }
        var secs = 0.0
        var pos = max(0, position)
        var left = max(0, tokens)
        while left > 0 {
            let full = tailAware
                ? next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: true)
                : chunk(at: pos, maxChunk: maxChunk)
            let c = min(full, left)
            guard c > 0, full >= 256 else { return nil }
            secs += Double(c) / Planner.estPrefillTokS(chunk: full)
            pos += c
            left -= c
        }
        return secs
    }

    /// "18 s" / "1.2 min" / "1.5 h": the same rounding everywhere it is shown.
    public static func describe(seconds: Double) -> String {
        guard seconds.isFinite else { return "unknown (schedule not yet calibrated)" }
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
    public var maxChunk: Int
    private let sink: (String) -> Void
    private var announced = 0  // total the running announcement was made for
    private var announcedBase = -1
    private var nextMark = 0.25
    private var lastLine: UInt64 = 0
    public var tailAware = false

    public init(quietBelowTokens: Int, maxChunk: Int, sink: @escaping (String) -> Void) {
        self.quietBelowTokens = quietBelowTokens
        self.maxChunk = maxChunk
        self.sink = sink
    }

    /// Generator.onPrefillProgress: called after every pass with the tokens
    /// read so far this request, the tokens it will read, and elapsed seconds.
    public func report(done: Int, total: Int, elapsed: Double) {
        report(done: done, total: total, elapsed: elapsed, base: 0)
    }

    public func report(done: Int, total: Int, elapsed: Double, base: Int) {
        guard total >= quietBelowTokens, total > 0 else { return }
        if announced != total || announcedBase != base {
            announced = total
            announcedBase = base
            nextMark = 0.25
            let eta = PrefillSchedule.estSeconds(tokens: total, from: base, maxChunk: maxChunk, tailAware: tailAware)
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
        guard frac >= nextMark, lastLine == 0 || RuntimeClock.seconds(since: lastLine) >= 5 else { return }
        while nextMark <= frac { nextMark += 0.25 }
        lastLine = RuntimeClock.now()
        let rate = elapsed > 0 ? Double(done) / elapsed : 0
        let left = rate > 0 ? Double(total - done) / rate : 0
        sink(String(format: "prefill: %d/%d tokens (%.0f%%), ~%@ left",
                    done, total, frac * 100, PrefillSchedule.describe(seconds: left)))
    }
}
