---
type: decision
id: 01m1jz3cwhnrdpzn87h6n5c14x
created: 2026-09-03T06:25:34.097759+00:00
updated: 2026-09-03T06:25:34.115277+00:00
summary: The pool path finishes its scatter lazily and reads on 32 lanes
decided_on: 2026-09-03
evidence: '[[records/measurements/decode-where-the-time-goes-and-two-knobs-2026-09-03]]'
reversible_if: a decode A/B at the 120-to-150-experts-per-layer sizes auto reaches shows the sync back, or the 0.3 GB the lazy scatter holds starts breaking a --memory-gb promise
title: The pool path finishes its scatter lazily and reads on 32 lanes
status: standing
---
The decode split showed the pool scatter at 20% of decode time and running at
about 18 GB/s against a microbenchmark that writes slots at 49 to 75 GB/s: the
gap was 48 full GPU syncs per token, not the copy. `SlotPool.ensure` no longer
forces the pool writes — the gather in the same layer already depends on them,
so MLX orders it — and the pool path reads on 32 lanes rather than the sweep's
12, because a handful of nine-piece misses is latency-bound where the sweep's
long runs are throughput-bound. Together, five interleaved rounds: 6.93 to 7.63
tok/s, byte-identical output, peak 7.5 to 7.8 GB. `async` was measured too and
rejected: same speed as lazy for 1.1 GB more. The two read depths are separate
constants on purpose — raising the sweep to 32 measured slower on 2026-09-02.