---
type: run
created: 2026-10-05T03:35:08.094885+00:00
updated: 2026-10-05T03:35:08.094885+00:00
summary: Bind explicit CLI selection to directory verification and complete planning without inheriting original arithmetic or speed evidence
binary: Source on 2bb4706 plus captured edits; native CLI execution pending
captured_at: 2026-10-04
command: py_compile; git diff --check; claims_gate; projections check; llms generation; GitHub workflow receipts
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Pack-owned CLI planning preparation
tool: Existing run and serve entry points, doctor, selected store and CLI acceptance fixtures
---

The CLI selection now owns its resolved directory, verification store, minimum adaptive ceiling and complete resource planning. An explicit custom path is retained and must match the selected pinned files; it is never repaired into a different representation. The shared serving entry point checks that the selected resource contract equals the plan and refuses a pack without an admitted loader before falling through to the original Engine. Existing planned diagnostic loaders share that guard. Independent CLI calls without quantization keep the original resource contract and custom-directory behavior.

Doctor uses the selected pack's file and expert sizes, context capability and complete feasibility/window calculations. Selected reports name their manifest and state unknown loaded-performance evidence. An arithmetic profile without timing anchors receives no original warm-decode or prefill curve, including in the target ladder and context explanation. The baseline text and numerical path stay intact. The guide includes the corresponding selected-pack doctor command.

The existing native CLI acceptance fixture now checks absent run/serve selections, retained mismatching custom metadata, no implicit directory creation or repair, and full JSON-plan equality between legacy, explicit-original and Auto original planning under fixed simulated inputs. These cases load no model or HTTP server. Python syntax, diff, claims and generated projections pass. The new CLI is not compiled or run locally during the frozen physical quality study; native compilation and execution remain required.

The registry remains original-only and context-free CLI Auto still has no qualified profile to select. Actual standalone loader wiring and hardware/profile-aware CLI selection must be completed with the admitted artifact and final evidence before alternate promotion. This source does not register an artifact, confer quality, or meet the speed target.

Separately captured complete workflow receipts confirm all Engine jobs for 81b197368ee088d834ea539f076b95dc093c568a and the Mac workflow for 5cb25fa2edfa417e396aeae7be16431da68ed9df. They do not execute this new CLI source or the latest pack-context foundation. The quality continuation and remaining physical gates remain unchanged.

## checks.json

Local evidence: `.build/quantization-research/pack-owned-cli-planning-v1/checks.json`; bytes: 776; SHA-256: `99099cb28e384029209576062138c9e1a2b2d051ad89b0303f483251f382a7ce`.

```text
[
  {
    "name": "syntax",
    "command": [
      "python3",
      "-m",
      "py_compile",
      "Tools/slotpack/cli_checks.py"
    ],
    "exit_code": 0,
    "stdout": "",
    "stderr": ""
  },
  {
    "name": "diff",
    "command": [
      "git",
      "diff",
      "--check"
    ],
    "exit_code": 0,
    "stdout": "",
    "stderr": ""
  },
  {
    "name": "claims",
    "command": [
      "python3",
      "Tools/claims_gate.py"
    ],
    "exit_code": 0,
    "stdout": "claims gate: 349 needle checks, 0 failures\n",
    "stderr": ""
  },
  {
    "name": "projections",
    "command": [
      "python3",
      "Tools/projections.py",
      "--check"
    ],
    "exit_code": 0,
    "stdout": "MEASUREMENTS.md is current\nPLAN.md is current\n",
    "stderr": ""
  }
]

```

## source.diff

Local evidence: `.build/quantization-research/pack-owned-cli-planning-v1/source.diff`; bytes: 42039; SHA-256: `79905cca3b34506d0a341932bda1f03bc536b4a7cee68d0705569d4324585a91`.

