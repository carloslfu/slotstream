---
type: run
id: 01m1na47vgs22x5aa3t6pcv2g9
created: 2026-09-04T04:16:44.912078+00:00
updated: 2026-09-04T04:16:44.912078+00:00
summary: 'PrefillProbe: the pass''s three unbounded transients — MoE combine, PLE, QSA indexer — dev Mac, 2026-09-03'
binary: swift-probe/.build/release/PrefillProbe, local release build against mlx-swift 0.31.6 (MLX 0.31.1), no model weights
captured_at: 2026-09-03
command: PrefillProbe all   (moe | ple | idx run the three sections separately)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'PrefillProbe: the pass''s three unbounded transients — MoE combine, PLE, QSA indexer — dev Mac, 2026-09-03'
tool: run
---

## What this asks

The prefill pass is chunked because its transients scale with the chunk. The
chunk count is what multiplies expert reads, because a pass re-reads nearly the
whole routed expert set, so expert bytes go as the number of passes and a
32,768-token prompt at the auto plan runs **25 passes**
(`prefill-schedule --tokens 32768 --chunk 4096`: 4096 ×1, 2048 ×5, 1024 ×17,
512 ×2). Making the pass bigger therefore means bounding what grows with it.

The 2026-09-03 phase trace already established that no single transient is the
peak — attention, PLE and the MoE sweep sit within 0.6 GB of each other, which
is why query-blocking attention alone moved the process peak by 0.00 GB — and
concluded that "lowering the pass's peak means bounding attention, PLE and the
MoE sweep together." Attention is done (`AttnProbe`, kept as a no-op). This
probe measures the other two, plus a fourth nobody had named: the QSA
**indexer**, which produces the mask that `AttentionTuning.queryBlock` blocks
but which itself still runs over the whole pass.

No model weights; shapes come from `config.json`.

## Conditions

Load average 7.0–7.9, an idle `slotstream serve` holding the model lock.
**Peak figures are allocation sizes and reproduced exactly across two capture
sessions an hour apart; the millisecond figures did not** (the MoE arm read
×1.00/×0.86/×1.04 in the quiet session and ×1.24/×1.52/×0.94 here). Treat the
peaks as measured and the times as needing a quiet re-run.

## Raw output

```
Thu Sep  3 23:14:12 -05 2026
23:14  up 12 days, 12:26, 2 users, load averages: 7.38 7.52 6.15


=== E4: MoE combine — (B,S,K,H) materialisation vs weighted scatter-add ===
  pass  1024 tokens | rows  10240 | groups 16 | routed experts 506 | (B,S,K,H) = 0.05 GB
    A  keep all groups, (B,S,K,H) combine:    39.4 ms   peak  0.32 GB
    B  fold each group, scatter-add f32:      49.0 ms   peak  0.15 GB   (x1.24 time, x0.46 peak, -0.17 GB)
    vs an f32 reference: A err 2.063e-02, B err 4.461e-03, |A-B| 2.135e-02 of a 3.843e+00 spread (0.5555%)
  pass  2048 tokens | rows  20480 | groups 16 | routed experts 512 | (B,S,K,H) = 0.10 GB
    A  keep all groups, (B,S,K,H) combine:    76.1 ms   peak  0.65 GB
    B  fold each group, scatter-add f32:     115.3 ms   peak  0.30 GB   (x1.52 time, x0.46 peak, -0.35 GB)
    vs an f32 reference: A err 1.896e-02, B err 4.387e-03, |A-B| 1.861e-02 of a 3.766e+00 spread (0.4943%)
  pass  4096 tokens | rows  40960 | groups 16 | routed experts 512 | (B,S,K,H) = 0.21 GB
    A  keep all groups, (B,S,K,H) combine:   246.7 ms   peak  1.28 GB
    B  fold each group, scatter-add f32:     232.2 ms   peak  0.59 GB   (x0.94 time, x0.46 peak, -0.69 GB)
    vs an f32 reference: A err 2.046e-02, B err 4.767e-03, |A-B| 2.065e-02 of a 3.810e+00 spread (0.5421%)

=== E6: PLE (layer 1) — whole pass vs blocked with a conv carry ===
  pass  1024 tokens | hidden (B,S,hc*H) = 0.02 GB
    whole pass:        56.6 ms   peak  0.62 GB
    blocked  512:      37.4 ms   peak  0.40 GB   bit-identical
    blocked  256:      30.1 ms   peak  0.27 GB   bit-identical
  pass  2048 tokens | hidden (B,S,hc*H) = 0.04 GB
    whole pass:        78.6 ms   peak  1.18 GB
    blocked 1024:      58.1 ms   peak  0.73 GB   bit-identical
    blocked  512:      69.2 ms   peak  0.47 GB   bit-identical
    blocked  256:      65.5 ms   peak  0.33 GB   bit-identical
  pass  4096 tokens | hidden (B,S,hc*H) = 0.08 GB
    whole pass:       188.5 ms   peak  2.04 GB
    blocked 1024:     109.0 ms   peak  0.87 GB   bit-identical
    blocked  512:     118.7 ms   peak  0.60 GB   bit-identical
    blocked  256:     128.2 ms   peak  0.47 GB   bit-identical

=== E5: QSA indexer — whole pass vs query-blocked (exactness + transient) ===
  pass  2048 over   8016 keys | scores 2048 x 2004 x 4 f32 -> predicted ~0.20 GB
    whole pass:               40.1 ms   peak  0.20 GB
    blocked 1024:             17.8 ms   peak  0.13 GB   bit-identical
    blocked  512:             27.7 ms   peak  0.09 GB   bit-identical
    blocked  256:             21.2 ms   peak  0.07 GB   bit-identical
  pass  4096 over   8016 keys | scores 4096 x 2004 x 4 f32 -> predicted ~0.39 GB
    whole pass:               96.2 ms   peak  0.40 GB
    blocked 1024:             18.9 ms   peak  0.17 GB   bit-identical
    blocked  512:             32.7 ms   peak  0.14 GB   bit-identical
    blocked  256:             58.0 ms   peak  0.14 GB   bit-identical
  pass  4096 over  16384 keys | scores 4096 x 4096 x 4 f32 -> predicted ~0.81 GB
    whole pass:              271.0 ms   peak  1.04 GB
    blocked 1024:             39.6 ms   peak  0.40 GB   bit-identical
    blocked  512:             41.0 ms   peak  0.28 GB   bit-identical
    blocked  256:             50.7 ms   peak  0.28 GB   bit-identical
  pass  4096 over  32768 keys | scores 4096 x 8192 x 4 f32 -> predicted ~1.61 GB
    whole pass:             1102.0 ms   peak  1.98 GB
    blocked 1024:             61.1 ms   peak  0.78 GB   bit-identical
    blocked  512:             75.4 ms   peak  0.55 GB   bit-identical
    blocked  256:            150.4 ms   peak  0.55 GB   bit-identical
```

