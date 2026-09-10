---
type: run
id: 01m1x7hze2d81ww7t9nrhrjj9d
created: 2026-09-07T06:05:44.770883+00:00
updated: 2026-09-07T06:05:45.006785+00:00
summary: Combined candidate passes sampler oracle and real local installer transitions
binary: V255 candidate701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64; per-file exact bindings retained
captured_at: 2026-09-07
command: SLOTSTREAM_TEST_BINARY=V255 bash Tools/sampler_gates.sh; bash Tools/installer_gates.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Combined candidate passes sampler oracle and real local installer transitions
tool: python3
---
# Combined candidate passes sampler oracle and real local installer transitions

V261 executes the selected V255 executable through all17sampler/NumPy/governor checks, including26governor branches, and through the real install.sh local-fixture transitions. Fresh install, identical reinstall, bad-checksum rejection without activation change, exact binary/Metal/version equality and legacy-directory rollback preservation pass. No model is loaded and no user installation is modified. This is actual local artifact-transition and sampler correctness, not full installed model/client acceptance, release publication, performance or memory capacity qualification.

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/installer/manifest.json

SHA-256 `e881e9f45254cf3748a5bda6981bb3c01737515e7fbd18a75a6c3825038b8d12`; 299 bytes.

````text
{
  "name": "installer",
  "passed": true,
  "command": [
    "bash",
    "Tools/installer_gates.sh"
  ],
  "exit_code": 0,
  "stdout_sha256": "3e55708b822179279fc467f0bef47e36f2d3bbdab3eaf2ad84f32da0c034b8af",
  "stderr_sha256": "b6405a956b61a39bf142c7b1ea6299b4c8b49d70c7277e3f2da53f73f1b2f26f"
}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/installer/memory.json

SHA-256 `50078a8714ce94d2ed43fcb76d8e1eaf6b3de908a3e0f577225bb3420de6e5c5`; 12426 bytes.

