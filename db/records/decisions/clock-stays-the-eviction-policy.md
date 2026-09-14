---
type: decision
id: 01m1k0a2gfna89hnvcf8rp4z7v
created: 2026-09-03T06:46:41.423595+00:00
updated: 2026-09-12T09:05:17.515371+00:00
summary: 'CLOCK stays the eviction policy: measured against LRU and LFU on a real trace'
decided_on: 2026-09-03
evidence: '[[records/measurements/m1-expert-locality-on-a-real-trace-2026-09-03]], [[records/measurements/expert-lookahead-2-router-reuse-prefetch-native-screens-2026-09-12]]'
reversible_if: a policy that reaches at most 0.85x native misses in the exact batch-pin replay with constants selected on training requests, replays 100% in the twin natively, keeps outputs exact and shows a measured native gain; the literal one-point condition was met offline by segmented LRU on 2026-09-12 and judged insufficient
title: 'CLOCK stays the eviction policy: measured against LRU and LFU on a real trace'
status: standing
---
M1 asked which eviction policy to ship and was never answered on real data. On a
220-step decode trace at 30 experts per layer, CLOCK measured 0.557 against LRU
0.568, LFU-decay 0.480, and an offline hot-set upper bound of 0.603. CLOCK is
within a point of the best implementable policy and well ahead of LFU, so it
stays and M1's policy question is closed. The trace also fixes the compulsory-miss
ceiling for that workload at 0.906 and shows 10% of records serving 71% of
accesses, which says the remaining lever is capacity and a warm start (a
persisted hot set across processes), not the policy.

**Addendum (2026-09-12): the literal reversal condition was met offline and the decision is confirmed with a stricter one.** The Expert Lookahead 2 replacement lab ([[records/measurements/expert-lookahead-2-router-reuse-prefetch-native-screens-2026-09-12]], raw run [[sources/runs/2026/09/2026-09-11-expert-lookahead-2-offline-lab]]) replayed eight policies with the store's exact batch-pin semantics on a second workload, the 69-request pilot corpus at 4,255 slots. Segmented LRU beat CLOCK by 2.3 hit-rate points (0.716 against 0.693, misses 0.924x), more than the one point named above, and Belady's optimum sits at 0.848. The plan that ran the lab had set a stricter bar before the shipped policy changes, at most 0.85x native misses with train-selected constants, and no implementable policy or the learned evictor (0.966x) reached it; the read-cost model projects only 1.023x decode throughput for segmented LRU, under the noise of a native screen. CLOCK therefore stays. The condition that reverses this decision from now on is a policy that reaches at most 0.85x native misses in the exact replay with constants selected on training requests, replays 100% in the twin natively, keeps outputs exact and shows a measured native gain; the many-short-turns agentic workload named above remains unmeasured.
