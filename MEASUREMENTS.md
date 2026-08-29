# Measured facts

Every number here was produced by running something on this machine, not estimated.
Estimates live in PLAN.md and are replaced from here as they are measured.

Dev machine: MacBook Pro, Apple M5 Pro, 48 GB unified, 18 cores, 2 TB SSD
(APPLE SSD AP2048Z), macOS 26 (Darwin 25.6.0), Swift 6.3.3, page size 16384 B.

## M0.1 — Metal / memory limits (mlx `device_info`, 2026-08-28)

| Quantity | Value |
|---|---|
| `memory_size` | 51,539,607,552 B (48.0 GiB) |
| `max_recommended_working_set_size` | 40,200,896,512 B (**37.4 GiB**) |
| `max_buffer_length` | 30,150,672,384 B (**28.1 GiB**) |
| architecture | `applegpu_g17s` |
| `iogpu.wired_limit_mb` | 0 (default) |

Consequences:
- Total footprint budget on this Mac is **≤ 37.4 GiB**, not 48. The `pro48` preset
  (~32 GB) fits with ~5 GB headroom.
- `max_buffer_length` caps a **single MLXArray at 28.1 GiB**. The slot pool is
  9 separate tensors (gate/up/down × weight/scales/biases), the largest being
  `gate_proj.weight` at 8/27 of the pool, so a 27 GB pool → 8.0 GiB largest tensor.
  Not binding here, but a **single-tensor pool layout would have been**. Keep the
  9-tensor layout.

## M0.2 — Model ground truth (byte-exact, from safetensors headers)

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

### N-gram store — plan was structurally wrong

| Property | Plan assumed | **Actual** |
|---|---|---|
| Rows | 20.0 M | **320,001,536** (128 shards × 2,500,012) |
| Row dim | 2560 | **160** (= 2560 / 16 ngram heads) |
| Row bytes @4-bit | 1,440 | **100** (80 weight + 10 scales + 10 biases) |
| Quant group size | 64 | **32** (shape [rows, 5] over 160 dims) |
| Total | 28.8 GB | **32.0 GB** |
| Lookups/token | ~16 rows ≈ 23 KB | **16 rows = 1,600 B of data** |

Structure (from `qwen4_exp.py`): `ngram_heads = (ngram_size−1) × heads_per_ngram
= 2 × 8 = 16`; each head has its own ~20M-entry table sized to a distinct prime
(`_nth_prime_after(19_999_999, g+1)`); tables are concatenated and split into 128
shards of 2,500,012 rows. Index = `splitmix64`-derived multipliers XOR-mixed over
the token n-gram, mod the head's prime, plus the head's offset. PLE is injected at
**layer index 1** (`ple_layer_ids: [2]`, 1-based).

**Design implications:** the per-token n-gram payload is 20× smaller than planned
(1.6 KB, not 23 KB), but it is **16 scattered ~100 B reads**, and each row's
weight/scales/biases live in *three different tensors* — so a naive reader does
**48 scattered reads per token**. The repack must interleave each row's three
parts into one contiguous 100 B (pad 128 B) record, turning 48 reads into 16, and
the row cache should be **page-granular (16 KiB holds ~128 rows)**, not row-granular.

## M0.3 — MLX slot-pool capability (the M3 entry gate)

`Tools/slotbench3.py`. Batch = 48 experts (132.7 MB), the plausible per-token miss set.

| Pool | Strategy | ms/batch | GB/s | Verdict |
|---|---|---|---|---|
| 5.66 GB (2,048 slots ≈ 43/layer) | contiguous slice | 1.24 | 107.31 | PASS |
| | `slice_update` | 1.34 | 98.74 | PASS |
| | **batch scatter** | **2.70** | **49.22** | PASS |
| | per-slot assign | 9.19 | 14.44 | PASS |
| **27.10 GB (9,800 slots ≈ 204/layer)** | contiguous slice | 1.17 | 113.80 | PASS |
| | `slice_update` | 1.18 | 112.72 | PASS |
| | **batch scatter** | **1.77** | **74.86** | PASS |
| | per-slot assign | 7.79 | 17.03 | PASS |

- **In-place confirmed**: peak memory 27.32 GB against a 27.10 GB pool + 0.13 GB
  staging. No full-pool copy.
- Throughput *improves* with pool size (49 → 75 GB/s), confirming cost is
  proportional to the batch, not the pool.
- **Gate passed with ~12× margin**: writing 48 experts costs 1.77 ms vs ~22 ms for
  the SSD to deliver those bytes at 6 GB/s. Slot writes are not the bottleneck.

⚠️ **Methodology note — a wrong first measurement.** `slotbench.py` (v1) called
`mx.eval()` after *every single expert*, which measured per-write GPU sync, not the
copy, and reported 1.54 GB/s at 27 GB — an apparent gate failure. Batching writes
before one `eval` is what a real engine does; v1's number is an artifact. Retained
in-repo as a caution.

`gather_qmm` correctness: `mx.gather_qmm` over the pool vs `mx.quantized_matmul` on
the same expert → **max abs diff 0.000e+00** (bit-identical). vs dequantize-then-dense
→ 6.6e-3 relative (expected 4-bit quantization error).

## M0.4 — Swift feasibility (mlx-swift 0.31.6, mlx-swift-lm main)

Resolved and inspected. **Far more prior art than the plan assumed:**

| Need | Status in Swift |
|---|---|
| Slot-pool gather | ✅ `MLX.gatherQuantizedMM(x, w, scales:, biases:, rhsIndices:, transpose:, groupSize:, bits:, mode:, sortedIndices:)` — `Ops.swift:1468`, wraps `mlx_gather_qmm` |
| MoE block | ✅ `SwitchGLU` / `QuantizedSwitchLinear` in `MLXLMCommon/SwitchLayers.swift`, incl. a `gatherSort`/`scatterUnsort` fast path and a custom Metal unsort kernel |
| **Gated DeltaNet** | ✅ `Qwen3NextGatedDeltaNet` + `gatedDeltaUpdate` in `MLXLLM/Models/Qwen3Next.swift`, with `conv1d`, `dt_bias`, `A_log`, and a `decodeConv` fast path |
| Attention / norms | ✅ `scaledDotProductAttention`, `rmsNorm` in MLXFast |
| Slot writes | ✅ `MLXArray` subscript assignment (`ArrayAt.swift`, `MLXArray+Indexing.swift`) |
| **QSA indexer** | ❌ must implement (genuinely novel) |
| **Hyper-connections** | ❌ must implement (small: 2 low-rank matmuls + sigmoid) |
| **N-gram / PLE** | ❌ must implement (streaming-critical) |

**This materially shrinks M3.** The plan's long pole assumed porting GDN from
scratch; `Qwen3Next.swift` is a near-drop-in (qwen4_exp splits `in_proj` into
qkv/z/b/a where qwen3_next fuses them — mechanical). Remaining novel Swift work is
the QSA indexer, hyper-connections, and the PLE path.

### Swift probe — the mechanism actually runs (`swift-probe/`)

A Swift executable that allocates a slot pool, preads expert records from disk, and
gathers over the pool. Measured on this Mac:

