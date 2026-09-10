---
type: run
id: 01m1w9fg9a74b4r939n62crvbd
created: 2026-09-06T21:20:06.442+00:00
updated: 2026-09-06T21:20:46.967052+00:00
summary: Priced governor/MTP diagnostics and actual prefill schedule — V191
binary: Source-only integration; shared Swift build and native tests pending
captured_at: 2026-09-06
command: bash -n Tools/verify.sh; python3 -m py_compile Tools/context_gates.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Priced governor/MTP diagnostics and actual prefill schedule — V191
tool: Source review and exact three-way integration
---
V191 integrates three reviewed context-task corrections at the explicit idle source boundary after V189 returned its bounded model/build slot. Ten files merge without conflicts; shared transport/document changes are preserved by three-way merges. Shell and Python syntax checks pass. The new Swift source and added native/CLI assertions have not been built or executed in the shared checkout. V189 results remain bound to their earlier frozen executable.

The live governor diagnostic previously raised --slots 1000 to its floor-plus-3GB starting arena without exposing that larger total test budget. It now deterministically rejects the default10GB ceiling before model allocation, validates explicit ceilings/slots, and checks the real derived target plus3GB before load. The full acceptance invocation explicitly bounds it to13GB with16GB reclaimable preflight. Normal1GB shrink/2GB growth deadbands and60second cooldown remain unchanged. Queued real polls occur at controlled boundaries; growth prices the complete replacement pool, and every failure restores the prior availability override. A single final sampled-footprint/VM/physical/RSS tuple is validated before PASS and reused in its receipt. The full drill remains unrun and requires the clean transport handback.

Four MTP diagnostics previously planned with auto MTP disabled on small targets, then enabled the head afterward. Their shared plan entry now requires and prices the head before Engine allocation, rejecting an explicit incompatible --mtp off. MTPCheck uses Engine's guarded generation path, preserves cold comparisons by explicitly dropping prefix state, and validates the complete sampled physical/RSS/swap interval. Full acceptance requires an explicit image fixture, executed vision assertions, no SKIP and a validated memory receipt at a12GB target/15GB preflight. This is a diagnostic correction, not evidence that the larger combined-mode test has passed.

Schedule reporting also now follows the Generator's existing late canonical alignment and reports physical query rows and masked key extents. The source counterexample is an odd4095 override from position200000: nominal127-row passes differ from the runtime's64-row canonical dispatch. The report uses the same bounded geometry; Generator arithmetic, the published context cap and measured query-key bound do not change. Five added native assertions and two CLI cases remain unrun; eight drill and four mandatory-MTP refusal cases also await an identified build.

Artifact `/tmp/slotstream-optimization-execution/elastic-drill-review-v191/receipt.json` — 3389 bytes; SHA-256 `bd3e2d1fcf46f6d520a3a0baa1efe820e3463110d5c5495a09d6f3b6dc1dc79c`.

````text
{
  "applied": true,
  "files": [
    {
      "path": "Sources/slotstream-cli/main.swift",
      "merge_exit": 0,
      "source_before_sha256": "19c67da92554623e267ff0f2a065d95f8ca2e3b152cf858ce39b75acf0b8f046",
      "proposed_after_sha256": "20e42483d78cd4bf92102435557301667c694ef9c4fd98463971b008f64ab820",
      "exact_preimage": true,
      "stderr": ""
    },
    {
      "path": "Tools/verify.sh",
      "merge_exit": 0,
      "source_before_sha256": "f030c65754ed7d9058b995d9995f7dd6673c5dba66887138f37a8157cdac61e0",
      "proposed_after_sha256": "e5cf7f3849faee9f796d34173b899d2326c0d2ab606bf395acccc6b31dda2764",
      "exact_preimage": true,
      "stderr": ""
    },
    {
      "path": "Tools/context_gates.py",
      "merge_exit": 0,
      "source_before_sha256": "60767a837601e3b41b17a0f1b0bb04551852ef08735d667513d1cb333e713e41",
      "proposed_after_sha256": "3c735af4c0db4946eff5ef7240859b705ac6e3931a535ec49b7db7ce30954b76",
      "exact_preimage": true,
      "stderr": ""
    },
    {
      "path": "docs/CLI.md",
      "merge_exit": 0,
      "source_before_sha256": "25480fe87046430482bc805b773b6fbedf212ac074f70933376a7a91c987eb03",
      "proposed_after_sha256": "b090316a37fa9e337f3f59e5d9bc610048a2a945e80078b6fb1b746cde5c0f02",
      "exact_preimage": false,
      "stderr": ""
    },
    {
      "path": "docs/TESTING.md",
      "merge_exit": 0,
      "source_before_sha256": "c2dfc87704526344aa8aa20e2a558af11222b7db47100960440b01f8138b7e5b",
      "proposed_after_sha256": "da34833652eace5a832d85f9aa00a1aa25f269ecab0ba5f0a2ce673abafef861",
      "exact_preimage": false,
      "stderr": ""
    },
    {
      "path": "CLAUDE.md",
      "merge_exit": 0,
      "source_before_sha256": "731a5c4bbc06c11223c7407fbce258b82215815ba6cde892a2d86e30bdd69ec1",
      "proposed_after_sha256": "9b82a054f8b135998664a1e7c41d8f7981753d9d6f2885d30739e20728b6fc91",
      "exact_preimage": false,
      "stderr": ""
    },
    {
      "path": "Sources/slotstream-cli/MTPCommands.swift",
      "source_before_sha256": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "merge_exit": 0,
      "exact_preimage": true,
      "proposed_after_sha256": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b"
    },
    {
      "path": "Sources/Slotstream/Context.swift",
      "source_before_sha256": "63208fab453c9f87a15fdbd2990291cdc3120efc3087ec5fbab455d4239ce288",
      "merge_exit": 0,
      "exact_preimage": true,
      "proposed_after_sha256": "0bec23bc161e827c46851161cf131ebc6079e41270cc600a5ff33487e8f5f5f3"
    },
    {
      "path": "Sources/slotstream-cli/ContextCommands.swift",
      "source_before_sha256": "ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3",
      "merge_exit": 0,
      "exact_preimage": true,
      "proposed_after_sha256": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "source_before_sha256": "0c5f8e429c3b519d3b7ce2636961137bea7d82d7328a11180609450517a6c27e",
      "merge_exit": 0,
      "exact_preimage": true,
      "proposed_after_sha256": "f4419fbe8e88de30cec00761fad4507e41ce611ffe4cef2f87175c7423e7e4b5"
    }
  ],
  "ordered_packets": [
    "elastic-drill-ceiling-v2",
    "mtp-diagnostic-plan-v3",
    "schedule-report-v1"
  ],
  "applied_at": 1788729431.4433742
}

````

Artifact `/tmp/slotstream-optimization-execution/elastic-drill-review-v191/syntax.txt` — 106 bytes; SHA-256 `9edf923ae4cbdde6316b023d51bde0cb1784e0dd1008f5bee079883959d1136e`.

````text
['bash', '-n', 'Tools/verify.sh']: exit0
['python3', '-m', 'py_compile', 'Tools/context_gates.py']: exit0

````

Applied delta `Sources/slotstream-cli/main.swift`:

````diff
--- a/Sources/slotstream-cli/main.swift
+++ b/Sources/slotstream-cli/main.swift
@@ -144,16 +144,20 @@
     /// Resolve knobs -> plan, print the announce, return it. Also the first
     /// place a stranger hits with no weights — offer the download right there.
     func announcedPlan(maxContext: Int = ContextPolicy.defaultTokens, prefixCacheEnabled: Bool = true,
-                       maxPrefillWait: Double = 30, qualification: Bool = false) throws -> MemoryPlan {
+                       maxPrefillWait: Double = 30, qualification: Bool = false,
+                       requireMTP: Bool = false) throws -> MemoryPlan {
         let configuration = try ContextConfiguration(maxContextTokens: maxContext,
             maxPrefillWaitMinutes: maxPrefillWait, qualification: qualification)
         let policy = try runtimePolicy(prefixCacheEnabled: prefixCacheEnabled)
-        _ = try mtpMode(); _ = try visionMode()
+        let requestedMTP = try mtpMode(); _ = try visionMode()
+        if requireMTP, requestedMTP == .off {
+            throw PlanError("this diagnostic requires the MTP draft head; --mtp off is incompatible")
+        }
         try ensureWeights()
         let base = try Planner.plan(
             expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
             ramPercent: maxRAMPercent,
-            mtp: mtpMode(), mtpAvailable: MTPWeights.present(modelDir: modelURL),
+            mtp: requireMTP ? .on : requestedMTP, mtpAvailable: MTPWeights.present(modelDir: modelURL),
             vision: visionMode(), visionAvailable: visionAvailable(),
             maxContextTokens: maxContext, qualification: qualification,
             runtimePolicy: policy)
@@ -843,6 +847,17 @@
     var slots: Int = 4000
     @Flag(help: "Skip the 60 s grow cooldown wait and only assert the shrink half")
     var quick = false
+    @Option(help: "Hard total-memory ceiling for this diagnostic; the full governor drill needs an explicit ceiling above the ordinary 10 GB test budget")
+    var maxMemoryGB: Double = 10
+
+    func validate() throws {
+        guard slots > 0, slots <= Geometry.totalRecords else {
+            throw ValidationError("--slots must be positive and within the model's expert count")
+        }
+        guard maxMemoryGB.isFinite, (8.1 ... 26).contains(maxMemoryGB) else {
+            throw ValidationError("--max-memory-gb must be between 8.1 and 26")
+        }
+    }
 
     /// `elastic-check` proves the *pool* can be resized without changing the
     /// math. This proves the *governor* actually decides to do it: poll,
@@ -855,8 +870,11 @@
         var result: Result<Void, Error> = .success(())
         let startSlots = slots
         let skipGrow = quick
+        let memoryCeiling = maxMemoryGB
         Task {
             do {
+                let oldAvailability = Planner.availabilityOverride
+                defer { Planner.availabilityOverride = oldAvailability }
                 var fail: [String] = []
                 func note(_ s: String) {
                     FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
@@ -877,6 +895,17 @@
                 let extraSlots = Int((3.0e9 / Geometry.recordBytes).rounded(.up))
                 let minStartSlots = Geometry.floorSlots + extraSlots
                 let minStartPool = Geometry.gb(minStartSlots)
+                let minimumTarget = minStartPool + Planner.fixedFootprintGB
+                    + Planner.prefillCostGB(Planner.prefillChunkFor(poolBudgetGB: minStartPool))
+                    + Planner.prefixCacheCostGB(tokens: Planner.prefixCacheTokensFor(poolBudgetGB: minStartPool))
+                    + Planner.planningMarginGB
+                guard minimumTarget <= memoryCeiling else {
+                    throw PlanError(String(format:
+                        "elastic-drill needs at least a %.3f GB total target, above --max-memory-gb %.3f; "
+                        + "the normal governor deadbands require this larger test. "
+                        + "Use an explicit sufficient ceiling only with that target plus 3 GB physically reclaimable.",
+                        minimumTarget, memoryCeiling))
+                }
                 let minAvailable = max(12.0, minStartPool * 3)
                 guard let realAvail = Planner.deviceAvailableGB(), realAvail >= minAvailable else {
                     print(String(format:
@@ -900,6 +929,43 @@
                     + Planner.prefillCostGB(chunk)
                     + Planner.prefixCacheCostGB(tokens: cacheTokens)
                     + Planner.planningMarginGB
+                guard target <= memoryCeiling else {
+                    throw PlanError(String(format:
+                        "elastic-drill needs a %.3f GB total target, above --max-memory-gb %.3f; "
+                        + "the normal governor deadbands require this larger test. "
+                        + "Use an explicit sufficient ceiling only with that target plus 3 GB physically reclaimable.",
+                        target, memoryCeiling))
+                }
+                guard realAvail >= target + 3 else {
+                    throw PlanError(String(format:
+                        "elastic-drill requires %.3f GB reclaimable for its target plus 3 GB spare; observed %.3f",
+                        target + 3, realAvail))
+                }
+                let observation = FootprintSampler()
+                let vmBefore = ProcessMemory.vmActivity()
+                var complete = false
+                var outputs: [[Int]] = []
+                var finalObservation: (sample: FootprintSampler.Result, vm: ProcessMemory.VMActivity?, physical: UInt64, rss: UInt64)?
+                defer {
+                    let observed = finalObservation ?? (sample: observation.finish(), vm: ProcessMemory.vmActivity(),
+                        physical: ProcessMemory.residentBytes(), rss: ProcessMemory.lifetimeRSSPeakBytes())
+                    let sample = observed.sample
+                    let vmAfter = observed.vm
+                    let report: [String: Any] = [
+                        "complete": complete, "target_gb": target, "ceiling_gb": memoryCeiling,
+                        "sampled_peak_bytes": sample.peakBytes, "samples": sample.samples,
+                        "physical_footprint_end_bytes": observed.physical,
+                        "lifetime_rss_peak_bytes": observed.rss,
+                        "swapins_before": vmBefore.map { $0.swapins as Any } ?? NSNull(),
+                        "swapins_after": vmAfter.map { $0.swapins as Any } ?? NSNull(),
+                        "swapouts_before": vmBefore.map { $0.swapouts as Any } ?? NSNull(),
+                        "swapouts_after": vmAfter.map { $0.swapouts as Any } ?? NSNull(),
+                        "output_ids": outputs,
+                    ]
+                    if let data = try? JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]) {
+                        note("ELASTIC DRILL MEMORY " + String(decoding: data, as: UTF8.self))
+                    }
+                }
                 let plan = MemoryPlan(
                     source: .auto, slots: initialSlots, targetGB: target,
                     ramGB: Planner.deviceRAMGB(),
@@ -909,6 +975,22 @@
                     prefillChunk: chunk, prefixCacheTokens: cacheTokens,
                     notes: ["elastic drill bounded test plan"])
                 let engine = try await Engine(modelDir: model.modelURL, plan: plan)
+                func checkMemory(nextSlots: Int? = nil) throws {
+                    let additional = nextSlots.map { $0 > engine.model.pool.slots ? Geometry.gb($0) : 0 } ?? 0
+                    guard let available = Planner.deviceAvailableGB(), available >= 3 + additional else {
+                        throw PlanError("elastic-drill lost real memory headroom before work; no simulated availability authorizes allocation")
+                    }
+                    let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
+                    guard physical > 0, rss > 0,
+                          Double(max(physical, rss)) <= memoryCeiling * 1e9 else {
+                        throw PlanError("elastic-drill physical memory observation is unavailable or exceeds its explicit ceiling")
+                    }
+                    guard let current = ProcessMemory.vmActivity(), let before = vmBefore,
+                          current.swapins == before.swapins, current.swapouts == before.swapouts else {
+                        throw PlanError("elastic-drill memory interval is unavailable or contains swap activity")
+                    }
+                }
+                try checkMemory()
                 note(String(format: "  (machine has %.1f GB reclaimable; drill capped at a "
                     + "%.1f GB pool)", realAvail, poolCeiling))
 
@@ -917,27 +999,58 @@
                 let ids = try engine.encodeChat(
                     [ChatMessage(role: "user", content: "Name three rivers, comma separated.")],
                     thinking: false)
-                func gen() -> String { engine.generate(promptIds: ids, params: p).text }
+                func gen() throws -> String {
+                    try checkMemory()
+                    var interrupted: Error?
+                    let generated = engine.generate(promptIds: ids, params: p, shouldContinue: {
+                        do { try checkMemory(); return true }
+                        catch { interrupted = error; return false }
+                    })
+                    outputs.append(generated.ids)
+                    if let interrupted { throw interrupted }
+                    guard generated.stats.runtimeError == nil, generated.stats.requestFailure == nil,
+                          !generated.ids.isEmpty else {
+                        throw PlanError("elastic-drill generation failed or returned no output")
+                    }
+                    try checkMemory()
+                    return generated.text
+                }
 
                 let gov = MemoryGovernor(engine: engine)
-                gov.start()
+                // Exercise the real queued poll/resize path at controlled
+                // boundaries. A background timer could apply an unchecked
+                // availability stimulus during the cooldown sleep.
                 defer { gov.stop() }
 
-                let before = gen()
+                let before = try gen()
                 let s0 = engine.model.pool.slots
                 note(String(format: "  start:  %d slots (~%.0f/layer) -> %@",
                     s0, Geometry.perLayer(s0), before))
 
                 // --- shrink: pretend the machine just got busy
                 Planner.availabilityOverride = 2.0
-                let shrinkInputs = GovernorPolicy.Inputs(
-                    currentSlots: s0, availableGB: 2.0,
-                    ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
-                    ramPercent: plan.ramPercent)
+                func inputs(at available: Double) -> GovernorPolicy.Inputs {
+                    GovernorPolicy.Inputs(currentSlots: engine.model.pool.slots, availableGB: available,
+                        ramGB: plan.ramGB, workingSetGB: plan.workingSetGB, ramPercent: plan.ramPercent,
+                        maxContextTokens: engine.maxContextTokens,
+                        ownedAdditionalBytes: engine.prefixCache.ownedAdditionalBytes(mtpResident: false))
+                }
+                func pollBounded() throws {
+                    guard let available = Planner.availabilityOverride,
+                          let desired = GovernorPolicy.desiredPlan(inputs(at: available)),
+                          desired.expectedPeakGB <= memoryCeiling,
+                          desired.slots <= s0 else {
+                        throw PlanError("elastic-drill stimulus exceeds its bounded starting arena or total-memory ceiling")
+                    }
+                    try checkMemory(nextSlots: desired.slots)
+                    gov.pollNow()
+                    try checkMemory()
+                }
+                let shrinkInputs = inputs(at: 2)
                 let startCache = engine.prefixCache.maxTokens
-                gov.pollNow()
+                try pollBounded()
                 let s1 = engine.model.pool.slots
-                let underPressure = gen()
+                let underPressure = try gen()
                 note(String(format: "  squeeze: %d slots (~%.0f/layer) -> %@",
                     s1, Geometry.perLayer(s1), underPressure))
                 if s1 >= s0 { fail.append("governor did not shrink: \(s0) -> \(s1)") }
@@ -976,13 +1089,10 @@
                 // planner's nonlinear prefill/cache reservations and can land
                 // below the 2 GB grow dead-band.
                 func desiredSlots(at available: Double) -> Int {
-                    GovernorPolicy.desiredSlots(GovernorPolicy.Inputs(
-                        currentSlots: s1, availableGB: available,
-                        ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
-                        ramPercent: plan.ramPercent)) ?? s1
+                    GovernorPolicy.desiredSlots(inputs(at: available)) ?? s1
                 }
                 var low = 0.0
-                var high = realAvail
+                var high = min(realAvail, Planner.deviceAvailableGB() ?? 0)
                 if desiredSlots(at: high) < s0 {
                     fail.append("real reclaimable memory cannot reconstruct the bounded starting pool")
                 } else {
@@ -992,17 +1102,14 @@
                     }
                 }
                 let recoveryAvailability = high
-                let recoveryInputs = GovernorPolicy.Inputs(
-                    currentSlots: s1, availableGB: recoveryAvailability,
-                    ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
-                    ramPercent: plan.ramPercent)
+                let recoveryInputs = inputs(at: recoveryAvailability)
                 note(String(
                     format: "  recovery stimulus: %.1f GB available -> %d desired slots (%.1f GB growth)",
                     recoveryAvailability,
                     GovernorPolicy.desiredSlots(recoveryInputs) ?? s1,
                     Geometry.gb((GovernorPolicy.desiredSlots(recoveryInputs) ?? s1) - s1)))
                 Planner.availabilityOverride = recoveryAvailability
-                gov.pollNow()
+                try pollBounded()
                 if engine.model.pool.slots != s1 {
                     fail.append("governor grew during the cooldown (should wait \(Int(GovernorPolicy.growCooldown)) s)")
                 } else {
@@ -1011,11 +1118,13 @@
 
                 if !skipGrow {
                     note("  waiting out the \(Int(GovernorPolicy.growCooldown)) s grow cooldown...")
-                    try await Task.sleep(
-                        for: .seconds(GovernorPolicy.growCooldown + 3))
-                    gov.pollNow()
+                    for _ in 0 ..< Int(GovernorPolicy.growCooldown + 3) {
+                        try await Task.sleep(for: .seconds(1))
+                        try checkMemory()
+                    }
+                    try pollBounded()
                     let s2 = engine.model.pool.slots
-                    let recovered = gen()
+                    let recovered = try gen()
                     note(String(format: "  recover: %d slots (~%.0f/layer) -> %@",
                         s2, Geometry.perLayer(s2), recovered))
                     if s2 <= s1 { fail.append("governor did not grow back: \(s1) -> \(s2)") }
@@ -1024,8 +1133,24 @@
                     }
                 }
                 Planner.availabilityOverride = nil
+                if let first = outputs.first, !outputs.allSatisfy({ $0 == first }) {
+                    fail.append("output token IDs changed across governor transitions")
+                }
+                let finalSample = observation.finish()
+                let finalVM = ProcessMemory.vmActivity()
+                let finalPhysical = ProcessMemory.residentBytes(), finalRSS = ProcessMemory.lifetimeRSSPeakBytes()
+                finalObservation = (finalSample, finalVM, finalPhysical, finalRSS)
+                if finalSample.peakBytes == 0 || finalPhysical == 0 || finalRSS == 0
+                    || Double(max(finalSample.peakBytes, max(finalPhysical, finalRSS))) > memoryCeiling * 1e9 {
+                    fail.append("final sampled footprint, physical footprint or RSS is unavailable or exceeds the ceiling")
+                }
+                if vmBefore == nil || finalVM == nil || finalVM?.swapins != vmBefore?.swapins
+                    || finalVM?.swapouts != vmBefore?.swapouts {
+                    fail.append("the complete memory interval is unavailable or contains swap activity")
+                }
 
                 if fail.isEmpty {
+                    complete = true
                     print("ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the "
                         + "grow cooldown\(skipGrow ? "" : ", grew back when memory returned"), "
                         + "and every generation was byte-identical")

````

Final source `/Users/carlos/Projects/slotstream/Sources/slotstream-cli/main.swift` — SHA-256 `20e42483d78cd4bf92102435557301667c694ef9c4fd98463971b008f64ab820`.

````text
// slotstream CLI: run · serve · parity · doctor · goldens

import ArgumentParser
import Foundation
import MLX
import Slotstream
import SlotstreamDiagnostics

struct Slotstream: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slotstream",
        abstract: "Qwen3.8-Flash-Next on Apple Silicon via SSD-streamed experts + cache slots.",
        version: SlotstreamBuild.version,
        subcommands: [
            Run.self, Serve.self, Pull.self, Doctor.self, Parity.self, ElasticCheck.self,
            NgramGolden.self, DequantGolden.self, TemplateCheck.self, SamplerGolden.self, GovernorCheck.self,
            PrefixCheck.self, ElasticDrill.self, RuntimeCheck.self, PullCheck.self,
            MTPParity.self, MTPAccept.self, MTPCheck.self, MTPFixtureInputs.self, MTPBench.self, MTPPassCost.self,
            ContextCheck.self, PrefillScheduleCommand.self, SweepCheck.self,
            VisionParity.self, OptimizationStateCheck.self, PackExperts.self,
        ]
    )
}

/// Weights-free regressions for process and cache safety invariants that are
/// otherwise only observable during a 100+ GB model run. The checks themselves
/// live in SlotstreamDiagnostics; this is the adapter that prints them.
struct RuntimeCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "runtime-check",
        abstract: "Check process RSS accounting and prefix-cache bounds without loading weights")

    func run() throws {
        try CheckRendering.emit(Diagnostics.runtime(), banner: "RUNTIME CHECK PASS")
    }
}

struct ModelOptions: ParsableArguments {
    @Option(name: .long,
            help: "Model name or directory (default \(PinnedModel.name); a name resolves to the dev checkout's models/ or ~/.slotstream/models)")
    var model: String = PinnedModel.name

    @Option(
        name: .customLong("memory-gb"),
        help: ArgumentHelp(
            "Total memory target for the whole process, in GB.",
            discussion: """
                The easiest knob: how much of this Mac slotstream may use. The \
                expert cache gets what remains after the conservatively charged \
                resident/runtime/context footprint and a 1 GB margin. Run \
                `slotstream doctor --memory-gb N` for the exact cache size. \
                Default: auto -- 70% of RAM, kept 2 GB under \
                the Metal working-set limit; the chosen plan is announced at \
                startup. --experts-per-layer / --pool-gb take precedence.
                """))
    var memoryGB: Double?

    @Option(
        name: .customLong("experts-per-layer"),
        help: ArgumentHelp(
            "Expert cache size, in experts per layer (1...512).",
            discussion: """
                The precise memory<->speed knob. Each of the 48 layers has 512 \
                experts of 2.76 MB; the cache holds N x 48 of them, so pool = \
                N x 0.133 GB (e.g. 226/layer = 30 GB, 181/layer = 24 GB, \
                30/layer = 4 GB) plus the fixed runtime/context footprint. The pool \
                itself is one GLOBAL cache shared across layers -- N is the \
                intuitive unit, not a per-layer quota: hot layers borrow slots \
                from cold ones. Takes precedence over --memory-gb/--pool-gb. \
                Default: auto (see `slotstream doctor`).
                """))
    var expertsPerLayer: Int?

    @Option(name: .customLong("pool-gb"),
            help: "Raw expert-pool size in GB (1 GB ≈ 7.5 experts/layer). Beats --memory-gb; loses to --experts-per-layer.")
    var poolGB: Double?

    @Option(
        name: .customLong("max-ram-percent"),
        help: ArgumentHelp(
            "Auto only: the largest share of this Mac's RAM auto may target (default 70).",
            discussion: """
                Lower it to keep more of the machine for your other apps; auto \
                still sizes down on its own when they are actually holding \
                memory. It cannot raise the target past the point where more \
                cache stops buying decode speed (~33 GB) — use --memory-gb for \
                that. Ignored when an explicit memory knob is given.
                """))
    var maxRAMPercent: Double?

    @Option(
        name: .customLong("mtp"),
        help: ArgumentHelp(
            "Speculative decode with the MTP draft head: auto | on | off (default auto).",
            discussion: """
                The model's own next-next-token head drafts a few tokens \
                and the main model verifies them in one batched pass. Costs \
                a fixed 1.6 GB of memory; auto enables it only when the \
                expert cache still reaches ~120 experts/layer after paying, \
                which is where the multiplier beats spending the same RAM on \
                cache. Needs the separately converted mtp.safetensors next \
                to the model (Tools/mtp_convert.py).
                """))
    var mtp: String = "auto"

    @Option(
        name: .customLong("vision"),
        help: ArgumentHelp(
            "Accept images: auto | on | off (default auto).",
            discussion: """
                The checkpoint carries a vision tower; auto loads it the \
                first time a request sends a picture and keeps it resident \
                after that (+0.9 GB, on top of the plan below, and refused \
                if the machine cannot spare it at that moment). off refuses \
                images outright, which is what to use when the announced \
                peak is the number that matters.
                """))
    var vision: String = "auto"

    // Resolved once here so the tokenizer, the draft-head probe, and the index
    // all see the real directory; Foundation will not list a symlinked one.
    var modelURL: URL { ModelLocator.resolve(model).resolvingSymlinksInPath() }

    func mtpMode() throws -> Planner.MTPMode {
        guard let m = Planner.MTPMode(rawValue: mtp) else {
            throw PlanError("--mtp must be auto, on, or off (got \(mtp))")
        }
        return m
    }

    func visionMode() throws -> Planner.VisionMode {
        guard let v = Planner.VisionMode(rawValue: vision) else {
            throw PlanError("--vision must be auto, on, or off (got \(vision))")
        }
        return v
    }

    /// Does this checkpoint carry a tower? Reads the shard headers only.
    func visionAvailable() -> Bool {
        guard let idx = try? CheckpointIndex(dir: modelURL) else { return false }
        return VisionTower.present(index: idx)
    }

    /// Resolve knobs -> plan, print the announce, return it. Also the first
    /// place a stranger hits with no weights — offer the download right there.
    func announcedPlan(maxContext: Int = ContextPolicy.defaultTokens, prefixCacheEnabled: Bool = true,
                       maxPrefillWait: Double = 30, qualification: Bool = false,
                       requireMTP: Bool = false) throws -> MemoryPlan {
        let configuration = try ContextConfiguration(maxContextTokens: maxContext,
            maxPrefillWaitMinutes: maxPrefillWait, qualification: qualification)
        let policy = try runtimePolicy(prefixCacheEnabled: prefixCacheEnabled)
        let requestedMTP = try mtpMode(); _ = try visionMode()
        if requireMTP, requestedMTP == .off {
            throw PlanError("this diagnostic requires the MTP draft head; --mtp off is incompatible")
        }
        try ensureWeights()
        let base = try Planner.plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramPercent: maxRAMPercent,
            mtp: requireMTP ? .on : requestedMTP, mtpAvailable: MTPWeights.present(modelDir: modelURL),
            vision: visionMode(), visionAvailable: visionAvailable(),
            maxContextTokens: maxContext, qualification: qualification,
            runtimePolicy: policy)
        let plan = try runtimePlan(base, prefixCacheEnabled: prefixCacheEnabled).withRequestPolicy(configuration)
        FileHandle.standardError.write((plan.banner() + "\n").data(using: .utf8)!)
        return plan
    }

    /// The announce, doctor and serving metadata share the same reservation
    /// resolution. Merely printing a simulated plan never makes it loadable.
    func runtimePlan(_ base: MemoryPlan, prefixCacheEnabled: Bool = true) throws -> MemoryPlan {
        try Planner.applyingRuntimePolicy(base, policy: runtimePolicy(prefixCacheEnabled: prefixCacheEnabled))
    }

    func runtimePolicy(prefixCacheEnabled: Bool = true) throws -> RuntimeAllocationPolicy {
        let env = ProcessInfo.processInfo.environment
        let chunk: Int?
        if let raw = env["SLOTSTREAM_PREFILL_CHUNK"] {
            guard let value = Int(raw) else { throw PlanError("SLOTSTREAM_PREFILL_CHUNK must be an integer") }
            chunk = value
        } else { chunk = nil }
        return try RuntimeAllocationPolicy(prefillChunkOverride: chunk,
            prefixCacheEnabled: prefixCacheEnabled && env["SLOTSTREAM_PREFIX_CACHE"] != "0")
    }

    /// If the pinned model isn't fully downloaded and we have a terminal, ask
    /// once and run the pull inline (resuming whatever is already there).
    /// Anything else fails with the fix, not a stack.
    func ensureWeights() throws {
        let url = modelURL
        let fm = FileManager.default
        guard model == PinnedModel.name || model == PinnedModel.dirName else {
            // explicit path: all we can check cheaply is that a model is there
            guard fm.fileExists(atPath: url.appendingPathComponent("config.json").path) else {
                throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
            }
            return
        }
        // pinned model: every manifest file must be present whole (a partial
        // first download must resume here, not die later in the engine)
        var remaining = WeightStore.remainingBytes(at: url)
        var corrupt: [PinnedModel.File] = []
        if remaining == 0 {
            // Size alone cannot distinguish a valid file from same-size
            // corruption. Hash before loading; this takes seconds and prevents
            // a damaged tokenizer/config/weight from reaching the engine.
            corrupt = WeightStore.invalidFiles(at: url)
            if corrupt.isEmpty { return }
            remaining = corrupt.reduce(0) { $0 + $1.size }
            print("found \(corrupt.count) same-size file(s) that fail the pinned sha256: "
                + corrupt.map(\.path).joined(separator: ", "))
        }
        let have = max(0, PinnedModel.requiredBytes - remaining)
        // free disk where the weights will actually land
        var probe = url
        while !fm.fileExists(atPath: probe.path), probe.path != "/" {
            probe.deleteLastPathComponent()
        }
        let free = (try? fm.attributesOfFileSystem(
            forPath: probe.path))?[.systemFreeSize] as? Int64 ?? 0
        print("""
            \(PinnedModel.name) is not \(have > 0 ? "fully " : "")downloaded yet.
              size:  \(String(format: "%.1f", Double(PinnedModel.totalBytes) / 1e9)) GB in \(PinnedModel.files.count) files (resumable if interrupted)\(
                  have > 0 ? String(format: "\n  have:  %.1f GB already here — the download resumes", Double(have) / 1e9) : "")
              time:  measured during download; compressed transfer and reconstruction overlap
              to:    \(url.path)
              disk:  \(String(format: "%.1f", Double(free) / 1e9)) GB free
            """)
        fflush(stdout)
        switch askYesNo("download now? [Y/n] ") {
        case .some(true):
            try withInterruptiblePull { cancellation in
                try WeightStore.download(to: url, transport: .automatic, cancellation: cancellation, log: { print($0); fflush(stdout) })
            }
        case .some(false):
            throw PlanError("not downloading — when you are ready:  slotstream pull")
        case .none:  // no terminal to ask on
            throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
        }
    }
}

