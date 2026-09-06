---
type: performance-audit
meta-type: conclusion
id: 01m1t4p86n8xda1yvj0txfh6ya
created: 2026-09-06T01:17:55.797589+00:00
updated: 2026-09-06T03:47:58.510905+00:00
summary: Type-aware lossless transport estimates 16% fewer bytes; two complete 2.192 GB shard archives prove 16% reduction and exact pinned reconstruction; download-speed qualification remains
date: 2026-09-05
note: The complete package and production transport are qualified separately in [[records/measurements/lossless-model-download-2026-09-05]]; this record preserves the earlier probe.
title: Aggressive lossless compression of the first model download
status: analysis
---
# Aggressive lossless compression of the first model download

The strongest qualified compression probe supports **about 16% fewer download bytes** for the existing model: an estimated **105.264 GB → 88.455 GB**, saving **16.809 GB** without changing model values. A complete 2.192 GB shard independently compressed by **16.00%** and reconstructed to its original pinned SHA-256. This replaces the earlier 10–11% estimate as the best tested lossless packaging opportunity; it does not establish a theoretical maximum or a completed 105 GB package.

The useful discovery is the relationship between quantization scales and biases. Increasing a generic compressor's effort alone does little for the dominant packed weights. Encoding their existing four-bit symbols and their quantization metadata according to their actual structure produces the additional saving.

Independent artifact sizes, hashes, estimate arithmetic and source digests are in [[sources/runs/2026/09/2026-09-05-download-compression-artifact-inspection]]. Exact experiment outputs, failed-candidate evidence and reproducible Python/C sources are in [[sources/runs/2026/09/2026-09-05-download-aggressive-lossless-experiments]]. That experiment run is marked discarded **for runtime performance conclusions** because other work ran on the shared Mac. Its deterministic compression byte counts and byte-equality checks are separately confirmed by the artifact inspection. No production downloader, original model file, installer or hosting configuration changed.

## Results and what they mean

All sizes below use decimal GB. Complete-checkpoint sizes are estimates from the broader sample, with all unsampled small files, headers and tiny tensors conservatively left uncompressed.

| Transport representation | Estimated complete download | Bytes saved |
|---|---:|---:|
| Current reconstructed safetensors transfer | 105.264 GB | — |
| Ordinary Zstandard level 3 | 94.613 GB | 10.12% |
| Quantization-aware transforms with a simpler Zstandard decoder | 89.971 GB | 14.53% |
| Quantization-aware transforms plus conditional entropy coding | 88.455 GB | 15.97% |

The last two estimates include probability tables and sample-level framing/codec-selection overhead. They are alternative representations of the same original bytes. They must not be added to the previous 2.384% Xet storage-transfer saving. No additional quantization, dropped tensor, reduced precision, or changed model output is involved.

The simpler profile uses reversible centering of packed symbols and prediction of scale/bias pairs with Zstandard. The strongest profile additionally models the four-bit distribution using the already decoded scale and zero-point information, and entropy-codes the BF16 values, small integers and exact residuals. Adaptive selection is performed offline and includes the method selector in byte accounting.

### The data explains the limit

| Data family | Original population | Strong probe byte reduction |
|---|---:|---:|
| Packed expert weights | 60.398 GB | 7.91% |
| Packed n-gram weights | 25.600 GB | 4.68% |
| Expert scale/bias pairs | 7.550 GB | 70.80% |
| N-gram scale/bias pairs | 6.400 GB | 69.34% |

Other main-model and draft-head tensors are included in the complete-checkpoint estimate with their own byte weights. The packed weights dominate total size and are already fairly close to the empirical entropy of their four-bit symbols under the tested models. The large metadata percentage therefore becomes a moderate whole-checkpoint reduction. These marginal/conditional entropy measurements do not prove a universal lower bound over every possible lossless algorithm, but the search provides no evidence for a 50% or 75% reduction of the complete model.

## The reversible transform

MLX affine quantization stores a group of four-bit values together with a BF16 scale and bias. Groups contain 64 values for most tensors and 32 for n-gram embeddings. The inspected quantization code rounds an integer zero-point and adjusts the scale against the selected extreme value. Consequently, scale and bias are strongly related; they are not two independent BF16 numbers.

The successful predictor preserves the scale's exact bits, stores a small integer derived from `round(-bias / scale)`, predicts the bias from that integer and scale, and stores an exact residual between the predicted and actual BF16 bit patterns. Every residual is retained, including unusual cases. The decoder reconstructs the original scale and bias bits, then uses that already available information to decode the four-bit weights. It never re-quantizes the model.

The native follow-up also tested predicting scale from bias instead. That direction was exact before residuals in the initial four metadata samples and still retains residuals for generality. Its larger-block improvement over the main scheme was tiny, so no extra whole-checkpoint percentage is claimed from it.

## Probe coverage and correctness

