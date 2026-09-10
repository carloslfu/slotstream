---
type: run
id: 01m1xd9zwhx6dj8bby620gqant
created: 2026-09-07T07:46:14.545244+00:00
updated: 2026-09-07T07:46:14.853625+00:00
summary: Unchanged planner family rebases onto the current device-observer source seam
binary: Per-file exact binary/source identities retained; current-source release build did not publish a candidate
captured_at: 2026-09-07
command: python3 /tmp/slotstream-optimization-execution/run-planner-proxy-v267.py; python3 /tmp/slotstream-optimization-execution/run-planner-proxy-v270.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Unchanged planner family rebases onto the current device-observer source seam
tool: python3
---
# Unchanged planner family rebases onto the current device-observer source seam

V267 removes exactly the three unchanged device-observer methods already extracted by the context task from the V255 planner-family afterimage. The separate PlannerDevice.swift and context arithmetic are preserved, and no constant is recalibrated or memory credit added. The first proxy attempt refuses before any child because another compiler is active; the negative receipt remains intact. V270 later runs the exact twenty-input rebased production-policy closure under the original strict model-free guard. All964167assertions pass in6.93880725seconds, with zero swapins/swapouts, minimum sampled reclaimable10003480576bytes and maximum sampled owned RSS228900864bytes. The observer seam is inert in this proxy and MLX/model/GPU/hardware qualification never runs. This proves the software-policy merge, not physical context capacity or native inference.

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy/compile.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy/compile.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy/contracts.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy/contracts.stdout.json

SHA-256 `bdc9cbf5f5390aa2b66f851588923061d81ebc198844c9783a7660a545bcc585`; 221 bytes.

````text
{"assertions":964167,"failures":[],"gates":{"C01":12,"C02":4152,"C03":7,"C04":1221,"C05":77,"C06":958624,"C08":5,"C09":9,"C10":19,"C13":13,"C14":12,"C15":16},"hardware_qualified":false,"model_loaded":false,"passed":true}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy/report.json

SHA-256 `8065d8009441b78cf379bfb3b7f6dc99840f05dee6883aa54305d19a706dea4d`; 2781 bytes.

````text
{
  "kind": "context-software-proxy",
  "passed": true,
  "hardware_qualified": false,
  "model_loaded": false,
  "source_sha256": {
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
    "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
    "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558"
  },
  "failures": [],
  "compiler_exit": 0,
  "exit_code": 0,
  "contracts": {
    "assertions": 964167,
    "failures": [],
    "gates": {
      "C01": 12,
      "C02": 4152,
      "C03": 7,
      "C04": 1221,
      "C05": 77,
      "C06": 958624,
      "C08": 5,
      "C09": 9,
      "C10": 19,
      "C13": 13,
      "C14": 12,
      "C15": 16
    },
    "hardware_qualified": false,
    "model_loaded": false,
    "passed": true
  }
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-manifest.json

SHA-256 `3d80af4d4fe4a9ebbe550b450b8db7fe491563671ca9f3c238a2313f38cf1951`; 4646 bytes.

````text
{
  "passed": true,
  "launched": true,
  "protocol_sha256": "25421bf2eda290574da4fa086c4941008c6b037e960e89cd1146a95d908514e7",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10145464320,
    "swapins": 44112307,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47255.\nPages active:                                1113650.\nPages inactive:                              1117904.\nPages speculative:                             10384.\nPages throttled:                                   0.\nPages wired down:                             280532.\nPages purgeable:                                7876.\n\"Translation faults\":                    15400875924.\nPages copy-on-write:                       734488270.\nPages zero filled:                       21212799347.\nPages reactivated:                        3469911468.\nPages purged:                               72209333.\nFile-backed pages:                            564099.\nAnonymous pages:                             1677839.\nPages stored in compressor:                  1387437.\nPages occupied by compressor:                 515769.\nDecompressions:                           1171690451.\nCompressions:                             1486103517.\nPageins:                                  7614914174.\nPageouts:                                   11074275.\nSwapins:                                    44112307.\nSwapouts:                                   77525566.\nPages tagged:                                 185064.\nPages tagged resident:                        158821.\nPages tagged compressed:                       26243.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11165.\nPages tag-storage free:                          140.\nPages tag-storage non-tag pageable:            86991.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3750272.\nTagged compressions:                        11243974.\nTagged decompressions:                      10385839.\n"
  },
  "exit_code": 0,
  "contracts": {
    "assertions": 964167,
    "failures": [],
    "gates": {
      "C01": 12,
      "C02": 4152,
      "C03": 7,
      "C04": 1221,
      "C05": 77,
      "C06": 958624,
      "C08": 5,
      "C09": 9,
      "C10": 19,
      "C13": 13,
      "C14": 12,
      "C15": 16
    },
    "hardware_qualified": false,
    "model_loaded": false,
    "passed": true
  },
  "elapsed_seconds": 6.93880725,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10138402816,
    "swapins": 44112307,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    41211.\nPages active:                                1125163.\nPages inactive:                              1119723.\nPages speculative:                              5123.\nPages throttled:                                   0.\nPages wired down:                             279093.\nPages purgeable:                                8116.\n\"Translation faults\":                    15401145975.\nPages copy-on-write:                       734512321.\nPages zero filled:                       21212904261.\nPages reactivated:                        3469911468.\nPages purged:                               72209333.\nFile-backed pages:                            569472.\nAnonymous pages:                             1680537.\nPages stored in compressor:                  1386058.\nPages occupied by compressor:                 515153.\nDecompressions:                           1171691829.\nCompressions:                             1486103517.\nPageins:                                  7614921161.\nPageouts:                                   11074275.\nSwapins:                                    44112307.\nSwapouts:                                   77525566.\nPages tagged:                                 185023.\nPages tagged resident:                        158781.\nPages tagged compressed:                       26242.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11165.\nPages tag-storage free:                          148.\nPages tag-storage non-tag pageable:            86983.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3750208.\nTagged compressions:                        11243974.\nTagged decompressions:                      10385840.\n"
  },
  "jobs": [],
  "model_lock_free": true
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-memory.json

SHA-256 `6a1225c7edb9dd46a38c6958db919867574da718bde885b9221fb17c4609b437`; 13458 bytes.

````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/planner-device-rebase-v267/candidate/Tools/context_proxy.py",
    "--out",
    "/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy"
  ],
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 5000000000,
    "maximum_owned_rss_bytes": 1500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 300,
    "stop_on_new_swapouts": true
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10145071104,
    "swapins": 44112307,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47229.\nPages active:                                1113319.\nPages inactive:                              1117904.\nPages speculative:                             10386.\nPages throttled:                                   0.\nPages wired down:                             280877.\nPages purgeable:                                7876.\n\"Translation faults\":                    15400878605.\nPages copy-on-write:                       734488699.\nPages zero filled:                       21212800523.\nPages reactivated:                        3469911468.\nPages purged:                               72209333.\nFile-backed pages:                            564101.\nAnonymous pages:                             1677508.\nPages stored in compressor:                  1387437.\nPages occupied by compressor:                 515769.\nDecompressions:                           1171690451.\nCompressions:                             1486103517.\nPageins:                                  7614914178.\nPageouts:                                   11074275.\nSwapins:                                    44112307.\nSwapouts:                                   77525566.\nPages tagged:                                 185064.\nPages tagged resident:                        158821.\nPages tagged compressed:                       26243.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11165.\nPages tag-storage free:                          140.\nPages tag-storage non-tag pageable:            86991.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3750272.\nTagged compressions:                        11243974.\nTagged decompressions:                      10385839.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0018246659999999887,
      "owned_rss_bytes": 2965504,
      "owned_process_count": 1,
      "reclaimable_bytes": 10137321472,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.229324666,
      "owned_rss_bytes": 128925696,
      "owned_process_count": 3,
      "reclaimable_bytes": 10092937216,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.457349625,
      "owned_rss_bytes": 192823296,
      "owned_process_count": 3,
      "reclaimable_bytes": 10060234752,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.684408625,
      "owned_rss_bytes": 200704000,
      "owned_process_count": 3,
      "reclaimable_bytes": 10043949056,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.914712083,
      "owned_rss_bytes": 194084864,
      "owned_process_count": 3,
      "reclaimable_bytes": 10035314688,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.1441831249999999,
      "owned_rss_bytes": 141082624,
      "owned_process_count": 3,
      "reclaimable_bytes": 10074767360,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.3691762079999998,
      "owned_rss_bytes": 166166528,
      "owned_process_count": 3,
      "reclaimable_bytes": 10064216064,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.596982,
      "owned_rss_bytes": 120225792,
      "owned_process_count": 3,
      "reclaimable_bytes": 10079666176,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.8247207079999999,
      "owned_rss_bytes": 179945472,
      "owned_process_count": 3,
      "reclaimable_bytes": 10064199680,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.047986208,
      "owned_rss_bytes": 166232064,
      "owned_process_count": 3,
      "reclaimable_bytes": 10073554944,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.275700166,
      "owned_rss_bytes": 174637056,
      "owned_process_count": 3,
      "reclaimable_bytes": 10067050496,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.503997541,
      "owned_rss_bytes": 190021632,
      "owned_process_count": 3,
      "reclaimable_bytes": 10055237632,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.731351708,
      "owned_rss_bytes": 103677952,
      "owned_process_count": 3,
      "reclaimable_bytes": 10092478464,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.9594822080000003,
      "owned_rss_bytes": 195264512,
      "owned_process_count": 3,
      "reclaimable_bytes": 10044424192,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.1878150830000003,
      "owned_rss_bytes": 222740480,
      "owned_process_count": 3,
      "reclaimable_bytes": 10016751616,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.413822875,
      "owned_rss_bytes": 226508800,
      "owned_process_count": 3,
      "reclaimable_bytes": 10014605312,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.641601,
      "owned_rss_bytes": 228900864,
      "owned_process_count": 3,
      "reclaimable_bytes": 10010836992,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.8672109160000003,
      "owned_rss_bytes": 218824704,
      "owned_process_count": 3,
      "reclaimable_bytes": 10003480576,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.095482625,
      "owned_rss_bytes": 145358848,
      "owned_process_count": 3,
      "reclaimable_bytes": 10070147072,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.323339791,
      "owned_rss_bytes": 96043008,
      "owned_process_count": 3,
      "reclaimable_bytes": 10085253120,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.549872083,
      "owned_rss_bytes": 183795712,
      "owned_process_count": 3,
      "reclaimable_bytes": 10044375040,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.777469708,
      "owned_rss_bytes": 209387520,
      "owned_process_count": 3,
      "reclaimable_bytes": 10037772288,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.006062291,
      "owned_rss_bytes": 212926464,
      "owned_process_count": 3,
      "reclaimable_bytes": 10030104576,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.233185333,
      "owned_rss_bytes": 217579520,
      "owned_process_count": 3,
      "reclaimable_bytes": 10019356672,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.4593915410000005,
      "owned_rss_bytes": 190840832,
      "owned_process_count": 3,
      "reclaimable_bytes": 10051551232,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.6832055,
      "owned_rss_bytes": 210829312,
      "owned_process_count": 3,
      "reclaimable_bytes": 10035118080,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.911129,
      "owned_rss_bytes": 213549056,
      "owned_process_count": 3,
      "reclaimable_bytes": 10036838400,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.138946375,
      "owned_rss_bytes": 50610176,
      "owned_process_count": 3,
      "reclaimable_bytes": 10113859584,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.366638333,
      "owned_rss_bytes": 14499840,
      "owned_process_count": 2,
      "reclaimable_bytes": 10124902400,
      "swapins": 44112307,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.595590916,
      "owned_rss_bytes": 21626880,
      "owned_process_count": 2,
      "reclaimable_bytes": 10126114816,
      "swapins": 44112307,
      "swapouts": 77525566
    }
  ],
  "passed": true,
  "classification": "Isolated production planner-family policy compilation/checks with inert device observers; no MLX/model or performance qualification",
  "child_pid": 6503,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10136961024,
    "swapins": 44112307,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    41119.\nPages active:                                1125164.\nPages inactive:                              1119722.\nPages speculative:                              5123.\nPages throttled:                                   0.\nPages wired down:                             279086.\nPages purgeable:                                8121.\n\"Translation faults\":                    15401139359.\nPages copy-on-write:                       734511242.\nPages zero filled:                       21212901197.\nPages reactivated:                        3469911468.\nPages purged:                               72209333.\nFile-backed pages:                            569471.\nAnonymous pages:                             1680538.\nPages stored in compressor:                  1386058.\nPages occupied by compressor:                 515153.\nDecompressions:                           1171691829.\nCompressions:                             1486103517.\nPageins:                                  7614921154.\nPageouts:                                   11074275.\nSwapins:                                    44112307.\nSwapouts:                                   77525566.\nPages tagged:                                 185023.\nPages tagged resident:                        158781.\nPages tagged compressed:                       26242.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11165.\nPages tag-storage free:                          148.\nPages tag-storage non-tag pageable:            86983.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3750208.\nTagged compressions:                        11243974.\nTagged decompressions:                      10385840.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    6503
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 6.888896916,
  "child_exit_code": 0,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10136616960,
    "swapins": 44112307,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    41103.\nPages active:                                1125150.\nPages inactive:                              1119722.\nPages speculative:                              5123.\nPages throttled:                                   0.\nPages wired down:                             279093.\nPages purgeable:                                8116.\n\"Translation faults\":                    15401144801.\nPages copy-on-write:                       734512020.\nPages zero filled:                       21212904126.\nPages reactivated:                        3469911468.\nPages purged:                               72209333.\nFile-backed pages:                            569471.\nAnonymous pages:                             1680524.\nPages stored in compressor:                  1386058.\nPages occupied by compressor:                 515153.\nDecompressions:                           1171691829.\nCompressions:                             1486103517.\nPageins:                                  7614921159.\nPageouts:                                   11074275.\nSwapins:                                    44112307.\nSwapouts:                                   77525566.\nPages tagged:                                 185023.\nPages tagged resident:                        158781.\nPages tagged compressed:                       26242.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11165.\nPages tag-storage free:                          148.\nPages tag-storage non-tag pageable:            86983.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3750208.\nTagged compressions:                        11243974.\nTagged decompressions:                      10385840.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-memory.samples.jsonl

SHA-256 `4d7de70695aff9efd5eefb90db66f6c5fb06c0b2a4cfddb1aca39c27d9836089`; 5022 bytes.

