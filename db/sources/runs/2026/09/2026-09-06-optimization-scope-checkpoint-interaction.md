---
type: run
id: 01m1waa89nyn377hmzp9pmgpme
created: 2026-09-06T21:34:42.997292+00:00
updated: 2026-09-06T21:35:37.993168+00:00
summary: Preserve common-prefix checkpoints across read scopes — V193
binary: Unbuilt source delta; V189 is the latest shared native evidence
captured_at: 2026-09-06
command: Source integration; added Swift checks remain unrun
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Preserve common-prefix checkpoints across read scopes — V193
tool: Source and schedule interaction review
---
V193 is an unbuilt source correction to the interaction between optional layer-major read scopes and common-prefix retention. With a cold1280-token prompt,256-token compute passes and a1024-token read scope, the original grouping commits at1024 and1280, so the Generator condition i == prefixCheckpointTokens never sees the configured256 checkpoint. The separately qualified common-prefix reuse opportunity disappears even though the underlying compute schedule contains that exact boundary. This is a deduction from the actual grouping/store code, not a measured latency result.

The grouping now ends at the existing requested compute boundary when read scopes and an enabled, positive-budget prefix cache are present. It never divides a compute pass, changes chronological arithmetic or claims that an interior token is a coherent checkpoint. The remaining passes still share reads in their next group. A reused boundary, zero/invalid boundary, interior token, disabled cache and zero-budget cache keep the original groups. Engine always passes a cache object, including when disabled; source review therefore explicitly guards the cache's enabled state and budget. All default paths remain unchanged because read scopes remain disabled.

Seven added T0 assertions cover the grouping contract. The existing combined-scope lifecycle diagnostic gains a cold request, complete-state comparison, retained256-prefix state comparison, divergent followup, pin checks and disabled/zero-budget cache cases. These Swift assertions have not run. The next bounded V193 shared build/CLI queue is ready but held for an explicit transfer; its native scope lifecycle still requires the separately qualified interval. V192's prepared queue was never executed.

The existing scope serving draft disables prefix reuse and remains a study of the same intended cache-off mechanism; its final source binding is still required. A retained-prefix scope adoption must pass the new interaction gate and its real-request resource/latency guard. No earlier failed scope study is retried or reinterpreted, and no scope or other optimization default is activated.

Artifact `/tmp/slotstream-optimization-execution/scope-checkpoint-v193/manifest.json` — 1270 bytes; SHA-256 `cd4a80087416fca687baca2f0184baf974c5b680a7c19960174b51284ad0652c`.

````text
{
  "files": [
    {
      "path": "Sources/Slotstream/Context.swift",
      "before_sha256": "0bec23bc161e827c46851161cf131ebc6079e41270cc600a5ff33487e8f5f5f3",
      "after_sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0"
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "before_sha256": "9a1810b3d53664cc3bccb09221246a7dad597937eeb0a7401a4a8201d08a3744",
      "after_sha256": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics.swift",
      "before_sha256": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "after_sha256": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
      "before_sha256": "4bcfd79677f16800fff7cae4dbee68a08b72081795f37162b53b5837ca7c5b29",
      "after_sha256": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96"
    }
  ],
  "status": "applied shared; unbuilt and untested",
  "default_behavior": "unchanged; only optional read scope with enabled, positive-budget prefix cache",
  "numerical_schedule": "existing compute boundaries only; no split/rebatch"
}

````

Artifact `/tmp/slotstream-optimization-execution/scope-checkpoint-v193/fix.patch` — 6636 bytes; SHA-256 `f9a54cde91e217b887c139885e12d22517de375d1de6ea8f469aab0f9ff87537`.

````text
--- a/Sources/Slotstream/Context.swift
+++ b/Sources/Slotstream/Context.swift
@@ -114,6 +114,23 @@
             if count >= bound { break }
         }
         return result
+    }
+
+    /// End a read-sharing group at a requested checkpoint only when one of
+    /// its existing compute passes already ends there. This preserves every
+    /// arithmetic shape; an interior token never manufactures a new pass.
+    package static func preservingCheckpoint(_ passes: [Int], from position: Int,
+                                             checkpoint: Int) -> [Int] {
+        guard position >= 0, checkpoint > position,
+              checkpoint <= ContextPolicy.modelLimit else { return passes }
+        var end = position
+        for (index, count) in passes.enumerated() {
+            guard count > 0, count <= ContextPolicy.modelLimit - end else { return passes }
+            end += count
+            if end == checkpoint { return Array(passes.prefix(index + 1)) }
+            if end > checkpoint { return passes }
+        }
+        return passes
     }
 
     /// The passes that reading `tokens` new tokens from `position` runs.
--- a/Sources/Slotstream/Generate.swift
+++ b/Sources/Slotstream/Generate.swift
@@ -751,6 +751,13 @@
                     tailAware: model.optimizations.tailAwarePrefill)
                 : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                     maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)]
+            if let cache, model.optimizations.readScopeEnabled, cache.enabled, cache.maxTokens > 0 {
+                // A read scope may otherwise step over the intended reusable
+                // checkpoint. End the group at an existing compute boundary;
+                // the next group still reuses reads across its remaining rows.
+                passes = PrefillSchedule.preservingCheckpoint(passes, from: i,
+                    checkpoint: model.optimizations.prefixCheckpointTokens)
+            }
             model.smallPrefillSweep = PrefillSchedule.chunk(at: i, maxChunk: 256) < 256
             if model.smallPrefillSweep {
                 model.stableSmallPrefillRouting = true
--- a/Sources/SlotstreamDiagnostics/Diagnostics.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics.swift
@@ -123,6 +123,21 @@
             }
         }
         c.expect("read scopes preserve every bounded compute pass", scopesPreserveSchedule)
+        let checkpointScope = PrefillSchedule.scopePasses(remaining: 1280, at: 0,
+            maxChunk: 256, maxScope: 1024, tailAware: false)
+        c.equal("read-sharing group contains the existing checkpoint boundary", checkpointScope, [256, 256, 256, 256])
+        c.equal("retention preserves that boundary without splitting compute", PrefillSchedule.preservingCheckpoint(
+            checkpointScope, from: 0, checkpoint: 256), [256])
+        c.equal("later boundary preserves all preceding compute passes", PrefillSchedule.preservingCheckpoint(
+            checkpointScope, from: 0, checkpoint: 512), [256, 256])
+        c.equal("interior token never rebatches a compute pass", PrefillSchedule.preservingCheckpoint(
+            checkpointScope, from: 0, checkpoint: 255), checkpointScope)
+        c.equal("a reused checkpoint does not shorten the next read scope", PrefillSchedule.preservingCheckpoint(
+            checkpointScope, from: 256, checkpoint: 256), checkpointScope)
+        c.equal("disabled retention preserves the read scope", PrefillSchedule.preservingCheckpoint(
+            checkpointScope, from: 0, checkpoint: 0), checkpointScope)
+        c.equal("out-of-range checkpoint preserves the read scope", PrefillSchedule.preservingCheckpoint(
+            checkpointScope, from: 0, checkpoint: Int.max), checkpointScope)
         c.equal("zero remainder makes no pass", PrefillSchedule.next(remaining: 0, at: 32768, maxChunk: 4096, tailAware: true), 0)
         c.equal("out-of-model diagnostic position has no legal pass", PrefillSchedule.chunk(at: Int.max, maxChunk: Int.max), 0)
 
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift
@@ -168,6 +168,29 @@
         if integratedBase {
             c.expect("combined scope lifecycle executes fused rotation", model.fusedRoPERotationsScheduled > 0)
             c.equal("combined scope lifecycle returns an idle pool", model.pool.pinnedSlotCount, 0)
+            // A cold read scope must not erase the independently qualified
+            // common-prefix checkpoint merely by grouping past its boundary.
+            let coldCache = PrefixCache(maxTokens: 8192)
+            let cold = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: coldCache)
+            c.equal("cold combined scope preserves exact output", cold.0, referenceIds)
+            c.equal("cold combined scope stores the requested checkpoint", cold.1.prefixCheckpointStores, 1)
+            c.equal("checkpoint splits only the read group", cold.1.prefillPasses, [256, 1024])
+            c.equal("checkpoint preserves every compute pass", cold.1.prefillComputePasses, Array(repeating: 256, count: 5))
+            if let complete = coldCache.take(matching: prompt + cold.0 + [907], reserveTokens: 2048) {
+                equalState(referenceState, complete.state, "cold combined scope exact continuation")
+            } else { c.expect("cold combined scope retains complete state", false) }
+            let divergent = Array(prompt.prefix(256)) + [999]
+            if let common = coldCache.take(matching: divergent, reserveTokens: 2048) {
+                c.equal("divergent followup reuses the common checkpoint", common.reused, 256)
+                equalState(seedState, common.state, "cold scope checkpoint matches chronological seed")
+            } else { c.expect("cold scope retains the divergent followup checkpoint", false) }
+            c.equal("cold scope and checkpoint forks release pool pins", model.pool.pinnedSlotCount, 0)
+            for disabled in [PrefixCache(maxTokens: 8192, enabled: false), PrefixCache(maxTokens: 0)] {
+                let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: disabled)
+                c.equal("inactive cache preserves the original read groups", result.1.prefillPasses, [1024, 256])
+                c.equal("inactive cache creates no checkpoint", result.1.prefixCheckpointStores, 0)
+                c.equal("inactive cache retains exact scoped output", result.0, referenceIds)
+            }
         }
         return c.report()
     }

````

Artifact `/tmp/slotstream-optimization-execution/scope-checkpoint-v193/after/Sources/Slotstream/Context.swift` — 14145 bytes; SHA-256 `fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0`.

