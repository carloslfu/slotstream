---
type: measurement
id: 01m33r1aw97v9jggx372pw9yvm
created: 2026-09-22T05:04:53.641660+00:00
updated: 2026-09-22T05:04:53.641660+00:00
summary: 'Automatic MTP prefill: phase accounting and bounded expert writes'
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1615'
runs: '[[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-timing]], [[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-correctness]], [[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-v1]], [[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-phase-screen]]'
title: 'Automatic MTP prefill: phase accounting and bounded expert writes'
status: measured
---
The supported fused text-prefill policy now works with MTP automatically. There is no new user opt-in. MTP changes retained tensors and peak memory, but it does not require disabling fused main attention. All three matched pairs are eligible. Median paired prefill-time reduction is 65.40%; median paired request-time reduction is 64.53%.

## Implementation

Price the main and draft phases separately and reserve their maximum. The draft calculation includes the complete main multi-stream output while it is retained, the shifted first draft pass and cache positions, short tails and full draft-attention allowance. Main and draft replacement caches remain separately charged. All byte arithmetic saturates on invalid input or overflow.

MTP resident weights can leave too little room for the larger main expert workspace. The engine can evaluate expert-buffer writes one piece at a time, which releases each old piece before replacing the next. Price the actual largest piece from pool shapes while retaining full original weights, staging, routed activations, retained frontiers and admission copies. This changes allocation lifetimes, not expert bytes or mathematical passes.

Extra write barriers are a performance cost. In the qualified fused MTP path, choose this strategy only for groups beyond 8192 through 16384 rows that at least double the largest batched-write group fitting the current process budget. The existing physical-footprint, live-headroom, queued-request, cancellation and checkpoint guards still select or reject each candidate. Public optimization settings remain immutable; execution controls belong to the current group. This is an operating tradeoff, not a new hardware, memory or arithmetic ceiling.

## Qualification

Final catalogue: 73 groups, 31841 assertions, all pass. Model assertion counts: mtp-equality16-final: 13, plain-equality16: 13, lifecycle: 1914, checkpoint: 25, mtp-vision: 874. A real server restart test forces MTP on in every server launch and checks the ordinary persistent-prefix path. Native Mac build/scripted regressions and the complete static suite pass. Functional and physical-memory checks retain global paging as diagnostics, independently of clean timing eligibility.

The long MTP equality check requires actual grouping beyond 8192 and actual piecewise writes, while comparing raw prompt logits, all retained tensor bytes, teacher-forced continuation, speculative output IDs and chronological compute passes exactly. It exercises 16384 rows and 4878 piecewise writes. Complete process peak including both sequential arms, fingerprinting and continuation is 9.338720528 GB, below 10 GB. Candidate requested reads are 48580300800 bytes; the sequential control requests 1370118758400. Different allocation histories make this an equality/physical-memory check, not a speed comparison.

The followup MTP/image lifecycle explicitly executes piecewise expert writes through cancellation during draft processing, checked read failure, rollback and exact retry. Automatic selection, checkpoints, disk restoration, head alignment, process/live-headroom fallback and image geometry remain covered. At 8.1 GB, forced MTP correctly refuses its additional resident head; normal automatic mode completes with MTP off, within the original target. The fusion-disabled MTP run also completes within its target. See functional-summary.json and each original receipt. No golden, tolerance or memory ceiling was relaxed.

## Paired latency

The same frozen binary compares `SLOTSTREAM_OPT_FUSED_WORKSPACE=0` against the default automatic policy. Both retain fused attention. Configuration: inventory16387, 10 GB target, 640 slots, compute 256, MTP on with two drafts, greedy maximum 16 outputs, fresh processes, sampled physical footprint. Every primary cell actually emitted 11 tokens and finished at its stop token. The M5 Pro / 48 GB machine uses the pinned MLX 0.32.2 backend. Filesystem cache is uncontrolled; no purge. Source, binary, shader, model-header and exact token identities are preserved.

Each cell waits for 120 consecutive nominal, normal-power seconds. Eligibility requires completion, no global swap activity, nominal power/thermal before and after, matching prompt/output IDs, pool, compute geometry and sampling, and physical peak <= 10 GB. Every primary pair has matching inputs, outputs and compute passes. All three matched pairs are eligible. Median paired prefill-time reduction is 65.40%; median paired request-time reduction is 64.53%.

| Round | Control prefill seconds | Automatic prefill seconds | Pair eligibility |
| --- | ---: | ---: | --- |
| 1 | 153.279 | 56.106 | Eligible |
| 2 | 155.217 | 52.859 | Eligible |
| 3 | 155.869 | 53.936 | Eligible |

The generated analysis.json preserves every exclusion, observed read group, requested read byte count, actual peak and drafted-token count. Requested expert bytes are engine requests, not physical SSD traffic. This is a synthetic long-prompt/MTP result, not a universal throughput or cross-hardware claim. The sequential equality diagnostic is separate and must not be substituted for fresh-process timing.

## Limits and remaining opportunities

The result applies to this qualified M5 Pro profile, synthetic 16K prompt, small fixed target and MTP configuration. Do not compound it with the earlier standalone fused-kernel percentage. Other budgets and prompt shapes can choose different groups, and extra barriers do not help when the same group already fits. The first implementation's failed larger-scope assertion and the earlier fixed-group negative write experiments remain preserved.

The primary cells report median prefill I/O time falling from 106.28 to 5.16 seconds, while median total prefill falls from 155.22 to 53.94 seconds. Scatter time increases from 1.32 to 2.85 seconds and reported GPU wait from 7.46 to 14.37 seconds. These counters may overlap and are not a complete additive profile. They support prioritizing remaining model computation and synchronization over expecting another comparable gain from read elimination at this profile. Raw medians and their interpretation are in timing-counters.json.

The 16K key envelope, later-context reservations, full indexer/mask work, expert assembly and main-model compute remain limits on further gains. Broader key ranges and the write-strategy crossover across other prompt/budget profiles need separate measured qualification. Images retain their existing main-workspace policy. At qualification time these were local changes; this record is not a release receipt.

Decision: [[records/decisions/automatic-mtp-prefill-read-policy]]. Raw evidence: [[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-timing]], [[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-correctness]], [[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-v1]], [[sources/runs/2026/09/2026-09-21-mtp-prefill-policy-phase-screen]].
