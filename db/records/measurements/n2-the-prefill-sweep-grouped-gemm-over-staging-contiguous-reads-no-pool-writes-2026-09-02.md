---
type: measurement
id: 01m1hsay86q1seph0z5m76134b
created: 2026-09-02T19:25:35.366027+00:00
updated: 2026-09-02T19:25:35.366027+00:00
summary: 'N2 — the prefill sweep: grouped GEMM over staging, contiguous reads, no pool writes (2026-09-02)'
date: 2026-09-02
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: N2
order: '660'
title: 'N2 — the prefill sweep: grouped GEMM over staging, contiguous reads, no pool writes (2026-09-02)'
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
Prefill was the last unmet target: the plan asked for ≥150 tok/s on an 8k
prompt and 0.2.2 read 113 at best. Splitting the old pass had already said
where the time went (io 33.9 / scatter 10.3 / compute 50.3 s on 8k) and what
would close it: a grouped GEMM over the routed experts instead of one gather
per token, and contiguous reads instead of nine ~307 KB pieces per record.
Both landed on 2026-09-02, with the scan-resistant sweep §3.3 designed, and
this section is the record: what the old pass was actually doing, what the
sweep does instead, the gates that say it computes the same thing, and the
numbers, every one an interleaved A/B on the dev Mac between the 0.2.2 code
(`e09bcac`, the commit before this work) and the sweep, same prompt, same
target, one model process at a time.

**What the old pass was doing.** `MoELayer` already called MLX's
`gatherQuantizedMM` over the pool, but with one row per (token, expert) and
unsorted indices. That reaches MLX's per-row matvec kernel, which re-reads
an expert's weights once per token that routes to it — about forty times
per 2048-token pass. MLX has a grouped kernel (`gather_qmm_rhs`) that reads
the weights once per tile of tokens, but it takes it only for sorted indices
and only when a call has at least 16 rows and four rows per expert of the
weight array it is handed. Handed the pool, `E` is the slot count: a
2048-token pass has 20,480 rows and would reach the kernel only below 5,120
slots (106 experts per layer), so the kernel — and the arithmetic — would
have switched with the cache size, which is exactly what the golden-
equivalence invariant forbids. Every miss also went through the pool: 32
records at a time, nine preads per record, a scatter into the slots, and a
CLOCK state flushed by every long prompt.

**What the sweep does.** A pass of 256 tokens or more (`SweepTuning.minTokens`)
sorts its rows by expert (a counting sort on the CPU, 20 ms per prompt) and
walks the layer's experts in groups of 32: experts already resident are
copied out of the pool, the rest are read from the checkpoint with one
`pread` per piece per run of consecutive ids, and each group is one grouped
GEMM per projection over that group's rows, `sortedIndices: true`. A group
short of MLX's rule is padded up to it with repeats of its last row, so the
kernel a row meets depends on the routing alone. The GPU works on one group
while the CPU reads the next; at most two groups of staging exist at once.
The pool is never written by a sweep. On the final pass of a prompt, each
layer's most-used experts — its fair share of the pool — are admitted, so
decode starts on the prompt's hot set instead of cold. Passes shorter than
256 tokens, decode, and speculative verify passes gather over the pool as
before, so nothing below the threshold changed.
