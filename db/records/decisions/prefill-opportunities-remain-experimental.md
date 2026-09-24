---
type: decision
id: 01m33767vb3r0qav739vx8gxcv
created: 2026-09-22T00:10:28.587731+00:00
updated: 2026-09-22T02:44:34.356294+00:00
summary: Keep larger read groups and fused workspace experimental
decided_on: 2026-09-21
evidence: '[[records/measurements/prefill-opportunities-2026-09-21]]'
reversible_if: At least three clean matched pairs plus exact-state, cache, lifecycle and physical-memory qualification on the proposed target; a reproduced correctness or memory regression removes the experimental path.
title: Keep larger read groups and fused workspace experimental
status: reversed
---
Reversed as a product-default decision by [[records/decisions/automatic-prefill-read-policy]] at the user’s explicit direction. The new timing study also fails its frozen speed gate; all original evidence and thresholds below remain historical facts. Functional and memory validation support the bounded automatic adoption, without a new qualified speed claim.

Keep the bounded combination available for explicit qualification; do not change automatic defaults. [[records/measurements/prefill-opportunities-2026-09-21]] contains one clean 16K pair with a large improvement and exact-state evidence, but fails the prespecified three-pair performance threshold after the maximum five rounds. Both the exclusions and the slower larger-only outlier remain evidence.

Remove the ineffective allocator-clear prototype. Do not promote larger compute passes, scalar selected attention or the tested key-compaction variants. A physical probe demonstrates that planner refusal is not proof of physical impossibility for the bounded 1024-pass case, but supplies no reason to relax general planning: its screen is slower and its configuration is limited.

Preserve original reservations on MTP, images, unsupported hardware/dtypes, unqualified shapes and fallback attention. Keep public library defaults and existing automatic scheduling behavior. Revision requires clean matched timing plus the exact-state, lifecycle, cache and process-memory gates for the actual target configuration. Further hardware, memory targets, prompts or sparse algorithms require their own evidence.
