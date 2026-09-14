---
type: run
id: 01m2cam9qr3jyadnb4ce5648ee
created: 2026-09-13T02:48:03.063792+00:00
updated: 2026-09-13T02:48:03.840603+00:00
summary: 'Decode serialization round 3: forecasts consumed at a deferred barrier under prefetch; 150 checks, exact parity at K=3, 42-cell sweep; every deferred configuration slower'
binary: f834ce6f245084989dff83db6c988e496c0ce68969baaee1815cce927ed96433 (deferred forecast consumption)
captured_at: 2026-09-12
command: 'see body: .build/decode-cpu/run-round3.sh (build, T0 checks, parity capture, sweep)'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, round 3: deferred barrier with forecasts held to the barrier, under prefetch'
tool: Tools/decode_sweep.py, Tools/expert_lookahead.py (capture, parity), macOS sample (round 1 profiles)
---
Round 3 of the decode-path serialization line ([[records/plan/decode-path-serialization-2026-09-12]]): does deferring the per-layer drain compose with prefetch? Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Change built into this binary

Deferred router-forecast consumption. Between barriers a layer's forecast logits were queued with `asyncEval` and consumed at the next barrier: one evaluation of `h` plus every pending forecast, the wait split evenly across the pending batches, then `finishRouterForecast` for each in layer order. Completed-layer ticks still ran at every layer. At barrier period 1 this is the original path. The round 1 binary instead forced a barrier whenever a forecast was pending ([[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-1]]).

Before the round ran, its script was corrected: the build and the parity check had been piped into `tail`, which reports `tail`'s status, so a failed build or an inexact capture would have been ignored and the sweep would have measured the previous binary under this round's label. Both now stop the round.

## Build, checks, exactness

    swift build -c release              Build complete! (40.44s)
    slotstream expert-lookahead-check   150 PASS

Exactness capture on the six correctness requests with prefetch at the B0 environment, stride 3 and `SLOTSTREAM_DECODE_BARRIER_LAYERS=3`, against the diagnostic shadow: `PARITY PASS: exact output IDs, router digests and finish reasons on 6 requests`.

## Command

From `.build/decode-cpu/run-round3.sh`, 20:45 to 21:43:

    .venv/bin/python Tools/decode_sweep.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --out .build/decode-cpu/sweep-combined --configs .build/decode-cpu/configs-combined.json \
      --requests r0005,r0206,r0096 --rounds 2 --max-tokens 256 --reference k1-s2

Every configuration uses the B0 prefetch environment and varies only the barrier period K and the forecast stride:

| configuration | K | stride |
| --- | ---: | ---: |
| k1-s2 (reference, B0) | 1 | 2 |
| k3-s2 | 3 | 2 |
| k3-s3 | 3 | 3 |
| k3-s4 | 3 | 4 |
| k4-s4 | 4 | 4 |
| k8-s4 | 8 | 4 |
| k1-s3 (control) | 1 | 3 |

## Report

`sweep-combined/report.json`, reference k1-s2 (medians across cells; ratios paired):

    config      tps   ratio  clean  accept tok/pass   records  exact
    k1-s2    13.97   1.000   6/6    0.699     2.40     15685    yes
    k1-s3    12.42   0.932   6/6    0.699     2.40     18292    yes
    k3-s3    12.15   0.877   6/6    0.699     2.40     18394    yes
    k3-s2    12.02   0.865   6/6    0.699     2.40     21989    yes
    k4-s4    11.16   0.814   6/6    0.699     2.40     20232    yes
    k3-s4    11.17   0.797   5/6    0.725     2.45     20127    yes
    k8-s4    11.29   0.740   6/6    0.699     2.40     27732    yes

Paired detail:

