---
type: run
created: 2026-10-05T04:19:58.223674+00:00
updated: 2026-10-05T04:19:58.223674+00:00
summary: Shared selected-pack Engine loading boundary and owned CLI server size, with source checks and preceding CI receipts
binary: Source preparation based on 5288f0a34bff05d93159cbca602287ea76747217; no new native binary run locally
captured_at: 2026-10-04
command: git diff --check; bash -n Tools/consumer_smoke.sh; Tools/llms_full.sh; python3 Tools/claims_gate.py; gh run view
tool: Source review, static checks and GitHub CI receipts
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Pack-owned product loading preparation
---

Desktop and the opt-in CLI now call the same additive maintained-pack Engine initializer. It checks the selected pack's resource contract, compiled loader availability and simulation flag before entering the existing Engine initializer. The original pack is still the only supported loader. The independent Engine API and omitted CLI selection preserve their existing behavior. Selected CLI serving now reports the selected deployment's file size. Startup tuning, full WeightStore authentication, health checks, durable activation and observed performance confirmation retain their separate owner boundaries.

The existing native planning gate now refuses an alternate allocation routed to the original pack and a simulated original plan. The external consumer compiles the old and new constructors and exercises the simulated-plan refusal without reading model bytes. Diff, shell syntax and claims checks pass. New native execution remains pending. The preceding context and CLI workflow results below apply only to their recorded commits. No standalone payload, alternate loader, registry entry, automatic profile, installed binary or public release is promoted.

## preparation.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/preparation.json`; bytes: 1222; SHA-256: `470926712add1eb58fb3fd58ac9c93fa5208fe257471f3e408a75e7f63670338`.

```json
{
  "schema": 1,
  "source_base": "5288f0a34bff05d93159cbca602287ea76747217",
  "implementation_diff_sha256": "48c242a37b509dbf35e23e97182c8c0482cf89039a93edb02272e222cfe00602",
  "diff_check_passed": true,
  "consumer_shell_syntax_passed": true,
  "claims": "claims gate: 349 needle checks, 0 failures",
  "local_native_execution": false,
  "new_native_validation": "pending CI after this source change is committed",
  "alternative_registry_entries": 0,
  "automatic_profiles": 0,
  "prior_ci": {
    "context-engine-ci.json": {
      "head": "2bb470676ed39e1c7aff1593c28da3cd9a1a678a",
      "status": "completed",
      "conclusion": "success",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37259065608"
    },
    "selected-cli-engine-ci.json": {
      "head": "07139e56e5e1c40612dc87e0a3956cd1f77180b2",
      "status": "completed",
      "conclusion": "success",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37260220007"
    },
    "selected-cli-mac-ci.json": {
      "head": "07139e56e5e1c40612dc87e0a3956cd1f77180b2",
      "status": "completed",
      "conclusion": "success",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37260219978"
    }
  }
}

```

## claims.txt

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/claims.txt`; bytes: 43; SHA-256: `71d5b4e4bd5bd4fa5fcfd6a0c6f0e5869d0c8e36ef1bd5219b0d450f89f15940`.

```text
claims gate: 349 needle checks, 0 failures

```

## implementation.diff

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/implementation.diff`; bytes: 10594; SHA-256: `48c242a37b509dbf35e23e97182c8c0482cf89039a93edb02272e222cfe00602`.

