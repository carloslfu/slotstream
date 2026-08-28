# slotstream — Qwen3.8-Flash-Next on every Apple Silicon Mac

**One binary. MLX + Swift. SSD-streamed experts + n-gram/PLE store, RAM cache slots as the
speed↔memory knob, Ollama-compatible API.**

Created 2026-08-28. This file is the whole plan: design, math, build phases, test matrix,
and the living status tracker. Update it in place as milestones land (checkboxes + the
Measured columns). Everything marked **est.** is a first-principles estimate to be replaced
by a measurement; everything marked **verified** came from the model config or a live check.

---

## 0. Status tracker (living)

| Milestone | State | Exit proof |
|---|---|---|
| M0 Ground truth & feasibility | ☐ not started | numbers table below filled with measured values |
| M1 Expert-locality study | ☐ | hit-rate curves committed to `bench/locality/` |
| M2 `.ssmodel` container + repack | ☐ | byte-exact spot checks pass |
| M3 Swift engine, resident correctness (incl. QSA indexer) | ☐ | layerwise parity vs Python ref ≤ 1e-2 |
| M4 Slot streaming decode (first full-model run) | ☐ | golden equivalence + ≥10 tok/s warm on dev Mac |
| M5 Dense-sweep prefill + prefetch | ☐ | perf targets §10 hit on dev Mac |
| M6 Ollama-compatible server | ☐ | 3 real clients work end-to-end |
| M7 CLI, install, packaging | ☐ | clean-machine install ≤ 3 commands |
| M8 Matrix bench + tier validation | ☐ | preset table §7 filled with measured numbers |
| v0.1 Definition of Done (§11) | ☐ | all boxes checked |

---

## 1. Goal

Run **Qwen3.8-Flash-Next** (released 2026-08-26; 125B total / 6B active, + 51B n-gram
embedding store, + 4B MTP) **in 4-bit on this Mac (MacBook Pro, M5 Pro, 48 GB) and on Macs
with much less memory (down to 16 GB officially, 8 GB experimentally)**, by:

