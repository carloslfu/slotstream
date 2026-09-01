# slotstream — Qwen3.8-Flash-Next on every Apple Silicon Mac

**One binary. MLX + Swift. SSD-streamed experts + n-gram/PLE store, RAM cache slots as the
speed↔memory knob, Ollama-compatible API.**

Created 2026-08-28. This file is the whole plan: design, math, build phases, test matrix,
and the living status tracker. Update it in place as milestones land (checkboxes + the
Measured columns). Everything marked **est.** is a first-principles estimate to be replaced
by a measurement; everything marked **verified** came from the model config or a live check.

---

## 0. Status tracker (living)

Measured data lives in **[MEASUREMENTS.md](MEASUREMENTS.md)**; this file keeps the
design and the estimates it replaces.

| Milestone | State | Exit proof |
|---|---|---|
| M0 Ground truth & feasibility | ✅ **done 2026-08-28** | byte-exact model inventory, Metal limits, cold SSD curve, MLX+Swift slot-pool gate, Swift prior-art survey — all in MEASUREMENTS.md |
| M1 Expert-locality study | ◐ tooling built (`Tools/trace_routers.py`, `Tools/cachesim.py`), traces pending | hit-rate curves committed to `bench/locality/` |
| M2 `.ssmodel` container + repack | **skipped, by measurement** | engine streams from original shards (9 preads/expert); repack is now a measured-optimization backlog item |
| M3 Swift engine, resident correctness (incl. QSA indexer) | ✅ **done 2026-08-28** | layers 0–1 **bit-exact** vs mlx-0.31.1 reference; template/ngram/dequant goldens exact; deeper layers ≤2.4% RMS (vendored-kernel ulp skew, documented) |
| M4 Slot streaming decode (first full-model run) | ✅ **done 2026-08-28** | **golden equivalence passed** (30 experts/layer cached ≡ 181/layer, identical greedy text); full model generates coherently on the 48 GB dev Mac |
| M5 Prefill/prefetch perf | ◐ partial → **queued as N2** | prefill ~113 tok/s @8k, short of the ≥150 target. The 20.0 tok/s warm-decode figure has not reproduced on 0.1.6 — re-anchored to 11.2 at 120/layer |
| M6 Ollama-compatible server | ✅ **done 2026-08-28** | /api/version·tags·show·ps·chat·generate + /v1/chat/completions·models, NDJSON + SSE streaming, all passing `Tools/api_test.sh`; GUI-client validation pending (sandbox blocks local HTTP clients) |
| M7 CLI, install, packaging | ✅ **done 2026-08-28** (LaunchAgent deferred) | full CLI + Makefile; resumable sha256-verified parallel `pull`; one-line installer to a CI-built, provenance-signed release |
| M7.5 Serving hardening | ✅ **done 2026-08-29** (v0.1.5) | adversarial pass over the whole system: three process-killing inputs, streaming corruption, and a sampler 0/0 fixed. `Tools/api_robustness.sh` is the standing gate |
| M7.6 Deferred gaps closed | ✅ **done 2026-08-29** | prefill pass sized from the memory plan (40 → 92 tok/s); sampler golden vs numpy; governor policy driven through all 19 branches |
| M8 Matrix bench + tier validation | ◐ first data — **deprioritized 2026-08-29** | the bench rig and tier table are credibility artifacts, not adoption gates; moved behind N1–N5 |
| v0.1 Definition of Done (§11) | ◐ | see updated checklist |
| N1 Conversation prefix cache | ✅ **done 2026-08-29** (0.1.6) | TTFT flat in conversation length — 6.0 s at turn 8 against 25.8 s uncached. Gated by `prefix-check` against a prefill-rechunk control |
| N2 Prefill, second pass | ◐ **partial 2026-08-30** | cost model was 2x over, recalibrated: 8k prefill 93.7 → 112.9 tok/s, peak down. Read-ahead built, measured worse, removed. ≥150 needs a grouped-GEMM kernel — **not blocked**: `MLXFast.metalKernel` JIT-compiles at runtime and this repo already ships one |
| N5 Real GUI client | ✅ **done 2026-08-30** | Open WebUI driven through its own UI. It found a real bug: its interleaved title request defeated the single-slot prefix cache, which now holds four |
| N3 Download size · N4 Quality vs FP8 | **removed from the queue 2026-08-30** | hosting is not the download's bottleneck and partial-start is worse than a progress bar; the FP8 gate needs a credential that is not provisioned. Findings kept in MEASUREMENTS.md |
| M9 MTP self-speculative decode | ✅ **done 2026-09-01** | the head's 31 tensors converted from the official release (the pinned conversion drops them); Swift port **bit-exact** vs the Python reference; measured accept 85.8% at depth 1, 41.3% for a 4-chain; auto enables only ≥120 experts/layer after its 1.6 GB, per the design note. Gates: `mtp-parity`, `mtp-check` |

