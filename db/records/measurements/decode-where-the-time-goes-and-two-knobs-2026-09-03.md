---
type: measurement
id: 01m1jz25zfess7gqejv1ns1mr3
created: 2026-09-03T06:24:54.255741+00:00
updated: 2026-09-03T06:24:54.276795+00:00
summary: 'Decode: where the time goes, and the two knobs that moved it (2026-09-03)'
date: 2026-09-03
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '720'
runs: '[[sources/runs/2026/09/2026-09-03-decode-scatter-mode-and-read-lanes-ab]]'
title: 'Decode: where the time goes, and the two knobs that moved it (2026-09-03)'
status: measured
---
Decode had no equivalent of the prefill split, so "decode is slow" could not be
attributed without guessing. `run` now prints one, and it says decode at a small
cache is not mostly compute. On 48 tokens at 30 experts per layer, hit rate
0.576:

| part | seconds | share |
|---|---|---|
| reading expert records | 3.24 | 44% |
| scattering them into the pool | 1.47 | 20% |
| everything else (compute and dispatch) | 2.66 | 36% |

The scatter is the surprise. It moves 203 records per token, 561 MB, in 30.6 ms
— about 18 GB/s, against the 49 to 75 GB/s the slot-write microbenchmark
measured in both Python and Swift (§M0.3). The gap is not the copy: it is one
full GPU sync per layer, 48 per token, because `SlotPool.ensure` finished every
batch with `eval(pools)`. The gather that follows in the same layer already
depends on those arrays, so MLX orders it correctly without the sync; all the
sync bought was releasing the staging buffers a layer earlier.

**Two knobs, measured separately, then together.** Interleaved rounds, greedy,
one prompt, output compared byte for byte.

*Read lanes for the pool path.* The 12 lanes the sweep uses were tuned on its
long contiguous runs, which are throughput-bound. A layer's handful of decode
misses is nine ~307 KB pieces per record, which is latency-bound, so 12 lanes
leave the queue empty between waves. Three rounds at 30 experts per layer:
12 lanes 6.82 tok/s, 32 lanes 7.14, 64 lanes 7.16. The two paths now carry
separate numbers (`SLOTSTREAM_IO_QUEUE_DEPTH` stays 12 for the sweep,
`SLOTSTREAM_POOL_QUEUE_DEPTH` is 32) rather than one compromise: raising the
sweep's lanes to 32 measured *slower* on 2026-09-02 (179 → 162 tok/s).

*Finishing the scatter.* Three modes, three rounds each: `sync` (the shipped
behaviour) 6.17 tok/s at a 7.5 GB peak, `async` 7.11 at 8.9 GB, `none` 7.06 at
7.8 GB. `async` buys nothing over `none` and costs 1.1 GB more, so the default
is `none`.

*Together*, five interleaved rounds, 96 tokens, on a quiet machine:

| | decode | peak RSS |
|---|---|---|
| sync scatter, 12 lanes | 6.93 tok/s | 7.5 GB |
| lazy scatter, 32 lanes | **7.63 tok/s** | 7.8 GB |

**×1.10, and the output is byte-identical across all ten runs.** The same pair
measured ×1.14 earlier in the day while the machine was building; ×1.10 on a
quiet machine is the number to quote. The 0.3 GB is real and is the honest
price: staging buffers and their allocator-cache churn live until the layer's
`eval(h)` instead of being released mid-layer. `--memory-gb 10` still peaks at
7.3 GB on the 7,960-token prompt, so the promise holds with the same headroom
it had.

One caveat the split itself carries: with the lazy default the `scatter` column
no longer measures the scatter, only the cost of issuing it. The work reappears
in `compute`, which is why that column rises from 5.87 s to 8.45 s while the
total falls from 16.37 s to 14.65 s in the same pair.

Not measured: whether the same two knobs help at the 120-to-150-experts-per-layer
sizes auto reaches, where the miss path is a smaller share of the token. Those
configurations need ~26 GB reclaimable and the memory-safety rules keep test
runs between 8.1 and 10 GB, so this is a small-cache result.
