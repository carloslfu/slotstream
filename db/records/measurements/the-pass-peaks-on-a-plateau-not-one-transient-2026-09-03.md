---
type: measurement
id: 01m1jz260n1xq71rr14a25eqnt
created: 2026-09-03T06:24:54.293697+00:00
updated: 2026-09-03T06:24:54.313156+00:00
summary: The pass peaks on a plateau, not on one transient (2026-09-03)
date: 2026-09-03
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '730'
runs:
- '[[sources/runs/2026/09/2026-09-03-attention-query-block-probe]]'
- '[[sources/runs/2026/09/2026-09-03-pass-cost-and-attention-block-ab]]'
- '[[sources/runs/2026/09/2026-09-03-pass-memory-phase-trace]]'
title: The pass peaks on a plateau, not on one transient (2026-09-03)
status: measured
---
Two changes that should each have taken a few hundred MB off a prefill pass
moved the measured peak by **0.00 GB**. Both were built, measured, and kept only
where they cost nothing. The reason they failed is the useful part, and it was
found by measuring rather than by a third guess.

**Why the attention transient looked like the target.** MLX 0.31.1 admits the
fused prefill kernel only for head dims 64, 80 and 128
(`sdpa_full_supported_head_dim` in `scaled_dot_product_attention.cpp`). The QSA
layers run at head dim 256, so every pass longer than 8 tokens takes the
unfused path in `fast.cpp`, which materialises the whole `[24, pass, context]`
score matrix. That transient grows with pass × context, which is exactly what
`PrefillSchedule` halves the pass to stay ahead of.

**Query blocking is exact, and faster in isolation.** The fallback aligns
queries to the end of the keys (`arange(kL - qL, qL + (kL - qL)) >= arange(0,
kL)`), so a block `[lo, hi)` of a pass starting at context `base` sees exactly
keys `[0, base + hi)` and reproduces the same mask rows. `AttnProbe` on the real
shapes, no weights:

| pass over context | whole | blocked 512, eval per block | difference |
|---|---|---|---|
| 4096 over 8,016 | 55.4 ms, 1.83 GB | 42.4 ms, 0.40 GB | 0.00e+00 |
| 4096 over 32,768 | not built (6.4 GB) | 226.7 ms, 1.16 GB | 0.00e+00 |

Bit-identical at every block of 256 and up; a block of 128 measured 1.6e-3 of
logit spread, which is why 256 is the floor. **The per-block `eval` is
load-bearing**: without it MLX builds the whole graph before evaluating and
holds every block's score matrix at once — 6.5 GB at 4096 over 32,768, exactly
what not blocking costs.

**End to end it bought nothing.** Interleaved rounds on the 7,960-token prompt
at a pinned 20-experts-per-layer pool, peak RSS:

| pass | whole | blocked |
|---|---|---|
| 512 | 7.35 GB | 7.40 GB |
| 1024 | 7.70 GB | 7.75 GB |
| 2048 | 8.50 GB | 8.50 GB |

and a 16,384-token `context-check` read 8.58 GB whole against 8.64 GB blocked,
200.7 tok/s against 208.7. Output byte-identical throughout.

**The phase trace says why: the pass peaks on a plateau, not on one transient.**
`SLOTSTREAM_MEM_TRACE=1` evaluates each phase of each layer and records the
high-water active memory. At a 2048-token pass, against a 7.60 GB layer-end
baseline:

| phase | high-water | with attention blocked |
|---|---|---|
| QSA attention | 8.57 GB | **7.99 GB** |
| PLE (layer 1) | 8.57 GB | 8.57 GB |
| MoE sweep | 8.25–8.32 GB | 8.25–8.30 GB |
| hyper-connections | 7.82–7.93 GB | unchanged |

Blocking removes 0.58 GB from attention exactly as the probe predicts, and the
process peak does not move because the PLE layer holds the same 8.57 GB. Four
transients sit within 0.6 GB of each other, so **no single one of them is the
peak, and lowering one alone can never lower the process**. The same reasoning
explains the second null: not gathering the sweep's replicated rows up front
(rows × hidden, 105 MB at a 2048-token pass) measured 8.50 GB against 8.50 GB.

**What shipped, and why.** Query blocking is kept but its threshold is set so it
is a **no-op at every configuration the planner produces today**: it engages
only above `PrefillSchedule.measuredQueryKeyProduct`, which is where the
schedule already shrinks the pass. That keeps the measured envelope unchanged
while capping a transient that would otherwise grow without limit as the
context cap rises. The per-group row gather is kept because it holds less for
the same result and is bit-identical (`sweep-check` reads 3.320% against the
same 5.089% control, unchanged). Neither is an optimisation and neither should
be quoted as one.

**What this says about the next attempt.** Lowering the pass's peak means
bounding attention, PLE and the MoE sweep together; any one of them alone is
wasted work. The phase trace is the tool for checking that, and it should be run
before, not after. The measured marginal cost of a pass is also lower than the
planner charges — the peak rose 0.35 GB from a 512 to a 1024-token pass and
1.15 GB from 512 to 2048, about 0.78 MB per chunk token against the 1.30 MB the
planner charges — but that is a target-driven number and re-anchoring it needs
its own runs at 8.1, 10 and 16 GB before the constant moves.