````text
{"elapsed_seconds": 0.0018246659999999887, "owned_rss_bytes": 2965504, "owned_process_count": 1, "reclaimable_bytes": 10137321472, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 0.229324666, "owned_rss_bytes": 128925696, "owned_process_count": 3, "reclaimable_bytes": 10092937216, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 0.457349625, "owned_rss_bytes": 192823296, "owned_process_count": 3, "reclaimable_bytes": 10060234752, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 0.684408625, "owned_rss_bytes": 200704000, "owned_process_count": 3, "reclaimable_bytes": 10043949056, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 0.914712083, "owned_rss_bytes": 194084864, "owned_process_count": 3, "reclaimable_bytes": 10035314688, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 1.1441831249999999, "owned_rss_bytes": 141082624, "owned_process_count": 3, "reclaimable_bytes": 10074767360, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 1.3691762079999998, "owned_rss_bytes": 166166528, "owned_process_count": 3, "reclaimable_bytes": 10064216064, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 1.596982, "owned_rss_bytes": 120225792, "owned_process_count": 3, "reclaimable_bytes": 10079666176, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 1.8247207079999999, "owned_rss_bytes": 179945472, "owned_process_count": 3, "reclaimable_bytes": 10064199680, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 2.047986208, "owned_rss_bytes": 166232064, "owned_process_count": 3, "reclaimable_bytes": 10073554944, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 2.275700166, "owned_rss_bytes": 174637056, "owned_process_count": 3, "reclaimable_bytes": 10067050496, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 2.503997541, "owned_rss_bytes": 190021632, "owned_process_count": 3, "reclaimable_bytes": 10055237632, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 2.731351708, "owned_rss_bytes": 103677952, "owned_process_count": 3, "reclaimable_bytes": 10092478464, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 2.9594822080000003, "owned_rss_bytes": 195264512, "owned_process_count": 3, "reclaimable_bytes": 10044424192, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 3.1878150830000003, "owned_rss_bytes": 222740480, "owned_process_count": 3, "reclaimable_bytes": 10016751616, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 3.413822875, "owned_rss_bytes": 226508800, "owned_process_count": 3, "reclaimable_bytes": 10014605312, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 3.641601, "owned_rss_bytes": 228900864, "owned_process_count": 3, "reclaimable_bytes": 10010836992, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 3.8672109160000003, "owned_rss_bytes": 218824704, "owned_process_count": 3, "reclaimable_bytes": 10003480576, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 4.095482625, "owned_rss_bytes": 145358848, "owned_process_count": 3, "reclaimable_bytes": 10070147072, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 4.323339791, "owned_rss_bytes": 96043008, "owned_process_count": 3, "reclaimable_bytes": 10085253120, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 4.549872083, "owned_rss_bytes": 183795712, "owned_process_count": 3, "reclaimable_bytes": 10044375040, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 4.777469708, "owned_rss_bytes": 209387520, "owned_process_count": 3, "reclaimable_bytes": 10037772288, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 5.006062291, "owned_rss_bytes": 212926464, "owned_process_count": 3, "reclaimable_bytes": 10030104576, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 5.233185333, "owned_rss_bytes": 217579520, "owned_process_count": 3, "reclaimable_bytes": 10019356672, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 5.4593915410000005, "owned_rss_bytes": 190840832, "owned_process_count": 3, "reclaimable_bytes": 10051551232, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 5.6832055, "owned_rss_bytes": 210829312, "owned_process_count": 3, "reclaimable_bytes": 10035118080, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 5.911129, "owned_rss_bytes": 213549056, "owned_process_count": 3, "reclaimable_bytes": 10036838400, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 6.138946375, "owned_rss_bytes": 50610176, "owned_process_count": 3, "reclaimable_bytes": 10113859584, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 6.366638333, "owned_rss_bytes": 14499840, "owned_process_count": 2, "reclaimable_bytes": 10124902400, "swapins": 44112307, "swapouts": 77525566}
{"elapsed_seconds": 6.595590916, "owned_rss_bytes": 21626880, "owned_process_count": 2, "reclaimable_bytes": 10126114816, "swapins": 44112307, "swapouts": 77525566}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-protocol.json

SHA-256 `25421bf2eda290574da4fa086c4941008c6b037e960e89cd1146a95d908514e7`; 3021 bytes.

````text
{
  "classification": "Isolated production planner-family policy compilation/checks with inert device observers; no MLX/model or performance qualification",
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/planner-device-rebase-v267/candidate/Tools/context_proxy.py",
    "--out",
    "/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy"
  ],
  "source_sha256": {
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d"
  },
  "wrapper_sha256": "bd0f8267c77a5eef6dde2e38df705d95741519cb1bfcd3073741238aa8812c8f",
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 5000000000,
    "maximum_owned_rss_bytes": 1500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 300,
    "stop_on_new_swapouts": true
  }
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy.stderr

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy.stdout

SHA-256 `f60104bdd0c3c74d56a3572c7fc4ec6547f77ce208e879db8792ec4bc010860e`; 331 bytes.

````text
{"passed": true, "hardware_qualified": false, "failures": [], "contracts": {"assertions": 964167, "failures": [], "gates": {"C01": 12, "C02": 4152, "C03": 7, "C04": 1221, "C05": 77, "C06": 958624, "C08": 5, "C09": 9, "C10": 19, "C13": 13, "C14": 12, "C15": 16}, "hardware_qualified": false, "model_loaded": false, "passed": true}}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/after/Sources/Slotstream/ContextMemory.swift

SHA-256 `c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865`; 13907 bytes.

````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = PlannerCostModel.fixedBytes
        poolBytes = ContextBytes.product(slots, Int(Geometry.recordBytes))
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, PlannerCostModel.prefillBytesPerToken)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? PlannerCostModel.mtpResidentBytes : 0
        visionResidentBytes = visionResident ? PlannerCostModel.visionResidentBytes : 0
        planningMarginBytes = PlannerCostModel.planningMarginBytes
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), PlannerCostModel.prefillBytesPerToken),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/after/Sources/Slotstream/Plan.swift

SHA-256 `7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d`; 57831 bytes.

````text
// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Foundation

/// Model geometry the cache math speaks in. The planner needs these before the
/// checkpoint is opened, so they are constants — `check(against:recordBytes:)`
/// rejects a checkpoint that does not match once the engine has it.
public enum Geometry {
    public static let layers = 48
    public static let expertsPerLayer = 512
    public static let recordBytes = 2_764_800.0
    public static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    public static let floorSlots = 640

    public static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    public static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
    /// Convert a raw GB budget without ever converting an attacker-sized
    /// Double directly to Int (which traps in Swift when it is out of range).
    public static func slotsForPoolGB(_ poolGB: Double) -> Int {
        guard poolGB.isFinite else { return poolGB > 0 ? totalRecords : floorSlots }
        if poolGB >= gb(totalRecords) { return totalRecords }
        if poolGB <= gb(floorSlots) { return floorSlots }
        return Int(poolGB * 1e9 / recordBytes)
    }
    /// GB of pool per expert-per-layer (N experts/layer costs N × this).
    public static var gbPerExpertPerLayer: Double { Double(layers) * recordBytes / 1e9 }

    /// The planner sizes memory from the constants above while the engine
    /// allocates from config.json. If they ever disagree, every memory number
    /// the user is shown is wrong, so fail loudly instead of drifting.
    public static func check(against cfg: ModelConfig, recordBytes actual: Int) throws {
        guard cfg.numLayers == layers, cfg.numExperts == expertsPerLayer,
            Double(actual) == recordBytes
        else {
            throw ModelError(
                "model geometry does not match the supported checkpoint: config has "
                    + "\(cfg.numLayers) layers x \(cfg.numExperts) experts x \(actual) "
                    + "B/record, expected \(layers) x \(expertsPerLayer) x "
                    + "\(Int(recordBytes)) B — check --model")
        }
    }
}

public struct PlanError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

/// Explicit process controls whose unused reservations can become expert
/// capacity. Kept with the plan so vision loading and the governor cannot
/// silently restore an allocation after its budget has been spent.
public struct RuntimeAllocationPolicy: Equatable, Sendable {
    public let prefillChunkOverride: Int?
    public let prefixCacheEnabled: Bool

    public init(prefillChunkOverride: Int? = nil, prefixCacheEnabled: Bool = true) throws {
        if let chunk = prefillChunkOverride, !(256 ... 4096).contains(chunk) {
            throw PlanError("runtime allocation planning requires a prefill chunk between 256 and 4096")
        }
        self.prefillChunkOverride = prefillChunkOverride
        self.prefixCacheEnabled = prefixCacheEnabled
    }
}

/// The resolved memory decision: which knob decided it, what it costs, and
/// what to expect. Everything user-facing about memory comes from here.
public struct MemoryPlan {
    public enum Source: String {
        case expertsPerLayer = "--experts-per-layer"
        case poolGB = "--pool-gb"
        case memoryGB = "--memory-gb"
        case auto = "auto"
    }

    public let source: Source
    public let slots: Int
    /// Total-process target in GB when the plan came from --memory-gb or auto.
    public let targetGB: Double?
    public let ramGB: Double
    public let workingSetGB: Double
    /// The RAM share auto was allowed (--max-ram-percent, default 70). Carried
    /// so the elastic governor grows back to the user's policy, not the default.
    public let ramPercent: Double
    /// Memory reclaimable at planning time (nil = could not be read).
    public let availableGB: Double?
    /// True when auto sized itself down because of what other apps hold now.
    public let clamped: Bool
    /// Tokens per prefill pass, chosen with the pool from the same budget.
    public let prefillChunk: Int
    /// Conversation state the prefix cache may retain, in tokens. Sized and
    /// charged from the same budget as the pool.
    public let prefixCacheTokens: Int
    /// Whether the MTP draft head loads (self-speculative decode). Charged as
    /// a fixed resident block; the pool is sized from what remains.
    public let mtpEnabled: Bool
    /// Whether an image request may load the tower in this process.
    public let visionEnabled: Bool
    /// A loaded tower is charged inside the total-process target. Merely
    /// accepting images does not take expert capacity from text requests.
    public let visionResidentReserved: Bool
    /// True when this plan was made for a simulated device (`doctor --sim-*`).
    /// Such a plan may be printed and compared, never loaded: a simulated
    /// availability figure still produces a real allocation.
    public var simulated = false
    /// Longest prompt plus reply a request may hold (`--max-context`). State
    /// for the first `ContextPolicy.tokensInFixedFootprint` tokens is inside
    /// the fixed footprint; anything above is charged separately.
    public let maxContextTokens: Int
    public let notes: [String]
    public let runtimeAllocationPolicy: RuntimeAllocationPolicy?
    public let maxPrefillWaitMinutes: Double
    public let contextQualification: Bool

    public init(
        source: Source, slots: Int, targetGB: Double?,
        ramGB: Double, workingSetGB: Double, ramPercent: Double,
        availableGB: Double?, clamped: Bool,
        prefillChunk: Int, prefixCacheTokens: Int, mtpEnabled: Bool = false,
        visionEnabled: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        notes: [String], simulated: Bool = false,
        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false
    ) {
        self.source = source
        self.slots = slots
        self.targetGB = targetGB
        self.ramGB = ramGB
        self.workingSetGB = workingSetGB
        self.ramPercent = ramPercent
        self.availableGB = availableGB
        self.clamped = clamped
        self.prefillChunk = prefillChunk
        self.prefixCacheTokens = prefixCacheTokens
        self.mtpEnabled = mtpEnabled
        self.visionEnabled = visionEnabled
        self.visionResidentReserved = visionResidentReserved
        self.maxContextTokens = maxContextTokens
        self.notes = notes
        self.simulated = simulated
        self.runtimeAllocationPolicy = runtimeAllocationPolicy
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.contextQualification = contextQualification
    }

    public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
    public var poolGB: Double { Geometry.gb(slots) }
    public var memoryLedger: ContextMemoryLedger {
        ContextMemoryLedger(slots: slots, context: maxContextTokens, chunk: prefillChunk,
            retentionTokens: prefixCacheTokens, mtp: mtpEnabled, visionResident: visionResidentReserved)
    }
    public var expectedPeakGB: Double { Double(memoryLedger.expectedPeakBytes) / 1e9 }

    public func withRequestPolicy(_ configuration: ContextConfiguration) throws -> MemoryPlan {
        guard configuration.maxContextTokens == maxContextTokens else {
            throw PlanError("request policy must use the context window priced by the memory plan")
        }
        return MemoryPlan(source: source, slots: slots, targetGB: targetGB, ramGB: ramGB,
            workingSetGB: workingSetGB, ramPercent: ramPercent, availableGB: availableGB, clamped: clamped,
            prefillChunk: prefillChunk, prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
            maxContextTokens: maxContextTokens, notes: notes, simulated: simulated,
            runtimeAllocationPolicy: runtimeAllocationPolicy,
            maxPrefillWaitMinutes: configuration.maxPrefillWaitMinutes,
            contextQualification: configuration.qualification)
    }
    /// Seconds a prompt filling the whole context takes before its first
    /// token, priced through the prefill schedule this plan runs.
    public var estPrefillSecondsAtMaxContext: Double {
        PrefillSchedule.estSeconds(tokens: maxContextTokens, maxChunk: prefillChunk)
    }
    public var estWarmTokS: Double { Planner.estWarmTokS(expertsPerLayer: expertsPerLayerCached) }
    public var fullyResident: Bool { slots >= Geometry.totalRecords }

