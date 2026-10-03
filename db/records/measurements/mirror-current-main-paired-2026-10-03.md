---
type: measurement
id: 01m41s5s72z0ea8xdrpfb81rxb
created: 2026-10-03T21:02:00.930239799+00:00
updated: 2026-10-03T23:57:36.962824705+00:00
summary: 'Current-source paired mirror reads: decode 6.13 to 7.07 tok/s with keepalive off, identical token IDs, no observed swap.'
date: 2026-10-03
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb]]'
note: Dated source26b68c4/base143b575 observations and keepalive diagnosis retained; current CLI numbers are re-anchored to f37412f/base57aa493 pairs with their own executable identity.
order: '1730'
runs: '[[sources/runs/2026/10/2026-10-03-mirror-current-main-paired]]'
superseded_by: '[[records/measurements/mirror-current-baseline-paired-2026-10-04]]'
title: Current-source mirror reads on Mac mini M4 with keepalive off
status: superseded
---
On the Mac mini M4, the current-source single/mirror experiment measured **6.13 to 7.07 tok/s** (median paired ratio 1.154), with identical stdout and token IDs across all six runs. Three interleaved AB/BA pairs each delivered 200 greedy tokens, MTP on, 118 experts/layer and an 8,192-token context. Both copies passed every pinned SHA256 check before the campaign; no global swap was observed.

The tested profile explicitly disables GPU keepalive with `--gpu-keepalive off`. A same-executable off/auto/off control restored normal speed only with that switch disabled on this M4/macOS 15 machine. Default auto throughput and other hardware are not qualified by this result.

Median decode I/O fell from 10.78 to 7.31 s; prefill read throughput rose from 3.20 to 4.70 GB/s. The internal mirror served about 35% of routed bytes. These are engine read measurements, not saturated physical-disk ratings. The run record contains exact values, source/binary/library identities, raw outputs and admission samples. Application caches start empty in fresh processes; OS and SSD cache state is uncontrolled.

The recorded binary was built from `26b68c4` based on main `143b575`. The later rebase onto f072723 and the diagnostic-gate repairs need their own validation; this record keeps the original executable identity and observations. The September 18 and September 30 experiments remain separate historical observations.
