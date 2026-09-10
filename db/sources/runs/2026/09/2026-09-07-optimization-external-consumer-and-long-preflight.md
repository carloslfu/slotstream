---
type: run
id: 01m1xs870gr3jcw43tr6xsw9z0
created: 2026-09-07T11:14:59.216615+00:00
updated: 2026-09-07T11:14:59.453070+00:00
summary: Exact-source external Swift consumer pass and preserved long-memory preflight refusals
binary: V280 eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf
captured_at: 2026-09-07
command: Exact archived protocols, actual raw results and guarded receipts below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Exact-source external Swift consumer pass and preserved long-memory preflight refusals
tool: python3
---
# Current candidate external-consumer compatibility

V288 actually compiles and runs a separate Swift Package consumer against all 150 exact files from V280's source archive. The isolated serial build takes 223.308387708 seconds and passes the original public API use and 22 diagnostics assertions. Its real output is: consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 22 assertions. The 53/layer and 48-second values are planner/API expectations in this compatibility check, not new measured inference performance. The consumer binds legacy function values, Engine, WeightStore, Planner, optimization controls, the 65536 context boundary and prefill diagnostics. It uses an independent SwiftPM build, loads no model and leaves the shared source and release unchanged. Protocol 5423c3bbb75b60b7a8f3f26877f424e7e5d3afe9b56feccd4aa2453e2e51b29c passes source identity, cleanup, model-lock and deadline checks. The earlier refusal because fewer than six reserved minutes remained is preserved separately. This successful execution closes the current exact-source external consumer gate; it is not inferred from an older executable.

V295's single long-memory recovery wrapper refuses before launch: an inherited full-suite 21 GB outer headroom floor sees 19.78 GB reclaimable. The selected original workload is only the 10 GB long prompt, whose existing verify.sh preflight requires 13 GB. V297 prospectively restores that actual 13 GB startup requirement and preserves the before-policy and reason. It retains the original 10 GB model target, complete long prompt, resource thresholds, normal pressure and zero-VM eligibility. V297 then refuses after 18.404918708 seconds when its prospective 60-second quiet preflight sees VM activity. It launches no model request; neither V295 nor V297 is a new long-prompt result. No repeated automatic retries or replacement benchmark cells run.

All processes are drained, the model lock is free, pressure is normal and the heavy interval is explicitly returned early at 11:04:38 UTC. Chrome and other user apps remain open. The 7972-token long no-VM resource gate and fresh complete verification remain open; the original V283 full-suite failure is not relabeled. Portable fallback, actual client, isolated installer/E2E/rollback, seven paired studies, two soaks, optional studies, calibration and activation also remain pending.

## Complete artifact inventory

````json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/manifest.json",
    "sha256": "48875e421e28a38c4f3e9c04bbc52f9c90c2ef70439e8cbcc8d2c1baa4c55075",
    "bytes": 2584
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/pressure.samples.jsonl",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/manifest.json",
    "sha256": "49140edefafcc6a80486185d12d861517d8117d89f7ca4c499d1429017bb26f8",
    "bytes": 4595
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/memory.json",
    "sha256": "d1fd0b6768ff4403b32505e1293d41db1a1a1260acf6101dc516da858e51c31f",
    "bytes": 23541
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/memory.samples.jsonl",
    "sha256": "05fbce4ee83a41d6382bd2af38864ca03cb6b9d224939936408187b9e25f7cfe",
    "bytes": 12416
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/pressure.samples.jsonl",
    "sha256": "9135f0ee7360ab7abdbac049c9ef817b330f0ad885cb00b33f317a0bb7486283",
    "bytes": 168846
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/stderr.txt",
    "sha256": "9fca1de427d624a31a9e72f5d891a016b6f260bb653f792bed3e6b2bc54b45f7",
    "bytes": 88
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/stdout.txt",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/launch-refusal.json",
    "sha256": "c1b18fe8807dc9803f442317cc4c4c264f2ba7a66d3b3394d98e044c78243615",
    "bytes": 310
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/manifest.json",
    "sha256": "8ea32b5ae8ab463241d52feeec6b137bd72fbb4f93640b1f06402108e98ae9ca",
    "bytes": 4557
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/memory.json",
    "sha256": "989bdc37a1ce94aeca1b28daf7a33cf649bb5d55666f5fabf0fd5d16b1073c39",
    "bytes": 214660
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/memory.samples.jsonl",
    "sha256": "f5eff6ad9e93d0ea2b50f00086c42f05c711c217dc38612aefd6cb198511909b",
    "bytes": 162472
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/protocol.json",
    "sha256": "5423c3bbb75b60b7a8f3f26877f424e7e5d3afe9b56feccd4aa2453e2e51b29c",
    "bytes": 39876
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/run.py",
    "sha256": "e691c3b178ee95317d2be9da272c316a9df3db90422070ec1d4bf63419580cae",
    "bytes": 4100
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/stderr.txt",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/stdout.txt",
    "sha256": "6ec5f0efba43b3e25deaf7d10b04f53102e73f6001df5915f1c6ee59590015e1",
    "bytes": 86
  },
  {
    "path": "/tmp/slotstream-optimization-execution/candidate-consumer-v288/template.json",
    "sha256": "fe22328172521978f7cf9cb7d89fd3903a82263334616ee6c4590b19308cdfc2",
    "bytes": 39836
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-memory-recovery-v295/checks.sh",
    "sha256": "65871ade3cb77990822497246202d05111192b5506286eb6810e9d3cee4c51fe",
    "bytes": 3513
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-memory-recovery-v295/protocol.json",
    "sha256": "937d9eec448485d8bde7c8499b2bc7fca9014934e5d3cdec2c3fa11643fff098",
    "bytes": 38017
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-memory-recovery-v295/run.py",
    "sha256": "3debd1736be5982f4ed885470168c58f16c9b4efa9f4877f2e28ce1a3658b119",
    "bytes": 6076
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-memory-recovery-v297/checks.sh",
    "sha256": "472f18053a92cd18fa443353c72169a6c1f4b4ade3efa624b182c3a7971fcab7",
    "bytes": 3513
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-memory-recovery-v297/preparation.json",
    "sha256": "4f78afa46c69bdbd25e215aebf2b849c5a8b6082361df3e53a28418a25b9c039",
    "bytes": 585
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-memory-recovery-v297/protocol.json",
    "sha256": "8024ce9cd32ec395b1153db813f682fcf83320dc965577ee4444de25be858aef",
    "bytes": 38304
  },
  {
    "path": "/tmp/slotstream-optimization-execution/long-memory-recovery-v297/run.py",
    "sha256": "ae6cc9175be3f99211f265ebb2a7b0df366843d9a3e785981f8fca9486dd43a7",
    "bytes": 6363
  }
]
````

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/manifest.json

SHA-256 `48875e421e28a38c4f3e9c04bbc52f9c90c2ef70439e8cbcc8d2c1baa4c55075`; 2584 bytes.