    /// The startup announce: device, decision, expectation, override hint.
    public func banner() -> String {
        var l: [String] = []
        l.append("slotstream memory plan (\(source.rawValue))")
        if let a = availableGB, a.isFinite {
            l.append(String(
                format: "  device: %.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                ramGB, a, workingSetGB))
        } else {
            l.append(String(
                format: "  device: %.0f GB RAM, %.1f GB Metal working set", ramGB, workingSetGB))
        }
        if let t = targetGB {
            let hint = source == .auto
                ? "   (override: --memory-gb N | --max-ram-percent P)"
                : ""
            l.append(String(format: "  target: %.1f GB total for this process%@", t, hint))
        }
        if fullyResident {
            l.append(String(
                format: "  cache:  all %d experts per layer resident (%.1f GB pool)",
                Geometry.expertsPerLayer, poolGB))
        } else {
            l.append(String(
                format: "  cache:  ~%.0f of %d experts per layer  (%d global slots = %.1f GB pool)",
                expertsPerLayerCached, Geometry.expertsPerLayer, slots, poolGB))
        }
        l.append(String(
            format: "  expect: ~%.1f GB peak, ~%.0f tok/s warm decode (est. from M5 Pro anchors)",
            expectedPeakGB, estWarmTokS))
        // The decode curve is a function of experts per layer alone. It carries
        // no term for read bandwidth, and it was anchored on a 17.3 GB/s SSD
        // (MEASUREMENTS, M0.5). The first machine measured that was not the dev
        // Mac reads at 1.5 GB/s, where the misses of a single token cost more
        // time than the whole estimated step (MEASUREMENTS, C1). Until the
        // planner can measure this disk and price those reads, the estimate
        // says out loud what it assumes rather than quietly assuming it.
        l.append(
            "  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). "
            + "A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 "
            + "estimate, so on base storage expect well under the number above — see docs/HARDWARE.md")
        l.append(String(
            format: "  prefill: %d tokens per pass (~%.0f tok/s here; costs ~%.1f GB of the target)",
            prefillChunk, Planner.estPrefillTokS(chunk: prefillChunk),
            Planner.prefillCostGB(prefillChunk)))
        if mtpEnabled {
            l.append(String(
                format: "  mtp:    draft head on — speculative decode (%.1f GB resident, charged above)",
                Planner.mtpResidentGB))
        }
        if visionEnabled {
            l.append(visionResidentReserved
                ? String(format: "  vision: tower memory reserved (%.1f GB resident, charged above)", Planner.visionResidentGB)
                : String(format: "  vision: images accepted — first image reserves +%.1f GB inside the target; refused if it cannot fit", Planner.visionResidentGB))
        }
        let extra = Planner.extraContextMemoryGB(maxContextTokens: maxContextTokens)
        l.append(String(
            format: "  context: up to %d tokens per request (prompt + reply%@); a full-length prompt "
                + "takes ~%@ before its first token here, follow-up turns read only what is new",
            maxContextTokens,
            extra > 0 ? String(format: ", +%.1f GB state and transient reserve charged above", extra) : "",
            PrefillSchedule.describe(seconds: estPrefillSecondsAtMaxContext)))
        if prefixCacheTokens > 0 {
            l.append(String(
                format: "  reuse:  up to %d tokens across %d conversations (~%.1f GB), so a "
                    + "follow-up turn re-prefills only what is new",
                prefixCacheTokens, PrefixCache.maxEntries,
                Planner.prefixCacheCostGB(tokens: prefixCacheTokens)))
        }
        for n in notes { l.append("  note:   \(n)") }
        return l.joined(separator: "\n")
    }

    /// Machine-readable form for /api/show.
    public func json() -> [String: Any] {
        func tenth(_ value: Double) -> Double {
            let scaled = value * 10
            return scaled.isFinite ? scaled.rounded() / 10 : value
        }
        var d: [String: Any] = [
            "source": source.rawValue,
            "experts_per_layer_cached": Int(expertsPerLayerCached.rounded()),
            "pool_slots": slots,
            "pool_gb": tenth(poolGB),
            "expected_peak_gb": tenth(expectedPeakGB),
            "device_ram_gb": tenth(ramGB),
            "device_working_set_gb": tenth(workingSetGB),
            "max_ram_percent": ramPercent,
            "availability_clamped": clamped,
            "fully_resident": fullyResident,
            "prefill_chunk": prefillChunk,
            "prefix_cache_max_tokens": prefixCacheTokens,
            "mtp": mtpEnabled,
            "vision": visionEnabled,
            "vision_resident_reserved": visionResidentReserved,
            "vision_charged_gb": visionResidentReserved ? Planner.visionResidentGB : 0,
            "vision_resident_gb": visionEnabled ? Planner.visionResidentGB : 0,
            "max_context_tokens": maxContextTokens,
            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext.isFinite
                ? estPrefillSecondsAtMaxContext as Any : NSNull(),
            "model_context_limit": ContextPolicy.modelLimit,
            "implementation_context_limit": ContextPolicy.implementationLimit,
            "mtp_context_limit": ContextPolicy.mtpLimit,
            "vision_context_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": maxPrefillWaitMinutes,
            "prefill_wait_scope": "accepted_request_to_first_model_token",
            "context_qualification": contextQualification,
            "memory_ledger": memoryLedger.json,
            // Unrounded on purpose: the banner rounds these to whole tok/s,
            // and a caller comparing two plans across a rounding boundary sees
            // a step that is not there. Anything asserting on the plan should
            // read these, not the printed line.
            "est_warm_tok_s": estWarmTokS,
            "est_prefill_tok_s": Planner.estPrefillTokS(chunk: prefillChunk),
        ]
        if let a = availableGB, a.isFinite { d["device_available_gb"] = tenth(a) }
        if let t = targetGB { d["target_gb"] = tenth(t) }
        if let policy = runtimeAllocationPolicy {
            d["runtime_prefix_cache_enabled"] = policy.prefixCacheEnabled
            if let chunk = policy.prefillChunkOverride { d["runtime_prefill_override"] = chunk }
        }
        if !notes.isEmpty { d["notes"] = notes }
        return d
    }
}

public enum Planner {
    /// Reassign only reservations already present in a resolved plan. This
    /// preserves its existing margin, active context and resident charges;
    /// it does not infer extra headroom from a short current request.
    public static func applyingRuntimePolicy(
        _ p: MemoryPlan, policy: RuntimeAllocationPolicy
    ) throws -> MemoryPlan {
        if let previous = p.runtimeAllocationPolicy {
            guard previous == policy else { throw PlanError("runtime allocation policy requires a fresh base plan") }
            return p // Never credit the same reservation twice.
        }
        let chunk = policy.prefillChunkOverride ?? p.prefillChunk
        let prefixTokens = policy.prefixCacheEnabled ? p.prefixCacheTokens : 0
        let freed = prefillCostGB(p.prefillChunk) - prefillCostGB(chunk)
            + prefixCacheCostGB(tokens: p.prefixCacheTokens) - prefixCacheCostGB(tokens: prefixTokens)
        var slots = p.slots
        if p.targetGB != nil, freed != 0 {
            let remaining = p.poolGB + freed
            guard remaining.isFinite, remaining + 1e-9 >= Geometry.gb(Geometry.floorSlots) else {
                throw PlanError("runtime prefill reservation cannot fit above the minimum expert pool; lower the chunk or raise the memory target")
            }
            slots = Geometry.slotsForPoolGB(remaining)
        }
        return MemoryPlan(source: p.source, slots: slots, targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: chunk,
            prefixCacheTokens: prefixTokens, mtpEnabled: p.mtpEnabled,
            visionEnabled: p.visionEnabled, visionResidentReserved: p.visionResidentReserved,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + (chunk != p.prefillChunk || prefixTokens != p.prefixCacheTokens
                ? ["prefill and prefix retention reservations match the explicit runtime controls"] : []),
            simulated: p.simulated, runtimeAllocationPolicy: policy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }

    /// Non-pool footprint: resident weights, the 256 MB n-gram payload plus
    /// collection overhead, Swift and MLX runtime allocations, one fixed GDN
    /// recurrent state, and a full 32k active context. Expert staging is now
    /// transferred directly into MLX in batches of at most 32 records,
    /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
    /// transient.
    public static let fixedFootprintGB = Double(PlannerCostModel.fixedBytes) / 1e9
    /// Extra slack when deriving a pool from a total-memory target, so the
    /// promise ("stays under G") survives transients.
    public static let planningMarginGB = Double(PlannerCostModel.planningMarginBytes) / 1e9

    /// What a prefill pass costs in transient activations.
    ///
    /// **Recalibrated 2026-08-30, and the old figure was costing real speed.**
    /// The previous model charged `(chunk - 256) x 1.8 MB` because it folded
    /// two different things into one term: the pass activations, which scale
    /// with the *chunk*, and the KV plus indexer state, which scales with the
    /// *context*. Conflating them made a big pass look twice as expensive as it
    /// is, so the planner kept choosing 1024 where 2048 is strictly better.
    ///
    /// Measured directly (`--memory-gb 16`, pool pinned at 77/layer, so peak
    /// minus the 14.1 GB base is the pass): chunk 1024 -> 1.30 GB, 2048 -> 2.19,
    /// 4096 -> 4.30. That is ~1.0 to 1.3 MB per chunk token, linear from zero
    /// rather than from 256. Context state is a separate ~27.6 KB per token and
    /// is genuinely small: going from a 4,016 to an 8,016-token prompt moved
    /// peak by 0.1 GB. 1.30 MB/token is charged here so the estimate errs high
    /// at every measured point.
    public static func prefillCostGB(_ chunk: Int) -> Double {
        Double(chunk) * (Double(PlannerCostModel.prefillBytesPerToken) / 1e9)
    }

    /// KV plus indexer state for a context of `tokens`, which the pool math
    /// does not model. Separate from the pass cost above because it scales with
    /// the conversation, not with the batch: a 32k prompt carries ~0.9 GB.
    public static func contextStateGB(_ tokens: Int) -> Double {
        Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
    }

    /// Context state above what the fixed footprint already covers. Zero at
    /// the default window; an explicitly larger --max-context reduces the
    /// expert pool before allocation instead of consuming the safety margin.
    public static func extraContextStateGB(maxContextTokens: Int) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens)) / 1e9
    }

