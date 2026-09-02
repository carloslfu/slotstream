---
type: claim
id: 01m1hhwp9bcxgxbxpf625s0tms
created: 2026-09-02T17:15:28.427501+00:00
updated: 2026-09-02T17:15:28.427501+00:00
summary: Auto turns speculative decode on only when the cache still reaches 120 experts per layer after the head, a 28 GB target
basis: measured
gate: Tools/planner_gates.sh
needle: 28 GB target
supported_by:
- '[[records/measurements/where-it-pays-measured-at-every-cache-size-that-fit-2026-09-01-redone]]'
- '[[records/measurements/depth-and-the-plateau-a-b-that-moved-the-default-from-4-to-1-2026-09-02]]'
surfaces: README.md, docs/CLI.md, llms.txt, docs/HARDWARE.md
title: Auto turns speculative decode on only when the cache still reaches 120 experts per layer after the head, a 28 GB target
status: current
---

The ladder below 120 per layer read ×0.55 to ×0.96, all a loss; 28 GB is the target at which the cache still reaches 120 after the head's 1.6 GB (the "~26 GB" once quoted was never read off doctor and is corrected). planner_gates.sh checks the floor.
