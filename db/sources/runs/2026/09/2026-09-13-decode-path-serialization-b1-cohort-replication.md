---
type: run
id: 01m2d3eftsc5k5g6w4fbkjtfy5
created: 2026-09-13T10:01:47.097035+00:00
updated: 2026-09-13T10:01:47.717756+00:00
summary: 'Decode serialization step 7 replication: full fresh B1 cohort of the same combined candidate against shipped; aggregate 1.124, lower bound 1.105, 34 of 36 pairs eligible, pass'
binary: ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db (round 3b build)
captured_at: 2026-09-13
command: 'see body: .build/decode-cpu/run-b1-rerun.sh (guards, quiet swap, Tools/decode_cohort.py)'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, step 7 replication: held-out B1 cohort of the combined candidate'
tool: Tools/decode_cohort.py
---
Step 7 replication of the decode-path serialization plan ([[records/plan/decode-path-serialization-2026-09-12]]), registered at 03:05 before it ran: the same B1 cohort of the same combined candidate, run in full into its own directory after the first run ended with insufficient evidence ([[sources/runs/2026/09/2026-09-13-decode-path-serialization-b1-cohort]]). Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Plan and command

Unchanged from the first run: `plan-b1.json` (sha256 `4c41885fe40e0c6cc15333514ceada7a5a6ed1c81ec866edb2625a0d20475b3b`), arms off (shipped, no environment) and on (the combined candidate), the twelve B1 prompts, three rounds, 128 warmup and 512 measured outputs, eligibility `process-pageins-v1` and the same gates. `.build/decode-cpu/run-b1-rerun.sh` refused to start unless the binary and the plan matched the first run and the output directory was new, then waited for ten minutes without host swap-outs (03:02 to 03:12).

    .venv/bin/python Tools/decode_cohort.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --plan .build/decode-cpu/plan-b1.json --out .build/decode-cpu/cohort-b1-rerun

Run 03:12:04 to 05:00 on the round 3b binary (`ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db`).

## Verdict

    aggregate_ratio      1.124
    bootstrap            2.5% 1.105, median 1.114, 97.5% 1.122 (10,000 draws, seed 1729)
    family_floor_ok      true
    duration_ok          true
    evidence_sufficient  true
    success              true

## Families and prompts

| family | tok/s ratio | duration ratio | prompts: ratio (clean pairs) |
| --- | ---: | ---: | --- |
| code | 1.072 | 0.967 | r0062 1.072 (3), r0033 1.068 (3) |
| dialogue | 1.169 | 0.867 | r0296 1.169 (3), r0295 1.169 (3) |
| multilingual | 1.148 | 0.923 | r0244 1.148 (3), r0245 1.124 (3) |
| prose | 1.177 | 0.932 | r0171 1.176 (3), r0173 1.177 (3) |
| reasoning | 1.081 | 0.966 | r0124 1.069 (3), r0125 1.081 (2) |
| structured | 1.104 | 0.982 | r0257 1.104 (3), r0256 1.047 (2) |

Medians over the 34 eligible pairs: 13.48 tok/s on, 11.80 tok/s off. Outputs were identical in all 36 pairs.

## Exclusions

Two pairs, each for host swap-outs during an arm: r0125 round 0 (on arm, 03:43) and r0256 round 0 (off arm, 03:45). Under the older `swap-stable-120s` rule 23 pairs would have been eligible. The host swap-out counter rose from 25,864 to 26,136 during the run. The other application's virtualization process held 8.42 GB at 03:00 and 0.22 GB at 05:00.

## Against the first run

| | first run | replication |
| --- | ---: | ---: |
| aggregate ratio | 1.116 | 1.124 |
| bootstrap 2.5% to 97.5% | 1.073 to 1.129 | 1.105 to 1.122 |
| eligible pairs | 33 | 34 |
| lowest family | 1.037 (reasoning) | 1.072 (code) |
| evidence sufficient | no | yes |
| success | no | yes |

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    e3b2fea454a2a9f2a4d3f80a982187ba7813ff727b08a0c0c314dab5e7370153  cohort-b1-rerun/pairs.jsonl
    45b17aebf2de784b7d7a194c4a2430e1838109b7d06173b084eda7046fb920f8  cohort-b1-rerun/report.json
    a211cc82c022827ce7ae4abc7b4322a908ae360d69ed1c91c45854de9dd97969  cohort-b1-rerun.log
    cb827725ed996585cca1e4e6d6c988d3710679630bc2bc779594bfd013e46607  run-b1-rerun.sh
    4c41885fe40e0c6cc15333514ceada7a5a6ed1c81ec866edb2625a0d20475b3b  plan-b1.json