```diff
diff --git a/Sources/Slotstream/Engine.swift b/Sources/Slotstream/Engine.swift
index c26c32f..5539912 100644
--- a/Sources/Slotstream/Engine.swift
+++ b/Sources/Slotstream/Engine.swift
@@ -397,6 +397,15 @@ public final class Engine {
         try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
     }
 
+    /// Load a compiled maintained deployment with its own complete memory
+    /// plan. The owner authenticates the selected WeightStore first. This
+    /// does not apply product tuning or confer a measured performance profile;
+    /// those remain explicit steps before publishing a healthy runtime.
+    public convenience init(modelDir: URL, pack: ModelPack, plan: MemoryPlan) async throws {
+        try pack.validateLoadPlan(plan)
+        try await self.init(modelDir: modelDir, plan: plan)
+    }
+
     /// Whether generations keep the GPU awake (`GPUKeepAlive`). The default
     /// comes from SLOTSTREAM_GPU_KEEPALIVE, `auto` when unset or invalid; the
     /// CLI validates its own flag.
diff --git a/Sources/Slotstream/ModelPackRegistry.swift b/Sources/Slotstream/ModelPackRegistry.swift
index fa12959..d879efa 100644
--- a/Sources/Slotstream/ModelPackRegistry.swift
+++ b/Sources/Slotstream/ModelPackRegistry.swift
@@ -181,6 +181,22 @@ public extension WeightStore {
     }
 }
 
+extension ModelPack {
+    /// The product's selected deployment must keep its own allocation and
+    /// loader contract. This check is shared by Desktop and the opt-in CLI;
+    /// adding a registry entry alone cannot enable a new representation.
+    package func validateLoadPlan(_ plan: MemoryPlan) throws {
+        guard plan.resources == memoryProfile else {
+            throw PlanError("The selected model pack and load plan have different resource contracts")
+        }
+        guard id == ModelPackRegistry.baseline.id,
+              manifestDigest == ModelPackRegistry.baseline.manifestDigest else {
+            throw PlanError("The selected model pack has no supported loader in this build")
+        }
+        guard !plan.simulated else { throw SlotstreamError.simulatedDeviceCannotLoad }
+    }
+}
+
 /// Startup selection and ongoing allocation management are independent.
 /// Fixed capacity still observes pressure and may refuse or stop a request.
 public enum LiveMemoryManagement: String, Codable, CaseIterable, Sendable {
diff --git a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
index cee6094..5b1ad2e 100644
--- a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
@@ -122,6 +122,20 @@ extension Diagnostics {
         c.expect("uncalibrated pack keeps its supported default and complete geometry",
             automatic.plan.resources == resources && automatic.plan.maxContextTokens == 32768 &&
             automatic.plan.mtpEnabled && automatic.plan.mtpStreamedExperts && automatic.plan.simulated)
+        do {
+            try pack.validateLoadPlan(automatic.plan)
+            c.expect("selected original cannot route an alternate allocation into its loader", false)
+        } catch {
+            c.expect("selected original cannot route an alternate allocation into its loader",
+                String(describing: error).contains("different resource contracts"))
+        }
+        let simulatedOriginal = try pack.plan(contextRequest, on: roomy)
+        do {
+            try pack.validateLoadPlan(simulatedOriginal)
+            c.expect("maintained loading cannot turn a simulated budget into an allocation", false)
+        } catch SlotstreamError.simulatedDeviceCannotLoad {
+            c.expect("maintained loading cannot turn a simulated budget into an allocation", true)
+        }
         c.expect("uncalibrated pack does not inherit original request estimates",
             !Planner.estimatedRequestSeconds(automatic.plan).isFinite &&
             automatic.automatic?.candidates.allSatisfy { $0.requestSeconds == nil && $0.relativeRequestCost == nil } == true)
diff --git a/Sources/slotstream-cli/main.swift b/Sources/slotstream-cli/main.swift
index 74306cc..5d1e514 100644
--- a/Sources/slotstream-cli/main.swift
+++ b/Sources/slotstream-cli/main.swift
@@ -249,12 +249,8 @@ struct ModelOptions: ParsableArguments {
     /// another representation must provide its authenticated loader here; a
     /// different pack cannot fall through to the original checkpoint loader.
     func loadEngine(plan: MemoryPlan) async throws -> Engine {
-        let pack = try selectedPack
-        guard plan.resources == (pack?.memoryProfile ?? .original) else {
-            throw PlanError("the selected pack and load plan have different resource contracts")
-        }
-        guard pack == nil || pack?.id == ModelPackRegistry.baseline.id else {
-            throw PlanError("the selected pack has no supported serving loader in this build")
+        if let pack = try selectedPack {
+            return try await Engine(modelDir: modelURL, pack: pack, plan: plan)
         }
         return try await Engine(modelDir: modelURL, plan: plan)
     }
@@ -851,7 +847,7 @@ struct Serve: ParsableCommand {
         }
         defer { governor?.stop() }
         let server = Server(
-            engine: engine, port: port, weightsBytes: Int(PinnedModel.totalBytes),
+            engine: engine, port: port, weightsBytes: Int(try model.selectedPack?.totalBytes ?? PinnedModel.totalBytes),
             listenFD: listenFD)
         server.onDiagnostic = { line in
             let stamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
diff --git a/Tools/consumer_smoke.sh b/Tools/consumer_smoke.sh
index 0cb4ce5..865982e 100755
--- a/Tools/consumer_smoke.sh
+++ b/Tools/consumer_smoke.sh
@@ -57,6 +57,15 @@ let cancelled = PullCancellation()
 cancelled.cancel()
 let cancelledOptions = PullOptions(cancellation: cancelled)
 
+// Compile both the independent and maintained loaders without allocating or
+// reading weights. Product controls remain a separate, explicit operation.
+func independentLoad(_ directory: URL, _ plan: MemoryPlan) async throws -> Engine {
+    try await Engine(modelDir: directory, plan: plan)
+}
+func maintainedLoad(_ directory: URL, _ pack: ModelPack, _ plan: MemoryPlan) async throws -> Engine {
+    try await Engine(modelDir: directory, pack: pack, plan: plan)
+}
+
 // Preserve existing public function-value signatures and ordinary calls.
 func legacyEngineMethods(_ engine: Engine) {
     let generate: ([Int], SampleParams, VisionPrompt?, (() -> Bool)?, ((Int, String) -> Bool)?) -> (text: String, ids: [Int], stats: GenStats) = engine.generate
@@ -94,6 +103,10 @@ let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: Machine.simulated(ram
 precondition(plan.slots > 0, "a 16 GB plan should size a pool")
 precondition(plan.simulated, "a simulated machine must mark its plan")
 let maintained = ModelPackRegistry.baseline
+do {
+    _ = try await maintainedLoad(URL(fileURLWithPath: "/unused-model-fixture"), maintained, plan)
+    preconditionFailure("maintained loading must refuse simulated hardware before reading model files")
+} catch SlotstreamError.simulatedDeviceCannotLoad { }
 let legacyFeasibility: (PlanRequest, Machine, Bool, Bool, Bool, RuntimeAllocationPolicy?, Bool, DecodeLookaheadPlanning) -> ContextFeasibility = Planner.contextFeasibility
 let legacyAutomaticWindow: (PlanRequest, Machine, Bool, Bool, RuntimeAllocationPolicy?, DecodeLookaheadPlanning) -> AutomaticContextWindow = Planner.automaticContextWindow
 let legacyResolveWindow: (ContextWindowChoice, PlanRequest, Machine, Bool, Bool, RuntimeAllocationPolicy?, DecodeLookaheadPlanning) throws -> (plan: MemoryPlan, automatic: AutomaticContextWindow?) = Planner.resolveContextWindow
diff --git a/apps/macos/Runtime/Inference.swift b/apps/macos/Runtime/Inference.swift
index a3c4e09..de9eb86 100644
--- a/apps/macos/Runtime/Inference.swift
+++ b/apps/macos/Runtime/Inference.swift
@@ -701,11 +701,6 @@ public actor LocalInference: Inference {
         let pack = try selection.validatedPack()
         let model = try modelDirectory(for: pack)
         let preference = selection.preferences
-        // A future registry entry must supply its own verified loader before
-        // it can use this boundary. Never reinterpret it as the original pack.
-        guard pack.id == ModelPackRegistry.baseline.id else {
-            throw SevraError.unavailable("This build cannot load the requested model pack.")
-        }
         performanceTelemetry?.update(state: "Loading", detail: "Preparing the local model.")
         buffer.stage("Verifying the local model")
         while ahead.running {
@@ -738,7 +733,7 @@ public actor LocalInference: Inference {
         if let journal, let attempt { try journal.advance(attempt, to: .loading) }
         buffer.stage("Loading the local model")
         do {
-            let candidate = try await Engine(modelDir: model, plan: plan)
+            let candidate = try await Engine(modelDir: model, pack: pack, plan: plan)
             try candidate.configureStartupDefaults(for: pack)
             let identity = try candidate.appliedConfiguration(pack: pack, liveMemory: preference.liveMemory)
             try cancellation.check()
diff --git a/docs/ENGINEERING.md b/docs/ENGINEERING.md
index 6385c2c..da3f836 100644
--- a/docs/ENGINEERING.md
+++ b/docs/ENGINEERING.md
@@ -30,6 +30,16 @@ tracks qualification separately from format support. The installed engine still
 admits its pinned affine pack. Experimental descriptors and decoders do not
 enable a candidate model or change the automatic recommendation.
 
+Maintained-model owners authenticate `WeightStore(modelDirectory:pack:)`, plan
+through the selected `ModelPack`, and load with
+`Engine(modelDir:pack:plan:)`. Desktop and the opt-in CLI share this loading
+boundary, which rejects a mismatched allocation contract or simulated hardware
+before model allocation. Product owners explicitly apply
+`configureStartupDefaults(for:)` and complete their health check before
+publishing the runtime. The independent Engine initializers retain their
+existing behavior. An additional registry entry still needs an authenticated
+loader and completed qualification.
+
 `slotstream quantization-check --kernels` checks native layout decoding and
 affine operation support. `Tools/quantization_inventory.py` and
 `Tools/quantization_fixture.py` inspect pinned metadata and extract bounded real

```

