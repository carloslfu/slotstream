---
type: measurement
id: 01m1hhwm8p5y2wsrcx9bt6ezf5
created: 2026-09-02T17:15:26.358269+00:00
updated: 2026-09-02T17:15:26.358269+00:00
summary: 'The plateau: its ceiling measured, then the A/B itself (2026-09-02)'
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M9
order: '470'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'The plateau: its ceiling measured, then the A/B itself (2026-09-02)'
status: measured
---

The A/B at ≥120/layer, where auto turns the head on, waited most of the day
behind Carlos's apps: the plan's conservative 27 GB peak against 20 to 28 GB
reclaimable. It ran late in the evening (below; the real footprint was
20 GB). First, the premise the ×1.5–1.9 arithmetic stood on: that verifying five tokens in one
pass costs about one token's pass once nothing has to be fetched.
`slotstream mtp-passcost` runs a pass twice from one checkpoint at eight real
positions of a greedy continuation and times the second run, when the pool's
miss counter reads zero (it did, at every position):

| pass, every expert it needs resident (57/layer) | ms | × one token |
|---|---:|---:|
| verify 1 token | 48.3 | 1.00 |
| verify 2 / 3 / 4 tokens | 56.7 / 64.2 / 72.1 | 1.17 / 1.33 / 1.49 |
| verify 5 tokens (depth 4) | 79.8 | **1.65** |
| rebuild 1 / 2 / 3 / 4 kept tokens | 47.1 / 54.8 / 62.7 / 69.1 | 0.97 / 1.13 / 1.30 / 1.43 |
| one draft step (head + lm_head) | 2.3 | 0.05 |

**The premise was false.** Each token in the batch adds ~8 ms, a sixth of a
single pass, linearly: a five-token pass gathers up to five times the expert
weights of a one-token pass, and that does not ride free on launch overhead
the way a dense batch-1 matmul suggested. With the measured accept curve
(85.8 / 71.0 / 53.8 / 41.3% for chains of 1 to 4, so 3.52 tokens per round
at depth 4) a fetch-free round costs 4 × 0.05 + 1.65 + 0.71 (the expected
rebuild) = 2.55 plain tokens, and the speedup with **every expert resident**
is capped at **×1.38** at depth 4, ×1.43 at depth 3, **×1.48 at depth 2**,
×1.37 at depth 1: the linear cost favours short chains. These are ceilings.
On the real plateau the plain path is far from fetch-free (11.6 tok/s at
150/layer against the 20.7 tok/s a 48 ms pass implies, so some 40% of every
token is still fetch; the never-reproduced 20.0 at 181/layer looks like this
fetch-free rate glimpsed once) and the verify pass fetches for several
tokens. **The "×1.5–1.9" in the 0.2.0 docs was arithmetic on this premise
and is withdrawn.**
