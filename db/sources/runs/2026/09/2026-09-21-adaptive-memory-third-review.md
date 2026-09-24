---
type: run
meta-type: fact
created: 2026-09-21T06:18:03.607466+00:00
updated: 2026-09-21T06:18:03.607466+00:00
summary: Third memory review repairs Swift callable compatibility and contradictory direct adaptive plans, with external-package and engine-startup regressions.
binary: 7a4ae53bb0ce8e1fbdeb0df7f83685cea7c7b28e341a779814fb6e6fa48d0694
captured_at: 2026-09-21
command: Exact commands and raw outputs below and in the evidence archive
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Adaptive memory third adversarial review
tool: source review, external package consumer, policy contracts, public CLI and native runtime checks
---
# Adaptive memory third review

This extends [[sources/runs/2026/09/2026-09-21-adaptive-memory-second-review]]. It re-traces saved-limit references, plan constructors and transformations through CLI validation, launch/reuse, diagnostics, context selection, startup, vision admission, inference, governor recovery, native settings and persisted response details. The new concrete defects are at the Swift embedding boundary; ordinary CLI/app planner calls did not construct the malformed plans.

## Findings and corrections

Adding a defaulted parameter changes a Swift function's full type. The first reproduction failed to compile original function-value references, even though ordinary calls still compiled. The existing external consumer's loose planner reference also exposed this regression. Preserve all six old callable signatures: the three initializers for PlanRequest, MemoryPlan and GovernorPolicy.Inputs, and the three loose Planner.plan overloads. Their wrappers delegate with no adaptive limit. New adaptive overloads require that argument explicitly, avoiding ambiguity in ordinary calls that omit it.

A manually constructed plan could pair a 10 GB adaptive ceiling with an 11 GB target, no target, or a fixed-pool source and still pass shared validation when the cache itself was small. The before-policy reproduction has exactly three new failed assertions. Shared adaptive-policy validation now requires an automatic source and a finite positive target within the finite saved ceiling. Engine startup applies that validation even to a conflicting source, and vision replanning validates before its early return. Image and inference admission also include the saved ceiling in their comparisons.

The external consumer compiles through actual package products, checks all six legacy callable types, and constructs all three malformed plans through the real Engine initializer with a nonexistent checkpoint path. Each is rejected as an invalid adaptive policy before a model is opened. This check loads no weights.

## Evidence and results

[Raw archive](../../../artifacts/adaptive-memory-third-review-2026-09-21/evidence.tar.gz) preserves the before-fix counterexamples, source snapshots, audit matrix, build logs and final reports. [Manifest](../../../artifacts/adaptive-memory-third-review-2026-09-21/manifest.json) records member hashes and lengths; all members were reopened and verified. Executables and model weights are excluded.

Frozen CLI: `.build/memory-review3-final-0vxi9m7d/slotstream`, SHA-256 `7a4ae53bb0ce8e1fbdeb0df7f83685cea7c7b28e341a779814fb6e6fa48d0694`. The final pure-policy source hashes match the checkout. The checkout also contains concurrent unrelated work; HEAD at evidence capture is `859c28ef7991c96d1e7e9805c347aabd5edd41d8`, and the tested dirty sources are recorded independently. This receipt does not certify unrelated changes.

Final software results: 420 public CLI cases; 964828 pure assertions, including 591 memory assertions; 56 T0 groups and 29478 assertions, with no failures or skips. The external package passes. Native policy and response-persistence checks pass. Harness checks pass for consumer cleanup (4), planner harness (7), and verification dispatch (22). Claims, generated projections and whitespace checks pass.

The optional repeated public-server check was not run: another task held the normal model lock throughout the bounded two-minute wait. No process was interrupted and no lock was bypassed. This is an explicit gap in the third-pass rerun, not a passing live result.

The previous receipt retains the completed small/full shrink-and-recovery drills, fractional and pinned server requests, real native deferred change/reload/idle lifecycle, and eight light/dark UI renders. Those are prior results, not newly repeated tests. This pass changes API overloads and validation, not the governor's growth decision or native UI implementation. New native policy checks exercise the changed planning API.

Commands from the repository root:

```sh
python3 Tools/context_proxy.py --out /tmp/memory-review3-final-proxy
bash Tools/consumer_smoke.sh
swift build -c release --product slotstream -j 2
python3 Tools/memory_override_gate.py --binary .build/memory-review3-final-0vxi9m7d/slotstream --out /tmp/memory-review3-cli.json
swift build -c release --product slotstream-checks -j 2
.build/release/slotstream-checks --tier t0 --json
swift build --package-path apps/macos --product sevra-mac-checks -j 2
apps/macos/.build/debug/sevra-mac-checks --performance
apps/macos/.build/debug/sevra-mac-checks --response-details
python3 /tmp/memory-review3-live-driver.py
```

The bounded live driver, exact child command if launched, and result ride in the archive. Reclaimable-memory preflights precede builds; the optional server gate also checks real headroom and the shared model lock. No memory hog is used. Larger hardware is simulated. Real allocation on a 64 GiB Mac, the complete release battery, and a published release remain outside this evidence.

## External package

```text
consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 22 assertions
```

## Native policy

```text
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
```

## Native response details

```text
PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows
PASS: a thinking job records exact per-round numbers, a refused round counts, thoughts keep one step per round, numbers persist without text, older runs still decode, live speed while thinking and writing, notes for the eight most recent runs
```

## Live rerun status

```text
{"attempted": false, "reason": "Normal model lock remained occupied by another task for the bounded two-minute wait; no process interrupted."}
```

## Original callable-type failure

```text
/tmp/memory-review3-compat-before/Compat.swift:4:177: error: cannot convert value of type '(PlanRequest, Machine, Bool, Bool) throws -> MemoryPlan' to specified type '(Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan'
2 | @main enum Compat {
3 |  static func main() {
4 |   let oldPlanner: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
  |                                                                                                                                                                                 `- error: cannot convert value of type '(PlanRequest, Machine, Bool, Bool) throws -> MemoryPlan' to specified type '(Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan'
5 |   let oldRequest: (Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest = PlanRequest.init
6 |   _ = (oldPlanner, oldRequest)

/tmp/memory-review3-compat-before/Compat.swift:4:177: error: cannot convert value of type '(PlanRequest, Machine, Bool, Bool) throws -> MemoryPlan' to specified type '(Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan'
2 | @main enum Compat {
3 |  static func main() {
4 |   let oldPlanner: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
  |                                                                                                                                                                                 `- error: cannot convert value of type '(PlanRequest, Machine, Bool, Bool) throws -> MemoryPlan' to specified type '(Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan'
5 |   let oldRequest: (Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest = PlanRequest.init
6 |   _ = (oldPlanner, oldRequest)

/tmp/memory-review3-compat-before/Compat.swift:5:124: error: invalid conversion from throwing function of type '(any Decoder) throws -> PlanRequest' to non-throwing function type '(Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest'
3 |  static func main() {
4 |   let oldPlanner: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
5 |   let oldRequest: (Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest = PlanRequest.init
  |                                                                                                                            `- error: invalid conversion from throwing function of type '(any Decoder) throws -> PlanRequest' to non-throwing function type '(Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest'
6 |   _ = (oldPlanner, oldRequest)
7 |  }

/tmp/memory-review3-compat-before/Compat.swift:5:124: error: cannot convert value of type '(any Decoder) throws -> PlanRequest' to specified type '(Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest'
3 |  static func main() {
4 |   let oldPlanner: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
5 |   let oldRequest: (Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest = PlanRequest.init
  |                                                                                                                            `- error: cannot convert value of type '(any Decoder) throws -> PlanRequest' to specified type '(Int?, Double?, Double?, Double?, Planner.MTPMode, Planner.VisionMode, Int) -> PlanRequest'
6 |   _ = (oldPlanner, oldRequest)
7 |  }
```

## Malformed-plan counterexample

```text
{"assertions":964822,"failures":["M01: inconsistent hand-built adaptive policy is refused","M01: inconsistent hand-built adaptive policy is refused","M01: inconsistent hand-built adaptive policy is refused"],"gates":{"C01":12,"C02":4152,"C03":7,"C04":1221,"C05":77,"C06":958624,"C08":5,"C09":11,"C10":19,"C13":13,"C14":12,"C15":16,"C23":68,"M01":585},"hardware_qualified":false,"model_loaded":false,"passed":false}
```

## Final pure policy

```text
{"assertions":964828,"failures":[],"gates":{"C01":12,"C02":4152,"C03":7,"C04":1221,"C05":77,"C06":958624,"C08":5,"C09":11,"C10":19,"C13":13,"C14":12,"C15":16,"C23":68,"M01":591},"hardware_qualified":false,"model_loaded":false,"passed":true}
```
