---
type: run
id: 01m1whtc92bw84x95r4q8rwyw3
created: 2026-09-06T23:45:51.388082+00:00
updated: 2026-09-06T23:45:51.796655+00:00
summary: V202 full governor drill stops on global swap-ins; idle controls also observe swap-ins
binary: b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: V202 full governor drill stops on global swap-ins; idle controls also observe swap-ins
tool: Native Swift diagnostics and Python CLI gates
---
# Full resource interval excluded

The complete shared V202 correctness queue passes all 19 groups, including
both 80-assertion native governor variants and all 32 new pure physical-fit
checks. Its exact original evidence is retained at
[[sources/runs/2026/09/2026-09-06-optimization-merged-correctness-v202]].

The following full resource battery stops during its first elastic drill,
before the full MTP/image diagnostic starts. The original shrink/grow
deadbands use the declared 13 GB diagnostic ceiling, with a 16 GB preflight
and a derived target of 12.554587904 GB. The first answer and eight token IDs
match the original expected output. After the 4.8 to 2.2 GB pool shrink,
the diagnostic's memory-interval guard observes eight global swap-ins and
zero swap-outs, and stops before a second completed answer. Its sampled
physical footprint peak is 8,512,638,432 bytes over 229 samples, below the
declared ceiling. This is an excluded resource interval, not proof of full
drill completion or a measured memory overrun. No guard is relaxed.

Two controls with no owned model running also observe swap-ins: the first
includes a 45-second idle wait and observes 48 pages; its initial timestamp
was not recorded, so no exact elapsed rate is claimed. A later timestamped
122.53702783584595-second interval after the other task's clean handback
observes 32 swap-ins and zero swap-outs. This interval includes only bounded
workspace/planner work. These are global counters and do not identify the
responsible process. No app was killed and no memory pressure was induced.

Full resource, C19 capacity and P5 acceptance remain open. All timings here
are excluded from performance claims. Public context remains 65536 and the
default remains 32768. The complete failed raw diagnostic and VM evidence
are preserved below; only local path strings in manifests are projected.

## Frozen build identity

```json
{
  "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664"
}
```

## v202-public/full-resources-v202/manifest.json

SHA-256 `83d28060334ff8b6a59666b0c3b6a49cb0d3fa2d9aeaedb1739bcb1d6a3ff7fb`; 5665 bytes.