## context-engine-ci.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/context-engine-ci.json`; bytes: 6089; SHA-256: `d933ec39cee6c1e36d27d434a467adf066967e2ed56565ebc4a1bd5280bde35e`.

```json
{"conclusion":"success","headSha":"2bb470676ed39e1c7aff1593c28da3cd9a1a678a","jobs":[{"completedAt":"2026-10-05T03:59:25Z","conclusion":"success","databaseId":111602214171,"name":"weights-free","startedAt":"2026-10-05T03:23:22Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:23:23Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:23:22Z","status":"completed"},{"completedAt":"2026-10-05T03:23:47Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:23:23Z","status":"completed"},{"completedAt":"2026-10-05T03:24:27Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T03:23:47Z","status":"completed"},{"completedAt":"2026-10-05T03:24:27Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T03:24:27Z","status":"completed"},{"completedAt":"2026-10-05T03:24:29Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T03:24:27Z","status":"completed"},{"completedAt":"2026-10-05T03:37:24Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T03:24:29Z","status":"completed"},{"completedAt":"2026-10-05T03:37:29Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T03:37:24Z","status":"completed"},{"completedAt":"2026-10-05T03:37:32Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T03:37:29Z","status":"completed"},{"completedAt":"2026-10-05T03:38:56Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T03:37:32Z","status":"completed"},{"completedAt":"2026-10-05T03:38:57Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T03:38:56Z","status":"completed"},{"completedAt":"2026-10-05T03:57:50Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T03:38:57Z","status":"completed"},{"completedAt":"2026-10-05T03:58:09Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T03:57:50Z","status":"completed"},{"completedAt":"2026-10-05T03:59:18Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T03:58:09Z","status":"completed"},{"completedAt":"2026-10-05T03:59:21Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T03:59:18Z","status":"completed"},{"completedAt":"2026-10-05T03:59:22Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T03:59:21Z","status":"completed"},{"completedAt":"2026-10-05T03:59:22Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T03:59:22Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608/job/111602214171"},{"completedAt":"2026-10-05T03:42:08Z","conclusion":"success","databaseId":111602214374,"name":"coverage","startedAt":"2026-10-05T03:26:51Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:26:52Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:26:51Z","status":"completed"},{"completedAt":"2026-10-05T03:27:40Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:26:52Z","status":"completed"},{"completedAt":"2026-10-05T03:27:40Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:27:40Z","status":"completed"},{"completedAt":"2026-10-05T03:27:43Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T03:27:40Z","status":"completed"},{"completedAt":"2026-10-05T03:42:02Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T03:27:43Z","status":"completed"},{"completedAt":"2026-10-05T03:42:02Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T03:42:02Z","status":"completed"},{"completedAt":"2026-10-05T03:42:04Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T03:42:02Z","status":"completed"},{"completedAt":"2026-10-05T03:42:04Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T03:42:04Z","status":"completed"},{"completedAt":"2026-10-05T03:42:07Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T03:42:04Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608/job/111602214374"},{"completedAt":"2026-10-05T03:36:14Z","conclusion":"success","databaseId":111602214400,"name":"public-library","startedAt":"2026-10-05T03:31:36Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:31:36Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:31:36Z","status":"completed"},{"completedAt":"2026-10-05T03:31:53Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:31:36Z","status":"completed"},{"completedAt":"2026-10-05T03:31:53Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:31:53Z","status":"completed"},{"completedAt":"2026-10-05T03:36:10Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T03:31:53Z","status":"completed"},{"completedAt":"2026-10-05T03:36:11Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T03:36:10Z","status":"completed"},{"completedAt":"2026-10-05T03:36:12Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T03:36:11Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608/job/111602214400"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608"}

```

