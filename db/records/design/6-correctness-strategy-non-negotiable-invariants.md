---
type: design
meta-type: conclusion
id: 01m1hhwncdmec1cq4qtm713x5t
created: 2026-09-02T17:15:27.501050+00:00
updated: 2026-09-02T17:15:27.501050+00:00
summary: 6. Correctness strategy (non-negotiable invariants)
date: 2026-08-28
doc: plan
level: '2'
order: '170'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 6. Correctness strategy (non-negotiable invariants)
---

1. **Streaming must be math-invisible.** Same engine, tiny cache vs infinite cache, greedy
   sampling → **identical token sequences**, always. This is a claim about the *expert
   pool*, where a hit and a miss deliver the same bytes to the same kernel. It does not
   extend to anything that changes how tokens are *batched* — prefill chunk size or
   conversation prefix reuse — where MLX picks reduction orders by shape and floating
   point is not associative (measured: MEASUREMENTS.md). Those are gated against a
   control instead. This is the golden test run in CI on
   a synthetic small qwen4_exp config and on truncated real weights.
2. **Parity with the Python reference** (the `qwen4_exp.py` shipped in the MLX conversions
   / PR #1788, revision-pinned and vendored into `Tools/reference/`): layer-by-layer
   hidden-state comparison on real weights for each of the four block types (GDN, QSA,
   MoE, PLE) — the full model never needs to fit in RAM to prove the port is right.
   Target ≤1e-2 relative; investigate anything above.
3. **GDN state stays fp32** (`mamba_ssm_dtype: float32`) — numerics drift here is a known
   architecture foot-gun.
4. **QSA: the indexer is core, not optional.** Dense attention is exactly equivalent only
   while context ≤ the indexer budget (2048 tokens) — beyond that the trained behavior is
   top-2048-token sparse attention, and a dense path silently diverges from the model as
   trained (and from the Python reference, so parity would fail anyway). Implement the
   indexer in M3 proper; keep the dense path as a *test oracle* for ≤2048-token parity
   runs and as a debug flag, never as the shipped path.
5. Repack is checksummed both directions (source tensor sha → record sha), and `pull`
   verifies before first run. Model is 2 days old; expect re-releases — pin revisions.

---
