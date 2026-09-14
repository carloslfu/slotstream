---
type: claim
id: 01m2dg6wnd3r4za58w2rp3mb89
created: 2026-09-13T13:44:49.581296+00:00
updated: 2026-09-13T14:48:38.894956+00:00
summary: M5 Pro-based prefill estimate is about 8 minutes near the larger window from a 24 GB simulation
basis: estimated
gate: Tools/planner_gates.sh checks that doctor reports the wait, not its value
needle: about 8 minutes
supported_by: '[[records/measurements/decode-lookahead-default-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md
title: M5 Pro-based prefill estimate is about 8 minutes near the larger window from a 24 GB simulation
status: current
---
Doctor's estimated full-window wait at 65,536 tokens: 7.8 minutes at 24 and 32 GB and 7.5 from 36 GB, from the prefill curve measured on the M5 Pro.

## Scope audit, 2026-09-13

The public rows now explicitly call this M5 Pro-based simulated prefill
time. It does not measure end-to-end wait across physical Macs and excludes
startup, queueing, image preparation and reasoning before visible answer text.
The configured window must reserve room for a nonempty reply.
