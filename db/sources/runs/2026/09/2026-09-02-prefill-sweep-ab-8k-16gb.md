---
type: run
id: 01m1htch85zyza9181cw5wen05
created: 2026-09-02T19:43:56.165290+00:00
updated: 2026-09-02T19:43:56.165290+00:00
summary: prefill sweep A/B, 8k acceptance prompt at a 16 GB target, dev Mac, 2026-09-02
binary: 'sweep: local release builds of e09bcac plus the sweep (Sources exported to a scratch tree; n2b, then n2d = the shipped code); baseline: local release build of e09bcac'
captured_at: 2026-09-02
command: slotstream run --raw --prompt <7,960/8,073-token acceptance prompt> --max-tokens 16 --greedy --memory-gb 16 (interleaved arms; SLOTSTREAM_SWEEP_TRACE=1 on some)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: prefill sweep A/B, 8k acceptance prompt at a 16 GB target, dev Mac, 2026-09-02
tool: run
---
## ab16x3

Harness log (`prefill_ab*.sh`):

```
start 12:44:32 reclaimable=24.7 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 new 12:44:32 reclaimable=24.7 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 42.08s (191.8 tok/s)
-- prefill split: io 22.03s + scatter 0.93s + compute 19.13s | 98872 records (273.4 GB, 12.4 GB/s)
-- decode 16 tok in 3.17s (5.05 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 45.3s
=== round 1 base 12:45:27 reclaimable=26.5 ===
rc=0 sampled-peak=13.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 80.29s (100.5 tok/s)
-- prefill split: io 26.69s + scatter 9.43s + compute 44.18s | 98273 records (271.7 GB, 10.2 GB/s)
-- decode 9 tok in 2.06s (4.36 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 82.4s
=== round 2 new 12:46:59 reclaimable=24.3 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 47.64s (169.4 tok/s)
-- prefill split: io 24.74s + scatter 1.48s + compute 21.43s | 98872 records (273.4 GB, 11.0 GB/s)
-- decode 16 tok in 3.72s (4.30 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 51.4s
=== round 2 base 12:48:01 reclaimable=26.1 ===
rc=0 sampled-peak=13.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 96.33s (83.8 tok/s)
-- prefill split: io 31.35s + scatter 12.18s + compute 52.80s | 98273 records (271.7 GB, 8.7 GB/s)
-- decode 9 tok in 2.44s (3.68 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 98.8s
=== round 3 new 12:49:52 reclaimable=24.7 ===
rc=0 sampled-peak=14.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 48.77s (165.5 tok/s)
-- prefill split: io 25.68s + scatter 1.22s + compute 21.87s | 98872 records (273.4 GB, 10.6 GB/s)
-- decode 16 tok in 3.38s (4.74 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 52.2s
=== round 3 base 12:50:55 reclaimable=25.6 ===
rc=0 sampled-peak=13.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 90.00s (89.7 tok/s)
-- prefill split: io 30.36s + scatter 10.41s + compute 49.22s | 98273 records (271.7 GB, 8.9 GB/s)
-- decode 9 tok in 2.36s (3.82 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.1 GB | total 92.4s
done 12:52:37
```

### ab_ab16x3_r1_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~58 s left
  prefill: 4096/8073 tokens (51%), ~38 s left
  prefill: 6144/8073 tokens (76%), ~19 s left
  prefill: done, 8073 tokens in 1.3 min (101 tok/s)
