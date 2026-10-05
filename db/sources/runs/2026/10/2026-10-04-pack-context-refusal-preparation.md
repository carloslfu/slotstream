---
type: run
created: 2026-10-05T03:45:20.395085+00:00
updated: 2026-10-05T03:45:20.395085+00:00
summary: Preserve pack-specific timing authority when context planning refuses every candidate
binary: Source on 07139e5 plus captured edits; native execution pending
captured_at: 2026-10-04
command: git diff --check; claims_gate; capture source and preceding CI receipt
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Pack context refusal preparation
tool: Existing automatic context result and model-pack planning diagnostics
---

Review of the context refusal path found that its explanation recovered the pack contract from the first feasible plan. If no plan fit, a new representation could fall through to the original context-speed explanation. AutomaticContextWindow now retains its immutable resource contract independently of plan success. Uncalibrated text remains uncalibrated after refusal, and its JSON does not advertise the original request-time tolerance or representative-request calibration. Original results keep their existing JSON and text behavior.

The existing native planning diagnostic adds an impossible candidate and checks both accepted and refused uncalibrated JSON for explicit unknown timing and the actual pack context limit. Diff and public claims pass. Native execution of this correction remains pending. The captured earlier context-foundation workflow has successful public-library and coverage jobs; its full weights-free job was still running at the earlier observation. Its exact capture below controls that status and is not acceptance of this correction.

No model, performance profile, operating memory limit, context capability or frozen study input changes. The actual standalone and final physical gates remain open.

## checks.json

Local evidence: `.build/quantization-research/pack-context-refusal-v1/checks.json`; bytes: 312; SHA-256: `4bbbfd2d63670a4ae56d1c4adc903f0a4f4431ee700321dcdad9e489f08fa0b7`.

