---
type: claim
id: 01m2dg6wgbw82za1ync5maf1hn
created: 2026-09-13T13:44:49.419628+00:00
updated: 2026-09-13T13:47:38.117026+00:00
summary: The decode lookahead charges 373 MiB to the memory plan
basis: derived
gate: slotstream-checks decode-lookahead-defaults and Tools/planner_gates.sh
needle: 373 MiB
supported_by: '[[records/measurements/decode-lookahead-default-2026-09-13]]'
surfaces: docs/CLI.md, docs/ENGINEERING.md, llms.txt
title: The decode lookahead charges 373 MiB to the memory plan
status: current
---
128 MiB of prefetch staging plus 245 MiB of FP32 router copies, 49 routers of 512 by 2560 at four bytes each. The check asserts both constants and the plan's ledger; planner_gates.sh checks the JSON ledger at a 22 GB target.