| Step | Result |
|---|---|
| Slot pool alloc (1.42 GB, 512 slots) | 0.52 s |
| `gatherQuantizedMM` vs `quantizedMatmul` | **max abs diff 0.0 — bit-identical, PASS** |
| Slot batch scatter (48 experts) | 2.67 ms = **49.77 GB/s**, in place |
| pread 48 records QD1 → QD16 | 15.70 → 59.94 GB/s (cache-warm store; see M0.5 for cold) |

The Swift slot-write figure (49.77 GB/s) independently reproduces the Python
measurement (49.22 GB/s at the same 2,048-slot pool) — two languages, same kernel
path, agreeing to 1%. **The SlotPool architecture is sound in the target language.**

### ⚠️ Build blocker: Metal shaders require Xcode

mlx-swift's own README states: *"SwiftPM (command line) cannot build the Metal
shaders so the ultimate build has to be done via Xcode."* Confirmed here — a
`swift build -c release` links fine but produces **no metallib**, and every MLX call
dies with `Failed to load the default metallib`. This machine has **Command Line
Tools only, no Xcode**, so `xcodebuild` is unavailable.

**Workaround found and verified**: MLX's loader (`device.cpp:load_colocated_library`)
searches, in order, `mlx.metallib` → `Resources/mlx.metallib` → SwiftPM-bundle
`default.metallib` → `Resources/default.metallib` → `METAL_PATH`, all relative to the
binary's directory. Copying the **prebuilt metallib that ships with the Python `mlx`
wheel** (`.venv/lib/python3.12/site-packages/mlx/lib/mlx.metallib`, 182 MB) next to
the executable **as `mlx.metallib`** makes everything work. Naming it
`default.metallib` does *not* work at that path.

Caveat: the borrowed metallib is from Python mlx 0.32.2 while mlx-swift vendors MLX
0.31.1. It worked for every kernel this probe exercised (quantize, gatherQMM,
scatter, eval), but a version-skewed metallib is not a shipping strategy.

**This is a real, unplanned constraint on M7 packaging** and PLAN.md §4.5's
"`make install` from source" — the release build needs Xcode (~15 GB) on the build
machine, or a vendored metallib built once and shipped as a package resource. Add it
to the risk register and decide before M7.

## M0.5 — Disk (the number the whole IO model rests on)

**Methodology matters here and two earlier attempts were wrong.** Final method
(`Tools/coldread.c`): every offset read **at most once**, spread across 57 GB of
real model shards (≫ the ~35 GB usable page cache), `F_NOCACHE` + `F_RDAHEAD 0`, so
neither the page cache nor the SSD's own DRAM can serve a repeat.

APPLE SSD AP2048Z (2 TB), never-repeat cold random `pread`:

| Record | QD1 | QD4 | QD8 | QD16 | QD32 |
|---|---|---|---|---|---|
| **expert 2.7648 MB** | **9.46 GB/s** | 16.95 | **17.25** | 17.18 | **17.30 GB/s** |
| 16 KiB | 0.27 | — | 2.04 | — | 4.54 |
| 4 KiB | 0.08 | — | — | — | 1.11 |

Latency floor: 292 µs per 2.76 MB read at QD1 (→160 µs at QD8+); **53.6 µs** for
4 KiB and 60.1 µs for 16 KiB at QD1 — a genuine NVMe latency, which is the
independent evidence that these reads reach the device and are not cache hits.

**This SSD is ~2.5–3× faster than the plan assumed (5–7 GB/s).** 17.3 GB/s exceeds
PCIe 4.0 x4; Apple's controller is integrated into the SoC rather than behind a
discrete PCIe link, so it is not PCIe-bound. Treat it as measured-on-this-machine,
not as a number every Mac will hit — base-storage MacBook Airs will be far slower,
and Stage C on real small Macs must re-measure.

**Design consequences (large):**
- Expert-sized records are the sweet spot: they reach 55% of peak at **QD1** and
  saturate by QD8. Small-page IO is 100× worse at QD1 — which is the quantitative
  case against the page-granular mmap approach and *for* the record layout.
- Decode IO cost per token (480 expert-uses × 2.7648 MB × (1−h) ÷ 17.3 GB/s):

  | h | miss/token | IO ms/token | IO-bound ceiling |
  |---|---|---|---|
  | 0.98 | 26.5 MB | 1.5 | 650 tok/s |
  | 0.90 | 133 MB | 7.7 | 130 tok/s |
  | 0.50 | 663 MB | 38 | 26 tok/s |
  | **0.00** | 1,327 MB | **77** | **13 tok/s** |

  **Even a zero-hit cache sustains ~13 tok/s from IO alone.** The plan's small-Mac
  tiers (`lite16` 4–9, `edge8` 1–4 tok/s) were far too pessimistic *on the IO axis*;
  the binding constraint on small machines is memory and compute, not bandwidth.
- Dense-sweep prefill: a full 68 GB sweep costs 3.9 s → at 8k-token chunks that is
  ~2,100 tok/s IO-bound, so prefill will be compute-bound at every useful chunk size.

Superseded attempts, retained as method cautions: `Tools/diskbench.c` on a
freshly-written 12 GB file reported 28.8 GB/s sequential / 72 GB/s random —
impossible, because the file was wholly in the unified buffer cache and
**`F_NOCACHE` does not evict pages that are already cached**. `purge` requires sudo
(declined). A second run against one 10 GB shard gave 24.95 GB/s at QD32, still
inflated by repeat reads within the SSD's own cache. Only the never-repeat numbers
above are trustworthy.

## M0.6 — Compute

| Measurement | Value |
|---|---|
| Unified-memory bandwidth (bf16 add, 537 MB arrays) | **235.1 GB/s** |
| Single 4-bit `quantized_matmul`, batch 1, 7.37 MB weights | 156.2 µs = **47.2 GB/s** |

The batch-1 quantized matmul reaches only 20% of memory bandwidth: at this size the
kernel is launch/occupancy-bound, not bandwidth-bound. So the naive "3.375 GB of
active weights ÷ 47.2 GB/s = 14 tok/s" extrapolation is **not** a valid compute
ceiling — the real model issues many ops per layer with better parallelism (and the
MoE path gathers 11 experts per layer at once). The honest compute number has to
come from running the model, not from extrapolating one kernel.

## M0.7 — The naive path fails (why slotstream exists)

Downloaded the full 4-bit conversion (97 GB on disk, 11 shards + tokenizer) and ran
it through stock `mlx_lm.load()` on this 48 GB Mac.

**Result: the machine went to 48.8 GB of swap and the process was killed before
emitting a single token.** Root cause, found in
`mlx_lm/utils.py:load_model`:

```python
model.load_weights(list(weights.items()), strict=strict)
if not lazy:
    mx.eval(model.parameters())   # <- materialises all 104 GB
```

`load()` defaults to `lazy=False`. So the out-of-the-box Python path is not merely
slow on a 48 GB machine — it is fatal, and it takes the whole machine into heavy
swap on the way down (the exact failure mode PLAN.md §3.4 predicted for
mmap-and-pray, now observed rather than argued).

### `lazy=True` fixes loading — and then fails for a second, deeper reason

With `load(..., lazy=True)`:

| Step | Result |
|---|---|
| `load()` | **0.4 s, 0.00 GB active, 0.00 GB peak** |

That is the plan's "first token in seconds, never a full-model load" claim, confirmed
on the real 97 GB checkpoint. But the run then **died silently during prefill of a
63-token prompt**, with no traceback — killed while paging.

