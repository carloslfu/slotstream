---
type: decision
meta-type: conclusion
id: 01m3137p9t37ymrdtykjyzkw11
created: 2026-09-21T04:22:52.986026+00:00
updated: 2026-09-21T15:39:18.469892+00:00
summary: Custom process ceilings remain adaptive above the automatic default; hardware headroom, diagnostics and startup agree.
decided_on: 2026-09-20
reversible_if: Measured allocation or completed-work failures invalidate the supported margins, or user testing shows the ceiling semantics are misleading.
title: Adaptive memory limits
status: standing
---
# Adaptive memory limits

Carlos requested the memory-control fixes on September 20, 2026. Keep the measured automatic default; remove its use as a universal ceiling for user-selected budgets.

The Mac app uses a saved total-process ceiling through `PlanRequest.memoryLimitGB`. The additive CLI option is `--memory-limit-gb`. Both remain automatic plans: they shrink under contention and can recover within the saved ceiling. The current target and actual process footprint are distinct from that ceiling. Cache size does not change model knowledge or output arithmetic.

The adaptive ceiling replaces the model-specific automatic ceiling and its default RAM share. An explicitly supplied `--max-ram-percent` can restrict it further. The planner still keeps the existing Metal recommendation minus 2 GB and physical RAM minus the availability slack; live reclaimable memory minus that slack can lower the current target. These are conservative supported operating bounds, not proof that Apple's recommendation is a hard allocation maximum. The UI rounds its hardware maximum down to half a GB and keeps that range stable when other apps open. The CLI can accept a higher ceiling and explains the smaller supported target. Limits include resident components, context, prefix retention, temporary workspace and expert cache; optional heads and context cannot silently raise a custom ceiling.

A first switch to Custom adopts the current target, or the current recommendation before loading. Later switches retain the last selected value. Preference decoding migrates the former unused automatic 10 GB placeholder, preserves explicit custom values, and accepts saved values above the old automatic ceiling. Changes wait until the current response completes. The app labels the current budget separately from measured app memory.

Existing `--memory-gb`, `--pool-gb` and `--experts-per-layer` remain fixed-cache controls. Combining any with the adaptive option is refused before loading. `--no-elastic` can still pin an otherwise adaptive server. The planner carries the original ceiling through context selection, runtime reservations, vision loading and governor updates. A governor resize publishes its newly available target rather than retaining the startup target.

Diagnostics and budgeted startup share `Planner.validateMemoryBudget`, including ordinary context sizes. The engine checks again using live memory before allocation. Legacy raw cache knobs keep their documented advisory Metal behavior and live allocation checks; they are not a shortcut into the adaptive mode.

`Tools/context_proxy.swift` covers ceiling propagation, growth, physical bounds, preserved defaults and startup/diagnostic parity. `Tools/memory_override_gate.py` exercises the public CLI across hardware sizes, limits and availability. The native performance checks cover larger limits, preference migration, first use, persistence, deferred changes and recovery; `Tools/check_sevra_memory_ui.sh` renders production settings in both appearances without loading a model. These are software and UX gates, not new hardware speed measurements.

Retain the current automatic default until comparable workloads justify changing it. Expanding the supported Metal margin or hardware envelope needs bounded real allocation and completed-work evidence; a larger input control alone does not qualify hardware. See [[records/design/measured-operating-policies]] and [[records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram]].

Verification and retained raw outputs: [[sources/runs/2026/09/2026-09-20-adaptive-memory-limits]]. This is development qualification on the 48 GiB Mac, with larger hardware tested through simulation only. No release is implied.

## Adversarial review correction, September 21

A public-server reproduction found that the context setter copied the plan without its adaptive ceiling. This escaped the initial direct-engine tests. The setter now preserves the ceiling, and both the public server lifecycle gate and the full governor drill exercise that path before any recovery is allowed. The public gate observes the production timer past startup cooldown and completes a real request; the bounded drill verifies shrink, cooldown, full recovery and exact output.

The review also added adaptive limits to `launch`, including forwarding, status metadata and explicit notes when an existing server retains different settings. Fixed-profile diagnostics reject unsupported adaptive flags instead of ignoring them. Simulated unconstrained availability stays independent of the host. Invalid hand-built budgets fail shared validation. Saved native values above the current hardware range remain visible with a correction prompt.

The complete follow-up evidence, including the original counterexample, passing checks, corrected test fixtures and hardware limits, is [[sources/runs/2026/09/2026-09-21-adaptive-memory-adversarial-review]]. It supersedes confidence based solely on the initial direct-engine drill. This remains development qualification, without a real allocation test on a 64 GiB Mac or a release claim.

## Second review correction, September 21

The second pass found a separate recovery gap. A small cache could remain below the fully affordable supported budget indefinitely because its missing capacity was smaller than the normal growth band. This affects both a busy startup and a later pressure donation. The governor now completes growth to the supported ceiling when the fresh plan is no longer availability-clamped. It still requires both cooldowns and all physical/ceiling checks. While availability continues to clamp the plan, the normal growth band remains. This avoids extra recovery state and does not infer that every transient increase in free memory should cause an allocation. Revisit this exception if measured resize churn appears; the small-cache and full live drills must retain exact output and bounded process memory.

The same pass preserves exact fractional target values in JSON and launch arguments, explains the reachable hardware/RAM-share bound while busy, explicitly logs disabled elasticity, and records a response's saved ceiling separately from its current budget. Historical response records with no ceiling remain readable and do not invent one.

Evidence and corrected fixtures are [[sources/runs/2026/09/2026-09-21-adaptive-memory-second-review]]. This is development qualification, not a published release or real allocation qualification on a 64 GiB Mac.

## Third review correction, September 21

The embedding API needs exact legacy overloads as well as default argument compatibility. Adding an optional parameter still changes a function value's type. The original PlanRequest, MemoryPlan and GovernorPolicy.Inputs initializers and all three loose Planner.plan signatures now delegate to the adaptive implementation with no saved ceiling. Adaptive overloads require that parameter explicitly. The external package consumer and pure contracts compile every legacy signature; ordinary fixed and adaptive calls continue to use the same planner.

Directly constructed adaptive plans must use the automatic source and a finite positive target within their saved finite limit. Shared validation, actual Engine startup and vision replanning reject contradictory plans before model allocation. Image and inference admission include the saved ceiling. The three original counterexamples are an above-limit target, a missing target and a fixed-pool source; the external consumer proves real Engine rejection without opening a checkpoint.

Evidence: [[sources/runs/2026/09/2026-09-21-adaptive-memory-third-review]]. The rebuilt CLI matrix, pure policy contracts, general test groups, external package and native policy/persistence checks pass. Another task retained the model lock throughout the bounded live-rerun wait, so this pass does not claim a new server run. Previous live recovery and UI evidence remains separately identified. No release or real 64 GiB allocation qualification is implied.

## Commit isolation and next release, September 21

The memory changes are isolated from concurrent parser, conversation-cache and serving diagnostics work. A clean optimized local build and the exact isolated CLI pass the policy, command-line and general checks. The previously blocked fractional-ceiling server rerun also passes on that binary and reaps its process. Evidence: [[sources/runs/2026/09/2026-09-21-adaptive-memory-commit]].

The changes are queued under Unreleased for the next release, without a promised date or version. The user authorized committing and pushing to main and explicitly withheld release authorization. No version bump, release tag or publication is part of this delivery.
