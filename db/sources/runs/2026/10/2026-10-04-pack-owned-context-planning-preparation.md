---
type: run
created: 2026-10-05T03:18:36.475649+00:00
updated: 2026-10-05T03:18:36.475649+00:00
summary: Pack-owned context feasibility and conservative automatic windows with complete earlier Mac telemetry acceptance
binary: Source on 5cb25fa plus captured edits; new native execution pending
captured_at: 2026-10-04
command: git diff --check; bash -n Tools/consumer_smoke.sh; python3 Tools/claims_gate.py; captured GitHub native Mac jobs
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Pack-owned context planning preparation
tool: Existing context planner, pack diagnostics and external library gate
---

Context feasibility and window resolution now take the selected pack's allocation contract through a package-owned core and additive public ModelPack methods. Existing public Planner signatures retain the original contract. The maximum feasible window is bounded by the pack's actual layout capability, including in qualification mode. Explicit windows retain their requested size or refuse. A representation without its own timing anchors keeps the supported default context and reports unknown context-speed tradeoffs; it cannot inherit the original timing curve merely because its expert records are smaller. The public request-time estimate returns infinity for uncalibrated arithmetic, consistently with existing MemoryPlan estimates.

Native diagnostic fixtures cover original-plan/explanation equivalence, distinct candidate geometry, complete streamed-draft charging, explicit windows, unknown timing, supported context refusal and qualification-bound preservation. External-consumer function-value checks preserve the preexisting APIs. Diff, consumer shell syntax and public claims pass. No new native binary is built or executed locally while the frozen quality continuation owns the physical execution slot. Native acceptance of these source edits remains pending; no alternative pack or context capability is registered.

Separately, complete Mac workflow receipts for 7ffef8ad3ba7ded6ab5c40ad3b93f2fd6b46fa0d and ceddcdf422d16b96fb69e0c7b3c2a120e54ae4a4 now confirm the earlier loaded-evidence telemetry and extended native view/check source. Their scripted checks and Xcode jobs pass. This closes the earlier pending weights-free application acceptance, not the physical loaded-observation test. Three representative Light/Dark/System renders from the latter commit were manually inspected and are readable without clipping. The compressed screenshot archive and extracted files are hash-bound below; synthetic memory values do not represent a measured Mac configuration.

The quality campaign remains active and unchanged. Held-out noninferiority, complete performance, standalone export and distribution, physical activation and final product integration remain open. The context foundation prepares pack-owned CLI diagnostics; it does not yet connect an alternate serving loader or qualify a speed claim.

## checks.json

Local evidence: `.build/quantization-research/pack-context-foundation-v1/checks.json`; bytes: 530; SHA-256: `165b43876453cd232742d4008454886f144bc8e482559d8c8b15589be37d56cf`.

```text
[
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
    "name": "consumer-shell",
    "command": [
      "bash",
      "-n",
      "Tools/consumer_smoke.sh"
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
  }
]

```

## source.diff

Local evidence: `.build/quantization-research/pack-context-foundation-v1/source.diff`; bytes: 23216; SHA-256: `cffae5fe7d4f2de77ea71798301b5bb424b98ed463f8972ea896cf2c4f92178f`.

```text
diff --git a/Sources/Slotstream/ContextFeasibility.swift b/Sources/Slotstream/ContextFeasibility.swift
index e4aca79..831c8bf 100644
--- a/Sources/Slotstream/ContextFeasibility.swift
+++ b/Sources/Slotstream/ContextFeasibility.swift
@@ -65,6 +65,19 @@ extension Planner {
     /// MTP or retained-state transitions is needed. Do this at planning time,
     /// never on a metadata connection or while holding the generation lock.
     public static func contextFeasibility(_ request: PlanRequest, on device: Machine,
+        mtpAvailable: Bool = false, visionAvailable: Bool = false,
+        visionResidentReserved: Bool = false, runtimePolicy: RuntimeAllocationPolicy? = nil,
+        qualification: Bool = false, decodeLookahead: DecodeLookaheadPlanning = .automatic) -> ContextFeasibility {
+        contextFeasibility(resources: .original, request, on: device,
+            mtpAvailable: mtpAvailable, visionAvailable: visionAvailable,
+            visionResidentReserved: visionResidentReserved, runtimePolicy: runtimePolicy,
+            qualification: qualification, decodeLookahead: decodeLookahead)
+    }
+
+    /// The same feasibility search for an authenticated pack's allocation
+    /// contract. Research geometry cannot inherit the original context limit.
+    package static func contextFeasibility(resources: PackMemoryProfile,
+        _ request: PlanRequest, on device: Machine,
         mtpAvailable: Bool = false, visionAvailable: Bool = false,
         visionResidentReserved: Bool = false, runtimePolicy: RuntimeAllocationPolicy? = nil,
         qualification: Bool = false, decodeLookahead: DecodeLookaheadPlanning = .automatic) -> ContextFeasibility {
@@ -77,7 +90,7 @@ extension Planner {
         }
         var requestedLedger: ContextMemoryLedger?
         func candidate(_ cap: Int) throws -> MemoryPlan {
-            let value = try plan(expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
+            let value = try plan(resources: resources, expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
                 memoryGB: request.memoryGB, memoryLimitGB: request.memoryLimitGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                 availableGB: availability, ramPercent: request.maxRAMPercent,
                 mtp: request.mtp, mtpAvailable: mtpAvailable, vision: request.vision,
@@ -93,14 +106,17 @@ extension Planner {
         let refusal: String?
         do { resolved = try candidate(request.maxContextTokens); refusal = nil }
         catch { resolved = nil; refusal = String(describing: error) }
-        let limit = qualification ? ContextPolicy.modelLimit : ContextPolicy.implementationLimit
+        let globalLimit = qualification ? ContextPolicy.modelLimit : ContextPolicy.implementationLimit
+        let limit = min(resources.maximumContext, globalLimit)
         var maximum: MemoryPlan?
         for cap in stride(from: limit, through: 1, by: -1) {
             if let value = try? candidate(cap) { maximum = value; break }
         }
         return ContextFeasibility(requestedWindow: request.maxContextTokens,
             maximumFeasibleWindow: maximum?.maxContextTokens ?? 0,
-            limitingResource: maximum?.maxContextTokens == limit ? (qualification ? "model_limit" : "implementation_limit") : "memory_or_required_components",
+            limitingResource: maximum?.maxContextTokens == limit
+                ? (limit < globalLimit ? "pack_limit" : (qualification ? "model_limit" : "implementation_limit"))
+                : "memory_or_required_components",
             requestedPlan: resolved, requestedLedger: requestedLedger,
             maximumPlan: maximum, refusal: refusal)
     }
diff --git a/Sources/Slotstream/ContextWindowPolicy.swift b/Sources/Slotstream/ContextWindowPolicy.swift
index 70b66db..4dadece 100644
--- a/Sources/Slotstream/ContextWindowPolicy.swift
+++ b/Sources/Slotstream/ContextWindowPolicy.swift
@@ -72,6 +72,10 @@ public struct AutomaticContextWindow {
 
     /// The startup line under the plan banner.
     public func announcement(served: Int) -> String {
+        if let plan = candidates.first?.plan, !plan.resources.usesBaselineSpeedEvidence {
+            return "  window: automatic, \(served) tokens; this pack has no calibrated context-speed tradeoff. "
+                + "--max-context N selects a supported window up to \(plan.resources.maximumContext) tokens."
+        }
         let windows = ContextPolicy.automaticWindows.map(String.init).joined(separator: ", ")
         let percent = Int((ContextPolicy.automaticRequestTimeTolerance * 100).rounded())
         return "  window: automatic for this Mac, \(served) tokens: the largest of \(windows) that keeps "
@@ -81,6 +85,11 @@ public struct AutomaticContextWindow {
 
     /// The doctor section: each candidate and why auto took or declined it.
     public func report(served: Int) -> String {
+        if let plan = candidates.first?.plan, !plan.resources.usesBaselineSpeedEvidence {
+            return "\ncontext window: automatic, \(served) tokens. The pack's memory contract sets its supported limit; "
+                + "no context-speed estimate is available. Use --max-context N to choose another supported window "
+                + "up to \(plan.resources.maximumContext) tokens. Every choice still needs current memory admission."
+        }
         func pad(_ s: String, _ width: Int) -> String {
             s.count >= width ? s : String(repeating: " ", count: width - s.count) + s
         }
@@ -131,6 +140,9 @@ extension Planner {
     /// Shared by hardware-tier selection and live startup. A busy start must
     /// obey the same performance policy, not merely find any plan that fits.
     package static func automaticWindowRefusal(_ candidate: MemoryPlan, from baseline: MemoryPlan) -> String? {
+        guard candidate.resources == baseline.resources, baseline.resources.usesBaselineSpeedEvidence else {
+            return "the pack has no calibrated context-speed tradeoff"
+        }
         if baseline.mtpEnabled && !candidate.mtpEnabled { return "turns speculative decoding off" }
         // The estimate leaves speculative decoding out because this rule holds
         // it fixed, and a streamed head is not the resident head: it reads its
@@ -155,9 +167,11 @@ extension Planner {
     /// plan (a tuningPromptTokens prompt and a tuningReplyTokens reply): the
     /// score that already sizes the prefill pass. It is built from measured
     /// anchors but remains an estimate, and it leaves out speculative decoding,
-    /// which the automatic window rule holds fixed instead.
+    /// which the automatic window rule holds fixed instead. Infinity means
+    /// this pack has no applicable timing anchors, as in MemoryPlan's estimates.
     public static func estimatedRequestSeconds(_ plan: MemoryPlan) -> Double {
-        tuningPromptTokens / estPrefillTokS(chunk: plan.prefillChunk)
+        guard plan.resources.usesBaselineSpeedEvidence else { return .infinity }
+        return tuningPromptTokens / estPrefillTokS(chunk: plan.prefillChunk)
             + tuningReplyTokens / estWarmTokS(expertsPerLayer: plan.expertsPerLayerCached)
     }
 
@@ -168,13 +182,26 @@ extension Planner {
         mtpAvailable: Bool = false, visionAvailable: Bool = false,
         runtimePolicy: RuntimeAllocationPolicy? = nil,
         decodeLookahead: DecodeLookaheadPlanning = .automatic
+    ) -> AutomaticContextWindow {
+        automaticContextWindow(resources: .original, request, on: device,
+            mtpAvailable: mtpAvailable, visionAvailable: visionAvailable,
+            runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead)
+    }
+
+    /// Without timing anchors for this arithmetic, keep the conservative
+    /// default window. More RAM alone cannot establish a free context increase.
+    package static func automaticContextWindow(
+        resources: PackMemoryProfile, _ request: PlanRequest, on device: Machine,
+        mtpAvailable: Bool = false, visionAvailable: Bool = false,
+        runtimePolicy: RuntimeAllocationPolicy? = nil,
+        decodeLookahead: DecodeLookaheadPlanning = .automatic
     ) -> AutomaticContextWindow {
         typealias Candidate = AutomaticContextWindow.Candidate
-        let base = ContextPolicy.defaultTokens
+        let base = min(ContextPolicy.defaultTokens, resources.maximumContext)
         func evaluate(_ window: Int) -> (MemoryPlan?, String?) {
             do {
                 // The machine's tier decides, not how busy it is right now.
-                let value = try plan(expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
+                let value = try plan(resources: resources, expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
                     memoryGB: request.memoryGB, memoryLimitGB: request.memoryLimitGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                     availableGB: .infinity, ramPercent: request.maxRAMPercent,
                     mtp: request.mtp, mtpAvailable: mtpAvailable,
@@ -194,13 +221,25 @@ extension Planner {
                 window: base, plan: nil, refusal: baseRefusal, requestSeconds: nil, relativeRequestCost: nil,
                 accepted: true, reason: "default window; no plan on this machine to compare against")])
         }
+        guard resources.usesBaselineSpeedEvidence else {
+            var candidates = [Candidate(window: base, plan: basePlan, refusal: nil,
+                requestSeconds: nil, relativeRequestCost: nil, accepted: true,
+                reason: "default window; this pack has no calibrated context-speed tradeoff")]
+            for window in ContextPolicy.automaticWindows where window > base {
+                candidates.append(Candidate(window: window, plan: nil, refusal: nil,
+                    requestSeconds: nil, relativeRequestCost: nil, accepted: false,
+                    reason: window > resources.maximumContext ? "above this pack's supported limit"
+                        : "this pack has no calibrated context-speed tradeoff"))
+            }
+            return AutomaticContextWindow(window: base, candidates: candidates)
+        }
         let baseSeconds = estimatedRequestSeconds(basePlan)
         var chosen = base
         var candidates = [Candidate(window: base, plan: basePlan, refusal: nil, requestSeconds: baseSeconds,
             relativeRequestCost: 0, accepted: true, reason: "default window")]
         let fixedCache = request.expertsPerLayer != nil || request.poolGB != nil
         for window in ContextPolicy.automaticWindows where window > base {
-            if window > ContextPolicy.implementationLimit || fixedCache {
+            if window > min(ContextPolicy.implementationLimit, resources.maximumContext) || fixedCache {
                 candidates.append(Candidate(window: window, plan: nil, refusal: nil, requestSeconds: nil,
                     relativeRequestCost: nil, accepted: false,
                     reason: fixedCache ? "a fixed cache size keeps the default window" : "above the supported limit"))
@@ -235,9 +274,20 @@ extension Planner {
         mtpAvailable: Bool = false, visionAvailable: Bool = false,
         runtimePolicy: RuntimeAllocationPolicy? = nil,
         decodeLookahead: DecodeLookaheadPlanning = .automatic
+    ) throws -> (plan: MemoryPlan, automatic: AutomaticContextWindow?) {
+        try resolveContextWindow(resources: .original, choice, request: request, on: device,
+            mtpAvailable: mtpAvailable, visionAvailable: visionAvailable,
+            runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead)
+    }
+
+    package static func resolveContextWindow(
+        resources: PackMemoryProfile, _ choice: ContextWindowChoice, request: PlanRequest, on device: Machine,
+        mtpAvailable: Bool = false, visionAvailable: Bool = false,
+        runtimePolicy: RuntimeAllocationPolicy? = nil,
+        decodeLookahead: DecodeLookaheadPlanning = .automatic
     ) throws -> (plan: MemoryPlan, automatic: AutomaticContextWindow?) {
         func live(_ window: Int, _ retention: ContextRetention) throws -> MemoryPlan {
-            try plan(expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
+            try plan(resources: resources, expertsPerLayer: request.expertsPerLayer, poolGB: request.poolGB,
                 memoryGB: request.memoryGB, memoryLimitGB: request.memoryLimitGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                 availableGB: device.availableGB, ramPercent: request.maxRAMPercent,
                 mtp: request.mtp, mtpAvailable: mtpAvailable,
@@ -250,9 +300,9 @@ extension Planner {
         case .tokens(let tokens):
             return (try live(tokens, .automatic), nil)
         case .automatic:
-            let automatic = automaticContextWindow(request, on: device, mtpAvailable: mtpAvailable,
+            let automatic = automaticContextWindow(resources: resources, request, on: device, mtpAvailable: mtpAvailable,
                 visionAvailable: visionAvailable, runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead)
-            let base = ContextPolicy.defaultTokens
+            let base = min(ContextPolicy.defaultTokens, resources.maximumContext)
             // A startup plan fixes the draft head for the life of the process
             // (the governor never loads or unloads it), so a busy start must
             // not trade speculative decoding for the larger window.
diff --git a/Sources/Slotstream/ModelPackPlanning.swift b/Sources/Slotstream/ModelPackPlanning.swift
index 9031890..396bc95 100644
--- a/Sources/Slotstream/ModelPackPlanning.swift
+++ b/Sources/Slotstream/ModelPackPlanning.swift
@@ -12,6 +12,40 @@ public struct ModelPackMemoryRange: Equatable, Sendable {
 }
 
 public extension ModelPack {
+    /// Context diagnostics use the selected pack's complete allocation
+    /// contract, including its own supported context and component limits.
+    func contextFeasibility(_ request: PlanRequest, on machine: Machine,
+                            mtpAvailable: Bool = false, visionAvailable: Bool = false,
+                            visionResidentReserved: Bool = false,
+                            runtimePolicy: RuntimeAllocationPolicy? = nil,
+                            decodeLookahead: DecodeLookaheadPlanning = .automatic) -> ContextFeasibility {
+        Planner.contextFeasibility(resources: memoryProfile, request, on: machine,
+            mtpAvailable: mtpAvailable, visionAvailable: visionAvailable,
+            visionResidentReserved: visionResidentReserved, runtimePolicy: runtimePolicy,
+            decodeLookahead: decodeLookahead)
+    }
+
+    func automaticContextWindow(_ request: PlanRequest, on machine: Machine,
+                                mtpAvailable: Bool = false, visionAvailable: Bool = false,
+                                runtimePolicy: RuntimeAllocationPolicy? = nil,
+                                decodeLookahead: DecodeLookaheadPlanning = .automatic) -> AutomaticContextWindow {
+        Planner.automaticContextWindow(resources: memoryProfile, request, on: machine,
+            mtpAvailable: mtpAvailable, visionAvailable: visionAvailable,
+            runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead)
+    }
+
+    /// Explicit context stays explicit. Auto never applies original-pack speed
+    /// curves to a different representation without its own timing evidence.
+    func resolveContextWindow(_ choice: ContextWindowChoice, request: PlanRequest, on machine: Machine,
+                              mtpAvailable: Bool = false, visionAvailable: Bool = false,
+                              runtimePolicy: RuntimeAllocationPolicy? = nil,
+                              decodeLookahead: DecodeLookaheadPlanning = .automatic)
+        throws -> (plan: MemoryPlan, automatic: AutomaticContextWindow?) {
+        try Planner.resolveContextWindow(resources: memoryProfile, choice, request: request, on: machine,
+            mtpAvailable: mtpAvailable, visionAvailable: visionAvailable,
+            runtimePolicy: runtimePolicy, decodeLookahead: decodeLookahead)
+    }
+
     /// The pack owns its resource arithmetic. Optional components keep their
     /// independent availability and required/automatic choices; a plan never
     /// reinterprets a newly registered pack using the original byte geometry.
diff --git a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
index d828ab2..3003736 100644
--- a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
@@ -95,6 +95,57 @@ extension Diagnostics {
         let standard = try pack.memoryRange(for: request, on: roomy)
         c.expect("coarser accessible display cannot lower the admitted minimum", standard.minimumBytes >= fine.minimumBytes)
         c.expect("coarser display never exceeds the hardware maximum", standard.hardwareMaximumBytes <= fine.hardwareMaximumBytes)
+
+        // These paths feed serving and doctor. Compare the complete original
+        // decision, not just a slot count, to preserve the independent API.
+        let contextRequest = PlanRequest(memoryLimitGB: 20, mtp: .off, vision: .off)
+        for choice: ContextWindowChoice in [.automatic, .tokens(8192)] {
+            let owned = try pack.resolveContextWindow(choice, request: contextRequest, on: roomy)
+            let legacy = try Planner.resolveContextWindow(choice, request: contextRequest, on: roomy)
+            c.equal("pack context selection preserves original plan/\(choice)", try bytes(owned.plan), try bytes(legacy.plan))
+            let ownedJSON = owned.automatic?.json ?? [:]
+            let legacyJSON = legacy.automatic?.json ?? [:]
+            c.equal("pack context selection preserves original explanation/\(choice)",
+                try JSONSerialization.data(withJSONObject: ownedJSON, options: [.sortedKeys]),
+                try JSONSerialization.data(withJSONObject: legacyJSON, options: [.sortedKeys]))
+        }
+
+        // Exercise genuinely different geometry without registering a research
+        // pack or loading weights. Its explicit upper bound prevents a costly
+        // search through windows the format cannot serve.
+        let resources = PackMemoryProfile.affine3GroupedVisionControl
+        let candidateMachine = Machine.simulated(ramGB: 48, availableGB: 40)
+        var candidateRequest = PlanRequest(memoryLimitGB: 14, mtp: .on, vision: .off)
+        candidateRequest.mtpExperts = .streamed
+        let automatic = try Planner.resolveContextWindow(resources: resources, .automatic,
+            request: candidateRequest, on: candidateMachine, mtpAvailable: true)
+        c.expect("uncalibrated pack keeps its supported default and complete geometry",
+            automatic.plan.resources == resources && automatic.plan.maxContextTokens == 32768 &&
+            automatic.plan.mtpEnabled && automatic.plan.mtpStreamedExperts && automatic.plan.simulated)
+        c.expect("uncalibrated pack does not inherit original request estimates",
+            !Planner.estimatedRequestSeconds(automatic.plan).isFinite &&
+            automatic.automatic?.candidates.allSatisfy { $0.requestSeconds == nil && $0.relativeRequestCost == nil } == true)
+        c.expect("uncalibrated context explanation does not imply a measured tradeoff",
+            automatic.automatic?.announcement(served: 32768).contains("no calibrated") == true &&
+            automatic.automatic?.report(served: 32768).contains("no context-speed estimate") == true)
+        try Planner.validateMemoryBudget(automatic.plan, availableGB: candidateMachine.availableGB)
+        let explicit = try Planner.resolveContextWindow(resources: resources, .tokens(8192),
+            request: candidateRequest, on: candidateMachine, mtpAvailable: true)
+        c.expect("explicit candidate context retains its selected allocation contract",
+            explicit.plan.resources == resources && explicit.plan.maxContextTokens == 8192 && explicit.automatic == nil)
+        candidateRequest.maxContextTokens = 65536
+        let refusal = Planner.contextFeasibility(resources: resources, candidateRequest,
+            on: candidateMachine, mtpAvailable: true)
+        c.expect("candidate context diagnostics refuse the unsupported window and name the real limit",
+            refusal.requestedPlan == nil && refusal.refusal != nil &&
+            refusal.maximumFeasibleWindow == resources.maximumContext && refusal.limitingResource == "pack_limit" &&
+            refusal.maximumPlan?.resources == resources)
+        // Qualification bypasses a global rollout limit, never an unsupported
+        // pack layout. More simulated RAM must not authorize another context.
+        let qualified = Planner.contextFeasibility(resources: resources, candidateRequest,
+            on: candidateMachine, mtpAvailable: true, qualification: true)
+        c.expect("qualification cannot bypass the selected pack's context limit",
+            qualified.requestedPlan == nil && qualified.maximumFeasibleWindow == resources.maximumContext)
         return c.report()
     }
 }
diff --git a/Tools/consumer_smoke.sh b/Tools/consumer_smoke.sh
index e009623..0cb4ce5 100755
--- a/Tools/consumer_smoke.sh
+++ b/Tools/consumer_smoke.sh
@@ -94,7 +94,15 @@ let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: Machine.simulated(ram
 precondition(plan.slots > 0, "a 16 GB plan should size a pool")
 precondition(plan.simulated, "a simulated machine must mark its plan")
 let maintained = ModelPackRegistry.baseline
+let legacyFeasibility: (PlanRequest, Machine, Bool, Bool, Bool, RuntimeAllocationPolicy?, Bool, DecodeLookaheadPlanning) -> ContextFeasibility = Planner.contextFeasibility
+let legacyAutomaticWindow: (PlanRequest, Machine, Bool, Bool, RuntimeAllocationPolicy?, DecodeLookaheadPlanning) -> AutomaticContextWindow = Planner.automaticContextWindow
+let legacyResolveWindow: (ContextWindowChoice, PlanRequest, Machine, Bool, Bool, RuntimeAllocationPolicy?, DecodeLookaheadPlanning) throws -> (plan: MemoryPlan, automatic: AutomaticContextWindow?) = Planner.resolveContextWindow
+let ownedFeasibility: (PlanRequest, Machine, Bool, Bool, Bool, RuntimeAllocationPolicy?, DecodeLookaheadPlanning) -> ContextFeasibility = maintained.contextFeasibility
+_ = (legacyFeasibility, legacyAutomaticWindow, legacyResolveWindow, ownedFeasibility)
 let startupMachine = Machine.simulated(ramGB: 48, availableGB: 40)
+let ownedWindow = try maintained.resolveContextWindow(.tokens(8192),
+    request: PlanRequest(memoryLimitGB: 10, mtp: .off, vision: .off), on: startupMachine)
+precondition(ownedWindow.plan.simulated && ownedWindow.plan.maxContextTokens == 8192 && ownedWindow.automatic == nil)
 let ownedPlan = try maintained.startupPlan(customMemoryGB: 10, on: startupMachine)
 precondition(ownedPlan.simulated && ownedPlan.memoryLimitGB == 10)
 precondition(ownedPlan.maxContextTokens == maintained.startupDefaults.contextTokens)

```

## native-loaded-evidence-ci.json

Local evidence: `.build/quantization-research/pack-context-foundation-v1/native-loaded-evidence-ci.json`; bytes: 3130; SHA-256: `cc8ef52807bf8ef28bf699acf0f1e3ae1b1ac39daf7b9810afd3578ffaa9eb1f`.

```text
{"conclusion":"success","headSha":"ceddcdf422d16b96fb69e0c7b3c2a120e54ae4a4","jobs":[{"completedAt":"2026-10-05T03:04:44Z","conclusion":"success","databaseId":111593339123,"name":"checks","startedAt":"2026-10-05T02:36:54Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:36:55Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:36:54Z","status":"completed"},{"completedAt":"2026-10-05T02:37:26Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:36:55Z","status":"completed"},{"completedAt":"2026-10-05T02:37:26Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T02:37:26Z","status":"completed"},{"completedAt":"2026-10-05T02:37:27Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T02:37:26Z","status":"completed"},{"completedAt":"2026-10-05T03:04:39Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T02:37:27Z","status":"completed"},{"completedAt":"2026-10-05T03:04:41Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T03:04:39Z","status":"completed"},{"completedAt":"2026-10-05T03:04:41Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T03:04:41Z","status":"completed"},{"completedAt":"2026-10-05T03:04:42Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T03:04:41Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37256084608/job/111593339123"},{"completedAt":"2026-10-05T02:47:41Z","conclusion":"success","databaseId":111593339238,"name":"xcode","startedAt":"2026-10-05T02:36:53Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:36:54Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:36:53Z","status":"completed"},{"completedAt":"2026-10-05T02:37:26Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:36:54Z","status":"completed"},{"completedAt":"2026-10-05T02:37:27Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T02:37:26Z","status":"completed"},{"completedAt":"2026-10-05T02:37:30Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T02:37:27Z","status":"completed"},{"completedAt":"2026-10-05T02:47:37Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T02:37:30Z","status":"completed"},{"completedAt":"2026-10-05T02:47:38Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T02:47:37Z","status":"completed"},{"completedAt":"2026-10-05T02:47:40Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T02:47:38Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37256084608/job/111593339238"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37256084608"}

```

## native-loaded-evidence-checks.log

Local evidence: `.build/quantization-research/pack-context-foundation-v1/native-loaded-evidence-checks.log`; bytes: 184327; SHA-256: `74b67b5daf9373bb7c7037fa643395a4336cfa51f6ecfda6f9ef6ba9191e2348`.

```text
﻿2026-10-05T02:36:54.8699260Z Current runner version: '2.337.0'
2026-10-05T02:36:54.8719650Z ##[group]Runner Image Provisioner
2026-10-05T02:36:54.8720330Z Hosted Compute Agent
2026-10-05T02:36:54.8720740Z Version: 20260828.587
2026-10-05T02:36:54.8721160Z Commit: abac92662cab4cc7352de4f9f9d2e2419aad9c29
2026-10-05T02:36:54.8721620Z Build Date: 2026-08-28T16:44:25Z
2026-10-05T02:36:54.8722110Z Worker ID: {e1b73bae-1dc3-41e8-aba9-13dc7bdb4153}
2026-10-05T02:36:54.8722610Z Azure Region: westus
2026-10-05T02:36:54.8722970Z ##[endgroup]
2026-10-05T02:36:54.8723960Z ##[group]Operating System
2026-10-05T02:36:54.8724540Z macOS
2026-10-05T02:36:54.8724930Z 26.6.2
2026-10-05T02:36:54.8725280Z 25G83
2026-10-05T02:36:54.8725680Z ##[endgroup]
2026-10-05T02:36:54.8726090Z ##[group]Runner Image
2026-10-05T02:36:54.8726460Z Image: macos-26-arm64
2026-10-05T02:36:54.8726820Z Version: 20260907.0351.1
2026-10-05T02:36:54.8727740Z Included Software: https://github.com/actions/runner-images/blob/macos-26-arm64/20260907.0351/images/macos/macos-26-arm64-Readme.md
2026-10-05T02:36:54.8728850Z Image Release: https://github.com/actions/runner-images/releases/tag/macos-26-arm64%2F20260907.0351
2026-10-05T02:36:54.8729550Z ##[endgroup]
2026-10-05T02:36:54.8730370Z ##[group]GITHUB_TOKEN Permissions
2026-10-05T02:36:54.8731890Z Contents: read
2026-10-05T02:36:54.8732240Z Metadata: read
2026-10-05T02:36:54.8732590Z ##[endgroup]
2026-10-05T02:36:54.8734020Z Secret source: Actions
2026-10-05T02:36:54.8734570Z Cache mode: write
2026-10-05T02:36:54.8735010Z Prepare workflow directory
2026-10-05T02:36:54.9111560Z Prepare all required actions
2026-10-05T02:36:54.9155120Z Getting action download info
2026-10-05T02:36:55.0730420Z Download action repository 'actions/checkout@v7' (SHA:3d3c42e5aac5ba805825da76410c181273ba90b1)
2026-10-05T02:36:55.4188350Z Download action repository 'actions/upload-artifact@v4' (SHA:ea165f8d65b6e75b540449e92b4886f43607fa02)
2026-10-05T02:36:55.7309420Z Complete job name: checks
2026-10-05T02:36:55.8378740Z ##[group]Run actions/checkout@v7
2026-10-05T02:36:55.8379960Z with:
2026-10-05T02:36:55.8380580Z   repository: carloslfu/slotstream
2026-10-05T02:36:55.8383560Z   token: ***
2026-10-05T02:36:55.8383950Z   ssh-strict: true
2026-10-05T02:36:55.8384360Z   ssh-user: git
2026-10-05T02:36:55.8384770Z   persist-credentials: true
2026-10-05T02:36:55.8385150Z   clean: true
2026-10-05T02:36:55.8385540Z   sparse-checkout-cone-mode: true
2026-10-05T02:36:55.8385970Z   fetch-depth: 1
2026-10-05T02:36:55.8386300Z   fetch-tags: false
2026-10-05T02:36:55.8386630Z   show-progress: true
2026-10-05T02:36:55.8386950Z   lfs: false
2026-10-05T02:36:55.8387270Z   submodules: false
2026-10-05T02:36:55.8387610Z   set-safe-directory: true
2026-10-05T02:36:55.8388190Z   allow-unsafe-pr-checkout: false
2026-10-05T02:36:55.8389110Z ##[endgroup]
2026-10-05T02:36:56.6201480Z Syncing repository: carloslfu/slotstream
2026-10-05T02:36:56.6203570Z ##[group]Getting Git version info
2026-10-05T02:36:56.6204360Z Working directory is '/Users/runner/work/slotstream/slotstream'
2026-10-05T02:36:56.6205340Z [command]/opt/homebrew/bin/git version
2026-10-05T02:36:56.6875680Z git version 2.55.0
2026-10-05T02:36:56.6917650Z ##[endgroup]
2026-10-05T02:36:56.6923460Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/7d4c1420-9ac7-470c-aa4e-54a1e08783a7/.gitconfig'
2026-10-05T02:36:56.6924730Z Temporarily overriding HOME='/Users/runner/work/_temp/7d4c1420-9ac7-470c-aa4e-54a1e08783a7' before making global git config changes
2026-10-05T02:36:56.6925840Z Adding repository directory to the temporary git global config as a safe directory
2026-10-05T02:36:56.6927030Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
2026-10-05T02:36:56.7093590Z Deleting the contents of '/Users/runner/work/slotstream/slotstream'
2026-10-05T02:36:56.7102590Z ##[group]Determining repository object format
2026-10-05T02:36:56.7106130Z ##[endgroup]
2026-10-05T02:36:56.7108770Z ##[group]Initializing the repository
2026-10-05T02:36:56.7114610Z [command]/opt/homebrew/bin/git init /Users/runner/work/slotstream/slotstream
2026-10-05T02:36:56.7632340Z hint: Using 'master' as the name for the initial branch. This default branch name
2026-10-05T02:36:56.7633920Z hint: will change to "main" in Git 3.0. To configure the initial branch name
2026-10-05T02:36:56.7635230Z hint: to use in all of your new repositories, which will suppress this warning,
2026-10-05T02:36:56.7636350Z hint: call:
2026-10-05T02:36:56.7638470Z hint:
2026-10-05T02:36:56.7640850Z hint: 	git config --global init.defaultBranch <name>
2026-10-05T02:36:56.7641790Z hint:
2026-10-05T02:36:56.7642430Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2026-10-05T02:36:56.7643920Z hint: 'development'. The just-created branch can be renamed via this command:
2026-10-05T02:36:56.7645060Z hint:
2026-10-05T02:36:56.7645690Z hint: 	git branch -m <name>
2026-10-05T02:36:56.7646850Z hint:
2026-10-05T02:36:56.7651420Z hint: Disable this message with "git config set advice.defaultBranchName false"
2026-10-05T02:36:56.7654070Z Initialized empty Git repository in /Users/runner/work/slotstream/slotstream/.git/
2026-10-05T02:36:56.7661040Z [command]/opt/homebrew/bin/git remote add origin https://github.com/carloslfu/slotstream
2026-10-05T02:36:56.7785310Z ##[endgroup]
2026-10-05T02:36:56.7786510Z ##[group]Disabling automatic garbage collection
2026-10-05T02:36:56.7790230Z [command]/opt/homebrew/bin/git config --local gc.auto 0
2026-10-05T02:36:56.7893870Z ##[endgroup]
2026-10-05T02:36:56.7895830Z ##[group]Setting up auth
2026-10-05T02:36:56.7897140Z Removing SSH command configuration
2026-10-05T02:36:56.7918580Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
2026-10-05T02:36:56.8037570Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2026-10-05T02:36:56.9782770Z Removing HTTP extra header
2026-10-05T02:36:56.9784400Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2026-10-05T02:36:56.9866870Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2026-10-05T02:36:57.1883550Z Removing includeIf entries pointing to credentials config files
2026-10-05T02:36:57.1992050Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
2026-10-05T02:36:57.2301900Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
2026-10-05T02:36:57.4150100Z [command]/opt/homebrew/bin/git config --file /Users/runner/work/_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config http.https://github.com/.extraheader AUTHORIZATION: basic ***
2026-10-05T02:36:57.4302680Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git.path /Users/runner/work/_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T02:36:57.4331340Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path /Users/runner/work/_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T02:36:57.4338550Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git.path /github/runner_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T02:36:57.4374550Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git/worktrees/*.path /github/runner_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T02:36:57.4472510Z ##[endgroup]
2026-10-05T02:36:57.4475120Z ##[group]Fetching the repository
2026-10-05T02:36:57.4481160Z [command]/opt/homebrew/bin/git -c protocol.version=2 fetch --no-tags --prune --no-recurse-submodules --depth=1 origin +ceddcdf422d16b96fb69e0c7b3c2a120e54ae4a4:refs/remotes/origin/main
2026-10-05T02:37:16.5124960Z From https://github.com/carloslfu/slotstream
2026-10-05T02:37:16.5126870Z  * [new ref]         ceddcdf422d16b96fb69e0c7b3c2a120e54ae4a4 -> origin/main
2026-10-05T02:37:16.5179350Z [command]/opt/homebrew/bin/git branch --list --remote origin/main
2026-10-05T02:37:16.5333340Z   origin/main
2026-10-05T02:37:16.5347250Z [command]/opt/homebrew/bin/git rev-parse refs/remotes/origin/main
2026-10-05T02:37:16.5489380Z ceddcdf422d16b96fb69e0c7b3c2a120e54ae4a4
2026-10-05T02:37:16.5497980Z ##[endgroup]
2026-10-05T02:37:16.5499560Z ##[group]Determining the checkout info
2026-10-05T02:37:16.5501330Z ##[endgroup]
2026-10-05T02:37:16.5520230Z [command]/opt/homebrew/bin/git sparse-checkout disable
2026-10-05T02:37:16.5737470Z [command]/opt/homebrew/bin/git config --local --unset-all extensions.worktreeConfig
2026-10-05T02:37:16.5866690Z ##[group]Checking out the ref
2026-10-05T02:37:16.5873410Z [command]/opt/homebrew/bin/git checkout --progress --force -B main refs/remotes/origin/main
2026-10-05T02:37:18.6347420Z Updating files:  45% (1310/2892)
2026-10-05T02:37:18.6513390Z Updating files:  46% (1331/2892)
2026-10-05T02:37:18.8948730Z Updating files:  46% (1332/2892)
2026-10-05T02:37:19.1105330Z Updating files:  47% (1360/2892)
2026-10-05T02:37:19.5960750Z Updating files:  48% (1389/2892)
2026-10-05T02:37:19.6649990Z Updating files:  49% (1418/2892)
2026-10-05T02:37:19.6920990Z Updating files:  49% (1421/2892)
2026-10-05T02:37:19.7034800Z Updating files:  50% (1446/2892)
2026-10-05T02:37:19.7132560Z Updating files:  51% (1475/2892)
2026-10-05T02:37:19.7207390Z Updating files:  52% (1504/2892)
2026-10-05T02:37:19.7334790Z Updating files:  53% (1533/2892)
2026-10-05T02:37:19.7397240Z Updating files:  54% (1562/2892)
2026-10-05T02:37:19.7460100Z Updating files:  55% (1591/2892)
2026-10-05T02:37:19.7668430Z Updating files:  56% (1620/2892)
2026-10-05T02:37:19.7669500Z Updating files:  57% (1649/2892)
2026-10-05T02:37:19.7721290Z Updating files:  58% (1678/2892)
2026-10-05T02:37:19.7818290Z Updating files:  59% (1707/2892)
2026-10-05T02:37:19.7896760Z Updating files:  60% (1736/2892)
2026-10-05T02:37:19.8042940Z Updating files:  61% (1765/2892)
2026-10-05T02:37:19.8058520Z Updating files:  62% (1794/2892)
2026-10-05T02:37:19.8147790Z Updating files:  63% (1822/2892)
2026-10-05T02:37:19.8294230Z Updating files:  64% (1851/2892)
2026-10-05T02:37:19.8396550Z Updating files:  65% (1880/2892)
2026-10-05T02:37:19.8465620Z Updating files:  66% (1909/2892)
2026-10-05T02:37:19.8599920Z Updating files:  67% (1938/2892)
2026-10-05T02:37:19.9452080Z Updating files:  68% (1967/2892)
2026-10-05T02:37:20.0390930Z Updating files:  69% (1996/2892)
2026-10-05T02:37:20.0492110Z Updating files:  70% (2025/2892)
2026-10-05T02:37:20.2153960Z Updating files:  71% (2054/2892)
2026-10-05T02:37:20.6905000Z Updating files:  72% (2083/2892)
2026-10-05T02:37:21.1227690Z Updating files:  72% (2094/2892)
2026-10-05T02:37:21.4017600Z Updating files:  73% (2112/2892)
2026-10-05T02:37:21.5748780Z Updating files:  74% (2141/2892)
2026-10-05T02:37:21.6563250Z Updating files:  75% (2169/2892)
2026-10-05T02:37:21.9918930Z Updating files:  75% (2182/2892)
2026-10-05T02:37:22.3241850Z Updating files:  76% (2198/2892)
2026-10-05T02:37:22.6409000Z Updating files:  77% (2227/2892)
2026-10-05T02:37:22.8308210Z Updating files:  77% (2245/2892)
2026-10-05T02:37:22.8698800Z Updating files:  78% (2256/2892)
2026-10-05T02:37:23.1436480Z Updating files:  79% (2285/2892)
2026-10-05T02:37:23.3049060Z Updating files:  80% (2314/2892)
2026-10-05T02:37:23.4149280Z Updating files:  81% (2343/2892)
2026-10-05T02:37:23.6174610Z Updating files:  82% (2372/2892)
2026-10-05T02:37:23.6422730Z Updating files:  83% (2401/2892)
2026-10-05T02:37:23.6957090Z Updating files:  83% (2410/2892)
2026-10-05T02:37:24.0613970Z Updating files:  84% (2430/2892)
2026-10-05T02:37:24.2980690Z Updating files:  85% (2459/2892)
2026-10-05T02:37:24.6527730Z Updating files:  86% (2488/2892)
2026-10-05T02:37:24.6884310Z Updating files:  86% (2511/2892)
2026-10-05T02:37:24.8641580Z Updating files:  87% (2517/2892)
2026-10-05T02:37:24.9180960Z Updating files:  88% (2545/2892)
2026-10-05T02:37:24.9272180Z Updating files:  89% (2574/2892)
2026-10-05T02:37:24.9344280Z Updating files:  90% (2603/2892)
2026-10-05T02:37:24.9464140Z Updating files:  91% (2632/2892)
2026-10-05T02:37:24.9712040Z Updating files:  92% (2661/2892)
2026-10-05T02:37:24.9798560Z Updating files:  93% (2690/2892)
2026-10-05T02:37:25.2106770Z Updating files:  94% (2719/2892)
2026-10-05T02:37:25.5166400Z Updating files:  95% (2748/2892)
2026-10-05T02:37:25.6379460Z Updating files:  96% (2777/2892)
2026-10-05T02:37:25.6809010Z Updating files:  96% (2797/2892)
2026-10-05T02:37:25.7804540Z Updating files:  97% (2806/2892)
2026-10-05T02:37:25.8860480Z Updating files:  98% (2835/2892)
2026-10-05T02:37:25.8972320Z Updating files:  99% (2864/2892)
2026-10-05T02:37:25.8973090Z Updating files: 100% (2892/2892)
2026-10-05T02:37:25.8973600Z Updating files: 100% (2892/2892), done.
2026-10-05T02:37:25.9184000Z Switched to a new branch 'main'
2026-10-05T02:37:25.9189280Z branch 'main' set up to track 'origin/main'.
2026-10-05T02:37:25.9571560Z ##[endgroup]
2026-10-05T02:37:26.0070490Z [command]/opt/homebrew/bin/git log -1 --format=%H
2026-10-05T02:37:26.0220310Z ceddcdf422d16b96fb69e0c7b3c2a120e54ae4a4
2026-10-05T02:37:26.1336780Z ##[group]Run sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
2026-10-05T02:37:26.1337520Z [36;1msudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"[0m
2026-10-05T02:37:26.1440220Z shell: /bin/bash -e {0}
2026-10-05T02:37:26.1444680Z ##[endgroup]
2026-10-05T02:37:26.5795530Z ##[group]Run Tools/dbmd_install.sh
2026-10-05T02:37:26.5796150Z [36;1mTools/dbmd_install.sh[0m
2026-10-05T02:37:26.5837080Z shell: /bin/bash -e {0}
2026-10-05T02:37:26.5837460Z ##[endgroup]
2026-10-05T02:37:27.2762190Z installed dbmd 0.14.0 to /Users/runner/.dbmd/bin/dbmd
2026-10-05T02:37:27.2928800Z ##[group]Run bash Tools/check_sevra_mac.sh
2026-10-05T02:37:27.2929210Z [36;1mbash Tools/check_sevra_mac.sh[0m
2026-10-05T02:37:27.2999970Z shell: /bin/bash -e {0}
2026-10-05T02:37:27.3000190Z env:
2026-10-05T02:37:27.3000380Z   SEVRA_CHECKS_OCR_OPTIONAL: 1
2026-10-05T02:37:27.3000680Z ##[endgroup]
2026-10-05T02:37:48.8158450Z Fetching https://github.com/apple/swift-asn1.git
2026-10-05T02:37:48.8213200Z Fetching https://github.com/apple/swift-numerics
2026-10-05T02:37:49.4381620Z [1/1986] Fetching swift-asn1
2026-10-05T02:37:49.5674890Z [558/8644] Fetching swift-asn1, swift-numerics
2026-10-05T02:37:49.9388820Z Fetched https://github.com/apple/swift-asn1.git from cache (1.13s)
2026-10-05T02:37:49.9398500Z Fetched https://github.com/apple/swift-numerics from cache (1.13s)
2026-10-05T02:37:49.9523610Z Fetching https://github.com/swiftlang/swift-markdown.git
2026-10-05T02:37:49.9524880Z Fetching https://github.com/mattt/EventSource.git
2026-10-05T02:37:50.5493330Z [1/303] Fetching eventsource
2026-10-05T02:37:50.6813820Z Fetched https://github.com/mattt/EventSource.git from cache (0.73s)
2026-10-05T02:37:50.6932970Z Fetching https://github.com/apple/swift-collections.git
2026-10-05T02:37:50.8696060Z [1/7763] Fetching swift-markdown
2026-10-05T02:37:51.2580700Z Fetched https://github.com/swiftlang/swift-markdown.git from cache (1.31s)
2026-10-05T02:37:51.2692440Z Fetching https://github.com/ibireme/yyjson.git
2026-10-05T02:37:51.7443510Z [1/28538] Fetching swift-collections
2026-10-05T02:37:52.0625550Z [5709/33537] Fetching swift-collections, yyjson
2026-10-05T02:37:52.9076290Z Fetched https://github.com/apple/swift-collections.git from cache (2.21s)
2026-10-05T02:37:52.9546080Z Fetching https://github.com/huggingface/swift-jinja.git
2026-10-05T02:37:52.9981690Z Fetched https://github.com/ibireme/yyjson.git from cache (1.72s)
2026-10-05T02:37:53.0083590Z Fetching https://github.com/huggingface/swift-transformers.git
2026-10-05T02:37:53.6403580Z [1/1376] Fetching swift-jinja
2026-10-05T02:37:53.7053180Z [84/8460] Fetching swift-jinja, swift-transformers
2026-10-05T02:37:53.9021970Z Fetched https://github.com/huggingface/swift-jinja.git from cache (0.96s)
2026-10-05T02:37:53.9148480Z Fetching https://github.com/apple/swift-crypto.git
2026-10-05T02:37:54.0374110Z [921/7084] Fetching swift-transformers
2026-10-05T02:37:54.2651950Z Fetched https://github.com/huggingface/swift-transformers.git from cache (1.25s)
2026-10-05T02:37:54.2893360Z Fetching https://github.com/huggingface/swift-huggingface.git
2026-10-05T02:37:54.5967370Z [1/18572] Fetching swift-crypto
2026-10-05T02:37:54.9339730Z [1859/21379] Fetching swift-crypto, swift-huggingface
2026-10-05T02:37:55.2640300Z Fetched https://github.com/huggingface/swift-huggingface.git from cache (0.98s)
2026-10-05T02:37:55.2735740Z Fetching https://github.com/ml-explore/mlx-swift.git
2026-10-05T02:37:55.2953450Z [3715/18572] Fetching swift-crypto
2026-10-05T02:37:55.8760550Z Fetched https://github.com/apple/swift-crypto.git from cache (1.95s)
2026-10-05T02:37:55.8861860Z Fetching https://github.com/swiftlang/swift-cmark.git
2026-10-05T02:37:56.3289600Z [1/17063] Fetching mlx-swift
2026-10-05T02:37:56.9689790Z [17064/35676] Fetching mlx-swift, swift-cmark
2026-10-05T02:37:57.6203280Z Fetched https://github.com/ml-explore/mlx-swift.git from cache (2.34s)
2026-10-05T02:37:57.6408620Z Fetching https://github.com/apple/swift-argument-parser.git
2026-10-05T02:37:57.8833160Z Fetched https://github.com/swiftlang/swift-cmark.git from cache (2.00s)
2026-10-05T02:37:58.5144260Z [1/19047] Fetching swift-argument-parser
2026-10-05T02:37:59.1107600Z Fetched https://github.com/apple/swift-argument-parser.git from cache (1.47s)
2026-10-05T02:37:59.1526020Z Creating working copy for https://github.com/apple/swift-numerics
2026-10-05T02:37:59.1530270Z Creating working copy for https://github.com/apple/swift-asn1.git
2026-10-05T02:37:59.2096030Z Creating working copy for https://github.com/mattt/EventSource.git
2026-10-05T02:37:59.3397690Z Working copy of https://github.com/mattt/EventSource.git resolved at 1.5.1
2026-10-05T02:37:59.3399850Z Creating working copy for https://github.com/swiftlang/swift-markdown.git
2026-10-05T02:37:59.3619870Z Working copy of https://github.com/apple/swift-numerics resolved at 1.1.1
2026-10-05T02:37:59.3943870Z Working copy of https://github.com/apple/swift-asn1.git resolved at 1.7.1
2026-10-05T02:37:59.3976520Z Creating working copy for https://github.com/apple/swift-collections.git
2026-10-05T02:37:59.4231820Z Creating working copy for https://github.com/ibireme/yyjson.git
2026-10-05T02:37:59.6437970Z Working copy of https://github.com/swiftlang/swift-markdown.git resolved at 0.8.0
2026-10-05T02:37:59.7134430Z Creating working copy for https://github.com/huggingface/swift-jinja.git
2026-10-05T02:37:59.9146170Z Working copy of https://github.com/huggingface/swift-jinja.git resolved at 2.4.2
2026-10-05T02:37:59.9550270Z Creating working copy for https://github.com/huggingface/swift-transformers.git
2026-10-05T02:38:00.1199650Z Working copy of https://github.com/ibireme/yyjson.git resolved at 0.12.0
2026-10-05T02:38:00.1409100Z Working copy of https://github.com/apple/swift-collections.git resolved at 1.6.0
2026-10-05T02:38:00.1731890Z Creating working copy for https://github.com/apple/swift-crypto.git
2026-10-05T02:38:00.1852360Z Creating working copy for https://github.com/huggingface/swift-huggingface.git
2026-10-05T02:38:00.2963110Z Working copy of https://github.com/huggingface/swift-transformers.git resolved at 1.3.3
2026-10-05T02:38:00.3271820Z Creating working copy for https://github.com/ml-explore/mlx-swift.git
2026-10-05T02:38:00.9306690Z Working copy of https://github.com/huggingface/swift-huggingface.git resolved at 0.9.0
2026-10-05T02:38:00.9698340Z Creating working copy for https://github.com/swiftlang/swift-cmark.git
2026-10-05T02:38:01.0724350Z Working copy of https://github.com/apple/swift-crypto.git resolved at 4.5.1
2026-10-05T02:38:01.1048130Z Creating working copy for https://github.com/apple/swift-argument-parser.git
2026-10-05T02:38:01.2445950Z Working copy of https://github.com/swiftlang/swift-cmark.git resolved at 0.8.0
2026-10-05T02:38:01.3154550Z Working copy of https://github.com/apple/swift-argument-parser.git resolved at 1.8.2
2026-10-05T02:38:10.4428680Z Working copy of https://github.com/ml-explore/mlx-swift.git resolved at ab924c82ead3b970caaa1c0ac11171de23f0305a
2026-10-05T02:38:25.7198130Z Building for production...
2026-10-05T02:38:31.6624200Z [0/250] Compiling cuda.cpp
2026-10-05T02:38:32.5700270Z [1/250] Compiling device.cpp
2026-10-05T02:38:32.8847510Z [2/250] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:38:32.8954020Z [3/250] Copying t5_tokenizer_config.json
2026-10-05T02:38:32.9054630Z [4/250] Copying gpt2_tokenizer_config.json
2026-10-05T02:38:32.9113890Z [4/250] Copying PrivacyInfo.xcprivacy
2026-10-05T02:38:33.0999320Z [6/250] Compiling cmark-gfm-extensions tasklist.c
2026-10-05T02:38:33.2811220Z [7/250] Compiling cmark-gfm-extensions tagfilter.c
2026-10-05T02:38:33.6974530Z [8/250] Compiling cmark-gfm-extensions table.c
2026-10-05T02:38:33.7818790Z [9/250] Compiling cmark-gfm-extensions strikethrough.c
2026-10-05T02:38:33.8987140Z [10/250] Compiling cmark-gfm-extensions ext_scanners.c
2026-10-05T02:38:34.0183370Z [11/250] Compiling cmark-gfm-extensions core-extensions.c
2026-10-05T02:38:35.1524270Z [12/250] Compiling cmark-gfm-extensions autolink.c
2026-10-05T02:38:35.2288550Z [13/250] Compiling cmark-gfm xml.c
2026-10-05T02:38:36.3911120Z [14/250] Compiling cmark-gfm utf8.c
2026-10-05T02:38:36.4868110Z [15/250] Compiling cmark-gfm syntax_extension.c
2026-10-05T02:38:37.4214870Z [16/250] Compiling cmark-gfm scanners.c
2026-10-05T02:38:37.5361710Z [17/250] Compiling cmark-gfm render.c
2026-10-05T02:38:37.5923630Z [18/250] Compiling cmark-gfm registry.c
2026-10-05T02:38:37.6709430Z [19/250] Compiling cmark-gfm references.c
2026-10-05T02:38:37.7407130Z [20/250] Compiling cmark-gfm plugin.c
2026-10-05T02:38:37.8300010Z [21/250] Compiling cmark-gfm plaintext.c
2026-10-05T02:38:38.0136550Z [22/250] Compiling cmark-gfm node.c
2026-10-05T02:38:38.0826390Z [23/250] Compiling cmark-gfm map.c
2026-10-05T02:38:38.1576510Z [24/250] Compiling cmark-gfm man.c
2026-10-05T02:38:38.2179630Z [25/250] Compiling cmark-gfm linked_list.c
2026-10-05T02:38:38.3522910Z [26/250] Compiling cmark-gfm latex.c
2026-10-05T02:38:38.4561970Z [27/250] Compiling cmark-gfm iterator.c
2026-10-05T02:38:39.0042240Z [28/250] Compiling cmark-gfm inlines.c
2026-10-05T02:38:39.1969510Z [29/250] Compiling cmark-gfm html.c
2026-10-05T02:38:39.3210920Z [30/250] Compiling cmark-gfm houdini_html_u.c
2026-10-05T02:38:39.3744600Z [31/250] Compiling cmark-gfm houdini_html_e.c
2026-10-05T02:38:39.4575070Z [32/250] Compiling cmark-gfm houdini_href_e.c
2026-10-05T02:38:39.5415970Z [33/250] Compiling cmark-gfm footnotes.c
2026-10-05T02:38:39.6592590Z [34/250] Compiling cmark-gfm commonmark.c
2026-10-05T02:38:39.7065470Z [35/250] Compiling cmark-gfm cmark_ctype.c
2026-10-05T02:38:39.7771070Z [36/250] Compiling cmark-gfm cmark.c
2026-10-05T02:38:39.8358350Z [37/250] Compiling yyjson.c
2026-10-05T02:38:39.8849690Z [38/250] Compiling cmark-gfm buffer.c
2026-10-05T02:38:39.9399660Z [39/250] Compiling cmark-gfm arena.c
2026-10-05T02:38:39.9661280Z [40/250] Compiling _NumericsShims _NumericsShims.c
2026-10-05T02:38:39.9688620Z [41/250] Write sources
2026-10-05T02:38:40.2190320Z [48/251] Compiling cmark-gfm blocks.c
2026-10-05T02:38:40.2204510Z [49/251] Write sources
2026-10-05T02:38:41.0966590Z [59/252] Compiling RealModule AlgebraicField.swift
2026-10-05T02:38:41.1003740Z [59/252] Write sources
2026-10-05T02:38:41.8803820Z [64/253] Compiling InternalCollectionsUtilities Debugging.swift
2026-10-05T02:38:45.4909100Z [65/254] Compiling Crypto AES-GCM.swift
2026-10-05T02:38:45.8732930Z [66/255] Compiling EventSource AsyncEventsSequence.swift
2026-10-05T02:38:45.8761610Z [66/255] Write sources
2026-10-05T02:38:50.9698620Z [68/256] Compiling OrderedCollections _HashTable+Bucket.swift
2026-10-05T02:38:51.8367390Z [69/257] Compiling ComplexModule Complex+AdditiveArithmetic.swift
2026-10-05T02:39:24.9901030Z [70/258] Compiling HuggingFace AccessRequest.swift
2026-10-05T02:39:25.3332960Z [71/259] Compiling Numerics Numerics.swift
2026-10-05T02:39:25.4260840Z [71/259] Compiling version.cpp
2026-10-05T02:39:25.9929910Z [73/259] Compiling Jinja AST.swift
2026-10-05T02:39:27.8321430Z [73/259] Compiling utils.cpp
2026-10-05T02:39:33.4069100Z [74/260] Compiling transforms.cpp
2026-10-05T02:39:35.9637560Z [75/260] Compiling stream.cpp
2026-10-05T02:39:38.5948410Z [76/260] Compiling scheduler.cpp
2026-10-05T02:39:45.2869650Z [77/260] Compiling random.cpp
2026-10-05T02:39:51.0790960Z [79/260] Compiling Hub BinaryDistinct.swift
2026-10-05T02:40:02.4620400Z [79/260] Compiling primitives.cpp
2026-10-05T02:40:12.5210760Z [80/261] Compiling ops.cpp
2026-10-05T02:40:18.1156350Z [82/261] Compiling Tokenizers BPETokenizer.swift
2026-10-05T02:40:18.1531370Z [82/261] Compiling linalg.cpp
2026-10-05T02:40:21.2728950Z [84/262] Compiling Generation Decoders.swift
2026-10-05T02:40:24.2633820Z [84/262] Compiling no_gguf.cpp
2026-10-05T02:40:25.8235050Z [85/263] Compiling safetensors.cpp
2026-10-05T02:40:28.2737630Z [87/263] Compiling Models LanguageModel.swift
2026-10-05T02:40:29.7821470Z [87/263] Compiling load.cpp
2026-10-05T02:40:30.8799600Z [88/263] Compiling graph_utils.cpp
2026-10-05T02:40:32.7592430Z [89/263] Compiling fft.cpp
2026-10-05T02:40:35.9248120Z [90/263] Compiling fast.cpp
2026-10-05T02:40:40.9308360Z [91/263] Compiling einsum.cpp
2026-10-05T02:40:42.0519600Z [92/263] Compiling dtype_utils.cpp
2026-10-05T02:40:42.9224420Z [93/263] Compiling dtype.cpp
2026-10-05T02:40:43.8589680Z [94/263] Compiling utils.cpp
2026-10-05T02:40:45.0786200Z [95/263] Compiling no_ring.cpp
2026-10-05T02:40:46.6119440Z [96/263] Compiling primitives.cpp
2026-10-05T02:40:50.1292170Z [97/263] Compiling ops.cpp
2026-10-05T02:40:51.0595110Z [98/263] Compiling export.cpp
2026-10-05T02:40:51.5384000Z [99/263] Compiling no_nccl.cpp
2026-10-05T02:40:52.3200590Z [100/263] Compiling no_mpi.cpp
2026-10-05T02:40:52.9511220Z [101/263] Compiling no_jaccl.cpp
2026-10-05T02:40:53.8758930Z [102/263] Compiling device.cpp
2026-10-05T02:40:54.2242380Z [103/263] Compiling distributed.cpp
2026-10-05T02:40:56.9762580Z [104/263] Compiling utils.cpp
2026-10-05T02:40:59.3020410Z [105/263] Compiling compile.cpp
2026-10-05T02:40:59.6460630Z [106/263] Compiling unary.cpp
2026-10-05T02:41:02.4176970Z [107/263] Compiling ternary.cpp
2026-10-05T02:41:03.0802450Z [108/263] Compiling sort.cpp
2026-10-05T02:41:04.8363200Z [109/263] Compiling softmax.cpp
2026-10-05T02:41:05.4951400Z [110/263] Compiling slicing.cpp
2026-10-05T02:41:07.1275570Z [111/263] Compiling scan.cpp
2026-10-05T02:41:09.2579710Z [112/263] Compiling scaled_dot_product_attention.cpp
2026-10-05T02:41:10.1829370Z [113/263] Compiling rope.cpp
2026-10-05T02:41:11.6056530Z [114/263] Compiling resident.cpp
2026-10-05T02:41:13.9431450Z [115/263] Compiling reduce.cpp
2026-10-05T02:41:18.6904890Z [116/263] Compiling quantized.cpp
2026-10-05T02:41:18.7075840Z [117/263] Compiling primitives.cpp
2026-10-05T02:41:21.6662250Z [118/263] Compiling metal.cpp
2026-10-05T02:41:22.6741760Z [119/263] Compiling normalization.cpp
2026-10-05T02:41:25.4418820Z [120/263] Compiling logsumexp.cpp
2026-10-05T02:41:27.9800630Z [121/263] Compiling matmul.cpp
2026-10-05T02:41:31.0148720Z [122/263] Compiling jit_kernels.cpp
2026-10-05T02:41:32.0002560Z [123/263] Compiling indexing.cpp
2026-10-05T02:41:34.0773890Z [124/263] Compiling hadamard.cpp
2026-10-05T02:41:36.1973320Z [125/263] Compiling fence.cpp
2026-10-05T02:41:38.0863330Z [126/263] Compiling event.cpp
2026-10-05T02:41:40.2606660Z [127/263] Compiling eval.cpp
2026-10-05T02:41:40.8003560Z [128/263] Compiling fft.cpp
2026-10-05T02:41:42.1767460Z [129/263] Compiling distributed.cpp
2026-10-05T02:41:42.5279530Z [130/263] Compiling device_info.cpp
2026-10-05T02:41:45.2332390Z [131/263] Compiling custom_kernel.cpp
2026-10-05T02:41:46.4520790Z [132/263] Compiling device.cpp
2026-10-05T02:41:47.7870420Z [133/263] Compiling copy.cpp
2026-10-05T02:41:50.8184440Z [134/263] Compiling compiled.cpp
2026-10-05T02:41:51.0702360Z [135/263] Compiling conv.cpp
2026-10-05T02:41:52.8281270Z [136/263] Compiling allocator.cpp
2026-10-05T02:41:53.1038140Z [137/263] Compiling binary.cpp
2026-10-05T02:41:53.8999230Z [138/263] Compiling slicing.cpp
2026-10-05T02:41:54.5630810Z [139/263] Compiling primitives.cpp
2026-10-05T02:41:55.3795650Z [140/263] Compiling copy.cpp
2026-10-05T02:41:55.4836600Z [141/263] Compiling no_cuda.cpp
2026-10-05T02:41:55.5908960Z [142/263] Compiling threefry.cpp
2026-10-05T02:41:59.3718140Z [143/263] Compiling svd.cpp
2026-10-05T02:42:06.1076810Z [144/263] Compiling unary.cpp
2026-10-05T02:42:08.4449050Z [145/263] Compiling softmax.cpp
2026-10-05T02:42:11.3257930Z [146/263] Compiling select.cpp
2026-10-05T02:42:13.7139840Z [147/263] Compiling sort.cpp
2026-10-05T02:42:21.7793510Z [148/263] Compiling scan.cpp
2026-10-05T02:42:25.3059680Z [149/263] Compiling reduce.cpp
2026-10-05T02:42:28.4146060Z [150/263] Compiling qrf.cpp
2026-10-05T02:42:29.6547020Z [151/263] Compiling quantized.cpp
2026-10-05T02:42:31.1808890Z [152/263] Compiling primitives.cpp
2026-10-05T02:42:33.5788400Z [153/263] Compiling matmul.cpp
2026-10-05T02:42:35.1970960Z [154/263] Compiling masked_mm.cpp
2026-10-05T02:42:36.1430800Z [155/263] Compiling luf.cpp
2026-10-05T02:42:37.2490430Z [156/263] Compiling logsumexp.cpp
2026-10-05T02:42:38.5212010Z [157/263] Compiling inverse.cpp
2026-10-05T02:42:40.1777680Z [158/263] Compiling hadamard.cpp
2026-10-05T02:42:42.0572890Z [159/263] Compiling cblas.cpp
2026-10-05T02:42:44.0315120Z [160/263] Compiling bnns.cpp
2026-10-05T02:42:50.5294630Z [161/263] Compiling fft.cpp
2026-10-05T02:42:52.1261060Z [162/263] Compiling eval.cpp
2026-10-05T02:42:53.3132140Z [163/263] Compiling encoder.cpp
2026-10-05T02:42:56.2767030Z [164/263] Compiling eigh.cpp
2026-10-05T02:42:59.2571480Z [165/263] Compiling eig.cpp
2026-10-05T02:43:00.8569100Z [166/263] Compiling distributed.cpp
2026-10-05T02:43:01.5362650Z [167/263] Compiling device_info.cpp
2026-10-05T02:43:28.3512900Z [168/263] Compiling indexing.cpp
2026-10-05T02:43:31.0154820Z [169/263] Compiling copy.cpp
2026-10-05T02:43:34.4951570Z [170/263] Compiling cholesky.cpp
2026-10-05T02:43:37.4672200Z [171/263] Compiling conv.cpp
2026-10-05T02:43:40.9140990Z [172/263] Compiling arg_reduce.cpp
2026-10-05T02:43:42.6357210Z [173/263] Compiling utils.cpp
2026-10-05T02:43:44.4566810Z [174/263] Compiling slicing.cpp
2026-10-05T02:43:46.1641900Z [175/263] Compiling reduce.cpp
2026-10-05T02:43:48.4372950Z [176/263] Compiling metal_kernel.cpp
2026-10-05T02:43:49.9218180Z [177/263] Compiling load.cpp
2026-10-05T02:43:51.6160080Z [178/263] Compiling compiled.cpp
2026-10-05T02:43:53.4149680Z [179/263] Compiling common.cpp
2026-10-05T02:43:54.9677030Z [180/263] Compiling broadcasting.cpp
2026-10-05T02:43:57.9618330Z [181/263] Compiling array.cpp
2026-10-05T02:43:57.9968490Z [182/263] Compiling utils.cpp
2026-10-05T02:43:58.0314640Z [183/263] Compiling unary_ops.cpp
2026-10-05T02:43:58.0635810Z [184/263] Compiling unary.cpp
2026-10-05T02:43:58.0899680Z [185/263] Compiling ternary_ops.cpp
2026-10-05T02:43:58.1238140Z [186/263] Compiling ternary.cpp
2026-10-05T02:43:58.1572340Z [187/263] Compiling steel_gemm_splitk_nax.cpp
2026-10-05T02:43:58.2027290Z [188/263] Compiling steel_gemm_splitk.cpp
2026-10-05T02:43:58.2549470Z [189/263] Compiling steel_gemm_segmented_nax.cpp
2026-10-05T02:43:58.2846320Z [190/263] Compiling steel_gemm_segmented.cpp
2026-10-05T02:43:58.3260810Z [191/263] Compiling steel_gemm_masked.cpp
2026-10-05T02:43:58.3692110Z [192/263] Compiling steel_gemm_gather_nax.cpp
2026-10-05T02:43:58.4060520Z [193/263] Compiling steel_gemm_gather.cpp
2026-10-05T02:43:58.4451660Z [194/263] Compiling steel_gemm_fused_nax.cpp
2026-10-05T02:43:58.4743840Z [195/263] Compiling steel_gemm_fused.cpp
2026-10-05T02:43:58.5196260Z [196/263] Compiling steel_conv_general.cpp
2026-10-05T02:43:58.5586680Z [197/263] Compiling steel_conv_3d.cpp
2026-10-05T02:43:58.5967760Z [198/263] Compiling steel_conv.cpp
2026-10-05T02:43:58.6304290Z [199/263] Compiling steel_attention_nax.cpp
2026-10-05T02:43:58.6710680Z [200/263] Compiling steel_attention.cpp
2026-10-05T02:43:58.7021760Z [201/263] Compiling sort.cpp
2026-10-05T02:43:58.7364340Z [202/263] Compiling softmax.cpp
2026-10-05T02:43:58.7699830Z [203/263] Compiling searchsorted.cpp
2026-10-05T02:43:58.7979570Z [204/263] Compiling scatter_axis.cpp
2026-10-05T02:43:58.8229720Z [205/263] Compiling scatter.cpp
2026-10-05T02:43:58.8563770Z [206/263] Compiling scan.cpp
2026-10-05T02:43:58.8852370Z [207/263] Compiling reduce_utils.cpp
2026-10-05T02:43:58.9074850Z [208/263] Compiling reduce.cpp
2026-10-05T02:43:58.9352130Z [209/263] Compiling quantized_utils.cpp
2026-10-05T02:43:58.9655790Z [210/263] Compiling quantized_nax.cpp
2026-10-05T02:43:58.9957400Z [211/263] Compiling quantized.cpp
2026-10-05T02:43:59.0254230Z [212/263] Compiling masked_scatter.cpp
2026-10-05T02:43:59.0559870Z [213/263] Compiling logsumexp.cpp
2026-10-05T02:43:59.0897470Z [214/263] Compiling hadamard.cpp
2026-10-05T02:43:59.1252350Z [215/263] Compiling gemv_masked.cpp
2026-10-05T02:43:59.1548260Z [216/263] Compiling gemv.cpp
2026-10-05T02:43:59.1829900Z [217/263] Compiling gemm_nax.cpp
2026-10-05T02:43:59.2064420Z [218/263] Compiling gemm.cpp
2026-10-05T02:43:59.2292490Z [219/263] Compiling gather_front.cpp
2026-10-05T02:43:59.2519980Z [220/263] Compiling gather_axis.cpp
2026-10-05T02:43:59.2833920Z [221/263] Compiling gather.cpp
2026-10-05T02:43:59.3066560Z [222/263] Compiling fp_quantized_nax.cpp
2026-10-05T02:43:59.3328370Z [223/263] Compiling fp_quantized.cpp
2026-10-05T02:43:59.3594770Z [224/263] Compiling fft.cpp
2026-10-05T02:43:59.3881520Z [225/263] Compiling copy.cpp
2026-10-05T02:43:59.4197570Z [226/263] Compiling conv.cpp
2026-10-05T02:43:59.4466970Z [227/263] Compiling compiled_preamble.cpp
2026-10-05T02:43:59.4679620Z [228/263] Compiling binary_two.cpp
2026-10-05T02:43:59.4950080Z [229/263] Compiling binary_ops.cpp
2026-10-05T02:43:59.5206610Z [230/263] Compiling binary.cpp
2026-10-05T02:43:59.5445250Z [231/263] Compiling arange.cpp
2026-10-05T02:44:01.3109920Z [232/263] Compiling jit_compiler_conditional.cpp
2026-10-05T02:44:03.6404870Z [233/263] Compiling compiled_conditional.cpp
2026-10-05T02:44:05.1020910Z [234/263] Compiling version.cpp
2026-10-05T02:44:07.5812060Z [235/263] Compiling vector.cpp
2026-10-05T02:44:09.1845610Z [236/263] Compiling transforms_impl.cpp
2026-10-05T02:44:10.9270520Z [237/263] Compiling transforms.cpp
2026-10-05T02:44:12.2886690Z [238/263] Compiling string.cpp
2026-10-05T02:44:13.6911790Z [239/263] Compiling stream.cpp
2026-10-05T02:44:15.4246590Z [240/263] Compiling random.cpp
2026-10-05T02:44:20.4298680Z [241/263] Compiling ops.cpp
2026-10-05T02:44:22.5481470Z [242/263] Compiling metal.cpp
2026-10-05T02:44:24.3546360Z [243/263] Compiling memory.cpp
2026-10-05T02:44:27.0030000Z [244/263] Compiling map.cpp
2026-10-05T02:44:28.8765000Z [245/263] Compiling linalg.cpp
2026-10-05T02:44:31.5744490Z [246/263] Compiling io_types.cpp
2026-10-05T02:44:34.2017390Z [247/263] Compiling io.cpp
2026-10-05T02:44:37.0164120Z [248/263] Compiling graph_utils.cpp
2026-10-05T02:44:40.2204960Z [249/263] Compiling fft.cpp
2026-10-05T02:44:43.4986490Z [250/263] Compiling fast.cpp
2026-10-05T02:44:44.5640240Z [251/263] Compiling binary.cpp
2026-10-05T02:44:45.2339290Z [252/263] Compiling error.cpp
2026-10-05T02:44:45.7326080Z [253/263] Compiling export.cpp
2026-10-05T02:44:46.6921240Z [254/263] Compiling compile.cpp
2026-10-05T02:44:47.7656460Z [255/263] Compiling closure.cpp
2026-10-05T02:44:49.8410830Z [256/263] Compiling Cmlx.m
2026-10-05T02:44:50.1140480Z [257/263] Compiling array.cpp
2026-10-05T02:44:50.4799400Z [258/263] Compiling CSlotpack slotpack.c
2026-10-05T02:44:50.5386450Z [259/263] Compiling CAtomic CAtomic.c
2026-10-05T02:44:52.4689470Z [260/264] Compiling format.cc
2026-10-05T02:45:09.2025550Z [262/265] Compiling Markdown ChildIndexPath.swift
2026-10-05T02:45:15.9792400Z [263/266] Compiling MLX ArrayAt.swift
2026-10-05T02:45:19.8312290Z [264/267] Compiling SevraPresentation ComposerSession.swift
2026-10-05T02:45:20.1015350Z [265/268] Compiling MLXFast MLXFast.swift
2026-10-05T02:45:24.4222810Z [266/268] Compiling MLXNN Activations.swift
2026-10-05T02:48:27.3199310Z [267/269] Compiling Slotstream AdaptiveSpeculation.swift
2026-10-05T02:48:27.3201380Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:48:27.3202230Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:48:27.3202780Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:48:27.3203240Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:48:27.3204710Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:48:27.3205440Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:48:27.3206100Z 109 |                     }
2026-10-05T02:48:27.3206730Z 
2026-10-05T02:48:27.3207580Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:48:27.3208590Z 34 |         lock.lock()
2026-10-05T02:48:27.3209100Z 35 |         defer { lock.unlock() }
2026-10-05T02:48:27.3211360Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:48:27.3213780Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:48:27.3215600Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:48:27.3217290Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:49:08.0378040Z [268/270] Compiling SevraRuntime Changes.swift
2026-10-05T02:49:40.1984730Z [269/271] Compiling SevraMac AppModel.swift
2026-10-05T02:49:40.2143110Z [269/271] Write Objects.LinkFileList
2026-10-05T02:49:51.7488080Z [270/271] Linking Sevra
2026-10-05T02:49:51.7784210Z Build of product 'Sevra' complete! (722.99s)
2026-10-05T02:50:03.5985320Z [0/1] Planning build
2026-10-05T02:50:03.6473080Z Building for production...
2026-10-05T02:50:03.6767460Z [0/5] Write sources
2026-10-05T02:50:04.4499590Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:50:06.3790310Z [3/5] Compiling SevraLocal main.swift
2026-10-05T02:50:06.3885440Z [3/5] Write Objects.LinkFileList
2026-10-05T02:50:14.9882320Z [4/5] Linking sevra-local
2026-10-05T02:50:14.9952170Z Build of product 'sevra-local' complete! (14.70s)
2026-10-05T02:50:15.8658600Z Building for production...
2026-10-05T02:50:16.6273660Z [0/5] Write sources
2026-10-05T02:50:17.9291540Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:50:25.7908050Z [3/5] Compiling SevraComposerChecks ComposerChecks.swift
2026-10-05T02:50:25.7972410Z [3/5] Write Objects.LinkFileList
2026-10-05T02:50:36.8388320Z [4/5] Linking sevra-composer-checks
2026-10-05T02:50:36.8452660Z Build of product 'sevra-composer-checks' complete! (21.08s)
2026-10-05T02:50:37.7899390Z Building for production...
2026-10-05T02:50:38.5664920Z [0/4] Write sources
2026-10-05T02:50:38.8193110Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:50:42.0707490Z [3/5] Compiling SevraPresentationChecks MarkdownDocumentTests.swift
2026-10-05T02:50:42.0793210Z [3/5] Write Objects.LinkFileList
2026-10-05T02:50:43.0945020Z [4/5] Linking sevra-presentation-checks
2026-10-05T02:50:43.0998060Z Build of product 'sevra-presentation-checks' complete! (5.39s)
2026-10-05T02:50:43.9527990Z Building for production...
2026-10-05T02:50:44.9101350Z [0/4] Write sources
2026-10-05T02:50:45.9672760Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:51:46.3843700Z [3/5] Compiling SevraMacChecks AdverseChecks.swift
2026-10-05T02:51:46.4105680Z [3/5] Write Objects.LinkFileList
2026-10-05T02:51:58.7338970Z [4/5] Linking sevra-mac-checks
2026-10-05T02:51:58.7414940Z Build of product 'sevra-mac-checks' complete! (74.89s)
2026-10-05T02:51:59.6816130Z Building for production...
2026-10-05T02:52:00.4449930Z [0/5] Write sources
2026-10-05T02:52:00.6482800Z [1/5] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:52:01.3670720Z [2/5] Compiling CSevraSandbox sevra_sandbox.c
2026-10-05T02:52:09.9409280Z [4/6] Compiling SevraExtract main.swift
2026-10-05T02:52:09.9487350Z [4/6] Write Objects.LinkFileList
2026-10-05T02:52:10.6026660Z [5/6] Linking sevra-extract
2026-10-05T02:52:10.6080540Z Build of product 'sevra-extract' complete! (11.05s)
2026-10-05T02:52:16.2498340Z PASS: External adoption refreshes clean drafts and preserves competing unsaved text
2026-10-05T02:52:16.2500980Z PASS: Continue in thread saves Home before creation and rejects overlapping clicks
2026-10-05T02:52:16.2502370Z PASS: Continue in thread cannot create a destination when saving Home fails
2026-10-05T02:52:16.2503610Z PASS: old stale-snapshot sequence reproduces a rejected draft
2026-10-05T02:52:16.2504790Z PASS: back-to-back saves use acknowledged revisions without any display refresh
2026-10-05T02:52:16.2508380Z PASS: overlapping save callers coalesce edits and never write concurrently
2026-10-05T02:52:16.2510310Z PASS: undo to the previous saved text during an in-flight write persists the undo
2026-10-05T02:52:16.2511880Z PASS: debounce saves only the newest edit and cancels pending work after Send
2026-10-05T02:52:16.2513240Z PASS: typing that never pauses still saves about once per wait, never back to back
2026-10-05T02:52:16.2514610Z PASS: Send before autosave atomically accepts the prompt and clears the older draft
2026-10-05T02:52:16.2516070Z PASS: Send waits for an in-flight save and preserves typing before acceptance
2026-10-05T02:52:16.2517140Z PASS: typing during acceptance survives the cleared draft receipt
2026-10-05T02:52:16.2518190Z PASS: edit-away-and-back while sending counts as a new draft
2026-10-05T02:52:16.2519410Z PASS: failed save keeps text, blocks navigation/close and clears only after recovery
2026-10-05T02:52:16.2520580Z PASS: lost save acknowledgement reconciles exact persisted text
2026-10-05T02:52:16.2540210Z PASS: failed Send and lost acceptance receipt reuse nonce without duplicating messages
2026-10-05T02:52:16.2541530Z PASS: an idempotent Send retry never erases a subsequently changed saved draft
2026-10-05T02:52:16.2542160Z PASS: revision-only conflicts recover silently and retry storms are bounded
2026-10-05T02:52:16.2542660Z PASS: real competing edits preserve both versions and require an explicit choice
2026-10-05T02:52:16.2543160Z PASS: another change during conflict resolution is not overwritten
2026-10-05T02:52:16.2565340Z PASS: navigation saves typing during destination loading and keeps drafts in their own threads
2026-10-05T02:52:16.2566040Z PASS: failed destination read leaves the current composer intact
2026-10-05T02:52:16.2566570Z PASS: close drains the in-flight writer before reporting safe to close
2026-10-05T02:52:16.2567040Z PASS: quit freezes edits during shutdown and restores editing when shutdown fails
2026-10-05T02:52:16.2567640Z PASS: mixed typing, clearing, Unicode, thread changes and sending retain exact drafts
2026-10-05T02:52:16.2568130Z PASS: discarding Incognito drains pending saves before changing owner
2026-10-05T02:52:16.2637920Z PASS: real dbmd persistence, atomic Send, stale-save refusal, external-edit/no-op refusal, exact reopen and Incognito exclusion
2026-10-05T02:52:16.2640290Z PASS: production journal coordinator, double Save, lost acceptance retry and exact entry/draft restart
2026-10-05T02:52:16.2640870Z PASS: 26 composer scenarios plus real-runtime persistence checks
2026-10-05T02:52:16.5258900Z PRESENTATION_RENDER_MS 31.749,0.561,0.459,0.462,0.471,0.481,0.509,0.460,0.503,0.480,0.557,0.495,0.498,0.443,0.460,0.451,0.455,0.429,0.444,0.434
2026-10-05T02:52:16.5263530Z PASS: native Markdown structure, exact code, table attributes, inert HTML/images, link/citation boundaries, Unicode source coordinates, late references, cache reuse, limits, message annotations and streaming replacement bounds
2026-10-05T02:52:29.2380890Z PASS: first opening of a long conversation starts at latest without an extra control
2026-10-05T02:52:29.2450180Z PASS: new text follows while already at the end
2026-10-05T02:52:29.2530930Z PASS: streaming preserves the reader's position and offers Latest
2026-10-05T02:52:29.2534470Z PASS: explicit Latest clears selection and resumes following
2026-10-05T02:52:29.2538130Z PASS: later text keeps following after Latest
2026-10-05T02:52:29.2540890Z PASS: selecting text prevents streaming from moving the document
2026-10-05T02:52:29.2544810Z PASS: window resizing preserves following at latest
2026-10-05T02:52:29.2547180Z PASS: text-size reflow keeps a reader at latest
2026-10-05T02:52:29.2548370Z PASS: an earlier page opens at its beginning
2026-10-05T02:52:29.2549360Z PASS: earlier-page Latest is consumed only after destination layout
2026-10-05T02:52:29.2550710Z PASS: short conversations need no jump control
2026-10-05T02:52:29.2551830Z PASS: returning to a thread restores its reading position
2026-10-05T02:52:29.2552890Z PASS: a long page opens at its latest text
2026-10-05T02:52:29.2554330Z PASS: the middle of a long page is laid out without the text above it
2026-10-05T02:52:29.2559360Z PASS: a reader's line holds while the rest of a long page is laid out
2026-10-05T02:52:29.2560170Z PASS: a reader stays on their line when the window narrows
2026-10-05T02:52:29.2562490Z PASS: production native transcript scroll lifecycle
2026-10-05T02:52:38.0896100Z Building for debugging...
2026-10-05T02:52:38.2796180Z [0/252] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:52:38.2802120Z [1/252] Copying t5_tokenizer_config.json
2026-10-05T02:52:38.2802620Z [1/252] Copying gpt2_tokenizer_config.json
2026-10-05T02:52:38.2802980Z [2/252] Copying PrivacyInfo.xcprivacy
2026-10-05T02:52:38.5016410Z [4/252] Compiling cmark-gfm-extensions tasklist.c
2026-10-05T02:52:38.5492280Z [5/252] Compiling cmark-gfm-extensions tagfilter.c
2026-10-05T02:52:38.6180070Z [6/252] Compiling cmark-gfm-extensions table.c
2026-10-05T02:52:38.6695930Z [7/252] Compiling cmark-gfm-extensions strikethrough.c
2026-10-05T02:52:38.7433030Z [8/252] Compiling cmark-gfm-extensions ext_scanners.c
2026-10-05T02:52:38.8150720Z [9/252] Compiling cmark-gfm-extensions core-extensions.c
2026-10-05T02:52:39.4690080Z [10/252] Compiling cmark-gfm-extensions autolink.c
2026-10-05T02:52:39.5386810Z [11/252] Compiling cmark-gfm xml.c
2026-10-05T02:52:39.6660550Z [12/252] Compiling cmark-gfm utf8.c
2026-10-05T02:52:39.7138750Z [13/252] Compiling cmark-gfm syntax_extension.c
2026-10-05T02:52:39.7641420Z [14/252] Compiling yyjson.c
2026-10-05T02:52:39.8214150Z [15/252] Compiling cmark-gfm render.c
2026-10-05T02:52:39.8827970Z [16/252] Compiling cmark-gfm registry.c
2026-10-05T02:52:39.9232850Z [17/252] Compiling cmark-gfm scanners.c
2026-10-05T02:52:39.9346940Z [18/252] Compiling cmark-gfm references.c
2026-10-05T02:52:39.9909820Z [19/252] Compiling cmark-gfm plugin.c
2026-10-05T02:52:40.0144030Z [20/252] Compiling cmark-gfm plaintext.c
2026-10-05T02:52:40.0741890Z [21/252] Compiling cmark-gfm map.c
2026-10-05T02:52:40.0761230Z [22/252] Compiling cmark-gfm node.c
2026-10-05T02:52:40.1130710Z [23/252] Compiling cmark-gfm linked_list.c
2026-10-05T02:52:40.1207390Z [24/252] Compiling cmark-gfm man.c
2026-10-05T02:52:40.1803040Z [25/252] Compiling cmark-gfm latex.c
2026-10-05T02:52:40.1822760Z [26/252] Compiling cmark-gfm iterator.c
2026-10-05T02:52:40.2429210Z [27/252] Compiling cmark-gfm html.c
2026-10-05T02:52:40.2792570Z [28/252] Compiling cmark-gfm inlines.c
2026-10-05T02:52:40.3076990Z [29/252] Compiling cmark-gfm houdini_html_u.c
2026-10-05T02:52:40.3208450Z [30/252] Compiling cmark-gfm houdini_html_e.c
2026-10-05T02:52:40.3647260Z [31/252] Compiling cmark-gfm houdini_href_e.c
2026-10-05T02:52:40.3890570Z [32/252] Compiling cmark-gfm footnotes.c
2026-10-05T02:52:40.4379550Z [33/252] Compiling cmark-gfm commonmark.c
2026-10-05T02:52:40.4498440Z [34/252] Compiling cmark-gfm cmark_ctype.c
2026-10-05T02:52:40.4912410Z [35/252] Compiling cmark-gfm cmark.c
2026-10-05T02:52:40.5134510Z [36/252] Compiling cmark-gfm buffer.c
2026-10-05T02:52:40.5770660Z [37/252] Compiling cmark-gfm arena.c
2026-10-05T02:52:40.6060960Z [38/252] Compiling _NumericsShims _NumericsShims.c
2026-10-05T02:52:40.6061670Z [39/252] Write sources
2026-10-05T02:52:40.6064790Z [39/252] Compiling cmark-gfm blocks.c
2026-10-05T02:52:40.6067500Z [40/252] Write sources
2026-10-05T02:52:40.6082130Z [47/252] Write Sevra-entitlement.plist
2026-10-05T02:52:40.6084360Z [48/252] Write sources
2026-10-05T02:52:41.9159250Z [58/270] Emitting module RealModule
2026-10-05T02:52:41.9263900Z [59/270] Compiling InternalCollectionsUtilities Debugging.swift
2026-10-05T02:52:41.9330640Z [60/270] Compiling InternalCollectionsUtilities Descriptions.swift
2026-10-05T02:52:41.9437150Z [61/270] Compiling InternalCollectionsUtilities FixedWidthInteger+roundUpToPowerOfTwo.swift
2026-10-05T02:52:41.9543200Z [62/270] Compiling InternalCollectionsUtilities Integer rank.swift
2026-10-05T02:52:41.9661950Z [63/270] Compiling InternalCollectionsUtilities UInt+first and last set bit.swift
2026-10-05T02:52:41.9773530Z [64/270] Compiling InternalCollectionsUtilities UInt+reversed.swift
2026-10-05T02:52:41.9850890Z [65/275] Emitting module InternalCollectionsUtilities
2026-10-05T02:52:41.9892080Z [72/275] Compiling RealModule Float16+Real.swift
2026-10-05T02:52:41.9903700Z [73/275] Compiling RealModule Float80+Real.swift
2026-10-05T02:52:42.0005990Z [74/275] Compiling RealModule Real.swift
2026-10-05T02:52:42.0052390Z [75/275] Compiling RealModule RealFunctions.swift
2026-10-05T02:52:42.1186370Z [80/284] Compiling InternalCollectionsUtilities _UnsafeBitSet+Index.swift
2026-10-05T02:52:42.1293130Z [80/284] Write sources
2026-10-05T02:52:42.8906490Z [86/287] Compiling InternalCollectionsUtilities _UnsafeBitSet+_Word.swift
2026-10-05T02:52:42.9042750Z [87/287] Compiling InternalCollectionsUtilities _UnsafeBitSet.swift
2026-10-05T02:52:42.9151670Z [88/287] Compiling InternalCollectionsUtilities UnsafeBufferPointer+Extras.swift
2026-10-05T02:52:42.9300290Z [89/287] Compiling InternalCollectionsUtilities UnsafeMutableBufferPointer+Extras.swift
2026-10-05T02:52:42.9419900Z [90/287] Compiling InternalCollectionsUtilities UnsafeMutableRawBufferPointer+Extras.swift
2026-10-05T02:52:42.9544020Z [91/287] Compiling InternalCollectionsUtilities UnsafeRawBufferPointer+Extras.swift
2026-10-05T02:52:42.9704980Z [92/287] Compiling InternalCollectionsUtilities _SortedCollection.swift
2026-10-05T02:52:42.9819170Z [93/287] Compiling InternalCollectionsUtilities _UniqueCollection.swift
2026-10-05T02:52:46.5686670Z [94/312] Compiling Crypto AES-GCM.swift
2026-10-05T02:52:46.5692550Z [95/312] Compiling Crypto AES-GCM_boring.swift
2026-10-05T02:52:46.5693180Z [96/312] Emitting module EventSource
2026-10-05T02:52:48.1426060Z [97/314] Compiling EventSource EventSource+AsyncHTTPClient.swift
2026-10-05T02:52:48.1427930Z [98/314] Compiling EventSource EventSource.swift
2026-10-05T02:52:48.1702750Z [103/314] Compiling Crypto Cipher.swift
2026-10-05T02:52:48.1823380Z [104/314] Compiling Crypto Nonces.swift
2026-10-05T02:52:48.1854800Z [105/314] Compiling Crypto ASN1.swift
2026-10-05T02:52:48.1967750Z [106/314] Compiling Crypto ASN1Any.swift
2026-10-05T02:52:48.2092030Z [107/314] Compiling Crypto ASN1BitString.swift
2026-10-05T02:52:48.2202560Z [108/314] Compiling Crypto ASN1Boolean.swift
2026-10-05T02:52:48.2232550Z [109/314] Compiling Crypto ASN1Identifier.swift
2026-10-05T02:52:48.2233200Z [110/314] Compiling Crypto ASN1Integer.swift
2026-10-05T02:52:48.2282720Z [111/314] Compiling Crypto ASN1Null.swift
2026-10-05T02:52:48.2285290Z [112/314] Compiling Crypto ASN1OctetString.swift
2026-10-05T02:52:48.2392950Z [113/314] Compiling Crypto ASN1Strings.swift
2026-10-05T02:52:48.2514490Z [114/314] Compiling Crypto ArraySliceBigint.swift
2026-10-05T02:52:48.2618350Z [115/314] Compiling Crypto GeneralizedTime.swift
2026-10-05T02:52:48.2736810Z [116/314] Compiling Crypto ObjectIdentifier.swift
2026-10-05T02:52:48.2857620Z [117/314] Compiling Crypto ECDSASignature.swift
2026-10-05T02:52:48.3016780Z [118/314] Compiling Crypto PEMDocument.swift
2026-10-05T02:52:48.3119420Z [119/314] Compiling Crypto PKCS8PrivateKey.swift
2026-10-05T02:52:48.3221090Z [120/314] Compiling Crypto SEC1PrivateKey.swift
2026-10-05T02:52:48.3324810Z [121/314] Compiling Crypto SubjectPublicKeyInfo.swift
2026-10-05T02:52:48.3402570Z [122/314] Compiling Crypto CryptoError_boring.swift
2026-10-05T02:52:48.3516750Z [123/314] Emitting module Crypto
2026-10-05T02:52:48.5027010Z [124/384] Compiling Crypto Insecure_HashFunctions.swift
2026-10-05T02:52:48.5145210Z [125/384] Compiling Crypto MLKEM_boring.swift
2026-10-05T02:52:48.5263960Z [126/384] Compiling Crypto MLKEM_wrapper.swift
2026-10-05T02:52:48.5383970Z [127/384] Compiling Crypto XWing_boring.swift
2026-10-05T02:52:48.5486470Z [128/384] Compiling Crypto KEM-Errors.swift
2026-10-05T02:52:48.5594620Z [129/384] Compiling Crypto KEM.swift
2026-10-05T02:52:48.5695830Z [130/384] Compiling Crypto MLKEM.swift
2026-10-05T02:52:48.5806800Z [131/384] Compiling Crypto XWing.swift
2026-10-05T02:52:48.5916350Z [132/384] Compiling Crypto ECDH_boring.swift
2026-10-05T02:52:48.6018080Z [133/384] Compiling Crypto DH.swift
2026-10-05T02:52:48.6119940Z [134/384] Compiling Crypto ECDH.swift
2026-10-05T02:52:48.6220220Z [135/384] Compiling Crypto ANSIx963.swift
2026-10-05T02:52:48.6342870Z [136/384] Compiling Crypto HKDF.swift
2026-10-05T02:52:48.6464210Z [137/384] Compiling Crypto AESWrap.swift
2026-10-05T02:52:48.6566360Z [138/384] Compiling Crypto AESWrap_boring.swift
2026-10-05T02:52:48.6667610Z [139/384] Compiling Crypto Ed25519_boring.swift
2026-10-05T02:52:48.6723230Z [140/384] Compiling Crypto NISTCurvesKeys_boring.swift
2026-10-05T02:52:48.6723790Z [141/384] Compiling Crypto X25519Keys_boring.swift
2026-10-05T02:52:48.6724260Z [142/384] Compiling Crypto Curve25519.swift
2026-10-05T02:52:48.6724700Z [143/384] Compiling Crypto Ed25519Keys.swift
2026-10-05T02:52:48.6725090Z [144/384] Compiling Crypto NISTCurvesKeys.swift
2026-10-05T02:52:48.6725540Z [145/384] Compiling Crypto X25519Keys.swift
2026-10-05T02:52:48.6726700Z [146/384] Compiling Crypto SymmetricKeys.swift
2026-10-05T02:52:48.6727260Z [147/384] Compiling Crypto HMAC.swift
2026-10-05T02:52:48.6727720Z [148/407] Compiling Crypto CryptoKitErrors.swift
2026-10-05T02:52:48.6728230Z [149/407] Compiling Crypto Digest_boring.swift
2026-10-05T02:52:48.6728600Z [150/407] Compiling Crypto Digest.swift
2026-10-05T02:52:48.6729010Z [151/407] Compiling Crypto Digests.swift
2026-10-05T02:52:48.6729450Z [152/407] Compiling Crypto HashFunctions.swift
2026-10-05T02:52:48.6729850Z [153/407] Compiling Crypto HashFunctions_SHA2.swift
2026-10-05T02:52:48.6730320Z [154/407] Compiling Crypto HashFunctions_SHA3.swift
2026-10-05T02:52:48.6730700Z [155/407] Compiling Crypto Digest_xkcp.swift
2026-10-05T02:52:48.6731150Z [156/407] Compiling Crypto HPKE-AEAD.swift
2026-10-05T02:52:48.6731540Z [157/407] Compiling Crypto HPKE-Ciphersuite.swift
2026-10-05T02:52:48.6731980Z [158/407] Compiling Crypto HPKE-KDF.swift
2026-10-05T02:52:48.6732450Z [159/407] Compiling Crypto HPKE-KexKeyDerivation.swift
2026-10-05T02:52:48.6732930Z [160/407] Compiling Crypto HPKE-LabeledExtract.swift
2026-10-05T02:52:48.6733430Z [161/407] Compiling Crypto HPKE-Utils.swift
2026-10-05T02:52:48.6733790Z [162/407] Compiling Crypto DHKEM.swift
2026-10-05T02:52:48.6734230Z [163/407] Compiling Crypto HPKE-KEM-Curve25519.swift
2026-10-05T02:52:48.6735850Z [164/407] Compiling Crypto HPKE-NIST-EC-KEMs.swift
2026-10-05T02:52:48.6736350Z [165/407] Compiling Crypto HPKE-KEM.swift
2026-10-05T02:52:48.6736780Z [166/407] Compiling Crypto HPKE-Errors.swift
2026-10-05T02:52:48.6737140Z [167/407] Compiling Crypto HPKE.swift
2026-10-05T02:52:48.6737570Z [168/407] Compiling Crypto HPKE-Context.swift
2026-10-05T02:52:48.6737940Z [169/407] Compiling Crypto HPKE-KeySchedule.swift
2026-10-05T02:52:48.6738390Z [170/407] Compiling Crypto HPKE-Modes.swift
2026-10-05T02:52:48.6869570Z [171/407] Compiling Crypto Insecure.swift
2026-10-05T02:52:49.1338740Z [172/407] Compiling Crypto MACFunctions.swift
2026-10-05T02:52:49.1430550Z [173/407] Compiling Crypto MessageAuthenticationCode.swift
2026-10-05T02:52:49.1431520Z [174/407] Compiling Crypto AES.swift
2026-10-05T02:52:49.1431920Z [175/407] Compiling Crypto ECDSASignature_boring.swift
2026-10-05T02:52:49.1432410Z [176/407] Compiling Crypto ECDSA_boring.swift
2026-10-05T02:52:49.1432860Z [177/407] Compiling Crypto EdDSA_boring.swift
2026-10-05T02:52:49.1433240Z [178/407] Compiling Crypto MLDSA_boring.swift
2026-10-05T02:52:49.1433700Z [179/407] Compiling Crypto MLDSA_wrapper.swift
2026-10-05T02:52:49.1434140Z [180/407] Compiling Crypto ECDSA.swift
2026-10-05T02:52:49.1472570Z [181/407] Compiling Crypto Ed25519.swift
2026-10-05T02:52:49.1473070Z [182/407] Compiling Crypto MLDSA.swift
2026-10-05T02:52:49.1475790Z [183/407] Compiling Crypto Signature.swift
2026-10-05T02:52:49.1487440Z [184/407] Compiling Crypto CryptoKitErrors_boring.swift
2026-10-05T02:52:49.1488150Z [185/407] Compiling Crypto Optional+withUnsafeBytes_boring.swift
2026-10-05T02:52:49.1488590Z [186/407] Compiling Crypto RNG_boring.swift
2026-10-05T02:52:49.1489070Z [187/407] Compiling Crypto SafeCompare_boring.swift
2026-10-05T02:52:49.1492360Z [188/407] Compiling Crypto Zeroization_boring.swift
2026-10-05T02:52:49.1493860Z [189/407] Compiling Crypto _CryptoModuleAnchor.swift
2026-10-05T02:52:49.1494760Z [190/407] Compiling Crypto PrettyBytes.swift
2026-10-05T02:52:49.1495210Z [191/407] Compiling Crypto SafeCompare.swift
2026-10-05T02:52:49.1495640Z [192/407] Compiling Crypto SecureBytes.swift
2026-10-05T02:52:49.1496020Z [193/407] Compiling Crypto Zeroization.swift
2026-10-05T02:52:49.1496470Z [194/407] Compiling Crypto resource_bundle_accessor.swift
2026-10-05T02:52:49.1597880Z [194/407] Write sources
2026-10-05T02:52:49.1887960Z [195/407] Compiling version.cpp
2026-10-05T02:52:49.7830780Z [197/426] Emitting module OrderedCollections
2026-10-05T02:52:49.7831770Z [198/426] Compiling HuggingFace AccessRequest.swift
2026-10-05T02:52:49.7832950Z [199/426] Compiling HuggingFace Billing.swift
2026-10-05T02:52:49.7834380Z [200/426] Compiling HuggingFace Collection.swift
2026-10-05T02:52:49.7836090Z [201/426] Compiling HuggingFace CommaSeparatedList.swift
2026-10-05T02:52:49.7836610Z [202/426] Compiling HuggingFace Dataset.swift
2026-10-05T02:52:49.7836930Z [203/426] Compiling HuggingFace Discussion.swift
2026-10-05T02:52:49.7837290Z [204/426] Compiling HuggingFace File.swift
2026-10-05T02:52:49.7837670Z [205/426] Compiling HuggingFace Git.swift
2026-10-05T02:52:49.7838000Z [206/426] Compiling HuggingFace HubCache.swift
2026-10-05T02:52:49.7838380Z [207/426] Compiling HuggingFace HubClient+Collections.swift
2026-10-05T02:52:49.7838780Z [208/426] Compiling HuggingFace HubClient+Datasets.swift
2026-10-05T02:52:49.7839140Z [209/426] Compiling HuggingFace HubClient+Discussions.swift
2026-10-05T02:52:49.7839560Z [210/426] Compiling HuggingFace HubClient+Files.swift
2026-10-05T02:52:49.7839870Z [211/426] Compiling HuggingFace HubClient+Git.swift
2026-10-05T02:52:49.7840260Z [212/426] Compiling HuggingFace HubClient+Models.swift
2026-10-05T02:52:49.7840590Z [213/426] Compiling HuggingFace HubClient+OAuth.swift
2026-10-05T02:52:49.7841040Z [214/426] Compiling HuggingFace HubClient+Organizations.swift
2026-10-05T02:52:49.7841470Z [215/426] Compiling HuggingFace HubClient+Pagination.swift
2026-10-05T02:52:49.7842040Z [216/426] Compiling OrderedCollections OrderedDictionary+Invariants.swift
2026-10-05T02:52:49.7842530Z [217/426] Compiling OrderedCollections OrderedDictionary+Move.swift
2026-10-05T02:52:49.7843000Z [218/426] Compiling OrderedCollections OrderedDictionary+Partial MutableCollection.swift
2026-10-05T02:52:50.7975980Z [219/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra intersection.swift
2026-10-05T02:52:50.8095750Z [220/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isDisjoint.swift
2026-10-05T02:52:50.8099230Z [221/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isEqualSet.swift
2026-10-05T02:52:50.8100970Z [222/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isStrictSubset.swift
2026-10-05T02:52:50.8102810Z [223/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isStrictSuperset.swift
2026-10-05T02:52:50.8105800Z [224/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isSubset.swift
2026-10-05T02:52:50.8107390Z [225/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isSuperset.swift
2026-10-05T02:52:50.8109150Z [226/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra subtract.swift
2026-10-05T02:52:50.8171060Z [227/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra subtracting.swift
2026-10-05T02:52:50.8172360Z [228/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra symmetricDifference.swift
2026-10-05T02:52:50.8173200Z [229/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra union.swift
2026-10-05T02:52:50.8173890Z [230/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra+Basics.swift
2026-10-05T02:52:50.8174480Z [231/468] Compiling OrderedCollections OrderedSet+RandomAccessCollection.swift
2026-10-05T02:52:50.8175070Z [232/468] Compiling OrderedCollections OrderedSet+ReserveCapacity.swift
2026-10-05T02:52:50.8175730Z [233/468] Compiling OrderedCollections OrderedSet+Sendable.swift
2026-10-05T02:52:50.8176380Z [234/468] Compiling OrderedCollections OrderedSet+SubSequence.swift
2026-10-05T02:52:50.8176910Z [235/468] Compiling OrderedCollections OrderedSet+Testing.swift
2026-10-05T02:52:50.8177560Z [236/468] Compiling OrderedCollections OrderedSet+UnorderedView.swift
2026-10-05T02:52:50.8178100Z [237/468] Compiling OrderedCollections OrderedSet+UnstableInternals.swift
2026-10-05T02:52:50.8178720Z [238/468] Compiling OrderedCollections OrderedSet.swift
2026-10-05T02:52:50.8179250Z [239/468] Compiling OrderedCollections _UnsafeBitset.swift
2026-10-05T02:52:51.0816020Z [240/468] Compiling OrderedCollections OrderedDictionary+Partial RangeReplaceableCollection.swift
2026-10-05T02:52:51.0817740Z [241/468] Compiling OrderedCollections OrderedDictionary+Sendable.swift
2026-10-05T02:52:51.0819790Z [242/468] Compiling OrderedCollections OrderedDictionary+Sequence.swift
2026-10-05T02:52:51.0821160Z [243/468] Compiling OrderedCollections OrderedDictionary+Values.swift
2026-10-05T02:52:51.0822400Z [244/468] Compiling OrderedCollections OrderedDictionary.swift
2026-10-05T02:52:51.0823540Z [245/468] Compiling OrderedCollections OrderedSet+Codable.swift
2026-10-05T02:52:51.0824750Z [246/468] Compiling OrderedCollections OrderedSet+CustomReflectable.swift
2026-10-05T02:52:51.0826000Z [247/468] Compiling OrderedCollections OrderedSet+Descriptions.swift
2026-10-05T02:52:51.0827060Z [248/468] Compiling OrderedCollections OrderedSet+Diffing.swift
2026-10-05T02:52:51.0828040Z [249/468] Compiling OrderedCollections OrderedSet+Equatable.swift
2026-10-05T02:52:51.0829340Z [250/468] Compiling OrderedCollections OrderedSet+ExpressibleByArrayLiteral.swift
2026-10-05T02:52:51.0830480Z [251/468] Compiling OrderedCollections OrderedSet+Hashable.swift
2026-10-05T02:52:51.0831550Z [252/468] Compiling OrderedCollections OrderedSet+Initializers.swift
2026-10-05T02:52:51.0832560Z [253/468] Compiling OrderedCollections OrderedSet+Insertions.swift
2026-10-05T02:52:51.0833500Z [254/468] Compiling OrderedCollections OrderedSet+Invariants.swift
2026-10-05T02:52:51.0834500Z [255/468] Compiling OrderedCollections OrderedSet+Move.swift
2026-10-05T02:52:51.0835600Z [256/468] Compiling OrderedCollections OrderedSet+Partial MutableCollection.swift
2026-10-05T02:52:51.0837020Z [257/468] Compiling OrderedCollections OrderedSet+Partial RangeReplaceableCollection.swift
2026-10-05T02:52:51.0838430Z [258/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra formIntersection.swift
2026-10-05T02:52:51.0839980Z [259/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra formSymmetricDifference.swift
2026-10-05T02:52:51.0841350Z [260/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra formUnion.swift
2026-10-05T02:52:51.4938340Z [261/475] Emitting module ComplexModule
2026-10-05T02:52:51.6181270Z [262/480] Compiling ComplexModule Complex+AdditiveArithmetic.swift
2026-10-05T02:52:51.6215660Z [263/480] Compiling ComplexModule Complex+AlgebraicField.swift
2026-10-05T02:52:51.6216290Z [264/480] Compiling ComplexModule Complex+Codable.swift
2026-10-05T02:52:51.6216810Z [265/480] Compiling ComplexModule Complex+ElementaryFunctions.swift
2026-10-05T02:52:51.6217400Z [266/480] Compiling ComplexModule Complex+Hashable.swift
2026-10-05T02:52:51.6217890Z [267/480] Compiling ComplexModule Complex+IntegerLiteral.swift
2026-10-05T02:52:51.7559320Z [268/480] Compiling ComplexModule Complex+Numeric.swift
2026-10-05T02:52:51.7560870Z [269/480] Compiling ComplexModule Complex+StringConvertible.swift
2026-10-05T02:52:51.7562080Z [270/480] Compiling ComplexModule Complex.swift
2026-10-05T02:52:51.7563260Z [271/480] Compiling ComplexModule Polar.swift
2026-10-05T02:52:51.7564260Z [272/480] Compiling ComplexModule Scale.swift
2026-10-05T02:52:52.3664840Z [273/488] Emitting module Jinja
2026-10-05T02:52:54.1656930Z [274/495] Compiling Jinja Parser.swift
2026-10-05T02:52:54.1771380Z [275/495] Compiling Jinja PropertyMembers.swift
2026-10-05T02:52:54.1794690Z [276/495] Compiling Jinja Template.swift
2026-10-05T02:52:54.1795140Z [277/495] Compiling Jinja Tests.swift
2026-10-05T02:52:54.1795610Z [278/495] Compiling Jinja Token.swift
2026-10-05T02:52:54.1796260Z [279/495] Compiling Jinja Utilities.swift
2026-10-05T02:52:54.1796720Z [280/495] Compiling Jinja Value.swift
2026-10-05T02:52:54.5919130Z [281/495] Compiling Jinja AST.swift
2026-10-05T02:52:54.5919840Z [282/495] Compiling Jinja Error.swift
2026-10-05T02:52:54.5920430Z [283/495] Compiling Jinja Filters.swift
2026-10-05T02:52:54.5920840Z [284/495] Compiling Jinja Globals.swift
2026-10-05T02:52:54.5921260Z [285/495] Compiling Jinja Interpreter.swift
2026-10-05T02:52:54.5921710Z [286/495] Compiling Jinja Lexer.swift
2026-10-05T02:52:54.5922050Z [287/495] Compiling Jinja Macro.swift
2026-10-05T02:52:54.7718230Z [288/497] Compiling Numerics Numerics.swift
2026-10-05T02:52:54.7718960Z [289/497] Emitting module Numerics
2026-10-05T02:52:57.1981770Z [289/497] Compiling utils.cpp
2026-10-05T02:52:59.6636380Z [290/497] Compiling transforms.cpp
2026-10-05T02:53:00.5620620Z [310/497] Emitting module HuggingFace
2026-10-05T02:53:00.9930370Z [310/533] Compiling stream.cpp
2026-10-05T02:53:03.0766220Z [311/533] Compiling scheduler.cpp
2026-10-05T02:53:05.0113740Z [312/533] Compiling random.cpp
2026-10-05T02:53:06.2662670Z [314/533] Compiling HuggingFace HubClient+Papers.swift
2026-10-05T02:53:06.2663490Z [315/533] Compiling HuggingFace HubClient+Repos.swift
2026-10-05T02:53:06.2664100Z [316/533] Compiling HuggingFace HubClient+Spaces.swift
2026-10-05T02:53:06.2664660Z [317/533] Compiling HuggingFace HubClient+User.swift
2026-10-05T02:53:06.2665140Z [318/533] Compiling HuggingFace HubClient.swift
2026-10-05T02:53:06.2665640Z [319/533] Compiling HuggingFace Model.swift
2026-10-05T02:53:06.2666010Z [320/533] Compiling HuggingFace OAuth.swift
2026-10-05T02:53:06.2666490Z [321/533] Compiling HuggingFace Organization.swift
2026-10-05T02:53:06.2667050Z [322/533] Compiling HuggingFace Pagination.swift
2026-10-05T02:53:06.2667860Z [323/533] Compiling HuggingFace Paper.swift
2026-10-05T02:53:06.2668340Z [324/533] Compiling HuggingFace Repo.swift
2026-10-05T02:53:06.2668850Z [325/533] Compiling HuggingFace ResourceGroup.swift
2026-10-05T02:53:06.2669310Z [326/533] Compiling HuggingFace Space.swift
2026-10-05T02:53:06.2669770Z [327/533] Compiling HuggingFace Tags.swift
2026-10-05T02:53:06.2670140Z [328/533] Compiling HuggingFace User.swift
2026-10-05T02:53:06.2670560Z [329/533] Compiling HuggingFace ChatCompletion.swift
2026-10-05T02:53:06.2671040Z [330/533] Compiling HuggingFace FeatureExtraction.swift
2026-10-05T02:53:06.2671530Z [331/533] Compiling HuggingFace InferenceClient.swift
2026-10-05T02:53:06.2672130Z [332/533] Compiling HuggingFace Message.swift
2026-10-05T02:53:06.2672510Z [333/533] Compiling HuggingFace Provider.swift
2026-10-05T02:53:06.2672960Z [334/533] Compiling HuggingFace SpeechToText.swift
2026-10-05T02:53:06.2673460Z [335/533] Compiling HuggingFace TextToImage.swift
2026-10-05T02:53:06.2677690Z [336/533] Compiling HuggingFace TextToVideo.swift
2026-10-05T02:53:06.2678180Z [337/533] Compiling HuggingFace HuggingFaceAuthenticationManager.swift
2026-10-05T02:53:06.2678560Z [338/533] Compiling HuggingFace OAuthClient.swift
2026-10-05T02:53:06.2678920Z [339/533] Compiling HuggingFace TokenStorage.swift
2026-10-05T02:53:06.2679310Z [340/533] Compiling HuggingFace CacheLocationProvider.swift
2026-10-05T02:53:06.2679740Z [341/533] Compiling HuggingFace Data+Extensions.swift
2026-10-05T02:53:06.2680130Z [342/533] Compiling HuggingFace JSONDecoder+Extensions.swift
2026-10-05T02:53:06.2680580Z [343/533] Compiling HuggingFace URL+Extensions.swift
2026-10-05T02:53:06.2681030Z [344/533] Compiling HuggingFace URLSession+Linux.swift
2026-10-05T02:53:06.2681420Z [345/533] Compiling HuggingFace FileLock.swift
2026-10-05T02:53:06.2681800Z [346/533] Compiling HuggingFace HTTPClient.swift
2026-10-05T02:53:06.2682160Z [347/533] Compiling HuggingFace MultipartBuilder.swift
2026-10-05T02:53:06.2682600Z [348/533] Compiling HuggingFace TokenProvider.swift
2026-10-05T02:53:06.2682920Z [349/533] Compiling HuggingFace Value.swift
2026-10-05T02:53:07.6683060Z [349/533] Compiling primitives.cpp
2026-10-05T02:53:10.8605230Z [350/537] Compiling ops.cpp
2026-10-05T02:53:12.7204570Z [351/537] Compiling linalg.cpp
2026-10-05T02:53:14.5864330Z [353/537] Emitting module Hub
2026-10-05T02:53:14.5879380Z [354/537] Compiling Hub BinaryDistinct.swift
2026-10-05T02:53:14.5908080Z [355/537] Compiling Hub Config.swift
2026-10-05T02:53:14.5908840Z [356/537] Compiling Hub Hub.swift
2026-10-05T02:53:15.8691830Z [356/540] Compiling safetensors.cpp
2026-10-05T02:53:16.8197640Z [358/540] Compiling Hub HubApi.swift
2026-10-05T02:53:16.8198190Z [359/540] Compiling Hub YYJSONParser.swift
2026-10-05T02:53:16.8198760Z [360/540] Compiling Hub resource_bundle_accessor.swift
2026-10-05T02:53:16.9248780Z [360/540] Compiling no_gguf.cpp
2026-10-05T02:53:18.3790700Z [361/547] Compiling load.cpp
2026-10-05T02:53:18.4221800Z [363/547] Compiling Tokenizers BPETokenizer.swift
2026-10-05T02:53:18.4222600Z [364/547] Compiling Tokenizers BertTokenizer.swift
2026-10-05T02:53:18.4222990Z [365/547] Compiling Tokenizers ByteEncoder.swift
2026-10-05T02:53:18.4223310Z [366/547] Compiling Tokenizers Decoder.swift
2026-10-05T02:53:18.4223680Z [367/547] Compiling Tokenizers Normalizer.swift
2026-10-05T02:53:18.4224020Z [368/547] Compiling Tokenizers PostProcessor.swift
2026-10-05T02:53:18.4224360Z [369/547] Emitting module Tokenizers
2026-10-05T02:53:19.9795910Z [370/553] Compiling Tokenizers PreTokenizer.swift
2026-10-05T02:53:19.9806670Z [371/553] Compiling Tokenizers String+PreTokenization.swift
2026-10-05T02:53:19.9864170Z [372/553] Compiling Tokenizers TokenLattice.swift
2026-10-05T02:53:19.9873140Z [373/553] Compiling Tokenizers Tokenizer.swift
2026-10-05T02:53:19.9941010Z [374/553] Compiling Tokenizers Trie.swift
2026-10-05T02:53:19.9952850Z [375/553] Compiling Tokenizers UnigramTokenizer.swift
2026-10-05T02:53:20.5952940Z [375/553] Compiling graph_utils.cpp
2026-10-05T02:53:22.4393610Z [376/559] Compiling fft.cpp
2026-10-05T02:53:22.6174300Z [378/559] Compiling Generation Decoders.swift
2026-10-05T02:53:22.6174870Z [379/559] Compiling Generation Generation.swift
2026-10-05T02:53:22.6184450Z [380/559] Compiling Generation GenerationConfig.swift
2026-10-05T02:53:22.6236190Z [381/559] Compiling Generation LogitsProcessor.swift
2026-10-05T02:53:22.6236730Z [382/559] Compiling Generation MinPLogitsWarper.swift
2026-10-05T02:53:22.6237660Z [383/559] Emitting module Generation
2026-10-05T02:53:23.3134200Z [384/563] Compiling Generation RepetitionPenaltyLogitsProcessor.swift
2026-10-05T02:53:23.3134980Z [385/563] Compiling Generation TemperatureLogitsWarper.swift
2026-10-05T02:53:23.3135540Z [386/563] Compiling Generation TopKLogitsWarper.swift
2026-10-05T02:53:23.3135970Z [387/563] Compiling Generation TopPLogitsWarper.swift
2026-10-05T02:53:24.9044700Z [387/563] Compiling fast.cpp
2026-10-05T02:53:26.5188920Z [389/566] Emitting module Models
2026-10-05T02:53:26.5227760Z [390/566] Compiling Models LanguageModel.swift
2026-10-05T02:53:26.5228350Z [391/566] Compiling Models LanguageModelTypes.swift
2026-10-05T02:53:27.5707590Z [392/567] Compiling Models Weights.swift
2026-10-05T02:53:29.5386500Z [392/567] Compiling einsum.cpp
2026-10-05T02:53:30.2222750Z [393/567] Compiling dtype_utils.cpp
2026-10-05T02:53:30.4551620Z [394/567] Compiling export.cpp
2026-10-05T02:53:30.8418860Z [395/567] Compiling dtype.cpp
2026-10-05T02:53:31.1836230Z [396/567] Compiling utils.cpp
2026-10-05T02:53:31.6523230Z [397/567] Compiling no_ring.cpp
2026-10-05T02:53:32.2556180Z [398/567] Compiling primitives.cpp
2026-10-05T02:53:32.7092500Z [399/567] Compiling ops.cpp
2026-10-05T02:53:32.9664100Z [400/567] Compiling no_nccl.cpp
2026-10-05T02:53:33.3526540Z [401/567] Compiling no_mpi.cpp
2026-10-05T02:53:33.6110160Z [402/567] Compiling no_jaccl.cpp
2026-10-05T02:53:34.0314430Z [403/567] Compiling device.cpp
2026-10-05T02:53:34.1637510Z [404/567] Compiling distributed.cpp
2026-10-05T02:53:36.2309160Z [405/567] Compiling utils.cpp
2026-10-05T02:53:36.3239220Z [406/567] Compiling compile.cpp
2026-10-05T02:53:38.3079710Z [407/567] Compiling unary.cpp
2026-10-05T02:53:38.3524000Z [408/567] Compiling ternary.cpp
2026-10-05T02:53:40.4671280Z [409/567] Compiling softmax.cpp
2026-10-05T02:53:40.5803200Z [410/567] Compiling sort.cpp
2026-10-05T02:53:42.7762700Z [411/567] Compiling scan.cpp
2026-10-05T02:53:42.9584680Z [412/567] Compiling slicing.cpp
2026-10-05T02:53:45.3961440Z [413/567] Compiling rope.cpp
2026-10-05T02:53:45.6210440Z [414/567] Compiling scaled_dot_product_attention.cpp
2026-10-05T02:53:47.0878890Z [415/567] Compiling resident.cpp
2026-10-05T02:53:48.0170470Z [416/567] Compiling reduce.cpp
2026-10-05T02:53:50.5971070Z [417/567] Compiling quantized.cpp
2026-10-05T02:53:51.2772260Z [418/567] Compiling primitives.cpp
2026-10-05T02:53:54.3821300Z [419/567] Compiling normalization.cpp
2026-10-05T02:53:54.9198150Z [420/567] Compiling metal.cpp
2026-10-05T02:53:58.2655890Z [421/567] Compiling logsumexp.cpp
2026-10-05T02:53:58.9495170Z [422/567] Compiling matmul.cpp
2026-10-05T02:54:01.4615720Z [423/567] Compiling jit_kernels.cpp
2026-10-05T02:54:02.1852010Z [424/567] Compiling indexing.cpp
2026-10-05T02:54:04.3429420Z [425/567] Compiling hadamard.cpp
2026-10-05T02:54:06.4811810Z [426/567] Compiling fft.cpp
2026-10-05T02:54:06.6327520Z [427/567] Compiling fence.cpp
2026-10-05T02:54:08.5270470Z [428/567] Compiling event.cpp
2026-10-05T02:54:09.0666610Z [429/567] Compiling eval.cpp
2026-10-05T02:54:10.8879420Z [430/567] Compiling distributed.cpp
2026-10-05T02:54:11.0419860Z [431/567] Compiling device_info.cpp
2026-10-05T02:54:13.5856510Z [432/567] Compiling custom_kernel.cpp
2026-10-05T02:54:14.3124590Z [433/567] Compiling device.cpp
2026-10-05T02:54:15.9764140Z [434/567] Compiling copy.cpp
2026-10-05T02:54:16.7688120Z [435/567] Compiling conv.cpp
2026-10-05T02:54:18.0795540Z [436/567] Compiling compiled.cpp
2026-10-05T02:54:19.0155390Z [437/567] Compiling binary.cpp
2026-10-05T02:54:19.6407560Z [438/567] Compiling allocator.cpp
2026-10-05T02:54:19.9716890Z [439/567] Compiling slicing.cpp
2026-10-05T02:54:20.8504920Z [440/567] Compiling primitives.cpp
2026-10-05T02:54:21.1575730Z [441/567] Compiling copy.cpp
2026-10-05T02:54:21.5606580Z [442/567] Compiling no_cuda.cpp
2026-10-05T02:54:21.6525120Z [443/567] Compiling threefry.cpp
2026-10-05T02:54:24.0442950Z [444/567] Compiling unary.cpp
2026-10-05T02:54:24.1179400Z [445/567] Compiling svd.cpp
2026-10-05T02:54:26.1956640Z [446/567] Compiling softmax.cpp
2026-10-05T02:54:27.2142540Z [447/567] Compiling sort.cpp
2026-10-05T02:54:27.9477860Z [448/567] Compiling select.cpp
2026-10-05T02:54:29.4323030Z [449/567] Compiling scan.cpp
2026-10-05T02:54:31.3411580Z [450/567] Compiling reduce.cpp
2026-10-05T02:54:31.7553490Z [451/567] Compiling quantized.cpp
2026-10-05T02:54:33.5221730Z [452/567] Compiling primitives.cpp
2026-10-05T02:54:33.9134350Z [453/567] Compiling qrf.cpp
2026-10-05T02:54:35.6263770Z [454/567] Compiling matmul.cpp
2026-10-05T02:54:36.0274890Z [455/567] Compiling masked_mm.cpp
2026-10-05T02:54:37.6891960Z [456/567] Compiling logsumexp.cpp
2026-10-05T02:54:38.0176640Z [457/567] Compiling luf.cpp
2026-10-05T02:54:40.4446950Z [458/567] Compiling inverse.cpp
2026-10-05T02:54:42.3175010Z [459/567] Compiling indexing.cpp
2026-10-05T02:54:42.3663270Z [460/567] Compiling hadamard.cpp
2026-10-05T02:54:44.0637290Z [461/567] Compiling cblas.cpp
2026-10-05T02:54:44.2292410Z [462/567] Compiling bnns.cpp
2026-10-05T02:54:45.3521610Z [463/567] Compiling eval.cpp
2026-10-05T02:54:45.7935100Z [464/567] Compiling fft.cpp
2026-10-05T02:54:46.0757130Z [465/567] Compiling encoder.cpp
2026-10-05T02:54:47.4801920Z [466/567] Compiling eigh.cpp
2026-10-05T02:54:47.7850210Z [467/567] Compiling eig.cpp
2026-10-05T02:54:48.1958840Z [468/567] Compiling device_info.cpp
2026-10-05T02:54:48.4401980Z [469/567] Compiling distributed.cpp
2026-10-05T02:54:50.3509250Z [470/567] Compiling conv.cpp
2026-10-05T02:54:50.9381800Z [471/567] Compiling copy.cpp
2026-10-05T02:54:52.3593410Z [472/567] Compiling cholesky.cpp
2026-10-05T02:54:53.4054530Z [473/567] Compiling arg_reduce.cpp
2026-10-05T02:54:54.3008640Z [474/567] Compiling utils.cpp
2026-10-05T02:54:55.3403580Z [475/567] Compiling slicing.cpp
2026-10-05T02:54:56.5069630Z [476/567] Compiling reduce.cpp
2026-10-05T02:54:57.1528810Z [477/567] Compiling binary.cpp
2026-10-05T02:54:57.9713430Z [478/567] Compiling metal_kernel.cpp
2026-10-05T02:54:58.4062180Z [479/567] Compiling load.cpp
2026-10-05T02:54:59.1937990Z [480/567] Compiling compiled.cpp
2026-10-05T02:54:59.5936160Z [481/567] Compiling common.cpp
2026-10-05T02:55:00.1679760Z [482/567] Compiling broadcasting.cpp
2026-10-05T02:55:00.2032580Z [483/567] Compiling utils.cpp
2026-10-05T02:55:00.2504960Z [484/567] Compiling unary_ops.cpp
2026-10-05T02:55:00.2840710Z [485/567] Compiling unary.cpp
2026-10-05T02:55:00.3092850Z [486/567] Compiling ternary_ops.cpp
2026-10-05T02:55:00.3361390Z [487/567] Compiling ternary.cpp
2026-10-05T02:55:00.3618720Z [488/567] Compiling steel_gemm_splitk_nax.cpp
2026-10-05T02:55:00.3941490Z [489/567] Compiling steel_gemm_splitk.cpp
2026-10-05T02:55:00.4169640Z [490/567] Compiling steel_gemm_segmented_nax.cpp
2026-10-05T02:55:00.4379520Z [491/567] Compiling steel_gemm_segmented.cpp
2026-10-05T02:55:00.4700530Z [492/567] Compiling steel_gemm_masked.cpp
2026-10-05T02:55:00.4914580Z [493/567] Compiling steel_gemm_gather_nax.cpp
2026-10-05T02:55:00.5146250Z [494/567] Compiling steel_gemm_gather.cpp
2026-10-05T02:55:00.5376310Z [495/567] Compiling steel_gemm_fused_nax.cpp
2026-10-05T02:55:00.5591700Z [496/567] Compiling steel_gemm_fused.cpp
2026-10-05T02:55:00.5842100Z [497/567] Compiling steel_conv_general.cpp
2026-10-05T02:55:00.6032060Z [498/567] Compiling steel_conv_3d.cpp
2026-10-05T02:55:00.6252520Z [499/567] Compiling steel_conv.cpp
2026-10-05T02:55:00.6482040Z [500/567] Compiling steel_attention_nax.cpp
2026-10-05T02:55:00.6709850Z [501/567] Compiling steel_attention.cpp
2026-10-05T02:55:00.6966040Z [502/567] Compiling sort.cpp
2026-10-05T02:55:00.7162820Z [503/567] Compiling softmax.cpp
2026-10-05T02:55:00.7403930Z [504/567] Compiling searchsorted.cpp
2026-10-05T02:55:00.7608730Z [505/567] Compiling scatter_axis.cpp
2026-10-05T02:55:00.7854780Z [506/567] Compiling scatter.cpp
2026-10-05T02:55:00.8076850Z [507/567] Compiling scan.cpp
2026-10-05T02:55:00.8336720Z [508/567] Compiling reduce_utils.cpp
2026-10-05T02:55:00.8536940Z [509/567] Compiling reduce.cpp
2026-10-05T02:55:00.8741230Z [510/567] Compiling quantized_utils.cpp
2026-10-05T02:55:00.8989550Z [511/567] Compiling quantized_nax.cpp
2026-10-05T02:55:00.9207090Z [512/567] Compiling quantized.cpp
2026-10-05T02:55:00.9406050Z [513/567] Compiling masked_scatter.cpp
2026-10-05T02:55:00.9605020Z [514/567] Compiling logsumexp.cpp
2026-10-05T02:55:00.9845880Z [515/567] Compiling hadamard.cpp
2026-10-05T02:55:01.0056970Z [516/567] Compiling gemv_masked.cpp
2026-10-05T02:55:01.0289070Z [517/567] Compiling gemv.cpp
2026-10-05T02:55:01.0533130Z [518/567] Compiling gemm_nax.cpp
2026-10-05T02:55:01.0757240Z [519/567] Compiling gemm.cpp
2026-10-05T02:55:01.0966440Z [520/567] Compiling gather_front.cpp
2026-10-05T02:55:01.1226620Z [521/567] Compiling gather_axis.cpp
2026-10-05T02:55:01.1449030Z [522/567] Compiling gather.cpp
2026-10-05T02:55:01.1672390Z [523/567] Compiling fp_quantized_nax.cpp
2026-10-05T02:55:01.1977770Z [524/567] Compiling fp_quantized.cpp
2026-10-05T02:55:01.2214750Z [525/567] Compiling fft.cpp
2026-10-05T02:55:01.2518430Z [526/567] Compiling copy.cpp
2026-10-05T02:55:01.2738740Z [527/567] Compiling conv.cpp
2026-10-05T02:55:01.2991510Z [528/567] Compiling compiled_preamble.cpp
2026-10-05T02:55:01.3340870Z [529/567] Compiling binary_two.cpp
2026-10-05T02:55:01.3577200Z [530/567] Compiling binary_ops.cpp
2026-10-05T02:55:01.3788510Z [531/567] Compiling binary.cpp
2026-10-05T02:55:01.4033860Z [532/567] Compiling arange.cpp
2026-10-05T02:55:01.5020170Z [533/567] Compiling array.cpp
2026-10-05T02:55:03.2771860Z [534/567] Compiling jit_compiler_conditional.cpp
2026-10-05T02:55:03.9080280Z [535/567] Compiling compiled_conditional.cpp
2026-10-05T02:55:05.2137350Z [536/567] Compiling version.cpp
2026-10-05T02:55:05.7527270Z [537/567] Compiling vector.cpp
2026-10-05T02:55:06.5622760Z [538/567] Compiling transforms_impl.cpp
2026-10-05T02:55:07.0723310Z [539/567] Compiling transforms.cpp
2026-10-05T02:55:07.8077830Z [540/567] Compiling string.cpp
2026-10-05T02:55:08.2827970Z [541/567] Compiling stream.cpp
2026-10-05T02:55:09.0896990Z [542/567] Compiling random.cpp
2026-10-05T02:55:09.8872680Z [543/567] Compiling ops.cpp
2026-10-05T02:55:10.4207380Z [544/567] Compiling metal.cpp
2026-10-05T02:55:11.1069750Z [545/567] Compiling memory.cpp
2026-10-05T02:55:11.7324050Z [546/567] Compiling map.cpp
2026-10-05T02:55:12.4045750Z [547/567] Compiling linalg.cpp
2026-10-05T02:55:13.1512070Z [548/567] Compiling io_types.cpp
2026-10-05T02:55:13.8979700Z [549/567] Compiling io.cpp
2026-10-05T02:55:14.4464200Z [550/567] Compiling graph_utils.cpp
2026-10-05T02:55:15.3235600Z [551/567] Compiling fft.cpp
2026-10-05T02:55:16.2287600Z [552/567] Compiling fast.cpp
2026-10-05T02:55:16.7367590Z [553/567] Compiling error.cpp
2026-10-05T02:55:16.7373490Z [554/567] Compiling export.cpp
2026-10-05T02:55:18.0245050Z [555/567] Compiling cuda.cpp
2026-10-05T02:55:18.1839230Z [556/567] Compiling device.cpp
2026-10-05T02:55:19.3360460Z [557/567] Compiling compile.cpp
2026-10-05T02:55:19.6232440Z [558/567] Compiling closure.cpp
2026-10-05T02:55:21.2223940Z [559/567] Compiling array.cpp
2026-10-05T02:55:21.5937250Z [560/567] Compiling Cmlx.m
2026-10-05T02:55:21.8272600Z [561/567] Compiling CSlotpack slotpack.c
2026-10-05T02:55:21.8770170Z [562/567] Compiling CAtomic CAtomic.c
2026-10-05T02:55:22.6218920Z [563/592] Compiling format.cc
2026-10-05T02:55:24.6263510Z [565/614] Emitting module Markdown
2026-10-05T02:55:25.6728440Z [566/637] Compiling MLX ArrayAt.swift
2026-10-05T02:55:25.6836930Z [567/637] Compiling MLX Cmlx+Util.swift
2026-10-05T02:55:25.6938090Z [568/637] Compiling MLX DType.swift
2026-10-05T02:55:25.6987650Z [569/637] Compiling MLX Device.swift
2026-10-05T02:55:25.7000540Z [570/637] Compiling MLX ErrorHandler.swift
2026-10-05T02:55:25.7000870Z [571/637] Compiling MLX Export.swift
2026-10-05T02:55:25.7102070Z [572/637] Compiling MLX FFT.swift
2026-10-05T02:55:25.7203180Z [573/637] Compiling MLX Factory.swift
2026-10-05T02:55:25.7303690Z [574/637] Compiling MLX Foundation+Util.swift
2026-10-05T02:55:25.7404730Z [575/637] Compiling MLX GPU+Metal.swift
2026-10-05T02:55:25.7505040Z [576/637] Compiling MLX GraphUtils.swift
2026-10-05T02:55:25.7606140Z [577/637] Compiling MLX IO.swift
2026-10-05T02:55:25.7706570Z [578/637] Compiling MLX Linalg.swift
2026-10-05T02:55:25.7807890Z [579/637] Compiling MLX MLXArray+Bytes.swift
2026-10-05T02:55:25.7908080Z [580/637] Compiling MLX MLXArray+Indexing.swift
2026-10-05T02:55:25.8108150Z [581/637] Compiling MLX MLXArray+Init.swift
2026-10-05T02:55:25.8208600Z [582/637] Compiling MLX MLXArray+Metal.swift
2026-10-05T02:55:25.8309440Z [583/637] Compiling MLX MLXArray+Normalizer.swift
2026-10-05T02:55:25.8409890Z [584/637] Compiling MLX MLXArray+Ops.swift
2026-10-05T02:55:25.8510860Z [585/637] Compiling MLX MLXArray+maskFill.swift
2026-10-05T02:55:25.8612450Z [586/637] Compiling MLX MLXArray.swift
2026-10-05T02:55:25.8713110Z [587/637] Compiling Markdown CodeBlock.swift
2026-10-05T02:55:25.8814370Z [588/637] Compiling Markdown HTMLBlock.swift
2026-10-05T02:55:25.8921620Z [589/637] Compiling Markdown Heading.swift
2026-10-05T02:55:25.9036440Z [590/660] Compiling Markdown ThematicBreak.swift
2026-10-05T02:55:25.9048360Z [591/660] Compiling Markdown Table.swift
2026-10-05T02:55:25.9048890Z [592/660] Compiling Markdown TableBody.swift
2026-10-05T02:55:25.9049290Z [593/660] Compiling Markdown TableCell.swift
2026-10-05T02:55:25.9049780Z [594/660] Compiling Markdown TableCellContainer.swift
2026-10-05T02:55:25.9050180Z [595/660] Compiling Markdown TableHead.swift
2026-10-05T02:55:25.9050600Z [596/660] Compiling Markdown TableRow.swift
2026-10-05T02:55:25.9051040Z [597/660] Compiling Markdown Replacement.swift
2026-10-05T02:55:25.9051490Z [598/660] Compiling Markdown SourceLocation.swift
2026-10-05T02:55:25.9051980Z [599/660] Compiling Markdown Emphasis.swift
2026-10-05T02:55:25.9052270Z [600/660] Compiling Markdown Image.swift
2026-10-05T02:55:25.9052650Z [601/660] Compiling Markdown InlineAttributes.swift
2026-10-05T02:55:25.9052940Z [602/660] Compiling Markdown Link.swift
2026-10-05T02:55:25.9053260Z [603/660] Compiling Markdown Strikethrough.swift
2026-10-05T02:55:25.9068610Z [604/660] Compiling Markdown Strong.swift
2026-10-05T02:55:25.9068960Z [605/660] Compiling Markdown CustomInline.swift
2026-10-05T02:55:25.9069300Z [606/660] Compiling Markdown InlineCode.swift
2026-10-05T02:55:25.9069580Z [607/660] Compiling Markdown InlineHTML.swift
2026-10-05T02:55:25.9069920Z [608/660] Compiling Markdown LineBreak.swift
2026-10-05T02:55:25.9070270Z [609/660] Compiling Markdown SoftBreak.swift
2026-10-05T02:55:25.9070540Z [610/660] Compiling Markdown SymbolLink.swift
2026-10-05T02:55:25.9070860Z [611/660] Compiling Markdown Text.swift
2026-10-05T02:55:25.9074730Z [612/660] Compiling Markdown Aside.swift
2026-10-05T02:55:26.1603440Z [613/660] Emitting module MLX
2026-10-05T02:55:29.1385610Z [614/681] Compiling Markdown BlockDirectiveParser.swift
2026-10-05T02:55:29.1487920Z [615/681] Compiling Markdown CommonMarkConverter.swift
2026-10-05T02:55:29.1590000Z [616/681] Compiling Markdown LazySplitLines.swift
2026-10-05T02:55:29.1695530Z [617/681] Compiling Markdown ParseOptions.swift
2026-10-05T02:55:29.1702170Z [618/681] Compiling Markdown RangeAdjuster.swift
2026-10-05T02:55:29.1702750Z [619/681] Compiling Markdown RangerTracker.swift
2026-10-05T02:55:29.1740410Z [620/681] Compiling Markdown MarkupRewriter.swift
2026-10-05T02:55:29.1844890Z [621/681] Compiling Markdown BasicBlockContainer.swift
2026-10-05T02:55:29.1946490Z [622/681] Compiling Markdown BasicInlineContainer.swift
2026-10-05T02:55:29.2048160Z [623/681] Compiling Markdown BlockContainer.swift
2026-10-05T02:55:29.2048640Z [624/681] Compiling Markdown BlockMarkup.swift
2026-10-05T02:55:29.2127830Z [625/681] Compiling Markdown InlineContainer.swift
2026-10-05T02:55:29.2245980Z [626/681] Compiling Markdown InlineMarkup.swift
2026-10-05T02:55:29.2335280Z [627/681] Compiling Markdown ListItemContainer.swift
2026-10-05T02:55:29.2337010Z [628/681] Compiling Markdown AtomicCounter.swift
2026-10-05T02:55:29.2338920Z [629/681] Compiling Markdown CharacterExtensions.swift
2026-10-05T02:55:29.2361450Z [630/681] Compiling Markdown CollectionExtensions.swift
2026-10-05T02:55:29.2363410Z [631/681] Compiling Markdown StringExtensions.swift
2026-10-05T02:55:29.2364480Z [632/681] Compiling Markdown MarkupVisitor.swift
2026-10-05T02:55:29.2369130Z [633/681] Compiling Markdown MarkupWalker.swift
2026-10-05T02:55:29.2370140Z [634/681] Compiling Markdown HTMLFormatter.swift
2026-10-05T02:55:29.2372210Z [635/681] Compiling Markdown MarkupFormatter.swift
2026-10-05T02:55:29.2372790Z [636/681] Compiling Markdown MarkupTreeDumper.swift
2026-10-05T02:55:30.3622070Z [637/684] Compiling MLX MLXCustomFunction.swift
2026-10-05T02:55:30.3732600Z [638/684] Compiling MLX MLXFast.swift
2026-10-05T02:55:30.3733290Z [639/684] Compiling MLX MLXFastKernel.swift
2026-10-05T02:55:30.3733780Z [640/684] Compiling MLX Memory.swift
2026-10-05T02:55:30.3734280Z [641/684] Compiling MLX Nested.swift
2026-10-05T02:55:30.3734750Z [642/684] Compiling MLX NestedArrayElement.swift
2026-10-05T02:55:30.3735350Z [643/684] Compiling MLX Ops+Array.swift
2026-10-05T02:55:30.3735820Z [644/684] Compiling MLX Ops.swift
2026-10-05T02:55:30.3736270Z [645/684] Compiling MLX ParameterTypes.swift
2026-10-05T02:55:30.3736670Z [646/684] Compiling MLX Protocols.swift
2026-10-05T02:55:30.3737140Z [647/684] Compiling MLX Random.swift
2026-10-05T02:55:30.3737610Z [648/684] Compiling MLX State.swift
2026-10-05T02:55:30.3737960Z [649/684] Compiling MLX Stream.swift
2026-10-05T02:55:30.3738460Z [650/684] Compiling MLX Transforms+Compile.swift
2026-10-05T02:55:30.3738900Z [651/684] Compiling MLX Transforms+CompileOverloads.swift
2026-10-05T02:55:30.3739410Z [652/684] Compiling MLX Transforms+Eval.swift
2026-10-05T02:55:30.3739910Z [653/684] Compiling MLX Transforms+Grad.swift
2026-10-05T02:55:30.3740450Z [654/684] Compiling MLX Transforms+Internal.swift
2026-10-05T02:55:30.3740950Z [655/684] Compiling MLX Transforms+Vmap.swift
2026-10-05T02:55:30.3741420Z [656/684] Compiling MLX Transforms.swift
2026-10-05T02:55:30.3741810Z [657/684] Compiling MLX WiredMemory.swift
2026-10-05T02:55:31.2032180Z [658/684] Compiling SevraPresentation ComposerSession.swift
2026-10-05T02:55:31.2032960Z [659/684] Compiling SevraPresentation HistoryPage.swift
2026-10-05T02:55:32.7939250Z [679/694] Compiling MLXNN Activations.swift
2026-10-05T02:55:32.8075830Z [680/694] Compiling MLXNN Cache.swift
2026-10-05T02:55:32.8177760Z [681/694] Compiling MLXNN Containers.swift
2026-10-05T02:55:32.8244370Z [682/694] Compiling MLXNN Convolution.swift
2026-10-05T02:55:32.8245440Z [683/694] Compiling MLXNN ConvolutionTransposed.swift
2026-10-05T02:55:32.8245900Z [684/694] Compiling MLXNN Dropout.swift
2026-10-05T02:55:32.8246640Z [685/694] Compiling MLXNN Embedding.swift
2026-10-05T02:55:32.8247090Z [686/694] Compiling MLXNN Linear.swift
2026-10-05T02:55:32.8348090Z [687/694] Compiling MLXNN Losses.swift
2026-10-05T02:55:33.0861380Z [688/703] Emitting module MLXNN
2026-10-05T02:55:35.1825830Z [691/703] Emitting module SevraPresentation
2026-10-05T02:55:35.8587280Z [692/705] Compiling MLXNN Module.swift
2026-10-05T02:55:35.8587950Z [693/705] Compiling MLXNN Normalization.swift
2026-10-05T02:55:35.8588510Z [694/705] Compiling MLXNN Pooling.swift
2026-10-05T02:55:35.8589150Z [695/705] Compiling MLXNN PositionalEncoding.swift
2026-10-05T02:55:35.8589610Z [696/705] Compiling MLXNN Quantized.swift
2026-10-05T02:55:35.8589970Z [697/705] Compiling MLXNN Recurrent.swift
2026-10-05T02:55:35.8590400Z [698/705] Compiling MLXNN Transformer.swift
2026-10-05T02:55:35.8590830Z [699/705] Compiling MLXNN Upsample.swift
2026-10-05T02:55:35.8591230Z [700/705] Compiling MLXNN ValueAndGrad.swift
2026-10-05T02:55:36.1456790Z [701/707] Emitting module MLXFast
2026-10-05T02:55:36.1515920Z [702/707] Compiling MLXFast MLXFast.swift
2026-10-05T02:55:36.2600990Z [703/708] Compiling MLXFast MLXFastKernel.swift
2026-10-05T02:55:36.2845740Z [704/708] Compiling SevraPresentation MarkdownDocument.swift
2026-10-05T02:55:36.2847160Z [705/708] Compiling SevraPresentation Module.swift
2026-10-05T02:55:39.0268330Z [706/732] Emitting module Slotstream
2026-10-05T02:55:46.8170740Z [707/755] Compiling Slotstream AdaptiveSpeculation.swift
2026-10-05T02:55:46.8173890Z [708/755] Compiling Slotstream AffineEngineSource.swift
2026-10-05T02:55:46.8178020Z [709/755] Compiling Slotstream AffineExpertControl.swift
2026-10-05T02:55:46.8322040Z [710/755] Compiling Slotstream AffineGroupedExperts.swift
2026-10-05T02:55:46.8454330Z [711/755] Compiling Slotstream AffineStandalonePack.swift
2026-10-05T02:55:46.8555390Z [712/755] Compiling Slotstream AnthropicDialect.swift
2026-10-05T02:55:46.8655030Z [713/755] Compiling Slotstream AppliedModelConfiguration.swift
2026-10-05T02:55:46.8656560Z [714/755] Compiling Slotstream AuthenticatedTensorBatch.swift
2026-10-05T02:55:46.8660140Z [715/755] Compiling Slotstream AutomaticPackPolicy.swift
2026-10-05T02:55:46.8660670Z [716/755] Compiling Slotstream BlockSelection.swift
2026-10-05T02:55:46.8661250Z [717/755] Compiling Slotstream BoundedOutput.swift
2026-10-05T02:55:46.8668710Z [718/755] Compiling Slotstream CPUSlotWrite.swift
2026-10-05T02:55:46.8673180Z [719/755] Compiling Slotstream CacheBookkeeping.swift
2026-10-05T02:55:46.8673640Z [720/755] Compiling Slotstream Checkpoint.swift
2026-10-05T02:55:46.8674120Z [721/755] Compiling Slotstream CodingToolLaunch.swift
2026-10-05T02:55:46.8677340Z [722/755] Compiling Slotstream CompiledArithmetic.swift
2026-10-05T02:55:46.8680460Z [723/755] Compiling Slotstream Context.swift
2026-10-05T02:55:46.8684000Z [724/755] Compiling Slotstream ContextFeasibility.swift
2026-10-05T02:55:46.8684460Z [725/755] Compiling Slotstream ContextMemory.swift
2026-10-05T02:55:46.8685010Z [726/755] Compiling Slotstream ContextWindowPolicy.swift
2026-10-05T02:55:46.8689100Z [727/755] Compiling Slotstream DecodeLookahead+Configuration.swift
2026-10-05T02:55:46.8689600Z [728/755] Compiling Slotstream DecodeLookahead.swift
2026-10-05T02:55:46.8699690Z [729/755] Compiling Slotstream DownloadConcurrency.swift
2026-10-05T02:55:56.2474360Z [730/778] Compiling Slotstream MemTrace.swift
2026-10-05T02:55:56.2477780Z [731/778] Compiling Slotstream Model.swift
2026-10-05T02:55:56.2596250Z [732/778] Compiling Slotstream ModelPackLoadedSelection.swift
2026-10-05T02:55:56.2707270Z [733/778] Compiling Slotstream ModelPackPlanning.swift
2026-10-05T02:55:56.2810450Z [734/778] Compiling Slotstream ModelPackRegistry.swift
2026-10-05T02:55:56.2915970Z [735/778] Compiling Slotstream ModelPackStartupDefaults.swift
2026-10-05T02:55:56.3018230Z [736/778] Compiling Slotstream ModelPackStartupSelection.swift
2026-10-05T02:55:56.3120200Z [737/778] Compiling Slotstream NgramHash.swift
2026-10-05T02:55:56.3150600Z [738/778] Compiling Slotstream NgramPrefetch.swift
2026-10-05T02:55:56.3236510Z [739/778] Compiling Slotstream NgramStore.swift
2026-10-05T02:55:56.3237240Z [740/778] Compiling Slotstream Observation.swift
2026-10-05T02:55:56.3239350Z [741/778] Compiling Slotstream OpenAIDialect.swift
2026-10-05T02:55:56.3239840Z [742/778] Compiling Slotstream OpenAIOutput.swift
2026-10-05T02:55:56.3240320Z [743/778] Compiling Slotstream OptimizationPlatform.swift
2026-10-05T02:55:56.3240750Z [744/778] Compiling Slotstream Optimizations.swift
2026-10-05T02:55:56.3241280Z [745/778] Compiling Slotstream PackMemoryProfile.swift
2026-10-05T02:55:56.3241700Z [746/778] Compiling Slotstream PackedExpertLayout.swift
2026-10-05T02:55:56.3242230Z [747/778] Compiling Slotstream PackedProjectionPair.swift
2026-10-05T02:55:56.3244930Z [748/778] Compiling Slotstream PartialRotation.swift
2026-10-05T02:55:56.3245490Z [749/778] Compiling Slotstream PersistentPrefixCache.swift
2026-10-05T02:55:56.3246200Z [750/778] Compiling Slotstream PersistentPrefixConversation.swift
2026-10-05T02:55:56.3246830Z [751/778] Compiling Slotstream PersistentPrefixFormat.swift
2026-10-05T02:55:56.3247840Z [752/778] Compiling Slotstream PersistentPrefixGenerator.swift
2026-10-05T02:55:57.7163260Z [753/801] Compiling Slotstream DownloadHTTP.swift
2026-10-05T02:55:57.7281020Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7423210Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.7529180Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.7650820Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.7771900Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7861330Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.7862860Z 109 |                     }
2026-10-05T02:55:57.7865600Z [754/801] Compiling Slotstream EmbeddingRows.swift
2026-10-05T02:55:57.7868810Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7871240Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.7872860Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.7874650Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.7877020Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7881140Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.7918020Z 109 |                     }
2026-10-05T02:55:57.7919340Z [755/801] Compiling Slotstream Engine.swift
2026-10-05T02:55:57.7921170Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7923200Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.7925620Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.7927400Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.7929190Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7929970Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.7930440Z 109 |                     }
2026-10-05T02:55:57.7931310Z [756/801] Compiling Slotstream Errors.swift
2026-10-05T02:55:57.7932360Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7937030Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.7937690Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.7949010Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.7949570Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7950200Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.7950740Z 109 |                     }
2026-10-05T02:55:57.7951550Z [757/801] Compiling Slotstream ExactRead.swift
2026-10-05T02:55:57.7952300Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7953030Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.7953620Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.7956660Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.7958210Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7961830Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.7963980Z 109 |                     }
2026-10-05T02:55:57.7965130Z [758/801] Compiling Slotstream ExpertLookaheadTrace.swift
2026-10-05T02:55:57.7966010Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7968360Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.7970460Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.7971670Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.7973970Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7976680Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.7978560Z 109 |                     }
2026-10-05T02:55:57.7979670Z [759/801] Compiling Slotstream ExpertPredictor.swift
2026-10-05T02:55:57.7981490Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.7994430Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8059790Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8060320Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8061010Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8062700Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8076280Z 109 |                     }
2026-10-05T02:55:57.8079420Z [760/801] Compiling Slotstream ExpertPrefetch.swift
2026-10-05T02:55:57.8092890Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8093800Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8100680Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8101210Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8101740Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8102530Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8109280Z 109 |                     }
2026-10-05T02:55:57.8112000Z [761/801] Compiling Slotstream ExpertStore.swift
2026-10-05T02:55:57.8113000Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8115270Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8119040Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8120430Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8121200Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8123710Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8124960Z 109 |                     }
2026-10-05T02:55:57.8128240Z [762/801] Compiling Slotstream ExpertTransferProfile.swift
2026-10-05T02:55:57.8130020Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8131560Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8133110Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8134170Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8135440Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8136200Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8136690Z 109 |                     }
2026-10-05T02:55:57.8137680Z [763/801] Compiling Slotstream FusedPrefillAttention.swift
2026-10-05T02:55:57.8150050Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8152620Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8157400Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8158550Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8160760Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8162420Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8166010Z 109 |                     }
2026-10-05T02:55:57.8167390Z [764/801] Compiling Slotstream GDNPhaseProfile.swift
2026-10-05T02:55:57.8168820Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8170280Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8171760Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8173740Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8176340Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8204310Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8205260Z 109 |                     }
2026-10-05T02:55:57.8205640Z [765/801] Compiling Slotstream GPUKeepAlive.swift
2026-10-05T02:55:57.8206780Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8209200Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8210980Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8211940Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8212990Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8216820Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8217630Z 109 |                     }
2026-10-05T02:55:57.8217990Z [766/801] Compiling Slotstream GatewayDialect.swift
2026-10-05T02:55:57.8218740Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8219600Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8220720Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8221180Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8222330Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8223880Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8224700Z 109 |                     }
2026-10-05T02:55:57.8225090Z [767/801] Compiling Slotstream GatewayOutput.swift
2026-10-05T02:55:57.8226170Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8227080Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8227540Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8228350Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8229280Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8230000Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8230530Z 109 |                     }
2026-10-05T02:55:57.8230850Z [768/801] Compiling Slotstream Generate.swift
2026-10-05T02:55:57.8231700Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8236020Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8237530Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8238590Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8241330Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8243180Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8243780Z 109 |                     }
2026-10-05T02:55:57.8244450Z [769/801] Compiling Slotstream GenerationPhase.swift
2026-10-05T02:55:57.8246390Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8248040Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8248420Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8248870Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8249340Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8249990Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8250440Z 109 |                     }
2026-10-05T02:55:57.8250820Z [770/801] Compiling Slotstream Governor.swift
2026-10-05T02:55:57.8251540Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8252370Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8253990Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8255600Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8256140Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8257310Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8257870Z 109 |                     }
2026-10-05T02:55:57.8258390Z [771/801] Compiling Slotstream LayerLocalVictim.swift
2026-10-05T02:55:57.8259140Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8259930Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8260310Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8260770Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8261240Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8261880Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8262520Z 109 |                     }
2026-10-05T02:55:57.8262810Z [772/801] Compiling Slotstream Layers.swift
2026-10-05T02:55:57.8263540Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8264250Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8264650Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8264970Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8265530Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8266280Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8266970Z 109 |                     }
2026-10-05T02:55:57.8267250Z [773/801] Compiling Slotstream MTP.swift
2026-10-05T02:55:57.8267820Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8268510Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8268780Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8269270Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8269750Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8270340Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8270840Z 109 |                     }
2026-10-05T02:55:57.8271160Z [774/801] Compiling Slotstream MTPExpertStream.swift
2026-10-05T02:55:57.8271970Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8272660Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8273030Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8273410Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8274930Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8275770Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8276240Z 109 |                     }
2026-10-05T02:55:57.8276580Z [775/801] Compiling Slotstream Machine.swift
2026-10-05T02:55:57.8277680Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8278520Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:55:57.8279050Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:55:57.8279420Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:55:57.8280070Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:55:57.8280670Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:55:57.8281090Z 109 |                     }
2026-10-05T02:56:04.4075790Z [776/824] Compiling Slotstream PersistentPrefixPolicy.swift
2026-10-05T02:56:04.4204050Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4334250Z 34 |         lock.lock()
2026-10-05T02:56:04.4454890Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4539650Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4540360Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4541210Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4541730Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4542340Z [777/824] Compiling Slotstream PersistentPrefixRestore.swift
2026-10-05T02:56:04.4545820Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4546560Z 34 |         lock.lock()
2026-10-05T02:56:04.4549900Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4556700Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4557330Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4566080Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4566580Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4567070Z [778/824] Compiling Slotstream PersistentPrefixSave.swift
2026-10-05T02:56:04.4570940Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4571690Z 34 |         lock.lock()
2026-10-05T02:56:04.4572050Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4572510Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4580770Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4581340Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4581900Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4624280Z [779/824] Compiling Slotstream PinnedModel.swift
2026-10-05T02:56:04.4625000Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4625700Z 34 |         lock.lock()
2026-10-05T02:56:04.4626900Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4627290Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4627770Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4628410Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4630380Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4630780Z [780/824] Compiling Slotstream PinnedTransport.swift
2026-10-05T02:56:04.4638140Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4639170Z 34 |         lock.lock()
2026-10-05T02:56:04.4639370Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4639620Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4640010Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4640430Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4640740Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4642340Z [781/824] Compiling Slotstream PinnedTransportManifest.swift
2026-10-05T02:56:04.4643000Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4643550Z 34 |         lock.lock()
2026-10-05T02:56:04.4644070Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4644710Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4645100Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4645510Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4645830Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4646630Z [782/824] Compiling Slotstream Plan.swift
2026-10-05T02:56:04.4647200Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4647760Z 34 |         lock.lock()
2026-10-05T02:56:04.4647970Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4648960Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4649350Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4649940Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4650280Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4650950Z [783/824] Compiling Slotstream PlannerCostModel.swift
2026-10-05T02:56:04.4651560Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4652170Z 34 |         lock.lock()
2026-10-05T02:56:04.4652910Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4656180Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4657440Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4657950Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4658280Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4658550Z [784/824] Compiling Slotstream PlannerDevice.swift
2026-10-05T02:56:04.4660140Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4660740Z 34 |         lock.lock()
2026-10-05T02:56:04.4660920Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4661180Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4661810Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4662250Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4662570Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4662870Z [785/824] Compiling Slotstream PrefillReadPolicy.swift
2026-10-05T02:56:04.4663870Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4664440Z 34 |         lock.lock()
2026-10-05T02:56:04.4664610Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4664850Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4666670Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4667150Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4667470Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4667740Z [786/824] Compiling Slotstream PrefixCache.swift
2026-10-05T02:56:04.4668610Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4669170Z 34 |         lock.lock()
2026-10-05T02:56:04.4669340Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4669590Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4669990Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4670620Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4670940Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4671230Z [787/824] Compiling Slotstream PressureBoundary.swift
2026-10-05T02:56:04.4671830Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4672610Z 34 |         lock.lock()
2026-10-05T02:56:04.4672780Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4673020Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4673410Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4674120Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4674570Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4674870Z [788/824] Compiling Slotstream ProcessMemory.swift
2026-10-05T02:56:04.4675450Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4675990Z 34 |         lock.lock()
2026-10-05T02:56:04.4676160Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4676600Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4677170Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4677620Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4677950Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4678270Z [789/824] Compiling Slotstream QuantizationLayout.swift
2026-10-05T02:56:04.4678890Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4679460Z 34 |         lock.lock()
2026-10-05T02:56:04.4679630Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4679870Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4680250Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4680670Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4681020Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4681310Z [790/824] Compiling Slotstream RequestControl.swift
2026-10-05T02:56:04.4682060Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4682630Z 34 |         lock.lock()
2026-10-05T02:56:04.4682800Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4683050Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4683660Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4684070Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4684400Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4684710Z [791/824] Compiling Slotstream ResidentExpertOverlap.swift
2026-10-05T02:56:04.4685480Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4686100Z 34 |         lock.lock()
2026-10-05T02:56:04.4686270Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4686520Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4686910Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4687970Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4688790Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4689090Z [792/824] Compiling Slotstream ResponsesDialect.swift
2026-10-05T02:56:04.4689740Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4690650Z 34 |         lock.lock()
2026-10-05T02:56:04.4690830Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4691080Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4691490Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4692630Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4692950Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4693240Z [793/824] Compiling Slotstream RouterProjection.swift
2026-10-05T02:56:04.4693840Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4695790Z 34 |         lock.lock()
2026-10-05T02:56:04.4695970Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4696210Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4696800Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4697810Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4709080Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4709380Z [794/824] Compiling Slotstream RouterSelection.swift
2026-10-05T02:56:04.4710270Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4710840Z 34 |         lock.lock()
2026-10-05T02:56:04.4711010Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4711240Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4711690Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4712360Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4712700Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4713140Z [795/824] Compiling Slotstream RouterTapCorrection.swift
2026-10-05T02:56:04.4714150Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4715940Z 34 |         lock.lock()
2026-10-05T02:56:04.4716240Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4716550Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4717010Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4717870Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4718880Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4719270Z [796/824] Compiling Slotstream RouterTrace.swift
2026-10-05T02:56:04.4719920Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4721180Z 34 |         lock.lock()
2026-10-05T02:56:04.4721430Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4721740Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4722210Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4723680Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4724070Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4724430Z [797/824] Compiling Slotstream RoutingReadbackQueue.swift
2026-10-05T02:56:04.4725650Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4726620Z 34 |         lock.lock()
2026-10-05T02:56:04.4726860Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4727170Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4732470Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4735510Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4735830Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:04.4767780Z [798/824] Compiling Slotstream SelectedAttention.swift
2026-10-05T02:56:04.4768520Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4769180Z 34 |         lock.lock()
2026-10-05T02:56:04.4769420Z 35 |         defer { lock.unlock() }
2026-10-05T02:56:04.4769740Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:56:04.4770130Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:56:04.4770700Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:56:04.4771100Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:56:07.2846090Z [799/846] Compiling Slotstream Server.swift
2026-10-05T02:56:07.2847090Z [800/846] Compiling Slotstream ServerActivity.swift
2026-10-05T02:56:07.2847970Z [801/846] Compiling Slotstream SlotWritePlan.swift
2026-10-05T02:56:07.2848810Z [802/846] Compiling Slotstream SlotpackDownload.swift
2026-10-05T02:56:07.2849680Z [803/846] Compiling Slotstream SlotpackManifest.swift
2026-10-05T02:56:07.2850520Z [804/846] Compiling Slotstream StatePrefixFork.swift
2026-10-05T02:56:07.2852430Z [805/846] Compiling Slotstream StateRecovery.swift
2026-10-05T02:56:07.2853620Z [806/846] Compiling Slotstream TapCorrectionSidecar.swift
2026-10-05T02:56:07.2854600Z [807/846] Compiling Slotstream ToolCallSplitter.swift
2026-10-05T02:56:07.2855420Z [808/846] Compiling Slotstream VQArithmetic.swift
2026-10-05T02:56:07.2856250Z [809/846] Compiling Slotstream VQBankAdmission.swift
2026-10-05T02:56:07.2863070Z [810/846] Compiling Slotstream VQCheckpoint.swift
2026-10-05T02:56:07.2863990Z [811/846] Compiling Slotstream VQDecode.swift
2026-10-05T02:56:07.2865940Z [812/846] Compiling Slotstream VQDenseOverlay.swift
2026-10-05T02:56:07.2888950Z [813/846] Compiling Slotstream VQDraftWeights.swift
2026-10-05T02:56:07.2889510Z [814/846] Compiling Slotstream VQExpert.swift
2026-10-05T02:56:07.2889850Z [815/846] Compiling Slotstream VQExpertKernels.swift
2026-10-05T02:56:07.2890190Z [816/846] Compiling Slotstream VQGenerationProbe.swift
2026-10-05T02:56:07.2890530Z [817/846] Compiling Slotstream VQKernelSources.swift
2026-10-05T02:56:07.2890920Z [818/846] Compiling Slotstream VQModelProbe.swift
2026-10-05T02:56:07.2891240Z [819/846] Compiling Slotstream VQPLERows.swift
2026-10-05T02:56:07.2891550Z [820/846] Compiling Slotstream VQPackedExperts.swift
2026-10-05T02:56:07.2891880Z [821/846] Compiling Slotstream VQPrefillRecords.swift
2026-10-05T02:56:10.7123010Z [822/846] Compiling Slotstream VQPrefillStream.swift
2026-10-05T02:56:10.7125220Z [823/846] Compiling Slotstream VQRecord.swift
2026-10-05T02:56:10.7128100Z [824/846] Compiling Slotstream VQRecordBank.swift
2026-10-05T02:56:10.7129030Z [825/846] Compiling Slotstream VQRecordCache.swift
2026-10-05T02:56:10.7129780Z [826/846] Compiling Slotstream VQRecordReadBatch.swift
2026-10-05T02:56:10.7130550Z [827/846] Compiling Slotstream VQRecordReadPlan.swift
2026-10-05T02:56:10.7131250Z [828/846] Compiling Slotstream VQResidentText.swift
2026-10-05T02:56:10.7132020Z [829/846] Compiling Slotstream VQRotaryCoefficients.swift
2026-10-05T02:56:10.7132750Z [830/846] Compiling Slotstream VQRotaryTable.swift
2026-10-05T02:56:10.7133460Z [831/846] Compiling Slotstream VQRouteStream.swift
2026-10-05T02:56:10.7134150Z [832/846] Compiling Slotstream VQTensorFile.swift
2026-10-05T02:56:10.7134890Z [833/846] Compiling Slotstream VQTrunkProbe.swift
2026-10-05T02:56:10.7135550Z [834/846] Compiling Slotstream GatedDelta.swift
2026-10-05T02:56:10.7136260Z [835/846] Compiling Slotstream VerifyPassSelfCheck.swift
2026-10-05T02:56:10.7137770Z [836/846] Compiling Slotstream Version.swift
2026-10-05T02:56:10.7138390Z [837/846] Compiling Slotstream Vision.swift
2026-10-05T02:56:10.7139040Z [838/846] Compiling Slotstream VisionAttention.swift
2026-10-05T02:56:10.7139730Z [839/846] Compiling Slotstream VisionPrompt.swift
2026-10-05T02:56:10.7140410Z [840/846] Compiling Slotstream WeightDownload.swift
2026-10-05T02:56:10.7141120Z [841/846] Compiling Slotstream WeightStore.swift
2026-10-05T02:56:10.7141990Z [842/846] Compiling Slotstream Weights.swift
2026-10-05T02:56:10.7142910Z [843/846] Compiling Slotstream WordSlotWrite.swift
2026-10-05T02:56:19.0769490Z [844/859] Emitting module SevraRuntime
2026-10-05T02:56:19.0810710Z [845/859] Compiling SevraRuntime Changes.swift
2026-10-05T02:56:19.0811610Z [846/859] Compiling SevraRuntime ConversationContext.swift
2026-10-05T02:56:19.0812450Z [847/859] Compiling SevraRuntime Extensions.swift
2026-10-05T02:56:19.0813100Z [848/859] Compiling SevraRuntime Extraction.swift
2026-10-05T02:56:19.0813860Z [849/859] Compiling SevraRuntime HomeArchive.swift
2026-10-05T02:56:19.0814490Z [850/859] Compiling SevraRuntime HomeStore.swift
2026-10-05T02:56:19.0814980Z [851/859] Compiling SevraRuntime HomeTemplate.swift
2026-10-05T02:56:19.0815510Z [852/859] Compiling SevraRuntime HomeWriter.swift
2026-10-05T02:56:19.0815910Z [853/859] Compiling SevraRuntime Inference.swift
2026-10-05T02:56:19.0816360Z [854/859] Compiling SevraRuntime InferenceCache.swift
2026-10-05T02:56:19.0816780Z [855/859] Compiling SevraRuntime LocalIPC.swift
2026-10-05T02:56:19.0817300Z [856/859] Compiling SevraRuntime ModelActivation.swift
2026-10-05T02:56:25.2504050Z [857/870] Compiling SevraRuntime ModelSetup.swift
2026-10-05T02:56:25.2504650Z [858/870] Compiling SevraRuntime ModelVerification.swift
2026-10-05T02:56:25.2505070Z [859/870] Compiling SevraRuntime Models.swift
2026-10-05T02:56:25.2506670Z [860/870] Compiling SevraRuntime Performance.swift
2026-10-05T02:56:25.2508440Z [861/870] Compiling SevraRuntime ResponseMetrics.swift
2026-10-05T02:56:25.2531590Z [862/870] Compiling SevraRuntime Runtime.swift
2026-10-05T02:56:25.2535870Z [863/870] Compiling SevraRuntime RuntimeExtensions.swift
2026-10-05T02:56:25.2536370Z [864/870] Compiling SevraRuntime SourceNavigation.swift
2026-10-05T02:56:25.2537050Z [865/870] Compiling SevraRuntime Sources.swift
2026-10-05T02:56:25.2537500Z [866/870] Compiling SevraRuntime Thinking.swift
2026-10-05T02:56:25.2538440Z [867/870] Compiling SevraRuntime Tools.swift
2026-10-05T02:56:40.6199260Z [868/877] Compiling SevraMac AppModel.swift
2026-10-05T02:56:40.6200310Z [869/877] Compiling SevraMac AppModelWork.swift
2026-10-05T02:56:40.6200720Z [870/877] Compiling SevraMac ContentView.swift
2026-10-05T02:56:40.6201110Z [871/877] Compiling SevraMac MacCommands.swift
2026-10-05T02:56:40.6201450Z [872/877] Compiling SevraMac MiniAppHost.swift
2026-10-05T02:56:40.6201850Z [873/877] Compiling SevraMac NativeControls.swift
2026-10-05T02:56:40.6202180Z [874/877] Emitting module SevraMac
2026-10-05T02:56:50.2236010Z [875/883] Compiling SevraMac NativeText.swift
2026-10-05T02:56:50.2236780Z [876/883] Compiling SevraMac ObserverMark.swift
2026-10-05T02:56:50.2237260Z [877/883] Compiling SevraMac ResponseDetails.swift
2026-10-05T02:56:50.2237660Z [878/883] Compiling SevraMac SevraMain.swift
2026-10-05T02:56:50.2237990Z [879/883] Compiling SevraMac WindowState.swift
2026-10-05T02:56:50.2238480Z [880/883] Compiling SevraMac WorkViews.swift
2026-10-05T02:56:50.2926210Z [880/883] Write Objects.LinkFileList
2026-10-05T02:56:54.9292630Z [881/883] Linking Sevra
2026-10-05T02:56:55.0690160Z [882/883] Applying Sevra
2026-10-05T02:56:55.0777080Z Build of product 'Sevra' complete! (264.26s)
2026-10-05T02:57:10.8672640Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/01-home-idle.png
2026-10-05T02:57:11.3621070Z IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver
2026-10-05T02:57:12.4773960Z PASS: Home composer shows the Think longer switch
2026-10-05T02:57:12.4774810Z PASS: Home hint stays plain while thinking is off
2026-10-05T02:57:13.5943180Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/02-thread-thinking-off.png
2026-10-05T02:57:14.4667920Z PASS: a new thread starts with Think longer off
2026-10-05T02:57:15.3831780Z   click Think longer at (646, 60)
2026-10-05T02:57:15.5343210Z PASS: Think longer is clickable
2026-10-05T02:57:16.3437040Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/03-thread-thinking-on.png
2026-10-05T02:57:17.3069580Z PASS: the thread remembers the switch
2026-10-05T02:57:17.3070450Z PASS: the hint explains the switch while it is on
2026-10-05T02:57:18.7783580Z   click Send at (1001, 60)
2026-10-05T02:57:18.8887560Z PASS: Send is clickable
2026-10-05T02:57:21.6692390Z PASS: run status shows Thinking with a clock: Thinking… 0:02
2026-10-05T02:57:22.6860530Z PASS: Thinking status and Answer now are visible while the thought runs
2026-10-05T02:57:22.7288890Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/04-thinking-live.png
2026-10-05T02:57:23.7341730Z PASS: the collapsed notes box is gone
2026-10-05T02:57:23.7342250Z PASS: the last lines of the thought are visible while it runs
2026-10-05T02:57:23.7342850Z PASS: the preview keeps to a few lines: 45 points
2026-10-05T02:57:24.5633990Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/05-details-while-thinking.png
2026-10-05T02:57:25.2038860Z   popover text: Response details | Thinking | Thinking... 0:05 | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15.I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | 9.5 tokens per second so far while thinking | The full numbers appear when the response finishes. | Context | 1 message, no saved memories | Inspect
2026-10-05T02:57:25.2060060Z PASS: clicking the preview opens the response's details
2026-10-05T02:57:25.2060820Z PASS: the details show the streaming working notes
2026-10-05T02:57:25.2061230Z PASS: the working notes state their privacy
2026-10-05T02:57:32.4129960Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/05b-thinking-long.png
2026-10-05T02:57:33.6817410Z PASS: a long thought stays within the preview's few lines: 45 points
2026-10-05T02:57:34.6932470Z   click Answer now at (920, 61)
2026-10-05T02:57:34.7759080Z PASS: Answer now is clickable
2026-10-05T02:57:43.9712830Z PASS: the run records an Answer now receipt: Thought for 16 s, then answered when you asked.
2026-10-05T02:57:43.9715620Z PASS: the answer arrived after Answer now
2026-10-05T02:57:43.9717650Z PASS: the run recorded its numbers
2026-10-05T02:57:44.0863480Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/06-answered.png
2026-10-05T02:57:44.9800840Z PASS: the reply shows how long Sevra thought, above the answer
2026-10-05T02:57:44.9801490Z PASS: Answer now is gone and no speed line shows while details are off
2026-10-05T02:57:44.9802310Z PASS: the composer hint now quotes a typical thinking time
2026-10-05T02:57:45.8970010Z   click link Thought for at (354, 612)
2026-10-05T02:57:46.2687450Z PASS: the thinking line is clickable
2026-10-05T02:57:47.0170800Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/07-details-after.png
2026-10-05T02:57:47.7857710Z   popover text: Response details | Copy | Thinking | Thought for 16 s, then answered when you asked. | 160 tokens at 10.1 tokens per second | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 and | the trip takes 2 hours 35 minutes. Adding the hours first gives 11:40, | then 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 and | the trip takes 2 hours 35 minutes. Adding the hours first gives 11:40, | then 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | Writing | Written | First token | 11.2 tokens per second | 92 tokens in 8.2 s | after 0.0 s | Context | 1 message, no saved memories | Inspect
2026-10-05T02:57:47.7862970Z PASS: the details state how thinking ended
2026-10-05T02:57:47.7863300Z PASS: the details show the recorded speed
2026-10-05T02:57:47.7863660Z PASS: the working notes remain while Sevra is open
2026-10-05T02:57:48.6880920Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/08-speed-line.png
2026-10-05T02:57:49.6291610Z PASS: turning details on adds the speed line under the reply
2026-10-05T02:57:50.5555940Z   click link tok/s at (359, 557)
2026-10-05T02:57:50.9459140Z PASS: the speed line is clickable
2026-10-05T02:57:51.4896310Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/09-details-from-speed-line.png
2026-10-05T02:57:52.2660000Z   popover text: Response details | Copy | Thinking | Thought for 16 s, then answered when you asked. | 160 tokens at 10.1 tokens per second | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 and | the trip takes 2 hours 35 minutes. Adding the hours first gives 11:40, | then 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 and | the trip takes 2 hours 35 minutes. Adding the hours first gives 11:40, | then 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | Writing | Written | First token | 11.2 tokens per second | 92 tokens in 8.2 s | after 0.0 s | Context | 1 message, no saved memories | Inspect
2026-10-05T02:57:52.2664050Z PASS: the speed line opens the full numbers
2026-10-05T02:57:53.1883880Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/10-speed-line-dark.png
2026-10-05T02:57:54.2053460Z PASS: dark appearance keeps both lines readable
2026-10-05T02:57:55.2747230Z   click link Thought for at (354, 612)
2026-10-05T02:57:55.7347860Z PASS: the thinking line is clickable in dark appearance
2026-10-05T02:57:56.2837400Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/11-details-dark.png
2026-10-05T02:57:57.1514450Z   popover text: Response details | Сору | Thinking | Thought for 16 s, then answered when you asked. | 160 tokens at 10.1 tokens per second | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 and | the trip takes 2 hours 35 minutes. Adding the hours first gives 11:40, | then 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 and | the trip takes 2 hours 35 minutes. Adding the hours first gives 11:40, | then 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | Writing | Written | First token | 11.2 tokens per second | 92 tokens in 8.2 s | atter 0.0 s | Context | 1 message, no saved memories | Inspect
2026-10-05T02:57:57.1519180Z PASS: the details render in dark appearance
2026-10-05T02:57:58.6045790Z   click Think longer at (648, 58)
2026-10-05T02:57:58.7355550Z PASS: Think longer is clickable again
2026-10-05T02:58:00.5395740Z PASS: clicking again turns thinking off and restores the plain hint (thinking=nil)
2026-10-05T02:58:01.4428850Z   click Send at (1001, 61)
2026-10-05T02:58:01.5207830Z PASS: Send is clickable for a plain reply
2026-10-05T02:58:02.0864960Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/12-live-speed.png
2026-10-05T02:58:03.4156680Z PASS: the status shows the live writing speed
2026-10-05T02:58:12.4412170Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/13-plain-reply.png
2026-10-05T02:58:13.6289490Z PASS: the plain run has numbers and no thought
2026-10-05T02:58:15.2908440Z PASS: turning details off removes the speed lines and keeps the thinking line
2026-10-05T02:58:15.2934710Z PASS: thinking controls render and respond in the production Mac views
2026-10-05T02:58:18.0339720Z [0/1] Planning build
2026-10-05T02:58:18.0708620Z Building for debugging...
2026-10-05T02:58:18.7040580Z [0/3] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:58:18.7183060Z Build of product 'Sevra' complete! (2.92s)
2026-10-05T02:58:19.2274720Z Building for debugging...
2026-10-05T02:58:19.5747120Z [0/7] Write sevra-extract-entitlement.plist
2026-10-05T02:58:19.5747820Z [0/7] Write sources
2026-10-05T02:58:19.6829480Z [2/7] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:58:19.9676570Z [3/7] Compiling CSevraSandbox sevra_sandbox.c
2026-10-05T02:58:23.3967780Z [5/9] Emitting module SevraExtract
2026-10-05T02:58:23.3968490Z [6/9] Compiling SevraExtract main.swift
2026-10-05T02:58:23.4043070Z [6/9] Write Objects.LinkFileList
2026-10-05T02:58:23.8138000Z [7/9] Linking sevra-extract
2026-10-05T02:58:23.8315330Z [8/9] Applying sevra-extract
2026-10-05T02:58:23.8334110Z Build of product 'sevra-extract' complete! (4.68s)
2026-10-05T02:58:39.3038610Z   report: ["beacon": true, "rtc": undefined, "lastChange": probe, "records": 1, "undeclared": denied, "info": {"version":0,"collections":[{"name":"probe","access":"write"}],"name":"Probe"}, "fetchSelf": blocked, "eventsource": blocked, "stored": <null>, "worker": blocked, "overwrite": false, "url": "sevra-app://app/index.html", "freshRtc": unavailable, "popup": false, "websocket": blocked, "innerRtc": undefined, "fetch": blocked, "switchesOff": ["LinkPreconnect": true, "LinkDNSPrefetchEnabled": true, "PeerConnectionEnabled": true], "xhr": blocked]
2026-10-05T02:58:39.3153460Z PASS: the page made no network connection (attempts seen: [])
2026-10-05T02:58:39.3187780Z PASS: WebKit reports peer connections, link preconnects and DNS prefetching off (["LinkPreconnect": true, "LinkDNSPrefetchEnabled": true, "PeerConnectionEnabled": true])
2026-10-05T02:58:39.3195210Z PASS: fetch is blocked
2026-10-05T02:58:39.3229200Z PASS: fetchSelf is blocked
2026-10-05T02:58:39.3229640Z PASS: xhr is blocked
2026-10-05T02:58:39.3229920Z PASS: websocket is blocked
2026-10-05T02:58:39.3230450Z PASS: eventsource is blocked
2026-10-05T02:58:39.3231020Z   sendBeacon queued: true
2026-10-05T02:58:39.3234630Z PASS: peer connections are unavailable
2026-10-05T02:58:39.3235280Z PASS: no peer connection sent a datagram (0 seen; fresh frame: unavailable, srcdoc frame: undefined)
2026-10-05T02:58:39.3235860Z PASS: the page cannot open windows
2026-10-05T02:58:39.3236370Z PASS: an undeclared collection is refused
2026-10-05T02:58:39.3237070Z PASS: the page cannot replace the Sevra API
2026-10-05T02:58:39.3264080Z PASS: info reports only the declared collection
2026-10-05T02:58:39.3265220Z PASS: navigation away is refused (at sevra-app://app/index.html)
2026-10-05T02:58:39.3266220Z PASS: the page hears changes to its own collection only
2026-10-05T02:58:39.3267180Z PASS: the declared write reached the broker once
2026-10-05T02:58:42.8840890Z PASS: browser storage does not outlive the app view (<null>)
2026-10-05T02:58:45.0353910Z PASS: a second run and both teardowns made no network connection (attempts seen: [])
2026-10-05T02:58:45.0361460Z   links offered to the person: ["http://127.0.0.1:49212/link", "http://127.0.0.1:49212/link"]
2026-10-05T02:58:45.0364770Z PASS: a second run sent no datagram either
2026-10-05T02:58:46.4659930Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/01-folder-attached.png
2026-10-05T02:58:46.6183270Z IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver
2026-10-05T02:58:47.8825660Z PASS: the attached folder shows as a chip that can change
2026-10-05T02:58:49.4091980Z   click Send at (1001, 61)
2026-10-05T02:58:49.4818130Z PASS: Send is clickable
2026-10-05T02:58:52.0935940Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/02-changes-waiting.png
2026-10-05T02:58:53.2450850Z PASS: the run offers Review changes
2026-10-05T02:58:53.2453480Z PASS: nothing is written while the review waits
2026-10-05T02:58:54.3891190Z   click Review changes at (896, 224)
2026-10-05T02:58:54.4648120Z PASS: Review changes is clickable
2026-10-05T02:58:55.5186220Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/03-changes-review.png
2026-10-05T02:58:56.6686400Z PASS: the review shows the removed and added lines
2026-10-05T02:58:56.6687590Z PASS: the review offers Write and Discard
2026-10-05T02:58:57.3482280Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/03-changes-review-dark.png
2026-10-05T02:58:59.1163420Z   click Write 1 File at (1058, 28)
2026-10-05T02:58:59.1884110Z PASS: Write 1 File is clickable
2026-10-05T02:59:00.3500020Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/04-changes-written.png
2026-10-05T02:59:01.8887770Z PASS: after writing, the panel offers Undo
2026-10-05T02:59:04.0769020Z   click Send at (1001, 61)
2026-10-05T02:59:04.2484810Z PASS: Send is clickable for the app request
2026-10-05T02:59:07.1292430Z   click Review app at (910, 194)
2026-10-05T02:59:07.2511890Z PASS: Review app is clickable
2026-10-05T02:59:09.2898770Z PASS: the preview runs the app against scratch data
2026-10-05T02:59:09.2904600Z PASS: the preview wrote nothing to Home
2026-10-05T02:59:09.9603790Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/05-app-review.png
2026-10-05T02:59:11.1787040Z PASS: the review shows the data access and Turn On App
2026-10-05T02:59:12.3407650Z   click Turn On App at (1053, 27)
2026-10-05T02:59:12.5080750Z PASS: Turn On App is clickable
2026-10-05T02:59:14.6675530Z PASS: the approved app saved and shows a Home record
2026-10-05T02:59:15.3527760Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/06-app-open.png
2026-10-05T02:59:16.4029870Z PASS: the app canvas names the app and its offline boundary
2026-10-05T02:59:17.2827370Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/07-apps-and-skills.png
2026-10-05T02:59:18.5154740Z PASS: Apps & Skills lists the app and the built-in skills
2026-10-05T02:59:19.2241500Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/07-apps-and-skills-dark.png
2026-10-05T02:59:20.8657950Z   click Send at (1001, 61)
2026-10-05T02:59:21.0872000Z PASS: Send is clickable for the second app request
2026-10-05T02:59:23.1057280Z   click Review app at (910, 194)
2026-10-05T02:59:23.1755960Z PASS: Review app is clickable for the second app
2026-10-05T02:59:24.1987580Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/08-shared-collection-review.png
2026-10-05T02:59:25.2910110Z PASS: a review names records other apps already saved in a collection
2026-10-05T02:59:26.9367790Z   click Send at (1001, 61)
2026-10-05T02:59:27.0917710Z PASS: Send is clickable for the third app request
2026-10-05T02:59:33.3560780Z PASS: an app's own saves are not echoed back to it, so a save-on-change app stays at one record (1)
2026-10-05T02:59:33.4085590Z PASS: mini-app isolation and review flows work in the production Mac views
2026-10-05T02:59:34.2100260Z Building for debugging...
2026-10-05T02:59:35.4554330Z [0/3] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:59:35.4741130Z Build of product 'Sevra' complete! (1.34s)
2026-10-05T02:59:44.8074930Z IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver
2026-10-05T03:03:20.5794610Z PASS: light-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5898120Z PASS: light-unloaded-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5983010Z PASS: light-custom, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5986900Z PASS: light-saved-above-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5991580Z PASS: light-saved-below-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5993570Z PASS: light-unavailable-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5994560Z PASS: light-failed-settings, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5997140Z PASS: light-failed-activation, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5997880Z PASS: light-corrupt-activation, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.5998760Z PASS: light-corrupt-pending-settings, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6020250Z PASS: light-fixed, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6021910Z PASS: light-unavailable-pack, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6022990Z PASS: light-setup-reviewed, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6023690Z PASS: light-setup-stale, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6024330Z PASS: light-setup-verified, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6025020Z PASS: light-setup-unavailable, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6025600Z PASS: light-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T03:03:20.6026250Z PASS: dark-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6056530Z PASS: dark-unloaded-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6057220Z PASS: dark-custom, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6058160Z PASS: dark-saved-above-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6058970Z PASS: dark-saved-below-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6059600Z PASS: dark-unavailable-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6060390Z PASS: dark-failed-settings, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6061060Z PASS: dark-failed-activation, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6061800Z PASS: dark-corrupt-activation, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6063850Z PASS: dark-corrupt-pending-settings, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6073500Z PASS: dark-fixed, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6074400Z PASS: dark-unavailable-pack, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6075270Z PASS: dark-setup-reviewed, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6076180Z PASS: dark-setup-stale, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6076940Z PASS: dark-setup-verified, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6077590Z PASS: dark-setup-unavailable, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6078360Z PASS: dark-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T03:03:20.6078900Z PASS: system-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6079730Z PASS: system-unloaded-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6080480Z PASS: system-custom, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6081230Z PASS: system-saved-above-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6081960Z PASS: system-saved-below-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6082600Z PASS: system-unavailable-range, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6083450Z PASS: system-failed-settings, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6084220Z PASS: system-failed-activation, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6085400Z PASS: system-corrupt-activation, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6086180Z PASS: system-corrupt-pending-settings, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6086990Z PASS: system-fixed, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6087750Z PASS: system-unavailable-pack, rendered controls, current budget, supported range and pending state
2026-10-05T03:03:20.6088370Z PASS: system-setup-reviewed, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6089300Z PASS: system-setup-stale, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6090120Z PASS: system-setup-verified, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6090940Z PASS: system-setup-unavailable, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T03:03:20.6091660Z PASS: system-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T03:04:35.6706090Z PASS: saved document preview, symlink refusal and read budget
2026-10-05T03:04:35.6733140Z PASS: owner exclusion, real dbmd persistence, duplicate submit, bounded tool loop, exact approval, artifact publication, restart, draft, incognito
2026-10-05T03:04:35.6744350Z PASS: terminal gating, undeclared tools, single-file scope, sibling refusal, source symlink substitution
2026-10-05T03:04:35.6745440Z PASS: fresh-URL Home restart, macOS system-alias IPC binding and user-symlink refusal
2026-10-05T03:04:35.6747020Z PASS: historical documents and citations, journal atomic acceptance and restart, duplicate/revision refusal and closed-owner guards
2026-10-05T03:04:35.6747860Z PASS: idempotent memory admission and complete eligible memory text in AI context
2026-10-05T03:04:35.6749620Z PASS: malformed termination, undeclared mixed calls and multiple proposals fail before execution
2026-10-05T03:04:35.6752990Z PASS: one bounded tool-schema correction, no partial execution, preserved review, exhausted-retry and unavailable-tool refusal
2026-10-05T03:04:35.6761130Z PASS: observed artifact=propose spelling correction without alias execution; rejection and stale approval refusal
2026-10-05T03:04:35.6764260Z PASS: invalid artifact and duplicate identities do not poison durable recovery
2026-10-05T03:04:35.6764840Z PASS: source Unicode boundaries and skipped symbolic links
2026-10-05T03:04:35.6765950Z PASS: model verification hash parity and mid-read cancellation without model allocation
2026-10-05T03:04:35.6767180Z PASS: coherent Home backup, complete manifest, exact drafts, pending review, inert restore, explicit activation, monotonic Forget, unknown epochs, corruption/missing/symlink/path/collision/closure refusal and create-only publication
2026-10-05T03:04:35.6772000Z PASS: external draft inspection, exact review race refusal, preserved versions, revision adoption, restart review, no implicit inference, malformed record refusal and normal work after reconciliation
2026-10-05T03:04:35.6773430Z PASS: long Home recent windows, exact retained history, inspectable partial excerpts, matching-memory ranking, bounded full-memory text, suppression lineage and thread-only read/write scope
2026-10-05T03:04:35.6775310Z PASS: Home promotion selection, visible quotations, exact model context, idempotence, drafts, permissions, scope, restart, Forget, active-run refusal and external edits
2026-10-05T03:04:35.6777920Z PASS: loaded profile generation, allocation, preferences and operating conditions govern speed evidence
2026-10-05T03:04:35.6779510Z PASS: manifest-bound session verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
2026-10-05T03:04:35.6781240Z PASS: durable accepted versions, offline restart, exact setup ownership and nonmutating offers
2026-10-05T03:04:35.6787890Z PASS: durable activation phases, exclusive ownership, stale callbacks, interrupted writes, rollback, bounded state, explicit preserved-record repair and weights-free retry
2026-10-05T03:04:35.6790620Z PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
2026-10-05T03:04:35.6792560Z PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
2026-10-05T03:04:35.6793810Z PASS: accepted setup remains inside maintenance and forces the next configuration boundary
2026-10-05T03:04:35.6795450Z PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
2026-10-05T03:04:35.6797330Z PASS: context overflow preserves messages and refuses instead of silently trimming history
2026-10-05T03:04:35.6798090Z PASS: clicks apply at once, saves merge in the background, a saved draft waits for disk, nothing is lost (2 saves)
2026-10-05T03:04:35.6798650Z PASS: cooperative cancellation, FIFO cross-thread scheduling, durable nonce registry
2026-10-05T03:04:35.6800650Z PASS: real process termination after intent, documents, artifact and root record; idempotent restart
2026-10-05T03:04:35.6802720Z PASS: per-thread external edits pause writes and preserve user bytes
2026-10-05T03:04:35.6803680Z PASS: authenticated Unix IPC, long Home paths, invalid capability refusal, Incognito isolation, idempotent client submission and detached completion
2026-10-05T03:04:35.6804790Z PASS: draft revision races, submit/autosave ordering, shared/thread-only/incognito recall, correction provenance and Forget
2026-10-05T03:04:35.6807080Z PASS: thinking off by default, sticky switch, live thought, receipt, answer now, tool turns think within their budget, restart, no thought on disk
2026-10-05T03:04:35.6807820Z PASS: incognito thought stays in memory and leaves with its thread; local endpoint thinking intents
2026-10-05T03:04:35.6808580Z PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows
2026-10-05T03:04:35.6810710Z PASS: a thinking job records exact per-round numbers, a refused round counts, thoughts keep one step per round, numbers persist without text, older runs still decode, live speed while thinking and writing, notes for the eight most recent runs
2026-10-05T03:04:35.6812410Z PASS: document helper sandbox denies file reads, folder listing, writes, loopback network, process launch, window server and home access; its memory limit counts the whole process group
2026-10-05T03:04:35.6813530Z SKIP: image and scan recognition; the document helper reports text recognition unavailable on this Mac
2026-10-05T03:04:35.6814370Z PASS: multi-source attach, hidden and dependency folders skipped, PDF pages, word search fallback, RTF, Word, locked/damaged/oversized refusals, detach
2026-10-05T03:04:35.6815120Z PASS: tool groups follow access; cancelled document reading stops its helper
2026-10-05T03:04:35.6816550Z PASS: documented limits: eight attachments, 8 MB text files, 64 MB documents, 40 recognized pages per request, live folder navigation
2026-10-05T03:04:35.6817290Z PASS: tool-round narration stays out of answers and leads its activity
2026-10-05T03:04:35.6832240Z PASS: the model is told which files are attached, so "what is this?" has a referent
2026-10-05T03:04:35.6833550Z PASS: a refused proposal is corrected once, and a job that keeps being refused still stops
2026-10-05T03:04:35.6834320Z PASS: change tools follow access, read-before-edit, exact diff review, digest-bound approval, exact writes preserving mode and tags, undo with Trash recovery
2026-10-05T03:04:35.6835380Z PASS: external edits win, discard, hard-link refusal, symbolic-link swap refusal, review across restart with re-attached folder, Incognito read-only
2026-10-05T03:04:35.6837700Z PASS: process death while writing is reported after restart, never replayed, and undoable
2026-10-05T03:04:35.6838810Z PASS: knowledge base search and query, record-only tools, protected frontmatter/contract/paths, db.md writes, index and validation, undo with index rebuild, mid-write record edits kept
2026-10-05T03:04:35.6839920Z PASS: /skill proposal, reserved names, exact publication, /name use, no implied tools, tamper refusal, deactivation, restart
2026-10-05T03:04:35.6841010Z PASS: app review, exact publication, grants, host document, create/get/update/archive/restore, revision conflicts, scope and version refusals, malformed and nested data, db.md validation
2026-10-05T03:04:35.6842150Z PASS: app revision with shared data, version switching, tamper refusal, removal keeps data, Incognito, restart, write budget, inert restore, outside-edit pause
2026-10-05T03:04:35.6843100Z PASS: immediate folder grant, directory browsing, live creation/edit/rename/deletion, direct reads, stale-edit refusal
2026-10-05T03:04:35.6843950Z PASS: root confinement, hidden files, symlink boundaries, scoped dependency traversal, file-only grants, multi-source identity and detach
2026-10-05T03:04:35.6844840Z OBSERVATION: 12001-file attachment accepted in 9.93333337646618e-05 seconds (functional observation, not a benchmark)
2026-10-05T03:04:35.6845640Z PASS: large folder acceptance, gap-free listing and search, changed-directory refusal, cancellation and descriptor cleanup
2026-10-05T03:04:35.6846600Z PASS: within-file pagination, UTF-8 offsets, query binding, content mutation and explicit word matching
2026-10-05T03:04:35.6847240Z PASS: global stream ceiling, honest cursor eviction and complete restart
2026-10-05T03:04:35.6847860Z PASS: explicit depth coverage, direct deep navigation, accurate capability context and owner tool-loop integration
2026-10-05T03:04:39.5618470Z PASS: loaded profile generation, allocation, preferences and operating conditions govern speed evidence
2026-10-05T03:04:39.5619720Z PASS: manifest-bound session verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
2026-10-05T03:04:39.5620610Z PASS: durable accepted versions, offline restart, exact setup ownership and nonmutating offers
2026-10-05T03:04:39.5622250Z PASS: durable activation phases, exclusive ownership, stale callbacks, interrupted writes, rollback, bounded state, explicit preserved-record repair and weights-free retry
2026-10-05T03:04:39.5623210Z PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
2026-10-05T03:04:39.5624180Z PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
2026-10-05T03:04:39.5625660Z PASS: accepted setup remains inside maintenance and forces the next configuration boundary
2026-10-05T03:04:39.5626310Z PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
2026-10-05T03:04:39.5627150Z PASS: context overflow preserves messages and refuses instead of silently trimming history
2026-10-05T03:04:39.6082250Z ##[group]Run actions/upload-artifact@v4
2026-10-05T03:04:39.6082670Z with:
2026-10-05T03:04:39.6082930Z   name: sevra-mac-ui-snapshots
2026-10-05T03:04:39.6083630Z   path: .build/sevra-thinking-ui/
.build/sevra-apps-ui/
.build/sevra-memory-ui/

2026-10-05T03:04:39.6084140Z   if-no-files-found: ignore
2026-10-05T03:04:39.6084390Z   compression-level: 6
2026-10-05T03:04:39.6084770Z   overwrite: false
2026-10-05T03:04:39.6085050Z   include-hidden-files: false
2026-10-05T03:04:39.6085360Z ##[endgroup]
2026-10-05T03:04:40.1141660Z (node:64789) [DEP0040] DeprecationWarning: The `punycode` module is deprecated. Please use a userland alternative instead.
2026-10-05T03:04:40.1142400Z (Use `node --trace-deprecation ...` to show where the warning was created)
2026-10-05T03:04:40.1488840Z Multiple search paths detected. Calculating the least common ancestor of all paths
2026-10-05T03:04:40.1491300Z The least common ancestor is /Users/runner/work/slotstream/slotstream/.build. This will be the root directory of the artifact
2026-10-05T03:04:40.1492270Z With the provided path, there will be 146 files uploaded
2026-10-05T03:04:40.1494300Z Artifact name is valid!
2026-10-05T03:04:40.1494620Z Root directory input is valid!
2026-10-05T03:04:40.3981140Z Beginning upload of artifact content to blob storage
2026-10-05T03:04:40.6960430Z (node:64789) [DEP0169] DeprecationWarning: `url.parse()` behavior is not standardized and prone to errors that have security implications. Use the WHATWG URL API instead. CVEs are not issued for `url.parse()` vulnerabilities.
2026-10-05T03:04:40.9130800Z Uploaded bytes 8388608
2026-10-05T03:04:40.9972860Z Uploaded bytes 14014778
2026-10-05T03:04:41.0087100Z Finished uploading artifact content to blob storage!
2026-10-05T03:04:41.0088130Z SHA256 digest of uploaded artifact zip is 3cf4086d0427ae070d3ef6d5bded0569514d847d49abd9a22032ffbcb4ff8282
2026-10-05T03:04:41.0088750Z Finalizing artifact upload
2026-10-05T03:04:41.2081090Z Artifact sevra-mac-ui-snapshots.zip successfully finalized. Artifact ID 11323152508
2026-10-05T03:04:41.2084540Z Artifact sevra-mac-ui-snapshots has been successfully uploaded! Final size is 14014778 bytes. Artifact ID is 11323152508
2026-10-05T03:04:41.2113700Z Artifact download URL: https://github.com/carloslfu/slotstream/actions/runs/37256084608/artifacts/11323152508
2026-10-05T03:04:41.2581960Z Post job cleanup.
2026-10-05T03:04:41.3532960Z [command]/opt/homebrew/bin/git version
2026-10-05T03:04:41.3739720Z git version 2.55.0
2026-10-05T03:04:41.3757470Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/a0e1fc48-a343-4b83-8992-d998caa757bd/.gitconfig'
2026-10-05T03:04:41.3771870Z Temporarily overriding HOME='/Users/runner/work/_temp/a0e1fc48-a343-4b83-8992-d998caa757bd' before making global git config changes
2026-10-05T03:04:41.3772730Z Adding repository directory to the temporary git global config as a safe directory
2026-10-05T03:04:41.3774260Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
2026-10-05T03:04:41.3883150Z Removing SSH command configuration
2026-10-05T03:04:41.3888090Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
2026-10-05T03:04:41.3951640Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2026-10-05T03:04:41.5025710Z Removing HTTP extra header
2026-10-05T03:04:41.5029150Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2026-10-05T03:04:41.5096210Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2026-10-05T03:04:41.5816780Z Removing includeIf entries pointing to credentials config files
2026-10-05T03:04:41.5822120Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
2026-10-05T03:04:41.5874620Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
2026-10-05T03:04:41.5875630Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
2026-10-05T03:04:41.5876170Z includeif.gitdir:/github/workspace/.git.path
2026-10-05T03:04:41.5876580Z includeif.gitdir:/github/workspace/.git/worktrees/*.path
2026-10-05T03:04:41.5879860Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
2026-10-05T03:04:41.5931960Z /Users/runner/work/_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T03:04:41.5940320Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path \/Users\/runner\/work\/_temp\/git\-credentials\-c6a9dc62\-3c36\-4c6d\-ab20\-2627f1b23983\.config
2026-10-05T03:04:41.6007260Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
2026-10-05T03:04:41.6060740Z /Users/runner/work/_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T03:04:41.6066150Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path \/Users\/runner\/work\/_temp\/git\-credentials\-c6a9dc62\-3c36\-4c6d\-ab20\-2627f1b23983\.config
2026-10-05T03:04:41.6243670Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git.path
2026-10-05T03:04:41.6346550Z /github/runner_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T03:04:41.6707170Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git.path \/github\/runner_temp\/git\-credentials\-c6a9dc62\-3c36\-4c6d\-ab20\-2627f1b23983\.config
2026-10-05T03:04:41.6752660Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git/worktrees/*.path
2026-10-05T03:04:41.6755230Z /github/runner_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config
2026-10-05T03:04:41.6771790Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git/worktrees/*.path \/github\/runner_temp\/git\-credentials\-c6a9dc62\-3c36\-4c6d\-ab20\-2627f1b23983\.config
2026-10-05T03:04:41.6820390Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
2026-10-05T03:04:41.7588000Z Removing credentials config '/Users/runner/work/_temp/git-credentials-c6a9dc62-3c36-4c6d-ab20-2627f1b23983.config'
2026-10-05T03:04:41.7687760Z Cleaning up orphan processes
2026-10-05T03:04:42.5501320Z ##[warning]Node.js 20 is deprecated. The following actions target Node.js 20 but are being forced to run on Node.js 24: actions/upload-artifact@v4. For more information see: https://github.blog/changelog/2025-09-19-deprecation-of-node-20-on-github-actions-runners/

```

## ui-extraction.json

Local evidence: `.build/quantization-research/pack-context-foundation-v1/ui-extraction.json`; bytes: 802; SHA-256: `2558081c696d6a0e09e8e25f95527b50fb9b7937bbb3fb5e4a4a81ab90b2d548`.

```text
{
  "artifact_id": 11323152508,
  "run_id": 37256084608,
  "source_commit": "ceddcdf422d16b96fb69e0c7b3c2a120e54ae4a4",
  "archive_bytes": 14014778,
  "archive_sha256": "3cf4086d0427ae070d3ef6d5bded0569514d847d49abd9a22032ffbcb4ff8282",
  "extracted": [
    {
      "entry": "sevra-memory-ui/light-automatic.png",
      "bytes": 219151,
      "sha256": "2adaddcf23be3505e64a8f4a6f8dc6d6bfcb8f14633aa8008cdc1777ab2dc3c5"
    },
    {
      "entry": "sevra-memory-ui/dark-unloaded-automatic.png",
      "bytes": 217731,
      "sha256": "0c4f830ee57468d529a48aa022cef7c38d10e652656a84fd832a72858cfd53af"
    },
    {
      "entry": "sevra-memory-ui/system-corrupt-pending-settings.png",
      "bytes": 275600,
      "sha256": "d49771cc124829da35a91f8b7358f313b3edbd02dd317c959f4137dcb79cee46"
    }
  ]
}

```

## visual-review.json

Local evidence: `.build/quantization-research/pack-context-foundation-v1/visual-review.json`; bytes: 450; SHA-256: `294ce3b304037b3cd49398b6526ba0fd194f723fa2170e798b7f6e20f138a7aa`.

```text
{
  "manual_review": [
    "light-automatic.png",
    "dark-unloaded-automatic.png",
    "system-corrupt-pending-settings.png"
  ],
  "result": "Readable controls and wrapped status text without clipping. Loaded Auto shows unverified speed; unloaded Auto describes future selection. Failed pending settings retain the custom choice, error and explicit repair/retry controls. Values are synthetic UI fixtures, not hardware or performance evidence."
}

```

## loaded-profile-telemetry-native-complete-v1.json

Local evidence: `.build/quantization-research/loaded-profile-telemetry-native-complete-v1.json`; bytes: 3057; SHA-256: `5e6fd8929130d0bab00744fbe8d1c34f604ef5f3ed8e94e2081e0d4c629af15d`.

```text
{"conclusion":"success","headSha":"7ffef8ad3ba7ded6ab5c40ad3b93f2fd6b46fa0d","jobs":[{"completedAt":"2026-10-05T02:37:05Z","conclusion":"success","databaseId":111591082160,"name":"xcode","startedAt":"2026-10-05T02:28:37Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:28:39Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:28:38Z","status":"completed"},{"completedAt":"2026-10-05T02:29:01Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:28:39Z","status":"completed"},{"completedAt":"2026-10-05T02:29:01Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T02:29:01Z","status":"completed"},{"completedAt":"2026-10-05T02:29:04Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T02:29:01Z","status":"completed"},{"completedAt":"2026-10-05T02:37:01Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T02:29:04Z","status":"completed"},{"completedAt":"2026-10-05T02:37:02Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T02:37:01Z","status":"completed"},{"completedAt":"2026-10-05T02:37:03Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T02:37:02Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37255345401/job/111591082160"},{"completedAt":"2026-10-05T02:52:07Z","conclusion":"success","databaseId":111591082250,"name":"checks","startedAt":"2026-10-05T02:26:13Z","status":"completed","steps":[{"completedAt":"2026-10-05T02:26:14Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T02:26:13Z","status":"completed"},{"completedAt":"2026-10-05T02:26:31Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T02:26:14Z","status":"completed"},{"completedAt":"2026-10-05T02:26:31Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T02:26:31Z","status":"completed"},{"completedAt":"2026-10-05T02:26:31Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T02:26:31Z","status":"completed"},{"completedAt":"2026-10-05T02:52:01Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T02:26:31Z","status":"completed"},{"completedAt":"2026-10-05T02:52:03Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T02:52:01Z","status":"completed"},{"completedAt":"2026-10-05T02:52:04Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T02:52:03Z","status":"completed"},{"completedAt":"2026-10-05T02:52:04Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T02:52:04Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37255345401/job/111591082250"}],"status":"completed"}

```

## loaded-profile-telemetry-native-checks-v1.log

Local evidence: `.build/quantization-research/loaded-profile-telemetry-native-checks-v1.log`; bytes: 183865; SHA-256: `5e4b05eaa0237eed770cab08c13ab91ce91b558c3c3a4804977c4064ef5bb603`.

```text
﻿2026-10-05T02:26:13.8766270Z Current runner version: '2.337.0'
2026-10-05T02:26:13.8801590Z ##[group]Runner Image Provisioner
2026-10-05T02:26:13.8803040Z Hosted Compute Agent
2026-10-05T02:26:13.8804010Z Version: 20260828.587
2026-10-05T02:26:13.8805120Z Commit: abac92662cab4cc7352de4f9f9d2e2419aad9c29
2026-10-05T02:26:13.8806460Z Build Date: 2026-08-28T16:44:25Z
2026-10-05T02:26:13.8807650Z Worker ID: {5122a383-c316-4a1b-80a0-034b6d04105a}
2026-10-05T02:26:13.8808910Z Azure Region: westus
2026-10-05T02:26:13.8809880Z ##[endgroup]
2026-10-05T02:26:13.8812820Z ##[group]Operating System
2026-10-05T02:26:13.8813310Z macOS
2026-10-05T02:26:13.8813640Z 26.6.2
2026-10-05T02:26:13.8814080Z 25G83
2026-10-05T02:26:13.8814420Z ##[endgroup]
2026-10-05T02:26:13.8814780Z ##[group]Runner Image
2026-10-05T02:26:13.8815190Z Image: macos-26-arm64
2026-10-05T02:26:13.8815560Z Version: 20260907.0351.1
2026-10-05T02:26:13.8816500Z Included Software: https://github.com/actions/runner-images/blob/macos-26-arm64/20260907.0351/images/macos/macos-26-arm64-Readme.md
2026-10-05T02:26:13.8817750Z Image Release: https://github.com/actions/runner-images/releases/tag/macos-26-arm64%2F20260907.0351
2026-10-05T02:26:13.8818470Z ##[endgroup]
2026-10-05T02:26:13.8819290Z ##[group]GITHUB_TOKEN Permissions
2026-10-05T02:26:13.8821250Z Contents: read
2026-10-05T02:26:13.8821680Z Metadata: read
2026-10-05T02:26:13.8822030Z ##[endgroup]
2026-10-05T02:26:13.8824820Z Secret source: Actions
2026-10-05T02:26:13.8825980Z Cache mode: write
2026-10-05T02:26:13.8826500Z Prepare workflow directory
2026-10-05T02:26:13.9093130Z Prepare all required actions
2026-10-05T02:26:13.9133580Z Getting action download info
2026-10-05T02:26:14.2187710Z Download action repository 'actions/checkout@v7' (SHA:3d3c42e5aac5ba805825da76410c181273ba90b1)
2026-10-05T02:26:14.4482480Z Download action repository 'actions/upload-artifact@v4' (SHA:ea165f8d65b6e75b540449e92b4886f43607fa02)
2026-10-05T02:26:14.6701690Z Complete job name: checks
2026-10-05T02:26:14.7142500Z ##[group]Run actions/checkout@v7
2026-10-05T02:26:14.7143030Z with:
2026-10-05T02:26:14.7143340Z   repository: carloslfu/slotstream
2026-10-05T02:26:14.7145670Z   token: ***
2026-10-05T02:26:14.7145970Z   ssh-strict: true
2026-10-05T02:26:14.7146270Z   ssh-user: git
2026-10-05T02:26:14.7146580Z   persist-credentials: true
2026-10-05T02:26:14.7146900Z   clean: true
2026-10-05T02:26:14.7147220Z   sparse-checkout-cone-mode: true
2026-10-05T02:26:14.7147570Z   fetch-depth: 1
2026-10-05T02:26:14.7147870Z   fetch-tags: false
2026-10-05T02:26:14.7148170Z   show-progress: true
2026-10-05T02:26:14.7148480Z   lfs: false
2026-10-05T02:26:14.7148770Z   submodules: false
2026-10-05T02:26:14.7149070Z   set-safe-directory: true
2026-10-05T02:26:14.7149410Z   allow-unsafe-pr-checkout: false
2026-10-05T02:26:14.7149860Z ##[endgroup]
2026-10-05T02:26:15.0976550Z Syncing repository: carloslfu/slotstream
2026-10-05T02:26:15.0978250Z ##[group]Getting Git version info
2026-10-05T02:26:15.0978900Z Working directory is '/Users/runner/work/slotstream/slotstream'
2026-10-05T02:26:15.0979820Z [command]/opt/homebrew/bin/git version
2026-10-05T02:26:15.1488350Z git version 2.55.0
2026-10-05T02:26:15.1502240Z ##[endgroup]
2026-10-05T02:26:15.1507760Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/6c857072-b4a5-4751-8dda-ae2af8e5771b/.gitconfig'
2026-10-05T02:26:15.1513460Z Temporarily overriding HOME='/Users/runner/work/_temp/6c857072-b4a5-4751-8dda-ae2af8e5771b' before making global git config changes
2026-10-05T02:26:15.1514440Z Adding repository directory to the temporary git global config as a safe directory
2026-10-05T02:26:15.1516980Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
2026-10-05T02:26:15.1714100Z Deleting the contents of '/Users/runner/work/slotstream/slotstream'
2026-10-05T02:26:15.1721910Z ##[group]Determining repository object format
2026-10-05T02:26:15.1724960Z ##[endgroup]
2026-10-05T02:26:15.1726800Z ##[group]Initializing the repository
2026-10-05T02:26:15.1727560Z [command]/opt/homebrew/bin/git init /Users/runner/work/slotstream/slotstream
2026-10-05T02:26:15.1908390Z hint: Using 'master' as the name for the initial branch. This default branch name
2026-10-05T02:26:15.1909640Z hint: will change to "main" in Git 3.0. To configure the initial branch name
2026-10-05T02:26:15.1910590Z hint: to use in all of your new repositories, which will suppress this warning,
2026-10-05T02:26:15.1913890Z hint: call:
2026-10-05T02:26:15.1916360Z hint:
2026-10-05T02:26:15.1916900Z hint: 	git config --global init.defaultBranch <name>
2026-10-05T02:26:15.1923920Z hint:
2026-10-05T02:26:15.1925170Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2026-10-05T02:26:15.1925850Z hint: 'development'. The just-created branch can be renamed via this command:
2026-10-05T02:26:15.1926400Z hint:
2026-10-05T02:26:15.1926760Z hint: 	git branch -m <name>
2026-10-05T02:26:15.1927200Z hint:
2026-10-05T02:26:15.1927700Z hint: Disable this message with "git config set advice.defaultBranchName false"
2026-10-05T02:26:15.1928450Z Initialized empty Git repository in /Users/runner/work/slotstream/slotstream/.git/
2026-10-05T02:26:15.1929800Z [command]/opt/homebrew/bin/git remote add origin https://github.com/carloslfu/slotstream
2026-10-05T02:26:15.1984470Z ##[endgroup]
2026-10-05T02:26:15.1985180Z ##[group]Disabling automatic garbage collection
2026-10-05T02:26:15.1987580Z [command]/opt/homebrew/bin/git config --local gc.auto 0
2026-10-05T02:26:15.2047550Z ##[endgroup]
2026-10-05T02:26:15.2048260Z ##[group]Setting up auth
2026-10-05T02:26:15.2048670Z Removing SSH command configuration
2026-10-05T02:26:15.2052580Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
2026-10-05T02:26:15.2112810Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2026-10-05T02:26:15.2977050Z Removing HTTP extra header
2026-10-05T02:26:15.2979470Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2026-10-05T02:26:15.3038260Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2026-10-05T02:26:15.4599420Z Removing includeIf entries pointing to credentials config files
2026-10-05T02:26:15.4703990Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
2026-10-05T02:26:15.5009590Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
2026-10-05T02:26:15.6132890Z [command]/opt/homebrew/bin/git config --file /Users/runner/work/_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config http.https://github.com/.extraheader AUTHORIZATION: basic ***
2026-10-05T02:26:15.6135420Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git.path /Users/runner/work/_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:26:15.6169930Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path /Users/runner/work/_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:26:15.6240870Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git.path /github/runner_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:26:15.6308950Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git/worktrees/*.path /github/runner_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:26:15.6379060Z ##[endgroup]
2026-10-05T02:26:15.6379780Z ##[group]Fetching the repository
2026-10-05T02:26:15.6383840Z [command]/opt/homebrew/bin/git -c protocol.version=2 fetch --no-tags --prune --no-recurse-submodules --depth=1 origin +7ffef8ad3ba7ded6ab5c40ad3b93f2fd6b46fa0d:refs/remotes/origin/main
2026-10-05T02:26:26.0118000Z From https://github.com/carloslfu/slotstream
2026-10-05T02:26:26.0119510Z  * [new ref]         7ffef8ad3ba7ded6ab5c40ad3b93f2fd6b46fa0d -> origin/main
2026-10-05T02:26:26.0140720Z [command]/opt/homebrew/bin/git branch --list --remote origin/main
2026-10-05T02:26:26.0239530Z   origin/main
2026-10-05T02:26:26.0247410Z [command]/opt/homebrew/bin/git rev-parse refs/remotes/origin/main
2026-10-05T02:26:26.0331070Z 7ffef8ad3ba7ded6ab5c40ad3b93f2fd6b46fa0d
2026-10-05T02:26:26.0334960Z ##[endgroup]
2026-10-05T02:26:26.0335470Z ##[group]Determining the checkout info
2026-10-05T02:26:26.0335890Z ##[endgroup]
2026-10-05T02:26:26.0339600Z [command]/opt/homebrew/bin/git sparse-checkout disable
2026-10-05T02:26:26.0451740Z [command]/opt/homebrew/bin/git config --local --unset-all extensions.worktreeConfig
2026-10-05T02:26:26.0535360Z ##[group]Checking out the ref
2026-10-05T02:26:26.0538120Z [command]/opt/homebrew/bin/git checkout --progress --force -B main refs/remotes/origin/main
2026-10-05T02:26:27.2727220Z Updating files:  45% (1329/2891)
2026-10-05T02:26:27.4004410Z Updating files:  46% (1330/2891)
2026-10-05T02:26:27.5022570Z Updating files:  47% (1359/2891)
2026-10-05T02:26:27.7258900Z Updating files:  48% (1388/2891)
2026-10-05T02:26:27.8173300Z Updating files:  49% (1417/2891)
2026-10-05T02:26:27.8217810Z Updating files:  50% (1446/2891)
2026-10-05T02:26:27.8281640Z Updating files:  51% (1475/2891)
2026-10-05T02:26:27.8337660Z Updating files:  52% (1504/2891)
2026-10-05T02:26:27.8368240Z Updating files:  53% (1533/2891)
2026-10-05T02:26:27.8417270Z Updating files:  54% (1562/2891)
2026-10-05T02:26:27.8460790Z Updating files:  55% (1591/2891)
2026-10-05T02:26:27.8498370Z Updating files:  56% (1619/2891)
2026-10-05T02:26:27.8524780Z Updating files:  57% (1648/2891)
2026-10-05T02:26:27.8571120Z Updating files:  58% (1677/2891)
2026-10-05T02:26:27.8607540Z Updating files:  59% (1706/2891)
2026-10-05T02:26:27.8634880Z Updating files:  60% (1735/2891)
2026-10-05T02:26:27.8692430Z Updating files:  61% (1764/2891)
2026-10-05T02:26:27.8719260Z Updating files:  62% (1793/2891)
2026-10-05T02:26:27.8758680Z Updating files:  63% (1822/2891)
2026-10-05T02:26:27.8811400Z Updating files:  64% (1851/2891)
2026-10-05T02:26:27.8848750Z Updating files:  65% (1880/2891)
2026-10-05T02:26:27.8884800Z Updating files:  66% (1909/2891)
2026-10-05T02:26:27.8922280Z Updating files:  67% (1937/2891)
2026-10-05T02:26:27.9312510Z Updating files:  68% (1966/2891)
2026-10-05T02:26:27.9662940Z Updating files:  69% (1995/2891)
2026-10-05T02:26:27.9716270Z Updating files:  70% (2024/2891)
2026-10-05T02:26:28.0288020Z Updating files:  71% (2053/2891)
2026-10-05T02:26:28.0799390Z Updating files:  72% (2082/2891)
2026-10-05T02:26:28.2323860Z Updating files:  72% (2091/2891)
2026-10-05T02:26:28.3848250Z Updating files:  73% (2111/2891)
2026-10-05T02:26:28.4565400Z Updating files:  74% (2140/2891)
2026-10-05T02:26:28.5956650Z Updating files:  75% (2169/2891)
2026-10-05T02:26:28.6992880Z Updating files:  76% (2198/2891)
2026-10-05T02:26:28.9356380Z Updating files:  77% (2227/2891)
2026-10-05T02:26:28.9490640Z Updating files:  78% (2255/2891)
2026-10-05T02:26:29.0695820Z Updating files:  79% (2284/2891)
2026-10-05T02:26:29.0903830Z Updating files:  79% (2308/2891)
2026-10-05T02:26:29.1943210Z Updating files:  80% (2313/2891)
2026-10-05T02:26:29.2515630Z Updating files:  81% (2342/2891)
2026-10-05T02:26:29.3814780Z Updating files:  82% (2371/2891)
2026-10-05T02:26:29.4936200Z Updating files:  83% (2400/2891)
2026-10-05T02:26:29.6879120Z Updating files:  84% (2429/2891)
2026-10-05T02:26:29.9901140Z Updating files:  85% (2458/2891)
2026-10-05T02:26:30.0775830Z Updating files:  86% (2487/2891)
2026-10-05T02:26:30.2207920Z Updating files:  86% (2500/2891)
2026-10-05T02:26:30.3600340Z Updating files:  87% (2516/2891)
2026-10-05T02:26:30.3881290Z Updating files:  88% (2545/2891)
2026-10-05T02:26:30.3914160Z Updating files:  89% (2573/2891)
2026-10-05T02:26:30.3952560Z Updating files:  90% (2602/2891)
2026-10-05T02:26:30.4023680Z Updating files:  91% (2631/2891)
2026-10-05T02:26:30.4111910Z Updating files:  92% (2660/2891)
2026-10-05T02:26:30.4156100Z Updating files:  93% (2689/2891)
2026-10-05T02:26:30.4896070Z Updating files:  94% (2718/2891)
2026-10-05T02:26:30.6664610Z Updating files:  95% (2747/2891)
2026-10-05T02:26:30.8112530Z Updating files:  96% (2776/2891)
2026-10-05T02:26:30.8978480Z Updating files:  97% (2805/2891)
2026-10-05T02:26:30.9407710Z Updating files:  98% (2834/2891)
2026-10-05T02:26:30.9497650Z Updating files:  99% (2863/2891)
2026-10-05T02:26:30.9498590Z Updating files: 100% (2891/2891)
2026-10-05T02:26:30.9499480Z Updating files: 100% (2891/2891), done.
2026-10-05T02:26:30.9601080Z Switched to a new branch 'main'
2026-10-05T02:26:30.9608610Z branch 'main' set up to track 'origin/main'.
2026-10-05T02:26:31.0013210Z ##[endgroup]
2026-10-05T02:26:31.0021360Z [command]/opt/homebrew/bin/git log -1 --format=%H
2026-10-05T02:26:31.0140110Z 7ffef8ad3ba7ded6ab5c40ad3b93f2fd6b46fa0d
2026-10-05T02:26:31.0695960Z ##[group]Run sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
2026-10-05T02:26:31.0696600Z [36;1msudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"[0m
2026-10-05T02:26:31.0753250Z shell: /bin/bash -e {0}
2026-10-05T02:26:31.0754120Z ##[endgroup]
2026-10-05T02:26:31.2484150Z ##[group]Run Tools/dbmd_install.sh
2026-10-05T02:26:31.2484910Z [36;1mTools/dbmd_install.sh[0m
2026-10-05T02:26:31.2528430Z shell: /bin/bash -e {0}
2026-10-05T02:26:31.2528890Z ##[endgroup]
2026-10-05T02:26:31.7450170Z installed dbmd 0.14.0 to /Users/runner/.dbmd/bin/dbmd
2026-10-05T02:26:31.7647220Z ##[group]Run bash Tools/check_sevra_mac.sh
2026-10-05T02:26:31.7647600Z [36;1mbash Tools/check_sevra_mac.sh[0m
2026-10-05T02:26:31.7707170Z shell: /bin/bash -e {0}
2026-10-05T02:26:31.7707430Z env:
2026-10-05T02:26:31.7707610Z   SEVRA_CHECKS_OCR_OPTIONAL: 1
2026-10-05T02:26:31.7707830Z ##[endgroup]
2026-10-05T02:26:47.1219790Z Fetching https://github.com/ml-explore/mlx-swift.git
2026-10-05T02:26:47.1322610Z Fetching https://github.com/apple/swift-asn1.git
2026-10-05T02:26:47.5712230Z [1/1986] Fetching swift-asn1
2026-10-05T02:26:48.0373650Z [1987/19049] Fetching swift-asn1, mlx-swift
2026-10-05T02:26:48.7920460Z Fetched https://github.com/ml-explore/mlx-swift.git from cache (1.68s)
2026-10-05T02:26:48.7936580Z Fetched https://github.com/apple/swift-asn1.git from cache (1.68s)
2026-10-05T02:26:48.8033790Z Fetching https://github.com/huggingface/swift-jinja.git
2026-10-05T02:26:48.8043570Z Fetching https://github.com/ibireme/yyjson.git
2026-10-05T02:26:49.3273100Z [1/1376] Fetching swift-jinja
2026-10-05T02:26:49.4535610Z [1377/6375] Fetching swift-jinja, yyjson
2026-10-05T02:26:50.0785750Z Fetched https://github.com/huggingface/swift-jinja.git from cache (1.27s)
2026-10-05T02:26:50.0787380Z Fetched https://github.com/ibireme/yyjson.git from cache (1.28s)
2026-10-05T02:26:50.0901510Z Fetching https://github.com/apple/swift-crypto.git
2026-10-05T02:26:50.0904470Z Fetching https://github.com/swiftlang/swift-cmark.git
2026-10-05T02:26:50.7865840Z [1/18572] Fetching swift-crypto
2026-10-05T02:26:51.3176900Z [559/37185] Fetching swift-crypto, swift-cmark
2026-10-05T02:26:55.6267790Z Fetched https://github.com/apple/swift-crypto.git from cache (5.54s)
2026-10-05T02:26:55.6283560Z Fetched https://github.com/swiftlang/swift-cmark.git from cache (5.54s)
2026-10-05T02:26:55.6393520Z Fetching https://github.com/huggingface/swift-huggingface.git
2026-10-05T02:26:55.6395100Z Fetching https://github.com/mattt/EventSource.git
2026-10-05T02:26:56.0398500Z [1/303] Fetching eventsource
2026-10-05T02:26:56.1146230Z [304/3110] Fetching eventsource, swift-huggingface
2026-10-05T02:26:56.2603500Z Fetched https://github.com/huggingface/swift-huggingface.git from cache (0.62s)
2026-10-05T02:26:56.2605560Z Fetched https://github.com/mattt/EventSource.git from cache (0.62s)
2026-10-05T02:26:56.2703350Z Fetching https://github.com/apple/swift-argument-parser.git
2026-10-05T02:26:56.2712620Z Fetching https://github.com/apple/swift-numerics
2026-10-05T02:26:56.7552240Z [1/6658] Fetching swift-numerics
2026-10-05T02:26:56.8412490Z [1733/25705] Fetching swift-numerics, swift-argument-parser
2026-10-05T02:26:57.4340580Z Fetched https://github.com/apple/swift-argument-parser.git from cache (1.16s)
2026-10-05T02:26:57.4350660Z Fetched https://github.com/apple/swift-numerics from cache (1.17s)
2026-10-05T02:26:57.4464100Z Fetching https://github.com/apple/swift-collections.git
2026-10-05T02:26:57.4466230Z Fetching https://github.com/swiftlang/swift-markdown.git
2026-10-05T02:26:58.0339620Z [1/7763] Fetching swift-markdown
2026-10-05T02:26:58.2035600Z [7764/36301] Fetching swift-markdown, swift-collections
2026-10-05T02:26:59.3205240Z Fetched https://github.com/apple/swift-collections.git from cache (1.88s)
2026-10-05T02:26:59.3214350Z Fetched https://github.com/swiftlang/swift-markdown.git from cache (1.87s)
2026-10-05T02:26:59.3293470Z Fetching https://github.com/huggingface/swift-transformers.git
2026-10-05T02:26:59.7927010Z [1/7084] Fetching swift-transformers
2026-10-05T02:27:00.1291200Z Fetched https://github.com/huggingface/swift-transformers.git from cache (0.79s)
2026-10-05T02:27:00.1610590Z Creating working copy for https://github.com/ml-explore/mlx-swift.git
2026-10-05T02:27:00.1718670Z Creating working copy for https://github.com/ibireme/yyjson.git
2026-10-05T02:27:00.2694580Z Creating working copy for https://github.com/apple/swift-asn1.git
2026-10-05T02:27:00.6398660Z Working copy of https://github.com/apple/swift-asn1.git resolved at 1.7.1
2026-10-05T02:27:00.6508580Z Creating working copy for https://github.com/apple/swift-crypto.git
2026-10-05T02:27:00.7811380Z Working copy of https://github.com/ibireme/yyjson.git resolved at 0.12.0
2026-10-05T02:27:00.8831720Z Creating working copy for https://github.com/swiftlang/swift-cmark.git
2026-10-05T02:27:01.1439050Z Working copy of https://github.com/swiftlang/swift-cmark.git resolved at 0.8.0
2026-10-05T02:27:01.1548240Z Creating working copy for https://github.com/mattt/EventSource.git
2026-10-05T02:27:01.2194290Z Working copy of https://github.com/mattt/EventSource.git resolved at 1.5.1
2026-10-05T02:27:01.2635120Z Creating working copy for https://github.com/huggingface/swift-huggingface.git
2026-10-05T02:27:01.2945160Z Working copy of https://github.com/apple/swift-crypto.git resolved at 4.5.1
2026-10-05T02:27:01.2947440Z Creating working copy for https://github.com/apple/swift-argument-parser.git
2026-10-05T02:27:01.3717810Z Working copy of https://github.com/huggingface/swift-huggingface.git resolved at 0.9.0
2026-10-05T02:27:01.4051230Z Creating working copy for https://github.com/apple/swift-numerics
2026-10-05T02:27:01.4363300Z Working copy of https://github.com/apple/swift-argument-parser.git resolved at 1.8.2
2026-10-05T02:27:01.4364780Z Creating working copy for https://github.com/swiftlang/swift-markdown.git
2026-10-05T02:27:01.4935520Z Working copy of https://github.com/apple/swift-numerics resolved at 1.1.1
2026-10-05T02:27:01.5270830Z Creating working copy for https://github.com/huggingface/swift-transformers.git
2026-10-05T02:27:01.5675710Z Working copy of https://github.com/swiftlang/swift-markdown.git resolved at 0.8.0
2026-10-05T02:27:01.5677350Z Creating working copy for https://github.com/huggingface/swift-jinja.git
2026-10-05T02:27:01.6602880Z Working copy of https://github.com/huggingface/swift-transformers.git resolved at 1.3.3
2026-10-05T02:27:01.6757110Z Working copy of https://github.com/huggingface/swift-jinja.git resolved at 2.4.2
2026-10-05T02:27:01.6861630Z Creating working copy for https://github.com/apple/swift-collections.git
2026-10-05T02:27:01.9924990Z Working copy of https://github.com/apple/swift-collections.git resolved at 1.6.0
2026-10-05T02:27:08.9190670Z Working copy of https://github.com/ml-explore/mlx-swift.git resolved at ab924c82ead3b970caaa1c0ac11171de23f0305a
2026-10-05T02:27:25.9687940Z Building for production...
2026-10-05T02:27:26.2167050Z [0/250] Compiling unary.cpp
2026-10-05T02:27:26.2192890Z [1/250] Compiling unary_ops.cpp
2026-10-05T02:27:26.4093980Z [2/250] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:27:26.4100670Z [3/250] Copying t5_tokenizer_config.json
2026-10-05T02:27:26.4102380Z [4/250] Copying gpt2_tokenizer_config.json
2026-10-05T02:27:26.4102860Z [5/250] Copying PrivacyInfo.xcprivacy
2026-10-05T02:27:26.8445250Z [6/250] Compiling cmark-gfm-extensions tasklist.c
2026-10-05T02:27:26.9357070Z [7/250] Compiling cmark-gfm-extensions tagfilter.c
2026-10-05T02:27:27.1310290Z [8/250] Compiling cmark-gfm-extensions table.c
2026-10-05T02:27:27.1955190Z [9/250] Compiling cmark-gfm-extensions strikethrough.c
2026-10-05T02:27:27.2824020Z [10/250] Compiling cmark-gfm-extensions ext_scanners.c
2026-10-05T02:27:27.3338040Z [11/250] Compiling cmark-gfm-extensions core-extensions.c
2026-10-05T02:27:27.8073310Z [12/250] Compiling cmark-gfm-extensions autolink.c
2026-10-05T02:27:27.8859500Z [13/250] Compiling cmark-gfm xml.c
2026-10-05T02:27:28.7765950Z [14/250] Compiling cmark-gfm utf8.c
2026-10-05T02:27:28.8449180Z [15/250] Compiling cmark-gfm syntax_extension.c
2026-10-05T02:27:29.6288470Z [16/250] Compiling cmark-gfm scanners.c
2026-10-05T02:27:29.7052220Z [17/250] Compiling cmark-gfm render.c
2026-10-05T02:27:29.7826580Z [18/250] Compiling cmark-gfm registry.c
2026-10-05T02:27:29.8744910Z [19/250] Compiling cmark-gfm references.c
2026-10-05T02:27:29.9505970Z [20/250] Compiling cmark-gfm plugin.c
2026-10-05T02:27:30.0764720Z [21/250] Compiling cmark-gfm plaintext.c
2026-10-05T02:27:30.5455370Z [22/250] Compiling cmark-gfm node.c
2026-10-05T02:27:30.6056610Z [23/250] Compiling cmark-gfm map.c
2026-10-05T02:27:30.6762270Z [24/250] Compiling cmark-gfm man.c
2026-10-05T02:27:30.7266350Z [25/250] Compiling cmark-gfm linked_list.c
2026-10-05T02:27:30.8118270Z [26/250] Compiling cmark-gfm latex.c
2026-10-05T02:27:30.8776850Z [27/250] Compiling cmark-gfm iterator.c
2026-10-05T02:27:31.2445910Z [28/250] Compiling cmark-gfm inlines.c
2026-10-05T02:27:31.3507840Z [29/250] Compiling cmark-gfm html.c
2026-10-05T02:27:31.4560610Z [30/250] Compiling cmark-gfm houdini_html_u.c
2026-10-05T02:27:31.5151210Z [31/250] Compiling cmark-gfm houdini_html_e.c
2026-10-05T02:27:31.5766140Z [32/250] Compiling cmark-gfm houdini_href_e.c
2026-10-05T02:27:31.6300590Z [33/250] Compiling cmark-gfm footnotes.c
2026-10-05T02:27:31.7395780Z [34/250] Compiling cmark-gfm commonmark.c
2026-10-05T02:27:31.7875110Z [35/250] Compiling cmark-gfm cmark_ctype.c
2026-10-05T02:27:31.8383680Z [36/250] Compiling cmark-gfm cmark.c
2026-10-05T02:27:31.9184600Z [37/250] Compiling cmark-gfm buffer.c
2026-10-05T02:27:32.0981150Z [38/250] Compiling yyjson.c
2026-10-05T02:27:32.1608540Z [39/250] Compiling cmark-gfm arena.c
2026-10-05T02:27:32.1837540Z [40/250] Compiling _NumericsShims _NumericsShims.c
2026-10-05T02:27:32.1852100Z [41/250] Write sources
2026-10-05T02:27:32.2898810Z [48/250] Compiling cmark-gfm blocks.c
2026-10-05T02:27:32.2905550Z [49/250] Write sources
2026-10-05T02:27:32.9558000Z [59/252] Compiling RealModule AlgebraicField.swift
2026-10-05T02:27:32.9578710Z [59/252] Write sources
2026-10-05T02:27:33.6737750Z [64/253] Compiling InternalCollectionsUtilities Debugging.swift
2026-10-05T02:27:37.9099880Z [65/254] Compiling Crypto AES-GCM.swift
2026-10-05T02:27:38.4139930Z [66/255] Compiling EventSource AsyncEventsSequence.swift
2026-10-05T02:27:38.4240850Z [66/255] Write sources
2026-10-05T02:27:42.4753730Z [68/256] Compiling OrderedCollections _HashTable+Bucket.swift
2026-10-05T02:27:43.1275640Z [69/257] Compiling ComplexModule Complex+AdditiveArithmetic.swift
2026-10-05T02:28:06.6715260Z [70/258] Compiling HuggingFace AccessRequest.swift
2026-10-05T02:28:06.8833640Z [71/259] Compiling Numerics Numerics.swift
2026-10-05T02:28:06.9436360Z [71/259] Compiling version.cpp
2026-10-05T02:28:07.4114790Z [73/259] Compiling Jinja AST.swift
2026-10-05T02:28:09.3934680Z [73/259] Compiling utils.cpp
2026-10-05T02:28:12.4845860Z [74/260] Compiling transforms.cpp
2026-10-05T02:28:13.3944440Z [75/260] Compiling stream.cpp
2026-10-05T02:28:14.5650060Z [76/260] Compiling scheduler.cpp
2026-10-05T02:28:16.6694100Z [77/260] Compiling random.cpp
2026-10-05T02:28:19.5586120Z [79/260] Compiling Hub BinaryDistinct.swift
2026-10-05T02:28:26.0188720Z [79/260] Compiling primitives.cpp
2026-10-05T02:28:33.4745970Z [80/261] Compiling ops.cpp
2026-10-05T02:28:36.3965250Z [81/261] Compiling linalg.cpp
2026-10-05T02:28:36.7790470Z [83/261] Compiling Tokenizers BPETokenizer.swift
2026-10-05T02:28:37.6341890Z [83/261] Compiling no_gguf.cpp
2026-10-05T02:28:39.4239300Z [85/262] Compiling Generation Decoders.swift
2026-10-05T02:28:40.0334650Z [85/262] Compiling safetensors.cpp
2026-10-05T02:28:41.3599060Z [86/263] Compiling load.cpp
2026-10-05T02:28:41.8345540Z [88/263] Compiling Models LanguageModel.swift
2026-10-05T02:28:42.6017980Z [88/263] Compiling graph_utils.cpp
2026-10-05T02:28:43.3181180Z [89/263] Compiling fft.cpp
2026-10-05T02:28:45.4207390Z [90/263] Compiling fast.cpp
2026-10-05T02:28:48.1201800Z [91/263] Compiling einsum.cpp
2026-10-05T02:28:48.8201430Z [92/263] Compiling dtype_utils.cpp
2026-10-05T02:28:49.4428270Z [93/263] Compiling dtype.cpp
2026-10-05T02:28:50.2337390Z [94/263] Compiling utils.cpp
2026-10-05T02:28:50.9227620Z [95/263] Compiling no_ring.cpp
2026-10-05T02:28:52.3343370Z [96/263] Compiling primitives.cpp
2026-10-05T02:28:53.6444340Z [97/263] Compiling export.cpp
2026-10-05T02:28:53.7205280Z [98/263] Compiling ops.cpp
2026-10-05T02:28:54.3233180Z [99/263] Compiling no_nccl.cpp
2026-10-05T02:28:54.4155740Z [100/263] Compiling no_mpi.cpp
2026-10-05T02:28:55.3108760Z [101/263] Compiling no_jaccl.cpp
2026-10-05T02:28:55.6238970Z [102/263] Compiling distributed.cpp
2026-10-05T02:28:55.9883860Z [103/263] Compiling device.cpp
2026-10-05T02:28:57.6230630Z [104/263] Compiling utils.cpp
2026-10-05T02:28:59.2532390Z [105/263] Compiling compile.cpp
2026-10-05T02:28:59.3656020Z [106/263] Compiling unary.cpp
2026-10-05T02:29:01.0483550Z [107/263] Compiling ternary.cpp
2026-10-05T02:29:01.3154850Z [108/263] Compiling sort.cpp
2026-10-05T02:29:02.5083880Z [109/263] Compiling softmax.cpp
2026-10-05T02:29:02.9650330Z [110/263] Compiling slicing.cpp
2026-10-05T02:29:04.1300000Z [111/263] Compiling scan.cpp
2026-10-05T02:29:05.2487000Z [112/263] Compiling scaled_dot_product_attention.cpp
2026-10-05T02:29:05.9683900Z [113/263] Compiling rope.cpp
2026-10-05T02:29:06.9556240Z [114/263] Compiling resident.cpp
2026-10-05T02:29:08.1932780Z [115/263] Compiling reduce.cpp
2026-10-05T02:29:09.8753190Z [116/263] Compiling primitives.cpp
2026-10-05T02:29:09.9225980Z [117/263] Compiling quantized.cpp
2026-10-05T02:29:11.4299870Z [118/263] Compiling metal.cpp
2026-10-05T02:29:11.9590190Z [119/263] Compiling normalization.cpp
2026-10-05T02:29:13.5476570Z [120/263] Compiling logsumexp.cpp
2026-10-05T02:29:15.1616220Z [121/263] Compiling matmul.cpp
2026-10-05T02:29:16.7425280Z [122/263] Compiling jit_kernels.cpp
2026-10-05T02:29:17.2432140Z [123/263] Compiling indexing.cpp
2026-10-05T02:29:18.1914150Z [124/263] Compiling hadamard.cpp
2026-10-05T02:29:19.2235000Z [125/263] Compiling fence.cpp
2026-10-05T02:29:20.1804390Z [126/263] Compiling event.cpp
2026-10-05T02:29:21.4617920Z [127/263] Compiling eval.cpp
2026-10-05T02:29:21.9908070Z [128/263] Compiling fft.cpp
2026-10-05T02:29:22.5404260Z [129/263] Compiling distributed.cpp
2026-10-05T02:29:22.9865750Z [130/263] Compiling device_info.cpp
2026-10-05T02:29:24.5505460Z [131/263] Compiling custom_kernel.cpp
2026-10-05T02:29:25.0452370Z [132/263] Compiling device.cpp
2026-10-05T02:29:26.1059010Z [133/263] Compiling copy.cpp
2026-10-05T02:29:27.5693530Z [134/263] Compiling conv.cpp
2026-10-05T02:29:27.7081700Z [135/263] Compiling compiled.cpp
2026-10-05T02:29:28.8049620Z [136/263] Compiling allocator.cpp
2026-10-05T02:29:28.9640880Z [137/263] Compiling binary.cpp
2026-10-05T02:29:29.4655740Z [138/263] Compiling slicing.cpp
2026-10-05T02:29:29.8580570Z [139/263] Compiling primitives.cpp
2026-10-05T02:29:30.4054140Z [140/263] Compiling copy.cpp
2026-10-05T02:29:30.4656610Z [141/263] Compiling no_cuda.cpp
2026-10-05T02:29:30.5401060Z [142/263] Compiling threefry.cpp
2026-10-05T02:29:32.4021850Z [143/263] Compiling svd.cpp
2026-10-05T02:29:35.5325240Z [144/263] Compiling unary.cpp
2026-10-05T02:29:38.1449160Z [145/263] Compiling softmax.cpp
2026-10-05T02:29:40.5010360Z [146/263] Compiling select.cpp
2026-10-05T02:29:41.8057350Z [147/263] Compiling sort.cpp
2026-10-05T02:29:48.0972110Z [148/263] Compiling scan.cpp
2026-10-05T02:29:50.2832460Z [149/263] Compiling reduce.cpp
2026-10-05T02:29:51.9127170Z [150/263] Compiling qrf.cpp
2026-10-05T02:29:53.2480610Z [151/263] Compiling quantized.cpp
2026-10-05T02:29:53.6561040Z [152/263] Compiling primitives.cpp
2026-10-05T02:29:56.1284120Z [153/263] Compiling matmul.cpp
2026-10-05T02:29:56.4820320Z [154/263] Compiling masked_mm.cpp
2026-10-05T02:29:57.7384370Z [155/263] Compiling luf.cpp
2026-10-05T02:29:57.8656370Z [156/263] Compiling logsumexp.cpp
2026-10-05T02:29:59.2998890Z [157/263] Compiling inverse.cpp
2026-10-05T02:30:00.9744490Z [158/263] Compiling hadamard.cpp
2026-10-05T02:30:02.2096950Z [159/263] Compiling cblas.cpp
2026-10-05T02:30:03.4171510Z [160/263] Compiling bnns.cpp
2026-10-05T02:30:07.5082550Z [161/263] Compiling fft.cpp
2026-10-05T02:30:08.5553410Z [162/263] Compiling eval.cpp
2026-10-05T02:30:09.2593010Z [163/263] Compiling encoder.cpp
2026-10-05T02:30:11.2716020Z [164/263] Compiling eigh.cpp
2026-10-05T02:30:13.0650340Z [165/263] Compiling eig.cpp
2026-10-05T02:30:13.9345000Z [166/263] Compiling distributed.cpp
2026-10-05T02:30:14.3532220Z [167/263] Compiling device_info.cpp
2026-10-05T02:30:35.2315670Z [168/263] Compiling indexing.cpp
2026-10-05T02:30:38.0669090Z [169/263] Compiling copy.cpp
2026-10-05T02:30:40.1497770Z [170/263] Compiling cholesky.cpp
2026-10-05T02:30:40.4006090Z [171/263] Compiling conv.cpp
2026-10-05T02:30:42.4858850Z [172/263] Compiling arg_reduce.cpp
2026-10-05T02:30:43.4783130Z [173/263] Compiling utils.cpp
2026-10-05T02:30:44.3374460Z [174/263] Compiling slicing.cpp
2026-10-05T02:30:45.5477640Z [175/263] Compiling reduce.cpp
2026-10-05T02:30:47.0300100Z [176/263] Compiling metal_kernel.cpp
2026-10-05T02:30:48.2548930Z [177/263] Compiling load.cpp
2026-10-05T02:30:49.8577060Z [178/263] Compiling compiled.cpp
2026-10-05T02:30:51.4201330Z [179/263] Compiling common.cpp
2026-10-05T02:30:52.2395050Z [180/263] Compiling broadcasting.cpp
2026-10-05T02:30:53.7673020Z [181/263] Compiling array.cpp
2026-10-05T02:30:53.7899450Z [182/263] Compiling utils.cpp
2026-10-05T02:30:53.8083810Z [183/263] Compiling ternary_ops.cpp
2026-10-05T02:30:53.8287390Z [184/263] Compiling ternary.cpp
2026-10-05T02:30:53.8494690Z [185/263] Compiling steel_gemm_splitk_nax.cpp
2026-10-05T02:30:53.8677410Z [186/263] Compiling steel_gemm_splitk.cpp
2026-10-05T02:30:53.8864820Z [187/263] Compiling steel_gemm_segmented_nax.cpp
2026-10-05T02:30:53.9061880Z [188/263] Compiling steel_gemm_segmented.cpp
2026-10-05T02:30:53.9250480Z [189/263] Compiling steel_gemm_masked.cpp
2026-10-05T02:30:53.9426380Z [190/263] Compiling steel_gemm_gather_nax.cpp
2026-10-05T02:30:53.9611990Z [191/263] Compiling steel_gemm_gather.cpp
2026-10-05T02:30:53.9789740Z [192/263] Compiling steel_gemm_fused_nax.cpp
2026-10-05T02:30:53.9978390Z [193/263] Compiling steel_gemm_fused.cpp
2026-10-05T02:30:54.0158750Z [194/263] Compiling steel_conv_general.cpp
2026-10-05T02:30:54.0336090Z [195/263] Compiling steel_conv_3d.cpp
2026-10-05T02:30:54.0517430Z [196/263] Compiling steel_conv.cpp
2026-10-05T02:30:54.0733030Z [197/263] Compiling steel_attention_nax.cpp
2026-10-05T02:30:54.0918390Z [198/263] Compiling steel_attention.cpp
2026-10-05T02:30:54.1107060Z [199/263] Compiling sort.cpp
2026-10-05T02:30:54.1291070Z [200/263] Compiling softmax.cpp
2026-10-05T02:30:54.1483820Z [201/263] Compiling searchsorted.cpp
2026-10-05T02:30:54.1663820Z [202/263] Compiling scatter_axis.cpp
2026-10-05T02:30:54.1837950Z [203/263] Compiling scatter.cpp
2026-10-05T02:30:54.2019710Z [204/263] Compiling scan.cpp
2026-10-05T02:30:54.2196030Z [205/263] Compiling reduce_utils.cpp
2026-10-05T02:30:54.2378660Z [206/263] Compiling reduce.cpp
2026-10-05T02:30:54.2556360Z [207/263] Compiling quantized_utils.cpp
2026-10-05T02:30:54.2743270Z [208/263] Compiling quantized_nax.cpp
2026-10-05T02:30:54.2933880Z [209/263] Compiling quantized.cpp
2026-10-05T02:30:54.3111300Z [210/263] Compiling masked_scatter.cpp
2026-10-05T02:30:54.3297470Z [211/263] Compiling logsumexp.cpp
2026-10-05T02:30:54.3472800Z [212/263] Compiling hadamard.cpp
2026-10-05T02:30:54.3663850Z [213/263] Compiling gemv_masked.cpp
2026-10-05T02:30:54.3856250Z [214/263] Compiling gemv.cpp
2026-10-05T02:30:54.4040700Z [215/263] Compiling gemm_nax.cpp
2026-10-05T02:30:54.4233430Z [216/263] Compiling gemm.cpp
2026-10-05T02:30:54.4421150Z [217/263] Compiling gather_front.cpp
2026-10-05T02:30:54.4613130Z [218/263] Compiling gather_axis.cpp
2026-10-05T02:30:54.4790750Z [219/263] Compiling gather.cpp
2026-10-05T02:30:54.4973960Z [220/263] Compiling fp_quantized_nax.cpp
2026-10-05T02:30:54.5166130Z [221/263] Compiling fp_quantized.cpp
2026-10-05T02:30:54.5354530Z [222/263] Compiling fft.cpp
2026-10-05T02:30:54.5539960Z [223/263] Compiling copy.cpp
2026-10-05T02:30:54.5732280Z [224/263] Compiling conv.cpp
2026-10-05T02:30:54.5939580Z [225/263] Compiling compiled_preamble.cpp
2026-10-05T02:30:54.6124760Z [226/263] Compiling binary_two.cpp
2026-10-05T02:30:54.6300830Z [227/263] Compiling binary_ops.cpp
2026-10-05T02:30:54.6480580Z [228/263] Compiling binary.cpp
2026-10-05T02:30:54.6658110Z [229/263] Compiling arange.cpp
2026-10-05T02:30:55.8392270Z [230/263] Compiling jit_compiler_conditional.cpp
2026-10-05T02:30:57.5424430Z [231/263] Compiling compiled_conditional.cpp
2026-10-05T02:30:58.6029640Z [232/263] Compiling version.cpp
2026-10-05T02:31:00.2462730Z [233/263] Compiling vector.cpp
2026-10-05T02:31:01.6795830Z [234/263] Compiling transforms_impl.cpp
2026-10-05T02:31:03.0705210Z [235/263] Compiling transforms.cpp
2026-10-05T02:31:04.2916780Z [236/263] Compiling string.cpp
2026-10-05T02:31:05.5548880Z [237/263] Compiling stream.cpp
2026-10-05T02:31:07.0810230Z [238/263] Compiling random.cpp
2026-10-05T02:31:09.6614410Z [239/263] Compiling ops.cpp
2026-10-05T02:31:10.6480660Z [240/263] Compiling metal.cpp
2026-10-05T02:31:11.6905790Z [241/263] Compiling memory.cpp
2026-10-05T02:31:12.9058370Z [242/263] Compiling map.cpp
2026-10-05T02:31:13.9876260Z [243/263] Compiling linalg.cpp
2026-10-05T02:31:15.2858030Z [244/263] Compiling io_types.cpp
2026-10-05T02:31:16.5633060Z [245/263] Compiling io.cpp
2026-10-05T02:31:17.5717490Z [246/263] Compiling graph_utils.cpp
2026-10-05T02:31:18.8856190Z [247/263] Compiling fft.cpp
2026-10-05T02:31:20.4550200Z [248/263] Compiling fast.cpp
2026-10-05T02:31:21.9879940Z [249/263] Compiling export.cpp
2026-10-05T02:31:22.6711930Z [250/263] Compiling error.cpp
2026-10-05T02:31:24.2107430Z [251/263] Compiling device.cpp
2026-10-05T02:31:25.2777920Z [252/263] Compiling binary.cpp
2026-10-05T02:31:25.6465970Z [253/263] Compiling cuda.cpp
2026-10-05T02:31:26.3435690Z [254/263] Compiling compile.cpp
2026-10-05T02:31:27.1993680Z [255/263] Compiling closure.cpp
2026-10-05T02:31:28.7404110Z [256/263] Compiling Cmlx.m
2026-10-05T02:31:29.0868420Z [257/263] Compiling array.cpp
2026-10-05T02:31:29.4711740Z [258/263] Compiling CSlotpack slotpack.c
2026-10-05T02:31:29.5383170Z [259/263] Compiling CAtomic CAtomic.c
2026-10-05T02:31:31.1860440Z [260/264] Compiling format.cc
2026-10-05T02:31:43.9667840Z [262/265] Compiling Markdown ChildIndexPath.swift
2026-10-05T02:31:49.1250240Z [263/266] Compiling MLX ArrayAt.swift
2026-10-05T02:31:51.4840810Z [264/267] Compiling SevraPresentation ComposerSession.swift
2026-10-05T02:31:51.6791230Z [265/268] Compiling MLXFast MLXFast.swift
2026-10-05T02:31:55.2085830Z [266/268] Compiling MLXNN Activations.swift
2026-10-05T02:34:31.8459870Z [267/269] Compiling Slotstream AdaptiveSpeculation.swift
2026-10-05T02:34:31.8461800Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:34:31.8463520Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:34:31.8484870Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:34:31.8485430Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:34:31.8719170Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:34:31.8730920Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:34:31.8731790Z 109 |                     }
2026-10-05T02:34:31.8731930Z 
2026-10-05T02:34:31.8732670Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:34:31.8733560Z 34 |         lock.lock()
2026-10-05T02:34:31.8733900Z 35 |         defer { lock.unlock() }
2026-10-05T02:34:31.8734470Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:34:31.8735200Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:34:31.8735940Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:34:31.8736580Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:35:14.1660800Z [268/270] Compiling SevraRuntime Changes.swift
2026-10-05T02:35:45.7740650Z [269/271] Compiling SevraMac AppModel.swift
2026-10-05T02:35:45.7867110Z [269/271] Write Objects.LinkFileList
2026-10-05T02:35:55.3482970Z [270/271] Linking Sevra
2026-10-05T02:35:55.3688900Z Build of product 'Sevra' complete! (548.28s)
2026-10-05T02:36:08.6509450Z [0/1] Planning build
2026-10-05T02:36:08.7360690Z Building for production...
2026-10-05T02:36:08.7745270Z [0/5] Write sources
2026-10-05T02:36:09.9656020Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:36:11.2351460Z [3/5] Compiling SevraLocal main.swift
2026-10-05T02:36:11.2386900Z [3/5] Write Objects.LinkFileList
2026-10-05T02:36:19.5195790Z [4/5] Linking sevra-local
2026-10-05T02:36:19.5376370Z Build of product 'sevra-local' complete! (14.76s)
2026-10-05T02:36:20.6302750Z Building for production...
2026-10-05T02:36:21.5033910Z [0/4] Write sources
2026-10-05T02:36:22.6047980Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:36:29.6111880Z [3/5] Compiling SevraComposerChecks ComposerChecks.swift
2026-10-05T02:36:29.6168160Z [3/5] Write Objects.LinkFileList
2026-10-05T02:36:39.5688210Z [4/5] Linking sevra-composer-checks
2026-10-05T02:36:39.5798620Z Build of product 'sevra-composer-checks' complete! (19.07s)
2026-10-05T02:36:40.6120770Z Building for production...
2026-10-05T02:36:41.3530430Z [0/4] Write sources
2026-10-05T02:36:41.5811680Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:36:45.1854240Z [3/5] Compiling SevraPresentationChecks MarkdownDocumentTests.swift
2026-10-05T02:36:45.1886080Z [3/5] Write Objects.LinkFileList
2026-10-05T02:36:46.1109700Z [4/5] Linking sevra-presentation-checks
2026-10-05T02:36:46.1270110Z Build of product 'sevra-presentation-checks' complete! (5.63s)
2026-10-05T02:36:47.0861480Z Building for production...
2026-10-05T02:36:47.7063560Z [0/5] Write sources
2026-10-05T02:36:48.6665290Z [1/4] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:37:42.0043350Z [3/5] Compiling SevraMacChecks AdverseChecks.swift
2026-10-05T02:37:42.0165230Z [3/5] Write Objects.LinkFileList
2026-10-05T02:37:51.0609240Z [4/5] Linking sevra-mac-checks
2026-10-05T02:37:51.0701420Z Build of product 'sevra-mac-checks' complete! (64.08s)
2026-10-05T02:37:51.7754720Z Building for production...
2026-10-05T02:37:52.3390680Z [0/5] Write sources
2026-10-05T02:37:52.4875560Z [1/5] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:37:53.1670330Z [2/5] Compiling CSevraSandbox sevra_sandbox.c
2026-10-05T02:38:03.3705670Z [4/6] Compiling SevraExtract main.swift
2026-10-05T02:38:03.3742090Z [4/6] Write Objects.LinkFileList
2026-10-05T02:38:04.0615680Z [5/6] Linking sevra-extract
2026-10-05T02:38:04.0712440Z Build of product 'sevra-extract' complete! (12.40s)
2026-10-05T02:38:08.4014630Z PASS: External adoption refreshes clean drafts and preserves competing unsaved text
2026-10-05T02:38:08.4017100Z PASS: Continue in thread saves Home before creation and rejects overlapping clicks
2026-10-05T02:38:08.4019260Z PASS: Continue in thread cannot create a destination when saving Home fails
2026-10-05T02:38:08.4020530Z PASS: old stale-snapshot sequence reproduces a rejected draft
2026-10-05T02:38:08.4025770Z PASS: back-to-back saves use acknowledged revisions without any display refresh
2026-10-05T02:38:08.4038500Z PASS: overlapping save callers coalesce edits and never write concurrently
2026-10-05T02:38:08.4084070Z PASS: undo to the previous saved text during an in-flight write persists the undo
2026-10-05T02:38:08.4086730Z PASS: debounce saves only the newest edit and cancels pending work after Send
2026-10-05T02:38:08.4088410Z PASS: typing that never pauses still saves about once per wait, never back to back
2026-10-05T02:38:08.4095100Z PASS: Send before autosave atomically accepts the prompt and clears the older draft
2026-10-05T02:38:08.4096180Z PASS: Send waits for an in-flight save and preserves typing before acceptance
2026-10-05T02:38:08.4096780Z PASS: typing during acceptance survives the cleared draft receipt
2026-10-05T02:38:08.4098980Z PASS: edit-away-and-back while sending counts as a new draft
2026-10-05T02:38:08.4100330Z PASS: failed save keeps text, blocks navigation/close and clears only after recovery
2026-10-05T02:38:08.4102100Z PASS: lost save acknowledgement reconciles exact persisted text
2026-10-05T02:38:08.4102620Z PASS: failed Send and lost acceptance receipt reuse nonce without duplicating messages
2026-10-05T02:38:08.4132110Z PASS: an idempotent Send retry never erases a subsequently changed saved draft
2026-10-05T02:38:08.4134150Z PASS: revision-only conflicts recover silently and retry storms are bounded
2026-10-05T02:38:08.4135860Z PASS: real competing edits preserve both versions and require an explicit choice
2026-10-05T02:38:08.4137270Z PASS: another change during conflict resolution is not overwritten
2026-10-05T02:38:08.4139250Z PASS: navigation saves typing during destination loading and keeps drafts in their own threads
2026-10-05T02:38:08.4140750Z PASS: failed destination read leaves the current composer intact
2026-10-05T02:38:08.4142390Z PASS: close drains the in-flight writer before reporting safe to close
2026-10-05T02:38:08.4144960Z PASS: quit freezes edits during shutdown and restores editing when shutdown fails
2026-10-05T02:38:08.4146240Z PASS: mixed typing, clearing, Unicode, thread changes and sending retain exact drafts
2026-10-05T02:38:08.4147880Z PASS: discarding Incognito drains pending saves before changing owner
2026-10-05T02:38:08.4149460Z PASS: real dbmd persistence, atomic Send, stale-save refusal, external-edit/no-op refusal, exact reopen and Incognito exclusion
2026-10-05T02:38:08.4151820Z PASS: production journal coordinator, double Save, lost acceptance retry and exact entry/draft restart
2026-10-05T02:38:08.4153290Z PASS: 26 composer scenarios plus real-runtime persistence checks
2026-10-05T02:38:08.6474880Z PRESENTATION_RENDER_MS 20.707,0.581,0.548,0.535,0.528,0.535,0.538,0.472,0.448,0.512,0.528,0.517,0.557,0.514,0.477,0.491,0.450,0.504,0.458,0.488
2026-10-05T02:38:08.6476290Z PASS: native Markdown structure, exact code, table attributes, inert HTML/images, link/citation boundaries, Unicode source coordinates, late references, cache reuse, limits, message annotations and streaming replacement bounds
2026-10-05T02:38:22.7027540Z PASS: first opening of a long conversation starts at latest without an extra control
2026-10-05T02:38:22.7092300Z PASS: new text follows while already at the end
2026-10-05T02:38:22.7093760Z PASS: streaming preserves the reader's position and offers Latest
2026-10-05T02:38:22.7095750Z PASS: explicit Latest clears selection and resumes following
2026-10-05T02:38:22.7096710Z PASS: later text keeps following after Latest
2026-10-05T02:38:22.7097620Z PASS: selecting text prevents streaming from moving the document
2026-10-05T02:38:22.7109260Z PASS: window resizing preserves following at latest
2026-10-05T02:38:22.7110140Z PASS: text-size reflow keeps a reader at latest
2026-10-05T02:38:22.7110940Z PASS: an earlier page opens at its beginning
2026-10-05T02:38:22.7111880Z PASS: earlier-page Latest is consumed only after destination layout
2026-10-05T02:38:22.7112970Z PASS: short conversations need no jump control
2026-10-05T02:38:22.7113810Z PASS: returning to a thread restores its reading position
2026-10-05T02:38:22.7114730Z PASS: a long page opens at its latest text
2026-10-05T02:38:22.7115600Z PASS: the middle of a long page is laid out without the text above it
2026-10-05T02:38:22.7116750Z PASS: a reader's line holds while the rest of a long page is laid out
2026-10-05T02:38:22.7117700Z PASS: a reader stays on their line when the window narrows
2026-10-05T02:38:22.7118710Z PASS: production native transcript scroll lifecycle
2026-10-05T02:38:31.8819770Z Building for debugging...
2026-10-05T02:38:31.9361440Z [0/252] Copying t5_tokenizer_config.json
2026-10-05T02:38:32.0828760Z [1/252] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:38:32.0832830Z [2/252] Copying gpt2_tokenizer_config.json
2026-10-05T02:38:32.0840010Z [3/252] Copying PrivacyInfo.xcprivacy
2026-10-05T02:38:32.4459450Z [4/252] Compiling cmark-gfm-extensions tasklist.c
2026-10-05T02:38:32.4893240Z [5/252] Compiling cmark-gfm-extensions tagfilter.c
2026-10-05T02:38:32.5629760Z [6/252] Compiling cmark-gfm-extensions table.c
2026-10-05T02:38:32.6113400Z [7/252] Compiling cmark-gfm-extensions strikethrough.c
2026-10-05T02:38:32.6647230Z [8/252] Compiling cmark-gfm-extensions ext_scanners.c
2026-10-05T02:38:32.7043230Z [9/252] Compiling cmark-gfm-extensions core-extensions.c
2026-10-05T02:38:33.1390730Z [10/252] Compiling cmark-gfm-extensions autolink.c
2026-10-05T02:38:33.1862410Z [11/252] Compiling cmark-gfm xml.c
2026-10-05T02:38:33.2999310Z [12/252] Compiling cmark-gfm utf8.c
2026-10-05T02:38:33.3480490Z [13/252] Compiling cmark-gfm syntax_extension.c
2026-10-05T02:38:33.5185950Z [14/252] Compiling cmark-gfm scanners.c
2026-10-05T02:38:33.5584460Z [15/252] Compiling yyjson.c
2026-10-05T02:38:33.5672810Z [16/252] Compiling cmark-gfm render.c
2026-10-05T02:38:33.6001910Z [17/252] Compiling cmark-gfm registry.c
2026-10-05T02:38:33.6112800Z [18/252] Compiling cmark-gfm references.c
2026-10-05T02:38:33.6343480Z [19/252] Compiling cmark-gfm plugin.c
2026-10-05T02:38:33.6520450Z [20/252] Compiling cmark-gfm plaintext.c
2026-10-05T02:38:33.6898140Z [21/252] Compiling cmark-gfm node.c
2026-10-05T02:38:33.6935700Z [22/252] Compiling cmark-gfm map.c
2026-10-05T02:38:33.7248660Z [23/252] Compiling cmark-gfm linked_list.c
2026-10-05T02:38:33.7317570Z [24/252] Compiling cmark-gfm man.c
2026-10-05T02:38:33.7701680Z [25/252] Compiling cmark-gfm iterator.c
2026-10-05T02:38:33.7702360Z [25/252] Compiling cmark-gfm latex.c
2026-10-05T02:38:33.8217250Z [27/252] Compiling cmark-gfm html.c
2026-10-05T02:38:33.8490000Z [28/252] Compiling cmark-gfm inlines.c
2026-10-05T02:38:33.8783530Z [29/252] Compiling cmark-gfm houdini_html_u.c
2026-10-05T02:38:33.8877110Z [30/252] Compiling cmark-gfm houdini_html_e.c
2026-10-05T02:38:33.9213390Z [31/252] Compiling cmark-gfm houdini_href_e.c
2026-10-05T02:38:33.9491510Z [32/252] Compiling cmark-gfm footnotes.c
2026-10-05T02:38:33.9940180Z [33/252] Compiling cmark-gfm cmark_ctype.c
2026-10-05T02:38:33.9996780Z [34/252] Compiling cmark-gfm commonmark.c
2026-10-05T02:38:34.0345980Z [35/252] Compiling cmark-gfm cmark.c
2026-10-05T02:38:34.0441590Z [36/252] Compiling cmark-gfm buffer.c
2026-10-05T02:38:34.0819500Z [37/252] Compiling cmark-gfm arena.c
2026-10-05T02:38:34.1027640Z [38/252] Compiling _NumericsShims _NumericsShims.c
2026-10-05T02:38:34.1030070Z [39/252] Write sources
2026-10-05T02:38:34.1052470Z [44/252] Write Sevra-entitlement.plist
2026-10-05T02:38:34.1054030Z [45/252] Write sources
2026-10-05T02:38:34.1057710Z [47/252] Compiling cmark-gfm blocks.c
2026-10-05T02:38:34.1060050Z [48/252] Write sources
2026-10-05T02:38:35.0761020Z [59/270] Compiling InternalCollectionsUtilities Debugging.swift
2026-10-05T02:38:35.0876130Z [60/270] Compiling InternalCollectionsUtilities Descriptions.swift
2026-10-05T02:38:35.0881960Z [61/270] Compiling InternalCollectionsUtilities FixedWidthInteger+roundUpToPowerOfTwo.swift
2026-10-05T02:38:35.0882640Z [62/270] Compiling InternalCollectionsUtilities Integer rank.swift
2026-10-05T02:38:35.0883240Z [63/270] Compiling InternalCollectionsUtilities UInt+first and last set bit.swift
2026-10-05T02:38:35.0883830Z [64/270] Compiling InternalCollectionsUtilities UInt+reversed.swift
2026-10-05T02:38:35.0884460Z [65/270] Compiling InternalCollectionsUtilities LifetimeOverride.swift
2026-10-05T02:38:35.0885120Z [66/270] Compiling InternalCollectionsUtilities RandomAccessCollection+Offsets.swift
2026-10-05T02:38:35.0885680Z [67/270] Compiling InternalCollectionsUtilities Span+Extras.swift
2026-10-05T02:38:35.0886730Z [68/270] Compiling InternalCollectionsUtilities String+Padding.swift
2026-10-05T02:38:35.0949230Z [69/270] Emitting module InternalCollectionsUtilities
2026-10-05T02:38:35.0949800Z [70/275] Emitting module RealModule
2026-10-05T02:38:35.2468920Z [77/284] Compiling RealModule Float16+Real.swift
2026-10-05T02:38:35.2480350Z [78/284] Compiling RealModule Float80+Real.swift
2026-10-05T02:38:35.2480770Z [79/284] Compiling RealModule Real.swift
2026-10-05T02:38:35.2481200Z [80/284] Compiling RealModule RealFunctions.swift
2026-10-05T02:38:35.2481620Z [81/284] Compiling RealModule RelaxedArithmetic.swift
2026-10-05T02:38:35.2558380Z [81/284] Write sources
2026-10-05T02:38:35.7218440Z [86/287] Compiling InternalCollectionsUtilities _UnsafeBitSet+_Word.swift
2026-10-05T02:38:35.7224150Z [87/287] Compiling InternalCollectionsUtilities _UnsafeBitSet.swift
2026-10-05T02:38:35.7244070Z [88/287] Compiling InternalCollectionsUtilities UnsafeBufferPointer+Extras.swift
2026-10-05T02:38:35.7256060Z [89/287] Compiling InternalCollectionsUtilities UnsafeMutableBufferPointer+Extras.swift
2026-10-05T02:38:35.7256790Z [90/287] Compiling InternalCollectionsUtilities UnsafeMutableRawBufferPointer+Extras.swift
2026-10-05T02:38:35.7257500Z [91/287] Compiling InternalCollectionsUtilities UnsafeRawBufferPointer+Extras.swift
2026-10-05T02:38:35.7258030Z [92/287] Compiling InternalCollectionsUtilities _SortedCollection.swift
2026-10-05T02:38:35.7258610Z [93/287] Compiling InternalCollectionsUtilities _UniqueCollection.swift
2026-10-05T02:38:38.3016110Z [94/312] Emitting module EventSource
2026-10-05T02:38:38.3017150Z [95/312] Compiling Crypto AES-GCM.swift
2026-10-05T02:38:38.3017850Z [96/312] Compiling Crypto AES-GCM_boring.swift
2026-10-05T02:38:38.6496530Z [97/314] Emitting module Crypto
2026-10-05T02:38:39.6511300Z [100/338] Compiling EventSource EventSource+AsyncHTTPClient.swift
2026-10-05T02:38:39.6653630Z [101/338] Compiling EventSource EventSource.swift
2026-10-05T02:38:39.6678710Z [102/338] Compiling Crypto Cipher.swift
2026-10-05T02:38:39.6802070Z [103/338] Compiling Crypto Nonces.swift
2026-10-05T02:38:39.6924920Z [104/338] Compiling Crypto ASN1.swift
2026-10-05T02:38:39.7061560Z [105/338] Compiling Crypto ASN1Any.swift
2026-10-05T02:38:39.7201970Z [106/338] Compiling Crypto ASN1BitString.swift
2026-10-05T02:38:39.7307960Z [107/338] Compiling Crypto ASN1Boolean.swift
2026-10-05T02:38:39.7416900Z [108/338] Compiling Crypto ASN1Identifier.swift
2026-10-05T02:38:39.7518470Z [109/338] Compiling Crypto ASN1Integer.swift
2026-10-05T02:38:39.7626230Z [110/338] Compiling Crypto ASN1Null.swift
2026-10-05T02:38:39.7736420Z [111/338] Compiling Crypto ASN1OctetString.swift
2026-10-05T02:38:39.7861670Z [112/338] Compiling Crypto ASN1Strings.swift
2026-10-05T02:38:39.7985150Z [113/338] Compiling Crypto ArraySliceBigint.swift
2026-10-05T02:38:39.8092620Z [114/338] Compiling Crypto GeneralizedTime.swift
2026-10-05T02:38:39.8284760Z [115/338] Compiling Crypto ObjectIdentifier.swift
2026-10-05T02:38:39.8292900Z [116/338] Compiling Crypto ECDSASignature.swift
2026-10-05T02:38:39.8431980Z [117/338] Compiling Crypto PEMDocument.swift
2026-10-05T02:38:39.8516880Z [118/338] Compiling Crypto PKCS8PrivateKey.swift
2026-10-05T02:38:39.8630560Z [119/338] Compiling Crypto SEC1PrivateKey.swift
2026-10-05T02:38:39.8750830Z [120/338] Compiling Crypto SubjectPublicKeyInfo.swift
2026-10-05T02:38:39.8852390Z [121/338] Compiling Crypto CryptoError_boring.swift
2026-10-05T02:38:39.8961710Z [122/338] Compiling Crypto CryptoKitErrors.swift
2026-10-05T02:38:39.9194400Z [123/338] Compiling Crypto Digest_boring.swift
2026-10-05T02:38:39.9301330Z [124/338] Compiling Crypto Digest.swift
2026-10-05T02:38:39.9402720Z [125/338] Compiling Crypto Digests.swift
2026-10-05T02:38:39.9435860Z [126/338] Compiling Crypto HashFunctions.swift
2026-10-05T02:38:39.9440550Z [127/338] Compiling Crypto HashFunctions_SHA2.swift
2026-10-05T02:38:39.9472630Z [128/338] Compiling Crypto HashFunctions_SHA3.swift
2026-10-05T02:38:39.9477100Z [129/338] Compiling Crypto Digest_xkcp.swift
2026-10-05T02:38:39.9509000Z [130/338] Compiling Crypto HPKE-AEAD.swift
2026-10-05T02:38:39.9513270Z [131/338] Compiling Crypto HPKE-Ciphersuite.swift
2026-10-05T02:38:39.9552320Z [132/338] Compiling Crypto HPKE-KDF.swift
2026-10-05T02:38:39.9558280Z [133/338] Compiling Crypto HPKE-KexKeyDerivation.swift
2026-10-05T02:38:39.9619590Z [134/338] Compiling Crypto HPKE-LabeledExtract.swift
2026-10-05T02:38:39.9625730Z [135/338] Compiling Crypto HPKE-Utils.swift
2026-10-05T02:38:39.9671910Z [136/338] Compiling Crypto DHKEM.swift
2026-10-05T02:38:39.9679860Z [137/338] Compiling Crypto HPKE-KEM-Curve25519.swift
2026-10-05T02:38:39.9719390Z [138/338] Compiling Crypto HPKE-NIST-EC-KEMs.swift
2026-10-05T02:38:39.9728420Z [139/338] Compiling Crypto HPKE-KEM.swift
2026-10-05T02:38:39.9768330Z [140/338] Compiling Crypto HPKE-Errors.swift
2026-10-05T02:38:39.9773410Z [141/338] Compiling Crypto HPKE.swift
2026-10-05T02:38:39.9814590Z [142/338] Compiling Crypto HPKE-Context.swift
2026-10-05T02:38:39.9821410Z [143/338] Compiling Crypto HPKE-KeySchedule.swift
2026-10-05T02:38:39.9861510Z [144/338] Compiling Crypto HPKE-Modes.swift
2026-10-05T02:38:39.9868920Z [145/338] Compiling Crypto Insecure.swift
2026-10-05T02:38:39.9899420Z [146/385] Compiling Crypto Insecure_HashFunctions.swift
2026-10-05T02:38:39.9906360Z [147/385] Compiling Crypto MLKEM_boring.swift
2026-10-05T02:38:39.9941180Z [148/385] Compiling Crypto MLKEM_wrapper.swift
2026-10-05T02:38:39.9946330Z [149/385] Compiling Crypto XWing_boring.swift
2026-10-05T02:38:39.9979930Z [150/385] Compiling Crypto KEM-Errors.swift
2026-10-05T02:38:39.9988860Z [151/385] Compiling Crypto KEM.swift
2026-10-05T02:38:40.0052010Z [152/385] Compiling Crypto MLKEM.swift
2026-10-05T02:38:40.0060490Z [153/385] Compiling Crypto XWing.swift
2026-10-05T02:38:40.0140330Z [154/385] Compiling Crypto ECDH_boring.swift
2026-10-05T02:38:40.0142310Z [155/385] Compiling Crypto DH.swift
2026-10-05T02:38:40.0143060Z [156/385] Compiling Crypto ECDH.swift
2026-10-05T02:38:40.0145070Z [157/385] Compiling Crypto ANSIx963.swift
2026-10-05T02:38:40.0151490Z [158/385] Compiling Crypto HKDF.swift
2026-10-05T02:38:40.0189520Z [159/385] Compiling Crypto AESWrap.swift
2026-10-05T02:38:40.0194070Z [160/385] Compiling Crypto AESWrap_boring.swift
2026-10-05T02:38:40.0230130Z [161/385] Compiling Crypto Ed25519_boring.swift
2026-10-05T02:38:40.0235850Z [162/385] Compiling Crypto NISTCurvesKeys_boring.swift
2026-10-05T02:38:40.0274270Z [163/385] Compiling Crypto X25519Keys_boring.swift
2026-10-05T02:38:40.0280380Z [164/385] Compiling Crypto Curve25519.swift
2026-10-05T02:38:40.0319270Z [165/385] Compiling Crypto Ed25519Keys.swift
2026-10-05T02:38:40.0324140Z [166/385] Compiling Crypto NISTCurvesKeys.swift
2026-10-05T02:38:40.0357270Z [167/385] Compiling Crypto X25519Keys.swift
2026-10-05T02:38:40.0362220Z [168/385] Compiling Crypto SymmetricKeys.swift
2026-10-05T02:38:40.0398180Z [169/385] Compiling Crypto HMAC.swift
2026-10-05T02:38:40.3320110Z [172/407] Compiling Crypto MACFunctions.swift
2026-10-05T02:38:40.3393150Z [173/407] Compiling Crypto MessageAuthenticationCode.swift
2026-10-05T02:38:40.3494720Z [174/407] Compiling Crypto AES.swift
2026-10-05T02:38:40.3596980Z [175/407] Compiling Crypto ECDSASignature_boring.swift
2026-10-05T02:38:40.3698550Z [176/407] Compiling Crypto ECDSA_boring.swift
2026-10-05T02:38:40.3727410Z [177/407] Compiling Crypto EdDSA_boring.swift
2026-10-05T02:38:40.3830160Z [178/407] Compiling Crypto MLDSA_boring.swift
2026-10-05T02:38:40.3851810Z [179/407] Compiling Crypto MLDSA_wrapper.swift
2026-10-05T02:38:40.3953290Z [180/407] Compiling Crypto ECDSA.swift
2026-10-05T02:38:40.4054240Z [181/407] Compiling Crypto Ed25519.swift
2026-10-05T02:38:40.4155980Z [182/407] Compiling Crypto MLDSA.swift
2026-10-05T02:38:40.4257380Z [183/407] Compiling Crypto Signature.swift
2026-10-05T02:38:40.4358760Z [184/407] Compiling Crypto CryptoKitErrors_boring.swift
2026-10-05T02:38:40.4460250Z [185/407] Compiling Crypto Optional+withUnsafeBytes_boring.swift
2026-10-05T02:38:40.4562170Z [186/407] Compiling Crypto RNG_boring.swift
2026-10-05T02:38:40.4663710Z [187/407] Compiling Crypto SafeCompare_boring.swift
2026-10-05T02:38:40.4765110Z [188/407] Compiling Crypto Zeroization_boring.swift
2026-10-05T02:38:40.4866660Z [189/407] Compiling Crypto _CryptoModuleAnchor.swift
2026-10-05T02:38:40.4979240Z [190/407] Compiling Crypto PrettyBytes.swift
2026-10-05T02:38:40.5082040Z [191/407] Compiling Crypto SafeCompare.swift
2026-10-05T02:38:40.5183910Z [192/407] Compiling Crypto SecureBytes.swift
2026-10-05T02:38:40.5303670Z [193/407] Compiling Crypto Zeroization.swift
2026-10-05T02:38:40.5405590Z [194/407] Compiling Crypto resource_bundle_accessor.swift
2026-10-05T02:38:40.5506980Z [194/407] Write sources
2026-10-05T02:38:40.5608050Z [195/407] Compiling version.cpp
2026-10-05T02:38:42.0442380Z [197/426] Emitting module OrderedCollections
2026-10-05T02:38:42.2191400Z [198/447] Compiling HuggingFace AccessRequest.swift
2026-10-05T02:38:42.2329980Z [199/447] Compiling HuggingFace Billing.swift
2026-10-05T02:38:42.2438800Z [200/447] Compiling HuggingFace Collection.swift
2026-10-05T02:38:42.2540420Z [201/447] Compiling HuggingFace CommaSeparatedList.swift
2026-10-05T02:38:42.2642220Z [202/447] Compiling HuggingFace Dataset.swift
2026-10-05T02:38:42.2743560Z [203/447] Compiling HuggingFace Discussion.swift
2026-10-05T02:38:42.2845410Z [204/447] Compiling HuggingFace File.swift
2026-10-05T02:38:42.2926310Z [205/447] Compiling HuggingFace Git.swift
2026-10-05T02:38:42.3028020Z [206/447] Compiling HuggingFace HubCache.swift
2026-10-05T02:38:42.3129450Z [207/447] Compiling HuggingFace HubClient+Collections.swift
2026-10-05T02:38:42.3246910Z [208/447] Compiling HuggingFace HubClient+Datasets.swift
2026-10-05T02:38:42.3348600Z [209/447] Compiling HuggingFace HubClient+Discussions.swift
2026-10-05T02:38:42.3495160Z [210/447] Compiling HuggingFace HubClient+Files.swift
2026-10-05T02:38:42.3596450Z [211/447] Compiling HuggingFace HubClient+Git.swift
2026-10-05T02:38:42.3697830Z [212/447] Compiling HuggingFace HubClient+Models.swift
2026-10-05T02:38:42.3798970Z [213/447] Compiling HuggingFace HubClient+OAuth.swift
2026-10-05T02:38:42.3901010Z [214/447] Compiling HuggingFace HubClient+Organizations.swift
2026-10-05T02:38:42.3959120Z [215/447] Compiling HuggingFace HubClient+Pagination.swift
2026-10-05T02:38:42.3976890Z [216/447] Compiling OrderedCollections OrderedDictionary+Invariants.swift
2026-10-05T02:38:42.3977440Z [217/447] Compiling OrderedCollections OrderedDictionary+Move.swift
2026-10-05T02:38:42.3977910Z [218/447] Compiling OrderedCollections OrderedDictionary+Partial MutableCollection.swift
2026-10-05T02:38:43.1199170Z [219/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra intersection.swift
2026-10-05T02:38:43.1202390Z [220/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isDisjoint.swift
2026-10-05T02:38:43.1206680Z [221/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isEqualSet.swift
2026-10-05T02:38:43.1207360Z [222/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isStrictSubset.swift
2026-10-05T02:38:43.1214580Z [223/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isStrictSuperset.swift
2026-10-05T02:38:43.1216380Z [224/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isSubset.swift
2026-10-05T02:38:43.1346540Z [225/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra isSuperset.swift
2026-10-05T02:38:43.1464860Z [226/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra subtract.swift
2026-10-05T02:38:43.1590070Z [227/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra subtracting.swift
2026-10-05T02:38:43.1694010Z [228/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra symmetricDifference.swift
2026-10-05T02:38:43.1713900Z [229/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra union.swift
2026-10-05T02:38:43.1715270Z [230/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra+Basics.swift
2026-10-05T02:38:43.1716240Z [231/468] Compiling OrderedCollections OrderedSet+RandomAccessCollection.swift
2026-10-05T02:38:43.1717260Z [232/468] Compiling OrderedCollections OrderedSet+ReserveCapacity.swift
2026-10-05T02:38:43.1718490Z [233/468] Compiling OrderedCollections OrderedSet+Sendable.swift
2026-10-05T02:38:43.1719220Z [234/468] Compiling OrderedCollections OrderedSet+SubSequence.swift
2026-10-05T02:38:43.1720110Z [235/468] Compiling OrderedCollections OrderedSet+Testing.swift
2026-10-05T02:38:43.1720750Z [236/468] Compiling OrderedCollections OrderedSet+UnorderedView.swift
2026-10-05T02:38:43.1721940Z [237/468] Compiling OrderedCollections OrderedSet+UnstableInternals.swift
2026-10-05T02:38:43.1723080Z [238/468] Compiling OrderedCollections OrderedSet.swift
2026-10-05T02:38:43.1723920Z [239/468] Compiling OrderedCollections _UnsafeBitset.swift
2026-10-05T02:38:43.2132780Z [240/468] Compiling OrderedCollections OrderedDictionary+Partial RangeReplaceableCollection.swift
2026-10-05T02:38:43.2133820Z [241/468] Compiling OrderedCollections OrderedDictionary+Sendable.swift
2026-10-05T02:38:43.2134750Z [242/468] Compiling OrderedCollections OrderedDictionary+Sequence.swift
2026-10-05T02:38:43.2135560Z [243/468] Compiling OrderedCollections OrderedDictionary+Values.swift
2026-10-05T02:38:43.2136220Z [244/468] Compiling OrderedCollections OrderedDictionary.swift
2026-10-05T02:38:43.2136760Z [245/468] Compiling OrderedCollections OrderedSet+Codable.swift
2026-10-05T02:38:43.2137680Z [246/468] Compiling OrderedCollections OrderedSet+CustomReflectable.swift
2026-10-05T02:38:43.2138300Z [247/468] Compiling OrderedCollections OrderedSet+Descriptions.swift
2026-10-05T02:38:43.2139740Z [248/468] Compiling OrderedCollections OrderedSet+Diffing.swift
2026-10-05T02:38:43.2140270Z [249/468] Compiling OrderedCollections OrderedSet+Equatable.swift
2026-10-05T02:38:43.2141460Z [250/468] Compiling OrderedCollections OrderedSet+ExpressibleByArrayLiteral.swift
2026-10-05T02:38:43.2142350Z [251/468] Compiling OrderedCollections OrderedSet+Hashable.swift
2026-10-05T02:38:43.2143000Z [252/468] Compiling OrderedCollections OrderedSet+Initializers.swift
2026-10-05T02:38:43.2143630Z [253/468] Compiling OrderedCollections OrderedSet+Insertions.swift
2026-10-05T02:38:43.2144290Z [254/468] Compiling OrderedCollections OrderedSet+Invariants.swift
2026-10-05T02:38:43.2144920Z [255/468] Compiling OrderedCollections OrderedSet+Move.swift
2026-10-05T02:38:43.2145590Z [256/468] Compiling OrderedCollections OrderedSet+Partial MutableCollection.swift
2026-10-05T02:38:43.2146580Z [257/468] Compiling OrderedCollections OrderedSet+Partial RangeReplaceableCollection.swift
2026-10-05T02:38:43.2147450Z [258/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra formIntersection.swift
2026-10-05T02:38:43.2148180Z [259/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra formSymmetricDifference.swift
2026-10-05T02:38:43.2149220Z [260/468] Compiling OrderedCollections OrderedSet+Partial SetAlgebra formUnion.swift
2026-10-05T02:38:43.6128140Z [261/475] Emitting module ComplexModule
2026-10-05T02:38:43.7268070Z [262/480] Compiling ComplexModule Complex+AdditiveArithmetic.swift
2026-10-05T02:38:43.7287810Z [263/480] Compiling ComplexModule Complex+AlgebraicField.swift
2026-10-05T02:38:43.7289040Z [264/480] Compiling ComplexModule Complex+Codable.swift
2026-10-05T02:38:43.7299790Z [265/480] Compiling ComplexModule Complex+ElementaryFunctions.swift
2026-10-05T02:38:43.7300280Z [266/480] Compiling ComplexModule Complex+Hashable.swift
2026-10-05T02:38:43.7300740Z [267/480] Compiling ComplexModule Complex+IntegerLiteral.swift
2026-10-05T02:38:43.8237830Z [268/480] Compiling ComplexModule Complex+Numeric.swift
2026-10-05T02:38:43.8239190Z [269/480] Compiling ComplexModule Complex+StringConvertible.swift
2026-10-05T02:38:43.8240210Z [270/480] Compiling ComplexModule Complex.swift
2026-10-05T02:38:43.8241150Z [271/480] Compiling ComplexModule Polar.swift
2026-10-05T02:38:43.8241980Z [272/480] Compiling ComplexModule Scale.swift
2026-10-05T02:38:44.6197610Z [273/488] Emitting module Jinja
2026-10-05T02:38:46.6120540Z [274/495] Compiling Jinja Parser.swift
2026-10-05T02:38:46.6213300Z [275/495] Compiling Jinja PropertyMembers.swift
2026-10-05T02:38:46.6213880Z [276/495] Compiling Jinja Template.swift
2026-10-05T02:38:46.6216380Z [277/495] Compiling Jinja Tests.swift
2026-10-05T02:38:46.6216730Z [278/495] Compiling Jinja Token.swift
2026-10-05T02:38:46.6217200Z [279/495] Compiling Jinja Utilities.swift
2026-10-05T02:38:46.6221260Z [280/495] Compiling Jinja Value.swift
2026-10-05T02:38:47.2006050Z [281/495] Compiling Jinja AST.swift
2026-10-05T02:38:47.2101810Z [282/495] Compiling Jinja Error.swift
2026-10-05T02:38:47.2103330Z [283/495] Compiling Jinja Filters.swift
2026-10-05T02:38:47.2105660Z [284/495] Compiling Jinja Globals.swift
2026-10-05T02:38:47.2106800Z [285/495] Compiling Jinja Interpreter.swift
2026-10-05T02:38:47.2112330Z [286/495] Compiling Jinja Lexer.swift
2026-10-05T02:38:47.2114250Z [287/495] Compiling Jinja Macro.swift
2026-10-05T02:38:47.4712540Z [288/497] Compiling Numerics Numerics.swift
2026-10-05T02:38:47.4787830Z [289/497] Emitting module Numerics
2026-10-05T02:38:49.8484280Z [289/497] Compiling utils.cpp
2026-10-05T02:38:52.4665890Z [291/497] Emitting module HuggingFace
2026-10-05T02:38:53.3246580Z [309/533] Compiling transforms.cpp
2026-10-05T02:38:54.8897180Z [310/533] Compiling stream.cpp
2026-10-05T02:38:56.3302360Z [311/533] Compiling scheduler.cpp
2026-10-05T02:38:58.6774290Z [313/533] Compiling HuggingFace HubClient+Papers.swift
2026-10-05T02:38:58.6794390Z [314/533] Compiling HuggingFace HubClient+Repos.swift
2026-10-05T02:38:58.6794960Z [315/533] Compiling HuggingFace HubClient+Spaces.swift
2026-10-05T02:38:58.6795990Z [316/533] Compiling HuggingFace HubClient+User.swift
2026-10-05T02:38:58.6797530Z [317/533] Compiling HuggingFace HubClient.swift
2026-10-05T02:38:58.6799580Z [318/533] Compiling HuggingFace Model.swift
2026-10-05T02:38:58.6852680Z [319/533] Compiling HuggingFace OAuth.swift
2026-10-05T02:38:58.6854900Z [320/533] Compiling HuggingFace Organization.swift
2026-10-05T02:38:58.6855910Z [321/533] Compiling HuggingFace Pagination.swift
2026-10-05T02:38:58.6857260Z [322/533] Compiling HuggingFace Paper.swift
2026-10-05T02:38:58.6857690Z [323/533] Compiling HuggingFace Repo.swift
2026-10-05T02:38:58.6858090Z [324/533] Compiling HuggingFace ResourceGroup.swift
2026-10-05T02:38:58.6858460Z [325/533] Compiling HuggingFace Space.swift
2026-10-05T02:38:58.6858860Z [326/533] Compiling HuggingFace Tags.swift
2026-10-05T02:38:58.6860590Z [327/533] Compiling HuggingFace User.swift
2026-10-05T02:38:58.6862100Z [328/533] Compiling HuggingFace ChatCompletion.swift
2026-10-05T02:38:58.6863690Z [329/533] Compiling HuggingFace FeatureExtraction.swift
2026-10-05T02:38:58.6865290Z [330/533] Compiling HuggingFace InferenceClient.swift
2026-10-05T02:38:58.6866050Z [331/533] Compiling HuggingFace Message.swift
2026-10-05T02:38:58.6866540Z [332/533] Compiling HuggingFace Provider.swift
2026-10-05T02:38:58.6866980Z [333/533] Compiling HuggingFace SpeechToText.swift
2026-10-05T02:38:58.6868600Z [334/533] Compiling HuggingFace TextToImage.swift
2026-10-05T02:38:58.6869040Z [335/533] Compiling HuggingFace TextToVideo.swift
2026-10-05T02:38:58.6876700Z [336/533] Compiling HuggingFace HuggingFaceAuthenticationManager.swift
2026-10-05T02:38:58.6877150Z [337/533] Compiling HuggingFace OAuthClient.swift
2026-10-05T02:38:58.6878330Z [338/533] Compiling HuggingFace TokenStorage.swift
2026-10-05T02:38:58.6878750Z [339/533] Compiling HuggingFace CacheLocationProvider.swift
2026-10-05T02:38:58.6879140Z [340/533] Compiling HuggingFace Data+Extensions.swift
2026-10-05T02:38:58.6879530Z [341/533] Compiling HuggingFace JSONDecoder+Extensions.swift
2026-10-05T02:38:58.6879860Z [342/533] Compiling HuggingFace URL+Extensions.swift
2026-10-05T02:38:58.6880230Z [343/533] Compiling HuggingFace URLSession+Linux.swift
2026-10-05T02:38:58.6881780Z [344/533] Compiling HuggingFace FileLock.swift
2026-10-05T02:38:58.6882640Z [345/533] Compiling HuggingFace HTTPClient.swift
2026-10-05T02:38:58.6883500Z [346/533] Compiling HuggingFace MultipartBuilder.swift
2026-10-05T02:38:58.6883820Z [347/533] Compiling HuggingFace TokenProvider.swift
2026-10-05T02:38:58.6885220Z [348/533] Compiling HuggingFace Value.swift
2026-10-05T02:38:58.6969700Z [348/533] Compiling random.cpp
2026-10-05T02:39:02.0660540Z [349/533] Compiling primitives.cpp
2026-10-05T02:39:03.8039450Z [350/537] Compiling ops.cpp
2026-10-05T02:39:06.6243050Z [351/537] Compiling linalg.cpp
2026-10-05T02:39:10.6660030Z [352/537] Compiling safetensors.cpp
2026-10-05T02:39:10.7586450Z [354/537] Emitting module Hub
2026-10-05T02:39:10.7693460Z [355/537] Compiling Hub BinaryDistinct.swift
2026-10-05T02:39:10.7843350Z [356/537] Compiling Hub Config.swift
2026-10-05T02:39:10.7981170Z [357/537] Compiling Hub Hub.swift
2026-10-05T02:39:12.2897730Z [357/540] Compiling no_gguf.cpp
2026-10-05T02:39:13.6911150Z [359/540] Compiling Hub HubApi.swift
2026-10-05T02:39:13.6911730Z [360/540] Compiling Hub YYJSONParser.swift
2026-10-05T02:39:13.6912080Z [361/540] Compiling Hub resource_bundle_accessor.swift
2026-10-05T02:39:14.0989420Z [361/540] Compiling load.cpp
2026-10-05T02:39:14.9948230Z [362/547] Compiling graph_utils.cpp
2026-10-05T02:39:15.4358980Z [364/547] Emitting module Tokenizers
2026-10-05T02:39:15.4420350Z [365/547] Compiling Tokenizers BPETokenizer.swift
2026-10-05T02:39:15.4519620Z [366/547] Compiling Tokenizers BertTokenizer.swift
2026-10-05T02:39:15.4613690Z [367/547] Compiling Tokenizers ByteEncoder.swift
2026-10-05T02:39:15.4619590Z [368/547] Compiling Tokenizers Decoder.swift
2026-10-05T02:39:15.4701450Z [369/547] Compiling Tokenizers Normalizer.swift
2026-10-05T02:39:15.4705000Z [370/547] Compiling Tokenizers PostProcessor.swift
2026-10-05T02:39:16.4857960Z [370/553] Compiling fft.cpp
2026-10-05T02:39:16.6013350Z [372/553] Compiling Tokenizers PreTokenizer.swift
2026-10-05T02:39:16.6014030Z [373/553] Compiling Tokenizers String+PreTokenization.swift
2026-10-05T02:39:16.6014550Z [374/553] Compiling Tokenizers TokenLattice.swift
2026-10-05T02:39:16.6014950Z [375/553] Compiling Tokenizers Tokenizer.swift
2026-10-05T02:39:16.6015310Z [376/553] Compiling Tokenizers Trie.swift
2026-10-05T02:39:16.6017970Z [377/553] Compiling Tokenizers UnigramTokenizer.swift
2026-10-05T02:39:18.3014020Z [377/553] Compiling fast.cpp
2026-10-05T02:39:19.6532610Z [379/559] Compiling Generation Decoders.swift
2026-10-05T02:39:19.6534150Z [380/559] Compiling Generation Generation.swift
2026-10-05T02:39:19.6536540Z [381/559] Compiling Generation GenerationConfig.swift
2026-10-05T02:39:19.6537660Z [382/559] Compiling Generation LogitsProcessor.swift
2026-10-05T02:39:19.6549350Z [383/559] Compiling Generation MinPLogitsWarper.swift
2026-10-05T02:39:19.6567200Z [384/559] Emitting module Generation
2026-10-05T02:39:20.2433900Z [385/563] Compiling Generation RepetitionPenaltyLogitsProcessor.swift
2026-10-05T02:39:20.2434650Z [386/563] Compiling Generation TemperatureLogitsWarper.swift
2026-10-05T02:39:20.2435310Z [387/563] Compiling Generation TopKLogitsWarper.swift
2026-10-05T02:39:20.2435760Z [388/563] Compiling Generation TopPLogitsWarper.swift
2026-10-05T02:39:22.5151030Z [388/563] Compiling einsum.cpp
2026-10-05T02:39:22.8882170Z [389/566] Compiling export.cpp
2026-10-05T02:39:23.5812710Z [391/566] Compiling Models LanguageModel.swift
2026-10-05T02:39:23.5814190Z [392/566] Compiling Models LanguageModelTypes.swift
2026-10-05T02:39:23.5814790Z [393/566] Emitting module Models
2026-10-05T02:39:24.1797520Z [394/567] Compiling Models Weights.swift
2026-10-05T02:39:24.2705210Z [394/567] Compiling dtype_utils.cpp
2026-10-05T02:39:25.3698630Z [395/567] Compiling dtype.cpp
2026-10-05T02:39:25.4373540Z [396/567] Compiling utils.cpp
2026-10-05T02:39:26.7354340Z [397/567] Compiling no_ring.cpp
2026-10-05T02:39:27.2831240Z [398/567] Compiling primitives.cpp
2026-10-05T02:39:28.3577040Z [399/567] Compiling ops.cpp
2026-10-05T02:39:28.3714250Z [400/567] Compiling no_nccl.cpp
2026-10-05T02:39:29.5534870Z [401/567] Compiling no_jaccl.cpp
2026-10-05T02:39:29.5762090Z [402/567] Compiling no_mpi.cpp
2026-10-05T02:39:30.3755500Z [403/567] Compiling device.cpp
2026-10-05T02:39:31.1653620Z [404/567] Compiling distributed.cpp
2026-10-05T02:39:33.8735260Z [405/567] Compiling compile.cpp
2026-10-05T02:39:34.2562570Z [406/567] Compiling utils.cpp
2026-10-05T02:39:37.5211160Z [407/567] Compiling unary.cpp
2026-10-05T02:39:37.5305110Z [408/567] Compiling ternary.cpp
2026-10-05T02:39:41.1190280Z [409/567] Compiling softmax.cpp
2026-10-05T02:39:41.3981900Z [410/567] Compiling sort.cpp
2026-10-05T02:39:44.6427640Z [411/567] Compiling scan.cpp
2026-10-05T02:39:44.7681310Z [412/567] Compiling slicing.cpp
2026-10-05T02:39:49.7167920Z [413/567] Compiling rope.cpp
2026-10-05T02:39:49.8433120Z [414/567] Compiling scaled_dot_product_attention.cpp
2026-10-05T02:39:53.4592930Z [415/567] Compiling resident.cpp
2026-10-05T02:39:54.3261300Z [416/567] Compiling reduce.cpp
2026-10-05T02:39:57.8543070Z [417/567] Compiling primitives.cpp
2026-10-05T02:39:58.0944890Z [418/567] Compiling quantized.cpp
2026-10-05T02:40:00.9529250Z [419/567] Compiling metal.cpp
2026-10-05T02:40:01.3566600Z [420/567] Compiling normalization.cpp
2026-10-05T02:40:04.6413070Z [421/567] Compiling logsumexp.cpp
2026-10-05T02:40:05.6958690Z [422/567] Compiling matmul.cpp
2026-10-05T02:40:08.4110920Z [423/567] Compiling jit_kernels.cpp
2026-10-05T02:40:09.6742260Z [424/567] Compiling indexing.cpp
2026-10-05T02:40:12.0603770Z [425/567] Compiling hadamard.cpp
2026-10-05T02:40:14.2973750Z [426/567] Compiling fft.cpp
2026-10-05T02:40:14.6918800Z [427/567] Compiling fence.cpp
2026-10-05T02:40:16.8224250Z [428/567] Compiling event.cpp
2026-10-05T02:40:17.8503290Z [429/567] Compiling eval.cpp
2026-10-05T02:40:19.6415580Z [430/567] Compiling distributed.cpp
2026-10-05T02:40:20.0479640Z [431/567] Compiling device_info.cpp
2026-10-05T02:40:22.8975930Z [432/567] Compiling custom_kernel.cpp
2026-10-05T02:40:23.4190820Z [433/567] Compiling device.cpp
2026-10-05T02:40:25.4358960Z [434/567] Compiling copy.cpp
2026-10-05T02:40:26.3290810Z [435/567] Compiling conv.cpp
2026-10-05T02:40:28.6095850Z [436/567] Compiling compiled.cpp
2026-10-05T02:40:29.0420890Z [437/567] Compiling binary.cpp
2026-10-05T02:40:30.6403510Z [438/567] Compiling slicing.cpp
2026-10-05T02:40:31.1420630Z [439/567] Compiling allocator.cpp
2026-10-05T02:40:32.3503880Z [440/567] Compiling primitives.cpp
2026-10-05T02:40:32.9108240Z [441/567] Compiling copy.cpp
2026-10-05T02:40:33.7354110Z [442/567] Compiling no_cuda.cpp
2026-10-05T02:40:33.8618110Z [443/567] Compiling threefry.cpp
2026-10-05T02:40:36.7193540Z [444/567] Compiling unary.cpp
2026-10-05T02:40:37.3453430Z [445/567] Compiling svd.cpp
2026-10-05T02:40:40.0470890Z [446/567] Compiling softmax.cpp
2026-10-05T02:40:41.3328730Z [447/567] Compiling sort.cpp
2026-10-05T02:40:42.6089310Z [448/567] Compiling select.cpp
2026-10-05T02:40:44.3177900Z [449/567] Compiling scan.cpp
2026-10-05T02:40:47.6971120Z [450/567] Compiling reduce.cpp
2026-10-05T02:40:47.8213330Z [451/567] Compiling quantized.cpp
2026-10-05T02:40:50.0995240Z [452/567] Compiling primitives.cpp
2026-10-05T02:40:51.4495730Z [453/567] Compiling qrf.cpp
2026-10-05T02:40:52.8819230Z [454/567] Compiling matmul.cpp
2026-10-05T02:40:54.7831510Z [455/567] Compiling masked_mm.cpp
2026-10-05T02:40:56.2161570Z [456/567] Compiling luf.cpp
2026-10-05T02:40:57.4848580Z [457/567] Compiling logsumexp.cpp
2026-10-05T02:40:59.5475480Z [458/567] Compiling inverse.cpp
2026-10-05T02:41:02.6994980Z [459/567] Compiling hadamard.cpp
2026-10-05T02:41:03.7937060Z [460/567] Compiling indexing.cpp
2026-10-05T02:41:05.9118960Z [461/567] Compiling cblas.cpp
2026-10-05T02:41:06.6548300Z [462/567] Compiling bnns.cpp
2026-10-05T02:41:08.4540140Z [463/567] Compiling eval.cpp
2026-10-05T02:41:08.5688670Z [464/567] Compiling fft.cpp
2026-10-05T02:41:09.8276290Z [465/567] Compiling encoder.cpp
2026-10-05T02:41:11.5984300Z [466/567] Compiling eigh.cpp
2026-10-05T02:41:12.7974260Z [467/567] Compiling eig.cpp
2026-10-05T02:41:13.6904160Z [468/567] Compiling device_info.cpp
2026-10-05T02:41:13.8235200Z [469/567] Compiling distributed.cpp
2026-10-05T02:41:17.1692420Z [470/567] Compiling conv.cpp
2026-10-05T02:41:18.3088340Z [471/567] Compiling copy.cpp
2026-10-05T02:41:20.7426130Z [472/567] Compiling cholesky.cpp
2026-10-05T02:41:22.1733150Z [473/567] Compiling arg_reduce.cpp
2026-10-05T02:41:23.1058710Z [474/567] Compiling utils.cpp
2026-10-05T02:41:23.9958340Z [475/567] Compiling slicing.cpp
2026-10-05T02:41:25.0422960Z [476/567] Compiling reduce.cpp
2026-10-05T02:41:25.2292660Z [477/567] Compiling binary.cpp
2026-10-05T02:41:26.4087480Z [478/567] Compiling load.cpp
2026-10-05T02:41:26.5978660Z [479/567] Compiling metal_kernel.cpp
2026-10-05T02:41:27.4690300Z [480/567] Compiling compiled.cpp
2026-10-05T02:41:27.6188460Z [481/567] Compiling common.cpp
2026-10-05T02:41:28.3029800Z [482/567] Compiling broadcasting.cpp
2026-10-05T02:41:28.3284850Z [483/567] Compiling utils.cpp
2026-10-05T02:41:28.3504680Z [484/567] Compiling unary_ops.cpp
2026-10-05T02:41:28.3738080Z [485/567] Compiling unary.cpp
2026-10-05T02:41:28.3952970Z [486/567] Compiling ternary_ops.cpp
2026-10-05T02:41:28.4203840Z [487/567] Compiling ternary.cpp
2026-10-05T02:41:28.4397750Z [488/567] Compiling steel_gemm_splitk_nax.cpp
2026-10-05T02:41:28.4626780Z [489/567] Compiling steel_gemm_splitk.cpp
2026-10-05T02:41:28.4838760Z [490/567] Compiling steel_gemm_segmented_nax.cpp
2026-10-05T02:41:28.5078780Z [491/567] Compiling steel_gemm_segmented.cpp
2026-10-05T02:41:28.5289070Z [492/567] Compiling steel_gemm_masked.cpp
2026-10-05T02:41:28.5544700Z [493/567] Compiling steel_gemm_gather_nax.cpp
2026-10-05T02:41:28.5757230Z [494/567] Compiling steel_gemm_gather.cpp
2026-10-05T02:41:28.5987890Z [495/567] Compiling steel_gemm_fused_nax.cpp
2026-10-05T02:41:28.6346690Z [496/567] Compiling steel_gemm_fused.cpp
2026-10-05T02:41:28.6653380Z [497/567] Compiling steel_conv_general.cpp
2026-10-05T02:41:28.6877040Z [498/567] Compiling steel_conv_3d.cpp
2026-10-05T02:41:28.7082590Z [499/567] Compiling steel_conv.cpp
2026-10-05T02:41:28.7356710Z [500/567] Compiling steel_attention_nax.cpp
2026-10-05T02:41:28.7556650Z [501/567] Compiling steel_attention.cpp
2026-10-05T02:41:28.7749070Z [502/567] Compiling sort.cpp
2026-10-05T02:41:28.8008420Z [503/567] Compiling softmax.cpp
2026-10-05T02:41:28.8230410Z [504/567] Compiling searchsorted.cpp
2026-10-05T02:41:28.8482330Z [505/567] Compiling scatter_axis.cpp
2026-10-05T02:41:28.8807820Z [506/567] Compiling scatter.cpp
2026-10-05T02:41:28.9008140Z [507/567] Compiling scan.cpp
2026-10-05T02:41:28.9199090Z [508/567] Compiling reduce_utils.cpp
2026-10-05T02:41:28.9483940Z [509/567] Compiling reduce.cpp
2026-10-05T02:41:28.9718260Z [510/567] Compiling quantized_utils.cpp
2026-10-05T02:41:28.9984590Z [511/567] Compiling quantized_nax.cpp
2026-10-05T02:41:29.0200820Z [512/567] Compiling quantized.cpp
2026-10-05T02:41:29.0465310Z [513/567] Compiling masked_scatter.cpp
2026-10-05T02:41:29.0671860Z [514/567] Compiling logsumexp.cpp
2026-10-05T02:41:29.0880350Z [515/567] Compiling hadamard.cpp
2026-10-05T02:41:29.1106860Z [516/567] Compiling gemv_masked.cpp
2026-10-05T02:41:29.1315170Z [517/567] Compiling gemv.cpp
2026-10-05T02:41:29.1526780Z [518/567] Compiling gemm_nax.cpp
2026-10-05T02:41:29.1769110Z [519/567] Compiling array.cpp
2026-10-05T02:41:29.1818140Z [520/567] Compiling gemm.cpp
2026-10-05T02:41:29.2074590Z [521/567] Compiling gather_front.cpp
2026-10-05T02:41:29.2129090Z [522/567] Compiling gather_axis.cpp
2026-10-05T02:41:29.2278170Z [523/567] Compiling gather.cpp
2026-10-05T02:41:29.2357540Z [524/567] Compiling fp_quantized_nax.cpp
2026-10-05T02:41:29.2905690Z [525/567] Compiling fp_quantized.cpp
2026-10-05T02:41:29.2956620Z [526/567] Compiling fft.cpp
2026-10-05T02:41:29.3925080Z [527/567] Compiling copy.cpp
2026-10-05T02:41:29.4110180Z [528/567] Compiling conv.cpp
2026-10-05T02:41:29.4337580Z [529/567] Compiling compiled_preamble.cpp
2026-10-05T02:41:29.4453810Z [530/567] Compiling binary_two.cpp
2026-10-05T02:41:29.4740120Z [531/567] Compiling binary_ops.cpp
2026-10-05T02:41:29.4948880Z [532/567] Compiling binary.cpp
2026-10-05T02:41:29.5242650Z [533/567] Compiling arange.cpp
2026-10-05T02:41:31.5422590Z [534/567] Compiling jit_compiler_conditional.cpp
2026-10-05T02:41:31.6879240Z [535/567] Compiling compiled_conditional.cpp
2026-10-05T02:41:33.1637200Z [536/567] Compiling version.cpp
2026-10-05T02:41:33.3790510Z [537/567] Compiling vector.cpp
2026-10-05T02:41:34.6008490Z [538/567] Compiling transforms_impl.cpp
2026-10-05T02:41:34.7945430Z [539/567] Compiling transforms.cpp
2026-10-05T02:41:35.7578910Z [540/567] Compiling string.cpp
2026-10-05T02:41:35.9323240Z [541/567] Compiling stream.cpp
2026-10-05T02:41:37.3948480Z [542/567] Compiling random.cpp
2026-10-05T02:41:37.7471840Z [543/567] Compiling ops.cpp
2026-10-05T02:41:38.4813250Z [544/567] Compiling metal.cpp
2026-10-05T02:41:38.8254540Z [545/567] Compiling memory.cpp
2026-10-05T02:41:39.6986640Z [546/567] Compiling map.cpp
2026-10-05T02:41:40.0027750Z [547/567] Compiling linalg.cpp
2026-10-05T02:41:41.3705590Z [548/567] Compiling io_types.cpp
2026-10-05T02:41:41.7403960Z [549/567] Compiling io.cpp
2026-10-05T02:41:43.0105700Z [550/567] Compiling graph_utils.cpp
2026-10-05T02:41:43.3216080Z [551/567] Compiling fft.cpp
2026-10-05T02:41:44.7064610Z [552/567] Compiling fast.cpp
2026-10-05T02:41:44.8526200Z [553/567] Compiling export.cpp
2026-10-05T02:41:45.4495660Z [554/567] Compiling error.cpp
2026-10-05T02:41:46.6212090Z [555/567] Compiling device.cpp
2026-10-05T02:41:47.0157910Z [556/567] Compiling cuda.cpp
2026-10-05T02:41:48.3146290Z [557/567] Compiling compile.cpp
2026-10-05T02:41:49.0106210Z [558/567] Compiling closure.cpp
2026-10-05T02:41:50.5322180Z [559/567] Compiling array.cpp
2026-10-05T02:41:50.9931960Z [560/567] Compiling Cmlx.m
2026-10-05T02:41:51.2730560Z [561/567] Compiling CSlotpack slotpack.c
2026-10-05T02:41:51.3219240Z [562/567] Compiling CAtomic CAtomic.c
2026-10-05T02:41:52.0930640Z [563/592] Compiling format.cc
2026-10-05T02:41:56.0017500Z [565/614] Compiling MLX ArrayAt.swift
2026-10-05T02:41:56.0161720Z [566/614] Compiling MLX Cmlx+Util.swift
2026-10-05T02:41:56.0216800Z [567/614] Compiling MLX DType.swift
2026-10-05T02:41:56.0356810Z [568/614] Compiling MLX Device.swift
2026-10-05T02:41:56.0497080Z [569/614] Compiling MLX ErrorHandler.swift
2026-10-05T02:41:56.0598490Z [570/614] Compiling MLX Export.swift
2026-10-05T02:41:56.0701030Z [571/614] Compiling MLX FFT.swift
2026-10-05T02:41:56.0803360Z [572/614] Compiling MLX Factory.swift
2026-10-05T02:41:56.0905790Z [573/614] Compiling MLX Foundation+Util.swift
2026-10-05T02:41:56.1008190Z [574/614] Compiling MLX GPU+Metal.swift
2026-10-05T02:41:56.1109160Z [575/614] Compiling MLX GraphUtils.swift
2026-10-05T02:41:56.1210770Z [576/614] Compiling MLX IO.swift
2026-10-05T02:41:56.1315460Z [577/614] Compiling MLX Linalg.swift
2026-10-05T02:41:56.1416300Z [578/614] Compiling MLX MLXArray+Bytes.swift
2026-10-05T02:41:56.1517050Z [579/614] Compiling MLX MLXArray+Indexing.swift
2026-10-05T02:41:56.1617760Z [580/614] Compiling MLX MLXArray+Init.swift
2026-10-05T02:41:56.1719160Z [581/614] Compiling MLX MLXArray+Metal.swift
2026-10-05T02:41:56.1719590Z [582/614] Compiling MLX MLXArray+Normalizer.swift
2026-10-05T02:41:56.1820750Z [583/614] Compiling MLX MLXArray+Ops.swift
2026-10-05T02:41:56.1921550Z [584/614] Compiling MLX MLXArray+maskFill.swift
2026-10-05T02:41:56.2015270Z [585/614] Compiling MLX MLXArray.swift
2026-10-05T02:41:56.2016000Z [586/614] Compiling Markdown CodeBlock.swift
2026-10-05T02:41:56.2016530Z [587/614] Compiling Markdown HTMLBlock.swift
2026-10-05T02:41:56.2017060Z [588/614] Compiling Markdown Heading.swift
2026-10-05T02:41:56.2017410Z [589/614] Emitting module Markdown
2026-10-05T02:41:59.1503210Z [590/660] Compiling Markdown ThematicBreak.swift
2026-10-05T02:41:59.1508590Z [591/660] Compiling Markdown Table.swift
2026-10-05T02:41:59.1548520Z [592/660] Compiling Markdown TableBody.swift
2026-10-05T02:41:59.1554990Z [593/660] Compiling Markdown TableCell.swift
2026-10-05T02:41:59.1599250Z [594/660] Compiling Markdown TableCellContainer.swift
2026-10-05T02:41:59.1604930Z [595/660] Compiling Markdown TableHead.swift
2026-10-05T02:41:59.1650580Z [596/660] Compiling Markdown TableRow.swift
2026-10-05T02:41:59.1657040Z [597/660] Compiling Markdown Replacement.swift
2026-10-05T02:41:59.1691720Z [598/660] Compiling Markdown SourceLocation.swift
2026-10-05T02:41:59.1696510Z [599/660] Compiling Markdown Emphasis.swift
2026-10-05T02:41:59.1740960Z [600/660] Compiling Markdown Image.swift
2026-10-05T02:41:59.1746970Z [601/660] Compiling Markdown InlineAttributes.swift
2026-10-05T02:41:59.1787360Z [602/660] Compiling Markdown Link.swift
2026-10-05T02:41:59.1796170Z [603/660] Compiling Markdown Strikethrough.swift
2026-10-05T02:41:59.1835440Z [604/660] Compiling Markdown Strong.swift
2026-10-05T02:41:59.1843710Z [605/660] Compiling Markdown CustomInline.swift
2026-10-05T02:41:59.1885050Z [606/660] Compiling Markdown InlineCode.swift
2026-10-05T02:41:59.1889700Z [607/660] Compiling Markdown InlineHTML.swift
2026-10-05T02:41:59.1928710Z [608/660] Compiling Markdown LineBreak.swift
2026-10-05T02:41:59.1936940Z [609/660] Compiling Markdown SoftBreak.swift
2026-10-05T02:41:59.1986980Z [610/660] Compiling Markdown SymbolLink.swift
2026-10-05T02:41:59.1993850Z [611/660] Compiling Markdown Text.swift
2026-10-05T02:41:59.2040500Z [612/660] Compiling Markdown Aside.swift
2026-10-05T02:41:59.2046000Z [613/660] Compiling Markdown BlockDirectiveParser.swift
2026-10-05T02:41:59.2097410Z [614/660] Compiling Markdown CommonMarkConverter.swift
2026-10-05T02:41:59.2102740Z [615/660] Compiling Markdown LazySplitLines.swift
2026-10-05T02:41:59.2140560Z [616/660] Compiling Markdown ParseOptions.swift
2026-10-05T02:41:59.2145850Z [617/660] Compiling Markdown RangeAdjuster.swift
2026-10-05T02:41:59.2178200Z [618/660] Compiling Markdown RangerTracker.swift
2026-10-05T02:41:59.2185100Z [619/660] Compiling Markdown MarkupRewriter.swift
2026-10-05T02:41:59.2186280Z [620/660] Compiling Markdown BasicBlockContainer.swift
2026-10-05T02:41:59.2187670Z [621/660] Compiling Markdown BasicInlineContainer.swift
2026-10-05T02:41:59.2189890Z [622/660] Compiling Markdown BlockContainer.swift
2026-10-05T02:41:59.2190380Z [623/660] Compiling Markdown BlockMarkup.swift
2026-10-05T02:41:59.2190900Z [624/660] Compiling Markdown InlineContainer.swift
2026-10-05T02:41:59.2193750Z [625/660] Compiling Markdown InlineMarkup.swift
2026-10-05T02:41:59.2248730Z [626/660] Compiling Markdown ListItemContainer.swift
2026-10-05T02:41:59.2254160Z [627/660] Compiling Markdown AtomicCounter.swift
2026-10-05T02:41:59.2271610Z [628/660] Compiling Markdown CharacterExtensions.swift
2026-10-05T02:41:59.2302270Z [629/660] Compiling Markdown CollectionExtensions.swift
2026-10-05T02:41:59.2313330Z [630/660] Compiling Markdown StringExtensions.swift
2026-10-05T02:41:59.2358040Z [631/660] Compiling Markdown MarkupVisitor.swift
2026-10-05T02:41:59.2366360Z [632/660] Compiling Markdown MarkupWalker.swift
2026-10-05T02:41:59.2410910Z [633/660] Compiling Markdown HTMLFormatter.swift
2026-10-05T02:41:59.2416560Z [634/660] Compiling Markdown MarkupFormatter.swift
2026-10-05T02:41:59.2474710Z [635/660] Compiling Markdown MarkupTreeDumper.swift
2026-10-05T02:42:01.9106410Z [636/663] Emitting module MLX
2026-10-05T02:42:01.9119020Z [637/663] Compiling SevraPresentation ComposerSession.swift
2026-10-05T02:42:01.9122220Z [638/663] Compiling SevraPresentation HistoryPage.swift
2026-10-05T02:42:05.1893510Z [660/684] Emitting module SevraPresentation
2026-10-05T02:42:05.2977370Z [661/686] Compiling MLX MLXCustomFunction.swift
2026-10-05T02:42:05.2980200Z [662/686] Compiling MLX MLXFast.swift
2026-10-05T02:42:05.2981790Z [663/686] Compiling MLX MLXFastKernel.swift
2026-10-05T02:42:05.2982950Z [664/686] Compiling MLX Memory.swift
2026-10-05T02:42:05.2983400Z [665/686] Compiling MLX Nested.swift
2026-10-05T02:42:05.2983680Z [666/686] Compiling MLX NestedArrayElement.swift
2026-10-05T02:42:05.2984110Z [667/686] Compiling MLX Ops+Array.swift
2026-10-05T02:42:05.2984510Z [668/686] Compiling MLX Ops.swift
2026-10-05T02:42:05.2985020Z [669/686] Compiling MLX ParameterTypes.swift
2026-10-05T02:42:05.2985430Z [670/686] Compiling MLX Protocols.swift
2026-10-05T02:42:05.2985920Z [671/686] Compiling MLX Random.swift
2026-10-05T02:42:05.2986300Z [672/686] Compiling MLX State.swift
2026-10-05T02:42:05.2986580Z [673/686] Compiling MLX Stream.swift
2026-10-05T02:42:05.2987200Z [674/686] Compiling MLX Transforms+Compile.swift
2026-10-05T02:42:05.2987540Z [675/686] Compiling MLX Transforms+CompileOverloads.swift
2026-10-05T02:42:05.2988040Z [676/686] Compiling MLX Transforms+Eval.swift
2026-10-05T02:42:05.2988380Z [677/686] Compiling MLX Transforms+Grad.swift
2026-10-05T02:42:05.2988850Z [678/686] Compiling MLX Transforms+Internal.swift
2026-10-05T02:42:05.2989210Z [679/686] Compiling MLX Transforms+Vmap.swift
2026-10-05T02:42:05.2989980Z [680/686] Compiling MLX Transforms.swift
2026-10-05T02:42:05.2990870Z [681/686] Compiling MLX WiredMemory.swift
2026-10-05T02:42:06.3961990Z [682/696] Compiling MLXNN Containers.swift
2026-10-05T02:42:06.4056040Z [683/696] Compiling MLXNN Convolution.swift
2026-10-05T02:42:06.6441300Z [684/698] Emitting module MLXFast
2026-10-05T02:42:06.6542200Z [685/698] Compiling MLXFast MLXFast.swift
2026-10-05T02:42:06.7729790Z [686/699] Compiling MLXFast MLXFastKernel.swift
2026-10-05T02:42:06.8087200Z [687/699] Compiling MLXNN Activations.swift
2026-10-05T02:42:06.8190790Z [688/699] Compiling MLXNN Cache.swift
2026-10-05T02:42:06.8203320Z [691/699] Compiling MLXNN ConvolutionTransposed.swift
2026-10-05T02:42:06.8217390Z [692/699] Compiling MLXNN Dropout.swift
2026-10-05T02:42:06.8217880Z [693/699] Compiling MLXNN Embedding.swift
2026-10-05T02:42:06.8237890Z [694/699] Compiling MLXNN Linear.swift
2026-10-05T02:42:06.8238640Z [695/699] Compiling MLXNN Losses.swift
2026-10-05T02:42:07.2056160Z [696/708] Emitting module MLXNN
2026-10-05T02:42:09.6342170Z [697/708] Compiling MLXNN Module.swift
2026-10-05T02:42:09.6343270Z [698/708] Compiling MLXNN Normalization.swift
2026-10-05T02:42:09.6343750Z [699/708] Compiling MLXNN Pooling.swift
2026-10-05T02:42:09.6344070Z [700/708] Compiling MLXNN PositionalEncoding.swift
2026-10-05T02:42:09.6344490Z [701/708] Compiling MLXNN Quantized.swift
2026-10-05T02:42:09.6344910Z [702/708] Compiling MLXNN Recurrent.swift
2026-10-05T02:42:09.6345180Z [703/708] Compiling MLXNN Transformer.swift
2026-10-05T02:42:09.6345550Z [704/708] Compiling MLXNN Upsample.swift
2026-10-05T02:42:09.6345870Z [705/708] Compiling MLXNN ValueAndGrad.swift
2026-10-05T02:42:18.7726410Z [706/732] Compiling Slotstream AdaptiveSpeculation.swift
2026-10-05T02:42:18.7727850Z [707/732] Compiling Slotstream AffineEngineSource.swift
2026-10-05T02:42:18.7730300Z [708/732] Compiling Slotstream AffineExpertControl.swift
2026-10-05T02:42:18.7731720Z [709/732] Compiling Slotstream AffineGroupedExperts.swift
2026-10-05T02:42:18.7732190Z [710/732] Compiling Slotstream AffineStandalonePack.swift
2026-10-05T02:42:18.7733250Z [711/732] Compiling Slotstream AnthropicDialect.swift
2026-10-05T02:42:18.7733870Z [712/732] Compiling Slotstream AppliedModelConfiguration.swift
2026-10-05T02:42:18.7734430Z [713/732] Compiling Slotstream AuthenticatedTensorBatch.swift
2026-10-05T02:42:18.7734940Z [714/732] Compiling Slotstream AutomaticPackPolicy.swift
2026-10-05T02:42:18.7735730Z [715/732] Compiling Slotstream BlockSelection.swift
2026-10-05T02:42:18.7736730Z [716/732] Compiling Slotstream BoundedOutput.swift
2026-10-05T02:42:18.7741500Z [717/732] Compiling Slotstream CPUSlotWrite.swift
2026-10-05T02:42:18.7742020Z [718/732] Compiling Slotstream CacheBookkeeping.swift
2026-10-05T02:42:18.7742470Z [719/732] Compiling Slotstream Checkpoint.swift
2026-10-05T02:42:18.7742860Z [720/732] Compiling Slotstream CodingToolLaunch.swift
2026-10-05T02:42:18.7743350Z [721/732] Compiling Slotstream CompiledArithmetic.swift
2026-10-05T02:42:18.7743760Z [722/732] Compiling Slotstream Context.swift
2026-10-05T02:42:18.7744250Z [723/732] Compiling Slotstream ContextFeasibility.swift
2026-10-05T02:42:18.7744720Z [724/732] Compiling Slotstream ContextMemory.swift
2026-10-05T02:42:18.7745110Z [725/732] Compiling Slotstream ContextWindowPolicy.swift
2026-10-05T02:42:18.7745600Z [726/732] Compiling Slotstream DecodeLookahead+Configuration.swift
2026-10-05T02:42:18.7745980Z [727/732] Compiling Slotstream DecodeLookahead.swift
2026-10-05T02:42:18.7746360Z [728/732] Compiling Slotstream DownloadConcurrency.swift
2026-10-05T02:42:18.7746670Z [729/732] Emitting module Slotstream
2026-10-05T02:42:26.3437270Z [730/778] Compiling Slotstream MemTrace.swift
2026-10-05T02:42:26.3438090Z [731/778] Compiling Slotstream Model.swift
2026-10-05T02:42:26.3438490Z [732/778] Compiling Slotstream ModelPackLoadedSelection.swift
2026-10-05T02:42:26.3439780Z [733/778] Compiling Slotstream ModelPackPlanning.swift
2026-10-05T02:42:26.3441170Z [734/778] Compiling Slotstream ModelPackRegistry.swift
2026-10-05T02:42:26.3444080Z [735/778] Compiling Slotstream ModelPackStartupDefaults.swift
2026-10-05T02:42:26.3458210Z [736/778] Compiling Slotstream ModelPackStartupSelection.swift
2026-10-05T02:42:26.3591990Z [737/778] Compiling Slotstream NgramHash.swift
2026-10-05T02:42:26.3693030Z [738/778] Compiling Slotstream NgramPrefetch.swift
2026-10-05T02:42:26.3794180Z [739/778] Compiling Slotstream NgramStore.swift
2026-10-05T02:42:26.3822600Z [740/778] Compiling Slotstream Observation.swift
2026-10-05T02:42:26.3829590Z [741/778] Compiling Slotstream OpenAIDialect.swift
2026-10-05T02:42:26.3833480Z [742/778] Compiling Slotstream OpenAIOutput.swift
2026-10-05T02:42:26.3834190Z [743/778] Compiling Slotstream OptimizationPlatform.swift
2026-10-05T02:42:26.3834840Z [744/778] Compiling Slotstream Optimizations.swift
2026-10-05T02:42:26.3835300Z [745/778] Compiling Slotstream PackMemoryProfile.swift
2026-10-05T02:42:26.3836170Z [746/778] Compiling Slotstream PackedExpertLayout.swift
2026-10-05T02:42:26.3836680Z [747/778] Compiling Slotstream PackedProjectionPair.swift
2026-10-05T02:42:26.3837320Z [748/778] Compiling Slotstream PartialRotation.swift
2026-10-05T02:42:26.3838180Z [749/778] Compiling Slotstream PersistentPrefixCache.swift
2026-10-05T02:42:26.3838720Z [750/778] Compiling Slotstream PersistentPrefixConversation.swift
2026-10-05T02:42:26.3839210Z [751/778] Compiling Slotstream PersistentPrefixFormat.swift
2026-10-05T02:42:26.3839680Z [752/778] Compiling Slotstream PersistentPrefixGenerator.swift
2026-10-05T02:42:35.0174380Z [753/801] Compiling Slotstream PersistentPrefixPolicy.swift
2026-10-05T02:42:35.0303300Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0439550Z 34 |         lock.lock()
2026-10-05T02:42:35.0565290Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0684260Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0733200Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0733950Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0734540Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0735680Z [754/801] Compiling Slotstream PersistentPrefixRestore.swift
2026-10-05T02:42:35.0736560Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0737870Z 34 |         lock.lock()
2026-10-05T02:42:35.0741370Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0741850Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0745610Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0747510Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0750580Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0751130Z [755/801] Compiling Slotstream PersistentPrefixSave.swift
2026-10-05T02:42:35.0752080Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0755260Z 34 |         lock.lock()
2026-10-05T02:42:35.0759110Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0769850Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0773680Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0778700Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0785930Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0786420Z [756/801] Compiling Slotstream PinnedModel.swift
2026-10-05T02:42:35.0787240Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0794240Z 34 |         lock.lock()
2026-10-05T02:42:35.0832300Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0832860Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0834480Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0835150Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0835670Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0836260Z [757/801] Compiling Slotstream PinnedTransport.swift
2026-10-05T02:42:35.0839720Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0841620Z 34 |         lock.lock()
2026-10-05T02:42:35.0842450Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0844030Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0845580Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0846280Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0847060Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0847550Z [758/801] Compiling Slotstream PinnedTransportManifest.swift
2026-10-05T02:42:35.0848360Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0849500Z 34 |         lock.lock()
2026-10-05T02:42:35.0850940Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0852190Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0852750Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0853430Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0853930Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0854450Z [759/801] Compiling Slotstream Plan.swift
2026-10-05T02:42:35.0855630Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0856880Z 34 |         lock.lock()
2026-10-05T02:42:35.0857640Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0858490Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0859160Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0859780Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0860310Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0863760Z [760/801] Compiling Slotstream PlannerCostModel.swift
2026-10-05T02:42:35.0866160Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0868000Z 34 |         lock.lock()
2026-10-05T02:42:35.0869320Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0869740Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0871590Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0872330Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0876000Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0878080Z [761/801] Compiling Slotstream PlannerDevice.swift
2026-10-05T02:42:35.0879190Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0880760Z 34 |         lock.lock()
2026-10-05T02:42:35.0881180Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0881620Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0882200Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0885880Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0887070Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0888590Z [762/801] Compiling Slotstream PrefillReadPolicy.swift
2026-10-05T02:42:35.0889510Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0890270Z 34 |         lock.lock()
2026-10-05T02:42:35.0890570Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0891110Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0892550Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0894030Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0895290Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0896060Z [763/801] Compiling Slotstream PrefixCache.swift
2026-10-05T02:42:35.0896810Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0898610Z 34 |         lock.lock()
2026-10-05T02:42:35.0899850Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0900470Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0901590Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0902390Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0902910Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0903330Z [764/801] Compiling Slotstream PressureBoundary.swift
2026-10-05T02:42:35.0904270Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0905720Z 34 |         lock.lock()
2026-10-05T02:42:35.0906120Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0906540Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0907050Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0907760Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0908660Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0913890Z [765/801] Compiling Slotstream ProcessMemory.swift
2026-10-05T02:42:35.0914720Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0916610Z 34 |         lock.lock()
2026-10-05T02:42:35.0917030Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0917400Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0917990Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0919690Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0920200Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0920610Z [766/801] Compiling Slotstream QuantizationLayout.swift
2026-10-05T02:42:35.0922030Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0923130Z 34 |         lock.lock()
2026-10-05T02:42:35.0923480Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0924480Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0925500Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0926260Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0927390Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0927810Z [767/801] Compiling Slotstream RequestControl.swift
2026-10-05T02:42:35.0928600Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0929330Z 34 |         lock.lock()
2026-10-05T02:42:35.0930860Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0931230Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0931780Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0932390Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0933500Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0934000Z [768/801] Compiling Slotstream ResidentExpertOverlap.swift
2026-10-05T02:42:35.0934710Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0935500Z 34 |         lock.lock()
2026-10-05T02:42:35.0936260Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.0937160Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.0937720Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.0938230Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.0939040Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.0940120Z [769/801] Compiling Slotstream ResponsesDialect.swift
2026-10-05T02:42:35.0941360Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1043810Z 34 |         lock.lock()
2026-10-05T02:42:35.1145110Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.1181900Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.1183320Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1184730Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.1185390Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.1185850Z [770/801] Compiling Slotstream RouterProjection.swift
2026-10-05T02:42:35.1186800Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1187930Z 34 |         lock.lock()
2026-10-05T02:42:35.1188850Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.1189330Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.1191970Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1192910Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.1193510Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.1196550Z [771/801] Compiling Slotstream RouterSelection.swift
2026-10-05T02:42:35.1198150Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1199890Z 34 |         lock.lock()
2026-10-05T02:42:35.1200430Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.1201790Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.1203530Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1205380Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.1206860Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.1209870Z [772/801] Compiling Slotstream RouterTapCorrection.swift
2026-10-05T02:42:35.1214650Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1217130Z 34 |         lock.lock()
2026-10-05T02:42:35.1218640Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.1219210Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.1220480Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1221410Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.1223510Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.1224000Z [773/801] Compiling Slotstream RouterTrace.swift
2026-10-05T02:42:35.1225580Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1226630Z 34 |         lock.lock()
2026-10-05T02:42:35.1227380Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.1228190Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.1228990Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1230210Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.1230930Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.1233530Z [774/801] Compiling Slotstream RoutingReadbackQueue.swift
2026-10-05T02:42:35.1293130Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1294590Z 34 |         lock.lock()
2026-10-05T02:42:35.1294780Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.1295040Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.1295680Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1296180Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.1296630Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:35.1297030Z [775/801] Compiling Slotstream SelectedAttention.swift
2026-10-05T02:42:35.1298050Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1298910Z 34 |         lock.lock()
2026-10-05T02:42:35.1299210Z 35 |         defer { lock.unlock() }
2026-10-05T02:42:35.1299680Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
2026-10-05T02:42:35.1300260Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
2026-10-05T02:42:35.1300790Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
2026-10-05T02:42:35.1301110Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
2026-10-05T02:42:36.7947010Z [776/824] Compiling Slotstream DownloadHTTP.swift
2026-10-05T02:42:36.8096400Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8234870Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.8337810Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.8439580Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.8549820Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8651930Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.8753720Z 109 |                     }
2026-10-05T02:42:36.8857200Z [777/824] Compiling Slotstream EmbeddingRows.swift
2026-10-05T02:42:36.8925720Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8926550Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.8926940Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.8927340Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.8927850Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8928480Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.8928930Z 109 |                     }
2026-10-05T02:42:36.8929190Z [778/824] Compiling Slotstream Engine.swift
2026-10-05T02:42:36.8929930Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8931420Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.8936830Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.8937770Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.8938880Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8940240Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.8941300Z 109 |                     }
2026-10-05T02:42:36.8941900Z [779/824] Compiling Slotstream Errors.swift
2026-10-05T02:42:36.8948330Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8949970Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.8950780Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.8951590Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.8952650Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8954030Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.8955050Z 109 |                     }
2026-10-05T02:42:36.8955680Z [780/824] Compiling Slotstream ExactRead.swift
2026-10-05T02:42:36.8957230Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8958840Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.8959630Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.8962960Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.8964220Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8965540Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.8967880Z 109 |                     }
2026-10-05T02:42:36.8968720Z [781/824] Compiling Slotstream ExpertLookaheadTrace.swift
2026-10-05T02:42:36.8969400Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8970110Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.8970440Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.8970760Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.8975740Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8977430Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.8978720Z 109 |                     }
2026-10-05T02:42:36.8979570Z [782/824] Compiling Slotstream ExpertPredictor.swift
2026-10-05T02:42:36.8981230Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8982850Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.8984850Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.8991280Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.8992840Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.8993540Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.8993990Z 109 |                     }
2026-10-05T02:42:36.8995900Z [783/824] Compiling Slotstream ExpertPrefetch.swift
2026-10-05T02:42:36.8997970Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9001100Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9001620Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9001940Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9002360Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9005600Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9006010Z 109 |                     }
2026-10-05T02:42:36.9006330Z [784/824] Compiling Slotstream ExpertStore.swift
2026-10-05T02:42:36.9006990Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9007600Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9007920Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9008250Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9008680Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9009210Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9009590Z 109 |                     }
2026-10-05T02:42:36.9009910Z [785/824] Compiling Slotstream ExpertTransferProfile.swift
2026-10-05T02:42:36.9010640Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9011250Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9013240Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9013580Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9014000Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9015670Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9016140Z 109 |                     }
2026-10-05T02:42:36.9016430Z [786/824] Compiling Slotstream FusedPrefillAttention.swift
2026-10-05T02:42:36.9017080Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9017680Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9018020Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9018410Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9018860Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9019370Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9019750Z 109 |                     }
2026-10-05T02:42:36.9020010Z [787/824] Compiling Slotstream GDNPhaseProfile.swift
2026-10-05T02:42:36.9021510Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9023090Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9023450Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9023780Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9024210Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9024760Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9025150Z 109 |                     }
2026-10-05T02:42:36.9025440Z [788/824] Compiling Slotstream GPUKeepAlive.swift
2026-10-05T02:42:36.9026040Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9026640Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9026950Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9027530Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9028010Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9028510Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9028910Z 109 |                     }
2026-10-05T02:42:36.9029150Z [789/824] Compiling Slotstream GatewayDialect.swift
2026-10-05T02:42:36.9029750Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9030370Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9030670Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9030990Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9031420Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9032010Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9032420Z 109 |                     }
2026-10-05T02:42:36.9032670Z [790/824] Compiling Slotstream GatewayOutput.swift
2026-10-05T02:42:36.9033250Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9033870Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9034360Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9034720Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9035140Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9035660Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9036050Z 109 |                     }
2026-10-05T02:42:36.9036300Z [791/824] Compiling Slotstream Generate.swift
2026-10-05T02:42:36.9036900Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9037510Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9037830Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9038150Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9038550Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9039060Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9039440Z 109 |                     }
2026-10-05T02:42:36.9039690Z [792/824] Compiling Slotstream GenerationPhase.swift
2026-10-05T02:42:36.9040290Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9040880Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9041200Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9041500Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9041900Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9042410Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9042820Z 109 |                     }
2026-10-05T02:42:36.9043060Z [793/824] Compiling Slotstream Governor.swift
2026-10-05T02:42:36.9043640Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9044340Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9044650Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9044960Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9045360Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9045870Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9046250Z 109 |                     }
2026-10-05T02:42:36.9046530Z [794/824] Compiling Slotstream LayerLocalVictim.swift
2026-10-05T02:42:36.9047130Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9047730Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9048040Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9048350Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9048750Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9049250Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9049630Z 109 |                     }
2026-10-05T02:42:36.9081980Z [795/824] Compiling Slotstream Layers.swift
2026-10-05T02:42:36.9083530Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9084230Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9084560Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9084880Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9085310Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9085830Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9086210Z 109 |                     }
2026-10-05T02:42:36.9159890Z [796/824] Compiling Slotstream MTP.swift
2026-10-05T02:42:36.9162130Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9162900Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9163310Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9163680Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9164120Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9164750Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9165280Z 109 |                     }
2026-10-05T02:42:36.9219490Z [797/824] Compiling Slotstream MTPExpertStream.swift
2026-10-05T02:42:36.9325870Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9335420Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9335710Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9336190Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9336660Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9337140Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9337500Z 109 |                     }
2026-10-05T02:42:36.9341650Z [798/824] Compiling Slotstream Machine.swift
2026-10-05T02:42:36.9346050Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9348280Z 105 |             data.withUnsafeMutableBytes { output in
2026-10-05T02:42:36.9352070Z 106 |                 for (i, id) in ids.enumerated() {
2026-10-05T02:42:36.9352540Z 107 |                     available[id]!.withUnsafeBytes { row in
2026-10-05T02:42:36.9353070Z     |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
2026-10-05T02:42:36.9353750Z 108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
2026-10-05T02:42:36.9356240Z 109 |                     }
2026-10-05T02:42:49.0770000Z [799/846] Compiling Slotstream VQPrefillStream.swift
2026-10-05T02:42:49.0773030Z [800/846] Compiling Slotstream VQRecord.swift
2026-10-05T02:42:49.0774730Z [801/846] Compiling Slotstream VQRecordBank.swift
2026-10-05T02:42:49.0776300Z [802/846] Compiling Slotstream VQRecordCache.swift
2026-10-05T02:42:49.0777710Z [803/846] Compiling Slotstream VQRecordReadBatch.swift
2026-10-05T02:42:49.0778860Z [804/846] Compiling Slotstream VQRecordReadPlan.swift
2026-10-05T02:42:49.0779840Z [805/846] Compiling Slotstream VQResidentText.swift
2026-10-05T02:42:49.0781290Z [806/846] Compiling Slotstream VQRotaryCoefficients.swift
2026-10-05T02:42:49.0782440Z [807/846] Compiling Slotstream VQRotaryTable.swift
2026-10-05T02:42:49.0783340Z [808/846] Compiling Slotstream VQRouteStream.swift
2026-10-05T02:42:49.0793540Z [809/846] Compiling Slotstream VQTensorFile.swift
2026-10-05T02:42:49.0795230Z [810/846] Compiling Slotstream VQTrunkProbe.swift
2026-10-05T02:42:49.0796070Z [811/846] Compiling Slotstream GatedDelta.swift
2026-10-05T02:42:49.0797010Z [812/846] Compiling Slotstream VerifyPassSelfCheck.swift
2026-10-05T02:42:49.0797890Z [813/846] Compiling Slotstream Version.swift
2026-10-05T02:42:49.0798760Z [814/846] Compiling Slotstream Vision.swift
2026-10-05T02:42:49.0799730Z [815/846] Compiling Slotstream VisionAttention.swift
2026-10-05T02:42:49.0800580Z [816/846] Compiling Slotstream VisionPrompt.swift
2026-10-05T02:42:49.0801560Z [817/846] Compiling Slotstream WeightDownload.swift
2026-10-05T02:42:49.0802410Z [818/846] Compiling Slotstream WeightStore.swift
2026-10-05T02:42:49.0803230Z [819/846] Compiling Slotstream Weights.swift
2026-10-05T02:42:49.0804150Z [820/846] Compiling Slotstream WordSlotWrite.swift
2026-10-05T02:42:51.1812810Z [821/846] Compiling Slotstream Server.swift
2026-10-05T02:42:51.1816110Z [822/846] Compiling Slotstream ServerActivity.swift
2026-10-05T02:42:51.1817120Z [823/846] Compiling Slotstream SlotWritePlan.swift
2026-10-05T02:42:51.1818180Z [824/846] Compiling Slotstream SlotpackDownload.swift
2026-10-05T02:42:51.1820840Z [825/846] Compiling Slotstream SlotpackManifest.swift
2026-10-05T02:42:51.1821290Z [826/846] Compiling Slotstream StatePrefixFork.swift
2026-10-05T02:42:51.1850010Z [827/846] Compiling Slotstream StateRecovery.swift
2026-10-05T02:42:51.1850390Z [828/846] Compiling Slotstream TapCorrectionSidecar.swift
2026-10-05T02:42:51.1850900Z [829/846] Compiling Slotstream ToolCallSplitter.swift
2026-10-05T02:42:51.1851380Z [830/846] Compiling Slotstream VQArithmetic.swift
2026-10-05T02:42:51.1851750Z [831/846] Compiling Slotstream VQBankAdmission.swift
2026-10-05T02:42:51.1852140Z [832/846] Compiling Slotstream VQCheckpoint.swift
2026-10-05T02:42:51.1852450Z [833/846] Compiling Slotstream VQDecode.swift
2026-10-05T02:42:51.1852900Z [834/846] Compiling Slotstream VQDenseOverlay.swift
2026-10-05T02:42:51.1853310Z [835/846] Compiling Slotstream VQDraftWeights.swift
2026-10-05T02:42:51.1853690Z [836/846] Compiling Slotstream VQExpert.swift
2026-10-05T02:42:51.1854140Z [837/846] Compiling Slotstream VQExpertKernels.swift
2026-10-05T02:42:51.1854510Z [838/846] Compiling Slotstream VQGenerationProbe.swift
2026-10-05T02:42:51.1856070Z [839/846] Compiling Slotstream VQKernelSources.swift
2026-10-05T02:42:51.1856410Z [840/846] Compiling Slotstream VQModelProbe.swift
2026-10-05T02:42:51.1856770Z [841/846] Compiling Slotstream VQPLERows.swift
2026-10-05T02:42:51.1857130Z [842/846] Compiling Slotstream VQPackedExperts.swift
2026-10-05T02:42:51.1857530Z [843/846] Compiling Slotstream VQPrefillRecords.swift
2026-10-05T02:43:01.5147090Z [844/859] Emitting module SevraRuntime
2026-10-05T02:43:01.5149190Z [845/859] Compiling SevraRuntime Changes.swift
2026-10-05T02:43:01.5150290Z [846/859] Compiling SevraRuntime ConversationContext.swift
2026-10-05T02:43:01.5151320Z [847/859] Compiling SevraRuntime Extensions.swift
2026-10-05T02:43:01.5152550Z [848/859] Compiling SevraRuntime Extraction.swift
2026-10-05T02:43:01.5153490Z [849/859] Compiling SevraRuntime HomeArchive.swift
2026-10-05T02:43:01.5154340Z [850/859] Compiling SevraRuntime HomeStore.swift
2026-10-05T02:43:01.5155150Z [851/859] Compiling SevraRuntime HomeTemplate.swift
2026-10-05T02:43:01.5156280Z [852/859] Compiling SevraRuntime HomeWriter.swift
2026-10-05T02:43:01.5157020Z [853/859] Compiling SevraRuntime Inference.swift
2026-10-05T02:43:01.5157850Z [854/859] Compiling SevraRuntime InferenceCache.swift
2026-10-05T02:43:01.5158630Z [855/859] Compiling SevraRuntime LocalIPC.swift
2026-10-05T02:43:01.5159530Z [856/859] Compiling SevraRuntime ModelActivation.swift
2026-10-05T02:43:09.5576850Z [857/870] Compiling SevraRuntime ModelSetup.swift
2026-10-05T02:43:09.5577810Z [858/870] Compiling SevraRuntime ModelVerification.swift
2026-10-05T02:43:09.5578420Z [859/870] Compiling SevraRuntime Models.swift
2026-10-05T02:43:09.5591870Z [860/870] Compiling SevraRuntime Performance.swift
2026-10-05T02:43:09.5593370Z [861/870] Compiling SevraRuntime ResponseMetrics.swift
2026-10-05T02:43:09.5594350Z [862/870] Compiling SevraRuntime Runtime.swift
2026-10-05T02:43:09.5595240Z [863/870] Compiling SevraRuntime RuntimeExtensions.swift
2026-10-05T02:43:09.5596250Z [864/870] Compiling SevraRuntime SourceNavigation.swift
2026-10-05T02:43:09.5597500Z [865/870] Compiling SevraRuntime Sources.swift
2026-10-05T02:43:09.5598430Z [866/870] Compiling SevraRuntime Thinking.swift
2026-10-05T02:43:09.5599210Z [867/870] Compiling SevraRuntime Tools.swift
2026-10-05T02:43:27.0372870Z [868/877] Emitting module SevraMac
2026-10-05T02:43:27.0373380Z [869/877] Compiling SevraMac AppModel.swift
2026-10-05T02:43:27.0373840Z [870/877] Compiling SevraMac AppModelWork.swift
2026-10-05T02:43:27.0374200Z [871/877] Compiling SevraMac ContentView.swift
2026-10-05T02:43:27.0374560Z [872/877] Compiling SevraMac MacCommands.swift
2026-10-05T02:43:27.0374930Z [873/877] Compiling SevraMac MiniAppHost.swift
2026-10-05T02:43:27.0375430Z [874/877] Compiling SevraMac NativeControls.swift
2026-10-05T02:43:37.6606490Z [875/883] Compiling SevraMac NativeText.swift
2026-10-05T02:43:37.6606930Z [876/883] Compiling SevraMac ObserverMark.swift
2026-10-05T02:43:37.6607340Z [877/883] Compiling SevraMac ResponseDetails.swift
2026-10-05T02:43:37.6607910Z [878/883] Compiling SevraMac SevraMain.swift
2026-10-05T02:43:37.6608190Z [879/883] Compiling SevraMac WindowState.swift
2026-10-05T02:43:37.6608630Z [880/883] Compiling SevraMac WorkViews.swift
2026-10-05T02:43:37.7303440Z [880/883] Write Objects.LinkFileList
2026-10-05T02:43:42.5928790Z [881/883] Linking Sevra
2026-10-05T02:43:42.7419830Z [882/883] Applying Sevra
2026-10-05T02:43:42.7637890Z Build of product 'Sevra' complete! (318.77s)
2026-10-05T02:44:00.8412940Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/01-home-idle.png
2026-10-05T02:44:01.4053830Z IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver
2026-10-05T02:44:02.7173070Z PASS: Home composer shows the Think longer switch
2026-10-05T02:44:02.7173870Z PASS: Home hint stays plain while thinking is off
2026-10-05T02:44:03.8516780Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/02-thread-thinking-off.png
2026-10-05T02:44:04.8375150Z PASS: a new thread starts with Think longer off
2026-10-05T02:44:06.0686040Z   click Think longer at (646, 60)
2026-10-05T02:44:06.2326680Z PASS: Think longer is clickable
2026-10-05T02:44:06.9584400Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/03-thread-thinking-on.png
2026-10-05T02:44:08.0300380Z PASS: the thread remembers the switch
2026-10-05T02:44:08.0302360Z PASS: the hint explains the switch while it is on
2026-10-05T02:44:09.6056850Z   click Send at (1001, 60)
2026-10-05T02:44:09.7285260Z PASS: Send is clickable
2026-10-05T02:44:12.8785210Z PASS: run status shows Thinking with a clock: Thinking… 0:02
2026-10-05T02:44:14.0046160Z PASS: Thinking status and Answer now are visible while the thought runs
2026-10-05T02:44:14.0461050Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/04-thinking-live.png
2026-10-05T02:44:15.1397810Z PASS: the collapsed notes box is gone
2026-10-05T02:44:15.1399440Z PASS: the last lines of the thought are visible while it runs
2026-10-05T02:44:15.1401140Z PASS: the preview keeps to a few lines: 45 points
2026-10-05T02:44:16.0076490Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/05-details-while-thinking.png
2026-10-05T02:44:16.6658970Z   popover text: Response details | Thinking | Thinking... 0:05 | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 and | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | 10.3 tokens per second so far while thinking | The full numbers appear when the response finishes. | Context | 1 message, no saved memories | Inspect
2026-10-05T02:44:16.6661690Z PASS: clicking the preview opens the response's details
2026-10-05T02:44:16.6662020Z PASS: the details show the streaming working notes
2026-10-05T02:44:16.6662440Z PASS: the working notes state their privacy
2026-10-05T02:44:23.0308490Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/05b-thinking-long.png
2026-10-05T02:44:24.5618610Z PASS: a long thought stays within the preview's few lines: 45 points
2026-10-05T02:44:25.8270700Z   click Answer now at (920, 61)
2026-10-05T02:44:25.9163020Z PASS: Answer now is clickable
2026-10-05T02:44:35.5988390Z PASS: the run records an Answer now receipt: Thought for 16 s, then answered when you asked.
2026-10-05T02:44:35.5992630Z PASS: the answer arrived after Answer now
2026-10-05T02:44:35.5994200Z PASS: the run recorded its numbers
2026-10-05T02:44:35.6892180Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/06-answered.png
2026-10-05T02:44:36.7265350Z PASS: the reply shows how long Sevra thought, above the answer
2026-10-05T02:44:36.7266160Z PASS: Answer now is gone and no speed line shows while details are off
2026-10-05T02:44:36.7267370Z PASS: the composer hint now quotes a typical thinking time
2026-10-05T02:44:37.7912270Z   click link Thought for at (354, 612)
2026-10-05T02:44:38.1378280Z PASS: the thinking line is clickable
2026-10-05T02:44:38.8796240Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/07-details-after.png
2026-10-05T02:44:39.7396640Z   popover text: Response details | Copy | Thinking | Thought for 16 s, then answered when you asked. | 168 tokens at 10.5 tokens per second | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 | and the trip takes 2 hours 35 minutes. Adding the hours first | gives 11:40, then 35 minutes more gives 12:15. I should also | check whether the duration crosses noon, which it does, so the | answer stays in the same day. The user asks when a train arrives. | Departure is 9:40 and the trip takes 2 hours 35 minutes. Adding | the hours first gives 11:40, then 35 minutes more gives 12:15.I | should also check whether the duration crosses noon, which it | does, so the answer stays in the same day. The user asks when a | train arrives. Departure is 9:40 and the trip takes 2 hours 35 | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | Writing | 10.5 tokens per second | Written | 92 tokens in 8.7 s | First token | after 0.0 s | Context | 1 message, no saved memories | Inspect
2026-10-05T02:44:39.7408990Z PASS: the details state how thinking ended
2026-10-05T02:44:39.7409860Z PASS: the details show the recorded speed
2026-10-05T02:44:39.7410660Z PASS: the working notes remain while Sevra is open
2026-10-05T02:44:40.6310680Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/08-speed-line.png
2026-10-05T02:44:41.8963560Z PASS: turning details on adds the speed line under the reply
2026-10-05T02:44:43.0344970Z   click link tok/s at (362, 556)
2026-10-05T02:44:43.3921440Z PASS: the speed line is clickable
2026-10-05T02:44:44.1018330Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/09-details-from-speed-line.png
2026-10-05T02:44:44.9613570Z   popover text: Response details | Copy | Thinking | Thought for 16 s, then answered when you asked. | 168 tokens at 10.5 tokens per second | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 | and the trip takes 2 hours 35 minutes. Adding the hours first | gives 11:40, then 35 minutes more gives 12:15. I should also | check whether the duration crosses noon, which it does, so the | answer stays in the same day. The user asks when a train arrives. | Departure is 9:40 and the trip takes 2 hours 35 minutes. Adding | the hours first gives 11:40, then 35 minutes more gives 12:15.I | should also check whether the duration crosses noon, which it | does, so the answer stays in the same day. The user asks when a | train arrives. Departure is 9:40 and the trip takes 2 hours 35 | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | Writing | 10.5 tokens per second | Written | 92 tokens in 8.7 s | First token | after 0.0 s | Context | 1 message, no saved memories | Inspect
2026-10-05T02:44:44.9617570Z PASS: the speed line opens the full numbers
2026-10-05T02:44:45.9727130Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/10-speed-line-dark.png
2026-10-05T02:44:46.9851290Z PASS: dark appearance keeps both lines readable
2026-10-05T02:44:48.0595740Z   click link Thought for at (354, 612)
2026-10-05T02:44:48.4312760Z PASS: the thinking line is clickable in dark appearance
2026-10-05T02:44:48.9762340Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/11-details-dark.png
2026-10-05T02:44:49.9726380Z   popover text: Response details | Copy | Thinking | Thought for 16 s, then answered when you asked. | 168 tokens at 10.5 tokens per second | The user asks when a train arrives. Departure is 9:40 and the trip | takes 2 hours 35 minutes. Adding the hours first gives 11:40, then | 35 minutes more gives 12:15. I should also check whether the | duration crosses noon, which it does, so the answer stays in the | same day. The user asks when a train arrives. Departure is 9:40 | and the trip takes 2 hours 35 minutes. Adding the hours first | gives 11:40, then 35 minutes more gives 12:15. I should also | check whether the duration crosses noon, which it does, so the | answer stays in the same day. The user asks when a train arrives. | Departure is 9:40 and the trip takes 2 hours 35 minutes. Adding | the hours first gives 11:40, then 35 minutes more gives 12:15.I | should also check whether the duration crosses noon, which it | does, so the answer stays in the same day. The user asks when a | train arrives. Departure is 9:40 and the trip takes 2 hours 35 | Working notes are not saved or remembered. They stay only while Sevra is open. | Speed | Writing | Written | First token | 10.5 tokens per second | 92 tokens in 8.7 s | after 0.0 s | Context | 1 message, no saved memories | Inspect
2026-10-05T02:44:49.9740120Z PASS: the details render in dark appearance
2026-10-05T02:44:51.5898000Z   click Think longer at (648, 58)
2026-10-05T02:44:51.7199770Z PASS: Think longer is clickable again
2026-10-05T02:44:53.6521220Z PASS: clicking again turns thinking off and restores the plain hint (thinking=nil)
2026-10-05T02:44:54.7191400Z   click Send at (1001, 61)
2026-10-05T02:44:54.8638050Z PASS: Send is clickable for a plain reply
2026-10-05T02:44:55.6082490Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/12-live-speed.png
2026-10-05T02:44:57.1114220Z PASS: the status shows the live writing speed
2026-10-05T02:45:07.9390900Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-thinking-ui/13-plain-reply.png
2026-10-05T02:45:09.1563490Z PASS: the plain run has numbers and no thought
2026-10-05T02:45:10.7492400Z PASS: turning details off removes the speed lines and keeps the thinking line
2026-10-05T02:45:10.7525350Z PASS: thinking controls render and respond in the production Mac views
2026-10-05T02:45:14.4276370Z [0/1] Planning build
2026-10-05T02:45:14.4751450Z Building for debugging...
2026-10-05T02:45:15.1127450Z [0/3] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:45:15.1283550Z Build of product 'Sevra' complete! (3.80s)
2026-10-05T02:45:15.6623490Z Building for debugging...
2026-10-05T02:45:16.0446300Z [0/7] Write sources
2026-10-05T02:45:16.0459800Z [0/7] Write sevra-extract-entitlement.plist
2026-10-05T02:45:16.1599830Z [2/7] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:45:16.5061150Z [3/7] Compiling CSevraSandbox sevra_sandbox.c
2026-10-05T02:45:19.9981680Z [5/9] Compiling SevraExtract main.swift
2026-10-05T02:45:19.9982060Z [6/9] Emitting module SevraExtract
2026-10-05T02:45:20.0068460Z [6/9] Write Objects.LinkFileList
2026-10-05T02:45:20.4042270Z [7/9] Linking sevra-extract
2026-10-05T02:45:20.4249390Z [8/9] Applying sevra-extract
2026-10-05T02:45:20.4294270Z Build of product 'sevra-extract' complete! (4.84s)
2026-10-05T02:45:38.5923810Z   report: ["freshRtc": unavailable, "fetch": blocked, "worker": blocked, "websocket": blocked, "switchesOff": ["LinkDNSPrefetchEnabled": true, "PeerConnectionEnabled": true, "LinkPreconnect": true], "popup": false, "fetchSelf": blocked, "innerRtc": undefined, "url": "sevra-app://app/index.html", "lastChange": probe, "records": 1, "xhr": blocked, "rtc": undefined, "info": {"name":"Probe","version":0,"collections":[{"access":"write","name":"probe"}]}, "stored": <null>, "overwrite": false, "eventsource": blocked, "undeclared": denied, "beacon": true]
2026-10-05T02:45:38.5931600Z PASS: the page made no network connection (attempts seen: [])
2026-10-05T02:45:38.5935160Z PASS: WebKit reports peer connections, link preconnects and DNS prefetching off (["LinkDNSPrefetchEnabled": true, "PeerConnectionEnabled": true, "LinkPreconnect": true])
2026-10-05T02:45:38.5937960Z PASS: fetch is blocked
2026-10-05T02:45:38.5939070Z PASS: fetchSelf is blocked
2026-10-05T02:45:38.5940170Z PASS: xhr is blocked
2026-10-05T02:45:38.5941070Z PASS: websocket is blocked
2026-10-05T02:45:38.5942200Z PASS: eventsource is blocked
2026-10-05T02:45:38.5943070Z   sendBeacon queued: true
2026-10-05T02:45:38.5947100Z PASS: peer connections are unavailable
2026-10-05T02:45:38.5950190Z PASS: no peer connection sent a datagram (0 seen; fresh frame: unavailable, srcdoc frame: undefined)
2026-10-05T02:45:38.5951870Z PASS: the page cannot open windows
2026-10-05T02:45:38.5953500Z PASS: an undeclared collection is refused
2026-10-05T02:45:38.5954740Z PASS: the page cannot replace the Sevra API
2026-10-05T02:45:38.5955830Z PASS: info reports only the declared collection
2026-10-05T02:45:38.6075290Z PASS: navigation away is refused (at sevra-app://app/index.html)
2026-10-05T02:45:38.6075730Z PASS: the page hears changes to its own collection only
2026-10-05T02:45:38.6076100Z PASS: the declared write reached the broker once
2026-10-05T02:45:42.1841790Z PASS: browser storage does not outlive the app view (<null>)
2026-10-05T02:45:44.3205830Z PASS: a second run and both teardowns made no network connection (attempts seen: [])
2026-10-05T02:45:44.3210100Z   links offered to the person: ["http://127.0.0.1:49217/link", "http://127.0.0.1:49217/link"]
2026-10-05T02:45:44.3212620Z PASS: a second run sent no datagram either
2026-10-05T02:45:45.7085580Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/01-folder-attached.png
2026-10-05T02:45:45.8525100Z IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver
2026-10-05T02:45:46.9946930Z PASS: the attached folder shows as a chip that can change
2026-10-05T02:45:48.6683070Z   click Send at (1001, 61)
2026-10-05T02:45:48.8470940Z PASS: Send is clickable
2026-10-05T02:45:50.5135370Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/02-changes-waiting.png
2026-10-05T02:45:51.5941580Z PASS: the run offers Review changes
2026-10-05T02:45:51.5943320Z PASS: nothing is written while the review waits
2026-10-05T02:45:52.6639050Z   click Review changes at (896, 224)
2026-10-05T02:45:52.7700170Z PASS: Review changes is clickable
2026-10-05T02:45:53.7808700Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/03-changes-review.png
2026-10-05T02:45:54.9092950Z PASS: the review shows the removed and added lines
2026-10-05T02:45:54.9107770Z PASS: the review offers Write and Discard
2026-10-05T02:45:55.6543260Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/03-changes-review-dark.png
2026-10-05T02:45:57.2486340Z   click Write 1 File at (1058, 28)
2026-10-05T02:45:57.3582080Z PASS: Write 1 File is clickable
2026-10-05T02:45:58.6513030Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/04-changes-written.png
2026-10-05T02:45:59.8246440Z PASS: after writing, the panel offers Undo
2026-10-05T02:46:01.4971540Z   click Send at (1001, 61)
2026-10-05T02:46:01.6433040Z PASS: Send is clickable for the app request
2026-10-05T02:46:03.9594080Z   click Review app at (910, 194)
2026-10-05T02:46:04.1099830Z PASS: Review app is clickable
2026-10-05T02:46:05.5689630Z PASS: the preview runs the app against scratch data
2026-10-05T02:46:05.5694060Z PASS: the preview wrote nothing to Home
2026-10-05T02:46:06.2840350Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/05-app-review.png
2026-10-05T02:46:07.4909120Z PASS: the review shows the data access and Turn On App
2026-10-05T02:46:08.4386300Z   click Turn On App at (1053, 27)
2026-10-05T02:46:08.5089620Z PASS: Turn On App is clickable
2026-10-05T02:46:10.0973870Z PASS: the approved app saved and shows a Home record
2026-10-05T02:46:10.9195460Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/06-app-open.png
2026-10-05T02:46:11.9021300Z PASS: the app canvas names the app and its offline boundary
2026-10-05T02:46:12.8645830Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/07-apps-and-skills.png
2026-10-05T02:46:14.0818860Z PASS: Apps & Skills lists the app and the built-in skills
2026-10-05T02:46:14.7733180Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/07-apps-and-skills-dark.png
2026-10-05T02:46:16.7188750Z   click Send at (1001, 61)
2026-10-05T02:46:16.8498550Z PASS: Send is clickable for the second app request
2026-10-05T02:46:19.2649670Z   click Review app at (910, 194)
2026-10-05T02:46:19.3517130Z PASS: Review app is clickable for the second app
2026-10-05T02:46:20.4061760Z SNAPSHOT: /Users/runner/work/slotstream/slotstream/.build/sevra-apps-ui/08-shared-collection-review.png
2026-10-05T02:46:22.1644980Z PASS: a review names records other apps already saved in a collection
2026-10-05T02:46:23.9866810Z   click Send at (1001, 61)
2026-10-05T02:46:24.0620170Z PASS: Send is clickable for the third app request
2026-10-05T02:46:30.2491040Z PASS: an app's own saves are not echoed back to it, so a save-on-change app stays at one record (1)
2026-10-05T02:46:30.3206050Z PASS: mini-app isolation and review flows work in the production Mac views
2026-10-05T02:46:31.3566710Z Building for debugging...
2026-10-05T02:46:33.0373350Z [0/3] Write swift-version-7974D3F7F03D5E95.txt
2026-10-05T02:46:33.0929030Z Build of product 'Sevra' complete! (1.86s)
2026-10-05T02:46:46.2204070Z IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver
2026-10-05T02:50:09.6030140Z PASS: light-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6132690Z PASS: light-custom, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6148700Z PASS: light-saved-above-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6149540Z PASS: light-saved-below-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6150780Z PASS: light-unavailable-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6151520Z PASS: light-failed-settings, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6152260Z PASS: light-failed-activation, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6152870Z PASS: light-corrupt-activation, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6174100Z PASS: light-corrupt-pending-settings, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6174820Z PASS: light-fixed, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6175460Z PASS: light-unavailable-pack, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6176190Z PASS: light-setup-reviewed, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6176820Z PASS: light-setup-stale, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6177520Z PASS: light-setup-verified, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6178200Z PASS: light-setup-unavailable, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6178910Z PASS: light-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T02:50:09.6179500Z PASS: dark-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6180170Z PASS: dark-custom, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6180930Z PASS: dark-saved-above-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6181530Z PASS: dark-saved-below-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6182170Z PASS: dark-unavailable-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6182770Z PASS: dark-failed-settings, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6183520Z PASS: dark-failed-activation, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6184170Z PASS: dark-corrupt-activation, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6184890Z PASS: dark-corrupt-pending-settings, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6185660Z PASS: dark-fixed, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6186280Z PASS: dark-unavailable-pack, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6187000Z PASS: dark-setup-reviewed, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6195970Z PASS: dark-setup-stale, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6196640Z PASS: dark-setup-verified, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6197470Z PASS: dark-setup-unavailable, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6198140Z PASS: dark-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T02:50:09.6198740Z PASS: system-automatic, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6199250Z PASS: system-custom, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6199850Z PASS: system-saved-above-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6200530Z PASS: system-saved-below-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6201230Z PASS: system-unavailable-range, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6201810Z PASS: system-failed-settings, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6202580Z PASS: system-failed-activation, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6203310Z PASS: system-corrupt-activation, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6204220Z PASS: system-corrupt-pending-settings, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6205020Z PASS: system-fixed, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6205610Z PASS: system-unavailable-pack, rendered controls, current budget, supported range and pending state
2026-10-05T02:50:09.6206210Z PASS: system-setup-reviewed, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6206860Z PASS: system-setup-stale, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6207630Z PASS: system-setup-verified, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6208330Z PASS: system-setup-unavailable, reviewed pack, complete installation and file-versus-load status remain readable
2026-10-05T02:50:09.6208950Z PASS: system-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T02:51:53.5829820Z PASS: saved document preview, symlink refusal and read budget
2026-10-05T02:51:53.5832810Z PASS: owner exclusion, real dbmd persistence, duplicate submit, bounded tool loop, exact approval, artifact publication, restart, draft, incognito
2026-10-05T02:51:53.5835870Z PASS: terminal gating, undeclared tools, single-file scope, sibling refusal, source symlink substitution
2026-10-05T02:51:53.5837870Z PASS: fresh-URL Home restart, macOS system-alias IPC binding and user-symlink refusal
2026-10-05T02:51:53.5839830Z PASS: historical documents and citations, journal atomic acceptance and restart, duplicate/revision refusal and closed-owner guards
2026-10-05T02:51:53.5841670Z PASS: idempotent memory admission and complete eligible memory text in AI context
2026-10-05T02:51:53.5843180Z PASS: malformed termination, undeclared mixed calls and multiple proposals fail before execution
2026-10-05T02:51:53.5847580Z PASS: one bounded tool-schema correction, no partial execution, preserved review, exhausted-retry and unavailable-tool refusal
2026-10-05T02:51:53.5849840Z PASS: observed artifact=propose spelling correction without alias execution; rejection and stale approval refusal
2026-10-05T02:51:53.5851640Z PASS: invalid artifact and duplicate identities do not poison durable recovery
2026-10-05T02:51:53.5852960Z PASS: source Unicode boundaries and skipped symbolic links
2026-10-05T02:51:53.5856290Z PASS: model verification hash parity and mid-read cancellation without model allocation
2026-10-05T02:51:53.5859120Z PASS: coherent Home backup, complete manifest, exact drafts, pending review, inert restore, explicit activation, monotonic Forget, unknown epochs, corruption/missing/symlink/path/collision/closure refusal and create-only publication
2026-10-05T02:51:53.5863540Z PASS: external draft inspection, exact review race refusal, preserved versions, revision adoption, restart review, no implicit inference, malformed record refusal and normal work after reconciliation
2026-10-05T02:51:53.5899940Z PASS: long Home recent windows, exact retained history, inspectable partial excerpts, matching-memory ranking, bounded full-memory text, suppression lineage and thread-only read/write scope
2026-10-05T02:51:53.5908030Z PASS: Home promotion selection, visible quotations, exact model context, idempotence, drafts, permissions, scope, restart, Forget, active-run refusal and external edits
2026-10-05T02:51:53.5910500Z PASS: loaded profile generation, allocation, preferences and operating conditions govern speed evidence
2026-10-05T02:51:53.5912830Z PASS: manifest-bound session verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
2026-10-05T02:51:53.5915100Z PASS: durable accepted versions, offline restart, exact setup ownership and nonmutating offers
2026-10-05T02:51:53.5917320Z PASS: durable activation phases, exclusive ownership, stale callbacks, interrupted writes, rollback, bounded state, explicit preserved-record repair and weights-free retry
2026-10-05T02:51:53.5921970Z PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
2026-10-05T02:51:53.5925040Z PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
2026-10-05T02:51:53.5925980Z PASS: accepted setup remains inside maintenance and forces the next configuration boundary
2026-10-05T02:51:53.5928180Z PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
2026-10-05T02:51:53.5929710Z PASS: context overflow preserves messages and refuses instead of silently trimming history
2026-10-05T02:51:53.5931700Z PASS: clicks apply at once, saves merge in the background, a saved draft waits for disk, nothing is lost (2 saves)
2026-10-05T02:51:53.5932900Z PASS: cooperative cancellation, FIFO cross-thread scheduling, durable nonce registry
2026-10-05T02:51:53.5933990Z PASS: real process termination after intent, documents, artifact and root record; idempotent restart
2026-10-05T02:51:53.5935490Z PASS: per-thread external edits pause writes and preserve user bytes
2026-10-05T02:51:53.5937240Z PASS: authenticated Unix IPC, long Home paths, invalid capability refusal, Incognito isolation, idempotent client submission and detached completion
2026-10-05T02:51:53.5939270Z PASS: draft revision races, submit/autosave ordering, shared/thread-only/incognito recall, correction provenance and Forget
2026-10-05T02:51:53.5941310Z PASS: thinking off by default, sticky switch, live thought, receipt, answer now, tool turns think within their budget, restart, no thought on disk
2026-10-05T02:51:53.5943070Z PASS: incognito thought stays in memory and leaves with its thread; local endpoint thinking intents
2026-10-05T02:51:53.5944940Z PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows
2026-10-05T02:51:53.5947940Z PASS: a thinking job records exact per-round numbers, a refused round counts, thoughts keep one step per round, numbers persist without text, older runs still decode, live speed while thinking and writing, notes for the eight most recent runs
2026-10-05T02:51:53.5951300Z PASS: document helper sandbox denies file reads, folder listing, writes, loopback network, process launch, window server and home access; its memory limit counts the whole process group
2026-10-05T02:51:53.5954400Z SKIP: image and scan recognition; the document helper reports text recognition unavailable on this Mac
2026-10-05T02:51:53.5956290Z PASS: multi-source attach, hidden and dependency folders skipped, PDF pages, word search fallback, RTF, Word, locked/damaged/oversized refusals, detach
2026-10-05T02:51:53.5958030Z PASS: tool groups follow access; cancelled document reading stops its helper
2026-10-05T02:51:53.5959560Z PASS: documented limits: eight attachments, 8 MB text files, 64 MB documents, 40 recognized pages per request, live folder navigation
2026-10-05T02:51:53.5961150Z PASS: tool-round narration stays out of answers and leads its activity
2026-10-05T02:51:53.5964200Z PASS: the model is told which files are attached, so "what is this?" has a referent
2026-10-05T02:51:53.5965790Z PASS: a refused proposal is corrected once, and a job that keeps being refused still stops
2026-10-05T02:51:53.5967750Z PASS: change tools follow access, read-before-edit, exact diff review, digest-bound approval, exact writes preserving mode and tags, undo with Trash recovery
2026-10-05T02:51:53.5970370Z PASS: external edits win, discard, hard-link refusal, symbolic-link swap refusal, review across restart with re-attached folder, Incognito read-only
2026-10-05T02:51:53.5972400Z PASS: process death while writing is reported after restart, never replayed, and undoable
2026-10-05T02:51:53.5975030Z PASS: knowledge base search and query, record-only tools, protected frontmatter/contract/paths, db.md writes, index and validation, undo with index rebuild, mid-write record edits kept
2026-10-05T02:51:53.5977260Z PASS: /skill proposal, reserved names, exact publication, /name use, no implied tools, tamper refusal, deactivation, restart
2026-10-05T02:51:53.5978400Z PASS: app review, exact publication, grants, host document, create/get/update/archive/restore, revision conflicts, scope and version refusals, malformed and nested data, db.md validation
2026-10-05T02:51:53.5979720Z PASS: app revision with shared data, version switching, tamper refusal, removal keeps data, Incognito, restart, write budget, inert restore, outside-edit pause
2026-10-05T02:51:53.5981760Z PASS: immediate folder grant, directory browsing, live creation/edit/rename/deletion, direct reads, stale-edit refusal
2026-10-05T02:51:53.5982780Z PASS: root confinement, hidden files, symlink boundaries, scoped dependency traversal, file-only grants, multi-source identity and detach
2026-10-05T02:51:53.5983820Z OBSERVATION: 12001-file attachment accepted in 9.858333351075999e-05 seconds (functional observation, not a benchmark)
2026-10-05T02:51:53.5984720Z PASS: large folder acceptance, gap-free listing and search, changed-directory refusal, cancellation and descriptor cleanup
2026-10-05T02:51:53.5986220Z PASS: within-file pagination, UTF-8 offsets, query binding, content mutation and explicit word matching
2026-10-05T02:51:53.6000740Z PASS: global stream ceiling, honest cursor eviction and complete restart
2026-10-05T02:51:53.6001590Z PASS: explicit depth coverage, direct deep navigation, accurate capability context and owner tool-loop integration
2026-10-05T02:52:00.9820440Z PASS: loaded profile generation, allocation, preferences and operating conditions govern speed evidence
2026-10-05T02:52:00.9821930Z PASS: manifest-bound session verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
2026-10-05T02:52:00.9822790Z PASS: durable accepted versions, offline restart, exact setup ownership and nonmutating offers
2026-10-05T02:52:00.9825330Z PASS: durable activation phases, exclusive ownership, stale callbacks, interrupted writes, rollback, bounded state, explicit preserved-record repair and weights-free retry
2026-10-05T02:52:00.9826510Z PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
2026-10-05T02:52:00.9828610Z PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
2026-10-05T02:52:00.9829420Z PASS: accepted setup remains inside maintenance and forces the next configuration boundary
2026-10-05T02:52:00.9830120Z PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
2026-10-05T02:52:00.9830770Z PASS: context overflow preserves messages and refuses instead of silently trimming history
2026-10-05T02:52:01.0257220Z ##[group]Run actions/upload-artifact@v4
2026-10-05T02:52:01.0257560Z with:
2026-10-05T02:52:01.0257760Z   name: sevra-mac-ui-snapshots
2026-10-05T02:52:01.0258180Z   path: .build/sevra-thinking-ui/
.build/sevra-apps-ui/
.build/sevra-memory-ui/

2026-10-05T02:52:01.0258560Z   if-no-files-found: ignore
2026-10-05T02:52:01.0258890Z   compression-level: 6
2026-10-05T02:52:01.0259100Z   overwrite: false
2026-10-05T02:52:01.0259340Z   include-hidden-files: false
2026-10-05T02:52:01.0259620Z ##[endgroup]
2026-10-05T02:52:01.5318600Z (node:81952) [DEP0040] DeprecationWarning: The `punycode` module is deprecated. Please use a userland alternative instead.
2026-10-05T02:52:01.5320530Z (Use `node --trace-deprecation ...` to show where the warning was created)
2026-10-05T02:52:01.5943930Z Multiple search paths detected. Calculating the least common ancestor of all paths
2026-10-05T02:52:01.5945440Z The least common ancestor is /Users/runner/work/slotstream/slotstream/.build. This will be the root directory of the artifact
2026-10-05T02:52:01.5946080Z With the provided path, there will be 143 files uploaded
2026-10-05T02:52:01.5946680Z Artifact name is valid!
2026-10-05T02:52:01.5947000Z Root directory input is valid!
2026-10-05T02:52:02.0410350Z Beginning upload of artifact content to blob storage
2026-10-05T02:52:02.4623730Z (node:81952) [DEP0169] DeprecationWarning: `url.parse()` behavior is not standardized and prone to errors that have security implications. Use the WHATWG URL API instead. CVEs are not issued for `url.parse()` vulnerabilities.
2026-10-05T02:52:03.0179830Z Uploaded bytes 8388608
2026-10-05T02:52:03.1503240Z Uploaded bytes 13587602
2026-10-05T02:52:03.1998810Z Finished uploading artifact content to blob storage!
2026-10-05T02:52:03.2000550Z SHA256 digest of uploaded artifact zip is d9f44dd62e77022e24b39b579ae850be2dcd0300f79ac75aa87abd908cb06030
2026-10-05T02:52:03.2001660Z Finalizing artifact upload
2026-10-05T02:52:03.4810240Z Artifact sevra-mac-ui-snapshots.zip successfully finalized. Artifact ID 11322858458
2026-10-05T02:52:03.4812400Z Artifact sevra-mac-ui-snapshots has been successfully uploaded! Final size is 13587602 bytes. Artifact ID is 11322858458
2026-10-05T02:52:03.4833190Z Artifact download URL: https://github.com/carloslfu/slotstream/actions/runs/37255345401/artifacts/11322858458
2026-10-05T02:52:03.5163970Z Post job cleanup.
2026-10-05T02:52:03.6642150Z [command]/opt/homebrew/bin/git version
2026-10-05T02:52:03.6992700Z git version 2.55.0
2026-10-05T02:52:03.7028010Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/aadaa113-2f69-4139-b4bd-6fc266a31560/.gitconfig'
2026-10-05T02:52:03.7041910Z Temporarily overriding HOME='/Users/runner/work/_temp/aadaa113-2f69-4139-b4bd-6fc266a31560' before making global git config changes
2026-10-05T02:52:03.7043530Z Adding repository directory to the temporary git global config as a safe directory
2026-10-05T02:52:03.7050200Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
2026-10-05T02:52:03.7224900Z Removing SSH command configuration
2026-10-05T02:52:03.7233890Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
2026-10-05T02:52:03.7332560Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2026-10-05T02:52:03.8602410Z Removing HTTP extra header
2026-10-05T02:52:03.8606580Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2026-10-05T02:52:03.8686740Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2026-10-05T02:52:03.9502710Z Removing includeIf entries pointing to credentials config files
2026-10-05T02:52:03.9506680Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
2026-10-05T02:52:03.9565190Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
2026-10-05T02:52:03.9565830Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
2026-10-05T02:52:03.9566300Z includeif.gitdir:/github/workspace/.git.path
2026-10-05T02:52:03.9566670Z includeif.gitdir:/github/workspace/.git/worktrees/*.path
2026-10-05T02:52:03.9571510Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
2026-10-05T02:52:03.9627350Z /Users/runner/work/_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:52:03.9633970Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path \/Users\/runner\/work\/_temp\/git\-credentials\-6983149e\-77f3\-4f83\-b5bf\-7e99de34faa8\.config
2026-10-05T02:52:03.9697800Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
2026-10-05T02:52:03.9756470Z /Users/runner/work/_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:52:03.9768590Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path \/Users\/runner\/work\/_temp\/git\-credentials\-6983149e\-77f3\-4f83\-b5bf\-7e99de34faa8\.config
2026-10-05T02:52:03.9995340Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git.path
2026-10-05T02:52:03.9996030Z /github/runner_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:52:03.9997310Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git.path \/github\/runner_temp\/git\-credentials\-6983149e\-77f3\-4f83\-b5bf\-7e99de34faa8\.config
2026-10-05T02:52:04.0023860Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git/worktrees/*.path
2026-10-05T02:52:04.0076630Z /github/runner_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config
2026-10-05T02:52:04.0082220Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git/worktrees/*.path \/github\/runner_temp\/git\-credentials\-6983149e\-77f3\-4f83\-b5bf\-7e99de34faa8\.config
2026-10-05T02:52:04.0147440Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
2026-10-05T02:52:04.1242970Z Removing credentials config '/Users/runner/work/_temp/git-credentials-6983149e-77f3-4f83-b5bf-7e99de34faa8.config'
2026-10-05T02:52:04.1354170Z Cleaning up orphan processes
2026-10-05T02:52:04.7593210Z ##[warning]Node.js 20 is deprecated. The following actions target Node.js 20 but are being forced to run on Node.js 24: actions/upload-artifact@v4. For more information see: https://github.blog/changelog/2025-09-19-deprecation-of-node-20-on-github-actions-runners/

```
