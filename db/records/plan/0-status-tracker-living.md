---
type: plan
meta-type: operational
id: 01m1hhwmw2fj49hd8h7mq80pkk
created: 2026-09-02T17:15:26.978326+00:00
updated: 2026-09-02T17:15:26.978326+00:00
summary: 0. Status tracker (living)
date: 2026-08-28
doc: plan
kind: tracker
level: '2'
order: '10'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 0. Status tracker (living)
---

Measured data lives in **[MEASUREMENTS.md](MEASUREMENTS.md)**; this file keeps the
design and the estimates it replaces.

| Milestone | State | Exit proof |
|---|---|---|
| M0 Ground truth & feasibility | ✅ **done 2026-08-28** | byte-exact model inventory, Metal limits, cold SSD curve, MLX+Swift slot-pool gate, Swift prior-art survey — all in MEASUREMENTS.md |
| M1 Expert-locality study | ◐ tooling built (`Tools/trace_routers.py`, `Tools/cachesim.py`), traces pending | hit-rate curves committed to `bench/locality/` |
| M2 `.ssmodel` container + repack | **skipped, by measurement** | engine streams from original shards (9 preads/expert); repack is now a measured-optimization backlog item |
| M3 Swift engine, resident correctness (incl. QSA indexer) | ✅ **done 2026-08-28** | layers 0–1 **bit-exact** vs mlx-0.31.1 reference; template/ngram/dequant goldens exact; deeper layers ≤2.4% RMS (vendored-kernel ulp skew, documented) |
| M4 Slot streaming decode (first full-model run) | ✅ **done 2026-08-28** | **golden equivalence passed** (30 experts/layer cached ≡ 181/layer, identical greedy text); full model generates coherently on the 48 GB dev Mac |
| M5 Prefill/prefetch perf | ✅ **done 2026-09-02** (as N2) | prefill target met: 8k prompt 184 tok/s at a 16 GB target (was 91), 222 at a 4096-token pass on a matched pool; the cross-token prefetcher stays deprioritized (a decode lever). The 20.0 tok/s warm-decode figure has not reproduced on 0.1.6 — re-anchored to 11.2 at 120/layer |
| M6 Ollama-compatible server | ✅ **done 2026-08-28** | /api/version·tags·show·ps·chat·generate + /v1/chat/completions·models, NDJSON + SSE streaming, all passing `Tools/api_test.sh`; GUI-client validation pending (sandbox blocks local HTTP clients) |
| M7 CLI, install, packaging | ✅ **done 2026-08-28** (LaunchAgent deferred) | full CLI + Makefile; resumable sha256-verified parallel `pull`; one-line installer to a CI-built, provenance-signed release |
| M7.5 Serving hardening | ✅ **done 2026-08-29** (v0.1.5) | adversarial pass over the whole system: three process-killing inputs, streaming corruption, and a sampler 0/0 fixed. `Tools/api_robustness.sh` is the standing gate |
| M7.6 Deferred gaps closed | ✅ **done 2026-08-29** | prefill pass sized from the memory plan (40 → 92 tok/s); sampler golden vs numpy; governor policy driven through all 19 branches |
| M8 Matrix bench + tier validation | ◐ first data — **deprioritized 2026-08-29** | the bench rig and tier table are credibility artifacts, not adoption gates; moved behind N1–N5 |
| v0.1 Definition of Done (§11) | ◐ | see updated checklist |
| N1 Conversation prefix cache | ✅ **done 2026-08-29** (0.1.6) | TTFT flat in conversation length — 6.0 s at turn 8 against 25.8 s uncached. Gated by `prefix-check` against a prefill-rechunk control |
| N2 Prefill sweep | ✅ **done 2026-09-02** | passes of 256+ tokens sweep each layer's experts through staging groups and MLX's grouped GEMM (sorted indices), read consecutive experts as one `pread` per piece, never write the pool, and admit the prompt's hot experts on the last pass; n-gram rows read in parallel. 8k prompt 91 → 184 tok/s at 16 GB, prose 66 → 140, floor 51 → 93 at a 1.5 GB lower peak, `context-check` 64 → 152. Gated by `sweep-check` (3.3% of logit spread vs a 5.1% rechunk control; bit-identical cold and warm pool) |
| N5 Real GUI client | ✅ **done 2026-08-30** | Open WebUI driven through its own UI. It found a real bug: its interleaved title request defeated the single-slot prefix cache, which now holds four |
| N3 Download size · N4 Quality vs FP8 | **removed from the queue 2026-08-30** | hosting is not the download's bottleneck and partial-start is worse than a progress bar; the FP8 gate needs a credential that is not provisioned. Findings kept in MEASUREMENTS.md |
| M9 MTP self-speculative decode | ✅ **done 2026-09-01** | the head's 31 tensors converted from the official release (the pinned conversion drops them); Swift port **bit-exact** vs the Python reference; measured accept 85.8% at depth 1, 41.3% for a 4-chain; auto enables only ≥120 experts/layer after its 1.6 GB. A/B on 0.2.0 (four drafts): ×0.55 / 0.69 / 0.88 / 0.96 at 20 / 29 / 42 / 57 experts/layer, all below break-even; at 122/layer (auto's size) depth 4 reads ×0.88, depth 2 ×1.13, depth 1 ×1.17, so the default is now 1 and auto's floor stands; with the rebuild eliminated (per-position recorded state) depth 1 reads ×1.24 there and ×1.18 sampled. Gates: `mtp-parity`, `mtp-check` |

**What is actually next: [§8.1](#81-next--the-ordered-queue-post-015).** M0–M8 are the
build-out phases; §8.1 is the live queue, ordered by what decides whether a person keeps
using slotstream after their first session rather than by what completes the milestone map.

---
