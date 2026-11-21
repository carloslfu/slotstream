---
type: claim
id: 01m7yx9bgwdc94em7yffgsgpd5
created: 2026-11-21T11:18:56.284539664+00:00
updated: 2026-11-21T11:18:56.284539664+00:00
summary: Auto takes a 65,536-token window at the simulated 32 GB tier
basis: derived
gate: Tools/planner_gates.sh
needle: 65,536 at 32 GB
supported_by: '[[records/measurements/retention-shares-active-capacity-2026-11-21]]'
surfaces: docs/HARDWARE.md, docs/API.md, llms.txt
title: Auto takes a 65,536-token window at the simulated 32 GB tier
status: current
---
At 32 GB a 65,536-token window keeps the draft head's experts resident once retained conversations are charged inside the active context, and adds 6.4% to the typical-request estimate; 131,072 would stream the head's experts. Derived from `doctor --sim-ram 32` ([[records/measurements/retention-shares-active-capacity-2026-11-21]]).