````text
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

````

Artifact `/tmp/slotstream-optimization-execution/scope-checkpoint-v193/after/Sources/Slotstream/Generate.swift` — 74261 bytes; SHA-256 `7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d`.

````text
// Prefill + decode loop with sampling, stop tokens, and streaming callbacks.

import Foundation
import MLX

public struct SampleParams {
    public var temperature: Float = 0.7
    public var topP: Float = 0.8
    public var topK: Int = 20
    public var minP: Float = 0
    public var presencePenalty: Float = 1.5
    public var seed: UInt64? = nil
    public var maxTokens = 512
    /// Text sequences that end generation (Ollama `options.stop`, OpenAI `stop`).
    public var stop: [String] = []

    public init() {}

    /// Clamp every knob into the range the sampler is defined on.
    ///
    /// Values outside it used to produce silent garbage rather than an error:
    /// a `top_p` of 0 or a `min_p` above 1 filters out every candidate, and the
    /// old `probs / probs.sum()` then divided 0 by 0, so the sampler emitted
    /// token 0 forever. A negative `num_predict` (Ollama's "until EOS") indexed
    /// a reversed Range and trapped, killing the process.
    public func sanitized() -> SampleParams {
        var p = self
        if !p.temperature.isFinite { p.temperature = 0 }
        p.temperature = max(0, p.temperature)
        if !p.topP.isFinite || p.topP <= 0 || p.topP > 1 { p.topP = 1 }
        if !p.minP.isFinite { p.minP = 0 }
        p.minP = min(max(0, p.minP), 1)
        if !p.presencePenalty.isFinite { p.presencePenalty = 0 }
        p.topK = max(0, p.topK)
        // <= 0 means "as many as allowed" for Ollama (-1) and OpenAI clients.
        if p.maxTokens <= 0 { p.maxTokens = SampleParams.maxTokenCeiling }
        p.maxTokens = min(p.maxTokens, SampleParams.maxTokenCeiling)
        p.stop = p.stop.filter { !$0.isEmpty }
        return p
    }

    /// Upper bound on a single response. Decode is the slow axis here, so an
    /// unbounded "until EOS" request needs a ceiling that is generous but finite.
    public static let maxTokenCeiling = 32_768

    public static var instruct: SampleParams { SampleParams() }
    public static var thinking: SampleParams {
        var p = SampleParams()
        p.temperature = 1.0
        p.topP = 0.95
        p.presencePenalty = 0
        return p
    }
    public static var greedy: SampleParams {
        var p = SampleParams()
        p.temperature = 0
        p.presencePenalty = 0
        return p
    }

    /// Defaults for an agent turn that may call tools.
    ///
    /// Two departures from `instruct`, and both are about the tool grammar
    /// rather than taste:
    ///
    /// * **presence penalty 0.** The instruct default of 1.5 penalises every
    ///   token already used, and the call format is obliged to repeat itself —
    ///   `</parameter>` after every argument, then `</function>`, then
    ///   `</tool_call>`. Penalising a closing tag because an earlier argument
    ///   already used it pushes the model off the grammar exactly where it must
    ///   stay on it.
    /// * **low temperature.** A tool call is a structured artefact with one
    ///   right shape, not prose; there is nothing for sampling diversity to buy
    ///   here, and at 0.7 the same prompt answered with a call on one run and
    ///   with "I don't have any tools available" on the next.
    ///
    /// Not fully greedy: `0.2` keeps a little room to escape a repetition loop,
    /// which pure argmax has no way out of.
    public static var agent: SampleParams {
        var p = SampleParams()
        p.temperature = 0.2
        p.topP = 0.9
        p.presencePenalty = 0
        return p
    }
}

public struct GenStats: Codable {
    public var requestSeconds = 0.0
    public var queueSeconds = 0.0
    public var imageEncodeSeconds = 0.0
    /// Configured vision query bound for this image request, not a kernel count.
    public var visionQueryTile = 0
    /// Counted after each query tile has actually evaluated, across tower blocks.
    public var visionQueryTileCalls = 0
    public var encodedImages = 0
    public var reusedImageFeatures = 0
    public var prefixSkippedImages = 0
    /// From Generator entry to first sampled, non-EOS token; excludes Engine queue.
    public var firstTokenSeconds: Double?
    /// From Engine entry to first nonempty decoded callback, before that callback.
    public var firstTextSeconds: Double?
    public var tokenCallbackSeconds = 0.0
    public var sampleSeconds = 0.0
    public var prefillLocalVictims = 0
    public var decodeLocalVictims = 0
    public var prefillSlotSliceBatches = 0
    public var decodeSlotSliceBatches = 0
    public var decodeSlotSliceRuns = 0
    public var decodeSlotScatterBatches = 0
    public var prefillSlotWordBatches = 0
    public var decodeSlotWordBatches = 0
    public var decodeSlotWordBuffers = 0
    public var prefillSlotCPUBatches = 0
    public var decodeSlotCPUBatches = 0
    public var prefixCheckpointForks = 0
    public var prefixCheckpointStores = 0
    public var prefixCheckpointRefusals = 0
    public var prefixCheckpointErrors = 0
    public var completePromptHits = 0
    public var completePromptStores = 0
    public var embeddingRowsEnabled = false
    /// Unique lookup rows served/read within this request, including MTP.
    public var embeddingRowHits = 0
    public var embeddingRowMisses = 0
    public var embeddingCachedRows = 0
    public var embeddingCachedPayloadBytes = 0
    public var reconciliationSeconds = 0.0
    public var draftSeconds = 0.0
    public var verifySeconds = 0.0
    /// Actual attempted depths: zero is a useful calibration/tail target step;
    /// minus one permanently hands this request to plain decode. Bounded by
    /// the request's output ceiling, and exported with diagnostic stats only.
    public var adaptiveDraftDepths: [Int] = []
    public var adaptiveDisabledAtOutput: Int?
    public var adaptivePlainTokens = 0
    public var decodeForwardPasses = 0
    public var decodeModelTokens = 0
    /// Arrival intervals at the token callback, including earlier callback
    /// stalls. Speculative bursts can contain several very short intervals.
    public var interTokenSeconds: [Double] = []
    public var prefillPasses: [Int] = []
    public var prefillComputePasses: [Int] = []
    /// Actual maximum attention key extent of each committed compute pass,
    /// including masked numerical-alignment padding when that path executes.
    public var prefillComputeKeyExtents: [Int] = []
    /// Physical query rows, including cropped dummy rows used to preserve
    /// matrix-attention arithmetic for very short late-context tails.
    public var prefillComputeQueryRows: [Int] = []
    public var terminalQueryRowsSkipped = 0
    public var terminalMoERowsSkipped = 0
    public var abortedReadScopes = 0
    public var reconciledHeadTokens = 0
    public var reusedHeadTokens = 0
    public var lifetimeRSSPeakBytes: UInt64 = 0
    public var physicalFootprintEndBytes: UInt64 = 0
    public var sampledFootprint: FootprintSampler.Result?
    public var imagePreparation: ImagePreparationObservation?
    public var generatorVMBefore: ProcessMemory.VMActivity?
    public var generatorVMAfter: ProcessMemory.VMActivity?
    public var generatorSystemBefore: ProcessMemory.OperatingConditions?
    public var generatorSystemAfter: ProcessMemory.OperatingConditions?
    public var mlxActiveEndBytes = 0
    public var mlxCacheEndBytes = 0
    public var prefillMLXActiveBytes = 0
    public var prefillMLXCacheBytes = 0
    public var prefillPhysicalFootprintBytes: UInt64 = 0
    public var prefillGPUWaitSeconds = 0.0
    public var prefillRowSortSeconds = 0.0
    public var prefillReadBytes = 0
    public var decodeReadBytes = 0
    public var allocatedSequenceBytes = 0
    public var sharedExpertPrelaunches = 0
    public var fusedRoPERotationsScheduled = 0
    public var fusedGDNProjectionsScheduled = 0
    public var packedGDNProjectionLayers = 0
    public var packedGDNProjectionPayloadBytes = 0
    public var ropeTableHits = 0
    public var ropeTableBuilds = 0
    public var residentExpertPrelaunches = 0
    public var residentExpertJoins = 0
    /// Host wait at the explicit join; this is not a measured GPU duration.
    public var residentExpertJoinSeconds = 0.0
    public var ngramCachedRows = 0
    public var cachedRouterBytes = 0
    public var ngramCachePayloadBytes = 0
    /// Every token in the prompt, whether or not it had to be recomputed.
    /// This is what the Ollama/OpenAI surfaces report as prompt_eval_count.
    public var promptTokens = 0
    /// Prompt tokens actually pushed through the model this request. Equal to
    /// `promptTokens` on a cold prompt; `promptTokens - reusedPrefixTokens`
    /// when the conversation prefix cache matched.
    public var prefillTokens = 0
    /// Prompt tokens served from the retained state of a previous request.
    public var reusedPrefixTokens = 0
    public var prefillSeconds = 0.0
    public var decodeTokens = 0
    public var decodeSeconds = 0.0
    public var expertHitRate = 0.0
    public var ngramRowHits = 0
    public var ngramRowMisses = 0
    public var ngramLookaheadRows = 0
    public var ngramLookaheadDiscarded = 0
    public var ngramLookaheadWaitSeconds = 0.0
    public var ngramPrefetchSeconds = 0.0
    /// Speculative decode (MTP): drafts proposed, drafts accepted, and verify
    /// passes run. Zero when the draft head is disabled.
    public var draftedTokens = 0
    public var acceptedDrafts = 0
    public var verifyPasses = 0
    public var draftAcceptRate: Double {
        draftedTokens > 0 ? Double(acceptedDrafts) / Double(draftedTokens) : 0
    }
    /// Legacy observation: max(lifetime RSS, current physical footprint).
    /// It is not an upper bound on physical-footprint peaks. The separate
    /// sampledFootprint observation is required for memory qualification.
    public var peakMemoryGB = 0.0
    /// MLX-only high-water retained as a diagnostic, never as the RAM gate.
    public var mlxPeakMemoryGB = 0.0
    /// Read/scatter host intervals can overlap GPU work. Subtracting them
    /// from wall time does not measure GPU compute.
    public var prefillIOSeconds = 0.0
    public var prefillScatterSeconds = 0.0
    public var prefillRecords = 0
    /// The same split for decode. Prefill's was what showed the chunk size was
    /// the lever and read-ahead was not; decode had no equivalent, so "decode
    /// is slow" could not be attributed to the miss path, to the scatter, or
    /// to per-token dispatch without guessing. Everything not counted here is
    /// compute plus dispatch.
    public var decodeIOSeconds = 0.0
    public var decodeScatterSeconds = 0.0
    public var decodeRecords = 0
    /// "stop" (EOS or stop sequence), "length", "error", or a low-level
    /// caller's explicit "cancelled" checkpoint yield.
    public var finishReason = "stop"
    /// A recoverable request failure. The failed state is never cached and
    /// serving adapters must emit an error instead of a successful completion.
    public var runtimeError: String?
    public var requestFailure: RequestFailure?
    public var smallPrefillSweeps = 0
    public var contextArithmetic = "standard"
    public var preparationSeconds = 0.0
    /// Pressure-to-observed-safe-boundary latency, not GPU preemption time.
    public var memoryPressureCancelled = false
    public var memoryPressureBoundarySeconds: Double?