/// Ask on the controlling terminal. Returns nil when there is no terminal
/// (piped stdin and no /dev/tty), so callers can fail with instructions
/// instead of hanging.
func askYesNo(_ prompt: String) -> Bool? {
    func parse(_ s: String) -> Bool {
        let t = s.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return t.isEmpty || t == "y" || t == "yes"
    }
    if isatty(0) == 1 {
        print(prompt, terminator: "")
        guard let line = readLine() else { return false }
        return parse(line)
    }
    guard let tty = fopen("/dev/tty", "r") else { return nil }
    defer { fclose(tty) }
    print(prompt, terminator: "")
    fflush(stdout)
    var buf = [CChar](repeating: 0, count: 64)
    guard fgets(&buf, 64, tty) != nil else { return false }
    return parse(String(cString: buf))
}

// MARK: run

struct Run: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Generate from a prompt")
    @OptionGroup var model: ModelOptions
    @Option(help: "Prompt plus reply context window") var maxContext = ContextPolicy.defaultTokens
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Option var prompt: String = "Why is the sky blue?"
    @Option(help: "Read the exact UTF-8 prompt from a file") var promptFile: String?
    @Option(help: "Write exact tokens, effective configuration and generation measurements as JSON")
    var statsJson: String?
    @Option(help: "Deterministic sampling seed") var seed: UInt64?
    @Flag(help: "Sample physical footprint during generation (diagnostic overhead)")
    var sampleFootprint = false
    @Option(help: "Maximum tokens to generate (<= 0 means as many as allowed)")
    var maxTokens: Int = 128
    @Flag(help: "Greedy sampling (deterministic)") var greedy = false
    @Flag(help: "Raw prompt (no chat template)") var raw = false
    @Flag(help: "Enable thinking mode") var think = false
    @Option(
        name: .customLong("image"),
        help: ArgumentHelp(
            "Path to an image to send with the prompt (repeatable).",
            discussion: """
                Read from disk here, by you, and sent inline — the server \
                itself never opens a path or a URL a request names.
                """))
    var images: [String] = []

    func run() throws {
        if raw, !images.isEmpty {
            throw PlanError("--raw has no chat template to place an image in; drop one of them")
        }
        _ = try ContextConfiguration(maxContextTokens: maxContext, maxPrefillWaitMinutes: maxPrefillWait)
        let launchStart = RuntimeClock.now()
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let plan = try model.announcedPlan(maxContext: maxContext, maxPrefillWait: maxPrefillWait)
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let loadSeconds = RuntimeClock.seconds(since: launchStart)
                engine.generator.footprintSampling = sampleFootprint
                let control = try engine.beginRequest()
                let encodeStart = RuntimeClock.now()
                var promptText = prompt
                if let promptFile {
                    let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: promptFile))
                    defer { try? handle.close() }
                    var data = Data()
                    while true {
                        let (next, overflow) = data.count.addingReportingOverflow(65_536)
                        try control.checkInputBytes(overflow ? Int.max : next)
                        guard let part = try handle.read(upToCount: 65_536), !part.isEmpty else { break }
                        data.append(part)
                    }
                    try control.checkInputBytes(data.count)
                    guard let decoded = String(data: data, encoding: .utf8) else {
                        throw PlanError("prompt file must contain valid UTF-8")
                    }
                    promptText = decoded
                }
                let ids: [Int]
                var vision: VisionPrompt?
                if raw {
                    try control.checkInputBytes(promptText.utf8.count)
                    ids = engine.tokenizer.encode(text: promptText)
                } else {
                    var msg = ChatMessage(role: "user", content: promptText)
                    var retainedInputBytes = promptText.utf8.count
                    msg.images = try images.map { path in
                        let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
                        defer { try? handle.close() }
                        let size = try handle.seekToEnd()
                        guard size > 0, size <= UInt64(VisionPreprocess.maxImageBytes) else {
                            throw PlanError("image must be nonempty and at most \(VisionPreprocess.maxImageBytes >> 20) MiB")
                        }
                        let encodedBytes = ((Int(size) + 2) / 3) * 4
                        let (next, overflow) = retainedInputBytes.addingReportingOverflow(encodedBytes)
                        try control.checkInputBytes(overflow ? Int.max : next)
                        retainedInputBytes = next
                        try handle.seek(toOffset: 0)
                        let d = try handle.read(upToCount: Int(size) + 1) ?? Data()
                        guard d.count == Int(size) else {
                            throw PlanError("image changed size while being read")
                        }
                        return d.base64EncodedString()
                    }
                    (ids, vision) = try engine.encodeChatWithVision([msg], thinking: think, request: control)
                }
                if let e = engine.contextError(promptTokens: ids.count) { throw PlanError(e) }
                let encodeSeconds = RuntimeClock.seconds(since: encodeStart)
                let wait = PrefillSchedule.estSeconds(tokens: ids.count, maxChunk: engine.generator.prefillChunk, tailAware: engine.model.optimizations.tailAwarePrefill)
                FileHandle.standardError.write(
                    "prompt tokens: \(ids.count) (~\(PrefillSchedule.describe(seconds: wait)) to the first token at this plan)\n"
                        .data(using: .utf8)!)
                // A long prompt reports its progress so minutes of silence do
                // not read as a hang; short prompts stay quiet.
                let progress = PrefillProgressReporter(
                    quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                }
                progress.tailAware = engine.model.optimizations.tailAwarePrefill
                engine.generator.onPrefillProgressAbsolute = progress.report
                var params: SampleParams = greedy ? .greedy : (think ? .thinking : .instruct)
                params.maxTokens = maxTokens
                params.seed = seed
                let t0 = Date()
                let (text, outputIds, stats) = engine.generate(
                    promptIds: ids, params: params, vision: vision, onToken: { _, delta in
                    fputs(delta, stdout)
                    fflush(stdout)
                    return true
                }, request: control)
                print("")
                if let statsJson {
                    let workspaceGB = engine.model.optimizations.layerExpertWorkspace
                        ? Double(engine.model.cfg.numExperts * engine.model.pool.recordBytes) / 1e9 : 0
                    // Conservative experimental allowance, not a calibrated
                    // production parameter family or a fixed-total comparison.
                    let scopeGB = engine.model.optimizations.readScopeEnabled
                        ? max(0, Planner.prefillCostGB(engine.model.optimizations.readScopeTokens)
                            - Planner.prefillCostGB(engine.generator.prefillChunk))
                            + Double(PrefixCache.fixedBytesPerEntry) / 1e9 : 0
                    let statsData = try JSONEncoder().encode(stats)
                    let routerGB = Double(stats.cachedRouterBytes) / 1e9
                    let payload: [String: Any] = [
                        "schema_version": 1,
                        "stats": try JSONSerialization.jsonObject(with: statsData),
                        "prompt_ids": ids, "output_ids": outputIds, "text": text,
                        "plan": plan.json(), "effective_prefill_chunk": engine.generator.prefillChunk,
                        "effective_pool_slots": engine.model.pool.slots,
                        "effective_prefill_cost_gb": Planner.prefillCostGB(engine.generator.prefillChunk),
                        "effective_expected_peak_gb": plan.expectedPeakGB + Planner.prefillCostGB(engine.generator.prefillChunk) - Planner.prefillCostGB(plan.prefillChunk) + workspaceGB + scopeGB + routerGB,
                        "extra_expert_workspace_gb": workspaceGB,
                        "extra_read_scope_allowance_gb": scopeGB,
                        "extra_router_cache_gb": routerGB,
                        "experimental_memory_family": workspaceGB > 0 || scopeGB > 0 || routerGB > 0,
                        "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
                        "effective_mtp": engine.model.mtpHead != nil && engine.generator.speculationEnabled,
                        "load_seconds": loadSeconds, "encode_seconds": encodeSeconds,
                        "launch_seconds": RuntimeClock.seconds(since: launchStart),
                        "sampling": ["greedy": greedy, "seed": seed.map(String.init) ?? "default",
                                     "requested_max_tokens": String(maxTokens)],
                    ]
                    try JSONSerialization.data(withJSONObject: payload, options: [.sortedKeys])
                        .write(to: URL(fileURLWithPath: statsJson), options: .atomic)
                }
                if let error = stats.runtimeError { throw ModelError(error) }
                let hs = String(format: "%.3f", stats.expertHitRate)
                let perLayer = String(format: "~%.0f/%d experts per layer", plan.expertsPerLayerCached, Geometry.expertsPerLayer)
                let memoryObservation: String
                if let sample = stats.sampledFootprint {
                    memoryObservation = String(format: "sampled footprint peak %.3f GB", Double(sample.peakBytes) / 1e9)
                } else {
                    memoryObservation = String(format: "RSS high-water %.3f GB, current footprint %.3f GB",
                        Double(stats.lifetimeRSSPeakBytes) / 1e9, Double(stats.physicalFootprintEndBytes) / 1e9)
                }
                FileHandle.standardError.write(
                    """

                    -- prefill \(stats.prefillTokens) tok in \(String(format: "%.2f", stats.prefillSeconds))s (\(String(format: "%.1f", stats.prefillTPS)) tok/s)\(stats.prefixHit ? " | \(stats.reusedPrefixTokens) of \(stats.promptTokens) reused from the previous turn" : "")
                    -- prefill split: io \(String(format: "%.2f", stats.prefillIOSeconds))s + scatter \(String(format: "%.2f", stats.prefillScatterSeconds))s | \(stats.prefillRecords) records (\(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3)) GB, \(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3 / max(stats.prefillIOSeconds, 1e-9))) GB/s)
                    -- decode \(stats.decodeTokens) tok in \(String(format: "%.2f", stats.decodeSeconds))s (\(String(format: "%.2f", stats.decodeTPS)) tok/s)
                    \(RouterTrace.flush().map { $0 + "\n" } ?? "")\(MemTrace.on ? MemTrace.report() + "\n" : "")-- decode split: io \(String(format: "%.2f", stats.decodeIOSeconds))s + scatter \(String(format: "%.2f", stats.decodeScatterSeconds))s | \(stats.decodeRecords) records\(stats.verifyPasses > 0 ? String(format: " | mtp %d/%d drafts accepted (%.0f%%), %d verify passes", stats.acceptedDrafts, stats.draftedTokens, 100 * stats.draftAcceptRate, stats.verifyPasses) : "")
                    -- expert cache \(perLayer), hit rate \(hs) | ngram rows \(stats.ngramRowHits)h/\(stats.ngramRowMisses)m | \(memoryObservation) | total \(String(format: "%.1f", -t0.timeIntervalSinceNow))s

                    """.data(using: .utf8)!)
                result = .success(())
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: serve

struct Serve: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Ollama-compatible API server")
    @OptionGroup var model: ModelOptions
    @Option var port: UInt16 = 11434
    @Option(
        name: .customLong("max-context"),
        help: ArgumentHelp(
            "Longest prompt plus reply accepted per request, in tokens (default \(ContextPolicy.defaultTokens), ceiling \(ContextPolicy.maxTokens)).",
            discussion: """
                The configured window stays fixed for this engine. The planner \
                must fit its state and workspaces before loading; requests \
                above the window are refused. --max-prefill-wait separately \
                bounds accepted-request-to-first-token time. `doctor` reports \
                memory feasibility and available timing estimates; \
                `context-check` runs explicit, unqualified capacity diagnostics.
                """))
    var maxContext: Int = ContextPolicy.defaultTokens
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Flag(name: .customLong("no-elastic"),
          help: "Pin the cache at its startup size. Default: an auto-sized cache resizes itself between requests as memory pressure and availability change (explicit size flags are always pinned).")
    var noElastic = false
    @Flag(name: .customLong("no-prefix-cache"),
          help: "Re-prefill every request from scratch. Default: the state of one request is reused by the next when that request's prompt extends it, so a chat turn only prefills what is new.")
    var noPrefixCache = false

    func run() throws {
        if let why = ContextPolicy.validationError(maxContext) { throw PlanError(why) }
        let plan = try model.announcedPlan(maxContext: maxContext, prefixCacheEnabled: !noPrefixCache, maxPrefillWait: maxPrefillWait)
        // Claim the port first: failing here after a full model load wastes
        // half a minute and used to be a fatalError.
        let listenFD = try Server.bindPort(port)
        let sem = DispatchSemaphore(value: 0)
        var engine: Engine!
        var err: Error?
        Task {
            do { engine = try await Engine(modelDir: model.modelURL, plan: plan) } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        engine.maxContextTokens = maxContext
        // Long prompts announce themselves in the server log with the wait to
        // expect, then report by quarters; anything under 2k tokens is quiet.
        let progress = PrefillProgressReporter(
            quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
            let stamp = DateFormatter.localizedString(
                from: Date(), dateStyle: .none, timeStyle: .medium)
            FileHandle.standardError.write("[\(stamp)] \(line)\n".data(using: .utf8)!)
        }
        progress.tailAware = engine.model.optimizations.tailAwarePrefill
        engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
            progress.maxChunk = engine.generator.prefillChunk
            progress.report(done: done, total: total, elapsed: elapsed, base: base)
        }
        if noPrefixCache {
            engine.prefixCache.enabled = false
            engine.prefixCache.drop()
            FileHandle.standardError.write(
                "prefix cache: off — every request re-prefills its whole prompt\n"
                    .data(using: .utf8)!)
        }
        var governor: MemoryGovernor?
        if plan.source == .auto, !noElastic {
            governor = MemoryGovernor(engine: engine)
            governor?.start()
        } else if plan.source != .auto, !noElastic {
            FileHandle.standardError.write(
                "elastic: off — an explicit size is pinned; omit the size flag for elastic auto\n"
                    .data(using: .utf8)!)
        }
        defer { governor?.stop() }
        let server = Server(
            engine: engine, port: port, weightsBytes: Int(PinnedModel.totalBytes),
            listenFD: listenFD)
        try server.run()
    }
}

// MARK: parity

struct Parity: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Run N truncated layers and compare hidden states against the Python reference dumps")
    @OptionGroup var model: ModelOptions
    @Option var layers: Int = 4
    @Option(help: "Comma-separated token ids") var tokens: String
    @Option(help: "Directory with python layer_{i}.bin dumps") var compare: String?
    @Option(help: "Write swift layer_{i}.bin dumps here") var out: String?

    func run() throws {
        guard layers >= 1, layers <= Geometry.layers else {
            throw ValidationError("--layers must be between 1 and \(Geometry.layers)")
        }
        let fields = tokens.split(separator: ",", omittingEmptySubsequences: false)
        let parsed = fields.map { Int($0.trimmingCharacters(in: .whitespaces)) }
        guard !fields.isEmpty, parsed.allSatisfy({ $0 != nil }) else {
            throw ValidationError("--tokens must be a non-empty comma-separated list of integers")
        }
        let ids = parsed.compactMap { $0 }
        let index = try CheckpointIndex(dir: model.modelURL)
        guard ids.allSatisfy({ $0 >= 0 && $0 < index.config.vocabSize }) else {
            throw ValidationError("--tokens contains an id outside 0..<\(index.config.vocabSize)")
        }
        let m = try Qwen4ExpModel(index: index, poolSlots: 2048, runLayers: layers)
        try m.validate()
        let state = m.makeState()
        var dumps: [Int: [Float]] = [:]
        let h = m.hiddenStates(ids, state: state) { l, arr in
            dumps[l] = arr.asType(.float32).asArray(Float.self)
        }
        eval(h)
        if let out {
            try FileManager.default.createDirectory(atPath: out, withIntermediateDirectories: true)
            for (l, v) in dumps {
                let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
                try d.write(to: URL(fileURLWithPath: out).appendingPathComponent("layer_\(l).bin"))
            }
            print("wrote \(dumps.count) layer dumps to \(out)")
        }
        if let cmp = compare {
            var worst: Float = 0
            for l in 0 ..< layers {
                let url = URL(fileURLWithPath: cmp).appendingPathComponent("layer_\(l).bin")
                let refData = try Data(contentsOf: url)
                guard refData.count % MemoryLayout<Float>.size == 0 else {
                    throw ValidationError("layer \(l) reference is not a whole number of Float32 values")
                }
                let ref: [Float] = refData.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
                guard let got = dumps[l] else {
                    throw ValidationError("no generated dump for layer \(l)")
                }
                guard ref.count == got.count else {
                    throw ValidationError(
                        "layer \(l) reference has \(ref.count) floats, generated dump has \(got.count)")
                }
                var maxAbs: Float = 0
                var refScale: Float = 0
                for i in 0 ..< ref.count {
                    maxAbs = max(maxAbs, abs(ref[i] - got[i]))
                    refScale = max(refScale, abs(ref[i]))
                }
                let rel = maxAbs / max(refScale, 1e-6)
                worst = max(worst, rel)
                print(String(format: "layer %2d: max abs %.5f, rel %.5f  %@", l, maxAbs, rel, rel < 2e-2 ? "OK" : "FAIL"))
            }
            print(worst < 2e-2 ? "PARITY PASS" : "PARITY FAIL")
            if worst >= 2e-2 { throw ExitCode(2) }
        }
    }
}

// MARK: doctor

struct Doctor: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Machine report, the plan your flags produce, and what each memory target buys")
    @OptionGroup var model: ModelOptions

    @Option(name: .customLong("sim-ram"),
            help: "What-if: preview the plan for a machine with this much RAM in GB (pristine unless --sim-available is also given; working set defaults to 75% of RAM)")
    var simRAM: Double?
    @Option(name: .customLong("sim-working-set"),
            help: "What-if: pretend this Metal working-set limit (GB)")
    var simWorkingSet: Double?
    @Option(name: .customLong("sim-available"),
            help: "What-if: pretend this much memory is reclaimable right now (GB)")
    var simAvailable: Double?

    @Flag(name: .customLong("json"),
          help: "Print the resolved plan as JSON instead of the report. Estimates are unrounded here; the report rounds them.")
    var asJSON = false

    @Option(name: .customLong("max-context"),
            help: "Preview the plan `serve --max-context N` would announce (default \(ContextPolicy.defaultTokens), ceiling \(ContextPolicy.maxTokens)).")
    var maxContext: Int = ContextPolicy.defaultTokens
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0

    /// One line on the 104 GB the plan above says nothing about: is it here,
    /// is there room for it, and roughly how long it takes.
    func weightsLine() -> String {
        let url = model.modelURL
        guard model.model == PinnedModel.name || model.model == PinnedModel.dirName else {
            return "weights: \(url.path) (not the pinned model — size unknown)"
        }
        let fm = FileManager.default
        let remaining = WeightStore.remainingBytes(at: url)
        if remaining == 0 {
            return String(format: "weights: present by size, %.1f GB at %@ (run pull --verify for hashes)",
                          Double(PinnedModel.totalBytes) / 1e9, url.path)
        }
        var probe = url
        while !fm.fileExists(atPath: probe.path), probe.path != "/" {
            probe.deleteLastPathComponent()
        }
        let free = (try? fm.attributesOfFileSystem(forPath: probe.path))?[
            .systemFreeSize] as? Int64 ?? 0
        let need = remaining + 2_000_000_000
        let room = free >= need
            ? String(format: "%.0f GB free is enough", Double(free) / 1e9)
            : String(format: "ONLY %.0f GB free, needs %.0f GB",
                     Double(free) / 1e9, Double(need) / 1e9)
        return String(format: "weights: %.1f GB to download (%@ at best) — %@",
                      Double(remaining) / 1e9, WeightStore.etaHint(remaining), room)
    }

    func run() throws {
        let configuration = try ContextConfiguration(maxContextTokens: maxContext, maxPrefillWaitMinutes: maxPrefillWait)
        // --json is for machines: emit the plan and nothing else.
        let quiet = asJSON
        let info = MLX.GPU.deviceInfo()
        if !quiet {
            print("device: \(info.architecture)  |  "
                + String(format: "%.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                         Planner.deviceRAMGB(),
                         Planner.deviceAvailableGB() ?? .nan, Planner.deviceWorkingSetGB()))
        }
        if !quiet {
            print("model:  \(Geometry.layers) layers x \(Geometry.expertsPerLayer) experts x 2.76 MB "
                + "(\(Geometry.totalRecords) records = 67.9 GB streamed from SSD)")
        }
        // Disk is the gate that bites before memory does, and the README sends
        // people here *before* they download, so answer that question too.
        if !quiet { print(weightsLine()) }
        if !quiet { print("") }
        let simulating = simRAM != nil || simWorkingSet != nil || simAvailable != nil
        if simulating, !quiet { print("what-if for a simulated machine (this device shown above):") }
        let simulatedAvailable = simulating
            ? (simAvailable ?? simRAM ?? Planner.deviceRAMGB()) : nil
        // A what-if plans against a Machine that says it is simulated, so the
        // plan it produces is marked and can never be handed to Engine.load.
        let device: Machine = simulating
            ? Machine(
                ramGB: simRAM ?? Planner.deviceRAMGB(),
                workingSetGB: simWorkingSet ?? (simRAM.map { $0 * 0.75 } ?? Planner.deviceWorkingSetGB()),
                availableGB: simulatedAvailable, isSimulated: true)
            : .current()
        let request = PlanRequest(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
            memoryGB: model.memoryGB, maxRAMPercent: model.maxRAMPercent,
            mtp: try model.mtpMode(), vision: try model.visionMode(), maxContextTokens: maxContext)
        let feasibility = Planner.contextFeasibility(request, on: device,
            mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
            visionAvailable: model.visionAvailable(), runtimePolicy: try model.runtimePolicy())
        let advisory: MemoryPlan?
        if feasibility.requestedPlan == nil, maxContext <= ContextPolicy.defaultTokens,
           model.expertsPerLayer != nil || model.poolGB != nil {
            advisory = try Planner.plan(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
                memoryGB: model.memoryGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                availableGB: device.availableGB, ramPercent: model.maxRAMPercent,
                mtp: model.mtpMode(), mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
                vision: model.visionMode(), visionAvailable: model.visionAvailable(),
                maxContextTokens: maxContext, simulated: device.isSimulated, runtimePolicy: model.runtimePolicy())
        } else { advisory = nil }
        guard let requestedPlan = feasibility.requestedPlan ?? advisory else {
            if asJSON {
                let output: [String: Any] = ["error": ["code": "insufficient_memory",
                    "message": feasibility.refusal ?? "requested configuration does not fit"],
                    "context_feasibility": feasibility.json]
                print(String(decoding: try JSONSerialization.data(withJSONObject: output,
                    options: [.prettyPrinted, .sortedKeys]), as: UTF8.self))
                throw ExitCode(2)
            }
            throw PlanError("\(feasibility.refusal ?? "requested configuration does not fit"); maximum feasible window: \(feasibility.maximumFeasibleWindow) tokens")
        }
        let plan = try requestedPlan.withRequestPolicy(configuration)
        if asJSON {
            var output = plan.json(); output["context_feasibility"] = feasibility.json
            let data = try JSONSerialization.data(
                withJSONObject: output, options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
            return
        }
        print(plan.banner())
        print("memory-feasible window: \(feasibility.maximumFeasibleWindow) tokens; separate from the \(maxPrefillWait)-minute request-to-first-token policy")
        print("""

        knobs (first one given wins; with none, auto is the default):
          --memory-gb G           easiest: total memory the process may use
          --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
          --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
        """)
        print(String(
            format: "min ~%.0f/layer = %.1f GB total. The pool is one global cache shared across",
            Geometry.perLayer(Geometry.floorSlots), Planner.minMemoryGB))
        print("""
            all layers -- per-layer is the unit of intuition (a token activates 10
            of its 512 per layer), not a quota: hot layers borrow slots from cold.

            what a memory target buys (conservative warm-decode estimate from
            measured M5 Pro anchors: 30/layer = 6.0, 150/layer = 11.6; the last
            column is the wait before the first token of a prompt filling the
            whole context, follow-up turns read only what is new):
              target     experts/layer  est. warm decode   pass    full \(maxContext)-token prompt
            """)
        for t in [Planner.minMemoryGB, 10, 12, 16, 24, 28, 36, 48, 73]
        where t >= Planner.minMemoryGB
        {
            guard let row = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: t,
                ramGB: device.ramGB, workingSetGB: device.workingSetGB, availableGB: device.availableGB,
                maxContextTokens: maxContext, simulated: true, runtimePolicy: model.runtimePolicy()) else {
                print(String(format: "  %6.1f GB   unavailable at this context", t)); continue
            }
            let e = row.expertsPerLayerCached
            let est = row.estWarmTokS
            let full = row.fullyResident
            let chunk = row.prefillChunk
            let wait = PrefillSchedule.estSeconds(tokens: maxContext, maxChunk: chunk)
            print(String(
                format: "  %6.1f GB   %8.0f/512      ~%2.0f tok/s%@   %5d   ~%@",
                t, e, est, full ? " (resident)" : "", chunk,
                PrefillSchedule.describe(seconds: wait)))
        }
        print("""

        time to first token at this plan, by prompt length (the pass shrinks past ~4k
        tokens so its transient memory stays inside what was measured):
        """)
        let chunk = plan.prefillChunk
        var lengths = [2048, 8192, 16384].filter { $0 < maxContext }
        lengths.append(maxContext)
        let row = lengths.map { n -> String in
                let secs = PrefillSchedule.estSeconds(tokens: n, maxChunk: chunk)
                let label = n % 1024 == 0 ? "\(n / 1024)k" : "\(n)"
                return "\(label) ~\(PrefillSchedule.describe(seconds: secs))"
            }
        print("  " + row.joined(separator: " · ") + " (the cap)")
        print("""
          context state is ~27 KiB per token; the cap of \(ContextPolicy.maxTokens) is the largest context
          measured so far, not a memory limit. `slotstream context-check --tokens N` measures a
          longer prompt on this Mac and stops before it swaps.
        """)
    }
}

// MARK: elastic-check

