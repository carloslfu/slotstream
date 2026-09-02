---
type: index
scope: type-folder
folder: records/claims
updated: 2026-09-02T19:42:06.744799Z
---

# records/claims

- [[records/claims/prefill-floor-51-to-93-tok-s-at-8-1-gb]] — The sweep reads the 7,960-token prompt at 93 tok/s at the 8.1 GB floor, against 51 for the 0.2.2 code, at a lower peak
- [[records/claims/prefill-prose-66-to-140-tok-s-at-16-gb]] — The sweep reads a 10,490-token prose prompt at 140 tok/s at a 16 GB target, against 66 for the 0.2.2 code
- [[records/claims/prefill-8k-prompt-91-to-184-tok-s-at-16-gb]] — The sweep reads the 8k acceptance prompt at 184 tok/s at a 16 GB target, against 91 for the 0.2.2 code
- [[records/claims/full-context-wait-6-4-min-on-16-gb]] — A full 32k prompt waits about 6.4 min on a 16 GB Mac
- [[records/claims/full-context-wait-3-0-min-on-48-gb]] — A full 32k prompt waits about 3.0 min before its first token on a 48 GB Mac
- [[records/claims/prefill-220-tok-s-at-a-4096-pass]] — Prefill at a 4096-token pass is about 220 tok/s on the dev Mac (estimated from the sweep's ladder)
- [[records/claims/only-the-48-gb-row-is-measured-on-real-hardware]] — Only the 48 GB row is measured on real hardware
- [[records/claims/pull-verify-re-hashes-in-8-s]] — pull --verify re-hashes the whole copy in about 8 s on the dev Mac
- [[records/claims/prefill-125-tok-s-at-a-4096-pass]] — Prefill at a 4096-token pass is about 125 tok/s on the dev Mac
- [[records/claims/expert-cache-0-133-gb-per-expert-per-layer]] — Each expert per layer costs 0.133 GB of cache
- [[records/claims/io-queue-depth-flat-from-12-to-32]] — Expert read parallelism measured flat from queue depth 12 to 32 and worse above
- [[records/claims/naive-loader-takes-48-gb-of-swap]] — The stock loader took the 48 GB machine into 48 GB of swap without a token
- [[records/claims/dense-trunk-3-8-gb]] — The dense trunk is 3.8 GB and stays resident
- [[records/claims/output-byte-identical-across-cache-sizes]] — Greedy output is byte-identical across cache sizes and live resizes
- [[records/claims/full-context-wait-13-7-min-on-16-gb]] — A full 32k prompt waits about 13.7 min on a 16 GB Mac
- [[records/claims/full-context-wait-5-5-min-on-48-gb]] — A full 32k prompt waits about 5.5 min before its first token on a 48 GB Mac
- [[records/claims/context-state-27-kib-per-token]] — Context state costs about 27 KiB per token
- [[records/claims/context-cap-32768-tokens]] — Prompt plus completion is capped at 32,768 tokens per request
- [[records/claims/auto-ceiling-34-6-gb-with-the-head]] — The auto ceiling becomes 34.6 GB with the draft head on
- [[records/claims/mtp-auto-floor-120-per-layer-28-gb-target]] — Auto turns speculative decode on only when the cache still reaches 120 experts per layer after the head, a 28 GB target
- [[records/claims/speculative-decode-x1-24-at-auto-floor]] — Speculative decode multiplies decode by 1.24 at auto's floor on the dev Mac
- [[records/claims/draft-head-accept-rate-86-percent]] — The draft head predicts the next token 86% of the time
- [[records/claims/prefix-cache-flat-time-to-first-token]] — Time to first token stays flat across a conversation: 6.0 s at turn eight against 25.8 s uncached
- [[records/claims/one-connection-about-70-mb-s-from-a-datacenter]] — One connection alone is bounded near 70 MB/s from a datacenter
- [[records/claims/full-install-112-mb-s-on-1-gbit-s]] — A full install runs at 112 MB/s from a 1 Gbit/s datacenter link
- [[records/claims/tier-rows-are-estimates-from-the-48-gb-curve]] — The 8, 16, 24, and 32 GB tier rows are estimates from the 48 GB curve
- [[records/claims/weights-on-disk-105-3-gb]] — The weights are 105.3 GB across 25 files
- [[records/claims/peak-memory-32-gb-at-auto]] — Peak memory at the auto plan is 32 GB on the dev Mac
- [[records/claims/engine-start-about-2-s]] — Engine start is about 2 s because only the 3.8 GB trunk loads
- [[records/claims/warm-decode-12-tok-s-on-48-gb]] — Warm decode is about 12 tok/s on the 48 GB dev Mac
