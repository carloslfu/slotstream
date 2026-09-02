---
type: run
id: 01m1htch9zpc97kqepx1habnyh
created: 2026-09-02T19:43:56.223957+00:00
updated: 2026-09-02T19:43:56.223957+00:00
summary: 'prefill sweep tuning: group size, read lanes, admission on/off, 8k prompt at 16 GB, dev Mac, 2026-09-02'
binary: 'sweep: local release builds of e09bcac plus the sweep (Sources exported to a scratch tree; n2b, then n2d = the shipped code); baseline: local release build of e09bcac'
captured_at: 2026-09-02
command: SLOTSTREAM_EXPERT_LOAD_BATCH=<16|32|64|128> | SLOTSTREAM_IO_QUEUE_DEPTH=<4|12|32> | SLOTSTREAM_SWEEP_ADMIT=0 slotstream run --raw --prompt <8,073-token acceptance prompt> --max-tokens <16|48|64> --greedy --memory-gb 16
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'prefill sweep tuning: group size, read lanes, admission on/off, 8k prompt at 16 GB, dev Mac, 2026-09-02'
tool: run
---
## group16

Harness log (`prefill_ab*.sh`):

```
start 13:16:33 reclaimable=25.8 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 g16 [SLOTSTREAM_EXPERT_LOAD_BATCH=16,SLOTSTREAM_SWEEP_TRACE=1] 13:16:33 reclaimable=25.8 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 23.65s, gpu wait 1.62s, row sort 0.02s, pool copies 1.02s, mlx peak 12.32 GB, mlx cache 2.15 GB
-- prefill 8073 tok in 44.04s (183.3 tok/s)
-- prefill split: io 23.65s + scatter 1.02s + compute 19.37s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.18s (5.03 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.0 GB | total 47.2s
=== round 1 g32 [SLOTSTREAM_EXPERT_LOAD_BATCH=32,SLOTSTREAM_SWEEP_TRACE=1] 13:17:31 reclaimable=26.7 ===
rc=0 sampled-peak=14.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 23.87s, gpu wait 1.72s, row sort 0.02s, pool copies 1.41s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 47.52s (169.9 tok/s)
-- prefill split: io 23.87s + scatter 1.41s + compute 22.23s | 98872 records (273.4 GB, 11.5 GB/s)
-- decode 16 tok in 3.07s (5.21 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 50.6s
=== round 1 g64 [SLOTSTREAM_EXPERT_LOAD_BATCH=64,SLOTSTREAM_SWEEP_TRACE=1] 13:18:31 reclaimable=26.8 ===
rc=0 sampled-peak=14.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 24.10s, gpu wait 1.81s, row sort 0.02s, pool copies 1.72s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 50.94s (158.5 tok/s)
-- prefill split: io 24.10s + scatter 1.72s + compute 25.12s | 98872 records (273.4 GB, 11.3 GB/s)
-- decode 16 tok in 3.36s (4.76 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.7 GB | total 54.3s
=== round 1 g128 [SLOTSTREAM_EXPERT_LOAD_BATCH=128,SLOTSTREAM_SWEEP_TRACE=1] 13:19:38 reclaimable=26.6 ===
rc=0 sampled-peak=15.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 22.95s, gpu wait 3.08s, row sort 0.02s, pool copies 2.18s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 50.27s (160.6 tok/s)
-- prefill split: io 22.95s + scatter 2.18s + compute 25.14s | 98872 records (273.4 GB, 11.9 GB/s)
-- decode 16 tok in 3.20s (5.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 14.1 GB | total 53.5s
done 13:20:44
```

### ab_group16_r1_g128
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~37 s left
  prefill: 4096/8073 tokens (51%), ~23 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 50 s (161 tok/s)
