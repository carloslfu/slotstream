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
  device: 52 GB RAM (36.9 GB reclaimable now), 40.2 GB Metal working set
  target: 34.4 GB total for this process   (override: --memory-gb N | --experts-per-layer N)
  cache:  ~226 of 512 experts per layer  (10832 global slots = 29.9 GB pool)
  expect: ~33.8 GB peak, ~20 tok/s warm decode (est. from M5 Pro anchors)
```

The auto policy has a ceiling and a clamp:

- **Ceiling** (deterministic): 70% of RAM, kept 2 GB under the Metal
  working-set limit — whichever binds.
- **Clamp** (protects busy machines): auto also reads what is *reclaimable
  right now* — free + purgeable + file-cache pages, i.e. memory that can be
  taken **without** compressing or swapping other apps — and sizes down to
  that minus slack when it's the binding constraint, saying so in a note:
  `only 13.2 GB of 52 GB RAM is reclaimable right now (other apps hold the
  rest) — sized down from the usual 36.1 GB; close apps and restart for full
  speed, or force a size with --memory-gb`. Measured under a real 21.5 GB
  memory hog: auto sized 36 → 10.7 GB, generated normally at a 9.4 GB actual
  peak with zero thrash, and sprang back to 34.4 GB the moment the hog exited.
  On a quiet machine the clamp never binds, so the plan stays deterministic.
  Explicit knobs are never resized — the user chose — they just get an
  informational note when the machine is busy.

- **Elastic while serving**: a startup-time size can't be right for a
  daemon's whole lifetime, so an auto-sized `serve` keeps resizing itself
  between requests — an availability replan every 15 s (shrink in one step
  when other apps need the memory; grow back with contents intact after 60 s
  of calm) plus OS memory-pressure events as the backstop for overcommit the
  availability math can't see. Each resize is one stderr line
  (`elastic: availability dropped — cache ~220 → ~183 experts/layer …`) and
  is reflected live in `/api/show`. Explicit sizes are never elastic;
  `--no-elastic` pins an auto size too. Proven byte-identical across live
  grow/shrink by `slotstream elastic-check` (a standing verify gate) and
  live under a 21.5 GB memory hog: the pool shed 29.2 → 9.9 GB as the hog
  grew, requests stayed byte-identical throughout, and the full size came
  back after the hog exited.

Three knobs override auto (first one given wins):

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
flags would produce plus a target → experts/layer → est. tok/s table, and takes
`--sim-ram/--sim-working-set/--sim-available` to preview what auto would do on
any other machine (`doctor --sim-ram 17.2 --sim-available 6` = a busy 16 GB
Mac); `Tools/verify.sh` pins the planner's choices across seven such setups.

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
