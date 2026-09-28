---
type: decision
id: 01m33yvaaebw3nfwh2bmm0byds
created: 2026-09-22T07:03:56.494340+00:00
updated: 2026-09-22T07:03:56.494340+00:00
summary: Keep existing decode barriers and remove the unhelpful fusion prototype
decided_on: 2026-09-22
evidence: '[[records/measurements/decode-opportunities-2026-09-22]]'
reversible_if: A changed mechanism/backend demonstrates at least 3% repeatable paired request-level gain at the intended memory profile with exact outputs/state, matched work, bounded memory and preserved exclusions.
title: Keep existing decode barriers and remove the unhelpful fusion prototype
status: standing
---
The September 22 current-backend recheck does not qualify either remaining decode proposal for a new production default.

Keep the existing layer-barrier policy: one layer for the unqualified plain-decode path, the already qualified four-layer path with lookahead, and the explicit override. Do not broaden it from a small, inconsistent signal measured at a 10 GB target. This does not retract the historical larger-budget or lookahead qualification.

Remove the restored hyper-connection fusion prototype and control. It is exact in the tested main-model states but slightly slower for the relevant three-row verification pass in both eligible long-context runs. Preserve its source and negative results so a future backend change can be tested without reconstructing the experiment.

Retain diagnostic improvements: bounded prefix reconstruction, proven all-hit per-mode timing, raw timing-window observations, a deployed-state barrier comparison and lifecycle assertions for both current aligned reuse and the legacy policy. These add no instrumentation to normal inference.

The failed timing qualification is not a claim that no workload can benefit. Reopen with a concrete mechanism or changed backend and a prospective paired experiment at the intended memory profile. Require meaningful repeatable request-level gain, exact output/state checks, matched work and memory, and preserved exclusions before changing automatic behavior. A component microbenchmark alone is insufficient.

Evidence: [[records/measurements/decode-opportunities-2026-09-22]]. The prior host-time interpretation remains governed by [[records/decisions/decode-host-time-is-waiting-not-graph-construction]].
