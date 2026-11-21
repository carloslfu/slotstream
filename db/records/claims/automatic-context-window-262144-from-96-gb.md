---
type: claim
id: 01m2dvvtqd7zj6yrebfcfv1tp2
created: 2026-09-13T17:08:30.061087+00:00
updated: 2026-11-21T11:19:44.761173856+00:00
summary: Auto takes the full 262,144-token window from 96 GB
basis: derived
gate: Tools/planner_gates.sh and Tools/context_gates.py
needle: 262,144 from 96 GB
supported_by: '[[records/measurements/automatic-context-window-plans-2026-09-13]]'
surfaces: docs/HARDWARE.md, docs/API.md, llms.txt, CHANGELOG.md
title: Auto takes the full 262,144-token window from 96 GB
status: current
---
Auto takes the pinned model's full 262,144-token window on simulated Macs from 96 GB, and on simulations down to 72 GB, because retaining one complete conversation and the window's context state fit in room the 32,768-token plan leaves unused: the expert cache keeps 156 experts per layer and the target rises from 34.6 GB to 48.3 GB ([[records/measurements/retention-shares-active-capacity-2026-11-21]]). Derived from `doctor --sim-ram` plans ([[records/measurements/automatic-context-window-plans-2026-09-13]]); no native 262,144-token run is recorded, and live availability can lower the window at startup.