    public var prefillTPS: Double { prefillSeconds > 0 ? Double(prefillTokens) / prefillSeconds : 0 }
    public var prefixHit: Bool { reusedPrefixTokens > 0 }
    public var decodeTPS: Double { decodeSeconds > 0 ? Double(decodeTokens) / decodeSeconds : 0 }
}

/// Token sampling, split out from the decode loop so it can be exercised on
/// synthetic logits with no checkpoint loaded (`slotstream sampler-golden`)
/// and compared against the numpy reference in `Tools/sampler_ref.py`.
///
/// Order matches HuggingFace's processor chain: presence penalty on raw
/// logits, then temperature, then top-k, then top-p, then min-p.
public struct Sampler {
    public var rngState: UInt64 = 0x9E37_79B9_7F4A_7C15
    public var valueOnlyTopK = false
    public var deviceDraw = false

    public init(seed: UInt64? = nil) {
        if let s = seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
    }

    public mutating func next(
        _ logits: MLXArray, params: SampleParams, generated: Set<Int>
    ) -> Int {
        var l = logits.reshaped([-1]).asType(.float32)
        if params.presencePenalty != 0 && !generated.isEmpty {
            // subtract penalty on already-generated tokens
            let ids = MLXArray(generated.sorted().map { Int32($0) })
            let current = take(l, ids, axis: 0)
            l = putAlong(l, ids, values: current - params.presencePenalty, axis: 0)
        }
        if params.temperature <= 0 {
            return argMax(l).item(Int.self)
        }
        l = l / params.temperature
        if params.topK > 0 && params.topK < l.dim(0) {
            let kth: MLXArray
            if valueOnlyTopK {
                // Only the threshold is needed, never the sort's indices.
                // Threshold ties still survive; CDF ordering and RNG are intact.
                kth = -partitioned(-l, kth: params.topK - 1)[params.topK - 1]
            } else {
                kth = takeAlong(
                    l, argPartition(-l, kth: params.topK - 1)[..<params.topK], axis: 0
                ).min()
            }
            l = which(l .< kth, MLXArray(-Float.infinity), l)
        }
        var probs = softmax(l, axis: -1)
        if params.topP < 1 {
            let order = argSort(-probs)
            let sorted = take(probs, order, axis: 0)
            let cum = cumsum(sorted, axis: 0)
            let keepSorted = (cum - sorted) .< params.topP  // keep until cumulative prob (exclusive) reaches topP
            var keep = MLXArray.zeros([probs.dim(0)], dtype: .bool)
            keep = putAlong(keep, order, values: keepSorted, axis: 0)
            probs = which(keep, probs, MLXArray(Float(0)))
        }
        if params.minP > 0 {
            let cutoff = probs.max() * params.minP
            probs = which(probs .< cutoff, MLXArray(Float(0)), probs)
        }
        // gumbel-free categorical: inverse CDF with a splitmix stream.
        // The draw is scaled by the unnormalized total instead of normalizing
        // the probabilities: it avoids a 0/0 when a filter empties the
        // candidate set, and since u < 1 it also guarantees u*total < total,
        // so the pick can never run off the end of the CDF onto a
        // zero-probability token the way a bare `cdf .< u` could.
        rngState = Splitmix.mix(rngState &+ 1)
        let u = Float(Double(rngState >> 11) / Double(1 << 53))
        let cdf = cumsum(probs, axis: 0)
        if deviceDraw {
            let total = cdf[probs.dim(0) - 1]
            let valid = isFinite(total) .&& (total .> MLXArray(Float(0)))
            // At zero, select the first strictly positive CDF. A lower-bound
            // search otherwise chooses a leading token with zero mass.
            let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< (MLXArray(u) * total)
            let pick = minimum(before.sum(), MLXArray(probs.dim(0) - 1))
            let fallback = argMax(logits.reshaped([-1]).asType(.float32)).asType(pick.dtype)
            return which(valid, pick, fallback).item(Int.self)
        }
        let total = cdf[probs.dim(0) - 1].item(Float.self)
        guard total.isFinite, total > 0 else {
            // Nothing survived filtering (or the logits were NaN): fall back to
            // the most likely token rather than emitting token 0 forever.
            return argMax(logits.reshaped([-1]).asType(.float32)).item(Int.self)
        }
        let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< MLXArray(u * total)
        let pick = before.sum().item(Int.self)
        return min(pick, probs.dim(0) - 1)
    }
}

public final class Generator {
    public let model: Qwen4ExpModel
    /// Tokens per prefill pass. Bigger is faster on long prompts: a chunk
    /// activates nearly every expert of every layer, so the expert stream is
    /// re-read roughly once per chunk and halving the chunk count halves the
    /// bytes moved. It costs transient activation memory, which is why it is a
    /// knob rather than "as large as the prompt". Measured in MEASUREMENTS.md.
    public var prefillChunk = PrefillTuning.chunk {
        didSet { if let ceiling = prefillBudgetCeiling { prefillChunk = min(max(1, prefillChunk), ceiling) } }
    }
    private var prefillBudgetCeiling: Int?
    package func setPrefillBudgetCeiling(_ ceiling: Int?) {
        prefillBudgetCeiling = ceiling
        if let ceiling { prefillChunk = min(max(1, prefillChunk), ceiling) }
    }
    /// Draft tokens per speculative round when the MTP head is enabled.
    /// Depth 1 by measurement (MEASUREMENTS M9). At 122 experts/layer, the
    /// size auto enables the head at, depth 1 reads ×1.17, depth 2 ×1.13 and
    /// depth 4 ×0.88; at 57/layer ×1.13 / ×1.12 / ×0.96. A k-token verify
    /// pass costs about 1 + 0.16k single passes with every expert resident
    /// and verified recurrent states are recorded for exact rollback.
    /// SLOTSTREAM_DRAFT_DEPTH overrides for experiments.
    public var draftDepth: Int = {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_DRAFT_DEPTH"],
            let n = Int(s), n >= 1, n <= 16 { return n }
        return 1
    }()
    /// Gate for the speculative path — `mtp-check` compares speculative
    /// against plain decode on the same loaded model by flipping this.
    public var speculationEnabled = true
    /// Optional observer, disabled in ordinary inference. A/B its overhead.
    public var footprintSampling = false
    /// Deterministic cost injection for state-transition diagnostics only.
    /// Does not change allocations, model values or request authority.
    package var adaptiveCostOverride: ((Double, Bool) -> Double)?
    /// `SLOTSTREAM_SWEEP_TRACE=1` prints where a sweep's prefill time went.
    static let sweepTrace = ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_TRACE"] == "1"
    /// MLX buffer-cache cap in bytes while a prompt of `SweepTuning.minTokens`
    /// or more is read, nil for no cap. The engine sets it from the memory
    /// plan: 512 MB at targets of 12 GB and under, where the sweep's varying
    /// array sizes filling the 2 GB cache cost a 7,960-token prompt 1.7 GB of
    /// peak at the 8.1 GB floor (measured 7.4 against 9.1 GB); nothing above,
    /// where the cache is cheap and the cap costs about 6% of prefill.
    /// `SLOTSTREAM_PREFILL_CACHE_MB` overrides at any target.
    public var prefillCacheLimit: Int? = nil
    /// Called after every prefill pass with (tokens read this request, tokens
    /// this request will read, seconds elapsed). `run` and `serve` hang a
    /// PrefillProgressReporter here so a five-minute prompt does not look
    /// like a hang.
    public var onPrefillProgress: ((Int, Int, Double) -> Void)?
    /// Same progress plus the absolute already-consumed prefix. The original
    /// callback remains compatible for embedding clients.
    public var onPrefillProgressAbsolute: ((Int, Int, Double, Int) -> Void)?
    var sampler = Sampler()
    var rngState: UInt64 {
        get { sampler.rngState }
        set { sampler.rngState = newValue }
    }

    public init(model: Qwen4ExpModel) {
        self.model = model
    }

