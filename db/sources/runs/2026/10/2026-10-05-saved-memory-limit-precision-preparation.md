---
type: run
created: 2026-10-05T05:18:07.135614+00:00
updated: 2026-10-05T05:18:07.135614+00:00
summary: Preserve fractional saved memory limits through editing and response details; capture completed preceding native workflows
binary: Source preparation based on 939ea6ea17880bac52a969761aa91f3ce11396a7; new native precision checks pending CI
captured_at: 2026-10-05
command: git diff --check; Tools/llms_full.sh; python3 Tools/claims_gate.py; gh run view completed preceding workflows
tool: Saved memory control source review and preceding native CI receipts
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
discarded: false
title: Exact saved memory limit preparation
---

Review found that the editable Settings field rounded a saved limit to one decimal place. A saved 9.99 GB could display as 10 and committing that unchanged text could replace the user's actual preference. The prepared fix uses the shortest round-tripping Double representation with the locale's decimal separator, preserving exact saved limits in the field, slider accessibility value, saved/applied ceiling labels and response details. Approximate physical-memory observations still use their existing rounded display. Parsing and range admission remain separate; this change grants no new allocation authority.

Scripted fixtures cover decimal-separator round trips, invalid values, persisted fractional preferences and unchanged configuration identity after re-commit. Native rendering adds a fractional-limit case in every appearance, verifies that rendering does not mutate the saved preference, and shows an exact fractional ceiling beside a reduced response budget. These new native checks and visual inspection are pending. No local native build or additional model process ran while the frozen held-out comparison owns execution.

The captured prior context-refusal and shared-loader Engine/Mac workflows are complete successes at their own commits. The preceding compiler-mode Mac workflow also passed. Those results validate the earlier changes, not this prepared precision fix. No alternative pack or automatic performance profile is qualified.

## preparation.json

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/preparation.json`; bytes: 1882; SHA-256: `bc0a798baf83b81d08f02fcb3f32c4b4cd4355a2c1ed70ac18978fc24f5e5b90`.

```json
{
  "schema": 1,
  "source_base": "939ea6ea17880bac52a969761aa91f3ce11396a7",
  "change": "Exact round-trip formatting of saved memory ceilings",
  "diff_check_passed": true,
  "claims": "claims gate: 349 needle checks, 0 failures",
  "native_precision_checks": "pending CI",
  "native_precision_renders": "pending CI and direct image review",
  "local_model_execution": false,
  "frozen_quality_changed": false,
  "alternative_registry_entries": 0,
  "automatic_profiles": 0,
  "preceding_successful_workflows": [
    {
      "source": ".build/quantization-research/pack-owned-loader-preparation-v1/prior-context-refusal-engine-complete.json",
      "head_sha": "f3999859fca490fe8fa2eda4bfe0b05a4c51406f",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37260841915"
    },
    {
      "source": ".build/quantization-research/pack-owned-loader-preparation-v1/prior-context-refusal-mac-complete.json",
      "head_sha": "f3999859fca490fe8fa2eda4bfe0b05a4c51406f",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37260841902"
    },
    {
      "source": ".build/quantization-research/pack-owned-loader-preparation-v1/shared-loader-engine-complete.json",
      "head_sha": "4df189590e13b5d1d333f1fda2e49738b8bc754b",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37263150820"
    },
    {
      "source": ".build/quantization-research/pack-owned-loader-preparation-v1/shared-loader-mac-complete.json",
      "head_sha": "4df189590e13b5d1d333f1fda2e49738b8bc754b",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37263150784"
    },
    {
      "source": ".build/quantization-research/saved-memory-limit-precision-v1/build-evidence-mac-complete.json",
      "head_sha": "939ea6ea17880bac52a969761aa91f3ce11396a7",
      "url": "https://github.com/carloslfu/slotstream/actions/runs/37263860293"
    }
  ]
}

```

## claims.txt

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/claims.txt`; bytes: 43; SHA-256: `71d5b4e4bd5bd4fa5fcfd6a0c6f0e5869d0c8e36ef1bd5219b0d450f89f15940`.

```text
claims gate: 349 needle checks, 0 failures

```

## diff-check.txt

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/diff-check.txt`; bytes: 0; SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

```text

```

## implementation.diff

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/implementation.diff`; bytes: 16926; SHA-256: `6b9d58b3078f68ebf4369c8c58f52154c3eccb1db8ff2e882b88827a8765538d`.

