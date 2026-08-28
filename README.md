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
| Peak memory @ 24 GB pool | 27.3 GB |
| Minimum demonstrated | **7.3 GB peak** @ 5.6 tok/s (4 GB pool) |
| Streaming correctness | 4 GB pool ≡ 24 GB pool: **byte-identical** greedy output |
| Port correctness | layers incl. streamed MoE/GDN/PLE **bit-exact** vs the Python reference (mlx-0.31.1-matched) |
| Chat template | token-for-token identical to `transformers` |

```bash
make build                       # SwiftPM build + colocate the metallib
.build/release/slotstream run --prompt "Why is the sky blue?"
.build/release/slotstream serve --port 11434    # Ollama-compatible API
Tools/api_test.sh 11434                          # endpoint battery
.build/release/slotstream doctor                 # device → recommended pool
```

Point any Ollama/OpenAI client at it: `/api/chat`, `/api/generate`, `/api/tags`,
`/v1/chat/completions` (streaming NDJSON / SSE). Model dir defaults to
`models/qwen38-flash-next-mlx-4bit` (the pinned `pipenetwork` MLX conversion);
`--pool-gb` is the memory↔speed knob.

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
