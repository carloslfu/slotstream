---
type: run
created: 2026-10-05T04:29:24.977918+00:00
updated: 2026-10-05T04:29:24.977918+00:00
summary: Bind startup performance proposals to actual compiler assertion mode and withhold loaded speed evidence for nonrelease builds
binary: Source preparation based on 4df189590e13b5d1d333f1fda2e49738b8bc754b; no native execution for this change yet
captured_at: 2026-10-04
command: Read installed Swift standard-library interface; git diff --check; Tools/llms_full.sh; python3 Tools/claims_gate.py
tool: Source inspection and performance evidence boundary checks
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Compiler mode in automatic performance evidence
---

Review found that the runtime version, execution controls and hardware identity did not distinguish an unoptimized debug build from the checked optimized build that final performance testing will use. No compiled automatic profile exists yet, so no measured profile is withdrawn. The proposed execution identity now includes the compiler's actual assertion configuration, using the installed Swift standard-library queries rather than an ambient DEBUG value. Loaded observation permits the checked release mode only. Debug, unchecked and unknown modes continue to run supported models with ordinary safety and controls but cannot inherit those speed measurements.

The existing environment gate remains intact. Its pure checks now exercise allowed and refused environments under an explicit release fixture and refuse every other compiler mode. An additional assertion checks the production default against the actual mode of the compiled library; normal optimized and instrumented debug CI both exercise it. This is a compiler-mode boundary, not a replacement for final exact-binary performance and release provenance checks. Startup acceptance recipe identity and the release version remain unchanged; the complete performance proposal identity changes. Source checks pass; native validation is pending. The frozen quality program, registered packs and installed binaries are unchanged.

## preparation.json

Local evidence: `.build/quantization-research/pack-build-evidence-preparation-v1/preparation.json`; bytes: 769; SHA-256: `f856b61554d7ad6f24ffcfbf9c80659d19eb6cf1716bed84150180139285b825`.

```json
{
  "schema": 1,
  "source_base": "4df189590e13b5d1d333f1fda2e49738b8bc754b",
  "stdlib_interface": "/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk/usr/lib/swift/Swift.swiftmodule/arm64e-apple-macos.swiftinterface",
  "stdlib_interface_sha256": "dbd42cceeec645bf2b0ea08e87762e9581637cacd95cd62f2b6c05b136aca824",
  "stdlib_excerpt_start_line": 2436,
  "stdlib_excerpt_end_line": 2456,
  "diff_check_passed": true,
  "claims": "claims gate: 349 needle checks, 0 failures",
  "startup_candidate_identity_schema": 3,
  "release_version_changed": false,
  "native_release_and_instrumented_debug_checks": "pending on this change",
  "alternative_registry_entries": 0,
  "automatic_profiles": 0,
  "local_model_execution": false,
  "frozen_quality_changed": false
}

```

## stdlib-assertion-mode.txt

Local evidence: `.build/quantization-research/pack-build-evidence-preparation-v1/stdlib-assertion-mode.txt`; bytes: 427; SHA-256: `7a1d902b0892f9ed7b7bc106896007a22de549188246fdd95744e129238a8f04`.

```text
@_transparent public func _isDebugAssertConfiguration() -> Swift.Bool {
   
   
   
   
  return Int32(Builtin.assert_configuration()) == 0
}
@_transparent public func _isReleaseAssertConfiguration() -> Swift.Bool {
   
   
   
   
  return Int32(Builtin.assert_configuration()) == 1
}
@_transparent public func _isFastAssertConfiguration() -> Swift.Bool {
   
   
   
   
  return Int32(Builtin.assert_configuration()) == 2
}

```

## claims.txt

Local evidence: `.build/quantization-research/pack-build-evidence-preparation-v1/claims.txt`; bytes: 43; SHA-256: `71d5b4e4bd5bd4fa5fcfd6a0c6f0e5869d0c8e36ef1bd5219b0d450f89f15940`.

```text
claims gate: 349 needle checks, 0 failures

```

## implementation.diff

Local evidence: `.build/quantization-research/pack-build-evidence-preparation-v1/implementation.diff`; bytes: 6219; SHA-256: `4154e8844bf9a5b71c74f8c69e67b7e34e7eccc5effd1c216f363bf99d591e3b`.