````text
{
  "command": [
    "bash",
    "Tools/installer_gates.sh"
  ],
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 5000000000,
    "maximum_owned_rss_bytes": 1500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 120,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12836667392,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   136325.\nPages active:                                 952527.\nPages inactive:                               931946.\nPages speculative:                             19206.\nPages throttled:                                   0.\nPages wired down:                             260159.\nPages purgeable:                               12058.\n\"Translation faults\":                    15319575738.\nPages copy-on-write:                       728022378.\nPages zero filled:                       21079997753.\nPages reactivated:                        3466572733.\nPages purged:                               72003240.\nFile-backed pages:                            635105.\nAnonymous pages:                             1268574.\nPages stored in compressor:                  1832740.\nPages occupied by compressor:                 785226.\nDecompressions:                           1170438822.\nCompressions:                             1484844823.\nPageins:                                  7613332979.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168055.\nPages tagged resident:                        124261.\nPages tagged compressed:                       43794.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          169.\nPages tag-storage non-tag pageable:            90956.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7067264.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344513.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0013959169999999688,
      "owned_rss_bytes": 3391488,
      "owned_process_count": 2,
      "reclaimable_bytes": 12836159488,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.22815450000000004,
      "owned_rss_bytes": 5947392,
      "owned_process_count": 2,
      "reclaimable_bytes": 12832997376,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.45378000000000007,
      "owned_rss_bytes": 5947392,
      "owned_process_count": 2,
      "reclaimable_bytes": 12836356096,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.6795712919999999,
      "owned_rss_bytes": 5963776,
      "owned_process_count": 2,
      "reclaimable_bytes": 12763676672,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.904671542,
      "owned_rss_bytes": 5963776,
      "owned_process_count": 2,
      "reclaimable_bytes": 12761284608,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.1306209579999997,
      "owned_rss_bytes": 5963776,
      "owned_process_count": 2,
      "reclaimable_bytes": 12758614016,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.356239875,
      "owned_rss_bytes": 5963776,
      "owned_process_count": 2,
      "reclaimable_bytes": 12759744512,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.5823903329999998,
      "owned_rss_bytes": 5963776,
      "owned_process_count": 2,
      "reclaimable_bytes": 12753600512,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.807975833,
      "owned_rss_bytes": 5963776,
      "owned_process_count": 2,
      "reclaimable_bytes": 13104119808,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.0347130419999995,
      "owned_rss_bytes": 11059200,
      "owned_process_count": 3,
      "reclaimable_bytes": 13098074112,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.2604462919999997,
      "owned_rss_bytes": 8028160,
      "owned_process_count": 3,
      "reclaimable_bytes": 13102628864,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.48613125,
      "owned_rss_bytes": 4571136,
      "owned_process_count": 3,
      "reclaimable_bytes": 12918734848,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.7124680829999996,
      "owned_rss_bytes": 4571136,
      "owned_process_count": 3,
      "reclaimable_bytes": 12923502592,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.9612069169999997,
      "owned_rss_bytes": 4571136,
      "owned_process_count": 3,
      "reclaimable_bytes": 12890750976,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.192444542,
      "owned_rss_bytes": 3768320,
      "owned_process_count": 2,
      "reclaimable_bytes": 12900188160,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.418114917,
      "owned_rss_bytes": 14794752,
      "owned_process_count": 5,
      "reclaimable_bytes": 12891602944,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.643922125,
      "owned_rss_bytes": 4620288,
      "owned_process_count": 3,
      "reclaimable_bytes": 13070385152,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.869633375,
      "owned_rss_bytes": 4620288,
      "owned_process_count": 3,
      "reclaimable_bytes": 13077069824,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.09904575,
      "owned_rss_bytes": 17350656,
      "owned_process_count": 3,
      "reclaimable_bytes": 13083836416,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.327629957999999,
      "owned_rss_bytes": 9519104,
      "owned_process_count": 2,
      "reclaimable_bytes": 12895944704,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.553335292,
      "owned_rss_bytes": 14876672,
      "owned_process_count": 5,
      "reclaimable_bytes": 12889915392,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.779059542000001,
      "owned_rss_bytes": 15024128,
      "owned_process_count": 2,
      "reclaimable_bytes": 12897894400,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.003341624999999,
      "owned_rss_bytes": 14893056,
      "owned_process_count": 5,
      "reclaimable_bytes": 12889604096,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.2293108749999995,
      "owned_rss_bytes": 4734976,
      "owned_process_count": 3,
      "reclaimable_bytes": 12778668032,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.455544375000001,
      "owned_rss_bytes": 4734976,
      "owned_process_count": 3,
      "reclaimable_bytes": 12773638144,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.681055333,
      "owned_rss_bytes": 18055168,
      "owned_process_count": 2,
      "reclaimable_bytes": 12775800832,
      "swapins": 44109994,
      "swapouts": 77525566
    }
  ],
  "passed": true,
  "classification": "Selected candidate weights-free sampler/NumPy/governor and real local installer transitions only; no model or performance/resource qualification",
  "child_pid": 51496,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12754829312,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   132181.\nPages active:                                 947288.\nPages inactive:                               939607.\nPages speculative:                             22914.\nPages throttled:                                   0.\nPages wired down:                             258367.\nPages purgeable:                                6946.\n\"Translation faults\":                    15319904312.\nPages copy-on-write:                       728063054.\nPages zero filled:                       21080069864.\nPages reactivated:                        3466572747.\nPages purged:                               72003368.\nFile-backed pages:                            639366.\nAnonymous pages:                             1270443.\nPages stored in compressor:                  1831759.\nPages occupied by compressor:                 784938.\nDecompressions:                           1170439803.\nCompressions:                             1484844823.\nPageins:                                  7613344925.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168059.\nPages tagged resident:                        124373.\nPages tagged compressed:                       43686.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          127.\nPages tag-storage non-tag pageable:            90998.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051392.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344621.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    51496
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 5.963830375000001,
  "child_exit_code": 0,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12727894016,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   131487.\nPages active:                                 945614.\nPages inactive:                               938166.\nPages speculative:                             23508.\nPages throttled:                                   0.\nPages wired down:                             261824.\nPages purgeable:                                5402.\n\"Translation faults\":                    15319910665.\nPages copy-on-write:                       728063825.\nPages zero filled:                       21080073969.\nPages reactivated:                        3466572747.\nPages purged:                               72003368.\nFile-backed pages:                            639960.\nAnonymous pages:                             1267328.\nPages stored in compressor:                  1831757.\nPages occupied by compressor:                 784938.\nDecompressions:                           1170439805.\nCompressions:                             1484844823.\nPageins:                                  7613344931.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168059.\nPages tagged resident:                        124373.\nPages tagged compressed:                       43686.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          127.\nPages tag-storage non-tag pageable:            90998.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051392.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344621.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/installer/memory.samples.jsonl

