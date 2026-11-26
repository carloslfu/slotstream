---
type: claim
id: 01m8cr671yhepsypp7hpnhhnkb
created: 2026-11-26T20:19:12.574429018+00:00
updated: 2026-11-26T20:19:12.574429018+00:00
summary: Auto gives a real 48 GB Mac a 32,768-token window with the draft head
basis: derived
gate: Tools/planner_gates.sh
needle: 32,768 on a 48 GB Mac
supported_by: '[[records/measurements/retention-shares-active-capacity-2026-11-21]]'
surfaces: docs/HARDWARE.md, docs/API.md, llms.txt
title: Auto gives a real 48 GB Mac a 32,768-token window with the draft head
status: current
---
A real 48 GB Mac reports 51.5 GB with a 40.2 GB Metal working set. With the draft head its automatic target is 34.6 GB, and the 32,768-token plan keeps 156 experts per layer, above the measured decode range. Every larger window removes expert cache, 0.5 GB for 65,536 tokens, so auto declines it as an unmeasured cost. Without the draft head the same Mac gets 131,072 tokens. Derived from `doctor --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44` ([[sources/runs/2026/11/2026-11-26-real-mac-automatic-plans]], [[records/measurements/retention-shares-active-capacity-2026-11-21]]).
