---
type: measurement
id: 01m1hsay9zxe2z297wwvcsnszb
created: 2026-09-02T19:25:35.423760+00:00
updated: 2026-09-02T19:25:35.423760+00:00
summary: 'What set the knobs: group size, lanes, recycling, the cache cap, admission, and the n-gram rows'
date: 2026-09-02
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: N2
order: '690'
title: 'What set the knobs: group size, lanes, recycling, the cache cap, admission, and the n-gram rows'
status: measured
runs:
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-8k-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-prose-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-check]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-context-check-8192-16gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-floor-and-10gb]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-ladder-60-per-layer]]'
- '[[sources/runs/2026/09/2026-09-02-prefill-sweep-tuning]]'
---
Every knob was set by an A/B on the 8,073-token acceptance prompt at a 16 GB
target (a 1024-token pass, 54 experts per layer), one round per arm unless
stated, interleaved, `SLOTSTREAM_SWEEP_TRACE=1` splitting the pass into reads,
time spent waiting for the GPU, the CPU row sort, copies out of the pool, and
the rest.

**Where the time goes.** Reads 22.4 s, waiting for the GPU 1.6 s, sorting
0.02 s, copies out of the pool 1.0 s, everything else 20.1 s, for 43.5 s in
all. The group loop is bound by the reads: the GPU finishes a group before
the next one is in, so the sweep waits for it 4% of the time. The 20 s that
are neither is serial by construction — the router, attention, and the
layer's tail run while no read is outstanding, because the next layer's
experts are not known until its router has run. Reads move at 11–13 GB/s
against the 17.3 the SSD delivers on 2.7 MB records; runs are cut by the
resident experts between them and by the six small scale/bias pieces per
record.

**Group size** (`SLOTSTREAM_EXPERT_LOAD_BATCH`, the experts per staging group):

| group | prefill | peak RSS |
|---|---|---|
| 16 | 183.3 tok/s | 13.0 GB |
| **32** | 169.9 | 13.2 |
| 64 | 158.5 | 13.7 |
| 128 | 160.6 | 14.1 |

Reads are flat (22.9–24.1 s) at every size; the rest grows with the group,
and so does the peak. 16 and 32 tie inside the run-to-run band (the 32 default
read 174–195 in the paired rounds); the documented default stays at 32.

**Read parallelism** (`SLOTSTREAM_IO_QUEUE_DEPTH`): 4 lanes read 39.1 s for
120.6 tok/s, 12 read 23.5 s for 179.3, 32 read 24.4 s for 162.5. The default
of 12 stands, on contiguous runs as it did on the nine-piece reads.

**Staging buffer recycling was built, measured, and dropped.** The hypothesis
was that a fresh 88 MB set per group paid a page fault per 16 KiB and an unmap
on release, some 270 GB of both per prompt. Recycling the sets through the
arrays' finalizers changed the read time not at all (23.6 s against 22.7) and
cost 6% of prefill (163.6 / 166.1 tok/s against 177.5 / 174.2 in two paired
rounds) plus 0.3 GB of peak from the sets it held. Whatever the reads are
waiting on, it is not page faults.

**The MLX buffer cache is capped while a small target reads a prompt.** The
sweep allocates arrays whose sizes vary from group to group, and MLX's cache
keeps every freed size up to its 2 GB limit: the trace read the cache at
2.16 GB by the end of every long prompt, which is where the sweep's higher
peak came from (13.2 against 13.0 GB at 16 GB; 7.9 against 7.7 at the floor).
Capping it at 512 MB for the duration of the prompt costs 6% of prefill at
16 GB, where the memory does not matter, and nothing at the 8.1 GB floor,
where the pass is read-bound — and there it took the 7,960-token prompt's
peak from 7.9 GB to **6.2** on the shipped build (93.1 against 88.3 tok/s), and
from 8.8 to 7.2 at a 10 GB target (87.7 tok/s). The engine therefore caps it only when the plan's
expected peak is 12 GB or under; `SLOTSTREAM_PREFILL_CACHE_MB` forces a value
at any target.

**Admission warms decode, measured.** The last pass of a prompt writes each
layer's most-used experts, its fair share of the pool, so decode starts on the
prompt's hot set. Three interleaved rounds of 48 decode tokens after the 8k
prompt: 5.62 / 6.00 / 5.52 tok/s with admission against 5.28 / 4.31 / 4.94
without — **5.7 against 4.8**, every round in the same direction, for about
0.2 s of copies on the final pass. It only ever touches the pool on that
pass; every earlier pass of a long prompt leaves it alone, which is the scan
resistance §3.3 asked for.

**Prose was paying for its n-gram rows, one at a time.** The trace on a
10,490-token excerpt of PLAN.md read the same 54 s of "everything else" at a
1024-token pass and at a 4096-token pass, so it scaled with tokens, not
passes; the acceptance prompt, three sentences repeated, read 20 s. A token
needs sixteen ~100 B n-gram rows, three `pread`s each at the SSD's ~55 µs
latency, and `NgramStore` fetched them one at a time on the calling thread;
repeated text hid that behind the row cache and prose could not. Reading
every missing row of a pass on 32 lanes before its embedding is assembled
took the excerpt from 103.7 s to 80.1 s (101 → 131 tok/s); the rows are the
same bytes in the same cache order, so nothing else moved. This cost was in
the old path too — its 89 s of "compute" on the excerpt against 49 on the
acceptance prompt was the same 35 s.
