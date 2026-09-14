---
type: run
id: 01m2dehsbywj980tfhc8ded4wf
created: 2026-09-13T13:15:49.502001+00:00
updated: 2026-09-13T13:16:10.486451+00:00
summary: 'Held-out cohort rescoring with true medians: B1 replication 1.124 to 1.114, B1 first run 1.116 to 1.106, B0 1.120 to 1.105; every verdict unchanged'
binary: 'not applicable: recorded pairs rescored, no model process'
captured_at: 2026-09-13
command: 'see body: report() over each cohort''s recorded pairs.jsonl'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Held-out cohort rescoring with true medians
tool: Tools/expert_lookahead_bench.py (report v2)
---
Rescoring of three registered held-out cohorts after the cohort report was found to take the upper of the two middle values whenever it formed a median over an even count (report v1 in `Tools/expert_lookahead_bench.py`). With two prompts per family, v1's family ratio was the faster prompt's median, and a prompt with two clean pairs used its faster pair. The registered bootstrap resampled the geometric mean of prompt medians instead, which is why the B1 replication's point estimate, 1.124, sat above its own 97.5% bound, 1.122. Nothing was rerun: each cohort's recorded `pairs.jsonl` was copied byte for byte and scored again. Artifacts live under `.build/decode-ship/` (ignored by git). Nothing was installed, published or committed.

## Change

Report v2 takes true medians, the mean of the two middle values for an even count, for each prompt and for absolute tok/s. A family is the geometric mean of its prompt medians, the statistic the registered bootstrap already resamples, so the point estimate equals that bootstrap's value on the observed data; the bootstrap's own median is a true median too. Gates, draws (10,000) and seed (1729) are unchanged. `Tools/decode_sweep.py` and `Tools/decode_summary.py` had the same shortcut in descriptive medians and were fixed alongside; the paired geometric means those sweeps report were never affected.

Each cohort was scored with `report()` from the patched module:

    protocol .build/expert-lookahead/xla2-20260911/protocol.json
    b1-rerun  pairs .build/decode-cpu/cohort-b1-rerun/pairs.jsonl, plan .build/decode-cpu/plan-b1.json
    b1-first  pairs .build/decode-cpu/cohort-b1/pairs.jsonl, plan .build/decode-cpu/plan-b1.json
    b0        pairs .build/expert-lookahead/xla2-20260911/w9/b0-plan-b0-slot-s2thr-l16/pairs.jsonl,
              plan .build/expert-lookahead/xla2-20260911/w9/plan-b0-slot-s2thr-l16/plan-b0.json
    out       .build/decode-ship/rescore-{b1-rerun,b1-first,b0}/report.json

## Results

| cohort | v1 aggregate | v2 aggregate | v2 bootstrap 2.5% to 97.5% | lowest family, v2 | verdict |
| --- | ---: | ---: | --- | ---: | --- |
| B1 replication, decode serialization combined candidate | 1.124 | 1.114 | 1.104 to 1.121 | 1.064, reasoning | pass, unchanged |
| B1 first run, same candidate | 1.116 | 1.106 | 1.073 to 1.128 | 1.033, reasoning | evidence insufficient, unchanged |
| B0, Expert Lookahead 2 slot adoption | 1.120 | 1.105 | 1.090 to 1.115 | 1.065, structured | pass, unchanged |

Median decode throughput over eligible pairs, v2: B1 replication 11.79 to 13.47 tok/s; B1 first run 11.24 to 12.31; B0 12.20 to 13.50.

### B1 replication, v2

| family | tok/s ratio | duration ratio | prompts: ratio (clean pairs) |
| --- | ---: | ---: | --- |
| prose | 1.176 | 0.923 | r0171 1.176 (3), r0173 1.177 (3) |
| dialogue | 1.169 | 0.865 | r0296 1.169 (3), r0295 1.169 (3) |
| multilingual | 1.136 | 0.914 | r0244 1.148 (3), r0245 1.124 (3) |
| structured | 1.075 | 0.953 | r0257 1.104 (3), r0256 1.046 (2) |
| code | 1.070 | 0.956 | r0062 1.072 (3), r0033 1.068 (3) |
| reasoning | 1.064 | 0.943 | r0124 1.069 (3), r0125 1.059 (2) |

### B1 first run, v2

| family | tok/s ratio | duration ratio | prompts: ratio (clean pairs) |
| --- | ---: | ---: | --- |
| dialogue | 1.175 | 0.862 | r0296 1.178 (3), r0295 1.172 (3) |
| prose | 1.167 | 0.928 | r0171 1.169 (3), r0173 1.164 (3) |
| multilingual | 1.124 | 0.918 | r0244 1.131 (2), r0245 1.116 (1) |
| structured | 1.077 | 0.949 | r0256 1.049 (3), r0257 1.106 (3) |
| code | 1.067 | 0.950 | r0062 1.065 (3), r0033 1.069 (3) |
| reasoning | 1.033 | 0.972 | r0124 1.029 (3), r0125 1.037 (3) |

### B0, v2

| family | tok/s ratio | duration ratio | prompts: ratio (clean pairs) |
| --- | ---: | ---: | --- |
| dialogue | 1.142 | 0.885 | r0296 1.146 (3), r0295 1.138 (3) |
| prose | 1.130 | 0.904 | r0206 1.141 (3), r0205 1.119 (3) |
| multilingual | 1.126 | 0.918 | r0244 1.136 (3), r0245 1.117 (3) |
| reasoning | 1.086 | 0.925 | r0096 1.078 (3), r0099 1.094 (3) |
| code | 1.083 | 0.931 | r0005 1.108 (3), r0062 1.059 (3) |
| structured | 1.065 | 0.956 | r0256 1.037 (3), r0257 1.093 (3) |

## Artifacts (sha256)

Paths relative to `.build/decode-ship/`; each `pairs.jsonl` copy matches its source file byte for byte.

    90385e0835317b10111b4fd27251834f5da2a56c67aa7ab8957b4e87235e431e  rescore-b1-rerun/report.json
    e3b2fea454a2a9f2a4d3f80a982187ba7813ff727b08a0c0c314dab5e7370153  rescore-b1-rerun/pairs.jsonl
    ce5876b0e3a8485a09854bc1376cfebb1a5aa8f329ab25bf5f8f585f7f000277  rescore-b1-first/report.json
    ac6037fa281b52f3db7c89aaa59a52059dbda32b21c03dde7b306149ee638339  rescore-b1-first/pairs.jsonl
    e2303b8245070b3b1e6151833bbf7b42e126b07cf69e58037baa76fe7b0fdd81  rescore-b0/report.json
    9a372e18ef821298c62277f409d2da65c567382892c1863b2c04f0c3ce7d8e3a  rescore-b0/pairs.jsonl

Tool versions used, repository paths:

    1310ebd73d0cc59b5fe4333ef7b85acced3c4f72e190cb7f8f335c0ee6e9dfc0  Tools/expert_lookahead_bench.py
    8e3a64234970107535c582d3ea73a1bcce8b0cd441cb48c68ad17da1e53bebd5  Tools/decode_sweep.py
    19d0ecee25182b637995354402238876807591e598f6c547cf1bf4a455d97882  Tools/decode_summary.py
