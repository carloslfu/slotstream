---
type: claim
id: 01m1hhwp6pvmv6ewjddfjm9xmc
created: 2026-09-02T17:15:28.342139+00:00
updated: 2026-09-03T04:00:53.249192+00:00
summary: The 8, 16, 24, and 32 GB tier rows are estimates from the 48 GB curve
basis: estimated
gate: Tools/planner_gates.sh
needle: ~4 tok/s
supported_by:
- '[[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]]'
- '[[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]]'
surfaces: README.md, llms.txt
title: The 8, 16, 24, and 32 GB tier rows are estimates from the 48 GB curve
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