struct ElasticCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "elastic-check",
        abstract: "Prove greedy output is byte-identical across live pool grow/shrink")
    @OptionGroup var model: ModelOptions
    @Option var maxTokens: Int = 24
    @Option(help: "Slot count for the grow step (lower it on small machines; the equality property is size-independent)")
    var bigSlots: Int = 960

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let big = bigSlots
        Task {
            do {
                // stay near the safe floor; equality is independent of size
                let smallSlots = Geometry.floorSlots
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: smallSlots)
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: "Why is the sky blue?")], thinking: false)
                var p = SampleParams.greedy
                p.maxTokens = tokens
                func gen(_ label: String) -> String {
                    let t0 = Date()
                    let out = engine.generate(promptIds: ids, params: p).text
                    FileHandle.standardError.write(String(
                        format: "  %@ (%d slots): %.1fs\n", label, engine.model.pool.slots,
                        -t0.timeIntervalSinceNow).data(using: .utf8)!)
                    return out
                }
                let a = gen("baseline    ")
                engine.withExclusive { engine.model.pool.resize(to: big); engine.publishPoolSnapshot() }
                let b = gen("after grow  ")
                engine.withExclusive { engine.model.pool.resize(to: smallSlots); engine.publishPoolSnapshot() }
                let c = gen("after shrink")
                engine.withExclusive { engine.model.pool.resize(to: 800); engine.publishPoolSnapshot() }
                let d = gen("after regrow")
                if a == b, b == c, c == d {
                    print("ELASTIC CHECK PASS: 4 generations byte-identical across "
                        + "\(Int(Geometry.perLayer(smallSlots)))→\(Int(Geometry.perLayer(big)))"
                        + "→\(Int(Geometry.perLayer(smallSlots)))→\(Int(Geometry.perLayer(800))) experts/layer")
                } else {
                    print("ELASTIC CHECK FAIL")
                    for (n, s) in [("a", a), ("b", b), ("c", c), ("d", d)] { print("--- \(n):\n\(s)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

struct ElasticDrill: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "elastic-drill",
        abstract: "Drive the live governor through shrink and grow and prove output is unchanged")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to start from (must be well above the floor so there is room to shrink)")
    var slots: Int = 4000
    @Flag(help: "Skip the 60 s grow cooldown wait and only assert the shrink half")
    var quick = false
    @Option(help: "Hard total-memory ceiling for this diagnostic; the full governor drill needs an explicit ceiling above the ordinary 10 GB test budget")
    var maxMemoryGB: Double = 10

    func validate() throws {
        guard slots > 0, slots <= Geometry.totalRecords else {
            throw ValidationError("--slots must be positive and within the model's expert count")
        }
        guard maxMemoryGB.isFinite, (8.1 ... 26).contains(maxMemoryGB) else {
            throw ValidationError("--max-memory-gb must be between 8.1 and 26")
        }
    }

    /// `elastic-check` proves the *pool* can be resized without changing the
    /// math. This proves the *governor* actually decides to do it: poll,
    /// decide, take the generation lock, resize, update the plan, log. That
    /// path had never been exercised on a shipped build, because triggering it
    /// for real needs the machine pushed to the edge of its memory — which is
    /// exactly what `Planner.availabilityOverride` exists to avoid.
    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let startSlots = slots
        let skipGrow = quick
        let memoryCeiling = maxMemoryGB
        Task {
            do {
                let oldAvailability = Planner.availabilityOverride
                defer { Planner.availabilityOverride = oldAvailability }
                var fail: [String] = []
                func note(_ s: String) {
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }
                // `availabilityOverride` makes the governor allocate for real,
                // so every simulated figure here is bounded by what the machine
                // actually has. Simulating "plenty free" on a busy Mac once made
                // the governor take a 25 GB pool and drove tens of GB of swap —
                // the seam avoids *needing* pressure, it does not make the
                // resulting allocation imaginary.
                // A shrink can only be demonstrated from a pool at least the
                // floor plus both policy dead-bands: shrink needs 1 GB and the
                // later recovery needs 2 GB. Below that, the governor correctly
                // refuses to grow and the drill would misreport a policy failure.
                // The planner's round-trip reserves prefill/cache state from
                // this budget too, so use 3 GB to leave the desired expert pool
                // safely more than 2 GB above the floor after that reservation.
                let extraSlots = Int((3.0e9 / Geometry.recordBytes).rounded(.up))
                let minStartSlots = Geometry.floorSlots + extraSlots
                let minStartPool = Geometry.gb(minStartSlots)
                let minimumTarget = minStartPool + Planner.fixedFootprintGB
                    + Planner.prefillCostGB(Planner.prefillChunkFor(poolBudgetGB: minStartPool))
                    + Planner.prefixCacheCostGB(tokens: Planner.prefixCacheTokensFor(poolBudgetGB: minStartPool))
                    + Planner.planningMarginGB
                guard minimumTarget <= memoryCeiling else {
                    throw PlanError(String(format:
                        "elastic-drill needs at least a %.3f GB total target, above --max-memory-gb %.3f; "
                        + "the normal governor deadbands require this larger test. "
                        + "Use an explicit sufficient ceiling only with that target plus 3 GB physically reclaimable.",
                        minimumTarget, memoryCeiling))
                }
                let minAvailable = max(12.0, minStartPool * 3)
                guard let realAvail = Planner.deviceAvailableGB(), realAvail >= minAvailable else {
                    print(String(format:
                        "ELASTIC DRILL SKIP: needs ~%.0f GB reclaimable to leave room for a "
                        + "shrink, machine has %.1f GB. Close some apps and retry.",
                        minAvailable, Planner.deviceAvailableGB() ?? 0))
                    sem.signal()
                    return
                }
                // Take at most a third of what is genuinely free for the pool,
                // but always start far enough above the floor to cross the
                // governor's 1 GB dead-band. Running an auto replan here used
                // to subtract availability slack and cache costs again, turning
                // --slots 1000 into a pool that was too small to shrink.
                let cappedSlots = Int(realAvail / 3 * 1e9 / Geometry.recordBytes)
                let initialSlots = min(max(startSlots, minStartSlots), cappedSlots)
                let poolCeiling = Geometry.gb(initialSlots)
                let chunk = Planner.prefillChunkFor(poolBudgetGB: poolCeiling)
                let cacheTokens = Planner.prefixCacheTokensFor(poolBudgetGB: poolCeiling)
                let target = poolCeiling + Planner.fixedFootprintGB
                    + Planner.prefillCostGB(chunk)
                    + Planner.prefixCacheCostGB(tokens: cacheTokens)
                    + Planner.planningMarginGB
                guard target <= memoryCeiling else {
                    throw PlanError(String(format:
                        "elastic-drill needs a %.3f GB total target, above --max-memory-gb %.3f; "
                        + "the normal governor deadbands require this larger test. "
                        + "Use an explicit sufficient ceiling only with that target plus 3 GB physically reclaimable.",
                        target, memoryCeiling))
                }
                guard realAvail >= target + 3 else {
                    throw PlanError(String(format:
                        "elastic-drill requires %.3f GB reclaimable for its target plus 3 GB spare; observed %.3f",
                        target + 3, realAvail))
                }
                let observation = FootprintSampler()
                let vmBefore = ProcessMemory.vmActivity()
                var complete = false
                var outputs: [[Int]] = []
                var finalObservation: (sample: FootprintSampler.Result, vm: ProcessMemory.VMActivity?, physical: UInt64, rss: UInt64)?
                defer {
                    let observed = finalObservation ?? (sample: observation.finish(), vm: ProcessMemory.vmActivity(),
                        physical: ProcessMemory.residentBytes(), rss: ProcessMemory.lifetimeRSSPeakBytes())
                    let sample = observed.sample
                    let vmAfter = observed.vm
                    let report: [String: Any] = [
                        "complete": complete, "target_gb": target, "ceiling_gb": memoryCeiling,
                        "sampled_peak_bytes": sample.peakBytes, "samples": sample.samples,
                        "physical_footprint_end_bytes": observed.physical,
                        "lifetime_rss_peak_bytes": observed.rss,
                        "swapins_before": vmBefore.map { $0.swapins as Any } ?? NSNull(),
                        "swapins_after": vmAfter.map { $0.swapins as Any } ?? NSNull(),
                        "swapouts_before": vmBefore.map { $0.swapouts as Any } ?? NSNull(),
                        "swapouts_after": vmAfter.map { $0.swapouts as Any } ?? NSNull(),
                        "output_ids": outputs,
                    ]
                    if let data = try? JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]) {
                        note("ELASTIC DRILL MEMORY " + String(decoding: data, as: UTF8.self))
                    }
                }
                let plan = MemoryPlan(
                    source: .auto, slots: initialSlots, targetGB: target,
                    ramGB: Planner.deviceRAMGB(),
                    workingSetGB: Planner.deviceWorkingSetGB(),
                    ramPercent: Planner.defaultRAMPercent,
                    availableGB: realAvail, clamped: false,
                    prefillChunk: chunk, prefixCacheTokens: cacheTokens,
                    notes: ["elastic drill bounded test plan"])
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                func checkMemory(nextSlots: Int? = nil) throws {
                    let additional = nextSlots.map { $0 > engine.model.pool.slots ? Geometry.gb($0) : 0 } ?? 0
                    guard let available = Planner.deviceAvailableGB(), available >= 3 + additional else {
                        throw PlanError("elastic-drill lost real memory headroom before work; no simulated availability authorizes allocation")
                    }
                    let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
                    guard physical > 0, rss > 0,
                          Double(max(physical, rss)) <= memoryCeiling * 1e9 else {
                        throw PlanError("elastic-drill physical memory observation is unavailable or exceeds its explicit ceiling")
                    }
                    guard let current = ProcessMemory.vmActivity(), let before = vmBefore,
                          current.swapins == before.swapins, current.swapouts == before.swapouts else {
                        throw PlanError("elastic-drill memory interval is unavailable or contains swap activity")
                    }
                }
                try checkMemory()
                note(String(format: "  (machine has %.1f GB reclaimable; drill capped at a "
                    + "%.1f GB pool)", realAvail, poolCeiling))

                var p = SampleParams.greedy
                p.maxTokens = 20
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: "Name three rivers, comma separated.")],
                    thinking: false)
                func gen() throws -> String {
                    try checkMemory()
                    var interrupted: Error?
                    let generated = engine.generate(promptIds: ids, params: p, shouldContinue: {
                        do { try checkMemory(); return true }
                        catch { interrupted = error; return false }
                    })
                    outputs.append(generated.ids)
                    if let interrupted { throw interrupted }
                    guard generated.stats.runtimeError == nil, generated.stats.requestFailure == nil,
                          !generated.ids.isEmpty else {
                        throw PlanError("elastic-drill generation failed or returned no output")
                    }
                    try checkMemory()
                    return generated.text
                }

                let gov = MemoryGovernor(engine: engine)
                // Exercise the real queued poll/resize path at controlled
                // boundaries. A background timer could apply an unchecked
                // availability stimulus during the cooldown sleep.
                defer { gov.stop() }

                let before = try gen()
                let s0 = engine.model.pool.slots
                note(String(format: "  start:  %d slots (~%.0f/layer) -> %@",
                    s0, Geometry.perLayer(s0), before))

                // --- shrink: pretend the machine just got busy
                Planner.availabilityOverride = 2.0
                func inputs(at available: Double) -> GovernorPolicy.Inputs {
                    GovernorPolicy.Inputs(currentSlots: engine.model.pool.slots, availableGB: available,
                        ramGB: plan.ramGB, workingSetGB: plan.workingSetGB, ramPercent: plan.ramPercent,
                        maxContextTokens: engine.maxContextTokens,
                        ownedAdditionalBytes: engine.prefixCache.ownedAdditionalBytes(mtpResident: false))
                }
                func pollBounded() throws {
                    guard let available = Planner.availabilityOverride,
                          let desired = GovernorPolicy.desiredPlan(inputs(at: available)),
                          desired.expectedPeakGB <= memoryCeiling,
                          desired.slots <= s0 else {
                        throw PlanError("elastic-drill stimulus exceeds its bounded starting arena or total-memory ceiling")
                    }
                    try checkMemory(nextSlots: desired.slots)
                    gov.pollNow()
                    try checkMemory()
                }
                let shrinkInputs = inputs(at: 2)
                let startCache = engine.prefixCache.maxTokens
                try pollBounded()
                let s1 = engine.model.pool.slots
                let underPressure = try gen()
                note(String(format: "  squeeze: %d slots (~%.0f/layer) -> %@",
                    s1, Geometry.perLayer(s1), underPressure))
                if s1 >= s0 { fail.append("governor did not shrink: \(s0) -> \(s1)") }
                // Expect the controls for the pool the governor actually landed
                // on. decide() applies dead-bands and a per-step shed cap, so
                // the resulting pool is frequently not the target desiredSlots
                // suggested; asserting against that suggestion made this gate
                // pass on a quiet machine and fail on a busy one, which is the
                // opposite of what a memory gate is for. Tracking s1 still
                // proves the point -- the live controls follow the real pool --
                // and the ceiling must separately have gone down, so this
                // cannot pass by never changing at all.
                let shrinkControls = GovernorPolicy.liveControls(
                    for: s1, inputs: shrinkInputs)
                let expectedChunk = shrinkControls.prefillChunk
                let expectedCache = shrinkControls.prefixCacheTokens
                if engine.prefixCache.maxTokens >= startCache {
                    fail.append("prefix-cache ceiling did not shrink at all: stayed at \(startCache)")
                }
                if engine.generator.prefillChunk != expectedChunk {
                    fail.append("live prefill chunk stayed at \(engine.generator.prefillChunk), expected \(expectedChunk) after shrink")
                }
                if engine.prefixCache.maxTokens != expectedCache {
                    fail.append("live prefix-cache ceiling stayed at \(engine.prefixCache.maxTokens), expected \(expectedCache) after shrink")
                }
                if underPressure != before {
                    fail.append("output changed across a shrink\n    before: \(before)\n    after:  \(underPressure)")
                }

                // --- grow: memory comes back, but only to where we started —
                //     never to a figure the machine cannot actually honour.
                // The governor credits the currently resident (shrunken) pool
                // and fixed weights before replanning. Find the smallest safe
                // availability stimulus that reconstructs the actual starting
                // pool; deriving it from the hand-built target loses the
                // planner's nonlinear prefill/cache reservations and can land
                // below the 2 GB grow dead-band.
                func desiredSlots(at available: Double) -> Int {
                    GovernorPolicy.desiredSlots(inputs(at: available)) ?? s1
                }
                var low = 0.0
                var high = min(realAvail, Planner.deviceAvailableGB() ?? 0)
                if desiredSlots(at: high) < s0 {
                    fail.append("real reclaimable memory cannot reconstruct the bounded starting pool")
                } else {
                    for _ in 0 ..< 48 {
                        let mid = (low + high) / 2
                        if desiredSlots(at: mid) < s0 { low = mid } else { high = mid }
                    }
                }
                let recoveryAvailability = high
                let recoveryInputs = inputs(at: recoveryAvailability)
                note(String(
                    format: "  recovery stimulus: %.1f GB available -> %d desired slots (%.1f GB growth)",
                    recoveryAvailability,
                    GovernorPolicy.desiredSlots(recoveryInputs) ?? s1,
                    Geometry.gb((GovernorPolicy.desiredSlots(recoveryInputs) ?? s1) - s1)))
                Planner.availabilityOverride = recoveryAvailability
                try pollBounded()
                if engine.model.pool.slots != s1 {
                    fail.append("governor grew during the cooldown (should wait \(Int(GovernorPolicy.growCooldown)) s)")
                } else {
                    note("  cooldown: held at \(s1) slots, as designed")
                }

                if !skipGrow {
                    note("  waiting out the \(Int(GovernorPolicy.growCooldown)) s grow cooldown...")
                    for _ in 0 ..< Int(GovernorPolicy.growCooldown + 3) {
                        try await Task.sleep(for: .seconds(1))
                        try checkMemory()
                    }
                    try pollBounded()
                    let s2 = engine.model.pool.slots
                    let recovered = try gen()
                    note(String(format: "  recover: %d slots (~%.0f/layer) -> %@",
                        s2, Geometry.perLayer(s2), recovered))
                    if s2 <= s1 { fail.append("governor did not grow back: \(s1) -> \(s2)") }
                    if recovered != before {
                        fail.append("output changed across a grow\n    before: \(before)\n    after:  \(recovered)")
                    }
                }
                Planner.availabilityOverride = nil
                if let first = outputs.first, !outputs.allSatisfy({ $0 == first }) {
                    fail.append("output token IDs changed across governor transitions")
                }
                let finalSample = observation.finish()
                let finalVM = ProcessMemory.vmActivity()
                let finalPhysical = ProcessMemory.residentBytes(), finalRSS = ProcessMemory.lifetimeRSSPeakBytes()
                finalObservation = (finalSample, finalVM, finalPhysical, finalRSS)
                if finalSample.peakBytes == 0 || finalPhysical == 0 || finalRSS == 0
                    || Double(max(finalSample.peakBytes, max(finalPhysical, finalRSS))) > memoryCeiling * 1e9 {
                    fail.append("final sampled footprint, physical footprint or RSS is unavailable or exceeds the ceiling")
                }
                if vmBefore == nil || finalVM == nil || finalVM?.swapins != vmBefore?.swapins
                    || finalVM?.swapouts != vmBefore?.swapouts {
                    fail.append("the complete memory interval is unavailable or contains swap activity")
                }

                if fail.isEmpty {
                    complete = true
                    print("ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the "
                        + "grow cooldown\(skipGrow ? "" : ", grew back when memory returned"), "
                        + "and every generation was byte-identical")
                } else {
                    print("ELASTIC DRILL FAIL")
                    for f in fail { print("  - \(f)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

struct PrefixCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefix-check",
        abstract: "Prove conversation prefix reuse is equivalent, bounded, and deterministic")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to run with (small keeps the check cheap; these properties are size-independent)")
    var slots: Int = Geometry.floorSlots
    @Option var maxTokens: Int = 24

    /// A short multi-turn chat, driven exactly as a client drives one: every
    /// turn re-sends the whole history through the chat template, so the prompt
    /// is re-tokenized from text each time. That is the real test of whether a
    /// cache can hit at all — re-encoding the previous reply has to reproduce
    /// the ids that were generated.
    static let turns = [
        "Name one planet. Answer with just the name.",
        "Is it bigger than Earth? Answer yes or no.",
        "Why? One short sentence.",
    ]

    /// Logits after a state was built incrementally — a prefill plus one-token
    /// decode steps, exactly how the cache builds one — against logits from a
    /// single cold prefill of the same ids.
    ///
    /// These are NOT bit-identical and cannot be. MLX selects kernels and
    /// reduction orders by tensor shape, so summing the same values in a
    /// different batching sums them in a different order, and floating point
    /// is not associative. Measured here: over a 64-token sequence, every one
    /// of the 63 possible split points differs. What must hold instead is that
    /// the difference stays down in the rounding noise and does not grow as a
    /// conversation gets longer — that is the line between harmless
    /// re-association and a state that is actually being corrupted.
    /// Logits for `ids`, built either in one pass, in fixed-size passes, or
    /// incrementally the way a cached state is (a prefill, then one-token
    /// steps).
    enum Build { case whole, chunked(Int), incremental(Int) }

    static func logits(_ engine: Engine, ids: [Int], _ how: Build) -> [Float] {
        func vec(_ a: MLXArray) -> [Float] {
            a.reshaped([-1]).asType(.float32).asArray(Float.self)
        }
        let st = engine.model.makeState()
        switch how {
        case .whole:
            return vec(engine.model.lastLogits(ids, state: st))
        case .chunked(let c):
            var i = 0
            var last = MLXArray(0)
            while i < ids.count {
                let hi = min(i + c, ids.count)
                if hi == ids.count {
                    last = engine.model.lastLogits(Array(ids[i ..< hi]), state: st)
                } else {
                    eval(engine.model.hiddenStates(Array(ids[i ..< hi]), state: st))
                }
                i = hi
            }
            return vec(last)
        case .incremental(let split):
            eval(engine.model.hiddenStates(Array(ids[0 ..< split]), state: st))
            var last = MLXArray(0)
            for t in ids[split...] { last = engine.model.lastLogits([t], state: st) }
            return vec(last)
        }
    }

    static func compare(_ a: [Float], _ b: [Float]) -> (relDelta: Double, sameTop1: Bool) {
        var maxDiff: Float = 0
        for (x, y) in zip(a, b) { maxDiff = max(maxDiff, abs(x - y)) }
        let spread = (a.max() ?? 1) - (a.min() ?? 0)
        func argmax(_ v: [Float]) -> Int {
            var bi = 0
            for i in v.indices where v[i] > v[bi] { bi = i }
            return bi
        }
        return (Double(maxDiff) / Double(max(spread, 1e-6)), argmax(a) == argmax(b))
    }

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let poolSlots = slots
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: poolSlots)
                var p = SampleParams.greedy
                p.maxTokens = tokens
                var failures: [String] = []
                func note(_ s: String) {
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }

                // ---- 1. Equivalence is bounded, and does not drift with depth.
                //
                // A reused state must stay in rounding noise against a cold
                // rebuild. Corruption — a misaligned prefix, a stale cache, a
                // dropped position — moves logits by a large fraction of their
                // own spread, so a relative bound catches it while accepting
                // re-association. Growth with depth is the other failure this
                // separates out: rounding does not compound, corruption does.
                let base = try engine.encodeChat(
                    [ChatMessage(role: "user", content:
                        "Explain in two sentences why the ocean is salty and how rivers carry minerals.")],
                    thinking: false)
                var deltas: [(Int, Double)] = []
                var controls: [Double] = []
                var top1 = 0
                var probes = 0
                for reps in [1, 4, 8] {
                    var ids = base
                    let body = Array(base.dropFirst(4))
                    for _ in 1 ..< reps { ids += body }
                    let split = ids.count / 2
                    let whole = Self.logits(engine, ids: ids, .whole)
                    // Control: re-chunking a plain prefill. Nobody disputes
                    // that this is the same computation — it is the existing
                    // chunk-equivalence gate — so whatever it moves the logits
                    // by is the size of "the same answer, summed differently"
                    // on this model. The cache has to live inside that band.
                    let (ctrl, _) = Self.compare(whole, Self.logits(engine, ids: ids, .chunked(7)))
                    let (rel, same) = Self.compare(
                        whole, Self.logits(engine, ids: ids, .incremental(split)))
                    deltas.append((ids.count, rel))
                    controls.append(ctrl)
                    probes += 1
                    if same { top1 += 1 }
                    note(String(format: "  equivalence at %d tokens: reuse %.3f%% vs "
                        + "prefill-rechunk control %.3f%% of logit spread, top-1 %@",
                        ids.count, rel * 100, ctrl * 100, same ? "same" : "differs"))
                }
                let worst = deltas.map(\.1).max() ?? 0
                let worstControl = controls.max() ?? 0
                // The bound is the control, not a number picked by hand: state
                // reuse may not move logits materially more than re-chunking a
                // prefill already does. A corrupted or misaligned state fails
                // this by orders of magnitude.
                let bound = max(worstControl * 3, 0.01)
                if worst > bound {
                    failures.append(String(format:
                        "reused state moved logits by %.2f%% of their spread, over the "
                        + "%.2f%% bound set by the prefill-rechunk control — that is "
                        + "corruption, not re-association", worst * 100, bound * 100))
                }
                // Depth must not amplify it. Allow a factor of 3 over the
                // shallowest probe before calling it drift.
                if let first = deltas.first?.1, let deepest = deltas.last?.1,
                    first > 0, deepest > max(first * 3, 0.01)
                {
                    failures.append(String(format:
                        "equivalence degrades with depth (%.3f%% -> %.3f%%): state is "
                        + "accumulating error, not just re-associating",
                        first * 100, deepest * 100))
                }

                // ---- 2. A conversation, driven as a client drives one.
                func conversation(cached: Bool, edit: String? = nil) throws -> [(String, GenStats)] {
                    engine.prefixCache.drop()
                    engine.prefixCache.enabled = cached
                    engine.prefixCache.resetStats()
                    var history: [ChatMessage] = []
                    var out: [(String, GenStats)] = []
                    for (i, q) in Self.turns.enumerated() {
                        history.append(ChatMessage(
                            role: "user", content: (i == 0 && edit != nil) ? edit! : q))
                        let ids = try engine.encodeChat(history, thinking: false)
                        let r = engine.generate(promptIds: ids, params: p)
                        history.append(ChatMessage(role: "assistant", content: r.text))
                        out.append((r.text, r.stats))
                    }
                    return out
                }

                let warmA = try conversation(cached: true)
                let warmB = try conversation(cached: true)
                let cold = try conversation(cached: false)

                // ---- 3. Reuse actually happens. Without this the rest is vacuous.
                let reusing = warmA.dropFirst().filter { $0.1.prefixHit }.count
                if reusing == 0 {
                    failures.append(
                        "no turn reused a cached prefix — re-encoding a reply does not "
                        + "reproduce its generated ids, so the cache can never hit")
                }

                // ---- 4. The cached path is deterministic. Two identical runs
                //         must agree exactly; this is the invariant that a real
                //         cache bug breaks, and it is not weakened by the
                //         re-association in check 1.
                for (i, (a, b)) in zip(warmA, warmB).enumerated() where a.0 != b.0 {
                    failures.append("cached run is not deterministic at turn \(i + 1)\n"
                        + "    run 1: \(a.0)\n    run 2: \(b.0)")
                }

                // ---- 5. A prompt that does not extend the held state must
                //         rebuild, and must still be deterministic.
                let editQ = "Name one ocean. Answer with just the name."
                let edA = try conversation(cached: true, edit: editQ)
                let edB = try conversation(cached: true, edit: editQ)
                for (i, (a, b)) in zip(edA, edB).enumerated() where a.0 != b.0 {
                    failures.append("edited-history run is not deterministic at turn \(i + 1)")
                }

                // ---- 6. The shed path the governor uses under memory pressure:
                //         the state is released and the next turn rebuilds. Tested
                //         through its own contract rather than by putting the
                //         machine under real pressure to watch it happen.
                engine.prefixCache.drop()
                engine.prefixCache.enabled = true
                engine.prefixCache.resetStats()
                var hist: [ChatMessage] = [ChatMessage(role: "user", content: Self.turns[0])]
                let r1 = engine.generate(
                    promptIds: try engine.encodeChat(hist, thinking: false), params: p)
                hist.append(ChatMessage(role: "assistant", content: r1.text))
                if engine.prefixCache.heldTokens == 0 {
                    failures.append("nothing retained after a generation")
                }
                engine.dropPrefixCache()
                if engine.prefixCache.heldTokens != 0 {
                    failures.append("dropPrefixCache left \(engine.prefixCache.heldTokens) tokens held")
                }
                hist.append(ChatMessage(role: "user", content: Self.turns[1]))
                let afterShed = engine.generate(
                    promptIds: try engine.encodeChat(hist, thinking: false), params: p)
                if afterShed.stats.prefixHit {
                    failures.append("a shed state was still reused — drop() is not releasing it")
                }
                note(String(format: "  shed: retained %d tokens, dropped, next turn rebuilt %d",
                    r1.stats.promptTokens + r1.ids.count, afterShed.stats.prefillTokens))

                for (i, (t, st)) in warmA.enumerated() {
                    note(String(format: "  turn %d: %d prompt tok, %d reused, prefill %.2fs -> %@",
                        i + 1, st.promptTokens, st.reusedPrefixTokens, st.prefillSeconds,
                        t.replacingOccurrences(of: "\n", with: " ").prefix(44).description))
                }
                let coldPrefill = cold.dropFirst().reduce(0.0) { $0 + $1.1.prefillSeconds }
                let warmPrefill = warmA.dropFirst().reduce(0.0) { $0 + $1.1.prefillSeconds }
                // Informational, never asserted: how often re-association moved
                // a near-tied greedy pick far enough to change the reply.
                let changed = zip(cold, warmA).filter { $0.0 != $1.0 }.count

                if failures.isEmpty {
                    print(String(format:
                        "PREFIX CHECK PASS: reuse moves logits %.2f%% vs %.2f%% for the "
                        + "prefill-rechunk control, flat with depth, top-1 %d/%d; %d of %d "
                        + "turns reused a prefix; cached and edited-history runs "
                        + "deterministic; follow-up prefill %.2fs -> %.2fs (%d of %d replies "
                        + "differ from a cold rebuild)",
                        worst * 100, worstControl * 100, top1, probes, reusing,
                        warmA.count - 1, coldPrefill, warmPrefill, changed, cold.count))
                } else {
                    print("PREFIX CHECK FAIL")
                    for f in failures { print("  - \(f)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: goldens

struct NgramGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "ngram-golden",
        abstract: "Print n-gram row ids for a token sequence (compare vs python)")
    @OptionGroup var model: ModelOptions
    @Option var tokens: String

    func run() throws {
        let fields = tokens.split(separator: ",", omittingEmptySubsequences: false)
        let parsed = fields.map { Int64($0.trimmingCharacters(in: .whitespaces)) }
        guard !fields.isEmpty, parsed.allSatisfy({ $0 != nil }) else {
            throw ValidationError("--tokens must be a non-empty comma-separated list of integers")
        }
        let ids = parsed.compactMap { $0 }
        let index = try CheckpointIndex(dir: model.modelURL)
        guard ids.allSatisfy({ $0 >= 0 && $0 < Int64(index.config.vocabSize) }) else {
            throw ValidationError("--tokens contains an id outside 0..<\(index.config.vocabSize)")
        }
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        let eos = Int64(index.config.eosTokenId)
        let history = [eos, eos] + ids
        let rows = store.rowIds(history: history, nNew: ids.count)
        for (i, r) in rows.enumerated() {
            print("pos\(i): " + r.map(String.init).joined(separator: ","))
        }
    }
}

struct DequantGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "dequant-golden",
        abstract: "CPU-dequantize one ngram row and print values (compare vs mx.dequantize)")
    @OptionGroup var model: ModelOptions
    @Option var gid: Int64 = 12345

    func run() throws {
        guard gid >= 0 else { throw ValidationError("--gid must not be negative") }
        let index = try CheckpointIndex(dir: model.modelURL)
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        guard gid >= 0, gid < Int64(store.rowCapacity) else {
            throw ValidationError("--gid must be between 0 and \(store.rowCapacity - 1)")
        }
        print("rowsPerShard: \(store.rowsPerShard)")
        print("multipliers: \(store.multipliers)")
        let row = store.debugRow(gid)
        print("row[\(gid)][0..16]: " + row.prefix(16).map { String(format: "%.6f", $0) }.joined(separator: ","))
    }
}

/// Drives the elastic governor's decision policy across every branch with
/// scripted inputs. No checkpoint is loaded and no real memory is consumed:
/// putting the machine under genuine pressure to observe the policy is both
/// dangerous and unrepeatable, so the policy is a pure function and this is
/// its test. `elastic-check` separately proves the resize *mechanism* keeps
/// output byte-identical.
struct GovernorCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "governor-check",
        abstract: "Prove the elastic resize policy behaves across pressure, availability and cooldowns")

    func run() throws {
        try CheckRendering.emitTally(Diagnostics.governorPolicy(), label: "governor policy")
    }
}

/// Drives the sampler on synthetic logits with no checkpoint loaded, so its
/// behaviour can be diffed against `Tools/sampler_ref.py`. The logits come from
/// the same splitmix64 stream on both sides, built only from exactly
/// representable float operations so the two agree bit for bit.
struct SamplerGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sampler-golden",
        abstract: "Sample from reproducible synthetic logits (compare vs Tools/sampler_ref.py)")
    @Option var vocab: Int = 256
    @Option var draws: Int = 24
    @Option var seed: UInt64 = 7
    @Option(help: "Seed for the synthetic logits themselves") var logitSeed: UInt64 = 99
    @Option var temperature: Float = 0.8
    @Option var topP: Float = 0.95
    @Option var topK: Int = 40
    @Option var minP: Float = 0
    @Option var presencePenalty: Float = 0
    @Flag(help: "Feed each pick back as 'already generated' (exercises the penalty)")
    var accumulate = false

    func run() throws {
        var p = SampleParams()
        p.temperature = temperature
        p.topP = topP
        p.topK = topK
        p.minP = minP
        p.presencePenalty = presencePenalty
        let picks = try Goldens.sampler(
            vocab: vocab, draws: draws, seed: seed, logitSeed: logitSeed, params: p,
            accumulate: accumulate)
        print(picks.map(String.init).joined(separator: ","))
    }
}

struct TemplateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "template-check",
        abstract: "Render the chat template for a canned conversation and print token ids")
    @OptionGroup var model: ModelOptions
    @Flag var think = false

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var out: [Int] = []
        var err: Error?
        Task {
            do {
                out = try await Engine.encodeChatWithoutModel(
                    modelDir: model.modelURL,
                    messages: [
                        ChatMessage(role: "system", content: "You are helpful."),
                        ChatMessage(role: "user", content: "Hi there"),
                    ], thinking: think)
            } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        print(out.map(String.init).joined(separator: ","))
    }
}

Slotstream.main()

````

Applied delta `Tools/verify.sh`:

````diff
--- a/Tools/verify.sh
+++ b/Tools/verify.sh
@@ -53,15 +53,33 @@
   make build >"$VERIFY_OUT/build.txt" 2>&1
 fi
 
-# Every model-bearing command is deliberately kept in the documented 8–10 GB
-# range. Equality does not require a giant cache, and verification must never
-# turn spare RAM into permission for a stress test.
+# Ordinary equality gates use 8–10 GB. The live governor drill separately
+# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
+# starting arena. It checks its derived target and real headroom before load,
+# every explicit poll and generation, and samples its whole memory interval.
 SMALL_MEMORY=8.1
 BIG_MEMORY=10
 ECBIG=960
 
 echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
-check "pull --verify: 25/25 files match"     "$BIN pull --verify"
+if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
+import os,sys
+from pathlib import Path
+sys.path.insert(0, 'Tools')
+from context_qualification import quiet_preflight, verification_lock
+from prefill_bench import run_child
+out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
+quiet_preflight(13)
+with verification_lock():
+    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
+raise SystemExit(code)
+PYVERIFY
+then
+  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
+else
+  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
+  exit 1
+fi
 
 echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
 run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