## selected-cli-engine-ci.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/selected-cli-engine-ci.json`; bytes: 6089; SHA-256: `3c3339d22b9206a6e78008f29e0bedf26cadc9bdc44660ff0923da34c9087b57`.

```json
{"conclusion":"success","headSha":"07139e56e5e1c40612dc87e0a3956cd1f77180b2","jobs":[{"completedAt":"2026-10-05T03:58:06Z","conclusion":"success","databaseId":111605681231,"name":"coverage","startedAt":"2026-10-05T03:44:43Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:44:45Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:44:44Z","status":"completed"},{"completedAt":"2026-10-05T03:45:05Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:44:45Z","status":"completed"},{"completedAt":"2026-10-05T03:45:06Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:45:05Z","status":"completed"},{"completedAt":"2026-10-05T03:45:08Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T03:45:06Z","status":"completed"},{"completedAt":"2026-10-05T03:57:58Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T03:45:08Z","status":"completed"},{"completedAt":"2026-10-05T03:57:59Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T03:57:58Z","status":"completed"},{"completedAt":"2026-10-05T03:58:01Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T03:57:59Z","status":"completed"},{"completedAt":"2026-10-05T03:58:02Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T03:58:01Z","status":"completed"},{"completedAt":"2026-10-05T03:58:04Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T03:58:02Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260220007/job/111605681231"},{"completedAt":"2026-10-05T04:17:28Z","conclusion":"success","databaseId":111605681311,"name":"weights-free","startedAt":"2026-10-05T03:46:27Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:46:28Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:46:28Z","status":"completed"},{"completedAt":"2026-10-05T03:46:48Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:46:28Z","status":"completed"},{"completedAt":"2026-10-05T03:47:26Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T03:46:48Z","status":"completed"},{"completedAt":"2026-10-05T03:47:26Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T03:47:26Z","status":"completed"},{"completedAt":"2026-10-05T03:47:28Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T03:47:26Z","status":"completed"},{"completedAt":"2026-10-05T03:58:10Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T03:47:28Z","status":"completed"},{"completedAt":"2026-10-05T03:58:14Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T03:58:10Z","status":"completed"},{"completedAt":"2026-10-05T03:58:17Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T03:58:14Z","status":"completed"},{"completedAt":"2026-10-05T03:59:40Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T03:58:17Z","status":"completed"},{"completedAt":"2026-10-05T03:59:40Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T03:59:40Z","status":"completed"},{"completedAt":"2026-10-05T04:16:10Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T03:59:40Z","status":"completed"},{"completedAt":"2026-10-05T04:16:22Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T04:16:10Z","status":"completed"},{"completedAt":"2026-10-05T04:17:17Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T04:16:22Z","status":"completed"},{"completedAt":"2026-10-05T04:17:19Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T04:17:17Z","status":"completed"},{"completedAt":"2026-10-05T04:17:20Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T04:17:19Z","status":"completed"},{"completedAt":"2026-10-05T04:17:26Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T04:17:20Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260220007/job/111605681311"},{"completedAt":"2026-10-05T03:50:30Z","conclusion":"success","databaseId":111605681335,"name":"public-library","startedAt":"2026-10-05T03:45:08Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:45:08Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:45:08Z","status":"completed"},{"completedAt":"2026-10-05T03:45:36Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:45:08Z","status":"completed"},{"completedAt":"2026-10-05T03:45:36Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:45:36Z","status":"completed"},{"completedAt":"2026-10-05T03:50:26Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T03:45:36Z","status":"completed"},{"completedAt":"2026-10-05T03:50:27Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T03:50:26Z","status":"completed"},{"completedAt":"2026-10-05T03:50:28Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T03:50:27Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260220007/job/111605681335"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37260220007"}

```

