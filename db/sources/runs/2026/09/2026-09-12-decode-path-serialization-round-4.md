---
type: run
id: 01m2ccvrs7zgzvxsxsd53wqp4x
created: 2026-09-13T03:27:04.998996+00:00
updated: 2026-09-13T03:27:05.644674+00:00
summary: 'Decode serialization round 4: draft depths 1 to 6 under prefetch with per-depth protocols, 30 cells on the round 3 binary; depth 1 inexact and no depth above the rule'
binary: f834ce6f245084989dff83db6c988e496c0ce68969baaee1815cce927ed96433 (round 3 build, unchanged)
captured_at: 2026-09-12
command: 'see body: .build/decode-cpu/run-round4.sh'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, round 4: draft depth under per-depth protocols'
tool: Tools/decode_sweep.py, Tools/decode_summary.py
---
Round 4 of the decode-path serialization line ([[records/plan/decode-path-serialization-2026-09-12]]): draft depth under prefetch, each arm under a protocol variant pinning its depth. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Setup

The round 3 binary, unchanged; every arm records its executable sha256 (frontmatter). Every configuration runs the B0 prefetch environment at barrier period 1. Round 1's depth sweep failed closed on the protocol's pinned `SLOTSTREAM_DRAFT_DEPTH=2` ([[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-1]]); here each depth runs under its own protocol variant, `protocols/protocol-d<depth>.json`, which pins that depth:

| configuration | draft depth |
| --- | ---: |
| d2-pf (reference) | 2 |
| d1-pf | 1 |
| d3-pf | 3 |
| d4-pf | 4 |
| d6-pf | 6 |

## Command

From `.build/decode-cpu/run-round4.sh`, 21:43 to 22:23:

    .venv/bin/python Tools/decode_sweep.py --protocol .build/expert-lookahead/xla2-20260911/protocol.json \
      --out .build/decode-cpu/sweep-depth2 --configs .build/decode-cpu/configs-depth2.json \
      --requests r0005,r0206,r0096 --rounds 2 --max-tokens 256 --reference d2-pf

## Report

`sweep-depth2/report.json`, reference d2-pf (medians across cells; ratios paired):

    config      tps   ratio  clean  accept tok/pass   records  exact
    d3-pf    13.79   1.022   6/6    0.628     2.88     17170    yes
    d2-pf    14.11   1.000   6/6    0.699     2.40     15678    yes
    d4-pf    13.16   0.981   6/6    0.542     3.17     19065    yes
    d1-pf    13.70   0.957   6/6    0.837     1.84     15654     NO
    d6-pf    11.50   0.877   6/6    0.415     3.49     23095    yes

    EXACTNESS FAILURES (not a tolerance question): d1-pf

## Paired detail

Per (request, round) against d2-pf, geometric means over six pairs of clean cells:

| configuration | speed | pairs above 1 | range | forward passes | demand records per pass | seconds per pass | demand records | acceptance | identical outputs |
| --- | ---: | ---: | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| d1-pf | 0.957 | 1 | 0.915 to 1.005 | 1.310 | 0.744 | 0.800 | 0.974 | 1.198 | 0 of 6 |
| d3-pf | 1.022 | 4 | 0.954 to 1.077 | 0.829 | 1.254 | 1.181 | 1.039 | 0.902 | 6 of 6 |
| d4-pf | 0.981 | 2 | 0.927 to 1.028 | 0.755 | 1.516 | 1.351 | 1.144 | 0.777 | 6 of 6 |
| d6-pf | 0.877 | 0 | 0.811 to 0.959 | 0.687 | 2.069 | 1.661 | 1.421 | 0.593 | 6 of 6 |

Reference medians: 96 forward passes, 163.6 demand records per pass, acceptance 0.68. Depth 1 diverged from depth 2 at the same output in both rounds of each prompt: output 96 of r0005, 27 of r0096 and 63 of r0206, which then ended at 152 outputs against 151.

## Counters

Medians per configuration of `measured.stats` and its prefetch observation:

| counter | d1-pf | d2-pf | d3-pf | d4-pf | d6-pf |
| --- | ---: | ---: | ---: | ---: | ---: |
| decodeForwardPasses | 133 | 96 | 75 | 68 | 59 |
| draftedTokens | 133 | 192 | 225 | 272 | 354 |
| acceptedDrafts | 111 | 140 | 154 | 163 | 171 |
| decodeRecords | 15,644 | 15,675 | 17,168 | 19,060 | 23,090 |
| prefetch issued | 27,534 | 28,390 | 28,064 | 29,554 | 31,522 |
| prefetch adopted | 12,968 | 13,714 | 13,806 | 14,306 | 15,561 |
| demandMisses | 14,383 | 14,268 | 15,680 | 17,430 | 21,702 |
| promoted | 226 | 95 | 48 | 29 | 4 |
| decode I/O share | 25.4% | 25.4% | 26.0% | 26.1% | 27.3% |
| draft share | 1.9% | 3.0% | 3.7% | 4.3% | 5.2% |

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    1e28d0dbc5c5a4dd8945698f374f84d20495187ee5559b9fa898d67d79e08bc9  sweep-depth2/cells.jsonl
    78302d6ab62c5f5d6790891ef306c536f37620bb36533322e3b39905b3620844  sweep-depth2/report.json
    b585cb97074d46e06ea6567a9b6cbde65c2417a07c04a3b79b41c960084e8ceb  configs-depth2.json
    73cc44d7ba9ceca0335b155f5522b3a9a3718bca2158c807c989e840cb12552e  protocols/protocol-d1.json
    b3e2cb84310800f9c5bb598f277c158a3504c92cfebd1707a95ba106636c15f8  protocols/protocol-d2.json
    8db658339dd3a9ed602e69a98034ddb33d73ba612112c757c711527232b34859  protocols/protocol-d3.json
    f73757fbcea651f9e5cdee4d920f087f44a2109f3e6c0da1aa6261ede184f898  protocols/protocol-d4.json
    8daf8c85afbd296a2b2f844c814edce04f38ed455ab8af2652db39000ea4872b  protocols/protocol-d6.json
