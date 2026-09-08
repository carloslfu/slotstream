---
type: claim
id: 01m1hhwp7kh870p38d8b7mhhjs
created: 2026-09-02T17:15:28.371050+00:00
updated: 2026-09-08T22:35:06.518766+00:00
summary: One connection alone is bounded near 70 MB/s from a datacenter
basis: measured
gate: none
needle: 70 MB/s
note: Retired from the README when compressed CDN downloads became the default; the historical raw-transport measurement is preserved.
supported_by:
- '[[records/measurements/hugging-face-has-no-per-client-cap-the-home-link-has-one]]'
surfaces: README.md, docs/ENGINEERING.md, docs/GETTING-STARTED.md, docs/HARDWARE.md, docs/DOWNLOAD-FORMAT.md, docs/HERMES-NOTES.md
title: One connection alone is bounded near 70 MB/s from a datacenter
status: withdrawn
---

One connection to the Hugging Face bridge measured 72 MB/s from the Helsinki port and 25 to 40 from a home link 100 ms away: the 4 MiB receive window over round trip, not a server cap.