## selected-cli-mac-ci.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/selected-cli-mac-ci.json`; bytes: 3130; SHA-256: `e4041a486b871dd3f24d6e852b1be45f4f38401b497afaab3d8992eb09375bbc`.

```json
{"conclusion":"success","headSha":"07139e56e5e1c40612dc87e0a3956cd1f77180b2","jobs":[{"completedAt":"2026-10-05T04:02:31Z","conclusion":"success","databaseId":111605681064,"name":"checks","startedAt":"2026-10-05T03:38:16Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:38:17Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:38:17Z","status":"completed"},{"completedAt":"2026-10-05T03:39:02Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:38:17Z","status":"completed"},{"completedAt":"2026-10-05T03:39:02Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:39:02Z","status":"completed"},{"completedAt":"2026-10-05T03:39:03Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T03:39:02Z","status":"completed"},{"completedAt":"2026-10-05T04:02:27Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T03:39:03Z","status":"completed"},{"completedAt":"2026-10-05T04:02:29Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T04:02:27Z","status":"completed"},{"completedAt":"2026-10-05T04:02:29Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T04:02:29Z","status":"completed"},{"completedAt":"2026-10-05T04:02:29Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T04:02:29Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260219978/job/111605681064"},{"completedAt":"2026-10-05T03:46:21Z","conclusion":"success","databaseId":111605681184,"name":"xcode","startedAt":"2026-10-05T03:38:16Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:38:16Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:38:16Z","status":"completed"},{"completedAt":"2026-10-05T03:38:41Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:38:16Z","status":"completed"},{"completedAt":"2026-10-05T03:38:41Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:38:41Z","status":"completed"},{"completedAt":"2026-10-05T03:38:44Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T03:38:41Z","status":"completed"},{"completedAt":"2026-10-05T03:46:17Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T03:38:44Z","status":"completed"},{"completedAt":"2026-10-05T03:46:18Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T03:46:17Z","status":"completed"},{"completedAt":"2026-10-05T03:46:19Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T03:46:18Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260219978/job/111605681184"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37260219978"}

```
