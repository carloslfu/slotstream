---
type: run
id: 01m1xda0m70qdm0xwpze4k2k8q
created: 2026-09-07T07:46:15.303604+00:00
updated: 2026-09-07T07:46:15.611629+00:00
summary: Current-source release build stops at its memory floor and restores the checkout
binary: Per-file exact binary/source identities retained; current-source release build did not publish a candidate
captured_at: 2026-09-07
command: python3 /tmp/slotstream-optimization-execution/current-source-build-v271/run.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Current-source release build stops at its memory floor and restores the checkout
tool: python3
---
# Current-source release build stops at its memory floor and restores the checkout

V271 attempts the current150-input release candidate under a temporary seven-file source lease, including the current context-test Makefile. The real build starts at12242239488bytes reclaimable with one compiler job. At81.245626167seconds a sample reaches5982928896bytes, below the unchanged6GB live floor; the guard terminates and drains the owned compiler. Maximum sampled owned RSS is904314880bytes and the complete guarded interval records zero swapins and swapouts. This does not identify the cause of the system-wide headroom change. The overall82.914647334second lease restores all original source contents, file metadata, shared release artifacts, release symlink and first-party/SwiftPM build state exactly. No model loads, no new candidate is published, no app is closed and no resource requirement is relaxed. The failed build is retained as discarded qualification evidence, never rescored as a pass. Final source build, native/API/resource/client gates and the eight-paired/two-soak campaign remain open.

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v271/build.txt

SHA-256 `2bd155a0ffdf66e0552a9656bad3d79219c515650f82775c5eb8c1d60cae5b3a`; 1208 bytes.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release -j 1
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/10] Write swift-version--1AB21518FC5DEDBE.txt
[4/10] Write sources
[7/11] Compiling RealModule AlgebraicField.swift
[8/12] Compiling InternalCollectionsUtilities Debugging.swift
[9/13] Compiling EventSource AsyncEventsSequence.swift
[10/14] Compiling OrderedCollections _HashTable+Bucket.swift
[11/15] Compiling Crypto AES-GCM.swift
[12/16] Compiling Jinja AST.swift
[13/17] Compiling HuggingFace AccessRequest.swift
[14/18] Compiling ComplexModule Complex+AdditiveArithmetic.swift
[15/19] Compiling Hub BinaryDistinct.swift
[16/20] Compiling Numerics Numerics.swift
[17/21] Compiling Tokenizers BPETokenizer.swift
[18/22] Compiling MLX ArrayAt.swift
[19/23] Compiling Generation Decoders.swift
[20/24] Compiling MLXNN Activations.swift
[21/25] Compiling Models LanguageModel.swift
[22/26] Compiling MLXFast MLXFast.swift
[23/27] Compiling ArgumentParserToolInfo ToolInfo.swift
make: *** [build] Terminated: 15
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v271/live-memory.json

SHA-256 `1c591b33567972b1da75c8a338cabd4eeb665be531ef5f86b887a417eea92787`; 78583 bytes.