````text
{
  "passed": false,
  "protocol_sha256": "937d9eec448485d8bde7c8499b2bc7fca9014934e5d3cdec2c3fa11643fff098",
  "error": "InsufficientHeadroom: 19.78 GB reclaimable; need 21.00 GB",
  "elapsed_seconds": 0.0031093330000000197,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19783565312,
    "swapins": 44114834,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   360544.\nPages active:                                 893418.\nPages inactive:                               985593.\nPages speculative:                             32136.\nPages throttled:                                   0.\nPages wired down:                             340254.\nPages purgeable:                               16049.\n\"Translation faults\":                    15722299247.\nPages copy-on-write:                       762083294.\nPages zero filled:                       21585662961.\nPages reactivated:                        3535929833.\nPages purged:                               73842069.\nFile-backed pages:                            830900.\nAnonymous pages:                             1080247.\nPages stored in compressor:                  1390160.\nPages occupied by compressor:                 470908.\nDecompressions:                           1192121232.\nCompressions:                             1508836508.\nPageins:                                  7784618275.\nPageouts:                                   11156466.\nSwapins:                                    44114834.\nSwapouts:                                   77536098.\nPages tagged:                                 181344.\nPages tagged resident:                        132419.\nPages tagged compressed:                       48925.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6920.\nPages tag-storage free:                         2698.\nPages tag-storage non-tag pageable:            88675.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    7288448.\nTagged compressions:                        11490261.\nTagged decompressions:                      10593529.\n"
  },
  "pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "candidate_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/manifest.json

SHA-256 `49140edefafcc6a80486185d12d861517d8117d89f7ca4c499d1429017bb26f8`; 4595 bytes.

````text
{
  "passed": false,
  "protocol_sha256": "8024ce9cd32ec395b1153db813f682fcf83320dc965577ee4444de25be858aef",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 21070544896,
    "swapins": 44114858,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    19255.\nPages active:                                1112370.\nPages inactive:                              1127703.\nPages speculative:                              3489.\nPages throttled:                                   0.\nPages wired down:                             328722.\nPages purgeable:                                3641.\n\"Translation faults\":                    15732597437.\nPages copy-on-write:                       762723348.\nPages zero filled:                       21590861659.\nPages reactivated:                        3536194569.\nPages purged:                               73878726.\nFile-backed pages:                           1263148.\nAnonymous pages:                              980414.\nPages stored in compressor:                  1439145.\nPages occupied by compressor:                 493963.\nDecompressions:                           1192212721.\nCompressions:                             1508988264.\nPageins:                                  7791105307.\nPageouts:                                   11156968.\nSwapins:                                    44114858.\nSwapouts:                                   77536098.\nPages tagged:                                 180090.\nPages tagged resident:                        131064.\nPages tagged compressed:                       49026.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6920.\nPages tag-storage free:                          148.\nPages tag-storage non-tag pageable:            91225.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    7296512.\nTagged compressions:                        11493842.\nTagged decompressions:                      10596994.\n"
  },
  "exit_code": 1,
  "summary": [],
  "skips": [],
  "failures": [],
  "elapsed_seconds": 18.404918708,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 20925825024,
    "swapins": 44114862,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    11139.\nPages active:                                1131455.\nPages inactive:                              1132254.\nPages speculative:                              1544.\nPages throttled:                                   0.\nPages wired down:                             315489.\nPages purgeable:                               20437.\n\"Translation faults\":                    15732967459.\nPages copy-on-write:                       762764439.\nPages zero filled:                       21591045962.\nPages reactivated:                        3536194751.\nPages purged:                               73878751.\nFile-backed pages:                           1245635.\nAnonymous pages:                             1019618.\nPages stored in compressor:                  1438250.\nPages occupied by compressor:                 493654.\nDecompressions:                           1192213606.\nCompressions:                             1508988264.\nPageins:                                  7791107552.\nPageouts:                                   11157063.\nSwapins:                                    44114862.\nSwapouts:                                   77536098.\nPages tagged:                                 180012.\nPages tagged resident:                        131008.\nPages tagged compressed:                       49004.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6919.\nPages tag-storage free:                          158.\nPages tag-storage non-tag pageable:            91219.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7292352.\nTagged compressions:                        11493842.\nTagged decompressions:                      10597012.\n"
  },
  "pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "candidate_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/stderr.txt

SHA-256 `9fca1de427d624a31a9e72f5d891a016b6f260bb653f792bed3e6b2bc54b45f7`; 88 bytes.

````text
long-memory pre-launch quiet interval had VM activity; long-memory request not launched
````

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/launch-refusal.json

SHA-256 `c1b18fe8807dc9803f442317cc4c4c264f2ba7a66d3b3394d98e044c78243615`; 310 bytes.

````text
{
  "captured_at": "2026-09-07T09:54:28.557353+00:00",
  "launched": false,
  "protocol_created": false,
  "reason": "Remaining interval minus30second cleanup was below the already declared360second minimum; wrapper raised before preflight/lock or compiler launch. Original unrun protocol/source preserved."
}
````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/manifest.json

SHA-256 `8ea32b5ae8ab463241d52feeec6b137bd72fbb4f93640b1f06402108e98ae9ca`; 4557 bytes.

````text
{
  "classification": "Actual separate external consumer compiled from the exact V280 archived source, bounded by a concrete granted handback deadline. No model or shared-runtime rebuild or activation.",
  "protocol_sha256": "5423c3bbb75b60b7a8f3f26877f424e7e5d3afe9b56feccd4aa2453e2e51b29c",
  "passed": true,
  "launched": true,
  "model_loaded": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19962003456,
    "swapins": 44114834,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   370840.\nPages active:                                 909754.\nPages inactive:                               985612.\nPages speculative:                             32469.\nPages throttled:                                   0.\nPages wired down:                             313299.\nPages purgeable:                               15965.\n\"Translation faults\":                    15722749371.\nPages copy-on-write:                       762095886.\nPages zero filled:                       21585909034.\nPages reactivated:                        3535930378.\nPages purged:                               73845220.\nFile-backed pages:                            831579.\nAnonymous pages:                             1096256.\nPages stored in compressor:                  1390027.\nPages occupied by compressor:                 470874.\nDecompressions:                           1192121366.\nCompressions:                             1508836508.\nPageins:                                  7784618520.\nPageouts:                                   11156466.\nSwapins:                                    44114834.\nSwapouts:                                   77536098.\nPages tagged:                                 182756.\nPages tagged resident:                        133831.\nPages tagged compressed:                       48925.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6920.\nPages tag-storage free:                         2698.\nPages tag-storage non-tag pageable:            88678.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7288448.\nTagged compressions:                        11490261.\nTagged decompressions:                      10593529.\n"
  },
  "exit_code": 0,
  "elapsed_seconds": 223.308387708,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 21532180480,
    "swapins": 44114854,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    12184.\nPages active:                                1093921.\nPages inactive:                              1140435.\nPages speculative:                              4479.\nPages throttled:                                   0.\nPages wired down:                             313040.\nPages purgeable:                               14568.\n\"Translation faults\":                    15731880495.\nPages copy-on-write:                       762702735.\nPages zero filled:                       21590510134.\nPages reactivated:                        3536194219.\nPages purged:                               73875110.\nFile-backed pages:                           1287468.\nAnonymous pages:                              951367.\nPages stored in compressor:                  1493650.\nPages occupied by compressor:                 521450.\nDecompressions:                           1192166774.\nCompressions:                             1508988264.\nPageins:                                  7791084144.\nPageouts:                                   11156810.\nSwapins:                                    44114854.\nSwapouts:                                   77536098.\nPages tagged:                                 180123.\nPages tagged resident:                        130027.\nPages tagged compressed:                       50096.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6920.\nPages tag-storage free:                          174.\nPages tag-storage non-tag pageable:            91202.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7519168.\nTagged compressions:                        11493842.\nTagged decompressions:                      10595938.\n"
  },
  "jobs": [],
  "model_lock_free": true,
  "source_unchanged": true,
  "within_reservation": true
}
````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/protocol.json

