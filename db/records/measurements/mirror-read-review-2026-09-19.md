---
type: measurement
id: 01m2x3rwrynepcfdgn8tt86102
created: 2026-09-19T15:15:18.942756386+00:00
updated: 2026-09-19T15:39:24.793287541+00:00
summary: 'Mirror read review: workload and prefetch interpretation'
date: 2026-09-19
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb]]'
order: '1630'
runs: '[[sources/runs/2026/09/2026-09-18-decode-queue-depth-and-prefetch-lanes]], [[sources/runs/2026/09/2026-09-18-mirror-decode-ab-three-rounds]], [[sources/runs/2026/09/2026-09-19-mirror-pr-validation]]'
title: 'Mirror read review: workload and prefetch interpretation'
status: analysis
---
The September 18 paired mirror measurements remain historical observations on their recorded binary and workload, not measurements of the rebased main branch. The old concurrency interpretation is superseded; its raw runs and wording remain as evidence.

8,349 demand records / 48 layers / 95 MTP verify passes is an average of about 1.83 per layer per pass, not a maximum of two per batch. Ten selected experts is per token; an MTP verification pass can contain multiple tokens. The two units cannot be subtracted to infer cache hits. A per-batch trace is needed to establish the distribution and whether queue depth ever binds.

Expert lookahead already reads predicted experts asynchronously and adopts valid completed records. Cache residency, forecast coverage and issued-ticket adoption are distinct metrics. Demand-active gating blocks admission of ordinary speculative reads; it does not establish that all compute and reads are serial. The recorded 3.02 GB/s divides demand bytes by I/O time, not full decode wall time. It is not explained solely by GPU-only intervals.

The queue-depth and prefetch-lane raises had no detectable gain on the tested workload. Neither those null results nor the mean batch size proves that a third disk cannot help. No third-disk measurement was made. Likewise, aggregate in-flight counts do not prove that each disk is saturated.

The mirror's startup check compares shard sizes and safetensors headers. It rejects layout mismatches but cannot detect same-layout payload corruption; users must provide byte-identical copies. The paired study separately compared its copies byte for byte. The PR does not add a full-checkpoint hashing pass at every startup.

Rebase validation is recorded separately from the original performance results. No new throughput ratio is claimed merely because compilation or correctness checks pass.
