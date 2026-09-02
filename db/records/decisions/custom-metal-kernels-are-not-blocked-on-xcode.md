---
type: decision
id: 01m1hhwpjy6d1jyc4vxdc5hd5c
created: 2026-09-02T17:15:28.734686+00:00
updated: 2026-09-02T17:15:28.734686+00:00
summary: Writing a new Metal kernel is not blocked on Xcode; only mlx-swift's bundled shader library is, and it is vendored
decided_on: 2026-08-30
evidence:
- '[[records/measurements/prefill-second-pass-2026-08-30-the-cost-model-was-wrong-read-ahead-does]]'
- '[[records/measurements/build-blocker-mlx-swift-s-bundled-metal-shaders-require-xcode]]'
- '[[records/plan/9-risk-register]]'
reversible_if: 'never as stated: the bundled-shader constraint remains real and is solved by vendoring the metallib'
title: Writing a new Metal kernel is not blocked on Xcode; only mlx-swift's bundled shader library is, and it is vendored
status: standing
---

Four documents said the grouped-GEMM prefill work needed Xcode for two releases while GatedDelta.swift shipped a JIT-compiled kernel through MLXFast.metalKernel. Verified on the CLT-only dev Mac: a fresh kernel compiled and ran. N2 proceeds.
