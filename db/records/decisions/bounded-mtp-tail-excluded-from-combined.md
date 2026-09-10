---
type: decision
id: 01m20m20r2ps2f7gz0gp33rtzb
created: 2026-09-08T13:41:56.610436+00:00
updated: 2026-09-08T13:41:56.610436+00:00
summary: Preserve the original MTP verification shape after exact-output counterexamples
decided_on: 2026-09-08
evidence: '[[records/plan/whole-engine-optimization-2026-09-04]]'
reversible_if: A new implementation meets the numerical contract including current counterexamples and fresh matched-memory serving benefit.
title: Exclude bounded MTP tail from combined defaults
status: standing
---
Exclude boundedDraftTail from the combined integration/deployment candidate. Keep the original fixed MTP verification schedule and the separately qualified compact BF16 cache. The tail experiment remains explicit-only; its successful isolated fixture does not authorize broader default selection.

The completed V349 full MTP suite fails six exact-output assertions. Its two-output candidate [33, 461] differs from both the independent reference and the candidate longer prefix [33, 428]; four longer requests also change their final token. V360 changes only candidate selection and related diagnostics/comments, and its complete MTP rerun passes all327 assertions, preserving every original exact-output case. This independently resolves the counterexample by restoring the reference numerical shape. No output tolerance, golden, sampler, kernel or context bound is relaxed.

Theoretical causality makes later rows unnecessary in exact arithmetic, but changing the physical verification shape changes the actual finite-precision computation. Greedy selection alone did not make that change transparent. The earlier V343 paired short-request gains remain valid only for their successful fixture, not for default deployment or sustained TPS.

Reopen only for a new implementation with an explicit numerical contract, broad exact-output/prefix tests including these counterexamples, and fresh same-build fixed-memory serving benefit. A new timing-only success cannot override the output contract.

Evidence: [[sources/runs/2026/09/2026-09-08-optimization-compact-tail-native-counterexample]], [[sources/runs/2026/09/2026-09-08-optimization-mtp-verification-shape-correction]], [[sources/runs/2026/09/2026-09-08-optimization-compact-cache-fixed-mtp-build]]. The completed full native batch is [[sources/runs/2026/09/2026-09-08-optimization-fixed-mtp-native-pass]]. The unified plan remains incomplete; this decision settles only the failed tail optimization's default disposition.