    /// The larger window also needs transient headroom. A completed 65,520
    /// token check at chunk 512 peaked at 10.056 GB against the state-only
    /// plan's 9.260 GB (20 ms physical-footprint sampling, not just RSS).
    /// Reserve a full additional window's growth above the fixed footprint
    /// throughout the supported long-context range. This conservative envelope
    /// covers that measured gap without claiming its exact buffer attribution
    /// or interpolating unmeasured peaks. Ordinary windows retain their budget.
    /// See the Hermes measurement and its preserved failed run.
    public static func extraContextMemoryGB(maxContextTokens: Int, mtp: Bool = false) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens, mtp: mtp)
            + ContextMemoryLedger.transientReserveBytes(context: maxContextTokens, mtp: mtp)) / 1e9
    }

    /// Sizes the prefill pass from the same budget as the pool.
    ///
    /// Prefill is expert-stream-bound: a pass touches nearly every expert of
    /// every layer, so the whole expert set is re-read roughly once per pass
    /// and halving the number of passes halves the bytes moved. Measured on a
    /// 7,960-token prompt: 40 tok/s at 256, 50 at 512, 67 at 1024, 92 to 105 at
    /// 2048 — with byte-identical output at every size.
    ///
    /// The cap is a quarter of the pool budget, raised from a fifth once the
    /// cost above was measured honestly. The deciding experiment held total
    /// memory fixed and traded pool for pass size on a 4,021-token prompt:
    ///
    /// | chunk | pool | prefill | decode | peak |
    /// |---|---|---|---|---|
    /// | 1024 | 77/layer | 65.2 s | 7.3 s | 15.4 GB |
    /// | 2048 | 67/layer | **47.9 s** | **6.6 s** | **14.9 GB** |
    /// | 4096 | 47/layer | 42.9 s | 9.0 s | 14.4 GB |
    ///
    /// 2048 dominates 1024 on every axis, so a fifth was simply too tight; 4096
    /// buys a little more prefill and gives back more decode, so it should only
    /// be reached on a machine whose pool is already past the decode plateau —
    /// which is exactly what a proportional cap does, since there pool memory
    /// is worth nothing and pass memory is worth a lot.
    /// A request this plan is tuned for: prompt tokens, then generated tokens.
    /// Only ever used to choose the prefill pass size — never correctness.
    static let tuningPromptTokens = PlannerCostModel.tuningPromptTokens
    static let tuningReplyTokens = PlannerCostModel.tuningReplyTokens

    /// The prefill pass to run at a given pool budget: the one that finishes a
    /// representative request soonest.
    ///
    /// Pass size is a real trade, not a free choice. A bigger pass prefills
    /// faster but costs pool, and every GB it takes is expert cache the decode
    /// loop no longer has. The old rule — "biggest pass fitting in a quarter of
    /// the budget" — ignored the decode side, so crossing the quarter line
    /// doubled the pass from 2.7 to 5.3 GB and made `--memory-gb 26` plan a
    /// *smaller* cache than 25 (116 against 128 per layer) and a slower decode.
    /// Giving more memory made it slower.
    ///
    /// Scoring `prompt/prefill + reply/decode` prices both sides in the one
    /// unit that matters, seconds, and picks the trade the machine can afford:
    /// past the decode plateau a big pass is nearly free and wins, and below it
    /// the pass only grows when the prefill it buys beats the decode it costs.
    /// Swept a GB at a time from 7 to 90 GB, the estimate never gets worse as
    /// the target grows.
    public static func prefillChunkFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        // 8192 is not a candidate: nothing has measured it, and the prefill
        // schedule would cut it to 4096 on the first pass anyway
        // (PrefillSchedule.measuredQueryKeyProduct), so offering it only
        // charged 10.6 GB for a pass that never ran.
        let candidates = [256] + [512, 1024, 2048, 4096].filter {
            prefillCostGB($0) <= 0.25 * poolBudgetGB
        }
        func seconds(_ c: Int) -> Double {
            let pool = poolBudgetGB - prefillCostGB(c) - prefixCacheGB(poolBudgetGB: poolBudgetGB, contextCap: contextCap)
            let slots = Geometry.slotsForPoolGB(max(0, pool))
            let decode = estWarmTokS(expertsPerLayer: Geometry.perLayer(slots))
            return tuningPromptTokens / estPrefillTokS(chunk: c) + tuningReplyTokens / decode
        }
        // Ties (identical seconds) go to the larger pass: same request time,
        // more headroom on a prompt longer than the one we tuned for.
        return candidates.min { a, b in
            let (sa, sb) = (seconds(a), seconds(b))
            return sa != sb ? sa < sb : a > b
        } ?? 256
    }

    /// How many tokens of conversation state the prefix cache may retain.
    ///
    /// The held state is ~27 KiB per token, and this is a ceiling on the total
    /// across every conversation held, not per conversation.
    ///
    /// It **is** charged against the budget. The first design held one
    /// conversation and evicted on any miss, so exactly one state was ever live
    /// and peak was unchanged; that design was then measured against a real
    /// client and never hit at all — Open WebUI interleaves a title-generation
    /// request between turns and evicted the chat every time. Holding several
    /// conversations is what makes the cache work, and several held states are
    /// genuinely additive memory, so the budget pays for them. A tenth of the
    /// pool budget is the ceiling, capped by the context limit above which
    /// reuse is impossible anyway (a match needs `prompt.count > held.count`,
    /// and a prompt that long is already refused).
    public static func prefixCacheTokensFor(poolBudgetGB: Double, contextCap: Int = 32_768) -> Int {
        let gb = 0.10 * max(0, poolBudgetGB)
        let full = Double(contextCap) * Double(PrefixCache.bytesPerToken) / 1e9
        if gb >= full { return max(0, contextCap) }
        let toks = Int(gb * 1e9 / Double(PrefixCache.bytesPerToken))
        return max(0, min(toks, contextCap))
    }

    /// What that retention ceiling costs, which the plan reserves.
    public static func prefixCacheGB(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Double {
        prefixCacheCostGB(tokens: prefixCacheTokensFor(poolBudgetGB: poolBudgetGB, contextCap: contextCap))
    }

    /// PrefixCache evicts before a miss allocation, so no more than four
    /// states coexist: the active state already in fixedFootprintGB plus three
    /// retained states. Their fixed GDN memory is additive to KV/indexer bytes.
    public static func prefixCacheCostGB(tokens: Int) -> Double {
        guard tokens > 0 else { return 0 }
        let tokenGB = Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
        let fixedGB = Double(PrefixCache.maxEntries - 1)
            * Double(PrefixCache.fixedBytesPerEntry) / 1e9
        return tokenGB + fixedGB
    }

    /// Prefill throughput estimate for the banner, from the anchors above.
    /// Prefill throughput estimate, from measurement plus one measured ratio.
    ///
    /// 2048 is the solid anchor: **112.9 tok/s** on an 8,016-token prompt at a
    /// 16 GB target, mean of three interleaved runs. 4096 could not be measured
    /// at *its* natural home (a 36 GB target needs ~33 GB free, which has not
    /// been available), so it is derived from a ratio measured at a matched
    /// pool of 60 experts/layer, where 4096 beat 2048 in all three paired
    /// rounds — 108.8/96.6, 92.2/76.3, 103.9/91.4, a mean 101.6 against 88.1,
    /// or 1.15x. Applied to the anchor that implies ~130; 125 is quoted so the
    /// estimate stays under the evidence rather than over it, and 8192 is not
    /// credited with any further gain because nothing has measured one.
    ///
    /// Caveat this does not model: prefill also depends on pool size, because
    /// a bigger cache means fewer expert misses per pass. The same chunk gives
    /// 88 tok/s at 60 experts/layer and 113 at 67, so treat these as typical
    /// for a machine that would *choose* that chunk, not as a pure function.
    public static func estPrefillTokS(chunk: Int) -> Double {
        // The sweep's ladder on the 8k acceptance prompt at a matched pool of
        // 60 experts per layer (MEASUREMENTS.md, "N2 — the prefill sweep"):
        // 88 / 128 / 169 / 211 / 222 tok/s from 256 to 4096, rounded down.
        // The floor's 256-token pass read 88 at 13 per layer too: below 1024
        // the pass is read-bound and the pool barely matters. Ordinary prose
        // reads about 40% slower than this prompt at every size; these are the
        // acceptance prompt's numbers, as the previous ladder's were.
        switch chunk {
        case ..<512: return PlannerCostModel.prefill256TokensPerSecond
        case ..<1024: return PlannerCostModel.prefill512TokensPerSecond
        case ..<2048: return PlannerCostModel.prefill1024TokensPerSecond
        case ..<4096: return PlannerCostModel.prefill2048TokensPerSecond
        default: return PlannerCostModel.prefill4096TokensPerSecond
        }
    }
    /// Smallest honest total-memory target: floor pool + footprint + margin.
    public static var minMemoryGB: Double {
        ((Geometry.gb(Geometry.floorSlots) + fixedFootprintGB + planningMarginGB) * 10)
            .rounded(.up) / 10
    }

    /// Memory reclaimable RIGHT NOW without compressing or swapping any other
    /// process's memory: free pages (the raw counter includes speculative) +
    /// purgeable + file-backed cache. Deliberately NOT `kern.memorystatus_level`
    /// (the `memory_pressure` "free percentage"): that counts other apps'
    /// compressible/swappable memory as available, and sizing a GPU pool
    /// against it is exactly how you cause the swap storm. nil if the mach
    /// call fails (then no clamp is applied).
    /// Test seam: when set, stands in for the live availability reading so the
    /// governor can be driven without putting the machine under real memory
    /// pressure. Never set in normal operation.
    ///
    /// **It does not make the resulting allocation imaginary.** The governor
    /// acts on this number, so setting it *above* what the machine has makes it
    /// allocate a pool the machine cannot hold: simulating 60 GB free on a Mac
    /// with 7 GB took a real 25 GB pool and drove tens of GB of swap. Anything
    /// using this seam must bound the value by `deviceAvailableGB()`.
    public nonisolated(unsafe) static var availabilityOverride: Double?

    /// Headroom kept between our expected peak and what is reclaimable, so
    /// claiming it doesn't leave the machine at zero.
    public static func availabilitySlackGB(ramGB: Double) -> Double {
        max(1.5, 0.05 * ramGB)
    }

    /// The share of RAM auto may target before other limits apply. Overridable
    /// per run with --max-ram-percent; it binds on small machines, where the
    /// cache is starved and every GB still buys speed.
    public static let defaultRAMPercent = 70.0

    /// Auto will not target more than this, however large the machine.
    ///
    /// This is the knee of the whole plan, not a politeness limit: 33 GB is the
    /// smallest target at which **both** numbers reach the best the
    /// measurements support — the expert cache clears the decode plateau
    /// (11.2 tok/s at 120 experts/layer, 11.6 at 150, flat after) *and* the
    /// budget still affords the 4096-token prefill pass (125 tok/s against 113
    /// at 2048). Swept a GB at a time, nothing between 34 and 84 GB improves
    /// either number.
    ///
    /// So the old 70%-of-RAM policy was right for a 48 GB Mac by luck — it
    /// landed near this knee — and wrong everywhere above: a 128 GB Mac
    /// targeted 89.6 GB to run at exactly the same estimated speed.
    ///
    /// Not a hard limit: --memory-gb N goes past it deliberately, which is how
    /// a large machine explores full residency (all 512/layer needs about
    /// 84 GB and has never been measured). The one unreproduced hint of a
    /// further decode step, 20 tok/s at 181/layer, is why that door stays open.
    public static let usefulCeilingGB = 33.0

    /// Auto policy: never target more than the cache can use, leave a share of
    /// RAM to the OS and the user's other apps, and stay 2 GB under the Metal
    /// recommended working set — whichever binds first.
    public static func autoTargetGB(
        ramGB: Double, workingSetGB: Double, ramPercent: Double = defaultRAMPercent,
        ceilingGB: Double = usefulCeilingGB
    ) -> Double {
        min(ceilingGB, (ramPercent / 100) * ramGB, workingSetGB - 2.0)
    }

    /// Warm decode estimate, re-anchored 2026-08-30 on measured points.
    ///
    /// The old curve interpolated between 30/layer = 5.6 and 181/layer = 20.0
    /// and **over-promised by 25 to 45% across the middle of its own range**,
    /// which is the part most machines actually land in. Re-measured on 0.1.6
    /// with the pool properly warmed (throughput plateaus by the second
    /// generation, so three samples is enough — verified over 14 consecutive
    /// runs):
    ///
    /// | experts/layer | measured | old estimate |
    /// |---|---|---|
    /// | 30 | 6.0 | 5.6 |
    /// | 60 | 8.2 | 9.2 |
    /// | 120 | 11.2 | 14.8 |
    /// | 150 | 11.6 | 17.3 |
    ///
    /// It is also nearly flat from 120 to 150, so the plateau starts far below
    /// the 181 the old curve assumed. The 20.0 figure at 181/layer could not be
    /// re-verified: that config peaks at 27.4 GB and the machine had 26.6 GB
    /// reclaimable, and forcing it once already drove 13 GB of swap. One run
    /// under that pressure produced a 15 to 18 band, consistent with a
    /// threshold once the working set fits, but it is not a clean measurement.
    ///
    /// So this now interpolates the verified points and **holds flat above
    /// them** rather than extrapolating to an unconfirmed number. It
    /// under-promises above 150/layer on purpose: a plan that quotes a speed
    /// the machine does not reach is worse than one that quotes less.
    /// Where the measured decode curve stops improving: 11.2 tok/s at 120
    /// experts/layer, 11.6 at 150, flat after. Both the estimate and the
    /// prefill-pass sizing key off this one number.
    public static let decodePlateauPerLayer = PlannerCostModel.decodePlateauPerLayer

    public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
        let (e0, r0) = (PlannerCostModel.decodeLowExpertsPerLayer, PlannerCostModel.decodeLowTokensPerSecond)
        let (e1, r1) = (decodePlateauPerLayer, PlannerCostModel.decodePlateauTokensPerSecond)
        if e >= e1 { return r1 }
        if e <= e0 { return r0 * (max(e, 1) / e0) }
        let t = log(e / e0) / log(e1 / e0)
        return r0 * pow(r1 / r0, t)
    }

    /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
    /// activations and cache growth ride the existing margins).
    public static let mtpResidentGB = Double(PlannerCostModel.mtpResidentBytes) / 1e9

    /// The vision tower's resident cost, paid only by a process that is handed
    /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
    /// checkpoint's own header (`VisionTower.residentBytes`), rounded up.
    ///
    /// Engine reserves this inside a target-driven plan before loading the
    /// tower. A raw pool-size request keeps that explicit pool size and reports
    /// the additional resident bytes in its expected peak.
    public static let visionResidentGB = Double(PlannerCostModel.visionResidentBytes) / 1e9

    /// Headroom demanded on top of the tower's own bytes before loading it.
    /// The load briefly holds arrays twice while MLX materializes them.
    /// Attention transients depend on the actual dispatch: the established
    /// 72-wide fallback can form an N² matrix and are not bounded by this term.
    public static let visionLoadMarginGB = Double(PlannerCostModel.visionLoadMarginBytes) / 1e9
    /// Auto enables the draft head only when the cache still affords this
    /// many experts per layer AFTER paying for it (M9 design note: below
    /// ~120/layer the displaced experts are worth more than the multiplier;
    /// past the ~150/layer plateau they are worth nothing).
    public static let mtpAutoFloorPerLayer = 120.0

    /// Pool budget before the prefill pass takes its share.
    public static func poolBudgetGB(_ targetGB: Double) -> Double {
        targetGB - fixedFootprintGB - planningMarginGB
    }

    public static func slotsForTarget(_ targetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        let budget = poolBudgetGB(targetGB)
        let pool = budget - prefillCostGB(prefillChunkFor(poolBudgetGB: budget, contextCap: contextCap))
            - prefixCacheGB(poolBudgetGB: budget, contextCap: contextCap)
        return Geometry.slotsForPoolGB(pool)
    }

    /// Resolve the knobs. Precedence: --experts-per-layer > --pool-gb >
    /// --memory-gb > auto. Losing knobs are noted, never silently dropped.
    ///
    /// Auto (and only auto) also clamps to what is reclaimable right now, so a
    /// busy machine degrades gracefully instead of swap-storming — explicit
    /// knobs mean the user chose, so they only get an informational note. On a
    /// quiet machine the clamp never binds and auto stays deterministic.
    public enum MTPMode: String, Sendable, Codable {
        case on, off, auto
    }

    /// Whether this process will answer requests that carry images. `auto` is
    /// "yes when the checkpoint has a tower", which the shipped one does.
    public enum VisionMode: String, Sendable, Codable {
        case on, off, auto
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: nil)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: runtimePolicy)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil
    ) throws -> MemoryPlan {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) { throw PlanError(why) }
        // The fixed footprint pays for the default context; larger windows
        // reduce the pool budget by their additional active state and measured
        // transient envelope, before sizing either the pool or prefill pass.
        let contextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens)
            + (visionResidentReserved ? visionResidentGB : 0)
        let mtpContextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens, mtp: true)
            - extraContextMemoryGB(maxContextTokens: maxContextTokens)
        let mtpTotalCharge = mtpResidentGB + mtpContextCharge
        let ram = ramGB ?? deviceRAMGB()
        let ws = workingSetGB ?? deviceWorkingSetGB()
        let avail = availableGB ?? deviceAvailableGB()
        let pct = ramPercent ?? defaultRAMPercent
        guard ram.isFinite, ram > 0 else {
            throw PlanError("RAM must be a finite number > 0")
        }
        guard ws.isFinite, ws > 0 else {
            throw PlanError("Metal working-set size must be a finite number > 0")
        }
        // +infinity is meaningful here: it is how doctor --sim-ram says
        // "availability is not a constraint on this simulated machine". Only
        // NaN and negatives are garbage.
        if let a = avail, a.isNaN || a < 0 {
            throw PlanError("available memory must be a number >= 0")
        }
        guard pct.isFinite, pct > 0, pct <= 100 else {
            throw PlanError(String(
                format: "--max-ram-percent %.0f is out of range — give a share between 1 and 100",
                pct))
        }
        var notes: [String] = []
        var clamped = false
        if ramPercent != nil, expertsPerLayer != nil || poolGB != nil || memoryGB != nil {
            notes.append("--max-ram-percent ignored (it only bounds auto; an explicit memory knob is already the target)")
        }
        if vision == .on, !visionAvailable {
            throw PlanError(
                "--vision on, but this checkpoint has no vision_tower tensors — it is a "
                    + "text-only model; use --vision auto/off")
        }
        let visionOn = vision != .off && visionAvailable
        guard !visionResidentReserved || visionOn else {
            throw PlanError("a loaded vision tower requires an available, enabled vision model")
        }
        if mtp == .on, !mtpAvailable {
            throw PlanError(
                "--mtp on, but mtp.safetensors is not next to the model — the draft head "
                    + "is a separate 1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); convert it first or use --mtp auto/off")
        }

        /// The draft-head decision for a pool of `slots` when the head costs
        /// pool budget (target-driven sources already shrank the pool).
        if mtp == .on, maxContextTokens > ContextPolicy.mtpLimit, !qualification {
            throw PlanError("MTP is qualified only through \(ContextPolicy.mtpLimit) tokens; use --mtp off at this window")
        }
        if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit {
            notes.append("MTP stays off because this context exceeds its qualified window")
        }
        func resolveMTP(slotsAfterCharge: Int) -> Bool {
            if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit { return false }
            switch mtp {
            case .off: return false
            case .on: return true
            case .auto:
                return mtpAvailable
                    && Geometry.perLayer(slotsAfterCharge) >= mtpAutoFloorPerLayer
            }
        }

        func finish(
            _ source: MemoryPlan.Source, _ slots: Int, target: Double?, mtpOn: Bool
        ) throws -> MemoryPlan {
            // An explicit pool knob states the cache size, not the whole budget,
            // so size the prefill pass from the pool the user asked for.
            let mtpCharge = mtpOn ? mtpResidentGB + mtpContextCharge : 0
            let budgetForCaches = target.map { poolBudgetGB($0) - mtpCharge - contextCharge }
                ?? Geometry.gb(slots)
            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens)
            let capped = min(slots, Geometry.totalRecords)
            let floored = max(capped, Geometry.floorSlots)
            if floored > capped {
                notes.append(String(
                    format: "raised to the floor of %d slots (~%.0f/layer): below it a prefill chunk can pin every slot",
                    Geometry.floorSlots, Geometry.perLayer(Geometry.floorSlots)))
            }
            let peak = Geometry.gb(floored) + fixedFootprintGB + prefillCostGB(chunk)
                + prefixCacheGB(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens) + mtpCharge + contextCharge
            if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                notes.append(String(
                    format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
                    peak, ws))
            }
            // Explicit raw knobs: warn (don't resize) when the machine is busy.
            if source == .expertsPerLayer || source == .poolGB, let a = avail, peak > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory (auto would size to the machine)",
                    a))
            }
            let base = MemoryPlan(
                source: source, slots: floored, targetGB: target,
                ramGB: ram, workingSetGB: ws, ramPercent: pct,
                availableGB: avail, clamped: clamped,
                prefillChunk: chunk,
                prefixCacheTokens: prefixCacheTokensFor(
                    poolBudgetGB: budgetForCaches, contextCap: maxContextTokens),
                mtpEnabled: mtpOn,
                visionEnabled: visionOn,
                visionResidentReserved: visionResidentReserved,
                maxContextTokens: maxContextTokens,
                notes: notes,
                simulated: simulated, contextQualification: qualification)
            let resolved = try runtimePolicy.map { try applyingRuntimePolicy(base, policy: $0) } ?? base
            let bytes = resolved.memoryLedger.expectedPeakBytes
            if maxContextTokens > ContextPolicy.defaultTokens || visionResidentReserved {
                if let target, Double(bytes) > target * 1e9 {
                    throw PlanError("insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target")
                }
                let physical = min(ws, (avail ?? ws) - availabilitySlackGB(ramGB: ram))
                if Double(bytes) > physical * 1e9 {
                    throw PlanError("insufficient_memory: requested context and expert pool exceed reclaimable memory with safety headroom or the Metal working set")
                }
            }
            return resolved
        }

        if let n = expertsPerLayer {
            guard n >= 1 else { throw PlanError("--experts-per-layer must be ≥ 1") }
            if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
            let slots = min(n, Geometry.expertsPerLayer) * Geometry.layers
            return try finish(.expertsPerLayer, slots, target: nil, mtpOn: resolveMTP(slotsAfterCharge: slots))
        }
        if let g = poolGB {
            guard g.isFinite, g > 0 else {
                throw PlanError("--pool-gb must be a finite number > 0")
            }
            if memoryGB != nil { notes.append("--memory-gb ignored (--pool-gb takes precedence)") }
            // Preserve a below-floor request so `finish` can explain that it
            // raised it; cap before Double->Int so huge finite input is safe.
            let requested = g >= Geometry.gb(Geometry.totalRecords)
                ? Geometry.totalRecords : Int(g * 1e9 / Geometry.recordBytes)
            return try finish(.poolGB, requested, target: nil, mtpOn: resolveMTP(slotsAfterCharge: requested))
        }
        if let m = memoryGB {
            guard m.isFinite else { throw PlanError("--memory-gb must be finite") }
            guard m >= minMemoryGB else {
                throw PlanError(String(
                    format: "--memory-gb %.1f is below the minimum %.1f GB (floor cache of ~%.0f experts/layer = %.1f GB pool, plus the %.1f GB fixed footprint of resident weights + n-gram cache, plus %.1f GB margin)",
                    m, minMemoryGB, Geometry.perLayer(Geometry.floorSlots),
                    Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                    planningMarginGB))
            }
            if m > ws {
                notes.append(String(
                    format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
                    m, ws, max(minMemoryGB, autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct))))
            }
            if let a = avail, m > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory",
                    a))
            }
            var mtpOn = resolveMTP(
                slotsAfterCharge: slotsForTarget(max(m - mtpTotalCharge - contextCharge, minMemoryGB), contextCap: maxContextTokens))
            if mtpOn, m - mtpTotalCharge - contextCharge < minMemoryGB {
                if mtp == .on {
                    throw PlanError(String(
                        format: "--memory-gb %.1f cannot fit the %.1f GB draft head above the %.1f GB minimum — raise the target or drop --mtp on",
                        m, mtpTotalCharge, minMemoryGB))
                }
                mtpOn = false
            }
            let slots = slotsForTarget(m - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
            return try finish(.memoryGB, slots, target: m, mtpOn: mtpOn)
        }

        // auto: the default. The draft head is worth its 1.6 GB only when the
        // cache still reaches ~120+ experts/layer after paying for it, and
        // past the decode knee that RAM buys nothing else — so when the head
        // is on, the ceiling rises by exactly its cost.
        let mtpWanted = mtp != .off && mtpAvailable
            && (mtp == .on || maxContextTokens <= ContextPolicy.mtpLimit)
        func autoRaw(ceilingGB: Double) -> (Double, Bool) {
            let c = autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: ceilingGB)
            var raw = c
            var didClamp = false
            if let a = avail, a - availabilitySlackGB(ramGB: ram) < raw {
                raw = a - availabilitySlackGB(ramGB: ram)
                didClamp = true
            }
            return (raw, didClamp)
        }
        var mtpOn = false
        if mtpWanted {
            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpTotalCharge)
            let targetM = max(minMemoryGB, rawM)
            let charged = targetM - mtpTotalCharge - contextCharge
            mtpOn = charged >= minMemoryGB
                && (mtp == .on
                    || Geometry.perLayer(slotsForTarget(charged, contextCap: maxContextTokens)) >= mtpAutoFloorPerLayer)
        }
        if mtp == .on, !mtpOn {
            throw PlanError("insufficient_memory: auto cannot keep the requested MTP head loaded at this context; close other apps or use --mtp off")
        }
        // `ceiling` is what this machine's auto would pick unclamped (the
        // notes below compare against it); the knee itself rises by the
        // head's cost when the head is on.
        let kneeGB = usefulCeilingGB + (mtpOn ? mtpTotalCharge : 0)
        let ceiling = autoTargetGB(
            ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: kneeGB)
        let raw: Double
        (raw, clamped) = autoRaw(ceilingGB: kneeGB)
        let target = max(minMemoryGB, raw)
        if mtpOn, target - mtpTotalCharge - contextCharge < minMemoryGB { mtpOn = false }
        // Exactly one note tells the story of why the target is what it is.
        if raw < minMemoryGB, ceiling < minMemoryGB {
            notes.append(String(
                format: "this machine (%.0f GB RAM) is below the comfortable minimum — running at the %.1f GB floor; expect slow decode and close other apps",
                ram, minMemoryGB))
        } else if raw < minMemoryGB {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now — running at the %.1f GB floor anyway; expect heavy paging until other apps release memory",
                avail ?? 0, ram, minMemoryGB))
        } else if clamped {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual %.1f GB; close apps and restart for full speed, or force a size with --memory-gb",
                avail ?? 0, ram, ceiling))
        } else if ceiling >= kneeGB,
            min((pct / 100) * ram, ws - 2.0) > 1.25 * kneeGB
        {
            // This machine could hold more and auto declined. Say so, or it
            // reads as slotstream failing to use the hardware.
            notes.append(String(
                format: "this machine could hold more, but decode stops improving around here (measured 11.2 tok/s at 120 experts/layer, 11.6 at 150) — auto caps at %.1f GB rather than spend RAM for nothing; --memory-gb N to go further",
                usefulCeilingGB))
        }
        let slots = slotsForTarget(target - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
        return try finish(.auto, slots, target: target, mtpOn: mtpOn)
    }

    /// Resolve the first image against the existing policy, before allocating
    /// its tower. The source and target remain the user's original decision.
    public static func loadingVision(_ p: MemoryPlan) throws -> MemoryPlan {
        guard p.visionEnabled else { throw PlanError("vision is disabled") }
        if p.visionResidentReserved { return p }
        var sized: MemoryPlan
        if let target = p.targetGB {
            sized = try plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB,
                mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                vision: .on, visionAvailable: true, visionResidentReserved: true,
                maxContextTokens: p.maxContextTokens, simulated: p.simulated, qualification: p.contextQualification,
                runtimePolicy: p.runtimeAllocationPolicy)
        } else { sized = p }
        // Loading a tower never justifies restoring capacity already donated
        // by the governor. Its original target can outlive a pressure shrink.
        return MemoryPlan(source: p.source, slots: min(p.slots, sized.slots), targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: min(p.prefillChunk, sized.prefillChunk),
            prefixCacheTokens: min(p.prefixCacheTokens, sized.prefixCacheTokens), mtpEnabled: p.mtpEnabled,
            visionEnabled: true, visionResidentReserved: true,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + ["vision tower resident memory reserved before loading"], simulated: p.simulated,
            runtimeAllocationPolicy: p.runtimeAllocationPolicy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/after/Sources/Slotstream/PlannerCostModel.swift

SHA-256 `a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0`; 1361 bytes.

````text
// One versioned empirical envelope for planning, reporting and dispatch guards.
// These are the existing conservative allowances and throughput anchors. This
// consolidation grants no new memory credit and claims no new speedup. Update
// the family only with a complete measured envelope and policy comparison.
package enum PlannerCostModel {
    package static let identity = "m5-pro-reference-envelope-v1"
    package static let fixedBytes = 5_300_000_000
    package static let planningMarginBytes = 1_000_000_000
    package static let prefillBytesPerToken = 1_300_000
    package static let mtpResidentBytes = 1_600_000_000
    package static let visionResidentBytes = 900_000_000
    package static let visionLoadMarginBytes = 1_000_000_000
    package static let tuningPromptTokens = 2000.0
    package static let tuningReplyTokens = 400.0
    package static let decodeLowExpertsPerLayer = 30.0
    package static let decodeLowTokensPerSecond = 6.0
    package static let decodePlateauPerLayer = 150.0
    package static let decodePlateauTokensPerSecond = 11.6
    package static let prefill256TokensPerSecond = 85.0
    package static let prefill512TokensPerSecond = 125.0
    package static let prefill1024TokensPerSecond = 165.0
    package static let prefill2048TokensPerSecond = 205.0
    package static let prefill4096TokensPerSecond = 220.0
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/before/Sources/Slotstream/ContextMemory.swift

SHA-256 `1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683`; 13753 bytes.

````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = 5_300_000_000
        poolBytes = ContextBytes.product(slots, 2_764_800)
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, 1_300_000)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? 1_600_000_000 : 0
        visionResidentBytes = visionResident ? 900_000_000 : 0
        planningMarginBytes = 1_000_000_000
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), 1_300_000),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/before/Sources/Slotstream/Plan.swift

