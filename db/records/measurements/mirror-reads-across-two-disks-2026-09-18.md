---
type: measurement
id: 01m2s4e4fs81zwedpjern65nht
created: 2026-09-18T05:40:00+00:00
updated: 2026-09-19T15:12:02.308259712+00:00
summary: 'A second copy of the checkpoint on a second disk, with reads routed to whichever copy would finish first: warm decode 6.11 to 7.35 tok/s and prefill reads 3.2 to 4.4 GB/s on a two-disk Mac mini M4, output byte-identical'
date: 2026-09-18
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb]]'
note: One machine, one prompt, two replicas, three paired rounds; the policy has only been measured on disks whose saturated rates differ by 1.76x.
order: '1610'
runs: '[[sources/runs/2026/09/2026-09-18-mirror-decode-ab-three-rounds]], [[sources/runs/2026/09/2026-09-18-mirror-iostat-device-witness]], [[sources/runs/2026/09/2026-09-18-mirror-router-trace-development-build]], [[sources/runs/2026/09/2026-09-18-diskbench-mirrored-shard-cached]], [[sources/runs/2026/09/2026-09-18-checks-on-mirror-build]], [[sources/runs/2026/09/2026-09-18-mirror-copies-compared-byte-for-byte]]'
title: 'Mirrored checkpoints: routing weight reads across two disks'
status: measured
---
**Outcome: a checkpoint may now be given to `--model` and to one or more `--mirror` paths, and every weight read goes to whichever copy is estimated to finish it first. On a Mac mini M4 whose two disks read 3.18 and 1.81 GB/s, warm decode went from 6.11 to 7.35 tok/s over three paired rounds (x1.202) and prefill read throughput from 3.2 to 4.4 GB/s, which is 88% of the two disks' combined 4.99 GB/s and reached 4.7 GB/s in the best of the three mirrored rounds.** All six runs of the A/B produced one distinct generated text, so routing does not change what the model says. The router is told nothing about the devices: it learns each replica's throughput from that replica's own completed reads, converges on 71.4% of the bytes to the external disk against `iostat`'s 69.4% at the devices, and would re-weight itself if a disk changed speed. Default: unchanged, because a mirror only exists when the operator passes `--mirror`. Cost: a second copy of the checkpoint, 105.26 GB here.

**Why one disk was the limit.** slotstream already reads with enough concurrency to saturate one disk on its own. An expert record is nine separate `pread` calls, because each expert row lives in its own `[512, R, C]` tensor: three weight pieces of 819,200 bytes and six scale and bias pieces of 51,200 bytes, 2,764,800 bytes per record. Those nine go out together and several records are in flight at once, so the read path typically holds about ten requests open. Both disks stop getting faster well below that (the internal one from 4 concurrent readers, the external from 2), so the engine was already sitting at the fast disk's ceiling while the other disk in the machine did nothing. The two disks saturate at 1.81 GB/s (internal, 4 concurrent readers) and 3.18 GB/s (external, 2 readers), so their sum, 4.99 GB/s, is 1.57 times what the faster one can do alone. Before this change the engine could reach only the 3.18.

**Why a mirror and not a split.** Putting some shards on each disk needs no new code, but it fixes the byte ratio at file granularity. The expert bytes sit in six shards of about 9.23 GB, so the finest available split is one sixth, and the ratio the bandwidths call for, 36% internal to 64% external, has to be approximated by 2 shards against 4. A mirror instead decides per read, which matters because the right ratio is not a constant: it depends on how many reads happen to be in flight at that instant, and at low concurrency the correct answer is to send everything to the fast disk.

**The routing rule.** Each read asks the router for a replica before it is issued. For each replica the router estimates when a read submitted now would finish there,

```text
finish = (bytes already queued here + this read's bytes) / throughput lately achieved here
```

and submits to the earliest finisher. The throughput term is aggregate: bytes completed divided by the time that replica had at least one read in flight. Both ends of the concurrency range come out right with no threshold to tune. While the replicas are idle nothing is queued, so throughput alone decides and the fast disk takes essentially everything. Once the fast disk has a backlog, its queued bytes lift its estimate past the slow disk's and the surplus spills across.

**Two policies that fail, both of which were tried first.**

An even split is worse than using the fast disk alone whenever few reads are in flight, because every second read waits out the slow disk with nothing to overlap it. This follows from the machine record's single-reader figures rather than from a run of an even-split build: at one read in flight the internal disk delivers 1.13 GB/s and the external 2.09 GB/s, so strictly alternating between them gives their harmonic mean, 1.47 GB/s, which is 30% below simply using the external disk. The penalty shrinks as the queue deepens and reverses once the external disk is saturated, which is exactly the crossover that a fixed ratio cannot express and an estimate of finishing time can.

