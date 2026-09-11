---
type: run
id: 01m28qf2ezh0ghqn1yshrhw2jr
created: 2026-09-11T17:15:25.535292+00:00
updated: 2026-09-11T17:15:55.372016+00:00
summary: Full MTP/vision, governor and context checks pass under the paging-diagnostic policy with real memory ceilings intact.
binary: da9535db71225b9a3308f4feaa4cc7dcb21454bbea4a8d09e2fd93ce3125a50b
captured_at: 2026-09-11
command: check_mtp.py; check_resources.py; Tools/static_gates.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Global paging policy: complete native functional checks'
tool: Source build, static gates and bounded native diagnostics
---
The local source build completed and the full static suite printed STATIC GATES PASS. All affected native paths completed with applications left open: the full original 48-token MTP/vision diagnostic, the full governor shrink/cooldown/regrowth drill, and the 2,048-token context check. The paging rule changed prospectively; numerical/work assertions, explicit budgets and real safety guards remain.

Binary SHA-256: `da9535db71225b9a3308f4feaa4cc7dcb21454bbea4a8d09e2fd93ce3125a50b`. The build identity closes 150 compiled inputs matching the implementation in `0f7aae1`. The later `48d11f2` commit changes capacity guidance and a legacy driver's descriptive contract only.

Exact native results:

```json
{
  "mtp": {
    "lifetime_physical_footprint_peak_bytes": 10349041736,
    "lifetime_rss_peak_bytes": 2751234048,
    "memory_validated": true,
    "physical_footprint_end_bytes": 10349041736,
    "sampled_peak_bytes": 10349041736,
    "samples": 8705,
    "swap_clean": false,
    "swapins_after": 44556911,
    "swapins_before": 44556311,
    "swapouts_after": 78206983,
    "swapouts_before": 78206983,
    "target_gb": 12
  },
  "governor": {
    "ceiling_gb": 13,
    "complete": true,
    "lifetime_physical_footprint_peak_bytes": 11000302952,
    "lifetime_rss_peak_bytes": 3172220928,
    "output_ids": [
      [
        45,
        448,
        11,
        7919,
        11,
        23699,
        83,
        2891
      ],
      [
        45,
        448,
        11,
        7919,
        11,
        23699,
        83,
        2891
      ],
      [
        45,
        448,
        11,
        7919,
        11,
        23699,
        83,
        2891
      ]
    ],
    "physical_footprint_end_bytes": 10007547384,
    "sampled_peak_bytes": 11000302952,
    "samples": 3631,
    "swap_clean": false,
    "swapins_after": 44556943,
    "swapins_before": 44556911,
    "swapouts_after": 78206983,
    "swapouts_before": 78206983,
    "target_gb": 12.554587904
  },
  "context": {
    "passed": true,
    "maximum_observed_bytes": 8519322864,
    "sampled_footprint_bytes": 8480722160,
    "image_preparation_peak_bytes": 0,
    "lifetime_rss_bytes": 2929983488,
    "physical_footprint_end_bytes": 7512755704,
    "lifetime_footprint_peak_bytes": 8519322864,
    "sampling_interval_ms": 20,
    "global_swap_deltas": {
      "generator": {
        "swapins": 0,
        "swapouts": 0
      }
    }
  }
}
```

The MTP outer launch interval separately observed 604 swap-ins and 580 swap-outs. Its native receipt covers a later boundary and records 600 swap-ins and zero swap-outs. These are system counters, not process attribution. The MTP transcript includes actual speculative turn-1 state reuse and the original turn-2 logit bound, previously left incomplete by the paging abort.

No user application or unrelated workload was closed or paused. The three native processes exited normally. Only diagnostic commands enabled memory sampling; no persistent production instrumentation or environment setting changed. No timing qualification or full release-candidate qualification is claimed from these local checks.

[Raw checks and source](../../../artifacts/global-paging-policy-2026-09-11/raw-checks-and-source.tar.gz): 33 members, SHA-256 `26539fdd41456241c3ec922332f461c0e8dc02a2d3da1a4f2395436ceee46ceb`. Every archive member was reconstructed and verified byte-for-byte.