SHA-256 `d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7`; 57154 bytes.

````text
// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Foundation

/// Model geometry the cache math speaks in. The planner needs these before the
/// checkpoint is opened, so they are constants — `check(against:recordBytes:)`
/// rejects a checkpoint that does not match once the engine has it.
public enum Geometry {
    public static let layers = 48
    public static let expertsPerLayer = 512
    public static let recordBytes = 2_764_800.0
    public static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    public static let floorSlots = 640

    public static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    public static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
    /// Convert a raw GB budget without ever converting an attacker-sized
    /// Double directly to Int (which traps in Swift when it is out of range).
    public static func slotsForPoolGB(_ poolGB: Double) -> Int {
        guard poolGB.isFinite else { return poolGB > 0 ? totalRecords : floorSlots }
        if poolGB >= gb(totalRecords) { return totalRecords }
        if poolGB <= gb(floorSlots) { return floorSlots }
        return Int(poolGB * 1e9 / recordBytes)
    }
    /// GB of pool per expert-per-layer (N experts/layer costs N × this).
    public static var gbPerExpertPerLayer: Double { Double(layers) * recordBytes / 1e9 }

    /// The planner sizes memory from the constants above while the engine
    /// allocates from config.json. If they ever disagree, every memory number
    /// the user is shown is wrong, so fail loudly instead of drifting.
    public static func check(against cfg: ModelConfig, recordBytes actual: Int) throws {
        guard cfg.numLayers == layers, cfg.numExperts == expertsPerLayer,
            Double(actual) == recordBytes
        else {
            throw ModelError(
                "model geometry does not match the supported checkpoint: config has "
                    + "\(cfg.numLayers) layers x \(cfg.numExperts) experts x \(actual) "
                    + "B/record, expected \(layers) x \(expertsPerLayer) x "
                    + "\(Int(recordBytes)) B — check --model")
        }
    }
}

public struct PlanError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

/// Explicit process controls whose unused reservations can become expert
/// capacity. Kept with the plan so vision loading and the governor cannot
/// silently restore an allocation after its budget has been spent.
public struct RuntimeAllocationPolicy: Equatable, Sendable {
    public let prefillChunkOverride: Int?
    public let prefixCacheEnabled: Bool

    public init(prefillChunkOverride: Int? = nil, prefixCacheEnabled: Bool = true) throws {
        if let chunk = prefillChunkOverride, !(256 ... 4096).contains(chunk) {
            throw PlanError("runtime allocation planning requires a prefill chunk between 256 and 4096")
        }
        self.prefillChunkOverride = prefillChunkOverride
        self.prefixCacheEnabled = prefixCacheEnabled
    }
}

/// The resolved memory decision: which knob decided it, what it costs, and
/// what to expect. Everything user-facing about memory comes from here.
public struct MemoryPlan {
    public enum Source: String {
        case expertsPerLayer = "--experts-per-layer"
        case poolGB = "--pool-gb"
        case memoryGB = "--memory-gb"
        case auto = "auto"
    }

    public let source: Source
    public let slots: Int
    /// Total-process target in GB when the plan came from --memory-gb or auto.
    public let targetGB: Double?
    public let ramGB: Double
    public let workingSetGB: Double
    /// The RAM share auto was allowed (--max-ram-percent, default 70). Carried
    /// so the elastic governor grows back to the user's policy, not the default.
    public let ramPercent: Double
    /// Memory reclaimable at planning time (nil = could not be read).
    public let availableGB: Double?
    /// True when auto sized itself down because of what other apps hold now.
    public let clamped: Bool
    /// Tokens per prefill pass, chosen with the pool from the same budget.
    public let prefillChunk: Int
    /// Conversation state the prefix cache may retain, in tokens. Sized and
    /// charged from the same budget as the pool.
    public let prefixCacheTokens: Int
    /// Whether the MTP draft head loads (self-speculative decode). Charged as
    /// a fixed resident block; the pool is sized from what remains.
    public let mtpEnabled: Bool
    /// Whether an image request may load the tower in this process.
    public let visionEnabled: Bool
    /// A loaded tower is charged inside the total-process target. Merely
    /// accepting images does not take expert capacity from text requests.
    public let visionResidentReserved: Bool
    /// True when this plan was made for a simulated device (`doctor --sim-*`).
    /// Such a plan may be printed and compared, never loaded: a simulated
    /// availability figure still produces a real allocation.
    public var simulated = false
    /// Longest prompt plus reply a request may hold (`--max-context`). State
    /// for the first `ContextPolicy.tokensInFixedFootprint` tokens is inside
    /// the fixed footprint; anything above is charged separately.
    public let maxContextTokens: Int
    public let notes: [String]
    public let runtimeAllocationPolicy: RuntimeAllocationPolicy?
    public let maxPrefillWaitMinutes: Double
    public let contextQualification: Bool

    public init(
        source: Source, slots: Int, targetGB: Double?,
        ramGB: Double, workingSetGB: Double, ramPercent: Double,
        availableGB: Double?, clamped: Bool,
        prefillChunk: Int, prefixCacheTokens: Int, mtpEnabled: Bool = false,
        visionEnabled: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        notes: [String], simulated: Bool = false,
        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false
    ) {
        self.source = source
        self.slots = slots
        self.targetGB = targetGB
        self.ramGB = ramGB
        self.workingSetGB = workingSetGB
        self.ramPercent = ramPercent
        self.availableGB = availableGB
        self.clamped = clamped
        self.prefillChunk = prefillChunk
        self.prefixCacheTokens = prefixCacheTokens
        self.mtpEnabled = mtpEnabled
        self.visionEnabled = visionEnabled
        self.visionResidentReserved = visionResidentReserved
        self.maxContextTokens = maxContextTokens
        self.notes = notes
        self.simulated = simulated
        self.runtimeAllocationPolicy = runtimeAllocationPolicy
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.contextQualification = contextQualification
    }

    public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
    public var poolGB: Double { Geometry.gb(slots) }
    public var memoryLedger: ContextMemoryLedger {
        ContextMemoryLedger(slots: slots, context: maxContextTokens, chunk: prefillChunk,
            retentionTokens: prefixCacheTokens, mtp: mtpEnabled, visionResident: visionResidentReserved)
    }
    public var expectedPeakGB: Double { Double(memoryLedger.expectedPeakBytes) / 1e9 }

    public func withRequestPolicy(_ configuration: ContextConfiguration) throws -> MemoryPlan {
        guard configuration.maxContextTokens == maxContextTokens else {
            throw PlanError("request policy must use the context window priced by the memory plan")
        }
        return MemoryPlan(source: source, slots: slots, targetGB: targetGB, ramGB: ramGB,
            workingSetGB: workingSetGB, ramPercent: ramPercent, availableGB: availableGB, clamped: clamped,
            prefillChunk: prefillChunk, prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
            maxContextTokens: maxContextTokens, notes: notes, simulated: simulated,
            runtimeAllocationPolicy: runtimeAllocationPolicy,
            maxPrefillWaitMinutes: configuration.maxPrefillWaitMinutes,
            contextQualification: configuration.qualification)
    }
    /// Seconds a prompt filling the whole context takes before its first
    /// token, priced through the prefill schedule this plan runs.
    public var estPrefillSecondsAtMaxContext: Double {
        PrefillSchedule.estSeconds(tokens: maxContextTokens, maxChunk: prefillChunk)
    }
    public var estWarmTokS: Double { Planner.estWarmTokS(expertsPerLayer: expertsPerLayerCached) }
    public var fullyResident: Bool { slots >= Geometry.totalRecords }

