---
type: claim
id: 01m2dvxb4q7frbfcz01s37qzyg
created: 2026-09-13T17:09:19.638066+00:00
updated: 2026-11-21T11:19:23.238427820+00:00
summary: Auto targets 43.2 GB at 64 GB with its 131,072-token window
basis: derived
gate: none (release history)
needle: 43.2 GB
supported_by: '[[records/measurements/automatic-context-window-plans-2026-09-13]]'
surfaces: CHANGELOG.md
title: Auto targets 43.2 GB at 64 GB with its 131,072-token window
status: current
---
The automatic target at 64 GB with its 131,072-token window: the 32,768-token plan's 34.6 GB plus that window's context state and one retained complete conversation, within 70% of RAM and the working set minus 2 GB. The expert cache stays at 149 experts per layer. Derived from `doctor --sim-ram 64` ([[records/measurements/automatic-context-window-plans-2026-09-13]]), a decimal-GB simulation rather than a measured process peak.

Since 2026-11-21 this number survives only in the 0.2.17 release notes. Retained conversations are charged inside the active context, so the current automatic target is 40.5 GB at 64 GB ([[records/claims/automatic-target-40-5-gb-at-64-gb]]), [[records/measurements/retention-shares-active-capacity-2026-11-21]].