````text
{
  "projection": "Exact text with local workspace/model paths replaced by role labels. Original bytes remain in the local run; their identity is recorded here.",
  "original_sha256": "8dddcd708387fdce406c6951935467a49168a281b9a4e2afcbfc2e279069b4f2",
  "original_bytes": 5181,
  "text": "{\n  \"passed\": false,\n  \"build_identity\": {\n    \"binary_sha256\": \"b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf\",\n    \"metallib_sha256\": \"198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597\",\n    \"source_archive_sha256\": \"38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664\"\n  },\n  \"classification\": \"full resource and correctness gates; exact internal and external memory/swap checks; no speed comparison\",\n  \"cases\": [\n    {\n      \"name\": \"elastic-drill\",\n      \"command\": [\n        \"<shared-worktree>/.build/optimization/merged-context-build-v202/candidate/slotstream\",\n        \"elastic-drill\",\n        \"--slots\",\n        \"1000\",\n        \"--max-memory-gb\",\n        \"13\"\n      ],\n      \"passed\": false,\n      \"before\": {\n        \"page_bytes\": 16384,\n        \"reclaimable_bytes\": 28217344000,\n        \"swapins\": 43826264,\n        \"swapouts\": 77363405,\n        \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   329600.\\nPages active:                                1048111.\\nPages inactive:                               977241.\\nPages speculative:                             98197.\\nPages throttled:                                   0.\\nPages wired down:                             221686.\\nPages purgeable:                                1591.\\n\\\"Translation faults\\\":                    15002348826.\\nPages copy-on-write:                       702680550.\\nPages zero filled:                       20850450144.\\nPages reactivated:                        3411045605.\\nPages purged:                               71008182.\\nFile-backed pages:                           1391059.\\nAnonymous pages:                              732490.\\nPages stored in compressor:                  1666103.\\nPages occupied by compressor:                 409288.\\nDecompressions:                           1158904354.\\nCompressions:                             1471158264.\\nPageins:                                  7299699763.\\nPageouts:                                   11008252.\\nSwapins:                                    43826264.\\nSwapouts:                                   77363405.\\nPages tagged:                                 153901.\\nPages tagged resident:                        116383.\\nPages tagged compressed:                       37518.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6790.\\nPages tag-storage free:                         1575.\\nPages tag-storage non-tag pageable:            89931.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6743360.\\nTagged compressions:                        11014913.\\nTagged decompressions:                      10172494.\\n\"\n      },\n      \"exit\": 1,\n      \"after\": {\n        \"page_bytes\": 16384,\n        \"reclaimable_bytes\": 29025517568,\n        \"swapins\": 43826272,\n        \"swapouts\": 77363405,\n        \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   532856.\\nPages active:                                 943233.\\nPages inactive:                               789007.\\nPages speculative:                            153925.\\nPages throttled:                                   0.\\nPages wired down:                             223299.\\nPages purgeable:                                1607.\\n\\\"Translation faults\\\":                    15002586184.\\nPages copy-on-write:                       702681894.\\nPages zero filled:                       20851129161.\\nPages reactivated:                        3411175520.\\nPages purged:                               71008194.\\nFile-backed pages:                           1237114.\\nAnonymous pages:                              649051.\\nPages stored in compressor:                  1734657.\\nPages occupied by compressor:                 443501.\\nDecompressions:                           1158905121.\\nCompressions:                             1471227650.\\nPageins:                                  7299709363.\\nPageouts:                                   11008341.\\nSwapins:                                    43826272.\\nSwapouts:                                   77363405.\\nPages tagged:                                 153691.\\nPages tagged resident:                        115219.\\nPages tagged compressed:                       38472.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6790.\\nPages tag-storage free:                          315.\\nPages tag-storage non-tag pageable:            91191.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6919232.\\nTagged compressions:                        11015870.\\nTagged decompressions:                      10172497.\\n\"\n      },\n      \"external_swap_activity\": true,\n      \"stdout.txt_sha256\": \"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855\",\n      \"stderr.txt_sha256\": \"e0f31db257fff2d52b6854f8578f1b4b9d00e0b0891d5bf23197536fe1328621\"\n    }\n  ],\n  \"error\": \"AssertionError: \",\n  \"seconds\": 4.655466166\n}\n"
}

````

## v202-public/full-resources-v202/elastic-drill/manifest.json

SHA-256 `f51e825f970cf245d9eff3928bac10c6b8bc6f06a8d9817d038b9d30c0892372`; 4976 bytes.