```diff
diff --git a/apps/macos/App/ContentView.swift b/apps/macos/App/ContentView.swift
index adbb59e..5cda3ec 100644
--- a/apps/macos/App/ContentView.swift
+++ b/apps/macos/App/ContentView.swift
@@ -853,7 +853,7 @@ struct PerformanceSettings: View {
         // A saved limit can exceed this Mac's range after moving preferences
         // to another device. Show that actual value and let the person fix it;
         // displaying a silently clamped number would conceal the refusal.
-        limitText = saved.formatted(.number.precision(.fractionLength(0...1)))
+        limitText = MemoryLimitText.number(saved)
         limitError = rangeAvailable && model.performancePreferences.budget == .custom
             && (saved < minimum || saved > maximum)
             ? "Choose between \(gb(minimum)) and \(gb(maximum))." : nil
@@ -862,9 +862,7 @@ struct PerformanceSettings: View {
         guard rangeAvailable else {
             limitError = "A supported memory range is unavailable. Your saved limit is unchanged."; return
         }
-        let normalized = limitText.trimmingCharacters(in: .whitespacesAndNewlines)
-            .replacingOccurrences(of: Locale.current.decimalSeparator ?? ".", with: ".")
-        guard let value = Double(normalized), value.isFinite,
+        guard let value = MemoryLimitText.parse(limitText),
               value >= minimum, value <= maximum else {
             limitError = "Choose between \(gb(minimum)) and \(gb(maximum))."; return
         }
@@ -903,11 +901,11 @@ struct PerformanceSettings: View {
                         Slider(value: $limitGB, in: minimum...maximum, step: 0.5,
                                onEditingChanged: { editing in
                             if !editing {
-                                limitText = limitGB.formatted(.number.precision(.fractionLength(0...1)))
+                                limitText = MemoryLimitText.number(limitGB)
                                 commitLimit()
                             }
                         }) { Text("Maximum memory") }
-                            .accessibilityValue(gb(limitGB)).help("Set the maximum memory budget; Sevra can use less when needed")
+                            .accessibilityValue(MemoryLimitText.number(limitGB) + " GB").help("Set the maximum memory budget; Sevra can use less when needed")
                         TextField("Limit", text: $limitText).labelsHidden()
                             .textFieldStyle(.roundedBorder).frame(width: 64).multilineTextAlignment(.trailing)
                             .focused($editingNumber).onSubmit(commitLimit)
@@ -993,10 +991,10 @@ struct PerformanceSettings: View {
                         LabeledContent("Physical memory", value: gb(physical)).monospacedDigit()
                     }
                     if let ceiling = status.ceilingGB {
-                        LabeledContent("Saved memory ceiling", value: gb(ceiling)).monospacedDigit()
+                        LabeledContent("Saved memory ceiling", value: MemoryLimitText.number(ceiling) + " GB").monospacedDigit()
                     }
                     if status.pending, let applied = status.appliedCeilingGB {
-                        LabeledContent("Applied memory ceiling", value: gb(applied)).monospacedDigit()
+                        LabeledContent("Applied memory ceiling", value: MemoryLimitText.number(applied) + " GB").monospacedDigit()
                     }
                     if let used = status.usedGB {
                         LabeledContent("App memory", value: gb(used)).monospacedDigit()
diff --git a/apps/macos/Checks/PerformanceChecks.swift b/apps/macos/Checks/PerformanceChecks.swift
index b20c177..927289a 100644
--- a/apps/macos/Checks/PerformanceChecks.swift
+++ b/apps/macos/Checks/PerformanceChecks.swift
@@ -135,6 +135,25 @@ func performanceChecks(root: URL, dbmd: URL) async throws {
     try verifyPerformance(PerformancePolicy.ceilingGB(.init(), on: .simulated(ramGB: 16, availableGB: 15)) <=
         PerformancePolicy.maximumGB(on: .simulated(ramGB: 16)), "automatic ceiling fits the stable hardware range")
     try verifyPerformance(PerformancePreferences.restore(try JSONEncoder().encode(custom)) == custom, "large limit survives restart")
+    for locale in [Locale(identifier: "en_US"), Locale(identifier: "es_CO"), Locale(identifier: "de_DE")] {
+        for value in [9.99, 12.345, 33.0001, 0.000001, 1e20, Double.greatestFiniteMagnitude] {
+            let shown = MemoryLimitText.number(value, locale: locale)
+            try verifyPerformance(MemoryLimitText.parse(shown, locale: locale) == value,
+                "saved limits round-trip exactly, including values outside this Mac's range")
+        }
+        for invalid in ["", "not a number", "nan", "inf", "-1", "0"] {
+            try verifyPerformance(MemoryLimitText.parse(invalid, locale: locale) == nil,
+                "invalid limits cannot enter preferences")
+        }
+    }
+    try verifyPerformance(MemoryLimitText.number(9.99, locale: Locale(identifier: "es_CO")) == "9,99"
+        && MemoryLimitText.parse(" 9,99 ", locale: Locale(identifier: "es_CO")) == 9.99,
+        "the editable limit honors the decimal separator")
+    let precise = PerformancePreferences(budget: .custom, customGB: 9.99)
+    var recommitted = PerformancePreferences.restore(try JSONEncoder().encode(precise))
+    recommitted.customGB = MemoryLimitText.parse(MemoryLimitText.number(recommitted.customGB))!
+    try verifyPerformance(recommitted == precise && recommitted.matchesConfiguration(precise),
+        "opening and committing an unchanged fractional limit cannot change the load configuration")
     let legacy = PerformancePreferences.restore(Data("{\"budget\":\"automatic\",\"customGB\":10,\"readiness\":\"automatic\"}".utf8))
     try verifyPerformance(legacy.quantization == .automatic && legacy.liveMemory == .automatic,
         "old preferences gain independent automatic defaults")
diff --git a/apps/macos/Checks/ResponseDetailsChecks.swift b/apps/macos/Checks/ResponseDetailsChecks.swift
index 9820e3e..31fc6dc 100644
--- a/apps/macos/Checks/ResponseDetailsChecks.swift
+++ b/apps/macos/Checks/ResponseDetailsChecks.swift
@@ -26,7 +26,9 @@ func responseDetailsChecks(root: URL, dbmd: URL) async throws {
     try require(line == "12.5 tok/s · 250 tokens · 2.5 s to first token · model loaded in 18 s", "the line under a reply: \(line ?? "none")")
     try require(ResponseMetricsFormat.line(ResponseMetrics()) == nil, "no line without numbers")
     let report = ResponseMetricsFormat.report(total, thinking: nil)
-    try require(report.contains("Writing: 250 tokens in 20 s, 12.5 tok/s") && report.contains("Expert cache hits while writing: 75%") && report.contains("Memory budget: about 9.0 GB, within your 48.0 GB limit") && ResponseMetricsFormat.budgetText(20.14, custom: false) == "about 20.1 GB, automatic", "copied details state every number:\n\(report)")
+    try require(report.contains("Writing: 250 tokens in 20 s, 12.5 tok/s") && report.contains("Expert cache hits while writing: 75%") && report.contains("Memory budget: about 9.0 GB, within your 48 GB limit") && ResponseMetricsFormat.budgetText(20.14, custom: false) == "about 20.1 GB, automatic", "copied details state every number:\n\(report)")
+    try require(ResponseMetricsFormat.budgetText(9, custom: true, limitGB: 9.99)
+        == "about 9.0 GB, within your 9.99 GB limit", "response details preserve the exact saved ceiling")
     try require(total.memoryLimitGB == 48, "multiple rounds preserve the saved ceiling separately from the current budget")
     var recovered = second; recovered.budgetGB = 20; recovered.customBudget = true; recovered.memoryLimitGB = 48
     let afterRecovery = total.adding(recovered)
diff --git a/apps/macos/NativeChecks/MemoryUIChecks.swift b/apps/macos/NativeChecks/MemoryUIChecks.swift
index fcbab49..58e2452 100644
--- a/apps/macos/NativeChecks/MemoryUIChecks.swift
+++ b/apps/macos/NativeChecks/MemoryUIChecks.swift
@@ -20,7 +20,7 @@ import Vision
         window.setFrameOrigin(NSPoint(x: -30000, y: -30000))
         defer { window.orderOut(nil) }
         for appearance in ["light", "dark", "system"] {
-            for mode in ["automatic", "unloaded-automatic", "custom", "saved-above-range", "saved-below-range", "unavailable-range", "failed-settings", "failed-activation", "corrupt-activation", "corrupt-pending-settings", "fixed", "unavailable-pack"] {
+            for mode in ["automatic", "unloaded-automatic", "custom", "saved-fractional", "saved-above-range", "saved-below-range", "unavailable-range", "failed-settings", "failed-activation", "corrupt-activation", "corrupt-pending-settings", "fixed", "unavailable-pack"] {
                 let custom = mode != "automatic" && mode != "unloaded-automatic"
                 let overRange = mode == "saved-above-range"
                 let belowRange = mode == "saved-below-range"
@@ -30,7 +30,8 @@ import Vision
                 let activationFailed = mode == "failed-activation" || corrupt
                 let loaded = !corrupt && mode != "unloaded-automatic"
                 let pending = failedPending || (custom && !activationFailed)
-                var preferences = custom ? PerformancePreferences(budget: .custom, customGB: belowRange ? 10 : 48) : .init()
+                let savedLimit = belowRange ? 10.0 : mode == "saved-fractional" ? 9.99 : 48.0
+                var preferences = custom ? PerformancePreferences(budget: .custom, customGB: savedLimit) : .init()
                 if mode == "fixed" { preferences.liveMemory = .fixed }
                 if mode == "unavailable-pack" { preferences.quantization = .pack("removed-pack") }
                 model.performancePreferences = preferences
@@ -42,7 +43,7 @@ import Vision
                     detail: corrupt ? "Model setup needs repair."
                         : mode == "failed-activation" ? "The previous configuration is loaded."
                         : loaded ? "Responding on your Mac." : "Loads when you send a message.", idleMinutes: 10,
-                    physicalGB: 64 * 1.073741824, ceilingGB: custom ? 48 : 33, appliedCeilingGB: loaded ? 33 : nil,
+                    physicalGB: 64 * 1.073741824, ceilingGB: custom ? savedLimit : 33, appliedCeilingGB: loaded ? 33 : nil,
                     failure: failedPending ? "The retained model setup record is unreadable."
                         : mode == "failed-settings" ? "Choose a supported memory limit." : nil,
                     activationFailure: activationFailed ? "Your requested settings are preserved." : nil,
@@ -72,7 +73,7 @@ import Vision
                 let text = (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
                 let labels = ["Quantization", "While running", "Memory budget", "Keep model ready"]
                     + (loaded ? ["Budget available now", "14.5 GB"] : [])
-                    + (custom ? ["Custom limit", belowRange ? "10" : "48", "Your limit stays saved"]
+                    + (custom ? ["Custom limit", MemoryLimitText.number(savedLimit), "Your limit stays saved"]
                         + (rangeAvailable ? [overRange ? "37 GB" : "49.5 GB"] : []) : ["Automatic", "Recommended now"])
                     + (mode == "failed-settings" || activationFailed ? ["Settings could not be applied", "Queued work waits", "Retry settings"] : custom ? ["Applies after"] : [])
                     + (corrupt ? ["Repair model setup"] : [])
@@ -86,6 +87,9 @@ import Vision
                 for label in labels where !text.localizedCaseInsensitiveContains(label) {
                     throw NSError(domain: "MemoryUI", code: 2, userInfo: [NSLocalizedDescriptionKey: "\(name) missing rendered label: \(label)\n\(text)"])
                 }
+                if custom && model.performancePreferences.customGB != savedLimit {
+                    throw NSError(domain: "MemoryUI", code: 9, userInfo: [NSLocalizedDescriptionKey: "\(name) changed the saved limit merely by rendering the controls"])
+                }
                 if corrupt && model.performanceState.snapshot?.canRepairActivation != true {
                     throw NSError(domain: "MemoryUI", code: 5, userInfo: [NSLocalizedDescriptionKey: "\(name) must offer enabled repair after the settings failure"])
                 }
@@ -124,7 +128,7 @@ import Vision
             // Render the production response-details view at its actual width:
             // the saved ceiling must remain readable beside a smaller budget.
             var metrics = ResponseMetrics()
-            metrics.budgetGB = 14.5; metrics.memoryLimitGB = 48; metrics.customBudget = true
+            metrics.budgetGB = 14.5; metrics.memoryLimitGB = 48.125; metrics.customBudget = true
             var run = Run(id: "memory-receipt", nonce: "ui", inputDigest: "ui", state: .completed, status: "Done")
             run.metrics = metrics
             model.snapshot?.home.threads[0].run = run
@@ -142,7 +146,7 @@ import Vision
             let request = VNRecognizeTextRequest(); request.recognitionLevel = .accurate
             try VNImageRequestHandler(cgImage: rep.cgImage!, options: [:]).perform([request])
             let text = (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: " ")
-            for label in ["Memory budget", "14.5 GB", "48.0 GB limit"] where !text.contains(label) {
+            for label in ["Memory budget", "14.5 GB", "48.125 GB limit"] where !text.contains(label) {
                 throw NSError(domain: "MemoryUI", code: 3, userInfo: [NSLocalizedDescriptionKey: "\(name) missing \(label): \(text)"])
             }
             print("PASS: \(name), reduced budget and saved ceiling remain readable")
diff --git a/apps/macos/Runtime/Performance.swift b/apps/macos/Runtime/Performance.swift
index 56724e9..dab275b 100644
--- a/apps/macos/Runtime/Performance.swift
+++ b/apps/macos/Runtime/Performance.swift
@@ -61,6 +61,23 @@ public struct PerformancePreferences: Codable, Equatable, Sendable {
     }
 }
 
+/// An editable saved ceiling must round-trip without changing the preference.
+/// Approximate live-memory displays may round; the user's limit may not.
+public enum MemoryLimitText {
+    public static func number(_ value: Double, locale: Locale = .current) -> String {
+        let exact = String(value)
+        let compact = exact.hasSuffix(".0") ? String(exact.dropLast(2)) : exact
+        return compact.replacingOccurrences(of: ".", with: locale.decimalSeparator ?? ".")
+    }
+
+    public static func parse(_ text: String, locale: Locale = .current) -> Double? {
+        let normalized = text.trimmingCharacters(in: .whitespacesAndNewlines)
+            .replacingOccurrences(of: locale.decimalSeparator ?? ".", with: ".")
+        guard let value = Double(normalized), value.isFinite, value > 0 else { return nil }
+        return value
+    }
+}
+
 /// Product policy for the currently supported text model. It reuses the
 /// engine's adaptive ceiling and preserves its independent CLI.
 public enum PerformancePolicy {
diff --git a/apps/macos/Runtime/ResponseMetrics.swift b/apps/macos/Runtime/ResponseMetrics.swift
index c7e7ff3..89cace8 100644
--- a/apps/macos/Runtime/ResponseMetrics.swift
+++ b/apps/macos/Runtime/ResponseMetrics.swift
@@ -120,7 +120,8 @@ public enum ResponseMetricsFormat {
     /// A response's resolved budget and, when recorded, the separate saved ceiling.
     public static func budgetText(_ gb: Double, custom: Bool, limitGB: Double? = nil) -> String {
         if custom, let limitGB {
-            return String(format: "about %.1f GB, within your %.1f GB limit", gb, limitGB)
+            let limit = MemoryLimitText.number(limitGB, locale: Locale(identifier: "en_US_POSIX"))
+            return String(format: "about %.1f GB, within your %@ GB limit", gb, limit)
         }
         return String(format: "about %.1f GB, %@", gb, custom ? "custom setting" : "automatic")
     }
diff --git a/docs/SEVRA-MAC.md b/docs/SEVRA-MAC.md
index 191d637..942e77e 100644
--- a/docs/SEVRA-MAC.md
+++ b/docs/SEVRA-MAC.md
@@ -471,7 +471,8 @@ supported range. Its minimum prices the selected pack and requested context;
 its maximum comes from this Mac's hardware. Current headroom is checked again
 when loading. It retains automatic pressure protection. Switching to Custom starts
 at the current budget; returning to it restores your last chosen limit. The
-saved limit stays stable when available memory changes. Settings distinguish
+saved limit stays stable when available memory changes. Typed fractional limits
+retain their exact value in Settings and response details. Settings distinguish
 the app’s physical memory use from the budget available now. Unified
 CPU/GPU memory is counted once.
 **While running → Fixed cache capacity** keeps the cache size chosen at load

```

