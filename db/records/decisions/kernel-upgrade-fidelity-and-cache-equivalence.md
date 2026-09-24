---
type: decision
id: 01m32mgxzfzdvn1hxxj2sc65nm
created: 2026-09-21T18:44:15.983234+00:00
updated: 2026-09-21T18:44:15.983234+00:00
summary: Separate kernel-upgrade fidelity from warm/cold cache equivalence
decided_on: 2026-09-21
evidence: '[[records/measurements/fused-attention-reassessment-2026-09-21]]'
reversible_if: A reproducible integration or quality regression changes the measured assessment; parity assertions remain valid for parity claims.
title: Separate kernel-upgrade fidelity from warm/cold cache equivalence
status: standing
---
Treat the newer fused-attention implementation as a usable experimental backend on the measured M5 profile. The earlier inference that final-token mismatches demonstrate that the kernel cannot be used is withdrawn. Its original cross-kernel parity failures remain recorded. Correctness, measured application quality and speed require their own evidence.

Keep [[records/decisions/a-continued-conversation-computes-what-a-cold-one-computes]] intact: a cached request must reproduce the same backend's cold computation under the same producing schedule. Changing the arithmetic implementation is a different operation, and its output need not match every old floating-point token choice to be numerically valid. The reassessment verifies an exact warm/cold continuation under the fused backend while independently evaluating component fidelity and semantic tasks.

The diagnostic must expose reference, rechunk-control and candidate token choices. A tolerance band, a matching old token, or a changed old token alone does not establish answer quality. Retain the old parity assertions for claims of parity; qualify an arithmetic upgrade through its actual numerical, application, lifecycle and measured performance evidence. The small semantic test contains a shared arithmetic failure and does not justify a broad quality claim.

This corrects the interpretation of the fused portion of [[records/decisions/prompt-speed-qualified-paths]], without reversing its three qualified production paths or enabling a dependency upgrade. Ordinary MLX defaults remain unchanged. Continue qualification within the authorized engineering work; there is no demonstrated platform impossibility on this M5 and no new user-approval requirement created by this correction.