1. Keeping the small dense trunk resident.
2. Streaming the **routed experts** from SSD into a fixed pool of **cache slots** — the slot
   count is *the* RAM↔speed tradeoff knob.
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
| Routed experts (48×512) | 120.8B | **67.9 GB** | SSD, slot-cached |
| — one expert record (3 × 2560×640) | 4.92M | **2.76 MB** | unit of streaming |
| — one layer's experts (512) | 2.52B | 1.42 GB | unit of prefill sweep |
| Shared experts (48) | 0.24B | 133 MB | resident, always |
| Routers (48 × 2560×512) | 63M | 126 MB (bf16) | resident (routing precedes fetch) |
| Dense trunk (GDN+QSA+HC+norms) | ~2.7B | 1.5 GB (2.2 GB @6-bit) | resident |
| Embeddings + lm_head (untied) | 1.27B | 0.72 GB | resident |
| N-gram/PLE store | 51.2B | **28.8 GB** (row = 1,440 B) | SSD, row-cached, exact-prefetched |
| MTP block | ~4B | 2.25 GB | optional, off in v0 |
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
miss_bytes/token = 480 × (1 − h) × 2.76 MB          (+ ~23 KB ngram rows, prefetched)
t_token ≈ max(t_compute, miss_bytes / BW_ssd_eff) + stalls
```

- `t_compute` floor (resident path): ~6B active × 0.5625 B ≈ 3.4 GB read from unified
  memory per token → at ~270 GB/s ≈ 12.5 ms → **~60–80 tok/s ceiling** (est.; M5 Pro
  bandwidth to be measured at M0).
- `BW_ssd_eff`: Apple NVMe does 5–7 GB/s sequential on recent 1–2 TB drives; 2.76 MB
  random reads reach near-sequential rates at queue depth ≥ 8–16 (M0 measures the real
  curve; base-capacity SSDs on small Macs are slower, 1.5–3.5 GB/s).
- Worst case h=0 (cold): 1.33 GB/token → ~0.2–0.9 s/token = 1–5 tok/s. **Even the floor is
  usable-ish**, which is why the 8 GB tier is "experimental" rather than "impossible".
- Per-layer fetch parallelism is bounded (only that layer's ≤10 misses are known before
  its MoE runs), so latency hiding comes from (a) QD within the layer, (b) overlapping the
  fetch with the shared-expert branch (independent of routed experts), (c) **cross-token
  prefetch** (issue predicted per-layer expert sets for token t+1 right after sampling
  token t — prediction = union of each layer's experts over the last W tokens).

Illustrative IO-side decode bounds at 6 GB/s (dev Mac; est. until M1 fixes h):

| h | miss MB/tok | IO ms/tok | decode cap |
|---|---|---|---|
| 0.98 | 27 | 4 | compute-bound (~40+ tok/s) |
| 0.95 | 66 | 11 | ~30 tok/s |
| 0.90 | 133 | 22 | ~22 tok/s |
| 0.80 | 265 | 44 | ~14 tok/s |
| 0.60 | 530 | 88 | ~8 tok/s |
| 0.30 | 928 | 155 | ~5 tok/s |

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

| chunk C | sweep IO / token | prefill IO cap @6 GB/s |
|---|---|---|
| 1,024 | 66 MB | ~15 tok/s (don't) |
| 4,096 | 16.6 MB | ~360 tok/s |
| 8,192 | 8.3 MB | ~720 tok/s |

Effective prefill = min(IO cap, compute cap ~300–800 tok/s est.). Short prompts below a
threshold (~512 tok) use the normal cached path. **The sweep must be scan-resistant**: it
runs through staging only, bypassing the slot cache for placement while still updating
frequency stats, and admits experts into slots only by frequency/hot-set — otherwise
every long prefill flushes the warm cache and the decode that follows starts cold.
N-gram rows for the entire prompt are known upfront → batch-fetch before layer 2.

Cold start: resident load (~3.3 GB) + optional hot-set preload, sequential at 5–7 GB/s →
**first token in seconds, not minutes** — no full-model load ever happens.

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
  (2,764,800 → 2,768,896 B); pure `pread(fd, idx × record_size)`. ~68 GB.
- `ngram.bin` — 20.0M rows, stride padded to 1,536 B @4-bit (64 B aligned), read in
  4–16 KiB aligned windows. ~30.7 GB.
- `mtp.safetensors`, `vision.safetensors` — optional, absent in v0 default build.
- `tokenizer/` — tokenizer.json, tokenizer_config.json (chat template), generation_config.

Repack is **bit-exact** (no requantization): source = a vetted community MLX 4-bit
conversion (pipenetwork first candidate; spot-checked, checksummed, revision-pinned), so
our quality baseline equals mlx-lm's by construction. Own conversion from official
FP8/BF16 on a rented box is the fallback if community quants prove broken (needs Carlos's
explicit go — billed).

### 4.2 Slot pool mechanics

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

Keys for token t's rows are a pure function of input token ids (bi/tri-grams × 8 heads,
~16 rows ≈ 23 KB @4-bit). Decode: after sampling token t, issue reads for step t+1
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
slotstream pull qwen3.8-flash-next:4bit    # HF download (resumable) + repack + verify
slotstream doctor                          # chip/RAM/SSD bench/wired-limit → recommends preset, checks disk
slotstream run qwen3.8-flash-next:4bit     # REPL chat
slotstream serve [--preset auto]           # foreground server
slotstream install                         # LaunchAgent (com.slotstream.server), starts at login
slotstream bench [--suite full|quick] [--sim-ram 16]
```

Config: `~/.slotstream/config.json` + env overrides; models in `~/.slotstream/models/`;
logs via os_log + `~/.slotstream/logs/`. Distribution while private: `make install` from
source + `gh release` binaries (arm64-only, macOS 14+). If ever public: Homebrew tap +
notarized binaries + curl installer. Disk requirement enforced by `pull`: ~105 GB for the
4-bit build (+ transient download staging; `--purge-source` streams the repack to stay
under ~130 GB peak), ~84 GB for the later compact build.

---

## 5. The configuration space (the tradeoffs to test)

Axes — every named preset is a point in this space:

