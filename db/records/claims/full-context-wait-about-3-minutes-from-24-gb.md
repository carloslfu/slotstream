---
type: claim
id: 01m2dg6wmv6m3h1tg1h0y9f8n2
created: 2026-09-13T13:44:49.563313+00:00
updated: 2026-09-13T14:48:38.860108+00:00
summary: M5 Pro-based prefill estimate is about 3 minutes near the default window from a 24 GB simulation
basis: estimated
gate: Tools/planner_gates.sh checks that doctor reports the wait, not its value
needle: about 3 minutes
supported_by: '[[records/measurements/decode-lookahead-default-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md
title: M5 Pro-based prefill estimate is about 3 minutes near the default window from a 24 GB simulation
status: current
---
Doctor's estimated full-window wait at 32,768 tokens: 3.3 minutes at 24 GB, 3.1 at 32 to 48 GB and 3.0 from 64 GB, from the prefill curve measured on the M5 Pro.

## Scope audit, 2026-09-13

The public rows now explicitly call this M5 Pro-based simulated prefill
time. It does not measure end-to-end wait across physical Macs and excludes
startup, queueing, image preparation and reasoning before visible answer text.
Use a near-full prompt with reply room; a prompt consuming the complete
configured window cannot promise a nonempty reply.
