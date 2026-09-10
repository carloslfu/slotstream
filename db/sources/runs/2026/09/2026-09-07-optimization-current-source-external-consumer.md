---
type: run
id: 01m1xda089a9tp8q6084hrvv9b
created: 2026-09-07T07:46:14.921682+00:00
updated: 2026-09-07T07:46:15.226947+00:00
summary: Actual external consumer compiles the combined defaults with current planner device extraction
binary: Per-file exact binary/source identities retained; current-source release build did not publish a candidate
captured_at: 2026-09-07
command: python3 /tmp/slotstream-optimization-execution/current-source-consumer-v268/run.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Actual external consumer compiles the combined defaults with current planner device extraction
tool: python3
---
# Actual external consumer compiles the combined defaults with current planner device extraction

V268 compiles and runs a real external SwiftPM consumer against150hash-bound source inputs: V255 combined defaults/planner plus the context device-method extraction. Public library imports, legacy function-value signatures, original reference initializer, explicit optimization opt-out and typed context-policy calls pass. The consumer prints its real successful result after263.85914925seconds; no model is loaded. The original serial build policy retains9.5GBstartup,6GBlive,3GBowned RSS, one compiler job, normal OS pressure and zero new swapouts. The1140samples show minimum reclaimable8397832192bytes, maximum owned RSS1248903168bytes and60swapins/zero swapouts. Existing consumer-source bytes remain exact and no compiler/model jobs survive. This is real source compatibility, not a release binary, capacity, throughput, clean VM performance result or activation. The later shared Makefile adds only a context-test target, and is independently bound by the next candidate build.

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/manifest.json

SHA-256 `f0fbfe393a1e2ca27a67bbf52a19fcef8ad7e9e6bc0bdb0ba4975235030bba9b`; 4525 bytes.

````text
{
  "classification": "Real external-consumer source compatibility on proposed combined defaults plus current context device-observer seam. No model execution, final binary or default activation.",
  "protocol_sha256": "875f9ed85bb31a4b89bfcd4e366ff48e7b6d45540f938a74968891a8aba63f36",
  "passed": true,
  "launched": true,
  "model_loaded": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 9608069120,
    "swapins": 44112315,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4180.\nPages active:                                1134995.\nPages inactive:                              1123355.\nPages speculative:                             18822.\nPages throttled:                                   0.\nPages wired down:                             293341.\nPages purgeable:                               20386.\n\"Translation faults\":                    15403793390.\nPages copy-on-write:                       734743968.\nPages zero filled:                       21214262300.\nPages reactivated:                        3469914941.\nPages purged:                               72212016.\nFile-backed pages:                            561864.\nAnonymous pages:                             1715308.\nPages stored in compressor:                  1378192.\nPages occupied by compressor:                 510783.\nDecompressions:                           1171701242.\nCompressions:                             1486110041.\nPageins:                                  7614987537.\nPageouts:                                   11074459.\nSwapins:                                    44112315.\nSwapouts:                                   77525566.\nPages tagged:                                 185143.\nPages tagged resident:                        159253.\nPages tagged compressed:                       25890.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11164.\nPages tag-storage free:                          181.\nPages tag-storage non-tag pageable:            86951.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3684032.\nTagged compressions:                        11243974.\nTagged decompressions:                      10386192.\n"
  },
  "exit_code": 0,
  "elapsed_seconds": 263.85914925000003,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 17019666432,
    "swapins": 44112375,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     7828.\nPages active:                                 948255.\nPages inactive:                               931306.\nPages speculative:                             15603.\nPages throttled:                                   0.\nPages wired down:                             277845.\nPages purgeable:                               10238.\n\"Translation faults\":                    15415730699.\nPages copy-on-write:                       735669000.\nPages zero filled:                       21220916197.\nPages reactivated:                        3470830389.\nPages purged:                               72233485.\nFile-backed pages:                           1020732.\nAnonymous pages:                              874432.\nPages stored in compressor:                  2152210.\nPages occupied by compressor:                 904538.\nDecompressions:                           1171853701.\nCompressions:                             1487057788.\nPageins:                                  7621631983.\nPageouts:                                   11080124.\nSwapins:                                    44112375.\nSwapouts:                                   77525566.\nPages tagged:                                 178792.\nPages tagged resident:                        122785.\nPages tagged compressed:                       56007.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7940.\nPages tag-storage free:                          237.\nPages tag-storage non-tag pageable:            90119.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8798144.\nTagged compressions:                        11276732.\nTagged decompressions:                      10388817.\n"
  },
  "jobs": [],
  "model_lock_free": true,
  "source_unchanged": true
}
````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/memory.json

SHA-256 `042fb16f67d0c8b68c17561c074999d3eda731b10174abed4293812e87374064`; 252718 bytes.

