---
type: measurement
id: 01m1td69jm7whethywfef3gagt
created: 2026-09-06T03:46:30.100771+00:00
updated: 2026-09-06T22:35:09.092014+00:00
summary: Historical v0.2.10 lossless package and deployment qualification; the codec remains unchanged and current Hugging Face hosting is recorded separately.
date: 2026-09-05
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: Download transport
note: 'Historical R2/v0.2.10 qualification; unchanged codec and byte measurements still stand. Current hosting: [[records/measurements/hugging-face-lossless-download-2026-09-06]].'
order: '1100'
runs: '[[sources/runs/2026/09/2026-09-05-slotpack-package-and-regressions]]'
title: 'Lossless model download: complete package, integrity and CDN delivery'
status: measured
---
This section preserves the original codec and v0.2.10 deployment measurements. Hosting has since moved to Hugging Face in v0.2.11; see [[records/measurements/hugging-face-lossless-download-2026-09-06]]. The codec and model bytes are unchanged.

# Lossless model transport: complete package and delivery

The complete model package uses **16.12% fewer bytes**: 105,264,463,248 original bytes become 88,295,438,048 package bytes, saving 16,969,025,200 bytes. The package includes its embedded manifest; normal clients transfer only the 88,294,086,225 object bytes. Original files, tensor bits, and installed size remain unchanged.

This completes the earlier sample-based compression investigation. The original first-install bottleneck was the volume of network transfer, with client concurrency and redirect costs affecting how fully a route was used. Rehosting raw multi-gigabyte shards alone did not remove that byte cost. The new layout changes the representation and makes each immutable object small enough for ordinary edge caching.

## Evidence and qualification scope

[[sources/runs/2026/09/2026-09-05-slotpack-package-and-regressions]] records complete, independent Mac and Linux builds with identical manifests and compressed objects. Both hash every original file, round-trip every object, and prove exact file coverage. The native codec, manifest validation, real compressed HTTP faults, and raw multi-chunk compatibility checks pass. Linux sanitizer-backed fuzzing completed 233,401 runs without a reported error.

[[sources/runs/2026/09/2026-09-05-slotpack-memory-counterexample-and-repair]] preserves a failure of the new candidate, the incorrect first repair, a bounded regression counterexample, and the successful correction. Completed autoreleased operations retained payloads until a long-lived worker finished; an autorelease pool around the complete per-object iteration, including operation creation, fixes that ownership issue. The sustained 6.44 GB test completes with 352,403,456 bytes peak RSS, whereas the old candidate trips its safety guard. The full resumed CLI reconstruction independently verifies all original files and stays below its 4 GB test guard.

[[sources/runs/2026/09/2026-09-05-slotpack-public-cdn-and-linux-qualification]] captures an uninterrupted fresh Linux public pull of every object, zero raw fallback chunks, and independent SHA-256 verification of all twenty-five original files. The native download completed in 840.6 seconds on the recorded server route, with one cache hit and 4,154 misses. This is a single diagnostic result, not a universal or paired hosting speedup.

[[sources/runs/2026/09/2026-09-06-slotpack-mac-and-final-candidate-acceptance]] captures the complete Mac public installation: an empty destination, a deliberate interruption, resume, and independent original-file verification. No existing model chunks seeded the new copy. Peak sampled RSS across its two download attempts was 1,558,462,464 bytes. The resumed segment reported zero raw fallbacks; the interrupted segment did not emit a final fallback counter. Do not describe this as one uninterrupted fresh timing sample.

The final candidate preserves existing Swift API function references and nonescaping log forwarding. Both native clients revalidate/reuse the complete downloaded model without transfer. The actual Mac CLI source/transport overrides and signal handling pass, as do all transport, static, sampler, external-consumer, and coverage gates. The final binary loads the downloaded model at a 10 GB target and answers the bounded greedy prompt correctly. These are correctness and bounded-memory results; shared-machine timings remain diagnostic. Public release and installed-binary acceptance are recorded below.

