---
type: measurement
id: 01m3f79jpnxh6gjm5srn7cbvjc
created: 2026-09-26T16:03:11.189494+00:00
updated: 2026-09-26T16:03:11.189494+00:00
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