@@ -97,12 +115,20 @@
 # that bound plus determinism of the cached path. See MEASUREMENTS.md.
 # Drives the governor itself — poll, decide, lock, resize, log — not just its
 # policy function, using the availability seam so no real pressure is needed.
-# Skips (does not fail) when the machine is too busy to leave shrink headroom.
+# This required full gate fails acceptance when it cannot run with headroom;
+# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
 echo "== elastic governor: shrinks, honors the cooldown, grows back =="
-DRILL=$(run_model "$BIN" elastic-drill --slots 1000 2>&1 | tail -1) || true
+safety_before 16
+DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
+DRILL_STATUS=0
+"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
+DRILL=$(sed -n '/^ELASTIC DRILL \(PASS\|FAIL\|SKIP\)/p' "$DRILL_LOG" | tail -1)
+if [ "$DRILL_STATUS" -ne 0 ]; then
+  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
+fi
 case "$DRILL" in
   *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
-  *SKIP*) echo "SKIP  $DRILL" ;;
+  *SKIP*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
   *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
 esac
 
@@ -119,10 +145,24 @@
 MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
 if [ -f "$MTPFILE" ]; then
   check "mtp head bit-parity vs Python reference (mtp-parity)" "$BIN mtp-parity"
-  if run_model "$BIN" mtp-check --memory-gb $BIG_MEMORY > /tmp/ssv_mtp.txt 2>&1; then
+  # MTP is priced at startup; the combined vision leg needs its own explicit
+  # 12 GB target. It must not add a draft head outside an MTP-off plan.
+  safety_before 15
+  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
+      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
+import json,sys
+from pathlib import Path
+text=Path(sys.argv[1]).read_text()
+assert 'PASS  vision speculation deterministic' in text
+assert 'PASS  vision speculation ran' in text
+assert 'SKIP' not in text and 'MTP CHECK PASS' in text
+rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
+assert len(rows)==1 and rows[0]['memory_validated'] is True
+PYMTP
+  then
     echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
   else
-    echo "FAIL  speculative decode gates"; tail -5 /tmp/ssv_mtp.txt; FAIL=$((FAIL+1))
+    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
   fi
 else
   echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"

````

Final source `/Users/carlos/Projects/slotstream/Tools/verify.sh` — SHA-256 `e5cf7f3849faee9f796d34173b899d2326c0d2ab606bf395acccc6b31dda2764`.

````text
#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -eo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-.build/release/slotstream}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "$BIN "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
import os,sys
from pathlib import Path
sys.path.insert(0, 'Tools')
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import run_child
out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
quiet_preflight(13)
with verification_lock():
    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
raise SystemExit(code)
PYVERIFY
then
  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
else
  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
  exit 1
