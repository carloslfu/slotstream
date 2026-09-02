---
type: design
meta-type: conclusion
id: 01m1hhwna9gnmc2kksqz0ryewf
created: 2026-09-02T17:15:27.433148+00:00
updated: 2026-09-02T17:15:27.433148+00:00
summary: 5. The configuration space (the tradeoffs to test)
date: 2026-08-28
doc: plan
level: '2'
order: '150'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 5. The configuration space (the tradeoffs to test)
---

Axes — every named preset is a point in this space:

| Axis | Values | Effect |
|---|---|---|
| Cache size | **experts per layer** (of 512; 0.133 GB per expert/layer; CLI `--experts-per-layer`, raw-pool alias `--pool-gb`, total-process form `--memory-gb`, default **auto** from RAM + working set) | THE memory↔speed knob |
| Resident policy | experts-streamed · +ngram-streamed (default) · +ngram-resident (big RAM) | footprint vs decode variance |
| Quant recipe | all-4bit (default) · mixed-4-8 (trunk/attn 8-bit) · compact (3-bit experts) · ngram bits 4/6/8 | quality vs disk/RAM |
| KV | bf16 (default) · fp8 (later) | context memory |
| Context cap | 8k…262k | KV budget per tier |
| Prefetch | off · cross-token(W=1,4,16) · +hot-set pinning | latency hiding |
| Prefill mode | cached · dense-sweep (auto threshold) | prefill throughput |
| IO mode | nocache (default) · pagecache-L2 | determinism vs free OS cache |
| QD / staging | 8–32 / 64–256 MB | SSD utilization |
| MTP self-spec decode | off (v0) · on (M9, big-memory tiers only — see the M9 design note) | decode multiplier where launch-bound; costs ~17 experts/layer |
