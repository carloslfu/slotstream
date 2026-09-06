---
type: performance-audit
meta-type: conclusion
id: 01m1sydxwsaynqp99bhaa9xmb5
created: 2026-09-05T23:28:31.641082+00:00
updated: 2026-09-06T01:20:44.550845+00:00
summary: First download is mainly a 105 GB transfer; lossless packaging now supports 16% fewer bytes with full-shard hash proof, while install-speed qualification remains
date: 2026-09-05
git_head: 770dba67a298450231d6f2a6f2ead08ffa4aac16
title: First-download bottleneck audit
status: analysis
---
# First-download bottleneck audit — 2026-09-05

The principal cost is moving **105.264 GB across the available network path**. The original client bug was real and consequential, but is already fixed. The current code does not impose a demonstrated universal 50 MB/s ceiling. The best existing full-install evidence is 112 MB/s on a 1 Gbit/s connection, close to that connection's practical payload capacity. A different host cannot turn that particular 16-minute transfer into a two-minute transfer without also reducing bytes or increasing usable network bandwidth.

There is still worthwhile work: the later aggressive compression probe supports approximately 16% fewer bytes and verifies that reduction on a complete shard; connection adaptation and removing repeated resolves may help other paths; progress and retry accounting have concrete defects. A wholesale hosting migration has no established large benefit for the measured audience. The earlier universal “below 3 Gbit/s hosting cannot help” conclusion is too strong and should not be used as a physical law.

This audit changed no production downloader or installer source and provisioned no infrastructure. It inspected the dirty working checkout at `770dba67a298450231d6f2a6f2ead08ffa4aac16`; the three download-source hashes stayed identical throughout. Raw diagnostics and runnable probes are preserved in [[sources/runs/2026/09/2026-09-05-download-first-principles-audit]].

## 1. What first use actually does

1. `install.sh:30–64` downloads a prebuilt executable/Metal library archive, about 50 MB, verifies its SHA-256, and extracts it. macOS 14/15 additionally fetches an approximately 40 MB compatibility wheel. These are tiny beside the model; the installer does not compile or quantize the model on the customer's machine.
2. `Sources/slotstream-cli/main.swift:178–222` checks whether the pinned files exist, offers the model download, then calls `WeightStore.download` and `WeightStore.verify`.
3. `PinnedModel.swift` pins 25 files totaling **105,264,463,248 bytes**. Eleven model shards are approximately 2.2–10.3 GB each; the optional draft head adds **1,470,955,171 bytes**. “Optional” here means absence/failure is tolerated. A normal fresh pull still fetches it when available.
4. `WeightDownload.swift:251–312` checks completed files, opens/pre-sizes sparse `.part` files, restores chunk maps, and queues missing ranges. In a fresh install there are **1,586 chunks of at most 64 MiB**, including small files. The old documentation's approximately 1,620 chunks mixed decimal MB with MiB.
5. `WeightDownload.swift:223–228,327–393,479–509` creates eight separate ephemeral URLSessions and eight workers by default. Each worker has one request in flight, waits for it, and takes another chunk. Concurrency is fixed for the job and capped at 32. Most workers are on the same shard, but work continues across shard boundaries.
6. Each chunk requests the Hugging Face `resolve` URL, follows its redirect, and downloads an exact HTTP byte range. `Accept-Encoding: identity` explicitly disables transparent HTTP compression. No native Xet reconstruction path runs.
7. `WeightDownload.swift:564–598` streams callbacks into `pwrite` at final offsets. It does not allocate a 10 GB body, convert tensors, or repack experts. Finished files are flushed, then SHA-256 checked on a background serial queue and atomically renamed. Map durability is periodically flushed from worker threads; hashing overlaps subsequent downloads.
8. `Sources/slotstream-cli/Pull.swift:38–39` and first-use `ensureWeights` each call a full parallel verification after download. Thus newly downloaded bytes are hashed on completion and again by the CLI. Subsequent ordinary server startup can hash them again. This adds a tail; the historical development-Mac full verification was about 8–10 seconds, not an explanation for an hour of network transfer. Slower external disks may differ.

The actual tensor contents explain the size: **67.948 GB routed experts, 32.000 GB n-gram tables, 3.822 GB other main-model tensors, and 1.471 GB draft head**. Across all tensors, 89.725 GB is packed U32 data and 15.516 GB is BF16. A “4-bit model” is not entirely packed four-bit symbols: scales, biases and some ordinary weights remain BF16.

## 2. First-principles bound

For a fixed model and a healthy pipeline:

`transfer time ≈ wire bytes / achieved goodput + setup + unhidden verification`

