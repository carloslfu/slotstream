---
type: run
id: 01m422gmwxgwcv11g9w7pf3655
created: 2026-10-03T23:45:14.141136233+00:00
updated: 2026-10-03T23:46:23.717011663+00:00
summary: 'Three-round file-read protocol on M4: all 36 physical-byte witnesses pass, with no added read errors or global swap.'
binary: f2eacfb8f2d6cd393e6d6be9faa7c9519c02ecfd3671cb3e16d1e04dc6d29ebc
captured_at: 2026-10-03
command: physical-disk.py; exact per-point commands retained in sources/artifacts/mirror-qualified-20261004/disk/points.jsonl
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Physical read witnesses for mirrored checkpoint disks on Mac mini M4
tool: Read-only seeded pread helper and IOBlockStorageDriver counters
---
The Mac mini M4 has an internal Apple SSD and an external WD_BLACK SN8100 on Thunderbolt 4. The three-round file-read protocol was frozen before execution. It reads the existing first checkpoint shard without changing its payload or metadata, with checked F_NOCACHE=1 and F_RDAHEAD=0, a read-only MAP_SHARED mapping and MS_INVALIDATE before each timed point. Each point reads 2,400 records of 2,764,800 bytes (6,635,520,000 bytes); queue depths are 1, 2, 4, 8, 16 and 32. Device order alternates and the second round reverses the queue-depth order.

All 36 points completed. Every point's IOBlockStorageDriver physical read delta corroborates the requested logical bytes: ratios range from 1.000000000 to 1.000076543, inside the prospectively declared 0.98–1.05 interval. No additional device read errors or global swap were observed. The two-second idle counter sample is retained, as are both disks' before/after counters and VM snapshots for every point.

| Concurrent readers | External median GB/s | Internal median GB/s |
|---:|---:|---:|
| 1 | 3.037845336 | 1.976707953 |
| 2 | 3.416623415 | 2.237490592 |
| 4 | 3.433627769 | 2.222968179 |
| 8 | 3.432432419 | 2.236099443 |
| 16 | 3.433055744 | 2.220614388 |
| 32 | 3.429225252 | 2.156562978 |

These are rates for this seeded existing-file pread protocol, not a universal disk specification or an inference-throughput prediction. SSD hardware cache and system background I/O are uncontrolled. Read-only invalidation plus physical-byte corroboration addresses the earlier file-cache counterexample; the earlier uncorroborated internal-file timings are not pooled into these medians.

The historical 3.18/1.81 GB/s fio figures lack their original raw run and are withdrawn from the current CLI hardware description. This experiment does not establish why different historical protocols reported different rates.

Helper binary SHA256: `f2eacfb8f2d6cd393e6d6be9faa7c9519c02ecfd3671cb3e16d1e04dc6d29ebc`.
Helper C source SHA256: `af2c9fbd62a94a2a0a05d4891ca38f50a761eb7985b22c6254062a5b4bc3602e`.
Compile command: `cc -O2 -Wall -Wextra -pthread disk-read-invalidated.c -o disk-read`. The exact per-point invocations, source, compiler environment and raw witnesses are retained in the [artifact manifest](../../../artifacts/mirror-qualified-20261004/SHA256SUMS), [protocol](../../../artifacts/mirror-qualified-20261004/disk/protocol.json), [points](../../../artifacts/mirror-qualified-20261004/disk/points.jsonl) and [summary](../../../artifacts/mirror-qualified-20261004/disk/summary.json). Capture is October 3 UTC / October 4 Europe/Berlin, after all f37412f weights-free gates passed and before its model-copy verification and paired inference.
