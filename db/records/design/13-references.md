---
type: design
meta-type: conclusion
id: 01m1hhwp4b4zvv9df7p17sccxw
created: 2026-09-02T17:15:28.267802+00:00
updated: 2026-09-02T17:15:28.267802+00:00
summary: 13. References
date: 2026-08-28
doc: plan
level: '2'
order: '420'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 13. References
---

- Model: [Qwen/Qwen3.8-Flash-Next](https://huggingface.co/Qwen/Qwen3.8-Flash-Next) ·
  [config.json](https://huggingface.co/Qwen/Qwen3.8-Flash-Next/resolve/main/config.json) ·
  [FP8](https://huggingface.co/Qwen/Qwen3.8-Flash-Next-FP8) ·
  [QwenLM repo](https://github.com/QwenLM/Qwen3.8-Flash-Next) ·
  [vLLM recipe](https://recipes.vllm.ai/Qwen/Qwen3.8-Flash-Next)
- Guides: [Unsloth run-locally + PLE/SSD offload notes](https://unsloth.ai/docs/models/qwen3.8-next) ·
  [Unsloth GGUFs](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF)
- MLX ecosystem: mlx-lm PR #1788 (qwen4_exp, open) ·
  [pipenetwork MLX-4bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit) ·
  [MLX-mixed-4_8bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-mixed-4_8bit) ·
  [ml-explore/mlx-swift-lm](https://github.com/ml-explore/mlx-swift-lm)
- llama.cpp support (competitive reference): [PR #27739](https://github.com/ggml-org/llama.cpp/pull/27739) ·
  [PR #27742](https://github.com/ggml-org/llama.cpp/pull/27742)
- Prior art on expert offloading: Eliseev & Mazur, "Fast Inference of Mixture-of-Experts
  Language Models with Offloading" (arXiv:2312.17238 — LRU expert cache + speculative
  loading); MoE-Infinity; PowerInfer; AirLLM (layer streaming); llama.cpp
  `--n-cpu-moe`/mmap; KTransformers.
