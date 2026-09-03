---
type: run
id: 01m1jyzxkwex34vah0as9v2fdf
created: 2026-09-03T06:23:40.156608+00:00
updated: 2026-09-03T06:23:50.676637+00:00
summary: 'Decode A/B: pool scatter completion mode and pool read lanes, 30 experts/layer, dev Mac, 2026-09-03'
binary: .build/release/slotstream, local release build of the working tree on top of 270ffcd
captured_at: 2026-09-03
command: slotstream run --prompt 'Write a short paragraph about the ocean.' --max-tokens 96 --greedy --experts-per-layer 30; arms SLOTSTREAM_SCATTER_MODE and SLOTSTREAM_POOL_QUEUE_DEPTH
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode A/B: pool scatter completion mode and pool read lanes, 30 experts/layer, dev Mac, 2026-09-03'
tool: run
---
## Decode A/B: scatter completion mode and pool read lanes

Five interleaved rounds per arm on a quiet machine.

```
# decode A/B: scatter completion mode and pool read lanes, 5 interleaved rounds
# slotstream run --prompt 'Write a short paragraph about the ocean.' --max-tokens 96 --greedy --experts-per-layer 30
# before: SLOTSTREAM_SCATTER_MODE=sync SLOTSTREAM_POOL_QUEUE_DEPTH=12
# after:  SLOTSTREAM_SCATTER_MODE=none SLOTSTREAM_POOL_QUEUE_DEPTH=32

--- after.r1.err
engine ready in 0.8s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.37s (14.6 tok/s)
-- prefill split: io 0.80s + scatter 0.00s + compute 0.56s | 3670 records (10.1 GB, 12.7 GB/s)
-- decode 96 tok in 12.46s (7.71 tok/s)
-- decode split: io 5.60s + scatter 0.07s + compute 6.79s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.8 GB | total 13.8s
--- after.r2.err
engine ready in 0.9s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.35s (14.8 tok/s)
-- prefill split: io 0.80s + scatter 0.00s + compute 0.54s | 3670 records (10.1 GB, 12.7 GB/s)
-- decode 96 tok in 12.46s (7.70 tok/s)
-- decode split: io 5.60s + scatter 0.07s + compute 6.79s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.8 GB | total 13.8s
--- after.r3.err
engine ready in 0.9s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.49s (13.4 tok/s)
-- prefill split: io 0.82s + scatter 0.00s + compute 0.67s | 3670 records (10.1 GB, 12.4 GB/s)
-- decode 96 tok in 12.58s (7.63 tok/s)
-- decode split: io 5.63s + scatter 0.07s + compute 6.88s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.8 GB | total 14.1s
--- after.r4.err
engine ready in 1.0s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.60s (12.5 tok/s)
-- prefill split: io 0.82s + scatter 0.00s + compute 0.78s | 3670 records (10.1 GB, 12.3 GB/s)
-- decode 96 tok in 12.59s (7.62 tok/s)
-- decode split: io 5.66s + scatter 0.07s + compute 6.86s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.8 GB | total 14.2s
--- after.r5.err
engine ready in 1.0s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.74s (11.5 tok/s)
-- prefill split: io 0.84s + scatter 0.00s + compute 0.90s | 3670 records (10.1 GB, 12.1 GB/s)
-- decode 96 tok in 12.91s (7.43 tok/s)
-- decode split: io 5.77s + scatter 0.07s + compute 7.08s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.8 GB | total 14.7s
--- before.r1.err
engine ready in 0.9s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.49s (13.4 tok/s)
-- prefill split: io 0.90s + scatter 0.26s + compute 0.34s | 3670 records (10.1 GB, 11.3 GB/s)
-- decode 96 tok in 13.77s (6.97 tok/s)
-- decode split: io 6.00s + scatter 2.72s + compute 5.05s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.5 GB | total 15.3s
--- before.r2.err
engine ready in 0.8s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.54s (13.0 tok/s)
-- prefill split: io 0.90s + scatter 0.27s + compute 0.37s | 3670 records (10.1 GB, 11.2 GB/s)
-- decode 96 tok in 13.74s (6.99 tok/s)
-- decode split: io 6.00s + scatter 2.68s + compute 5.06s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.5 GB | total 15.3s
--- before.r3.err
engine ready in 0.9s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.61s (12.4 tok/s)
-- prefill split: io 0.93s + scatter 0.29s + compute 0.39s | 3670 records (10.1 GB, 10.9 GB/s)
-- decode 96 tok in 13.84s (6.93 tok/s)
-- decode split: io 6.06s + scatter 2.71s + compute 5.08s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.5 GB | total 15.5s
--- before.r4.err
engine ready in 0.9s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.66s (12.1 tok/s)
-- prefill split: io 0.92s + scatter 0.29s + compute 0.44s | 3670 records (10.1 GB, 11.0 GB/s)
-- decode 96 tok in 13.97s (6.87 tok/s)
-- decode split: io 6.13s + scatter 2.76s + compute 5.08s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.5 GB | total 15.6s
--- before.r5.err
engine ready in 1.0s: expert cache ~30/512 per layer (1440 global slots = 4.0 GB), eos [248044, 248046]
-- prefill 20 tok in 1.67s (12.0 tok/s)
-- prefill split: io 0.92s + scatter 0.28s + compute 0.47s | 3670 records (10.1 GB, 11.1 GB/s)
-- decode 96 tok in 13.89s (6.91 tok/s)
-- decode split: io 6.11s + scatter 2.72s + compute 5.06s | 19386 records
-- expert cache ~30/512 experts per layer, hit rate 0.579 | ngram rows 8h/1528m | peak 7.5 GB | total 15.6s

=== medians ===

arm                   prefill_tps   decode_tps         peak     hit_rate         io_s      read_gb    n
before                     12.400        6.930        7.500        0.579        0.920       10.100    5
after                      13.400        7.630        7.800        0.579        0.820       10.100    5

  after vs before: prefill_tps 1.081x  decode_tps 1.101x  peak 1.040x  hit_rate 1.000x  io_s 0.891x  read_gb 1.000x

  before: 1 distinct output(s) over 5 run(s)
  after: 1 distinct output(s) over 5 run(s)
  after == before output: True
```
