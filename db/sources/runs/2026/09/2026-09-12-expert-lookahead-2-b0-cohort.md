---
type: run
id: 01m2c4mcf5rcdnz9r75bw4k2r1
created: 2026-09-13T01:03:14.405495+00:00
updated: 2026-09-13T01:05:06.384477+00:00
summary: 'Held-out B0 cohort of the slot-adoption prefetch: 36 of 36 pairs eligible, aggregate 1.120x, lower bound 1.090, every family faster; report, counters and hashes'
binary: 2fe928ffa7500faa8e4f250ee874aace8c1ee620a877c924467d5bbab48a41df (candidate 7, scratch path)
captured_at: 2026-09-12
command: .venv/bin/python Tools/expert_lookahead.py bench --protocol .build/expert-lookahead/xla2-20260911/protocol.json --plan .build/expert-lookahead/xla2-20260911/w9/plan-b0-slot-s2thr-l16/plan-b0.json --out .build/expert-lookahead/xla2-20260911/w9/b0-plan-b0-slot-s2thr-l16
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Expert Lookahead 2, slot adoption: held-out B0 cohort, 36 pairs'
tool: Tools/expert_lookahead.py bench (report from Tools/expert_lookahead_bench.py)
---
Held-out B0 cohort for Expert Lookahead 2 with slot adoption, run after the host restart by `.build/expert-lookahead/xla2-20260911/w9/run-after-reboot.sh` on candidate 7 (the scratch-path binary), protocol `xla2-20260911`, 20 GB profile, the approved `process-pageins-v1` eligibility rule. Artifacts live under `.build/expert-lookahead/xla2-20260911/w9/` (ignored by git). Nothing was installed, published or committed.

## Sequence

1. Identity: the release binary hashed `2fe928ffa7500faa8e4f250ee874aace8c1ee620a877c924467d5bbab48a41df`, equal to the protocol candidate.
2. T0 catalogue (`slotstream expert-lookahead-check`): 138 PASS lines.
3. Exactness parity of candidate 7 at the screen setting (stride 2, top 10, issue cap 16, threshold 0.062, cap 32, 16 lanes, adoption slot, slot cap 64) against the diagnostic shadow capture: `PARITY PASS: exact output IDs, router digests and finish reasons on 6 requests`.
4. One-round pilot on `w9/pilot-slot-s2thr-l16/plan-b1-pilot.json`: aggregate 1.124, 2 of 3 pairs eligible (r0012 excluded for host swap-outs during an arm), prose 1.159 and reasoning 1.090; evidence insufficient by construction at one round.
5. B0 cohort, started at 12:19 and finished shortly after 14:00:

    .venv/bin/python Tools/expert_lookahead.py bench \
      --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --plan .build/expert-lookahead/xla2-20260911/w9/plan-b0-slot-s2thr-l16/plan-b0.json \
      --out .build/expert-lookahead/xla2-20260911/w9/b0-plan-b0-slot-s2thr-l16

Plan: six sealed families with two frozen prompts each (code r0005 and r0062, dialogue r0296 and r0295, multilingual r0244 and r0245, prose r0206 and r0205, reasoning r0096 and r0099, structured r0256 and r0257), three rounds, 128 warmup and 512 measured outputs, alternating arm order. Arm `off` carries no prefetch environment. Arm `on` sets `SLOTSTREAM_OPT_EXPERT_PREFETCH=1` and the `SLOTSTREAM_EXPERT_PREFETCH_*` controls POLICY=router, STRIDES=2, TOP=10, ISSUE_CAP=16, THRESHOLD=0.062, CAP=32, LANES=16, ADOPT=slot, SLOT_CAP=64, DEVICE=gpu, MEMO_LAYERS=0 and WINDOW=4, plus `SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB=128` (exact values in plan-b0.json).

## Report (report.json)

    schema = expert-lookahead-bench-report-v1
    pairs = 36, eligible = 36, excluded = []
    rule = process-pageins-v1, pagein_threshold_pages = 4096
    verdict_counts = {"process-pageins-v1": 36, "swap-stable-120s": 28}
    aggregate_tps_ratio = 1.119623593468588
    bootstrap = {"draws": 10000, "median": 1.102869765412128, "p2_5": 1.0899940908837071, "p97_5": 1.1150496547846658, "seed": 1729}
    gates = {"aggregate_ratio": 1.1, "duration_regression": 0.05, "family_floor": 0.95, "lower_bound": 1.0, "min_clean_pairs_per_prompt": 2}
    verdict: aggregate_ratio 1.1196, lower_bound 1.0900, upper_bound 1.1150, family_floor_ok true, duration_ok true, evidence_sufficient true, success true

| family | median tps ratio | median request duration ratio |
| --- | ---: | ---: |
| code | 1.108 | 0.953 |
| dialogue | 1.146 | 0.890 |
| multilingual | 1.136 | 0.923 |
| prose | 1.141 | 0.919 |
| reasoning | 1.094 | 0.930 |
| structured | 1.093 | 0.976 |

Median decode throughput over the 36 eligible pairs: off 12.24 tok/s, on 13.59 tok/s. Host load average when the report was written: 2.13, 2.46 and 2.80.

## Engine counters (pairs.jsonl, 36 eligible pairs)

- Demand records, median per request: off 59,390, on 31,462 (-47.0%).
- Demand read bytes, median per request: off 164.2 GB, on 87.0 GB.
- Expert hit rate, median: off 0.6818, on 0.6797.
- Draft acceptance on the `on` arm, mean over pairs: 0.741.
- Prefetch totals over the `on` arms: 1,512,496 issued and slot reservations, 843,060 adopted (precision 0.557), 668,920 expired, 28,679 promoted, 0 cap refusals, 0 slot refusals, 853,886 demand misses.

Every arm completed; a stalled arm makes its pair ineligible, and none was.

## Artifacts (sha256)

Paths relative to `.build/expert-lookahead/xla2-20260911/`:

    2a29a6403ac688adbb05312288f170841d19177cfd17bd40b50a6b3ca9a73b83  w9/b0-plan-b0-slot-s2thr-l16/report.json
    9a372e18ef821298c62277f409d2da65c567382892c1863b2c04f0c3ce7d8e3a  w9/b0-plan-b0-slot-s2thr-l16/pairs.jsonl
    df6334ab6c1843985b996f56e1de8186ff972cd316bbbbd3d8898da5a76e2fa9  w9/plan-b0-slot-s2thr-l16/plan-b0.json
    92b768b51d7fd2703a17fc48b3e7c68dd204d4651c65e388cd3a180d6935baf5  protocol.json

Candidate 7 binary `2fe928ffa7500faa8e4f250ee874aace8c1ee620a877c924467d5bbab48a41df`; a copy is kept at `.build/decode-cpu/candidate7/`.
