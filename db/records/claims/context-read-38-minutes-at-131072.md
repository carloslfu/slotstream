---
type: claim
id: 01m2dxrk5aa43kpw46s5kgevvv
created: 2026-09-13T17:41:41.162114+00:00
updated: 2026-09-13T17:41:41.162114+00:00
summary: A 131,072-token prompt took 38 minutes to read at a 16 GB target
basis: measured
gate: none
needle: 38 minutes
supported_by: '[[records/measurements/automatic-context-window-131072-read-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md
title: A 131,072-token prompt took 38 minutes to read at a 16 GB target
status: current
---
Development Mac, a 48 GB M5 Pro, candidate `3626ba67`: a 130,944-token synthetic prompt read in 2,286 s, 38.1 minutes, at a 16 GB target with 256-token passes and the draft head off ([[records/measurements/automatic-context-window-131072-read-2026-09-13]]). One cold rung on a busy Mac, not a clean timing interval, and not a prediction for larger targets, which use larger early passes and a bigger cache.
