---
type: measurement
id: 01m1hhwm9kpms053ty8npwh08t
created: 2026-09-02T17:15:26.387950+00:00
updated: 2026-09-02T17:15:26.387950+00:00
summary: The rebuild eliminated, and the numbers that ship (2026-09-02)
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M9
order: '490'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The rebuild eliminated, and the numbers that ship (2026-09-02)
status: measured
---

The rebuild after a rejection was the largest avoidable cost left: a full
pass over the kept tokens (0.97 to 1.43 pass-equivalents, above) on every
round that rejected, because the GDN recurrent state could not be rewound.
It can be recorded instead. While a verify pass runs, each linear-attention
layer now steps the GDN recurrence one token at a time and keeps the state
after every position, and slices the conv windows the same way; a rejection
swaps in the recorded state at the last kept position, trims the attention
caches, rebuilds the n-gram context from ids, and slices the pass's own
multi stream for the draft head. No model compute. Two things had to be
true for this to be safe, and both are gated in `mtp-check`. The stepped
recurrence must match the fused kernel, and it does to the bit (0.0000% of
logit spread; the state is fp32 between steps exactly as inside the kernel).
And the state a rollback leaves must be the plain path's state for the same
kept tokens, which it is up to re-association: the kept token's projections
came out of a two-row batch, so its recurrent tensors differ from a one-row
build by 6.5e-2 (GDN state) and 4.3e-2 (conv window) relative, against
1.1e-1 and 7.1e-2 for the plain path merely re-chunked, and one more step
moves the logits 3.4% of their spread against a 3.3% re-chunk control.
A wrong window would read order one. The old rebuild recomputed the kept
tokens one-row and matched the plain path exactly; the price was most of a
pass per rejection, for a difference the batched verify had already
accepted in the logits it sampled from. The plain path is untouched:
recording is on only inside a verify pass, and the layer-parity gate still
reads bit-exact.

What it buys, same A/B, five pairs each:

| depth | 57/layer before → after | 122/layer before → after |
|---|---|---|
| 1 | ×1.12 → **×1.20** | ×1.17 → **×1.24** (10.30 → 12.77 tok/s) |
| 2 | ×1.12 → **×1.20** | ×1.13 → **×1.27** |

Coverage beyond one prompt and greedy decode, all at 122/layer, depth 1,
with the rollback: a code prompt reads ×1.33, a list prompt ×1.19, and the
server's default sampling (temperature 0.7, top-p 0.8, top-k 20, presence
1.5, seeded so both paths draw the same stream) ×1.18 at 72% accept
against 80% greedy. Before the rollback, at 57/layer, sampling read ×1.10
against ×1.11 greedy in the same session, so sampling costs a few percent of
the gain, not the gain. `mtp-bench --sample` is the switch.

What this means for the policy: auto's 120/layer floor stands, now on
measurement rather than argument. At that size the head returns +17% at
depth 1 for 1.6 GB that would otherwise buy experts past the plateau
(decode is flat from 120 to 150), so it is free; below the floor every
point is a loss at depth 4, and the few percent depth 1 would gain there
the displaced cache would eat. The head is still an opt-in artifact
(`Tools/mtp_convert.py`), so the gain reaches nobody until it ships with
`pull`; that is the next product decision, not an engineering one.