SHA-256 `149345740338c94796db5fb820ae6e939aea6595286a852a2d5fcbc7703a7fa1`; 4375 bytes.

````text
{"elapsed_seconds": 0.0013959169999999688, "owned_rss_bytes": 3391488, "owned_process_count": 2, "reclaimable_bytes": 12836159488, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.22815450000000004, "owned_rss_bytes": 5947392, "owned_process_count": 2, "reclaimable_bytes": 12832997376, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.45378000000000007, "owned_rss_bytes": 5947392, "owned_process_count": 2, "reclaimable_bytes": 12836356096, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.6795712919999999, "owned_rss_bytes": 5963776, "owned_process_count": 2, "reclaimable_bytes": 12763676672, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.904671542, "owned_rss_bytes": 5963776, "owned_process_count": 2, "reclaimable_bytes": 12761284608, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.1306209579999997, "owned_rss_bytes": 5963776, "owned_process_count": 2, "reclaimable_bytes": 12758614016, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.356239875, "owned_rss_bytes": 5963776, "owned_process_count": 2, "reclaimable_bytes": 12759744512, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.5823903329999998, "owned_rss_bytes": 5963776, "owned_process_count": 2, "reclaimable_bytes": 12753600512, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.807975833, "owned_rss_bytes": 5963776, "owned_process_count": 2, "reclaimable_bytes": 13104119808, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 2.0347130419999995, "owned_rss_bytes": 11059200, "owned_process_count": 3, "reclaimable_bytes": 13098074112, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 2.2604462919999997, "owned_rss_bytes": 8028160, "owned_process_count": 3, "reclaimable_bytes": 13102628864, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 2.48613125, "owned_rss_bytes": 4571136, "owned_process_count": 3, "reclaimable_bytes": 12918734848, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 2.7124680829999996, "owned_rss_bytes": 4571136, "owned_process_count": 3, "reclaimable_bytes": 12923502592, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 2.9612069169999997, "owned_rss_bytes": 4571136, "owned_process_count": 3, "reclaimable_bytes": 12890750976, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 3.192444542, "owned_rss_bytes": 3768320, "owned_process_count": 2, "reclaimable_bytes": 12900188160, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 3.418114917, "owned_rss_bytes": 14794752, "owned_process_count": 5, "reclaimable_bytes": 12891602944, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 3.643922125, "owned_rss_bytes": 4620288, "owned_process_count": 3, "reclaimable_bytes": 13070385152, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 3.869633375, "owned_rss_bytes": 4620288, "owned_process_count": 3, "reclaimable_bytes": 13077069824, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 4.09904575, "owned_rss_bytes": 17350656, "owned_process_count": 3, "reclaimable_bytes": 13083836416, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 4.327629957999999, "owned_rss_bytes": 9519104, "owned_process_count": 2, "reclaimable_bytes": 12895944704, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 4.553335292, "owned_rss_bytes": 14876672, "owned_process_count": 5, "reclaimable_bytes": 12889915392, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 4.779059542000001, "owned_rss_bytes": 15024128, "owned_process_count": 2, "reclaimable_bytes": 12897894400, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 5.003341624999999, "owned_rss_bytes": 14893056, "owned_process_count": 5, "reclaimable_bytes": 12889604096, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 5.2293108749999995, "owned_rss_bytes": 4734976, "owned_process_count": 3, "reclaimable_bytes": 12778668032, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 5.455544375000001, "owned_rss_bytes": 4734976, "owned_process_count": 3, "reclaimable_bytes": 12773638144, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 5.681055333, "owned_rss_bytes": 18055168, "owned_process_count": 2, "reclaimable_bytes": 12775800832, "swapins": 44109994, "swapouts": 77525566}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/installer/stderr.txt

