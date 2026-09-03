---
type: run
id: 01m1htch8kpqfmnvgrqznhkcan
created: 2026-09-02T19:43:56.179956+00:00
updated: 2026-09-02T19:43:56.179956+00:00
summary: prefill sweep A/B, 10,490-token prose prompt at a 16 GB target, dev Mac, 2026-09-02
binary: 'sweep: local release builds of e09bcac plus the sweep (Sources exported to a scratch tree; n2b, then n2d = the shipped code); baseline: local release build of e09bcac'
captured_at: 2026-09-02
command: slotstream run --raw --prompt <34,000-character PLAN.md excerpt> --max-tokens 16 --greedy --memory-gb 16 (interleaved arms)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: prefill sweep A/B, 10,490-token prose prompt at a 16 GB target, dev Mac, 2026-09-02
tool: run
---
## doc16

Harness log (`prefill_ab*.sh`):

```
start 12:52:37 reclaimable=24.5 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/pdoc.txt args=--memory-gb 16
=== round 1 new 12:52:37 reclaimable=24.5 ===
rc=0 sampled-peak=13.00GB answer=
-- prefill 10490 tok in 97.26s (107.9 tok/s)
-- prefill split: io 45.96s + scatter 1.60s + compute 49.70s | 181475 records (501.7 GB, 10.9 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 97.3s
=== round 1 base 12:54:24 reclaimable=25.8 ===
rc=0 sampled-peak=13.00GB answer=` | 16 GB | **~37** | ~4.
-- prefill 10490 tok in 158.60s (66.1 tok/s)
-- prefill split: io 52.87s + scatter 16.67s + compute 89.06s | 181805 records (502.7 GB, 9.5 GB/s)
-- decode 16 tok in 2.45s (6.53 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 161.0s
=== round 2 new 12:57:15 reclaimable=23.8 ===
rc=0 sampled-peak=13.00GB answer=
-- prefill 10490 tok in 98.53s (106.5 tok/s)
-- prefill split: io 46.54s + scatter 1.64s + compute 50.34s | 181475 records (501.7 GB, 10.8 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 98.5s
=== round 2 base 12:59:07 reclaimable=25.7 ===
rc=0 sampled-peak=13.00GB answer=` | 16 GB | **~37** | ~4.
-- prefill 10490 tok in 157.52s (66.6 tok/s)
-- prefill split: io 51.20s + scatter 17.75s + compute 88.58s | 181805 records (502.7 GB, 9.8 GB/s)
-- decode 16 tok in 2.69s (5.94 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 160.2s
done 13:01:58
```

### ab_doc16_r1_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~1.8 min left
  prefill: 6144/10490 tokens (59%), ~1.0 min left
  prefill: 8192/10490 tokens (78%), ~34 s left
  prefill: done, 10490 tokens in 2.6 min (66 tok/s)
-- prefill 10490 tok in 158.60s (66.1 tok/s)
-- prefill split: io 52.87s + scatter 16.67s + compute 89.06s | 181805 records (502.7 GB, 9.5 GB/s)
-- decode 16 tok in 2.45s (6.53 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 161.0s
```

### ab_doc16_r1_new
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~1.2 min left
  prefill: 6144/10490 tokens (59%), ~39 s left
  prefill: 8192/10490 tokens (78%), ~20 s left
  prefill: done, 10490 tokens in 1.6 min (108 tok/s)
-- prefill 10490 tok in 97.26s (107.9 tok/s)
-- prefill split: io 45.96s + scatter 1.60s + compute 49.70s | 181475 records (501.7 GB, 10.9 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 97.3s
```

### ab_doc16_r2_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~1.9 min left
  prefill: 6144/10490 tokens (59%), ~1.1 min left
  prefill: 8192/10490 tokens (78%), ~34 s left
  prefill: done, 10490 tokens in 2.6 min (67 tok/s)
-- prefill 10490 tok in 157.52s (66.6 tok/s)
-- prefill split: io 51.20s + scatter 17.75s + compute 88.58s | 181805 records (502.7 GB, 9.8 GB/s)
-- decode 16 tok in 2.69s (5.94 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 160.2s
```

### ab_doc16_r2_new
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.7s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~1.2 min left
  prefill: 6144/10490 tokens (59%), ~39 s left
  prefill: 8192/10490 tokens (78%), ~20 s left
  prefill: done, 10490 tokens in 1.6 min (106 tok/s)
-- prefill 10490 tok in 98.53s (106.5 tok/s)
-- prefill split: io 46.54s + scatter 1.64s + compute 50.34s | 181475 records (501.7 GB, 10.8 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 98.5s
```

## findoc

Harness log (`prefill_ab*.sh`):

```
start 14:27:19 reclaimable=31.2 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/pdoc.txt args=--memory-gb 16
=== round 1 final [SLOTSTREAM_SWEEP_TRACE=1] 14:27:19 reclaimable=31.2 ===
rc=0 sampled-peak=13.00GB answer=
sweep trace: io 45.22s, gpu wait 0.91s, row sort 0.03s, pool copies 1.60s, mlx peak 12.40 GB, mlx cache 2.15 GB
-- prefill 10490 tok in 74.87s (140.1 tok/s)
-- prefill split: io 45.22s + scatter 1.60s + compute 28.05s | 181475 records (501.7 GB, 11.1 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 74.9s
=== round 1 base [] 14:28:47 reclaimable=30.1 ===
rc=0 sampled-peak=13.00GB answer=` | 16 GB | **~37** | ~4.
-- prefill 10490 tok in 155.84s (67.3 tok/s)
-- prefill split: io 46.84s + scatter 17.27s + compute 91.73s | 181805 records (502.7 GB, 10.7 GB/s)
-- decode 16 tok in 2.91s (5.50 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 158.7s
=== round 2 final [SLOTSTREAM_SWEEP_TRACE=1] 14:31:37 reclaimable=29.2 ===
rc=0 sampled-peak=14.00GB answer=
sweep trace: io 45.13s, gpu wait 0.92s, row sort 0.03s, pool copies 1.55s, mlx peak 12.40 GB, mlx cache 2.15 GB
-- prefill 10490 tok in 75.37s (139.2 tok/s)
-- prefill split: io 45.13s + scatter 1.55s + compute 28.68s | 181475 records (501.7 GB, 11.1 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 75.4s
=== round 2 base [] 14:33:04 reclaimable=30.5 ===
rc=0 sampled-peak=13.00GB answer=` | 16 GB | **~37** | ~4.
-- prefill 10490 tok in 155.24s (67.6 tok/s)
-- prefill split: io 46.52s + scatter 17.24s + compute 91.47s | 181805 records (502.7 GB, 10.8 GB/s)
-- decode 16 tok in 2.95s (5.42 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 158.2s
done 14:35:54
```

### ab_findoc_r1_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~1.8 min left
  prefill: 6144/10490 tokens (59%), ~1.0 min left
  prefill: 8192/10490 tokens (78%), ~33 s left
  prefill: done, 10490 tokens in 2.6 min (67 tok/s)
-- prefill 10490 tok in 155.84s (67.3 tok/s)
-- prefill split: io 46.84s + scatter 17.27s + compute 91.73s | 181805 records (502.7 GB, 10.7 GB/s)
-- decode 16 tok in 2.91s (5.50 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 158.7s
```

### ab_findoc_r1_final
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.1 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~49 s left
  prefill: 6144/10490 tokens (59%), ~29 s left
  prefill: 8192/10490 tokens (78%), ~15 s left
  prefill: done, 10490 tokens in 1.2 min (140 tok/s)
sweep trace: io 45.22s, gpu wait 0.91s, row sort 0.03s, pool copies 1.60s, mlx peak 12.40 GB, mlx cache 2.15 GB
-- prefill 10490 tok in 74.87s (140.1 tok/s)
-- prefill split: io 45.22s + scatter 1.60s + compute 28.05s | 181475 records (501.7 GB, 11.1 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 74.9s
```

### ab_findoc_r2_base
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~1.8 min left
  prefill: 6144/10490 tokens (59%), ~1.0 min left
  prefill: 8192/10490 tokens (78%), ~33 s left
  prefill: done, 10490 tokens in 2.6 min (68 tok/s)
-- prefill 10490 tok in 155.24s (67.6 tok/s)
-- prefill split: io 46.52s + scatter 17.24s + compute 91.47s | 181805 records (502.7 GB, 10.8 GB/s)
-- decode 16 tok in 2.95s (5.42 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.635 | ngram rows 192h/64m | peak 13.2 GB | total 158.2s
```

### ab_findoc_r2_final
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.1 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~51 s left
  prefill: 6144/10490 tokens (59%), ~29 s left
  prefill: 8192/10490 tokens (78%), ~15 s left
  prefill: done, 10490 tokens in 1.3 min (139 tok/s)
sweep trace: io 45.13s, gpu wait 0.92s, row sort 0.03s, pool copies 1.55s, mlx peak 12.40 GB, mlx cache 2.15 GB
-- prefill 10490 tok in 75.37s (139.2 tok/s)
-- prefill split: io 45.13s + scatter 1.55s + compute 28.68s | 181475 records (501.7 GB, 11.1 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 75.4s
```

## doctrace

Harness log (`prefill_ab*.sh`):

```
start 13:42:39 reclaimable=25.3 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/pdoc.txt args=--memory-gb 16
=== round 1 t2048 [SLOTSTREAM_SWEEP_TRACE=1] 13:42:39 reclaimable=25.3 ===
rc=0 sampled-peak=13.00GB answer=
sweep trace: io 47.94s, gpu wait 0.72s, row sort 0.02s, pool copies 1.70s, mlx peak 12.40 GB, mlx cache 2.15 GB
-- prefill 10490 tok in 103.73s (101.1 tok/s)
-- prefill split: io 47.94s + scatter 1.70s + compute 54.10s | 181475 records (501.7 GB, 10.5 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 103.7s
=== round 1 t4096 [SLOTSTREAM_PREFILL_CHUNK=4096,SLOTSTREAM_SWEEP_TRACE=1] 13:44:35 reclaimable=26.1 ===
rc=0 sampled-peak=16.00GB answer=` | 16 GB | **~37** | ~4.
sweep trace: io 22.74s, gpu wait 1.77s, row sort 0.02s, pool copies 1.72s, mlx peak 15.46 GB, mlx cache 2.07 GB
-- prefill 10490 tok in 78.86s (133.0 tok/s)
-- prefill split: io 22.74s + scatter 1.72s + compute 54.40s | 89036 records (246.2 GB, 10.8 GB/s)
-- decode 16 tok in 3.69s (4.34 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.637 | ngram rows 192h/64m | peak 13.4 GB | total 82.6s
=== round 1 b4096 [SLOTSTREAM_PREFILL_CHUNK=4096] 13:46:08 reclaimable=25.5 ===
rc=0 sampled-peak=15.00GB answer=
-- prefill 10490 tok in 146.67s (71.5 tok/s)
-- prefill split: io 29.54s + scatter 11.77s + compute 105.36s | 89127 records (246.4 GB, 8.3 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.5 GB | total 146.7s
done 13:48:45
```

### ab_doctrace_r1_b4096
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.4s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.5 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 4096/10490 tokens (39%), ~1.5 min left
  prefill: 6144/10490 tokens (59%), ~1.0 min left
  prefill: 8192/10490 tokens (78%), ~32 s left
  prefill: done, 10490 tokens in 2.4 min (72 tok/s)
-- prefill 10490 tok in 146.67s (71.5 tok/s)
-- prefill split: io 29.54s + scatter 11.77s + compute 105.36s | 89127 records (246.4 GB, 8.3 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.5 GB | total 146.7s
```

### ab_doctrace_r1_t2048
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~1.2 min left
  prefill: 6144/10490 tokens (59%), ~40 s left
  prefill: 8192/10490 tokens (78%), ~21 s left
  prefill: done, 10490 tokens in 1.7 min (101 tok/s)
sweep trace: io 47.94s, gpu wait 0.72s, row sort 0.02s, pool copies 1.70s, mlx peak 12.40 GB, mlx cache 2.15 GB
-- prefill 10490 tok in 103.73s (101.1 tok/s)
-- prefill split: io 47.94s + scatter 1.70s + compute 54.10s | 181475 records (501.7 GB, 10.5 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.6 GB | total 103.7s
```

### ab_doctrace_r1_t4096
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.5 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 4096/10490 tokens (39%), ~40 s left
  prefill: 6144/10490 tokens (59%), ~29 s left
  prefill: 8192/10490 tokens (78%), ~16 s left
  prefill: done, 10490 tokens in 1.3 min (133 tok/s)
sweep trace: io 22.74s, gpu wait 1.77s, row sort 0.02s, pool copies 1.72s, mlx peak 15.46 GB, mlx cache 2.07 GB
-- prefill 10490 tok in 78.86s (133.0 tok/s)
-- prefill split: io 22.74s + scatter 1.72s + compute 54.40s | 89036 records (246.2 GB, 10.8 GB/s)
-- decode 16 tok in 3.69s (4.34 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.637 | ngram rows 192h/64m | peak 13.4 GB | total 82.6s
```

## recdoc

Harness log (`prefill_ab*.sh`):

```
start 14:07:26 reclaimable=25.8 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/pdoc.txt args=--memory-gb 16
=== round 1 rec [SLOTSTREAM_SWEEP_TRACE=1] 14:07:26 reclaimable=25.8 ===
rc=0 sampled-peak=13.00GB answer=
sweep trace: io 47.00s, gpu wait 1.02s, row sort 0.02s, pool copies 1.90s, mlx peak 12.40 GB, mlx cache 0.53 GB
-- prefill 10490 tok in 80.09s (131.0 tok/s)
-- prefill split: io 47.00s + scatter 1.90s + compute 31.19s | 181475 records (501.7 GB, 10.7 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.2 GB | total 80.1s
done 14:08:58
```

### ab_recdoc_r1_rec
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 10490 prompt tokens, ~1.9 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 3072/10490 tokens (29%), ~55 s left
  prefill: 6144/10490 tokens (59%), ~30 s left
  prefill: 8192/10490 tokens (78%), ~16 s left
  prefill: done, 10490 tokens in 1.3 min (131 tok/s)
sweep trace: io 47.00s, gpu wait 1.02s, row sort 0.02s, pool copies 1.90s, mlx peak 12.40 GB, mlx cache 0.53 GB
-- prefill 10490 tok in 80.09s (131.0 tok/s)
-- prefill split: io 47.00s + scatter 1.90s + compute 31.19s | 181475 records (501.7 GB, 10.7 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.2 GB | total 80.1s
```