## What it says

**All three are bounded, and two of the three are bit-identical when bounded.**
At a 4096-token pass:

| transient | whole pass | bounded | saved | exact? |
|---|---|---|---|---|
| PLE (layer 1), blocked 512 with a conv carry | 2.04 GB | 0.60 GB | **−1.44 GB** | bit-identical |
| QSA indexer over a 32,768-key context, blocked 512 | 1.98 | 0.55 | **−1.43** | bit-identical |
| QSA indexer over an 8,016-key context, blocked 512 | 0.40 | 0.14 | −0.26 | bit-identical |
| MoE combine, weighted scatter-add per group | 1.28 | 0.59 | **−0.69** | 0.49–0.56% of spread |
| QSA SDPA, blocked 512 (already built, 2026-09-03) | 1.83 | 0.40 | −1.43 | bit-identical |

Summed over an 8,016-key context: **5.55 GB → 1.73 GB.** These are isolated
probes and the engine's phases overlap, so the end-to-end figure is not this
sum; the phase trace on a real run is what settles it, and it must be run
before, not after.

**PLE blocks exactly, and it is the biggest single item.** Every op in
`PLELayer` is per-token except the dilated short conv, which carries
`(kernel-1) × dilation = 9` rows. Passing that carry between blocks reproduces
the whole-pass result bit for bit at every block size tested, and costs
nothing — the blocked arm was *faster* in both sessions.

**The indexer is the transient nobody had named.** `AttentionTuning.queryBlock`
blocks the SDPA, but `QSAIndexer` runs on the whole pass and builds
`scores` at `S × (ctx/4) × 4` in f32 plus three `S × ctx` boolean masks. At
4096 over 32,768 that is 1.98 GB, unblocked. Its mask is a pure per-query
function, so unlike the SDPA there is no reduction-order freedom at all and
blocking is bit-identical at **every** block size, not only at 256 and up.
It is also 2.8–14× faster blocked, because the whole-pass `argPartition` over
33 M elements and the giant boolean ops are cache-hostile.

Consequence for what is currently written down: the comment on
`AttentionTuning` says blocking caps "a transient that would otherwise grow
without limit as the context cap rises". Only half of it. The QSA layer as a
whole is still O(pass × context) until the indexer is blocked too.

**The MoE combine fold is also a numerical improvement.** `MoELayer.sweep`
returns `(B,S,K,H)` and the combine holds up to three copies of it — 51.2 KB
per token each, because K = 10. Folding each staging group into a `(B*S, H)`
f32 accumulator with `array.at[idx].add(...)` (mlx-swift's `mlx_scatter_add`)
never materialises the K axis and halves the phase's peak (×0.46 at every pass
size). It is not bit-identical, because the shipped path sums ten bf16 terms in
bf16 — and that is precisely why the fold is *more* accurate: measured against
an f32 reference, error falls from 2.0e-2 to 4.5e-3. The A-to-B delta is
0.49–0.56% of logit spread, well inside the band `sweep-check` already
tolerates (it reads 3.32% against a 5.09% rechunk control).
