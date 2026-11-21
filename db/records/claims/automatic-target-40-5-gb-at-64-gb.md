---
type: claim
id: 01m7yx9bj0dwmn65n8m8xfh7we
created: 2026-11-21T11:18:56.320844944+00:00
updated: 2026-11-21T11:18:56.320844944+00:00
summary: Auto targets 40.5 GB at 64 GB with its 131,072-token window
basis: derived
gate: Tools/planner_gates.sh
needle: 40.5 GB
supported_by: '[[records/measurements/retention-shares-active-capacity-2026-11-21]]'
surfaces: docs/HARDWARE.md
title: Auto targets 40.5 GB at 64 GB with its 131,072-token window
status: current
---
The 32,768-token plan's 34.6 GB plus the 131,072-token window's context state; retained conversations share that context instead of adding a second copy. The cache keeps 156 experts per layer. Derived from `doctor --sim-ram 64` ([[records/measurements/retention-shares-active-capacity-2026-11-21]]), a decimal-GB simulation rather than a measured process peak.