sweep trace: io 22.95s, gpu wait 3.08s, row sort 0.02s, pool copies 2.18s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 50.27s (160.6 tok/s)
-- prefill split: io 22.95s + scatter 2.18s + compute 25.14s | 98872 records (273.4 GB, 11.9 GB/s)
-- decode 16 tok in 3.20s (5.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 14.1 GB | total 53.5s
```

### ab_group16_r1_g16
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~31 s left
  prefill: 4096/8073 tokens (51%), ~19 s left
  prefill: 6144/8073 tokens (76%), ~9 s left
  prefill: done, 8073 tokens in 44 s (183 tok/s)
sweep trace: io 23.65s, gpu wait 1.62s, row sort 0.02s, pool copies 1.02s, mlx peak 12.32 GB, mlx cache 2.15 GB
-- prefill 8073 tok in 44.04s (183.3 tok/s)
-- prefill split: io 23.65s + scatter 1.02s + compute 19.37s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.18s (5.03 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.0 GB | total 47.2s
```

### ab_group16_r1_g32
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~34 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 48 s (170 tok/s)
sweep trace: io 23.87s, gpu wait 1.72s, row sort 0.02s, pool copies 1.41s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 47.52s (169.9 tok/s)
-- prefill split: io 23.87s + scatter 1.41s + compute 22.23s | 98872 records (273.4 GB, 11.5 GB/s)
-- decode 16 tok in 3.07s (5.21 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 50.6s
```

### ab_group16_r1_g64
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.4s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~37 s left
  prefill: 4096/8073 tokens (51%), ~24 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 51 s (158 tok/s)
sweep trace: io 24.10s, gpu wait 1.81s, row sort 0.02s, pool copies 1.72s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 50.94s (158.5 tok/s)
-- prefill split: io 24.10s + scatter 1.72s + compute 25.12s | 98872 records (273.4 GB, 11.3 GB/s)
-- decode 16 tok in 3.36s (4.76 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.7 GB | total 54.3s
```

## qd16

Harness log (`prefill_ab*.sh`):

```
start 13:35:33 reclaimable=24.4 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 qd4 [SLOTSTREAM_IO_QUEUE_DEPTH=4] 13:35:33 reclaimable=24.4 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 66.94s (120.6 tok/s)
-- prefill split: io 39.08s + scatter 1.20s + compute 26.66s | 98872 records (273.4 GB, 7.0 GB/s)
-- decode 16 tok in 4.10s (3.90 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.3 GB | total 71.0s
=== round 1 qd12 [SLOTSTREAM_IO_QUEUE_DEPTH=12] 13:36:55 reclaimable=27.1 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 45.02s (179.3 tok/s)
-- prefill split: io 23.51s + scatter 1.09s + compute 20.42s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.21s (4.99 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 48.2s
=== round 1 qd32 [SLOTSTREAM_IO_QUEUE_DEPTH=32] 13:37:55 reclaimable=27.1 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 49.67s (162.5 tok/s)
-- prefill split: io 24.39s + scatter 1.17s + compute 24.11s | 98872 records (273.4 GB, 11.2 GB/s)
-- decode 16 tok in 3.11s (5.14 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 52.8s
done 13:38:58
```

### ab_qd16_r1_qd12
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~34 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 45 s (179 tok/s)
-- prefill 8073 tok in 45.02s (179.3 tok/s)
-- prefill split: io 23.51s + scatter 1.09s + compute 20.42s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.21s (4.99 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 48.2s
```

### ab_qd16_r1_qd32
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~33 s left
  prefill: 4096/8073 tokens (51%), ~22 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 50 s (163 tok/s)
-- prefill 8073 tok in 49.67s (162.5 tok/s)
-- prefill split: io 24.39s + scatter 1.17s + compute 24.11s | 98872 records (273.4 GB, 11.2 GB/s)
-- decode 16 tok in 3.11s (5.14 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 52.8s
```

### ab_qd16_r1_qd4
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~39 s left
  prefill: 4096/8073 tokens (51%), ~34 s left
  prefill: 6144/8073 tokens (76%), ~16 s left
  prefill: done, 8073 tokens in 1.1 min (121 tok/s)
-- prefill 8073 tok in 66.94s (120.6 tok/s)
-- prefill split: io 39.08s + scatter 1.20s + compute 26.66s | 98872 records (273.4 GB, 7.0 GB/s)
-- decode 16 tok in 4.10s (3.90 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.3 GB | total 71.0s
```

## admit16

Harness log (`prefill_ab*.sh`):

```
start 13:11:50 reclaimable=26.4 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 admit [] 13:11:50 reclaimable=26.4 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 42.45s (190.2 tok/s)
-- prefill split: io 22.17s + scatter 1.03s + compute 19.25s | 98872 records (273.4 GB, 12.3 GB/s)
-- decode 64 tok in 10.93s (5.86 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.614 | ngram rows 296h/728m | peak 13.2 GB | total 53.4s
=== round 1 noadmit [SLOTSTREAM_SWEEP_ADMIT=0] 13:12:54 reclaimable=26.5 ===
rc=0 sampled-peak=14.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 44.32s (182.2 tok/s)
-- prefill split: io 23.04s + scatter 0.00s + compute 21.28s | 98872 records (273.4 GB, 11.9 GB/s)
-- decode 64 tok in 12.59s (5.08 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 296h/728m | peak 13.3 GB | total 56.9s
=== round 2 admit [] 13:14:03 reclaimable=26.3 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 45.81s (176.2 tok/s)
-- prefill split: io 24.28s + scatter 1.22s + compute 20.30s | 98872 records (273.4 GB, 11.3 GB/s)
-- decode 64 tok in 21.94s (2.92 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.614 | ngram rows 296h/728m | peak 13.2 GB | total 67.8s
=== round 2 noadmit [SLOTSTREAM_SWEEP_ADMIT=0] 13:15:24 reclaimable=24.1 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 46.54s (173.5 tok/s)
-- prefill split: io 24.96s + scatter 0.00s + compute 21.58s | 98872 records (273.4 GB, 11.0 GB/s)
-- decode 64 tok in 12.11s (5.29 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 296h/728m | peak 13.2 GB | total 58.6s
done 13:16:33
```

### ab_admit16_r1_admit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~32 s left
  prefill: 4096/8073 tokens (51%), ~20 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 42 s (190 tok/s)
-- prefill 8073 tok in 42.45s (190.2 tok/s)
-- prefill split: io 22.17s + scatter 1.03s + compute 19.25s | 98872 records (273.4 GB, 12.3 GB/s)
-- decode 64 tok in 10.93s (5.86 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.614 | ngram rows 296h/728m | peak 13.2 GB | total 53.4s
```

### ab_admit16_r1_noadmit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.4s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~36 s left
  prefill: 4096/8073 tokens (51%), ~23 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 44 s (182 tok/s)
-- prefill 8073 tok in 44.32s (182.2 tok/s)
-- prefill split: io 23.04s + scatter 0.00s + compute 21.28s | 98872 records (273.4 GB, 11.9 GB/s)
-- decode 64 tok in 12.59s (5.08 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 296h/728m | peak 13.3 GB | total 56.9s
```

### ab_admit16_r2_admit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~35 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 46 s (176 tok/s)
-- prefill 8073 tok in 45.81s (176.2 tok/s)
-- prefill split: io 24.28s + scatter 1.22s + compute 20.30s | 98872 records (273.4 GB, 11.3 GB/s)
-- decode 64 tok in 21.94s (2.92 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.614 | ngram rows 296h/728m | peak 13.2 GB | total 67.8s
```

### ab_admit16_r2_noadmit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.4s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~40 s left
  prefill: 4096/8073 tokens (51%), ~24 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 47 s (173 tok/s)
-- prefill 8073 tok in 46.54s (173.5 tok/s)
-- prefill split: io 24.96s + scatter 0.00s + compute 21.58s | 98872 records (273.4 GB, 11.0 GB/s)
-- decode 64 tok in 12.11s (5.29 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 296h/728m | peak 13.2 GB | total 58.6s
```

## admit3

Harness log (`prefill_ab*.sh`):

```
start 14:08:58 reclaimable=25.5 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 admit [] 14:08:58 reclaimable=25.5 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 48.55s (166.3 tok/s)
-- prefill split: io 23.45s + scatter 1.34s + compute 23.77s | 98872 records (273.4 GB, 11.7 GB/s)
-- decode 48 tok in 8.54s (5.62 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.618 | ngram rows 248h/520m | peak 13.5 GB | total 57.1s
=== round 1 noadmit [SLOTSTREAM_SWEEP_ADMIT=0] 14:10:05 reclaimable=26.3 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 49.08s (164.5 tok/s)
-- prefill split: io 23.73s + scatter 0.00s + compute 25.35s | 98872 records (273.4 GB, 11.5 GB/s)
-- decode 48 tok in 9.10s (5.28 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 248h/520m | peak 13.5 GB | total 58.2s
=== round 2 admit [] 14:11:13 reclaimable=26.0 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 49.68s (162.5 tok/s)
-- prefill split: io 23.13s + scatter 1.16s + compute 25.39s | 98872 records (273.4 GB, 11.8 GB/s)
-- decode 48 tok in 8.00s (6.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.618 | ngram rows 248h/520m | peak 13.5 GB | total 57.7s
=== round 2 noadmit [SLOTSTREAM_SWEEP_ADMIT=0] 14:12:24 reclaimable=26.2 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 48.72s (165.7 tok/s)
-- prefill split: io 23.35s + scatter 0.00s + compute 25.38s | 98872 records (273.4 GB, 11.7 GB/s)
-- decode 48 tok in 11.15s (4.31 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 248h/520m | peak 13.5 GB | total 59.9s
=== round 3 admit [] 14:13:33 reclaimable=25.8 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 51.40s (157.1 tok/s)
-- prefill split: io 24.10s + scatter 1.06s + compute 26.24s | 98872 records (273.4 GB, 11.3 GB/s)
-- decode 48 tok in 8.69s (5.52 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.618 | ngram rows 248h/520m | peak 13.5 GB | total 60.1s
=== round 3 noadmit [SLOTSTREAM_SWEEP_ADMIT=0] 14:14:46 reclaimable=31.0 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 50.18s (160.9 tok/s)
-- prefill split: io 22.11s + scatter 0.00s + compute 28.08s | 98872 records (273.4 GB, 12.4 GB/s)
-- decode 48 tok in 9.72s (4.94 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 248h/520m | peak 13.5 GB | total 59.9s
done 14:15:55
```

### ab_admit3_r1_admit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~35 s left
  prefill: 4096/8073 tokens (51%), ~23 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 49 s (166 tok/s)
-- prefill 8073 tok in 48.55s (166.3 tok/s)
-- prefill split: io 23.45s + scatter 1.34s + compute 23.77s | 98872 records (273.4 GB, 11.7 GB/s)
-- decode 48 tok in 8.54s (5.62 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.618 | ngram rows 248h/520m | peak 13.5 GB | total 57.1s
```

### ab_admit3_r1_noadmit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~37 s left
  prefill: 4096/8073 tokens (51%), ~24 s left
  prefill: 6144/8073 tokens (76%), ~12 s left
  prefill: done, 8073 tokens in 49 s (164 tok/s)
-- prefill 8073 tok in 49.08s (164.5 tok/s)
-- prefill split: io 23.73s + scatter 0.00s + compute 25.35s | 98872 records (273.4 GB, 11.5 GB/s)
-- decode 48 tok in 9.10s (5.28 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 248h/520m | peak 13.5 GB | total 58.2s
```

### ab_admit3_r2_admit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~36 s left
  prefill: 4096/8073 tokens (51%), ~23 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 50 s (162 tok/s)
-- prefill 8073 tok in 49.68s (162.5 tok/s)
-- prefill split: io 23.13s + scatter 1.16s + compute 25.39s | 98872 records (273.4 GB, 11.8 GB/s)
-- decode 48 tok in 8.00s (6.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.618 | ngram rows 248h/520m | peak 13.5 GB | total 57.7s
```

### ab_admit3_r2_noadmit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~36 s left
  prefill: 4096/8073 tokens (51%), ~23 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 49 s (166 tok/s)
-- prefill 8073 tok in 48.72s (165.7 tok/s)
-- prefill split: io 23.35s + scatter 0.00s + compute 25.38s | 98872 records (273.4 GB, 11.7 GB/s)
-- decode 48 tok in 11.15s (4.31 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 248h/520m | peak 13.5 GB | total 59.9s
```

### ab_admit3_r3_admit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~36 s left
  prefill: 4096/8073 tokens (51%), ~24 s left
  prefill: 6144/8073 tokens (76%), ~12 s left
  prefill: done, 8073 tokens in 51 s (157 tok/s)
-- prefill 8073 tok in 51.40s (157.1 tok/s)
-- prefill split: io 24.10s + scatter 1.06s + compute 26.24s | 98872 records (273.4 GB, 11.3 GB/s)
-- decode 48 tok in 8.69s (5.52 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.618 | ngram rows 248h/520m | peak 13.5 GB | total 60.1s
```

### ab_admit3_r3_noadmit
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~36 s left
  prefill: 4096/8073 tokens (51%), ~24 s left
  prefill: 6144/8073 tokens (76%), ~12 s left
  prefill: done, 8073 tokens in 50 s (161 tok/s)
-- prefill 8073 tok in 50.18s (160.9 tok/s)
-- prefill split: io 22.11s + scatter 0.00s + compute 28.08s | 98872 records (273.4 GB, 12.4 GB/s)
-- decode 48 tok in 9.72s (4.94 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.605 | ngram rows 248h/520m | peak 13.5 GB | total 59.9s
```

