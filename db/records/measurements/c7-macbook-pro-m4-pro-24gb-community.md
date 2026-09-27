---
type: measurement
id: 01m3f79jpnxh6gjm5srn7cbvjc
created: 2026-09-26T16:03:11.189494+00:00
updated: 2026-09-27T05:04:11.719077+00:00
summary: 'C7: MacBook Pro M4 Pro, 24 GB (community, 2026-09-25)'
date: 2026-09-25
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m4-pro-24gb]]'
order: '716'
title: 'C7: MacBook Pro M4 Pro, 24 GB (community, 2026-09-25)'
status: measured
---
Reported by `@davidcavazos` in [issue #41](https://github.com/carloslfu/slotstream/issues/41),
preserved in [[sources/community/2026/09/2026-09-25-macbook-pro-m4-pro-24gb-davidcavazos]].

MacBook Pro (2024), M4 Pro (`applegpu_g16s`), 24 GB, 512 GB SSD, macOS 26.6.2,
Slotstream 0.2.24, run after a fresh boot with one or two terminals, Safari,
Stats and Activity Monitor open, and no swap before or after. Auto planned a
15.9 GB target, sized down from the usual 18.0 GB because 17.4 GB was
reclaimable, with about 53 experts per layer and a 32,768-token window. At
that window the 0.2.24 plan ran without the draft head and without the decode
lookahead.

| | Reported |
|---|---|
| Warm decode, three identical requests | 3.61, 3.52 and **3.57 tok/s** |
| A second warm round, posted later | 3.85, 3.97 and 3.95 tok/s |
| Cold decode, 128 tokens | 3.17 tok/s |
| Cold reads, 28-token prefill | 13.1 GB of experts at 3.7 GB/s |
| Long prompt, 8,192 tokens at context-check's 18.0 GB target (about 78 experts per layer) | 1.5 min, **93 tok/s**; process peak 16.6 GB against a 17.0 GB plan |

The hardware row uses **3.57 tok/s**, the third request of the first round;
the planner estimated about 8 tok/s. This is the first 24 GB report, and it
falls below the 24 to less than 48 GB planning range of ~6–16 tok/s. Two known
differences from the development Mac may account for the gap. The planner
assumes an SSD like the development Mac's 17.3 GB/s, while this 512 GB SSD read
cold experts at 3.7 GB/s. And 0.2.25 enables the draft head, with streamed
experts, and the decode lookahead at 24 GB, which 0.2.24 did not. A rerun on
0.2.25 would separate the two. While using the server from Pi, the reporter
saw disk reads of about 2 GB/s; the server reported no tok/s there.

One report: two warm rounds and one run of each other step, not rerun by the
author.

## The 0.2.25 re-run, recorded 2026-09-27

`@davidcavazos` re-ran the procedure on 0.2.25 and posted it as a [comment on
issue
#41](https://github.com/carloslfu/slotstream/issues/41#issuecomment-5850068364),
preserved in
[[sources/community/2026/09/2026-09-26-macbook-pro-m4-pro-24gb-davidcavazos-0-2-25-rerun]].
It was not a fresh boot: other apps held about 5.5 GB, and 419 MB of swap
stayed unchanged before and after the tests.

| | 0.2.24 report above | 0.2.25 re-run |
|---|---|---|
| Auto plan (`doctor`) | 15.9 GB target, ~53 experts per layer; no draft head or decode lookahead | 17.4 GB target, ~58 experts per layer; draft head and decode lookahead on |
| Warm decode, three identical requests | 3.61, 3.52 and **3.57 tok/s** | 5.58, 4.92 and **5.41 tok/s** |
| Cold decode, 128 tokens | 3.17 tok/s | 5.57 tok/s; 74 of 106 drafts accepted |
| Cold reads, 28-token prefill | 13.1 GB at 3.7 GB/s | 13.1 GB at 3.7 GB/s |
| Long prompt, 8,192 tokens at context-check's 18.0 GB target | 1.5 min, 93 tok/s, ~78 experts per layer; peak 16.6 GB against 17.0 GB | 1.6 min, 86 tok/s, ~72 experts per layer; peak 16.7 GB against 17.0 GB |

The hardware row now uses **5.41 tok/s**, the third request and the round's
median. On 0.2.25 this Mac decoded about half again as fast: the draft head
accepted 70% of its drafts, and the long-prompt log shows the corrected decode
forecast loaded. It is still below the planner's ~8 tok/s and below the ~6
floor the 24 to less than 48 GB range had, which now rounds down to ~5
([[records/measurements/hardware-planning-ranges-2026-09-13]]).

The cold read rate did not move: 3.7 GB/s through the engine, and the reporter
saw 2 to 3 GB/s of disk reads during warm decode. The first report set that
against the development Mac's 17.3 GB/s, which is a raw SSD figure. Through
the engine the development Mac read cold experts at 11.5 GB/s in
[[sources/runs/2026/09/2026-09-05-optimization-cache-policy-screen]] and 12.6
GB/s in [[sources/runs/2026/09/2026-09-18-memory-budget-native-verification]],
so this Mac reads about a third as fast, not a fifth. Both plans were also
sized down because other apps held memory, to 15.9 and 17.4 GB from the usual
18.0 GB. One re-run cannot separate the SSD from the plan size.

The plan column is `doctor`'s plan, as the hardware guide defines it. The warm
server's own plan was not posted either time. The first report's cold run held
about 38 experts per layer; the re-run's held about 58, matching its `doctor`
plan.

One re-run, one round of each step, not rerun by the author.
