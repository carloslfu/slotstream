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

**Built 2026-09-02, as N2.** The sweep above is what ships, with three
departures from this note, each decided by measurement (MEASUREMENTS.md,
"N2 — the prefill sweep").

- **The threshold is 256 tokens, not ~512, and it is the only input to the
  decision.** A pass of 256 tokens or more takes the sweep; anything shorter
  (decode, speculative verify passes, a short follow-up turn) gathers over the
  slot pool exactly as before. The choice is a function of the token count
  alone so that the pool's size and contents cannot change the math — the
  golden-equivalence invariant of §6 — and `sweep-check` proves the sweep
  bit-identical on a cold and a warm pool.
- **Groups are 32 experts, not 64, and each group is one grouped GEMM per
  projection.** Sorting a pass's rows by expert is what reaches MLX's
  `gather_qmm_rhs` kernel, which reads an expert's weights once per tile of
  tokens instead of once per token; the old per-(token, expert) gather never
  could. MLX takes that kernel only for a call with at least 16 rows and four
  per expert of the weight array it is handed, so a group that is short of
  that is padded up to it: the kernel a row meets depends on the routing
  alone. 16 and 32 tied at the top and used the least memory; 64 and 128 were
  slower and peaked higher.
- **Reads are contiguous runs.** Experts are read in ascending id order, and
  consecutive ids are one `pread` per piece rather than nine ~307 KB pieces
  per record, which is what the 2026-08-30 measurement identified as the cap
  on prefill IO. Resident experts are copied out of the pool instead, so a
  warm cache still saves reads. The GPU works on one group while the CPU
  reads the next; at most two groups of staging exist at once, so the peak
  is bounded the way the 32-record slices bounded it.
- **Scan resistance is the absence of writes.** The sweep never writes the
  pool, so a long prompt cannot flush what decode was using. Frequency
  admission runs on the final pass only: each layer's most-used experts, its
  fair share of the pool, are written in so decode starts warm. The batch
  n-gram fetch this note asked for landed in the same change, as a parallel
  read of every row a pass needs before its embedding is assembled.
