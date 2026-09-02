---
type: measurement
id: 01m1hhwky2bhn4ca7wgjwyds98
created: 2026-09-02T17:15:26.018161+00:00
updated: 2026-09-02T17:15:26.018161+00:00
summary: 'Closing the three deferred gaps (2026-08-29): 0.1.5'
date: 2026-08-29
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '340'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Closing the three deferred gaps (2026-08-29): 0.1.5'
status: measured
---

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
