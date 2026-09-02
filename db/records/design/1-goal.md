---
type: design
meta-type: conclusion
id: 01m1hhwmx5898411x5j2ar5f5v
created: 2026-09-02T17:15:27.013396+00:00
updated: 2026-09-02T17:15:27.013396+00:00
summary: 1. Goal
date: 2026-08-28
doc: plan
level: '2'
order: '20'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 1. Goal
---

Run **Qwen3.8-Flash-Next** (released 2026-08-26; 125B total / 6B active, + 51B n-gram
embedding store, + 4B MTP) **in 4-bit on this Mac (MacBook Pro, M5 Pro, 48 GB) and on Macs
with much less memory (down to 16 GB officially, 8 GB experimentally)**, by:

1. Keeping the small dense trunk resident.
2. Streaming the **routed experts** from SSD into a fixed pool of **cache slots** — sized
   in **experts per layer** (of each layer's 512; 0.133 GB per expert/layer), *the*
   RAM↔speed tradeoff knob (`--experts-per-layer`).
3. Streaming the **n-gram / per-layer-embedding (PLE) store** from SSD with a small row
   cache — near-free because lookups are known from token ids alone (perfect prefetch).
4. Shipping it as a single Swift binary (`slotstream`) with a one-line install and an
   **Ollama-compatible API**, so every existing Ollama/OpenAI client just works.

Non-goal framing: this is not a research vehicle; it's an engineering product with a
pre-registered test matrix and measurable done-criteria. The mechanism (slots + streaming)
is model-agnostic; this model is the first and only v0 target.

---