````text
{
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=1"
  ],
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12242239488,
    "swapins": 44112650,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   274514.\nPages active:                                 780788.\nPages inactive:                               801734.\nPages speculative:                             40712.\nPages throttled:                                   0.\nPages wired down:                             357879.\nPages purgeable:                                6128.\n\"Translation faults\":                    15419864699.\nPages copy-on-write:                       736014015.\nPages zero filled:                       21223320264.\nPages reactivated:                        3470832741.\nPages purged:                               72241943.\nFile-backed pages:                            466565.\nAnonymous pages:                             1156669.\nPages stored in compressor:                  1983277.\nPages occupied by compressor:                 829807.\nDecompressions:                           1172035791.\nCompressions:                             1487077413.\nPageins:                                  7621784113.\nPageouts:                                   11082573.\nSwapins:                                    44112650.\nSwapouts:                                   77525566.\nPages tagged:                                 184017.\nPages tagged resident:                        136023.\nPages tagged compressed:                       47994.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8682.\nPages tag-storage free:                          216.\nPages tag-storage non-tag pageable:            89398.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7214848.\nTagged compressions:                        11276977.\nTagged decompressions:                      10396985.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0037763339999999923,
      "owned_rss_bytes": 6127616,
      "owned_process_count": 1,
      "reclaimable_bytes": 12241436672,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.23528241700000008,
      "owned_rss_bytes": 2195456,
      "owned_process_count": 2,
      "reclaimable_bytes": 12236357632,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.4701151669999999,
      "owned_rss_bytes": 45547520,
      "owned_process_count": 3,
      "reclaimable_bytes": 12229754880,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.705707584,
      "owned_rss_bytes": 49233920,
      "owned_process_count": 2,
      "reclaimable_bytes": 12226002944,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.9431985839999999,
      "owned_rss_bytes": 67534848,
      "owned_process_count": 2,
      "reclaimable_bytes": 12208799744,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.17825925,
      "owned_rss_bytes": 70369280,
      "owned_process_count": 2,
      "reclaimable_bytes": 12192088064,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.412249875,
      "owned_rss_bytes": 70828032,
      "owned_process_count": 2,
      "reclaimable_bytes": 12239650816,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.649421459,
      "owned_rss_bytes": 74776576,
      "owned_process_count": 2,
      "reclaimable_bytes": 12241649664,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.8834555000000002,
      "owned_rss_bytes": 93290496,
      "owned_process_count": 3,
      "reclaimable_bytes": 12188336128,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.119958709,
      "owned_rss_bytes": 198754304,
      "owned_process_count": 4,
      "reclaimable_bytes": 12119490560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.352841042,
      "owned_rss_bytes": 237928448,
      "owned_process_count": 4,
      "reclaimable_bytes": 12085919744,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.592614625,
      "owned_rss_bytes": 146178048,
      "owned_process_count": 4,
      "reclaimable_bytes": 12118654976,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.830344459,
      "owned_rss_bytes": 93650944,
      "owned_process_count": 3,
      "reclaimable_bytes": 12137922560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.067504167,
      "owned_rss_bytes": 93650944,
      "owned_process_count": 3,
      "reclaimable_bytes": 12116099072,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.3036817499999995,
      "owned_rss_bytes": 93667328,
      "owned_process_count": 2,
      "reclaimable_bytes": 12114542592,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.538933875,
      "owned_rss_bytes": 93667328,
      "owned_process_count": 2,
      "reclaimable_bytes": 12113592320,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.7757080000000003,
      "owned_rss_bytes": 93782016,
      "owned_process_count": 2,
      "reclaimable_bytes": 12119883776,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.0111043340000005,
      "owned_rss_bytes": 160628736,
      "owned_process_count": 4,
      "reclaimable_bytes": 12118097920,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.2428395420000005,
      "owned_rss_bytes": 176963584,
      "owned_process_count": 4,
      "reclaimable_bytes": 12097814528,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.478968459000001,
      "owned_rss_bytes": 221036544,
      "owned_process_count": 5,
      "reclaimable_bytes": 12028592128,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.718649167000001,
      "owned_rss_bytes": 131088384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12113936384,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.954819125,
      "owned_rss_bytes": 134545408,
      "owned_process_count": 4,
      "reclaimable_bytes": 12106629120,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.191664125000001,
      "owned_rss_bytes": 203898880,
      "owned_process_count": 5,
      "reclaimable_bytes": 12064784384,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.429361625,
      "owned_rss_bytes": 102432768,
      "owned_process_count": 3,
      "reclaimable_bytes": 12148686848,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.6662037089999995,
      "owned_rss_bytes": 220987392,
      "owned_process_count": 4,
      "reclaimable_bytes": 12112330752,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.901977292,
      "owned_rss_bytes": 141180928,
      "owned_process_count": 4,
      "reclaimable_bytes": 12137791488,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.1358817089999995,
      "owned_rss_bytes": 234225664,
      "owned_process_count": 4,
      "reclaimable_bytes": 12081201152,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.373637209,
      "owned_rss_bytes": 251805696,
      "owned_process_count": 4,
      "reclaimable_bytes": 12078383104,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.609378417,
      "owned_rss_bytes": 185794560,
      "owned_process_count": 4,
      "reclaimable_bytes": 12117245952,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.844458124999999,
      "owned_rss_bytes": 269860864,
      "owned_process_count": 4,
      "reclaimable_bytes": 12081643520,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.080320292,
      "owned_rss_bytes": 293994496,
      "owned_process_count": 4,
      "reclaimable_bytes": 12052512768,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.317646625,
      "owned_rss_bytes": 299106304,
      "owned_process_count": 4,
      "reclaimable_bytes": 12038389760,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.556195375,
      "owned_rss_bytes": 210239488,
      "owned_process_count": 4,
      "reclaimable_bytes": 12093489152,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.792634209000001,
      "owned_rss_bytes": 224051200,
      "owned_process_count": 4,
      "reclaimable_bytes": 12085297152,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.031641459000001,
      "owned_rss_bytes": 248332288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12065832960,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.268617292,
      "owned_rss_bytes": 271974400,
      "owned_process_count": 4,
      "reclaimable_bytes": 12044025856,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.506871709,
      "owned_rss_bytes": 285982720,
      "owned_process_count": 4,
      "reclaimable_bytes": 12029329408,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.744426834,
      "owned_rss_bytes": 294223872,
      "owned_process_count": 4,
      "reclaimable_bytes": 12023054336,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.981457959,
      "owned_rss_bytes": 303022080,
      "owned_process_count": 4,
      "reclaimable_bytes": 12018106368,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.219217625,
      "owned_rss_bytes": 303398912,
      "owned_process_count": 4,
      "reclaimable_bytes": 12020236288,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.455346917,
      "owned_rss_bytes": 337068032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11983159296,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.693603875,
      "owned_rss_bytes": 203227136,
      "owned_process_count": 4,
      "reclaimable_bytes": 12093554688,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.929207459,
      "owned_rss_bytes": 283836416,
      "owned_process_count": 4,
      "reclaimable_bytes": 12065914880,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.16741775,
      "owned_rss_bytes": 186892288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12112330752,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.401946667,
      "owned_rss_bytes": 261308416,
      "owned_process_count": 4,
      "reclaimable_bytes": 12077563904,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.635307917,
      "owned_rss_bytes": 276234240,
      "owned_process_count": 4,
      "reclaimable_bytes": 12068667392,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.87300025,
      "owned_rss_bytes": 294420480,
      "owned_process_count": 4,
      "reclaimable_bytes": 12048351232,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.110955917,
      "owned_rss_bytes": 324927488,
      "owned_process_count": 4,
      "reclaimable_bytes": 12016009216,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.350034375,
      "owned_rss_bytes": 342376448,
      "owned_process_count": 4,
      "reclaimable_bytes": 12005900288,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.585309417000001,
      "owned_rss_bytes": 353173504,
      "owned_process_count": 4,
      "reclaimable_bytes": 11996659712,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.822516834,
      "owned_rss_bytes": 366395392,
      "owned_process_count": 4,
      "reclaimable_bytes": 11983093760,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.060008167000001,
      "owned_rss_bytes": 380993536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11964792832,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.297709709000001,
      "owned_rss_bytes": 390447104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11954683904,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.535940834,
      "owned_rss_bytes": 399310848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11943247872,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.774968917,
      "owned_rss_bytes": 409485312,
      "owned_process_count": 4,
      "reclaimable_bytes": 11933548544,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.012093084,
      "owned_rss_bytes": 417464320,
      "owned_process_count": 4,
      "reclaimable_bytes": 11936612352,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.248492667,
      "owned_rss_bytes": 427819008,
      "owned_process_count": 4,
      "reclaimable_bytes": 11922849792,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.483159500000001,
      "owned_rss_bytes": 433324032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11927175168,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.721573875,
      "owned_rss_bytes": 442695680,
      "owned_process_count": 4,
      "reclaimable_bytes": 11914674176,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.96018575,
      "owned_rss_bytes": 451559424,
      "owned_process_count": 4,
      "reclaimable_bytes": 11907956736,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.196603292,
      "owned_rss_bytes": 455835648,
      "owned_process_count": 4,
      "reclaimable_bytes": 11907792896,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.43922525,
      "owned_rss_bytes": 457523200,
      "owned_process_count": 4,
      "reclaimable_bytes": 11904876544,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.675665167,
      "owned_rss_bytes": 459554816,
      "owned_process_count": 4,
      "reclaimable_bytes": 11903483904,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.912948125,
      "owned_rss_bytes": 463372288,
      "owned_process_count": 4,
      "reclaimable_bytes": 11887394816,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.150984625,
      "owned_rss_bytes": 465387520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11879776256,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.385300417000002,
      "owned_rss_bytes": 469516288,
      "owned_process_count": 4,
      "reclaimable_bytes": 11882627072,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.621262,
      "owned_rss_bytes": 472023040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11875467264,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.857566959000001,
      "owned_rss_bytes": 478593024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11874582528,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.096222542,
      "owned_rss_bytes": 481787904,
      "owned_process_count": 4,
      "reclaimable_bytes": 11869650944,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.334634917,
      "owned_rss_bytes": 484556800,
      "owned_process_count": 4,
      "reclaimable_bytes": 11871010816,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.568801542,
      "owned_rss_bytes": 491225088,
      "owned_process_count": 4,
      "reclaimable_bytes": 11863359488,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.802935584,
      "owned_rss_bytes": 494583808,
      "owned_process_count": 4,
      "reclaimable_bytes": 11674779648,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.040172834,
      "owned_rss_bytes": 494632960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11682660352,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.275815166999998,
      "owned_rss_bytes": 495108096,
      "owned_process_count": 4,
      "reclaimable_bytes": 11673436160,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.507667249999997,
      "owned_rss_bytes": 503005184,
      "owned_process_count": 4,
      "reclaimable_bytes": 11671912448,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.74421675,
      "owned_rss_bytes": 504053760,
      "owned_process_count": 4,
      "reclaimable_bytes": 11666259968,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.978799875,
      "owned_rss_bytes": 506363904,
      "owned_process_count": 4,
      "reclaimable_bytes": 11848351744,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.212671375,
      "owned_rss_bytes": 508248064,
      "owned_process_count": 4,
      "reclaimable_bytes": 11846549504,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.444488542,
      "owned_rss_bytes": 508411904,
      "owned_process_count": 4,
      "reclaimable_bytes": 11840389120,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.6810525,
      "owned_rss_bytes": 508428288,
      "owned_process_count": 4,
      "reclaimable_bytes": 11822907392,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.92066225,
      "owned_rss_bytes": 508887040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11827707904,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.162278875,
      "owned_rss_bytes": 509607936,
      "owned_process_count": 4,
      "reclaimable_bytes": 11826626560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.399196542,
      "owned_rss_bytes": 509902848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11827412992,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.638080499999997,
      "owned_rss_bytes": 510099456,
      "owned_process_count": 4,
      "reclaimable_bytes": 11822514176,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.877039625,
      "owned_rss_bytes": 510853120,
      "owned_process_count": 4,
      "reclaimable_bytes": 11821203456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.11586225,
      "owned_rss_bytes": 510935040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11817451520,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.352886041999998,
      "owned_rss_bytes": 511787008,
      "owned_process_count": 4,
      "reclaimable_bytes": 11816517632,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.590683875,
      "owned_rss_bytes": 511934464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11817091072,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.827834791999997,
      "owned_rss_bytes": 511967232,
      "owned_process_count": 4,
      "reclaimable_bytes": 11815092224,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.064809209,
      "owned_rss_bytes": 512229376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11825496064,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.301668791999997,
      "owned_rss_bytes": 512540672,
      "owned_process_count": 4,
      "reclaimable_bytes": 11821072384,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.538643584,
      "owned_rss_bytes": 512606208,
      "owned_process_count": 4,
      "reclaimable_bytes": 11824431104,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.772961125,
      "owned_rss_bytes": 526401536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11811799040,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.009969458999997,
      "owned_rss_bytes": 625967104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11701092352,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.250679249999997,
      "owned_rss_bytes": 213581824,
      "owned_process_count": 4,
      "reclaimable_bytes": 12069011456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.494806834,
      "owned_rss_bytes": 288243712,
      "owned_process_count": 4,
      "reclaimable_bytes": 12036833280,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.729976334,
      "owned_rss_bytes": 315441152,
      "owned_process_count": 4,
      "reclaimable_bytes": 12015714304,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.972125583999997,
      "owned_rss_bytes": 327254016,
      "owned_process_count": 4,
      "reclaimable_bytes": 11997134848,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.207852791999997,
      "owned_rss_bytes": 354861056,
      "owned_process_count": 4,
      "reclaimable_bytes": 11978899456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.451327959,
      "owned_rss_bytes": 383107072,
      "owned_process_count": 4,
      "reclaimable_bytes": 11953127424,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.686311334,
      "owned_rss_bytes": 405356544,
      "owned_process_count": 4,
      "reclaimable_bytes": 11925356544,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.919671083999997,
      "owned_rss_bytes": 417726464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11917082624,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.159973417,
      "owned_rss_bytes": 431751168,
      "owned_process_count": 4,
      "reclaimable_bytes": 11896881152,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.402151209,
      "owned_rss_bytes": 455999488,
      "owned_process_count": 4,
      "reclaimable_bytes": 11877285888,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.634257917,
      "owned_rss_bytes": 478822400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11861229568,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.870894084,
      "owned_rss_bytes": 481165312,
      "owned_process_count": 4,
      "reclaimable_bytes": 11841208320,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.115701917,
      "owned_rss_bytes": 487489536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11820269568,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.357367749999998,
      "owned_rss_bytes": 500826112,
      "owned_process_count": 4,
      "reclaimable_bytes": 11761287168,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.604815125,
      "owned_rss_bytes": 513474560,
      "owned_process_count": 4,
      "reclaimable_bytes": 11739070464,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.845811542,
      "owned_rss_bytes": 523419648,
      "owned_process_count": 4,
      "reclaimable_bytes": 11723161600,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.092335583999997,
      "owned_rss_bytes": 532332544,
      "owned_process_count": 4,
      "reclaimable_bytes": 11711053824,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.341010834,
      "owned_rss_bytes": 539131904,
      "owned_process_count": 4,
      "reclaimable_bytes": 12878266368,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.590143709,
      "owned_rss_bytes": 550027264,
      "owned_process_count": 4,
      "reclaimable_bytes": 13781762048,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.830576167,
      "owned_rss_bytes": 562380800,
      "owned_process_count": 4,
      "reclaimable_bytes": 13790396416,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.07343625,
      "owned_rss_bytes": 564379648,
      "owned_process_count": 4,
      "reclaimable_bytes": 13778960384,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.316184042,
      "owned_rss_bytes": 569589760,
      "owned_process_count": 4,
      "reclaimable_bytes": 13773225984,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.558991834,
      "owned_rss_bytes": 578633728,
      "owned_process_count": 4,
      "reclaimable_bytes": 13746634752,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.802613542,
      "owned_rss_bytes": 591396864,
      "owned_process_count": 4,
      "reclaimable_bytes": 13697482752,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.038780167,
      "owned_rss_bytes": 601538560,
      "owned_process_count": 4,
      "reclaimable_bytes": 13725286400,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.274179292,
      "owned_rss_bytes": 611008512,
      "owned_process_count": 4,
      "reclaimable_bytes": 13710786560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.513907125,
      "owned_rss_bytes": 617398272,
      "owned_process_count": 4,
      "reclaimable_bytes": 13695238144,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.75297325,
      "owned_rss_bytes": 626589696,
      "owned_process_count": 4,
      "reclaimable_bytes": 13654753280,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.986326124999998,
      "owned_rss_bytes": 642252800,
      "owned_process_count": 4,
      "reclaimable_bytes": 13627588608,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.227356375,
      "owned_rss_bytes": 652394496,
      "owned_process_count": 4,
      "reclaimable_bytes": 13445791744,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.463809959,
      "owned_rss_bytes": 653312000,
      "owned_process_count": 4,
      "reclaimable_bytes": 13419134976,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.705291583999998,
      "owned_rss_bytes": 653312000,
      "owned_process_count": 4,
      "reclaimable_bytes": 12922241024,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.946983209,
      "owned_rss_bytes": 653328384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12768624640,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.189809584,
      "owned_rss_bytes": 652197888,
      "owned_process_count": 4,
      "reclaimable_bytes": 12348424192,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.433741333999997,
      "owned_rss_bytes": 652787712,
      "owned_process_count": 4,
      "reclaimable_bytes": 12333629440,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.670857959,
      "owned_rss_bytes": 653623296,
      "owned_process_count": 4,
      "reclaimable_bytes": 12255854592,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.912504166999998,
      "owned_rss_bytes": 654704640,
      "owned_process_count": 4,
      "reclaimable_bytes": 12180963328,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.153019459,
      "owned_rss_bytes": 655065088,
      "owned_process_count": 4,
      "reclaimable_bytes": 11935662080,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.396950999999998,
      "owned_rss_bytes": 655097856,
      "owned_process_count": 4,
      "reclaimable_bytes": 11878006784,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.6363375,
      "owned_rss_bytes": 656588800,
      "owned_process_count": 4,
      "reclaimable_bytes": 11817795584,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.878199042000002,
      "owned_rss_bytes": 722255872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11683692544,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.1155745,
      "owned_rss_bytes": 813023232,
      "owned_process_count": 4,
      "reclaimable_bytes": 11717328896,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.355150084,
      "owned_rss_bytes": 142688256,
      "owned_process_count": 4,
      "reclaimable_bytes": 12183699456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.5903755,
      "owned_rss_bytes": 104251392,
      "owned_process_count": 3,
      "reclaimable_bytes": 12146917376,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.828628292000005,
      "owned_rss_bytes": 231768064,
      "owned_process_count": 4,
      "reclaimable_bytes": 12048957440,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.068726084000005,
      "owned_rss_bytes": 305233920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11963105280,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.309393750000005,
      "owned_rss_bytes": 348700672,
      "owned_process_count": 4,
      "reclaimable_bytes": 11870322688,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.548349625,
      "owned_rss_bytes": 371621888,
      "owned_process_count": 4,
      "reclaimable_bytes": 11800133632,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.78407425,
      "owned_rss_bytes": 392396800,
      "owned_process_count": 4,
      "reclaimable_bytes": 11727618048,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.023209792,
      "owned_rss_bytes": 407142400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11674189824,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.265280417,
      "owned_rss_bytes": 419463168,
      "owned_process_count": 4,
      "reclaimable_bytes": 11655315456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.503957584000005,
      "owned_rss_bytes": 423346176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11652694016,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.737887917,
      "owned_rss_bytes": 429178880,
      "owned_process_count": 4,
      "reclaimable_bytes": 11643011072,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.97854575,
      "owned_rss_bytes": 429998080,
      "owned_process_count": 4,
      "reclaimable_bytes": 11633819648,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.21565575,
      "owned_rss_bytes": 430751744,
      "owned_process_count": 4,
      "reclaimable_bytes": 11630379008,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.455987750000006,
      "owned_rss_bytes": 144719872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11821072384,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.695026917,
      "owned_rss_bytes": 288964608,
      "owned_process_count": 4,
      "reclaimable_bytes": 11718377472,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.929142584000004,
      "owned_rss_bytes": 340541440,
      "owned_process_count": 4,
      "reclaimable_bytes": 11638374400,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.166558875,
      "owned_rss_bytes": 375193600,
      "owned_process_count": 4,
      "reclaimable_bytes": 11617894400,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.406839209000005,
      "owned_rss_bytes": 392691712,
      "owned_process_count": 4,
      "reclaimable_bytes": 11599495168,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.644100375,
      "owned_rss_bytes": 409174016,
      "owned_process_count": 4,
      "reclaimable_bytes": 11589730304,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.884203750000005,
      "owned_rss_bytes": 426016768,
      "owned_process_count": 4,
      "reclaimable_bytes": 11576164352,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.119702167,
      "owned_rss_bytes": 444792832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10315104256,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.359418709,
      "owned_rss_bytes": 455049216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10272014336,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.595112209,
      "owned_rss_bytes": 458670080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10233430016,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.835853292,
      "owned_rss_bytes": 466911232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10199449600,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.076480667000006,
      "owned_rss_bytes": 467615744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10171187200,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.313957875,
      "owned_rss_bytes": 467697664,
      "owned_process_count": 4,
      "reclaimable_bytes": 10139795456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.55385025,
      "owned_rss_bytes": 468090880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10118217728,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.795299375,
      "owned_rss_bytes": 471531520,
      "owned_process_count": 4,
      "reclaimable_bytes": 10086875136,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.030478667000004,
      "owned_rss_bytes": 475086848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10237935616,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.271959042,
      "owned_rss_bytes": 475578368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10209247232,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.505431125,
      "owned_rss_bytes": 475906048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10171662336,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.74638275,
      "owned_rss_bytes": 475987968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10111959040,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.984441459,
      "owned_rss_bytes": 476184576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10049241088,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.219655417000006,
      "owned_rss_bytes": 103546880,
      "owned_process_count": 3,
      "reclaimable_bytes": 10213605376,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.455447542,
      "owned_rss_bytes": 242106368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10112188416,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.690628709,
      "owned_rss_bytes": 284950528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10012016640,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.931653459,
      "owned_rss_bytes": 297861120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9944989696,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.172065209,
      "owned_rss_bytes": 310198272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9879388160,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.414586334,
      "owned_rss_bytes": 341114880,
      "owned_process_count": 4,
      "reclaimable_bytes": 9821519872,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.654639584,
      "owned_rss_bytes": 366592000,
      "owned_process_count": 4,
      "reclaimable_bytes": 9776726016,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.890506459,
      "owned_rss_bytes": 428916736,
      "owned_process_count": 4,
      "reclaimable_bytes": 9712762880,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.132003709,
      "owned_rss_bytes": 429096960,
      "owned_process_count": 4,
      "reclaimable_bytes": 9642721280,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.369691417000006,
      "owned_rss_bytes": 429162496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9582510080,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.603316292,
      "owned_rss_bytes": 429309952,
      "owned_process_count": 4,
      "reclaimable_bytes": 9469509632,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.845509209,
      "owned_rss_bytes": 431063040,
      "owned_process_count": 4,
      "reclaimable_bytes": 9454698496,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.079446667,
      "owned_rss_bytes": 436305920,
      "owned_process_count": 4,
      "reclaimable_bytes": 9419243520,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.319339375000006,
      "owned_rss_bytes": 448921600,
      "owned_process_count": 4,
      "reclaimable_bytes": 9404104704,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.558974667,
      "owned_rss_bytes": 456589312,
      "owned_process_count": 4,
      "reclaimable_bytes": 9312075776,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.806607334,
      "owned_rss_bytes": 460734464,
      "owned_process_count": 4,
      "reclaimable_bytes": 9226698752,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.050788709,
      "owned_rss_bytes": 465256448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9140518912,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.288507417000005,
      "owned_rss_bytes": 474267648,
      "owned_process_count": 4,
      "reclaimable_bytes": 9026928640,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.536377375,
      "owned_rss_bytes": 485621760,
      "owned_process_count": 4,
      "reclaimable_bytes": 8930607104,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.782686959,
      "owned_rss_bytes": 494485504,
      "owned_process_count": 4,
      "reclaimable_bytes": 8844525568,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.034463084,
      "owned_rss_bytes": 506953728,
      "owned_process_count": 4,
      "reclaimable_bytes": 8746467328,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.281646709,
      "owned_rss_bytes": 519356416,
      "owned_process_count": 4,
      "reclaimable_bytes": 8662679552,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.531609667000005,
      "owned_rss_bytes": 531202048,
      "owned_process_count": 4,
      "reclaimable_bytes": 8583823360,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.778617042,
      "owned_rss_bytes": 533938176,
      "owned_process_count": 4,
      "reclaimable_bytes": 8515928064,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.025082167,
      "owned_rss_bytes": 553385984,
      "owned_process_count": 4,
      "reclaimable_bytes": 8626520064,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.269859042,
      "owned_rss_bytes": 554500096,
      "owned_process_count": 4,
      "reclaimable_bytes": 8619819008,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.517296709,
      "owned_rss_bytes": 554778624,
      "owned_process_count": 4,
      "reclaimable_bytes": 8634040320,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.765271125000005,
      "owned_rss_bytes": 556089344,
      "owned_process_count": 4,
      "reclaimable_bytes": 8583495680,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.003040042,
      "owned_rss_bytes": 559185920,
      "owned_process_count": 4,
      "reclaimable_bytes": 8371765248,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.247709125,
      "owned_rss_bytes": 560988160,
      "owned_process_count": 4,
      "reclaimable_bytes": 8242970624,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.488865417,
      "owned_rss_bytes": 564789248,
      "owned_process_count": 4,
      "reclaimable_bytes": 8138145792,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.731590000000004,
      "owned_rss_bytes": 568819712,
      "owned_process_count": 4,
      "reclaimable_bytes": 8047312896,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.970228417,
      "owned_rss_bytes": 573292544,
      "owned_process_count": 4,
      "reclaimable_bytes": 8204206080,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.206467125,
      "owned_rss_bytes": 573374464,
      "owned_process_count": 4,
      "reclaimable_bytes": 8194654208,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.444536375000006,
      "owned_rss_bytes": 573849600,
      "owned_process_count": 4,
      "reclaimable_bytes": 8172732416,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.686698750000005,
      "owned_rss_bytes": 574029824,
      "owned_process_count": 4,
      "reclaimable_bytes": 8168652800,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.926583625,
      "owned_rss_bytes": 574439424,
      "owned_process_count": 4,
      "reclaimable_bytes": 8132608000,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.166107292,
      "owned_rss_bytes": 575356928,
      "owned_process_count": 4,
      "reclaimable_bytes": 8111030272,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.408762917000004,
      "owned_rss_bytes": 575619072,
      "owned_process_count": 4,
      "reclaimable_bytes": 8140701696,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.645806917,
      "owned_rss_bytes": 576126976,
      "owned_process_count": 4,
      "reclaimable_bytes": 8138522624,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.88384025,
      "owned_rss_bytes": 609009664,
      "owned_process_count": 4,
      "reclaimable_bytes": 8105984000,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.119074917,
      "owned_rss_bytes": 680312832,
      "owned_process_count": 4,
      "reclaimable_bytes": 8035188736,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.353479209,
      "owned_rss_bytes": 238256128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8420114432,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.594700375,
      "owned_rss_bytes": 316850176,
      "owned_process_count": 4,
      "reclaimable_bytes": 8377565184,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.829739542,
      "owned_rss_bytes": 333266944,
      "owned_process_count": 4,
      "reclaimable_bytes": 8360263680,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.069732917,
      "owned_rss_bytes": 193282048,
      "owned_process_count": 4,
      "reclaimable_bytes": 8427913216,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.313134417,
      "owned_rss_bytes": 243793920,
      "owned_process_count": 4,
      "reclaimable_bytes": 8405352448,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.555266875,
      "owned_rss_bytes": 268173312,
      "owned_process_count": 4,
      "reclaimable_bytes": 8382021632,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.794560042,
      "owned_rss_bytes": 273088512,
      "owned_process_count": 4,
      "reclaimable_bytes": 8374075392,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.0368915,
      "owned_rss_bytes": 281313280,
      "owned_process_count": 4,
      "reclaimable_bytes": 8357249024,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.279465042000005,
      "owned_rss_bytes": 287408128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8339537920,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.521904459000005,
      "owned_rss_bytes": 301547520,
      "owned_process_count": 4,
      "reclaimable_bytes": 8328740864,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.764538375,
      "owned_rss_bytes": 325287936,
      "owned_process_count": 4,
      "reclaimable_bytes": 8288239616,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.998966459,
      "owned_rss_bytes": 336035840,
      "owned_process_count": 4,
      "reclaimable_bytes": 8272035840,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.232616542,
      "owned_rss_bytes": 349601792,
      "owned_process_count": 4,
      "reclaimable_bytes": 8253374464,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.474782667,
      "owned_rss_bytes": 365264896,
      "owned_process_count": 4,
      "reclaimable_bytes": 8232468480,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.713548,
      "owned_rss_bytes": 380223488,
      "owned_process_count": 4,
      "reclaimable_bytes": 8209367040,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.953016042,
      "owned_rss_bytes": 390905856,
      "owned_process_count": 4,
      "reclaimable_bytes": 8188411904,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.191607667,
      "owned_rss_bytes": 391413760,
      "owned_process_count": 4,
      "reclaimable_bytes": 8184250368,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.433961792000005,
      "owned_rss_bytes": 395558912,
      "owned_process_count": 4,
      "reclaimable_bytes": 8179941376,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.676486292,
      "owned_rss_bytes": 397606912,
      "owned_process_count": 4,
      "reclaimable_bytes": 8173322240,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.920382084,
      "owned_rss_bytes": 398049280,
      "owned_process_count": 4,
      "reclaimable_bytes": 8166260736,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.157633667,
      "owned_rss_bytes": 398311424,
      "owned_process_count": 4,
      "reclaimable_bytes": 8170946560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.39847175,
      "owned_rss_bytes": 398540800,
      "owned_process_count": 4,
      "reclaimable_bytes": 8169062400,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.636352334,
      "owned_rss_bytes": 445120512,
      "owned_process_count": 4,
      "reclaimable_bytes": 8114700288,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.87399275,
      "owned_rss_bytes": 265601024,
      "owned_process_count": 4,
      "reclaimable_bytes": 8279638016,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.10678225,
      "owned_rss_bytes": 331350016,
      "owned_process_count": 4,
      "reclaimable_bytes": 8241561600,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.350123459,
      "owned_rss_bytes": 349945856,
      "owned_process_count": 4,
      "reclaimable_bytes": 8208891904,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.5920775,
      "owned_rss_bytes": 352239616,
      "owned_process_count": 4,
      "reclaimable_bytes": 8192098304,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.827830375000005,
      "owned_rss_bytes": 224559104,
      "owned_process_count": 4,
      "reclaimable_bytes": 8293974016,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.069687209,
      "owned_rss_bytes": 213008384,
      "owned_process_count": 4,
      "reclaimable_bytes": 8271265792,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.313719709000004,
      "owned_rss_bytes": 234799104,
      "owned_process_count": 4,
      "reclaimable_bytes": 8244920320,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.552584959,
      "owned_rss_bytes": 110952448,
      "owned_process_count": 3,
      "reclaimable_bytes": 8283111424,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.794189917000004,
      "owned_rss_bytes": 251445248,
      "owned_process_count": 4,
      "reclaimable_bytes": 8218755072,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.036586,
      "owned_rss_bytes": 316882944,
      "owned_process_count": 4,
      "reclaimable_bytes": 8182120448,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.276646,
      "owned_rss_bytes": 334888960,
      "owned_process_count": 4,
      "reclaimable_bytes": 8164671488,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.511207,
      "owned_rss_bytes": 347734016,
      "owned_process_count": 4,
      "reclaimable_bytes": 8141864960,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.753020292,
      "owned_rss_bytes": 353484800,
      "owned_process_count": 4,
      "reclaimable_bytes": 8127315968,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.994457209000004,
      "owned_rss_bytes": 359153664,
      "owned_process_count": 4,
      "reclaimable_bytes": 8119959552,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.236368750000004,
      "owned_rss_bytes": 363347968,
      "owned_process_count": 4,
      "reclaimable_bytes": 8112488448,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.477800209,
      "owned_rss_bytes": 367673344,
      "owned_process_count": 4,
      "reclaimable_bytes": 8109703168,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.713429500000004,
      "owned_rss_bytes": 372703232,
      "owned_process_count": 4,
      "reclaimable_bytes": 8089485312,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.953052542,
      "owned_rss_bytes": 376848384,
      "owned_process_count": 4,
      "reclaimable_bytes": 8069054464,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.194590375000004,
      "owned_rss_bytes": 381698048,
      "owned_process_count": 4,
      "reclaimable_bytes": 8056979456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.436499500000004,
      "owned_rss_bytes": 386613248,
      "owned_process_count": 4,
      "reclaimable_bytes": 8047214592,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.680147625000004,
      "owned_rss_bytes": 391184384,
      "owned_process_count": 4,
      "reclaimable_bytes": 8016576512,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.926147125,
      "owned_rss_bytes": 396263424,
      "owned_process_count": 4,
      "reclaimable_bytes": 8012185600,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.166994209,
      "owned_rss_bytes": 400490496,
      "owned_process_count": 4,
      "reclaimable_bytes": 7990820864,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.407746375,
      "owned_rss_bytes": 405487616,
      "owned_process_count": 4,
      "reclaimable_bytes": 7987527680,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.648975709000005,
      "owned_rss_bytes": 410435584,
      "owned_process_count": 4,
      "reclaimable_bytes": 7975469056,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.890345542000006,
      "owned_rss_bytes": 414351360,
      "owned_process_count": 4,
      "reclaimable_bytes": 7967342592,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.131838542000004,
      "owned_rss_bytes": 419528704,
      "owned_process_count": 4,
      "reclaimable_bytes": 7955660800,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.369693709,
      "owned_rss_bytes": 422641664,
      "owned_process_count": 4,
      "reclaimable_bytes": 7946960896,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.6030645,
      "owned_rss_bytes": 424919040,
      "owned_process_count": 4,
      "reclaimable_bytes": 7942176768,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.838743417,
      "owned_rss_bytes": 427524096,
      "owned_process_count": 4,
      "reclaimable_bytes": 7933968384,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.073864834000005,
      "owned_rss_bytes": 428376064,
      "owned_process_count": 4,
      "reclaimable_bytes": 7918911488,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.310281542,
      "owned_rss_bytes": 429817856,
      "owned_process_count": 4,
      "reclaimable_bytes": 7913570304,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.543224542000004,
      "owned_rss_bytes": 429817856,
      "owned_process_count": 4,
      "reclaimable_bytes": 7906672640,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.780713042,
      "owned_rss_bytes": 430030848,
      "owned_process_count": 4,
      "reclaimable_bytes": 7900872704,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.021841875,
      "owned_rss_bytes": 430030848,
      "owned_process_count": 4,
      "reclaimable_bytes": 7888437248,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.263841875,
      "owned_rss_bytes": 431783936,
      "owned_process_count": 4,
      "reclaimable_bytes": 7868268544,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.502160292,
      "owned_rss_bytes": 432619520,
      "owned_process_count": 4,
      "reclaimable_bytes": 7852621824,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.736391334,
      "owned_rss_bytes": 433979392,
      "owned_process_count": 4,
      "reclaimable_bytes": 7844823040,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.978469125,
      "owned_rss_bytes": 434487296,
      "owned_process_count": 4,
      "reclaimable_bytes": 7826341888,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.219733084,
      "owned_rss_bytes": 459210752,
      "owned_process_count": 4,
      "reclaimable_bytes": 7791607808,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.454822375,
      "owned_rss_bytes": 480149504,
      "owned_process_count": 4,
      "reclaimable_bytes": 7753580544,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.698129084,
      "owned_rss_bytes": 499105792,
      "owned_process_count": 4,
      "reclaimable_bytes": 7719567360,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.936366709,
      "owned_rss_bytes": 522010624,
      "owned_process_count": 4,
      "reclaimable_bytes": 7682736128,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.17804925,
      "owned_rss_bytes": 635469824,
      "owned_process_count": 4,
      "reclaimable_bytes": 7558594560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.415539459,
      "owned_rss_bytes": 639238144,
      "owned_process_count": 4,
      "reclaimable_bytes": 7541899264,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.657149542,
      "owned_rss_bytes": 639287296,
      "owned_process_count": 4,
      "reclaimable_bytes": 7520878592,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.899655584,
      "owned_rss_bytes": 639287296,
      "owned_process_count": 4,
      "reclaimable_bytes": 7501774848,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.139758334,
      "owned_rss_bytes": 639467520,
      "owned_process_count": 4,
      "reclaimable_bytes": 7488241664,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.381728667,
      "owned_rss_bytes": 639483904,
      "owned_process_count": 4,
      "reclaimable_bytes": 7467712512,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.621645667,
      "owned_rss_bytes": 639483904,
      "owned_process_count": 4,
      "reclaimable_bytes": 7454375936,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.85711783400001,
      "owned_rss_bytes": 639483904,
      "owned_process_count": 4,
      "reclaimable_bytes": 7437434880,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.10057725,
      "owned_rss_bytes": 639500288,
      "owned_process_count": 4,
      "reclaimable_bytes": 7416741888,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.333661084,
      "owned_rss_bytes": 639516672,
      "owned_process_count": 4,
      "reclaimable_bytes": 7390969856,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.56995975,
      "owned_rss_bytes": 641236992,
      "owned_process_count": 4,
      "reclaimable_bytes": 7375093760,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.805684167,
      "owned_rss_bytes": 644022272,
      "owned_process_count": 4,
      "reclaimable_bytes": 7356465152,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.040829875,
      "owned_rss_bytes": 644513792,
      "owned_process_count": 4,
      "reclaimable_bytes": 7310409728,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.280708459,
      "owned_rss_bytes": 648085504,
      "owned_process_count": 4,
      "reclaimable_bytes": 7317356544,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.525906334,
      "owned_rss_bytes": 652689408,
      "owned_process_count": 4,
      "reclaimable_bytes": 7297335296,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.767770917,
      "owned_rss_bytes": 665894912,
      "owned_process_count": 4,
      "reclaimable_bytes": 7272349696,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.01074458400001,
      "owned_rss_bytes": 673562624,
      "owned_process_count": 4,
      "reclaimable_bytes": 7234142208,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.250558625,
      "owned_rss_bytes": 681967616,
      "owned_process_count": 4,
      "reclaimable_bytes": 7198113792,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.486362875,
      "owned_rss_bytes": 691650560,
      "owned_process_count": 4,
      "reclaimable_bytes": 7169523712,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.71970683400001,
      "owned_rss_bytes": 695238656,
      "owned_process_count": 4,
      "reclaimable_bytes": 7143194624,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.958979459,
      "owned_rss_bytes": 702283776,
      "owned_process_count": 4,
      "reclaimable_bytes": 7124484096,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.19703737500001,
      "owned_rss_bytes": 706150400,
      "owned_process_count": 4,
      "reclaimable_bytes": 7091978240,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.436369875,
      "owned_rss_bytes": 721125376,
      "owned_process_count": 4,
      "reclaimable_bytes": 7065174016,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.678457334,
      "owned_rss_bytes": 728891392,
      "owned_process_count": 4,
      "reclaimable_bytes": 7018086400,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.920786042,
      "owned_rss_bytes": 735264768,
      "owned_process_count": 4,
      "reclaimable_bytes": 6987923456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.1631395,
      "owned_rss_bytes": 746864640,
      "owned_process_count": 4,
      "reclaimable_bytes": 6966116352,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.406605459,
      "owned_rss_bytes": 754565120,
      "owned_process_count": 4,
      "reclaimable_bytes": 6938673152,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.64313079200001,
      "owned_rss_bytes": 761757696,
      "owned_process_count": 4,
      "reclaimable_bytes": 6907330560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.882642459,
      "owned_rss_bytes": 771670016,
      "owned_process_count": 4,
      "reclaimable_bytes": 6874398720,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.115683584,
      "owned_rss_bytes": 779173888,
      "owned_process_count": 4,
      "reclaimable_bytes": 6835945472,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.353121917,
      "owned_rss_bytes": 787070976,
      "owned_process_count": 4,
      "reclaimable_bytes": 6801883136,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.594928542,
      "owned_rss_bytes": 792707072,
      "owned_process_count": 4,
      "reclaimable_bytes": 6769115136,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.83453475,
      "owned_rss_bytes": 795656192,
      "owned_process_count": 4,
      "reclaimable_bytes": 6742294528,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.079216917,
      "owned_rss_bytes": 797294592,
      "owned_process_count": 4,
      "reclaimable_bytes": 6715211776,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.319739209,
      "owned_rss_bytes": 804831232,
      "owned_process_count": 4,
      "reclaimable_bytes": 6687113216,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.561591625,
      "owned_rss_bytes": 814481408,
      "owned_process_count": 4,
      "reclaimable_bytes": 6650740736,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.803432417,
      "owned_rss_bytes": 822935552,
      "owned_process_count": 4,
      "reclaimable_bytes": 6621085696,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.046843792,
      "owned_rss_bytes": 829767680,
      "owned_process_count": 4,
      "reclaimable_bytes": 6597083136,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.288181959,
      "owned_rss_bytes": 842514432,
      "owned_process_count": 4,
      "reclaimable_bytes": 6560645120,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.52414620900001,
      "owned_rss_bytes": 845496320,
      "owned_process_count": 4,
      "reclaimable_bytes": 6621331456,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.761204125,
      "owned_rss_bytes": 848658432,
      "owned_process_count": 4,
      "reclaimable_bytes": 6583500800,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.003558917,
      "owned_rss_bytes": 854933504,
      "owned_process_count": 4,
      "reclaimable_bytes": 6549766144,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.246812167,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 6518112256,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.479952959,
      "owned_rss_bytes": 872169472,
      "owned_process_count": 4,
      "reclaimable_bytes": 6489735168,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.71976404200001,
      "owned_rss_bytes": 872939520,
      "owned_process_count": 4,
      "reclaimable_bytes": 6463586304,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.959637875,
      "owned_rss_bytes": 873136128,
      "owned_process_count": 4,
      "reclaimable_bytes": 6243827712,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.196465,
      "owned_rss_bytes": 873201664,
      "owned_process_count": 4,
      "reclaimable_bytes": 6220103680,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.43640208400001,
      "owned_rss_bytes": 880558080,
      "owned_process_count": 4,
      "reclaimable_bytes": 6183960576,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.669784875,
      "owned_rss_bytes": 881672192,
      "owned_process_count": 4,
      "reclaimable_bytes": 6152257536,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.903084917,
      "owned_rss_bytes": 882163712,
      "owned_process_count": 4,
      "reclaimable_bytes": 6127042560,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.139975459,
      "owned_rss_bytes": 882294784,
      "owned_process_count": 4,
      "reclaimable_bytes": 6294700032,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.37835025,
      "owned_rss_bytes": 884899840,
      "owned_process_count": 4,
      "reclaimable_bytes": 6276251648,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.620365209,
      "owned_rss_bytes": 885850112,
      "owned_process_count": 4,
      "reclaimable_bytes": 6256803840,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.861707209,
      "owned_rss_bytes": 887209984,
      "owned_process_count": 4,
      "reclaimable_bytes": 6228426752,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.102048125,
      "owned_rss_bytes": 887930880,
      "owned_process_count": 4,
      "reclaimable_bytes": 6207684608,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.3364065,
      "owned_rss_bytes": 888291328,
      "owned_process_count": 4,
      "reclaimable_bytes": 6183288832,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.57971525,
      "owned_rss_bytes": 890454016,
      "owned_process_count": 4,
      "reclaimable_bytes": 6156419072,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.819448459,
      "owned_rss_bytes": 891109376,
      "owned_process_count": 4,
      "reclaimable_bytes": 6137511936,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.061619209,
      "owned_rss_bytes": 898121728,
      "owned_process_count": 4,
      "reclaimable_bytes": 6114672640,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.29708966700001,
      "owned_rss_bytes": 898891776,
      "owned_process_count": 4,
      "reclaimable_bytes": 6092062720,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.534994875,
      "owned_rss_bytes": 900071424,
      "owned_process_count": 4,
      "reclaimable_bytes": 6074695680,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.769774709,
      "owned_rss_bytes": 901480448,
      "owned_process_count": 4,
      "reclaimable_bytes": 6057918464,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.00326525,
      "owned_rss_bytes": 902381568,
      "owned_process_count": 4,
      "reclaimable_bytes": 6015401984,
      "swapins": 44112650,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.245626167,
      "owned_rss_bytes": 904314880,
      "owned_process_count": 4,
      "reclaimable_bytes": 5982928896,
      "swapins": 44112650,
      "swapouts": 77525566
    }
  ],
  "passed": false,
  "classification": "serial build only; not model qualification",
  "child_pid": 20222,
  "error": "RuntimeError: live reclaimable memory fell below the serial-build floor",
  "traceback": "Traceback (most recent call last):\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 136, in guarded_run\n    check_sample(current, rss_bytes, before['swapouts'], policy)\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 58, in check_sample\n    raise RuntimeError('live reclaimable memory fell below the serial-build floor')\nRuntimeError: live reclaimable memory fell below the serial-build floor\n",
  "owned_groups": [
    20222,
    21928,
    21930
  ],
  "cleanup_error": "PermissionError: [Errno 1] Operation not permitted",
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 81.41937008400001,
  "child_exit_code": -15,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 6680395776,
    "swapins": 44112650,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47084.\nPages active:                                 926596.\nPages inactive:                               922710.\nPages speculative:                              2454.\nPages throttled:                                   0.\nPages wired down:                             359097.\nPages purgeable:                                7850.\n\"Translation faults\":                    15422999510.\nPages copy-on-write:                       736329695.\nPages zero filled:                       21224929434.\nPages reactivated:                        3470833500.\nPages purged:                               72245849.\nFile-backed pages:                            352805.\nAnonymous pages:                             1498955.\nPages stored in compressor:                  1976490.\nPages occupied by compressor:                 827389.\nDecompressions:                           1172042174.\nCompressions:                             1487077413.\nPageins:                                  7621893471.\nPageouts:                                   11083087.\nSwapins:                                    44112650.\nSwapouts:                                   77525566.\nPages tagged:                                 184105.\nPages tagged resident:                        136285.\nPages tagged compressed:                       47820.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8681.\nPages tag-storage free:                          462.\nPages tag-storage non-tag pageable:            89153.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7182336.\nTagged compressions:                        11276977.\nTagged decompressions:                      10397159.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v271/live-memory.samples.jsonl

