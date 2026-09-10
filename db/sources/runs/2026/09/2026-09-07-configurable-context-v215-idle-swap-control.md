---
type: run
id: 01m1wn296qn279y3ja1prx9h4g
created: 2026-09-07T00:42:36.119302+00:00
updated: 2026-09-07T00:42:36.315833+00:00
summary: A further no-model idle control observes 16 global swap-ins; capacity held
binary: 9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: A further no-model idle control observes 16 global swap-ins; capacity held
tool: Native Swift diagnostics and Python CLI gates
---
# Independent idle control before a resource retry

After V215's clean machine handback and identity/lock checks, a timestamped
83.21061301231384-second interval including a 45-second idle wait observes
16 global swap-ins and zero swap-outs, with no owned model running. Real
reclaimable memory moves from 28,259,762,176 to 28,076,752,896 bytes. These
global counters do not identify a responsible process. This control follows
the separately preserved V202 elastic interruption and two idle controls.

The interval is excluded from timing and capacity evidence. No full resource
retry or P5 measurement follows it. No unrelated process was stopped, no
memory pressure was induced, and no zero-swap requirement was relaxed.

## Frozen build identity

```json
{
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d"
}
```

## quiet-v215-before-resource.json

SHA-256 `ab0f26f597bea5b415601b4af625cd85e6c068278783392faeab381ae1e9b654`; 4122 bytes.

````text
{
  "started_unix": 1788741005.907348,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28259762176,
    "swapins": 43828912,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316267.\nPages active:                                 825679.\nPages inactive:                              1300283.\nPages speculative:                             23655.\nPages throttled:                                   0.\nPages wired down:                             208114.\nPages purgeable:                               15067.\n\"Translation faults\":                    15027501849.\nPages copy-on-write:                       704258533.\nPages zero filled:                       20897781514.\nPages reactivated:                        3458923185.\nPages purged:                               71215930.\nFile-backed pages:                           1393505.\nAnonymous pages:                              756112.\nPages stored in compressor:                  1683651.\nPages occupied by compressor:                 411068.\nDecompressions:                           1164763318.\nCompressions:                             1477345025.\nPageins:                                  7405460274.\nPageouts:                                   11017813.\nSwapins:                                    43828912.\nSwapouts:                                   77363405.\nPages tagged:                                 154778.\nPages tagged resident:                        119481.\nPages tagged compressed:                       35297.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                          431.\nPages tag-storage non-tag pageable:            91076.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6303808.\nTagged compressions:                        11067415.\nTagged decompressions:                      10224275.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28076752896,
    "swapins": 43828928,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   317800.\nPages active:                                 823064.\nPages inactive:                              1300316.\nPages speculative:                             23855.\nPages throttled:                                   0.\nPages wired down:                             223062.\nPages purgeable:                                1894.\n\"Translation faults\":                    15027741742.\nPages copy-on-write:                       704270032.\nPages zero filled:                       20897955740.\nPages reactivated:                        3458923663.\nPages purged:                               71216999.\nFile-backed pages:                           1393975.\nAnonymous pages:                              753260.\nPages stored in compressor:                  1651090.\nPages occupied by compressor:                 396932.\nDecompressions:                           1164795316.\nCompressions:                             1477345025.\nPageins:                                  7405460507.\nPageouts:                                   11017813.\nSwapins:                                    43828928.\nSwapouts:                                   77363405.\nPages tagged:                                 154736.\nPages tagged resident:                        119463.\nPages tagged compressed:                       35273.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                          550.\nPages tag-storage non-tag pageable:            90957.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6302720.\nTagged compressions:                        11067415.\nTagged decompressions:                      10224292.\n"
  },
  "ended_unix": 1788741089.117961
}

````
