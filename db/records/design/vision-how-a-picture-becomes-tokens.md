---
type: design
id: 01m1mtve14nqf76hy9a0qdfq2a
created: 2026-09-03T23:49:47.684488+00:00
updated: 2026-09-03T23:50:44.866851+00:00
summary: 'The vision path: one placeholder becomes a run, Rust-free splicing by contiguous spans, inline bytes only, and a conditional memory charge.'
date: 2026-09-03
doc: plan
level: '2'
order: '365'
title: 'Vision: how a picture becomes tokens, and the four decisions that shape it'
status: current
---
The checkpoint is a VLM. `vision_tower.*` is 333 tensors beside the language
model, and the chat template already rendered an image part to
`<|vision_start|><|image_pad|><|vision_end|>`. Turning that into an answer is
four steps and four decisions.

**The shape of it.** The template emits exactly one `<|image_pad|>` per
picture. The tower turns that picture into `mergedTokens` rows — patches after
the 2x2 spatial merge, from the image's dimensions alone. So the tokenizer's
output is rewritten before the model sees it: each single pad becomes a run of
`mergedTokens` pads, and the tower's rows replace the embeddings under that
run. Everything after the first image shifts, ids and offsets together, in one
sweep.

**1. A run, not a list of positions.** The splice takes `[VisionRun]` — a
start offset and the rows that fill it — rather than an array of rows plus a
scan of the ids for placeholders. The scan version had to reconcile two counts
that could disagree, and when they did it logged a line and continued with
unspliced placeholder embeddings: a silently wrong answer, in a feature whose
whole failure mode is fluent wrongness. A run carries its own rows, so there
is nothing to reconcile. Prefill clips runs to each chunk; the MTP draft head
clips the same runs by its own start offset, so its cache is built on the
embeddings the main model actually consumed.

**2. Contiguous spans on the GPU, not a scalar loop on the CPU.** A run is a
contiguous span, so the splice is a concatenation of alternating slices —
text, rows, text. The first implementation copied the whole hidden state to
the CPU as float32, wrote `S x hidden` scalars in a Swift loop, and uploaded
it again, on every prefill pass of every vision request.

**3. The fused attention kernel, for the reason `Layers.attend` gives.**
The tower is 27 blocks of full bidirectional attention over every patch.
Written as `softmax(q·kᵀ)·v` that materializes an `[heads, N, N]` score matrix
and a second one for the probabilities — at the largest image slotstream
accepts, 5.4 GB each, twice, per block, on a machine whose entire promise is a
memory plan. `MLXFast.scaledDotProductAttention` never forms it, and an `eval`
per block bounds the graph the same way the language model's attention does.

**4. Inline bytes only.** A `data:` URL or bare base64 is accepted; anything
with a scheme is refused with a 400 that says so. slotstream does not
dereference a URL a request hands it. The alternative — falling back to
`Data(contentsOf:)` when a base64 decode fails — is an unbounded, untimed
fetch of an attacker-chosen host and, through `file://`, a read of any image
on the disk, reachable from anything that can POST to the loopback port. It
would also make `SECURITY.md`'s "loopback only, no outbound traffic" false of
the serving path. Ollama takes base64 only for the same reason.

**What the engine caps, beyond the processor.** The reference processor would
allow 16.7M pixels, which is 16,384 tokens of a 32,768-token context and a
tower pass to match. slotstream caps one image at 1536² pixels — 2,304 tokens
— and refuses an aspect ratio past 200:1 or more than 24 MiB of decoded bytes.
The 24 MiB follows from the 32 MiB body cap: base64 costs 4/3.

**Memory is a stated cost, not a paid one.** See the V1 measurement for why
the tower's 0.9 GB is announced by the plan and charged at load time against
what is actually reclaimable, rather than folded into the fixed footprint.
