---
type: measurement
id: 01m1hhwk5w14abt71mad1w9kcc
created: 2026-09-02T17:15:25.244658+00:00
updated: 2026-09-02T17:15:25.244658+00:00
summary: M0.2 — Model ground truth (byte-exact, from safetensors headers)
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '20'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M0.2 — Model ground truth (byte-exact, from safetensors headers)
status: measured
---

Source: `pipenetwork/Qwen3.8-Flash-Next-MLX-4bit` @ `aa7c790e804b`, 4-bit MLX,
group_size 64 for experts. Read via HTTP range requests over 11 shard headers
(3,215 tensors) — no full download needed. Index `total_size` = 103.770 GB, matched.

| Component | Measured | % | Plan estimate | Verdict |
|---|---|---|---|---|
| Routed experts | **67.948 GB** | 65.5% | 67.9 GB | ✅ exact |
| N-gram / PLE store | **32.000 GB** | 30.8% | 28.8 GB | ⚠️ +11%, structure differed |
| misc (norms + lm_head) | 1.255 GB | 1.2% | — | |
| Gated DeltaNet | 1.189 GB | 1.1% | — | |
| QSA attention | 0.376 GB | 0.4% | — | |
| Hyper-connections | 0.367 GB | 0.4% | — | |
| embed_tokens | 0.358 GB | 0.3% | 0.72 GB (w/ lm_head) | ✅ |
| Shared experts | 0.133 GB | 0.1% | 133 MB | ✅ exact |
| Routers | 0.126 GB | 0.1% | 126 MB | ✅ exact |
| ple (non-store) | 0.019 GB | 0.0% | — | |
| **TOTAL** | **103.770 GB** | | ~102 GB | ✅ within 2% |
| **RESIDENT** (all − experts − ngram) | **3.822 GB** | | ~3.3 GB | ⚠️ +16% |

Expert record geometry (drives `experts.bin`):

| Tensor | Shape | dtype | Bytes/expert |
|---|---|---|---|
| `gate_proj.weight` | [512, 640, 320] | U32 | 819,200 |
| `gate_proj.scales/biases` | [512, 640, 40] | BF16 | 51,200 each |
| `up_proj.*` | same as gate | | 921,600 total |
| `down_proj.weight` | [512, 2560, 80] | U32 | 819,200 |
| `down_proj.scales/biases` | [512, 2560, 10] | BF16 | 51,200 each |
| **record total** | | | **2,764,800 B** |

✅ Exactly the plan's number. Padded to 16 KiB → 2,768,896 B (169 pages).
Per-layer experts: **1.4156 GB** (plan: 1.42 GB ✅).
