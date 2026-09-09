---
type: measurement
id: 01m21s4mwbesh3n1crrvh7t7dz
created: 2026-09-09T00:30:00.075414+00:00
updated: 2026-09-09T00:30:00.075414+00:00
summary: 'C2: MacBook Pro M5 Max, 128 GB (community, 2026-09-03)'
date: 2026-09-03
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-max-128gb]]'
order: '715'
title: 'C2: MacBook Pro M5 Max, 128 GB (community, 2026-09-03)'
status: measured
---
Reported by `@waterliu1981` in [issue #6](https://github.com/carloslfu/slotstream/issues/6).
The original report and its follow-up are preserved in
[[sources/community/2026/09/2026-09-03-macbook-pro-m5-max-128gb-waterliu1981]].

MacBook Pro 16-inch (Mac17,7), M5 Max, 128 GB, internal 2 TB SSD,
macOS 26.6.2. The reporter described an idle machine. The auto plan was
34.6 GB with about 152 experts per layer and speculative decoding enabled.

The first report used Slotstream 0.2.1 and summarized warm decode at about
19 to 21 tok/s. The same author then remeasured with Slotstream 0.2.3,
reporting a checksum-verified binary replacement and unchanged weights.
That [follow-up](https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520489176)
is the source of the current hardware row:

| Repeated 256-token request | Reply speed |
|---|---|
| 1 | 21.02 tok/s |
| 2 | 21.53 tok/s |
| 3 | 22.11 tok/s |

The report summarizes this as **21–22 tok/s** with the auto plan and
speculative decoding. Two longer warm runs returned 22.83 and 22.10 tok/s.
The current surface uses the reported range instead of a best run.

The report's prefill and peak figures were planner estimates, not measured
long-prompt speed or process RSS. Keep both columns unmeasured. Cache-size
sweeps in the source use manual settings and are not the automatic result.

This is one community report, not an independent rerun or a comparison made
under the same conditions as the M5 Pro and M2 measurements. It supports a
machine-specific row, not a promise for all Macs with that memory capacity.