````text
{
  "command": [
    "bash",
    "Tools/consumer_smoke.sh"
  ],
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "stop_on_new_swapouts": true
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 9608544256,
    "swapins": 44112315,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4209.\nPages active:                                1135011.\nPages inactive:                              1123355.\nPages speculative:                             18822.\nPages throttled:                                   0.\nPages wired down:                             293341.\nPages purgeable:                               20386.\n\"Translation faults\":                    15403796096.\nPages copy-on-write:                       734744425.\nPages zero filled:                       21214263463.\nPages reactivated:                        3469914941.\nPages purged:                               72212016.\nFile-backed pages:                            561864.\nAnonymous pages:                             1715324.\nPages stored in compressor:                  1378192.\nPages occupied by compressor:                 510783.\nDecompressions:                           1171701242.\nCompressions:                             1486110041.\nPageins:                                  7614987540.\nPageouts:                                   11074459.\nSwapins:                                    44112315.\nSwapouts:                                   77525566.\nPages tagged:                                 185143.\nPages tagged resident:                        159253.\nPages tagged compressed:                       25890.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                11164.\nPages tag-storage free:                          181.\nPages tag-storage non-tag pageable:            86951.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3684032.\nTagged compressions:                        11243974.\nTagged decompressions:                      10386192.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0015608749999999894,
      "owned_rss_bytes": 2129920,
      "owned_process_count": 1,
      "reclaimable_bytes": 9604284416,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.2286605,
      "owned_rss_bytes": 20807680,
      "owned_process_count": 3,
      "reclaimable_bytes": 9766305792,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.455621875,
      "owned_rss_bytes": 68288512,
      "owned_process_count": 3,
      "reclaimable_bytes": 9750167552,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.6829775840000001,
      "owned_rss_bytes": 53706752,
      "owned_process_count": 3,
      "reclaimable_bytes": 9777364992,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.911815292,
      "owned_rss_bytes": 53706752,
      "owned_process_count": 3,
      "reclaimable_bytes": 9754574848,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.1431354169999999,
      "owned_rss_bytes": 55607296,
      "owned_process_count": 3,
      "reclaimable_bytes": 9774579712,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.370228667,
      "owned_rss_bytes": 55640064,
      "owned_process_count": 2,
      "reclaimable_bytes": 9769582592,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.601890292,
      "owned_rss_bytes": 101974016,
      "owned_process_count": 11,
      "reclaimable_bytes": 9774235648,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.832535292,
      "owned_rss_bytes": 102629376,
      "owned_process_count": 11,
      "reclaimable_bytes": 9809166336,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.068432667,
      "owned_rss_bytes": 102727680,
      "owned_process_count": 11,
      "reclaimable_bytes": 9807986688,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.307760542,
      "owned_rss_bytes": 103383040,
      "owned_process_count": 11,
      "reclaimable_bytes": 9807396864,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.536938959,
      "owned_rss_bytes": 104153088,
      "owned_process_count": 11,
      "reclaimable_bytes": 9811853312,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.7722747500000002,
      "owned_rss_bytes": 109395968,
      "owned_process_count": 11,
      "reclaimable_bytes": 9810296832,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.9959144170000003,
      "owned_rss_bytes": 56623104,
      "owned_process_count": 2,
      "reclaimable_bytes": 9838854144,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.226886084,
      "owned_rss_bytes": 85753856,
      "owned_process_count": 3,
      "reclaimable_bytes": 9827860480,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.4535532090000003,
      "owned_rss_bytes": 56983552,
      "owned_process_count": 3,
      "reclaimable_bytes": 9837772800,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.683768375,
      "owned_rss_bytes": 71827456,
      "owned_process_count": 5,
      "reclaimable_bytes": 9844359168,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.9138879589999997,
      "owned_rss_bytes": 72400896,
      "owned_process_count": 5,
      "reclaimable_bytes": 9841639424,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.149236875,
      "owned_rss_bytes": 72499200,
      "owned_process_count": 5,
      "reclaimable_bytes": 9843638272,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.39135175,
      "owned_rss_bytes": 72531968,
      "owned_process_count": 5,
      "reclaimable_bytes": 9843228672,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.633293333999999,
      "owned_rss_bytes": 72925184,
      "owned_process_count": 5,
      "reclaimable_bytes": 9845440512,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.8749915,
      "owned_rss_bytes": 73007104,
      "owned_process_count": 5,
      "reclaimable_bytes": 9850044416,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.117971208999999,
      "owned_rss_bytes": 59670528,
      "owned_process_count": 3,
      "reclaimable_bytes": 9853124608,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.3478981249999995,
      "owned_rss_bytes": 57212928,
      "owned_process_count": 3,
      "reclaimable_bytes": 9853288448,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.5750794589999995,
      "owned_rss_bytes": 96632832,
      "owned_process_count": 12,
      "reclaimable_bytes": 9817800704,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.808260042,
      "owned_rss_bytes": 135036928,
      "owned_process_count": 17,
      "reclaimable_bytes": 9816899584,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.040939874999999,
      "owned_rss_bytes": 135413760,
      "owned_process_count": 17,
      "reclaimable_bytes": 9816326144,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.275396292,
      "owned_rss_bytes": 135528448,
      "owned_process_count": 17,
      "reclaimable_bytes": 9812574208,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.5101995839999995,
      "owned_rss_bytes": 137003008,
      "owned_process_count": 17,
      "reclaimable_bytes": 9814065152,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.7529042089999995,
      "owned_rss_bytes": 138051584,
      "owned_process_count": 17,
      "reclaimable_bytes": 9820422144,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.993574874999999,
      "owned_rss_bytes": 102072320,
      "owned_process_count": 12,
      "reclaimable_bytes": 9840115712,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.2222415,
      "owned_rss_bytes": 59670528,
      "owned_process_count": 3,
      "reclaimable_bytes": 9856909312,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.4504523339999995,
      "owned_rss_bytes": 130711552,
      "owned_process_count": 5,
      "reclaimable_bytes": 9790341120,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.677275583999999,
      "owned_rss_bytes": 57999360,
      "owned_process_count": 3,
      "reclaimable_bytes": 9664348160,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.9102869590000005,
      "owned_rss_bytes": 60424192,
      "owned_process_count": 3,
      "reclaimable_bytes": 9661743104,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.137342834,
      "owned_rss_bytes": 58015744,
      "owned_process_count": 3,
      "reclaimable_bytes": 9668968448,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.365901917,
      "owned_rss_bytes": 58032128,
      "owned_process_count": 3,
      "reclaimable_bytes": 9668313088,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.594883584,
      "owned_rss_bytes": 72761344,
      "owned_process_count": 5,
      "reclaimable_bytes": 9657303040,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.822248292,
      "owned_rss_bytes": 73302016,
      "owned_process_count": 5,
      "reclaimable_bytes": 9659809792,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.051212042,
      "owned_rss_bytes": 73367552,
      "owned_process_count": 5,
      "reclaimable_bytes": 9660268544,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.285405792,
      "owned_rss_bytes": 73433088,
      "owned_process_count": 5,
      "reclaimable_bytes": 9661513728,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.525689167,
      "owned_rss_bytes": 73564160,
      "owned_process_count": 5,
      "reclaimable_bytes": 9661399040,
      "swapins": 44112315,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.766864959,
      "owned_rss_bytes": 73940992,
      "owned_process_count": 5,
      "reclaimable_bytes": 9661054976,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.009557125,
      "owned_rss_bytes": 57950208,
      "owned_process_count": 2,
      "reclaimable_bytes": 9667411968,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.244115666999999,
      "owned_rss_bytes": 58064896,
      "owned_process_count": 3,
      "reclaimable_bytes": 9667248128,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.47349375,
      "owned_rss_bytes": 58458112,
      "owned_process_count": 3,
      "reclaimable_bytes": 9665839104,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.7033125,
      "owned_rss_bytes": 58130432,
      "owned_process_count": 3,
      "reclaimable_bytes": 9671049216,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.931391249999999,
      "owned_rss_bytes": 97189888,
      "owned_process_count": 4,
      "reclaimable_bytes": 9648930816,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.159758542,
      "owned_rss_bytes": 58179584,
      "owned_process_count": 3,
      "reclaimable_bytes": 9835806720,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.392191042,
      "owned_rss_bytes": 162037760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9806561280,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.619773084,
      "owned_rss_bytes": 58277888,
      "owned_process_count": 3,
      "reclaimable_bytes": 9663660032,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.85142125,
      "owned_rss_bytes": 150863872,
      "owned_process_count": 4,
      "reclaimable_bytes": 9635758080,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.079851999999999,
      "owned_rss_bytes": 58851328,
      "owned_process_count": 3,
      "reclaimable_bytes": 9666805760,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.305574542,
      "owned_rss_bytes": 67944448,
      "owned_process_count": 5,
      "reclaimable_bytes": 9664970752,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.534629875,
      "owned_rss_bytes": 74121216,
      "owned_process_count": 5,
      "reclaimable_bytes": 9662857216,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.774034084,
      "owned_rss_bytes": 74203136,
      "owned_process_count": 5,
      "reclaimable_bytes": 9665314816,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.012136625,
      "owned_rss_bytes": 74219520,
      "owned_process_count": 5,
      "reclaimable_bytes": 9658515456,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.251745625,
      "owned_rss_bytes": 74612736,
      "owned_process_count": 5,
      "reclaimable_bytes": 9656582144,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.495142208999999,
      "owned_rss_bytes": 74678272,
      "owned_process_count": 5,
      "reclaimable_bytes": 9822978048,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.732372584,
      "owned_rss_bytes": 98172928,
      "owned_process_count": 4,
      "reclaimable_bytes": 9831104512,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.958928209,
      "owned_rss_bytes": 58753024,
      "owned_process_count": 3,
      "reclaimable_bytes": 9668132864,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.186814959,
      "owned_rss_bytes": 60669952,
      "owned_process_count": 3,
      "reclaimable_bytes": 9667772416,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.414738959,
      "owned_rss_bytes": 64454656,
      "owned_process_count": 3,
      "reclaimable_bytes": 9668640768,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.643001792,
      "owned_rss_bytes": 74924032,
      "owned_process_count": 3,
      "reclaimable_bytes": 9655468032,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.871268334,
      "owned_rss_bytes": 85622784,
      "owned_process_count": 8,
      "reclaimable_bytes": 9655943168,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.100478292,
      "owned_rss_bytes": 86212608,
      "owned_process_count": 8,
      "reclaimable_bytes": 9658482688,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.331155459,
      "owned_rss_bytes": 86294528,
      "owned_process_count": 8,
      "reclaimable_bytes": 9642622976,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.558870875,
      "owned_rss_bytes": 86294528,
      "owned_process_count": 8,
      "reclaimable_bytes": 9644834816,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.786743167,
      "owned_rss_bytes": 86654976,
      "owned_process_count": 8,
      "reclaimable_bytes": 9645359104,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.011021584,
      "owned_rss_bytes": 87539712,
      "owned_process_count": 8,
      "reclaimable_bytes": 9627680768,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.239981167,
      "owned_rss_bytes": 91799552,
      "owned_process_count": 9,
      "reclaimable_bytes": 9794224128,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.464822042,
      "owned_rss_bytes": 91799552,
      "owned_process_count": 9,
      "reclaimable_bytes": 9764356096,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.697508959,
      "owned_rss_bytes": 92897280,
      "owned_process_count": 9,
      "reclaimable_bytes": 9675997184,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.926503917,
      "owned_rss_bytes": 93519872,
      "owned_process_count": 9,
      "reclaimable_bytes": 9673736192,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.151148292000002,
      "owned_rss_bytes": 95469568,
      "owned_process_count": 9,
      "reclaimable_bytes": 9475850240,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.380578209000003,
      "owned_rss_bytes": 96174080,
      "owned_process_count": 9,
      "reclaimable_bytes": 9478127616,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.609856584000003,
      "owned_rss_bytes": 96567296,
      "owned_process_count": 9,
      "reclaimable_bytes": 9479897088,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.838832084,
      "owned_rss_bytes": 97583104,
      "owned_process_count": 9,
      "reclaimable_bytes": 9484648448,
      "swapins": 44112319,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.068100292,
      "owned_rss_bytes": 98713600,
      "owned_process_count": 9,
      "reclaimable_bytes": 9486123008,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.294752084000002,
      "owned_rss_bytes": 98893824,
      "owned_process_count": 9,
      "reclaimable_bytes": 9490104320,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.523376375,
      "owned_rss_bytes": 99057664,
      "owned_process_count": 9,
      "reclaimable_bytes": 9514565632,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.752455917000002,
      "owned_rss_bytes": 99221504,
      "owned_process_count": 9,
      "reclaimable_bytes": 9517940736,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.980556209000003,
      "owned_rss_bytes": 99385344,
      "owned_process_count": 9,
      "reclaimable_bytes": 9194962944,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.212513625000003,
      "owned_rss_bytes": 99794944,
      "owned_process_count": 9,
      "reclaimable_bytes": 9195421696,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.443754042000002,
      "owned_rss_bytes": 100712448,
      "owned_process_count": 9,
      "reclaimable_bytes": 9182117888,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.672146,
      "owned_rss_bytes": 100794368,
      "owned_process_count": 9,
      "reclaimable_bytes": 9169027072,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.901879667000003,
      "owned_rss_bytes": 101105664,
      "owned_process_count": 9,
      "reclaimable_bytes": 9171075072,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.131087,
      "owned_rss_bytes": 101056512,
      "owned_process_count": 9,
      "reclaimable_bytes": 9416097792,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.355576625,
      "owned_rss_bytes": 101138432,
      "owned_process_count": 9,
      "reclaimable_bytes": 9417654272,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.584525042000003,
      "owned_rss_bytes": 101269504,
      "owned_process_count": 9,
      "reclaimable_bytes": 9500622848,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.815367917000003,
      "owned_rss_bytes": 101498880,
      "owned_process_count": 9,
      "reclaimable_bytes": 9590816768,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.053430584,
      "owned_rss_bytes": 101679104,
      "owned_process_count": 9,
      "reclaimable_bytes": 9654517760,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.280580750000002,
      "owned_rss_bytes": 101793792,
      "owned_process_count": 9,
      "reclaimable_bytes": 9684500480,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.512432709000002,
      "owned_rss_bytes": 103006208,
      "owned_process_count": 9,
      "reclaimable_bytes": 9768534016,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.745048459000003,
      "owned_rss_bytes": 103104512,
      "owned_process_count": 9,
      "reclaimable_bytes": 9885237248,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.98371075,
      "owned_rss_bytes": 103235584,
      "owned_process_count": 9,
      "reclaimable_bytes": 10057105408,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.228554792,
      "owned_rss_bytes": 103481344,
      "owned_process_count": 9,
      "reclaimable_bytes": 10070474752,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.467717959,
      "owned_rss_bytes": 103710720,
      "owned_process_count": 9,
      "reclaimable_bytes": 9896574976,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.710520125000002,
      "owned_rss_bytes": 108019712,
      "owned_process_count": 9,
      "reclaimable_bytes": 9894952960,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.942090584000002,
      "owned_rss_bytes": 108019712,
      "owned_process_count": 9,
      "reclaimable_bytes": 9889808384,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.184369,
      "owned_rss_bytes": 108249088,
      "owned_process_count": 9,
      "reclaimable_bytes": 9891725312,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.422239875000002,
      "owned_rss_bytes": 109051904,
      "owned_process_count": 9,
      "reclaimable_bytes": 9893298176,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.655570875000002,
      "owned_rss_bytes": 119881728,
      "owned_process_count": 9,
      "reclaimable_bytes": 9876193280,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.883205750000002,
      "owned_rss_bytes": 124321792,
      "owned_process_count": 9,
      "reclaimable_bytes": 9874030592,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.112583,
      "owned_rss_bytes": 134643712,
      "owned_process_count": 9,
      "reclaimable_bytes": 10030645248,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.344485584,
      "owned_rss_bytes": 85393408,
      "owned_process_count": 8,
      "reclaimable_bytes": 10081402880,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.572830084000003,
      "owned_rss_bytes": 85983232,
      "owned_process_count": 8,
      "reclaimable_bytes": 10096427008,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.820178084000002,
      "owned_rss_bytes": 86081536,
      "owned_process_count": 8,
      "reclaimable_bytes": 10101456896,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.068567959000003,
      "owned_rss_bytes": 86130688,
      "owned_process_count": 8,
      "reclaimable_bytes": 10095525888,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.309462500000002,
      "owned_rss_bytes": 86245376,
      "owned_process_count": 8,
      "reclaimable_bytes": 10096328704,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.5413485,
      "owned_rss_bytes": 86507520,
      "owned_process_count": 8,
      "reclaimable_bytes": 10094575616,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.791285042000002,
      "owned_rss_bytes": 87293952,
      "owned_process_count": 8,
      "reclaimable_bytes": 10090528768,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.038788,
      "owned_rss_bytes": 91586560,
      "owned_process_count": 9,
      "reclaimable_bytes": 10096050176,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.284726959,
      "owned_rss_bytes": 93126656,
      "owned_process_count": 9,
      "reclaimable_bytes": 10090774528,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.534692959,
      "owned_rss_bytes": 94371840,
      "owned_process_count": 9,
      "reclaimable_bytes": 10089512960,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.779894584,
      "owned_rss_bytes": 95682560,
      "owned_process_count": 9,
      "reclaimable_bytes": 10087481344,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.020079250000002,
      "owned_rss_bytes": 88489984,
      "owned_process_count": 9,
      "reclaimable_bytes": 10080747520,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.259129375,
      "owned_rss_bytes": 59097088,
      "owned_process_count": 2,
      "reclaimable_bytes": 10103947264,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.486233875,
      "owned_rss_bytes": 65748992,
      "owned_process_count": 3,
      "reclaimable_bytes": 10105946112,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.708485542000002,
      "owned_rss_bytes": 65486848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10211459072,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.931936250000003,
      "owned_rss_bytes": 59179008,
      "owned_process_count": 2,
      "reclaimable_bytes": 10209837056,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.159298667,
      "owned_rss_bytes": 65814528,
      "owned_process_count": 3,
      "reclaimable_bytes": 10207739904,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.385564584,
      "owned_rss_bytes": 63127552,
      "owned_process_count": 3,
      "reclaimable_bytes": 10205331456,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.613877792,
      "owned_rss_bytes": 259833856,
      "owned_process_count": 8,
      "reclaimable_bytes": 10133520384,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.84173925,
      "owned_rss_bytes": 59736064,
      "owned_process_count": 5,
      "reclaimable_bytes": 10213376000,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.065988125,
      "owned_rss_bytes": 59703296,
      "owned_process_count": 5,
      "reclaimable_bytes": 10212769792,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.300184417,
      "owned_rss_bytes": 59670528,
      "owned_process_count": 5,
      "reclaimable_bytes": 10215555072,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.532852917000003,
      "owned_rss_bytes": 547340288,
      "owned_process_count": 14,
      "reclaimable_bytes": 10069901312,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.768060209,
      "owned_rss_bytes": 64536576,
      "owned_process_count": 6,
      "reclaimable_bytes": 10220077056,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.995860584000003,
      "owned_rss_bytes": 60260352,
      "owned_process_count": 5,
      "reclaimable_bytes": 10220617728,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.228380959000003,
      "owned_rss_bytes": 60227584,
      "owned_process_count": 5,
      "reclaimable_bytes": 10219208704,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.470020292,
      "owned_rss_bytes": 101007360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10190635008,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.698976709,
      "owned_rss_bytes": 60424192,
      "owned_process_count": 3,
      "reclaimable_bytes": 10219536384,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.928006084,
      "owned_rss_bytes": 166445056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10187636736,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.153009,
      "owned_rss_bytes": 60456960,
      "owned_process_count": 3,
      "reclaimable_bytes": 10210738176,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.382149125,
      "owned_rss_bytes": 60473344,
      "owned_process_count": 3,
      "reclaimable_bytes": 10220978176,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.608937125,
      "owned_rss_bytes": 61145088,
      "owned_process_count": 2,
      "reclaimable_bytes": 10220077056,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.836715584000004,
      "owned_rss_bytes": 64913408,
      "owned_process_count": 2,
      "reclaimable_bytes": 10216603648,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.064350250000004,
      "owned_rss_bytes": 67960832,
      "owned_process_count": 2,
      "reclaimable_bytes": 10210623488,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.291455125,
      "owned_rss_bytes": 98336768,
      "owned_process_count": 3,
      "reclaimable_bytes": 10179461120,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.515078959,
      "owned_rss_bytes": 233472000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10121379840,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.743144459,
      "owned_rss_bytes": 260030464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10102439936,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.968390709000005,
      "owned_rss_bytes": 285065216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10073686016,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.196256167,
      "owned_rss_bytes": 308035584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10051452928,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.422749584,
      "owned_rss_bytes": 320995328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10040590336,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.650480959,
      "owned_rss_bytes": 327368704,
      "owned_process_count": 4,
      "reclaimable_bytes": 10037985280,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.877710959,
      "owned_rss_bytes": 334757888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10032824320,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.106056959,
      "owned_rss_bytes": 339345408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10028154880,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.333643209,
      "owned_rss_bytes": 344621056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10026336256,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.561898709000005,
      "owned_rss_bytes": 349437952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10019848192,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.790078959,
      "owned_rss_bytes": 352714752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10014605312,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.018397625,
      "owned_rss_bytes": 386859008,
      "owned_process_count": 4,
      "reclaimable_bytes": 9980854272,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.2471855,
      "owned_rss_bytes": 445071360,
      "owned_process_count": 4,
      "reclaimable_bytes": 9911959552,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.476202084,
      "owned_rss_bytes": 508133376,
      "owned_process_count": 4,
      "reclaimable_bytes": 9917333504,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.703115000000004,
      "owned_rss_bytes": 649527296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9565503488,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.931424084,
      "owned_rss_bytes": 1041072128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9205088256,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.164373417,
      "owned_rss_bytes": 1043398656,
      "owned_process_count": 4,
      "reclaimable_bytes": 9203073024,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.392094709,
      "owned_rss_bytes": 1043988480,
      "owned_process_count": 4,
      "reclaimable_bytes": 9200222208,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.619492792,
      "owned_rss_bytes": 1044873216,
      "owned_process_count": 4,
      "reclaimable_bytes": 9197617152,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.847110959,
      "owned_rss_bytes": 1045168128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9372860416,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.070359584,
      "owned_rss_bytes": 1045643264,
      "owned_process_count": 4,
      "reclaimable_bytes": 9372057600,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.298351667,
      "owned_rss_bytes": 1045807104,
      "owned_process_count": 4,
      "reclaimable_bytes": 9375023104,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.525443209,
      "owned_rss_bytes": 1046183936,
      "owned_process_count": 4,
      "reclaimable_bytes": 9370615808,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.751773542,
      "owned_rss_bytes": 1046446080,
      "owned_process_count": 4,
      "reclaimable_bytes": 9372549120,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.977945125,
      "owned_rss_bytes": 1046724608,
      "owned_process_count": 4,
      "reclaimable_bytes": 9376382976,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.205484,
      "owned_rss_bytes": 1047101440,
      "owned_process_count": 4,
      "reclaimable_bytes": 9378168832,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.429858917000004,
      "owned_rss_bytes": 1047805952,
      "owned_process_count": 4,
      "reclaimable_bytes": 9377366016,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.65716225,
      "owned_rss_bytes": 1048313856,
      "owned_process_count": 4,
      "reclaimable_bytes": 9371926528,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.884099125,
      "owned_rss_bytes": 1049608192,
      "owned_process_count": 4,
      "reclaimable_bytes": 9375416320,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.11170575,
      "owned_rss_bytes": 1051410432,
      "owned_process_count": 4,
      "reclaimable_bytes": 9370730496,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.339367459,
      "owned_rss_bytes": 1051721728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9374203904,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.566752417000004,
      "owned_rss_bytes": 1057357824,
      "owned_process_count": 4,
      "reclaimable_bytes": 9367355392,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.790986834,
      "owned_rss_bytes": 1068793856,
      "owned_process_count": 4,
      "reclaimable_bytes": 9355673600,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.019292917,
      "owned_rss_bytes": 1076101120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9344221184,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.244558792,
      "owned_rss_bytes": 1081229312,
      "owned_process_count": 4,
      "reclaimable_bytes": 9339518976,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.472255542,
      "owned_rss_bytes": 1095254016,
      "owned_process_count": 4,
      "reclaimable_bytes": 9326493696,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.699658709000005,
      "owned_rss_bytes": 1110245376,
      "owned_process_count": 4,
      "reclaimable_bytes": 9311141888,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.927790417000004,
      "owned_rss_bytes": 1127677952,
      "owned_process_count": 4,
      "reclaimable_bytes": 9297051648,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.152184209000005,
      "owned_rss_bytes": 1143750656,
      "owned_process_count": 4,
      "reclaimable_bytes": 9276833792,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.380866667,
      "owned_rss_bytes": 1158758400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9260351488,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.608330667000004,
      "owned_rss_bytes": 1172373504,
      "owned_process_count": 4,
      "reclaimable_bytes": 9250799616,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.836775792000005,
      "owned_rss_bytes": 1184890880,
      "owned_process_count": 4,
      "reclaimable_bytes": 9235759104,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.061395709,
      "owned_rss_bytes": 1208041472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9214148608,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.289468375,
      "owned_rss_bytes": 1214447616,
      "owned_process_count": 4,
      "reclaimable_bytes": 9208397824,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.519678709000004,
      "owned_rss_bytes": 1219166208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9200713728,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.745830084000005,
      "owned_rss_bytes": 1236451328,
      "owned_process_count": 4,
      "reclaimable_bytes": 9186066432,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.976494667000004,
      "owned_rss_bytes": 1246298112,
      "owned_process_count": 4,
      "reclaimable_bytes": 9105702912,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.202404792,
      "owned_rss_bytes": 1248903168,
      "owned_process_count": 4,
      "reclaimable_bytes": 8986574848,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.431555834,
      "owned_rss_bytes": 197427200,
      "owned_process_count": 4,
      "reclaimable_bytes": 10001940480,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.659988542,
      "owned_rss_bytes": 283918336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9930457088,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.890265584,
      "owned_rss_bytes": 179847168,
      "owned_process_count": 4,
      "reclaimable_bytes": 9995698176,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.119781125,
      "owned_rss_bytes": 254492672,
      "owned_process_count": 4,
      "reclaimable_bytes": 9908125696,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.347422125,
      "owned_rss_bytes": 342523904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9736388608,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.579177,
      "owned_rss_bytes": 313032704,
      "owned_process_count": 4,
      "reclaimable_bytes": 9717678080,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.808163792,
      "owned_rss_bytes": 353353728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9477652480,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.044083209,
      "owned_rss_bytes": 381435904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9448964096,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.275919667000004,
      "owned_rss_bytes": 347586560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9441345536,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.506329542,
      "owned_rss_bytes": 369950720,
      "owned_process_count": 4,
      "reclaimable_bytes": 9348644864,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.736846167,
      "owned_rss_bytes": 368885760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9375531008,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.969503292,
      "owned_rss_bytes": 383123456,
      "owned_process_count": 4,
      "reclaimable_bytes": 9333260288,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.1981565,
      "owned_rss_bytes": 425197568,
      "owned_process_count": 4,
      "reclaimable_bytes": 9252306944,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.427976417,
      "owned_rss_bytes": 430391296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9136586752,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.660865584,
      "owned_rss_bytes": 474038272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9069887488,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.888496,
      "owned_rss_bytes": 488374272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9038086144,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.118583625,
      "owned_rss_bytes": 480722944,
      "owned_process_count": 4,
      "reclaimable_bytes": 8913387520,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.348059709000005,
      "owned_rss_bytes": 497909760,
      "owned_process_count": 4,
      "reclaimable_bytes": 8861384704,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.581212584,
      "owned_rss_bytes": 512311296,
      "owned_process_count": 4,
      "reclaimable_bytes": 8758198272,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.813249834000004,
      "owned_rss_bytes": 523681792,
      "owned_process_count": 4,
      "reclaimable_bytes": 8824881152,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.040092834,
      "owned_rss_bytes": 553451520,
      "owned_process_count": 4,
      "reclaimable_bytes": 8781414400,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.269007209,
      "owned_rss_bytes": 600440832,
      "owned_process_count": 4,
      "reclaimable_bytes": 8714420224,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.497204417,
      "owned_rss_bytes": 602996736,
      "owned_process_count": 4,
      "reclaimable_bytes": 8664317952,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.729459917,
      "owned_rss_bytes": 614531072,
      "owned_process_count": 4,
      "reclaimable_bytes": 8613838848,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.959168250000005,
      "owned_rss_bytes": 651280384,
      "owned_process_count": 4,
      "reclaimable_bytes": 8599568384,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.18789175,
      "owned_rss_bytes": 669220864,
      "owned_process_count": 4,
      "reclaimable_bytes": 8585068544,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.413876292000005,
      "owned_rss_bytes": 583843840,
      "owned_process_count": 4,
      "reclaimable_bytes": 8738226176,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.6412895,
      "owned_rss_bytes": 622952448,
      "owned_process_count": 4,
      "reclaimable_bytes": 8718221312,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.871381334,
      "owned_rss_bytes": 629506048,
      "owned_process_count": 4,
      "reclaimable_bytes": 8710569984,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.097473959,
      "owned_rss_bytes": 631668736,
      "owned_process_count": 4,
      "reclaimable_bytes": 8691023872,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.326867,
      "owned_rss_bytes": 659718144,
      "owned_process_count": 4,
      "reclaimable_bytes": 8655175680,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.553133584,
      "owned_rss_bytes": 668778496,
      "owned_process_count": 4,
      "reclaimable_bytes": 8651276288,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.785112584000004,
      "owned_rss_bytes": 656801792,
      "owned_process_count": 4,
      "reclaimable_bytes": 8640266240,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.028228084,
      "owned_rss_bytes": 242384896,
      "owned_process_count": 4,
      "reclaimable_bytes": 8994717696,
      "swapins": 44112323,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.262610834,
      "owned_rss_bytes": 289865728,
      "owned_process_count": 4,
      "reclaimable_bytes": 8949661696,
      "swapins": 44112331,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.492243209,
      "owned_rss_bytes": 301400064,
      "owned_process_count": 4,
      "reclaimable_bytes": 8904704000,
      "swapins": 44112331,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.717681667,
      "owned_rss_bytes": 307986432,
      "owned_process_count": 4,
      "reclaimable_bytes": 8948318208,
      "swapins": 44112331,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.947264417,
      "owned_rss_bytes": 266141696,
      "owned_process_count": 4,
      "reclaimable_bytes": 8858796032,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.177129334,
      "owned_rss_bytes": 313720832,
      "owned_process_count": 4,
      "reclaimable_bytes": 8801665024,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.409644792,
      "owned_rss_bytes": 322732032,
      "owned_process_count": 4,
      "reclaimable_bytes": 8753463296,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.639673917,
      "owned_rss_bytes": 326402048,
      "owned_process_count": 4,
      "reclaimable_bytes": 8699461632,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.869891417,
      "owned_rss_bytes": 251854848,
      "owned_process_count": 4,
      "reclaimable_bytes": 8723546112,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.1012305,
      "owned_rss_bytes": 307150848,
      "owned_process_count": 4,
      "reclaimable_bytes": 8669069312,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.328856,
      "owned_rss_bytes": 317341696,
      "owned_process_count": 4,
      "reclaimable_bytes": 8627191808,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.560231334,
      "owned_rss_bytes": 351797248,
      "owned_process_count": 4,
      "reclaimable_bytes": 8582430720,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.791499209,
      "owned_rss_bytes": 417300480,
      "owned_process_count": 4,
      "reclaimable_bytes": 8578498560,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.021243834,
      "owned_rss_bytes": 454377472,
      "owned_process_count": 4,
      "reclaimable_bytes": 8591507456,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.259313084,
      "owned_rss_bytes": 142393344,
      "owned_process_count": 3,
      "reclaimable_bytes": 8812265472,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.488443375,
      "owned_rss_bytes": 217415680,
      "owned_process_count": 4,
      "reclaimable_bytes": 8738242560,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.715946959,
      "owned_rss_bytes": 313360384,
      "owned_process_count": 4,
      "reclaimable_bytes": 8614789120,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.945478542000004,
      "owned_rss_bytes": 314228736,
      "owned_process_count": 4,
      "reclaimable_bytes": 8601862144,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.177004084000004,
      "owned_rss_bytes": 364429312,
      "owned_process_count": 4,
      "reclaimable_bytes": 8599650304,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.408764375000004,
      "owned_rss_bytes": 416759808,
      "owned_process_count": 4,
      "reclaimable_bytes": 8612200448,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.641592209,
      "owned_rss_bytes": 283213824,
      "owned_process_count": 4,
      "reclaimable_bytes": 8777154560,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.869902334,
      "owned_rss_bytes": 225509376,
      "owned_process_count": 5,
      "reclaimable_bytes": 8726118400,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.0994085,
      "owned_rss_bytes": 94830592,
      "owned_process_count": 3,
      "reclaimable_bytes": 8776122368,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.332662375,
      "owned_rss_bytes": 159416320,
      "owned_process_count": 4,
      "reclaimable_bytes": 8721235968,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.557170917,
      "owned_rss_bytes": 130613248,
      "owned_process_count": 4,
      "reclaimable_bytes": 8723021824,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.791080292000004,
      "owned_rss_bytes": 95109120,
      "owned_process_count": 3,
      "reclaimable_bytes": 8756346880,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.016520834000005,
      "owned_rss_bytes": 95141888,
      "owned_process_count": 2,
      "reclaimable_bytes": 8724742144,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.245728875000005,
      "owned_rss_bytes": 95141888,
      "owned_process_count": 2,
      "reclaimable_bytes": 8695562240,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.4782195,
      "owned_rss_bytes": 95911936,
      "owned_process_count": 3,
      "reclaimable_bytes": 8692432896,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.709249625,
      "owned_rss_bytes": 131891200,
      "owned_process_count": 4,
      "reclaimable_bytes": 8709734400,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.939054584000004,
      "owned_rss_bytes": 222035968,
      "owned_process_count": 4,
      "reclaimable_bytes": 8685813760,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.165259417,
      "owned_rss_bytes": 216481792,
      "owned_process_count": 4,
      "reclaimable_bytes": 8689762304,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.394934917,
      "owned_rss_bytes": 213467136,
      "owned_process_count": 4,
      "reclaimable_bytes": 8685977600,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.626107667,
      "owned_rss_bytes": 170311680,
      "owned_process_count": 4,
      "reclaimable_bytes": 8725954560,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.856744875000004,
      "owned_rss_bytes": 166281216,
      "owned_process_count": 4,
      "reclaimable_bytes": 8688041984,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.087697625000004,
      "owned_rss_bytes": 229670912,
      "owned_process_count": 4,
      "reclaimable_bytes": 8694480896,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.316643167,
      "owned_rss_bytes": 283361280,
      "owned_process_count": 4,
      "reclaimable_bytes": 8671674368,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.544689042,
      "owned_rss_bytes": 101662720,
      "owned_process_count": 3,
      "reclaimable_bytes": 8781529088,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.771270709,
      "owned_rss_bytes": 202866688,
      "owned_process_count": 4,
      "reclaimable_bytes": 8738783232,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.002635125000005,
      "owned_rss_bytes": 137740288,
      "owned_process_count": 4,
      "reclaimable_bytes": 8736817152,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.23179225,
      "owned_rss_bytes": 195624960,
      "owned_process_count": 4,
      "reclaimable_bytes": 8675180544,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.462408584,
      "owned_rss_bytes": 243548160,
      "owned_process_count": 4,
      "reclaimable_bytes": 8667070464,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.693646834,
      "owned_rss_bytes": 98418688,
      "owned_process_count": 3,
      "reclaimable_bytes": 8686223360,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.922821,
      "owned_rss_bytes": 217202688,
      "owned_process_count": 4,
      "reclaimable_bytes": 8650211328,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.153348709,
      "owned_rss_bytes": 257196032,
      "owned_process_count": 4,
      "reclaimable_bytes": 8631140352,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.397533042,
      "owned_rss_bytes": 220397568,
      "owned_process_count": 4,
      "reclaimable_bytes": 8631025664,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.628428209,
      "owned_rss_bytes": 260603904,
      "owned_process_count": 4,
      "reclaimable_bytes": 8631091200,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.859747167,
      "owned_rss_bytes": 200572928,
      "owned_process_count": 4,
      "reclaimable_bytes": 8661303296,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.089273834000004,
      "owned_rss_bytes": 251920384,
      "owned_process_count": 4,
      "reclaimable_bytes": 8630321152,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.319535084,
      "owned_rss_bytes": 267403264,
      "owned_process_count": 4,
      "reclaimable_bytes": 8623685632,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.549599334,
      "owned_rss_bytes": 243400704,
      "owned_process_count": 4,
      "reclaimable_bytes": 8628092928,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.778033375,
      "owned_rss_bytes": 260325376,
      "owned_process_count": 4,
      "reclaimable_bytes": 8642478080,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.007522625,
      "owned_rss_bytes": 213123072,
      "owned_process_count": 4,
      "reclaimable_bytes": 8646836224,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.237799167,
      "owned_rss_bytes": 304594944,
      "owned_process_count": 4,
      "reclaimable_bytes": 8612691968,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.47210475,
      "owned_rss_bytes": 278511616,
      "owned_process_count": 4,
      "reclaimable_bytes": 8671264768,
      "swapins": 44112335,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.700842667,
      "owned_rss_bytes": 355909632,
      "owned_process_count": 4,
      "reclaimable_bytes": 8596635648,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.93646516700001,
      "owned_rss_bytes": 374177792,
      "owned_process_count": 4,
      "reclaimable_bytes": 8623849472,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.169824209,
      "owned_rss_bytes": 367345664,
      "owned_process_count": 4,
      "reclaimable_bytes": 8848195584,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.39961516700001,
      "owned_rss_bytes": 264896512,
      "owned_process_count": 4,
      "reclaimable_bytes": 8770437120,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.630356084,
      "owned_rss_bytes": 285523968,
      "owned_process_count": 4,
      "reclaimable_bytes": 8722055168,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.862623417,
      "owned_rss_bytes": 313491456,
      "owned_process_count": 4,
      "reclaimable_bytes": 8677228544,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.094684625,
      "owned_rss_bytes": 351141888,
      "owned_process_count": 4,
      "reclaimable_bytes": 8637726720,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.322930709,
      "owned_rss_bytes": 358825984,
      "owned_process_count": 4,
      "reclaimable_bytes": 8604975104,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.55344883400001,
      "owned_rss_bytes": 360857600,
      "owned_process_count": 4,
      "reclaimable_bytes": 8575025152,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.7863665,
      "owned_rss_bytes": 361676800,
      "owned_process_count": 4,
      "reclaimable_bytes": 8550088704,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.019766834,
      "owned_rss_bytes": 372604928,
      "owned_process_count": 4,
      "reclaimable_bytes": 8539897856,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.250534084,
      "owned_rss_bytes": 384548864,
      "owned_process_count": 4,
      "reclaimable_bytes": 8509259776,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.47966875,
      "owned_rss_bytes": 206815232,
      "owned_process_count": 4,
      "reclaimable_bytes": 8597815296,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.706169,
      "owned_rss_bytes": 277086208,
      "owned_process_count": 4,
      "reclaimable_bytes": 8493957120,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.935746334,
      "owned_rss_bytes": 268779520,
      "owned_process_count": 4,
      "reclaimable_bytes": 8520302592,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.165771167,
      "owned_rss_bytes": 322715648,
      "owned_process_count": 4,
      "reclaimable_bytes": 8480014336,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.396000417,
      "owned_rss_bytes": 372604928,
      "owned_process_count": 4,
      "reclaimable_bytes": 8424603648,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.626063917,
      "owned_rss_bytes": 176537600,
      "owned_process_count": 4,
      "reclaimable_bytes": 8594718720,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.8601955,
      "owned_rss_bytes": 293371904,
      "owned_process_count": 4,
      "reclaimable_bytes": 8536391680,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.089045,
      "owned_rss_bytes": 190136320,
      "owned_process_count": 4,
      "reclaimable_bytes": 8544272384,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.321859084,
      "owned_rss_bytes": 283361280,
      "owned_process_count": 4,
      "reclaimable_bytes": 8457273344,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.552162792,
      "owned_rss_bytes": 352862208,
      "owned_process_count": 4,
      "reclaimable_bytes": 8397832192,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.787048959,
      "owned_rss_bytes": 325959680,
      "owned_process_count": 4,
      "reclaimable_bytes": 8411152384,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.01691383400001,
      "owned_rss_bytes": 391413760,
      "owned_process_count": 4,
      "reclaimable_bytes": 8418918400,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.2489585,
      "owned_rss_bytes": 417071104,
      "owned_process_count": 4,
      "reclaimable_bytes": 8492564480,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.480123667,
      "owned_rss_bytes": 192217088,
      "owned_process_count": 4,
      "reclaimable_bytes": 8571486208,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.70834941700001,
      "owned_rss_bytes": 222920704,
      "owned_process_count": 4,
      "reclaimable_bytes": 8532590592,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.943288,
      "owned_rss_bytes": 237666304,
      "owned_process_count": 4,
      "reclaimable_bytes": 8509800448,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.169958292,
      "owned_rss_bytes": 132972544,
      "owned_process_count": 4,
      "reclaimable_bytes": 8525938688,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.400736834,
      "owned_rss_bytes": 268124160,
      "owned_process_count": 4,
      "reclaimable_bytes": 8464187392,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.628203875,
      "owned_rss_bytes": 336691200,
      "owned_process_count": 4,
      "reclaimable_bytes": 11969986560,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.876184542,
      "owned_rss_bytes": 373063680,
      "owned_process_count": 4,
      "reclaimable_bytes": 12292751360,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.1031335,
      "owned_rss_bytes": 393183232,
      "owned_process_count": 4,
      "reclaimable_bytes": 12270862336,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.326190584,
      "owned_rss_bytes": 424443904,
      "owned_process_count": 4,
      "reclaimable_bytes": 12178849792,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.556836875,
      "owned_rss_bytes": 435929088,
      "owned_process_count": 4,
      "reclaimable_bytes": 12134105088,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.7855325,
      "owned_rss_bytes": 469696512,
      "owned_process_count": 4,
      "reclaimable_bytes": 12113281024,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.0114385,
      "owned_rss_bytes": 487817216,
      "owned_process_count": 4,
      "reclaimable_bytes": 12104433664,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.236348959,
      "owned_rss_bytes": 514555904,
      "owned_process_count": 4,
      "reclaimable_bytes": 12074713088,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.461399542,
      "owned_rss_bytes": 542785536,
      "owned_process_count": 4,
      "reclaimable_bytes": 12055363584,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.690478834,
      "owned_rss_bytes": 594149376,
      "owned_process_count": 4,
      "reclaimable_bytes": 12031754240,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.917799417,
      "owned_rss_bytes": 544653312,
      "owned_process_count": 4,
      "reclaimable_bytes": 12024807424,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.14662629200001,
      "owned_rss_bytes": 556531712,
      "owned_process_count": 4,
      "reclaimable_bytes": 12011831296,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.375484542,
      "owned_rss_bytes": 557711360,
      "owned_process_count": 4,
      "reclaimable_bytes": 12007358464,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.602967417,
      "owned_rss_bytes": 566771712,
      "owned_process_count": 4,
      "reclaimable_bytes": 12004327424,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.832068084,
      "owned_rss_bytes": 591970304,
      "owned_process_count": 4,
      "reclaimable_bytes": 12007063552,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.060470667,
      "owned_rss_bytes": 610582528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11987927040,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.286049334,
      "owned_rss_bytes": 608108544,
      "owned_process_count": 4,
      "reclaimable_bytes": 11971067904,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.515415292,
      "owned_rss_bytes": 609026048,
      "owned_process_count": 4,
      "reclaimable_bytes": 11956682752,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.744217084,
      "owned_rss_bytes": 610467840,
      "owned_process_count": 4,
      "reclaimable_bytes": 11955732480,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.97321,
      "owned_rss_bytes": 622444544,
      "owned_process_count": 4,
      "reclaimable_bytes": 11944394752,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.201065,
      "owned_rss_bytes": 634093568,
      "owned_process_count": 4,
      "reclaimable_bytes": 11930599424,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.430984959,
      "owned_rss_bytes": 614400000,
      "owned_process_count": 4,
      "reclaimable_bytes": 11971051520,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.659823459,
      "owned_rss_bytes": 618790912,
      "owned_process_count": 4,
      "reclaimable_bytes": 11998117888,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.888144417,
      "owned_rss_bytes": 631685120,
      "owned_process_count": 4,
      "reclaimable_bytes": 11989909504,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.115408125,
      "owned_rss_bytes": 675053568,
      "owned_process_count": 4,
      "reclaimable_bytes": 11951800320,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.342949625,
      "owned_rss_bytes": 677953536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11948343296,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.571121584,
      "owned_rss_bytes": 727547904,
      "owned_process_count": 4,
      "reclaimable_bytes": 11896209408,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.79431275,
      "owned_rss_bytes": 745111552,
      "owned_process_count": 4,
      "reclaimable_bytes": 11881037824,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.022948959,
      "owned_rss_bytes": 728006656,
      "owned_process_count": 4,
      "reclaimable_bytes": 11878940672,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.246512959,
      "owned_rss_bytes": 655343616,
      "owned_process_count": 4,
      "reclaimable_bytes": 11880726528,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.4705845,
      "owned_rss_bytes": 659898368,
      "owned_process_count": 4,
      "reclaimable_bytes": 11883380736,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.698546167,
      "owned_rss_bytes": 685326336,
      "owned_process_count": 4,
      "reclaimable_bytes": 11851022336,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.92645225,
      "owned_rss_bytes": 681050112,
      "owned_process_count": 4,
      "reclaimable_bytes": 11849580544,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.151056875,
      "owned_rss_bytes": 725073920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11801395200,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.37882279200001,
      "owned_rss_bytes": 734887936,
      "owned_process_count": 4,
      "reclaimable_bytes": 11791089664,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.606028,
      "owned_rss_bytes": 748634112,
      "owned_process_count": 4,
      "reclaimable_bytes": 11802460160,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.833243209,
      "owned_rss_bytes": 752009216,
      "owned_process_count": 4,
      "reclaimable_bytes": 11801182208,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.061545542,
      "owned_rss_bytes": 766902272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11797495808,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.2855155,
      "owned_rss_bytes": 766902272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11800854528,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.511292875,
      "owned_rss_bytes": 770686976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11797413888,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.73638150000001,
      "owned_rss_bytes": 285982720,
      "owned_process_count": 4,
      "reclaimable_bytes": 12262244352,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.96445641700001,
      "owned_rss_bytes": 331055104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12229181440,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.192441042,
      "owned_rss_bytes": 362889216,
      "owned_process_count": 4,
      "reclaimable_bytes": 12220399616,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.4207605,
      "owned_rss_bytes": 371097600,
      "owned_process_count": 4,
      "reclaimable_bytes": 12214337536,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.648934875,
      "owned_rss_bytes": 377815040,
      "owned_process_count": 4,
      "reclaimable_bytes": 12208619520,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.877026375,
      "owned_rss_bytes": 392429568,
      "owned_process_count": 4,
      "reclaimable_bytes": 12197117952,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.105651084,
      "owned_rss_bytes": 463519744,
      "owned_process_count": 4,
      "reclaimable_bytes": 12128731136,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.332935709,
      "owned_rss_bytes": 467910656,
      "owned_process_count": 4,
      "reclaimable_bytes": 12123815936,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.56090804200001,
      "owned_rss_bytes": 503873536,
      "owned_process_count": 4,
      "reclaimable_bytes": 12091604992,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.788932792,
      "owned_rss_bytes": 547946496,
      "owned_process_count": 4,
      "reclaimable_bytes": 12061097984,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.012408667,
      "owned_rss_bytes": 294092800,
      "owned_process_count": 4,
      "reclaimable_bytes": 12259606528,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.240579417,
      "owned_rss_bytes": 345341952,
      "owned_process_count": 4,
      "reclaimable_bytes": 12235702272,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.4685295,
      "owned_rss_bytes": 357498880,
      "owned_process_count": 4,
      "reclaimable_bytes": 12229984256,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.6972635,
      "owned_rss_bytes": 366952448,
      "owned_process_count": 4,
      "reclaimable_bytes": 12220186624,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.924845292,
      "owned_rss_bytes": 386957312,
      "owned_process_count": 4,
      "reclaimable_bytes": 12203753472,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.152514084,
      "owned_rss_bytes": 185696256,
      "owned_process_count": 4,
      "reclaimable_bytes": 12287426560,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.37567212500001,
      "owned_rss_bytes": 332922880,
      "owned_process_count": 4,
      "reclaimable_bytes": 12237864960,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.601020292,
      "owned_rss_bytes": 366084096,
      "owned_process_count": 4,
      "reclaimable_bytes": 12208046080,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.829323292,
      "owned_rss_bytes": 396705792,
      "owned_process_count": 4,
      "reclaimable_bytes": 12172656640,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.055438667,
      "owned_rss_bytes": 426639360,
      "owned_process_count": 4,
      "reclaimable_bytes": 12178669568,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.282850625,
      "owned_rss_bytes": 433717248,
      "owned_process_count": 4,
      "reclaimable_bytes": 12171673600,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.510659709,
      "owned_rss_bytes": 444121088,
      "owned_process_count": 4,
      "reclaimable_bytes": 12164251648,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.738918875,
      "owned_rss_bytes": 485244928,
      "owned_process_count": 4,
      "reclaimable_bytes": 12136464384,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.96491216700001,
      "owned_rss_bytes": 518668288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12115460096,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.188121042,
      "owned_rss_bytes": 634683392,
      "owned_process_count": 4,
      "reclaimable_bytes": 11995742208,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.415298709,
      "owned_rss_bytes": 139837440,
      "owned_process_count": 3,
      "reclaimable_bytes": 12279414784,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.640296959,
      "owned_rss_bytes": 195575808,
      "owned_process_count": 4,
      "reclaimable_bytes": 12247613440,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.864822209,
      "owned_rss_bytes": 163086336,
      "owned_process_count": 4,
      "reclaimable_bytes": 12244254720,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.09370458400001,
      "owned_rss_bytes": 253345792,
      "owned_process_count": 4,
      "reclaimable_bytes": 12161597440,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.321393917,
      "owned_rss_bytes": 266158080,
      "owned_process_count": 4,
      "reclaimable_bytes": 12294258688,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.549107125,
      "owned_rss_bytes": 321945600,
      "owned_process_count": 4,
      "reclaimable_bytes": 11125227520,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.780221375,
      "owned_rss_bytes": 369246208,
      "owned_process_count": 4,
      "reclaimable_bytes": 10910482432,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.011599834,
      "owned_rss_bytes": 420184064,
      "owned_process_count": 4,
      "reclaimable_bytes": 11993530368,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.236476334,
      "owned_rss_bytes": 433225728,
      "owned_process_count": 4,
      "reclaimable_bytes": 11975196672,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.46321825,
      "owned_rss_bytes": 444366848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11960320000,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.690542167,
      "owned_rss_bytes": 466993152,
      "owned_process_count": 4,
      "reclaimable_bytes": 11935842304,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.91748041700001,
      "owned_rss_bytes": 425967616,
      "owned_process_count": 4,
      "reclaimable_bytes": 11988221952,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.145416334,
      "owned_rss_bytes": 450199552,
      "owned_process_count": 4,
      "reclaimable_bytes": 11956944896,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.369877167,
      "owned_rss_bytes": 505118720,
      "owned_process_count": 4,
      "reclaimable_bytes": 11946164224,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.59738716700001,
      "owned_rss_bytes": 531218432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11930992640,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.825256667,
      "owned_rss_bytes": 233439232,
      "owned_process_count": 4,
      "reclaimable_bytes": 12175425536,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.053148209,
      "owned_rss_bytes": 322879488,
      "owned_process_count": 4,
      "reclaimable_bytes": 12129370112,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.281350584,
      "owned_rss_bytes": 371245056,
      "owned_process_count": 4,
      "reclaimable_bytes": 12108218368,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.509936917,
      "owned_rss_bytes": 409157632,
      "owned_process_count": 4,
      "reclaimable_bytes": 12071878656,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.736180709,
      "owned_rss_bytes": 414220288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12066799616,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.9636225,
      "owned_rss_bytes": 479789056,
      "owned_process_count": 4,
      "reclaimable_bytes": 12011929600,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.191137584,
      "owned_rss_bytes": 130236416,
      "owned_process_count": 4,
      "reclaimable_bytes": 12193415168,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.419090542,
      "owned_rss_bytes": 313720832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12144902144,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.648112917,
      "owned_rss_bytes": 312852480,
      "owned_process_count": 4,
      "reclaimable_bytes": 12137218048,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.876476167,
      "owned_rss_bytes": 362790912,
      "owned_process_count": 4,
      "reclaimable_bytes": 12101959680,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.102962417,
      "owned_rss_bytes": 379830272,
      "owned_process_count": 4,
      "reclaimable_bytes": 12087754752,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.327943125,
      "owned_rss_bytes": 391069696,
      "owned_process_count": 4,
      "reclaimable_bytes": 12082593792,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.555728167,
      "owned_rss_bytes": 157745152,
      "owned_process_count": 4,
      "reclaimable_bytes": 12197576704,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.784965959,
      "owned_rss_bytes": 199491584,
      "owned_process_count": 4,
      "reclaimable_bytes": 12171296768,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.013112709,
      "owned_rss_bytes": 255033344,
      "owned_process_count": 4,
      "reclaimable_bytes": 12128092160,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.23610125,
      "owned_rss_bytes": 178159616,
      "owned_process_count": 4,
      "reclaimable_bytes": 12178767872,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.461211667,
      "owned_rss_bytes": 274350080,
      "owned_process_count": 4,
      "reclaimable_bytes": 12157714432,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.689167875,
      "owned_rss_bytes": 322011136,
      "owned_process_count": 4,
      "reclaimable_bytes": 12120719360,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.916652125,
      "owned_rss_bytes": 318111744,
      "owned_process_count": 4,
      "reclaimable_bytes": 12112101376,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.144674792,
      "owned_rss_bytes": 297320448,
      "owned_process_count": 4,
      "reclaimable_bytes": 12149473280,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.372067834,
      "owned_rss_bytes": 335511552,
      "owned_process_count": 4,
      "reclaimable_bytes": 12123176960,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.599685542,
      "owned_rss_bytes": 91258880,
      "owned_process_count": 3,
      "reclaimable_bytes": 12200542208,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.82697070900001,
      "owned_rss_bytes": 203620352,
      "owned_process_count": 4,
      "reclaimable_bytes": 12164038656,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.055708917,
      "owned_rss_bytes": 255262720,
      "owned_process_count": 4,
      "reclaimable_bytes": 12112019456,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.284023125,
      "owned_rss_bytes": 317833216,
      "owned_process_count": 4,
      "reclaimable_bytes": 12051709952,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.512466167,
      "owned_rss_bytes": 383221760,
      "owned_process_count": 4,
      "reclaimable_bytes": 11990106112,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.73817975,
      "owned_rss_bytes": 97058816,
      "owned_process_count": 3,
      "reclaimable_bytes": 12094947328,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.961163,
      "owned_rss_bytes": 276938752,
      "owned_process_count": 4,
      "reclaimable_bytes": 12053086208,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.188604875,
      "owned_rss_bytes": 346243072,
      "owned_process_count": 4,
      "reclaimable_bytes": 12019269632,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.416487875,
      "owned_rss_bytes": 195756032,
      "owned_process_count": 4,
      "reclaimable_bytes": 12066914304,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.643906417,
      "owned_rss_bytes": 253329408,
      "owned_process_count": 4,
      "reclaimable_bytes": 11781619712,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.87107725,
      "owned_rss_bytes": 189923328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11818893312,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.099358042,
      "owned_rss_bytes": 244170752,
      "owned_process_count": 4,
      "reclaimable_bytes": 11774066688,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.3241415,
      "owned_rss_bytes": 298795008,
      "owned_process_count": 4,
      "reclaimable_bytes": 11721408512,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.553021917,
      "owned_rss_bytes": 166854656,
      "owned_process_count": 4,
      "reclaimable_bytes": 11832901632,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.781603667,
      "owned_rss_bytes": 223297536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11792531456,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.008270042,
      "owned_rss_bytes": 275628032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11749720064,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.238685875,
      "owned_rss_bytes": 341377024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11683659776,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.463421125,
      "owned_rss_bytes": 410255360,
      "owned_process_count": 4,
      "reclaimable_bytes": 11626594304,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.68951175000001,
      "owned_rss_bytes": 140869632,
      "owned_process_count": 4,
      "reclaimable_bytes": 11884969984,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.918056709,
      "owned_rss_bytes": 207339520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11848318976,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.14449279200001,
      "owned_rss_bytes": 263143424,
      "owned_process_count": 4,
      "reclaimable_bytes": 11792793600,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.372780125,
      "owned_rss_bytes": 316719104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11919654912,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.600163834,
      "owned_rss_bytes": 381059072,
      "owned_process_count": 4,
      "reclaimable_bytes": 11852890112,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.828530959,
      "owned_rss_bytes": 439877632,
      "owned_process_count": 4,
      "reclaimable_bytes": 11717427200,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.052644959,
      "owned_rss_bytes": 514916352,
      "owned_process_count": 4,
      "reclaimable_bytes": 11649794048,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.280340917,
      "owned_rss_bytes": 535314432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11632328704,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.507825084,
      "owned_rss_bytes": 150290432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11977097216,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.735394959,
      "owned_rss_bytes": 213155840,
      "owned_process_count": 4,
      "reclaimable_bytes": 11935334400,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.95925425,
      "owned_rss_bytes": 268926976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11886166016,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.187978625,
      "owned_rss_bytes": 106643456,
      "owned_process_count": 4,
      "reclaimable_bytes": 11985600512,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.41555025,
      "owned_rss_bytes": 205520896,
      "owned_process_count": 4,
      "reclaimable_bytes": 11944050688,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.644536792,
      "owned_rss_bytes": 256540672,
      "owned_process_count": 4,
      "reclaimable_bytes": 11895586816,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.873171417,
      "owned_rss_bytes": 317194240,
      "owned_process_count": 4,
      "reclaimable_bytes": 11836817408,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.101131125,
      "owned_rss_bytes": 365084672,
      "owned_process_count": 4,
      "reclaimable_bytes": 11882479616,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.327868084,
      "owned_rss_bytes": 417595392,
      "owned_process_count": 4,
      "reclaimable_bytes": 11830820864,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.555322375,
      "owned_rss_bytes": 192528384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12047253504,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.778073542,
      "owned_rss_bytes": 248578048,
      "owned_process_count": 4,
      "reclaimable_bytes": 12002099200,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.006765167,
      "owned_rss_bytes": 197115904,
      "owned_process_count": 4,
      "reclaimable_bytes": 12057559040,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.234406292,
      "owned_rss_bytes": 247201792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11966824448,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.463876125,
      "owned_rss_bytes": 312492032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11833376768,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.692644417,
      "owned_rss_bytes": 190283776,
      "owned_process_count": 4,
      "reclaimable_bytes": 11937316864,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.922540209,
      "owned_rss_bytes": 242941952,
      "owned_process_count": 4,
      "reclaimable_bytes": 11925913600,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.1525705,
      "owned_rss_bytes": 151339008,
      "owned_process_count": 4,
      "reclaimable_bytes": 11974131712,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.381156667,
      "owned_rss_bytes": 208355328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11906367488,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.610112292,
      "owned_rss_bytes": 260489216,
      "owned_process_count": 4,
      "reclaimable_bytes": 11780227072,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.8426205,
      "owned_rss_bytes": 164249600,
      "owned_process_count": 4,
      "reclaimable_bytes": 11916689408,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.069545584,
      "owned_rss_bytes": 214122496,
      "owned_process_count": 4,
      "reclaimable_bytes": 11801444352,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.2995575,
      "owned_rss_bytes": 266452992,
      "owned_process_count": 4,
      "reclaimable_bytes": 11806556160,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.529798125,
      "owned_rss_bytes": 322076672,
      "owned_process_count": 4,
      "reclaimable_bytes": 11783225344,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.759824,
      "owned_rss_bytes": 163119104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11866767360,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.991214042,
      "owned_rss_bytes": 214581248,
      "owned_process_count": 4,
      "reclaimable_bytes": 11865751552,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.221248042,
      "owned_rss_bytes": 267091968,
      "owned_process_count": 4,
      "reclaimable_bytes": 11840061440,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.451176125,
      "owned_rss_bytes": 334512128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11595317248,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.678116084,
      "owned_rss_bytes": 385400832,
      "owned_process_count": 4,
      "reclaimable_bytes": 11579555840,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.908165667,
      "owned_rss_bytes": 436961280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11465261056,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.144523167,
      "owned_rss_bytes": 488882176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11495653376,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.374858125,
      "owned_rss_bytes": 537526272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11448532992,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.602769167,
      "owned_rss_bytes": 590512128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11382063104,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.827793834,
      "owned_rss_bytes": 669384704,
      "owned_process_count": 4,
      "reclaimable_bytes": 11297226752,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.056706292,
      "owned_rss_bytes": 691404800,
      "owned_process_count": 4,
      "reclaimable_bytes": 11280433152,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.285977875,
      "owned_rss_bytes": 719192064,
      "owned_process_count": 4,
      "reclaimable_bytes": 11253153792,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.514253167,
      "owned_rss_bytes": 162283520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11573837824,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.742266334,
      "owned_rss_bytes": 219086848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11531517952,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.968527917,
      "owned_rss_bytes": 275349504,
      "owned_process_count": 4,
      "reclaimable_bytes": 11470946304,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.19771225,
      "owned_rss_bytes": 89538560,
      "owned_process_count": 3,
      "reclaimable_bytes": 11552538624,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.427534459,
      "owned_rss_bytes": 200949760,
      "owned_process_count": 4,
      "reclaimable_bytes": 11409768448,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.656166834,
      "owned_rss_bytes": 162447360,
      "owned_process_count": 4,
      "reclaimable_bytes": 11437785088,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.885841209,
      "owned_rss_bytes": 218021888,
      "owned_process_count": 4,
      "reclaimable_bytes": 11581964288,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.1137495,
      "owned_rss_bytes": 185319424,
      "owned_process_count": 4,
      "reclaimable_bytes": 11416109056,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.342370917,
      "owned_rss_bytes": 242925568,
      "owned_process_count": 4,
      "reclaimable_bytes": 11368726528,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.572965834,
      "owned_rss_bytes": 194674688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11406049280,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.802286459,
      "owned_rss_bytes": 151584768,
      "owned_process_count": 4,
      "reclaimable_bytes": 11436294144,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.03262375,
      "owned_rss_bytes": 209567744,
      "owned_process_count": 4,
      "reclaimable_bytes": 11385405440,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.261998625,
      "owned_rss_bytes": 259784704,
      "owned_process_count": 4,
      "reclaimable_bytes": 10870145024,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.490634084,
      "owned_rss_bytes": 173391872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10932043776,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.717985375,
      "owned_rss_bytes": 222609408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10882613248,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.942383125,
      "owned_rss_bytes": 267763712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10756898816,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.168031375,
      "owned_rss_bytes": 176144384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10838081536,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.39868470900001,
      "owned_rss_bytes": 226574336,
      "owned_process_count": 4,
      "reclaimable_bytes": 10840997888,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.625725375,
      "owned_rss_bytes": 187531264,
      "owned_process_count": 4,
      "reclaimable_bytes": 10861723648,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.8509135,
      "owned_rss_bytes": 240599040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10934386688,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.07712325,
      "owned_rss_bytes": 192004096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10878828544,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.307649584,
      "owned_rss_bytes": 94240768,
      "owned_process_count": 3,
      "reclaimable_bytes": 10931781632,
      "swapins": 44112339,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.534732667,
      "owned_rss_bytes": 199917568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10878271488,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.766963792,
      "owned_rss_bytes": 255492096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10827988992,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.998158792,
      "owned_rss_bytes": 193282048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10878894080,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.225711542,
      "owned_rss_bytes": 185237504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10887004160,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.455142292,
      "owned_rss_bytes": 237420544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10908794880,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.687067167,
      "owned_rss_bytes": 287981568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10833690624,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.920521875,
      "owned_rss_bytes": 333283328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10982293504,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.145357125,
      "owned_rss_bytes": 381157376,
      "owned_process_count": 4,
      "reclaimable_bytes": 10947805184,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.37726354200001,
      "owned_rss_bytes": 184401920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11105550336,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.6074175,
      "owned_rss_bytes": 234602496,
      "owned_process_count": 4,
      "reclaimable_bytes": 11059232768,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.832553,
      "owned_rss_bytes": 294125568,
      "owned_process_count": 4,
      "reclaimable_bytes": 11001511936,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.060154417,
      "owned_rss_bytes": 341688320,
      "owned_process_count": 4,
      "reclaimable_bytes": 10960371712,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.28992883400001,
      "owned_rss_bytes": 193085440,
      "owned_process_count": 4,
      "reclaimable_bytes": 11102371840,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.520520167,
      "owned_rss_bytes": 238403584,
      "owned_process_count": 4,
      "reclaimable_bytes": 11065065472,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.749612834,
      "owned_rss_bytes": 299761664,
      "owned_process_count": 4,
      "reclaimable_bytes": 11004641280,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.975719459,
      "owned_rss_bytes": 364019712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10954211328,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.205868417,
      "owned_rss_bytes": 188940288,
      "owned_process_count": 4,
      "reclaimable_bytes": 11114528768,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.4368055,
      "owned_rss_bytes": 239943680,
      "owned_process_count": 4,
      "reclaimable_bytes": 11059118080,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.663576875,
      "owned_rss_bytes": 299991040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11093983232,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.88949475,
      "owned_rss_bytes": 362856448,
      "owned_process_count": 4,
      "reclaimable_bytes": 11034017792,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.12012520900001,
      "owned_rss_bytes": 184139776,
      "owned_process_count": 4,
      "reclaimable_bytes": 11191713792,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.350280584,
      "owned_rss_bytes": 225083392,
      "owned_process_count": 4,
      "reclaimable_bytes": 11053498368,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.58128025,
      "owned_rss_bytes": 268288000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10898227200,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.81221475,
      "owned_rss_bytes": 305512448,
      "owned_process_count": 4,
      "reclaimable_bytes": 10833362944,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.044361459,
      "owned_rss_bytes": 365117440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10793041920,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.273270084,
      "owned_rss_bytes": 183009280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10947051520,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.500743167,
      "owned_rss_bytes": 228671488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10924457984,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.733112125,
      "owned_rss_bytes": 285655040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10857988096,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.964023125,
      "owned_rss_bytes": 341082112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10613342208,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.19241775,
      "owned_rss_bytes": 179798016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10764648448,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.423135,
      "owned_rss_bytes": 231047168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10724458496,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.650803042,
      "owned_rss_bytes": 288948224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10755538944,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.88080625,
      "owned_rss_bytes": 348127232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10712072192,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.110608834,
      "owned_rss_bytes": 179683328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11044159488,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.341103334,
      "owned_rss_bytes": 231800832,
      "owned_process_count": 4,
      "reclaimable_bytes": 11022155776,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.571415959,
      "owned_rss_bytes": 297041920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10956800000,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.80261179200001,
      "owned_rss_bytes": 362135552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10924982272,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.033789834,
      "owned_rss_bytes": 193953792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11073830912,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.263368209,
      "owned_rss_bytes": 245022720,
      "owned_process_count": 4,
      "reclaimable_bytes": 11022516224,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.491973,
      "owned_rss_bytes": 305463296,
      "owned_process_count": 4,
      "reclaimable_bytes": 10965680128,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.72011866700001,
      "owned_rss_bytes": 359104512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10914578432,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.952343125,
      "owned_rss_bytes": 168722432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11099832320,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.180640667,
      "owned_rss_bytes": 219922432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11053383680,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.412293334,
      "owned_rss_bytes": 279707648,
      "owned_process_count": 4,
      "reclaimable_bytes": 10995187712,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.642974084,
      "owned_rss_bytes": 342310912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10936696832,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.872688959,
      "owned_rss_bytes": 178274304,
      "owned_process_count": 4,
      "reclaimable_bytes": 11345969152,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.102235917,
      "owned_rss_bytes": 237797376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11282825216,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.332130792,
      "owned_rss_bytes": 299483136,
      "owned_process_count": 4,
      "reclaimable_bytes": 11224694784,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.562089709,
      "owned_rss_bytes": 179126272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11327406080,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.789548542,
      "owned_rss_bytes": 229818368,
      "owned_process_count": 4,
      "reclaimable_bytes": 11280318464,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.019869834,
      "owned_rss_bytes": 294518784,
      "owned_process_count": 4,
      "reclaimable_bytes": 11225251840,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.247741375,
      "owned_rss_bytes": 349356032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11163893760,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.477386792,
      "owned_rss_bytes": 181878784,
      "owned_process_count": 4,
      "reclaimable_bytes": 11329667072,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.705897375,
      "owned_rss_bytes": 235372544,
      "owned_process_count": 4,
      "reclaimable_bytes": 11276369920,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.934175292,
      "owned_rss_bytes": 298467328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11214225408,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.159074959,
      "owned_rss_bytes": 358612992,
      "owned_process_count": 4,
      "reclaimable_bytes": 11158880256,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.389118709,
      "owned_rss_bytes": 162070528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11338235904,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.617753625,
      "owned_rss_bytes": 217513984,
      "owned_process_count": 4,
      "reclaimable_bytes": 11287609344,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.845033584,
      "owned_rss_bytes": 269451264,
      "owned_process_count": 4,
      "reclaimable_bytes": 11240112128,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.074485959,
      "owned_rss_bytes": 324452352,
      "owned_process_count": 4,
      "reclaimable_bytes": 11190796288,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.30154058400001,
      "owned_rss_bytes": 152698880,
      "owned_process_count": 4,
      "reclaimable_bytes": 11346771968,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.530175584,
      "owned_rss_bytes": 203603968,
      "owned_process_count": 4,
      "reclaimable_bytes": 11280056320,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.760428084,
      "owned_rss_bytes": 248676352,
      "owned_process_count": 4,
      "reclaimable_bytes": 11140399104,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.990042542,
      "owned_rss_bytes": 315604992,
      "owned_process_count": 4,
      "reclaimable_bytes": 11076796416,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.218014334,
      "owned_rss_bytes": 379387904,
      "owned_process_count": 4,
      "reclaimable_bytes": 11217027072,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.447752959,
      "owned_rss_bytes": 198049792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11183849472,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.677092834,
      "owned_rss_bytes": 258752512,
      "owned_process_count": 4,
      "reclaimable_bytes": 11126702080,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.90641966700001,
      "owned_rss_bytes": 323207168,
      "owned_process_count": 4,
      "reclaimable_bytes": 11067752448,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.13422533399998,
      "owned_rss_bytes": 179060736,
      "owned_process_count": 4,
      "reclaimable_bytes": 11199676416,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.35974554199998,
      "owned_rss_bytes": 232013824,
      "owned_process_count": 4,
      "reclaimable_bytes": 11161878528,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.58600424999997,
      "owned_rss_bytes": 292487168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10909990912,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.813100709,
      "owned_rss_bytes": 338051072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10957258752,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.04244383399998,
      "owned_rss_bytes": 407126016,
      "owned_process_count": 4,
      "reclaimable_bytes": 11008655360,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.26634370899998,
      "owned_rss_bytes": 169967616,
      "owned_process_count": 4,
      "reclaimable_bytes": 11225661440,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.492445667,
      "owned_rss_bytes": 220643328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11077222400,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.72600437499997,
      "owned_rss_bytes": 277544960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11001774080,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.956446667,
      "owned_rss_bytes": 338821120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10944069632,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.185802917,
      "owned_rss_bytes": 178143232,
      "owned_process_count": 4,
      "reclaimable_bytes": 11121131520,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.412078792,
      "owned_rss_bytes": 231014400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11077025792,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.64139458399998,
      "owned_rss_bytes": 289062912,
      "owned_process_count": 4,
      "reclaimable_bytes": 11188436992,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.870617709,
      "owned_rss_bytes": 347979776,
      "owned_process_count": 4,
      "reclaimable_bytes": 11151441920,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.096404834,
      "owned_rss_bytes": 163250176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11323490304,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.32436912499998,
      "owned_rss_bytes": 215007232,
      "owned_process_count": 4,
      "reclaimable_bytes": 11287707648,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.552663167,
      "owned_rss_bytes": 267681792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11238555648,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.77843499999997,
      "owned_rss_bytes": 328892416,
      "owned_process_count": 4,
      "reclaimable_bytes": 11185717248,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.007138667,
      "owned_rss_bytes": 391905280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11130175488,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.235587834,
      "owned_rss_bytes": 194920448,
      "owned_process_count": 4,
      "reclaimable_bytes": 11118575616,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.461032,
      "owned_rss_bytes": 247627776,
      "owned_process_count": 4,
      "reclaimable_bytes": 11071602688,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.689624625,
      "owned_rss_bytes": 308690944,
      "owned_process_count": 4,
      "reclaimable_bytes": 11013242880,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.91639120899998,
      "owned_rss_bytes": 375308288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10966499328,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.142404084,
      "owned_rss_bytes": 189022208,
      "owned_process_count": 4,
      "reclaimable_bytes": 11216338944,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.369316667,
      "owned_rss_bytes": 239796224,
      "owned_process_count": 4,
      "reclaimable_bytes": 11172118528,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.59813416699998,
      "owned_rss_bytes": 298287104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11121147904,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.82575624999998,
      "owned_rss_bytes": 354385920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11071848448,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.056373834,
      "owned_rss_bytes": 403210240,
      "owned_process_count": 4,
      "reclaimable_bytes": 11030134784,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.284850125,
      "owned_rss_bytes": 458244096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10984931328,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.51318129199998,
      "owned_rss_bytes": 168574976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11242651648,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.74263116699998,
      "owned_rss_bytes": 208142336,
      "owned_process_count": 4,
      "reclaimable_bytes": 11171299328,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.97795125,
      "owned_rss_bytes": 254885888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10958159872,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.20920991699998,
      "owned_rss_bytes": 311902208,
      "owned_process_count": 4,
      "reclaimable_bytes": 10891968512,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.43954599999998,
      "owned_rss_bytes": 168591360,
      "owned_process_count": 4,
      "reclaimable_bytes": 11187994624,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.668624334,
      "owned_rss_bytes": 210092032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11140612096,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.90265674999998,
      "owned_rss_bytes": 255541248,
      "owned_process_count": 4,
      "reclaimable_bytes": 10734436352,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.133112292,
      "owned_rss_bytes": 300974080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10685202432,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.37058812499998,
      "owned_rss_bytes": 149618688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10816897024,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.604542834,
      "owned_rss_bytes": 196591616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10772201472,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.834268084,
      "owned_rss_bytes": 241090560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10881990656,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.068935375,
      "owned_rss_bytes": 298041344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10829021184,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.30284724999999,
      "owned_rss_bytes": 367411200,
      "owned_process_count": 4,
      "reclaimable_bytes": 10871406592,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.53562912499999,
      "owned_rss_bytes": 190808064,
      "owned_process_count": 4,
      "reclaimable_bytes": 11025448960,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.76403649999997,
      "owned_rss_bytes": 224559104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11070275584,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.023102209,
      "owned_rss_bytes": 266354688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10845831168,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.255427167,
      "owned_rss_bytes": 316407808,
      "owned_process_count": 4,
      "reclaimable_bytes": 11800592384,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.487035542,
      "owned_rss_bytes": 160497664,
      "owned_process_count": 4,
      "reclaimable_bytes": 11938791424,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.714757459,
      "owned_rss_bytes": 209797120,
      "owned_process_count": 4,
      "reclaimable_bytes": 11792384000,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.949038375,
      "owned_rss_bytes": 251478016,
      "owned_process_count": 4,
      "reclaimable_bytes": 11678498816,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.18955566699998,
      "owned_rss_bytes": 293699584,
      "owned_process_count": 4,
      "reclaimable_bytes": 11600691200,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.4277065,
      "owned_rss_bytes": 153780224,
      "owned_process_count": 4,
      "reclaimable_bytes": 11829772288,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.665047209,
      "owned_rss_bytes": 187351040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11727077376,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.900102334,
      "owned_rss_bytes": 217923584,
      "owned_process_count": 4,
      "reclaimable_bytes": 11537907712,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.133882667,
      "owned_rss_bytes": 261734400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11190681600,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.36828145899997,
      "owned_rss_bytes": 311853056,
      "owned_process_count": 4,
      "reclaimable_bytes": 11171676160,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.60550475,
      "owned_rss_bytes": 345669632,
      "owned_process_count": 4,
      "reclaimable_bytes": 11110563840,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.84275037499998,
      "owned_rss_bytes": 376963072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10792370176,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.08311866699998,
      "owned_rss_bytes": 420741120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10435690496,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.319903959,
      "owned_rss_bytes": 159334400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10661560320,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.552624834,
      "owned_rss_bytes": 196198400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10622943232,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.792213084,
      "owned_rss_bytes": 228294656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10643750912,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.02574295899998,
      "owned_rss_bytes": 264404992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10494263296,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.25907966699998,
      "owned_rss_bytes": 309510144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10446831616,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.49244887499998,
      "owned_rss_bytes": 362790912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10391568384,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.72574566699998,
      "owned_rss_bytes": 393363456,
      "owned_process_count": 4,
      "reclaimable_bytes": 10358472704,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.963622542,
      "owned_rss_bytes": 437846016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10327900160,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.204671792,
      "owned_rss_bytes": 454541312,
      "owned_process_count": 4,
      "reclaimable_bytes": 10587193344,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.442842792,
      "owned_rss_bytes": 176390144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10552803328,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.678841875,
      "owned_rss_bytes": 215646208,
      "owned_process_count": 4,
      "reclaimable_bytes": 10514841600,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.916368084,
      "owned_rss_bytes": 259309568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10490232832,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.157833792,
      "owned_rss_bytes": 305004544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10439753728,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.39242762499998,
      "owned_rss_bytes": 364625920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10371874816,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.625521792,
      "owned_rss_bytes": 181338112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10526785536,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.859445334,
      "owned_rss_bytes": 220381184,
      "owned_process_count": 4,
      "reclaimable_bytes": 10600513536,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.09375583399998,
      "owned_rss_bytes": 269680640,
      "owned_process_count": 4,
      "reclaimable_bytes": 11250597888,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.326819084,
      "owned_rss_bytes": 313704448,
      "owned_process_count": 4,
      "reclaimable_bytes": 11224268800,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.56599949999998,
      "owned_rss_bytes": 351617024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11024809984,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.80406516699998,
      "owned_rss_bytes": 127090688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10883416064,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.045083084,
      "owned_rss_bytes": 187105280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10660708352,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.279470667,
      "owned_rss_bytes": 226197504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10615209984,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.511956084,
      "owned_rss_bytes": 265502720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10571464704,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.74933166699998,
      "owned_rss_bytes": 304726016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10530242560,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.984722334,
      "owned_rss_bytes": 346374144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10483351552,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.220088667,
      "owned_rss_bytes": 153190400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10652352512,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.45529929199998,
      "owned_rss_bytes": 190218240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10610360320,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.68756520899998,
      "owned_rss_bytes": 220102656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10454941696,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.92577441699999,
      "owned_rss_bytes": 265748480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10405838848,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.15709295899998,
      "owned_rss_bytes": 317652992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10351214592,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.384104375,
      "owned_rss_bytes": 142966784,
      "owned_process_count": 4,
      "reclaimable_bytes": 10512498688,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.61839849999998,
      "owned_rss_bytes": 188104704,
      "owned_process_count": 4,
      "reclaimable_bytes": 10481041408,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.85401737499998,
      "owned_rss_bytes": 233504768,
      "owned_process_count": 4,
      "reclaimable_bytes": 10433495040,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.09142683399998,
      "owned_rss_bytes": 268337152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10403790848,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.32879387499997,
      "owned_rss_bytes": 319438848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10454335488,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.55915687499999,
      "owned_rss_bytes": 171786240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10596761600,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.79241579199999,
      "owned_rss_bytes": 211419136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10568056832,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.02843575,
      "owned_rss_bytes": 136544256,
      "owned_process_count": 4,
      "reclaimable_bytes": 10633576448,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.262075209,
      "owned_rss_bytes": 189399040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10591698944,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.49355462499997,
      "owned_rss_bytes": 230375424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10588078080,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.727279625,
      "owned_rss_bytes": 269942784,
      "owned_process_count": 4,
      "reclaimable_bytes": 11313299456,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.96629595899998,
      "owned_rss_bytes": 159563776,
      "owned_process_count": 4,
      "reclaimable_bytes": 11408621568,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.207631459,
      "owned_rss_bytes": 188350464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11174592512,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.45287091699998,
      "owned_rss_bytes": 223035392,
      "owned_process_count": 4,
      "reclaimable_bytes": 11138285568,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.68670658399998,
      "owned_rss_bytes": 263159808,
      "owned_process_count": 4,
      "reclaimable_bytes": 11097571328,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.92253875,
      "owned_rss_bytes": 164741120,
      "owned_process_count": 4,
      "reclaimable_bytes": 11192434688,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.159621,
      "owned_rss_bytes": 197558272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11319459840,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.39936245899997,
      "owned_rss_bytes": 224641024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11204460544,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.63847495899998,
      "owned_rss_bytes": 166690816,
      "owned_process_count": 4,
      "reclaimable_bytes": 11048763392,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.877131959,
      "owned_rss_bytes": 202801152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10840014848,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.110697209,
      "owned_rss_bytes": 233062400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10796269568,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.35040983399998,
      "owned_rss_bytes": 267026432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10770169856,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.587307792,
      "owned_rss_bytes": 295288832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10559438848,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.82328537499998,
      "owned_rss_bytes": 329613312,
      "owned_process_count": 4,
      "reclaimable_bytes": 10287382528,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.064601042,
      "owned_rss_bytes": 362905600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10237411328,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.29747774999998,
      "owned_rss_bytes": 407879680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10253746176,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.53397475,
      "owned_rss_bytes": 443039744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10125574144,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.770541375,
      "owned_rss_bytes": 458702848,
      "owned_process_count": 4,
      "reclaimable_bytes": 9920020480,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.004556542,
      "owned_rss_bytes": 147406848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10220617728,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.23758195899998,
      "owned_rss_bytes": 184107008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10188472320,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.47692583399999,
      "owned_rss_bytes": 215105536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10159702016,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.71391816699997,
      "owned_rss_bytes": 251887616,
      "owned_process_count": 4,
      "reclaimable_bytes": 9946857472,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.95015425,
      "owned_rss_bytes": 298958848,
      "owned_process_count": 4,
      "reclaimable_bytes": 9902096384,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.18380629199999,
      "owned_rss_bytes": 355909632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9848258560,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.41674454199998,
      "owned_rss_bytes": 408862720,
      "owned_process_count": 4,
      "reclaimable_bytes": 9813295104,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.6506155,
      "owned_rss_bytes": 156712960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10250633216,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.88845537499998,
      "owned_rss_bytes": 185434112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10253172736,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.132342,
      "owned_rss_bytes": 219430912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10231218176,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.368075875,
      "owned_rss_bytes": 257769472,
      "owned_process_count": 4,
      "reclaimable_bytes": 10200678400,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.60547874999997,
      "owned_rss_bytes": 311869440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10149314560,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.83485495899998,
      "owned_rss_bytes": 364314624,
      "owned_process_count": 4,
      "reclaimable_bytes": 10095689728,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.06246016699998,
      "owned_rss_bytes": 431210496,
      "owned_process_count": 4,
      "reclaimable_bytes": 10033135616,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.28965895899998,
      "owned_rss_bytes": 454787072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10011394048,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.51961195899997,
      "owned_rss_bytes": 188284928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10252419072,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.748864,
      "owned_rss_bytes": 234242048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10340679680,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.97574816699998,
      "owned_rss_bytes": 277168128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10302570496,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.20158825,
      "owned_rss_bytes": 338837504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10155229184,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.430233709,
      "owned_rss_bytes": 186171392,
      "owned_process_count": 4,
      "reclaimable_bytes": 10297540608,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.660408709,
      "owned_rss_bytes": 240648192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10250190848,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.88508820899997,
      "owned_rss_bytes": 279773184,
      "owned_process_count": 4,
      "reclaimable_bytes": 10213933056,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.11530112499997,
      "owned_rss_bytes": 342441984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10318675968,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.34180791699998,
      "owned_rss_bytes": 193789952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10278010880,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.57145683399997,
      "owned_rss_bytes": 248872960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10133225472,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.80127133399998,
      "owned_rss_bytes": 293552128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10092445696,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.030878667,
      "owned_rss_bytes": 367591424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10189504512,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.26410620899998,
      "owned_rss_bytes": 155320320,
      "owned_process_count": 4,
      "reclaimable_bytes": 10382868480,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.487904042,
      "owned_rss_bytes": 209797120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10339205120,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.716429917,
      "owned_rss_bytes": 264192000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10290528256,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.945685584,
      "owned_rss_bytes": 307511296,
      "owned_process_count": 4,
      "reclaimable_bytes": 10270982144,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.17613125,
      "owned_rss_bytes": 352894976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10222698496,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.40558299999998,
      "owned_rss_bytes": 427130880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10165207040,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.636493167,
      "owned_rss_bytes": 445775872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10060120064,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.86639962499999,
      "owned_rss_bytes": 173375488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10304520192,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.092419375,
      "owned_rss_bytes": 222740480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10258202624,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.32190358399998,
      "owned_rss_bytes": 270811136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10212278272,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.551095167,
      "owned_rss_bytes": 318488576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10161782784,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.781191584,
      "owned_rss_bytes": 379289600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10113007616,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.00648579199998,
      "owned_rss_bytes": 180748288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10292592640,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.23507858399998,
      "owned_rss_bytes": 233242624,
      "owned_process_count": 4,
      "reclaimable_bytes": 10240933888,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.462153417,
      "owned_rss_bytes": 299024384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10201923584,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.691807959,
      "owned_rss_bytes": 367575040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10148151296,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.921872792,
      "owned_rss_bytes": 103104512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10324590592,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.156477917,
      "owned_rss_bytes": 195231744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10272112640,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.386144834,
      "owned_rss_bytes": 246333440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10222223360,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.61342570899998,
      "owned_rss_bytes": 302301184,
      "owned_process_count": 4,
      "reclaimable_bytes": 10166452224,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.842480459,
      "owned_rss_bytes": 149831680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10319249408,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.07167729199998,
      "owned_rss_bytes": 204423168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10270081024,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.300082584,
      "owned_rss_bytes": 255737856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10238771200,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.528434584,
      "owned_rss_bytes": 299712512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10191962112,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.753831542,
      "owned_rss_bytes": 361250816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10142941184,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.97849083399998,
      "owned_rss_bytes": 180781056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10302652416,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.20731445899997,
      "owned_rss_bytes": 232898560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10251173888,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.43775029199998,
      "owned_rss_bytes": 300040192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10197073920,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.66704149999998,
      "owned_rss_bytes": 370753536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10140532736,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.89682062499998,
      "owned_rss_bytes": 433635328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10082910208,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.12625204199998,
      "owned_rss_bytes": 183418880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10306273280,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.356637084,
      "owned_rss_bytes": 234143744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10261266432,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.58459108399998,
      "owned_rss_bytes": 294043648,
      "owned_process_count": 4,
      "reclaimable_bytes": 10183245824,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.81690049999997,
      "owned_rss_bytes": 365641728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10128457728,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.04409354199998,
      "owned_rss_bytes": 103333888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10326540288,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.272744625,
      "owned_rss_bytes": 194576384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10279698432,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.502874167,
      "owned_rss_bytes": 241352704,
      "owned_process_count": 4,
      "reclaimable_bytes": 10042441728,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.73237583399998,
      "owned_rss_bytes": 287555584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9999302656,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.95912475,
      "owned_rss_bytes": 141967360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10134618112,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.1848375,
      "owned_rss_bytes": 197574656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10092511232,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.41181883399997,
      "owned_rss_bytes": 86147072,
      "owned_process_count": 3,
      "reclaimable_bytes": 10150510592,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.63797674999998,
      "owned_rss_bytes": 196640768,
      "owned_process_count": 4,
      "reclaimable_bytes": 10106863616,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.867780542,
      "owned_rss_bytes": 252133376,
      "owned_process_count": 4,
      "reclaimable_bytes": 10156163072,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.09642904199998,
      "owned_rss_bytes": 319651840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10261856256,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.32490529199998,
      "owned_rss_bytes": 393068544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10219405312,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.55467424999998,
      "owned_rss_bytes": 159744000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10406707200,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.78416133399998,
      "owned_rss_bytes": 209977344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10366353408,
      "swapins": 44112343,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.011327584,
      "owned_rss_bytes": 261898240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10324656128,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.240599917,
      "owned_rss_bytes": 317390848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10270998528,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.468040917,
      "owned_rss_bytes": 409157632,
      "owned_process_count": 4,
      "reclaimable_bytes": 10175922176,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.69743212499998,
      "owned_rss_bytes": 488275968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10107305984,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.92577791699998,
      "owned_rss_bytes": 516145152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10085122048,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.149945125,
      "owned_rss_bytes": 150847488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10408542208,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.37687533399998,
      "owned_rss_bytes": 207847424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10359242752,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.60626837499998,
      "owned_rss_bytes": 256753664,
      "owned_process_count": 4,
      "reclaimable_bytes": 9882632192,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.83468466699998,
      "owned_rss_bytes": 317751296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9992699904,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.062965709,
      "owned_rss_bytes": 193003520,
      "owned_process_count": 4,
      "reclaimable_bytes": 9901129728,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.30146937499998,
      "owned_rss_bytes": 241827840,
      "owned_process_count": 4,
      "reclaimable_bytes": 9820356608,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.526608209,
      "owned_rss_bytes": 305512448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9760620544,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.756178792,
      "owned_rss_bytes": 141148160,
      "owned_process_count": 4,
      "reclaimable_bytes": 9947185152,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.984879625,
      "owned_rss_bytes": 207306752,
      "owned_process_count": 4,
      "reclaimable_bytes": 9915695104,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.209108292,
      "owned_rss_bytes": 265912320,
      "owned_process_count": 4,
      "reclaimable_bytes": 9938894848,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.437763209,
      "owned_rss_bytes": 335986688,
      "owned_process_count": 4,
      "reclaimable_bytes": 9889693696,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.66130941699998,
      "owned_rss_bytes": 166395904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10044866560,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.89016708399998,
      "owned_rss_bytes": 219398144,
      "owned_process_count": 4,
      "reclaimable_bytes": 9818669056,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.117486542,
      "owned_rss_bytes": 277037056,
      "owned_process_count": 4,
      "reclaimable_bytes": 9870000128,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.347277959,
      "owned_rss_bytes": 342130688,
      "owned_process_count": 4,
      "reclaimable_bytes": 9917218816,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.576371584,
      "owned_rss_bytes": 162234368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10093035520,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.80138054199998,
      "owned_rss_bytes": 217088000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10063888384,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.02771324999998,
      "owned_rss_bytes": 274677760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10180575232,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.253915125,
      "owned_rss_bytes": 178421760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10270916608,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.47916816699998,
      "owned_rss_bytes": 231276544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10221584384,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.70860629199998,
      "owned_rss_bytes": 176553984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10274226176,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.934637709,
      "owned_rss_bytes": 231014400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10225860608,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.16139374999997,
      "owned_rss_bytes": 293519360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10168827904,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.387342709,
      "owned_rss_bytes": 359448576,
      "owned_process_count": 4,
      "reclaimable_bytes": 9917497344,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.611474875,
      "owned_rss_bytes": 416694272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9903620096,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.842437292,
      "owned_rss_bytes": 170754048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10115203072,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.071887625,
      "owned_rss_bytes": 220692480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10070933504,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.30141749999999,
      "owned_rss_bytes": 277757952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10019127296,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.52774724999998,
      "owned_rss_bytes": 346308608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10145660928,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.75401079199997,
      "owned_rss_bytes": 407928832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10095525888,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.983647042,
      "owned_rss_bytes": 165675008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10326654976,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.21137954199997,
      "owned_rss_bytes": 217432064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10449846272,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.43901849999997,
      "owned_rss_bytes": 269975552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10438803456,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.66458899999998,
      "owned_rss_bytes": 177602560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10558455808,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.894008959,
      "owned_rss_bytes": 167903232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10575478784,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.122698209,
      "owned_rss_bytes": 222724096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10536206336,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.35090012499998,
      "owned_rss_bytes": 272449536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10298064896,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.57894695899998,
      "owned_rss_bytes": 325828608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10243768320,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.808006792,
      "owned_rss_bytes": 384122880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10180755456,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.03671774999998,
      "owned_rss_bytes": 494174208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9892675584,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.26632725,
      "owned_rss_bytes": 511344640,
      "owned_process_count": 4,
      "reclaimable_bytes": 9868263424,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.49470920899998,
      "owned_rss_bytes": 150274048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10365550592,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.723914625,
      "owned_rss_bytes": 209567744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10318315520,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.952113584,
      "owned_rss_bytes": 267452416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10286071808,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.18022970899997,
      "owned_rss_bytes": 342638592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10225270784,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.404904792,
      "owned_rss_bytes": 406831104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10175774720,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.633282875,
      "owned_rss_bytes": 463323136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10126032896,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.85979941699998,
      "owned_rss_bytes": 190038016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10367516672,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.08844499999998,
      "owned_rss_bytes": 239009792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10323869696,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.31829495899999,
      "owned_rss_bytes": 307134464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10265640960,
      "swapins": 44112351,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.546637875,
      "owned_rss_bytes": 379535360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10202202112,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.7747355,
      "owned_rss_bytes": 148324352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10394189824,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.00349229199998,
      "owned_rss_bytes": 207831040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10070409216,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.230142125,
      "owned_rss_bytes": 260063232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10012999680,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.458945917,
      "owned_rss_bytes": 304218112,
      "owned_process_count": 4,
      "reclaimable_bytes": 9969467392,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.68939070899998,
      "owned_rss_bytes": 352665600,
      "owned_process_count": 4,
      "reclaimable_bytes": 9922822144,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.919527375,
      "owned_rss_bytes": 402997248,
      "owned_process_count": 4,
      "reclaimable_bytes": 9886318592,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.145536959,
      "owned_rss_bytes": 448856064,
      "owned_process_count": 4,
      "reclaimable_bytes": 9841426432,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.36960975,
      "owned_rss_bytes": 538001408,
      "owned_process_count": 4,
      "reclaimable_bytes": 9819029504,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.59929337499997,
      "owned_rss_bytes": 631504896,
      "owned_process_count": 4,
      "reclaimable_bytes": 9725673472,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.82566774999998,
      "owned_rss_bytes": 866238464,
      "owned_process_count": 4,
      "reclaimable_bytes": 9507749888,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.054992334,
      "owned_rss_bytes": 885719040,
      "owned_process_count": 4,
      "reclaimable_bytes": 9490989056,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.279159917,
      "owned_rss_bytes": 908623872,
      "owned_process_count": 4,
      "reclaimable_bytes": 9557131264,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.50750433399998,
      "owned_rss_bytes": 925761536,
      "owned_process_count": 4,
      "reclaimable_bytes": 9538584576,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.73456804199998,
      "owned_rss_bytes": 958595072,
      "owned_process_count": 4,
      "reclaimable_bytes": 9503719424,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.96490037499998,
      "owned_rss_bytes": 975273984,
      "owned_process_count": 4,
      "reclaimable_bytes": 9482846208,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.195535584,
      "owned_rss_bytes": 163053568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10286153728,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.424821542,
      "owned_rss_bytes": 218988544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10241654784,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.651345709,
      "owned_rss_bytes": 274644992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10185506816,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.88015962499998,
      "owned_rss_bytes": 167837696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10467459072,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.109112959,
      "owned_rss_bytes": 220020736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10436100096,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.33743725,
      "owned_rss_bytes": 157597696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10484875264,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.56223337499998,
      "owned_rss_bytes": 214073344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10440540160,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.791329709,
      "owned_rss_bytes": 159186944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10485383168,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.019402125,
      "owned_rss_bytes": 216383488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10440687616,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.24842145899999,
      "owned_rss_bytes": 150863872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10485596160,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.47709195899998,
      "owned_rss_bytes": 209862656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10437378048,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.70118112499998,
      "owned_rss_bytes": 267960320,
      "owned_process_count": 4,
      "reclaimable_bytes": 10385440768,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.93088095899998,
      "owned_rss_bytes": 178470912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10468835328,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.15914387499998,
      "owned_rss_bytes": 232931328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10421649408,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.38493183399999,
      "owned_rss_bytes": 103809024,
      "owned_process_count": 4,
      "reclaimable_bytes": 10494607360,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.610979125,
      "owned_rss_bytes": 198328320,
      "owned_process_count": 4,
      "reclaimable_bytes": 10454188032,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.839326167,
      "owned_rss_bytes": 251428864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10402414592,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.066526459,
      "owned_rss_bytes": 166625280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10478206976,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.295195917,
      "owned_rss_bytes": 221396992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10435543040,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.524193417,
      "owned_rss_bytes": 171524096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10478534656,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.75357187499998,
      "owned_rss_bytes": 225935360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10446520320,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.98228320899997,
      "owned_rss_bytes": 287735808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10388062208,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.210954959,
      "owned_rss_bytes": 86540288,
      "owned_process_count": 3,
      "reclaimable_bytes": 10518151168,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.43799991699998,
      "owned_rss_bytes": 86753280,
      "owned_process_count": 3,
      "reclaimable_bytes": 10430103552,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.666049709,
      "owned_rss_bytes": 103923712,
      "owned_process_count": 3,
      "reclaimable_bytes": 10424074240,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.889035875,
      "owned_rss_bytes": 176979968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10396844032,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.117380417,
      "owned_rss_bytes": 230703104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10352689152,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.347935125,
      "owned_rss_bytes": 286015488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10380558336,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.57587783399998,
      "owned_rss_bytes": 332414976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10408329216,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.802133417,
      "owned_rss_bytes": 164642816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10655563776,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.030786667,
      "owned_rss_bytes": 219709440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10635657216,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.25928333399997,
      "owned_rss_bytes": 270286848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10601512960,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.48825383399998,
      "owned_rss_bytes": 174997504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10691788800,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.71659879199998,
      "owned_rss_bytes": 225214464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10458021888,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.941841459,
      "owned_rss_bytes": 277364736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10405150720,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.1723835,
      "owned_rss_bytes": 164478976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10409410560,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.400260875,
      "owned_rss_bytes": 220086272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10162061312,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.62995812499997,
      "owned_rss_bytes": 276316160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10218405888,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.85660837499998,
      "owned_rss_bytes": 177143808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10310189056,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.084680459,
      "owned_rss_bytes": 232325120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10260103168,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.31344016699998,
      "owned_rss_bytes": 287260672,
      "owned_process_count": 4,
      "reclaimable_bytes": 10204839936,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.5424175,
      "owned_rss_bytes": 187744256,
      "owned_process_count": 4,
      "reclaimable_bytes": 10293035008,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.768056917,
      "owned_rss_bytes": 241008640,
      "owned_process_count": 4,
      "reclaimable_bytes": 10242719744,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.99608991699998,
      "owned_rss_bytes": 110280704,
      "owned_process_count": 4,
      "reclaimable_bytes": 10325835776,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.225579459,
      "owned_rss_bytes": 194887680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10275504128,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.451150875,
      "owned_rss_bytes": 244219904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10228056064,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.67841762499998,
      "owned_rss_bytes": 133300224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10316185600,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.906103584,
      "owned_rss_bytes": 202571776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10271064064,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.134031459,
      "owned_rss_bytes": 255901696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10388078592,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.36300312499998,
      "owned_rss_bytes": 150683648,
      "owned_process_count": 4,
      "reclaimable_bytes": 10551492608,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.59049987499998,
      "owned_rss_bytes": 208912384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10515955712,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.818543834,
      "owned_rss_bytes": 265273344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10472456192,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.046944417,
      "owned_rss_bytes": 324157440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10603659264,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.271383209,
      "owned_rss_bytes": 197623808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10646175744,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.500547292,
      "owned_rss_bytes": 253231104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10592583680,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.729166,
      "owned_rss_bytes": 158793728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10695475200,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.953075125,
      "owned_rss_bytes": 215465984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10658807808,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.18102787499998,
      "owned_rss_bytes": 270548992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10608607232,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.40923487499998,
      "owned_rss_bytes": 178667520,
      "owned_process_count": 4,
      "reclaimable_bytes": 10690117632,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.63605941699998,
      "owned_rss_bytes": 234913792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10642243584,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.86491512499998,
      "owned_rss_bytes": 292077568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10583916544,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.092993292,
      "owned_rss_bytes": 188841984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10765565952,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.32036491699998,
      "owned_rss_bytes": 243859456,
      "owned_process_count": 4,
      "reclaimable_bytes": 10723377152,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.54815158399998,
      "owned_rss_bytes": 125452288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10809049088,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.776163917,
      "owned_rss_bytes": 203964416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10769760256,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.00308041699998,
      "owned_rss_bytes": 258670592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10715987968,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.231038292,
      "owned_rss_bytes": 164167680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10805821440,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.458332459,
      "owned_rss_bytes": 221642752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10756866048,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.68590312499998,
      "owned_rss_bytes": 280035328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10699358208,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.913051084,
      "owned_rss_bytes": 176832512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10794483712,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.13644845899998,
      "owned_rss_bytes": 231636992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10778640384,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.36490579199997,
      "owned_rss_bytes": 287195136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10726440960,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.588750834,
      "owned_rss_bytes": 192266240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10818027520,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.816755084,
      "owned_rss_bytes": 249004032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10768646144,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.044290292,
      "owned_rss_bytes": 313196544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10716266496,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.27124841699998,
      "owned_rss_bytes": 192348160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10814898176,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.493648834,
      "owned_rss_bytes": 247463936,
      "owned_process_count": 4,
      "reclaimable_bytes": 10771611648,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.71812724999998,
      "owned_rss_bytes": 140312576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10849239040,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.94575362499998,
      "owned_rss_bytes": 207749120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10806509568,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.17302375,
      "owned_rss_bytes": 196722688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10816208896,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.39749229199998,
      "owned_rss_bytes": 252526592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10764599296,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.625175375,
      "owned_rss_bytes": 142229504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10866720768,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.85255437499998,
      "owned_rss_bytes": 207175680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10824466432,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.07624525,
      "owned_rss_bytes": 260456448,
      "owned_process_count": 4,
      "reclaimable_bytes": 10772021248,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.30410775,
      "owned_rss_bytes": 168542208,
      "owned_process_count": 4,
      "reclaimable_bytes": 10858151936,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.53279708399998,
      "owned_rss_bytes": 220020736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10700111872,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.760730417,
      "owned_rss_bytes": 272482304,
      "owned_process_count": 4,
      "reclaimable_bytes": 10652336128,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.98468095899997,
      "owned_rss_bytes": 172752896,
      "owned_process_count": 4,
      "reclaimable_bytes": 10620600320,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.216954709,
      "owned_rss_bytes": 224542720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10546610176,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.445148542,
      "owned_rss_bytes": 282787840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10494525440,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.67211658399998,
      "owned_rss_bytes": 161382400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10600644608,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.89784816699998,
      "owned_rss_bytes": 212631552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10495688704,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.127019542,
      "owned_rss_bytes": 258457600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10915233792,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.35495104199998,
      "owned_rss_bytes": 313245696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10817503232,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.582761584,
      "owned_rss_bytes": 367706112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10711203840,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.812303875,
      "owned_rss_bytes": 165904384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10823024640,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.038532334,
      "owned_rss_bytes": 203849728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10678452224,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.268241709,
      "owned_rss_bytes": 220938240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10621943808,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.49874433399998,
      "owned_rss_bytes": 96452608,
      "owned_process_count": 3,
      "reclaimable_bytes": 10680631296,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.72686420899998,
      "owned_rss_bytes": 199933952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10635902976,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.956292292,
      "owned_rss_bytes": 252329984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10583982080,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.185665667,
      "owned_rss_bytes": 172474368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10643488768,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.412970334,
      "owned_rss_bytes": 272121856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10584915968,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.637809375,
      "owned_rss_bytes": 325222400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10556194816,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.86654912499998,
      "owned_rss_bytes": 367509504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10530226176,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.091928167,
      "owned_rss_bytes": 268697600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10602987520,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.31869458399999,
      "owned_rss_bytes": 289013760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10582360064,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.547702792,
      "owned_rss_bytes": 336003072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10586669056,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.775327667,
      "owned_rss_bytes": 344965120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10580180992,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.003152667,
      "owned_rss_bytes": 350322688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10559569920,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.230839334,
      "owned_rss_bytes": 362037248,
      "owned_process_count": 4,
      "reclaimable_bytes": 10550591488,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.45771724999997,
      "owned_rss_bytes": 367427584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10630692864,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.683762667,
      "owned_rss_bytes": 380354560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10623172608,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.910218959,
      "owned_rss_bytes": 381616128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10582425600,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.13505874999998,
      "owned_rss_bytes": 518569984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10365992960,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.36491825,
      "owned_rss_bytes": 125485056,
      "owned_process_count": 3,
      "reclaimable_bytes": 10617110528,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.59388925,
      "owned_rss_bytes": 272809984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10553327616,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.820590375,
      "owned_rss_bytes": 327467008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10527277056,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.04454991699998,
      "owned_rss_bytes": 343244800,
      "owned_process_count": 4,
      "reclaimable_bytes": 10508959744,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.273763667,
      "owned_rss_bytes": 359874560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10495803392,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.50203704199998,
      "owned_rss_bytes": 362692608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10495361024,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.727023167,
      "owned_rss_bytes": 365936640,
      "owned_process_count": 4,
      "reclaimable_bytes": 10319577088,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.95209574999998,
      "owned_rss_bytes": 372686848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10317398016,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.18108387499998,
      "owned_rss_bytes": 209649664,
      "owned_process_count": 4,
      "reclaimable_bytes": 10418012160,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.409145334,
      "owned_rss_bytes": 242532352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10401480704,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.637323125,
      "owned_rss_bytes": 251543552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10551721984,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.865077292,
      "owned_rss_bytes": 274186240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10554441728,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.0934575,
      "owned_rss_bytes": 233799680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10580066304,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.32061258399997,
      "owned_rss_bytes": 260177920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10355998720,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.551252167,
      "owned_rss_bytes": 270778368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10349297664,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.77943358399997,
      "owned_rss_bytes": 280084480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10339254272,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.008227417,
      "owned_rss_bytes": 286736384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10316578816,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.241144792,
      "owned_rss_bytes": 320847872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10292592640,
      "swapins": 44112355,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.46938791699998,
      "owned_rss_bytes": 327155712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10465509376,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.69458104199998,
      "owned_rss_bytes": 335872000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10457858048,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.91827437499998,
      "owned_rss_bytes": 336887808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10442326016,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.14722866699998,
      "owned_rss_bytes": 127500288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10560274432,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.375816792,
      "owned_rss_bytes": 204259328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10916364288,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.60514583399998,
      "owned_rss_bytes": 292978688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10858938368,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.832277292,
      "owned_rss_bytes": 271302656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10837245952,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.06338995899998,
      "owned_rss_bytes": 351764480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10752851968,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.293652792,
      "owned_rss_bytes": 368623616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10726965248,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.522507167,
      "owned_rss_bytes": 408436736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10359963648,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.75802241699998,
      "owned_rss_bytes": 427343872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10308648960,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.985274584,
      "owned_rss_bytes": 433455104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10315382784,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.211417959,
      "owned_rss_bytes": 445448192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10301882368,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.437086459,
      "owned_rss_bytes": 468418560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10277683200,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.66369154199998,
      "owned_rss_bytes": 416251904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10344529920,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.88747379199998,
      "owned_rss_bytes": 445693952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10789175296,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.11560383399998,
      "owned_rss_bytes": 477003776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10779295744,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.34551862499998,
      "owned_rss_bytes": 509263872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10758717440,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.568222709,
      "owned_rss_bytes": 283115520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11020910592,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.796285792,
      "owned_rss_bytes": 314048512,
      "owned_process_count": 4,
      "reclaimable_bytes": 11004542976,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.02410454199998,
      "owned_rss_bytes": 340393984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10791960576,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.251359209,
      "owned_rss_bytes": 351289344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10768105472,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.48036416699998,
      "owned_rss_bytes": 400932864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10724769792,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.70764337499998,
      "owned_rss_bytes": 410386432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10640015360,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.936595125,
      "owned_rss_bytes": 421199872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10630430720,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.16585154199998,
      "owned_rss_bytes": 425017344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10627465216,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.3900505,
      "owned_rss_bytes": 440385536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10608492544,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.6171545,
      "owned_rss_bytes": 442138624,
      "owned_process_count": 4,
      "reclaimable_bytes": 10570809344,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.847266542,
      "owned_rss_bytes": 448102400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9629827072,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.082029084,
      "owned_rss_bytes": 455131136,
      "owned_process_count": 4,
      "reclaimable_bytes": 9386704896,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.31238570899998,
      "owned_rss_bytes": 471875584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9231171584,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.545390084,
      "owned_rss_bytes": 496861184,
      "owned_process_count": 4,
      "reclaimable_bytes": 9226551296,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.77585108399998,
      "owned_rss_bytes": 304119808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9385082880,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.00811679199998,
      "owned_rss_bytes": 322011136,
      "owned_process_count": 4,
      "reclaimable_bytes": 9209708544,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.25222333399998,
      "owned_rss_bytes": 326107136,
      "owned_process_count": 4,
      "reclaimable_bytes": 9142091776,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.48287441699998,
      "owned_rss_bytes": 330088448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9143959552,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.7136655,
      "owned_rss_bytes": 335233024,
      "owned_process_count": 4,
      "reclaimable_bytes": 9147252736,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.94359333399998,
      "owned_rss_bytes": 339132416,
      "owned_process_count": 4,
      "reclaimable_bytes": 9133883392,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.17356049999998,
      "owned_rss_bytes": 343932928,
      "owned_process_count": 4,
      "reclaimable_bytes": 9079521280,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.408097334,
      "owned_rss_bytes": 348766208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9051619328,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.63900562499998,
      "owned_rss_bytes": 352747520,
      "owned_process_count": 4,
      "reclaimable_bytes": 9029681152,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.868095375,
      "owned_rss_bytes": 357744640,
      "owned_process_count": 4,
      "reclaimable_bytes": 8695185408,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.09869395899997,
      "owned_rss_bytes": 361971712,
      "owned_process_count": 4,
      "reclaimable_bytes": 8765734912,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.33071866699999,
      "owned_rss_bytes": 366280704,
      "owned_process_count": 4,
      "reclaimable_bytes": 8755412992,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.559220709,
      "owned_rss_bytes": 361086976,
      "owned_process_count": 4,
      "reclaimable_bytes": 8677883904,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.792124584,
      "owned_rss_bytes": 365133824,
      "owned_process_count": 4,
      "reclaimable_bytes": 8684994560,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.02655074999998,
      "owned_rss_bytes": 369508352,
      "owned_process_count": 4,
      "reclaimable_bytes": 8700887040,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.256557209,
      "owned_rss_bytes": 374407168,
      "owned_process_count": 4,
      "reclaimable_bytes": 8710914048,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.492516167,
      "owned_rss_bytes": 381517824,
      "owned_process_count": 4,
      "reclaimable_bytes": 8702476288,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.723831,
      "owned_rss_bytes": 384909312,
      "owned_process_count": 4,
      "reclaimable_bytes": 8857108480,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.95813570899998,
      "owned_rss_bytes": 392724480,
      "owned_process_count": 4,
      "reclaimable_bytes": 8866463744,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.19281370899998,
      "owned_rss_bytes": 397148160,
      "owned_process_count": 4,
      "reclaimable_bytes": 8862842880,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.425181792,
      "owned_rss_bytes": 399605760,
      "owned_process_count": 4,
      "reclaimable_bytes": 8838791168,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.658550167,
      "owned_rss_bytes": 399851520,
      "owned_process_count": 4,
      "reclaimable_bytes": 8837283840,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.890004834,
      "owned_rss_bytes": 400015360,
      "owned_process_count": 4,
      "reclaimable_bytes": 8831500288,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.11701216699998,
      "owned_rss_bytes": 400015360,
      "owned_process_count": 4,
      "reclaimable_bytes": 8829550592,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.348537459,
      "owned_rss_bytes": 408387584,
      "owned_process_count": 4,
      "reclaimable_bytes": 8789852160,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.577181084,
      "owned_rss_bytes": 443596800,
      "owned_process_count": 4,
      "reclaimable_bytes": 8740126720,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.810770417,
      "owned_rss_bytes": 444104704,
      "owned_process_count": 4,
      "reclaimable_bytes": 8763539456,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.042144042,
      "owned_rss_bytes": 469647360,
      "owned_process_count": 4,
      "reclaimable_bytes": 8746369024,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.27324937499998,
      "owned_rss_bytes": 474660864,
      "owned_process_count": 4,
      "reclaimable_bytes": 8736047104,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.507642042,
      "owned_rss_bytes": 479559680,
      "owned_process_count": 4,
      "reclaimable_bytes": 8733065216,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.739335625,
      "owned_rss_bytes": 481198080,
      "owned_process_count": 4,
      "reclaimable_bytes": 8737439744,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.966500167,
      "owned_rss_bytes": 482050048,
      "owned_process_count": 4,
      "reclaimable_bytes": 8752709632,
      "swapins": 44112359,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.196751625,
      "owned_rss_bytes": 482656256,
      "owned_process_count": 4,
      "reclaimable_bytes": 8741306368,
      "swapins": 44112363,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.432031417,
      "owned_rss_bytes": 483721216,
      "owned_process_count": 4,
      "reclaimable_bytes": 8734916608,
      "swapins": 44112363,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.66589549999998,
      "owned_rss_bytes": 500088832,
      "owned_process_count": 4,
      "reclaimable_bytes": 8772927488,
      "swapins": 44112363,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.898833834,
      "owned_rss_bytes": 501694464,
      "owned_process_count": 4,
      "reclaimable_bytes": 8765145088,
      "swapins": 44112363,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.134248209,
      "owned_rss_bytes": 135970816,
      "owned_process_count": 4,
      "reclaimable_bytes": 8981610496,
      "swapins": 44112363,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.36709470899999,
      "owned_rss_bytes": 311263232,
      "owned_process_count": 4,
      "reclaimable_bytes": 8923971584,
      "swapins": 44112363,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.6011125,
      "owned_rss_bytes": 331137024,
      "owned_process_count": 4,
      "reclaimable_bytes": 8906883072,
      "swapins": 44112363,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.83031316699999,
      "owned_rss_bytes": 344932352,
      "owned_process_count": 4,
      "reclaimable_bytes": 8744189952,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.06318825,
      "owned_rss_bytes": 358350848,
      "owned_process_count": 4,
      "reclaimable_bytes": 8729477120,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.29250804199998,
      "owned_rss_bytes": 370032640,
      "owned_process_count": 4,
      "reclaimable_bytes": 8721891328,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.52550879199998,
      "owned_rss_bytes": 397688832,
      "owned_process_count": 4,
      "reclaimable_bytes": 8724365312,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.75887179199998,
      "owned_rss_bytes": 426524672,
      "owned_process_count": 4,
      "reclaimable_bytes": 8729477120,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.989353334,
      "owned_rss_bytes": 441647104,
      "owned_process_count": 4,
      "reclaimable_bytes": 8945713152,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.22094662499998,
      "owned_rss_bytes": 457113600,
      "owned_process_count": 4,
      "reclaimable_bytes": 9021407232,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.450495,
      "owned_rss_bytes": 457474048,
      "owned_process_count": 4,
      "reclaimable_bytes": 9024323584,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.68275079199998,
      "owned_rss_bytes": 458768384,
      "owned_process_count": 4,
      "reclaimable_bytes": 9025077248,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.913780334,
      "owned_rss_bytes": 459849728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9047293952,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.14908075,
      "owned_rss_bytes": 465076224,
      "owned_process_count": 4,
      "reclaimable_bytes": 9001025536,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.38114133399998,
      "owned_rss_bytes": 474038272,
      "owned_process_count": 4,
      "reclaimable_bytes": 8999174144,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.611336459,
      "owned_rss_bytes": 478347264,
      "owned_process_count": 4,
      "reclaimable_bytes": 8992292864,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.84254712499998,
      "owned_rss_bytes": 478937088,
      "owned_process_count": 4,
      "reclaimable_bytes": 8987656192,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.07384804199998,
      "owned_rss_bytes": 482836480,
      "owned_process_count": 4,
      "reclaimable_bytes": 8988114944,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.301725875,
      "owned_rss_bytes": 502824960,
      "owned_process_count": 4,
      "reclaimable_bytes": 8962785280,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.534022459,
      "owned_rss_bytes": 540704768,
      "owned_process_count": 4,
      "reclaimable_bytes": 8942043136,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.76438762499998,
      "owned_rss_bytes": 172752896,
      "owned_process_count": 4,
      "reclaimable_bytes": 9186279424,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.991532542,
      "owned_rss_bytes": 192741376,
      "owned_process_count": 4,
      "reclaimable_bytes": 9158000640,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.22163512499998,
      "owned_rss_bytes": 283918336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9129148416,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.450608,
      "owned_rss_bytes": 291684352,
      "owned_process_count": 4,
      "reclaimable_bytes": 9107947520,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.68456429199998,
      "owned_rss_bytes": 305709056,
      "owned_process_count": 4,
      "reclaimable_bytes": 9074130944,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.91616520899998,
      "owned_rss_bytes": 329482240,
      "owned_process_count": 4,
      "reclaimable_bytes": 9062203392,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.1490245,
      "owned_rss_bytes": 348946432,
      "owned_process_count": 4,
      "reclaimable_bytes": 9029173248,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.382353209,
      "owned_rss_bytes": 368148480,
      "owned_process_count": 4,
      "reclaimable_bytes": 9017589760,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.61531441699998,
      "owned_rss_bytes": 375619584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9011085312,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.847591334,
      "owned_rss_bytes": 388399104,
      "owned_process_count": 4,
      "reclaimable_bytes": 9002450944,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.08177270899998,
      "owned_rss_bytes": 420872192,
      "owned_process_count": 4,
      "reclaimable_bytes": 8997552128,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.31532208399997,
      "owned_rss_bytes": 427769856,
      "owned_process_count": 4,
      "reclaimable_bytes": 9075245056,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.54749675,
      "owned_rss_bytes": 432734208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9073999872,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.77934091699998,
      "owned_rss_bytes": 451854336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9062105088,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.011674584,
      "owned_rss_bytes": 473595904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9040920576,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.239859334,
      "owned_rss_bytes": 475054080,
      "owned_process_count": 4,
      "reclaimable_bytes": 9053601792,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.47183837499998,
      "owned_rss_bytes": 476446720,
      "owned_process_count": 4,
      "reclaimable_bytes": 9055830016,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.70277729199998,
      "owned_rss_bytes": 232423424,
      "owned_process_count": 4,
      "reclaimable_bytes": 9218195456,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.93495083399998,
      "owned_rss_bytes": 302694400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9190998016,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.168219709,
      "owned_rss_bytes": 315539456,
      "owned_process_count": 4,
      "reclaimable_bytes": 9183969280,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.40146604199998,
      "owned_rss_bytes": 318750720,
      "owned_process_count": 4,
      "reclaimable_bytes": 9179119616,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.634510042,
      "owned_rss_bytes": 323469312,
      "owned_process_count": 4,
      "reclaimable_bytes": 9178284032,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.865119417,
      "owned_rss_bytes": 333512704,
      "owned_process_count": 4,
      "reclaimable_bytes": 9174384640,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.09963374999998,
      "owned_rss_bytes": 335888384,
      "owned_process_count": 4,
      "reclaimable_bytes": 9168371712,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.33246591699998,
      "owned_rss_bytes": 343425024,
      "owned_process_count": 4,
      "reclaimable_bytes": 9153265664,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.56590129199998,
      "owned_rss_bytes": 350732288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9143762944,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.79808312499998,
      "owned_rss_bytes": 354664448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9147269120,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.03096037499998,
      "owned_rss_bytes": 378208256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9477373952,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.267278875,
      "owned_rss_bytes": 400490496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9466789888,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.50047024999998,
      "owned_rss_bytes": 403767296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9465577472,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.733438792,
      "owned_rss_bytes": 412336128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9452896256,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.965543667,
      "owned_rss_bytes": 417808384,
      "owned_process_count": 4,
      "reclaimable_bytes": 9469771776,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.19830770899998,
      "owned_rss_bytes": 424017920,
      "owned_process_count": 4,
      "reclaimable_bytes": 9478193152,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.426866709,
      "owned_rss_bytes": 427180032,
      "owned_process_count": 4,
      "reclaimable_bytes": 9474588672,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.657809209,
      "owned_rss_bytes": 433733632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9452584960,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.89018704199998,
      "owned_rss_bytes": 441696256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9448833024,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.121685709,
      "owned_rss_bytes": 288866304,
      "owned_process_count": 4,
      "reclaimable_bytes": 9557164032,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.35404899999997,
      "owned_rss_bytes": 320323584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9538371584,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.585341417,
      "owned_rss_bytes": 332103680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10868719616,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.81639925,
      "owned_rss_bytes": 340033536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10864394240,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 248.04460170899998,
      "owned_rss_bytes": 340459520,
      "owned_process_count": 4,
      "reclaimable_bytes": 10863771648,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 248.272647125,
      "owned_rss_bytes": 348766208,
      "owned_process_count": 4,
      "reclaimable_bytes": 10844356608,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 248.501467292,
      "owned_rss_bytes": 403636224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10814963712,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 248.731102417,
      "owned_rss_bytes": 414482432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10802954240,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 248.959198542,
      "owned_rss_bytes": 421396480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10826006528,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 249.18488187499997,
      "owned_rss_bytes": 419758080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10823335936,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 249.40878708399998,
      "owned_rss_bytes": 428834816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10817748992,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 249.634860084,
      "owned_rss_bytes": 442974208,
      "owned_process_count": 4,
      "reclaimable_bytes": 10775855104,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 249.859203584,
      "owned_rss_bytes": 169082880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10823073792,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 250.084912625,
      "owned_rss_bytes": 125878272,
      "owned_process_count": 3,
      "reclaimable_bytes": 10846224384,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 250.309288584,
      "owned_rss_bytes": 554123264,
      "owned_process_count": 5,
      "reclaimable_bytes": 10558685184,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 250.540214542,
      "owned_rss_bytes": 268500992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10817224704,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 250.76931308399998,
      "owned_rss_bytes": 415694848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10720296960,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 250.99637424999997,
      "owned_rss_bytes": 537444352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10625679360,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 251.2253815,
      "owned_rss_bytes": 724566016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10460741632,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 251.45084641699998,
      "owned_rss_bytes": 817364992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10401660928,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 251.681220959,
      "owned_rss_bytes": 856719360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10362830848,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 251.90920483399998,
      "owned_rss_bytes": 779321344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10442932224,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 252.13352475,
      "owned_rss_bytes": 840007680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10367795200,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 252.357244125,
      "owned_rss_bytes": 1982464,
      "owned_process_count": 2,
      "reclaimable_bytes": 10889576448,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 252.58652537499998,
      "owned_rss_bytes": 1982464,
      "owned_process_count": 2,
      "reclaimable_bytes": 10888757248,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 252.824741875,
      "owned_rss_bytes": 1982464,
      "owned_process_count": 2,
      "reclaimable_bytes": 10877304832,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 253.053085042,
      "owned_rss_bytes": 4734976,
      "owned_process_count": 2,
      "reclaimable_bytes": 10973691904,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 253.277258209,
      "owned_rss_bytes": 146702336,
      "owned_process_count": 2,
      "reclaimable_bytes": 12400803840,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 253.860329292,
      "owned_rss_bytes": 128663552,
      "owned_process_count": 2,
      "reclaimable_bytes": 14346108928,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 254.40896658399998,
      "owned_rss_bytes": 128204800,
      "owned_process_count": 2,
      "reclaimable_bytes": 15270182912,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 254.8242805,
      "owned_rss_bytes": 128204800,
      "owned_process_count": 2,
      "reclaimable_bytes": 16610443264,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 255.281851709,
      "owned_rss_bytes": 126500864,
      "owned_process_count": 2,
      "reclaimable_bytes": 17128046592,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 255.56934912499997,
      "owned_rss_bytes": 130105344,
      "owned_process_count": 2,
      "reclaimable_bytes": 17115201536,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 255.81731366699998,
      "owned_rss_bytes": 130105344,
      "owned_process_count": 2,
      "reclaimable_bytes": 17060904960,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 256.065640917,
      "owned_rss_bytes": 130105344,
      "owned_process_count": 2,
      "reclaimable_bytes": 17052368896,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 256.31686829200004,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17041424384,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 256.559247625,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17051009024,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 256.80099725,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17037197312,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 257.042528417,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17040900096,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 257.283663917,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17141972992,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 257.52885504200003,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17043292160,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 257.768687375,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17028415488,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 258.011112959,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17016848384,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 258.28429566700004,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17009360896,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 258.531633834,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 16991666176,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 258.808089084,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 16986374144,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 259.0532955,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 16986177536,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 259.297134125,
      "owned_rss_bytes": 130170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 16964943872,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 259.538958459,
      "owned_rss_bytes": 130154496,
      "owned_process_count": 2,
      "reclaimable_bytes": 16961437696,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 259.78411262500003,
      "owned_rss_bytes": 130154496,
      "owned_process_count": 2,
      "reclaimable_bytes": 16982065152,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 260.0304415,
      "owned_rss_bytes": 130154496,
      "owned_process_count": 2,
      "reclaimable_bytes": 16973463552,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 260.288937667,
      "owned_rss_bytes": 130154496,
      "owned_process_count": 2,
      "reclaimable_bytes": 16956604416,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 260.531113375,
      "owned_rss_bytes": 130154496,
      "owned_process_count": 2,
      "reclaimable_bytes": 16956440576,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 260.770811917,
      "owned_rss_bytes": 130121728,
      "owned_process_count": 2,
      "reclaimable_bytes": 16956915712,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 261.018118625,
      "owned_rss_bytes": 130121728,
      "owned_process_count": 2,
      "reclaimable_bytes": 16961388544,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 261.27108708400004,
      "owned_rss_bytes": 130088960,
      "owned_process_count": 2,
      "reclaimable_bytes": 16953999360,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 261.5258935,
      "owned_rss_bytes": 130088960,
      "owned_process_count": 2,
      "reclaimable_bytes": 16965533696,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 261.77120825000003,
      "owned_rss_bytes": 130105344,
      "owned_process_count": 2,
      "reclaimable_bytes": 16969302016,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 262.016554084,
      "owned_rss_bytes": 135331840,
      "owned_process_count": 2,
      "reclaimable_bytes": 17081270272,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 262.246998125,
      "owned_rss_bytes": 3440640,
      "owned_process_count": 2,
      "reclaimable_bytes": 16913612800,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 262.479206334,
      "owned_rss_bytes": 3473408,
      "owned_process_count": 2,
      "reclaimable_bytes": 16904126464,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 262.70877208400003,
      "owned_rss_bytes": 3489792,
      "owned_process_count": 2,
      "reclaimable_bytes": 16901423104,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 262.93795625,
      "owned_rss_bytes": 3604480,
      "owned_process_count": 2,
      "reclaimable_bytes": 16885301248,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 263.167725542,
      "owned_rss_bytes": 3604480,
      "owned_process_count": 2,
      "reclaimable_bytes": 16874668032,
      "swapins": 44112375,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 263.39699933400004,
      "owned_rss_bytes": 3719168,
      "owned_process_count": 2,
      "reclaimable_bytes": 16856432640,
      "swapins": 44112375,
      "swapouts": 77525566
    }
  ],
  "passed": true,
  "classification": "Real external-consumer source compatibility on proposed combined defaults plus current context device-observer seam. No model execution, final binary or default activation.",
  "child_pid": 9211,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 17021009920,
    "swapins": 44112375,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     8296.\nPages active:                                 948046.\nPages inactive:                               931213.\nPages speculative:                             15320.\nPages throttled:                                   0.\nPages wired down:                             277845.\nPages purgeable:                               10238.\n\"Translation faults\":                    15415723214.\nPages copy-on-write:                       735667894.\nPages zero filled:                       21220912830.\nPages reactivated:                        3470830387.\nPages purged:                               72233485.\nFile-backed pages:                           1020346.\nAnonymous pages:                              874233.\nPages stored in compressor:                  2152382.\nPages occupied by compressor:                 904653.\nDecompressions:                           1171853509.\nCompressions:                             1487057788.\nPageins:                                  7621631865.\nPageouts:                                   11080124.\nSwapins:                                    44112375.\nSwapouts:                                   77525566.\nPages tagged:                                 178792.\nPages tagged resident:                        122785.\nPages tagged compressed:                       56007.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7940.\nPages tag-storage free:                          237.\nPages tag-storage non-tag pageable:            90119.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8798144.\nTagged compressions:                        11276732.\nTagged decompressions:                      10388817.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    9211
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 263.701620167,
  "child_exit_code": 0,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 17022435328,
    "swapins": 44112375,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     8289.\nPages active:                                 948148.\nPages inactive:                               931242.\nPages speculative:                             15379.\nPages throttled:                                   0.\nPages wired down:                             277845.\nPages purgeable:                               10238.\n\"Translation faults\":                    15415729122.\nPages copy-on-write:                       735668685.\nPages zero filled:                       21220915987.\nPages reactivated:                        3470830389.\nPages purged:                               72233485.\nFile-backed pages:                           1020440.\nAnonymous pages:                              874329.\nPages stored in compressor:                  2152313.\nPages occupied by compressor:                 904618.\nDecompressions:                           1171853593.\nCompressions:                             1487057788.\nPageins:                                  7621631930.\nPageouts:                                   11080124.\nSwapins:                                    44112375.\nSwapouts:                                   77525566.\nPages tagged:                                 178792.\nPages tagged resident:                        122785.\nPages tagged compressed:                       56007.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7940.\nPages tag-storage free:                          243.\nPages tag-storage non-tag pageable:            90113.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8798144.\nTagged compressions:                        11276732.\nTagged decompressions:                      10388817.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/memory.samples.jsonl

