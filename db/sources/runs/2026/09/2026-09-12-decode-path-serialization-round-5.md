---
type: run
id: 01m2cgtvx31vpx9j7j67vvnxvd
created: 2026-09-13T04:36:29.731740+00:00
updated: 2026-09-13T04:36:30.375700+00:00
summary: 'Decode serialization round 5: router weight cache and router top-k under prefetch, four prompts by four rounds on the round 3 binary; eight cells excluded for host swap-outs'
binary: f834ce6f245084989dff83db6c988e496c0ce68969baaee1815cce927ed96433 (round 3 build, unchanged)
captured_at: 2026-09-12
command: 'see body: .build/decode-cpu/run-round5.sh'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, round 5: router weight cache, powered re-test'
tool: Tools/decode_sweep.py, Tools/decode_summary.py
---
Round 5 of the decode-path serialization line ([[records/plan/decode-path-serialization-2026-09-12]]): the router weight cache, re-tested with enough pairs to separate a 1% effect from noise. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Setup

The round 3 binary, unchanged; every arm records its executable sha256 (frontmatter). Every configuration runs the B0 prefetch environment at barrier period 1:

| configuration | environment beyond B0 |
| --- | --- |
| pf-base (reference) | none |
| router-weights | `SLOTSTREAM_OPT_ROUTER_WEIGHTS=1` |
| rw-topk | `SLOTSTREAM_OPT_ROUTER_WEIGHTS=1`, `SLOTSTREAM_OPT_ROUTER_TOPK=1` |

The router matmul promotes each BF16 router to FP32 on every call; `SLOTSTREAM_OPT_ROUTER_WEIGHTS` keeps a pre-materialized FP32 copy instead (`cachedRouterBytes` 256,901,120 in both cache arms). `SLOTSTREAM_OPT_ROUTER_TOPK` adds the specialized router top-k selection.

## Command

From `.build/decode-cpu/run-round5.sh`, 22:23 to 23:29:

    .venv/bin/python Tools/decode_sweep.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --out .build/decode-cpu/sweep-rw --configs .build/decode-cpu/configs-rw.json \
      --requests r0005,r0206,r0096,r0074 --rounds 4 --max-tokens 256 --reference pf-base

## Report

`sweep-rw/report.json`, reference pf-base (medians across clean cells; ratios paired):

    config              tps   ratio  clean  accept tok/pass   records  exact
    router-weights    13.33   1.017  13/16   0.770     2.54     17873    yes
    rw-topk           13.34   1.002  13/16   0.770     2.54     17872    yes
    pf-base           13.25   1.000  14/16   0.775     2.55     17877    yes

## Paired detail

Twelve pairs of clean cells per configuration. The interval is a normal approximation on the log ratios.

| configuration | paired ratio | above 1 | range | approximate 95% interval | exact |
| --- | ---: | ---: | --- | --- | --- |
| router-weights | 1.017 | 10 of 12 | 0.982 to 1.056 | 1.003 to 1.031 | yes |
| rw-topk | 1.002 | 7 of 12 | 0.945 to 1.058 | 0.984 to 1.020 | yes |

Per prompt, clean pairs in round order:

| prompt | router-weights | rw-topk |
| --- | --- | --- |
| r0005 | 1.004, 1.019, 1.023 | 0.993, 1.047, 1.009 |
| r0074 | 0.983, 1.046, 1.008 | 0.998, 0.987, 0.945 |
| r0096 | 1.010, 0.982, 1.016 | 1.000, 0.959, 1.024 |
| r0206 | 1.000, 1.056, 1.055 | 1.001, 1.007, 1.058 |

Excluded cells, eight of 48, all `host swap-outs during the arm` and all in rounds 2 and 3: pf-base r0005 and r0096 (round 2); router-weights r0005, r0206 and r0074 (round 2); rw-topk r0005 and r0206 (round 2) and r0074 (round 3). System swap in use grew from 34.4 MB at 21:45 to 176.9 MB at 23:33.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    2302532aa7239bda2ad1b11c27e1050e5041680e40cdd5628fa57319bb2c1876  sweep-rw/cells.jsonl
    f5ca6f56964b456f47aaa560eb889926eeb6aebd54e0add71a86f9781b209b6c  sweep-rw/report.json
    a0998bb62ab81dc4dba0b5abdff81df810458c7ca23f05de49ce0cdaf674dcd5  configs-rw.json