Estimating from the duration of individual reads runs away. A single read's wall clock already contains the wait behind everything else queued on the same disk, so multiplying it by the queue length counts that wait twice: the estimate gets worse the more work a replica is given. The first implementation did exactly that. The internal disk took 2,410 reads, measured itself at under 5 MB/s because those reads had been waiting on each other, and was then not chosen once in the following 40,000 reads, while the external disk was estimated at 0.10 GB/s and `iostat` showed it delivering 2.1 GB/s. Aggregate throughput inverts the feedback: giving a replica more concurrent work makes it measure faster, not slower, up to its own ceiling.

**A measurement has to expire.** A replica is only measured while it is being used, so any reading that argues against using it is self-sealing. One unlucky probe — the internal disk caught mid-stall behind the engine's own startup allocations — excluded that disk for an entire run, and because it was excluded, the reading that condemned it was never revisited. An idle replica's reading is therefore discarded after one second, so the next claim measures that disk as it is now. A replica with a read in flight is never stale. The cost is one probe per second per starved replica, against reads that arrive by the thousand per second.

**The clock has to be read under the lock.** Taking `DispatchTime.now()` before acquiring the router's lock lets two threads enter the critical section in the opposite order to their timestamps, so a claim can hold a timestamp older than the `busySince` already stored. The elapsed-time subtraction is on `UInt64` and underflows. This trapped during prefill with nothing on stderr; the cause came from `~/Library/Logs/DiagnosticReports/slotstream-*.ips`, which decoded to `Swift runtime failure: arithmetic overflow` inside `finishEstimate`. Both `claim` and `release` now read the clock after taking the lock.

**Three paired rounds, 200 greedy tokens each.** Both arms keep the draft head and therefore the expert lookahead, because the lookahead is what puts several record reads in flight at once and the mirror only pays at that concurrency. The arms alternate within a round and the verdict is the median of the rounds, because single runs on this machine vary by more than the effect being measured. Each run waits until reclaimable memory is at least 28 GB across three consecutive readings, so no arm starts while the previous model is still being reclaimed.

The harness computes each arm from the run's own `--stats-json`. `io s` is the seconds decode spent inside its I/O phase, `GB/s` is decode read bytes over that, and `io share` is that phase as a percentage of decode wall time.

```text
round   arm          tok/s      io s   read GB      GB/s   records  io share
----------------------------------------------------------------------------
1       single        6.04     10.35     23.13      2.23   8366.00     31.26
1       mirror        7.28      7.51     23.08      3.08   8349.00     27.31
2       single        6.11     10.48     23.13      2.21   8366.00     32.03
2       mirror        7.41      7.40     23.09      3.12   8352.00     27.42
3       single        6.19     10.43     23.15      2.22   8374.00     32.28
3       mirror        7.35      7.65     23.08      3.02   8349.00     28.10

median  arm          tok/s      io s   read GB      GB/s   records  io share
----------------------------------------------------------------------------
        single        6.11     10.43     23.13      2.22   8366.00     32.03
        mirror        7.35      7.51     23.08      3.08   8349.00     27.42

  tok/s      mirror / single = 1.202
  io s       mirror / single = 0.720
  read GB    mirror / single = 0.998
  GB/s       mirror / single = 1.386
  records    mirror / single = 0.998
  io share   mirror / single = 0.856
```

Decode reads 23.1 GB in both arms, over 8,349 to 8,374 records, a spread of 0.3% that carries no signal, so the mirror is not saving reads; it is serving the same reads faster. The share of decode wall time spent waiting on I/O falls from 32.0% to 27.4%, which is what the token rate is made of.

Prefill, the same six runs, from each run's own report:

| arm | round 1 | round 2 | round 3 |
| --- | ---: | ---: | ---: |
| single, prefill read GB/s | 3.3 | 3.2 | 3.2 |
| mirror, prefill read GB/s | 4.4 | 4.7 | 4.4 |

The two phases improve by almost the same factor, 1.375 for prefill against 1.386 for decode, but they end up at very different absolute rates: 4.4 GB/s for prefill against 3.08 GB/s for decode. Prefill is the throughput-bound phase, because it reads all 6,539 records of a pass with nothing between them and the queues stay deep. Decode is partly latency-bound, so it leaves most of the gap to the 4.99 GB/s ceiling unclaimed, and that gap is what a deeper read path, not a third disk, would close.

