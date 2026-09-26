---
type: measurement
id: 01m3a6cczbpjd44dt8s16afe0e
created: 2026-09-24T17:11:02.889528+00:00
updated: 2026-09-24T17:32:26.874836+00:00
summary: 'C4: MacBook Pro M3 Max, 64 GB (community, 2026-09-16)'
date: 2026-09-16
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m3-max-64gb]]'
order: '713'
title: 'C4: MacBook Pro M3 Max, 64 GB (community, 2026-09-16)'
status: measured
---
Reported by `@merken` in [issue #20](https://github.com/carloslfu/slotstream/issues/20),
preserved in [[sources/community/2026/09/2026-09-16-macbook-pro-m3-max-64gb-merken]].

MacBook Pro 14-inch (2023), M3 Max (`applegpu_g15s`), 64 GB, 512 GB SSD,
macOS 27.0, Slotstream 0.2.18. The report does not say whether the SSD is
internal or describe other load. Auto planned a 48.1 GB target with about 119
experts per layer, speculative decoding, the decode lookahead and a
262,144-token window.

| | Reported |
|---|---|
| Warm decode, three identical requests | 11.68, 12.49 and **12.38 tok/s** |
| Cold decode, 128 tokens | 11.47 tok/s; 74 of 106 drafts accepted |
| Cold reads, 18-token prefill | 9.4 GB of experts at 6.1 GB/s |
| Long prompt, 8,192 tokens at context-check's 34.6 GB target | 39 s, **213 tok/s**; process peak 30.1 GB against a 33.6 GB plan |

The hardware row uses **12.38 tok/s**, the third request. The planner
estimated about 11 tok/s for the served plan. The warm requests' prefill rates
of about 34 million tok/s are an artifact of the measurement recipe, not a
prefill result: the repeated prompt was reused whole, and `prompt_eval_count`
counts reused tokens while `prompt_eval_duration` times only what was read.

**Below the band's estimated floor.** This is the first report from a Mac
with 48 to less than 96 GB other than the development Mac, and it sits below
the ~15 tok/s floor the README gives that band. The 64 GB M4 Max in
[[records/measurements/c5-macbook-pro-m4-max-64gb-community]] ran the same
auto plan and, by its logs, the same pre-0.2.19 decode forecast, and decoded
at 15.93 tok/s. The cold decode splits put the difference in both parts of the
step: reads took 4.00 s here against 2.69 s there, over 5,351 records against
4,424, and the rest of the step took 7.1 s against 5.6 s. That points at the
older chip and the smaller SSD more than the release, though the two runs also
differ in release (0.2.18 and 0.2.22) and neither was rerun. The 1.10x that
0.2.19's corrected forecast measured on the development Mac has not run here.
The floor stays until this Mac is rerun on the current release, with
`slotstream pull` run first; the hardware guide names this report beside the
range.

One report, one run of each step, not rerun by the author.
