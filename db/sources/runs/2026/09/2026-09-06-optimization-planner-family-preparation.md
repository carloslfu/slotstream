---
type: run
id: 01m1wfnxytk6mjah1qb9szqm4z
created: 2026-09-06T23:08:28.506363+00:00
updated: 2026-09-06T23:08:29.015306+00:00
summary: Unapplied coherent planner-family draft and exact comparison preparation
binary: none; draft unbuilt
captured_at: 2026-09-06
command: prepare V203 source draft and441 public-planner cases; execution pending
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Unapplied coherent planner-family draft and exact comparison preparation
tool: source review and Python syntax check
---
V203 is an UNAPPLIED/UNBUILT planner-family consolidation draft. Existing conservative bytes and prefill/decode anchors remain exact. It has not been promoted or measured. Source changes wait for context P5/source disposition and optional optimization decisions. A complete public-planner equality comparison (441 frozen target/mode/availability/cap/prefix/pass-size cases) is prepared; it has not run. The helper syntax check passes. No source file in the shared repository changed, no model was launched, and no empirical calibration or memory credit is claimed.

## manifest.json

Path: `/tmp/slotstream-optimization-execution/planner-family-draft-v203/manifest.json`
SHA256: `3be86905ee475959b561a82fbcc530ac3ed0a233bda5b1bbb611376920fe4a41`

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
      "after_sha256": "005146741c33a60b9a8f1665f3b4805a8846dabf98ec93265bed1ef76c68de5c"
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "before_sha256": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "after_sha256": "272b23b233c8d62b573a747801ceb91d2c57ff481eb1b8b8f05782986ef97a51"
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "after_sha256": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865"
    }
  ]
}

```

## draft.patch

Path: `/tmp/slotstream-optimization-execution/planner-family-draft-v203/draft.patch`
SHA256: `2f5e8f5a663896a40d022860f9d551a33b84cfbe57b0b6cd6ffb2819a49b5cb8`

```
--- a/Sources/Slotstream/PlannerCostModel.swift
+++ b/Sources/Slotstream/PlannerCostModel.swift
@@ -0,0 +1,23 @@
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
+    package static let prefillLadder: [(upperExclusive: Int, tokensPerSecond: Double)] = [
+        (512, 85), (1024, 125), (2048, 165), (4096, 205),
+    ]
+    package static let prefillTopTokensPerSecond = 220.0
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
@@ -532,13 +532,10 @@
         // the pass is read-bound and the pool barely matters. Ordinary prose
         // reads about 40% slower than this prompt at every size; these are the
         // acceptance prompt's numbers, as the previous ladder's were.