| Axis | Values | Effect |
|---|---|---|
| Slot budget S | GB of expert slots (362 experts/GB) | THE memory↔speed knob |
| Resident policy | experts-streamed · +ngram-streamed (default) · +ngram-resident (big RAM) | footprint vs decode variance |
| Quant recipe | all-4bit (default) · mixed-4-8 (trunk/attn 8-bit) · compact (3-bit experts) · ngram bits 4/6/8 | quality vs disk/RAM |
| KV | bf16 (default) · fp8 (later) | context memory |
| Context cap | 8k…262k | KV budget per tier |
| Prefetch | off · cross-token(W=1,4,16) · +hot-set pinning | latency hiding |
| Prefill mode | cached · dense-sweep (auto threshold) | prefill throughput |
| IO mode | nocache (default) · pagecache-L2 | determinism vs free OS cache |
| QD / staging | 8–32 / 64–256 MB | SSD utilization |
| MTP self-spec decode | off (v0) · on (M9) | decode multiplier |

### Presets v1 (est. columns to be replaced by M8 measurements)

Budget rule: total footprint ≤ ~65–70% of RAM (and under the Metal recommended working-set
/ wired limit), leaving OS+apps alive. `doctor` picks; user can override.

| Preset | RAM | Footprint | Slots (experts, coverage) | Ctx default | h est. | Decode est. | Measured |
|---|---|---|---|---|---|---|---|
| `max192` | ≥192 GB | ~110 GB | all 24,576 (100%) + ngram resident, MTP on | 262k | 1.0 | 40–80 | — |
| `big128` | 128 GB | ~79 GB | all 24,576 (100%); ngram streamed | 262k | 1.0 | 35–70 | — |
| `big96` | 96 GB | ~63 GB | ~55 GB (19.9k, 81%); ngram streamed | 128k | ~0.99 | 30–60 | — |
| `big64` | 64 GB | ~42 GB | ~36 GB (13.0k, 53%) | 128k | .93–.98 | 25–45 | — |
| `pro48` ← this Mac | 48 GB | ~32 GB | ~27 GB (9.8k, 40%) | 64k | .88–.96 | 18–35 | — |
| `mid32` | 32 GB | ~21 GB | ~16 GB (5.8k, 24%) | 32k | .80–.92 | 12–25 | — |
| `mid24` | 24 GB | ~15.5 GB | ~10.5 GB (3.8k, 15%) | 32k | .70–.87 | 8–16 | — |
| `lite16` | 16 GB | ~10 GB | ~5.5 GB (2.0k, 8%) | 16k | .55–.80 | 4–9 | — |
| `edge8` (experimental) | 8 GB | ~5 GB | ~1.8 GB (0.65k, 2.6%) | 8k | .30–.60 | 1–4 | — |

Notes: fully-resident-incl-ngram on a 128 GB Mac (~110 GB with KV) exceeds the default
wired limit (~96 GB) — possible only with an explicit `iogpu.wired_limit_mb` bump, which
is why `big128` streams the n-gram store instead: it needs no sysctl and loses almost
nothing (n-gram IO is ~23 KB/token, exact-prefetched). Smaller Macs also have slower SSDs (1.5–3.5 GB/s) — folded into the est. bands;
`lite16`/`edge8` use trunk @4-bit to shave the floor; `edge8` may additionally need the
compact 3-bit expert build and a raised `iogpu.wired_limit_mb` (doctor detects + explains,
never auto-sudos). External USB4 NVMe (~3 GB/s) is a supported weights location — worth a
row in the matrix for 256 GB-internal-disk Macs.

---

## 6. Correctness strategy (non-negotiable invariants)

1. **Streaming must be math-invisible.** Same engine, tiny cache vs infinite cache, greedy
   sampling → **identical token sequences**, always. This is the golden test run in CI on
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

### M3 — Swift engine, resident-path correctness (4–7 d — the long pole)
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

### M4 — Slot streaming decode → first full-model run (3–5 d)
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

