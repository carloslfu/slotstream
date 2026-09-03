---
type: index
scope: type-folder
folder: records/decisions
updated: 2026-09-03T06:46:41.441284Z
---

# records/decisions

- [[records/decisions/clock-stays-the-eviction-policy]] — CLOCK stays the eviction policy: measured against LRU and LFU on a real trace
- [[records/decisions/query-blocked-attention-is-a-bound-not-an-optimisation]] — Query-blocked attention is a bound above the measured product, not an optimisation
- [[records/decisions/pool-path-scatters-lazily-and-reads-on-32-lanes]] — The pool path finishes its scatter lazily and reads on 32 lanes
- [[records/decisions/staging-buffer-recycling-rejected]] — Staging buffer recycling was built, measured no faster and 6% slower with a higher peak, and dropped
- [[records/decisions/prefill-passes-of-256-tokens-sweep-and-never-load-the-pool]] — Prefill passes of 256 tokens or more sweep through staging and grouped GEMM; only the last pass writes the pool
- [[records/decisions/bench-rig-m8-deprioritized-behind-retention-work]] — The M8 bench rig and full tier validation are deprioritized behind what decides whether a person keeps using slotstream
- [[records/decisions/custom-metal-kernels-are-not-blocked-on-xcode]] — Writing a new Metal kernel is not blocked on Xcode; only mlx-swift's bundled shader library is, and it is vendored
- [[records/decisions/prefix-cache-holds-four-conversations-extend-only]] — The conversation prefix cache holds four states and only ever extends, never rewinds
- [[records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram]] — Auto targets the 33 GB knee of the measured curve, never a share of RAM above it
- [[records/decisions/draft-depth-defaults-to-one-and-auto-floor-120-per-layer]] — Speculative decode drafts one token by default and auto enables it only at 120 experts per layer and up
- [[records/decisions/cross-layer-read-ahead-removed]] — Cross-layer read-ahead was built, measured slower in every paired run, and removed
- [[records/decisions/quality-gate-against-fp8-needs-a-credential]] — The quality comparison against the FP8 reference (N4) waits for a paid inference credential
- [[records/decisions/download-hosting-is-not-a-lever-below-3-gbit-s]] — Hosting the weights elsewhere is not a download-speed lever below about 3 Gbit/s per client
- [[records/decisions/m2-container-repack-skipped-by-measurement]] — The .ssmodel container and repack (M2) are skipped: the engine streams from the original shards
