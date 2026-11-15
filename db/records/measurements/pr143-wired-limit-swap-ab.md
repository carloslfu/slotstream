---
type: measurement
id: 01m7fcrd951gwagtk7da41d8tv
created: 2026-11-15T10:41:27.333445551+00:00
updated: 2026-11-15T10:41:27.333445551+00:00
summary: 'PR #143: wiring MLX buffers to the memory target removes swap-outs at 27 GB'
date: 2026-11-13
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
order: '1960'
runs: '[[sources/runs/2026/11/2026-11-13-pr143-wired-limit-swap-ab]]'
title: 'PR #143: wiring MLX buffers to the memory target removes swap-outs at 27 GB'
status: measured
---
slotstream never set MLX's wired limit, and MLX's default is 0, so no Metal buffer was kept resident. On a Mac whose memory target is close to its RAM, macOS compresses idle expert-pool and weight buffers under pressure. Because 4-bit weights barely compress, the compressor overflows to swap, and later expert reads page back in. `db0f6c8c` sets the wired limit to the plan target right after the allocator cache limit and warns and continues with pageable buffers if MLX rejects it.

The comparison runs the same full-window workload on release builds of base `981ce2dd` and head `200fb398` (which contains `db0f6c8c`) in ABBA order on [[records/machines/mac-mini-m4-32gb-three-copies]]: `--memory-gb 27 --max-context 32768`, MTP and vision on, three copies, 5869 expert slots, 256-token prefill passes, then an image request and a 32736-token prompt, an in-process reuse and a fresh-process disk restore. Raw manifests, server logs and samples are in [[sources/runs/2026/11/2026-11-13-pr143-wired-limit-swap-ab]].

| Run | Build | Outcome | Swapouts | Swapins | Observed peak |
|---|---|---|---:|---:|---:|
| 1 | base | server gone; its last log line is 15 s into the long prefill, and the harness saw the disconnect 37 s after start | 82292 | 2469 | — |
| 2 | head | all three phases complete | 0 | 725 | 25.56 GB |
| 3 | head | all three phases complete | 0 | 204 | 25.55 GB |
| 4 | base | server gone; its last log line is 15 s into the long prefill, and the harness saw the disconnect 33 s after start | 50304 | 1791 | — |

Swap counts are global `vm_stat` deltas over each run. With the wired limit, the cold 32736-token prefill takes 489–491 s, and the reuse and disk-restore phases take 18–19 s each with 0 swapouts. The base servers' logs end without an error line, and no crash report or jetsam entry was found; this record does not attribute their exit beyond the paging that preceded it. Global paging is diagnostic under [[records/decisions/global-paging-is-diagnostic]]; the base runs are kept as failures, not timings.

This is one machine with one workload near its RAM. It shows that the wired limit removes the swap-outs at this target; it does not measure the effect on Macs with more headroom.