### M9+ — Later (each gated on v0.1 done)
MTP self-speculative decode (draft tokens' experts prefetch in parallel — likely the
biggest decode multiplier *specifically* for the streaming tiers; +2.25 GB resident,
≥32 GB tiers). Vision input (mlx-vlm parity). Compact 3-bit-expert build with eval gate.
fp8 KV. Memory-pressure dynamic resharding. JSON-schema constrained output. Upstreaming
reusable pieces (GDN Swift kernel) to mlx-swift-lm. Multi-model residency. Qwen4 when it
lands (the whole point of targeting the preview architecture now).

---

## 9. Risk register

| Risk | Likelihood | Mitigation |
|---|---|---|
| Expert locality worse than assumed (flat router → low h) | medium | M1 measures before tuning work; even h≈0.3 yields usable-if-slow decode (§3.2); prefill unaffected (sweep); worst case: reposition tiers honestly |
| Community 4-bit conversion broken/requantized badly | medium | spot-check vs FP8 endpoint at M0; pin revision; fallback own conversion on rented box (approval-gated) |
| mlx-lm PR churn / reference impl bugs | medium | vendor the exact reference revision into repo; layerwise parity catches divergence |
| GDN port numerics (fp32 state, chunked scan) | medium | §6.2 layerwise harness from day one; keep pure-MLX-op version as oracle for any later Metal kernel |
| QSA indexer complexity (core path — dense is only exact ≤ 2048 tokens) | medium | port from reference impl; dense path as ≤2k test oracle; +1–2 d already in the M3 estimate |
| `gatherQMM`/slice-write perf on partial pools in mlx-swift | low-med | microbench at M3 start; fallback direct MTLBuffer fill path |
| F_NOCACHE semantics/perf on APFS | low-med | DiskBench A/Bs it at M0; pagecache mode as fallback |
| Wired-limit ceilings on ≤16 GB Macs | high (known) | doctor measures + documents `iogpu.wired_limit_mb`; budgets sized under recommendedMaxWorkingSetSize; never auto-sudo |
| Thermal throttling on fanless Airs | high (known) | W5 soak captures sustained numbers; publish sustained not burst |
| Model is 2 days old — ecosystem/weights churn | high | pin everything; manifest checksums; §2 re-verify step in M0 is repeatable |
| Scope creep (vision, MTP, batching, other models) | high | §8 gates; v0 = text, single-flight, this model only |

## 10. Dev-Mac reference (verified 2026-08-28)

MacBook Pro, Apple M5 Pro, 48 GB unified, 18 cores, 2 TB SSD (~695 GB free), macOS 26,
Swift 6.3.3, `gh` authed as carloslfu. SSD curve, memory bandwidth, wired limit: fill at M0.

## 11. Definition of Done — v0.1

- [ ] Golden: tiny-cache ≡ resident greedy outputs, exact (CI).
- [ ] Parity vs Python reference ≤ 1e-2 layerwise on all block types.
- [ ] This Mac (`pro48`): decode ≥ 20 tok/s warm chat · prefill ≥ 150 tok/s @8k ·
      cold→first-token ≤ 15 s · 30-min soak: swap delta 0, footprint ≤ 34 GB.
- [ ] `lite16` validated on a **real** 16 GB Mac: decode ≥ 4 tok/s, usable chat, no swap.
- [ ] `bench` matrix filled for ≥ 4 tiers; presets frozen; expectations documented.
- [ ] Ollama surface: Open WebUI + editor client + `ollama` CLI + curl all pass the
      compat script (list/chat/stream/cancel/keep_alive/options).
- [ ] Clean-machine install: `pull` → `serve`/`install` in ≤ 3 commands.
- [ ] README written from measured numbers only.

## 12. Open questions (answer at the milestone noted)

1. Exact n-gram hashing/lookup-count and per-part row addressing (M0, from reference code).
2. Does "6B active" include n-gram rows, and what's the real per-token row count? (M0)
3. Is there GDN Swift prior art in `mlx-swift-lm` to adapt? (M0 — changes M3 estimate.)
4. MTP block internals (own experts?) and self-spec accept rates on this model (M9).
5. h-curves per tier — the load-bearing unknown (M1).
6. Whether `mixed-4-8` measurably beats all-4-bit on agentic evals worth +disk (M8).
7. External-USB4-NVMe tier viability for 256 GB-disk Macs (M8, one bench row).

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
