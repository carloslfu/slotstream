---
type: measurement
id: 01m422jryz35frkf855mb66ekp
created: 2026-10-03T23:46:23.839686775+00:00
updated: 2026-10-03T23:46:23.839686775+00:00
summary: 'Existing-file reads on M4: all 36 physical-byte witnesses pass; three rounds at each queue depth, no observed swap.'
date: 2026-10-04
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb]]'
note: Readonly existing-file protocol; physical read deltas corroborate every point, hardware cache and background I/O uncontrolled; no inference speed prediction.
order: '1750'
runs: '[[sources/runs/2026/10/2026-10-04-mirror-physical-read-witness]]'
title: Physical read witnesses for the mirrored M4 disks
status: measured
---
On the Mac mini M4, three interleaved rounds of existing-checkpoint file reads passed every physical-device witness: all 36 points, queue depths 1/2/4/8/16/32, matched the requested read bytes within the declared 0.98–1.05 ratio interval. No new read errors or global swap were observed. Every point reads 6.636 GB after checked no-cache/no-readahead controls and read-only shared-map invalidation; file metadata is unchanged.

Single-reader medians were 3.037845336 GB/s external and 1.976707953 GB/s internal. At two readers, medians were 3.416623415 and 2.237490592 GB/s. External medians at four through 32 readers stayed about 3.43 GB/s; the internal medians at two through 16 readers were 2.22–2.24 GB/s. The linked run keeps all six queue-depth rows and every raw physical counter.

This qualifies this particular file-read protocol. It does not purport to measure a cold SSD or predict engine throughput; hardware cache and unrelated system I/O are uncontrolled. The earlier internal-file probe lacked sufficient physical-byte corroboration and is not included. Historical 3.18/1.81 GB/s notes have no retained fio run, so their public claim is withdrawn rather than reused as a current rating. The separately measured engine single/mirror experiment has its own executable identity and cache limits.