-        switch chunk {
-        case ..<512: return 85
-        case ..<1024: return 125
-        case ..<2048: return 165
-        case ..<4096: return 205
-        default: return 220
-        }
+        for anchor in PlannerCostModel.prefillLadder where chunk < anchor.upperExclusive {
+            return anchor.tokensPerSecond
+        }
+        return PlannerCostModel.prefillTopTokensPerSecond
     }
     /// Smallest honest total-memory target: floor pool + footprint + margin.
     public static var minMemoryGB: Double {
@@ -659,11 +656,11 @@
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
@@ -672,7 +669,7 @@
 
     /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
     /// activations and cache growth ride the existing margins).
-    public static let mtpResidentGB = 1.6
+    public static let mtpResidentGB = Double(PlannerCostModel.mtpResidentBytes) / 1e9
 
     /// The vision tower's resident cost, paid only by a process that is handed
     /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
@@ -681,13 +678,13 @@
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

## cases.json

Path: `/tmp/slotstream-optimization-execution/planner-family-draft-v203/cases.json`
SHA256: `2f313d571b3c64f79e2816a03b3d6dd1e9c0163d023764f7c1f8a527fcb0f801`

```
{
  "classification": "UNRUN exact behavior comparison before/after consolidation; model headers only, no Engine. Capture baseline only after final context/public source disposition and immediately before family-only source change. No empirical calibration or GPU performance claim.",
  "cell_timeout_seconds": 10,
  "whole_timeout_seconds": 600,
  "cases": [
    {
      "id": "target-8.1-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "8.1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-8.1-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "8.1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-8.1-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "8.1",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-9-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "9",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-9-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "9",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-9-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "9",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-10-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "10",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-10-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "10",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-10-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "10",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-11-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "11",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-11-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "11",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-11-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "11",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-12-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "12",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-12-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "12",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-12-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "12",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-13-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "13",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-13-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "13",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-13-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "13",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-14-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "14",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-14-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "14",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-14-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "14",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-15-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "15",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-15-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "15",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-15-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "15",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-16-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "16",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-16-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "16",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-16-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "16",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-17-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "17",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-17-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "17",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-17-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "17",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-18-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "18",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-18-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "18",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-18-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "18",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-19-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "19",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-19-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "19",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-19-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "19",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-20-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "20",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-20-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "20",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-20-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "20",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-21-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "21",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-21-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "21",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-21-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "21",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-22-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "22",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-22-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "22",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-22-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "22",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-23-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "23",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-23-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "23",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-23-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "23",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-24-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "24",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-24-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "24",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-24-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "24",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-25-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "25",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-25-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "25",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-25-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "25",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-26-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "26",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-26-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "26",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-26-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "26",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-27-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "27",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-27-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "27",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-27-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "27",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-28-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "28",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-28-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "28",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-28-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "28",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-29-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "29",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-29-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "29",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-29-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "29",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-30-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "30",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-30-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "30",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-30-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "30",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-31-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "31",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-31-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "31",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-31-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "31",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-32-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "32",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-32-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "32",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-32-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "32",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-33-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "33",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-33-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "33",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-33-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "33",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-34-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "34",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-34-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "34",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-34-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "34",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-35-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "35",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-35-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "35",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-35-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "35",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-36-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "36",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-36-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "36",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-36-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "36",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-37-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "37",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-37-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "37",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-37-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "37",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-38-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "38",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-38-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "38",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-38-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "38",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-39-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "39",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-39-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "39",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-39-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "39",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-40-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "40",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-40-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "40",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-40-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "40",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-41-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "41",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-41-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "41",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-41-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "41",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-42-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "42",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-42-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "42",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-42-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "42",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-43-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "43",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-43-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "43",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-43-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "43",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-44-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "44",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-44-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "44",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-44-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "44",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-45-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "45",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-45-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "45",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-45-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "45",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-46-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "46",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-46-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "46",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-46-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "46",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-47-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "47",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-47-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "47",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-47-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "47",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-48-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "48",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-48-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "48",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-48-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "48",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-49-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "49",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-49-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "49",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-49-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "49",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-50-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "50",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-50-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "50",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-50-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "50",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-51-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "51",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-51-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "51",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-51-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "51",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-52-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "52",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-52-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "52",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-52-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "52",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-53-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "53",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-53-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "53",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-53-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "53",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-54-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "54",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-54-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "54",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-54-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "54",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-55-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "55",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-55-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "55",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-55-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "55",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-56-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "56",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-56-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "56",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-56-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "56",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-57-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "57",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-57-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "57",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-57-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "57",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-58-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "58",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-58-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "58",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-58-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "58",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-59-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "59",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-59-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "59",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-59-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "59",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-60-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "60",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-60-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "60",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-60-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "60",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-61-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "61",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-61-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "61",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-61-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "61",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-62-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "62",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-62-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "62",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-62-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "62",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-63-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "63",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-63-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "63",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-63-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "63",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-64-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "64",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-64-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "64",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-64-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "64",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-65-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "65",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-65-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "65",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-65-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "65",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-66-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "66",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-66-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "66",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-66-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "66",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-67-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "67",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-67-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "67",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-67-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "67",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-68-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "68",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-68-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "68",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-68-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "68",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-69-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "69",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-69-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "69",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-69-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "69",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-70-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "70",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-70-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "70",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-70-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "70",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-71-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "71",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-71-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "71",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-71-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "71",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-72-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "72",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-72-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "72",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-72-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "72",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-73-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "73",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-73-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "73",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-73-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "73",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-74-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "74",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-74-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "74",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-74-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "74",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-75-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "75",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-75-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "75",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-75-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "75",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-76-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "76",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-76-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "76",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-76-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "76",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-77-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "77",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-77-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "77",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-77-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "77",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-78-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "78",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-78-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "78",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-78-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "78",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-79-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "79",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-79-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "79",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-79-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "79",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-80-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "80",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-80-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "80",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-80-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "80",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-81-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "81",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-81-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "81",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-81-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "81",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-82-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "82",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-82-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "82",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-82-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "82",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-83-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "83",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-83-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "83",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-83-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "83",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-84-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "84",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-84-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "84",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-84-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "84",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-85-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "85",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-85-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "85",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-85-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "85",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-86-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "86",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-86-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "86",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-86-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "86",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-87-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "87",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-87-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "87",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-87-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "87",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-88-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "88",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-88-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "88",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-88-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "88",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-89-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "89",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-89-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "89",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-89-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "89",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-90-off",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "90",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-90-on",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "90",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "target-90-auto",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "137.4",
        "--sim-working-set",
        "103.0",
        "--sim-available",
        "120",
        "--memory-gb",
        "90",
        "--mtp",
        "auto",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {}
    },
    {
      "id": "cap-1-off-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-off-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-off-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-1-on-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-1-on-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "1",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-off-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-off-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-8192-on-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-8192-on-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "8192",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-off-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-off-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-32768-on-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-32768-on-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "32768",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-off-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-off-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-off-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-off-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-off-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-off-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-off-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-off-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-off-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-off-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-off-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-off-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "off",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-off-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-off-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "off",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-on-10-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-on-10-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-on-10-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-on-10-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "10",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-on-12-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-on-12-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-on-12-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-on-12-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "12",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-on-44-0-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-on-44-0-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "0",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    },
    {
      "id": "cap-65536-on-on-44-1-256",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "256"
      }
    },
    {
      "id": "cap-65536-on-on-44-1-4096",
      "command": [
        "doctor",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--max-context",
        "65536",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--json"
      ],
      "environment": {
        "SLOTSTREAM_PREFIX_CACHE": "1",
        "SLOTSTREAM_PREFILL_CHUNK": "4096"
      }
    }
  ]
}

```

## compare.py

Path: `/tmp/slotstream-optimization-execution/planner-family-draft-v203/compare.py`
SHA256: `57d042df23f1a1c5ac4d9fa744647e310633fae301c9f693131b70ffbda26d6d`

```
"""Exact, bounded public-planner comparison for a family-only source change."""
import argparse
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT = Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import digest
from serve_bench import verified_build


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', required=True, type=Path)
    parser.add_argument('--out', required=True, type=Path)
    parser.add_argument('--baseline', type=Path)
    args = parser.parse_args()
    case_path = Path(__file__).with_name('cases.json')
    spec = json.loads(case_path.read_text())
    build = verified_build(args.binary)
    baseline = None
    if args.baseline:
        old = json.loads((args.baseline / 'manifest.json').read_text())
        if not old.get('complete') or old.get('cases_sha256') != digest(case_path):
            raise ValueError('a complete baseline with the same cases is required')
        row_path = args.baseline / 'rows.jsonl'
        if digest(row_path) != old['rows_sha256']:
            raise ValueError('baseline rows changed')
        baseline = [json.loads(line) for line in row_path.read_text().splitlines()]
        if len(baseline) != len(spec['cases']):
            raise ValueError('baseline case count differs')
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time timer is active')
    args.out.mkdir(parents=True, exist_ok=False)
    manifest = {'classification': spec['classification'], 'build': build,
                'cases_sha256': digest(case_path), 'driver_sha256': digest(Path(__file__)),
                'complete': False, 'compared': baseline is not None, 'all_exact': False,
                'rows': 0, 'differences': []}
    if args.baseline:
        manifest['baseline'] = {'directory': str(args.baseline.resolve()),
            'manifest_sha256': digest(args.baseline / 'manifest.json'),
            'rows_sha256': digest(args.baseline / 'rows.jsonl')}
    started = time.monotonic()
    def expired(_signum, _frame):
        raise TimeoutError('complete planner comparison reached its frozen deadline')
    previous = signal.signal(signal.SIGALRM, expired)
    signal.setitimer(signal.ITIMER_REAL, spec['whole_timeout_seconds'])
    try:
        with (args.out / 'rows.jsonl').open('x') as output:
            for index, case in enumerate(spec['cases']):
                if case['command'][0] != 'doctor':
                    raise ValueError('only the metadata-only doctor entrypoint is permitted')
                env = {k: v for k, v in os.environ.items()
                       if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
                env.update(case['environment'])
                process = subprocess.run([str(args.binary.resolve()), *case['command']],
                    env=env, text=True, capture_output=True, timeout=spec['cell_timeout_seconds'])
                row = {'case': case, 'exit_code': process.returncode,
                       'stdout': process.stdout, 'stderr': process.stderr}
                if process.returncode not in [0, 2] or 'engine ready' in process.stderr.lower():
                    raise ValueError('unexpected diagnostic failure or Engine construction')
                # Compare complete structured responses; JSON key order is irrelevant.
                try:
                    row['json'] = json.loads(row['stdout'])
                    del row['stdout']
                except json.JSONDecodeError:
                    if process.returncode == 0:
                        raise
                output.write(json.dumps(row, sort_keys=True) + '\n')
                output.flush()
                manifest['rows'] += 1
                if baseline is not None and row != baseline[index]:
                    manifest['differences'].append(case['id'])
                if manifest['rows'] % 40 == 0:
                    print(json.dumps({'completed_cases': manifest['rows'],
                                      'differences': len(manifest['differences'])}), flush=True)
        manifest['complete'] = manifest['rows'] == len(spec['cases'])
        manifest['all_exact'] = baseline is not None and not manifest['differences']
    except BaseException as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)
        manifest['elapsed_seconds'] = time.monotonic() - started
        rows_path = args.out / 'rows.jsonl'
        if rows_path.exists():
            manifest['rows_sha256'] = digest(rows_path)
        (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    passed = manifest['complete'] and (baseline is None or manifest['all_exact'])
    print(json.dumps({k: v for k, v in manifest.items() if k != 'build'}), flush=True)
    return 0 if passed else 1


if __name__ == '__main__':
    raise SystemExit(main())

```