## prior-context-refusal-engine-complete.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/prior-context-refusal-engine-complete.json`; bytes: 6089; SHA-256: `410b8100c56978d73adb9cd1680eb543107be7b825668b5be0abd8fc44818fa8`.

```json
{"conclusion":"success","headSha":"f3999859fca490fe8fa2eda4bfe0b05a4c51406f","jobs":[{"completedAt":"2026-10-05T04:06:44Z","conclusion":"success","databaseId":111607542899,"name":"coverage","startedAt":"2026-10-05T03:53:00Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:53:01Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:53:00Z","status":"completed"},{"completedAt":"2026-10-05T03:53:31Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:53:01Z","status":"completed"},{"completedAt":"2026-10-05T03:53:31Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:53:31Z","status":"completed"},{"completedAt":"2026-10-05T03:53:34Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T03:53:31Z","status":"completed"},{"completedAt":"2026-10-05T04:06:38Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T03:53:34Z","status":"completed"},{"completedAt":"2026-10-05T04:06:39Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T04:06:38Z","status":"completed"},{"completedAt":"2026-10-05T04:06:41Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T04:06:39Z","status":"completed"},{"completedAt":"2026-10-05T04:06:42Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T04:06:41Z","status":"completed"},{"completedAt":"2026-10-05T04:06:42Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T04:06:42Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260841915/job/111607542899"},{"completedAt":"2026-10-05T04:39:18Z","conclusion":"success","databaseId":111607543031,"name":"weights-free","startedAt":"2026-10-05T04:02:41Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:02:42Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:02:41Z","status":"completed"},{"completedAt":"2026-10-05T04:03:10Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:02:42Z","status":"completed"},{"completedAt":"2026-10-05T04:04:01Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T04:03:10Z","status":"completed"},{"completedAt":"2026-10-05T04:04:01Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T04:04:01Z","status":"completed"},{"completedAt":"2026-10-05T04:04:04Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T04:04:01Z","status":"completed"},{"completedAt":"2026-10-05T04:17:25Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T04:04:04Z","status":"completed"},{"completedAt":"2026-10-05T04:17:30Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T04:17:25Z","status":"completed"},{"completedAt":"2026-10-05T04:17:33Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T04:17:30Z","status":"completed"},{"completedAt":"2026-10-05T04:19:02Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T04:17:33Z","status":"completed"},{"completedAt":"2026-10-05T04:19:03Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T04:19:02Z","status":"completed"},{"completedAt":"2026-10-05T04:37:52Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T04:19:03Z","status":"completed"},{"completedAt":"2026-10-05T04:38:09Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T04:37:52Z","status":"completed"},{"completedAt":"2026-10-05T04:39:06Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T04:38:09Z","status":"completed"},{"completedAt":"2026-10-05T04:39:08Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T04:39:06Z","status":"completed"},{"completedAt":"2026-10-05T04:39:10Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T04:39:09Z","status":"completed"},{"completedAt":"2026-10-05T04:39:17Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T04:39:10Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260841915/job/111607543031"},{"completedAt":"2026-10-05T04:13:04Z","conclusion":"success","databaseId":111607543044,"name":"public-library","startedAt":"2026-10-05T04:06:54Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:06:56Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:06:55Z","status":"completed"},{"completedAt":"2026-10-05T04:07:24Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:06:56Z","status":"completed"},{"completedAt":"2026-10-05T04:07:24Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:07:24Z","status":"completed"},{"completedAt":"2026-10-05T04:12:57Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T04:07:24Z","status":"completed"},{"completedAt":"2026-10-05T04:12:59Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T04:12:57Z","status":"completed"},{"completedAt":"2026-10-05T04:13:02Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T04:12:59Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260841915/job/111607543044"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37260841915"}

```

