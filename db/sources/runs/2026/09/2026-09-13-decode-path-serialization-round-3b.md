---
type: run
id: 01m2ckt0nfgn6sryrzq05z7t1s
created: 2026-09-13T05:28:27.566898+00:00
updated: 2026-09-13T05:28:28.207555+00:00
summary: 'Decode serialization round 3b: forecasts ride the next routing readback; 164 checks, exact parity at K=8, 36-cell period sweep; two slow r0206 reference cells inflate the ratios'
binary: ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db (routing-readback consumption)
captured_at: 2026-09-13
command: 'see body: .build/decode-cpu/run-round3b.sh (build, T0 checks, parity capture, sweep)'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, round 3b: deferred barrier with forecasts on the routing readback'
tool: Tools/decode_sweep.py, Tools/expert_lookahead.py (capture, parity)
---
Round 3b of the decode-path serialization line ([[records/plan/decode-path-serialization-2026-09-12]]), registered after round 3: the deferred barrier with router forecasts and completed-layer ticks riding the next layer's routing readback. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Change built into this binary

`RoutingReadbackQueue` (new, `Sources/Slotstream/RoutingReadbackQueue.swift`) holds arrays and host work queued between barriers. The next `MoELayer` evaluates them in its routing readback (`eval([routeIndices] + queue.arrays)`) and finishes them, in queue order with the wait split evenly, before its routes reach any observer. At a non-barrier layer with a lookahead session, `runHiddenMulti` queues the layer's forecast logits with a finisher that runs `finishRouterForecast` and the completed-layer tick; a barrier evaluates anything left together with `h` and finishes it first; a pass that returns early or throws discards the queue. At barrier period 1 no MoE layer holds the queue, so the path is the original one. Round 3's `asyncEval` and consume-at-barrier path is removed. A weights-free check, `expert-lookahead-routing-readback`, covers order, the wait split, discard and work queued by a finisher.

## Build, checks, exactness

    swift build -c release              Build complete! (106.14s)
    slotstream expert-lookahead-check   164 PASS (150 before, 14 in the new check)

Exactness capture on the six correctness requests with prefetch at the B0 environment, stride 2 and `SLOTSTREAM_DECODE_BARRIER_LAYERS=8`, against the diagnostic shadow: `PARITY PASS: exact output IDs, router digests and finish reasons on 6 requests`.

## Command

From `.build/decode-cpu/run-round3b.sh`, queued after round 5, sweep 23:34 to 00:23:

    .venv/bin/python Tools/decode_sweep.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --out .build/decode-cpu/sweep-routing --configs .build/decode-cpu/configs-routing.json \
      --requests r0005,r0206,r0096 --rounds 2 --max-tokens 256 --reference k1-s2

Every configuration runs the B0 prefetch environment at stride 2 and varies only the barrier period: 1 (reference), 2, 3, 4, 8 and 16.

## Report

`sweep-routing/report.json`, reference k1-s2 (medians across clean cells; ratios paired):

    config      tps   ratio  clean  accept tok/pass   records  exact
    k8-s2     13.28   1.125   4/6    0.696     2.39     15589    yes
    k4-s2     13.58   1.087   6/6    0.699     2.40     15654    yes
    k3-s2     13.41   1.084   5/6    0.725     2.45     15660    yes
    k2-s2     13.32   1.065   6/6    0.699     2.40     15686    yes
    k16-s2    13.43   1.058   6/6    0.699     2.40     15556    yes
    k1-s2     13.55   1.000   6/6    0.699     2.40     15688    yes

Excluded cells, `host swap-outs during the arm`: k8-s2 r0005 and r0096 (round 0), k3-s2 r0005 (round 1).

## Per pair

Ratio of each configuration's tok/s to the reference cell of the same request and round (`*` marks a pair with an excluded cell):

