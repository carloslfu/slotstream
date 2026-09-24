---
type: claim
id: 01m2dtc5q2ebnctx8mbwhxwhj0
created: 2026-09-13T16:42:28.450829+00:00
updated: 2026-09-22T19:23:15.968973+00:00
summary: Estimated warm reply range for 24 to less than 48 GB Macs
basis: estimated
gate: none; semantic review against the supporting evidence
needle: ~6–16 tok/s
supported_by: '[[records/measurements/hardware-planning-ranges-2026-09-13]]'
surfaces: README.md, docs/HARDWARE.md
title: Estimated warm reply range for 24 to less than 48 GB Macs
status: current
---
~6–14 tok/s is a rough planning range, not a measurement of every Mac in this
memory band or a performance bound. Endpoint construction, mixed-release
scope, hardware-transfer assumptions and revision conditions are in
[[records/measurements/hardware-planning-ranges-2026-09-13]]. Public surfaces
must label the range estimated and keep the High/Ultra manual-target and
M5 Max-class hardware assumptions visible. No calibrated probability or
universal speed guarantee is supported.

## Re-anchored after 0.2.19, 2026-09-16

The upper end now rounds outward from the development Mac's 15.86 tok/s at a
22 GB process target on 0.2.19, the automatic target of a 32 GB Mac
([[records/measurements/corrected-forecast-release-benchmark-2026-09-16]]),
instead of the 13.47 tok/s measured at a 20 GB target on 0.2.16. It assumes a
comparable chip and SSD; the real 32 GB M5 Air result is 6.22 tok/s on 0.2.11.
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
