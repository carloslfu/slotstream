---
type: claim
id: 01m2dg6wm85kkqevg0ae5nabjg
created: 2026-09-13T13:44:49.544379+00:00
updated: 2026-09-13T13:44:49.544379+00:00
summary: Slotstream needs a Mac with at least 16 GB of memory
basis: derived
gate: Tools/planner_gates.sh
needle: at least 16 GB
supported_by: '[[records/measurements/decode-lookahead-default-2026-09-13]]'
surfaces: README.md, docs/GETTING-STARTED.md
title: Slotstream needs a Mac with at least 16 GB of memory
status: current
---
The planner refuses every 8 GB plan with `insufficient_memory`, including an explicit `--memory-gb 8.1` and a what-if giving the whole 8 GB to the working set; a 16 GB Mac plans a 10 GB target. This is where a plan exists, not a speed promise: a 16 GB Mac mini measured 1.41 tok/s ([[records/claims/warm-decode-1-41-tok-s-on-a-16-gb-mac-mini-m2]]).