## prior-context-refusal-mac-complete.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/prior-context-refusal-mac-complete.json`; bytes: 3130; SHA-256: `371ae862710cd8ee5bedd34feb387931d220bcb90a69c493094e7ad528f99379`.

```json
{"conclusion":"success","headSha":"f3999859fca490fe8fa2eda4bfe0b05a4c51406f","jobs":[{"completedAt":"2026-10-05T04:20:53Z","conclusion":"success","databaseId":111607542817,"name":"checks","startedAt":"2026-10-05T03:58:12Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:58:14Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:58:13Z","status":"completed"},{"completedAt":"2026-10-05T03:58:31Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:58:14Z","status":"completed"},{"completedAt":"2026-10-05T03:58:31Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:58:31Z","status":"completed"},{"completedAt":"2026-10-05T03:58:31Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T03:58:31Z","status":"completed"},{"completedAt":"2026-10-05T04:20:46Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T03:58:31Z","status":"completed"},{"completedAt":"2026-10-05T04:20:49Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T04:20:46Z","status":"completed"},{"completedAt":"2026-10-05T04:20:50Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T04:20:49Z","status":"completed"},{"completedAt":"2026-10-05T04:20:51Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T04:20:50Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260841902/job/111607542817"},{"completedAt":"2026-10-05T04:09:00Z","conclusion":"success","databaseId":111607542939,"name":"xcode","startedAt":"2026-10-05T03:59:32Z","status":"completed","steps":[{"completedAt":"2026-10-05T03:59:33Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T03:59:33Z","status":"completed"},{"completedAt":"2026-10-05T03:59:51Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T03:59:33Z","status":"completed"},{"completedAt":"2026-10-05T03:59:51Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T03:59:51Z","status":"completed"},{"completedAt":"2026-10-05T03:59:54Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T03:59:51Z","status":"completed"},{"completedAt":"2026-10-05T04:08:55Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T03:59:54Z","status":"completed"},{"completedAt":"2026-10-05T04:08:57Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T04:08:55Z","status":"completed"},{"completedAt":"2026-10-05T04:08:58Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T04:08:57Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37260841902/job/111607542939"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37260841902"}

```

