---
type: run
id: 01m1htch9hzrh4a2a41f8p95p8
created: 2026-09-02T19:43:56.209116+00:00
updated: 2026-09-02T19:43:56.209116+00:00
summary: prefill pass-size ladder at a matched 60-per-layer pool, sweep and 0.2.2 code, plus 4096 at 16 GB, dev Mac, 2026-09-02
binary: 'sweep: local release builds of e09bcac plus the sweep (Sources exported to a scratch tree; n2b, then n2d = the shipped code); baseline: local release build of e09bcac'
captured_at: 2026-09-02
command: SLOTSTREAM_PREFILL_CHUNK=<256|512|1024|2048|4096> slotstream run --raw --prompt <8,073-token acceptance prompt> --max-tokens 16 --greedy --experts-per-layer 60 (and --memory-gb 16 for the 4096 override)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: prefill pass-size ladder at a matched 60-per-layer pool, sweep and 0.2.2 code, plus 4096 at 16 GB, dev Mac, 2026-09-02
tool: run
---
## ladder60

Harness log (`prefill_ab*.sh`):

```
start 13:20:49 reclaimable=25.4 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--experts-per-layer 60
=== round 1 c256 [SLOTSTREAM_PREFILL_CHUNK=256] 13:20:49 reclaimable=25.4 ===
rc=0 sampled-peak=13.00GB answer=
-- prefill 8073 tok in 92.28s (87.5 tok/s)
-- prefill split: io 64.13s + scatter 1.47s + compute 26.68s | 303357 records (838.7 GB, 13.1 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 14.1 GB | total 92.3s
=== round 1 c512 [SLOTSTREAM_PREFILL_CHUNK=512] 13:22:32 reclaimable=25.8 ===
rc=0 sampled-peak=14.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 62.98s (128.2 tok/s)
-- prefill split: io 41.22s + scatter 1.37s + compute 20.40s | 173537 records (479.8 GB, 11.6 GB/s)
-- decode 16 tok in 3.48s (4.60 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.599 | ngram rows 40h/216m | peak 14.1 GB | total 66.5s
=== round 1 c1024 [SLOTSTREAM_PREFILL_CHUNK=1024] 13:23:52 reclaimable=26.0 ===
rc=0 sampled-peak=14.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 47.73s (169.2 tok/s)
-- prefill split: io 25.54s + scatter 1.32s + compute 20.86s | 98872 records (273.4 GB, 10.7 GB/s)
-- decode 16 tok in 3.22s (4.97 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.600 | ngram rows 40h/216m | peak 14.0 GB | total 50.9s
=== round 1 c2048 [SLOTSTREAM_PREFILL_CHUNK=2048] 13:24:52 reclaimable=26.3 ===
rc=0 sampled-peak=15.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 38.31s (210.8 tok/s)
-- prefill split: io 15.74s + scatter 0.97s + compute 21.59s | 56086 records (155.1 GB, 9.9 GB/s)
-- decode 16 tok in 3.62s (4.41 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.595 | ngram rows 40h/216m | peak 13.7 GB | total 41.9s
=== round 1 c4096 [SLOTSTREAM_PREFILL_CHUNK=4096] 13:25:48 reclaimable=26.1 ===
rc=0 sampled-peak=16.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 36.32s (222.3 tok/s)
-- prefill split: io 12.32s + scatter 1.23s + compute 22.77s | 45079 records (124.6 GB, 10.1 GB/s)
-- decode 16 tok in 4.35s (3.68 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.593 | ngram rows 40h/216m | peak 13.8 GB | total 40.7s
done 13:26:39
```

### ab_ladder60_r1_c1024
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.4s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~35 s left
  prefill: 4096/8073 tokens (51%), ~21 s left
  prefill: 6144/8073 tokens (76%), ~11 s left
  prefill: done, 8073 tokens in 48 s (169 tok/s)