```text
[
  {
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

Local evidence: `.build/quantization-research/pack-context-refusal-v1/source.diff`; bytes: 6638; SHA-256: `e6ba8ab4a82b0f1be4821dc9a42d7c1ff9e1b44c215daf3f449960a7dca212a0`.

```text
diff --git a/Sources/Slotstream/ContextWindowPolicy.swift b/Sources/Slotstream/ContextWindowPolicy.swift
index 4dadece..e6b80d4 100644
--- a/Sources/Slotstream/ContextWindowPolicy.swift
+++ b/Sources/Slotstream/ContextWindowPolicy.swift
@@ -39,9 +39,16 @@ public struct AutomaticContextWindow {
 
     public let window: Int
     public let candidates: [Candidate]
+    // Keep the contract even when every proposed plan is refused. Absence of
+    // a feasible plan cannot restore the original pack's timing explanation.
+    fileprivate let resources: PackMemoryProfile
+
+    fileprivate init(window: Int, candidates: [Candidate], resources: PackMemoryProfile) {
+        self.window = window; self.candidates = candidates; self.resources = resources
+    }
 
     public var json: [String: Any] {
-        [
+        var result: [String: Any] = [
             "window": window,
             "candidate_windows": ContextPolicy.automaticWindows,
             "request_time_tolerance": ContextPolicy.automaticRequestTimeTolerance,
@@ -68,13 +75,20 @@ public struct AutomaticContextWindow {
                 return d
             },
         ]
+        if !resources.usesBaselineSpeedEvidence {
+            result["request_time_tolerance"] = NSNull()
+            result["representative_request"] = NSNull()
+            result["timing_calibrated"] = false
+            result["pack_context_limit"] = resources.maximumContext
+        }
+        return result
     }
 
     /// The startup line under the plan banner.
     public func announcement(served: Int) -> String {
-        if let plan = candidates.first?.plan, !plan.resources.usesBaselineSpeedEvidence {
+        if !resources.usesBaselineSpeedEvidence {
             return "  window: automatic, \(served) tokens; this pack has no calibrated context-speed tradeoff. "
-                + "--max-context N selects a supported window up to \(plan.resources.maximumContext) tokens."
+                + "--max-context N selects a supported window up to \(resources.maximumContext) tokens."
         }
         let windows = ContextPolicy.automaticWindows.map(String.init).joined(separator: ", ")
         let percent = Int((ContextPolicy.automaticRequestTimeTolerance * 100).rounded())
@@ -85,10 +99,10 @@ public struct AutomaticContextWindow {
 
     /// The doctor section: each candidate and why auto took or declined it.
     public func report(served: Int) -> String {
-        if let plan = candidates.first?.plan, !plan.resources.usesBaselineSpeedEvidence {
+        if !resources.usesBaselineSpeedEvidence {
             return "\ncontext window: automatic, \(served) tokens. The pack's memory contract sets its supported limit; "
                 + "no context-speed estimate is available. Use --max-context N to choose another supported window "
-                + "up to \(plan.resources.maximumContext) tokens. Every choice still needs current memory admission."
+                + "up to \(resources.maximumContext) tokens. Every choice still needs current memory admission."
         }
         func pad(_ s: String, _ width: Int) -> String {
             s.count >= width ? s : String(repeating: " ", count: width - s.count) + s
@@ -219,7 +233,7 @@ extension Planner {
         guard let basePlan else {
             return AutomaticContextWindow(window: base, candidates: [Candidate(
                 window: base, plan: nil, refusal: baseRefusal, requestSeconds: nil, relativeRequestCost: nil,
-                accepted: true, reason: "default window; no plan on this machine to compare against")])
+                accepted: true, reason: "default window; no plan on this machine to compare against")], resources: resources)
         }
         guard resources.usesBaselineSpeedEvidence else {
             var candidates = [Candidate(window: base, plan: basePlan, refusal: nil,
@@ -231,7 +245,7 @@ extension Planner {
                     reason: window > resources.maximumContext ? "above this pack's supported limit"
                         : "this pack has no calibrated context-speed tradeoff"))
             }
-            return AutomaticContextWindow(window: base, candidates: candidates)
+            return AutomaticContextWindow(window: base, candidates: candidates, resources: resources)
         }
         let baseSeconds = estimatedRequestSeconds(basePlan)
         var chosen = base
@@ -262,7 +276,7 @@ extension Planner {
                 relativeRequestCost: hasUnmeasuredCacheReduction(value, from: basePlan) ? nil : cost,
                 accepted: accepted, reason: reason))
         }
-        return AutomaticContextWindow(window: chosen, candidates: candidates)
+        return AutomaticContextWindow(window: chosen, candidates: candidates, resources: resources)
     }
 
     /// The window and plan a process uses. An explicit window is planned as
diff --git a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
index 3003736..cee6094 100644
--- a/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift
@@ -146,6 +146,20 @@ extension Diagnostics {
             on: candidateMachine, mtpAvailable: true, qualification: true)
         c.expect("qualification cannot bypass the selected pack's context limit",
             qualified.requestedPlan == nil && qualified.maximumFeasibleWindow == resources.maximumContext)
+        let impossible = Planner.automaticContextWindow(resources: resources,
+            PlanRequest(memoryLimitGB: 1, mtp: .off, vision: .off), on: candidateMachine)
+        c.expect("an impossible candidate retains unknown timing in both context explanations",
+            impossible.candidates.allSatisfy { $0.plan == nil && $0.requestSeconds == nil } &&
+            impossible.announcement(served: impossible.window).contains("no calibrated") &&
+            impossible.report(served: impossible.window).contains("no context-speed estimate"))
+        for outcome in [automatic.automatic!, impossible] {
+            c.expect("uncalibrated JSON does not advertise the original request-cost policy",
+                outcome.json["timing_calibrated"] as? Bool == false &&
+                outcome.json["request_time_tolerance"] is NSNull &&
+                outcome.json["representative_request"] is NSNull &&
+                outcome.json["pack_context_limit"] as? Int == resources.maximumContext)
+            _ = try JSONSerialization.data(withJSONObject: outcome.json, options: [.sortedKeys])
+        }
         return c.report()
     }
 }

```

## preceding-context-ci.json

Local evidence: `.build/quantization-research/pack-context-refusal-v1/preceding-context-ci.json`; bytes: 5886; SHA-256: `66a021669b6a0b8b529e36ac142a7c892f17c5dd433ed5da9661aa4adff0e8d3`.

```text
{"conclusion":"","headSha":"2bb470676ed39e1c7aff1593c28da3cd9a1a678a","jobs":[{"completedAt":"0001-01-01T00:00:00Z","conclusion":"","databaseId":111602214171,"name":"weights-free","startedAt":"2026-10-05T03:23:22Z","status":"in_progress","steps":[{"completedAt":"2026-10-05T03:23:23Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:23:22Z","status":"completed"},{"completedAt":"2026-10-05T03:23:47Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:23:23Z","status":"completed"},{"completedAt":"2026-10-05T03:24:27Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T03:23:47Z","status":"completed"},{"completedAt":"2026-10-05T03:24:27Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T03:24:27Z","status":"completed"},{"completedAt":"2026-10-05T03:24:29Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T03:24:27Z","status":"completed"},{"completedAt":"2026-10-05T03:37:24Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T03:24:29Z","status":"completed"},{"completedAt":"2026-10-05T03:37:29Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T03:37:24Z","status":"completed"},{"completedAt":"2026-10-05T03:37:32Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T03:37:29Z","status":"completed"},{"completedAt":"2026-10-05T03:38:56Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T03:37:32Z","status":"completed"},{"completedAt":"2026-10-05T03:38:57Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T03:38:56Z","status":"completed"},{"completedAt":"0001-01-01T00:00:00Z","conclusion":"","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T03:38:57Z","status":"in_progress"},{"completedAt":"0001-01-01T00:00:00Z","conclusion":"","name":"sampler and governor goldens","number":12,"startedAt":"0001-01-01T00:00:00Z","status":"pending"},{"completedAt":"0001-01-01T00:00:00Z","conclusion":"","name":"check catalogue (every check by name)","number":13,"startedAt":"0001-01-01T00:00:00Z","status":"pending"},{"completedAt":"0001-01-01T00:00:00Z","conclusion":"","name":"the tested bytes still match the candidate","number":14,"startedAt":"0001-01-01T00:00:00Z","status":"pending"},{"completedAt":"0001-01-01T00:00:00Z","conclusion":"","name":"Post Run actions/checkout@v7","number":28,"startedAt":"0001-01-01T00:00:00Z","status":"pending"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608/job/111602214171"},{"completedAt":"2026-10-05T03:42:08Z","conclusion":"success","databaseId":111602214374,"name":"coverage","startedAt":"2026-10-05T03:26:51Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:26:52Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:26:51Z","status":"completed"},{"completedAt":"2026-10-05T03:27:40Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:26:52Z","status":"completed"},{"completedAt":"2026-10-05T03:27:40Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:27:40Z","status":"completed"},{"completedAt":"2026-10-05T03:27:43Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T03:27:40Z","status":"completed"},{"completedAt":"2026-10-05T03:42:02Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T03:27:43Z","status":"completed"},{"completedAt":"2026-10-05T03:42:02Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T03:42:02Z","status":"completed"},{"completedAt":"2026-10-05T03:42:04Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T03:42:02Z","status":"completed"},{"completedAt":"2026-10-05T03:42:04Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T03:42:04Z","status":"completed"},{"completedAt":"2026-10-05T03:42:07Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T03:42:04Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608/job/111602214374"},{"completedAt":"2026-10-05T03:36:14Z","conclusion":"success","databaseId":111602214400,"name":"public-library","startedAt":"2026-10-05T03:31:36Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:31:36Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:31:36Z","status":"completed"},{"completedAt":"2026-10-05T03:31:53Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:31:36Z","status":"completed"},{"completedAt":"2026-10-05T03:31:53Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:31:53Z","status":"completed"},{"completedAt":"2026-10-05T03:36:10Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T03:31:53Z","status":"completed"},{"completedAt":"2026-10-05T03:36:11Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T03:36:10Z","status":"completed"},{"completedAt":"2026-10-05T03:36:12Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T03:36:11Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608/job/111602214400"}],"status":"in_progress","url":"https://github.com/carloslfu/slotstream/actions/runs/37259065608"}

```