    /// The startup announce: device, decision, expectation, override hint.
    public func banner() -> String {
        var l: [String] = []
        l.append("slotstream memory plan (\(source.rawValue))")
        if let a = availableGB, a.isFinite {
            l.append(String(
                format: "  device: %.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                ramGB, a, workingSetGB))
        } else {
            l.append(String(
                format: "  device: %.0f GB RAM, %.1f GB Metal working set", ramGB, workingSetGB))
        }
        if let t = targetGB {
            let hint = source == .auto
                ? "   (override: --memory-gb N | --max-ram-percent P)"
                : ""
            l.append(String(format: "  target: %.1f GB total for this process%@", t, hint))
        }
        if fullyResident {
            l.append(String(
                format: "  cache:  all %d experts per layer resident (%.1f GB pool)",
                Geometry.expertsPerLayer, poolGB))
        } else {
            l.append(String(
                format: "  cache:  ~%.0f of %d experts per layer  (%d global slots = %.1f GB pool)",
                expertsPerLayerCached, Geometry.expertsPerLayer, slots, poolGB))
        }
        l.append(String(
            format: "  expect: ~%.1f GB peak, ~%.0f tok/s warm decode (est. from M5 Pro anchors)",
            expectedPeakGB, estWarmTokS))
        // The decode curve is a function of experts per layer alone. It carries
        // no term for read bandwidth, and it was anchored on a 17.3 GB/s SSD
        // (MEASUREMENTS, M0.5). The first machine measured that was not the dev
        // Mac reads at 1.5 GB/s, where the misses of a single token cost more
        // time than the whole estimated step (MEASUREMENTS, C1). Until the
        // planner can measure this disk and price those reads, the estimate
        // says out loud what it assumes rather than quietly assuming it.
        l.append(
            "  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). "
            + "A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 "
            + "estimate, so on base storage expect well under the number above — see docs/HARDWARE.md")
        l.append(String(
            format: "  prefill: %d tokens per pass (~%.0f tok/s here; costs ~%.1f GB of the target)",
            prefillChunk, Planner.estPrefillTokS(chunk: prefillChunk),
            Planner.prefillCostGB(prefillChunk)))
        if mtpEnabled {
            l.append(String(
                format: "  mtp:    draft head on — speculative decode (%.1f GB resident, charged above)",
                Planner.mtpResidentGB))
        }
        if visionEnabled {
            l.append(visionResidentReserved
                ? String(format: "  vision: tower memory reserved (%.1f GB resident, charged above)", Planner.visionResidentGB)
                : String(format: "  vision: images accepted — first image reserves +%.1f GB inside the target; refused if it cannot fit", Planner.visionResidentGB))
        }
        let extra = Planner.extraContextMemoryGB(maxContextTokens: maxContextTokens)
        l.append(String(
            format: "  context: up to %d tokens per request (prompt + reply%@); a full-length prompt "
                + "takes ~%@ before its first token here, follow-up turns read only what is new",
            maxContextTokens,
            extra > 0 ? String(format: ", +%.1f GB state and transient reserve charged above", extra) : "",
            PrefillSchedule.describe(seconds: estPrefillSecondsAtMaxContext)))
        if prefixCacheTokens > 0 {
            l.append(String(
                format: "  reuse:  up to %d tokens across %d conversations (~%.1f GB), so a "
                    + "follow-up turn re-prefills only what is new",
                prefixCacheTokens, PrefixCache.maxEntries,
                Planner.prefixCacheCostGB(tokens: prefixCacheTokens)))
        }
        for n in notes { l.append("  note:   \(n)") }
        return l.joined(separator: "\n")
    }

    /// Machine-readable form for /api/show.
    public func json() -> [String: Any] {
        func tenth(_ value: Double) -> Double {
            let scaled = value * 10
            return scaled.isFinite ? scaled.rounded() / 10 : value
        }
        var d: [String: Any] = [
            "source": source.rawValue,
            "experts_per_layer_cached": Int(expertsPerLayerCached.rounded()),
            "pool_slots": slots,
            "pool_gb": tenth(poolGB),
            "expected_peak_gb": tenth(expectedPeakGB),
            "device_ram_gb": tenth(ramGB),
            "device_working_set_gb": tenth(workingSetGB),
            "max_ram_percent": ramPercent,
            "availability_clamped": clamped,
            "fully_resident": fullyResident,
            "prefill_chunk": prefillChunk,
            "prefix_cache_max_tokens": prefixCacheTokens,
            "mtp": mtpEnabled,
            "vision": visionEnabled,
            "vision_resident_reserved": visionResidentReserved,
            "vision_charged_gb": visionResidentReserved ? Planner.visionResidentGB : 0,
            "vision_resident_gb": visionEnabled ? Planner.visionResidentGB : 0,
            "max_context_tokens": maxContextTokens,
            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext.isFinite
                ? estPrefillSecondsAtMaxContext as Any : NSNull(),
            "model_context_limit": ContextPolicy.modelLimit,
            "implementation_context_limit": ContextPolicy.implementationLimit,
            "mtp_context_limit": ContextPolicy.mtpLimit,
            "vision_context_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": maxPrefillWaitMinutes,
            "prefill_wait_scope": "accepted_request_to_first_model_token",
            "context_qualification": contextQualification,
            "memory_ledger": memoryLedger.json,
            // Unrounded on purpose: the banner rounds these to whole tok/s,
            // and a caller comparing two plans across a rounding boundary sees
            // a step that is not there. Anything asserting on the plan should
            // read these, not the printed line.
            "est_warm_tok_s": estWarmTokS,
            "est_prefill_tok_s": Planner.estPrefillTokS(chunk: prefillChunk),
        ]
        if let a = availableGB, a.isFinite { d["device_available_gb"] = tenth(a) }
        if let t = targetGB { d["target_gb"] = tenth(t) }
        if let policy = runtimeAllocationPolicy {
            d["runtime_prefix_cache_enabled"] = policy.prefixCacheEnabled
            if let chunk = policy.prefillChunkOverride { d["runtime_prefill_override"] = chunk }
        }
        if !notes.isEmpty { d["notes"] = notes }
        return d
    }
}

public enum Planner {
    /// Reassign only reservations already present in a resolved plan. This
    /// preserves its existing margin, active context and resident charges;
    /// it does not infer extra headroom from a short current request.
    public static func applyingRuntimePolicy(
        _ p: MemoryPlan, policy: RuntimeAllocationPolicy
    ) throws -> MemoryPlan {
        if let previous = p.runtimeAllocationPolicy {
            guard previous == policy else { throw PlanError("runtime allocation policy requires a fresh base plan") }
            return p // Never credit the same reservation twice.
        }
        let chunk = policy.prefillChunkOverride ?? p.prefillChunk
        let prefixTokens = policy.prefixCacheEnabled ? p.prefixCacheTokens : 0
        let freed = prefillCostGB(p.prefillChunk) - prefillCostGB(chunk)
            + prefixCacheCostGB(tokens: p.prefixCacheTokens) - prefixCacheCostGB(tokens: prefixTokens)
        var slots = p.slots
        if p.targetGB != nil, freed != 0 {
            let remaining = p.poolGB + freed
            guard remaining.isFinite, remaining + 1e-9 >= Geometry.gb(Geometry.floorSlots) else {
                throw PlanError("runtime prefill reservation cannot fit above the minimum expert pool; lower the chunk or raise the memory target")
            }
            slots = Geometry.slotsForPoolGB(remaining)
        }
        return MemoryPlan(source: p.source, slots: slots, targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: chunk,
            prefixCacheTokens: prefixTokens, mtpEnabled: p.mtpEnabled,
            visionEnabled: p.visionEnabled, visionResidentReserved: p.visionResidentReserved,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + (chunk != p.prefillChunk || prefixTokens != p.prefixCacheTokens
                ? ["prefill and prefix retention reservations match the explicit runtime controls"] : []),
            simulated: p.simulated, runtimeAllocationPolicy: policy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }

    /// Non-pool footprint: resident weights, the 256 MB n-gram payload plus
    /// collection overhead, Swift and MLX runtime allocations, one fixed GDN
    /// recurrent state, and a full 32k active context. Expert staging is now
    /// transferred directly into MLX in batches of at most 32 records,
    /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
    /// transient.
    public static let fixedFootprintGB = 5.3
    /// Extra slack when deriving a pool from a total-memory target, so the
    /// promise ("stays under G") survives transients.
    public static let planningMarginGB = 1.0

    /// What a prefill pass costs in transient activations.
    ///
    /// **Recalibrated 2026-08-30, and the old figure was costing real speed.**
    /// The previous model charged `(chunk - 256) x 1.8 MB` because it folded
    /// two different things into one term: the pass activations, which scale
    /// with the *chunk*, and the KV plus indexer state, which scales with the
    /// *context*. Conflating them made a big pass look twice as expensive as it
    /// is, so the planner kept choosing 1024 where 2048 is strictly better.
    ///
    /// Measured directly (`--memory-gb 16`, pool pinned at 77/layer, so peak
    /// minus the 14.1 GB base is the pass): chunk 1024 -> 1.30 GB, 2048 -> 2.19,
    /// 4096 -> 4.30. That is ~1.0 to 1.3 MB per chunk token, linear from zero
    /// rather than from 256. Context state is a separate ~27.6 KB per token and
    /// is genuinely small: going from a 4,016 to an 8,016-token prompt moved
    /// peak by 0.1 GB. 1.30 MB/token is charged here so the estimate errs high
    /// at every measured point.
    public static func prefillCostGB(_ chunk: Int) -> Double {
        Double(chunk) * 1.30e-3
    }

    /// KV plus indexer state for a context of `tokens`, which the pool math
    /// does not model. Separate from the pass cost above because it scales with
    /// the conversation, not with the batch: a 32k prompt carries ~0.9 GB.
    public static func contextStateGB(_ tokens: Int) -> Double {
        Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
    }

    /// Context state above what the fixed footprint already covers. Zero at
    /// the default window; an explicitly larger --max-context reduces the
    /// expert pool before allocation instead of consuming the safety margin.
    public static func extraContextStateGB(maxContextTokens: Int) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens)) / 1e9
    }

