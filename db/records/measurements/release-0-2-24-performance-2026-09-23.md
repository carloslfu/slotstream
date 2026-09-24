---
type: measurement
id: 01m36f8zrxm08wsde8r9ztcs3f
created: 2026-09-23T06:29:30.525371+00:00
updated: 2026-09-23T06:29:30.525371+00:00
summary: v0.2.24 post-release responsiveness and reuse comparison
date: 2026-09-23
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Measured wire/type/cache-count benefits; aggregate latency and throughput claims withheld because clean matched pairs are insufficient.
order: '1655'
runs: '[[sources/runs/2026/09/2026-09-23-release-0-2-24-performance]]'
title: v0.2.24 post-release responsiveness and reuse comparison
status: measured
---
**The released fixes improve delivered tool arguments and compatible branch reuse. No general latency or tokens-per-second gain is qualified.** The raw comparison in [[sources/runs/2026/09/2026-09-23-release-0-2-24-performance]] contains 72 requests across six sessions and three interleaved old/new pairs, using the installed v0.2.23 and v0.2.24 binaries.

## Repeated functional findings

| Case | v0.2.23 | v0.2.24 | Interpretation |
| --- | --- | --- | --- |
| Nullable tool argument, capped at 256 generated tokens | 0 argument chunks; no argument value delivered | 239 argument chunks during generation in every round | Incremental client delivery now works; truncated output remains incomplete and must not be executed |
| Nullable numeric-looking string | `{"content":123}` | `{"content":"00123"}` in every round | Preserves the declared string and its leading zeros |
| Branch alpha follow-up | 1541 prompt tokens, 1024 cached, 517 uncached | 1597 prompt tokens, 1280 cached, 317 uncached | 200 fewer uncached tokens, about 38.7%, while retaining previously omitted reasoning |
| Code/prose controls | Frozen input and output IDs | Exact match in all 12 comparisons | No token drift observed in these controls |

The scalar-string control streams 239 chunks in both releases. The nullable change brings the equivalent schema onto that existing path. The branch result is a reduction in reread input, **not 38.7% faster inference**: the repaired request contains more correct reasoning, and output length changes from 30 to 24 tokens. It is not an equal-input model-throughput comparison.

Branch seeds match across releases. Restart preserves the repaired answer, reasoning, prompt count and output count, with cached input advancing to 1536 tokens. The previous release's restart also reaches 1536 cached tokens but still omits the reasoning, leaving only 5 uncached tokens instead of the repaired 61. Faster completion of that incorrect shorter prompt would not demonstrate better reuse correctness.

## Method and timing limits

The M5 Pro 48 GiB Mac ran a fixed 10 GB target, context 32768, MTP off and vision off. Two different 2048-token raw prompts, code and prose, were tested as first reads and repeats with 128-token output windows. The branch fixtures, tool schemas, ordering, readiness policy, process/memory sampling and analysis were frozen before the first request. OS file cache was uncontrolled. Installed functional acceptance separately tested MTP on; this comparison establishes no MTP performance gain.

The shared-desktop screen accepted 68/72 requests. The stricter no-global-paging screen accepted 40/72. Required clean matched pairs per family were three; observed eligible counts were:

| Family | Eligible matched pairs |
| --- | --- |
| Code first read / repeat | 0 / 1 |
| Prose first read / repeat | 0 / 1 |
| Scalar / nullable truncated argument | 0 / 1 |
| Nullable numeric string | 2 |
| Alpha / beta seed | 1 / 1 |
| Branch follow-up / restart | 2 / 2 |

No measured family meets the timing claim threshold. The one-token warmup mechanically meets the analyzer's pair count, but is explicitly excluded from all speed claims. All loaded/paging captures remain preserved rather than cherry-picked. The final audit replayed all 72 captures, checked the frozen inputs, and verified all 12 server processes exited zero and were reaped.

The README throughput anchors and hardware estimates remain unchanged. Establishing a new general speed percentage requires three clean matched pairs with equivalent work; the corrected branch alone cannot provide that comparison. This patch contains no new inference computation optimization. The earlier long-prompt and fused-attention gains remain scoped to their own studies and must not be combined with these counts.
