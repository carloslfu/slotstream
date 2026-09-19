---
type: measurement
id: 01m2swpp9h0e2d0d4vh1evjeq1
created: 2026-09-18T08:10:00+00:00
updated: 2026-09-19T15:15:18.921206148+00:00
summary: 'Historical concurrency A/B: wider queues had no detectable gain on this workload; causal interpretation superseded by the mirror review.'
date: 2026-09-18
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb]]'
note: Historical data retained. Batch-size bounds and the conclusion that a third disk cannot help were not established; see the linked review.
order: '1620'
runs: '[[sources/runs/2026/09/2026-09-18-decode-queue-depth-and-prefetch-lanes]], [[sources/runs/2026/09/2026-09-18-mirror-decode-ab-three-rounds]]'
superseded_by: '[[records/measurements/mirror-read-review-2026-09-19]]'
title: Decode concurrency is not a width knob
status: superseded
---
**Outcome: with a mirror in place, decode reads at 3.02 GB/s against a two-disk ceiling of 4.99, and neither of the two width settings closes any of that gap. Raising `SLOTSTREAM_POOL_QUEUE_DEPTH` from 32 to 128 moves decode by 1.2% and raising `SLOTSTREAM_EXPERT_PREFETCH_LANES` from 8 to 24 moves it by 0.1%, both inside a within-arm spread of 0.23 tok/s. Both settings are live: cutting the pool depth to 1 costs 32% of the tokens per second and doubles the I/O time. The read path is not narrow; it does not have enough outstanding work to be narrow.**

**The three arms.** Every arm mirrors the checkpoint across both disks and differs only in one environment variable. Arms alternate inside a round and the verdict is the median of three rounds.

```text
median  arm     tok/s    io s   read GB    GB/s   issued  adopted  wastedGB  deferred
        base     7.31    7.63     23.08    3.02    16423     8677     21.41     14247
        qd       7.40    7.57     23.08    3.05    16422     8675     21.41     14280
        pf       7.32    7.67     23.09    3.01    16422     8674     21.41     14266

  qd / base  tok/s 1.012   GB/s 1.008
  pf / base  tok/s 1.001   GB/s 0.994
  within-arm spread, base: 7.16 .. 7.39 tok/s (0.23)
```

Nine runs, one distinct generated text. The difference between arms is smaller than the spread inside the `base` arm, so neither raise is distinguishable from no change at all.

**The controls, and why they were needed.** An unchanged result cannot tell a knob that does not bind from a knob that is not connected, and the two readings call for opposite work. Each variable was therefore also driven to its minimum, where a connected knob has to hurt.

```text
run           tok/s     io s    GB/s   issued  adopted  deferred
base           7.31     7.63    3.02    16423     8677     14247
qd=1           5.00    16.04    1.44    16422     8677     13317
lanes=1        7.31     7.68    3.01    16422     8671     14121
```

`SLOTSTREAM_POOL_QUEUE_DEPTH=1` costs 32% of the tokens per second, more than doubles the I/O time and halves the read rate, so that setting is connected and binding downward. `SLOTSTREAM_EXPERT_PREFETCH_LANES=1` is indistinguishable from 8 and from 24 on every column, including the deferral counter.

**Why the demand path cannot use a deeper queue.** `ExpertStore.readBatchChecked` builds one job per piece and takes `lanes = min(queueDepth, jobs.count)`, where `jobs.count` is nine times the number of records in the batch. Decode reads 8,349 records over 48 layers and 95 verify passes, so a layer's demand batch holds one or two records: 9 to 18 jobs. The shipping default of 32 is already above what a batch can supply, which is why 128 changes nothing and 1 is catastrophic.

**Why more prefetch lanes do not help.** A speculative worker holds a lane for exactly one piece read and releases it (`ExpertPrefetch.swift:342`), so the lane budget caps in-flight speculative reads. The budget is not what limits them here. Prefetch issues 45.40 GB over a 27.4 s decode, 1.66 GB/s averaged over the phase and 2.30 GB/s if it is credited only with the time no demand batch is active. One lane on the external disk at a single read in flight delivers 2.09 GB/s. The prefetch's appetite therefore sits within a small factor of what a single lane carries, which is why 1, 8 and 24 lanes are indistinguishable: the constraint is how much speculative work the scheduler issues and when, not how wide it is allowed to be.

**What the deferral counter actually measures.** The base arm's 14,247 deferrals against roughly 147,800 acquisitions (16,422 tickets of nine pieces) is 9.6%, and the count barely moves across a 24-fold change in the lane budget: 14,121 at one lane, 14,247 at eight, 14,266 at twenty-four, and every one of the nine A/B runs falls between 14,043 and 14,324. `IOLaneBudget.acquireSpeculative` waits while `demandActive > 0 || speculativeInUse >= speculativeLanes`. A counter that is flat in `speculativeLanes` is being driven by the first disjunct: speculative reads are held off because a demand batch is in flight, not because the lanes are full. No environment variable relaxes that; it is a policy in the code.

**Half of the speculative traffic is discarded.** The prefetch issues 16,422 tickets and 45.40 GB, of which 8,675 tickets and 23.98 GB are adopted; 21.41 GB is read and thrown away, 47% of the speculative bytes. The predictor is `router-reuse:strides=2`. This is the same in every arm to within 0.01 GB, so it is a property of the predictor and the prompt rather than of any setting measured here. It bounds what more concurrency could be worth: issuing more speculative work against a predictor of this accuracy buys waste at close to one byte for every useful byte.

**What this says about a third disk.** The mirror record left open whether more disks would help decode and attributed the limit to `concurrentPerform` over ten cores. That attribution is not supported: the limit measured here is the size of a demand batch and the rate at which speculative work is issued, both of which are independent of the core count. The conclusion it was used to support still holds, and now rests on evidence: decode cannot use more read bandwidth until it has more work outstanding, so a third disk would not move it.

**Where the whole-run bytes go.** The mirror report totals about 86.5 GB over a run whose prefill reads 18.1 GB and whose decode credits 23.1 GB. The prefetch's 45.40 GB of issued reads accounts for most of the difference, with demand-path reads and startup loading making up the rest. This was previously recorded as not decomposed.

**Limits.** One machine, one prompt, 200 greedy tokens, `--experts-per-layer 118`, `--mtp on`. The raise arms are three paired rounds each; the two controls are a single run each, which is enough for effects of 32% and 0% but not for a small one. The prefetch-lane null is a null on this workload only: a configuration whose speculative appetite exceeded one lane's throughput would be expected to separate, and none was measured. `SLOTSTREAM_EXPERT_PREFETCH_LANES` is wired from the environment through `ExpertPrefetchConfiguration` into `IOLaneBudget(speculativeLanes:)`, so the null is read as "does not bind" rather than "not connected", but no run in this record forces it to bind.

**Gates.** None. Nothing in the build reproduces these numbers, and no check exercises a mirror.
