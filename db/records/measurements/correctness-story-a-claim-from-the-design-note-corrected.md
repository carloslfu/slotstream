---
type: measurement
id: 01m1hhwmar6m6fhrjybkqqyw2g
created: 2026-09-02T17:15:26.424058+00:00
updated: 2026-09-02T17:15:26.424058+00:00
summary: Correctness story (a claim from the design note corrected)
date: 2026-09-01
doc: measurements
level: '3'
milestone: M9
order: '500'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Correctness story (a claim from the design note corrected)
status: analysis
---

The note said greedy speculation is "byte-identical to plain greedy". With the
prefix-cache result in hand that claim was corrected before shipping: every
emitted token's logits still come from the main model, but the verify pass
computes them in a k+1-token batch, and re-batching re-associates sums exactly
the way prefill re-chunking does — near-tie argmax flips are possible and
observed. The shipped gates (`mtp-check`) are: two speculative runs
byte-identical (determinism), a follow-up turn continues a speculative
conversation through the prefix cache, the accept rate is not degenerate, and
plain-vs-spec divergence is REPORTED, not gated to zero. Sampling semantics
are exact by construction: draws happen sequentially off the verified logits,
only for tokens the plain loop would also have sampled, so the rng stream and
presence-penalty evolution match the plain path token for token.

One gate had to be rebuilt twice to be honest. The cross-request check first
asserted "a continuation of a speculative conversation produces tokens" and
failed — not because the state was wrong, but because a 48-token turn-1 reply
is usually cut mid-think, and the model legitimately answers some
continuations of that context with an immediate EOS. 0.2.0 shipped it with a
plain-path control ("the speculative path must not be the one that goes
silent"), which passed on its deciding run: reused state " Paris", control
" Paris.". Moving the draft depth to 2 flipped it the other way — reused
state EOS, control " Paris." — with turn-1 text that differed between the
paths by a near-tie flip, so the control was comparing two different
contexts and the assertion was a coin toss either way. The gate now measures
what it means: the next turn's logits from the reused speculative state
against a cold rebuild of the same ids, bounded by three times what
re-chunking a plain prefill moves them (the `prefix-check` method). On the
deciding run it read 7.36% of the logit spread against a 6.16%
control at depth 2 (top-1 differs) and 5.77% against 6.16% at
depth 4 (top-1 same); a misaligned state reads tens of percent.

State rollback is O(1): the recurrent caches' arrays are REPLACED each step
(the GDN kernel emits a fresh state_out), so a checkpoint holds references,
and KV/indexer buffers roll back by offset. A rejection costs one re-run of
the kept tokens (the GDN state cannot be rewound — same constraint the prefix
cache lives with).

RoPE positions: the head trains with entries at position i+1; the port keeps
0-based cache positions. All rotations shift by the same constant and RoPE
attention depends only on relative positions, so scores are mathematically
identical — noted in MTP.swift rather than adding a shift parameter.
