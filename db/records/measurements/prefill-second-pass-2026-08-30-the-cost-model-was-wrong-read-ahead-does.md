---
type: measurement
id: 01m1hhwkt5pmjkygez5gfz484d
created: 2026-09-02T17:15:25.893012+00:00
updated: 2026-09-02T17:15:25.893012+00:00
summary: 'Prefill, second pass (2026-08-30): the cost model was wrong, read-ahead does not work'
date: 2026-08-30
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '270'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Prefill, second pass (2026-08-30): the cost model was wrong, read-ahead does not work'
status: measured
---

With the prefix cache making follow-up turns cheap, the remaining latency is the
per-request floor, and the first job was to find out what it is rather than
assume. Splitting the pass into its three parts settled it immediately — an
8,016-token prefill at auto sizing:

| part | seconds |
|---|---|
| reading expert records | 33.91 |
| scattering them into the pool | 10.33 |
| compute | 50.27 |
| **sum** | **94.51** |
| **measured pass** | **94.51** |

They add up exactly, so the three phases are **fully serialized** — which is
what made read-ahead look like a free 36%. It isn't; see below.

**Read throughput is 4.5 GB/s, not the 17.3 GB/s the SSD measured, and queue
depth is not why.** An expert record is nine separate pieces (gate/up/down x
weight/scales/biases), so the pass issues 9N preads of ~307 KB rather than N of
2.76 MB, and the M0 size curve is steep. Swept: QD 12 and 32 tie at ~4.0 to
4.5 GB/s, QD 64 and 128 are *worse*. Nothing here is queue-depth-limited. Making
these reads contiguous means an on-disk repack — the M2 container that was
skipped by measurement — and this is the first evidence that would un-skip it.

**The prefill cost model overcharged by 2x, and it was costing real speed.** It
charged `(chunk - 256) x 1.8 MB` because it folded two different things into one
term: pass activations, which scale with the chunk, and KV plus indexer state,
which scales with the context. Measured separately, with the pool pinned so peak
minus the 14.1 GB base is the pass:

| chunk | charged | actually measured |
|---|---|---|
| 1024 | 1.38 GB | 1.30 GB |
| 2048 | 3.23 GB | 2.19 GB |
| 4096 | 6.91 GB | 4.30 GB |

And context state really is small and really is separate: going from a 4,016 to
an 8,016-token prompt at fixed chunk moved peak by **0.1 GB**, exactly the
~27.6 KB per token the prefix cache already accounts for.

Because a pass was priced at twice its cost, the planner kept choosing 1024
where 2048 is strictly better. Holding total memory fixed and trading pool for
pass size on a 4,021-token prompt:

| chunk | pool | prefill | decode | peak |
|---|---|---|---|---|
| 1024 | 77/layer | 65.2 s | 7.3 s | 15.4 GB |
| 2048 | 67/layer | **47.9 s** | **6.6 s** | **14.9 GB** |
| 4096 | 47/layer | 42.9 s | 9.0 s | 14.4 GB |

2048 dominates 1024 on every axis — faster prefill, faster decode, lower peak.
4096 buys a little more prefill and gives back more decode, so it should only be
reached where the pool is already past the decode plateau, which a proportional
cap does on its own. The cost model is now the measured 1.30 MB per chunk token
and the cap is a quarter of the pool budget instead of a fifth.

**Result, three interleaved runs on an 8,016-token prompt at a 16 GB target**
(interleaved because single runs here vary by 15% or more, which is enough to
invent a result that is not there):

| plan | runs | mean |
|---|---|---|
| chunk 1024, 77/layer (before) | 80.3, 94.8, 82.9 s | **86.0 s — 93.7 tok/s** |
| chunk 2048, 67/layer (after) | 65.5, 76.7, 71.8 s | **71.3 s — 112.9 tok/s** |

Faster in every paired run, and peak went down, not up. The `--memory-gb`
promises still hold with headroom: 8 -> 7.5 GB peak, 12 -> 11.5, 16 -> 15.1 on
an 8k prompt. M5's ≥150 tok/s target is still not met; compute is now the
majority of the pass and closing that needs a grouped-GEMM kernel, which cannot
be built on this machine (mlx-swift Metal shaders need Xcode — see the risk
register). **That was wrong, and corrected 2026-08-30**: the Xcode constraint
covers building mlx-swift's *bundled* shader library, not writing a new kernel.
`MLXFast.metalKernel` JIT-compiles Metal source at runtime, this repo already
ships one for gated DeltaNet, and a fresh kernel was verified compiling and
running on this CLT-only machine. The grouped-GEMM work is not blocked.

**Cross-layer read-ahead was built, measured, and removed.** Since the phases are
serialized and a pass above ~512 tokens routes to essentially every expert of
every layer, reading layer L+1's whole set while layer L computes is exact rather
than speculative, and looked like it should hide most of the 33.9 s. It does not:

| | prefetch off | prefetch on |
|---|---|---|
| run 1 | 64.3 s | 67.7 s |
| run 2 | 67.9 s | 78.3 s |

Read time barely moved (19.7 -> 19.5 s, 19.4 -> 17.6 s) while compute rose. The
reads already saturate with 12 concurrent lanes, so a background reader mostly
steals CPU from the thread feeding the GPU, and on unified memory it competes for
the same bandwidth. It also cost 1.4 GB of pool to hold a layer's expert set. The
implementation is gone; what remains is the timing instrumentation that disproved
it. **Do not rebuild this without first making the reads contiguous** — the
premise that there is idle IO capacity to overlap into is what measurement
refuted.
