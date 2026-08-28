# slotstream

Run **Qwen3.8-Flash-Next** (125B-A6B + 51B n-gram store, 4-bit) on any Apple Silicon Mac —
SSD-streamed experts and PLE/n-gram rows, with RAM **cache slots** as the memory↔speed
knob. MLX + Swift, single binary, Ollama-compatible API.

- **[PLAN.md](PLAN.md)** — design, byte math, tiers, milestones, test matrix, risks.
- **[MEASUREMENTS.md](MEASUREMENTS.md)** — everything actually measured on hardware.
  PLAN holds estimates; MEASUREMENTS replaces them as they are made.

## Status — M0 complete (2026-08-28)

The design survived measurement, with one finding that changed its status from
"good idea" to "the only option":

**MLX cannot sparsely materialise a memory-mapped tensor.** A top-10 expert gather
materialises all 512 experts of that layer (→68 GB across the model); a 16-row
n-gram lookup materialises the whole 250 MB shard (→32 GB). Stock lazy loading
therefore pulls in ~100 GB and dies at any prompt length — observed, repeatedly, on
a 48 GB M5 Pro. A bounded, pre-allocated slot pool filled by explicit `pread` is the
only construction that avoids this. Every piece of it now measures working:

| | measured |
|---|---|
| `gatherQuantizedMM` over a resident pool | bit-identical to `quantizedMatmul` (Python **and** Swift) |
| Slot fills into a 27 GB pool | 49–75 GB/s, in place, no copy |
| SSD, cold, never-repeat, expert-record size | 9.5 GB/s @QD1 → **17.3 GB/s** @QD8+ |
| Lazy `load()` of the 97 GB checkpoint | 0.4 s, 0 GB resident |
| Expert record geometry | 2,764,800 B — exactly as planned |

Not yet done: no end-to-end generation of the full model (it requires the slot pool
that M3/M4 build), and no expert-locality curves from the real model. See the
summary at the end of MEASUREMENTS.md for the full list of what was confirmed,
corrected, discovered, and left open.

## Layout

```
PLAN.md           design + milestones (the living plan)
MEASUREMENTS.md   measured facts, with methodology and superseded attempts
Tools/            coldread.c, diskbench.c, slotbench*.py, cachesim.py,
                  trace_routers.py, run_model.py, reference/qwen4_exp.py
swift-probe/      Swift proof of the slot-pool + pread mechanism
bench/            traces, locality results
```

Build note: mlx-swift's Metal shaders cannot be built by SwiftPM CLI. Until that is
resolved properly, the probe runs by colocating the prebuilt `mlx.metallib` from the
Python `mlx` wheel next to the binary (see MEASUREMENTS.md §M0.4).