fi

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$($BIN template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "$BIN parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
if Tools/planner_gates.sh; then
  echo "PASS  planner gates"; PASS=$((PASS+1))
else
  echo "FAIL  planner gates"; FAIL=$((FAIL+1))
fi

echo "== sampler vs numpy reference + elastic governor policy (no weights needed) =="
if Tools/sampler_gates.sh; then
  echo "PASS  sampler + governor gates"; PASS=$((PASS+1))
else
  echo "FAIL  sampler + governor gates"; FAIL=$((FAIL+1))
fi

echo "== golden equivalence: streaming must not change the math =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "$BIN elastic-check --big-slots $ECBIG"

# Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
# re-batching the same tokens re-associates their sums, and measured here that
# moves logits LESS than re-chunking a plain prefill already does. The gate is
# that bound plus determinism of the cached path. See MEASUREMENTS.md.
# Drives the governor itself — poll, decide, lock, resize, log — not just its
# policy function, using the availability seam so no real pressure is needed.
# This required full gate fails acceptance when it cannot run with headroom;
# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -n '/^ELASTIC DRILL \(PASS\|FAIL\|SKIP\)/p' "$DRILL_LOG" | tail -1)
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
fi
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "$BIN prefix-check"

echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "$BIN sweep-check"

# The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
# not part of `pull` — a fresh install legitimately lacks it, so these SKIP
# rather than fail when it is absent.
echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "$BIN mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS stay under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb $BIG_MEMORY"
check "--memory-gb $BIG_MEMORY output is stable" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

# The short-prompt gate above cannot see KV/indexer growth, which is what made
# the promise hold by 0.1 GB on a long prompt before the prefill pass was
# budgeted. Re-check it where the pressure actually is.
python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
safety_before 13
"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if curl -s --max-time 3 http://127.0.0.1:11467/api/version >/dev/null 2>&1; then break; fi
  sleep 2
done
if Tools/quality_probe.sh 11467; then
  echo "PASS  behavioural quality probe (15 items)"; PASS=$((PASS+1))
else
  echo "FAIL  behavioural quality probe"; FAIL=$((FAIL+1))
fi
kill $QPID 2>/dev/null || true
wait $QPID 2>/dev/null || true
QPID=""

echo "== weights behind a symlink (Foundation will not list a symlinked dir) =="
MODEL_DIR=models/qwen38-flash-next-mlx-4bit
[ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
SYM=/tmp/ssv_symlink_model
rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
check "run through a symlinked model dir"  "$BIN run --model $SYM --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
rm -f "$SYM"

safety_before 13
if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    "$BIN vision-parity --out $VP"
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# At 10 GB including the tower reservation, and only with verified headroom. This gate runs last,
# after an hour of goldens has filled the file cache, and on 2026-09-03 the
# kernel killed its server mid-suite at the 10 GB target with 0.3 GB free and
# swap nearly full. A skip that says so is the correct outcome there; an
# OOM-killed server is not a vision failure and must not be reported as one.
NEED_GB=$(awk "BEGIN{print $BIG_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  echo "      re-run alone:  $BIN serve --memory-gb $BIG_MEMORY --port 11468 &  Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb $BIG_MEMORY --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]

````

Applied delta `Tools/context_gates.py`:

````diff
--- a/Tools/context_gates.py
+++ b/Tools/context_gates.py
@@ -90,11 +90,37 @@
         d = json.loads(result["stdout"])
         pos = start
         bounded = True
-        for count in d["passes"]:
-            bounded &= count > 0 and count * (pos + count) <= 4096 * 8016
+        bounded &= len(d["passes"]) == len(d["compute_query_rows"]) == len(d["compute_key_extents"])
+        for count, queries, extent in zip(d["passes"], d["compute_query_rows"], d["compute_key_extents"]):
+            bounded &= count > 0 and queries >= count and extent >= pos + count and queries * extent <= 4096 * 8016
             pos += count
         expect(f"full schedule from {start}", bounded and pos == 262144, d)
         expect(f"uncalibrated schedule from {start} labeled unknown", d["est_seconds"] is None)
+
+    result = run(binary, ["prefill-schedule", "--tokens", "512", "--from", "200000", "--chunk", "4095", "--json"])
+    evidence.append(result)
+    d = json.loads(result["stdout"])
+    expect("odd late diagnostic reports actual canonical runtime passes", d["passes"] == [64]*8, d)
+    expect("odd late diagnostic includes masked key columns", d["compute_key_extents"] == [200256]*4+[200512]*4, d)
+
+    for args in [["--slots", "0"], ["--slots", "-1"], ["--slots", "9223372036854775807"],
+                 ["--max-memory-gb", "nan"], ["--max-memory-gb", "inf"],
+                 ["--max-memory-gb", "0"], ["--max-memory-gb", "27"]]:
+        result = run(binary, ["elastic-drill", *args, "--model", "/nonexistent/context-gate-no-model"])
+        evidence.append(result)
+        expect(f"elastic drill refuses invalid limits before load {args}", result["code"] != 0
+               and "engine ready" not in result["stderr"] and "no model at" not in result["stderr"], result)
+    result = run(binary, ["elastic-drill", "--slots", "1000", "--max-memory-gb", "10",
+                          "--model", "/nonexistent/context-gate-no-model"])
+    evidence.append(result)
+    expect("elastic drill cannot silently enlarge the ordinary test budget", result["code"] != 0
+           and "above --max-memory-gb 10.000" in result["stderr"] and "engine ready" not in result["stderr"], result)
+
+    for surface in ["mtp-accept", "mtp-bench", "mtp-check", "mtp-passcost"]:
+        result = run(binary, [surface, "--mtp", "off", "--memory-gb", "10", "--model", "/nonexistent/context-gate-no-model"])
+        evidence.append(result)
+        expect(f"{surface} rejects an unpriced mandatory draft before loading", result["code"] != 0
+               and "requires the MTP draft head" in result["stderr"] and "engine ready" not in result["stderr"], result)
 
     for surface in ["serve", "run", "doctor"]:
         for args in [["--max-context", "0"], ["--max-context", "262145"],

````

Final source `/Users/carlos/Projects/slotstream/Tools/context_gates.py` — SHA-256 `3c735af4c0db4946eff5ef7240859b705ac6e3931a535ec49b7db7ce30954b76`.

````text
#!/usr/bin/env python3
"""Weight-free configurable-context CLI/metadata contracts; never loads a model."""
import argparse
import json
import os
import re
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent


def run(binary, args):
    env = {k: v for k, v in os.environ.items() if not k.startswith("SLOTSTREAM_")}
    result = subprocess.run([str(binary), *args], env=env, text=True, capture_output=True, timeout=120)
    return {"args": args, "code": result.returncode, "stdout": result.stdout, "stderr": result.stderr}


def successful_tools(frames):
    """Receiving-side fixture: valid arguments alone never authorize execution."""
    calls = {}
    finished = False
    terminal = False
    failed = False
    for frame in frames:
        if frame == "[DONE]":
            if not finished or failed:
                return []
            terminal = True
            continue
        if terminal or not isinstance(frame, dict) or frame.get("error"):
            return []
        for choice in frame.get("choices", []):
            reason = choice.get("finish_reason")
            if reason is not None:
                if finished or reason != "tool_calls":
                    return []
                finished = True
            for delta in choice.get("delta", {}).get("tool_calls", []):
                if finished:
                    return []
                current = calls.setdefault(delta["index"], {"id": "", "name": "", "arguments": ""})
                current["id"] += delta.get("id", "")
                function = delta.get("function", {})
                current["name"] += function.get("name", "")
                current["arguments"] += function.get("arguments", "")
    if not terminal or not finished or failed:
        return []
    result = []
    try:
        for call in calls.values():
            args = json.loads(call["arguments"])
            if not call["id"] or not call["name"] or not isinstance(args, dict):
                return []
            result.append({**call, "arguments": args})
    except (ValueError, TypeError):
        return []
    return result


def check(binary):
    evidence, assertions = [], []

    def expect(name, condition, detail=None):
        assertions.append({"name": name, "passed": bool(condition), "detail": detail if not condition else None})

    fixture = json.loads((ROOT / "Tools/fixtures/context-default-v1.json").read_text())
    help_result = run(binary, ["context-check", "--help"])
    evidence.append(help_result)
    help_text = help_result["stdout"]
    for flag, default in [("--reply-tokens", "16"), ("--wall-seconds", "7200.0")]:
        expect(f"diagnostic {flag} default is explicit", bool(re.search(
            re.escape(flag) + r"(?:(?!\n  --).)*\(default: " + re.escape(default) + r"\)", help_text, re.S)), help_text)
    fields = fixture["projection_fields"]
    additions = set(fixture["allowed_additions"])
    for tier in fixture["tiers"]:
        repeats = [run(binary, tier["args"]) for _ in range(2)]
        evidence.extend(repeats)
        values = [json.loads(r["stdout"]) for r in repeats]
        projected = [{k: d[k] for k in fields if k in d} for d in values]
        expect(f"default {tier['tier']} preserved", projected[0] == projected[1] == tier["expected"], projected)
        for d in values:
            expect(f"default {tier['tier']} additions declared", set(d) <= set(fields) | additions, sorted(d))
            expect(f"default {tier['tier']} ledger agrees", abs(d["expected_peak_gb"] - d["memory_ledger"]["expected_peak_bytes"] / 1e9) <= .051)
            expect(f"default {tier['tier']} wait policy", d["max_prefill_wait_minutes"] == 30 and d["prefill_wait_scope"] == "accepted_request_to_first_model_token")

    for start in [0, 1, 32768, 65535, 128256, 131071, 262079, 262143]:
        result = run(binary, ["prefill-schedule", "--tokens", str(262144 - start), "--from", str(start), "--chunk", "4096", "--json"])
        evidence.append(result)
        d = json.loads(result["stdout"])
        pos = start
        bounded = True
        bounded &= len(d["passes"]) == len(d["compute_query_rows"]) == len(d["compute_key_extents"])
        for count, queries, extent in zip(d["passes"], d["compute_query_rows"], d["compute_key_extents"]):
            bounded &= count > 0 and queries >= count and extent >= pos + count and queries * extent <= 4096 * 8016
            pos += count
        expect(f"full schedule from {start}", bounded and pos == 262144, d)
        expect(f"uncalibrated schedule from {start} labeled unknown", d["est_seconds"] is None)

    result = run(binary, ["prefill-schedule", "--tokens", "512", "--from", "200000", "--chunk", "4095", "--json"])
    evidence.append(result)
    d = json.loads(result["stdout"])
    expect("odd late diagnostic reports actual canonical runtime passes", d["passes"] == [64]*8, d)
    expect("odd late diagnostic includes masked key columns", d["compute_key_extents"] == [200256]*4+[200512]*4, d)

    for args in [["--slots", "0"], ["--slots", "-1"], ["--slots", "9223372036854775807"],
                 ["--max-memory-gb", "nan"], ["--max-memory-gb", "inf"],
                 ["--max-memory-gb", "0"], ["--max-memory-gb", "27"]]:
        result = run(binary, ["elastic-drill", *args, "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"elastic drill refuses invalid limits before load {args}", result["code"] != 0
               and "engine ready" not in result["stderr"] and "no model at" not in result["stderr"], result)
    result = run(binary, ["elastic-drill", "--slots", "1000", "--max-memory-gb", "10",
                          "--model", "/nonexistent/context-gate-no-model"])
    evidence.append(result)
    expect("elastic drill cannot silently enlarge the ordinary test budget", result["code"] != 0
           and "above --max-memory-gb 10.000" in result["stderr"] and "engine ready" not in result["stderr"], result)

    for surface in ["mtp-accept", "mtp-bench", "mtp-check", "mtp-passcost"]:
        result = run(binary, [surface, "--mtp", "off", "--memory-gb", "10", "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"{surface} rejects an unpriced mandatory draft before loading", result["code"] != 0
               and "requires the MTP draft head" in result["stderr"] and "engine ready" not in result["stderr"], result)

    for surface in ["serve", "run", "doctor"]:
        for args in [["--max-context", "0"], ["--max-context", "262145"],
                     ["--max-prefill-wait", "nan"], ["--max-prefill-wait", "inf"],
                     ["--max-prefill-wait", "-1"], ["--max-prefill-wait", "1e300"]]:
            result = run(binary, [surface, *args, "--model", "/nonexistent/context-gate-no-model"])
            evidence.append(result)
            expect(f"{surface} rejects {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)
            expect(f"{surface} validates policy before weights {args}", "still to download" not in result["stderr"] and "no model at" not in result["stderr"], result)
    for args in [["--tokens", "262144"], ["--tokens", "-1"],
                 ["--tokens", "9223372036854775807"], ["--reply-tokens", "9223372036854775807"],
                 ["--reply-tokens", "0"], ["--wall-seconds", "nan"],
                 ["--warm-conversations", "5"], ["--warm-conversations", "-1"],
                 ["--warm-conversations", "4", "--warm-tokens", "9223372036854775807"],
                 ["--warm-conversations", "4", "--ladder"],
                 ["--tokens", "16", "--warm-conversations", "4", "--warm-tokens", "32"]]:
        result = run(binary, ["context-check", *args, "--model", "/nonexistent/context-gate-no-model"])
        evidence.append(result)
        expect(f"diagnostic rejects before allocation {args}", result["code"] != 0 and "engine ready" not in result["stderr"], result)

    # This reads pinned headers and prices a plan; it must never construct an
    # Engine or turn a predicted fit into qualification evidence.
    result = run(binary, ["context-check", "--tokens", "4096", "--reply-tokens", "16",
                          "--memory-gb", "8.1", "--mtp", "off", "--vision", "off", "--plan-only"])
    evidence.append(result)
    try:
        planned = json.loads(result["stdout"])
    except ValueError:
        planned = {}
    expect("plan-only does not allocate or qualify an Engine", result["code"] == 0
           and planned.get("kind") == "unqualified-context-plan" and planned.get("qualified") is False
           and "fits" not in planned and "engine ready" not in result["stderr"], result)
    expect("plan-only binds configured context and exact runtime controls",
           planned.get("plan", {}).get("max_context_tokens") == 4112
           and bool(planned.get("optimizations")) and bool(planned.get("model_revision")), planned)

    tool = {"choices": [{"delta": {"tool_calls": [{"index": 0, "id": "call_1", "function": {"name": "lookup", "arguments": '{"key":"a"}'}}]}, "finish_reason": None}]}
    finish = {"choices": [{"delta": {}, "finish_reason": "tool_calls"}]}
    expect("successful tool turn is deliverable", len(successful_tools([tool, finish, "[DONE]"])) == 1)
    for suffix in [[], [{"error": {"code": "insufficient_memory"}}],
                   [{"error": {"code": "prefill_deadline_exceeded"}}],
                   [{"choices": [{"delta": {}, "finish_reason": "length"}]}, "[DONE]"],
                   [finish], [finish, {"error": {"code": "inference_error"}}, "[DONE]"]]:
        expect(f"failed/incomplete tool turn is inert {suffix}", successful_tools([tool, *suffix]) == [])
    return {"passed": all(a["passed"] for a in assertions), "assertions": assertions, "commands": evidence}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--binary", type=Path, default=ROOT / ".build/release/slotstream")
    p.add_argument("--report", type=Path, required=True)
    a = p.parse_args()
    result = check(a.binary.resolve())
    a.report.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"passed": result["passed"], "assertions": len(result["assertions"]),
                      "failures": [v for v in result["assertions"] if not v["passed"]]}))
    return 0 if result["passed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())

````

Applied delta `docs/CLI.md`:

````diff
--- a/docs/CLI.md
+++ b/docs/CLI.md
@@ -166,14 +166,14 @@
 | `governor-check` | The elastic resize policy across pressure, availability, and cooldowns. |
 | `sampler-golden` | Sampling from reproducible synthetic logits, compared against `Tools/sampler_ref.py`. Flags: `--vocab`, `--draws`, `--seed`, `--logit-seed`, `--temperature`, `--top-p`, `--top-k`, `--min-p`, `--presence-penalty`, `--accumulate`. |
 | `pull-check` | Same-size corruption detection and HTTP range validation in the downloader. |
-| `prefill-schedule` | The prefill passes a prompt runs at a given pass size and the wait they imply; the same arithmetic `doctor` and the 400 message use. `--chunk` (4096), `--tokens` (32768), `--from` (0), `--json`. |
+| `prefill-schedule` | The prefill passes a prompt runs at a given pass size and the wait they imply; the same wait arithmetic `doctor` and the 400 message use. JSON includes actual canonical pass sizes, physical query rows and key extents, including numerical padding. `--chunk` (4096), `--tokens` (32768), `--from` (0), `--json`. |
 
 **Load the model**
 
 | Command | Proves |
 |---|---|
 | `elastic-check` | Greedy output is byte-identical across a live pool grow and shrink. `--max-tokens` (24), `--big-slots` (960; lower it on small machines). |
-| `elastic-drill` | The live governor shrinks under pressure, honors the grow cooldown, grows back, and output never changes. `--slots` (4000), `--quick` skips the 60 s cooldown wait. |
+| `elastic-drill` | Drives the live governor through controlled polls: shrink, grow cooldown, regrowth and exact output. `--slots` (4000), `--max-memory-gb` (10), `--quick` skips regrowth. The unchanged deadbands need a larger starting arena: the full test uses `--slots 1000 --max-memory-gb 13`, requires the derived target plus 3 GB physically reclaimable, and reports sampled memory and swap. An insufficient ceiling refuses before model allocation. |
 | `prefix-check` | Conversation prefix reuse is equivalent, bounded, and deterministic. `--slots` (640), `--max-tokens` (24). |
 | `sweep-check` | The prefill sweep (passes of 256 tokens or more) stays inside the prefill-rechunk band against the pool path, is deterministic, gives bit-identical logits on a cold and a warm pool, and leaves the pool consistent after admission. `--slots` (640). |
 | `parity` | N truncated layers match the Python reference dumps. `--layers` (4), `--tokens`, `--compare <dir>`, `--out <dir>`. |

````

Final source `/Users/carlos/Projects/slotstream/docs/CLI.md` — SHA-256 `b090316a37fa9e337f3f59e5d9bc610048a2a945e80078b6fb1b746cde5c0f02`.

````text
# Command reference

This page covers everyday commands, memory settings, and common diagnostics.
Run `slotstream <command> --help` for the options in your installed version.
Only one model process can run per user at a time.

<a id="where-things-live"></a>

## File locations

| Path | What |
|---|---|
| `~/.slotstream/bin/` | Symlink to the active release: the `slotstream` binary and its `mlx.metallib`. |
| `~/.slotstream/releases/<sha256>-macos<NN>/` | Each installed release, content-addressed. The installer stages a release here, verifies it, then switches the `bin` symlink. |
| `~/.slotstream/models/qwen38-flash-next-mlx-4bit/` | The weights: 25 files, 105.3 GB (the 1.5 GB draft head is optional). Compressed pulls use `.slotpack-state.json` and `.slotpack.part` files while in progress; legacy raw pulls use `.partmap` and `.part`. |
| `/usr/local/bin/slotstream`, or a PATH line in `~/.zshrc` / `~/.bash_profile` | How the installer puts the command on your PATH (the wrapper when `/usr/local/bin` is writable, the profile line otherwise). |
| `/tmp/slotstream-model-<uid>.lock` | The one-process lock, held while a model is loaded. |

## Everyday commands

### `slotstream run`

Generate once from a prompt, with no server.

| Flag | Meaning |
|---|---|
| `--prompt <text>` | The prompt (default: "Why is the sky blue?"). |
| `--max-tokens <n>` | Tokens to generate; `<= 0` means as many as the context allows (default 128). |
| `--greedy` | Deterministic greedy sampling. |
| `--raw` | Send the prompt without the chat template. |
| `--think` | Enable the model's thinking mode. |
| `--image <path>` | Attach a local image; repeat the flag for multiple images. |

Plus the [memory options](#memory-options) below.

### `slotstream serve`

Start the local API server. See the [API reference](API.md) for the Ollama
and OpenAI endpoints and the [fx guide](FX.md) for the AI SDK gateway.

| Flag | Meaning |
|---|---|
| `--port <n>` | Listen port on 127.0.0.1 (default 11434). |
| `--max-context <n>` | Maximum tokens shared by prompt and reply. Default: 32768; ceiling: 65536. A larger window is priced before allocating the expert cache; a prompt above the configured cap returns 400. Context state uses about 27 KiB per token. |
| `--no-elastic` | Pin the cache at its startup size. By default an auto-sized cache resizes between requests as memory pressure changes; explicit sizes are always pinned. |
| `--no-prefix-cache` | Process each prompt from scratch. Useful for reproducibility comparisons. |

Plus the memory options.

### `slotstream pull [model]`

Download losslessly compressed model weights from the CDN, reconstructing
the original files with resumable transfers and hash verification.
The only model name is `qwen3.8-flash-next:4bit`, which is also the default.

| Flag | Meaning |
|---|---|
| `--dir <path>` | Destination directory (default `~/.slotstream/models/qwen38-flash-next-mlx-4bit`). |
| `--connections <n>` | Fixed independent connections, 1–32. Omit to start at 8 and test increases only while throughput improves. |
| `--transport automatic\|compressed\|raw` | Automatic uses compressed CDN objects for new pulls and preserves legacy raw resumes. Explicit raw selects file-based mirrors. |
| `--verify` | Check existing files against pinned SHA-256 hashes without downloading. |

The complete compressed package uses **16.12% fewer bytes**. Decode and writes
overlap the transfer. Historical raw-path testing measured 112 MB/s on a
1 Gbit/s link; that is not a guarantee for another connection. Ctrl-C safely
preserves verified chunks. See [the download guide](DOWNLOAD-FORMAT.md).

The complete compressed package uses **16.12% fewer bytes**. Decode and writes
overlap the transfer. Historical raw-path testing measured 112 MB/s on a
1 Gbit/s link; that is not a guarantee for another connection. Ctrl-C safely
preserves verified chunks. See [the download guide](DOWNLOAD-FORMAT.md).

Weights placed elsewhere are used by passing that directory to `--model`, or
by symlinking it into the default location. Symlinked directories work from
0.2.1 onward.

### `slotstream doctor`

Show your Mac's memory plan, disk space, and estimated speed. This command
never loads the model and can run while the server is working.

| Flag | Meaning |
|---|---|
| `--sim-ram <gb>` | Preview a Mac with this much RAM. Assumes no other apps are using memory unless `--sim-available` is set; working set defaults to 75% of RAM. |
| `--sim-working-set <gb>` | Use this Metal working-set limit in the simulation. |
| `--sim-available <gb>` | Use this much available memory in the simulation. |
| `--max-context <n>` | Preview the plan `serve --max-context n` would announce. |
| `--json` | The resolved plan as JSON, with estimates unrounded (`max_context_tokens`, `est_prefill_s_at_max_context`). |

Plus the memory options, so `doctor --memory-gb 16` shows exactly what
`serve --memory-gb 16` would do. The report ends with the wait before the
first token by prompt length at that plan, and the tier table carries the
wait for a prompt filling the whole context.

### `slotstream context-check`

Measure how long a synthetic prompt takes on your Mac, with conversation
reuse disabled. It reports seconds, tokens per second, and peak process
memory against the plan. It checks available memory between passes and
stops if it falls below the threshold.

Stop any running model process first. Results are printed without writing
files; contributors can register them in the measurement records under `db/`.

| Flag | Meaning |
|---|---|
| `--tokens <n>` | Prompt length (default 8192; at most 262144). |
| `--ladder` | Run 2048, 4096, … up to `--tokens`, stopping at the first rung that leaves the plan. |
| `--min-free-gb <gb>` | Abort a pass when reclaimable memory falls below this (default: the planner's slack, 5% of RAM, at least 1.5 GB). |
| `--json` | One JSON object per rung. |

Plus the memory options; give it the same target you would give `serve`.

## Memory options

Shared by `run`, `serve`, `doctor`, and every check that loads the model.
With none of them, auto sizes the process to the machine (see the README's
Memory section).

| Flag | Meaning |
|---|---|
| `--model <name or dir>` | Model name (resolves to `~/.slotstream/models`, or a dev checkout's `models/`) or a directory path. |
| `--memory-gb <gb>` | Total process memory target, in decimal GB. The cache gets what remains after fixed allocations and a 1 GB margin. Minimum 8.1; use this option for a manual target. |
| `--experts-per-layer <n>` | Expert cache size directly, 1…512. Each of the 48 layers has 512 experts of 2.76 MB and the cache holds `n × 48` of them, so the pool is `n × 0.133 GB`: 30/layer is 4 GB, 181 is 24 GB, 226 is 30 GB. The pool is one global cache; hot layers borrow slots from cold ones. |
| `--pool-gb <gb>` | Raw expert-pool size (1 GB is about 7.5 experts per layer). |
| `--vision auto\|on\|off` | Accept images (default `auto`). `auto` loads the image encoder on first use; `on` also requires the checkpoint to contain vision weights; `off` rejects images. |
| `--mtp auto\|on\|off` | Speculative decode (default `auto`); see [Speculative decode](#speculative-decode). |
| `--max-ram-percent <p>` | Auto only: the largest share of RAM auto may target (default 70). Lowers the target for other apps; cannot raise it past the ~33 GB ceiling. Ignored when an explicit size is given. |

Precedence when several are given: `--experts-per-layer` beats `--pool-gb`,
which beats `--memory-gb`. An explicit size stays fixed and
bypasses automatic availability checks. Preview it with `doctor` and make
sure the memory is available before loading the model.

## Environment variables

| Variable | Read by | Meaning |
|---|---|---|
| `SLOTSTREAM_WEIGHTS_SOURCES` | `pull` | Comma-separated raw-file bases tried in order. Selects raw transport in automatic mode; every file must match the original pins. |
| `SLOTSTREAM_COMPRESSED_SOURCES` | `pull` | Comma-separated Slotpack package bases; every object must match the embedded package. |
| `SLOTSTREAM_PULL_TRANSPORT` | `pull` | `automatic`, `compressed`, or `raw`; an explicit non-automatic CLI flag takes precedence. |
| `SLOTSTREAM_PULL_CONNECTIONS` | `pull` | Fixes parallel connections, capped at 32; the CLI flag takes precedence. |
| `SLOTSTREAM_PREFIX_CACHE` | engine | `0` disables conversation prefix reuse, like `--no-prefix-cache`. |
| `SLOTSTREAM_PREFILL_CHUNK` | engine | Override the largest prefill pass in tokens instead of taking it from the memory plan; the schedule still shrinks it as the context grows. Measurement work only. |
| `SLOTSTREAM_IO_QUEUE_DEPTH` | engine | Expert read parallelism, 1…128 (default 12; measured flat from 12 to 32, worse above). |
| `SLOTSTREAM_EXPERT_LOAD_BATCH` | engine | Expert records staged at once during prefill, 1…512 (default 32): the sweep's group size on a pass of 256 tokens or more, the pool's load slice below that. Bounds peak memory on long prompts. |
| `SLOTSTREAM_SWEEP` | engine | `0` runs every prefill pass through the slot pool the way 0.2.2 and earlier did, instead of the sweep. A/B work only; slower. |
| `SLOTSTREAM_SWEEP_ADMIT` | engine | `0` stops the last pass of a prompt from admitting the prompt's hottest experts into the pool, so decode starts cold. A/B work only. |
| `SLOTSTREAM_SWEEP_TRACE` | engine | `1` prints, after each prefill, where the sweep's time went: reads, waiting for the GPU, sorting rows, copies out of the pool, and MLX's peak and cache. |
| `SLOTSTREAM_PREFILL_CACHE_MB` | engine | MLX buffer-cache cap while a prompt is read. The plan sets 512 at targets of 12 GB and under (the sweep's varying array sizes otherwise fill the 2 GB cache, 1.7 GB of peak at the floor) and no cap above, where it costs ~6% of prefill; this forces a value at any target. |
| `SLOTSTREAM_ROOT_DIR` | installer | Install somewhere other than `~/.slotstream`. |
| `SLOTSTREAM_RELEASE_BASE` | installer | Fetch the release from another base URL (CI uses it to test unpublished builds). |

## Checks and diagnostics

These checks help diagnose an installation. The first group needs no weights;
the second loads the model. Use small explicit memory targets for model
checks (`--memory-gb 8.1` to `10`) and stop other model processes first.
See [Testing](TESTING.md) for the full suites.

**Weights-free**

| Command | Proves |
|---|---|
| `runtime-check` | Process RSS accounting and the prefix cache's four-conversation bound. |
| `governor-check` | The elastic resize policy across pressure, availability, and cooldowns. |
| `sampler-golden` | Sampling from reproducible synthetic logits, compared against `Tools/sampler_ref.py`. Flags: `--vocab`, `--draws`, `--seed`, `--logit-seed`, `--temperature`, `--top-p`, `--top-k`, `--min-p`, `--presence-penalty`, `--accumulate`. |
| `pull-check` | Same-size corruption detection and HTTP range validation in the downloader. |
| `prefill-schedule` | The prefill passes a prompt runs at a given pass size and the wait they imply; the same wait arithmetic `doctor` and the 400 message use. JSON includes actual canonical pass sizes, physical query rows and key extents, including numerical padding. `--chunk` (4096), `--tokens` (32768), `--from` (0), `--json`. |

**Load the model**

| Command | Proves |
|---|---|
| `elastic-check` | Greedy output is byte-identical across a live pool grow and shrink. `--max-tokens` (24), `--big-slots` (960; lower it on small machines). |
| `elastic-drill` | Drives the live governor through controlled polls: shrink, grow cooldown, regrowth and exact output. `--slots` (4000), `--max-memory-gb` (10), `--quick` skips regrowth. The unchanged deadbands need a larger starting arena: the full test uses `--slots 1000 --max-memory-gb 13`, requires the derived target plus 3 GB physically reclaimable, and reports sampled memory and swap. An insufficient ceiling refuses before model allocation. |
| `prefix-check` | Conversation prefix reuse is equivalent, bounded, and deterministic. `--slots` (640), `--max-tokens` (24). |
| `sweep-check` | The prefill sweep (passes of 256 tokens or more) stays inside the prefill-rechunk band against the pool path, is deterministic, gives bit-identical logits on a cold and a warm pool, and leaves the pool consistent after admission. `--slots` (640). |
| `parity` | N truncated layers match the Python reference dumps. `--layers` (4), `--tokens`, `--compare <dir>`, `--out <dir>`. |
| `template-check` | Renders the chat template for a canned conversation and prints token ids. `--think`. |
| `ngram-golden` | Prints n-gram row ids for a token sequence, for comparison with Python. `--tokens`. |
| `dequant-golden` | CPU-dequantizes one n-gram row for comparison with `mx.dequantize`. `--gid` (12345). |

<a id="new-in-020"></a>

## Speculative decode

- `--mtp auto|on|off` on `run`, `serve`, and `doctor`: speculative decode with the
  model's draft head, `mtp.safetensors`, which `pull` fetches with the
  weights. The file is optional; downloads can complete without it. `on`
  without the file is an error; `auto`, the default, turns it on when the
  cache still reaches 120 experts per layer after the head's 1.6 GB (a 28 GB
  target) and stays off below that, where it reduced speed in tests. At that size
  it measured ×1.24 decode; MEASUREMENTS.md M9 has the ladder and the
  ceiling.
- `mtp-parity`, `mtp-accept`, `mtp-check`: the draft head's parity with the
  Python reference, its measured accept rate (`--depth`, default 4), and the
  speculative-decode gates.
- `SLOTSTREAM_DRAFT_DEPTH`: draft chain depth, 1–16 (default 1, by
  measurement: longer verification passes cost more, and one draft was best or tied
  at the tested cache sizes; MEASUREMENTS.md M9). Rejected drafts roll
  back to recorded state. This override is for experiments.

````

Applied delta `docs/TESTING.md`:

````diff
--- a/docs/TESTING.md
+++ b/docs/TESTING.md
@@ -41,6 +41,23 @@
 allocate memory at the same time, despite the guard against multiple model
 processes. Use the small explicit targets in `Tools/verify.sh` and check
 available memory before a model test.
+
+The full live-governor drill is a separate bounded exception: its normal
+1 GB shrink and 2 GB grow deadbands require a starting arena larger than the
+ordinary 10 GB tests. `verify.sh` uses `elastic-drill --slots 1000
+--max-memory-gb 13`, after checking 16 GB reclaimable. The command independently
+checks its derived total target plus 3 GB spare, each controlled poll and
+generation, sampled physical footprint, RSS and swap. It preserves the real
+cooldown and exact output checks. A skipped drill fails full acceptance.
+Run this gate without other heavy work. Full model hashing holds the same
+process exclusion lock as inference and must pass before native acceptance.
+
+MTP diagnostics require and price the draft head before Engine allocation,
+including when their `--mtp` option is left at `auto`; explicit `off` is
+incompatible. The full `mtp-check` includes vision and uses an explicit 12 GB
+target after a 15 GB reclaimable preflight. Its text-only leg can be selected
+with `--vision off` under the ordinary 10 GB test target. A text-only pass does
+not prove the combined image/MTP leg.
 
 ### The Metal library
 

````

Final source `/Users/carlos/Projects/slotstream/docs/TESTING.md` — SHA-256 `da34833652eace5a832d85f9aa00a1aa25f269ecab0ba5f0a2ce673abafef861`.

````text
# Testing

Checks in `SlotstreamDiagnostics` return a `CheckReport`. The CLI, test
runner, and host apps use those same functions.

Choose a suite based on what you have installed:

```bash
make checks          # the tier that needs nothing: no GPU, no weights, no network
make checks-all      # adds the MLX tier
make test            # Tools/verify.sh, the acceptance battery against real weights
make coverage        # line coverage of the library
```

## Why there is no `swift test`

The supported Command Line Tools setup lacks XCTest and Swift Testing.
The project uses a plain executable, `slotstream-checks`, so contributors
can run checks without installing Xcode. CI uses the same runner.

```bash
.build/release/slotstream-checks --list
.build/release/slotstream-checks --tier t0 --tier t1
.build/release/slotstream-checks --filter http --json
```

## Tiers

Tiers group checks by their dependencies. Choose the tiers your machine can
run; a T0 pass covers only T0.

| Tier | Needs | Runs |
|---|---|---|
| **T0** | Nothing. Pure Swift. | Every push |
| **T1** | MLX, and so the Metal library beside the runner | Every push |
| **T2** | The pinned tokenizer fixture | Not yet built |
| **T3** | A synthetic checkpoint | Not yet built |
| **T4** | The real 105 GB of weights | The dev Mac, per release |

**Run tiers above T0 sequentially.** Several checks in one process can still
allocate memory at the same time, despite the guard against multiple model
processes. Use the small explicit targets in `Tools/verify.sh` and check
available memory before a model test.

The full live-governor drill is a separate bounded exception: its normal
1 GB shrink and 2 GB grow deadbands require a starting arena larger than the
ordinary 10 GB tests. `verify.sh` uses `elastic-drill --slots 1000
--max-memory-gb 13`, after checking 16 GB reclaimable. The command independently
checks its derived total target plus 3 GB spare, each controlled poll and
generation, sampled physical footprint, RSS and swap. It preserves the real
cooldown and exact output checks. A skipped drill fails full acceptance.
Run this gate without other heavy work. Full model hashing holds the same
process exclusion lock as inference and must pass before native acceptance.

MTP diagnostics require and price the draft head before Engine allocation,
including when their `--mtp` option is left at `auto`; explicit `off` is
incompatible. The full `mtp-check` includes vision and uses an explicit 12 GB
target after a 15 GB reclaimable preflight. Its text-only leg can be selected
with `--vision off` under the ordinary 10 GB test target. A text-only pass does
not prove the combined image/MTP leg.

### The Metal library

MLX finds its shaders beside the executable that is running, through `dladdr` on
its own code. `make build` puts `mlx.metallib` in `.build/release`, which the CLI
and the runner share, so T1 works there with no extra step. A test bundle would
need its own copy in `.xctest/Contents/MacOS/`. Without it the first MLX call
fails with `Failed to load the default metallib`.

The LCOV path also runs instrumented transport fixtures over real loopback
HTTP, including malformed responses, resumability, raw-source compatibility,
and sustained-memory bounds. Their line hits are combined with the catalogue;
network code is no longer represented only by weights-free catalogue coverage.

## What runs where

| Suite | What it covers | Weights | Where |
|---|---|---|---|
| `slotstream-checks` (T0/T1) | prefill schedule, context policy, runtime and cache bounds, governor policy, pull integrity, machine planning, HTTP framing and routing, vision geometry, request shaping and the embedding splice, sampler behaviour | no | CI + local |
| `Tools/static_gates.sh` | shell and python syntax, doc parity, fixture digests, manifest digests, planner gates, installer gates | no | CI |
| `Tools/sampler_gates.sh` | the sampler against a numpy reference, and the governor's branches | no | CI |
| `Tools/consumer_smoke.sh` | a package outside the repository can import and use the library | no | CI |
| `Tools/verify.sh` | the acceptance battery: provenance, goldens, byte-equality across cache sizes and live resizes, MTP, the memory promise, long context | **yes** | dev Mac |
| `Tools/api_robustness.sh` | Serving regressions against a live server | **yes** | dev Mac |
| `Tools/vision_ref.py` | the vision tower against an independent float32 implementation of the reference | tower only (0.9 GB) | dev Mac |
| `Tools/vision_serving.py` | every dialect with a real picture, against a live server | **yes** | dev Mac |
| `Tools/e2e_release.sh` | the installed release, end to end | **yes** | dev Mac, per release |

<a id="why-vision-needs-two-of-those"></a>

### Vision checks

A faulty image encoder can produce embeddings with the correct shape while
losing the image content. `Tools/vision_ref.py` compares the encoder with an
independent implementation. `Tools/vision_serving.py` checks the full request
path by requiring the model to identify the photograph's content.

The encoder comparison allows numerical variation from bfloat16 arithmetic.
The tolerance comes from comparing the reference at float32 and bfloat16;
slotstream must stay within that band. The two independent float32
implementations agree to 0.99996. These checks test implementation correctness,
not general vision accuracy.

## OpenAI agent integration

The `openai-conversation`, `openai-tool-output`, and `openai-context-budget`
catalogue checks cover request/history semantics, complete-call publication,
stream equivalence, and the separate default/maximum context budgets.

Against an already-running server, run `python3 Tools/openai_tools_gate.py
--output /tmp/openai-tools.jsonl`. This exercises the real model and HTTP/SSE
wire contract and saves every request and response. It supplies fixed tool
results after validating calls, without executing model-authored commands.
The [Hermes guide](HERMES.md) covers the real-client configuration and fixture
read. Run the ordinary API, gateway, and image gates when changing shared
serving code.

For an installed Hermes source checkout with its own environment:

```sh
/path/to/hermes/.venv/bin/python Tools/hermes_integration_gate.py \
  /path/to/hermes /tmp/hermes-slotstream-check --compress
```

This requires the larger context in the Hermes guide. It creates an isolated
Hermes home, denies non-loopback Python network connections, permits only the
fixture's `cat` command through the actual Hermes tool dispatcher, and checks
the real agent, title fallback, compaction, and recall. `--cli` checks the
actual CLI instead. Raw HTTP and result records stay in the output directory.
Add `--image Tools/assets/vision_test/secret1.jpg` to check Hermes's own vision
discovery and an actual image turn. The server must have enough memory for both
the configured context and the vision tower. The OpenAI gate's `--vision` option
also checks image tool calls and the advertised capability.

## Coverage

```bash
Tools/coverage.sh t0 t1 --lcov coverage.info
python3 Tools/coverage_ratchet.py coverage.info
```

`swift test --enable-code-coverage` is not available here, so the runner is
built with the profiling instrumentation directly and `llvm-cov` reads what it
wrote; the CLT ships `llvm-profdata` and `llvm-cov`, just not the test modules.

`Tools/coverage-floor.json` sets a minimum for each file. This catches a loss
of coverage in an existing file even if new code raises the overall
percentage. Use `--update` only for a deliberate change, with an explanation
in the commit.

<a id="where-the-coverage-is-not"></a>

### Initial coverage snapshot

The table below records the initial weights-free suite: 21.73% of 7,138
library lines, from 121 assertions. It is a historical snapshot, not a current
coverage report. Run the commands above for the current checkout.

| File | Lines | Covered | Why the rest is not |
|---|---|---|---|
| `Server.swift` | 1,132 | 6% | The socket loop and the request handlers. The framing, routing and CORS rules are split out and covered; the handlers still need an engine to answer with. |
| `WeightDownload.swift` | 642 | 0% | Historical coverage snapshot. The dedicated `Tools/slotpack/checks.py` gate now exercises real HTTP multi-chunk raw and compressed pulls, resume, corruption, fallback, cancellation, optional-file races, file safety, and manifest/codec bounds. |
| `Layers.swift`, `ExpertStore.swift`, `Engine.swift`, `Checkpoint.swift`, `Model.swift`, `NgramStore.swift`, `GatedDelta.swift` | ~2,900 | 0–3% | The model. These need a checkpoint. On the dev Mac they are covered by parity against the Python reference and by the byte-equality gates; a synthetic checkpoint would bring that to CI. |
| `Generate.swift` | 388 | 19% | The sampler is covered; the prefill and decode loops, and the sweep's admission and cache-cap hooks, run only with the model loaded. Gated by `sweep-check` and `Tools/verify.sh`. |
| `Governor.swift` | 213 | 27% | The policy is fully covered as a pure function. The live loop — poll, decide, lock, resize — still needs an engine to resize. |

The snapshot covers the weights-free runner. Tests against the real model,
such as `verify.sh` and `api_robustness.sh`, exercise additional paths locally;
those runs aren't included in this coverage percentage.

## Download transport gates

`Tools/static_gates.sh` runs `python3 Tools/slotpack/checks.py` without the
model. Its native harness compiles exact production sources into an immutable
per-run executable. The gate includes AddressSanitizer/UndefinedBehaviorSanitizer
codec checks, manifest identity and coverage, real HTTP fault injection, and
legacy raw multi-chunk compatibility. Receipts include source and binary hashes.

A new package also requires a full original-hash-checked offline build, an
independent public CDN reconstruction through the actual CLI default, and a
model-load smoke test before release. See [DOWNLOAD-FORMAT.md](DOWNLOAD-FORMAT.md)
for the producer, full-pull, and libFuzzer tools. Full transfer timings are
diagnostic unless the machine and network conditions qualify as a benchmark.

````

Applied delta `CLAUDE.md`:

````diff
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -116,9 +116,14 @@
    unless the large configuration is itself the measurement, and then nothing
    else heavy may be running.
 4. **Kill every test process the moment its test ends**, and confirm.
-5. `Tools/verify.sh` keeps every heavy gate between the 8.1 GB floor and a
-   10 GB target. Equality tests use small pools because their property is
-   size-independent; never restore a spare-RAM-driven large profile.
+5. `Tools/verify.sh` keeps ordinary equality gates between the 8.1 GB floor
+   and a 10 GB target. The full live-governor drill is an explicit exception:
+   unchanged shrink/grow deadbands require `--slots 1000 --max-memory-gb 13`,
+   with a 16 GB real reclaimable preflight, internal target-plus-3 GB checks,
+   sampled memory/swap evidence and no other heavy work. A skipped drill does
+   not pass acceptance. The full image/MTP diagnostic separately uses an
+   explicitly priced 12 GB target and a 15 GB preflight. Never use spare RAM
+   to enlarge an equality profile.
 6. The engine caps MLX's allocator cache at 2 GB (`Engine.swift`,
    `MLX.Memory.cacheLimit`). Do not remove it: without the cap a 10 GB-target
    server held 15.1 GB of real RSS (freed transients hoarded by the

````

Final source `/Users/carlos/Projects/slotstream/CLAUDE.md` — SHA-256 `9b82a054f8b135998664a1e7c41d8f7981753d9d6f2885d30739e20728b6fc91`.

````text
# slotstream — agent instructions

Qwen3.8-Flash-Next (125B + 51B n-gram, 4-bit, ~104 GB) on Macs via SSD-streamed
experts and a slot cache. Read [PLAN.md](PLAN.md) for design, [MEASUREMENTS.md](MEASUREMENTS.md)
for every measured number and its method, `Tools/verify.sh` for the acceptance
battery. Work lands directly on `main`.

## The brain (`db/`) — read before touching MEASUREMENTS.md or PLAN.md

`db/` is a public db.md store and the authority for what this project knows:
one record per MEASUREMENTS.md section (`db/records/measurements/`), one per
PLAN.md section (`db/records/design/`, `db/records/plan/`), plus every public
number as a claim, the decisions, the machines, and raw runs. **MEASUREMENTS.md
and PLAN.md are generated from those records by `Tools/projections.py`; never
edit them directly.** Edit the record, rerun the script, commit both. The
session loop is `dbmd spec` once, read `db/DB.md`, `dbmd log tail 20 --dir db`,
operate through `dbmd`, `dbmd validate --all db`, then `dbmd log`. The three
rules from `db/DB.md` that matter most here:

- **Capture before you transcribe.** Raw tool output lands in
  `db/sources/runs/` first; the measurement record links it.
- **Every public number is a claim.** A number on README, `docs/`, or
  `llms.txt` needs a `db/records/claims/` record whose `needle` appears on
  every surface it lists; `Tools/claims_gate.py` fails otherwise, and a
  superseded measurement moves its claims in the same change.
- **Never delete a superseded or withdrawn record.** Set its status and link
  the correction; the retraction is evidence.

`Tools/brain_gates.sh` runs all three checks (it needs `dbmd`;
`Tools/dbmd_install.sh` pins the version CI uses) and is part of
`Tools/static_gates.sh`.

## Generated files — regenerate in the commit that moves their source

Three files in the tree are projections, and CI fails on a commit that moves a
source without them:

| generated | from | regenerate with |
| --- | --- | --- |
| `llms-full.txt` | `README.md`, `docs/*.md`, `CHANGELOG.md` | `Tools/llms_full.sh` |
| `MEASUREMENTS.md` | `db/records/measurements/` | `Tools/projections.py` |
| `PLAN.md` | `db/records/design/`, `db/records/plan/` | `Tools/projections.py` |

`make docs` runs both; `Tools/llms_full.sh --sources` prints the doc list, which
lives nowhere else. **Never hand-edit a generated file** — edit the source and
rerun. `make hooks`, once per clone, installs `.githooks/pre-commit`, which
regenerates them and stages the result with the commit; a six-line README FAQ
that landed without the regenerate on 2026-09-03 is why it exists.

## Claims and measurement discipline (mistakes made 2026-08-29/30)

Every rule here is one this project already got wrong. They share a root:
**asserting from a document instead of checking the system.**

- **Before calling something blocked, check whether the repo already does it.**
  Four docs said closing the prefill gap "needs a Metal kernel, which needs
  Xcode", for two releases — while `GatedDelta.swift` shipped a JIT-compiled
  custom kernel as its fast path. The blocker was read off the risk register,
  which is about a *different* thing (mlx-swift's bundled shader library), and
  never tested. One `xcrun`, one four-line kernel, and it collapsed. A blocker
  that has never been reproduced is a rumour.
- **An estimator may not return a value outside the range it measured.** The
  decode curve extrapolated to 20 tok/s at 181/layer and over-promised 25 to
  45% through its own middle. Worse: immediately after fixing that, the prefill
  ladder was left returning 125 tok/s for chunk 4096, which nothing had
  measured. Cap at the last verified point, or measure a *ratio* at a config
  that fits and say so. Under-promising is the correct failure direction for a
  planner.
- **Re-anchoring a curve invalidates every number derived from it.** Fixing
  only the row in front of you produces contradictions readers will trust: the
  README's tier table ended up claiming a 32 GB Mac is faster than a 48 GB one.
  Regenerate the whole family — and prefer generating tables *from the tool*
  (`doctor --sim-ram N`) so they cannot drift from the code again.
- **A failing test is a bug in the test until proven otherwise.** Three "product
  failures" in one run were nested python-inside-shell quoting mangling the
  JSON; another two were a hardcoded version literal reporting a release bump as
  a regression. Reproduce by hand before believing a failure, and never pin a
  value a release will change.
- **`set -e` makes cleanup lethal.** `wait $PID` returns 143 after a `kill` and
  silently truncated the whole battery — it looked like a hang. Always
  `kill ... || true; wait ... || true`, or use a `trap ... EXIT` like
  `api_robustness.sh` does.
- **Benchmarks on a loaded machine are noise.** Single runs here vary 15%+, and
  one pair read 137.6 against 90.7 for the same config. Check reclaimable
  memory first, interleave A/B rounds, and discard anything measured while the
  machine is swapping. Report medians of paired rounds, never a best-of.
- **Explicit knobs bypass the safety clamp — that is their purpose, and it
  makes them dangerous.** `--experts-per-layer 181` is never resized by the
  availability clamp, and forcing it against 26.6 GB reclaimable drove the
  machine to 158 MB free and 13 GB of swap. `Planner.availabilityOverride` is
  worse: simulating 60 GB free made the governor allocate a *real* 25.4 GB pool
  and pushed swap to 39 GB. Bound both by `deviceAvailableGB()` before use.
- **Kill your own background waiters.** A poll loop watching a log that would
  never get its line sat in the task list for six hours looking like live work,
  and the "nothing is running" check missed it because it grepped for expected
  process names. Check the task list, not your assumptions about it.

## Memory safety — READ BEFORE RUNNING ANYTHING (incident 2026-08-28)

This Mac has **48 GB of unified memory shared with Carlos's live apps and
session**. On 2026-08-28 a session stacked test processes — a ~31.5 GB soak
server, a second test server, a browser pane, and builds — overcommitted the
machine and **crashed the whole system**. Every model process here is
multi-GB. These rules are mandatory:

1. **One model process at a time.** Never two servers; never `serve` plus a
   `run`/`elastic-check` concurrently. The binary now enforces this with a
   per-user file lock before model allocation. Still inspect `pgrep -fl
   slotstream` before heavy work; do not kill a process owned by another task
   without coordinating with its owner.
2. **Check reclaimable memory before every heavy step** (model launch, big
   build, verify run). Reclaimable = `vm_stat` free + purgeable + file-backed
   pages; `slotstream doctor` prints it as "reclaimable now". If what you are
   about to start does not fit with several GB to spare, do not start it.
3. **Tests use small explicit sizes** — `--memory-gb 8.1`..`10` — never auto,
   unless the large configuration is itself the measurement, and then nothing
   else heavy may be running.
4. **Kill every test process the moment its test ends**, and confirm.
5. `Tools/verify.sh` keeps ordinary equality gates between the 8.1 GB floor
   and a 10 GB target. The full live-governor drill is an explicit exception:
   unchanged shrink/grow deadbands require `--slots 1000 --max-memory-gb 13`,
   with a 16 GB real reclaimable preflight, internal target-plus-3 GB checks,
   sampled memory/swap evidence and no other heavy work. A skipped drill does
   not pass acceptance. The full image/MTP diagnostic separately uses an
   explicitly priced 12 GB target and a 15 GB preflight. Never use spare RAM
   to enlarge an equality profile.
6. The engine caps MLX's allocator cache at 2 GB (`Engine.swift`,
   `MLX.Memory.cacheLimit`). Do not remove it: without the cap a 10 GB-target
   server held 15.1 GB of real RSS (freed transients hoarded by the
   allocator); with it, 6.0 GB flat at identical speed. `GenStats.peakMemoryGB`
   and the verification gate now use the Mach/getrusage process RSS high-water;
   the MLX-only peak is diagnostic only.
7. **No memory-hog stress experiments without Carlos's explicit go.** The
   2026-08-28 hog experiments are done and documented in MEASUREMENTS.md;
   never rerun them casually.
8. The elastic governor protects **one auto-sized instance** against the rest
   of the system. It cannot protect against deliberately stacked processes —
   that protection is these rules, i.e. you.

## Weight download

Fresh pulls use Slotpack v1: a fully hash-pinned, lossless compressed package
in a dedicated R2 bucket behind `weights.sevra.page`. Small immutable objects
fit ordinary CDN caching; the earlier advice against hosting raw multi-GB
shards on that cache does not apply to this layout. Preserve original model
bytes, pinned hashes, range coverage, and all decoder bounds. The canonical
format and release qualification are in `docs/DOWNLOAD-FORMAT.md`.

Download, bounded parallel decoding, and writes overlap. Every network worker
owns its URLSession so HTTP/2 streams do not collapse the intended independent
connections. Automatic mode starts at eight and trials increases only while
measured throughput improves; explicit counts stay fixed. CDN cache status
and actual connection observations are logged. Do not infer a speed guarantee
from byte reduction or extrapolate an unmeasured multi-gigabit connection.

Keep compressed-object, decoded-chunk, and final original-file SHA-256 checks.
Resume bits follow synced writes; final paths appear only after whole-file
verification. Cancellation drains workers. A directory lock rejects competing
writers. Optional failures wait for outstanding writes before cleanup. Run
`Tools/slotpack/checks.py` after transport changes, and qualify any new package
with an independent complete public CLI pull before enabling it in a release.

The raw downloader remains the explicit compatibility path and preserves old
`.partmap` resumes. `SLOTSTREAM_WEIGHTS_SOURCES` still selects raw sources in
automatic mode. Raw fallback inside a compressed pull uses bounded original
ranges and cached signed redirects. The Linux bandwidth harness compiles the
same production sources; it is a test instrument, not a Linux inference port.

## Serving invariants (learned the hard way)

These were all real bugs found by adversarial probing. Each is now gated by
`Tools/api_robustness.sh`; do not "simplify" any of them away.

- **SIGPIPE must stay ignored.** `Server.run` sets `signal(SIGPIPE, SIG_IGN)`
  and each accepted socket gets `SO_NOSIGPIPE`. Without it a client closing a
  tab mid-stream kills the whole daemon, and every `alive`/`send -> Bool` check
  in the handlers is dead code because `write` can never return `-1`.
- **Every sampling knob goes through `SampleParams.sanitized()`.** Clients send
  Ollama's documented defaults `seed: -1` and `num_predict: -1`; `UInt64(-1)`
  and `0 ..< -1` both trap and take the process with them. Out-of-range
  `top_p`/`min_p` used to empty the candidate set and turn `probs/probs.sum()`
  into NaN, after which the sampler emitted token 0 forever.
- **Never normalize the sampling probabilities.** The draw is scaled by the
  unnormalized CDF total instead. That removes the 0/0 and, since `u < 1`,
  guarantees the pick lands on a token with actual mass.
- **Incremental detokenization is bounded and scalar-safe.** Qwen's ByteLevel
  decoder is run over small stable token groups while incomplete UTF-8 bytes
  and stop-sequence prefixes remain buffered. Non-streaming requests do one
  final decode only; never restore full-prefix decoding after every token.
- **The pass shrinks as the context grows, and the bound is measured, not
  chosen.** `PrefillSchedule.chunk(at:maxChunk:)` halves the pass until
  pass × context is under 4096 × 8016, the largest query-by-key product any
  prefill measurement covered, because the sparse-attention layers score every
  query of the pass against every key of the context (a chunk × context
  transient the pool math never modelled). Every `--memory-gb` peak number
  in MEASUREMENTS.md comes from prompts of at most 7,960 tokens; do not raise
  `measuredQueryKeyProduct` or `ContextPolicy.maxTokens` without a
  `context-check` measurement recorded in MEASUREMENTS.md, and never quote a
  context number the tool did not print (`doctor`, `prefill-schedule`).
- **Prompt plus completion is capped (`--max-context`, default 32,768).** The
  planner charges a full active context, and `Engine.generate` clamps new
  tokens to the remaining room. If you raise the cap, update the memory model
  and re-measure process RSS.
- **A metadata endpoint must never take the generation lock.** `/api/tags` and
  `/api/ps` want pool numbers, and reading them through `withExclusive` made
  both block for the whole of a running request. Worse, the accept loop waited
  on the connection semaphore, so enough blocked metadata calls stopped the
  process answering anything — a client polling either endpoint could not tell
  a generating server from a crashed one. `Engine.publishPoolSnapshot`
  republishes under its own lock at every resize; the endpoints read that.
- **The accept loop must never block.** `connSlots.wait()` on the accept thread
  turned a full connection pool into a dead server. It takes the slot with a
  zero timeout now and answers 503 when there is none.
- **JSON `null` means "not set".** The OpenAI client serializes an unset
  `max_tokens` as null and the Ollama CLI sends a null `options`; treating
  either as a present-but-wrong value turned a stock default request into a
  400. `Server.withoutNulls` strips them before validation.
- **A no-op value is not a feature request.** Refusing `n: 1` or
  `frequency_penalty: 0` broke stock SDKs while protecting nothing: those name
  the behaviour this server already has. Accept the exact default, refuse every
  other value. This does not license accepting a knob that would change the
  reply — Ollama `num_ctx` and `repeat_penalty` are still refused, never dropped.
  The OpenAI adapter accepts a bounded `options.num_ctx` and enforces that
  per-request limit; `Tools/openai_tools_gate.py` checks it.
- **An unseeded request gets its seed at the API boundary.** `Sampler`'s own
  default is a constant, so an unseeded request replayed one fixed stream from
  process start while the docs promised otherwise. The draw lives in
  `Server.sampleParams` and `v1Chat`, never in `Sampler`, so every offline gate
  stays deterministic.
- **Reasoning goes in `thinking`, never in the answer.** `ThinkSplitter` routes
  everything before `</think>` to `message.thinking` in both streamed and
  non-streamed replies, withholding the last few characters so a tag split
  across two deltas is never emitted as text.
- **The incremental decoder holds back as little as it can.** Eight tokens
  before the first flush and four after it meant one delta per four tokens, and
  no streaming at all below eight. Byte-exactness rests on the U+FFFD check,
  not on the size of the backlog.
- **`Geometry` constants are checked against config.json** in
  `Qwen4ExpModel.validate`. The planner sizes memory from the constants while
  the engine allocates from the config; if they drift, every memory number the
  user sees is wrong.

- **The Ollama CLI's wire format is a gate, not an assumption.** Its
  `ShowRequest` serializes every field, so `ollama run` opens `/api/show`
  with empty `name`/`system`/`template`/`options`, its one-shot mode uses
  `/api/generate` with empty `suffix`/`system`/`template`, its interactive
  mode opens with Ollama's documented "load" request (an empty prompt,
  answered `done_reason: "load"` without touching the engine), and its chat
  can carry `keep_alive` and `options: null`. 0.1.8's strict validator rejected them
  and the CLI could not start; nothing noticed for two releases because the
  claim lived in PLAN.md, not in a test (found 2026-09-01). Accept the
  deprecated `name` alias, empty overrides, `keep_alive`, and null `options`;
  keep refusing unknown fields and non-empty overrides. `api_robustness.sh`
  gates the CLI's exact request shapes; a client claim in the README needs a
  gate like it.

## Conversation prefix cache

- **A reused state is extend-only and can never be rewound.** `LinearCache`
  holds the GDN recurrent state, a fold over every token with no inverse, and
  `ngramCtx` is carried forward the same way. So reuse requires
  `prompt.starts(with: heldIds)` and `prompt.count > heldIds.count`; anything
  else is a full rebuild. Do not add "partial rewind" or longest-common-prefix
  matching — there is nothing to rewind to.
- **The held id list is tracked, never inferred.** A token is sampled *before*
  it is fed, so both break paths in the decode loop leave the last token
  unconsumed. `Generator.generate` records exactly what the state consumed; a
  caller that recomputes this from the returned ids will be off by one and the
  next request will silently reuse a state that does not match its prompt.
- **A miss must evict before the caller allocates.** Four conversations may be
  retained, so `PrefixCache.take` evicts LRU entries until retained + active
  states fit both the four-state and shared-token ceilings. Each state has
  ~113 MB of fixed GDN memory in addition to ~27 KiB/token; both are charged.
- **Do not gate this on byte-equality with a cold rebuild — it will never
  pass.** Reuse re-batches the same tokens, MLX picks reduction orders by shape,
  and floating point is not associative: swept over a 64-token sequence, all 63
  split points differ. §6.1's "streaming is math-invisible" is about the expert
  pool, where hit and miss deliver identical bytes. The gate is
  `slotstream prefix-check`: reuse must perturb logits no more than re-chunking
  a plain prefill already does (measured 4.37% vs 5.90% of logit spread), stay
  flat with depth, be deterministic run to run, and actually be reusing.
  Corollary worth knowing: the existing byte-identical-across-chunk-sizes result
  is luckier than it reads — the logit deltas are several percent either way and
  the text matches because top-1 usually survives.
- **The governor sheds it before shrinking the pool.** One re-prefill is a
  cheaper give-back than a starved cache, which taxes every token after it.
- **It holds four conversations, and must not be reduced to one.** A single slot
  passed every synthetic test and then scored 0 hits / 7 misses against Open
  WebUI, whose title-generation request lands between turns and evicted the chat
  every time. Any client that decorates a conversation (titles, tags,
  suggestions) breaks a one-slot cache. Because several held states are
  additive, the retention ceiling is charged against the memory budget.

## Prefill

Each of these cost a measured experiment. Do not re-derive them, and do not
revert the constants to their older values — two of those older values are
still quoted in commit history and both are wrong.

- **A pass of 256 tokens or more is a sweep, never a pool load** (`MoELayer.sweep`,
  `SweepTuning.minTokens`). Rows are sorted by expert, the layer's experts go
  through staging groups of 32 — resident ones copied out of the pool, the rest
  read from the checkpoint in contiguous runs — and each group is one grouped
  GEMM per projection with `sortedIndices: true`. That flag is the whole
  point: it is what reaches MLX's `gather_qmm_rhs` kernel, which reads an
  expert's weights once per tile of tokens instead of once per token. The old
  per-(token, expert) gather over the pool never could, and re-read every
  expert about forty times per 2048-token pass. Measured on 0.2.2's code: an
  8k prompt at a 16 GB target went 91 → 184 tok/s (three interleaved rounds),
  prose 66 → 107, the 8.1 GB floor 51 → 88.
- **The kernel a row meets must depend on the routing alone.** MLX takes the
  grouped kernel only when a call has at least 16 rows and four per expert of
  the weight array it is handed. With the pool as that array the rule would
  have switched kernels with the cache size, so the sweep hands it a group of
  at most 32 experts and pads a short group up to the rule. This is what keeps
  the golden-equivalence invariant (§6: pool size and contents never change
  the math); `sweep-check` proves the sweep bit-identical on a cold pool and
  on one holding 638 of the prompt's experts. Do not let a group's composition
  depend on residency in a way that changes row counts per call, and do not
  drop the padding.
- **The sweep never writes the pool.** That is the scan resistance PLAN §3.3
  asked for: a long prompt cannot evict what decode was using. Only the final
  pass admits, and only each layer's fair share of the pool by frequency
  (`SlotPool.admit`, `admitOnSweep` set by the generator). Resident groups go
  first within a layer, so admission can never evict a resident expert that
  layer has not copied yet.
- **The sweep is read-bound, not compute-bound, and the GPU is idle waiting
  for reads.** `SLOTSTREAM_SWEEP_TRACE=1` on the 8k prompt at 16 GB: reads 22 s,
  waiting for the GPU 1.6 s, everything else 20 s. Reads run at 11–13 GB/s
  against the SSD's 17.3 on 2.7 MB records; queue depth 12 stays right (4 loses
  a third, 32 gains nothing). What is left is serial: the router, attention,
  and the layer tail run while no read is outstanding, because the next layer's
  experts are unknown until its router runs.
- **Prose costs more than repeated text, and the n-gram rows were why.** A
  token needs sixteen ~100 B rows, three `pread`s each at ~55 µs SSD latency;
  fetched one at a time on the calling thread, a 10k-token prompt of ordinary
  prose spent ~35 s there (in the old path and the sweep alike), while the
  acceptance prompt's repeated sentences hid it behind the row cache. The rows
  of a pass are known from its ids, so `NgramStore.prefetch` reads every
  missing row on 32 lanes before the embedding is assembled. Do not go back to
  one row at a time.
- **The pass size is part of the memory plan, not a constant.** A pass touches
  nearly every expert of every layer, so a bigger pass is strictly faster and
  strictly more memory-hungry. Measured at a matched pool of 60/layer with the
  sweep: 88 → 128 → 169 → 211 → 222 tok/s from 256 → 4096. Output is inside the
  prefill-rechunk band at every size (the `prefix-check` method); it is not
  byte-identical, and the docs must not say it is.
- **`prefillCostGB` charges ~1.30 MB per chunk token, linear from zero.**
  It previously charged `(chunk - 256) x 1.8 MB`, which conflated two different
  things — pass activations, which scale with the chunk, and KV plus indexer
  state, which scales with the *context* — and so overcharged a big pass by 2x
  and kept the planner one size below the best available. Measured directly:
  1024 → 1.30 GB, 2048 → 2.19, 4096 → 4.30. Context state is separate and
  small: 4k → 8k tokens moved peak by 0.1 GB. **Do not restore the 1.8 figure.**
- **`prefillChunkFor` takes at most a quarter of the pool budget**, raised from
  a fifth once the cost above was honest. The deciding experiment held total
  memory fixed and traded pool for pass size: 2048 dominated 1024 on every axis
  — faster prefill, faster decode, *lower* peak.
- **Staging is bounded at 32 records** (`SLOTSTREAM_EXPERT_LOAD_BATCH`), the
  sweep's group size and the pool path's load slice. A 256-token layer can
  route all 512 experts; loading them as one 1.415 GB record batch made a
  `--memory-gb 10` long prompt peak at 12.4 GB in 0.1.x. The sweep keeps at most
  two groups alive and caps MLX's buffer cache while a prompt is read
  (`SLOTSTREAM_PREFILL_CACHE_MB`), because its varying array sizes otherwise
  fill the whole 2 GB cache. Re-run the real process-RSS gate before touching
  either.
- **Cross-layer read-ahead does not work here as a background thread.** It was
  built, measured slower in every paired run, and removed (2026-08-30). The
  sweep overlaps reads with the GPU inside a layer instead, on the main thread,
  which is a different thing. Reading layer L+1's experts during layer L is
  still the one lever left for the serial part above, and it costs a layer of
  staging; measure before building it.
- **That is NOT blocked on Xcode, despite what the risk register implies.**
  The register's entry is about building *mlx-swift's own bundled shader
  library* from source, which is worked around by vendoring `mlx.metallib`.
  Writing a **new** kernel is a different thing: `MLXFast.metalKernel` JIT-
  compiles Metal source at runtime through the Metal framework, needing no
  offline toolchain. This repo already does it — `GatedDelta.swift` builds the
  gated-DeltaNet kernel that way and it is the shipped fast path. The grouped
  GEMM turned out not to need one: MLX ships it, behind a sorted-index flag.

## Sampler and governor

- **The sampler has a numpy oracle.** `Tools/sampler_ref.py` must stay in step
  with `Sampler.next`; both build logits from the same splitmix64 stream using
  only exactly representable float operations, so the comparison is exact.
  Changing the sampler means changing both.
- **The governor's policy is a pure function on purpose.** `GovernorPolicy.decide`
  is tested through all its branches by `governor-check` with no model loaded.
  Do not fold the policy back into the daemon: the alternative test is putting
  this machine under real memory pressure, which is exactly what the memory
  safety rules forbid. Note the invariant it asserts — the decision depends on
  (available + pool), never on either alone, which is why `desiredSlots` credits
  what a restart would release.
- **`elastic-drill` covers the wiring the policy test cannot**: poll, decide,
  take the generation lock, resize, log. It uses `Planner.availabilityOverride`,
  which **does not make the allocation imaginary** — simulating 60 GB free on a
  machine with 7 GB made the governor take a real 25.4 GB pool and drove swap
  from 13 to 39 GB. Anything using that seam must bound the simulated value by
  `deviceAvailableGB()`.
- **Warm decode estimates are measured, not extrapolated.** 6.0 / 8.2 / 11.2 /
  11.6 tok/s at 30 / 60 / 120 / 150 experts per layer, flat by 120. An older
  20.0 at 181/layer has never reproduced; the estimator holds flat above the
  verified points rather than extrapolating to it.
- **A speculative rejection rolls back, it never re-runs.** The verify pass
  records the linear layers' state after every position (`LinearCache.record`;
  the GDN recurrence stepped per token, which `mtp-check` proves bit-identical
  to the fused kernel), and `State.rollback(keeping:of:from:ngramWindow:)`
  swaps to the recorded state, trims the attention caches, and rebuilds the
  n-gram context from ids. Re-running the kept tokens cost most of a pass on
  most rounds and was the single largest avoidable cost in speculation
  (MEASUREMENTS M9). Do not reintroduce a rebuild; extend the recording.
- **Speculative decode's multiplier is a measured ratio per cache size and
  depth.** `mtp-bench` on 0.2.0 (four drafts) read ×0.55 / 0.69 / 0.88 / 0.96
  at 20 / 29 / 42 / 57 experts per layer and ×0.88 at 122, all below
  break-even; depths 1 and 2 read ×1.13 / ×1.12 at 57 and ×1.17 / ×1.13 at
  122, the size auto enables the head at, which is why the default is 1 and
  the 120/layer floor stands; with the rebuild eliminated depth 1 reads
  ×1.20 at 57 and ×1.24 at 122 (×1.18 sampled). The "×1.5–1.9" once written here assumed a
  five-token verify pass costs one token's pass; `mtp-passcost` measured
  1.65 with every expert resident (a sixth of a pass per extra token), so
  the ceiling is ×1.4 at depth 1 and the estimate is withdrawn. Quote the
  ladder and the ceiling, never the launch-bound arithmetic.

## Repo facts

- Model weights: `models/qwen38-flash-next-mlx-4bit/` (97 GB, gitignored),
  pinned `pipenetwork` revision; `slotstream pull --verify` re-checks all
  hashes in ~14 s and is a verify.sh gate.
- Parity goldens must be generated under **mlx 0.31.1** (`.venv31`,
  `Tools/parity_ref.py`) — mlx-swift vendors 0.31.x and 0.32.x kernels differ
  measurably. Never regenerate goldens under a newer mlx.
- SwiftPM cannot compile Metal shaders with CLT only: the Makefile colocates
  the prebuilt `mlx.metallib` next to the binary. `swift test` is unavailable
  (no XCTest in CLT) — `Tools/verify.sh` is the acceptance suite.
- The sandbox proxies localhost HTTP clients (curl/urllib): test the server
  with `nc` raw sockets, or the app's Browser pane (which reaches localhost).
- Launch background servers with `(nohup ... &)` subshells; TaskStop kills
  whole process groups.
- Distribution: `install.sh` (repo root) is the public one-line installer; it
  fetches the latest release asset `slotstream-arm64.tar.gz` (binary +
  `mlx.metallib`, plus a `.sha256` file) into `~/.slotstream/bin`. **Cutting a
  release**: bump `version` in `Sources/SlotstreamCore/Version.swift` (moved
  there in 0.1.5; it is the single source for `--version`, `/api/version` and
  the CI tag check) to match the tag, commit, then
  `git tag vX.Y.Z && git push origin vX.Y.Z` —
  `.github/workflows/release.yml` builds on a macos-15 runner, fails unless
  `--version` equals the tag, packages, attests provenance
  (`gh attestation verify <asset> --repo carloslfu/slotstream`), and
  publishes. Never build release assets locally except as a documented
  emergency fallback. Asset names are stable (the installer uses
  `releases/latest/download/`), so never rename them. The tarball's metallib
  is the macOS 26 build (CI pins it via `SLOTSTREAM_METALLIB_MACOS=26`);
  `install.sh` swaps in the macOS 14/15 builds from pinned mlx-metal wheels —
  when bumping the MLX version, update those wheel URLs + sha256s alongside
  `Tools/fetch_metallib.sh`. raw.githubusercontent caches `install.sh` for
  ~5 minutes after a push.

````

Applied delta `Sources/slotstream-cli/MTPCommands.swift`:

````diff
--- a/Sources/slotstream-cli/MTPCommands.swift
+++ b/Sources/slotstream-cli/MTPCommands.swift
@@ -107,13 +107,12 @@
 
     func run() throws {
         guard depth >= 1, depth <= 8 else { throw ValidationError("--depth must be 1...8") }
-        let plan = try model.announcedPlan()
+        let plan = try model.announcedPlan(requireMTP: true)
         let sem = DispatchSemaphore(value: 0)
         var result: Result<Void, Error> = .success(())
         Task {
             do {
                 let engine = try await Engine(modelDir: model.modelURL, plan: plan)
-                try engine.model.enableMTP(modelDir: model.modelURL)
                 var traces: [GreedyTrace] = []
                 for (i, prompt) in mtpProbePrompts.enumerated() {
                     let ids = try engine.encodeChat(
@@ -302,13 +301,12 @@
     @Option(help: "Seed for --sample") var seed: UInt64 = 1
 
     func run() throws {
-        let plan = try model.announcedPlan()
+        let plan = try model.announcedPlan(requireMTP: true)
         let sem = DispatchSemaphore(value: 0)
         var result: Result<Void, Error> = .success(())
         Task {
             do {
                 let engine = try await Engine(modelDir: model.modelURL, plan: plan)
-                try engine.model.enableMTP(modelDir: model.modelURL)
                 var params = sample ? SampleParams() : SampleParams.greedy
                 if sample { params.seed = seed }
                 params.maxTokens = maxTokens
@@ -375,13 +373,47 @@
 
 
     func run() throws {
-        let plan = try model.announcedPlan()
+        let plan = try model.announcedPlan(requireMTP: true)
         let sem = DispatchSemaphore(value: 0)
         var result: Result<Void, Error> = .success(())
         Task {
             do {
+                let observation = FootprintSampler()
+                let vmBefore = ProcessMemory.vmActivity()
+                let memoryTarget = plan.targetGB ?? plan.expectedPeakGB
+                var memoryValidated = false
+                var finalObservation: (sample: FootprintSampler.Result, vm: ProcessMemory.VMActivity?, physical: UInt64, rss: UInt64)?
+                defer {
+                    let observed = finalObservation ?? (sample: observation.finish(), vm: ProcessMemory.vmActivity(),
+                        physical: ProcessMemory.residentBytes(), rss: ProcessMemory.lifetimeRSSPeakBytes())
+                    let report: [String: Any] = [
+                        "memory_validated": memoryValidated, "target_gb": memoryTarget,
+                        "sampled_peak_bytes": observed.sample.peakBytes, "samples": observed.sample.samples,
+                        "physical_footprint_end_bytes": observed.physical, "lifetime_rss_peak_bytes": observed.rss,
+                        "swapins_before": vmBefore.map { $0.swapins as Any } ?? NSNull(),
+                        "swapins_after": observed.vm.map { $0.swapins as Any } ?? NSNull(),
+                        "swapouts_before": vmBefore.map { $0.swapouts as Any } ?? NSNull(),
+                        "swapouts_after": observed.vm.map { $0.swapouts as Any } ?? NSNull(),
+                    ]
+                    if let data = try? JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]) {
+                        print("MTP CHECK MEMORY " + String(decoding: data, as: UTF8.self))
+                    }
+                }
+                func memoryGuard() throws {
+                    guard let current = ProcessMemory.vmActivity(), let before = vmBefore,
+                          current.swapins == before.swapins, current.swapouts == before.swapouts,
+                          Double(current.reclaimableBytes) >= 3e9 else {
+                        throw ModelError("MTP check lost real headroom, has unavailable observations or observed swap")
+                    }
+                    let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
+                    guard physical > 0, rss > 0, Double(max(physical, rss)) <= memoryTarget * 1e9 else {
+                        throw ModelError("MTP check memory observations are unavailable or exceed the planned target")
+                    }
+                }
+                try memoryGuard()
                 let engine = try await Engine(modelDir: model.modelURL, plan: plan)
-                try engine.model.enableMTP(modelDir: model.modelURL)
+                engine.generator.footprintSampling = true
+                try memoryGuard()
                 var failures: [String] = []
                 func check(_ name: String, _ ok: Bool) {
                     print(ok ? "PASS  \(name)" : "FAIL  \(name)")
@@ -389,14 +421,29 @@
                 }
                 var params = SampleParams.greedy
                 params.maxTokens = maxTokens
+
+                func checkedGeneration(_ ids: [Int], vision: VisionPrompt? = nil) throws -> ([Int], GenStats) {
+                    try memoryGuard()
+                    var interrupted: Error?
+                    let generated = engine.generate(promptIds: ids, params: params, vision: vision, shouldContinue: {
+                        do { try memoryGuard(); return true }
+                        catch { interrupted = error; return false }
+                    })
+                    if let interrupted { throw interrupted }
+                    guard generated.stats.runtimeError == nil, generated.stats.requestFailure == nil else {
+                        throw ModelError("MTP check generation failed its Engine request guard")
+                    }
+                    try memoryGuard()
+                    return (generated.ids, generated.stats)
+                }
 
                 func gen(_ prompt: String, spec: Bool) throws -> ([Int], GenStats) {
                     engine.generator.speculationEnabled = spec
                     defer { engine.generator.speculationEnabled = true }
                     let ids = try engine.encodeChat(
                         [ChatMessage(role: "user", content: prompt)], thinking: false)
-                    return engine.generator.generate(
-                        promptIds: ids, params: params, eosIds: engine.eosIds)
+                    engine.dropPrefixCache()
+                    return try checkedGeneration(ids)
                 }
 
                 var acceptTotal = 0
@@ -424,7 +471,14 @@
                 // the text prompts above (spec, spec, plain) so determinism,
                 // "speculation actually ran" and the shared-prefix report all
                 // apply. Skips when the repo asset image is not in reach.
-                let visionAsset = (try? VisionAssets.resolve(image)).map { URL(fileURLWithPath: $0) }
+                let visionMode = try model.visionMode()
+                let visionAsset: URL?
+                if visionMode == .off { visionAsset = nil }
+                else if visionMode == .on || image != nil {
+                    visionAsset = URL(fileURLWithPath: try VisionAssets.resolve(image))
+                } else {
+                    visionAsset = (try? VisionAssets.resolve(image)).map { URL(fileURLWithPath: $0) }
+                }
                 if let img = visionAsset {
                     do {
                         let base64 = try Data(contentsOf: img).base64EncodedString()
@@ -456,9 +510,8 @@
                         {
                             engine.generator.speculationEnabled = spec
                             defer { engine.generator.speculationEnabled = true }
-                            return engine.generator.generate(
-                                promptIds: ids, params: params, eosIds: engine.eosIds,
-                                vision: vision)
+                            engine.dropPrefixCache()
+                            return try checkedGeneration(ids, vision: vision)
                         }
                         let (a, sa) = try genVision(ids, vision, spec: true)
                         let (b, _) = try genVision(ids, vision, spec: true)
@@ -477,7 +530,7 @@
                     }
                 } else {
                     print(
-                        "SKIP vision+mtp leg (no Tools/assets/vision_test image in reach; "
+                        "SKIP vision+mtp leg (vision disabled or no Tools/assets/vision_test image in reach; "
                             + "pass --image to force one)")
                 }
                 let rate = draftTotal > 0 ? Double(acceptTotal) / Double(draftTotal) : 0
@@ -576,9 +629,7 @@
                 let q = "Name three primary colors."
                 let ids1 = try engine.encodeChat(
                     [ChatMessage(role: "user", content: q)], thinking: false)
-                let (o1, s1) = engine.generator.generate(
-                    promptIds: ids1, params: params, eosIds: engine.eosIds,
-                    cache: engine.prefixCache)
+                let (o1, s1) = try checkedGeneration(ids1)
                 let cont = engine.tokenizer.encode(text: "\n\nThe capital of France is")
                 let ids2 = ids1 + o1 + cont
                 let hit = engine.prefixCache.take(matching: ids2, reserveTokens: ids2.count + 8)
@@ -601,6 +652,15 @@
                 }
                 check("turn-1 speculation ran", s1.verifyPasses > 0)
 
+                let sample = observation.finish()
+                let vmAfter = ProcessMemory.vmActivity()
+                let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
+                finalObservation = (sample, vmAfter, physical, rss)
+                memoryValidated = sample.samples > 0 && sample.peakBytes > 0 && physical > 0 && rss > 0
+                    && Double(max(sample.peakBytes, max(physical, rss))) <= memoryTarget * 1e9
+                    && vmBefore != nil && vmAfter != nil && vmBefore?.swapins == vmAfter?.swapins
+                    && vmBefore?.swapouts == vmAfter?.swapouts
+                check("whole MTP check memory interval fits the priced target without swap", memoryValidated)
                 print(failures.isEmpty ? "MTP CHECK PASS" : "MTP CHECK FAIL: \(failures.joined(separator: ", "))")
                 if !failures.isEmpty { throw ExitCode(2) }
                 result = .success(())
@@ -634,13 +694,12 @@
     @Option var prompt: String = "Explain how a transistor works, in about 300 words."
 
     func run() throws {
-        let plan = try model.announcedPlan()
+        let plan = try model.announcedPlan(requireMTP: true)
         let sem = DispatchSemaphore(value: 0)
         var result: Result<Void, Error> = .success(())
         Task {
             do {
                 let engine = try await Engine(modelDir: model.modelURL, plan: plan)
-                try engine.model.enableMTP(modelDir: model.modelURL)
                 let m = engine.model
                 guard let head = m.mtpHead else { throw ModelError("draft head not loaded") }
                 var params = SampleParams.greedy

````

Final source `/Users/carlos/Projects/slotstream/Sources/slotstream-cli/MTPCommands.swift` — SHA-256 `b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b`.

````text
// MTP (speculative decode) commands: parity against the Python reference,
// the accept-rate probe that decides whether speculation pays, and the
// standing correctness gate.

import ArgumentParser
import Foundation
import MLX
import Slotstream

// MARK: mtp-parity

/// Compare the Swift MTP head against the MLX Python reference on the stored
/// fixture (Tools/reference/make_mtp_fixture.py): a 5-token prefill step and
/// a cached 1-token decode step, same quantized weights on both sides. The
/// tolerance is the layer-parity bar — the two frameworks pick different
/// kernels, so deep sums drift ulps, never structure.
struct MTPParity: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-parity",
        abstract: "Compare the MTP draft head against the Python reference fixture")
    @OptionGroup var model: ModelOptions
    @Option(help: "Fixture from Tools/reference/make_mtp_fixture.py")
    var fixture: String = "Tools/reference/fixtures/mtp_parity.safetensors"
    @Option(help: "Write per-stage dumps here (debug)") var dump: String?

    func run() throws {
        let cfg = try ModelConfig.load(from: model.modelURL)
        let head = MTPHead(try MTPWeights(modelDir: model.modelURL, config: cfg))
        if let dir = dump {
            try FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
            var step = 0
            head.debugSink = { name, arr in
                let v = arr.asType(.float32).asArray(Float.self)
                let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
                try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent("s\(step)_\(name).bin"))
                if name == "moeOut" { step += 1 }
            }
        }
        let fx = try loadArrays(url: URL(fileURLWithPath: fixture))
        func need(_ k: String) throws -> MLXArray {
            guard let a = fx[k] else { throw ValidationError("fixture is missing \(k)") }
            return a
        }
        let rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)
        let state = MTPState()
        let (out1, multi1) = head(
            embedded: try need("embedded"), hiddenMulti: try need("hidden"),
            rope: rope, state: state)
        let (out2, multi2) = head(
            embedded: try need("embedded2"), hiddenMulti: try need("hidden2"),
            rope: rope, state: state)
        eval(out1, multi1, out2, multi2)
        let entries = (try need("embedded")).dim(1) + 1
        guard state.offset == entries else {
            throw ValidationError("cache offset \(state.offset), expected \(entries)")
        }

        var failures = 0
        for (name, got, refKey) in [
            ("prefill sample", out1, "out1"), ("prefill multi", multi1, "multi1"),
            ("decode sample", out2, "out2"), ("decode multi", multi2, "multi2"),
        ] {
            let ref = try need(refKey).asType(.float32)
            let g = got.asType(.float32)
            let maxAbs = abs(ref - g).max().item(Float.self)
            let scale = abs(ref).max().item(Float.self)
            let rel = maxAbs / max(scale, 1e-6)
            let ok = rel < 2e-2
            print(String(format: "%@: max abs %.5f  rel %.5f  %@", name, maxAbs, rel, ok ? "OK" : "FAIL"))
            if !ok { failures += 1 }
        }
        print(failures == 0 ? "MTP PARITY PASS" : "MTP PARITY FAIL")
        if failures > 0 { throw ExitCode(2) }
    }
}

// MARK: shared probe machinery

/// Built-in probe prompts: short, diverse (prose, code, list, reasoning) so
/// accept rates aren't measured on one register of text.
let mtpProbePrompts = [
    "Why is the sky blue? Explain in about five sentences.",
    "Write a Python function that parses a duration string like '2h30m' into seconds, with a couple of test cases.",
    "List the planets of the solar system with one interesting fact each.",
    "A train leaves at 9:12 and arrives at 11:47. How long is the trip? Think it through step by step.",
]

struct GreedyTrace {
    var tokens: [Int] = []  // generated tokens, in order
    var draftsAt: [[Int]] = []  // draft chain proposed at each position
}

// MARK: mtp-accept

/// The go/kill probe from the M9 design note: run plain greedy decode and, at
/// every position, chain the draft head (then roll its cache back), so the
/// drafts can be scored against the tokens the model actually went on to
/// produce. No speculation runs — this measures the accept curve that decides
/// whether it can pay, and at which depth.
struct MTPAccept: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-accept",
        abstract: "Measure the MTP draft accept rate against real greedy continuations")
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens to generate per prompt") var maxTokens: Int = 96
    @Option(help: "Draft chain depth to probe") var depth: Int = 4

    func run() throws {
        guard depth >= 1, depth <= 8 else { throw ValidationError("--depth must be 1...8") }
        let plan = try model.announcedPlan(requireMTP: true)
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                var traces: [GreedyTrace] = []
                for (i, prompt) in mtpProbePrompts.enumerated() {
                    let ids = try engine.encodeChat(
                        [ChatMessage(role: "user", content: prompt)], thinking: false)
                    let t = probeGreedy(
                        model: engine.model, promptIds: ids, eosIds: engine.eosIds,
                        maxTokens: maxTokens, depth: depth)
                    traces.append(t)
                    FileHandle.standardError.write(
                        "prompt \(i + 1)/\(mtpProbePrompts.count): \(t.tokens.count) tokens\n"
                            .data(using: .utf8)!)
                }
                report(traces: traces, depth: depth)
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }

    /// Greedy decode that keeps the MTP cache on the true path and records a
    /// draft chain at every position without perturbing generation.
    func probeGreedy(
        model: Qwen4ExpModel, promptIds: [Int], eosIds: Set<Int>, maxTokens: Int, depth: Int
    ) -> GreedyTrace {
        guard let head = model.mtpHead else { fatalError("MTP head not enabled") }
        let state = model.makeState()
        let mtp = MTPState()
        state.mtp = mtp
        let rope = model.sharedRope

        // prefill (chunked), feeding the draft head alongside
        var trace = GreedyTrace()
        var logits = MLXArray(0)
        var i = 0
        let chunkSize = PrefillTuning.chunk
        while i < promptIds.count {
            let hi = min(i + chunkSize, promptIds.count)
            let chunk = Array(promptIds[i ..< hi])
            let (mixed, multi) = model.hiddenStatesWithMulti(chunk, state: state)
            state.lastMulti = head.consume(
                chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                resident: model.resident, rope: rope, state: mtp)
            if hi == promptIds.count {
                logits = model.draftLogits(mixed[0..., (mixed.dim(1) - 1)..., 0...])
            }
            eval(mixed)
            i = hi
        }

        var pending = argMax(logits.reshaped([-1]).asType(.float32)).item(Int.self)
        for _ in 0 ..< maxTokens {
            if eosIds.contains(pending) { break }
            trace.tokens.append(pending)

            // draft chain from (lastMulti, pending) — provisional entries, rolled back
            let offset0 = mtp.offset
            var drafts: [Int] = []
            var dMulti = state.lastMulti!
            var dTok = pending
            for _ in 0 ..< depth {
                let e = model.resident.embed(MLXArray([Int32(dTok)], [1, 1])).asType(.bfloat16)
                let (s, m) = head(embedded: e, hiddenMulti: dMulti, rope: rope, state: mtp)
                dTok = argMax(model.draftLogits(s).reshaped([-1]).asType(.float32)).item(Int.self)
                drafts.append(dTok)
                dMulti = m
            }
            mtp.trim(to: offset0)
            trace.draftsAt.append(drafts)

            // consume pending for real (true-path MTP entry), next token
            let (vLogits, vMulti) = model.allLogitsWithMulti([pending], state: state)
            state.lastMulti = head.consume(
                chunk: [pending], chunkMulti: vMulti, prevMulti: state.lastMulti,
                resident: model.resident, rope: rope, state: mtp)
            precondition(mtp.offset == state.tokenCount - 1, "mtp cache misaligned")
            pending = argMax(vLogits.reshaped([-1]).asType(.float32)).item(Int.self)
        }
        return trace
    }

    func report(traces: [GreedyTrace], depth: Int) {
        // Position t's chain is scored against tokens[t+1 ... t+depth]; only
        // positions with a full comparison window count at each d.
        var okAt = [Int](repeating: 0, count: depth + 1)  // chains whose first d drafts ALL match
        var windows = [Int](repeating: 0, count: depth + 1)
        for t in traces {
            for (pos, drafts) in t.draftsAt.enumerated() {
                for d in 1 ... depth {
                    guard pos + d < t.tokens.count else { continue }
                    windows[d] += 1
                    var all = true
                    for j in 0 ..< d where drafts[j] != t.tokens[pos + 1 + j] { all = false; break }
                    if all { okAt[d] += 1 }
                }
            }
        }
        print("\ndraft accept curve (chain-prefix match over \(windows[1]) positions):")
        var expected = [Double](repeating: 0, count: depth + 1)
        for d in 1 ... depth {
            let p = windows[d] > 0 ? Double(okAt[d]) / Double(windows[d]) : 0
            expected[d] = (d == 1 ? 0 : expected[d - 1]) + p
            print(String(format: "  depth %d: %5.1f%%  (%d/%d)", d, 100 * p, okAt[d], windows[d]))
        }
        for d in 1 ... depth {
            // Per round: E[accepted]+1 tokens for 1 verify pass + P(any
            // rejection) rebuild pass. Draft-head cost ~ (d+kept)/48 of a
            // main pass, charged on top.
            let e = expected[d]
            let pAllOk = windows[d] > 0 ? Double(okAt[d]) / Double(windows[d]) : 0
            let mainPasses = 1.0 + (1.0 - pAllOk)
            let mtpOverhead = Double(d + 1) / 48.0 * 2.0  // draft + re-extend, generous
            let speedup = (e + 1.0) / (mainPasses + mtpOverhead)
            print(String(
                format: "  depth %d: E[tokens/round] %.2f -> est. decode speedup x%.2f",
                d, e + 1.0, speedup))
        }
    }
}

// MARK: mtp-fixture-inputs

/// (Hidden) Capture REAL fixture inputs for the parity test: embedding rows
/// and pre-mixer multi streams from an actual prefill of the pinned model.
/// Random hidden inputs turned out to be adversarial for parity — the MTP
/// layer's attention logits are an order sharper than main layers (its norms
/// run ~3x hotter), and off-manifold inputs put many positions at near-ties
/// where benign cross-framework bf16 noise flips the argmax key. On-manifold
/// inputs measure the implementation, not the near-tie lottery.
struct MTPFixtureInputs: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-fixture-inputs",
        abstract: "Capture real (embedded, multi) fixture inputs from the pinned model",
        shouldDisplay: false)
    @OptionGroup var model: ModelOptions
    @Option var out: String = "Tools/reference/fixtures/mtp_parity_inputs.safetensors"

    func run() throws {
        // Same ids the fixture always used; a real chat-ish opening.
        let ids = [151644, 8948, 198, 40, 1079]
        let step2 = 25
        let index = try CheckpointIndex(dir: model.modelURL)
        let m = try Qwen4ExpModel(index: index, poolSlots: 2048)
        try m.validate()
        let state = m.makeState()
        let (_, multi1) = m.hiddenStatesWithMulti(ids, state: state)
        let (_, multi2) = m.hiddenStatesWithMulti([step2], state: state)
        // Real-usage alignment: the entry for token i fuses the previous
        // position's multi with token i's embedding.
        let emb1 = m.resident.embed(MLXArray(ids[1...].map { Int32($0) }, [1, ids.count - 1]))
            .asType(.bfloat16)
        let emb2 = m.resident.embed(MLXArray([Int32(step2)], [1, 1])).asType(.bfloat16)
        let hid1 = multi1[0..., 0 ..< (ids.count - 1), 0...]
        let hid2 = multi1[0..., (ids.count - 1)..., 0...]
        eval(emb1, emb2, hid1, hid2, multi2)
        try save(
            arrays: [
                "ids": MLXArray(ids.map { Int32($0) }),
                "step2_id": MLXArray([Int32(step2)]),
                "embedded": emb1, "hidden": hid1,
                "embedded2": emb2, "hidden2": hid2,
            ],
            url: URL(fileURLWithPath: out))
        print("wrote \(out)")
    }
}

// MARK: mtp-bench

/// (Hidden) In-process A/B decode benchmark: one engine, one warm expert
/// pool, alternating speculative/plain greedy generations of the same
/// prompt. The fairest possible comparison — everything shared except the
/// decode loop.
struct MTPBench: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-bench",
        abstract: "A/B decode throughput: speculative vs plain on one warm engine",
        shouldDisplay: false)
    @OptionGroup var model: ModelOptions
    @Option var maxTokens: Int = 192
    @Option(help: "A/B pairs to run") var pairs: Int = 3
    @Option var prompt: String = "Explain how a transistor works, in about 300 words."
    @Flag(help: "Sample with the server's defaults (temperature 0.7, top-p 0.8, top-k 20, presence 1.5) instead of greedy; a fixed seed keeps both paths on one token stream")
    var sample = false
    @Option(help: "Seed for --sample") var seed: UInt64 = 1

    func run() throws {
        let plan = try model.announcedPlan(requireMTP: true)
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                var params = sample ? SampleParams() : SampleParams.greedy
                if sample { params.seed = seed }
                params.maxTokens = maxTokens
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: prompt)], thinking: false)

                func once(spec: Bool) -> GenStats {
                    engine.generator.speculationEnabled = spec
                    let (_, stats) = engine.generator.generate(
                        promptIds: ids, params: params, eosIds: engine.eosIds)
                    return stats
                }
                // Warm the pool along BOTH decode paths before timing.
                _ = once(spec: true)
                _ = once(spec: false)
                var specTPS: [Double] = []
                var plainTPS: [Double] = []
                for i in 0 ..< max(1, pairs) {
                    let a = once(spec: false)
                    let b = once(spec: true)
                    plainTPS.append(a.decodeTPS)
                    specTPS.append(b.decodeTPS)
                    print(String(
                        format: "pair %d: plain %6.2f tok/s | spec %6.2f tok/s  (accept %4.1f%%, %d verify passes, %d tokens)",
                        i + 1, a.decodeTPS, b.decodeTPS, b.draftAcceptRate * 100,
                        b.verifyPasses, b.decodeTokens))
                }
                let p = plainTPS.sorted()[plainTPS.count / 2]
                let s = specTPS.sorted()[specTPS.count / 2]
                print(String(
                    format: "median: plain %.2f tok/s, speculative %.2f tok/s -> x%.2f at ~%.0f experts/layer, depth %d, %@",
                    p, s, s / p, plan.expertsPerLayerCached, engine.generator.draftDepth,
                    sample ? "sampled (seed \(seed))" : "greedy"))
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: mtp-check

/// Standing gate for speculative decode:
///   1. determinism — two speculative greedy runs are byte-identical;
///   2. cross-request state integrity — a follow-up turn through the prefix
///      cache extends a state built by speculative decode, and its logits stay
///      inside the band re-chunking a plain prefill moves them (prefix-check);
///   3. sanity — drafts are actually being accepted (a broken head or a
///      misaligned cache shows up as ~0%);
///   4. plain-vs-speculative divergence is REPORTED, not gated to zero:
///      verify batches tokens, and re-batching moves logits within the same
///      floating-point envelope as prefill re-chunking (MEASUREMENTS, prefix
///      cache) — near-tie argmax flips are expected occasionally.
struct MTPCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-check",
        abstract: "Gate speculative decode: determinism, state integrity, accept sanity")
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens per generation") var maxTokens: Int = 48
    @Option(help: "Image for the vision+mtp leg (default: Tools/assets/vision_test/secret1.jpg)")
    var image: String?


    func run() throws {
        let plan = try model.announcedPlan(requireMTP: true)
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let observation = FootprintSampler()
                let vmBefore = ProcessMemory.vmActivity()
                let memoryTarget = plan.targetGB ?? plan.expectedPeakGB
                var memoryValidated = false
                var finalObservation: (sample: FootprintSampler.Result, vm: ProcessMemory.VMActivity?, physical: UInt64, rss: UInt64)?
                defer {
                    let observed = finalObservation ?? (sample: observation.finish(), vm: ProcessMemory.vmActivity(),
                        physical: ProcessMemory.residentBytes(), rss: ProcessMemory.lifetimeRSSPeakBytes())
                    let report: [String: Any] = [
                        "memory_validated": memoryValidated, "target_gb": memoryTarget,
                        "sampled_peak_bytes": observed.sample.peakBytes, "samples": observed.sample.samples,
                        "physical_footprint_end_bytes": observed.physical, "lifetime_rss_peak_bytes": observed.rss,
                        "swapins_before": vmBefore.map { $0.swapins as Any } ?? NSNull(),
                        "swapins_after": observed.vm.map { $0.swapins as Any } ?? NSNull(),
                        "swapouts_before": vmBefore.map { $0.swapouts as Any } ?? NSNull(),
                        "swapouts_after": observed.vm.map { $0.swapouts as Any } ?? NSNull(),
                    ]
                    if let data = try? JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]) {
                        print("MTP CHECK MEMORY " + String(decoding: data, as: UTF8.self))
                    }
                }
                func memoryGuard() throws {
                    guard let current = ProcessMemory.vmActivity(), let before = vmBefore,
                          current.swapins == before.swapins, current.swapouts == before.swapouts,
                          Double(current.reclaimableBytes) >= 3e9 else {
                        throw ModelError("MTP check lost real headroom, has unavailable observations or observed swap")
                    }
                    let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
                    guard physical > 0, rss > 0, Double(max(physical, rss)) <= memoryTarget * 1e9 else {
                        throw ModelError("MTP check memory observations are unavailable or exceed the planned target")
                    }
                }
                try memoryGuard()
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                engine.generator.footprintSampling = true
                try memoryGuard()
                var failures: [String] = []
                func check(_ name: String, _ ok: Bool) {
                    print(ok ? "PASS  \(name)" : "FAIL  \(name)")
                    if !ok { failures.append(name) }
                }
                var params = SampleParams.greedy
                params.maxTokens = maxTokens

                func checkedGeneration(_ ids: [Int], vision: VisionPrompt? = nil) throws -> ([Int], GenStats) {
                    try memoryGuard()
                    var interrupted: Error?
                    let generated = engine.generate(promptIds: ids, params: params, vision: vision, shouldContinue: {
                        do { try memoryGuard(); return true }
                        catch { interrupted = error; return false }
                    })
                    if let interrupted { throw interrupted }
                    guard generated.stats.runtimeError == nil, generated.stats.requestFailure == nil else {
                        throw ModelError("MTP check generation failed its Engine request guard")
                    }
                    try memoryGuard()
                    return (generated.ids, generated.stats)
                }

                func gen(_ prompt: String, spec: Bool) throws -> ([Int], GenStats) {
                    engine.generator.speculationEnabled = spec
                    defer { engine.generator.speculationEnabled = true }
                    let ids = try engine.encodeChat(
                        [ChatMessage(role: "user", content: prompt)], thinking: false)
                    engine.dropPrefixCache()
                    return try checkedGeneration(ids)
                }

                var acceptTotal = 0
                var draftTotal = 0
                for (i, prompt) in mtpProbePrompts.prefix(3).enumerated() {
                    let (a, sa) = try gen(prompt, spec: true)
                    let (b, _) = try gen(prompt, spec: true)
                    check("determinism p\(i + 1) (\(a.count) tokens)", a == b)
                    check("speculation ran p\(i + 1)", sa.verifyPasses > 0)
                    acceptTotal += sa.acceptedDrafts
                    draftTotal += sa.draftedTokens
                    let (c, _) = try gen(prompt, spec: false)
                    let shared = zip(a, c).prefix { $0 == $1 }.count
                    print(
                        "  info  p\(i + 1): plain vs spec shared prefix \(shared)/\(min(a.count, c.count))"
                            + (a == c ? " (identical)" : ""))
                }

                // Vision + MTP: a combined text-and-image prompt must speculate
                // too. The head's prefill consumption splices the tower's rows
                // at the placeholder runs (MTPHead.consume), so its cache is
                // built on the embeddings the main model saw; without that the
                // drafts would be self-consistent but blind to the image and
                // the accept rate would collapse. Runs the same three legs as
                // the text prompts above (spec, spec, plain) so determinism,
                // "speculation actually ran" and the shared-prefix report all
                // apply. Skips when the repo asset image is not in reach.
                let visionMode = try model.visionMode()
                let visionAsset: URL?
                if visionMode == .off { visionAsset = nil }
                else if visionMode == .on || image != nil {
                    visionAsset = URL(fileURLWithPath: try VisionAssets.resolve(image))
                } else {
                    visionAsset = (try? VisionAssets.resolve(image)).map { URL(fileURLWithPath: $0) }
                }
                if let img = visionAsset {
                    do {
                        let base64 = try Data(contentsOf: img).base64EncodedString()
                        let mime = img.pathExtension == "png" ? "image/png" : "image/jpeg"
                        let part: [String: Any] = [
                            "type": "image_url",
                            "image_url": ["url": "data:\(mime);base64,\(base64)"],
                        ]
                        let (ids, vision) = try engine.encodeWithVision(
                            messages: [
                                [
                                    "role": "user",
                                    "content": [
                                        part,
                                        ["type": "text", "text": "Describe this image briefly."],
                                    ],
                                ]
                            ],
                            tools: nil, thinking: false)
                        guard let vision else {
                            throw ModelError("vision prompt carried no image segments")
                        }
                        print(
                            "  info  vision+mtp prompt: \(ids.count) tokens, "
                                + "\(vision.segments.count) image(s), placeholder id "
                                + "\(engine.model.cfg.imageTokenId)")
                        func genVision(_ ids: [Int], _ vision: VisionPrompt?, spec: Bool)
                            throws -> ([Int], GenStats)
                        {
                            engine.generator.speculationEnabled = spec
                            defer { engine.generator.speculationEnabled = true }
                            engine.dropPrefixCache()
                            return try checkedGeneration(ids, vision: vision)
                        }
                        let (a, sa) = try genVision(ids, vision, spec: true)
                        let (b, _) = try genVision(ids, vision, spec: true)
                        check("vision speculation deterministic (\(a.count) tokens)", a == b)
                        check("vision speculation ran", sa.verifyPasses > 0)
                        acceptTotal += sa.acceptedDrafts
                        draftTotal += sa.draftedTokens
                        let (c, _) = try genVision(ids, vision, spec: false)
                        let shared = zip(a, c).prefix { $0 == $1 }.count
                        print(
                            "  info  vision plain vs spec shared prefix \(shared)/\(min(a.count, c.count))"
                                + (a == c ? " (identical)" : ""))
                    } catch {
                        check("vision+mtp leg completes", false)
                        failures.append("vision+mtp leg: \(error)")
                    }
                } else {
                    print(
                        "SKIP vision+mtp leg (vision disabled or no Tools/assets/vision_test image in reach; "
                            + "pass --image to force one)")
                }
                let rate = draftTotal > 0 ? Double(acceptTotal) / Double(draftTotal) : 0
                print(String(format: "  info  overall accept rate %.1f%%", rate * 100))
                check("accept rate is not degenerate (>5%)", rate > 0.05)

                // The verify pass records per-position recurrent states by
                // stepping the GDN recurrence one token at a time; the batched
                // kernel is the reference for the pass itself, and the plain
                // path stepping the same tokens is the reference for what a
                // rollback leaves behind. Same two tokens from one prefix:
                //   (1) recording pass vs batched pass: exact (the state is fp32
                //       between steps exactly as inside the fused kernel);
                //   (2) rollback to token 1 vs the plain path having stepped
                //       token 1 alone: the recurrent tensors agree to within
                //       re-association (the kept token's projections came out
                //       of a two-row batch; a wrong window reads order one), and
                //       one more step from each lands inside the prefill-rechunk
                //       band, the same bound prefix-check uses.
                do {
                    let probe = try engine.encodeChat(
                        [ChatMessage(role: "user", content: mtpProbePrompts[0])], thinking: false)
                    let prefix = Array(probe.dropLast(2))
                    let tail = Array(probe.suffix(2))
                    func vec(_ a: MLXArray) -> [Float] { a.reshaped([-1]).asType(.float32).asArray(Float.self) }
                    // plain path: prefix, then token 1 alone
                    let stPlain = engine.model.makeState()
                    eval(engine.model.hiddenStates(prefix, state: stPlain))
                    eval(engine.model.hiddenStates([tail[0]], state: stPlain))
                    // recording pass over both tokens from the same prefix, then rollback to token 1
                    let st = engine.model.makeState()
                    eval(engine.model.hiddenStates(prefix, state: st))
                    let ck = st.checkpoint()
                    let (batched, _) = engine.model.allLogitsWithMulti(tail, state: st)
                    eval(batched)
                    st.restore(ck)
                    st.setRecording(true)
                    let (stepped, _) = engine.model.allLogitsWithMulti(tail, state: st)
                    eval(stepped)
                    st.rollback(keeping: 1, of: tail, from: ck, ngramWindow: engine.model.cfg.ngramSize - 1)
                    let d = st.recurrentDelta(vs: stPlain)
                    // Control for the state deltas: the plain path built the same
                    // way but with its prefix re-chunked (7 tokens at a time), the
                    // accepted "same computation, summed differently" band.
                    let stCtrl = engine.model.makeState()
                    var i0 = 0
                    while i0 < prefix.count {
                        let hi = min(i0 + 7, prefix.count)
                        eval(engine.model.hiddenStates(Array(prefix[i0 ..< hi]), state: stCtrl))
                        i0 = hi
                    }
                    eval(engine.model.hiddenStates([tail[0]], state: stCtrl))
                    let dc = stCtrl.recurrentDelta(vs: stPlain)
                    let after = engine.model.lastLogits([tail[1]], state: st)
                    let plainStep = engine.model.lastLogits([tail[1]], state: stPlain)
                    eval(after, plainStep)
                    let (rel, same) = PrefixCheck.compare(vec(batched), vec(stepped))
                    let (relRoll, sameRoll) = PrefixCheck.compare(vec(plainStep), vec(after))
                    let whole = PrefixCheck.logits(engine, ids: probe, .whole)
                    let (ctrl, _) = PrefixCheck.compare(whole, PrefixCheck.logits(engine, ids: probe, .chunked(7)))
                    let bound = max(ctrl * 3, 0.01)
                    print(String(
                        format: "  info  recording pass vs batched: %.4f%% of spread (top-1 %@); rollback state vs plain: "
                            + "ssm %.2e, conv %.2e, ple %.2e relative (re-chunk control: ssm %.2e, conv %.2e, ple %.2e); "
                            + "one more step: %.3f%% vs control %.3f%% (bound %.3f%%, top-1 %@)",
                        rel * 100, same ? "same" : "differs", d.ssm, d.conv, d.ple, dc.ssm, dc.conv, dc.ple,
                        relRoll * 100, ctrl * 100, bound * 100, sameRoll ? "same" : "differs"))
                    check("recording verify pass matches the batched pass (<= 0.1% of spread)", rel <= 0.001)
                    // A wrong window or a stale state reads order one; the band is
                    // three times what re-chunking the plain path moves the same
                    // tensors, never under 1e-2 (bf16 rounding), as in prefix-check.
                    check("rollback state stays inside 3x the re-chunk band (ssm, conv, ple)",
                          d.ssm <= max(3 * dc.ssm, 1e-2) && d.conv <= max(3 * dc.conv, 1e-2) && d.ple <= max(3 * dc.ple, 1e-2))
                    check("rollback then one step stays inside the prefill-rechunk band", relRoll <= bound)
                }

                // Cross-request state integrity, at the logits level, by the
                // prefix-check method: a state built by speculative decode and
                // handed on through the prefix cache must move the next turn's
                // logits no more than re-chunking a plain prefill already does
                // (bound = 3x that control, floor 1% of spread), the band that
                // separates re-association from a corrupted or misaligned
                // state. Turn 2 is turn 1's exact ids plus its generation plus a
                // token suffix, so this gates the speculative bookkeeping, not
                // the chat template's decode->re-encode round-trip. Text or
                // liveness comparisons were a near-tie lottery here: a 48-token
                // turn-1 reply is cut mid-think, and whether the model answers
                // the suffix or stops is decided by tenths of a logit (the
                // previous form of this gate flipped when the draft depth
                // changed from 4 to 2, with the logits inside the band).
                func vec(_ a: MLXArray) -> [Float] {
                    a.reshaped([-1]).asType(.float32).asArray(Float.self)
                }
                engine.dropPrefixCache()
                engine.generator.speculationEnabled = true
                let q = "Name three primary colors."
                let ids1 = try engine.encodeChat(
                    [ChatMessage(role: "user", content: q)], thinking: false)
                let (o1, s1) = try checkedGeneration(ids1)
                let cont = engine.tokenizer.encode(text: "\n\nThe capital of France is")
                let ids2 = ids1 + o1 + cont
                let hit = engine.prefixCache.take(matching: ids2, reserveTokens: ids2.count + 8)
                check("turn-2 reused the speculative turn-1 state", (hit?.reused ?? 0) > 0)
                if let hit = hit, hit.reused > 0 {
                    let rest = Array(ids2[hit.reused...])
                    let spec = vec(engine.model.lastLogits(rest, state: hit.state))
                    let whole = PrefixCheck.logits(engine, ids: ids2, .whole)
                    let (ctrl, _) = PrefixCheck.compare(
                        whole, PrefixCheck.logits(engine, ids: ids2, .chunked(7)))
                    let (rel, sameTop1) = PrefixCheck.compare(whole, spec)
                    let bound = max(ctrl * 3, 0.01)
                    print(String(
                        format: "  info  turn-2 logits from the reused speculative state: %.3f%% of "
                            + "spread vs a cold rebuild (prefill-rechunk control %.3f%%, bound %.3f%%), "
                            + "top-1 %@; reused %d of %d tokens after a %d-token turn 1 (%d verify passes)",
                        rel * 100, ctrl * 100, bound * 100, sameTop1 ? "same" : "differs",
                        hit.reused, ids2.count, o1.count, s1.verifyPasses))
                    check("reused speculative state stays inside the prefill-rechunk band", rel <= bound)
                }
                check("turn-1 speculation ran", s1.verifyPasses > 0)

                let sample = observation.finish()
                let vmAfter = ProcessMemory.vmActivity()
                let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
                finalObservation = (sample, vmAfter, physical, rss)
                memoryValidated = sample.samples > 0 && sample.peakBytes > 0 && physical > 0 && rss > 0
                    && Double(max(sample.peakBytes, max(physical, rss))) <= memoryTarget * 1e9
                    && vmBefore != nil && vmAfter != nil && vmBefore?.swapins == vmAfter?.swapins
                    && vmBefore?.swapouts == vmAfter?.swapouts
                check("whole MTP check memory interval fits the priced target without swap", memoryValidated)
                print(failures.isEmpty ? "MTP CHECK PASS" : "MTP CHECK FAIL: \(failures.joined(separator: ", "))")
                if !failures.isEmpty { throw ExitCode(2) }
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: mtp-passcost

/// What a k-token pass costs relative to a 1-token pass when NOTHING has to
/// be fetched — the number the plateau-regime speculative arithmetic rests on
/// ("verifying k drafted tokens costs roughly the launches of one"). The
/// plateau itself needs a ~27 GB target this Mac cannot always spare; the
/// fetch-free cost fits in any pool that holds five tokens' experts: run the
/// same pass twice from one checkpoint and time the second, when every expert
/// it needs is already resident (the miss counter proves it). Positions come
/// from a real greedy continuation so routing is realistic.
struct MTPPassCost: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-passcost",
        abstract: "Fetch-free cost of a k-token verify pass relative to one token",
        shouldDisplay: false)
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens of plain greedy continuation to draw positions from") var maxTokens: Int = 64
    @Option(help: "Measurement positions (after one warm-up position)") var positions: Int = 8
    @Option(help: "Largest pass to time (the verify pass is draft depth + 1)") var maxBatch: Int = 5
    @Option var prompt: String = "Explain how a transistor works, in about 300 words."

    func run() throws {
        let plan = try model.announcedPlan(requireMTP: true)
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let m = engine.model
                guard let head = m.mtpHead else { throw ModelError("draft head not loaded") }
                var params = SampleParams.greedy
                params.maxTokens = maxTokens
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: prompt)], thinking: false)
                engine.generator.speculationEnabled = false
                let (out, _) = engine.generator.generate(
                    promptIds: ids, params: params, eosIds: engine.eosIds)
                let seq = ids + out
                let need = ids.count + maxBatch * (positions + 1) + 1
                guard seq.count >= need else {
                    throw ModelError(
                        "continuation too short: \(out.count) tokens; lower --positions or raise --max-tokens")
                }

                // A fresh state over the prompt, with the draft head's cache aligned.
                let state = m.makeState()
                let mtpState = MTPState()
                state.mtp = mtpState
                let prefix = Array(seq[0 ..< ids.count])
                let (_, pm) = m.hiddenStatesWithMulti(prefix, state: state)
                eval(pm)
                state.lastMulti = head.consume(
                    chunk: prefix, chunkMulti: pm, prevMulti: nil,
                    resident: m.resident, rope: m.sharedRope, state: mtpState)

                func timed(_ body: () -> Void) -> Double {
                    let t0 = DispatchTime.now().uptimeNanoseconds
                    body()
                    return Double(DispatchTime.now().uptimeNanoseconds - t0) / 1e6
                }
                func median(_ a: [Double]) -> Double {
                    let s = a.sorted()
                    return s.isEmpty ? 0 : s[s.count / 2]
                }
                // per k: (coldMs, coldMisses, warmMs, warmMisses)
                var verify: [Int: [(Double, Int, Double, Int)]] = [:]
                var rebuild: [Int: [(Double, Int)]] = [:]
                var draft: [Double] = []

                var p = ids.count
                for pos in 0 ... positions {  // position 0 is the warm-up (kernel compiles)
                    let record = pos > 0
                    for k in 1 ... maxBatch {
                        let chunk = Array(seq[p ..< p + k])
                        let ck = state.checkpoint()
                        m.pool.resetStats()
                        let cold = timed {
                            let (l, mu) = m.allLogitsWithMulti(chunk, state: state)
                            eval(l, mu)
                        }
                        let coldMiss = m.pool.misses
                        state.restore(ck)
                        m.pool.resetStats()
                        let warm = timed {
                            let (l, mu) = m.allLogitsWithMulti(chunk, state: state)
                            eval(l, mu)
                        }
                        let warmMiss = m.pool.misses
                        state.restore(ck)
                        if record { verify[k, default: []].append((cold, coldMiss, warm, warmMiss)) }
                        if k < maxBatch {
                            // The rebuild after a rejection re-runs the kept tokens without logits.
                            _ = timed {
                                let (_, mu) = m.hiddenStatesWithMulti(chunk, state: state)
                                eval(mu)
                            }
                            state.restore(ck)
                            m.pool.resetStats()
                            let rw = timed {
                                let (_, mu) = m.hiddenStatesWithMulti(chunk, state: state)
                                eval(mu)
                            }
                            let rm = m.pool.misses
                            state.restore(ck)
                            if record { rebuild[k, default: []].append((rw, rm)) }
                        }
                    }
                    // One draft-head step (everything resident: it never fetches).
                    let e = m.resident.embed(MLXArray([Int32(seq[p])], [1, 1])).asType(.bfloat16)
                    let off = mtpState.offset
                    for i in 0 ..< 2 {
                        let d = timed {
                            let (s, _) = head(
                                embedded: e, hiddenMulti: state.lastMulti!, rope: m.sharedRope,
                                state: mtpState)
                            let dl = m.draftLogits(s)
                            eval(dl)
                        }
                        mtpState.trim(to: off)
                        if record && i == 1 { draft.append(d) }
                    }
                    // Advance for real by maxBatch tokens so the next position is fresh.
                    let step = Array(seq[p ..< p + maxBatch])
                    let (_, mu) = m.hiddenStatesWithMulti(step, state: state)
                    eval(mu)
                    state.lastMulti = head.consume(
                        chunk: step, chunkMulti: mu, prevMulti: state.lastMulti,
                        resident: m.resident, rope: m.sharedRope, state: mtpState)
                    p += maxBatch
                }

                let t1 = median(verify[1]!.map { $0.2 })
                print(String(
                    format: "fetch-free pass cost at ~%.0f experts/layer, median of %d positions (ms; ratio to the 1-token pass):",
                    plan.expertsPerLayerCached, positions))
                for k in 1 ... maxBatch {
                    let w = verify[k]!
                    print(String(
                        format: "  verify  k=%d: %7.1f ms  x%.2f   [warm misses %d | first run %7.1f ms, %d misses]",
                        k, median(w.map { $0.2 }), median(w.map { $0.2 }) / t1,
                        Int(median(w.map { Double($0.3) })), median(w.map { $0.0 }),
                        Int(median(w.map { Double($0.1) }))))
                }
                for k in 1 ..< maxBatch {
                    let r = rebuild[k]!
                    print(String(
                        format: "  rebuild k=%d: %7.1f ms  x%.2f   [warm misses %d]",
                        k, median(r.map { $0.0 }), median(r.map { $0.0 }) / t1,
                        Int(median(r.map { Double($0.1) }))))
                }
                print(String(
                    format: "  draft step:   %7.1f ms  x%.2f   (one head step + lm_head, resident)",
                    median(draft), median(draft) / t1))
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

