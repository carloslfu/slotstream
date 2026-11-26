---
type: claim
id: 01m7yx9bk37npjbyk30frafy09
created: 2026-11-21T11:18:56.355048986+00:00
updated: 2026-11-21T11:18:56.355048986+00:00
summary: Auto targets 48.3 GB from 96 GB with the full window
basis: derived
gate: Tools/planner_gates.sh
needle: 48.3 GB
supported_by: '[[records/measurements/retention-shares-active-capacity-2026-11-21]]'
surfaces: docs/HARDWARE.md
title: Auto targets 48.3 GB from 96 GB with the full window
status: current
---
The 32,768-token plan's 34.6 GB plus the 262,144-token window's context state; retained conversations share that context instead of adding a second copy. The cache keeps 156 experts per layer, and the same target repeats at 128 GB. Derived from `doctor --sim-ram` plans ([[records/measurements/retention-shares-active-capacity-2026-11-21]]), decimal-GB simulations rather than measured process peaks.