    func sample(_ logits: MLXArray, params: SampleParams, generated: Set<Int>) -> Int {
        sampler.next(logits, params: params, generated: generated)
    }

    /// Runs prefill + decode; calls `onToken` for each generated token id.
    /// Returns (tokenIds, stats). `stop` checked between tokens (cancellation).
    /// `cache`, when given, is consulted for a state this prompt extends and
    /// receives the state back at the end, holding exactly the ids it consumed.
    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil
    ) -> ([Int], GenStats) {
        generate(promptIds: promptIds, params: params, eosIds: eosIds, cache: cache, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> ([Int], GenStats) {
        let requestStart = RuntimeClock.now()
        let smallSweepStart = model.smallPrefillSweeps
        let originalSmallSweep = model.smallPrefillSweep
        let originalReferenceStart = model.smallPrefillReferenceStart
        let originalReferenceEnd = model.smallPrefillReferenceEnd
        let originalSmallRouting = model.stableSmallPrefillRouting
        let originalSmallAttention = model.stableSmallPrefillAttention
        let originalSmallProjections = model.stableSmallPrefillProjections
        let originalReferenceDispatch = model.alignSmallReferenceDispatch
        defer {
            model.smallPrefillSweep = originalSmallSweep
            model.smallPrefillReferenceStart = originalReferenceStart
            model.smallPrefillReferenceEnd = originalReferenceEnd
            model.stableSmallPrefillRouting = originalSmallRouting
            model.stableSmallPrefillAttention = originalSmallAttention
            model.stableSmallPrefillProjections = originalSmallProjections
            model.alignSmallReferenceDispatch = originalReferenceDispatch
        }
        let sharedPrelaunchStart = model.sharedExpertPrelaunches
        let rotationStart = model.fusedRoPERotationsScheduled
        let gdnProjectionStart = model.fusedGDNProjectionsScheduled
        let ropeHitStart = model.ropeTableHits
        let ropeBuildStart = model.ropeTableBuilds
        let residentPrelaunchStart = model.residentExpertPrelaunches
        let residentJoinsStart = model.residentExpertJoins
        let residentJoinStart = model.residentExpertJoinSeconds
        let terminalQueryStart = model.terminalQueryRowsSkipped
        let terminalMoEStart = model.terminalMoERowsSkipped
        let footprint = footprintSampling ? FootprintSampler() : nil
        let params = params.sanitized()
        sampler.valueOnlyTopK = model.optimizations.valueOnlySamplerThreshold
        sampler.deviceDraw = model.optimizations.deviceSamplerDraw
        if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
        var stats = GenStats()
        // The speculative loop borrows stats as inout. Its continuation
        // callback must record cancellation outside that exclusive borrow.
        var callerCancellation: RequestFailure?
        stats.promptTokens = promptIds.count
        let embeddingHitsStart = model.resident.embeddingRowHits
        let embeddingMissesStart = model.resident.embeddingRowMisses
        func finish(_ output: [Int]) -> ([Int], GenStats) {
            stats.smallPrefillSweeps = model.smallPrefillSweeps - smallSweepStart
            stats.embeddingRowsEnabled = model.resident.usesEmbeddingRows
            stats.embeddingRowHits = model.resident.embeddingRowHits - embeddingHitsStart
            stats.embeddingRowMisses = model.resident.embeddingRowMisses - embeddingMissesStart
            stats.embeddingCachedRows = model.resident.embeddingCachedRows
            stats.embeddingCachedPayloadBytes = model.resident.embeddingCachedPayloadBytes
            if let failure = request?.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
                stats.memoryPressureCancelled = failure.code == .insufficientMemory
            } else if let failure = callerCancellation {
                stats.requestFailure = failure
                stats.finishReason = "cancelled"
            } else if stats.requestFailure?.code == .clientCancelled {
                stats.finishReason = "cancelled"
            }
            return (output, stats)
        }
        stats.imagePreparation = vision?.preparationObservation
        stats.visionQueryTile = vision == nil ? 0 : model.optimizations.visionQueryTile
        stats.generatorVMBefore = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemBefore = footprintSampling ? ProcessMemory.operatingConditions() : nil
        // An empty prompt would leave `logits` at its placeholder value and make
        // the sampler invent a first token from nothing. Callers reject this at
        // the API boundary; this is the backstop.
        guard !promptIds.isEmpty else {
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.sampledFootprint = footprint?.finish()
            stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // Preserve the idle-pool guarantee even when a nonempty request is
        // rejected before state reservation or model preparation.
        defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
        guard promptIds.count <= ContextPolicy.modelLimit,
              params.maxTokens <= ContextPolicy.modelLimit - promptIds.count else {
            let failure = RequestFailure(.contextLengthExceeded, "prompt plus output exceeds the model context limit")
            request?.fail(failure)
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.sampledFootprint = footprint?.finish()
            return finish([])
        }
        // A retained checkpoint may fork backing arrays. Its reservation is
        // real future work, so require physical headroom before taking it.
        let forkBytes = (cache?.heldCheckpoints ?? 0) > 0
            ? model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil) : 0
        do { try request?.check(nextAllocationBytes: ContextBytes.sum(PrefixCache.fixedBytesPerEntry, forkBytes), phase: "state reservation") }
        catch {
            stats.sampledFootprint = footprint?.finish()
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return finish([])
        }
        model.prepareOptimizationKernels()
        // Vision prompts are cacheable, but not on ids alone: every image
        // expands to a run of the same placeholder id, so a second picture of
        // the same shape produces identical ids. The image segments carry a
        // digest of the bytes behind each run, and `take` requires those to
        // agree as well; a swapped image therefore misses instead of resuming
        // a state built from the wrong pixels.
        let images = vision?.cacheSegments(attentionPadding: model.optimizations.visionAttentionPadding,
            queryTile: model.optimizations.visionQueryTile) ?? []
        // A hit hands over the state and the count of prompt tokens it already
        // consumed; a miss evicts enough LRU state before this allocation to
        // keep retained + active state inside the shared bounds (PrefixCache).
        let checkpointHitsBefore = cache?.checkpointHits ?? 0
        let completeKey = model.optimizations.completePromptCheckpoint
            ? PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil) : nil
        let hit = cache?.takeForGeneration(
            matching: promptIds, images: images,
            reserveTokens: promptIds.count + params.maxTokens,
            reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil), completePromptKey: completeKey,
            modelIdentity: model.promptCheckpointIdentity)
        let state = hit?.state ?? model.makeState()
        let reused = hit?.reused ?? 0
        let stateKnowsMTP = hit == nil || state.hasValidMTP
        let mtpHead = speculationEnabled && stateKnowsMTP ? model.mtpHead : nil
        model.smallPrefillReferenceStart = reused
        model.smallPrefillReferenceEnd = promptIds.count
        var smallReferenceStart: Int?
        func checkAllocation(end: Int, draftEnd: Int? = nil, workspaceBytes: Int = 0, phase: String) throws {
            let allocated = model.sequenceAllocationBytes(tokens: end, draftTokens: draftEnd, state: state,
                sharedBacking: (cache?.heldCheckpoints ?? 0) > 0 || hit?.logits != nil)
            let (bytes, overflow) = allocated.addingReportingOverflow(workspaceBytes)
            try request?.check(nextAllocationBytes: overflow ? Int.max : bytes, phase: phase)
        }
        let canContinue: () -> Bool = {
            // Sampling and cancellation checks do not imply a forward. Each
            // actual prefill, decode or speculative allocation is priced at
            // its real end position immediately before that work starts.
            do { try request?.check(phase: "inference boundary") }
            catch { return false }
            if shouldContinue?() == false {
                let failure = request?.failure ?? RequestFailure(.clientCancelled, "inference was cancelled by its caller")
                request?.fail(failure)
                callerCancellation = failure
                return false
            }
            return true
        }
        do {
            try request?.admit(missingTokens: promptIds.count - reused, from: reused,
                maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)
            let initialEnd = min(promptIds.count, reused + prefillChunk)
            try checkAllocation(end: initialEnd, draftEnd: mtpHead != nil ? max(0, initialEnd - 1) : nil,
                phase: "initial state allocation")
            if onAdmitted?() == false {
                request?.cancel()
                stats.sampledFootprint = footprint?.finish()
                return finish([])
            }
        } catch {
            stats.sampledFootprint = footprint?.finish()
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return finish([])
        }
        stats.reusedPrefixTokens = reused
        stats.prefixCheckpointForks = (cache?.checkpointHits ?? 0) - checkpointHitsBefore
        stats.completePromptHits = hit?.logits == nil ? 0 : 1
        MLX.Memory.peakMemory = 0
        // Zero before prefill, not only after: otherwise these carry the
        // previous request's decode phase into this request's prefill split.
        model.pool.resetStats()
        model.ngram.resetStats()
        model.ngram.resetObservation()

        // ---- prefill in chunks (only the tokens the state has not consumed)
        // With the MTP draft head enabled, every chunk also flows through the
        // head so its attention cache covers the whole prompt: the entry for
        // token i fuses the previous position's multi stream with token i's
        // embedding, keeping the invariant mtp.offset == tokenCount - 1.
        // A state handed back by the cache that a plain-path request built
        // has no draft cache to extend; finish that request plain rather than
        // speculating over a misaligned head (unreachable in serve, where the
        // mode is fixed per process; the A/B tools flip it per request).
        // Vision prompts speculate too now: the head's prefill consumption
        // splices the tower's rows at the placeholder positions (MTPHead's
        // `spliceVisionEmbeds`), so its cache is built on the embeddings the
        // main model actually saw. A state produced by a plain vision request
        // still runs plain, since its head cache would claim positions the
        // main state no longer matches.
        if mtpHead != nil && state.mtp == nil { state.mtp = MTPState() }
        if mtpHead == nil { state.invalidateMTP() }
        // Vision: the tower runs here and not at tokenize time, so an image the
        // reused prefix already covers costs nothing at all. What comes back is
        // one run per image still needing a splice, at absolute prompt offsets,
        // which each chunk clips to its own window. The offsets come from the
        // segments rather than from a scan for placeholder ids, so the reused
        // head is skipped for free.
        // A sweep allocates arrays whose sizes vary from group to group, and
        // MLX's buffer cache keeps every freed size up to its limit, so by the
        // end of a long prompt the cache alone held its whole 2 GB (measured
        // 2.16 GB) on top of the pass. Where memory is tight the engine caps
        // it while the prompt is read (`prefillCacheLimit`); decode's small,
        // uniform working set gets the full cache back.
        let savedCacheLimit = MLX.Memory.cacheLimit
        defer { MLX.Memory.cacheLimit = savedCacheLimit }
        if let cap = prefillCacheLimit, promptIds.count - reused >= SweepTuning.minTokens {
            MLX.Memory.cacheLimit = min(savedCacheLimit, cap)
        }
        let imageStart = RuntimeClock.now()
        let visionRuns: [VisionRun]
        do {
            visionRuns = try vision?.runsChecked(consumedTokens: reused, deduplicate: model.optimizations.deduplicateImages,
                attentionPadding: model.optimizations.visionAttentionPadding,
                queryTile: model.optimizations.visionQueryTile, request: request) ?? []
        } catch {
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            stats.runtimeError = "image preprocessing failed: \(error)"
            stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
            stats.finishReason = "error"
            stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.sampledFootprint = footprint?.finish()
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // The tower evaluates each transformer block, but its final merger is
        // lazy. Complete it here so image time includes the whole encoder and
        // prefill time does not silently absorb the last image projection.
        if !visionRuns.isEmpty { eval(visionRuns.map(\.rows)) }
        stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
        stats.encodedImages = vision?.encodedImages ?? 0
        stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
        stats.reusedImageFeatures = vision?.reusedImageFeatures ?? 0
        stats.prefixSkippedImages = vision?.prefixSkippedImages ?? 0
        var t0 = RuntimeClock.now()
        var logits: MLXArray = hit?.logits ?? MLXArray(0)
        var i = reused
        func discardFailedState(_ error: Error) {
            // Read workers are already joined by the checked stores. Complete
            // previously queued, valid pool copies and GPU readers before
            // releasing pins. This request state is never returned to cache.
            model.pool.commitAdmissions()
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            state.setRecording(false)
            state.invalidateMTP()
            stats.runtimeError = "model execution failed: \(error)"
            stats.finishReason = "error"
        }
        func progress(_ done: Int, _ elapsed: Double) {
            onPrefillProgress?(done, promptIds.count - reused, elapsed)
            onPrefillProgressAbsolute?(done, promptIds.count - reused, elapsed, reused)
        }
        if i < promptIds.count { progress(0, 0) }
        var cancelledPrefill = false
        while i < promptIds.count {
            if cancelledPrefill || !canContinue() {
                MLX.Memory.cacheLimit = savedCacheLimit
                stats.finishReason = "stop"
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillLocalVictims = model.pool.floorLocalVictims
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                stats.sampledFootprint = footprint?.finish()
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                model.pool.admitOnSweep = false
                // Each completed chronological pass is a whole-stack commit.
                // Publish only that boundary; a partial image keeps its digest
                // and consumed span, never identities of future images.
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                if request?.mayRetainState != false, i > 0, state.tokenCount == i {
                    let committedImages = images.compactMap { image -> ImageSegment? in
                        guard image.start < i else { return nil }
                        return ImageSegment(start: image.start, count: min(image.count, i - image.start),
                            hash: image.hash, preparationIdentity: image.preparationIdentity)
                    }
                    cache?.store(state: state, tokens: Array(promptIds.prefix(i)), images: committedImages)
                }
                stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
                stats.cachedRouterBytes = model.cachedRouterBytes
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                return finish([])
            }
            // Shape changes retain the measured envelope and are qualified
            // against the rechunking numerical contract, not assumed exact.
            var passes = model.optimizations.readScopeEnabled
                ? PrefillSchedule.scopePasses(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, maxScope: model.optimizations.readScopeTokens,
                    tailAware: model.optimizations.tailAwarePrefill)
                : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)]
            if let cache, model.optimizations.readScopeEnabled, cache.enabled, cache.maxTokens > 0 {
                // A read scope may otherwise step over the intended reusable
                // checkpoint. End the group at an existing compute boundary;
                // the next group still reuses reads across its remaining rows.
                passes = PrefillSchedule.preservingCheckpoint(passes, from: i,
                    checkpoint: model.optimizations.prefixCheckpointTokens)
            }
            model.smallPrefillSweep = PrefillSchedule.chunk(at: i, maxChunk: 256) < 256
            if model.smallPrefillSweep {
                model.stableSmallPrefillRouting = true
                model.stableSmallPrefillAttention = true
                model.stableSmallPrefillProjections = true
                model.alignSmallReferenceDispatch = true
                stats.contextArithmetic = "reference-256-v1"
                // Larger or odd earlier passes need not end at an absolute
                // multiple of 256. This phase's first missing row is its
                // reference origin, including when it starts from a cache hit.
                if smallReferenceStart == nil { smallReferenceStart = i }
                model.smallPrefillReferenceStart = smallReferenceStart!
                let count = ContextWorkspace.boundedSmallPass(requested: passes.first ?? 0, at: i,
                    referenceStart: model.smallPrefillReferenceStart, referenceEnd: promptIds.count)
                passes = count > 0 ? [count] : []
            }
            let hi = i + passes.reduce(0, +)
            do {
                var at = i, workspace = 0
                for pass in passes {
                    at += pass
                    workspace = max(workspace, ContextWorkspace.prefillBytes(pass: pass, context: at,
                        attentionHeads: model.cfg.numAttentionHeads,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: promptIds.count,
                        minimumProjectionRows: model.smallPrefillSweep && model.stableSmallPrefillProjections ? 256 : 0,
                        padSmallQueries: model.smallPrefillSweep && model.stableSmallPrefillAttention))
                }
                workspace = ContextBytes.sum(workspace, ContextBytes.product(max(0, hi - i - (passes.max() ?? 0)), 32_768))
                try checkAllocation(end: hi, draftEnd: mtpHead != nil ? max(0, hi - 1) : nil,
                    workspaceBytes: workspace, phase: "prefill pass")
            } catch { cancelledPrefill = true; continue }
            guard hi > i else {
                request?.fail(RequestFailure(.contextLengthExceeded, "no bounded prefill pass fits the remaining model context"))
                cancelledPrefill = true; continue
            }
            // Only the last pass warms the pool with the prompt's hot experts
            // (sweep admission); no other pass may evict what decode was using.
            model.pool.admitOnSweep = hi == promptIds.count
            let chunk = Array(promptIds[i ..< hi])
            let chunkVision = visionRuns.compactMap { $0.clipped(to: i, hi) }
            do {
            if model.optimizations.readScopeEnabled, passes.count > 1 {
                let result = try model.consumeReadScopeChecked(chunk, passes: passes, state: state,
                    vision: chunkVision, head: mtpHead, final: hi == promptIds.count,
                    shouldContinue: canContinue)
                if !result.committed {
                    stats.abortedReadScopes += 1
                    cancelledPrefill = true
                    continue
                }
                if let value = result.logits { logits = value }
            } else if let head = mtpHead {
                let (mixed, multi) = try model.hiddenStatesWithMultiChecked(chunk, state: state, vision: chunkVision)
                state.lastMulti = try head.consumeChecked(
                    chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                    resident: model.resident, rope: model.rope, state: state.mtp!,
                    vision: chunkVision, compactRetainedRow: model.optimizations.compactMTPRow)
                if hi == promptIds.count {
                    logits = model.lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...])
                    eval(logits)
                } else if !model.optimizations.demandedPrefillOutput {
                    eval(mixed)
                }
            } else if hi == promptIds.count {
                logits = try model.lastLogitsChecked(chunk, state: state, vision: chunkVision)
                eval(logits)
            } else if model.optimizations.demandedPrefillOutput {
                try model.consumePromptChecked(chunk, state: state, vision: chunkVision)
            } else {
                let h = try model.hiddenStatesChecked(chunk, state: state, vision: chunkVision)
                eval(h)
            }
            try request?.check(phase: "prefill commit")
            } catch {
                discardFailedState(error)
                if model.optimizations.readScopeEnabled, passes.count > 1 { stats.abortedReadScopes += 1 }
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.prefillIOSeconds = model.pool.ioSeconds
                stats.prefillScatterSeconds = model.pool.scatterSeconds
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                stats.sampledFootprint = footprint?.finish()
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                return finish([])
            }
            stats.prefillPasses.append(chunk.count)
            stats.prefillComputePasses.append(contentsOf: passes)
            var keyEnd = i
            for pass in passes {
                keyEnd += pass
                stats.prefillComputeQueryRows.append(model.smallPrefillSweep && model.stableSmallPrefillAttention
                    ? ContextWorkspace.queryRows(pass: pass, context: keyEnd,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: model.smallPrefillReferenceEnd) : pass)
                stats.prefillComputeKeyExtents.append(model.smallPrefillSweep && model.stableSmallPrefillAttention
                    ? ContextWorkspace.keyExtent(pass: pass, context: keyEnd,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: model.smallPrefillReferenceEnd) : keyEnd)
            }
            i = hi
            if let cache, i == model.optimizations.prefixCheckpointTokens,
               reused < i, i < promptIds.count {
                // Only an existing whole-stack commit is eligible. Do not
                // split/rebatch a pass merely to manufacture this boundary.
                do {
                    let retained = try cache.storeReusableCheckpoint(state: state,
                        tokens: Array(promptIds.prefix(i)), images: images,
                        reserveTokens: promptIds.count + params.maxTokens,
                        reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                            mtp: mtpHead != nil))
                    if retained { stats.prefixCheckpointStores += 1 }
                    else { stats.prefixCheckpointRefusals += 1 }
                } catch {
                    // Optional retention must not publish an invalid state or
                    // fail an otherwise valid forward. The miss stays visible.
                    stats.prefixCheckpointErrors += 1
                }
            }
            progress(i - reused, RuntimeClock.seconds(since: t0))
        }
        if reused < promptIds.count, let cache, let completeKey {
            // Reuse the actual complete prefill boundary, without splitting
            // or replaying a pass. State alone cannot supply the first token;
            // retain its compact raw logits too, before any sampling mutation.
            do {
                // A strict-prefix hit can have been produced without a draft
                // state. That request deliberately finishes plain; stamp the
                // mode actually used, so a later MTP request rebuilds its head.
                let producedKey = PromptCheckpointKey(model: completeKey.model,
                    optimizations: completeKey.optimizations, prefillChunk: completeKey.prefillChunk,
                    mtp: mtpHead != nil, contextArithmetic: completeKey.contextArithmetic)
                let retained = try cache.storeCompletePrompt(state: state, tokens: promptIds, images: images,
                    reserveTokens: promptIds.count + params.maxTokens,
                    reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                        mtp: mtpHead != nil), logits: logits, vocabularySize: model.cfg.vocabSize, key: producedKey)
                if retained { stats.completePromptStores += 1 }
                else { stats.prefixCheckpointRefusals += 1 }
            } catch { stats.prefixCheckpointErrors += 1 }
        }
        MLX.Memory.cacheLimit = savedCacheLimit
        model.pool.admitOnSweep = false
        // The new projection shape applies only while consuming missing
        // prompt rows. Ordinary decode and speculative verification retain
        // their established arithmetic even after a long-context prefill.
        model.smallPrefillSweep = false
        stats.prefillTokens = promptIds.count - reused
        stats.prefillSeconds = RuntimeClock.seconds(since: t0)
        stats.prefillIOSeconds = model.pool.ioSeconds
        stats.prefillScatterSeconds = model.pool.scatterSeconds
        stats.prefillRecords = model.pool.recordsFetched
        stats.prefillLocalVictims = model.pool.floorLocalVictims
        stats.prefillSlotSliceBatches = model.pool.slotSliceBatches
        stats.prefillSlotWordBatches = model.pool.slotWordBatches
        stats.prefillSlotCPUBatches = model.pool.slotCPUBatches
        stats.prefillMLXActiveBytes = MLX.Memory.activeMemory
        stats.prefillMLXCacheBytes = MLX.Memory.cacheMemory
        stats.prefillPhysicalFootprintBytes = ProcessMemory.residentBytes()
        stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.prefillGPUWaitSeconds = model.pool.sweepWaitSeconds
        stats.prefillRowSortSeconds = model.pool.sweepSortSeconds
        if Self.sweepTrace {
            let line = String(
                format: "sweep trace: io %.2fs, gpu wait %.2fs, row sort %.2fs, pool copies %.2fs, "
                    + "mlx peak %.2f GB, mlx cache %.2f GB\n",
                model.pool.ioSeconds, model.pool.sweepWaitSeconds, model.pool.sweepSortSeconds,
                model.pool.scatterSeconds, Double(MLX.Memory.peakMemory) / 1e9,
                Double(MLX.Memory.cacheMemory) / 1e9)
            FileHandle.standardError.write(line.data(using: .utf8)!)
        }
        model.pool.resetStats()
        model.ngram.resetStats()

        // ---- decode
        var out: [Int] = []
        var generated = Set<Int>()
        var reason = "length"
        // Exactly the ids `state` has consumed, tracked rather than inferred:
        // a token is sampled before it is fed, so both break paths below leave
        // the last one unconsumed and it must not be claimed.
        var consumed = promptIds
        t0 = RuntimeClock.now()
        var firstToken: Double?
        var callbackSeconds = 0.0
        var lastTokenAt: UInt64?
        var interTokenSeconds: [Double] = []
        let observedToken: (Int) -> Bool = { tok in
            request?.sampledFirstToken()
            if firstToken == nil { firstToken = RuntimeClock.seconds(since: requestStart) }
            if let previous = lastTokenAt { interTokenSeconds.append(RuntimeClock.seconds(since: previous)) }
            lastTokenAt = RuntimeClock.now()
            let start = RuntimeClock.now()
            let result = onToken?(tok) ?? true
            callbackSeconds += RuntimeClock.seconds(since: start)
            return result
        }
        do {
        if let head = mtpHead, speculationEnabled, let mtpState = state.mtp {
            try speculativeDecode(
                head: head, mtpState: mtpState, state: state, logits: logits,
                params: params, eosIds: eosIds, shouldContinue: canContinue,
                contextLimit: request?.configuration.maxContextTokens ?? ContextPolicy.modelLimit,
                checkAllocation: { main, draft, workspace, phase in
                    try checkAllocation(end: main, draftEnd: draft, workspaceBytes: workspace, phase: phase)
                },
                onToken: observedToken, out: &out, generated: &generated,
                reason: &reason, consumed: &consumed, stats: &stats)
        } else {
            state.invalidateMTP()
            for _ in 0 ..< max(0, params.maxTokens) {
                if !canContinue() { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(logits, params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                // The callback stops the run for a stop sequence or a gone client.
                if !observedToken(tok) { reason = "stop"; break }
                if model.optimizations.skipUnusedFinalForward, out.count == params.maxTokens { break }
                try checkAllocation(end: state.tokenCount + 1, workspaceBytes: 1_300_000, phase: "decode cache growth")
                logits = try model.lastLogitsChecked([tok], state: state)
                stats.decodeForwardPasses += 1
                stats.decodeModelTokens += 1
                consumed.append(tok)
                eval(logits)
            }
        }
        } catch {
            discardFailedState(error)
            reason = "error"
        }
        if stats.runtimeError == nil, request?.mayRetainState != false { cache?.store(state: state, tokens: consumed, images: images) }
        stats.finishReason = reason
        stats.decodeTokens = out.count
        stats.decodeSeconds = RuntimeClock.seconds(since: t0)
        stats.firstTokenSeconds = firstToken
        stats.tokenCallbackSeconds = callbackSeconds
        stats.interTokenSeconds = interTokenSeconds
        stats.expertHitRate = model.pool.hitRate
        // The pool's counters were reset after prefill, so these cover decode
        // only.
        stats.decodeIOSeconds = model.pool.ioSeconds
        stats.decodeScatterSeconds = model.pool.scatterSeconds
        stats.decodeRecords = model.pool.recordsFetched
        stats.decodeLocalVictims = model.pool.floorLocalVictims
        stats.decodeSlotSliceBatches = model.pool.slotSliceBatches
        stats.decodeSlotSliceRuns = model.pool.slotSliceRuns
        stats.decodeSlotScatterBatches = model.pool.slotScatterBatches
        stats.decodeSlotWordBatches = model.pool.slotWordBatches
        stats.decodeSlotWordBuffers = model.pool.slotWordBuffers
        stats.decodeSlotCPUBatches = model.pool.slotCPUBatches
        stats.decodeReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.ngramRowHits = model.ngram.rowHits
        stats.ngramRowMisses = model.ngram.rowMisses
        stats.ngramLookaheadRows = model.ngram.lookaheadRowsConsumed
        stats.ngramLookaheadDiscarded = model.ngram.lookaheadTicketsDiscarded
        stats.ngramLookaheadWaitSeconds = model.ngram.lookaheadWaitSeconds
        stats.ngramPrefetchSeconds = model.ngram.prefetchSeconds
        stats.allocatedSequenceBytes = state.allocatedSequenceBytes
        stats.ngramCachedRows = model.ngram.cachedRowCount
        stats.cachedRouterBytes = model.cachedRouterBytes
        stats.ngramCachePayloadBytes = model.ngram.cachedPayloadBytes
        stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
        stats.peakMemoryGB = ProcessMemory.peakResidentGB
        stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
        stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
        stats.mlxActiveEndBytes = MLX.Memory.activeMemory
        stats.mlxCacheEndBytes = MLX.Memory.cacheMemory
        stats.sampledFootprint = footprint?.finish()
        stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
        stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
        stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
        return finish(out)
    }
}

