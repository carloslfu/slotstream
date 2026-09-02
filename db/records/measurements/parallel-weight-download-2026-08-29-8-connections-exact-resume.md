---
type: measurement
id: 01m1hhwkrssaybjvfxzbwc0vjz
created: 2026-09-02T17:15:25.849650+00:00
updated: 2026-09-02T17:15:25.849650+00:00
summary: 'Parallel weight download (2026-08-29): 8 connections, exact resume'
date: 2026-08-29
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
note: Through 0.2.0 the eight connections were eight streams on one TCP connection; the "Hugging Face caps this client at 55 MB/s" reading was that one connection on a home link and is withdrawn in Corrections to earlier sections. The resume and hash-verification design stands.
order: '240'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
superseded_by:
- '[[records/measurements/the-fix-and-its-gates]]'
title: 'Parallel weight download (2026-08-29): 8 connections, exact resume'
status: superseded
---

The pull was one connection streaming one file at a time, which measured 28 to
40 MB/s and put the 103.8 GB download near an hour. Before changing it, the
question was where the ceiling actually is. Same 600 MB moved every time, from
distinct offsets, to `/dev/null`:

| connections | Hugging Face | note |
|---|---|---|
| 1 | 28 to 40 MB/s | |
| 4 | 54 to 57 MB/s | |
| 8 | 50 to 55 MB/s | |
| 16 | 53 MB/s | |
| 32 | 53 MB/s | |

The plateau starts at 4 and never moves. Three controls place it:
`https://ash-speed.hetzner.com/1GB.bin` gave **27 MB/s on one connection and
144 MB/s on eight**, so the link is not the limit; `hf_xet` 1.29.0, Hugging
Face's own fastest client speaking the native xet protocol, downloaded
model-00011 (2.19 GB) in 39.4 s, **55.7 MB/s**, the same number; and the
reconstruction endpoint shows why, since every xet chunk URL resolves to the
same `us.aws.cdn.hf.co` host the plain `resolve/` redirect lands on. The cap
is per-IP rather than per-repo: 4 connections to the mirror plus 4 to
pipenetwork gave 53.5 MB/s, no better than 8 to either alone, so sharding
across mirrors buys nothing. **About 55 MB/s is Hugging Face's number for this
client, and parallelism is what reaches it.**

The download is now 64 MB chunks from every file in one shared queue, drawn by
8 workers over one URLSession, so connections stay busy across file boundaries
and to the last byte. Each incomplete file keeps a `.partmap` beside its
`.part`: one byte per chunk, flushed every 2 s after an `fsync` of the data it
claims, so a map never promises bytes that are not on disk. Files are hashed
and renamed on a background queue the moment their last chunk lands, so
verification overlaps the download still running. `--connections N` and
`SLOTSTREAM_PULL_CONNECTIONS` override the default.

**The bug this found.** The first parallel build ran at 21 MB/s, slower than
some single-connection runs, and only 1 of the 6 small files ever renamed.
`session` was a `lazy var`, and Swift's lazy initialization is not thread-safe:
8 workers entering at once built several URLSessions, and `taskIdentifier` is
only unique within one session, so in-flight state collided and 5 of 8 workers
blocked forever on semaphores nothing would signal. 21 MB/s is 3/8 of the
plateau, which is exactly the three workers that survived. The session is now
built in `init`, and requests are keyed by an id the job assigns rather than
URLSession's numbering.

**Live, from scratch, against the real mirror:** 12.2 GB in 250 s (**48.8 MB/s**
including startup, steady state 50), then killed with `kill -9`. 7 files
complete, `model-00001.safetensors` among them: 10.04 GB assembled from 150
chunks fetched out of order across 8 connections, and it renamed, which only
happens after its sha256 equals the pinned upstream hash. Resuming reported
**91.9 GB to go** and continued `model-00002` from chunk 28 of 150, refetching
only the 8 chunks that were in flight when the process died.

**Full 24-file proof without spending 104 GB of network:** a Range-capable
local server over the existing copy, so the real pull path runs at SSD speed.
Pass 1 moved 99 GB in 45 s (**2.47 GB/s**, so the client is nowhere near being
the bottleneck at 55) and was killed mid-flight with 22 files complete and two
chunk maps at 95/153 and 19/33. Pass 2 computed **4.8 GB to go**, finished, and
the full re-hash returned **VERIFY PASS: all 24 files match the pinned
revision (103.8 GB)**. Battery 15/15 after the change.

Net effect: about **35 minutes instead of about 50** for a first install on
this link. The remaining headroom is not reachable on Hugging Face at any
connection count; it would take hosting the weights somewhere without that
cap, which the link would serve at 144 MB/s.