**The split the router chose, checked at the devices.** Over the three mirrored rounds the router's own readout gives 71.4%, 70.4% and 71.8% of bytes to the external disk. A separate single run under `iostat` shows the devices themselves at 69.4% external and 30.6% internal, averaged over the 33 seconds in which they were reading, with a peak second of 2,176 MB/s external and 1,077 MB/s internal. The two witnesses agree to about two points, and the remaining difference is expected: the router counts bytes it asked for, while `iostat` counts bytes that reached the device, and the file system does not turn one into the other exactly.

The ratio is close to what the hardware calls for, which is the check that the policy learned the right thing rather than landing somewhere by accident. The saturated bandwidths, 3.18 against 1.81 GB/s, imply 64% / 36% if both disks were held at saturation throughout. The router sits at 71% / 29%, biased toward the fast disk, which is the correct direction: the queues are not deep enough to hold both disks at saturation continuously, and at shallow queues the fast disk is the better answer for a larger share of reads.

**What the mirror does not reach.** The combined ceiling is 4.99 GB/s. Prefill reaches 4.4 to 4.7 GB/s of it; decode reaches 3.08. Decode's shortfall is concurrency, not routing. A development build's router trace recorded the queue depth at the moment each read was claimed: 86% of early claims saw exactly 10 reads in flight, and the distribution never spread far past that even though `SLOTSTREAM_POOL_QUEUE_DEPTH` is 32. The ceiling is `concurrentPerform` over this machine's 10 cores, so raising the pool depth on its own will not put more reads in flight, and a third disk would not help decode until that changes. That trace is [[sources/runs/2026/09/2026-09-18-mirror-router-trace-development-build]]; it came from a build whose debug counters were removed before the commit and it is not reproducible from the committed tree.

**Routing must not change the output.** Every read may be served by either copy, so a mirror is also a claim that the two copies hold the same bytes. Two things hold that, and they cover different halves of the claim. At startup the engine compares each shard's size and safetensors header between the primary and every mirror and refuses the run if they differ, which pins every tensor's name, dtype, shape and byte range and so catches a different quantisation, a different revision or a truncated copy for a few hundred kilobytes of reading. It deliberately does not compare payloads, because that would cost a full pass over the checkpoint at every startup. That pass was done once by hand instead, outside the engine: `cmp` over all twelve shards, 105,240,154,212 bytes on each side, reports no difference anywhere, so the two copies are byte-identical as of this measurement ([[sources/runs/2026/09/2026-09-18-mirror-copies-compared-byte-for-byte]]). That is evidence about the files; the output carries the same claim independently and at the level that actually matters, since it would catch a routing bug that served the right bytes from the wrong offset as well as a bad copy. The A/B hashes the generated text of all six runs and finds **one distinct digest**, so the three single-disk runs and the three mirrored runs produced the same 200 tokens byte for byte across 23.1 GB of reads per run that the router spread over both copies. The comparison hashes the token stream on stdout rather than the run log, because the report goes to stderr and a stderr line lands inside a streamed line rather than between two lines, which makes a merged stream impossible to compare. An earlier harness that hashed a range of the log reported six distinct digests for runs that were in fact identical.

**Cost.** A mirror is a whole second copy: 105.26 GB for this checkpoint, on an internal disk of 251 GB. It is worth it when a machine has a second disk that is fast enough to be worth reading from and enough free space to hold the model twice. On [[records/machines/mac-mini-m2-16gb]], whose single 256 GB disk reads 1.5 GB/s, neither condition holds.

**Limits.** One machine, one prompt, 200 greedy tokens per run, `--experts-per-layer 118`, three paired rounds. The arms within a round are separated by a memory-reclaim wait rather than run simultaneously, so a slow drift in machine state would show up as a difference between arms; the three rounds bound that, since each arm's three values span 0.15 tok/s while the gap between arms is 1.2 tok/s. Only two replicas were measured. The policy is written for any number of replicas and has no term that assumes two, but a three-way mirror has not been run. The disks measured here differ by a factor of 1.76; the policy's behaviour on nearly equal disks follows from the rule but was not measured. `iostat` device figures and the engine's own throughput figures are not comparable totals, because the engine divides by the seconds it spent inside its I/O phase while `iostat` averages over whole seconds that also contain compute.

**Gates.** The check catalogue passes on the committed build: 46 checks, 0 failed, 0 skipped, 28,499 assertions. No check exercises a mirror: the string does not appear anywhere under `Sources/slotstream-checks/`. The end-to-end behaviour genuinely needs a second copy of a real model on a second disk and so cannot live in the catalogue, but the routing rule itself is arithmetic over a few counters and could be checked without any weights, which is the obvious gap this record leaves open. Until then the policy is covered by the A/B and the two witnesses above.
