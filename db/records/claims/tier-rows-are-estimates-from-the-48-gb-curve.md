---
type: claim
id: 01m1hhwp6pvmv6ewjddfjm9xmc
created: 2026-09-02T17:15:28.342139+00:00
updated: 2026-09-02T17:15:28.342139+00:00
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

The rows come from `slotstream doctor --sim-ram N`, which interpolates the re-anchored decode curve and the 33 GB knee; only the 48 GB row is a run on real hardware. Every surface must keep calling them estimates. planner_gates.sh checks the simulated plans, not the tok/s.