````

Applied delta `Sources/Slotstream/Context.swift`:

````diff
--- a/Sources/Slotstream/Context.swift
+++ b/Sources/Slotstream/Context.swift
@@ -118,15 +118,42 @@
 
     /// The passes that reading `tokens` new tokens from `position` runs.
     public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> [Int] {
+        computePasses(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware).map(\.tokens)
+    }
+
+    public struct ComputePass: Sendable {
+        public let tokens: Int
+        public let queryRows: Int
+        public let keyExtent: Int
+    }
+
+    /// Include the canonical late-context dispatch shape and masked columns,
+    /// using the same bounded geometry as Generator. A nominal odd pass can
+    /// shrink again for numerical alignment; diagnostics must report that.
+    public static func computePasses(tokens: Int, from position: Int = 0,
+                                     maxChunk: Int, tailAware: Bool = false) -> [ComputePass] {
         guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
               tokens <= ContextPolicy.modelLimit - position else { return [] }
-        var out: [Int] = []
+        var out: [ComputePass] = []
         var pos = position
         var left = tokens
+        let end = position + tokens
+        var referenceStart: Int?
         while left > 0 {
-            let c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
+            var c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
+            let small = chunk(at: pos, maxChunk: 256) < 256
+            if small {
+                if referenceStart == nil { referenceStart = pos }
+                c = ContextWorkspace.boundedSmallPass(requested: c, at: pos,
+                    referenceStart: referenceStart!, referenceEnd: end)
+            }
             guard c > 0 else { return [] }
-            out.append(c)
+            let extent = small ? ContextWorkspace.keyExtent(pass: c, context: pos + c,
+                referenceStart: referenceStart!, referenceEnd: end) : pos + c
+            let queries = small ? ContextWorkspace.queryRows(pass: c, context: pos + c,
+                referenceStart: referenceStart!, referenceEnd: end) : c
+            guard extent > 0, queries <= measuredQueryKeyProduct / extent else { return [] }
+            out.append(ComputePass(tokens: c, queryRows: queries, keyExtent: extent))
             pos += c
             left -= c
         }

````

Final source `/Users/carlos/Projects/slotstream/Sources/Slotstream/Context.swift` — SHA-256 `0bec23bc161e827c46851161cf131ebc6079e41270cc600a5ff33487e8f5f5f3`.

````text
// Context length: the cap, why it is what it is, and the prefill schedule that
// keeps a long prompt's transient memory inside what has been measured.

import Foundation

public enum ContextPolicy {
    /// Pinned checkpoint configuration. This is independent of qualification.
    public static let modelLimit = 262_144
    /// Longest prompt plus reply any one request may hold, in tokens.
    ///
    /// The Hermes qualification read 65,520 prompt tokens plus a reply; the
    /// remainder is reserved reply room. This is a measured serving envelope,
    /// not the model's 262,144-token configured limit or an answer-quality claim.
    /// The larger requested window is priced before allocating the expert pool.
    /// See MEASUREMENTS.md, Hermes integration, for the initial budget failure
    /// and the planned-context qualification. Keep ordinary defaults unchanged.
    public static let maxTokens = 65_536
    public static let implementationLimit = maxTokens
    public static let mtpLimit = 65_536
    public static let visionLimit = 65_536
    public static let defaultTokens = 32_768
    /// Context the fixed footprint (Planner.fixedFootprintGB) already pays for.
    public static let tokensInFixedFootprint = 32_768

    package static func maximumDraftDepth(requested: Int, at consumed: Int, limit: Int) -> Int {
        guard requested >= 0, consumed >= 0, consumed <= limit,
              limit > 0, limit <= modelLimit else { return 0 }
        return min(requested, max(0, limit - consumed - 1))
    }

    /// nil when `tokens` is an acceptable --max-context, otherwise the reason.
    public static func validationError(_ tokens: Int) -> String? {
        validationError(tokens, qualification: false)
    }

    public static func validationError(_ tokens: Int, qualification: Bool) -> String? {
        let limit = qualification ? modelLimit : implementationLimit
        if (1 ... limit).contains(tokens) { return nil }
        return "--max-context must be between 1 and \(limit) (prompt plus reply). "
            + "The pinned model limit is \(modelLimit); the released implementation limit is "
            + "\(implementationLimit). A model limit does not guarantee memory fit or answer quality."
    }
}

/// How a prompt is split into prefill passes.
///
/// A pass is faster the bigger it is (the expert stream is re-read roughly once
/// per pass), but the sparse-attention layers score every query token of the
/// pass against every key already in the context, so the pass's transient
/// memory grows with chunk × context, not with the chunk alone. Every number
/// the planner charges for a pass was measured with that product at most
/// `measuredQueryKeyProduct`. Past that point the schedule halves the pass
/// instead of letting the transient grow into space nothing has measured.
public enum PrefillSchedule {
    /// The largest query-by-key product any prefill measurement covered: a
    /// 4096-token pass finishing an 8,016-token prompt (MEASUREMENTS.md,
    /// "Prefill, second pass"). Do not raise it without a new measurement.
    public static let measuredQueryKeyProduct = 4096 * 8016
    /// Late-context passes use the existing small-pass pool path. Their cost
    /// stays unknown until a matching measurement has been registered.
    public static let minChunk = 64

    /// The pass to run when the state already holds `position` tokens and the
    /// plan allows `maxChunk`: halve from `maxChunk` until the product with
    /// the context the pass attends over is inside the measured bound, never
    /// below `minChunk`.
    public static func chunk(at position: Int, maxChunk: Int) -> Int {
        guard position >= 0, position < ContextPolicy.modelLimit else { return 0 }
        // Preserve the original 256-row dispatch while it fits. An odd
        // override such as 4095 must not halve through 511 to 255 inside the
        // existing serving window and silently select small-pass arithmetic.
        let floor = fits(256, at: position) ? 256 : minChunk
        var c = min(4096, max(floor, maxChunk))
        while c > floor, !fits(c, at: position) {
            c = max(floor, c / 2)
        }
        while c > 1, !fits(c, at: position) { c /= 2 }
        return fits(c, at: position) ? c : 0
    }

    /// Division avoids overflowing arbitrary diagnostic inputs. The accepted
    /// context ceiling is unchanged; within it even the minimum pass fits.
    public static func fits(_ count: Int, at position: Int) -> Bool {
        count > 0 && position >= 0 && position <= measuredQueryKeyProduct / count - count
    }

    /// Check the actual remaining rows before shrinking a hypothetical full
    /// pass. A 3,864-row tail after 4,096 fits the existing measured envelope.
    public static func next(remaining: Int, at position: Int, maxChunk: Int, tailAware: Bool) -> Int {
        guard remaining > 0 else { return 0 }
        guard position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return 0 }
        let candidate = min(remaining, min(4096, max(1, maxChunk)))
        if tailAware, fits(candidate, at: position) { return candidate }
        return min(remaining, chunk(at: position, maxChunk: maxChunk))
    }

    /// Group existing chronological compute passes without enlarging any
    /// query-by-key product. A scope shares reads; it is not a compute pass.
    public static func scopePasses(remaining: Int, at position: Int, maxChunk: Int,
                                   maxScope: Int, tailAware: Bool) -> [Int] {
        guard remaining > 0, position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return [] }
        var result: [Int] = [], count = 0
        let bound = max(minChunk, min(8192, maxScope))
        while count < remaining {
            let (pos, overflow) = max(0, position).addingReportingOverflow(count)
            guard !overflow else { break }
            let n = next(remaining: remaining - count, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            // A short final pass uses the reference cached kernel family;
            // keep it separate until swept short tails have their own gate.
            if n == 0 || (count > 0 && (n < SweepTuning.minTokens || n > bound - count)) { break }
            result.append(n); count += n
            if count >= bound { break }
        }
        return result
    }

    /// The passes that reading `tokens` new tokens from `position` runs.
    public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> [Int] {
        computePasses(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware).map(\.tokens)
    }

    public struct ComputePass: Sendable {
        public let tokens: Int
        public let queryRows: Int
        public let keyExtent: Int
    }

    /// Include the canonical late-context dispatch shape and masked columns,
    /// using the same bounded geometry as Generator. A nominal odd pass can
    /// shrink again for numerical alignment; diagnostics must report that.
    public static func computePasses(tokens: Int, from position: Int = 0,
                                     maxChunk: Int, tailAware: Bool = false) -> [ComputePass] {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return [] }
        var out: [ComputePass] = []
        var pos = position
        var left = tokens
        let end = position + tokens
        var referenceStart: Int?
        while left > 0 {
            var c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            let small = chunk(at: pos, maxChunk: 256) < 256
            if small {
                if referenceStart == nil { referenceStart = pos }
                c = ContextWorkspace.boundedSmallPass(requested: c, at: pos,
                    referenceStart: referenceStart!, referenceEnd: end)
            }
            guard c > 0 else { return [] }
            let extent = small ? ContextWorkspace.keyExtent(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : pos + c
            let queries = small ? ContextWorkspace.queryRows(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : c
            guard extent > 0, queries <= measuredQueryKeyProduct / extent else { return [] }
            out.append(ComputePass(tokens: c, queryRows: queries, keyExtent: extent))
            pos += c
            left -= c
        }
        return out
    }

    /// Seconds to read `tokens` new prompt tokens at this plan: the schedule's
    /// passes priced at the measured per-pass throughput anchors
    /// (Planner.estPrefillTokS). The last, partial pass is priced at the rate
    /// of the pass size it was cut from — slightly pessimistic, on purpose.
    public static func estSeconds(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> Double {
        estimateSeconds(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware) ?? .infinity
    }

    /// nil means there is no qualified throughput anchor for this schedule.
    public static func estimateSeconds(tokens: Int, from position: Int = 0, maxChunk: Int,
                                       tailAware: Bool = false) -> Double? {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return nil }
        var secs = 0.0
        var pos = max(0, position)
        var left = max(0, tokens)
        while left > 0 {
            let full = tailAware
                ? next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: true)
                : chunk(at: pos, maxChunk: maxChunk)
            let c = min(full, left)
            guard c > 0, full >= 256 else { return nil }
            secs += Double(c) / Planner.estPrefillTokS(chunk: full)
            pos += c
            left -= c
        }
        return secs
    }

    /// "18 s" / "1.2 min" / "1.5 h": the same rounding everywhere it is shown.
    public static func describe(seconds: Double) -> String {
        guard seconds.isFinite else { return "unknown (schedule not yet calibrated)" }
        if seconds < 60 { return String(format: "%.0f s", seconds.rounded()) }
        if seconds < 3600 { return String(format: "%.1f min", seconds / 60) }
        return String(format: "%.1f h", seconds / 3600)
    }
}