````text
{
  "projection": "Exact text with local workspace/model paths replaced by role labels. Original bytes remain in the local run; their identity is recorded here.",
  "original_sha256": "42808e8f2283e2e950aab8d91e58cd14e8e51774e2c2338677af179ba2ed2662",
  "original_bytes": 4533,
  "text": "{\n  \"name\": \"elastic-drill\",\n  \"command\": [\n    \"<shared-worktree>/.build/optimization/merged-context-build-v202/candidate/slotstream\",\n    \"elastic-drill\",\n    \"--slots\",\n    \"1000\",\n    \"--max-memory-gb\",\n    \"13\"\n  ],\n  \"passed\": false,\n  \"before\": {\n    \"page_bytes\": 16384,\n    \"reclaimable_bytes\": 28217344000,\n    \"swapins\": 43826264,\n    \"swapouts\": 77363405,\n    \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   329600.\\nPages active:                                1048111.\\nPages inactive:                               977241.\\nPages speculative:                             98197.\\nPages throttled:                                   0.\\nPages wired down:                             221686.\\nPages purgeable:                                1591.\\n\\\"Translation faults\\\":                    15002348826.\\nPages copy-on-write:                       702680550.\\nPages zero filled:                       20850450144.\\nPages reactivated:                        3411045605.\\nPages purged:                               71008182.\\nFile-backed pages:                           1391059.\\nAnonymous pages:                              732490.\\nPages stored in compressor:                  1666103.\\nPages occupied by compressor:                 409288.\\nDecompressions:                           1158904354.\\nCompressions:                             1471158264.\\nPageins:                                  7299699763.\\nPageouts:                                   11008252.\\nSwapins:                                    43826264.\\nSwapouts:                                   77363405.\\nPages tagged:                                 153901.\\nPages tagged resident:                        116383.\\nPages tagged compressed:                       37518.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6790.\\nPages tag-storage free:                         1575.\\nPages tag-storage non-tag pageable:            89931.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6743360.\\nTagged compressions:                        11014913.\\nTagged decompressions:                      10172494.\\n\"\n  },\n  \"exit\": 1,\n  \"after\": {\n    \"page_bytes\": 16384,\n    \"reclaimable_bytes\": 29025517568,\n    \"swapins\": 43826272,\n    \"swapouts\": 77363405,\n    \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   532856.\\nPages active:                                 943233.\\nPages inactive:                               789007.\\nPages speculative:                            153925.\\nPages throttled:                                   0.\\nPages wired down:                             223299.\\nPages purgeable:                                1607.\\n\\\"Translation faults\\\":                    15002586184.\\nPages copy-on-write:                       702681894.\\nPages zero filled:                       20851129161.\\nPages reactivated:                        3411175520.\\nPages purged:                               71008194.\\nFile-backed pages:                           1237114.\\nAnonymous pages:                              649051.\\nPages stored in compressor:                  1734657.\\nPages occupied by compressor:                 443501.\\nDecompressions:                           1158905121.\\nCompressions:                             1471227650.\\nPageins:                                  7299709363.\\nPageouts:                                   11008341.\\nSwapins:                                    43826272.\\nSwapouts:                                   77363405.\\nPages tagged:                                 153691.\\nPages tagged resident:                        115219.\\nPages tagged compressed:                       38472.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6790.\\nPages tag-storage free:                          315.\\nPages tag-storage non-tag pageable:            91191.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6919232.\\nTagged compressions:                        11015870.\\nTagged decompressions:                      10172497.\\n\"\n  },\n  \"external_swap_activity\": true,\n  \"stdout.txt_sha256\": \"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855\",\n  \"stderr.txt_sha256\": \"e0f31db257fff2d52b6854f8578f1b4b9d00e0b0891d5bf23197536fe1328621\"\n}\n"
}

````

## full-resources-v202/elastic-drill/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## full-resources-v202/elastic-drill/stderr.txt

SHA-256 `e0f31db257fff2d52b6854f8578f1b4b9d00e0b0891d5bf23197536fe1328621`; 784 bytes.

````text
engine ready in 0.9s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 29.8 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_rss_peak_bytes":3532013568,"output_ids":[[45,448,11,7919,11,23699,83,2891],[]],"physical_footprint_end_bytes":5810097608,"sampled_peak_bytes":8512638432,"samples":229,"swapins_after":43826272,"swapins_before":43826264,"swapouts_after":77363405,"swapouts_before":77363405,"target_gb":12.554587904}
Error: elastic-drill memory interval is unavailable or contains swap activity

````

## resource-quiet-baseline-v202.json

SHA-256 `1174a36a5a1e72aab132e8a033aeed9f98034c802005509e19daa515ebc3be14`; 4149 bytes.

