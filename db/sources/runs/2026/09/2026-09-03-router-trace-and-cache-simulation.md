---
type: run
id: 01m1k0a2bj1cvbyjrrenekekj7
created: 2026-09-03T06:46:41.266424+00:00
updated: 2026-09-03T06:46:41.333490+00:00
summary: M1 router trace and cache simulation, 220 decode steps at 30 experts/layer, dev Mac, 2026-09-03
binary: .build/release/slotstream, local release build of the working tree on top of b04d7b7
captured_at: 2026-09-03
command: SLOTSTREAM_ROUTER_TRACE=... slotstream run --prompt <mixed prose and code> --max-tokens 220 --greedy --experts-per-layer 30; Tools/trace_convert.py; Tools/cachesim.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: M1 router trace and cache simulation, 220 decode steps at 30 experts/layer, dev Mac, 2026-09-03
tool: run
---
## Collection and simulation

```
# router trace collection and cache simulation, dev Mac, 2026-09-03

## collection
```
SLOTSTREAM_ROUTER_TRACE=/tmp/ss_trace_decode.bin slotstream run --prompt 'Explain how a hash table works, then write a short Python implementation with comments, then describe two ways it can degrade.' --max-tokens 220 --greedy --experts-per-layer 30
-- decode 220 tok in 30.33s (7.25 tok/s)
router trace: 10608 MoE calls, 123360 expert-uses -> /tmp/ss_trace_decode.bin
-- decode split: io 13.75s + scatter 0.16s + compute 16.42s | 46806 records
-- expert cache ~30/512 experts per layer, hit rate 0.557 | ngram rows 200h/3320m | peak 8.0 GB | total 32.8s
```

## simulation
```

### 2026-09-03-decode-mixed.npz:decode: 220 steps, 105,600 expert-uses
    distinct records touched: 9,956 / 24,576 (40.5%)
    top-10% of records serve 70.9% of accesses (concentration)
    working set if fully cached: 26.9 GB
    exp/layer  cache GB   slots      LRU      LFU  hot+LRU  miss MB/tok  IO ms/tok@6GB/s
          3.9       0.5     185    0.000    0.000    0.132       1151.4            191.9
          7.7       1.0     370    0.000    0.000    0.206       1054.0            175.7
         15.4       2.0     740    0.406    0.268    0.444        738.5            123.1
         42.4       5.5    2037    0.645    0.600    0.678        427.5             71.3
         81.0      10.5    3888    0.766    0.790    0.810        252.5             42.1
        123.4      16.0    5925    0.865    0.868    0.898        135.7             22.6
        208.3      27.0   10000    0.906    0.906    0.953         62.3             10.4
        277.8      36.0   13333    0.906    0.906    0.969         41.3              6.9
        432.1      56.0   20740    0.906    0.906    1.000          0.0              0.0
        524.7      68.0   25185    0.906    0.906    1.000          0.0              0.0

wrote bench/locality/summary.json
```
```
