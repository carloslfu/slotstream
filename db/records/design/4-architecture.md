---
type: design
meta-type: conclusion
id: 01m1hhwn3ztrm40xxb6khkhfnp
created: 2026-09-02T17:15:27.231648+00:00
updated: 2026-09-02T17:15:27.231648+00:00
summary: 4. Architecture
date: 2026-08-28
doc: plan
level: '2'
order: '90'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 4. Architecture
---

```
┌────────────────────────── slotstream (single Swift binary) ──────────────────────────┐
│  CLI (swift-argument-parser): pull · run · serve · install · bench · doctor · repack │
│  Server (Hummingbird/NIO): Ollama API (/api/*) + OpenAI (/v1/*) · NDJSON streaming   │
│  Engine (SlotstreamCore, mlx-swift):                                                 │
│    Qwen4Exp graph: GDN · QSA(+indexer) · MoE via gatherQMM over slot pool ·          │
│                    n-gram/PLE module · hyper-connections · sampler                   │
│    SlotPool: preallocated quantized pool [S × expert], (layer,expert)→slot map,      │
│              CLOCK/LFU eviction, per-step pinning, hot-set pinning, chunked segments │
│    IO: ExpertStore + NgramStore — F_NOCACHE aligned preads, thread-pool QD 8–32,     │
│        staging ring → pool write; DiskBench                                          │
│    Prefetcher: exact n-gram prefetch · cross-token expert prediction (window W)      │
│    Governor: static budget/preset + DISPATCH memory-pressure source → shrink/degrade │
│    Runtime: KV (12 QSA layers) · GDN fp32 states · sessions/keep-alive · cancel      │
│  Format (.ssmodel): manifest.json + resident.safetensors + experts.bin + ngram.bin   │
│                     (+ mtp/vision.safetensors) + tokenizer/                          │
└──────────────────────────────────────────────────────────────────────────────────────┘
```
