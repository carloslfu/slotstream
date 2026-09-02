---
type: decision
id: 01m1hhwphxd76wk482gpha1k3x
created: 2026-09-02T17:15:28.701045+00:00
updated: 2026-09-02T17:15:28.701045+00:00
summary: Auto targets the 33 GB knee of the measured curve, never a share of RAM above it
decided_on: 2026-08-31
evidence:
- '[[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]]'
reversible_if: a GB-at-a-time sweep above 34 GB decodes or prefills faster
title: Auto targets the 33 GB knee of the measured curve, never a share of RAM above it
status: standing
---

Nothing between 34 and 84 GB decoded or prefilled any faster, so a 128 GB Mac gets the same plan a 48 GB one does; 70% of RAM remains only as a lower bound for other apps. The planner must also never plan slower with more RAM.