[[sources/runs/2026/09/2026-09-06-slotpack-ci-interruption-fixture-correction]] preserves the failed v0.2.9 release gate and its test-only correction: interruption now follows durable progress, including intentionally delayed startup. The complete corrected local suite passes. No v0.2.9 asset was published; v0.2.10 is the corrected published release.

[[sources/runs/2026/09/2026-09-06-slotpack-ci-coverage-regression-closure]] preserves the first v0.2.10 main-CI ratchet failure after every functional gate passed. Direct resumed-byte and CDN-status tests raise local downloader line coverage to 96.87% without changing production code or lowering any floor. The corrected main-CI result is recorded with publication acceptance.

[[sources/runs/2026/09/2026-09-06-slotpack-v0210-publication-and-installed-acceptance]] closes publication: [v0.2.10](https://github.com/carloslfu/slotstream/releases/tag/v0.2.10) is the latest published release, both public CI workflows pass, and the ordinary installer activates the exact signed archive. The installed release passes default/source/cancellation checks, revalidates and reuses all original files without transfer, independently verifies their hashes again, and loads the reconstructed model to return READY at a bounded 10 GB target. The passing main-CI revision adds test coverage only; its production sources match the signed release. Fresh `slotstream pull` now uses the lossless CDN package by default.

## What compression and CDN caching change

The exact compressed fraction is 0.838796260. When the network is limiting, the ideal transfer-time reduction is therefore the same 16.12037% on a slow or fast connection. Decoding, file writes, and final verification overlap downloads where possible. They impose a processing ceiling on faster links, so whole-install time cannot be inferred from the fraction alone.

Transfer-only estimates are about 2 hours at 100 Mbps or 8 hours at 25 Mbps. These rounded estimates exclude protocol overhead, retries, changing throughput, and any unhidden processing. The exact idealized byte arithmetic is:

| Nominal link | Original transfer | Compressed package transfer | Ideal saving |
|---|---:|---:|---:|
| 25 Mbps | 33684.6 s | 28254.5 s | 5430.1 s |
| 100 Mbps | 8421.2 s | 7063.6 s | 1357.5 s |
| 500 Mbps | 1684.2 s | 1412.7 s | 271.5 s |
| 1000 Mbps | 842.1 s | 706.4 s | 135.8 s |
| 5000 Mbps | 168.4 s | 141.3 s | 27.2 s |

CDN hits affect latency, route throughput, and origin load. They do not remove the remaining client download bytes and must not be counted as another fixed percentage reduction. A new edge can miss the cache and fetch from R2; a repeated read of the same immutable object can hit. Real HIT responses and full-client results must be preserved as measurements rather than inferred from cache eligibility.

## Implementation and operational contract

The qualified default is a stable Slotpack v1 representation: bounded independent objects containing packed four-bit weights plus losslessly predicted BF16 metadata. The model is never requantized. Object hashes, reconstructed-chunk hashes, and original whole-file hashes remain mandatory. The pinned manifest rejects gaps, overlap, unsafe paths, unknown formats, and length/range overflow.

Each network worker owns a persistent URLSession. Concurrency starts at eight and tests larger counts only while throughput improves; explicit counts remain fixed. The decoder queue and per-iteration object lifetime bound memory. Disk admission accounts for reconstructed output; verified resume bits follow synced writes. Cancellation drains work. Optional-file cleanup cannot race in-flight writes, and missing optional files no longer cause readiness to request another download indefinitely.

Cloudflare R2 stores immutable content-addressed objects under a manifest-specific prefix behind the public custom domain. The application wildcard Worker is excluded for that hostname. The original Hugging Face pins remain an independent raw fallback. Existing raw resumes and explicit source overrides retain their semantics. See `docs/DOWNLOAD-FORMAT.md` and the producer/qualification tools under `Tools/slotpack/`.
