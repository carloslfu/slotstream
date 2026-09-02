---
type: run
id: 01m1htch92enhbravmvyb015b0
created: 2026-09-02T19:43:56.194122+00:00
updated: 2026-09-02T19:43:56.194122+00:00
summary: prefill sweep at the 8.1 GB floor and at 10 GB, 7,960-token prompt, dev Mac, 2026-09-02
binary: 'sweep: local release builds of e09bcac plus the sweep (Sources exported to a scratch tree; n2b, then n2d = the shipped code); baseline: local release build of e09bcac'
captured_at: 2026-09-02
command: slotstream run --raw --prompt <7,960-token acceptance prompt> --max-tokens 16 --greedy --memory-gb 8.1 | 10 (arms; SLOTSTREAM_PREFILL_CACHE_MB=2048 for the uncapped arm)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: prefill sweep at the 8.1 GB floor and at 10 GB, 7,960-token prompt, dev Mac, 2026-09-02
tool: run
---
## floor

Harness log (`prefill_ab*.sh`):

```
start 13:01:58 reclaimable=23.5 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p7960.txt args=--memory-gb 8.1
=== round 1 new 13:01:58 reclaimable=23.5 ===
rc=0 sampled-peak=7.54GB answer=<think></think>SEVENTEEN
-- prefill 7960 tok in 90.35s (88.1 tok/s)
-- prefill split: io 61.01s + scatter 0.66s + compute 28.68s | 298851 records (826.3 GB, 13.5 GB/s)
-- decode 9 tok in 1.87s (4.81 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 7.9 GB | total 92.2s
=== round 1 base 13:03:40 reclaimable=25.1 ===
rc=0 sampled-peak=7.34GB answer=<think></think>SEVENTEEN
-- prefill 7960 tok in 156.76s (50.8 tok/s)
-- prefill split: io 83.41s + scatter 26.29s + compute 47.06s | 297777 records (823.3 GB, 9.9 GB/s)
-- decode 9 tok in 3.13s (2.87 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.318 | ngram rows 24h/120m | peak 7.7 GB | total 159.9s
done 13:06:28
```

### ab_floor_r1_base
```
slotstream memory plan (--memory-gb)
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~40 tok/s here; costs ~0.3 GB of the target)
engine ready in 0.8s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~3.3 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.8 min left
  prefill: 4096/7960 tokens (51%), ~1.2 min left
  prefill: 6144/7960 tokens (77%), ~35 s left
  prefill: done, 7960 tokens in 2.6 min (51 tok/s)
-- prefill 7960 tok in 156.76s (50.8 tok/s)
-- prefill split: io 83.41s + scatter 26.29s + compute 47.06s | 297777 records (823.3 GB, 9.9 GB/s)
-- decode 9 tok in 3.13s (2.87 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.318 | ngram rows 24h/120m | peak 7.7 GB | total 159.9s
```

### ab_floor_r1_new
```
slotstream memory plan (--memory-gb)
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~40 tok/s here; costs ~0.3 GB of the target)
engine ready in 0.8s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~3.3 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.1 min left
  prefill: 4096/7960 tokens (51%), ~42 s left
  prefill: 6144/7960 tokens (77%), ~20 s left
  prefill: done, 7960 tokens in 1.5 min (88 tok/s)
-- prefill 7960 tok in 90.35s (88.1 tok/s)
-- prefill split: io 61.01s + scatter 0.66s + compute 28.68s | 298851 records (826.3 GB, 13.5 GB/s)
-- decode 9 tok in 1.87s (4.81 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 7.9 GB | total 92.2s
```

## ten

Harness log (`prefill_ab*.sh`):

```
start 13:06:28 reclaimable=22.6 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p7960.txt args=--memory-gb 10
=== round 1 new 13:06:28 reclaimable=22.6 ===
rc=0 sampled-peak=8.37GB answer=<think></think>SEVENTEEN
-- prefill 7960 tok in 90.48s (88.0 tok/s)
-- prefill split: io 62.98s + scatter 0.70s + compute 26.80s | 298851 records (826.3 GB, 13.1 GB/s)
-- decode 9 tok in 1.89s (4.77 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.505 | ngram rows 24h/120m | peak 8.8 GB | total 92.4s
done 13:08:12
```