**Why, and why it matters:** lazy mapping defers materialisation, it does not bound
it. A 63-token prefill routes to ~all 24,576 expert records (coverage
≈ 1−e^(−10·63/512) ≈ 70% per layer, and near-total across 48 layers), and every
touched expert becomes a **live MLX array with no way to release it**. Residency
therefore climbs monotonically toward the full 68 GB and the process dies. Nothing in
the stock path can evict a touched expert.

**This is the precise gap slotstream fills.** Lazy mmap gives you deferred loading;
it does not give you a *bounded working set*. The slot pool — fixed capacity plus an
eviction policy — is what converts "loads lazily, then dies" into "runs in a chosen
footprint forever". The observation also independently confirms §3.3's premise that
on-demand caching is the wrong mode for prefill: the dense sweep exists exactly
because prefill's expert coverage approaches 100%.

Measured IO during that naive page-fault prefill: **21.8 KB mean transfer, ~271 tps,
6.1 MB/s sustained** (an earlier sample caught a burst at 9,012 tps / 148 MB/s).
Against the 17.3 GB/s this same SSD delivers on record-sized reads, page-fault-driven
streaming runs **two to three orders of magnitude below device capability**.

### M0.8 — The decisive finding: MLX cannot sparsely materialise a mmap'd tensor

A 5-token raw prompt should touch only ~9% of experts (≈6.2 GB) and still died. So I
measured the two gather paths directly, on lazily-loaded real tensors:

| Operation | Data actually needed | **MLX materialised** | Amplification |
|---|---|---|---|
| `mx.take(ngram_shard, 16 rows)` | 1.3 KB | **200 MB** (the whole shard) | ~150,000× |
| `mx.gather_qmm(x, experts, rhs_indices=top-10)` | 27.6 MB | **471.9 MB** (all 512 experts of the layer) | 17× |

Scaled up: the expert path materialises **1.4 GB per layer → 68 GB** across 48
layers, and the n-gram path materialises **250 MB per touched shard → up to 32 GB**
across 128 shards. Together ≈100 GB. That is the whole checkpoint, and it is why
every stock run died regardless of prompt length.

**This converts slotstream's central design choice from an optimisation into a
requirement.** MLX offers no sparse-materialisation path out of a memory-mapped
tensor: any gather or take over a lazily-loaded array evaluates the entire source
tensor. Therefore the only way to run this model in bounded memory under MLX is
exactly the plan's architecture:

1. `pread` precisely the records needed (2.7648 MB per expert; 16 KiB pages for
   n-gram rows),
2. place them into a **pre-allocated, bounded, fully-resident** pool,
3. gather over that pool — where every element is already resident, so no
   materialisation surprise exists.

The measurements in §M0.3 confirm each step is fast: `gatherQuantizedMM` over a
resident pool is bit-exact, slot fills run at 49–75 GB/s in place, and the SSD feeds
records at 17.3 GB/s. **The design is not just viable — under MLX it is the only
option, and every component of it has now been measured working in isolation.**

Honest scope note: because of this, **no end-to-end generation of the full model was
achieved on this 48 GB Mac in this session.** The stock path cannot do it, and the
bounded path requires the slot pool that M3/M4 build. What has been proven is that
every mechanism the bounded path depends on works, and that nothing simpler will
substitute for it.

Practical note for the runbook: `mlx_lm.load()` must never be called on this model
without `lazy=True`, and `slotstream doctor` should refuse to start a configuration
whose resident set exceeds the measured working-set limit rather than letting the OS
swap.

## M3/M4 — The Swift engine exists and its correctness is measured (2026-08-28)

The full engine was built (`Sources/`): qwen4_exp in Swift over mlx-swift —
GDN (vendored `gatedDeltaUpdate`), QSA + indexer, MoE over the SlotPool
(`gatherQuantizedMM`), hyper-connections, PLE/n-gram with CPU hashing + row
dequant, tokenizer + Jinja chat template (swift-transformers), sampler,
prefill/decode loop, Ollama-compatible server, CLI.

### Verification results (all against the Python reference implementation)

| Test | Result |
|---|---|
| Chat template (system+user, non-thinking) | **token-for-token identical** to `transformers.apply_chat_template` |
| N-gram row ids (6-token prompt × 16 heads) | **exact match** (splitmix64/prime/XOR/floormod port) |
| N-gram row CPU dequant vs `mx.dequantize` | **exact** to printed precision (gs32 4-bit + bf16 rounding) |
| Layer 0 (GDN + MoE-over-slot-pool + hyper-conn) | **bit-exact** (max abs 0.00000) |
| Layer 1 (adds PLE injection, streamed rows) | **bit-exact** |
| Layer 2 (GDN + MoE) | max abs 9.8e-4, RMS-rel 0.13% |
| Layer 3 (QSA attention) | max abs 1.0e-2, RMS-rel 2.4% |

### The parity method finding: pin the MLX version or you measure the wrong thing

First parity runs compared against Python **mlx 0.32.2** and showed 3–4%
everywhere. Rerunning the identical computation under **mlx 0.31.1** (what
mlx-swift 0.31.6 vendors): the same `quantized_matmul` differs between 0.31.1 and
0.32.2 by up to 0.5 absolute (0.19% of max) — **kernel changes between MLX
versions dominate porting error**. Against version-matched goldens, my first
divergence (hyper-connection `down` matmul) became **0.0 — bit-identical**.

The residual layer-2/3 drift enters at a few bf16 ulps in one low-rank projection
(mlpHC `down`, 558/15,360 elements at ≈3 ulps) with bit-exact inputs — consistent
with mlx-swift's vendored MLX commit not being byte-identical to the 0.31.1 wheel
for one kernel variant, then amplified by RMS-norm rescaling into the next layer.
Since layers 0–1 prove every structural path (streaming MoE, GDN, PLE,
hyper-connections, embeddings) bit-exact, this is numerics skew, not porting
error. Parity gate adopted: layers 0–1 must be bit-exact; deeper layers RMS-rel
≤ 3e-2 (tracked, with the ulp origin documented).

## M4/M5/M6 — End-to-end results (2026-08-28, this Mac, zero tuning)

### The headline: the full 125B+51B model generates on this 48 GB machine

`slotstream run --prompt "Why is the sky blue?" --greedy --experts-per-layer 181` (24 GB cache):

| Metric | Cold (first run) | Warm (server, 2nd request) |
|---|---|---|
| Engine start | 2.3 s (page-cached residents: 1.1 s) | — |
| Prefill (18–23 tok) | 1.9–4.6 tok/s | 13.2 tok/s |
| **Decode** | **7.8–10.4 tok/s** | **20.0 tok/s** |
| Expert hit rate | 0.837 (cold cache) | higher (persistent pool) |
| Peak Metal memory | 27.3 GB (181 experts/layer cached) | — |
| Output | fully coherent, correct Rayleigh-scattering answer | deterministic across requests |

