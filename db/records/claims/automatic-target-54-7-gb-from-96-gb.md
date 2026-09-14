---
type: claim
id: 01m2dvxb7sg0shxkx317kx2pyr
created: 2026-09-13T17:09:19.737271+00:00
updated: 2026-09-13T17:09:19.737271+00:00
summary: Auto targets 54.7 GB from 96 GB with the full window
basis: derived
gate: Tools/planner_gates.sh
needle: 54.7 GB
supported_by: '[[records/measurements/automatic-context-window-plans-2026-09-13]]'
surfaces: docs/HARDWARE.md, CHANGELOG.md
title: Auto targets 54.7 GB from 96 GB with the full window
status: current
---
The automatic target from 96 GB with the full 262,144-token window: the 32,768-token plan's 34.6 GB plus that window's context state and one retained complete conversation. The expert cache stays at 149 experts per layer, and the same target repeats at 128 and 192 GB. Derived from `doctor --sim-ram` plans ([[records/measurements/automatic-context-window-plans-2026-09-13]]), decimal-GB simulations rather than measured process peaks.