/// Progress lines for a long prefill, shared by `run` (stderr) and `serve`
/// (its log). A prompt under `quietBelowTokens` prints nothing: the wait is
/// seconds and the lines would be noise.
public final class PrefillProgressReporter {
    public let quietBelowTokens: Int
    public var maxChunk: Int
    private let sink: (String) -> Void
    private var announced = 0  // total the running announcement was made for
    private var announcedBase = -1
    private var nextMark = 0.25
    private var lastLine: UInt64 = 0
    public var tailAware = false

    public init(quietBelowTokens: Int, maxChunk: Int, sink: @escaping (String) -> Void) {
        self.quietBelowTokens = quietBelowTokens
        self.maxChunk = maxChunk
        self.sink = sink
    }

    /// Generator.onPrefillProgress: called after every pass with the tokens
    /// read so far this request, the tokens it will read, and elapsed seconds.
    public func report(done: Int, total: Int, elapsed: Double) {
        report(done: done, total: total, elapsed: elapsed, base: 0)
    }

    public func report(done: Int, total: Int, elapsed: Double, base: Int) {
        guard total >= quietBelowTokens, total > 0 else { return }
        if announced != total || announcedBase != base {
            announced = total
            announcedBase = base
            nextMark = 0.25
            let eta = PrefillSchedule.estSeconds(tokens: total, from: base, maxChunk: maxChunk, tailAware: tailAware)
            sink("prefill: reading \(total) prompt tokens, ~\(PrefillSchedule.describe(seconds: eta)) "
                + "to the first token at this plan (follow-up turns read only what is new)")
        }
        if done <= 0 { return }
        let frac = Double(done) / Double(total)
        if done >= total {
            let rate = elapsed > 0 ? Double(total) / elapsed : 0
            sink(String(format: "prefill: done, %d tokens in %@ (%.0f tok/s)",
                        total, PrefillSchedule.describe(seconds: elapsed), rate))
            announced = 0
            return
        }
        // One line per quarter, never more often than every 5 s.
        guard frac >= nextMark, lastLine == 0 || RuntimeClock.seconds(since: lastLine) >= 5 else { return }
        while nextMark <= frac { nextMark += 0.25 }
        lastLine = RuntimeClock.now()
        let rate = elapsed > 0 ? Double(done) / elapsed : 0
        let left = rate > 0 ? Double(total - done) / rate : 0
        sink(String(format: "prefill: %d/%d tokens (%.0f%%), ~%@ left",
                    done, total, frac * 100, PrefillSchedule.describe(seconds: left)))
    }
}

