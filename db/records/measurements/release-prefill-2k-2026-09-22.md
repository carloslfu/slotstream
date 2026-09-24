---
type: measurement
id: 01m367mnfcjrpafp8y5n1cnese
created: 2026-09-23T04:16:04.588035+00:00
updated: 2026-09-23T04:16:04.588035+00:00
summary: Measured installed-release 2K first reads and exact repeats at 10 GB; request history changes read batching and prevents a universal estimator correction.
date: 2026-09-22
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1636'
runs: '[[sources/runs/2026/09/2026-09-22-release-calibration-2k-v3]]'
title: Installed-release 2K prompt timing and ordinary cache reuse
status: measured
---
The installed v0.2.23 release now has a repeated 2K prompt measurement on the 48 GiB M5 Pro with a 10 GB process target. This is a small-budget configuration on that Mac, not a measurement of a different Mac or a new automatic-default decode baseline. Normal prefix caching and planner-owned settings selected 961 expert slots, 256-token compute passes, a 32,768-token context and MTP off.

Three fresh-server rounds rotated code and prose order. One prospectively declared supplemental code repetition followed a background-CPU exclusion. All fourteen requests completed and their raw responses replay exactly; thirteen qualify under the primary screen. Every first read and repeat of a fixture emitted identical sixteen-token output IDs. These capped replies do not establish complete-answer quality. The maximum native lifetime footprint was below the 10 GB ceiling; consult the raw per-request peaks rather than treating the configured target as measured usage.

| Prompt | Eligible first reads / repeats | First-read prefill range | Median repeated request |
|---|---:|---:|---:|
| 2K code | 4 / 3 | 13.86–28.11 s | 2.79 s |
| 2K prose | 3 / 3 | 14.91–26.51 s | 3.22 s |

All formatted prompts contain 2,061 tokens. Mixed-order median first-read prefill is 14.8590 seconds for code and 26.1293 for prose; median full first-request time is 17.1836 and 28.4049 seconds, respectively. Three eligible first/repeat pairs per fixture give median paired end-to-end reductions of 85.4666% and 88.3625%. Those are the benefit of actual reuse in this release, not a matched feature-off experiment, a whole-release speedup or a new reply-generation rate. First-repeat comparisons also include warm process/OS caches.

History matters. Server-first code reads used a 2,048-token read group followed by the thirteen-token tail; the later code miss used 256-token read groups. Prose shows the same order effect. Compute passes stayed at 256 tokens and output IDs were unchanged. Immediate repeats reused either the complete prompt or its 2,048-token boundary. The artifact reports server-first and later-miss observations separately; the mixed-order medians are descriptive summaries of this prescribed sequence, not history-independent ETA anchors.

The primary screen is prospective v3 desktop load screening plus nominal power/thermal state, no host swap-outs and bounded process page-ins. Global swap-ins occurred on several runs: only one code first read and no prose first read passes the stricter global no-swap sensitivity. These results must not be described as a fully isolated or entirely swap-free calibration. The one automatically excluded repeat is retained, including its fast observed latency. No observation was selected by speed.

A simple family-held-out multiplicative correction transfers poorly between these prompt/order mixtures. It is an exploratory diagnostic and confounds family with the prescribed server history. The production estimator remains unchanged. Larger prompt lengths, more memory profiles, real adaptive defaults and full-answer decode remain separate qualification work.

Evidence: [[sources/runs/2026/09/2026-09-22-release-calibration-2k-v3]].
