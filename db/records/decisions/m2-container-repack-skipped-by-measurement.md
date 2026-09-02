---
type: decision
id: 01m1hhwpfkvjx855chsg99z9rb
created: 2026-09-02T17:15:28.627384+00:00
updated: 2026-09-02T17:15:28.627384+00:00
summary: 'The .ssmodel container and repack (M2) are skipped: the engine streams from the original shards'
decided_on: 2026-08-28
evidence:
- '[[records/measurements/m0-5-disk-the-number-the-whole-io-model-rests-on]]'
- '[[records/measurements/prefill-second-pass-2026-08-30-the-cost-model-was-wrong-read-ahead-does]]'
- '[[records/plan/m2-container-repack-12-d]]'
reversible_if: prefill IO is again the binding cost and a contiguous on-disk repack measures faster than the nine-pread expert layout in paired rounds
title: 'The .ssmodel container and repack (M2) are skipped: the engine streams from the original shards'
status: standing
---

Expert-sized records reach 55% of the SSD's peak at queue depth 1 and saturate by 8, so streaming from the pinned shards was fast enough to ship. The one thing that would un-skip it is recorded: prefill IO runs at about 4.5 GB/s because an expert is nine 307 KB pieces, and only a contiguous repack raises that.