SHA-256 `5423c3bbb75b60b7a8f3f26877f424e7e5d3afe9b56feccd4aa2453e2e51b29c`; 39876 bytes.

````text
{
  "classification": "Actual separate external consumer compiled from the exact V280 archived source, bounded by a concrete granted handback deadline. No model or shared-runtime rebuild or activation.",
  "source_root": "/tmp/slotstream-optimization-execution/candidate-consumer-v285/source",
  "base_candidate": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
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
      "source_archive_sha256": "56c60764434a75913ddb46d91ed7b38c66a6969ea46d5c1a6159ea55dd8143b4",
      "binary_sha256": "eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "source_sha256": {
    "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
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
  "changes_from_v255": {
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8"
  },
  "consumer_script_sha256": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/candidate-consumer-v285/source/Tools/consumer_smoke.sh"
  ],
  "environment": {
    "SLOTSTREAM_BUILD_JOBS": "1"
  },
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 600,
    "stop_on_new_swapouts": true
  },
  "maximum_interval_seconds": 620,
  "drivers": {
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70"
  },
  "wrapper_sha256": "e691c3b178ee95317d2be9da272c316a9df3db90422070ec1d4bf63419580cae",
  "planner_proxy_prerequisite": {
    "path": "/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-manifest.json",
    "sha256": "3d80af4d4fe4a9ebbe550b450b8db7fe491563671ca9f3c238a2313f38cf1951"
  },
  "frozen_at": "2026-09-07T10:57:19.863362+00:00",
  "prepared_from_unrun_v285_protocol_sha256": "a76d226aa551357e29c15457e205c35c48638617beca58b5139c07dcd515fb96",
  "deadline_utc": "2026-09-07T11:10:00Z"
}
````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/run.py

SHA-256 `e691c3b178ee95317d2be9da272c316a9df3db90422070ec1d4bf63419580cae`; 4100 bytes.

````text
import datetime,fcntl,json,os,signal,sys,time
from pathlib import Path
ROOT=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path(__file__).parent;S=json.loads((P/'template.json').read_text());source=Path(S['source_root']);start=time.monotonic()
deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(deadline-time.time()-30)
if remaining<360:raise RuntimeError('external consumer needs at least six reserved minutes including its guard')
S['deadline_utc']=sys.argv[1];S['frozen_at']=datetime.datetime.now(datetime.timezone.utc).isoformat()
S['policy']['maximum_build_seconds']=min(600,remaining)
S['maximum_interval_seconds']=S['policy']['maximum_build_seconds']+20
S['wrapper_sha256']=digest(Path(__file__))
with (P/'protocol.json').open('x') as out:out.write(json.dumps(S,indent=2)+'\n')
r={'classification':S['classification'],'protocol_sha256':digest(P/'protocol.json'),'passed':False,'launched':False,'model_loaded':False}
def interrupted(number,_frame):raise KeyboardInterrupt(f'external consumer interrupted by signal {number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
def memory():
 s=vm_snapshot();require_normal(pressure_snapshot());return s
try:
 assert not (P/'manifest.json').exists()
 assert digest(Path(__file__))==S['wrapper_sha256']
 assert all(digest(ROOT/'Tools'/n)==h for n,h in S['drivers'].items())
 assert verified_build(S['base_candidate']['binary'])==S['base_candidate']
 assert all(digest(source/n)==h for n,h in S['source_sha256'].items())
 assert digest(source/'Tools/consumer_smoke.sh')==S['consumer_script_sha256']
 r['before']=preflight(9.5);require_normal(pressure_snapshot())
 if competing_jobs():raise RuntimeError('competing compiler/storage work; no consumer launched')
 with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
  for k in saved:os.environ.pop(k)
  os.environ.update(S['environment'])
  try:
   r['launched']=True
   print('Starting isolated external-consumer compilation (-j1).',flush=True)
   with (P/'stdout.txt').open('w') as out,(P/'stderr.txt').open('w') as err:
    result=guarded_run(S['command'],cwd=source,stdout=out,stderr=err,record_path=P/'memory.json',snapshot=memory,policy=S['policy'],classification=S['classification'])
   r['exit_code']=result.returncode
   assert result.returncode==0 and json.loads((P/'memory.json').read_text())['passed'] is True
   output=(P/'stdout.txt').read_text()
   assert output.startswith('consumer ok: ') and output.rstrip().endswith('assertions')
   assert all(digest(source/n)==h for n,h in S['source_sha256'].items())
   r['passed']=True
  finally:
   os.environ.pop('SLOTSTREAM_BUILD_JOBS',None);os.environ.update(saved)
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
 r['elapsed_seconds']=time.monotonic()-start
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
 for name,fn in [('after',vm_snapshot),('jobs',competing_jobs),('model_lock_free',lambda:bool(preflight(0))),
                 ('source_unchanged',lambda:all(digest(source/n)==h for n,h in S['source_sha256'].items()))]:
  try:r[name]=fn()
  except BaseException as e:r.setdefault('cleanup_errors',{})[name]=f'{type(e).__name__}: {e}'
 r['within_reservation']=time.time()<=deadline
 r['passed']=bool(r['passed'] and r['within_reservation'] and not r.get('cleanup_errors') and not r.get('jobs') and r.get('model_lock_free') and r.get('source_unchanged') and r['elapsed_seconds']<=S['maximum_interval_seconds'])
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/stdout.txt

SHA-256 `6ec5f0efba43b3e25deaf7d10b04f53102e73f6001df5915f1c6ee59590015e1`; 86 bytes.

````text
consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 22 assertions
````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/template.json

SHA-256 `fe22328172521978f7cf9cb7d89fd3903a82263334616ee6c4590b19308cdfc2`; 39836 bytes.

````text
{
  "classification": "Actual separate external consumer compiled from the exact V280 archived source, bounded by a concrete granted handback deadline. No model or shared-runtime rebuild or activation.",
  "source_root": "/tmp/slotstream-optimization-execution/candidate-consumer-v285/source",
  "base_candidate": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
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
      "source_archive_sha256": "56c60764434a75913ddb46d91ed7b38c66a6969ea46d5c1a6159ea55dd8143b4",
      "binary_sha256": "eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "source_sha256": {
    "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
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
  "changes_from_v255": {
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8"
  },
  "consumer_script_sha256": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/candidate-consumer-v285/source/Tools/consumer_smoke.sh"
  ],
  "environment": {
    "SLOTSTREAM_BUILD_JOBS": "1"
  },
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "stop_on_new_swapouts": true
  },
  "maximum_interval_seconds": 1220,
  "drivers": {
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70"
  },
  "wrapper_sha256": "0659061d75984c2ba149d9203cd009161d0280898f747c09bf112038f76caac1",
  "planner_proxy_prerequisite": {
    "path": "/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-manifest.json",
    "sha256": "3d80af4d4fe4a9ebbe550b450b8db7fe491563671ca9f3c238a2313f38cf1951"
  },
  "frozen_at": "2026-09-07T09:14:09.442631+00:00",
  "prepared_from_unrun_v285_protocol_sha256": "a76d226aa551357e29c15457e205c35c48638617beca58b5139c07dcd515fb96"
}
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v295/checks.sh

