---
type: run
created: 2026-10-05T02:54:51.015858+00:00
updated: 2026-10-05T02:54:51.015858+00:00
summary: Route explicit CLI pack downloads and verification through their compiled manifest while preserving original defaults
binary: Source on ceddcdf plus captured edits; actual CLI and physical transport execution pending
captured_at: 2026-10-04
command: py_compile; bash -n Tools/static_gates.sh; git diff --check; python3 Tools/static_gates_binary_test.py
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Pack-owned CLI pull preparation
tool: Existing public pull entry point and extended CLI selection/transport gates
---

The pull command now resolves an explicit supported pack ID through the compiled registry, retaining the original name/alias and original default destination behavior. Other supported identities use their own declared model directory under the managed root unless the caller supplies a destination. Verification, resumable download and optional forecast files use that pack's WeightStore and declarations. Unknown identities fail before file creation; downloaded metadata cannot extend the allowlist. Signal cancellation retains the existing production owner. The registry remains original-only, so this change grants no alternate artifact support.

The existing CLI transport test adds selection-only checks that run in native CI without a server, download or sparse partial files: context-free registry inspection must not claim measured execution, and both an absent selected copy and an unregistered identity must refuse without creating their destination. Full physical transport coverage also adds an explicitly named pack through the existing local-source fixture. Every owned child process and server is drained on assertion or timeout, correcting the earlier failure path that could leave a client alive. The full transport portion still requires fresh-install disk admission and a serialized physical slot.

The native selection-only checks are wired into static acceptance with the selected binary, including paths containing spaces. A failing or missing selection gate blocks acceptance. Thirty-four lightweight entry fixtures pass in 40.169 seconds. Python/shell syntax, diff and public claim checks pass. These are entry-wiring fixtures, not execution of the newly compiled Swift pull command, the native metadata gate or the complete transport cases. Those remain pending. The user guide describes explicit pack pull and the actual-load evidence boundary.

A separate one-line app correction rounds the saved ceiling down to whole bytes when confirming a profile, matching the candidate and registry accounting rather than adding a fractional byte of authority. No memory target or saved preference is changed.

CLI run/serve and doctor still use the existing original loader/resource path. Full alternate serving must be connected and verified with the future qualified standalone entry before promotion; a generic pull alone does not close that integration gate. The frozen quality continuation remains active, with no changed binaries or partial-score inspection. No installed artifact, public pack or release is promoted.

### Sources/slotstream-cli/Pull.swift

Original bytes: 5213. SHA-256: `ef6e293042c5940fd6e08523abf7f3ac4a882bba493d28fed05f2703fb28b37e`.

Normalized bytes: 5213. SHA-256: `ef6e293042c5940fd6e08523abf7f3ac4a882bba493d28fed05f2703fb28b37e`.

````zlib-base64
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
+3g51z+wVEBGX8MCZQxK1Q6rOgb8H7EaqHU=
````

### Tools/slotpack/cli_checks.py

Original bytes: 5974. SHA-256: `991a4e6e02ab936ae764180dea5ce9b2da1fbfcc1a09d2b09610aac91be53282`.

Normalized bytes: 5974. SHA-256: `991a4e6e02ab936ae764180dea5ce9b2da1fbfcc1a09d2b09610aac91be53282`.

````zlib-base64
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
````

### Tools/static_gates.sh

Original bytes: 3451. SHA-256: `601a796cfb8d421c9beafcda3a725aa76a1b828329c0829f4f1386434c3c249f`.

Normalized bytes: 3451. SHA-256: `601a796cfb8d421c9beafcda3a725aa76a1b828329c0829f4f1386434c3c249f`.

````zlib-base64
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
DpL/AK8P91w=
````

### Tools/static_gates_binary_test.py

Original bytes: 17971. SHA-256: `084f29ea0dbacb5226a7a200521ebc5bbcf14eaa7c6d427cc0dc14d5d5c3df5d`.

Normalized bytes: 17971. SHA-256: `084f29ea0dbacb5226a7a200521ebc5bbcf14eaa7c6d427cc0dc14d5d5c3df5d`.

````zlib-base64
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
34NpB/2Y7gjY/B8aiQEs
````

### .build/quantization-research/pack-owned-cli-pull-entry-checks-v1.log

Original bytes: 134. SHA-256: `5a6c1471a704237d60752f03181b10615fe1a86b724f2feb85f685175b01ef32`.

Normalized bytes: 134. SHA-256: `5a6c1471a704237d60752f03181b10615fe1a86b724f2feb85f685175b01ef32`.

````zlib-base64
eNrT0yMEuHSpAriCEvMUjE0USlKLS4oVMvMUTAz0DM0si7m4/L25AGSCGe4=
````

### App byte-boundary and user-guide diff

````diff
diff --git a/apps/macos/Runtime/Inference.swift b/apps/macos/Runtime/Inference.swift
index 29b0eb0..a3c4e09 100644
--- a/apps/macos/Runtime/Inference.swift
+++ b/apps/macos/Runtime/Inference.swift
@@ -788,7 +788,7 @@ public actor LocalInference: Inference {
         let candidate = loaded.engine, identity = loaded.identity
         let ceilingBytes: Int64
         if let gb = identity.memoryCeilingGB, gb.isFinite, gb > 0, gb * 1e9 < Double(Int64.max) {
-            ceilingBytes = Int64((gb * 1e9).rounded())
+            ceilingBytes = Int64((gb * 1e9).rounded(.down))
         } else { ceilingBytes = 0 }
         let confirmed = proposed.flatMap { ModelPackRegistry.confirm($0, candidate: loaded.observed,
             admissionMachine: loaded.admissionMachine, ceilingBytes: ceilingBytes, requiredFeatures: [.text, .tools]) }
diff --git a/docs/SEVRA-MAC.md b/docs/SEVRA-MAC.md
index 2bc31c7..d7ceb63 100644
--- a/docs/SEVRA-MAC.md
+++ b/docs/SEVRA-MAC.md
@@ -515,6 +515,12 @@ the product selector; an explicit supported pack ID overrides it. Omitting
 with a custom model directory requires that directory to pass the complete
 pinned verification; it is not silently repaired into another representation.
 
+`slotstream pull PACK_ID` downloads the supported pack named by `model-packs`.
+Use `--dir PATH` for an explicit destination and `--verify` to check an existing
+copy without downloading. Its manifest and optional forecast components belong
+to that selected pack. An unavailable ID is refused before model files are
+written. Plain `slotstream pull` keeps the original model and destination rules.
+
 Selection metadata separates an exact measured configuration, a conservative
 estimate and unknown performance. Measured matching includes power and thermal
 conditions and describes performance observed in matching tests. A matching
@@ -525,6 +531,12 @@ replace load-time verification. The reviewed profile registry remains empty;
 the original pack is still the supported fallback and no speed target is
 certified. Manual choices remain independent of the recommendation.
 
+The app confirms speed evidence only after the actual loaded configuration
+passes its startup check and activation succeeds. A changed memory allocation,
+operating condition or pending setting withholds that evidence. A restored
+previous model cannot inherit the failed selection's speed label. These status
+changes leave your quantization choice and memory ceiling intact.
+
 The model loads with the first request and verifies the pinned files. Within
 that app session, unchanged files on APFS can reuse the successful verification
 after unloading. File identity, size and modification/change timestamps are

````
