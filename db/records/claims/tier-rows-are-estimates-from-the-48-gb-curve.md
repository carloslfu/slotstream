---
type: claim
id: 01m1hhwp6pvmv6ewjddfjm9xmc
created: 2026-09-02T17:15:28.342139+00:00
updated: 2026-09-13T16:42:28.558061+00:00
summary: Small-memory planner estimates use the M5 Pro curve; README has broader ranges
basis: estimated
gate: Tools/planner_gates.sh
needle: ~4 tok/s
supported_by:
- '[[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]]'
- '[[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]]'
surfaces: llms.txt, docs/HARDWARE.md
title: Small-memory planner estimates use the M5 Pro curve
status: current
---
The rows come from `slotstream doctor --sim-ram N`, which interpolates the re-anchored decode curve and the 33 GB knee. Every surface must keep calling them estimates. planner_gates.sh checks the simulated plans, not the tok/s.

**Contradicted for the 16 GB row, 2026-09-02.** The first real 16 GB machine
measured 1.41 tok/s where this row estimates ~4:
[[records/measurements/c1-mac-mini-m2-16gb-base-storage-community-2026-09-02]].
The claim itself still holds — the rows *are* estimates, and every surface
still says so — but the curve they come from is a function of experts per
layer with no term for read bandwidth, and on a 1.5 GB/s disk the IO floor
alone (501 ms per token) is below the time the estimate promises. Calling
them estimates is no longer sufficient on its own; the surfaces now also say
how far off one has been measured to be. A bandwidth term in the planner
would retire this gap rather than annotate it.

The original wording of the first paragraph said "only the 48 GB row is a run
on real hardware"; that clause is removed rather than preserved because it
duplicated the separately withdrawn claim
[[records/claims/only-the-48-gb-row-is-measured-on-real-hardware]], now
replaced by [[records/claims/two-tier-rows-are-measured-on-real-macs]].
**Updated 2026-09-13.** The tables follow five memory tiers and README.md carries them too. The 8 GB row is gone because every 8 GB plan is refused ([[records/claims/minimum-mac-memory-16-gb]]). Rows with speculative decoding use measurements instead of the curve: [[records/claims/tier-estimate-10-tok-s-at-32-gb]] and [[records/claims/warm-decode-13-5-tok-s-with-the-decode-lookahead]].

## Evidence correction, 2026-09-13

The README now places the named community results beside the estimates in
the Low and Medium tiers and uses named measured configurations for High and
Ultra. The hardware guide keeps the auto allocation plans separate from its
measured results and shows uncalibrated larger-cache speeds explicitly.
The 13.5 tok/s reference supports its measured M5 Pro configuration only;
it no longer supplies a flat prediction for every larger-memory tier.

## Planning-range follow-up, 2026-09-13

The README's original point estimates are now replaced by rough ranges
combining real reports and existing M5 Pro references. The ~4 tok/s point
estimate remains in llms.txt and the hardware guide with its limitations;
it no longer owns the README range table. Construction and unmeasured
hardware transfers are in
[[records/measurements/hardware-planning-ranges-2026-09-13]].