## shared-loader-engine-complete.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/shared-loader-engine-complete.json`; bytes: 6089; SHA-256: `d6397346de79d5b812d7a04c44f949d26e8d3eaff6c7f44c6271360b9874cc38`.

```json
{"conclusion":"success","headSha":"4df189590e13b5d1d333f1fda2e49738b8bc754b","jobs":[{"completedAt":"2026-10-05T04:59:52Z","conclusion":"success","databaseId":111614367429,"name":"weights-free","startedAt":"2026-10-05T04:21:30Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:21:32Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:21:31Z","status":"completed"},{"completedAt":"2026-10-05T04:21:55Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:21:32Z","status":"completed"},{"completedAt":"2026-10-05T04:22:38Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T04:21:55Z","status":"completed"},{"completedAt":"2026-10-05T04:22:38Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T04:22:38Z","status":"completed"},{"completedAt":"2026-10-05T04:22:41Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T04:22:38Z","status":"completed"},{"completedAt":"2026-10-05T04:38:08Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T04:22:41Z","status":"completed"},{"completedAt":"2026-10-05T04:38:13Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T04:38:08Z","status":"completed"},{"completedAt":"2026-10-05T04:38:16Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T04:38:13Z","status":"completed"},{"completedAt":"2026-10-05T04:39:45Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T04:38:16Z","status":"completed"},{"completedAt":"2026-10-05T04:39:45Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T04:39:45Z","status":"completed"},{"completedAt":"2026-10-05T04:58:20Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T04:39:45Z","status":"completed"},{"completedAt":"2026-10-05T04:58:37Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T04:58:20Z","status":"completed"},{"completedAt":"2026-10-05T04:59:44Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T04:58:37Z","status":"completed"},{"completedAt":"2026-10-05T04:59:46Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T04:59:44Z","status":"completed"},{"completedAt":"2026-10-05T04:59:47Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T04:59:46Z","status":"completed"},{"completedAt":"2026-10-05T04:59:51Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T04:59:47Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263150820/job/111614367429"},{"completedAt":"2026-10-05T04:27:03Z","conclusion":"success","databaseId":111614367480,"name":"public-library","startedAt":"2026-10-05T04:21:29Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:21:30Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:21:29Z","status":"completed"},{"completedAt":"2026-10-05T04:21:53Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:21:30Z","status":"completed"},{"completedAt":"2026-10-05T04:21:53Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:21:53Z","status":"completed"},{"completedAt":"2026-10-05T04:27:01Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T04:21:53Z","status":"completed"},{"completedAt":"2026-10-05T04:27:01Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T04:27:01Z","status":"completed"},{"completedAt":"2026-10-05T04:27:02Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T04:27:01Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263150820/job/111614367480"},{"completedAt":"2026-10-05T04:43:53Z","conclusion":"success","databaseId":111614367567,"name":"coverage","startedAt":"2026-10-05T04:30:28Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:30:29Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:30:28Z","status":"completed"},{"completedAt":"2026-10-05T04:31:06Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:30:29Z","status":"completed"},{"completedAt":"2026-10-05T04:31:06Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:31:06Z","status":"completed"},{"completedAt":"2026-10-05T04:31:08Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T04:31:06Z","status":"completed"},{"completedAt":"2026-10-05T04:43:46Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T04:31:08Z","status":"completed"},{"completedAt":"2026-10-05T04:43:46Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T04:43:46Z","status":"completed"},{"completedAt":"2026-10-05T04:43:49Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T04:43:46Z","status":"completed"},{"completedAt":"2026-10-05T04:43:50Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T04:43:49Z","status":"completed"},{"completedAt":"2026-10-05T04:43:50Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T04:43:50Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263150820/job/111614367567"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37263150820"}

```

