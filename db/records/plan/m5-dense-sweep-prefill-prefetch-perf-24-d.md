---
type: plan
meta-type: operational
id: 01m1hhwnmw979j1jnmr7r1b2aq
created: 2026-09-02T17:15:27.772708+00:00
updated: 2026-09-02T17:15:27.772708+00:00
summary: M5 — Dense-sweep prefill + prefetch + perf (2–4 d)
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '250'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M5 — Dense-sweep prefill + prefetch + perf (2–4 d)
---
Chunked sweep prefill with grouped staging + auto threshold + scan-resistant admission
(§3.3); cross-token prefetcher; QD autotune from doctor data; overlap shared-expert
branch with miss fetches.
**Exit:** dev-Mac targets — prefill ≥ 150 tok/s @8k, decode ≥ 20 tok/s warm chat,
`--sim-ram 16` decode ≥ 4 tok/s.
