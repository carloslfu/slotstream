---
type: claim
id: 01m1hhwp5smymf1hs6fj0c6fk3
created: 2026-09-02T17:15:28.313227+00:00
updated: 2026-09-02T17:15:28.313227+00:00
summary: Peak memory at the auto plan is 32 GB on the dev Mac
basis: measured
gate: none
needle: 32 GB
supported_by:
- '[[records/measurements/the-auto-memory-target-70-of-ram-was-the-wrong-shape-2026-08-31]]'
surfaces: README.md, docs/HARDWARE.md
title: Peak memory at the auto plan is 32 GB on the dev Mac
status: current
---

The GB-at-a-time sweep of 2026-08-31 put the knee at a 33 GB target and measured the peak the plan announces; the README hero table and the HARDWARE.md row both carry 32 GB. The needle also matches the 32 GB tier row, so this gate is weaker than it looks: the number to watch is the hero table.