````text
{
  "initial": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28369846272,
    "swapins": 43826292,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   485532.\nPages active:                                 976653.\nPages inactive:                               807653.\nPages speculative:                            167234.\nPages throttled:                                   0.\nPages wired down:                             223637.\nPages purgeable:                                2078.\n\"Translation faults\":                    15003094896.\nPages copy-on-write:                       702709332.\nPages zero filled:                       20851532394.\nPages reactivated:                        3411176482.\nPages purged:                               71009908.\nFile-backed pages:                           1243948.\nAnonymous pages:                              707592.\nPages stored in compressor:                  1696123.\nPages occupied by compressor:                 424346.\nDecompressions:                           1158941645.\nCompressions:                             1471227650.\nPageins:                                  7299713190.\nPageouts:                                   11008341.\nSwapins:                                    43826292.\nSwapouts:                                   77363405.\nPages tagged:                                 156675.\nPages tagged resident:                        120371.\nPages tagged compressed:                       36304.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6790.\nPages tag-storage free:                          701.\nPages tag-storage non-tag pageable:            90805.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6492288.\nTagged compressions:                        11015870.\nTagged decompressions:                      10174656.\n"
  },
  "samples": [
    {
      "unix_seconds": 1788736977.9349408,
      "vm": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28153118720,
        "swapins": 43826340,
        "swapouts": 77363405,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   472267.\nPages active:                                 996508.\nPages inactive:                               821016.\nPages speculative:                            178207.\nPages throttled:                                   0.\nPages wired down:                             221618.\nPages purgeable:                                2078.\n\"Translation faults\":                    15003368146.\nPages copy-on-write:                       702721473.\nPages zero filled:                       20851693427.\nPages reactivated:                        3411176944.\nPages purged:                               71010678.\nFile-backed pages:                           1243985.\nAnonymous pages:                              751746.\nPages stored in compressor:                  1640602.\nPages occupied by compressor:                 394673.\nDecompressions:                           1158996499.\nCompressions:                             1471227650.\nPageins:                                  7299713332.\nPageouts:                                   11008341.\nSwapins:                                    43826340.\nSwapouts:                                   77363405.\nPages tagged:                                 154164.\nPages tagged resident:                        117924.\nPages tagged compressed:                       36240.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6790.\nPages tag-storage free:                         1412.\nPages tag-storage non-tag pageable:            90094.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6483136.\nTagged compressions:                        11015870.\nTagged decompressions:                      10174716.\n"
      }
    }
  ]
}

````

## quiet-post-indexer-v202.json

SHA-256 `d55976bf5a12afafc25cfaed286d593821bc50efda3ee9a6214805b34a56bbf5`; 4123 bytes.

````text
{
  "started_unix": 1788738112.8836532,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28036300800,
    "swapins": 43826456,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   303919.\nPages active:                                1072855.\nPages inactive:                               691092.\nPages speculative:                            380118.\nPages throttled:                                   0.\nPages wired down:                             222746.\nPages purgeable:                                5664.\n\"Translation faults\":                    15008585058.\nPages copy-on-write:                       703000813.\nPages zero filled:                       20858794275.\nPages reactivated:                        3421850918.\nPages purged:                               71057458.\nFile-backed pages:                           1401617.\nAnonymous pages:                              742448.\nPages stored in compressor:                  1658471.\nPages occupied by compressor:                 411036.\nDecompressions:                           1160691437.\nCompressions:                             1473004379.\nPageins:                                  7315777019.\nPageouts:                                   11009110.\nSwapins:                                    43826456.\nSwapouts:                                   77363405.\nPages tagged:                                 155528.\nPages tagged resident:                        119613.\nPages tagged compressed:                       35915.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         3862.\nPages tag-storage non-tag pageable:            87645.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6408128.\nTagged compressions:                        11029320.\nTagged decompressions:                      10187529.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27393474560,
    "swapins": 43826488,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   178201.\nPages active:                                1135482.\nPages inactive:                               735036.\nPages speculative:                            412703.\nPages throttled:                                   0.\nPages wired down:                             222833.\nPages purgeable:                                6395.\n\"Translation faults\":                    15009278035.\nPages copy-on-write:                       703043830.\nPages zero filled:                       20859272570.\nPages reactivated:                        3421851972.\nPages purged:                               71059070.\nFile-backed pages:                           1487369.\nAnonymous pages:                              795852.\nPages stored in compressor:                  1632227.\nPages occupied by compressor:                 397635.\nDecompressions:                           1160717453.\nCompressions:                             1473004379.\nPageins:                                  7315816400.\nPageouts:                                   11009110.\nSwapins:                                    43826488.\nSwapouts:                                   77363405.\nPages tagged:                                 157708.\nPages tagged resident:                        123505.\nPages tagged compressed:                       34203.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6794.\nPages tag-storage free:                         4083.\nPages tag-storage non-tag pageable:            87419.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6154048.\nTagged compressions:                        11029320.\nTagged decompressions:                      10189104.\n"
  },
  "ended_unix": 1788738235.420681
}

````
