---
type: decision
id: 01m1k0a2gfna89hnvcf8rp4z7v
created: 2026-09-03T06:46:41.423595+00:00
updated: 2026-09-03T06:46:41.441284+00:00
summary: 'CLOCK stays the eviction policy: measured against LRU and LFU on a real trace'
decided_on: 2026-09-03
evidence: '[[records/measurements/m1-expert-locality-on-a-real-trace-2026-09-03]]'
reversible_if: a second workload — an agentic trace of many short turns over one prefix is the one not covered — shows a policy beating CLOCK by more than the ~1 point LRU manages here
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