**What is actually next: [§8.1](#81-next--the-ordered-queue-post-015).** M0–M8 are the
build-out phases; §8.1 is the live queue, ordered by what decides whether a person keeps
using slotstream after their first session rather than by what completes the milestone map.

---

## 1. Goal

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

## 2. Ground truth: the model (verified from `config.json`, 2026-08-28)

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

## 3. The byte math (first principles)

Quantization overhead (MLX affine, group size 64): bits + 0.5 bpp for fp16 scale+bias
→ 4-bit = 0.5625 B/param, 6-bit = 0.8125, 8-bit = 1.0625, 3-bit = 0.4375.

### 3.1 Component sizes at 4-bit

| Component | Params | 4-bit size | Placement |
|---|---|---|---|
| Routed experts (48×512) | 120.8B | **67.948 GB** ✅measured | SSD, slot-cached |
| — one expert record (3 × 2560×640) | 4.92M | **2,764,800 B** ✅measured | unit of streaming |
| — one layer's experts (512) | 2.52B | 1.4156 GB ✅measured | unit of prefill sweep |
| Shared experts (48) | 0.24B | 133 MB | resident, always |
| Routers (48 × 2560×512) | 63M | 126 MB (bf16) | resident (routing precedes fetch) |
| Dense trunk (GDN+QSA+HC+norms) | ~2.7B | 1.5 GB (2.2 GB @6-bit) | resident |
| Embeddings + lm_head (untied) | 1.27B | 0.72 GB | resident |
| N-gram/PLE store | 51.2B | **32.0 GB** ✅measured (320,001,536 rows × 100 B) | SSD, page-cached, exact-prefetched |
| MTP block | ~4B | 2.25 GB (est.; absent from the pinned conversion) | optional, off in v0 |
| Vision encoder | ~0.4B | 0.43 GB @8-bit | optional, off in v0 |
| **Fully resident total** | ~180B | **~102 GB** | doesn't fit even in 48 GB → streaming is mandatory on the dev Mac too; exceeds the default wired limit even on 128 GB (see §5) |

Resident floor (v0 text-only, trunk @6-bit): **≈ 3.3 GB** + KV + GDN state (113 MB fp32)
+ MLX graph/activations (~0.4 GB) + slot pool + ngram row cache (128–256 MB) + IO staging
(~128 MB).

KV by context: 8k → 0.23 GB · 32k → 0.90 · 64k → 1.8 · 128k → 3.6 · 262k → 7.4 (bf16;
fp8-KV halves this, later knob).

### 3.2 Decode model

Per token: 48 layers × 10 routed experts = 480 expert-uses. With hit rate *h* on the slot
cache:

```
miss_bytes/token = 480 × (1 − h) × 2.7648 MB     (+ 16 ngram rows ≈ 1.6 KB, prefetched)
t_token ≈ max(t_compute, miss_bytes / BW_ssd_eff) + stalls
```

- `t_compute` floor: unified-memory bandwidth measured at **235 GB/s**, so a purely
  bandwidth-bound token (3.375 GB active) would be 14 ms → ~70 tok/s. But a batch-1
  4-bit matmul was measured at only **47 GB/s** (launch/occupancy-bound, not
  bandwidth-bound), so decode is dominated by **kernel-launch count**, not bytes.
  The real figure must come from running the model; do not extrapolate from either
  number alone.
- `BW_ssd_eff` (this Mac, measured never-repeat cold): **17.3 GB/s** at expert-record
  size, saturating by QD8; 9.46 GB/s even at QD1. Small-page IO is ~100× worse at
  QD1 (4 KiB: 0.08 GB/s, 53.6 µs latency) — the quantitative case for record-sized
  reads over page-granular mmap. Base-capacity SSDs on small Macs will be much
  slower; Stage C must re-measure per machine.
- Worst case h=0 (cold): 1.33 GB/token → 77 ms = **13 tok/s**, from IO alone. The
  8 GB tier is memory-constrained, not bandwidth-constrained.
- Per-layer fetch parallelism is bounded (only that layer's ≤10 misses are known before
  its MoE runs), so latency hiding comes from (a) QD within the layer, (b) overlapping the
  fetch with the shared-expert branch (independent of routed experts), (c) **cross-token
  prefetch** (issue predicted per-layer expert sets for token t+1 right after sampling
  token t — prediction = union of each layer's experts over the last W tokens).

IO-side decode bounds at the **measured 17.3 GB/s** (see MEASUREMENTS.md §M0.5;
the 5–7 GB/s originally assumed here was ~3× too pessimistic):

| h | miss MB/tok | IO ms/tok | IO-bound cap |
|---|---|---|---|
| 0.98 | 27 | 1.5 | 650 tok/s |
| 0.90 | 133 | 7.7 | 130 tok/s |
| 0.50 | 663 | 38 | 26 tok/s |
| **0.00** | 1,327 | **77** | **13 tok/s** |

**The headline consequence: even a zero-hit cache sustains ~13 tok/s from IO.**
Streaming bandwidth is therefore *not* the binding constraint on any tier; memory
(what fits) and compute (kernel-launch-bound decode) are. h still governs how far
above that floor a tier lands, so M1 still matters — but it is no longer the
difference between "viable" and "not".

The single biggest unknown in this whole plan is **h(cache_size, workload)** for this
model's router. Everything else is deterministic byte-pushing. Hence M1 exists to measure
exactly that, cheaply, before the expensive Swift work depends on it.

### 3.3 Prefill model — dense sweep

At batch ≥ ~512 tokens, ~all 512 experts per layer get routed to (10 draws/token ×
C tokens over 512 experts → coverage ≈ 1−e^(−10C/512)). So on-demand caching is the wrong
mode for prefill. Instead, per layer: run the router for the whole chunk → **stream that
layer's used experts sequentially in groups** (staging G×2.76 MB, e.g. G=64 → 177 MB),
apply each group to its gathered tokens, discard, next group. Prefill cost per chunk ≈ one
~68 GB sweep (less router-skipped experts) regardless of chunk size → **make chunks big**:

| chunk C | sweep IO / token | prefill IO cap @**17.3 GB/s** (measured) |
|---|---|---|
| 1,024 | 66 MB | ~260 tok/s |
| 4,096 | 16.6 MB | ~1,040 tok/s |
| 8,192 | 8.3 MB | ~2,100 tok/s |

A full 68 GB sweep costs 3.9 s at the measured rate, so prefill is compute-bound at
every useful chunk size and the sweep design has ample headroom.

Effective prefill = min(IO cap, compute cap ~300–800 tok/s est.). Short prompts below a
threshold (~512 tok) use the normal cached path. **The sweep must be scan-resistant**: it
runs through staging only, bypassing the slot cache for placement while still updating
frequency stats, and admits experts into slots only by frequency/hot-set — otherwise
every long prefill flushes the warm cache and the decode that follows starts cold.
N-gram rows for the entire prompt are known upfront → batch-fetch before layer 2.

Cold start: resident load (**3.822 GB** ✅measured) + optional hot-set preload, at the
measured 17.3 GB/s → **first token in seconds, not minutes** — no full-model load ever
happens. ✅Confirmed on the real checkpoint: lazy `load()` of all 97 GB returns in
**0.4 s with 0 GB resident**.

### 3.4 Why explicit slots instead of mmap-and-pray

llama.cpp/LM Studio can already mmap this model and let the page cache thrash. We don't,
because on macOS that path has: unbounded RSS → memory pressure → compressor/swap death
(writes!, the thing that actually wears SSDs and freezes Macs), no QD control, no
prefetch, no layout control, and double-caching. Explicit slots give: deterministic
footprint chosen per machine, F_NOCACHE reads (no page-cache duplication), record-aligned
layout, measured QD, exact PLE prefetch, and a dense-sweep prefill mode none of the mmap
runtimes have. (A `--io-mode=pagecache` flag is kept for A/B honesty — the OS cache as a
free-but-nondeterministic L2 is itself one of the combinations to test on big-RAM tiers.)
MLX gets us Metal-first compute on unified memory: SSD→RAM is the only copy; RAM→GPU is
free.

Also: reads don't meaningfully wear SSDs; sustained decode at ~20 tok/s × 100 MB/tok ≈
2 GB/s read is thermally and endurance-wise fine. What kills machines is swap — which this
design's fixed budget exists to prevent.

---

## 4. Architecture

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

### 4.1 `.ssmodel` container (a directory)

- `manifest.json` — format version, source repo+revision, quant recipe per component,
  tensor inventory with shapes/dtypes, record geometry, per-file sha256, default preset
  hints, hot-set list (expert ids by global frequency, from calibration; refreshed from
  runtime stats).
- `resident.safetensors` — trunk, shared experts, routers, embeddings, norms. Loaded whole.
- `experts.bin` — 24,576 fixed-size records, `idx = layer×512 + expert`,
  record = packed(gate|up|down: weights+scales+biases) padded to 16 KiB multiple
  (**2,764,800 → 2,768,896 B**, ✅measured); pure `pread(fd, idx × record_size)`.
  **67.948 GB**.
  Note: in the source checkpoint each layer's 512 experts are *already contiguous*
  per projection (`[512, 640, 320]` etc.), verified by matching a direct `pread` of
  expert *i* against `mx.load(...)[i]`. So a working engine can stream straight from
  the original shards with **9 preads per expert**; `experts.bin` collapses that to
  **1**. The repack is a measured optimisation, not a prerequisite — which makes it
  safe to build the engine first and A/B the repack's real benefit.
- `ngram.bin` — ✅measured geometry: **320,001,536 rows** (128 shards × 2,500,012)
  of **160 dims**, quant group size **32**, packed **100 B/row** (80 weight + 10
  scales + 10 biases), **32.0 GB**. The repack's job here is *interleaving*: in the
  source checkpoint a row's three parts live in three different tensors ~3.25 GB
  apart, so an unrepacked reader needs **3 preads per row = 48 per token**; packing
  each row contiguously makes it **16 per token**. Rows stay packed (not padded):
  at 100 B a row straddles a 16 KiB page only ~0.6% of the time, and padding to
  128 B would cost +9 GB of disk for nothing. Read in 16 KiB aligned windows
  (~163 rows each); the cache is **page-granular, not row-granular**.
- `mtp.safetensors`, `vision.safetensors` — optional, absent in v0 default build.
- `tokenizer/` — tokenizer.json, tokenizer_config.json (chat template), generation_config.

Repack is **bit-exact** (no requantization): source = a vetted community MLX 4-bit
conversion (pipenetwork first candidate; spot-checked, checksummed, revision-pinned), so
our quality baseline equals mlx-lm's by construction. Own conversion from official
FP8/BF16 on a rented box is the fallback if community quants prove broken (billed, so it
needs an explicit decision).

### 4.2 Slot pool mechanics

> **Measured 2026-08-28 — the slot pool is mandatory, not an optimisation.**
> MLX has no sparse-materialisation path out of a memory-mapped tensor:
> `mx.gather_qmm` with top-10 indices materialises **all 512 experts of the layer**
> (471.9 MB for one projection → ~68 GB across the model), and a 16-row `mx.take`
> on an n-gram shard materialises **the whole 200 MB shard** to read 1.3 KB. Stock
> lazy loading therefore pulls in ~100 GB and dies on any prompt length. A
> pre-allocated, fully-resident, bounded pool that we fill by explicit `pread` is
> the only construction that avoids this under MLX. See MEASUREMENTS.md §M0.8.


- One **global pool across layers** (all experts share the shape 3×2560×640): quantized
  weight/scales/biases tensors sized `[S, …]`; per layer, router output ids are mapped
  through the slot table → `gatherQMM(x, pool…, rhs_indices: slots)`. Misses trigger IO;
  the token's active slots are pinned until the step completes.
- Eviction: start with CLOCK + frequency byte (approximates LFU-with-decay); simulator
  (M1) also scores LRU and W-TinyLFU on real traces — cheapest adequate policy wins.
- Slot fill v0: staging buffer → sliced write into the quantized pool arrays (they're
  plain uint32/fp16 tensors; a 2.76 MB device copy is ~µs against memcpy bandwidth).
  v1 option if profiling demands: pread directly into the pool's MTLBuffer contents
  (shared storage mode on Apple Silicon needs no sync) — measure before adopting.
- Resizing: default is a **single pool** — `gatherQMM` gathers within one tensor, and
  sharding the pool would put per-segment dispatch on the hot path. Governor shrink/grow
  = rebuild the pool at the new size (rare event, costs seconds, keeps the hot path
  clean). A segmented variant is adopted only if microbenching shows per-segment
  dispatch overhead is negligible.
- **M3-entry gate — the slot-write microbench (before any streaming work):** prove that
  scattered writes into the quantized pool tensors execute in place (MLX buffer donation
  — no full-pool copy per update) and sustain > 5 GB/s of slot fills. If MLX's
  functional-update semantics force copies at this size, switch to preads directly into
  the pool's MTLBuffer contents (shared storage mode needs no sync on Apple Silicon).

### 4.3 N-gram/PLE path

> **Measured**: this path is the single worst offender under stock MLX — a 16-row
> lookup materialises a 250 MB shard (~150,000× amplification), and touching most of
> the 128 shards costs the full 32 GB. Explicit row-level `pread` into a small page
> cache is required. Note the contrast with llama.cpp, which mmaps the PLE and lets
> the OS work at 4–16 KiB page granularity — that is survivable; MLX's whole-tensor
> evaluation semantics are not.


Keys for token t's rows are a pure function of input token ids (bi/tri-grams × 8 heads,
✅measured **16 rows × 100 B = 1.6 KB**, touching ≤16 of the 128 shards).
Decode: after sampling token t, issue reads for step t+1
immediately — a handful of 4–16 KiB reads (~0.1–0.3 ms) mostly hidden behind layers 0–1
of that step plus the row cache. Prefill: batch-read the whole
prompt's (deduplicated) rows before layer 2. Small LRU row cache (128–256 MB) absorbs
n-gram repetition in natural text. The exact hashing scheme is read out of the reference
`qwen4_exp.py`/PR #1788 at M0 (`heads_per_ngram 8`, `split_ngram_parts 128` — verify
lookup count per token and per-part addressing; if row addressing turns out non-uniform,
adjust stride/layout accordingly). Quality note: Unsloth warns n-gram tables tolerate ≤4-bit
poorly → ngram bits is an independent knob (4 default, 6/8-bit variants for quality runs —
IO stays trivial; only disk grows).