-- prefill 8073 tok in 80.29s (100.5 tok/s)
-- prefill split: io 26.69s + scatter 9.43s + compute 44.18s | 98273 records (271.7 GB, 10.2 GB/s)
-- decode 9 tok in 2.06s (4.36 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 82.4s
```

### ab_ab16x3_r1_new
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~32 s left
  prefill: 4096/8073 tokens (51%), ~20 s left
  prefill: 6144/8073 tokens (76%), ~9 s left
  prefill: done, 8073 tokens in 42 s (192 tok/s)
-- prefill 8073 tok in 42.08s (191.8 tok/s)
-- prefill split: io 22.03s + scatter 0.93s + compute 19.13s | 98872 records (273.4 GB, 12.4 GB/s)
-- decode 16 tok in 3.17s (5.05 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 45.3s
```

### ab_ab16x3_r2_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~1.2 min left
  prefill: 4096/8073 tokens (51%), ~48 s left
  prefill: 6144/8073 tokens (76%), ~23 s left
  prefill: done, 8073 tokens in 1.6 min (84 tok/s)
-- prefill 8073 tok in 96.33s (83.8 tok/s)
-- prefill split: io 31.35s + scatter 12.18s + compute 52.80s | 98273 records (271.7 GB, 8.7 GB/s)
-- decode 9 tok in 2.44s (3.68 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 98.8s
```

### ab_ab16x3_r2_new
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~34 s left
  prefill: 4096/8073 tokens (51%), ~22 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 48 s (169 tok/s)
-- prefill 8073 tok in 47.64s (169.4 tok/s)
-- prefill split: io 24.74s + scatter 1.48s + compute 21.43s | 98872 records (273.4 GB, 11.0 GB/s)
-- decode 16 tok in 3.72s (4.30 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 51.4s
```

### ab_ab16x3_r3_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~1.1 min left
  prefill: 4096/8073 tokens (51%), ~43 s left
  prefill: 6144/8073 tokens (76%), ~22 s left
  prefill: done, 8073 tokens in 1.5 min (90 tok/s)
-- prefill 8073 tok in 90.00s (89.7 tok/s)
-- prefill split: io 30.36s + scatter 10.41s + compute 49.22s | 98273 records (271.7 GB, 8.9 GB/s)
-- decode 9 tok in 2.36s (3.82 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.1 GB | total 92.4s
```

### ab_ab16x3_r3_new
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
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 49 s (166 tok/s)
-- prefill 8073 tok in 48.77s (165.5 tok/s)
-- prefill split: io 25.68s + scatter 1.22s + compute 21.87s | 98872 records (273.4 GB, 10.6 GB/s)
-- decode 16 tok in 3.38s (4.74 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 52.2s
```

## fin16

Harness log (`prefill_ab*.sh`):

```
start 14:19:59 reclaimable=28.5 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 final [SLOTSTREAM_SWEEP_TRACE=1] 14:19:59 reclaimable=28.9 ===
rc=0 sampled-peak=14.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 19.37s, gpu wait 1.88s, row sort 0.01s, pool copies 0.94s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 38.54s (209.5 tok/s)
-- prefill split: io 19.37s + scatter 0.94s + compute 18.23s | 98872 records (273.4 GB, 14.1 GB/s)
-- decode 16 tok in 2.83s (5.65 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 41.4s
=== round 1 base [] 14:20:49 reclaimable=31.4 ===
rc=0 sampled-peak=13.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 85.36s (94.6 tok/s)
-- prefill split: io 24.29s + scatter 7.21s + compute 53.86s | 98273 records (271.7 GB, 11.2 GB/s)
-- decode 9 tok in 1.74s (5.19 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 87.1s
=== round 1 cap512 [SLOTSTREAM_PREFILL_CACHE_MB=512,SLOTSTREAM_SWEEP_TRACE=1] 14:22:25 reclaimable=29.9 ===
rc=0 sampled-peak=12.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 22.96s, gpu wait 3.07s, row sort 0.03s, pool copies 1.48s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 51.38s (157.1 tok/s)
-- prefill split: io 22.96s + scatter 1.48s + compute 26.95s | 98872 records (273.4 GB, 11.9 GB/s)
-- decode 16 tok in 3.89s (4.11 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 12.3 GB | total 55.3s
=== round 2 final [SLOTSTREAM_SWEEP_TRACE=1] 14:23:32 reclaimable=31.0 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 22.10s, gpu wait 2.33s, row sort 0.02s, pool copies 1.02s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 49.89s (161.8 tok/s)
-- prefill split: io 22.10s + scatter 1.02s + compute 26.77s | 98872 records (273.4 GB, 12.4 GB/s)
-- decode 16 tok in 3.45s (4.64 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 53.3s
=== round 2 base [] 14:24:37 reclaimable=31.1 ===
rc=0 sampled-peak=13.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 89.63s (90.1 tok/s)
-- prefill split: io 26.54s + scatter 8.03s + compute 55.06s | 98273 records (271.7 GB, 10.2 GB/s)
-- decode 9 tok in 1.84s (4.90 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 91.5s
=== round 2 cap512 [SLOTSTREAM_PREFILL_CACHE_MB=512,SLOTSTREAM_SWEEP_TRACE=1] 14:26:20 reclaimable=30.1 ===
rc=0 sampled-peak=12.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 20.50s, gpu wait 2.23s, row sort 0.02s, pool copies 1.21s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 44.93s (179.7 tok/s)
-- prefill split: io 20.50s + scatter 1.21s + compute 23.22s | 98872 records (273.4 GB, 13.3 GB/s)
-- decode 16 tok in 3.28s (4.88 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 12.3 GB | total 48.2s
done 14:27:19
```

### ab_fin16_r1_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~59 s left
  prefill: 4096/8073 tokens (51%), ~39 s left
  prefill: 6144/8073 tokens (76%), ~20 s left
  prefill: done, 8073 tokens in 1.4 min (95 tok/s)
-- prefill 8073 tok in 85.36s (94.6 tok/s)
-- prefill split: io 24.29s + scatter 7.21s + compute 53.86s | 98273 records (271.7 GB, 11.2 GB/s)
-- decode 9 tok in 1.74s (5.19 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 87.1s
```

### ab_fin16_r1_cap512
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.2s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~49 s to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~37 s left
  prefill: 4096/8073 tokens (51%), ~24 s left
  prefill: 6144/8073 tokens (76%), ~12 s left
  prefill: done, 8073 tokens in 51 s (157 tok/s)
sweep trace: io 22.96s, gpu wait 3.07s, row sort 0.03s, pool copies 1.48s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 51.38s (157.1 tok/s)
-- prefill split: io 22.96s + scatter 1.48s + compute 26.95s | 98872 records (273.4 GB, 11.9 GB/s)
-- decode 16 tok in 3.89s (4.11 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 12.3 GB | total 55.3s
```

### ab_fin16_r1_final
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~49 s to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~29 s left
  prefill: 4096/8073 tokens (51%), ~18 s left
  prefill: 6144/8073 tokens (76%), ~9 s left
  prefill: done, 8073 tokens in 39 s (209 tok/s)
sweep trace: io 19.37s, gpu wait 1.88s, row sort 0.01s, pool copies 0.94s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 38.54s (209.5 tok/s)
-- prefill split: io 19.37s + scatter 0.94s + compute 18.23s | 98872 records (273.4 GB, 14.1 GB/s)
-- decode 16 tok in 2.83s (5.65 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 41.4s
```

### ab_fin16_r2_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 0.9s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~1.1 min left
  prefill: 4096/8073 tokens (51%), ~43 s left
  prefill: 6144/8073 tokens (76%), ~21 s left
  prefill: done, 8073 tokens in 1.5 min (90 tok/s)
-- prefill 8073 tok in 89.63s (90.1 tok/s)
-- prefill split: io 26.54s + scatter 8.03s + compute 55.06s | 98273 records (271.7 GB, 10.2 GB/s)
-- decode 9 tok in 1.84s (4.90 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 91.5s
```

### ab_fin16_r2_cap512
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~49 s to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~33 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 45 s (180 tok/s)
sweep trace: io 20.50s, gpu wait 2.23s, row sort 0.02s, pool copies 1.21s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 44.93s (179.7 tok/s)
-- prefill split: io 20.50s + scatter 1.21s + compute 23.22s | 98872 records (273.4 GB, 13.3 GB/s)
-- decode 16 tok in 3.28s (4.88 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 12.3 GB | total 48.2s
```

### ab_fin16_r2_final
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~49 s to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~34 s left
  prefill: 4096/8073 tokens (51%), ~23 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 50 s (162 tok/s)
sweep trace: io 22.10s, gpu wait 2.33s, row sort 0.02s, pool copies 1.02s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 49.89s (161.8 tok/s)
-- prefill split: io 22.10s + scatter 1.02s + compute 26.77s | 98872 records (273.4 GB, 12.4 GB/s)
-- decode 16 tok in 3.45s (4.64 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 53.3s
```

## rec16

Harness log (`prefill_ab*.sh`):

```
start 13:56:17 reclaimable=25.8 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 rec [SLOTSTREAM_SWEEP_TRACE=1] 13:56:17 reclaimable=25.8 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 23.62s, gpu wait 1.52s, row sort 0.02s, pool copies 1.28s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 49.35s (163.6 tok/s)
-- prefill split: io 23.62s + scatter 1.28s + compute 24.44s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.31s (4.84 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.5 GB | total 52.7s
=== round 1 new [SLOTSTREAM_SWEEP_TRACE=1] 13:57:20 reclaimable=26.7 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 22.64s, gpu wait 1.54s, row sort 0.02s, pool copies 1.34s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 45.49s (177.5 tok/s)
-- prefill split: io 22.64s + scatter 1.34s + compute 21.51s | 98872 records (273.4 GB, 12.1 GB/s)
-- decode 16 tok in 3.06s (5.23 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 48.6s
=== round 1 base [] 13:58:21 reclaimable=26.1 ===
rc=0 sampled-peak=13.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 87.86s (91.9 tok/s)
-- prefill split: io 26.52s + scatter 8.81s + compute 52.53s | 98273 records (271.7 GB, 10.2 GB/s)
-- decode 9 tok in 1.93s (4.66 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 89.8s
=== round 2 rec [SLOTSTREAM_SWEEP_TRACE=1] 14:00:03 reclaimable=25.3 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 23.62s, gpu wait 1.42s, row sort 0.02s, pool copies 1.30s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 48.59s (166.1 tok/s)
-- prefill split: io 23.62s + scatter 1.30s + compute 23.67s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.31s (4.84 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.5 GB | total 51.9s
=== round 2 new [SLOTSTREAM_SWEEP_TRACE=1] 14:01:06 reclaimable=26.9 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 22.70s, gpu wait 1.63s, row sort 0.02s, pool copies 1.44s, mlx peak 12.32 GB, mlx cache 2.15 GB
-- prefill 8073 tok in 46.35s (174.2 tok/s)
-- prefill split: io 22.70s + scatter 1.44s + compute 22.21s | 98872 records (273.4 GB, 12.0 GB/s)
-- decode 16 tok in 3.31s (4.84 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 49.7s
=== round 2 base [] 14:02:07 reclaimable=27.0 ===
rc=0 sampled-peak=13.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 90.64s (89.1 tok/s)
-- prefill split: io 28.07s + scatter 8.71s + compute 53.86s | 98273 records (271.7 GB, 9.7 GB/s)
-- decode 9 tok in 1.80s (5.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 92.4s
done 14:03:50
```

### ab_rec16_r1_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~1.1 min left
  prefill: 4096/8073 tokens (51%), ~42 s left
  prefill: 6144/8073 tokens (76%), ~21 s left
  prefill: done, 8073 tokens in 1.5 min (92 tok/s)
-- prefill 8073 tok in 87.86s (91.9 tok/s)
-- prefill split: io 26.52s + scatter 8.81s + compute 52.53s | 98273 records (271.7 GB, 10.2 GB/s)
-- decode 9 tok in 1.93s (4.66 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 89.8s
```

### ab_rec16_r1_new
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~33 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 45 s (177 tok/s)
sweep trace: io 22.64s, gpu wait 1.54s, row sort 0.02s, pool copies 1.34s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 45.49s (177.5 tok/s)
-- prefill split: io 22.64s + scatter 1.34s + compute 21.51s | 98872 records (273.4 GB, 12.1 GB/s)
-- decode 16 tok in 3.06s (5.23 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 48.6s
```

### ab_rec16_r1_rec
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.2s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~36 s left
  prefill: 4096/8073 tokens (51%), ~24 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 49 s (164 tok/s)
sweep trace: io 23.62s, gpu wait 1.52s, row sort 0.02s, pool copies 1.28s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 49.35s (163.6 tok/s)
-- prefill split: io 23.62s + scatter 1.28s + compute 24.44s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.31s (4.84 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.5 GB | total 52.7s
```

### ab_rec16_r2_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~1.1 min left
  prefill: 4096/8073 tokens (51%), ~44 s left
  prefill: 6144/8073 tokens (76%), ~21 s left
  prefill: done, 8073 tokens in 1.5 min (89 tok/s)
-- prefill 8073 tok in 90.64s (89.1 tok/s)
-- prefill split: io 28.07s + scatter 8.71s + compute 53.86s | 98273 records (271.7 GB, 9.7 GB/s)
-- decode 9 tok in 1.80s (5.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.584 | ngram rows 24h/120m | peak 13.0 GB | total 92.4s
```

### ab_rec16_r2_new
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~33 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 46 s (174 tok/s)
sweep trace: io 22.70s, gpu wait 1.63s, row sort 0.02s, pool copies 1.44s, mlx peak 12.32 GB, mlx cache 2.15 GB
-- prefill 8073 tok in 46.35s (174.2 tok/s)
-- prefill split: io 22.70s + scatter 1.44s + compute 22.21s | 98872 records (273.4 GB, 12.0 GB/s)
-- decode 16 tok in 3.31s (4.84 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 49.7s
```

### ab_rec16_r2_rec
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
sweep trace: io 23.62s, gpu wait 1.42s, row sort 0.02s, pool copies 1.30s, mlx peak 12.32 GB, mlx cache 0.55 GB
-- prefill 8073 tok in 48.59s (166.1 tok/s)
-- prefill split: io 23.62s + scatter 1.30s + compute 23.67s | 98872 records (273.4 GB, 11.6 GB/s)
-- decode 16 tok in 3.31s (4.84 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.5 GB | total 51.9s
```

## trace16

Harness log (`prefill_ab*.sh`):

```
start 13:10:54 reclaimable=24.2 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 trace [SLOTSTREAM_SWEEP_TRACE=1] 13:10:54 reclaimable=24.2 ===
rc=0 sampled-peak=13.00GB answer=<think>The user is asking me what the vault combination is, 
sweep trace: io 22.37s, gpu wait 1.63s, row sort 0.02s, pool copies 1.02s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 43.48s (185.7 tok/s)
-- prefill split: io 22.37s + scatter 1.02s + compute 20.09s | 98872 records (273.4 GB, 12.2 GB/s)
-- decode 16 tok in 3.06s (5.24 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 46.5s
done 13:11:50
```

### ab_trace16_r1_trace
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~32 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~10 s left
  prefill: done, 8073 tokens in 43 s (186 tok/s)
sweep trace: io 22.37s, gpu wait 1.63s, row sort 0.02s, pool copies 1.02s, mlx peak 12.32 GB, mlx cache 2.16 GB
-- prefill 8073 tok in 43.48s (185.7 tok/s)
-- prefill split: io 22.37s + scatter 1.02s + compute 20.09s | 98872 records (273.4 GB, 12.2 GB/s)
-- decode 16 tok in 3.06s (5.24 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.585 | ngram rows 40h/216m | peak 13.2 GB | total 46.5s
```

