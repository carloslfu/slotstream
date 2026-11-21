---
type: claim
id: 01m7yx9bfsmmeygmq3d42p805p
created: 2026-11-21T11:18:56.249348123+00:00
updated: 2026-11-21T11:18:56.249348123+00:00
summary: Auto takes a 131,072-token window at the simulated 48 GB tier
basis: derived
gate: Tools/planner_gates.sh
needle: 131,072 at 48 GB
supported_by: '[[records/measurements/retention-shares-active-capacity-2026-11-21]]'
surfaces: docs/HARDWARE.md, docs/API.md, llms.txt, docs/HERMES.md
title: Auto takes a 131,072-token window at the simulated 48 GB tier
status: current
---
With retained conversations charged inside the active context, the 32,768-token plan at 48 GB takes a 4096-token prefill pass and keeps 148 experts per layer, inside the measured decode range. A 131,072-token window keeps 124 and adds 7.6% to the typical-request estimate, within the 10% tolerance, so auto takes it. Derived from `doctor --sim-ram 48` ([[records/measurements/retention-shares-active-capacity-2026-11-21]]).