````

Applied delta `Sources/slotstream-cli/ContextCommands.swift`:

````diff
--- a/Sources/slotstream-cli/ContextCommands.swift
+++ b/Sources/slotstream-cli/ContextCommands.swift
@@ -28,12 +28,14 @@
 
     func run() throws {
         let tailAware = try InferenceOptimizations.environment().tailAwarePrefill
-        let passes = PrefillSchedule.passes(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
+        let compute = PrefillSchedule.computePasses(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
+        let passes = compute.map(\.tokens)
         let secs = PrefillSchedule.estSeconds(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
         if asJSON {
             let d: [String: Any] = [
                 "chunk": chunk, "tokens": tokens, "from": from,
                 "passes": passes, "pass_count": passes.count, "tail_aware": tailAware,
+                "compute_query_rows": compute.map(\.queryRows), "compute_key_extents": compute.map(\.keyExtent),
                 "est_seconds": secs.isFinite ? secs as Any : NSNull(),
                 "measured_query_key_product": PrefillSchedule.measuredQueryKeyProduct,
                 "min_chunk": PrefillSchedule.minChunk,
@@ -53,7 +55,8 @@
         print("  wait:   ~\(PrefillSchedule.describe(seconds: secs)) before the first token "
             + "(measured per-pass rates, see MEASUREMENTS.md)")
         print("  rule:   pass x context stays under \(PrefillSchedule.measuredQueryKeyProduct) "
-            + "(4096 x 8016, the largest measured), never below \(PrefillSchedule.minChunk)")
+            + "(4096 x 8016, the largest measured), including masked columns and padded query rows; "
+            + "full late passes can shrink to \(PrefillSchedule.minChunk), with shorter terminal tails")
     }
 }
 

````

Final source `/Users/carlos/Projects/slotstream/Sources/slotstream-cli/ContextCommands.swift` — SHA-256 `f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4`.

````text
// context-check: measure what a long prompt really costs on this Mac.
// prefill-schedule: the pass ladder and the wait it implies, no weights needed.

import ArgumentParser
import Foundation
import Slotstream

// MARK: prefill-schedule

struct PrefillScheduleCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefill-schedule",
        abstract: "Print the prefill passes a prompt runs and the wait they imply (no weights needed)")
    @Option(help: "Largest pass the plan allows (the `prefill:` line of the banner)")
    var chunk: Int = 4096
    @Option(help: "Prompt length in tokens") var tokens: Int = ContextPolicy.defaultTokens
    @Option(help: "Tokens already held by the state (a prefix-cache hit)") var from: Int = 0
    @Flag(name: .customLong("json"), help: "Machine-readable output") var asJSON = false

    func validate() throws {
        guard chunk >= 1, chunk <= 65_536 else { throw ValidationError("--chunk must be between 1 and 65536") }
        guard tokens >= 1 else { throw ValidationError("--tokens must be at least 1") }
        guard from >= 0, from <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - from else {
            throw ValidationError("--from plus --tokens must fit the pinned model limit of \(ContextPolicy.modelLimit)")
        }
    }

    func run() throws {
        let tailAware = try InferenceOptimizations.environment().tailAwarePrefill
        let compute = PrefillSchedule.computePasses(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
        let passes = compute.map(\.tokens)
        let secs = PrefillSchedule.estSeconds(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
        if asJSON {
            let d: [String: Any] = [
                "chunk": chunk, "tokens": tokens, "from": from,
                "passes": passes, "pass_count": passes.count, "tail_aware": tailAware,
                "compute_query_rows": compute.map(\.queryRows), "compute_key_extents": compute.map(\.keyExtent),
                "est_seconds": secs.isFinite ? secs as Any : NSNull(),
                "measured_query_key_product": PrefillSchedule.measuredQueryKeyProduct,
                "min_chunk": PrefillSchedule.minChunk,
            ]
            let data = try JSONSerialization.data(withJSONObject: d, options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
            return
        }
        // Collapse the ladder into runs: "4096 x1, 2048 x5, ..."
        var runs: [(Int, Int)] = []
        for p in passes {
            if let last = runs.last, last.0 == p { runs[runs.count - 1].1 += 1 } else { runs.append((p, 1)) }
        }
        print("reading \(tokens) tokens from position \(from) with a \(chunk)-token pass:")
        print("  passes: " + runs.map { "\($0.0) x\($0.1)" }.joined(separator: ", ")
            + " (\(passes.count) passes)")
        print("  wait:   ~\(PrefillSchedule.describe(seconds: secs)) before the first token "
            + "(measured per-pass rates, see MEASUREMENTS.md)")
        print("  rule:   pass x context stays under \(PrefillSchedule.measuredQueryKeyProduct) "
            + "(4096 x 8016, the largest measured), including masked columns and padded query rows; "
            + "full late passes can shrink to \(PrefillSchedule.minChunk), with shorter terminal tails")
    }
}

// MARK: context-check

/// Reads a synthetic prompt of N tokens through the real engine and reports
/// what it cost: seconds, tok/s, and the process RSS high-water against the
/// plan's expected peak. It watches reclaimable memory between passes and
/// stops before the machine swaps; it writes nothing, so a number it prints
/// becomes a MEASUREMENTS.md entry by a person, not by the tool.
struct ContextCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "context-check",
        abstract: "Measure what reading an N-token prompt costs on this Mac: time, tok/s, peak memory, and whether it stayed inside the plan")
    @OptionGroup var model: ModelOptions
    @Option(help: "Prompt length in tokens (rungs double from 2048 up to here with --ladder)")
    var tokens: Int = 8192
    @Option(help: "Required output tokens, reserved before loading") var replyTokens: Int = 16
    @Option(help: "Accepted request to first token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Option(help: "Independent wall-clock ceiling for each diagnostic rung") var wallSeconds = 7200.0
    @Flag(help: "Compatibility flag; context qualification always samples physical footprint every 20 ms")
    var sampleFootprint = false
    @Flag(help: "Run 2048, 4096, ... up to --tokens, stopping at the first rung that leaves the plan")
    var ladder = false
    @Flag(help: "Print the unqualified plan and exact runtime controls without loading an Engine")
    var planOnly = false
    @Option(help: "Retain this many distinct conversations and interleave follow-ups before the capacity request (0...4)")
    var warmConversations = 0
    @Option(help: "Prompt tokens in each retained warm-up conversation") var warmTokens = 2048
    @Option(name: .customLong("min-free-gb"),
            help: "Abort a pass when reclaimable memory falls below this (default: the planner's slack, 5% of RAM, at least 1.5 GB)")
    var minFreeGB: Double?
    @Flag(name: .customLong("json"), help: "Machine-readable output, one object per rung") var asJSON = false

    func validate() throws {
        guard tokens >= 16 else { throw ValidationError("--tokens must be at least 16") }
        guard replyTokens > 0, replyTokens < ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - replyTokens else {
            throw ValidationError("--tokens plus --reply-tokens must fit the model limit of \(ContextPolicy.modelLimit)")
        }
        _ = try ContextConfiguration(maxContextTokens: tokens + replyTokens,
            maxPrefillWaitMinutes: maxPrefillWait, qualification: true)
        guard wallSeconds.isFinite, wallSeconds > 0, wallSeconds <= 86_400 else {
            throw ValidationError("--wall-seconds must be finite, positive and at most 86400")
        }
        if let m = minFreeGB, !(m.isFinite && m >= 0) {
            throw ValidationError("--min-free-gb must be a finite number >= 0")
        }
        guard (0...PrefixCache.maxEntries).contains(warmConversations), warmTokens >= 16,
              warmTokens <= ContextPolicy.modelLimit - 4 else {
            throw ValidationError("--warm-conversations must be 0...4 and --warm-tokens must fit the model window with four tokens of follow-up room")
        }
        if warmConversations > 0 {
            guard !ladder, warmTokens <= tokens + replyTokens - 4 else {
                throw ValidationError("retained-context qualification requires one rung and warm-up plus follow-up room inside its configured window")
            }
        }
    }

    /// A deterministic filler that tokenizes densely and never repeats a
    /// sentence within the window, so the n-gram store cannot short-cut it.
    static func filler(tokens n: Int, conversation: Int = 0, tokenizer: (String) -> [Int]) -> [Int] {
        var text = conversation == 0 ? "Context check. " : "Context check conversation \(conversation). "
        var i = 0
        var nextCheck = 50
        while true {
            text += "Record \(i): the sensor on line \(i % 97) reported \(37 + (i * 31) % 500) units at "
                + "\(i % 24):\(String(format: "%02d", (i * 7) % 60)), and technician \((i * 13) % 1000) filed note \(i). "
            i += 1
            if i == nextCheck {
                let ids = tokenizer(text)
                if ids.count >= n { return Array(ids.prefix(n)) }
                nextCheck *= 2
            }
        }
    }

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let target = tokens
        let ladder = self.ladder
        let asJSON = self.asJSON
        let minFree = minFreeGB
        let plan = try model.announcedPlan(maxContext: target + replyTokens,
            prefixCacheEnabled: warmConversations > 0, maxPrefillWait: maxPrefillWait, qualification: true)
        if planOnly {
            let output: [String: Any] = [
                "kind": "unqualified-context-plan", "qualified": false,
                "plan": plan.json(), "model_revision": PinnedModel.revision,
                "warm_conversations": warmConversations, "warm_tokens": warmTokens,
                "optimizations": try JSONSerialization.jsonObject(
                    with: JSONEncoder().encode(InferenceOptimizations.environment())),
            ]
            print(String(decoding: try JSONSerialization.data(withJSONObject: output, options: [.sortedKeys]), as: UTF8.self))
            return
        }
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                // Missing observations must never compare equal and turn
                // an unobserved memory/swap interval into a passing result.
                engine.generator.footprintSampling = true
                // Cold rungs have no retained state. The separate retained
                // diagnostic deliberately fills and reuses four real states.
                engine.prefixCache.enabled = warmConversations > 0
                engine.prefixCache.drop()
                var rungs: [Int] = []
                if ladder {
                    var r = 2048
                    while r < target { rungs.append(r); r *= 2 }
                }
                rungs.append(target)
                let slack = minFree ?? Planner.availabilitySlackGB(ramGB: plan.ramGB)
                let all = Self.filler(tokens: rungs.max()!) { engine.tokenizer.encode(text: $0) }
                let progress = PrefillProgressReporter(
                    quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                }
                progress.tailAware = engine.model.optimizations.tailAwarePrefill
                engine.generator.onPrefillProgress = progress.report
                let retainedStarted = RuntimeClock.now()
                var warmup: [[String: Any]] = []
                var warmupFailure: String?
                var warmInputs: [[Int]] = []
                var warmOutputs: [[Int]] = []
                if warmConversations > 0 {
                    for conversation in 1...warmConversations {
                        warmInputs.append(Self.filler(tokens: warmTokens, conversation: conversation) {
                            engine.tokenizer.encode(text: $0)
                        })
                    }
                    // Complete all first turns before revisiting each client;
                    // this proves interleaving rather than immediate reuse.
                    for phase in 0...1 {
                        for (index, initial) in warmInputs.enumerated() {
                            var ids = initial
                            var expectedReuse = 0
                            if phase == 1 {
                                guard let retained = engine.prefixCache.peek(extending: Array(initial.dropLast())),
                                      retained.starts(with: initial) else {
                                    warmupFailure = "warm conversation \(index) was evicted before its interleaved follow-up"
                                    break
                                }
                                expectedReuse = retained.count
                                ids = initial + warmOutputs[index] + [1000 + index]
                                guard ids.starts(with: retained) else {
                                    warmupFailure = "retained state differs from the conversation's actual completed delivery"
                                    break
                                }
                            }
                            var params = SampleParams.greedy; params.maxTokens = 1
                            let control = try engine.beginRequest()
                            let delivery = engine.generate(promptIds: ids, params: params, shouldContinue: {
                                if RuntimeClock.seconds(since: retainedStarted) >= wallSeconds {
                                    warmupFailure = "retained diagnostic wall-clock ceiling exceeded"
                                    control.cancel(); return false
                                }
                                if let available = Planner.deviceAvailableGB(), available < slack {
                                    warmupFailure = "warm-up reclaimable memory fell below the frozen slack"
                                    control.cancel(); return false
                                }
                                return true
                            }, request: control)
                            let stats = delivery.stats
                            if phase == 0 { warmOutputs.append(delivery.ids) }
                            let complete = stats.runtimeError == nil && !stats.memoryPressureCancelled
                                && stats.prefillTokens == ids.count - expectedReuse
                                && stats.reusedPrefixTokens == expectedReuse && delivery.ids.count == 1
                                && stats.decodeTokens == 1
                            let noSwap = stats.generatorVMBefore != nil && stats.generatorVMAfter != nil
                                && stats.generatorVMBefore?.swapins == stats.generatorVMAfter?.swapins
                                && stats.generatorVMBefore?.swapouts == stats.generatorVMAfter?.swapouts
                            let peak = max(stats.peakMemoryGB, Double(stats.sampledFootprint?.peakBytes ?? 0) / 1e9)
                            let observed = (stats.sampledFootprint?.samples ?? 0) > 0
                                && (stats.sampledFootprint?.peakBytes ?? 0) > 0 && stats.lifetimeRSSPeakBytes > 0
                            let fits = complete && noSwap && observed && peak <= plan.expectedPeakGB && warmupFailure == nil
                            warmup.append([
                                "conversation": index, "phase": phase, "prompt_ids": ids,
                                "output_ids": delivery.ids, "text": delivery.text, "expected_reuse": expectedReuse,
                                "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)),
                                "retained": engine.prefixCache.json(), "fits": fits,
                            ])
                            if !fits {
                                warmupFailure = warmupFailure ?? "retained warm-up failed completion, reuse, memory or swap contract"
                                break
                            }
                        }
                        if warmupFailure != nil { break }
                    }
                }
                let retainedBefore = engine.prefixCache.json()
                if let failure = warmupFailure {
                    let output: [String: Any] = ["kind": "retained-context-warmup-failure",
                        "fits": false, "aborted": failure, "warmup": warmup,
                        "retained_before": retainedBefore, "main_request_started": false]
                    print(String(decoding: try JSONSerialization.data(withJSONObject: output, options: [.sortedKeys]), as: UTF8.self))
                    throw PlanError(failure)
                }
                var fitsSoFar = true
                for n in rungs {
                    let ids = Array(all.prefix(n))
                    var aborted: String?
                    var params = SampleParams.greedy
                    params.maxTokens = replyTokens
                    let control = try engine.beginRequest()
                    let rungStarted = warmConversations > 0 ? retainedStarted : RuntimeClock.now()
                    var timings: [[String: Any]] = []
                    var previousDone = 0, previousElapsed = 0.0
                    var lastProgressSeconds = 0.0
                    engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
                        guard done > previousDone else { return }
                        timings.append(["from": base + previousDone, "tokens": done - previousDone,
                            "seconds": elapsed - previousElapsed])
                        previousDone = done; previousElapsed = elapsed
                        if elapsed - lastProgressSeconds >= 30 {
                            FileHandle.standardError.write(Data("  context-check progress: \(done)/\(total) missing tokens committed\n".utf8))
                            lastProgressSeconds = elapsed
                        }
                    }
                    let (text, outputIds, stats) = engine.generate(
                        promptIds: ids, params: params,
                        shouldContinue: {
                            if RuntimeClock.seconds(since: rungStarted) >= wallSeconds {
                                aborted = "diagnostic wall-clock ceiling exceeded"
                                control.cancel(); return false
                            }
                            // The guard: stop before the machine pays in swap.
                            if let a = Planner.deviceAvailableGB(), a < slack {
                                aborted = String(format: "reclaimable memory fell to %.1f GB (floor %.1f)", a, slack)
                                return false
                            }
                            return true
                        }, request: control)
                    engine.generator.onPrefillProgressAbsolute = nil
                    let retainedAfter = engine.prefixCache.json()
                    engine.dropPrefixCache()
                    let peak = max(stats.peakMemoryGB, Double(stats.sampledFootprint?.peakBytes ?? 0) / 1e9)
                    let completed = stats.runtimeError == nil && !stats.memoryPressureCancelled
                        && stats.prefillTokens == n && stats.decodeTokens == replyTokens
                    let noSwap = stats.generatorVMBefore != nil && stats.generatorVMAfter != nil
                        && stats.generatorVMBefore?.swapins == stats.generatorVMAfter?.swapins
                        && stats.generatorVMBefore?.swapouts == stats.generatorVMAfter?.swapouts
                    let observed = (stats.sampledFootprint?.samples ?? 0) > 0
                        && (stats.sampledFootprint?.peakBytes ?? 0) > 0 && stats.lifetimeRSSPeakBytes > 0
                    let fits = aborted == nil && completed && observed && peak <= plan.expectedPeakGB && noSwap
                    let verdict: String
                    if let a = aborted {
                        verdict = "ABORTED at \(stats.prefillTokens) tokens: \(a)"
                    } else if !completed {
                        verdict = "INCOMPLETE: \(stats.runtimeError ?? "prompt or reply did not complete")"
                    } else if !noSwap || !observed {
                        verdict = "EXCLUDED: swap activity or missing memory observations during the request"
                    } else if fits {
                        verdict = "OK"
                    } else {
                        verdict = String(format: "OVER the plan by %.1f GB", peak - plan.expectedPeakGB)
                    }
                    if asJSON {
                        let d: [String: Any] = [
                            "text": text, "output_ids": outputIds,
                            "tokens": n, "reply_tokens": replyTokens, "configured_context": plan.maxContextTokens, "prompt_ids": ids, "prefill_tokens": stats.prefillTokens,
                            "prefill_seconds": stats.prefillSeconds, "prefill_tok_s": stats.prefillTPS,
                            "peak_rss_gb": Double(stats.lifetimeRSSPeakBytes) / 1e9,
                            "process_peak_bound_gb": peak,
                            "plan_expected_peak_gb": plan.expectedPeakGB,
                            "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)),
                            "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
                            "prefill_chunk": engine.generator.prefillChunk,
                            "pass_timings": timings,
                            "passes": stats.prefillPasses,
                            "compute_passes": stats.prefillComputePasses,
                            "compute_key_extents": stats.prefillComputeKeyExtents,
                            "compute_query_rows": stats.prefillComputeQueryRows,
                            "memory_ledger": plan.memoryLedger.json,
                            "warmup": warmup, "retained_before": retainedBefore, "retained_after": retainedAfter,
                            "model_revision": PinnedModel.revision,
                            "fits": fits, "aborted": aborted ?? NSNull(),
                            "verdict": verdict,
                        ]
                        let data = try JSONSerialization.data(withJSONObject: d, options: [.sortedKeys])
                        print(String(decoding: data, as: UTF8.self))
                    } else {
                        print(String(
                            format: "context-check %6d tokens: %@ in %@ (%.0f tok/s), peak RSS %.1f GB vs plan %.1f GB — %@",
                            n, aborted == nil ? "read" : "stopped",
                            PrefillSchedule.describe(seconds: stats.prefillSeconds), stats.prefillTPS,
                            peak, plan.expectedPeakGB, verdict))
                    }
                    if !fits {
                        fitsSoFar = false
                        break
                    }
                }
                if !asJSON {
                    let cap = ContextPolicy.maxTokens
                    if fitsSoFar {
                        print("verdict: \(target) prompt tokens plus \(replyTokens) output tokens completed inside the plan on this Mac. "
                            + "Ordinary serving defaults to \(ContextPolicy.defaultTokens); its implementation ceiling remains \(cap). "
                            + "A larger supported window requires an explicit --max-context. Diagnostic success does not raise that ceiling.")
                    } else {
                        print("verdict: the plan does not cover this prompt length here; lower --tokens, raise "
                            + "--memory-gb if the machine has room, or close other apps and retry.")
                    }
                }
                result = fitsSoFar ? .success(()) : .failure(PlanError("context qualification failed; preserved output contains the incomplete or over-budget rung"))
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

````

Applied delta `Sources/SlotstreamDiagnostics/Diagnostics+Context.swift`:

````diff
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift
@@ -155,6 +155,14 @@
         c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
         c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
         c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
+        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
+        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
+        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
+            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
+        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
+        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
+        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
+        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)
 
         var tick: UInt64 = 0
         var available = 10.0

````

Final source `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift` — SHA-256 `f4419fbe8e88de30cec00761fad4507e41ce611ffe4cef2f87175c7423e7e4b5`.

````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. Restart planning and a settled governor
        // must agree across cap, retention, mode and availability changes.
        var governorCaps = Set<Int>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        return c.report()
    }
}

````