```text
diff --git a/Sources/slotstream-cli/ContextCommands.swift b/Sources/slotstream-cli/ContextCommands.swift
index 83aa8c2..4a54b29 100644
--- a/Sources/slotstream-cli/ContextCommands.swift
+++ b/Sources/slotstream-cli/ContextCommands.swift
@@ -157,7 +157,7 @@ struct ContextCheck: ParsableCommand {
         }
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 // Missing observations must never compare equal and turn
                 // an unobserved memory/swap interval into a passing result.
                 engine.generator.footprintSampling = true
diff --git a/Sources/slotstream-cli/DraftStreamCommands.swift b/Sources/slotstream-cli/DraftStreamCommands.swift
index c3a3116..c0a9e35 100644
--- a/Sources/slotstream-cli/DraftStreamCommands.swift
+++ b/Sources/slotstream-cli/DraftStreamCommands.swift
@@ -15,7 +15,7 @@ struct DraftStreamCheck: ParsableCommand {
     var tokens: Int = 32
 
     func run() throws {
-        let dir = model.modelURL
+        let dir = try model.modelURL
         let tokens = self.tokens
         let sem = DispatchSemaphore(value: 0)
         var result: Result<[CheckReport], Error> = .success([])
diff --git a/Sources/slotstream-cli/ExpertLookaheadCommands.swift b/Sources/slotstream-cli/ExpertLookaheadCommands.swift
index aa3d085..be64493 100644
--- a/Sources/slotstream-cli/ExpertLookaheadCommands.swift
+++ b/Sources/slotstream-cli/ExpertLookaheadCommands.swift
@@ -219,7 +219,7 @@ struct ExpertLookaheadCapture: ParsableCommand {
         let plan = try model.announcedPlan(maxContext: proto.maxContext, prefixCacheEnabled: false, requireMTP: true)
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 try ExpertLookaheadCLI.verify(proto, engine: engine, plan: plan)
                 var header = try ExpertLookaheadCLI.identity(engine: engine, plan: plan, modelURL: model.modelURL)
                 header["run_id"] = proto.runId
@@ -381,7 +381,7 @@ struct ExpertLookaheadBench: ParsableCommand {
         let plan = try model.announcedPlan(maxContext: proto.maxContext, prefixCacheEnabled: false, requireMTP: true)
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 let loadSeconds = RuntimeClock.seconds(since: launchStart)
                 try ExpertLookaheadCLI.verify(proto, engine: engine, plan: plan)
                 engine.generator.footprintSampling = sampleFootprint
diff --git a/Sources/slotstream-cli/LaunchCommand.swift b/Sources/slotstream-cli/LaunchCommand.swift
index 870ab50..72a9730 100644
--- a/Sources/slotstream-cli/LaunchCommand.swift
+++ b/Sources/slotstream-cli/LaunchCommand.swift
@@ -418,7 +418,7 @@ struct Launch: ParsableCommand {
         var lines: [String] = []
         var automatic = ContextPolicy.defaultTokens
         if let model = try? modelOptions() {
-            if model.weightsMissing() {
+            if (try? model.weightsMissing()) == true {
                 lines.append(String(format: "Would ask to download %@ (%.1f GB) first.",
                     PinnedModel.name, Double(PinnedModel.totalBytes) / 1e9))
             } else if let window = try? model.automaticWindow() {
@@ -459,7 +459,7 @@ struct Launch: ParsableCommand {
             let model = try modelOptions()
             // The download asks first, and fails with the command when there
             // is no terminal to ask on.
-            if model.weightsMissing() { try model.ensureWeights() }
+            if try model.weightsMissing() { try model.ensureWeights() }
             if window == nil, tool.minimumContext > ContextPolicy.defaultTokens {
                 window = CodingToolLaunch.BackgroundServer.window(for: tool, automatic: try model.automaticWindow())
             }
diff --git a/Sources/slotstream-cli/MTPCommands.swift b/Sources/slotstream-cli/MTPCommands.swift
index aa741d9..f2755b4 100644
--- a/Sources/slotstream-cli/MTPCommands.swift
+++ b/Sources/slotstream-cli/MTPCommands.swift
@@ -113,7 +113,7 @@ struct MTPAccept: ParsableCommand {
         var result: Result<Void, Error> = .success(())
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 var traces: [GreedyTrace] = []
                 for (i, prompt) in mtpProbePrompts.enumerated() {
                     let ids = try engine.encodeChat(
@@ -331,7 +331,7 @@ struct MTPBench: ParsableCommand {
         var result: Result<Void, Error> = .success(())
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 var params = sample ? SampleParams() : SampleParams.greedy
                 if sample { params.seed = seed }
                 params.maxTokens = maxTokens
@@ -533,7 +533,7 @@ struct MTPCheck: ParsableCommand {
                     }
                 }
                 try memoryGuard()
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 engine.generator.footprintSampling = true
                 try memoryGuard()
                 var failures: [String] = []
@@ -853,7 +853,7 @@ struct MTPPassCost: ParsableCommand {
         var result: Result<Void, Error> = .success(())
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 let m = engine.model
                 guard let head = m.mtpHead else { throw ModelError("draft head not loaded") }
                 var params = SampleParams.greedy
@@ -1216,7 +1216,7 @@ struct MTPRowCheck: ParsableCommand {
         var result: Result<Void, Error> = .success(())
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 let m = engine.model
                 guard let head = m.mtpHead else { throw ModelError("draft head not loaded") }
                 var failures: [String] = []
diff --git a/Sources/slotstream-cli/PrefixExactCommands.swift b/Sources/slotstream-cli/PrefixExactCommands.swift
index ca185bb..d8acbb0 100644
--- a/Sources/slotstream-cli/PrefixExactCommands.swift
+++ b/Sources/slotstream-cli/PrefixExactCommands.swift
@@ -68,7 +68,7 @@ struct PrefixExactCheck: ParsableCommand {
             do {
                 let engine: Engine
                 if let planned {
-                    engine = try await Engine(modelDir: model.modelURL, plan: planned)
+                    engine = try await model.loadEngine(plan: planned)
                 } else {
                     engine = try await Engine(modelDir: model.modelURL, poolSlots: poolSlots)
                 }
diff --git a/Sources/slotstream-cli/VisionCommands.swift b/Sources/slotstream-cli/VisionCommands.swift
index 53a9bbb..68c3aec 100644
--- a/Sources/slotstream-cli/VisionCommands.swift
+++ b/Sources/slotstream-cli/VisionCommands.swift
@@ -71,7 +71,7 @@ struct VisionParity: ParsableCommand {
         try write("embed.bin", embed.asType(.float32).asArray(Float.self))
         let manifest: [String: Any] = [
             "image": path,
-            "model_dir": model.modelURL.path,
+            "model_dir": try model.modelURL.path,
             "height": Int(plan.height), "width": Int(plan.width),
             "grid_h": Int(plan.gridH), "grid_w": Int(plan.gridW),
             "patches": plan.patches, "merged_tokens": plan.mergedTokens,
diff --git a/Sources/slotstream-cli/main.swift b/Sources/slotstream-cli/main.swift
index 76f786e..74306cc 100644
--- a/Sources/slotstream-cli/main.swift
+++ b/Sources/slotstream-cli/main.swift
@@ -180,17 +180,37 @@ struct ModelOptions: ParsableArguments {
         return policy
     }
 
-    // Resolved once here so the tokenizer, the draft-head probe, and the index
-    // all see the real directory; Foundation will not list a symlinked one.
-    var modelURL: URL { ModelLocator.resolve(model).resolvingSymlinksInPath() }
+    var originalModelName: Bool { model == PinnedModel.name || model == PinnedModel.dirName }
+
+    /// Omission retains the independent engine path. A supported explicit
+    /// choice owns all subsequent directory, verification and resource calls.
+    var selectedPack: ModelPack? {
+        get throws {
+            guard let quantization else { return nil }
+            return try ModelPackRegistry.resolve(quantization == "auto" ? .automatic : .pack(quantization)).pack
+        }
+    }
 
-    func validate() throws {
-        if let quantization {
-            _ = try ModelPackRegistry.resolve(quantization == "auto" ? .automatic : .pack(quantization))
+    var resources: PackMemoryProfile { get throws { try selectedPack?.memoryProfile ?? .original } }
+
+    // The tokenizer, optional-component probes and loader share this resolved
+    // directory. Selecting a pack must not redirect an explicit custom path.
+    var modelURL: URL {
+        get throws {
+            let pack = try selectedPack
+            let url: URL
+            if originalModelName, let pack, pack.id != ModelPackRegistry.baseline.id {
+                url = ModelLocator.userModelsDir.appendingPathComponent(pack.directoryName)
+            } else { url = ModelLocator.resolve(model) }
+            return url.resolvingSymlinksInPath()
         }
+    }
+
+    func validate() throws {
+        let minimum = try resources.minimumMemoryGB
         if let limit = memoryLimitGB {
-            guard limit.isFinite, limit >= Planner.minMemoryGB else {
-                throw ValidationError("--memory-limit-gb must be finite and at least \(Planner.minMemoryGB) GB")
+            guard limit.isFinite, limit >= minimum else {
+                throw ValidationError("--memory-limit-gb must be finite and at least \(minimum) GB")
             }
             guard memoryGB == nil, poolGB == nil, expertsPerLayer == nil else {
                 throw ValidationError("--memory-limit-gb cannot be combined with --memory-gb, --pool-gb or --experts-per-layer")
@@ -219,11 +239,26 @@ struct ModelOptions: ParsableArguments {
     }
 
     /// Does this checkpoint carry a tower? Reads the shard headers only.
-    func visionAvailable() -> Bool {
-        guard let idx = try? CheckpointIndex(dir: modelURL) else { return false }
+    func visionAvailable() throws -> Bool {
+        let directory = try modelURL
+        guard let idx = try? CheckpointIndex(dir: directory) else { return false }
         return VisionTower.present(index: idx)
     }
 
+    /// Keep the chosen resource contract attached to serving. Registration of
+    /// another representation must provide its authenticated loader here; a
+    /// different pack cannot fall through to the original checkpoint loader.
+    func loadEngine(plan: MemoryPlan) async throws -> Engine {
+        let pack = try selectedPack
+        guard plan.resources == (pack?.memoryProfile ?? .original) else {
+            throw PlanError("the selected pack and load plan have different resource contracts")
+        }
+        guard pack == nil || pack?.id == ModelPackRegistry.baseline.id else {
+            throw PlanError("the selected pack has no supported serving loader in this build")
+        }
+        return try await Engine(modelDir: modelURL, plan: plan)
+    }
+
     /// Resolve knobs -> plan, print the announce, return it. Also the first
     /// place a stranger hits with no weights — offer the download right there.
     func announcedPlan(maxContext: Int = ContextPolicy.defaultTokens, prefixCacheEnabled: Bool = true,
@@ -237,7 +272,7 @@ struct ModelOptions: ParsableArguments {
             throw PlanError("this diagnostic requires the MTP draft head; --mtp off is incompatible")
         }
         try ensureWeights()
-        let base = try Planner.plan(
+        let base = try Planner.plan(resources: resources,
             expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
             ramPercent: maxRAMPercent,
             mtp: requireMTP ? .on : requestedMTP, mtpAvailable: MTPWeights.present(modelDir: modelURL),
@@ -267,7 +302,7 @@ struct ModelOptions: ParsableArguments {
             maxRAMPercent: maxRAMPercent, mtp: try mtpMode(), vision: try visionMode())
         request.mtpExperts = try Planner.MTPExpertPlacement.environment()
         try ensureWeights()
-        let resolved = try Planner.resolveContextWindow(.automatic, request: request, on: .current(),
+        let resolved = try Planner.resolveContextWindow(resources: resources, .automatic, request: request, on: .current(),
             mtpAvailable: MTPWeights.present(modelDir: modelURL), visionAvailable: visionAvailable(),
             runtimePolicy: policy, decodeLookahead: DecodeLookaheadPlanning.environment(modelDirectory: modelURL))
         let configuration = try ContextConfiguration(maxContextTokens: resolved.plan.maxContextTokens,
@@ -290,7 +325,7 @@ struct ModelOptions: ParsableArguments {
         var request = PlanRequest(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
             maxRAMPercent: maxRAMPercent, mtp: try mtpMode(), vision: try visionMode())
         request.mtpExperts = try Planner.MTPExpertPlacement.environment()
-        return try Planner.resolveContextWindow(.automatic, request: request, on: .current(),
+        return try Planner.resolveContextWindow(resources: resources, .automatic, request: request, on: .current(),
             mtpAvailable: MTPWeights.present(modelDir: modelURL), visionAvailable: visionAvailable(),
             runtimePolicy: try runtimePolicy(),
             decodeLookahead: DecodeLookaheadPlanning.environment(modelDirectory: modelURL)).plan.maxContextTokens
@@ -298,11 +333,12 @@ struct ModelOptions: ParsableArguments {
 
     /// Whether the pinned model still has files to download. An explicit
     /// directory counts as present when it holds a config.
-    func weightsMissing() -> Bool {
-        guard quantization != nil || model == PinnedModel.name || model == PinnedModel.dirName else {
-            return !FileManager.default.fileExists(atPath: modelURL.appendingPathComponent("config.json").path)
+    func weightsMissing() throws -> Bool {
+        let url = try modelURL
+        guard let pack = try selectedPack ?? (originalModelName ? ModelPackRegistry.baseline : nil) else {
+            return !FileManager.default.fileExists(atPath: url.appendingPathComponent("config.json").path)
         }
-        return WeightStore.remainingBytes(at: modelURL) > 0
+        return WeightStore(modelDirectory: url, pack: pack).remainingBytes() > 0
     }
 
     /// The announce, doctor and serving metadata share the same reservation
@@ -326,15 +362,16 @@ struct ModelOptions: ParsableArguments {
     /// once and run the pull inline (resuming whatever is already there).
     /// Anything else fails with the fix, not a stack.
     func ensureWeights() throws {
-        let url = modelURL
+        let url = try modelURL
         let fm = FileManager.default
-        if quantization != nil, model != PinnedModel.name, model != PinnedModel.dirName {
-            guard WeightStore(modelDirectory: url).status().isReady else {
+        let pack = try selectedPack ?? (originalModelName ? ModelPackRegistry.baseline : nil)
+        if quantization != nil, !originalModelName, let pack {
+            guard WeightStore(modelDirectory: url, pack: pack).status().isReady else {
                 throw PlanError("this directory does not contain the selected verified pack; use slotstream pull with an explicit destination before selecting it")
             }
             return
         }
-        guard quantization != nil || model == PinnedModel.name || model == PinnedModel.dirName else {
+        guard let pack else {
             // explicit path: all we can check cheaply is that a model is there
             guard fm.fileExists(atPath: url.appendingPathComponent("config.json").path) else {
                 throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
@@ -343,19 +380,21 @@ struct ModelOptions: ParsableArguments {
         }
         // pinned model: every manifest file must be present whole (a partial
         // first download must resume here, not die later in the engine)
-        var remaining = WeightStore.remainingBytes(at: url)
-        var corrupt: [PinnedModel.File] = []
+        let store = WeightStore(modelDirectory: url, pack: pack)
+        var remaining = store.remainingBytes()
         if remaining == 0 {
             // Size alone cannot distinguish a valid file from same-size
             // corruption. Hash before loading; this takes seconds and prevents
             // a damaged tokenizer/config/weight from reaching the engine.
-            corrupt = WeightStore.invalidFiles(at: url)
-            if corrupt.isEmpty { return }
-            remaining = corrupt.reduce(0) { $0 + $1.size }
-            print("found \(corrupt.count) same-size file(s) that fail the pinned sha256: "
-                + corrupt.map(\.path).joined(separator: ", "))
+            let status = store.status()
+            if status.isReady { return }
+            remaining = status.bytesToFetch
+            if case .corrupt(let paths, _, _) = status {
+                print("found \(paths.count) same-size file(s) that fail the pinned sha256: "
+                    + paths.joined(separator: ", "))
+            }
         }
-        let have = max(0, PinnedModel.requiredBytes - remaining)
+        let have = max(0, pack.requiredBytes - remaining)
         // free disk where the weights will actually land
         var probe = url
         while !fm.fileExists(atPath: probe.path), probe.path != "/" {
@@ -364,8 +403,8 @@ struct ModelOptions: ParsableArguments {
         let free = (try? fm.attributesOfFileSystem(
             forPath: probe.path))?[.systemFreeSize] as? Int64 ?? 0
         print("""
-            \(PinnedModel.name) is not \(have > 0 ? "fully " : "")downloaded yet.
-              size:  \(String(format: "%.1f", Double(PinnedModel.totalBytes) / 1e9)) GB in \(PinnedModel.files.count) files (resumable if interrupted)\(
+            \(pack.id) is not \(have > 0 ? "fully " : "")downloaded yet.
+              size:  \(String(format: "%.1f", Double(pack.totalBytes) / 1e9)) GB in \(pack.files.count) files (resumable if interrupted)\(
                   have > 0 ? String(format: "\n  have:  %.1f GB already here — the download resumes", Double(have) / 1e9) : "")
               time:  measured during download; compressed transfer and reconstruction overlap
               to:    \(url.path)
@@ -375,16 +414,16 @@ struct ModelOptions: ParsableArguments {
         switch askYesNo("download now? [Y/n] ") {
         case .some(true):
             try withInterruptiblePull { cancellation in
-                try WeightStore.download(to: url, transport: .automatic, cancellation: cancellation, log: { print($0); fflush(stdout) })
+                try store.download(.init(transport: .automatic, cancellation: cancellation), log: { print($0); fflush(stdout) })
                 // The same optional forecast sidecar `slotstream pull` fetches.
-                for file in TapCorrectionSidecar.files {
+                for file in pack.decodeForecastFiles {
                     TapCorrectionSidecar.ensure(modelDir: url, file: file, cancellation: cancellation, log: { print($0); fflush(stdout) })
                 }
             }
         case .some(false):
-            throw PlanError("not downloading — when you are ready:  slotstream pull")
+            throw PlanError("not downloading; when you are ready: slotstream pull \(pack.id)")
         case .none:  // no terminal to ask on
-            throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
+            throw PlanError("no model at \(url.path); download it first with: slotstream pull \(pack.id)")
         }
     }
 }
@@ -474,7 +513,7 @@ struct Run: ParsableCommand {
         let keepAlive = try model.gpuKeepAlivePolicy()
         Task {
             do {
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 engine.gpuKeepAlive = keepAlive
                 let loadSeconds = RuntimeClock.seconds(since: launchStart)
                 engine.generator.footprintSampling = sampleFootprint
@@ -721,7 +760,7 @@ struct Serve: ParsableCommand {
         var engine: Engine!
         var err: Error?
         Task {
-            do { engine = try await Engine(modelDir: model.modelURL, plan: plan) } catch { err = error }
+            do { engine = try await model.loadEngine(plan: plan) } catch { err = error }
             sem.signal()
         }
         sem.wait()
@@ -954,16 +993,27 @@ struct Doctor: ParsableCommand {
 
     /// One line on the 104 GB the plan above says nothing about: is it here,
     /// is there room for it, and roughly how long it takes.
-    func weightsLine() -> String {
-        let url = model.modelURL
-        guard model.model == PinnedModel.name || model.model == PinnedModel.dirName else {
+    func weightsLine() throws -> String {
+        let url = try model.modelURL
+        guard let pack = try model.selectedPack ?? (model.originalModelName ? ModelPackRegistry.baseline : nil) else {
             return "weights: \(url.path) (not the pinned model — size unknown)"
         }
         let fm = FileManager.default
-        let remaining = WeightStore.remainingBytes(at: url)
+        let remaining = WeightStore(modelDirectory: url, pack: pack).remainingBytes()
         if remaining == 0 {
             let line = String(format: "weights: present by size, %.1f GB at %@ (run pull --verify for hashes)",
-                              Double(PinnedModel.totalBytes) / 1e9, url.path)
+                              Double(pack.totalBytes) / 1e9, url.path)
+            if pack.id != ModelPackRegistry.baseline.id {
+                var lines = [line]
+                for file in pack.decodeForecastFiles {
+                    switch TapCorrectionSidecar.status(modelDir: url, file: file) {
+                    case .present: break
+                    case .absent: lines.append("forecast: \(file.path) is missing; slotstream pull \(pack.id) downloads it")
+                    case .mismatched(let why): lines.append("forecast: \(file.path) does not match its pinned file (\(why)); slotstream pull \(pack.id) replaces it")
+                    }
+                }
+                return lines.joined(separator: "\n")
+            }
             // A model downloaded before 0.2.19, or by a download that skipped
             // the forecast sidecar, decodes with the earlier forecast until
             // `pull` fetches it.
@@ -997,6 +1047,8 @@ struct Doctor: ParsableCommand {
     func run() throws {
         _ = try ContextConfiguration(maxContextTokens: self.maxContext.tokens ?? ContextPolicy.defaultTokens,
             maxPrefillWaitMinutes: maxPrefillWait)
+        let resources = try model.resources
+        let pack = try model.selectedPack
         // --json is for machines: emit the plan and nothing else.
         let quiet = asJSON
         let info = MLX.GPU.deviceInfo()
@@ -1006,13 +1058,18 @@ struct Doctor: ParsableCommand {
                          Planner.deviceRAMGB(),
                          Planner.deviceAvailableGB() ?? .nan, Planner.deviceWorkingSetGB()))
         }
-        if !quiet {
+        if !quiet, resources.usesBaselineSpeedEvidence {
             print("model:  \(Geometry.layers) layers x \(Geometry.expertsPerLayer) experts x 2.76 MB "
                 + "(\(Geometry.totalRecords) records = 67.9 GB streamed from SSD)")
+        } else if !quiet {
+            print(String(format: "model:  %d layers x %d experts x %.2f MB (%d records = %.1f GB streamed from SSD)",
+                Geometry.layers, Geometry.expertsPerLayer, Double(resources.expertRecordBytes) / 1e6,
+                Geometry.totalRecords, resources.poolGB(Geometry.totalRecords)))
         }
+        if !quiet, let pack { print("pack:   \(pack.title) (\(pack.id)); speed evidence requires a matching loaded configuration") }
         // Disk is the gate that bites before memory does, and the README sends
         // people here *before* they download, so answer that question too.
-        if !quiet { print(weightsLine()) }
+        if !quiet { print(try weightsLine()) }
         if !quiet { print("") }
         let simulating = simRAM != nil || simWorkingSet != nil || simAvailable != nil
         if simulating, !quiet { print("what-if for a simulated machine (this device shown above):") }
@@ -1026,7 +1083,7 @@ struct Doctor: ParsableCommand {
                 workingSetGB: simWorkingSet ?? (simRAM.map { $0 * 0.75 } ?? Planner.deviceWorkingSetGB()),
                 availableGB: simulatedAvailable, isSimulated: true)
             : .current()
-        let lookahead = DecodeLookaheadPlanning.environment(modelDirectory: model.modelURL)
+        let lookahead = try DecodeLookaheadPlanning.environment(modelDirectory: model.modelURL)
         // The window: explicit, or this machine's automatic choice planned
         // against the (possibly simulated) live memory, exactly as serve does.
         var automatic: AutomaticContextWindow?
@@ -1039,17 +1096,17 @@ struct Doctor: ParsableCommand {
                 memoryGB: model.memoryGB, memoryLimitGB: model.memoryLimitGB, maxRAMPercent: model.maxRAMPercent,
                 mtp: try model.mtpMode(), vision: try model.visionMode())
             tierRequest.mtpExperts = try Planner.MTPExpertPlacement.environment()
-            let mtpPresent = MTPWeights.present(modelDir: model.modelURL)
-            let visionPresent = model.visionAvailable()
+            let mtpPresent = try MTPWeights.present(modelDir: model.modelURL)
+            let visionPresent = try model.visionAvailable()
             let policy = try model.runtimePolicy()
-            if let resolved = try? Planner.resolveContextWindow(.automatic, request: tierRequest, on: device,
+            if let resolved = try? Planner.resolveContextWindow(resources: resources, .automatic, request: tierRequest, on: device,
                     mtpAvailable: mtpPresent, visionAvailable: visionPresent, runtimePolicy: policy,
                     decodeLookahead: lookahead) {
                 automatic = resolved.automatic
                 automaticPlan = resolved.plan
                 maxContext = resolved.plan.maxContextTokens
             } else {
-                automatic = Planner.automaticContextWindow(tierRequest, on: device, mtpAvailable: mtpPresent,
+                automatic = Planner.automaticContextWindow(resources: resources, tierRequest, on: device, mtpAvailable: mtpPresent,
                     visionAvailable: visionPresent, runtimePolicy: policy, decodeLookahead: lookahead)
                 maxContext = ContextPolicy.defaultTokens
             }
@@ -1059,14 +1116,14 @@ struct Doctor: ParsableCommand {
             memoryGB: model.memoryGB, memoryLimitGB: model.memoryLimitGB, maxRAMPercent: model.maxRAMPercent,
             mtp: try model.mtpMode(), vision: try model.visionMode(), maxContextTokens: maxContext)
         request.mtpExperts = try Planner.MTPExpertPlacement.environment()
-        let feasibility = Planner.contextFeasibility(request, on: device,
+        let feasibility = try Planner.contextFeasibility(resources: resources, request, on: device,
             mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
             visionAvailable: model.visionAvailable(), runtimePolicy: try model.runtimePolicy(),
             decodeLookahead: lookahead)
         let advisory: MemoryPlan?
         if feasibility.requestedPlan == nil, maxContext <= ContextPolicy.defaultTokens,
            model.expertsPerLayer != nil || model.poolGB != nil {
-            advisory = try Planner.plan(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
+            advisory = try Planner.plan(resources: resources, expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
                 memoryGB: model.memoryGB, memoryLimitGB: model.memoryLimitGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                 availableGB: device.availableGB, ramPercent: model.maxRAMPercent,
                 mtp: model.mtpMode(), mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
@@ -1091,6 +1148,13 @@ struct Doctor: ParsableCommand {
         let plan = try (automaticPlan ?? requestedPlan).withRequestPolicy(configuration)
         if asJSON {
             var output = plan.json(); output["context_feasibility"] = feasibility.json
+            if let pack {
+                output["selected_pack"] = pack.id
+                output["selected_pack_manifest_sha256"] = pack.manifestDigest
+                // Planning does not prove installed bytes or actual execution.
+                output["selection_evidence"] = ModelPackSelectionEvidence.unknown.rawValue
+                output["meets_measured_speed_target"] = false
+            }
             output["context_window_source"] = automatic == nil ? "explicit" : "automatic"
             if let automatic { output["automatic_context_window"] = automatic.json }
             let data = try JSONSerialization.data(
@@ -1101,20 +1165,27 @@ struct Doctor: ParsableCommand {
         print(plan.banner())
         print("memory-feasible window: \(feasibility.maximumFeasibleWindow) tokens; separate from the \(maxPrefillWait)-minute request-to-first-token policy")
         if let automatic { print(automatic.report(served: maxContext)) }
-        print("""
-
-        memory controls (with none, auto is the default):
-          --memory-limit-gb G     adaptive ceiling; cache shrinks and recovers within it
-          --memory-gb G           total process budget with a fixed cache
-          --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
-          --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
-        Use the adaptive ceiling alone. Among fixed controls, experts-per-layer
-        takes precedence over pool-gb, then memory-gb.
-        """)
+        if resources.usesBaselineSpeedEvidence {
+            print("""
+
+            memory controls (with none, auto is the default):
+              --memory-limit-gb G     adaptive ceiling; cache shrinks and recovers within it
+              --memory-gb G           total process budget with a fixed cache
+              --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
+              --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
+            Use the adaptive ceiling alone. Among fixed controls, experts-per-layer
+            takes precedence over pool-gb, then memory-gb.
+            """)
+        } else {
+            print("\nmemory controls: --memory-limit-gb is adaptive; --memory-gb, --experts-per-layer and --pool-gb pin the cache.")
+            print("Use the adaptive ceiling alone. Fixed controls keep their existing precedence: experts-per-layer, pool-gb, memory-gb.")
+            print("Pool size and the minimum process budget use this pack's actual record geometry and allocation contract.")
+        }
         print(String(
             format: "min ~%.0f/layer = %.1f GB total. The pool is one global cache shared across",
-            Geometry.perLayer(Geometry.floorSlots), Planner.minMemoryGB))
-        print("""
+            Geometry.perLayer(Geometry.floorSlots), resources.minimumMemoryGB))
+        if resources.usesBaselineSpeedEvidence {
+            print("""
             all layers -- per-layer is the unit of intuition (a token activates 10
             of its 512 per layer), not a quota: hot layers borrow slots from cold.
 
@@ -1124,14 +1195,19 @@ struct Doctor: ParsableCommand {
             whole context, follow-up turns read only what is new):
               target     experts/layer  est. warm decode   pass    full \(maxContext)-token prompt
             """)
-        for t in [Planner.minMemoryGB, 10, 12, 16, 24, 28, 36, 48, 73]
-        where t >= Planner.minMemoryGB
+        } else {
+            print("all layers. These memory-only proposals have no calibrated generation or prefill speed estimate.")
+            print("  target     experts/layer  warm decode       pass    full-context wait")
+        }
+        for t in [resources.minimumMemoryGB, 10, 12, 16, 24, 28, 36, 48, 73]
+        where t >= resources.minimumMemoryGB
         {
             let row: MemoryPlan
             do {
-                row = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: t,
+                row = try Planner.plan(resources: resources, expertsPerLayer: nil, poolGB: nil, memoryGB: t,
                     ramGB: device.ramGB, workingSetGB: device.workingSetGB, availableGB: device.availableGB,
-                    maxContextTokens: maxContext, simulated: true, runtimePolicy: model.runtimePolicy())
+                    maxContextTokens: maxContext, simulated: true, qualification: false,
+                    runtimePolicy: model.runtimePolicy(), mtpExperts: .automatic)
                 try Planner.validateMemoryBudget(row, availableGB: device.availableGB)
             } catch {
                 // Name the constraint: a target above what this Mac can hold
@@ -1150,31 +1226,43 @@ struct Doctor: ParsableCommand {
             let est = row.estWarmTokS
             let full = row.fullyResident
             let chunk = row.prefillChunk
+            if !resources.usesBaselineSpeedEvidence {
+                print(String(format: "  %6.1f GB   %8.0f/512      uncalibrated      %5d   uncalibrated", t, e, chunk))
+                continue
+            }
             let wait = PrefillSchedule.estSeconds(tokens: maxContext, maxChunk: chunk)
             print(String(
                 format: "  %6.1f GB   %8.0f/512      ~%2.0f tok/s%@   %5d   %@",
                 t, e, est, full ? " (resident)" : "", chunk,
                 wait.isFinite ? "~" + PrefillSchedule.describe(seconds: wait) : "not yet calibrated"))
         }
-        print("""
+        if resources.usesBaselineSpeedEvidence {
+            print("""
 
-        time to first token at this plan, by prompt length (the pass shrinks past ~4k
-        tokens so its transient memory stays inside what was measured):
-        """)
+            time to first token at this plan, by prompt length (the pass shrinks past ~4k
+            tokens so its transient memory stays inside what was measured):
+            """)
+        } else {
+            print("\ntime to first token by prompt length: this representation has no calibrated timing estimate.")
+        }
         let chunk = plan.prefillChunk
         var lengths = [2048, 8192, 16384].filter { $0 < maxContext }
         lengths.append(maxContext)
         let row = lengths.map { n -> String in
-                let secs = PrefillSchedule.estSeconds(tokens: n, maxChunk: chunk)
+                let secs = resources.usesBaselineSpeedEvidence ? PrefillSchedule.estSeconds(tokens: n, maxChunk: chunk) : .infinity
                 let label = n % 1024 == 0 ? "\(n / 1024)k" : "\(n)"
                 return secs.isFinite ? "\(label) ~\(PrefillSchedule.describe(seconds: secs))" : "\(label) not yet calibrated"
             }
         print("  " + row.joined(separator: " · ") + " (the cap)")
-        print("""
-          context state is ~27 KiB per token, up to the model's \(ContextPolicy.modelLimit)-token limit.
-          `slotstream context-check --tokens N` reads an N-token synthetic prompt on this Mac and
-          stops early if reclaimable memory falls below its floor or its time limit passes.
-        """)
+        if resources.usesBaselineSpeedEvidence {
+            print("""
+              context state is ~27 KiB per token, up to the model's \(ContextPolicy.modelLimit)-token limit.
+              `slotstream context-check --tokens N` reads an N-token synthetic prompt on this Mac and
+              stops early if reclaimable memory falls below its floor or its time limit passes.
+            """)
+        } else {
+            print("  This pack supports contexts up to \(resources.maximumContext) tokens, subject to complete memory admission.")
+        }
     }
 }
 
@@ -1396,7 +1484,7 @@ struct ElasticDrill: ParsableCommand {
                     prefillChunk: chunk, prefixCacheTokens: cacheTokens,
                     notes: ["elastic drill bounded test plan"], maxPrefillWaitMinutes: 17,
                     memoryLimitGB: model.memoryLimitGB)
-                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                let engine = try await model.loadEngine(plan: plan)
                 // Serve assigns its configured context after loading. Exercise
                 // that real plan-copy path before allowing the governor to run.
                 engine.maxContextTokens = plan.maxContextTokens
diff --git a/Tools/slotpack/cli_checks.py b/Tools/slotpack/cli_checks.py
index c7f3e64..3e97fe1 100644
--- a/Tools/slotpack/cli_checks.py
+++ b/Tools/slotpack/cli_checks.py
@@ -33,6 +33,41 @@ def selection_checks(binary):
             output = run.stdout + run.stderr
             assert run.returncode != 0 and expected in output.lower() and not destination.exists(), (command, run.returncode, output)
             results.append(dict(name=name, pass_=True, exitCode=run.returncode, output=output))
+        destination = Path(tmp)/'custom-selected-model'
+        for command_name in ['run', 'serve']:
+            command = [binary, command_name, '--quantization', selected, '--model', str(destination)]
+            run = subprocess.run(command, capture_output=True, text=True, timeout=20)
+            output = run.stdout + run.stderr
+            assert run.returncode != 0 and 'selected verified pack' in output and not destination.exists(), (command, run.returncode, output)
+            results.append(dict(name=command_name+'-does-not-repair-custom-selection', pass_=True,
+                                exitCode=run.returncode, output=output))
+        destination.mkdir()
+        config = destination/'config.json'
+        content = b'{"model_type":"unrelated-custom-fixture"}\n'
+        config.write_bytes(content)
+        run = subprocess.run([binary, 'run', '--quantization', selected, '--model', str(destination)],
+                             capture_output=True, text=True, timeout=20)
+        output = run.stdout + run.stderr
+        assert run.returncode != 0 and 'selected verified pack' in output and config.read_bytes() == content
+        assert sorted(p.name for p in destination.iterdir()) == ['config.json']
+        results.append(dict(name='custom-metadata-is-not-selected-pack-proof', pass_=True,
+                            exitCode=run.returncode, output=output))
+        # Fixed synthetic hardware avoids racing real headroom. This memory
+        # ceiling fits the maximum feasibility probe, keeping CI work bounded.
+        doctor = [binary, 'doctor', '--model', str(Path(tmp)/'no-weights'), '--json',
+                  '--sim-ram', '48', '--sim-working-set', '36', '--sim-available', '40',
+                  '--memory-limit-gb', '33', '--max-context', '32768', '--mtp', 'off', '--vision', 'off']
+        legacy = json.loads(subprocess.run(doctor, capture_output=True, text=True, timeout=30, check=True).stdout)
+        for choice in [selected, 'auto']:
+            output = json.loads(subprocess.run(doctor+['--quantization', choice],
+                                capture_output=True, text=True, timeout=30, check=True).stdout)
+            assert output.pop('selected_pack') == selected
+            manifest = output.pop('selected_pack_manifest_sha256')
+            assert manifest == next(row['manifest_sha256'] for row in registry['packs'] if row['id'] == selected)
+            assert output.pop('selection_evidence') == 'unknown' and output.pop('meets_measured_speed_target') is False
+            assert output == legacy, (choice, output, legacy)
+            results.append(dict(name='original-doctor-equivalence-'+choice, pass_=True,
+                                manifest_sha256=manifest, plan=output))
     return selected, results
 
 
diff --git a/docs/SEVRA-MAC.md b/docs/SEVRA-MAC.md
index d7ceb63..191d637 100644
--- a/docs/SEVRA-MAC.md
+++ b/docs/SEVRA-MAC.md
@@ -514,6 +514,10 @@ the product selector; an explicit supported pack ID overrides it. Omitting
 `--quantization` preserves the existing `--model` behavior. Selecting a pack
 with a custom model directory requires that directory to pass the complete
 pinned verification; it is not silently repaired into another representation.
+Use `slotstream doctor --quantization PACK_ID` with the same memory and context
+options to inspect that pack's plan. The JSON report identifies the selected
+manifest and distinguishes planning from verified loaded performance. A pack
+without matching timing evidence reports uncalibrated estimates.
 
 `slotstream pull PACK_ID` downloads the supported pack named by `model-packs`.
 Use `--dir PATH` for an explicit destination and `--verify` to check an existing

```