## shared-loader-mac-complete.json

Local evidence: `.build/quantization-research/pack-owned-loader-preparation-v1/shared-loader-mac-complete.json`; bytes: 3130; SHA-256: `58d4d5d8e758d6be90e9ce671c1104d3a335dd5f62db3404b2e8f7c4c0535dbe`.

```json
{"conclusion":"success","headSha":"4df189590e13b5d1d333f1fda2e49738b8bc754b","jobs":[{"completedAt":"2026-10-05T04:44:50Z","conclusion":"success","databaseId":111614367131,"name":"checks","startedAt":"2026-10-05T04:21:29Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:21:30Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:21:29Z","status":"completed"},{"completedAt":"2026-10-05T04:22:08Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:21:30Z","status":"completed"},{"completedAt":"2026-10-05T04:22:08Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:22:08Z","status":"completed"},{"completedAt":"2026-10-05T04:22:08Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T04:22:08Z","status":"completed"},{"completedAt":"2026-10-05T04:44:44Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T04:22:08Z","status":"completed"},{"completedAt":"2026-10-05T04:44:46Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T04:44:44Z","status":"completed"},{"completedAt":"2026-10-05T04:44:47Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T04:44:46Z","status":"completed"},{"completedAt":"2026-10-05T04:44:47Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T04:44:47Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263150784/job/111614367131"},{"completedAt":"2026-10-05T04:33:07Z","conclusion":"success","databaseId":111614367306,"name":"xcode","startedAt":"2026-10-05T04:21:30Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:21:32Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:21:30Z","status":"completed"},{"completedAt":"2026-10-05T04:21:52Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:21:32Z","status":"completed"},{"completedAt":"2026-10-05T04:21:52Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:21:52Z","status":"completed"},{"completedAt":"2026-10-05T04:21:55Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T04:21:53Z","status":"completed"},{"completedAt":"2026-10-05T04:33:03Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T04:21:55Z","status":"completed"},{"completedAt":"2026-10-05T04:33:04Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T04:33:03Z","status":"completed"},{"completedAt":"2026-10-05T04:33:05Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T04:33:04Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263150784/job/111614367306"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37263150784"}

```