extension Generator {
    /// Hard cap bounds recording memory even if an embedding client assigns
    /// an arbitrary public depth. A terminal target output needs no draft.
    public static func effectiveDraftDepth(requested: Int, remainingOutputs: Int, bounded: Bool) -> Int {
        let depth = min(16, max(1, requested))
        return bounded ? min(depth, max(0, remainingOutputs - (remainingOutputs > 0 ? 1 : 0))) : depth
    }

    /// Self-speculative decode with the MTP draft head. One round:
    ///
    ///   1. draft `draftDepth` tokens greedily by chaining the head
    ///      (each step fuses the previous multi stream with the previous
    ///      token's embedding — "scheme A"),
    ///   2. verify them in one batched main-model pass, whose measured cost
    ///      grows with the number of positions,
    ///   3. sample sequentially from the verified logits with the plain
    ///      loop's exact semantics — same rng draw order, same presence
    ///      penalty evolution, drawing ONLY for tokens the plain loop would
    ///      have sampled, so the sampler stream never desyncs,
    ///   4. reconcile: the verify pass consumed all k+1 tokens; if some were
    ///      rejected, roll the state back (zero-copy checkpoint — recurrent
    ///      arrays are replaced, never mutated; KV rolls back by offset).
    ///      Recorded target states avoid replaying accepted target tokens;
    ///      only draft entries with provisional hidden inputs need rebuilding.
    ///
    /// Every emitted token's logits still come from the main model, so this
    /// changes WHAT computes the logits (batched passes instead of
    /// single-token passes), not the sampling rule. Batch shape changes move
    /// logits within the same floating-point envelope as prefill re-chunking
    /// (see MEASUREMENTS on the prefix cache); `mtp-check` gates on that.
    func speculativeDecode(
        head: MTPHead, mtpState: MTPState, state: Qwen4ExpModel.State,
        logits: MLXArray, params: SampleParams, eosIds: Set<Int>,
        shouldContinue: (() -> Bool)?, contextLimit: Int,
        checkAllocation: (Int, Int?, Int, String) throws -> Void, onToken: ((Int) -> Bool)?,
        out: inout [Int], generated: inout Set<Int>, reason: inout String,
        consumed: inout [Int], stats: inout GenStats
    ) throws {
        // The first token comes off the prefill logits exactly like the
        // plain loop's first iteration.
        var pending: Int? = nil
        var policy = model.optimizations.adaptiveSpeculation ? AdaptiveSpeculationPolicy(maximumDepth: draftDepth) : nil
        if params.maxTokens > 0 {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; return }
            let sampleStart = RuntimeClock.now()
            let tok = sample(logits, params: params, generated: generated)
            stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
            if eosIds.contains(tok) { reason = "stop"; return }
            out.append(tok)
            generated.insert(tok)
            if let cb = onToken, !cb(tok) { reason = "stop"; return }
            pending = tok
        }

