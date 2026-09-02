---
type: measurement
id: 01m1hhwm94my8bck4xjr8zdnkk
created: 2026-09-02T17:15:26.372890+00:00
updated: 2026-09-02T17:15:26.372890+00:00
summary: Depth, and the plateau A/B that moved the default from 4 to 1 (2026-09-02)
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M9
order: '480'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Depth, and the plateau A/B that moved the default from 4 to 1 (2026-09-02)
status: measured
---

Same A/B at 57/layer, five pairs per depth (`SLOTSTREAM_DRAFT_DEPTH`):

| depth | tokens/round | drafts accepted | plain → spec (column medians) | ratio | pair ratios |
|---|---:|---:|---|---:|---|
| 4 (0.2.0) | 2.87 | 46.3% | 7.48 → 7.20 | **×0.96** | 0.91–0.99 |
| 2 | 2.34 | 66.5% | 7.32 → 7.38 | ×1.01 (pair median **×1.12**) | 0.85–1.27, two pairs disturbed |
| 1 | 1.81 | 80.2% | 7.36 → 8.34 | **×1.13** | 0.96–1.27 |

Depth 4 loses consistently; depths 1 and 2 are indistinguishable at this
size and both ahead of plain. Calibrated on these rounds, the verify pass's
fetch grows to about 1.7× / 2.6× / 3.1× a single token's for 2 / 3 / 5
tokens (consecutive tokens share experts, so it is not 5×), and projecting
those onto the plateau (38 ms of fetch in an 86 ms token) put every depth
near ×1.2. Then the plateau itself, once the machine had the room: the
same A/B at `--memory-gb 28` with `--mtp auto`, which is the configuration
auto ships (122 experts/layer after the head's charge), five pairs per
depth, nothing else running, 20 GB real footprint:

| depth | plain → spec tok/s (column medians) | ratio | pair ratios |
|---|---|---:|---|
| 4 (0.2.0, 0.2.1) | 10.41 → 9.15 | **×0.88** | 0.82–1.02 |
| 2 | 10.33 → 11.63 | **×1.13** | 1.10–1.17 |
| 1 | 10.09 → 11.79 | **×1.17** | 1.04–1.20 |

The projection held for depths 1 and 2 and was optimistic for depth 4, which
pays more rebuild and wasted fetch than the calibration allowed: the depth
0.2.0 and 0.2.1 ship loses even where auto turns it on. The default is now
**1**: the best measured at the size that matters, the least wasted work on
a rejection, and the most robust to a prompt the head reads badly. Depth 2
would win only once the rebuild goes away (its fetch-free ceiling is ×1.48
against ×1.37). Plain decode here reads 10.1–10.4 tok/s against the 11.2
anchor at 120/layer: the bench's pool is warmed by one repeated generation,
and the anchor was taken on a different prompt; the ratio, not the level,
is the measurement. Nothing about the head's cache, the gates, or the
parity fixture depends on the depth.
