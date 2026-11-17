---
type: measurement
id: 01m7mwzjq1shgf5pkfedjm6f00
created: 2026-11-17T14:01:11.649105029+00:00
updated: 2026-11-17T14:01:11.649105029+00:00
summary: 'PR #143 on 4423adb5: the opt-in wired limit keeps 27 GB runs off swap and the compressor, the guard admits the usage session, and passes above 128256 keys stay inside the target'
date: 2026-11-17
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
order: '1980'
runs: '[[sources/runs/2026/11/2026-11-17-pr143-4423adb-rerun]]'
title: 'PR #143 on 4423adb5: opt-in wired limit, larger regrowth charge and passes above 128256 keys'
status: measured
---
Carlos's commit `4423adb5` on [#143](https://github.com/carloslfu/slotstream/pull/143) changes three things that the earlier records measured: the wired limit is opt-in through `SLOTSTREAM_WIRED_LIMIT=1` and clamped to the Metal working set, sequence regrowth is charged as every buffer's growth plus one layer's old buffers, and two alias-flag holes are closed. This record reruns the earlier measurements on that commit and adds prefill passes above 128256 keys, where the passes get smaller than 256 rows and the BF16 attention price had not been measured. Raw evidence is in [[sources/runs/2026/11/2026-11-17-pr143-4423adb-rerun]].

The machine is [[records/machines/mac-mini-m4-32gb-three-copies]]. `slotstream doctor` reports a 30.1 GB Metal working set there, because `iogpu.wired_limit_mb` is 28700. The 27 GB limit is therefore below the working set and is not clamped; every head server logged `memory: wiring MLX buffers up to 27.0 GB (SLOTSTREAM_WIRED_LIMIT)`.

## Wired limit

The workload is the one in [[records/measurements/pr143-wired-limit-swap-ab]]: `--memory-gb 27 --max-context 32768`, 5869 expert slots, then a 32736-token prompt, an in-process reuse and a fresh-process disk restore. Compressor and swap numbers are `vm_stat` deltas between the first and last 60 s samples of each run.

| Run | Build | Outcome | Cold prefill | Swapouts | Compressions | Largest compressor | Observed peak |
|---|---|---|---:|---:|---:|---:|---:|
| 1 | base `981ce2dd` | all three phases complete | 786.9 s | 0 | 21781115 | 6.03 GB | 25.62 GB |
| 2 | `4423adb5`, wired | all three phases complete | 500.7 s | 0 | 278405 | 0.99 GB | 25.55 GB |
| 3 | `4423adb5`, wired | all three phases complete | 500.9 s | 0 | 422622 | 1.04 GB | 25.56 GB |
| 4 | base `981ce2dd` | refused by the harness after the cold phase: the host swapped out 10 MB or more | 762.2 s | 104480 | 23543031 | 5.67 GB | 25.74 GB |

Both wired runs completed with no swap-outs and prefilled the 32736-token prompt in about 501 s. One of the two base runs swapped heavily, as both base runs did on November 13. The other base run did not swap, but macOS still compressed about 22 million pages during it, held up to 6.03 GB in the compressor, and the cold prefill took 786.9 s. So pageable buffers cost time here even when they do not reach swap. The comparison is between builds, not between the switch on and off on one build; `981ce2dd` also lacks the guard changes, which do not refuse or delay anything at this context.

## Prefill guard

The usage sequence of [[records/measurements/pr143-prefill-guard-usage-sequence]] at `--context 138240` (2968 expert slots) completed every request on `4423adb5`: the image request, the main conversation from 100027 to 124878 tokens, two side conversations, a side follow-up, a title request, the 126986-token long reply (299 tokens decoded, ending on its own) and the fresh-process replay that restores it from disk. The highest phase peak was 25.63 GB, against 25.53 GB on `200fb398`, with 0 swap-outs. The server logged no guard refusal or wait. Two prefills were slower than on `200fb398`: the 124878-token turn took 217.3 s against 147.0 s and the long-reply turn 119.1 s against 88.8 s. Each build ran the sequence once, and nothing in the logs ties the difference to the guard.

## Passes above 128256 keys

`PrefillSchedule.measuredQueryKeyProduct` is 4096 × 8016, so 256-row passes stop at 128256 keys. The 128000-token full-window run (`--full-window-contexts 138240`) completed with a 21.10 GB peak and 0 swap-outs, but every pass had 256 rows. Extending the saved 128000-token prefix past that point gave these passes:

| Prompt tokens | Restored from disk | Passes after the restore | Wall time | Request peak | Guard refusals | Swapouts |
|---:|---:|---|---:|---:|---:|---:|
| 129025 | 127744 | 2 × 256 rows to 128256 keys, 6 × 128 rows to 129024, 1 × 1 row | 74.8 s | 21.40 GB | 0 | 0 |
| 132096 | 128000 | 1 × 256 rows, 30 × 128 rows to 132096 keys | 236.6 s | 23.52 GB | 0 | 0 |
| 136000 | 128000 | 1 × 256 rows, 60 × 128 rows to 135936 keys, 1 × 64 rows at 136000 | 431.6 s | 22.54 GB | 0 | 0 |

Every request completed, the guard admitted every pass, and the highest peak, 23.52 GB, stays inside the 27 GB target. In this range prefill runs at about 17 tokens per second (4096 tokens in 236.6 s), against about 29 for the 4142-token turn ending at 120736 tokens in the usage sequence (143.2 s), which ran in 256-row passes. This is one machine and one run per length; it shows that the BF16 price admits these passes without exceeding the target, not how close the price is to their real growth.