SHA-256 `48cebb97783fc840f3009128bef441854eb6bcbee1b68f3fad1d3758ffb66424`; 192289 bytes.

````text
{"elapsed_seconds": 0.0015608749999999894, "owned_rss_bytes": 2129920, "owned_process_count": 1, "reclaimable_bytes": 9604284416, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 0.2286605, "owned_rss_bytes": 20807680, "owned_process_count": 3, "reclaimable_bytes": 9766305792, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 0.455621875, "owned_rss_bytes": 68288512, "owned_process_count": 3, "reclaimable_bytes": 9750167552, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 0.6829775840000001, "owned_rss_bytes": 53706752, "owned_process_count": 3, "reclaimable_bytes": 9777364992, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 0.911815292, "owned_rss_bytes": 53706752, "owned_process_count": 3, "reclaimable_bytes": 9754574848, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 1.1431354169999999, "owned_rss_bytes": 55607296, "owned_process_count": 3, "reclaimable_bytes": 9774579712, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 1.370228667, "owned_rss_bytes": 55640064, "owned_process_count": 2, "reclaimable_bytes": 9769582592, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 1.601890292, "owned_rss_bytes": 101974016, "owned_process_count": 11, "reclaimable_bytes": 9774235648, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 1.832535292, "owned_rss_bytes": 102629376, "owned_process_count": 11, "reclaimable_bytes": 9809166336, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 2.068432667, "owned_rss_bytes": 102727680, "owned_process_count": 11, "reclaimable_bytes": 9807986688, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 2.307760542, "owned_rss_bytes": 103383040, "owned_process_count": 11, "reclaimable_bytes": 9807396864, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 2.536938959, "owned_rss_bytes": 104153088, "owned_process_count": 11, "reclaimable_bytes": 9811853312, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 2.7722747500000002, "owned_rss_bytes": 109395968, "owned_process_count": 11, "reclaimable_bytes": 9810296832, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 2.9959144170000003, "owned_rss_bytes": 56623104, "owned_process_count": 2, "reclaimable_bytes": 9838854144, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 3.226886084, "owned_rss_bytes": 85753856, "owned_process_count": 3, "reclaimable_bytes": 9827860480, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 3.4535532090000003, "owned_rss_bytes": 56983552, "owned_process_count": 3, "reclaimable_bytes": 9837772800, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 3.683768375, "owned_rss_bytes": 71827456, "owned_process_count": 5, "reclaimable_bytes": 9844359168, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 3.9138879589999997, "owned_rss_bytes": 72400896, "owned_process_count": 5, "reclaimable_bytes": 9841639424, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 4.149236875, "owned_rss_bytes": 72499200, "owned_process_count": 5, "reclaimable_bytes": 9843638272, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 4.39135175, "owned_rss_bytes": 72531968, "owned_process_count": 5, "reclaimable_bytes": 9843228672, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 4.633293333999999, "owned_rss_bytes": 72925184, "owned_process_count": 5, "reclaimable_bytes": 9845440512, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 4.8749915, "owned_rss_bytes": 73007104, "owned_process_count": 5, "reclaimable_bytes": 9850044416, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 5.117971208999999, "owned_rss_bytes": 59670528, "owned_process_count": 3, "reclaimable_bytes": 9853124608, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 5.3478981249999995, "owned_rss_bytes": 57212928, "owned_process_count": 3, "reclaimable_bytes": 9853288448, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 5.5750794589999995, "owned_rss_bytes": 96632832, "owned_process_count": 12, "reclaimable_bytes": 9817800704, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 5.808260042, "owned_rss_bytes": 135036928, "owned_process_count": 17, "reclaimable_bytes": 9816899584, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 6.040939874999999, "owned_rss_bytes": 135413760, "owned_process_count": 17, "reclaimable_bytes": 9816326144, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 6.275396292, "owned_rss_bytes": 135528448, "owned_process_count": 17, "reclaimable_bytes": 9812574208, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 6.5101995839999995, "owned_rss_bytes": 137003008, "owned_process_count": 17, "reclaimable_bytes": 9814065152, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 6.7529042089999995, "owned_rss_bytes": 138051584, "owned_process_count": 17, "reclaimable_bytes": 9820422144, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 6.993574874999999, "owned_rss_bytes": 102072320, "owned_process_count": 12, "reclaimable_bytes": 9840115712, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 7.2222415, "owned_rss_bytes": 59670528, "owned_process_count": 3, "reclaimable_bytes": 9856909312, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 7.4504523339999995, "owned_rss_bytes": 130711552, "owned_process_count": 5, "reclaimable_bytes": 9790341120, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 7.677275583999999, "owned_rss_bytes": 57999360, "owned_process_count": 3, "reclaimable_bytes": 9664348160, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 7.9102869590000005, "owned_rss_bytes": 60424192, "owned_process_count": 3, "reclaimable_bytes": 9661743104, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 8.137342834, "owned_rss_bytes": 58015744, "owned_process_count": 3, "reclaimable_bytes": 9668968448, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 8.365901917, "owned_rss_bytes": 58032128, "owned_process_count": 3, "reclaimable_bytes": 9668313088, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 8.594883584, "owned_rss_bytes": 72761344, "owned_process_count": 5, "reclaimable_bytes": 9657303040, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 8.822248292, "owned_rss_bytes": 73302016, "owned_process_count": 5, "reclaimable_bytes": 9659809792, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 9.051212042, "owned_rss_bytes": 73367552, "owned_process_count": 5, "reclaimable_bytes": 9660268544, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 9.285405792, "owned_rss_bytes": 73433088, "owned_process_count": 5, "reclaimable_bytes": 9661513728, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 9.525689167, "owned_rss_bytes": 73564160, "owned_process_count": 5, "reclaimable_bytes": 9661399040, "swapins": 44112315, "swapouts": 77525566}
{"elapsed_seconds": 9.766864959, "owned_rss_bytes": 73940992, "owned_process_count": 5, "reclaimable_bytes": 9661054976, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 10.009557125, "owned_rss_bytes": 57950208, "owned_process_count": 2, "reclaimable_bytes": 9667411968, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 10.244115666999999, "owned_rss_bytes": 58064896, "owned_process_count": 3, "reclaimable_bytes": 9667248128, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 10.47349375, "owned_rss_bytes": 58458112, "owned_process_count": 3, "reclaimable_bytes": 9665839104, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 10.7033125, "owned_rss_bytes": 58130432, "owned_process_count": 3, "reclaimable_bytes": 9671049216, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 10.931391249999999, "owned_rss_bytes": 97189888, "owned_process_count": 4, "reclaimable_bytes": 9648930816, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 11.159758542, "owned_rss_bytes": 58179584, "owned_process_count": 3, "reclaimable_bytes": 9835806720, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 11.392191042, "owned_rss_bytes": 162037760, "owned_process_count": 4, "reclaimable_bytes": 9806561280, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 11.619773084, "owned_rss_bytes": 58277888, "owned_process_count": 3, "reclaimable_bytes": 9663660032, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 11.85142125, "owned_rss_bytes": 150863872, "owned_process_count": 4, "reclaimable_bytes": 9635758080, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 12.079851999999999, "owned_rss_bytes": 58851328, "owned_process_count": 3, "reclaimable_bytes": 9666805760, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 12.305574542, "owned_rss_bytes": 67944448, "owned_process_count": 5, "reclaimable_bytes": 9664970752, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 12.534629875, "owned_rss_bytes": 74121216, "owned_process_count": 5, "reclaimable_bytes": 9662857216, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 12.774034084, "owned_rss_bytes": 74203136, "owned_process_count": 5, "reclaimable_bytes": 9665314816, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 13.012136625, "owned_rss_bytes": 74219520, "owned_process_count": 5, "reclaimable_bytes": 9658515456, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 13.251745625, "owned_rss_bytes": 74612736, "owned_process_count": 5, "reclaimable_bytes": 9656582144, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 13.495142208999999, "owned_rss_bytes": 74678272, "owned_process_count": 5, "reclaimable_bytes": 9822978048, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 13.732372584, "owned_rss_bytes": 98172928, "owned_process_count": 4, "reclaimable_bytes": 9831104512, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 13.958928209, "owned_rss_bytes": 58753024, "owned_process_count": 3, "reclaimable_bytes": 9668132864, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 14.186814959, "owned_rss_bytes": 60669952, "owned_process_count": 3, "reclaimable_bytes": 9667772416, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 14.414738959, "owned_rss_bytes": 64454656, "owned_process_count": 3, "reclaimable_bytes": 9668640768, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 14.643001792, "owned_rss_bytes": 74924032, "owned_process_count": 3, "reclaimable_bytes": 9655468032, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 14.871268334, "owned_rss_bytes": 85622784, "owned_process_count": 8, "reclaimable_bytes": 9655943168, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 15.100478292, "owned_rss_bytes": 86212608, "owned_process_count": 8, "reclaimable_bytes": 9658482688, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 15.331155459, "owned_rss_bytes": 86294528, "owned_process_count": 8, "reclaimable_bytes": 9642622976, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 15.558870875, "owned_rss_bytes": 86294528, "owned_process_count": 8, "reclaimable_bytes": 9644834816, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 15.786743167, "owned_rss_bytes": 86654976, "owned_process_count": 8, "reclaimable_bytes": 9645359104, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 16.011021584, "owned_rss_bytes": 87539712, "owned_process_count": 8, "reclaimable_bytes": 9627680768, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 16.239981167, "owned_rss_bytes": 91799552, "owned_process_count": 9, "reclaimable_bytes": 9794224128, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 16.464822042, "owned_rss_bytes": 91799552, "owned_process_count": 9, "reclaimable_bytes": 9764356096, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 16.697508959, "owned_rss_bytes": 92897280, "owned_process_count": 9, "reclaimable_bytes": 9675997184, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 16.926503917, "owned_rss_bytes": 93519872, "owned_process_count": 9, "reclaimable_bytes": 9673736192, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 17.151148292000002, "owned_rss_bytes": 95469568, "owned_process_count": 9, "reclaimable_bytes": 9475850240, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 17.380578209000003, "owned_rss_bytes": 96174080, "owned_process_count": 9, "reclaimable_bytes": 9478127616, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 17.609856584000003, "owned_rss_bytes": 96567296, "owned_process_count": 9, "reclaimable_bytes": 9479897088, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 17.838832084, "owned_rss_bytes": 97583104, "owned_process_count": 9, "reclaimable_bytes": 9484648448, "swapins": 44112319, "swapouts": 77525566}
{"elapsed_seconds": 18.068100292, "owned_rss_bytes": 98713600, "owned_process_count": 9, "reclaimable_bytes": 9486123008, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 18.294752084000002, "owned_rss_bytes": 98893824, "owned_process_count": 9, "reclaimable_bytes": 9490104320, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 18.523376375, "owned_rss_bytes": 99057664, "owned_process_count": 9, "reclaimable_bytes": 9514565632, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 18.752455917000002, "owned_rss_bytes": 99221504, "owned_process_count": 9, "reclaimable_bytes": 9517940736, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 18.980556209000003, "owned_rss_bytes": 99385344, "owned_process_count": 9, "reclaimable_bytes": 9194962944, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 19.212513625000003, "owned_rss_bytes": 99794944, "owned_process_count": 9, "reclaimable_bytes": 9195421696, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 19.443754042000002, "owned_rss_bytes": 100712448, "owned_process_count": 9, "reclaimable_bytes": 9182117888, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 19.672146, "owned_rss_bytes": 100794368, "owned_process_count": 9, "reclaimable_bytes": 9169027072, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 19.901879667000003, "owned_rss_bytes": 101105664, "owned_process_count": 9, "reclaimable_bytes": 9171075072, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 20.131087, "owned_rss_bytes": 101056512, "owned_process_count": 9, "reclaimable_bytes": 9416097792, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 20.355576625, "owned_rss_bytes": 101138432, "owned_process_count": 9, "reclaimable_bytes": 9417654272, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 20.584525042000003, "owned_rss_bytes": 101269504, "owned_process_count": 9, "reclaimable_bytes": 9500622848, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 20.815367917000003, "owned_rss_bytes": 101498880, "owned_process_count": 9, "reclaimable_bytes": 9590816768, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 21.053430584, "owned_rss_bytes": 101679104, "owned_process_count": 9, "reclaimable_bytes": 9654517760, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 21.280580750000002, "owned_rss_bytes": 101793792, "owned_process_count": 9, "reclaimable_bytes": 9684500480, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 21.512432709000002, "owned_rss_bytes": 103006208, "owned_process_count": 9, "reclaimable_bytes": 9768534016, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 21.745048459000003, "owned_rss_bytes": 103104512, "owned_process_count": 9, "reclaimable_bytes": 9885237248, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 21.98371075, "owned_rss_bytes": 103235584, "owned_process_count": 9, "reclaimable_bytes": 10057105408, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 22.228554792, "owned_rss_bytes": 103481344, "owned_process_count": 9, "reclaimable_bytes": 10070474752, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 22.467717959, "owned_rss_bytes": 103710720, "owned_process_count": 9, "reclaimable_bytes": 9896574976, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 22.710520125000002, "owned_rss_bytes": 108019712, "owned_process_count": 9, "reclaimable_bytes": 9894952960, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 22.942090584000002, "owned_rss_bytes": 108019712, "owned_process_count": 9, "reclaimable_bytes": 9889808384, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 23.184369, "owned_rss_bytes": 108249088, "owned_process_count": 9, "reclaimable_bytes": 9891725312, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 23.422239875000002, "owned_rss_bytes": 109051904, "owned_process_count": 9, "reclaimable_bytes": 9893298176, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 23.655570875000002, "owned_rss_bytes": 119881728, "owned_process_count": 9, "reclaimable_bytes": 9876193280, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 23.883205750000002, "owned_rss_bytes": 124321792, "owned_process_count": 9, "reclaimable_bytes": 9874030592, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 24.112583, "owned_rss_bytes": 134643712, "owned_process_count": 9, "reclaimable_bytes": 10030645248, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 24.344485584, "owned_rss_bytes": 85393408, "owned_process_count": 8, "reclaimable_bytes": 10081402880, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 24.572830084000003, "owned_rss_bytes": 85983232, "owned_process_count": 8, "reclaimable_bytes": 10096427008, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 24.820178084000002, "owned_rss_bytes": 86081536, "owned_process_count": 8, "reclaimable_bytes": 10101456896, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 25.068567959000003, "owned_rss_bytes": 86130688, "owned_process_count": 8, "reclaimable_bytes": 10095525888, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 25.309462500000002, "owned_rss_bytes": 86245376, "owned_process_count": 8, "reclaimable_bytes": 10096328704, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 25.5413485, "owned_rss_bytes": 86507520, "owned_process_count": 8, "reclaimable_bytes": 10094575616, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 25.791285042000002, "owned_rss_bytes": 87293952, "owned_process_count": 8, "reclaimable_bytes": 10090528768, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 26.038788, "owned_rss_bytes": 91586560, "owned_process_count": 9, "reclaimable_bytes": 10096050176, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 26.284726959, "owned_rss_bytes": 93126656, "owned_process_count": 9, "reclaimable_bytes": 10090774528, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 26.534692959, "owned_rss_bytes": 94371840, "owned_process_count": 9, "reclaimable_bytes": 10089512960, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 26.779894584, "owned_rss_bytes": 95682560, "owned_process_count": 9, "reclaimable_bytes": 10087481344, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 27.020079250000002, "owned_rss_bytes": 88489984, "owned_process_count": 9, "reclaimable_bytes": 10080747520, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 27.259129375, "owned_rss_bytes": 59097088, "owned_process_count": 2, "reclaimable_bytes": 10103947264, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 27.486233875, "owned_rss_bytes": 65748992, "owned_process_count": 3, "reclaimable_bytes": 10105946112, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 27.708485542000002, "owned_rss_bytes": 65486848, "owned_process_count": 4, "reclaimable_bytes": 10211459072, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 27.931936250000003, "owned_rss_bytes": 59179008, "owned_process_count": 2, "reclaimable_bytes": 10209837056, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 28.159298667, "owned_rss_bytes": 65814528, "owned_process_count": 3, "reclaimable_bytes": 10207739904, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 28.385564584, "owned_rss_bytes": 63127552, "owned_process_count": 3, "reclaimable_bytes": 10205331456, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 28.613877792, "owned_rss_bytes": 259833856, "owned_process_count": 8, "reclaimable_bytes": 10133520384, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 28.84173925, "owned_rss_bytes": 59736064, "owned_process_count": 5, "reclaimable_bytes": 10213376000, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 29.065988125, "owned_rss_bytes": 59703296, "owned_process_count": 5, "reclaimable_bytes": 10212769792, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 29.300184417, "owned_rss_bytes": 59670528, "owned_process_count": 5, "reclaimable_bytes": 10215555072, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 29.532852917000003, "owned_rss_bytes": 547340288, "owned_process_count": 14, "reclaimable_bytes": 10069901312, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 29.768060209, "owned_rss_bytes": 64536576, "owned_process_count": 6, "reclaimable_bytes": 10220077056, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 29.995860584000003, "owned_rss_bytes": 60260352, "owned_process_count": 5, "reclaimable_bytes": 10220617728, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 30.228380959000003, "owned_rss_bytes": 60227584, "owned_process_count": 5, "reclaimable_bytes": 10219208704, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 30.470020292, "owned_rss_bytes": 101007360, "owned_process_count": 4, "reclaimable_bytes": 10190635008, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 30.698976709, "owned_rss_bytes": 60424192, "owned_process_count": 3, "reclaimable_bytes": 10219536384, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 30.928006084, "owned_rss_bytes": 166445056, "owned_process_count": 4, "reclaimable_bytes": 10187636736, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 31.153009, "owned_rss_bytes": 60456960, "owned_process_count": 3, "reclaimable_bytes": 10210738176, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 31.382149125, "owned_rss_bytes": 60473344, "owned_process_count": 3, "reclaimable_bytes": 10220978176, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 31.608937125, "owned_rss_bytes": 61145088, "owned_process_count": 2, "reclaimable_bytes": 10220077056, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 31.836715584000004, "owned_rss_bytes": 64913408, "owned_process_count": 2, "reclaimable_bytes": 10216603648, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 32.064350250000004, "owned_rss_bytes": 67960832, "owned_process_count": 2, "reclaimable_bytes": 10210623488, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 32.291455125, "owned_rss_bytes": 98336768, "owned_process_count": 3, "reclaimable_bytes": 10179461120, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 32.515078959, "owned_rss_bytes": 233472000, "owned_process_count": 4, "reclaimable_bytes": 10121379840, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 32.743144459, "owned_rss_bytes": 260030464, "owned_process_count": 4, "reclaimable_bytes": 10102439936, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 32.968390709000005, "owned_rss_bytes": 285065216, "owned_process_count": 4, "reclaimable_bytes": 10073686016, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 33.196256167, "owned_rss_bytes": 308035584, "owned_process_count": 4, "reclaimable_bytes": 10051452928, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 33.422749584, "owned_rss_bytes": 320995328, "owned_process_count": 4, "reclaimable_bytes": 10040590336, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 33.650480959, "owned_rss_bytes": 327368704, "owned_process_count": 4, "reclaimable_bytes": 10037985280, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 33.877710959, "owned_rss_bytes": 334757888, "owned_process_count": 4, "reclaimable_bytes": 10032824320, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 34.106056959, "owned_rss_bytes": 339345408, "owned_process_count": 4, "reclaimable_bytes": 10028154880, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 34.333643209, "owned_rss_bytes": 344621056, "owned_process_count": 4, "reclaimable_bytes": 10026336256, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 34.561898709000005, "owned_rss_bytes": 349437952, "owned_process_count": 4, "reclaimable_bytes": 10019848192, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 34.790078959, "owned_rss_bytes": 352714752, "owned_process_count": 4, "reclaimable_bytes": 10014605312, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 35.018397625, "owned_rss_bytes": 386859008, "owned_process_count": 4, "reclaimable_bytes": 9980854272, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 35.2471855, "owned_rss_bytes": 445071360, "owned_process_count": 4, "reclaimable_bytes": 9911959552, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 35.476202084, "owned_rss_bytes": 508133376, "owned_process_count": 4, "reclaimable_bytes": 9917333504, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 35.703115000000004, "owned_rss_bytes": 649527296, "owned_process_count": 4, "reclaimable_bytes": 9565503488, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 35.931424084, "owned_rss_bytes": 1041072128, "owned_process_count": 4, "reclaimable_bytes": 9205088256, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 36.164373417, "owned_rss_bytes": 1043398656, "owned_process_count": 4, "reclaimable_bytes": 9203073024, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 36.392094709, "owned_rss_bytes": 1043988480, "owned_process_count": 4, "reclaimable_bytes": 9200222208, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 36.619492792, "owned_rss_bytes": 1044873216, "owned_process_count": 4, "reclaimable_bytes": 9197617152, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 36.847110959, "owned_rss_bytes": 1045168128, "owned_process_count": 4, "reclaimable_bytes": 9372860416, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 37.070359584, "owned_rss_bytes": 1045643264, "owned_process_count": 4, "reclaimable_bytes": 9372057600, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 37.298351667, "owned_rss_bytes": 1045807104, "owned_process_count": 4, "reclaimable_bytes": 9375023104, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 37.525443209, "owned_rss_bytes": 1046183936, "owned_process_count": 4, "reclaimable_bytes": 9370615808, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 37.751773542, "owned_rss_bytes": 1046446080, "owned_process_count": 4, "reclaimable_bytes": 9372549120, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 37.977945125, "owned_rss_bytes": 1046724608, "owned_process_count": 4, "reclaimable_bytes": 9376382976, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 38.205484, "owned_rss_bytes": 1047101440, "owned_process_count": 4, "reclaimable_bytes": 9378168832, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 38.429858917000004, "owned_rss_bytes": 1047805952, "owned_process_count": 4, "reclaimable_bytes": 9377366016, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 38.65716225, "owned_rss_bytes": 1048313856, "owned_process_count": 4, "reclaimable_bytes": 9371926528, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 38.884099125, "owned_rss_bytes": 1049608192, "owned_process_count": 4, "reclaimable_bytes": 9375416320, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 39.11170575, "owned_rss_bytes": 1051410432, "owned_process_count": 4, "reclaimable_bytes": 9370730496, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 39.339367459, "owned_rss_bytes": 1051721728, "owned_process_count": 4, "reclaimable_bytes": 9374203904, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 39.566752417000004, "owned_rss_bytes": 1057357824, "owned_process_count": 4, "reclaimable_bytes": 9367355392, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 39.790986834, "owned_rss_bytes": 1068793856, "owned_process_count": 4, "reclaimable_bytes": 9355673600, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 40.019292917, "owned_rss_bytes": 1076101120, "owned_process_count": 4, "reclaimable_bytes": 9344221184, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 40.244558792, "owned_rss_bytes": 1081229312, "owned_process_count": 4, "reclaimable_bytes": 9339518976, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 40.472255542, "owned_rss_bytes": 1095254016, "owned_process_count": 4, "reclaimable_bytes": 9326493696, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 40.699658709000005, "owned_rss_bytes": 1110245376, "owned_process_count": 4, "reclaimable_bytes": 9311141888, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 40.927790417000004, "owned_rss_bytes": 1127677952, "owned_process_count": 4, "reclaimable_bytes": 9297051648, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 41.152184209000005, "owned_rss_bytes": 1143750656, "owned_process_count": 4, "reclaimable_bytes": 9276833792, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 41.380866667, "owned_rss_bytes": 1158758400, "owned_process_count": 4, "reclaimable_bytes": 9260351488, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 41.608330667000004, "owned_rss_bytes": 1172373504, "owned_process_count": 4, "reclaimable_bytes": 9250799616, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 41.836775792000005, "owned_rss_bytes": 1184890880, "owned_process_count": 4, "reclaimable_bytes": 9235759104, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 42.061395709, "owned_rss_bytes": 1208041472, "owned_process_count": 4, "reclaimable_bytes": 9214148608, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 42.289468375, "owned_rss_bytes": 1214447616, "owned_process_count": 4, "reclaimable_bytes": 9208397824, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 42.519678709000004, "owned_rss_bytes": 1219166208, "owned_process_count": 4, "reclaimable_bytes": 9200713728, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 42.745830084000005, "owned_rss_bytes": 1236451328, "owned_process_count": 4, "reclaimable_bytes": 9186066432, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 42.976494667000004, "owned_rss_bytes": 1246298112, "owned_process_count": 4, "reclaimable_bytes": 9105702912, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 43.202404792, "owned_rss_bytes": 1248903168, "owned_process_count": 4, "reclaimable_bytes": 8986574848, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 43.431555834, "owned_rss_bytes": 197427200, "owned_process_count": 4, "reclaimable_bytes": 10001940480, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 43.659988542, "owned_rss_bytes": 283918336, "owned_process_count": 4, "reclaimable_bytes": 9930457088, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 43.890265584, "owned_rss_bytes": 179847168, "owned_process_count": 4, "reclaimable_bytes": 9995698176, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 44.119781125, "owned_rss_bytes": 254492672, "owned_process_count": 4, "reclaimable_bytes": 9908125696, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 44.347422125, "owned_rss_bytes": 342523904, "owned_process_count": 4, "reclaimable_bytes": 9736388608, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 44.579177, "owned_rss_bytes": 313032704, "owned_process_count": 4, "reclaimable_bytes": 9717678080, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 44.808163792, "owned_rss_bytes": 353353728, "owned_process_count": 4, "reclaimable_bytes": 9477652480, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 45.044083209, "owned_rss_bytes": 381435904, "owned_process_count": 4, "reclaimable_bytes": 9448964096, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 45.275919667000004, "owned_rss_bytes": 347586560, "owned_process_count": 4, "reclaimable_bytes": 9441345536, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 45.506329542, "owned_rss_bytes": 369950720, "owned_process_count": 4, "reclaimable_bytes": 9348644864, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 45.736846167, "owned_rss_bytes": 368885760, "owned_process_count": 4, "reclaimable_bytes": 9375531008, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 45.969503292, "owned_rss_bytes": 383123456, "owned_process_count": 4, "reclaimable_bytes": 9333260288, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 46.1981565, "owned_rss_bytes": 425197568, "owned_process_count": 4, "reclaimable_bytes": 9252306944, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 46.427976417, "owned_rss_bytes": 430391296, "owned_process_count": 4, "reclaimable_bytes": 9136586752, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 46.660865584, "owned_rss_bytes": 474038272, "owned_process_count": 4, "reclaimable_bytes": 9069887488, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 46.888496, "owned_rss_bytes": 488374272, "owned_process_count": 4, "reclaimable_bytes": 9038086144, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 47.118583625, "owned_rss_bytes": 480722944, "owned_process_count": 4, "reclaimable_bytes": 8913387520, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 47.348059709000005, "owned_rss_bytes": 497909760, "owned_process_count": 4, "reclaimable_bytes": 8861384704, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 47.581212584, "owned_rss_bytes": 512311296, "owned_process_count": 4, "reclaimable_bytes": 8758198272, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 47.813249834000004, "owned_rss_bytes": 523681792, "owned_process_count": 4, "reclaimable_bytes": 8824881152, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 48.040092834, "owned_rss_bytes": 553451520, "owned_process_count": 4, "reclaimable_bytes": 8781414400, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 48.269007209, "owned_rss_bytes": 600440832, "owned_process_count": 4, "reclaimable_bytes": 8714420224, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 48.497204417, "owned_rss_bytes": 602996736, "owned_process_count": 4, "reclaimable_bytes": 8664317952, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 48.729459917, "owned_rss_bytes": 614531072, "owned_process_count": 4, "reclaimable_bytes": 8613838848, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 48.959168250000005, "owned_rss_bytes": 651280384, "owned_process_count": 4, "reclaimable_bytes": 8599568384, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 49.18789175, "owned_rss_bytes": 669220864, "owned_process_count": 4, "reclaimable_bytes": 8585068544, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 49.413876292000005, "owned_rss_bytes": 583843840, "owned_process_count": 4, "reclaimable_bytes": 8738226176, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 49.6412895, "owned_rss_bytes": 622952448, "owned_process_count": 4, "reclaimable_bytes": 8718221312, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 49.871381334, "owned_rss_bytes": 629506048, "owned_process_count": 4, "reclaimable_bytes": 8710569984, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 50.097473959, "owned_rss_bytes": 631668736, "owned_process_count": 4, "reclaimable_bytes": 8691023872, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 50.326867, "owned_rss_bytes": 659718144, "owned_process_count": 4, "reclaimable_bytes": 8655175680, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 50.553133584, "owned_rss_bytes": 668778496, "owned_process_count": 4, "reclaimable_bytes": 8651276288, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 50.785112584000004, "owned_rss_bytes": 656801792, "owned_process_count": 4, "reclaimable_bytes": 8640266240, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 51.028228084, "owned_rss_bytes": 242384896, "owned_process_count": 4, "reclaimable_bytes": 8994717696, "swapins": 44112323, "swapouts": 77525566}
{"elapsed_seconds": 51.262610834, "owned_rss_bytes": 289865728, "owned_process_count": 4, "reclaimable_bytes": 8949661696, "swapins": 44112331, "swapouts": 77525566}
{"elapsed_seconds": 51.492243209, "owned_rss_bytes": 301400064, "owned_process_count": 4, "reclaimable_bytes": 8904704000, "swapins": 44112331, "swapouts": 77525566}
{"elapsed_seconds": 51.717681667, "owned_rss_bytes": 307986432, "owned_process_count": 4, "reclaimable_bytes": 8948318208, "swapins": 44112331, "swapouts": 77525566}
{"elapsed_seconds": 51.947264417, "owned_rss_bytes": 266141696, "owned_process_count": 4, "reclaimable_bytes": 8858796032, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 52.177129334, "owned_rss_bytes": 313720832, "owned_process_count": 4, "reclaimable_bytes": 8801665024, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 52.409644792, "owned_rss_bytes": 322732032, "owned_process_count": 4, "reclaimable_bytes": 8753463296, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 52.639673917, "owned_rss_bytes": 326402048, "owned_process_count": 4, "reclaimable_bytes": 8699461632, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 52.869891417, "owned_rss_bytes": 251854848, "owned_process_count": 4, "reclaimable_bytes": 8723546112, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 53.1012305, "owned_rss_bytes": 307150848, "owned_process_count": 4, "reclaimable_bytes": 8669069312, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 53.328856, "owned_rss_bytes": 317341696, "owned_process_count": 4, "reclaimable_bytes": 8627191808, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 53.560231334, "owned_rss_bytes": 351797248, "owned_process_count": 4, "reclaimable_bytes": 8582430720, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 53.791499209, "owned_rss_bytes": 417300480, "owned_process_count": 4, "reclaimable_bytes": 8578498560, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 54.021243834, "owned_rss_bytes": 454377472, "owned_process_count": 4, "reclaimable_bytes": 8591507456, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 54.259313084, "owned_rss_bytes": 142393344, "owned_process_count": 3, "reclaimable_bytes": 8812265472, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 54.488443375, "owned_rss_bytes": 217415680, "owned_process_count": 4, "reclaimable_bytes": 8738242560, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 54.715946959, "owned_rss_bytes": 313360384, "owned_process_count": 4, "reclaimable_bytes": 8614789120, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 54.945478542000004, "owned_rss_bytes": 314228736, "owned_process_count": 4, "reclaimable_bytes": 8601862144, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 55.177004084000004, "owned_rss_bytes": 364429312, "owned_process_count": 4, "reclaimable_bytes": 8599650304, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 55.408764375000004, "owned_rss_bytes": 416759808, "owned_process_count": 4, "reclaimable_bytes": 8612200448, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 55.641592209, "owned_rss_bytes": 283213824, "owned_process_count": 4, "reclaimable_bytes": 8777154560, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 55.869902334, "owned_rss_bytes": 225509376, "owned_process_count": 5, "reclaimable_bytes": 8726118400, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 56.0994085, "owned_rss_bytes": 94830592, "owned_process_count": 3, "reclaimable_bytes": 8776122368, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 56.332662375, "owned_rss_bytes": 159416320, "owned_process_count": 4, "reclaimable_bytes": 8721235968, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 56.557170917, "owned_rss_bytes": 130613248, "owned_process_count": 4, "reclaimable_bytes": 8723021824, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 56.791080292000004, "owned_rss_bytes": 95109120, "owned_process_count": 3, "reclaimable_bytes": 8756346880, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 57.016520834000005, "owned_rss_bytes": 95141888, "owned_process_count": 2, "reclaimable_bytes": 8724742144, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 57.245728875000005, "owned_rss_bytes": 95141888, "owned_process_count": 2, "reclaimable_bytes": 8695562240, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 57.4782195, "owned_rss_bytes": 95911936, "owned_process_count": 3, "reclaimable_bytes": 8692432896, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 57.709249625, "owned_rss_bytes": 131891200, "owned_process_count": 4, "reclaimable_bytes": 8709734400, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 57.939054584000004, "owned_rss_bytes": 222035968, "owned_process_count": 4, "reclaimable_bytes": 8685813760, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 58.165259417, "owned_rss_bytes": 216481792, "owned_process_count": 4, "reclaimable_bytes": 8689762304, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 58.394934917, "owned_rss_bytes": 213467136, "owned_process_count": 4, "reclaimable_bytes": 8685977600, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 58.626107667, "owned_rss_bytes": 170311680, "owned_process_count": 4, "reclaimable_bytes": 8725954560, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 58.856744875000004, "owned_rss_bytes": 166281216, "owned_process_count": 4, "reclaimable_bytes": 8688041984, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 59.087697625000004, "owned_rss_bytes": 229670912, "owned_process_count": 4, "reclaimable_bytes": 8694480896, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 59.316643167, "owned_rss_bytes": 283361280, "owned_process_count": 4, "reclaimable_bytes": 8671674368, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 59.544689042, "owned_rss_bytes": 101662720, "owned_process_count": 3, "reclaimable_bytes": 8781529088, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 59.771270709, "owned_rss_bytes": 202866688, "owned_process_count": 4, "reclaimable_bytes": 8738783232, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 60.002635125000005, "owned_rss_bytes": 137740288, "owned_process_count": 4, "reclaimable_bytes": 8736817152, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 60.23179225, "owned_rss_bytes": 195624960, "owned_process_count": 4, "reclaimable_bytes": 8675180544, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 60.462408584, "owned_rss_bytes": 243548160, "owned_process_count": 4, "reclaimable_bytes": 8667070464, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 60.693646834, "owned_rss_bytes": 98418688, "owned_process_count": 3, "reclaimable_bytes": 8686223360, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 60.922821, "owned_rss_bytes": 217202688, "owned_process_count": 4, "reclaimable_bytes": 8650211328, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 61.153348709, "owned_rss_bytes": 257196032, "owned_process_count": 4, "reclaimable_bytes": 8631140352, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 61.397533042, "owned_rss_bytes": 220397568, "owned_process_count": 4, "reclaimable_bytes": 8631025664, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 61.628428209, "owned_rss_bytes": 260603904, "owned_process_count": 4, "reclaimable_bytes": 8631091200, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 61.859747167, "owned_rss_bytes": 200572928, "owned_process_count": 4, "reclaimable_bytes": 8661303296, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 62.089273834000004, "owned_rss_bytes": 251920384, "owned_process_count": 4, "reclaimable_bytes": 8630321152, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 62.319535084, "owned_rss_bytes": 267403264, "owned_process_count": 4, "reclaimable_bytes": 8623685632, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 62.549599334, "owned_rss_bytes": 243400704, "owned_process_count": 4, "reclaimable_bytes": 8628092928, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 62.778033375, "owned_rss_bytes": 260325376, "owned_process_count": 4, "reclaimable_bytes": 8642478080, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 63.007522625, "owned_rss_bytes": 213123072, "owned_process_count": 4, "reclaimable_bytes": 8646836224, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 63.237799167, "owned_rss_bytes": 304594944, "owned_process_count": 4, "reclaimable_bytes": 8612691968, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 63.47210475, "owned_rss_bytes": 278511616, "owned_process_count": 4, "reclaimable_bytes": 8671264768, "swapins": 44112335, "swapouts": 77525566}
{"elapsed_seconds": 63.700842667, "owned_rss_bytes": 355909632, "owned_process_count": 4, "reclaimable_bytes": 8596635648, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 63.93646516700001, "owned_rss_bytes": 374177792, "owned_process_count": 4, "reclaimable_bytes": 8623849472, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 64.169824209, "owned_rss_bytes": 367345664, "owned_process_count": 4, "reclaimable_bytes": 8848195584, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 64.39961516700001, "owned_rss_bytes": 264896512, "owned_process_count": 4, "reclaimable_bytes": 8770437120, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 64.630356084, "owned_rss_bytes": 285523968, "owned_process_count": 4, "reclaimable_bytes": 8722055168, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 64.862623417, "owned_rss_bytes": 313491456, "owned_process_count": 4, "reclaimable_bytes": 8677228544, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 65.094684625, "owned_rss_bytes": 351141888, "owned_process_count": 4, "reclaimable_bytes": 8637726720, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 65.322930709, "owned_rss_bytes": 358825984, "owned_process_count": 4, "reclaimable_bytes": 8604975104, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 65.55344883400001, "owned_rss_bytes": 360857600, "owned_process_count": 4, "reclaimable_bytes": 8575025152, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 65.7863665, "owned_rss_bytes": 361676800, "owned_process_count": 4, "reclaimable_bytes": 8550088704, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 66.019766834, "owned_rss_bytes": 372604928, "owned_process_count": 4, "reclaimable_bytes": 8539897856, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 66.250534084, "owned_rss_bytes": 384548864, "owned_process_count": 4, "reclaimable_bytes": 8509259776, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 66.47966875, "owned_rss_bytes": 206815232, "owned_process_count": 4, "reclaimable_bytes": 8597815296, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 66.706169, "owned_rss_bytes": 277086208, "owned_process_count": 4, "reclaimable_bytes": 8493957120, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 66.935746334, "owned_rss_bytes": 268779520, "owned_process_count": 4, "reclaimable_bytes": 8520302592, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 67.165771167, "owned_rss_bytes": 322715648, "owned_process_count": 4, "reclaimable_bytes": 8480014336, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 67.396000417, "owned_rss_bytes": 372604928, "owned_process_count": 4, "reclaimable_bytes": 8424603648, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 67.626063917, "owned_rss_bytes": 176537600, "owned_process_count": 4, "reclaimable_bytes": 8594718720, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 67.8601955, "owned_rss_bytes": 293371904, "owned_process_count": 4, "reclaimable_bytes": 8536391680, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 68.089045, "owned_rss_bytes": 190136320, "owned_process_count": 4, "reclaimable_bytes": 8544272384, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 68.321859084, "owned_rss_bytes": 283361280, "owned_process_count": 4, "reclaimable_bytes": 8457273344, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 68.552162792, "owned_rss_bytes": 352862208, "owned_process_count": 4, "reclaimable_bytes": 8397832192, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 68.787048959, "owned_rss_bytes": 325959680, "owned_process_count": 4, "reclaimable_bytes": 8411152384, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 69.01691383400001, "owned_rss_bytes": 391413760, "owned_process_count": 4, "reclaimable_bytes": 8418918400, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 69.2489585, "owned_rss_bytes": 417071104, "owned_process_count": 4, "reclaimable_bytes": 8492564480, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 69.480123667, "owned_rss_bytes": 192217088, "owned_process_count": 4, "reclaimable_bytes": 8571486208, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 69.70834941700001, "owned_rss_bytes": 222920704, "owned_process_count": 4, "reclaimable_bytes": 8532590592, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 69.943288, "owned_rss_bytes": 237666304, "owned_process_count": 4, "reclaimable_bytes": 8509800448, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 70.169958292, "owned_rss_bytes": 132972544, "owned_process_count": 4, "reclaimable_bytes": 8525938688, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 70.400736834, "owned_rss_bytes": 268124160, "owned_process_count": 4, "reclaimable_bytes": 8464187392, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 70.628203875, "owned_rss_bytes": 336691200, "owned_process_count": 4, "reclaimable_bytes": 11969986560, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 70.876184542, "owned_rss_bytes": 373063680, "owned_process_count": 4, "reclaimable_bytes": 12292751360, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 71.1031335, "owned_rss_bytes": 393183232, "owned_process_count": 4, "reclaimable_bytes": 12270862336, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 71.326190584, "owned_rss_bytes": 424443904, "owned_process_count": 4, "reclaimable_bytes": 12178849792, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 71.556836875, "owned_rss_bytes": 435929088, "owned_process_count": 4, "reclaimable_bytes": 12134105088, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 71.7855325, "owned_rss_bytes": 469696512, "owned_process_count": 4, "reclaimable_bytes": 12113281024, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 72.0114385, "owned_rss_bytes": 487817216, "owned_process_count": 4, "reclaimable_bytes": 12104433664, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 72.236348959, "owned_rss_bytes": 514555904, "owned_process_count": 4, "reclaimable_bytes": 12074713088, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 72.461399542, "owned_rss_bytes": 542785536, "owned_process_count": 4, "reclaimable_bytes": 12055363584, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 72.690478834, "owned_rss_bytes": 594149376, "owned_process_count": 4, "reclaimable_bytes": 12031754240, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 72.917799417, "owned_rss_bytes": 544653312, "owned_process_count": 4, "reclaimable_bytes": 12024807424, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 73.14662629200001, "owned_rss_bytes": 556531712, "owned_process_count": 4, "reclaimable_bytes": 12011831296, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 73.375484542, "owned_rss_bytes": 557711360, "owned_process_count": 4, "reclaimable_bytes": 12007358464, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 73.602967417, "owned_rss_bytes": 566771712, "owned_process_count": 4, "reclaimable_bytes": 12004327424, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 73.832068084, "owned_rss_bytes": 591970304, "owned_process_count": 4, "reclaimable_bytes": 12007063552, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 74.060470667, "owned_rss_bytes": 610582528, "owned_process_count": 4, "reclaimable_bytes": 11987927040, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 74.286049334, "owned_rss_bytes": 608108544, "owned_process_count": 4, "reclaimable_bytes": 11971067904, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 74.515415292, "owned_rss_bytes": 609026048, "owned_process_count": 4, "reclaimable_bytes": 11956682752, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 74.744217084, "owned_rss_bytes": 610467840, "owned_process_count": 4, "reclaimable_bytes": 11955732480, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 74.97321, "owned_rss_bytes": 622444544, "owned_process_count": 4, "reclaimable_bytes": 11944394752, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 75.201065, "owned_rss_bytes": 634093568, "owned_process_count": 4, "reclaimable_bytes": 11930599424, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 75.430984959, "owned_rss_bytes": 614400000, "owned_process_count": 4, "reclaimable_bytes": 11971051520, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 75.659823459, "owned_rss_bytes": 618790912, "owned_process_count": 4, "reclaimable_bytes": 11998117888, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 75.888144417, "owned_rss_bytes": 631685120, "owned_process_count": 4, "reclaimable_bytes": 11989909504, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 76.115408125, "owned_rss_bytes": 675053568, "owned_process_count": 4, "reclaimable_bytes": 11951800320, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 76.342949625, "owned_rss_bytes": 677953536, "owned_process_count": 4, "reclaimable_bytes": 11948343296, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 76.571121584, "owned_rss_bytes": 727547904, "owned_process_count": 4, "reclaimable_bytes": 11896209408, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 76.79431275, "owned_rss_bytes": 745111552, "owned_process_count": 4, "reclaimable_bytes": 11881037824, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 77.022948959, "owned_rss_bytes": 728006656, "owned_process_count": 4, "reclaimable_bytes": 11878940672, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 77.246512959, "owned_rss_bytes": 655343616, "owned_process_count": 4, "reclaimable_bytes": 11880726528, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 77.4705845, "owned_rss_bytes": 659898368, "owned_process_count": 4, "reclaimable_bytes": 11883380736, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 77.698546167, "owned_rss_bytes": 685326336, "owned_process_count": 4, "reclaimable_bytes": 11851022336, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 77.92645225, "owned_rss_bytes": 681050112, "owned_process_count": 4, "reclaimable_bytes": 11849580544, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 78.151056875, "owned_rss_bytes": 725073920, "owned_process_count": 4, "reclaimable_bytes": 11801395200, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 78.37882279200001, "owned_rss_bytes": 734887936, "owned_process_count": 4, "reclaimable_bytes": 11791089664, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 78.606028, "owned_rss_bytes": 748634112, "owned_process_count": 4, "reclaimable_bytes": 11802460160, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 78.833243209, "owned_rss_bytes": 752009216, "owned_process_count": 4, "reclaimable_bytes": 11801182208, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 79.061545542, "owned_rss_bytes": 766902272, "owned_process_count": 4, "reclaimable_bytes": 11797495808, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 79.2855155, "owned_rss_bytes": 766902272, "owned_process_count": 4, "reclaimable_bytes": 11800854528, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 79.511292875, "owned_rss_bytes": 770686976, "owned_process_count": 4, "reclaimable_bytes": 11797413888, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 79.73638150000001, "owned_rss_bytes": 285982720, "owned_process_count": 4, "reclaimable_bytes": 12262244352, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 79.96445641700001, "owned_rss_bytes": 331055104, "owned_process_count": 4, "reclaimable_bytes": 12229181440, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 80.192441042, "owned_rss_bytes": 362889216, "owned_process_count": 4, "reclaimable_bytes": 12220399616, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 80.4207605, "owned_rss_bytes": 371097600, "owned_process_count": 4, "reclaimable_bytes": 12214337536, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 80.648934875, "owned_rss_bytes": 377815040, "owned_process_count": 4, "reclaimable_bytes": 12208619520, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 80.877026375, "owned_rss_bytes": 392429568, "owned_process_count": 4, "reclaimable_bytes": 12197117952, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 81.105651084, "owned_rss_bytes": 463519744, "owned_process_count": 4, "reclaimable_bytes": 12128731136, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 81.332935709, "owned_rss_bytes": 467910656, "owned_process_count": 4, "reclaimable_bytes": 12123815936, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 81.56090804200001, "owned_rss_bytes": 503873536, "owned_process_count": 4, "reclaimable_bytes": 12091604992, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 81.788932792, "owned_rss_bytes": 547946496, "owned_process_count": 4, "reclaimable_bytes": 12061097984, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 82.012408667, "owned_rss_bytes": 294092800, "owned_process_count": 4, "reclaimable_bytes": 12259606528, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 82.240579417, "owned_rss_bytes": 345341952, "owned_process_count": 4, "reclaimable_bytes": 12235702272, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 82.4685295, "owned_rss_bytes": 357498880, "owned_process_count": 4, "reclaimable_bytes": 12229984256, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 82.6972635, "owned_rss_bytes": 366952448, "owned_process_count": 4, "reclaimable_bytes": 12220186624, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 82.924845292, "owned_rss_bytes": 386957312, "owned_process_count": 4, "reclaimable_bytes": 12203753472, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 83.152514084, "owned_rss_bytes": 185696256, "owned_process_count": 4, "reclaimable_bytes": 12287426560, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 83.37567212500001, "owned_rss_bytes": 332922880, "owned_process_count": 4, "reclaimable_bytes": 12237864960, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 83.601020292, "owned_rss_bytes": 366084096, "owned_process_count": 4, "reclaimable_bytes": 12208046080, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 83.829323292, "owned_rss_bytes": 396705792, "owned_process_count": 4, "reclaimable_bytes": 12172656640, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 84.055438667, "owned_rss_bytes": 426639360, "owned_process_count": 4, "reclaimable_bytes": 12178669568, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 84.282850625, "owned_rss_bytes": 433717248, "owned_process_count": 4, "reclaimable_bytes": 12171673600, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 84.510659709, "owned_rss_bytes": 444121088, "owned_process_count": 4, "reclaimable_bytes": 12164251648, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 84.738918875, "owned_rss_bytes": 485244928, "owned_process_count": 4, "reclaimable_bytes": 12136464384, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 84.96491216700001, "owned_rss_bytes": 518668288, "owned_process_count": 4, "reclaimable_bytes": 12115460096, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 85.188121042, "owned_rss_bytes": 634683392, "owned_process_count": 4, "reclaimable_bytes": 11995742208, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 85.415298709, "owned_rss_bytes": 139837440, "owned_process_count": 3, "reclaimable_bytes": 12279414784, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 85.640296959, "owned_rss_bytes": 195575808, "owned_process_count": 4, "reclaimable_bytes": 12247613440, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 85.864822209, "owned_rss_bytes": 163086336, "owned_process_count": 4, "reclaimable_bytes": 12244254720, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 86.09370458400001, "owned_rss_bytes": 253345792, "owned_process_count": 4, "reclaimable_bytes": 12161597440, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 86.321393917, "owned_rss_bytes": 266158080, "owned_process_count": 4, "reclaimable_bytes": 12294258688, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 86.549107125, "owned_rss_bytes": 321945600, "owned_process_count": 4, "reclaimable_bytes": 11125227520, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 86.780221375, "owned_rss_bytes": 369246208, "owned_process_count": 4, "reclaimable_bytes": 10910482432, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 87.011599834, "owned_rss_bytes": 420184064, "owned_process_count": 4, "reclaimable_bytes": 11993530368, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 87.236476334, "owned_rss_bytes": 433225728, "owned_process_count": 4, "reclaimable_bytes": 11975196672, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 87.46321825, "owned_rss_bytes": 444366848, "owned_process_count": 4, "reclaimable_bytes": 11960320000, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 87.690542167, "owned_rss_bytes": 466993152, "owned_process_count": 4, "reclaimable_bytes": 11935842304, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 87.91748041700001, "owned_rss_bytes": 425967616, "owned_process_count": 4, "reclaimable_bytes": 11988221952, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 88.145416334, "owned_rss_bytes": 450199552, "owned_process_count": 4, "reclaimable_bytes": 11956944896, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 88.369877167, "owned_rss_bytes": 505118720, "owned_process_count": 4, "reclaimable_bytes": 11946164224, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 88.59738716700001, "owned_rss_bytes": 531218432, "owned_process_count": 4, "reclaimable_bytes": 11930992640, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 88.825256667, "owned_rss_bytes": 233439232, "owned_process_count": 4, "reclaimable_bytes": 12175425536, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 89.053148209, "owned_rss_bytes": 322879488, "owned_process_count": 4, "reclaimable_bytes": 12129370112, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 89.281350584, "owned_rss_bytes": 371245056, "owned_process_count": 4, "reclaimable_bytes": 12108218368, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 89.509936917, "owned_rss_bytes": 409157632, "owned_process_count": 4, "reclaimable_bytes": 12071878656, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 89.736180709, "owned_rss_bytes": 414220288, "owned_process_count": 4, "reclaimable_bytes": 12066799616, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 89.9636225, "owned_rss_bytes": 479789056, "owned_process_count": 4, "reclaimable_bytes": 12011929600, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 90.191137584, "owned_rss_bytes": 130236416, "owned_process_count": 4, "reclaimable_bytes": 12193415168, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 90.419090542, "owned_rss_bytes": 313720832, "owned_process_count": 4, "reclaimable_bytes": 12144902144, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 90.648112917, "owned_rss_bytes": 312852480, "owned_process_count": 4, "reclaimable_bytes": 12137218048, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 90.876476167, "owned_rss_bytes": 362790912, "owned_process_count": 4, "reclaimable_bytes": 12101959680, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 91.102962417, "owned_rss_bytes": 379830272, "owned_process_count": 4, "reclaimable_bytes": 12087754752, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 91.327943125, "owned_rss_bytes": 391069696, "owned_process_count": 4, "reclaimable_bytes": 12082593792, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 91.555728167, "owned_rss_bytes": 157745152, "owned_process_count": 4, "reclaimable_bytes": 12197576704, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 91.784965959, "owned_rss_bytes": 199491584, "owned_process_count": 4, "reclaimable_bytes": 12171296768, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 92.013112709, "owned_rss_bytes": 255033344, "owned_process_count": 4, "reclaimable_bytes": 12128092160, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 92.23610125, "owned_rss_bytes": 178159616, "owned_process_count": 4, "reclaimable_bytes": 12178767872, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 92.461211667, "owned_rss_bytes": 274350080, "owned_process_count": 4, "reclaimable_bytes": 12157714432, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 92.689167875, "owned_rss_bytes": 322011136, "owned_process_count": 4, "reclaimable_bytes": 12120719360, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 92.916652125, "owned_rss_bytes": 318111744, "owned_process_count": 4, "reclaimable_bytes": 12112101376, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 93.144674792, "owned_rss_bytes": 297320448, "owned_process_count": 4, "reclaimable_bytes": 12149473280, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 93.372067834, "owned_rss_bytes": 335511552, "owned_process_count": 4, "reclaimable_bytes": 12123176960, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 93.599685542, "owned_rss_bytes": 91258880, "owned_process_count": 3, "reclaimable_bytes": 12200542208, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 93.82697070900001, "owned_rss_bytes": 203620352, "owned_process_count": 4, "reclaimable_bytes": 12164038656, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 94.055708917, "owned_rss_bytes": 255262720, "owned_process_count": 4, "reclaimable_bytes": 12112019456, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 94.284023125, "owned_rss_bytes": 317833216, "owned_process_count": 4, "reclaimable_bytes": 12051709952, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 94.512466167, "owned_rss_bytes": 383221760, "owned_process_count": 4, "reclaimable_bytes": 11990106112, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 94.73817975, "owned_rss_bytes": 97058816, "owned_process_count": 3, "reclaimable_bytes": 12094947328, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 94.961163, "owned_rss_bytes": 276938752, "owned_process_count": 4, "reclaimable_bytes": 12053086208, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 95.188604875, "owned_rss_bytes": 346243072, "owned_process_count": 4, "reclaimable_bytes": 12019269632, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 95.416487875, "owned_rss_bytes": 195756032, "owned_process_count": 4, "reclaimable_bytes": 12066914304, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 95.643906417, "owned_rss_bytes": 253329408, "owned_process_count": 4, "reclaimable_bytes": 11781619712, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 95.87107725, "owned_rss_bytes": 189923328, "owned_process_count": 4, "reclaimable_bytes": 11818893312, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 96.099358042, "owned_rss_bytes": 244170752, "owned_process_count": 4, "reclaimable_bytes": 11774066688, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 96.3241415, "owned_rss_bytes": 298795008, "owned_process_count": 4, "reclaimable_bytes": 11721408512, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 96.553021917, "owned_rss_bytes": 166854656, "owned_process_count": 4, "reclaimable_bytes": 11832901632, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 96.781603667, "owned_rss_bytes": 223297536, "owned_process_count": 4, "reclaimable_bytes": 11792531456, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 97.008270042, "owned_rss_bytes": 275628032, "owned_process_count": 4, "reclaimable_bytes": 11749720064, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 97.238685875, "owned_rss_bytes": 341377024, "owned_process_count": 4, "reclaimable_bytes": 11683659776, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 97.463421125, "owned_rss_bytes": 410255360, "owned_process_count": 4, "reclaimable_bytes": 11626594304, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 97.68951175000001, "owned_rss_bytes": 140869632, "owned_process_count": 4, "reclaimable_bytes": 11884969984, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 97.918056709, "owned_rss_bytes": 207339520, "owned_process_count": 4, "reclaimable_bytes": 11848318976, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 98.14449279200001, "owned_rss_bytes": 263143424, "owned_process_count": 4, "reclaimable_bytes": 11792793600, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 98.372780125, "owned_rss_bytes": 316719104, "owned_process_count": 4, "reclaimable_bytes": 11919654912, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 98.600163834, "owned_rss_bytes": 381059072, "owned_process_count": 4, "reclaimable_bytes": 11852890112, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 98.828530959, "owned_rss_bytes": 439877632, "owned_process_count": 4, "reclaimable_bytes": 11717427200, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 99.052644959, "owned_rss_bytes": 514916352, "owned_process_count": 4, "reclaimable_bytes": 11649794048, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 99.280340917, "owned_rss_bytes": 535314432, "owned_process_count": 4, "reclaimable_bytes": 11632328704, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 99.507825084, "owned_rss_bytes": 150290432, "owned_process_count": 4, "reclaimable_bytes": 11977097216, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 99.735394959, "owned_rss_bytes": 213155840, "owned_process_count": 4, "reclaimable_bytes": 11935334400, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 99.95925425, "owned_rss_bytes": 268926976, "owned_process_count": 4, "reclaimable_bytes": 11886166016, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 100.187978625, "owned_rss_bytes": 106643456, "owned_process_count": 4, "reclaimable_bytes": 11985600512, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 100.41555025, "owned_rss_bytes": 205520896, "owned_process_count": 4, "reclaimable_bytes": 11944050688, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 100.644536792, "owned_rss_bytes": 256540672, "owned_process_count": 4, "reclaimable_bytes": 11895586816, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 100.873171417, "owned_rss_bytes": 317194240, "owned_process_count": 4, "reclaimable_bytes": 11836817408, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 101.101131125, "owned_rss_bytes": 365084672, "owned_process_count": 4, "reclaimable_bytes": 11882479616, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 101.327868084, "owned_rss_bytes": 417595392, "owned_process_count": 4, "reclaimable_bytes": 11830820864, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 101.555322375, "owned_rss_bytes": 192528384, "owned_process_count": 4, "reclaimable_bytes": 12047253504, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 101.778073542, "owned_rss_bytes": 248578048, "owned_process_count": 4, "reclaimable_bytes": 12002099200, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 102.006765167, "owned_rss_bytes": 197115904, "owned_process_count": 4, "reclaimable_bytes": 12057559040, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 102.234406292, "owned_rss_bytes": 247201792, "owned_process_count": 4, "reclaimable_bytes": 11966824448, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 102.463876125, "owned_rss_bytes": 312492032, "owned_process_count": 4, "reclaimable_bytes": 11833376768, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 102.692644417, "owned_rss_bytes": 190283776, "owned_process_count": 4, "reclaimable_bytes": 11937316864, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 102.922540209, "owned_rss_bytes": 242941952, "owned_process_count": 4, "reclaimable_bytes": 11925913600, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 103.1525705, "owned_rss_bytes": 151339008, "owned_process_count": 4, "reclaimable_bytes": 11974131712, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 103.381156667, "owned_rss_bytes": 208355328, "owned_process_count": 4, "reclaimable_bytes": 11906367488, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 103.610112292, "owned_rss_bytes": 260489216, "owned_process_count": 4, "reclaimable_bytes": 11780227072, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 103.8426205, "owned_rss_bytes": 164249600, "owned_process_count": 4, "reclaimable_bytes": 11916689408, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 104.069545584, "owned_rss_bytes": 214122496, "owned_process_count": 4, "reclaimable_bytes": 11801444352, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 104.2995575, "owned_rss_bytes": 266452992, "owned_process_count": 4, "reclaimable_bytes": 11806556160, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 104.529798125, "owned_rss_bytes": 322076672, "owned_process_count": 4, "reclaimable_bytes": 11783225344, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 104.759824, "owned_rss_bytes": 163119104, "owned_process_count": 4, "reclaimable_bytes": 11866767360, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 104.991214042, "owned_rss_bytes": 214581248, "owned_process_count": 4, "reclaimable_bytes": 11865751552, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 105.221248042, "owned_rss_bytes": 267091968, "owned_process_count": 4, "reclaimable_bytes": 11840061440, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 105.451176125, "owned_rss_bytes": 334512128, "owned_process_count": 4, "reclaimable_bytes": 11595317248, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 105.678116084, "owned_rss_bytes": 385400832, "owned_process_count": 4, "reclaimable_bytes": 11579555840, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 105.908165667, "owned_rss_bytes": 436961280, "owned_process_count": 4, "reclaimable_bytes": 11465261056, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 106.144523167, "owned_rss_bytes": 488882176, "owned_process_count": 4, "reclaimable_bytes": 11495653376, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 106.374858125, "owned_rss_bytes": 537526272, "owned_process_count": 4, "reclaimable_bytes": 11448532992, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 106.602769167, "owned_rss_bytes": 590512128, "owned_process_count": 4, "reclaimable_bytes": 11382063104, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 106.827793834, "owned_rss_bytes": 669384704, "owned_process_count": 4, "reclaimable_bytes": 11297226752, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 107.056706292, "owned_rss_bytes": 691404800, "owned_process_count": 4, "reclaimable_bytes": 11280433152, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 107.285977875, "owned_rss_bytes": 719192064, "owned_process_count": 4, "reclaimable_bytes": 11253153792, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 107.514253167, "owned_rss_bytes": 162283520, "owned_process_count": 4, "reclaimable_bytes": 11573837824, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 107.742266334, "owned_rss_bytes": 219086848, "owned_process_count": 4, "reclaimable_bytes": 11531517952, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 107.968527917, "owned_rss_bytes": 275349504, "owned_process_count": 4, "reclaimable_bytes": 11470946304, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 108.19771225, "owned_rss_bytes": 89538560, "owned_process_count": 3, "reclaimable_bytes": 11552538624, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 108.427534459, "owned_rss_bytes": 200949760, "owned_process_count": 4, "reclaimable_bytes": 11409768448, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 108.656166834, "owned_rss_bytes": 162447360, "owned_process_count": 4, "reclaimable_bytes": 11437785088, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 108.885841209, "owned_rss_bytes": 218021888, "owned_process_count": 4, "reclaimable_bytes": 11581964288, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 109.1137495, "owned_rss_bytes": 185319424, "owned_process_count": 4, "reclaimable_bytes": 11416109056, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 109.342370917, "owned_rss_bytes": 242925568, "owned_process_count": 4, "reclaimable_bytes": 11368726528, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 109.572965834, "owned_rss_bytes": 194674688, "owned_process_count": 4, "reclaimable_bytes": 11406049280, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 109.802286459, "owned_rss_bytes": 151584768, "owned_process_count": 4, "reclaimable_bytes": 11436294144, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 110.03262375, "owned_rss_bytes": 209567744, "owned_process_count": 4, "reclaimable_bytes": 11385405440, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 110.261998625, "owned_rss_bytes": 259784704, "owned_process_count": 4, "reclaimable_bytes": 10870145024, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 110.490634084, "owned_rss_bytes": 173391872, "owned_process_count": 4, "reclaimable_bytes": 10932043776, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 110.717985375, "owned_rss_bytes": 222609408, "owned_process_count": 4, "reclaimable_bytes": 10882613248, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 110.942383125, "owned_rss_bytes": 267763712, "owned_process_count": 4, "reclaimable_bytes": 10756898816, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 111.168031375, "owned_rss_bytes": 176144384, "owned_process_count": 4, "reclaimable_bytes": 10838081536, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 111.39868470900001, "owned_rss_bytes": 226574336, "owned_process_count": 4, "reclaimable_bytes": 10840997888, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 111.625725375, "owned_rss_bytes": 187531264, "owned_process_count": 4, "reclaimable_bytes": 10861723648, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 111.8509135, "owned_rss_bytes": 240599040, "owned_process_count": 4, "reclaimable_bytes": 10934386688, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 112.07712325, "owned_rss_bytes": 192004096, "owned_process_count": 4, "reclaimable_bytes": 10878828544, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 112.307649584, "owned_rss_bytes": 94240768, "owned_process_count": 3, "reclaimable_bytes": 10931781632, "swapins": 44112339, "swapouts": 77525566}
{"elapsed_seconds": 112.534732667, "owned_rss_bytes": 199917568, "owned_process_count": 4, "reclaimable_bytes": 10878271488, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 112.766963792, "owned_rss_bytes": 255492096, "owned_process_count": 4, "reclaimable_bytes": 10827988992, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 112.998158792, "owned_rss_bytes": 193282048, "owned_process_count": 4, "reclaimable_bytes": 10878894080, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 113.225711542, "owned_rss_bytes": 185237504, "owned_process_count": 4, "reclaimable_bytes": 10887004160, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 113.455142292, "owned_rss_bytes": 237420544, "owned_process_count": 4, "reclaimable_bytes": 10908794880, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 113.687067167, "owned_rss_bytes": 287981568, "owned_process_count": 4, "reclaimable_bytes": 10833690624, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 113.920521875, "owned_rss_bytes": 333283328, "owned_process_count": 4, "reclaimable_bytes": 10982293504, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 114.145357125, "owned_rss_bytes": 381157376, "owned_process_count": 4, "reclaimable_bytes": 10947805184, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 114.37726354200001, "owned_rss_bytes": 184401920, "owned_process_count": 4, "reclaimable_bytes": 11105550336, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 114.6074175, "owned_rss_bytes": 234602496, "owned_process_count": 4, "reclaimable_bytes": 11059232768, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 114.832553, "owned_rss_bytes": 294125568, "owned_process_count": 4, "reclaimable_bytes": 11001511936, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 115.060154417, "owned_rss_bytes": 341688320, "owned_process_count": 4, "reclaimable_bytes": 10960371712, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 115.28992883400001, "owned_rss_bytes": 193085440, "owned_process_count": 4, "reclaimable_bytes": 11102371840, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 115.520520167, "owned_rss_bytes": 238403584, "owned_process_count": 4, "reclaimable_bytes": 11065065472, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 115.749612834, "owned_rss_bytes": 299761664, "owned_process_count": 4, "reclaimable_bytes": 11004641280, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 115.975719459, "owned_rss_bytes": 364019712, "owned_process_count": 4, "reclaimable_bytes": 10954211328, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 116.205868417, "owned_rss_bytes": 188940288, "owned_process_count": 4, "reclaimable_bytes": 11114528768, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 116.4368055, "owned_rss_bytes": 239943680, "owned_process_count": 4, "reclaimable_bytes": 11059118080, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 116.663576875, "owned_rss_bytes": 299991040, "owned_process_count": 4, "reclaimable_bytes": 11093983232, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 116.88949475, "owned_rss_bytes": 362856448, "owned_process_count": 4, "reclaimable_bytes": 11034017792, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 117.12012520900001, "owned_rss_bytes": 184139776, "owned_process_count": 4, "reclaimable_bytes": 11191713792, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 117.350280584, "owned_rss_bytes": 225083392, "owned_process_count": 4, "reclaimable_bytes": 11053498368, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 117.58128025, "owned_rss_bytes": 268288000, "owned_process_count": 4, "reclaimable_bytes": 10898227200, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 117.81221475, "owned_rss_bytes": 305512448, "owned_process_count": 4, "reclaimable_bytes": 10833362944, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 118.044361459, "owned_rss_bytes": 365117440, "owned_process_count": 4, "reclaimable_bytes": 10793041920, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 118.273270084, "owned_rss_bytes": 183009280, "owned_process_count": 4, "reclaimable_bytes": 10947051520, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 118.500743167, "owned_rss_bytes": 228671488, "owned_process_count": 4, "reclaimable_bytes": 10924457984, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 118.733112125, "owned_rss_bytes": 285655040, "owned_process_count": 4, "reclaimable_bytes": 10857988096, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 118.964023125, "owned_rss_bytes": 341082112, "owned_process_count": 4, "reclaimable_bytes": 10613342208, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 119.19241775, "owned_rss_bytes": 179798016, "owned_process_count": 4, "reclaimable_bytes": 10764648448, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 119.423135, "owned_rss_bytes": 231047168, "owned_process_count": 4, "reclaimable_bytes": 10724458496, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 119.650803042, "owned_rss_bytes": 288948224, "owned_process_count": 4, "reclaimable_bytes": 10755538944, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 119.88080625, "owned_rss_bytes": 348127232, "owned_process_count": 4, "reclaimable_bytes": 10712072192, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 120.110608834, "owned_rss_bytes": 179683328, "owned_process_count": 4, "reclaimable_bytes": 11044159488, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 120.341103334, "owned_rss_bytes": 231800832, "owned_process_count": 4, "reclaimable_bytes": 11022155776, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 120.571415959, "owned_rss_bytes": 297041920, "owned_process_count": 4, "reclaimable_bytes": 10956800000, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 120.80261179200001, "owned_rss_bytes": 362135552, "owned_process_count": 4, "reclaimable_bytes": 10924982272, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 121.033789834, "owned_rss_bytes": 193953792, "owned_process_count": 4, "reclaimable_bytes": 11073830912, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 121.263368209, "owned_rss_bytes": 245022720, "owned_process_count": 4, "reclaimable_bytes": 11022516224, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 121.491973, "owned_rss_bytes": 305463296, "owned_process_count": 4, "reclaimable_bytes": 10965680128, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 121.72011866700001, "owned_rss_bytes": 359104512, "owned_process_count": 4, "reclaimable_bytes": 10914578432, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 121.952343125, "owned_rss_bytes": 168722432, "owned_process_count": 4, "reclaimable_bytes": 11099832320, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 122.180640667, "owned_rss_bytes": 219922432, "owned_process_count": 4, "reclaimable_bytes": 11053383680, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 122.412293334, "owned_rss_bytes": 279707648, "owned_process_count": 4, "reclaimable_bytes": 10995187712, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 122.642974084, "owned_rss_bytes": 342310912, "owned_process_count": 4, "reclaimable_bytes": 10936696832, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 122.872688959, "owned_rss_bytes": 178274304, "owned_process_count": 4, "reclaimable_bytes": 11345969152, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 123.102235917, "owned_rss_bytes": 237797376, "owned_process_count": 4, "reclaimable_bytes": 11282825216, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 123.332130792, "owned_rss_bytes": 299483136, "owned_process_count": 4, "reclaimable_bytes": 11224694784, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 123.562089709, "owned_rss_bytes": 179126272, "owned_process_count": 4, "reclaimable_bytes": 11327406080, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 123.789548542, "owned_rss_bytes": 229818368, "owned_process_count": 4, "reclaimable_bytes": 11280318464, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 124.019869834, "owned_rss_bytes": 294518784, "owned_process_count": 4, "reclaimable_bytes": 11225251840, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 124.247741375, "owned_rss_bytes": 349356032, "owned_process_count": 4, "reclaimable_bytes": 11163893760, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 124.477386792, "owned_rss_bytes": 181878784, "owned_process_count": 4, "reclaimable_bytes": 11329667072, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 124.705897375, "owned_rss_bytes": 235372544, "owned_process_count": 4, "reclaimable_bytes": 11276369920, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 124.934175292, "owned_rss_bytes": 298467328, "owned_process_count": 4, "reclaimable_bytes": 11214225408, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 125.159074959, "owned_rss_bytes": 358612992, "owned_process_count": 4, "reclaimable_bytes": 11158880256, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 125.389118709, "owned_rss_bytes": 162070528, "owned_process_count": 4, "reclaimable_bytes": 11338235904, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 125.617753625, "owned_rss_bytes": 217513984, "owned_process_count": 4, "reclaimable_bytes": 11287609344, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 125.845033584, "owned_rss_bytes": 269451264, "owned_process_count": 4, "reclaimable_bytes": 11240112128, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 126.074485959, "owned_rss_bytes": 324452352, "owned_process_count": 4, "reclaimable_bytes": 11190796288, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 126.30154058400001, "owned_rss_bytes": 152698880, "owned_process_count": 4, "reclaimable_bytes": 11346771968, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 126.530175584, "owned_rss_bytes": 203603968, "owned_process_count": 4, "reclaimable_bytes": 11280056320, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 126.760428084, "owned_rss_bytes": 248676352, "owned_process_count": 4, "reclaimable_bytes": 11140399104, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 126.990042542, "owned_rss_bytes": 315604992, "owned_process_count": 4, "reclaimable_bytes": 11076796416, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 127.218014334, "owned_rss_bytes": 379387904, "owned_process_count": 4, "reclaimable_bytes": 11217027072, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 127.447752959, "owned_rss_bytes": 198049792, "owned_process_count": 4, "reclaimable_bytes": 11183849472, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 127.677092834, "owned_rss_bytes": 258752512, "owned_process_count": 4, "reclaimable_bytes": 11126702080, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 127.90641966700001, "owned_rss_bytes": 323207168, "owned_process_count": 4, "reclaimable_bytes": 11067752448, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 128.13422533399998, "owned_rss_bytes": 179060736, "owned_process_count": 4, "reclaimable_bytes": 11199676416, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 128.35974554199998, "owned_rss_bytes": 232013824, "owned_process_count": 4, "reclaimable_bytes": 11161878528, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 128.58600424999997, "owned_rss_bytes": 292487168, "owned_process_count": 4, "reclaimable_bytes": 10909990912, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 128.813100709, "owned_rss_bytes": 338051072, "owned_process_count": 4, "reclaimable_bytes": 10957258752, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 129.04244383399998, "owned_rss_bytes": 407126016, "owned_process_count": 4, "reclaimable_bytes": 11008655360, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 129.26634370899998, "owned_rss_bytes": 169967616, "owned_process_count": 4, "reclaimable_bytes": 11225661440, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 129.492445667, "owned_rss_bytes": 220643328, "owned_process_count": 4, "reclaimable_bytes": 11077222400, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 129.72600437499997, "owned_rss_bytes": 277544960, "owned_process_count": 4, "reclaimable_bytes": 11001774080, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 129.956446667, "owned_rss_bytes": 338821120, "owned_process_count": 4, "reclaimable_bytes": 10944069632, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 130.185802917, "owned_rss_bytes": 178143232, "owned_process_count": 4, "reclaimable_bytes": 11121131520, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 130.412078792, "owned_rss_bytes": 231014400, "owned_process_count": 4, "reclaimable_bytes": 11077025792, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 130.64139458399998, "owned_rss_bytes": 289062912, "owned_process_count": 4, "reclaimable_bytes": 11188436992, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 130.870617709, "owned_rss_bytes": 347979776, "owned_process_count": 4, "reclaimable_bytes": 11151441920, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 131.096404834, "owned_rss_bytes": 163250176, "owned_process_count": 4, "reclaimable_bytes": 11323490304, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 131.32436912499998, "owned_rss_bytes": 215007232, "owned_process_count": 4, "reclaimable_bytes": 11287707648, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 131.552663167, "owned_rss_bytes": 267681792, "owned_process_count": 4, "reclaimable_bytes": 11238555648, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 131.77843499999997, "owned_rss_bytes": 328892416, "owned_process_count": 4, "reclaimable_bytes": 11185717248, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 132.007138667, "owned_rss_bytes": 391905280, "owned_process_count": 4, "reclaimable_bytes": 11130175488, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 132.235587834, "owned_rss_bytes": 194920448, "owned_process_count": 4, "reclaimable_bytes": 11118575616, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 132.461032, "owned_rss_bytes": 247627776, "owned_process_count": 4, "reclaimable_bytes": 11071602688, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 132.689624625, "owned_rss_bytes": 308690944, "owned_process_count": 4, "reclaimable_bytes": 11013242880, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 132.91639120899998, "owned_rss_bytes": 375308288, "owned_process_count": 4, "reclaimable_bytes": 10966499328, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 133.142404084, "owned_rss_bytes": 189022208, "owned_process_count": 4, "reclaimable_bytes": 11216338944, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 133.369316667, "owned_rss_bytes": 239796224, "owned_process_count": 4, "reclaimable_bytes": 11172118528, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 133.59813416699998, "owned_rss_bytes": 298287104, "owned_process_count": 4, "reclaimable_bytes": 11121147904, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 133.82575624999998, "owned_rss_bytes": 354385920, "owned_process_count": 4, "reclaimable_bytes": 11071848448, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 134.056373834, "owned_rss_bytes": 403210240, "owned_process_count": 4, "reclaimable_bytes": 11030134784, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 134.284850125, "owned_rss_bytes": 458244096, "owned_process_count": 4, "reclaimable_bytes": 10984931328, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 134.51318129199998, "owned_rss_bytes": 168574976, "owned_process_count": 4, "reclaimable_bytes": 11242651648, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 134.74263116699998, "owned_rss_bytes": 208142336, "owned_process_count": 4, "reclaimable_bytes": 11171299328, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 134.97795125, "owned_rss_bytes": 254885888, "owned_process_count": 4, "reclaimable_bytes": 10958159872, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 135.20920991699998, "owned_rss_bytes": 311902208, "owned_process_count": 4, "reclaimable_bytes": 10891968512, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 135.43954599999998, "owned_rss_bytes": 168591360, "owned_process_count": 4, "reclaimable_bytes": 11187994624, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 135.668624334, "owned_rss_bytes": 210092032, "owned_process_count": 4, "reclaimable_bytes": 11140612096, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 135.90265674999998, "owned_rss_bytes": 255541248, "owned_process_count": 4, "reclaimable_bytes": 10734436352, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 136.133112292, "owned_rss_bytes": 300974080, "owned_process_count": 4, "reclaimable_bytes": 10685202432, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 136.37058812499998, "owned_rss_bytes": 149618688, "owned_process_count": 4, "reclaimable_bytes": 10816897024, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 136.604542834, "owned_rss_bytes": 196591616, "owned_process_count": 4, "reclaimable_bytes": 10772201472, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 136.834268084, "owned_rss_bytes": 241090560, "owned_process_count": 4, "reclaimable_bytes": 10881990656, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 137.068935375, "owned_rss_bytes": 298041344, "owned_process_count": 4, "reclaimable_bytes": 10829021184, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 137.30284724999999, "owned_rss_bytes": 367411200, "owned_process_count": 4, "reclaimable_bytes": 10871406592, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 137.53562912499999, "owned_rss_bytes": 190808064, "owned_process_count": 4, "reclaimable_bytes": 11025448960, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 137.76403649999997, "owned_rss_bytes": 224559104, "owned_process_count": 4, "reclaimable_bytes": 11070275584, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 138.023102209, "owned_rss_bytes": 266354688, "owned_process_count": 4, "reclaimable_bytes": 10845831168, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 138.255427167, "owned_rss_bytes": 316407808, "owned_process_count": 4, "reclaimable_bytes": 11800592384, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 138.487035542, "owned_rss_bytes": 160497664, "owned_process_count": 4, "reclaimable_bytes": 11938791424, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 138.714757459, "owned_rss_bytes": 209797120, "owned_process_count": 4, "reclaimable_bytes": 11792384000, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 138.949038375, "owned_rss_bytes": 251478016, "owned_process_count": 4, "reclaimable_bytes": 11678498816, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 139.18955566699998, "owned_rss_bytes": 293699584, "owned_process_count": 4, "reclaimable_bytes": 11600691200, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 139.4277065, "owned_rss_bytes": 153780224, "owned_process_count": 4, "reclaimable_bytes": 11829772288, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 139.665047209, "owned_rss_bytes": 187351040, "owned_process_count": 4, "reclaimable_bytes": 11727077376, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 139.900102334, "owned_rss_bytes": 217923584, "owned_process_count": 4, "reclaimable_bytes": 11537907712, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 140.133882667, "owned_rss_bytes": 261734400, "owned_process_count": 4, "reclaimable_bytes": 11190681600, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 140.36828145899997, "owned_rss_bytes": 311853056, "owned_process_count": 4, "reclaimable_bytes": 11171676160, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 140.60550475, "owned_rss_bytes": 345669632, "owned_process_count": 4, "reclaimable_bytes": 11110563840, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 140.84275037499998, "owned_rss_bytes": 376963072, "owned_process_count": 4, "reclaimable_bytes": 10792370176, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 141.08311866699998, "owned_rss_bytes": 420741120, "owned_process_count": 4, "reclaimable_bytes": 10435690496, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 141.319903959, "owned_rss_bytes": 159334400, "owned_process_count": 4, "reclaimable_bytes": 10661560320, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 141.552624834, "owned_rss_bytes": 196198400, "owned_process_count": 4, "reclaimable_bytes": 10622943232, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 141.792213084, "owned_rss_bytes": 228294656, "owned_process_count": 4, "reclaimable_bytes": 10643750912, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 142.02574295899998, "owned_rss_bytes": 264404992, "owned_process_count": 4, "reclaimable_bytes": 10494263296, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 142.25907966699998, "owned_rss_bytes": 309510144, "owned_process_count": 4, "reclaimable_bytes": 10446831616, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 142.49244887499998, "owned_rss_bytes": 362790912, "owned_process_count": 4, "reclaimable_bytes": 10391568384, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 142.72574566699998, "owned_rss_bytes": 393363456, "owned_process_count": 4, "reclaimable_bytes": 10358472704, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 142.963622542, "owned_rss_bytes": 437846016, "owned_process_count": 4, "reclaimable_bytes": 10327900160, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 143.204671792, "owned_rss_bytes": 454541312, "owned_process_count": 4, "reclaimable_bytes": 10587193344, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 143.442842792, "owned_rss_bytes": 176390144, "owned_process_count": 4, "reclaimable_bytes": 10552803328, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 143.678841875, "owned_rss_bytes": 215646208, "owned_process_count": 4, "reclaimable_bytes": 10514841600, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 143.916368084, "owned_rss_bytes": 259309568, "owned_process_count": 4, "reclaimable_bytes": 10490232832, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 144.157833792, "owned_rss_bytes": 305004544, "owned_process_count": 4, "reclaimable_bytes": 10439753728, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 144.39242762499998, "owned_rss_bytes": 364625920, "owned_process_count": 4, "reclaimable_bytes": 10371874816, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 144.625521792, "owned_rss_bytes": 181338112, "owned_process_count": 4, "reclaimable_bytes": 10526785536, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 144.859445334, "owned_rss_bytes": 220381184, "owned_process_count": 4, "reclaimable_bytes": 10600513536, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 145.09375583399998, "owned_rss_bytes": 269680640, "owned_process_count": 4, "reclaimable_bytes": 11250597888, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 145.326819084, "owned_rss_bytes": 313704448, "owned_process_count": 4, "reclaimable_bytes": 11224268800, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 145.56599949999998, "owned_rss_bytes": 351617024, "owned_process_count": 4, "reclaimable_bytes": 11024809984, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 145.80406516699998, "owned_rss_bytes": 127090688, "owned_process_count": 4, "reclaimable_bytes": 10883416064, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 146.045083084, "owned_rss_bytes": 187105280, "owned_process_count": 4, "reclaimable_bytes": 10660708352, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 146.279470667, "owned_rss_bytes": 226197504, "owned_process_count": 4, "reclaimable_bytes": 10615209984, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 146.511956084, "owned_rss_bytes": 265502720, "owned_process_count": 4, "reclaimable_bytes": 10571464704, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 146.74933166699998, "owned_rss_bytes": 304726016, "owned_process_count": 4, "reclaimable_bytes": 10530242560, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 146.984722334, "owned_rss_bytes": 346374144, "owned_process_count": 4, "reclaimable_bytes": 10483351552, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 147.220088667, "owned_rss_bytes": 153190400, "owned_process_count": 4, "reclaimable_bytes": 10652352512, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 147.45529929199998, "owned_rss_bytes": 190218240, "owned_process_count": 4, "reclaimable_bytes": 10610360320, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 147.68756520899998, "owned_rss_bytes": 220102656, "owned_process_count": 4, "reclaimable_bytes": 10454941696, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 147.92577441699999, "owned_rss_bytes": 265748480, "owned_process_count": 4, "reclaimable_bytes": 10405838848, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 148.15709295899998, "owned_rss_bytes": 317652992, "owned_process_count": 4, "reclaimable_bytes": 10351214592, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 148.384104375, "owned_rss_bytes": 142966784, "owned_process_count": 4, "reclaimable_bytes": 10512498688, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 148.61839849999998, "owned_rss_bytes": 188104704, "owned_process_count": 4, "reclaimable_bytes": 10481041408, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 148.85401737499998, "owned_rss_bytes": 233504768, "owned_process_count": 4, "reclaimable_bytes": 10433495040, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 149.09142683399998, "owned_rss_bytes": 268337152, "owned_process_count": 4, "reclaimable_bytes": 10403790848, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 149.32879387499997, "owned_rss_bytes": 319438848, "owned_process_count": 4, "reclaimable_bytes": 10454335488, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 149.55915687499999, "owned_rss_bytes": 171786240, "owned_process_count": 4, "reclaimable_bytes": 10596761600, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 149.79241579199999, "owned_rss_bytes": 211419136, "owned_process_count": 4, "reclaimable_bytes": 10568056832, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 150.02843575, "owned_rss_bytes": 136544256, "owned_process_count": 4, "reclaimable_bytes": 10633576448, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 150.262075209, "owned_rss_bytes": 189399040, "owned_process_count": 4, "reclaimable_bytes": 10591698944, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 150.49355462499997, "owned_rss_bytes": 230375424, "owned_process_count": 4, "reclaimable_bytes": 10588078080, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 150.727279625, "owned_rss_bytes": 269942784, "owned_process_count": 4, "reclaimable_bytes": 11313299456, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 150.96629595899998, "owned_rss_bytes": 159563776, "owned_process_count": 4, "reclaimable_bytes": 11408621568, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 151.207631459, "owned_rss_bytes": 188350464, "owned_process_count": 4, "reclaimable_bytes": 11174592512, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 151.45287091699998, "owned_rss_bytes": 223035392, "owned_process_count": 4, "reclaimable_bytes": 11138285568, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 151.68670658399998, "owned_rss_bytes": 263159808, "owned_process_count": 4, "reclaimable_bytes": 11097571328, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 151.92253875, "owned_rss_bytes": 164741120, "owned_process_count": 4, "reclaimable_bytes": 11192434688, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 152.159621, "owned_rss_bytes": 197558272, "owned_process_count": 4, "reclaimable_bytes": 11319459840, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 152.39936245899997, "owned_rss_bytes": 224641024, "owned_process_count": 4, "reclaimable_bytes": 11204460544, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 152.63847495899998, "owned_rss_bytes": 166690816, "owned_process_count": 4, "reclaimable_bytes": 11048763392, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 152.877131959, "owned_rss_bytes": 202801152, "owned_process_count": 4, "reclaimable_bytes": 10840014848, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 153.110697209, "owned_rss_bytes": 233062400, "owned_process_count": 4, "reclaimable_bytes": 10796269568, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 153.35040983399998, "owned_rss_bytes": 267026432, "owned_process_count": 4, "reclaimable_bytes": 10770169856, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 153.587307792, "owned_rss_bytes": 295288832, "owned_process_count": 4, "reclaimable_bytes": 10559438848, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 153.82328537499998, "owned_rss_bytes": 329613312, "owned_process_count": 4, "reclaimable_bytes": 10287382528, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 154.064601042, "owned_rss_bytes": 362905600, "owned_process_count": 4, "reclaimable_bytes": 10237411328, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 154.29747774999998, "owned_rss_bytes": 407879680, "owned_process_count": 4, "reclaimable_bytes": 10253746176, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 154.53397475, "owned_rss_bytes": 443039744, "owned_process_count": 4, "reclaimable_bytes": 10125574144, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 154.770541375, "owned_rss_bytes": 458702848, "owned_process_count": 4, "reclaimable_bytes": 9920020480, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 155.004556542, "owned_rss_bytes": 147406848, "owned_process_count": 4, "reclaimable_bytes": 10220617728, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 155.23758195899998, "owned_rss_bytes": 184107008, "owned_process_count": 4, "reclaimable_bytes": 10188472320, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 155.47692583399999, "owned_rss_bytes": 215105536, "owned_process_count": 4, "reclaimable_bytes": 10159702016, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 155.71391816699997, "owned_rss_bytes": 251887616, "owned_process_count": 4, "reclaimable_bytes": 9946857472, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 155.95015425, "owned_rss_bytes": 298958848, "owned_process_count": 4, "reclaimable_bytes": 9902096384, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 156.18380629199999, "owned_rss_bytes": 355909632, "owned_process_count": 4, "reclaimable_bytes": 9848258560, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 156.41674454199998, "owned_rss_bytes": 408862720, "owned_process_count": 4, "reclaimable_bytes": 9813295104, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 156.6506155, "owned_rss_bytes": 156712960, "owned_process_count": 4, "reclaimable_bytes": 10250633216, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 156.88845537499998, "owned_rss_bytes": 185434112, "owned_process_count": 4, "reclaimable_bytes": 10253172736, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 157.132342, "owned_rss_bytes": 219430912, "owned_process_count": 4, "reclaimable_bytes": 10231218176, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 157.368075875, "owned_rss_bytes": 257769472, "owned_process_count": 4, "reclaimable_bytes": 10200678400, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 157.60547874999997, "owned_rss_bytes": 311869440, "owned_process_count": 4, "reclaimable_bytes": 10149314560, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 157.83485495899998, "owned_rss_bytes": 364314624, "owned_process_count": 4, "reclaimable_bytes": 10095689728, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 158.06246016699998, "owned_rss_bytes": 431210496, "owned_process_count": 4, "reclaimable_bytes": 10033135616, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 158.28965895899998, "owned_rss_bytes": 454787072, "owned_process_count": 4, "reclaimable_bytes": 10011394048, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 158.51961195899997, "owned_rss_bytes": 188284928, "owned_process_count": 4, "reclaimable_bytes": 10252419072, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 158.748864, "owned_rss_bytes": 234242048, "owned_process_count": 4, "reclaimable_bytes": 10340679680, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 158.97574816699998, "owned_rss_bytes": 277168128, "owned_process_count": 4, "reclaimable_bytes": 10302570496, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 159.20158825, "owned_rss_bytes": 338837504, "owned_process_count": 4, "reclaimable_bytes": 10155229184, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 159.430233709, "owned_rss_bytes": 186171392, "owned_process_count": 4, "reclaimable_bytes": 10297540608, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 159.660408709, "owned_rss_bytes": 240648192, "owned_process_count": 4, "reclaimable_bytes": 10250190848, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 159.88508820899997, "owned_rss_bytes": 279773184, "owned_process_count": 4, "reclaimable_bytes": 10213933056, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 160.11530112499997, "owned_rss_bytes": 342441984, "owned_process_count": 4, "reclaimable_bytes": 10318675968, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 160.34180791699998, "owned_rss_bytes": 193789952, "owned_process_count": 4, "reclaimable_bytes": 10278010880, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 160.57145683399997, "owned_rss_bytes": 248872960, "owned_process_count": 4, "reclaimable_bytes": 10133225472, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 160.80127133399998, "owned_rss_bytes": 293552128, "owned_process_count": 4, "reclaimable_bytes": 10092445696, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 161.030878667, "owned_rss_bytes": 367591424, "owned_process_count": 4, "reclaimable_bytes": 10189504512, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 161.26410620899998, "owned_rss_bytes": 155320320, "owned_process_count": 4, "reclaimable_bytes": 10382868480, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 161.487904042, "owned_rss_bytes": 209797120, "owned_process_count": 4, "reclaimable_bytes": 10339205120, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 161.716429917, "owned_rss_bytes": 264192000, "owned_process_count": 4, "reclaimable_bytes": 10290528256, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 161.945685584, "owned_rss_bytes": 307511296, "owned_process_count": 4, "reclaimable_bytes": 10270982144, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 162.17613125, "owned_rss_bytes": 352894976, "owned_process_count": 4, "reclaimable_bytes": 10222698496, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 162.40558299999998, "owned_rss_bytes": 427130880, "owned_process_count": 4, "reclaimable_bytes": 10165207040, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 162.636493167, "owned_rss_bytes": 445775872, "owned_process_count": 4, "reclaimable_bytes": 10060120064, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 162.86639962499999, "owned_rss_bytes": 173375488, "owned_process_count": 4, "reclaimable_bytes": 10304520192, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 163.092419375, "owned_rss_bytes": 222740480, "owned_process_count": 4, "reclaimable_bytes": 10258202624, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 163.32190358399998, "owned_rss_bytes": 270811136, "owned_process_count": 4, "reclaimable_bytes": 10212278272, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 163.551095167, "owned_rss_bytes": 318488576, "owned_process_count": 4, "reclaimable_bytes": 10161782784, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 163.781191584, "owned_rss_bytes": 379289600, "owned_process_count": 4, "reclaimable_bytes": 10113007616, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 164.00648579199998, "owned_rss_bytes": 180748288, "owned_process_count": 4, "reclaimable_bytes": 10292592640, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 164.23507858399998, "owned_rss_bytes": 233242624, "owned_process_count": 4, "reclaimable_bytes": 10240933888, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 164.462153417, "owned_rss_bytes": 299024384, "owned_process_count": 4, "reclaimable_bytes": 10201923584, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 164.691807959, "owned_rss_bytes": 367575040, "owned_process_count": 4, "reclaimable_bytes": 10148151296, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 164.921872792, "owned_rss_bytes": 103104512, "owned_process_count": 4, "reclaimable_bytes": 10324590592, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 165.156477917, "owned_rss_bytes": 195231744, "owned_process_count": 4, "reclaimable_bytes": 10272112640, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 165.386144834, "owned_rss_bytes": 246333440, "owned_process_count": 4, "reclaimable_bytes": 10222223360, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 165.61342570899998, "owned_rss_bytes": 302301184, "owned_process_count": 4, "reclaimable_bytes": 10166452224, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 165.842480459, "owned_rss_bytes": 149831680, "owned_process_count": 4, "reclaimable_bytes": 10319249408, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 166.07167729199998, "owned_rss_bytes": 204423168, "owned_process_count": 4, "reclaimable_bytes": 10270081024, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 166.300082584, "owned_rss_bytes": 255737856, "owned_process_count": 4, "reclaimable_bytes": 10238771200, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 166.528434584, "owned_rss_bytes": 299712512, "owned_process_count": 4, "reclaimable_bytes": 10191962112, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 166.753831542, "owned_rss_bytes": 361250816, "owned_process_count": 4, "reclaimable_bytes": 10142941184, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 166.97849083399998, "owned_rss_bytes": 180781056, "owned_process_count": 4, "reclaimable_bytes": 10302652416, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 167.20731445899997, "owned_rss_bytes": 232898560, "owned_process_count": 4, "reclaimable_bytes": 10251173888, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 167.43775029199998, "owned_rss_bytes": 300040192, "owned_process_count": 4, "reclaimable_bytes": 10197073920, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 167.66704149999998, "owned_rss_bytes": 370753536, "owned_process_count": 4, "reclaimable_bytes": 10140532736, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 167.89682062499998, "owned_rss_bytes": 433635328, "owned_process_count": 4, "reclaimable_bytes": 10082910208, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 168.12625204199998, "owned_rss_bytes": 183418880, "owned_process_count": 4, "reclaimable_bytes": 10306273280, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 168.356637084, "owned_rss_bytes": 234143744, "owned_process_count": 4, "reclaimable_bytes": 10261266432, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 168.58459108399998, "owned_rss_bytes": 294043648, "owned_process_count": 4, "reclaimable_bytes": 10183245824, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 168.81690049999997, "owned_rss_bytes": 365641728, "owned_process_count": 4, "reclaimable_bytes": 10128457728, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 169.04409354199998, "owned_rss_bytes": 103333888, "owned_process_count": 4, "reclaimable_bytes": 10326540288, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 169.272744625, "owned_rss_bytes": 194576384, "owned_process_count": 4, "reclaimable_bytes": 10279698432, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 169.502874167, "owned_rss_bytes": 241352704, "owned_process_count": 4, "reclaimable_bytes": 10042441728, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 169.73237583399998, "owned_rss_bytes": 287555584, "owned_process_count": 4, "reclaimable_bytes": 9999302656, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 169.95912475, "owned_rss_bytes": 141967360, "owned_process_count": 4, "reclaimable_bytes": 10134618112, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 170.1848375, "owned_rss_bytes": 197574656, "owned_process_count": 4, "reclaimable_bytes": 10092511232, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 170.41181883399997, "owned_rss_bytes": 86147072, "owned_process_count": 3, "reclaimable_bytes": 10150510592, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 170.63797674999998, "owned_rss_bytes": 196640768, "owned_process_count": 4, "reclaimable_bytes": 10106863616, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 170.867780542, "owned_rss_bytes": 252133376, "owned_process_count": 4, "reclaimable_bytes": 10156163072, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 171.09642904199998, "owned_rss_bytes": 319651840, "owned_process_count": 4, "reclaimable_bytes": 10261856256, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 171.32490529199998, "owned_rss_bytes": 393068544, "owned_process_count": 4, "reclaimable_bytes": 10219405312, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 171.55467424999998, "owned_rss_bytes": 159744000, "owned_process_count": 4, "reclaimable_bytes": 10406707200, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 171.78416133399998, "owned_rss_bytes": 209977344, "owned_process_count": 4, "reclaimable_bytes": 10366353408, "swapins": 44112343, "swapouts": 77525566}
{"elapsed_seconds": 172.011327584, "owned_rss_bytes": 261898240, "owned_process_count": 4, "reclaimable_bytes": 10324656128, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 172.240599917, "owned_rss_bytes": 317390848, "owned_process_count": 4, "reclaimable_bytes": 10270998528, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 172.468040917, "owned_rss_bytes": 409157632, "owned_process_count": 4, "reclaimable_bytes": 10175922176, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 172.69743212499998, "owned_rss_bytes": 488275968, "owned_process_count": 4, "reclaimable_bytes": 10107305984, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 172.92577791699998, "owned_rss_bytes": 516145152, "owned_process_count": 4, "reclaimable_bytes": 10085122048, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 173.149945125, "owned_rss_bytes": 150847488, "owned_process_count": 4, "reclaimable_bytes": 10408542208, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 173.37687533399998, "owned_rss_bytes": 207847424, "owned_process_count": 4, "reclaimable_bytes": 10359242752, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 173.60626837499998, "owned_rss_bytes": 256753664, "owned_process_count": 4, "reclaimable_bytes": 9882632192, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 173.83468466699998, "owned_rss_bytes": 317751296, "owned_process_count": 4, "reclaimable_bytes": 9992699904, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 174.062965709, "owned_rss_bytes": 193003520, "owned_process_count": 4, "reclaimable_bytes": 9901129728, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 174.30146937499998, "owned_rss_bytes": 241827840, "owned_process_count": 4, "reclaimable_bytes": 9820356608, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 174.526608209, "owned_rss_bytes": 305512448, "owned_process_count": 4, "reclaimable_bytes": 9760620544, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 174.756178792, "owned_rss_bytes": 141148160, "owned_process_count": 4, "reclaimable_bytes": 9947185152, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 174.984879625, "owned_rss_bytes": 207306752, "owned_process_count": 4, "reclaimable_bytes": 9915695104, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 175.209108292, "owned_rss_bytes": 265912320, "owned_process_count": 4, "reclaimable_bytes": 9938894848, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 175.437763209, "owned_rss_bytes": 335986688, "owned_process_count": 4, "reclaimable_bytes": 9889693696, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 175.66130941699998, "owned_rss_bytes": 166395904, "owned_process_count": 4, "reclaimable_bytes": 10044866560, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 175.89016708399998, "owned_rss_bytes": 219398144, "owned_process_count": 4, "reclaimable_bytes": 9818669056, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 176.117486542, "owned_rss_bytes": 277037056, "owned_process_count": 4, "reclaimable_bytes": 9870000128, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 176.347277959, "owned_rss_bytes": 342130688, "owned_process_count": 4, "reclaimable_bytes": 9917218816, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 176.576371584, "owned_rss_bytes": 162234368, "owned_process_count": 4, "reclaimable_bytes": 10093035520, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 176.80138054199998, "owned_rss_bytes": 217088000, "owned_process_count": 4, "reclaimable_bytes": 10063888384, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 177.02771324999998, "owned_rss_bytes": 274677760, "owned_process_count": 4, "reclaimable_bytes": 10180575232, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 177.253915125, "owned_rss_bytes": 178421760, "owned_process_count": 4, "reclaimable_bytes": 10270916608, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 177.47916816699998, "owned_rss_bytes": 231276544, "owned_process_count": 4, "reclaimable_bytes": 10221584384, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 177.70860629199998, "owned_rss_bytes": 176553984, "owned_process_count": 4, "reclaimable_bytes": 10274226176, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 177.934637709, "owned_rss_bytes": 231014400, "owned_process_count": 4, "reclaimable_bytes": 10225860608, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 178.16139374999997, "owned_rss_bytes": 293519360, "owned_process_count": 4, "reclaimable_bytes": 10168827904, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 178.387342709, "owned_rss_bytes": 359448576, "owned_process_count": 4, "reclaimable_bytes": 9917497344, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 178.611474875, "owned_rss_bytes": 416694272, "owned_process_count": 4, "reclaimable_bytes": 9903620096, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 178.842437292, "owned_rss_bytes": 170754048, "owned_process_count": 4, "reclaimable_bytes": 10115203072, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 179.071887625, "owned_rss_bytes": 220692480, "owned_process_count": 4, "reclaimable_bytes": 10070933504, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 179.30141749999999, "owned_rss_bytes": 277757952, "owned_process_count": 4, "reclaimable_bytes": 10019127296, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 179.52774724999998, "owned_rss_bytes": 346308608, "owned_process_count": 4, "reclaimable_bytes": 10145660928, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 179.75401079199997, "owned_rss_bytes": 407928832, "owned_process_count": 4, "reclaimable_bytes": 10095525888, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 179.983647042, "owned_rss_bytes": 165675008, "owned_process_count": 4, "reclaimable_bytes": 10326654976, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 180.21137954199997, "owned_rss_bytes": 217432064, "owned_process_count": 4, "reclaimable_bytes": 10449846272, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 180.43901849999997, "owned_rss_bytes": 269975552, "owned_process_count": 4, "reclaimable_bytes": 10438803456, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 180.66458899999998, "owned_rss_bytes": 177602560, "owned_process_count": 4, "reclaimable_bytes": 10558455808, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 180.894008959, "owned_rss_bytes": 167903232, "owned_process_count": 4, "reclaimable_bytes": 10575478784, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 181.122698209, "owned_rss_bytes": 222724096, "owned_process_count": 4, "reclaimable_bytes": 10536206336, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 181.35090012499998, "owned_rss_bytes": 272449536, "owned_process_count": 4, "reclaimable_bytes": 10298064896, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 181.57894695899998, "owned_rss_bytes": 325828608, "owned_process_count": 4, "reclaimable_bytes": 10243768320, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 181.808006792, "owned_rss_bytes": 384122880, "owned_process_count": 4, "reclaimable_bytes": 10180755456, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 182.03671774999998, "owned_rss_bytes": 494174208, "owned_process_count": 4, "reclaimable_bytes": 9892675584, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 182.26632725, "owned_rss_bytes": 511344640, "owned_process_count": 4, "reclaimable_bytes": 9868263424, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 182.49470920899998, "owned_rss_bytes": 150274048, "owned_process_count": 4, "reclaimable_bytes": 10365550592, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 182.723914625, "owned_rss_bytes": 209567744, "owned_process_count": 4, "reclaimable_bytes": 10318315520, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 182.952113584, "owned_rss_bytes": 267452416, "owned_process_count": 4, "reclaimable_bytes": 10286071808, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 183.18022970899997, "owned_rss_bytes": 342638592, "owned_process_count": 4, "reclaimable_bytes": 10225270784, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 183.404904792, "owned_rss_bytes": 406831104, "owned_process_count": 4, "reclaimable_bytes": 10175774720, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 183.633282875, "owned_rss_bytes": 463323136, "owned_process_count": 4, "reclaimable_bytes": 10126032896, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 183.85979941699998, "owned_rss_bytes": 190038016, "owned_process_count": 4, "reclaimable_bytes": 10367516672, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 184.08844499999998, "owned_rss_bytes": 239009792, "owned_process_count": 4, "reclaimable_bytes": 10323869696, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 184.31829495899999, "owned_rss_bytes": 307134464, "owned_process_count": 4, "reclaimable_bytes": 10265640960, "swapins": 44112351, "swapouts": 77525566}
{"elapsed_seconds": 184.546637875, "owned_rss_bytes": 379535360, "owned_process_count": 4, "reclaimable_bytes": 10202202112, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 184.7747355, "owned_rss_bytes": 148324352, "owned_process_count": 4, "reclaimable_bytes": 10394189824, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 185.00349229199998, "owned_rss_bytes": 207831040, "owned_process_count": 4, "reclaimable_bytes": 10070409216, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 185.230142125, "owned_rss_bytes": 260063232, "owned_process_count": 4, "reclaimable_bytes": 10012999680, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 185.458945917, "owned_rss_bytes": 304218112, "owned_process_count": 4, "reclaimable_bytes": 9969467392, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 185.68939070899998, "owned_rss_bytes": 352665600, "owned_process_count": 4, "reclaimable_bytes": 9922822144, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 185.919527375, "owned_rss_bytes": 402997248, "owned_process_count": 4, "reclaimable_bytes": 9886318592, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 186.145536959, "owned_rss_bytes": 448856064, "owned_process_count": 4, "reclaimable_bytes": 9841426432, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 186.36960975, "owned_rss_bytes": 538001408, "owned_process_count": 4, "reclaimable_bytes": 9819029504, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 186.59929337499997, "owned_rss_bytes": 631504896, "owned_process_count": 4, "reclaimable_bytes": 9725673472, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 186.82566774999998, "owned_rss_bytes": 866238464, "owned_process_count": 4, "reclaimable_bytes": 9507749888, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 187.054992334, "owned_rss_bytes": 885719040, "owned_process_count": 4, "reclaimable_bytes": 9490989056, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 187.279159917, "owned_rss_bytes": 908623872, "owned_process_count": 4, "reclaimable_bytes": 9557131264, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 187.50750433399998, "owned_rss_bytes": 925761536, "owned_process_count": 4, "reclaimable_bytes": 9538584576, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 187.73456804199998, "owned_rss_bytes": 958595072, "owned_process_count": 4, "reclaimable_bytes": 9503719424, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 187.96490037499998, "owned_rss_bytes": 975273984, "owned_process_count": 4, "reclaimable_bytes": 9482846208, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 188.195535584, "owned_rss_bytes": 163053568, "owned_process_count": 4, "reclaimable_bytes": 10286153728, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 188.424821542, "owned_rss_bytes": 218988544, "owned_process_count": 4, "reclaimable_bytes": 10241654784, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 188.651345709, "owned_rss_bytes": 274644992, "owned_process_count": 4, "reclaimable_bytes": 10185506816, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 188.88015962499998, "owned_rss_bytes": 167837696, "owned_process_count": 4, "reclaimable_bytes": 10467459072, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 189.109112959, "owned_rss_bytes": 220020736, "owned_process_count": 4, "reclaimable_bytes": 10436100096, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 189.33743725, "owned_rss_bytes": 157597696, "owned_process_count": 4, "reclaimable_bytes": 10484875264, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 189.56223337499998, "owned_rss_bytes": 214073344, "owned_process_count": 4, "reclaimable_bytes": 10440540160, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 189.791329709, "owned_rss_bytes": 159186944, "owned_process_count": 4, "reclaimable_bytes": 10485383168, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 190.019402125, "owned_rss_bytes": 216383488, "owned_process_count": 4, "reclaimable_bytes": 10440687616, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 190.24842145899999, "owned_rss_bytes": 150863872, "owned_process_count": 4, "reclaimable_bytes": 10485596160, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 190.47709195899998, "owned_rss_bytes": 209862656, "owned_process_count": 4, "reclaimable_bytes": 10437378048, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 190.70118112499998, "owned_rss_bytes": 267960320, "owned_process_count": 4, "reclaimable_bytes": 10385440768, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 190.93088095899998, "owned_rss_bytes": 178470912, "owned_process_count": 4, "reclaimable_bytes": 10468835328, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 191.15914387499998, "owned_rss_bytes": 232931328, "owned_process_count": 4, "reclaimable_bytes": 10421649408, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 191.38493183399999, "owned_rss_bytes": 103809024, "owned_process_count": 4, "reclaimable_bytes": 10494607360, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 191.610979125, "owned_rss_bytes": 198328320, "owned_process_count": 4, "reclaimable_bytes": 10454188032, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 191.839326167, "owned_rss_bytes": 251428864, "owned_process_count": 4, "reclaimable_bytes": 10402414592, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 192.066526459, "owned_rss_bytes": 166625280, "owned_process_count": 4, "reclaimable_bytes": 10478206976, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 192.295195917, "owned_rss_bytes": 221396992, "owned_process_count": 4, "reclaimable_bytes": 10435543040, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 192.524193417, "owned_rss_bytes": 171524096, "owned_process_count": 4, "reclaimable_bytes": 10478534656, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 192.75357187499998, "owned_rss_bytes": 225935360, "owned_process_count": 4, "reclaimable_bytes": 10446520320, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 192.98228320899997, "owned_rss_bytes": 287735808, "owned_process_count": 4, "reclaimable_bytes": 10388062208, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 193.210954959, "owned_rss_bytes": 86540288, "owned_process_count": 3, "reclaimable_bytes": 10518151168, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 193.43799991699998, "owned_rss_bytes": 86753280, "owned_process_count": 3, "reclaimable_bytes": 10430103552, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 193.666049709, "owned_rss_bytes": 103923712, "owned_process_count": 3, "reclaimable_bytes": 10424074240, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 193.889035875, "owned_rss_bytes": 176979968, "owned_process_count": 4, "reclaimable_bytes": 10396844032, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 194.117380417, "owned_rss_bytes": 230703104, "owned_process_count": 4, "reclaimable_bytes": 10352689152, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 194.347935125, "owned_rss_bytes": 286015488, "owned_process_count": 4, "reclaimable_bytes": 10380558336, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 194.57587783399998, "owned_rss_bytes": 332414976, "owned_process_count": 4, "reclaimable_bytes": 10408329216, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 194.802133417, "owned_rss_bytes": 164642816, "owned_process_count": 4, "reclaimable_bytes": 10655563776, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 195.030786667, "owned_rss_bytes": 219709440, "owned_process_count": 4, "reclaimable_bytes": 10635657216, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 195.25928333399997, "owned_rss_bytes": 270286848, "owned_process_count": 4, "reclaimable_bytes": 10601512960, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 195.48825383399998, "owned_rss_bytes": 174997504, "owned_process_count": 4, "reclaimable_bytes": 10691788800, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 195.71659879199998, "owned_rss_bytes": 225214464, "owned_process_count": 4, "reclaimable_bytes": 10458021888, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 195.941841459, "owned_rss_bytes": 277364736, "owned_process_count": 4, "reclaimable_bytes": 10405150720, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 196.1723835, "owned_rss_bytes": 164478976, "owned_process_count": 4, "reclaimable_bytes": 10409410560, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 196.400260875, "owned_rss_bytes": 220086272, "owned_process_count": 4, "reclaimable_bytes": 10162061312, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 196.62995812499997, "owned_rss_bytes": 276316160, "owned_process_count": 4, "reclaimable_bytes": 10218405888, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 196.85660837499998, "owned_rss_bytes": 177143808, "owned_process_count": 4, "reclaimable_bytes": 10310189056, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 197.084680459, "owned_rss_bytes": 232325120, "owned_process_count": 4, "reclaimable_bytes": 10260103168, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 197.31344016699998, "owned_rss_bytes": 287260672, "owned_process_count": 4, "reclaimable_bytes": 10204839936, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 197.5424175, "owned_rss_bytes": 187744256, "owned_process_count": 4, "reclaimable_bytes": 10293035008, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 197.768056917, "owned_rss_bytes": 241008640, "owned_process_count": 4, "reclaimable_bytes": 10242719744, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 197.99608991699998, "owned_rss_bytes": 110280704, "owned_process_count": 4, "reclaimable_bytes": 10325835776, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 198.225579459, "owned_rss_bytes": 194887680, "owned_process_count": 4, "reclaimable_bytes": 10275504128, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 198.451150875, "owned_rss_bytes": 244219904, "owned_process_count": 4, "reclaimable_bytes": 10228056064, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 198.67841762499998, "owned_rss_bytes": 133300224, "owned_process_count": 4, "reclaimable_bytes": 10316185600, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 198.906103584, "owned_rss_bytes": 202571776, "owned_process_count": 4, "reclaimable_bytes": 10271064064, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 199.134031459, "owned_rss_bytes": 255901696, "owned_process_count": 4, "reclaimable_bytes": 10388078592, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 199.36300312499998, "owned_rss_bytes": 150683648, "owned_process_count": 4, "reclaimable_bytes": 10551492608, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 199.59049987499998, "owned_rss_bytes": 208912384, "owned_process_count": 4, "reclaimable_bytes": 10515955712, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 199.818543834, "owned_rss_bytes": 265273344, "owned_process_count": 4, "reclaimable_bytes": 10472456192, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 200.046944417, "owned_rss_bytes": 324157440, "owned_process_count": 4, "reclaimable_bytes": 10603659264, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 200.271383209, "owned_rss_bytes": 197623808, "owned_process_count": 4, "reclaimable_bytes": 10646175744, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 200.500547292, "owned_rss_bytes": 253231104, "owned_process_count": 4, "reclaimable_bytes": 10592583680, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 200.729166, "owned_rss_bytes": 158793728, "owned_process_count": 4, "reclaimable_bytes": 10695475200, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 200.953075125, "owned_rss_bytes": 215465984, "owned_process_count": 4, "reclaimable_bytes": 10658807808, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 201.18102787499998, "owned_rss_bytes": 270548992, "owned_process_count": 4, "reclaimable_bytes": 10608607232, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 201.40923487499998, "owned_rss_bytes": 178667520, "owned_process_count": 4, "reclaimable_bytes": 10690117632, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 201.63605941699998, "owned_rss_bytes": 234913792, "owned_process_count": 4, "reclaimable_bytes": 10642243584, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 201.86491512499998, "owned_rss_bytes": 292077568, "owned_process_count": 4, "reclaimable_bytes": 10583916544, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 202.092993292, "owned_rss_bytes": 188841984, "owned_process_count": 4, "reclaimable_bytes": 10765565952, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 202.32036491699998, "owned_rss_bytes": 243859456, "owned_process_count": 4, "reclaimable_bytes": 10723377152, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 202.54815158399998, "owned_rss_bytes": 125452288, "owned_process_count": 4, "reclaimable_bytes": 10809049088, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 202.776163917, "owned_rss_bytes": 203964416, "owned_process_count": 4, "reclaimable_bytes": 10769760256, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 203.00308041699998, "owned_rss_bytes": 258670592, "owned_process_count": 4, "reclaimable_bytes": 10715987968, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 203.231038292, "owned_rss_bytes": 164167680, "owned_process_count": 4, "reclaimable_bytes": 10805821440, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 203.458332459, "owned_rss_bytes": 221642752, "owned_process_count": 4, "reclaimable_bytes": 10756866048, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 203.68590312499998, "owned_rss_bytes": 280035328, "owned_process_count": 4, "reclaimable_bytes": 10699358208, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 203.913051084, "owned_rss_bytes": 176832512, "owned_process_count": 4, "reclaimable_bytes": 10794483712, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 204.13644845899998, "owned_rss_bytes": 231636992, "owned_process_count": 4, "reclaimable_bytes": 10778640384, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 204.36490579199997, "owned_rss_bytes": 287195136, "owned_process_count": 4, "reclaimable_bytes": 10726440960, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 204.588750834, "owned_rss_bytes": 192266240, "owned_process_count": 4, "reclaimable_bytes": 10818027520, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 204.816755084, "owned_rss_bytes": 249004032, "owned_process_count": 4, "reclaimable_bytes": 10768646144, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 205.044290292, "owned_rss_bytes": 313196544, "owned_process_count": 4, "reclaimable_bytes": 10716266496, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 205.27124841699998, "owned_rss_bytes": 192348160, "owned_process_count": 4, "reclaimable_bytes": 10814898176, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 205.493648834, "owned_rss_bytes": 247463936, "owned_process_count": 4, "reclaimable_bytes": 10771611648, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 205.71812724999998, "owned_rss_bytes": 140312576, "owned_process_count": 4, "reclaimable_bytes": 10849239040, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 205.94575362499998, "owned_rss_bytes": 207749120, "owned_process_count": 4, "reclaimable_bytes": 10806509568, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 206.17302375, "owned_rss_bytes": 196722688, "owned_process_count": 4, "reclaimable_bytes": 10816208896, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 206.39749229199998, "owned_rss_bytes": 252526592, "owned_process_count": 4, "reclaimable_bytes": 10764599296, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 206.625175375, "owned_rss_bytes": 142229504, "owned_process_count": 4, "reclaimable_bytes": 10866720768, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 206.85255437499998, "owned_rss_bytes": 207175680, "owned_process_count": 4, "reclaimable_bytes": 10824466432, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 207.07624525, "owned_rss_bytes": 260456448, "owned_process_count": 4, "reclaimable_bytes": 10772021248, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 207.30410775, "owned_rss_bytes": 168542208, "owned_process_count": 4, "reclaimable_bytes": 10858151936, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 207.53279708399998, "owned_rss_bytes": 220020736, "owned_process_count": 4, "reclaimable_bytes": 10700111872, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 207.760730417, "owned_rss_bytes": 272482304, "owned_process_count": 4, "reclaimable_bytes": 10652336128, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 207.98468095899997, "owned_rss_bytes": 172752896, "owned_process_count": 4, "reclaimable_bytes": 10620600320, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 208.216954709, "owned_rss_bytes": 224542720, "owned_process_count": 4, "reclaimable_bytes": 10546610176, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 208.445148542, "owned_rss_bytes": 282787840, "owned_process_count": 4, "reclaimable_bytes": 10494525440, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 208.67211658399998, "owned_rss_bytes": 161382400, "owned_process_count": 4, "reclaimable_bytes": 10600644608, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 208.89784816699998, "owned_rss_bytes": 212631552, "owned_process_count": 4, "reclaimable_bytes": 10495688704, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 209.127019542, "owned_rss_bytes": 258457600, "owned_process_count": 4, "reclaimable_bytes": 10915233792, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 209.35495104199998, "owned_rss_bytes": 313245696, "owned_process_count": 4, "reclaimable_bytes": 10817503232, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 209.582761584, "owned_rss_bytes": 367706112, "owned_process_count": 4, "reclaimable_bytes": 10711203840, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 209.812303875, "owned_rss_bytes": 165904384, "owned_process_count": 4, "reclaimable_bytes": 10823024640, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 210.038532334, "owned_rss_bytes": 203849728, "owned_process_count": 4, "reclaimable_bytes": 10678452224, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 210.268241709, "owned_rss_bytes": 220938240, "owned_process_count": 4, "reclaimable_bytes": 10621943808, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 210.49874433399998, "owned_rss_bytes": 96452608, "owned_process_count": 3, "reclaimable_bytes": 10680631296, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 210.72686420899998, "owned_rss_bytes": 199933952, "owned_process_count": 4, "reclaimable_bytes": 10635902976, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 210.956292292, "owned_rss_bytes": 252329984, "owned_process_count": 4, "reclaimable_bytes": 10583982080, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 211.185665667, "owned_rss_bytes": 172474368, "owned_process_count": 4, "reclaimable_bytes": 10643488768, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 211.412970334, "owned_rss_bytes": 272121856, "owned_process_count": 4, "reclaimable_bytes": 10584915968, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 211.637809375, "owned_rss_bytes": 325222400, "owned_process_count": 4, "reclaimable_bytes": 10556194816, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 211.86654912499998, "owned_rss_bytes": 367509504, "owned_process_count": 4, "reclaimable_bytes": 10530226176, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 212.091928167, "owned_rss_bytes": 268697600, "owned_process_count": 4, "reclaimable_bytes": 10602987520, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 212.31869458399999, "owned_rss_bytes": 289013760, "owned_process_count": 4, "reclaimable_bytes": 10582360064, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 212.547702792, "owned_rss_bytes": 336003072, "owned_process_count": 4, "reclaimable_bytes": 10586669056, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 212.775327667, "owned_rss_bytes": 344965120, "owned_process_count": 4, "reclaimable_bytes": 10580180992, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 213.003152667, "owned_rss_bytes": 350322688, "owned_process_count": 4, "reclaimable_bytes": 10559569920, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 213.230839334, "owned_rss_bytes": 362037248, "owned_process_count": 4, "reclaimable_bytes": 10550591488, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 213.45771724999997, "owned_rss_bytes": 367427584, "owned_process_count": 4, "reclaimable_bytes": 10630692864, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 213.683762667, "owned_rss_bytes": 380354560, "owned_process_count": 4, "reclaimable_bytes": 10623172608, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 213.910218959, "owned_rss_bytes": 381616128, "owned_process_count": 4, "reclaimable_bytes": 10582425600, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 214.13505874999998, "owned_rss_bytes": 518569984, "owned_process_count": 4, "reclaimable_bytes": 10365992960, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 214.36491825, "owned_rss_bytes": 125485056, "owned_process_count": 3, "reclaimable_bytes": 10617110528, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 214.59388925, "owned_rss_bytes": 272809984, "owned_process_count": 4, "reclaimable_bytes": 10553327616, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 214.820590375, "owned_rss_bytes": 327467008, "owned_process_count": 4, "reclaimable_bytes": 10527277056, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 215.04454991699998, "owned_rss_bytes": 343244800, "owned_process_count": 4, "reclaimable_bytes": 10508959744, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 215.273763667, "owned_rss_bytes": 359874560, "owned_process_count": 4, "reclaimable_bytes": 10495803392, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 215.50203704199998, "owned_rss_bytes": 362692608, "owned_process_count": 4, "reclaimable_bytes": 10495361024, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 215.727023167, "owned_rss_bytes": 365936640, "owned_process_count": 4, "reclaimable_bytes": 10319577088, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 215.95209574999998, "owned_rss_bytes": 372686848, "owned_process_count": 4, "reclaimable_bytes": 10317398016, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 216.18108387499998, "owned_rss_bytes": 209649664, "owned_process_count": 4, "reclaimable_bytes": 10418012160, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 216.409145334, "owned_rss_bytes": 242532352, "owned_process_count": 4, "reclaimable_bytes": 10401480704, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 216.637323125, "owned_rss_bytes": 251543552, "owned_process_count": 4, "reclaimable_bytes": 10551721984, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 216.865077292, "owned_rss_bytes": 274186240, "owned_process_count": 4, "reclaimable_bytes": 10554441728, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 217.0934575, "owned_rss_bytes": 233799680, "owned_process_count": 4, "reclaimable_bytes": 10580066304, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 217.32061258399997, "owned_rss_bytes": 260177920, "owned_process_count": 4, "reclaimable_bytes": 10355998720, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 217.551252167, "owned_rss_bytes": 270778368, "owned_process_count": 4, "reclaimable_bytes": 10349297664, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 217.77943358399997, "owned_rss_bytes": 280084480, "owned_process_count": 4, "reclaimable_bytes": 10339254272, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 218.008227417, "owned_rss_bytes": 286736384, "owned_process_count": 4, "reclaimable_bytes": 10316578816, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 218.241144792, "owned_rss_bytes": 320847872, "owned_process_count": 4, "reclaimable_bytes": 10292592640, "swapins": 44112355, "swapouts": 77525566}
{"elapsed_seconds": 218.46938791699998, "owned_rss_bytes": 327155712, "owned_process_count": 4, "reclaimable_bytes": 10465509376, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 218.69458104199998, "owned_rss_bytes": 335872000, "owned_process_count": 4, "reclaimable_bytes": 10457858048, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 218.91827437499998, "owned_rss_bytes": 336887808, "owned_process_count": 4, "reclaimable_bytes": 10442326016, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 219.14722866699998, "owned_rss_bytes": 127500288, "owned_process_count": 4, "reclaimable_bytes": 10560274432, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 219.375816792, "owned_rss_bytes": 204259328, "owned_process_count": 4, "reclaimable_bytes": 10916364288, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 219.60514583399998, "owned_rss_bytes": 292978688, "owned_process_count": 4, "reclaimable_bytes": 10858938368, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 219.832277292, "owned_rss_bytes": 271302656, "owned_process_count": 4, "reclaimable_bytes": 10837245952, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 220.06338995899998, "owned_rss_bytes": 351764480, "owned_process_count": 4, "reclaimable_bytes": 10752851968, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 220.293652792, "owned_rss_bytes": 368623616, "owned_process_count": 4, "reclaimable_bytes": 10726965248, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 220.522507167, "owned_rss_bytes": 408436736, "owned_process_count": 4, "reclaimable_bytes": 10359963648, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 220.75802241699998, "owned_rss_bytes": 427343872, "owned_process_count": 4, "reclaimable_bytes": 10308648960, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 220.985274584, "owned_rss_bytes": 433455104, "owned_process_count": 4, "reclaimable_bytes": 10315382784, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 221.211417959, "owned_rss_bytes": 445448192, "owned_process_count": 4, "reclaimable_bytes": 10301882368, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 221.437086459, "owned_rss_bytes": 468418560, "owned_process_count": 4, "reclaimable_bytes": 10277683200, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 221.66369154199998, "owned_rss_bytes": 416251904, "owned_process_count": 4, "reclaimable_bytes": 10344529920, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 221.88747379199998, "owned_rss_bytes": 445693952, "owned_process_count": 4, "reclaimable_bytes": 10789175296, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 222.11560383399998, "owned_rss_bytes": 477003776, "owned_process_count": 4, "reclaimable_bytes": 10779295744, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 222.34551862499998, "owned_rss_bytes": 509263872, "owned_process_count": 4, "reclaimable_bytes": 10758717440, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 222.568222709, "owned_rss_bytes": 283115520, "owned_process_count": 4, "reclaimable_bytes": 11020910592, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 222.796285792, "owned_rss_bytes": 314048512, "owned_process_count": 4, "reclaimable_bytes": 11004542976, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 223.02410454199998, "owned_rss_bytes": 340393984, "owned_process_count": 4, "reclaimable_bytes": 10791960576, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 223.251359209, "owned_rss_bytes": 351289344, "owned_process_count": 4, "reclaimable_bytes": 10768105472, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 223.48036416699998, "owned_rss_bytes": 400932864, "owned_process_count": 4, "reclaimable_bytes": 10724769792, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 223.70764337499998, "owned_rss_bytes": 410386432, "owned_process_count": 4, "reclaimable_bytes": 10640015360, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 223.936595125, "owned_rss_bytes": 421199872, "owned_process_count": 4, "reclaimable_bytes": 10630430720, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 224.16585154199998, "owned_rss_bytes": 425017344, "owned_process_count": 4, "reclaimable_bytes": 10627465216, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 224.3900505, "owned_rss_bytes": 440385536, "owned_process_count": 4, "reclaimable_bytes": 10608492544, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 224.6171545, "owned_rss_bytes": 442138624, "owned_process_count": 4, "reclaimable_bytes": 10570809344, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 224.847266542, "owned_rss_bytes": 448102400, "owned_process_count": 4, "reclaimable_bytes": 9629827072, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 225.082029084, "owned_rss_bytes": 455131136, "owned_process_count": 4, "reclaimable_bytes": 9386704896, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 225.31238570899998, "owned_rss_bytes": 471875584, "owned_process_count": 4, "reclaimable_bytes": 9231171584, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 225.545390084, "owned_rss_bytes": 496861184, "owned_process_count": 4, "reclaimable_bytes": 9226551296, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 225.77585108399998, "owned_rss_bytes": 304119808, "owned_process_count": 4, "reclaimable_bytes": 9385082880, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 226.00811679199998, "owned_rss_bytes": 322011136, "owned_process_count": 4, "reclaimable_bytes": 9209708544, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 226.25222333399998, "owned_rss_bytes": 326107136, "owned_process_count": 4, "reclaimable_bytes": 9142091776, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 226.48287441699998, "owned_rss_bytes": 330088448, "owned_process_count": 4, "reclaimable_bytes": 9143959552, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 226.7136655, "owned_rss_bytes": 335233024, "owned_process_count": 4, "reclaimable_bytes": 9147252736, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 226.94359333399998, "owned_rss_bytes": 339132416, "owned_process_count": 4, "reclaimable_bytes": 9133883392, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 227.17356049999998, "owned_rss_bytes": 343932928, "owned_process_count": 4, "reclaimable_bytes": 9079521280, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 227.408097334, "owned_rss_bytes": 348766208, "owned_process_count": 4, "reclaimable_bytes": 9051619328, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 227.63900562499998, "owned_rss_bytes": 352747520, "owned_process_count": 4, "reclaimable_bytes": 9029681152, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 227.868095375, "owned_rss_bytes": 357744640, "owned_process_count": 4, "reclaimable_bytes": 8695185408, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 228.09869395899997, "owned_rss_bytes": 361971712, "owned_process_count": 4, "reclaimable_bytes": 8765734912, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 228.33071866699999, "owned_rss_bytes": 366280704, "owned_process_count": 4, "reclaimable_bytes": 8755412992, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 228.559220709, "owned_rss_bytes": 361086976, "owned_process_count": 4, "reclaimable_bytes": 8677883904, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 228.792124584, "owned_rss_bytes": 365133824, "owned_process_count": 4, "reclaimable_bytes": 8684994560, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 229.02655074999998, "owned_rss_bytes": 369508352, "owned_process_count": 4, "reclaimable_bytes": 8700887040, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 229.256557209, "owned_rss_bytes": 374407168, "owned_process_count": 4, "reclaimable_bytes": 8710914048, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 229.492516167, "owned_rss_bytes": 381517824, "owned_process_count": 4, "reclaimable_bytes": 8702476288, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 229.723831, "owned_rss_bytes": 384909312, "owned_process_count": 4, "reclaimable_bytes": 8857108480, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 229.95813570899998, "owned_rss_bytes": 392724480, "owned_process_count": 4, "reclaimable_bytes": 8866463744, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 230.19281370899998, "owned_rss_bytes": 397148160, "owned_process_count": 4, "reclaimable_bytes": 8862842880, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 230.425181792, "owned_rss_bytes": 399605760, "owned_process_count": 4, "reclaimable_bytes": 8838791168, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 230.658550167, "owned_rss_bytes": 399851520, "owned_process_count": 4, "reclaimable_bytes": 8837283840, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 230.890004834, "owned_rss_bytes": 400015360, "owned_process_count": 4, "reclaimable_bytes": 8831500288, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 231.11701216699998, "owned_rss_bytes": 400015360, "owned_process_count": 4, "reclaimable_bytes": 8829550592, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 231.348537459, "owned_rss_bytes": 408387584, "owned_process_count": 4, "reclaimable_bytes": 8789852160, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 231.577181084, "owned_rss_bytes": 443596800, "owned_process_count": 4, "reclaimable_bytes": 8740126720, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 231.810770417, "owned_rss_bytes": 444104704, "owned_process_count": 4, "reclaimable_bytes": 8763539456, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 232.042144042, "owned_rss_bytes": 469647360, "owned_process_count": 4, "reclaimable_bytes": 8746369024, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 232.27324937499998, "owned_rss_bytes": 474660864, "owned_process_count": 4, "reclaimable_bytes": 8736047104, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 232.507642042, "owned_rss_bytes": 479559680, "owned_process_count": 4, "reclaimable_bytes": 8733065216, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 232.739335625, "owned_rss_bytes": 481198080, "owned_process_count": 4, "reclaimable_bytes": 8737439744, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 232.966500167, "owned_rss_bytes": 482050048, "owned_process_count": 4, "reclaimable_bytes": 8752709632, "swapins": 44112359, "swapouts": 77525566}
{"elapsed_seconds": 233.196751625, "owned_rss_bytes": 482656256, "owned_process_count": 4, "reclaimable_bytes": 8741306368, "swapins": 44112363, "swapouts": 77525566}
{"elapsed_seconds": 233.432031417, "owned_rss_bytes": 483721216, "owned_process_count": 4, "reclaimable_bytes": 8734916608, "swapins": 44112363, "swapouts": 77525566}
{"elapsed_seconds": 233.66589549999998, "owned_rss_bytes": 500088832, "owned_process_count": 4, "reclaimable_bytes": 8772927488, "swapins": 44112363, "swapouts": 77525566}
{"elapsed_seconds": 233.898833834, "owned_rss_bytes": 501694464, "owned_process_count": 4, "reclaimable_bytes": 8765145088, "swapins": 44112363, "swapouts": 77525566}
{"elapsed_seconds": 234.134248209, "owned_rss_bytes": 135970816, "owned_process_count": 4, "reclaimable_bytes": 8981610496, "swapins": 44112363, "swapouts": 77525566}
{"elapsed_seconds": 234.36709470899999, "owned_rss_bytes": 311263232, "owned_process_count": 4, "reclaimable_bytes": 8923971584, "swapins": 44112363, "swapouts": 77525566}
{"elapsed_seconds": 234.6011125, "owned_rss_bytes": 331137024, "owned_process_count": 4, "reclaimable_bytes": 8906883072, "swapins": 44112363, "swapouts": 77525566}
{"elapsed_seconds": 234.83031316699999, "owned_rss_bytes": 344932352, "owned_process_count": 4, "reclaimable_bytes": 8744189952, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 235.06318825, "owned_rss_bytes": 358350848, "owned_process_count": 4, "reclaimable_bytes": 8729477120, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 235.29250804199998, "owned_rss_bytes": 370032640, "owned_process_count": 4, "reclaimable_bytes": 8721891328, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 235.52550879199998, "owned_rss_bytes": 397688832, "owned_process_count": 4, "reclaimable_bytes": 8724365312, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 235.75887179199998, "owned_rss_bytes": 426524672, "owned_process_count": 4, "reclaimable_bytes": 8729477120, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 235.989353334, "owned_rss_bytes": 441647104, "owned_process_count": 4, "reclaimable_bytes": 8945713152, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 236.22094662499998, "owned_rss_bytes": 457113600, "owned_process_count": 4, "reclaimable_bytes": 9021407232, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 236.450495, "owned_rss_bytes": 457474048, "owned_process_count": 4, "reclaimable_bytes": 9024323584, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 236.68275079199998, "owned_rss_bytes": 458768384, "owned_process_count": 4, "reclaimable_bytes": 9025077248, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 236.913780334, "owned_rss_bytes": 459849728, "owned_process_count": 4, "reclaimable_bytes": 9047293952, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 237.14908075, "owned_rss_bytes": 465076224, "owned_process_count": 4, "reclaimable_bytes": 9001025536, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 237.38114133399998, "owned_rss_bytes": 474038272, "owned_process_count": 4, "reclaimable_bytes": 8999174144, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 237.611336459, "owned_rss_bytes": 478347264, "owned_process_count": 4, "reclaimable_bytes": 8992292864, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 237.84254712499998, "owned_rss_bytes": 478937088, "owned_process_count": 4, "reclaimable_bytes": 8987656192, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 238.07384804199998, "owned_rss_bytes": 482836480, "owned_process_count": 4, "reclaimable_bytes": 8988114944, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 238.301725875, "owned_rss_bytes": 502824960, "owned_process_count": 4, "reclaimable_bytes": 8962785280, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 238.534022459, "owned_rss_bytes": 540704768, "owned_process_count": 4, "reclaimable_bytes": 8942043136, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 238.76438762499998, "owned_rss_bytes": 172752896, "owned_process_count": 4, "reclaimable_bytes": 9186279424, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 238.991532542, "owned_rss_bytes": 192741376, "owned_process_count": 4, "reclaimable_bytes": 9158000640, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 239.22163512499998, "owned_rss_bytes": 283918336, "owned_process_count": 4, "reclaimable_bytes": 9129148416, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 239.450608, "owned_rss_bytes": 291684352, "owned_process_count": 4, "reclaimable_bytes": 9107947520, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 239.68456429199998, "owned_rss_bytes": 305709056, "owned_process_count": 4, "reclaimable_bytes": 9074130944, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 239.91616520899998, "owned_rss_bytes": 329482240, "owned_process_count": 4, "reclaimable_bytes": 9062203392, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 240.1490245, "owned_rss_bytes": 348946432, "owned_process_count": 4, "reclaimable_bytes": 9029173248, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 240.382353209, "owned_rss_bytes": 368148480, "owned_process_count": 4, "reclaimable_bytes": 9017589760, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 240.61531441699998, "owned_rss_bytes": 375619584, "owned_process_count": 4, "reclaimable_bytes": 9011085312, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 240.847591334, "owned_rss_bytes": 388399104, "owned_process_count": 4, "reclaimable_bytes": 9002450944, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 241.08177270899998, "owned_rss_bytes": 420872192, "owned_process_count": 4, "reclaimable_bytes": 8997552128, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 241.31532208399997, "owned_rss_bytes": 427769856, "owned_process_count": 4, "reclaimable_bytes": 9075245056, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 241.54749675, "owned_rss_bytes": 432734208, "owned_process_count": 4, "reclaimable_bytes": 9073999872, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 241.77934091699998, "owned_rss_bytes": 451854336, "owned_process_count": 4, "reclaimable_bytes": 9062105088, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 242.011674584, "owned_rss_bytes": 473595904, "owned_process_count": 4, "reclaimable_bytes": 9040920576, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 242.239859334, "owned_rss_bytes": 475054080, "owned_process_count": 4, "reclaimable_bytes": 9053601792, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 242.47183837499998, "owned_rss_bytes": 476446720, "owned_process_count": 4, "reclaimable_bytes": 9055830016, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 242.70277729199998, "owned_rss_bytes": 232423424, "owned_process_count": 4, "reclaimable_bytes": 9218195456, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 242.93495083399998, "owned_rss_bytes": 302694400, "owned_process_count": 4, "reclaimable_bytes": 9190998016, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 243.168219709, "owned_rss_bytes": 315539456, "owned_process_count": 4, "reclaimable_bytes": 9183969280, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 243.40146604199998, "owned_rss_bytes": 318750720, "owned_process_count": 4, "reclaimable_bytes": 9179119616, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 243.634510042, "owned_rss_bytes": 323469312, "owned_process_count": 4, "reclaimable_bytes": 9178284032, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 243.865119417, "owned_rss_bytes": 333512704, "owned_process_count": 4, "reclaimable_bytes": 9174384640, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 244.09963374999998, "owned_rss_bytes": 335888384, "owned_process_count": 4, "reclaimable_bytes": 9168371712, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 244.33246591699998, "owned_rss_bytes": 343425024, "owned_process_count": 4, "reclaimable_bytes": 9153265664, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 244.56590129199998, "owned_rss_bytes": 350732288, "owned_process_count": 4, "reclaimable_bytes": 9143762944, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 244.79808312499998, "owned_rss_bytes": 354664448, "owned_process_count": 4, "reclaimable_bytes": 9147269120, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 245.03096037499998, "owned_rss_bytes": 378208256, "owned_process_count": 4, "reclaimable_bytes": 9477373952, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 245.267278875, "owned_rss_bytes": 400490496, "owned_process_count": 4, "reclaimable_bytes": 9466789888, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 245.50047024999998, "owned_rss_bytes": 403767296, "owned_process_count": 4, "reclaimable_bytes": 9465577472, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 245.733438792, "owned_rss_bytes": 412336128, "owned_process_count": 4, "reclaimable_bytes": 9452896256, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 245.965543667, "owned_rss_bytes": 417808384, "owned_process_count": 4, "reclaimable_bytes": 9469771776, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 246.19830770899998, "owned_rss_bytes": 424017920, "owned_process_count": 4, "reclaimable_bytes": 9478193152, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 246.426866709, "owned_rss_bytes": 427180032, "owned_process_count": 4, "reclaimable_bytes": 9474588672, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 246.657809209, "owned_rss_bytes": 433733632, "owned_process_count": 4, "reclaimable_bytes": 9452584960, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 246.89018704199998, "owned_rss_bytes": 441696256, "owned_process_count": 4, "reclaimable_bytes": 9448833024, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 247.121685709, "owned_rss_bytes": 288866304, "owned_process_count": 4, "reclaimable_bytes": 9557164032, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 247.35404899999997, "owned_rss_bytes": 320323584, "owned_process_count": 4, "reclaimable_bytes": 9538371584, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 247.585341417, "owned_rss_bytes": 332103680, "owned_process_count": 4, "reclaimable_bytes": 10868719616, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 247.81639925, "owned_rss_bytes": 340033536, "owned_process_count": 4, "reclaimable_bytes": 10864394240, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 248.04460170899998, "owned_rss_bytes": 340459520, "owned_process_count": 4, "reclaimable_bytes": 10863771648, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 248.272647125, "owned_rss_bytes": 348766208, "owned_process_count": 4, "reclaimable_bytes": 10844356608, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 248.501467292, "owned_rss_bytes": 403636224, "owned_process_count": 4, "reclaimable_bytes": 10814963712, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 248.731102417, "owned_rss_bytes": 414482432, "owned_process_count": 4, "reclaimable_bytes": 10802954240, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 248.959198542, "owned_rss_bytes": 421396480, "owned_process_count": 4, "reclaimable_bytes": 10826006528, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 249.18488187499997, "owned_rss_bytes": 419758080, "owned_process_count": 4, "reclaimable_bytes": 10823335936, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 249.40878708399998, "owned_rss_bytes": 428834816, "owned_process_count": 4, "reclaimable_bytes": 10817748992, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 249.634860084, "owned_rss_bytes": 442974208, "owned_process_count": 4, "reclaimable_bytes": 10775855104, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 249.859203584, "owned_rss_bytes": 169082880, "owned_process_count": 4, "reclaimable_bytes": 10823073792, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 250.084912625, "owned_rss_bytes": 125878272, "owned_process_count": 3, "reclaimable_bytes": 10846224384, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 250.309288584, "owned_rss_bytes": 554123264, "owned_process_count": 5, "reclaimable_bytes": 10558685184, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 250.540214542, "owned_rss_bytes": 268500992, "owned_process_count": 4, "reclaimable_bytes": 10817224704, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 250.76931308399998, "owned_rss_bytes": 415694848, "owned_process_count": 4, "reclaimable_bytes": 10720296960, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 250.99637424999997, "owned_rss_bytes": 537444352, "owned_process_count": 4, "reclaimable_bytes": 10625679360, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 251.2253815, "owned_rss_bytes": 724566016, "owned_process_count": 4, "reclaimable_bytes": 10460741632, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 251.45084641699998, "owned_rss_bytes": 817364992, "owned_process_count": 4, "reclaimable_bytes": 10401660928, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 251.681220959, "owned_rss_bytes": 856719360, "owned_process_count": 4, "reclaimable_bytes": 10362830848, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 251.90920483399998, "owned_rss_bytes": 779321344, "owned_process_count": 4, "reclaimable_bytes": 10442932224, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 252.13352475, "owned_rss_bytes": 840007680, "owned_process_count": 4, "reclaimable_bytes": 10367795200, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 252.357244125, "owned_rss_bytes": 1982464, "owned_process_count": 2, "reclaimable_bytes": 10889576448, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 252.58652537499998, "owned_rss_bytes": 1982464, "owned_process_count": 2, "reclaimable_bytes": 10888757248, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 252.824741875, "owned_rss_bytes": 1982464, "owned_process_count": 2, "reclaimable_bytes": 10877304832, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 253.053085042, "owned_rss_bytes": 4734976, "owned_process_count": 2, "reclaimable_bytes": 10973691904, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 253.277258209, "owned_rss_bytes": 146702336, "owned_process_count": 2, "reclaimable_bytes": 12400803840, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 253.860329292, "owned_rss_bytes": 128663552, "owned_process_count": 2, "reclaimable_bytes": 14346108928, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 254.40896658399998, "owned_rss_bytes": 128204800, "owned_process_count": 2, "reclaimable_bytes": 15270182912, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 254.8242805, "owned_rss_bytes": 128204800, "owned_process_count": 2, "reclaimable_bytes": 16610443264, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 255.281851709, "owned_rss_bytes": 126500864, "owned_process_count": 2, "reclaimable_bytes": 17128046592, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 255.56934912499997, "owned_rss_bytes": 130105344, "owned_process_count": 2, "reclaimable_bytes": 17115201536, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 255.81731366699998, "owned_rss_bytes": 130105344, "owned_process_count": 2, "reclaimable_bytes": 17060904960, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 256.065640917, "owned_rss_bytes": 130105344, "owned_process_count": 2, "reclaimable_bytes": 17052368896, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 256.31686829200004, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17041424384, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 256.559247625, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17051009024, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 256.80099725, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17037197312, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 257.042528417, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17040900096, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 257.283663917, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17141972992, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 257.52885504200003, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17043292160, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 257.768687375, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17028415488, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 258.011112959, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17016848384, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 258.28429566700004, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 17009360896, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 258.531633834, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 16991666176, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 258.808089084, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 16986374144, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 259.0532955, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 16986177536, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 259.297134125, "owned_rss_bytes": 130170880, "owned_process_count": 2, "reclaimable_bytes": 16964943872, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 259.538958459, "owned_rss_bytes": 130154496, "owned_process_count": 2, "reclaimable_bytes": 16961437696, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 259.78411262500003, "owned_rss_bytes": 130154496, "owned_process_count": 2, "reclaimable_bytes": 16982065152, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 260.0304415, "owned_rss_bytes": 130154496, "owned_process_count": 2, "reclaimable_bytes": 16973463552, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 260.288937667, "owned_rss_bytes": 130154496, "owned_process_count": 2, "reclaimable_bytes": 16956604416, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 260.531113375, "owned_rss_bytes": 130154496, "owned_process_count": 2, "reclaimable_bytes": 16956440576, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 260.770811917, "owned_rss_bytes": 130121728, "owned_process_count": 2, "reclaimable_bytes": 16956915712, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 261.018118625, "owned_rss_bytes": 130121728, "owned_process_count": 2, "reclaimable_bytes": 16961388544, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 261.27108708400004, "owned_rss_bytes": 130088960, "owned_process_count": 2, "reclaimable_bytes": 16953999360, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 261.5258935, "owned_rss_bytes": 130088960, "owned_process_count": 2, "reclaimable_bytes": 16965533696, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 261.77120825000003, "owned_rss_bytes": 130105344, "owned_process_count": 2, "reclaimable_bytes": 16969302016, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 262.016554084, "owned_rss_bytes": 135331840, "owned_process_count": 2, "reclaimable_bytes": 17081270272, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 262.246998125, "owned_rss_bytes": 3440640, "owned_process_count": 2, "reclaimable_bytes": 16913612800, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 262.479206334, "owned_rss_bytes": 3473408, "owned_process_count": 2, "reclaimable_bytes": 16904126464, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 262.70877208400003, "owned_rss_bytes": 3489792, "owned_process_count": 2, "reclaimable_bytes": 16901423104, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 262.93795625, "owned_rss_bytes": 3604480, "owned_process_count": 2, "reclaimable_bytes": 16885301248, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 263.167725542, "owned_rss_bytes": 3604480, "owned_process_count": 2, "reclaimable_bytes": 16874668032, "swapins": 44112375, "swapouts": 77525566}
{"elapsed_seconds": 263.39699933400004, "owned_rss_bytes": 3719168, "owned_process_count": 2, "reclaimable_bytes": 16856432640, "swapins": 44112375, "swapouts": 77525566}
````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/preparation.json