The initial screen completed 377 exact encode/decode checks across Zstandard levels 3, 9, 19 and 22; XZ/LZMA2 preset 9 extreme; Brotli quality 11; BZip2; Blosc2 byte/bit shuffle; expanded four-bit symbols; packed re-centering; byte and bit-plane rearrangements; BF16 XOR/delta predictors; and direct/conditional ANS models. PPMd-I was also attempted, but its decoder rejected a shuffled BF16 payload; the raw failure was retained and that implementation excluded.

The broader qualification used 106 aligned windows across all twelve safetensors files. Tensor selection was stratified by component and role, with probability proportional to original tensor bytes; a random point was drawn inside each equal cumulative-byte interval, then a random window within the selected tensor. It covered 779,206,656 sampled bytes, including some repeated/overlapping small-tensor windows, or **764,782,592 distinct original bytes**. The seed, exact tensor names, offsets and hashes are preserved. It completed another 654 exact roundtrips. This is a weighted sample estimate, not a formal confidence interval.

The full-file prototype packed every byte of `model-00011.safetensors`, including its original header and all tensors, into independently described frames with original offsets and hashes. Weights and their corresponding metadata are packaged together; the decoder gets all model values from the archive. A complete coverage check proves no missing or duplicated output ranges, followed by the pinned whole-file SHA-256.

| Complete shard proof | Original bytes | Archive bytes | Reduction |
|---|---:|---:|---:|
| Constriction entropy coder | 2,192,353,120 | 1,841,470,354 | 16.00485% |
| Specialized native rANS decoder format | 2,192,353,120 | 1,841,504,097 | 16.00331% |

Both reconstructions match `9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0`, the SHA-256 pinned in `PinnedModel.swift`. The native follow-up additionally passed 48 larger-block reconstruction checks and 12 synthetic alphabet/constant/tail checks. This establishes a real, reversible representation rather than an estimate that omits essential side information. The complete test shard does not contain n-gram tensors; their contribution is supported by the broader n-gram sample and separate 32 MiB native block checks.

The native coder uses four interleaved rANS states and direct symbol lookup with normalized frequency tables. It retains almost exactly the same compression fraction as the research implementation. The source is a bounded research prototype; shipping it still requires a stable format, bounded untrusted-input parsing, source/hash binding, cancellation, resume and client integration. These are concrete remaining product work, not completed production gates.

## Processing cost and first-install time

The size probes recorded timings, but background compilation/tests and system activity prevent accepting them as isolated performance measurements. They are preserved and explicitly excluded from install-time claims. Neither the native prototype nor the simpler Zstandard profile has completed an integrated network/download/verification benchmark. The large size reduction of the metadata does not justify assuming that unpacking is free.

Decode frames while other frames are downloading, and use bounded parallel workers. Waiting until the entire compressed model arrives before starting decompression unnecessarily adds the full processing time to the critical path. For original bytes `B`, compressed fraction `r`, useful network rate `R`, and decoder throughput in original bytes per second `D`:

- Sequential download, then decode: `rB/R + B/D` before other costs.
- An overlapping steady pipeline approaches `max(rB/R, B/D)` plus startup/tail and any unhidden write/verification work.
- At a fully used 1 Gbit/s payload rate, preserving the full approximately 16% saving requires about **149 MB/s of aggregate decoded output** when stages overlap. Downloading first and decoding afterward requires over **783 MB/s** merely to beat the raw-transfer time. These are derived thresholds, not measured decoder speeds.

At fixed goodput, ideal transfer-only savings are about 22 minutes 25 seconds at 100 Mbit/s, 4 minutes 29 seconds at 500 Mbit/s, 2 minutes 14 seconds at 1 Gbit/s, and 27 seconds at 5 Gbit/s. Protocol overhead, retries, disk performance and unhidden decoding change actual installation time. The byte saving remains approximately 16% regardless of connection speed; the net time saving depends on the complete pipeline.

## Recommendation

Proceed with a **quantization-aware, lossless transport package**, targeting approximately 16% fewer bytes, with the simpler approximately 14.5% profile as a useful comparison. Compress once before publication, retain the exact original pinned hashes, and decode self-contained chunks while downloading with bounded memory and parallelism. Compare the two profiles using a complete verified install before choosing a default. The next compression-size gate is the whole 105 GB checkpoint; the next speed gate is the real downloader.

This is primarily a representation and client-delivery improvement. R2 or another host can store these immutable compressed chunks, but moving the existing raw shards alone will not produce the measured saving. CDN route/cache benefits are separate and still need measurement. A practical small-object layout also supports resume, retry and edge caching; the two archive files produced here are proof artifacts, not the intended CDN object layout.

This result supersedes the earlier 10–11% compression opportunity in [[records/analyses/2026-09-05-first-download-bottleneck-audit]]. It does not change that audit's conclusion that the dominant first-install cost is moving a very large model over the available network path.