        while let p = pending, out.count < params.maxTokens {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
            let action = policy?.action(contextTokens: state.tokenCount)
            if action == .plain {
                stats.adaptiveDraftDepths.append(-1)
                stats.adaptiveDisabledAtOutput = out.count
                // A disabled head cannot be resumed from a stale cache. The
                // already-emitted pending token is consumed exactly once.
                state.invalidateMTP()
                var tokenToConsume = p
                while out.count < params.maxTokens {
                    if shouldContinue?() == false { reason = "stop"; break }
                    try checkAllocation(state.tokenCount + 1, nil, 1_300_000, "plain decode cache growth")
                    let nextLogits = try model.lastLogitsChecked([tokenToConsume], state: state)
                    consumed.append(tokenToConsume)
                    eval(nextLogits)
                    stats.decodeForwardPasses += 1; stats.decodeModelTokens += 1
                    let sampleStart = RuntimeClock.now()
                    let token = sample(nextLogits, params: params, generated: generated)
                    stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                    if eosIds.contains(token) { reason = "stop"; break }
                    out.append(token); generated.insert(token)
                    stats.adaptivePlainTokens += 1
                    if onToken?(token) == false { reason = "stop"; break }
                    tokenToConsume = token
                }
                return
            }
            let emittedBefore = out.count, sampleBefore = stats.sampleSeconds
            let draftBefore = stats.draftSeconds, verifyBefore = stats.verifySeconds
            let reconcileBefore = stats.reconciliationSeconds
            let ck = state.checkpoint()

            // ---- draft (greedy chain; provisional MTP cache entries)
            var drafts: [Int] = []
            let draftStart = RuntimeClock.now()
            var dMulti = state.lastMulti!
            var dTok = p
            let requestedDepth: Int
            if case .draft(let depth) = action { requestedDepth = depth }
            else { requestedDepth = draftDepth }
            // Optional tail shortening changes verification batch shapes.
            // A seeded-sampling counterexample requires the original schedule
            // for sampled requests. The context limit below remains mandatory.
            let boundedTail = model.optimizations.boundedDraftTail && params.temperature <= 0
            let requestedAvailable = action == .calibrate ? 0 : Self.effectiveDraftDepth(requested: requestedDepth,
                remainingOutputs: params.maxTokens - out.count,
                bounded: boundedTail || policy != nil)
            // Provisional verification must fit the same total context as
            // committed tokens, even when legacy draft-tail bounding is off.
            let availableDepth = ContextPolicy.maximumDraftDepth(requested: requestedAvailable,
                at: state.tokenCount, limit: contextLimit)
            if policy != nil { stats.adaptiveDraftDepths.append(availableDepth) }
            var draftCancelled = false
            for _ in 0 ..< availableDepth {
                if shouldContinue?() == false { draftCancelled = true; break }
                try checkAllocation(state.tokenCount, mtpState.offset + 1, 1_300_000, "draft cache growth")
                let e = try model.resident.embedChecked([dTok], shape: [1, 1]).asType(.bfloat16)
                let (s, m) = head(embedded: e, hiddenMulti: dMulti, rope: model.rope, state: mtpState)
                let dl = model.lmHead(s)
                dTok = argMax(dl.reshaped([-1]).asType(.float32)).item(Int.self)
                drafts.append(dTok)
                dMulti = m
            }
            stats.draftedTokens += drafts.count
            stats.draftSeconds += RuntimeClock.seconds(since: draftStart)
            if draftCancelled || shouldContinue?() == false {
                try state.restoreChecked(ck); state.setRecording(false)
                reason = "stop"; break
            }

            // ---- one batched verify pass over pending + drafts, recording
            // the recurrent state after every position so a rejection can
            // roll back to the kept prefix without re-running it.
            let verifyIds = [p] + drafts
            let verifyEnd = state.tokenCount + verifyIds.count
            try checkAllocation(verifyEnd, mtpState.offset,
                ContextWorkspace.prefillBytes(pass: verifyIds.count, context: verifyEnd), "speculative verification")
            let verifyStart = RuntimeClock.now()
            state.setRecording(true)
            let (vLogits, vMulti) = try model.allLogitsWithMultiChecked(verifyIds, state: state)
            eval(vLogits, vMulti)
            stats.verifyPasses += 1
            stats.decodeForwardPasses += 1
            stats.decodeModelTokens += verifyIds.count
            stats.verifySeconds += RuntimeClock.seconds(since: verifyStart)

            // ---- sequential acceptance
            var good = 0  // accepted drafts == generation tokens consumed beyond p
            var nextPending: Int? = nil
            for i in 0 ... drafts.count {
                if out.count >= params.maxTokens { break }  // reason stays "length"
                if shouldContinue?() == false { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(
                    vLogits[0..., i ..< (i + 1), 0...], params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                if let cb = onToken, !cb(tok) { reason = "stop"; break }
                if i < drafts.count && tok == drafts[i] {
                    good += 1
                    continue
                }
                nextPending = tok  // the rejection correction, or the bonus token
                break
            }
            stats.acceptedDrafts += good

            // ---- reconcile the state with what was actually kept: roll the
            // recurrent caches back to the recorded state at the last kept
            // position, trim the attention caches, and slice the pass's own
            // multi stream (causal, so its first keep.count positions are
            // exactly the kept tokens' stream). No re-run.
            let reconcileStart = RuntimeClock.now()
            let keep = [p] + Array(drafts[0 ..< good])
            try checkAllocation(ck.tokenCount + keep.count, ck.mtpOffset + keep.count,
                ContextBytes.product(keep.count, 1_300_000), "draft reconciliation")
            try state.rollbackChecked(
                keeping: keep.count, of: verifyIds, from: ck, ngramWindow: model.cfg.ngramSize - 1)
            let passMulti = keep.count == verifyIds.count
                ? vMulti : vMulti[0..., 0 ..< keep.count, 0...]
            if model.optimizations.reuseFirstMTPEntry && !drafts.isEmpty {
                // The first draft-cache entry uses the true checkpoint multi
                // and pending token. Later entries used provisional multis.
                mtpState.trim(to: ck.mtpOffset + 1)
                let first = passMulti[0..., 0 ..< 1, 0...]
                state.lastMulti = model.optimizations.compactMTPRow ? contiguous(first) : first
                eval(state.lastMulti!)
                stats.reusedHeadTokens += 1
                if keep.count > 1 {
                    state.lastMulti = try head.consumeChecked(chunk: Array(keep.dropFirst()),
                        chunkMulti: passMulti[0..., 1 ..< keep.count, 0...], prevMulti: state.lastMulti,
                        resident: model.resident, rope: model.rope, state: mtpState,
                        compactRetainedRow: model.optimizations.compactMTPRow)
                    stats.reconciledHeadTokens += keep.count - 1
                }
            } else {
                mtpState.trim(to: ck.mtpOffset)
                state.lastMulti = try head.consumeChecked(
                    chunk: keep, chunkMulti: passMulti, prevMulti: ck.lastMulti,
                    resident: model.resident, rope: model.rope, state: mtpState,
                    compactRetainedRow: model.optimizations.compactMTPRow)
                stats.reconciledHeadTokens += keep.count
            }
            consumed.append(contentsOf: keep)
            stats.reconciliationSeconds += RuntimeClock.seconds(since: reconcileStart)
            // The draft cache holds one entry per consumed token except the
            // first. A drift here silently degrades every later draft, so
            // fail loud instead.
            precondition(
                mtpState.offset == state.tokenCount - 1,
                "mtp cache misaligned: \(mtpState.offset) entries at \(state.tokenCount) tokens")
            pending = nextPending
            if reason == "stop" { break }
            if policy != nil, out.count > emittedBefore {
                let targetCost = stats.verifySeconds - verifyBefore + stats.sampleSeconds - sampleBefore
                if action == .calibrate {
                    policy?.observePlain(seconds: adaptiveCostOverride?(targetCost, false) ?? targetCost,
                        contextTokens: state.tokenCount)
                } else if !drafts.isEmpty {
                    let totalCost = targetCost + stats.draftSeconds - draftBefore + stats.reconciliationSeconds - reconcileBefore
                    policy?.observeDraft(seconds: adaptiveCostOverride?(totalCost, true) ?? totalCost,
                        emitted: out.count - emittedBefore, drafted: drafts.count, accepted: good)
                }
            }
        }
    }
}

/// Prefill chunking. Overridable so the size can be measured and so a small
/// machine can trade prefill speed for transient memory.
public enum PrefillTuning {
    public static var chunk: Int {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"],
            let n = Int(s), n > 0
        {
            return min(n, 4096)
        }
        return 256
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/scope-checkpoint-v193/after/Sources/SlotstreamDiagnostics/Diagnostics.swift` — 8737 bytes; SHA-256 `98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03`.

````text
// Diagnostics: the checks that used to live inside CLI subcommands.
//
// Each one is a function returning a CheckReport, so the same body serves the
// subcommand a user runs, the catalogue CI runs, and a host app that wants to
// verify its own installation. Nothing here prints.

import Foundation
import Slotstream

public enum Diagnostics {
    /// The prefill schedule's four properties, which the planner, `doctor`'s
    /// wait estimates and the over-length 400 all depend on:
    ///
    /// - **bounded**: a pass never attends over more query-by-key product than
    ///   any prefill measurement covered;
    /// - **floored**: it never shrinks below the smallest measured pass;
    /// - **complete**: the passes sum to the prompt, so no token is skipped;
    /// - **monotone**: reading more tokens never takes less time.
    ///
    /// This is the arithmetic behind every context number a user is shown, and
    /// it needs neither weights nor a GPU.
    public static func prefillSchedule() -> CheckReport {
        var c = CheckBuilder("prefill-schedule")
        let chunks = [256, 512, 1024, 2048, 4096]
        let lengths = [1, 255, 256, 1000, 2048, 8192, 16384, 32768]

        var boundedEverywhere = true
        var flooredEverywhere = true
        var completeEverywhere = true
        var worstProduct = 0

        for maxChunk in chunks {
            for tokens in lengths {
                var position = 0
                for pass in PrefillSchedule.passes(tokens: tokens, maxChunk: maxChunk) {
                    // The bound is on the pass the schedule chose, not on the
                    // final partial pass, which is only ever smaller.
                    let full = PrefillSchedule.chunk(at: position, maxChunk: maxChunk)
                    let product = full * (position + full)
                    worstProduct = max(worstProduct, product)
                    if product > PrefillSchedule.measuredQueryKeyProduct
                    {
                        boundedEverywhere = false
                    }
                    if full < PrefillSchedule.minChunk { flooredEverywhere = false }
                    position += pass
                }
                if position != tokens { completeEverywhere = false }
            }
        }

        c.expect(
            "a pass never exceeds the measured query-by-key product",
            boundedEverywhere,
            "worst product \(worstProduct) > \(PrefillSchedule.measuredQueryKeyProduct)")
        c.expect("a pass never falls below the measured floor", flooredEverywhere)
        c.expect("the passes sum to the prompt", completeEverywhere)

        // Monotone in prompt length, at every pass size.
        var monotone = true
        for maxChunk in chunks {
            var previous = -1.0
            for tokens in stride(from: 0, through: 32_768, by: 512) {
                let s = PrefillSchedule.estSeconds(tokens: tokens, maxChunk: maxChunk)
                if s < previous { monotone = false }
                previous = s
            }
        }
        c.expect("reading more tokens never takes less time", monotone)

        // The schedule shrinks as the context grows: this is the property that
        // keeps a long prompt's transient inside what was measured, and the
        // reason the never-measured 8192 pass is not a candidate.
        let early = PrefillSchedule.chunk(at: 0, maxChunk: 4096)
        let late = PrefillSchedule.chunk(at: 31_000, maxChunk: 4096)
        c.expect("the pass shrinks as the context grows", late < early, "\(early) -> \(late)")
        c.expect("the shrunken pass is still at the floor or above", late >= PrefillSchedule.minChunk)

        // An empty prompt runs no passes and costs nothing.
        c.equal("an empty prompt runs no passes", PrefillSchedule.passes(tokens: 0, maxChunk: 4096).count, 0)
        c.equal("an empty prompt costs no time", PrefillSchedule.estSeconds(tokens: 0, maxChunk: 4096), 0)
        c.equal("actual tail fits without a third pass",
                PrefillSchedule.passes(tokens: 7960, maxChunk: 4096, tailAware: true), [4096, 3864])
        c.equal("reference tail is preserved as the control",
                PrefillSchedule.passes(tokens: 7960, maxChunk: 4096), [4096, 2048, 1816])
        var tailsBounded = true
        for base in stride(from: 0, through: ContextPolicy.maxTokens - 1, by: 127) {
            for remaining in [1, 3, 255, 256, 257, 2047, 2048, 3864, 4095, 4096, 4097] {
                guard base + remaining <= ContextPolicy.maxTokens else { continue }
                for limit in [256, 1024, 4096] {
                    var position = base
                    let passes = PrefillSchedule.passes(tokens: remaining, from: base, maxChunk: limit, tailAware: true)
                    if passes.reduce(0, +) != remaining { tailsBounded = false }
                    for pass in passes {
                        if pass <= 0 || pass > limit || pass * (position + pass) > PrefillSchedule.measuredQueryKeyProduct { tailsBounded = false }
                        position += pass
                    }
                }
            }
        }
        c.expect("tail schedule covers reused offsets, boundaries and all supported context", tailsBounded)
        var scopesPreserveSchedule = true
        for tail in [false, true] {
            for base in [0, 255, 4096, 8016, 16384, 30000] {
                for length in [1, 255, 256, 1025, 7960, 8192] where base + length <= 32768 {
                    for chunk in [256, 1024, 4096] {
                        for scope in [1024, 4096, 8192] {
                            var passes: [Int] = [], pos = base
                            while pos < base + length {
                                let group = PrefillSchedule.scopePasses(remaining: base + length - pos,
                                    at: pos, maxChunk: chunk, maxScope: scope, tailAware: tail)
                                if group.isEmpty { scopesPreserveSchedule = false; break }
                                let total = group.reduce(0, +)
                                if group.count > 1 && total > scope { scopesPreserveSchedule = false }
                                passes += group; pos += total
                            }
                            if passes != PrefillSchedule.passes(tokens: length, from: base, maxChunk: chunk, tailAware: tail) {
                                scopesPreserveSchedule = false
                            }
                        }
                    }
                }
            }
        }
        c.expect("read scopes preserve every bounded compute pass", scopesPreserveSchedule)
        let checkpointScope = PrefillSchedule.scopePasses(remaining: 1280, at: 0,
            maxChunk: 256, maxScope: 1024, tailAware: false)
        c.equal("read-sharing group contains the existing checkpoint boundary", checkpointScope, [256, 256, 256, 256])
        c.equal("retention preserves that boundary without splitting compute", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 256), [256])
        c.equal("later boundary preserves all preceding compute passes", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 512), [256, 256])
        c.equal("interior token never rebatches a compute pass", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 255), checkpointScope)
        c.equal("a reused checkpoint does not shorten the next read scope", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 256, checkpoint: 256), checkpointScope)
        c.equal("disabled retention preserves the read scope", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 0), checkpointScope)
        c.equal("out-of-range checkpoint preserves the read scope", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: Int.max), checkpointScope)
        c.equal("zero remainder makes no pass", PrefillSchedule.next(remaining: 0, at: 32768, maxChunk: 4096, tailAware: true), 0)
        c.equal("out-of-model diagnostic position has no legal pass", PrefillSchedule.chunk(at: Int.max, maxChunk: Int.max), 0)

        // A prompt already held costs nothing more: this is the prefix cache's
        // promise, priced.
        c.equal(
            "a fully cached prompt runs no passes",
            PrefillSchedule.passes(tokens: 0, from: 8000, maxChunk: 4096).count, 0)

        c.measure("worst_query_key_product", Double(worstProduct))
        c.measure("chunk_at_0", Double(early))
        c.measure("chunk_at_31k", Double(late))
        return c.report()
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/scope-checkpoint-v193/after/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift` — 59604 bytes; SHA-256 `f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96`.

````text
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
        let cancelled = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: {
                if layer == model.runLayers - 1 { checksAfterLast += 1; return checksAfterLast < 3 }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel during second draft-head tile", !cancelled.committed && checksAfterLast == 3)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        c.expect("cancel restores valid draft prefix", candidate.hasValidMTP)
        equal(seedState, candidate, "image/MTP rollback")
        let result = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("retry commits scope", result.committed && result.logits != nil)
        c.expect("retry draft aligned", candidate.hasValidMTP)
        equal(reference, candidate, "image/MTP continuation")
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

````

Artifact `/tmp/slotstream-optimization-execution/elastic-drill-review-v191/claims.txt` — 42 bytes; SHA-256 `fe3d925baf376becf7b66c73e981a4688c820dabc7c3f557ec3424534754cc8c`.

````text
claims gate: 84 needle checks, 0 failures

````

Artifact `/tmp/slotstream-optimization-execution/elastic-drill-review-v191/projections.txt` — 46 bytes; SHA-256 `83fe301c977f1c76d548091ab0307b758135428d27fed9009a5588af78224c66`.

````text
MEASUREMENTS.md is current
PLAN.md is current

````

