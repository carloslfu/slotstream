---
type: run
id: 01m21tjmm184hgqbv10se0nwcr
created: 2026-09-09T00:55:07.137239+00:00
updated: 2026-09-09T00:55:07.598897+00:00
summary: Automatic scope scheduling, local execution controls and atomic memory fallback joined in an isolated draft
binary: Exact V402 source base plus uncompiled V416/V419/V422 deltas; unactivated
captured_at: 2026-09-08
command: Source implementation, exact V402 binding, patch apply and reverse reconstruction; no compiler/model launch
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Automatic scope scheduling, local execution controls and atomic memory fallback joined in an isolated draft
tool: Slotstream exact native and source qualification capture
---
V422 joins the V416 real native allocation-refusal checks and V419 atomic preferred/fallback reservations with actual Generator and Engine wiring. Its explicit-only automatic control groups at least four identical full 256/512/1024-token compute passes within 4096 tokens, considering the actual scheduled pass under a larger planner ceiling. Partial/short tails and scheduled prefix checkpoints remain chronological. Explicit experimental scopes, tail scheduling or workspace geometry take priority. Automatic selection requires a RequestController and prices the full conservative workspace plus state allocations before an atomic reservation choice. The Engine snapshots its current process target after vision/governor changes; observed footprint plus additional allocation must also fit that target and the device working set. It does not subtract potentially evictable buffers or grant a new empirical reserve credit.

A source review caught a concurrency problem in an initial draft that temporarily mutated the public model controls while other requests could read them during preparation. The preserved final draft instead passes a local option value through scoped execution, model forward, attention, kernel preparation and mixing. Public controls are never changed by automatic grouping. It restores the private MTP bounded-indexer setting before a direct speculative draft. The optional Codable property preserves older saved control sets; explicit controls can disable inherited automatic behavior. Public/integration defaults remain unchanged: automatic selection is not adopted.

Added unrun pure checks cover saved-control compatibility, overrides, supported compute ceilings, context boundaries, short/odd tails, checkpoint preservation and memory-limit edges. Expanded native lifecycle checks compare exact outputs, ordered routes, every retained state and teacher-forced continuation for 256/512/1024 compute; verify actual read reduction, cached-prefix reuse, short requests, process/live-memory fallback, cancellation, checked read error/retry, and public controls observed during router callbacks. Expanded MTP checks use aligned4096-token prompts followed by actual speculative decoding for the same three geometries. Original scope/MTP/vision and V416 cases remain.

