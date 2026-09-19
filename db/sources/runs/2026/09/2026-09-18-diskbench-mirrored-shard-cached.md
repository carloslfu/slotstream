---
type: run
id: 01m2s4e4fs1rm7wc19n990f4kr
created: 2026-09-18T05:35:00+00:00
updated: 2026-09-19T15:15:18.685158196+00:00
summary: diskbench across both copies of a checkpoint shard, discarded because F_NOCACHE did not evict the pages the file already had in the buffer cache
binary: Tools/diskbench.c development build; executable hash not recorded
captured_at: 2026-09-18
command: cc -O2 -o /tmp/diskbench Tools/diskbench.c -lpthread && /tmp/diskbench /Volumes/llm/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors /Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors
discarded: 'true'
machines: '[[records/machines/mac-mini-m4-32gb]]'
note: Every F_NOCACHE figure in this run is above the hardware ceiling because the 10.0 GB shard was already resident in the buffer cache; kept as the evidence behind the caution in the tool's header.
title: diskbench on a mirrored shard, cache-contaminated
tool: Tools/diskbench.c
---
`Tools/diskbench` extended to take a second path and report the share of bytes
each copy served, run against shard 1 of the checkpoint on both disks.

**The numbers in this run are not disk speed and must not be quoted.** The
`F_NOCACHE` section reports up to 8.40 GB/s, which is above the 4.99 GB/s the
two devices can deliver together, so the reads were not reaching the devices.
`F_NOCACHE` tells the kernel not to cache *new* reads of a descriptor; it does
not evict pages the file already has in the buffer cache from earlier reads.
This shard is 10.0 GB against 34 GB of RAM, so a previous pass had left most of
it resident and the benchmark measured memory.

The run is kept because it is the reason the tool now carries that caution in
its header, and because it shows the failure clearly: a measurement is only
trustworthy here when the working set is larger than RAM, which is how the
`fio` calibration behind [[records/machines/mac-mini-m4-32gb]] was done (55 GB
of shards against 34 GB of RAM, with `iostat` as an external witness).

The share-of-bytes matrix in the last section is structurally informative even
though its rates are not: at queue depth 1 a single reader puts everything on
one replica, and from depth 2 on the split settles near 74% / 26%, which is the
same shape the routing policy produces on a real run. That is a weak
observation from a contaminated run, not evidence; the device-side split is
measured in
[[sources/runs/2026/09/2026-09-18-mirror-iostat-device-witness]].

## Output as captured

```text
file: /Volumes/llm/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors (10.0 GB)
mirror: /Users/qian/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors (10.0 GB)
page size: 16384

== sequential ==
  1 MiB reads, F_NOCACHE :   3.03 GB/s
  1 MiB reads, cached    :   3.44 GB/s

== random pread, F_NOCACHE ==
record              QD1    QD2    QD4    QD8    QD16   QD32    (GB/s)
expert 2.7648MB     2.00   6.32   7.65   8.25   8.36   8.40 
expert pad 16K      4.76   6.42   8.24   8.40   8.16   8.30 
4 KiB               0.15   0.30   0.60   0.98   1.31   1.60 
16 KiB              0.51   0.98   1.87   3.68   5.17   6.24 
64 KiB              1.59   2.99   4.44   6.66   7.29   7.61 
1 MiB               4.22   6.09   7.98   8.37   8.29   8.40 

== random pread, page-cached ==
record              QD1    QD2    QD4    QD8    QD16   QD32    (GB/s)
expert 2.7648MB     5.19   9.95  13.72  20.93  19.32  19.58 
expert pad 16K      7.36  16.06  21.74  29.65  26.41  29.08 
4 KiB               0.41   0.88   1.70   3.01   4.04   4.45 
16 KiB              2.04   4.01   7.87  13.12  16.91  17.08 
64 KiB              4.67   9.36  16.79  27.08  37.26  40.49 
1 MiB              14.64  32.05  47.50  49.00  45.17  43.89 

== share of bytes on /Volumes/llm/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors, F_NOCACHE ==
record              QD1    QD2    QD4    QD8    QD16   QD32 
expert 2.7648MB       0%    80%    74%    74%    73%    74% 
expert pad 16K      100%    82%    75%    74%    73%    73% 
4 KiB                99%   100%    98%    97%    83%    80% 
16 KiB              100%   100%   100%   100%    90%    87% 
64 KiB              100%   100%    89%    87%    84%    81% 
1 MiB               100%   100%    77%    75%    74%    74% 

== single-read latency (QD1, F_NOCACHE) ==
  expert 2.7648MB      0.119 ms/read
  expert pad 16K       0.119 ms/read
  4 KiB                0.001 ms/read
  16 KiB               0.001 ms/read
  64 KiB               0.003 ms/read
  1 MiB                0.045 ms/read
```