| pair | reference tok/s | K = 2 | K = 3 | K = 4 | K = 8 | K = 16 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| r0005 round 0 | 13.13 | 1.015 | 0.986 | 1.029 | 0.975* | 0.988 |
| r0005 round 1 | 13.55 | 0.983 | 0.988* | 1.003 | 0.975 | 0.860 |
| r0206 round 0 | 10.99 | 1.117 | 1.121 | 1.149 | 1.184 | 1.207 |
| r0206 round 1 | 9.78 | 1.354 | 1.371 | 1.357 | 1.357 | 1.372 |
| r0096 round 0 | 13.90 | 0.984 | 1.007 | 1.001 | 0.996* | 0.993 |
| r0096 round 1 | 14.60 | 0.984 | 0.982 | 1.021 | 1.022 | 1.006 |

## The r0206 reference cells

Both ran slower than every other r0206 cell at barrier period 1 on this machine that evening: 10.99 and 9.78 tok/s, against 12.84 and 12.01 (round 2), 12.0 and 13.23 (round 3), 12.76 and 13.29 (round 4) and 13.34, 12.14, 11.78 and 11.61 (round 5). Their demand records (10,470 and 10,471) and decode I/O seconds (3.72 and 3.49) match the other configurations' r0206 cells (10,414 to 10,473 records, 3.23 to 3.54 s). Decode seconds outside I/O:

| round | K = 1 | K = 2 | K = 3 | K = 4 | K = 8 | K = 16 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 0 | 10.02 | 8.82 | 8.72 | 8.42 | 8.10 | 7.92 |
| 1 | 11.94 | 8.17 | 8.02 | 8.05 | 7.93 | 7.88 |

Neither cell tripped the eligibility rule (no swap-outs, 3 page-ins each). The reference in round 0 ran last of its prompt block, the one in round 1 fifth of six. Separately, k16-s2 on r0005 round 1 ran at 11.64 tok/s (0.860).

## Counters

Medians per configuration of `measured.stats.expertPrefetch` over all arms, with `decodeIOSeconds` over `decodeSeconds`:

| counter | K = 1 | K = 2 | K = 3 | K = 4 | K = 8 | K = 16 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| issued | 28,386 | 28,388 | 28,405 | 28,405 | 28,392 | 28,360 |
| adopted | 13,708 | 13,714 | 13,720 | 13,717 | 13,718 | 13,720 |
| promoted | 394 | 2,947 | 2,830 | 3,179 | 3,705 | 3,664 |
| expired | 11,668 | 11,648 | 11,633 | 11,610 | 11,618 | 11,570 |
| cancelled | 14 | 10 | 33 | 44 | 42 | 54 |
| demandMisses | 14,274 | 14,277 | 14,256 | 14,242 | 14,196 | 14,160 |
| deferredLaneAcquisitions | 40,298 | 51,744 | 48,840 | 48,016 | 45,082 | 45,172 |
| joinSeconds + adoptSeconds | 0.03 | 0.17 | 0.14 | 0.14 | 0.16 | 0.18 |
| forecastEvalSeconds | 5.31 | 6.66 | 7.28 | 7.30 | 7.67 | 7.98 |
| decode I/O share | 26.0% | 28.3% | 28.8% | 29.4% | 30.2% | 30.2% |

Between barriers `forecastEvalSeconds` is a share of the routing readback's wait, so its rise is an accounting effect.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    ee11a82014a2218833108f259d1015414dfe14fbcc63f1545ebfae5fafef3741  sweep-routing/cells.jsonl
    58f32616648f4e98fbf4035f4d19cf76d341ab8b1053e1da0bb14dd92c3165fc  sweep-routing/report.json
    caedc5720770e66e28c965a7bb8024f529922892e6d319ba534bf09bac283429  configs-routing.json
    c46f4a4d07385870abd6903bf657717728f859daa9f93e958c2909905199418e  parity-k8s2/parity.json
    3f8d7b7e3e02b4e2ee3dd4b1b6eab598ef211822115be7e9f42a7505c7b5d224  check3b.log
    0435bc9e3d50147765eaf4bda9a754b815bc0a6e11b18bb26749d249ca4d196f  build3b.log
