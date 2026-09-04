---
type: measurement
id: 01m1mtsb1x2b5q2rhxq4zmwddx
created: 2026-09-03T23:48:39.101597+00:00
updated: 2026-09-04T00:28:45.821521+00:00
summary: 'V1 — the vision tower: 0.898 GB resident, 702 tokens for an 846x859 photograph, and agreement with an independent float32 reference inside the bfloat16 band.'
date: 2026-09-03
doc: measurements
level: '2'
milestone: V1
order: '750'
runs: '[[sources/runs/2026/09/2026-09-03-verify-with-vision-gates]]'
title: 'V1 — the vision tower: what it costs, what a picture costs, and whether it computes the right thing (2026-09-03)'
status: measured
---
The checkpoint has always carried a vision tower — 333 `vision_tower.*`
tensors that `Weights.swift` skipped by name — and the chat template has
always rendered an image part to `<|vision_start|><|image_pad|><|vision_end|>`.
What was missing was the tower itself, the splice, and the accounting. This is
what it costs and how it was checked.

## What it costs

| | |
|---|---|
| Tower weights | **0.898 GB**, 333 tensors, bf16 (unquantized) |
| Load time | 3.4 s, from a cold process, reading only those tensors |
| Charged to the memory plan | **no** — see below |
| One 846x859 photograph | **702 tokens** (52x54 patches, 2x2 merged), plus the template's two sentinels |
| One 1206x1570 photograph | 1,862 tokens |
| Largest picture accepted | 2,304 tokens (the 1536² engine cap) |
| `run --image` at `--memory-gb 10` | peak **8.5 GB** RSS, tower included |

The tower's bytes come from the checkpoint's own header
(`VisionTower.residentBytes`), not from a measurement of the process, so the
number cannot drift from the artifact. `Planner.visionResidentGB` rounds it up
to 0.9.

**It is a conditional charge, and that is a decision, not an oversight.**
Every published memory number — the README's tier table, the 32 GB peak, the
planner goldens — is measured against a plan with no tower in it, and most
runs never send a picture. Folding 0.9 GB into the fixed footprint would move
all of those for everyone, to buy a capability most requests do not use. So
the plan states the cost instead of paying it, `serve` prints it as a
conditional line, and `Engine.ensureVisionTower` checks the machine can afford
it at the moment the first image arrives — refusing with a 400 rather than
overcommitting. What is not allowed is the third option, which the first
implementation took: allocate it silently and leave the printed plan wrong by
a gigabyte.

## Whether it computes the right thing

A vision tower fails silently. A transposed weight, a rotary embedding laid
out in the wrong half, a merger norm applied after the 2x2 shuffle instead of
before — each still produces embeddings of the right shape, and the model
still writes fluent sentences about a picture it did not see. Nothing
downstream notices. So `Tools/vision_ref.py` implements the tower a second
time, from the transformers reference rather than from `Vision.swift`, and the
two are compared on the same pixel tensor.

| | cosine | worst token |
|---|---|---|
| slotstream (bf16) vs numpy float32 | 0.99870620 | 0.898964 |
| slotstream (bf16) vs mlx float32 | 0.99870270 | 0.919064 |
| slotstream (bf16) vs mlx bfloat16 | 0.99878263 | 0.950250 |
| **mlx bfloat16 vs numpy float32** | **0.99840382** | 0.839186 |
| mlx float32 vs numpy float32 | 0.99996241 | 0.997329 |

Read the fourth row first. **The same reference implementation, at the two
dtypes, disagrees with itself more than slotstream disagrees with either of
them.** The tower is 27 residual blocks deep in bfloat16 — 8 mantissa bits —
and the tokens the two dtypes differ on most are the low-norm ones, where a
tiny absolute error is a large angle. The last row is what makes the rest
trustworthy: two float32 implementations that share no kernels agree to
0.99996.

So the gate is not an absolute tolerance. It requires the float32
implementations to agree, slotstream to sit inside the band the dtype itself
spans, and slotstream to match the bfloat16 reference. That is the same shape
of argument `prefix-check` makes for reuse against a cold rebuild, and for the
same reason: an equality gate here would either prove nothing or never pass.

**One thing that looked like a lever and is not.** The rotary angles are
computed in Float and cast to bfloat16, which carries about two significant
decimal digits of a cosine. Keeping them in float32 and rotating there was
tried on the theory that this was the largest avoidable error in the tower.
Measured, it made agreement slightly *worse* — 0.99847 against 0.99870 —
because at this depth the residual stream's own rounding dominates and the two
errors were partly cancelling. Reverted; do not re-derive it.

## Whether the rows land in the right places

Parity proves the tower. It says nothing about whether its output reaches the
language model at the positions the template reserved, which is the other half
of the feature and the half a fluent answer hides. That is what the serving
suite is for: the model has to name what is in the photograph.

- **Both pictures, named.** A close-up of a dog: "Dog nose close-up". Green
  citrus on a tree: "Green fruit growing."
- **Two pictures in one turn, in order.** Asked for the subject of the first
  and then the second, the answer is "Dog, pomelo" — the second image really
  is a pomelo tree. A swapped pair would have been equally fluent.
- **The count is exact.** A request with the dog costs 704 more prompt tokens
  than the same request without it: 702 placeholders plus
  `<|vision_start|>` and `<|vision_end|>`.
- **Speculative decode sees the picture too.** `mtp-check`'s vision leg
  produces output identical to plain decode over 24 tokens, at a 93.8% overall
  accept rate. A draft head fed the placeholder's own embedding rather than
  the tower's row would be self-consistent and blind, and would diverge.

## Reuse

A follow-up turn on a conversation whose pictures have not changed re-uses the
state built for them: the tower does not run again, and prefill reads only the
new text. Measured on the same conversation at `--memory-gb 10`: **15.4 s for
the first turn, 1.8 s for the follow-up.**

That reuse is only safe because the cache does not key on token ids. Every
image expands to a run of the *same* placeholder id, so two different pictures
that resize to the same grid produce byte-identical prompts; an id-keyed cache
would answer the second from the first's state. Each run therefore carries a
SHA-256 of the bytes it came from, and a match requires the digests to agree
in both directions. The end-to-end check for it is two requests with identical
words and different pictures: the first says dog, the second does not.
