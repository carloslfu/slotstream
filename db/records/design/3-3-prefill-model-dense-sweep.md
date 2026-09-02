---
type: design
meta-type: conclusion
id: 01m1hhwn1vhbj5t7x3ah0m8wza
created: 2026-09-02T17:15:27.163564+00:00
updated: 2026-09-02T17:15:27.163564+00:00
summary: 3.3 Prefill model — dense sweep
date: 2026-08-28
doc: plan
level: '3'
order: '70'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 3.3 Prefill model — dense sweep
---

At batch ≥ ~512 tokens, ~all 512 experts per layer get routed to (10 draws/token ×
C tokens over 512 experts → coverage ≈ 1−e^(−10C/512)). So on-demand caching is the wrong
mode for prefill. Instead, per layer: run the router for the whole chunk → **stream that
layer's used experts sequentially in groups** (staging G×2.76 MB, e.g. G=64 → 177 MB),
apply each group to its gathered tokens, discard, next group. Prefill cost per chunk ≈ one
~68 GB sweep (less router-skipped experts) regardless of chunk size → **make chunks big**:

| chunk C | sweep IO / token | prefill IO cap @**17.3 GB/s** (measured) |
|---|---|---|
| 1,024 | 66 MB | ~260 tok/s |
| 4,096 | 16.6 MB | ~1,040 tok/s |
| 8,192 | 8.3 MB | ~2,100 tok/s |

A full 68 GB sweep costs 3.9 s at the measured rate, so prefill is compute-bound at
every useful chunk size and the sweep design has ample headroom.

Effective prefill = min(IO cap, compute cap ~300–800 tok/s est.). Short prompts below a
threshold (~512 tok) use the normal cached path. **The sweep must be scan-resistant**: it
runs through staging only, bypassing the slot cache for placement while still updating
frequency stats, and admits experts into slots only by frequency/hot-set — otherwise
every long prefill flushes the warm cache and the decode that follows starts cold.
N-gram rows for the entire prompt are known upfront → batch-fetch before layer 2.

Cold start: resident load (**3.822 GB** ✅measured) + optional hot-set preload, at the
measured 17.3 GB/s → **first token in seconds, not minutes** — no full-model load ever
happens. ✅Confirmed on the real checkpoint: lazy `load()` of all 97 GB returns in
**0.4 s with 0 GB resident**.
