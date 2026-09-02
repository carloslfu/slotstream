---
type: decision
id: 01m1hhwpg2thqfn5h6jqyd3hg4
created: 2026-09-02T17:15:28.642131+00:00
updated: 2026-09-02T17:15:28.642131+00:00
summary: Hosting the weights elsewhere is not a download-speed lever below about 3 Gbit/s per client
decided_on: 2026-09-02
evidence:
- '[[records/plan/n3-and-n4-removed-from-the-queue-2026-08-30]]'
- '[[records/measurements/corrections-to-earlier-sections]]'
- '[[records/measurements/the-bound-per-client-link]]'
- '[[records/measurements/hosting-from-first-principles-and-the-vendors-own-documentation]]'
reversible_if: an audience above about 3 Gbit/s per client matters and a rented 10 Gbit/s hour shows the Xet edge beating the resolve bridge for it
title: Hosting the weights elsewhere is not a download-speed lever below about 3 Gbit/s per client
status: standing
---

N3 was removed from the queue on 2026-08-30 and the reasoning was corrected and re-founded on 2026-09-01 and 2026-09-02: the one-connection client was the real bottleneck, and once fixed, Hugging Face, R2 direct, and Cloudflare's edge all fill a 1 Gbit/s port while every home link caps them alike. R2 stays a possible independence play at about US$1.60 a month, never a speed play.
