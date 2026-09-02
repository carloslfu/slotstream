---
type: design
meta-type: conclusion
id: 01m1hhwmxmp4hyy5jwn0fvfkzz
created: 2026-09-02T17:15:27.028233+00:00
updated: 2026-09-02T17:15:27.028233+00:00
summary: '2. Ground truth: the model (verified from config.json, 2026-08-28)'
date: 2026-08-28
doc: plan
level: '2'
order: '30'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: '2. Ground truth: the model (verified from `config.json`, 2026-08-28)'
---

`Qwen/Qwen3.8-Flash-Next`, `model_type: qwen4_exp` ("Qwen4 architecture preview"),
multimodal (vision encoder + text), license `qwen-community-1.0`.

| Fact | Value |
|---|---|
| Layers | 48, pattern `(GDN GDN GDN QSA) × 12` (`full_attention_interval: 4`) |
| Hidden size | 2560 |
| MoE (every layer) | 512 experts, top-10 routed + 1 shared, expert ffn dim 640 |
| Gated DeltaNet (36 layers) | 48 v-heads × 128, 16 qk-heads × 128, conv kernel 4, state in fp32 |
| Qwen Sparse Attention (12 layers) | 24 q-heads × 256, 2 kv-heads (GQA), partial RoPE 0.25 (dim 64); lightning-style indexer (4 q-heads, 1 kv-head, dim 128), budget 2048 tokens / 512 blocks (compress ratio 4) |
| Hyper-connections | `hc_count 4`, low-rank 320 (residual-stream variant, part of trunk) |
| N-gram / PLE store | 20,000,000 entries × 2560 dim = **51.2B params**; `ngram_size 3` (bi+tri-grams), `heads_per_ngram 8`, `split_ngram_parts 128`, conv kernel 4, injected at `ple_layer_ids [2]` |
| MTP | 1 hybrid layer, ~4B params (self-speculative decoding) |
| Vision encoder | 27 layers × 1152 (~0.4B), patch 16 |
| Vocab | 248,320, untied embeddings |
| Context | 262,144 native, 1M via RoPE scaling |
| Total on disk | ~180B params ≈ 355 GB BF16; GGUF Q4 ≈ 111 GB |

Why this model is *unusually* streamable — the three properties the whole design leans on:

- **96.6% of main-model params are routed experts** (120.8B of 125B), touched sparsely
  (10/512 per layer per token).
- **The 51B n-gram store is addressed by token n-grams alone** — no hidden state needed to
  know which rows you'll need. Qwen's own card says it's "more amenable to offloading than
  MoE"; Unsloth's guide explicitly recommends SSD offload for it. We can prefetch it with
  zero speculation.
- **Only 12 of 48 layers keep a KV cache** (GDN layers carry a fixed ~3.2 MB fp32 state
  each), and QSA reads at most 2048 tokens per step — so long context is cheap in both
  memory and decode compute. KV ≈ **27.6 KB/token** total (2.3 KB × 12 layers, incl.
  indexer keys).

Ecosystem state (2026-08-28): mlx-lm support is an **open PR (#1788)**; community MLX
conversions exist and ship their own `qwen4_exp.py` (pipenetwork 4bit / 6bit / mixed-4-8,
Vontra oQ4, …) — that Python file is our porting reference and test oracle. llama.cpp
support landed via PRs #27739/#27742 (unsloth GGUFs live). Official FP8 release exists for
cloud verification.

**M0 must re-verify all of the above against the actual downloaded artifacts** — the model
is 2 days old and conversions will churn. Every constant below is parameterized in code
from `config.json`, never hard-coded.

---
