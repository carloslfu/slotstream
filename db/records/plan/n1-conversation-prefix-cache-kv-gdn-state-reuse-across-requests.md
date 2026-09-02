---
type: plan
meta-type: operational
id: 01m1hhwnt6y5d0na8awf6b5j0j
created: 2026-09-02T17:15:27.942089+00:00
updated: 2026-09-02T17:15:27.942089+00:00
summary: N1 — Conversation prefix cache (KV + GDN state reuse across requests)
date: 2026-08-30
doc: plan
kind: queue-item
level: '3'
order: '300'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: N1 — Conversation prefix cache (KV + GDN state reuse across requests)
---

**The single largest win, and it was not in this plan until now.**
`Generator.generate` calls `model.makeState()` on every request, so a conversation
re-prefills its entire history every turn. At the measured 92 tok/s that is ~9 s of dead
air at turn 2 (~800 tokens), ~33 s at turn 5 (~3k), ~65 s at turn 10 (~6k) — by which
point prefill is ~72% of the wait for a 500-token reply, and every second of it is
recomputing tokens the previous turn already processed. Agentic and tool-loop use, many
short turns over a long identical prefix, is the worst case and is also the use that most
justifies a local model.

**Mechanism.** Hold the live state keyed by the token prefix that produced it. If a new
request's `promptIds` start with the cached prefix, prefill only the delta; otherwise
rebuild. Generation already leaves the state covering prompt + completion, which is
exactly the next turn's prefix.

**Architectural constraint.** The GDN recurrent state cannot be rewound to an arbitrary
prefix, only continued forward — so this is exact-prefix-extend or full rebuild, never
partial rewind. That covers the dominant chat/agentic case and falls back correctly when
the user edits earlier history or switches conversation. This is a real difference from a
pure-attention runner, where any prefix is a slice.

**Cost.** A held state is ~27 KiB/token (KV + indexer), so a 32k conversation pins
~0.9 GB. It must be charged in the memory plan (§5) and be the first thing the governor
sheds under pressure — ahead of shrinking the pool, on the same reasoning as the M9
ordering note.

**Exit (revised — the original was unachievable).** ✅ Turn-N latency independent of
conversation length for an extending prefix; ✅ state dropped under memory pressure.

**The byte-identity criterion written here first was wrong and had to be replaced.**
Reusing a state pushes the same tokens through the model in a different batching, MLX
selects kernels and reduction orders by shape, and floating point is not associative —
swept over a 64-token sequence, *all 63* split points give different logits from a single
pass. §6.1 is about the expert pool, where the bytes fetched are identical and the claim
holds; it does not extend to re-batching. The replacement gate is a **control**: prefix
reuse must not move logits more than re-chunking a plain prefill already does (measured
4.37% vs 5.90% of logit spread), must stay flat with depth, must be deterministic run to
run, and must actually be reusing something. Full data in MEASUREMENTS.md, including the
by-product finding that the existing "byte-identical at every prefill chunk size" result
is luckier than it reads.