## build-evidence-mac-complete.json

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/build-evidence-mac-complete.json`; bytes: 3130; SHA-256: `71bc18ae81784f560ccafc84c2c96a953eba099c0798860a01bcebe8aeeecc6b`.

```json
{"conclusion":"success","headSha":"939ea6ea17880bac52a969761aa91f3ce11396a7","jobs":[{"completedAt":"2026-10-05T05:03:10Z","conclusion":"success","databaseId":111616446452,"name":"checks","startedAt":"2026-10-05T04:33:16Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:33:18Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:33:17Z","status":"completed"},{"completedAt":"2026-10-05T04:33:40Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:33:18Z","status":"completed"},{"completedAt":"2026-10-05T04:33:40Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:33:40Z","status":"completed"},{"completedAt":"2026-10-05T04:33:41Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T04:33:40Z","status":"completed"},{"completedAt":"2026-10-05T05:03:02Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T04:33:41Z","status":"completed"},{"completedAt":"2026-10-05T05:03:06Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T05:03:02Z","status":"completed"},{"completedAt":"2026-10-05T05:03:06Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T05:03:06Z","status":"completed"},{"completedAt":"2026-10-05T05:03:08Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T05:03:06Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263860293/job/111616446452"},{"completedAt":"2026-10-05T04:59:52Z","conclusion":"success","databaseId":111616446634,"name":"xcode","startedAt":"2026-10-05T04:47:46Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:47:47Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:47:46Z","status":"completed"},{"completedAt":"2026-10-05T04:48:13Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:47:47Z","status":"completed"},{"completedAt":"2026-10-05T04:48:13Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:48:13Z","status":"completed"},{"completedAt":"2026-10-05T04:48:16Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T04:48:13Z","status":"completed"},{"completedAt":"2026-10-05T04:59:47Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T04:48:16Z","status":"completed"},{"completedAt":"2026-10-05T04:59:48Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T04:59:47Z","status":"completed"},{"completedAt":"2026-10-05T04:59:50Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T04:59:48Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263860293/job/111616446634"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37263860293"}

```
