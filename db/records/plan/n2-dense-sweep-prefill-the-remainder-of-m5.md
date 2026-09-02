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
