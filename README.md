# slotstream

Run **Qwen3.8-Flash-Next** (125B-A6B + 51B n-gram store, 4-bit, ~104 GB) on a
48 GB Mac — and in as little as **7.3 GB** of memory — by streaming the routed
experts and PLE/n-gram rows from SSD into a fixed pool of RAM **cache slots**.
MLX + Swift, single binary, Ollama-compatible API.

**Status: it works.** Built and measured 2026-08-28 on an M5 Pro / 48 GB:

| | measured |
|---|---|
| Decode, warm | **20.0 tok/s** |
| Decode, cold cache | 7.8–10.4 tok/s |
| Cold start → first token | ~12 s (engine up in 1–2 s; no full-model load ever) |
| Peak memory @ 181 experts/layer cached (24 GB) | 27.3 GB |
| Minimum demonstrated | **7.3 GB peak** @ 5.6 tok/s (30 experts/layer cached) |
| Streaming correctness | 30/layer cache ≡ 181/layer cache: **byte-identical** greedy output |
| Port correctness | layers incl. streamed MoE/GDN/PLE **bit-exact** vs the Python reference (mlx-0.31.1-matched) |
| Chat template | token-for-token identical to `transformers` |

```bash
make build                       # SwiftPM build + colocate the metallib
.build/release/slotstream serve                  # zero config: auto-tunes to this Mac
.build/release/slotstream run --prompt "Why is the sky blue?"
.build/release/slotstream doctor                 # what auto picks here + what each target buys
Tools/api_test.sh 11434                          # endpoint battery
```

Point any Ollama/OpenAI client at it: `/api/chat`, `/api/generate`, `/api/tags`,
`/v1/chat/completions` (streaming NDJSON / SSE). Model dir defaults to
`models/qwen38-flash-next-mlx-4bit` (the pinned `pipenetwork` MLX conversion).

**Zero flags is the intended UX.** At startup slotstream reads the machine and
announces exactly what it chose (also served under `details.memory_plan` in
`/api/show`):

```
slotstream memory plan (auto)
  device: 52 GB RAM, 40.2 GB Metal working set
  target: 36.1 GB total for this process   (override: --memory-gb N | --experts-per-layer N)
  cache:  ~239 of 512 experts per layer  (11457 global slots = 31.7 GB pool)
  expect: ~35.6 GB peak, ~20 tok/s warm decode (est. from M5 Pro anchors)
```

The auto policy: take 70% of RAM, stay 2 GB under the Metal working-set limit,
whichever binds. Three knobs override it (first one given wins):

- **`--memory-gb G`** — the easy knob: total memory the process may use.
  The expert cache gets what remains after the ~3.9 GB fixed footprint
  (resident weights + n-gram row cache) and a 0.5 GB margin. Measured:
  `--memory-gb 8` → 27 experts/layer cached, **7.0 GB actual peak**, 5.2 tok/s,
  and byte-identical greedy output. Minimum ~6.2 GB.
- **`--experts-per-layer N`** — the precise knob (of the model's 512). Each of
  the 48 layers has 512 experts of 2.76 MB and a token activates 10 of them per
  layer, so N is the intuitive unit: pool = N × 0.133 GB. Reference points, all
  measured: 512/layer = 67.9 GB fully resident · 181/layer = 24 GB → 20 tok/s
  warm · 30/layer = 4 GB → 5.6 tok/s in 7.3 GB total, byte-identical output.
- **`--pool-gb G`** — raw pool size (1 GB ≈ 7.5 experts/layer).

The pool is one global cache shared across layers — per-layer is a unit, not a
quota; hot layers borrow slots from cold ones. Floor is 14/layer (below that, a
prefill chunk could pin every slot). `slotstream doctor` prints the plan any
flags would produce plus a target → experts/layer → est. tok/s table.

- **[PLAN.md](PLAN.md)** — design, byte math, tiers, milestone tracker.
- **[MEASUREMENTS.md](MEASUREMENTS.md)** — every number above, with method,
  including the false starts (page-cache-contaminated disk benches, MLX
  version-skew parity, the mmap OOM story) and the honest gap list
  (dense-sweep prefill, real 16 GB hardware, GUI clients, installers).

Why this design is required rather than merely nice: MLX cannot sparsely
materialise a memory-mapped tensor — a top-10 expert gather pulls **all 512**
experts of that layer, a 16-row n-gram lookup pulls its whole **250 MB** shard,
so every mmap-based path loads ~100 GB and dies. The slot pool is the workaround
with receipts; see MEASUREMENTS §M0.8.