SHA-256 `c724abfaaf0c936a21d29339ac8f4a6800c5f70a85060482073a10258204d51c`; 57191 bytes.

````text
{"elapsed_seconds": 0.0037763339999999923, "owned_rss_bytes": 6127616, "owned_process_count": 1, "reclaimable_bytes": 12241436672, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 0.23528241700000008, "owned_rss_bytes": 2195456, "owned_process_count": 2, "reclaimable_bytes": 12236357632, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 0.4701151669999999, "owned_rss_bytes": 45547520, "owned_process_count": 3, "reclaimable_bytes": 12229754880, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 0.705707584, "owned_rss_bytes": 49233920, "owned_process_count": 2, "reclaimable_bytes": 12226002944, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 0.9431985839999999, "owned_rss_bytes": 67534848, "owned_process_count": 2, "reclaimable_bytes": 12208799744, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 1.17825925, "owned_rss_bytes": 70369280, "owned_process_count": 2, "reclaimable_bytes": 12192088064, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 1.412249875, "owned_rss_bytes": 70828032, "owned_process_count": 2, "reclaimable_bytes": 12239650816, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 1.649421459, "owned_rss_bytes": 74776576, "owned_process_count": 2, "reclaimable_bytes": 12241649664, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 1.8834555000000002, "owned_rss_bytes": 93290496, "owned_process_count": 3, "reclaimable_bytes": 12188336128, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 2.119958709, "owned_rss_bytes": 198754304, "owned_process_count": 4, "reclaimable_bytes": 12119490560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 2.352841042, "owned_rss_bytes": 237928448, "owned_process_count": 4, "reclaimable_bytes": 12085919744, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 2.592614625, "owned_rss_bytes": 146178048, "owned_process_count": 4, "reclaimable_bytes": 12118654976, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 2.830344459, "owned_rss_bytes": 93650944, "owned_process_count": 3, "reclaimable_bytes": 12137922560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 3.067504167, "owned_rss_bytes": 93650944, "owned_process_count": 3, "reclaimable_bytes": 12116099072, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 3.3036817499999995, "owned_rss_bytes": 93667328, "owned_process_count": 2, "reclaimable_bytes": 12114542592, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 3.538933875, "owned_rss_bytes": 93667328, "owned_process_count": 2, "reclaimable_bytes": 12113592320, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 3.7757080000000003, "owned_rss_bytes": 93782016, "owned_process_count": 2, "reclaimable_bytes": 12119883776, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 4.0111043340000005, "owned_rss_bytes": 160628736, "owned_process_count": 4, "reclaimable_bytes": 12118097920, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 4.2428395420000005, "owned_rss_bytes": 176963584, "owned_process_count": 4, "reclaimable_bytes": 12097814528, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 4.478968459000001, "owned_rss_bytes": 221036544, "owned_process_count": 5, "reclaimable_bytes": 12028592128, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 4.718649167000001, "owned_rss_bytes": 131088384, "owned_process_count": 4, "reclaimable_bytes": 12113936384, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 4.954819125, "owned_rss_bytes": 134545408, "owned_process_count": 4, "reclaimable_bytes": 12106629120, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 5.191664125000001, "owned_rss_bytes": 203898880, "owned_process_count": 5, "reclaimable_bytes": 12064784384, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 5.429361625, "owned_rss_bytes": 102432768, "owned_process_count": 3, "reclaimable_bytes": 12148686848, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 5.6662037089999995, "owned_rss_bytes": 220987392, "owned_process_count": 4, "reclaimable_bytes": 12112330752, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 5.901977292, "owned_rss_bytes": 141180928, "owned_process_count": 4, "reclaimable_bytes": 12137791488, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 6.1358817089999995, "owned_rss_bytes": 234225664, "owned_process_count": 4, "reclaimable_bytes": 12081201152, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 6.373637209, "owned_rss_bytes": 251805696, "owned_process_count": 4, "reclaimable_bytes": 12078383104, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 6.609378417, "owned_rss_bytes": 185794560, "owned_process_count": 4, "reclaimable_bytes": 12117245952, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 6.844458124999999, "owned_rss_bytes": 269860864, "owned_process_count": 4, "reclaimable_bytes": 12081643520, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 7.080320292, "owned_rss_bytes": 293994496, "owned_process_count": 4, "reclaimable_bytes": 12052512768, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 7.317646625, "owned_rss_bytes": 299106304, "owned_process_count": 4, "reclaimable_bytes": 12038389760, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 7.556195375, "owned_rss_bytes": 210239488, "owned_process_count": 4, "reclaimable_bytes": 12093489152, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 7.792634209000001, "owned_rss_bytes": 224051200, "owned_process_count": 4, "reclaimable_bytes": 12085297152, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 8.031641459000001, "owned_rss_bytes": 248332288, "owned_process_count": 4, "reclaimable_bytes": 12065832960, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 8.268617292, "owned_rss_bytes": 271974400, "owned_process_count": 4, "reclaimable_bytes": 12044025856, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 8.506871709, "owned_rss_bytes": 285982720, "owned_process_count": 4, "reclaimable_bytes": 12029329408, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 8.744426834, "owned_rss_bytes": 294223872, "owned_process_count": 4, "reclaimable_bytes": 12023054336, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 8.981457959, "owned_rss_bytes": 303022080, "owned_process_count": 4, "reclaimable_bytes": 12018106368, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 9.219217625, "owned_rss_bytes": 303398912, "owned_process_count": 4, "reclaimable_bytes": 12020236288, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 9.455346917, "owned_rss_bytes": 337068032, "owned_process_count": 4, "reclaimable_bytes": 11983159296, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 9.693603875, "owned_rss_bytes": 203227136, "owned_process_count": 4, "reclaimable_bytes": 12093554688, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 9.929207459, "owned_rss_bytes": 283836416, "owned_process_count": 4, "reclaimable_bytes": 12065914880, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 10.16741775, "owned_rss_bytes": 186892288, "owned_process_count": 4, "reclaimable_bytes": 12112330752, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 10.401946667, "owned_rss_bytes": 261308416, "owned_process_count": 4, "reclaimable_bytes": 12077563904, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 10.635307917, "owned_rss_bytes": 276234240, "owned_process_count": 4, "reclaimable_bytes": 12068667392, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 10.87300025, "owned_rss_bytes": 294420480, "owned_process_count": 4, "reclaimable_bytes": 12048351232, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 11.110955917, "owned_rss_bytes": 324927488, "owned_process_count": 4, "reclaimable_bytes": 12016009216, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 11.350034375, "owned_rss_bytes": 342376448, "owned_process_count": 4, "reclaimable_bytes": 12005900288, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 11.585309417000001, "owned_rss_bytes": 353173504, "owned_process_count": 4, "reclaimable_bytes": 11996659712, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 11.822516834, "owned_rss_bytes": 366395392, "owned_process_count": 4, "reclaimable_bytes": 11983093760, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 12.060008167000001, "owned_rss_bytes": 380993536, "owned_process_count": 4, "reclaimable_bytes": 11964792832, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 12.297709709000001, "owned_rss_bytes": 390447104, "owned_process_count": 4, "reclaimable_bytes": 11954683904, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 12.535940834, "owned_rss_bytes": 399310848, "owned_process_count": 4, "reclaimable_bytes": 11943247872, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 12.774968917, "owned_rss_bytes": 409485312, "owned_process_count": 4, "reclaimable_bytes": 11933548544, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 13.012093084, "owned_rss_bytes": 417464320, "owned_process_count": 4, "reclaimable_bytes": 11936612352, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 13.248492667, "owned_rss_bytes": 427819008, "owned_process_count": 4, "reclaimable_bytes": 11922849792, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 13.483159500000001, "owned_rss_bytes": 433324032, "owned_process_count": 4, "reclaimable_bytes": 11927175168, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 13.721573875, "owned_rss_bytes": 442695680, "owned_process_count": 4, "reclaimable_bytes": 11914674176, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 13.96018575, "owned_rss_bytes": 451559424, "owned_process_count": 4, "reclaimable_bytes": 11907956736, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 14.196603292, "owned_rss_bytes": 455835648, "owned_process_count": 4, "reclaimable_bytes": 11907792896, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 14.43922525, "owned_rss_bytes": 457523200, "owned_process_count": 4, "reclaimable_bytes": 11904876544, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 14.675665167, "owned_rss_bytes": 459554816, "owned_process_count": 4, "reclaimable_bytes": 11903483904, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 14.912948125, "owned_rss_bytes": 463372288, "owned_process_count": 4, "reclaimable_bytes": 11887394816, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 15.150984625, "owned_rss_bytes": 465387520, "owned_process_count": 4, "reclaimable_bytes": 11879776256, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 15.385300417000002, "owned_rss_bytes": 469516288, "owned_process_count": 4, "reclaimable_bytes": 11882627072, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 15.621262, "owned_rss_bytes": 472023040, "owned_process_count": 4, "reclaimable_bytes": 11875467264, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 15.857566959000001, "owned_rss_bytes": 478593024, "owned_process_count": 4, "reclaimable_bytes": 11874582528, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 16.096222542, "owned_rss_bytes": 481787904, "owned_process_count": 4, "reclaimable_bytes": 11869650944, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 16.334634917, "owned_rss_bytes": 484556800, "owned_process_count": 4, "reclaimable_bytes": 11871010816, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 16.568801542, "owned_rss_bytes": 491225088, "owned_process_count": 4, "reclaimable_bytes": 11863359488, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 16.802935584, "owned_rss_bytes": 494583808, "owned_process_count": 4, "reclaimable_bytes": 11674779648, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 17.040172834, "owned_rss_bytes": 494632960, "owned_process_count": 4, "reclaimable_bytes": 11682660352, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 17.275815166999998, "owned_rss_bytes": 495108096, "owned_process_count": 4, "reclaimable_bytes": 11673436160, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 17.507667249999997, "owned_rss_bytes": 503005184, "owned_process_count": 4, "reclaimable_bytes": 11671912448, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 17.74421675, "owned_rss_bytes": 504053760, "owned_process_count": 4, "reclaimable_bytes": 11666259968, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 17.978799875, "owned_rss_bytes": 506363904, "owned_process_count": 4, "reclaimable_bytes": 11848351744, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 18.212671375, "owned_rss_bytes": 508248064, "owned_process_count": 4, "reclaimable_bytes": 11846549504, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 18.444488542, "owned_rss_bytes": 508411904, "owned_process_count": 4, "reclaimable_bytes": 11840389120, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 18.6810525, "owned_rss_bytes": 508428288, "owned_process_count": 4, "reclaimable_bytes": 11822907392, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 18.92066225, "owned_rss_bytes": 508887040, "owned_process_count": 4, "reclaimable_bytes": 11827707904, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 19.162278875, "owned_rss_bytes": 509607936, "owned_process_count": 4, "reclaimable_bytes": 11826626560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 19.399196542, "owned_rss_bytes": 509902848, "owned_process_count": 4, "reclaimable_bytes": 11827412992, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 19.638080499999997, "owned_rss_bytes": 510099456, "owned_process_count": 4, "reclaimable_bytes": 11822514176, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 19.877039625, "owned_rss_bytes": 510853120, "owned_process_count": 4, "reclaimable_bytes": 11821203456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 20.11586225, "owned_rss_bytes": 510935040, "owned_process_count": 4, "reclaimable_bytes": 11817451520, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 20.352886041999998, "owned_rss_bytes": 511787008, "owned_process_count": 4, "reclaimable_bytes": 11816517632, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 20.590683875, "owned_rss_bytes": 511934464, "owned_process_count": 4, "reclaimable_bytes": 11817091072, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 20.827834791999997, "owned_rss_bytes": 511967232, "owned_process_count": 4, "reclaimable_bytes": 11815092224, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 21.064809209, "owned_rss_bytes": 512229376, "owned_process_count": 4, "reclaimable_bytes": 11825496064, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 21.301668791999997, "owned_rss_bytes": 512540672, "owned_process_count": 4, "reclaimable_bytes": 11821072384, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 21.538643584, "owned_rss_bytes": 512606208, "owned_process_count": 4, "reclaimable_bytes": 11824431104, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 21.772961125, "owned_rss_bytes": 526401536, "owned_process_count": 4, "reclaimable_bytes": 11811799040, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 22.009969458999997, "owned_rss_bytes": 625967104, "owned_process_count": 4, "reclaimable_bytes": 11701092352, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 22.250679249999997, "owned_rss_bytes": 213581824, "owned_process_count": 4, "reclaimable_bytes": 12069011456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 22.494806834, "owned_rss_bytes": 288243712, "owned_process_count": 4, "reclaimable_bytes": 12036833280, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 22.729976334, "owned_rss_bytes": 315441152, "owned_process_count": 4, "reclaimable_bytes": 12015714304, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 22.972125583999997, "owned_rss_bytes": 327254016, "owned_process_count": 4, "reclaimable_bytes": 11997134848, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 23.207852791999997, "owned_rss_bytes": 354861056, "owned_process_count": 4, "reclaimable_bytes": 11978899456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 23.451327959, "owned_rss_bytes": 383107072, "owned_process_count": 4, "reclaimable_bytes": 11953127424, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 23.686311334, "owned_rss_bytes": 405356544, "owned_process_count": 4, "reclaimable_bytes": 11925356544, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 23.919671083999997, "owned_rss_bytes": 417726464, "owned_process_count": 4, "reclaimable_bytes": 11917082624, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 24.159973417, "owned_rss_bytes": 431751168, "owned_process_count": 4, "reclaimable_bytes": 11896881152, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 24.402151209, "owned_rss_bytes": 455999488, "owned_process_count": 4, "reclaimable_bytes": 11877285888, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 24.634257917, "owned_rss_bytes": 478822400, "owned_process_count": 4, "reclaimable_bytes": 11861229568, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 24.870894084, "owned_rss_bytes": 481165312, "owned_process_count": 4, "reclaimable_bytes": 11841208320, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 25.115701917, "owned_rss_bytes": 487489536, "owned_process_count": 4, "reclaimable_bytes": 11820269568, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 25.357367749999998, "owned_rss_bytes": 500826112, "owned_process_count": 4, "reclaimable_bytes": 11761287168, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 25.604815125, "owned_rss_bytes": 513474560, "owned_process_count": 4, "reclaimable_bytes": 11739070464, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 25.845811542, "owned_rss_bytes": 523419648, "owned_process_count": 4, "reclaimable_bytes": 11723161600, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 26.092335583999997, "owned_rss_bytes": 532332544, "owned_process_count": 4, "reclaimable_bytes": 11711053824, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 26.341010834, "owned_rss_bytes": 539131904, "owned_process_count": 4, "reclaimable_bytes": 12878266368, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 26.590143709, "owned_rss_bytes": 550027264, "owned_process_count": 4, "reclaimable_bytes": 13781762048, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 26.830576167, "owned_rss_bytes": 562380800, "owned_process_count": 4, "reclaimable_bytes": 13790396416, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 27.07343625, "owned_rss_bytes": 564379648, "owned_process_count": 4, "reclaimable_bytes": 13778960384, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 27.316184042, "owned_rss_bytes": 569589760, "owned_process_count": 4, "reclaimable_bytes": 13773225984, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 27.558991834, "owned_rss_bytes": 578633728, "owned_process_count": 4, "reclaimable_bytes": 13746634752, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 27.802613542, "owned_rss_bytes": 591396864, "owned_process_count": 4, "reclaimable_bytes": 13697482752, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 28.038780167, "owned_rss_bytes": 601538560, "owned_process_count": 4, "reclaimable_bytes": 13725286400, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 28.274179292, "owned_rss_bytes": 611008512, "owned_process_count": 4, "reclaimable_bytes": 13710786560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 28.513907125, "owned_rss_bytes": 617398272, "owned_process_count": 4, "reclaimable_bytes": 13695238144, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 28.75297325, "owned_rss_bytes": 626589696, "owned_process_count": 4, "reclaimable_bytes": 13654753280, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 28.986326124999998, "owned_rss_bytes": 642252800, "owned_process_count": 4, "reclaimable_bytes": 13627588608, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 29.227356375, "owned_rss_bytes": 652394496, "owned_process_count": 4, "reclaimable_bytes": 13445791744, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 29.463809959, "owned_rss_bytes": 653312000, "owned_process_count": 4, "reclaimable_bytes": 13419134976, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 29.705291583999998, "owned_rss_bytes": 653312000, "owned_process_count": 4, "reclaimable_bytes": 12922241024, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 29.946983209, "owned_rss_bytes": 653328384, "owned_process_count": 4, "reclaimable_bytes": 12768624640, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 30.189809584, "owned_rss_bytes": 652197888, "owned_process_count": 4, "reclaimable_bytes": 12348424192, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 30.433741333999997, "owned_rss_bytes": 652787712, "owned_process_count": 4, "reclaimable_bytes": 12333629440, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 30.670857959, "owned_rss_bytes": 653623296, "owned_process_count": 4, "reclaimable_bytes": 12255854592, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 30.912504166999998, "owned_rss_bytes": 654704640, "owned_process_count": 4, "reclaimable_bytes": 12180963328, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 31.153019459, "owned_rss_bytes": 655065088, "owned_process_count": 4, "reclaimable_bytes": 11935662080, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 31.396950999999998, "owned_rss_bytes": 655097856, "owned_process_count": 4, "reclaimable_bytes": 11878006784, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 31.6363375, "owned_rss_bytes": 656588800, "owned_process_count": 4, "reclaimable_bytes": 11817795584, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 31.878199042000002, "owned_rss_bytes": 722255872, "owned_process_count": 4, "reclaimable_bytes": 11683692544, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 32.1155745, "owned_rss_bytes": 813023232, "owned_process_count": 4, "reclaimable_bytes": 11717328896, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 32.355150084, "owned_rss_bytes": 142688256, "owned_process_count": 4, "reclaimable_bytes": 12183699456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 32.5903755, "owned_rss_bytes": 104251392, "owned_process_count": 3, "reclaimable_bytes": 12146917376, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 32.828628292000005, "owned_rss_bytes": 231768064, "owned_process_count": 4, "reclaimable_bytes": 12048957440, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 33.068726084000005, "owned_rss_bytes": 305233920, "owned_process_count": 4, "reclaimable_bytes": 11963105280, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 33.309393750000005, "owned_rss_bytes": 348700672, "owned_process_count": 4, "reclaimable_bytes": 11870322688, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 33.548349625, "owned_rss_bytes": 371621888, "owned_process_count": 4, "reclaimable_bytes": 11800133632, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 33.78407425, "owned_rss_bytes": 392396800, "owned_process_count": 4, "reclaimable_bytes": 11727618048, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 34.023209792, "owned_rss_bytes": 407142400, "owned_process_count": 4, "reclaimable_bytes": 11674189824, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 34.265280417, "owned_rss_bytes": 419463168, "owned_process_count": 4, "reclaimable_bytes": 11655315456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 34.503957584000005, "owned_rss_bytes": 423346176, "owned_process_count": 4, "reclaimable_bytes": 11652694016, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 34.737887917, "owned_rss_bytes": 429178880, "owned_process_count": 4, "reclaimable_bytes": 11643011072, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 34.97854575, "owned_rss_bytes": 429998080, "owned_process_count": 4, "reclaimable_bytes": 11633819648, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 35.21565575, "owned_rss_bytes": 430751744, "owned_process_count": 4, "reclaimable_bytes": 11630379008, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 35.455987750000006, "owned_rss_bytes": 144719872, "owned_process_count": 4, "reclaimable_bytes": 11821072384, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 35.695026917, "owned_rss_bytes": 288964608, "owned_process_count": 4, "reclaimable_bytes": 11718377472, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 35.929142584000004, "owned_rss_bytes": 340541440, "owned_process_count": 4, "reclaimable_bytes": 11638374400, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 36.166558875, "owned_rss_bytes": 375193600, "owned_process_count": 4, "reclaimable_bytes": 11617894400, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 36.406839209000005, "owned_rss_bytes": 392691712, "owned_process_count": 4, "reclaimable_bytes": 11599495168, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 36.644100375, "owned_rss_bytes": 409174016, "owned_process_count": 4, "reclaimable_bytes": 11589730304, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 36.884203750000005, "owned_rss_bytes": 426016768, "owned_process_count": 4, "reclaimable_bytes": 11576164352, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 37.119702167, "owned_rss_bytes": 444792832, "owned_process_count": 4, "reclaimable_bytes": 10315104256, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 37.359418709, "owned_rss_bytes": 455049216, "owned_process_count": 4, "reclaimable_bytes": 10272014336, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 37.595112209, "owned_rss_bytes": 458670080, "owned_process_count": 4, "reclaimable_bytes": 10233430016, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 37.835853292, "owned_rss_bytes": 466911232, "owned_process_count": 4, "reclaimable_bytes": 10199449600, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 38.076480667000006, "owned_rss_bytes": 467615744, "owned_process_count": 4, "reclaimable_bytes": 10171187200, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 38.313957875, "owned_rss_bytes": 467697664, "owned_process_count": 4, "reclaimable_bytes": 10139795456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 38.55385025, "owned_rss_bytes": 468090880, "owned_process_count": 4, "reclaimable_bytes": 10118217728, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 38.795299375, "owned_rss_bytes": 471531520, "owned_process_count": 4, "reclaimable_bytes": 10086875136, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 39.030478667000004, "owned_rss_bytes": 475086848, "owned_process_count": 4, "reclaimable_bytes": 10237935616, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 39.271959042, "owned_rss_bytes": 475578368, "owned_process_count": 4, "reclaimable_bytes": 10209247232, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 39.505431125, "owned_rss_bytes": 475906048, "owned_process_count": 4, "reclaimable_bytes": 10171662336, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 39.74638275, "owned_rss_bytes": 475987968, "owned_process_count": 4, "reclaimable_bytes": 10111959040, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 39.984441459, "owned_rss_bytes": 476184576, "owned_process_count": 4, "reclaimable_bytes": 10049241088, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 40.219655417000006, "owned_rss_bytes": 103546880, "owned_process_count": 3, "reclaimable_bytes": 10213605376, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 40.455447542, "owned_rss_bytes": 242106368, "owned_process_count": 4, "reclaimable_bytes": 10112188416, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 40.690628709, "owned_rss_bytes": 284950528, "owned_process_count": 4, "reclaimable_bytes": 10012016640, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 40.931653459, "owned_rss_bytes": 297861120, "owned_process_count": 4, "reclaimable_bytes": 9944989696, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 41.172065209, "owned_rss_bytes": 310198272, "owned_process_count": 4, "reclaimable_bytes": 9879388160, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 41.414586334, "owned_rss_bytes": 341114880, "owned_process_count": 4, "reclaimable_bytes": 9821519872, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 41.654639584, "owned_rss_bytes": 366592000, "owned_process_count": 4, "reclaimable_bytes": 9776726016, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 41.890506459, "owned_rss_bytes": 428916736, "owned_process_count": 4, "reclaimable_bytes": 9712762880, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 42.132003709, "owned_rss_bytes": 429096960, "owned_process_count": 4, "reclaimable_bytes": 9642721280, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 42.369691417000006, "owned_rss_bytes": 429162496, "owned_process_count": 4, "reclaimable_bytes": 9582510080, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 42.603316292, "owned_rss_bytes": 429309952, "owned_process_count": 4, "reclaimable_bytes": 9469509632, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 42.845509209, "owned_rss_bytes": 431063040, "owned_process_count": 4, "reclaimable_bytes": 9454698496, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 43.079446667, "owned_rss_bytes": 436305920, "owned_process_count": 4, "reclaimable_bytes": 9419243520, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 43.319339375000006, "owned_rss_bytes": 448921600, "owned_process_count": 4, "reclaimable_bytes": 9404104704, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 43.558974667, "owned_rss_bytes": 456589312, "owned_process_count": 4, "reclaimable_bytes": 9312075776, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 43.806607334, "owned_rss_bytes": 460734464, "owned_process_count": 4, "reclaimable_bytes": 9226698752, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 44.050788709, "owned_rss_bytes": 465256448, "owned_process_count": 4, "reclaimable_bytes": 9140518912, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 44.288507417000005, "owned_rss_bytes": 474267648, "owned_process_count": 4, "reclaimable_bytes": 9026928640, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 44.536377375, "owned_rss_bytes": 485621760, "owned_process_count": 4, "reclaimable_bytes": 8930607104, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 44.782686959, "owned_rss_bytes": 494485504, "owned_process_count": 4, "reclaimable_bytes": 8844525568, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 45.034463084, "owned_rss_bytes": 506953728, "owned_process_count": 4, "reclaimable_bytes": 8746467328, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 45.281646709, "owned_rss_bytes": 519356416, "owned_process_count": 4, "reclaimable_bytes": 8662679552, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 45.531609667000005, "owned_rss_bytes": 531202048, "owned_process_count": 4, "reclaimable_bytes": 8583823360, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 45.778617042, "owned_rss_bytes": 533938176, "owned_process_count": 4, "reclaimable_bytes": 8515928064, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 46.025082167, "owned_rss_bytes": 553385984, "owned_process_count": 4, "reclaimable_bytes": 8626520064, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 46.269859042, "owned_rss_bytes": 554500096, "owned_process_count": 4, "reclaimable_bytes": 8619819008, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 46.517296709, "owned_rss_bytes": 554778624, "owned_process_count": 4, "reclaimable_bytes": 8634040320, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 46.765271125000005, "owned_rss_bytes": 556089344, "owned_process_count": 4, "reclaimable_bytes": 8583495680, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 47.003040042, "owned_rss_bytes": 559185920, "owned_process_count": 4, "reclaimable_bytes": 8371765248, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 47.247709125, "owned_rss_bytes": 560988160, "owned_process_count": 4, "reclaimable_bytes": 8242970624, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 47.488865417, "owned_rss_bytes": 564789248, "owned_process_count": 4, "reclaimable_bytes": 8138145792, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 47.731590000000004, "owned_rss_bytes": 568819712, "owned_process_count": 4, "reclaimable_bytes": 8047312896, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 47.970228417, "owned_rss_bytes": 573292544, "owned_process_count": 4, "reclaimable_bytes": 8204206080, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 48.206467125, "owned_rss_bytes": 573374464, "owned_process_count": 4, "reclaimable_bytes": 8194654208, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 48.444536375000006, "owned_rss_bytes": 573849600, "owned_process_count": 4, "reclaimable_bytes": 8172732416, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 48.686698750000005, "owned_rss_bytes": 574029824, "owned_process_count": 4, "reclaimable_bytes": 8168652800, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 48.926583625, "owned_rss_bytes": 574439424, "owned_process_count": 4, "reclaimable_bytes": 8132608000, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 49.166107292, "owned_rss_bytes": 575356928, "owned_process_count": 4, "reclaimable_bytes": 8111030272, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 49.408762917000004, "owned_rss_bytes": 575619072, "owned_process_count": 4, "reclaimable_bytes": 8140701696, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 49.645806917, "owned_rss_bytes": 576126976, "owned_process_count": 4, "reclaimable_bytes": 8138522624, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 49.88384025, "owned_rss_bytes": 609009664, "owned_process_count": 4, "reclaimable_bytes": 8105984000, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 50.119074917, "owned_rss_bytes": 680312832, "owned_process_count": 4, "reclaimable_bytes": 8035188736, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 50.353479209, "owned_rss_bytes": 238256128, "owned_process_count": 4, "reclaimable_bytes": 8420114432, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 50.594700375, "owned_rss_bytes": 316850176, "owned_process_count": 4, "reclaimable_bytes": 8377565184, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 50.829739542, "owned_rss_bytes": 333266944, "owned_process_count": 4, "reclaimable_bytes": 8360263680, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 51.069732917, "owned_rss_bytes": 193282048, "owned_process_count": 4, "reclaimable_bytes": 8427913216, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 51.313134417, "owned_rss_bytes": 243793920, "owned_process_count": 4, "reclaimable_bytes": 8405352448, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 51.555266875, "owned_rss_bytes": 268173312, "owned_process_count": 4, "reclaimable_bytes": 8382021632, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 51.794560042, "owned_rss_bytes": 273088512, "owned_process_count": 4, "reclaimable_bytes": 8374075392, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 52.0368915, "owned_rss_bytes": 281313280, "owned_process_count": 4, "reclaimable_bytes": 8357249024, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 52.279465042000005, "owned_rss_bytes": 287408128, "owned_process_count": 4, "reclaimable_bytes": 8339537920, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 52.521904459000005, "owned_rss_bytes": 301547520, "owned_process_count": 4, "reclaimable_bytes": 8328740864, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 52.764538375, "owned_rss_bytes": 325287936, "owned_process_count": 4, "reclaimable_bytes": 8288239616, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 52.998966459, "owned_rss_bytes": 336035840, "owned_process_count": 4, "reclaimable_bytes": 8272035840, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 53.232616542, "owned_rss_bytes": 349601792, "owned_process_count": 4, "reclaimable_bytes": 8253374464, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 53.474782667, "owned_rss_bytes": 365264896, "owned_process_count": 4, "reclaimable_bytes": 8232468480, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 53.713548, "owned_rss_bytes": 380223488, "owned_process_count": 4, "reclaimable_bytes": 8209367040, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 53.953016042, "owned_rss_bytes": 390905856, "owned_process_count": 4, "reclaimable_bytes": 8188411904, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 54.191607667, "owned_rss_bytes": 391413760, "owned_process_count": 4, "reclaimable_bytes": 8184250368, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 54.433961792000005, "owned_rss_bytes": 395558912, "owned_process_count": 4, "reclaimable_bytes": 8179941376, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 54.676486292, "owned_rss_bytes": 397606912, "owned_process_count": 4, "reclaimable_bytes": 8173322240, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 54.920382084, "owned_rss_bytes": 398049280, "owned_process_count": 4, "reclaimable_bytes": 8166260736, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 55.157633667, "owned_rss_bytes": 398311424, "owned_process_count": 4, "reclaimable_bytes": 8170946560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 55.39847175, "owned_rss_bytes": 398540800, "owned_process_count": 4, "reclaimable_bytes": 8169062400, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 55.636352334, "owned_rss_bytes": 445120512, "owned_process_count": 4, "reclaimable_bytes": 8114700288, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 55.87399275, "owned_rss_bytes": 265601024, "owned_process_count": 4, "reclaimable_bytes": 8279638016, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 56.10678225, "owned_rss_bytes": 331350016, "owned_process_count": 4, "reclaimable_bytes": 8241561600, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 56.350123459, "owned_rss_bytes": 349945856, "owned_process_count": 4, "reclaimable_bytes": 8208891904, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 56.5920775, "owned_rss_bytes": 352239616, "owned_process_count": 4, "reclaimable_bytes": 8192098304, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 56.827830375000005, "owned_rss_bytes": 224559104, "owned_process_count": 4, "reclaimable_bytes": 8293974016, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 57.069687209, "owned_rss_bytes": 213008384, "owned_process_count": 4, "reclaimable_bytes": 8271265792, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 57.313719709000004, "owned_rss_bytes": 234799104, "owned_process_count": 4, "reclaimable_bytes": 8244920320, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 57.552584959, "owned_rss_bytes": 110952448, "owned_process_count": 3, "reclaimable_bytes": 8283111424, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 57.794189917000004, "owned_rss_bytes": 251445248, "owned_process_count": 4, "reclaimable_bytes": 8218755072, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 58.036586, "owned_rss_bytes": 316882944, "owned_process_count": 4, "reclaimable_bytes": 8182120448, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 58.276646, "owned_rss_bytes": 334888960, "owned_process_count": 4, "reclaimable_bytes": 8164671488, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 58.511207, "owned_rss_bytes": 347734016, "owned_process_count": 4, "reclaimable_bytes": 8141864960, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 58.753020292, "owned_rss_bytes": 353484800, "owned_process_count": 4, "reclaimable_bytes": 8127315968, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 58.994457209000004, "owned_rss_bytes": 359153664, "owned_process_count": 4, "reclaimable_bytes": 8119959552, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 59.236368750000004, "owned_rss_bytes": 363347968, "owned_process_count": 4, "reclaimable_bytes": 8112488448, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 59.477800209, "owned_rss_bytes": 367673344, "owned_process_count": 4, "reclaimable_bytes": 8109703168, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 59.713429500000004, "owned_rss_bytes": 372703232, "owned_process_count": 4, "reclaimable_bytes": 8089485312, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 59.953052542, "owned_rss_bytes": 376848384, "owned_process_count": 4, "reclaimable_bytes": 8069054464, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 60.194590375000004, "owned_rss_bytes": 381698048, "owned_process_count": 4, "reclaimable_bytes": 8056979456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 60.436499500000004, "owned_rss_bytes": 386613248, "owned_process_count": 4, "reclaimable_bytes": 8047214592, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 60.680147625000004, "owned_rss_bytes": 391184384, "owned_process_count": 4, "reclaimable_bytes": 8016576512, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 60.926147125, "owned_rss_bytes": 396263424, "owned_process_count": 4, "reclaimable_bytes": 8012185600, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 61.166994209, "owned_rss_bytes": 400490496, "owned_process_count": 4, "reclaimable_bytes": 7990820864, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 61.407746375, "owned_rss_bytes": 405487616, "owned_process_count": 4, "reclaimable_bytes": 7987527680, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 61.648975709000005, "owned_rss_bytes": 410435584, "owned_process_count": 4, "reclaimable_bytes": 7975469056, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 61.890345542000006, "owned_rss_bytes": 414351360, "owned_process_count": 4, "reclaimable_bytes": 7967342592, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 62.131838542000004, "owned_rss_bytes": 419528704, "owned_process_count": 4, "reclaimable_bytes": 7955660800, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 62.369693709, "owned_rss_bytes": 422641664, "owned_process_count": 4, "reclaimable_bytes": 7946960896, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 62.6030645, "owned_rss_bytes": 424919040, "owned_process_count": 4, "reclaimable_bytes": 7942176768, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 62.838743417, "owned_rss_bytes": 427524096, "owned_process_count": 4, "reclaimable_bytes": 7933968384, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 63.073864834000005, "owned_rss_bytes": 428376064, "owned_process_count": 4, "reclaimable_bytes": 7918911488, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 63.310281542, "owned_rss_bytes": 429817856, "owned_process_count": 4, "reclaimable_bytes": 7913570304, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 63.543224542000004, "owned_rss_bytes": 429817856, "owned_process_count": 4, "reclaimable_bytes": 7906672640, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 63.780713042, "owned_rss_bytes": 430030848, "owned_process_count": 4, "reclaimable_bytes": 7900872704, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 64.021841875, "owned_rss_bytes": 430030848, "owned_process_count": 4, "reclaimable_bytes": 7888437248, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 64.263841875, "owned_rss_bytes": 431783936, "owned_process_count": 4, "reclaimable_bytes": 7868268544, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 64.502160292, "owned_rss_bytes": 432619520, "owned_process_count": 4, "reclaimable_bytes": 7852621824, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 64.736391334, "owned_rss_bytes": 433979392, "owned_process_count": 4, "reclaimable_bytes": 7844823040, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 64.978469125, "owned_rss_bytes": 434487296, "owned_process_count": 4, "reclaimable_bytes": 7826341888, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 65.219733084, "owned_rss_bytes": 459210752, "owned_process_count": 4, "reclaimable_bytes": 7791607808, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 65.454822375, "owned_rss_bytes": 480149504, "owned_process_count": 4, "reclaimable_bytes": 7753580544, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 65.698129084, "owned_rss_bytes": 499105792, "owned_process_count": 4, "reclaimable_bytes": 7719567360, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 65.936366709, "owned_rss_bytes": 522010624, "owned_process_count": 4, "reclaimable_bytes": 7682736128, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 66.17804925, "owned_rss_bytes": 635469824, "owned_process_count": 4, "reclaimable_bytes": 7558594560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 66.415539459, "owned_rss_bytes": 639238144, "owned_process_count": 4, "reclaimable_bytes": 7541899264, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 66.657149542, "owned_rss_bytes": 639287296, "owned_process_count": 4, "reclaimable_bytes": 7520878592, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 66.899655584, "owned_rss_bytes": 639287296, "owned_process_count": 4, "reclaimable_bytes": 7501774848, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 67.139758334, "owned_rss_bytes": 639467520, "owned_process_count": 4, "reclaimable_bytes": 7488241664, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 67.381728667, "owned_rss_bytes": 639483904, "owned_process_count": 4, "reclaimable_bytes": 7467712512, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 67.621645667, "owned_rss_bytes": 639483904, "owned_process_count": 4, "reclaimable_bytes": 7454375936, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 67.85711783400001, "owned_rss_bytes": 639483904, "owned_process_count": 4, "reclaimable_bytes": 7437434880, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 68.10057725, "owned_rss_bytes": 639500288, "owned_process_count": 4, "reclaimable_bytes": 7416741888, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 68.333661084, "owned_rss_bytes": 639516672, "owned_process_count": 4, "reclaimable_bytes": 7390969856, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 68.56995975, "owned_rss_bytes": 641236992, "owned_process_count": 4, "reclaimable_bytes": 7375093760, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 68.805684167, "owned_rss_bytes": 644022272, "owned_process_count": 4, "reclaimable_bytes": 7356465152, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 69.040829875, "owned_rss_bytes": 644513792, "owned_process_count": 4, "reclaimable_bytes": 7310409728, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 69.280708459, "owned_rss_bytes": 648085504, "owned_process_count": 4, "reclaimable_bytes": 7317356544, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 69.525906334, "owned_rss_bytes": 652689408, "owned_process_count": 4, "reclaimable_bytes": 7297335296, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 69.767770917, "owned_rss_bytes": 665894912, "owned_process_count": 4, "reclaimable_bytes": 7272349696, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 70.01074458400001, "owned_rss_bytes": 673562624, "owned_process_count": 4, "reclaimable_bytes": 7234142208, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 70.250558625, "owned_rss_bytes": 681967616, "owned_process_count": 4, "reclaimable_bytes": 7198113792, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 70.486362875, "owned_rss_bytes": 691650560, "owned_process_count": 4, "reclaimable_bytes": 7169523712, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 70.71970683400001, "owned_rss_bytes": 695238656, "owned_process_count": 4, "reclaimable_bytes": 7143194624, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 70.958979459, "owned_rss_bytes": 702283776, "owned_process_count": 4, "reclaimable_bytes": 7124484096, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 71.19703737500001, "owned_rss_bytes": 706150400, "owned_process_count": 4, "reclaimable_bytes": 7091978240, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 71.436369875, "owned_rss_bytes": 721125376, "owned_process_count": 4, "reclaimable_bytes": 7065174016, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 71.678457334, "owned_rss_bytes": 728891392, "owned_process_count": 4, "reclaimable_bytes": 7018086400, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 71.920786042, "owned_rss_bytes": 735264768, "owned_process_count": 4, "reclaimable_bytes": 6987923456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 72.1631395, "owned_rss_bytes": 746864640, "owned_process_count": 4, "reclaimable_bytes": 6966116352, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 72.406605459, "owned_rss_bytes": 754565120, "owned_process_count": 4, "reclaimable_bytes": 6938673152, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 72.64313079200001, "owned_rss_bytes": 761757696, "owned_process_count": 4, "reclaimable_bytes": 6907330560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 72.882642459, "owned_rss_bytes": 771670016, "owned_process_count": 4, "reclaimable_bytes": 6874398720, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 73.115683584, "owned_rss_bytes": 779173888, "owned_process_count": 4, "reclaimable_bytes": 6835945472, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 73.353121917, "owned_rss_bytes": 787070976, "owned_process_count": 4, "reclaimable_bytes": 6801883136, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 73.594928542, "owned_rss_bytes": 792707072, "owned_process_count": 4, "reclaimable_bytes": 6769115136, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 73.83453475, "owned_rss_bytes": 795656192, "owned_process_count": 4, "reclaimable_bytes": 6742294528, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 74.079216917, "owned_rss_bytes": 797294592, "owned_process_count": 4, "reclaimable_bytes": 6715211776, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 74.319739209, "owned_rss_bytes": 804831232, "owned_process_count": 4, "reclaimable_bytes": 6687113216, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 74.561591625, "owned_rss_bytes": 814481408, "owned_process_count": 4, "reclaimable_bytes": 6650740736, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 74.803432417, "owned_rss_bytes": 822935552, "owned_process_count": 4, "reclaimable_bytes": 6621085696, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 75.046843792, "owned_rss_bytes": 829767680, "owned_process_count": 4, "reclaimable_bytes": 6597083136, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 75.288181959, "owned_rss_bytes": 842514432, "owned_process_count": 4, "reclaimable_bytes": 6560645120, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 75.52414620900001, "owned_rss_bytes": 845496320, "owned_process_count": 4, "reclaimable_bytes": 6621331456, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 75.761204125, "owned_rss_bytes": 848658432, "owned_process_count": 4, "reclaimable_bytes": 6583500800, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 76.003558917, "owned_rss_bytes": 854933504, "owned_process_count": 4, "reclaimable_bytes": 6549766144, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 76.246812167, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 6518112256, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 76.479952959, "owned_rss_bytes": 872169472, "owned_process_count": 4, "reclaimable_bytes": 6489735168, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 76.71976404200001, "owned_rss_bytes": 872939520, "owned_process_count": 4, "reclaimable_bytes": 6463586304, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 76.959637875, "owned_rss_bytes": 873136128, "owned_process_count": 4, "reclaimable_bytes": 6243827712, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 77.196465, "owned_rss_bytes": 873201664, "owned_process_count": 4, "reclaimable_bytes": 6220103680, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 77.43640208400001, "owned_rss_bytes": 880558080, "owned_process_count": 4, "reclaimable_bytes": 6183960576, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 77.669784875, "owned_rss_bytes": 881672192, "owned_process_count": 4, "reclaimable_bytes": 6152257536, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 77.903084917, "owned_rss_bytes": 882163712, "owned_process_count": 4, "reclaimable_bytes": 6127042560, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 78.139975459, "owned_rss_bytes": 882294784, "owned_process_count": 4, "reclaimable_bytes": 6294700032, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 78.37835025, "owned_rss_bytes": 884899840, "owned_process_count": 4, "reclaimable_bytes": 6276251648, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 78.620365209, "owned_rss_bytes": 885850112, "owned_process_count": 4, "reclaimable_bytes": 6256803840, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 78.861707209, "owned_rss_bytes": 887209984, "owned_process_count": 4, "reclaimable_bytes": 6228426752, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 79.102048125, "owned_rss_bytes": 887930880, "owned_process_count": 4, "reclaimable_bytes": 6207684608, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 79.3364065, "owned_rss_bytes": 888291328, "owned_process_count": 4, "reclaimable_bytes": 6183288832, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 79.57971525, "owned_rss_bytes": 890454016, "owned_process_count": 4, "reclaimable_bytes": 6156419072, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 79.819448459, "owned_rss_bytes": 891109376, "owned_process_count": 4, "reclaimable_bytes": 6137511936, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 80.061619209, "owned_rss_bytes": 898121728, "owned_process_count": 4, "reclaimable_bytes": 6114672640, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 80.29708966700001, "owned_rss_bytes": 898891776, "owned_process_count": 4, "reclaimable_bytes": 6092062720, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 80.534994875, "owned_rss_bytes": 900071424, "owned_process_count": 4, "reclaimable_bytes": 6074695680, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 80.769774709, "owned_rss_bytes": 901480448, "owned_process_count": 4, "reclaimable_bytes": 6057918464, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 81.00326525, "owned_rss_bytes": 902381568, "owned_process_count": 4, "reclaimable_bytes": 6015401984, "swapins": 44112650, "swapouts": 77525566}
{"elapsed_seconds": 81.245626167, "owned_rss_bytes": 904314880, "owned_process_count": 4, "reclaimable_bytes": 5982928896, "swapins": 44112650, "swapouts": 77525566}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v271/manifest.json