## loaded-observation-engine-complete.json

Local evidence: `.build/quantization-research/pack-owned-cli-planning-v1/loaded-observation-engine-complete.json`; bytes: 6089; SHA-256: `10e42e3e4844f4b9bd9803dac8c6e78010e3350401b8802a5f298908229a1c66`.

```text
{"conclusion":"success","headSha":"81b197368ee088d834ea539f076b95dc093c568a","jobs":[{"completedAt":"2026-10-05T02:20:04Z","conclusion":"success","databaseId":111588671824,"name":"public-library","startedAt":"2026-10-05T02:14:10Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:14:11Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:14:11Z","status":"completed"},{"completedAt":"2026-10-05T02:14:48Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:14:11Z","status":"completed"},{"completedAt":"2026-10-05T02:14:49Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T02:14:48Z","status":"completed"},{"completedAt":"2026-10-05T02:20:01Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T02:14:49Z","status":"completed"},{"completedAt":"2026-10-05T02:20:02Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T02:20:01Z","status":"completed"},{"completedAt":"2026-10-05T02:20:02Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T02:20:02Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37254527821/job/111588671824"},{"completedAt":"2026-10-05T02:30:28Z","conclusion":"success","databaseId":111588672017,"name":"coverage","startedAt":"2026-10-05T02:17:07Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:17:09Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:17:08Z","status":"completed"},{"completedAt":"2026-10-05T02:17:30Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:17:09Z","status":"completed"},{"completedAt":"2026-10-05T02:17:30Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T02:17:30Z","status":"completed"},{"completedAt":"2026-10-05T02:17:33Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T02:17:30Z","status":"completed"},{"completedAt":"2026-10-05T02:30:22Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T02:17:33Z","status":"completed"},{"completedAt":"2026-10-05T02:30:22Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T02:30:22Z","status":"completed"},{"completedAt":"2026-10-05T02:30:24Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T02:30:22Z","status":"completed"},{"completedAt":"2026-10-05T02:30:25Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T02:30:24Z","status":"completed"},{"completedAt":"2026-10-05T02:30:26Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T02:30:25Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37254527821/job/111588672017"},{"completedAt":"2026-10-05T02:57:43Z","conclusion":"success","databaseId":111588672031,"name":"weights-free","startedAt":"2026-10-05T02:20:10Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:20:13Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:20:12Z","status":"completed"},{"completedAt":"2026-10-05T02:20:36Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:20:13Z","status":"completed"},{"completedAt":"2026-10-05T02:21:20Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T02:20:36Z","status":"completed"},{"completedAt":"2026-10-05T02:21:20Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T02:21:20Z","status":"completed"},{"completedAt":"2026-10-05T02:21:22Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T02:21:20Z","status":"completed"},{"completedAt":"2026-10-05T02:36:50Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T02:21:22Z","status":"completed"},{"completedAt":"2026-10-05T02:36:56Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T02:36:50Z","status":"completed"},{"completedAt":"2026-10-05T02:37:01Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T02:36:56Z","status":"completed"},{"completedAt":"2026-10-05T02:38:24Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T02:37:01Z","status":"completed"},{"completedAt":"2026-10-05T02:38:25Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T02:38:24Z","status":"completed"},{"completedAt":"2026-10-05T02:56:09Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T02:38:25Z","status":"completed"},{"completedAt":"2026-10-05T02:56:28Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T02:56:09Z","status":"completed"},{"completedAt":"2026-10-05T02:57:37Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T02:56:28Z","status":"completed"},{"completedAt":"2026-10-05T02:57:39Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T02:57:37Z","status":"completed"},{"completedAt":"2026-10-05T02:57:40Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T02:57:39Z","status":"completed"},{"completedAt":"2026-10-05T02:57:42Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T02:57:40Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37254527821/job/111588672031"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37254527821"}

```

