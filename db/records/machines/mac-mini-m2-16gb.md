---
type: machine
id: 01m1jpm02tb9h0r6q6rgerrqq2
created: 2026-09-03T03:57:20.858612+00:00
updated: 2026-09-03T03:57:20.858612+00:00
summary: 'A base-storage Mac mini M2, 16 GB, internal 256 GB SSD, macOS 26.6.2: the first community-reported machine and the first real hardware behind a tier row other than 48 GB.'
chip: Apple M2
kind: mac
link: https://github.com/carloslfu/slotstream/issues/5
os: macOS 26.6.2
ram_gb: '16'
ssd: internal 256 GB, base storage (single NAND die)
title: Mac mini, Apple M2, 16 GB (community)
---
The first machine in this store that is not the author's. A base-storage Mac
mini M2 reported through [[sources/community/2026/09/2026-09-02-mac-mini-m2-16gb-flol]],
and the first real hardware behind any tier row other than 48 GB.

What makes it worth a record is the SSD. 256 GB is the base configuration,
which Apple builds with a single NAND die, and slotstream's read path measured
**1.5 GB/s** on it against **17.3 GB/s** on the dev Mac — a factor of 11.5.
Every tier row below 48 GB was extrapolated from a curve that never saw a disk
this slow, and on this machine the disk, not the cache size, sets warm decode.

The drive's own ceiling was not measured independently: 1.5 GB/s is what
slotstream's `pread` path achieved, not a `coldread` figure. Public
benchmarks for this storage configuration sit near the same number, which is
consistent with the path being close to saturated here, but that is inference
and `Tools/coldread.c` on this machine is the measurement that would settle it.
