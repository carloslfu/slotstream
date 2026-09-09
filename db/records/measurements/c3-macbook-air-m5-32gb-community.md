---
type: measurement
id: 01m21s4mx7p21drh7p2jr8schj
created: 2026-09-09T00:30:00.103218+00:00
updated: 2026-09-09T00:30:00.103218+00:00
summary: 'C3: MacBook Air M5, 32 GB (community, 2026-09-07)'
date: 2026-09-07
doc: measurements
level: '2'
machines: '[[records/machines/macbook-air-m5-32gb]]'
order: '716'
title: 'C3: MacBook Air M5, 32 GB (community, 2026-09-07)'
status: measured
---
Reported by `@arczhi` in [issue #12](https://github.com/carloslfu/slotstream/issues/12),
preserved in [[sources/community/2026/09/2026-09-07-macbook-air-m5-32gb-arczhi]].

MacBook Air M5 (2026), 32 GB, 1 TB SSD, macOS 26.6.2, reported Slotstream
0.2.11. The report does not specify whether the model was on internal or
external storage. It uses a 22 GB plan, with about 75 experts per layer
planned and a 2048-token prefill chunk.

Three identical requests to one running server returned **6.29, 6.28, and
6.22 tok/s**. The public hardware row uses **6.22 tok/s**, the third request,
matching the measurement procedure. The short cold run returned 6.60 tok/s
and a 15.7 GB process RSS peak; it is not the warm result or long-prompt peak.

The long-prompt command explicitly sets a 22 GB target, vision off, MTP off,
8192 tokens, and physical-footprint sampling. The reported JSON completed
without aborting: 8192 prefill tokens in 64.8707 seconds at 126.28197 tok/s,
process RSS peak 17.75475 GB, and sampled physical-footprint peak 20.58214 GB.
The full hardware row rounds prefill to **126.28 tok/s** and process RSS to
**17.75 GB**. RSS and physical footprint are different metrics, not interchangeable
versions of the same peak. The exact command and output remain in the source.

The reported maximum context and memory plan differ from the default setup;
these results do not establish the cost of the default or every larger
conversation. The warm requests' full launch command and system load were
not supplied. This review verified that `--sample-footprint` exists in the
published v0.2.11 source, but did not independently rerun the reporter's binary.

This adds a real 32 GB Mac to the hardware reports. It does not turn the
planner's roughly 9 tok/s estimate into a measurement, or isolate the effects
of chip, cooling, storage, context, and settings from one another.
