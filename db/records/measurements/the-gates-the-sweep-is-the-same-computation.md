---
type: measurement
id: 01m1hsay96z5kw603fkw0c3w72
created: 2026-09-02T19:25:35.398497+00:00
updated: 2026-09-02T19:25:35.398497+00:00
summary: 'The gates: the sweep is the same computation'
date: 2026-09-02
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: N2
order: '680'
title: 'The gates: the sweep is the same computation'
status: measured
runs:
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-8k-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-prose-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-check]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-context-check-8192-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-floor-and-10gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ladder-60-per-layer]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-tuning]]'
---
The sweep computes the same thing the pool path computes, and the claim is
gated the way prefix reuse is: not by byte identity, which re-batching the
same tokens cannot give (MLX picks kernels and reduction orders by shape),
but by the band that re-chunking a plain prefill already moves the logits
by. `slotstream sweep-check` loads the model at the floor pool, reads a
549-token prose prompt, and requires five things. Its reading on the shipped
code:

| gate | reading |
|---|---|
| deterministic: the sweep twice on an empty pool | identical logits |
| inside the band: sweep vs the pool path, one pass | **3.32%** of logit spread, against a prefill-rechunk control of 5.09% (pool path whole vs in 7-token passes) and a bound of 3× the control; top-1 same |
| re-chunked: the sweep whole vs in 256-token passes | 3.15% |
| blind to the pool: the sweep after the pool path loaded the prompt's experts (638 copied out of the pool instead of read) | **bit-identical** to the cold sweep |
| admission leaves the pool consistent: after a generate whose last pass admitted the prompt's hot experts | pool path identical, sweep identical |

The sweep moves the logits *less* than re-chunking the plain prefill does.
The bit-identity on a warm pool is the invariant PLAN §6 asks for, restated
for the sweep: whether an expert was copied out of the pool or read from the
checkpoint, the same bytes reach the same kernel. That needed one deliberate
piece of engineering. MLX takes its grouped kernel only when a call has at
least 16 rows and four per expert of the weight array it is handed; with the
pool as that array the rule would have flipped with the cache size, and with
groups it would have flipped with how many of a group's experts were
resident. So the sweep hands the kernel one group of at most 32 experts at a
time and pads a short group up to the rule with repeats of its last row,
dropped from the output. The kernel a row meets is then a function of the
routing alone.

What the band means for greedy text: on the 8,073-token acceptance prompt
at a 1024-token pass the pool path answers `<think></think>SEVENTEEN` and the
sweep opens a reasoning chain — a near tie at the second token that the
3.3% moved. That is the same class of effect the prefill-rechunk control
produces on its own: at a 256-token pass both paths answer with an empty
line instead, on the same prompt, in the same session. `sweep-check` is in
`Tools/verify.sh` next to `prefix-check`; the rest of the battery — the
0–1 layer parity gate, golden equivalence across cache sizes, `elastic-check`,
`prefix-check`, `mtp-check`, the memory promises on the 7,960-token prompt,
and `context-check` — runs unchanged, since decode, speculative verify
passes, and any pass under 256 tokens still take the pool path exactly as
before.
