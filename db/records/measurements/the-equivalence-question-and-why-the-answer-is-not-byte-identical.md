---
type: measurement
id: 01m1hhwkwn389h1dw1k6f2nnht
created: 2026-09-02T17:15:25.973133+00:00
updated: 2026-09-02T17:15:25.973133+00:00
summary: The equivalence question, and why the answer is not "byte-identical"
date: 2026-08-30
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '310'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The equivalence question, and why the answer is not "byte-identical"
status: measured
---

The obvious gate for this feature is the one every other cache here gets: output
must be byte-identical to a cold rebuild. **That gate is not achievable, and the
reason is worth writing down, because the first version of this work was
specified with it and it took a failing test to find out.**

Reusing a state means the same tokens were pushed through the model in a
different batching — a prefill of 22, then single-token decode steps, then a
prefill of 20, rather than one pass of 69. MLX picks kernels and reduction
orders by tensor shape, so a different batching sums the same values in a
different order, and floating point is not associative. Swept over a 64-token
sequence, **all 63 possible split points** produce different logits from a
single pass. (A 28-token sequence happened to be exact for splits 12 through 16,
which is coincidence, not alignment — chasing that pattern was a dead end.)

So the honest question is not "is it identical" but "is it *more* perturbing
than something already accepted as correct". The control is re-chunking a plain
prefill, which this project already ships, already gates, and nobody disputes:

| sequence | prefix reuse | prefill re-chunk control |
|---|---|---|
| 28 tokens | 1.99% | 3.42% |
| 100 tokens | 4.37% | 4.48% |
| 196 tokens | 3.63% | 5.90% |

(max |delta| as a fraction of the logit spread, greedy, 30 experts per layer)

**Prefix reuse moves the logits less than prefill re-chunking already does**, and
the gap does not grow with depth — which is the line between harmless
re-association and a state that is accumulating error. That is the gate
`slotstream prefix-check` enforces: the delta must stay inside the control's
band, it must stay flat with depth, the cached path must be deterministic run to
run, and reuse must actually be happening (without that last one the rest is
vacuous).

A by-product worth recording: the existing "byte-identical output at every
prefill chunk size" result is **luckier than it reads**. The underlying logit
deltas between chunk sizes are several percent of spread; the text matches
because top-1 usually survives that, not because the computation is the same.
One of the three probes above already shows top-1 flipping. Anything that
demands bit-exactness across re-batching on this model is demanding something
the numerics do not offer.

**Consequences that shipped with it.** `--no-prefix-cache` pins the old
behaviour for reproducibility and is what parity work should use. Retention is
capped at a tenth of the pool budget (and never above the context limit, past
which reuse is impossible anyway, since a match needs a strictly longer prompt).
A cache miss releases the old state *before* the replacement is allocated, so
exactly one state is ever live and peak memory is unchanged — what rises is the
idle floor, up to ~0.9 GB. The governor drops the retained state before it
shrinks the pool further: it is the cheapest thing to give back, costing one
re-prefill, where a starved pool costs every token after it.