SHA-256 `b6405a956b61a39bf142c7b1ea6299b4c8b49d70c7277e3f2da53f73f1b2f26f`; 243 bytes.

````text

######################################################################## 100.0%

######################################################################## 100.0%

######################################################################## 100.0%
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/installer/stdout.txt

SHA-256 `3e55708b822179279fc467f0bef47e36f2d3bbdab3eaf2ad84f32da0c034b8af`; 21 bytes.

````text
INSTALLER GATES PASS
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/manifest.json

SHA-256 `fa77b08bc4b2f97a2cf57a71f22408ddf019ddd38d775bbb4e3d53d9f8b0ff1b`; 4970 bytes.

````text
{
  "passed": true,
  "protocol_sha256": "d433cfc254b34e09c2c6142791a0a6339c968f9a12e0fce33eb0b9a0c2326856",
  "rows": [
    {
      "name": "sampler",
      "passed": true,
      "command": [
        "bash",
        "Tools/sampler_gates.sh"
      ],
      "exit_code": 0,
      "stdout_sha256": "3c3c6f05ea83e169d7c650a80e30a1314e0e8a941dac4411824765dbf36add99",
      "stderr_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    {
      "name": "installer",
      "passed": true,
      "command": [
        "bash",
        "Tools/installer_gates.sh"
      ],
      "exit_code": 0,
      "stdout_sha256": "3e55708b822179279fc467f0bef47e36f2d3bbdab3eaf2ad84f32da0c034b8af",
      "stderr_sha256": "b6405a956b61a39bf142c7b1ea6299b4c8b49d70c7277e3f2da53f73f1b2f26f"
    }
  ],
  "performance_or_resource_qualified": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12720537600,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   132782.\nPages active:                                 949608.\nPages inactive:                               930308.\nPages speculative:                             18394.\nPages throttled:                                   0.\nPages wired down:                             269161.\nPages purgeable:                               10527.\n\"Translation faults\":                    15319416941.\nPages copy-on-write:                       728005196.\nPages zero filled:                       21079863058.\nPages reactivated:                        3466572733.\nPages purged:                               72003238.\nFile-backed pages:                            633091.\nAnonymous pages:                             1265219.\nPages stored in compressor:                  1832822.\nPages occupied by compressor:                 785252.\nDecompressions:                           1170438740.\nCompressions:                             1484844823.\nPageins:                                  7613330617.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168051.\nPages tagged resident:                        124235.\nPages tagged compressed:                       43816.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          162.\nPages tag-storage non-tag pageable:            90963.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7071808.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344491.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12665815040,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   127109.\nPages active:                                 944548.\nPages inactive:                               933072.\nPages speculative:                             24253.\nPages throttled:                                   0.\nPages wired down:                             271659.\nPages purgeable:                                5211.\n\"Translation faults\":                    15319912828.\nPages copy-on-write:                       728064127.\nPages zero filled:                       21080078213.\nPages reactivated:                        3466572747.\nPages purged:                               72003368.\nFile-backed pages:                            640740.\nAnonymous pages:                             1261133.\nPages stored in compressor:                  1831756.\nPages occupied by compressor:                 784938.\nDecompressions:                           1170439806.\nCompressions:                             1484844823.\nPageins:                                  7613344933.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168047.\nPages tagged resident:                        124361.\nPages tagged compressed:                       43686.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          128.\nPages tag-storage non-tag pageable:            90997.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051392.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344621.\n"
  },
  "jobs": [],
  "model_lock_free": true,
  "seconds": 8.196558292
}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/protocol.json

SHA-256 `d433cfc254b34e09c2c6142791a0a6339c968f9a12e0fce33eb0b9a0c2326856`; 20765 bytes.

