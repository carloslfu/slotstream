---
type: measurement
id: 01m1hhwkmzzmzsgymt218ns5kg
created: 2026-09-02T17:15:25.727618+00:00
updated: 2026-09-02T17:15:25.727618+00:00
summary: 'The headline: the full 125B+51B model generates on this 48 GB machine'
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
note: The 20.0 tok/s warm decode in the headline table never reproduced and was re-anchored to 11.2 at 120 experts per layer on 2026-08-30; the golden-equivalence result stands.
order: '170'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
superseded_by:
- '[[records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08]]'
title: 'The headline: the full 125B+51B model generates on this 48 GB machine'
status: superseded
---

`slotstream run --prompt "Why is the sky blue?" --greedy --experts-per-layer 181` (24 GB cache):

| Metric | Cold (first run) | Warm (server, 2nd request) |
|---|---|---|
| Engine start | 2.3 s (page-cached residents: 1.1 s) | — |
| Prefill (18–23 tok) | 1.9–4.6 tok/s | 13.2 tok/s |
| **Decode** | **7.8–10.4 tok/s** | **20.0 tok/s** (has not reproduced on 0.1.6 — see the 2026-08-30 re-anchoring) |
| Expert hit rate | 0.837 (cold cache) | higher (persistent pool) |
| Peak Metal memory | 27.3 GB (181 experts/layer cached) | — |
| Output | fully coherent, correct Rayleigh-scattering answer | deterministic across requests |

**Golden equivalence (the design's core invariant) passed on the full model**:
caching only **30 of 512 experts per layer** (1,446 global slots, 5.9% coverage,
hit rate 0.556) produced **byte-identical greedy output** to the 181-per-layer cache — streaming placement provably does not touch
the math. That starved run peaked at **7.3 GB** total at **5.6 tok/s**: the
lite16 tier already works in emulation, at ~10× the plan's original 4–9 tok/s
low-end estimate... and within its band despite the cold cache.
