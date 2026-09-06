---
type: measurement
id: 01m1vqcy8mtdhgkwmbe28hy82s
created: 2026-09-06T16:04:08.084467+00:00
updated: 2026-09-06T22:07:35.338645+00:00
summary: Complete public Linux download and resumed native Mac installation reproduce every original file; public main CI passes. Mac timing measurements are discarded.
date: 2026-09-06
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1110'
runs: '[[sources/runs/2026/09/2026-09-06-slotpack-hugging-face-full-mac-qualification]]'
title: 'Hugging Face transport: unchanged bytes and publisher cost'
status: measured
---
The unchanged lossless Slotpack package is published in the separate public repository [carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack](https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack), pinned at commit `13ec15dcebdddc817b57f0f9087c5ef82018f10e`. The original raw repository and its original pinned revision remain intact. Keeping the representations in separate repositories prevents ordinary Hugging Face clients from downloading both.

The original compression and integrity measurements in [[records/measurements/lossless-model-download-2026-09-05]] remain valid: this move changes hosting, not the model, codec, object bytes, manifest or reconstructed file hashes. [[sources/runs/2026/09/2026-09-06-slotpack-hugging-face-publication]] captures committed-object identity verification and anonymous public reads.

[[sources/runs/2026/09/2026-09-06-slotpack-hugging-face-linux-and-gates]] captures a complete fresh anonymous download using the exact production Swift/C engine and embedded Hugging Face default in the Linux bandwidth instrument. Every original file passes the client checks and independent GNU sha256sum verification; the client reports zero raw fallback chunks. Its download counter reports 799.2 seconds; subsequent explicit verification and independent hashing are outside that counter. This is a single route diagnostic, not a paired host comparison or universal installation-time claim. The final native Mac static and installer checks also pass. [[sources/runs/2026/09/2026-09-06-slotpack-hugging-face-full-mac-qualification]] additionally records a complete native Mac installation begun in an empty directory, interrupted by a hostname-resolution failure and resumed without external chunks: every original file independently matches. The completed resumed segment reports zero raw fallback chunks; the interrupted segments emitted no final fallback counter. Public main CI passes all functional, consumer, catalogue and coverage gates. Release installation acceptance is the next gate.

Hugging Face resolver throttling can require a full reset-window wait. The shared HTTP transport now honors its RateLimit reset and longer Retry-After values, with a bounded, cancellable wait. Real HTTP fixtures verify retry and prompt cancellation. Original compressed-object, reconstructed-chunk and whole-file checks, raw compatibility and resume remain intact.

The legacy weights.sevra.page hostname now redirects through Cloudflare's static asset service to the same exact Hugging Face commit. The deployed version serves assets directly, has no bindings, and does not invoke a Worker function. Its staged public object checks pass. [[sources/runs/2026/09/2026-09-06-slotpack-hugging-face-legacy-compatibility]] additionally verifies the unchanged released v0.2.10 client following the live redirect, reconstructing a missing model shard and metadata with exact original hashes and zero raw fallback. The complete native Mac installation also passes after resuming its preserved progress. The redundant R2 copy can now be retired; deletion is recorded separately after it completes.

Under its current [public storage policy](https://huggingface.co/docs/hub/en/storage-limits), Hugging Face provides best-effort public hosting without publisher charges per download. Limits still apply. No paid plan, metered proxy or billing fallback is enabled. [Static asset redirects are free](https://developers.cloudflare.com/workers/static-assets/billing-and-limitations/); the separate R2 copy continues to occupy storage until retirement is verified.

Cloudflare volume/address analytics now cover only legacy redirect traffic. Hugging Face's default model counter follows selected query files, while the compressed client fetches hash-named objects and embeds its manifest. Neither counter measures completed compressed installations. GitHub release acquisition proxies remain available; no telemetry or counting-only request was added.
