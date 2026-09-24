---
type: index
scope: type-folder
folder: records/decisions
updated: 2026-09-23T18:14:44.276641Z
---

# records/decisions

- [[records/decisions/sevra-live-folder-navigation]] — Live folder access with bounded navigation, reliable search cursors and fresh-read edit checks
- [[records/decisions/sevra-app-speed-defaults-2026-09-23]] — Enable qualified desktop speedups without extra user switches
- [[records/decisions/automatic-prefill-read-policy]] — Apply supported prefill improvements automatically
- [[records/decisions/automatic-mtp-prefill-read-policy]] — Apply MTP prefill improvements automatically
- [[records/decisions/qualified-upstream-fused-prefill]] — Adopt qualified upstream fused prefill on the measured M5 Pro profile
- [[records/decisions/prefill-opportunities-remain-experimental]] — Keep larger read groups and fused workspace experimental
- [[records/decisions/prompt-speed-qualified-paths]] — Promote qualified prompt reuse and read scopes; hold the fused-attention upgrade
- [[records/decisions/kernel-upgrade-fidelity-and-cache-equivalence]] — Separate kernel-upgrade fidelity from warm/cold cache equivalence
- [[records/decisions/coverage-as-review-feedback]] — Coverage as review feedback
- [[records/decisions/adaptive-memory-limits]] — Custom process ceilings remain adaptive above the automatic default; hardware headroom, diagnostics and startup agree.
- [[records/decisions/automatic-context-window-per-machine]] — Auto picks the largest of 32,768, 65,536, 131,072 and 262,144 tokens that keeps speculative decoding, retains one conversation and adds at most 10% to a typical request
- [[records/decisions/automatic-context-preserves-unmeasured-cache]] — Automatic context preserves cache whose loss is unmeasured
- [[records/decisions/a-continued-conversation-computes-what-a-cold-one-computes]] — A turn resumes only its own prefill pass boundaries, so a continued conversation is exact against a cold read, at one partial pass per turn
- [[records/decisions/verify-pass-split-attention-default]] — The speculative verify pass splits its attention from 6,144 tokens by default; the exact mode stays opt-in
- [[records/decisions/newcomer-documentation]] — Keep the README approachable and complete, with evidence and community sections; reserve detailed setup and engineering references for linked guides.
- [[records/decisions/native-stack-stated-on-every-surface]] — Public surfaces state the native Swift/MLX/Metal stack as design; speed stays attributed to measured mechanisms
- [[records/decisions/target-range-macs-that-cannot-hold-the-model]] — Slotstream is built for Macs that cannot hold the model, 16 to 64 GB; 96 GB and larger Macs run it but are not the optimization target
- [[records/decisions/corrected-decode-forecast-default-with-the-sidecar]] — The lookahead forecasts from the previous layer's attention output with a rank-128 correction shipped as a pinned sidecar; 1.111 over the previous configuration, identical output, 409 MiB
- [[records/decisions/draft-head-auto-floor-76-per-layer]] — Auto enables the draft head when the cache keeps 76 experts per layer after its charge, a 21 GB target, so 32 GB Macs and up; the former floor was 120
- [[records/decisions/draft-depth-defaults-to-one-and-auto-floor-120-per-layer]] — Speculative decode drafts one token by default and auto enables it only at 120 experts per layer and up
- [[records/decisions/draft-depth-defaults-to-two]] — Two draft tokens are the adopted operating default; activation and memory policies remain separate
- [[records/decisions/decode-lookahead-default-with-the-draft-head]] — Router-reuse prefetch, FP32 router weights and a four-layer GPU barrier run wherever the draft head does, charged 373 MiB; held out at 1.114 with identical output
- [[records/decisions/decode-host-time-is-waiting-not-graph-construction]] — Decode host time is waiting on the GPU and on reads, not graph construction: no layer compilation and no host point fixes
- [[records/decisions/residency-speculation-waits-for-layer-completeness]] — Residency speculation waits: only 2.2% to 2.5% of layer events are fully resident, too few to pay for rollback machinery
- [[records/decisions/clock-stays-the-eviction-policy]] — CLOCK stays the eviction policy: measured against LRU and LFU on a real trace
- [[records/decisions/global-paging-is-diagnostic]] — Treat host-wide paging as diagnostics, separate from functional and process-memory acceptance; preserve actual headroom, pressure and budget safeguards.
- [[records/decisions/guillermo-rauch-grant-acknowledgment]] — Credit Guillermo Rauch personally using his official GitHub photo, full name and the verified Slotstream grant listing.
- [[records/decisions/auto-target-is-the-33-gb-knee-not-70-percent-of-ram]] — Auto retains the evidence-based 33 GB default; larger-target predictions do not prove a universal performance plateau.
- [[records/decisions/benchmark-startup-swapin-exclusion-2026-09-09]] — Explicit paired benchmark startup swap-in exclusion with unchanged hard resource limits
- [[records/decisions/bounded-mtp-tail-excluded-from-combined]] — Preserve the original MTP verification shape after exact-output counterexamples
- [[records/decisions/compact-ngram-storage-and-ring-disposition-2026-09-07]] — Select exact compact BF16 storage and reject ring eviction variants
- [[records/decisions/hugging-face-lossless-download-default]] — Use the unchanged compressed Hugging Face package by default, preserving exact original bytes while removing metered R2 model hosting.
- [[records/decisions/lossless-cdn-download-default]] — Fresh installs use the qualified lossless CDN package; raw sources and original model bytes remain compatible.
- [[records/decisions/images-are-inline-bytes-only]] — slotstream never dereferences a URL a request hands it; images are inline bytes only
- [[records/decisions/vision-tower-is-a-conditional-memory-charge]] — The vision tower is announced by the memory plan and charged when it loads, never folded into the fixed footprint
- [[records/decisions/query-blocked-attention-is-a-bound-not-an-optimisation]] — Query-blocked attention is a bound above the measured product, not an optimisation
- [[records/decisions/pool-path-scatters-lazily-and-reads-on-32-lanes]] — The pool path finishes its scatter lazily and reads on 32 lanes
- [[records/decisions/staging-buffer-recycling-rejected]] — Staging buffer recycling was built, measured no faster and 6% slower with a higher peak, and dropped
- [[records/decisions/prefill-passes-of-256-tokens-sweep-and-never-load-the-pool]] — Prefill passes of 256 tokens or more sweep through staging and grouped GEMM; only the last pass writes the pool
- [[records/decisions/bench-rig-m8-deprioritized-behind-retention-work]] — The M8 bench rig and full tier validation are deprioritized behind what decides whether a person keeps using slotstream
- [[records/decisions/custom-metal-kernels-are-not-blocked-on-xcode]] — Writing a new Metal kernel is not blocked on Xcode; only mlx-swift's bundled shader library is, and it is vendored
- [[records/decisions/prefix-cache-holds-four-conversations-extend-only]] — The conversation prefix cache holds four states and only ever extends, never rewinds
- [[records/decisions/cross-layer-read-ahead-removed]] — Cross-layer read-ahead was built, measured slower in every paired run, and removed
- [[records/decisions/quality-gate-against-fp8-needs-a-credential]] — The quality comparison against the FP8 reference (N4) waits for a paid inference credential
- [[records/decisions/download-hosting-is-not-a-lever-below-3-gbit-s]] — Hosting the weights elsewhere is not a download-speed lever below about 3 Gbit/s per client
- [[records/decisions/m2-container-repack-skipped-by-measurement]] — The .ssmodel container and repack (M2) are skipped: the engine streams from the original shards
