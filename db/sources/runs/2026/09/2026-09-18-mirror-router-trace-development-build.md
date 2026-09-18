---
type: run
id: 01m2s4e4fsa3frmrc9g3jkm2ea
created: 2026-09-18T05:30:00.000000+00:00
updated: 2026-09-18T05:30:00.000000+00:00
summary: The router's own per-replica trace on a development build, including the queue depth at which reads are claimed
captured_at: 2026-09-18
command: SLOTSTREAM_MIRROR_DEBUG=1 .build/release/slotstream run --model /Volumes/llm/models/qwen38-flash-next-mlx-4bit --mirror /Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit --experts-per-layer 118 --max-context 8192 --mtp on --max-tokens 200 --greedy --seed 1 --prompt "<the MoE explanation prompt>"
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Mirror router trace on a development build
tool: slotstream run with the development router trace
---
The routing policy's own view of what it did, captured on a development build
that carried a debug trace behind `SLOTSTREAM_MIRROR_DEBUG`. The trace printed
one line per 20,000 claims with each replica's served bytes, read count,
measured throughput, busy time, reads in flight, and the distribution of the
queue depth observed at the moment each read was claimed.

**This run cannot be reproduced from the committed tree.** The trace was
removed before the commit, because nothing in the shipped code read its
counters and the repository's style rules do not keep an entity without a
caller. The binary that produced it was overwritten by the next build and its
hash was not recorded, so this run is evidence for the shape of the concurrency
and is deliberately not the source of any headline number. The shipped readout,
one `-- mirror split:` line at the end of a run, and the device-side witness in
[[sources/runs/2026/09/2026-09-18-mirror-iostat-device-witness]] are what a
reader can reproduce.

Two things in the trace matter. First, the two replicas converge on stable and
very different per-replica rates, roughly 3.0 and 1.4 GB/s, which is the
routing policy measuring the asymmetry of the two disks rather than being told
about it. Second, the depth-at-claim histogram shows that 86% of early claims
see a queue depth of exactly 10, and the distribution never spreads much past
that even though `SLOTSTREAM_POOL_QUEUE_DEPTH` is 32. The ceiling comes from
`concurrentPerform` over this machine's 10 cores, not from the pool setting, so
raising the pool depth alone does not put more reads in flight.

## The trace

