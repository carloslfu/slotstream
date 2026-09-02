---
type: decision
id: 01m1hsjvymevfrjaq7eq6vh2b1
created: 2026-09-02T19:29:55.156495+00:00
updated: 2026-09-02T19:29:55.156495+00:00
summary: Prefill passes of 256 tokens or more sweep through staging and grouped GEMM; only the last pass writes the pool
decided_on: 2026-09-02
evidence: '[[records/measurements/n2-the-prefill-sweep-grouped-gemm-over-staging-contiguous-reads-no-pool-writes-2026-09-02]]'
reversible_if: a pool-path prefill measures faster than the sweep at the same target in paired rounds, or sweep-check leaves the prefill-rechunk band
title: Prefill passes of 256 tokens or more sweep through staging and grouped GEMM; only the last pass writes the pool
status: standing
---
A pass of 256 tokens or more never loads the slot pool: it sweeps each layer's experts
through staging groups of 32 and MLX's grouped GEMM (`gather_qmm_rhs`, reached by sorted
indices), reads consecutive experts as one `pread` per piece, and writes the pool only on
the last pass, by frequency. Decided on the interleaved A/B against the 0.2.2 code: 8k
acceptance prompt 91 → 184 tok/s at a 16 GB target, prose 66 → 140, the 8.1 GB floor
51 → 93, all inside the prefill-rechunk band and bit-identical on a cold and a warm pool
(`sweep-check`). Decode, speculative verify passes, and passes under 256 tokens keep the
pool path unchanged. The threshold is the token count alone, never the pool, so the pool
cannot change the math.