````text
{
  "classification": "Selected candidate weights-free sampler/NumPy/governor and real local installer transitions only; no model or performance/resource qualification",
  "binary": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
      "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 5000000000,
    "maximum_owned_rss_bytes": 1500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 120,
    "stop_on_new_swapouts": false
  },
  "drivers": {
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "install.sh": "8fc9b91156e1f92d6ef1efcda72ae339fcdf3987a9f7c2021a2c6d02ac19d8f1",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  "wrapper_sha256": "34ec6be0d56b84980bc932375d70cd3b06973884a5eb541158ebbbf37353cc94",
  "steps": [
    [
      "sampler",
      "bash",
      "Tools/sampler_gates.sh"
    ],
    [
      "installer",
      "bash",
      "Tools/installer_gates.sh"
    ]
  ]
}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/sampler/manifest.json

SHA-256 `086d5efad1eb754a79cd8206828b6f2c42cbd8c976416ff91dc935c3828199ab`; 295 bytes.

````text
{
  "name": "sampler",
  "passed": true,
  "command": [
    "bash",
    "Tools/sampler_gates.sh"
  ],
  "exit_code": 0,
  "stdout_sha256": "3c3c6f05ea83e169d7c650a80e30a1314e0e8a941dac4411824765dbf36add99",
  "stderr_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/sampler/memory.json

SHA-256 `ac272d70ec2f66fa939421863b4ea1cfba43080ff1655ed737c3cbd010d4dd25`; 8749 bytes.

````text
{
  "command": [
    "bash",
    "Tools/sampler_gates.sh"
  ],
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 5000000000,
    "maximum_owned_rss_bytes": 1500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 120,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12779077632,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   136330.\nPages active:                                 947511.\nPages inactive:                               928891.\nPages speculative:                             18405.\nPages throttled:                                   0.\nPages wired down:                             269146.\nPages purgeable:                               10527.\n\"Translation faults\":                    15319420288.\nPages copy-on-write:                       728005665.\nPages zero filled:                       21079864442.\nPages reactivated:                        3466572733.\nPages purged:                               72003238.\nFile-backed pages:                            633116.\nAnonymous pages:                             1261691.\nPages stored in compressor:                  1832822.\nPages occupied by compressor:                 785252.\nDecompressions:                           1170438740.\nCompressions:                             1484844823.\nPageins:                                  7613330621.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168051.\nPages tagged resident:                        124235.\nPages tagged compressed:                       43816.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          177.\nPages tag-storage non-tag pageable:            90948.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7071808.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344491.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0013277499999999887,
      "owned_rss_bytes": 2244608,
      "owned_process_count": 2,
      "reclaimable_bytes": 12772835328,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.227433959,
      "owned_rss_bytes": 50003968,
      "owned_process_count": 3,
      "reclaimable_bytes": 12781256704,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.449420917,
      "owned_rss_bytes": 4194304,
      "owned_process_count": 3,
      "reclaimable_bytes": 12798394368,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.678200209,
      "owned_rss_bytes": 4669440,
      "owned_process_count": 3,
      "reclaimable_bytes": 12827230208,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.904265625,
      "owned_rss_bytes": 21512192,
      "owned_process_count": 3,
      "reclaimable_bytes": 12845613056,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.131348625,
      "owned_rss_bytes": 37994496,
      "owned_process_count": 3,
      "reclaimable_bytes": 12833259520,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.3573211250000001,
      "owned_rss_bytes": 49594368,
      "owned_process_count": 3,
      "reclaimable_bytes": 12855640064,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.582607125,
      "owned_rss_bytes": 37765120,
      "owned_process_count": 3,
      "reclaimable_bytes": 12755042304,
      "swapins": 44109994,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.808249167,
      "owned_rss_bytes": 4276224,
      "owned_process_count": 3,
      "reclaimable_bytes": 12841664512,
      "swapins": 44109994,
      "swapouts": 77525566
    }
  ],
  "passed": true,
  "classification": "Selected candidate weights-free sampler/NumPy/governor and real local installer transitions only; no model or performance/resource qualification",
  "child_pid": 51378,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12857065472,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   137586.\nPages active:                                 951886.\nPages inactive:                               931660.\nPages speculative:                             19204.\nPages throttled:                                   0.\nPages wired down:                             260113.\nPages purgeable:                               12058.\n\"Translation faults\":                    15319566461.\nPages copy-on-write:                       728020951.\nPages zero filled:                       21079993728.\nPages reactivated:                        3466572733.\nPages purged:                               72003240.\nFile-backed pages:                            635089.\nAnonymous pages:                             1267661.\nPages stored in compressor:                  1832740.\nPages occupied by compressor:                 785226.\nDecompressions:                           1170438822.\nCompressions:                             1484844823.\nPageins:                                  7613332954.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168055.\nPages tagged resident:                        124261.\nPages tagged compressed:                       43794.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          202.\nPages tag-storage non-tag pageable:            90923.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7067264.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344513.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    51378
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 2.0826376669999997,
  "child_exit_code": 0,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12843073536,
    "swapins": 44109994,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   136717.\nPages active:                                 952212.\nPages inactive:                               931706.\nPages speculative:                             19207.\nPages throttled:                                   0.\nPages wired down:                             260156.\nPages purgeable:                               12058.\n\"Translation faults\":                    15319573930.\nPages copy-on-write:                       728022061.\nPages zero filled:                       21079997086.\nPages reactivated:                        3466572733.\nPages purged:                               72003240.\nFile-backed pages:                            635104.\nAnonymous pages:                             1268021.\nPages stored in compressor:                  1832740.\nPages occupied by compressor:                 785226.\nDecompressions:                           1170438822.\nCompressions:                             1484844823.\nPageins:                                  7613332977.\nPageouts:                                   11061365.\nSwapins:                                    44109994.\nSwapouts:                                   77525566.\nPages tagged:                                 168055.\nPages tagged resident:                        124261.\nPages tagged compressed:                       43794.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          175.\nPages tag-storage non-tag pageable:            90950.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7067264.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344513.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/sampler/memory.samples.jsonl

