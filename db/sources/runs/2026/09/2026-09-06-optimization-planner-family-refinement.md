---
type: run
id: 01m1wj35hz6mqey1gmq2werckb
created: 2026-09-06T23:50:39.422987+00:00
updated: 2026-09-06T23:50:39.836063+00:00
summary: Unapplied planner-family refinement preserves direct dispatch
binary: none; unapplied and unbuilt
captured_at: 2026-09-06
command: prepare V208 without changing runtime source
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Unapplied planner-family refinement preserves direct dispatch
tool: source-only draft review
---
V208 supersedes only the UNAPPLIED V203 cost-family preparation. It keeps the original direct switch with separately named static scalar anchors, avoiding a new heap-backed array/loop in this data consolidation. Current runtime files and all parameter values remain unchanged. Original V203 source/cases/helper are retained byte-for-byte. The same441-case exact comparison and final resource prerequisites remain UNRUN; adoption waits for context P5/source disposition.

## /tmp/slotstream-optimization-execution/planner-family-draft-v208/manifest.json

SHA256 `2faa1eef8b0bb41081f6c2c35ace70e5ace026030b7022fbd3dbec20f6f4929e`

```
{
  "state": "UNAPPLIED_UNBUILT; preserve context P5 frozen source interval",
  "purpose": "Prevent independent drift between integer admission/workspace allowances, public planning and coupled prefill/decode cost model. Existing bytes/anchors and arithmetic order preserved; no recalibration or saving is inferred.",
  "requirements": [
    "Review after optional candidate dispositions and context P5 return",
    "Exact baseline/new doctor family comparison and existing planner/context catalogue",
    "Fresh measured final resource validation; retain allowances absent sufficient complete-family evidence"
  ],
  "files": [
    {
      "path": "Sources/Slotstream/PlannerCostModel.swift",
      "before_sha256": null,
      "after_sha256": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0"
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "before_sha256": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "after_sha256": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae"
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "after_sha256": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865"
    }
  ],
  "supersedes_unapplied_draft": "V203; immutable predecessor remains preserved",
  "review_refinement": "Retain the original direct switch; separate static scalar anchors avoid introducing a heap-backed ladder and loop just to consolidate constants. No runtime source is applied."
}

```

## /tmp/slotstream-optimization-execution/planner-family-draft-v208/draft.patch

SHA256 `d398de5d40ae1c424165c5b2793010512916738c2e6ea0d640315044d8fbb65c`

