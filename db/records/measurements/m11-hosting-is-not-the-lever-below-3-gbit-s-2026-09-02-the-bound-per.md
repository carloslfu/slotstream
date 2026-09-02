---
type: measurement
id: 01m1hhwmhsz49stbrh8erdfvg6
created: 2026-09-02T17:15:26.649507+00:00
updated: 2026-09-02T17:15:26.649507+00:00
summary: 'M11 — Hosting is not the lever below ~3 Gbit/s (2026-09-02): the bound per link speed, the bridge versus Hugging Face''s own edge, and what the default leaves on the table'
date: 2026-09-02
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M11
order: '580'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'M11 — Hosting is not the lever below ~3 Gbit/s (2026-09-02): the bound per link speed, the bridge versus Hugging Face''s own edge, and what the default leaves on the table'
status: measured
---

M10 fixed the client and left one question open: could any hosting (R2, Vercel
Blob, a CDN at the edge) make the 103.8 GB pull faster than Hugging Face does?
This section answers it from the transfer chain, vendor documentation, and
live DNS/HTTP checks made on 2026-09-02. No new transfer was measured; every
throughput number below is from M10 or is derived, and is labelled as such.
