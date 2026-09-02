---
type: decision
id: 01m1hhwpgz7714qf8venf67n5r
created: 2026-09-02T17:15:28.671270+00:00
updated: 2026-09-02T17:15:28.671270+00:00
summary: Cross-layer read-ahead was built, measured slower in every paired run, and removed
decided_on: 2026-08-30
evidence:
- '[[records/measurements/prefill-second-pass-2026-08-30-the-cost-model-was-wrong-read-ahead-does]]'
reversible_if: expert reads are first made contiguous on disk and read-ahead then measures faster in paired rounds
title: Cross-layer read-ahead was built, measured slower in every paired run, and removed
status: standing
---

The reads already saturate, so a background reader steals CPU from the thread feeding the GPU and competes for the same unified memory. Do not rebuild it from first principles.
