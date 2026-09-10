---
type: run
id: 01m1na37wwrbtzfzeekjxzn04d
created: 2026-09-04T04:16:12.187782+00:00
updated: 2026-09-04T04:16:12.187782+00:00
summary: 'Expert-record read layout: nine pieces against one packed read, by run length, dev Mac, 2026-09-03'
binary: Tools/coldread and Tools/layoutbench, both cc -O2 on this Mac; no model process (the lock was held by an idle server)
captured_at: 2026-09-03
command: Tools/coldread <rsize> 12 <5 shards>; Tools/layoutbench <mode 0|1|2> <runlen> 12 <5 shards>
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Expert-record read layout: nine pieces against one packed read, by run length, dev Mac, 2026-09-03'
tool: run
---

## Conditions

The dev Mac was **not quiet**: load average 7.0–7.9 throughout, and an idle
`slotstream serve --memory-gb 10 --port 11471` (752 MB RSS, orphaned to
launchd) was holding the model lock, so no model process could run alongside.
Absolute GB/s here is therefore a **lower bound**. The finding is the
**ratio** between arms, which were run back to back in the same conditions and
reproduced across two capture sessions an hour apart (the earlier, quieter
session read 15.08/15.12/9.76 GB/s at runlen 1 against 13.57/13.71/7.08 here).

`Tools/coldread` is unchanged. `layoutbench.c` is new: it reads the real shard
bytes at the real piece sizes, never the same offset twice, `F_NOCACHE` +
`F_RDAHEAD 0`, and differs from `coldread` only in issuing a *record's* reads
the way the engine issues them.

## Raw output

```
# machine state at capture
Thu Sep  3 23:13:36 -05 2026
23:13  up 12 days, 12:25, 2 users, load averages: 7.07 7.50 6.09
reclaimable 18.1 GB
40659 .build/release/slotstream serve --memory-gb 10 --port 11471

# A. cold read rate by record size (Tools/coldread, F_NOCACHE, never-repeat, 5 shards, qd 12)
rsize=51200     qd=12       2.97 GB/s      58.0 kIOPS     17.2 us/read  (3.07 GB read)
rsize=102400    qd=12       7.04 GB/s      68.8 kIOPS     14.5 us/read  (6.14 GB read)
rsize=307200    qd=12      12.82 GB/s      41.7 kIOPS     24.0 us/read  (18.43 GB read)
rsize=819200    qd=12      14.88 GB/s      18.2 kIOPS     55.0 us/read  (49.15 GB read)
rsize=2764800   qd=12      15.72 GB/s       5.7 kIOPS    175.9 us/read  (8.29 GB read)
rsize=26214400  qd=12      16.26 GB/s       0.6 kIOPS   1612.2 us/read  (78.64 GB read)

# B. the expert record's own layout: 9 pieces (3 x 819,200 + 6 x 51,200) vs one packed 2,764,800 B read
#    runlen = consecutive experts covered by one pread, i.e. what the sweep's contiguous runs give it
packed(1 pread/record)     runlen=1  qd=12   13.57 GB/s      203.8 us/record   (11.06 GB)
packed-run(1 pread/run)    runlen=1  qd=12   13.71 GB/s      201.6 us/record   (11.06 GB)
9-piece(3 big + 6 small)   runlen=1  qd=12    7.08 GB/s      390.6 us/record   (11.06 GB)
packed(1 pread/record)     runlen=2  qd=12   13.39 GB/s      206.6 us/record   (11.06 GB)
packed-run(1 pread/run)    runlen=2  qd=12   14.71 GB/s      187.9 us/record   (11.06 GB)
9-piece(3 big + 6 small)   runlen=2  qd=12   10.50 GB/s      263.4 us/record   (11.06 GB)
packed(1 pread/record)     runlen=4  qd=12   13.56 GB/s      203.9 us/record   (11.06 GB)
packed-run(1 pread/run)    runlen=4  qd=12   15.50 GB/s      178.3 us/record   (11.06 GB)
9-piece(3 big + 6 small)   runlen=4  qd=12   11.80 GB/s      234.3 us/record   (11.06 GB)
packed(1 pread/record)     runlen=8  qd=12   13.19 GB/s      209.6 us/record   (11.06 GB)
packed-run(1 pread/run)    runlen=8  qd=12   15.78 GB/s      175.2 us/record   (11.06 GB)
9-piece(3 big + 6 small)   runlen=8  qd=12   13.54 GB/s      204.2 us/record   (11.06 GB)
packed(1 pread/record)     runlen=16 qd=12   13.02 GB/s      212.3 us/record   (11.06 GB)
packed-run(1 pread/run)    runlen=16 qd=12   15.23 GB/s      181.5 us/record   (11.06 GB)
9-piece(3 big + 6 small)   runlen=16 qd=12   14.03 GB/s      197.0 us/record   (11.06 GB)
```

## What it says

**The size curve.** The device saturates by 819 KB and is flat to 26 MB
(14.9 → 15.7 → 16.3 GB/s). Below that it falls off a cliff: a 51,200 B read —
which is exactly one expert's `scales` or `biases` row — runs at **2.97 GB/s**.
Six of the nine pieces in an expert record are that size. They are 11% of the
record's bytes and, at run length 1, **49% of its read time**.

**The layout penalty, and that it is a function of run length.**

| consecutive experts per pread | one packed 2.76 MB read | the 9 pieces the engine reads | penalty |
|---|---|---|---|
| 1 (the pool path — decode) | 13.71 GB/s | **7.08** | **×1.94** |
| 2 | 14.71 | 10.50 | ×1.40 |
| 4 | 15.50 | 11.80 | ×1.31 |
| 8 | 15.78 | 13.54 | ×1.17 |
| 16 | 15.23 | 14.03 | ×1.09 |

Run length is set by how densely a pass routes: for a routed fraction `p` the
expected run is `1/(1-p)`. At the ~60% a single pass routes, runs are ~2.5 and
the penalty is ~×1.35 — which is exactly the gap between the sweep's measured
11–13 GB/s and the device. **So the sweep is already at 80–90% of what this
file layout can deliver, and the remaining bandwidth is not available by
tuning.** It is available only by reading fewer bytes, or by reading denser
runs — and reading denser runs is a free side effect of reading a layer's
experts once per prompt instead of once per pass, which takes `p` toward 1.

**Two corrections to what is currently written down.**

1. MEASUREMENTS' "reads stop at 11–13 GB/s against the 17.3 the SSD delivers"
   overstates the headroom. 17.3 GB/s did not reproduce in either session
   (13.4–16.3 GB/s across QD4–64 and 819 KB–26 MB). The machine was loaded, so
   this is not a refutation — but the number is quoted on `doctor`'s disk line
   and needs a quiet re-measurement before it is quoted again.
2. "Nine ~307 KB pieces per record" (stated in both the decode split and the
   sweep section) is the mean, and the mean is what hides the finding: the
   pieces are 3 × 819,200 B and 6 × 51,200 B, and the small six cost half the
   read time at run length 1.

**Where the repack is worth something.** The M2 container is a ×1.94 lever on
the *pool* path — decode, whose split puts 44% of its time in these reads —
and a ×1.1–1.35 lever on the sweep, falling toward ×1.09 as routing density
rises. It is a decode item, not a prefill item.
