---
type: measurement
id: 01m2c4qtcbz652bba8qgpekyyz
created: 2026-09-13T01:05:06.955204+00:00
updated: 2026-09-13T12:12:32.644783+00:00
summary: Deferring the per-layer GPU drain with multi-generation pins gains 3.8% to 5.1% with exact outputs; record reads and nine flags are null; profiles close compilation
date: 2026-09-12
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Exploration sweeps on three prompts at 256 outputs; barrier measured with prefetch off; composition with prefetch, coverage and depth pending; no public claim.
order: '1260'
runs: '[[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-1]]'
title: 'Decode path serialization, round 1: deferring the per-layer GPU drain buys 3.8% to 5.1%; host time is waiting, not compute'
status: measured
---
**Outcome: removing one of the two host-blocking synchronizations in every layer buys 3.8% to 5.1% with exact outputs, and the host's share of decode turns out to be waiting, which closes compilation and host point fixes.** Every MoE layer reads its routing back to the host and every layer ends in a full evaluation: 96 synchronizations per forward pass, so expert I/O, GPU work and host work run strictly in turn ([[records/measurements/decode-wall-time-attribution-2026-09-10]] partitions them 37.2, 30.1 and 32.7 percent, summing to 100). The end-of-layer drain exists so the next layer's ensure cannot scatter into a slot an unevaluated gather still reads. Pins already exclude a slot from every victim scan; they were retired one layer too early. With pins held for K + 1 generations and the drain taken every K layers, prefetch off, paired ratios against the original path are 1.025 at K=2, 1.038 at K=3, 1.040 at K=4, 1.047 at K=6 and 1.051 at K=8. Every paired comparison is above 1, demand records stay within 0.3% and tokens per verify pass are unchanged: the gain is overlap, not a different workload. Exactness held at K=4 on the six correctness requests and at every K in the sweep.

**What closed.**

- Whole-record speculative reads: 1.002 (0.993 to 1.013). Nine reads per record were real, but speculative reads run on worker threads off the critical path, and the demand path already read whole records. Four lanes cost 8.3% (0.917); 8, 16 and 24 are flat.
- Nine implemented but disabled host accelerators, re-tested under slot adoption: paired mean 1.0012, standard deviation 0.0101. The earlier rejections stand. The router weight cache is the one with a consistent sign (1.010 on three pairs) and gets a powered re-test.
- Residency speculation: only 2.2% to 2.5% of layer events need no demand read at the B0 setting, so skipping the routing readback on complete layers has almost nothing to act on ([[records/decisions/residency-speculation-waits-for-layer-completeness]]).
- Graph compilation: the model thread's leaf samples are 69.7% GPU wait without prefetch and 73.5% with it, while MLX evaluation and Metal command encoding self time sits in the tens of samples at the top of the process-wide stack. The host share is waiting on the GPU and on reads, not graph construction ([[records/decisions/decode-host-time-is-waiting-not-graph-construction]]).

**Also measured.** Prefetch halves the model thread's lock and condition-variable waiting (9.9% to 4.4%), consistent with its 47% cut in demand-read joins. The first reading of the flag sweep divided medians taken across prompts of different intrinsic speed and overstated every flag at 1.010 to 1.023; paired per-request ratios replaced it in both tools.

**Limits and next.** Exploration on three prompts at 256 outputs, not a held-out cohort. The barrier was measured with prefetch off, because a pending forecast forces the drain in this build; deferred forecast consumption is written, and its composition with prefetch is the next measurement, followed by prefetch coverage depth, draft depth under per-depth protocols and the powered router-weight re-test. No public claim.

Commands, tables, profiles, interruptions and hashes: [[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-1]].

**Correction (2026-09-13).** The profile split above describes one of the model thread's two blocks in the `sample` output, the cooperative-queue block that runs the layer loop. The same thread's other block, where it reads records, is 91% file reads. Merged by thread id, the model thread spent 35.1% (prefetch off) and 41.3% (prefetch on) of its samples in GPU waits and 45.2% and 40.0% in file reads, and prefetch lowered locks and condition variables from 9.0% to 5.9% rather than from 9.9% to 4.4%. Host work outside waiting is 8% to 10% either way, so the compilation conclusion holds: [[records/measurements/decode-path-serialization-closing-profiles-2026-09-13]].