SHA-256 `65871ade3cb77990822497246202d05111192b5506286eb6810e9d3cee4c51fe`; 3513 bytes.

````text
#!/bin/bash
set -euo pipefail
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}

SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960


python3 - <<'QUIET'
import sys,time
sys.path.insert(0,'Tools')
from prefill_bench import vm_snapshot
from optimization_readiness import pressure_snapshot,require_normal
start=vm_snapshot()
for _ in range(30):
 time.sleep(2);now=vm_snapshot();require_normal(pressure_snapshot())
 if now['swapins']!=start['swapins'] or now['swapouts']!=start['swapouts']:
  raise SystemExit('long-memory pre-launch quiet interval had VM activity; long-memory request not launched')
print('PASS pre-launch 60-second no-VM observation (not a generation result)')
QUIET

python3 - <<'PYEOF' > /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/longmem.json \
  2>/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/longmem.err > /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/longmem.json /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification/longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"



echo "passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v295/protocol.json

SHA-256 `937d9eec448485d8bde7c8499b2bc7fca9014934e5d3cdec2c3fa11643fff098`; 38017 bytes.

````text
{
  "classification": "One exact original 7972-token long request after a successful 60-second no-VM preflight. Same V280 native binary, original generated prompt, 16-token allowance, 10 GB target, no-VM and physical/RSS criteria. V283 and V289 swap-excluded long attempts and V290 pre-launch quiet refusal remain preserved. First combined fixed32-cell study has fully completed and drained; this is a separate resource-only attempt, not part of its timings. MTP and governor have actual successful independent checks and are not repeated. No consumer compilation launched because its six-minute time preflight refused. This is not a full-suite pass.",
  "frozen_at": "2026-09-07T10:56:00.596252+00:00",
  "deadline_utc": "2026-09-07T11:10:00Z",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
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
      "source_archive_sha256": "56c60764434a75913ddb46d91ed7b38c66a6969ea46d5c1a6159ea55dd8143b4",
      "binary_sha256": "eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "native_prerequisites": [
    {
      "stage": "native/combined-plain",
      "status": "passed",
      "assertions": 242
    },
    {
      "stage": "native/combined-mtp",
      "status": "passed",
      "assertions": 256
    },
    {
      "stage": "native/read-failure-serving",
      "status": "passed",
      "assertions": 522
    }
  ],
  "native_contract_sha256": "15333ded4180d6b19a50a7b8bb7d3d1e33cfa95dcdce7fbf1e7c755a318ab9da",
  "wrapper_sha256": "3debd1736be5982f4ed885470168c58f16c9b4efa9f4877f2e28ce1a3658b119",
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 809,
    "stop_on_new_swapouts": false
  },
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "SLOTSTREAM_VERIFY_OUT": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v295/verification"
  },
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/long-memory-recovery-v295/checks.sh"
  ],
  "extracted_script_sha256": "65871ade3cb77990822497246202d05111192b5506286eb6810e9d3cee4c51fe",
  "source_verification_sha256": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
  "historical_counterexample": "/Users/carlos/Projects/slotstream/.build/optimization/full-verification-v283/manifest.json",
  "drivers": {
    "Tools/all_hit_replay.py": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/api_test.sh": "77bd216be56f3a309cff380c649af47edaff2d1d17e9dd9ad4f10fd489664c11",
    "Tools/brain_gates.sh": "7f32151567f0e64f8ed9619e5551bc7716aaf24be6b19fc0c62496b1dd44df2b",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/cache_policy_confirmation.py": "a2d0108f30b64b4838064ba0d450e49a28c8aca43ad0a41dcd1c30760e475748",
    "Tools/cache_policy_probe.py": "93ce0ec7cb98cd16cca46509089864d6267c3e080a2172615beadd3f69632a81",
    "Tools/cachesim.py": "0f6c304c69f88d49b1e3e699a0230d4c90de937baffc02aec52bf38429004f38",
    "Tools/claims_gate.py": "12a76b03bdf78ca0d71ea00a757684d19a137582b432875d10a670f583dcbced",
    "Tools/compute_islands.py": "9c25400b28ad425bba9e752138a967882d573432e6093d4b898da6dca266b985",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/context_window_matrix.py": "b24e904c0d64b61e08ad33779505445c51f2a00de8e556f14167042390495104",
    "Tools/context_window_matrix_test.py": "37f59dd7674175cf53e87f2bb2663a27c732eed5f9382508b578e96fa9cdef52",
    "Tools/coverage-floor.json": "6eca5d16f69f3bb1a4cd88d1036fa074d1232ed8d8d630cda80c91c309c0b828",
    "Tools/coverage.sh": "bc52a65b95dadbd15391f9a636287611f1117e8decf56e14e189da2d7abd90b6",
    "Tools/coverage_ratchet.py": "9bf8c570b83d6a89acd1b005d1ed051bb8125c5281424c0b294d3b46cd753a06",
    "Tools/coverage_ratchet_test.py": "ed632f76757cc7dfb346de92d1c8b00fcbd6596b4363d093beebbfc67af43a93",
    "Tools/dbmd_install.sh": "8b892df4f2232db0fac42b8bf1585371e652d13c9cd9094c8190e3f957e58e1e",
    "Tools/debug0_ref.py": "930d258ed12c6d60e7db4506a25677e4fe60e8da07cddb244c7740ebb66ca6f1",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2",
    "Tools/expert_layout_probe_test.py": "e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/optimization/acceptance.txt": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "Tools/fixtures/optimization/code-brief-development.txt": "722e4b8140be24e5345e37aa4ca2ad6c15c04a984cf132848557d8261ba969c2",
    "Tools/fixtures/optimization/code.txt": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
    "Tools/fixtures/optimization/floor-cache-confirmation.txt": "3f9ff23888e4e55e84e79ecf17f9ba347d32e58840a5fadbad291ed782203668",
    "Tools/fixtures/optimization/indexer-code-development.txt": "ae15397152799641172b585529c10fda7faa313875b504e34858e69472b95c68",
    "Tools/fixtures/optimization/prose-distinct-tail.txt": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
    "Tools/fixtures/optimization/prose.txt": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/fixtures/optimization/runtime-budget-confirmation.txt": "055164841f47a5aa6185d82f09611bea5f7723d37298d9bd371de15452e29dda",
    "Tools/fixtures/optimization/short.txt": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
    "Tools/fx_gates.sh": "035f425d0becb017f9c8e2fd71bdabb52e61f17d69c10ef5194688bb8f20a20e",
    "Tools/fx_scenarios.py": "f8418efaac463b0969f9518f909aafcfb30c9732606b4bcfc811b45a49a66d3e",
    "Tools/gateway_client_gate.mjs": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
    "Tools/gdn_profile.py": "f4483f1c78ffc9f70439688f3336abd41768458a87117950fc1b4f3e2879923e",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
    "Tools/indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "Tools/indexer_score_probe_test.py": "1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "Tools/installer_gates_binary_test.py": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
    "Tools/llms_full.sh": "3f2c9694f274697a2eb63288e1ea7b0e774e82ffad1a9a9483f4ef2c9e7cbcef",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/monotonic_plan.py": "3ab76df40092ccab549a92ae2ef5ae457f7ad3ab8adc8512ee749ef1c05355bd",
    "Tools/mtp_convert.py": "22f58712346b67a35cdc0d7a4da45a665335ae9382e104156aff16e91b7b053d",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/ngram_cache_probe_test.py": "05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3",
    "Tools/ngram_lookahead_bench.py": "9492467ff3a03154da642f51848a9cbaedc02509f76ae78d3533868bbfd1d02f",
    "Tools/openai_tools_gate.py": "28f571e0f774f9717d6469a926083b17b3ec6b607cea1d72ec84d76912832357",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/optimization_build_test.py": "cfa7367792c17d4d8617ac2e16161043471714297355bfa0b0de508defea3c95",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_check.py": "61d050207c1074131de4f5917bcfcc50373f9d105688ba0185c19febaa6f1462",
    "Tools/optimization_component.py": "cbdab6f194dbb8acdee13d5efc484aae4dd7aa3d8431d9033d77f1bd9785904a",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_results.py": "d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c",
    "Tools/optimization_results_test.py": "7cc829aa16726312d115dad41692010a19c5637f6206bc481fd721eae99c15e1",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/packed_layout_build.py": "2f780a584bd0d5b461cfbf3cfc32b992ebc3480afb6bf78cb167af9ca8fba8ab",
    "Tools/parity_ref.py": "cb938f6215f1433bbc6eef2b8cc04a8a9cf9d5953f487347649637fa911abab6",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/prefill_bench.sh": "68a6695ab67766626394637dcdaaee1db53fc06077a4ed7310e8a006bfa5de66",
    "Tools/prefill_bench_test.py": "fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/projections.py": "90a02090829c0dae88d69846f8a0f55bd2b039e3f12c549aa58b175f4e842355",
    "Tools/pull-bench-linux/Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "Tools/pull-bench-linux/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Tools/pull_bench_linux.sh": "2062f832627a33edc8103559c74e647b6aeb1145e0043d3ab310c2205de304eb",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/reference/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "Tools/reference/generation_config.json": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e",
    "Tools/reference/make_mtp_fixture.py": "7d54481d25ffdacb7ef52b3ef345a817d4c0783e6340224edebe587a9d8f0d52",
    "Tools/reference/model.safetensors.index.json": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d",
    "Tools/reference/mtp_ref.py": "f28827ac0409fe58b9c255f16add5ecb00b17a2310a3521d75a677f2d4a84f24",
    "Tools/reference/qwen4_exp.py": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e",
    "Tools/reference/tensor_shapes.json": "302d9926b8d1770c1a11f1fdd9d199b136865117f427dcb29e512c7d6dd4c780",
    "Tools/rope_component.py": "f8e56f6d33c98cc50a64efe67b5c184bb0a4ebdff26ca4aa3e34f5434fb202ca",
    "Tools/run_model.py": "00ea3727aed92fcc17df1e16f4284f8840145558cf776e08429eb1884eb7b8c0",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_gates_test.py": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/selected_attention_probe.py": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/slotbench.py": "d27b4d18f75f423443f1b4a8dd4da50965fa1885d531029f0c7f0baecdf24262",
    "Tools/slotbench2.py": "0d38017db9e74141df23664083a0c520458e3a531d5d865ad19ab6e23bdd2711",
    "Tools/slotbench3.py": "7518329fcb4217760689f5c8bc5cbd268c5220ca0a38f2289af9c7d84c8e2e05",
    "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901",
    "Tools/slotpack/ManifestChecks.swift": "5aafa4ccc88f314ca53df842d3b81b67074a8bb2c4e89d2d55a9617aaf285166",
    "Tools/slotpack/TransferProbe.swift": "5714c073ab24581c412bae3c131cb04bbd84c899281c350117e3cbfa4a6e4031",
    "Tools/slotpack/checks.py": "59a598a3d77b9fa38117e4437fd11aa52982fcb833000a62c25b2e990d4165b3",
    "Tools/slotpack/cli_checks.py": "a67f5d06d09a713051fea673562a95367e76f8cfb4ac8fe3b1592781c39470d7",
    "Tools/slotpack/coverage.py": "c53cb1fd611ab6fc690db0fc1db1b816e4d0e5379420874545b8760bfd9fe644",
    "Tools/slotpack/download_checks.py": "7958ef42e29b4885319186a4bccd6e5dd3e2b20cbea9cbbf971554bf353657ef",
    "Tools/slotpack/embed.py": "9c0d98858b54353584ab92abd45b85ed3894e0004e38f1e2945d8ab6d6ee8c94",
    "Tools/slotpack/fetch_build_inputs.py": "a6f5b52aad619d6aef58e527ca42d7743e1e45c568dd2287c7f80800c18c31c1",
    "Tools/slotpack/full_pull.py": "b925415dae87b6f240d875e67fe5a9684534e6d96dd953424082fe80c54ecb96",
    "Tools/slotpack/memory_checks.py": "e0494906ac1a8673ee41ec0f60e5971626afc958e4caa49dc29090187e1447f0",
    "Tools/slotpack/pack.py": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
    "Tools/slotpack/public_probe.py": "33dc5a003b4f59356e208f4330370c905a51fb515ddccf27a9dae471cd76d10a",
    "Tools/slotpack/publish_hf.py": "e9a7a07198bd3eddc1dadd94d8dd8729b8528282992c049eb00dcbcf93cf190e",
    "Tools/slotpack/publish_hf_checks.py": "76a3f41abe9b16239a9d32e6fb4b50f4f8e323076d04803a31f02f4162aa587c",
    "Tools/slotpack/publish_r2.py": "cdd39ae06637800dc02e84c948c5b2c50c2c9abec71673f299dfb8d1112b9684",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94",
    "Tools/star_history.py": "58801509a122439429f675295041e35aae89504a638ff31eb76fe97979d7152f",
    "Tools/static_gates.sh": "e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7",
    "Tools/static_gates_binary_test.py": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33",
    "Tools/trace_convert.py": "8ea22dda841860f0f829203c4ece5f68c515c13a39f2c6122bc309a2150f0079",
    "Tools/trace_routers.py": "32ff38f4f0f02d9679dcd16fc57f64694836416baf666075151e9f208be23da6",
    "Tools/verify.sh": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
    "Tools/verify_binary_test.py": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762",
    "Tools/verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "Tools/vision_attention_probe.py": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412",
    "Tools/vision_qualification.py": "5deff2ad8469d8a54b477262d701a8b386395d265df029c37bd7ee6b8812b165",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
  },
  "limits": "No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit."
}
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v295/run.py

