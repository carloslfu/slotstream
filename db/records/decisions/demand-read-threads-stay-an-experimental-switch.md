---
type: decision
id: 01m7gjgm14aq3j7jmwkvep0bms
created: 2026-11-15T21:41:17.988201+00:00
updated: 2026-11-15T23:50:29.475551+00:00
summary: Demand read lanes on real threads stay behind an off-by-default switch until real generation shows a gain
decided_on: 2026-11-15
reversible_if: An interleaved comparison of real generation on a quiet machine, medians of paired rounds with its raw runs in this store, shows faster decode and identical output with the switch on, which would justify proposing it as a default for the measured configuration; or that comparison on mirrored disks shows no gain, or the threads cause a failure the default lanes do not, either of which would remove the switch
title: Demand read threads stay an experimental switch
status: standing
---
Carlos approved keeping this experiment available on November 15, 2026: "Okay, review it, test it, and make it happen." This records where it stands.

**Decision.** The demand path's read lanes can run on parked threads (`BlockingReadLanes`) instead of `DispatchQueue.concurrentPerform`, behind `SLOTSTREAM_OPT_DEMAND_THREADS=1` (`InferenceOptimizations.demandReadThreads`). It is outside the deployment family and off by default. `concurrentPerform` runs at most one lane per CPU core at a time and starts no replacement while one waits in `pread`, so the reads in flight are bounded by the core count and `--mirror` divides them among the copies. The threads let every lane wait at once. `ExpertStore.poolQueueDepth` keeps the value and the meaning it was measured with.

**Why a switch and not a default.** [The comparison in #141](https://github.com/carloslfu/slotstream/pull/141), by its author, ran on one Mac mini M4 with two and three checkpoint copies. More reads in flight raised disk-only replay throughput with the decode lookahead off. Real generation with the lookahead at its default decoded slightly slower, with ranges that did not overlap over three interleaved rounds, and prefilled the same. The raw runs are in the pull request and not yet in this store, so its numbers are not transcribed here. The combination the replay points at, read threads with the lookahead off, has not been run as real generation.

**Why keep it at all.** The comparison shows that mirrored disks have read capacity the default lanes leave unused, and its author is studying where decode's read wait goes. A switch keeps that study runnable on a release build instead of a fork, under the rule the other `SLOTSTREAM_OPT_` experiments follow: for comparisons only.

**Safety.** The same records are read into the same places and every lane joins before a result is inspected, so arithmetic and failure handling are unchanged. The pool is bounded three ways: never more threads than lanes are queued or running, never more than the demand path's largest queue depth, and an idle thread exits. `exact-read` checks those bounds without weights. `decode-overlap-check` checks identical output and failed-read recovery on the staged and direct read paths with the switch on. `runtime-check` covers the switch's parsing.

**Scope.** One comparison on one Mac. Nothing here establishes a speedup or a slowdown on any other machine.
