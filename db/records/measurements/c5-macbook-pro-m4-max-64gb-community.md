---
type: measurement
id: 01m3a6cd20shwtm35fr7y2hvhc
created: 2026-09-24T17:11:02.976369+00:00
updated: 2026-09-24T17:54:58.586860+00:00
summary: 'C5: MacBook Pro M4 Max, 64 GB, internal and external SSD (community, 2026-09-19)'
date: 2026-09-19
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m4-max-64gb]]'
order: '718'
title: 'C5: MacBook Pro M4 Max, 64 GB, internal and external SSD (community, 2026-09-19)'
status: measured
---
Reported by `@YenHub` in [issue #22](https://github.com/carloslfu/slotstream/issues/22)
(internal SSD) and [issue #23](https://github.com/carloslfu/slotstream/issues/23)
(external SSD), preserved in
[[sources/community/2026/09/2026-09-19-macbook-pro-m4-max-64gb-internal-yenhub]]
and [[sources/community/2026/09/2026-09-19-macbook-pro-m4-max-64gb-external-yenhub]].
The same reporter proposed the hardware rows in
[pull request #25](https://github.com/carloslfu/slotstream/pull/25).

MacBook Pro 16-inch (November 2024), M4 Max (`applegpu_g16s`), 64 GB,
macOS 27.0, Slotstream 0.2.22, each run after a fresh reboot with only a
terminal open. Both reports used the same auto plan: a 48.1 GB target with
about 119 experts per layer, speculative decoding, the decode lookahead and a
262,144-token window. The first read the model from the internal 1 TB SSD, the
second from a Crucial X10 Pro 1 TB external SSD over USB 3.2 Gen 2 (10 Gb/s).

| | Internal SSD | External SSD |
|---|---|---|
| Warm decode, three identical requests | 14.95, 16.22 and **15.93 tok/s** | 2.81, 3.04 and **2.98 tok/s** |
| Cold decode, 128 tokens | 15.30 tok/s | 2.89 tok/s |
| Cold reads, 28-token prefill | 13.2 GB at 7.6 GB/s | 13.2 GB at 0.9 GB/s |
| Long prompt, 8,192 tokens at context-check's 34.6 GB target | 30 s, **270 tok/s**; process peak 30.1 GB | 2.7 min, **51 tok/s**; process peak 30.2 GB |

The rows use the third requests, 15.93 and 2.98 tok/s. The warm prefill rates
in the millions of tok/s are the recipe artifact described in
[[records/measurements/c4-macbook-pro-m3-max-64gb-community]].

**Same Mac, plan and release, 5.3 times slower from a 10 Gb/s drive.** This is
the first pair in the store that isolates the disk. The external drive read
0.9 GB/s against the internal SSD's 7.6 GB/s, warm decode fell from 15.93 to
2.98 tok/s, and the long prompt fell by the same factor, from 270 to 51 tok/s.
The planner assumes a disk like the development Mac's and printed about
11 tok/s for both.

**Both runs used the pre-0.2.19 decode forecast.** Each context-check log
prints `[expert-lookahead] boundary forecast: no correction at
lookahead/tap-correction-attention-rank128-v1.safetensors`: the 37.5 MB
correction file was absent, so the engine ran the earlier forecast. Through
0.2.24 only `slotstream pull` fetched that file; a model downloaded before
0.2.19, or through the download `slotstream run` offers on first use, lacked
it.
0.2.19's 1.10x was measured on the development Mac with the file present and
is not applied to these numbers.

One reporter, one run of each step on each disk, not rerun by the author.