SHA-256 `3debd1736be5982f4ed885470168c58f16c9b4efa9f4877f2e28ce1a3658b119`; 6076 bytes.

````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/read-failure-candidate-build-v280/candidate/slotstream'
OUT=ROOT/'.build/optimization/long-memory-recovery-v295'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<240:raise RuntimeError('exact long-memory recovery requires at least four reserved minutes')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/read-failure-candidate-campaign-v281'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'One exact original 7972-token long request after a successful 60-second no-VM preflight. Same V280 native binary, original generated prompt, 16-token allowance, 10 GB target, no-VM and physical/RSS criteria. V283 and V289 swap-excluded long attempts and V290 pre-launch quiet refusal remain preserved. First combined fixed32-cell study has fully completed and drained; this is a separate resource-only attempt, not part of its timings. MTP and governor have actual successful independent checks and are not repeated. No consumer compilation launched because its six-minute time preflight refused. This is not a full-suite pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(P/'checks.sh')],
 'extracted_script_sha256':digest(P/'checks.sh'),
 'source_verification_sha256':digest(ROOT/'Tools/verify.sh'),
 'historical_counterexample':str(ROOT/'.build/optimization/full-verification-v283/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
P.joinpath('protocol.json').write_text(json.dumps(S,indent=2)+'\n')
OUT.mkdir(exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
with (OUT/'pressure.samples.jsonl').open('x') as observations:
 def snapshot():
  state=vm_snapshot();pressure=pressure_snapshot();observations.write(json.dumps({'seconds':time.monotonic()-started,'vm':state,'pressure':pressure})+'\n');observations.flush();require_normal(pressure);return state
 try:
  r['before']=preflight(21);snapshot();assert not competing_jobs()
  assert (ROOT/'.venv31/bin/python').exists()
  for k in saved:os.environ.pop(k,None)
  os.environ.update(S['environment'])
  with (OUT/'stdout.txt').open('w') as stdout,(OUT/'stderr.txt').open('w') as stderr:
   result=guarded_run(S['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=OUT/'memory.json',snapshot=snapshot,policy=POLICY,classification=S['classification'])
  r['exit_code']=result.returncode
  report=(OUT/'stdout.txt').read_text();summary=re.findall(r'^passed (\d+), failed (\d+)$',report,re.M)
  r['summary']=summary;r['skips']=re.findall(r'^SKIP.*$',report,re.M);r['failures']=re.findall(r'^FAIL.*$',report,re.M)
  r['passed']=result.returncode==0 and len(summary)==1 and int(summary[0][0])>0 and summary[0][1]=='0' and not r['skips'] and not r['failures']
 except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
 finally:
  for k in list(os.environ):
   if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
  os.environ.update(saved)
  r['elapsed_seconds']=time.monotonic()-started
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'checks.sh')==S['extracted_script_sha256'],
   'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:r[n]=f()
   except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
  r['within_reservation']=time.time()<=DEADLINE
  r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged')
   and not r.get('remaining_jobs') and r.get('model_lock_free') and r.get('pressure',{}).get('level')==1 and r['within_reservation'])
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v297/checks.sh

SHA-256 `472f18053a92cd18fa443353c72169a6c1f4b4ade3efa624b182c3a7971fcab7`; 3513 bytes.

````text
#!/bin/bash
set -euo pipefail
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}

SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960


python3 - <<'QUIET'
import sys,time
sys.path.insert(0,'Tools')
from prefill_bench import vm_snapshot
from optimization_readiness import pressure_snapshot,require_normal
start=vm_snapshot()
for _ in range(30):
 time.sleep(2);now=vm_snapshot();require_normal(pressure_snapshot())
 if now['swapins']!=start['swapins'] or now['swapouts']!=start['swapouts']:
  raise SystemExit('long-memory pre-launch quiet interval had VM activity; long-memory request not launched')
print('PASS pre-launch 60-second no-VM observation (not a generation result)')
QUIET

python3 - <<'PYEOF' > /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/longmem.json \
  2>/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/longmem.err > /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/longmem.json /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification/longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"



echo "passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v297/preparation.json

SHA-256 `4f78afa46c69bdbd25e215aebf2b849c5a8b6082361df3e53a28418a25b9c039`; 585 bytes.

````text
{
  "prepared_at": "2026-09-07T11:02:05.549151+00:00",
  "launched": false,
  "original_command_gate": "Tools/verify.sh run_model -> safety_before13 for10GBlong request",
  "removed_extra_wrapper_floor_gb": 21,
  "startup_reclaimable_gb": 13,
  "generation_target_gb": 10,
  "live_headroom_gb": 3,
  "absolute_physical_rss_and_zero_vm_criteria_unchanged": true,
  "rationale": "The full-suite floor includes larger governor/vision profiles absent from this one exact text-only check. Using its actual source-defined target-plus3GB avoids needlessly refusing a safe bounded request."
}
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v297/protocol.json

SHA-256 `8024ce9cd32ec395b1153db813f682fcf83320dc965577ee4444de25be858aef`; 38304 bytes.

````text
{
  "classification": "One exact original 7972-token long request after a successful 60-second no-VM preflight. Same V280 native binary, original generated prompt, 16-token allowance, 10 GB target, no-VM and physical/RSS criteria. V283 and V289 swap-excluded long attempts and V290 pre-launch quiet refusal remain preserved. V295 refused before launch because the inherited full-suite21GB wrapper floor remained, although original verify.sh run_model requires13GB for this exact10GB workload. This successor uses that original13GB prerequisite; inner10GB sampled/RSS/no-VM gates and3GB live floor are unchanged. First combined fixed32-cell study has fully completed and drained; this is a separate resource-only attempt, not part of its timings. MTP and governor have actual successful independent checks and are not repeated. No consumer compilation launched because its six-minute time preflight refused. This is not a full-suite pass.",
  "frozen_at": "2026-09-07T11:02:44.987907+00:00",
  "deadline_utc": "2026-09-07T11:10:00Z",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
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
      "source_archive_sha256": "56c60764434a75913ddb46d91ed7b38c66a6969ea46d5c1a6159ea55dd8143b4",
      "binary_sha256": "eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "native_prerequisites": [
    {
      "stage": "native/combined-plain",
      "status": "passed",
      "assertions": 242
    },
    {
      "stage": "native/combined-mtp",
      "status": "passed",
      "assertions": 256
    },
    {
      "stage": "native/read-failure-serving",
      "status": "passed",
      "assertions": 522
    }
  ],
  "native_contract_sha256": "15333ded4180d6b19a50a7b8bb7d3d1e33cfa95dcdce7fbf1e7c755a318ab9da",
  "wrapper_sha256": "ae6cc9175be3f99211f265ebb2a7b0df366843d9a3e785981f8fca9486dd43a7",
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 405,
    "stop_on_new_swapouts": false
  },
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "SLOTSTREAM_VERIFY_OUT": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v297/verification"
  },
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/long-memory-recovery-v297/checks.sh"
  ],
  "extracted_script_sha256": "472f18053a92cd18fa443353c72169a6c1f4b4ade3efa624b182c3a7971fcab7",
  "source_verification_sha256": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
  "historical_counterexample": "/Users/carlos/Projects/slotstream/.build/optimization/full-verification-v283/manifest.json",
  "drivers": {
    "Tools/all_hit_replay.py": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/api_test.sh": "77bd216be56f3a309cff380c649af47edaff2d1d17e9dd9ad4f10fd489664c11",
    "Tools/brain_gates.sh": "7f32151567f0e64f8ed9619e5551bc7716aaf24be6b19fc0c62496b1dd44df2b",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/cache_policy_confirmation.py": "a2d0108f30b64b4838064ba0d450e49a28c8aca43ad0a41dcd1c30760e475748",
    "Tools/cache_policy_probe.py": "93ce0ec7cb98cd16cca46509089864d6267c3e080a2172615beadd3f69632a81",
    "Tools/cachesim.py": "0f6c304c69f88d49b1e3e699a0230d4c90de937baffc02aec52bf38429004f38",
    "Tools/claims_gate.py": "12a76b03bdf78ca0d71ea00a757684d19a137582b432875d10a670f583dcbced",
    "Tools/compute_islands.py": "9c25400b28ad425bba9e752138a967882d573432e6093d4b898da6dca266b985",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/context_window_matrix.py": "b24e904c0d64b61e08ad33779505445c51f2a00de8e556f14167042390495104",
    "Tools/context_window_matrix_test.py": "37f59dd7674175cf53e87f2bb2663a27c732eed5f9382508b578e96fa9cdef52",
    "Tools/coverage-floor.json": "6eca5d16f69f3bb1a4cd88d1036fa074d1232ed8d8d630cda80c91c309c0b828",
    "Tools/coverage.sh": "bc52a65b95dadbd15391f9a636287611f1117e8decf56e14e189da2d7abd90b6",
    "Tools/coverage_ratchet.py": "9bf8c570b83d6a89acd1b005d1ed051bb8125c5281424c0b294d3b46cd753a06",
    "Tools/coverage_ratchet_test.py": "ed632f76757cc7dfb346de92d1c8b00fcbd6596b4363d093beebbfc67af43a93",
    "Tools/dbmd_install.sh": "8b892df4f2232db0fac42b8bf1585371e652d13c9cd9094c8190e3f957e58e1e",
    "Tools/debug0_ref.py": "930d258ed12c6d60e7db4506a25677e4fe60e8da07cddb244c7740ebb66ca6f1",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2",
    "Tools/expert_layout_probe_test.py": "e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/optimization/acceptance.txt": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "Tools/fixtures/optimization/code-brief-development.txt": "722e4b8140be24e5345e37aa4ca2ad6c15c04a984cf132848557d8261ba969c2",
    "Tools/fixtures/optimization/code.txt": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
    "Tools/fixtures/optimization/floor-cache-confirmation.txt": "3f9ff23888e4e55e84e79ecf17f9ba347d32e58840a5fadbad291ed782203668",
    "Tools/fixtures/optimization/indexer-code-development.txt": "ae15397152799641172b585529c10fda7faa313875b504e34858e69472b95c68",
    "Tools/fixtures/optimization/prose-distinct-tail.txt": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
    "Tools/fixtures/optimization/prose.txt": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/fixtures/optimization/runtime-budget-confirmation.txt": "055164841f47a5aa6185d82f09611bea5f7723d37298d9bd371de15452e29dda",
    "Tools/fixtures/optimization/short.txt": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
    "Tools/fx_gates.sh": "035f425d0becb017f9c8e2fd71bdabb52e61f17d69c10ef5194688bb8f20a20e",
    "Tools/fx_scenarios.py": "f8418efaac463b0969f9518f909aafcfb30c9732606b4bcfc811b45a49a66d3e",
    "Tools/gateway_client_gate.mjs": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
    "Tools/gdn_profile.py": "f4483f1c78ffc9f70439688f3336abd41768458a87117950fc1b4f3e2879923e",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
    "Tools/indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "Tools/indexer_score_probe_test.py": "1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "Tools/installer_gates_binary_test.py": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
    "Tools/llms_full.sh": "3f2c9694f274697a2eb63288e1ea7b0e774e82ffad1a9a9483f4ef2c9e7cbcef",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/monotonic_plan.py": "3ab76df40092ccab549a92ae2ef5ae457f7ad3ab8adc8512ee749ef1c05355bd",
    "Tools/mtp_convert.py": "22f58712346b67a35cdc0d7a4da45a665335ae9382e104156aff16e91b7b053d",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/ngram_cache_probe_test.py": "05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3",
    "Tools/ngram_lookahead_bench.py": "9492467ff3a03154da642f51848a9cbaedc02509f76ae78d3533868bbfd1d02f",
    "Tools/openai_tools_gate.py": "28f571e0f774f9717d6469a926083b17b3ec6b607cea1d72ec84d76912832357",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/optimization_build_test.py": "cfa7367792c17d4d8617ac2e16161043471714297355bfa0b0de508defea3c95",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_check.py": "61d050207c1074131de4f5917bcfcc50373f9d105688ba0185c19febaa6f1462",
    "Tools/optimization_component.py": "cbdab6f194dbb8acdee13d5efc484aae4dd7aa3d8431d9033d77f1bd9785904a",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_results.py": "1842f0f1b0c39845272cd0babaf89a11a835035b20e6feb6191efb040c727b35",
    "Tools/optimization_results_test.py": "766c73cfabbc10c42549fe77a6f6f9a20a67e33c5d346b217587af6b688f38a1",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/packed_layout_build.py": "2f780a584bd0d5b461cfbf3cfc32b992ebc3480afb6bf78cb167af9ca8fba8ab",
    "Tools/parity_ref.py": "cb938f6215f1433bbc6eef2b8cc04a8a9cf9d5953f487347649637fa911abab6",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/prefill_bench.sh": "68a6695ab67766626394637dcdaaee1db53fc06077a4ed7310e8a006bfa5de66",
    "Tools/prefill_bench_test.py": "fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/projections.py": "90a02090829c0dae88d69846f8a0f55bd2b039e3f12c549aa58b175f4e842355",
    "Tools/pull-bench-linux/Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "Tools/pull-bench-linux/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Tools/pull_bench_linux.sh": "2062f832627a33edc8103559c74e647b6aeb1145e0043d3ab310c2205de304eb",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/reference/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "Tools/reference/generation_config.json": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e",
    "Tools/reference/make_mtp_fixture.py": "7d54481d25ffdacb7ef52b3ef345a817d4c0783e6340224edebe587a9d8f0d52",
    "Tools/reference/model.safetensors.index.json": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d",
    "Tools/reference/mtp_ref.py": "f28827ac0409fe58b9c255f16add5ecb00b17a2310a3521d75a677f2d4a84f24",
    "Tools/reference/qwen4_exp.py": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e",
    "Tools/reference/tensor_shapes.json": "302d9926b8d1770c1a11f1fdd9d199b136865117f427dcb29e512c7d6dd4c780",
    "Tools/rope_component.py": "f8e56f6d33c98cc50a64efe67b5c184bb0a4ebdff26ca4aa3e34f5434fb202ca",
    "Tools/run_model.py": "00ea3727aed92fcc17df1e16f4284f8840145558cf776e08429eb1884eb7b8c0",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_gates_test.py": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/selected_attention_probe.py": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/slotbench.py": "d27b4d18f75f423443f1b4a8dd4da50965fa1885d531029f0c7f0baecdf24262",
    "Tools/slotbench2.py": "0d38017db9e74141df23664083a0c520458e3a531d5d865ad19ab6e23bdd2711",
    "Tools/slotbench3.py": "7518329fcb4217760689f5c8bc5cbd268c5220ca0a38f2289af9c7d84c8e2e05",
    "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901",
    "Tools/slotpack/ManifestChecks.swift": "5aafa4ccc88f314ca53df842d3b81b67074a8bb2c4e89d2d55a9617aaf285166",
    "Tools/slotpack/TransferProbe.swift": "5714c073ab24581c412bae3c131cb04bbd84c899281c350117e3cbfa4a6e4031",
    "Tools/slotpack/checks.py": "59a598a3d77b9fa38117e4437fd11aa52982fcb833000a62c25b2e990d4165b3",
    "Tools/slotpack/cli_checks.py": "a67f5d06d09a713051fea673562a95367e76f8cfb4ac8fe3b1592781c39470d7",
    "Tools/slotpack/coverage.py": "c53cb1fd611ab6fc690db0fc1db1b816e4d0e5379420874545b8760bfd9fe644",
    "Tools/slotpack/download_checks.py": "7958ef42e29b4885319186a4bccd6e5dd3e2b20cbea9cbbf971554bf353657ef",
    "Tools/slotpack/embed.py": "9c0d98858b54353584ab92abd45b85ed3894e0004e38f1e2945d8ab6d6ee8c94",
    "Tools/slotpack/fetch_build_inputs.py": "a6f5b52aad619d6aef58e527ca42d7743e1e45c568dd2287c7f80800c18c31c1",
    "Tools/slotpack/full_pull.py": "b925415dae87b6f240d875e67fe5a9684534e6d96dd953424082fe80c54ecb96",
    "Tools/slotpack/memory_checks.py": "e0494906ac1a8673ee41ec0f60e5971626afc958e4caa49dc29090187e1447f0",
    "Tools/slotpack/pack.py": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
    "Tools/slotpack/public_probe.py": "33dc5a003b4f59356e208f4330370c905a51fb515ddccf27a9dae471cd76d10a",
    "Tools/slotpack/publish_hf.py": "e9a7a07198bd3eddc1dadd94d8dd8729b8528282992c049eb00dcbcf93cf190e",
    "Tools/slotpack/publish_hf_checks.py": "76a3f41abe9b16239a9d32e6fb4b50f4f8e323076d04803a31f02f4162aa587c",
    "Tools/slotpack/publish_r2.py": "cdd39ae06637800dc02e84c948c5b2c50c2c9abec71673f299dfb8d1112b9684",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94",
    "Tools/star_history.py": "58801509a122439429f675295041e35aae89504a638ff31eb76fe97979d7152f",
    "Tools/static_gates.sh": "e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7",
    "Tools/static_gates_binary_test.py": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33",
    "Tools/trace_convert.py": "8ea22dda841860f0f829203c4ece5f68c515c13a39f2c6122bc309a2150f0079",
    "Tools/trace_routers.py": "32ff38f4f0f02d9679dcd16fc57f64694836416baf666075151e9f208be23da6",
    "Tools/verify.sh": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
    "Tools/verify_binary_test.py": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762",
    "Tools/verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "Tools/vision_attention_probe.py": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412",
    "Tools/vision_qualification.py": "5deff2ad8469d8a54b477262d701a8b386395d265df029c37bd7ee6b8812b165",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
  },
  "limits": "No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit."
}
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v297/run.py

