---
type: run
id: 01m1jyzxjm4w4ya2jr0a7akxjz
created: 2026-09-03T06:23:40.116861+00:00
updated: 2026-09-03T06:23:50.621019+00:00
summary: Pass cost by chunk with and without query-blocked attention, pinned 20 experts/layer, dev Mac, 2026-09-03
binary: .build/release/slotstream, local release build of the working tree on top of 270ffcd
captured_at: 2026-09-03
command: slotstream run --raw --prompt <7,960-token acceptance prompt> --max-tokens 8 --greedy --experts-per-layer 20; SLOTSTREAM_PREFILL_CHUNK in {512,1024,2048}; arm 'whole' adds SLOTSTREAM_ATTN_BLOCK=0
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Pass cost by chunk with and without query-blocked attention, pinned 20 experts/layer, dev Mac, 2026-09-03
tool: run
---
## Peak by pass size, whole against query-blocked attention

Two interleaved rounds per cell; the arms differ only in `SLOTSTREAM_ATTN_BLOCK`.

```
# pass cost by chunk, whole vs query-blocked attention, pinned 20 experts/layer, 7,960-token prompt
# slotstream run --raw --prompt <7960-token acceptance prompt> --max-tokens 8 --greedy --experts-per-layer 20
# SLOTSTREAM_PREFILL_CHUNK=<chunk>, arm 'whole' adds SLOTSTREAM_ATTN_BLOCK=0

--- blocked.c1024.r1.err
engine ready in 1.2s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 68.96s (115.4 tok/s)
-- prefill split: io 26.88s + scatter 0.72s + compute 41.36s | 98662 records (272.8 GB, 10.1 GB/s)
-- decode 8 tok in 2.17s (3.69 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.497 | ngram rows 8h/120m | peak 7.8 GB | total 71.1s
--- blocked.c1024.r2.err
engine ready in 0.8s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 46.33s (171.8 tok/s)
-- prefill split: io 20.84s + scatter 0.38s + compute 25.11s | 98662 records (272.8 GB, 13.1 GB/s)
-- decode 8 tok in 1.68s (4.76 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.497 | ngram rows 8h/120m | peak 7.7 GB | total 48.0s
--- blocked.c2048.r1.err
engine ready in 0.9s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 34.68s (229.5 tok/s)
-- prefill split: io 13.63s + scatter 0.45s + compute 20.60s | 56025 records (154.9 GB, 11.4 GB/s)
-- decode 8 tok in 1.71s (4.68 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.500 | ngram rows 8h/120m | peak 8.5 GB | total 36.4s
--- blocked.c2048.r2.err
engine ready in 0.8s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 34.13s (233.2 tok/s)
-- prefill split: io 13.07s + scatter 0.38s + compute 20.68s | 56025 records (154.9 GB, 11.8 GB/s)
-- decode 8 tok in 1.73s (4.64 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.500 | ngram rows 8h/120m | peak 8.5 GB | total 35.9s
--- blocked.c512.r1.err
engine ready in 0.8s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 68.47s (116.3 tok/s)
-- prefill split: io 34.47s + scatter 0.36s + compute 33.64s | 173053 records (478.5 GB, 13.9 GB/s)
-- decode 8 tok in 1.54s (5.18 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.486 | ngram rows 0h/128m | peak 7.4 GB | total 70.0s
--- blocked.c512.r2.err
engine ready in 0.8s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 67.82s (117.4 tok/s)
-- prefill split: io 34.43s + scatter 0.33s + compute 33.06s | 173053 records (478.5 GB, 13.9 GB/s)
-- decode 8 tok in 1.52s (5.28 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.486 | ngram rows 0h/128m | peak 7.4 GB | total 69.3s
--- whole.c1024.r1.err
engine ready in 0.9s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 46.38s (171.6 tok/s)
-- prefill split: io 20.80s + scatter 0.33s + compute 25.25s | 98662 records (272.8 GB, 13.1 GB/s)
-- decode 8 tok in 1.81s (4.43 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.497 | ngram rows 8h/120m | peak 7.7 GB | total 48.2s
--- whole.c1024.r2.err
engine ready in 0.8s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 46.18s (172.4 tok/s)
-- prefill split: io 20.81s + scatter 0.42s + compute 24.96s | 98662 records (272.8 GB, 13.1 GB/s)
-- decode 8 tok in 1.65s (4.84 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.497 | ngram rows 8h/120m | peak 7.7 GB | total 47.8s
--- whole.c2048.r1.err
engine ready in 1.3s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 41.46s (192.0 tok/s)
-- prefill split: io 14.02s + scatter 0.35s + compute 27.10s | 56025 records (154.9 GB, 11.0 GB/s)
-- decode 8 tok in 1.96s (4.09 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.500 | ngram rows 8h/120m | peak 8.5 GB | total 43.4s
--- whole.c2048.r2.err
engine ready in 0.8s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 34.22s (232.6 tok/s)
-- prefill split: io 13.35s + scatter 0.40s + compute 20.48s | 56025 records (154.9 GB, 11.6 GB/s)
-- decode 8 tok in 1.72s (4.66 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.500 | ngram rows 8h/120m | peak 8.5 GB | total 35.9s
--- whole.c512.r1.err
engine ready in 1.0s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 69.28s (114.9 tok/s)
-- prefill split: io 34.91s + scatter 0.43s + compute 33.94s | 173053 records (478.5 GB, 13.7 GB/s)
-- decode 8 tok in 1.41s (5.66 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.486 | ngram rows 0h/128m | peak 7.4 GB | total 70.7s
--- whole.c512.r2.err
engine ready in 0.8s: expert cache ~20/512 per layer (960 global slots = 2.7 GB), eos [248044, 248046]
-- prefill 7960 tok in 68.88s (115.6 tok/s)
-- prefill split: io 34.13s + scatter 0.34s + compute 34.41s | 173053 records (478.5 GB, 14.0 GB/s)
-- decode 8 tok in 1.57s (5.08 tok/s)
-- expert cache ~20/512 experts per layer, hit rate 0.486 | ngram rows 0h/128m | peak 7.3 GB | total 70.5s
```