Achieved goodput is constrained by the access/ISP/peering route, source capacity, the number and behavior of transport connections, and the client's ability to write and verify bytes. For a connection, the receive-window/RTT term is an upper bound, not a throughput prediction. Loss, congestion, flow control and source behavior can lower it.

This Mac still reports a 4 MiB maximum automatically grown TCP receive buffer. At a 100 ms round trip, the window term is about 41.9 MB/s per connection; eight such windows could cover roughly 335 MB/s before other constraints. This is why eight real connections can remove the historical single-connection bottleneck, while sixteen need not help a path delivering 30–60 MB/s in aggregate.

The payload alone imposes these ideal lower bounds, using decimal units and ignoring all protocol overhead:

| Usable nominal link | Ideal time for 105.264 GB |
|---|---:|
| 25 Mbit/s | 9 h 21 min |
| 100 Mbit/s | 2 h 20 min |
| 500 Mbit/s | 28 min 4 s |
| 1 Gbit/s | 14 min 2 s |

The full 103.8 GB historical run at 112 MB/s took about 15.5 minutes. For today's slightly larger payload the same sustained rate implies about 15.7 minutes. The model is already quantized, and SSD streaming reduces RAM requirements; it does not reduce the amount needed for a complete offline installation.

## 3. What the evidence establishes

### Historical experiments

[[records/measurements/the-finding-eight-requests-one-connection]] records the actual HTTP/2 mistake: eight requests in one session used one connection. The repair was one session per worker, shipped in 0.2.1. Apple's current [connection-limit documentation](https://developer.apple.com/documentation/foundation/urlsessionconfiguration/httpmaximumconnectionsperhost) still confirms that HTTP/2 ignores that HTTP/1.1 connection-limit setting.

[[records/measurements/the-fix-and-its-gates]] records the exact download code completing a full 24-file verified installation at 112 MB/s on the Helsinki 1 Gbit/s port. Its local Range-server run completed at multi-GB/s, ruling out a universal tens-of-MB/s ceiling in the local stream/write path. These are historical measurements imported from the frozen September 2 document; this audit did not repeat a full 105 GB transfer or cold SSD benchmark.

[[records/measurements/hugging-face-has-no-per-client-cap-the-home-link-has-one]] compares Hugging Face, R2 direct, Cloudflare generated edge bytes and cache hits. They approximately filled the Helsinki port and landed in a much narrower home-link band. That supports a network-path bottleneck in those environments. It does not uniquely identify Wi-Fi, an ISP contract, peering, shaping, or a universal Hugging Face server limit. The older R2 rejection and 55 MB/s source-ceiling claim were explicitly corrected in [[records/measurements/corrections-to-earlier-sections]].

### Fresh bounded transport probes

A standalone Swift probe used the current client's per-worker URLSession settings, 64 MiB ranges and direct streaming/discarding of bodies, with URLSessionTaskMetrics. It fetched **6.577 GB** in total, verified every HTTP range and byte count, and observed zero request errors. It did not exercise disk writes, resume maps or whole-file hashes and must not be presented as another full install.

| Configuration | First observation | Second observation |
|---|---:|---:|
| Eight sessions, resolve each chunk | 47.73 MB/s | 27.57 MB/s |
| Eight sessions, reuse resolved URL | 47.82 MB/s | 31.04 MB/s |
| Sixteen sessions, resolve each chunk | 35.94 MB/s | 38.99 MB/s |

A smaller single-session control moved 134 MB at 14.48 MB/s. Metrics proved eight and sixteen distinct payload flows in the corresponding tests. Resolve cases used 32 HTTP transactions for 16 chunks; direct cases used 16, with a separate one-time HEAD taking 0.48–0.76 seconds.

The first direct/resolve pair was almost identical. Substantial temporal drift and differing cold-start fractions prevent a reliable speedup estimate or a steady-state optimum: sixteen sessions fetched one chunk each, whereas eight sessions fetched two each. Most recorded worker time was spent receiving bodies, not waiting for redirects. This supports prioritizing actual goodput and byte count, rather than promising a large gain from one fewer redirect.

### Fresh complete Xet metadata

Anonymous token issuance works for the pinned mirror. The complete v2 reconstruction metadata was fetched for all twelve safetensors files, with no xorb bodies downloaded. Each response's unpacked term total equaled the pinned file size; HEAD SHA-256 identifiers matched the compiled manifest.

- Original tensor-file bytes: **105,241,154,252**.
- Sum of required physical Xet fetch ranges: **102,732,486,710**.
- Savings: **2,508,667,542 bytes, or 2.384%**, excluding HTTP/TLS overhead and small non-tensor files.
- Merging overlapping ranges globally did not reduce that total further.
- Every returned data URL used **`us.aws.cdn.hf.co`**, the same hostname seen for the current plain-HTTP redirect.

