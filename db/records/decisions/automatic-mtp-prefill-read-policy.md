---
type: decision
id: 01m33r1aww0tcbz5dgxyb7a4kd
created: 2026-09-22T05:04:53.660762+00:00
updated: 2026-09-22T05:04:53.660762+00:00
summary: Apply MTP prefill improvements automatically
decided_on: 2026-09-21
evidence: '[[records/measurements/mtp-prefill-policy-2026-09-21]]'
reversible_if: Reproduced state/cache or process-memory failure, or clean paired latency regression, narrows or reverses the automatic policy; wider profiles need their own evidence.
title: Apply MTP prefill improvements automatically
status: standing
---
At Carlos's explicit direction, replace the blanket MTP exclusion with actual phase accounting and qualify the combined path. Adopt the final implementation in [[records/measurements/mtp-prefill-policy-2026-09-21]] after exactness, physical-memory, lifecycle, cache, native app and static gates. All three matched pairs are eligible. Median paired prefill-time reduction is 65.40%; median paired request-time reduction is 64.53%.

Main and draft phases reserve their real overlap through the larger peak. In the already supported fused text path, the engine may use bounded expert-buffer writes when doing so allows an MTP group beyond 8192 that at least doubles the ordinary group fitting the current process budget, within the 16384-row envelope. These are internal choices. No user opt-in, larger memory target, altered math pass, draft-depth change or new hardware claim is introduced.

The doubled-group threshold limits extra synchronization and is an empirical operating choice. Revisit it with matched group/write timing across prompt shapes and budgets, while preserving actual allocation guards. Do not reclassify previous fixed-scope negative write experiments or V1's failed larger-group gate as successes.
