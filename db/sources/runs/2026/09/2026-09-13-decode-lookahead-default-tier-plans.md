---
type: run
id: 01m2dgjp7xqxnbgsg9mfy8650m
created: 2026-09-13T13:51:16.221312+00:00
updated: 2026-09-13T13:51:16.221312+00:00
summary: '0.2.16 defaults qualified without weights: 50 of 50 checks, 73 of 73 planner gates, static gates; doctor plans from 8 to 192 GB at both context windows'
binary: 2753f02a295794b540f685a2ef23dec343b343e81958f8b9b524418ad11c98d2 (0.2.16 build; plans and static gates on a83f91cd, the same source before the version bump)
captured_at: 2026-09-13
command: 'see body: make build, slotstream-checks --tier t0 --tier t1, Tools/planner_gates.sh, Tools/static_gates.sh, doctor --sim-ram N --max-context W --json'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode lookahead default: checks and plans by Mac memory'
tool: Tools/planner_gates.sh, slotstream-checks, slotstream doctor
---
Implementation and weights-free qualification of the 0.2.16 defaults: the qualified decode lookahead rides the draft head, and the head's automatic floor is 76 experts per layer ([[records/decisions/decode-lookahead-default-with-the-draft-head]], [[records/decisions/draft-head-auto-floor-76-per-layer]]). Artifacts live under `.build/decode-ship/` (ignored by git). No model was loaded.

## Builds

    SLOTSTREAM_BUILD_JOBS=2 make build

Three builds of the candidate while two checks were corrected; the third, `a83f91cdd6697a3ae0d3c8b779af80f5def7a0c0500ba1be7a4146ed1aa20f18`, produced the plans and passed the static gates. A fourth build after the version bump to 0.2.16, `2753f02a295794b540f685a2ef23dec343b343e81958f8b9b524418ad11c98d2`, changes only `Sources/Slotstream/Version.swift`; the checks and planner gates were rerun on it.

## Checks

    .build/release/slotstream-checks --tier t0 --tier t1
    Tools/planner_gates.sh
    Tools/static_gates.sh

- First build: 48 of 50 checks passed. `configurable-context` failed because its governor fixture did not credit the lookahead reserve the running engine owns; the fixture now passes the plan's decision and bytes, as the real governor does. `decode-lookahead-defaults` expected the head at a 20 GB target, which the default prefix cache keeps below the floor; the check now uses 22 GB.
- Second build: 49 of 50. An experimental reserve is charged before the head's floor is tested, so the check now forces the head as the bench does.
- Third build: 50 of 50 checks, 29,987 assertions, including `decode-lookahead-defaults` (32 assertions). Planner gates 71 passed, 0 failed, after the first run of the updated gates failed four checks that had assumed a 20 GB target. Static gates passed: 304 weights-free cases, installer gates, `STATIC GATES PASS`.
- Fourth build (0.2.16): 50 of 50 checks, 29,987 assertions. Planner gates 73 passed, 0 failed, adding two for the context recommendations: a 32 GB Mac at 65,536 tokens runs without the head, and a 36 GB Mac at 65,536 tokens keeps the head and the lookahead.

The planner gates cover the head and lookahead at a 22 GB target, a 32 GB Mac with both, a 24 GB Mac with neither, `SLOTSTREAM_OPT_EXPERT_PREFETCH=0` keeping the head alone, the charge in the JSON ledger, and a head forced below the floor without the lookahead.

## Floor target

`doctor --sim-ram 137.4 --memory-gb N --json` with the draft head available:

| target | experts per layer | head | lookahead |
| --- | ---: | --- | --- |
| 20.5 GB | 78 | off | off |
| 21 GB | 76 | on | on |
| 21.5 GB | 80 | on | on |

The listed experts per layer are after every charge; the head's decision uses the cache after the head's charge alone.

## Plans by Mac memory

`doctor --sim-ram <RAM> --max-context <window> --json` for each size on the third build, pristine what-if (availability not constraining, working set 75% of RAM). Estimates are the planner's plain warm-decode curve; waits are for a prompt filling the window.

| RAM | window | target | experts per layer | head | lookahead | plain estimate | full-window wait |
| --- | ---: | ---: | ---: | --- | --- | ---: | ---: |
| 8 GB | 32,768 | refused | | | | | |
| 8 GB | 65,536 | refused | | | | | |
| 16 GB | 32,768 | 10 GB | 20 | off | off | 4.00 | 6.4 min |
| 16 GB | 65,536 | 10 GB | 13 | off | off | 2.67 | 12.9 min |
| 18 GB | 32,768 | 11.5 GB | 28 | off | off | 5.54 | 4.4 min |
| 18 GB | 65,536 | 11.5 GB | 18 | off | off | 3.58 | 12.9 min |
| 24 GB | 32,768 | 16 GB | 54 | off | off | 7.61 | 3.3 min |
| 24 GB | 65,536 | 16 GB | 41 | off | off | 6.81 | 7.8 min |
| 32 GB | 32,768 | 22 GB | 74 | on | on | 8.68 | 3.1 min |
| 32 GB | 65,536 | 22 GB | 82 | off | off | 9.04 | 7.8 min |
| 36 GB | 32,768 | 25 GB | 96 | on | on | 9.68 | 3.1 min |
| 36 GB | 65,536 | 25 GB | 77 | on | on | 8.85 | 7.5 min |
| 40 GB | 32,768 | 28 GB | 119 | on | on | 10.55 | 3.1 min |
| 40 GB | 65,536 | 28 GB | 98 | on | on | 9.73 | 7.5 min |
| 48 GB | 32,768 | 33.6 GB | 161 | on | on | 11.60 | 3.1 min |
| 48 GB | 65,536 | 33.6 GB | 140 | on | on | 11.26 | 7.5 min |
| 64 GB | 32,768 | 34.6 GB | 149 | on | on | 11.56 | 3.0 min |
| 64 GB | 65,536 | 34.8 GB | 148 | on | on | 11.55 | 7.5 min |
| 96 GB | 32,768 | 34.6 GB | 149 | on | on | 11.56 | 3.0 min |
| 96 GB | 65,536 | 34.8 GB | 148 | on | on | 11.55 | 7.5 min |
| 128 GB | 32,768 | 34.6 GB | 149 | on | on | 11.56 | 3.0 min |
| 128 GB | 65,536 | 34.8 GB | 148 | on | on | 11.55 | 7.5 min |
| 192 GB | 32,768 | 34.6 GB | 149 | on | on | 11.56 | 3.0 min |
| 192 GB | 65,536 | 34.8 GB | 148 | on | on | 11.55 | 7.5 min |

The 8 GB refusal is `insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom`, the same refusal the existing 8 GB planner gate asserts; an explicit `--memory-gb 8.1` and a what-if with the whole 8 GB as working set are refused too. Per-layer cache is not monotone in RAM because the prefill pass and prefix retention step with the budget (48 GB holds 161 per layer, 64 GB 149). The 40 GB row is a simulation point, not a common Mac size, and is left out of the public tables.

## Artifacts (sha256)

Paths relative to `.build/decode-ship/`:

    faefccd12fa44d60031e1acd96ddbe49b8d942e5566e7fb5e72768cb5ba49076  tier-plans/doctor-*.json, concatenated in sorted order
    0eabbb3f17b0a38989ce1fe7d27da3cf5d87948a6612ae8775ed76493e1d97a5  tier-plans/summary.json
    checks-t0t1-3.log, planner-gates-2.log, static-gates.log, build3.log (third build)
    checks-t0t1-4.log, planner-gates-3.log, build4.log (fourth build)
