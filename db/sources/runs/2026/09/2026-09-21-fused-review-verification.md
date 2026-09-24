---
type: run
id: 01m32n0h62nvsm75r0n0z3z43r
created: 2026-09-21T18:52:47.170023+00:00
updated: 2026-09-21T18:52:47.586199+00:00
summary: Fused review diagnostic observability and final source verification
binary: Main MLX 0.31.1 binary; see main-build-identity.json
captured_at: 2026-09-21
command: verify_main.py; make docs; Tools/brain_gates.sh; git diff --check
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fused review diagnostic observability and final source verification
tool: Native optimized build, T0, real scope diagnostic and brain gates
---
[Final diagnostic/source verification](../../../artifacts/fused-review-2026-09-21/verification.tar.gz), with [verified member hashes](../../../artifacts/fused-review-2026-09-21/verification-manifest.json).

The main diagnostic now records the reference, ordinary rechunk-control and candidate greedy token at every comparison, plus whether the control matches. It retains every original candidate parity assertion. This makes the asymmetric interpretation visible without relabeling a failed parity check as passed.

The optimized main build succeeds with the original MLX 0.31.1 metallib and dependency pin. All 56 T0 groups pass. A real 1024-token read-scope diagnostic passes all 817 checks and exposes all 21 arm-token observations plus all seven control-match observations. Exact source comparison against the previously qualified prompt-speed runtime finds no changed production Slotstream source files; this turn's compiled main change is in diagnostics. The isolated newer-backend experiment is not promoted or released.

Each heavy step has a recorded real-memory and competing-process preflight, runs alone, and exits. Source archive, executable and metallib identities are retained. Brain gates pass with zero errors, the same two historical log-order warnings and 303 claim checks. Generated projections and whitespace checks pass. No owned model or compiler remains after verification.