SHA-256 `9c064e057bb12e4fbc2fc1149ef58c1eaf7698617948b2a0cf8c020fd007fae2`; 4613 bytes.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 9.5,
  "model_lock_held_during_build": true,
  "passed": false,
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=1"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "reservation_wait_limit_seconds": 0,
  "build_jobs": 1,
  "reservation_wait": {
    "seconds": 4.375000000056417e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12245106688,
    "swapins": 44112650,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   274689.\nPages active:                                 780793.\nPages inactive:                               801734.\nPages speculative:                             40712.\nPages throttled:                                   0.\nPages wired down:                             357891.\nPages purgeable:                                6128.\n\"Translation faults\":                    15419864123.\nPages copy-on-write:                       736013865.\nPages zero filled:                       21223320201.\nPages reactivated:                        3470832741.\nPages purged:                               72241943.\nFile-backed pages:                            466565.\nAnonymous pages:                             1156674.\nPages stored in compressor:                  1983278.\nPages occupied by compressor:                 829809.\nDecompressions:                           1172035790.\nCompressions:                             1487077413.\nPageins:                                  7621784112.\nPageouts:                                   11082573.\nSwapins:                                    44112650.\nSwapouts:                                   77525566.\nPages tagged:                                 184017.\nPages tagged resident:                        136023.\nPages tagged compressed:                       47994.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8682.\nPages tag-storage free:                          216.\nPages tag-storage non-tag pageable:            89398.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7214848.\nTagged compressions:                        11276977.\nTagged decompressions:                      10396985.\n"
  },
  "error": "RuntimeError: live reclaimable memory fell below the serial-build floor",
  "elapsed_seconds": 81.44178808299999,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 6675841024,
    "swapins": 44112650,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46802.\nPages active:                                 926569.\nPages inactive:                               922803.\nPages speculative:                              2458.\nPages throttled:                                   0.\nPages wired down:                             359097.\nPages purgeable:                                7850.\n\"Translation faults\":                    15423000785.\nPages copy-on-write:                       736330015.\nPages zero filled:                       21224929629.\nPages reactivated:                        3470833500.\nPages purged:                               72245849.\nFile-backed pages:                            352809.\nAnonymous pages:                             1499021.\nPages stored in compressor:                  1976490.\nPages occupied by compressor:                 827389.\nDecompressions:                           1172042174.\nCompressions:                             1487077413.\nPageins:                                  7621893473.\nPageouts:                                   11083087.\nSwapins:                                    44112650.\nSwapouts:                                   77525566.\nPages tagged:                                 184105.\nPages tagged resident:                        136285.\nPages tagged compressed:                       47820.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8681.\nPages tag-storage free:                          461.\nPages tag-storage non-tag pageable:            89154.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7182336.\nTagged compressions:                        11276977.\nTagged decompressions:                      10397159.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/after/Sources/Slotstream/ContextMemory.swift

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