## pack-pull-mac-complete.json

Local evidence: `.build/quantization-research/pack-owned-cli-planning-v1/pack-pull-mac-complete.json`; bytes: 3130; SHA-256: `93d07d8196647c9d69c17a33957ea101ecbede0f032924c793eba808bf92c86a`.

```text
{"conclusion":"success","headSha":"5cb25fa2edfa417e396aeae7be16431da68ed9df","jobs":[{"completedAt":"2026-10-05T03:06:14Z","conclusion":"success","databaseId":111597349350,"name":"xcode","startedAt":"2026-10-05T02:57:50Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:57:51Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:57:50Z","status":"completed"},{"completedAt":"2026-10-05T02:58:12Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:57:51Z","status":"completed"},{"completedAt":"2026-10-05T02:58:13Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T02:58:12Z","status":"completed"},{"completedAt":"2026-10-05T02:58:16Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T02:58:13Z","status":"completed"},{"completedAt":"2026-10-05T03:06:10Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T02:58:16Z","status":"completed"},{"completedAt":"2026-10-05T03:06:11Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T03:06:10Z","status":"completed"},{"completedAt":"2026-10-05T03:06:12Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T03:06:11Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37257412351/job/111597349350"},{"completedAt":"2026-10-05T03:26:44Z","conclusion":"success","databaseId":111597349488,"name":"checks","startedAt":"2026-10-05T02:59:56Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:59:57Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:59:56Z","status":"completed"},{"completedAt":"2026-10-05T03:00:25Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:59:57Z","status":"completed"},{"completedAt":"2026-10-05T03:00:25Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:00:25Z","status":"completed"},{"completedAt":"2026-10-05T03:00:26Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T03:00:25Z","status":"completed"},{"completedAt":"2026-10-05T03:26:37Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T03:00:26Z","status":"completed"},{"completedAt":"2026-10-05T03:26:38Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T03:26:37Z","status":"completed"},{"completedAt":"2026-10-05T03:26:39Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T03:26:38Z","status":"completed"},{"completedAt":"2026-10-05T03:26:42Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T03:26:39Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37257412351/job/111597349488"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37257412351"}

```
