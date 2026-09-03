---
type: run
id: 01m1jyzxmzx8w7qygz620fp8z5
created: 2026-09-03T06:23:40.191191+00:00
updated: 2026-09-03T06:23:50.732825+00:00
summary: 'Where a 2048-token pass peaks: phase memory trace with and without query-blocked attention, dev Mac, 2026-09-03'
binary: .build/release/slotstream, local release build of the working tree on top of 270ffcd
captured_at: 2026-09-03
command: SLOTSTREAM_MEM_TRACE=1 SLOTSTREAM_PREFILL_CHUNK=2048 slotstream run --raw --prompt <7,960-token acceptance prompt> --max-tokens 4 --greedy --experts-per-layer 20; second pass adds SLOTSTREAM_ATTN_BLOCK=512
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Where a 2048-token pass peaks: phase memory trace with and without query-blocked attention, dev Mac, 2026-09-03'
tool: run
---
## Phase memory trace of a 2048-token pass

```
# where a 2048-token pass peaks: SLOTSTREAM_MEM_TRACE=1, pinned 20 experts/layer, 7,960-token prompt
# NOTE: the trace forces an eval at each phase boundary, so these are attribution, not the untraced peak.

=== default (attention not blocked at this size) ===
mem trace: high-water MLX active memory during each phase (GB)
  qsa/attn             8.57  (worst at layer 3)
  gdn/ple              8.57  (worst at layer 1)
  qsa/moe              8.32  (worst at layer 7)
  gdn/moe              8.30  (worst at layer 1)
  gdn/attn             7.99  (worst at layer 0)
  gdn/hc2              7.93  (worst at layer 0)
  qsa/hc2              7.92  (worst at layer 3)
  gdn/hc1              7.84  (worst at layer 0)
  qsa/hc1              7.82  (worst at layer 3)
  gdn/layer-end        7.70  (worst at layer 44)
  qsa/layer-end        7.60  (worst at layer 3)
-- decode split: io 0.25s + scatter 0.00s + compute 0.79s | 901 records

=== SLOTSTREAM_ATTN_BLOCK=512 (attention blocked) ===
mem trace: high-water MLX active memory during each phase (GB)
  gdn/ple              8.57  (worst at layer 1)
  gdn/moe              8.27  (worst at layer 6)
  qsa/moe              8.25  (worst at layer 7)
  gdn/attn             7.99  (worst at layer 0)
  qsa/attn             7.99  (worst at layer 3)
  gdn/hc2              7.93  (worst at layer 0)
  qsa/hc2              7.92  (worst at layer 3)
  gdn/hc1              7.84  (worst at layer 0)
  qsa/hc1              7.82  (worst at layer 3)
  qsa/layer-end        7.75  (worst at layer 43)
  gdn/layer-end        7.69  (worst at layer 22)
-- decode split: io 0.25s + scatter 0.00s + compute 0.86s | 901 records
```
