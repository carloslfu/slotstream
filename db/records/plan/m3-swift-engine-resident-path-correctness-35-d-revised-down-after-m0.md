---
type: plan
meta-type: operational
id: 01m1hhwnjr92xvmp1c5esm964v
created: 2026-09-02T17:15:27.704633+00:00
updated: 2026-09-02T17:15:27.704633+00:00
summary: M3 — Swift engine, resident-path correctness (3–5 d, revised down after M0)
date: 2026-08-28
doc: plan
kind: milestone
level: '3'
order: '230'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: M3 — Swift engine, resident-path correctness (**3–5 d**, revised down after M0)
---

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
