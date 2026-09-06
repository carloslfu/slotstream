---
type: decision
id: 01m1thhtyptv7j0hvdv72tmftb
created: 2026-09-06T05:02:42.646666+00:00
updated: 2026-09-06T16:04:29.188947+00:00
summary: Fresh installs use the qualified lossless CDN package; raw sources and original model bytes remain compatible.
decided_on: 2026-09-06
evidence: '[[records/measurements/lossless-model-download-2026-09-05]]'
reversible_if: Reconstruction integrity or bounded-memory gates fail, public delivery becomes less reliable, or a measured byte-identical alternative improves whole-install performance and operating cost.
title: Fresh model downloads use lossless Slotpack from R2 and the CDN
status: reversed
---
Fresh model downloads use the qualified lossless Slotpack v1 package in a dedicated R2 bucket through weights.sevra.page. The original safetensors and all original hashes remain the installed format; inference requires no transport decoder. The complete deterministic package reduces network bytes, and small immutable objects make ordinary edge caching effective without routing weights through the application Worker.

Complete independent builds, all-file public Mac/Linux reconstruction, native malformed-input/HTTP/sanitizer gates, bounded memory, public API compatibility and an actual loaded-model response support this choice. The complete Linux first pull is the zero-fallback public package proof; the Mac installation additionally proves interruption/resume. Timings and CDN hits do not license a universal extra speedup percentage.

Keep pinned Hugging Face raw ranges as fallback, explicit raw/source controls, and existing raw resume compatibility. A new representation requires a new immutable prefix and complete qualification before its embedded pin becomes a released default. This decision concerns transport only; it does not change the engine's SSD layout or model precision.

## Hosting reversal — September 6, 2026

[[records/decisions/hugging-face-lossless-download-default]] replaces R2/CDN hosting with direct public Hugging Face delivery to avoid publisher download charges. The lossless codec, original byte identities and qualification requirements are retained. The earlier text records the original decision.
