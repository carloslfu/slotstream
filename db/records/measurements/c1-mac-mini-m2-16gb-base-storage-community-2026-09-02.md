---
type: measurement
id: 01m1jppckjpb157j7k8dthzgg2
created: 2026-09-03T03:58:39.218915+00:00
updated: 2026-09-03T04:02:54.343600+00:00
summary: 'C1 — Mac mini M2, 16 GB, base storage (community, 2026-09-02): 1.41 tok/s warm decode against a ~4 tok/s estimate, because a 1.5 GB/s SSD puts the IO ceiling at 2.00 tok/s.'
date: 2026-09-02
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m2-16gb]]'
milestone: C1
order: '710'
title: C1 — Mac mini M2, 16 GB, base storage (community, 2026-09-02)
status: measured
---
The first measurement from hardware that is not the dev Mac, and it contradicts
the design consequence M0.5 drew from that machine's disk. Reported by `@flol`
in [issue #5](https://github.com/carloslfu/slotstream/issues/5), raw output in
[[sources/community/2026/09/2026-09-02-mac-mini-m2-16gb-flol]], machine in
[[records/machines/mac-mini-m2-16gb]].

Mac mini M2, 16 GB, internal 256 GB, macOS 26.6.2, slotstream 0.2.2, auto plan
(10.2 GB target, ~21 experts per layer planned, ~19 achieved; 11.7 of 17 GB was
reclaimable, so auto sized down from its usual 10.7).

| | measured | the plan said |
|---|---|---|
| Warm decode | **1.41 tok/s** (three identical runs) | ~4 tok/s |
| Cold decode | 1.39 tok/s (128 tokens in 91.95 s) | — |
| Prefill, 28-token prompt | 2.6 tok/s (io 8.66 s + scatter 0.80 s + compute 1.47 s) | ~40 tok/s at a 256-token pass |
| Read throughput | **1.5 GB/s** (4,778 records, 13.2 GB) | 17.3 GB/s on the dev Mac |
| Peak RSS | 6.1 GB | ~9.2 GB |

**The estimate was not merely optimistic; it was below the disk's floor.**
The pool's hit counters are zeroed after prefill (`Generate.swift`), so the
reported 0.434 is the decode hit rate, not the run's. Decode routes
48 layers x 10 experts = 480 expert-uses per token, so 271.7 of them missed,
at 2.7648 MB each: **751 MB read per token**. At 1.5 GB/s that is **501 ms of
IO per token, a ceiling of 2.00 tok/s** before a single multiply. The planner
quoted 3.8 tok/s at 19 experts per layer — 263 ms per token, half the time the
reads alone take. No cache policy or kernel could have reached it.

The rest of the step reconciles: 1.41 tok/s is 709 ms, so IO is 71% and the
remaining 208 ms is compute and scatter — 2.4x the dev Mac's 86 ms plateau
step, which is the right order for an M2 against an M5 Pro.

**What this falsifies.** M0.5 concluded, from a 17.3 GB/s disk, that "even a
zero-hit cache sustains ~13 tok/s from IO alone" and that "the binding
constraint on small machines is memory and compute, not bandwidth". Re-run
M0.5's own table at 1.5 GB/s:

| h | miss/token | IO ms/token | IO-bound ceiling |
|---|---|---|---|
| 0.98 | 26.5 MB | 18 | 56 tok/s |
| 0.90 | 133 MB | 89 | 11 tok/s |
| 0.50 | 663 MB | 442 | 2.3 tok/s |
| 0.00 | 1,327 MB | 885 | **1.1 tok/s** |

On this machine bandwidth is the binding constraint, and the tier curve —
a function of experts per layer alone, with no bandwidth term — cannot see it.
M0.5's measurement of *its own* disk stands; only the generalization to small
Macs is withdrawn. That the caveat was already written into M0.5 ("base-storage
MacBook Airs will be far slower, and Stage C on real small Macs must
re-measure") is why this is a confirmation of the caveat, not a surprise.

**What this does not establish.** The drive's independent ceiling was not
measured: 1.5 GB/s is what slotstream's `pread` path achieved, not a
`Tools/coldread.c` figure. The dev Mac's pool path reaches only 4.5 of its
17.3 GB/s, so a path that inefficient here would imply a ~6 GB/s drive, which
base storage is not — but that is inference from public specifications, and
`coldread` on this machine is the measurement that settles whether the
remaining loss is the disk or the nine 307 KB `pread`s per record. One
cold run and three warm runs, one machine, one storage configuration.

**The prefill number is not comparable to the plan's.** A 28-token prompt pays
a nearly full cold expert fetch amortized over 28 tokens; the planner's ~40
tok/s describes a 256-token pass. Correcting for that still lands near 7 tok/s,
not 40, but no 256-token pass was run here. The peak is likewise not planner
slack: the 5.3 GB fixed footprint budgets a full 32k context that a 128-token
run never allocates.

**Still current after the prefill sweep.** The sweep takes passes of 256 tokens
or more; this prompt was 28, and decode always takes the pool path, so both
numbers describe `main` as well as 0.2.2. The one column the sweep would move
is the long prompt — and that step failed, because `context-check` postdates
the v0.2.2 tag while `docs/HARDWARE.md` already told reporters to run it.

0.2.3 shipped `context-check` on 2026-09-02, so that column is measurable on
this machine now and is the one number worth re-running here: the sweep
roughly doubled prefill on the dev Mac, but it did so by turning nine 307 KB
`pread`s per record into contiguous runs, and a disk already near its
sequential ceiling has far less of that to give. The prediction on record is
that this machine gains from the grouped GEMM's share of the pass and little
from the reads — well under the dev Mac's 2x.
