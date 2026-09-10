---
type: run
id: 01m1wp14d5bxg44197cj5p9sdj
created: 2026-09-07T00:59:27.013445+00:00
updated: 2026-09-07T00:59:27.223702+00:00
summary: 'Capacity campaign remains unrun: current real availability is below the frozen preflight'
binary: 9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Capacity campaign remains unrun: current real availability is below the frozen preflight'
tool: Native Swift diagnostics and Python CLI gates
---
# Capacity preflight remains unmet

After the bounded workspace and plan-only checks, the model lock is free and
no slotstream, slotstream-checks or Swift compiler process is present. Real
reclaimable memory is 21,662,023,680 bytes, below the frozen ordinary 22 GB
capacity target's required 25 GB preflight. Since the previous no-model
control, the global counters have added 73434 swap-ins and38446 swap-outs.
The intervening activity includes only this task's bounded workspace and
plan-only commands; it is not an isolated time interval and identifies no
responsible process. These observations are excluded from performance claims.

No full resource retry, full model verification or P5 capacity run is started.
The machine must first satisfy the existing quiet-resource criteria; no target,
reply requirement, mode, memory guard or swap criterion is changed to admit
this interval. The exact prepared campaign remains unconsumed. Full-window
qualification and release remain open with the public context ceiling65536.

## Frozen build identity

```json
{
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d"
}
```

## capacity-readiness-v215-hold.json

SHA-256 `063d7467b116d0a265779e8ac969f2fe9abb47ddcbecbe91f80647df478d427c`; 2469 bytes.

````text
{
  "captured_unix": 1788742713.937304,
  "model_lock_free": true,
  "native_or_compiler_processes": [],
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 21662023680,
    "swapins": 43902362,
    "swapouts": 77401851,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   971349.\nPages active:                                 768537.\nPages inactive:                               736092.\nPages speculative:                             39094.\nPages throttled:                                   0.\nPages wired down:                             266791.\nPages purgeable:                               24598.\n\"Translation faults\":                    15038954653.\nPages copy-on-write:                       705380401.\nPages zero filled:                       20904928750.\nPages reactivated:                        3458990191.\nPages purged:                               71390967.\nFile-backed pages:                            326198.\nAnonymous pages:                             1217525.\nPages stored in compressor:                  1343522.\nPages occupied by compressor:                 301746.\nDecompressions:                           1165059028.\nCompressions:                             1477359382.\nPageins:                                  7585608497.\nPageouts:                                   11024500.\nSwapins:                                    43902362.\nSwapouts:                                   77401851.\nPages tagged:                                 170442.\nPages tagged resident:                        146474.\nPages tagged compressed:                       23968.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 9592.\nPages tag-storage free:                         1937.\nPages tag-storage non-tag pageable:            86767.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4242624.\nTagged compressions:                        11067669.\nTagged decompressions:                      10235682.\n"
  },
  "ordinary_target_gb": 22,
  "required_preflight_gb": 25,
  "preflight_met": false,
  "since_prior_no_model_control": {
    "swapins": 73434,
    "swapouts": 38446,
    "classification": "intervening bounded workspace/planning activity; no capacity/performance estimate"
  },
  "resource_run_started": false,
  "capacity_run_started": false
}

````
