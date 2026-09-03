---
type: run
id: 01m1jyy43pc98v0r51qjara6q9
created: 2026-09-03T06:22:41.270135+00:00
updated: 2026-09-03T06:22:56.585960+00:00
summary: 'AttnProbe: query-blocked QSA attention, exactness and transient by shape, dev Mac, 2026-09-03'
binary: swift-probe/.build/release/AttnProbe, local release build against mlx-swift 0.31.6 (MLX 0.31.1), no model weights
captured_at: 2026-09-03
command: AttnProbe --rounds 5 --budget-gb 5.5; AttnProbe --rounds 3 --skip-whole --blocks 1024,512,256 --config 4096:32768
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'AttnProbe: query-blocked QSA attention, exactness and transient by shape, dev Mac, 2026-09-03'
tool: AttnProbe
---
## AttnProbe transcript

```
QSA attention transient probe (MLX 0.31.1)
heads 24q/2kv x 256, rounds 5, budget 5.5 GB

── pass 1024 over context 1024 (base 0, mask: causal) ──
   variant             ms     peak GB      vs whole    rel diff
   whole              1.8       0.104             -           -
   blk 512            1.5       0.104         1.20x    0.00e+00
   blk 256            1.3       0.097         1.35x    0.00e+00
   blk 128            1.3       0.097         1.35x    0.00e+00
   blk 512 ev         1.6       0.072         1.10x    0.00e+00
   blk 256 ev         1.8       0.056         1.02x    0.00e+00
   blk 128 ev         2.6       0.052         0.71x    0.00e+00
   one score matrix at this shape: 0.05 GB

── pass 1024 over context 2048 (base 1024, mask: causal) ──
   variant             ms     peak GB      vs whole    rel diff
   whole              3.4       0.157             -           -
   blk 512            3.1       0.157         1.08x    0.00e+00
   blk 256            3.0       0.151         1.14x    0.00e+00
   blk 128            3.0       0.147         1.12x    0.00e+00
   blk 512 ev         3.3       0.100         1.02x    0.00e+00
   blk 256 ev         3.2       0.071         1.07x    0.00e+00
   blk 128 ev         3.9       0.056         0.86x    0.00e+00
   one score matrix at this shape: 0.10 GB

── pass 2048 over context 2048 (base 0, mask: causal) ──
   variant             ms     peak GB      vs whole    rel diff
   whole              6.8       0.310             -           -
   blk 1024           5.3       0.284         1.29x    0.00e+00
   blk 512            4.7       0.259         1.47x    0.00e+00
   blk 256            4.3       0.246         1.58x    0.00e+00
   blk 128            4.5       0.239         1.53x    0.00e+00
   blk 1024 ev        5.6       0.195         1.22x    0.00e+00
   blk 512 ev         5.3       0.137         1.30x    0.00e+00
   blk 256 ev         5.4       0.109         1.26x    0.00e+00
   blk 128 ev         7.2       0.105         0.95x    0.00e+00
   one score matrix at this shape: 0.20 GB

── pass 1024 over context 8016 (base 6992, mask: indexer keep-set) ──
   variant             ms     peak GB      vs whole    rel diff
   whole             12.6       0.469             -           -
   blk 512           12.5       0.469         1.01x    0.00e+00
   blk 256           13.0       0.463         0.97x    0.00e+00
   blk 128           13.3       0.453         0.95x    0.00e+00
   blk 512 ev        12.9       0.266         0.97x    0.00e+00
   blk 256 ev        13.4       0.164         0.94x    0.00e+00
   blk 128 ev        14.7       0.113         0.86x    0.00e+00
   one score matrix at this shape: 0.39 GB

── pass 2048 over context 8016 (base 5968, mask: indexer keep-set) ──
   variant             ms     peak GB      vs whole    rel diff
   whole             26.8       0.922             -           -
   blk 1024          24.0       0.896         1.11x    0.00e+00
   blk 512           23.6       0.846         1.13x    0.00e+00
   blk 256           23.6       0.833         1.13x    0.00e+00
   blk 128           25.0       0.827         1.07x    0.00e+00
   blk 1024 ev       24.8       0.515         1.08x    0.00e+00
   blk 512 ev        24.6       0.312         1.09x    0.00e+00
   blk 256 ev        25.4       0.210         1.06x    0.00e+00
   blk 128 ev        28.0       0.159         0.96x    0.00e+00
   one score matrix at this shape: 0.79 GB

── pass 4096 over context 8016 (base 3920, mask: indexer keep-set) ──
   variant             ms     peak GB      vs whole    rel diff
   whole             54.7       1.827             -           -
   blk 1024          41.9       1.525         1.30x    0.00e+00
   blk 512           40.6       1.474         1.35x    0.00e+00
   blk 256           40.4       1.449         1.35x    0.00e+00
   blk 128           41.2       1.113         1.33x    8.50e-04
   blk 1024 ev       43.0       0.607         1.27x    0.00e+00
   blk 512 ev        42.9       0.404         1.28x    0.00e+00
   blk 256 ev        44.0       0.302         1.24x    0.00e+00
   blk 128 ev        50.2       0.251         1.09x    8.50e-04
   one score matrix at this shape: 1.58 GB

QSA attention transient probe (MLX 0.31.1)
heads 24q/2kv x 256, rounds 3, budget 6.0 GB

── pass 4096 over context 32768 (base 28672, mask: indexer keep-set) ──
   variant             ms     peak GB      vs whole    rel diff
   blk 1024         228.2       6.543             -           -
   blk 512          228.7       6.493         1.00x    0.00e+00
   blk 256          232.9       6.402         0.98x    0.00e+00
   blk 1024 ev      230.1       1.976         0.99x    0.00e+00
   blk 512 ev       226.7       1.164         1.01x    0.00e+00
   blk 256 ev       220.1       0.758         1.04x    0.00e+00
   one score matrix at this shape: 6.44 GB

```
