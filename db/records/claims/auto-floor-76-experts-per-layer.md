---
type: claim
id: 01m2dg6whed4acn5zk7gtr5tv1
created: 2026-09-13T13:44:49.454394+00:00
updated: 2026-09-13T13:47:38.154924+00:00
summary: The draft head's automatic floor is 76 experts per layer
basis: derived
gate: slotstream-checks decode-lookahead-defaults and Tools/planner_gates.sh
needle: 76 experts per layer
supported_by: '[[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]'
surfaces: docs/CLI.md, docs/ENGINEERING.md, docs/HARDWARE.md, llms.txt
title: The draft head's automatic floor is 76 experts per layer
status: current
---
`Planner.mtpAutoFloorPerLayer` is 76 ([[records/decisions/draft-head-auto-floor-76-per-layer]]). The check asserts plans on both sides of it; planner_gates.sh checks a 24 GB Mac below it and a 32 GB Mac above it at the default context. HARDWARE.md also uses the phrase for the 0.2.14 two-draft measurement at 76.4 per layer that set the floor.