    /// The larger window also needs transient headroom. A completed 65,520
    /// token check at chunk 512 peaked at 10.056 GB against the state-only
    /// plan's 9.260 GB (20 ms physical-footprint sampling, not just RSS).
    /// Reserve a full additional window's growth above the fixed footprint
    /// throughout the supported long-context range. This conservative envelope
    /// covers that measured gap without claiming its exact buffer attribution
    /// or interpolating unmeasured peaks. Ordinary windows retain their budget.
    /// See the Hermes measurement and its preserved failed run.
    public static func extraContextMemoryGB(maxContextTokens: Int, mtp: Bool = false) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens, mtp: mtp)
            + ContextMemoryLedger.transientReserveBytes(context: maxContextTokens, mtp: mtp)) / 1e9
    }

    /// Sizes the prefill pass from the same budget as the pool.
    ///
    /// Prefill is expert-stream-bound: a pass touches nearly every expert of
    /// every layer, so the whole expert set is re-read roughly once per pass
    /// and halving the number of passes halves the bytes moved. Measured on a
    /// 7,960-token prompt: 40 tok/s at 256, 50 at 512, 67 at 1024, 92 to 105 at
    /// 2048 — with byte-identical output at every size.
    ///
    /// The cap is a quarter of the pool budget, raised from a fifth once the
    /// cost above was measured honestly. The deciding experiment held total
    /// memory fixed and traded pool for pass size on a 4,021-token prompt:
    ///
    /// | chunk | pool | prefill | decode | peak |
    /// |---|---|---|---|---|
    /// | 1024 | 77/layer | 65.2 s | 7.3 s | 15.4 GB |
    /// | 2048 | 67/layer | **47.9 s** | **6.6 s** | **14.9 GB** |
    /// | 4096 | 47/layer | 42.9 s | 9.0 s | 14.4 GB |
    ///
    /// 2048 dominates 1024 on every axis, so a fifth was simply too tight; 4096
    /// buys a little more prefill and gives back more decode, so it should only
    /// be reached on a machine whose pool is already past the decode plateau —
    /// which is exactly what a proportional cap does, since there pool memory
    /// is worth nothing and pass memory is worth a lot.
    /// A request this plan is tuned for: prompt tokens, then generated tokens.
    /// Only ever used to choose the prefill pass size — never correctness.
    static let tuningPromptTokens = 2000.0
    static let tuningReplyTokens = 400.0

    /// The prefill pass to run at a given pool budget: the one that finishes a
    /// representative request soonest.
    ///
    /// Pass size is a real trade, not a free choice. A bigger pass prefills
    /// faster but costs pool, and every GB it takes is expert cache the decode
    /// loop no longer has. The old rule — "biggest pass fitting in a quarter of
    /// the budget" — ignored the decode side, so crossing the quarter line
    /// doubled the pass from 2.7 to 5.3 GB and made `--memory-gb 26` plan a
    /// *smaller* cache than 25 (116 against 128 per layer) and a slower decode.
    /// Giving more memory made it slower.
    ///
    /// Scoring `prompt/prefill + reply/decode` prices both sides in the one
    /// unit that matters, seconds, and picks the trade the machine can afford:
    /// past the decode plateau a big pass is nearly free and wins, and below it
    /// the pass only grows when the prefill it buys beats the decode it costs.
    /// Swept a GB at a time from 7 to 90 GB, the estimate never gets worse as
    /// the target grows.
    public static func prefillChunkFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        // 8192 is not a candidate: nothing has measured it, and the prefill
        // schedule would cut it to 4096 on the first pass anyway
        // (PrefillSchedule.measuredQueryKeyProduct), so offering it only
        // charged 10.6 GB for a pass that never ran.
        let candidates = [256] + [512, 1024, 2048, 4096].filter {
            prefillCostGB($0) <= 0.25 * poolBudgetGB
        }
        func seconds(_ c: Int) -> Double {
            let pool = poolBudgetGB - prefillCostGB(c) - prefixCacheGB(poolBudgetGB: poolBudgetGB, contextCap: contextCap)
            let slots = Geometry.slotsForPoolGB(max(0, pool))
            let decode = estWarmTokS(expertsPerLayer: Geometry.perLayer(slots))
            return tuningPromptTokens / estPrefillTokS(chunk: c) + tuningReplyTokens / decode
        }
        // Ties (identical seconds) go to the larger pass: same request time,
        // more headroom on a prompt longer than the one we tuned for.
        return candidates.min { a, b in
            let (sa, sb) = (seconds(a), seconds(b))
            return sa != sb ? sa < sb : a > b
        } ?? 256
    }

    /// How many tokens of conversation state the prefix cache may retain.
    ///
    /// The held state is ~27 KiB per token, and this is a ceiling on the total
    /// across every conversation held, not per conversation.
    ///
    /// It **is** charged against the budget. The first design held one
    /// conversation and evicted on any miss, so exactly one state was ever live
    /// and peak was unchanged; that design was then measured against a real
    /// client and never hit at all — Open WebUI interleaves a title-generation
    /// request between turns and evicted the chat every time. Holding several
    /// conversations is what makes the cache work, and several held states are
    /// genuinely additive memory, so the budget pays for them. A tenth of the
    /// pool budget is the ceiling, capped by the context limit above which
    /// reuse is impossible anyway (a match needs `prompt.count > held.count`,
    /// and a prompt that long is already refused).
    public static func prefixCacheTokensFor(poolBudgetGB: Double, contextCap: Int = 32_768) -> Int {
        let gb = 0.10 * max(0, poolBudgetGB)
        let full = Double(contextCap) * Double(PrefixCache.bytesPerToken) / 1e9
        if gb >= full { return max(0, contextCap) }
        let toks = Int(gb * 1e9 / Double(PrefixCache.bytesPerToken))
        return max(0, min(toks, contextCap))
    }

    /// What that retention ceiling costs, which the plan reserves.
    public static func prefixCacheGB(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Double {
        prefixCacheCostGB(tokens: prefixCacheTokensFor(poolBudgetGB: poolBudgetGB, contextCap: contextCap))
    }

    /// PrefixCache evicts before a miss allocation, so no more than four
    /// states coexist: the active state already in fixedFootprintGB plus three
    /// retained states. Their fixed GDN memory is additive to KV/indexer bytes.
    public static func prefixCacheCostGB(tokens: Int) -> Double {
        guard tokens > 0 else { return 0 }
        let tokenGB = Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
        let fixedGB = Double(PrefixCache.maxEntries - 1)
            * Double(PrefixCache.fixedBytesPerEntry) / 1e9
        return tokenGB + fixedGB
    }

    /// Prefill throughput estimate for the banner, from the anchors above.
    /// Prefill throughput estimate, from measurement plus one measured ratio.
    ///
    /// 2048 is the solid anchor: **112.9 tok/s** on an 8,016-token prompt at a
    /// 16 GB target, mean of three interleaved runs. 4096 could not be measured
    /// at *its* natural home (a 36 GB target needs ~33 GB free, which has not
    /// been available), so it is derived from a ratio measured at a matched
    /// pool of 60 experts/layer, where 4096 beat 2048 in all three paired
    /// rounds — 108.8/96.6, 92.2/76.3, 103.9/91.4, a mean 101.6 against 88.1,
    /// or 1.15x. Applied to the anchor that implies ~130; 125 is quoted so the
    /// estimate stays under the evidence rather than over it, and 8192 is not
    /// credited with any further gain because nothing has measured one.
    ///
    /// Caveat this does not model: prefill also depends on pool size, because
    /// a bigger cache means fewer expert misses per pass. The same chunk gives
    /// 88 tok/s at 60 experts/layer and 113 at 67, so treat these as typical
    /// for a machine that would *choose* that chunk, not as a pure function.
    public static func estPrefillTokS(chunk: Int) -> Double {
        // The sweep's ladder on the 8k acceptance prompt at a matched pool of
        // 60 experts per layer (MEASUREMENTS.md, "N2 — the prefill sweep"):
        // 88 / 128 / 169 / 211 / 222 tok/s from 256 to 4096, rounded down.
        // The floor's 256-token pass read 88 at 13 per layer too: below 1024
        // the pass is read-bound and the pool barely matters. Ordinary prose
        // reads about 40% slower than this prompt at every size; these are the
        // acceptance prompt's numbers, as the previous ladder's were.
        switch chunk {
        case ..<512: return 85
        case ..<1024: return 125
        case ..<2048: return 165
        case ..<4096: return 205
        default: return 220
        }
    }
    /// Smallest honest total-memory target: floor pool + footprint + margin.
    public static var minMemoryGB: Double {
        ((Geometry.gb(Geometry.floorSlots) + fixedFootprintGB + planningMarginGB) * 10)
            .rounded(.up) / 10
    }

    /// Memory reclaimable RIGHT NOW without compressing or swapping any other
    /// process's memory: free pages (the raw counter includes speculative) +
    /// purgeable + file-backed cache. Deliberately NOT `kern.memorystatus_level`
    /// (the `memory_pressure` "free percentage"): that counts other apps'
    /// compressible/swappable memory as available, and sizing a GPU pool
    /// against it is exactly how you cause the swap storm. nil if the mach
    /// call fails (then no clamp is applied).
    /// Test seam: when set, stands in for the live availability reading so the
    /// governor can be driven without putting the machine under real memory
    /// pressure. Never set in normal operation.
    ///
    /// **It does not make the resulting allocation imaginary.** The governor
    /// acts on this number, so setting it *above* what the machine has makes it
    /// allocate a pool the machine cannot hold: simulating 60 GB free on a Mac
    /// with 7 GB took a real 25 GB pool and drove tens of GB of swap. Anything
    /// using this seam must bound the value by `deviceAvailableGB()`.
    public nonisolated(unsafe) static var availabilityOverride: Double?

    /// Headroom kept between our expected peak and what is reclaimable, so
    /// claiming it doesn't leave the machine at zero.
    public static func availabilitySlackGB(ramGB: Double) -> Double {
        max(1.5, 0.05 * ramGB)
    }

    /// The share of RAM auto may target before other limits apply. Overridable
    /// per run with --max-ram-percent; it binds on small machines, where the
    /// cache is starved and every GB still buys speed.
    public static let defaultRAMPercent = 70.0

    /// Auto will not target more than this, however large the machine.
    ///
    /// This is the knee of the whole plan, not a politeness limit: 33 GB is the
    /// smallest target at which **both** numbers reach the best the
    /// measurements support — the expert cache clears the decode plateau
    /// (11.2 tok/s at 120 experts/layer, 11.6 at 150, flat after) *and* the
    /// budget still affords the 4096-token prefill pass (125 tok/s against 113
    /// at 2048). Swept a GB at a time, nothing between 34 and 84 GB improves
    /// either number.
    ///
    /// So the old 70%-of-RAM policy was right for a 48 GB Mac by luck — it
    /// landed near this knee — and wrong everywhere above: a 128 GB Mac
    /// targeted 89.6 GB to run at exactly the same estimated speed.
    ///
    /// Not a hard limit: --memory-gb N goes past it deliberately, which is how
    /// a large machine explores full residency (all 512/layer needs about
    /// 84 GB and has never been measured). The one unreproduced hint of a
    /// further decode step, 20 tok/s at 181/layer, is why that door stays open.
    public static let usefulCeilingGB = 33.0

    /// Auto policy: never target more than the cache can use, leave a share of
    /// RAM to the OS and the user's other apps, and stay 2 GB under the Metal
    /// recommended working set — whichever binds first.
    public static func autoTargetGB(
        ramGB: Double, workingSetGB: Double, ramPercent: Double = defaultRAMPercent,
        ceilingGB: Double = usefulCeilingGB
    ) -> Double {
        min(ceilingGB, (ramPercent / 100) * ramGB, workingSetGB - 2.0)
    }

    /// Warm decode estimate, re-anchored 2026-08-30 on measured points.
    ///
    /// The old curve interpolated between 30/layer = 5.6 and 181/layer = 20.0
    /// and **over-promised by 25 to 45% across the middle of its own range**,
    /// which is the part most machines actually land in. Re-measured on 0.1.6
    /// with the pool properly warmed (throughput plateaus by the second
    /// generation, so three samples is enough — verified over 14 consecutive
    /// runs):
    ///
    /// | experts/layer | measured | old estimate |
    /// |---|---|---|
    /// | 30 | 6.0 | 5.6 |
    /// | 60 | 8.2 | 9.2 |
    /// | 120 | 11.2 | 14.8 |
    /// | 150 | 11.6 | 17.3 |
    ///
    /// It is also nearly flat from 120 to 150, so the plateau starts far below
    /// the 181 the old curve assumed. The 20.0 figure at 181/layer could not be
    /// re-verified: that config peaks at 27.4 GB and the machine had 26.6 GB
    /// reclaimable, and forcing it once already drove 13 GB of swap. One run
    /// under that pressure produced a 15 to 18 band, consistent with a
    /// threshold once the working set fits, but it is not a clean measurement.
    ///
    /// So this now interpolates the verified points and **holds flat above
    /// them** rather than extrapolating to an unconfirmed number. It
    /// under-promises above 150/layer on purpose: a plan that quotes a speed
    /// the machine does not reach is worse than one that quotes less.
    /// Where the measured decode curve stops improving: 11.2 tok/s at 120
    /// experts/layer, 11.6 at 150, flat after. Both the estimate and the
    /// prefill-pass sizing key off this one number.
    public static let decodePlateauPerLayer = 150.0

    public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
        let (e0, r0) = (30.0, 6.0)
        let (e1, r1) = (decodePlateauPerLayer, 11.6)
        if e >= e1 { return r1 }
        if e <= e0 { return r0 * (max(e, 1) / e0) }
        let t = log(e / e0) / log(e1 / e0)
        return r0 * pow(r1 / r0, t)
    }

    /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
    /// activations and cache growth ride the existing margins).
    public static let mtpResidentGB = 1.6

    /// The vision tower's resident cost, paid only by a process that is handed
    /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
    /// checkpoint's own header (`VisionTower.residentBytes`), rounded up.
    ///
    /// Engine reserves this inside a target-driven plan before loading the
    /// tower. A raw pool-size request keeps that explicit pool size and reports
    /// the additional resident bytes in its expected peak.
    public static let visionResidentGB = 0.9

    /// Headroom demanded on top of the tower's own bytes before loading it.
    /// The load briefly holds arrays twice while MLX materializes them.
    /// Attention transients depend on the actual dispatch: the established
    /// 72-wide fallback can form an N² matrix and are not bounded by this term.
    public static let visionLoadMarginGB = 1.0
    /// Auto enables the draft head only when the cache still affords this
    /// many experts per layer AFTER paying for it (M9 design note: below
    /// ~120/layer the displaced experts are worth more than the multiplier;
    /// past the ~150/layer plateau they are worth nothing).
    public static let mtpAutoFloorPerLayer = 120.0

    /// Pool budget before the prefill pass takes its share.
    public static func poolBudgetGB(_ targetGB: Double) -> Double {
        targetGB - fixedFootprintGB - planningMarginGB
    }

    public static func slotsForTarget(_ targetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        let budget = poolBudgetGB(targetGB)
        let pool = budget - prefillCostGB(prefillChunkFor(poolBudgetGB: budget, contextCap: contextCap))
            - prefixCacheGB(poolBudgetGB: budget, contextCap: contextCap)
        return Geometry.slotsForPoolGB(pool)
    }

    /// Resolve the knobs. Precedence: --experts-per-layer > --pool-gb >
    /// --memory-gb > auto. Losing knobs are noted, never silently dropped.
    ///
    /// Auto (and only auto) also clamps to what is reclaimable right now, so a
    /// busy machine degrades gracefully instead of swap-storming — explicit
    /// knobs mean the user chose, so they only get an informational note. On a
    /// quiet machine the clamp never binds and auto stays deterministic.
    public enum MTPMode: String, Sendable, Codable {
        case on, off, auto
    }

    /// Whether this process will answer requests that carry images. `auto` is
    /// "yes when the checkpoint has a tower", which the shipped one does.
    public enum VisionMode: String, Sendable, Codable {
        case on, off, auto
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: nil)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: runtimePolicy)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil
    ) throws -> MemoryPlan {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) { throw PlanError(why) }
        // The fixed footprint pays for the default context; larger windows
        // reduce the pool budget by their additional active state and measured
        // transient envelope, before sizing either the pool or prefill pass.
        let contextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens)
            + (visionResidentReserved ? visionResidentGB : 0)
        let mtpContextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens, mtp: true)
            - extraContextMemoryGB(maxContextTokens: maxContextTokens)
        let mtpTotalCharge = mtpResidentGB + mtpContextCharge
        let ram = ramGB ?? deviceRAMGB()
        let ws = workingSetGB ?? deviceWorkingSetGB()
        let avail = availableGB ?? deviceAvailableGB()
        let pct = ramPercent ?? defaultRAMPercent
        guard ram.isFinite, ram > 0 else {
            throw PlanError("RAM must be a finite number > 0")
        }
        guard ws.isFinite, ws > 0 else {
            throw PlanError("Metal working-set size must be a finite number > 0")
        }
        // +infinity is meaningful here: it is how doctor --sim-ram says
        // "availability is not a constraint on this simulated machine". Only
        // NaN and negatives are garbage.
        if let a = avail, a.isNaN || a < 0 {
            throw PlanError("available memory must be a number >= 0")
        }
        guard pct.isFinite, pct > 0, pct <= 100 else {
            throw PlanError(String(
                format: "--max-ram-percent %.0f is out of range — give a share between 1 and 100",
                pct))
        }
        var notes: [String] = []
        var clamped = false
        if ramPercent != nil, expertsPerLayer != nil || poolGB != nil || memoryGB != nil {
            notes.append("--max-ram-percent ignored (it only bounds auto; an explicit memory knob is already the target)")
        }
        if vision == .on, !visionAvailable {
            throw PlanError(
                "--vision on, but this checkpoint has no vision_tower tensors — it is a "
                    + "text-only model; use --vision auto/off")
        }
        let visionOn = vision != .off && visionAvailable
        guard !visionResidentReserved || visionOn else {
            throw PlanError("a loaded vision tower requires an available, enabled vision model")
        }
        if mtp == .on, !mtpAvailable {
            throw PlanError(
                "--mtp on, but mtp.safetensors is not next to the model — the draft head "
                    + "is a separate 1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); convert it first or use --mtp auto/off")
        }

        /// The draft-head decision for a pool of `slots` when the head costs
        /// pool budget (target-driven sources already shrank the pool).
        if mtp == .on, maxContextTokens > ContextPolicy.mtpLimit, !qualification {
            throw PlanError("MTP is qualified only through \(ContextPolicy.mtpLimit) tokens; use --mtp off at this window")
        }
        if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit {
            notes.append("MTP stays off because this context exceeds its qualified window")
        }
        func resolveMTP(slotsAfterCharge: Int) -> Bool {
            if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit { return false }
            switch mtp {
            case .off: return false
            case .on: return true
            case .auto:
                return mtpAvailable
                    && Geometry.perLayer(slotsAfterCharge) >= mtpAutoFloorPerLayer
            }
        }

        func finish(
            _ source: MemoryPlan.Source, _ slots: Int, target: Double?, mtpOn: Bool
        ) throws -> MemoryPlan {
            // An explicit pool knob states the cache size, not the whole budget,
            // so size the prefill pass from the pool the user asked for.
            let mtpCharge = mtpOn ? mtpResidentGB + mtpContextCharge : 0
            let budgetForCaches = target.map { poolBudgetGB($0) - mtpCharge - contextCharge }
                ?? Geometry.gb(slots)
            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens)
            let capped = min(slots, Geometry.totalRecords)
            let floored = max(capped, Geometry.floorSlots)
            if floored > capped {
                notes.append(String(
                    format: "raised to the floor of %d slots (~%.0f/layer): below it a prefill chunk can pin every slot",
                    Geometry.floorSlots, Geometry.perLayer(Geometry.floorSlots)))
            }
            let peak = Geometry.gb(floored) + fixedFootprintGB + prefillCostGB(chunk)
                + prefixCacheGB(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens) + mtpCharge + contextCharge
            if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                notes.append(String(
                    format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
                    peak, ws))
            }
            // Explicit raw knobs: warn (don't resize) when the machine is busy.
            if source == .expertsPerLayer || source == .poolGB, let a = avail, peak > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory (auto would size to the machine)",
                    a))
            }
            let base = MemoryPlan(
                source: source, slots: floored, targetGB: target,
                ramGB: ram, workingSetGB: ws, ramPercent: pct,
                availableGB: avail, clamped: clamped,
                prefillChunk: chunk,
                prefixCacheTokens: prefixCacheTokensFor(
                    poolBudgetGB: budgetForCaches, contextCap: maxContextTokens),
                mtpEnabled: mtpOn,
                visionEnabled: visionOn,
                visionResidentReserved: visionResidentReserved,
                maxContextTokens: maxContextTokens,
                notes: notes,
                simulated: simulated, contextQualification: qualification)
            let resolved = try runtimePolicy.map { try applyingRuntimePolicy(base, policy: $0) } ?? base
            let bytes = resolved.memoryLedger.expectedPeakBytes
            if maxContextTokens > ContextPolicy.defaultTokens || visionResidentReserved {
                if let target, Double(bytes) > target * 1e9 {
                    throw PlanError("insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target")
                }
                let physical = min(ws, (avail ?? ws) - availabilitySlackGB(ramGB: ram))
                if Double(bytes) > physical * 1e9 {
                    throw PlanError("insufficient_memory: requested context and expert pool exceed reclaimable memory with safety headroom or the Metal working set")
                }
            }
            return resolved
        }

        if let n = expertsPerLayer {
            guard n >= 1 else { throw PlanError("--experts-per-layer must be ≥ 1") }
            if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
            let slots = min(n, Geometry.expertsPerLayer) * Geometry.layers
            return try finish(.expertsPerLayer, slots, target: nil, mtpOn: resolveMTP(slotsAfterCharge: slots))
        }
        if let g = poolGB {
            guard g.isFinite, g > 0 else {
                throw PlanError("--pool-gb must be a finite number > 0")
            }
            if memoryGB != nil { notes.append("--memory-gb ignored (--pool-gb takes precedence)") }
            // Preserve a below-floor request so `finish` can explain that it
            // raised it; cap before Double->Int so huge finite input is safe.
            let requested = g >= Geometry.gb(Geometry.totalRecords)
                ? Geometry.totalRecords : Int(g * 1e9 / Geometry.recordBytes)
            return try finish(.poolGB, requested, target: nil, mtpOn: resolveMTP(slotsAfterCharge: requested))
        }
        if let m = memoryGB {
            guard m.isFinite else { throw PlanError("--memory-gb must be finite") }
            guard m >= minMemoryGB else {
                throw PlanError(String(
                    format: "--memory-gb %.1f is below the minimum %.1f GB (floor cache of ~%.0f experts/layer = %.1f GB pool, plus the %.1f GB fixed footprint of resident weights + n-gram cache, plus %.1f GB margin)",
                    m, minMemoryGB, Geometry.perLayer(Geometry.floorSlots),
                    Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                    planningMarginGB))
            }
            if m > ws {
                notes.append(String(
                    format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
                    m, ws, max(minMemoryGB, autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct))))
            }
            if let a = avail, m > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory",
                    a))
            }
            var mtpOn = resolveMTP(
                slotsAfterCharge: slotsForTarget(max(m - mtpTotalCharge - contextCharge, minMemoryGB), contextCap: maxContextTokens))
            if mtpOn, m - mtpTotalCharge - contextCharge < minMemoryGB {
                if mtp == .on {
                    throw PlanError(String(
                        format: "--memory-gb %.1f cannot fit the %.1f GB draft head above the %.1f GB minimum — raise the target or drop --mtp on",
                        m, mtpTotalCharge, minMemoryGB))
                }
                mtpOn = false
            }
            let slots = slotsForTarget(m - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
            return try finish(.memoryGB, slots, target: m, mtpOn: mtpOn)
        }

        // auto: the default. The draft head is worth its 1.6 GB only when the
        // cache still reaches ~120+ experts/layer after paying for it, and
        // past the decode knee that RAM buys nothing else — so when the head
        // is on, the ceiling rises by exactly its cost.
        let mtpWanted = mtp != .off && mtpAvailable
            && (mtp == .on || maxContextTokens <= ContextPolicy.mtpLimit)
        func autoRaw(ceilingGB: Double) -> (Double, Bool) {
            let c = autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: ceilingGB)
            var raw = c
            var didClamp = false
            if let a = avail, a - availabilitySlackGB(ramGB: ram) < raw {
                raw = a - availabilitySlackGB(ramGB: ram)
                didClamp = true
            }
            return (raw, didClamp)
        }
        var mtpOn = false
        if mtpWanted {
            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpTotalCharge)
            let targetM = max(minMemoryGB, rawM)
            let charged = targetM - mtpTotalCharge - contextCharge
            mtpOn = charged >= minMemoryGB
                && (mtp == .on
                    || Geometry.perLayer(slotsForTarget(charged, contextCap: maxContextTokens)) >= mtpAutoFloorPerLayer)
        }
        if mtp == .on, !mtpOn {
            throw PlanError("insufficient_memory: auto cannot keep the requested MTP head loaded at this context; close other apps or use --mtp off")
        }
        // `ceiling` is what this machine's auto would pick unclamped (the
        // notes below compare against it); the knee itself rises by the
        // head's cost when the head is on.
        let kneeGB = usefulCeilingGB + (mtpOn ? mtpTotalCharge : 0)
        let ceiling = autoTargetGB(
            ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: kneeGB)
        let raw: Double
        (raw, clamped) = autoRaw(ceilingGB: kneeGB)
        let target = max(minMemoryGB, raw)
        if mtpOn, target - mtpTotalCharge - contextCharge < minMemoryGB { mtpOn = false }
        // Exactly one note tells the story of why the target is what it is.
        if raw < minMemoryGB, ceiling < minMemoryGB {
            notes.append(String(
                format: "this machine (%.0f GB RAM) is below the comfortable minimum — running at the %.1f GB floor; expect slow decode and close other apps",
                ram, minMemoryGB))
        } else if raw < minMemoryGB {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now — running at the %.1f GB floor anyway; expect heavy paging until other apps release memory",
                avail ?? 0, ram, minMemoryGB))
        } else if clamped {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual %.1f GB; close apps and restart for full speed, or force a size with --memory-gb",
                avail ?? 0, ram, ceiling))
        } else if ceiling >= kneeGB,
            min((pct / 100) * ram, ws - 2.0) > 1.25 * kneeGB
        {
            // This machine could hold more and auto declined. Say so, or it
            // reads as slotstream failing to use the hardware.
            notes.append(String(
                format: "this machine could hold more, but decode stops improving around here (measured 11.2 tok/s at 120 experts/layer, 11.6 at 150) — auto caps at %.1f GB rather than spend RAM for nothing; --memory-gb N to go further",
                usefulCeilingGB))
        }
        let slots = slotsForTarget(target - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
        return try finish(.auto, slots, target: target, mtpOn: mtpOn)
    }

    /// Resolve the first image against the existing policy, before allocating
    /// its tower. The source and target remain the user's original decision.
    public static func loadingVision(_ p: MemoryPlan) throws -> MemoryPlan {
        guard p.visionEnabled else { throw PlanError("vision is disabled") }
        if p.visionResidentReserved { return p }
        var sized: MemoryPlan
        if let target = p.targetGB {
            sized = try plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB,
                mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                vision: .on, visionAvailable: true, visionResidentReserved: true,
                maxContextTokens: p.maxContextTokens, simulated: p.simulated, qualification: p.contextQualification,
                runtimePolicy: p.runtimeAllocationPolicy)
        } else { sized = p }
        // Loading a tower never justifies restoring capacity already donated
        // by the governor. Its original target can outlive a pressure shrink.
        return MemoryPlan(source: p.source, slots: min(p.slots, sized.slots), targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: min(p.prefillChunk, sized.prefillChunk),
            prefixCacheTokens: min(p.prefixCacheTokens, sized.prefixCacheTokens), mtpEnabled: p.mtpEnabled,
            visionEnabled: true, visionResidentReserved: true,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + ["vision tower resident memory reserved before loading"], simulated: p.simulated,
            runtimeAllocationPolicy: p.runtimeAllocationPolicy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/manifest.json

SHA-256 `e70ad87534ab9ed1cb90947056398774683cb511789943ce9b0027f470ec2c05`; 1362 bytes.

````text
{
  "classification": "Unapplied planner-family rebase over exact device-observer extraction; no calibration, compiler or model execution",
  "current_source_sha256": {
    "Plan.swift": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
    "ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
    "PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8"
  },
  "after_sha256": {
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d"
  },
  "removed_device_methods": [
    {
      "name": "deviceRAMGB",
      "exact_bytes": 115,
      "sha256": "9705ce4492bef8f7dd17bb1899ceba963031c7beea5944f43a25dd569170187e"
    },
    {
      "name": "deviceWorkingSetGB",
      "exact_bytes": 192,
      "sha256": "90a7435058ecaaf2638cd6997a749bc6e8e11927be751bd1c9e75c3c0ec75058"
    },
    {
      "name": "deviceAvailableGB",
      "exact_bytes": 709,
      "sha256": "2ba6cb81233c950b0d1b675073b6e2f1a4e626b1a7f5ab935c6d1b3ad9872374"
    }
  ],
  "compiler_run": false,
  "source_applied": false
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/plan.patch

SHA-256 `086f327869eeccb017d57ba133a6c10a38984cf113bf8597baec64566e209701`; 4026 bytes.

````text
--- current Plan.swift

+++ rebased planner-family Plan.swift

@@ -348,8 +348,8 @@

     /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
     /// transient.
-    public static let fixedFootprintGB = 5.3
+    public static let fixedFootprintGB = Double(PlannerCostModel.fixedBytes) / 1e9
     /// Extra slack when deriving a pool from a total-memory target, so the
     /// promise ("stays under G") survives transients.
-    public static let planningMarginGB = 1.0
+    public static let planningMarginGB = Double(PlannerCostModel.planningMarginBytes) / 1e9
 
     /// What a prefill pass costs in transient activations.
@@ -370,5 +370,5 @@

     /// at every measured point.
     public static func prefillCostGB(_ chunk: Int) -> Double {
-        Double(chunk) * 1.30e-3
+        Double(chunk) * (Double(PlannerCostModel.prefillBytesPerToken) / 1e9)
     }
 
@@ -425,6 +425,6 @@

     /// A request this plan is tuned for: prompt tokens, then generated tokens.
     /// Only ever used to choose the prefill pass size — never correctness.
-    static let tuningPromptTokens = 2000.0
-    static let tuningReplyTokens = 400.0
+    static let tuningPromptTokens = PlannerCostModel.tuningPromptTokens
+    static let tuningReplyTokens = PlannerCostModel.tuningReplyTokens
 
     /// The prefill pass to run at a given pool budget: the one that finishes a
@@ -532,9 +532,9 @@

         // acceptance prompt's numbers, as the previous ladder's were.
         switch chunk {
-        case ..<512: return 85
-        case ..<1024: return 125
-        case ..<2048: return 165
-        case ..<4096: return 205
-        default: return 220
+        case ..<512: return PlannerCostModel.prefill256TokensPerSecond
+        case ..<1024: return PlannerCostModel.prefill512TokensPerSecond
+        case ..<2048: return PlannerCostModel.prefill1024TokensPerSecond
+        case ..<4096: return PlannerCostModel.prefill2048TokensPerSecond
+        default: return PlannerCostModel.prefill4096TokensPerSecond
         }
     }
@@ -634,9 +634,9 @@

     /// experts/layer, 11.6 at 150, flat after. Both the estimate and the
     /// prefill-pass sizing key off this one number.
-    public static let decodePlateauPerLayer = 150.0
+    public static let decodePlateauPerLayer = PlannerCostModel.decodePlateauPerLayer
 
     public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
-        let (e0, r0) = (30.0, 6.0)
-        let (e1, r1) = (decodePlateauPerLayer, 11.6)
+        let (e0, r0) = (PlannerCostModel.decodeLowExpertsPerLayer, PlannerCostModel.decodeLowTokensPerSecond)
+        let (e1, r1) = (decodePlateauPerLayer, PlannerCostModel.decodePlateauTokensPerSecond)
         if e >= e1 { return r1 }
         if e <= e0 { return r0 * (max(e, 1) / e0) }
@@ -647,5 +647,5 @@

     /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
     /// activations and cache growth ride the existing margins).
-    public static let mtpResidentGB = 1.6
+    public static let mtpResidentGB = Double(PlannerCostModel.mtpResidentBytes) / 1e9
 
     /// The vision tower's resident cost, paid only by a process that is handed
@@ -656,5 +656,5 @@

     /// tower. A raw pool-size request keeps that explicit pool size and reports
     /// the additional resident bytes in its expected peak.
-    public static let visionResidentGB = 0.9
+    public static let visionResidentGB = Double(PlannerCostModel.visionResidentBytes) / 1e9
 
     /// Headroom demanded on top of the tower's own bytes before loading it.
@@ -662,5 +662,5 @@

     /// Attention transients depend on the actual dispatch: the established
     /// 72-wide fallback can form an N² matrix and are not bounded by this term.
-    public static let visionLoadMarginGB = 1.0
+    public static let visionLoadMarginGB = Double(PlannerCostModel.visionLoadMarginBytes) / 1e9
     /// Auto enables the draft head only when the cache still affords this
     /// many experts per layer AFTER paying for it (M9 design note: below
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/proxy-manifest.json

SHA-256 `bc0ff26c514485e5d349f489d678aa5aba373dafadf5a87eb4f27bf2dcd18232`; 4437 bytes.

````text
{
  "passed": false,
  "launched": false,
  "protocol_sha256": "7379baabd53e0c88198dd25459f91b37ddf2dcfd514da90f0cf72f441bca33a7",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 9968435200,
    "swapins": 44112252,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    28997.\nPages active:                                1118494.\nPages inactive:                              1112081.\nPages speculative:                              4872.\nPages throttled:                                   0.\nPages wired down:                             272497.\nPages purgeable:                               12884.\n\"Translation faults\":                    15391775281.\nPages copy-on-write:                       733796014.\nPages zero filled:                       21208024091.\nPages reactivated:                        3469614304.\nPages purged:                               72186342.\nFile-backed pages:                            566544.\nAnonymous pages:                             1668903.\nPages stored in compressor:                  1408116.\nPages occupied by compressor:                 548644.\nDecompressions:                           1171587674.\nCompressions:                             1485994001.\nPageins:                                  7614727395.\nPageouts:                                   11068078.\nSwapins:                                    44112252.\nSwapouts:                                   77525566.\nPages tagged:                                 184910.\nPages tagged resident:                        160325.\nPages tagged compressed:                       24585.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11170.\nPages tag-storage free:                          143.\nPages tag-storage non-tag pageable:            86983.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3449600.\nTagged compressions:                        11241850.\nTagged decompressions:                      10385377.\n"
  },
  "error": "AssertionError: ",
  "elapsed_seconds": 0.044265000000000006,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 9964863488,
    "swapins": 44112252,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    28767.\nPages active:                                1118569.\nPages inactive:                              1112282.\nPages speculative:                              4876.\nPages throttled:                                   0.\nPages wired down:                             272497.\nPages purgeable:                               12884.\n\"Translation faults\":                    15391779079.\nPages copy-on-write:                       733796610.\nPages zero filled:                       21208025619.\nPages reactivated:                        3469614304.\nPages purged:                               72186342.\nFile-backed pages:                            566556.\nAnonymous pages:                             1669171.\nPages stored in compressor:                  1408116.\nPages occupied by compressor:                 548644.\nDecompressions:                           1171587674.\nCompressions:                             1485994001.\nPageins:                                  7614727408.\nPageouts:                                   11068078.\nSwapins:                                    44112252.\nSwapouts:                                   77525566.\nPages tagged:                                 184910.\nPages tagged resident:                        160325.\nPages tagged compressed:                       24585.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11170.\nPages tag-storage free:                          143.\nPages tag-storage non-tag pageable:            86983.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3449600.\nTagged compressions:                        11241850.\nTagged decompressions:                      10385377.\n"
  },
  "jobs": [
    {
      "pid": 99967,
      "executable": "/Library/Developer/CommandLineTools/usr/bin/swift-frontend",
      "kind": "Swift build"
    }
  ],
  "model_lock_free": true
}
````