Ten changed sources bind exactly to V402. Applying and reversing the patch reconstructs both byte identities exactly. These are source/preparation results only: no compiler or native/pure test ran, and no performance or default-activation gate is earned. The live V409 full fixed cohort and all prior evidence are unmodified. Actual serving benefit at all eligible geometries, the four-pass threshold and short/prefix guards still require qualification. Full vision, final composition and every original final campaign/delivery gate remain.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/Slotstream/Context.swift",
    "bytes": 15234,
    "sha256": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/Slotstream/ContextMemory.swift",
    "bytes": 17359,
    "sha256": "ec4100ee687775863d98f9a60b4fcbf28b21199d85536a2bb8e13cd11844ca05"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/Slotstream/Engine.swift",
    "bytes": 58593,
    "sha256": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/Slotstream/Generate.swift",
    "bytes": 78449,
    "sha256": "4436305f28ee0bac552d3936e15dc235202719cd141e6c76357d24bd2f5c0f67"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/Slotstream/Model.swift",
    "bytes": 56247,
    "sha256": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/Slotstream/Optimizations.swift",
    "bytes": 15366,
    "sha256": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/Slotstream/RequestControl.swift",
    "bytes": 15167,
    "sha256": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
    "bytes": 48809,
    "sha256": "bc5370d792576a35d8d00fdeba14311b99ebcd3589d5096b13b44b01f8c46ed7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
    "bytes": 80213,
    "sha256": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 20891,
    "sha256": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/Slotstream/Context.swift",
    "bytes": 14145,
    "sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/Slotstream/ContextMemory.swift",
    "bytes": 16671,
    "sha256": "cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/Slotstream/Engine.swift",
    "bytes": 58066,
    "sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/Slotstream/Generate.swift",
    "bytes": 75288,
    "sha256": "673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/Slotstream/Model.swift",
    "bytes": 54782,
    "sha256": "eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/Slotstream/Optimizations.swift",
    "bytes": 14292,
    "sha256": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/Slotstream/RequestControl.swift",
    "bytes": 12590,
    "sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
    "bytes": 33864,
    "sha256": "76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
    "bytes": 61362,
    "sha256": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 18500,
    "sha256": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/integration.patch",
    "bytes": 68055,
    "sha256": "c6fc17ec4ed519801817c9c6dd1ce44a5a97d91dc5f9a501e1e5b473e96480f8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/preparation.json",
    "bytes": 4926,
    "sha256": "dd1f90d81238b26e989cbb2301b7df05e1c92753156f1a00bd5b8323fd6f8401"
  }
]
```

## Artifact SHA-256 58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e

Encoding: `utf-8`. Original bytes: 15234.

````````````text
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

````````````

## Artifact SHA-256 ec4100ee687775863d98f9a60b4fcbf28b21199d85536a2bb8e13cd11844ca05

Encoding: `utf-8`. Original bytes: 17359.

````````````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = PlannerCostModel.fixedBytes
        poolBytes = ContextBytes.product(slots, Int(Geometry.recordBytes))
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, PlannerCostModel.prefillBytesPerToken)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? PlannerCostModel.mtpResidentBytes : 0
        visionResidentBytes = visionResident ? PlannerCostModel.visionResidentBytes : 0
        planningMarginBytes = PlannerCostModel.planningMarginBytes
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), PlannerCostModel.prefillBytesPerToken),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    /// The optional workspace must fit both actual reclaimable memory and
    /// the caller's process envelope. Never subtract a buffer merely because
    /// it could later be evicted; the observation must already exclude it.
    package static func fitsAutomaticScope(footprintBytes: Int, allocationBytes: Int,
                                          limitBytes: Int?) -> Bool {
        guard footprintBytes > 0, allocationBytes >= 0, allocationBytes < Int.max else { return false }
        guard let limitBytes else { return true }
        let total = ContextBytes.sum(footprintBytes, allocationBytes)
        return limitBytes > 0 && total < Int.max && total <= limitBytes
    }

    /// Additional buffers owned by the expert workspace, beyond ordinary
    /// compute-pass and retained-frontier allowances. Count replacement
    /// storage even if MLX can donate the old allocation on this dispatch.
    /// This is a conservative allocation reservation, not a process peak.
    package static func expertWorkspaceBytes(tokens: Int, tile: Int, experts: Int,
        topK: Int, hidden: Int, intermediate: Int, recordBytes: Int, loadBatch: Int,
        admissionPoolBytes: Int = 0, admissionRecords: Int = 0) -> Int {
        guard tokens > 0, tokens <= ContextPolicy.modelLimit,
              [256, 512, 1024, 2048, 4096].contains(tile),
              experts > 0, topK > 0, topK <= experts, hidden > 0, intermediate > 0,
              recordBytes > 0, loadBatch > 0, loadBatch <= experts,
              admissionPoolBytes >= 0, admissionRecords >= 0, admissionRecords <= experts,
              admissionRecords == 0 || admissionPoolBytes > 0 else { return Int.max }
        let weights = ContextBytes.product(experts, recordBytes)
        // Nine aligned managed buffers; reserve a second staging copy so
        // admission never depends on a particular no-copy upload decision.
        let staging = ContextBytes.sum(ContextBytes.product(loadBatch, recordBytes, 2), 9 * 16_384)
        let assembly = ContextBytes.sum(weights, staging)
        // Sweep admission can replace the decode pool while full workspace
        // weights and gathered hot records remain live.
        let admission = ContextBytes.sum(admissionPoolBytes,
            ContextBytes.product(admissionRecords, recordBytes))
        // workspaceRouted merges a residual tail only below 256 rows. Its
        // grouped matmul pads to at least four rows per expert (and 16).
        let liveTokens = min(tokens, tile + 255)
        let rows = max(ContextBytes.product(liveTokens, topK), ContextBytes.product(experts, 4), 16)
        // Original/padded gather, down, canonical and weighted outputs: five H-wide arrays.
        // Gate, up, SiLU and product: four FF-wide arrays. Charge FP32 for
        // every intermediate, plus CPU/GPU index copies. Reduced tiles and
        // their final concatenation coexist until the layer returns.
        let routed = ContextBytes.sum(ContextBytes.product(rows,
            ContextBytes.sum(ContextBytes.product(hidden, 5), ContextBytes.product(intermediate, 4)), 4),
            ContextBytes.product(rows, 64))
        let retained = ContextBytes.sum(ContextBytes.product(tokens, hidden, 8),
            ContextBytes.product(tokens, topK, 16), ContextBytes.product(tokens, experts, 8),
            ContextBytes.product(experts, 32))
        return ContextBytes.sum(weights, max(assembly, admission, routed), retained)
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}

````````````

## Artifact SHA-256 b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d

Encoding: `utf-8`. Original bytes: 58593.

````````````text
// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import CoreGraphics
import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// An assistant turn's reasoning, rendered as `reasoning_content`. Clients
    /// that keep reasoning in history can replay it; fx does not send any.
    public var reasoning: String?
    /// Calls this assistant turn made.
    public var toolCalls: [ParsedToolCall]
    /// For a `tool` message: which call it answers.
    public var toolCallId: String?
    public var toolName: String?
    /// Pictures this turn carries, as inline bytes (a `data:` URL or bare
    /// base64) in the order the template should render them. Text-only paths
    /// leave it empty and behave exactly as before.
    public var images: [String] = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
        self.reasoning = nil
        self.toolCalls = []
        self.toolCallId = nil
        self.toolName = nil
    }

    public init(
        role: String, content: String, reasoning: String? = nil,
        toolCalls: [ParsedToolCall] = [], toolCallId: String? = nil, toolName: String? = nil
    ) {
        self.role = role
        self.content = content
        self.reasoning = reasoning
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
        self.toolName = toolName
    }

    /// The dictionary the chat template consumes.
    ///
    /// Tool-call arguments are bridged as an unordered dictionary because
    /// swift-jinja accepts nothing else, so the template's `arguments|items`
    /// follows Swift's hash order. That is why a generated assistant turn is
    /// spliced back as raw ids rather than re-rendered (`PrefixCache`): a
    /// re-render is semantically identical but not byte-identical, and the
    /// prefix cache matches on bytes.
    public var templateValue: [String: any Sendable] {
        var m: [String: any Sendable] = ["role": role, "content": content]
        // The template checks each content part for an `image`/`image_url`
        // key, so a turn with pictures has to arrive as parts rather than a
        // string. Images first, then the text: that is the order the template
        // numbers them in ("Picture 1: ..."), and the order
        // `Engine.imageSources` reads them back in.
        if !images.isEmpty {
            var parts: [[String: any Sendable]] = images.map {
                ["type": "image_url", "image_url": ["url": $0] as [String: any Sendable]]
            }
            if !content.isEmpty { parts.append(["type": "text", "text": content]) }
            m["content"] = parts
        }
        if let r = reasoning, !r.isEmpty { m["reasoning_content"] = r }
        if !toolCalls.isEmpty {
            m["tool_calls"] = toolCalls.map { call in
                [
                    "type": "function",
                    "function": [
                        "name": call.name,
                        "arguments": call.arguments.mapValues { $0.any },
                    ] as [String: any Sendable],
                ] as [String: any Sendable]
            }
        }
        return m
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Lazily-loaded vision tower (VLM). Loaded on the first request that
    /// carries an image and then cached; see `ensureVisionTower`.
    public private(set) var visionTower: VisionTower?
    /// Whether this process will accept images at all (`--vision`). False
    /// makes every image request a 400 that says so, rather than a surprise
    /// gigabyte.
    public var visionAllowed = true
    /// Whether the checkpoint carries a tower at all, read once at startup so
    /// the fx catalogue and `/api/show` can answer without touching it.
    public private(set) var visionAvailable = false
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    private let contextLock = NSRecursiveLock()
    private var configuredContextTokens = ContextPolicy.defaultTokens
    private let allocatedContextTokens: Int
    private var contextAssignmentFailure: RequestFailure?
    public var maxContextTokens: Int {
        get { contextLock.withLock { configuredContextTokens } }
        set {
            contextLock.lock(); defer { contextLock.unlock() }
            if let why = ContextPolicy.validationError(newValue, qualification: currentPlan?.contextQualification ?? false) {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration, why); return
            }
            guard newValue <= allocatedContextTokens else {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration,
                    "context assignment exceeds this engine's allocated plan; construct a new Engine with a validated plan")
                return
            }
            contextAssignmentFailure = nil
            configuredContextTokens = newValue
            let capped = min(prefixCache.maxTokens, newValue)
            prefixCache.configure(maxTokens: capped)
            if let p = currentPlan {
                updatePlan(MemoryPlan(source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
                    availableGB: p.availableGB, clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled, visionEnabled: p.visionEnabled,
                    visionResidentReserved: p.visionResidentReserved, maxContextTokens: newValue,
                    notes: p.notes, runtimeAllocationPolicy: p.runtimeAllocationPolicy,
                    maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification))
            }
        }
    }

    /// Call when a complete request is accepted, before tokenization or images.
    public func beginRequest(connected: @escaping () -> Bool = { true }) throws -> RequestController {
        if let override = requestControllerOverride {
            let control = try override(); try control.attachReservations(requestReservations); return control
        }
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
        if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
        let configuration = try ContextConfiguration(maxContextTokens: maxContextTokens,
            maxPrefillWaitMinutes: currentPlan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: currentPlan?.contextQualification ?? false)
        let control = RequestController(configuration: configuration,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: currentPlan?.ramGB ?? Planner.deviceRAMGB()) * 1e9),
            connected: connected, pressure: { [weak self] in
                guard let self else { return true }
                return self.pressureBoundary.snapshot() != nil || self.osPressureLock.withLock { self.osPressure }
            })
        try control.attachReservations(requestReservations)
        return control
    }
    private let requestReservations = RequestMemoryReservations()

    // Package-only dependency seam for deterministic HTTP diagnostics. No wire
    // field or environment variable can install it.
    package var requestControllerOverride: (() throws -> RequestController)?

    public var contextPolicyJSON: [String: Any] {
        let plan = currentPlan
        return ["configured_window": maxContextTokens, "model_limit": ContextPolicy.modelLimit,
            "implementation_limit": ContextPolicy.implementationLimit,
            "mtp_limit": ContextPolicy.mtpLimit, "vision_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            "wait_scope": "accepted_request_to_first_model_token",
            "qualification": plan?.contextQualification ?? false,
            "allocation_available": planLock.withLock { allocationUnavailable == nil },
            "estimate_scope": "measured M5 Pro anchors; unknown for unqualified pass sizes"]
    }

    deinit { pressureMonitor?.cancel() }

    private var allocationUnavailable: RequestFailure?
    package func setAllocationUnavailable(_ failure: RequestFailure?) {
        planLock.withLock { allocationUnavailable = failure }
    }

    private let osPressureLock = NSLock()
    private var osPressure = false
    private var pressureMonitor: DispatchSourceMemoryPressure?

    /// Retained conversation state, so a follow-up turn re-prefills only what
    /// is new. See PrefixCache for the extend-only rule and the memory story.
    public let prefixCache: PrefixCache

    /// Release the retained conversation state. Takes the generation lock, so
    /// never call it from inside `generate`.
    public func dropPrefixCache() {
        withExclusive { prefixCache.drop() }
    }

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    ///
    /// The message names the cap for what it is. It used to tell people to
    /// raise --max-context, which cannot go past the ceiling the server was
    /// already at.
    public func contextError(promptTokens: Int) -> String? {
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { return contextAssignmentFailure.message }
        guard promptTokens < 0 || promptTokens > maxContextTokens else { return nil }
        return "context_length_exceeded: prompt is \(promptTokens) tokens, over the configured \(maxContextTokens)-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is \(ContextPolicy.modelLimit)."
    }
    /// The live memory plan (updated by the elastic governor on resize; nil
    /// for internal fixed-size uses). Guarded by its own lock so /api reads
    /// never block behind a running generation.
    private var _plan: MemoryPlan?
    private let planLock = NSLock()
    public var currentPlan: MemoryPlan? {
        planLock.lock()
        defer { planLock.unlock() }
        return _plan
    }
    public func updatePlan(_ p: MemoryPlan) {
        planLock.lock()
        _plan = p
        planLock.unlock()
    }

    private let lock = GenerationGate()
    package let pressureBoundary = PressureBoundary()
    // Immutable after startup, so the governor never reads mutable model
    // controls concurrently with a request changing its diagnostic options.
    package let responsiveGovernor: Bool

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
    }

    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        lock.tryWithExclusive(body)
    }

    /// Pool numbers for the metadata endpoints, published rather than read
    /// live. Reading SlotPool's mutable Swift arrays while the governor
    /// resizes is a data race, but taking the *generation* lock to avoid it
    /// made /api/tags and /api/ps block for the whole of a running request, so
    /// a client that polls either one saw a generating server as a hung one.
    private var _poolSnapshot: (slots: Int, slotsPerLayer: Double, poolBytes: Int) = (0, 0, 0)
    private let poolSnapshotLock = NSLock()

    public func poolSnapshot() -> (slots: Int, slotsPerLayer: Double, poolBytes: Int) {
        poolSnapshotLock.lock()
        defer { poolSnapshotLock.unlock() }
        return _poolSnapshot
    }

    /// Re-read the pool and publish it. **Call with the generation lock held**
    /// (inside `withExclusive`), which is where every resize already happens.
    public func publishPoolSnapshot() {
        let s = (model.pool.slots, model.pool.slotsPerLayer, model.pool.poolBytes)
        poolSnapshotLock.lock()
        _poolSnapshot = s
        poolSnapshotLock.unlock()
    }

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        // A plan made for a simulated machine may be printed and compared,
        // never loaded. Simulating memory the machine does not have still
        // allocates for real: on 2026-08-30 a simulated 60 GB drove a 25.4 GB
        // allocation and 39 GB of swap. The flag travels on the plan so this
        // cannot be forgotten at a call site.
        if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
        let context = try ContextConfiguration(maxContextTokens: plan?.maxContextTokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: plan?.contextQualification ?? false)
        guard poolSlots >= Geometry.floorSlots, poolSlots <= Geometry.totalRecords,
              plan == nil || plan?.slots == poolSlots else {
            throw SlotstreamError.invalidPlan("engine pool must match a supported memory plan")
        }
        let initialLedger = plan?.memoryLedger ?? ContextMemoryLedger(slots: poolSlots,
            context: context.maxContextTokens, chunk: 256,
            retentionTokens: Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            mtp: false, visionResident: false)
        let initial = RequestController(configuration: context,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: plan?.ramGB ?? Planner.deviceRAMGB()) * 1e9))
        try initial.check(nextAllocationBytes: initialLedger.expectedPeakBytes, phase: "model allocation")
        self.allocatedContextTokens = context.maxContextTokens
        self.configuredContextTokens = context.maxContextTokens
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0" && (plan?.runtimeAllocationPolicy?.prefixCacheEnabled ?? true))
        if let p = plan, p.runtimeAllocationPolicy != nil { prefixCache.setBudgetLimit(p.prefixCacheTokens) }
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.Memory.cacheLimit = 2 << 30
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        self.responsiveGovernor = model.optimizations.responsiveGovernor
        try model.validate()
        // Read from the index that is already open — no tensor is touched, and
        // nothing is allocated until an image actually arrives.
        self.visionAvailable = VisionTower.present(index: index)
        self.visionAllowed = plan?.visionEnabled ?? visionAvailable
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
        if let p = plan, p.runtimeAllocationPolicy != nil {
            generator.setPrefillBudgetCeiling(p.prefillChunk)
            generator.prefillChunk = p.prefillChunk
        }
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
        }
        if let mb = Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CACHE_MB"] ?? "") {
            generator.prefillCacheLimit = max(0, mb) << 20
        } else if let p = plan, p.expectedPeakGB <= 12 {
            generator.prefillCacheLimit = 512 << 20
        }
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        publishPoolSnapshot()
        let monitor = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
            queue: DispatchQueue(label: "slotstream.request-pressure"))
        monitor.setEventHandler { [weak self, weak monitor] in
            guard let self, let monitor else { return }
            self.osPressureLock.withLock { self.osPressure = !monitor.data.contains(.normal) }
        }
        monitor.resume(); pressureMonitor = monitor
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        try encodeChat(messages, tools: [], thinking: thinking, effort: nil)
    }

    /// Render a conversation that may declare tools and replay tool calls.
    ///
    /// `tools` empty renders no `<tools>` block at all, which is what the
    /// Ollama and OpenAI dialects pass, so their bytes are unchanged.
    public func encodeChat(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: Self.additionalContext(thinking: thinking, effort: effort))
    }

    /// Encode a conversation, substituting the exact ids this server generated
    /// for any assistant turn it can still prove it produced.
    ///
    /// Why this exists. The prefix cache matches on bytes, and it must: the GDN
    /// recurrent state is a fold over the tokens it consumed, with no inverse,
    /// so a state may only be extended by the very ids that built it. A client
    /// replaying history does not send those ids — it sends its own view of the
    /// turn, which the template then re-renders. Whenever that re-render
    /// differs by a single byte, the next turn rebuilds the whole prompt.
    ///
    /// With reasoning ON that is not an edge case, it is every turn: fx (and
    /// most clients) never echo reasoning back, so the re-render is missing the
    /// `<think>` block the model actually produced, and the state cannot match.
    /// Measured on this machine, a two-turn tool loop reused 303 of 325 tokens
    /// with reasoning off and 0 of 349 with it on — three and a half times the
    /// wall time for the identical second turn.
    ///
    /// The splice closes that. For each assistant turn, ask the cache whether it
    /// still holds a state whose ids begin with exactly the prompt that turn was
    /// generated from; if it does, the remainder of those ids *is* that turn,
    /// verbatim. Check that the remainder really describes the turn the client
    /// sent (same calls, same arguments, same text) and then use the held ids in
    /// place of the re-render, tokenizing only the conversation after it.
    ///
    /// Splitting the text at `<|im_end|>` is safe because it is an added token
    /// and therefore a hard tokenizer boundary: the suffix tokenizes identically
    /// whether or not the text before it is present. That is measured, not
    /// assumed — see the `chat-splice` check.
    ///
    /// Any mismatch anywhere falls back to the plain render, which is the
    /// behaviour that existed before. The splice can make a turn cheaper; it can
    /// never make one wrong.
    public func encodeChatSpliced(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        let full = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        guard prefixCache.enabled, messages.contains(where: { $0.role == "assistant" })
        else { return full }
        let fullText = tokenizer.decode(tokens: full, skipSpecialTokens: false)

        var spliced: [Int] = []  // ids exactly as the model saw or produced them
        var consumed = 0  // characters of fullText those ids already cover
        var didSplice = false

        func index(_ offset: Int) -> String.Index {
            fullText.index(fullText.startIndex, offsetBy: offset)
        }

        for k in messages.indices where messages[k].role == "assistant" {
            guard
                let headIds = try? encodeChat(
                    Array(messages[0..<k]), tools: tools, thinking: thinking, effort: effort)
            else { break }
            let headText = tokenizer.decode(tokens: headIds, skipSpecialTokens: false)
            guard fullText.hasPrefix(headText), headText.count >= consumed else { break }
            // The ids that produced turn k: what is already spliced, plus the
            // conversation between there and this turn's generation prompt.
            let bridge = String(fullText[index(consumed)..<index(headText.count)])
            let producer =
                spliced + (bridge.isEmpty ? [] : tokenizer.encode(text: bridge, addSpecialTokens: false))
            guard let entry = prefixCache.peek(extending: producer) else { break }
            let generated = Array(entry[producer.count...])
            let genText = tokenizer.decode(tokens: generated, skipSpecialTokens: false)
            guard Self.spliceDescribes(genText, messages[k], tools: tools) else { break }
            guard
                let end = fullText.range(
                    of: "<|im_end|>", range: index(headText.count)..<fullText.endIndex)
            else { break }
            spliced = entry
            consumed = fullText.distance(from: fullText.startIndex, to: end.lowerBound)
            didSplice = true
        }

        guard didSplice else { return full }
        let tail = String(fullText[index(consumed)...])
        return spliced + tokenizer.encode(text: tail, addSpecialTokens: false)
    }

    /// Does this generated text describe the assistant turn the client sent?
    ///
    /// Deliberately compares meaning rather than bytes: the client's copy has
    /// been through its own JSON round trip, so whitespace and argument order
    /// may differ, but the calls it reports must be the calls that were made.
    /// Reasoning is ignored — the client dropping it is the whole reason the
    /// splice is needed.
    public static func spliceDescribes(
        _ generated: String, _ message: ChatMessage, tools: [ToolDefinition]
    ) -> Bool {
        let (_, body) = ThinkSplitter.split(generated)
        let visible = body.isEmpty && !generated.contains("</think>") ? generated : body
        let events = ToolCallSplitter.parseAll(visible, tools: tools.map { $0.schema })
        var calls: [ParsedToolCall] = []
        var text = ""
        for e in events {
            switch e {
            case .toolCall(let c): calls.append(c)
            case .text(let t): text += t
            case .malformed: return false
            default: break
            }
        }
        guard calls.count == message.toolCalls.count else { return false }
        for (a, b) in zip(calls, message.toolCalls) {
            guard a.name == b.name, a.arguments == b.arguments else { return false }
        }
        // The text is compared after trimming only. A client that rewrites the
        // assistant's prose is describing a different turn, and re-rendering it
        // is then the correct answer.
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
            == message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func additionalContext(thinking: Bool, effort: String?) -> [String: any Sendable] {
        var ctx: [String: any Sendable] = ["enable_thinking": thinking]
        if let e = effort, thinking { ctx["reasoning_effort"] = e }
        return ctx
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [ToolDefinition] = [], effort: String? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        return try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: additionalContext(thinking: thinking, effort: effort))
    }

    /// OpenAI path: messages already contain image_url parts, and content may
    /// be String or [[String: Any]] (vision). The nested arrays must be
    /// bridged to the tokenizer's `[String: any Sendable]` messages or the
    /// vision parts are silently dropped before the Jinja template can render
    /// them as <|image_pad|>.
    public func encodeChatOpenAI(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> [Int] {
        func toSendable(_ v: Any) -> any Sendable {
            if let arr = v as? [[String: Any]] {
                return arr.map { d -> [String: any Sendable] in
                    var out: [String: any Sendable] = [:]
                    for (k, vv) in d { out[k] = toSendable(vv) }
                    return out
                } as any Sendable
            }
            if let d = v as? [String: Any] {
                var out: [String: any Sendable] = [:]
                for (k, vv) in d { out[k] = toSendable(vv) }
                return out as any Sendable
            }
            if let a = v as? [Any] {
                return a.map { toSendable($0) } as any Sendable
            }
            return v as any Sendable
        }
        let msgs: [[String: any Sendable]] = messages.map { dict in
            var m: [String: any Sendable] = [:]
            for (k, v) in dict { m[k] = toSendable(v) }
            return m
        }
        let toolSpecs: [[String: any Sendable]]? = tools?.map { dict in
            var t: [String: any Sendable] = [:]
            for (k, v) in dict { t[k] = toSendable(v) }
            return t
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: toolSpecs, additionalContext: ["enable_thinking": thinking])
    }

    // MARK: Vision

    /// Load the vision tower on first use, and only if the machine can spare
    /// it right now.
    ///
    /// **Under the generation lock, not a lock of its own.** Loading is
    /// ~0.9 GB of MLX arrays plus an `eval`; a private lock let that run on a
    /// connection thread while another request was mid-generation, which is
    /// exactly the concurrent GPU work every other allocation path in this
    /// file serializes. `withExclusive` is that serialization, and it also
    /// makes the availability reading below meaningful: nothing else can
    /// allocate between reading it and taking the memory.
    ///
    /// Replan before allocation so a target-driven process pays for the
    /// tower with expert capacity. Also require real machine headroom: an
    /// accounting allowance is not proof that physical memory is available.
    public func ensureVisionTower() throws -> VisionTower { try ensureVisionTower(request: nil) }

    public func ensureVisionTower(request: RequestController?, workspaceBytes: Int = 0) throws -> VisionTower {
        guard workspaceBytes >= 0 else {
            throw RequestFailure(.invalidConfiguration, "vision workspace bytes must be nonnegative")
        }
        guard visionAllowed else {
            throw SlotstreamError.vision(
                "this server was started with --vision off; images are not accepted")
        }
        if let request { try lock.lock(request: request) } else { lock.lock() }
        defer { lock.unlock() }
        return try { () throws -> VisionTower in
            try request?.check(nextAllocationBytes: visionTower == nil ? 1_900_000_000 : 0, phase: "vision tower allocation")
            if pressureBoundary.snapshot() != nil {
                let failure = RequestFailure(.insufficientMemory, "memory pressure interrupted image preparation; retry after the cache resizes")
                throw request?.fail(failure) ?? failure
            }
            let reservedPlan: MemoryPlan?
            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
            catch {
                let failure = RequestFailure(.insufficientMemory, "vision allocation cannot fit the current plan: \(error)")
                throw request?.fail(failure) ?? failure
            }
            if let charged = reservedPlan {
                let ledger = charged.memoryLedger
                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
                    max(ledger.prefillBytes, workspaceBytes))
                if let target = charged.targetGB, Double(peak) > target * 1e9 {
                    var failure = RequestFailure(.insufficientMemory,
                        "image attention workspace exceeds this process memory target; resize the image or raise --memory-gb")
                    failure.requiredBytes = peak
                    failure.availableBytes = target < Double(Int.max) / 1e9 ? Int(target * 1e9) : Int.max
                    throw request?.fail(failure) ?? failure
                }
            }
            try request?.check(nextAllocationBytes: workspaceBytes, phase: "vision workspace admission")
            if let vt = visionTower { return vt }
            let idx = try CheckpointIndex(dir: modelDir)
            guard VisionTower.present(index: idx) else {
                throw SlotstreamError.vision(
                    "this checkpoint has no vision tower — it is a text-only model")
            }
            let needGB = Double(VisionTower.residentBytes(index: idx)) / 1e9
            guard needGB <= Planner.visionResidentGB else {
                throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
            }
            if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                avail < needGB + Planner.visionLoadMarginGB
            {
                let failure = RequestFailure(.insufficientMemory, String(
                        format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                            + "right now — close other apps and retry, or restart with a lower "
                            + "--memory-gb so the tower fits",
                        needGB, avail))
                throw request?.fail(failure) ?? failure
            }
            if let p = reservedPlan {
                // The lock excludes generation and governor mutation. Shrink
                // releases the old arena before allocating the smaller one.
                model.pool.resize(to: p.slots)
                if p.runtimeAllocationPolicy != nil {
                    generator.setPrefillBudgetCeiling(p.prefillChunk)
                    prefixCache.setBudgetLimit(p.prefixCacheTokens)
                }
                generator.prefillChunk = min(generator.prefillChunk, p.prefillChunk)
                prefixCache.configure(maxTokens: min(prefixCache.maxTokens, p.prefixCacheTokens))
                MLX.Memory.clearCache()
                updatePlan(p)
                publishPoolSnapshot()
            }
            let vt = try VisionTower(index: idx)
            self.visionTower = vt
            return vt
        }()
    }

    /// Tokenize with vision expansion: each template image_pad is worth
    /// N_merged real tokens, so the template's single pad is expanded to a run
    /// of pads that the tower's embeddings will fill. Returns the expanded ids
    /// and a `VisionPrompt` when the request carries images, nil otherwise.
    ///
    /// The tower does not run here. The run lengths come from each image's
    /// dimensions, so the ids — and with them the prefix cache key — are ready
    /// before any pixels are read. `Generator.generate` asks the cache first
    /// and then encodes only the images that the reused state does not cover.
    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> ([Int], VisionPrompt?) {
        try encodeWithVision(messages: messages, tools: tools, thinking: thinking, request: nil)
    }

    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false,
        request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextBytes.sum(ContextInputMemory.bytes(messages), ContextInputMemory.bytes(tools ?? [])))
        let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages), request: request)
    }

    /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
    /// through the same template as `encodeChat` and then expands the same
    /// placeholders.
    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil
    ) throws -> ([Int], VisionPrompt?) {
        try encodeChatWithVision(messages, tools: tools, thinking: thinking, effort: effort, request: nil)
    }

    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil, request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: tools))
        let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images }, request: request)
    }

    /// Expand each `<|image_pad|>` the template rendered into the run of
    /// placeholders its image is worth, and describe the images for the tower
    /// and the prefix cache. Shared by every surface so they cannot drift.
    private func withImages(baseIds: [Int], sources: [String], request: RequestController? = nil) throws -> ([Int], VisionPrompt?) {
        defer { request?.releaseDispatchReservation() }
        try request?.check(phase: "prompt preparation")
        if sources.isEmpty { return (baseIds, nil) }
        let started = RuntimeClock.now()
        let observer = generator.footprintSampling ? FootprintSampler() : nil
        let vmBefore = generator.footprintSampling ? ProcessMemory.vmActivity() : nil
        var observationFinished = false
        defer { if !observationFinished { _ = observer?.finish() } }
        // Decode and hash first: it needs no tower, it is cheap next to one,
        // and a malformed picture should be a 400 before the process commits
        // 0.9 GB to a tower it may not otherwise need.
        var decoded: [(cg: CGImage, hash: ImageHash)] = []
        let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
        decoded.reserveCapacity(sources.count)
        for (i, source) in sources.enumerated() {
            try request?.check(nextAllocationBytes: min(source.utf8.count, VisionPreprocess.maxImageBytes * 2), phase: "image source decoding")
            do {
                let data = try VisionPreprocess.loadImageData(from: source)
                decoded.append(try sourceBatch.decode(data, request: request))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let decodedSeconds = RuntimeClock.seconds(since: started)
        let (visionConfig, pixelBounds) = try VisionTower.configuration(directory: modelDir)
        var items: [VisionPrompt.Item] = []
        items.reserveCapacity(decoded.count)
        var expandedCount = baseIds.count
        for (i, d) in decoded.enumerated() {
            try request?.check(phase: "image geometry")
            do {
                let plan = try VisionTower.plan(height: d.cg.height, width: d.cg.width,
                    cfg: visionConfig, bounds: pixelBounds)
                let (next, overflow) = expandedCount.addingReportingOverflow(plan.mergedTokens - 1)
                guard !overflow, next <= min(maxContextTokens, ContextPolicy.visionLimit) else {
                    throw RequestFailure(.contextLengthExceeded,
                        "image-expanded input exceeds the configured or qualified vision context; reduce the history or image count")
                }
                expandedCount = next
                items.append(VisionPrompt.Item(image: d.cg, plan: plan))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let towerStart = RuntimeClock.now()
        let workspace = items.map { ContextWorkspace.visionBytes(patches: $0.plan.patches,
            hidden: visionConfig.hiddenSize, heads: visionConfig.numHeads,
            queryTile: model.optimizations.visionQueryTile, padding: model.optimizations.visionAttentionPadding) }.max() ?? 0
        let vt = try ensureVisionTower(request: request, workspaceBytes: ContextBytes.sum(workspace, sourceBatch.chargedBytes))
        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
        // The template renders one `<|image_pad|>` per image; the tower
        // produces `mergedTokens` rows for it. Expanding the pad into a run of
        // that length is what makes the two line up, and it moves every token
        // after the first image — ids and segment offsets alike, in one sweep,
        // so a later prompt that extends this one keys identically.
        let imageId = model.cfg.imageTokenId
        let perImage = items.map { $0.plan.mergedTokens }
        var expanded: [Int] = []
        var segments: [ImageSegment] = []
        expanded.reserveCapacity(baseIds.count + perImage.reduce(0, +) - perImage.count)
        var imgIdx = 0
        for tok in baseIds {
            if tok == imageId, imgIdx < perImage.count {
                segments.append(
                    ImageSegment(
                        start: expanded.count, count: perImage[imgIdx], hash: decoded[imgIdx].hash))
                expanded.append(contentsOf: repeatElement(imageId, count: perImage[imgIdx]))
                imgIdx += 1
            } else {
                expanded.append(tok)
            }
        }
        // Both directions are checked. Too few placeholders means the template
        // did not render an image this code found; too many means something
        // else in the prompt tokenized to the placeholder id — a user who
        // typed the literal `<|image_pad|>`, for instance. Either way the rows
        // and the runs would not correspond, so the request stops here rather
        // than putting embeddings under the wrong tokens.
        guard imgIdx == items.count else {
            throw SlotstreamError.vision(
                "the chat template rendered \(imgIdx) image placeholders for \(items.count) "
                    + "images; slotstream cannot place the rest")
        }
        let placeholders = expanded.reduce(0) { $0 + ($1 == imageId ? 1 : 0) }
        guard placeholders == perImage.reduce(0, +) else {
            throw SlotstreamError.vision(
                "the prompt carries \(placeholders) image placeholder tokens but the images "
                    + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                    + "from the text")
        }
        guard expanded.count <= min(maxContextTokens, ContextPolicy.visionLimit) else {
            throw RequestFailure(.contextLengthExceeded, "image-expanded input exceeds the configured or qualified vision context limit")
        }
        let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
        prompt.preparationRequest = request
        prompt.preparationObservation = ImagePreparationObservation(
            seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
            towerReadySeconds: towerReadySeconds, sampledFootprint: observer?.finish(),
            vmBefore: vmBefore, vmAfter: generator.footprintSampling ? ProcessMemory.vmActivity() : nil,
            sourceDecodedImages: sourceBatch.decodedImages, sourceReusedImages: sourceBatch.reusedImages,
            sourceAdmissionBytes: sourceBatch.chargedBytes)
        observationFinished = true
        return (expanded, prompt)
    }

    /// Every image a request carries, in the order the chat template will
    /// render them: message by message, part by part, and Ollama's per-message
    /// `images` array after that message's content parts — which is where the
    /// template puts them too.
    public static func imageSources(in messages: [[String: Any]]) -> [String] {
        var out: [String] = []
        for m in messages {
            if let content = m["content"] as? [[String: Any]] {
                for part in content {
                    if let iu = part["image_url"] as? [String: Any], let u = iu["url"] as? String {
                        out.append(u)
                    } else if let u = part["image_url"] as? String {
                        out.append(u)
                    } else if let u = part["image"] as? String {
                        out.append(u)
                    }
                }
            }
            for b64 in (m["images"] as? [String] ?? []) { out.append(b64) }
        }
        return out
    }

    /// Earliest position at which any stop sequence occurs, or nil.
    private static func stopIndex(_ text: String, _ stops: [String]) -> String.Index? {
        var best: String.Index?
        for s in stops {
            if let r = text.range(of: s), best == nil || r.lowerBound < best! {
                best = r.lowerBound
            }
        }
        return best
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    ///
    /// Incremental detokenization consumes bounded groups of token ids, keeping
    /// incomplete UTF-8 bytes at the group boundary. Two rules matter:
    ///
    /// - Emission and stop holdback are by Unicode scalar, never Character. A
    ///   later token can contribute a scalar that merges into the grapheme
    ///   already sent (an emoji plus U+FE0F is still one Character).
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        generate(promptIds: promptIds, params: params, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        let requestStart = RuntimeClock.now()
        let control: RequestController
        do {
            if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
            if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
            control = try request ?? beginRequest()
            try control.attachReservations(requestReservations)
            guard control.configuration.maxContextTokens <= allocatedContextTokens else {
                throw RequestFailure(.invalidConfiguration, "request policy exceeds the allocated engine window")
            }
            if let why = contextError(promptTokens: promptIds.count) {
                throw RequestFailure(.contextLengthExceeded, why)
            }
            guard promptIds.count <= control.configuration.maxContextTokens else {
                throw RequestFailure(.contextLengthExceeded, "prompt exceeds this request's configured context window")
            }
            try lock.lock(request: control)
        } catch {
            var stats = GenStats(); stats.promptTokens = promptIds.count
            let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            if failure.code == .insufficientMemory, let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let queueSeconds = RuntimeClock.seconds(since: requestStart)
        let preparationSeconds = max(0, control.elapsedSeconds - queueSeconds)
        defer { control.releaseDispatchReservation(); lock.unlock() }
        var params = params.sanitized()
        // A queued request may acquire the lock before the waiting governor.
        // Refuse it before image encoding, cache checkout or GPU allocation.
        if let ticket = pressureBoundary.snapshot() {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.memoryPressureCancelled = true
            let failure = control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            stats.requestFailure = failure; stats.runtimeError = failure.message
            stats.finishReason = "error"
            stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let modeLimit = vision == nil ? ContextPolicy.modelLimit : ContextPolicy.visionLimit
        let effectiveWindow = min(maxContextTokens, control.configuration.maxContextTokens, modeLimit)
        guard promptIds.count <= effectiveWindow else {
            let failure = control.fail(RequestFailure(.contextLengthExceeded,
                "prompt exceeds the configured or qualified vision context window"))
            var stats = GenStats(); stats.promptTokens = promptIds.count
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.queueSeconds = queueSeconds; stats.preparationSeconds = preparationSeconds
            return ("", [], stats)
        }
        let room = max(0, effectiveWindow - promptIds.count)
        if room == 0 {
            if onAdmitted?() == false { control.cancel() }
            var stats = GenStats()
            if let failure = control.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message
            }
            stats.promptTokens = promptIds.count
            stats.finishReason = control.failure == nil ? "length" : "error"
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        // Context is prompt + completion, not two independent 32k allowances.
        params.maxTokens = min(params.maxTokens, room)
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var pendingIds: [Int] = []
        var withheld = ""
        var delivered = ""
        var lastTok = -1
        var clientGone = false
        var stopFound = false
        var firstTextSeconds: Double?
        var pressureObserved: PressureTicket?
        var pressureBoundarySeconds: Double?

        func observePressure() -> Bool {
            guard let ticket = pressureBoundary.snapshot() else { return false }
            control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            if pressureObserved == nil {
                pressureObserved = ticket
                pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            return true
        }

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
            if firstTextSeconds == nil { firstTextSeconds = RuntimeClock.seconds(since: requestStart) }
            return cb(tok, delta)
        }

        /// Feed a stable decoded piece through the stop-sequence holdback.
        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {
            withheld += piece
            if !stops.isEmpty, let cut = Self.stopIndex(withheld, stops) {
                _ = emit(String(withheld[..<cut]), tok)
                withheld = ""
                stopFound = true
                return false
            }
            let scalars = withheld.unicodeScalars
            let n = final ? scalars.count : max(0, scalars.count - holdBack)
            let delta = String(String.UnicodeScalarView(scalars.prefix(n)))
            withheld = String(String.UnicodeScalarView(scalars.dropFirst(n)))
            return emit(delta, tok)
        }

        /// Qwen's ByteLevel decoder is concatenative once a UTF-8 scalar is
        /// complete. Decode small bounded groups and retain four token bytes at
        /// the boundary; if the candidate still ends in U+FFFD, retain more.
        /// This makes streaming decode O(n), rather than decoding tokens 1...n
        /// after every generated token.
        func flushStablePrefix(_ tok: Int) -> Bool {
            guard !pendingIds.isEmpty else { return true }
            // Start from everything buffered and hand back one token at a time
            // while the decode still ends mid-scalar. Waiting for eight tokens
            // before the first flush and holding four back after it gave
            // clients one delta per four tokens, and no delta at all for a
            // reply shorter than eight; the byte-exactness this protects rests
            // on the replacement-character check below, not on the backlog.
            var n = pendingIds.count
            var piece = ""
            while n > 0 {
                piece = tokenizer.decode(
                    tokens: Array(pendingIds.prefix(n)), skipSpecialTokens: true)
                if !piece.hasSuffix("\u{FFFD}") { break }
                n -= 1
            }
            guard n > 0 else { return true }
            pendingIds.removeFirst(n)
            return feed(piece, final: false, tok: tok)
        }

        let needsIncrementalDecode = onToken != nil || !stops.isEmpty
        let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
            control.sampledFirstToken()
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            // A pressure event can arrive inside a client callback. This is
            // already a supported committed-emission boundary in both decode
            // paths; do not spend another forward before observing it.
            return ok && !observePressure()
        } : { _ in control.sampledFirstToken(); return !observePressure() }

        // Snapshot after any vision reservation/governor resize, while this
        // request owns the generation gate. Keep explicit process targets and
        // the device working set separate from reclaimable-memory admission.
        generator.readScopeFootprintLimitBytes = currentPlan.flatMap { plan in
            let limit = min(plan.targetGB ?? plan.expectedPeakGB, plan.workingSetGB)
            return limit.isFinite && limit > 0 && limit < Double(Int.max) / 1e9
                ? Int(limit * 1e9) : 0
        }
        var (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            vision: vision,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                if observePressure() { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler, request: control, onAdmitted: onAdmitted)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, control.failure == nil, stats.runtimeError == nil, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        stats.queueSeconds = queueSeconds
        stats.preparationSeconds = preparationSeconds
        stats.memoryPressureCancelled = pressureObserved != nil
        if pressureObserved != nil {
            stats.runtimeError = stats.runtimeError
                ?? "memory pressure interrupted inference; retry after the cache resizes"
            stats.finishReason = "error"
        }
        stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
        stats.firstTextSeconds = firstTextSeconds
        if let failure = control.failure {
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            // A request guard can see the ticket before the legacy continuation
            // callback runs. Preserve the same observed boundary in that path.
            if failure.code == .insufficientMemory, stats.memoryPressureBoundarySeconds == nil,
               let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            prefixCache.drop()
            Stream.gpu.synchronize()
            MLX.Memory.clearCache()
        }
        stats.requestSeconds = control.elapsedSeconds
        return (text, ids, stats)
    }
}

````````````

## Artifact SHA-256 4436305f28ee0bac552d3936e15dc235202719cd141e6c76357d24bd2f5c0f67

Encoding: `gzip+base64`. Original bytes: 78449.

````````````text
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
````````````

## Artifact SHA-256 1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4

Encoding: `utf-8`. Original bytes: 56247.

````````````text
// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    /// All recurrent state and complete-prompt logits belong to this loaded model, even
    /// when another model has the same vocabulary and cache geometry.
    package let promptCheckpointIdentity = UUID()
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    public let pool: SlotPool
    public let ngram: NgramStore
    public var optimizations: InferenceOptimizations
    /// Only the bounded long-context prefill path selects this arithmetic.
    /// Kept outside the independent optimization candidate bundle.
    package var smallPrefillSweep = false
    package var smallPrefillReferenceStart = 0
    package var smallPrefillReferenceEnd = ContextPolicy.modelLimit
    package var alignSmallReferenceDispatch = false
    package var stableSmallPrefillRouting = false
    package var stableSmallPrefillAttention = false
    package var stableSmallPrefillProjections = false
    public var paddedSmallKeyDomains: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallKeyDomains } }
    public var paddedSmallQueryRows: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallQueryRows } }
    public var smallPrefillSweeps: Int { moe.values.reduce(0) { $0 + $1.smallPrefillSweeps } }
    public var residentExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.residentPrelaunches } }
    public var residentExpertJoins: Int { moe.values.reduce(0) { $0 + $1.residentJoins } }
    public var residentExpertJoinSeconds: Double { moe.values.reduce(0) { $0 + $1.residentJoinSeconds } }
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    /// Lazy dispatch counters; GPU completion is established by evaluated outputs,
    /// never inferred from these scheduled-operation counts alone.
    public var fusedRoPERotationsScheduled: Int { rope.fusedRotationsScheduled }
    public var ropeTableHits: Int { rope.tableHits }
    public var ropeTableBuilds: Int { rope.tableBuilds }
    public var fusedGDNProjectionsScheduled: Int { gdn.values.reduce(0) { $0 + $1.fusedProjectionsScheduled } }
    func prepareOptimizationKernels(using executionOptions: InferenceOptimizations? = nil) {
        let optimizations = executionOptions ?? self.optimizations
        for layer in gdn.values { layer.fuseInputProjection = optimizations.fusedGDNProjection }
        rope.sharedTables = optimizations.sharedRoPE
        rope.fusedRotation = optimizations.fusedRoPE && PartialRotation.prepare()
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.cpuSlotWrites = optimizations.cpuSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)?
    package var contextNumericsObserver: ((Int, String, MLXArray) -> Void)?
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var modelIdentity: UUID?
        package var ownerModelIdentity: UUID? { modelIdentity }
        let checkpointIdentity = UUID()
        var checkpointLifetimes: [WeakStateCheckpointLifetime] = []
        var recordingEnabled = false
        var recordedTokenIds: [Int]?
        var recordingBaseTokenCount: Int?
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        // A failed low-level forward can change early layers while tokenCount
        // still names the preceding boundary. Count alone cannot certify reuse.
        var committedBoundaryValid = true
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        public init() {}
    }

    public convenience init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        try self.init(index: index, poolSlots: poolSlots, runLayers: runLayers, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil, embeddingRowCache: Bool?,
                 packGDNProjections: Bool? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index, embeddingRowCache: embeddingRowCache,
            packGDNProjections: packGDNProjections ?? optimizations.fusedGDNProjection)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
    }

    /// Bound the next physical sequence allocations, keeping main, draft,
    /// raw-indexer and pooled-indexer capacity separate. Rollback retains spare
    /// rows, but they can only be reused by the buffer that actually owns them.
    package func sequenceAllocationBytes(tokens: Int, draftTokens: Int?, state: State,
                                         sharedBacking: Bool = false) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit,
              draftTokens.map({ $0 >= 0 && $0 <= ContextPolicy.modelLimit }) ?? true else { return Int.max }
        let kvRowBytes = ContextBytes.product(cfg.numKVHeads, cfg.headDim, 2)
        let indexRowBytes = ContextBytes.product(cfg.indexerHeadDim, 2)
        func bytes(_ end: Int, kv: KVCache?, index: IndexerCache?, compact: Bool) -> Int {
            func replacement(_ count: Int, _ rowBytes: Int, _ owned: Int, step: Int = 1024) -> Int {
                ContextGeometry.nextBufferAllocationBytes(tokens: count, rowBytes: rowBytes,
                    allocatedBytes: sharedBacking ? 0 : owned, step: step)
            }
            let rawBase = index?.rawBase ?? 0
            guard end >= rawBase else { return Int.max }
            var result = ContextBytes.sum(
                replacement(end, kvRowBytes, kv?.keys?.nbytes ?? 0),
                replacement(end, kvRowBytes, kv?.values?.nbytes ?? 0),
                replacement(end - rawBase, indexRowBytes, index?.rawAllocatedBytes ?? 0,
                    step: compact && rawBase > 0 ? 256 : 1024))
            if end > cfg.indexerBudget, optimizations.incrementalIndexer || compact {
                let blocks = end / cfg.indexerCompressRatio
                result = ContextBytes.sum(result, replacement(blocks, indexRowBytes,
                    index?.pooledAllocatedBytes ?? 0, step: 256))
                if compact {
                    let first = min(blocks * cfg.indexerCompressRatio,
                        max(0, end - 32) / cfg.indexerCompressRatio * cfg.indexerCompressRatio)
                    if first - rawBase >= 256 {
                        // Compaction also creates a fresh small tail before
                        // releasing its parent; it is not a pre-allocation credit.
                        result = ContextBytes.sum(result, replacement(end - first, indexRowBytes, 0, step: 256))
                    }
                }
            }
            return result
        }
        var total = 0
        for layer in 0 ..< runLayers where cfg.layerTypes[layer] != "linear_attention" {
            let index = state.indexer[layer]
            total = ContextBytes.sum(total, bytes(tokens, kv: state.kv[layer], index: index,
                compact: index?.compactRaw ?? optimizations.compactIndexerRaw))
        }
        if let draftTokens {
            total = ContextBytes.sum(total, bytes(draftTokens, kv: state.mtp?.kv,
                index: state.mtp?.indexer, compact: state.mtp?.indexer.compactRaw ?? false))
        }
        return total
    }

    public func makeState() -> State {
        let s = State()
        s.modelIdentity = promptCheckpointIdentity
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func validateForward(_ ids: [Int], state: State) throws {
        guard !ids.isEmpty, ids.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }) else {
            throw ModelError("model forward requires a nonempty sequence of valid token IDs")
        }
        guard state.committedBoundaryValid else {
            throw ModelError("model state has an incomplete forward; restore a committed checkpoint or create a new state")
        }
        // State() and tokenCount are public API. Reject an uninitialized,
        // incompatible or offset-corrupted state before changing any cache;
        // otherwise QSA's required cache access can trap after early layers
        // have already advanced. MTP alignment is intentionally checked by
        // its own lifecycle: target verification may have a provisional head.
        guard state.modelIdentity == promptCheckpointIdentity,
              state.tokenCount >= 0, ids.count <= Int(Int32.max),
              state.tokenCount <= Int(Int32.max) - ids.count,
              state.linear.count == gdn.count,
              state.kv.count == qsa.count, state.indexer.count == qsa.count,
              gdn.keys.allSatisfy({ state.linear[$0] != nil }),
              qsa.keys.allSatisfy({ state.kv[$0]?.offset == state.tokenCount
                  && state.indexer[$0]?.offset == state.tokenCount }) else {
            throw ModelError("model state is uninitialized, incompatible or offset-inconsistent; use makeState() or restore a committed checkpoint")
        }
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti, executionOptions: InferenceOptimizations? = nil
    ) throws -> MLXArray? {
        let optimizations = executionOptions ?? self.optimizations
        try validateForward(ids, state: state)
        state.recordedTokenIds = state.recordingEnabled ? ids : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        let S = ids.count
        let referenceRows: Int
        if alignSmallReferenceDispatch, smallPrefillSweep, state.tokenCount >= smallPrefillReferenceStart,
           state.tokenCount < smallPrefillReferenceEnd {
            let blockStart = smallPrefillReferenceStart + ((state.tokenCount - smallPrefillReferenceStart) / 256) * 256
            referenceRows = min(256, smallPrefillReferenceEnd - blockStart)
        } else { referenceRows = 256 }
        let projectionRows = stableSmallPrefillProjections && smallPrefillSweep && S < referenceRows ? referenceRows : 0
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        let terminalLastQuery = terminalPruning && optimizations.terminalLastQuery && demand == .lastRow
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        // A workspace holds a full layer of expert weights while reducing
        // routed tiles. Freed MLX buffers must not coexist with that live
        // allocation: its cache limit admits one last whole buffer and can
        // overshoot the requested byte limit. Clear only disposable buffers;
        // expert residency, tensor shapes and evaluation order stay intact.
        let savedWorkspaceCacheLimit = optimizations.layerExpertWorkspace && S >= SweepTuning.minTokens
            ? MLX.Memory.cacheLimit : nil
        if savedWorkspaceCacheLimit != nil {
            MLX.Memory.cacheLimit = 0
            MLX.Memory.clearCache()
        }
        defer {
            if let savedWorkspaceCacheLimit { MLX.Memory.cacheLimit = savedWorkspaceCacheLimit }
        }
        prepareOptimizationKernels(using: optimizations)
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        var h0 = try resident.embedChecked(ids, shape: [1, S]).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            moe[l]!.overlapResident = optimizations.overlapResidentExperts
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            attnHC[l].minimumProjectionRows = projectionRows
            mlpHC[l].minimumProjectionRows = projectionRows
            gdn[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.indexer.minimumProjectionRows = projectionRows
            ple[l]?.minimumProjectionRows = projectionRows
            moe[l]!.minimumProjectionRows = projectionRows
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let lastQuery = terminalLastQuery && l == runLayers - 1
                    if lastQuery && hi < S {
                        // Earlier tiles contribute only persistent keys. Keep
                        // each original PLE/HC/projection compute shape.
                        var hidden = h[0..., lo ..< hi, 0...]
                        if let p = ple[l] {
                            p.boundedTokens = true
                            hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + hi]),
                                nNew: hi - lo, cache: state.linear[l])
                        }
                        qsa[l]!.appendKeysOnly(attnHC[l](hidden).0, rope: rope,
                            cache: state.kv[l]!, idxCache: state.indexer[l]!)
                        if shouldContinue?() == false { return nil }
                        continue
                    }
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state,
                        lastQueryOnly: lastQuery, executionOptions: optimizations)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = routerObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let row = input.dim(1) - 1
                    let output = try moe[l]!(input[0..., row..., 0...])
                    h = base[0..., row..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., row..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                    if terminalLastQuery { terminalQueryRowsSkipped += S - input.dim(1) }
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            contextNumericsObserver?(l, "x1", x1)
            contextNumericsObserver?(l, "inj1", inj1!)
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.stableSmallKeyDomain = stableSmallPrefillAttention && smallPrefillSweep
                qsa[l]!.smallReferenceStart = smallPrefillReferenceStart
                qsa[l]!.smallReferenceEnd = smallPrefillReferenceEnd
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!,
                    lastQueryOnly: terminalLastQuery && l == runLayers - 1)
            }
            contextNumericsObserver?(l, "attn", attnOut)
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            let lastQuery = terminalLastQuery && l == runLayers - 1
            let attentionInjection: MLXArray
            if lastQuery {
                let first = S - attnOut.dim(1)
                h = h[0..., first..., 0...]
                attentionInjection = inj1![0..., first..., 0...]
                terminalQueryRowsSkipped += first
            } else { attentionInjection = inj1! }
            h = h + (attnOut.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            contextNumericsObserver?(l, "hAfterAttn", h)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let mlpRow = h.dim(1) - 1
            let x2 = pruneLastMoE ? fullMLPInput[0..., mlpRow..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., mlpRow..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., mlpRow..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            contextNumericsObserver?(l, "x2", x2)
            contextNumericsObserver?(l, "inj2", inj2!)
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = routerObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            // A canonical terminal pass shorter than 256 uses the pool path.
            // Its smaller subpasses must preserve that expert arithmetic too.
            moe[l]!.smallPrefillSweep = smallPrefillSweep && referenceRows == 256
            moe[l]!.routerProjection.minimumRows = stableSmallPrefillRouting && smallPrefillSweep && S < referenceRows ? referenceRows : 0
            if let observe = contextNumericsObserver {
                moe[l]!.contextNumericsObserver = { name, value in observe(l, name, value) }
            } else { moe[l]!.contextNumericsObserver = nil }
            let moeOut = try moe[l]!(x2)
            contextNumericsObserver?(l, "moe", moeOut)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        state.committedBoundaryValid = true
        return h
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil,
                          executionOptions: InferenceOptimizations? = nil) -> MLXArray {
        let optimizations = executionOptions ?? self.optimizations
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State,
                                       lastQueryOnly: Bool = false, executionOptions: InferenceOptimizations? = nil)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        let optimizations = executionOptions ?? self.optimizations
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!, lastQueryOnly: lastQueryOnly)
        }
        let attentionInjection: MLXArray
        if lastQueryOnly {
            let first = h.dim(1) - attention.dim(1)
            h = h[0..., first..., 0...]
            attentionInjection = inject![0..., first..., 0...]
        } else { attentionInjection = inject! }
        h = h + (attention.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?, executionOptions: InferenceOptimizations? = nil)
        throws -> (logits: MLXArray?, committed: Bool) {
        // Automatic grouping supplies a request-local execution value. The
        // public configuration stays immutable while other requests prepare.
        let optimizations = executionOptions ?? self.optimizations
        // The next speculative draft can call its head directly, without a
        // main-model forward to refresh private module flags. Restore the
        // only MTP dispatch flag changed by automatic workspace selection.
        let configuredBoundedIndexer = self.optimizations.boundedIndexer
        defer {
            if executionOptions != nil, optimizations.boundedIndexer != configuredBoundedIndexer {
                mtpHead?.attn.boundedIndexer = configuredBoundedIndexer
            }
        }
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        try validateForward(ids, state: state)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand, executionOptions: optimizations) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = try head.consumeChecked(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil, executionOptions: optimizations)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var lifetime: StateCheckpointLifetime
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var committedBoundaryValid: Bool
    var mtpBoundaryValid: Bool
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        checkpointLifetimes.removeAll { $0.value == nil }
        let lifetime = StateCheckpointLifetime(owner: checkpointIdentity, tokens: tokenCount,
            mtpOffset: mtp?.offset ?? 0)
        checkpointLifetimes.append(WeakStateCheckpointLifetime(lifetime))
        return StateCheckpoint(
            lifetime: lifetime, conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            committedBoundaryValid: committedBoundaryValid,
            mtpBoundaryValid: mtp == nil || hasValidMTP
                || (tokenCount == 0 && mtp?.offset == 0 && lastMulti == nil),
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        recordingEnabled = on
        recordedTokenIds = nil
        recordingBaseTokenCount = nil
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        do { try rollbackChecked(keeping: n, of: ids, from: c, ngramWindow: ngramWindow) }
        catch { preconditionFailure("\(error)") }
    }

    /// Recover only the recorded pass on this state; reject invalid input before mutation.
    public func rollbackChecked(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) throws {
        try validateRollback(keeping: n, ids: ids, checkpoint: c, ngramWindow: ngramWindow)
        if n < ids.count {
            for (_, cache) in linear {
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        invalidateCheckpoints(after: tokenCount, mtpOffset: nil)
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        do { try restoreChecked(c) }
        catch { preconditionFailure("\(error)") }
    }

    /// Restore a live ancestor checkpoint from this exact state. KV storage is
    /// append-only, so snapshots from discarded future branches cannot be reused.
    public func restoreChecked(_ c: StateCheckpoint) throws {
        try validateCheckpoint(c)
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        committedBoundaryValid = c.committedBoundaryValid
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
        invalidateCheckpoints(after: tokenCount, mtpOffset: c.mtpOffset)
        setRecording(false)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}

````````````

## Artifact SHA-256 898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce

Encoding: `utf-8`. Original bytes: 15366.

````````````text
import Foundation

/// Explicit controls for independently evaluated execution paths. The public
/// initializer is the reference; environment resolution selects the deployment
/// family and applies explicit overrides. Experimental paths remain disabled.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    /// Optional for backward-compatible decoding of saved control sets.
    /// Automatic grouping preserves the ordinary chronological fallback and
    /// requires a request memory controller. Explicit read scopes take priority.
    public var automaticReadScope: Bool? = nil
    public var reuseFirstMTPEntry = false
    /// Experimental shortening changes verification shapes and can change
    /// greedy output. Excluded from the combined candidate; sampled requests
    /// retain their original shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// Joint execution family used by deployment selection and its diagnostics.
    /// The public initializer remains the explicit reference. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Select the automatically deployed family with the measured kernel
    /// qualification boundary. Explicit controls can qualify another platform;
    /// kernel initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: deploymentCandidate())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        // Manual scope controls suppress an inherited automatic policy. An
        // explicit AUTO_READ_SCOPE=1 requests policy selection over that base;
        // explicit nonzero read scopes still retain their original semantics.
        let manualScopeKeys = ["SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_READ_SCOPE",
            "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES",
            "SLOTSTREAM_OPT_WORKSPACE_TILE", "SLOTSTREAM_OPT_SCOPE_FRONTIER",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES"]
        let inheritedAutomatic = result.automaticReadScope == true
            && !manualScopeKeys.contains(where: { env[$0] != nil })
        result.automaticReadScope = try flag("SLOTSTREAM_OPT_AUTO_READ_SCOPE",
            fallback: inheritedAutomatic) ? true : nil
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

## Artifact SHA-256 69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d

Encoding: `utf-8`. Original bytes: 15167.

````````````text
import Foundation

public struct ContextConfiguration: Sendable, Equatable {
    public static let defaultWaitMinutes = 30.0
    public let maxContextTokens: Int
    public let maxPrefillWaitMinutes: Double
    /// Explicit diagnostic qualification, never inferred from a mutable cap.
    public let qualification: Bool

    public init(maxContextTokens: Int = ContextPolicy.defaultTokens,
                maxPrefillWaitMinutes: Double = defaultWaitMinutes,
                qualification: Bool = false) throws {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) {
            throw RequestFailure(.contextLengthExceeded, why)
        }
        guard maxPrefillWaitMinutes.isFinite, maxPrefillWaitMinutes >= 0,
              maxPrefillWaitMinutes <= Double(UInt64.max) / 60 / 1e9 else {
            throw RequestFailure(.invalidConfiguration,
                "--max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy")
        }
        self.maxContextTokens = maxContextTokens
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.qualification = qualification
    }
}

public struct RequestFailure: Error, CustomStringConvertible, Codable, Sendable, Equatable {
    public enum Code: String, Codable, Sendable {
        case contextLengthExceeded = "context_length_exceeded"
        case invalidConfiguration = "invalid_configuration"
        case prefillWaitExceeded = "prefill_wait_exceeded"
        case insufficientMemory = "insufficient_memory"
        case prefillDeadlineExceeded = "prefill_deadline_exceeded"
        case clientCancelled = "client_cancelled"
        case inferenceError = "inference_error"
    }
    public let code: Code
    public let message: String
    public var elapsedSeconds: Double?
    public var limitSeconds: Double?
    public var estimatedSeconds: Double?
    public var requiredBytes: Int?
    public var availableBytes: Int?
    public init(_ code: Code, _ message: String) { self.code = code; self.message = message }
    public var description: String { message }
    public var httpStatus: String {
        switch code {
        case .contextLengthExceeded, .invalidConfiguration, .prefillWaitExceeded: return "400 Bad Request"
        case .insufficientMemory, .prefillDeadlineExceeded: return "503 Service Unavailable"
        case .clientCancelled: return "499 Client Closed Request"
        case .inferenceError: return "500 Internal Server Error"
        }
    }
    public var json: [String: Any] {
        var result: [String: Any] = ["code": code.rawValue, "type": code.rawValue, "message": message]
        if let elapsedSeconds { result["elapsed_seconds"] = elapsedSeconds }
        if let limitSeconds { result["limit_seconds"] = limitSeconds }
        if let estimatedSeconds { result["estimated_seconds"] = estimatedSeconds }
        if let requiredBytes { result["required_bytes"] = requiredBytes }
        if let availableBytes { result["available_bytes"] = availableBytes }
        return result
    }
}

/// Atomic admission for allocations that concurrent accepted requests have
/// reserved but may not have materialized yet. Retained preparation stays
/// charged until its controller is released, including time in the queue.
package final class RequestMemoryReservations: @unchecked Sendable {
    private let lock = NSLock()
    private var entries: [UUID: [String: Int]] = [:]
    package init() {}
    package var reservedBytes: Int { lock.withLock { entries.values.reduce(0) { ContextBytes.sum($0, $1.values.reduce(0) { ContextBytes.sum($0, $1) }) } } }
    package func release(_ id: UUID) { lock.withLock { _ = entries.removeValue(forKey: id) } }
    package func releaseDispatch(_ id: UUID) { lock.withLock { entries[id]?["dispatch"] = nil } }

    package func check(_ id: UUID, kind: String?, bytes: Int, slack: Int,
                       available: () -> Double?, phase: String) throws {
        _ = try select(id, kind: kind, allocations: [bytes], slack: slack,
            available: available, phase: phase)
    }

    /// Selection and ownership are one transaction. A rejected preferred
    /// workspace must neither poison the request nor reserve its bytes.
    package func chooseDispatch(_ id: UUID, preferredBytes: Int, fallbackBytes: Int,
                                slack: Int, available: () -> Double?, phase: String) throws -> Bool {
        try select(id, kind: "dispatch", allocations: [preferredBytes, fallbackBytes],
            slack: slack, available: available, phase: phase) == 0
    }

    private func select(_ id: UUID, kind: String?, allocations: [Int], slack: Int,
                        available: () -> Double?, phase: String) throws -> Int {
        try lock.withLock {
            let previous = entries[id] ?? [:]
            let others = entries.reduce(0) { sum, entry in
                entry.key == id ? sum : ContextBytes.sum(sum, entry.value.values.reduce(0) { ContextBytes.sum($0, $1) })
            }
            guard let gb = available(), gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 else {
                throw RequestFailure(.insufficientMemory, "reclaimable memory is unreadable during \(phase)")
            }
            let observed = Int(gb * 1e9)
            var required = Int.max
            for (index, bytes) in allocations.enumerated() {
                var own = previous
                if let kind { own[kind] = kind == "dispatch" ? bytes : max(own[kind] ?? 0, bytes) }
                let proposed = kind == nil ? 0 : own.values.reduce(0) { ContextBytes.sum($0, $1) }
                required = ContextBytes.sum(others, proposed, slack)
                if required < Int.max, observed >= required {
                    if kind != nil { entries[id] = own }
                    return index
                }
            }
            var failure = RequestFailure(.insufficientMemory,
                "insufficient memory for \(phase), queued requests and safety headroom; retry after other requests finish")
            failure.requiredBytes = required; failure.availableBytes = observed
            throw failure
        }
    }

}

/// One accepted request owns one monotonic clock, including all queue and
/// preparation work. Neither transport activity nor prefix reuse restarts it.
/// Injectable observations exercise refusal without stressing the machine.
public final class RequestController: @unchecked Sendable {
    public let configuration: ContextConfiguration
    public let slackBytes: Int
    private let clock: () -> UInt64
    private let available: () -> Double?
    private let connected: () -> Bool
    private let pressure: () -> Bool
    private let started: UInt64
    private let lock = NSLock()
    private var failureValue: RequestFailure?
    private var firstToken = false
    private var estimateValue: Double?
    private let reservationID = UUID()
    private var reservations: RequestMemoryReservations?
    public var estimatedPrefillSeconds: Double? { lock.withLock { estimateValue } }

    public init(configuration: ContextConfiguration, slackBytes: Int,
                clock: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds },
                availableGB: @escaping () -> Double? = { Planner.deviceAvailableGB() },
                connected: @escaping () -> Bool = { true }, pressure: @escaping () -> Bool = { false }) {
        self.configuration = configuration
        self.slackBytes = max(0, slackBytes)
        self.clock = clock; self.available = availableGB; self.connected = connected; self.pressure = pressure
        started = clock()
    }
    deinit { reservations?.release(reservationID) }
    package func attachReservations(_ pool: RequestMemoryReservations) throws {
        try lock.withLock {
            if let reservations, reservations !== pool {
                throw RequestFailure(.invalidConfiguration, "a request cannot move between engine memory budgets")
            }
            reservations = pool
        }
    }
    package func releaseDispatchReservation() {
        lock.withLock { reservations?.releaseDispatch(reservationID) }
    }
    public var elapsedSeconds: Double {
        let now = clock()
        return Double(now >= started ? now - started : 0) / 1e9
    }
    public var failure: RequestFailure? { lock.withLock { failureValue } }
    public var mayRetainState: Bool { failure == nil }
    @discardableResult public func fail(_ error: RequestFailure) -> RequestFailure {
        lock.withLock {
            if failureValue == nil { failureValue = error }
            return failureValue!
        }
    }
    public func cancel() { fail(RequestFailure(.clientCancelled, "the client cancelled this request")) }
    public func sampledFirstToken() { lock.withLock { firstToken = true } }

    /// Check before an allocation, not after it. Only actually reusable bytes
    /// can be subtracted by callers; future reservations never authorize growth.
    public func check(nextAllocationBytes: Int = 0, phase: String = "inference") throws {
        if let failure { throw failure }
        guard nextAllocationBytes >= 0 else {
            throw fail(RequestFailure(.invalidConfiguration, "allocation byte count must be nonnegative"))
        }
        if !connected() { throw fail(RequestFailure(.clientCancelled, "the client disconnected during \(phase)")) }
        let elapsed = elapsedSeconds
        let seconds = configuration.maxPrefillWaitMinutes * 60
        if seconds > 0, !lock.withLock({ firstToken }), elapsed >= seconds {
            var error = RequestFailure(.prefillDeadlineExceeded,
                "request-to-first-token deadline exceeded during \(phase); send less context or raise --max-prefill-wait")
            error.elapsedSeconds = elapsed; error.limitSeconds = seconds
            throw fail(error)
        }
        if pressure() {
            throw fail(RequestFailure(.insufficientMemory, "memory pressure interrupted \(phase); retry after memory becomes available"))
        }
        if let pool = lock.withLock({ reservations }) {
            do {
                try pool.check(reservationID, kind: nextAllocationBytes > 0 ? "dispatch" : nil,
                    bytes: nextAllocationBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
            return
        }
        let (required, overflow) = max(0, nextAllocationBytes).addingReportingOverflow(slackBytes)
        guard !overflow else { throw fail(RequestFailure(.insufficientMemory, "allocation size exceeds the supported memory range")) }
        let reading = available()
        if let gb = reading, gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
            let bytes = Int(gb * 1e9)
            if bytes < required {
                var error = RequestFailure(.insufficientMemory,
                    "insufficient reclaimable memory for \(phase) and safety headroom; close other apps or lower the memory/context target")
                error.requiredBytes = required; error.availableBytes = bytes
                throw fail(error)
            }
        } else if configuration.maxContextTokens > ContextPolicy.defaultTokens && nextAllocationBytes > 0 {
            throw fail(RequestFailure(.insufficientMemory,
                "reclaimable memory is unreadable; refusing additional long-context allocation during \(phase)"))
        }
    }

    /// Price both execution paths before dispatch. Prefer the read-sharing
    /// workspace when it fits, otherwise keep the ordinary chronological
    /// path. Only failure of the fallback becomes a sticky request failure.
    /// Unknown standalone observations retain the existing fallback policy;
    /// they never authorize the larger optional workspace.
    package func chooseAllocation(preferredBytes: Int, fallbackBytes: Int,
                                  phase: String) throws -> Bool {
        if let failure { throw failure }
        guard fallbackBytes >= 0, preferredBytes >= fallbackBytes else {
            throw fail(RequestFailure(.invalidConfiguration,
                "preferred and fallback allocations must be nonnegative and ordered"))
        }
        // Preserve cancellation, deadlines, pressure and queued ownership.
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do {
                return try pool.chooseDispatch(reservationID, preferredBytes: preferredBytes,
                    fallbackBytes: fallbackBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
        }
        let preferredRequired = ContextBytes.sum(preferredBytes, slackBytes)
        if preferredRequired < Int.max, let gb = available(), gb.isFinite, gb >= 0,
           gb < Double(Int.max) / 1e9, Int(gb * 1e9) >= preferredRequired {
            return true
        }
        try check(nextAllocationBytes: fallbackBytes, phase: phase)
        return false
    }

    /// Conservative temporary-copy allowance for templating/tokenization.
    /// Counting input must not itself serialize an arbitrarily large value.
    public func checkInputBytes(_ bytes: Int) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid input byte count")) }
        try reservePreparation(kind: "input", bytes: ContextBytes.product(bytes, 16), phase: "prompt tokenization")
    }

    package func reservePreparedImageBytes(_ bytes: Int) throws {
        try reservePreparation(kind: "pixels", bytes: bytes, phase: "retained image preparation")
    }
    private func reservePreparation(kind: String, bytes: Int, phase: String) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid preparation byte count")) }
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do { try pool.check(reservationID, kind: kind, bytes: bytes, slack: slackBytes, available: available, phase: phase) }
            catch let error as RequestFailure { throw fail(error) }
        } else { try check(nextAllocationBytes: bytes, phase: phase) }
    }

    public func admit(missingTokens: Int, from position: Int, maxChunk: Int,
                      tailAware: Bool = false) throws {
        try check(phase: "admission")
        let estimate = PrefillSchedule.estimateSeconds(tokens: missingTokens, from: position,
            maxChunk: maxChunk, tailAware: tailAware)
        lock.withLock { estimateValue = estimate }
        let limit = configuration.maxPrefillWaitMinutes * 60
        if limit > 0, let estimate, elapsedSeconds + estimate > limit {
            var error = RequestFailure(.prefillWaitExceeded,
                "estimated missing-context prefill exceeds the remaining wait budget; send less, reuse a valid prefix, or raise --max-prefill-wait")
            error.elapsedSeconds = elapsedSeconds; error.limitSeconds = limit; error.estimatedSeconds = estimate
            throw fail(error)
        }
    }
}

````````````

## Artifact SHA-256 bc5370d792576a35d8d00fdeba14311b99ebcd3589d5096b13b44b01f8c46ed7

Encoding: `utf-8`. Original bytes: 48809.

````````````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        // Optional workspace selection must not turn a feasible ordinary
        // request into a sticky refusal, or spend another request's lease.
        for shared in [false, true] {
            let label = "allocation choice/shared=\(shared)"
            let pool = RequestMemoryReservations()
            var room = 0.010
            var control: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { room })
            if shared { try control!.attachReservations(pool) }
            let preferred = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): selects the fitting preferred path", preferred)
            c.equal("\(label): charges only selected dispatch", pool.reservedBytes, shared ? 8_000_000 : 0)
            room = 0.006
            let fallback = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): keeps a feasible ordinary path", !fallback)
            c.equal("\(label): preferred refusal is not sticky", control!.failure, nil)
            c.equal("\(label): replaces rather than adds dispatch ownership", pool.reservedBytes, shared ? 2_000_000 : 0)
            room = 0.010
            let recovered = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): later headroom can select the preferred path", recovered)
            room = 0.002
            do {
                _ = try control!.chooseAllocation(preferredBytes: 8_000_000,
                    fallbackBytes: 2_000_000, phase: label)
                c.expect("\(label): both infeasible paths must refuse", false)
            } catch let error as RequestFailure {
                c.equal("\(label): typed fallback refusal", error.code, .insufficientMemory)
                c.equal("\(label): reports minimum required bytes with slack", error.requiredBytes, 3_000_000)
            }
            c.equal("\(label): failed choice preserves prior ownership", pool.reservedBytes, shared ? 8_000_000 : 0)
            control = nil
            c.equal("\(label): completion releases every lease", pool.reservedBytes, 0)
        }
        do {
            let pool = RequestMemoryReservations()
            var queued: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.013 })
            var active: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.013 })
            try queued!.attachReservations(pool); try active!.attachReservations(pool)
            try queued!.reservePreparedImageBytes(4_000_000)
            try active!.reservePreparedImageBytes(2_000_000)
            let selected = try active!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 4_000_000, phase: "queued preparation choice")
            c.expect("optional workspace cannot spend queued or own preparation", !selected)
            c.equal("selected dispatch preserves both preparation owners", pool.reservedBytes, 10_000_000)
            active!.releaseDispatchReservation()
            c.equal("choice release preserves all retained preparation", pool.reservedBytes, 6_000_000)
            active = nil
            c.equal("active completion preserves the queued owner", pool.reservedBytes, 4_000_000)
            queued = nil
            c.equal("all choice and preparation owners release", pool.reservedBytes, 0)
        }
        do {
            let pool = RequestMemoryReservations(), lock = NSLock()
            var controls: [RequestController] = [], choices: [Bool] = [], errors = 0
            DispatchQueue.concurrentPerform(iterations: 2) { _ in
                let control = RequestController(configuration: reservationPolicy,
                    slackBytes: 1_000_000, availableGB: { 0.013 })
                do {
                    try control.attachReservations(pool)
                    let choice = try control.chooseAllocation(preferredBytes: 8_000_000,
                        fallbackBytes: 4_000_000, phase: "concurrent workspace choice")
                    lock.withLock { controls.append(control); choices.append(choice) }
                } catch { lock.withLock { errors += 1 } }
            }
            c.equal("concurrent optional choices both complete", errors, 0)
            c.equal("exactly one preferred workspace owns the available room", choices.filter { $0 }.count, 1)
            c.equal("the other concurrent request atomically selects its fallback", choices.filter { !$0 }.count, 1)
            c.equal("concurrent selection cannot double-spend room", pool.reservedBytes, 12_000_000)
            controls.removeAll()
            c.equal("concurrent choices leave no reservation leak", pool.reservedBytes, 0)
        }
        for shared in [false, true] {
            let pool = RequestMemoryReservations()
            let control = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.010 })
            if shared { try control.attachReservations(pool) }
            let overflow = try control.chooseAllocation(preferredBytes: Int.max,
                fallbackBytes: 2_000_000, phase: "overflowing optional workspace")
            c.expect("overflowing optional size selects finite fallback/\(shared)", !overflow)
            c.equal("optional overflow does not poison request/\(shared)", control.failure, nil)
            for (preferred, fallback) in [(-1, 0), (1, -1), (1, 2)] {
                let invalid = RequestController(configuration: reservationPolicy,
                    slackBytes: 0, availableGB: { 1 })
                if shared { try invalid.attachReservations(pool) }
                do {
                    _ = try invalid.chooseAllocation(preferredBytes: preferred, fallbackBytes: fallback,
                        phase: "invalid choice geometry")
                    c.expect("invalid allocation choice refuses/\(shared)/\(preferred)/\(fallback)", false)
                } catch let error as RequestFailure {
                    c.equal("invalid allocation choice is typed/\(shared)/\(preferred)/\(fallback)", error.code, .invalidConfiguration)
                }
            }
            do {
                _ = try control.chooseAllocation(preferredBytes: Int.max, fallbackBytes: Int.max,
                    phase: "both choices overflow")
                c.expect("overflowing fallback refuses/\(shared)", false)
            } catch let error as RequestFailure {
                c.equal("overflowing fallback is typed/\(shared)", error.code, .insufficientMemory)
            }
        }
        let unreadableChoices: [Double?] = [nil, .nan, .infinity, -1]
        for reading in unreadableChoices {
            let standalone = RequestController(configuration: reservationPolicy,
                slackBytes: 0, availableGB: { reading })
            let choice = try standalone.chooseAllocation(preferredBytes: 8, fallbackBytes: 4,
                phase: "unreadable optional allocation")
            c.expect("unreadable memory never authorizes an optional workspace/\(String(describing: reading))", !choice)
            let shared = RequestController(configuration: reservationPolicy,
                slackBytes: 0, availableGB: { reading })
            try shared.attachReservations(RequestMemoryReservations())
            do {
                _ = try shared.chooseAllocation(preferredBytes: 8, fallbackBytes: 4,
                    phase: "unreadable shared allocation")
                c.expect("unreadable shared budget refuses", false)
            } catch let error as RequestFailure {
                c.equal("unreadable shared budget remains fail closed", error.code, .insufficientMemory)
            }
        }
        do {
            let long = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536,
                maxPrefillWaitMinutes: 0), slackBytes: 0, availableGB: { nil })
            do {
                _ = try long.chooseAllocation(preferredBytes: 8, fallbackBytes: 4, phase: "unknown long context")
                c.expect("unknown long-context fallback must refuse", false)
            } catch let error as RequestFailure {
                c.equal("long-context fallback preserves stricter admission", error.code, .insufficientMemory)
            }
            var tick: UInt64 = 0
            let expired = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 1),
                slackBytes: 0, clock: { tick }, availableGB: { 1 })
            tick = 60_000_000_000
            let disconnected = RequestController(configuration: reservationPolicy, slackBytes: 0,
                availableGB: { 1 }, connected: { false })
            let pressured = RequestController(configuration: reservationPolicy, slackBytes: 0,
                availableGB: { 1 }, pressure: { true })
            for (control, code) in [(expired, RequestFailure.Code.prefillDeadlineExceeded),
                                     (disconnected, .clientCancelled), (pressured, .insufficientMemory)] {
                do {
                    _ = try control.chooseAllocation(preferredBytes: 8, fallbackBytes: 4, phase: "terminal guard choice")
                    c.expect("allocation selection cannot bypass \(code)", false)
                } catch let error as RequestFailure {
                    c.equal("selection preserves terminal guard/\(code)", error.code, code)
                }
            }
        }
        // Grouping may change read reuse, never the numerical compute
        // schedule. Check real planner ceilings, partial tails, cached offsets,
        // context-boundary reductions and the exact model limit.
        for ceiling in [256, 512, 1024, 2048, 4096] {
            for position in [0, 1, 255, 256, 257, 8192, 32768, 65536, 127744, 128000, 261120] {
                for requested in [1, 255, 256, 257, 767, 768, 1023, 1024, 1025, 2048, 2051, 4096, 8192] {
                    let remaining = min(requested, ContextPolicy.modelLimit - position)
                    let checkpoints: [Int?] = [nil, 256, position + 256]
                    for checkpoint in checkpoints {
                        if let grouped = PrefillSchedule.automaticScopePasses(remaining: remaining, at: position,
                            maxChunk: ceiling, checkpoint: checkpoint) {
                            var at = position, left = remaining
                            var identical = true
                            for pass in grouped {
                                let ordinary = PrefillSchedule.next(remaining: left, at: at,
                                    maxChunk: ceiling, tailAware: false)
                                identical = identical && pass == ordinary
                                at += pass; left -= pass
                            }
                            c.expect("automatic group preserves every ordinary shape/\(ceiling)/\(position)/\(remaining)/\(String(describing: checkpoint))",
                                identical && grouped.count >= 4 && grouped.reduce(0, +) <= 4096
                                    && grouped.allSatisfy { [256, 512, 1024].contains($0) && PrefillSchedule.fits($0, at: at - $0) })
                            if let checkpoint, checkpoint > position, checkpoint <= at {
                                let ordinaryEnds = PrefillSchedule.computePasses(tokens: at - position,
                                    from: position, maxChunk: ceiling).map { $0.keyExtent }
                                // Only scheduled boundaries are retainable; an
                                // arbitrary interior checkpoint is not a new shape.
                                c.expect("automatic scope retains a scheduled checkpoint/\(ceiling)/\(position)/\(remaining)/\(checkpoint)",
                                    !ordinaryEnds.contains(checkpoint) || checkpoint == at)
                            }
                        }
                    }
                }
            }
        }
        for count in [1, 255, 256, 257, 767, 768, 1023] {
            c.equal("short prompt keeps chronological dispatch/\(count)",
                PrefillSchedule.automaticScopePasses(remaining: count, at: 0, maxChunk: 256, checkpoint: nil), nil)
        }
        c.equal("1024-row automatic threshold keeps four original passes",
            PrefillSchedule.automaticScopePasses(remaining: 1024, at: 0, maxChunk: 256, checkpoint: nil), [256, 256, 256, 256])
        c.equal("cold common-prefix checkpoint precedes read grouping",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 256, checkpoint: 256), nil)
        c.equal("cached prefix permits remaining whole passes",
            PrefillSchedule.automaticScopePasses(remaining: 1280, at: 256, maxChunk: 256, checkpoint: 256), Array(repeating: 256, count: 5))
        c.equal("512-row planner preserves its own arithmetic",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 512, checkpoint: nil), Array(repeating: 512, count: 8))
        c.equal("1024-row planner preserves its own arithmetic",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 1024, checkpoint: nil), Array(repeating: 1024, count: 4))
        for ceiling in [2048, 4096] {
            c.equal("no speculative benefit from too few large passes/\(ceiling)",
                PrefillSchedule.automaticScopePasses(remaining: 8192, at: 0, maxChunk: ceiling, checkpoint: nil), nil)
        }
        for args in [(-1, 0, 256), (Int.max, 0, 256), (1024, -1, 256), (1024, ContextPolicy.modelLimit, 256),
                     (1024, 0, 0), (1024, 0, 4097)] {
            c.equal("invalid automatic geometry refuses/\(args)", PrefillSchedule.automaticScopePasses(
                remaining: args.0, at: args.1, maxChunk: args.2, checkpoint: nil), nil)
        }
        c.expect("optional scope fits the exact process boundary", ContextWorkspace.fitsAutomaticScope(
            footprintBytes: 7_000_000_000, allocationBytes: 3_000_000_000, limitBytes: 10_000_000_000))
        c.expect("one excess byte keeps the ordinary path", !ContextWorkspace.fitsAutomaticScope(
            footprintBytes: 7_000_000_001, allocationBytes: 3_000_000_000, limitBytes: 10_000_000_000))
        for args in [(0, 1, 10), (-1, 1, 10), (1, -1, 10), (1, Int.max, Int.max), (Int.max - 1, 2, Int.max), (1, 1, 0)] {
            c.expect("invalid optional process budget refuses/\(args)", !ContextWorkspace.fitsAutomaticScope(
                footprintBytes: args.0, allocationBytes: args.1, limitBytes: args.2))
        }
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
            for mtp in [false, true] {
                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
                    mtpEnabled: mtp, maxContextTokens: cap)
                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
                    GovernorPolicy.desiredPlan(exhausted) == nil)
                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
                    GovernorPolicy.decide(exhausted), .hold)
                var recovered = exhausted
                recovered.availableGB = 10
                if let plan = GovernorPolicy.desiredPlan(recovered) {
                    let physical = min(recovered.workingSetGB, recovered.availableGB
                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
                        + (mtp ? Planner.mtpResidentGB : 0)
                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
                } else {
                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
                }
            }
        }
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        func expertWorkspace(_ tokens: Int = 4096, tile: Int = 1024,
                             batch: Int = 32, pool: Int = 0, admissions: Int = 0,
                             record: Int = 2_764_800) -> Int {
            ContextWorkspace.expertWorkspaceBytes(tokens: tokens, tile: tile, experts: 512,
                topK: 10, hidden: 2560, intermediate: 640, recordBytes: record,
                loadBatch: batch, admissionPoolBytes: pool, admissionRecords: admissions)
        }
        c.expect("scope admission prices old and replacement expert storage",
            expertWorkspace() >= 2 * 512 * 2_764_800 + 32 * 2_764_800)
        c.expect("scope staging override cannot hide a whole-layer upload",
            expertWorkspace(batch: 512) > expertWorkspace(batch: 32))
        c.expect("scope admission prices decode-pool replacement",
            expertWorkspace(pool: 1217 * 2_764_800, admissions: 25) > expertWorkspace())
        c.expect("large routed tile increases allocation reservation",
            expertWorkspace(tile: 4096) > expertWorkspace(tile: 1024))
        c.expect("merged routed tail cannot reduce allocation reservation",
            expertWorkspace(1279, tile: 1024) >= expertWorkspace(1024, tile: 1024))
        c.expect("retained scope outputs are charged beyond one compute tile",
            expertWorkspace(8192) > expertWorkspace(4096))
        c.equal("scope record overflow refuses before dispatch", expertWorkspace(record: Int.max), Int.max)
        c.equal("invalid scope tile refuses before dispatch", expertWorkspace(tile: 0), Int.max)
        c.equal("invalid scope staging refuses before dispatch", expertWorkspace(batch: 513), Int.max)
        c.equal("negative scope pool refuses before dispatch", expertWorkspace(pool: -1), Int.max)
        c.equal("scope admission requires an actual pool allocation", expertWorkspace(admissions: 1), Int.max)
        c.equal("invalid scope extent refuses before dispatch", expertWorkspace(0), Int.max)
        c.expect("grouped matmul expert padding is charged for a small route set",
            ContextWorkspace.expertWorkspaceBytes(tokens: 1, tile: 256, experts: 512,
                topK: 1, hidden: 2560, intermediate: 640, recordBytes: 1, loadBatch: 1)
                >= 2048 * (5 * 2560 + 4 * 640) * 4)
        c.equal("scope route geometry rejects more routes than experts",
            ContextWorkspace.expertWorkspaceBytes(tokens: 4096, tile: 1024, experts: 512,
                topK: 513, hidden: 2560, intermediate: 640, recordBytes: 2_764_800,
                loadBatch: 32), Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. A feasible restart and settled governor
        // must agree. The preserved legacy startup floor can also return an
        // advisory that exceeds the physical budget; that is a refusal case,
        // never evidence that the live governor should admit work.
        var governorCaps = Set<Int>()
        var advisoryRefusals = Set<String>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 12.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        let physicalBudget = min(input.workingSetGB,
                            whole - Planner.availabilitySlackGB(ramGB: input.ramGB))
                        let peak = Double(initial.memoryLedger.expectedPeakBytes)
                        let feasible = peak <= physicalBudget * 1e9
                            && (initial.targetGB.map { peak <= $0 * 1e9 } ?? true)
                        if !feasible {
                            advisoryRefusals.insert("\(cap)/\(prefix)/\(mode)/\(whole)")
                            c.expect("\(label): legacy startup advisory is refused live", settled == nil)
                            let target: Int
                            switch GovernorPolicy.decide(input) {
                            case .hold: target = input.currentSlots
                            case .resize(let slots, _): target = slots
                            }
                            c.equal("\(label): infeasible advisory settles at arena floor", target, Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - target)
                            input.currentSlots = target
                            c.expect("\(label): returning owned pool bytes cannot invent feasibility",
                                GovernorPolicy.desiredPlan(input) == nil)
                            c.equal("\(label): infeasible floor cannot shrink further", GovernorPolicy.decide(input), .hold)
                            continue
                        }
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        c.equal("governor matrix preserves all four original unphysical advisories", advisoryRefusals,
            Set(["8192/false/0/10.0", "8192/true/0/10.0", "32768/false/0/10.0", "32768/true/0/10.0"]))
        return c.report()
    }
}

````````````

## Artifact SHA-256 c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8

Encoding: `gzip+base64`. Original bytes: 80213.

````````````text
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
````````````

## Artifact SHA-256 b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2

Encoding: `utf-8`. Original bytes: 20891.

````````````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("automatic platform-qualified optimization defaults",
            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let legacyOptions = try JSONEncoder().encode(InferenceOptimizations())
        let legacyObject = try JSONSerialization.jsonObject(with: legacyOptions) as! [String: Any]
        c.expect("reference control encoding omits unset automatic policy", legacyObject["automaticReadScope"] == nil)
        c.equal("old control JSON remains decodable", try JSONDecoder().decode(InferenceOptimizations.self,
            from: legacyOptions), InferenceOptimizations())
        var automatic = InferenceOptimizations.integrationCandidate
        automatic.automaticReadScope = true
        c.equal("automatic policy survives saved control round trip", try JSONDecoder().decode(InferenceOptimizations.self,
            from: JSONEncoder().encode(automatic)), automatic)
        c.equal("absent overrides preserve an inherited automatic policy",
            try InferenceOptimizations.resolving(environment: [:], defaults: automatic), automatic)
        var noAutomatic = automatic; noAutomatic.automaticReadScope = nil
        c.equal("explicit automatic zero restores the chronological policy",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"], defaults: automatic), noAutomatic)
        c.equal("explicit automatic one enables only that policy",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"], defaults: noAutomatic), automatic)
        for (name, value) in [("SLOTSTREAM_OPT_READ_SCOPE", "0"), ("SLOTSTREAM_OPT_LAYER_WORKSPACE", "0"),
                              ("SLOTSTREAM_OPT_INDEXER_TILES", "0"), ("SLOTSTREAM_OPT_PLE_TILES", "0"),
                              ("SLOTSTREAM_OPT_WORKSPACE_TILE", "256"), ("SLOTSTREAM_OPT_SCOPE_FRONTIER", "0"),
                              ("SLOTSTREAM_OPT_WORKSPACE_PIECES", "0")] {
            c.equal("manual scope control suppresses inherited automatic policy/\(name)",
                try InferenceOptimizations.resolving(environment: [name: value], defaults: automatic), noAutomatic)
        }
        for value in ["true", "-1", "2", ""] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_AUTO_READ_SCOPE": value])
                c.expect("malformed automatic policy must refuse/\(value)", false)
            } catch { c.expect("malformed automatic policy refuses/\(value)", true) }
        }
        let candidate = InferenceOptimizations.integrationCandidate
        c.expect("combined candidate preserves the original MTP verification shape",
            !candidate.boundedDraftTail)
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and automatic default",
            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0

Encoding: `utf-8`. Original bytes: 14145.

````````````text
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

````````````

## Artifact SHA-256 cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224

Encoding: `utf-8`. Original bytes: 16671.

````````````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = PlannerCostModel.fixedBytes
        poolBytes = ContextBytes.product(slots, Int(Geometry.recordBytes))
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, PlannerCostModel.prefillBytesPerToken)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? PlannerCostModel.mtpResidentBytes : 0
        visionResidentBytes = visionResident ? PlannerCostModel.visionResidentBytes : 0
        planningMarginBytes = PlannerCostModel.planningMarginBytes
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), PlannerCostModel.prefillBytesPerToken),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    /// Additional buffers owned by the expert workspace, beyond ordinary
    /// compute-pass and retained-frontier allowances. Count replacement
    /// storage even if MLX can donate the old allocation on this dispatch.
    /// This is a conservative allocation reservation, not a process peak.
    package static func expertWorkspaceBytes(tokens: Int, tile: Int, experts: Int,
        topK: Int, hidden: Int, intermediate: Int, recordBytes: Int, loadBatch: Int,
        admissionPoolBytes: Int = 0, admissionRecords: Int = 0) -> Int {
        guard tokens > 0, tokens <= ContextPolicy.modelLimit,
              [256, 512, 1024, 2048, 4096].contains(tile),
              experts > 0, topK > 0, topK <= experts, hidden > 0, intermediate > 0,
              recordBytes > 0, loadBatch > 0, loadBatch <= experts,
              admissionPoolBytes >= 0, admissionRecords >= 0, admissionRecords <= experts,
              admissionRecords == 0 || admissionPoolBytes > 0 else { return Int.max }
        let weights = ContextBytes.product(experts, recordBytes)
        // Nine aligned managed buffers; reserve a second staging copy so
        // admission never depends on a particular no-copy upload decision.
        let staging = ContextBytes.sum(ContextBytes.product(loadBatch, recordBytes, 2), 9 * 16_384)
        let assembly = ContextBytes.sum(weights, staging)
        // Sweep admission can replace the decode pool while full workspace
        // weights and gathered hot records remain live.
        let admission = ContextBytes.sum(admissionPoolBytes,
            ContextBytes.product(admissionRecords, recordBytes))
        // workspaceRouted merges a residual tail only below 256 rows. Its
        // grouped matmul pads to at least four rows per expert (and 16).
        let liveTokens = min(tokens, tile + 255)
        let rows = max(ContextBytes.product(liveTokens, topK), ContextBytes.product(experts, 4), 16)
        // Original/padded gather, down, canonical and weighted outputs: five H-wide arrays.
        // Gate, up, SiLU and product: four FF-wide arrays. Charge FP32 for
        // every intermediate, plus CPU/GPU index copies. Reduced tiles and
        // their final concatenation coexist until the layer returns.
        let routed = ContextBytes.sum(ContextBytes.product(rows,
            ContextBytes.sum(ContextBytes.product(hidden, 5), ContextBytes.product(intermediate, 4)), 4),
            ContextBytes.product(rows, 64))
        let retained = ContextBytes.sum(ContextBytes.product(tokens, hidden, 8),
            ContextBytes.product(tokens, topK, 16), ContextBytes.product(tokens, experts, 8),
            ContextBytes.product(experts, 32))
        return ContextBytes.sum(weights, max(assembly, admission, routed), retained)
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}

````````````

## Artifact SHA-256 9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316

Encoding: `utf-8`. Original bytes: 58066.

````````````text
// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import CoreGraphics
import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// An assistant turn's reasoning, rendered as `reasoning_content`. Clients
    /// that keep reasoning in history can replay it; fx does not send any.
    public var reasoning: String?
    /// Calls this assistant turn made.
    public var toolCalls: [ParsedToolCall]
    /// For a `tool` message: which call it answers.
    public var toolCallId: String?
    public var toolName: String?
    /// Pictures this turn carries, as inline bytes (a `data:` URL or bare
    /// base64) in the order the template should render them. Text-only paths
    /// leave it empty and behave exactly as before.
    public var images: [String] = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
        self.reasoning = nil
        self.toolCalls = []
        self.toolCallId = nil
        self.toolName = nil
    }

    public init(
        role: String, content: String, reasoning: String? = nil,
        toolCalls: [ParsedToolCall] = [], toolCallId: String? = nil, toolName: String? = nil
    ) {
        self.role = role
        self.content = content
        self.reasoning = reasoning
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
        self.toolName = toolName
    }

    /// The dictionary the chat template consumes.
    ///
    /// Tool-call arguments are bridged as an unordered dictionary because
    /// swift-jinja accepts nothing else, so the template's `arguments|items`
    /// follows Swift's hash order. That is why a generated assistant turn is
    /// spliced back as raw ids rather than re-rendered (`PrefixCache`): a
    /// re-render is semantically identical but not byte-identical, and the
    /// prefix cache matches on bytes.
    public var templateValue: [String: any Sendable] {
        var m: [String: any Sendable] = ["role": role, "content": content]
        // The template checks each content part for an `image`/`image_url`
        // key, so a turn with pictures has to arrive as parts rather than a
        // string. Images first, then the text: that is the order the template
        // numbers them in ("Picture 1: ..."), and the order
        // `Engine.imageSources` reads them back in.
        if !images.isEmpty {
            var parts: [[String: any Sendable]] = images.map {
                ["type": "image_url", "image_url": ["url": $0] as [String: any Sendable]]
            }
            if !content.isEmpty { parts.append(["type": "text", "text": content]) }
            m["content"] = parts
        }
        if let r = reasoning, !r.isEmpty { m["reasoning_content"] = r }
        if !toolCalls.isEmpty {
            m["tool_calls"] = toolCalls.map { call in
                [
                    "type": "function",
                    "function": [
                        "name": call.name,
                        "arguments": call.arguments.mapValues { $0.any },
                    ] as [String: any Sendable],
                ] as [String: any Sendable]
            }
        }
        return m
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Lazily-loaded vision tower (VLM). Loaded on the first request that
    /// carries an image and then cached; see `ensureVisionTower`.
    public private(set) var visionTower: VisionTower?
    /// Whether this process will accept images at all (`--vision`). False
    /// makes every image request a 400 that says so, rather than a surprise
    /// gigabyte.
    public var visionAllowed = true
    /// Whether the checkpoint carries a tower at all, read once at startup so
    /// the fx catalogue and `/api/show` can answer without touching it.
    public private(set) var visionAvailable = false
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    private let contextLock = NSRecursiveLock()
    private var configuredContextTokens = ContextPolicy.defaultTokens
    private let allocatedContextTokens: Int
    private var contextAssignmentFailure: RequestFailure?
    public var maxContextTokens: Int {
        get { contextLock.withLock { configuredContextTokens } }
        set {
            contextLock.lock(); defer { contextLock.unlock() }
            if let why = ContextPolicy.validationError(newValue, qualification: currentPlan?.contextQualification ?? false) {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration, why); return
            }
            guard newValue <= allocatedContextTokens else {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration,
                    "context assignment exceeds this engine's allocated plan; construct a new Engine with a validated plan")
                return
            }
            contextAssignmentFailure = nil
            configuredContextTokens = newValue
            let capped = min(prefixCache.maxTokens, newValue)
            prefixCache.configure(maxTokens: capped)
            if let p = currentPlan {
                updatePlan(MemoryPlan(source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
                    availableGB: p.availableGB, clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled, visionEnabled: p.visionEnabled,
                    visionResidentReserved: p.visionResidentReserved, maxContextTokens: newValue,
                    notes: p.notes, runtimeAllocationPolicy: p.runtimeAllocationPolicy,
                    maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification))
            }
        }
    }

    /// Call when a complete request is accepted, before tokenization or images.
    public func beginRequest(connected: @escaping () -> Bool = { true }) throws -> RequestController {
        if let override = requestControllerOverride {
            let control = try override(); try control.attachReservations(requestReservations); return control
        }
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
        if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
        let configuration = try ContextConfiguration(maxContextTokens: maxContextTokens,
            maxPrefillWaitMinutes: currentPlan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: currentPlan?.contextQualification ?? false)
        let control = RequestController(configuration: configuration,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: currentPlan?.ramGB ?? Planner.deviceRAMGB()) * 1e9),
            connected: connected, pressure: { [weak self] in
                guard let self else { return true }
                return self.pressureBoundary.snapshot() != nil || self.osPressureLock.withLock { self.osPressure }
            })
        try control.attachReservations(requestReservations)
        return control
    }
    private let requestReservations = RequestMemoryReservations()

    // Package-only dependency seam for deterministic HTTP diagnostics. No wire
    // field or environment variable can install it.
    package var requestControllerOverride: (() throws -> RequestController)?

    public var contextPolicyJSON: [String: Any] {
        let plan = currentPlan
        return ["configured_window": maxContextTokens, "model_limit": ContextPolicy.modelLimit,
            "implementation_limit": ContextPolicy.implementationLimit,
            "mtp_limit": ContextPolicy.mtpLimit, "vision_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            "wait_scope": "accepted_request_to_first_model_token",
            "qualification": plan?.contextQualification ?? false,
            "allocation_available": planLock.withLock { allocationUnavailable == nil },
            "estimate_scope": "measured M5 Pro anchors; unknown for unqualified pass sizes"]
    }

    deinit { pressureMonitor?.cancel() }

    private var allocationUnavailable: RequestFailure?
    package func setAllocationUnavailable(_ failure: RequestFailure?) {
        planLock.withLock { allocationUnavailable = failure }
    }

    private let osPressureLock = NSLock()
    private var osPressure = false
    private var pressureMonitor: DispatchSourceMemoryPressure?

    /// Retained conversation state, so a follow-up turn re-prefills only what
    /// is new. See PrefixCache for the extend-only rule and the memory story.
    public let prefixCache: PrefixCache

    /// Release the retained conversation state. Takes the generation lock, so
    /// never call it from inside `generate`.
    public func dropPrefixCache() {
        withExclusive { prefixCache.drop() }
    }

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    ///
    /// The message names the cap for what it is. It used to tell people to
    /// raise --max-context, which cannot go past the ceiling the server was
    /// already at.
    public func contextError(promptTokens: Int) -> String? {
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { return contextAssignmentFailure.message }
        guard promptTokens < 0 || promptTokens > maxContextTokens else { return nil }
        return "context_length_exceeded: prompt is \(promptTokens) tokens, over the configured \(maxContextTokens)-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is \(ContextPolicy.modelLimit)."
    }
    /// The live memory plan (updated by the elastic governor on resize; nil
    /// for internal fixed-size uses). Guarded by its own lock so /api reads
    /// never block behind a running generation.
    private var _plan: MemoryPlan?
    private let planLock = NSLock()
    public var currentPlan: MemoryPlan? {
        planLock.lock()
        defer { planLock.unlock() }
        return _plan
    }
    public func updatePlan(_ p: MemoryPlan) {
        planLock.lock()
        _plan = p
        planLock.unlock()
    }

    private let lock = GenerationGate()
    package let pressureBoundary = PressureBoundary()
    // Immutable after startup, so the governor never reads mutable model
    // controls concurrently with a request changing its diagnostic options.
    package let responsiveGovernor: Bool

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
    }

    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        lock.tryWithExclusive(body)
    }

    /// Pool numbers for the metadata endpoints, published rather than read
    /// live. Reading SlotPool's mutable Swift arrays while the governor
    /// resizes is a data race, but taking the *generation* lock to avoid it
    /// made /api/tags and /api/ps block for the whole of a running request, so
    /// a client that polls either one saw a generating server as a hung one.
    private var _poolSnapshot: (slots: Int, slotsPerLayer: Double, poolBytes: Int) = (0, 0, 0)
    private let poolSnapshotLock = NSLock()

    public func poolSnapshot() -> (slots: Int, slotsPerLayer: Double, poolBytes: Int) {
        poolSnapshotLock.lock()
        defer { poolSnapshotLock.unlock() }
        return _poolSnapshot
    }

    /// Re-read the pool and publish it. **Call with the generation lock held**
    /// (inside `withExclusive`), which is where every resize already happens.
    public func publishPoolSnapshot() {
        let s = (model.pool.slots, model.pool.slotsPerLayer, model.pool.poolBytes)
        poolSnapshotLock.lock()
        _poolSnapshot = s
        poolSnapshotLock.unlock()
    }

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        // A plan made for a simulated machine may be printed and compared,
        // never loaded. Simulating memory the machine does not have still
        // allocates for real: on 2026-08-30 a simulated 60 GB drove a 25.4 GB
        // allocation and 39 GB of swap. The flag travels on the plan so this
        // cannot be forgotten at a call site.
        if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
        let context = try ContextConfiguration(maxContextTokens: plan?.maxContextTokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: plan?.contextQualification ?? false)
        guard poolSlots >= Geometry.floorSlots, poolSlots <= Geometry.totalRecords,
              plan == nil || plan?.slots == poolSlots else {
            throw SlotstreamError.invalidPlan("engine pool must match a supported memory plan")
        }
        let initialLedger = plan?.memoryLedger ?? ContextMemoryLedger(slots: poolSlots,
            context: context.maxContextTokens, chunk: 256,
            retentionTokens: Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            mtp: false, visionResident: false)
        let initial = RequestController(configuration: context,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: plan?.ramGB ?? Planner.deviceRAMGB()) * 1e9))
        try initial.check(nextAllocationBytes: initialLedger.expectedPeakBytes, phase: "model allocation")
        self.allocatedContextTokens = context.maxContextTokens
        self.configuredContextTokens = context.maxContextTokens
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0" && (plan?.runtimeAllocationPolicy?.prefixCacheEnabled ?? true))
        if let p = plan, p.runtimeAllocationPolicy != nil { prefixCache.setBudgetLimit(p.prefixCacheTokens) }
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.Memory.cacheLimit = 2 << 30
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        self.responsiveGovernor = model.optimizations.responsiveGovernor
        try model.validate()
        // Read from the index that is already open — no tensor is touched, and
        // nothing is allocated until an image actually arrives.
        self.visionAvailable = VisionTower.present(index: index)
        self.visionAllowed = plan?.visionEnabled ?? visionAvailable
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
        if let p = plan, p.runtimeAllocationPolicy != nil {
            generator.setPrefillBudgetCeiling(p.prefillChunk)
            generator.prefillChunk = p.prefillChunk
        }
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
        }
        if let mb = Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CACHE_MB"] ?? "") {
            generator.prefillCacheLimit = max(0, mb) << 20
        } else if let p = plan, p.expectedPeakGB <= 12 {
            generator.prefillCacheLimit = 512 << 20
        }
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        publishPoolSnapshot()
        let monitor = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
            queue: DispatchQueue(label: "slotstream.request-pressure"))
        monitor.setEventHandler { [weak self, weak monitor] in
            guard let self, let monitor else { return }
            self.osPressureLock.withLock { self.osPressure = !monitor.data.contains(.normal) }
        }
        monitor.resume(); pressureMonitor = monitor
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        try encodeChat(messages, tools: [], thinking: thinking, effort: nil)
    }

    /// Render a conversation that may declare tools and replay tool calls.
    ///
    /// `tools` empty renders no `<tools>` block at all, which is what the
    /// Ollama and OpenAI dialects pass, so their bytes are unchanged.
    public func encodeChat(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: Self.additionalContext(thinking: thinking, effort: effort))
    }

    /// Encode a conversation, substituting the exact ids this server generated
    /// for any assistant turn it can still prove it produced.
    ///
    /// Why this exists. The prefix cache matches on bytes, and it must: the GDN
    /// recurrent state is a fold over the tokens it consumed, with no inverse,
    /// so a state may only be extended by the very ids that built it. A client
    /// replaying history does not send those ids — it sends its own view of the
    /// turn, which the template then re-renders. Whenever that re-render
    /// differs by a single byte, the next turn rebuilds the whole prompt.
    ///
    /// With reasoning ON that is not an edge case, it is every turn: fx (and
    /// most clients) never echo reasoning back, so the re-render is missing the
    /// `<think>` block the model actually produced, and the state cannot match.
    /// Measured on this machine, a two-turn tool loop reused 303 of 325 tokens
    /// with reasoning off and 0 of 349 with it on — three and a half times the
    /// wall time for the identical second turn.
    ///
    /// The splice closes that. For each assistant turn, ask the cache whether it
    /// still holds a state whose ids begin with exactly the prompt that turn was
    /// generated from; if it does, the remainder of those ids *is* that turn,
    /// verbatim. Check that the remainder really describes the turn the client
    /// sent (same calls, same arguments, same text) and then use the held ids in
    /// place of the re-render, tokenizing only the conversation after it.
    ///
    /// Splitting the text at `<|im_end|>` is safe because it is an added token
    /// and therefore a hard tokenizer boundary: the suffix tokenizes identically
    /// whether or not the text before it is present. That is measured, not
    /// assumed — see the `chat-splice` check.
    ///
    /// Any mismatch anywhere falls back to the plain render, which is the
    /// behaviour that existed before. The splice can make a turn cheaper; it can
    /// never make one wrong.
    public func encodeChatSpliced(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        let full = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        guard prefixCache.enabled, messages.contains(where: { $0.role == "assistant" })
        else { return full }
        let fullText = tokenizer.decode(tokens: full, skipSpecialTokens: false)

        var spliced: [Int] = []  // ids exactly as the model saw or produced them
        var consumed = 0  // characters of fullText those ids already cover
        var didSplice = false

        func index(_ offset: Int) -> String.Index {
            fullText.index(fullText.startIndex, offsetBy: offset)
        }

        for k in messages.indices where messages[k].role == "assistant" {
            guard
                let headIds = try? encodeChat(
                    Array(messages[0..<k]), tools: tools, thinking: thinking, effort: effort)
            else { break }
            let headText = tokenizer.decode(tokens: headIds, skipSpecialTokens: false)
            guard fullText.hasPrefix(headText), headText.count >= consumed else { break }
            // The ids that produced turn k: what is already spliced, plus the
            // conversation between there and this turn's generation prompt.
            let bridge = String(fullText[index(consumed)..<index(headText.count)])
            let producer =
                spliced + (bridge.isEmpty ? [] : tokenizer.encode(text: bridge, addSpecialTokens: false))
            guard let entry = prefixCache.peek(extending: producer) else { break }
            let generated = Array(entry[producer.count...])
            let genText = tokenizer.decode(tokens: generated, skipSpecialTokens: false)
            guard Self.spliceDescribes(genText, messages[k], tools: tools) else { break }
            guard
                let end = fullText.range(
                    of: "<|im_end|>", range: index(headText.count)..<fullText.endIndex)
            else { break }
            spliced = entry
            consumed = fullText.distance(from: fullText.startIndex, to: end.lowerBound)
            didSplice = true
        }

        guard didSplice else { return full }
        let tail = String(fullText[index(consumed)...])
        return spliced + tokenizer.encode(text: tail, addSpecialTokens: false)
    }

    /// Does this generated text describe the assistant turn the client sent?
    ///
    /// Deliberately compares meaning rather than bytes: the client's copy has
    /// been through its own JSON round trip, so whitespace and argument order
    /// may differ, but the calls it reports must be the calls that were made.
    /// Reasoning is ignored — the client dropping it is the whole reason the
    /// splice is needed.
    public static func spliceDescribes(
        _ generated: String, _ message: ChatMessage, tools: [ToolDefinition]
    ) -> Bool {
        let (_, body) = ThinkSplitter.split(generated)
        let visible = body.isEmpty && !generated.contains("</think>") ? generated : body
        let events = ToolCallSplitter.parseAll(visible, tools: tools.map { $0.schema })
        var calls: [ParsedToolCall] = []
        var text = ""
        for e in events {
            switch e {
            case .toolCall(let c): calls.append(c)
            case .text(let t): text += t
            case .malformed: return false
            default: break
            }
        }
        guard calls.count == message.toolCalls.count else { return false }
        for (a, b) in zip(calls, message.toolCalls) {
            guard a.name == b.name, a.arguments == b.arguments else { return false }
        }
        // The text is compared after trimming only. A client that rewrites the
        // assistant's prose is describing a different turn, and re-rendering it
        // is then the correct answer.
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
            == message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func additionalContext(thinking: Bool, effort: String?) -> [String: any Sendable] {
        var ctx: [String: any Sendable] = ["enable_thinking": thinking]
        if let e = effort, thinking { ctx["reasoning_effort"] = e }
        return ctx
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [ToolDefinition] = [], effort: String? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        return try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: additionalContext(thinking: thinking, effort: effort))
    }

    /// OpenAI path: messages already contain image_url parts, and content may
    /// be String or [[String: Any]] (vision). The nested arrays must be
    /// bridged to the tokenizer's `[String: any Sendable]` messages or the
    /// vision parts are silently dropped before the Jinja template can render
    /// them as <|image_pad|>.
    public func encodeChatOpenAI(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> [Int] {
        func toSendable(_ v: Any) -> any Sendable {
            if let arr = v as? [[String: Any]] {
                return arr.map { d -> [String: any Sendable] in
                    var out: [String: any Sendable] = [:]
                    for (k, vv) in d { out[k] = toSendable(vv) }
                    return out
                } as any Sendable
            }
            if let d = v as? [String: Any] {
                var out: [String: any Sendable] = [:]
                for (k, vv) in d { out[k] = toSendable(vv) }
                return out as any Sendable
            }
            if let a = v as? [Any] {
                return a.map { toSendable($0) } as any Sendable
            }
            return v as any Sendable
        }
        let msgs: [[String: any Sendable]] = messages.map { dict in
            var m: [String: any Sendable] = [:]
            for (k, v) in dict { m[k] = toSendable(v) }
            return m
        }
        let toolSpecs: [[String: any Sendable]]? = tools?.map { dict in
            var t: [String: any Sendable] = [:]
            for (k, v) in dict { t[k] = toSendable(v) }
            return t
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: toolSpecs, additionalContext: ["enable_thinking": thinking])
    }

    // MARK: Vision

    /// Load the vision tower on first use, and only if the machine can spare
    /// it right now.
    ///
    /// **Under the generation lock, not a lock of its own.** Loading is
    /// ~0.9 GB of MLX arrays plus an `eval`; a private lock let that run on a
    /// connection thread while another request was mid-generation, which is
    /// exactly the concurrent GPU work every other allocation path in this
    /// file serializes. `withExclusive` is that serialization, and it also
    /// makes the availability reading below meaningful: nothing else can
    /// allocate between reading it and taking the memory.
    ///
    /// Replan before allocation so a target-driven process pays for the
    /// tower with expert capacity. Also require real machine headroom: an
    /// accounting allowance is not proof that physical memory is available.
    public func ensureVisionTower() throws -> VisionTower { try ensureVisionTower(request: nil) }

    public func ensureVisionTower(request: RequestController?, workspaceBytes: Int = 0) throws -> VisionTower {
        guard workspaceBytes >= 0 else {
            throw RequestFailure(.invalidConfiguration, "vision workspace bytes must be nonnegative")
        }
        guard visionAllowed else {
            throw SlotstreamError.vision(
                "this server was started with --vision off; images are not accepted")
        }
        if let request { try lock.lock(request: request) } else { lock.lock() }
        defer { lock.unlock() }
        return try { () throws -> VisionTower in
            try request?.check(nextAllocationBytes: visionTower == nil ? 1_900_000_000 : 0, phase: "vision tower allocation")
            if pressureBoundary.snapshot() != nil {
                let failure = RequestFailure(.insufficientMemory, "memory pressure interrupted image preparation; retry after the cache resizes")
                throw request?.fail(failure) ?? failure
            }
            let reservedPlan: MemoryPlan?
            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
            catch {
                let failure = RequestFailure(.insufficientMemory, "vision allocation cannot fit the current plan: \(error)")
                throw request?.fail(failure) ?? failure
            }
            if let charged = reservedPlan {
                let ledger = charged.memoryLedger
                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
                    max(ledger.prefillBytes, workspaceBytes))
                if let target = charged.targetGB, Double(peak) > target * 1e9 {
                    var failure = RequestFailure(.insufficientMemory,
                        "image attention workspace exceeds this process memory target; resize the image or raise --memory-gb")
                    failure.requiredBytes = peak
                    failure.availableBytes = target < Double(Int.max) / 1e9 ? Int(target * 1e9) : Int.max
                    throw request?.fail(failure) ?? failure
                }
            }
            try request?.check(nextAllocationBytes: workspaceBytes, phase: "vision workspace admission")
            if let vt = visionTower { return vt }
            let idx = try CheckpointIndex(dir: modelDir)
            guard VisionTower.present(index: idx) else {
                throw SlotstreamError.vision(
                    "this checkpoint has no vision tower — it is a text-only model")
            }
            let needGB = Double(VisionTower.residentBytes(index: idx)) / 1e9
            guard needGB <= Planner.visionResidentGB else {
                throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
            }
            if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                avail < needGB + Planner.visionLoadMarginGB
            {
                let failure = RequestFailure(.insufficientMemory, String(
                        format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                            + "right now — close other apps and retry, or restart with a lower "
                            + "--memory-gb so the tower fits",
                        needGB, avail))
                throw request?.fail(failure) ?? failure
            }
            if let p = reservedPlan {
                // The lock excludes generation and governor mutation. Shrink
                // releases the old arena before allocating the smaller one.
                model.pool.resize(to: p.slots)
                if p.runtimeAllocationPolicy != nil {
                    generator.setPrefillBudgetCeiling(p.prefillChunk)
                    prefixCache.setBudgetLimit(p.prefixCacheTokens)
                }
                generator.prefillChunk = min(generator.prefillChunk, p.prefillChunk)
                prefixCache.configure(maxTokens: min(prefixCache.maxTokens, p.prefixCacheTokens))
                MLX.Memory.clearCache()
                updatePlan(p)
                publishPoolSnapshot()
            }
            let vt = try VisionTower(index: idx)
            self.visionTower = vt
            return vt
        }()
    }

    /// Tokenize with vision expansion: each template image_pad is worth
    /// N_merged real tokens, so the template's single pad is expanded to a run
    /// of pads that the tower's embeddings will fill. Returns the expanded ids
    /// and a `VisionPrompt` when the request carries images, nil otherwise.
    ///
    /// The tower does not run here. The run lengths come from each image's
    /// dimensions, so the ids — and with them the prefix cache key — are ready
    /// before any pixels are read. `Generator.generate` asks the cache first
    /// and then encodes only the images that the reused state does not cover.
    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> ([Int], VisionPrompt?) {
        try encodeWithVision(messages: messages, tools: tools, thinking: thinking, request: nil)
    }

    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false,
        request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextBytes.sum(ContextInputMemory.bytes(messages), ContextInputMemory.bytes(tools ?? [])))
        let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages), request: request)
    }

    /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
    /// through the same template as `encodeChat` and then expands the same
    /// placeholders.
    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil
    ) throws -> ([Int], VisionPrompt?) {
        try encodeChatWithVision(messages, tools: tools, thinking: thinking, effort: effort, request: nil)
    }

    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil, request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: tools))
        let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images }, request: request)
    }

    /// Expand each `<|image_pad|>` the template rendered into the run of
    /// placeholders its image is worth, and describe the images for the tower
    /// and the prefix cache. Shared by every surface so they cannot drift.
    private func withImages(baseIds: [Int], sources: [String], request: RequestController? = nil) throws -> ([Int], VisionPrompt?) {
        defer { request?.releaseDispatchReservation() }
        try request?.check(phase: "prompt preparation")
        if sources.isEmpty { return (baseIds, nil) }
        let started = RuntimeClock.now()
        let observer = generator.footprintSampling ? FootprintSampler() : nil
        let vmBefore = generator.footprintSampling ? ProcessMemory.vmActivity() : nil
        var observationFinished = false
        defer { if !observationFinished { _ = observer?.finish() } }
        // Decode and hash first: it needs no tower, it is cheap next to one,
        // and a malformed picture should be a 400 before the process commits
        // 0.9 GB to a tower it may not otherwise need.
        var decoded: [(cg: CGImage, hash: ImageHash)] = []
        let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
        decoded.reserveCapacity(sources.count)
        for (i, source) in sources.enumerated() {
            try request?.check(nextAllocationBytes: min(source.utf8.count, VisionPreprocess.maxImageBytes * 2), phase: "image source decoding")
            do {
                let data = try VisionPreprocess.loadImageData(from: source)
                decoded.append(try sourceBatch.decode(data, request: request))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let decodedSeconds = RuntimeClock.seconds(since: started)
        let (visionConfig, pixelBounds) = try VisionTower.configuration(directory: modelDir)
        var items: [VisionPrompt.Item] = []
        items.reserveCapacity(decoded.count)
        var expandedCount = baseIds.count
        for (i, d) in decoded.enumerated() {
            try request?.check(phase: "image geometry")
            do {
                let plan = try VisionTower.plan(height: d.cg.height, width: d.cg.width,
                    cfg: visionConfig, bounds: pixelBounds)
                let (next, overflow) = expandedCount.addingReportingOverflow(plan.mergedTokens - 1)
                guard !overflow, next <= min(maxContextTokens, ContextPolicy.visionLimit) else {
                    throw RequestFailure(.contextLengthExceeded,
                        "image-expanded input exceeds the configured or qualified vision context; reduce the history or image count")
                }
                expandedCount = next
                items.append(VisionPrompt.Item(image: d.cg, plan: plan))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let towerStart = RuntimeClock.now()
        let workspace = items.map { ContextWorkspace.visionBytes(patches: $0.plan.patches,
            hidden: visionConfig.hiddenSize, heads: visionConfig.numHeads,
            queryTile: model.optimizations.visionQueryTile, padding: model.optimizations.visionAttentionPadding) }.max() ?? 0
        let vt = try ensureVisionTower(request: request, workspaceBytes: ContextBytes.sum(workspace, sourceBatch.chargedBytes))
        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
        // The template renders one `<|image_pad|>` per image; the tower
        // produces `mergedTokens` rows for it. Expanding the pad into a run of
        // that length is what makes the two line up, and it moves every token
        // after the first image — ids and segment offsets alike, in one sweep,
        // so a later prompt that extends this one keys identically.
        let imageId = model.cfg.imageTokenId
        let perImage = items.map { $0.plan.mergedTokens }
        var expanded: [Int] = []
        var segments: [ImageSegment] = []
        expanded.reserveCapacity(baseIds.count + perImage.reduce(0, +) - perImage.count)
        var imgIdx = 0
        for tok in baseIds {
            if tok == imageId, imgIdx < perImage.count {
                segments.append(
                    ImageSegment(
                        start: expanded.count, count: perImage[imgIdx], hash: decoded[imgIdx].hash))
                expanded.append(contentsOf: repeatElement(imageId, count: perImage[imgIdx]))
                imgIdx += 1
            } else {
                expanded.append(tok)
            }
        }
        // Both directions are checked. Too few placeholders means the template
        // did not render an image this code found; too many means something
        // else in the prompt tokenized to the placeholder id — a user who
        // typed the literal `<|image_pad|>`, for instance. Either way the rows
        // and the runs would not correspond, so the request stops here rather
        // than putting embeddings under the wrong tokens.
        guard imgIdx == items.count else {
            throw SlotstreamError.vision(
                "the chat template rendered \(imgIdx) image placeholders for \(items.count) "
                    + "images; slotstream cannot place the rest")
        }
        let placeholders = expanded.reduce(0) { $0 + ($1 == imageId ? 1 : 0) }
        guard placeholders == perImage.reduce(0, +) else {
            throw SlotstreamError.vision(
                "the prompt carries \(placeholders) image placeholder tokens but the images "
                    + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                    + "from the text")
        }
        guard expanded.count <= min(maxContextTokens, ContextPolicy.visionLimit) else {
            throw RequestFailure(.contextLengthExceeded, "image-expanded input exceeds the configured or qualified vision context limit")
        }
        let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
        prompt.preparationRequest = request
        prompt.preparationObservation = ImagePreparationObservation(
            seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
            towerReadySeconds: towerReadySeconds, sampledFootprint: observer?.finish(),
            vmBefore: vmBefore, vmAfter: generator.footprintSampling ? ProcessMemory.vmActivity() : nil,
            sourceDecodedImages: sourceBatch.decodedImages, sourceReusedImages: sourceBatch.reusedImages,
            sourceAdmissionBytes: sourceBatch.chargedBytes)
        observationFinished = true
        return (expanded, prompt)
    }

    /// Every image a request carries, in the order the chat template will
    /// render them: message by message, part by part, and Ollama's per-message
    /// `images` array after that message's content parts — which is where the
    /// template puts them too.
    public static func imageSources(in messages: [[String: Any]]) -> [String] {
        var out: [String] = []
        for m in messages {
            if let content = m["content"] as? [[String: Any]] {
                for part in content {
                    if let iu = part["image_url"] as? [String: Any], let u = iu["url"] as? String {
                        out.append(u)
                    } else if let u = part["image_url"] as? String {
                        out.append(u)
                    } else if let u = part["image"] as? String {
                        out.append(u)
                    }
                }
            }
            for b64 in (m["images"] as? [String] ?? []) { out.append(b64) }
        }
        return out
    }

    /// Earliest position at which any stop sequence occurs, or nil.
    private static func stopIndex(_ text: String, _ stops: [String]) -> String.Index? {
        var best: String.Index?
        for s in stops {
            if let r = text.range(of: s), best == nil || r.lowerBound < best! {
                best = r.lowerBound
            }
        }
        return best
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    ///
    /// Incremental detokenization consumes bounded groups of token ids, keeping
    /// incomplete UTF-8 bytes at the group boundary. Two rules matter:
    ///
    /// - Emission and stop holdback are by Unicode scalar, never Character. A
    ///   later token can contribute a scalar that merges into the grapheme
    ///   already sent (an emoji plus U+FE0F is still one Character).
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        generate(promptIds: promptIds, params: params, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        let requestStart = RuntimeClock.now()
        let control: RequestController
        do {
            if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
            if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
            control = try request ?? beginRequest()
            try control.attachReservations(requestReservations)
            guard control.configuration.maxContextTokens <= allocatedContextTokens else {
                throw RequestFailure(.invalidConfiguration, "request policy exceeds the allocated engine window")
            }
            if let why = contextError(promptTokens: promptIds.count) {
                throw RequestFailure(.contextLengthExceeded, why)
            }
            guard promptIds.count <= control.configuration.maxContextTokens else {
                throw RequestFailure(.contextLengthExceeded, "prompt exceeds this request's configured context window")
            }
            try lock.lock(request: control)
        } catch {
            var stats = GenStats(); stats.promptTokens = promptIds.count
            let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            if failure.code == .insufficientMemory, let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let queueSeconds = RuntimeClock.seconds(since: requestStart)
        let preparationSeconds = max(0, control.elapsedSeconds - queueSeconds)
        defer { control.releaseDispatchReservation(); lock.unlock() }
        var params = params.sanitized()
        // A queued request may acquire the lock before the waiting governor.
        // Refuse it before image encoding, cache checkout or GPU allocation.
        if let ticket = pressureBoundary.snapshot() {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.memoryPressureCancelled = true
            let failure = control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            stats.requestFailure = failure; stats.runtimeError = failure.message
            stats.finishReason = "error"
            stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let modeLimit = vision == nil ? ContextPolicy.modelLimit : ContextPolicy.visionLimit
        let effectiveWindow = min(maxContextTokens, control.configuration.maxContextTokens, modeLimit)
        guard promptIds.count <= effectiveWindow else {
            let failure = control.fail(RequestFailure(.contextLengthExceeded,
                "prompt exceeds the configured or qualified vision context window"))
            var stats = GenStats(); stats.promptTokens = promptIds.count
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.queueSeconds = queueSeconds; stats.preparationSeconds = preparationSeconds
            return ("", [], stats)
        }
        let room = max(0, effectiveWindow - promptIds.count)
        if room == 0 {
            if onAdmitted?() == false { control.cancel() }
            var stats = GenStats()
            if let failure = control.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message
            }
            stats.promptTokens = promptIds.count
            stats.finishReason = control.failure == nil ? "length" : "error"
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        // Context is prompt + completion, not two independent 32k allowances.
        params.maxTokens = min(params.maxTokens, room)
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var pendingIds: [Int] = []
        var withheld = ""
        var delivered = ""
        var lastTok = -1
        var clientGone = false
        var stopFound = false
        var firstTextSeconds: Double?
        var pressureObserved: PressureTicket?
        var pressureBoundarySeconds: Double?

        func observePressure() -> Bool {
            guard let ticket = pressureBoundary.snapshot() else { return false }
            control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            if pressureObserved == nil {
                pressureObserved = ticket
                pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            return true
        }

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
            if firstTextSeconds == nil { firstTextSeconds = RuntimeClock.seconds(since: requestStart) }
            return cb(tok, delta)
        }

        /// Feed a stable decoded piece through the stop-sequence holdback.
        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {
            withheld += piece
            if !stops.isEmpty, let cut = Self.stopIndex(withheld, stops) {
                _ = emit(String(withheld[..<cut]), tok)
                withheld = ""
                stopFound = true
                return false
            }
            let scalars = withheld.unicodeScalars
            let n = final ? scalars.count : max(0, scalars.count - holdBack)
            let delta = String(String.UnicodeScalarView(scalars.prefix(n)))
            withheld = String(String.UnicodeScalarView(scalars.dropFirst(n)))
            return emit(delta, tok)
        }

        /// Qwen's ByteLevel decoder is concatenative once a UTF-8 scalar is
        /// complete. Decode small bounded groups and retain four token bytes at
        /// the boundary; if the candidate still ends in U+FFFD, retain more.
        /// This makes streaming decode O(n), rather than decoding tokens 1...n
        /// after every generated token.
        func flushStablePrefix(_ tok: Int) -> Bool {
            guard !pendingIds.isEmpty else { return true }
            // Start from everything buffered and hand back one token at a time
            // while the decode still ends mid-scalar. Waiting for eight tokens
            // before the first flush and holding four back after it gave
            // clients one delta per four tokens, and no delta at all for a
            // reply shorter than eight; the byte-exactness this protects rests
            // on the replacement-character check below, not on the backlog.
            var n = pendingIds.count
            var piece = ""
            while n > 0 {
                piece = tokenizer.decode(
                    tokens: Array(pendingIds.prefix(n)), skipSpecialTokens: true)
                if !piece.hasSuffix("\u{FFFD}") { break }
                n -= 1
            }
            guard n > 0 else { return true }
            pendingIds.removeFirst(n)
            return feed(piece, final: false, tok: tok)
        }

        let needsIncrementalDecode = onToken != nil || !stops.isEmpty
        let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
            control.sampledFirstToken()
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            // A pressure event can arrive inside a client callback. This is
            // already a supported committed-emission boundary in both decode
            // paths; do not spend another forward before observing it.
            return ok && !observePressure()
        } : { _ in control.sampledFirstToken(); return !observePressure() }

        var (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            vision: vision,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                if observePressure() { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler, request: control, onAdmitted: onAdmitted)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, control.failure == nil, stats.runtimeError == nil, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        stats.queueSeconds = queueSeconds
        stats.preparationSeconds = preparationSeconds
        stats.memoryPressureCancelled = pressureObserved != nil
        if pressureObserved != nil {
            stats.runtimeError = stats.runtimeError
                ?? "memory pressure interrupted inference; retry after the cache resizes"
            stats.finishReason = "error"
        }
        stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
        stats.firstTextSeconds = firstTextSeconds
        if let failure = control.failure {
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            // A request guard can see the ticket before the legacy continuation
            // callback runs. Preserve the same observed boundary in that path.
            if failure.code == .insufficientMemory, stats.memoryPressureBoundarySeconds == nil,
               let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            prefixCache.drop()
            Stream.gpu.synchronize()
            MLX.Memory.clearCache()
        }
        stats.requestSeconds = control.elapsedSeconds
        return (text, ids, stats)
    }
}

````````````

## Artifact SHA-256 673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2

Encoding: `gzip+base64`. Original bytes: 75288.

````````````text
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
````````````

## Artifact SHA-256 eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6

Encoding: `utf-8`. Original bytes: 54782.

````````````text
// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    /// All recurrent state and complete-prompt logits belong to this loaded model, even
    /// when another model has the same vocabulary and cache geometry.
    package let promptCheckpointIdentity = UUID()
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    public let pool: SlotPool
    public let ngram: NgramStore
    public var optimizations: InferenceOptimizations
    /// Only the bounded long-context prefill path selects this arithmetic.
    /// Kept outside the independent optimization candidate bundle.
    package var smallPrefillSweep = false
    package var smallPrefillReferenceStart = 0
    package var smallPrefillReferenceEnd = ContextPolicy.modelLimit
    package var alignSmallReferenceDispatch = false
    package var stableSmallPrefillRouting = false
    package var stableSmallPrefillAttention = false
    package var stableSmallPrefillProjections = false
    public var paddedSmallKeyDomains: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallKeyDomains } }
    public var paddedSmallQueryRows: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallQueryRows } }
    public var smallPrefillSweeps: Int { moe.values.reduce(0) { $0 + $1.smallPrefillSweeps } }
    public var residentExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.residentPrelaunches } }
    public var residentExpertJoins: Int { moe.values.reduce(0) { $0 + $1.residentJoins } }
    public var residentExpertJoinSeconds: Double { moe.values.reduce(0) { $0 + $1.residentJoinSeconds } }
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    /// Lazy dispatch counters; GPU completion is established by evaluated outputs,
    /// never inferred from these scheduled-operation counts alone.
    public var fusedRoPERotationsScheduled: Int { rope.fusedRotationsScheduled }
    public var ropeTableHits: Int { rope.tableHits }
    public var ropeTableBuilds: Int { rope.tableBuilds }
    public var fusedGDNProjectionsScheduled: Int { gdn.values.reduce(0) { $0 + $1.fusedProjectionsScheduled } }
    func prepareOptimizationKernels() {
        for layer in gdn.values { layer.fuseInputProjection = optimizations.fusedGDNProjection }
        rope.sharedTables = optimizations.sharedRoPE
        rope.fusedRotation = optimizations.fusedRoPE && PartialRotation.prepare()
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.cpuSlotWrites = optimizations.cpuSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)?
    package var contextNumericsObserver: ((Int, String, MLXArray) -> Void)?
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var modelIdentity: UUID?
        package var ownerModelIdentity: UUID? { modelIdentity }
        let checkpointIdentity = UUID()
        var checkpointLifetimes: [WeakStateCheckpointLifetime] = []
        var recordingEnabled = false
        var recordedTokenIds: [Int]?
        var recordingBaseTokenCount: Int?
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        // A failed low-level forward can change early layers while tokenCount
        // still names the preceding boundary. Count alone cannot certify reuse.
        var committedBoundaryValid = true
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        public init() {}
    }

    public convenience init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        try self.init(index: index, poolSlots: poolSlots, runLayers: runLayers, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil, embeddingRowCache: Bool?,
                 packGDNProjections: Bool? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index, embeddingRowCache: embeddingRowCache,
            packGDNProjections: packGDNProjections ?? optimizations.fusedGDNProjection)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
    }

    /// Bound the next physical sequence allocations, keeping main, draft,
    /// raw-indexer and pooled-indexer capacity separate. Rollback retains spare
    /// rows, but they can only be reused by the buffer that actually owns them.
    package func sequenceAllocationBytes(tokens: Int, draftTokens: Int?, state: State,
                                         sharedBacking: Bool = false) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit,
              draftTokens.map({ $0 >= 0 && $0 <= ContextPolicy.modelLimit }) ?? true else { return Int.max }
        let kvRowBytes = ContextBytes.product(cfg.numKVHeads, cfg.headDim, 2)
        let indexRowBytes = ContextBytes.product(cfg.indexerHeadDim, 2)
        func bytes(_ end: Int, kv: KVCache?, index: IndexerCache?, compact: Bool) -> Int {
            func replacement(_ count: Int, _ rowBytes: Int, _ owned: Int, step: Int = 1024) -> Int {
                ContextGeometry.nextBufferAllocationBytes(tokens: count, rowBytes: rowBytes,
                    allocatedBytes: sharedBacking ? 0 : owned, step: step)
            }
            let rawBase = index?.rawBase ?? 0
            guard end >= rawBase else { return Int.max }
            var result = ContextBytes.sum(
                replacement(end, kvRowBytes, kv?.keys?.nbytes ?? 0),
                replacement(end, kvRowBytes, kv?.values?.nbytes ?? 0),
                replacement(end - rawBase, indexRowBytes, index?.rawAllocatedBytes ?? 0,
                    step: compact && rawBase > 0 ? 256 : 1024))
            if end > cfg.indexerBudget, optimizations.incrementalIndexer || compact {
                let blocks = end / cfg.indexerCompressRatio
                result = ContextBytes.sum(result, replacement(blocks, indexRowBytes,
                    index?.pooledAllocatedBytes ?? 0, step: 256))
                if compact {
                    let first = min(blocks * cfg.indexerCompressRatio,
                        max(0, end - 32) / cfg.indexerCompressRatio * cfg.indexerCompressRatio)
                    if first - rawBase >= 256 {
                        // Compaction also creates a fresh small tail before
                        // releasing its parent; it is not a pre-allocation credit.
                        result = ContextBytes.sum(result, replacement(end - first, indexRowBytes, 0, step: 256))
                    }
                }
            }
            return result
        }
        var total = 0
        for layer in 0 ..< runLayers where cfg.layerTypes[layer] != "linear_attention" {
            let index = state.indexer[layer]
            total = ContextBytes.sum(total, bytes(tokens, kv: state.kv[layer], index: index,
                compact: index?.compactRaw ?? optimizations.compactIndexerRaw))
        }
        if let draftTokens {
            total = ContextBytes.sum(total, bytes(draftTokens, kv: state.mtp?.kv,
                index: state.mtp?.indexer, compact: state.mtp?.indexer.compactRaw ?? false))
        }
        return total
    }

    public func makeState() -> State {
        let s = State()
        s.modelIdentity = promptCheckpointIdentity
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func validateForward(_ ids: [Int], state: State) throws {
        guard !ids.isEmpty, ids.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }) else {
            throw ModelError("model forward requires a nonempty sequence of valid token IDs")
        }
        guard state.committedBoundaryValid else {
            throw ModelError("model state has an incomplete forward; restore a committed checkpoint or create a new state")
        }
        // State() and tokenCount are public API. Reject an uninitialized,
        // incompatible or offset-corrupted state before changing any cache;
        // otherwise QSA's required cache access can trap after early layers
        // have already advanced. MTP alignment is intentionally checked by
        // its own lifecycle: target verification may have a provisional head.
        guard state.modelIdentity == promptCheckpointIdentity,
              state.tokenCount >= 0, ids.count <= Int(Int32.max),
              state.tokenCount <= Int(Int32.max) - ids.count,
              state.linear.count == gdn.count,
              state.kv.count == qsa.count, state.indexer.count == qsa.count,
              gdn.keys.allSatisfy({ state.linear[$0] != nil }),
              qsa.keys.allSatisfy({ state.kv[$0]?.offset == state.tokenCount
                  && state.indexer[$0]?.offset == state.tokenCount }) else {
            throw ModelError("model state is uninitialized, incompatible or offset-inconsistent; use makeState() or restore a committed checkpoint")
        }
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti
    ) throws -> MLXArray? {
        try validateForward(ids, state: state)
        state.recordedTokenIds = state.recordingEnabled ? ids : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        let S = ids.count
        let referenceRows: Int
        if alignSmallReferenceDispatch, smallPrefillSweep, state.tokenCount >= smallPrefillReferenceStart,
           state.tokenCount < smallPrefillReferenceEnd {
            let blockStart = smallPrefillReferenceStart + ((state.tokenCount - smallPrefillReferenceStart) / 256) * 256
            referenceRows = min(256, smallPrefillReferenceEnd - blockStart)
        } else { referenceRows = 256 }
        let projectionRows = stableSmallPrefillProjections && smallPrefillSweep && S < referenceRows ? referenceRows : 0
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        let terminalLastQuery = terminalPruning && optimizations.terminalLastQuery && demand == .lastRow
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        // A workspace holds a full layer of expert weights while reducing
        // routed tiles. Freed MLX buffers must not coexist with that live
        // allocation: its cache limit admits one last whole buffer and can
        // overshoot the requested byte limit. Clear only disposable buffers;
        // expert residency, tensor shapes and evaluation order stay intact.
        let savedWorkspaceCacheLimit = optimizations.layerExpertWorkspace && S >= SweepTuning.minTokens
            ? MLX.Memory.cacheLimit : nil
        if savedWorkspaceCacheLimit != nil {
            MLX.Memory.cacheLimit = 0
            MLX.Memory.clearCache()
        }
        defer {
            if let savedWorkspaceCacheLimit { MLX.Memory.cacheLimit = savedWorkspaceCacheLimit }
        }
        prepareOptimizationKernels()
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        var h0 = try resident.embedChecked(ids, shape: [1, S]).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            moe[l]!.overlapResident = optimizations.overlapResidentExperts
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            attnHC[l].minimumProjectionRows = projectionRows
            mlpHC[l].minimumProjectionRows = projectionRows
            gdn[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.indexer.minimumProjectionRows = projectionRows
            ple[l]?.minimumProjectionRows = projectionRows
            moe[l]!.minimumProjectionRows = projectionRows
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let lastQuery = terminalLastQuery && l == runLayers - 1
                    if lastQuery && hi < S {
                        // Earlier tiles contribute only persistent keys. Keep
                        // each original PLE/HC/projection compute shape.
                        var hidden = h[0..., lo ..< hi, 0...]
                        if let p = ple[l] {
                            p.boundedTokens = true
                            hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + hi]),
                                nNew: hi - lo, cache: state.linear[l])
                        }
                        qsa[l]!.appendKeysOnly(attnHC[l](hidden).0, rope: rope,
                            cache: state.kv[l]!, idxCache: state.indexer[l]!)
                        if shouldContinue?() == false { return nil }
                        continue
                    }
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state, lastQueryOnly: lastQuery)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = routerObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let row = input.dim(1) - 1
                    let output = try moe[l]!(input[0..., row..., 0...])
                    h = base[0..., row..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., row..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                    if terminalLastQuery { terminalQueryRowsSkipped += S - input.dim(1) }
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            contextNumericsObserver?(l, "x1", x1)
            contextNumericsObserver?(l, "inj1", inj1!)
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.stableSmallKeyDomain = stableSmallPrefillAttention && smallPrefillSweep
                qsa[l]!.smallReferenceStart = smallPrefillReferenceStart
                qsa[l]!.smallReferenceEnd = smallPrefillReferenceEnd
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!,
                    lastQueryOnly: terminalLastQuery && l == runLayers - 1)
            }
            contextNumericsObserver?(l, "attn", attnOut)
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            let lastQuery = terminalLastQuery && l == runLayers - 1
            let attentionInjection: MLXArray
            if lastQuery {
                let first = S - attnOut.dim(1)
                h = h[0..., first..., 0...]
                attentionInjection = inj1![0..., first..., 0...]
                terminalQueryRowsSkipped += first
            } else { attentionInjection = inj1! }
            h = h + (attnOut.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            contextNumericsObserver?(l, "hAfterAttn", h)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let mlpRow = h.dim(1) - 1
            let x2 = pruneLastMoE ? fullMLPInput[0..., mlpRow..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., mlpRow..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., mlpRow..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            contextNumericsObserver?(l, "x2", x2)
            contextNumericsObserver?(l, "inj2", inj2!)
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = routerObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            // A canonical terminal pass shorter than 256 uses the pool path.
            // Its smaller subpasses must preserve that expert arithmetic too.
            moe[l]!.smallPrefillSweep = smallPrefillSweep && referenceRows == 256
            moe[l]!.routerProjection.minimumRows = stableSmallPrefillRouting && smallPrefillSweep && S < referenceRows ? referenceRows : 0
            if let observe = contextNumericsObserver {
                moe[l]!.contextNumericsObserver = { name, value in observe(l, name, value) }
            } else { moe[l]!.contextNumericsObserver = nil }
            let moeOut = try moe[l]!(x2)
            contextNumericsObserver?(l, "moe", moeOut)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        state.committedBoundaryValid = true
        return h
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil) -> MLXArray {
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State, lastQueryOnly: Bool = false)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!, lastQueryOnly: lastQueryOnly)
        }
        let attentionInjection: MLXArray
        if lastQueryOnly {
            let first = h.dim(1) - attention.dim(1)
            h = h[0..., first..., 0...]
            attentionInjection = inject![0..., first..., 0...]
        } else { attentionInjection = inject! }
        h = h + (attention.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) throws -> (logits: MLXArray?, committed: Bool) {
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        try validateForward(ids, state: state)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = try head.consumeChecked(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var lifetime: StateCheckpointLifetime
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var committedBoundaryValid: Bool
    var mtpBoundaryValid: Bool
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        checkpointLifetimes.removeAll { $0.value == nil }
        let lifetime = StateCheckpointLifetime(owner: checkpointIdentity, tokens: tokenCount,
            mtpOffset: mtp?.offset ?? 0)
        checkpointLifetimes.append(WeakStateCheckpointLifetime(lifetime))
        return StateCheckpoint(
            lifetime: lifetime, conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            committedBoundaryValid: committedBoundaryValid,
            mtpBoundaryValid: mtp == nil || hasValidMTP
                || (tokenCount == 0 && mtp?.offset == 0 && lastMulti == nil),
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        recordingEnabled = on
        recordedTokenIds = nil
        recordingBaseTokenCount = nil
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        do { try rollbackChecked(keeping: n, of: ids, from: c, ngramWindow: ngramWindow) }
        catch { preconditionFailure("\(error)") }
    }

    /// Recover only the recorded pass on this state; reject invalid input before mutation.
    public func rollbackChecked(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) throws {
        try validateRollback(keeping: n, ids: ids, checkpoint: c, ngramWindow: ngramWindow)
        if n < ids.count {
            for (_, cache) in linear {
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        invalidateCheckpoints(after: tokenCount, mtpOffset: nil)
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        do { try restoreChecked(c) }
        catch { preconditionFailure("\(error)") }
    }

    /// Restore a live ancestor checkpoint from this exact state. KV storage is
    /// append-only, so snapshots from discarded future branches cannot be reused.
    public func restoreChecked(_ c: StateCheckpoint) throws {
        try validateCheckpoint(c)
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        committedBoundaryValid = c.committedBoundaryValid
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
        invalidateCheckpoints(after: tokenCount, mtpOffset: c.mtpOffset)
        setRecording(false)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}

````````````

## Artifact SHA-256 c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729

Encoding: `utf-8`. Original bytes: 14292.

````````````text
import Foundation

/// Explicit controls for independently evaluated execution paths. The public
/// initializer is the reference; environment resolution selects the deployment
/// family and applies explicit overrides. Experimental paths remain disabled.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    /// Experimental shortening changes verification shapes and can change
    /// greedy output. Excluded from the combined candidate; sampled requests
    /// retain their original shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// Joint execution family used by deployment selection and its diagnostics.
    /// The public initializer remains the explicit reference. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Select the automatically deployed family with the measured kernel
    /// qualification boundary. Explicit controls can qualify another platform;
    /// kernel initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: deploymentCandidate())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

## Artifact SHA-256 fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655

Encoding: `utf-8`. Original bytes: 12590.

````````````text
import Foundation

public struct ContextConfiguration: Sendable, Equatable {
    public static let defaultWaitMinutes = 30.0
    public let maxContextTokens: Int
    public let maxPrefillWaitMinutes: Double
    /// Explicit diagnostic qualification, never inferred from a mutable cap.
    public let qualification: Bool

    public init(maxContextTokens: Int = ContextPolicy.defaultTokens,
                maxPrefillWaitMinutes: Double = defaultWaitMinutes,
                qualification: Bool = false) throws {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) {
            throw RequestFailure(.contextLengthExceeded, why)
        }
        guard maxPrefillWaitMinutes.isFinite, maxPrefillWaitMinutes >= 0,
              maxPrefillWaitMinutes <= Double(UInt64.max) / 60 / 1e9 else {
            throw RequestFailure(.invalidConfiguration,
                "--max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy")
        }
        self.maxContextTokens = maxContextTokens
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.qualification = qualification
    }
}

public struct RequestFailure: Error, CustomStringConvertible, Codable, Sendable, Equatable {
    public enum Code: String, Codable, Sendable {
        case contextLengthExceeded = "context_length_exceeded"
        case invalidConfiguration = "invalid_configuration"
        case prefillWaitExceeded = "prefill_wait_exceeded"
        case insufficientMemory = "insufficient_memory"
        case prefillDeadlineExceeded = "prefill_deadline_exceeded"
        case clientCancelled = "client_cancelled"
        case inferenceError = "inference_error"
    }
    public let code: Code
    public let message: String
    public var elapsedSeconds: Double?
    public var limitSeconds: Double?
    public var estimatedSeconds: Double?
    public var requiredBytes: Int?
    public var availableBytes: Int?
    public init(_ code: Code, _ message: String) { self.code = code; self.message = message }
    public var description: String { message }
    public var httpStatus: String {
        switch code {
        case .contextLengthExceeded, .invalidConfiguration, .prefillWaitExceeded: return "400 Bad Request"
        case .insufficientMemory, .prefillDeadlineExceeded: return "503 Service Unavailable"
        case .clientCancelled: return "499 Client Closed Request"
        case .inferenceError: return "500 Internal Server Error"
        }
    }
    public var json: [String: Any] {
        var result: [String: Any] = ["code": code.rawValue, "type": code.rawValue, "message": message]
        if let elapsedSeconds { result["elapsed_seconds"] = elapsedSeconds }
        if let limitSeconds { result["limit_seconds"] = limitSeconds }
        if let estimatedSeconds { result["estimated_seconds"] = estimatedSeconds }
        if let requiredBytes { result["required_bytes"] = requiredBytes }
        if let availableBytes { result["available_bytes"] = availableBytes }
        return result
    }
}

/// Atomic admission for allocations that concurrent accepted requests have
/// reserved but may not have materialized yet. Retained preparation stays
/// charged until its controller is released, including time in the queue.
package final class RequestMemoryReservations: @unchecked Sendable {
    private let lock = NSLock()
    private var entries: [UUID: [String: Int]] = [:]
    package init() {}
    package var reservedBytes: Int { lock.withLock { entries.values.reduce(0) { ContextBytes.sum($0, $1.values.reduce(0) { ContextBytes.sum($0, $1) }) } } }
    package func release(_ id: UUID) { lock.withLock { _ = entries.removeValue(forKey: id) } }
    package func releaseDispatch(_ id: UUID) { lock.withLock { entries[id]?["dispatch"] = nil } }

    package func check(_ id: UUID, kind: String?, bytes: Int, slack: Int,
                       available: () -> Double?, phase: String) throws {
        try lock.withLock {
            var own = entries[id] ?? [:]
            if let kind { own[kind] = kind == "dispatch" ? bytes : max(own[kind] ?? 0, bytes) }
            let others = entries.reduce(0) { sum, entry in
                entry.key == id ? sum : ContextBytes.sum(sum, entry.value.values.reduce(0) { ContextBytes.sum($0, $1) })
            }
            let proposed = kind == nil ? 0 : own.values.reduce(0) { ContextBytes.sum($0, $1) }
            let required = ContextBytes.sum(others, proposed, slack)
            guard let gb = available(), gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 else {
                throw RequestFailure(.insufficientMemory, "reclaimable memory is unreadable during \(phase)")
            }
            let observed = Int(gb * 1e9)
            guard required < Int.max, observed >= required else {
                var failure = RequestFailure(.insufficientMemory,
                    "insufficient memory for \(phase), queued requests and safety headroom; retry after other requests finish")
                failure.requiredBytes = required; failure.availableBytes = observed
                throw failure
            }
            if kind != nil { entries[id] = own }
        }
    }
}

/// One accepted request owns one monotonic clock, including all queue and
/// preparation work. Neither transport activity nor prefix reuse restarts it.
/// Injectable observations exercise refusal without stressing the machine.
public final class RequestController: @unchecked Sendable {
    public let configuration: ContextConfiguration
    public let slackBytes: Int
    private let clock: () -> UInt64
    private let available: () -> Double?
    private let connected: () -> Bool
    private let pressure: () -> Bool
    private let started: UInt64
    private let lock = NSLock()
    private var failureValue: RequestFailure?
    private var firstToken = false
    private var estimateValue: Double?
    private let reservationID = UUID()
    private var reservations: RequestMemoryReservations?
    public var estimatedPrefillSeconds: Double? { lock.withLock { estimateValue } }

    public init(configuration: ContextConfiguration, slackBytes: Int,
                clock: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds },
                availableGB: @escaping () -> Double? = { Planner.deviceAvailableGB() },
                connected: @escaping () -> Bool = { true }, pressure: @escaping () -> Bool = { false }) {
        self.configuration = configuration
        self.slackBytes = max(0, slackBytes)
        self.clock = clock; self.available = availableGB; self.connected = connected; self.pressure = pressure
        started = clock()
    }
    deinit { reservations?.release(reservationID) }
    package func attachReservations(_ pool: RequestMemoryReservations) throws {
        try lock.withLock {
            if let reservations, reservations !== pool {
                throw RequestFailure(.invalidConfiguration, "a request cannot move between engine memory budgets")
            }
            reservations = pool
        }
    }
    package func releaseDispatchReservation() {
        lock.withLock { reservations?.releaseDispatch(reservationID) }
    }
    public var elapsedSeconds: Double {
        let now = clock()
        return Double(now >= started ? now - started : 0) / 1e9
    }
    public var failure: RequestFailure? { lock.withLock { failureValue } }
    public var mayRetainState: Bool { failure == nil }
    @discardableResult public func fail(_ error: RequestFailure) -> RequestFailure {
        lock.withLock {
            if failureValue == nil { failureValue = error }
            return failureValue!
        }
    }
    public func cancel() { fail(RequestFailure(.clientCancelled, "the client cancelled this request")) }
    public func sampledFirstToken() { lock.withLock { firstToken = true } }

    /// Check before an allocation, not after it. Only actually reusable bytes
    /// can be subtracted by callers; future reservations never authorize growth.
    public func check(nextAllocationBytes: Int = 0, phase: String = "inference") throws {
        if let failure { throw failure }
        guard nextAllocationBytes >= 0 else {
            throw fail(RequestFailure(.invalidConfiguration, "allocation byte count must be nonnegative"))
        }
        if !connected() { throw fail(RequestFailure(.clientCancelled, "the client disconnected during \(phase)")) }
        let elapsed = elapsedSeconds
        let seconds = configuration.maxPrefillWaitMinutes * 60
        if seconds > 0, !lock.withLock({ firstToken }), elapsed >= seconds {
            var error = RequestFailure(.prefillDeadlineExceeded,
                "request-to-first-token deadline exceeded during \(phase); send less context or raise --max-prefill-wait")
            error.elapsedSeconds = elapsed; error.limitSeconds = seconds
            throw fail(error)
        }
        if pressure() {
            throw fail(RequestFailure(.insufficientMemory, "memory pressure interrupted \(phase); retry after memory becomes available"))
        }
        if let pool = lock.withLock({ reservations }) {
            do {
                try pool.check(reservationID, kind: nextAllocationBytes > 0 ? "dispatch" : nil,
                    bytes: nextAllocationBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
            return
        }
        let (required, overflow) = max(0, nextAllocationBytes).addingReportingOverflow(slackBytes)
        guard !overflow else { throw fail(RequestFailure(.insufficientMemory, "allocation size exceeds the supported memory range")) }
        let reading = available()
        if let gb = reading, gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
            let bytes = Int(gb * 1e9)
            if bytes < required {
                var error = RequestFailure(.insufficientMemory,
                    "insufficient reclaimable memory for \(phase) and safety headroom; close other apps or lower the memory/context target")
                error.requiredBytes = required; error.availableBytes = bytes
                throw fail(error)
            }
        } else if configuration.maxContextTokens > ContextPolicy.defaultTokens && nextAllocationBytes > 0 {
            throw fail(RequestFailure(.insufficientMemory,
                "reclaimable memory is unreadable; refusing additional long-context allocation during \(phase)"))
        }
    }

    /// Conservative temporary-copy allowance for templating/tokenization.
    /// Counting input must not itself serialize an arbitrarily large value.
    public func checkInputBytes(_ bytes: Int) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid input byte count")) }
        try reservePreparation(kind: "input", bytes: ContextBytes.product(bytes, 16), phase: "prompt tokenization")
    }

    package func reservePreparedImageBytes(_ bytes: Int) throws {
        try reservePreparation(kind: "pixels", bytes: bytes, phase: "retained image preparation")
    }
    private func reservePreparation(kind: String, bytes: Int, phase: String) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid preparation byte count")) }
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do { try pool.check(reservationID, kind: kind, bytes: bytes, slack: slackBytes, available: available, phase: phase) }
            catch let error as RequestFailure { throw fail(error) }
        } else { try check(nextAllocationBytes: bytes, phase: phase) }
    }

    public func admit(missingTokens: Int, from position: Int, maxChunk: Int,
                      tailAware: Bool = false) throws {
        try check(phase: "admission")
        let estimate = PrefillSchedule.estimateSeconds(tokens: missingTokens, from: position,
            maxChunk: maxChunk, tailAware: tailAware)
        lock.withLock { estimateValue = estimate }
        let limit = configuration.maxPrefillWaitMinutes * 60
        if limit > 0, let estimate, elapsedSeconds + estimate > limit {
            var error = RequestFailure(.prefillWaitExceeded,
                "estimated missing-context prefill exceeds the remaining wait budget; send less, reuse a valid prefix, or raise --max-prefill-wait")
            error.elapsedSeconds = elapsedSeconds; error.limitSeconds = limit; error.estimatedSeconds = estimate
            throw fail(error)
        }
    }
}

````````````

## Artifact SHA-256 76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db

Encoding: `utf-8`. Original bytes: 33864.

````````````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
            for mtp in [false, true] {
                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
                    mtpEnabled: mtp, maxContextTokens: cap)
                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
                    GovernorPolicy.desiredPlan(exhausted) == nil)
                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
                    GovernorPolicy.decide(exhausted), .hold)
                var recovered = exhausted
                recovered.availableGB = 10
                if let plan = GovernorPolicy.desiredPlan(recovered) {
                    let physical = min(recovered.workingSetGB, recovered.availableGB
                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
                        + (mtp ? Planner.mtpResidentGB : 0)
                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
                } else {
                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
                }
            }
        }
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        func expertWorkspace(_ tokens: Int = 4096, tile: Int = 1024,
                             batch: Int = 32, pool: Int = 0, admissions: Int = 0,
                             record: Int = 2_764_800) -> Int {
            ContextWorkspace.expertWorkspaceBytes(tokens: tokens, tile: tile, experts: 512,
                topK: 10, hidden: 2560, intermediate: 640, recordBytes: record,
                loadBatch: batch, admissionPoolBytes: pool, admissionRecords: admissions)
        }
        c.expect("scope admission prices old and replacement expert storage",
            expertWorkspace() >= 2 * 512 * 2_764_800 + 32 * 2_764_800)
        c.expect("scope staging override cannot hide a whole-layer upload",
            expertWorkspace(batch: 512) > expertWorkspace(batch: 32))
        c.expect("scope admission prices decode-pool replacement",
            expertWorkspace(pool: 1217 * 2_764_800, admissions: 25) > expertWorkspace())
        c.expect("large routed tile increases allocation reservation",
            expertWorkspace(tile: 4096) > expertWorkspace(tile: 1024))
        c.expect("merged routed tail cannot reduce allocation reservation",
            expertWorkspace(1279, tile: 1024) >= expertWorkspace(1024, tile: 1024))
        c.expect("retained scope outputs are charged beyond one compute tile",
            expertWorkspace(8192) > expertWorkspace(4096))
        c.equal("scope record overflow refuses before dispatch", expertWorkspace(record: Int.max), Int.max)
        c.equal("invalid scope tile refuses before dispatch", expertWorkspace(tile: 0), Int.max)
        c.equal("invalid scope staging refuses before dispatch", expertWorkspace(batch: 513), Int.max)
        c.equal("negative scope pool refuses before dispatch", expertWorkspace(pool: -1), Int.max)
        c.equal("scope admission requires an actual pool allocation", expertWorkspace(admissions: 1), Int.max)
        c.equal("invalid scope extent refuses before dispatch", expertWorkspace(0), Int.max)
        c.expect("grouped matmul expert padding is charged for a small route set",
            ContextWorkspace.expertWorkspaceBytes(tokens: 1, tile: 256, experts: 512,
                topK: 1, hidden: 2560, intermediate: 640, recordBytes: 1, loadBatch: 1)
                >= 2048 * (5 * 2560 + 4 * 640) * 4)
        c.equal("scope route geometry rejects more routes than experts",
            ContextWorkspace.expertWorkspaceBytes(tokens: 4096, tile: 1024, experts: 512,
                topK: 513, hidden: 2560, intermediate: 640, recordBytes: 2_764_800,
                loadBatch: 32), Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. A feasible restart and settled governor
        // must agree. The preserved legacy startup floor can also return an
        // advisory that exceeds the physical budget; that is a refusal case,
        // never evidence that the live governor should admit work.
        var governorCaps = Set<Int>()
        var advisoryRefusals = Set<String>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 12.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        let physicalBudget = min(input.workingSetGB,
                            whole - Planner.availabilitySlackGB(ramGB: input.ramGB))
                        let peak = Double(initial.memoryLedger.expectedPeakBytes)
                        let feasible = peak <= physicalBudget * 1e9
                            && (initial.targetGB.map { peak <= $0 * 1e9 } ?? true)
                        if !feasible {
                            advisoryRefusals.insert("\(cap)/\(prefix)/\(mode)/\(whole)")
                            c.expect("\(label): legacy startup advisory is refused live", settled == nil)
                            let target: Int
                            switch GovernorPolicy.decide(input) {
                            case .hold: target = input.currentSlots
                            case .resize(let slots, _): target = slots
                            }
                            c.equal("\(label): infeasible advisory settles at arena floor", target, Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - target)
                            input.currentSlots = target
                            c.expect("\(label): returning owned pool bytes cannot invent feasibility",
                                GovernorPolicy.desiredPlan(input) == nil)
                            c.equal("\(label): infeasible floor cannot shrink further", GovernorPolicy.decide(input), .hold)
                            continue
                        }
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        c.equal("governor matrix preserves all four original unphysical advisories", advisoryRefusals,
            Set(["8192/false/0/10.0", "8192/true/0/10.0", "32768/false/0/10.0", "32768/true/0/10.0"]))
        return c.report()
    }
}

````````````

## Artifact SHA-256 77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542

Encoding: `utf-8`. Original bytes: 61362.

````````````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Numerical/read-count probe only. Several states coexist for comparison;
    /// its resource and duration observations are not fresh-process A/B claims.
    public static func optimizationReadScope(modelDir: URL, tokens: Int) throws -> CheckReport {
        guard [4096, 8192].contains(tokens) else { throw ModelError("scope probe tokens must be 4096 or 8192") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var c = CheckBuilder("optimization-layer-read-scope")
        c.measure("workspace_token_tile", Double(model.optimizations.workspaceTokenTile))
        func build(chunk: Int, workspace: Bool) -> (Qwen4ExpModel.State, MLXArray, [Int: [Int32]], Int) {
            var options = InferenceOptimizations()
            options.compactStateWindows = true
            options.boundedIndexer = true
            options.boundedPLE = true
            options.layerExpertWorkspace = workspace
            options.workspaceTokenTile = model.optimizations.workspaceTokenTile
            options.compactScopeFrontier = model.optimizations.compactScopeFrontier
            model.optimizations = options
            model.pool.resetStats()
            model.pool.admitOnSweep = false
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
            let state = model.makeState()
            var last = MLXArray(Float(0))
            for lo in stride(from: 0, to: tokens, by: chunk) {
                last = model.lastLogits(Array(ids[lo ..< min(tokens, lo + chunk)]), state: state)
                eval(last)
            }
            model.routerObserver = nil
            return (state, last, routes, model.pool.recordsFetched)
        }
        let (reference, referenceLogits, referenceRoutes, referenceReads) = build(chunk: 4096, workspace: false)
        let (control, controlLogits, controlRoutes, controlReads) = build(chunk: 1024, workspace: false)
        let (candidate, candidateLogits, candidateRoutes, candidateReads) = build(chunk: tokens, workspace: true)
        func relative(_ a: MLXArray, _ b: MLXArray, spread: Bool = false) -> Double {
            guard a.shape == b.shape, a.dtype == b.dtype else { return .infinity }
            let af = a.asType(.float32), bf = b.asType(.float32)
            let delta = abs(af - bf).max().item(Float.self)
            let denominator = spread ? (bf.max() - bf.min()).item(Float.self) : abs(bf).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        let controlDelta = relative(controlLogits, referenceLogits, spread: true)
        let candidateDelta = relative(candidateLogits, referenceLogits, spread: true)
        c.measure("control_logit_spread_fraction", controlDelta)
        c.measure("candidate_logit_spread_fraction", candidateDelta)
        c.expect("logits inside preregistered rechunk band", candidateDelta <= max(3 * controlDelta, 0.01))
        c.equal("greedy final token", argMax(candidateLogits.reshaped([-1])).item(Int.self), argMax(referenceLogits.reshaped([-1])).item(Int.self))
        let rt = reference.diagnosticTensors(), ct = control.diagnosticTensors(), nt = candidate.diagnosticTensors()
        c.equal("candidate state fields", Set(nt.keys), Set(rt.keys))
        for key in rt.keys.sorted() {
            if let controlValue = ct[key], let candidateValue = nt[key] {
                if key == "tokens" || key == "ngram" {
                    c.expect("exact \(key)", (rt[key]! .== candidateValue).all().item(Bool.self))
                } else {
                    let baseline = relative(controlValue, rt[key]!)
                    let changed = relative(candidateValue, rt[key]!)
                    c.measure("control.\(key)", baseline)
                    c.measure("candidate.\(key)", changed)
                    c.expect("state band \(key)", changed <= max(3 * baseline, 0.01))
                }
            }
        }
        func routeDisagreement(_ routes: [Int: [Int32]]) -> Double {
            var different = 0, total = 0
            var stamps = [Int](repeating: 0, count: model.cfg.numExperts)
            var stamp = 0
            for layer in referenceRoutes.keys.sorted() {
                let ref = referenceRoutes[layer]!, got = routes[layer] ?? []
                guard ref.count == got.count else { return .infinity }
                for lo in stride(from: 0, to: ref.count, by: model.cfg.topK) {
                    stamp += 1
                    for i in lo ..< lo + model.cfg.topK { stamps[Int(ref[i])] = stamp }
                    for i in lo ..< lo + model.cfg.topK {
                        if stamps[Int(got[i])] != stamp { different += 1 }
                        total += 1
                    }
                }
            }
            return Double(different) / Double(max(1, total))
        }
        let ctrlRoutes = routeDisagreement(controlRoutes), newRoutes = routeDisagreement(candidateRoutes)
        c.measure("control_route_set_disagreement", ctrlRoutes)
        c.measure("candidate_route_set_disagreement", newRoutes)
        c.expect("routing inside preregistered rechunk band", newRoutes <= max(3 * ctrlRoutes, 0.01))
        c.measure("reference_read_records", Double(referenceReads))
        c.measure("control_read_records", Double(controlReads))
        c.measure("candidate_read_records", Double(candidateReads))
        c.expect("one record at most per layer/expert in a scope", candidateReads <= model.runLayers * model.cfg.numExperts)
        if tokens > 4096 { c.expect("larger scope reads fewer records", candidateReads < referenceReads) }
        c.measure("probe_process_footprint_end_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }

    public static func optimizationScopeLifecycle(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true
        options.layerExpertWorkspace = true; options.skipUnusedFinalForward = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        var c = CheckBuilder("optimization-scope-lifecycle")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined scope lifecycle uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        let prompt = (0 ..< 1280).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy; params.maxTokens = 1; params.seed = 7
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        func seed() -> PrefixCache {
            let cache = PrefixCache(maxTokens: 8192)
            let state = model.makeState()
            eval(model.lastLogits(Array(prompt.prefix(256)), state: state))
            cache.store(state: state, tokens: Array(prompt.prefix(256)))
            return cache
        }
        let referenceCache = seed(), candidateCache = seed()
        let seedState = referenceCache.take(matching: prompt, reserveTokens: 2048)!.state
        let untouched = seed()
        params.maxTokens = 1
        let (referenceIds, referenceStats) = generator.generate(promptIds: prompt, params: params,
            eosIds: [], cache: untouched)
        let referenceState = untouched.take(matching: prompt + referenceIds + [907], reserveTokens: 2048)!.state
        model.optimizations.readScopeTokens = 1024
        for cutLayer in [0, 1, 3, 47] {
            var layer = -1
            model.routerObserver = { current, _ in layer = current }
            let savedLimit = MLX.Memory.cacheLimit
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache,
                shouldContinue: { layer < cutLayer })
            model.routerObserver = nil
            c.expect("layer \(cutLayer): cancel emits no token", ids.isEmpty)
            c.equal("layer \(cutLayer): abort counted", stats.abortedReadScopes, 1)
            c.equal("layer \(cutLayer): no partial commit", stats.prefillTokens, 0)
            c.expect("layer \(cutLayer): no completed passes", stats.prefillPasses.isEmpty)
            c.equal("layer \(cutLayer): cache limit restored", MLX.Memory.cacheLimit, savedLimit)
            c.expect("layer \(cutLayer): admission restored", !model.pool.admitOnSweep)
            let hit = candidateCache.take(matching: prompt, reserveTokens: 2048)!
            c.equal("layer \(cutLayer): exact committed prefix", hit.reused, 256)
            equalState(seedState, hit.state, "layer \(cutLayer): restored state")
            candidateCache.store(state: hit.state, tokens: Array(prompt.prefix(256)))
        }
        let (candidateIds, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache)
        c.equal("retry exact output", candidateIds, referenceIds)
        c.equal("reference compute schedule", referenceStats.prefillComputePasses, [256, 256, 256, 256])
        c.equal("candidate preserves compute schedule", stats.prefillComputePasses, referenceStats.prefillComputePasses)
        c.equal("candidate commits one read scope", stats.prefillPasses, [1024])
        let candidateState = candidateCache.take(matching: prompt + candidateIds + [907], reserveTokens: 2048)!.state
        equalState(referenceState, candidateState, "retry exact continuation")
        c.expect("capacity remains charged after abort and growth", candidateState.allocatedSequenceBytes > 0)
        if integratedBase {
            c.expect("combined scope lifecycle executes fused rotation", model.fusedRoPERotationsScheduled > 0)
            c.equal("combined scope lifecycle returns an idle pool", model.pool.pinnedSlotCount, 0)
            // A cold read scope must not erase the independently qualified
            // common-prefix checkpoint merely by grouping past its boundary.
            let coldCache = PrefixCache(maxTokens: 8192)
            let cold = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: coldCache)
            c.equal("cold combined scope preserves exact output", cold.0, referenceIds)
            c.equal("cold combined scope stores the requested checkpoint", cold.1.prefixCheckpointStores, 1)
            c.equal("checkpoint splits only the read group", cold.1.prefillPasses, [256, 1024])
            c.equal("checkpoint preserves every compute pass", cold.1.prefillComputePasses, Array(repeating: 256, count: 5))
            if let complete = coldCache.take(matching: prompt + cold.0 + [907], reserveTokens: 2048) {
                equalState(referenceState, complete.state, "cold combined scope exact continuation")
            } else { c.expect("cold combined scope retains complete state", false) }
            let divergent = Array(prompt.prefix(256)) + [999]
            if let common = coldCache.take(matching: divergent, reserveTokens: 2048) {
                c.equal("divergent followup reuses the common checkpoint", common.reused, 256)
                equalState(seedState, common.state, "cold scope checkpoint matches chronological seed")
            } else { c.expect("cold scope retains the divergent followup checkpoint", false) }
            c.equal("cold scope and checkpoint forks release pool pins", model.pool.pinnedSlotCount, 0)
            for disabled in [PrefixCache(maxTokens: 8192, enabled: false), PrefixCache(maxTokens: 0)] {
                let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: disabled)
                c.equal("inactive cache preserves the original read groups", result.1.prefillPasses, [1024, 256])
                c.equal("inactive cache creates no checkpoint", result.1.prefixCheckpointStores, 0)
                c.equal("inactive cache retains exact scoped output", result.0, referenceIds)
            }
        }
        return c.report()
    }

    /// Synthetic already-encoded image rows isolate span/offset/state
    /// handling. The separate real-image serving gate covers tower execution.
    public static func optimizationScopeMTPVision(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let head = model.mtpHead!
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true; options.layerExpertWorkspace = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        let ids = (0 ..< 1024).map { 1000 + (($0 * 7919) % 200_000) }
        let rows = MLXArray((0 ..< 640 * model.cfg.hiddenSize).map { Float($0 % 29 - 14) / 32 },
            [640, model.cfg.hiddenSize]).asType(.bfloat16)
        eval(rows)
        let run = VisionRun(start: 128, rows: rows)
        var c = CheckBuilder("optimization-scope-mtp-vision")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined MTP/vision scope uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        func equal(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let av = a.diagnosticTensors(), bv = b.diagnosticTensors()
            c.equal("\(name): fields", Set(av.keys), Set(bv.keys))
            for key in av.keys.sorted() {
                if let v = bv[key] { c.expect("\(name): \(key)", av[key]!.shape == v.shape && (av[key]! .== v).all().item(Bool.self)) }
            }
        }
        func consume(_ state: Qwen4ExpModel.State, _ range: Range<Int>) -> MLXArray {
            let chunk = Array(ids[range]), vision = [run.clipped(to: range.lowerBound, range.upperBound)].compactMap { $0 }
            let (mixed, multi) = model.hiddenStatesWithMulti(chunk, state: state, vision: vision)
            state.lastMulti = head.consume(chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                resident: model.resident, rope: model.sharedRope, state: state.mtp!, vision: vision, compactRetainedRow: true)
            eval(mixed); return mixed
        }
        func seed() -> Qwen4ExpModel.State {
            let state = model.makeState(); state.mtp = MTPState()
            _ = consume(state, 0 ..< 256); return state
        }
        let seedState = seed(), reference = seed(), candidate = seed()
        for lo in stride(from: 256, to: 1024, by: 256) { _ = consume(reference, lo ..< lo + 256) }
        let remaining = Array(ids[256...]), vision = [run.clipped(to: 256, 1024)!]
        var layer = -1, checksAfterLast = 0
        model.routerObserver = { current, _ in layer = current }
        let callerCacheLimit = MLX.Memory.cacheLimit
        let cancelled = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: {
                if layer == model.runLayers - 1 { checksAfterLast += 1; return checksAfterLast < 3 }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel during second draft-head tile", !cancelled.committed && checksAfterLast == 3)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        c.equal("direct scope cancellation restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        c.expect("cancel restores valid draft prefix", candidate.hasValidMTP)
        equal(seedState, candidate, "image/MTP rollback")
        let result = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("retry commits scope", result.committed && result.logits != nil)
        c.equal("direct scope success restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        c.expect("retry draft aligned", candidate.hasValidMTP)
        equal(reference, candidate, "image/MTP continuation")
        // A checked expert-read error exits the model directly, without the
        // generator's outer cache-limit restoration masking a leaked setting.
        let failedState = seed()
        let fault = ReadFault(afterJobs: 17)
        model.pool.readFault = fault
        do {
            defer { model.pool.readFault = nil }
            do {
                _ = try model.consumeReadScopeChecked(remaining, passes: [256, 256, 256], state: failedState,
                    vision: vision, head: head, final: true, shouldContinue: nil)
                c.expect("direct scope read error returned", false)
            } catch is CheckpointReadError {
                c.expect("direct scope read error returned", true)
            }
        }
        c.expect("direct scope read fault fired", fault.hasFired)
        c.equal("direct scope error restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        equal(seedState, failedState, "direct scope read-error rollback")
        let recovered = try model.consumeReadScopeChecked(remaining, passes: [256, 256, 256], state: failedState,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("direct scope read-error retry commits", recovered.committed && recovered.logits != nil)
        c.equal("direct scope read-error retry restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        equal(reference, failedState, "direct scope read-error retry exact")
        let r = model.lastLogits([907], state: reference), n = model.lastLogits([907], state: candidate)
        c.expect("next target logits exact", (r .== n).all().item(Bool.self))
        if integratedBase {
            c.expect("combined MTP/vision scope executes fused rotation", model.fusedRoPERotationsScheduled > 0)
        }
        return c.report()
    }

    public static func optimizationMTPWork(modelDir: URL) throws -> CheckReport {
        try optimizationMTPWork(modelDir: modelDir, integratedBase: false)
    }

    package static func optimizationMTPWork(modelDir: URL, integratedBase: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        model.optimizations = integratedBase ? .integrationCandidate : InferenceOptimizations()
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.fusedGDNRecording = !integratedBase
        var c = CheckBuilder(integratedBase ? "optimization-mtp-work-integrated" : "optimization-mtp-work")
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for depth in [1, 3] {
            generator.draftDepth = depth
            for sampled in [false, true] { for limit in [1, 2, 5] {
                var params = SampleParams.greedy; params.maxTokens = limit; params.seed = 7
                if sampled {
                    params.temperature = 0.7; params.topK = 40
                    params.topP = 0.8; params.minP = 0.05; params.presencePenalty = 1.1
                }
                model.optimizations.reuseFirstMTPEntry = false
                model.optimizations.boundedDraftTail = false
                let (reference, referenceStats) = generator.generate(promptIds: prompt, params: params, eosIds: [])
                for mode in ["first", "tail", "both"] {
                    model.optimizations.reuseFirstMTPEntry = mode != "tail"
                    model.optimizations.boundedDraftTail = mode != "first"
                    let cache = PrefixCache(maxTokens: 4096)
                    let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
                    let name = "depth \(depth), sampled \(sampled), limit \(limit), \(mode)"
                    c.equal("\(name): emitted count", ids.count, limit)
                    c.equal("\(name): stable fixture output", ids, reference)
                    if sampled && mode != "first" {
                        c.equal("\(name): sampled fallback preserves draft work", stats.draftedTokens, referenceStats.draftedTokens)
                        c.equal("\(name): sampled fallback preserves target shape", stats.decodeModelTokens, referenceStats.decodeModelTokens)
                        c.equal("\(name): sampled fallback preserves verification count", stats.verifyPasses, referenceStats.verifyPasses)
                    }
                    let retained = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)
                    c.expect("\(name): retained committed prefix", retained != nil)
                    guard let hit = retained else { continue }
                    c.expect("\(name): aligned draft", hit.state.hasValidMTP)
                    c.expect("\(name): consumed prefix within emitted tokens",
                        hit.state.tokenCount >= prompt.count && hit.state.tokenCount <= prompt.count + ids.count)
                    c.equal("\(name): reconciliation covers committed positions",
                        stats.reconciledHeadTokens + stats.reusedHeadTokens, hit.state.tokenCount - prompt.count)
                    if limit == 1 { c.equal("\(name): no terminal verification", stats.verifyPasses, 0) }
                    if limit == 2 && mode != "first" && !sampled {
                        c.equal("\(name): terminal output needs zero drafts", stats.draftedTokens, 0)
                        c.equal("\(name): one target position suffices", stats.decodeModelTokens, 1)
                        c.equal("\(name): final emission stays pending", hit.state.tokenCount, prompt.count + 1)
                    }
                    if limit > 1 && mode == "first" {
                        c.equal("\(name): first entry reused each round", stats.reusedHeadTokens, stats.verifyPasses)
                    }
                }
            } }
        }
        return c.report()
    }

    public static func optimizationGDNKernel() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-gdn-recording-kernel")
        func values(_ shape: [Int], scale: Float) -> MLXArray {
            let count = shape.reduce(1, *)
            return MLXArray((0 ..< count).map { Float(($0 * 7919) % 127 - 63) * scale }, shape)
        }
        for T in [1, 2, 3, 5, 17, 18] {
            for dims in [(2, 4, 32, 8), (2, 4, 128, 128), (1, 2, 33, 8)] {
                let (Hk, Hv, Dk, Dv) = dims
                let B = 2
                let q = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let k = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let v = values([B, T, Hv, Dv], scale: 0.01).asType(.bfloat16)
                let a = values([B, T, Hv], scale: 0.1).asType(.bfloat16)
                let b = -a
                // exp(aLog) overflows for the first head, giving exact zero
                // decay; all other heads retain finite nontrivial memory.
                let aLog = MLXArray((0 ..< Hv).map { $0 == 0 ? Float(100) : Float(-2) })
                let bias = MLXArray.zeros([Hv], dtype: .bfloat16)
                let initial = values([B, Hv, Dv, Dk], scale: 0.01)
                for pattern in 0 ..< 3 {
                    let mask: MLXArray? = pattern == 0 ? nil : MLXArray((0 ..< B * T).map { pattern == 1 && $0 % 2 == 0 }, [B, T])
                    let result = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: a, b: b,
                        aLog: aLog, dtBias: bias, state: initial, mask: mask)
                    eval([result.output] + result.states)
                    var reference = initial
                    var outputs: [MLXArray] = []
                    for t in 0 ..< T {
                        let (y, state) = gatedDeltaUpdate(
                            q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                            a: a[0..., t ..< (t + 1)], b: b[0..., t ..< (t + 1)], aLog: aLog, dtBias: bias,
                            state: reference, mask: mask?[0..., t ..< (t + 1)])
                        reference = state; outputs.append(y)
                        c.expect("T\(T) Dk\(Dk) mask\(pattern) state\(t)", (state .== result.states[t]).all().item(Bool.self))
                    }
                    c.expect("T\(T) Dk\(Dk) mask\(pattern) outputs", (concatenated(outputs, axis: 1) .== result.output).all().item(Bool.self))
                    c.equal("T\(T) Dk\(Dk) mask\(pattern) owns every state", result.states.count, T)
                }
            }
        }
        return c.report()
    }

    public static func optimizationLifecycle(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.skipUnusedFinalForward = true
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var c = CheckBuilder("optimization-lifecycle")
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        let prompt = (0 ..< 270).map { 1000 + $0 * 7 }
        var params = SampleParams.greedy; params.maxTokens = 2; params.seed = 7
        let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
        let (rids, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
        var completed = 0
        var observedBase = -1
        generator.onPrefillProgressAbsolute = { done, _, _, base in completed = done; observedBase = base }
        let beforeLimit = MLX.Memory.cacheLimit
        let (cancelled, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc,
                                                    shouldContinue: { completed < 256 })
        c.expect("cancel emits no token", cancelled.isEmpty)
        c.equal("cancel stores whole pass only", stats.prefillTokens, 256)
        c.equal("cancel restores allocator limit", MLX.Memory.cacheLimit, beforeLimit)
        c.expect("cancel clears admission", !model.pool.admitOnSweep)
        c.equal("cancel prefix retained", cc.heldTokens, 256)
        c.equal("initial absolute base", observedBase, 0)
        let (cids, resumed) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
        c.equal("resume exact IDs", cids, rids)
        c.equal("resume uses committed pass", resumed.reusedPrefixTokens, 256)
        c.equal("resume absolute base", observedBase, 256)
        let next = prompt + cids + [907]
        let rs = rc.take(matching: next, reserveTokens: 512)!.state
        let cs = cc.take(matching: next, reserveTokens: 512)!.state
        equalState(rs, cs, "cancel/retry matches uninterrupted")
        c.expect("actual sequence buffers charge their capacity", cs.allocatedSequenceBytes > cs.tokenCount * PrefixCache.bytesPerToken)
        c.expect("capacity reservation covers buffers", model.sequenceCapacityBytes(tokens: cs.tokenCount, mtp: false) >= cs.allocatedSequenceBytes)
        let logicalOnly = PrefixCache(maxTokens: cs.tokenCount)
        logicalOnly.store(state: cs, tokens: Array(next.prefix(cs.tokenCount)))
        c.equal("token-only allowance cannot hide unused buffer capacity", logicalOnly.heldTokens, 0)
        generator.onPrefillProgressAbsolute = nil
        try model.enableMTP(modelDir: modelDir)
        for firstLimit in [1, 3] {
            let cache = PrefixCache(maxTokens: 4096)
            var ids = [1000, 1079, 25, 1237, 460, 11, 279, 1917]
            generator.speculationEnabled = true
            params.maxTokens = firstLimit
            let (first, _) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            ids += first + [908]
            let hit = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("on \(firstLimit): aligned draft", hit.state.hasValidMTP)
            cache.store(state: hit.state, tokens: Array(ids.prefix(hit.state.tokenCount)))
            generator.speculationEnabled = false
            params.maxTokens = 3
            let (plain, ps) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("off \(firstLimit): reused main prefix", ps.reusedPrefixTokens > 0)
            c.equal("off \(firstLimit): no verification", ps.verifyPasses, 0)
            ids += plain + [909]
            let off = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("off \(firstLimit): draft invalidated", off.state.mtp == nil && off.state.lastMulti == nil)
            cache.store(state: off.state, tokens: Array(ids.prefix(off.state.tokenCount)))
            generator.speculationEnabled = true
            let (_, resumed) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("on again \(firstLimit): reuses main state", resumed.reusedPrefixTokens > 0)
            c.equal("on again \(firstLimit): stale draft never used", resumed.verifyPasses, 0)
            let (_, fresh) = generator.generate(promptIds: [2000, 21, 907, 34], params: params, eosIds: [])
            c.expect("fresh \(firstLimit): speculation available", fresh.verifyPasses > 0)
        }
        return c.report()
    }

    public static func optimizationMTP(modelDir: URL, router: Bool = false) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: router, cachedWeights: false)
    }

    public static func optimizationMTPRouterWeights(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: true)
    }

    public static func optimizationMTPCacheBookkeeping(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, bookkeeping: true)
    }

    public static func optimizationMTPCompiledNorm(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, compiledNorm: true)
    }

    public static func optimizationMTPReadHandles(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, readHandles: true)
    }

    public static func optimizationMTPTerminalPrefill(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, terminalPrefill: true)
    }

    public static func optimizationMTPTerminalQuery(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false,
            terminalPrefill: true, terminalQuery: true)
    }

    public static func optimizationMTPFloorCache(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, floorCache: true)
    }

    private static func optimizationMTPImplementation(modelDir: URL, router: Bool, cachedWeights: Bool, bookkeeping: Bool = false, compiledNorm: Bool = false, readHandles: Bool = false, terminalPrefill: Bool = false, floorCache: Bool = false, terminalQuery: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        var c = CheckBuilder(floorCache ? "optimization-mtp-floor-cache" : terminalPrefill ? "optimization-mtp-terminal-prefill" : readHandles ? "optimization-mtp-read-handles" : compiledNorm ? "optimization-mtp-compiled-norm" : bookkeeping ? "optimization-mtp-cache-bookkeeping" : cachedWeights ? "optimization-mtp-router-weights" : (router ? "optimization-mtp-router" : "optimization-mtp-row"))
        var candidateRouting = false
        var referenceRoutes: [[Int32]] = [], candidateRoutes: [[Int32]] = []
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache {
            model.mtpHead!.routerObserver = { ids in
                if candidateRouting { candidateRoutes.append(ids) }
                else { referenceRoutes.append(ids) }
            }
        }
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for limit in [1, 2, 5] {
            var params = SampleParams.greedy; params.maxTokens = limit
            params.seed = 7
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            candidateRouting = false
            model.optimizations = InferenceOptimizations()
            let (ri, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            candidateRouting = true
            model.optimizations.compactMTPRow = !router && !cachedWeights && !bookkeeping && !compiledNorm && !readHandles && !terminalPrefill && !floorCache
            model.optimizations.routerTopK = router
            model.optimizations.cachedRouterWeights = cachedWeights
            model.optimizations.compiledNormFinish = compiledNorm
            model.optimizations.directReadHandles = readHandles
            model.optimizations.terminalPrefillPruning = terminalPrefill
            model.optimizations.terminalLastQuery = terminalQuery
            model.optimizations.ngramRingOrder = bookkeeping
            model.optimizations.denseExpertLookup = bookkeeping
            model.optimizations.sparsePoolPins = bookkeeping
            model.optimizations.layerLocalFloorCache = floorCache
            let (ci, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            if readHandles { c.equal("MTP handles cover expert and n-gram tensors", model.readHandleCount, 816) }
            if cachedWeights {
                c.equal("MTP limit \(limit): all main/head copies charged", model.cachedRouterBytes,
                    (model.runLayers + 1) * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            }
            c.equal("MTP limit \(limit): exact emitted tokens", ci, ri)
            let r = rc.take(matching: prompt + ri + [907], reserveTokens: 100)!.state
            let g = cc.take(matching: prompt + ci + [907], reserveTokens: 100)!.state
            let rt = r.diagnosticTensors(), gt = g.diagnosticTensors()
            c.equal("MTP limit \(limit): fields", Set(rt.keys), Set(gt.keys))
            for k in rt.keys.sorted() {
                if let v = gt[k] { c.expect("MTP limit \(limit): \(k)", rt[k]!.shape == v.shape && (rt[k]! .== v).all().item(Bool.self)) }
            }
            c.equal("MTP limit \(limit): aligned reference", r.mtp!.offset, r.tokenCount - 1)
            c.equal("MTP limit \(limit): aligned candidate", g.mtp!.offset, g.tokenCount - 1)
            let e = model.resident.embed(MLXArray([Int32(907)], [1, 1])).asType(.bfloat16)
            candidateRouting = false
            model.mtpHead!.usesSpecializedRouter = false
            model.mtpHead!.usesCompiledNorm = false
            let (rs, rm) = model.mtpHead!(embedded: e, hiddenMulti: r.lastMulti!, rope: model.sharedRope, state: r.mtp!)
            candidateRouting = true
            model.mtpHead!.usesSpecializedRouter = router
            model.mtpHead!.usesCompiledNorm = compiledNorm
            let (gs, gm) = model.mtpHead!(embedded: e, hiddenMulti: g.lastMulti!, rope: model.sharedRope, state: g.mtp!)
            c.expect("MTP limit \(limit): future draft sample", (rs .== gs).all().item(Bool.self))
            c.expect("MTP limit \(limit): future draft multi", (rm .== gm).all().item(Bool.self))
        }
        if terminalPrefill {
            let queryStart = model.terminalQueryRowsSkipped, moeStart = model.terminalMoERowsSkipped
            model.optimizations.terminalPrefillPruning = false
            let reference = model.lastLogits(prompt, state: model.makeState())
            model.optimizations.terminalPrefillPruning = true
            let candidate = model.lastLogits(prompt, state: model.makeState())
            c.expect("loaded MTP disables even direct last-row pruning", (reference .== candidate).all().item(Bool.self))
            c.equal("loaded MTP preserves all query rows", model.terminalQueryRowsSkipped, queryStart)
            c.equal("loaded MTP preserves all MoE rows", model.terminalMoERowsSkipped, moeStart)
        }
        if compiledNorm { c.expect("draft norm fusion actually ran", model.mtpHead!.compiledNormFinishes > 0) }
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache { c.equal("ordered draft router traces", candidateRoutes, referenceRoutes) }
        return c.report()
    }

    public static func optimizationGeneration(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        generator.speculationEnabled = false
        var c = CheckBuilder("optimization-generation")
        let prompt = [1000, 1013, 2087, 1102]
        func compare(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ label: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(label): fields", Set(at.keys), Set(bt.keys))
            for k in at.keys.sorted() {
                if let v = bt[k] {
                    c.expect("\(label): \(k)", at[k]!.shape == v.shape && (at[k]! .== v).all().item(Bool.self))
                }
            }
        }
        for limit in [1, 2, 4] {
            var params = SampleParams.greedy; params.maxTokens = limit
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            model.optimizations.skipUnusedFinalForward = false
            let (ri, rs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            model.optimizations.skipUnusedFinalForward = true
            let (ci, cs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            c.equal("limit \(limit): emitted IDs", ci, ri)
            c.equal("limit \(limit): finish", cs.finishReason, rs.finishReason)
            c.equal("limit \(limit): output count", ci.count, limit)
            let next = prompt + ci + [901]
            let r = rc.take(matching: next, reserveTokens: next.count)!
            let g = cc.take(matching: next, reserveTokens: next.count)!
            c.equal("limit \(limit): reference consumed", r.state.tokenCount, prompt.count + limit)
            c.equal("limit \(limit): final token pending", g.state.tokenCount, prompt.count + limit - 1)
            let last = model.lastLogits([ci.last!], state: g.state); eval(last)
            compare(r.state, g.state, "limit \(limit): pending consumed once")
            let rl = model.lastLogits([901], state: r.state); eval(rl)
            let gl = model.lastLogits([901], state: g.state); eval(gl)
            c.expect("limit \(limit): next logits", (rl .== gl).all().item(Bool.self))
            compare(r.state, g.state, "limit \(limit): continuation")
        }
        for optimized in [false, true] {
            model.optimizations.skipUnusedFinalForward = optimized
            var params = SampleParams.greedy; params.maxTokens = 4
            let cache = PrefixCache(maxTokens: 4096)
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                                                  onToken: { _ in false })
            c.equal("callback stop \(optimized): one emission", ids.count, 1)
            c.equal("callback stop \(optimized): reason", stats.finishReason, "stop")
            let state = cache.take(matching: prompt + ids, reserveTokens: 10)!.state
            c.equal("callback stop \(optimized): token remains pending", state.tokenCount, prompt.count)
            let (cancelled, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], shouldContinue: { false })
            c.expect("cancel before prefill \(optimized)", cancelled.isEmpty)
            let (empty, _) = generator.generate(promptIds: [], params: params, eosIds: [])
            c.expect("empty prompt \(optimized)", empty.isEmpty)
            let logits = model.lastLogits(prompt, state: model.makeState()); eval(logits)
            let eos = argMax(logits.reshaped([-1])).item(Int.self)
            let (stopped, es) = generator.generate(promptIds: prompt, params: params, eosIds: [eos])
            c.expect("EOS \(optimized)", stopped.isEmpty && es.finishReason == "stop")
        }
        return c.report()
    }

    /// Same model arithmetic, all logical state, and continuation, tested with
    /// both cache ownership modes. Uses one model and a bounded 640-slot pool.
    public static func optimizationState(modelDir: URL, tokens: Int, variant: String = "compact-state") throws -> CheckReport {
        guard tokens >= 1, tokens <= 2112 else { throw ModelError("state check tokens must be 1...2112") }
        var candidateOptions = InferenceOptimizations()
        switch variant {
        case "packed-layout": break
        case "ngram-lookahead": candidateOptions.ngramLookahead = true
        case "slot-slices": candidateOptions.contiguousSlotWrites = true
        case "slot-words": candidateOptions.wordSlotWrites = true
        case "slot-cpu": candidateOptions.cpuSlotWrites = true
        case "floor-cache": candidateOptions.layerLocalFloorCache = true
        case "read-handles": candidateOptions.directReadHandles = true
        case "compiled-norm": candidateOptions.compiledNormFinish = true
        case "compact-state": candidateOptions.compactStateWindows = true
        case "ngram": candidateOptions.compactNgramRows = true
        case "cache-bookkeeping":
            candidateOptions.ngramRingOrder = true
            candidateOptions.denseExpertLookup = true
            candidateOptions.sparsePoolPins = true
        case "indexer": candidateOptions.incrementalIndexer = true
        case "indexer-raw":
            candidateOptions.incrementalIndexer = true
            candidateOptions.compactIndexerRaw = true
        case "indexer-tiles": candidateOptions.boundedIndexer = true
        case "indexer-dense": candidateOptions.denseIndexerBypass = true
        case "indexer-dense-tiles":
            candidateOptions.denseIndexerBypass = true
            candidateOptions.boundedIndexer = true
        case "indexer-topk":
            candidateOptions.indexerBlockTopK = true
            candidateOptions.boundedIndexer = true
        case "rope": candidateOptions.sharedRoPE = true
        case "rope-fused": candidateOptions.fusedRoPE = true
        case "rope-both":
            candidateOptions.sharedRoPE = true
            candidateOptions.fusedRoPE = true
        case "router": candidateOptions.routerTopK = true
        case "router-weights": candidateOptions.cachedRouterWeights = true
        case "shared-overlap": candidateOptions.overlapSharedExpert = true
        case "resident-overlap": candidateOptions.overlapResidentExperts = true
        case "gdn-record": candidateOptions.fusedGDNRecording = true
        case "gdn-projection": candidateOptions.fusedGDNProjection = true
        case "ple": candidateOptions.boundedPLE = true
        case "workspace":
            candidateOptions.layerExpertWorkspace = true
            candidateOptions.workspaceTokenTile = try InferenceOptimizations.environment().workspaceTokenTile
        case "sweep-placement": candidateOptions.disjointSweepOutput = true
        case "sweep-tiles": candidateOptions.boundedSweepRows = true
        case "sweep-both":
            candidateOptions.disjointSweepOutput = true
            candidateOptions.boundedSweepRows = true
        default: throw ModelError("unknown state-check variant: \(variant)")
        }
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: nil, packGDNProjections: variant == "gdn-projection")
        var c = CheckBuilder("optimization-state-\(variant)")
        if variant == "packed-layout", !model.pool.hasPackedLayout {
            throw ModelError("packed-layout state check requires SLOTSTREAM_EXPERT_LAYOUT")
        }
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var candidateRouting = false
        var referenceRoutes: [Int: [Int32]] = [:], candidateRoutes: [Int: [Int32]] = [:]
        var latestReferenceRoutes: [Int: [Int32]] = [:]
        if variant == "resident-overlap" || variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            model.routerObserver = { layer, ids in
                if candidateRouting { candidateRoutes[layer, default: []].append(contentsOf: ids) }
                else {
                    referenceRoutes[layer, default: []].append(contentsOf: ids)
                    latestReferenceRoutes[layer] = ids
                }
            }
        }
        func controls(_ candidate: Bool) {
            candidateRouting = candidate
            // A reference immediately followed by the same one-token candidate
            // otherwise warms all requested experts and never exercises overlap.
            // Deliberately retain half of each observed route at the same pool
            // capacity. Only correctness runs do this; serving remains natural.
            if variant == "resident-overlap", candidate,
               latestReferenceRoutes.count == model.runLayers,
               latestReferenceRoutes.values.allSatisfy({ $0.count == model.cfg.topK }) {
                model.pool.unpinAll(); model.pool.resize(to: 1)
                let absent = (0..<model.cfg.numExperts).first {
                    !latestReferenceRoutes[0]!.contains(Int32($0))
                }!
                _ = model.pool.ensure([ExpertKey(0, absent)])
                model.pool.unpinAll(); model.pool.resize(to: 640)
                let warm = latestReferenceRoutes.keys.sorted().flatMap { layer in
                    latestReferenceRoutes[layer]!.prefix(model.cfg.topK / 2).map { ExpertKey(layer, Int($0)) }
                }
                _ = model.pool.ensure(warm); model.pool.unpinAll()
            }
            if !candidate { latestReferenceRoutes.removeAll(keepingCapacity: true) }
            if variant == "packed-layout" { model.pool.usePackedLayout = candidate }
            if variant == "ngram-lookahead" {
                model.ngram.compactRows = true; model.ngram.compactRows = false
            }
            model.optimizations = candidate ? candidateOptions : InferenceOptimizations()
        }
        func run(_ compact: Bool) -> (Qwen4ExpModel.State, MLXArray) {
            controls(compact)
            let state = model.makeState()
            let logits = model.lastLogits(ids, state: state)
            eval(logits)
            return (state, logits)
        }
        let (reference, refLogits) = run(false)
        let (candidate, gotLogits) = run(true)
        func equal(_ name: String, _ a: MLXArray, _ b: MLXArray) {
            c.expect(name, a.shape == b.shape && a.dtype == b.dtype && (a .== b).all().item(Bool.self))
        }
        func compare(_ label: String) {
            let a = reference.diagnosticTensors(), b = candidate.diagnosticTensors()
            let bases = candidate.diagnosticIndexerBases()
            c.equal("\(label): state fields", Set(a.keys), Set(b.keys))
            for k in a.keys.sorted() {
                if let v = b[k] {
                    let original = a[k]!
                    let base = bases[k] ?? 0
                    let expected = base > 0 ? original[0..., base ..< original.dim(1), 0...] : original
                    equal("\(label): \(k)", expected, v)
                }
            }
        }
        equal("prefill logits", refLogits, gotLogits)
        compare("prefill")
        if variant == "indexer-raw", tokens > model.cfg.indexerBudget {
            c.expect("completed main indexers release raw prefixes", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > 0 })
            c.measure("reference_sequence_bytes", Double(reference.allocatedSequenceBytes))
            c.measure("candidate_sequence_bytes", Double(candidate.allocatedSequenceBytes))
        }
        // Rollback from every possible kept length of a verify pass, followed
        // by a different continuation. Captures GDN/PLE, KV/indexer and history.
        for keep in 1 ... 3 {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let verify = [1137, 732, 2091]
            controls(false)
            reference.setRecording(true)
            let r = model.allLogitsWithMulti(verify, state: reference); eval(r.logits, r.multi)
            reference.rollback(keeping: keep, of: verify, from: rc, ngramWindow: model.cfg.ngramSize - 1)
            controls(true)
            candidate.setRecording(true)
            let g = model.allLogitsWithMulti(verify, state: candidate); eval(g.logits, g.multi)
            candidate.rollback(keeping: keep, of: verify, from: cc, ngramWindow: model.cfg.ngramSize - 1)
            equal("verify \(keep) logits", r.logits, g.logits)
            compare("rollback \(keep)")
            controls(false)
            let rn = model.lastLogits([907], state: reference); eval(rn)
            controls(true)
            let gn = model.lastLogits([907], state: candidate); eval(gn)
            equal("continued logits after keep \(keep)", rn, gn)
            compare("continuation \(keep)")
            reference.restore(rc); candidate.restore(cc)
            compare("restored \(keep)")
        }
        if variant == "indexer-raw" {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let extensionIds = Array(repeating: 907, count: 513)
            controls(false)
            let r = model.lastLogits(extensionIds, state: reference); eval(r)
            controls(true)
            let g = model.lastLogits(extensionIds, state: candidate); eval(g)
            equal("long transaction logits", r, g)
            compare("long transaction")
            if tokens > model.cfg.indexerBudget {
                c.expect("long append releases rows beyond checkpoint offset", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > tokens })
            }
            reference.restore(rc); candidate.restore(cc)
            compare("long transaction restored")
            controls(false); let rNext = model.lastLogits([1137, 908], state: reference); eval(rNext)
            controls(true); let gNext = model.lastLogits([1137, 908], state: candidate); eval(gNext)
            equal("continuation after restoring released history", rNext, gNext)
            compare("restored long continuation")
        }
        if variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            c.equal("ordered router traces across prefill, verify and continuation", candidateRoutes, referenceRoutes)
        }
        if variant == "packed-layout" {
            c.expect("candidate performed verified-layout reads",model.pool.packedRecordsRead > 0)
            c.expect("layout stayed valid through all transactions",model.pool.hasPackedLayout)
            c.measure("packed_records_read",Double(model.pool.packedRecordsRead))
        }
        if variant == "ngram-lookahead" {
            c.expect("candidate consumed asynchronous rows",model.ngram.lookaheadRowsConsumed > 0)
            c.expect("all lookahead workers joined",!model.ngram.hasPendingPrefetch)
            c.measure("lookahead_rows_consumed",Double(model.ngram.lookaheadRowsConsumed))
        }
        if variant == "slot-slices" {
            c.expect("candidate used contiguous slot writes", model.pool.slotSliceBatches > 0)
            c.measure("slot_slice_batches", Double(model.pool.slotSliceBatches))
            c.measure("slot_slice_runs", Double(model.pool.slotSliceRuns))
            c.measure("slot_scatter_batches", Double(model.pool.slotScatterBatches))
        }
        if variant == "slot-cpu" {
            c.expect("candidate used CPU slot writes", model.pool.slotCPUBatches > 0)
            c.measure("slot_cpu_batches", Double(model.pool.slotCPUBatches))
        }
        if variant == "slot-words" {
            c.expect("candidate used word slot writes", model.pool.slotWordBatches > 0)
            c.equal("six packed BF16 pieces per used batch", model.pool.slotWordBuffers, model.pool.slotWordBatches * 6)
            c.measure("slot_word_batches", Double(model.pool.slotWordBatches))
            c.measure("slot_word_buffers", Double(model.pool.slotWordBuffers))
        }
        if variant == "router-weights" {
            c.equal("promoted routers charged in full", model.cachedRouterBytes,
                model.runLayers * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            c.measure("additional_cached_router_bytes", Double(model.cachedRouterBytes))
            controls(false)
            let released = model.lastLogits([908], state: reference); eval(released)
            c.equal("disabling router cache releases promoted tensors", model.cachedRouterBytes, 0)
        }
        if variant == "cache-bookkeeping" {
            c.equal("direct map actually allocated", model.pool.denseLookupBytes, model.cfg.numLayers * model.cfg.numExperts * 4)
            controls(false)
            eval(model.lastLogits([908], state: reference))
            c.equal("direct map released after disabling", model.pool.denseLookupBytes, 0)
        }
        if variant == "compiled-norm" {
            c.expect("compiled pointwise normalization actually executed", model.compiledNormFinishes > 0)
            c.measure("compiled_norm_calls", Double(model.compiledNormFinishes))
        }
        if variant == "read-handles" {
            c.equal("all stream tensors have owned descriptors", model.readHandleCount,
                model.cfg.numLayers * 9 + model.cfg.splitNgramParts * 3)
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling releases direct read handles", model.readHandleCount, 0)
        }
        if variant == "resident-overlap" {
            c.expect("resident expert operations actually prelaunched", model.residentExpertPrelaunches > 0)
            c.measure("resident_expert_prelaunches", Double(model.residentExpertPrelaunches))
            c.measure("resident_expert_join_seconds", model.residentExpertJoinSeconds)
        }
        if variant == "shared-overlap" {
            c.expect("resident shared projections actually prelaunched", model.sharedExpertPrelaunches > 0)
            c.measure("shared_projection_prelaunches", Double(model.sharedExpertPrelaunches))
        }
        if variant == "gdn-projection" {
            c.equal("every recurrent layer has a shared projection backing", model.resident.packedGDNProjectionLayers,
                model.cfg.layerTypes.filter { $0 == "linear_attention" }.count)
            c.expect("single-token fusion actually scheduled", model.fusedGDNProjectionsScheduled > 0)
            let before = model.fusedGDNProjectionsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabled fusion preserves separate projection dispatch", model.fusedGDNProjectionsScheduled, before)
            c.measure("shared_projection_payload_bytes", Double(model.resident.packedGDNProjectionPayloadBytes))
        }
        if variant == "rope-fused" || variant == "rope-both" {
            c.expect("fused rotations scheduled on evaluated paths", model.fusedRoPERotationsScheduled > 0)
            c.measure("fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            let before = model.fusedRoPERotationsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling fusion returns to original dispatch", model.fusedRoPERotationsScheduled, before)
        }
        if variant == "rope" || variant == "rope-both" {
            c.expect("angle tables actually reused", model.ropeTableHits > 0)
            c.measure("rope_table_hits", Double(model.ropeTableHits))
            c.measure("rope_table_builds", Double(model.ropeTableBuilds))
        }
        if variant == "indexer-topk" {
            c.expect("specialized block rows actually scheduled", model.indexerSpecializedRows > 0)
            c.measure("specialized_block_rows", Double(model.indexerSpecializedRows))
        }
        c.measure("prompt_tokens", Double(tokens))
        if variant == "ngram" || variant == "cache-bookkeeping" {
            // Force FIFO eviction, a prefetch larger than capacity, row hits,
            // mode changes, and EOS history boundaries without huge fixtures.
            let index = try CheckpointIndex(dir: modelDir)
            for capacity in [1, 7, 31] {
                let a = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                let b = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                b.compactRows = true
                b.ringEvictionOrder = variant == "cache-bookkeeping"
                for history in [[Int64(model.cfg.eosTokenId), 37, 52, 81], [37, Int64(model.cfg.eosTokenId), 81, 52], [37, 52, 81, 37]] {
                    let av = a.embedding(history: history, nNew: 2)
                    let bv = b.embedding(history: history, nNew: 2)
                    equal("ngram capacity \(capacity), history \(history)", av, bv)
                    c.equal("ngram cache size \(capacity)", a.cachedRowCount, b.cachedRowCount)
                    c.equal("ngram payload halves \(capacity)", a.cachedPayloadBytes, 2 * b.cachedPayloadBytes)
                }
                c.equal("ngram repeated row \(capacity)", a.debugRow(12345), b.debugRow(12345))
                c.equal("ngram row reuse \(capacity)", a.debugRow(12345), b.debugRow(12345))
            }
        }
        c.measure("physical_footprint_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````````````

## Artifact SHA-256 91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767

Encoding: `utf-8`. Original bytes: 18500.

````````````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("automatic platform-qualified optimization defaults",
            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let candidate = InferenceOptimizations.integrationCandidate
        c.expect("combined candidate preserves the original MTP verification shape",
            !candidate.boundedDraftTail)
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and automatic default",
            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 c6fc17ec4ed519801817c9c6dd1ce44a5a97d91dc5f9a501e1e5b473e96480f8

Encoding: `gzip+base64`. Original bytes: 68055.

````````````text
H4sIAAAAAAAC/819+1fcRrLw7/krZE6+vaOLkGcwYBuHsATjxDd2zALZ7D0shyNmBGg9I82VNHZYr//3rx79lLo1Goyzm7NrZjStflRX17urNjY2guTxabEox2n1+HRa1FVdpsns8WGR1+nvdVx9zK7rb9bX14Or5c3+/OdgYzTainaCdfyzuRn8+c/fBOZ/2XUwLhZ5HXy/F1zBh0nwKbiCnt4Hn3VD42OZ1osyhz/VYgrT4F/X+cPjx4+DwySfZJOkToNkURezpM7GwbyYZuO73SCZFWWd/RN+Cq4X0+nGNLlLy+BjUb6v5sk4DYoP8DWpdWfTNKnq4BpWGWSTNIe+kmlE7wbQc5n9HsyTqkqrODi9ha4fF5NJUCfZtApgFjDKuJjNilz3Ny/Ta3hpfJuO38+LDFb9Pk3nQX2bZmVQlNlNlifTYJLBdOrxbRyc3cJcx/UCHlbw0mQxTSdGbzA2zOMuuEqDapZMpzD7+jbJsb9gPk3yHB6M02ya5TewLJjPtIBPY7FD3BEs/H1yAx3UBKrrRT7WkDsdF/P0mJY4KNNZkuXQ1W7wOq8j7HBeVFmdFTk/4f76/jdLfj+8XeTvRW8aJPRgPww2vg/O4dPFfvBJ93yzSMpJMNjc3gniOA62hs93whgXBFOrBrLPMEinVQqIJJAlz6aIJLKTaVprcAZ7MDa8M0hgZLmgyJie6rQ5i3OYRRRsjzajYDTc3LrQ81Cdh5ExECD46UfY7rMFQjGeZflZ8T7Nq+7JfkhKQJsCZkZzrdw7oj7ivhjrsPekvShaKO3yLgEzIvQ9+JiU8OA6gYkZy4ajiqAzsPeTOTVA7iotP8AkDlWLgfwdTk1ZzEwImzuuP4fm2o3OD8oyuVO9xXyQBh9vsylM9FPw7TDY2zNg/Tk05i0Aq15W9GYr2Ndj7CLkv5Hkhj/gKTuikwwUabJR3SYlnqWbsljM+USV6f8t0qqG9w2wFPn0Lvh4m+bwCajK9TcbS4jq2xQo011P0mo1JgL77DkRWPgzemoRWJg+TK+827i62xDHHg58WQfpB5gczXCKpJKpGG74FIjJtPgYAG7HLaIrJvDDXQ0kr1rM8MANrIcAzcliXNMP2CngF6DlbDE7Lot/pGPc+ZPiYwXn4pjp02FR1W+LSTrlLZ1OqZ/jtKSzEUY2s3COhSvMUhgKfkmRlrSm6XwtqbE1TOgn2Fp4+xlMarQThmEUeJc0jPgABhsEMmj6ZPPy6c4ziW0WJ0LiXcxxBCDfmsnMFshSshq4XX0rqXuZjqdJNkuuptCA9hc5iO4LKfqYKPx/VYiygBlAN/IPsFfzNA5+SZFzVYuruoQOAS2vFtfX8GSWlukU+cM4WVSp7g5Gh0MwndDul8g/0g/ZGLD4BY1UXOFBTnDqPN1kivh/BxAeTxeTFN7v4B6wturA4iCD66Ko53B0GKSSgUynxZgGMZ6uwkSm2SwzemSe8UNRTNscw55A8H0wbI2PBMHx9DvsOobNb5BpIo4mseKBkEDqeTXeqctF2mREdVHD/u+1kdaecmtibfpmDAvrC/70J9G3XoF+tGe0dtC8g8kkE4jLmFQFxccciNzVHSFI+vs8BSqikDoCFLorgFAW5QREmPLOT/GOchBy0mWkzmpFNA44LBE5/DvaaomRAgbFe1zkI0bg9Bg4UrUo00FoiJIB8ovLIMtJECqLaVwlszkwjVdZWdVEdgbhC9lhuyuC1LpBYU/zZF7dFnBKrvEwJfld8CGr8OwwQ6Q9e3yDwmVelPgQRNAoIN4F0MwqqzfBUBDeFcH6JgUyyWfxBk5rHPyMIiPsAMi0cI4lMaiT8iatK002RH/YxQRPd0rbheyrQvknBT6ApB/Zskl+NiT5mcyyClcRGyjOUynKGMkBHe1XEkvfaOwDiWpRlkBckcbH10Bj3iZzlBXgK8DdPuLqwMBrwCsG2Cjmxfz4Q7C/T2/FiHBIn45BMfjxh4gfivWcYsvQ7tU8EnFWvQImBGsF1OChxPngL98FL4sFrHwgjkkYPA5G6fM2JdrHgzTgl/4bm4SAS0PdztBSUGobZMhWkDJWISxOA098Sgc2CsNOzub16wlQM/UxQnadzPAR/QUmV1TUhP+CGJWA4LErNItD/NLgmYyLu+Jv5D+ZP4ppLTubjXZ4Op9sPcXDiX+eW0cTVDHYHth7KTsKbWQvkOx+MYGdPhSPP8nHJJwKjEDGO4qsX4Dxip7gOEq4iz+AjR8QsVlwbg/CvMJm00xuAGuu4XTephUdSz4aeH6m2QdWqALQT0nJMo+loS4W4/dx8E7yfDwkgZQZxyDuAI1I8ynitpuhM9o3WCuuo+u4ifUE5jvEh+GYHzvWP7iUsJNc89M3Bg46dmVPvvBN0FQFvmTfCHO2dzaj0ShY397ZbpL1GYmFpNiKdZykwIrSfJye1ijE7gFcQKyZ9HoFxfg9fbBYCbAPLL1njyGAuyGbEWBJ0j9Q7HiQ5hMh0kxK4AFH4us+jAcqRaTZpN6vgGSN+W1Swdk9rUuCSH1bgmxsCi+sjduM/77DkXSEnz/Z9AH3UQxBmpaAIbIhgMJBY/CaVFYgP/lEjH8mnsjJMMmDZdGfBjHC//BEpJMfAFUJBwdEwfbj23Q60YpjhaQf5oyU+l//Cm6zej+eFjcgWgaPaJ2h3hS5isEVS0rIaa9BiUGqq1YWJyDT5Dcn6RxtQPnNO9FoYIOr0W0NnFBw5P2Y9n2Qg5R20BRd5ZDMI0jY2g3EdMQu0x83m2rJfmrWzd0MTW6z/m/CylUA40RejTw0K4U5bZbbnGQDGk3gugyGRKeSHGGc5QtoO9B6wl7zMKA4h9IgWcyAYsCL43Q6ZfGLllkFkyJASp5Bszu0JBblR5D84+AI8Jho2tOtJ9HmMFh/uvU82myLqnQGUCqIlUhwelfV6eyA5Mc9rayoqewHx8wihO4PnAB5T34Dq2JJvRqEpgXDgWTXIANVt4Pzi9Bu8rktj4FgfJ3dgLQ7QV42y/5J668UcSjMp/brAMA3sOFTEFDT8YLBxmJ2JVlgiVrwxwyU31laJ5OkTkBtAGiDOpyWrd4EkhGXZJmVJesETzNbOkF4A92TpqamTs1iuzek8WpazZV51txGj9sE9P/xbZLfgJwAsE0yNrjO0gQVhIlSy9kGXKbB/4GGn11nJqMSnSU3aC+s6X2QwZFF4qryBSjuaGtm2IFKHxHKJaCCzHCE3+FRbFMqEnfYjOPcJi2yH+Uo50/asFGvu4HU7iFoS8iC7Z4KS1zssVc2+HCwEWRsucwie1lt06UpT5jmy841M5Py9G2YPF2dqJ/F2kK3jWL5DJeBVU5yfckkPf2059nqZDc4b24QUu2vsjOrQvXC7l5KmKTR9EJooQvFqf0V5ifs7ChLfFpt8+4B9Qt7BHsdPU9Wz6W0loGmG6F2kJkSnUNEVj9mFRrp0jn7uJDeAH8BPgzUBIVoHMbZnbZqx2QJJ9VHmb9zWFBW1aTfANosQO0iH15S3r1wdoevI8aJPuDV6ZSl+IrmXQXJuCxAFUJBT2FlgBJI3O5QEawmUrtdEdRaOiJ86Gy6JVxYJxRt1Yo3xEMTzM48W+/rr8GjbWxtqTnkWHIAQru2MtOntbm9Ewbf4Z+WM9bX9ycWbZ5uRSMUbZ7RX5dowyKHrUQtU+Ui/QZJhA0iFHZsvXDmwHnYD87pywWSuYsmAFvawm0Gb2fBunThAutejFM08a83lAAQ+BpkgwRuQSkMkfuS0XqXHZeRsP6TbC1WZ+29oZG1sAdnmJLKilOkbu0ZtiCCHDxBET4zZHuU6Nt4DiIrO49BdBGAdEzBbMXH9ZN7t2HU9T1q6v7dnA0aBQyzsdB8fpNPLC8QndjdgP1Iwn0FGkUdfeN1CdhOHYl44+ubGGSqA9vjwwj9bBujEtafPt+Otre9CE2nzuXJ2vUemD/9Sf5UI3U9NRroLkDNxVOIdsSOVc2BO+Drf2FP173GVIsPHbjzuY0j5qa19NP2Djp9ZXDEQHyA/wvaiwwM9BTS7E3fWWtwRYds2kvxGkfke/hNz0CM4nWvf3ITerJ7TGbIaPaIGLSsQwhOtHseF+gkwL4PsL1Tfn4okOGZFzDjQ+8B2boDZILceMAke+6A0/pSOBFJWhVQQVe35GM4ScdFOcEBxEj7bEE0Ty8vqOo4JsLgyG/NaS5otQ4e22TgDYKnCtl4v5Rg9dhITb1SG+hMxdzoRzK9MJ0xBoO0SdEMLsxXg9JenUG7Dk+pYaMz+5Xo4erLC1NeUZOSyr2AoeY/m7/h947ebrPJJM3NF/jJKXnEUCItQb/NyHyo28yK9LXxU0f/JeGRsBUZeGA8j4JpkUx+wPiq3YDXcVoXZRpP0utkMa3fyF+7uIzEW0R4aehSiKuHncufl9D35jnYbT3pSbTRKue0A95mpsFtVs+RBQpLKs7ZoNcjYUjyyMdei5yyxa0JHk6Me81BqoRBqo9p0DdTRm091fWVptqYU8MC1hb3JL2S3m3p5mxLgFLHUJKfx6zkgArKb7R3ZIWn8IJ2I1TwVFhjlU5ZigCVCrW6Mv1YZjgz0suEf5gOcDYD3p9Mnf2RpsiargqgQoOcJoI3aTFLAbXi4NecohxghpMMzlTt7PBHadUUDi7TSmaGOWoL4Typb2MnS0OoCwtg5INlrMIVT6QajTwKgy3ciOHrB1XYZAzkAIjMb1k+QbM3cLYlzd+eHYMg6B7pke/dptVgxdddHL5rqg0TE4JnuBps2kwDO8EIyNVmrvo5ztJximaJ3xhnMWxj2caQB7REQ35aesb1SMbu1ohdJGXRkWvqzsuiYLssZetLo15tO5MVDMn+MGH7kaiMAJKuMm0HUk6yzripfe+2uq0PTFVDn0RIvlKEyaTDbu58k99yoy8v84Vs00JZik/t7JZMT+nkNfzzOzlSrA7Fr8dvjsQvnX258J3CfFV/LqTs7BmxbU52DnR/elmIQEiDh/CAHhMTEMmWGNojAs/2J2FMEsa3MyMOO2TLVtCevaLICsrrClvwYpdYlOFgjMe3RVGlJpu1Bm1NojuIEKNcr5Lxe+m6NZm6T4jpmqxljhK798LvaOLd9Hf32f+TFg/8WOZ4/bOTtT6SvX3q7+XuBaqGsfIzEDQQp2EY4UyFMyhekCd0LHyzLl9kp5nOGogDMKH999CeAy9dzlCxzGvgwIMT/vYKPmNsXyyMTG/S/Ka+Pfp9nKYTPIlreREI8hGYi6VQV+G8k6Zq5YbEjtZccvtSMJBh6tloRJbWZ9tOSysH4nOwjYqNZ3Z0ngVx/B0AounpVe/8lcMT90RM2MnCkGYoUu/bYTyeZnPA00FdkO34NmttLMnJGz3MNm3vhthLabsdNY8XdNTbU+Loy0l6+cYQAftOKpfQ42KWKrHxkE/EYMxMmXveDaRQvySuxQy2M8AMsIP+lSoToSM+me66TU4epau6xWhtHcJgxDN42ELHGw0vFLEYN7QdyIuEgyGJGAPEHIOGPHZhDnJIrooSGikgV2gsHrnf8BwNPhCbO3i9Yf3ZTuuagzlgCtJFVb+FCWZirxH8cqvlDnuGZ9FsLGUy+EMdwebhH4pl+yCeNMaKfI4QZqzSGiG/R0FpOK1L0sBM9IoBWx55kMGJY+L4npCmBdAuProNSZbS4sGd3gN4zmhjDBcOue2tHjwScV8yrGE6w3M0mGW/p5PzYRzHUcBf4kk2G4xCMgzQY/zxInR3mn5IpgPu2WGA/swMBLHdBcUJkHsSJhlN3y3q+cLpxjH68QDL15V/0rRWpz3IM3RvYCtAaxKJCP6GHjeIo0UMXSjjmKEf5nqy9wa37uJLId1iEMcEui8EwGevTEJijgV1YRXFru8Bd6KWW9sREstnz6I2rXTIe01Zjon7WuiR5dqLmGTVGOQvFKXSCc18ABJ5Ufb37vRh7Z08xSPofoEksWw4D8sTQFSaK5pVm6HKzjdOU8A48oOATAaTTQ8ppLzix4MqA/a4G9TDcEk/r9/pngx7dFaIx/5LAHwXb8kNALMRB3EjrsG/zxSqiaA8Cl5HJR5B/FNWizjTT/QwruVTFbvveOuHRTadON7j5443rxHQP778xfCySpvORHZzM8ljIEYLQ6EI+RrpevDtKKYuXO/TbYMNMwRgnpSWV//ntMzhoA+Uyris4aJCtaEtkrljBkT4rqWQkmm6oWU2+0NLUZVOrxuxm5azn6/Do7dfQQdgQk8JIq9zIJgaKjCKfYDbgLcu7uPOcew37WvVep9/PCmOjxpvUccnRZ34h8W30ER2nJR1lkxl41gAfsBU8cnzLcDR9SfPtxv3VC6DDHFMxG0IGntq09jzv0pt6QLmcH5hiHzztCSv4k9FAfLjYEBh12/f/I00Mwrz+GuRTUIZe/2NYW6lqKkTiiaFIejDd/D69xcqULspyg90ALPuURFZ5nK7wU/EQl7SN2gUY9ICklQ13ixtGq2KlrwwFTMOs5RA2H9ohEUeBjhKqR5ecQi2vnAlGaRBJ1msZkcgYCCS5tdEH80f4CQKbhDsI0Y0Q6obbX8Ankk9HRLL6OiLf6h1W+4YcXLrCVHPrSdNTj1Bm1aT1QqfSJV8SCfK4EfXvsi0BucVIB4Ls95YP9/zv2Ll2dgwbgJ5SZt5Q7+bru3a+2zsBzEkrzegecZ9DZtb43LhNPtytNHd5DdlMpNNTjpe/wUbYgPmgKOnxAJHzw0eGLj9K2zj8dj+gg7LMUJ6IuRE8ZXEERXaMyBavRtMI+VpvxUa0rQQRiGhFUX+qITbrKoBe3aFXUl8Pb9Kb4A1cCf0BLEf2CXamZpiKWoNGKx09y6fQkfqa+i3bX75qP6+fdNx0bdiiQFE6TFyQ+IrmFGk9ifOkEta3wUzDP1WkjSeglKdlOfTi32JYAI1B57XgBDYjGEf2MKecBw3s4kgiu5sP0EU3QExzeZ9ouWtvge+Yd6jJPkFdE72I1wGt7uKqEc9+FdocgHJBB6o705D/8oSlWOeD8WsyP7IN0b27HXRm3WZTdIBxyUPMagGzq0wZkTB1d2uyHMzE7ZZOg4YH6UbkeBKrUwawhbxPjF0PDlD9bETF6DJoRzchvGwecm5IC0at0fCjoUjRrkdErd20GI3dOEcUEO85pbjVbeB6CoKkt8z6HAUdiFkB/0LpuLem6SBGqUUkUFBb2erJeo1CIW4I2bmwfn6k+idAaNjsisLbgaR0bLb4IpsAnrmRNrsB4K27RrS7gOfHcSyWwrRREC2riBj1Pt8mgLlbIpKc+nyVXq4siU/HZLM9XREF/UQMR33p33eAVtXkE4Cl+rwTcfuObQK6Sl4e3aMFs595SrAre1g2EG3imCK48L6prdrPwqUHZ8HWuLr7BzqHni37sC7FSdpBUWRA5ayXCzm82mG0VDS1rUxbdxMJB2XsqxZnQlbgnWVEDf2rgqy2WxB1geRvoMu18j+5RXFNH6QE2BO6Uzem6nm8C7eR/2Qcpgc+kwo0IquzCACidisKZxPvGUJZDVIrM7QVbnBfkpxeRVYjkx+oCgcNMBIsOtpclPFwUmKRIvyFlh9UaorQFiVtI5eEPcjKV+MTsOnI8pU5FoDUjqY5IdmLEcbQI14D1OvZcWp06WIcH8kNOyubrGRd1qOkyLcfPtxUtd5OyTF15U3IvGzlZxhLO/7Dh4Ja2VWHc3m9R3aPsQTwIVTWEp1fcfSAt6N+Wz8bnrQUWLMHNdsVtWuSRS4vsbMMnjjhGjs5oho7NaoodfiRntMD7dWrKdhs2jcYiS6iC2QB4ISFjTkdo+tH16giSPDhFdc/essTjPDhVgucp4ptW5DImpnWbGVPkuSZWGrbdixv0cKSPy3mdRwQKjLsknT8v0gAy7Xjrpn1OTUtLkNHo1mR5odmh2FhPzpm/sqO40JEBY+2SIs3N5qYGFDjm2xHGv6jG//+lfwqJ9jqnXZjHx2lBdF6DrCodzYKHoq3Zjm0QTUFdDZbbDNrzTCqqqxAtIn7UVc1VH7wnQQPmrFmwhkM3ygDdOVz6dh+32W+DZcjcl0vEMZjnZMTcZwOnRYsjiUW+eTNAKyVVQR6Qwbs+QfhQitfBH8My0LSg9bATcti7xAuKD8Ish422PSipgc6tREKikRnjiMfkOSvkGmhjpDeWYCvIVSKhTXbCqUeRswj1AV654copa4bptyLJSMEmtMW4bd2YkNUXQCccWQ0mT+QzH8NC1jhBlHs+u7zZgt6X2K0koBgL6TSZM0ONpR4Sw6WqZqC3yLKqUccCDOHOVI9rv3rsKUvykFfcl0EB/g1+tsLCRGzBRRyTQioo3u66ZM08mdUKBxiZRacaKzTsHmXGGoBb7NKY1fBCJVnZI4CTU3N58hbm4+2WwGxjA3E/E6riBwpGnNn6XV2uWuJiE9IP/fEXp3B2vmjojNDN4c/O/RyeVv705+Pj0+ODyKgsN3b+HD2eXp2cGZ8RUAHQWvf3l59Ddofvb6zdEpQev4zRF/W7Myuphi59sk56TIGOyvEoygyI95+gLKMweSeYbRSc080HFwkFudqbsSB7+evbs8OTp4eXl6+O74aG9kSPb0qnHlQtyjT+oAteQX7g7zIqdjbAJJ3nl3XYmokJ/ATKuGXDyj5dLu/Jze4dE+Xzt98+7s9Axm+/by3fHZZQPma1HQbKEXttYwMjRbWlvi6Elv0JKO1HSouaMnms7lq5N3v5y9Pjrp393x66NDGP7CBpPac02j9iR6+y+J2GPiPYQGuHVi54/QP+UbTvMP598OL6Ss+tnKxukdj2RJ1I8GzZU1MK8JCEk7dx1LDIFz0wWBhq8KAbLI3+fFx5wubn6I3+NaQE7BLEMU43mbVMecSLk5n7WQAIEKx02e/ZPC3QUMvh0C340riogwjdNMa8SISi0RTLtNN+TUTKFCneTd4O8D2dM/CiSCA5Gwsih3A8SjMLQjje208F5RQAT8HsrMn92ygLM1SZXb0SZJldHWU6/5iOJq0Fi0G/z66+uXUfA+Q+Ga82rtR5weTFgJqyntLmXA9Ybef0iyKZJmmcKK01bu98jYdSlwj8kX6C9yMvivmVoWDVk0rws1J/rTwEdjKuqjM9GZlRD5VBFPpPKYULasbrM55UjCRNk1CKBVwnYBymPyD8r5qaP7dVeNdMp5mpEhZl5kVZGLiGyWJkTKVRRPyEJCq2ukWBT7hZcMXgozhrVxzesGtGWNawT9khcb+7zyfjqSGzv3dE2aYtaaO9u8q2Et4aIxfWv7++w4CRSNbbfM5WKmHUfCnq6wqBpHY/2hzkY7FSKCkoKt0Gb2Bj401TgycQhaWmMahvNscoGmu/Ndd+oiXBuQPnjnHD+iX4QeAZj0FgHxvhI3hPFqq26MN7sEjQhd9yIwFDkrFpV7Pu2rq3g+jMZW2FO1mEX0wx2m52170vAX5B6sMGI4w2IGE25djdf9cPiQK8Sq9dK3sMxvQRn8HC5N2WLUA5CQZEvREA1AH/PVxmv3L+TXievaPwMwCnRBA0JM5x0Uuld4hdkMJFoOwgieqEzE+EXkG4cPngTE3nhRZqbNuyvAmxfXoHxksAEc/wFs0pFXPquASaNASg8nC8pO+3cOAA3XuhMPESZxQmwEEqZDhvlzLmQbnFLzEABVOcgj/f73e/p3sdQN11XDa14hBkUuX7LbS7JmtpSAQE1YrjvCOgkLQ7EiFlUl12nNFwjKophRUnBMjU15Ghumf06vuOYIdxXzj+Vi5dU/+f2FaqHQRTaRsHLc9CccEC82Yqlb1IgOixBVP1nkYo9ImvGG+Pi5nR3QOBxiLxsyaoEpr9GarchWZl7yr+KU8hqSr9fpZNIUVhI3753wr0dbvxKtWXddRFuZ1rjA0fuMffJeIF2OH+vuyy0kc9OeL7116MCo1Q72+r/zUK8/9IFe9x/mZoZfFKa4PAMZ8nIsCTVO57VeGBcLQBF6VuRFXeTovURhBj30aFaidLbTKcODDHBUU+E52TQ3RzvRk22XcVxVOsCBj0usIUBFS+zMDSBTp9foG9R1q45J0BRyuC6c45LfqQhNRhVRMG+GSlYoC2N5zIlmFawaRiSXjkSo4preVBbHK1BjZ2RjrEBhfq8uP6h90r39KtTSqgYoJVOq36OroVgJX1XqQzUOG4leWGVb7kRyjmRR3xYlFh+jjPKY6b10lIfxayYd15/vr48E/XUNQXkljD/ZWNuuhGLNRwg7jevv3+81WgkxwHM4Bm0yQT7KQ9NR7yIUalgiANoQrXkTq5FXKVrs8vSG/esJFzRJ4cW10J15m86F0C7NXNHoS0smGNRHZJxrh1CHgiQp7Te2tTnrNk4zZbgMeeFIH0tbGXwyq41UIE034ehOa6Mq09xxRG5DCzb6dCnCve7dNxDT+mpbGWSlm77Whea1JEqaiOalIKkaPMXCV3EzyXazrzvzNJx0sOmmOq3XYO9ZuzODVa+gK1iL9usNkS2X47vtGXxyJqK3zaGfXajpTAzQ2FPPVpmVkwzWJoklwFcgGxymOp3NixLI/sa4mN/RUf2I54sYPP44pfznjymkXpgPY7MvvD8FtJlC1oSRCJO21xhHEsA4GVAOrAQJImp5ldUwVAYchItzsPJqeYi0SY9uwXCijEvDhmeY3XzWx5dZcpMXyIKqx8bn9X6VNfu9jXz9ObmD4N9NR73NcZxiPvLBGvr+APkol5MI3SlTLHiZVhzVQ+Y4kq0UsVqLLCoTC9InD8Docmc4vBwOh+5M/GpoyX7FFDihO+JGRVKKOcSSEYehRYvftcutaY+NQgLOPhZcw1rJ9amKVrnqMGV5XZiCw/Wiwhqg6KedYxYykbfeyFNPMDTIOmIsX21ChehcBGjiUbtoHkMqhpRcpUje1zR7QgkAhK/H3Mve3wf8IVxzmIWYNwjix7LziQHAQejQ7EAMRm9xPBwN278Km/xuYFvDp2m5rwfSDwdW2NyuuXvHJB45uIQmnLuAQ0PGIYMP/PjDLl39g2l+DlthXQK2nMZEzPYRhl8l41tr6XMKHHTb0oR8sGd3slTyeqZm68ifa/O9Tb0wQR9ppxvrGYtSV4O1vw/4912BwuxcBzG5Fi53MWWUf9cM1tzukA+d7m98i1ROnHLu3KAC2BfnTLROmoDyvl4yJjVs1jNRmDTcaYNZCV7/kVDmUAsHWZAQfiSHWg5hvTuCYKDVDUkPk5G1SC9eyM+RI6zH0XGZAuMbo6s9IapD5X6TyaTSRNwk1p0budlrI5skge2kY3R//6eeFy5qKRV8Cr5gLOdyIc2To1bjR+bNPqL05YNC494Q8UGFNPcsV+jNqjsxRULSdC1qVfztLVw7p9BE3voOU8YpKiCOBgxL3cbjYgLHwGH7CXv1XlJlp0qm6dZ2L7YBUsEZYjRqQMt+EwVPJHi704M6hr6mpAeCSxvRUBSc1P9AdlFWGYzFsUtLKbwpWAmZDq0QdyyceCYydOu4bWy/r6DBuu+/X5JAsvakJUpQ0NgYtY//1BkidWEY+uWbF9SK1+Fv5e9X4MSxuL74epbciDzWW57zYY7nf3vT8zbdZpYyyJ7V2UNyk60W7VwTlhizrBSf4DUvj3GUcxZFrVgZkMYd9mMYPaP4IFfp4/ItScygJES8zZkyUfEc5NHQA2y9TUQHpJnHwI+Bb3aCuIk3jaklKprNBqZnbjudU+ukb6KJQdzswFPTtOYZ3YfD4tXO0TErDgMB7XjtzZCw+WOoa0T2P2jzyynZ/0Kv5kZ3Z5ukS6SwECvCJmjvlU+JPxoRxPI/iTB/QXBhSJgs9JuWoOXOBlktaqKitBKKOstu/5pmaA9CVr+UtPrFOmX+ElFg/UiqnXORsMaSDr9cOOxH5PQemTTLSeZ0FjArCkahUZzMkcgNxHfgNAJ51A/01ent1ElAm70LVOOESkuchobtSq1KkWQxGSaV0rglZb3G+bM6o2p6oAmjr0crBxpaqhK3QiRSDdbU4TFjKoPPIpEj3l92j0dOLdLejGVIc1NSFzP0bynNnEthyY12Dfqo16jGWNokJpjXhMzIG8zDxNqcfMXHxBWKlECpPiBWD3rMQ+4YUM0P6HkxDzo+fL8aJV3RzraqAPsViFZ/gjXsa/haye6lqtauSJqk8+IeOvyaHJOumrTEqQ7Ry/VehSZ8eU6uuci7nMJjbSYF4UvVBPagpepSwWRSpGyzEUGl4oRa3UqIdRhxKCxGAVC7aSk65nywMUJ8jgIsXLMxEh82wwtfCQrh8vxabLONfSMnq2xin5hWb+zrZrfSkiJ77Z//O/J5GzuYqMRMCVrBrmXVCx+b1KgpX2wZ7IVhpdI4A5+0oRa+KGzwGF++wABjobd/ilnFdpl+c2xYatru93DVQKBetrT+JMkRBuEhVebWs8wg2JGkAGudhjWTHtkmLXO/v5JNzTl4eydXNq35HeI6ZPRQaQwixpqUBroyGudJTsMQKb5DinZh82dZtxloX6tHF5M2wnC+As91+JjE/D67mL8pxuuJ9ZDkW1i55ZiYxEUjOFcxJX1s/QzSeE/EwjUCj+haXJvlArpw8M9gklbjMruitG0CECExTyHYO7bnVqQk+zduDe0GzcPFfTrEu3AVQiRGeKC99uy3AKd/t707Lt68WkxuUmnPr74S8ekYFjOLVGQOx/jDKp08EAVyG0ng9N30wT3cPxElYfEqrLkonp+Jknk729tPXCWNoKW44/9bktVvs3zBWBpGS7C2eTtwOabhqu6HZwZKcRAjAUiVouhGJf3GhnhDc5av7yRyj6vNe5gibYzqriqM9yWYJQ1k6IzdDX6lNFxtYxet5fd51pPCdWGZC3dG4XISSEG8iEY40+BzD+GcGu4FO8oCjP9vrwuzdWOko7C634N8N6baXkp7qqQv8Zj4hJN3uDitDJj8I6cmxyRo43Xazy5FTsijuJJJKlQ4gSNRA9/jQ2giE3K/FNGgsqZM2DfN28DcKUDz8RQR/FDWyUCFUUHLfQqcquRy3au/nbKLEmHVTrrZzjHB3YZHTY4MNaVlrLq6o9I7fx/QFnxlvUmPbrgarDU91hMx6RE9W0UXsoOKf5SpNWbJncgcwUkEKEtFJEQ7tCTSnRpKsCEyvVj9yIKOcUDZ67CPaTCfAiTR/JhmgJM3GLDJWbOpCCTW2sbkwBOR0MkM64UeBZHeoMwlCRUSwPrFFHSMfhGOjE/GtaiERPXAGtFwYmA6PlhCMNgebUZUXS0KNodbgFGYyrKFuFSQvKgo/xW9CxQSrSXb2xFVIoR/nkbBs9HzTSyU/HQH+mF+How2nz7d2sK/z8gYtbkzGm0OL3xVz4WpRxgS20M83aF/ntGcn8iZw7/bcv6bw+0Rr4IndNFVXVkXj9qjtJ5qeFVhmAlbTBDlpM0bChKdjgdZ109cpzV0NVqNguY6fr/wRKEUpdETgsTod0kVty+rsKg+cl1FOdsltFPXWBR41iivqD4vrepGEQGY0UyNDAu6rumqj5jZ8g6o3g8d0K6ybRaOI33DNPwCcJ+W8wqzOq0D0Bi0bQIWV8EwTeqenMgBVVXEdNdLg1soYQBDfxa56fCOXTsW13vlu0anEb73gndlg791v/m5+2eDBdlpjgz6z4E0CtqU5ge5AIOFzGfyaMJnBfXQrWgb6BiuRatAEKAmMETm7d0LtsynVqK/77oKaDb/Mzqxsgk2qPWFnRUEyy80EA9vddEtSMY1IFuUPmQJpgjCoUFjnuDge+M4Go9hgUm96lk54hopzWkLViookqynnphkt+ex4aTOesKtY6TTOuMN+6PfMYvwMiyV0e4Uv6tKkwiOTClPy1TEZKCU+wIYc68O5U2IOy7FnjUIP7tDEhA+PjLWx8t7dR0oztrE86NLeWoJerSeB8o4PWs9d+SRufcagU228K9/meveQ8QK701WPt+3Tudnr5eTj3sf2aQld2jJFrOXiaJgzjRzMgqJBNyFB8CrcnThpUZqMDQPA83f5NLoSGu60wwoqGUgGdrAe10avepbzGNbTCdiWdfFwkixxdnzmmtZdR0s8fVdxrnYHuOfi9CxmDFOGjMdF/kGV2Y28RDTv4LuWLEiIJPvfelKWEZdvhJ40NoQPXFWGMSc56gg1ZUh136E7UgfCvQgw/OEaY5Lp8z1JMp0ntKNMdkOEXE32A5dywEGRzglFSXN+3FZaCcDMlvfzlKY5VeCP/HYNia1FsPteDHPnItRJ+TfuBo+Lj2WIxryerbM9bT0Rr+eqJaeF1a+7Ks0h9XUIsNiUQTXwMj4xh+jpsF0HoLYsSbaAoZTK1lC73D1MNHKCBqIBH4PlOtTP2IwbowaD3zapGjm4WHi5aEMVJDfAPZPQz/wlctZC9LCo264SXFNaDrpBVrX7WUFbOwploImfh6ZMKcnm6uymGbULwsuqugzmznmXEldil94uadPQfamacMuz/7UNN9G7arrT+zfzaLrI8v02yAJckU5zp6nDW8JRmllW5CXnh52LaOHWot9INgQNCL8RKxXX0Z8CtQXdVbklWl9fjAbMRwE6yfuaujE8kbwh0IShQ+WL87A9XuA1AVWhfBNeErsNwHJ+G8nMbANPKCEoGUnmVeuHN01UkkWOZ/FBFD4P0oyQAqePLlwZanC12Y19Xp+zKwnfnt2jDkg4+L6Ogpi1IfopF/c49K0maf5njenHV1QWpToSbA+irbw6vR6htfQ6+CwvJvXxc9Z/U0gnryi446vqkdv3/xNfdaji1QrI7yTjQxhc/jcWSHMIJwy0B2lqmAMndQUimZQL74WjXlGR+xi+P1Q/XaKhRo4TLL3IFIZY5JGdG4iUhProYb4SRTzeD2pWqnCPLbsEzoBoOfpkFqRMCbJ71QFCsCWlKoSkXgrEro0q02ofDc6JQuqpdPiY0p5d4iCLdBPmDPLh5kTOrCt3jaNUx5ekZCnkrlqpsA0xrdZjmVBcCR8zPU0jITUOoW16OsoB+Ui/a9KOsTNQFYkpJGMSp5yChJONiTEZTLpmxZyypWIZQVeAWdLSzr0g0tZcOAvH9N86+j3ORdhpUIzlPHwnI1LMpVLi2RxnbGJwv+zNK+KshqQAeKvstpnQuWvXEH7a0jB4Md4glFG4a78SpYA/Hr60wGIEZhU9nYAJyPZ5c7ipHoJ3waYtKgCUhRjQocwxhZh8wa7X+WtyG22NLBXxwCbsR5LX2vdvWdOb7ihxGXFxzwPvILPfrzmnXxz2Obq5CiEi+mESjBSZRNa2j4LQb/TY3Qay5gEFCNDkd3X2Z9MKkW4YHbIpX9nyfuUCzJ7exEGN7sjjymN8+83ioMPWJJnc4KgSAMUKnWRPqvz0GNPMUHzKKaSMwPX+1gkjaHjHXi5903Cj6mRhJ41Dp6NQfMshp3dIIkCAtnM+EXd7ccCpeC71Q4z0rl7pVz8h2YhT2eBT3c2PcPRLXxLkhNP0g/ZOD3QvwNycFq8J/Ew9PQ24RJMusqYcD4eCv8v3RgCJkEk2HroXpuVsWiFUHwzJSG80Pu6psfZ+2VxHMPwXnHV5tZ0RlhbhOyTWbvdeb3ThKkz7FpVtscV/sIbWL1jLMUKRZ+Cy4j+h1SztcG+OuvcK+98qzMq7tJACl9HAi9A3oDXb0Bjp6TfsfiUipP+ekJR3/iRvNfJDL/T3yhIi4p+P7/w7Awdm12L2EQamcSHKCjyg4ksOtbhVzCORbd/D032Ur0CEkVGGeFpCObTRaWqgVyXWOamKWc4uqsEEUFr4EcQMNC6sT0cBm9/CDBT/YsAKxwJuaqzo+Z91jj4hSIMuMAf7C6V/kpyUCpAqjo5eBv3yMW8AtEZxtsdFnZndiqLsIer47mTEXrQ2NnWlWQBJEi2hIKItaFi1czcKhJbwhVSJoh4Xp0wQaDovrx4sr9q8gTHxKmMOt9zG9cLUmSJ2JnhqJEvEWhzOjMQ9ZKbVLtX1mRvaGlbC921FxouyEG7XzvlJuJOGHyPKO+5mOZbbkoGalCpSIwwVBxZuKDf9kAHUn+Zsb2kSTDb9w79XTHa6eyaay1WukpvhjaFkcCM2eI6HdYnr16lNeLqKn2qKozkA2QRrKWKTqcsuXo7bu0G9yyykSmKKLwFrd4PTefsyvulSKYh3At1VJ0vH5aLebhluMglAPZNXUKSbkV1HAEDruAMp+UGq+ZkxgEwOMW+qCkf9h3QSgpCVyHnWW6jCTzIYY3Toj5kr90w7Kc5RC2pelmYnZW5RGCY0I45ewuoxFxRci1qq8a2ZhGZI4f3H1iUMzRHtlUDQn8BGtQ4eukb0oLh5ynevXLYFvom5hv2irKHvUS//w2l6KY66419owpYaTnG/LwGo/hRSmkivjOiOAGggymbcJSDv9XbbTqdU30vRsOEYq1pfwM0mioHlYpYFLTBFX1AZhNddWeRNwr1jtkTQLlyUy5xJSvrLokbEOKioZ7LkBGPsr60R2EjphNLU5IFzen29QFahw6k8LAra1m0KuZaGXK5cq65YIQjfIPdQXzVFSsdBqT97hkTFxId879PNi8uIgdgQp9lhciUrLu6J8iMVVBQkjLcJkv0l2Qff+joXKrH+kVV0eyVNJ2/USbxrllquc8lDjqCqV31Zm2JslkC2ATHC89aZTPPwslc0mutsiN68sIn41pr70XLUAU3Uve4Cz3HkqTAl0NZyM5x8UH0466bJc6rXelqvSeoRc8dYB67IdwbuuZx9lgqOJfcl1hgZIES5h4Pfh3lnmaMNr3SlRK6VrrrTufpu1jYzyZk2EZcphFxK9a3Qy4ah+HSuxfqon8F1PIunRxzTmCfCuO1hVCVz4jTC1dOI7uZTKMxlvMxaElOrNdo75FlabXnYkJAwBIQbdFicmFmeQElsnp3vSsm3N+g2tN+Q2WUO4w3kr/Qn27Vc3WrjRBcHfj7abXT2u4h7AoH/AJbxqok2xV72c5RqIrdcw1NURCIFQOhkY51Sg0ilRh5qauGwxdBn42UGBaadiklempCmlSpE4RORHm3RKd9JuAWLdy513rNxJ8IZOlcJDHqyA/SExhCBwCdbAUg9Ffj+NSKJG57fOJiLLAL7KJGf+gNHddgXRlK4OP58+HTC6l4pFIC1hWl14OtcJ8rrnsLDwxM3zLr15GaibB/yBtJ3Rc65Y3gYw5p3QsGwyCOv8MwpecyyHqEyTXXg8Hg22Hw38HT56PnYfD/gk1hOmr2yBdfUERoX1TyuhBVoKnIZWgqJHp6Sh2hP4ZC4rtIgV0nRlXT+/SNNKcf9kl9i/SsRnAARwUoJESTpnwvJoouIYDfvmQ4PPj6dpuO0BPDuqmnngupP06bkTFFf6MHABSXDhE47AaYxG81IX4Q9iPm9uhMMqYiVwGHCd8bYMK6Ju23nNvse3EcPt9rfnwdpZKkzbRP3neWJ2zJDL7z7Kj4vd9eFpMJXWlCPfmOk2WYQePuDXQBDd3iIMV3WMtEv8rlbE5emM90BKRoZI/pd8/jstjdbw0TNXqMAu9GiSAgbKUXHXbdXxSK3y94e19qzUZwgGAU0pFvTqujWzW9ft3ayws7ghes+Ub2OMuvJut7BuTrKTeATYzJbo0VRxYqKImguBSxmRUa8+F4Grp0Ys5LPGaviAnuuNkyRPv0IIyzOp0N0L4VY8kTZziErM7cdXbRKKcIm5VbkQFvnQvmXi7xFzCfaQdMFzjpUouwIbFi0JRUfOVE+JKEHRDnPJSOuLhRB85dF1hoZjEHdOPAEs1WreASECKav5+DbEACx+jp882LjjEk/v9E5qoWI5dT6BYRlHKkaIdLRHIep/uOi+KDGlYDu2tcx3YqCFPYmxlILfaUwWzuJ0xYbCm9M2F7o3QyuU3vPn7Ntn1jEm3Rpjm0JdSIB18+omXKdq+2W3bpbrcCHWvOUIgPHBApb/BIN6J/mh6JAQ+7777nEnYoh1jKEVXDLoX/XoyREU6CyGCMPn7YSVNbSED0lMloJ/X8vFTzEaEjSvnxUS+8PRU6Uq4Yl8dblMHqW5EH0oc69RbSyNAmqjO7r9ot0xzbXTJyDFNnN7f1lw3i8ry0w1IoCwy55pAUCnO2SASzJkP/OVp+LZKrx6sEaxQ5I4uSwG80ZXd2FgcZkf5AM9egk3SpSUm6xfvaXxnzj6TEYX0BsbJGdNADYwaOX8MHWTvrTNZMtF4lBvfqVYIGJcGePVPpxSZriLnAPpJ3EgVXFh1pL2EJLemkI36A9CEon115/IqyXko7Nre3w9Dz8rsOs4fR+4rUg9486DJ7LO/bYfVw4Bhfh26KmY2zZU+HD5i1escp6z2W43S1h3SesHPYmIsvW6I6Qo3x5DmyV+k8TJSxgeJXlrh5udEqfl7d9Zc4eSmEWa5Mz/HebstmX27XZdvQ73ZTNnvrcFcCfts99nZUttymXte1e5LW/nY5VPUWf4Fb1djyVSI1X9ixbsnkVcLeqNbqXXIUxQ5xfjUZ6tEj4J6j0Sn28w361OCtjZFr2/1eQY6Stvugn1zT5FrDJ3+wO9hyBYe+WU1J3Ot2/TXEspUiuIEWLaaYdRrNLalIDauh9h3n81OOQQtUYa89cRWBcacFQruPUfZZxZXWt1RyPZ+IuLKK4zs/Vi47kAKbDj9FQ49+3AisRBvKsNkiuQIKjbcFxJGiVqPlXMG5jGZAovS/+dxrTeL1pcOuEgDZOrH3Hlz42NDvgH62Fd1oXOGSKc2JpDoDuun3P8UVXmZ+6sS+FpmiTjx9/6edeFH57uGOuz635nr7AW61Y4t2QQqnTCZi35QD5TorhfyMDsnbpHqVOQurejunTjnnpCxsDOdfZlmU8qSrfEbWIgPi2SgusaT1LD2ibh9xkI35e5tG9D8J1oT/qLPvGvQPOvnW0F9+7ktMa/GfdjZpUl/laJrLXQ5z86RtqEMBU4OD1dSw6AcMBuiwW7jDWjxjSGcF5hmj6910s1eNNLqH9XIczwBhFmVqTOBSuEsuRY6TjOjHkz5v8uWeS6nK43ub7vrpImQCtDIqdToQrT5ThoHNZ9uYYWDr2fNoa2QlGNDwwjSQMpXDlHxoDH8YclCSJyn3eo+Crihxj40ZgH9FESVvz44ff8gouopvVvMdF9gVvnVUFrWsGchHjx6fFMdHJ+KX6lQlifveie0KywHjVUA631Pe5U5Dn9IklRfzku1o81nw3XfBpqMgOh8NaHOaIG4d09f4pkzTyd0L8WusQsKh3ZZ6ijez4cFTV8rrVtTKzh8UtYJr4gOI55yCx2UdQBFCfi5jyM3nFCzpiCXnNu7EuvrA9rmR/9AxxsvjjPX8uiONv0a0sVaill8w6Hi7f4WyB4sQXsaMzPDcjjJl/Ut1fJ27wn3CTa2QU1kIsbcvEMigkc9cC1qO6Eb10n1CGjuGv+Uk4npk2nfKrDEBolxaaR9dk/HDRWSbqOc/wRh0Nz2PhXTxmjvXk278cF8QVosx5tP3Q65HgbYV9ksGYYrrcss2rH/4Jf4nSLCMv5ZxkeELpsKN56NulypFBvsCOQWv6RHLKdJqyHDOZ50Zs5kpyHnSDNhhEt43A2oXHivZkRmvFX5jhqQIsJ6PLvTn4UXYeyAzGlHeYbZ891YADG0VjOXx3fPPw4sVIg5boi5OSmmqSo6Sio3ouGtODxLax6DpE9DXGl8H7TXBsVK4nrk5y+KSBGqK7LObnnQbRiMKU8LqtDQq/wITlT0RNjXm4o6aW1rR1qUR1PMv0SfwbTq3l+qCNkmTq+kUq+ZjO2HrxD1Tsdlvoz6z/QTVGfj3yXYrXRoKEh5JMM0/ZGWRz9K8Hpyvnb55d3Z6dnJ08Pby3fHZ5atfT49eXp68Oz5a2w3WRmsXoVY0QpfCBH+n2TjDBMllnk5NfyuXulK3oYAxtqb46MvnOGzM0arJN01vkvGd9mThmP9z+u6XoxyzQZSgxaX0aeCehyVWGf1dUcoP3d1pWmbJVObJ+0dV5NxkgFWcd+1ZhEFSPdKpyA7yuwtX/kkVwqjkVZop1XYla/kir6yA9zmlLMWICmOO52ttIX7tQtw/c6XC5fTKPCCuTG3jBAjPhLdRLftlKqFIv/qgSPpxQyripO82YKKgxy5YLsr7qjs6NK+HQ9IVsUawBtmq/JBR7S2SJSTcShTcoBO6c/5gsHKirRapQsPM6NrY5KqiWuAf0rLMMEW2vN+EUdxZfgsYjPpjG5/apQQ9M8dEgtMPWLzBOL27fDlQXJ+rjKhIz4Rxf/PCDGhQrV6YP7h3zlJFjfLlgkbp1f0zLQst5GMgn53a/cFW3yReB7+evbuEby8vTw81BfNByFhw2G9hlLeWAjsq+EzZBZL6D13OyF6OuQT3llPAWJ7MUnHvU8aKNYYyRokQaBQy1mjz5uB/j04uf3t38vPp8cGhargs2UCrn9e/vDz6G/R09vrN0al/uOM3R3aTlQdSU6V+sJvN7R3nWLTyy1cn7345e3108gADHr8+OlQz9yepniX5QiV2liSuWsypphrd0fXRDpDxcFedGvE9UA/7EhdtVzwvjUSZ1AXh2BpSeoTAxohAj/+stUDRXYzyPhJM+9Twsjo1i1kyhdnPHIA2q08C0PkQLSlD+alfzzo3s+qVosXs/CjNEAfmtyty5y7ruO7TKDJHubhFRBiqF8DasutMFsXjoHFb5Hyk4xSFdeVlmVzXZwkKQ/8feWS3QNcJAQA=
````````````

## Artifact SHA-256 dd1f90d81238b26e989cbb2301b7df05e1c92753156f1a00bd5b8323fd6f8401

Encoding: `utf-8`. Original bytes: 4926.

````````````text
{
  "classification": "Explicit-only automatic scope integration draft on exact V402 plus V416/V419. Full correctness, three-geometry benefit/short-prefix qualification and final composition gates remain. Not compiled, not run, not activated. Live V409 remains unchanged.",
  "source_base": "V402",
  "files": [
    {
      "path": "Sources/Slotstream/Context.swift",
      "before_sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
      "after_sha256": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e"
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224",
      "after_sha256": "ec4100ee687775863d98f9a60b4fcbf28b21199d85536a2bb8e13cd11844ca05"
    },
    {
      "path": "Sources/Slotstream/Engine.swift",
      "before_sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "after_sha256": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d"
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "before_sha256": "673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2",
      "after_sha256": "4436305f28ee0bac552d3936e15dc235202719cd141e6c76357d24bd2f5c0f67"
    },
    {
      "path": "Sources/Slotstream/Model.swift",
      "before_sha256": "eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6",
      "after_sha256": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4"
    },
    {
      "path": "Sources/Slotstream/Optimizations.swift",
      "before_sha256": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
      "after_sha256": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce"
    },
    {
      "path": "Sources/Slotstream/RequestControl.swift",
      "before_sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "after_sha256": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db",
      "after_sha256": "bc5370d792576a35d8d00fdeba14311b99ebcd3589d5096b13b44b01f8c46ed7"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
      "before_sha256": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542",
      "after_sha256": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
      "before_sha256": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
      "after_sha256": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2"
    }
  ],
  "patch_sha256": "c6fc17ec4ed519801817c9c6dd1ce44a5a97d91dc5f9a501e1e5b473e96480f8",
  "apply_and_reverse_exact": true,
  "joined_v416_native_refusal": true,
  "joined_v419_atomic_fallback": true,
  "compiled": false,
  "tests_executed": false,
  "automatic_defaults_enabled": false,
  "policy": {
    "maximum_scope_tokens": 4096,
    "minimum_equal_full_compute_passes": 4,
    "eligible_actual_compute_sizes": [
      256,
      512,
      1024
    ],
    "workspace_token_tile": 1024,
    "preserves_partial_tails_and_scheduled_checkpoints": true,
    "requires_request_memory_controller": true,
    "live_memory_choice": "atomic preferred/fallback under existing request reservations",
    "process_ceiling": "current Engine plan target (or existing expected peak), bounded by device working set; observed footprint plus conservative additional allocation must fit",
    "public_controls": "never mutated by automatic execution; local option values flow through model scope/forward/attention/mixer; MTP indexer dispatch restored before direct drafting"
  },
  "new_native_requirements": {
    "scope-lifecycle": {
      "automatic_planner_geometries": 3,
      "automatic_memory_fallbacks": 2,
      "additional_checks": "exact states/routes/output/teacher continuation, prefix reuse, short path, cancellation, checked read fault/retry and public controls stable within router callbacks"
    },
    "scope-mtp-vision": {
      "automatic_mtp_planner_geometries": 3,
      "automatic_mtp_prompt_tokens": 4096,
      "additional_checks": "aligned final scope followed by actual fixed-depth speculative decode; exact outputs/states, private head dispatch restored"
    }
  },
  "remaining": "Compile and run all original native families with expanded lifecycle/MTP cases, pure and CLI checks. Qualify actual automatic serving for all eligible planner geometries, threshold/short/prefix and process targets. Full vision component decision, final eight paired workloads, lifetimes, resources/clients, sustained TPS, empirical planner calibration, delivery and activation still remain."
}

````````````