### ab_ten_r1_new
```
slotstream memory plan (--memory-gb)
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~40 tok/s here; costs ~0.3 GB of the target)
engine ready in 0.9s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~3.3 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.1 min left
  prefill: 4096/7960 tokens (51%), ~44 s left
  prefill: 6144/7960 tokens (77%), ~20 s left
  prefill: done, 7960 tokens in 1.5 min (88 tok/s)
-- prefill 7960 tok in 90.48s (88.0 tok/s)
-- prefill split: io 62.98s + scatter 0.70s + compute 26.80s | 298851 records (826.3 GB, 13.1 GB/s)
-- decode 9 tok in 1.89s (4.77 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.505 | ngram rows 24h/120m | peak 8.8 GB | total 92.4s
```

## finfloor

Harness log (`prefill_ab*.sh`):

```
start 14:35:54 reclaimable=29.4 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p7960.txt args=--memory-gb 8.1
=== round 1 final [SLOTSTREAM_SWEEP_TRACE=1] 14:35:54 reclaimable=29.4 ===
rc=0 sampled-peak=6.02GB answer=<think></think>SEVENTEEN
sweep trace: io 56.31s, gpu wait 7.71s, row sort 0.04s, pool copies 0.65s, mlx peak 5.55 GB, mlx cache 0.45 GB
-- prefill 7960 tok in 85.48s (93.1 tok/s)
-- prefill split: io 56.31s + scatter 0.65s + compute 28.52s | 298851 records (826.3 GB, 14.7 GB/s)
-- decode 9 tok in 1.88s (4.79 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 6.2 GB | total 87.4s
=== round 1 nocap [SLOTSTREAM_PREFILL_CACHE_MB=2048,SLOTSTREAM_SWEEP_TRACE=1] 14:37:32 reclaimable=31.0 ===
rc=0 sampled-peak=7.50GB answer=<think></think>SEVENTEEN
sweep trace: io 58.45s, gpu wait 8.75s, row sort 0.04s, pool copies 0.63s, mlx peak 5.55 GB, mlx cache 2.14 GB
-- prefill 7960 tok in 90.12s (88.3 tok/s)
-- prefill split: io 58.45s + scatter 0.63s + compute 31.05s | 298851 records (826.3 GB, 14.1 GB/s)
-- decode 9 tok in 1.78s (5.06 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 7.9 GB | total 91.9s
done 14:39:16
```

### ab_finfloor_r1_final
```
slotstream memory plan (--memory-gb)
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
engine ready in 0.9s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.1 min left
  prefill: 4096/7960 tokens (51%), ~40 s left
  prefill: 6144/7960 tokens (77%), ~19 s left
  prefill: done, 7960 tokens in 1.4 min (93 tok/s)
sweep trace: io 56.31s, gpu wait 7.71s, row sort 0.04s, pool copies 0.65s, mlx peak 5.55 GB, mlx cache 0.45 GB
-- prefill 7960 tok in 85.48s (93.1 tok/s)
-- prefill split: io 56.31s + scatter 0.65s + compute 28.52s | 298851 records (826.3 GB, 14.7 GB/s)
-- decode 9 tok in 1.88s (4.79 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 6.2 GB | total 87.4s
```

### ab_finfloor_r1_nocap
```
slotstream memory plan (--memory-gb)
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
engine ready in 0.9s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.1 min left
  prefill: 4096/7960 tokens (51%), ~43 s left
  prefill: 6144/7960 tokens (77%), ~20 s left
  prefill: done, 7960 tokens in 1.5 min (88 tok/s)
sweep trace: io 58.45s, gpu wait 8.75s, row sort 0.04s, pool copies 0.63s, mlx peak 5.55 GB, mlx cache 2.14 GB
-- prefill 7960 tok in 90.12s (88.3 tok/s)
-- prefill split: io 58.45s + scatter 0.63s + compute 31.05s | 298851 records (826.3 GB, 14.1 GB/s)
-- decode 9 tok in 1.78s (5.06 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 7.9 GB | total 91.9s
```

## finten

Harness log (`prefill_ab*.sh`):

```
start 14:39:16 reclaimable=30.3 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p7960.txt args=--memory-gb 10
=== round 1 final [SLOTSTREAM_SWEEP_TRACE=1] 14:39:16 reclaimable=30.3 ===
rc=0 sampled-peak=6.86GB answer=<think></think>SEVENTEEN
sweep trace: io 58.55s, gpu wait 8.70s, row sort 0.04s, pool copies 0.86s, mlx peak 6.43 GB, mlx cache 0.54 GB
-- prefill 7960 tok in 90.80s (87.7 tok/s)
-- prefill split: io 58.55s + scatter 0.86s + compute 31.40s | 298851 records (826.3 GB, 14.1 GB/s)
-- decode 9 tok in 1.75s (5.15 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.505 | ngram rows 24h/120m | peak 7.2 GB | total 92.5s
done 14:41:00
```

