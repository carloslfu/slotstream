---
type: measurement
id: 01m33767tsvxmbfh7mqcx7v6gq
created: 2026-09-22T00:10:28.569421+00:00
updated: 2026-09-22T05:41:23.380035+00:00
summary: 'Remaining long-prompt opportunities: tested gains and rejected alternatives'
date: 2026-09-21
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1613'
runs: '[[sources/runs/2026/09/2026-09-21-prefill-opportunities-performance]], [[sources/runs/2026/09/2026-09-21-prefill-opportunities-excluded]], [[sources/runs/2026/09/2026-09-21-prefill-opportunities-components]], [[sources/runs/2026/09/2026-09-21-prefill-opportunities-correctness]]'
title: 'Remaining long-prompt opportunities: tested gains and rejected alternatives'
status: measured
---
Historical experiment and original verdict, preserved unchanged below. The later user-directed automatic policy is recorded in [[records/measurements/automatic-prefill-policy-2026-09-21]] and [[records/decisions/automatic-prefill-read-policy]]; its adoption does not upgrade this preliminary speed result.

The remaining listed opportunities have executable tests and preserved negative results. The strongest candidate is the combination of larger expert-read groups and fused-aware workspace accounting. It remains opt-in: the bounded five-round study produced only one clean baseline/combined pair, short of the prespecified three. The existing upstream fused-attention default from [[records/measurements/fused-prefill-integration-2026-09-21]] remains unchanged.

## Results and decisions

| Opportunity | Observed result | Decision |
| --- | --- | --- |
| Fused workspace accounting plus larger read groups | One eligible 16K pair: 137.63 to 80.27 s, 41.67% less prefill; all five combined observations improve, but four pairs are excluded | Keep bounded opt-in prototype; no qualified new default |
| Larger groups alone | Two eligible pairs disagree; slow outlier retained | No independent promotion |
| Accounting alone with original group cap | Read reduction in a screen; no clean paired speed qualification | Retain only as part of the opt-in combination |
| Clear cached buffers before admission | Same expert-read count; no repeatable demonstrated gain | Remove prototype/control |
| 512/1024-token compute | Fixed-pool screens are slower and read more; 1024 physically fits despite planner refusal | Retain existing compute defaults |
| Scalar selected attention | About 0.28 times fused throughput on actual captured inputs | Reject |
| GPU union/gather compaction, four query-group sizes | Every case slower; best about 33% slower | Reject |
| GDN and expert-transfer attribution | Separate fixed-forward probes plus primary stage counters | Diagnostic evidence only; no unsupported kernel speed claim |

The main study is this M5 Pro / 48 GB Mac, 10 GB engine target, 961 slots, inventory16387, compute256, MTP off and one greedy output. Filesystem cache is uncontrolled. Physical peak in combined primary cells stays below 8.54 GB. Requested expert bytes fall from about 1.239 TB to 356 GB while computation stays chronological. Requested bytes are not SSD device bytes. The result is first-prefill latency, not complete-answer latency. It must not be compounded with the earlier 8K 5.22% integration result.

## Qualification and implementation boundaries

`SLOTSTREAM_OPT_AUTO_SCOPE_LIMIT=16384` permits larger automatic expert-read groups; `8192` or an absent control preserves the established maximum. It does not increase compute rows, bypass a checkpoint or grant memory. CPU retains the original maximum. Public preexisting scheduling signatures retain their behavior; optional Swift settings remain decodable when absent from older serialized objects.

`SLOTSTREAM_OPT_FUSED_WORKSPACE=1` removes only full per-head score/probability reservations for the supported fused BF16 text path: 256 query rows, at most 16384 keys, MTP off and no selected-attention/terminal/small-query fallback. Images, CPU, other dtypes, larger contexts and fallback paths retain original accounting. The linear activation floor, indexer/mask allowance, copies, expert workspace, query-by-key envelope, actual process footprint, live headroom and reservation ownership remain. Both controls default off/absent. The experiment does not change the planner's general resident-pool or compute defaults.

The actual 16K read envelope passes exact logits, all state bytes and continuation at a bounded diagnostic pool. The catalogue and corrected lifecycle, deployed cache/disk, MTP and synthetic-image rollback checks pass. Initial test-adaptation failures and their source-level explanations remain in the raw evidence. No golden or tolerance is changed. Timing uses frozen V2; the retained implementation narrows its eligibility and has separate correctness/source identities.

## What remains in the way

1. Performance qualification needs a stable host interval with at least three clean paired measurements. The five-round cap was reached; small swap-in counts are not waived and outliers are not removed. This study stops without promoting a new default.
2. Expert rereads are the dominant demonstrated opportunity. Even the combined primary arm still requests roughly 356 GB; its recorded I/O time is roughly 26 to 28 seconds. Actual memory admission can shrink later groups, especially with MTP. The conservative full-layer expert workspace and decode-pool residency still compete for space. Rebalancing that memory is a further experiment, not a proven gain here.
3. More compute rows are not automatically faster. In the matched floor-pool screens, larger passes lose read sharing and increase requested bytes. One larger-pass output changes; numerical/task qualification would be required even if a later configuration becomes faster.
4. These masks are sparse by query but dense across matrix tiles. Avoiding enough work without expensive gathers or losing matrix-unit throughput is the unsolved part. The tested scalar and compaction prototypes do not solve it.
5. Remaining dense/MoE/GDN work and synchronization require attribution under the actual long-prompt candidate before assigning another whole-request speed percentage. Fixed-forward profile numbers do not provide that attribution.

Raw runs: [[sources/runs/2026/09/2026-09-21-prefill-opportunities-performance]], [[sources/runs/2026/09/2026-09-21-prefill-opportunities-excluded]], [[sources/runs/2026/09/2026-09-21-prefill-opportunities-components]], [[sources/runs/2026/09/2026-09-21-prefill-opportunities-correctness]]. Decision: [[records/decisions/prefill-opportunities-remain-experimental]].
