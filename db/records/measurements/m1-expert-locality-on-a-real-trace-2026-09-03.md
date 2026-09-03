---
type: measurement
id: 01m1k0a2fc5950k15yg7m8qdx5
created: 2026-09-03T06:46:41.388486+00:00
updated: 2026-09-03T06:46:41.406449+00:00
summary: 'M1 closed: expert locality on a real trace, and the eviction policy is not the lever (2026-09-03)'
date: 2026-09-03
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M1
order: '740'
runs: '[[sources/runs/2026/09/2026-09-03-router-trace-and-cache-simulation]]'
title: 'M1 closed: expert locality on a real trace, and the eviction policy is not the lever (2026-09-03)'
status: measured
---
M1 has been open since 2026-08-28. The simulator (`Tools/cachesim.py`) and a
collector for the Python reference were built then, but no trace was ever taken,
because collecting one needs a bounded forward pass and at the time none
existed. The engine has been able to produce one for days; the decode split
(above) is what made it worth doing, since it puts 44% of decode time at a small
cache in the expert reads, and which records the cache keeps is what sets that.

**The trace.** `SLOTSTREAM_ROUTER_TRACE` records every routing decision.
`slotstream run --experts-per-layer 30 --max-tokens 220 --greedy` on a mixed
prose-and-code prompt: 10,608 MoE calls, 123,360 expert-uses, engine hit rate
**0.557**. Only the 220 single-token decode steps are simulated — a prefill pass
of 256 tokens or more takes the sweep, which never reads or writes the pool, so
its routing is not cache traffic.

**The shape of the workload.** 220 steps, 105,600 expert-uses, **9,956 distinct
records touched of 24,576** (40.5%), and the top 10% of records serve **70.9%**
of accesses. Two numbers follow. The working set for this one generation is
26.9 GB, which is why a 4 GB cache misses so much. And because 9,956 of the
105,600 uses are first touches, **the compulsory-miss ceiling is a hit rate of
0.906** — no policy and no size can beat it on this trace.

**The policy question, answered.** At the engine's own sizes:

| slots | experts/layer | CLOCK (engine, measured) | LRU | LFU-decay | hot+LRU (offline) |
|---|---|---|---|---|---|
| 960 | 20 | — | 0.473 | 0.337 | 0.515 |
| **1440** | **30** | **0.557** | 0.568 | 0.480 | 0.603 |
| 2880 | 60 | — | 0.707 | 0.708 | 0.752 |

**CLOCK is already within about one point of LRU and well ahead of LFU-decay, so
there is no eviction-policy win to collect here.** The `hot+LRU` column pins the
globally hottest records chosen from the whole trace, so it is an offline upper
bound rather than an implementable policy, and even it is only 4.6 points ahead
at the size that matters. M1's remaining question — "cheapest adequate policy
wins" — resolves to the one already shipped.

What the numbers do point at is **capacity and warm start, not policy**: at 30
experts per layer the cache runs at 0.557 against a 0.906 ceiling, and LRU/LFU
only reach that ceiling around 27 GB of pool. The concentration figure is the
one lever the engine does not yet use — 10% of records serving 71% of accesses
is what a persisted hot set, preloaded at startup, would exploit against the
cold-start cost. The prefill sweep already admits a prompt's hot experts on its
final pass; nothing carries a hot set across processes.

Scope: one trace, one prompt, one machine, decode only. A second workload could
move the concentration figure, and an agentic trace of many short turns over one
prefix — the shape §8.1 cares about — is not covered.
