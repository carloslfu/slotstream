---
type: measurement
id: 01m1hsayasbwngqhes4jz8s5sw
created: 2026-09-02T19:25:35.449535+00:00
updated: 2026-09-02T19:25:35.449535+00:00
summary: What the sweep does not settle
date: 2026-09-02
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: N2
order: '700'
title: What the sweep does not settle
status: analysis
---
- **The auto plan on this Mac is not measured.** Every number above ran at a
  16 GB target or below, because the 33 GB auto plan (a 4096-token pass, 152
  experts per layer) needs ~32 GB reclaimable and the machine had 24–27 while
  this was measured. The closest runs are the 4096-token pass at a matched
  60-per-layer pool (222 tok/s) and at the 16 GB target by override (247);
  the planner's 220 for 4096 is taken from the lower one. A quiet-machine
  `context-check --tokens 8192` at auto is the run that turns it into a
  measurement.
- **Prose is the honest number and the planner's is the acceptance prompt's.**
  The estimator's ladder, like the one it replaced, is measured on three
  sentences repeated; ordinary prose routed to nearly every expert of every
  layer, read 4% more bytes at the same pass size, and came out ~30% slower
  even after the n-gram fix (131 against 184 tok/s at 16 GB). The tier rows
  and the full-context waits inherit that.
- **The rest of the pass is serial, and the one lever left costs a layer of
  staging.** With the group loop read-bound and the GPU waiting on reads, the
  remaining time is the router, attention, and the layer tail, which run
  while nothing is being read because the next layer's experts are unknown
  until its router runs. A pass of 256 tokens or more routes to nearly all
  512 experts of a layer, so reading layer L+1's whole set during layer L
  would be exact rather than speculative — the 2026-08-30 read-ahead, whose
  premise (spare IO capacity) the contiguous reads have now created. It would
  cost a layer of staging, 1.4 GB, which small targets do not have. Not built;
  the read-ahead decision stands until it is measured.
- **Reads stop at 11–13 GB/s.** The SSD reads 17.3 on 2.7 MB records at
  queue depth 8 and up; the runs here average a few records between resident
  experts, and six of the nine pieces per record are 51 KB scale and bias
  rows. Recycling the staging buffers did nothing, so the gap is not page
  faults. An on-disk repack that put a record's nine pieces together (the
  skipped M2 container) is the other thing that would move it.
- **Decode after a long prompt** is measured once, at 16 GB, on 48 tokens:
  5.7 against 4.8 tok/s with and without admission. Whether the admitted set
  is the right one further into a reply, and what it does to a second long
  paste in the same conversation, is not measured.
