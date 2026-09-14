---
type: decision
id: 01m2c4qtcwhjbt8b8vn0qa0qyf
created: 2026-09-13T01:05:06.972697+00:00
updated: 2026-09-13T12:12:32.664069+00:00
summary: 'Decode host time is waiting on the GPU and on reads, not graph construction: no layer compilation and no host point fixes'
decided_on: 2026-09-12
evidence: '[[records/measurements/decode-path-serialization-round-1-2026-09-12]], [[records/measurements/decode-wall-time-attribution-2026-09-10]]'
reversible_if: a compiled pure-compute layer span or a host-side fix measures a paired decode gain of at least 3% with exact outputs
title: 'Decode host time is waiting, not graph construction: no graph compilation and no host point fixes'
status: standing
---
The 2026-09-10 attribution puts 32.7% of decode in host categories: Metal command preparation 10.0%, graph evaluation and scheduling 10.4%, and model graphs, bookkeeping, MTP state and output 12.4%. Read as host compute, that suggested roughly 7,000 MLX operations per forward pass at around 11 microseconds each, with compiling the pure-compute spans of each layer as the remedy.

Profiles taken on 2026-09-12 contradict that reading. On the model thread during warm decode, 69.7% of leaf samples are GPU waits in the IOKit user-client trap without prefetch and 73.5% with it; host locks and condition variables add 9.9% and 4.4%; at the top of the process-wide stack, MLX evaluation and Metal command encoding self time is in the tens of samples, and the model thread's remaining host leaves (about 16%) mix IPC traps, encoding, evaluation and array lifetime. The host is blocked on the GPU and on reads, not constructing graphs. The same shape explains the earlier results: the optimization program rejected fifteen host accelerators on materiality, a re-test of nine of them under slot adoption measured a paired mean of 1.0012, and the one decode change that gained, deferring the per-layer drain at 1.038 to 1.051, removed a wait.

Decode work therefore goes to overlap (fewer synchronizations, work queued while the host waits) and to fewer real reads, not to compiling layer spans or micro-optimizing host bookkeeping.

**Evidence update (2026-09-13).** The model-thread shares cited here came from one of the thread's two profile blocks. Merged, GPU waits are 35% to 41% and file reads 40% to 45% of model-thread samples in round 1's profiles; after the combination, reads are 39%, GPU waits 33% and host work outside waiting 17%, with `mlx::core::eval_impl` at about 100 of some 28,000 samples ([[records/measurements/decode-path-serialization-closing-profiles-2026-09-13]]). Waiting still dominates and graph construction stays small, so the decision stands.