```
--- a/Sources/Slotstream/PlannerCostModel.swift
+++ b/Sources/Slotstream/PlannerCostModel.swift
@@ -0,0 +1,24 @@
+// One versioned empirical envelope for planning, reporting and dispatch guards.
+// These are the existing conservative allowances and throughput anchors. This
+// consolidation grants no new memory credit and claims no new speedup. Update
+// the family only with a complete measured envelope and policy comparison.
+package enum PlannerCostModel {
+    package static let identity = "m5-pro-reference-envelope-v1"
+    package static let fixedBytes = 5_300_000_000
+    package static let planningMarginBytes = 1_000_000_000
+    package static let prefillBytesPerToken = 1_300_000
+    package static let mtpResidentBytes = 1_600_000_000
+    package static let visionResidentBytes = 900_000_000
+    package static let visionLoadMarginBytes = 1_000_000_000
+    package static let tuningPromptTokens = 2000.0
+    package static let tuningReplyTokens = 400.0
+    package static let decodeLowExpertsPerLayer = 30.0
+    package static let decodeLowTokensPerSecond = 6.0
+    package static let decodePlateauPerLayer = 150.0
+    package static let decodePlateauTokensPerSecond = 11.6
+    package static let prefill256TokensPerSecond = 85.0
+    package static let prefill512TokensPerSecond = 125.0
+    package static let prefill1024TokensPerSecond = 165.0
+    package static let prefill2048TokensPerSecond = 205.0
+    package static let prefill4096TokensPerSecond = 220.0
+}
--- a/Sources/Slotstream/Plan.swift
+++ b/Sources/Slotstream/Plan.swift
@@ -349,10 +349,10 @@
     /// transferred directly into MLX in batches of at most 32 records,
     /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
     /// transient.
-    public static let fixedFootprintGB = 5.3
+    public static let fixedFootprintGB = Double(PlannerCostModel.fixedBytes) / 1e9
     /// Extra slack when deriving a pool from a total-memory target, so the
     /// promise ("stays under G") survives transients.
-    public static let planningMarginGB = 1.0
+    public static let planningMarginGB = Double(PlannerCostModel.planningMarginBytes) / 1e9
 
     /// What a prefill pass costs in transient activations.
     ///
@@ -371,7 +371,7 @@
     /// peak by 0.1 GB. 1.30 MB/token is charged here so the estimate errs high
     /// at every measured point.
     public static func prefillCostGB(_ chunk: Int) -> Double {
-        Double(chunk) * 1.30e-3
+        Double(chunk) * (Double(PlannerCostModel.prefillBytesPerToken) / 1e9)
     }
 
     /// KV plus indexer state for a context of `tokens`, which the pool math
@@ -426,8 +426,8 @@
     /// is worth nothing and pass memory is worth a lot.
     /// A request this plan is tuned for: prompt tokens, then generated tokens.
     /// Only ever used to choose the prefill pass size — never correctness.
-    static let tuningPromptTokens = 2000.0
-    static let tuningReplyTokens = 400.0
+    static let tuningPromptTokens = PlannerCostModel.tuningPromptTokens
+    static let tuningReplyTokens = PlannerCostModel.tuningReplyTokens
 
     /// The prefill pass to run at a given pool budget: the one that finishes a
     /// representative request soonest.
@@ -533,11 +533,11 @@
         // reads about 40% slower than this prompt at every size; these are the
         // acceptance prompt's numbers, as the previous ladder's were.
         switch chunk {
-        case ..<512: return 85
-        case ..<1024: return 125
-        case ..<2048: return 165
-        case ..<4096: return 205
-        default: return 220
+        case ..<512: return PlannerCostModel.prefill256TokensPerSecond
+        case ..<1024: return PlannerCostModel.prefill512TokensPerSecond
+        case ..<2048: return PlannerCostModel.prefill1024TokensPerSecond
+        case ..<4096: return PlannerCostModel.prefill2048TokensPerSecond
+        default: return PlannerCostModel.prefill4096TokensPerSecond
         }
     }
     /// Smallest honest total-memory target: floor pool + footprint + margin.
@@ -659,11 +659,11 @@
     /// Where the measured decode curve stops improving: 11.2 tok/s at 120
     /// experts/layer, 11.6 at 150, flat after. Both the estimate and the
     /// prefill-pass sizing key off this one number.
-    public static let decodePlateauPerLayer = 150.0
+    public static let decodePlateauPerLayer = PlannerCostModel.decodePlateauPerLayer
 
     public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
-        let (e0, r0) = (30.0, 6.0)
-        let (e1, r1) = (decodePlateauPerLayer, 11.6)
+        let (e0, r0) = (PlannerCostModel.decodeLowExpertsPerLayer, PlannerCostModel.decodeLowTokensPerSecond)
+        let (e1, r1) = (decodePlateauPerLayer, PlannerCostModel.decodePlateauTokensPerSecond)
         if e >= e1 { return r1 }
         if e <= e0 { return r0 * (max(e, 1) / e0) }
         let t = log(e / e0) / log(e1 / e0)
@@ -672,7 +672,7 @@
 
     /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
     /// activations and cache growth ride the existing margins).
-    public static let mtpResidentGB = 1.6
+    public static let mtpResidentGB = Double(PlannerCostModel.mtpResidentBytes) / 1e9
 
     /// The vision tower's resident cost, paid only by a process that is handed
     /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
@@ -681,13 +681,13 @@
     /// Engine reserves this inside a target-driven plan before loading the
     /// tower. A raw pool-size request keeps that explicit pool size and reports
     /// the additional resident bytes in its expected peak.
-    public static let visionResidentGB = 0.9
+    public static let visionResidentGB = Double(PlannerCostModel.visionResidentBytes) / 1e9
 
     /// Headroom demanded on top of the tower's own bytes before loading it.
     /// The load briefly holds arrays twice while MLX materializes them.
     /// Attention transients depend on the actual dispatch: the established
     /// 72-wide fallback can form an N² matrix and are not bounded by this term.
-    public static let visionLoadMarginGB = 1.0
+    public static let visionLoadMarginGB = Double(PlannerCostModel.visionLoadMarginBytes) / 1e9
     /// Auto enables the draft head only when the cache still affords this
     /// many experts per layer AFTER paying for it (M9 design note: below
     /// ~120/layer the displaced experts are worth more than the multiplier;
--- a/Sources/Slotstream/ContextMemory.swift
+++ b/Sources/Slotstream/ContextMemory.swift
@@ -86,18 +86,18 @@
 
     public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                 mtp: Bool, visionResident: Bool) {
-        fixedBytes = 5_300_000_000
-        poolBytes = ContextBytes.product(slots, 2_764_800)
+        fixedBytes = PlannerCostModel.fixedBytes
+        poolBytes = ContextBytes.product(slots, Int(Geometry.recordBytes))
         activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
         additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
         retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
         retainedRecurrentBytes = retentionTokens > 0
             ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
-        prefillBytes = ContextBytes.product(chunk, 1_300_000)
+        prefillBytes = ContextBytes.product(chunk, PlannerCostModel.prefillBytesPerToken)
         longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
-        mtpResidentBytes = mtp ? 1_600_000_000 : 0
-        visionResidentBytes = visionResident ? 900_000_000 : 0
-        planningMarginBytes = 1_000_000_000
+        mtpResidentBytes = mtp ? PlannerCostModel.mtpResidentBytes : 0
+        visionResidentBytes = visionResident ? PlannerCostModel.visionResidentBytes : 0
+        planningMarginBytes = PlannerCostModel.planningMarginBytes
     }
 
     /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
@@ -187,7 +187,7 @@
         // Indexer score/mask/top-k and selected attention coexist with layer
         // activations. Preserve the original linear allowance; bound the
         // query-by-context part even when late passes fall below 256.
-        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), 1_300_000),
+        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), PlannerCostModel.prefillBytesPerToken),
             ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
     }
 

```

Unchanged V203 cases SHA256 `2f313d571b3c64f79e2816a03b3d6dd1e9c0163d023764f7c1f8a527fcb0f801`; comparison helper SHA256 `57d042df23f1a1c5ac4d9fa744647e310633fae301c9f693131b70ffbda26d6d`.
