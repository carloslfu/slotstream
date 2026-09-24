---
type: claim
id: 01m2dg6wk2y5q85zhhk60pms6z
created: 2026-09-13T13:44:49.506537+00:00
updated: 2026-09-22T19:23:16.019977+00:00
summary: A 32 GB Mac is estimated at about 10 tok/s with speculative decoding
basis: estimated
gate: Tools/planner_gates.sh checks that a 32 GB Mac runs the head and the lookahead, not the speed
needle: ~10 tok/s
supported_by: '[[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]]'
surfaces: docs/HARDWARE.md
title: A 32 GB Mac is estimated at about 10 tok/s with speculative decoding
status: withdrawn
---
Two drafts on 0.2.14 at 76.4 experts per layer measured medians of 9.48 (prose), 11.40 (code) and 10.16 (arithmetic) tok/s, without the lookahead. A 32 GB Mac's automatic plan holds 74 per layer after the head and the lookahead ([[records/measurements/decode-lookahead-default-2026-09-13]]), and the lookahead measured 1.114 at about 88 per layer ([[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]). About 10 therefore assumes the M5 Pro's chip and SSD and takes no credit for the lookahead; slower SSDs are untimed.

## Planning-range follow-up, 2026-09-13

This point estimate remains in the hardware guide. README uses broader
ranges supported by [[records/measurements/hardware-planning-ranges-2026-09-13]],
with actual configurations in a separate table.

## Withdrawn, 2026-09-16

The 32 GB automatic target (22 GB) has been measured directly on the M5 Pro:
15.86 tok/s on 0.2.19 with the corrected forecast and 14.38 with the 0.2.18
forecast ([[records/claims/warm-decode-0-2-19-at-22-gb]],
[[records/measurements/corrected-forecast-release-benchmark-2026-09-16]]).
The estimate from the 0.2.14 two-draft measurement at 76 experts per layer is
superseded and its needle leaves docs/HARDWARE.md.
## Benchmark-profile clarification, 2026-09-22

The historical throughput remains a valid controlled forecast comparison.
Its protocol forces a 256-token prefill pass, disables prefix caching, uses
two drafts, and disables adaptive speculation and the draft-tail experiment.
That leaves about 100 experts per layer at the 22 GB target. The installed
0.2.23 normal-cache profile at that target instead plans 2048-token passes
and about 74 experts per layer. Equal total memory therefore does not mean
equal runtime settings. The historical figure does not measure the current
automatic plan of a 32 GB Mac and cannot qualify a release-wide speed ratio.

The new calibration attempt, retained raw observations, stricter prospective
host-load screen and remaining gaps are recorded in
[[records/measurements/release-speed-calibration-2026-09-22]].
