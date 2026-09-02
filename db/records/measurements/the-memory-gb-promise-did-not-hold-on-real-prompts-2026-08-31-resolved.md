---
type: measurement
id: 01m1hhwm3f4r82qftcb2e10sys
created: 2026-09-02T17:15:26.190990+00:00
updated: 2026-09-02T17:15:26.190990+00:00
summary: The --memory-gb promise did not hold on real prompts (2026-08-31; resolved below)
date: 2026-08-31
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Characterisation of the 12.4 GB overshoot; the cause and the fix (expert-load staging capped at 32 records) are in the Resolution, after which the same prompt peaks at 8.6 GB.
order: '400'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
superseded_by:
- '[[records/measurements/resolution-bound-expert-load-staging-2026-08-31]]'
title: The --memory-gb promise did not hold on real prompts (2026-08-31; resolved below)
status: superseded
---

`--memory-gb 10` **peaked at 12.4 GB** on a 7,960-token prompt. Characterised
so the fix would not have to start from scratch; the cause and fix are in the
Resolution below, and a clean build of the committed tree now peaks at 8.6 GB
on the same prompt with the full battery green. All runs greedy, 8-16 tokens
out, RSS peak as the binary reports it.

**It is not the expert pool.** At the 1.8 GB floor cache the same prompt still
peaks at 10.9 GB. Sweeping prompt length at that fixed floor pool:

| prompt | peak RSS |
|---|---|
| ~15 tokens | 5.4 GB |
| ~250 tokens | 10.2 GB |
| ~1,000 tokens | 10.5 GB |
| ~3,900 tokens | 10.9 GB |
| ~7,960 tokens | 10.9 GB |

So it is **a step, not per-token growth**: ~4.8 GB appears between a trivial
prompt and a 250-token one, then roughly 90 KB/token after. Anything that
budgets this by context length will mis-size it.

**It is additive in the pool.** Pool 1.8 GB gives 10.5 GB peak and pool 8.0 GB
gives 16.9 GB on the same prompt: +6.2 GB of pool costs +6.4 GB of RSS. The
overhead above the pool is ~8.7 GB where the plan models ~5.8.

**But it is not a clean constant either**, which is why this is left open rather
than patched by inflating `fixedFootprintGB`:

| target | peak | verdict |
|---|---|---|
| 10 GB | 12.4 | over by 2.4 |
| 16 GB | 18.4 | over by 2.4 |
| 20 GB | 19.6 | **under**, holds |

Two candidates ruled out. The n-gram row cache is capped at 400,000 rows of
160 floats, about 0.3 GB with overhead — an order of magnitude too small to be
the step. `MLX.Memory.cacheLimit` is already pinned at 2 GB in `Engine.swift`,
so an unbounded allocator cache is not it either.

Raising `fixedFootprintGB` to cover the gap would push `minMemoryGB` from 8.1
to over 10, which refuses the very target the gate tests, and would shrink every
pool to pay for something whose location is still unknown. The next step is to
find where the ~4.8 GB step is actually allocated on the first real prefill,
not to widen the constant around it.