```text
=== router trace ===
mirror claims=20000 served=[3.82 GB, 1.59 GB] reads=[10766, 9224] rate=[3.38 GB/s, 1.45 GB/s] busy=[1.129 s, 1.101 s] inflight=[5, 5] depth-at-claim 1:0% 2:2% 3:0% 4:1% 5:1% 6:1% 7:1% 8:1% 9:3% 10:86%
mirror claims=40000 served=[8.02 GB, 3.53 GB] reads=[21114, 18876] rate=[3.28 GB/s, 1.48 GB/s] busy=[2.448 s, 2.380 s] inflight=[4, 6] depth-at-claim 1:0% 2:2% 3:1% 4:1% 5:1% 6:1% 7:1% 8:1% 9:3% 10:86%
mirror claims=60000 served=[12.24 GB, 5.46 GB] reads=[31838, 28152] rate=[3.24 GB/s, 1.49 GB/s] busy=[3.772 s, 3.669 s] inflight=[7, 3] depth-at-claim 1:0% 2:2% 3:1% 4:1% 5:1% 6:1% 7:1% 8:1% 9:3% 10:85%
mirror claims=80000 served=[16.39 GB, 7.25 GB] reads=[42892, 37098] rate=[3.18 GB/s, 1.48 GB/s] busy=[5.156 s, 4.902 s] inflight=[4, 6] depth-at-claim 1:1% 2:3% 3:2% 4:2% 5:2% 6:2% 7:1% 8:1% 9:3% 10:71% 11:0% 12:0% 13:0% 14:0% 15:0% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=100000 served=[20.49 GB, 8.97 GB] reads=[54365, 45625] rate=[3.12 GB/s, 1.46 GB/s] busy=[6.572 s, 6.157 s] inflight=[7, 3] depth-at-claim 1:2% 2:4% 3:3% 4:3% 5:3% 6:3% 7:2% 8:2% 9:3% 10:61% 11:1% 12:1% 13:1% 14:0% 15:1% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=120000 served=[24.61 GB, 10.76 GB] reads=[65639, 54357] rate=[3.09 GB/s, 1.44 GB/s] busy=[7.972 s, 7.455 s] inflight=[3, 1] depth-at-claim 1:2% 2:4% 3:4% 4:4% 5:4% 6:3% 7:3% 8:3% 9:4% 10:55% 11:2% 12:1% 13:1% 14:0% 15:1% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=140000 served=[28.77 GB, 12.41 GB] reads=[77451, 62548] rate=[3.05 GB/s, 1.42 GB/s] busy=[9.447 s, 8.713 s] inflight=[1, 0] depth-at-claim 1:3% 2:5% 3:4% 4:4% 5:4% 6:4% 7:3% 8:3% 9:4% 10:50% 11:2% 12:1% 13:1% 14:1% 15:1% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=160000 served=[32.88 GB, 14.09 GB] reads=[89165, 70834] rate=[3.02 GB/s, 1.41 GB/s] busy=[10.892 s, 9.976 s] inflight=[1, 0] depth-at-claim 1:3% 2:5% 3:5% 4:5% 5:5% 6:4% 7:4% 8:3% 9:4% 10:46% 11:2% 12:1% 13:1% 14:1% 15:1% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=180000 served=[36.98 GB, 15.72 GB] reads=[100932, 79061] rate=[3.00 GB/s, 1.40 GB/s] busy=[12.342 s, 11.240 s] inflight=[4, 3] depth-at-claim 1:4% 2:5% 3:5% 4:5% 5:5% 6:5% 7:4% 8:3% 9:4% 10:43% 11:2% 12:1% 13:1% 14:1% 15:1% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=200000 served=[41.09 GB, 17.42 GB] reads=[112560, 87435] rate=[2.98 GB/s, 1.39 GB/s] busy=[13.769 s, 12.519 s] inflight=[2, 3] depth-at-claim 1:4% 2:5% 3:5% 4:6% 5:6% 6:5% 7:4% 8:4% 9:4% 10:41% 11:2% 12:1% 13:1% 14:1% 15:1% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=220000 served=[45.24 GB, 19.02 GB] reads=[124372, 95625] rate=[2.97 GB/s, 1.38 GB/s] busy=[15.252 s, 13.793 s] inflight=[1, 2] depth-at-claim 1:4% 2:6% 3:6% 4:6% 5:6% 6:5% 7:5% 8:4% 9:4% 10:39% 11:3% 12:2% 13:1% 14:1% 15:0% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=240000 served=[49.44 GB, 20.60 GB] reads=[136275, 103715] rate=[2.95 GB/s, 1.37 GB/s] busy=[16.762 s, 15.052 s] inflight=[5, 5] depth-at-claim 1:4% 2:6% 3:6% 4:6% 5:6% 6:5% 7:5% 8:4% 9:4% 10:38% 11:3% 12:2% 13:1% 14:1% 15:0% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=260000 served=[53.60 GB, 22.16 GB] reads=[148329, 111668] rate=[2.93 GB/s, 1.36 GB/s] busy=[18.278 s, 16.295 s] inflight=[2, 1] depth-at-claim 1:4% 2:7% 3:6% 4:7% 5:6% 6:5% 7:5% 8:4% 9:4% 10:36% 11:2% 12:2% 13:1% 14:1% 15:0% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
mirror claims=280000 served=[57.78 GB, 23.81 GB] reads=[160013, 119977] rate=[2.92 GB/s, 1.35 GB/s] busy=[19.764 s, 17.569 s] inflight=[7, 3] depth-at-claim 1:4% 2:7% 3:6% 4:7% 5:6% 6:5% 7:5% 8:4% 9:4% 10:35% 11:3% 12:2% 13:1% 14:1% 15:0% 16:1% 17:0% 18:0% 19:0% 20:0% 21:0% 22:0% 23:0% 24:0% 25:0% 26:0% 27:0% 28:0% 29:0%
```

## Timings and devices on the same run

```text
=== timings ===
-- prefill 47 tok in 5.62s (8.4 tok/s)
-- prefill split: io 3.90s + scatter 0.01s | 6539 records (18.1 GB, 4.6 GB/s)
-- decode 200 tok in 27.07s (7.39 tok/s)
-- decode split: io 7.47s + scatter 0.10s | 8350 records | mtp 105/190 drafts accepted (55%), 95 verify passes
=== devices ===
sustained over 33 s: disk0 786 MB/s, disk4 1798 MB/s, total 2.58 GB/s, split disk4 69.6% / disk0 30.4%
=== generated text digest (A/B baseline is 0e6bb58bd963501f1f512ecc498ab9c0) ===
d41d8cd98f00b204e9800998ecf8427e
```

The digest line in this harness reads `d41d8cd98f00b204e9800998ecf8427e`, which
is the MD5 of an empty input. The harness extracted the generated text from the
stderr file, where the tokens are not, so the digest compared nothing against
nothing. It is kept here as captured. The working text comparison is the one in
[[sources/runs/2026/09/2026-09-18-mirror-decode-ab-three-rounds]], which hashes
the stdout file directly.
