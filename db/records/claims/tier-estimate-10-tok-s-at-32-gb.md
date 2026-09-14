---
type: claim
id: 01m2dg6wk2y5q85zhhk60pms6z
created: 2026-09-13T13:44:49.506537+00:00
updated: 2026-09-13T16:42:28.591994+00:00
summary: A 32 GB Mac is estimated at about 10 tok/s with speculative decoding
basis: estimated
gate: Tools/planner_gates.sh checks that a 32 GB Mac runs the head and the lookahead, not the speed
needle: ~10 tok/s
supported_by: '[[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]'
surfaces: docs/HARDWARE.md
title: A 32 GB Mac is estimated at about 10 tok/s with speculative decoding
status: current
---
Two drafts on 0.2.14 at 76.4 experts per layer measured medians of 9.48 (prose), 11.40 (code) and 10.16 (arithmetic) tok/s, without the lookahead. A 32 GB Mac's automatic plan holds 74 per layer after the head and the lookahead ([[records/measurements/decode-lookahead-default-2026-09-13]]), and the lookahead measured 1.114 at about 88 per layer ([[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]). About 10 therefore assumes the M5 Pro's chip and SSD and takes no credit for the lookahead; slower SSDs are untimed.

## Planning-range follow-up, 2026-09-13

This point estimate remains in the hardware guide. README uses broader
ranges supported by [[records/measurements/hardware-planning-ranges-2026-09-13]],
with actual configurations in a separate table.