SHA-256 `ae6cc9175be3f99211f265ebb2a7b0df366843d9a3e785981f8fca9486dd43a7`; 6363 bytes.

````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/read-failure-candidate-build-v280/candidate/slotstream'
OUT=ROOT/'.build/optimization/long-memory-recovery-v297'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<240:raise RuntimeError('exact long-memory recovery requires at least four reserved minutes')
POLICY={'startup_reclaimable_bytes':13_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/read-failure-candidate-campaign-v281'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'One exact original 7972-token long request after a successful 60-second no-VM preflight. Same V280 native binary, original generated prompt, 16-token allowance, 10 GB target, no-VM and physical/RSS criteria. V283 and V289 swap-excluded long attempts and V290 pre-launch quiet refusal remain preserved. V295 refused before launch because the inherited full-suite21GB wrapper floor remained, although original verify.sh run_model requires13GB for this exact10GB workload. This successor uses that original13GB prerequisite; inner10GB sampled/RSS/no-VM gates and3GB live floor are unchanged. First combined fixed32-cell study has fully completed and drained; this is a separate resource-only attempt, not part of its timings. MTP and governor have actual successful independent checks and are not repeated. No consumer compilation launched because its six-minute time preflight refused. This is not a full-suite pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(P/'checks.sh')],
 'extracted_script_sha256':digest(P/'checks.sh'),
 'source_verification_sha256':digest(ROOT/'Tools/verify.sh'),
 'historical_counterexample':str(ROOT/'.build/optimization/full-verification-v283/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
P.joinpath('protocol.json').write_text(json.dumps(S,indent=2)+'\n')
OUT.mkdir(exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
with (OUT/'pressure.samples.jsonl').open('x') as observations:
 def snapshot():
  state=vm_snapshot();pressure=pressure_snapshot();observations.write(json.dumps({'seconds':time.monotonic()-started,'vm':state,'pressure':pressure})+'\n');observations.flush();require_normal(pressure);return state
 try:
  r['before']=preflight(13);snapshot();assert not competing_jobs()
  assert (ROOT/'.venv31/bin/python').exists()
  for k in saved:os.environ.pop(k,None)
  os.environ.update(S['environment'])
  with (OUT/'stdout.txt').open('w') as stdout,(OUT/'stderr.txt').open('w') as stderr:
   result=guarded_run(S['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=OUT/'memory.json',snapshot=snapshot,policy=POLICY,classification=S['classification'])
  r['exit_code']=result.returncode
  report=(OUT/'stdout.txt').read_text();summary=re.findall(r'^passed (\d+), failed (\d+)$',report,re.M)
  r['summary']=summary;r['skips']=re.findall(r'^SKIP.*$',report,re.M);r['failures']=re.findall(r'^FAIL.*$',report,re.M)
  r['passed']=result.returncode==0 and len(summary)==1 and int(summary[0][0])>0 and summary[0][1]=='0' and not r['skips'] and not r['failures']
 except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
 finally:
  for k in list(os.environ):
   if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
  os.environ.update(saved)
  r['elapsed_seconds']=time.monotonic()-started
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'checks.sh')==S['extracted_script_sha256'],
   'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:r[n]=f()
   except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
  r['within_reservation']=time.time()<=DEADLINE
  r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged')
   and not r.get('remaining_jobs') and r.get('model_lock_free') and r.get('pressure',{}).get('level')==1 and r['within_reservation'])
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

