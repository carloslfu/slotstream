---
type: run
id: 01m1vxve59enwsp9xzskqb7q50
created: 2026-09-06T17:56:54.569837+00:00
updated: 2026-09-06T17:57:41.562620+00:00
summary: 'Review context integration: legacy dispatch and per-buffer allocation ownership'
binary: none run here; context build13 HTTP receipt inspected separately
captured_at: 2026-09-06
command: git merge-file review; source and exact HTTP receipt verification
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Review context integration: legacy dispatch and per-buffer allocation ownership'
tool: source review and unapplied three-way staging
---
V175 reviews the independently developed context/accounting/controller component proposal without applying it to shared Sources. The extracted v2 has29files, preserves the public32768default/65536implementation cap and excludes the separate C07Model/Layer/router/projection numerical family. A three-way merge against the current shared checkout stages cleanly except for Generate's already integratedV168pin cleanup. The staged resolution keeps its single GPU join/unpin immediately after the nonempty guard, before new model-limit and memory-admission refusals. V170commands and V173shared overlay remain intact. The staged tree is UNAPPLIED/UNBUILT; it is not combined-source verification.

Source review caught the first v1 extraction's256→64dispatch change: public RuntimeAllocationPolicy allows odd256..4096values such as4095, whose halving could pass511→255 under the current cap. The context owner confirmed this and producedv2, retaining the original256floor whenever a256-row pass fits, including small direct assignments. The new floor regressions were initially unbuilt. The owner then reportedbuild13compiled; eight older assertions needed to reflect the intended legacy effective floor. That failed T0 run is preserved in the context task, and its updated tests remain separately identified. The full-snapshot expanded HTTP report is independently inspected here:835actual passing assertions, manifestSHA13d100c6c94aa4904808424f518a4aab777f75ba3ca47ca177568e4f3f4e4c90, stdoutSHAcb00c737d1399c61d29239b009ef57ec45fce21be2815a025be0b268b25d0bb4. It covers the corrected pending-pressure ticket enforcement and actual retained-ID fixture; timings/capacity are excluded for permitted HF overlap. It does not qualify the extracted/merged subset.

A second source-level review found an allocation-proof gap: Generate subtracted aggregate main/draft/indexer capacity from aggregate demand. Spare capacity in one buffer cannot authorize a different buffer's growth after MTP transitions or rollback. The context owner confirmed the gap and is replacing it with per-buffer accounting that charges the full new allocation while old GPU readers remain, plus the actual pending/draft verification span and each draft-cache boundary. These fixes have no new native result yet and are not present in this stagedv2. They must be incorporated and independently verified before activation. The earlier835HTTPpass does not cover them. No runtime failure beyond the owner's separately preserved114-assertion HTTP counterexample is invented from this source review.

The firstC07projection-shape witness reportedly passes1605criteria in isolatedbuild12; broader shapes/offsets and capacity still require qualification. No public cap or numerical family is adopted. The overall optimization task remains model/build/performance-held while the owner resumes verified HF download and context completes its bounded correctness sequence. V159/V160vision,V170scope, final combination/soaks/full acceptance remain open. This review follows actual source and exact reports, not architectural documentation.


Artifact `/tmp/slotstream-context-implementation-20260906/component-proposal-v2/README.md` — 1938 bytes, SHA-256 `e258dfaea82c33c05ed2c083a25490ec50161f0d40b74bf928e4693d5c4c8f60`.

````text
# Review proposal only — context controls through the existing 65536 cap

This is the source delta from the original dirty baseline to build 12's
accounting/admission/vision/controller implementation, with all opt-in C07
Model/Layer/RouterProjection/QLinear code and numerical diagnostics removed.
Model.swift includes only the pure shared sequence-capacity helper. Generate
has no reference to an opt-in numerical family, and reports its actual key
end. Public default/implementation caps remain unchanged. The explicit
context-check qualification seam is diagnostic only; its larger capacity
remains unqualified and must not be advertised as supported.

A prospective, unbuilt correction in Context.swift preserves the original
256-row floor whenever it fits. This closes the odd-override path (4095 can
otherwise halve to 255 inside the existing 65536 cap). Associated pure
geometry and override regressions are included from the current source.
These three files extend the frozen build12 source and await verification.

The before/after trees and per-file SHA-256 manifest permit a real three-way
merge with the current shared checkout. Preserve V168's already applied pin
cleanup and V173/current optimization changes. Do not overwrite whole shared
files. No source, commit or branch in the shared checkout was mutated here.

Evidence: build 11 T0 33 groups/21169, CLI 95 and planner 64 pass; prior build5
HTTP 462 pass. Expanded build11 HTTP found 112 pressure-ticket failures and
two incorrect warm-prefix fixture assumptions. Build12 compiles the corrected
unconditional Engine ticket checks, exact retained-ID fixture, earlier HTTP
request clock, and bounded/cumulative CLI input preparation. The corrected
HTTP suite has not yet run. This extracted subset itself has not been
compiled; it is ready for review and identified revalidation, not a qualified
release. No 262144 capacity run or numerical qualification is implied.

````

Artifact `/tmp/slotstream-context-implementation-20260906/component-proposal-v2/manifest.json` — 6204 bytes, SHA-256 `07c4a69d21041dae3cb4e6aef3ccd891c28f16fcb4081490a39e5aba23fa55ef`.