-- prefill 8073 tok in 47.73s (169.2 tok/s)
-- prefill split: io 25.54s + scatter 1.32s + compute 20.86s | 98872 records (273.4 GB, 10.7 GB/s)
-- decode 16 tok in 3.22s (4.97 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.600 | ngram rows 40h/216m | peak 14.0 GB | total 50.9s
```

### ab_ladder60_r1_c2048
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.2s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.2 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~27 s left
  prefill: 4096/8073 tokens (51%), ~18 s left
  prefill: 6144/8073 tokens (76%), ~9 s left
  prefill: done, 8073 tokens in 38 s (211 tok/s)
-- prefill 8073 tok in 38.31s (210.8 tok/s)
-- prefill split: io 15.74s + scatter 0.97s + compute 21.59s | 56086 records (155.1 GB, 9.9 GB/s)
-- decode 16 tok in 3.62s (4.41 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.595 | ngram rows 40h/216m | peak 13.7 GB | total 41.9s
```

### ab_ladder60_r1_c256
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~3.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~1.1 min left
  prefill: 4096/8073 tokens (51%), ~42 s left
  prefill: 6144/8073 tokens (76%), ~21 s left
  prefill: done, 8073 tokens in 1.5 min (87 tok/s)
-- prefill 8073 tok in 92.28s (87.5 tok/s)
-- prefill split: io 64.13s + scatter 1.47s + compute 26.68s | 303357 records (838.7 GB, 13.1 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 14.1 GB | total 92.3s
```

### ab_ladder60_r1_c4096
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.1 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 4096/8073 tokens (51%), ~14 s left
  prefill: 6144/8073 tokens (76%), ~8 s left
  prefill: done, 8073 tokens in 36 s (222 tok/s)
-- prefill 8073 tok in 36.32s (222.3 tok/s)
-- prefill split: io 12.32s + scatter 1.23s + compute 22.77s | 45079 records (124.6 GB, 10.1 GB/s)
-- decode 16 tok in 4.35s (3.68 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.593 | ngram rows 40h/216m | peak 13.8 GB | total 40.7s
```

### ab_ladder60_r1_c512
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.2s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~2.7 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~45 s left
  prefill: 4096/8073 tokens (51%), ~29 s left
  prefill: 6144/8073 tokens (76%), ~14 s left
  prefill: done, 8073 tokens in 1.0 min (128 tok/s)
-- prefill 8073 tok in 62.98s (128.2 tok/s)
-- prefill split: io 41.22s + scatter 1.37s + compute 20.40s | 173537 records (479.8 GB, 11.6 GB/s)
-- decode 16 tok in 3.48s (4.60 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.599 | ngram rows 40h/216m | peak 14.1 GB | total 66.5s
```

## ladder60base

Harness log (`prefill_ab*.sh`):

```
start 13:26:39 reclaimable=25.0 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--experts-per-layer 60
=== round 1 b256 [SLOTSTREAM_PREFILL_CHUNK=256] 13:26:39 reclaimable=25.0 ===
rc=0 sampled-peak=13.00GB answer=
-- prefill 8073 tok in 176.93s (45.6 tok/s)
-- prefill split: io 96.16s + scatter 33.38s + compute 47.39s | 302195 records (835.5 GB, 8.7 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.9 GB | total 176.9s
=== round 1 b1024 [SLOTSTREAM_PREFILL_CHUNK=1024] 13:29:46 reclaimable=24.4 ===
rc=0 sampled-peak=14.00GB answer=<think></think>SEVENTEEN
-- prefill 8073 tok in 92.77s (87.0 tok/s)
-- prefill split: io 29.95s + scatter 11.39s + compute 51.43s | 98273 records (271.7 GB, 9.1 GB/s)
-- decode 9 tok in 1.82s (4.95 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.594 | ngram rows 24h/120m | peak 13.9 GB | total 94.6s
=== round 1 b4096 [SLOTSTREAM_PREFILL_CHUNK=4096] 13:31:31 reclaimable=24.8 ===
rc=0 sampled-peak=16.00GB answer=
-- prefill 8073 tok in 78.25s (103.2 tok/s)
-- prefill split: io 14.79s + scatter 6.24s + compute 57.23s | 44862 records (124.0 GB, 8.4 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 15.5 GB | total 78.3s
done 13:33:00
```

### ab_ladder60base_r1_b1024
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.1s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~1.2 min left
  prefill: 4096/8073 tokens (51%), ~45 s left
  prefill: 6144/8073 tokens (76%), ~22 s left
  prefill: done, 8073 tokens in 1.5 min (87 tok/s)
-- prefill 8073 tok in 92.77s (87.0 tok/s)
-- prefill split: io 29.95s + scatter 11.39s + compute 51.43s | 98273 records (271.7 GB, 9.1 GB/s)
-- decode 9 tok in 1.82s (4.95 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.594 | ngram rows 24h/120m | peak 13.9 GB | total 94.6s
```

### ab_ladder60base_r1_b256
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.3s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~3.4 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/8073 tokens (25%), ~2.0 min left
  prefill: 4096/8073 tokens (51%), ~1.4 min left
  prefill: 6144/8073 tokens (76%), ~41 s left
  prefill: done, 8073 tokens in 2.9 min (46 tok/s)
-- prefill 8073 tok in 176.93s (45.6 tok/s)
-- prefill split: io 96.16s + scatter 33.38s + compute 47.39s | 302195 records (835.5 GB, 8.7 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 13.9 GB | total 176.9s
```

### ab_ladder60base_r1_b4096
```
slotstream memory plan (--experts-per-layer)
  cache:  ~60 of 512 experts per layer  (2880 global slots = 8.0 GB pool)
  expect: ~15.7 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~60/512 per layer (2880 global slots = 8.0 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.1 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 4096/8073 tokens (51%), ~37 s left
  prefill: 6144/8073 tokens (76%), ~18 s left
  prefill: done, 8073 tokens in 1.3 min (103 tok/s)
-- prefill 8073 tok in 78.25s (103.2 tok/s)
-- prefill split: io 14.79s + scatter 6.24s + compute 57.23s | 44862 records (124.0 GB, 8.4 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~60/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 15.5 GB | total 78.3s
```

## c4096at16

Harness log (`prefill_ab*.sh`):

```
start 13:33:00 reclaimable=24.8 GB prompt=/private/tmp/claude-502/-Users-carlos-Projects-command-center/3967c62e-f3dc-4db2-8431-8a34547bec39/scratchpad/p8016.txt args=--memory-gb 16
=== round 1 c4096 [SLOTSTREAM_PREFILL_CHUNK=4096] 13:33:00 reclaimable=24.9 ===
rc=0 sampled-peak=15.00GB answer=<think>The user is asking me what the vault combination is, 
-- prefill 8073 tok in 32.72s (246.7 tok/s)
-- prefill split: io 11.41s + scatter 0.97s + compute 20.34s | 45079 records (124.6 GB, 10.9 GB/s)
-- decode 16 tok in 3.59s (4.46 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.577 | ngram rows 40h/216m | peak 12.8 GB | total 36.3s
=== round 1 b4096 [SLOTSTREAM_PREFILL_CHUNK=4096] 13:33:49 reclaimable=26.8 ===
rc=0 sampled-peak=15.00GB answer=
-- prefill 8073 tok in 74.82s (107.9 tok/s)
-- prefill split: io 12.62s + scatter 4.60s + compute 57.60s | 44862 records (124.0 GB, 9.8 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 14.6 GB | total 74.8s
done 13:35:15
```

### ab_c4096at16_r1_b4096
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.0s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.1 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 4096/8073 tokens (51%), ~36 s left
  prefill: 6144/8073 tokens (76%), ~17 s left
  prefill: done, 8073 tokens in 1.2 min (108 tok/s)
-- prefill 8073 tok in 74.82s (107.9 tok/s)
-- prefill split: io 12.62s + scatter 4.60s + compute 57.60s | 44862 records (124.0 GB, 9.8 GB/s)
-- decode 0 tok in 0.00s (0.00 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.000 | ngram rows 0h/0m | peak 14.6 GB | total 74.8s
```

### ab_c4096at16_r1_c4096
```
slotstream memory plan (--memory-gb)
  target: 16.0 GB total for this process
  cache:  ~54 of 512 experts per layer  (2576 global slots = 7.1 GB pool)
  expect: ~15.0 GB peak, ~8 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 1024 tokens per pass (~94 tok/s here; costs ~1.3 GB of the target)
engine ready in 1.2s: expert cache ~54/512 per layer (2576 global slots = 7.1 GB), eos [248044, 248046]
  prefill: reading 8073 prompt tokens, ~1.1 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 4096/8073 tokens (51%), ~14 s left
  prefill: 6144/8073 tokens (76%), ~7 s left
  prefill: done, 8073 tokens in 33 s (247 tok/s)
-- prefill 8073 tok in 32.72s (246.7 tok/s)
-- prefill split: io 11.41s + scatter 0.97s + compute 20.34s | 45079 records (124.6 GB, 10.9 GB/s)
-- decode 16 tok in 3.59s (4.46 tok/s)
-- expert cache ~54/512 experts per layer, hit rate 0.577 | ngram rows 40h/216m | peak 12.8 GB | total 36.3s
```

