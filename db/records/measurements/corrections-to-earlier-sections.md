---
type: measurement
id: 01m1hhwmfnyv5cppgf1cx5rxjd
created: 2026-09-02T17:15:26.581669+00:00
updated: 2026-09-02T17:15:26.581669+00:00
summary: Corrections to earlier sections
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M10
order: '550'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Corrections to earlier sections
status: analysis
---

- **"Hugging Face caps at 36 to 57 MB/s however many connections you open"**
  (README, CLAUDE.md, the parallel-download section above): withdrawn. That
  was one connection on a capped link.
- **"Cloudflare R2 tested and rejected"**: the comparison could not
  discriminate. It ran through `r2.dev`, which Cloudflare documents as
  rate-limited and bandwidth-throttled, from a link on which R2's real read
  path (62), Cloudflare's edge (57) and Hugging Face (55) land in one band.
  From Helsinki, R2 direct and Hugging Face both fill the port. The custom-
  domain path remains untested; it is not needed for speed, only for
  independence from Hugging Face.
- **"The link does 144 MB/s against Hetzner"**: could not be repeated. The
  Ashburn speed host now limits clients to two connections; its per-connection
  rate today (18.7 MB/s) matches the 08-29 run, so the link claim rests on that
  one measurement. Nothing else exceeded 62 MB/s from Popayán today.
- **The ETA hint** quoted 50 MB/s as the mirror's ceiling; it now quotes the
  fastest measured rate for this client, 100 MB/s on a gigabit link, and says
  so.