SHA-256 `f8078a2639e6726b329558bac07a0eda349edbe6c3a5006b0bbbd8c0b5851dd9`; 1498 bytes.

````text
{"elapsed_seconds": 0.0013277499999999887, "owned_rss_bytes": 2244608, "owned_process_count": 2, "reclaimable_bytes": 12772835328, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.227433959, "owned_rss_bytes": 50003968, "owned_process_count": 3, "reclaimable_bytes": 12781256704, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.449420917, "owned_rss_bytes": 4194304, "owned_process_count": 3, "reclaimable_bytes": 12798394368, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.678200209, "owned_rss_bytes": 4669440, "owned_process_count": 3, "reclaimable_bytes": 12827230208, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 0.904265625, "owned_rss_bytes": 21512192, "owned_process_count": 3, "reclaimable_bytes": 12845613056, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.131348625, "owned_rss_bytes": 37994496, "owned_process_count": 3, "reclaimable_bytes": 12833259520, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.3573211250000001, "owned_rss_bytes": 49594368, "owned_process_count": 3, "reclaimable_bytes": 12855640064, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.582607125, "owned_rss_bytes": 37765120, "owned_process_count": 3, "reclaimable_bytes": 12755042304, "swapins": 44109994, "swapouts": 77525566}
{"elapsed_seconds": 1.808249167, "owned_rss_bytes": 4276224, "owned_process_count": 3, "reclaimable_bytes": 12841664512, "swapins": 44109994, "swapouts": 77525566}
````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/sampler/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/combined-default-static-native-v261/sampler/stdout.txt

SHA-256 `3c3c6f05ea83e169d7c650a80e30a1314e0e8a941dac4411824765dbf36add99`; 998 bytes.