| configuration | paired ratio | pairs | above 1 | range | demand-record ratio |
| --- | ---: | ---: | ---: | --- | ---: |
| k1-s3 | 0.932 | 6 | 1 | 0.849 to 1.008 | 1.16 |
| k3-s3 | 0.877 | 6 | 0 | 0.854 to 0.935 | 1.16 |
| k3-s2 | 0.865 | 6 | 0 | 0.658 to 0.973 | 1.34 |
| k4-s4 | 0.814 | 6 | 0 | 0.767 to 0.864 | 1.26 |
| k3-s4 | 0.797 | 5 | 0 | 0.769 to 0.841 | 1.25 |
| k8-s4 | 0.740 | 6 | 0 | 0.335 to 0.913 | 1.69 |

Excluded cell: k3-s4, r0005, round 1, `host swap-outs during the arm`.

## Prefetch counters

Medians per configuration of `measured.stats.expertPrefetch` over all arms, with `decodeIOSeconds` over `decodeSeconds`:

| counter | k1-s2 | k3-s2 | k3-s3 | k3-s4 | k4-s4 | k8-s4 | k1-s3 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| candidates | 28,594 | 24,014 | 31,576 | 33,586 | 33,578 | 26,987 | 31,549 |
| issued | 28,380 | 18,491 | 31,393 | 33,389 | 33,384 | 15,104 | 31,365 |
| adopted | 13,706 | 8,984 | 11,020 | 9,703 | 9,549 | 3,925 | 11,116 |
| promoted | 111 | 4,271 | 5,128 | 2,056 | 4,071 | 1,488 | 6 |
| expired | 11,674 | 5,745 | 12,487 | 19,818 | 15,248 | 6,810 | 16,927 |
| cancelled | 8 | 1,848 | 4,542 | 1,228 | 5,834 | 2,281 | 0 |
| demandMisses | 14,273 | 8,228 | 14,714 | 16,552 | 15,883 | 6,792 | 16,897 |
| deferredLaneAcquisitions | 38,096 | 27,484 | 108,387 | 187,293 | 200,524 | 87,798 | 41,962 |
| joinSeconds + adoptSeconds | 0.01 | 1.49 | 1.69 | 0.19 | 1.28 | 0.60 | 0.01 |
| forecastEvalSeconds | 5.04 | 2.08 | 1.67 | 1.92 | 1.33 | 0.72 | 5.62 |
| decode I/O share | 25.0% | 31.4% | 30.8% | 34.2% | 34.1% | 36.5% | 27.1% |

`slotRefusals` were zero throughout. Under deferral `forecastEvalSeconds` is the barrier's wait split across pending batches, so its fall is an accounting effect, not saved work.

## Profile check: state-window compaction

Multi-token passes compact the linear-attention state windows after the barrier with one evaluation each (`LinearCache.compactWindows`, `compactStateWindows` on in the deployment family; the model has 36 linear-attention layers). In round 1's `sample` profiles the compaction call site in the layer loop holds about 150 (prefetch off) and 220 (prefetch on) model-thread samples, against about 4,000 and 3,700 at the barrier evaluation and about 16,900 and 14,400 in the MoE call. Folding it into another wait could move at most about 1% of layer-loop time, so it was not built.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    e61ae006b1709a2042c4e631f90f1f40d7dec45bdc44db4208578ee525a3b693  sweep-combined/cells.jsonl
    55235424039c94ad3e9b9b6e26854178df695ba2c319a16f9eb11d1661cf8c12  sweep-combined/report.json
    d6666bd4afb275e225e23e8296c3e1d00cc02bb81b9252b67e8162992de5b18b  configs-combined.json
    4c5c9c6e6a161e8af6a0d68d7ac053d4275708c42acfadbbdaf82ccce4c6d940  parity-k3s3/parity.json
    f0c940bc0701721cebae5ac0572e97e29ee01194943b49c0bae150fb6b9ec10f  check3.log
    0b97f7a341d0cd81eb3b0ee47419e6019b6196d9344d23247f2f565a2740f92b  build3.log
