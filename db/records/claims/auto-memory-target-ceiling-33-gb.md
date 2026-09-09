---
type: claim
meta-type: conclusion
id: 01m245ecdk71ab1kfpd9kw9zg5
created: 2026-09-09T22:43:30.867975+00:00
updated: 2026-09-09T22:59:04.556748+00:00
summary: Automatic sizing has an intentional 33 GB base target ceiling, with explicit overrides and measurement-led revisions.
basis: derived
gate: Tools/planner_gates.sh
needle: 33 GB
supported_by: '[[records/measurements/automatic-memory-default-evidence-scope-2026-09-09]]'
surfaces: README.md, docs/ENGINEERING.md, docs/CLI.md
title: Automatic memory target ceiling is 33 GB
status: current
---
The automatic planner caps its base total-process target at 33 GB, then applies the RAM-share, Metal working-set and live-availability bounds. The optional draft head has its separately registered charge. This is an intentional sizing policy, not a hard limit on explicit targets or a measured universal optimum.

The verified cache ladder in [[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]] shows diminishing returns near its largest clean measurements. The larger-target sweep in [[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]] inspected planner estimates whose decode curve was already held flat; it does not independently establish the performance of those larger allocations.

The README recommends the current default, shows a manual target as an example rather than a measured configuration, and commits to adjusting the default when real hardware/workload measurements justify a better tradeoff. See [[records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram]]. No runtime policy changed and no new performance measurement is claimed.
