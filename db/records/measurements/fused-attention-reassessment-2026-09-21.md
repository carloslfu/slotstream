---
type: measurement
id: 01m32mgxxq8bgg5c1ws16hkvw0
created: 2026-09-21T18:44:15.926866+00:00
updated: 2026-09-21T21:36:23.469456+00:00
summary: 'Fused attention reassessment: usability, fidelity and qualification'
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Later production integration is recorded in [[records/measurements/fused-prefill-integration-2026-09-21]]; original measurements and failed cross-backend comparisons are preserved.
order: '1611'
runs: '[[sources/runs/2026/09/2026-09-21-fused-review-correctness]], [[sources/runs/2026/09/2026-09-21-fused-review-performance]], [[sources/runs/2026/09/2026-09-21-fused-review-verification]]'
title: 'Fused attention reassessment: usability, fidelity and qualification'
status: analysis
---
Fused head-dimension-256 attention can run on this M5 Pro with Slotstream's explicit sparse masks. The earlier rejection establishes a failure of cross-kernel token parity, not an inability to integrate the kernel and not demonstrated lower answer quality. This reassessment preserves the original run and its three candidate mismatches.

## What the rejection missed

The existing diagnostic compares 256-token reference prefill, ordinary 512-token rechunking, and the fused 256-token candidate. It allows numerical drift relative to the rechunking control, but only asserted greedy-token equality for the candidate. The symmetric reassessment finds one changed token in the ordinary rechunking control and the same three changed choices in the candidate, across seven checkpoints. The synthetic prompt consists of arbitrary vocabulary IDs. There is no semantic oracle establishing that one of those predicted tokens is the correct answer.

A changed arithmetic implementation and an inconsistent cache are separate questions. The standing warm/cold rule requires an identical computation when the same backend processes the same request, including its producing pass schedule. It explicitly does not require different pass sizes to agree. An upgrade can change floating-point rounding without breaking this rule. The new candidate reuses 2048 tokens and produces bit-identical cold logits on the tested continuation.

## Numerical fidelity and real tasks

A float64 NumPy reference, computed from exactly the same BF16 inputs, is more independent than treating the old BF16 output as truth. Across 12 synthetic component cases, including sparse masks, odd lengths and keys up to 32768, fused attention has smaller relative-L2 error every time. The median old/new error ratio is 2.562232. Eight query rows across all 24 heads are checked in each case. This is component fidelity, not a full-model accuracy guarantee.

The fallback materializes intermediate attention scores in the input dtype; the NAX implementation uses float accumulators and avoids the complete score tensor. They compute the same masked-attention formula with different rounding and memory traffic. The improved component fidelity is therefore consistent with the implementation, rather than a reason to expect bitwise agreement with the old path.

Four real inventory tasks use 3935 to 4190 prompt tokens, 256-row compute, 4096-token read scopes and greedy generation without thinking. Both implementations produce identical output tokens in every task. Retrieval, JSON extraction and a typed tool call are correct. Both produce the same wrong arithmetic result, 966 instead of 714. Preserve that failure: the report passes 35 of 37 assertions, not every assertion. This limited comparison finds no candidate-only semantic regression; it does not certify general answer quality. Physical footprint remains below 10 GB.

## Integration and remaining scope

The isolated Swift build uses MLX 0.32.2 and its matching metallib. The ordinary project still pins MLX 0.31.1. The tested newer dispatch defaults D256 to fused only for at least 1024 causal queries without an array mask. force_fused permits the supported kernel with the 256-query and explicit-mask geometry tested here. The later upstream array-mask dispatch change is distinct from, and unnecessary for, this forced path.

This establishes feasibility on the M5 Pro. The production dependency is not upgraded by this research. Full backend/application qualification, MTP and persistent-reopen coverage under the new backend, larger context profiles, and other target Mac generations remain outside these new tests. Existing speed and memory gates continue to apply. The same-backend cache check remains strict; a cross-backend token mismatch is labeled as parity evidence, not silently rewritten as a quality failure or a passing parity result.

## Full-prompt performance

The separate loaded-engine experiment processes the same 8195-token fixture, with the same model pool and compute/read schedule, under fused and unfused MLX 0.32.2. One warmup per arm precedes five alternating pairs. Two pairs are eligible; three are excluded for paging. Eligible unfused/fused times are 40.860659/38.723230 seconds and 41.259546/39.303033 seconds. The median paired throughput ratio is 1.052489, about 4.99% less prefill time. This is preliminary evidence from two clean pairs, not a release-qualified or universal speed claim. All prompt-completion and physical-memory checks pass.

The whole-prompt gain is much smaller than the attention-operation gain because fusion does not remove expert SSD traffic or the rest of the model work. The measured candidate also reads about 0.4% fewer expert bytes because rounding can change routing, so this is an integrated-candidate comparison. Lifetime physical peaks do not establish a whole-process memory reduction. Longer contexts and larger compute passes may make attention's memory savings more valuable; that is an engineering hypothesis requiring a separate profile measurement.

Correctness evidence: [[sources/runs/2026/09/2026-09-21-fused-review-correctness]]. Timing evidence: [[sources/runs/2026/09/2026-09-21-fused-review-performance]]. Operating interpretation: [[records/decisions/kernel-upgrade-fidelity-and-cache-equivalence]].


## Diagnostic correction verified

The main diagnostic now records every reference, control and candidate token choice while retaining its original parity assertions. The optimized main build, all 56 T0 groups and all 817 checks in the real 1024-token scope fixture pass. All 21 arm-token measurements and seven control-match observations are present. Production Slotstream sources match the previously qualified runtime byte for byte. Exact sources and final verification are retained in [[sources/runs/2026/09/2026-09-21-fused-review-verification]].