### 4.4 Server: Ollama-compatible surface (v0)

- `/api/version`, `/api/tags`, `/api/show`, `/api/ps`, `/api/chat` (streaming NDJSON,
  `think` toggle → chat-template thinking switch, `tools` passthrough into template),
  `/api/generate`, `/api/pull` (streamed progress), `/api/delete`; `/api/embed` → clean
  400 (not an embedder); `/api/create` → 501 with message.
- OpenAI: `/v1/chat/completions` (incl. SSE streaming), `/v1/models`, `/v1/completions`.
- Semantics matched to Ollama: `keep_alive` (default 5m; model unload = free slots+KV,
  keep fd/manifest), options mapping (`num_ctx`, `temperature`, `top_p`, `top_k`,
  `min_p`, `presence_penalty`, `seed`, `num_predict`, `stop`), request cancellation on
  client disconnect, single-flight generation with FIFO queue (continuous batching is a
  non-goal in v0).
- Chat template: real Jinja rendering of the shipped `chat_template` via
  swift-transformers' Jinja engine. Recommended defaults per model card: instruct
  t=0.7/top_p=0.8/top_k=20/presence=1.5; thinking t=1.0/top_p=0.95.
- Port: 11434 if free, else 11435 (warn), `--port`/`SLOTSTREAM_HOST` override. Model name
  exposed as `qwen3.8-flash-next:4bit` (+`:mixed-4-8`, `:compact-3bit` variants later).

### 4.5 CLI & install UX

```
slotstream pull                            # ✅ parallel (8 conns), resumable, sha256-verified download of the pinned revision (`--verify` re-checks)
slotstream doctor [--memory-gb G]          # ✅ device report + the plan any flags produce + target table
slotstream run qwen3.8-flash-next:4bit     # REPL chat
slotstream serve                           # ✅ zero-config: auto-tunes, announces the plan, resizes elastically
slotstream serve --memory-gb 16            # ✅ total-process memory target (cache gets G − 4.4 GB; pinned)
slotstream serve --no-elastic              # ✅ pin an auto size too
slotstream serve --mtp on|off|auto         # ✅ MTP speculative decode (auto: only ≥120 experts/layer after its 1.6 GB)
slotstream elastic-check                   # ✅ byte-identical output across live pool grow/shrink
slotstream mtp-parity                      # ✅ draft head bit-exact vs the Python reference fixture
slotstream mtp-accept                      # ✅ measure the draft accept curve on real greedy continuations
slotstream mtp-check                       # ✅ speculative gates: determinism, state integrity, accept sanity
slotstream install                         # LaunchAgent (com.slotstream.server), starts at login
slotstream bench [--suite full|quick] [--sim-ram 16]
```

Config: `~/.slotstream/config.json` + env overrides; models in `~/.slotstream/models/`;
logs via os_log + `~/.slotstream/logs/`. ✅ Distribution (2026-08-28): public curl
installer (`install.sh` at the repo root → latest `gh release` tarball of binary +
metallib, sha256-checked, installed to `~/.slotstream/bin`, PATH wired, optional
handoff to `serve`); `serve`/`run` offer the model download interactively when weights
are missing. Later: Homebrew tap + notarized binaries + CI-built releases. Disk
requirement enforced by `pull`: ~105 GB for the 4-bit build (+ transient download
staging; `--purge-source` streams the repack to stay under ~130 GB peak), ~84 GB for
the later compact build.

