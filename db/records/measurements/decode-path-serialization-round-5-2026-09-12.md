---
type: measurement
id: 01m2cgtwk6m39a08z2mp075364
created: 2026-09-13T04:36:30.438474+00:00
updated: 2026-09-13T04:36:30.438474+00:00
summary: 'Router weight cache under prefetch: 1.017 over twelve pairs, ten above 1, approximate interval 1.003 to 1.031, exact; adding router top-k removes the gain; the cache carries into step 6'
date: 2026-09-12
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Exploration sweep on four prompts at 256 outputs over four rounds; eight of 48 cells excluded for host swap-outs; the cache qualifies for the combination; no public claim.
order: '1300'
runs: '[[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-5]]'
title: 'Decode path serialization, round 5: the router weight cache holds at 1.017 over twelve pairs'
status: measured
---
**Outcome: the router weight cache survives a powered re-test at 1.017 over twelve pairs, ten above 1, approximate 95% interval 1.003 to 1.031, with exact outputs; adding the specialized router top-k removes the gain.** Reference: the B0 prefetch setting. Four prompts (r0005, r0206, r0096 and r0074) over four rounds; eight of 48 cells were excluded for host swap-outs, leaving twelve clean pairs per configuration.

| configuration | paired ratio | pairs above 1 | range | approximate 95% interval | router cache |
| --- | ---: | ---: | --- | --- | ---: |
| router weight cache | 1.017 | 10 of 12 | 0.982 to 1.056 | 1.003 to 1.031 | 256.9 MB |
| cache plus router top-k | 1.002 | 7 of 12 | 0.945 to 1.058 | 0.984 to 1.020 | 256.9 MB |

**What it does.** The router matmul promotes each BF16 router to FP32 on every call. The cache keeps a pre-materialized FP32 copy of every router, 256.9 MB, so the routing of each layer skips that conversion. Demand records are unchanged (17,873 against 17,877), so the gain is compute, not reads. Round 1 saw 1.010 on three pairs among nine flags whose paired mean was 1.0012 ([[records/measurements/decode-path-serialization-round-1-2026-09-12]]); at twelve pairs the effect holds, small but clear of zero.

**Combination rule.** The cache qualifies (twelve pairs, paired mean at least 1.01, 83% of pairs above 1) and carries `SLOTSTREAM_OPT_ROUTER_WEIGHTS=1` into step 6. Router top-k does not.

**Limits.** Exploration prompts at 256 outputs; the interval is a normal approximation on log ratios. Swap-outs grew during the round and removed a sixth of the cells. The cache adds 256.9 MB of resident memory. No public claim.

Commands, tables and hashes: [[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-5]].
