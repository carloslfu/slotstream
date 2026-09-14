---
type: run
id: 01m2cwc3c9bjdjy9mn086y780b
created: 2026-09-13T07:58:08.777144+00:00
updated: 2026-09-13T07:58:09.399107+00:00
summary: 'Decode serialization step 6: registered selection over rounds 2, 3b, 4 and 5, exact parity of the combined candidate, screen against shipped and pf-b0 on the exploration prompts'
binary: ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db (round 3b build)
captured_at: 2026-09-13
command: 'see body: .build/decode-cpu/run-combine.sh steps 6a to 6c'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, step 6: selection, exactness and screen of the combined candidate'
tool: Tools/decode_combine.py, Tools/expert_lookahead.py (capture, parity), Tools/decode_sweep.py
---
Step 6 of the decode-path serialization plan ([[records/plan/decode-path-serialization-2026-09-12]]): the pre-registered selection over rounds 2, 3b, 4 and 5, exactness of the combined candidate, and a screen against the shipped path. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Selection

`Tools/decode_combine.py` from `.build/decode-cpu/run-combine.sh`, with levers `sweep-coverage:c10-s2`, `sweep-routing:k1-s2`, `sweep-depth2:d2-pf` and `sweep-rw:pf-base`; round 3's lever was replaced by round 3b's before round 3b ran. Rule: exact outputs, at least five clean pairs, a paired geometric mean of at least 1.01 and at least 80% of pairs above 1; configurations within 0.005 of the best go to the one listed first.

| lever | winner | overrides |
| --- | --- | --- |
| prefetch coverage (round 2) | c24-s2 | top 24, issue cap 32 (inert under the margin threshold) |
| barrier period with forecasts on the routing readback (round 3b) | k4-s2 | `SLOTSTREAM_DECODE_BARRIER_LAYERS=4` |
| draft depth (round 4) | none | |
| router weights (round 5) | router-weights | `SLOTSTREAM_OPT_ROUTER_WEIGHTS=1` |

No conflicting keys, no base mismatch, no stop.

## Exactness

Capture of the combined candidate on the six correctness requests against the diagnostic shadow: `PARITY PASS: exact output IDs, router digests and finish reasons on 6 requests`.

## Screen

After five minutes without host swap-outs (00:25 to 00:30), `Tools/decode_sweep.py` with `configs-screen.json`: shipped (no environment), pf-b0 (the B0 prefetch environment) and combined; r0005, r0206 and r0096; two rounds; 128 warmup and 256 measured outputs; reference shipped; 00:30 to 00:55 on the round 3b binary.

    config        tps   ratio  clean  accept tok/pass   records  exact
    combined    13.14   1.104   6/6    0.699     2.40     15621    yes
    pf-b0       13.39   1.084   6/6    0.699     2.40     15684    yes
    shipped     11.84   1.000   6/6    0.699     2.40     31160    yes

Per pair (tok/s and ratios):

| pair | shipped | pf-b0 | combined | pf-b0 / shipped | combined / shipped | combined / pf-b0 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| r0005 round 0 | 11.84 | 13.39 | 12.80 | 1.131 | 1.081 | 0.956 |
| r0005 round 1 | 11.51 | 12.52 | 13.14 | 1.088 | 1.143 | 1.050 |
| r0206 round 0 | 11.36 | 12.08 | 12.50 | 1.063 | 1.100 | 1.035 |
| r0206 round 1 | 11.43 | 12.93 | 12.97 | 1.131 | 1.135 | 1.003 |
| r0096 round 0 | 13.29 | 13.55 | 14.42 | 1.020 | 1.085 | 1.064 |
| r0096 round 1 | 13.41 | 14.44 | 14.50 | 1.077 | 1.082 | 1.004 |

Geometric means: pf-b0 against shipped 1.084 (six of six above 1), combined against shipped 1.104 (six of six), combined against pf-b0 1.018 (five of six).

Medians per configuration from `measured.stats`:

| quantity | shipped | pf-b0 | combined |
| --- | ---: | ---: | ---: |
| decode seconds | 19.18 | 18.31 | 17.70 |
| decode I/O share | 41.3% | 26.1% | 29.6% |
| draft share | 2.9% | 3.2% | 3.1% |
| forecast and schedule host share | 0.0% | 1.3% | 1.4% |
| join and adopt share | 0.0% | 0.1% | 1.4% |
| demand records per output | 131.25 | 69.33 | 68.88 |

## Cohort candidate

The script takes the exact screen configuration with the higher paired ratio against shipped: combined. `plan-b1.json` holds arms off (shipped) and on (combined, 17 environment keys), the twelve B1 prompts, three rounds, 128 warmup and 512 measured outputs.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    3bcdba6c68151138b1b37d605b64090e133be20e54193d5e11123833ea3aab03  combination.json
    ae095f9cba942e9ba2743ed93ae0d833a5e193e66bf4b1548ed71e2458a39fbd  combine-state.json
    f22c570427ad6f9a8a9a621547d7637a4dbdac0a1979365995f6a388c659a27a  parity-combined/parity.json
    7812be77b25c4b3770cd34575944096748a1f327a73d4d45c6fb1d4a67a75a18  configs-screen.json
    68119c3e97e64bd0c2a235b07aae16b13cd39927022aad69df0ed4a2229002b3  sweep-screen/cells.jsonl
    54c9278b258ef4b600e53c3ee3b3a27a5b6b20f3c385ddf01956fdef2a38aeca  sweep-screen/report.json
    4c41885fe40e0c6cc15333514ceada7a5a6ed1c81ec866edb2625a0d20475b3b  plan-b1.json
