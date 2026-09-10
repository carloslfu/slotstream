---
type: run
id: 01m1wqfaxs69vbg42p5r6cmxpj
created: 2026-09-07T01:24:41.017986+00:00
updated: 2026-09-07T01:24:41.284183+00:00
summary: Readiness after the bounded component handback still misses the frozen P5 preflight
binary: 9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Readiness after the bounded component handback still misses the frozen P5 preflight
tool: Native Swift diagnostics and Python CLI gates
---
# Readiness after the component handback

The separately authorized component interval returned cleanly. A fresh
snapshot has a free model lock and no slotstream, slotstream-checks or Swift
compiler process, but only15,349,792,768bytes real reclaimable memory, below
the frozen ordinary P5 profile's25GB prerequisite. This is a readiness
snapshot, not a quiet timing interval or a capacity result. No full resource
retry, model payload verification or P5 profile was launched. The exact eight
prepared profiles and the public65536/default32768 limits remain unchanged.

## Frozen build identity

```json
{
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d"
}
```

## readiness-after-v207.json

SHA-256 `8f7997c83d492c1c1de6608e7ac62158d5d02316c84b4cb4921bb784a63327f6`; 2218 bytes.

````text
{
  "captured_unix": 1788744024.345397,
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 15349792768,
    "swapins": 43935576,
    "swapouts": 77401851,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   503181.\nPages active:                                1009107.\nPages inactive:                               937996.\nPages speculative:                             80683.\nPages throttled:                                   0.\nPages wired down:                             282456.\nPages purgeable:                               22421.\n\"Translation faults\":                    15057293834.\nPages copy-on-write:                       706686532.\nPages zero filled:                       20918090185.\nPages reactivated:                        3459005129.\nPages purged:                               71414847.\nFile-backed pages:                            411275.\nAnonymous pages:                             1616511.\nPages stored in compressor:                  1160567.\nPages occupied by compressor:                 265694.\nDecompressions:                           1165173567.\nCompressions:                             1477359382.\nPageins:                                  7585826717.\nPageouts:                                   11024500.\nSwapins:                                    43935576.\nSwapouts:                                   77401851.\nPages tagged:                                 178436.\nPages tagged resident:                        160160.\nPages tagged compressed:                       18276.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 9547.\nPages tag-storage free:                         6476.\nPages tag-storage non-tag pageable:            82273.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3161088.\nTagged compressions:                        11067669.\nTagged decompressions:                      10241373.\n"
  },
  "model_lock_free": true,
  "native_or_compiler_processes": [],
  "required_reclaimable_gb": 25,
  "preflight_met": false,
  "capacity_run_started": false
}

````
