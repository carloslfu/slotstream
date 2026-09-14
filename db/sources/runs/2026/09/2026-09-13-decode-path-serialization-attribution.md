---
type: run
id: 01m2dakgr84dv8c2zbd9gxf7d7
created: 2026-09-13T12:06:51.912467+00:00
updated: 2026-09-13T12:06:52.566282+00:00
summary: 'Decode serialization attribution sweep: shipped, B0 prefetch, B0 plus router weight cache, B0 plus barrier period 4 and the combined candidate, four prompts by four rounds on one binary'
binary: ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db (round 3b build)
captured_at: 2026-09-13
command: 'see body: .build/decode-cpu/run-attribution.sh (guard, quiet swap, Tools/decode_sweep.py)'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, attribution sweep: each part of the combined candidate on one binary'
tool: Tools/decode_sweep.py
---
Attribution sweep of the decode-path serialization plan ([[records/plan/decode-path-serialization-2026-09-12]]), registered at 03:05 before it ran: each part of the combined candidate priced on one binary against B0 prefetch, four prompts by four rounds. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Setup

The round 3b binary (`ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db`). `configs-attribution.json`:

| configuration | environment |
| --- | --- |
| pf-b0 (reference) | the B0 prefetch environment, 14 keys |
| shipped | none |
| pf-rw | B0 plus `SLOTSTREAM_OPT_ROUTER_WEIGHTS=1` |
| pf-k4 | B0 plus `SLOTSTREAM_DECODE_BARRIER_LAYERS=4` |
| combined | the step 7 candidate: B0 plus barrier period 4, the router weight cache, top 24 and issue cap 32 |

## Command

From `.build/decode-cpu/run-attribution.sh`, which refuses to start unless the binary matches and then waits for ten minutes without host swap-outs (05:00 to 05:10); sweep 05:10 to 07:00:

    .venv/bin/python Tools/decode_sweep.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --out .build/decode-cpu/sweep-attribution --configs .build/decode-cpu/configs-attribution.json \
      --requests r0005,r0206,r0096,r0074 --rounds 4 --max-tokens 256 --reference pf-b0

## Report

`sweep-attribution/report.json`, reference pf-b0 (medians across clean cells; ratios paired):

    config        tps   ratio  clean  accept tok/pass   records  exact
    combined    13.35   1.046  16/16   0.764     2.53     17723    yes
    pf-k4       13.21   1.022  15/16   0.778     2.56     17847    yes
    pf-rw       13.51   1.021  16/16   0.764     2.53     17880    yes
    pf-b0       12.89   1.000  15/16   0.760     2.52     15685    yes
    shipped     11.75   0.918  16/16   0.764     2.53     33600    yes

Excluded cells, `host swap-outs during the arm`: pf-k4 r0005 round 1 and pf-b0 r0096 round 2.

## Paired detail

Pairs of clean cells against pf-b0; the interval is a normal approximation on the log ratios.

| configuration | ratio | pairs | above 1 | range | approximate 95% interval | exact |
| --- | ---: | ---: | ---: | --- | --- | --- |
| shipped | 0.918 | 15 | 1 | 0.840 to 1.055 | 0.894 to 0.943 | yes |
| pf-rw | 1.021 | 15 | 11 | 0.928 to 1.182 | 0.994 to 1.050 | yes |
| pf-k4 | 1.022 | 14 | 13 | 0.983 to 1.087 | 1.008 to 1.036 | yes |
| combined | 1.046 | 15 | 15 | 1.009 to 1.168 | 1.024 to 1.069 | yes |

Per prompt, clean pairs in round order:

| prompt | shipped | pf-rw | pf-k4 | combined |
| --- | --- | --- | --- | --- |
| r0005 | 0.885, 0.933, 0.909, 0.882 | 1.016, 1.083, 1.073, 0.928 | 1.012, 1.087, 0.983 | 1.037, 1.107, 1.048, 1.025 |
| r0074 | 0.933, 0.942, 0.937, 1.055 | 1.006, 1.011, 0.991, 1.182 | 1.010, 1.013, 1.021, 1.075 | 1.015, 1.012, 1.108, 1.168 |
| r0096 | 0.937, 0.922, 0.961 | 1.021, 1.000, 0.996 | 1.010, 1.013, 1.028 | 1.017, 1.009, 1.025 |
| r0206 | 0.873, 0.880, 0.840, 0.895 | 1.011, 1.007, 0.983, 1.033 | 1.007, 1.016, 1.025, 1.013 | 1.019, 1.025, 1.021, 1.073 |

The product of the two single parts, 1.021 × 1.022 = 1.044, against 1.046 for the combination.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    805e303ad3f654cf455f7b4d463eabbeabe6be64437674663baea7915a8d95fc  sweep-attribution/cells.jsonl
    476602c9321cb1679ab5462d7332603ff2cdd6c0681ef55ee61a689fd4dcde3d  sweep-attribution/report.json
    5ecf111096f09fac9ce44a25866c941947273ea6cd4e3abce0952409d6109237  configs-attribution.json
    fdf54ca5850a555991da050c72274601dfb784e417d73bc8d7ba7173fca027ed  run-attribution.sh
