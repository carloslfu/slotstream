---
type: measurement
id: 01m1hhwks70nawns0k89rtt77z
created: 2026-09-02T17:15:25.863656+00:00
updated: 2026-09-02T17:15:25.863656+00:00
summary: 'Prefill: a bigger pass really is faster, measured at a matched pool (2026-08-30)'
date: 2026-08-30
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '250'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Prefill: a bigger pass really is faster, measured at a matched pool (2026-08-30)'
status: measured
---

The pass-size ladder had one anchor and one guess. 2048 was solid — **112.9
tok/s** on an 8,016-token prompt at a 16 GB target, mean of three interleaved
runs. 4096 was extrapolated to 125, which is the same mistake the decode curve
was making one section down.

It cannot be measured at its natural home: a machine that *chooses* 4096 is on
a 36 GB target and needs ~33 GB reclaimable, which has not been available. So
the two were compared at a matched pool of 60 experts/layer instead, on the
same 8,016-token prompt, interleaved:

| round | chunk 2048 | chunk 4096 |
|---|---|---|
| 1 | 96.6 | **108.8** |
| 2 | 76.3 | **92.2** |
| 3 | 91.4 | **103.9** |
| mean | 88.1 | **101.6** |

4096 wins every paired round: **1.15x**. Applied to the 2048 anchor that
implies ~130, so the shipped estimate of 125 sits under the evidence rather
than over it, and 8192 is credited with no further gain because nothing has
measured one.

Note what these absolute numbers also show: **prefill depends on pool size, not
just chunk size.** The same 2048 pass gives 88 tok/s at 60 experts/layer and
113 at 67, because a bigger cache means fewer expert misses per pass. The
estimator is a function of chunk alone, so read it as typical-for-a-machine-
that-would-pick-that-chunk, not as a law.