## /tmp/slotstream-optimization-execution/current-source-build-v271/after/Sources/Slotstream/Optimizations.swift

SHA-256 `450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95`; 14171 bytes.

````text
import Foundation

/// Explicit controls for independently evaluated execution paths. The public
/// initializer is the reference; environment resolution selects the deployment
/// family and applies explicit overrides. Experimental paths remain disabled.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    /// Greedy-only optional shortening; sampled requests retain their original
    /// verification shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// Joint execution family used by deployment selection and its diagnostics.
    /// The public initializer remains the explicit reference. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Select the automatically deployed family with the measured kernel
    /// qualification boundary. Explicit controls can qualify another platform;
    /// kernel initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: deploymentCandidate())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/after/Sources/Slotstream/Plan.swift

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

## /tmp/slotstream-optimization-execution/current-source-build-v271/after/Sources/Slotstream/PlannerCostModel.swift

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

## /tmp/slotstream-optimization-execution/current-source-build-v271/after/Sources/Slotstream/Weights.swift

SHA-256 `4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f`; 11340 bytes.

````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "1"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/after/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift

SHA-256 `75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d`; 17254 bytes.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("automatic complete prompt checkpoint is enabled", try InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("complete prompt checkpoint can be explicitly disabled",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "0"]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift

SHA-256 `3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6`; 18311 bytes.

````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("automatic platform-qualified optimization defaults",
            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let candidate = InferenceOptimizations.integrationCandidate
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and automatic default",
            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/before.json

SHA-256 `84c5eec069a6ea0d2f8a63321dcdfc62407c79e6d511c94e07c0fa6982009b1d`; 20676 bytes.

````text
{
  "captured_at": "2026-09-07T07:38:30.974953+00:00",
  "source": [
    {
      "path": "Sources/Slotstream/PlannerCostModel.swift",
      "before_sha256": null,
      "after_sha256": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0"
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "before_sha256": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
      "after_sha256": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d"
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "after_sha256": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865"
    },
    {
      "path": "Sources/Slotstream/Optimizations.swift",
      "before_sha256": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
      "after_sha256": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95"
    },
    {
      "path": "Sources/Slotstream/Weights.swift",
      "before_sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "after_sha256": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
      "before_sha256": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
      "after_sha256": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
      "before_sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
      "after_sha256": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d"
    }
  ],
  "release": {
    "slotstream": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
    "slotstream-checks": "bb7741f353d2696ba95340b160c0983b445c559eef861c285089f825844969f9",
    "mlx.metallib": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "build-identity.json": "03cca03bade110303c79d9dd61572347cb3a0eedcd16e10f64a2343d782de627",
    "build-source.tar.gz": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d",
    "build-source-before.json": "db119907fac797783dfb2907a31fee51f47cc536963165153cb49efbdd958568"
  },
  "root_source": {
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
    "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
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
    "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
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
    "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
  "state": "Temporary seven-file current-source candidate build lease; restored before handback."
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/build-state-before.json

SHA-256 `2a1df2d35045c485e065d78e59b88658cb43ad3d60be0de7744d75da16b60381`; 70144 bytes.

````text
{
  ".build/arm64-apple-macosx/release/CSlotpack.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "module.modulemap": {
        "kind": "file",
        "sha256": "025be8cbd763ce7f64ae20e48e10d9f3a4f612f56c7e36fc1131a56e978e465b",
        "mode": 420,
        "mtime_ns": 1788660105977933837
      },
      "slotpack.c.d": {
        "kind": "file",
        "sha256": "8789304d1e604b63b1e9c91b124cd478d6d457b8a9383bfd5b255e66ad1a2404",
        "mode": 420,
        "mtime_ns": 1788665377829139704
      },
      "slotpack.c.o": {
        "kind": "file",
        "sha256": "7d2fdfc9f5277b2c83b6cbaf019f029515187585448a8550af78cd7bbef158a8",
        "mode": 420,
        "mtime_ns": 1788665377828913951
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamCore.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Checkpoint.swift.o": {
        "kind": "file",
        "sha256": "e27cfbdc55efaa7b7be2656a56b2e89ff8b5eb5dc6c3d61000a7ccd209d917a7",
        "mode": 420,
        "mtime_ns": 1788370072797895492
      },
      "Context.swift.o": {
        "kind": "file",
        "sha256": "383637a0eee6018951ee4911071b2cee6d1a8e2cd67a2a192e272c006f112fdd",
        "mode": 420,
        "mtime_ns": 1788307715914972985
      },
      "Engine.swift.o": {
        "kind": "file",
        "sha256": "556e9a997489d564a9b6ada5e60737e59d71292b18761ce86b46dd342c3ab166",
        "mode": 420,
        "mtime_ns": 1788370072673440026
      },
      "ExpertStore.swift.o": {
        "kind": "file",
        "sha256": "cccb4863f0cc77526e8008e611d972c3120f76e96fffaf77ce0ea407cacbcea3",
        "mode": 420,
        "mtime_ns": 1788307716217988852
      },
      "GatedDelta.swift.o": {
        "kind": "file",
        "sha256": "7324a4c75adf0731858d2b223dcf1aec33b5daddb172db21398b0a7a77286720",
        "mode": 420,
        "mtime_ns": 1788286234116871389
      },
      "Generate.swift.o": {
        "kind": "file",
        "sha256": "06c98a3fd764f4daee7d1682acbc97a8c391af26dccf040d32938b2c38a380e2",
        "mode": 420,
        "mtime_ns": 1788370072596625992
      },
      "Governor.swift.o": {
        "kind": "file",
        "sha256": "d8f320eaf0583091e8f21df2b8ced04ddca88eb36387d6dc7004e435ec6cf994",
        "mode": 420,
        "mtime_ns": 1788313020535174870
      },
      "Layers.swift.o": {
        "kind": "file",
        "sha256": "41dede68172368830cd5242c61edac7c59d6419803d954fb7de79b62abe469ef",
        "mode": 420,
        "mtime_ns": 1788370072610562407
      },
      "MTP.swift.o": {
        "kind": "file",
        "sha256": "ae30536f7f434a6043257738f2d7f3fc48e5f769f509258fa9ae5625029c5c2d",
        "mode": 420,
        "mtime_ns": 1788370072499294592
      },
      "Model.swift.o": {
        "kind": "file",
        "sha256": "d974f8ce9efcf41305377880349ef7a59630ffff93193ea37e89d6a6f6b08327",
        "mode": 420,
        "mtime_ns": 1788370072618960723
      },
      "NgramStore.swift.o": {
        "kind": "file",
        "sha256": "f1aa15f9ce9cc43acf9868d4afd23556a0bd2cf816619abed08aea126d077668",
        "mode": 420,
        "mtime_ns": 1788317880634695763
      },
      "Plan.swift.o": {
        "kind": "file",
        "sha256": "46447e9e9a9a42143b3484cab740bd6a687eae318e2a3d027bab248ead01a62f",
        "mode": 420,
        "mtime_ns": 1788307716042855993
      },
      "PrefixCache.swift.o": {
        "kind": "file",
        "sha256": "cdefa520e7466e4f77379ab35d75c8dfa79c08658df3ee63ea67d7146220c447",
        "mode": 420,
        "mtime_ns": 1788287736311050523
      },
      "ProcessMemory.swift.o": {
        "kind": "file",
        "sha256": "e0423e569be2b24e8f9b9c41ca7d4f9537f1ae1e2ac8922273e9a774186e826e",
        "mode": 420,
        "mtime_ns": 1788286234088469509
      },
      "Server.swift.o": {
        "kind": "file",
        "sha256": "f84541f55f055b292dccf187f66dfbc06bf45cca9f37975a9a28b0e073d985b6",
        "mode": 420,
        "mtime_ns": 1788370072931691208
      },
      "SlotstreamCore.d": {
        "kind": "file",
        "sha256": "eeec411fdf330879f43f0594f71559db1ddbf63a80080257d25e684527b89043",
        "mode": 420,
        "mtime_ns": 1788372635196353139
      },
      "SlotstreamCore.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788372635196862896
      },
      "Version.swift.o": {
        "kind": "file",
        "sha256": "a365fb6c02f3b3546c13f69807d7b84b6a71d3fc7e2cc4a0a7484bc00173a5b5",
        "mode": 420,
        "mtime_ns": 1788370072437790330
      },
      "Weights.swift.o": {
        "kind": "file",
        "sha256": "747bc65ad84e95253c8e10e7d3cd6376a4b030d2c8b91c7b71b91eb98be6708f",
        "mode": 420,
        "mtime_ns": 1788307433170735849
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "SlotstreamCore-Swift.h": {
            "kind": "file",
            "sha256": "41e6099a04966324ec73f2705b07f79046f8424b26dd000a8851ffebec1a0df8",
            "mode": 420,
            "mtime_ns": 1788286234510727892
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "3014bcbe016d0afc47687eeab90ba27b8fc544f4e2de179aec76409fbd34c94a",
            "mode": 420,
            "mtime_ns": 1787923541537827172
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "2880872f310fd0b2321a29e400bb7bb9cde0a8d8c5644fc342cb3d94fe127ee7",
        "mode": 420,
        "mtime_ns": 1788372623128995225
      },
      "sources": {
        "kind": "file",
        "sha256": "588d3ecdce022f91e7cd70b782929bb9dca9183d349ebf8c93cf265d9275fba9",
        "mode": 420,
        "mtime_ns": 1788307705906691296
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamDiagnostics.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "CheckReport.swift.o": {
        "kind": "file",
        "sha256": "69d358481dd4511fcd106da316efc542b274ea5fee63203ebe1a0eea497d4c2b",
        "mode": 420,
        "mtime_ns": 1788726838866745722
      },
      "Diagnostics+AdaptiveSpeculation.swift.o": {
        "kind": "file",
        "sha256": "80c152d8d65d0f21eb45f862e5827fc297b5ee52eea9640fee1486cb3f85e554",
        "mode": 420,
        "mtime_ns": 1788740009735764024
      },
      "Diagnostics+AllHitReplay.swift.o": {
        "kind": "file",
        "sha256": "f0fbc60c3b7ef098f480fd734c102c10e53e97602fdb106648b3788a7a00b008",
        "mode": 420,
        "mtime_ns": 1788735243370593768
      },
      "Diagnostics+BlockSelection.swift.o": {
        "kind": "file",
        "sha256": "2bd5d1d87c2bdd4cc811049de2a03da3f007a8f2ef0d73f00d67675ace10bbe7",
        "mode": 420,
        "mtime_ns": 1788735243368870675
      },
      "Diagnostics+CacheBookkeeping.swift.o": {
        "kind": "file",
        "sha256": "4f3505ae0e85175791f069ebc36f1c58e17b732fc342fa87669a9457479bbff6",
        "mode": 420,
        "mtime_ns": 1788735243302773137
      },
      "Diagnostics+CompactIndexer.swift.o": {
        "kind": "file",
        "sha256": "a7071600526d67a94cd0057ef1b87d2f08f5ebc0924c816b10e4d80569607d14",
        "mode": 420,
        "mtime_ns": 1788735243284423992
      },
      "Diagnostics+CompiledNorm.swift.o": {
        "kind": "file",
        "sha256": "f777307f2569b1d360ee63ab90360da2968785d8d44def09948850613857652e",
        "mode": 420,
        "mtime_ns": 1788740009378838598
      },
      "Diagnostics+CompletePrompt.swift.o": {
        "kind": "file",
        "sha256": "c0d1251a6b763b1dab352bfb9d36b3e34c1ac7094236c5059f3dbecacb87b87d",
        "mode": 420,
        "mtime_ns": 1788735243498360237
      },
      "Diagnostics+ComputeIslands.swift.o": {
        "kind": "file",
        "sha256": "caafb07ea083075d188f1b985daf1e581ecc0092a22c1f957a3f20c609e61b9d",
        "mode": 420,
        "mtime_ns": 1788735243394371610
      },
      "Diagnostics+Context.swift.o": {
        "kind": "file",
        "sha256": "478ddde11b5c333dca57ec7d387a088dbd1641652153c5d850b0974cc2a598cf",
        "mode": 420,
        "mtime_ns": 1788735243476766949
      },
      "Diagnostics+ContextServing.swift.o": {
        "kind": "file",
        "sha256": "e1ca118d0f3907bb98d36636c2f849765bcaac1c193a12df72138565ea20a17f",
        "mode": 420,
        "mtime_ns": 1788740009602390984
      },
      "Diagnostics+ContextSmallPass.swift.o": {
        "kind": "file",
        "sha256": "36423311904f7b3f951603cefd68beb3c07112b485733c767357ebcae6de71f4",
        "mode": 420,
        "mtime_ns": 1788735243427940674
      },
      "Diagnostics+Device.swift.o": {
        "kind": "file",
        "sha256": "55b323f1da2206066f4a523ed16bee4de2246a4554ad7c2495cd518b257ca5c0",
        "mode": 420,
        "mtime_ns": 1788373869273296898
      },
      "Diagnostics+EmbeddingRows.swift.o": {
        "kind": "file",
        "sha256": "d621f5f19786dc193b169163b91b9d88cad1ce5000d39ac75780a8cfc76a3b13",
        "mode": 420,
        "mtime_ns": 1788735243343741284
      },
      "Diagnostics+EmbeddingRuntime.swift.o": {
        "kind": "file",
        "sha256": "a40a8f225b1fb534e75349571c79af9bae7941d3eb88c70a2d9f61824e20756c",
        "mode": 420,
        "mtime_ns": 1788735243461256612
      },
      "Diagnostics+ExactRead.swift.o": {
        "kind": "file",
        "sha256": "5788dd077c52384fc37d716c2c3aa59324f41ea3dbc98a78aa0aafae7cf7512c",
        "mode": 420,
        "mtime_ns": 1788735243288682183
      },
      "Diagnostics+GDNProfile.swift.o": {
        "kind": "file",
        "sha256": "3a2687fbd3baaa135f4593e626ae00a0dd99aec69b59d058c4871d737d9da6d0",
        "mode": 420,
        "mtime_ns": 1788735243391718554
      },
      "Diagnostics+GDNProjection.swift.o": {
        "kind": "file",
        "sha256": "835c386780855282158ac0c994506a40c2d4e390d58d890cf67f6a8936b666ac",
        "mode": 420,
        "mtime_ns": 1788735243305614236
      },
      "Diagnostics+Governor.swift.o": {
        "kind": "file",
        "sha256": "c2d10bc9713c48cde667895efaaa529c3c26f89fe02939ecd136255c27102308",
        "mode": 420,
        "mtime_ns": 1788726838713089445
      },
      "Diagnostics+HTTP.swift.o": {
        "kind": "file",
        "sha256": "497aec854dd8746eea0f7532a02f4f649e44536948260ae5ad36ee2bca4ce636",
        "mode": 420,
        "mtime_ns": 1788735243291463532
      },
      "Diagnostics+ImageFailure.swift.o": {
        "kind": "file",
        "sha256": "6b3dcc78bfc36dfab31c955f5a0ea027f815c7bb58ea135def9661a5c8664323",
        "mode": 420,
        "mtime_ns": 1788726838747127928
      },
      "Diagnostics+ImageReuse.swift.o": {
        "kind": "file",
        "sha256": "35ff7086c945fb2bba2651f51a3344a7ccac2918636009902c3c216dec99ee7d",
        "mode": 420,
        "mtime_ns": 1788735243325124637
      },
      "Diagnostics+Integrated.swift.o": {
        "kind": "file",
        "sha256": "d019bce41cc9ab0ce52fda4a61603c734608eff5877f904152a0f0cadb59afa8",
        "mode": 420,
        "mtime_ns": 1788735243438518442
      },
      "Diagnostics+LayerLocalVictim.swift.o": {
        "kind": "file",
        "sha256": "1c3846ff6517ff0c4e37e80d76ae1bf71e7645dea2b2f0c393aa0a4542e296e3",
        "mode": 420,
        "mtime_ns": 1788735243352712126
      },
      "Diagnostics+MTPIndexer.swift.o": {
        "kind": "file",
        "sha256": "4af377f7c48673f820b0d5308e156e5c9b9c8e7852cdecf5a9671d2583e88438",
        "mode": 420,
        "mtime_ns": 1788735243391684220
      },
      "Diagnostics+Machine.swift.o": {
        "kind": "file",
        "sha256": "955f6d0b18322c9af002b42b10d11091dd7abaf4c5db261f26660b1c01de98a1",
        "mode": 420,
        "mtime_ns": 1788726838767157574
      },
      "Diagnostics+NgramCache.swift.o": {
        "kind": "file",
        "sha256": "9e507274d3f731cfd68d8823c54632cc70afe0f48121e32243596cfa422807fb",
        "mode": 420,
        "mtime_ns": 1788726838886534576
      },
      "Diagnostics+NgramLookahead.swift.o": {
        "kind": "file",
        "sha256": "42de91cf5d59883579b7347a7f49c16efc3a0606df21f06d3fdb12c01ebbee1a",
        "mode": 420,
        "mtime_ns": 1788735243414119471
      },
      "Diagnostics+Optimization.swift.o": {
        "kind": "file",
        "sha256": "6cd1d0ddd3be2b611887849e1ed4e733707a9612ab1b8473761f33c21dd81e5d",
        "mode": 420,
        "mtime_ns": 1788735243771922151
      },
      "Diagnostics+Output.swift.o": {
        "kind": "file",
        "sha256": "1377c76f0bca80f75a8b830cab93440bfa7cb466db4a78c8749ce6a4ac138ca5",
        "mode": 420,
        "mtime_ns": 1788735243372168860
      },
      "Diagnostics+OutputServing.swift.o": {
        "kind": "file",
        "sha256": "56a27e239716e521d01be2c2dc470d5f67afae25e52a711d015e66e3a41c9a74",
        "mode": 420,
        "mtime_ns": 1788735243563428436
      },
      "Diagnostics+PackedLayout.swift.o": {
        "kind": "file",
        "sha256": "1600cfad72f0ca594fb0dfe088324c3e64f6a10cf5dd119c2b18133329fbf949",
        "mode": 420,
        "mtime_ns": 1788735243599282471
      },
      "Diagnostics+PartialRotation.swift.o": {
        "kind": "file",
        "sha256": "0d0850112b41a853d45db706fc3f16307954f1adf287b287a2f5e02259b840ae",
        "mode": 420,
        "mtime_ns": 1788735243408459856
      },
      "Diagnostics+PoolRequests.swift.o": {
        "kind": "file",
        "sha256": "6b71132ded1a4187744e5ac5fdd9073492b8394c34333b6ddcf5a482e103cec7",
        "mode": 420,
        "mtime_ns": 1788735243436059303
      },
      "Diagnostics+PrefillQualification.swift.o": {
        "kind": "file",
        "sha256": "e20dcb0c4523b0e9e792b4aa01eccebc1e66dc24558dc552e0bd11cf8c9743ba",
        "mode": 420,
        "mtime_ns": 1788735243558794410
      },
      "Diagnostics+PrefixCapacity.swift.o": {
        "kind": "file",
        "sha256": "3ef91d2a84e9f14222a1c7548846900d17814bb6a6b28a4858ab35ab1e3d484d",
        "mode": 420,
        "mtime_ns": 1788735243440411203
      },
      "Diagnostics+PrefixFork.swift.o": {
        "kind": "file",
        "sha256": "a20caf4d4e1394648de870ffada1872523af52220dbd89b0595018fec46174ae",
        "mode": 420,
        "mtime_ns": 1788735243474161601
      },
      "Diagnostics+PrefixRetention.swift.o": {
        "kind": "file",
        "sha256": "9109e87de3aacb7f2eed07643f574232b2e811aa7585f3d56ce447d9aade4fff",
        "mode": 420,
        "mtime_ns": 1788735243605605007
      },
      "Diagnostics+PrefixVision.swift.o": {
        "kind": "file",
        "sha256": "96a10eddf4d10096c0da2fe581b1f89c9c0cb469d46a9870dfe99a1dbcf98784",
        "mode": 420,
        "mtime_ns": 1788735243604580084
      },
      "Diagnostics+PressureBoundary.swift.o": {
        "kind": "file",
        "sha256": "3f2d5c76b6dc371966b6eb37d0dd574290a0be4af8784e8db6a11299890e3a84",
        "mode": 420,
        "mtime_ns": 1788726839025486473
      },
      "Diagnostics+Pull.swift.o": {
        "kind": "file",
        "sha256": "79cc2af63237959c539bd6871bee76c399a069ae4bb6738e7068745625648abe",
        "mode": 420,
        "mtime_ns": 1788726838904398008
      },
      "Diagnostics+ReadFailureServing.swift.o": {
        "kind": "file",
        "sha256": "83fe1e0310439b8a9fad7a6808441dc34f52b80f00d6e47b9a7d1dae46c9156d",
        "mode": 420,
        "mtime_ns": 1788735243636304680
      },
      "Diagnostics+ReadHandles.swift.o": {
        "kind": "file",
        "sha256": "43c81f26179a1063adb71620adc6511df1a06aaee282940514e6f8287c09eb1d",
        "mode": 420,
        "mtime_ns": 1788735243437658479
      },
      "Diagnostics+ReadRecovery.swift.o": {
        "kind": "file",
        "sha256": "2ccb6e379c873beeb5fb6cf94efb73f7ddae140f40298ad6299bbd8f5d795ed3",
        "mode": 420,
        "mtime_ns": 1788735243605582798
      },
      "Diagnostics+ResidentOverlap.swift.o": {
        "kind": "file",
        "sha256": "669e367e9aadf715c4cc965855ef8498362bbe116710cd07c6d1a429b902d23a",
        "mode": 420,
        "mtime_ns": 1788735243533091682
      },
      "Diagnostics+RopePerformance.swift.o": {
        "kind": "file",
        "sha256": "41665a623ac48d057b25c9b3dc6fd282a0981bc51241b03bfb2b5bd8d5a6e0fb",
        "mode": 420,
        "mtime_ns": 1788735243492096410
      },
      "Diagnostics+RouterProjection.swift.o": {
        "kind": "file",
        "sha256": "47743a9fce68985614ad077a7d5c8c5c9bf06f0494b4d26c79c49ed807a8fa3b",
        "mode": 420,
        "mtime_ns": 1788735243461742198
      },
      "Diagnostics+Runtime.swift.o": {
        "kind": "file",
        "sha256": "c35e2a7b871736916e8934649194f48f042baf1aa066be213b82cc0733f321ac",
        "mode": 420,
        "mtime_ns": 1788735243581634372
      },
      "Diagnostics+RuntimeBudget.swift.o": {
        "kind": "file",
        "sha256": "7f1dd592636a0d6ad0ece691a7f3a25ad64ff61640d892fbafbf98923bfe755e",
        "mode": 420,
        "mtime_ns": 1788735243552808043
      },
      "Diagnostics+SamplerPerformance.swift.o": {
        "kind": "file",
        "sha256": "b7577b2cc52a89818209eb4f9096b55d3c8bc46c35ce1e7b915e69d9251d91e0",
        "mode": 420,
        "mtime_ns": 1788735243518662726
      },
      "Diagnostics+SelectedAttention.swift.o": {
        "kind": "file",
        "sha256": "9414389b871150de24322de1314fa743c348c264679ec95e00d5ff920e9bbc59",
        "mode": 420,
        "mtime_ns": 1788735243637615645
      },
      "Diagnostics+Selection.swift.o": {
        "kind": "file",
        "sha256": "e97221274411ddf63c75fa1906a16d98b10e5fe2749752a7a920f2bc04c96713",
        "mode": 420,
        "mtime_ns": 1788735243680335594
      },
      "Diagnostics+SlotSlices.swift.o": {
        "kind": "file",
        "sha256": "227522e3d92779cf56bfe10af4dd46692a5290b501395a79b854272599a460cc",
        "mode": 420,
        "mtime_ns": 1788735243683546195
      },
      "Diagnostics+StateRecovery.swift.o": {
        "kind": "file",
        "sha256": "9281c1e191bb9f4739d5178c3075340057bdf27f0c781a5eebd0d0dd64df6a38",
        "mode": 420,
        "mtime_ns": 1788735243623060813
      },
      "Diagnostics+TerminalPrefill.swift.o": {
        "kind": "file",
        "sha256": "e099f1a6c1b69c9bc0fb07b8b2d628702b3ca93ed04537781087a344179681a8",
        "mode": 420,
        "mtime_ns": 1788726839047233667
      },
      "Diagnostics+Vision.swift.o": {
        "kind": "file",
        "sha256": "36f349dcdc451820319d29eb488daac5971ed9bf0c37534973265e515478db71",
        "mode": 420,
        "mtime_ns": 1788735243724393591
      },
      "Diagnostics+VisionAttention.swift.o": {
        "kind": "file",
        "sha256": "f25fd90b0d9f1fa8285ca0c87881d393efd4460eae7f242d0613245cdee564ef",
        "mode": 420,
        "mtime_ns": 1788735243590569714
      },
      "Diagnostics+VisionCapacity.swift.o": {
        "kind": "file",
        "sha256": "ebfa4c0c62e39ca753f8e15407e70461e921c7f8d38906e477b27d6ae158dd98",
        "mode": 420,
        "mtime_ns": 1788735243664419338
      },
      "Diagnostics.swift.o": {
        "kind": "file",
        "sha256": "ec79e37f0cbd0e88a7df64d0860361eaf5639d39ef0b47e786e840da284532b9",
        "mode": 420,
        "mtime_ns": 1788735243602348447
      },
      "Goldens.swift.o": {
        "kind": "file",
        "sha256": "b107f57449a9cb450d3f24be6b461cc9c4c7f3f0a980e15a1326dce2de021884",
        "mode": 420,
        "mtime_ns": 1788735243637010475
      },
      "SlotstreamDiagnostics.d": {
        "kind": "file",
        "sha256": "0453f309d3695cb79c851de92a63dfc745719c90d7988e495261596c35d2872f",
        "mode": 420,
        "mtime_ns": 1788740009784582383
      },
      "SlotstreamDiagnostics.dia": {
        "kind": "file",
        "sha256": "54c93d8b1f21c8c33282c0c5b70ac3dea2dc27adcabb9a7cf5f06f5e0a5aed75",
        "mode": 420,
        "mtime_ns": 1788740009785108269
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "SlotstreamDiagnostics-Swift.h": {
            "kind": "file",
            "sha256": "324b76f19658d04f581b59fa9f91e7513af6eca7761610d336621b0f86839d13",
            "mode": 420,
            "mtime_ns": 1788726839252385564
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "cdf5a9828edc46848bd6fbe12a6b34e16f3b6cfd3e96bf3731f57df5fb6d296e",
            "mode": 420,
            "mtime_ns": 1788373501895064888
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "b4f4d1372b28800bac70480b001c0dde3da22fc02f36cf6759cc7ce090eb744f",
        "mode": 420,
        "mtime_ns": 1788725658109782721
      },
      "sources": {
        "kind": "file",
        "sha256": "54efeb230af6139dbaaf7eaf65d7d8903d4319d57c2b75072341e97232e6719f",
        "mode": 420,
        "mtime_ns": 1788725658644355968
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamTestKit.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Catalogue.swift.o": {
        "kind": "file",
        "sha256": "a60f46ee448949a344c3acd419cdc6c97db17f096e9b9d964e88d4ba434356d1",
        "mode": 420,
        "mtime_ns": 1788644233695577771
      },
      "GatewayChecks.swift.o": {
        "kind": "file",
        "sha256": "49196d869d0080b1c58d3fcae6a12828853789ee5ed557f8581601daf3e09f7f",
        "mode": 420,
        "mtime_ns": 1788644234306425733
      },
      "OpenAIChecks.swift.o": {
        "kind": "file",
        "sha256": "59d3101afc61570eb911a2794f9ccd4a72e63b3c2091edf7f39c54f33444a5eb",
        "mode": 420,
        "mtime_ns": 1788720406899564692
      },
      "SlotstreamTestKit.d": {
        "kind": "file",
        "sha256": "7b907cacae8d0c67a4c588dafc3e853be020ea3c0a85de288b53c2f793ccf38f",
        "mode": 420,
        "mtime_ns": 1788734480991275354
      },
      "SlotstreamTestKit.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788734480991467522
      },
      "T0Checks.swift.o": {
        "kind": "file",
        "sha256": "8839d6ff67fc806371109412435d4617c730ceff28ba66503e60aed5c9343897",
        "mode": 420,
        "mtime_ns": 1788720406782103692
      },
      "ToolCallChecks.swift.o": {
        "kind": "file",
        "sha256": "1a233422bfd9c733559939e218df73ed6793f2f93f5058df5fc30be908fd4e9b",
        "mode": 420,
        "mtime_ns": 1788644233782225314
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "SlotstreamTestKit-Swift.h": {
            "kind": "file",
            "sha256": "a7b43939e8f8cadf3eacfa8b27862be2f7e50a667cc1b915839cf9c1b49c5302",
            "mode": 420,
            "mtime_ns": 1788373595205707849
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "2f47a526663ed32c6784e16486d093b3cf0698a2b9284ad83a9e9da61a8102d2",
            "mode": 420,
            "mtime_ns": 1788373501894658050
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "36735d586608e3171890952b3c4d9765705a5c3cb813e128b3406cc4a0a60150",
        "mode": 420,
        "mtime_ns": 1788725658106549718
      },
      "sources": {
        "kind": "file",
        "sha256": "8754fecbdeb3d7fd84de7005e275b079570d5b8ca75b56e9c9a55931556f7b41",
        "mode": 420,
        "mtime_ns": 1788644090161522034
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamTests.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "output-file-map.json": {
        "kind": "file",
        "sha256": "e3c75809dde96e892ca3d0b90732c6c28a4e51d468727c63e16745e359c8bf39",
        "mode": 420,
        "mtime_ns": 1787923628493173314
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream-checks.dSYM": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Contents": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "Info.plist": {
            "kind": "file",
            "sha256": "4bb6f09f5fa4e317cafde7cb4a486fbb1f93f80812919cae5ec70b2291ef0758",
            "mode": 420,
            "mtime_ns": 1788740524713089026
          },
          "Resources": {
            "kind": "directory",
            "mode": 493,
            "entries": {
              "DWARF": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "slotstream-checks": {
                    "kind": "file",
                    "sha256": "da0f41111c74d796648a33e450477a6592e8110c47b7981eee6874b1aea901a7",
                    "mode": 420,
                    "mtime_ns": 1788740527971905627
                  }
                }
              },
              "Relocations": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "aarch64": {
                    "kind": "directory",
                    "mode": 493,
                    "entries": {
                      "slotstream-checks.yml": {
                        "kind": "file",
                        "sha256": "a2b5ff8a1750bc903486772be6842d213bd619b1d824c2cb2b6428d7c228be14",
                        "mode": 420,
                        "mtime_ns": 1788740527910091069
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream-checks.product": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Objects.LinkFileList": {
        "kind": "file",
        "sha256": "4ecf1a827fd786e3e8434f3a5c032dd3ebb984a5c2574575819f15c819533633",
        "mode": 420,
        "mtime_ns": 1788726842691680926
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "AdaptiveSpeculation.swift.o": {
        "kind": "file",
        "sha256": "f11dd2260de134fca6f5b1cc8eeae447516087f8645362621932566d093f73e7",
        "mode": 420,
        "mtime_ns": 1788734426726647219
      },
      "BlockSelection.swift.o": {
        "kind": "file",
        "sha256": "7a555f70ad3f23c3816c0184c01f5e475292b70f4d915f318c216c49b56bf667",
        "mode": 420,
        "mtime_ns": 1788686548231029964
      },
      "BoundedOutput.swift.o": {
        "kind": "file",
        "sha256": "17734115f85fe4109af99f5f89a72f0c8fc0df33dd6baa68a7069e390d5a3ed6",
        "mode": 420,
        "mtime_ns": 1788725685034534771
      },
      "CPUSlotWrite.swift.o": {
        "kind": "file",
        "sha256": "ed1923d3fce63f3c906673a7e1d919a3b47f092590b80763e6f6e10a7b1ac183",
        "mode": 420,
        "mtime_ns": 1788686548221885785
      },
      "CacheBookkeeping.swift.o": {
        "kind": "file",
        "sha256": "a2fd94a0cf7f3164a2598f85235a446ce0f838283464532575500d7649eb1f78",
        "mode": 420,
        "mtime_ns": 1788725685450856493
      },
      "Checkpoint.swift.o": {
        "kind": "file",
        "sha256": "7e8b248b0a3c9311d99b27f57de82ebe761874dceb1dde19e104e975ef51886c",
        "mode": 420,
        "mtime_ns": 1788720351800710007
      },
      "CompiledArithmetic.swift.o": {
        "kind": "file",
        "sha256": "19a1188ab68253781bfb437e31f15056b3d03faa53cfb3a5ba85b1d60a6e8467",
        "mode": 420,
        "mtime_ns": 1788686548223087276
      },
      "Context.swift.o": {
        "kind": "file",
        "sha256": "fcc9838c65b0976ff7332e331fda51fccb0e7cc903087c455222399fe7d09f5d",
        "mode": 420,
        "mtime_ns": 1788730809724147319
      },
      "ContextCommands.swift.o": {
        "kind": "file",
        "sha256": "55518b545f4c526683a0df28e0fa9fd523d0b4491a8ddb3c145b58833db20d5a",
        "mode": 420,
        "mtime_ns": 1788370078324854488
      },
      "ContextFeasibility.swift.o": {
        "kind": "file",
        "sha256": "80b1841f8e6e3f26960cea8cdfd6e5dc8b37ab42bb1ce7189431bb08741e0d3a",
        "mode": 420,
        "mtime_ns": 1788720351481038970
      },
      "ContextMemory.swift.o": {
        "kind": "file",
        "sha256": "637cf59d0ff399767623794cd9f2488363136590846a754b85ce92841569ff7a",
        "mode": 420,
        "mtime_ns": 1788730809731229184
      },
      "Device.swift.o": {
        "kind": "file",
        "sha256": "7dcbb5fdf4d15707515ad02dfa4e516bf9d0b74310656295ed0efa2174d2177e",
        "mode": 420,
        "mtime_ns": 1788373865935802545
      },
      "DownloadConcurrency.swift.o": {
        "kind": "file",
        "sha256": "c1ebb9379c86240598096b17ad47c6b7dd11e2241b2a47a6628b9cd3d6f9ba7f",
        "mode": 420,
        "mtime_ns": 1788686548213317936
      },
      "DownloadHTTP.swift.o": {
        "kind": "file",
        "sha256": "0cf18c3c608638f7d4d30b4553e9440363f3ddb5b48ad67180601f734ce0a405",
        "mode": 420,
        "mtime_ns": 1788734426567032776
      },
      "EmbeddingRows.swift.o": {
        "kind": "file",
        "sha256": "3bdec2faf1016ec1c4f86fa36b901415a2591325a225e1e54f7a0206801aaa22",
        "mode": 420,
        "mtime_ns": 1788720351660407371
      },
      "Engine.swift.o": {
        "kind": "file",
        "sha256": "cae12663d0524bcb26e4daa0365d96aad39958a384e750d9c0396afb7c60a549",
        "mode": 420,
        "mtime_ns": 1788734427175536235
      },
      "Errors.swift.o": {
        "kind": "file",
        "sha256": "69e0ea4b62ce74618bd6e8c4230dfab881dc726acbb5807f9ae53878fd007f90",
        "mode": 420,
        "mtime_ns": 1788686548231031339
      },
      "ExactRead.swift.o": {
        "kind": "file",
        "sha256": "82ac56602a7ff73414e9d8042aad539a31fbc72cd59c8067250e35e822d3ad8b",
        "mode": 420,
        "mtime_ns": 1788686548234222189
      },
      "ExpertStore.swift.o": {
        "kind": "file",
        "sha256": "ad0f00abd92ca25eee60202af1e6e4d67b79ba008fb763a55e2fbc93007641f5",
        "mode": 420,
        "mtime_ns": 1788725685486402241
      },
      "ExpertTransferProfile.swift.o": {
        "kind": "file",
        "sha256": "b8f4b9113bf89409f0dbb7868419d690687801397091f8a63f3ff6f766ac1736",
        "mode": 420,
        "mtime_ns": 1788686548224111268
      },
      "GDNPhaseProfile.swift.o": {
        "kind": "file",
        "sha256": "dbf7e978a798f153d5834a099231acb8eef30c1ee8403cf76916b207408056ea",
        "mode": 420,
        "mtime_ns": 1788686548215468169
      },
      "GatedDelta.swift.o": {
        "kind": "file",
        "sha256": "18d2f55211d1383e66e796ad8fd5bb828edccf76568180495e6c1d022432542b",
        "mode": 420,
        "mtime_ns": 1788686548594970999
      },
      "GatewayDialect.swift.o": {
        "kind": "file",
        "sha256": "561dfb9f16ec70337e6657db83ca1a57b5a785f6f3093195e9fb053ca0376394",
        "mode": 420,
        "mtime_ns": 1788720351628642445
      },
      "Generate.swift.o": {
        "kind": "file",
        "sha256": "863ff1c225723f6da12d5a3913be65e519e681a9355cfd8afe909a63bd6587a6",
        "mode": 420,
        "mtime_ns": 1788734427119714613
      },
      "Governor.swift.o": {
        "kind": "file",
        "sha256": "9be2bbefb0c83953624da9d9922d37b0c6dd42498ecf4f7798b502ca2315d8e5",
        "mode": 420,
        "mtime_ns": 1788734426595740298
      },
      "LayerLocalVictim.swift.o": {
        "kind": "file",
        "sha256": "19f578954c446d36fc49d85ec3148f5e7285bf101f97f1e53348f83eab81354f",
        "mode": 420,
        "mtime_ns": 1788686548228105195
      },
      "Layers.swift.o": {
        "kind": "file",
        "sha256": "09ca0cf95b434c574a9d2a28c6992d2a267462fb2f727c68cb304f817cbe76a1",
        "mode": 420,
        "mtime_ns": 1788740524138610119
      },
      "MTP.swift.o": {
        "kind": "file",
        "sha256": "2eeaedd1518487190bcdaed2f73e778e8b89058910414b334aa475d578c32312",
        "mode": 420,
        "mtime_ns": 1788725685034868267
      },
      "MTPCommands.swift.o": {
        "kind": "file",
        "sha256": "0b6504ae9ea60eb1c07672abb1221e94946153c35a5de21f0db1e2d61f4d2b15",
        "mode": 420,
        "mtime_ns": 1788317887353018262
      },
      "Machine.swift.o": {
        "kind": "file",
        "sha256": "8b588d42edabdbf2eefc916d8faf0272b61b7bdd81f6ae879487a6cc196ed0cd",
        "mode": 420,
        "mtime_ns": 1788720351489242554
      },
      "MemTrace.swift.o": {
        "kind": "file",
        "sha256": "32ef06cdf6ecddbc1231380b7dcad8e09b3ad1f6567aa5ddef098025c36e217c",
        "mode": 420,
        "mtime_ns": 1788686548303126651
      },
      "Model.swift.o": {
        "kind": "file",
        "sha256": "87290fcc65068a952184aae828d18810077c70612f99bade3159caeaca0095cc",
        "mode": 420,
        "mtime_ns": 1788730810176128573
      },
      "NgramPrefetch.swift.o": {
        "kind": "file",
        "sha256": "01605f98d501841eadf18a420bb869b2d2c5d7d9e189a0090116389973bdbd16",
        "mode": 420,
        "mtime_ns": 1788686548264836700
      },
      "NgramStore.swift.o": {
        "kind": "file",
        "sha256": "a756bf84f78cc7a272b382c75c2c94eea4a7c763757c69eff23886e92c28a2c8",
        "mode": 420,
        "mtime_ns": 1788725685164590364
      },
      "Observation.swift.o": {
        "kind": "file",
        "sha256": "84fb5b9c86553bb2454bb3801a7ad8291b9f18baa7f2f428170087e0cf6f11a2",
        "mode": 420,
        "mtime_ns": 1788725685030189863
      },
      "OpenAIDialect.swift.o": {
        "kind": "file",
        "sha256": "64f6f1c4a06e21ab12e55a3c2e52c0d83f63efdce6920b90dfceef513c1a701d",
        "mode": 420,
        "mtime_ns": 1788720351688655939
      },
      "OpenAIOutput.swift.o": {
        "kind": "file",
        "sha256": "ffcd5ed19f958f7d5d07f17fdd4ccbf25bb8941cf76fca6ce234a463c2565828",
        "mode": 420,
        "mtime_ns": 1788720351548218553
      },
      "OptimizationPlatform.swift.o": {
        "kind": "file",
        "sha256": "cba5326e15f658dd5946bbe4e41ee0cc4a80584ec3a58221e7c60e03ab12d42a",
        "mode": 420,
        "mtime_ns": 1788713368995479833
      },
      "Optimizations.swift.o": {
        "kind": "file",
        "sha256": "4a16b50eebe080c9edc22144a9f1b1e2e7ac410ba3d97f85a0d3c80baabdd714",
        "mode": 420,
        "mtime_ns": 1788728206036911252
      },
      "PackedExpertLayout.swift.o": {
        "kind": "file",
        "sha256": "b056203eac01c26dd85448e9cbfac4a5a37d1621fd0b9a7a74cd0ab6a7ecb27e",
        "mode": 420,
        "mtime_ns": 1788686548553679655
      },
      "PackedProjectionPair.swift.o": {
        "kind": "file",
        "sha256": "488bf16c573416819d6ae4b428e87c3d40a77df5668f972931ad0831f30c2b77",
        "mode": 420,
        "mtime_ns": 1788700303262795123
      },
      "PartialRotation.swift.o": {
        "kind": "file",
        "sha256": "a96aae7bf4de593c2c6ba2be5436e83ee08890e3b237035a3a91923688f55296",
        "mode": 420,
        "mtime_ns": 1788693838329023273
      },
      "PinnedModel.swift.o": {
        "kind": "file",
        "sha256": "ced3e9a9afb2074110bdaf2674dc652a10ae254315deaa20331d2d072013236b",
        "mode": 420,
        "mtime_ns": 1788686548383016278
      },
      "PinnedTransport.swift.o": {
        "kind": "file",
        "sha256": "21bdef2b283c3e8cbbfb681e91c460b1b73e31a8790934b890023047a5ba7449",
        "mode": 420,
        "mtime_ns": 1788734426508929353
      },
      "PinnedTransportManifest.swift.o": {
        "kind": "file",
        "sha256": "0e531ec35cb11405802e2d46777e93f2d8d4e47ecf1a87965650cda02d4fae9a",
        "mode": 420,
        "mtime_ns": 1788686548361726069
      },
      "Plan.swift.o": {
        "kind": "file",
        "sha256": "50a1ecf6304f6ec5fbfa0b883ab3b23ac8be928469d95972af5998d22e08db04",
        "mode": 420,
        "mtime_ns": 1788730809881275280
      },
      "PrefixCache.swift.o": {
        "kind": "file",
        "sha256": "b6d68a29344be2d13a59e26040d2a178faa5c4a47384cf3c93fc9f252194b31e",
        "mode": 420,
        "mtime_ns": 1788725685330948322
      },
      "PressureBoundary.swift.o": {
        "kind": "file",
        "sha256": "ede578a874995f3c0f7b013f17fc50e7ab8500b7556597658597c4602717cf23",
        "mode": 420,
        "mtime_ns": 1788720351521384145
      },
      "ProcessMemory.swift.o": {
        "kind": "file",
        "sha256": "5d6e6294846dacc469cc3a8548d1fa757a4a6c0e1f6eb0ce7e2bc680c16446c2",
        "mode": 420,
        "mtime_ns": 1788725685025081340
      },
      "Pull.swift.o": {
        "kind": "file",
        "sha256": "1cffb323d4b30c3308bb7f40686abd1d92f4fab5ae256f3725da2ca01e0bf323",
        "mode": 420,
        "mtime_ns": 1788370077470648153
      },
      "RequestControl.swift.o": {
        "kind": "file",
        "sha256": "25a4405e9fd047262182a399b80138675804b886a5cdcfd331c5f690bfd27657",
        "mode": 420,
        "mtime_ns": 1788720351716257843
      },
      "ResidentExpertOverlap.swift.o": {
        "kind": "file",
        "sha256": "78f2eb9ec63b02c737acf4291ace3a164acb8bab1ecdc0ad2e558f9ff2c871d1",
        "mode": 420,
        "mtime_ns": 1788725684975351592
      },
      "RouterProjection.swift.o": {
        "kind": "file",
        "sha256": "395a38db6912d66123c321954ca3b7c0465669fb232b36bd83a925c36e0364c2",
        "mode": 420,
        "mtime_ns": 1788725684986321880
      },
      "RouterSelection.swift.o": {
        "kind": "file",
        "sha256": "d0d878478ce13a74e182b3be73ed3b86e440f88dfe46d4acfcbb88f14e600008",
        "mode": 420,
        "mtime_ns": 1788686548433101596
      },
      "RouterTrace.swift.o": {
        "kind": "file",
        "sha256": "7bd2d336117c981cee61cec050a582f1d1cc451b4161d23d67302917922a1700",
        "mode": 420,
        "mtime_ns": 1788686548455734586
      },
      "SelectedAttention.swift.o": {
        "kind": "file",
        "sha256": "e70e986218c9667109e2374deeea8252c64ec0f7794bafe00d987855c02dd042",
        "mode": 420,
        "mtime_ns": 1788686548488713995
      },
      "Server.swift.o": {
        "kind": "file",
        "sha256": "56f2684c191466a3ece9ee96b5ff8057246ed9bdae46242ed5fa74c684127961",
        "mode": 420,
        "mtime_ns": 1788740524271471410
      },
      "SlotWritePlan.swift.o": {
        "kind": "file",
        "sha256": "41cc58e44e23794b53849b74902366a7ae7ccedb9de834d6b52d25981f330ea6",
        "mode": 420,
        "mtime_ns": 1788686548479179278
      },
      "SlotpackDownload.swift.o": {
        "kind": "file",
        "sha256": "e4071862f8a8276cb275704eb946a5d6eb2ce65c4161cbdd8823ba1950aa5746",
        "mode": 420,
        "mtime_ns": 1788734426734950303
      },
      "SlotpackManifest.swift.o": {
        "kind": "file",
        "sha256": "bf3ce97c162df9092188b194cb91a42a39f96b247611aad0d7344da37b726ae3",
        "mode": 420,
        "mtime_ns": 1788686548638700200
      },
      "Slotstream.d": {
        "kind": "file",
        "sha256": "d942162ab7ee7bf433b37696f5b39404610dcdffe7ed3ee8cb43d852e38ec378",
        "mode": 420,
        "mtime_ns": 1788740524330742961
      },
      "StatePrefixFork.swift.o": {
        "kind": "file",
        "sha256": "1db2a807937b26cb0cef0b24bd11cf15a36510a294571d8e89b2233d23a958e4",
        "mode": 420,
        "mtime_ns": 1788725685072930985
      },
      "StateRecovery.swift.o": {
        "kind": "file",
        "sha256": "3c27b1daee151718deb9e33908d2a0cfb99b710ee14153ed3026e6acbd7872f3",
        "mode": 420,
        "mtime_ns": 1788720351661656240
      },
      "ToolCallSplitter.swift.o": {
        "kind": "file",
        "sha256": "545ac423993771030807795b5e16ff5abef20ea42141213a9183454bb7fff695",
        "mode": 420,
        "mtime_ns": 1788720351984698677
      },
      "Version.swift.o": {
        "kind": "file",
        "sha256": "34ba70006570de4dceeb07a48c3fbae406d4bffcf3232db396e422e767252224",
        "mode": 420,
        "mtime_ns": 1788734426495380533
      },
      "Vision.swift.o": {
        "kind": "file",
        "sha256": "157157b7803e9218241d375fb8b6c3bff08c31fc03117f5fb9da03975501c492",
        "mode": 420,
        "mtime_ns": 1788720352070328877
      },
      "VisionAttention.swift.o": {
        "kind": "file",
        "sha256": "b13c16b22d6229527fa614e37d6121b348814c7623eee9aa56991d5af63417c3",
        "mode": 420,
        "mtime_ns": 1788720351714750559
      },
      "VisionPrompt.swift.o": {
        "kind": "file",
        "sha256": "932e2e4e8e257fea4a4d3ac56842e2a99ac96bcd97b92b1efea9b48753e0aab6",
        "mode": 420,
        "mtime_ns": 1788725685106100344
      },
      "WeightDownload.swift.o": {
        "kind": "file",
        "sha256": "dfeedd553ae5d51385b7b0a95a6a675a66a22cf4de06e50cda0bef2873bd11cc",
        "mode": 420,
        "mtime_ns": 1788720351949673184
      },
      "WeightStore.swift.o": {
        "kind": "file",
        "sha256": "56fc04d6a7145027ae353cc7d215081dd291a6f181db38c0be4dd1f44b338168",
        "mode": 420,
        "mtime_ns": 1788734426697957572
      },
      "Weights.swift.o": {
        "kind": "file",
        "sha256": "60b6cfd468e07655bb64f0dbd231e1d0a42debfd8c516ae6461e470c887a564d",
        "mode": 420,
        "mtime_ns": 1788725685319182752
      },
      "WordSlotWrite.swift.o": {
        "kind": "file",
        "sha256": "4792419e14d94e4efa012d754befd2137b75498f0ba603d04b4a91ff07ed3fc3",
        "mode": 420,
        "mtime_ns": 1788686548604766423
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "Slotstream-Swift.h": {
            "kind": "file",
            "sha256": "ba29eec1d516d24771bcf239ec40cc7bafa2dcbf4701ab313a0e5056067f64d8",
            "mode": 420,
            "mtime_ns": 1788686549261368590
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "f90534381190fa925a954e41b66ccb96420419dc4f24b98fe9a669207b7790ee",
            "mode": 420,
            "mtime_ns": 1788373501895843647
          }
        }
      },
      "main.swift.o": {
        "kind": "file",
        "sha256": "23bff8df548faf6bbdacb65880642fd8d80fe1d91df8affa6dfb162519a73464",
        "mode": 420,
        "mtime_ns": 1788370077966196727
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "f71debf245f64c4b2ad3ce3b29f9011d0533cdb361f1df4b488f6f7d4d472d2d",
        "mode": 420,
        "mtime_ns": 1788725658112134194
      },
      "slotstream.dia": {
        "kind": "file",
        "sha256": "2813971c253938e57c47004d71883225263765eaee19f51c8d1918655a5b1a18",
        "mode": 420,
        "mtime_ns": 1788740524331183803
      },
      "sources": {
        "kind": "file",
        "sha256": "d314fc2876cf2ddd5b2f7fa036d70085f26ee255f03e6ad1b70e3e61c2126927",
        "mode": 420,
        "mtime_ns": 1788720324334893541
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream.dSYM": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Contents": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "Info.plist": {
            "kind": "file",
            "sha256": "ec97d96b319dbc1aa6f66fe997754e19d73784975e3b01ad222543851955a099",
            "mode": 420,
            "mtime_ns": 1788740524713564077
          },
          "Resources": {
            "kind": "directory",
            "mode": 493,
            "entries": {
              "DWARF": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "slotstream": {
                    "kind": "file",
                    "sha256": "286edb18b1205850484e2234ac8f9fbd9655ed128028a633bffa116d8212409e",
                    "mode": 420,
                    "mtime_ns": 1788740527989191957
                  }
                }
              },
              "Relocations": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "aarch64": {
                    "kind": "directory",
                    "mode": 493,
                    "entries": {
                      "slotstream.yml": {
                        "kind": "file",
                        "sha256": "d0f54c57462926c6b6fea145c4638eadb2c160d6be8d3cfa356cfc925c7e6882",
                        "mode": 420,
                        "mtime_ns": 1788740527924927353
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream.product": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Objects.LinkFileList": {
        "kind": "file",
        "sha256": "4532f43b1fade6922864e6b6c96a9a082991a8cfcbcddcaeac039493fb3d212c",
        "mode": 420,
        "mtime_ns": 1788726845447326296
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstreamPackageTests.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "module.modulemap": {
            "kind": "file",
            "sha256": "bf967253bb0027da28a49a61d85f79808cef9095f5c4f5b255ab49f1cc563c35",
            "mode": 420,
            "mtime_ns": 1787923541546260595
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "e8ed384e7fc9e9123c39265c94bea45044b1b75afba6b04eddf6cf3e606bad95",
        "mode": 420,
        "mtime_ns": 1787923628859552948
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream_checks.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "main.swift.o": {
        "kind": "file",
        "sha256": "ebfb25a616c77def5aa6ff7ef7c35213a6af37d374c005382e5e5fc091eb7055",
        "mode": 420,
        "mtime_ns": 1788644236181023263
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "39e768e690734b63e90deea039a6eb43bbab23e7772a4e7bc66c73f13a309857",
        "mode": 420,
        "mtime_ns": 1788725658107030129
      },
      "slotstream_checks.d": {
        "kind": "file",
        "sha256": "fb46a7f170fd574ffeece443b93148296c14db03887751e2c73a960810338c9c",
        "mode": 420,
        "mtime_ns": 1788713420598738542
      },
      "slotstream_checks.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788713420600064130
      },
      "sources": {
        "kind": "file",
        "sha256": "9ad827771ec1f6e2f652915b9ae1af3fdce0a5ead2df4e14f31affc92b6e7b46",
        "mode": 420,
        "mtime_ns": 1788373503378395729
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream_cli.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "CheckRendering.swift.o": {
        "kind": "file",
        "sha256": "4bdb1de83e7d417c84cf27164ef4c5ff299f27e2494332509389728f5bdc2d04",
        "mode": 420,
        "mtime_ns": 1788740016298211345
      },
      "ContextCommands.swift.o": {
        "kind": "file",
        "sha256": "b8619079a8ed774679a69ebb78ff3ae1658635ced10b7bc6adfb71562a0754de",
        "mode": 420,
        "mtime_ns": 1788677283003731793
      },
      "MTPCommands.swift.o": {
        "kind": "file",
        "sha256": "642a37c4d34f929f92b780dda76969d183c3f952d8e43ace5324395032afc779",
        "mode": 420,
        "mtime_ns": 1788730868573550317
      },
      "OptimizationCommands.swift.o": {
        "kind": "file",
        "sha256": "78c7b7ff9fdaad25028ff2b0b2c5f4fb81804de0d10915c7a86b15908c9e4f33",
        "mode": 420,
        "mtime_ns": 1788730868959543272
      },
      "PackedExpertCommands.swift.o": {
        "kind": "file",
        "sha256": "f20b0cf618f7ea872d56190ad2b1492f1db983999ff64b2fc52d1a263a5668af",
        "mode": 420,
        "mtime_ns": 1788734483349116334
      },
      "Pull.swift.o": {
        "kind": "file",
        "sha256": "67f545af99652d8b5524fdbd77fce7c4ecf31db1759ce8521552e0d64d133182",
        "mode": 420,
        "mtime_ns": 1788730868365102665
      },
      "SweepCommands.swift.o": {
        "kind": "file",
        "sha256": "8e9f1892b36203820aae91c1da28d275df196ef708c902385f0950051f51fb76",
        "mode": 420,
        "mtime_ns": 1788676248256296734
      },
      "VisionCommands.swift.o": {
        "kind": "file",
        "sha256": "208477187fa79c81729941e235793dc969960e99652a8dbc3468c78111098577",
        "mode": 420,
        "mtime_ns": 1788730868382408702
      },
      "main.swift.o": {
        "kind": "file",
        "sha256": "21809b35ecddfab0680353ebe9269871bd4bc00b63d1515cd9b1e6f3b4ab6dc9",
        "mode": 420,
        "mtime_ns": 1788726844504588485
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "0054ad79807bfdb74b187ed2414671991e9756863ccd18440bb17229326a37a6",
        "mode": 420,
        "mtime_ns": 1788725658107735787
      },
      "slotstream_cli.d": {
        "kind": "file",
        "sha256": "b3f0a1a2e55348505a58c9e0943c332f37ec1ec24c1ea26b7b7ddc7bb828837a",
        "mode": 420,
        "mtime_ns": 1788740016310254359
      },
      "slotstream_cli.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788740016310663409
      },
      "sources": {
        "kind": "file",
        "sha256": "7196a0d2dbb32d0ff7b1034a6be1e0efece366f76cc4b063f41ae409c06de1be",
        "mode": 420,
        "mtime_ns": 1788635821856496807
      }
    }
  },
  ".build/arm64-apple-macosx/release/Modules": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "ArgumentParser.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713339008921925
      },
      "ArgumentParser.swiftdoc": {
        "kind": "file",
        "sha256": "144e88fcbe152cf9ee51975fe0187bb8da8a7074fdb1880a0f233d72ff1e10b4",
        "mode": 420,
        "mtime_ns": 1787923587397310425
      },
      "ArgumentParser.swiftmodule": {
        "kind": "file",
        "sha256": "02261148cd3b40bcbc43876964aaafcc99d3980d521db00ba07f40b85d0ccdef",
        "mode": 420,
        "mtime_ns": 1787923587392399880
      },
      "ArgumentParser.swiftsourceinfo": {
        "kind": "file",
        "sha256": "5ab310e0f7f8d566bfe48ea62bae101b4f9931c33ff0f7f7393ba3a2852ff18b",
        "mode": 420,
        "mtime_ns": 1787923587398706801
      },
      "ArgumentParserToolInfo.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713334697194013
      },
      "ArgumentParserToolInfo.swiftdoc": {
        "kind": "file",
        "sha256": "f1c44c0b14d76bdd1c5df9d3ad80dc7895510fd99153c176af5e856192145e3a",
        "mode": 420,
        "mtime_ns": 1787923583657589785
      },
      "ArgumentParserToolInfo.swiftmodule": {
        "kind": "file",
        "sha256": "827382ef4c741ed9db4fb888606d5ac67e0ad8619a05e714a8a9e1ed1345c13f",
        "mode": 420,
        "mtime_ns": 1787923583656904242
      },
      "ArgumentParserToolInfo.swiftsourceinfo": {
        "kind": "file",
        "sha256": "1d14301fc5b61f4f4d165bc5a7c42b12565a4599e828dcdc78328f4fbae7666c",
        "mode": 420,
        "mtime_ns": 1787923583658055201
      },
      "ComplexModule.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325632786861
      },
      "ComplexModule.swiftdoc": {
        "kind": "file",
        "sha256": "f480fce8aaafc7b219761b8429804afc4d4b6832127441d1222a918d9aa8b9d3",
        "mode": 420,
        "mtime_ns": 1787923569184723233
      },
      "ComplexModule.swiftmodule": {
        "kind": "file",
        "sha256": "f4f78bc6fa741850deaf7da3f213909ae6ba0ad63404a8271344497db0af2a61",
        "mode": 420,
        "mtime_ns": 1787923569183927816
      },
      "ComplexModule.swiftsourceinfo": {
        "kind": "file",
        "sha256": "98370d4b521007678486e1dae1803d6042bc09372a758c49470923a75594548c",
        "mode": 420,
        "mtime_ns": 1787923569185486067
      },
      "Crypto.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325340706990
      },
      "Crypto.swiftdoc": {
        "kind": "file",
        "sha256": "367d7878463e6a4178db567641645f0916fb49c8b45aed6ad85510846d7352fa",
        "mode": 420,
        "mtime_ns": 1787923570316503324
      },
      "Crypto.swiftmodule": {
        "kind": "file",
        "sha256": "212a54db64116816692a6257173fcadec41cfd4d450aa6962b548c512fe01d1f",
        "mode": 420,
        "mtime_ns": 1787923570316065657
      },
      "Crypto.swiftsourceinfo": {
        "kind": "file",
        "sha256": "f6589036f4889a0550e5caecc3f53be4ca35c533e797f269d19e3d7b62974879",
        "mode": 420,
        "mtime_ns": 1787923570317163782
      },
      "EventSource.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325280824510
      },
      "EventSource.swiftdoc": {
        "kind": "file",
        "sha256": "6070f1b7fbff1c0f3ce725e761dc28e0fc93d68527ba52eb2c8a080750fb7926",
        "mode": 420,
        "mtime_ns": 1787923570328728124
      },
      "EventSource.swiftmodule": {
        "kind": "file",
        "sha256": "1fa7c89ed0de92921425fc357694d862f3a4f47b774e4cee1b6a7f13e4039d9e",
        "mode": 420,
        "mtime_ns": 1787923570328036624
      },
      "EventSource.swiftsourceinfo": {
        "kind": "file",
        "sha256": "920782b62b255c36f280b700bfbf24fe1950bd8edc47b1a06691008a86c22f6f",
        "mode": 420,
        "mtime_ns": 1787923570329360791
      },
      "Generation.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713342442310382
      },
      "Generation.swiftdoc": {
        "kind": "file",
        "sha256": "66348d63a2438d33505ffa747ad78bd283393650b8cf05594c97602e3e5ab547",
        "mode": 420,
        "mtime_ns": 1787923604179493440
      },
      "Generation.swiftmodule": {
        "kind": "file",
        "sha256": "465ea8c11db594719fd02c5fa273d676fd9676a4216b75b01efac3a3f19e1ca8",
        "mode": 420,
        "mtime_ns": 1787923604178895190
      },
      "Generation.swiftsourceinfo": {
        "kind": "file",
        "sha256": "7e01f97138fe0e75bb0395b0dfde6d366be33175160066e2f07a1e464a945108",
        "mode": 420,
        "mtime_ns": 1787923604179802274
      },
      "Hub.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713336017676203
      },
      "Hub.swiftdoc": {
        "kind": "file",
        "sha256": "c45a1a293fc2d7cfcc7c16f50710412f3d114a9a563db3d37c4d55fc86d83995",
        "mode": 420,
        "mtime_ns": 1787923598103879151
      },
      "Hub.swiftmodule": {
        "kind": "file",
        "sha256": "0a21f39fbe04771a40cca4f0f399f714ceb0e2f41cba5316f68912e4ecfd7b76",
        "mode": 420,
        "mtime_ns": 1787923598102750400
      },
      "Hub.swiftsourceinfo": {
        "kind": "file",
        "sha256": "bc86213a8bd9c38e8735e12dba14dabc0d73939608ca5dea93f7d0e0202fc10d",
        "mode": 420,
        "mtime_ns": 1787923598104887985
      },
      "HuggingFace.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713328793554949
      },
      "HuggingFace.swiftdoc": {
        "kind": "file",
        "sha256": "71e76d3e453778d5fbd85e94006b0e0a386aa3a3e82ae052c4ebaa9757611bbc",
        "mode": 420,
        "mtime_ns": 1787923588751897715
      },
      "HuggingFace.swiftmodule": {
        "kind": "file",
        "sha256": "168f3a13d55eba8c5c3577f7a37d2641f979d78bca9f6784c41e5a2db8643619",
        "mode": 420,
        "mtime_ns": 1787923588745953960
      },
      "HuggingFace.swiftsourceinfo": {
        "kind": "file",
        "sha256": "f5aa9cb2ef4e926b2d0cb8c18a260ff899b71728a032243983b47994f92a3c7a",
        "mode": 420,
        "mtime_ns": 1787923588754516300
      },
      "InternalCollectionsUtilities.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325012904981
      },
      "InternalCollectionsUtilities.swiftdoc": {
        "kind": "file",
        "sha256": "ac6d0b8b0cd045463b33358c83dc873e175491a0745f885a71cdedf5e097c3a4",
        "mode": 420,
        "mtime_ns": 1787923568991775888
      },
      "InternalCollectionsUtilities.swiftmodule": {
        "kind": "file",
        "sha256": "08e3aadcd93f732522f6dcc13ad4a51b9bef201e425f7f1e3ec68d695edef27a",
        "mode": 420,
        "mtime_ns": 1787923568990866221
      },
      "InternalCollectionsUtilities.swiftsourceinfo": {
        "kind": "file",
        "sha256": "eb26cba2a7e8c2eec6dd6b50cc58aa536569ea3def87b05883c23fa72a67c5f2",
        "mode": 420,
        "mtime_ns": 1787923568992922098
      },
      "Jinja.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713329354428809
      },
      "Jinja.swiftdoc": {
        "kind": "file",
        "sha256": "6de6058f9c10d5ceef42524723c2eda4c23b4b6e26718c744bcdc2d8b0292d93",
        "mode": 420,
        "mtime_ns": 1787923577385218189
      },
      "Jinja.swiftmodule": {
        "kind": "file",
        "sha256": "b658dccdd233707df341622b308d7acccad8b706a462c4251c9b25267bfe9e3f",
        "mode": 420,
        "mtime_ns": 1787923577382817479
      },
      "Jinja.swiftsourceinfo": {
        "kind": "file",
        "sha256": "af497f479f53fe53883e7f76d963880bb508beb78b2dd5b1af972ffca585b2ab",
        "mode": 420,
        "mtime_ns": 1787923577386328232
      },
      "MLX.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713335615640660
      },
      "MLX.swiftdoc": {
        "kind": "file",
        "sha256": "de81c5cfb9266c73ccf6ab7cb9a6233f7c3b7fe81cb4ee117ceacb7545b79a36",
        "mode": 420,
        "mtime_ns": 1787923610958200101
      },
      "MLX.swiftmodule": {
        "kind": "file",
        "sha256": "07ffbc362911aa40f89a820dd526cdf3c1c27764f6fcfab035b71aeb08d31984",
        "mode": 420,
        "mtime_ns": 1787923610949157470
      },
      "MLX.swiftsourceinfo": {
        "kind": "file",
        "sha256": "dab97a1cd828d911bee85fc310cd3f025badc483d6c533e3a912a5bd71b66d2e",
        "mode": 420,
        "mtime_ns": 1787923610961136603
      },
      "MLXFast.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713342062726260
      },
      "MLXFast.swiftdoc": {
        "kind": "file",
        "sha256": "820743b3e78da1868c65736ee4fbb4ca3b18cf27db191e4060088f04f2f58054",
        "mode": 420,
        "mtime_ns": 1787923614180083126
      },
      "MLXFast.swiftmodule": {
        "kind": "file",
        "sha256": "70aca148a5080155b805da0af82b6b3df8682f01e45c46c2fef0fc7a1b7dc3e3",
        "mode": 420,
        "mtime_ns": 1787923614179772834
      },
      "MLXFast.swiftsourceinfo": {
        "kind": "file",
        "sha256": "1553f88d1297a79338d1f2859b1fd1bf09d2946a1bc0e37b09384538a573ba73",
        "mode": 420,
        "mtime_ns": 1787923614180242126
      },
      "MLXNN.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713343679962793
      },
      "MLXNN.swiftdoc": {
        "kind": "file",
        "sha256": "ed381c8cb0e710ae1f385885d1199dbbf0bb0e17ffa856cf43ca641a12ed74c0",
        "mode": 420,
        "mtime_ns": 1787923616070611252
      },
      "MLXNN.swiftmodule": {
        "kind": "file",
        "sha256": "50e28e685d2f4ab6e3835ba56b5e7683c30abdebcbf89e4fe97e0ce8817a29ae",
        "mode": 420,
        "mtime_ns": 1787923616068140125
      },
      "MLXNN.swiftsourceinfo": {
        "kind": "file",
        "sha256": "eab804361a14917b6474163987bb08079c01dca7a2fcd5015877c9b4c1ff3b4d",
        "mode": 420,
        "mtime_ns": 1787923616071724711
      },
      "Models.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713342996912717
      },
      "Models.swiftdoc": {
        "kind": "file",
        "sha256": "136658efa999d6afa8cfbfb921b52afb5c2d8ba45d4c8f6c3c336b227d8a96ad",
        "mode": 420,
        "mtime_ns": 1787923604773442734
      },
      "Models.swiftmodule": {
        "kind": "file",
        "sha256": "9e2adbd67d0bff3b2858aa55e8883a8762b3e37d287f4a74e0b0a3719dfb6fc5",
        "mode": 420,
        "mtime_ns": 1787923604772890484
      },
      "Models.swiftsourceinfo": {
        "kind": "file",
        "sha256": "16b804cc58591bebe064beabdba275d64f9003575a4857e67b84684ae7a75f47",
        "mode": 420,
        "mtime_ns": 1787923604773768276
      },
      "Numerics.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713326828195074
      },
      "Numerics.swiftdoc": {
        "kind": "file",
        "sha256": "1e39648dfc42ae139964892c970861c2b4e6b218e5141a19ed22a662a6f10eee",
        "mode": 420,
        "mtime_ns": 1787923569559305789
      },
      "Numerics.swiftmodule": {
        "kind": "file",
        "sha256": "b855c0df442fd2baf4f82dd412ca1a844f8536c3069ebf72d8d2628c38c5d2b1",
        "mode": 420,
        "mtime_ns": 1787923569559048372
      },
      "Numerics.swiftsourceinfo": {
        "kind": "file",
        "sha256": "c53e414f7e5e90273e17bcecb07e2af2c03c5a438326c38b5f925d2cdeb443cc",
        "mode": 420,
        "mtime_ns": 1787923569559462081
      },
      "OrderedCollections.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713326195290145
      },
      "OrderedCollections.swiftdoc": {
        "kind": "file",
        "sha256": "1e82ea5e833705731708e6e35a8ad730d02252ff02d5dd16360c1e3428e97eba",
        "mode": 420,
        "mtime_ns": 1787923570572118379
      },
      "OrderedCollections.swiftmodule": {
        "kind": "file",
        "sha256": "a3de45fe0b3215f0c9e48aa29b1727a59bb16192bcfdfa19f580c4f9c1fda325",
        "mode": 420,
        "mtime_ns": 1787923570562004455
      },
      "OrderedCollections.swiftsourceinfo": {
        "kind": "file",
        "sha256": "2e254f97e6c3a8e737666a0ecd5680750e50a95a8c3f125cca5932c40934a79c",
        "mode": 420,
        "mtime_ns": 1787923570576765424
      },
      "RealModule.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713324857261967
      },
      "RealModule.swiftdoc": {
        "kind": "file",
        "sha256": "ea7c9c9cf13a841663ba32e95fa34310acd027a39bdf6fd04233f9720b18ceba",
        "mode": 420,
        "mtime_ns": 1787923568702432434
      },
      "RealModule.swiftmodule": {
        "kind": "file",
        "sha256": "7674a92e29d5d93f24a30891fe17ea92eb2ef3eb20008c7aef67bcf563f1b8f7",
        "mode": 420,
        "mtime_ns": 1787923568701264475
      },
      "RealModule.swiftsourceinfo": {
        "kind": "file",
        "sha256": "fb2d36b0826727338b258611572be49ee2cbba82c8000afac04b3d65ee0a833b",
        "mode": 420,
        "mtime_ns": 1787923568703065684
      },
      "Slotstream.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788740510596594816
      },
      "Slotstream.swiftdoc": {
        "kind": "file",
        "sha256": "888d68947cb8937df092ba3a74c9eeeb63bbe73af2d016899089ee9b32723a5c",
        "mode": 420,
        "mtime_ns": 1788730796105691718
      },
      "Slotstream.swiftmodule": {
        "kind": "file",
        "sha256": "00b28ed7c600dc566e0c5568b7c0aa756a517165cc11bd1e3e305cf16c7efd77",
        "mode": 420,
        "mtime_ns": 1788734413550907955
      },
      "Slotstream.swiftsourceinfo": {
        "kind": "file",
        "sha256": "582eaf19892781b1d2bc76596f668759a7b16428d2f844d2662a6d595e3b94aa",
        "mode": 420,
        "mtime_ns": 1788740510596187058
      },
      "SlotstreamDiagnostics.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788739971709572948
      },
      "SlotstreamDiagnostics.swiftdoc": {
        "kind": "file",
        "sha256": "d3f882164d8777320efeae786a53f15e67bc30390b576b92cffed96d2916df47",
        "mode": 420,
        "mtime_ns": 1788726801717069892
      },
      "SlotstreamDiagnostics.swiftmodule": {
        "kind": "file",
        "sha256": "8f1fcce70467654c2202b13f8e8e5c1e1c2de5cc0527638ecca2bf8082cf9750",
        "mode": 420,
        "mtime_ns": 1788734439809122178
      },
      "SlotstreamDiagnostics.swiftsourceinfo": {
        "kind": "file",
        "sha256": "58b2907be5358f8df1252d77d1fb2a62be3b8e613f93a2d71ca518deb13220b1",
        "mode": 420,
        "mtime_ns": 1788739971709055937
      },
      "SlotstreamTestKit.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788734478461651375
      },
      "SlotstreamTestKit.swiftdoc": {
        "kind": "file",
        "sha256": "441e88a14982f7d5d0ebdd9bfeb1128e6630838638fcfb4fbeeb7cd57d796baf",
        "mode": 420,
        "mtime_ns": 1788373595030270438
      },
      "SlotstreamTestKit.swiftmodule": {
        "kind": "file",
        "sha256": "26de8b2361186fba3cab77a801067e3053983aa3282967420553993237e71ea0",
        "mode": 420,
        "mtime_ns": 1788646384422758356
      },
      "SlotstreamTestKit.swiftsourceinfo": {
        "kind": "file",
        "sha256": "0b5df08e736e89ad83ff91e48ae8f2eef692c06611cfbfb349cf5c2f302a8a6e",
        "mode": 420,
        "mtime_ns": 1788720404269123256
      },
      "Tokenizers.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713339781118886
      },
      "Tokenizers.swiftdoc": {
        "kind": "file",
        "sha256": "e05101aca491e0a17c9e5f75676fdc016be329ff0e729722f9fb2ff9e3960480",
        "mode": 420,
        "mtime_ns": 1787923600981824391
      },
      "Tokenizers.swiftmodule": {
        "kind": "file",
        "sha256": "1f0ef6a89afc139edb1252fa4c190d9b203ba40138ae4164de0b12150aa5a860",
        "mode": 420,
        "mtime_ns": 1787923600976215929
      },
      "Tokenizers.swiftsourceinfo": {
        "kind": "file",
        "sha256": "0aa225cf5513a6a3c4aa9191b424f2e6b6845c51513ca3013845abedee506fc4",
        "mode": 420,
        "mtime_ns": 1787923600982287391
      },
      "slotstream_checks.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713420380654207
      },
      "slotstream_checks.swiftdoc": {
        "kind": "file",
        "sha256": "1cd8fb2fbc74042bfbeed001920ca40bc5f3e7d795752992d07cd9ffed3c2950",
        "mode": 420,
        "mtime_ns": 1788373595835784445
      },
      "slotstream_checks.swiftmodule": {
        "kind": "file",
        "sha256": "127356100aebad0f634eb55a5b4ab2ffa98f0f413e080dd6036f585fd22049a5",
        "mode": 420,
        "mtime_ns": 1788660174472898701
      },
      "slotstream_checks.swiftsourceinfo": {
        "kind": "file",
        "sha256": "10662c8758172e0edc3df0bb94aef8b2167300ca79d55a10e6dc7f12a14e3180",
        "mode": 420,
        "mtime_ns": 1788373595836004072
      },
      "slotstream_cli.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788740012314223594
      },
      "slotstream_cli.swiftdoc": {
        "kind": "file",
        "sha256": "7cd5b40de4c62c457729a49682dcc6e935823da2ab519749da778a306e71c516",
        "mode": 420,
        "mtime_ns": 1788373954482997691
      },
      "slotstream_cli.swiftmodule": {
        "kind": "file",
        "sha256": "0cfcaf2038828da10fb3a3a13ab2c4ff1a47b066144b80cf49ecac663a14474e",
        "mode": 420,
        "mtime_ns": 1788740012312719645
      },
      "slotstream_cli.swiftsourceinfo": {
        "kind": "file",
        "sha256": "06bf6d6a64f8fec0d5150422a5bcd41686e469de00db21a2668d206bd42c5d0c",
        "mode": 420,
        "mtime_ns": 1788740012313768376
      }
    }
  },
  ".build/build.db": {
    "kind": "file",
    "sha256": "f99847c599855d12efb0b70eab29eb3fbd25654176a1bb4013e55e6563aaea06",
    "mode": 420,
    "mtime_ns": 1788740528003798403
  },
  ".build/build.db-wal": {
    "kind": "absent"
  },
  ".build/build.db-shm": {
    "kind": "absent"
  },
  ".build/release.yaml": {
    "kind": "file",
    "sha256": "978961ab92a5208302ffaa4d851972372d6605b35fdcc585790409ac71aae80e",
    "mode": 420,
    "mtime_ns": 1788725658534979131
  },
  ".build/workspace-state.json": {
    "kind": "file",
    "sha256": "acded02f82a40ef97a87bd142a9ad99e836d0d1300f30b7ab95d0b94c6dbe773",
    "mode": 420,
    "mtime_ns": 1787923537885021510
  },
  ".build/arm64-apple-macosx/release/description.json": {
    "kind": "file",
    "sha256": "e5fbae6828a63e6555094ada433600dc3fc8df3ab6c338a946e7cecd2542342e",
    "mode": 420,
    "mtime_ns": 1788725658548377181
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/lease-result.json

SHA-256 `5feeb218319d23091034da6e6c5d44d28417a34ff7c5acb2ddb5cf3465198448`; 7343 bytes.

````text
{
  "classification": "temporary cached build lease; no model or performance result",
  "started_at": "2026-09-07T07:38:31.313809+00:00",
  "protocol_sha256": "41b0d72019738057da971c415ac7e7a51dcc78af6e0144eb35b5c44ec5b0be4c",
  "passed": false,
  "restored": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12243632128,
    "swapins": 44112650,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   302062.\nPages active:                                 781650.\nPages inactive:                               776126.\nPages speculative:                             38077.\nPages throttled:                                   0.\nPages wired down:                             357823.\nPages purgeable:                                7494.\n\"Translation faults\":                    15419842477.\nPages copy-on-write:                       736010445.\nPages zero filled:                       21223313783.\nPages reactivated:                        3470832741.\nPages purged:                               72241367.\nFile-backed pages:                            437736.\nAnonymous pages:                             1158117.\nPages stored in compressor:                  1983445.\nPages occupied by compressor:                 829845.\nDecompressions:                           1172035623.\nCompressions:                             1487077413.\nPageins:                                  7621757911.\nPageouts:                                   11082573.\nSwapins:                                    44112650.\nSwapouts:                                   77525566.\nPages tagged:                                 184037.\nPages tagged resident:                        136043.\nPages tagged compressed:                       47994.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8682.\nPages tag-storage free:                          207.\nPages tag-storage non-tag pageable:            89407.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7214848.\nTagged compressions:                        11276977.\nTagged decompressions:                      10396985.\n"
  },
  "before_pressure": {
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
  "release_symlink_before": {
    "kind": "symlink",
    "target": "arm64-apple-macosx/release",
    "mode": 493
  },
  "source_applied": true,
  "build_passed": false,
  "error": "RuntimeError: serial compiler or build publication did not pass",
  "traceback": "Traceback (most recent call last):\n  File \"/tmp/slotstream-optimization-execution/current-source-build-v271/run.py\", line 101, in main\n    check_whole_interval(result,record[\"before\"],vm_snapshot(),time.monotonic()-started,live)\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 198, in check_whole_interval\n    raise RuntimeError('serial compiler or build publication did not pass')\nRuntimeError: serial compiler or build publication did not pass\n",
  "before_restoration": {
    "page_bytes": 16384,
    "reclaimable_bytes": 6677266432,
    "swapins": 44112650,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46879.\nPages active:                                 926592.\nPages inactive:                               922824.\nPages speculative:                              2461.\nPages throttled:                                   0.\nPages wired down:                             359097.\nPages purgeable:                                7850.\n\"Translation faults\":                    15423002109.\nPages copy-on-write:                       736330329.\nPages zero filled:                       21224929808.\nPages reactivated:                        3470833500.\nPages purged:                               72245849.\nFile-backed pages:                            352819.\nAnonymous pages:                             1499058.\nPages stored in compressor:                  1976490.\nPages occupied by compressor:                 827389.\nDecompressions:                           1172042174.\nCompressions:                             1487077413.\nPageins:                                  7621893479.\nPageouts:                                   11083087.\nSwapins:                                    44112650.\nSwapouts:                                   77525566.\nPages tagged:                                 184105.\nPages tagged resident:                        136285.\nPages tagged compressed:                       47820.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8681.\nPages tag-storage free:                          463.\nPages tag-storage non-tag pageable:            89152.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7182336.\nTagged compressions:                        11276977.\nTagged decompressions:                      10397159.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 6597214208,
    "swapins": 44112650,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4204.\nPages active:                                 932269.\nPages inactive:                               958336.\nPages speculative:                              5119.\nPages throttled:                                   0.\nPages wired down:                             358363.\nPages purgeable:                                7078.\n\"Translation faults\":                    15423029007.\nPages copy-on-write:                       736333750.\nPages zero filled:                       21224940868.\nPages reactivated:                        3470833500.\nPages purged:                               72245859.\nFile-backed pages:                            391380.\nAnonymous pages:                             1504344.\nPages stored in compressor:                  1976459.\nPages occupied by compressor:                 827379.\nDecompressions:                           1172042205.\nCompressions:                             1487077413.\nPageins:                                  7621933088.\nPageouts:                                   11083091.\nSwapins:                                    44112650.\nSwapouts:                                   77525566.\nPages tagged:                                 184102.\nPages tagged resident:                        136283.\nPages tagged compressed:                       47819.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8680.\nPages tag-storage free:                          280.\nPages tag-storage non-tag pageable:            89336.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7182272.\nTagged compressions:                        11276977.\nTagged decompressions:                      10397160.\n"
  },
  "elapsed_seconds": 82.914647334
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/protocol.json

SHA-256 `41b0d72019738057da971c415ac7e7a51dcc78af6e0144eb35b5c44ec5b0be4c`; 21239 bytes.

````text
{
  "classification": "Exact current runtime device-observer extraction plus unchanged V255 combined defaults and planner family. Temporary shared cached build lease; no deployment activation.",
  "frozen_at": "2026-09-07T05:41:23.922977+00:00",
  "drivers": {
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  "candidate_source": {
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
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0"
  },
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "wrapper_sha256": "b97316d856569ad30de9d5a3dc1328c10a4439ac3daa746054714f76736d2968",
  "maximum_whole_interval_seconds": 1220,
  "changes": "Exact V208 unchanged planner3 + exact V199 selected default4. No optional control additions, context cap change, recalibration, memory credit, or new kernels.",
  "review": "Model-free candidate preparation may run before unrelated optional studies; this does not settle their disposition or waive same-final-build API/native/resource/final8/soak/install acceptance. V253 was never launched; the later actual API gate must use the corrected V254 predicate.",
  "source_lease": "Restore all seven original source contents/presence/mode/mtime, six release artifacts, release symlink, first-party build outputs and SwiftPM mutable database/metadata. Keep real model lock throughout.",
  "defaults": "CLI/Engine environment selects the independently-qualified portable family plus current-hardware RoPE; explicit InferenceOptimizations() and complete all-off environment remain reference. Embedding rows separately on in candidate, off in restored source.",
  "consumer_prerequisite": {
    "path": "/tmp/slotstream-optimization-execution/current-source-consumer-v268/manifest.json",
    "sha256": "f0fbfe393a1e2ca27a67bbf52a19fcef8ad7e9e6bc0bdb0ba4975235030bba9b",
    "passed": true,
    "difference": "Current Makefile adds context-test target; all Swift/native/package inputs match."
  },
  "planner_proxy_prerequisite": {
    "path": "/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-manifest.json",
    "sha256": "3d80af4d4fe4a9ebbe550b450b8db7fe491563671ca9f3c238a2313f38cf1951",
    "passed": true
  },
  "root_before_sha256": "84c5eec069a6ea0d2f8a63321dcdfc62407c79e6d511c94e07c0fa6982009b1d"
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/run.py

SHA-256 `b97316d856569ad30de9d5a3dc1328c10a4439ac3daa746054714f76736d2968`; 9794 bytes.

````text
from pathlib import Path
import datetime,fcntl,json,os,shutil,signal,stat,subprocess,sys,time,traceback
ROOT=Path("/Users/carlos/Projects/slotstream")
PACKET=Path(__file__).parent
sys.path.insert(0,str(ROOT/"Tools"))
from build_identity import source_files
from optimization_build import build
from optimization_serial_build import POLICY,guarded_run,check_whole_interval
from prefill_bench import digest,vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot,require_normal

def tree_state(path):
    if path.is_symlink(): return {"kind":"symlink","target":os.readlink(path),"mode":stat.S_IMODE(path.lstat().st_mode)}
    if not path.exists(): return {"kind":"absent"}
    if path.is_file(): return {"kind":"file","sha256":digest(path),"mode":stat.S_IMODE(path.stat().st_mode),"mtime_ns":path.stat().st_mtime_ns}
    return {"kind":"directory","mode":stat.S_IMODE(path.stat().st_mode),"entries":{str(p.relative_to(path)):tree_state(p) for p in sorted(path.iterdir())}}

def clone(path,destination):
    destination.parent.mkdir(parents=True,exist_ok=True)
    subprocess.run(["/bin/cp","-cRp",str(path),str(destination)],check=True,capture_output=True,text=True)

def snapshot(paths,backup):
    result={}
    for path in paths:
        relative=path.relative_to(ROOT)
        result[str(relative)]=tree_state(path)
        if path.exists() or path.is_symlink(): clone(path,backup/relative)
    return result

def restore(paths,backup,expected):
    for path in paths:
        if path.is_symlink() or path.is_file(): path.unlink()
        elif path.is_dir(): shutil.rmtree(path)
        original=backup/path.relative_to(ROOT)
        if original.exists() or original.is_symlink(): clone(original,path)
    actual={str(path.relative_to(ROOT)):tree_state(path) for path in paths}
    if actual!=expected: raise RuntimeError("leased build state was not restored exactly")

def restore_link(path,expected):
    if tree_state(path)==expected: return
    if path.is_symlink() or path.is_file(): path.unlink()
    elif path.exists():
        # Preserve any unexpected SwiftPM alias directory for diagnosis.
        quarantine=path.with_name(path.name+".v271-unexpected")
        if quarantine.exists() or quarantine.is_symlink(): raise RuntimeError("release-alias quarantine already exists")
        path.rename(quarantine)
    path.symlink_to(expected['target'])
    if tree_state(path)!=expected: raise RuntimeError("release alias was not restored exactly")

def observed_memory():
    state=vm_snapshot();require_normal(pressure_snapshot());return state

def main():
    output=ROOT/".build/optimization/current-source-build-v271"
    receipt=PACKET/"lease-result.json"
    assert not output.exists() and not receipt.exists()
    protocol=json.loads((PACKET/"protocol.json").read_text())
    original=json.loads((PACKET/"before.json").read_text())
    files=original["source"]
    frozen={"source":original["root_source"]}
    for name,sha in protocol["drivers"].items(): assert digest(ROOT/"Tools"/name)==sha
    def interrupted(number,_frame): raise KeyboardInterrupt(f"lease interrupted by signal {number}")
    signal.signal(signal.SIGTERM,interrupted);signal.signal(signal.SIGINT,interrupted)
    record={"classification":"temporary cached build lease; no model or performance result", "started_at":datetime.datetime.now(datetime.timezone.utc).isoformat(),"protocol_sha256":digest(PACKET/"protocol.json"),"passed":False,"restored":False}
    started=time.monotonic();leased=False;result=None;state_paths=[];state_before=None;applied=[]
    release=ROOT/".build/arm64-apple-macosx/release"
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock","a") as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        record["before"]=vm_snapshot()
        record["before_pressure"]=pressure_snapshot();require_normal(record["before_pressure"])
        if record["before"]["reclaimable_bytes"]<POLICY["startup_reclaimable_bytes"]: raise RuntimeError("cached lease headroom unavailable; no mutation")
        assert not competing_jobs()
        assert (ROOT/".build/release").is_symlink()
        link_state=tree_state(ROOT/".build/release")
        link=link_state['target'];record["release_symlink_before"]=link_state
        assert {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}==frozen["source"]
        for entry in files:
            path=ROOT/entry["path"];assert (digest(path) if path.exists() else None)==entry["before_sha256"]
        assert all(digest(ROOT/".build/release"/n)==h for n,h in original["release"].items())
        source_before={entry['path']:tree_state(ROOT/entry['path']) for entry in files}
        release_before={name:tree_state(ROOT/'.build/release'/name) for name in original['release']}
        state_paths=sorted([p for p in release.iterdir() if p.is_dir() and ("slotstream" in p.name.lower() or "cslotpack" in p.name.lower())])
        state_paths += [release/"Modules",ROOT/".build/build.db",ROOT/".build/build.db-wal",ROOT/".build/build.db-shm",ROOT/".build/release.yaml",ROOT/".build/workspace-state.json",release/"description.json"]
        state_before=snapshot(state_paths,PACKET/"build-state-before")
        (PACKET/"build-state-before.json").write_text(json.dumps(state_before,indent=2)+"\n")
        try:
            leased=True
            for entry in files:
                path=ROOT/entry["path"];after=PACKET/"after"/entry["path"]
                assert digest(after)==entry["after_sha256"]
                pending=path.with_suffix(path.suffix+".v271-pending");shutil.copy2(after,pending);pending.replace(path)
                applied.append(entry)
            actual={str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}
            assert actual==protocol["candidate_source"]
            record["source_applied"]=True
            result=build(ROOT,output,required_gb=9.5,jobs=1,lock_path=PACKET/"inner-build.lock",
                run=lambda command,**kwargs:guarded_run(command,**kwargs,record_path=output/"live-memory.json",snapshot=observed_memory))
            record["build_passed"]=result["passed"]
            live=json.loads((output/"live-memory.json").read_text()) if (output/"live-memory.json").exists() else {}
            check_whole_interval(result,record["before"],vm_snapshot(),time.monotonic()-started,live)
            record["passed"]=True
        except BaseException as error:
            record["error"]=f"{type(error).__name__}: {error}"
            record["traceback"]=traceback.format_exc()
        finally:
            try: record["before_restoration"]=vm_snapshot()
            except BaseException as error: record['before_restoration_error']=f'{type(error).__name__}: {error}';record['passed']=False
            try:
                if leased:
                    for entry in applied:
                        path=ROOT/entry["path"];assert path.exists() and digest(path)==entry["after_sha256"],"source changed outside the lease"
                    for entry in applied:
                        path=ROOT/entry["path"]
                        if entry["before_sha256"] is None: path.unlink()
                        else:
                            pending=path.with_suffix(path.suffix+".v271-restore");shutil.copy2(PACKET/"source-before"/entry["path"],pending);pending.replace(path)
                    restore(state_paths,PACKET/"build-state-before",state_before)
                    restore_link(ROOT/".build/release",link_state)
                    for name,sha in original["release"].items():
                        path=ROOT/".build/release"/name;pending=path.with_name(path.name+".v271-restore")
                        shutil.copy2(PACKET/"release-before"/name,pending);pending.replace(path);assert digest(path)==sha
                assert {entry['path']:tree_state(ROOT/entry['path']) for entry in files}==source_before
                assert {name:tree_state(ROOT/'.build/release'/name) for name in original['release']}==release_before
                assert tree_state(ROOT/".build/release")==link_state
                assert {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}==frozen["source"]
                assert not (ROOT/"Sources/Slotstream/PlannerCostModel.swift").exists()
                record["restored"]=True
            except BaseException as error:
                record["restoration_error"]=f"{type(error).__name__}: {error}";record["passed"]=False
            try: record["after"]=vm_snapshot()
            except BaseException as error: record['after_error']=f'{type(error).__name__}: {error}';record['passed']=False
            record["elapsed_seconds"]=time.monotonic()-started
            if record["elapsed_seconds"]>1220: record["passed"]=False;record["interval_error"]="lease/build/restoration exceeded1220seconds"
            try:
                if competing_jobs(): record["passed"]=False;record["process_error"]="compiler/model jobs remain at handback"
            except BaseException as error:
                record["passed"]=False;record['process_error']=f'{type(error).__name__}: {error}'
            if 'after' not in record or record["after"]["swapouts"]!=record["before"]["swapouts"] or record["after"]["reclaimable_bytes"]<6e9:
                record["passed"]=False;record["resource_error"]="complete lease resource interval failed"
            if not record["passed"] and (output/"candidate").exists(): (output/"candidate").rename(output/"unqualified-candidate")
            receipt.write_text(json.dumps(record,indent=2)+"\n")
    print(json.dumps({k:v for k,v in record.items() if k not in ["before","after","before_restoration"]}),flush=True)
    return 0 if record["passed"] and record["restored"] else 1

if __name__=="__main__": raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/source-before/Sources/Slotstream/ContextMemory.swift

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

## /tmp/slotstream-optimization-execution/current-source-build-v271/source-before/Sources/Slotstream/Optimizations.swift

SHA-256 `3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55`; 14169 bytes.

````text
import Foundation

/// Independent controls retained while each candidate is qualified. Defaults
/// stay on the reference implementation until its acceptance gates pass.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    /// Greedy-only optional shortening; sampled requests retain their original
    /// verification shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// The next joint qualification candidate. Explicit selection only; this
    /// does not change public initializer or environment defaults. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Candidate for eventual automatic selection after combined acceptance.
    /// Public/environment defaults remain unchanged until that gate passes.
    /// Explicit experimental controls and diagnostics can still qualify a new
    /// platform; the kernel's initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: Self())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/source-before/Sources/Slotstream/Plan.swift

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

## /tmp/slotstream-optimization-execution/current-source-build-v271/source-before/Sources/Slotstream/Weights.swift

SHA-256 `27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b`; 11340 bytes.

````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "0"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/source-before/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift

SHA-256 `0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da`; 17050 bytes.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("complete prompt remains default off", try !InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v271/source-before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift

SHA-256 `06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29`; 18240 bytes.

````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let candidate = InferenceOptimizations.integrationCandidate
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and reference default",
            try environmentFunction([:]), InferenceOptimizations())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}
````