SHA-256 `60d0e50fea271da136a7d1b05ebb19372180512d5b6fe0bfa4a57a3b59b45d83`; 39161 bytes.

````text
{
  "classification": "Real external-consumer source compatibility on proposed combined defaults plus current context device-observer seam. No model execution, final binary or default activation.",
  "source_root": "/tmp/slotstream-optimization-execution/current-source-consumer-v268/source",
  "base_candidate": {
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
  "source_sha256": {
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
  "changes_from_v255": {
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8"
  },
  "consumer_script_sha256": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
  "command": [
    "bash",
    "Tools/consumer_smoke.sh"
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
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70"
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/protocol.json

SHA-256 `875f9ed85bb31a4b89bfcd4e366ff48e7b6d45540f938a74968891a8aba63f36`; 39476 bytes.

````text
{
  "classification": "Real external-consumer source compatibility on proposed combined defaults plus current context device-observer seam. No model execution, final binary or default activation.",
  "source_root": "/tmp/slotstream-optimization-execution/current-source-consumer-v268/source",
  "base_candidate": {
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
  "source_sha256": {
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
  "changes_from_v255": {
    "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8"
  },
  "consumer_script_sha256": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
  "command": [
    "bash",
    "Tools/consumer_smoke.sh"
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
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70"
  },
  "wrapper_sha256": "0659061d75984c2ba149d9203cd009161d0280898f747c09bf112038f76caac1",
  "planner_proxy_prerequisite": {
    "path": "/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-manifest.json",
    "sha256": "3d80af4d4fe4a9ebbe550b450b8db7fe491563671ca9f3c238a2313f38cf1951"
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/run.py

SHA-256 `0659061d75984c2ba149d9203cd009161d0280898f747c09bf112038f76caac1`; 3424 bytes.

````text
import fcntl,json,os,signal,sys,time
from pathlib import Path
ROOT=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path(__file__).parent;S=json.loads((P/'protocol.json').read_text());source=Path(S['source_root']);start=time.monotonic()
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
 r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and not r.get('jobs') and r.get('model_lock_free') and r.get('source_unchanged') and r['elapsed_seconds']<=S['maximum_interval_seconds'])
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/source/Tools/consumer_smoke.sh

SHA-256 `5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70`; 4886 bytes.

````text
#!/bin/bash
# Can something outside this repository actually use it?
#
# Until the package declared products, the answer was no: SwiftPM refused at
# graph resolution with "product 'SlotstreamCore' ... not found in package
# 'slotstream'". Nothing inside the repo would ever have noticed, because the
# binary builds either way. This builds a throwaway package that depends on the
# checkout by path, imports both libraries, and runs.
set -euo pipefail
cd "$(dirname "$0")/.."
REPO=$PWD
JOBS=${SLOTSTREAM_BUILD_JOBS-2}
case "$JOBS" in
  1|2|3|4|5|6|7|8) ;;
  *) echo "consumer: SLOTSTREAM_BUILD_JOBS must be an integer from 1 to 8" >&2; exit 1 ;;
esac
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT
mkdir -p "$WORK/Sources/Consumer"

cat > "$WORK/Package.swift" <<SWIFT
// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "Consumer", platforms: [.macOS(.v14)],
    dependencies: [.package(name: "slotstream", path: "$REPO")],
    targets: [.executableTarget(name: "Consumer", dependencies: [
        .product(name: "Slotstream", package: "slotstream"),
        .product(name: "SlotstreamDiagnostics", package: "slotstream"),
    ], swiftSettings: [.swiftLanguageMode(.v5)])]
)
SWIFT

cat > "$WORK/Sources/Consumer/main.swift" <<'SWIFT'
import Foundation
import Slotstream
import SlotstreamDiagnostics

// Existing callers may forward nonescaping logs and hold the original API
// as function values. Compile these without starting any download.
func forwardInstance(_ store: WeightStore, log: WeightStore.Log) throws {
    try store.download(log: log)
}
func forwardStatic(_ directory: URL, log: WeightStore.Log) throws {
    try WeightStore.download(to: directory, log: log)
}
let oldDownload: (URL, Int?, [String]?, WeightStore.Log) throws -> Void = WeightStore.download
let oldOptions: ([String]?, Int?) -> PullOptions = PullOptions.init
let cancelled = PullCancellation()
cancelled.cancel()
let cancelledOptions = PullOptions(cancellation: cancelled)

// Preserve existing public function-value signatures and ordinary calls.
func legacyEngineMethods(_ engine: Engine) {
    let generate: ([Int], SampleParams, VisionPrompt?, (() -> Bool)?, ((Int, String) -> Bool)?) -> (text: String, ids: [Int], stats: GenStats) = engine.generate
    let images: ([[String: Any]], [[String: Any]]?, Bool) throws -> ([Int], VisionPrompt?) = engine.encodeWithVision
    let typedImages: ([ChatMessage], [ToolDefinition], Bool, String?) throws -> ([Int], VisionPrompt?) = engine.encodeChatWithVision
    let tower: () throws -> VisionTower = engine.ensureVisionTower
    _ = (generate, images, typedImages, tower)
}
let oldPlanner: (PlanRequest, Machine, Bool, Bool) throws -> MemoryPlan = Planner.plan
let loosePlanner: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
let optimizationEnvironment: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
let explicitReference = InferenceOptimizations()
precondition(!explicitReference.compactStateWindows)
let explicitOptOut = try optimizationEnvironment(["SLOTSTREAM_OPT_COMPACT_STATE": "0"])
precondition(!explicitOptOut.compactStateWindows)
let policy = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 0)
precondition(policy.maxContextTokens == 65536)
let controller = RequestController(configuration: policy, slackBytes: 0, availableGB: { 100 })
try controller.check()

// Plan for a machine, without one byte of weights and without touching Metal.
let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: Machine.simulated(ramGB: 32))
precondition(plan.slots > 0, "a 16 GB plan should size a pool")
precondition(plan.simulated, "a simulated machine must mark its plan")

// Ask about the weights without trying to load them.
let status = WeightStore.default.status()
precondition(status.bytesToFetch >= 0)

// Price a long prompt.
let wait = PrefillSchedule.estSeconds(tokens: 8000, maxChunk: plan.prefillChunk)
precondition(wait > 0)

// Run one of the library's own diagnostics.
let report = Diagnostics.prefillSchedule()
precondition(report.passed, "prefill-schedule should pass")

print("consumer ok: \(Int(plan.expertsPerLayerCached))/layer, "
    + "\(PrefillSchedule.describe(seconds: wait)) for 8k tokens, "
    + "\(PinnedModel.files.count) pinned files, diagnostics \(report.items.count) assertions")
SWIFT

cd "$WORK"
# Only a compiler diagnostic fails this ("path:line:col: error: ..."); SwiftPM's
# own cache chatter can contain the word too ("skipping cache due to an
# error: ...") and took a green build down once.
if ! swift build -j "$JOBS" > "$WORK/build.log" 2>&1; then
  cat "$WORK/build.log" >&2
  exit 1
fi
if grep -E '(^|: )error: |warning: .*deprecated' "$WORK/build.log"; then
  exit 1
fi
.build/debug/Consumer
````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/current-source-consumer-v268/stdout.txt

SHA-256 `6ec5f0efba43b3e25deaf7d10b04f53102e73f6001df5915f1c6ee59590015e1`; 86 bytes.

````text
consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 22 assertions
````

