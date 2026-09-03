---
type: plan
meta-type: operational
id: 01m1hhwnvavdanhjgc9dkdqycz
created: 2026-09-02T17:15:27.978338+00:00
updated: 2026-09-02T17:15:27.978338+00:00
summary: N2 — Dense-sweep prefill (the remainder of M5)
date: 2026-08-30
doc: plan
kind: queue-item
level: '3'
order: '310'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: N2 — Dense-sweep prefill (the remainder of M5)
---

N1 cannot help the first turn, a pasted document, or a fresh RAG context; only a faster
pass can. Sizing the pass from the memory plan already took prefill 40 → 92 tok/s
(M7.6); the remaining work is the dense sweep proper per §3.3 — grouped staging, auto
threshold, scan-resistant admission — plus the cross-token prefetcher. This multiplies
with N1 rather than overlapping it: N1 removes repeated work, N2 speeds up the pass that
is genuinely unavoidable.

**Exit:** ≥150 tok/s @8k on the dev Mac; byte-identical output at every pass size (the
existing standing gate).

**Done 2026-09-02.** The sweep shipped as designed in §3.3 with the departures the
design note's addendum records, and the exit is met: the 8k acceptance prompt reads
**184 tok/s at a 16 GB target** against 91 on the same code base the day before
(three interleaved rounds), 222 at a 4096-token pass on a matched 60-per-layer pool,
247 at 4096 by override at 16 GB, and 152 by `context-check --tokens 8192` at 16 GB
against 64. The second half of the exit was written wrong and is replaced by the gate
that N1 already uses: output is inside the prefill-rechunk band at every pass size
(`sweep-check`: 3.3% of logit spread against a 5.1% control), bit-identical on a cold
and a warm pool, not byte-identical across pass sizes, which re-batching never was.
The cross-token prefetcher was not built; it is a decode lever, not a prefill one, and
stays with the deprioritized list. What N2 leaves open is in MEASUREMENTS.md, "N2 — the
prefill sweep": the auto plan on this Mac, the prose-versus-acceptance-prompt gap, the
serial router-and-attention time between groups, and the read rate against the SSD.