**Golden equivalence (the design's core invariant) passed on the full model**:
caching only **30 of 512 experts per layer** (1,446 global slots, 5.9% coverage,
hit rate 0.556) produced **byte-identical greedy output** to the 181-per-layer cache — streaming placement provably does not touch
the math. That starved run peaked at **7.3 GB** total at **5.6 tok/s**: the
lite16 tier already works in emulation, at ~10× the plan's original 4–9 tok/s
low-end estimate... and within its band despite the cold cache.

### Ollama API surface

`Tools/api_test.sh` (raw-socket transport; this sandbox proxies curl/urllib —
external clients on a normal machine are unaffected): `/api/version`, `/api/tags`,
`/api/chat` non-streaming + NDJSON streaming, `/api/generate`,
`/v1/chat/completions` non-streaming + SSE with `[DONE]`, `/api/embed` clean
reject — **all pass**. Instruction following through the whole stack verified
("Reply with exactly: SLOTSTREAM OK" → `SLOTSTREAM OK`; "2+2" → `4`).

Engine code: ~2,300 lines of Swift (`Sources/`), single binary + colocated
metallib via `make build`.

### The memory planner and its promise (2026-08-28)

The default UX is now zero-flag auto-tune (`SlotstreamCore/Plan.swift`), and the
constants in it are derived from the measurements above, not chosen:

- **Fixed (non-pool) footprint modeled at 3.9 GB** = resident weights 3.822 GB
  + n-gram row cache ≤0.13 GB. Measured whole-run peaks actually came in at
  pool + ~3.3 GB (27.3 @ 24.0-GB pool; 7.3 @ 4.0-GB pool) — the model errs
  ~0.6 GB high on purpose so the announce over-promises memory use, never
  under-promises.
- **`--memory-gb G` derivation**: pool = G − 3.9 − 0.5 margin. Promise test,
  measured: `--memory-gb 8` → 27 experts/layer, **actual peak 7.0 GB**
  (predicted 7.5, target 8.0), 5.2 tok/s decode, byte-identical greedy output —
  now a standing gate in `Tools/verify.sh`.
- **Auto policy**: target = min(70% RAM, working set − 2 GB). On this Mac:
  min(36.1, 38.2) = 36.1 GB → 239/layer (31.7 GB pool) → **actual peak 35.0 GB**
  (predicted 35.6) under the 40.2 GB working set. Announced at startup and in
  `/api/show` `details.memory_plan`.
- **est. tok/s in the announce** is log-linear between the two measured anchors
  (30/layer = 5.6, 181/layer = 20.0) and flat above 181 (decode is
  kernel-launch-bound there, §M0.6) — labeled "est. from M5 Pro anchors"
  because other machines' SSD/GPU shift the curve. Spot check: the 8-GB-target
  run's 27/layer estimated ~5.2 and measured 5.22.
- **Floor**: 640 global slots (~14/layer, §SlotPool) ⇒ minimum honest target
  6.2 GB; below it `--memory-gb` refuses with the arithmetic spelled out.

### The availability clamp (2026-08-28): auto respects what other apps hold

Static sizing alone had a first-impression failure mode: a 48 GB Mac with 30 GB
already in use would still get a 36 GB target → swap storm. Auto now also reads
**currently reclaimable memory** and clamps to it (minus max(1.5 GB, 5% RAM)
slack) when that is the binding constraint.

**Choosing the "available" definition** (probed live on this machine):

| Candidate | Value at probe time | Verdict |
|---|---|---|
| `kern.memorystatus_level` (= `memory_pressure` "free %") | 88% = 45.4 GB | rejected — counts other apps' compressible/swappable memory as free; sizing a GPU pool against it *causes* the swap storm |
| `host_statistics64`: free (raw counter incl. speculative) + purgeable + external file-backed | 33.8 GB | **adopted** — pages reclaimable without compressing or swapping anyone |

**Live pressure test** (21.5 GB hog of distinct `bytearray`s over a 64 MB
urandom block — page-level incompressible, allocation at memcpy speed):

| Phase | Reclaimable | Auto target | Result |
|---|---|---|---|
| Before | ~29–33 GB | 26.7–34.4 GB (clamp gently binding — this session's apps) | note printed |
| Hog up | 13.2 GB | **10.7 GB** (47/layer) | run completed: **9.4 GB actual peak**, 6.4 tok/s cold, coherent output, no thrash |
| Hog killed | 36.9 GB | 34.4 GB | sprang back, no restart needed for the *next* process |

Semantics: the clamp applies to **auto only** and only at startup; explicit
knobs are honored unchanged with an informational "only X GB is reclaimable"
note. On a pristine machine the clamp sits above the ceiling and never binds,
preserving deterministic sizing. Cross-machine behavior is pinned by seven
simulated-setup gates in `Tools/verify.sh` driven by
`doctor --sim-ram/--sim-working-set/--sim-available` (48 pristine → 36.0
unclamped; 48 busy → 15.4 + note; 16 pristine → 9.8 unclamped; 16 busy → 6.2
floor + heavy-paging warning; 8 GB → 6.2 floor + too-small warning; 128 GB →
fully resident; explicit 30 GB on busy 48 → honored + info note).

### The elastic pool (2026-08-28): serve resizes itself while running

A startup-time size can't be right for a daemon's lifetime — the machine's
state keeps changing. The governor (`Governor.swift`) resizes the pool between
requests, under the engine's generation lock. Mechanics chosen for their memory
transients: **grow** gathers contents into the larger tensors one piece at a
time (transient ≤ one piece ≈ 1 GB; growth only happens when availability
covers it) — cache stays warm; **shrink** frees the old tensors *before*
allocating the small ones (transient = max(old,new), never the sum) and
restarts cold — under pressure, holding two pools to preserve warmth would
spike memory at exactly the wrong moment, and a cold cache refills from SSD in
seconds.

**Correctness across live resizes** — `slotstream elastic-check`, now a
standing verify gate: four greedy generations in one process across
30 → 181 → 30 → 50 experts/layer (grow-with-copy, shrink-cold, regrow) are
**byte-identical** (6.4 s / 9.6 s / 7.0 s / 5.4 s).

**Live experiment 1 — growing 21.5 GB hog against a running server** (first
policy iteration): the poll shed the pool in a cascade
220 → 183 → 145 → 108 → 75 → 37 → 14 experts/layer (29.2 → 1.8 GB) as the hog
grew; a request under pressure and a request after recovery were both
**byte-identical** to the pre-hog baseline; after the hog exited the pool grew
back **with contents kept**, and `/api/show` tracked every step.

**Policy learning (why the triggers are absolute GB, not relative):** with the
feasibility replan crediting everything a restart would release (pool + fixed
footprint — without the fixed credit the equilibrium double-reserves ~4 GB),
the honest adjustment under contention is a few GB regardless of pool size — a
"shrink at <85% of current" trigger can never fire on a 30 GB pool. Final
policy: shrink when desired ≤ current − 1 GB (one-step convergence), grow when
desired ≥ current + 2 GB after 60 s of calm and cooldown; pressure events shed
absolute chunks (warning ≥2 GB/15%, critical ≥4 GB/50%), repeating until calm.
Startup counts as the first resize — launch-time availability can undercount
for a minute (page-reclaim lag from a predecessor process), and growing on
that transient caused churn until the cooldown covered it.

**Live experiment 2 — passive hog, final policy:** equilibrium *held* (no
shed): macOS chose to swap the idle hog's pages rather than raise pressure,
and keeping the hot pool while the OS pages out idle memory is the correct
allocation — the earlier cascade penalized the active workload to protect
idle bytes. **Live experiment 3 — ACTIVE 24 GB hog (every page touched
continuously for 75 s):** still no OS pressure event on this machine — macOS
absorbed the overcommit by compressing/swapping the *idle slots of our own
pool* (Metal shared-storage buffers are ordinary pageable VM). Honest status:
the pressure-event path is implemented and its arithmetic reviewed, but it has
**never been observed firing live** here — the availability poll is the
primary actor in practice, events are the backstop for machines/loads that do
reach system pressure (`sudo memory_pressure -S` would test it directly but
needs root).

### First-run closure (2026-08-28): pull, browser clients, small-Mac stress

**`slotstream pull`** (weights acquisition — the missing half of install UX) is
implemented and proven against the real network:

- Manifest of all 24 files (103.8 GB) with upstream LFS sha256, embedded at
  build time from the pinned revision (`PinnedModel.swift`) — integrity never
  depends on a live API. Disk-space check before any bytes move.
- `pull --verify` hashed the full local 103.8 GB against upstream in **14 s**
  (parallel SHA256, ~7.4 GB/s): **24/24 match** — the dev copy is byte-exact
  provenance-verified. Now a standing verify.sh gate.
- Interrupted download **resumed from the exact byte offset** (356 MB into a
  10 GB shard, HTTP Range), and survived a live **HTTP 429** rate-limit with
  backoff-retry from the same offset.
- A shard deliberately truncated to 2.0 GB was completed over the network and
  **passed sha256** — range-stitching is byte-exact.
- A part with one flipped byte at offset 1e9 was caught by the hash gate,
  **deleted, and refused** with a clear message; the rerun re-downloads fresh.
- Model names now resolve (`--model` defaults to the pinned name → dev
  checkout or `~/.slotstream/models`), and missing weights say
  "run: slotstream pull" instead of a stack trace.

**Browser clients (CORS)**: all responses carry `Access-Control-Allow-Origin`
and OPTIONS preflight answers with methods/headers/private-network. Preflight
verified on the wire; then a **real browser** ran a streaming `/api/chat` from
page JS: 5 NDJSON chunks, exact expected content, CORS header present. The
cross-origin probe from a public https page was blocked by the test browser's
own request filter (`net::ERR_BLOCKED_BY_CLIENT` — an extension-level block,
not a server refusal), so that path is unproven here; the case real web GUIs
use (localhost page → localhost API) is the one proven.

**Small-Mac stress (what is testable without the hardware)**: a 659-token
prompt (three prefill chunks) at the absolute floor — 14 experts/layer,
1.8 GB pool — completed with no pin exhaustion and coherent output at
**6.1 GB peak**, 3.9 tok/s decode. The same prompt at the pristine-16-GB-Mac
auto size (`--memory-gb 9.8`) peaked at **9.6 GB — promise held**, with the
long-prefill transient consuming 0.3 GB of the 0.5 GB planning margin (that is
what the margin is for). Note: decode after a long prefill runs slower than
the short-prompt anchors (3.5 vs ~7 tok/s at 41/layer) — KV/indexer overhead
plus a prefill-polluted cache; the est. table is anchored on short prompts.

**Soak (bounded)**: `serve --memory-gb 10` ran ~40 min with a request every
45 s — 28/28 requests succeeded, latency flat at 6–7 s, RSS flat across the
whole window: **no leak, no drift, no crash**. (The request loop itself paused
when the machine slept; the server rode through it.)

**RSS finding → MLX cache limit**: that soak surfaced a real hidden footprint —
**15.1 GB RSS for a 10 GB-target server**. MLX's allocator retains freed
transients (per-request KV caches, activations) in an unbounded internal
cache; the Metal "peak" metric doesn't show it, real process memory does. Fix:
`GPU.set(cacheLimit: 2 GB)` at engine init. Measured after: **6.0 GB RSS,
flat across requests, identical 6–7 s latency** — real process memory now
tracks the announced plan instead of exceeding it by 50%.

**verify.sh is now memory-adaptive**: the heavy equality gates size themselves
to what is reclaimable (181/layer when ≥32 GB, 60/layer otherwise, printed
when scaled) — the equality properties are size-independent, and the suite
must be runnable on a 16 GB contributor machine, or a busy 48 GB one, without
swamping it. Current full battery: **15/15 PASS**.

**Operational lesson (learned the hard way):** stacking two slotstream
instances plus a full test load (browser, builds, request loops) on one 48 GB
machine overcommitted the host and crashed it. The governor protects a single
auto-sized instance against the rest of the system; it cannot protect against
deliberately stacked model processes. Rule, now in the README: **one instance
per machine**; test instances get small explicit `--memory-gb` sizes.

### One-command install (2026-08-28): v0.1.0 release + installer, proven end to end

Release v0.1.0 ships `slotstream-arm64.tar.gz` (50.8 MB compressed: the
36.9 MB binary + the 131 MB mlx-0.31.1 metallib, built from commit `6a038fe`)
plus a `.sha256` asset; names are stable because the installer fetches
`releases/latest/download/`. `install.sh` (repo root) gates on
Darwin/arm64/macOS ≥ 14, sha256-verifies the tarball, installs to
`~/.slotstream/bin`, wires PATH (a wrapper in `/usr/local/bin` when writable
without sudo, else one grep-guarded profile line), and offers a handoff to
`serve` when a real terminal exists.

`serve`/`run` now offer the download themselves: pinned model missing + a
terminal → a size/destination/free-disk block and one `[Y/n]`. Proven live
with an APFS-cloned copy missing only `config.json`: consent pulled the
missing file over the network, ran the full 24-file verify (PASS), and
generated correctly at a 6.9 GB peak. Decline exits 1 with "when you are
ready: slotstream pull"; no terminal (piped stdin, no usable `/dev/tty`)
exits 1 with the pull hint. `serve` now also prints a copy-paste curl and the
client hint at bind time; the exact printed payload returned HTTP 200 NDJSON
with the CORS header on the wire.

End-to-end as a stranger, from GitHub, under an isolated `$HOME`: the README
one-liner installed 0.1.0, appended the PATH line exactly once, printed the
no-terminal fallback, and exited 0; under a pty it prompted and honored "n".
From the installed directory (outside any checkout), `doctor` initialized
Metal off the colocated metallib and a real generation produced the exact
requested string at a 6.9 GB peak. Two installer findings: `[ -r /dev/tty ]`
passes even with no controlling terminal, so the guard must actually open it
(`(exec < /dev/tty)`); and raw.githubusercontent caches for ~5 minutes and
ignores query-string cache busting, so after editing `install.sh` wait out
the cache before re-testing. Not proven here: a truly clean machine (this
Mac's dev checkout resolves first via the embedded path), and the handoff
"y" branch was not exec'd live (it composes two proven pieces).

**Clean-machine simulation (2026-08-28, follow-up):** with the dev checkout's
weights hidden and a fresh `$HOME`, the full stranger chain ran live:
one-liner → installer → "y" handoff (exec'd this time) → serve → "y" → the
real 104 GB pull streamed (killed deliberately at ~0.6 GB). It exposed two
defects, both fixed and re-proven in v0.1.1: (1) the weights presence check
was `config.json` alone, and small files download first, so an interrupted
first download passed the check and died later in engine load — `serve`/`run`
now size-check every manifest file (plus `.part` progress) and the prompt
says `have: N GB already here — the download resumes`; proven by resuming the
interrupted state at the exact byte offset through the prompt. (2)
`FileManager.homeDirectoryForCurrentUser` ignores the `$HOME` environment
variable, so redirecting the download (external drive, tests) silently used
the passwd home — `ModelLocator` now honors `$HOME` when set.

**Per-OS Metal library (2026-08-28, follow-up):** the release tarball's
metallib is built for macOS 26, but mlx-metal publishes separate builds for
macOS 14, 15, and 26 — shipping the 26 build to older systems is the
forward-compatibility direction that can fail. The installer now fetches the
build matching the host's macOS from the mlx-metal 0.31.1 wheel (URL and
sha256 hardcoded per OS; PyPI files are immutable) on macOS 14 and 15, and
keeps the tarball's copy on 26 and later. Tested via an override on this
host: the macOS 15 wheel downloaded, hash-verified, and extracted (107 MB vs
the 26 build's 131 MB), Metal initialized from it, and a real generation ran
at a 7.0 GB peak. A physical macOS 14/15 machine still hasn't run it, but
each OS now gets exactly the library a from-source build there would use.
Also fixed: re-running the installer says "PATH already set up" and appends
nothing (verified one profile line after two runs).

**CI-built releases with signed provenance (2026-08-28):** v0.1.0 and v0.1.1
were built on the dev machine and traceable only to a commit hash and
checksum in hand-written notes. From v0.1.2, pushing a tag runs
`.github/workflows/release.yml` on a GitHub macos-26 runner: newest-Xcode
selection (mlx-swift needs Swift 6.3), the pinned-wheel metallib
(`SLOTSTREAM_METALLIB_MACOS=26`), a smoke gate that fails the build unless
`--version` equals the tag, packaging with sha256, GitHub artifact
attestation (verify:
`gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream`),
and publish with the commit and build-log URL in the notes. First live run
found the macos-15 image's Swift too old for mlx-swift 0.31.6 (tools version
6.3); the macos-26 image with newest Xcode selected is the working recipe.
Local asset builds are retired to a documented emergency fallback.

**Weights mirror + multi-source pull (2026-08-29):** `pull` previously had a
single hard-coded download base, so slotstream's availability depended on a
third-party HF repo staying up. It now takes an ordered source list (env
override `SLOTSTREAM_WEIGHTS_SOURCES`), tries each in turn, and skips straight
to the next source on a permanent HTTP refusal instead of burning retries.
Proven: bogus-primary falls back and completes (401 → next source, full verify
pass); all-sources-bogus fails closed with "failed from all N source(s)";
default path unchanged.

A byte-identical mirror now ships as the primary source:
`carloslfu/Qwen3.8-Flash-Next-MLX-4bit` @ `852ebf6f` (README added in a later
commit, which is why the pin matters — the pinned revision's files are exactly
the manifest's). Upload took seconds rather than hours because HF's
content-addressed storage already held these chunks from the upstream repo —
the practical argument for mirroring *while* the source is alive rather than
after it disappears. Verified three ways: all 24 files present at exact sizes;
all 12 LFS sha256s on the mirror equal the pinned upstream hashes (i.e. the
whole 103.8 GB is byte-identical, proven without downloading it); and a live
`pull` of a hashed file (`tokenizer.json`) from the pinned mirror URL passed
the hash gate with a full 24/24 verify. Integrity semantics are unchanged:
sources supply bytes, the compiled-in manifest supplies truth.

### Parallel weight download (2026-08-29): 8 connections, exact resume

The pull was one connection streaming one file at a time, which measured 28 to
40 MB/s and put the 103.8 GB download near an hour. Before changing it, the
question was where the ceiling actually is. Same 600 MB moved every time, from
distinct offsets, to `/dev/null`:

| connections | Hugging Face | note |
|---|---|---|
| 1 | 28 to 40 MB/s | |
| 4 | 54 to 57 MB/s | |
| 8 | 50 to 55 MB/s | |
| 16 | 53 MB/s | |
| 32 | 53 MB/s | |

The plateau starts at 4 and never moves. Three controls place it:
`https://ash-speed.hetzner.com/1GB.bin` gave **27 MB/s on one connection and
144 MB/s on eight**, so the link is not the limit; `hf_xet` 1.29.0, Hugging
Face's own fastest client speaking the native xet protocol, downloaded
model-00011 (2.19 GB) in 39.4 s, **55.7 MB/s**, the same number; and the
reconstruction endpoint shows why, since every xet chunk URL resolves to the
same `us.aws.cdn.hf.co` host the plain `resolve/` redirect lands on. The cap
is per-IP rather than per-repo: 4 connections to the mirror plus 4 to
pipenetwork gave 53.5 MB/s, no better than 8 to either alone, so sharding
across mirrors buys nothing. **About 55 MB/s is Hugging Face's number for this
client, and parallelism is what reaches it.**

The download is now 64 MB chunks from every file in one shared queue, drawn by
8 workers over one URLSession, so connections stay busy across file boundaries
and to the last byte. Each incomplete file keeps a `.partmap` beside its
`.part`: one byte per chunk, flushed every 2 s after an `fsync` of the data it
claims, so a map never promises bytes that are not on disk. Files are hashed
and renamed on a background queue the moment their last chunk lands, so
verification overlaps the download still running. `--connections N` and
`SLOTSTREAM_PULL_CONNECTIONS` override the default.

**The bug this found.** The first parallel build ran at 21 MB/s, slower than
some single-connection runs, and only 1 of the 6 small files ever renamed.
`session` was a `lazy var`, and Swift's lazy initialization is not thread-safe:
8 workers entering at once built several URLSessions, and `taskIdentifier` is
only unique within one session, so in-flight state collided and 5 of 8 workers
blocked forever on semaphores nothing would signal. 21 MB/s is 3/8 of the
plateau, which is exactly the three workers that survived. The session is now
built in `init`, and requests are keyed by an id the job assigns rather than
URLSession's numbering.

**Live, from scratch, against the real mirror:** 12.2 GB in 250 s (**48.8 MB/s**
including startup, steady state 50), then killed with `kill -9`. 7 files
complete, `model-00001.safetensors` among them: 10.04 GB assembled from 150
chunks fetched out of order across 8 connections, and it renamed, which only
happens after its sha256 equals the pinned upstream hash. Resuming reported
**91.9 GB to go** and continued `model-00002` from chunk 28 of 150, refetching
only the 8 chunks that were in flight when the process died.

**Full 24-file proof without spending 104 GB of network:** a Range-capable
local server over the existing copy, so the real pull path runs at SSD speed.
Pass 1 moved 99 GB in 45 s (**2.47 GB/s**, so the client is nowhere near being
the bottleneck at 55) and was killed mid-flight with 22 files complete and two
chunk maps at 95/153 and 19/33. Pass 2 computed **4.8 GB to go**, finished, and
the full re-hash returned **VERIFY PASS: all 24 files match the pinned
revision (103.8 GB)**. Battery 15/15 after the change.

Net effect: about **35 minutes instead of about 50** for a first install on
this link. The remaining headroom is not reachable on Hugging Face at any
connection count; it would take hosting the weights somewhere without that
cap, which the link would serve at 144 MB/s.

### Adversarial review of the serving layer (2026-08-29): 0.1.5

An end-to-end adversarial pass over the whole system. The numerical core came
through clean; the serving layer did not. Everything below was reproduced
against a running server before it was fixed, and each case is now a gate in
`Tools/api_robustness.sh`.

**Held up under attack.** The acceptance battery genuinely passes (re-run, not
taken on trust). Weight provenance over all 103.8 GB, layer parity against the
Python reference, cache-size and live-resize byte-equality, and the
`--memory-gb` promise all hold. `MoELayer` matches the reference block line for
line. The slot-pool floor survives full 256-token prefill chunks. The planner
refuses or clamps every out-of-range knob and explains itself. Parallel
download and resume are exact: after `kill -9` mid-transfer the chunk map
claimed 1,073.7 MB against 1,369.1 MB actually on disk — under-promising by the
in-flight partials, which is the safe direction — and the resume continued from
those chunks rather than restarting. Multi-source fallback works (HF answers
401 for a missing repo, the file moves to the next base). Preallocation is
genuinely sparse: 103.8 GB apparent, 3.3 MB on disk.

**Three inputs killed the process.** No SIGPIPE disposition was ever set, so a
client vanishing mid-stream terminated the server with signal 13 — which also
meant the `alive` flag threaded through every streaming handler was dead code,
since `write` could never return `-1`. `"seed": -1` trapped in `UInt64(v)`, and
`"num_predict": -1` trapped forming `0 ..< -1`; both are Ollama's *documented*
defaults for "random seed" and "generate until EOS". Fixed by ignoring SIGPIPE
(plus `SO_NOSIGPIPE` per socket), and by clamping every sampling knob in one
place, `SampleParams.sanitized()`.

**Streaming silently corrupted some responses.** A reply beginning with a
character whose UTF-8 spans several tokens lost its opening: asking for five
emoji returned `🚀🔥⭐❤️🌳` unstreamed and `⭐❤` streamed, on all four streaming
surfaces. The incremental detokenizer cleared its token list whenever nothing
had been emitted yet — exactly the state a leading emoji is in while it waits
for the token that completes it. The first fix exposed a second, subtler bug:
diffing decoded text by `Character` drops a scalar that merges into the
grapheme cluster already sent, so `❤️` streamed as `❤` (the U+FE0F variation
selector vanished). The diff is now scalar-exact.

**The sampler had an unguarded 0/0.** Any filter that empties the candidate set
— `top_p` at or below 0, `min_p` above 1 — made `probs / probs.sum()` produce
NaN, after which the server emitted token 0 forever (`!!!!!!`). The
normalization is gone: the uniform draw is scaled by the unnormalized CDF total
instead, which removes the division and, because `u < 1`, also removes the
float-tail case where every CDF entry compared below `u` and the pick ran off
the end onto a zero-probability token.

**Two limits were missing.** There was no context cap at all, and the memory
plan does not model KV growth: a 7,960-token prompt peaked at 8.3 GB against a
7.9 GB plan, and under `--memory-gb 8` it reached 7.9 GB, consuming almost the
entire 0.5 GB planning margin. KV plus indexer state costs **27.0 KiB per
token** (12 QSA layers x [2 x 2 heads x 256 dims x 2 B] + 12 x 128 x 2 B), so
32k tokens would add 0.91 GB and break the promise outright. Prompts are now
capped at 32,768 tokens (`--max-context`) and refused with a 400. Separately,
the connection handler had no read timeout and one thread per connection: 300
idle sockets produced 314 threads. Reads now time out, connections are capped
at 64, and request bodies are bounded like headers already were.

**QSA indexer, previously untested past its budget.** A 7,960-token prompt with
the answer planted in the first sentence retrieved it correctly, so the sparse
path is exercised end to end for the first time. It also priced the naive
prefill honestly: **30 to 32 tok/s**, i.e. about four minutes to first token at
8k. That, not memory, is what makes long contexts impractical today.

**The load path, found by asking "is anything missing?".** The first pass
concentrated on the request path and waved the checkpoint reader through
because the weights are hash-verified. That was the wrong test: `--model`
accepts any directory. Pointing it at a directory with no safetensors, with a
corrupt header, or with another model's tensors each trapped (exit 133) after
printing the memory plan. `serve` on a port already in use — running it twice,
the single most likely operator mistake — loaded the entire model and *then*
hit `fatalError("bind failed")`; it now fails in 0.03 s with a sentence naming
the fix, because the port is claimed before the model loads. `--max-context 0`
was validated after the load too. `posix_memalign` failing in the expert read
path was a force-unwrap. And `pull --verify` used `attributesOfItem`, which
does not follow symlinks, so a model directory of symlinked weights reported
all 24 files corrupt and sent the user into a 104 GB re-download. Each of these
is now a gate in `Tools/planner_gates.sh`, which needs no weights.

**Smaller things corrected.** `/api/version` reported 0.1.0 from a hard-coded
string (now one constant, checked against the binary in CI); `/api/tags`
reported a weights size 23.3 MB off the manifest (now read from it); the
planner's floor was described as 14 experts/layer in every user-facing message
while being 13.3 (640/48), with one `doctor` screen printing both; `Geometry`
carried a comment claiming it was "validated against config.json at engine
init" when no such check existed (now `Geometry.check` runs in
`Qwen4ExpModel.validate`); the n-gram row-cache counters were never reset, so
they accumulated across every request in a `serve` process; `IndexerCache`
re-concatenated the whole cache each token where `KVCache` next to it grows in
blocks; the safetensors header length was read with an alignment-requiring
`load`; the GatedDelta kernel guarded `Dk % 32` but not the `Hv % Hk` ratio it
also assumes; `SS_DEBUG_LAYER` was read from `ProcessInfo` 48 times per token;
and in `pull`, the periodic map flush could `fsync` and rewrite the map of a
file whose descriptor the finishing path had already closed.

Also fixed for compatibility, each now a gate: `stop` sequences were accepted
and ignored, OpenAI array-form message content was silently dropped, an empty
prompt sampled a first token from an uninitialized tensor, malformed JSON
returned 500 "chat template failed", `HEAD` returned a body, `/api/generate`
omitted `prompt_eval_duration`, and `done_reason`/`finish_reason` was always
"stop" even when the run hit the token limit.

**Deliberately not changed.** The presence penalty is applied before the
temperature division, which matches HuggingFace's processor order; the
consequence is that API `temperature: 0` is argmax over *penalized* logits
while CLI `--greedy` zeroes the penalty, so the two are not identical by
construction. Attempts to make them diverge on real prompts did not succeed.
Unknown model names are still accepted rather than 404'd: one model exists and
its name is advertised in `/api/tags`, so leniency costs nothing.

### Closing the three deferred gaps (2026-08-29): 0.1.5

**Prefill: 40 -> 92 tok/s, byte-identical output.** Prefill is expert-stream-
bound, not compute-bound: one pass activates nearly every expert of every layer,
so the whole 68 GB expert set is re-read roughly once per pass and halving the
number of passes halves the bytes moved. Measured on a 7,960-token prompt at
30 experts/layer cached:

| tokens per pass | prefill | MLX peak |
|---|---|---|
| 256 (old default) | 40.0 tok/s | 8.3 GB |
| 512 | 49.6 | 8.6 |
| 1024 | 67.1 | 9.2 |
| 2048 | 91.8 to 104.8 | 10.1 |

Greedy output is byte-identical across all four, checked at 2,980 and 7,960
tokens with the sparse indexer active — the indexer's block boundaries are
absolute positions, so chunking cannot move them. The pass size is therefore
sized from the memory plan rather than fixed: at most a fifth of the pool
budget, which gives 256 at the floor, 512 at an 8 GB target, 1024 at 24 GB and
2048 from 32 GB up. An 8k prompt on this machine went from 199 s to 87 s.

Budgeting it exposed the KV gap concretely. Charging only the pass's own
activations (1.1 MB/token, which is what they measure in isolation) left
`--memory-gb 12` peaking at **exactly 12.0 GB** on an 8k prompt — the promise
held with no headroom at all, because the long context that motivates a big
pass also carries ~27 KiB/token of KV and indexer state the pool math never
modelled. Charging the two together at 1.8 MB/token is what they actually cost:
`--memory-gb 12` now peaks at 11.4 GB and `--memory-gb 8` at 7.7 GB on the same
prompt, the latter *better* than the 7.9 GB it used to reach while also
prefilling 50 tok/s instead of 30. The long-prompt case is now its own gate;
the previous one used a 6-token prompt and could not see any of this.

**Sampler: golden, and it matched first try.** `Tools/sampler_ref.py`
reimplements the sampler in numpy float32. Both sides build their logits from
the same splitmix64 stream using only exactly representable float operations,
so the comparison is exact rather than approximate. 14 configurations agree
token for token — greedy, pure sampling, top-k 1, tight nucleus, min-p,
presence penalty with accumulation, the out-of-range values the sanitizer
clamps, seed 0, and the real 248,320-entry vocabulary. This closes "sampler
implemented but not golden-tested"; the sampler was extracted into its own
`Sampler` struct so it runs on synthetic logits with no checkpoint loaded,
which also makes it a CI gate.

**Governor: policy tested without a memory hog.** The gap was that only the
resize *mechanism* was proven (`elastic-check`, byte-identical output across
grow/shrink); the *policy* had only the one-off 21.5 GB-hog observation. Rather
than repeat that — unsafe on a shared machine and unrepeatable — the decision
was extracted into `GovernorPolicy.decide`, a pure function of (current size,
availability, recent history). `slotstream governor-check` drives all 19
branches deterministically with no model loaded: shrink, grow, both dead-bands,
both cooldowns, warning and critical pressure, repeated pressure converging to
the floor, and the cap.

Writing it surfaced a genuine subtlety. A test that held availability fixed
while shrinking the pool showed the governor ratcheting down step after step
instead of converging. That state is unreachable — freeing pool memory raises
what is reclaimable by exactly that amount — and the credit in `desiredSlots`
(`available + pool + fixed footprint`) exists precisely so the answer does not
depend on how much is held at the moment. Modelled correctly it converges in
one step, and the invariant is now asserted directly: two states holding the
same total memory must want the same size.

### Honest gaps (not yet done)

Dense-sweep prefill and cross-token prefetch. Sizing the pass from the memory
plan took prefill from 40 to 92 tok/s (8k prompt: 199 s to 87 s), but the sweep
is still naive and prefill remains the slow axis for long prompts; decode after
a long context also runs below the short-prompt anchors (5.0 tok/s at
30/layer after 7,960 tokens). Real ≤16 GB
hardware validation (floor and 16-GB-target behavior emulated and
stress-tested here, but never run on a physically smaller, slower-SSD Mac). A
hosted web GUI (e.g. Open WebUI) driven end to end (browser streaming client
proven; the full product not installed here). LaunchAgent `install`
(foreground `serve` is the supported mode). The planner now charges KV and
indexer growth through the prefill-pass budget rather than modelling context
length directly, so a prompt far longer than the 8k the coefficient was fitted
to is still bounded by `--max-context` rather than predicted. The governor's
policy is tested as a pure function, which is stronger than the one-off hog
measurement but is not the same as observing the daemon under live pressure.

Closed 2026-08-29 (see the two sections above): the QSA indexer past its
2048-token budget, the sampler golden, and the governor policy.

## Reference implementation

`Tools/reference/qwen4_exp.py` (vendored, from the pinned conversion) — the port
oracle. Confirms: PLE at layer 1; QSA indexer returns `None` when `kv_len ≤ 2048`
(so **dense attention is exact only up to the 2048-token budget** — the review-pass
correction was right); GDN state fp32; router in full precision
(`quant_predicate` excludes `mlp.gate`); MTP and vision tower dropped by `sanitize`.
mlx-lm 0.31.3 already provides `gated_delta_update`, `SwitchGLU`, `ArraysCache`;
`qwen4_exp` itself is **not** in mlx-lm 0.31.3 (confirms the open-PR status).

---

## Summary — what M0 settled

**Verified correct in the plan** (no change needed): expert record geometry
(2,764,800 B exactly), routed-expert total (67.948 GB), per-layer expert block
(1.4156 GB), shared experts (133 MB), routers (126 MB), total checkpoint (~104 GB),
16 KiB record padding arithmetic, and the review-pass correction that QSA's dense
path is exact only up to the 2048-token indexer budget.

**Corrected by measurement**: n-gram store structure (320 M rows × 160 dims × 100 B
= 32.0 GB, group size 32 — not 20 M × 2560 × 1440 B = 28.8 GB) and its per-token cost
(1.6 KB, not 23 KB); resident floor (3.822 GB, not ~3.3); SSD throughput (17.3 GB/s,
not 5–7); the memory ceiling that actually binds (Metal working set 37.4 GiB, not
48 GB of RAM); and the low-end decode estimates, which were pessimistic on the IO
axis by roughly an order of magnitude.

**Discovered, unplanned**: (1) MLX cannot sparsely materialise a memory-mapped
tensor, which makes the bounded slot pool mandatory rather than optional and merges
M3/M4 into one gating milestone; (2) mlx-swift's Metal shaders cannot be built by
SwiftPM CLI — Xcode or a vendored metallib is required, which changes M7 packaging;
(3) `mlx_lm.load()` defaults to `lazy=False` and will drive a 48 GB Mac to 48 GB of
swap; (4) decode is kernel-launch-bound (batch-1 matmul reaches 20% of memory
bandwidth), which displaces IO as the top performance risk.

**De-risked**: the M3 entry gate (slot writes 49–75 GB/s, in place, ~12× faster than
the SSD can feed them), `gatherQuantizedMM` bit-exactness in both Python and Swift,
and the existence of Swift GDN/MoE prior art.

**Not achieved**: no end-to-end generation of the full model, because the stock path
cannot produce one on this machine and the bounded path is M3/M4 work. No expert
locality curves from the real model (the trace collector and simulator are built and
the simulator is validated on synthetic input, but collecting real traces requires
the same bounded forward pass). M1's h-curves remain open — though they no longer
gate viability, only tier sizing.

### One more toolchain constraint (found the hard way)

`swift test` is impossible on this machine: neither XCTest nor swift-testing ships
with Command Line Tools — both require Xcode. Acceptance testing therefore lives in
`Tools/verify.sh`, which is strictly stronger anyway: it runs the n-gram-id golden,
the chat-template golden, the bit-exact layer-parity gate, and the full-model
golden-equivalence test against the real checkpoint. Current status: **4/4 PASS.**