```diff
diff --git a/Sources/Slotstream/ModelPackLoadedSelection.swift b/Sources/Slotstream/ModelPackLoadedSelection.swift
index b8f9fe6..097fa96 100644
--- a/Sources/Slotstream/ModelPackLoadedSelection.swift
+++ b/Sources/Slotstream/ModelPackLoadedSelection.swift
@@ -20,7 +20,9 @@ extension Engine {
     /// measurements. Only names are inspected; secret values are never hashed,
     /// retained or exposed as evidence. These two names select test/build tools
     /// and have no effect on execution inside an already built runtime.
-    package static func admitsStartupEvidence(environment: [String: String]) -> Bool {
+    package static func admitsStartupEvidence(environment: [String: String],
+        build: SlotstreamBuild.PerformanceConfiguration = .current) -> Bool {
+        guard build == .release else { return false }
         let tooling: Set<String> = ["SLOTSTREAM_TEST_BINARY", "SLOTSTREAM_METALLIB_MACOS"]
         return !environment.keys.contains { name in
             (name.hasPrefix("SLOTSTREAM_") && !tooling.contains(name)) || name.hasPrefix("MLX_")
diff --git a/Sources/Slotstream/ModelPackStartupSelection.swift b/Sources/Slotstream/ModelPackStartupSelection.swift
index eace776..aedf789 100644
--- a/Sources/Slotstream/ModelPackStartupSelection.swift
+++ b/Sources/Slotstream/ModelPackStartupSelection.swift
@@ -104,9 +104,10 @@ public extension ModelPack {
         }
         let encoder = JSONEncoder(); encoder.outputFormatting = [.sortedKeys]
         let optimizations = startupOptimizations(plan: plan, hardware: observation.hardware)
-        let object: [String: Any] = ["schema": 2,
+        let object: [String: Any] = ["schema": 3,
             "recipe": startupDefaults.executionIdentity(liveMemory: liveMemory), "forecast": forecast,
             "runtime_version": SlotstreamBuild.version, "compatibility": compatibility,
+            "assert_configuration": SlotstreamBuild.PerformanceConfiguration.current.rawValue,
             "optimizations": String(decoding: try encoder.encode(optimizations), as: UTF8.self),
             "context_arithmetic": PromptCheckpointKey.currentContextArithmetic]
         let bytes = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
diff --git a/Sources/Slotstream/Version.swift b/Sources/Slotstream/Version.swift
index 310c180..75845f1 100644
--- a/Sources/Slotstream/Version.swift
+++ b/Sources/Slotstream/Version.swift
@@ -3,6 +3,20 @@
 
 public enum SlotstreamBuild {
     public static let version = "0.2.27"
+
+    /// Read the compiler's actual assertion mode rather than a user-supplied
+    /// DEBUG define. The checked optimized build is the measured product
+    /// configuration; debug and unchecked builds keep unknown speed evidence.
+    package enum PerformanceConfiguration: String, CaseIterable, Sendable {
+        case debug, release, unchecked, unknown
+
+        package static var current: Self {
+            if _isDebugAssertConfiguration() { return .debug }
+            if _isReleaseAssertConfiguration() { return .release }
+            if _isFastAssertConfiguration() { return .unchecked }
+            return .unknown
+        }
+    }
 }
 
 /// Model name used in error messages. The pinned manifest lives in the
diff --git a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift
index abb0228..f93ccb3 100644
--- a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift
@@ -98,13 +98,19 @@ extension Diagnostics {
         for environment in [[:], ["PATH": "/fixture", "SEVRA_MODEL": "/fixture/model"],
                             ["SLOTSTREAM_TEST_BINARY": "/fixture/cli", "SLOTSTREAM_METALLIB_MACOS": "26"]] {
             c.expect("ordinary paths and build-tool selectors do not change loaded execution evidence",
-                Engine.admitsStartupEvidence(environment: environment))
+                Engine.admitsStartupEvidence(environment: environment, build: .release))
         }
         for environment in [["SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1"], ["SLOTSTREAM_FUTURE_OVERRIDE": "fixture"],
                             ["MLX_FIXTURE_OPTION": "fixture"]] {
             c.expect("explicit or unknown runtime tuning cannot inherit default measurements",
-                !Engine.admitsStartupEvidence(environment: environment))
+                !Engine.admitsStartupEvidence(environment: environment, build: .release))
         }
+        for build in SlotstreamBuild.PerformanceConfiguration.allCases where build != .release {
+            c.expect("unmeasured compiler modes cannot inherit optimized runtime evidence/\(build.rawValue)",
+                !Engine.admitsStartupEvidence(environment: [:], build: build))
+        }
+        c.equal("the production evidence check observes this compiled library's actual mode",
+            Engine.admitsStartupEvidence(environment: [:]), _isReleaseAssertConfiguration())
         let overridden = try ModelPackRegistry.resolve(.pack(pack.id), context: try input(installed: [:]))
         c.expect("explicit choice remains exact without granting installation or allocation",
             overridden.pack.id == pack.id && !overridden.automatic && overridden.evidence == .unknown)
diff --git a/docs/ENGINEERING.md b/docs/ENGINEERING.md
index da3f836..a3b9d4c 100644
--- a/docs/ENGINEERING.md
+++ b/docs/ENGINEERING.md
@@ -40,6 +40,11 @@ publishing the runtime. The independent Engine initializers retain their
 existing behavior. An additional registry entry still needs an authenticated
 loader and completed qualification.
 
+Automatic performance matching also binds the compiler's assertion mode.
+Debug and unchecked builds cannot inherit a checked optimized build's speed
+evidence. They still run supported models with normal admission and user
+controls; their performance status remains unknown.
+
 `slotstream quantization-check --kernels` checks native layout decoding and
 affine operation support. `Tools/quantization_inventory.py` and
 `Tools/quantization_fixture.py` inspect pinned metadata and extract bounded real

```
