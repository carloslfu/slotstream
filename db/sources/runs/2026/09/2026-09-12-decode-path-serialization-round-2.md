---
type: run
id: 01m2c7bf74yhhdsdt5cmreqxgn
created: 2026-09-13T01:50:48.036642+00:00
updated: 2026-09-13T01:51:39.943125+00:00
summary: 'Decode serialization round 2: prefetch coverage sweep, 42 cells on the round 1 binary; deeper lists inert under the margin threshold; stride 1, union and no threshold slower'
binary: 269b2da3cd1a3515167bb17673cb0dc76d828e8175977a61000e0a342fa9ed7e (round 1 build, unchanged)
captured_at: 2026-09-12
command: 'see body: Tools/decode_sweep.py from .build/decode-cpu/run-resume.sh'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, round 2: prefetch coverage depth, strides and threshold'
tool: Tools/decode_sweep.py, Tools/decode_summary.py
---
Round 2 of the decode-path serialization line ([[records/plan/decode-path-serialization-2026-09-12]]): prefetch coverage around the B0 setting. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Setup

The round 1 build, unchanged ([[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-1]]); every arm records executable sha256 `269b2da3cd1a3515167bb17673cb0dc76d828e8175977a61000e0a342fa9ed7e`. Every configuration keeps the B0 prefetch environment (router policy, record cap 32, 16 lanes, slot adoption with a 64-slot cap, window 4, GPU forecasts, no memo layers, 128 MiB reserve) and varies only these:

| configuration | top | strides | issue cap per target | margin threshold |
| --- | ---: | --- | ---: | ---: |
| c10-s2 (reference, B0) | 10 | 2 | 16 | 0.062 |
| c16-s2 | 16 | 2 | 24 | 0.062 |
| c24-s2 | 24 | 2 | 32 | 0.062 |
| c32-s2 | 32 | 2 | 48 | 0.062 |
| c24-s1 | 24 | 1 | 32 | 0.062 |
| c16-s12 | 16 | 1 and 2 | 24 | 0.062 |
| c24-nothr | 24 | 2 | 32 | -1000 (off) |

## Command

From `.build/decode-cpu/run-resume.sh`:

    .venv/bin/python Tools/decode_sweep.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --out .build/decode-cpu/sweep-coverage --configs .build/decode-cpu/configs-coverage.json \
      --requests r0005,r0206,r0096 --rounds 2 --max-tokens 256 --reference c10-s2

Prompts r0005 (code), r0206 (prose) and r0096 (reasoning); 128 warmup and 256 measured outputs; configuration order rotated per cell; eligibility `process-pageins-v1`; ratios paired per (request, round) and summarized as geometric means.

## Interruption

Ten cells completed before the host shutdown at 18:44 recorded in round 1. The sweep resumed from its saved cells at 19:56, after a 180 s settle to load averages 2.44, 3.78 and 3.28, and finished at 20:40 with 42 cells.

## Report

`sweep-coverage/report.json`, reference c10-s2 (medians across cells; ratios paired):

    config         tps   ratio  clean  accept tok/pass   records  exact
    c32-s2       13.91   1.022   6/6    0.699     2.40     15654    yes
    c24-s2       13.82   1.015   6/6    0.699     2.40     15661    yes
    c10-s2       13.85   1.000   6/6    0.699     2.40     15695    yes
    c16-s12      13.51   0.991   6/6    0.699     2.40     10366    yes
    c16-s2       13.81   0.991   6/6    0.699     2.40     15656    yes
    c24-s1       13.39   0.969   6/6    0.699     2.40     12455    yes
    c24-nothr     7.39   0.555   5/6    0.672     2.35      7098    yes

Paired detail:

| configuration | paired ratio | pairs | above 1 | range |
| --- | ---: | ---: | ---: | --- |
| c32-s2 | 1.022 | 6 | 4 | 0.985 to 1.085 |
| c24-s2 | 1.015 | 6 | 5 | 0.998 to 1.033 |
| c16-s2 | 0.991 | 6 | 4 | 0.848 to 1.058 |
| c16-s12 | 0.991 | 6 | 1 | 0.969 to 1.051 |
| c24-s1 | 0.969 | 6 | 3 | 0.835 to 1.026 |
| c24-nothr | 0.555 | 5 | 0 | 0.535 to 0.587 |

Excluded cell: c24-nothr, r0096, round 1, `host swap-outs during the arm`. Afterwards system swap held 0.25 MB of 1,024 MB, reclaimable memory was 18.3 GB, and every configuration's peak footprint was 18.8 GB.

## Prefetch counters

Medians per configuration of `measured.stats.expertPrefetch` over all arms:

| counter | c10-s2 | c16-s2 | c24-s2 | c32-s2 | c24-s1 | c16-s12 | c24-nothr |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| candidates | 28,598 | 28,598 | 28,601 | 28,602 | 24,670 | 38,408 | 130,200 |
| issued | 28,384 | 28,597 | 28,601 | 28,602 | 24,670 | 38,360 | 120,301 |
| adopted | 13,710 | 13,826 | 13,826 | 13,828 | 16,806 | 19,223 | 21,418 |
| promoted | 189 | 138 | 184 | 152 | 16,126 | 5,169 | 14,032 |
| expired | 11,674 | 11,694 | 11,694 | 11,694 | 5,730 | 14,852 | 51,288 |
| cancelled | 4 | 7 | 10 | 10 | 326 | 387 | 26,032 |
| demandMisses | 14,276 | 14,244 | 14,248 | 14,243 | 10,820 | 8,971 | 5,752 |
| wastedBytes (GB) | 32.3 | 32.3 | 32.3 | 32.3 | 16.1 | 41.9 | 271.6 |
| deferredLaneAcquisitions | 38,261 | 39,234 | 39,336 | 39,350 | 6,986 | 51,255 | 1,007,234 |
| joinSeconds + adoptSeconds | 0.02 | 0.01 | 0.02 | 0.01 | 2.59 | 2.10 | 7.27 |
| layersComplete | 134 | 133 | 133 | 134 | 136 | 134 | 126 |
| layersWithMisses | 4,522 | 4,523 | 4,523 | 4,522 | 4,520 | 4,521 | 4,530 |

`slotRefusals` and `capRefusals` were 842 for c24-nothr and zero elsewhere; `dirtyRescans` were 3,636 for c16-s12 and zero elsewhere.

The deeper lists at stride 2 match the reference because `finishRouterForecast` in `Sources/Slotstream/Model.swift` measures each candidate's margin against its row's tenth logit (`topVal[tenth]` with `tenth = topK - 1`), and the scheduler skips a candidate whose margin is below the threshold (`margins[i] < configuration.threshold` in `Sources/Slotstream/ExpertPrefetch.swift`). From the tenth rank down every margin is zero or negative, so a positive threshold removes all of them whatever the top.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    d9adeceb9707b597d67dc785d9ce0c54e79d727ff947fbdb959f2fdc1010d5e3  sweep-coverage/cells.jsonl
    739b2138f83f97a6c6342016e660610c3be646441ccfd50b2f786e94b2b43dbe  sweep-coverage/report.json
    bc6245612b8b981892c23210d6e84b938dd20dd37a225f748dc6ac5e81d28b6e  configs-coverage.json