## /tmp/slotstream-optimization-execution/planner-device-rebase-v267/proxy-protocol.json

SHA-256 `7379baabd53e0c88198dd25459f91b37ddf2dcfd514da90f0cf72f441bca33a7`; 3015 bytes.

````text
{
  "classification": "Isolated production planner-family policy compilation/checks with inert device observers; no MLX/model or performance qualification",
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/planner-device-rebase-v267/candidate/Tools/context_proxy.py",
    "--out",
    "/tmp/slotstream-optimization-execution/planner-device-rebase-v267/proxy"
  ],
  "source_sha256": {
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d"
  },
  "wrapper_sha256": "77b3cd2b834e99dbf515ee4d07063ab0b2a8878030e5fc9ab78b02f0673d2f4f",
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 5000000000,
    "maximum_owned_rss_bytes": 1500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 300,
    "stop_on_new_swapouts": true
  }
}
````

## /tmp/slotstream-optimization-execution/run-planner-proxy-v267.py

SHA-256 `77b3cd2b834e99dbf515ee4d07063ab0b2a8878030e5fc9ab78b02f0673d2f4f`; 3091 bytes.

````text
import fcntl,json,os,signal,sys,time
from pathlib import Path
ROOT=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path('/tmp/slotstream-optimization-execution/planner-device-rebase-v267')
source=P/'candidate';start=time.monotonic()
def snapshot():
 s=vm_snapshot();require_normal(pressure_snapshot());return s
def interrupted(number,_frame):raise KeyboardInterrupt(f'policy proxy interrupted by signal {number}')
signal.signal(signal.SIGTERM,interrupted);signal.signal(signal.SIGINT,interrupted)
S={'classification':'Isolated production planner-family policy compilation/checks with inert device observers; no MLX/model or performance qualification',
 'command':[sys.executable,str(source/'Tools/context_proxy.py'),'--out',str(P/'proxy')],
 'source_sha256':{str(p.relative_to(source)):digest(p) for p in source.rglob('*') if p.is_file()},
 'wrapper_sha256':digest(Path(__file__)),
 'policy':{'startup_reclaimable_bytes':7_000_000_000,'minimum_live_reclaimable_bytes':5_000_000_000,
 'maximum_owned_rss_bytes':1_500_000_000,'sample_interval_seconds':.2,'maximum_build_seconds':300,'stop_on_new_swapouts':True}}
with (P/'proxy-protocol.json').open('x') as f:f.write(json.dumps(S,indent=2)+'\n')
r={'passed':False,'launched':False,'protocol_sha256':digest(P/'proxy-protocol.json')}
try:
 r['before']=preflight(7);require_normal(pressure_snapshot());assert not competing_jobs()
 with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  r['launched']=True
  with (P/'proxy.stdout').open('w') as out,(P/'proxy.stderr').open('w') as err:
   result=guarded_run(S['command'],cwd=source,stdout=out,stderr=err,record_path=P/'proxy-memory.json',snapshot=snapshot,policy=S['policy'],classification=S['classification'])
  r['exit_code']=result.returncode
  report=json.loads((P/'proxy/report.json').read_text())
  r['passed']=result.returncode==0 and report.get('passed') is True and report.get('model_loaded') is False and report.get('hardware_qualified') is False
  r['contracts']=report.get('contracts');assert all(digest(source/p)==h for p,h in S['source_sha256'].items())
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
 r['elapsed_seconds']=time.monotonic()-start
 (P/'proxy-manifest.json').write_text(json.dumps(r,indent=2)+'\n')
 for name,fn in [('after',vm_snapshot),('jobs',competing_jobs),('model_lock_free',lambda:bool(preflight(0)))]:
  try:r[name]=fn()
  except BaseException as e:r.setdefault('cleanup_errors',{})[name]=f'{type(e).__name__}: {e}'
 r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and not r.get('jobs') and r.get('model_lock_free'))
 (P/'proxy-manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/run-planner-proxy-v270.py

SHA-256 `bd0f8267c77a5eef6dde2e38df705d95741519cb1bfcd3073741238aa8812c8f`; 3167 bytes.

````text
import fcntl,json,os,signal,sys,time
from pathlib import Path
ROOT=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path('/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270')
source=Path('/tmp/slotstream-optimization-execution/planner-device-rebase-v267/candidate');start=time.monotonic()
def snapshot():
 s=vm_snapshot();require_normal(pressure_snapshot());return s
def interrupted(number,_frame):raise KeyboardInterrupt(f'policy proxy interrupted by signal {number}')
signal.signal(signal.SIGTERM,interrupted);signal.signal(signal.SIGINT,interrupted)
S={'classification':'Isolated production planner-family policy compilation/checks with inert device observers; no MLX/model or performance qualification',
 'command':[sys.executable,str(source/'Tools/context_proxy.py'),'--out',str(P/'proxy')],
 'source_sha256':{str(p.relative_to(source)):digest(p) for p in source.rglob('*') if p.is_file()},
 'wrapper_sha256':digest(Path(__file__)),
 'policy':{'startup_reclaimable_bytes':7_000_000_000,'minimum_live_reclaimable_bytes':5_000_000_000,
 'maximum_owned_rss_bytes':1_500_000_000,'sample_interval_seconds':.2,'maximum_build_seconds':300,'stop_on_new_swapouts':True}}
with (P/'proxy-protocol.json').open('x') as f:f.write(json.dumps(S,indent=2)+'\n')
r={'passed':False,'launched':False,'protocol_sha256':digest(P/'proxy-protocol.json')}
try:
 r['before']=preflight(7);require_normal(pressure_snapshot());assert not competing_jobs()
 with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  r['launched']=True
  with (P/'proxy.stdout').open('w') as out,(P/'proxy.stderr').open('w') as err:
   result=guarded_run(S['command'],cwd=source,stdout=out,stderr=err,record_path=P/'proxy-memory.json',snapshot=snapshot,policy=S['policy'],classification=S['classification'])
  r['exit_code']=result.returncode
  report=json.loads((P/'proxy/report.json').read_text())
  r['passed']=result.returncode==0 and report.get('passed') is True and report.get('model_loaded') is False and report.get('hardware_qualified') is False
  r['contracts']=report.get('contracts');assert all(digest(source/p)==h for p,h in S['source_sha256'].items())
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
 r['elapsed_seconds']=time.monotonic()-start
 (P/'proxy-manifest.json').write_text(json.dumps(r,indent=2)+'\n')
 for name,fn in [('after',vm_snapshot),('jobs',competing_jobs),('model_lock_free',lambda:bool(preflight(0)))]:
  try:r[name]=fn()
  except BaseException as e:r.setdefault('cleanup_errors',{})[name]=f'{type(e).__name__}: {e}'
 r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and not r.get('jobs') and r.get('model_lock_free'))
 (P/'proxy-manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

