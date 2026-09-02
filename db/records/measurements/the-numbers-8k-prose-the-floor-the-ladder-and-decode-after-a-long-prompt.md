---
type: measurement
id: 01m1htch45e5gmjhabjt044e7v
created: 2026-09-02T19:43:56.037621+00:00
updated: 2026-09-02T19:43:56.037621+00:00
summary: 'The numbers: 8k, prose, the floor, the ladder, and decode after a long prompt'
date: 2026-09-02
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: N2
order: '670'
title: 'The numbers: 8k, prose, the floor, the ladder, and decode after a long prompt'
status: measured
runs:
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-8k-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-prose-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-check]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-context-check-8192-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-floor-and-10gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ladder-60-per-layer]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-tuning]]'
---
Every row is an interleaved A/B on the dev Mac between the commit before the
sweep (`e09bcac`, the 0.2.2 code) and the sweep, same prompt, same flags, one
model process at a time, real footprint sampled from `top` with a watchdog
that kills a run under 2.5 GB reclaimable. Single runs here vary by 10 to 15%,
so the headline is three rounds and the rest are one or two.

**The 8k acceptance prompt** (the 7,960/8,073-token `verify.sh` prompt, three
sentences repeated) at `--memory-gb 16`, which plans a 1024-token pass and 54
experts per layer:

| round | 0.2.2 code | sweep |
|---|---|---|
| 1 | 100.5 tok/s | 191.8 |
| 2 | 83.8 | 165.5 |
| 3 | 89.7 | 195.0 |
| **mean** | **91.3** | **184.1 (×2.02)** |
| shipped build, two more rounds | 94.6 / 90.1 | 209.5 / 161.8 |
| peak RSS | 13.0 GB | 13.2 |

The split says where the ×2 came from: reads 30.4 → 25.7 s, the pool scatter
10.4 → 1.2 s (that is the copies of resident experts; the pool is never
written), and compute 49.2 → 21.9 s, on the same 98,000 records read either
way.

**Ordinary prose** — a 34,000-character excerpt of PLAN.md, 10,490 tokens,
at `--memory-gb 16`:

| build | prefill |
|---|---|
| 0.2.2 code | 66.1 / 66.6 / 67.3 / 67.6 tok/s |
| sweep, rows one at a time | 107.9 / 106.5 |
| **shipped: sweep + parallel n-gram rows** | **140.1 / 139.2 (×2.1)** |

Prose routes to nearly every expert of every layer (181,475 records against
98,872 for the same pass size on the acceptance prompt) and is the honest
number for a pasted document.

**Small targets**, the 7,960-token prompt, one round each:

| target | 0.2.2 code | shipped build |
|---|---|---|
| 8.1 GB floor (13/layer, 256-token pass) | 50.8 tok/s, peak 7.7 GB | **93.1 tok/s, peak 6.2 GB** |
| 10 GB (20/layer) | 41.3 tok/s, peak 8.6 GB (2026-08-31 record) | **87.7 tok/s, peak 7.2 GB** |

At the floor the pass reads 826 GB of records in 31 passes; the reads went
83.4 → 56.3 s and the scatter 26.3 → 0.7, and the peak fell because the MLX
buffer cache is capped while a small target reads a prompt (the knobs
section). Both memory promises hold with more headroom than before.

**`context-check --tokens 8192` at `--memory-gb 16`**, the dense synthetic
prompt the tool reads: 0.2.2 code 64.2 tok/s (127.7 s, peak 13.1 GB); sweep
152.4 tok/s (53.7 s, peak 13.2), the shipped build 154.8, ×2.4.

**The pass-size ladder** at a matched pool of 60 experts per layer
(`--experts-per-layer 60`, the 8,073-token prompt), which is what the
planner's estimator now carries:

| pass | 0.2.2 code | sweep | sweep, peak |
|---|---|---|---|
| 256 | 45.6 tok/s | 87.5 | 14.1 GB |
| 512 | — | 128.2 | 14.1 |
| 1024 | 87.0 | 169.2 | 14.0 |
| 2048 | — | 210.8 | 13.7 |
| 4096 | 103.2 | 222.3 | 13.8 |

And 4096 at the 16 GB target by `SLOTSTREAM_PREFILL_CHUNK` override: 246.7
tok/s at a 12.8 GB peak against 107.9 at 14.6. The estimator reads 85 / 125 /
165 / 205 / 220, rounded down; with it the planner now picks a 2048-token pass
from a 20 GB target where it picked 1024, and the request-time scoring and
`Tools/monotonic_plan.py` still hold across the 7 to 90 GB sweep. The
full-context waits in `doctor` moved accordingly: 3.0 min for 32k on the 48 GB
plan (was 5.5), 6.4 on the 16 GB tier (was 13.7).

**Decode after a long prompt**, 48 tokens after the 8k prompt at 16 GB, three
rounds: 5.62 / 6.00 / 5.52 tok/s with the final pass admitting the prompt's
hot experts, 5.28 / 4.31 / 4.94 without.

The N2 exit was ≥150 tok/s at 8k on the dev Mac. It is met at a 16 GB target,
and by every pass size of 1024 tokens and up on a 60-per-layer pool; the auto
plan itself is the one row still missing (next section).
