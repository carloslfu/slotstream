---
type: measurement
id: 01m3a6cd31ppgvvbs9782qqkpy
created: 2026-09-24T17:11:03.009247+00:00
updated: 2026-09-24T17:11:03.009247+00:00
summary: 'C6: MacBook Pro M4 Max, 36 GB (community, 2026-09-20)'
date: 2026-09-20
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m4-max-36gb]]'
order: '715'
title: 'C6: MacBook Pro M4 Max, 36 GB (community, 2026-09-20)'
status: measured
---
Reported by `@JohnClarkson` in [issue #26](https://github.com/carloslfu/slotstream/issues/26),
preserved in [[sources/community/2026/09/2026-09-20-macbook-pro-m4-max-36gb-johnclarkson]].

MacBook Pro (November 2024), M4 Max (`applegpu_g16s`), 36 GB, internal 1 TB
SSD, macOS 26.0.1, Slotstream 0.2.22, run just after a reboot with a terminal
and one screen-sharing window open. Auto planned a 27.1 GB target with about
90 experts per layer, speculative decoding, the decode lookahead and a
65,536-token window.

| | Reported |
|---|---|
| Warm decode, three identical requests | 8.48, 8.61 and **8.41 tok/s** |
| Cold decode, 128 tokens | 8.63 tok/s; 74 of 106 drafts accepted |
| Cold reads, 28-token prefill | 13.2 GB of experts at 5.5 GB/s |
| Long prompt, 8,192 tokens at context-check's 27.1 GB target (about 121 experts per layer) | 49 s, **166 tok/s**; process peak 24.8 GB against a 26.1 GB plan |

The hardware row uses **8.41 tok/s**, the third request; the planner
estimated about 9 tok/s. This is the first 36 GB report. Like
[[records/measurements/c5-macbook-pro-m4-max-64gb-community]], its
context-check log prints `no correction at
lookahead/tap-correction-attention-rank128-v1.safetensors`, so it ran the
pre-0.2.19 decode forecast. The warm prefill rates in the millions of tok/s
are the recipe artifact described in
[[records/measurements/c4-macbook-pro-m3-max-64gb-community]].

One report, one run of each step, not rerun by the author.