---

## 5. The configuration space (the tradeoffs to test)

Axes — every named preset is a point in this space:

| Axis | Values | Effect |
|---|---|---|
| Cache size | **experts per layer** (of 512; 0.133 GB per expert/layer; CLI `--experts-per-layer`, raw-pool alias `--pool-gb`, total-process form `--memory-gb`, default **auto** from RAM + working set) | THE memory↔speed knob |
| Resident policy | experts-streamed · +ngram-streamed (default) · +ngram-resident (big RAM) | footprint vs decode variance |
| Quant recipe | all-4bit (default) · mixed-4-8 (trunk/attn 8-bit) · compact (3-bit experts) · ngram bits 4/6/8 | quality vs disk/RAM |
| KV | bf16 (default) · fp8 (later) | context memory |
| Context cap | 8k…262k | KV budget per tier |
| Prefetch | off · cross-token(W=1,4,16) · +hot-set pinning | latency hiding |
| Prefill mode | cached · dense-sweep (auto threshold) | prefill throughput |
| IO mode | nocache (default) · pagecache-L2 | determinism vs free OS cache |
| QD / staging | 8–32 / 64–256 MB | SSD utilization |
| MTP self-spec decode | off (v0) · on (M9, big-memory tiers only — see the M9 design note) | decode multiplier where launch-bound; costs ~17 experts/layer |

### Presets v1 (est. columns to be replaced by M8 measurements)

