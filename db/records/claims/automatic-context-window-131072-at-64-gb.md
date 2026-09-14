---
type: claim
id: 01m2dvvtsngs2j5b8qgy969ah8
created: 2026-09-13T17:08:30.133445+00:00
updated: 2026-09-13T17:08:30.133445+00:00
summary: Auto takes a 131,072-token window at 64 GB
basis: derived
gate: Tools/planner_gates.sh and Tools/context_gates.py
needle: 131,072 at 64 GB
supported_by: '[[records/measurements/automatic-context-window-plans-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md, docs/API.md, llms.txt, CHANGELOG.md
title: Auto takes a 131,072-token window at 64 GB
status: current
---
At 64 GB auto takes 131,072 tokens: the cache keeps 149 experts per layer and the target rises from 34.6 GB to 43.2 GB, while 262,144 tokens would add 17.8% to a typical request. Derived from `doctor --sim-ram` plans ([[records/measurements/automatic-context-window-plans-2026-09-13]]); live availability can lower the window at startup.
