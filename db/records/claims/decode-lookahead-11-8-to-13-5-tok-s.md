---
type: claim
id: 01m2dg6wfstjy618dgtd9qm2n0
created: 2026-09-13T13:44:49.401736+00:00
updated: 2026-09-13T16:49:56.362109+00:00
summary: Median decode rose from 11.79 to 13.47 tok/s with decode lookahead on the development Mac
basis: measured
gate: none
needle: 11.79 to 13.47 tok/s
supported_by: '[[records/measurements/decode-path-serialization-b1-cohort-replication-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md, docs/ENGINEERING.md, CHANGELOG.md
title: Median decode rose from 11.79 to 13.47 tok/s with decode lookahead on the development Mac
status: current
---
11.79 and 13.47 tok/s, the medians of the shipped and candidate arms of the held-out B1 replication. The medians come from different eligible cells, so their quotient is not the paired 1.114.

## Reported precision, 2026-09-13

Public surfaces now use the corrected reported medians, 11.79 and 13.47
tok/s, instead of rounding them to one decimal. This is the same held-out
replication, not a new model run. Source:
[[sources/runs/2026/09/2026-09-13-cohort-rescoring-true-medians]].
The README explicitly identifies the 48 GB development Mac and 20 GB target;
the older 0.2.3 result remains labeled historical.