Budget rule: total footprint ≤ ~65–70% of RAM **and** under
`max_recommended_working_set_size`, leaving OS+apps alive. ✅measured on this Mac:
working set = **37.4 GiB of 48 GB** (78%), so the real ceiling is tighter than "RAM"
everywhere — `doctor` must read this value, not infer it from `hw.memsize`. Also
✅measured: `max_buffer_length` = **28.1 GiB**, which caps any *single* MLXArray;
harmless in the 9-tensor pool layout (a 204-experts/layer = 27 GB pool's largest tensor is 8.0 GiB) but
it would have been binding for a single-tensor pool.

Resident floor ✅measured at **3.822 GB** (everything except experts and n-gram),
up from the 3.3 GB estimated — footprints below include this.

**✅ Auto-tuning planner implemented (2026-08-28), replacing named presets as the
default UX.** `SlotstreamCore/Plan.swift` is the single policy used by run/serve/
doctor and echoed in `/api/show` `details.memory_plan`. Policy: ceiling =
min(70% of RAM, working set − 2 GB), then **clamped to currently reclaimable
memory** (free + purgeable + file-cache pages via `host_statistics64` — what can
be taken without compressing/swapping other apps; `kern.memorystatus_level` was
rejected as too optimistic) minus max(1.5 GB, 5% RAM) slack, with an explanatory
note whenever the clamp binds; quiet machine ⇒ clamp never binds ⇒ deterministic.
Pool = target − 3.9 GB fixed footprint (resident weights + n-gram row cache)
− 0.5 GB margin; floor 640 global slots (~14/layer); min honest target 6.2 GB.
Precedence `--experts-per-layer` > `--pool-gb` > `--memory-gb` > auto, losing
knobs noted, never silently dropped; explicit knobs are never resized by the
clamp (informational note only). `doctor --sim-ram/--sim-working-set/
--sim-available` previews any machine; `Tools/planner_gates.sh` pins seven setups
(48 GB pristine/busy, 16 GB pristine/busy, 8 GB, 128 GB, explicit-on-busy).
✅Measured live under a 21.5 GB incompressible hog: auto sized 36.1 → 10.7 GB
(47/layer), generated at a 9.4 GB actual peak with no thrash, and recovered to
34.4 GB when the hog exited.

**✅ Elastic pool implemented (2026-08-28): `serve` resizes the cache while
running.** `SlotstreamCore/Governor.swift` re-runs the feasibility replan every
15 s (crediting the pool + fixed footprint a restart would release; absolute
dead-bands −1 GB shrink / +2 GB grow, one-step convergence) and subscribes to
OS memory-pressure events as the overcommit backstop (warning ≥2 GB/15%,
critical ≥4 GB/50%, repeated events keep shedding; growth waits 60 s of calm).
Resizes run strictly between requests under the generation lock: grow copies
contents piece-by-piece (transient ≤ one piece), shrink frees before
reallocating (transient = max(old,new), restarts cold — under pressure,
holding two pools to keep warmth would spike memory at the wrong moment).
Auto-sized pools only; explicit knobs and `--no-elastic` pin. Byte-exactness
across live resizes is a standing gate (`slotstream elastic-check`), and live
hog experiments (shed cascade, identical outputs under pressure, contents-kept
recovery, macOS-swaps-idle equilibrium) are in MEASUREMENTS.
The startup announce prints device, target, experts/layer cached, expected peak,
and est. warm tok/s (log-linear between the measured anchors 30/layer = 5.6 and
181/layer = 20.0, flat above — decode is launch-bound past ~181/layer). Promise
✅measured: `--memory-gb 8` → 27/layer, **7.0 GB actual peak** (predicted 7.5),
5.2 tok/s, byte-identical greedy output; auto on this Mac → 36.1 GB target,
239/layer, **35.0 GB actual peak** (predicted 35.6). The preset table below
remains the cross-machine *map*; the planner is the *mechanism* that lands each
machine on its row without anyone reading the table.

| Preset | RAM | **Experts/layer cached** (of 512) | Cache mem | Footprint | Ctx default | h est. | Decode est. | Measured |
|---|---|---|---|---|---|---|---|---|
| `max192` | ≥192 GB | **512** + ngram resident, MTP on | 67.9 GB | ~110 GB | 262k | 1.0 | 40–80 | — |
| `big128` | 128 GB | **512**; ngram streamed | 67.9 GB | ~79 GB | 262k | 1.0 | 35–70 | — |
| `big96` | 96 GB | **~414**; ngram streamed | ~55 GB | ~63 GB | 128k | ~0.99 | 30–60 | — |
| `big64` | 64 GB | **~271** | ~36 GB | ~42 GB | 128k | .93–.98 | 25–45 | — |
| `pro48` ← this Mac | 48 GB | **~204** | ~27 GB | ~32 GB | 64k | .88–.96 | 18–35 | 20.0 warm @181/layer |
| `mid32` | 32 GB | **~121** | ~16 GB | ~21 GB | 32k | .80–.92 | 12–25 | — |
| `mid24` | 24 GB | **~79** | ~10.5 GB | ~15.5 GB | 32k | .70–.87 | 8–16 | — |
| `lite16` | 16 GB | **~41** | ~5.5 GB | ~10 GB | 16k | .55–.80 | 4–9 | 5.6 @30/layer (emulated) |
| `edge8` (experimental) | 8 GB | **~14** (the floor) | ~1.8 GB | ~5 GB | 8k | .30–.60 | 1–4 | — |

**The decode-est. column is now known to be too pessimistic at the low end.** With
17.3 GB/s measured, IO alone floors decode at ~13 tok/s even at h=0, so `lite16`
(4–9) and `edge8` (1–4) are wrong *as IO estimates*; their real limit is memory
pressure and compute. Those bands are left unrevised deliberately — M8 replaces them
with measurements rather than a second round of guessing.

Notes: fully-resident-incl-ngram on a 128 GB Mac (~110 GB with KV) exceeds the default
wired limit (~96 GB) — possible only with an explicit `iogpu.wired_limit_mb` bump, which
is why `big128` streams the n-gram store instead: it needs no sysctl and loses almost
nothing (n-gram IO is ✅measured at 16 rows ≈ 1.6 KB/token, exact-prefetched). Smaller Macs also have slower SSDs (1.5–3.5 GB/s) — folded into the est. bands;
`lite16`/`edge8` use trunk @4-bit to shave the floor; `edge8` may additionally need the
compact 3-bit expert build and a raised `iogpu.wired_limit_mb` (doctor detects + explains,
never auto-sudos). External USB4 NVMe (~3 GB/s) is a supported weights location — worth a
row in the matrix for 256 GB-internal-disk Macs.

---

## 6. Correctness strategy (non-negotiable invariants)

1. **Streaming must be math-invisible.** Same engine, tiny cache vs infinite cache, greedy
   sampling → **identical token sequences**, always. This is a claim about the *expert
   pool*, where a hit and a miss deliver the same bytes to the same kernel. It does not
   extend to anything that changes how tokens are *batched* — prefill chunk size or
   conversation prefix reuse — where MLX picks reduction orders by shape and floating
   point is not associative (measured: MEASUREMENTS.md). Those are gated against a
   control instead. This is the golden test run in CI on
   a synthetic small qwen4_exp config and on truncated real weights.
2. **Parity with the Python reference** (the `qwen4_exp.py` shipped in the MLX conversions
   / PR #1788, revision-pinned and vendored into `Tools/reference/`): layer-by-layer
   hidden-state comparison on real weights for each of the four block types (GDN, QSA,
   MoE, PLE) — the full model never needs to fit in RAM to prove the port is right.
   Target ≤1e-2 relative; investigate anything above.
3. **GDN state stays fp32** (`mamba_ssm_dtype: float32`) — numerics drift here is a known
   architecture foot-gun.
4. **QSA: the indexer is core, not optional.** Dense attention is exactly equivalent only
   while context ≤ the indexer budget (2048 tokens) — beyond that the trained behavior is
   top-2048-token sparse attention, and a dense path silently diverges from the model as
   trained (and from the Python reference, so parity would fail anyway). Implement the
   indexer in M3 proper; keep the dense path as a *test oracle* for ≤2048-token parity
   runs and as a debug flag, never as the shipped path.
5. Repack is checksummed both directions (source tensor sha → record sha), and `pull`
   verifies before first run. Model is 2 days old; expect re-releases — pin revisions.

---

## 7. Test matrix & iteration protocol ("test them all", tractably)

Three stages so the combinatorics stay sane:

- **Stage A — simulator sweep (cheap, thousands of configs).** The M1 cache simulator
  replays recorded router traces against {policy × slot-count × prefetch-window} in
  minutes, no model needed. Output: h-curves per workload per tier → prune to top-3
  configs per tier.
- **Stage B — live sweeps on the dev Mac.** Real engine, real SSD: run Stage-A winners per
  tier using `--sim-ram` (hard-capped budgets emulating 8–32 GB on this 48 GB machine),
  plus the axes the simulator can't see (QD, staging, io-mode, dense-sweep threshold,
  quant recipe). `slotstream bench` emits JSON + markdown into `bench/results/<host>/`,
  committed.
- **Stage C — real machines.** The binary + `bench --suite full` is a 10-minute favor on
  any Mac. Validate ≥1 real ≤16 GB machine before claiming the tier (sim-RAM can't emulate
  the real wired-limit and slower SSD). Borrow/family machines; MacStadium rental is the
  fallback.

**Bench workloads** (fixed, versioned in `bench/workloads/`): W1 cold-start→first-token ·
W2 warm short chat (256/256) · W3 8k prefill+512 · W4 64k prefill+512 (≥48 GB tiers) ·
W5 15-min sustained generation (thermal/soak) · W6 agentic trace replay (many short
alternating turns — realistic expert locality) · W7 two queued clients.
**Metrics per run**: ttft, prefill tok/s, decode tok/s p50/p95, slot hit rate, GB read,
read amplification, peak phys_footprint, wired GPU MB, **swap delta (must be 0)**, SSD
MB/s, thermal pressure + energy (powermetrics).

**Iteration protocol** (repeat until §11 done): pick worst tier vs targets → profile
(Instruments Metal System Trace + fs_usage) → change one knob → bench → commit results +
update preset table → next. Locality traces from real usage (opt-in local stats) feed back
into hot-set lists.

---

## 8. Milestones

Effort in focused solo days (agent-assisted); order is dependency-driven. M1 gates nothing
except tuning — Swift work starts in parallel after M0.

### M0 — Ground truth & feasibility (0.5–1 d)
Download the pinned community MLX 4-bit conversion; script that recomputes §3 from the
actual `config.json` + safetensors index (fail loudly on drift). Read the reference
`qwen4_exp.py` / PR #1788; document the exact n-gram hashing + lookup count, MTP wiring,
QSA indexer math into §2. Write `DiskBench` (pread QD×size sweep incl. 2.76 MB and
4–16 KiB patterns, F_NOCACHE on/off) and run on this Mac; record Metal
recommendedMaxWorkingSetSize and default wired limit; check `mlx-swift-lm` for an existing
Qwen3-Next/GDN Swift implementation (if present, M3 shrinks by days). Verify
swift-transformers Jinja handles this chat template.
**Exit:** §2/§3 tables re-verified; SSD curve measured; weights source pinned (or fallback
conversion plan triggered); `gatherQMM` + quantized in-place updates confirmed available
in mlx-swift (slot-write microbench specced); M3 effort re-estimated.

### M1 — Expert-locality study (1–2 d, the cheap de-risk)
Traces: instrument the Python reference (mlx-lm branch) to dump per-layer top-k ids.
(a) **Proxy, free, local**: Qwen3-Next-80B-A3B (same 512-expert/top-10 routing family)
fits this Mac at 3–4-bit — collect traces across chat/code/long-doc/agentic corpora.
(b) **Real model, small paid run (approval-gated, ~US$30–60)**: rented 2×H200 (or 4×A100)
running the official FP8 via vLLM day-0 recipe with a 20-line router-logging patch; 1–2M
tokens ≈ ~1–2 GB of traces. Build the **cache simulator** (replays traces vs policy ×
size × prefetch-window; also computes prefill per-chunk expert coverage and hot-set
concentration).
**Exit:** h(size) curves per workload committed; eviction policy + prefetch window chosen;
preset table §5 updated; explicit go/no-go note for `lite16` (needs h ≥ ~0.6 @ 5.5 GB) and
`edge8`.

### M2 — Container + repack (1–2 d)
`Tools/repack.py` (Python, tooling-only): MLX safetensors → `.ssmodel` per §4.1, bit-exact,
checksummed, config-driven geometry. Swift `Format/` reader + verifier.
**Exit:** full 4-bit repack on this Mac; random-sampled records byte-equal to source
tensors; `slotstream verify` green.

### M3 — Swift engine, resident-path correctness (**3–5 d**, revised down after M0)

Revised because M0 found far more Swift prior art than assumed: `gatedDeltaUpdate` +
`Qwen3NextGatedDeltaNet`, `SwitchGLU`/`QuantizedSwitchLinear`, and
`gatherQuantizedMM` all already exist and are verified working (MEASUREMENTS.md
§M0.3–4). The slot-write gate is already passed, so the microbench that opened this
milestone is done. Novel work is now only: QSA indexer, hyper-connections, PLE path.
Add the metallib/Xcode decision (open question 9) before anything ships.

Entry task: the §4.2 slot-write microbench. Then port qwen4_exp to mlx-swift in
`SlotstreamCore/Model/`: GDN (chunked gated delta rule; fp32 state; custom Metal kernel
only if profiling demands — start with pure MLX ops), QSA **including the indexer**
(dense path kept only as the ≤2048-token test oracle, per §6.4), MoE via `gatherQMM`
(resident pool = all experts of the layers under test), hyper-connections, n-gram/PLE
module, sampler (temp/top-p/top-k/min-p/presence). No vision, no MTP. Test rig: truncated
real-weight prefixes (first 4–8 layers) vs Python reference, layer-by-layer; synthetic
tiny config for full-graph unit tests + CI.
**Exit:** parity per §6.2 on all four block types (QSA checked both ≤2048 dense-oracle
and >2048 indexer-vs-reference); tiny-config end-to-end generation matches Python greedy
output; tokenizer round-trip parity vs Python on a mixed corpus (code/multilingual/emoji).

### M4 — Slot streaming decode → first full-model run (3–5 d) — **the gating milestone**

Reordered emphasis after M0.8: because MLX materialises whole tensors out of mmap,
**no full-model forward pass is possible at all until the slot pool exists**. M3's
layerwise parity work is unaffected (its 4–8-layer truncated rig needs only
5.6–11 GB of experts, which does fit), but "run the model" and "stream the model"
are the same milestone, not consecutive ones. Plan M3 and M4 as one continuous push
with a single integration point.

SlotPool + eviction + pinning; ExpertStore/NgramStore with F_NOCACHE read pool; staging →
pool writes; n-gram exact prefetch; Governor v0 (static budgets); golden equivalence
(§6.1). Then the milestone moment: **the full 125B+51B model generating on this 48 GB Mac
under `pro48`.** Sanity-compare outputs against the official FP8 cloud endpoint on a fixed
prompt set (distribution-level, not bit-level).
**Exit:** golden test green; warm-chat decode ≥ 10 tok/s on this Mac (pre-tuning);
footprint within budget ±5%; 30-min soak with zero swap growth.

### M5 — Dense-sweep prefill + prefetch + perf (2–4 d)
Chunked sweep prefill with grouped staging + auto threshold + scan-resistant admission
(§3.3); cross-token prefetcher; QD autotune from doctor data; overlap shared-expert
branch with miss fetches.
**Exit:** dev-Mac targets — prefill ≥ 150 tok/s @8k, decode ≥ 20 tok/s warm chat,
`--sim-ram 16` decode ≥ 4 tok/s.

### M6 — Server (2–3 d)
Hummingbird app per §4.4; NDJSON/SSE streaming; template rendering incl. `think` and
`tools`; keep_alive lifecycle; cancellation; queueing.
**Exit:** Open WebUI, one editor client (Zed/Continue via OpenAI path), and raw `curl`
scripts (incl. `ollama` CLI pointed via `OLLAMA_HOST`) all work: list, chat, stream,
cancel, unload.

### M7 — CLI, install, packaging (1–2 d)
`pull` (resumable HF download + repack + verify + disk preflight), `doctor`, `install`
(LaunchAgent), config/env/logs, `make install`, `gh release` arm64 binary.
**Exit:** clean-machine bring-up in ≤ 3 commands ≤ 30 min (download-dominated).

### M8 — Matrix bench + tier validation (2–4 d first pass, then the §7 loop)
Run Stages A→C; fill every Measured column in §5; tune; freeze presets v1; write honest
per-tier expectations into README.
**Exit:** §5 table complete for ≥4 tiers incl. one real ≤16 GB Mac; §11 checklist review.

---

### 8.1 Next — the ordered queue (post-0.1.5)

Ordering only, deliberately no day estimates. The ordering principle is **what decides
whether someone keeps using this after their first session**, which is not the same as
what completes the milestone map — see the deprioritized list at the end.

### N1 — Conversation prefix cache (KV + GDN state reuse across requests)

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

### N2 — Dense-sweep prefill (the remainder of M5)

N1 cannot help the first turn, a pasted document, or a fresh RAG context; only a faster
pass can. Sizing the pass from the memory plan already took prefill 40 → 92 tok/s
(M7.6); the remaining work is the dense sweep proper per §3.3 — grouped staging, auto
threshold, scan-resistant admission — plus the cross-token prefetcher. This multiplies
with N1 rather than overlapping it: N1 removes repeated work, N2 speeds up the pass that
is genuinely unavoidable.

**Exit:** ≥150 tok/s @8k on the dev Mac; byte-identical output at every pass size (the
existing standing gate).

### N3 and N4 — removed from the queue (2026-08-30)

Both were dropped as work items. They are recorded here rather than deleted so
that neither gets re-proposed from first principles later; the measurements are
in MEASUREMENTS.md.

- **N3 (the 104 GB download).** Three levers, all closed. Hosting is not the
  bottleneck — Cloudflare R2 measured no faster than Hugging Face (42 to 51
  against 36 to 50 MB/s) on a link that does 134, and Hugging Face is free.
  Serving before the download completes fails on arithmetic, not engineering: a
  missing expert is a wrong answer rather than a slow one, so the fetch must
  block, and one token needs ~1.3 GB of experts — about 26 s per token until the
  download catches up, which is worse than the progress bar it would replace.
  That left a smaller build, which needs a billed re-quantization run and a
  quality gate to prove it cost nothing.
- **N4 (quality against the FP8 reference).** That gate needs an inference
  credential for Qwen3.8-Flash-Next FP8 — Qwen's own DashScope or an aggregator
  carrying it. None is provisioned and it is paid.
  `Tools/quality_probe.sh` remains in the battery: 15 checkable items covering
  recall, arithmetic, sorting, instruction obedience, translation and code. It
  catches gross quantization damage and gates any future re-quantization. It is
  **not** a comparison against FP8 and must never be described as one.

### N5 — Real GUI and editor clients

Open WebUI and one editor client (Zed or Continue via the OpenAI path) — the remaining
M6 exit criteria. The Ollama CLI and the OpenAI Python SDK are both proven end to end as
of 0.1.5, so the wire protocol is not in doubt; this is cheap insurance against a client
that disagrees anyway. Low risk, binary outcome.

### Deprioritized (decision 2026-08-29)

Not abandoned, but explicitly behind N1–N5. None of these changes whether a person keeps
using slotstream; they are credibility artifacts and completeness for the milestone map:

- **M8 in full** — the `slotstream bench` subcommand, the W1–W7 workloads, the §5
  Measured column, the presets freeze. Days of building a measurement rig whose output is
  a table. Do targeted measurements ad hoc instead.
- **`lite16` on a real 16 GB Mac** — also blocked on someone else's hardware.
- **M1 locality traces**, **LaunchAgent**. (M9 MTP left this list 2026-09-01 — built; see the M9 design note addendum.)
- *Exception on the soak:* a leak that only appears after 30 minutes is a real bug, not a
  credibility item. Ordinary daily use covers it in the meantime; W5 does not have to be
  built to catch it.

---

### M9 design note — MTP self-speculative decode: when it pays, and when experts win

Not built in v0, and the pinned community conversion drops the MTP tensors
(`sanitize` removes them; the measured 103.8 GB inventory has none), so the block
must first be converted and quantized from Qwen's official release. This note
records the first-principles analysis of *whether* to spend memory on it, because
the answer is strongly tier-dependent and the earlier plan text had it backwards.

**Two walls, and memory decides which one you are against.**

- **Small cache → fetch-bound.** Most tokens miss; decode waits on SSD reads
  layer by layer. Compute idles.
- **Large cache → launch-bound.** Nearly everything hits; decode is limited by
  kernel-launch count, not bytes (MEASUREMENTS §M0.6: batch-1 4-bit matmul reaches 20% of
  memory bandwidth; measured decode is flat above ~181 experts/layer).

Extra experts attack the fetch wall. MTP attacks the launch wall: verifying k
drafted tokens costs roughly the launches of one. So MTP's ~1.4–1.6× is a
*constant multiplier that only applies in the launch-bound regime*, while the
value of the ~17 experts/layer its 2.25 GB displaces follows the measured
decode curve (≈ experts^0.7 between the 30/layer = 5.6 and 181/layer = 20.0
anchors, flat above).

**Why tight memory keeps the experts** — three compounding reasons, not one:

1. **It sells cache at its highest price.** Those 17 experts/layer are worth
   ≈ +40% near the floor, ≈ +12% at 100/layer, and 0% past the plateau.
2. **It spends the scarce resource on discarded work.** Every rejected draft
   (30–40% at plausible accept rates) still fetched that token's experts from
   SSD. Wasted verification is nearly free when compute-bound and maximally
   expensive when fetch-bound.
3. **Its one genuine small-tier upside is already harvested.** Batching two
   tokens' expert fetches works because consecutive tokens reuse experts — which
   is exactly the locality the cache already exploits, and which the MTP tax
   shrinks the cache's ability to hold.

Real small Macs also have slower SSDs than this dev machine, which deepens the
fetch wall and widens the verdict.

**Enable policy (to be confirmed by measurement, not shipped on this reasoning
alone):** auto turns MTP on only when the target still affords ~120+ experts per
layer *after* paying its 2.25 GB — roughly targets above ~22 GB, so 32 GB
machines always, 24 GB when quiet, 48 GB unconditionally (there the displaced
experts are past the plateau and worth nothing, making MTP close to free). At
16 GB and at the floor, MTP stays off. **Governor ordering: shed MTP before
shrinking the pool** — dropping a constant-multiplier feature always beats
starving the cache below its knee.

**Correctness:** with exact-match acceptance under greedy sampling, speculative
decode is byte-identical to plain greedy, so MTP on/off (including a live
governor toggle) falls under the existing golden-equivalence invariant (§6.1)
and `elastic-check`-style gating rather than needing a new correctness story.

**Measure before freezing any threshold:** (a) this model's real accept rate on
representative text — nobody has published one; (b) whether draft-batched expert
fetches actually raise queue depth enough to matter on fetch-bound tiers; (c)
the true resident cost of the converted 4-bit MTP block (2.25 GB is an estimate).

### M9 addendum — built and measured (2026-09-01)

The analysis above survived contact with implementation almost intact; the
corrections are recorded here and in MEASUREMENTS.md (M9 section).

- **Weights**: converted from the official release via ranged downloads of
  exactly the 31 `mtp.*` tensors (4.9 GB, 92 s) — `Tools/mtp_convert.py`,
  provenance in `mtp.provenance.json`. Real resident cost **1.47 GB**, not
  the 2.25 estimated. The +1 norm-centering convention was verified
  tensor-by-tensor against the official raw checkpoint before conversion.
- **Port**: the Swift head is **bit-exact** against the MLX Python reference
  (`mtp-parity`, real captured inputs, reference run under mlx 0.31.x — the
  kernel family mlx-swift pins). Semantics follow vLLM's scheme A: the
  chained draft feeds the PRE-mixer multi stream forward.
- **Accept curve (measured, previously unpublished)**: 85.8% at depth 1,
  71.0/53.8/41.3% for 2/3/4-chains; E[tokens/round] 3.52 at depth 4.
- **Enable policy shipped as designed**: `--mtp auto|on|off`; auto turns the
  head on only when the cache still reaches **≥120 experts/layer after its
  1.6 GB** (`mtpAutoFloorPerLayer`), and raises the auto ceiling to 34.6 GB
  so the pool still reaches the knee. A/B at 54/layer measured **×0.96** —
  the "tight memory keeps the experts" argument, confirmed with numbers.
  The plateau-regime A/B (est. ×1.5–1.9) awaits a quiet machine:
  `slotstream mtp-bench --memory-gb 26`.
- **One claim corrected**: "byte-identical to plain greedy" was wrong for the
  same reason prefix reuse isn't byte-identical — the verify pass re-batches
  tokens and re-association moves near-tie logits. Gates (`mtp-check`):
  determinism across runs, prefix-cache continuation of speculative
  conversations, non-degenerate accept, divergence reported. Sampling
  semantics are exact by construction (sequential draws off verified logits).
- **Governor**: MTP is a startup decision; the elastic governor sizes the
  pool around it (the head's 1.6 GB shows up in availability, so the pool
  self-corrects). "Shed MTP before the pool" from the note is NOT built —
  a live toggle would need golden-equivalence gating of the switch itself;
  revisit only if pressure shedding proves insufficient in practice.

### M9+ — Later (each gated on v0.1 done)
Vision input (mlx-vlm parity). Compact 3-bit-expert build with eval gate.
fp8 KV. Memory-pressure dynamic resharding. JSON-schema constrained output. Upstreaming
reusable pieces (GDN Swift kernel) to mlx-swift-lm. Multi-model residency. Qwen4 when it
lands (the whole point of targeting the preview architecture now).

---

## 9. Risk register

| Risk | Likelihood | Mitigation |
|---|---|---|
| Expert locality worse than assumed (flat router → low h) | medium | **downgraded**: at the measured 17.3 GB/s even h=0 sustains ~13 tok/s, so low locality costs speed, not viability. M1 still sizes the tiers |
| Model is far slower than hoped for *compute* reasons (launch-bound decode) | **medium-high, newly elevated** | batch-1 4-bit matmul measured at 47 GB/s vs 235 GB/s bandwidth → decode is kernel-launch-bound. Mitigation: MLX compiled graphs (`Qwen3NextCompiledDecodeTests` shows upstream does this), fewer/larger kernels, MTP self-speculation. Measure on the real model before optimising |
| Community 4-bit conversion broken/requantized badly | medium | spot-check vs FP8 endpoint at M0; pin revision; fallback own conversion on rented box (approval-gated) |
| mlx-lm PR churn / reference impl bugs | medium | vendor the exact reference revision into repo; layerwise parity catches divergence |
| GDN port numerics (fp32 state, chunked scan) | medium | §6.2 layerwise harness from day one; keep pure-MLX-op version as oracle for any later Metal kernel |
| QSA indexer complexity (core path — dense is only exact ≤ 2048 tokens) | medium | port from reference impl; dense path as ≤2k test oracle; +1–2 d already in the M3 estimate |
| ~~`gatherQMM`/slice-write perf in mlx-swift~~ | **RESOLVED** ✅ | `MLX.gatherQuantizedMM` exists and is bit-identical to `quantizedMatmul`; batched slot scatter measured 49.8 GB/s (Swift) / 74.9 GB/s (Python, 27 GB pool), in place. ~12× faster than the SSD can feed it |
| **mlx-swift Metal shaders cannot be built by SwiftPM CLI — needs Xcode** | **CONFIRMED, resolved by vendoring** | mlx-swift's own README says so; this machine has CLT only. Workaround shipped: colocate the prebuilt `mlx.metallib` next to the binary. **Scope correction 2026-08-30 — this does not block writing new kernels.** It is about building mlx-swift's *bundled* library. A custom kernel goes through `MLXFast.metalKernel`, which JIT-compiles Metal source at runtime with no offline toolchain; `GatedDelta.swift` already ships one, and a fresh kernel was verified compiling and running on this CLT-only machine. The two were conflated and the grouped-GEMM work was wrongly called blocked |
| F_NOCACHE semantics/perf on APFS | low-med | DiskBench A/Bs it at M0; pagecache mode as fallback |
| Wired-limit ceilings on ≤16 GB Macs | high (known) | doctor measures + documents `iogpu.wired_limit_mb`; budgets sized under recommendedMaxWorkingSetSize; never auto-sudo |
| Thermal throttling on fanless Airs | high (known) | W5 soak captures sustained numbers; publish sustained not burst |
| Model is 2 days old — ecosystem/weights churn | high | pin everything; manifest checksums; §2 re-verify step in M0 is repeatable |
| Scope creep (vision, MTP, batching, other models) | high | §8 gates; v0 = text, single-flight, this model only |

## 10. Dev-Mac reference (measured 2026-08-28 — full data in MEASUREMENTS.md)

MacBook Pro, Apple M5 Pro, 48 GB unified, 18 cores, 2 TB SSD (APPLE SSD AP2048Z),
macOS 26 (Darwin 25.6.0), Swift 6.3.3, page size 16 KiB.

| Measured | Value |
|---|---|
| Metal working set | 40,200,896,512 B (**37.4 GiB**) |
| Metal max single buffer | 30,150,672,384 B (**28.1 GiB**) |
| `iogpu.wired_limit_mb` | 0 (default) |
| Unified-memory bandwidth | **235.1 GB/s** |
| Batch-1 4-bit matmul | 47.2 GB/s (launch-bound) |
| SSD random 2.7648 MB, cold never-repeat | 9.46 (QD1) → **17.3 GB/s** (QD8+) |
| SSD random 4 KiB / 16 KiB, QD1 | 0.08 / 0.27 GB/s (53.6 / 60.1 µs) |
| Slot scatter, 204-experts/layer (27 GB) pool | **74.9 GB/s**, in place |
| Xcode | **not installed** (CLT only) — see risk register |

## 11. Definition of Done — v0.1 (updated with 2026-08-28 results)

- [x] Golden: tiny-cache ≡ big-cache greedy outputs, exact — **passed on the full
      model** (30 vs 181 experts/layer cached, identical text).
- [x] Parity vs Python reference: layers 0–1 (GDN, MoE-over-pool, PLE,
      hyper-connections, embeddings) **bit-exact**; QSA layer ≤2.4% RMS with the
      few-ulp vendored-kernel origin documented in MEASUREMENTS.md.
- [ ] This Mac: decode ≥ 20 tok/s warm chat — **was marked ✅ (20.01) and is now
      unconfirmed**: re-measured on 0.1.6 the curve reads 6.0 / 8.2 / 11.2 / 11.6
      tok/s at 30 / 60 / 120 / 150 experts per layer and is already flat by 120.
      Not a regression (0.1.5 and 0.1.6 A/B identical) and not under-warming
      (flat over 14 consecutive generations). The 181/layer config that produced
      20.01 peaks at 27.4 GB and has not fit in reclaimable memory since.
      · cold→first-token ≤ 15 s ✅
      (~12 s) · prefill ≥ 150 tok/s @8k **not yet** (needs the dense sweep; chunked
      prefill sized from the memory plan measures 92 tok/s, up from 40) · 30-min
      soak not yet run.
- [ ] `lite16` on a **real** 16 GB Mac (emulated already: 5.6 tok/s in 7.3 GB peak)
      — **deliberately deferred**, see §8.1.
- [ ] bench matrix ≥ 4 tiers; presets frozen — **deliberately deferred**, see §8.1.
- [~] Ollama surface: full curl-level battery passes (`Tools/api_test.sh`:
      version/tags/chat±stream/generate/v1±SSE/embed-reject); real GUI clients
      not yet exercised (sandbox intercepts local HTTP clients; nc transport used).
- [~] Clean-machine install: one-line curl installer + v0.1.0 release binary +
      consent-gated auto-pull shipped and tested end to end here; LaunchAgent
      not built, and no clean *machine* has run it yet.
- [x] Docs from measured numbers only (README/MEASUREMENTS).

## 12. Open questions (answer at the milestone noted)

1. ✅**ANSWERED (M0).** N-gram indexing: `ngram_heads = (ngram_size−1) × heads_per_ngram
   = 16`; per head, id = XOR of `splitmix64`-derived multipliers over the token n-gram,
   mod that head's distinct prime near 20 M (`_nth_prime_after(19_999_999, g+1)`), plus
   the head's offset; the concatenation is split into 128 shards of 2,500,012 rows.
   Rows are 160-dim, 100 B packed, quant group 32. PLE sits at layer index 1.
2. ✅**ANSWERED (M0).** **16 rows per token = 1,600 B** of n-gram data (≈20× less than
   the 23 KB assumed). Unrepacked that is 48 scattered preads/token; repacked, 16.
3. ✅**ANSWERED (M0), and better than hoped.** `mlx-swift-lm` ships
   `Qwen3NextGatedDeltaNet` + `gatedDeltaUpdate` (with `conv1d`, `dt_bias`, `A_log`,
   a `decodeConv` fast path, and compiled-decode tests), plus `SwitchGLU` /
   `QuantizedSwitchLinear` over `MLX.gatherQuantizedMM`. Novel Swift work reduces to
   the QSA indexer, hyper-connections, and the PLE path.
4. MTP block internals (own experts?) and self-spec accept rates on this model (M9)
   — now the load-bearing unknown for §8.1's enable thresholds, together with
   whether draft-batched expert fetches help fetch-bound tiers at all.
5. h-curves per tier (M1) — **no longer the load-bearing unknown**: at 17.3 GB/s even
   h=0 sustains ~13 tok/s. It now sizes tiers rather than deciding viability.
6. Whether `mixed-4-8` measurably beats all-4-bit on agentic evals worth +disk (M8).
7. External-USB4-NVMe tier viability for 256 GB-disk Macs (M8, one bench row).
8. **NEW — the actual binding constraint.** How much of decode is kernel-launch
   overhead, and how far do MLX compiled graphs close it? Batch-1 matmul hits only
   20% of memory bandwidth. This displaced IO as the top performance risk (M4/M5).
9. ✅**ANSWERED (M7).** Metal shader build: **vendored metallib**. CI builds the
   release with Xcode on its runner and ships `mlx.metallib` beside the binary;
   a CLT-only machine builds and runs fine against it. Separately — and this was
   conflated for two releases — *writing a new kernel* needs neither, because
   `MLXFast.metalKernel` JIT-compiles at runtime, which is how the gated-DeltaNet
   kernel already ships.
10. **NEW (2026-08-29), and the reason N1 exists.** How much of real-world latency is
   re-prefill rather than prefill? Found by inspection, not measurement: state is rebuilt
   per request, so for a conversation it is *all* of it after turn 1. Open sub-question
   for N1: how often does a real client actually send an exactly-extending prefix
   (tool loops and edited history both break it), i.e. what is the true hit rate of an
   extend-only cache?

## 13. References

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
