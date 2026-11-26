---
type: measurement
id: 01m7yx83s7h7amfq6s1jbrqytt
created: 2026-11-21T11:18:15.591690264+00:00
updated: 2026-11-21T11:18:15.591690264+00:00
summary: 'Retained prefix-cache bytes share the active capacity: at 27 GB the pool grows from 3109 to 4491 slots, long decode 4.47 to 4.88 tok/s, prefill stays at 47.1 tok/s'
date: 2026-11-21
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
order: '1990'
runs: '[[sources/runs/2026/11/2026-11-21-retention-shares-active-capacity]], [[sources/runs/2026/11/2026-11-26-real-mac-automatic-plans]]'
title: Retained prefix-cache bytes share the active capacity
status: measured
---
`PrefixCache.reserveActiveTokens` evicts retained conversations until retained plus active tokens fit the retention ceiling, and that ceiling never exceeds the context the active capacity already charges. The planner and the context ledger charged retained sequence bytes again on top of the active capacity: 3.82 GB at a 138240-token window, which the expert pool never received. `2841edba` keeps only the retained states' fixed recurrent bytes in that charge. Raw output is in [[sources/runs/2026/11/2026-11-21-retention-shares-active-capacity]].

## Read scope

With the larger pool, long prompts lost the 8192-token automatic read scope: prefill read 6.83 TB instead of 3.07 TB, and prefill fell from 46.9 to 40.7 tok/s. The diagnostic build logged each scope decision. A scope's estimate grew with the context from 4.1 to 7.5 GB, mainly its attention ranges (3.67 GB at the end of the prompt) plus the layer expert workspace (3.13 GB), while MLX active memory rose 2.5 to 2.8 GB per scope at every position. A layer-major scope evaluates every attention range, with the workspace cache limit at zero, before the layer's expert workspace loads, so only the frontier spans both phases. The process footprint the check reads also included up to 2.15 GB of MLX buffer cache that the scope clears when it starts. `58581e69` prices a multi-pass scope as the larger of its attention and expert phases plus the frontier, and clears the MLX buffer cache before reading the footprint.

## 137984-token prompt

| Build | `--memory-gb` | Expert slots | 2048-token decode | Long decode | Long prefill | Prefill read | Expert hit rate | Peak footprint | Swap-outs |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `main` | 27 | 3109 | 12.29 tok/s | 4.47 tok/s | 46.9 tok/s | 3.07 TB | 0.625 | 20.8 GB | 0 |
| `pr` | 27 | 4491 | 13.41 tok/s | 4.91 tok/s | 40.7 tok/s | 6.83 TB | 0.717 | 24.8 GB | 0 |
| `fix` | 27 | 4491 | 13.52 tok/s | 4.88 tok/s | 47.1 tok/s | 2.83 TB | 0.717 | 24.7 GB | 0 |
| `fix` | 29 | 4777 | 13.79 tok/s | 5.07 tok/s | 46.8 tok/s | 2.79 TB | 0.730 | 26.9 GB | 0 |
| `fix` | 30 | 5138 | 13.87 tok/s | 5.17 tok/s | 47.3 tok/s | 2.72 TB | 0.744 | 27.9 GB | 0 |

At 31 GB the long request was refused with `insufficient_memory` after 2372 s, and at 32 GB the server refused to start; the Metal working set is 30.1 GB.

## Interleaved conversation

`multi.py` on `fix` at 27 GB completed all five turns with 0 swap-outs; the continued chat turns restored 128000 tokens from the disk tier and peaked at 27.13 and 27.14 GB, against 23.1 GB on `main`. Both peaks exceed the 27 GB target, so this change takes the interleaved conversation over its budget where `main` stayed 3.9 GB under it. `main` was not run at 29 or 30 GB. At 29 and 30 GB the first continued turn was refused after its first 256-token pass with `insufficient_memory`: at 29 GB it required 3.57 GB of reclaimable memory and 3.40 GB was available.

## Automatic plans

The pool and the context window choice move with the charge. `doctor --sim-ram` from 16 to 128 GB:

| Simulated RAM | `main` window, target, experts per layer | `fix` window, target, experts per layer |
|---|---|---|
| 16 GB | 32,768, 10.0 GB, 17 | 32,768, 10.0 GB, 20 |
| 24 GB | 32,768, 16.0 GB, 48 | 32,768, 16.0 GB, 55 |
| 32 GB | 32,768, 22.0 GB, 74 | 65,536, 22.0 GB, 76 |
| 36 GB | 65,536, 25.0 GB, 75 | 65,536, 25.0 GB, 88 |
| 48 GB | 32,768, 33.6 GB, 161 | 131,072, 33.6 GB, 124 |
| 64 GB | 131,072, 43.2 GB, 149 | 131,072, 40.5 GB, 156 |
| 96 and 128 GB | 262,144, 54.7 GB, 149 | 262,144, 48.3 GB, 156 |

At 32 GB a 65,536-token window now keeps the draft head's experts resident and adds 6.4% to the typical-request estimate. At 48 GB the 32,768-token plan takes a 4096-token prefill pass, which leaves 148 experts per layer, inside the measured decode range, so auto weighs 131,072 tokens at +7.6% and takes it. A cache above the measured decode range is still preserved: a 52 GB simulation stays at 32,768. From 64 GB the target no longer pays for a second copy of the window. An explicit window that fits now always retains one complete conversation, so the planner no longer has a fallback for one that does not.

## Real Macs

`--sim-ram N` treats N as decimal GB with a 75% Metal working set. A real Mac reports more memory and a smaller working-set share, so the planner gates use the device readings below. [[sources/runs/2026/11/2026-11-26-real-mac-automatic-plans]] ran `doctor` on `main` (`d30ee840`) and on the PR head (`e744ac2d`) at those readings:

| Real Mac (RAM / working set / available) | Draft head | `main` window, experts per layer | PR window, experts per layer |
|---|---|---|---|
| 16 GB (17.2 / 11.8 / 12.5) | available | 32,768, 19 | 32,768, 18 |
| 24 GB (25.8 / 18 / 21) | available | 32,768, 48 | 32,768, 55 |
| 24 GB | off | 32,768, 51 | 65,536, 44 |
| 32 GB (34.4 / 25.8 / 29) | available | 65,536, 76 | 65,536, 79 |
| 48 GB (51.5 / 40.2 / 44) | available | 65,536, 158 | 32,768, 156 |
| 48 GB | off | 131,072, 130 | 131,072, 158 |

A real 48 GB Mac with the draft head gets a smaller window from this change. Its 34.6 GB target leaves the 32,768-token plan 156 experts per layer, above the measured decode range, and every larger window removes cache (0.5 GB for 65,536), so auto declines them as an unmeasured cost. On `main` the target was 36.05 GB, and 65,536 tokens kept 158 experts per layer while adding 1.2% to the typical request. The 131,072-token window at 48 GB holds only for the simulated tier, which is 48e9 bytes. At 16 GB the freed memory crosses the 20 experts per layer at which the plain-decode lookahead turns on; its 373 MiB reserve leaves 18 experts per layer, one fewer than `main`.

## Checks

`make checks` passed 99 of 99 on `fix`. `Tools/planner_gates.sh` passed 97 of 97 on `main` and 90 of 97 on `pr` and `fix`; the seven failures are the plan changes above, and the gates now assert them.

## Limits

One run per arm on one machine. The automatic plans are simulations from planner estimates, not timed tiers.
