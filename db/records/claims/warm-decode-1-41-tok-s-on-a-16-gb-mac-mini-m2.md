---
type: claim
id: 01m1jpreawk11zaeesw8wedvfk
created: 2026-09-03T03:59:46.524613+00:00
updated: 2026-09-03T03:59:46.524613+00:00
summary: Warm decode 1.41 tok/s on a base-storage Mac mini M2, 16 GB — the first community measurement of a tier row.
basis: measured
gate: none
needle: 1.41 tok/s
supported_by: '[[records/measurements/c1-mac-mini-m2-16gb-base-storage-community-2026-09-02]]'
surfaces: README.md, docs/HARDWARE.md
title: Warm decode 1.41 tok/s on a 16 GB Mac mini M2
status: current
---
Warm decode on the first community-measured Mac: three identical runs at
1.41 tok/s, against the ~4 tok/s the tier table estimates for 16 GB.

The gap is bandwidth, not cache size. At a 0.434 decode hit rate the machine
reads 751 MB per token, and its disk delivers 1.5 GB/s, so 501 ms of every
709 ms step is IO and the IO-only ceiling is 2.00 tok/s — below the estimate
the planner printed. Full derivation in
[[records/measurements/c1-mac-mini-m2-16gb-base-storage-community-2026-09-02]].

No gate: this is one reporter's machine and nothing in CI can reproduce it.
It moves only if that reporter re-measures, and the number is theirs.
