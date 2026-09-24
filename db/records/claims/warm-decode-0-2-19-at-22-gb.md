---
type: claim
id: 01m2nm6zass83ptgndwqx9scy4
created: 2026-09-16T17:28:42.073519+00:00
updated: 2026-09-22T19:23:15.919323+00:00
summary: Warm decode is 15.86 tok/s with the 0.2.19 corrected forecast at a 22 GB target on the development Mac
basis: measured
gate: none
needle: 15.86 tok/s
supported_by: '[[records/measurements/corrected-forecast-release-benchmark-2026-09-16]]'
surfaces: README.md, docs/ENGINEERING.md, docs/HARDWARE.md, llms.txt
title: Warm decode is 15.86 tok/s with the 0.2.19 corrected forecast at a 22 GB target on the development Mac
status: current
---
Median decode throughput of the default arm over its counted cells, two drafts at about 100 experts per layer and a 22 GB target on the 48 GB M5 Pro; not a tier-wide ceiling.
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