Thus the currently stored Xet representation cannot cut this model's transfer in half through compression or deduplication. It could still improve transport behavior; that has not been measured end to end here. Its name and protocol alone do not establish a faster nearby CDN path. The old August 29 `hf_xet` test at 55.7 MB/s also failed to show a gain on that home link, although it was only one shard and one environment.

[Hugging Face's Swift Xet package](https://github.com/huggingface/swift-xet) already exists. The inspected source was commit `0687c5be8182967e68927d28b1ee6fcdfcfe2f40`, dated July 29, 2026. It uses AsyncHTTPClient/SwiftNIO, pools clients, decodes LZ4/BG4 and supports range downloads. Integration is not just replacing a function: its file method deletes an existing destination, so Slotstream must preserve its own resume and integrity contract; its current CAS adapter uses v1 reconstruction, while the [current protocol](https://huggingface.co/docs/xet/download-protocol) documents v2. Its default 128 concurrent fetches also needs an explicit memory/concurrency assessment. A new Swift implementation from scratch is not a justified prerequisite.

### Fresh lossless compression sample

The initial sample below is preserved as earlier evidence. Its 10–11% opportunity estimate is superseded by [[records/analyses/2026-09-05-first-download-aggressive-lossless-compression]], which investigates the quantization structure, estimates approximately 16% fewer bytes, and verifies the reduction with exact reconstruction of a complete shard.

A deterministic 128 MiB sample covered eight component/dtype strata, up to four tensors per stratum, with 2 MiB samples at the 25% and 75% positions. Every compressed sample was decoded and, where grouped, inverse-transformed to its exact original bytes.

Weighted by actual tensor population bytes:

| Representation | Estimated fraction of original bytes |
|---|---:|
| Zstandard level 3 | 89.76% |
| Two-byte grouping plus Zstandard level 3 | 88.63% |
| Four-byte grouping plus LZ4 | 96.98% |

These are sample-based packaging estimates, not full-archive sizes or download-speed claims. The sample is stratified and deterministic, not a statistical confidence interval. Nevertheless, “4-bit weights do not compress” is disproved. The packed experts alone compressed to about 93% with ordinary Zstandard, and BF16 scales/biases compressed substantially more.

The subsequent full-file prototype verified the original pinned SHA-256 after reconstruction. It achieved approximately 16% reduction with quantization-aware entropy coding, and the broader weighted sample estimates about **16.8 GB less network traffic**. A simpler Zstandard-based profile estimates approximately 14.5% savings. At fixed network goodput the transfer-only saving follows the byte reduction; net installation time still needs an overlapping decode/write/verification benchmark. See the aggressive-compression follow-up for exact artifact sizes, coverage and timing exclusions.

## 4. Remaining code issues and improvements

| Item | Consequence | Recommendation |
|---|---|---|
| Fixed eight connections | Can leave capacity unused on high-RTT or multigigabit paths; a larger fixed default can also waste resources | Add measured adaptation with backoff, using successful unique-byte goodput, then qualify on a path with demonstrated headroom |
| Resolve on all 1,586 chunks | Extra round trips and resolver requests | Cache one ordinary file redirect while valid; refresh on expiry/auth failure and retain source/hash checks. A live HEAD URL served distinct ranges correctly and expired in about an hour |
| One request per worker | Connection goes idle between response completion, bookkeeping and the next response | Test modest per-session request overlap after measuring control-time exposure; it may not improve a link already saturated |
| Progress only from `completeChunk`/`flushMaps` | “Every two seconds” is only a condition checked at chunk completion, not a timer | Drive progress independently from transport completion and report separate downloading/verifying phases |
| Retry bytes counted again in `grandDone` | Progress/ETA can overstate completed data or even exceed total after retries | Separate received wire bytes from durable unique bytes; expose retries and failed sources |
| `fsync` and map flush run on workers | One worker can block on a slow destination during bookkeeping | Instrument flush/write latency first; preserve data-before-map durability if moving it to a bounded writer queue |
| Full verification repeated after per-file hashes | Additional reads and CPU at the end | Consider a trustworthy per-job verified result to avoid immediate redundant work; keep explicit verify and corruption checks |
| Optional draft head fetched before returning | About 1.4% of total bytes on the first download | Could defer it, but this is a small time saving and changes when speculative decode becomes available |

For progress specifically, with eight roughly equal streams, completing a first large chunk requires about 512 MiB of aggregate payload. At 100 Mbit/s that is around **43 seconds**; at 25 Mbit/s around **172 seconds**, before overhead. Small metadata files can print earlier, but the next large-file progress interval can still look stuck. This is perceived slowness with a concrete code cause.

## 5. Would a different host help?

**It can help when its route, proximity, congestion or aggregate capacity is better for the affected user. It cannot exceed that user's remaining access bandwidth.** There is no universal 3 Gbit/s boundary separating those cases.

[Cloudflare's current R2 cache documentation](https://developers.cloudflare.com/cache/interaction-cloudflare-products/r2/) confirms that cache requires a custom domain and limits cached objects to 512 MB on Free/Pro/Business, with a default 5 GB Enterprise limit. Uploading the existing approximately 10 GB shards unchanged therefore does not create the intended edge-cache benefit. A 64–256 MiB immutable-object layout with explicit cache rules could make R2/CDN useful. That is a transport packaging change plus a client reassembly/resume change, and cold-cache performance still requires measurement. Existing `SLOTSTREAM_WEIGHTS_SOURCES` can change whole-file hosts, but cannot by itself interpret independently compressed chunk objects.

Vercel Blob or a conventional S3/CDN mirror has no demonstrated speed advantage for this artifact. No pricing or infrastructure choice is needed to diagnose the present problem. Use an actual affected location, comparable uncached data, and a full verified transfer before choosing a paid host. Retain Hugging Face and the existing fallback until a contender shows material improvement.

The earlier inference of a fixed bridge-node 625 MB/s ceiling from generic EC2 documentation is also unsupported: the instance type, topology, traffic distribution and shaping were not established. Similarly, observing a hostname in DNS does not prove which cache path a request traverses.

## 6. Recommended order

1. Fix observability: periodic progress, phase timing, unique-byte goodput, retry counts, connection count and control/write/hash timing. This makes future “slow” reports diagnosable and removes the long apparent stalls.
2. Continue **lossless compressed transport blocks** for the same pinned bytes. The aggressive follow-up now verifies approximately 16% reduction on a complete 2.192 GB shard with two decoder implementations. Package the whole checkpoint and qualify the real downloader with bounded parallel decoding overlapping transfer; current timing diagnostics do not establish an end-to-end install speedup.
3. Add resolved-URL reuse and qualify adaptive concurrency on a genuinely underutilized link. Keep them as measured optimizations; this home-path sample does not establish a large gain.
4. Benchmark the existing Xet implementation against the same ranges and full checkpoint. Its measured metadata benefit is 2.4%; adopt only if total transfer/runtime/resume behavior improves enough to justify integration.
5. Test another host only when the preceding diagnostics show source/route headroom. Chunked R2 behind a custom domain is a plausible experiment, not a proven migration.

A much shorter time to first answer would require a different scope: a separately qualified smaller representation, or running before all weights are present. Sparse activation does not make that second option trivial. Expert choices depend on preceding layers, long prefills touch much of the expert set, and replacing SSD reads with network misses adds latency and loses complete offline readiness. It should not be presented as a small downloader fix.

The specific remaining unknown is the cause of any individual user's slow network path—Wi-Fi, competing traffic, ISP, peering, source load or another route issue. Code and the existing observations locate the dominant phase, but do not justify assigning that last cause without a matched measurement on that user's connection.

## 7. Existing compression verified from file headers
The actual files were checked, beyond their extensions. All twelve safetensors headers described contiguous raw tensor storage whose byte counts exactly match their dtype and shape, covering the complete 105,241,154,252 bytes including headers. They contain packed four-bit weights plus BF16 scales/biases and other tensors, with no gzip/Zstandard archive layer. The thirteen remaining model files total 23,308,996 bytes and are plain UTF-8 text/JSON.

Live range responses for a main shard, MTP, tokenizer and config matched local prefixes and had no Content-Encoding. Slotstream explicitly sends Accept-Encoding: identity. Its current bridge download therefore transfers reconstructed safetensors bytes without Xet compression.

The v0.2.7 executable/Metal release is a real gzip archive (magic 1f8b08), 51,359,533 bytes. The macOS 14/15 compatibility wheels are ZIP files around 38.6 MB; their central directories confirm Deflate for mlx.metallib and libmlx.dylib. Those small runtime distributions already have general-purpose compression.

Three actual Xet chunk headers reported ByteGrouping4LZ4, confirming storage-level compression at Hugging Face. Xet compression is distinct from the plain HTTP response and from the model's quantization. The prior approximately 10–11% Zstandard estimate was obtained from the existing quantized local data, so it is additional to quantization; it is not a claim that unquantized weights shrink by only 10%. The 2.384% Xet wire-byte reduction and this Zstandard sample estimate are alternatives relative to the raw transfer, not additive savings.

Evidence: [[sources/runs/2026/09/2026-09-05-download-existing-compression-check]].