````text
PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
PASS  sampler == numpy reference: greedy (temperature 0)
PASS  sampler == numpy reference: pure sampling, no filters
PASS  sampler == numpy reference: top-k 1 (degenerate)
PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
PASS  sampler == numpy reference: min-p 0.3
PASS  sampler == numpy reference: presence penalty, accumulating
PASS  sampler == numpy reference: greedy + penalty (API temp-0)
PASS  sampler == numpy reference: vocab 4096
PASS  sampler == numpy reference: real vocab (248,320)
PASS  sampler == numpy reference: top-p 0 (sanitizer)
PASS  sampler == numpy reference: min-p 5 (sanitizer)
PASS  sampler == numpy reference: seed 0 (remapped)
PASS  sampler == numpy reference: exact zero RNG draw skips removed tokens
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (26 branches)
sampler + governor: passed 17, failed 0
````

## /tmp/slotstream-optimization-execution/run-static-native-v261.py

SHA-256 `34ec6be0d56b84980bc932375d70cd3b06973884a5eb541158ebbbf37353cc94`; 3611 bytes.

````text
import fcntl,json,os,sys,time
from pathlib import Path
ROOT=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import verified_build,competing_jobs
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path('/tmp/slotstream-optimization-execution/combined-default-static-native-v261');P.mkdir(exist_ok=False)
B=ROOT/'.build/optimization/combined-default-build-v255/candidate/slotstream'
S={'classification':'Selected candidate weights-free sampler/NumPy/governor and real local installer transitions only; no model or performance/resource qualification','binary':verified_build(B),'policy':{'startup_reclaimable_bytes':7_000_000_000,'minimum_live_reclaimable_bytes':5_000_000_000,'maximum_owned_rss_bytes':1_500_000_000,'sample_interval_seconds':.2,'maximum_build_seconds':120,'stop_on_new_swapouts':False},'drivers':{n:digest(ROOT/n) for n in ['Tools/sampler_gates.sh','Tools/sampler_ref.py','Tools/installer_gates.sh','install.sh','Tools/optimization_serial_build.py','Tools/optimization_readiness.py','Tools/prefill_bench.py','Tools/serve_bench.py']},'wrapper_sha256':digest(Path(__file__)),'steps':[['sampler','bash','Tools/sampler_gates.sh'],['installer','bash','Tools/installer_gates.sh']]}
(P/'protocol.json').write_text(json.dumps(S,indent=2)+'\n')
def memory():
 s=vm_snapshot();require_normal(pressure_snapshot());return s
r={'passed':False,'protocol_sha256':digest(P/'protocol.json'),'rows':[],'performance_or_resource_qualified':False}
start=time.monotonic()
try:
 r['before']=preflight(7);assert not competing_jobs()
 with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
  for k in saved:os.environ.pop(k)
  os.environ['SLOTSTREAM_TEST_BINARY']=str(B)
  try:
   for name,*command in S['steps']:
    out=P/name;out.mkdir();row={'name':name,'passed':False,'command':command};r['rows'].append(row)
    with (out/'stdout.txt').open('w') as stdout,(out/'stderr.txt').open('w') as stderr:
     result=guarded_run(command,cwd=ROOT,stdout=stdout,stderr=stderr,record_path=out/'memory.json',snapshot=memory,policy=S['policy'],classification=S['classification'])
    text=(out/'stdout.txt').read_text();row['exit_code']=result.returncode
    assert result.returncode==0 and not any(l.startswith(('FAIL','SKIP')) for l in text.splitlines())
    assert ('sampler + governor: passed 17, failed 0' if name=='sampler' else 'INSTALLER GATES PASS') in text
    assert json.loads((out/'memory.json').read_text())['passed'] is True
    row['passed']=True;row['stdout_sha256']=digest(out/'stdout.txt');row['stderr_sha256']=digest(out/'stderr.txt')
    (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');print({'name':name,'passed':True},flush=True)
   assert verified_build(B)==S['binary'];assert all(digest(ROOT/n)==h for n,h in S['drivers'].items())
  finally:
   os.environ.pop('SLOTSTREAM_TEST_BINARY',None);os.environ.update(saved)
 r['passed']=True
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
r['after']=vm_snapshot();r['jobs']=competing_jobs();r['model_lock_free']=bool(preflight(0));r['passed']=r['passed'] and not r['jobs'] and r['model_lock_free'];r['seconds']=time.monotonic()-start
(P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k not in ['before','after','rows']})
raise SystemExit(0 if r['passed'] else 1)
````

