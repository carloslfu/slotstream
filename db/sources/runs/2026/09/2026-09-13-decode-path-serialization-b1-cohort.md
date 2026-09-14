---
type: run
id: 01m2cwc41pxpjekjj0jxaqm2pq
created: 2026-09-13T07:58:09.462307+00:00
updated: 2026-09-13T07:58:09.845398+00:00
summary: 'Decode serialization step 7: held-out B1 cohort of the combined candidate against shipped; aggregate 1.116, lower bound 1.073, 33 of 36 pairs eligible, r0245 short of two clean pairs'
binary: ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db (round 3b build)
captured_at: 2026-09-13
command: 'see body: Tools/decode_cohort.py from .build/decode-cpu/run-combine.sh step 7'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, step 7: held-out B1 cohort of the combined candidate'
tool: Tools/decode_cohort.py
---
Step 7 of the decode-path serialization plan ([[records/plan/decode-path-serialization-2026-09-12]]): the held-out B1 cohort of the combined candidate against the shipped path. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Plan and command

`plan-b1.json` from step 6 ([[sources/runs/2026/09/2026-09-13-decode-path-serialization-combination]]): arm off is the shipped path with no environment; arm on is the combined candidate (the B0 prefetch environment, `SLOTSTREAM_DECODE_BARRIER_LAYERS=4`, `SLOTSTREAM_OPT_ROUTER_WEIGHTS=1`, top 24 and issue cap 32). Both run under the base protocol at draft depth 2, on the twelve B1 prompts registered before rounds 3 to 5 (`b1-prompts.json`, sha256 `cf519d2aee0a7470b8e8a62d9cbb7d93b60f54695ccbf20505716ae6848dfbc5`), three rounds, 128 warmup and 512 measured outputs, eligibility `process-pageins-v1`. Gates: aggregate at least 1.10, bootstrap lower bound above 1.00, family floor 0.95, duration regression at most 5%, at least two clean pairs per prompt.

    .venv/bin/python Tools/decode_cohort.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --plan .build/decode-cpu/plan-b1.json --out .build/decode-cpu/cohort-b1

Run from `.build/decode-cpu/run-combine.sh`, 00:59:52 to 02:53:35, on the round 3b binary (`ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db`), after five minutes without host swap-outs.

## Verdict

    aggregate_ratio      1.116
    bootstrap            2.5% 1.073, median 1.102, 97.5% 1.129 (10,000 draws, seed 1729)
    family_floor_ok      true
    duration_ok          true
    evidence_sufficient  false
    success              false

## Families and prompts

| family | tok/s ratio | duration ratio | prompts: ratio (clean pairs) |
| --- | ---: | ---: | --- |
| code | 1.069 | 0.956 | r0062 1.065 (3), r0033 1.069 (3) |
| dialogue | 1.178 | 0.872 | r0296 1.178 (3), r0295 1.172 (3) |
| multilingual | 1.145 | 0.932 | r0244 1.145 (2), r0245 1.116 (1) |
| prose | 1.169 | 0.945 | r0171 1.169 (3), r0173 1.164 (3) |
| reasoning | 1.037 | 0.978 | r0124 1.029 (3), r0125 1.037 (3) |
| structured | 1.106 | 0.964 | r0256 1.049 (3), r0257 1.106 (3) |

Medians over the 33 eligible pairs: 12.31 tok/s on, 11.24 tok/s off. Outputs were identical in all 36 pairs.

## Exclusions

Three pairs, each for host swap-outs during an arm: r0244 round 0 (on arm, 01:16), r0245 round 0 (off arm, 01:18) and r0245 round 1 (off arm, 01:48). Under the older `swap-stable-120s` rule 18 pairs would have been eligible. The host swap-out counter rose from 11,904 before the cohort to 25,864 after it, and system swap in use from 153.9 MB to 364.1 MB. A `com.apple.Virtualization.VirtualMachine` process belonging to another application, running since about 00:06, held 8.41 GB at 02:55; an earlier instance had held 2.8 GB when round 5's exclusions began. The plan does not allow reruns inside a cohort.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    ac6037fa281b52f3db7c89aaa59a52059dbda32b21c03dde7b306149ee638339  cohort-b1/pairs.jsonl
    02c1f1af4e1123ce31a97ad139cfd8da7a0819003ece23d222c16026e1cb1e05  cohort-b1/report.json
    4c41885fe40e0c6cc15333514ceada7a5a6ed1c81ec866edb2625a0d20475b3b  plan-b1.json
    44b781178ef8b8e557a8ce1429e1325ad36ea2f8677dc1ca85dde4747de26810  cohort-b1.log