### ab_finten_r1_final
```
slotstream memory plan (--memory-gb)
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
engine ready in 0.9s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.1 min left
  prefill: 4096/7960 tokens (51%), ~43 s left
  prefill: 6144/7960 tokens (77%), ~20 s left
  prefill: done, 7960 tokens in 1.5 min (88 tok/s)
sweep trace: io 58.55s, gpu wait 8.70s, row sort 0.04s, pool copies 0.86s, mlx peak 6.43 GB, mlx cache 0.54 GB
-- prefill 7960 tok in 90.80s (87.7 tok/s)
-- prefill split: io 58.55s + scatter 0.86s + compute 31.40s | 298851 records (826.3 GB, 14.1 GB/s)
-- decode 9 tok in 1.75s (5.15 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.505 | ngram rows 24h/120m | peak 7.2 GB | total 92.5s
```

## recfloor

Harness log (`prefill_ab*.sh`):

```
start 14:03:50 reclaimable=25.1 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p7960.txt args=--memory-gb 8.1
=== round 1 rec [SLOTSTREAM_SWEEP_TRACE=1] 14:03:50 reclaimable=25.1 ===
rc=0 sampled-peak=7.14GB answer=<think></think>SEVENTEEN
sweep trace: io 65.33s, gpu wait 6.28s, row sort 0.03s, pool copies 0.67s, mlx peak 5.55 GB, mlx cache 0.45 GB
-- prefill 7960 tok in 93.95s (84.7 tok/s)
-- prefill split: io 65.33s + scatter 0.67s + compute 27.95s | 298851 records (826.3 GB, 12.6 GB/s)
-- decode 9 tok in 1.89s (4.77 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 7.4 GB | total 95.8s
=== round 1 rec2g [SLOTSTREAM_PREFILL_CACHE_MB=2048,SLOTSTREAM_SWEEP_TRACE=1] 14:05:38 reclaimable=26.0 ===
rc=0 sampled-peak=8.62GB answer=<think></think>SEVENTEEN
sweep trace: io 64.29s, gpu wait 7.24s, row sort 0.03s, pool copies 0.71s, mlx peak 5.55 GB, mlx cache 2.15 GB
-- prefill 7960 tok in 94.65s (84.1 tok/s)
-- prefill split: io 64.29s + scatter 0.71s + compute 29.64s | 298851 records (826.3 GB, 12.9 GB/s)
-- decode 9 tok in 1.95s (4.62 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 9.1 GB | total 96.6s
done 14:07:26
```

### ab_recfloor_r1_rec
```
slotstream memory plan (--memory-gb)
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~40 tok/s here; costs ~0.3 GB of the target)
engine ready in 1.2s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~3.3 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.3 min left
  prefill: 4096/7960 tokens (51%), ~48 s left
  prefill: 6144/7960 tokens (77%), ~21 s left
  prefill: done, 7960 tokens in 1.6 min (85 tok/s)
sweep trace: io 65.33s, gpu wait 6.28s, row sort 0.03s, pool copies 0.67s, mlx peak 5.55 GB, mlx cache 0.45 GB
-- prefill 7960 tok in 93.95s (84.7 tok/s)
-- prefill split: io 65.33s + scatter 0.67s + compute 27.95s | 298851 records (826.3 GB, 12.6 GB/s)
-- decode 9 tok in 1.89s (4.77 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 7.4 GB | total 95.8s
```

### ab_recfloor_r1_rec2g
```
slotstream memory plan (--memory-gb)
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~40 tok/s here; costs ~0.3 GB of the target)
engine ready in 0.9s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  prefill: reading 7960 prompt tokens, ~3.3 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7960 tokens (26%), ~1.2 min left
  prefill: 4096/7960 tokens (51%), ~46 s left
  prefill: 6144/7960 tokens (77%), ~21 s left
  prefill: done, 7960 tokens in 1.6 min (84 tok/s)
sweep trace: io 64.29s, gpu wait 7.24s, row sort 0.03s, pool copies 0.71s, mlx peak 5.55 GB, mlx cache 2.15 GB
-- prefill 7960 tok in 94.65s (84.1 tok/s)
-- prefill split: io 64.29s + scatter 0.71s + compute 29.64s | 298851 records (826.3 GB, 12.9 GB/s)
-- decode 9 tok in 1.95s (4.62 tok/s)
-- expert cache ~13/512 experts per layer, hit rate 0.341 | ngram rows 24h/120m | peak 9.1 GB | total 96.6s
```