````text
{
  "Sources/Slotstream/Checkpoint.swift": {
    "before_sha256": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "after_sha256": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353"
  },
  "Sources/Slotstream/Context.swift": {
    "before_sha256": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
    "after_sha256": "56e95af0cf3fbfd7c18174ac8b22167f9a8938b499db1e350186db5a79364a3a"
  },
  "Sources/Slotstream/ContextFeasibility.swift": {
    "before_sha256": null,
    "after_sha256": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664"
  },
  "Sources/Slotstream/ContextMemory.swift": {
    "before_sha256": null,
    "after_sha256": "a1ca82edc14687685225d1d147359bb43f0b8f8fb38638aeeaeaab2c609a48a8"
  },
  "Sources/Slotstream/Engine.swift": {
    "before_sha256": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
    "after_sha256": "8683f7785cfd88e57482ff3e1c4d3da86f7751b8022b274740538c9450fb947e"
  },
  "Sources/Slotstream/Generate.swift": {
    "before_sha256": "fb100321a64b54df96bca8c3292db28c7b45ca53eb74e1ee0c6e995dc1416a8d",
    "after_sha256": "357a5cc5ddc90f9114ad632a8ea782d0bd3f0a95a3c72d88cd41dd34d3dfd061"
  },
  "Sources/Slotstream/Governor.swift": {
    "before_sha256": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
    "after_sha256": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129"
  },
  "Sources/Slotstream/Model.swift": {
    "before_sha256": "6b3173d7023635061e52da1ee4a8b56173b6b7dce917ee7b4c6792a1d9aad115",
    "after_sha256": "3c1a82b11d0c31ab0cdc62487ec3d2cea230642cbb0cc3c6613003b5f8c17cbd"
  },
  "Sources/Slotstream/Plan.swift": {
    "before_sha256": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
    "after_sha256": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b"
  },
  "Sources/Slotstream/PrefixCache.swift": {
    "before_sha256": "fe569ca738f9d33b9445e3c0a29acde0a4c2987f54036ea0b9d09442471a3704",
    "after_sha256": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8"
  },
  "Sources/Slotstream/PressureBoundary.swift": {
    "before_sha256": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
    "after_sha256": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d"
  },
  "Sources/Slotstream/RequestControl.swift": {
    "before_sha256": null,
    "after_sha256": "71af7ac9f1ca6d274e08f2246b1ed5e3e64cd563de948d5ca03ce37adf7cdd58"
  },
  "Sources/Slotstream/Server.swift": {
    "before_sha256": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
    "after_sha256": "818b9deb21ab1751b2cbcafb0cf73aea705a48bf9a4da0645b0a75a11a584222"
  },
  "Sources/Slotstream/Vision.swift": {
    "before_sha256": "4f9c17f55ca450e88317f6002cfab3e834711e0444b9ee9d8ee6deaff2673fbb",
    "after_sha256": "9b8d5f8b04f92c79076bc925e58c8e29fe238b1429aca45292eaeb91df545b1f"
  },
  "Sources/Slotstream/VisionAttention.swift": {
    "before_sha256": "5bf65f84e71f9befff782516fdd3943e88155dd35aa0c9e6a03a778421c280f2",
    "after_sha256": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5"
  },
  "Sources/Slotstream/VisionPrompt.swift": {
    "before_sha256": "d0aa383cefa9ea52ab7af32d41eb6741bc846830204dc33694de873f4b63b7a6",
    "after_sha256": "0697edf386f5ee0e6b3ddd616dfe392da247297f87a80ff656a657a8535518b4"
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": {
    "before_sha256": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
    "after_sha256": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57"
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": {
    "before_sha256": "63a1ab81fe1bd5578111dfc0bdf657602ebe4c4202b7dc1ebb818c0f9ef7b226",
    "after_sha256": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2"
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": {
    "before_sha256": null,
    "after_sha256": "ee375f4bae83299fcd2d76cd65f3d8d98f7c542fc8b6c7d7157d802fa5d0c6ee"
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": {
    "before_sha256": null,
    "after_sha256": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747"
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": {
    "before_sha256": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
    "after_sha256": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af"
  },
  "Sources/SlotstreamDiagnostics/Diagnostics.swift": {
    "before_sha256": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "after_sha256": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8"
  },
  "Sources/SlotstreamTestKit/T0Checks.swift": {
    "before_sha256": "07a7f37fa122b47f360c542a9a277f98de20a2ba8855cd0952937ff64152827f",
    "after_sha256": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3"
  },
  "Sources/slotstream-cli/ContextCommands.swift": {
    "before_sha256": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
    "after_sha256": "43733815ffd825288fc1d8cd64196386dec5d5cd46393d7e27e64f50cc9dc261"
  },
  "Sources/slotstream-cli/OptimizationCommands.swift": {
    "before_sha256": "5c1b9570a4836d01312bff2c8af8c565df12598e79e724831fa20fafc6aa2eef",
    "after_sha256": "b3f798e321b0909a831cbe9d4f335b5fafa146eb897bfdf4074ace4571e6cf90"
  },
  "Sources/slotstream-cli/main.swift": {
    "before_sha256": "a4927ad15da17ede7552a8be618cc885b1c2b82a0ccc48f462f0ae1045f1b20d",
    "after_sha256": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36"
  },
  "Tools/context_gates.py": {
    "before_sha256": null,
    "after_sha256": "27461549d21c8e1815a8eea59bb1d3a021973c7dd4e02c63929cbfab8048d09a"
  },
  "Tools/fixtures/context-default-v1.json": {
    "before_sha256": null,
    "after_sha256": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558"
  },
  "Tools/planner_gates.sh": {
    "before_sha256": "8d4e902ea6d2891d83a35ba224f1b0c229d79c4dd061509fbd594efaf6cda23a",
    "after_sha256": "ded911c355af3502f1df27387653d8381da9697150b7560880f1e9e3acd14e40"
  }
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/component-proposal-v2/component.patch` — 245039 bytes, SHA-256 `c16b1661fe6ba52450b8a67472cc503988680086a68cc835bb514fac60168138`.

````text
--- a/Sources/Slotstream/Checkpoint.swift
+++ b/Sources/Slotstream/Checkpoint.swift
@@ -20,6 +20,7 @@
     public var numAttentionHeads = 24
     public var numKVHeads = 2
     public var headDim = 256
+    public var maxPositionEmbeddings = ContextPolicy.modelLimit
     public var vocabSize = 248_320
     public var rmsNormEps: Float = 1e-6
     public var fullAttentionInterval = 4
@@ -94,6 +95,7 @@
         c.numAttentionHeads = i("num_attention_heads", c.numAttentionHeads)
         c.numKVHeads = i("num_key_value_heads", c.numKVHeads)
         c.headDim = i("head_dim", c.headDim)
+        c.maxPositionEmbeddings = i("max_position_embeddings", c.maxPositionEmbeddings)
         c.vocabSize = i("vocab_size", c.vocabSize)
         c.rmsNormEps = f("rms_norm_eps", c.rmsNormEps)
         c.fullAttentionInterval = i("full_attention_interval", c.fullAttentionInterval)
@@ -171,7 +173,7 @@
         func bad(_ detail: String) throws -> Never {
             throw ModelError("unsupported or invalid text_config (\(detail)) — check --model")
         }
-        guard hiddenSize == 2560, numLayers == 48,
+        guard hiddenSize == 2560, numLayers == 48, maxPositionEmbeddings == ContextPolicy.modelLimit,
             numAttentionHeads == 24, numKVHeads == 2, headDim == 256,
             vocabSize == 248_320, fullAttentionInterval == 4,
             numExperts == 512, topK == 10, moeIntermediate == 640,
--- a/Sources/Slotstream/Context.swift
+++ b/Sources/Slotstream/Context.swift
@@ -4,6 +4,8 @@
 import Foundation
 
 public enum ContextPolicy {
+    /// Pinned checkpoint configuration. This is independent of qualification.
+    public static let modelLimit = 262_144
     /// Longest prompt plus reply any one request may hold, in tokens.
     ///
     /// The Hermes qualification read 65,520 prompt tokens plus a reply; the
@@ -13,17 +15,24 @@
     /// See MEASUREMENTS.md, Hermes integration, for the initial budget failure
     /// and the planned-context qualification. Keep ordinary defaults unchanged.
     public static let maxTokens = 65_536
+    public static let implementationLimit = maxTokens
+    public static let mtpLimit = 65_536
+    public static let visionLimit = 65_536
     public static let defaultTokens = 32_768
     /// Context the fixed footprint (Planner.fixedFootprintGB) already pays for.
     public static let tokensInFixedFootprint = 32_768
 
     /// nil when `tokens` is an acceptable --max-context, otherwise the reason.
     public static func validationError(_ tokens: Int) -> String? {
-        if tokens >= 1, tokens <= maxTokens { return nil }
-        return "--max-context must be between 1 and \(maxTokens): that ceiling is the "
-            + "largest context slotstream has measured on this hardware, not a memory limit "
-            + "(context state costs ~27 KiB per token). Measure a longer one with "
-            + "`slotstream context-check --tokens N` before the ceiling moves; see README, Context."
+        validationError(tokens, qualification: false)
+    }
+
+    public static func validationError(_ tokens: Int, qualification: Bool) -> String? {
+        let limit = qualification ? modelLimit : implementationLimit
+        if (1 ... limit).contains(tokens) { return nil }
+        return "--max-context must be between 1 and \(limit) (prompt plus reply). "
+            + "The pinned model limit is \(modelLimit); the released implementation limit is "
+            + "\(implementationLimit). A model limit does not guarantee memory fit or answer quality."
     }
 }
 
@@ -41,34 +50,41 @@
     /// 4096-token pass finishing an 8,016-token prompt (MEASUREMENTS.md,
     /// "Prefill, second pass"). Do not raise it without a new measurement.
     public static let measuredQueryKeyProduct = 4096 * 8016
-    /// Smallest pass. Below it the eviction scan can find no victim (the
-    /// floor pool is sized for a 256-token pass), and the throughput anchors
-    /// stop at 256.
-    public static let minChunk = 256
+    /// Late-context passes use the existing small-pass pool path. Their cost
+    /// stays unknown until a matching measurement has been registered.
+    public static let minChunk = 64
 
     /// The pass to run when the state already holds `position` tokens and the
     /// plan allows `maxChunk`: halve from `maxChunk` until the product with
     /// the context the pass attends over is inside the measured bound, never
     /// below `minChunk`.
     public static func chunk(at position: Int, maxChunk: Int) -> Int {
-        var c = max(minChunk, maxChunk)
-        while c > minChunk, !fits(c, at: position) {
-            c = max(minChunk, c / 2)
-        }
-        return c
+        guard position >= 0, position < ContextPolicy.modelLimit else { return 0 }
+        // Preserve the original 256-row dispatch while it fits. An odd
+        // override such as 4095 must not halve through 511 to 255 inside the
+        // existing serving window and silently select small-pass arithmetic.
+        let floor = fits(256, at: position) ? 256 : minChunk
+        var c = min(4096, max(floor, maxChunk))
+        while c > floor, !fits(c, at: position) {
+            c = max(floor, c / 2)
+        }
+        while c > 1, !fits(c, at: position) { c /= 2 }
+        return fits(c, at: position) ? c : 0
     }
 
     /// Division avoids overflowing arbitrary diagnostic inputs. The accepted
     /// context ceiling is unchanged; within it even the minimum pass fits.
-    private static func fits(_ count: Int, at position: Int) -> Bool {
-        count > 0 && max(0, position) <= measuredQueryKeyProduct / count - count
+    public static func fits(_ count: Int, at position: Int) -> Bool {
+        count > 0 && position >= 0 && position <= measuredQueryKeyProduct / count - count
     }
 
     /// Check the actual remaining rows before shrinking a hypothetical full
     /// pass. A 3,864-row tail after 4,096 fits the existing measured envelope.
     public static func next(remaining: Int, at position: Int, maxChunk: Int, tailAware: Bool) -> Int {
         guard remaining > 0 else { return 0 }
-        let candidate = min(remaining, max(minChunk, maxChunk))
+        guard position >= 0, position < ContextPolicy.modelLimit,
+              remaining <= ContextPolicy.modelLimit - position else { return 0 }
+        let candidate = min(remaining, min(4096, max(1, maxChunk)))
         if tailAware, fits(candidate, at: position) { return candidate }
         return min(remaining, chunk(at: position, maxChunk: maxChunk))
     }
@@ -77,7 +93,8 @@
     /// query-by-key product. A scope shares reads; it is not a compute pass.
     public static func scopePasses(remaining: Int, at position: Int, maxChunk: Int,
                                    maxScope: Int, tailAware: Bool) -> [Int] {
-        guard remaining > 0 else { return [] }
+        guard remaining > 0, position >= 0, position < ContextPolicy.modelLimit,
+              remaining <= ContextPolicy.modelLimit - position else { return [] }
         var result: [Int] = [], count = 0
         let bound = max(minChunk, min(8192, maxScope))
         while count < remaining {
@@ -86,7 +103,7 @@
             let n = next(remaining: remaining - count, at: pos, maxChunk: maxChunk, tailAware: tailAware)
             // A short final pass uses the reference cached kernel family;
             // keep it separate until swept short tails have their own gate.
-            if count > 0 && (n < SweepTuning.minTokens || n > bound - count) { break }
+            if n == 0 || (count > 0 && (n < SweepTuning.minTokens || n > bound - count)) { break }
             result.append(n); count += n
             if count >= bound { break }
         }
@@ -95,11 +112,14 @@
 
     /// The passes that reading `tokens` new tokens from `position` runs.
     public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> [Int] {
+        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
+              tokens <= ContextPolicy.modelLimit - position else { return [] }
         var out: [Int] = []
-        var pos = max(0, position)
-        var left = max(0, tokens)
+        var pos = position
+        var left = tokens
         while left > 0 {
             let c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
+            guard c > 0 else { return [] }
             out.append(c)
             pos += c
             left -= c
@@ -112,6 +132,14 @@
     /// (Planner.estPrefillTokS). The last, partial pass is priced at the rate
     /// of the pass size it was cut from — slightly pessimistic, on purpose.
     public static func estSeconds(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> Double {
+        estimateSeconds(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware) ?? .infinity
+    }
+
+    /// nil means there is no qualified throughput anchor for this schedule.
+    public static func estimateSeconds(tokens: Int, from position: Int = 0, maxChunk: Int,
+                                       tailAware: Bool = false) -> Double? {
+        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
+              tokens <= ContextPolicy.modelLimit - position else { return nil }
         var secs = 0.0
         var pos = max(0, position)
         var left = max(0, tokens)
@@ -120,6 +148,7 @@
                 ? next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: true)
                 : chunk(at: pos, maxChunk: maxChunk)
             let c = min(full, left)
+            guard c > 0, full >= 256 else { return nil }
             secs += Double(c) / Planner.estPrefillTokS(chunk: full)
             pos += c
             left -= c
@@ -129,6 +158,7 @@
 
     /// "18 s" / "1.2 min" / "1.5 h": the same rounding everywhere it is shown.
     public static func describe(seconds: Double) -> String {
+        guard seconds.isFinite else { return "unknown (schedule not yet calibrated)" }
         if seconds < 60 { return String(format: "%.0f s", seconds.rounded()) }
         if seconds < 3600 { return String(format: "%.1f min", seconds / 60) }
         return String(format: "%.1f h", seconds / 3600)
@@ -140,7 +170,7 @@
 /// seconds and the lines would be noise.
 public final class PrefillProgressReporter {
     public let quietBelowTokens: Int
-    public let maxChunk: Int
+    public var maxChunk: Int
     private let sink: (String) -> Void
     private var announced = 0  // total the running announcement was made for
     private var announcedBase = -1
--- /dev/null
+++ b/Sources/Slotstream/ContextFeasibility.swift
@@ -0,0 +1,73 @@
+import Foundation
+
+public struct ContextFeasibility {
+    public let requestedWindow: Int
+    public let maximumFeasibleWindow: Int
+    public let limitingResource: String
+    public let requestedPlan: MemoryPlan?
+    /// Preserve a priced proposal when the physical-memory check refuses it.
+    /// It is evidence for the refusal, never a loadable plan.
+    public let requestedLedger: ContextMemoryLedger?
+    public let maximumPlan: MemoryPlan?
+    public let refusal: String?
+    public var json: [String: Any] {
+        ["requested_window": requestedWindow, "maximum_feasible_window": maximumFeasibleWindow,
+         "limiting_resource": limitingResource, "refusal": refusal as Any? ?? NSNull(),
+         "requested_memory_ledger": requestedLedger?.json as Any? ?? NSNull(),
+         "maximum_memory_ledger": maximumPlan?.memoryLedger.json as Any? ?? NSNull(),
+         "maximum_prefill_chunk": maximumPlan?.prefillChunk as Any? ?? NSNull(),
+         "maximum_pool_slots": maximumPlan?.slots as Any? ?? NSNull(),
+         "scope": "memory feasibility; independent of prefill deadline"]
+    }
+}
+
+extension Planner {
+    /// Exact discrete search. No monotonicity assumption about pass selection,
+    /// MTP or retained-state transitions is needed. Do this at planning time,
+    /// never on a metadata connection or while holding the generation lock.
+    public static func contextFeasibility(_ request: PlanRequest, on device: Machine,
+        mtpAvailable: Bool = false, visionAvailable: Bool = false,
+        visionResidentReserved: Bool = false, runtimePolicy: RuntimeAllocationPolicy? = nil,
+        qualification: Bool = false) -> ContextFeasibility {
+        // Freeze a nil real reading once; it must not drift during search.
+        guard let availability = device.availableGB ?? (device.isSimulated ? .infinity : deviceAvailableGB()) else {
+            return ContextFeasibility(requestedWindow: request.maxContextTokens,
+                maximumFeasibleWindow: 0, limitingResource: "memory_reading_unavailable",
+                requestedPlan: nil, requestedLedger: nil, maximumPlan: nil,
+                refusal: "insufficient_memory: reclaimable memory is unreadable; feasibility cannot be established")
+        }
+        var requestedLedger: ContextMemoryLedger?
+        func candidate(_ cap: Int) throws -> MemoryPlan {
+            let value = try plan(expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
+                memoryGB: request.memoryGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
+                availableGB: availability, ramPercent: request.maxRAMPercent,
+                mtp: request.mtp, mtpAvailable: mtpAvailable, vision: request.vision,
+                visionAvailable: visionAvailable, visionResidentReserved: visionResidentReserved,
+                maxContextTokens: cap, simulated: device.isSimulated, qualification: qualification,
+                runtimePolicy: runtimePolicy)
+            if cap == request.maxContextTokens { requestedLedger = value.memoryLedger }
+            let physical = min(device.workingSetGB, availability - availabilitySlackGB(ramGB: device.ramGB))
+            guard Double(value.memoryLedger.expectedPeakBytes) <= physical * 1e9 else {
+                throw PlanError("insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom")
+            }
+            if let target = value.targetGB, Double(value.memoryLedger.expectedPeakBytes) > target * 1e9 {
+                throw PlanError("insufficient_memory: allocation exceeds the total-memory target")
+            }
+            return value
+        }
+        let resolved: MemoryPlan?
+        let refusal: String?
+        do { resolved = try candidate(request.maxContextTokens); refusal = nil }
+        catch { resolved = nil; refusal = String(describing: error) }
+        let limit = qualification ? ContextPolicy.modelLimit : ContextPolicy.implementationLimit
+        var maximum: MemoryPlan?
+        for cap in stride(from: limit, through: 1, by: -1) {
+            if let value = try? candidate(cap) { maximum = value; break }
+        }
+        return ContextFeasibility(requestedWindow: request.maxContextTokens,
+            maximumFeasibleWindow: maximum?.maxContextTokens ?? 0,
+            limitingResource: maximum?.maxContextTokens == limit ? (qualification ? "model_limit" : "implementation_limit") : "memory_or_required_components",
+            requestedPlan: resolved, requestedLedger: requestedLedger,
+            maximumPlan: maximum, refusal: refusal)
+    }
+}
--- /dev/null
+++ b/Sources/Slotstream/ContextMemory.swift
@@ -0,0 +1,206 @@
+import Foundation
+
+// Saturation is a refusal sentinel, never permission to wrap a byte budget.
+package enum ContextBytes {
+    package static func product(_ values: Int...) -> Int {
+        var result = 1
+        for value in values {
+            guard value >= 0 else { return Int.max }
+            let (next, overflow) = result.multipliedReportingOverflow(by: value)
+            guard !overflow else { return Int.max }
+            result = next
+        }
+        return result
+    }
+    package static func sum(_ values: Int...) -> Int {
+        var result = 0
+        for value in values {
+            guard value >= 0 else { return Int.max }
+            let (next, overflow) = result.addingReportingOverflow(value)
+            guard !overflow else { return Int.max }
+            result = next
+        }
+        return result
+    }
+}
+
+/// Pure geometry shared by the planner and the actual stepped sequence caches.
+/// A capacity is bytes of backing storage, not the number of live token IDs.
+public enum ContextGeometry {
+    public static let allocationStep = 1024
+    public static let attentionLayers = 12
+    public static let rowBytes = 2304
+
+    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
+                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
+                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
+                                     incrementalIndexer: Bool = false) -> Int {
+        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
+              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
+        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
+        let pooled = incrementalIndexer && tokens > indexerBudget
+            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
+        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
+        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
+        let (one, c) = rows.addingReportingOverflow(blocks)
+        let (total, d) = one.multipliedReportingOverflow(by: layers)
+        return a || b || c || d ? Int.max : total
+    }
+
+    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
+        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
+    }
+
+    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
+        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
+            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
+    }
+}
+
+/// Exact integer accounting of an otherwise empirical process envelope. The
+/// fixed and workspace allowances are measured budgets, not allocator telemetry.
+public struct ContextMemoryLedger: Sendable {
+    public let fixedBytes: Int
+    public let poolBytes: Int
+    public let activeCapacityBytes: Int
+    public let additionalActiveBytes: Int
+    public let retainedCapacityBytes: Int
+    public let retainedRecurrentBytes: Int
+    public let prefillBytes: Int
+    public let longContextReserveBytes: Int
+    public let mtpResidentBytes: Int
+    public let visionResidentBytes: Int
+    public let planningMarginBytes: Int
+
+    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
+                mtp: Bool, visionResident: Bool) {
+        fixedBytes = 5_300_000_000
+        poolBytes = ContextBytes.product(slots, 2_764_800)
+        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
+        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
+        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
+        retainedRecurrentBytes = retentionTokens > 0
+            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
+        prefillBytes = ContextBytes.product(chunk, 1_300_000)
+        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
+        mtpResidentBytes = mtp ? 1_600_000_000 : 0
+        visionResidentBytes = visionResident ? 900_000_000 : 0
+        planningMarginBytes = 1_000_000_000
+    }
+
+    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
+    /// an additional complete growth allocation for candidate qualification;
+    /// this conservative copy budget is not a measured interpolation.
+    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
+        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
+        let hermes = 32_768 * PrefixCache.bytesPerToken
+        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
+    }
+
+    public var expectedPeakBytes: Int {
+        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
+            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
+            mtpResidentBytes, visionResidentBytes)
+    }
+    public var json: [String: Any] {
+        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
+         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
+         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
+         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
+         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
+         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
+    }
+}
+
+/// Bounds for the next dispatch. These are conservative geometry allowances,
+/// not throughput anchors or new measured process-peak claims.
+public enum ContextWorkspace {
+    /// A short pass stays inside one canonical projection/attention domain.
+    /// Include masked key columns when choosing its actual query count.
+    public static func boundedSmallPass(requested: Int, at position: Int,
+                                         referenceStart: Int, referenceEnd: Int) -> Int {
+        guard requested > 0, requested < 256, referenceStart >= 0,
+              position >= referenceStart, referenceEnd > position,
+              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
+        let blockRemaining = 256 - ((position - referenceStart) % 256)
+        var count = min(requested, blockRemaining, referenceEnd - position)
+        while count > 0 {
+            let extent = keyExtent(pass: count, context: position + count,
+                referenceStart: referenceStart, referenceEnd: referenceEnd)
+            if count <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
+            count /= 2
+        }
+        return 0
+    }
+
+    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
+                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
+        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
+              referenceStart >= 0, referenceStart <= context - pass,
+              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
+        guard pass >= 64, pass < 256 else { return context }
+        let rows = context - referenceStart
+        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
+    }
+
+    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
+                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
+                                    minimumProjectionRows: Int = 0) -> Int {
+        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
+              (0 ... 256).contains(minimumProjectionRows),
+              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
+        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
+        guard pass <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
+        // Indexer score/mask/top-k and selected attention coexist with layer
+        // activations. Preserve the original linear allowance; bound the
+        // query-by-context part even when late passes fall below 256.
+        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), 1_300_000),
+            ContextBytes.product(pass, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
+    }
+
+    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
+                                   queryTile: Int = 0, padding: Int = 0) -> Int {
+        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
+              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
+              queryTile == 0 || padding == 0 else { return Int.max }
+        // The pinned width-72 fallback materializes BF16 QK and softmax.
+        // Each tile is evaluated before the next, so the candidate really
+        // bounds Q by 256. Padding uses a different kernel; retain the full
+        // original-score allowance until its resource gate is qualified.
+        let queries = queryTile == 256 ? min(patches, 256) : patches
+        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
+            ContextBytes.product(patches, hidden, 32))
+    }
+}
+
+/// Count existing request values without formatting or serializing them first.
+/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
+package enum ContextInputMemory {
+    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
+        guard depth < 64 else { return Int.max }
+        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
+        if let value = value as? JSONValue {
+            switch value {
+            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
+            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
+            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
+            default: return 32
+            }
+        }
+        if let values = value as? [String: Any] {
+            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
+        }
+        if let values = value as? [Any] {
+            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
+        }
+        return 32
+    }
+    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
+        let messagesBytes = messages.reduce(0) { sum, m in
+            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
+            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
+                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
+        }
+        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
+    }
+}
--- a/Sources/Slotstream/Engine.swift
+++ b/Sources/Slotstream/Engine.swift
@@ -102,27 +102,80 @@
     /// are not free: KV plus indexer state costs ~27 KiB per token, and a
     /// prompt is read in full before the first token, so a huge prompt is a
     /// long, memory-growing stall rather than a fast failure.
-    public var maxContextTokens = ContextPolicy.defaultTokens {
-        didSet {
-            let capped = min(prefixCache.maxTokens, maxContextTokens)
+    private let contextLock = NSRecursiveLock()
+    private var configuredContextTokens = ContextPolicy.defaultTokens
+    private let allocatedContextTokens: Int
+    private var contextAssignmentFailure: RequestFailure?
+    public var maxContextTokens: Int {
+        get { contextLock.withLock { configuredContextTokens } }
+        set {
+            contextLock.lock(); defer { contextLock.unlock() }
+            if let why = ContextPolicy.validationError(newValue, qualification: currentPlan?.contextQualification ?? false) {
+                contextAssignmentFailure = RequestFailure(.invalidConfiguration, why); return
+            }
+            guard newValue <= allocatedContextTokens else {
+                contextAssignmentFailure = RequestFailure(.invalidConfiguration,
+                    "context assignment exceeds this engine's allocated plan; construct a new Engine with a validated plan")
+                return
+            }
+            contextAssignmentFailure = nil
+            configuredContextTokens = newValue
+            let capped = min(prefixCache.maxTokens, newValue)
             prefixCache.configure(maxTokens: capped)
-            // Keep /api/show's memory plan aligned with the allocation control
-            // that actually changed; otherwise --max-context 1024 reported the
-            // startup cache ceiling even though it had already been reduced.
-            if let p = currentPlan, p.prefixCacheTokens != capped || p.maxContextTokens != maxContextTokens {
-                updatePlan(MemoryPlan(
-                    source: p.source, slots: p.slots, targetGB: p.targetGB,
-                    ramGB: p.ramGB, workingSetGB: p.workingSetGB,
-                    ramPercent: p.ramPercent, availableGB: p.availableGB,
-                    clamped: p.clamped, prefillChunk: p.prefillChunk,
-                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled,
-                    visionEnabled: p.visionEnabled,
-                    visionResidentReserved: p.visionResidentReserved,
-                    maxContextTokens: maxContextTokens, notes: p.notes,
-                    runtimeAllocationPolicy: p.runtimeAllocationPolicy))
-            }
-        }
-    }
+            if let p = currentPlan {
+                updatePlan(MemoryPlan(source: p.source, slots: p.slots, targetGB: p.targetGB,
+                    ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
+                    availableGB: p.availableGB, clamped: p.clamped, prefillChunk: p.prefillChunk,
+                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled, visionEnabled: p.visionEnabled,
+                    visionResidentReserved: p.visionResidentReserved, maxContextTokens: newValue,
+                    notes: p.notes, runtimeAllocationPolicy: p.runtimeAllocationPolicy,
+                    maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification))
+            }
+        }
+    }
+
+    /// Call when a complete request is accepted, before tokenization or images.
+    public func beginRequest(connected: @escaping () -> Bool = { true }) throws -> RequestController {
+        if let override = requestControllerOverride { return try override() }
+        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
+        if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
+        let configuration = try ContextConfiguration(maxContextTokens: maxContextTokens,
+            maxPrefillWaitMinutes: currentPlan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
+            qualification: currentPlan?.contextQualification ?? false)
+        return RequestController(configuration: configuration,
+            slackBytes: Int(Planner.availabilitySlackGB(ramGB: currentPlan?.ramGB ?? Planner.deviceRAMGB()) * 1e9),
+            connected: connected, pressure: { [weak self] in
+                guard let self else { return true }
+                return self.pressureBoundary.snapshot() != nil || self.osPressureLock.withLock { self.osPressure }
+            })
+    }
+
+    // Package-only dependency seam for deterministic HTTP diagnostics. No wire
+    // field or environment variable can install it.
+    package var requestControllerOverride: (() throws -> RequestController)?
+
+    public var contextPolicyJSON: [String: Any] {
+        let plan = currentPlan
+        return ["configured_window": maxContextTokens, "model_limit": ContextPolicy.modelLimit,
+            "implementation_limit": ContextPolicy.implementationLimit,
+            "mtp_limit": ContextPolicy.mtpLimit, "vision_limit": ContextPolicy.visionLimit,
+            "max_prefill_wait_minutes": plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
+            "wait_scope": "accepted_request_to_first_model_token",
+            "qualification": plan?.contextQualification ?? false,
+            "allocation_available": planLock.withLock { allocationUnavailable == nil },
+            "estimate_scope": "measured M5 Pro anchors; unknown for unqualified pass sizes"]
+    }
+
+    deinit { pressureMonitor?.cancel() }
+
+    private var allocationUnavailable: RequestFailure?
+    package func setAllocationUnavailable(_ failure: RequestFailure?) {
+        planLock.withLock { allocationUnavailable = failure }
+    }
+
+    private let osPressureLock = NSLock()
+    private var osPressure = false
+    private var pressureMonitor: DispatchSourceMemoryPressure?
 
     /// Retained conversation state, so a follow-up turn re-prefills only what
     /// is new. See PrefixCache for the extend-only rule and the memory story.
@@ -140,19 +193,9 @@
     /// raise --max-context, which cannot go past the ceiling the server was
     /// already at.
     public func contextError(promptTokens: Int) -> String? {
-        guard promptTokens > maxContextTokens else { return nil }
-        let wait = PrefillSchedule.describe(seconds: PrefillSchedule.estSeconds(
-            tokens: promptTokens, maxChunk: generator.prefillChunk))
-        let ceiling = maxContextTokens < ContextPolicy.maxTokens
-            ? "this server was started with --max-context \(maxContextTokens); "
-                + "the ceiling is \(ContextPolicy.maxTokens)"
-            : "\(ContextPolicy.maxTokens) is the largest context slotstream has measured, "
-                + "not a memory limit (context state costs ~27 KiB per token)"
-        return "prompt is \(promptTokens) tokens, over this server's limit of "
-            + "\(maxContextTokens) for prompt plus reply. \(ceiling). Reading a prompt "
-            + "this long would take ~\(wait) before the first token here. Send less, or "
-            + "split the material across turns of one conversation so each follow-up "
-            + "reads only what is new."
+        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { return contextAssignmentFailure.message }
+        guard promptTokens < 0 || promptTokens > maxContextTokens else { return nil }
+        return "context_length_exceeded: prompt is \(promptTokens) tokens, over the configured \(maxContextTokens)-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is \(ContextPolicy.modelLimit)."
     }
     /// The live memory plan (updated by the elastic governor on resize; nil
     /// for internal fixed-size uses). Guarded by its own lock so /api reads
@@ -223,6 +266,22 @@
         // allocation and 39 GB of swap. The flag travels on the plan so this
         // cannot be forgotten at a call site.
         if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
+        let context = try ContextConfiguration(maxContextTokens: plan?.maxContextTokens ?? ContextPolicy.defaultTokens,
+            maxPrefillWaitMinutes: plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
+            qualification: plan?.contextQualification ?? false)
+        guard poolSlots >= Geometry.floorSlots, poolSlots <= Geometry.totalRecords,
+              plan == nil || plan?.slots == poolSlots else {
+            throw SlotstreamError.invalidPlan("engine pool must match a supported memory plan")
+        }
+        let initialLedger = plan?.memoryLedger ?? ContextMemoryLedger(slots: poolSlots,
+            context: context.maxContextTokens, chunk: 256,
+            retentionTokens: Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
+            mtp: false, visionResident: false)
+        let initial = RequestController(configuration: context,
+            slackBytes: Int(Planner.availabilitySlackGB(ramGB: plan?.ramGB ?? Planner.deviceRAMGB()) * 1e9))
+        try initial.check(nextAllocationBytes: initialLedger.expectedPeakBytes, phase: "model allocation")
+        self.allocatedContextTokens = context.maxContextTokens
+        self.configuredContextTokens = context.maxContextTokens
         self.modelDir = modelDir
         self._plan = plan
         // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
@@ -277,6 +336,13 @@
         }
         self.eosIds = eos
         publishPoolSnapshot()
+        let monitor = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
+            queue: DispatchQueue(label: "slotstream.request-pressure"))
+        monitor.setEventHandler { [weak self, weak monitor] in
+            guard let self, let monitor else { return }
+            self.osPressureLock.withLock { self.osPressure = !monitor.data.contains(.normal) }
+        }
+        monitor.resume(); pressureMonitor = monitor
         let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
             + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
             + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
@@ -491,15 +557,43 @@
     /// Replan before allocation so a target-driven process pays for the
     /// tower with expert capacity. Also require real machine headroom: an
     /// accounting allowance is not proof that physical memory is available.
-    public func ensureVisionTower() throws -> VisionTower {
+    public func ensureVisionTower() throws -> VisionTower { try ensureVisionTower(request: nil) }
+
+    public func ensureVisionTower(request: RequestController?, workspaceBytes: Int = 0) throws -> VisionTower {
+        guard workspaceBytes >= 0 else {
+            throw RequestFailure(.invalidConfiguration, "vision workspace bytes must be nonnegative")
+        }
         guard visionAllowed else {
             throw SlotstreamError.vision(
                 "this server was started with --vision off; images are not accepted")
         }
-        return try withExclusive {
-            if responsiveGovernor, pressureBoundary.snapshot() != nil {
-                throw SlotstreamError.vision("memory pressure interrupted image preparation; retry after the cache resizes")
-            }
+        if let request { try lock.lock(request: request) } else { lock.lock() }
+        defer { lock.unlock() }
+        return try { () throws -> VisionTower in
+            try request?.check(nextAllocationBytes: visionTower == nil ? 1_900_000_000 : 0, phase: "vision tower allocation")
+            if pressureBoundary.snapshot() != nil {
+                let failure = RequestFailure(.insufficientMemory, "memory pressure interrupted image preparation; retry after the cache resizes")
+                throw request?.fail(failure) ?? failure
+            }
+            let reservedPlan: MemoryPlan?
+            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
+            catch {
+                let failure = RequestFailure(.insufficientMemory, "vision allocation cannot fit the current plan: \(error)")
+                throw request?.fail(failure) ?? failure
+            }
+            if let charged = reservedPlan {
+                let ledger = charged.memoryLedger
+                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
+                    max(ledger.prefillBytes, workspaceBytes))
+                if let target = charged.targetGB, Double(peak) > target * 1e9 {
+                    var failure = RequestFailure(.insufficientMemory,
+                        "image attention workspace exceeds this process memory target; resize the image or raise --memory-gb")
+                    failure.requiredBytes = peak
+                    failure.availableBytes = target < Double(Int.max) / 1e9 ? Int(target * 1e9) : Int.max
+                    throw request?.fail(failure) ?? failure
+                }
+            }
+            try request?.check(nextAllocationBytes: workspaceBytes, phase: "vision workspace admission")
             if let vt = visionTower { return vt }
             let idx = try CheckpointIndex(dir: modelDir)
             guard VisionTower.present(index: idx) else {
@@ -510,18 +604,15 @@
             guard needGB <= Planner.visionResidentGB else {
                 throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
             }
-            let reservedPlan: MemoryPlan?
-            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
-            catch { throw SlotstreamError.vision(String(describing: error)) }
             if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                 avail < needGB + Planner.visionLoadMarginGB
             {
-                throw SlotstreamError.vision(
-                    String(
+                let failure = RequestFailure(.insufficientMemory, String(
                         format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                             + "right now — close other apps and retry, or restart with a lower "
                             + "--memory-gb so the tower fits",
                         needGB, avail))
+                throw request?.fail(failure) ?? failure
             }
             if let p = reservedPlan {
                 // The lock excludes generation and governor mutation. Shrink
@@ -540,7 +631,7 @@
             let vt = try VisionTower(index: idx)
             self.visionTower = vt
             return vt
-        }
+        }()
     }
 
     /// Tokenize with vision expansion: each template image_pad is worth
@@ -555,8 +646,16 @@
     public func encodeWithVision(
         messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
     ) throws -> ([Int], VisionPrompt?) {
+        try encodeWithVision(messages: messages, tools: tools, thinking: thinking, request: nil)
+    }
+
+    public func encodeWithVision(
+        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false,
+        request: RequestController?
+    ) throws -> ([Int], VisionPrompt?) {
+        try request?.checkInputBytes(ContextBytes.sum(ContextInputMemory.bytes(messages), ContextInputMemory.bytes(tools ?? [])))
         let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
-        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages))
+        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages), request: request)
     }
 
     /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
@@ -566,14 +665,23 @@
         _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
         effort: String? = nil
     ) throws -> ([Int], VisionPrompt?) {
+        try encodeChatWithVision(messages, tools: tools, thinking: thinking, effort: effort, request: nil)
+    }
+
+    public func encodeChatWithVision(
+        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
+        effort: String? = nil, request: RequestController?
+    ) throws -> ([Int], VisionPrompt?) {
+        try request?.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: tools))
         let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
-        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images })
+        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images }, request: request)
     }
 
     /// Expand each `<|image_pad|>` the template rendered into the run of
     /// placeholders its image is worth, and describe the images for the tower
     /// and the prefix cache. Shared by every surface so they cannot drift.
-    private func withImages(baseIds: [Int], sources: [String]) throws -> ([Int], VisionPrompt?) {
+    private func withImages(baseIds: [Int], sources: [String], request: RequestController? = nil) throws -> ([Int], VisionPrompt?) {
+        try request?.check(phase: "prompt preparation")
         if sources.isEmpty { return (baseIds, nil) }
         let started = RuntimeClock.now()
         let observer = generator.footprintSampling ? FootprintSampler() : nil
@@ -587,23 +695,39 @@
         let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
         decoded.reserveCapacity(sources.count)
         for (i, source) in sources.enumerated() {
+            try request?.check(nextAllocationBytes: min(source.utf8.count, VisionPreprocess.maxImageBytes * 2), phase: "image source decoding")
             do {
                 let data = try VisionPreprocess.loadImageData(from: source)
-                decoded.append(try sourceBatch.decode(data))
-            } catch {
-                throw SlotstreamError.vision("image \(i + 1): \(error)")
-            }
+                decoded.append(try sourceBatch.decode(data, request: request))
+            } catch let failure as RequestFailure { throw failure }
+            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
         }
         let decodedSeconds = RuntimeClock.seconds(since: started)
-        let towerStart = RuntimeClock.now()
-        let vt = try ensureVisionTower()
-        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
+        let (visionConfig, pixelBounds) = try VisionTower.configuration(directory: modelDir)
         var items: [VisionPrompt.Item] = []
         items.reserveCapacity(decoded.count)
+        var expandedCount = baseIds.count
         for (i, d) in decoded.enumerated() {
-            do { items.append(VisionPrompt.Item(image: d.cg, plan: try vt.plan(for: d.cg))) }
+            try request?.check(phase: "image geometry")
+            do {
+                let plan = try VisionTower.plan(height: d.cg.height, width: d.cg.width,
+                    cfg: visionConfig, bounds: pixelBounds)
+                let (next, overflow) = expandedCount.addingReportingOverflow(plan.mergedTokens - 1)
+                guard !overflow, next <= min(maxContextTokens, ContextPolicy.visionLimit) else {
+                    throw RequestFailure(.contextLengthExceeded,
+                        "image-expanded input exceeds the configured or qualified vision context; reduce the history or image count")
+                }
+                expandedCount = next
+                items.append(VisionPrompt.Item(image: d.cg, plan: plan))
+            } catch let failure as RequestFailure { throw failure }
             catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
         }
+        let towerStart = RuntimeClock.now()
+        let workspace = items.map { ContextWorkspace.visionBytes(patches: $0.plan.patches,
+            hidden: visionConfig.hiddenSize, heads: visionConfig.numHeads,
+            queryTile: model.optimizations.visionQueryTile, padding: model.optimizations.visionAttentionPadding) }.max() ?? 0
+        let vt = try ensureVisionTower(request: request, workspaceBytes: ContextBytes.sum(workspace, sourceBatch.chargedBytes))
+        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
         // The template renders one `<|image_pad|>` per image; the tower
         // produces `mergedTokens` rows for it. Expanding the pad into a run of
         // that length is what makes the two line up, and it moves every token
@@ -644,6 +768,9 @@
                     + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                     + "from the text")
         }
+        guard expanded.count <= min(maxContextTokens, ContextPolicy.visionLimit) else {
+            throw RequestFailure(.contextLengthExceeded, "image-expanded input exceeds the configured or qualified vision context limit")
+        }
         let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
         prompt.preparationObservation = ImagePreparationObservation(
             seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
@@ -709,18 +836,52 @@
         shouldContinue: (() -> Bool)? = nil,
         onToken: ((Int, String) -> Bool)? = nil
     ) -> (text: String, ids: [Int], stats: GenStats) {
+        generate(promptIds: promptIds, params: params, vision: vision,
+            shouldContinue: shouldContinue, onToken: onToken, request: nil)
+    }
+
+    public func generate(
+        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
+        shouldContinue: (() -> Bool)? = nil,
+        onToken: ((Int, String) -> Bool)? = nil,
+        request: RequestController?, onAdmitted: (() -> Bool)? = nil
+    ) -> (text: String, ids: [Int], stats: GenStats) {
         let requestStart = RuntimeClock.now()
-        lock.lock()
+        let control: RequestController
+        do {
+            if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
+            if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
+            control = try request ?? beginRequest()
+            guard control.configuration.maxContextTokens <= allocatedContextTokens else {
+                throw RequestFailure(.invalidConfiguration, "request policy exceeds the allocated engine window")
+            }
+            if let why = contextError(promptTokens: promptIds.count) {
+                throw RequestFailure(.contextLengthExceeded, why)
+            }
+            guard promptIds.count <= control.configuration.maxContextTokens else {
+                throw RequestFailure(.contextLengthExceeded, "prompt exceeds this request's configured context window")
+            }
+            try lock.lock(request: control)
+        } catch {
+            var stats = GenStats(); stats.promptTokens = promptIds.count
+            let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
+            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
+            stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
+            return ("", [], stats)
+        }
         let queueSeconds = RuntimeClock.seconds(since: requestStart)
+        let preparationSeconds = max(0, control.elapsedSeconds - queueSeconds)
         defer { lock.unlock() }
         var params = params.sanitized()
         // A queued request may acquire the lock before the waiting governor.
         // Refuse it before image encoding, cache checkout or GPU allocation.
-        if responsiveGovernor, let ticket = pressureBoundary.snapshot() {
+        if let ticket = pressureBoundary.snapshot() {
             var stats = GenStats()
             stats.promptTokens = promptIds.count
             stats.memoryPressureCancelled = true
-            stats.runtimeError = "memory pressure interrupted inference; retry after the cache resizes"
+            let failure = control.fail(RequestFailure(.insufficientMemory,
+                "memory pressure interrupted inference; retry after the cache resizes"))
+            stats.requestFailure = failure; stats.runtimeError = failure.message
             stats.finishReason = "error"
             stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
             stats.peakMemoryGB = ProcessMemory.peakResidentGB
@@ -731,11 +892,25 @@
             stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
             return ("", [], stats)
         }
-        let room = max(0, maxContextTokens - promptIds.count)
+        let modeLimit = vision == nil ? ContextPolicy.modelLimit : ContextPolicy.visionLimit
+        let effectiveWindow = min(maxContextTokens, control.configuration.maxContextTokens, modeLimit)
+        guard promptIds.count <= effectiveWindow else {
+            let failure = control.fail(RequestFailure(.contextLengthExceeded,
+                "prompt exceeds the configured or qualified vision context window"))
+            var stats = GenStats(); stats.promptTokens = promptIds.count
+            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
+            stats.queueSeconds = queueSeconds; stats.preparationSeconds = preparationSeconds
+            return ("", [], stats)
+        }
+        let room = max(0, effectiveWindow - promptIds.count)
         if room == 0 {
+            if onAdmitted?() == false { control.cancel() }
             var stats = GenStats()
+            if let failure = control.failure {
+                stats.requestFailure = failure; stats.runtimeError = failure.message
+            }
             stats.promptTokens = promptIds.count
-            stats.finishReason = "length"
+            stats.finishReason = control.failure == nil ? "length" : "error"
             stats.peakMemoryGB = ProcessMemory.peakResidentGB
             stats.cachedRouterBytes = model.cachedRouterBytes
             stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
@@ -760,7 +935,9 @@
         var pressureBoundarySeconds: Double?
 
         func observePressure() -> Bool {
-            guard responsiveGovernor, let ticket = pressureBoundary.snapshot() else { return false }
+            guard let ticket = pressureBoundary.snapshot() else { return false }
+            control.fail(RequestFailure(.insufficientMemory,
+                "memory pressure interrupted inference; retry after the cache resizes"))
             if pressureObserved == nil {
                 pressureObserved = ticket
                 pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
@@ -820,6 +997,7 @@
 
         let needsIncrementalDecode = onToken != nil || !stops.isEmpty
         let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
+            control.sampledFirstToken()
             lastTok = tok
             pendingIds.append(tok)
             let ok = flushStablePrefix(tok)
@@ -828,7 +1006,7 @@
             // already a supported committed-emission boundary in both decode
             // paths; do not spend another forward before observing it.
             return ok && !observePressure()
-        } : (responsiveGovernor ? { _ in !observePressure() } : nil)
+        } : { _ in control.sampledFirstToken(); return !observePressure() }
 
         var (ids, stats) = generator.generate(
             promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
@@ -837,7 +1015,7 @@
                 guard !clientGone, !stopFound else { return false }
                 if observePressure() { return false }
                 return shouldContinue?() ?? true
-            }, onToken: tokenHandler)
+            }, onToken: tokenHandler, request: control, onAdmitted: onAdmitted)
 
         var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
         if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
@@ -845,7 +1023,7 @@
         }
         // The one full decode is both the non-streamed result and an exact final
         // reconciliation for the bounded incremental decoder.
-        if !clientGone, onToken != nil {
+        if !clientGone, control.failure == nil, stats.runtimeError == nil, onToken != nil {
             let target = text.unicodeScalars
             let sent = delivered.unicodeScalars
             if target.count >= sent.count, target.starts(with: sent) {
@@ -853,6 +1031,7 @@
             }
         }
         stats.queueSeconds = queueSeconds
+        stats.preparationSeconds = preparationSeconds
         stats.memoryPressureCancelled = pressureObserved != nil
         if pressureObserved != nil {
             stats.runtimeError = stats.runtimeError
@@ -861,7 +1040,14 @@
         }
         stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
         stats.firstTextSeconds = firstTextSeconds
-        stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
+        if let failure = control.failure {
+            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
+            stats.memoryPressureCancelled = failure.code == .insufficientMemory
+            prefixCache.drop()
+            Stream.gpu.synchronize()
+            MLX.Memory.clearCache()
+        }
+        stats.requestSeconds = control.elapsedSeconds
         return (text, ids, stats)
     }
 }
--- a/Sources/Slotstream/Generate.swift
+++ b/Sources/Slotstream/Generate.swift
@@ -141,6 +141,9 @@
     public var interTokenSeconds: [Double] = []
     public var prefillPasses: [Int] = []
     public var prefillComputePasses: [Int] = []
+    /// Actual maximum attention key extent of each committed compute pass,
+    /// including masked numerical-alignment padding when that path executes.
+    public var prefillComputeKeyExtents: [Int] = []
     public var terminalQueryRowsSkipped = 0
     public var terminalMoERowsSkipped = 0
     public var abortedReadScopes = 0
@@ -224,11 +227,14 @@
     public var decodeIOSeconds = 0.0
     public var decodeScatterSeconds = 0.0
     public var decodeRecords = 0
-    /// "stop" (EOS, a stop sequence, or a cancelled stream) or "length".
+    /// "stop" (EOS or stop sequence), "length", "error", or a low-level
+    /// caller's explicit "cancelled" checkpoint yield.
     public var finishReason = "stop"
     /// A recoverable request failure. The failed state is never cached and
     /// serving adapters must emit an error instead of a successful completion.
     public var runtimeError: String?
+    public var requestFailure: RequestFailure?
+    public var preparationSeconds = 0.0
     /// Pressure-to-observed-safe-boundary latency, not GPU preemption time.
     public var memoryPressureCancelled = false
     public var memoryPressureBoundarySeconds: Double?
@@ -402,6 +408,17 @@
         shouldContinue: (() -> Bool)? = nil,
         onToken: ((Int) -> Bool)? = nil
     ) -> ([Int], GenStats) {
+        generate(promptIds: promptIds, params: params, eosIds: eosIds, cache: cache, vision: vision,
+            shouldContinue: shouldContinue, onToken: onToken, request: nil)
+    }
+
+    public func generate(
+        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
+        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
+        shouldContinue: (() -> Bool)? = nil,
+        onToken: ((Int) -> Bool)? = nil,
+        request: RequestController?, onAdmitted: (() -> Bool)? = nil
+    ) -> ([Int], GenStats) {
         let requestStart = RuntimeClock.now()
         let sharedPrelaunchStart = model.sharedExpertPrelaunches
         let rotationStart = model.fusedRoPERotationsScheduled
@@ -419,6 +436,7 @@
         sampler.deviceDraw = model.optimizations.deviceSamplerDraw
         if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
         var stats = GenStats()
+        stats.promptTokens = promptIds.count
         let embeddingHitsStart = model.resident.embeddingRowHits
         let embeddingMissesStart = model.resident.embeddingRowMisses
         func finish(_ output: [Int]) -> ([Int], GenStats) {
@@ -427,6 +445,12 @@
             stats.embeddingRowMisses = model.resident.embeddingRowMisses - embeddingMissesStart
             stats.embeddingCachedRows = model.resident.embeddingCachedRows
             stats.embeddingCachedPayloadBytes = model.resident.embeddingCachedPayloadBytes
+            if let failure = request?.failure {
+                stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
+                stats.memoryPressureCancelled = failure.code == .insufficientMemory
+            } else if stats.requestFailure?.code == .clientCancelled {
+                stats.finishReason = "cancelled"
+            }
             return (output, stats)
         }
         stats.imagePreparation = vision?.preparationObservation
@@ -458,6 +482,29 @@
             stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
             return finish([])
         }
+        guard promptIds.count <= ContextPolicy.modelLimit,
+              params.maxTokens <= ContextPolicy.modelLimit - promptIds.count else {
+            let failure = RequestFailure(.contextLengthExceeded, "prompt plus output exceeds the model context limit")
+            request?.fail(failure)
+            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
+            stats.sampledFootprint = footprint?.finish()
+            return finish([])
+        }
+        // A retained checkpoint may fork backing arrays. Its reservation is
+        // real future work, so require physical headroom before taking it.
+        let forkBytes = (cache?.heldCheckpoints ?? 0) > 0
+            ? model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
+                mtp: speculationEnabled && model.mtpHead != nil) : 0
+        do { try request?.check(nextAllocationBytes: ContextBytes.sum(PrefixCache.fixedBytesPerEntry, forkBytes), phase: "state reservation") }
+        catch {
+            stats.sampledFootprint = footprint?.finish()
+            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
+            return finish([])
+        }
+        // Every public request returns an idle pool, including successful
+        // final-token and EOS paths. Readers have joined inside each checked
+        // forward; synchronize GPU users before releasing their expert pins.
+        defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
         model.prepareOptimizationKernels()
         // Vision prompts are cacheable, but not on ids alone: every image
         // expands to a run of the same placeholder id, so a second picture of
@@ -473,7 +520,8 @@
         let checkpointHitsBefore = cache?.checkpointHits ?? 0
         let completeKey = model.optimizations.completePromptCheckpoint
             ? PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
-                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil) : nil
+                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil,
+                contextArithmetic: request?.configuration.qualification == true ? 1 : 0) : nil
         let hit = cache?.takeForGeneration(
             matching: promptIds, images: images,
             reserveTokens: promptIds.count + params.maxTokens,
@@ -482,7 +530,40 @@
             modelIdentity: model.promptCheckpointIdentity)
         let state = hit?.state ?? model.makeState()
         let reused = hit?.reused ?? 0
-        stats.promptTokens = promptIds.count
+        func checkAllocation(end: Int, workspaceBytes: Int = 0, phase: String) throws {
+            let needed = model.sequenceCapacityBytes(tokens: end,
+                mtp: speculationEnabled && model.mtpHead != nil)
+            let growth = max(0, needed - state.allocatedSequenceBytes)
+            let (bytes, overflow) = growth.addingReportingOverflow(workspaceBytes)
+            try request?.check(nextAllocationBytes: overflow ? Int.max : bytes, phase: phase)
+        }
+        let canContinue: () -> Bool = {
+            do { try checkAllocation(end: min(ContextPolicy.modelLimit, state.tokenCount + 1), phase: "decode boundary") }
+            catch { return false }
+            if shouldContinue?() == false {
+                let failure = request?.failure ?? RequestFailure(.clientCancelled, "inference was cancelled by its caller")
+                request?.fail(failure)
+                stats.requestFailure = failure
+                if request != nil { stats.runtimeError = failure.message }
+                stats.finishReason = "cancelled"
+                return false
+            }
+            return true
+        }
+        do {
+            try request?.admit(missingTokens: promptIds.count - reused, from: reused,
+                maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)
+            try checkAllocation(end: min(promptIds.count, reused + prefillChunk), phase: "initial state allocation")
+            if onAdmitted?() == false {
+                request?.cancel()
+                stats.sampledFootprint = footprint?.finish()
+                return finish([])
+            }
+        } catch {
+            stats.sampledFootprint = footprint?.finish()
+            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
+            return finish([])
+        }
         stats.reusedPrefixTokens = reused
         stats.prefixCheckpointForks = (cache?.checkpointHits ?? 0) - checkpointHitsBefore
         stats.completePromptHits = hit?.logits == nil ? 0 : 1
@@ -534,8 +615,9 @@
         do {
             visionRuns = try vision?.runsChecked(consumedTokens: reused, deduplicate: model.optimizations.deduplicateImages,
                 attentionPadding: model.optimizations.visionAttentionPadding,
-                queryTile: model.optimizations.visionQueryTile) ?? []
+                queryTile: model.optimizations.visionQueryTile, request: request) ?? []
         } catch {
+            Stream.gpu.synchronize()
             model.pool.unpinAll()
             model.pool.admitOnSweep = false
             stats.runtimeError = "image preprocessing failed: \(error)"
@@ -583,7 +665,7 @@
         if i < promptIds.count { progress(0, 0) }
         var cancelledPrefill = false
         while i < promptIds.count {
-            if cancelledPrefill || shouldContinue?() == false {
+            if cancelledPrefill || !canContinue() {
                 MLX.Memory.cacheLimit = savedCacheLimit
                 stats.finishReason = "stop"
                 stats.prefillTokens = i - reused
@@ -602,7 +684,9 @@
                 // Each completed chronological pass is a whole-stack commit.
                 // Publish only that boundary; a partial image keeps its digest
                 // and consumed span, never identities of future images.
-                if i > 0, state.tokenCount == i {
+                Stream.gpu.synchronize()
+                model.pool.unpinAll()
+                if request?.mayRetainState != false, i > 0, state.tokenCount == i {
                     let committedImages = images.compactMap { image -> ImageSegment? in
                         guard image.start < i else { return nil }
                         return ImageSegment(start: image.start, count: min(image.count, i - image.start),
@@ -636,6 +720,20 @@
                 : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                     maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)]
             let hi = i + passes.reduce(0, +)
+            do {
+                var at = i, workspace = 0
+                for pass in passes {
+                    at += pass
+                    workspace = max(workspace, ContextWorkspace.prefillBytes(pass: pass, context: at,
+                        attentionHeads: model.cfg.numAttentionHeads, referenceStart: reused, referenceEnd: promptIds.count))
+                }
+                workspace = ContextBytes.sum(workspace, ContextBytes.product(max(0, hi - i - (passes.max() ?? 0)), 32_768))
+                try checkAllocation(end: hi, workspaceBytes: workspace, phase: "prefill pass")
+            } catch { cancelledPrefill = true; continue }
+            guard hi > i else {
+                request?.fail(RequestFailure(.contextLengthExceeded, "no bounded prefill pass fits the remaining model context"))
+                cancelledPrefill = true; continue
+            }
             // Only the last pass warms the pool with the prompt's hot experts
             // (sweep admission); no other pass may evict what decode was using.
             model.pool.admitOnSweep = hi == promptIds.count
@@ -645,7 +743,7 @@
             if model.optimizations.readScopeEnabled, passes.count > 1 {
                 let result = try model.consumeReadScopeChecked(chunk, passes: passes, state: state,
                     vision: chunkVision, head: mtpHead, final: hi == promptIds.count,
-                    shouldContinue: shouldContinue)
+                    shouldContinue: canContinue)
                 if !result.committed {
                     stats.abortedReadScopes += 1
                     cancelledPrefill = true
@@ -673,6 +771,7 @@
                 let h = try model.hiddenStatesChecked(chunk, state: state, vision: chunkVision)
                 eval(h)
             }
+            try request?.check(phase: "prefill commit")
             } catch {
                 discardFailedState(error)
                 if model.optimizations.readScopeEnabled, passes.count > 1 { stats.abortedReadScopes += 1 }
@@ -695,6 +794,11 @@
             }
             stats.prefillPasses.append(chunk.count)
             stats.prefillComputePasses.append(contentsOf: passes)
+            var keyEnd = i
+            for pass in passes {
+                keyEnd += pass
+                stats.prefillComputeKeyExtents.append(keyEnd)
+            }
             i = hi
             if let cache, i == model.optimizations.prefixCheckpointTokens,
                reused < i, i < promptIds.count {
@@ -726,7 +830,7 @@
                 // mode actually used, so a later MTP request rebuilds its head.
                 let producedKey = PromptCheckpointKey(model: completeKey.model,
                     optimizations: completeKey.optimizations, prefillChunk: completeKey.prefillChunk,
-                    mtp: mtpHead != nil)
+                    mtp: mtpHead != nil, contextArithmetic: completeKey.contextArithmetic)
                 let retained = try cache.storeCompletePrompt(state: state, tokens: promptIds, images: images,
                     reserveTokens: promptIds.count + params.maxTokens,
                     reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
@@ -778,6 +882,7 @@
         var lastTokenAt: UInt64?
         var interTokenSeconds: [Double] = []
         let observedToken: (Int) -> Bool = { tok in
+            request?.sampledFirstToken()
             if firstToken == nil { firstToken = RuntimeClock.seconds(since: requestStart) }
             if let previous = lastTokenAt { interTokenSeconds.append(RuntimeClock.seconds(since: previous)) }
             lastTokenAt = RuntimeClock.now()
@@ -790,13 +895,13 @@
         if let head = mtpHead, speculationEnabled, let mtpState = state.mtp {
             try speculativeDecode(
                 head: head, mtpState: mtpState, state: state, logits: logits,
-                params: params, eosIds: eosIds, shouldContinue: shouldContinue,
+                params: params, eosIds: eosIds, shouldContinue: canContinue,
                 onToken: observedToken, out: &out, generated: &generated,
                 reason: &reason, consumed: &consumed, stats: &stats)
         } else {
             state.invalidateMTP()
             for _ in 0 ..< max(0, params.maxTokens) {
-                if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
+                if !canContinue() { reason = "stop"; break }
                 let sampleStart = RuntimeClock.now()
                 let tok = sample(logits, params: params, generated: generated)
                 stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
@@ -817,7 +922,7 @@
             discardFailedState(error)
             reason = "error"
         }
-        if stats.runtimeError == nil { cache?.store(state: state, tokens: consumed, images: images) }
+        if stats.runtimeError == nil, request?.mayRetainState != false { cache?.store(state: state, tokens: consumed, images: images) }
         stats.finishReason = reason
         stats.decodeTokens = out.count
         stats.decodeSeconds = RuntimeClock.seconds(since: t0)
--- a/Sources/Slotstream/Governor.swift
+++ b/Sources/Slotstream/Governor.swift
@@ -50,6 +50,8 @@
         public var visionResidentReserved: Bool
         public var maxContextTokens: Int
         public var runtimeAllocationPolicy: RuntimeAllocationPolicy?
+        public var ownedAdditionalBytes: Int
+        public var contextQualification: Bool
         /// nil = no such event yet in this process.
         public var secondsSincePressure: Double?
         public var secondsSinceResize: Double?
@@ -64,7 +66,8 @@
             mtpEnabled: Bool = false, visionEnabled: Bool = false,
             visionResidentReserved: Bool = false,
             maxContextTokens: Int = ContextPolicy.defaultTokens,
-            runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil
+            runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
+            ownedAdditionalBytes: Int = 0, contextQualification: Bool = false
         ) {
             self.ramPercent = ramPercent
             self.currentSlots = currentSlots
@@ -79,6 +82,8 @@
             self.visionResidentReserved = visionResidentReserved
             self.maxContextTokens = maxContextTokens
             self.runtimeAllocationPolicy = runtimeAllocationPolicy
+            self.ownedAdditionalBytes = max(0, ownedAdditionalBytes)
+            self.contextQualification = contextQualification
         }
     }
 
@@ -105,18 +110,16 @@
         let credited = i.availableGB + Geometry.gb(i.currentSlots) + Planner.fixedFootprintGB
             + (i.mtpEnabled ? Planner.mtpResidentGB : 0)
             + (i.visionResidentReserved ? Planner.visionResidentGB : 0)
-        guard var plan = try? Planner.plan(
+            + Double(i.ownedAdditionalBytes) / 1e9
+        guard let plan = try? Planner.plan(
             expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
             ramGB: i.ramGB, workingSetGB: i.workingSetGB, availableGB: credited,
             ramPercent: i.ramPercent,
             mtp: i.mtpEnabled ? .on : .off, mtpAvailable: i.mtpEnabled,
             vision: i.visionEnabled ? .on : .off, visionAvailable: i.visionEnabled,
-            visionResidentReserved: i.visionResidentReserved, maxContextTokens: i.maxContextTokens),
+            visionResidentReserved: i.visionResidentReserved, maxContextTokens: i.maxContextTokens,
+            qualification: i.contextQualification, runtimePolicy: i.runtimeAllocationPolicy),
             plan.mtpEnabled == i.mtpEnabled else { return nil }
-        if let policy = i.runtimeAllocationPolicy {
-            guard let adjusted = try? Planner.applyingRuntimePolicy(plan, policy: policy) else { return nil }
-            plan = adjusted
-        }
         // A startup planner may decline a head under pressure, but the live
         // governor has no operation that unloads an already resident head.
         return plan
@@ -141,8 +144,8 @@
         }
         let gb = Geometry.gb(targetSlots)
         return (
-            min(Planner.prefillChunkFor(poolBudgetGB: gb), i.runtimeAllocationPolicy?.prefillChunkOverride ?? 4096),
-            i.runtimeAllocationPolicy?.prefixCacheEnabled == false ? 0 : Planner.prefixCacheTokensFor(poolBudgetGB: gb))
+            min(Planner.prefillChunkFor(poolBudgetGB: gb, contextCap: i.maxContextTokens), i.runtimeAllocationPolicy?.prefillChunkOverride ?? 4096),
+            i.runtimeAllocationPolicy?.prefixCacheEnabled == false ? 0 : Planner.prefixCacheTokensFor(poolBudgetGB: gb, contextCap: i.maxContextTokens))
     }
 
     public static func decide(_ i: Inputs) -> Decision {
@@ -157,7 +160,7 @@
             if let d = desired { target = min(target, d) }
             return settle(target, i.currentSlots, "memory pressure (\(p.rawValue))")
         }
-        guard let d = desired else { return .hold }
+        guard let d = desired else { return settle(Geometry.floorSlots, i.currentSlots, "context plan unavailable") }
         let desiredGB = Geometry.gb(d)
         if desiredGB <= curGB - shrinkDeadbandGB {
             return settle(d, i.currentSlots, "availability dropped")
@@ -266,7 +269,9 @@
             mtpEnabled: cur.mtpEnabled, visionEnabled: cur.visionEnabled,
             visionResidentReserved: cur.visionResidentReserved,
             maxContextTokens: cur.maxContextTokens,
-            runtimeAllocationPolicy: cur.runtimeAllocationPolicy)
+            runtimeAllocationPolicy: cur.runtimeAllocationPolicy,
+            ownedAdditionalBytes: engine.prefixCache.ownedAdditionalBytes(mtpResident: cur.mtpEnabled),
+            contextQualification: cur.contextQualification)
     }
 
     /// OS pressure events see what availability math cannot: compressor and
@@ -304,7 +309,9 @@
         // a decision sampled before the lock would spend that reservation.
         let applyDecision = {
             guard let i = self.inputs(pressure: pressure) else { return }
-            if self.engine.responsiveGovernor, pressure != nil {
+            self.engine.setAllocationUnavailable(GovernorPolicy.desiredPlan(i) == nil
+                ? RequestFailure(.insufficientMemory, "the configured context no longer fits current availability; retry after memory recovers") : nil)
+            if pressure != nil {
                 // Even at the arena floor there can be inexpensive memory to
                 // return. No live reader exists while this gate is held.
                 self.engine.prefixCache.drop()
@@ -318,23 +325,17 @@
                     prefixCacheTokens: controls.prefixCacheTokens)
             }
         }
-        if engine.responsiveGovernor {
-            guard engine.currentPlan?.source == .auto else { requested?(); return }
-            if pressure == nil {
-                engine.tryWithExclusive(applyDecision)
-            } else {
-                let ticket = engine.pressureBoundary.request()
-                requested?()
-                engine.withExclusive {
-                    // This also clears a hold/unavailable decision, so a
-                    // transient event cannot leave all future requests stopped.
-                    defer { engine.pressureBoundary.acknowledge(ticket) }
-                    applyDecision()
-                }
+        // Request cancellation observes pressure independently of optimization controls.
+        guard engine.currentPlan?.source == .auto else { requested?(); return }
+        if pressure == nil {
+            engine.tryWithExclusive(applyDecision)
+        } else {
+            let ticket = engine.pressureBoundary.request()
+            requested?()
+            engine.withExclusive {
+                defer { engine.pressureBoundary.acknowledge(ticket) }
+                applyDecision()
             }
-        } else {
-            requested?()
-            engine.withExclusive(applyDecision)
         }
     }
 
@@ -384,7 +385,9 @@
                 notes: [String(
                     format: "elastic: resized ~%.0f → ~%.0f experts/layer (%@)",
                     Geometry.perLayer(before), Geometry.perLayer(after), reason)],
-                runtimeAllocationPolicy: ref?.runtimeAllocationPolicy))
+                runtimeAllocationPolicy: ref?.runtimeAllocationPolicy,
+                maxPrefillWaitMinutes: ref?.maxPrefillWaitMinutes ?? 30,
+                contextQualification: ref?.contextQualification ?? false))
         }
         lastResizeAt = Date()
         log(String(
--- a/Sources/Slotstream/Model.swift
+++ b/Sources/Slotstream/Model.swift
@@ -212,15 +212,11 @@
     /// caches. Charges allocation steps, completed-block storage and the draft
     /// head when it may be used; it performs no allocation or GPU evaluation.
     public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
-        let n = max(0, tokens)
         let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
         let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
-        let safePerToken = max(1, layers * (rowBytes + cfg.indexerHeadDim * 2))
-        guard n <= Int.max / safePerToken - 1024 else { return Int.max }
-        let capacity = ((n + 1023) / 1024) * 1024
-        let pooled = optimizations.incrementalIndexer && n > cfg.indexerBudget
-            ? ((n / cfg.indexerCompressRatio + 255) / 256) * 256 * cfg.indexerHeadDim * 2 : 0
-        return layers * (capacity * rowBytes + pooled)
+        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
+            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
+            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
     }
 
     public func makeState() -> State {
--- a/Sources/Slotstream/Plan.swift
+++ b/Sources/Slotstream/Plan.swift
@@ -117,6 +117,8 @@
     public let maxContextTokens: Int
     public let notes: [String]
     public let runtimeAllocationPolicy: RuntimeAllocationPolicy?
+    public let maxPrefillWaitMinutes: Double
+    public let contextQualification: Bool
 
     public init(
         source: Source, slots: Int, targetGB: Double?,
@@ -127,7 +129,8 @@
         visionResidentReserved: Bool = false,
         maxContextTokens: Int = ContextPolicy.defaultTokens,
         notes: [String], simulated: Bool = false,
-        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil
+        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
+        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false
     ) {
         self.source = source
         self.slots = slots
@@ -146,16 +149,30 @@
         self.notes = notes
         self.simulated = simulated
         self.runtimeAllocationPolicy = runtimeAllocationPolicy
+        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
+        self.contextQualification = contextQualification
     }
 
     public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
     public var poolGB: Double { Geometry.gb(slots) }
-    public var expectedPeakGB: Double {
-        poolGB + Planner.fixedFootprintGB + Planner.prefillCostGB(prefillChunk)
-            + Planner.prefixCacheCostGB(tokens: prefixCacheTokens)
-            + (mtpEnabled ? Planner.mtpResidentGB : 0)
-            + (visionResidentReserved ? Planner.visionResidentGB : 0)
-            + Planner.extraContextMemoryGB(maxContextTokens: maxContextTokens)
+    public var memoryLedger: ContextMemoryLedger {
+        ContextMemoryLedger(slots: slots, context: maxContextTokens, chunk: prefillChunk,
+            retentionTokens: prefixCacheTokens, mtp: mtpEnabled, visionResident: visionResidentReserved)
+    }
+    public var expectedPeakGB: Double { Double(memoryLedger.expectedPeakBytes) / 1e9 }
+
+    public func withRequestPolicy(_ configuration: ContextConfiguration) throws -> MemoryPlan {
+        guard configuration.maxContextTokens == maxContextTokens else {
+            throw PlanError("request policy must use the context window priced by the memory plan")
+        }
+        return MemoryPlan(source: source, slots: slots, targetGB: targetGB, ramGB: ramGB,
+            workingSetGB: workingSetGB, ramPercent: ramPercent, availableGB: availableGB, clamped: clamped,
+            prefillChunk: prefillChunk, prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
+            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
+            maxContextTokens: maxContextTokens, notes: notes, simulated: simulated,
+            runtimeAllocationPolicy: runtimeAllocationPolicy,
+            maxPrefillWaitMinutes: configuration.maxPrefillWaitMinutes,
+            contextQualification: configuration.qualification)
     }
     /// Seconds a prompt filling the whole context takes before its first
     /// token, priced through the prefill schedule this plan runs.
@@ -263,7 +280,16 @@
             "vision_charged_gb": visionResidentReserved ? Planner.visionResidentGB : 0,
             "vision_resident_gb": visionEnabled ? Planner.visionResidentGB : 0,
             "max_context_tokens": maxContextTokens,
-            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext,
+            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext.isFinite
+                ? estPrefillSecondsAtMaxContext as Any : NSNull(),
+            "model_context_limit": ContextPolicy.modelLimit,
+            "implementation_context_limit": ContextPolicy.implementationLimit,
+            "mtp_context_limit": ContextPolicy.mtpLimit,
+            "vision_context_limit": ContextPolicy.visionLimit,
+            "max_prefill_wait_minutes": maxPrefillWaitMinutes,
+            "prefill_wait_scope": "accepted_request_to_first_model_token",
+            "context_qualification": contextQualification,
+            "memory_ledger": memoryLedger.json,
             // Unrounded on purpose: the banner rounds these to whole tok/s,
             // and a caller comparing two plans across a rounding boundary sees
             // a step that is not there. Anything asserting on the plan should
@@ -311,8 +337,10 @@
             prefixCacheTokens: prefixTokens, mtpEnabled: p.mtpEnabled,
             visionEnabled: p.visionEnabled, visionResidentReserved: p.visionResidentReserved,
             maxContextTokens: p.maxContextTokens,
-            notes: p.notes + ["prefill and prefix retention reservations match the explicit runtime controls"],
-            simulated: p.simulated, runtimeAllocationPolicy: policy)
+            notes: p.notes + (chunk != p.prefillChunk || prefixTokens != p.prefixCacheTokens
+                ? ["prefill and prefix retention reservations match the explicit runtime controls"] : []),
+            simulated: p.simulated, runtimeAllocationPolicy: policy,
+            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
     }
 
     /// Non-pool footprint: resident weights, the 256 MB n-gram payload plus
@@ -357,7 +385,7 @@
     /// the default window; an explicitly larger --max-context reduces the
     /// expert pool before allocation instead of consuming the safety margin.
     public static func extraContextStateGB(maxContextTokens: Int) -> Double {
-        contextStateGB(max(0, maxContextTokens - ContextPolicy.tokensInFixedFootprint))
+        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens)) / 1e9
     }
 
     /// The larger window also needs transient headroom. A completed 65,520
@@ -368,11 +396,9 @@
     /// covers that measured gap without claiming its exact buffer attribution
     /// or interpolating unmeasured peaks. Ordinary windows retain their budget.
     /// See the Hermes measurement and its preserved failed run.
-    public static func extraContextMemoryGB(maxContextTokens: Int) -> Double {
-        let state = extraContextStateGB(maxContextTokens: maxContextTokens)
-        guard state > 0 else { return 0 }
-        let reserve = contextStateGB(ContextPolicy.maxTokens - ContextPolicy.tokensInFixedFootprint)
-        return state + reserve
+    public static func extraContextMemoryGB(maxContextTokens: Int, mtp: Bool = false) -> Double {
+        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens, mtp: mtp)
+            + ContextMemoryLedger.transientReserveBytes(context: maxContextTokens, mtp: mtp)) / 1e9
     }
 
     /// Sizes the prefill pass from the same budget as the pool.
@@ -420,7 +446,7 @@
     /// the pass only grows when the prefill it buys beats the decode it costs.
     /// Swept a GB at a time from 7 to 90 GB, the estimate never gets worse as
     /// the target grows.
-    public static func prefillChunkFor(poolBudgetGB: Double) -> Int {
+    public static func prefillChunkFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
         // 8192 is not a candidate: nothing has measured it, and the prefill
         // schedule would cut it to 4096 on the first pass anyway
         // (PrefillSchedule.measuredQueryKeyProduct), so offering it only
@@ -429,7 +455,7 @@
             prefillCostGB($0) <= 0.25 * poolBudgetGB
         }
         func seconds(_ c: Int) -> Double {
-            let pool = poolBudgetGB - prefillCostGB(c) - prefixCacheGB(poolBudgetGB: poolBudgetGB)
+            let pool = poolBudgetGB - prefillCostGB(c) - prefixCacheGB(poolBudgetGB: poolBudgetGB, contextCap: contextCap)
             let slots = Geometry.slotsForPoolGB(max(0, pool))
             let decode = estWarmTokS(expertsPerLayer: Geometry.perLayer(slots))
             return tuningPromptTokens / estPrefillTokS(chunk: c) + tuningReplyTokens / decode
@@ -466,8 +492,8 @@
     }
 
     /// What that retention ceiling costs, which the plan reserves.
-    public static func prefixCacheGB(poolBudgetGB: Double) -> Double {
-        prefixCacheCostGB(tokens: prefixCacheTokensFor(poolBudgetGB: poolBudgetGB))
+    public static func prefixCacheGB(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Double {
+        prefixCacheCostGB(tokens: prefixCacheTokensFor(poolBudgetGB: poolBudgetGB, contextCap: contextCap))
     }
 
     /// PrefixCache evicts before a miss allocation, so no more than four
@@ -673,10 +699,10 @@
         targetGB - fixedFootprintGB - planningMarginGB
     }
 
-    public static func slotsForTarget(_ targetGB: Double) -> Int {
+    public static func slotsForTarget(_ targetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
         let budget = poolBudgetGB(targetGB)
-        let pool = budget - prefillCostGB(prefillChunkFor(poolBudgetGB: budget))
-            - prefixCacheGB(poolBudgetGB: budget)
+        let pool = budget - prefillCostGB(prefillChunkFor(poolBudgetGB: budget, contextCap: contextCap))
+            - prefixCacheGB(poolBudgetGB: budget, contextCap: contextCap)
         return Geometry.slotsForPoolGB(pool)
     }
 
@@ -707,12 +733,49 @@
         maxContextTokens: Int = ContextPolicy.defaultTokens,
         simulated: Bool = false
     ) throws -> MemoryPlan {
-        if let why = ContextPolicy.validationError(maxContextTokens) { throw PlanError(why) }
+        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
+            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
+            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
+            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
+            simulated: simulated, qualification: false, runtimePolicy: nil)
+    }
+
+    public static func plan(
+        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
+        ramGB: Double? = nil, workingSetGB: Double? = nil,
+        availableGB: Double? = nil, ramPercent: Double? = nil,
+        mtp: MTPMode = .off, mtpAvailable: Bool = false,
+        vision: VisionMode = .auto, visionAvailable: Bool = false,
+        visionResidentReserved: Bool = false,
+        maxContextTokens: Int = ContextPolicy.defaultTokens,
+        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
+    ) throws -> MemoryPlan {
+        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
+            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
+            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
+            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
+            simulated: simulated, qualification: false, runtimePolicy: runtimePolicy)
+    }
+
+    public static func plan(
+        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
+        ramGB: Double? = nil, workingSetGB: Double? = nil,
+        availableGB: Double? = nil, ramPercent: Double? = nil,
+        mtp: MTPMode = .off, mtpAvailable: Bool = false,
+        vision: VisionMode = .auto, visionAvailable: Bool = false,
+        visionResidentReserved: Bool = false,
+        maxContextTokens: Int = ContextPolicy.defaultTokens,
+        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil
+    ) throws -> MemoryPlan {
+        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) { throw PlanError(why) }
         // The fixed footprint pays for the default context; larger windows
         // reduce the pool budget by their additional active state and measured
         // transient envelope, before sizing either the pool or prefill pass.
         let contextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens)
             + (visionResidentReserved ? visionResidentGB : 0)
+        let mtpContextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens, mtp: true)
+            - extraContextMemoryGB(maxContextTokens: maxContextTokens)
+        let mtpTotalCharge = mtpResidentGB + mtpContextCharge
         let ram = ramGB ?? deviceRAMGB()
         let ws = workingSetGB ?? deviceWorkingSetGB()
         let avail = availableGB ?? deviceAvailableGB()
@@ -757,7 +820,14 @@
 
         /// The draft-head decision for a pool of `slots` when the head costs
         /// pool budget (target-driven sources already shrank the pool).
+        if mtp == .on, maxContextTokens > ContextPolicy.mtpLimit, !qualification {
+            throw PlanError("MTP is qualified only through \(ContextPolicy.mtpLimit) tokens; use --mtp off at this window")
+        }
+        if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit {
+            notes.append("MTP stays off because this context exceeds its qualified window")
+        }
         func resolveMTP(slotsAfterCharge: Int) -> Bool {
+            if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit { return false }
             switch mtp {
             case .off: return false
             case .on: return true
@@ -769,13 +839,13 @@
 
         func finish(
             _ source: MemoryPlan.Source, _ slots: Int, target: Double?, mtpOn: Bool
-        ) -> MemoryPlan {
+        ) throws -> MemoryPlan {
             // An explicit pool knob states the cache size, not the whole budget,
             // so size the prefill pass from the pool the user asked for.
-            let mtpCharge = mtpOn ? mtpResidentGB : 0
+            let mtpCharge = mtpOn ? mtpResidentGB + mtpContextCharge : 0
             let budgetForCaches = target.map { poolBudgetGB($0) - mtpCharge - contextCharge }
                 ?? Geometry.gb(slots)
-            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches)
+            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens)
             let capped = min(slots, Geometry.totalRecords)
             let floored = max(capped, Geometry.floorSlots)
             if floored > capped {
@@ -784,7 +854,7 @@
                     Geometry.floorSlots, Geometry.perLayer(Geometry.floorSlots)))
             }
             let peak = Geometry.gb(floored) + fixedFootprintGB + prefillCostGB(chunk)
-                + prefixCacheGB(poolBudgetGB: budgetForCaches) + mtpCharge + contextCharge
+                + prefixCacheGB(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens) + mtpCharge + contextCharge
             if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                 notes.append(String(
                     format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
@@ -796,7 +866,7 @@
                     format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory (auto would size to the machine)",
                     a))
             }
-            return MemoryPlan(
+            let base = MemoryPlan(
                 source: source, slots: floored, targetGB: target,
                 ramGB: ram, workingSetGB: ws, ramPercent: pct,
                 availableGB: avail, clamped: clamped,
@@ -808,7 +878,19 @@
                 visionResidentReserved: visionResidentReserved,
                 maxContextTokens: maxContextTokens,
                 notes: notes,
-                simulated: simulated)
+                simulated: simulated, contextQualification: qualification)
+            let resolved = try runtimePolicy.map { try applyingRuntimePolicy(base, policy: $0) } ?? base
+            let bytes = resolved.memoryLedger.expectedPeakBytes
+            if maxContextTokens > ContextPolicy.defaultTokens || visionResidentReserved {
+                if let target, Double(bytes) > target * 1e9 {
+                    throw PlanError("insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target")
+                }
+                let physical = min(ws, (avail ?? ws) - availabilitySlackGB(ramGB: ram))
+                if Double(bytes) > physical * 1e9 {
+                    throw PlanError("insufficient_memory: requested context and expert pool exceed reclaimable memory with safety headroom or the Metal working set")
+                }
+            }
+            return resolved
         }
 
         if let n = expertsPerLayer {
@@ -816,7 +898,7 @@
             if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
             if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
             let slots = min(n, Geometry.expertsPerLayer) * Geometry.layers
-            return finish(.expertsPerLayer, slots, target: nil, mtpOn: resolveMTP(slotsAfterCharge: slots))
+            return try finish(.expertsPerLayer, slots, target: nil, mtpOn: resolveMTP(slotsAfterCharge: slots))
         }
         if let g = poolGB {
             guard g.isFinite, g > 0 else {
@@ -827,7 +909,7 @@
             // raised it; cap before Double->Int so huge finite input is safe.
             let requested = g >= Geometry.gb(Geometry.totalRecords)
                 ? Geometry.totalRecords : Int(g * 1e9 / Geometry.recordBytes)
-            return finish(.poolGB, requested, target: nil, mtpOn: resolveMTP(slotsAfterCharge: requested))
+            return try finish(.poolGB, requested, target: nil, mtpOn: resolveMTP(slotsAfterCharge: requested))
         }
         if let m = memoryGB {
             guard m.isFinite else { throw PlanError("--memory-gb must be finite") }
@@ -838,9 +920,6 @@
                     Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                     planningMarginGB))
             }
-            guard m - contextCharge >= minMemoryGB else {
-                throw PlanError("the target cannot fit the loaded vision tower and context above the text minimum; raise --memory-gb or use text only")
-            }
             if m > ws {
                 notes.append(String(
                     format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
@@ -852,17 +931,17 @@
                     a))
             }
             var mtpOn = resolveMTP(
-                slotsAfterCharge: slotsForTarget(max(m - mtpResidentGB - contextCharge, minMemoryGB)))
-            if mtpOn, m - mtpResidentGB - contextCharge < minMemoryGB {
+                slotsAfterCharge: slotsForTarget(max(m - mtpTotalCharge - contextCharge, minMemoryGB), contextCap: maxContextTokens))
+            if mtpOn, m - mtpTotalCharge - contextCharge < minMemoryGB {
                 if mtp == .on {
                     throw PlanError(String(
                         format: "--memory-gb %.1f cannot fit the %.1f GB draft head above the %.1f GB minimum — raise the target or drop --mtp on",
-                        m, mtpResidentGB, minMemoryGB))
+                        m, mtpTotalCharge, minMemoryGB))
                 }
                 mtpOn = false
             }
-            let slots = slotsForTarget(m - (mtpOn ? mtpResidentGB : 0) - contextCharge)
-            return finish(.memoryGB, slots, target: m, mtpOn: mtpOn)
+            let slots = slotsForTarget(m - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
+            return try finish(.memoryGB, slots, target: m, mtpOn: mtpOn)
         }
 
         // auto: the default. The draft head is worth its 1.6 GB only when the
@@ -870,6 +949,7 @@
         // past the decode knee that RAM buys nothing else — so when the head
         // is on, the ceiling rises by exactly its cost.
         let mtpWanted = mtp != .off && mtpAvailable
+            && (mtp == .on || maxContextTokens <= ContextPolicy.mtpLimit)
         func autoRaw(ceilingGB: Double) -> (Double, Bool) {
             let c = autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: ceilingGB)
             var raw = c
@@ -882,26 +962,26 @@
         }
         var mtpOn = false
         if mtpWanted {
-            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpResidentGB)
+            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpTotalCharge)
             let targetM = max(minMemoryGB, rawM)
-            let charged = targetM - mtpResidentGB - contextCharge
+            let charged = targetM - mtpTotalCharge - contextCharge
             mtpOn = charged >= minMemoryGB
                 && (mtp == .on
-                    || Geometry.perLayer(slotsForTarget(charged)) >= mtpAutoFloorPerLayer)
+                    || Geometry.perLayer(slotsForTarget(charged, contextCap: maxContextTokens)) >= mtpAutoFloorPerLayer)
+        }
+        if mtp == .on, !mtpOn {
+            throw PlanError("insufficient_memory: auto cannot keep the requested MTP head loaded at this context; close other apps or use --mtp off")
         }
         // `ceiling` is what this machine's auto would pick unclamped (the
         // notes below compare against it); the knee itself rises by the
         // head's cost when the head is on.
-        let kneeGB = usefulCeilingGB + (mtpOn ? mtpResidentGB : 0)
+        let kneeGB = usefulCeilingGB + (mtpOn ? mtpTotalCharge : 0)
         let ceiling = autoTargetGB(
             ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: kneeGB)
         let raw: Double
         (raw, clamped) = autoRaw(ceilingGB: kneeGB)
         let target = max(minMemoryGB, raw)
-        if maxContextTokens > ContextPolicy.defaultTokens, raw - contextCharge < minMemoryGB {
-            throw PlanError("available memory cannot fit the requested context above the minimum expert pool; close other apps or lower --max-context")
-        }
-        if mtpOn, target - mtpResidentGB - contextCharge < minMemoryGB { mtpOn = false }
+        if mtpOn, target - mtpTotalCharge - contextCharge < minMemoryGB { mtpOn = false }
         // Exactly one note tells the story of why the target is what it is.
         if raw < minMemoryGB, ceiling < minMemoryGB {
             notes.append(String(
@@ -924,8 +1004,8 @@
                 format: "this machine could hold more, but decode stops improving around here (measured 11.2 tok/s at 120 experts/layer, 11.6 at 150) — auto caps at %.1f GB rather than spend RAM for nothing; --memory-gb N to go further",
                 usefulCeilingGB))
         }
-        let slots = slotsForTarget(target - (mtpOn ? mtpResidentGB : 0) - contextCharge)
-        return finish(.auto, slots, target: target, mtpOn: mtpOn)
+        let slots = slotsForTarget(target - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
+        return try finish(.auto, slots, target: target, mtpOn: mtpOn)
     }
 
     /// Resolve the first image against the existing policy, before allocating
@@ -939,8 +1019,8 @@
                 ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB,
                 mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                 vision: .on, visionAvailable: true, visionResidentReserved: true,
-                maxContextTokens: p.maxContextTokens, simulated: p.simulated)
-            if let policy = p.runtimeAllocationPolicy { sized = try applyingRuntimePolicy(sized, policy: policy) }
+                maxContextTokens: p.maxContextTokens, simulated: p.simulated, qualification: p.contextQualification,
+                runtimePolicy: p.runtimeAllocationPolicy)
         } else { sized = p }
         // Loading a tower never justifies restoring capacity already donated
         // by the governor. Its original target can outlive a pressure shrink.
@@ -951,6 +1031,7 @@
             visionEnabled: true, visionResidentReserved: true,
             maxContextTokens: p.maxContextTokens,
             notes: p.notes + ["vision tower resident memory reserved before loading"], simulated: p.simulated,
-            runtimeAllocationPolicy: p.runtimeAllocationPolicy)
+            runtimeAllocationPolicy: p.runtimeAllocationPolicy,
+            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
     }
 }
--- a/Sources/Slotstream/PrefixCache.swift
+++ b/Sources/Slotstream/PrefixCache.swift
@@ -46,9 +46,10 @@
     package let optimizations: InferenceOptimizations
     package let prefillChunk: Int
     package let mtp: Bool
-    package init(model: UUID, optimizations: InferenceOptimizations, prefillChunk: Int, mtp: Bool) {
+    package let contextArithmetic: Int
+    package init(model: UUID, optimizations: InferenceOptimizations, prefillChunk: Int, mtp: Bool, contextArithmetic: Int = 0) {
         self.model = model; self.optimizations = optimizations
-        self.prefillChunk = prefillChunk; self.mtp = mtp
+        self.prefillChunk = prefillChunk; self.mtp = mtp; self.contextArithmetic = contextArithmetic
     }
 }
 
@@ -225,6 +226,22 @@
     public var heldTokens: Int {
         lock.lock(); defer { lock.unlock() }
         return entries.reduce(0) { $0 + $1.tokens.count }
+    }
+
+    /// Additional resident ownership beyond the one active baseline already
+    /// credited by the governor. Unallocated reservation never enters this sum.
+    public var ownedAdditionalBytes: Int { ownedAdditionalBytes(mtpResident: false) }
+
+    package func ownedAdditionalBytes(mtpResident: Bool) -> Int {
+        lock.withLock {
+            let held = entries.reduce(0) { total, entry in
+                total + entry.state.allocatedSequenceBytes + Self.fixedBytesPerEntry
+                    + (entry.lastLogits.map { $0.nbytes + Self.logitStorageSlackBytes } ?? 0)
+            }
+            let included = ContextGeometry.sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtpResident)
+                + Self.fixedBytesPerEntry
+            return max(0, held - included)
+        }
     }
 
     public var heldGB: Double {
--- a/Sources/Slotstream/PressureBoundary.swift
+++ b/Sources/Slotstream/PressureBoundary.swift
@@ -37,6 +37,14 @@
     package init() {}
     package func lock() { mutex.lock() }
     package func unlock() { mutex.unlock() }
+    package func lock(request: RequestController) throws {
+        while !mutex.try() {
+            try request.check(phase: "generation queue")
+            Thread.sleep(forTimeInterval: 0.005)
+        }
+        do { try request.check(phase: "generation queue") }
+        catch { mutex.unlock(); throw error }
+    }
     @discardableResult
     package func tryWithExclusive(_ body: () -> Void) -> Bool {
         guard mutex.try() else { return false }
--- /dev/null
+++ b/Sources/Slotstream/RequestControl.swift
@@ -0,0 +1,163 @@
+import Foundation
+
+public struct ContextConfiguration: Sendable, Equatable {
+    public static let defaultWaitMinutes = 30.0
+    public let maxContextTokens: Int
+    public let maxPrefillWaitMinutes: Double
+    /// Explicit diagnostic qualification, never inferred from a mutable cap.
+    public let qualification: Bool
+
+    public init(maxContextTokens: Int = ContextPolicy.defaultTokens,
+                maxPrefillWaitMinutes: Double = defaultWaitMinutes,
+                qualification: Bool = false) throws {
+        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) {
+            throw RequestFailure(.contextLengthExceeded, why)
+        }
+        guard maxPrefillWaitMinutes.isFinite, maxPrefillWaitMinutes >= 0,
+              maxPrefillWaitMinutes <= Double(UInt64.max) / 60 / 1e9 else {
+            throw RequestFailure(.invalidConfiguration,
+                "--max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy")
+        }
+        self.maxContextTokens = maxContextTokens
+        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
+        self.qualification = qualification
+    }
+}
+
+public struct RequestFailure: Error, CustomStringConvertible, Codable, Sendable, Equatable {
+    public enum Code: String, Codable, Sendable {
+        case contextLengthExceeded = "context_length_exceeded"
+        case invalidConfiguration = "invalid_configuration"
+        case prefillWaitExceeded = "prefill_wait_exceeded"
+        case insufficientMemory = "insufficient_memory"
+        case prefillDeadlineExceeded = "prefill_deadline_exceeded"
+        case clientCancelled = "client_cancelled"
+        case inferenceError = "inference_error"
+    }
+    public let code: Code
+    public let message: String
+    public var elapsedSeconds: Double?
+    public var limitSeconds: Double?
+    public var estimatedSeconds: Double?
+    public var requiredBytes: Int?
+    public var availableBytes: Int?
+    public init(_ code: Code, _ message: String) { self.code = code; self.message = message }
+    public var description: String { message }
+    public var httpStatus: String {
+        switch code {
+        case .contextLengthExceeded, .invalidConfiguration, .prefillWaitExceeded: return "400 Bad Request"
+        case .insufficientMemory, .prefillDeadlineExceeded: return "503 Service Unavailable"
+        case .clientCancelled: return "499 Client Closed Request"
+        case .inferenceError: return "500 Internal Server Error"
+        }
+    }
+    public var json: [String: Any] {
+        var result: [String: Any] = ["code": code.rawValue, "type": code.rawValue, "message": message]
+        if let elapsedSeconds { result["elapsed_seconds"] = elapsedSeconds }
+        if let limitSeconds { result["limit_seconds"] = limitSeconds }
+        if let estimatedSeconds { result["estimated_seconds"] = estimatedSeconds }
+        if let requiredBytes { result["required_bytes"] = requiredBytes }
+        if let availableBytes { result["available_bytes"] = availableBytes }
+        return result
+    }
+}
+
+/// One accepted request owns one monotonic clock, including all queue and
+/// preparation work. Neither transport activity nor prefix reuse restarts it.
+/// Injectable observations exercise refusal without stressing the machine.
+public final class RequestController: @unchecked Sendable {
+    public let configuration: ContextConfiguration
+    public let slackBytes: Int
+    private let clock: () -> UInt64
+    private let available: () -> Double?
+    private let connected: () -> Bool
+    private let pressure: () -> Bool
+    private let started: UInt64
+    private let lock = NSLock()
+    private var failureValue: RequestFailure?
+    private var firstToken = false
+    private var estimateValue: Double?
+    public var estimatedPrefillSeconds: Double? { lock.withLock { estimateValue } }
+
+    public init(configuration: ContextConfiguration, slackBytes: Int,
+                clock: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds },
+                availableGB: @escaping () -> Double? = { Planner.deviceAvailableGB() },
+                connected: @escaping () -> Bool = { true }, pressure: @escaping () -> Bool = { false }) {
+        self.configuration = configuration
+        self.slackBytes = max(0, slackBytes)
+        self.clock = clock; self.available = availableGB; self.connected = connected; self.pressure = pressure
+        started = clock()
+    }
+    public var elapsedSeconds: Double {
+        let now = clock()
+        return Double(now >= started ? now - started : 0) / 1e9
+    }
+    public var failure: RequestFailure? { lock.withLock { failureValue } }
+    public var mayRetainState: Bool { failure == nil }
+    @discardableResult public func fail(_ error: RequestFailure) -> RequestFailure {
+        lock.withLock {
+            if failureValue == nil { failureValue = error }
+            return failureValue!
+        }
+    }
+    public func cancel() { fail(RequestFailure(.clientCancelled, "the client cancelled this request")) }
+    public func sampledFirstToken() { lock.withLock { firstToken = true } }
+
+    /// Check before an allocation, not after it. Only actually reusable bytes
+    /// can be subtracted by callers; future reservations never authorize growth.
+    public func check(nextAllocationBytes: Int = 0, phase: String = "inference") throws {
+        if let failure { throw failure }
+        guard nextAllocationBytes >= 0 else {
+            throw fail(RequestFailure(.invalidConfiguration, "allocation byte count must be nonnegative"))
+        }
+        if !connected() { throw fail(RequestFailure(.clientCancelled, "the client disconnected during \(phase)")) }
+        let elapsed = elapsedSeconds
+        let seconds = configuration.maxPrefillWaitMinutes * 60
+        if seconds > 0, !lock.withLock({ firstToken }), elapsed >= seconds {
+            var error = RequestFailure(.prefillDeadlineExceeded,
+                "request-to-first-token deadline exceeded during \(phase); send less context or raise --max-prefill-wait")
+            error.elapsedSeconds = elapsed; error.limitSeconds = seconds
+            throw fail(error)
+        }
+        if pressure() {
+            throw fail(RequestFailure(.insufficientMemory, "memory pressure interrupted \(phase); retry after memory becomes available"))
+        }
+        let (required, overflow) = max(0, nextAllocationBytes).addingReportingOverflow(slackBytes)
+        guard !overflow else { throw fail(RequestFailure(.insufficientMemory, "allocation size exceeds the supported memory range")) }
+        let reading = available()
+        if let gb = reading, gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
+            let bytes = Int(gb * 1e9)
+            if bytes < required {
+                var error = RequestFailure(.insufficientMemory,
+                    "insufficient reclaimable memory for \(phase) and safety headroom; close other apps or lower the memory/context target")
+                error.requiredBytes = required; error.availableBytes = bytes
+                throw fail(error)
+            }
+        } else if configuration.maxContextTokens > ContextPolicy.defaultTokens && nextAllocationBytes > 0 {
+            throw fail(RequestFailure(.insufficientMemory,
+                "reclaimable memory is unreadable; refusing additional long-context allocation during \(phase)"))
+        }
+    }
+
+    /// Conservative temporary-copy allowance for templating/tokenization.
+    /// Counting input must not itself serialize an arbitrarily large value.
+    public func checkInputBytes(_ bytes: Int) throws {
+        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid input byte count")) }
+        try check(nextAllocationBytes: ContextBytes.product(bytes, 16), phase: "prompt tokenization")
+    }
+
+    public func admit(missingTokens: Int, from position: Int, maxChunk: Int,
+                      tailAware: Bool = false) throws {
+        try check(phase: "admission")
+        let estimate = PrefillSchedule.estimateSeconds(tokens: missingTokens, from: position,
+            maxChunk: maxChunk, tailAware: tailAware)
+        lock.withLock { estimateValue = estimate }
+        let limit = configuration.maxPrefillWaitMinutes * 60
+        if limit > 0, let estimate, elapsedSeconds + estimate > limit {
+            var error = RequestFailure(.prefillWaitExceeded,
+                "estimated missing-context prefill exceeds the remaining wait budget; send less, reuse a valid prefix, or raise --max-prefill-wait")
+            error.elapsedSeconds = elapsedSeconds; error.limitSeconds = limit; error.estimatedSeconds = estimate
+            throw fail(error)
+        }
+    }
+}
--- a/Sources/Slotstream/Server.swift
+++ b/Sources/Slotstream/Server.swift
@@ -31,6 +31,21 @@
         let output = BoundedOutput(fd: fd)
         outputObserver?(fd, output)
         return output
+    }
+
+    private func requestRefusal(_ fd: Int32, _ error: Error, dialect: String, cors: String) {
+        let failure = error as? RequestFailure
+            ?? RequestFailure(.invalidConfiguration, String(describing: error))
+        guard failure.code != .clientCancelled else { return }
+        let body: [String: Any]
+        if dialect == "ollama" {
+            body = ["error": failure.message, "code": failure.code.rawValue, "details": failure.json]
+        } else if dialect == "gateway" {
+            var gateway = GatewayDialect.Failure(failure.code.rawValue, failure.message).body
+            gateway["details"] = failure.json
+            body = gateway
+        } else { body = ["error": failure.json] }
+        respondJSON(fd, body, status: failure.httpStatus, cors: cors)
     }
 
     public init(engine: Engine, port: UInt16, weightsBytes: Int = 0, listenFD: Int32 = -1) {
@@ -353,6 +368,21 @@
             _ = send(fd, Data(head.utf8))
             return
         }
+        let path = Self.routePath(req.path)
+        let inferencePaths = ["/api/chat", "/api/generate", "/v1/chat/completions",
+                              "/v3/ai/language-model", "/v1/ai/language-model"]
+        let control: RequestController?
+        if req.method == "POST", inferencePaths.contains(path) {
+            let dialect = path == "/v1/chat/completions" ? "openai"
+                : path.hasSuffix("/language-model") ? "gateway" : "ollama"
+            do {
+                let accepted = try engine.beginRequest(connected: { self.peerAlive(fd) })
+                // Upload is complete. Parsing, validation, templating and
+                // queueing now share this one clock and allocation guard.
+                try accepted.check(nextAllocationBytes: ContextBytes.product(req.body.count, 16), phase: "request decoding")
+                control = accepted
+            } catch { requestRefusal(fd, error, dialect: dialect, cors: cors); return }
+        } else { control = nil }
         let parsed = (try? JSONSerialization.jsonObject(with: req.body)) as? [String: Any]
         if req.method == "POST", !req.body.isEmpty, parsed == nil {
             respondJSON(
@@ -360,7 +390,15 @@
             return
         }
         let json = parsed ?? [:]
-        let path = Self.routePath(req.path)
+        if let control {
+            switch path {
+            case "/api/chat": apiChat(fd, json, cors: cors, control: control)
+            case "/api/generate": apiGenerate(fd, json, cors: cors, control: control)
+            case "/v1/chat/completions": v1Chat(fd, json, cors: cors, control: control)
+            default: gatewayChat(fd, json, headers: req.headers, cors: cors, control: control)
+            }
+            return
+        }
         switch (req.method, path) {
         case ("GET", "/api/version"):
             respondJSON(fd, ["version": SlotstreamBuild.version], cors: cors)
@@ -412,26 +450,18 @@
                         + (engine.visionAllowed && engine.visionAvailable ? ["vision"] : []),
                     "template": "{{ .Prompt }}",
                     "details": modelDetails(live: true),
+                    "context_policy": engine.contextPolicyJSON,
                     "model_info": [
                         "general.architecture": "qwen4_exp",
                         "general.parameter_count": 176_000_000_000,
                         "qwen4_exp.context_length": engine.maxContextTokens,
                     ],
                 ], cors: cors)
-        case ("POST", "/api/chat"):
-            apiChat(fd, json, cors: cors)
-        case ("POST", "/api/generate"):
-            apiGenerate(fd, json, cors: cors)
-        case ("POST", "/v1/chat/completions"):
-            v1Chat(fd, json, cors: cors)
-        case ("POST", "/v3/ai/language-model"), ("POST", "/v1/ai/language-model"):
-            gatewayChat(fd, json, headers: req.headers, cors: cors)
         case ("GET", "/coding-agent/v1/models"):
-            respondJSON(
-                fd,
-                GatewayDialect.catalog(
-                    modelID: gatewayModelID, contextCap: engine.maxContextTokens,
-                    vision: engine.visionAllowed && engine.visionAvailable), cors: cors)
+            var catalog = GatewayDialect.catalog(modelID: gatewayModelID, contextCap: engine.maxContextTokens,
+                vision: engine.visionAllowed && engine.visionAvailable)
+            catalog["context_policy"] = engine.contextPolicyJSON
+            respondJSON(fd, catalog, cors: cors)
         case ("GET", "/coding-agent/v1/credits"):
             // fx shows a balance for the gateway provider. A local model has no
             // billing; zero is the honest answer and keeps `fx credits` working.
@@ -446,6 +476,7 @@
                         "created": startedAt, "owned_by": "slotstream",
                         "context_length": engine.maxContextTokens,
                         "context_window": engine.maxContextTokens,
+                        "context_policy": engine.contextPolicyJSON,
                         "max_output_tokens": GatewayDialect.outputBudget(contextCap: engine.maxContextTokens),
                     ]],
                 ], cors: cors)
@@ -884,7 +915,7 @@
 
     // MARK: /api/chat
 
-    private func apiChat(_ fd: Int32, _ rawJSON: [String: Any], cors: String) {
+    private func apiChat(_ fd: Int32, _ rawJSON: [String: Any], cors: String, control: RequestController) {
         let json = Self.withoutNulls(rawJSON)
         if let e = ollamaValidationError(
             json, allowed: ["model", "messages", "stream", "think", "options", "keep_alive"],
@@ -919,9 +950,9 @@
         let vision: VisionPrompt?
         do {
             (ids, vision) = try engine.encodeWithVision(
-                messages: templateMsgs, tools: nil, thinking: thinking)
+                messages: templateMsgs, tools: nil, thinking: thinking, request: control)
         } catch {
-            respondJSON(fd, ["error": "\(error)"], status: "400 Bad Request", cors: cors)
+            requestRefusal(fd, error, dialect: "ollama", cors: cors)
             return
         }
         if let e = engine.contextError(promptTokens: ids.count) {
@@ -929,7 +960,7 @@
             return
         }
         let t0 = RuntimeClock.now()
-        if stream, !startChunked(fd, contentType: "application/x-ndjson", cors: cors) { return }
+        var headersStarted = false
         // With think on, the model reasons first and closes with `</think>`.
         // Ollama carries that in message.thinking; leaving it in the answer
         // handed clients the reasoning and a stray closing tag.
@@ -960,13 +991,17 @@
         } : nil
         let (text, benchmarkOutputIds, stats) = engine.generate(
             promptIds: ids, params: params, vision: vision,
-            shouldContinue: { alive && (output?.alive ?? true) && self.peerAlive(fd) }, onToken: callback)
+            shouldContinue: { alive && (output?.alive ?? true) && self.peerAlive(fd) }, onToken: callback, request: control, onAdmitted: {
+                guard stream else { return true }
+                headersStarted = self.startChunked(fd, contentType: "application/x-ndjson", cors: cors)
+                return headersStarted
+            })
         if let error = stats.runtimeError {
-            let failure: [String: Any] = ["error": error]
-            if stream {
+            let failure: [String: Any] = ["error": error, "code": stats.requestFailure?.code.rawValue ?? "inference_error"]
+            if headersStarted {
                 if alive { writeChunk((try! JSONSerialization.data(withJSONObject: failure)) + Data("\n".utf8)) }
                 endOutput()
-            } else if alive { respondJSON(fd, failure, status: "500 Internal Server Error", cors: cors) }
+            } else if alive { requestRefusal(fd, stats.requestFailure ?? RequestFailure(.inferenceError, error), dialect: "ollama", cors: cors) }
             return
         }
         var finalMessage: [String: Any] = ["role": "assistant"]
@@ -1004,7 +1039,7 @@
 
     // MARK: /api/generate
 
-    private func apiGenerate(_ fd: Int32, _ rawJSON: [String: Any], cors: String) {
+    private func apiGenerate(_ fd: Int32, _ rawJSON: [String: Any], cors: String, control: RequestController) {
         let json = Self.withoutNulls(rawJSON)
         if let e = ollamaValidationError(
             json,
@@ -1107,6 +1142,8 @@
         let ids: [Int]
         var vision: VisionPrompt?
         if raw {
+            do { try control.checkInputBytes(prompt.utf8.count) }
+            catch { requestRefusal(fd, error, dialect: "ollama", cors: cors); return }
             ids = engine.tokenizer.encode(text: prompt)
         } else {
             var messages: [[String: Any]] = []
@@ -1119,9 +1156,9 @@
             do {
                 (ids, vision) = try engine.encodeWithVision(
                     messages: Self.templateMessages(["messages": messages]), tools: nil,
-                    thinking: thinking)
+                    thinking: thinking, request: control)
             } catch {
-                respondJSON(fd, ["error": "\(error)"], status: "400 Bad Request", cors: cors)
+                requestRefusal(fd, error, dialect: "ollama", cors: cors)
                 return
             }
         }
@@ -1138,7 +1175,7 @@
             return
         }
         let t0 = RuntimeClock.now()
-        if stream, !startChunked(fd, contentType: "application/x-ndjson", cors: cors) { return }
+        var headersStarted = false
         let splitter = thinking ? ThinkSplitter() : nil
         let output = makeOutput(fd, streaming: stream)
         defer { output?.finish() }
@@ -1165,13 +1202,17 @@
         } : nil
         let (text, benchmarkOutputIds, stats) = engine.generate(
             promptIds: ids, params: params, vision: vision,
-            shouldContinue: { alive && (output?.alive ?? true) && self.peerAlive(fd) }, onToken: callback)
+            shouldContinue: { alive && (output?.alive ?? true) && self.peerAlive(fd) }, onToken: callback, request: control, onAdmitted: {
+                guard stream else { return true }
+                headersStarted = self.startChunked(fd, contentType: "application/x-ndjson", cors: cors)
+                return headersStarted
+            })
         if let error = stats.runtimeError {
-            let failure: [String: Any] = ["error": error]
-            if stream {
+            let failure: [String: Any] = ["error": error, "code": stats.requestFailure?.code.rawValue ?? "inference_error"]
+            if headersStarted {
                 if alive { writeChunk((try! JSONSerialization.data(withJSONObject: failure)) + Data("\n".utf8)) }
                 endOutput()
-            } else if alive { respondJSON(fd, failure, status: "500 Internal Server Error", cors: cors) }
+            } else if alive { requestRefusal(fd, stats.requestFailure ?? RequestFailure(.inferenceError, error), dialect: "ollama", cors: cors) }
             return
         }
         var finalResponse = stream ? "" : text
@@ -1214,7 +1255,7 @@
     var gatewayModelID: String { "slotstream/" + engine.modelName }
 
     private func gatewayChat(
-        _ fd: Int32, _ rawJSON: [String: Any], headers: [String: String], cors: String
+        _ fd: Int32, _ rawJSON: [String: Any], headers: [String: String], cors: String, control: RequestController
     ) {
         func fail(_ f: GatewayDialect.Failure) {
             respondJSON(fd, f.body, status: "400 Bad Request", cors: cors)
@@ -1249,12 +1290,15 @@
             if messages.contains(where: { !$0.images.isEmpty }) {
                 (ids, vision) = try engine.encodeChatWithVision(
                     messages, tools: renderTools, thinking: request.reasoning.thinking,
-                    effort: request.reasoning.effort)
+                    effort: request.reasoning.effort, request: control)
             } else {
+                try control.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: renderTools))
                 ids = try engine.encodeChatSpliced(
                     messages, tools: renderTools, thinking: request.reasoning.thinking,
                     effort: request.reasoning.effort)
             }
+        } catch let failure as RequestFailure {
+            requestRefusal(fd, failure, dialect: "gateway", cors: cors); return
         } catch let e as SlotstreamError {
             return fail(GatewayDialect.Failure("invalid_image", "\(e)"))
         } catch {
@@ -1287,7 +1331,7 @@
         // The head goes out before generation begins. fx allows 30 s for the
         // head and no time at all for the stream, and a cold 6k-token prefill
         // is minutes; every failure that can be detected has been by now.
-        guard startChunked(fd, contentType: "text/event-stream", cors: cors) else { return }
+        var headersStarted = false
         let output = makeOutput(fd)
         defer { output?.finish() }
         @discardableResult func writeChunk(_ data: Data) -> Bool { self.chunk(fd, data, writer: output) }
@@ -1297,13 +1341,7 @@
             guard alive else { return }
             alive = writeChunk(Data(text.utf8))
         }
-        emit(GatewayDialect.frame(["type": "stream-start", "warnings": []]))
-        emit(
-            GatewayDialect.frame([
-                "type": "response-metadata",
-                "id": "gen_" + String(format: "%08x", UInt32.random(in: 0...UInt32.max)),
-                "modelId": gatewayModelID, "timestamp": iso(Date()),
-            ]))
+
 
         let thinkSplitter = request.reasoning.thinking ? ThinkSplitter() : nil
         let toolSplitter = ToolCallSplitter(tools: renderTools.map { $0.schema })
@@ -1397,16 +1435,30 @@
                 // prompt would otherwise send no bytes at all and trip this
                 // server's own 120 s send timeout; fx skips comment lines by
                 // design, so the keepalive costs the client nothing.
-                if !produced, RuntimeClock.seconds(since: lastKeepalive) >= 10 {
+                if headersStarted, !produced, RuntimeClock.seconds(since: lastKeepalive) >= 10 {
                     lastKeepalive = RuntimeClock.now()
                     alive = writeChunk(Data(GatewayDialect.keepalive.utf8))
                 }
                 return alive && (output?.alive ?? true) && self.peerAlive(fd)
-            }, onToken: callback)
+            }, onToken: callback, request: control, onAdmitted: {
+                headersStarted = self.startChunked(fd, contentType: "text/event-stream", cors: cors)
+                guard headersStarted else { return false }
+        emit(GatewayDialect.frame(["type": "stream-start", "warnings": []]))
+        emit(
+            GatewayDialect.frame([
+                "type": "response-metadata",
+                "id": "gen_" + String(format: "%08x", UInt32.random(in: 0...UInt32.max)),
+                "modelId": self.gatewayModelID, "timestamp": self.iso(Date()),
+            ]))
+                return alive
+            })
 
         if let error = stats.runtimeError {
-            emit(GatewayDialect.frame(["type": "error", "error": ["message": error, "type": "inference_error"]]))
-            endOutput()
+            if headersStarted {
+                emit(GatewayDialect.frame(["type": "error", "error": stats.requestFailure?.json
+                    ?? ["message": error, "type": "inference_error"]]))
+                endOutput()
+            } else { requestRefusal(fd, stats.requestFailure ?? RequestFailure(.inferenceError, error), dialect: "gateway", cors: cors) }
             return
         }
         if let ts = thinkSplitter {
@@ -1465,7 +1517,7 @@
 
     // MARK: /v1/chat/completions (OpenAI, SSE streaming)
 
-    private func v1Chat(_ fd: Int32, _ rawJSON: [String: Any], cors: String) {
+    private func v1Chat(_ fd: Int32, _ rawJSON: [String: Any], cors: String, control: RequestController) {
         let json = Self.withoutNulls(rawJSON)
         func fail(_ message: String, status: String = "400 Bad Request", code: String = "invalid_request_error") {
             respondJSON(fd, ["error": ["message": message, "type": code]], status: status, cors: cors)
@@ -1494,18 +1546,19 @@
         do {
             if !extended {
                 // Preserve existing plain-chat/vision templating and sampling.
-                (ids, vision) = try engine.encodeWithVision(messages: Self.templateMessages(json), tools: nil, thinking: false)
+                (ids, vision) = try engine.encodeWithVision(messages: Self.templateMessages(json), tools: nil, thinking: false, request: control)
             } else if messages.contains(where: { !$0.images.isEmpty }) {
                 (ids, vision) = try engine.encodeChatWithVision(messages, tools: renderTools,
-                    thinking: request.thinking, effort: request.effort)
+                    thinking: request.thinking, effort: request.effort, request: control)
             } else {
+                try control.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: renderTools))
                 ids = try engine.encodeChatSpliced(messages, tools: renderTools,
                     thinking: request.thinking, effort: request.effort)
             }
-        } catch { return fail("\(error)") }
-        if let error = engine.contextError(promptTokens: ids.count) { return fail(error) }
+        } catch { requestRefusal(fd, error, dialect: "openai", cors: cors); return }
+        if let error = engine.contextError(promptTokens: ids.count) { return fail(error, code: "context_length_exceeded") }
         guard ids.count < request.contextLimit else {
-            return fail("prompt is \(ids.count) tokens, leaving no reply room in the requested context limit \(request.contextLimit)")
+            return fail("prompt is \(ids.count) tokens, leaving no reply room in the requested context limit \(request.contextLimit)", code: "context_length_exceeded")
         }
         var params = renderTools.isEmpty ? (request.thinking ? SampleParams.thinking : .instruct) : .agent
         if let v = Self.num(json["temperature"]) { params.temperature = Float(v) }
@@ -1522,7 +1575,7 @@
         let wantUsage = Self.bool((json["stream_options"] as? [String: Any])?["include_usage"]) ?? false
         let rid = "chatcmpl-\(UUID().uuidString)"
         let created = Int(Date().timeIntervalSince1970)
-        if stream, !startChunked(fd, contentType: "text/event-stream", cors: cors) { return }
+        var headersStarted = false
         let output = makeOutput(fd, streaming: stream)
         defer { output?.finish() }
         @discardableResult func writeChunk(_ data: Data) -> Bool { self.chunk(fd, data, writer: output) }
@@ -1565,13 +1618,24 @@
         var lastKeepalive = RuntimeClock.now()
         let (text, _, stats) = engine.generate(promptIds: ids, params: params, vision: vision,
             shouldContinue: {
-                if stream && RuntimeClock.seconds(since: lastKeepalive) >= 10 {
+                if headersStarted && RuntimeClock.seconds(since: lastKeepalive) >= 10 {
                     lastKeepalive = RuntimeClock.now()
                     alive = writeChunk(Data(": keepalive\n\n".utf8))
                 }
                 return alive && (output?.alive ?? true) && self.peerAlive(fd)
                     && accumulated.error == nil && !accumulated.finishedSingleCall
-            }, onToken: callback)
+            }, onToken: callback, request: control, onAdmitted: {
+                guard stream else { return true }
+                headersStarted = self.startChunked(fd, contentType: "text/event-stream", cors: cors)
+                return headersStarted
+            })
+        if let error = stats.runtimeError {
+            if headersStarted {
+                emit(["error": stats.requestFailure?.json ?? RequestFailure(.inferenceError, error).json])
+                endOutput()
+            } else { requestRefusal(fd, stats.requestFailure ?? RequestFailure(.inferenceError, error), dialect: "openai", cors: cors) }
+            return
+        }
         if !incremental { consume(text) }
         if let thinker {
             let (reasoning, body) = thinker.flush()
--- a/Sources/Slotstream/Vision.swift
+++ b/Sources/Slotstream/Vision.swift
@@ -196,7 +196,7 @@
 
     /// Metadata admission precedes CGImage creation and EXIF rotation. The
     /// returned charge lets a caller enforce one budget across all images.
-    package static func decodeCGImage(_ data: Data, maximumDecodedBytes: Int) throws -> (image: CGImage, charge: Int) {
+    package static func decodeCGImage(_ data: Data, maximumDecodedBytes: Int, request: RequestController? = nil) throws -> (image: CGImage, charge: Int) {
         guard !data.isEmpty, data.count <= maxImageBytes else {
             throw VisionError.msg("encoded image exceeds the 24 MiB limit or is empty")
         }
@@ -220,6 +220,7 @@
         guard charge <= maximumDecodedBytes else {
             throw VisionError.msg("images together exceed the 1 GiB decoded-source budget; resize them before sending")
         }
+        try request?.check(nextAllocationBytes: charge, phase: "source pixel allocation")
         guard let cg = CGImageSourceCreateImageAtIndex(src, 0, options) else {
             throw VisionError.msg("failed to decode image")
         }
@@ -430,13 +431,13 @@
         self.maximumBytes = max(0, min(maximumBytes, VisionPreprocess.maxDecodedImageBytes))
     }
 
-    package func decode(_ data: Data) throws -> (cg: CGImage, hash: ImageHash) {
+    package func decode(_ data: Data, request: RequestController? = nil) throws -> (cg: CGImage, hash: ImageHash) {
         let hash = ImageHash(hashing: data)
         if deduplicate, let (prior, image) = entries[hash], prior == data {
             reusedImages += 1
             return (image, hash)
         }
-        let result = try VisionPreprocess.decodeCGImage(data, maximumDecodedBytes: maximumBytes - chargedBytes)
+        let result = try VisionPreprocess.decodeCGImage(data, maximumDecodedBytes: maximumBytes - chargedBytes, request: request)
         chargedBytes += result.charge
         decodedImages += 1
         if deduplicate { entries[hash] = (data, result.image) }
@@ -498,10 +499,9 @@
         name.hasPrefix("vision_tower.") || name.hasPrefix("model.visual.")
     }
 
-    public init(index: CheckpointIndex) throws {
-        self.config = index.config
+    package static func configuration(directory: URL) throws -> (VisionConfig, (min: UInt32, max: UInt32)) {
         var vc = VisionConfig()
-        let data = try Data(contentsOf: index.dir.appendingPathComponent("config.json"))
+        let data = try Data(contentsOf: directory.appendingPathComponent("config.json"))
         if let root = try JSONSerialization.jsonObject(with: data) as? [String: Any], let v = root["vision_config"] as? [String: Any] {
             if let x = v["hidden_size"] as? Int { vc.hiddenSize = x }
             if let x = v["depth"] as? Int { vc.depth = x }
@@ -512,12 +512,11 @@
             if let x = v["out_hidden_size"] as? Int { vc.outHiddenSize = x }
             if let x = v["num_position_embeddings"] as? Int { vc.numPositionEmbeddings = x }
         }
-        self.vcfg = vc
         // The processor's own bounds. `size.shortest_edge` is min_pixels and
         // `size.longest_edge` is max_pixels in every Qwen*VL processor; the
         // engine cap is applied on top by `effectiveBounds`.
         var cfgMin: UInt32 = 0, cfgMax: UInt32 = 0
-        let procPath = index.dir.appendingPathComponent("preprocessor_config.json")
+        let procPath = directory.appendingPathComponent("preprocessor_config.json")
         if let pdata = try? Data(contentsOf: procPath),
             let proc = try? JSONSerialization.jsonObject(with: pdata) as? [String: Any],
             let size = proc["size"] as? [String: Any]
@@ -525,7 +524,14 @@
             if let v = size["shortest_edge"] as? Int, v > 0 { cfgMin = UInt32(clamping: v) }
             if let v = size["longest_edge"] as? Int, v > 0 { cfgMax = UInt32(clamping: v) }
         }
-        self.pixelBounds = VisionPreprocess.effectiveBounds(cfgMin: cfgMin, cfgMax: cfgMax)
+        return (vc, VisionPreprocess.effectiveBounds(cfgMin: cfgMin, cfgMax: cfgMax))
+    }
+
+    public init(index: CheckpointIndex) throws {
+        self.config = index.config
+        let (vc, bounds) = try Self.configuration(directory: index.dir)
+        self.vcfg = vc
+        self.pixelBounds = bounds
         var kept: [String: MLXArray] = [:]
         let files = Set(index.tensors.values.map { $0.file })
         for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
@@ -758,7 +764,8 @@
     /// its model-quality and request-memory gates are separate from algebra.
     private func attention(_ normed: MLXArray, _ blk: Block, cos: MLXArray, sin: MLXArray,
                            padding: Int, preserveQueryRounding: Bool = false,
-                           queryTile: Int = 0, onQueryTile: (() -> Void)? = nil) -> MLXArray {
+                           queryTile: Int = 0, onQueryTile: (() -> Void)? = nil,
+                           request: RequestController? = nil) throws -> MLXArray {
         let N = normed.dim(0)
         let heads = vcfg.numHeads
         let hd = vcfg.headDim
@@ -776,8 +783,8 @@
         let qh = applyRope(q).transposed(1, 0, 2).reshaped([1, heads, N, hd])
         let kh = applyRope(k).transposed(1, 0, 2).reshaped([1, heads, N, hd])
         let vh = v.transposed(1, 0, 2).reshaped([1, heads, N, hd])
-        let o = VisionAttention.apply(queries: qh, keys: kh, values: vh, padding: padding,
-            preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile)
+        let o = try VisionAttention.applyChecked(queries: qh, keys: kh, values: vh, padding: padding,
+            preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile, request: request)
         let ctt = o.reshaped([heads, N, hd]).transposed(1, 0, 2).reshaped([N, vcfg.hiddenSize])
         return dense(ctt, blk.projW, blk.projB)
     }
@@ -792,6 +799,17 @@
     package func forward(pixelValues: MLXArray, gridH: UInt32, gridW: UInt32,
                          attentionPadding: Int, preserveQueryRounding: Bool = false,
                          queryTile: Int = 0, onQueryTile: (() -> Void)? = nil) -> MLXArray {
+        checkpointCompatibility {
+            try forwardChecked(pixelValues: pixelValues, gridH: gridH, gridW: gridW,
+                attentionPadding: attentionPadding, preserveQueryRounding: preserveQueryRounding,
+                queryTile: queryTile, onQueryTile: onQueryTile)
+        }
+    }
+
+    private func forwardChecked(pixelValues: MLXArray, gridH: UInt32, gridW: UInt32,
+                         attentionPadding: Int, preserveQueryRounding: Bool = false,
+                         queryTile: Int = 0, onQueryTile: (() -> Void)? = nil,
+                         request: RequestController? = nil) throws -> MLXArray {
         let N = Int(gridH * gridW)
         var x = pixelValues.asType(.bfloat16)
         x = dense(x, patchW, patchB) // [N, hidden]
@@ -799,10 +817,13 @@
         x = x + pos
         let (cos, sin) = buildRope(gridH: gridH, gridW: gridW)
         for blk in blocks {
+            let workspace = ContextWorkspace.visionBytes(patches: N, hidden: vcfg.hiddenSize,
+                heads: vcfg.numHeads, queryTile: queryTile, padding: attentionPadding)
+            try request?.check(nextAllocationBytes: workspace, phase: "vision block")
             // attn
             let n1 = layerNorm(x, blk.norm1W, blk.norm1B)
-            let attnOut = attention(n1, blk, cos: cos, sin: sin, padding: attentionPadding,
-                preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile)
+            let attnOut = try attention(n1, blk, cos: cos, sin: sin, padding: attentionPadding,
+                preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile, request: request)
             x = x + attnOut
             // mlp
             let n2 = layerNorm(x, blk.norm2W, blk.norm2B)
@@ -898,10 +919,11 @@
 
     package func encodeChecked(_ cg: CGImage, plan p: ImagePlan, attentionPadding: Int,
                               preserveQueryRounding: Bool = false, queryTile: Int = 0,
-                              onQueryTile: (() -> Void)? = nil) throws -> MLXArray {
+                              onQueryTile: (() -> Void)? = nil, request: RequestController? = nil) throws -> MLXArray {
         guard queryTile == 0 || (queryTile == 256 && attentionPadding == 0 && !preserveQueryRounding) else {
             throw VisionError.msg("vision query tiling requires the independent 256-row original-attention path")
         }
+        try request?.check(nextAllocationBytes: Int(p.height) * Int(p.width) * 32, phase: "image normalization")
         let chw = try VisionPreprocess.resizeAndNormalizeChecked(cg: cg, targetH: p.height, targetW: p.width)
         let tps: UInt32 = UInt32(vcfg.temporalPatchSize)
         let pixelFlat = VisionPreprocess.buildPixelValues(
@@ -909,8 +931,8 @@
             merge: UInt32(vcfg.spatialMergeSize), tps: tps)
         let feat = 3 * Int(tps) * vcfg.patchSize * vcfg.patchSize
         let pv = MLXArray(pixelFlat, [p.patches, feat])
-        return forward(pixelValues: pv, gridH: p.gridH, gridW: p.gridW, attentionPadding: attentionPadding,
-            preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile)
+        return try forwardChecked(pixelValues: pv, gridH: p.gridH, gridW: p.gridW, attentionPadding: attentionPadding,
+            preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile, request: request)
     }
 
 }
--- a/Sources/Slotstream/VisionAttention.swift
+++ b/Sources/Slotstream/VisionAttention.swift
@@ -6,6 +6,15 @@
     package static func apply(queries q: MLXArray, keys k: MLXArray, values v: MLXArray,
                               padding: Int = 0, preserveQueryRounding: Bool = false,
                               queryTile: Int = 0, onQueryTile: (() -> Void)? = nil) -> MLXArray {
+        checkpointCompatibility {
+            try applyChecked(queries: q, keys: k, values: v, padding: padding,
+                preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile)
+        }
+    }
+
+    package static func applyChecked(queries q: MLXArray, keys k: MLXArray, values v: MLXArray,
+                              padding: Int = 0, preserveQueryRounding: Bool = false,
+                              queryTile: Int = 0, onQueryTile: (() -> Void)? = nil, request: RequestController? = nil) throws -> MLXArray {
         let width = q.dim(-1)
         let scale = 1 / Float(width).squareRoot()
         precondition(queryTile == 0 || (queryTile == 256 && padding == 0 && !preserveQueryRounding),
@@ -13,6 +22,7 @@
         if queryTile == 256, width == 72, q.ndim == 4, q.dim(2) > queryTile {
             var pieces: [MLXArray] = []
             for start in stride(from: 0, to: q.dim(2), by: queryTile) {
+                try request?.check(phase: "vision query tile")
                 let queries = q[0..., 0..., start..<min(start + queryTile, q.dim(2)), 0...]
                 let output = MLXFast.scaledDotProductAttention(queries: queries,
                     keys: k, values: v, scale: scale, mask: .none)
--- a/Sources/Slotstream/VisionPrompt.swift
+++ b/Sources/Slotstream/VisionPrompt.swift
@@ -163,7 +163,7 @@
     }
 
     package func runsChecked(consumedTokens reused: Int, deduplicate: Bool, attentionPadding: Int = 0,
-                             queryTile: Int = 0) throws -> [VisionRun] {
+                             queryTile: Int = 0, request: RequestController? = nil) throws -> [VisionRun] {
         encodedImages = 0; reusedImageFeatures = 0; prefixSkippedImages = 0
         executedQueryTiles = 0
         var features: [FeatureKey: MLXArray] = [:]
@@ -180,7 +180,7 @@
                 reusedImageFeatures += 1
             } else {
                 flat = try tower.encodeChecked(item.image, plan: item.plan, attentionPadding: attentionPadding,
-                    queryTile: queryTile, onQueryTile: { self.executedQueryTiles += 1 })
+                    queryTile: queryTile, onQueryTile: { self.executedQueryTiles += 1 }, request: request)
                     .reshaped([seg.count, hiddenSize])
                 encodedImages += 1
                 if deduplicate { features[key] = flat }
--- a/Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift
@@ -212,7 +212,8 @@
             let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                 shouldContinue: { running })
             c.equal("committed cancellation \(rounds): exact prefix", result.0, Array(a.0.prefix(result.0.count)))
-            c.equal("committed cancellation \(rounds): stop reason", result.1.finishReason, "stop")
+            c.equal("committed cancellation \(rounds): cancellation reason", result.1.finishReason, "cancelled")
+            c.equal("committed cancellation \(rounds): typed cancellation", result.1.requestFailure?.code, .clientCancelled)
             c.equal("committed cancellation \(rounds): no unrequested fallback", result.1.adaptivePlainTokens, 0)
             if let state = cache.take(matching: prompt + result.0 + [907], reserveTokens: 32)?.state {
                 c.equal("committed cancellation \(rounds): pending output accounting", state.tokenCount, prompt.count + result.0.count - 1)
--- a/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift
@@ -107,7 +107,7 @@
                 }
                 let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                     shouldContinue: { false })
-                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "stop")
+                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                 c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                 let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                 c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
--- /dev/null
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift
@@ -0,0 +1,267 @@
+import Foundation
+import Slotstream
+
+extension Diagnostics {
+    public static func configurableContext() throws -> CheckReport {
+        var c = CheckBuilder("configurable-context")
+        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
+                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
+        for cap in caps {
+            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
+            // Independent allocator geometry, not a restatement of a helper call.
+            let rows = ((cap + 1023) / 1024) * 1024
+            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
+            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
+                    rows * 13 * (2 * 2 * 256 + 128) * 2)
+        }
+        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
+        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
+        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
+        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
+        for cap in caps {
+            for target in [8.1, 10, 16, 24, 33] {
+                for mtp in [Planner.MTPMode.off, .on, .auto] {
+                    do {
+                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
+                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
+                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
+                            simulated: true, qualification: true)
+                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
+                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
+                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
+                    } catch {
+                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
+                    }
+                }
+            }
+        }
+        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
+            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
+        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
+            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
+            maxContextTokens: 1024, simulated: true)
+        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
+        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
+        for target in [8.1, 10, 16, 24, 33] {
+            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
+            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
+            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
+            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
+                let next = result.maximumFeasibleWindow + 1
+                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
+                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
+                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
+                c.expect("next solver token refused at \(target)", p == nil)
+            }
+        }
+        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
+            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
+                let count = ContextPolicy.modelLimit - start
+                var position = start
+                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
+                var bounded = !passes.isEmpty
+                for n in passes {
+                    bounded = bounded && n > 0 && n <= chunk
+                        && n * (position + n) <= 4096 * 8016
+                    position += n
+                }
+                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
+            }
+        }
+        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
+        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
+        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
+
+        var tick: UInt64 = 0
+        var available = 10.0
+        var connected = true
+        var pressure = false
+        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
+            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
+                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
+                connected: { connected }, pressure: { pressure })
+        }
+        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
+            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
+        }
+        let estimated = try controller()
+        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
+        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
+        let reused = try controller()
+        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
+        c.expect("fast continuation admits from its real position", reused.failure == nil)
+        tick = 61_000_000_000
+        do { try reused.check(phase: "image preparation") } catch {}
+        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
+        tick = 0
+        let queue = try controller()
+        tick = 61_000_000_000
+        do { try queue.check(phase: "queue") } catch {}
+        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
+        tick = 0
+        let decoding = try controller()
+        decoding.sampledFirstToken(); tick = 61_000_000_000
+        try decoding.check(phase: "decode")
+        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
+        let timeless = try controller(wait: 0)
+        tick += 100_000_000_000; try timeless.check()
+        available = 1
+        do { try timeless.check(nextAllocationBytes: 1) } catch {}
+        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
+        available = 3
+        let growth = try controller(wait: 0)
+        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
+        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
+        available = 10; pressure = true
+        let pressed = try controller(wait: 0)
+        do { try pressed.check() } catch {}
+        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
+        pressure = false; connected = false
+        let cancelled = try controller()
+        do { try cancelled.check() } catch {}
+        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
+        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
+        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
+            slackBytes: 1_500_000_000, availableGB: { nil })
+        do { try unknown.check(nextAllocationBytes: 1) } catch {}
+        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
+        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
+            workingSetGB: 40.2, maxContextTokens: 65536)
+        let empty = GovernorPolicy.desiredPlan(governor)
+        governor.ownedAdditionalBytes = 1_000_000_000
+        let owned = GovernorPolicy.desiredPlan(governor)
+        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
+        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
+        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
+        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
+        governor.ownedAdditionalBytes = 0
+        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
+        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
+            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
+        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
+        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
+        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
+        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
+        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
+        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
+            for position in [0, 32768, 65535, 65536] {
+                c.expect("ordinary window preserves original floor/\(override)/\(position)",
+                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
+            }
+        }
+        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
+            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
+        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
+            context: 256, minimumProjectionRows: 257), Int.max)
+        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
+        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
+            context: 448, referenceEnd: 470), 470)
+        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
+            context: 81, referenceStart: 17, referenceEnd: 515), 273)
+        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
+            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
+        for origin in [0, 1, 17, 130001, 131073] {
+            var position = max(origin, 256273), total = 0
+            while position < ContextPolicy.modelLimit {
+                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
+                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
+                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
+                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
+                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
+                c.expect("actual padded product stays bounded/\(origin)/\(position)",
+                    n * extent <= PrefillSchedule.measuredQueryKeyProduct)
+                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
+                    n <= 256 - ((position - origin) % 256))
+                position += n; total += n
+            }
+            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
+        }
+        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
+            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
+        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
+        for prefix in [false, true] {
+            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
+            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
+                on: machine, runtimePolicy: policy, qualification: true)
+            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
+            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
+                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
+                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
+                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
+                    simulated: true, qualification: true, runtimePolicy: policy)
+                c.expect("same-policy next token fails \(prefix)", next == nil)
+            }
+        }
+        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
+            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
+        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
+            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
+        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
+        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
+        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
+        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
+        var nested = JSONValue.string("payload")
+        for _ in 0 ..< 64 { nested = .array([nested]) }
+        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
+        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
+        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
+        // Freeze a whole-machine reading, then account for what an existing
+        // instance actually owns. Restart planning and a settled governor
+        // must agree across cap, retention, mode and availability changes.
+        var governorCaps = Set<Int>()
+        for cap in [8192, 32768, 65536, 131072, 262144] {
+            for prefix in [false, true] {
+                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
+                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
+                    for whole in [10.0, 18.0, 44.0] {
+                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
+                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
+                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
+                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
+                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
+                            visionResidentReserved: mode == 2, maxContextTokens: cap,
+                            qualification: true, runtimePolicy: policy)
+                        guard let initial else { continue }
+                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
+                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
+                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
+                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
+                            - (mode == 1 ? Planner.mtpResidentGB : 0)
+                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
+                        guard physical >= 0 else { continue }
+                        governorCaps.insert(cap)
+                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
+                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
+                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
+                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
+                            ownedAdditionalBytes: owned, contextQualification: true)
+                        let settled = GovernorPolicy.desiredPlan(input)
+                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
+                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
+                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
+                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
+                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
+                        input.pressure = .critical
+                        let decision = GovernorPolicy.decide(input)
+                        if case .resize(let slots, _) = decision {
+                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
+                            input.availableGB += Geometry.gb(input.currentSlots - slots)
+                            input.currentSlots = slots
+                        }
+                        input.pressure = nil; input.secondsSincePressure = 1
+                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
+                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
+                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
+                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
+                            input.currentSlots = slots
+                        }
+                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
+                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
+                    }
+                }
+            }
+        }
+        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
+        return c.report()
+    }
+}
--- /dev/null
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift
@@ -0,0 +1,280 @@
+import Darwin
+import Foundation
+import MLX
+import Slotstream
+
+extension Diagnostics {
+    /// Fake observations through real handlers, GPU work and cleanup. A single
+    /// floor pool serves every case; no simulated value authorizes more memory.
+    public static func contextServing(modelDir: URL) async throws -> CheckReport {
+        let plan = try Planner.plan(expertsPerLayer: nil, poolGB: 1.769472, memoryGB: nil,
+            mtp: .off, vision: .off, maxContextTokens: 65536)
+        let engine = try await Engine(modelDir: modelDir, plan: plan)
+        engine.generator.speculationEnabled = false
+        engine.generator.prefillChunk = 256
+        engine.generator.prefillCacheLimit = 64 << 20
+        let server = Server(engine: engine, port: 0)
+        signal(SIGPIPE, SIG_IGN)
+        var c = CheckBuilder("context-serving")
+        defer {
+            engine.requestControllerOverride = nil; engine.model.routerObserver = nil
+            if let ticket = engine.pressureBoundary.snapshot() { engine.pressureBoundary.acknowledge(ticket) }
+        }
+        func exchange(_ path: String,_ object: [String:Any]?) throws -> (head: String,body: String) {
+            let payload = try object.map { try JSONSerialization.data(withJSONObject: $0) } ?? Data()
+            var fds: [Int32] = [-1,-1]
+            guard socketpair(AF_UNIX,SOCK_STREAM,0,&fds)==0 else { throw ModelError("socketpair failed") }
+            let client = fds[0], peer = fds[1]
+            var timeout = timeval(tv_sec: 30,tv_usec: 0), one: Int32 = 1
+            for fd in fds {
+                setsockopt(fd,SOL_SOCKET,SO_RCVTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
+                setsockopt(fd,SOL_SOCKET,SO_SNDTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
+                setsockopt(fd,SOL_SOCKET,SO_NOSIGPIPE,&one,socklen_t(MemoryLayout<Int32>.size))
+            }
+            let finished = DispatchSemaphore(value: 0)
+            Thread.detachNewThread { server.handle(peer); finished.signal() }
+            defer { shutdown(client,SHUT_RDWR); close(client) }
+            let method = object == nil ? "GET" : "POST"
+            let head = "\(method) \(path) HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: \(payload.count)\r\nConnection: close\r\n\r\n"
+            let request = Data(head.utf8)+payload
+            var wire = Data()
+            do {
+                try request.withUnsafeBytes { buffer in
+                    var sent = 0
+                    while sent < buffer.count {
+                        let n = Darwin.send(client,buffer.baseAddress!+sent,buffer.count-sent,0)
+                        if n<0 && errno==EINTR { continue }
+                        guard n>0 else { throw ModelError("request write failed") }
+                        sent += n
+                    }
+                }
+                var buffer = [UInt8](repeating: 0,count: 8192)
+                while true {
+                    let n = recv(client,&buffer,buffer.count,0)
+                    if n<0 && errno==EINTR { continue }
+                    guard n>=0 else { throw ModelError("response read failed or timed out") }
+                    if n==0 { break }
+                    wire.append(contentsOf: buffer.prefix(n))
+                    guard wire.count <= 1<<20 else { throw ModelError("response exceeds diagnostic bound") }
+                }
+            } catch {
+                shutdown(client,SHUT_RDWR)
+                guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish after disconnect") }
+                throw error
+            }
+            guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish") }
+            guard let separator = wire.range(of: Data("\r\n\r\n".utf8)) else { throw ModelError("missing HTTP head") }
+            let responseHead = String(decoding: wire[..<separator.lowerBound],as: UTF8.self)
+            let raw = Data(wire[separator.upperBound...])
+            if !responseHead.lowercased().contains("transfer-encoding: chunked") {
+                return (responseHead,String(decoding: raw,as: UTF8.self))
+            }
+            var body = Data(), cursor = 0
+            while cursor<raw.count {
+                guard let end = raw[cursor...].range(of: Data("\r\n".utf8)),
+                    let n = Int(String(decoding: raw[cursor..<end.lowerBound],as: UTF8.self),radix: 16)
+                else { throw ModelError("malformed chunk length") }
+                cursor = end.upperBound
+                guard n>=0,n<=raw.count-cursor,raw.count-cursor-n>=2,
+                    raw[cursor+n]==13,raw[cursor+n+1]==10 else { throw ModelError("incomplete HTTP chunk") }
+                if n==0 {
+                    guard cursor+2==raw.count else { throw ModelError("unexpected trailing HTTP bytes") }
+                    return (responseHead,String(decoding: body,as: UTF8.self))
+                }
+                body.append(raw[cursor..<cursor+n]); cursor += n+2
+            }
+            throw ModelError("missing terminating HTTP chunk")
+        }
+        let text = "Print exactly: one two three four five six seven eight."
+        let variants: [(String,String,Bool,[String:Any])] = [
+            ("generate JSON","/api/generate",false,["model":engine.modelName,"prompt":text,"raw":true,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
+            ("generate NDJSON","/api/generate",true,["model":engine.modelName,"prompt":text,"raw":true,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
+            ("chat JSON","/api/chat",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
+            ("chat NDJSON","/api/chat",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
+            ("OpenAI JSON","/v1/chat/completions",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":false,"max_tokens":8,"temperature":0,"seed":7]),
+            ("OpenAI SSE","/v1/chat/completions",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":true,"max_tokens":8,"temperature":0,"seed":7]),
+            ("Gateway SSE","/v3/ai/language-model",true,["prompt":[["role":"user","content":[["type":"text","text":text]]]],"toolChoice":["type":"auto"],"maxOutputTokens":8,"temperature":0,"seed":7]),
+        ]
+
+        for queued in [false, true] {
+            engine.model.optimizations.boundedOutputQueue = queued
+            for mode in ["memory-before", "deadline-before", "memory-after", "deadline-after", "pressure-before", "pressure-after", "memory-decode"] {
+                for (name, path, stream, body) in variants {
+                    let label = "\(name)/\(mode)/queued=\(queued)"
+                    engine.dropPrefixCache()
+                    var tick: UInt64 = 0
+                    var available = mode == "memory-before" ? 0.0 : 1_000.0
+                    var fired = false
+                    var firstLayerCalls = 0
+                    var ticket: PressureTicket?
+                    defer {
+                        if let ticket { engine.pressureBoundary.acknowledge(ticket) }
+                        engine.requestControllerOverride = nil; engine.model.routerObserver = nil
+                    }
+                    if mode == "pressure-before" { ticket = engine.pressureBoundary.request() }
+                    let config = try ContextConfiguration(maxContextTokens: 65536,
+                        maxPrefillWaitMinutes: mode.hasPrefix("deadline") ? 1 : 0)
+                    engine.requestControllerOverride = {
+                        let value = RequestController(configuration: config, slackBytes: 1_500_000_000,
+                            clock: { tick }, availableGB: { available })
+                        if mode == "deadline-before" { tick = 61_000_000_000 }
+                        return value
+                    }
+                    engine.model.routerObserver = { layer, _ in
+                        if layer == 0 { firstLayerCalls += 1 }
+                        if layer == 0 && (mode.hasSuffix("after") || (mode == "memory-decode" && firstLayerCalls == 2)) {
+                            fired = true
+                            if mode.hasPrefix("memory") { available = 0 }
+                            else if mode.hasPrefix("pressure") { ticket = engine.pressureBoundary.request() }
+                            else { tick = 61_000_000_000 }
+                        }
+                    }
+                    let response = try exchange(path, body)
+                    engine.requestControllerOverride = nil; engine.model.routerObserver = nil
+                    let after = !mode.hasSuffix("before")
+                    let code = mode.hasPrefix("deadline") ? "prefill_deadline_exceeded" : "insufficient_memory"
+                    c.expect("\(label): correct header status", response.head.hasPrefix(after && stream ? "HTTP/1.1 200" : "HTTP/1.1 503"), response.head)
+                    c.expect("\(label): typed terminal", response.body.contains(code), response.body)
+                    c.equal("\(label): model only runs after admission", fired, after)
+                    c.expect("\(label): no success DONE", !response.body.contains("[DONE]"))
+                    let lines = response.body.split(separator: "\n").map(String.init)
+                    let objects = try lines.compactMap { line -> [String: Any]? in
+                        var value = line.trimmingCharacters(in: .whitespacesAndNewlines)
+                        if value.hasPrefix("data:") { value = String(value.dropFirst(5)).trimmingCharacters(in: .whitespaces) }
+                        if !value.hasPrefix("{") { return nil }
+                        return try JSONSerialization.jsonObject(with: Data(value.utf8)) as? [String: Any]
+                    }
+                    c.expect("\(label): no successful finish", !objects.contains { object in
+                        if object["done"] as? Bool == true || object["type"] as? String == "finish" { return true }
+                        return (object["choices"] as? [[String: Any]] ?? []).contains {
+                            $0["finish_reason"] != nil && !($0["finish_reason"] is NSNull)
+                        }
+                    })
+                    c.equal("\(label): pins released", engine.model.pool.pinnedSlotCount, 0)
+                    c.equal("\(label): failed state absent", engine.prefixCache.heldTokens, 0)
+                    c.equal("\(label): allocator limit restored", MLX.Memory.cacheLimit, 2 << 30)
+                }
+                let retry = try exchange("/api/generate", ["model": engine.modelName, "prompt": "Say only ok", "stream": false,
+                    "options": ["num_predict": 4, "temperature": 0, "seed": 7]])
+                c.expect("\(mode)/\(queued): healthy request after faults", retry.head.hasPrefix("HTTP/1.1 200") && !retry.body.contains("\"error\""), retry.body)
+            }
+        }
+        // The first sampled token closes only the time policy. Advance the
+        // fake clock inside the next real model forward, through HTTP, and
+        // require successful completion rather than a terminal time error.
+        for queued in [false, true] {
+            engine.model.optimizations.boundedOutputQueue = queued
+            engine.dropPrefixCache()
+            var tick: UInt64 = 0, forwards = 0
+            let config = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
+            engine.requestControllerOverride = {
+                RequestController(configuration: config, slackBytes: 0, clock: { tick }, availableGB: { 1000 })
+            }
+            engine.model.routerObserver = { layer, _ in
+                if layer == 0 {
+                    forwards += 1
+                    if forwards > 1 { tick = 61_000_000_000 }
+                }
+            }
+            let response = try exchange(variants[1].1, variants[1].3)
+            engine.requestControllerOverride = nil; engine.model.routerObserver = nil
+            c.expect("decode after deadline/\(queued): clock actually advanced", tick > 60_000_000_000)
+            c.expect("decode after deadline/\(queued): healthy HTTP completion", response.head.hasPrefix("HTTP/1.1 200")
+                && response.body.contains("\"done\":true") && !response.body.contains("\"error\""), response.body)
+            c.equal("decode after deadline/\(queued): released pins", engine.model.pool.pinnedSlotCount, 0)
+        }
+        // Admission prices only the exact, consumed prefix handed over by the
+        // cache. The same prompt must fail this short estimate policy cold.
+        engine.dropPrefixCache()
+        var single = SampleParams.greedy; single.maxTokens = 1
+        let prefix = (0 ..< 515).map { 1000 + (($0 * 7919) % 200_000) }
+        let seed = engine.generate(promptIds: prefix, params: single)
+        c.expect("warm admission: seed succeeds", seed.stats.runtimeError == nil && seed.ids.count == 1)
+        // The baseline consumes its last sampled token; the separately gated
+        // skipped-final-forward path does not. Use actual retained IDs in
+        // either family instead of assuming where generation stopped.
+        let retained = engine.prefixCache.peek(extending: prefix) ?? prefix
+        c.equal("warm admission: seed retained exact consumed history", engine.prefixCache.heldTokens, retained.count)
+        let continuation = retained + [907]
+        let tight = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 0.02)
+        func tightControl() -> RequestController {
+            RequestController(configuration: tight, slackBytes: 0, clock: { 0 }, availableGB: { 1000 })
+        }
+        let warmControl = tightControl()
+        let warm = engine.generate(promptIds: continuation, params: single, request: warmControl)
+        c.expect("warm admission: only missing token is admitted", warm.stats.runtimeError == nil
+            && warm.stats.reusedPrefixTokens == retained.count && warm.stats.prefillTokens == 1,
+            "reused=\(warm.stats.reusedPrefixTokens), expected=\(retained.count), prefilled=\(warm.stats.prefillTokens), error=\(warm.stats.runtimeError ?? "none")")
+        c.expect("warm admission: retained estimate is inside budget", warmControl.estimatedPrefillSeconds.map { $0 < 1.2 } ?? false)
+        engine.dropPrefixCache()
+        let cold = engine.generate(promptIds: continuation, params: single, request: tightControl())
+        c.equal("cold admission: identical total prompt refused", cold.stats.requestFailure?.code, .prefillWaitExceeded)
+        c.equal("cold admission: no prompt computation", cold.stats.prefillTokens, 0)
+        c.equal("cold admission: truthful submitted token count", cold.stats.promptTokens, continuation.count)
+        c.equal("cold admission: failed state absent", engine.prefixCache.heldTokens, 0)
+        // A client's cap cannot change the server or a later client's request.
+        var restricted = variants[4].3
+        restricted["options"] = ["num_ctx": 1]
+        let limited = try exchange(variants[4].1, restricted)
+        c.expect("client cap: typed pre-header refusal", limited.head.hasPrefix("HTTP/1.1 400")
+            && limited.body.contains("context_length_exceeded"), limited.body)
+        c.equal("client cap: server remains unchanged", engine.maxContextTokens, 65536)
+        let independent = try exchange(variants[4].1, variants[4].3)
+        c.expect("client cap: later client succeeds", independent.head.hasPrefix("HTTP/1.1 200")
+            && !independent.body.contains("\"error\""), independent.body)
+        let templated = try engine.encodeWithVision(messages: [["role":"user", "content":text]], tools: nil, thinking: false).0
+        let rawCount = engine.tokenizer.encode(text: text).count
+        for (name, path, _, body) in [variants[0], variants[2], variants[4]] {
+            let count = path == "/api/generate" ? rawCount : templated.count
+            for room in [-1, 0, 1] {
+                engine.dropPrefixCache()
+                engine.maxContextTokens = count + room
+                let response = try exchange(path, body)
+                let rejects = room < 0 || (path.hasPrefix("/v1/") && room == 0)
+                c.expect("\(name)/room=\(room): final tokenized cap governs status",
+                    response.head.hasPrefix(rejects ? "HTTP/1.1 400" : "HTTP/1.1 200"), response.body)
+                if !rejects {
+                    let object = try JSONSerialization.jsonObject(with: Data(response.body.utf8)) as! [String:Any]
+                    let decoded = object["eval_count"] as? Int
+                        ?? ((object["usage"] as? [String:Any])?["completion_tokens"] as? Int)
+                    c.equal("\(name)/room=\(room): output budget is clamped", decoded, room)
+                }
+            }
+        }
+        engine.maxContextTokens = 65536
+        // A genuine occupied generation gate, with a clock advancing while
+        // the second request waits. Metadata must remain independent of it.
+        let held = DispatchSemaphore(value: 0), release = DispatchSemaphore(value: 0), ended = DispatchSemaphore(value: 0)
+        Thread.detachNewThread {
+            engine.withExclusive { held.signal(); release.wait() }
+            ended.signal()
+        }
+        defer { release.signal() }
+        guard held.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not start") }
+        var queueChecks: UInt64 = 0
+        let queueConfig = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
+        engine.requestControllerOverride = {
+            RequestController(configuration: queueConfig, slackBytes: 0, clock: {
+                queueChecks += 1; return queueChecks * 10_000_000_000
+            }, availableGB: { 1_000 })
+        }
+        let refused = try exchange("/v1/chat/completions", variants[5].3)
+        c.expect("queued request expires before headers", refused.head.hasPrefix("HTTP/1.1 503") && refused.body.contains("prefill_deadline_exceeded"), refused.body)
+        engine.requestControllerOverride = nil
+        for path in ["/v1/models", "/coding-agent/v1/models"] {
+            let metadata = try exchange(path, nil)
+            c.expect("\(path): metadata stays responsive during occupied generation gate", metadata.head.hasPrefix("HTTP/1.1 200") && metadata.body.contains("context_policy"))
+        }
+        release.signal()
+        guard ended.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not finish") }
+        // Checked legacy mutation cannot enlarge an already allocated engine.
+        engine.maxContextTokens = ContextPolicy.modelLimit
+        c.equal("invalid legacy mutation preserves advertised cap", engine.maxContextTokens, 65536)
+        let failed = engine.generate(promptIds: [1000], params: .greedy)
+        c.equal("invalid legacy mutation fails without allocation", failed.stats.requestFailure?.code, .invalidConfiguration)
+        engine.maxContextTokens = 65536
+        let healthy = try exchange("/api/generate", ["model": engine.modelName, "prompt": "Say ok", "stream": false, "options": ["num_predict": 2]])
+        c.expect("valid legacy assignment recovers", healthy.head.hasPrefix("HTTP/1.1 200"))
+        return c.report()
+    }
+}
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift
@@ -127,6 +127,18 @@
         c.expect("the fixture decodes to an image", (try? VisionPreprocess.decodeCGImage(png)) != nil)
         c.expect("request's remaining image budget is enforced", (try? VisionPreprocess.decodeCGImage(png, maximumDecodedBytes: 15)) == nil)
         c.equal("exact remaining budget permits a tiny source", try? VisionPreprocess.decodeCGImage(png, maximumDecodedBytes: 16).charge, 16)
+        let deniedPixels = RequestController(configuration: try! ContextConfiguration(),
+            slackBytes: 0, availableGB: { 0 })
+        c.expect("pixel allocation checks request memory before decoding", (try? VisionPreprocess.decodeCGImage(
+            png, maximumDecodedBytes: 16, request: deniedPixels)) == nil)
+        c.equal("pixel allocation memory error stays typed", deniedPixels.failure?.code, .insufficientMemory)
+        var pixelClock: UInt64 = 0
+        let expiredPixels = RequestController(configuration: try! ContextConfiguration(maxPrefillWaitMinutes: 1),
+            slackBytes: 0, clock: { pixelClock }, availableGB: { 10 })
+        pixelClock = 61_000_000_000
+        c.expect("source decoding inherits request deadline", (try? VisionPreprocess.decodeCGImage(
+            png, maximumDecodedBytes: 16, request: expiredPixels)) == nil)
+        c.equal("source decoding deadline stays typed", expiredPixels.failure?.code, .prefillDeadlineExceeded)
         let reusedSources = DecodedImageBatch(deduplicate: true, maximumBytes: 16)
         let firstSource = try? reusedSources.decode(png)
         let secondSource = try? reusedSources.decode(png)
--- a/Sources/SlotstreamDiagnostics/Diagnostics.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics.swift
@@ -38,8 +38,7 @@
                     let full = PrefillSchedule.chunk(at: position, maxChunk: maxChunk)
                     let product = full * (position + full)
                     worstProduct = max(worstProduct, product)
-                    if full > PrefillSchedule.minChunk,
-                        product > PrefillSchedule.measuredQueryKeyProduct
+                    if product > PrefillSchedule.measuredQueryKeyProduct
                     {
                         boundedEverywhere = false
                     }
@@ -125,7 +124,7 @@
         }
         c.expect("read scopes preserve every bounded compute pass", scopesPreserveSchedule)
         c.equal("zero remainder makes no pass", PrefillSchedule.next(remaining: 0, at: 32768, maxChunk: 4096, tailAware: true), 0)
-        c.equal("huge diagnostic inputs do not overflow", PrefillSchedule.chunk(at: Int.max, maxChunk: Int.max), PrefillSchedule.minChunk)
+        c.equal("out-of-model diagnostic position has no legal pass", PrefillSchedule.chunk(at: Int.max, maxChunk: Int.max), 0)
 
         // A prompt already held costs nothing more: this is the prefix cache's
         // promise, priced.
--- a/Sources/SlotstreamTestKit/T0Checks.swift
+++ b/Sources/SlotstreamTestKit/T0Checks.swift
@@ -10,6 +10,7 @@
         [
             Check("prefill-schedule", tier: .t0) { Diagnostics.prefillSchedule() },
             Check("context-policy", tier: .t0) { contextPolicy() },
+            Check("configurable-context", tier: .t0) { try Diagnostics.configurableContext() },
             Check("exact-read", tier: .t0) { Diagnostics.optimizationExactRead() },
             Check("packed-layout", tier: .t0) { try Diagnostics.optimizationPackedLayout() },
             Check("ngram-prefetch-ticket", tier: .t0) { try Diagnostics.optimizationNgramPrefetchTicket() },
@@ -62,11 +63,11 @@
             "the refusal names the ceiling",
             msg.contains("\(ContextPolicy.maxTokens)"), msg)
         c.expect(
-            "the refusal says the ceiling is measured, not a memory limit",
-            msg.contains("measured") && msg.contains("not a memory limit"), msg)
+            "the refusal distinguishes model configuration from implementation qualification",
+            msg.contains("model limit") && msg.contains("implementation limit"), msg)
         c.expect(
-            "the refusal names the tool that moves it",
-            msg.contains("context-check"), msg)
+            "the refusal does not promise capacity or quality",
+            msg.contains("memory fit or answer quality"), msg)
         c.measure("max_tokens", Double(ContextPolicy.maxTokens))
         return c.report()
     }
--- a/Sources/slotstream-cli/ContextCommands.swift
+++ b/Sources/slotstream-cli/ContextCommands.swift
@@ -20,7 +20,10 @@
     func validate() throws {
         guard chunk >= 1, chunk <= 65_536 else { throw ValidationError("--chunk must be between 1 and 65536") }
         guard tokens >= 1 else { throw ValidationError("--tokens must be at least 1") }
-        guard from >= 0 else { throw ValidationError("--from must not be negative") }
+        guard from >= 0, from <= ContextPolicy.modelLimit,
+              tokens <= ContextPolicy.modelLimit - from else {
+            throw ValidationError("--from plus --tokens must fit the pinned model limit of \(ContextPolicy.modelLimit)")
+        }
     }
 
     func run() throws {
@@ -31,7 +34,7 @@
             let d: [String: Any] = [
                 "chunk": chunk, "tokens": tokens, "from": from,
                 "passes": passes, "pass_count": passes.count, "tail_aware": tailAware,
-                "est_seconds": secs,
+                "est_seconds": secs.isFinite ? secs as Any : NSNull(),
                 "measured_query_key_product": PrefillSchedule.measuredQueryKeyProduct,
                 "min_chunk": PrefillSchedule.minChunk,
             ]
@@ -68,6 +71,10 @@
     @OptionGroup var model: ModelOptions
     @Option(help: "Prompt length in tokens (rungs double from 2048 up to here with --ladder)")
     var tokens: Int = 8192
+    @Option(help: "Required output tokens, reserved before loading") var replyTokens: Int = 16
+    @Option(help: "Accepted request to first token budget in minutes; 0 disables only time")
+    var maxPrefillWait = 30.0
+    @Option(help: "Independent wall-clock ceiling for each diagnostic rung") var wallSeconds = 7200.0
     @Flag(help: "Sample request physical footprint every 20 ms, separately from lifetime RSS")
     var sampleFootprint = false
     @Flag(help: "Run 2048, 4096, ... up to --tokens, stopping at the first rung that leaves the plan")
@@ -79,8 +86,14 @@
 
     func validate() throws {
         guard tokens >= 16 else { throw ValidationError("--tokens must be at least 16") }
-        guard tokens <= ContextPolicy.maxTokens * 8 else {
-            throw ValidationError("--tokens is capped at \(ContextPolicy.maxTokens * 8) for one check")
+        guard replyTokens > 0, replyTokens < ContextPolicy.modelLimit,
+              tokens <= ContextPolicy.modelLimit - replyTokens else {
+            throw ValidationError("--tokens plus --reply-tokens must fit the model limit of \(ContextPolicy.modelLimit)")
+        }
+        _ = try ContextConfiguration(maxContextTokens: tokens + replyTokens,
+            maxPrefillWaitMinutes: maxPrefillWait, qualification: true)
+        guard wallSeconds.isFinite, wallSeconds > 0, wallSeconds <= 86_400 else {
+            throw ValidationError("--wall-seconds must be finite, positive and at most 86400")
         }
         if let m = minFreeGB, !(m.isFinite && m >= 0) {
             throw ValidationError("--min-free-gb must be a finite number >= 0")
@@ -92,13 +105,15 @@
     static func filler(tokens n: Int, tokenizer: (String) -> [Int]) -> [Int] {
         var text = "Context check. "
         var i = 0
+        var nextCheck = 50
         while true {
             text += "Record \(i): the sensor on line \(i % 97) reported \(37 + (i * 31) % 500) units at "
                 + "\(i % 24):\(String(format: "%02d", (i * 7) % 60)), and technician \((i * 13) % 1000) filed note \(i). "
             i += 1
-            if i % 50 == 0 {
+            if i == nextCheck {
                 let ids = tokenizer(text)
                 if ids.count >= n { return Array(ids.prefix(n)) }
+                nextCheck *= 2
             }
         }
     }
@@ -111,11 +126,8 @@
         let asJSON = self.asJSON
         let minFree = minFreeGB
         let sampleFootprint = self.sampleFootprint
-        // Price every already-supported token before allocating the pool. The
-        // diagnostic may still measure beyond the served ceiling, where fits
-        // is a counterexample until a larger planning envelope is qualified.
-        let plan = try model.announcedPlan(maxContext:
-            min(ContextPolicy.maxTokens, max(ContextPolicy.defaultTokens, target + 16)))
+        let plan = try model.announcedPlan(maxContext: target + replyTokens,
+            prefixCacheEnabled: false, maxPrefillWait: maxPrefillWait, qualification: true)
         Task {
             do {
                 let engine = try await Engine(modelDir: model.modelURL, plan: plan)
@@ -124,10 +136,6 @@
                 // rung measures a prefix hit instead of a cold read.
                 engine.prefixCache.enabled = false
                 engine.prefixCache.drop()
-                // Room for the rung plus its one-token reply. This is the
-                // measurement seam, not a served limit: `serve` still validates
-                // --max-context against the ceiling.
-                engine.maxContextTokens = target + 16
                 var rungs: [Int] = []
                 if ladder {
                     var r = 2048
@@ -138,7 +146,7 @@
                 let all = Self.filler(tokens: rungs.max()!) { engine.tokenizer.encode(text: $0) }
                 let progress = PrefillProgressReporter(
                     quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
-                    if !asJSON { FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!) }
+                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                 }
                 progress.tailAware = engine.model.optimizations.tailAwarePrefill
                 engine.generator.onPrefillProgress = progress.report
@@ -147,27 +155,46 @@
                     let ids = Array(all.prefix(n))
                     var aborted: String?
                     var params = SampleParams.greedy
-                    params.maxTokens = 1
-                    let (_, _, stats) = engine.generate(
+                    params.maxTokens = replyTokens
+                    let control = try engine.beginRequest()
+                    let rungStarted = RuntimeClock.now()
+                    var timings: [[String: Any]] = []
+                    var previousDone = 0, previousElapsed = 0.0
+                    engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
+                        guard done > previousDone else { return }
+                        timings.append(["from": base + previousDone, "tokens": done - previousDone,
+                            "seconds": elapsed - previousElapsed])
+                        previousDone = done; previousElapsed = elapsed
+                    }
+                    let (text, outputIds, stats) = engine.generate(
                         promptIds: ids, params: params,
                         shouldContinue: {
+                            if RuntimeClock.seconds(since: rungStarted) >= wallSeconds {
+                                aborted = "diagnostic wall-clock ceiling exceeded"
+                                control.cancel(); return false
+                            }
                             // The guard: stop before the machine pays in swap.
                             if let a = Planner.deviceAvailableGB(), a < slack {
                                 aborted = String(format: "reclaimable memory fell to %.1f GB (floor %.1f)", a, slack)
                                 return false
                             }
                             return true
-                        })
+                        }, request: control)
+                    engine.generator.onPrefillProgressAbsolute = nil
                     engine.dropPrefixCache()
                     let peak = max(stats.peakMemoryGB, Double(stats.sampledFootprint?.peakBytes ?? 0) / 1e9)
                     let completed = stats.runtimeError == nil && !stats.memoryPressureCancelled
-                        && stats.prefillTokens == n && stats.decodeTokens == 1
-                    let fits = aborted == nil && completed && peak <= plan.expectedPeakGB
+                        && stats.prefillTokens == n && stats.decodeTokens == replyTokens
+                    let noSwap = stats.generatorVMBefore?.swapins == stats.generatorVMAfter?.swapins
+                        && stats.generatorVMBefore?.swapouts == stats.generatorVMAfter?.swapouts
+                    let fits = aborted == nil && completed && peak <= plan.expectedPeakGB && noSwap
                     let verdict: String
                     if let a = aborted {
                         verdict = "ABORTED at \(stats.prefillTokens) tokens: \(a)"
                     } else if !completed {
                         verdict = "INCOMPLETE: \(stats.runtimeError ?? "prompt or reply did not complete")"
+                    } else if !noSwap {
+                        verdict = "EXCLUDED: swap activity during the request"
                     } else if fits {
                         verdict = "OK"
                     } else {
@@ -175,7 +202,8 @@
                     }
                     if asJSON {
                         let d: [String: Any] = [
-                            "tokens": n, "prompt_ids": ids, "prefill_tokens": stats.prefillTokens,
+                            "text": text, "output_ids": outputIds,
+                            "tokens": n, "reply_tokens": replyTokens, "configured_context": plan.maxContextTokens, "prompt_ids": ids, "prefill_tokens": stats.prefillTokens,
                             "prefill_seconds": stats.prefillSeconds, "prefill_tok_s": stats.prefillTPS,
                             "peak_rss_gb": Double(stats.lifetimeRSSPeakBytes) / 1e9,
                             "process_peak_bound_gb": peak,
@@ -183,9 +211,14 @@
                             "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)),
                             "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
                             "prefill_chunk": engine.generator.prefillChunk,
+                            "pass_timings": timings,
                             "passes": stats.prefillPasses,
                             "compute_passes": stats.prefillComputePasses,
+                            "compute_key_extents": stats.prefillComputeKeyExtents,
+                            "memory_ledger": plan.memoryLedger.json,
+                            "model_revision": PinnedModel.revision,
                             "fits": fits, "aborted": aborted ?? NSNull(),
+                            "verdict": verdict,
                         ]
                         let data = try JSONSerialization.data(withJSONObject: d, options: [.sortedKeys])
                         print(String(decoding: data, as: UTF8.self))
@@ -203,19 +236,16 @@
                 }
                 if !asJSON {
                     let cap = ContextPolicy.maxTokens
-                    if fitsSoFar, target <= cap {
-                        print("verdict: \(target) tokens stay inside the plan on this Mac; the ceiling is \(cap) "
-                            + "(prompt + reply), so no flag is needed.")
-                    } else if fitsSoFar {
-                        print("verdict: \(target) tokens stayed inside the plan on this Mac. The ceiling is still "
-                            + "\(cap) until this measurement is recorded in MEASUREMENTS.md and the planner "
-                            + "charges the extra state (Context.swift explains the two steps).")
+                    if fitsSoFar {
+                        print("verdict: \(target) prompt tokens plus \(replyTokens) output tokens completed inside the plan on this Mac. "
+                            + "Ordinary serving defaults to \(ContextPolicy.defaultTokens); its implementation ceiling remains \(cap). "
+                            + "A larger supported window requires an explicit --max-context. Diagnostic success does not raise that ceiling.")
                     } else {
                         print("verdict: the plan does not cover this prompt length here; lower --tokens, raise "
                             + "--memory-gb if the machine has room, or close other apps and retry.")
                     }
                 }
-                result = .success(())
+                result = fitsSoFar ? .success(()) : .failure(PlanError("context qualification failed; preserved output contains the incomplete or over-budget rung"))
             } catch {
                 result = .failure(error)
             }
--- a/Sources/slotstream-cli/OptimizationCommands.swift
+++ b/Sources/slotstream-cli/OptimizationCommands.swift
@@ -16,14 +16,16 @@
     func run() throws {
         let report: CheckReport
         if generation { report = try Diagnostics.optimizationGeneration(modelDir: model.modelURL) }
-        else if ["runtime-budget-lifecycle", "governor-boundary", "governor-boundary-mtp", "read-failure-serving", "output-serving"].contains(variant) {
+        else if ["runtime-budget-lifecycle", "governor-boundary", "governor-boundary-mtp", "read-failure-serving", "output-serving", "context-serving"].contains(variant) {
             // This executable has a synchronous root, as do its existing
             // Engine-backed commands. Bridge only the tokenizer load here.
             let ready = DispatchSemaphore(value: 0)
             var result: Result<CheckReport, Error>?
             Task {
                 do {
-                    if variant == "output-serving" {
+                    if variant == "context-serving" {
+                        result = .success(try await Diagnostics.contextServing(modelDir: model.modelURL))
+                    } else if variant == "output-serving" {
                         result = .success(try await Diagnostics.optimizationOutputServing(modelDir: model.modelURL))
                     } else if variant == "read-failure-serving" {
                         result = .success(try await Diagnostics.optimizationReadFailureServing(modelDir: model.modelURL))
--- a/Sources/slotstream-cli/main.swift
+++ b/Sources/slotstream-cli/main.swift
@@ -143,15 +143,21 @@
 
     /// Resolve knobs -> plan, print the announce, return it. Also the first
     /// place a stranger hits with no weights — offer the download right there.
-    func announcedPlan(maxContext: Int = ContextPolicy.defaultTokens, prefixCacheEnabled: Bool = true) throws -> MemoryPlan {
+    func announcedPlan(maxContext: Int = ContextPolicy.defaultTokens, prefixCacheEnabled: Bool = true,
+                       maxPrefillWait: Double = 30, qualification: Bool = false) throws -> MemoryPlan {
+        let configuration = try ContextConfiguration(maxContextTokens: maxContext,
+            maxPrefillWaitMinutes: maxPrefillWait, qualification: qualification)
+        let policy = try runtimePolicy(prefixCacheEnabled: prefixCacheEnabled)
+        _ = try mtpMode(); _ = try visionMode()
         try ensureWeights()
         let base = try Planner.plan(
             expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
             ramPercent: maxRAMPercent,
             mtp: mtpMode(), mtpAvailable: MTPWeights.present(modelDir: modelURL),
             vision: visionMode(), visionAvailable: visionAvailable(),
-            maxContextTokens: maxContext)
-        let plan = try runtimePlan(base, prefixCacheEnabled: prefixCacheEnabled)
+            maxContextTokens: maxContext, qualification: qualification,
+            runtimePolicy: policy)
+        let plan = try runtimePlan(base, prefixCacheEnabled: prefixCacheEnabled).withRequestPolicy(configuration)
         FileHandle.standardError.write((plan.banner() + "\n").data(using: .utf8)!)
         return plan
     }
@@ -159,17 +165,18 @@
     /// The announce, doctor and serving metadata share the same reservation
     /// resolution. Merely printing a simulated plan never makes it loadable.
     func runtimePlan(_ base: MemoryPlan, prefixCacheEnabled: Bool = true) throws -> MemoryPlan {
-        if try InferenceOptimizations.environment().resolvedRuntimeBudget {
-            let env = ProcessInfo.processInfo.environment
-            let chunk: Int?
-            if let raw = env["SLOTSTREAM_PREFILL_CHUNK"] {
-                guard let value = Int(raw) else { throw PlanError("SLOTSTREAM_PREFILL_CHUNK must be an integer") }
-                chunk = value
-            } else { chunk = nil }
-            return try Planner.applyingRuntimePolicy(base, policy: RuntimeAllocationPolicy(
-                prefillChunkOverride: chunk, prefixCacheEnabled: prefixCacheEnabled && env["SLOTSTREAM_PREFIX_CACHE"] != "0"))
-        }
-        return base
+        try Planner.applyingRuntimePolicy(base, policy: runtimePolicy(prefixCacheEnabled: prefixCacheEnabled))
+    }
+
+    func runtimePolicy(prefixCacheEnabled: Bool = true) throws -> RuntimeAllocationPolicy {
+        let env = ProcessInfo.processInfo.environment
+        let chunk: Int?
+        if let raw = env["SLOTSTREAM_PREFILL_CHUNK"] {
+            guard let value = Int(raw) else { throw PlanError("SLOTSTREAM_PREFILL_CHUNK must be an integer") }
+            chunk = value
+        } else { chunk = nil }
+        return try RuntimeAllocationPolicy(prefillChunkOverride: chunk,
+            prefixCacheEnabled: prefixCacheEnabled && env["SLOTSTREAM_PREFIX_CACHE"] != "0")
     }
 
     /// If the pinned model isn't fully downloaded and we have a terminal, ask
@@ -256,6 +263,9 @@
 struct Run: ParsableCommand {
     static let configuration = CommandConfiguration(abstract: "Generate from a prompt")
     @OptionGroup var model: ModelOptions
+    @Option(help: "Prompt plus reply context window") var maxContext = ContextPolicy.defaultTokens
+    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
+    var maxPrefillWait = 30.0
     @Option var prompt: String = "Why is the sky blue?"
     @Option(help: "Read the exact UTF-8 prompt from a file") var promptFile: String?
     @Option(help: "Write exact tokens, effective configuration and generation measurements as JSON")
@@ -282,30 +292,62 @@
         if raw, !images.isEmpty {
             throw PlanError("--raw has no chat template to place an image in; drop one of them")
         }
-        let promptText = try promptFile.map { try String(contentsOfFile: $0, encoding: .utf8) } ?? prompt
+        _ = try ContextConfiguration(maxContextTokens: maxContext, maxPrefillWaitMinutes: maxPrefillWait)
         let launchStart = RuntimeClock.now()
         let sem = DispatchSemaphore(value: 0)
         var result: Result<Void, Error> = .success(())
-        let plan = try model.announcedPlan()
+        let plan = try model.announcedPlan(maxContext: maxContext, maxPrefillWait: maxPrefillWait)
         Task {
             do {
                 let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                 let loadSeconds = RuntimeClock.seconds(since: launchStart)
                 engine.generator.footprintSampling = sampleFootprint
+                let control = try engine.beginRequest()
                 let encodeStart = RuntimeClock.now()
+                var promptText = prompt
+                if let promptFile {
+                    let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: promptFile))
+                    defer { try? handle.close() }
+                    var data = Data()
+                    while true {
+                        let (next, overflow) = data.count.addingReportingOverflow(65_536)
+                        try control.checkInputBytes(overflow ? Int.max : next)
+                        guard let part = try handle.read(upToCount: 65_536), !part.isEmpty else { break }
+                        data.append(part)
+                    }
+                    try control.checkInputBytes(data.count)
+                    guard let decoded = String(data: data, encoding: .utf8) else {
+                        throw PlanError("prompt file must contain valid UTF-8")
+                    }
+                    promptText = decoded
+                }
                 let ids: [Int]
                 var vision: VisionPrompt?
                 if raw {
+                    try control.checkInputBytes(promptText.utf8.count)
                     ids = engine.tokenizer.encode(text: promptText)
                 } else {
                     var msg = ChatMessage(role: "user", content: promptText)
+                    var retainedInputBytes = promptText.utf8.count
                     msg.images = try images.map { path in
-                        guard let d = FileManager.default.contents(atPath: path) else {
-                            throw PlanError("cannot read image \(path)")
+                        let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
+                        defer { try? handle.close() }
+                        let size = try handle.seekToEnd()
+                        guard size > 0, size <= UInt64(VisionPreprocess.maxImageBytes) else {
+                            throw PlanError("image must be nonempty and at most \(VisionPreprocess.maxImageBytes >> 20) MiB")
+                        }
+                        let encodedBytes = ((Int(size) + 2) / 3) * 4
+                        let (next, overflow) = retainedInputBytes.addingReportingOverflow(encodedBytes)
+                        try control.checkInputBytes(overflow ? Int.max : next)
+                        retainedInputBytes = next
+                        try handle.seek(toOffset: 0)
+                        let d = try handle.read(upToCount: Int(size) + 1) ?? Data()
+                        guard d.count == Int(size) else {
+                            throw PlanError("image changed size while being read")
                         }
                         return d.base64EncodedString()
                     }
-                    (ids, vision) = try engine.encodeChatWithVision([msg], thinking: think)
+                    (ids, vision) = try engine.encodeChatWithVision([msg], thinking: think, request: control)
                 }
                 if let e = engine.contextError(promptTokens: ids.count) { throw PlanError(e) }
                 let encodeSeconds = RuntimeClock.seconds(since: encodeStart)
@@ -330,7 +372,7 @@
                     fputs(delta, stdout)
                     fflush(stdout)
                     return true
-                })
+                }, request: control)
                 print("")
                 if let statsJson {
                     let workspaceGB = engine.model.optimizations.layerExpertWorkspace
@@ -416,6 +458,8 @@
                 this machine and `context-check` measures a longer prompt.
                 """))
     var maxContext: Int = ContextPolicy.defaultTokens
+    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
+    var maxPrefillWait = 30.0
     @Flag(name: .customLong("no-elastic"),
           help: "Pin the cache at its startup size. Default: an auto-sized cache resizes itself between requests as memory pressure and availability change (explicit size flags are always pinned).")
     var noElastic = false
@@ -425,7 +469,7 @@
 
     func run() throws {
         if let why = ContextPolicy.validationError(maxContext) { throw PlanError(why) }
-        let plan = try model.announcedPlan(maxContext: maxContext, prefixCacheEnabled: !noPrefixCache)
+        let plan = try model.announcedPlan(maxContext: maxContext, prefixCacheEnabled: !noPrefixCache, maxPrefillWait: maxPrefillWait)
         // Claim the port first: failing here after a full model load wastes
         // half a minute and used to be a fatalError.
         let listenFD = try Server.bindPort(port)
@@ -448,7 +492,10 @@
             FileHandle.standardError.write("[\(stamp)] \(line)\n".data(using: .utf8)!)
         }
         progress.tailAware = engine.model.optimizations.tailAwarePrefill
-        engine.generator.onPrefillProgressAbsolute = progress.report
+        engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
+            progress.maxChunk = engine.generator.prefillChunk
+            progress.report(done: done, total: total, elapsed: elapsed, base: base)
+        }
         if noPrefixCache {
             engine.prefixCache.enabled = false
             engine.prefixCache.drop()
@@ -570,6 +617,8 @@
     @Option(name: .customLong("max-context"),
             help: "Preview the plan `serve --max-context N` would announce (default \(ContextPolicy.defaultTokens), ceiling \(ContextPolicy.maxTokens)).")
     var maxContext: Int = ContextPolicy.defaultTokens
+    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
+    var maxPrefillWait = 30.0
 
     /// One line on the 104 GB the plan above says nothing about: is it here,
     /// is there room for it, and roughly how long it takes.
@@ -600,6 +649,7 @@
     }
 
     func run() throws {
+        let configuration = try ContextConfiguration(maxContextTokens: maxContext, maxPrefillWaitMinutes: maxPrefillWait)
         // --json is for machines: emit the plan and nothing else.
         let quiet = asJSON
         let info = MLX.GPU.deviceInfo()
@@ -629,22 +679,43 @@
                 workingSetGB: simWorkingSet ?? (simRAM.map { $0 * 0.75 } ?? Planner.deviceWorkingSetGB()),
                 availableGB: simulatedAvailable, isSimulated: true)
             : .current()
-        let plan = try model.runtimePlan(Planner.plan(
-            PlanRequest(
-                expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
-                memoryGB: model.memoryGB, maxRAMPercent: model.maxRAMPercent,
-                mtp: try model.mtpMode(), vision: try model.visionMode(),
-                maxContextTokens: maxContext),
-            on: device,
+        let request = PlanRequest(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
+            memoryGB: model.memoryGB, maxRAMPercent: model.maxRAMPercent,
+            mtp: try model.mtpMode(), vision: try model.visionMode(), maxContextTokens: maxContext)
+        let feasibility = Planner.contextFeasibility(request, on: device,
             mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
-            visionAvailable: model.visionAvailable()))
+            visionAvailable: model.visionAvailable(), runtimePolicy: try model.runtimePolicy())
+        let advisory: MemoryPlan?
+        if feasibility.requestedPlan == nil, maxContext <= ContextPolicy.defaultTokens,
+           model.expertsPerLayer != nil || model.poolGB != nil {
+            advisory = try Planner.plan(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
+                memoryGB: model.memoryGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
+                availableGB: device.availableGB, ramPercent: model.maxRAMPercent,
+                mtp: model.mtpMode(), mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
+                vision: model.visionMode(), visionAvailable: model.visionAvailable(),
+                maxContextTokens: maxContext, simulated: device.isSimulated, runtimePolicy: model.runtimePolicy())
+        } else { advisory = nil }
+        guard let requestedPlan = feasibility.requestedPlan ?? advisory else {
+            if asJSON {
+                let output: [String: Any] = ["error": ["code": "insufficient_memory",
+                    "message": feasibility.refusal ?? "requested configuration does not fit"],
+                    "context_feasibility": feasibility.json]
+                print(String(decoding: try JSONSerialization.data(withJSONObject: output,
+                    options: [.prettyPrinted, .sortedKeys]), as: UTF8.self))
+                throw ExitCode(2)
+            }
+            throw PlanError("\(feasibility.refusal ?? "requested configuration does not fit"); maximum feasible window: \(feasibility.maximumFeasibleWindow) tokens")
+        }
+        let plan = try requestedPlan.withRequestPolicy(configuration)
         if asJSON {
+            var output = plan.json(); output["context_feasibility"] = feasibility.json
             let data = try JSONSerialization.data(
-                withJSONObject: plan.json(), options: [.prettyPrinted, .sortedKeys])
+                withJSONObject: output, options: [.prettyPrinted, .sortedKeys])
             print(String(decoding: data, as: UTF8.self))
             return
         }
         print(plan.banner())
+        print("memory-feasible window: \(feasibility.maximumFeasibleWindow) tokens; separate from the \(maxPrefillWait)-minute request-to-first-token policy")
         print("""
 
         knobs (first one given wins; with none, auto is the default):
@@ -668,9 +739,11 @@
         for t in [Planner.minMemoryGB, 10, 12, 16, 24, 28, 36, 48, 73]
         where t >= Planner.minMemoryGB
         {
-            let row = try model.runtimePlan(Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: t,
+            guard let row = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: t,
                 ramGB: device.ramGB, workingSetGB: device.workingSetGB, availableGB: device.availableGB,
-                maxContextTokens: maxContext, simulated: true))
+                maxContextTokens: maxContext, simulated: true, runtimePolicy: model.runtimePolicy()) else {
+                print(String(format: "  %6.1f GB   unavailable at this context", t)); continue
+            }
             let e = row.expertsPerLayerCached
             let est = row.estWarmTokS
             let full = row.fullyResident
--- /dev/null
+++ b/Tools/context_gates.py
@@ -0,0 +1,138 @@
+#!/usr/bin/env python3
+"""Weight-free configurable-context CLI/metadata contracts; never loads a model."""
+import argparse
+import json
+import os
+import re
+from pathlib import Path
+import subprocess
+
+ROOT = Path(__file__).resolve().parent.parent
+
+
+def run(binary, args):
+    env = {k: v for k, v in os.environ.items() if not k.startswith("SLOTSTREAM_")}
+    result = subprocess.run([str(binary), *args], env=env, text=True, capture_output=True, timeout=120)
+    return {"args": args, "code": result.returncode, "stdout": result.stdout, "stderr": result.stderr}
+
+
+def successful_tools(frames):
+    """Receiving-side fixture: valid arguments alone never authorize execution."""
+    calls = {}
+    finished = False
+    terminal = False
+    failed = False
+    for frame in frames:
+        if frame == "[DONE]":
+            if not finished or failed:
+                return []
+            terminal = True
+            continue
+        if terminal or not isinstance(frame, dict) or frame.get("error"):
+            return []
+        for choice in frame.get("choices", []):
+            reason = choice.get("finish_reason")
+            if reason is not None:
+                if finished or reason != "tool_calls":
+                    return []
+                finished = True
+            for delta in choice.get("delta", {}).get("tool_calls", []):
+                if finished:
+                    return []
+                current = calls.setdefault(delta["index"], {"id": "", "name": "", "arguments": ""})
+                current["id"] += delta.get("id", "")
+                function = delta.get("function", {})
+                current["name"] += function.get("name", "")
+                current["arguments"] += function.get("arguments", "")
+    if not terminal or not finished or failed:
+        return []
+    result = []
+    try:
+        for call in calls.values():
+            args = json.loads(call["arguments"])
+            if not call["id"] or not call["name"] or not isinstance(args, dict):
+                return []
+            result.append({**call, "arguments": args})
+    except (ValueError, TypeError):
+        return []
+    return result
+
+
+def check(binary):
+    evidence, assertions = [], []
+
+    def expect(name, condition, detail=None):
+        assertions.append({"name": name, "passed": bool(condition), "detail": detail if not condition else None})
+
+    fixture = json.loads((ROOT / "Tools/fixtures/context-default-v1.json").read_text())
+    help_result = run(binary, ["context-check", "--help"])
+    evidence.append(help_result)
+    help_text = help_result["stdout"]
+    for flag, default in [("--reply-tokens", "16"), ("--wall-seconds", "7200.0")]:
+        expect(f"diagnostic {flag} default is explicit", bool(re.search(
+            re.escape(flag) + r"(?:(?!\n  --).)*\(default: " + re.escape(default) + r"\)", help_text, re.S)), help_text)
+    fields = fixture["projection_fields"]
+    additions = set(fixture["allowed_additions"])
+    for tier in fixture["tiers"]:
+        repeats = [run(binary, tier["args"]) for _ in range(2)]
+        evidence.extend(repeats)
+        values = [json.loads(r["stdout"]) for r in repeats]
+        projected = [{k: d[k] for k in fields if k in d} for d in values]
+        expect(f"default {tier['tier']} preserved", projected[0] == projected[1] == tier["expected"], projected)
+        for d in values:
+            expect(f"default {tier['tier']} additions declared", set(d) <= set(fields) | additions, sorted(d))
+            expect(f"default {tier['tier']} ledger agrees", abs(d["expected_peak_gb"] - d["memory_ledger"]["expected_peak_bytes"] / 1e9) <= .051)
+            expect(f"default {tier['tier']} wait policy", d["max_prefill_wait_minutes"] == 30 and d["prefill_wait_scope"] == "accepted_request_to_first_model_token")
+
+    for start in [0, 1, 32768, 65535, 128256, 131071, 262079, 262143]:
+        result = run(binary, ["prefill-schedule", "--tokens", str(262144 - start), "--from", str(start), "--chunk", "4096", "--json"])
+        evidence.append(result)
+        d = json.loads(result["stdout"])
+        pos = start
+        bounded = True
+        for count in d["passes"]:
+            bounded &= count > 0 and count * (pos + count) <= 4096 * 8016
+            pos += count
+        expect(f"full schedule from {start}", bounded and pos == 262144, d)
+        expect(f"uncalibrated schedule from {start} labeled unknown", d["est_seconds"] is None)
+
+    for surface in ["serve", "run", "doctor"]:
+        for args in [["--max-context", "0"], ["--max-context", "262145"],
+                     ["--max-prefill-wait", "nan"], ["--max-prefill-wait", "inf"],
+                     ["--max-prefill-wait", "-1"], ["--max-prefill-wait", "1e300"]]:
+            result = run(binary, [surface, *args, "--model", "/nonexistent/context-gate-no-model"])
+            evidence.append(result)
+            expect(f"{surface} rejects {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)
+            expect(f"{surface} validates policy before weights {args}", "still to download" not in result["stderr"] and "no model at" not in result["stderr"], result)
+    for args in [["--tokens", "262144"], ["--tokens", "-1"],
+                 ["--tokens", "9223372036854775807"], ["--reply-tokens", "9223372036854775807"],
+                 ["--reply-tokens", "0"], ["--wall-seconds", "nan"]]:
+        result = run(binary, ["context-check", *args, "--model", "/nonexistent/context-gate-no-model"])
+        evidence.append(result)
+        expect(f"diagnostic rejects before allocation {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)
+
+    tool = {"choices": [{"delta": {"tool_calls": [{"index": 0, "id": "call_1", "function": {"name": "lookup", "arguments": '{"key":"a"}'}}]}, "finish_reason": None}]}
+    finish = {"choices": [{"delta": {}, "finish_reason": "tool_calls"}]}
+    expect("successful tool turn is deliverable", len(successful_tools([tool, finish, "[DONE]"])) == 1)
+    for suffix in [[], [{"error": {"code": "insufficient_memory"}}],
+                   [{"error": {"code": "prefill_deadline_exceeded"}}],
+                   [{"choices": [{"delta": {}, "finish_reason": "length"}]}, "[DONE]"],
+                   [finish], [finish, {"error": {"code": "inference_error"}}, "[DONE]"]]:
+        expect(f"failed/incomplete tool turn is inert {suffix}", successful_tools([tool, *suffix]) == [])
+    return {"passed": all(a["passed"] for a in assertions), "assertions": assertions, "commands": evidence}
+
+
+def main():
+    p = argparse.ArgumentParser(description=__doc__)
+    p.add_argument("--binary", type=Path, default=ROOT / ".build/release/slotstream")
+    p.add_argument("--report", type=Path, required=True)
+    a = p.parse_args()
+    result = check(a.binary.resolve())
+    a.report.write_text(json.dumps(result, indent=2) + "\n")
+    print(json.dumps({"passed": result["passed"], "assertions": len(result["assertions"]),
+                      "failures": [v for v in result["assertions"] if not v["passed"]]}))
+    return 0 if result["passed"] else 1
+
+
+if __name__ == "__main__":
+    raise SystemExit(main())
--- /dev/null
+++ b/Tools/fixtures/context-default-v1.json
@@ -0,0 +1,206 @@
+{
+  "schema_version": 1,
+  "baseline_binary_sha256": "a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2",
+  "projection_fields": [
+    "source",
+    "pool_slots",
+    "pool_gb",
+    "expected_peak_gb",
+    "device_ram_gb",
+    "device_working_set_gb",
+    "max_ram_percent",
+    "availability_clamped",
+    "fully_resident",
+    "prefill_chunk",
+    "prefix_cache_max_tokens",
+    "mtp",
+    "vision",
+    "vision_resident_gb",
+    "max_context_tokens",
+    "est_prefill_s_at_max_context",
+    "est_warm_tok_s",
+    "est_prefill_tok_s",
+    "device_available_gb",
+    "target_gb",
+    "experts_per_layer_cached"
+  ],
+  "allowed_additions": [
+    "model_context_limit",
+    "implementation_context_limit",
+    "mtp_context_limit",
+    "vision_context_limit",
+    "max_prefill_wait_minutes",
+    "prefill_wait_scope",
+    "context_qualification",
+    "memory_ledger",
+    "context_feasibility",
+    "runtime_prefix_cache_enabled",
+    "runtime_prefill_override",
+    "notes",
+    "vision_charged_gb",
+    "vision_resident_reserved"
+  ],
+  "tiers": [
+    {
+      "tier": 16,
+      "args": [
+        "doctor",
+        "--sim-ram",
+        "17.2",
+        "--sim-working-set",
+        "11.8",
+        "--sim-available",
+        "12.5",
+        "--mtp",
+        "off",
+        "--vision",
+        "off",
+        "--json"
+      ],
+      "expected": {
+        "source": "auto",
+        "pool_slots": 896,
+        "pool_gb": 2.5,
+        "expected_peak_gb": 8.8,
+        "device_ram_gb": 17.2,
+        "device_working_set_gb": 11.8,
+        "max_ram_percent": 70,
+        "availability_clamped": false,
+        "fully_resident": false,
+        "prefill_chunk": 256,
+        "prefix_cache_max_tokens": 12659,
+        "mtp": false,
+        "vision": false,
+        "vision_resident_gb": 0,
+        "max_context_tokens": 32768,
+        "est_prefill_s_at_max_context": 385.5058823529404,
+        "est_warm_tok_s": 3.7333333333333334,
+        "est_prefill_tok_s": 85,
+        "device_available_gb": 12.5,
+        "target_gb": 9.8,
+        "experts_per_layer_cached": 19
+      }
+    },
+    {
+      "tier": 24,
+      "args": [
+        "doctor",
+        "--sim-ram",
+        "25.8",
+        "--sim-working-set",
+        "18",
+        "--sim-available",
+        "21",
+        "--mtp",
+        "off",
+        "--vision",
+        "off",
+        "--json"
+      ],
+      "expected": {
+        "source": "auto",
+        "pool_slots": 2576,
+        "pool_gb": 7.1,
+        "expected_peak_gb": 15,
+        "device_ram_gb": 25.8,
+        "device_working_set_gb": 18,
+        "max_ram_percent": 70,
+        "availability_clamped": false,
+        "fully_resident": false,
+        "prefill_chunk": 1024,
+        "prefix_cache_max_tokens": 32768,
+        "mtp": false,
+        "vision": false,
+        "vision_resident_gb": 0,
+        "max_context_tokens": 32768,
+        "est_prefill_s_at_max_context": 200.57987878787887,
+        "est_warm_tok_s": 7.613993717625798,
+        "est_prefill_tok_s": 165,
+        "device_available_gb": 21,
+        "target_gb": 16,
+        "experts_per_layer_cached": 54
+      }
+    },
+    {
+      "tier": 32,
+      "args": [
+        "doctor",
+        "--sim-ram",
+        "34.4",
+        "--sim-working-set",
+        "25.8",
+        "--sim-available",
+        "29",
+        "--mtp",
+        "off",
+        "--vision",
+        "off",
+        "--json"
+      ],
+      "expected": {
+        "source": "auto",
+        "pool_slots": 4916,
+        "pool_gb": 13.6,
+        "expected_peak_gb": 22.8,
+        "device_ram_gb": 34.4,
+        "device_working_set_gb": 25.8,
+        "max_ram_percent": 70,
+        "availability_clamped": false,
+        "fully_resident": false,
+        "prefill_chunk": 2048,
+        "prefix_cache_max_tokens": 32768,
+        "mtp": false,
+        "vision": false,
+        "vision_resident_gb": 0,
+        "max_context_tokens": 32768,
+        "est_prefill_s_at_max_context": 183.62673762010354,
+        "est_warm_tok_s": 9.921487222949125,
+        "est_prefill_tok_s": 205,
+        "device_available_gb": 29,
+        "target_gb": 23.8,
+        "experts_per_layer_cached": 102
+      }
+    },
+    {
+      "tier": 48,
+      "args": [
+        "doctor",
+        "--sim-ram",
+        "51.5",
+        "--sim-working-set",
+        "40.2",
+        "--sim-available",
+        "44",
+        "--mtp",
+        "off",
+        "--vision",
+        "off",
+        "--json"
+      ],
+      "expected": {
+        "source": "auto",
+        "pool_slots": 7280,
+        "pool_gb": 20.1,
+        "expected_peak_gb": 32,
+        "device_ram_gb": 51.5,
+        "device_working_set_gb": 40.2,
+        "max_ram_percent": 70,
+        "availability_clamped": false,
+        "fully_resident": false,
+        "prefill_chunk": 4096,
+        "prefix_cache_max_tokens": 32768,
+        "mtp": false,
+        "vision": false,
+        "vision_resident_gb": 0,
+        "max_context_tokens": 32768,
+        "est_prefill_s_at_max_context": 182.26443163340733,
+        "est_warm_tok_s": 11.6,
+        "est_prefill_tok_s": 220,
+        "device_available_gb": 44,
+        "target_gb": 33,
+        "experts_per_layer_cached": 152
+      }
+    }
+  ],
+  "schema_note": "Projection schema corrected against preserved preimplementation output: existing experts_per_layer_cached included; new vision reservation fields explicitly additive. No expected allocation value changed."
+}
--- a/Tools/planner_gates.sh
+++ b/Tools/planner_gates.sh
@@ -15,9 +15,9 @@
 $BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
 check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' $T/p16 && ! grep -q 'note:' $T/p16"
 $BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
-check "16GB busy: floor 8.1 GB + heavy-paging warning" "grep -q 'target: 8.1' $T/b16 && grep -q 'heavy paging' $T/b16"
+check "16GB busy: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/b16 && grep -q 'maximum feasible window: 0' $T/b16"
 $BIN doctor --mtp off --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
-check "8GB Mac: floor 8.1 GB + too-small warning"      "grep -q 'target: 8.1' $T/m8 && grep -q 'below the comfortable minimum' $T/m8"
+check "8GB Mac: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/m8 && grep -q 'maximum feasible window: 0' $T/m8"
 # A big machine stops at the knee, says why, and can still be sent past it.
 # Before this, a 128 GB Mac targeted 89.6 GB for the speed 33 GB reaches.
 $BIN doctor --mtp off --sim-ram 137.4 > "$T/p128" 2>&1
@@ -45,7 +45,7 @@
 # because crossing a quarter of the budget doubled the prefill pass.
 check "more memory never plans slower (7-90 GB sweep)"  "BIN=$BIN Tools/monotonic_plan.py"
 $BIN doctor --mtp off --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
-check "explicit 30GB on busy 48: honored + info note"  "grep -q 'target: 30.0' $T/e48 && grep -q 'only 18.0 GB is reclaimable' $T/e48"
+check "explicit total target cannot authorize unavailable memory" "grep -q 'insufficient_memory' $T/e48 && grep -q 'maximum feasible window: 0' $T/e48"
 
 # Knob validation: out-of-range values must be refused, not silently accepted.
 check "--experts-per-layer 0 refused"                  "! $BIN doctor --experts-per-layer 0"
@@ -55,8 +55,8 @@
 check "--pool-gb inf is a clean error"                 "! $BIN doctor --pool-gb inf 2>&1 | grep -q 'Fatal error'"
 check "--pool-gb 1e300 saturates safely instead of trapping" \
       "$BIN doctor --pool-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
-check "--memory-gb 1e300 plans safely instead of trapping" \
-      "$BIN doctor --memory-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
+check "--memory-gb 1e300 refuses physical overcommit without trapping" \
+      "$BIN doctor --memory-gb 1e300 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\" and d[\"context_feasibility\"][\"maximum_feasible_window\"]==0'"
 check "huge finite memory plan remains valid JSON" \
       "$BIN doctor --memory-gb 1e300 --json | python3 -m json.tool >/dev/null"
 check "--sim-ram inf is a clean error"                 "! $BIN doctor --sim-ram inf 2>&1 | grep -q 'Fatal error'"
@@ -138,22 +138,24 @@
 check "plan announces the context cap and the wait"  "grep -q 'context: up to 32768 tokens per request' $T/p48 && grep -q 'before its first token' $T/p48"
 check "doctor --json carries max_context_tokens + wait" \
       "$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"max_context_tokens\"]==32768 and 60 < d[\"est_prefill_s_at_max_context\"] < 3600, d'"
-# The old 400 told users to raise a flag that could not go higher.
+# Check against this candidate's announced limit, not a stale release literal.
+CEILING=$($BIN doctor --mtp off --vision off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; print(json.load(sys.stdin)["implementation_context_limit"])')
+ABOVE=$((CEILING+1))
 check "serve --max-context above the ceiling names the ceiling, not a knob" \
-      "$BIN serve --max-context 65537 --port 11498 2>&1 | grep -q 'largest context slotstream has measured'"
+      "$BIN serve --max-context $ABOVE --port 11498 2>&1 | grep -q 'released implementation limit is $CEILING'"
 check "doctor --max-context above the ceiling is the same clean error" \
-      "$BIN doctor --max-context 65537 2>&1 | grep -q 'largest context slotstream has measured' && ! $BIN doctor --max-context 65537 2>&1 | grep -q 'Fatal error'"
+      "$BIN doctor --max-context $ABOVE 2>&1 | grep -q 'released implementation limit is $CEILING' && ! $BIN doctor --max-context $ABOVE 2>&1 | grep -q 'Fatal error'"
 $BIN doctor --mtp off --max-context 8192 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/ctx8k" 2>&1
 check "a lower --max-context caps the reuse ceiling too"  "grep -q 'context: up to 8192 tokens' $T/ctx8k && grep -q 'reuse:  up to 8192 tokens' $T/ctx8k"
-# The prefill schedule: never past the measured query x key product, never
-# below the 256 floor, monotone as the context grows, and the doctor's wait
+# The prefill schedule: never past the measured query x key product, including
+# its smallest pass, monotone as the context grows, and the doctor's wait
 # is exactly the schedule's wait for the plan's pass size.
-check "prefill-schedule: bounded, floored, monotone" \
-      "$BIN prefill-schedule --chunk 4096 --tokens 131072 --json | python3 -c '
+check "prefill-schedule: full model window obeys the product without exemptions" \
+      "$BIN prefill-schedule --chunk 4096 --tokens 262144 --json | python3 -c '
 import json,sys; d=json.load(sys.stdin); p=d[\"passes\"]; pos=0
-assert p[0]==4096 and p[-1]==256 and sum(p)==131072, p
+assert p[0]==4096 and p[-1]==64 and sum(p)==262144 and d[\"est_seconds\"] is None, p
 for c in p:
-    assert c>=d[\"min_chunk\"] and (c*(pos+c)<=d[\"measured_query_key_product\"] or c==d[\"min_chunk\"]), (c,pos)
+    assert c>=d[\"min_chunk\"] and c*(pos+c)<=d[\"measured_query_key_product\"], (c,pos)
     pos+=c
 assert all(p[i]>=p[i+1] for i in range(len(p)-1))'"
 check "prefill-schedule agrees with the doctor wait for the same pass" \

````

Artifact `/tmp/slotstream-optimization-execution/context-proposal-v2-review/manifest.json` — 15394 bytes, SHA-256 `c8592b8e07292508091e593069eea7ab3a2bd2b4ecbaffbed96c92766a682b1b`.

````text
{
  "classification": "Unapplied three-way review of unqualified extracted component subset",
  "proposal": "/tmp/slotstream-context-implementation-20260906/component-proposal-v2",
  "files": [
    {
      "path": "Sources/Slotstream/Checkpoint.swift",
      "ours_sha256": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "base_sha256": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "theirs_sha256": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
      "merged_sha256": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/Context.swift",
      "ours_sha256": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "base_sha256": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "theirs_sha256": "56e95af0cf3fbfd7c18174ac8b22167f9a8938b499db1e350186db5a79364a3a",
      "merged_sha256": "56e95af0cf3fbfd7c18174ac8b22167f9a8938b499db1e350186db5a79364a3a",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/ContextFeasibility.swift",
      "ours_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "base_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "theirs_sha256": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "merged_sha256": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "conflict": false,
      "ours_existed": false,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "ours_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "base_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "theirs_sha256": "a1ca82edc14687685225d1d147359bb43f0b8f8fb38638aeeaeaab2c609a48a8",
      "merged_sha256": "a1ca82edc14687685225d1d147359bb43f0b8f8fb38638aeeaeaab2c609a48a8",
      "conflict": false,
      "ours_existed": false,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/Engine.swift",
      "ours_sha256": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
      "base_sha256": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
      "theirs_sha256": "8683f7785cfd88e57482ff3e1c4d3da86f7751b8022b274740538c9450fb947e",
      "merged_sha256": "8683f7785cfd88e57482ff3e1c4d3da86f7751b8022b274740538c9450fb947e",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "ours_sha256": "9c11bdb7f894b74b23d64969a698fb59497c9ccfac6ee69acaa96d2439c813db",
      "base_sha256": "fb100321a64b54df96bca8c3292db28c7b45ca53eb74e1ee0c6e995dc1416a8d",
      "theirs_sha256": "357a5cc5ddc90f9114ad632a8ea782d0bd3f0a95a3c72d88cd41dd34d3dfd061",
      "merged_sha256": "5c30255e255057e25d9bc5e1e895de06c03e59d7c86473aac86c638674960f63",
      "conflict": true,
      "ours_existed": true,
      "conflict_resolved": true
    },
    {
      "path": "Sources/Slotstream/Governor.swift",
      "ours_sha256": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
      "base_sha256": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
      "theirs_sha256": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "merged_sha256": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/Model.swift",
      "ours_sha256": "6b3173d7023635061e52da1ee4a8b56173b6b7dce917ee7b4c6792a1d9aad115",
      "base_sha256": "6b3173d7023635061e52da1ee4a8b56173b6b7dce917ee7b4c6792a1d9aad115",
      "theirs_sha256": "3c1a82b11d0c31ab0cdc62487ec3d2cea230642cbb0cc3c6613003b5f8c17cbd",
      "merged_sha256": "3c1a82b11d0c31ab0cdc62487ec3d2cea230642cbb0cc3c6613003b5f8c17cbd",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "ours_sha256": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "base_sha256": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "theirs_sha256": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "merged_sha256": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/PrefixCache.swift",
      "ours_sha256": "fe569ca738f9d33b9445e3c0a29acde0a4c2987f54036ea0b9d09442471a3704",
      "base_sha256": "fe569ca738f9d33b9445e3c0a29acde0a4c2987f54036ea0b9d09442471a3704",
      "theirs_sha256": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "merged_sha256": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/PressureBoundary.swift",
      "ours_sha256": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "base_sha256": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "theirs_sha256": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "merged_sha256": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/RequestControl.swift",
      "ours_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "base_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "theirs_sha256": "71af7ac9f1ca6d274e08f2246b1ed5e3e64cd563de948d5ca03ce37adf7cdd58",
      "merged_sha256": "71af7ac9f1ca6d274e08f2246b1ed5e3e64cd563de948d5ca03ce37adf7cdd58",
      "conflict": false,
      "ours_existed": false,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/Server.swift",
      "ours_sha256": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
      "base_sha256": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
      "theirs_sha256": "818b9deb21ab1751b2cbcafb0cf73aea705a48bf9a4da0645b0a75a11a584222",
      "merged_sha256": "818b9deb21ab1751b2cbcafb0cf73aea705a48bf9a4da0645b0a75a11a584222",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/Vision.swift",
      "ours_sha256": "4f9c17f55ca450e88317f6002cfab3e834711e0444b9ee9d8ee6deaff2673fbb",
      "base_sha256": "4f9c17f55ca450e88317f6002cfab3e834711e0444b9ee9d8ee6deaff2673fbb",
      "theirs_sha256": "9b8d5f8b04f92c79076bc925e58c8e29fe238b1429aca45292eaeb91df545b1f",
      "merged_sha256": "9b8d5f8b04f92c79076bc925e58c8e29fe238b1429aca45292eaeb91df545b1f",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/VisionAttention.swift",
      "ours_sha256": "5bf65f84e71f9befff782516fdd3943e88155dd35aa0c9e6a03a778421c280f2",
      "base_sha256": "5bf65f84e71f9befff782516fdd3943e88155dd35aa0c9e6a03a778421c280f2",
      "theirs_sha256": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
      "merged_sha256": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/Slotstream/VisionPrompt.swift",
      "ours_sha256": "d0aa383cefa9ea52ab7af32d41eb6741bc846830204dc33694de873f4b63b7a6",
      "base_sha256": "d0aa383cefa9ea52ab7af32d41eb6741bc846830204dc33694de873f4b63b7a6",
      "theirs_sha256": "0697edf386f5ee0e6b3ddd616dfe392da247297f87a80ff656a657a8535518b4",
      "merged_sha256": "0697edf386f5ee0e6b3ddd616dfe392da247297f87a80ff656a657a8535518b4",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift",
      "ours_sha256": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "base_sha256": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "theirs_sha256": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "merged_sha256": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
      "ours_sha256": "63a1ab81fe1bd5578111dfc0bdf657602ebe4c4202b7dc1ebb818c0f9ef7b226",
      "base_sha256": "63a1ab81fe1bd5578111dfc0bdf657602ebe4c4202b7dc1ebb818c0f9ef7b226",
      "theirs_sha256": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "merged_sha256": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "ours_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "base_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "theirs_sha256": "ee375f4bae83299fcd2d76cd65f3d8d98f7c542fc8b6c7d7157d802fa5d0c6ee",
      "merged_sha256": "ee375f4bae83299fcd2d76cd65f3d8d98f7c542fc8b6c7d7157d802fa5d0c6ee",
      "conflict": false,
      "ours_existed": false,
      "conflict_resolved": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift",
      "ours_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "base_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "theirs_sha256": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "merged_sha256": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "conflict": false,
      "ours_existed": false,
      "conflict_resolved": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift",
      "ours_sha256": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
      "base_sha256": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
      "theirs_sha256": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
      "merged_sha256": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics.swift",
      "ours_sha256": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "base_sha256": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "theirs_sha256": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "merged_sha256": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/SlotstreamTestKit/T0Checks.swift",
      "ours_sha256": "07a7f37fa122b47f360c542a9a277f98de20a2ba8855cd0952937ff64152827f",
      "base_sha256": "07a7f37fa122b47f360c542a9a277f98de20a2ba8855cd0952937ff64152827f",
      "theirs_sha256": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "merged_sha256": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/slotstream-cli/ContextCommands.swift",
      "ours_sha256": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
      "base_sha256": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
      "theirs_sha256": "43733815ffd825288fc1d8cd64196386dec5d5cd46393d7e27e64f50cc9dc261",
      "merged_sha256": "43733815ffd825288fc1d8cd64196386dec5d5cd46393d7e27e64f50cc9dc261",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/slotstream-cli/OptimizationCommands.swift",
      "ours_sha256": "d287a7d59b2074c5f6a4f34e0cd3c6b0cbd02786779d6328c04f9007106d12ad",
      "base_sha256": "5c1b9570a4836d01312bff2c8af8c565df12598e79e724831fa20fafc6aa2eef",
      "theirs_sha256": "b3f798e321b0909a831cbe9d4f335b5fafa146eb897bfdf4074ace4571e6cf90",
      "merged_sha256": "f0d3057a1668280dc770d019c386c6c8470236fef18484b1601aff6a35dc2e59",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Sources/slotstream-cli/main.swift",
      "ours_sha256": "a4927ad15da17ede7552a8be618cc885b1c2b82a0ccc48f462f0ae1045f1b20d",
      "base_sha256": "a4927ad15da17ede7552a8be618cc885b1c2b82a0ccc48f462f0ae1045f1b20d",
      "theirs_sha256": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "merged_sha256": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    },
    {
      "path": "Tools/context_gates.py",
      "ours_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "base_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "theirs_sha256": "27461549d21c8e1815a8eea59bb1d3a021973c7dd4e02c63929cbfab8048d09a",
      "merged_sha256": "27461549d21c8e1815a8eea59bb1d3a021973c7dd4e02c63929cbfab8048d09a",
      "conflict": false,
      "ours_existed": false,
      "conflict_resolved": false
    },
    {
      "path": "Tools/fixtures/context-default-v1.json",
      "ours_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "base_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "theirs_sha256": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
      "merged_sha256": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
      "conflict": false,
      "ours_existed": false,
      "conflict_resolved": false
    },
    {
      "path": "Tools/planner_gates.sh",
      "ours_sha256": "8d4e902ea6d2891d83a35ba224f1b0c229d79c4dd061509fbd594efaf6cda23a",
      "base_sha256": "8d4e902ea6d2891d83a35ba224f1b0c229d79c4dd061509fbd594efaf6cda23a",
      "theirs_sha256": "ded911c355af3502f1df27387653d8381da9697150b7560880f1e9e3acd14e40",
      "merged_sha256": "ded911c355af3502f1df27387653d8381da9697150b7560880f1e9e3acd14e40",
      "conflict": false,
      "ours_existed": true,
      "conflict_resolved": false
    }
  ],
  "conflict_resolution": "Generate.swift keeps V168 GPU join/unpin immediately after the nonempty guard, covering new admission/model-limit refusals; preserves all proposed checks.",
  "applied": false
}

````

Artifact `/tmp/slotstream-optimization-execution/context-proposal-v2-review/merged/Sources/Slotstream/Generate.swift` — 67849 bytes, SHA-256 `5c30255e255057e25d9bc5e1e895de06c03e59d7c86473aac86c638674960f63`.

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
        stats.promptTokens = promptIds.count
        let embeddingHitsStart = model.resident.embeddingRowHits
        let embeddingMissesStart = model.resident.embeddingRowMisses
        func finish(_ output: [Int]) -> ([Int], GenStats) {
            stats.embeddingRowsEnabled = model.resident.usesEmbeddingRows
            stats.embeddingRowHits = model.resident.embeddingRowHits - embeddingHitsStart
            stats.embeddingRowMisses = model.resident.embeddingRowMisses - embeddingMissesStart
            stats.embeddingCachedRows = model.resident.embeddingCachedRows
            stats.embeddingCachedPayloadBytes = model.resident.embeddingCachedPayloadBytes
            if let failure = request?.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
                stats.memoryPressureCancelled = failure.code == .insufficientMemory
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
        // Every nonempty request returns an idle pool, including an admission
        // refusal, final-token and EOS path. Join GPU users before releasing
        // pins retained by an earlier checked dispatch.
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
                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil,
                contextArithmetic: request?.configuration.qualification == true ? 1 : 0) : nil
        let hit = cache?.takeForGeneration(
            matching: promptIds, images: images,
            reserveTokens: promptIds.count + params.maxTokens,
            reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil), completePromptKey: completeKey,
            modelIdentity: model.promptCheckpointIdentity)
        let state = hit?.state ?? model.makeState()
        let reused = hit?.reused ?? 0
        func checkAllocation(end: Int, workspaceBytes: Int = 0, phase: String) throws {
            let needed = model.sequenceCapacityBytes(tokens: end,
                mtp: speculationEnabled && model.mtpHead != nil)
            let growth = max(0, needed - state.allocatedSequenceBytes)
            let (bytes, overflow) = growth.addingReportingOverflow(workspaceBytes)
            try request?.check(nextAllocationBytes: overflow ? Int.max : bytes, phase: phase)
        }
        let canContinue: () -> Bool = {
            do { try checkAllocation(end: min(ContextPolicy.modelLimit, state.tokenCount + 1), phase: "decode boundary") }
            catch { return false }
            if shouldContinue?() == false {
                let failure = request?.failure ?? RequestFailure(.clientCancelled, "inference was cancelled by its caller")
                request?.fail(failure)
                stats.requestFailure = failure
                if request != nil { stats.runtimeError = failure.message }
                stats.finishReason = "cancelled"
                return false
            }
            return true
        }
        do {
            try request?.admit(missingTokens: promptIds.count - reused, from: reused,
                maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)
            try checkAllocation(end: min(promptIds.count, reused + prefillChunk), phase: "initial state allocation")
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
        let stateKnowsMTP = hit == nil || state.hasValidMTP
        let mtpHead = speculationEnabled && stateKnowsMTP ? model.mtpHead : nil
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
            let passes = model.optimizations.readScopeEnabled
                ? PrefillSchedule.scopePasses(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, maxScope: model.optimizations.readScopeTokens,
                    tailAware: model.optimizations.tailAwarePrefill)
                : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)]
            let hi = i + passes.reduce(0, +)
            do {
                var at = i, workspace = 0
                for pass in passes {
                    at += pass
                    workspace = max(workspace, ContextWorkspace.prefillBytes(pass: pass, context: at,
                        attentionHeads: model.cfg.numAttentionHeads, referenceStart: reused, referenceEnd: promptIds.count))
                }
                workspace = ContextBytes.sum(workspace, ContextBytes.product(max(0, hi - i - (passes.max() ?? 0)), 32_768))
                try checkAllocation(end: hi, workspaceBytes: workspace, phase: "prefill pass")
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
                stats.prefillComputeKeyExtents.append(keyEnd)
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
        shouldContinue: (() -> Bool)?, onToken: ((Int) -> Bool)?,
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
            let availableDepth = action == .calibrate ? 0 : Self.effectiveDraftDepth(requested: requestedDepth,
                remainingOutputs: params.maxTokens - out.count,
                bounded: model.optimizations.boundedDraftTail || policy != nil)
            if policy != nil { stats.adaptiveDraftDepths.append(availableDepth) }
            var draftCancelled = false
            for _ in 0 ..< availableDepth {
                if shouldContinue?() == false { draftCancelled = true; break }
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

Artifact `/tmp/slotstream-context-implementation-20260906/context-serving-13/manifest.json` — 23155 bytes, SHA-256 `13d100c6c94aa4904808424f518a4aab777f75ba3ca47ca177568e4f3f4e4c90`.

````text
{
  "binary": "/private/tmp/slotstream-context-implementation-20260906/build-13/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "56e95af0cf3fbfd7c18174ac8b22167f9a8938b499db1e350186db5a79364a3a",
      "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "Sources/Slotstream/ContextMemory.swift": "a1ca82edc14687685225d1d147359bb43f0b8f8fb38638aeeaeaab2c609a48a8",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "8683f7785cfd88e57482ff3e1c4d3da86f7751b8022b274740538c9450fb947e",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "294a1522dfefb2ea96882584c8229bed4018e8f1f9d47fc64a9cde1f6860dce3",
      "Sources/Slotstream/Governor.swift": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "c35f19748695e6b503b1c73248dd8396765fa53377f7421584b3de78a68abc04",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "51a275760aafabcee646b5a1ad7229bc37e26a8b0b4ba566a3b439f24a0e4c01",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "789837f3bb9a0711ee639b23527647d09a3bb46405bb865eaad9bbec8f076add",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "Sources/Slotstream/PrefixCache.swift": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RequestControl.swift": "71af7ac9f1ca6d274e08f2246b1ed5e3e64cd563de948d5ca03ce37adf7cdd58",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "818b9deb21ab1751b2cbcafb0cf73aea705a48bf9a4da0645b0a75a11a584222",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
      "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "8c7c41044630f1b97a135df88a5094e68ab7e8edb9a56490279549f1d1b59861",
      "Sources/Slotstream/Vision.swift": "9b8d5f8b04f92c79076bc925e58c8e29fe238b1429aca45292eaeb91df545b1f",
      "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
      "Sources/Slotstream/VisionPrompt.swift": "0697edf386f5ee0e6b3ddd616dfe392da247297f87a80ff656a657a8535518b4",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "ee375f4bae83299fcd2d76cd65f3d8d98f7c542fc8b6c7d7157d802fa5d0c6ee",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "607ed040e513178d31a53aceae3d825491faaeb0164cb52567a0f06303fb5042",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "450a558155202d247a8bb73348a381ea35c7c06ed82999a3df356dcc65b2c930",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "f93ede53e78935dc88500ffa339f5ceb8fe8488223010ace7aba443a636ed9b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "5c9265c1df93607a3d9d42cf691aa462b68d01e3b551178c5301134b1de8f6ff",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "c04eef5fdb8c51f98603ab09e4c4f3be8047e2df425118d5016ca779ba2ac246",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
      "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "f2c1fcad37dba3c04fe0613f9aa1afd91f53a1837da9d88345f661ebd965a1ae",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "5e1bd774cf0dc6f9e88a483fff29edb8d0650593b307023e1d579588e2953261",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "62909e346b4a8c288597b0158768d948e470ea3e0f57e8c23a10353eb40da9c9",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
      "Sources/slotstream-cli/main.swift": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "20e895babbbc3e39a797dc11d263bd8a4bd34514a0286459fc7df97e98526516",
    "binary_sha256": "c5ec46cb1d8c6e0af3140ff906b0c0f168419f4a193d419d17e8ba66a8ca6520",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/private/tmp/slotstream-context-implementation-20260906/build-13/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "context-serving",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29192683520,
    "swapins": 43805288,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    20062.\nPages active:                                 935961.\nPages inactive:                              1560353.\nPages speculative:                             40135.\nPages throttled:                                   0.\nPages wired down:                             227647.\nPages purgeable:                                5923.\n\"Translation faults\":                    14844124114.\nPages copy-on-write:                       690565932.\nPages zero filled:                       20038476209.\nPages reactivated:                        3293885595.\nPages purged:                               69619256.\nFile-backed pages:                           1755795.\nAnonymous pages:                              780654.\nPages stored in compressor:                  1529319.\nPages occupied by compressor:                 301211.\nDecompressions:                           1136729937.\nCompressions:                             1447544136.\nPageins:                                  7060400108.\nPageouts:                                   10965695.\nSwapins:                                    43805288.\nSwapouts:                                   77363385.\nPages tagged:                                 160714.\nPages tagged resident:                        128388.\nPages tagged compressed:                       32326.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                          134.\nPages tag-storage non-tag pageable:            91157.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5788352.\nTagged compressions:                        10767248.\nTagged decompressions:                       9940771.\n"
  },
  "preflight_wait": {
    "seconds": 0.0053029579999999965,
    "attempts": 1,
    "limit_seconds": 0
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 835,
  "duration_seconds": 110.690180167,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28756525056,
    "swapins": 43805311,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   362703.\nPages active:                                1099168.\nPages inactive:                               975029.\nPages speculative:                            122061.\nPages throttled:                                   0.\nPages wired down:                             226660.\nPages purgeable:                                  42.\n\"Translation faults\":                    14845338355.\nPages copy-on-write:                       690693040.\nPages zero filled:                       20041557738.\nPages reactivated:                        3294304522.\nPages purged:                               69633019.\nFile-backed pages:                           1392414.\nAnonymous pages:                              803844.\nPages stored in compressor:                  1526655.\nPages occupied by compressor:                 298969.\nDecompressions:                           1136732555.\nCompressions:                             1447544136.\nPageins:                                  7061096432.\nPageouts:                                   10965914.\nSwapins:                                    43805311.\nSwapouts:                                   77363385.\nPages tagged:                                 159384.\nPages tagged resident:                        127428.\nPages tagged compressed:                       31956.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6999.\nPages tag-storage free:                          638.\nPages tag-storage non-tag pageable:            90659.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5713536.\nTagged compressions:                        10767248.\nTagged decompressions:                       9941140.\n"
  }
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/context-serving-13/stdout.txt` — 96493 bytes, SHA-256 `cb00c737d1399c61d29239b009ef57ec45fce21be2815a025be0b268b25d0bb4`.

````text
{
  "items" : [
    {
      "name" : "generate JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: released pins",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: released pins",
      "passed" : true
    },
    {
      "name" : "warm admission: seed succeeds",
      "passed" : true
    },
    {
      "name" : "warm admission: seed retained exact consumed history",
      "passed" : true
    },
    {
      "name" : "warm admission: only missing token is admitted",
      "passed" : true
    },
    {
      "name" : "warm admission: retained estimate is inside budget",
      "passed" : true
    },
    {
      "name" : "cold admission: identical total prompt refused",
      "passed" : true
    },
    {
      "name" : "cold admission: no prompt computation",
      "passed" : true
    },
    {
      "name" : "cold admission: truthful submitted token count",
      "passed" : true
    },
    {
      "name" : "cold admission: failed state absent",
      "passed" : true
    },
    {
      "name" : "client cap: typed pre-header refusal",
      "passed" : true
    },
    {
      "name" : "client cap: server remains unchanged",
      "passed" : true
    },
    {
      "name" : "client cap: later client succeeds",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "queued request expires before headers",
      "passed" : true
    },
    {
      "name" : "\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "\/coding-agent\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation preserves advertised cap",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation fails without allocation",
      "passed" : true
    },
    {
      "name" : "valid legacy assignment recovers",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "context-serving",
  "passed" : true
}

````
