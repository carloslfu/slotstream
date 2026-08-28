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
| 5.66 GB (2,048 slots) | contiguous slice | 1.24 | 107.31 | PASS |
| | `slice_update` | 1.34 | 98.74 | PASS |
| | **batch scatter** | **2.70** | **49.22** | PASS |
| | per-slot assign | 9.19 | 14.44 | PASS |
| **27.10 GB (9,800 slots)** | contiguous slice | 1.17 | 113.80 | PASS |
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
