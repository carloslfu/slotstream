---
type: measurement
id: 01m1hhwkx3hnsmjk0mnv8sbrmq
created: 2026-09-02T17:15:25.987896+00:00
updated: 2026-09-02T17:15:25.987896+00:00
summary: 'Weights hosting: Cloudflare R2 tested and rejected (2026-08-29)'
date: 2026-08-29
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
note: 'Withdrawn 2026-09-01: the comparison ran through r2.dev, which Cloudflare rate-limits, from a link on which every host lands in one band; from a 1 Gbit/s port R2 direct and Hugging Face both fill the port. R2 is not needed for speed, only for independence from Hugging Face.'
order: '320'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Weights hosting: Cloudflare R2 tested and rejected (2026-08-29)'
withdrawn_by:
- '[[records/measurements/corrections-to-earlier-sections]]'
status: withdrawn
---

The section above ends on an open question — the link has headroom Hugging Face
will not give, so *host the weights somewhere without that cap*. Cloudflare R2 is
the obvious candidate: zero egress at any volume, ~$1.50/month for 104 GB. It was
tested against a real bucket rather than argued about, and **it does not lift the
cap**.

Method: a throwaway public R2 bucket in the author's own Cloudflare account, a
256 MB random object plus four distinct 64 MB objects, `curl` to `/dev/null`,
8 connections, compared same-session against Hugging Face and against a raw
datacenter host (Hetzner Ashburn) standing in for "what the link can actually do".

| source | 1 connection | 8 connections |
|---|---|---|
| Hetzner US-East (raw datacenter, no CDN) | 21.9 MB/s | **133.8 MB/s** |
| Hugging Face | 28 to 40 MB/s | 36.5 MB/s |
| Cloudflare R2 via `r2.dev` | 28 cold / 36 warm | **50.9** (one object) / **42.4** (four objects) |

Three things fall out of this.

**R2 ties Hugging Face; it does not beat it.** Both sit in a 36 to 51 MB/s band
while the same link sustains 133.8 to a plain datacenter host. Switching hosts
buys nothing measurable.

**The cap is not per-object.** Spreading 8 connections across four distinct
objects — the shape of the real 24-file pull — measured *lower* (42.4) than
hammering one (50.9), so no download-client change routes around it.

**The one untested path is a custom domain.** Only `r2.dev` could be measured, and
Cloudflare documents it as development-only and rate-limited; the unthrottled path
is a custom domain on a Cloudflare zone. None of the author's domains are on
Cloudflare DNS (Namecheap and Vercel), so testing it requires a zone migration
first. That is the only remaining reason to think R2 might still win.

Two by-products worth keeping:

- **Upstream from this location is 5.0 MB/s** (measured pushing the 256 MB object).
  Populating a 104 GB bucket from here would take about 5.8 hours, so any future
  migration has to be driven from a machine with a real uplink, not this one.
- **Both CDN paths cap in the same band while a raw host does 133.8.** That may be
  ISP shaping of CDN traffic, or edge-side per-client shaping, or Popayán peering.
  It is one link in Colombia, so it is *not* evidence about what users elsewhere
  see from either host — which is also why hosting should not be re-litigated on
  this measurement alone.

**Decision: stay on Hugging Face.** It is free, already mirrored under the author's
own account, already covered by the ordered fallback list and the compiled-in
sha256 manifest, and measurably no slower. Revisit only on real reports of slow
downloads from other geographies, and then by testing an R2 custom domain.
