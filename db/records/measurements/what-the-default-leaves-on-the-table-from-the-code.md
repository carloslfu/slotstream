---
type: measurement
id: 01m1hhwmpaexvv0kk85qf03nyw
created: 2026-09-02T17:15:26.794334+00:00
updated: 2026-09-02T17:15:26.794334+00:00
summary: What the default leaves on the table, from the code
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M11
order: '620'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: What the default leaves on the table, from the code
status: analysis
---

`PullTuning` in `Pull.swift`: 8 connections by default, cap 32
(`SLOTSTREAM_PULL_CONNECTIONS`, `--connections`), 64 MB chunks, one chunk in
flight per session, and every chunk is a fresh request to
`huggingface.co/…/resolve/…` that follows the 302 to the bridge. Consequences:

- More connections cost no memory: bodies stream to disk through `pwrite`.
- Each chunk idles two round trips (resolve, then redirect) before its body
  starts: 0.14 to 0.2 s per 64 MB chunk that takes 1.1 to 1.5 s per connection
  at 60 to 42 MB/s, 10 to 15% per connection. Hidden while the link is the
  limit; paid in full when the connections are the limit (far gigabit,
  multi-gigabit).
- About 1,620 `resolve` calls per install count against the 3,000 per 5
  minutes anonymous limit; fine at gigabit (1.75/s), still under it at 10 Gbit
  because the whole install is 1,622 chunks, but with no margin for retries.

Three client-only changes would make the default the physical best on every
link up to what one bridge node can push, with no hosting change:

1. **Adaptive concurrency.** Start at 8, add connections while the aggregate
   rate still rises by a real margin, stop when it flattens, cap 64. A slow
   link stops at 8 on its own; a 10 Gbit/s link climbs. Hugging Face's own
   `xet-core` client does this.
2. **Two chunks in flight per connection**, so the redirect gap never empties
   the pipe (a second stream on the same HTTP/2 connection is exactly what
   the per-worker session allows).
3. **Resolve once per file** and reuse the signed bridge URL until it expires,
   about an hour later (fall back to `resolve` on 403). Removes a round trip per chunk and takes
   the pull off the anonymous rate limit entirely.

Past that, at 5 to 10 Gbit/s, the per-node cap and the ~70 MB/s per-stream
origin limit remain, and only the Xet edge path or a spread across bridge
nodes (URLSession cannot pin a session to an IP) gets the rest.
