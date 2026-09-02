---
type: measurement
id: 01m1hhwm87sakz8q9q85r7ybkh
created: 2026-09-02T17:15:26.343681+00:00
updated: 2026-09-02T17:15:26.343681+00:00
summary: Where it pays — measured at every cache size that fit (2026-09-01, redone 2026-09-02 on the release)
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M9
order: '460'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Where it pays — measured at every cache size that fit (2026-09-01, redone 2026-09-02 on the release)
status: measured
---

In-process A/B (`slotstream mtp-bench`: one engine, one warm pool, the two
decode paths alternated, greedy, one 300-word prompt, 192 tokens, medians of
interleaved pairs) on the released 0.2.0 binary at its draft depth of 4, at
every cache size the machine could hold with headroom that evening:

| target | experts/layer | plain tok/s | speculative tok/s | ratio | round cost, in plain tokens |
|---|---:|---:|---:|---:|---:|
| 10 GB | 20 | 5.80 | 3.21 | **×0.55** | 5.2 |
| 14 GB | 29 | 5.92 | 4.07 | **×0.69** | 4.2 |
| 16 GB | 42 | 6.35 | 5.59 | **×0.88** | 3.3 |
| 18 GB | 57 | 7.48 | 7.20 | **×0.96** | 3.0 |

Every run drafts the same 268 tokens and keeps 124 (46.3%): 67 verify passes
for 192 tokens, 2.87 tokens per round. The last column is 2.87 × plain/spec,
what one round costs in units of the plain path's per-token time, and it is
the number to watch: it falls from 5.2 to 3.0 as the cache grows, because the
verify pass's five tokens fetch fewer experts, and the paths break even when
it reaches 2.87. The 18 GB row is five pairs at 0.91–0.99 each; a first
three-pair run at that size overlapped another session's build and threw a
4.5 tok/s pair on both arms, discarded per the discipline above. The dev-build
figure from the day before (×0.96 at 54/layer, 6.77 → 6.52) reproduces.

At a fixed target, which is what the flag does for a user, the loss is
larger, because the head's 1.6 GB comes out of the cache. `run --memory-gb 14
--greedy` on a cold process, two rounds each: `--mtp off` plans 40
experts/layer and decodes at 6.97 / 7.18 tok/s (hit rate 0.606); `--mtp on`
plans 29/layer and decodes at 4.69 / 4.55 (hit rate 0.391, 124/268 drafts
accepted): **×0.65**. Auto keeps the head off until the cache still reaches
120/layer after the charge, which on this Mac is a **28 GB** target (27 GB
plans 127/layer, 115 after the charge; the "~26 GB" the 0.2.0 docs said was
never read off `doctor`, and is corrected).
