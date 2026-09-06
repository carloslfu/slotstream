---
type: run
id: 01m1thc9xrsw7jz65t9292qzep
created: 2026-09-06T04:59:41.368002+00:00
updated: 2026-09-06T05:02:42.592605+00:00
summary: Complete fresh-to-resumed public Mac installation verifies all original files; final API, HTTP, memory, coverage, external consumer and loaded-model gates pass.
binary: d544d53b765d483de3c6ef0e36ca06b74174a1894c8b2b4e1462825f8a2a4c7a
captured_at: 2026-09-06
command: 'full_pull.py --default-source; cli_checks.py; static_gates.sh; sampler_gates.sh; coverage.sh; consumer_smoke.sh; slotstream run --model ../full-cdn-model --memory-gb 10 --mtp off --vision off --prompt "Reply with exactly: READY" --max-tokens 16 --greedy'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete public Mac model download and final lossless transport acceptance
tool: Final native CLI, exact Swift/C fixtures, Python SHA-256, LLVM coverage and external SwiftPM consumer
---
# Complete public Mac reconstruction and final candidate acceptance

The Mac started from an empty directory, downloaded through the compiled default, was deliberately interrupted to run the bounded route comparison, and then resumed. No files or partial chunks were seeded from the existing local model. The final independent Python SHA-256 pass covers all twenty-five original files. This is a complete fresh-to-resumed installation, not one uninterrupted fresh timing sample.

The resumed segment reports zero raw fallback chunks. The initial interrupted segment did not print a final fallback counter, so do not infer a counter for it. The separate uninterrupted fresh Linux receipt proves that every package object is publicly retrievable and reconstructs the complete model with zero raw fallbacks. These are correctness results; shared-machine and changing-route durations are diagnostic.

After this complete public pull, the only production edits restore the public synchronous callback/function-reference API: WeightStore forwards logs through a sink detached before return, DownloadHTTP.swift declares that forwarding holder, and the implicit CLI download call names automatic transport explicitly. Codec, object pins, reconstruction, resume, concurrency policy, and HTTP transfer implementation are identical. Both final native binaries revalidate/reuse their complete downloaded models without transfer. Actual CLI source-selection/cancellation cases pass again on the final Mac binary, and it loads and uses the downloaded model.

## Fresh attempt with deliberate SIGINT

```json
{
  "pass_": false,
  "fresh": true,
  "binarySHA256": "b0137932976aedb191c6d2d3f3631c7ce267b1201055fc5a3cb6ca21d7f27519",
  "sourceSHA256": {
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/Model.swift": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e",
    "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/Slotstream/Layers.swift": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe",
    "Sources/Slotstream/Engine.swift": "ebfad431313597ef2586d9ba57e015fc640d252fb38e6b5888dcadbc96772f6e",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/Version.swift": "b4da48a512dd1e77d401738384bfe40fb0e0f294ca750f353c65341fb08f2508",
    "Sources/Slotstream/MTP.swift": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/DownloadHTTP.swift": "b13c0aa411658cac2327dce94ece7909cd80a0d847b2e862d3b34bd1f68c1844",
    "Sources/Slotstream/Server.swift": "676457a0ecdd1243bea26562723e20c9eb78b2060427916919ceabea6f560fa2",
    "Sources/Slotstream/Context.swift": "208f5b98f054241870b534c56558fb48663c9fce4ad14bbf3c84cda500ad3834",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/Slotstream/Governor.swift": "18c8610e07830737e911027ceb3c95877cfca95ae984065bd30add867557a2fc",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/WeightStore.swift": "39e24b2f71291746a860675d1be21670723369a1bd54aeb13dadb3ad9980e98a",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/ProcessMemory.swift": "5e3151b8bfeee220aad3bab1deb5ae68aec05d68c33bc28e2ac2f098ce69af1c",
    "Sources/Slotstream/Generate.swift": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf",
    "Sources/Slotstream/Plan.swift": "8e690bdba9090204b0b47e0af521ec4ba9113a1039e21ec0ef4d9b912d2905f2",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/ContextCommands.swift": "92b4e55c373f60ccf58540fcfcc32d7751a93fa59a5916f52674b138144849bb",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "021b244d5722e04c9676285cebc56e1e6f6712bbd6a83eda04cb97c955ecfdd3",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1"
  },
  "exitCode": 130,
  "guardFailure": [],
  "memory": [
    {
      "seconds": 1.01,
      "rssBytes": 45662208
    },
    {
      "seconds": 2.02,
      "rssBytes": 94945280
    },
    {
      "seconds": 3.03,
      "rssBytes": 147767296
    },
    {
      "seconds": 4.05,
      "rssBytes": 267206656
    },
    {
      "seconds": 5.05,
      "rssBytes": 319750144
    },
    {
      "seconds": 6.06,
      "rssBytes": 369049600
    },
    {
      "seconds": 7.07,
      "rssBytes": 542294016
    },
    {
      "seconds": 8.08,
      "rssBytes": 568426496
    },
    {
      "seconds": 9.09,
      "rssBytes": 637386752
    },
    {
      "seconds": 10.11,
      "rssBytes": 647905280
    },
    {
      "seconds": 11.12,
      "rssBytes": 668188672
    },
    {
      "seconds": 12.13,
      "rssBytes": 676462592
    },
    {
      "seconds": 13.15,
      "rssBytes": 691273728
    },
    {
      "seconds": 14.16,
      "rssBytes": 750288896
    },
    {
      "seconds": 15.17,
      "rssBytes": 752812032
    },
    {
      "seconds": 16.18,
      "rssBytes": 753221632
    },
    {
      "seconds": 17.19,
      "rssBytes": 753238016
    },
    {
      "seconds": 18.21,
      "rssBytes": 753336320
    },
    {
      "seconds": 19.22,
      "rssBytes": 753696768
    },
    {
      "seconds": 20.24,
      "rssBytes": 658784256
    },
    {
      "seconds": 21.24,
      "rssBytes": 669286400
    },
    {
      "seconds": 22.25,
      "rssBytes": 667844608
    },
    {
      "seconds": 23.26,
      "rssBytes": 673579008
    },
    {
      "seconds": 24.27,
      "rssBytes": 674529280
    },
    {
      "seconds": 25.28,
      "rssBytes": 674676736
    },
    {
      "seconds": 26.28,
      "rssBytes": 674676736
    },
    {
      "seconds": 27.29,
      "rssBytes": 674676736
    },
    {
      "seconds": 28.3,
      "rssBytes": 674693120
    },
    {
      "seconds": 29.31,
      "rssBytes": 674922496
    },
    {
      "seconds": 30.33,
      "rssBytes": 555139072
    },
    {
      "seconds": 31.34,
      "rssBytes": 612139008
    },
    {
      "seconds": 32.35,
      "rssBytes": 622346240
    },
    {
      "seconds": 33.36,
      "rssBytes": 634781696
    },
    {
      "seconds": 34.37,
      "rssBytes": 642596864
    },
    {
      "seconds": 35.38,
      "rssBytes": 678428672
    },
    {
      "seconds": 36.39,
      "rssBytes": 690520064
    },
    {
      "seconds": 37.41,
      "rssBytes": 703070208
    },
    {
      "seconds": 38.42,
      "rssBytes": 718749696
    },
    {
      "seconds": 39.43,
      "rssBytes": 739262464
    },
    {
      "seconds": 40.45,
      "rssBytes": 758153216
    },
    {
      "seconds": 41.45,
      "rssBytes": 797278208
    },
    {
      "seconds": 42.47,
      "rssBytes": 939982848
    },
    {
      "seconds": 43.47,
      "rssBytes": 953171968
    },
    {
      "seconds": 44.48,
      "rssBytes": 965263360
    },
    {
      "seconds": 45.49,
      "rssBytes": 978403328
    },
    {
      "seconds": 46.5,
      "rssBytes": 986333184
    },
    {
      "seconds": 47.51,
      "rssBytes": 993230848
    },
    {
      "seconds": 48.52,
      "rssBytes": 1001684992
    },
    {
      "seconds": 49.54,
      "rssBytes": 1009090560
    },
    {
      "seconds": 50.54,
      "rssBytes": 1017577472
    },
    {
      "seconds": 51.55,
      "rssBytes": 1036763136
    },
    {
      "seconds": 52.55,
      "rssBytes": 1042153472
    },
    {
      "seconds": 53.56,
      "rssBytes": 1046265856
    },
    {
      "seconds": 54.58,
      "rssBytes": 1046937600
    },
    {
      "seconds": 55.59,
      "rssBytes": 1054539776
    },
    {
      "seconds": 56.6,
      "rssBytes": 1058013184
    },
    {
      "seconds": 57.61,
      "rssBytes": 1061060608
    },
    {
      "seconds": 58.61,
      "rssBytes": 1064189952
    },
    {
      "seconds": 59.62,
      "rssBytes": 1066713088
    },
    {
      "seconds": 60.64,
      "rssBytes": 962822144
    },
    {
      "seconds": 61.65,
      "rssBytes": 967606272
    },
    {
      "seconds": 62.66,
      "rssBytes": 971309056
    },
    {
      "seconds": 63.67,
      "rssBytes": 974258176
    },
    {
      "seconds": 64.67,
      "rssBytes": 977436672
    },
    {
      "seconds": 65.68,
      "rssBytes": 980910080
    },
    {
      "seconds": 66.69,
      "rssBytes": 984776704
    },
    {
      "seconds": 67.71,
      "rssBytes": 988839936
    },
    {
      "seconds": 68.72,
      "rssBytes": 992460800
    },
    {
      "seconds": 69.74,
      "rssBytes": 995295232
    },
    {
      "seconds": 70.75,
      "rssBytes": 859160576
    },
    {
      "seconds": 71.77,
      "rssBytes": 862306304
    },
    {
      "seconds": 72.79,
      "rssBytes": 876707840
    },
    {
      "seconds": 73.8,
      "rssBytes": 880820224
    },
    {
      "seconds": 74.8,
      "rssBytes": 885702656
    },
    {
      "seconds": 75.82,
      "rssBytes": 888406016
    },
    {
      "seconds": 76.83,
      "rssBytes": 892469248
    },
    {
      "seconds": 77.84,
      "rssBytes": 897171456
    },
    {
      "seconds": 78.86,
      "rssBytes": 899858432
    },
    {
      "seconds": 79.86,
      "rssBytes": 902463488
    },
    {
      "seconds": 80.87,
      "rssBytes": 763363328
    },
    {
      "seconds": 81.88,
      "rssBytes": 763445248
    },
    {
      "seconds": 82.89,
      "rssBytes": 763445248
    },
    {
      "seconds": 83.9,
      "rssBytes": 763445248
    },
    {
      "seconds": 84.92,
      "rssBytes": 763445248
    },
    {
      "seconds": 85.94,
      "rssBytes": 763445248
    },
    {
      "seconds": 86.95,
      "rssBytes": 761675776
    },
    {
      "seconds": 87.97,
      "rssBytes": 762511360
    },
    {
      "seconds": 88.98,
      "rssBytes": 762544128
    },
    {
      "seconds": 89.99,
      "rssBytes": 762544128
    },
    {
      "seconds": 91.0,
      "rssBytes": 654442496
    },
    {
      "seconds": 92.0,
      "rssBytes": 654442496
    },
    {
      "seconds": 93.02,
      "rssBytes": 657555456
    },
    {
      "seconds": 94.03,
      "rssBytes": 662978560
    },
    {
      "seconds": 95.04,
      "rssBytes": 672284672
    },
    {
      "seconds": 96.05,
      "rssBytes": 672317440
    },
    {
      "seconds": 97.07,
      "rssBytes": 672317440
    },
    {
      "seconds": 98.08,
      "rssBytes": 672333824
    },
    {
      "seconds": 99.09,
      "rssBytes": 674578432
    },
    {
      "seconds": 100.11,
      "rssBytes": 677068800
    },
    {
      "seconds": 101.12,
      "rssBytes": 534216704
    },
    {
      "seconds": 102.14,
      "rssBytes": 534216704
    },
    {
      "seconds": 103.15,
      "rssBytes": 587612160
    },
    {
      "seconds": 104.16,
      "rssBytes": 593428480
    },
    {
      "seconds": 105.18,
      "rssBytes": 600064000
    },
    {
      "seconds": 106.19,
      "rssBytes": 610615296
    },
    {
      "seconds": 107.2,
      "rssBytes": 617316352
    },
    {
      "seconds": 108.22,
      "rssBytes": 622477312
    },
    {
      "seconds": 109.23,
      "rssBytes": 627146752
    },
    {
      "seconds": 110.25,
      "rssBytes": 627146752
    },
    {
      "seconds": 111.25,
      "rssBytes": 627146752
    },
    {
      "seconds": 112.26,
      "rssBytes": 627146752
    },
    {
      "seconds": 113.27,
      "rssBytes": 627146752
    },
    {
      "seconds": 114.29,
      "rssBytes": 630751232
    },
    {
      "seconds": 115.3,
      "rssBytes": 631390208
    },
    {
      "seconds": 116.31,
      "rssBytes": 631390208
    },
    {
      "seconds": 117.32,
      "rssBytes": 631554048
    },
    {
      "seconds": 118.33,
      "rssBytes": 625098752
    },
    {
      "seconds": 119.34,
      "rssBytes": 626540544
    },
    {
      "seconds": 120.36,
      "rssBytes": 627064832
    },
    {
      "seconds": 121.37,
      "rssBytes": 539557888
    },
    {
      "seconds": 122.38,
      "rssBytes": 540049408
    },
    {
      "seconds": 123.39,
      "rssBytes": 540049408
    },
    {
      "seconds": 124.4,
      "rssBytes": 540049408
    },
    {
      "seconds": 125.41,
      "rssBytes": 540049408
    },
    {
      "seconds": 126.42,
      "rssBytes": 540049408
    },
    {
      "seconds": 127.42,
      "rssBytes": 540295168
    },
    {
      "seconds": 128.44,
      "rssBytes": 540295168
    },
    {
      "seconds": 129.45,
      "rssBytes": 540295168
    },
    {
      "seconds": 130.47,
      "rssBytes": 540327936
    },
    {
      "seconds": 131.47,
      "rssBytes": 540622848
    },
    {
      "seconds": 132.49,
      "rssBytes": 540753920
    },
    {
      "seconds": 133.5,
      "rssBytes": 541343744
    },
    {
      "seconds": 134.51,
      "rssBytes": 545259520
    },
    {
      "seconds": 135.52,
      "rssBytes": 548667392
    },
    {
      "seconds": 136.53,
      "rssBytes": 583942144
    },
    {
      "seconds": 137.54,
      "rssBytes": 594247680
    },
    {
      "seconds": 138.55,
      "rssBytes": 606535680
    },
    {
      "seconds": 139.56,
      "rssBytes": 606535680
    },
    {
      "seconds": 140.58,
      "rssBytes": 606535680
    },
    {
      "seconds": 141.6,
      "rssBytes": 606535680
    },
    {
      "seconds": 142.6,
      "rssBytes": 610254848
    },
    {
      "seconds": 143.62,
      "rssBytes": 610254848
    },
    {
      "seconds": 144.63,
      "rssBytes": 610254848
    },
    {
      "seconds": 145.64,
      "rssBytes": 610254848
    },
    {
      "seconds": 146.66,
      "rssBytes": 610254848
    },
    {
      "seconds": 147.67,
      "rssBytes": 613613568
    },
    {
      "seconds": 148.67,
      "rssBytes": 620527616
    },
    {
      "seconds": 149.69,
      "rssBytes": 629030912
    },
    {
      "seconds": 150.7,
      "rssBytes": 635142144
    },
    {
      "seconds": 151.71,
      "rssBytes": 635813888
    },
    {
      "seconds": 152.72,
      "rssBytes": 641056768
    },
    {
      "seconds": 153.73,
      "rssBytes": 642580480
    },
    {
      "seconds": 154.75,
      "rssBytes": 645529600
    },
    {
      "seconds": 155.75,
      "rssBytes": 645529600
    },
    {
      "seconds": 156.77,
      "rssBytes": 645529600
    },
    {
      "seconds": 157.78,
      "rssBytes": 654393344
    },
    {
      "seconds": 158.79,
      "rssBytes": 683294720
    },
    {
      "seconds": 159.8,
      "rssBytes": 692731904
    },
    {
      "seconds": 160.81,
      "rssBytes": 692731904
    },
    {
      "seconds": 161.83,
      "rssBytes": 692731904
    },
    {
      "seconds": 162.84,
      "rssBytes": 692731904
    },
    {
      "seconds": 163.85,
      "rssBytes": 692961280
    },
    {
      "seconds": 164.87,
      "rssBytes": 692961280
    },
    {
      "seconds": 165.87,
      "rssBytes": 692961280
    },
    {
      "seconds": 166.89,
      "rssBytes": 693010432
    },
    {
      "seconds": 167.91,
      "rssBytes": 693010432
    },
    {
      "seconds": 168.92,
      "rssBytes": 693010432
    },
    {
      "seconds": 169.93,
      "rssBytes": 693223424
    },
    {
      "seconds": 170.93,
      "rssBytes": 599212032
    },
    {
      "seconds": 171.94,
      "rssBytes": 599212032
    },
    {
      "seconds": 172.95,
      "rssBytes": 599785472
    },
    {
      "seconds": 173.96,
      "rssBytes": 599785472
    },
    {
      "seconds": 174.97,
      "rssBytes": 602734592
    },
    {
      "seconds": 175.99,
      "rssBytes": 607174656
    },
    {
      "seconds": 177.0,
      "rssBytes": 611598336
    },
    {
      "seconds": 178.01,
      "rssBytes": 616562688
    },
    {
      "seconds": 179.02,
      "rssBytes": 620871680
    },
    {
      "seconds": 180.04,
      "rssBytes": 665092096
    },
    {
      "seconds": 181.04,
      "rssBytes": 675905536
    },
    {
      "seconds": 182.05,
      "rssBytes": 677576704
    },
    {
      "seconds": 183.07,
      "rssBytes": 672989184
    },
    {
      "seconds": 184.07,
      "rssBytes": 674791424
    },
    {
      "seconds": 185.09,
      "rssBytes": 674824192
    },
    {
      "seconds": 186.11,
      "rssBytes": 674824192
    },
    {
      "seconds": 187.12,
      "rssBytes": 684752896
    },
    {
      "seconds": 188.12,
      "rssBytes": 789725184
    },
    {
      "seconds": 189.13,
      "rssBytes": 791609344
    },
    {
      "seconds": 190.14,
      "rssBytes": 793624576
    },
    {
      "seconds": 191.16,
      "rssBytes": 656375808
    },
    {
      "seconds": 192.17,
      "rssBytes": 656474112
    },
    {
      "seconds": 193.19,
      "rssBytes": 656474112
    },
    {
      "seconds": 194.2,
      "rssBytes": 656474112
    },
    {
      "seconds": 195.22,
      "rssBytes": 656474112
    },
    {
      "seconds": 196.23,
      "rssBytes": 656474112
    },
    {
      "seconds": 197.24,
      "rssBytes": 656474112
    },
    {
      "seconds": 198.26,
      "rssBytes": 657129472
    },
    {
      "seconds": 199.27,
      "rssBytes": 661176320
    },
    {
      "seconds": 200.28,
      "rssBytes": 667418624
    },
    {
      "seconds": 201.3,
      "rssBytes": 556777472
    },
    {
      "seconds": 202.3,
      "rssBytes": 564887552
    },
    {
      "seconds": 203.32,
      "rssBytes": 564887552
    },
    {
      "seconds": 204.32,
      "rssBytes": 574816256
    },
    {
      "seconds": 205.33,
      "rssBytes": 585252864
    },
    {
      "seconds": 206.34,
      "rssBytes": 587710464
    },
    {
      "seconds": 207.35,
      "rssBytes": 590200832
    },
    {
      "seconds": 208.36,
      "rssBytes": 590200832
    },
    {
      "seconds": 209.37,
      "rssBytes": 590200832
    },
    {
      "seconds": 210.39,
      "rssBytes": 590200832
    },
    {
      "seconds": 211.39,
      "rssBytes": 502431744
    },
    {
      "seconds": 212.41,
      "rssBytes": 502431744
    },
    {
      "seconds": 213.41,
      "rssBytes": 514801664
    },
    {
      "seconds": 214.42,
      "rssBytes": 512589824
    },
    {
      "seconds": 215.44,
      "rssBytes": 519061504
    },
    {
      "seconds": 216.44,
      "rssBytes": 522436608
    },
    {
      "seconds": 217.46,
      "rssBytes": 543588352
    },
    {
      "seconds": 218.47,
      "rssBytes": 550354944
    },
    {
      "seconds": 219.47,
      "rssBytes": 550354944
    },
    {
      "seconds": 220.48,
      "rssBytes": 552370176
    },
    {
      "seconds": 221.49,
      "rssBytes": 552386560
    },
    {
      "seconds": 222.5,
      "rssBytes": 552402944
    },
    {
      "seconds": 223.51,
      "rssBytes": 552402944
    },
    {
      "seconds": 224.53,
      "rssBytes": 552402944
    },
    {
      "seconds": 225.54,
      "rssBytes": 552402944
    },
    {
      "seconds": 226.54,
      "rssBytes": 552583168
    },
    {
      "seconds": 227.55,
      "rssBytes": 554811392
    },
    {
      "seconds": 228.56,
      "rssBytes": 554811392
    },
    {
      "seconds": 229.57,
      "rssBytes": 554811392
    },
    {
      "seconds": 230.58,
      "rssBytes": 554811392
    },
    {
      "seconds": 231.59,
      "rssBytes": 478019584
    },
    {
      "seconds": 232.61,
      "rssBytes": 478216192
    },
    {
      "seconds": 233.62,
      "rssBytes": 478527488
    },
    {
      "seconds": 234.63,
      "rssBytes": 485949440
    },
    {
      "seconds": 235.64,
      "rssBytes": 485949440
    },
    {
      "seconds": 236.65,
      "rssBytes": 502513664
    },
    {
      "seconds": 237.66,
      "rssBytes": 507641856
    },
    {
      "seconds": 238.67,
      "rssBytes": 508313600
    },
    {
      "seconds": 239.69,
      "rssBytes": 508313600
    },
    {
      "seconds": 240.7,
      "rssBytes": 508379136
    },
    {
      "seconds": 241.71,
      "rssBytes": 508411904
    },
    {
      "seconds": 242.71,
      "rssBytes": 508411904
    },
    {
      "seconds": 243.73,
      "rssBytes": 509771776
    },
    {
      "seconds": 244.74,
      "rssBytes": 516571136
    },
    {
      "seconds": 245.75,
      "rssBytes": 521715712
    },
    {
      "seconds": 246.77,
      "rssBytes": 520224768
    },
    {
      "seconds": 247.78,
      "rssBytes": 525434880
    },
    {
      "seconds": 248.8,
      "rssBytes": 588808192
    },
    {
      "seconds": 249.82,
      "rssBytes": 636764160
    },
    {
      "seconds": 250.82,
      "rssBytes": 646561792
    },
    {
      "seconds": 251.84,
      "rssBytes": 657948672
    },
    {
      "seconds": 252.85,
      "rssBytes": 664764416
    },
    {
      "seconds": 253.87,
      "rssBytes": 668188672
    },
    {
      "seconds": 254.88,
      "rssBytes": 675971072
    },
    {
      "seconds": 255.89,
      "rssBytes": 685096960
    },
    {
      "seconds": 256.9,
      "rssBytes": 691503104
    },
    {
      "seconds": 257.91,
      "rssBytes": 697958400
    },
    {
      "seconds": 258.92,
      "rssBytes": 700104704
    },
    {
      "seconds": 259.92,
      "rssBytes": 704610304
    },
    {
      "seconds": 260.94,
      "rssBytes": 602603520
    },
    {
      "seconds": 261.95,
      "rssBytes": 605290496
    },
    {
      "seconds": 262.96,
      "rssBytes": 605290496
    },
    {
      "seconds": 263.97,
      "rssBytes": 605290496
    },
    {
      "seconds": 264.98,
      "rssBytes": 605290496
    },
    {
      "seconds": 266.0,
      "rssBytes": 605290496
    },
    {
      "seconds": 267.02,
      "rssBytes": 605290496
    },
    {
      "seconds": 268.03,
      "rssBytes": 615776256
    },
    {
      "seconds": 269.04,
      "rssBytes": 663453696
    },
    {
      "seconds": 270.05,
      "rssBytes": 676478976
    },
    {
      "seconds": 271.07,
      "rssBytes": 682917888
    },
    {
      "seconds": 272.08,
      "rssBytes": 697794560
    },
    {
      "seconds": 273.09,
      "rssBytes": 708313088
    },
    {
      "seconds": 274.1,
      "rssBytes": 720207872
    },
    {
      "seconds": 275.11,
      "rssBytes": 725958656
    },
    {
      "seconds": 276.13,
      "rssBytes": 726876160
    },
    {
      "seconds": 277.13,
      "rssBytes": 726876160
    },
    {
      "seconds": 278.14,
      "rssBytes": 727941120
    },
    {
      "seconds": 279.15,
      "rssBytes": 734691328
    },
    {
      "seconds": 280.16,
      "rssBytes": 734691328
    },
    {
      "seconds": 281.17,
      "rssBytes": 603242496
    },
    {
      "seconds": 282.18,
      "rssBytes": 603242496
    },
    {
      "seconds": 283.19,
      "rssBytes": 603242496
    },
    {
      "seconds": 284.21,
      "rssBytes": 603406336
    },
    {
      "seconds": 285.22,
      "rssBytes": 607092736
    },
    {
      "seconds": 286.23,
      "rssBytes": 612958208
    },
    {
      "seconds": 287.25,
      "rssBytes": 617955328
    },
    {
      "seconds": 288.26,
      "rssBytes": 623017984
    },
    {
      "seconds": 289.27,
      "rssBytes": 628015104
    },
    {
      "seconds": 290.27,
      "rssBytes": 632750080
    },
    {
      "seconds": 291.29,
      "rssBytes": 636977152
    },
    {
      "seconds": 292.3,
      "rssBytes": 639680512
    },
    {
      "seconds": 293.31,
      "rssBytes": 639680512
    },
    {
      "seconds": 294.33,
      "rssBytes": 639680512
    },
    {
      "seconds": 295.34,
      "rssBytes": 639696896
    },
    {
      "seconds": 296.35,
      "rssBytes": 639696896
    },
    {
      "seconds": 297.36,
      "rssBytes": 639647744
    },
    {
      "seconds": 298.37,
      "rssBytes": 639647744
    },
    {
      "seconds": 299.37,
      "rssBytes": 640450560
    },
    {
      "seconds": 300.39,
      "rssBytes": 640483328
    },
    {
      "seconds": 301.4,
      "rssBytes": 640860160
    },
    {
      "seconds": 302.41,
      "rssBytes": 640860160
    },
    {
      "seconds": 303.42,
      "rssBytes": 641155072
    },
    {
      "seconds": 304.43,
      "rssBytes": 641155072
    },
    {
      "seconds": 305.44,
      "rssBytes": 641728512
    },
    {
      "seconds": 306.46,
      "rssBytes": 641810432
    },
    {
      "seconds": 307.46,
      "rssBytes": 641810432
    },
    {
      "seconds": 308.47,
      "rssBytes": 644972544
    },
    {
      "seconds": 309.48,
      "rssBytes": 644972544
    },
    {
      "seconds": 310.49,
      "rssBytes": 639500288
    },
    {
      "seconds": 311.49,
      "rssBytes": 639549440
    },
    {
      "seconds": 312.5,
      "rssBytes": 639844352
    },
    {
      "seconds": 313.51,
      "rssBytes": 639795200
    },
    {
      "seconds": 314.52,
      "rssBytes": 639893504
    },
    {
      "seconds": 315.53,
      "rssBytes": 639844352
    },
    {
      "seconds": 316.54,
      "rssBytes": 639844352
    },
    {
      "seconds": 317.55,
      "rssBytes": 640139264
    },
    {
      "seconds": 318.55,
      "rssBytes": 640139264
    },
    {
      "seconds": 319.57,
      "rssBytes": 640139264
    },
    {
      "seconds": 320.57,
      "rssBytes": 680427520
    },
    {
      "seconds": 321.58,
      "rssBytes": 680476672
    },
    {
      "seconds": 322.59,
      "rssBytes": 680476672
    },
    {
      "seconds": 323.6,
      "rssBytes": 680476672
    },
    {
      "seconds": 324.62,
      "rssBytes": 680476672
    },
    {
      "seconds": 325.62,
      "rssBytes": 680476672
    },
    {
      "seconds": 326.63,
      "rssBytes": 680476672
    },
    {
      "seconds": 327.65,
      "rssBytes": 680476672
    },
    {
      "seconds": 328.65,
      "rssBytes": 690552832
    },
    {
      "seconds": 329.66,
      "rssBytes": 690552832
    },
    {
      "seconds": 330.67,
      "rssBytes": 690585600
    },
    {
      "seconds": 331.68,
      "rssBytes": 598638592
    },
    {
      "seconds": 332.7,
      "rssBytes": 600473600
    },
    {
      "seconds": 333.71,
      "rssBytes": 606830592
    },
    {
      "seconds": 334.71,
      "rssBytes": 609468416
    },
    {
      "seconds": 335.73,
      "rssBytes": 614465536
    },
    {
      "seconds": 336.74,
      "rssBytes": 618381312
    },
    {
      "seconds": 337.75,
      "rssBytes": 625246208
    },
    {
      "seconds": 338.76,
      "rssBytes": 630784000
    },
    {
      "seconds": 339.77,
      "rssBytes": 634339328
    },
    {
      "seconds": 340.79,
      "rssBytes": 636878848
    },
    {
      "seconds": 341.8,
      "rssBytes": 636878848
    },
    {
      "seconds": 342.81,
      "rssBytes": 635305984
    },
    {
      "seconds": 343.82,
      "rssBytes": 635846656
    },
    {
      "seconds": 344.83,
      "rssBytes": 636551168
    },
    {
      "seconds": 345.84,
      "rssBytes": 636452864
    },
    {
      "seconds": 346.85,
      "rssBytes": 640270336
    },
    {
      "seconds": 347.86,
      "rssBytes": 640319488
    },
    {
      "seconds": 348.88,
      "rssBytes": 640516096
    },
    {
      "seconds": 349.89,
      "rssBytes": 640516096
    },
    {
      "seconds": 350.9,
      "rssBytes": 640516096
    },
    {
      "seconds": 351.91,
      "rssBytes": 640516096
    },
    {
      "seconds": 352.92,
      "rssBytes": 641810432
    },
    {
      "seconds": 353.93,
      "rssBytes": 642220032
    },
    {
      "seconds": 354.95,
      "rssBytes": 642531328
    },
    {
      "seconds": 355.96,
      "rssBytes": 643661824
    },
    {
      "seconds": 356.97,
      "rssBytes": 643694592
    },
    {
      "seconds": 357.98,
      "rssBytes": 643694592
    },
    {
      "seconds": 358.99,
      "rssBytes": 643694592
    },
    {
      "seconds": 360.0,
      "rssBytes": 643694592
    },
    {
      "seconds": 361.01,
      "rssBytes": 643743744
    },
    {
      "seconds": 362.02,
      "rssBytes": 643743744
    },
    {
      "seconds": 363.03,
      "rssBytes": 643743744
    },
    {
      "seconds": 364.05,
      "rssBytes": 643743744
    },
    {
      "seconds": 365.06,
      "rssBytes": 643743744
    },
    {
      "seconds": 366.06,
      "rssBytes": 644513792
    },
    {
      "seconds": 367.08,
      "rssBytes": 644562944
    },
    {
      "seconds": 368.09,
      "rssBytes": 644513792
    },
    {
      "seconds": 369.1,
      "rssBytes": 644513792
    },
    {
      "seconds": 370.12,
      "rssBytes": 644513792
    },
    {
      "seconds": 371.12,
      "rssBytes": 644464640
    },
    {
      "seconds": 372.13,
      "rssBytes": 644464640
    },
    {
      "seconds": 373.14,
      "rssBytes": 644464640
    },
    {
      "seconds": 374.16,
      "rssBytes": 644464640
    },
    {
      "seconds": 375.16,
      "rssBytes": 639746048
    },
    {
      "seconds": 376.17,
      "rssBytes": 640221184
    },
    {
      "seconds": 377.19,
      "rssBytes": 640221184
    },
    {
      "seconds": 378.2,
      "rssBytes": 640237568
    },
    {
      "seconds": 379.2,
      "rssBytes": 640319488
    },
    {
      "seconds": 380.21,
      "rssBytes": 640319488
    },
    {
      "seconds": 381.22,
      "rssBytes": 640319488
    },
    {
      "seconds": 382.23,
      "rssBytes": 640565248
    },
    {
      "seconds": 383.24,
      "rssBytes": 642531328
    },
    {
      "seconds": 384.25,
      "rssBytes": 642596864
    },
    {
      "seconds": 385.26,
      "rssBytes": 642498560
    },
    {
      "seconds": 386.27,
      "rssBytes": 642498560
    },
    {
      "seconds": 387.28,
      "rssBytes": 642498560
    },
    {
      "seconds": 388.29,
      "rssBytes": 642498560
    },
    {
      "seconds": 389.3,
      "rssBytes": 642498560
    },
    {
      "seconds": 390.31,
      "rssBytes": 684441600
    },
    {
      "seconds": 391.33,
      "rssBytes": 684441600
    },
    {
      "seconds": 392.34,
      "rssBytes": 684457984
    },
    {
      "seconds": 393.35,
      "rssBytes": 684457984
    },
    {
      "seconds": 394.36,
      "rssBytes": 740392960
    },
    {
      "seconds": 395.37,
      "rssBytes": 751058944
    },
    {
      "seconds": 396.38,
      "rssBytes": 762150912
    },
    {
      "seconds": 397.39,
      "rssBytes": 769359872
    },
    {
      "seconds": 398.39,
      "rssBytes": 774406144
    },
    {
      "seconds": 399.4,
      "rssBytes": 781680640
    },
    {
      "seconds": 400.41,
      "rssBytes": 790298624
    },
    {
      "seconds": 401.41,
      "rssBytes": 808681472
    },
    {
      "seconds": 402.42,
      "rssBytes": 816513024
    },
    {
      "seconds": 403.42,
      "rssBytes": 821657600
    },
    {
      "seconds": 404.43,
      "rssBytes": 821657600
    },
    {
      "seconds": 405.44,
      "rssBytes": 821657600
    },
    {
      "seconds": 406.44,
      "rssBytes": 811352064
    },
    {
      "seconds": 407.45,
      "rssBytes": 814792704
    },
    {
      "seconds": 408.46,
      "rssBytes": 818003968
    },
    {
      "seconds": 409.46,
      "rssBytes": 819806208
    },
    {
      "seconds": 410.48,
      "rssBytes": 821231616
    },
    {
      "seconds": 411.49,
      "rssBytes": 821919744
    },
    {
      "seconds": 412.5,
      "rssBytes": 821985280
    },
    {
      "seconds": 413.5,
      "rssBytes": 821985280
    },
    {
      "seconds": 414.51,
      "rssBytes": 821985280
    },
    {
      "seconds": 415.51,
      "rssBytes": 821936128
    },
    {
      "seconds": 416.52,
      "rssBytes": 822050816
    },
    {
      "seconds": 417.53,
      "rssBytes": 822050816
    },
    {
      "seconds": 418.54,
      "rssBytes": 825819136
    },
    {
      "seconds": 419.54,
      "rssBytes": 825819136
    },
    {
      "seconds": 420.55,
      "rssBytes": 825819136
    },
    {
      "seconds": 421.56,
      "rssBytes": 825819136
    },
    {
      "seconds": 422.57,
      "rssBytes": 825819136
    },
    {
      "seconds": 423.58,
      "rssBytes": 825819136
    },
    {
      "seconds": 424.58,
      "rssBytes": 825819136
    },
    {
      "seconds": 425.59,
      "rssBytes": 825819136
    },
    {
      "seconds": 426.6,
      "rssBytes": 825819136
    },
    {
      "seconds": 427.6,
      "rssBytes": 825819136
    },
    {
      "seconds": 428.61,
      "rssBytes": 827113472
    },
    {
      "seconds": 429.64,
      "rssBytes": 827113472
    },
    {
      "seconds": 430.65,
      "rssBytes": 827129856
    },
    {
      "seconds": 431.66,
      "rssBytes": 827342848
    },
    {
      "seconds": 432.66,
      "rssBytes": 827342848
    },
    {
      "seconds": 433.67,
      "rssBytes": 827342848
    },
    {
      "seconds": 434.68,
      "rssBytes": 827342848
    },
    {
      "seconds": 435.68,
      "rssBytes": 827342848
    },
    {
      "seconds": 436.69,
      "rssBytes": 827293696
    },
    {
      "seconds": 437.69,
      "rssBytes": 827293696
    },
    {
      "seconds": 438.7,
      "rssBytes": 821411840
    },
    {
      "seconds": 439.71,
      "rssBytes": 824197120
    },
    {
      "seconds": 440.71,
      "rssBytes": 824410112
    },
    {
      "seconds": 441.72,
      "rssBytes": 824410112
    },
    {
      "seconds": 442.72,
      "rssBytes": 824541184
    },
    {
      "seconds": 443.73,
      "rssBytes": 827047936
    },
    {
      "seconds": 444.74,
      "rssBytes": 827408384
    },
    {
      "seconds": 445.75,
      "rssBytes": 827490304
    },
    {
      "seconds": 446.75,
      "rssBytes": 827490304
    },
    {
      "seconds": 447.76,
      "rssBytes": 827490304
    },
    {
      "seconds": 448.77,
      "rssBytes": 827490304
    },
    {
      "seconds": 449.77,
      "rssBytes": 716587008
    },
    {
      "seconds": 450.78,
      "rssBytes": 716587008
    },
    {
      "seconds": 451.79,
      "rssBytes": 716587008
    },
    {
      "seconds": 452.8,
      "rssBytes": 716652544
    },
    {
      "seconds": 453.81,
      "rssBytes": 716652544
    },
    {
      "seconds": 454.82,
      "rssBytes": 716652544
    },
    {
      "seconds": 455.83,
      "rssBytes": 717635584
    },
    {
      "seconds": 456.84,
      "rssBytes": 717635584
    },
    {
      "seconds": 457.85,
      "rssBytes": 717996032
    },
    {
      "seconds": 458.86,
      "rssBytes": 718012416
    },
    {
      "seconds": 459.87,
      "rssBytes": 589447168
    },
    {
      "seconds": 460.89,
      "rssBytes": 590823424
    },
    {
      "seconds": 461.9,
      "rssBytes": 594984960
    },
    {
      "seconds": 462.91,
      "rssBytes": 643661824
    },
    {
      "seconds": 463.92,
      "rssBytes": 660357120
    },
    {
      "seconds": 464.93,
      "rssBytes": 665976832
    },
    {
      "seconds": 465.94,
      "rssBytes": 671449088
    },
    {
      "seconds": 466.95,
      "rssBytes": 674824192
    },
    {
      "seconds": 467.96,
      "rssBytes": 676495360
    },
    {
      "seconds": 468.97,
      "rssBytes": 676495360
    },
    {
      "seconds": 469.98,
      "rssBytes": 676495360
    },
    {
      "seconds": 470.98,
      "rssBytes": 669040640
    },
    {
      "seconds": 471.99,
      "rssBytes": 672186368
    },
    {
      "seconds": 473.0,
      "rssBytes": 672186368
    },
    {
      "seconds": 474.01,
      "rssBytes": 673136640
    },
    {
      "seconds": 475.03,
      "rssBytes": 673136640
    },
    {
      "seconds": 476.03,
      "rssBytes": 673136640
    },
    {
      "seconds": 477.05,
      "rssBytes": 673153024
    },
    {
      "seconds": 478.06,
      "rssBytes": 675872768
    },
    {
      "seconds": 479.06,
      "rssBytes": 683573248
    },
    {
      "seconds": 480.07,
      "rssBytes": 683687936
    },
    {
      "seconds": 481.08,
      "rssBytes": 683687936
    },
    {
      "seconds": 482.09,
      "rssBytes": 683737088
    },
    {
      "seconds": 483.1,
      "rssBytes": 684785664
    },
    {
      "seconds": 484.11,
      "rssBytes": 684785664
    },
    {
      "seconds": 485.12,
      "rssBytes": 684785664
    },
    {
      "seconds": 486.13,
      "rssBytes": 684834816
    },
    {
      "seconds": 487.15,
      "rssBytes": 684834816
    },
    {
      "seconds": 488.16,
      "rssBytes": 686800896
    },
    {
      "seconds": 489.16,
      "rssBytes": 686800896
    },
    {
      "seconds": 490.17,
      "rssBytes": 686702592
    },
    {
      "seconds": 491.17,
      "rssBytes": 686718976
    },
    {
      "seconds": 492.18,
      "rssBytes": 686784512
    },
    {
      "seconds": 493.2,
      "rssBytes": 686817280
    },
    {
      "seconds": 494.2,
      "rssBytes": 686817280
    },
    {
      "seconds": 495.22,
      "rssBytes": 686817280
    },
    {
      "seconds": 496.23,
      "rssBytes": 728760320
    },
    {
      "seconds": 497.24,
      "rssBytes": 728760320
    },
    {
      "seconds": 498.25,
      "rssBytes": 728760320
    },
    {
      "seconds": 499.26,
      "rssBytes": 739246080
    },
    {
      "seconds": 500.27,
      "rssBytes": 739246080
    },
    {
      "seconds": 501.29,
      "rssBytes": 739196928
    },
    {
      "seconds": 502.3,
      "rssBytes": 739196928
    },
    {
      "seconds": 503.31,
      "rssBytes": 737132544
    },
    {
      "seconds": 504.33,
      "rssBytes": 737132544
    },
    {
      "seconds": 505.34,
      "rssBytes": 737132544
    },
    {
      "seconds": 506.35,
      "rssBytes": 737132544
    },
    {
      "seconds": 507.35,
      "rssBytes": 737132544
    },
    {
      "seconds": 508.37,
      "rssBytes": 737755136
    },
    {
      "seconds": 509.38,
      "rssBytes": 737755136
    },
    {
      "seconds": 510.39,
      "rssBytes": 655917056
    },
    {
      "seconds": 511.41,
      "rssBytes": 655917056
    },
    {
      "seconds": 512.41,
      "rssBytes": 660783104
    },
    {
      "seconds": 513.43,
      "rssBytes": 661438464
    },
    {
      "seconds": 514.44,
      "rssBytes": 661471232
    },
    {
      "seconds": 515.44,
      "rssBytes": 661471232
    },
    {
      "seconds": 516.45,
      "rssBytes": 661471232
    },
    {
      "seconds": 517.46,
      "rssBytes": 666861568
    },
    {
      "seconds": 518.47,
      "rssBytes": 666779648
    },
    {
      "seconds": 519.49,
      "rssBytes": 666779648
    },
    {
      "seconds": 520.5,
      "rssBytes": 666779648
    },
    {
      "seconds": 521.5,
      "rssBytes": 666779648
    },
    {
      "seconds": 522.52,
      "rssBytes": 666779648
    },
    {
      "seconds": 523.53,
      "rssBytes": 666779648
    },
    {
      "seconds": 524.54,
      "rssBytes": 666779648
    },
    {
      "seconds": 525.55,
      "rssBytes": 666779648
    },
    {
      "seconds": 526.56,
      "rssBytes": 666779648
    },
    {
      "seconds": 527.57,
      "rssBytes": 666779648
    },
    {
      "seconds": 528.58,
      "rssBytes": 675250176
    },
    {
      "seconds": 529.6,
      "rssBytes": 675250176
    },
    {
      "seconds": 530.61,
      "rssBytes": 676872192
    },
    {
      "seconds": 531.62,
      "rssBytes": 679870464
    },
    {
      "seconds": 532.64,
      "rssBytes": 679870464
    },
    {
      "seconds": 533.65,
      "rssBytes": 679936000
    },
    {
      "seconds": 534.66,
      "rssBytes": 670236672
    },
    {
      "seconds": 535.67,
      "rssBytes": 673939456
    },
    {
      "seconds": 536.67,
      "rssBytes": 674086912
    },
    {
      "seconds": 537.68,
      "rssBytes": 674086912
    },
    {
      "seconds": 538.7,
      "rssBytes": 673972224
    },
    {
      "seconds": 539.71,
      "rssBytes": 673988608
    },
    {
      "seconds": 540.72,
      "rssBytes": 673988608
    },
    {
      "seconds": 541.73,
      "rssBytes": 674037760
    },
    {
      "seconds": 542.74,
      "rssBytes": 674037760
    },
    {
      "seconds": 543.75,
      "rssBytes": 674037760
    },
    {
      "seconds": 544.76,
      "rssBytes": 674201600
    },
    {
      "seconds": 545.77,
      "rssBytes": 674201600
    },
    {
      "seconds": 546.78,
      "rssBytes": 674201600
    },
    {
      "seconds": 547.8,
      "rssBytes": 674201600
    },
    {
      "seconds": 548.8,
      "rssBytes": 676642816
    },
    {
      "seconds": 549.82,
      "rssBytes": 676642816
    },
    {
      "seconds": 550.83,
      "rssBytes": 676642816
    },
    {
      "seconds": 551.84,
      "rssBytes": 676642816
    },
    {
      "seconds": 552.85,
      "rssBytes": 720027648
    },
    {
      "seconds": 553.85,
      "rssBytes": 723599360
    },
    {
      "seconds": 554.88,
      "rssBytes": 726351872
    },
    {
      "seconds": 555.88,
      "rssBytes": 727465984
    },
    {
      "seconds": 556.9,
      "rssBytes": 732512256
    },
    {
      "seconds": 557.91,
      "rssBytes": 737411072
    },
    {
      "seconds": 558.92,
      "rssBytes": 746995712
    },
    {
      "seconds": 559.92,
      "rssBytes": 750305280
    },
    {
      "seconds": 560.93,
      "rssBytes": 754499584
    },
    {
      "seconds": 561.94,
      "rssBytes": 756776960
    },
    {
      "seconds": 562.95,
      "rssBytes": 756776960
    },
    {
      "seconds": 563.96,
      "rssBytes": 756776960
    },
    {
      "seconds": 564.97,
      "rssBytes": 756793344
    },
    {
      "seconds": 565.98,
      "rssBytes": 767229952
    },
    {
      "seconds": 566.99,
      "rssBytes": 764198912
    },
    {
      "seconds": 568.0,
      "rssBytes": 765804544
    },
    {
      "seconds": 569.01,
      "rssBytes": 765804544
    },
    {
      "seconds": 570.01,
      "rssBytes": 765804544
    },
    {
      "seconds": 571.02,
      "rssBytes": 765804544
    },
    {
      "seconds": 572.03,
      "rssBytes": 765804544
    },
    {
      "seconds": 573.04,
      "rssBytes": 765804544
    },
    {
      "seconds": 574.05,
      "rssBytes": 765804544
    },
    {
      "seconds": 575.05,
      "rssBytes": 765804544
    },
    {
      "seconds": 576.06,
      "rssBytes": 765804544
    },
    {
      "seconds": 577.07,
      "rssBytes": 765804544
    },
    {
      "seconds": 578.07,
      "rssBytes": 765952000
    },
    {
      "seconds": 579.08,
      "rssBytes": 766296064
    },
    {
      "seconds": 580.09,
      "rssBytes": 766509056
    },
    {
      "seconds": 581.1,
      "rssBytes": 767148032
    },
    {
      "seconds": 582.11,
      "rssBytes": 767148032
    },
    {
      "seconds": 583.11,
      "rssBytes": 767148032
    },
    {
      "seconds": 584.12,
      "rssBytes": 767148032
    },
    {
      "seconds": 585.13,
      "rssBytes": 767148032
    },
    {
      "seconds": 586.14,
      "rssBytes": 637288448
    },
    {
      "seconds": 587.14,
      "rssBytes": 637288448
    },
    {
      "seconds": 588.15,
      "rssBytes": 637288448
    },
    {
      "seconds": 589.15,
      "rssBytes": 637190144
    },
    {
      "seconds": 590.16,
      "rssBytes": 637222912
    },
    {
      "seconds": 591.17,
      "rssBytes": 637222912
    },
    {
      "seconds": 592.17,
      "rssBytes": 637222912
    },
    {
      "seconds": 593.18,
      "rssBytes": 637239296
    },
    {
      "seconds": 594.19,
      "rssBytes": 637239296
    },
    {
      "seconds": 595.2,
      "rssBytes": 640532480
    },
    {
      "seconds": 596.2,
      "rssBytes": 643710976
    },
    {
      "seconds": 597.22,
      "rssBytes": 648871936
    },
    {
      "seconds": 598.22,
      "rssBytes": 652722176
    },
    {
      "seconds": 599.23,
      "rssBytes": 652738560
    },
    {
      "seconds": 600.24,
      "rssBytes": 658472960
    },
    {
      "seconds": 601.24,
      "rssBytes": 663158784
    },
    {
      "seconds": 602.25,
      "rssBytes": 670318592
    },
    {
      "seconds": 603.26,
      "rssBytes": 670482432
    },
    {
      "seconds": 604.27,
      "rssBytes": 670580736
    },
    {
      "seconds": 605.27,
      "rssBytes": 670580736
    },
    {
      "seconds": 606.27,
      "rssBytes": 671137792
    },
    {
      "seconds": 607.29,
      "rssBytes": 671662080
    },
    {
      "seconds": 608.29,
      "rssBytes": 671727616
    },
    {
      "seconds": 609.3,
      "rssBytes": 672104448
    },
    {
      "seconds": 610.31,
      "rssBytes": 672104448
    },
    {
      "seconds": 611.32,
      "rssBytes": 672104448
    },
    {
      "seconds": 612.32,
      "rssBytes": 672104448
    },
    {
      "seconds": 613.33,
      "rssBytes": 672104448
    },
    {
      "seconds": 614.34,
      "rssBytes": 672104448
    },
    {
      "seconds": 615.35,
      "rssBytes": 672104448
    },
    {
      "seconds": 616.37,
      "rssBytes": 580206592
    },
    {
      "seconds": 617.38,
      "rssBytes": 580206592
    },
    {
      "seconds": 618.39,
      "rssBytes": 580206592
    },
    {
      "seconds": 619.4,
      "rssBytes": 580206592
    },
    {
      "seconds": 620.41,
      "rssBytes": 580206592
    },
    {
      "seconds": 621.42,
      "rssBytes": 580272128
    },
    {
      "seconds": 622.43,
      "rssBytes": 580272128
    },
    {
      "seconds": 623.43,
      "rssBytes": 580272128
    },
    {
      "seconds": 624.45,
      "rssBytes": 625115136
    },
    {
      "seconds": 625.46,
      "rssBytes": 629063680
    },
    {
      "seconds": 626.47,
      "rssBytes": 630472704
    },
    {
      "seconds": 627.47,
      "rssBytes": 634404864
    },
    {
      "seconds": 628.49,
      "rssBytes": 636764160
    },
    {
      "seconds": 629.5,
      "rssBytes": 642727936
    },
    {
      "seconds": 630.51,
      "rssBytes": 644628480
    },
    {
      "seconds": 631.52,
      "rssBytes": 646594560
    },
    {
      "seconds": 632.52,
      "rssBytes": 652066816
    },
    {
      "seconds": 633.53,
      "rssBytes": 654852096
    },
    {
      "seconds": 634.54,
      "rssBytes": 655278080
    },
    {
      "seconds": 635.54,
      "rssBytes": 669483008
    },
    {
      "seconds": 636.55,
      "rssBytes": 669483008
    },
    {
      "seconds": 637.55,
      "rssBytes": 670367744
    },
    {
      "seconds": 638.56,
      "rssBytes": 670564352
    },
    {
      "seconds": 639.57,
      "rssBytes": 670597120
    },
    {
      "seconds": 640.58,
      "rssBytes": 670728192
    },
    {
      "seconds": 641.59,
      "rssBytes": 670728192
    },
    {
      "seconds": 642.6,
      "rssBytes": 670728192
    },
    {
      "seconds": 643.61,
      "rssBytes": 670777344
    },
    {
      "seconds": 644.61,
      "rssBytes": 672317440
    },
    {
      "seconds": 645.63,
      "rssBytes": 677036032
    },
    {
      "seconds": 646.64,
      "rssBytes": 681590784
    },
    {
      "seconds": 647.65,
      "rssBytes": 684195840
    },
    {
      "seconds": 648.66,
      "rssBytes": 687472640
    },
    {
      "seconds": 649.66,
      "rssBytes": 688914432
    },
    {
      "seconds": 650.67,
      "rssBytes": 695500800
    },
    {
      "seconds": 651.68,
      "rssBytes": 698990592
    },
    {
      "seconds": 652.69,
      "rssBytes": 700809216
    },
    {
      "seconds": 653.7,
      "rssBytes": 704806912
    },
    {
      "seconds": 654.7,
      "rssBytes": 705265664
    },
    {
      "seconds": 655.71,
      "rssBytes": 705265664
    },
    {
      "seconds": 656.71,
      "rssBytes": 705265664
    },
    {
      "seconds": 657.72,
      "rssBytes": 705265664
    },
    {
      "seconds": 658.73,
      "rssBytes": 705265664
    },
    {
      "seconds": 659.73,
      "rssBytes": 705265664
    },
    {
      "seconds": 660.74,
      "rssBytes": 705265664
    },
    {
      "seconds": 661.75,
      "rssBytes": 705265664
    },
    {
      "seconds": 662.77,
      "rssBytes": 702054400
    },
    {
      "seconds": 663.78,
      "rssBytes": 702742528
    },
    {
      "seconds": 664.79,
      "rssBytes": 703201280
    },
    {
      "seconds": 665.8,
      "rssBytes": 703643648
    },
    {
      "seconds": 666.8,
      "rssBytes": 703807488
    },
    {
      "seconds": 667.81,
      "rssBytes": 704184320
    },
    {
      "seconds": 668.81,
      "rssBytes": 704593920
    },
    {
      "seconds": 669.81,
      "rssBytes": 706494464
    },
    {
      "seconds": 670.82,
      "rssBytes": 711114752
    },
    {
      "seconds": 671.83,
      "rssBytes": 713424896
    },
    {
      "seconds": 672.84,
      "rssBytes": 716505088
    },
    {
      "seconds": 673.85,
      "rssBytes": 720879616
    },
    {
      "seconds": 674.85,
      "rssBytes": 724172800
    },
    {
      "seconds": 675.86,
      "rssBytes": 728547328
    },
    {
      "seconds": 676.86,
      "rssBytes": 734298112
    },
    {
      "seconds": 677.87,
      "rssBytes": 738017280
    },
    {
      "seconds": 678.87,
      "rssBytes": 738017280
    },
    {
      "seconds": 679.88,
      "rssBytes": 738017280
    },
    {
      "seconds": 680.89,
      "rssBytes": 738017280
    },
    {
      "seconds": 681.89,
      "rssBytes": 738017280
    },
    {
      "seconds": 682.9,
      "rssBytes": 738017280
    },
    {
      "seconds": 683.9,
      "rssBytes": 738017280
    },
    {
      "seconds": 684.91,
      "rssBytes": 738017280
    },
    {
      "seconds": 685.93,
      "rssBytes": 738017280
    },
    {
      "seconds": 686.93,
      "rssBytes": 738017280
    },
    {
      "seconds": 687.95,
      "rssBytes": 738017280
    },
    {
      "seconds": 688.95,
      "rssBytes": 738082816
    },
    {
      "seconds": 689.96,
      "rssBytes": 738099200
    },
    {
      "seconds": 690.96,
      "rssBytes": 738099200
    },
    {
      "seconds": 691.96,
      "rssBytes": 738099200
    },
    {
      "seconds": 692.98,
      "rssBytes": 738197504
    },
    {
      "seconds": 693.99,
      "rssBytes": 732135424
    },
    {
      "seconds": 695.0,
      "rssBytes": 736395264
    },
    {
      "seconds": 696.01,
      "rssBytes": 737804288
    },
    {
      "seconds": 697.02,
      "rssBytes": 737722368
    },
    {
      "seconds": 698.03,
      "rssBytes": 737722368
    },
    {
      "seconds": 699.05,
      "rssBytes": 738082816
    },
    {
      "seconds": 700.05,
      "rssBytes": 738148352
    },
    {
      "seconds": 701.06,
      "rssBytes": 738148352
    },
    {
      "seconds": 702.06,
      "rssBytes": 738148352
    },
    {
      "seconds": 703.08,
      "rssBytes": 738377728
    },
    {
      "seconds": 704.08,
      "rssBytes": 738377728
    },
    {
      "seconds": 705.1,
      "rssBytes": 738377728
    },
    {
      "seconds": 706.11,
      "rssBytes": 738426880
    },
    {
      "seconds": 707.12,
      "rssBytes": 738607104
    },
    {
      "seconds": 708.13,
      "rssBytes": 738607104
    },
    {
      "seconds": 709.14,
      "rssBytes": 738607104
    },
    {
      "seconds": 710.14,
      "rssBytes": 738607104
    },
    {
      "seconds": 711.15,
      "rssBytes": 738607104
    },
    {
      "seconds": 712.16,
      "rssBytes": 738607104
    },
    {
      "seconds": 713.18,
      "rssBytes": 739016704
    },
    {
      "seconds": 714.18,
      "rssBytes": 739016704
    },
    {
      "seconds": 715.19,
      "rssBytes": 739016704
    },
    {
      "seconds": 716.19,
      "rssBytes": 739016704
    },
    {
      "seconds": 717.2,
      "rssBytes": 739016704
    },
    {
      "seconds": 718.2,
      "rssBytes": 739016704
    },
    {
      "seconds": 719.22,
      "rssBytes": 739016704
    },
    {
      "seconds": 720.23,
      "rssBytes": 739016704
    },
    {
      "seconds": 721.24,
      "rssBytes": 739016704
    },
    {
      "seconds": 722.25,
      "rssBytes": 739033088
    },
    {
      "seconds": 723.26,
      "rssBytes": 739033088
    },
    {
      "seconds": 724.26,
      "rssBytes": 739033088
    },
    {
      "seconds": 725.27,
      "rssBytes": 739033088
    },
    {
      "seconds": 726.28,
      "rssBytes": 737247232
    },
    {
      "seconds": 727.29,
      "rssBytes": 736903168
    },
    {
      "seconds": 728.29,
      "rssBytes": 738033664
    },
    {
      "seconds": 729.3,
      "rssBytes": 738131968
    },
    {
      "seconds": 730.3,
      "rssBytes": 738131968
    },
    {
      "seconds": 731.32,
      "rssBytes": 738131968
    },
    {
      "seconds": 732.33,
      "rssBytes": 738164736
    },
    {
      "seconds": 733.34,
      "rssBytes": 738164736
    },
    {
      "seconds": 734.34,
      "rssBytes": 738164736
    },
    {
      "seconds": 735.35,
      "rssBytes": 738164736
    },
    {
      "seconds": 736.36,
      "rssBytes": 738164736
    },
    {
      "seconds": 737.38,
      "rssBytes": 738213888
    },
    {
      "seconds": 738.39,
      "rssBytes": 738213888
    },
    {
      "seconds": 739.4,
      "rssBytes": 738213888
    },
    {
      "seconds": 740.4,
      "rssBytes": 738295808
    },
    {
      "seconds": 741.41,
      "rssBytes": 738951168
    },
    {
      "seconds": 742.42,
      "rssBytes": 738951168
    },
    {
      "seconds": 743.43,
      "rssBytes": 738951168
    },
    {
      "seconds": 744.44,
      "rssBytes": 738951168
    },
    {
      "seconds": 745.45,
      "rssBytes": 739049472
    },
    {
      "seconds": 746.46,
      "rssBytes": 739049472
    },
    {
      "seconds": 747.47,
      "rssBytes": 739049472
    },
    {
      "seconds": 748.48,
      "rssBytes": 739049472
    },
    {
      "seconds": 749.49,
      "rssBytes": 739049472
    },
    {
      "seconds": 750.5,
      "rssBytes": 739049472
    },
    {
      "seconds": 751.51,
      "rssBytes": 739098624
    },
    {
      "seconds": 752.53,
      "rssBytes": 742653952
    },
    {
      "seconds": 753.55,
      "rssBytes": 743145472
    },
    {
      "seconds": 754.56,
      "rssBytes": 743915520
    },
    {
      "seconds": 755.57,
      "rssBytes": 743915520
    },
    {
      "seconds": 756.58,
      "rssBytes": 743931904
    },
    {
      "seconds": 757.59,
      "rssBytes": 743931904
    },
    {
      "seconds": 758.6,
      "rssBytes": 737296384
    },
    {
      "seconds": 759.62,
      "rssBytes": 737656832
    },
    {
      "seconds": 760.63,
      "rssBytes": 737656832
    },
    {
      "seconds": 761.64,
      "rssBytes": 737968128
    },
    {
      "seconds": 762.65,
      "rssBytes": 738295808
    },
    {
      "seconds": 763.66,
      "rssBytes": 738590720
    },
    {
      "seconds": 764.68,
      "rssBytes": 738689024
    },
    {
      "seconds": 765.68,
      "rssBytes": 739164160
    },
    {
      "seconds": 766.69,
      "rssBytes": 739393536
    },
    {
      "seconds": 767.7,
      "rssBytes": 739557376
    },
    {
      "seconds": 768.71,
      "rssBytes": 740737024
    },
    {
      "seconds": 769.72,
      "rssBytes": 741752832
    },
    {
      "seconds": 770.74,
      "rssBytes": 742129664
    },
    {
      "seconds": 771.75,
      "rssBytes": 742244352
    },
    {
      "seconds": 772.77,
      "rssBytes": 742244352
    },
    {
      "seconds": 773.77,
      "rssBytes": 742244352
    },
    {
      "seconds": 774.78,
      "rssBytes": 742244352
    },
    {
      "seconds": 775.79,
      "rssBytes": 742506496
    },
    {
      "seconds": 776.8,
      "rssBytes": 742506496
    },
    {
      "seconds": 777.82,
      "rssBytes": 742506496
    },
    {
      "seconds": 778.83,
      "rssBytes": 742506496
    },
    {
      "seconds": 779.83,
      "rssBytes": 743358464
    },
    {
      "seconds": 780.84,
      "rssBytes": 743358464
    },
    {
      "seconds": 781.84,
      "rssBytes": 646299648
    },
    {
      "seconds": 782.85,
      "rssBytes": 646299648
    },
    {
      "seconds": 783.86,
      "rssBytes": 646299648
    },
    {
      "seconds": 784.87,
      "rssBytes": 646299648
    },
    {
      "seconds": 785.88,
      "rssBytes": 646299648
    },
    {
      "seconds": 786.89,
      "rssBytes": 688242688
    },
    {
      "seconds": 787.9,
      "rssBytes": 688242688
    },
    {
      "seconds": 788.92,
      "rssBytes": 698761216
    },
    {
      "seconds": 789.93,
      "rssBytes": 698761216
    },
    {
      "seconds": 790.93,
      "rssBytes": 692355072
    },
    {
      "seconds": 791.95,
      "rssBytes": 693682176
    },
    {
      "seconds": 792.95,
      "rssBytes": 693682176
    },
    {
      "seconds": 793.96,
      "rssBytes": 694091776
    },
    {
      "seconds": 794.98,
      "rssBytes": 694140928
    },
    {
      "seconds": 795.99,
      "rssBytes": 694140928
    },
    {
      "seconds": 797.0,
      "rssBytes": 694140928
    },
    {
      "seconds": 798.0,
      "rssBytes": 694140928
    },
    {
      "seconds": 799.01,
      "rssBytes": 695435264
    },
    {
      "seconds": 800.02,
      "rssBytes": 695681024
    },
    {
      "seconds": 801.03,
      "rssBytes": 695697408
    },
    {
      "seconds": 802.05,
      "rssBytes": 695697408
    },
    {
      "seconds": 803.06,
      "rssBytes": 695697408
    },
    {
      "seconds": 804.07,
      "rssBytes": 695697408
    },
    {
      "seconds": 805.08,
      "rssBytes": 725942272
    },
    {
      "seconds": 806.09,
      "rssBytes": 749305856
    },
    {
      "seconds": 807.1,
      "rssBytes": 749715456
    },
    {
      "seconds": 808.11,
      "rssBytes": 750321664
    },
    {
      "seconds": 809.12,
      "rssBytes": 750485504
    },
    {
      "seconds": 810.14,
      "rssBytes": 750485504
    },
    {
      "seconds": 811.16,
      "rssBytes": 750485504
    },
    {
      "seconds": 812.17,
      "rssBytes": 625098752
    },
    {
      "seconds": 813.18,
      "rssBytes": 630669312
    },
    {
      "seconds": 814.2,
      "rssBytes": 630669312
    },
    {
      "seconds": 815.2,
      "rssBytes": 630669312
    },
    {
      "seconds": 816.21,
      "rssBytes": 630669312
    },
    {
      "seconds": 817.23,
      "rssBytes": 632127488
    },
    {
      "seconds": 818.24,
      "rssBytes": 637435904
    },
    {
      "seconds": 819.26,
      "rssBytes": 639893504
    },
    {
      "seconds": 820.27,
      "rssBytes": 646938624
    },
    {
      "seconds": 821.28,
      "rssBytes": 649445376
    },
    {
      "seconds": 822.29,
      "rssBytes": 657850368
    },
    {
      "seconds": 823.3,
      "rssBytes": 698712064
    },
    {
      "seconds": 824.31,
      "rssBytes": 700317696
    },
    {
      "seconds": 825.32,
      "rssBytes": 702119936
    },
    {
      "seconds": 826.33,
      "rssBytes": 703037440
    },
    {
      "seconds": 827.35,
      "rssBytes": 704659456
    },
    {
      "seconds": 828.36,
      "rssBytes": 710983680
    },
    {
      "seconds": 829.37,
      "rssBytes": 731512832
    },
    {
      "seconds": 830.37,
      "rssBytes": 743292928
    },
    {
      "seconds": 831.39,
      "rssBytes": 764002304
    },
    {
      "seconds": 832.4,
      "rssBytes": 764002304
    },
    {
      "seconds": 833.41,
      "rssBytes": 764346368
    },
    {
      "seconds": 834.41,
      "rssBytes": 767688704
    },
    {
      "seconds": 835.42,
      "rssBytes": 767688704
    },
    {
      "seconds": 836.43,
      "rssBytes": 767688704
    },
    {
      "seconds": 837.44,
      "rssBytes": 767688704
    },
    {
      "seconds": 838.46,
      "rssBytes": 767688704
    },
    {
      "seconds": 839.47,
      "rssBytes": 767688704
    },
    {
      "seconds": 840.48,
      "rssBytes": 767688704
    },
    {
      "seconds": 841.5,
      "rssBytes": 767688704
    },
    {
      "seconds": 842.51,
      "rssBytes": 626376704
    },
    {
      "seconds": 843.51,
      "rssBytes": 626376704
    },
    {
      "seconds": 844.53,
      "rssBytes": 626376704
    },
    {
      "seconds": 845.54,
      "rssBytes": 626376704
    },
    {
      "seconds": 846.55,
      "rssBytes": 626376704
    },
    {
      "seconds": 847.56,
      "rssBytes": 626475008
    },
    {
      "seconds": 848.57,
      "rssBytes": 626475008
    },
    {
      "seconds": 849.58,
      "rssBytes": 626475008
    },
    {
      "seconds": 850.59,
      "rssBytes": 627212288
    },
    {
      "seconds": 851.61,
      "rssBytes": 627818496
    },
    {
      "seconds": 852.62,
      "rssBytes": 563822592
    },
    {
      "seconds": 853.63,
      "rssBytes": 568016896
    },
    {
      "seconds": 854.64,
      "rssBytes": 572407808
    },
    {
      "seconds": 855.66,
      "rssBytes": 575242240
    },
    {
      "seconds": 856.67,
      "rssBytes": 580993024
    },
    {
      "seconds": 857.68,
      "rssBytes": 588201984
    },
    {
      "seconds": 858.68,
      "rssBytes": 592609280
    },
    {
      "seconds": 859.7,
      "rssBytes": 595410944
    },
    {
      "seconds": 860.71,
      "rssBytes": 600489984
    },
    {
      "seconds": 861.72,
      "rssBytes": 606126080
    },
    {
      "seconds": 862.74,
      "rssBytes": 628948992
    },
    {
      "seconds": 863.75,
      "rssBytes": 641335296
    },
    {
      "seconds": 864.76,
      "rssBytes": 649281536
    },
    {
      "seconds": 865.76,
      "rssBytes": 654721024
    },
    {
      "seconds": 866.77,
      "rssBytes": 655179776
    },
    {
      "seconds": 867.78,
      "rssBytes": 657129472
    },
    {
      "seconds": 868.79,
      "rssBytes": 657129472
    },
    {
      "seconds": 869.8,
      "rssBytes": 657129472
    },
    {
      "seconds": 870.81,
      "rssBytes": 657129472
    },
    {
      "seconds": 871.81,
      "rssBytes": 657080320
    },
    {
      "seconds": 872.82,
      "rssBytes": 660537344
    },
    {
      "seconds": 873.83,
      "rssBytes": 672038912
    },
    {
      "seconds": 874.83,
      "rssBytes": 740327424
    },
    {
      "seconds": 875.84,
      "rssBytes": 760184832
    },
    {
      "seconds": 876.85,
      "rssBytes": 770113536
    },
    {
      "seconds": 877.86,
      "rssBytes": 781172736
    },
    {
      "seconds": 878.86,
      "rssBytes": 791527424
    },
    {
      "seconds": 879.87,
      "rssBytes": 804356096
    },
    {
      "seconds": 880.89,
      "rssBytes": 813400064
    },
    {
      "seconds": 881.92,
      "rssBytes": 813400064
    },
    {
      "seconds": 882.94,
      "rssBytes": 813760512
    },
    {
      "seconds": 883.95,
      "rssBytes": 813891584
    },
    {
      "seconds": 884.95,
      "rssBytes": 813891584
    },
    {
      "seconds": 885.96,
      "rssBytes": 808615936
    },
    {
      "seconds": 886.97,
      "rssBytes": 811040768
    },
    {
      "seconds": 887.97,
      "rssBytes": 815218688
    },
    {
      "seconds": 888.98,
      "rssBytes": 819478528
    },
    {
      "seconds": 889.99,
      "rssBytes": 825769984
    },
    {
      "seconds": 890.99,
      "rssBytes": 830816256
    },
    {
      "seconds": 892.0,
      "rssBytes": 833159168
    },
    {
      "seconds": 893.0,
      "rssBytes": 837435392
    },
    {
      "seconds": 894.01,
      "rssBytes": 881999872
    },
    {
      "seconds": 895.02,
      "rssBytes": 891699200
    },
    {
      "seconds": 896.03,
      "rssBytes": 891797504
    },
    {
      "seconds": 897.03,
      "rssBytes": 892157952
    },
    {
      "seconds": 898.04,
      "rssBytes": 892207104
    },
    {
      "seconds": 899.05,
      "rssBytes": 892993536
    },
    {
      "seconds": 900.07,
      "rssBytes": 893255680
    },
    {
      "seconds": 901.08,
      "rssBytes": 893255680
    },
    {
      "seconds": 902.09,
      "rssBytes": 893255680
    },
    {
      "seconds": 903.1,
      "rssBytes": 773390336
    },
    {
      "seconds": 904.1,
      "rssBytes": 781271040
    },
    {
      "seconds": 905.11,
      "rssBytes": 781271040
    },
    {
      "seconds": 906.12,
      "rssBytes": 781271040
    },
    {
      "seconds": 907.12,
      "rssBytes": 791347200
    },
    {
      "seconds": 908.13,
      "rssBytes": 791347200
    },
    {
      "seconds": 909.13,
      "rssBytes": 791347200
    },
    {
      "seconds": 910.14,
      "rssBytes": 791347200
    },
    {
      "seconds": 911.15,
      "rssBytes": 791347200
    },
    {
      "seconds": 912.16,
      "rssBytes": 791347200
    },
    {
      "seconds": 913.16,
      "rssBytes": 695861248
    },
    {
      "seconds": 914.18,
      "rssBytes": 702988288
    },
    {
      "seconds": 915.18,
      "rssBytes": 714227712
    },
    {
      "seconds": 916.2,
      "rssBytes": 718716928
    },
    {
      "seconds": 917.21,
      "rssBytes": 724598784
    },
    {
      "seconds": 918.22,
      "rssBytes": 725008384
    },
    {
      "seconds": 919.23,
      "rssBytes": 787283968
    },
    {
      "seconds": 920.24,
      "rssBytes": 795312128
    },
    {
      "seconds": 921.24,
      "rssBytes": 800817152
    },
    {
      "seconds": 922.24,
      "rssBytes": 803946496
    },
    {
      "seconds": 923.25,
      "rssBytes": 805158912
    },
    {
      "seconds": 924.26,
      "rssBytes": 805158912
    },
    {
      "seconds": 925.26,
      "rssBytes": 805650432
    },
    {
      "seconds": 926.28,
      "rssBytes": 807239680
    },
    {
      "seconds": 927.28,
      "rssBytes": 807976960
    },
    {
      "seconds": 928.3,
      "rssBytes": 809893888
    },
    {
      "seconds": 929.31,
      "rssBytes": 810991616
    },
    {
      "seconds": 930.32,
      "rssBytes": 811302912
    },
    {
      "seconds": 931.33,
      "rssBytes": 811614208
    },
    {
      "seconds": 932.34,
      "rssBytes": 812204032
    },
    {
      "seconds": 933.35,
      "rssBytes": 812843008
    },
    {
      "seconds": 934.37,
      "rssBytes": 813514752
    },
    {
      "seconds": 935.38,
      "rssBytes": 814317568
    },
    {
      "seconds": 936.38,
      "rssBytes": 815054848
    },
    {
      "seconds": 937.39,
      "rssBytes": 857407488
    },
    {
      "seconds": 938.4,
      "rssBytes": 857407488
    },
    {
      "seconds": 939.41,
      "rssBytes": 858374144
    },
    {
      "seconds": 940.42,
      "rssBytes": 860864512
    },
    {
      "seconds": 941.42,
      "rssBytes": 864452608
    },
    {
      "seconds": 942.43,
      "rssBytes": 874561536
    },
    {
      "seconds": 943.44,
      "rssBytes": 875790336
    },
    {
      "seconds": 944.44,
      "rssBytes": 877297664
    },
    {
      "seconds": 945.46,
      "rssBytes": 878608384
    },
    {
      "seconds": 946.48,
      "rssBytes": 879329280
    },
    {
      "seconds": 947.5,
      "rssBytes": 881131520
    },
    {
      "seconds": 948.51,
      "rssBytes": 883621888
    },
    {
      "seconds": 949.54,
      "rssBytes": 749731840
    },
    {
      "seconds": 950.55,
      "rssBytes": 747208704
    },
    {
      "seconds": 951.57,
      "rssBytes": 748945408
    },
    {
      "seconds": 952.58,
      "rssBytes": 751271936
    },
    {
      "seconds": 953.59,
      "rssBytes": 751337472
    },
    {
      "seconds": 954.61,
      "rssBytes": 761856000
    },
    {
      "seconds": 955.63,
      "rssBytes": 761856000
    },
    {
      "seconds": 956.65,
      "rssBytes": 761856000
    },
    {
      "seconds": 957.66,
      "rssBytes": 761856000
    },
    {
      "seconds": 958.69,
      "rssBytes": 770785280
    },
    {
      "seconds": 959.69,
      "rssBytes": 650756096
    },
    {
      "seconds": 960.71,
      "rssBytes": 650756096
    },
    {
      "seconds": 961.72,
      "rssBytes": 650756096
    },
    {
      "seconds": 962.74,
      "rssBytes": 650674176
    },
    {
      "seconds": 963.75,
      "rssBytes": 650674176
    },
    {
      "seconds": 964.78,
      "rssBytes": 671105024
    },
    {
      "seconds": 965.78,
      "rssBytes": 696320000
    },
    {
      "seconds": 966.8,
      "rssBytes": 698368000
    },
    {
      "seconds": 967.82,
      "rssBytes": 702382080
    },
    {
      "seconds": 968.83,
      "rssBytes": 716472320
    },
    {
      "seconds": 969.84,
      "rssBytes": 718651392
    },
    {
      "seconds": 970.86,
      "rssBytes": 721698816
    },
    {
      "seconds": 971.87,
      "rssBytes": 723697664
    },
    {
      "seconds": 972.89,
      "rssBytes": 726859776
    },
    {
      "seconds": 973.91,
      "rssBytes": 730284032
    },
    {
      "seconds": 974.93,
      "rssBytes": 733904896
    },
    {
      "seconds": 975.95,
      "rssBytes": 736968704
    },
    {
      "seconds": 976.97,
      "rssBytes": 738000896
    },
    {
      "seconds": 978.0,
      "rssBytes": 738000896
    },
    {
      "seconds": 979.02,
      "rssBytes": 738000896
    },
    {
      "seconds": 980.04,
      "rssBytes": 738000896
    },
    {
      "seconds": 981.06,
      "rssBytes": 738000896
    },
    {
      "seconds": 982.07,
      "rssBytes": 728285184
    },
    {
      "seconds": 983.09,
      "rssBytes": 735232000
    },
    {
      "seconds": 984.11,
      "rssBytes": 736624640
    },
    {
      "seconds": 985.12,
      "rssBytes": 736624640
    },
    {
      "seconds": 986.14,
      "rssBytes": 736575488
    },
    {
      "seconds": 987.16,
      "rssBytes": 736428032
    },
    {
      "seconds": 988.17,
      "rssBytes": 736870400
    },
    {
      "seconds": 989.18,
      "rssBytes": 738000896
    },
    {
      "seconds": 990.2,
      "rssBytes": 751697920
    },
    {
      "seconds": 991.21,
      "rssBytes": 793231360
    },
    {
      "seconds": 992.22,
      "rssBytes": 816922624
    },
    {
      "seconds": 993.24,
      "rssBytes": 849575936
    },
    {
      "seconds": 994.26,
      "rssBytes": 901971968
    },
    {
      "seconds": 995.27,
      "rssBytes": 931446784
    },
    {
      "seconds": 996.3,
      "rssBytes": 943489024
    },
    {
      "seconds": 997.32,
      "rssBytes": 954105856
    },
    {
      "seconds": 998.34,
      "rssBytes": 958627840
    },
    {
      "seconds": 999.36,
      "rssBytes": 966705152
    },
    {
      "seconds": 1000.37,
      "rssBytes": 974716928
    },
    {
      "seconds": 1001.39,
      "rssBytes": 985841664
    },
    {
      "seconds": 1002.4,
      "rssBytes": 1002389504
    },
    {
      "seconds": 1003.41,
      "rssBytes": 1024786432
    },
    {
      "seconds": 1004.42,
      "rssBytes": 1066434560
    },
    {
      "seconds": 1005.46,
      "rssBytes": 1108606976
    },
    {
      "seconds": 1006.48,
      "rssBytes": 1136836608
    },
    {
      "seconds": 1007.5,
      "rssBytes": 1162493952
    },
    {
      "seconds": 1008.57,
      "rssBytes": 1191903232
    },
    {
      "seconds": 1009.58,
      "rssBytes": 1213710336
    },
    {
      "seconds": 1010.59,
      "rssBytes": 1229389824
    },
    {
      "seconds": 1011.61,
      "rssBytes": 1229471744
    },
    {
      "seconds": 1012.63,
      "rssBytes": 1238908928
    },
    {
      "seconds": 1013.63,
      "rssBytes": 1238908928
    },
    {
      "seconds": 1014.65,
      "rssBytes": 1231667200
    },
    {
      "seconds": 1015.66,
      "rssBytes": 1236287488
    },
    {
      "seconds": 1016.71,
      "rssBytes": 1237696512
    },
    {
      "seconds": 1017.74,
      "rssBytes": 1237827584
    },
    {
      "seconds": 1018.76,
      "rssBytes": 1237893120
    },
    {
      "seconds": 1019.79,
      "rssBytes": 1237893120
    },
    {
      "seconds": 1020.8,
      "rssBytes": 1238155264
    },
    {
      "seconds": 1021.82,
      "rssBytes": 1238253568
    },
    {
      "seconds": 1022.85,
      "rssBytes": 1247887360
    },
    {
      "seconds": 1023.88,
      "rssBytes": 1248280576
    },
    {
      "seconds": 1024.9,
      "rssBytes": 1248280576
    },
    {
      "seconds": 1025.92,
      "rssBytes": 1248280576
    },
    {
      "seconds": 1026.93,
      "rssBytes": 1248280576
    },
    {
      "seconds": 1027.95,
      "rssBytes": 1248280576
    },
    {
      "seconds": 1028.97,
      "rssBytes": 1046347776
    },
    {
      "seconds": 1029.98,
      "rssBytes": 1046396928
    },
    {
      "seconds": 1030.99,
      "rssBytes": 1046396928
    },
    {
      "seconds": 1032.0,
      "rssBytes": 1046396928
    },
    {
      "seconds": 1033.02,
      "rssBytes": 1046593536
    },
    {
      "seconds": 1034.03,
      "rssBytes": 1046593536
    },
    {
      "seconds": 1035.04,
      "rssBytes": 1046495232
    },
    {
      "seconds": 1036.05,
      "rssBytes": 1046495232
    },
    {
      "seconds": 1037.06,
      "rssBytes": 1046495232
    },
    {
      "seconds": 1038.08,
      "rssBytes": 1046495232
    },
    {
      "seconds": 1039.09,
      "rssBytes": 793214976
    },
    {
      "seconds": 1040.1,
      "rssBytes": 793214976
    },
    {
      "seconds": 1041.12,
      "rssBytes": 793214976
    },
    {
      "seconds": 1042.13,
      "rssBytes": 793214976
    },
    {
      "seconds": 1043.14,
      "rssBytes": 793214976
    },
    {
      "seconds": 1044.16,
      "rssBytes": 793214976
    },
    {
      "seconds": 1045.17,
      "rssBytes": 793214976
    },
    {
      "seconds": 1046.18,
      "rssBytes": 786219008
    },
    {
      "seconds": 1047.19,
      "rssBytes": 791134208
    },
    {
      "seconds": 1048.2,
      "rssBytes": 792215552
    },
    {
      "seconds": 1049.22,
      "rssBytes": 579043328
    },
    {
      "seconds": 1050.23,
      "rssBytes": 579125248
    },
    {
      "seconds": 1051.25,
      "rssBytes": 621854720
    },
    {
      "seconds": 1052.26,
      "rssBytes": 624328704
    },
    {
      "seconds": 1053.28,
      "rssBytes": 628015104
    },
    {
      "seconds": 1054.28,
      "rssBytes": 628015104
    },
    {
      "seconds": 1055.29,
      "rssBytes": 628047872
    },
    {
      "seconds": 1056.3,
      "rssBytes": 670040064
    },
    {
      "seconds": 1057.31,
      "rssBytes": 680525824
    },
    {
      "seconds": 1058.31,
      "rssBytes": 680984576
    },
    {
      "seconds": 1059.32,
      "rssBytes": 680984576
    },
    {
      "seconds": 1060.35,
      "rssBytes": 680984576
    },
    {
      "seconds": 1061.35,
      "rssBytes": 680984576
    },
    {
      "seconds": 1062.37,
      "rssBytes": 680984576
    },
    {
      "seconds": 1063.37,
      "rssBytes": 680984576
    },
    {
      "seconds": 1064.39,
      "rssBytes": 680984576
    },
    {
      "seconds": 1065.4,
      "rssBytes": 680984576
    },
    {
      "seconds": 1066.41,
      "rssBytes": 680984576
    },
    {
      "seconds": 1067.42,
      "rssBytes": 680984576
    },
    {
      "seconds": 1068.42,
      "rssBytes": 680984576
    },
    {
      "seconds": 1069.44,
      "rssBytes": 680935424
    },
    {
      "seconds": 1070.45,
      "rssBytes": 695992320
    },
    {
      "seconds": 1071.46,
      "rssBytes": 723271680
    },
    {
      "seconds": 1072.47,
      "rssBytes": 727973888
    },
    {
      "seconds": 1073.48,
      "rssBytes": 735936512
    },
    {
      "seconds": 1074.48,
      "rssBytes": 774897664
    },
    {
      "seconds": 1075.49,
      "rssBytes": 774897664
    },
    {
      "seconds": 1076.5,
      "rssBytes": 774897664
    },
    {
      "seconds": 1077.51,
      "rssBytes": 774897664
    },
    {
      "seconds": 1078.53,
      "rssBytes": 766246912
    },
    {
      "seconds": 1079.54,
      "rssBytes": 769818624
    },
    {
      "seconds": 1080.55,
      "rssBytes": 771686400
    },
    {
      "seconds": 1081.56,
      "rssBytes": 773668864
    },
    {
      "seconds": 1082.56,
      "rssBytes": 774144000
    },
    {
      "seconds": 1083.58,
      "rssBytes": 774160384
    },
    {
      "seconds": 1084.58,
      "rssBytes": 816103424
    },
    {
      "seconds": 1085.6,
      "rssBytes": 826589184
    },
    {
      "seconds": 1086.6,
      "rssBytes": 826589184
    },
    {
      "seconds": 1087.61,
      "rssBytes": 826589184
    },
    {
      "seconds": 1088.63,
      "rssBytes": 826589184
    },
    {
      "seconds": 1089.64,
      "rssBytes": 700022784
    },
    {
      "seconds": 1090.65,
      "rssBytes": 743948288
    },
    {
      "seconds": 1091.67,
      "rssBytes": 748388352
    },
    {
      "seconds": 1092.67,
      "rssBytes": 763805696
    },
    {
      "seconds": 1093.69,
      "rssBytes": 766427136
    },
    {
      "seconds": 1094.69,
      "rssBytes": 767574016
    },
    {
      "seconds": 1095.7,
      "rssBytes": 770703360
    },
    {
      "seconds": 1096.71,
      "rssBytes": 776355840
    },
    {
      "seconds": 1097.72,
      "rssBytes": 778141696
    },
    {
      "seconds": 1098.73,
      "rssBytes": 781582336
    },
    {
      "seconds": 1099.74,
      "rssBytes": 785072128
    },
    {
      "seconds": 1100.75,
      "rssBytes": 786448384
    },
    {
      "seconds": 1101.76,
      "rssBytes": 789594112
    },
    {
      "seconds": 1102.77,
      "rssBytes": 789594112
    },
    {
      "seconds": 1103.78,
      "rssBytes": 789594112
    },
    {
      "seconds": 1104.78,
      "rssBytes": 789594112
    },
    {
      "seconds": 1105.79,
      "rssBytes": 789594112
    },
    {
      "seconds": 1106.81,
      "rssBytes": 789594112
    },
    {
      "seconds": 1107.82,
      "rssBytes": 789594112
    },
    {
      "seconds": 1108.82,
      "rssBytes": 789594112
    },
    {
      "seconds": 1109.83,
      "rssBytes": 789594112
    },
    {
      "seconds": 1110.84,
      "rssBytes": 781697024
    },
    {
      "seconds": 1111.85,
      "rssBytes": 784564224
    },
    {
      "seconds": 1112.87,
      "rssBytes": 784957440
    },
    {
      "seconds": 1113.88,
      "rssBytes": 787103744
    },
    {
      "seconds": 1114.89,
      "rssBytes": 787316736
    },
    {
      "seconds": 1115.9,
      "rssBytes": 787644416
    },
    {
      "seconds": 1116.91,
      "rssBytes": 788905984
    },
    {
      "seconds": 1117.93,
      "rssBytes": 788905984
    },
    {
      "seconds": 1118.93,
      "rssBytes": 788905984
    },
    {
      "seconds": 1119.95,
      "rssBytes": 624230400
    },
    {
      "seconds": 1120.96,
      "rssBytes": 624230400
    },
    {
      "seconds": 1121.97,
      "rssBytes": 624230400
    },
    {
      "seconds": 1122.98,
      "rssBytes": 624263168
    },
    {
      "seconds": 1123.99,
      "rssBytes": 624312320
    },
    {
      "seconds": 1125.0,
      "rssBytes": 624312320
    },
    {
      "seconds": 1126.01,
      "rssBytes": 624312320
    },
    {
      "seconds": 1127.02,
      "rssBytes": 624492544
    },
    {
      "seconds": 1128.05,
      "rssBytes": 624492544
    },
    {
      "seconds": 1129.06,
      "rssBytes": 677019648
    },
    {
      "seconds": 1130.07,
      "rssBytes": 677019648
    },
    {
      "seconds": 1131.07,
      "rssBytes": 677019648
    },
    {
      "seconds": 1132.08,
      "rssBytes": 719126528
    },
    {
      "seconds": 1133.09,
      "rssBytes": 722206720
    },
    {
      "seconds": 1134.11,
      "rssBytes": 724877312
    },
    {
      "seconds": 1135.11,
      "rssBytes": 740442112
    },
    {
      "seconds": 1136.12,
      "rssBytes": 742408192
    },
    {
      "seconds": 1137.13,
      "rssBytes": 746029056
    },
    {
      "seconds": 1138.14,
      "rssBytes": 749715456
    },
    {
      "seconds": 1139.14,
      "rssBytes": 753434624
    },
    {
      "seconds": 1140.15,
      "rssBytes": 757055488
    },
    {
      "seconds": 1141.16,
      "rssBytes": 760479744
    },
    {
      "seconds": 1142.17,
      "rssBytes": 764067840
    },
    {
      "seconds": 1143.18,
      "rssBytes": 759693312
    },
    {
      "seconds": 1144.19,
      "rssBytes": 762970112
    },
    {
      "seconds": 1145.2,
      "rssBytes": 762970112
    },
    {
      "seconds": 1146.21,
      "rssBytes": 763707392
    },
    {
      "seconds": 1147.22,
      "rssBytes": 763920384
    },
    {
      "seconds": 1148.23,
      "rssBytes": 764035072
    },
    {
      "seconds": 1149.24,
      "rssBytes": 764215296
    },
    {
      "seconds": 1150.26,
      "rssBytes": 764215296
    },
    {
      "seconds": 1151.26,
      "rssBytes": 764248064
    },
    {
      "seconds": 1152.28,
      "rssBytes": 764248064
    },
    {
      "seconds": 1153.28,
      "rssBytes": 764280832
    },
    {
      "seconds": 1154.29,
      "rssBytes": 767295488
    },
    {
      "seconds": 1155.3,
      "rssBytes": 767295488
    },
    {
      "seconds": 1156.31,
      "rssBytes": 767295488
    },
    {
      "seconds": 1157.32,
      "rssBytes": 767295488
    },
    {
      "seconds": 1158.33,
      "rssBytes": 767295488
    },
    {
      "seconds": 1159.34,
      "rssBytes": 767295488
    },
    {
      "seconds": 1160.35,
      "rssBytes": 767295488
    },
    {
      "seconds": 1161.36,
      "rssBytes": 767295488
    },
    {
      "seconds": 1162.37,
      "rssBytes": 767295488
    },
    {
      "seconds": 1163.38,
      "rssBytes": 770342912
    },
    {
      "seconds": 1164.38,
      "rssBytes": 770342912
    },
    {
      "seconds": 1165.4,
      "rssBytes": 770342912
    },
    {
      "seconds": 1166.4,
      "rssBytes": 770342912
    },
    {
      "seconds": 1167.41,
      "rssBytes": 770359296
    },
    {
      "seconds": 1168.42,
      "rssBytes": 770490368
    },
    {
      "seconds": 1169.43,
      "rssBytes": 770785280
    },
    {
      "seconds": 1170.44,
      "rssBytes": 770785280
    },
    {
      "seconds": 1171.45,
      "rssBytes": 770785280
    },
    {
      "seconds": 1172.47,
      "rssBytes": 770785280
    },
    {
      "seconds": 1173.47,
      "rssBytes": 770736128
    },
    {
      "seconds": 1174.49,
      "rssBytes": 761397248
    },
    {
      "seconds": 1175.5,
      "rssBytes": 768622592
    },
    {
      "seconds": 1176.5,
      "rssBytes": 768851968
    },
    {
      "seconds": 1177.51,
      "rssBytes": 768933888
    },
    {
      "seconds": 1178.52,
      "rssBytes": 769753088
    },
    {
      "seconds": 1179.53,
      "rssBytes": 769753088
    },
    {
      "seconds": 1180.54,
      "rssBytes": 769753088
    },
    {
      "seconds": 1181.56,
      "rssBytes": 769753088
    },
    {
      "seconds": 1182.56,
      "rssBytes": 769753088
    },
    {
      "seconds": 1183.57,
      "rssBytes": 769753088
    },
    {
      "seconds": 1184.59,
      "rssBytes": 769753088
    },
    {
      "seconds": 1185.6,
      "rssBytes": 769753088
    },
    {
      "seconds": 1186.61,
      "rssBytes": 769785856
    },
    {
      "seconds": 1187.62,
      "rssBytes": 770129920
    },
    {
      "seconds": 1188.63,
      "rssBytes": 770539520
    },
    {
      "seconds": 1189.65,
      "rssBytes": 770539520
    },
    {
      "seconds": 1190.66,
      "rssBytes": 770539520
    },
    {
      "seconds": 1191.67,
      "rssBytes": 770539520
    },
    {
      "seconds": 1192.68,
      "rssBytes": 773455872
    },
    {
      "seconds": 1193.69,
      "rssBytes": 779534336
    },
    {
      "seconds": 1194.74,
      "rssBytes": 786677760
    },
    {
      "seconds": 1195.75,
      "rssBytes": 786726912
    },
    {
      "seconds": 1196.76,
      "rssBytes": 786726912
    },
    {
      "seconds": 1197.78,
      "rssBytes": 790020096
    },
    {
      "seconds": 1198.79,
      "rssBytes": 790036480
    },
    {
      "seconds": 1199.81,
      "rssBytes": 799670272
    },
    {
      "seconds": 1200.82,
      "rssBytes": 802455552
    },
    {
      "seconds": 1201.83,
      "rssBytes": 806076416
    },
    {
      "seconds": 1202.83,
      "rssBytes": 832733184
    },
    {
      "seconds": 1203.85,
      "rssBytes": 832733184
    },
    {
      "seconds": 1204.86,
      "rssBytes": 832733184
    },
    {
      "seconds": 1205.88,
      "rssBytes": 833355776
    },
    {
      "seconds": 1206.88,
      "rssBytes": 826294272
    },
    {
      "seconds": 1207.9,
      "rssBytes": 830128128
    },
    {
      "seconds": 1208.91,
      "rssBytes": 832782336
    },
    {
      "seconds": 1209.92,
      "rssBytes": 837844992
    },
    {
      "seconds": 1210.94,
      "rssBytes": 843563008
    },
    {
      "seconds": 1211.95,
      "rssBytes": 849887232
    },
    {
      "seconds": 1212.95,
      "rssBytes": 855916544
    },
    {
      "seconds": 1213.97,
      "rssBytes": 861765632
    },
    {
      "seconds": 1214.99,
      "rssBytes": 864387072
    },
    {
      "seconds": 1216.0,
      "rssBytes": 864387072
    },
    {
      "seconds": 1217.02,
      "rssBytes": 883261440
    },
    {
      "seconds": 1218.03,
      "rssBytes": 883261440
    },
    {
      "seconds": 1219.04,
      "rssBytes": 883261440
    },
    {
      "seconds": 1220.04,
      "rssBytes": 883277824
    },
    {
      "seconds": 1221.05,
      "rssBytes": 883277824
    },
    {
      "seconds": 1222.07,
      "rssBytes": 883277824
    },
    {
      "seconds": 1223.07,
      "rssBytes": 883277824
    },
    {
      "seconds": 1224.09,
      "rssBytes": 883277824
    },
    {
      "seconds": 1225.1,
      "rssBytes": 883277824
    },
    {
      "seconds": 1226.11,
      "rssBytes": 883277824
    },
    {
      "seconds": 1227.12,
      "rssBytes": 883294208
    },
    {
      "seconds": 1228.14,
      "rssBytes": 883294208
    },
    {
      "seconds": 1229.14,
      "rssBytes": 883294208
    },
    {
      "seconds": 1230.16,
      "rssBytes": 883458048
    },
    {
      "seconds": 1231.17,
      "rssBytes": 883458048
    },
    {
      "seconds": 1232.19,
      "rssBytes": 883458048
    },
    {
      "seconds": 1233.2,
      "rssBytes": 883458048
    },
    {
      "seconds": 1234.22,
      "rssBytes": 883359744
    },
    {
      "seconds": 1235.23,
      "rssBytes": 888029184
    },
    {
      "seconds": 1236.24,
      "rssBytes": 887980032
    },
    {
      "seconds": 1237.26,
      "rssBytes": 888061952
    },
    {
      "seconds": 1238.27,
      "rssBytes": 888061952
    },
    {
      "seconds": 1239.28,
      "rssBytes": 879640576
    },
    {
      "seconds": 1240.28,
      "rssBytes": 880803840
    },
    {
      "seconds": 1241.29,
      "rssBytes": 882114560
    },
    {
      "seconds": 1242.31,
      "rssBytes": 882245632
    },
    {
      "seconds": 1243.31,
      "rssBytes": 882638848
    },
    {
      "seconds": 1244.32,
      "rssBytes": 884637696
    },
    {
      "seconds": 1245.34,
      "rssBytes": 885145600
    },
    {
      "seconds": 1246.35,
      "rssBytes": 885194752
    },
    {
      "seconds": 1247.37,
      "rssBytes": 885981184
    },
    {
      "seconds": 1248.38,
      "rssBytes": 887537664
    },
    {
      "seconds": 1249.39,
      "rssBytes": 887996416
    },
    {
      "seconds": 1250.4,
      "rssBytes": 887996416
    },
    {
      "seconds": 1251.41,
      "rssBytes": 887996416
    },
    {
      "seconds": 1252.43,
      "rssBytes": 887898112
    },
    {
      "seconds": 1253.43,
      "rssBytes": 887898112
    },
    {
      "seconds": 1254.45,
      "rssBytes": 888307712
    },
    {
      "seconds": 1255.46,
      "rssBytes": 888307712
    },
    {
      "seconds": 1256.47,
      "rssBytes": 888520704
    },
    {
      "seconds": 1257.48,
      "rssBytes": 889356288
    },
    {
      "seconds": 1258.49,
      "rssBytes": 889438208
    },
    {
      "seconds": 1259.51,
      "rssBytes": 890945536
    },
    {
      "seconds": 1260.53,
      "rssBytes": 890945536
    },
    {
      "seconds": 1261.54,
      "rssBytes": 890945536
    },
    {
      "seconds": 1262.55,
      "rssBytes": 890978304
    },
    {
      "seconds": 1263.56,
      "rssBytes": 890978304
    },
    {
      "seconds": 1264.58,
      "rssBytes": 890978304
    },
    {
      "seconds": 1265.59,
      "rssBytes": 890978304
    },
    {
      "seconds": 1266.6,
      "rssBytes": 890978304
    },
    {
      "seconds": 1267.61,
      "rssBytes": 890978304
    },
    {
      "seconds": 1268.62,
      "rssBytes": 890978304
    },
    {
      "seconds": 1269.64,
      "rssBytes": 890929152
    },
    {
      "seconds": 1270.65,
      "rssBytes": 880951296
    },
    {
      "seconds": 1271.66,
      "rssBytes": 882737152
    },
    {
      "seconds": 1272.67,
      "rssBytes": 887816192
    },
    {
      "seconds": 1273.68,
      "rssBytes": 889716736
    },
    {
      "seconds": 1274.69,
      "rssBytes": 890716160
    },
    {
      "seconds": 1275.7,
      "rssBytes": 891076608
    },
    {
      "seconds": 1276.72,
      "rssBytes": 891174912
    },
    {
      "seconds": 1277.73,
      "rssBytes": 891748352
    },
    {
      "seconds": 1278.75,
      "rssBytes": 891748352
    },
    {
      "seconds": 1279.76,
      "rssBytes": 891650048
    },
    {
      "seconds": 1280.77,
      "rssBytes": 891650048
    },
    {
      "seconds": 1281.78,
      "rssBytes": 891863040
    },
    {
      "seconds": 1282.79,
      "rssBytes": 891961344
    },
    {
      "seconds": 1283.8,
      "rssBytes": 891961344
    },
    {
      "seconds": 1284.82,
      "rssBytes": 891961344
    },
    {
      "seconds": 1285.83,
      "rssBytes": 891961344
    },
    {
      "seconds": 1286.84,
      "rssBytes": 891961344
    },
    {
      "seconds": 1287.85,
      "rssBytes": 891863040
    },
    {
      "seconds": 1288.86,
      "rssBytes": 891863040
    },
    {
      "seconds": 1289.88,
      "rssBytes": 891863040
    },
    {
      "seconds": 1290.89,
      "rssBytes": 891863040
    },
    {
      "seconds": 1291.9,
      "rssBytes": 891863040
    },
    {
      "seconds": 1292.91,
      "rssBytes": 891912192
    },
    {
      "seconds": 1293.92,
      "rssBytes": 891912192
    },
    {
      "seconds": 1294.93,
      "rssBytes": 891912192
    },
    {
      "seconds": 1295.94,
      "rssBytes": 891912192
    },
    {
      "seconds": 1296.95,
      "rssBytes": 891912192
    },
    {
      "seconds": 1297.96,
      "rssBytes": 891912192
    },
    {
      "seconds": 1298.97,
      "rssBytes": 891928576
    },
    {
      "seconds": 1299.98,
      "rssBytes": 891928576
    },
    {
      "seconds": 1300.99,
      "rssBytes": 891928576
    },
    {
      "seconds": 1302.0,
      "rssBytes": 891928576
    },
    {
      "seconds": 1303.01,
      "rssBytes": 885080064
    },
    {
      "seconds": 1304.02,
      "rssBytes": 885719040
    },
    {
      "seconds": 1305.03,
      "rssBytes": 887226368
    },
    {
      "seconds": 1306.04,
      "rssBytes": 887947264
    },
    {
      "seconds": 1307.05,
      "rssBytes": 888094720
    },
    {
      "seconds": 1308.06,
      "rssBytes": 890257408
    },
    {
      "seconds": 1309.08,
      "rssBytes": 890257408
    },
    {
      "seconds": 1310.09,
      "rssBytes": 892469248
    },
    {
      "seconds": 1311.1,
      "rssBytes": 892534784
    },
    {
      "seconds": 1312.11,
      "rssBytes": 892911616
    },
    {
      "seconds": 1313.12,
      "rssBytes": 892911616
    },
    {
      "seconds": 1314.13,
      "rssBytes": 892911616
    },
    {
      "seconds": 1315.14,
      "rssBytes": 893009920
    },
    {
      "seconds": 1316.14,
      "rssBytes": 893009920
    },
    {
      "seconds": 1317.15,
      "rssBytes": 893009920
    },
    {
      "seconds": 1318.16,
      "rssBytes": 893009920
    },
    {
      "seconds": 1319.17,
      "rssBytes": 893059072
    },
    {
      "seconds": 1320.18,
      "rssBytes": 893059072
    },
    {
      "seconds": 1321.19,
      "rssBytes": 893059072
    },
    {
      "seconds": 1322.19,
      "rssBytes": 893059072
    },
    {
      "seconds": 1323.21,
      "rssBytes": 893059072
    },
    {
      "seconds": 1324.22,
      "rssBytes": 893009920
    },
    {
      "seconds": 1325.23,
      "rssBytes": 893009920
    },
    {
      "seconds": 1326.24,
      "rssBytes": 893075456
    },
    {
      "seconds": 1327.25,
      "rssBytes": 893075456
    },
    {
      "seconds": 1328.26,
      "rssBytes": 893353984
    },
    {
      "seconds": 1329.28,
      "rssBytes": 893632512
    },
    {
      "seconds": 1330.29,
      "rssBytes": 893927424
    },
    {
      "seconds": 1331.3,
      "rssBytes": 893878272
    },
    {
      "seconds": 1332.31,
      "rssBytes": 894173184
    },
    {
      "seconds": 1333.33,
      "rssBytes": 894205952
    },
    {
      "seconds": 1334.34,
      "rssBytes": 894959616
    },
    {
      "seconds": 1335.35,
      "rssBytes": 890437632
    },
    {
      "seconds": 1336.37,
      "rssBytes": 891568128
    },
    {
      "seconds": 1337.38,
      "rssBytes": 893026304
    },
    {
      "seconds": 1338.39,
      "rssBytes": 893026304
    },
    {
      "seconds": 1339.4,
      "rssBytes": 893026304
    },
    {
      "seconds": 1340.41,
      "rssBytes": 893042688
    },
    {
      "seconds": 1341.42,
      "rssBytes": 893042688
    },
    {
      "seconds": 1342.42,
      "rssBytes": 893042688
    },
    {
      "seconds": 1343.44,
      "rssBytes": 893042688
    },
    {
      "seconds": 1344.45,
      "rssBytes": 893042688
    },
    {
      "seconds": 1345.46,
      "rssBytes": 893222912
    },
    {
      "seconds": 1346.47,
      "rssBytes": 895385600
    },
    {
      "seconds": 1347.48,
      "rssBytes": 897859584
    },
    {
      "seconds": 1348.5,
      "rssBytes": 899760128
    },
    {
      "seconds": 1349.5,
      "rssBytes": 904085504
    },
    {
      "seconds": 1350.52,
      "rssBytes": 907296768
    },
    {
      "seconds": 1351.52,
      "rssBytes": 912572416
    },
    {
      "seconds": 1352.54,
      "rssBytes": 916815872
    },
    {
      "seconds": 1353.54,
      "rssBytes": 923926528
    },
    {
      "seconds": 1354.55,
      "rssBytes": 929316864
    },
    {
      "seconds": 1355.56,
      "rssBytes": 929316864
    },
    {
      "seconds": 1356.58,
      "rssBytes": 929513472
    },
    {
      "seconds": 1357.59,
      "rssBytes": 930004992
    },
    {
      "seconds": 1358.6,
      "rssBytes": 930004992
    },
    {
      "seconds": 1359.61,
      "rssBytes": 930004992
    },
    {
      "seconds": 1360.61,
      "rssBytes": 930004992
    },
    {
      "seconds": 1361.62,
      "rssBytes": 930004992
    },
    {
      "seconds": 1362.63,
      "rssBytes": 930004992
    },
    {
      "seconds": 1363.64,
      "rssBytes": 930054144
    },
    {
      "seconds": 1364.65,
      "rssBytes": 930054144
    },
    {
      "seconds": 1365.67,
      "rssBytes": 930054144
    },
    {
      "seconds": 1366.68,
      "rssBytes": 926810112
    },
    {
      "seconds": 1367.7,
      "rssBytes": 928251904
    },
    {
      "seconds": 1368.71,
      "rssBytes": 928645120
    },
    {
      "seconds": 1369.72,
      "rssBytes": 929038336
    },
    {
      "seconds": 1370.72,
      "rssBytes": 929579008
    },
    {
      "seconds": 1371.73,
      "rssBytes": 929775616
    },
    {
      "seconds": 1372.74,
      "rssBytes": 929726464
    },
    {
      "seconds": 1373.76,
      "rssBytes": 929726464
    },
    {
      "seconds": 1374.77,
      "rssBytes": 929726464
    },
    {
      "seconds": 1375.78,
      "rssBytes": 929824768
    },
    {
      "seconds": 1376.79,
      "rssBytes": 929824768
    },
    {
      "seconds": 1377.8,
      "rssBytes": 929824768
    },
    {
      "seconds": 1378.82,
      "rssBytes": 929824768
    },
    {
      "seconds": 1379.83,
      "rssBytes": 929824768
    },
    {
      "seconds": 1380.84,
      "rssBytes": 929824768
    },
    {
      "seconds": 1381.85,
      "rssBytes": 929824768
    },
    {
      "seconds": 1382.87,
      "rssBytes": 929824768
    },
    {
      "seconds": 1383.88,
      "rssBytes": 929824768
    },
    {
      "seconds": 1384.89,
      "rssBytes": 929824768
    },
    {
      "seconds": 1385.91,
      "rssBytes": 929824768
    },
    {
      "seconds": 1386.92,
      "rssBytes": 929824768
    },
    {
      "seconds": 1387.93,
      "rssBytes": 929824768
    },
    {
      "seconds": 1388.93,
      "rssBytes": 929824768
    },
    {
      "seconds": 1389.94,
      "rssBytes": 929824768
    },
    {
      "seconds": 1390.95,
      "rssBytes": 929873920
    },
    {
      "seconds": 1391.95,
      "rssBytes": 929873920
    },
    {
      "seconds": 1392.96,
      "rssBytes": 929873920
    },
    {
      "seconds": 1393.97,
      "rssBytes": 929873920
    },
    {
      "seconds": 1394.99,
      "rssBytes": 638074880
    },
    {
      "seconds": 1396.0,
      "rssBytes": 519749632
    },
    {
      "seconds": 1397.0,
      "rssBytes": 535117824
    },
    {
      "seconds": 1398.01,
      "rssBytes": 560545792
    },
    {
      "seconds": 1399.02,
      "rssBytes": 603193344
    },
    {
      "seconds": 1400.03,
      "rssBytes": 611450880
    },
    {
      "seconds": 1401.04,
      "rssBytes": 617840640
    },
    {
      "seconds": 1402.06,
      "rssBytes": 621232128
    },
    {
      "seconds": 1403.08,
      "rssBytes": 631734272
    },
    {
      "seconds": 1404.09,
      "rssBytes": 635371520
    },
    {
      "seconds": 1405.1,
      "rssBytes": 643153920
    },
    {
      "seconds": 1406.11,
      "rssBytes": 648069120
    },
    {
      "seconds": 1407.12,
      "rssBytes": 665223168
    },
    {
      "seconds": 1408.13,
      "rssBytes": 671694848
    },
    {
      "seconds": 1409.14,
      "rssBytes": 673431552
    },
    {
      "seconds": 1410.15,
      "rssBytes": 678510592
    },
    {
      "seconds": 1411.16,
      "rssBytes": 679788544
    },
    {
      "seconds": 1412.17,
      "rssBytes": 686866432
    },
    {
      "seconds": 1413.18,
      "rssBytes": 691961856
    },
    {
      "seconds": 1414.18,
      "rssBytes": 713850880
    },
    {
      "seconds": 1415.19,
      "rssBytes": 713850880
    },
    {
      "seconds": 1416.2,
      "rssBytes": 713867264
    },
    {
      "seconds": 1417.21,
      "rssBytes": 713998336
    },
    {
      "seconds": 1418.22,
      "rssBytes": 714915840
    },
    {
      "seconds": 1419.23,
      "rssBytes": 714997760
    },
    {
      "seconds": 1420.24,
      "rssBytes": 714997760
    },
    {
      "seconds": 1421.25,
      "rssBytes": 714997760
    },
    {
      "seconds": 1422.26,
      "rssBytes": 714997760
    },
    {
      "seconds": 1423.27,
      "rssBytes": 714997760
    },
    {
      "seconds": 1424.29,
      "rssBytes": 714997760
    },
    {
      "seconds": 1425.3,
      "rssBytes": 714997760
    },
    {
      "seconds": 1426.31,
      "rssBytes": 714997760
    },
    {
      "seconds": 1427.32,
      "rssBytes": 714997760
    },
    {
      "seconds": 1428.33,
      "rssBytes": 714997760
    },
    {
      "seconds": 1429.34,
      "rssBytes": 715128832
    },
    {
      "seconds": 1430.34,
      "rssBytes": 715128832
    },
    {
      "seconds": 1431.36,
      "rssBytes": 709656576
    },
    {
      "seconds": 1432.36,
      "rssBytes": 710066176
    },
    {
      "seconds": 1433.37,
      "rssBytes": 710475776
    },
    {
      "seconds": 1434.38,
      "rssBytes": 710475776
    },
    {
      "seconds": 1435.39,
      "rssBytes": 710623232
    },
    {
      "seconds": 1436.4,
      "rssBytes": 712245248
    },
    {
      "seconds": 1437.41,
      "rssBytes": 712245248
    },
    {
      "seconds": 1438.41,
      "rssBytes": 712687616
    },
    {
      "seconds": 1439.42,
      "rssBytes": 712769536
    },
    {
      "seconds": 1440.43,
      "rssBytes": 712769536
    },
    {
      "seconds": 1441.45,
      "rssBytes": 713310208
    },
    {
      "seconds": 1442.45,
      "rssBytes": 713359360
    },
    {
      "seconds": 1443.47,
      "rssBytes": 713359360
    },
    {
      "seconds": 1444.47,
      "rssBytes": 713359360
    },
    {
      "seconds": 1445.48,
      "rssBytes": 713359360
    },
    {
      "seconds": 1446.48,
      "rssBytes": 713359360
    },
    {
      "seconds": 1447.49,
      "rssBytes": 713261056
    },
    {
      "seconds": 1448.5,
      "rssBytes": 713261056
    },
    {
      "seconds": 1449.51,
      "rssBytes": 713261056
    },
    {
      "seconds": 1450.52,
      "rssBytes": 713261056
    },
    {
      "seconds": 1451.53,
      "rssBytes": 713261056
    },
    {
      "seconds": 1452.54,
      "rssBytes": 713261056
    },
    {
      "seconds": 1453.55,
      "rssBytes": 713261056
    },
    {
      "seconds": 1454.56,
      "rssBytes": 713261056
    },
    {
      "seconds": 1455.57,
      "rssBytes": 713261056
    },
    {
      "seconds": 1456.58,
      "rssBytes": 713261056
    },
    {
      "seconds": 1457.59,
      "rssBytes": 713211904
    },
    {
      "seconds": 1458.6,
      "rssBytes": 713211904
    },
    {
      "seconds": 1459.61,
      "rssBytes": 713211904
    },
    {
      "seconds": 1460.62,
      "rssBytes": 713211904
    },
    {
      "seconds": 1461.64,
      "rssBytes": 713211904
    },
    {
      "seconds": 1462.64,
      "rssBytes": 713211904
    },
    {
      "seconds": 1463.66,
      "rssBytes": 709607424
    },
    {
      "seconds": 1464.67,
      "rssBytes": 713113600
    },
    {
      "seconds": 1465.67,
      "rssBytes": 713211904
    },
    {
      "seconds": 1466.69,
      "rssBytes": 713211904
    },
    {
      "seconds": 1467.7,
      "rssBytes": 713850880
    },
    {
      "seconds": 1468.72,
      "rssBytes": 714178560
    },
    {
      "seconds": 1469.73,
      "rssBytes": 714178560
    },
    {
      "seconds": 1470.75,
      "rssBytes": 714178560
    },
    {
      "seconds": 1471.76,
      "rssBytes": 714211328
    },
    {
      "seconds": 1472.77,
      "rssBytes": 714211328
    },
    {
      "seconds": 1473.78,
      "rssBytes": 714457088
    },
    {
      "seconds": 1474.78,
      "rssBytes": 714506240
    },
    {
      "seconds": 1475.8,
      "rssBytes": 714555392
    },
    {
      "seconds": 1476.8,
      "rssBytes": 714555392
    },
    {
      "seconds": 1477.81,
      "rssBytes": 767033344
    },
    {
      "seconds": 1478.82,
      "rssBytes": 768000000
    },
    {
      "seconds": 1479.83,
      "rssBytes": 768311296
    },
    {
      "seconds": 1480.84,
      "rssBytes": 768638976
    },
    {
      "seconds": 1481.84,
      "rssBytes": 768638976
    },
    {
      "seconds": 1482.86,
      "rssBytes": 768638976
    },
    {
      "seconds": 1483.87,
      "rssBytes": 769425408
    },
    {
      "seconds": 1484.88,
      "rssBytes": 780926976
    },
    {
      "seconds": 1485.88,
      "rssBytes": 781008896
    },
    {
      "seconds": 1486.89,
      "rssBytes": 781025280
    },
    {
      "seconds": 1487.9,
      "rssBytes": 781025280
    },
    {
      "seconds": 1488.92,
      "rssBytes": 785481728
    },
    {
      "seconds": 1489.92,
      "rssBytes": 789348352
    },
    {
      "seconds": 1490.94,
      "rssBytes": 794492928
    },
    {
      "seconds": 1491.95,
      "rssBytes": 798867456
    },
    {
      "seconds": 1492.95,
      "rssBytes": 802553856
    },
    {
      "seconds": 1493.97,
      "rssBytes": 801488896
    },
    {
      "seconds": 1494.98,
      "rssBytes": 807354368
    },
    {
      "seconds": 1495.99,
      "rssBytes": 809697280
    },
    {
      "seconds": 1497.0,
      "rssBytes": 812613632
    },
    {
      "seconds": 1498.01,
      "rssBytes": 813121536
    },
    {
      "seconds": 1499.02,
      "rssBytes": 813121536
    },
    {
      "seconds": 1500.03,
      "rssBytes": 813137920
    },
    {
      "seconds": 1501.04,
      "rssBytes": 813187072
    },
    {
      "seconds": 1502.05,
      "rssBytes": 813088768
    },
    {
      "seconds": 1503.06,
      "rssBytes": 813121536
    },
    {
      "seconds": 1504.07,
      "rssBytes": 813121536
    },
    {
      "seconds": 1505.08,
      "rssBytes": 813137920
    },
    {
      "seconds": 1506.09,
      "rssBytes": 813137920
    },
    {
      "seconds": 1507.1,
      "rssBytes": 813203456
    },
    {
      "seconds": 1508.11,
      "rssBytes": 813203456
    },
    {
      "seconds": 1509.11,
      "rssBytes": 813203456
    },
    {
      "seconds": 1510.13,
      "rssBytes": 813203456
    },
    {
      "seconds": 1511.15,
      "rssBytes": 811384832
    },
    {
      "seconds": 1512.16,
      "rssBytes": 762871808
    },
    {
      "seconds": 1513.18,
      "rssBytes": 762888192
    },
    {
      "seconds": 1514.19,
      "rssBytes": 762839040
    },
    {
      "seconds": 1515.2,
      "rssBytes": 762839040
    },
    {
      "seconds": 1516.21,
      "rssBytes": 762839040
    },
    {
      "seconds": 1517.22,
      "rssBytes": 763215872
    },
    {
      "seconds": 1518.22,
      "rssBytes": 763232256
    },
    {
      "seconds": 1519.23,
      "rssBytes": 763232256
    },
    {
      "seconds": 1520.25,
      "rssBytes": 763232256
    },
    {
      "seconds": 1521.26,
      "rssBytes": 763232256
    },
    {
      "seconds": 1522.26,
      "rssBytes": 763314176
    },
    {
      "seconds": 1523.27,
      "rssBytes": 763314176
    },
    {
      "seconds": 1524.28,
      "rssBytes": 763314176
    },
    {
      "seconds": 1525.29,
      "rssBytes": 763314176
    },
    {
      "seconds": 1526.31,
      "rssBytes": 758611968
    },
    {
      "seconds": 1527.32,
      "rssBytes": 760266752
    },
    {
      "seconds": 1528.33,
      "rssBytes": 760315904
    },
    {
      "seconds": 1529.34,
      "rssBytes": 760315904
    },
    {
      "seconds": 1530.35,
      "rssBytes": 760315904
    },
    {
      "seconds": 1531.36,
      "rssBytes": 760971264
    },
    {
      "seconds": 1532.37,
      "rssBytes": 761298944
    },
    {
      "seconds": 1533.38,
      "rssBytes": 762298368
    },
    {
      "seconds": 1534.39,
      "rssBytes": 762298368
    },
    {
      "seconds": 1535.4,
      "rssBytes": 762298368
    },
    {
      "seconds": 1536.4,
      "rssBytes": 762298368
    },
    {
      "seconds": 1537.41,
      "rssBytes": 762298368
    },
    {
      "seconds": 1538.43,
      "rssBytes": 762544128
    },
    {
      "seconds": 1539.44,
      "rssBytes": 763002880
    },
    {
      "seconds": 1540.44,
      "rssBytes": 763019264
    },
    {
      "seconds": 1541.45,
      "rssBytes": 763379712
    },
    {
      "seconds": 1542.46,
      "rssBytes": 763379712
    },
    {
      "seconds": 1543.47,
      "rssBytes": 763494400
    },
    {
      "seconds": 1544.47,
      "rssBytes": 763592704
    },
    {
      "seconds": 1545.49,
      "rssBytes": 763592704
    },
    {
      "seconds": 1546.5,
      "rssBytes": 763592704
    },
    {
      "seconds": 1547.51,
      "rssBytes": 763592704
    },
    {
      "seconds": 1548.52,
      "rssBytes": 764035072
    },
    {
      "seconds": 1549.52,
      "rssBytes": 764051456
    },
    {
      "seconds": 1550.53,
      "rssBytes": 764149760
    },
    {
      "seconds": 1551.54,
      "rssBytes": 764149760
    },
    {
      "seconds": 1552.55,
      "rssBytes": 764166144
    },
    {
      "seconds": 1553.55,
      "rssBytes": 764166144
    },
    {
      "seconds": 1554.56,
      "rssBytes": 764755968
    },
    {
      "seconds": 1555.57,
      "rssBytes": 766246912
    },
    {
      "seconds": 1556.58,
      "rssBytes": 766197760
    },
    {
      "seconds": 1557.59,
      "rssBytes": 766197760
    },
    {
      "seconds": 1558.6,
      "rssBytes": 760414208
    },
    {
      "seconds": 1559.61,
      "rssBytes": 760561664
    },
    {
      "seconds": 1560.63,
      "rssBytes": 760725504
    },
    {
      "seconds": 1561.64,
      "rssBytes": 761135104
    },
    {
      "seconds": 1562.65,
      "rssBytes": 761200640
    },
    {
      "seconds": 1563.66,
      "rssBytes": 761200640
    },
    {
      "seconds": 1564.67,
      "rssBytes": 761282560
    },
    {
      "seconds": 1565.68,
      "rssBytes": 761282560
    },
    {
      "seconds": 1566.69,
      "rssBytes": 761298944
    },
    {
      "seconds": 1567.7,
      "rssBytes": 761315328
    },
    {
      "seconds": 1568.71,
      "rssBytes": 761315328
    },
    {
      "seconds": 1569.73,
      "rssBytes": 761331712
    },
    {
      "seconds": 1570.74,
      "rssBytes": 762937344
    },
    {
      "seconds": 1571.75,
      "rssBytes": 765558784
    },
    {
      "seconds": 1572.77,
      "rssBytes": 765640704
    },
    {
      "seconds": 1573.78,
      "rssBytes": 765640704
    },
    {
      "seconds": 1574.79,
      "rssBytes": 765640704
    },
    {
      "seconds": 1575.8,
      "rssBytes": 765640704
    },
    {
      "seconds": 1576.81,
      "rssBytes": 765640704
    },
    {
      "seconds": 1577.83,
      "rssBytes": 765575168
    },
    {
      "seconds": 1578.83,
      "rssBytes": 765575168
    },
    {
      "seconds": 1579.85,
      "rssBytes": 765526016
    },
    {
      "seconds": 1580.86,
      "rssBytes": 765558784
    },
    {
      "seconds": 1581.87,
      "rssBytes": 765558784
    },
    {
      "seconds": 1582.88,
      "rssBytes": 765558784
    },
    {
      "seconds": 1583.89,
      "rssBytes": 765558784
    },
    {
      "seconds": 1584.9,
      "rssBytes": 765558784
    },
    {
      "seconds": 1585.92,
      "rssBytes": 765558784
    },
    {
      "seconds": 1586.93,
      "rssBytes": 765558784
    },
    {
      "seconds": 1587.94,
      "rssBytes": 765558784
    },
    {
      "seconds": 1588.95,
      "rssBytes": 765558784
    },
    {
      "seconds": 1589.97,
      "rssBytes": 760053760
    },
    {
      "seconds": 1590.98,
      "rssBytes": 764592128
    },
    {
      "seconds": 1591.99,
      "rssBytes": 764887040
    },
    {
      "seconds": 1593.0,
      "rssBytes": 764903424
    },
    {
      "seconds": 1594.01,
      "rssBytes": 764936192
    },
    {
      "seconds": 1595.03,
      "rssBytes": 766689280
    },
    {
      "seconds": 1596.04,
      "rssBytes": 766689280
    },
    {
      "seconds": 1597.06,
      "rssBytes": 766836736
    },
    {
      "seconds": 1598.08,
      "rssBytes": 766836736
    },
    {
      "seconds": 1599.09,
      "rssBytes": 767836160
    }
  ],
  "clientOutput": [
    "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\n",
    "connection tuning starts at 8, capped at 32; extra connections must improve throughput\n",
    "verified generation_config.json\n",
    "verified README.md\n",
    "verified config.json\n",
    "verified LICENSE\n",
    "verified chat_template.jinja\n",
    "verified merges.txt\n",
    "0.0% verified \u00b7 21.9 MB/s received \u00b7 ETA measuring \u00b7 6/25 files verified\n",
    "0.0% verified \u00b7 50.5 MB/s received \u00b7 ETA measuring \u00b7 6/25 files verified\n",
    "0.0% verified \u00b7 37.9 MB/s received \u00b7 ETA measuring \u00b7 6/25 files verified\n",
    "0.2% verified \u00b7 49.5 MB/s received \u00b7 ETA 4027 s \u00b7 6/25 files verified\n",
    "0.3% verified \u00b7 38.1 MB/s received \u00b7 ETA 3173 s \u00b7 6/25 files verified\n",
    "0.4% verified \u00b7 50.0 MB/s received \u00b7 ETA 3385 s \u00b7 6/25 files verified\n",
    "0.5% verified \u00b7 42.9 MB/s received \u00b7 ETA 2543 s \u00b7 6/25 files verified\n",
    "0.6% verified \u00b7 47.2 MB/s received \u00b7 ETA 2541 s \u00b7 6/25 files verified\n",
    "0.7% verified \u00b7 42.8 MB/s received \u00b7 ETA 2409 s \u00b7 6/25 files verified\n",
    "0.8% verified \u00b7 43.6 MB/s received \u00b7 ETA 2541 s \u00b7 6/25 files verified\n",
    "0.9% verified \u00b7 45.3 MB/s received \u00b7 ETA 2427 s \u00b7 6/25 files verified\n",
    "1.1% verified \u00b7 46.2 MB/s received \u00b7 ETA 2254 s \u00b7 6/25 files verified\n",
    "1.1% verified \u00b7 47.6 MB/s received \u00b7 ETA 2354 s \u00b7 6/25 files verified\n",
    "1.2% verified \u00b7 47.2 MB/s received \u00b7 ETA 2216 s \u00b7 6/25 files verified\n",
    "1.4% verified \u00b7 50.8 MB/s received \u00b7 ETA 2170 s \u00b7 6/25 files verified\n",
    "download connection trial: 16 active\n",
    "1.5% verified \u00b7 49.9 MB/s received \u00b7 ETA 2129 s \u00b7 6/25 files verified\n",
    "1.5% verified \u00b7 42.5 MB/s received \u00b7 ETA 2203 s \u00b7 6/25 files verified\n",
    "1.6% verified \u00b7 52.2 MB/s received \u00b7 ETA 2273 s \u00b7 6/25 files verified\n",
    "1.6% verified \u00b7 47.2 MB/s received \u00b7 ETA 2287 s \u00b7 6/25 files verified\n",
    "1.8% verified \u00b7 50.0 MB/s received \u00b7 ETA 2243 s \u00b7 6/25 files verified\n",
    "2.0% verified \u00b7 51.2 MB/s received \u00b7 ETA 2074 s \u00b7 6/25 files verified\n",
    "2.0% verified \u00b7 43.1 MB/s received \u00b7 ETA 2129 s \u00b7 6/25 files verified\n",
    "2.1% verified \u00b7 55.0 MB/s received \u00b7 ETA 2103 s \u00b7 6/25 files verified\n",
    "2.2% verified \u00b7 40.4 MB/s received \u00b7 ETA 2154 s \u00b7 6/25 files verified\n",
    "2.2% verified \u00b7 42.8 MB/s received \u00b7 ETA 2204 s \u00b7 6/25 files verified\n",
    "2.5% verified \u00b7 41.2 MB/s received \u00b7 ETA 2069 s \u00b7 6/25 files verified\n",
    "2.5% verified \u00b7 35.8 MB/s received \u00b7 ETA 2114 s \u00b7 6/25 files verified\n",
    "2.5% verified \u00b7 47.4 MB/s received \u00b7 ETA 2157 s \u00b7 6/25 files verified\n",
    "2.6% verified \u00b7 42.3 MB/s received \u00b7 ETA 2134 s \u00b7 6/25 files verified\n",
    "2.7% verified \u00b7 29.2 MB/s received \u00b7 ETA 2142 s \u00b7 6/25 files verified\n",
    "download connection trial: 8 active\n",
    "2.8% verified \u00b7 49.4 MB/s received \u00b7 ETA 2181 s \u00b7 6/25 files verified\n",
    "2.8% verified \u00b7 44.2 MB/s received \u00b7 ETA 2189 s \u00b7 6/25 files verified\n",
    "3.1% verified \u00b7 42.0 MB/s received \u00b7 ETA 2054 s \u00b7 6/25 files verified\n",
    "3.2% verified \u00b7 41.2 MB/s received \u00b7 ETA 2063 s \u00b7 6/25 files verified\n",
    "3.2% verified \u00b7 39.1 MB/s received \u00b7 ETA 2097 s \u00b7 6/25 files verified\n",
    "3.3% verified \u00b7 42.5 MB/s received \u00b7 ETA 2104 s \u00b7 6/25 files verified\n",
    "3.4% verified \u00b7 40.3 MB/s received \u00b7 ETA 2087 s \u00b7 6/25 files verified\n",
    "3.5% verified \u00b7 36.1 MB/s received \u00b7 ETA 2069 s \u00b7 6/25 files verified\n",
    "3.6% verified \u00b7 41.7 MB/s received \u00b7 ETA 2100 s \u00b7 6/25 files verified\n",
    "3.7% verified \u00b7 39.3 MB/s received \u00b7 ETA 2084 s \u00b7 6/25 files verified\n",
    "3.9% verified \u00b7 39.2 MB/s received \u00b7 ETA 2003 s \u00b7 6/25 files verified\n",
    "4.0% verified \u00b7 40.9 MB/s received \u00b7 ETA 2032 s \u00b7 6/25 files verified\n",
    "4.0% verified \u00b7 37.3 MB/s received \u00b7 ETA 2038 s \u00b7 6/25 files verified\n",
    "4.1% verified \u00b7 36.1 MB/s received \u00b7 ETA 2045 s \u00b7 6/25 files verified\n",
    "4.3% verified \u00b7 37.5 MB/s received \u00b7 ETA 2015 s \u00b7 6/25 files verified\n",
    "4.3% verified \u00b7 37.1 MB/s received \u00b7 ETA 2024 s \u00b7 6/25 files verified\n",
    "4.4% verified \u00b7 40.5 MB/s received \u00b7 ETA 2032 s \u00b7 6/25 files verified\n",
    "4.6% verified \u00b7 43.8 MB/s received \u00b7 ETA 2014 s \u00b7 6/25 files verified\n",
    "4.6% verified \u00b7 23.8 MB/s received \u00b7 ETA 2039 s \u00b7 6/25 files verified\n",
    "4.7% verified \u00b7 37.2 MB/s received \u00b7 ETA 2046 s \u00b7 6/25 files verified\n",
    "4.7% verified \u00b7 16.9 MB/s received \u00b7 ETA 2087 s \u00b7 6/25 files verified\n",
    "4.9% verified \u00b7 40.3 MB/s received \u00b7 ETA 2038 s \u00b7 6/25 files verified\n",
    "4.9% verified \u00b7 28.8 MB/s received \u00b7 ETA 2076 s \u00b7 6/25 files verified\n",
    "4.9% verified \u00b7 30.4 MB/s received \u00b7 ETA 2115 s \u00b7 6/25 files verified\n",
    "5.0% verified \u00b7 30.8 MB/s received \u00b7 ETA 2101 s \u00b7 6/25 files verified\n",
    "5.1% verified \u00b7 22.7 MB/s received \u00b7 ETA 2088 s \u00b7 6/25 files verified\n",
    "5.1% verified \u00b7 36.4 MB/s received \u00b7 ETA 2109 s \u00b7 6/25 files verified\n",
    "5.3% verified \u00b7 25.9 MB/s received \u00b7 ETA 2088 s \u00b7 6/25 files verified\n",
    "5.3% verified \u00b7 26.4 MB/s received \u00b7 ETA 2124 s \u00b7 6/25 files verified\n",
    "5.3% verified \u00b7 32.7 MB/s received \u00b7 ETA 2160 s \u00b7 6/25 files verified\n",
    "5.4% verified \u00b7 30.7 MB/s received \u00b7 ETA 2146 s \u00b7 6/25 files verified\n",
    "5.5% verified \u00b7 28.2 MB/s received \u00b7 ETA 2132 s \u00b7 6/25 files verified\n",
    "5.5% verified \u00b7 20.5 MB/s received \u00b7 ETA 2166 s \u00b7 6/25 files verified\n",
    "5.6% verified \u00b7 37.6 MB/s received \u00b7 ETA 2153 s \u00b7 6/25 files verified\n",
    "5.6% verified \u00b7 30.1 MB/s received \u00b7 ETA 2172 s \u00b7 6/25 files verified\n",
    "5.8% verified \u00b7 28.4 MB/s received \u00b7 ETA 2147 s \u00b7 6/25 files verified\n",
    "5.8% verified \u00b7 29.7 MB/s received \u00b7 ETA 2179 s \u00b7 6/25 files verified\n",
    "5.8% verified \u00b7 29.9 MB/s received \u00b7 ETA 2197 s \u00b7 6/25 files verified\n",
    "5.9% verified \u00b7 31.3 MB/s received \u00b7 ETA 2186 s \u00b7 6/25 files verified\n",
    "6.0% verified \u00b7 26.4 MB/s received \u00b7 ETA 2182 s \u00b7 6/25 files verified\n",
    "6.1% verified \u00b7 34.0 MB/s received \u00b7 ETA 2199 s \u00b7 6/25 files verified\n",
    "6.1% verified \u00b7 26.0 MB/s received \u00b7 ETA 2216 s \u00b7 6/25 files verified\n",
    "6.2% verified \u00b7 30.8 MB/s received \u00b7 ETA 2219 s \u00b7 6/25 files verified\n",
    "6.3% verified \u00b7 30.3 MB/s received \u00b7 ETA 2193 s \u00b7 6/25 files verified\n",
    "6.4% verified \u00b7 28.8 MB/s received \u00b7 ETA 2208 s \u00b7 6/25 files verified\n",
    "6.4% verified \u00b7 27.7 MB/s received \u00b7 ETA 2208 s \u00b7 6/25 files verified\n",
    "6.5% verified \u00b7 24.7 MB/s received \u00b7 ETA 2223 s \u00b7 6/25 files verified\n",
    "6.5% verified \u00b7 30.2 MB/s received \u00b7 ETA 2235 s \u00b7 6/25 files verified\n",
    "6.6% verified \u00b7 33.2 MB/s received \u00b7 ETA 2225 s \u00b7 6/25 files verified\n",
    "6.7% verified \u00b7 28.8 MB/s received \u00b7 ETA 2240 s \u00b7 6/25 files verified\n",
    "6.7% verified \u00b7 31.9 MB/s received \u00b7 ETA 2255 s \u00b7 6/25 files verified\n",
    "6.8% verified \u00b7 27.4 MB/s received \u00b7 ETA 2244 s \u00b7 6/25 files verified\n",
    "6.9% verified \u00b7 30.4 MB/s received \u00b7 ETA 2246 s \u00b7 6/25 files verified\n",
    "6.9% verified \u00b7 30.2 MB/s received \u00b7 ETA 2255 s \u00b7 6/25 files verified\n",
    "7.0% verified \u00b7 32.2 MB/s received \u00b7 ETA 2269 s \u00b7 6/25 files verified\n",
    "7.1% verified \u00b7 30.2 MB/s received \u00b7 ETA 2258 s \u00b7 6/25 files verified\n",
    "7.2% verified \u00b7 27.4 MB/s received \u00b7 ETA 2248 s \u00b7 6/25 files verified\n",
    "7.2% verified \u00b7 29.6 MB/s received \u00b7 ETA 2274 s \u00b7 6/25 files verified\n",
    "7.3% verified \u00b7 31.2 MB/s received \u00b7 ETA 2269 s \u00b7 6/25 files verified\n",
    "7.4% verified \u00b7 26.5 MB/s received \u00b7 ETA 2256 s \u00b7 6/25 files verified\n",
    "7.5% verified \u00b7 29.1 MB/s received \u00b7 ETA 2252 s \u00b7 6/25 files verified\n",
    "7.5% verified \u00b7 28.8 MB/s received \u00b7 ETA 2275 s \u00b7 6/25 files verified\n",
    "7.5% verified \u00b7 27.4 MB/s received \u00b7 ETA 2300 s \u00b7 6/25 files verified\n",
    "7.6% verified \u00b7 32.2 MB/s received \u00b7 ETA 2283 s \u00b7 6/25 files verified\n",
    "7.7% verified \u00b7 26.9 MB/s received \u00b7 ETA 2263 s \u00b7 6/25 files verified\n",
    "7.7% verified \u00b7 30.3 MB/s received \u00b7 ETA 2287 s \u00b7 6/25 files verified\n",
    "7.7% verified \u00b7 27.6 MB/s received \u00b7 ETA 2311 s \u00b7 6/25 files verified\n",
    "7.8% verified \u00b7 31.2 MB/s received \u00b7 ETA 2311 s \u00b7 6/25 files verified\n",
    "8.0% verified \u00b7 30.6 MB/s received \u00b7 ETA 2289 s \u00b7 6/25 files verified\n",
    "8.0% verified \u00b7 27.6 MB/s received \u00b7 ETA 2289 s \u00b7 6/25 files verified\n",
    "8.1% verified \u00b7 30.3 MB/s received \u00b7 ETA 2289 s \u00b7 6/25 files verified\n",
    "8.2% verified \u00b7 25.2 MB/s received \u00b7 ETA 2283 s \u00b7 6/25 files verified\n",
    "8.3% verified \u00b7 25.7 MB/s received \u00b7 ETA 2278 s \u00b7 6/25 files verified\n",
    "8.3% verified \u00b7 28.6 MB/s received \u00b7 ETA 2295 s \u00b7 6/25 files verified\n",
    "8.3% verified \u00b7 33.4 MB/s received \u00b7 ETA 2312 s \u00b7 6/25 files verified\n",
    "8.4% verified \u00b7 26.1 MB/s received \u00b7 ETA 2322 s \u00b7 6/25 files verified\n",
    "8.5% verified \u00b7 28.5 MB/s received \u00b7 ETA 2314 s \u00b7 6/25 files verified\n",
    "8.6% verified \u00b7 23.5 MB/s received \u00b7 ETA 2304 s \u00b7 6/25 files verified\n",
    "8.7% verified \u00b7 28.9 MB/s received \u00b7 ETA 2300 s \u00b7 6/25 files verified\n",
    "8.7% verified \u00b7 22.6 MB/s received \u00b7 ETA 2301 s \u00b7 6/25 files verified\n",
    "8.8% verified \u00b7 17.7 MB/s received \u00b7 ETA 2305 s \u00b7 6/25 files verified\n",
    "8.8% verified \u00b7 21.9 MB/s received \u00b7 ETA 2316 s \u00b7 6/25 files verified\n",
    "8.8% verified \u00b7 26.1 MB/s received \u00b7 ETA 2330 s \u00b7 6/25 files verified\n",
    "8.8% verified \u00b7 25.4 MB/s received \u00b7 ETA 2351 s \u00b7 6/25 files verified\n",
    "8.9% verified \u00b7 32.4 MB/s received \u00b7 ETA 2365 s \u00b7 6/25 files verified\n",
    "8.9% verified \u00b7 25.5 MB/s received \u00b7 ETA 2361 s \u00b7 6/25 files verified\n",
    "9.1% verified \u00b7 24.9 MB/s received \u00b7 ETA 2350 s \u00b7 6/25 files verified\n",
    "9.2% verified \u00b7 15.3 MB/s received \u00b7 ETA 2341 s \u00b7 6/25 files verified\n",
    "9.2% verified \u00b7 22.9 MB/s received \u00b7 ETA 2342 s \u00b7 6/25 files verified\n",
    "9.3% verified \u00b7 20.7 MB/s received \u00b7 ETA 2351 s \u00b7 6/25 files verified\n",
    "9.3% verified \u00b7 27.1 MB/s received \u00b7 ETA 2358 s \u00b7 6/25 files verified\n",
    "9.3% verified \u00b7 21.1 MB/s received \u00b7 ETA 2375 s \u00b7 6/25 files verified\n",
    "verified model-00001.safetensors\n",
    "9.3% verified \u00b7 37.4 MB/s received \u00b7 ETA 2395 s \u00b7 7/25 files verified\n",
    "9.3% verified \u00b7 32.4 MB/s received \u00b7 ETA 2414 s \u00b7 7/25 files verified\n",
    "9.5% verified \u00b7 28.5 MB/s received \u00b7 ETA 2390 s \u00b7 7/25 files verified\n",
    "9.5% verified \u00b7 30.7 MB/s received \u00b7 ETA 2398 s \u00b7 7/25 files verified\n",
    "9.5% verified \u00b7 25.3 MB/s received \u00b7 ETA 2406 s \u00b7 7/25 files verified\n",
    "9.7% verified \u00b7 34.4 MB/s received \u00b7 ETA 2392 s \u00b7 7/25 files verified\n",
    "9.7% verified \u00b7 28.4 MB/s received \u00b7 ETA 2390 s \u00b7 7/25 files verified\n",
    "9.8% verified \u00b7 24.2 MB/s received \u00b7 ETA 2388 s \u00b7 7/25 files verified\n",
    "9.9% verified \u00b7 28.3 MB/s received \u00b7 ETA 2395 s \u00b7 7/25 files verified\n",
    "9.9% verified \u00b7 26.5 MB/s received \u00b7 ETA 2403 s \u00b7 7/25 files verified\n",
    "9.9% verified \u00b7 22.7 MB/s received \u00b7 ETA 2421 s \u00b7 7/25 files verified\n",
    "9.9% verified \u00b7 25.8 MB/s received \u00b7 ETA 2429 s \u00b7 7/25 files verified\n",
    "10.1% verified \u00b7 28.8 MB/s received \u00b7 ETA 2395 s \u00b7 7/25 files verified\n",
    "10.1% verified \u00b7 29.3 MB/s received \u00b7 ETA 2413 s \u00b7 7/25 files verified\n",
    "10.2% verified \u00b7 30.9 MB/s received \u00b7 ETA 2420 s \u00b7 7/25 files verified\n",
    "10.3% verified \u00b7 25.9 MB/s received \u00b7 ETA 2407 s \u00b7 7/25 files verified\n",
    "10.4% verified \u00b7 29.1 MB/s received \u00b7 ETA 2404 s \u00b7 7/25 files verified\n",
    "10.4% verified \u00b7 26.7 MB/s received \u00b7 ETA 2411 s \u00b7 7/25 files verified\n",
    "10.5% verified \u00b7 33.3 MB/s received \u00b7 ETA 2408 s \u00b7 7/25 files verified\n",
    "10.6% verified \u00b7 31.0 MB/s received \u00b7 ETA 2405 s \u00b7 7/25 files verified\n",
    "10.6% verified \u00b7 25.2 MB/s received \u00b7 ETA 2412 s \u00b7 7/25 files verified\n",
    "10.7% verified \u00b7 28.7 MB/s received \u00b7 ETA 2409 s \u00b7 7/25 files verified\n",
    "10.7% verified \u00b7 30.6 MB/s received \u00b7 ETA 2426 s \u00b7 7/25 files verified\n",
    "10.8% verified \u00b7 30.4 MB/s received \u00b7 ETA 2414 s \u00b7 7/25 files verified\n",
    "10.9% verified \u00b7 27.9 MB/s received \u00b7 ETA 2401 s \u00b7 7/25 files verified\n",
    "10.9% verified \u00b7 29.9 MB/s received \u00b7 ETA 2408 s \u00b7 7/25 files verified\n",
    "11.0% verified \u00b7 27.9 MB/s received \u00b7 ETA 2414 s \u00b7 7/25 files verified\n",
    "11.1% verified \u00b7 30.5 MB/s received \u00b7 ETA 2411 s \u00b7 7/25 files verified\n",
    "11.1% verified \u00b7 29.7 MB/s received \u00b7 ETA 2408 s \u00b7 7/25 files verified\n",
    "11.2% verified \u00b7 32.9 MB/s received \u00b7 ETA 2415 s \u00b7 7/25 files verified\n",
    "11.3% verified \u00b7 28.0 MB/s received \u00b7 ETA 2402 s \u00b7 7/25 files verified\n",
    "11.3% verified \u00b7 28.2 MB/s received \u00b7 ETA 2409 s \u00b7 7/25 files verified\n",
    "11.5% verified \u00b7 33.0 MB/s received \u00b7 ETA 2397 s \u00b7 7/25 files verified\n",
    "11.5% verified \u00b7 31.5 MB/s received \u00b7 ETA 2403 s \u00b7 7/25 files verified\n",
    "11.6% verified \u00b7 31.4 MB/s received \u00b7 ETA 2400 s \u00b7 7/25 files verified\n",
    "11.6% verified \u00b7 31.6 MB/s received \u00b7 ETA 2406 s \u00b7 7/25 files verified\n",
    "11.7% verified \u00b7 26.7 MB/s received \u00b7 ETA 2403 s \u00b7 7/25 files verified\n",
    "11.7% verified \u00b7 34.4 MB/s received \u00b7 ETA 2418 s \u00b7 7/25 files verified\n",
    "11.9% verified \u00b7 29.1 MB/s received \u00b7 ETA 2388 s \u00b7 7/25 files verified\n",
    "11.9% verified \u00b7 32.0 MB/s received \u00b7 ETA 2394 s \u00b7 7/25 files verified\n",
    "12.0% verified \u00b7 31.7 MB/s received \u00b7 ETA 2391 s \u00b7 7/25 files verified\n",
    "12.0% verified \u00b7 27.7 MB/s received \u00b7 ETA 2406 s \u00b7 7/25 files verified\n",
    "12.1% verified \u00b7 29.1 MB/s received \u00b7 ETA 2403 s \u00b7 7/25 files verified\n",
    "12.2% verified \u00b7 29.8 MB/s received \u00b7 ETA 2391 s \u00b7 7/25 files verified\n",
    "12.2% verified \u00b7 28.4 MB/s received \u00b7 ETA 2397 s \u00b7 7/25 files verified\n",
    "12.3% verified \u00b7 29.5 MB/s received \u00b7 ETA 2393 s \u00b7 7/25 files verified\n",
    "12.3% verified \u00b7 31.6 MB/s received \u00b7 ETA 2399 s \u00b7 7/25 files verified\n",
    "12.5% verified \u00b7 29.3 MB/s received \u00b7 ETA 2388 s \u00b7 7/25 files verified\n",
    "12.5% verified \u00b7 31.7 MB/s received \u00b7 ETA 2384 s \u00b7 7/25 files verified\n",
    "12.6% verified \u00b7 29.8 MB/s received \u00b7 ETA 2390 s \u00b7 7/25 files verified\n",
    "12.6% verified \u00b7 24.2 MB/s received \u00b7 ETA 2396 s \u00b7 7/25 files verified\n",
    "12.7% verified \u00b7 34.8 MB/s received \u00b7 ETA 2384 s \u00b7 7/25 files verified\n",
    "12.8% verified \u00b7 24.8 MB/s received \u00b7 ETA 2389 s \u00b7 7/25 files verified\n",
    "12.8% verified \u00b7 30.6 MB/s received \u00b7 ETA 2395 s \u00b7 7/25 files verified\n",
    "12.9% verified \u00b7 31.3 MB/s received \u00b7 ETA 2392 s \u00b7 7/25 files verified\n",
    "13.0% verified \u00b7 31.0 MB/s received \u00b7 ETA 2380 s \u00b7 7/25 files verified\n",
    "13.1% verified \u00b7 30.8 MB/s received \u00b7 ETA 2377 s \u00b7 7/25 files verified\n",
    "13.1% verified \u00b7 29.1 MB/s received \u00b7 ETA 2391 s \u00b7 7/25 files verified\n",
    "13.1% verified \u00b7 26.9 MB/s received \u00b7 ETA 2396 s \u00b7 7/25 files verified\n",
    "13.2% verified \u00b7 30.3 MB/s received \u00b7 ETA 2393 s \u00b7 7/25 files verified\n",
    "13.4% verified \u00b7 28.0 MB/s received \u00b7 ETA 2374 s \u00b7 7/25 files verified\n",
    "13.4% verified \u00b7 30.7 MB/s received \u00b7 ETA 2379 s \u00b7 7/25 files verified\n",
    "13.4% verified \u00b7 30.9 MB/s received \u00b7 ETA 2383 s \u00b7 7/25 files verified\n",
    "13.5% verified \u00b7 26.7 MB/s received \u00b7 ETA 2380 s \u00b7 7/25 files verified\n",
    "13.6% verified \u00b7 30.7 MB/s received \u00b7 ETA 2385 s \u00b7 7/25 files verified\n",
    "13.7% verified \u00b7 29.3 MB/s received \u00b7 ETA 2374 s \u00b7 7/25 files verified\n",
    "13.7% verified \u00b7 30.3 MB/s received \u00b7 ETA 2379 s \u00b7 7/25 files verified\n",
    "13.8% verified \u00b7 31.1 MB/s received \u00b7 ETA 2376 s \u00b7 7/25 files verified\n",
    "13.8% verified \u00b7 30.4 MB/s received \u00b7 ETA 2381 s \u00b7 7/25 files verified\n",
    "13.9% verified \u00b7 30.5 MB/s received \u00b7 ETA 2378 s \u00b7 7/25 files verified\n",
    "14.0% verified \u00b7 31.1 MB/s received \u00b7 ETA 2367 s \u00b7 7/25 files verified\n",
    "14.1% verified \u00b7 30.3 MB/s received \u00b7 ETA 2364 s \u00b7 7/25 files verified\n",
    "14.2% verified \u00b7 30.0 MB/s received \u00b7 ETA 2361 s \u00b7 7/25 files verified\n",
    "14.2% verified \u00b7 27.7 MB/s received \u00b7 ETA 2373 s \u00b7 7/25 files verified\n",
    "14.3% verified \u00b7 32.5 MB/s received \u00b7 ETA 2370 s \u00b7 7/25 files verified\n",
    "14.3% verified \u00b7 30.9 MB/s received \u00b7 ETA 2367 s \u00b7 7/25 files verified\n",
    "14.4% verified \u00b7 29.7 MB/s received \u00b7 ETA 2364 s \u00b7 7/25 files verified\n",
    "14.4% verified \u00b7 26.1 MB/s received \u00b7 ETA 2368 s \u00b7 7/25 files verified\n",
    "14.5% verified \u00b7 28.0 MB/s received \u00b7 ETA 2365 s \u00b7 7/25 files verified\n",
    "14.6% verified \u00b7 34.2 MB/s received \u00b7 ETA 2362 s \u00b7 7/25 files verified\n",
    "14.7% verified \u00b7 30.0 MB/s received \u00b7 ETA 2352 s \u00b7 7/25 files verified\n",
    "14.7% verified \u00b7 26.8 MB/s received \u00b7 ETA 2364 s \u00b7 7/25 files verified\n",
    "14.8% verified \u00b7 30.3 MB/s received \u00b7 ETA 2368 s \u00b7 7/25 files verified\n",
    "14.8% verified \u00b7 30.9 MB/s received \u00b7 ETA 2365 s \u00b7 7/25 files verified\n",
    "15.0% verified \u00b7 27.5 MB/s received \u00b7 ETA 2354 s \u00b7 7/25 files verified\n",
    "15.0% verified \u00b7 23.6 MB/s received \u00b7 ETA 2359 s \u00b7 7/25 files verified\n",
    "15.0% verified \u00b7 25.1 MB/s received \u00b7 ETA 2370 s \u00b7 7/25 files verified\n",
    "15.1% verified \u00b7 33.5 MB/s received \u00b7 ETA 2359 s \u00b7 7/25 files verified\n",
    "15.2% verified \u00b7 26.6 MB/s received \u00b7 ETA 2357 s \u00b7 7/25 files verified\n",
    "15.3% verified \u00b7 28.3 MB/s received \u00b7 ETA 2353 s \u00b7 7/25 files verified\n",
    "15.3% verified \u00b7 24.5 MB/s received \u00b7 ETA 2357 s \u00b7 7/25 files verified\n",
    "15.3% verified \u00b7 33.6 MB/s received \u00b7 ETA 2362 s \u00b7 7/25 files verified\n",
    "15.4% verified \u00b7 26.7 MB/s received \u00b7 ETA 2366 s \u00b7 7/25 files verified\n",
    "15.5% verified \u00b7 27.6 MB/s received \u00b7 ETA 2355 s \u00b7 7/25 files verified\n",
    "15.5% verified \u00b7 30.8 MB/s received \u00b7 ETA 2359 s \u00b7 7/25 files verified\n",
    "15.7% verified \u00b7 29.4 MB/s received \u00b7 ETA 2342 s \u00b7 7/25 files verified\n",
    "15.7% verified \u00b7 22.9 MB/s received \u00b7 ETA 2353 s \u00b7 7/25 files verified\n",
    "15.8% verified \u00b7 35.8 MB/s received \u00b7 ETA 2350 s \u00b7 7/25 files verified\n",
    "15.8% verified \u00b7 25.8 MB/s received \u00b7 ETA 2354 s \u00b7 7/25 files verified\n",
    "15.9% verified \u00b7 29.9 MB/s received \u00b7 ETA 2351 s \u00b7 7/25 files verified\n",
    "16.0% verified \u00b7 30.0 MB/s received \u00b7 ETA 2341 s \u00b7 7/25 files verified\n",
    "16.0% verified \u00b7 30.8 MB/s received \u00b7 ETA 2351 s \u00b7 7/25 files verified\n",
    "16.1% verified \u00b7 29.8 MB/s received \u00b7 ETA 2348 s \u00b7 7/25 files verified\n",
    "16.2% verified \u00b7 28.8 MB/s received \u00b7 ETA 2345 s \u00b7 7/25 files verified\n",
    "16.2% verified \u00b7 26.1 MB/s received \u00b7 ETA 2342 s \u00b7 7/25 files verified\n",
    "16.3% verified \u00b7 25.2 MB/s received \u00b7 ETA 2346 s \u00b7 7/25 files verified\n",
    "16.4% verified \u00b7 36.3 MB/s received \u00b7 ETA 2336 s \u00b7 7/25 files verified\n",
    "16.4% verified \u00b7 27.7 MB/s received \u00b7 ETA 2346 s \u00b7 7/25 files verified\n",
    "16.4% verified \u00b7 23.6 MB/s received \u00b7 ETA 2350 s \u00b7 7/25 files verified\n",
    "16.5% verified \u00b7 32.0 MB/s received \u00b7 ETA 2340 s \u00b7 7/25 files verified\n",
    "16.6% verified \u00b7 26.1 MB/s received \u00b7 ETA 2337 s \u00b7 7/25 files verified\n",
    "16.7% verified \u00b7 28.6 MB/s received \u00b7 ETA 2334 s \u00b7 7/25 files verified\n",
    "16.7% verified \u00b7 28.9 MB/s received \u00b7 ETA 2337 s \u00b7 7/25 files verified\n",
    "16.7% verified \u00b7 29.2 MB/s received \u00b7 ETA 2347 s \u00b7 7/25 files verified\n",
    "16.8% verified \u00b7 29.7 MB/s received \u00b7 ETA 2344 s \u00b7 7/25 files verified\n",
    "17.0% verified \u00b7 26.9 MB/s received \u00b7 ETA 2328 s \u00b7 7/25 files verified\n",
    "17.0% verified \u00b7 22.8 MB/s received \u00b7 ETA 2331 s \u00b7 7/25 files verified\n",
    "17.0% verified \u00b7 32.9 MB/s received \u00b7 ETA 2341 s \u00b7 7/25 files verified\n",
    "17.1% verified \u00b7 30.7 MB/s received \u00b7 ETA 2338 s \u00b7 7/25 files verified\n",
    "17.2% verified \u00b7 27.2 MB/s received \u00b7 ETA 2328 s \u00b7 7/25 files verified\n",
    "17.3% verified \u00b7 32.3 MB/s received \u00b7 ETA 2319 s \u00b7 7/25 files verified\n",
    "17.3% verified \u00b7 22.7 MB/s received \u00b7 ETA 2328 s \u00b7 7/25 files verified\n",
    "17.4% verified \u00b7 34.3 MB/s received \u00b7 ETA 2332 s \u00b7 7/25 files verified\n",
    "17.5% verified \u00b7 31.9 MB/s received \u00b7 ETA 2322 s \u00b7 7/25 files verified\n",
    "17.5% verified \u00b7 29.5 MB/s received \u00b7 ETA 2325 s \u00b7 7/25 files verified\n",
    "17.6% verified \u00b7 29.6 MB/s received \u00b7 ETA 2316 s \u00b7 7/25 files verified\n",
    "17.7% verified \u00b7 28.4 MB/s received \u00b7 ETA 2319 s \u00b7 7/25 files verified\n",
    "17.8% verified \u00b7 28.1 MB/s received \u00b7 ETA 2316 s \u00b7 7/25 files verified\n",
    "17.8% verified \u00b7 28.2 MB/s received \u00b7 ETA 2313 s \u00b7 7/25 files verified\n",
    "17.8% verified \u00b7 27.0 MB/s received \u00b7 ETA 2322 s \u00b7 7/25 files verified\n",
    "17.9% verified \u00b7 31.5 MB/s received \u00b7 ETA 2319 s \u00b7 7/25 files verified\n",
    "18.0% verified \u00b7 27.1 MB/s received \u00b7 ETA 2322 s \u00b7 7/25 files verified\n",
    "18.1% verified \u00b7 29.5 MB/s received \u00b7 ETA 2313 s \u00b7 7/25 files verified\n",
    "18.1% verified \u00b7 26.3 MB/s received \u00b7 ETA 2310 s \u00b7 7/25 files verified\n",
    "18.2% verified \u00b7 29.3 MB/s received \u00b7 ETA 2307 s \u00b7 7/25 files verified\n",
    "18.2% verified \u00b7 20.4 MB/s received \u00b7 ETA 2316 s \u00b7 7/25 files verified\n",
    "18.3% verified \u00b7 36.3 MB/s received \u00b7 ETA 2319 s \u00b7 7/25 files verified\n",
    "18.4% verified \u00b7 27.8 MB/s received \u00b7 ETA 2309 s \u00b7 7/25 files verified\n",
    "18.4% verified \u00b7 28.4 MB/s received \u00b7 ETA 2312 s \u00b7 7/25 files verified\n",
    "18.5% verified \u00b7 27.4 MB/s received \u00b7 ETA 2309 s \u00b7 7/25 files verified\n",
    "18.5% verified \u00b7 30.0 MB/s received \u00b7 ETA 2312 s \u00b7 7/25 files verified\n",
    "18.7% verified \u00b7 29.3 MB/s received \u00b7 ETA 2297 s \u00b7 7/25 files verified\n",
    "18.7% verified \u00b7 28.5 MB/s received \u00b7 ETA 2300 s \u00b7 7/25 files verified\n",
    "18.7% verified \u00b7 31.8 MB/s received \u00b7 ETA 2309 s \u00b7 7/25 files verified\n",
    "verified model-00002.safetensors\n",
    "18.8% verified \u00b7 30.3 MB/s received \u00b7 ETA 2306 s \u00b7 8/25 files verified\n",
    "18.9% verified \u00b7 28.3 MB/s received \u00b7 ETA 2297 s \u00b7 8/25 files verified\n",
    "19.0% verified \u00b7 29.2 MB/s received \u00b7 ETA 2300 s \u00b7 8/25 files verified\n",
    "19.0% verified \u00b7 28.9 MB/s received \u00b7 ETA 2302 s \u00b7 8/25 files verified\n",
    "19.1% verified \u00b7 29.2 MB/s received \u00b7 ETA 2294 s \u00b7 8/25 files verified\n",
    "19.2% verified \u00b7 27.0 MB/s received \u00b7 ETA 2285 s \u00b7 8/25 files verified\n",
    "19.2% verified \u00b7 29.6 MB/s received \u00b7 ETA 2293 s \u00b7 8/25 files verified\n",
    "19.3% verified \u00b7 30.0 MB/s received \u00b7 ETA 2290 s \u00b7 8/25 files verified\n",
    "19.3% verified \u00b7 25.6 MB/s received \u00b7 ETA 2299 s \u00b7 8/25 files verified\n",
    "19.5% verified \u00b7 31.4 MB/s received \u00b7 ETA 2284 s \u00b7 8/25 files verified\n",
    "19.5% verified \u00b7 26.9 MB/s received \u00b7 ETA 2281 s \u00b7 8/25 files verified\n",
    "19.5% verified \u00b7 28.0 MB/s received \u00b7 ETA 2289 s \u00b7 8/25 files verified\n",
    "19.6% verified \u00b7 29.0 MB/s received \u00b7 ETA 2292 s \u00b7 8/25 files verified\n",
    "19.7% verified \u00b7 34.6 MB/s received \u00b7 ETA 2283 s \u00b7 8/25 files verified\n",
    "19.8% verified \u00b7 31.2 MB/s received \u00b7 ETA 2280 s \u00b7 8/25 files verified\n",
    "19.8% verified \u00b7 28.7 MB/s received \u00b7 ETA 2288 s \u00b7 8/25 files verified\n",
    "19.9% verified \u00b7 26.5 MB/s received \u00b7 ETA 2274 s \u00b7 8/25 files verified\n",
    "20.0% verified \u00b7 25.8 MB/s received \u00b7 ETA 2271 s \u00b7 8/25 files verified\n",
    "20.0% verified \u00b7 24.1 MB/s received \u00b7 ETA 2279 s \u00b7 8/25 files verified\n",
    "20.1% verified \u00b7 29.2 MB/s received \u00b7 ETA 2276 s \u00b7 8/25 files verified\n",
    "20.1% verified \u00b7 29.6 MB/s received \u00b7 ETA 2284 s \u00b7 8/25 files verified\n",
    "20.2% verified \u00b7 27.5 MB/s received \u00b7 ETA 2276 s \u00b7 8/25 files verified\n",
    "20.2% verified \u00b7 25.7 MB/s received \u00b7 ETA 2278 s \u00b7 8/25 files verified\n",
    "20.3% verified \u00b7 28.0 MB/s received \u00b7 ETA 2280 s \u00b7 8/25 files verified\n",
    "20.4% verified \u00b7 26.9 MB/s received \u00b7 ETA 2277 s \u00b7 8/25 files verified\n",
    "20.4% verified \u00b7 23.3 MB/s received \u00b7 ETA 2274 s \u00b7 8/25 files verified\n",
    "20.5% verified \u00b7 19.5 MB/s received \u00b7 ETA 2271 s \u00b7 8/25 files verified\n",
    "20.5% verified \u00b7 22.6 MB/s received \u00b7 ETA 2273 s \u00b7 8/25 files verified\n",
    "20.6% verified \u00b7 23.9 MB/s received \u00b7 ETA 2276 s \u00b7 8/25 files verified\n",
    "20.6% verified \u00b7 11.4 MB/s received \u00b7 ETA 2283 s \u00b7 8/25 files verified\n",
    "20.7% verified \u00b7 28.0 MB/s received \u00b7 ETA 2275 s \u00b7 8/25 files verified\n",
    "20.7% verified \u00b7 27.5 MB/s received \u00b7 ETA 2277 s \u00b7 8/25 files verified\n",
    "20.9% verified \u00b7 28.6 MB/s received \u00b7 ETA 2269 s \u00b7 8/25 files verified\n",
    "20.9% verified \u00b7 26.2 MB/s received \u00b7 ETA 2276 s \u00b7 8/25 files verified\n",
    "20.9% verified \u00b7 30.1 MB/s received \u00b7 ETA 2284 s \u00b7 8/25 files verified\n",
    "20.9% verified \u00b7 23.9 MB/s received \u00b7 ETA 2281 s \u00b7 8/25 files verified\n",
    "21.1% verified \u00b7 29.1 MB/s received \u00b7 ETA 2267 s \u00b7 8/25 files verified\n",
    "21.1% verified \u00b7 23.8 MB/s received \u00b7 ETA 2274 s \u00b7 8/25 files verified\n",
    "21.1% verified \u00b7 27.0 MB/s received \u00b7 ETA 2277 s \u00b7 8/25 files verified\n",
    "21.2% verified \u00b7 24.2 MB/s received \u00b7 ETA 2274 s \u00b7 8/25 files verified\n",
    "21.2% verified \u00b7 20.2 MB/s received \u00b7 ETA 2276 s \u00b7 8/25 files verified\n",
    "21.4% verified \u00b7 23.2 MB/s received \u00b7 ETA 2267 s \u00b7 8/25 files verified\n",
    "21.4% verified \u00b7 26.8 MB/s received \u00b7 ETA 2275 s \u00b7 8/25 files verified\n",
    "21.4% verified \u00b7 28.5 MB/s received \u00b7 ETA 2271 s \u00b7 8/25 files verified\n",
    "21.5% verified \u00b7 28.5 MB/s received \u00b7 ETA 2274 s \u00b7 8/25 files verified\n",
    "21.6% verified \u00b7 27.0 MB/s received \u00b7 ETA 2265 s \u00b7 8/25 files verified\n",
    "21.6% verified \u00b7 27.6 MB/s received \u00b7 ETA 2267 s \u00b7 8/25 files verified\n",
    "21.7% verified \u00b7 24.0 MB/s received \u00b7 ETA 2270 s \u00b7 8/25 files verified\n",
    "21.7% verified \u00b7 28.2 MB/s received \u00b7 ETA 2272 s \u00b7 8/25 files verified\n",
    "21.8% verified \u00b7 28.0 MB/s received \u00b7 ETA 2269 s \u00b7 8/25 files verified\n",
    "21.8% verified \u00b7 26.9 MB/s received \u00b7 ETA 2271 s \u00b7 8/25 files verified\n",
    "22.0% verified \u00b7 30.6 MB/s received \u00b7 ETA 2257 s \u00b7 8/25 files verified\n",
    "22.1% verified \u00b7 27.1 MB/s received \u00b7 ETA 2254 s \u00b7 8/25 files verified\n",
    "22.1% verified \u00b7 25.8 MB/s received \u00b7 ETA 2261 s \u00b7 8/25 files verified\n",
    "22.1% verified \u00b7 30.5 MB/s received \u00b7 ETA 2263 s \u00b7 8/25 files verified\n",
    "22.2% verified \u00b7 26.6 MB/s received \u00b7 ETA 2255 s \u00b7 8/25 files verified\n",
    "22.3% verified \u00b7 28.1 MB/s received \u00b7 ETA 2252 s \u00b7 8/25 files verified\n",
    "22.3% verified \u00b7 22.2 MB/s received \u00b7 ETA 2254 s \u00b7 8/25 files verified\n",
    "22.3% verified \u00b7 20.7 MB/s received \u00b7 ETA 2261 s \u00b7 8/25 files verified\n",
    "22.4% verified \u00b7 29.9 MB/s received \u00b7 ETA 2262 s \u00b7 8/25 files verified\n",
    "22.5% verified \u00b7 21.9 MB/s received \u00b7 ETA 2254 s \u00b7 8/25 files verified\n",
    "22.5% verified \u00b7 26.2 MB/s received \u00b7 ETA 2256 s \u00b7 8/25 files verified\n",
    "22.5% verified \u00b7 26.8 MB/s received \u00b7 ETA 2263 s \u00b7 8/25 files verified\n",
    "22.6% verified \u00b7 29.0 MB/s received \u00b7 ETA 2255 s \u00b7 8/25 files verified\n",
    "22.8% verified \u00b7 29.0 MB/s received \u00b7 ETA 2247 s \u00b7 8/25 files verified\n",
    "22.8% verified \u00b7 27.2 MB/s received \u00b7 ETA 2249 s \u00b7 8/25 files verified\n",
    "22.8% verified \u00b7 25.2 MB/s received \u00b7 ETA 2250 s \u00b7 8/25 files verified\n",
    "22.8% verified \u00b7 31.5 MB/s received \u00b7 ETA 2257 s \u00b7 8/25 files verified\n",
    "23.0% verified \u00b7 27.6 MB/s received \u00b7 ETA 2244 s \u00b7 8/25 files verified\n",
    "23.1% verified \u00b7 28.2 MB/s received \u00b7 ETA 2236 s \u00b7 8/25 files verified\n",
    "23.1% verified \u00b7 25.7 MB/s received \u00b7 ETA 2243 s \u00b7 8/25 files verified\n",
    "23.1% verified \u00b7 28.2 MB/s received \u00b7 ETA 2249 s \u00b7 8/25 files verified\n",
    "23.2% verified \u00b7 29.2 MB/s received \u00b7 ETA 2241 s \u00b7 8/25 files verified\n",
    "23.3% verified \u00b7 27.0 MB/s received \u00b7 ETA 2238 s \u00b7 8/25 files verified\n",
    "23.3% verified \u00b7 22.3 MB/s received \u00b7 ETA 2240 s \u00b7 8/25 files verified\n",
    "23.3% verified \u00b7 11.4 MB/s received \u00b7 ETA 2246 s \u00b7 8/25 files verified\n",
    "23.4% verified \u00b7 31.0 MB/s received \u00b7 ETA 2248 s \u00b7 8/25 files verified\n",
    "23.5% verified \u00b7 20.8 MB/s received \u00b7 ETA 2240 s \u00b7 8/25 files verified\n",
    "23.5% verified \u00b7 16.6 MB/s received \u00b7 ETA 2242 s \u00b7 8/25 files verified\n",
    "23.5% verified \u00b7 26.5 MB/s received \u00b7 ETA 2248 s \u00b7 8/25 files verified\n",
    "23.7% verified \u00b7 22.3 MB/s received \u00b7 ETA 2240 s \u00b7 8/25 files verified\n",
    "23.7% verified \u00b7 21.1 MB/s received \u00b7 ETA 2242 s \u00b7 8/25 files verified\n",
    "23.8% verified \u00b7 22.7 MB/s received \u00b7 ETA 2239 s \u00b7 8/25 files verified\n",
    "23.8% verified \u00b7 23.1 MB/s received \u00b7 ETA 2245 s \u00b7 8/25 files verified\n",
    "23.8% verified \u00b7 17.2 MB/s received \u00b7 ETA 2247 s \u00b7 8/25 files verified\n",
    "23.9% verified \u00b7 27.8 MB/s received \u00b7 ETA 2243 s \u00b7 8/25 files verified\n",
    "23.9% verified \u00b7 23.0 MB/s received \u00b7 ETA 2250 s \u00b7 8/25 files verified\n",
    "24.0% verified \u00b7 22.2 MB/s received \u00b7 ETA 2247 s \u00b7 8/25 files verified\n",
    "24.0% verified \u00b7 20.1 MB/s received \u00b7 ETA 2248 s \u00b7 8/25 files verified\n",
    "24.1% verified \u00b7 23.3 MB/s received \u00b7 ETA 2245 s \u00b7 8/25 files verified\n",
    "24.1% verified \u00b7 22.9 MB/s received \u00b7 ETA 2247 s \u00b7 8/25 files verified\n",
    "24.3% verified \u00b7 23.6 MB/s received \u00b7 ETA 2234 s \u00b7 8/25 files verified\n",
    "24.3% verified \u00b7 22.3 MB/s received \u00b7 ETA 2240 s \u00b7 8/25 files verified\n",
    "24.3% verified \u00b7 23.5 MB/s received \u00b7 ETA 2246 s \u00b7 8/25 files verified\n",
    "24.3% verified \u00b7 25.2 MB/s received \u00b7 ETA 2253 s \u00b7 8/25 files verified\n",
    "24.4% verified \u00b7 26.3 MB/s received \u00b7 ETA 2249 s \u00b7 8/25 files verified\n",
    "24.5% verified \u00b7 28.8 MB/s received \u00b7 ETA 2237 s \u00b7 8/25 files verified\n",
    "24.6% verified \u00b7 26.9 MB/s received \u00b7 ETA 2233 s \u00b7 8/25 files verified\n",
    "24.6% verified \u00b7 31.7 MB/s received \u00b7 ETA 2235 s \u00b7 8/25 files verified\n",
    "24.6% verified \u00b7 27.5 MB/s received \u00b7 ETA 2241 s \u00b7 8/25 files verified\n",
    "24.7% verified \u00b7 30.7 MB/s received \u00b7 ETA 2243 s \u00b7 8/25 files verified\n",
    "24.9% verified \u00b7 30.0 MB/s received \u00b7 ETA 2225 s \u00b7 8/25 files verified\n",
    "24.9% verified \u00b7 28.2 MB/s received \u00b7 ETA 2227 s \u00b7 8/25 files verified\n",
    "25.0% verified \u00b7 28.6 MB/s received \u00b7 ETA 2224 s \u00b7 8/25 files verified\n",
    "25.0% verified \u00b7 23.5 MB/s received \u00b7 ETA 2230 s \u00b7 8/25 files verified\n",
    "25.1% verified \u00b7 34.1 MB/s received \u00b7 ETA 2222 s \u00b7 8/25 files verified\n",
    "25.2% verified \u00b7 28.4 MB/s received \u00b7 ETA 2219 s \u00b7 8/25 files verified\n",
    "25.2% verified \u00b7 29.9 MB/s received \u00b7 ETA 2225 s \u00b7 8/25 files verified\n",
    "25.2% verified \u00b7 26.2 MB/s received \u00b7 ETA 2226 s \u00b7 8/25 files verified\n",
    "25.3% verified \u00b7 27.0 MB/s received \u00b7 ETA 2218 s \u00b7 8/25 files verified\n",
    "25.4% verified \u00b7 30.1 MB/s received \u00b7 ETA 2219 s \u00b7 8/25 files verified\n",
    "25.4% verified \u00b7 29.7 MB/s received \u00b7 ETA 2221 s \u00b7 8/25 files verified\n",
    "25.5% verified \u00b7 28.6 MB/s received \u00b7 ETA 2218 s \u00b7 8/25 files verified\n",
    "25.6% verified \u00b7 28.9 MB/s received \u00b7 ETA 2210 s \u00b7 8/25 files verified\n",
    "25.6% verified \u00b7 23.6 MB/s received \u00b7 ETA 2211 s \u00b7 8/25 files verified\n",
    "25.7% verified \u00b7 31.8 MB/s received \u00b7 ETA 2212 s \u00b7 8/25 files verified\n",
    "25.8% verified \u00b7 28.2 MB/s received \u00b7 ETA 2205 s \u00b7 8/25 files verified\n",
    "25.9% verified \u00b7 30.4 MB/s received \u00b7 ETA 2202 s \u00b7 8/25 files verified\n",
    "25.9% verified \u00b7 28.6 MB/s received \u00b7 ETA 2203 s \u00b7 8/25 files verified\n",
    "25.9% verified \u00b7 24.9 MB/s received \u00b7 ETA 2204 s \u00b7 8/25 files verified\n",
    "26.0% verified \u00b7 31.2 MB/s received \u00b7 ETA 2201 s \u00b7 8/25 files verified\n",
    "26.1% verified \u00b7 29.4 MB/s received \u00b7 ETA 2193 s \u00b7 8/25 files verified\n",
    "26.1% verified \u00b7 24.7 MB/s received \u00b7 ETA 2199 s \u00b7 8/25 files verified\n",
    "26.2% verified \u00b7 30.9 MB/s received \u00b7 ETA 2196 s \u00b7 8/25 files verified\n",
    "26.2% verified \u00b7 19.0 MB/s received \u00b7 ETA 2201 s \u00b7 8/25 files verified\n",
    "26.3% verified \u00b7 22.6 MB/s received \u00b7 ETA 2194 s \u00b7 8/25 files verified\n",
    "26.4% verified \u00b7 25.4 MB/s received \u00b7 ETA 2195 s \u00b7 8/25 files verified\n",
    "26.4% verified \u00b7 26.7 MB/s received \u00b7 ETA 2192 s \u00b7 8/25 files verified\n",
    "26.5% verified \u00b7 23.0 MB/s received \u00b7 ETA 2189 s \u00b7 8/25 files verified\n",
    "26.5% verified \u00b7 27.8 MB/s received \u00b7 ETA 2194 s \u00b7 8/25 files verified\n",
    "26.5% verified \u00b7 26.4 MB/s received \u00b7 ETA 2200 s \u00b7 8/25 files verified\n",
    "26.7% verified \u00b7 29.2 MB/s received \u00b7 ETA 2184 s \u00b7 8/25 files verified\n",
    "26.8% verified \u00b7 29.2 MB/s received \u00b7 ETA 2180 s \u00b7 8/25 files verified\n",
    "26.8% verified \u00b7 24.0 MB/s received \u00b7 ETA 2186 s \u00b7 8/25 files verified\n",
    "26.8% verified \u00b7 30.2 MB/s received \u00b7 ETA 2187 s \u00b7 8/25 files verified\n",
    "26.9% verified \u00b7 28.8 MB/s received \u00b7 ETA 2188 s \u00b7 8/25 files verified\n",
    "27.0% verified \u00b7 27.5 MB/s received \u00b7 ETA 2181 s \u00b7 8/25 files verified\n",
    "27.1% verified \u00b7 29.8 MB/s received \u00b7 ETA 2169 s \u00b7 8/25 files verified\n",
    "27.1% verified \u00b7 27.7 MB/s received \u00b7 ETA 2174 s \u00b7 8/25 files verified\n",
    "27.1% verified \u00b7 23.3 MB/s received \u00b7 ETA 2180 s \u00b7 8/25 files verified\n",
    "27.2% verified \u00b7 38.0 MB/s received \u00b7 ETA 2177 s \u00b7 8/25 files verified\n",
    "27.3% verified \u00b7 29.9 MB/s received \u00b7 ETA 2169 s \u00b7 8/25 files verified\n",
    "27.4% verified \u00b7 29.1 MB/s received \u00b7 ETA 2166 s \u00b7 8/25 files verified\n",
    "27.5% verified \u00b7 28.2 MB/s received \u00b7 ETA 2167 s \u00b7 8/25 files verified\n",
    "27.5% verified \u00b7 34.9 MB/s received \u00b7 ETA 2168 s \u00b7 8/25 files verified\n",
    "27.6% verified \u00b7 31.9 MB/s received \u00b7 ETA 2161 s \u00b7 8/25 files verified\n",
    "27.7% verified \u00b7 30.1 MB/s received \u00b7 ETA 2153 s \u00b7 8/25 files verified\n",
    "27.8% verified \u00b7 26.1 MB/s received \u00b7 ETA 2150 s \u00b7 8/25 files verified\n",
    "27.9% verified \u00b7 28.5 MB/s received \u00b7 ETA 2149 s \u00b7 8/25 files verified\n",
    "27.9% verified \u00b7 16.7 MB/s received \u00b7 ETA 2152 s \u00b7 8/25 files verified\n",
    "27.9% verified \u00b7 16.0 MB/s received \u00b7 ETA 2157 s \u00b7 8/25 files verified\n",
    "27.9% verified \u00b7 17.1 MB/s received \u00b7 ETA 2158 s \u00b7 8/25 files verified\n",
    "27.9% verified \u00b7 21.3 MB/s received \u00b7 ETA 2163 s \u00b7 8/25 files verified\n",
    "28.0% verified \u00b7 15.3 MB/s received \u00b7 ETA 2165 s \u00b7 8/25 files verified\n",
    "28.0% verified \u00b7 19.9 MB/s received \u00b7 ETA 2162 s \u00b7 8/25 files verified\n",
    "28.1% verified \u00b7 23.1 MB/s received \u00b7 ETA 2155 s \u00b7 8/25 files verified\n",
    "28.1% verified \u00b7 23.1 MB/s received \u00b7 ETA 2160 s \u00b7 8/25 files verified\n",
    "28.2% verified \u00b7 26.1 MB/s received \u00b7 ETA 2158 s \u00b7 8/25 files verified\n",
    "28.3% verified \u00b7 30.4 MB/s received \u00b7 ETA 2155 s \u00b7 8/25 files verified\n",
    "28.3% verified \u00b7 29.8 MB/s received \u00b7 ETA 2154 s \u00b7 8/25 files verified\n",
    "28.4% verified \u00b7 30.7 MB/s received \u00b7 ETA 2151 s \u00b7 8/25 files verified\n",
    "28.5% verified \u00b7 30.7 MB/s received \u00b7 ETA 2149 s \u00b7 8/25 files verified\n",
    "28.5% verified \u00b7 30.5 MB/s received \u00b7 ETA 2154 s \u00b7 8/25 files verified\n",
    "28.6% verified \u00b7 28.7 MB/s received \u00b7 ETA 2147 s \u00b7 8/25 files verified\n",
    "28.8% verified \u00b7 28.4 MB/s received \u00b7 ETA 2133 s \u00b7 8/25 files verified\n",
    "28.8% verified \u00b7 30.8 MB/s received \u00b7 ETA 2138 s \u00b7 8/25 files verified\n",
    "28.9% verified \u00b7 30.6 MB/s received \u00b7 ETA 2135 s \u00b7 8/25 files verified\n",
    "verified model-00003.safetensors\n",
    "28.9% verified \u00b7 23.8 MB/s received \u00b7 ETA 2132 s \u00b7 9/25 files verified\n",
    "29.0% verified \u00b7 28.9 MB/s received \u00b7 ETA 2133 s \u00b7 9/25 files verified\n",
    "29.0% verified \u00b7 26.3 MB/s received \u00b7 ETA 2138 s \u00b7 9/25 files verified\n",
    "29.0% verified \u00b7 35.1 MB/s received \u00b7 ETA 2135 s \u00b7 9/25 files verified\n",
    "29.2% verified \u00b7 30.3 MB/s received \u00b7 ETA 2120 s \u00b7 9/25 files verified\n",
    "29.2% verified \u00b7 29.6 MB/s received \u00b7 ETA 2125 s \u00b7 9/25 files verified\n",
    "29.2% verified \u00b7 26.0 MB/s received \u00b7 ETA 2130 s \u00b7 9/25 files verified\n",
    "29.4% verified \u00b7 34.5 MB/s received \u00b7 ETA 2120 s \u00b7 9/25 files verified\n",
    "29.4% verified \u00b7 29.0 MB/s received \u00b7 ETA 2121 s \u00b7 9/25 files verified\n",
    "29.5% verified \u00b7 30.6 MB/s received \u00b7 ETA 2120 s \u00b7 9/25 files verified\n",
    "29.6% verified \u00b7 28.5 MB/s received \u00b7 ETA 2114 s \u00b7 9/25 files verified\n",
    "29.7% verified \u00b7 30.0 MB/s received \u00b7 ETA 2111 s \u00b7 9/25 files verified\n",
    "29.7% verified \u00b7 23.1 MB/s received \u00b7 ETA 2112 s \u00b7 9/25 files verified\n",
    "29.8% verified \u00b7 37.6 MB/s received \u00b7 ETA 2106 s \u00b7 9/25 files verified\n",
    "29.8% verified \u00b7 26.5 MB/s received \u00b7 ETA 2107 s \u00b7 9/25 files verified\n",
    "29.9% verified \u00b7 31.3 MB/s received \u00b7 ETA 2102 s \u00b7 9/25 files verified\n",
    "29.9% verified \u00b7 31.3 MB/s received \u00b7 ETA 2107 s \u00b7 9/25 files verified\n",
    "30.0% verified \u00b7 27.2 MB/s received \u00b7 ETA 2104 s \u00b7 9/25 files verified\n",
    "30.1% verified \u00b7 34.8 MB/s received \u00b7 ETA 2102 s \u00b7 9/25 files verified\n",
    "30.1% verified \u00b7 29.4 MB/s received \u00b7 ETA 2099 s \u00b7 9/25 files verified\n",
    "30.3% verified \u00b7 28.9 MB/s received \u00b7 ETA 2093 s \u00b7 9/25 files verified\n",
    "30.3% verified \u00b7 32.7 MB/s received \u00b7 ETA 2090 s \u00b7 9/25 files verified\n",
    "30.4% verified \u00b7 30.7 MB/s received \u00b7 ETA 2092 s \u00b7 9/25 files verified\n",
    "30.4% verified \u00b7 31.0 MB/s received \u00b7 ETA 2089 s \u00b7 9/25 files verified\n",
    "30.5% verified \u00b7 30.7 MB/s received \u00b7 ETA 2083 s \u00b7 9/25 files verified\n",
    "30.5% verified \u00b7 26.1 MB/s received \u00b7 ETA 2088 s \u00b7 9/25 files verified\n",
    "30.7% verified \u00b7 29.6 MB/s received \u00b7 ETA 2081 s \u00b7 9/25 files verified\n",
    "30.7% verified \u00b7 27.2 MB/s received \u00b7 ETA 2082 s \u00b7 9/25 files verified\n",
    "30.7% verified \u00b7 10.1 MB/s received \u00b7 ETA 2082 s \u00b7 9/25 files verified\n",
    "30.8% verified \u00b7 10.8 MB/s received \u00b7 ETA 2083 s \u00b7 9/25 files verified\n",
    "30.8% verified \u00b7 13.7 MB/s received \u00b7 ETA 2087 s \u00b7 9/25 files verified\n",
    "30.8% verified \u00b7 9.8 MB/s received \u00b7 ETA 2092 s \u00b7 9/25 files verified\n",
    "30.8% verified \u00b7 8.0 MB/s received \u00b7 ETA 2096 s \u00b7 9/25 files verified\n",
    "30.8% verified \u00b7 16.5 MB/s received \u00b7 ETA 2101 s \u00b7 9/25 files verified\n",
    "30.8% verified \u00b7 14.9 MB/s received \u00b7 ETA 2101 s \u00b7 9/25 files verified\n",
    "31.0% verified \u00b7 14.9 MB/s received \u00b7 ETA 2090 s \u00b7 9/25 files verified\n",
    "31.0% verified \u00b7 15.1 MB/s received \u00b7 ETA 2095 s \u00b7 9/25 files verified\n",
    "31.1% verified \u00b7 15.0 MB/s received \u00b7 ETA 2091 s \u00b7 9/25 files verified\n",
    "31.1% verified \u00b7 15.6 MB/s received \u00b7 ETA 2091 s \u00b7 9/25 files verified\n",
    "31.1% verified \u00b7 12.9 MB/s received \u00b7 ETA 2096 s \u00b7 9/25 files verified\n",
    "31.1% verified \u00b7 16.1 MB/s received \u00b7 ETA 2100 s \u00b7 9/25 files verified\n",
    "31.1% verified \u00b7 15.4 MB/s received \u00b7 ETA 2105 s \u00b7 9/25 files verified\n",
    "31.2% verified \u00b7 14.1 MB/s received \u00b7 ETA 2104 s \u00b7 9/25 files verified\n",
    "31.2% verified \u00b7 15.4 MB/s received \u00b7 ETA 2108 s \u00b7 9/25 files verified\n",
    "31.2% verified \u00b7 12.2 MB/s received \u00b7 ETA 2105 s \u00b7 9/25 files verified\n",
    "31.3% verified \u00b7 18.3 MB/s received \u00b7 ETA 2106 s \u00b7 9/25 files verified\n",
    "31.3% verified \u00b7 15.4 MB/s received \u00b7 ETA 2109 s \u00b7 9/25 files verified\n",
    "31.3% verified \u00b7 14.5 MB/s received \u00b7 ETA 2110 s \u00b7 9/25 files verified\n",
    "31.3% verified \u00b7 15.5 MB/s received \u00b7 ETA 2114 s \u00b7 9/25 files verified\n",
    "31.4% verified \u00b7 14.3 MB/s received \u00b7 ETA 2111 s \u00b7 9/25 files verified\n",
    "31.4% verified \u00b7 16.9 MB/s received \u00b7 ETA 2115 s \u00b7 9/25 files verified\n",
    "31.4% verified \u00b7 15.4 MB/s received \u00b7 ETA 2116 s \u00b7 9/25 files verified\n",
    "31.5% verified \u00b7 13.4 MB/s received \u00b7 ETA 2116 s \u00b7 9/25 files verified\n",
    "31.5% verified \u00b7 15.3 MB/s received \u00b7 ETA 2117 s \u00b7 9/25 files verified\n",
    "31.5% verified \u00b7 14.7 MB/s received \u00b7 ETA 2118 s \u00b7 9/25 files verified\n",
    "31.5% verified \u00b7 14.3 MB/s received \u00b7 ETA 2122 s \u00b7 9/25 files verified\n",
    "31.6% verified \u00b7 14.8 MB/s received \u00b7 ETA 2119 s \u00b7 9/25 files verified\n",
    "31.7% verified \u00b7 15.4 MB/s received \u00b7 ETA 2116 s \u00b7 9/25 files verified\n",
    "31.7% verified \u00b7 13.1 MB/s received \u00b7 ETA 2120 s \u00b7 9/25 files verified\n",
    "31.7% verified \u00b7 17.3 MB/s received \u00b7 ETA 2124 s \u00b7 9/25 files verified\n",
    "31.7% verified \u00b7 17.0 MB/s received \u00b7 ETA 2129 s \u00b7 9/25 files verified\n",
    "31.7% verified \u00b7 21.3 MB/s received \u00b7 ETA 2129 s \u00b7 9/25 files verified\n",
    "31.7% verified \u00b7 29.5 MB/s received \u00b7 ETA 2133 s \u00b7 9/25 files verified\n",
    "31.9% verified \u00b7 31.4 MB/s received \u00b7 ETA 2123 s \u00b7 9/25 files verified\n",
    "31.9% verified \u00b7 30.8 MB/s received \u00b7 ETA 2127 s \u00b7 9/25 files verified\n",
    "31.9% verified \u00b7 31.4 MB/s received \u00b7 ETA 2128 s \u00b7 9/25 files verified\n",
    "32.0% verified \u00b7 29.0 MB/s received \u00b7 ETA 2125 s \u00b7 9/25 files verified\n",
    "32.0% verified \u00b7 31.8 MB/s received \u00b7 ETA 2126 s \u00b7 9/25 files verified\n",
    "32.1% verified \u00b7 29.5 MB/s received \u00b7 ETA 2125 s \u00b7 9/25 files verified\n",
    "32.2% verified \u00b7 29.5 MB/s received \u00b7 ETA 2122 s \u00b7 9/25 files verified\n",
    "32.2% verified \u00b7 30.8 MB/s received \u00b7 ETA 2123 s \u00b7 9/25 files verified\n",
    "32.3% verified \u00b7 30.6 MB/s received \u00b7 ETA 2113 s \u00b7 9/25 files verified\n",
    "32.4% verified \u00b7 31.2 MB/s received \u00b7 ETA 2112 s \u00b7 9/25 files verified\n",
    "32.4% verified \u00b7 28.9 MB/s received \u00b7 ETA 2116 s \u00b7 9/25 files verified\n",
    "32.6% verified \u00b7 34.1 MB/s received \u00b7 ETA 2099 s \u00b7 9/25 files verified\n",
    "32.7% verified \u00b7 23.0 MB/s received \u00b7 ETA 2100 s \u00b7 9/25 files verified\n",
    "32.8% verified \u00b7 14.8 MB/s received \u00b7 ETA 2090 s \u00b7 9/25 files verified\n",
    "32.8% verified \u00b7 13.2 MB/s received \u00b7 ETA 2091 s \u00b7 9/25 files verified\n",
    "32.9% verified \u00b7 20.4 MB/s received \u00b7 ETA 2088 s \u00b7 9/25 files verified\n",
    "32.9% verified \u00b7 15.1 MB/s received \u00b7 ETA 2088 s \u00b7 9/25 files verified\n",
    "33.0% verified \u00b7 13.6 MB/s received \u00b7 ETA 2084 s \u00b7 9/25 files verified\n",
    "33.1% verified \u00b7 14.4 MB/s received \u00b7 ETA 2085 s \u00b7 9/25 files verified\n",
    "33.1% verified \u00b7 14.1 MB/s received \u00b7 ETA 2089 s \u00b7 9/25 files verified\n",
    "33.1% verified \u00b7 12.4 MB/s received \u00b7 ETA 2093 s \u00b7 9/25 files verified\n",
    "33.1% verified \u00b7 15.1 MB/s received \u00b7 ETA 2097 s \u00b7 9/25 files verified\n",
    "33.1% verified \u00b7 14.7 MB/s received \u00b7 ETA 2101 s \u00b7 9/25 files verified\n",
    "33.1% verified \u00b7 14.4 MB/s received \u00b7 ETA 2101 s \u00b7 9/25 files verified\n",
    "33.1% verified \u00b7 14.7 MB/s received \u00b7 ETA 2102 s \u00b7 9/25 files verified\n",
    "33.2% verified \u00b7 14.6 MB/s received \u00b7 ETA 2098 s \u00b7 9/25 files verified\n",
    "33.3% verified \u00b7 15.7 MB/s received \u00b7 ETA 2099 s \u00b7 9/25 files verified\n",
    "33.3% verified \u00b7 15.5 MB/s received \u00b7 ETA 2099 s \u00b7 9/25 files verified\n",
    "33.3% verified \u00b7 15.6 MB/s received \u00b7 ETA 2103 s \u00b7 9/25 files verified\n",
    "33.4% verified \u00b7 15.5 MB/s received \u00b7 ETA 2099 s \u00b7 9/25 files verified\n",
    "33.4% verified \u00b7 26.3 MB/s received \u00b7 ETA 2103 s \u00b7 9/25 files verified\n",
    "33.5% verified \u00b7 29.8 MB/s received \u00b7 ETA 2096 s \u00b7 9/25 files verified\n",
    "33.6% verified \u00b7 29.1 MB/s received \u00b7 ETA 2092 s \u00b7 9/25 files verified\n",
    "33.6% verified \u00b7 30.8 MB/s received \u00b7 ETA 2096 s \u00b7 9/25 files verified\n",
    "33.7% verified \u00b7 28.5 MB/s received \u00b7 ETA 2093 s \u00b7 9/25 files verified\n",
    "33.8% verified \u00b7 29.2 MB/s received \u00b7 ETA 2082 s \u00b7 9/25 files verified\n",
    "33.8% verified \u00b7 23.8 MB/s received \u00b7 ETA 2086 s \u00b7 9/25 files verified\n",
    "33.8% verified \u00b7 36.7 MB/s received \u00b7 ETA 2090 s \u00b7 9/25 files verified\n",
    "33.9% verified \u00b7 29.0 MB/s received \u00b7 ETA 2087 s \u00b7 9/25 files verified\n",
    "34.0% verified \u00b7 27.6 MB/s received \u00b7 ETA 2076 s \u00b7 9/25 files verified\n",
    "34.1% verified \u00b7 28.9 MB/s received \u00b7 ETA 2072 s \u00b7 9/25 files verified\n",
    "34.1% verified \u00b7 29.6 MB/s received \u00b7 ETA 2075 s \u00b7 9/25 files verified\n",
    "34.2% verified \u00b7 28.1 MB/s received \u00b7 ETA 2072 s \u00b7 9/25 files verified\n",
    "34.3% verified \u00b7 36.4 MB/s received \u00b7 ETA 2068 s \u00b7 9/25 files verified\n",
    "34.4% verified \u00b7 32.1 MB/s received \u00b7 ETA 2068 s \u00b7 9/25 files verified\n",
    "34.4% verified \u00b7 25.8 MB/s received \u00b7 ETA 2068 s \u00b7 9/25 files verified\n",
    "34.5% verified \u00b7 32.2 MB/s received \u00b7 ETA 2058 s \u00b7 9/25 files verified\n",
    "34.5% verified \u00b7 32.4 MB/s received \u00b7 ETA 2062 s \u00b7 9/25 files verified\n",
    "34.6% verified \u00b7 31.9 MB/s received \u00b7 ETA 2058 s \u00b7 9/25 files verified\n",
    "34.7% verified \u00b7 31.0 MB/s received \u00b7 ETA 2055 s \u00b7 9/25 files verified\n",
    "34.8% verified \u00b7 17.2 MB/s received \u00b7 ETA 2052 s \u00b7 9/25 files verified\n",
    "34.8% verified \u00b7 12.4 MB/s received \u00b7 ETA 2052 s \u00b7 9/25 files verified\n",
    "34.8% verified \u00b7 14.3 MB/s received \u00b7 ETA 2056 s \u00b7 9/25 files verified\n",
    "34.9% verified \u00b7 17.6 MB/s received \u00b7 ETA 2056 s \u00b7 9/25 files verified\n",
    "34.9% verified \u00b7 15.7 MB/s received \u00b7 ETA 2053 s \u00b7 9/25 files verified\n",
    "34.9% verified \u00b7 14.2 MB/s received \u00b7 ETA 2056 s \u00b7 9/25 files verified\n",
    "35.0% verified \u00b7 17.3 MB/s received \u00b7 ETA 2057 s \u00b7 9/25 files verified\n",
    "35.0% verified \u00b7 14.2 MB/s received \u00b7 ETA 2057 s \u00b7 9/25 files verified\n",
    "35.0% verified \u00b7 11.5 MB/s received \u00b7 ETA 2057 s \u00b7 9/25 files verified\n",
    "35.0% verified \u00b7 13.8 MB/s received \u00b7 ETA 2061 s \u00b7 9/25 files verified\n",
    "35.0% verified \u00b7 17.2 MB/s received \u00b7 ETA 2064 s \u00b7 9/25 files verified\n",
    "35.1% verified \u00b7 15.5 MB/s received \u00b7 ETA 2061 s \u00b7 9/25 files verified\n",
    "35.2% verified \u00b7 15.5 MB/s received \u00b7 ETA 2061 s \u00b7 9/25 files verified\n",
    "35.2% verified \u00b7 13.9 MB/s received \u00b7 ETA 2065 s \u00b7 9/25 files verified\n",
    "35.2% verified \u00b7 14.9 MB/s received \u00b7 ETA 2065 s \u00b7 9/25 files verified\n",
    "35.3% verified \u00b7 13.6 MB/s received \u00b7 ETA 2062 s \u00b7 9/25 files verified\n",
    "35.3% verified \u00b7 21.2 MB/s received \u00b7 ETA 2062 s \u00b7 9/25 files verified\n",
    "35.3% verified \u00b7 29.9 MB/s received \u00b7 ETA 2066 s \u00b7 9/25 files verified\n",
    "35.4% verified \u00b7 31.8 MB/s received \u00b7 ETA 2059 s \u00b7 9/25 files verified\n",
    "35.6% verified \u00b7 30.6 MB/s received \u00b7 ETA 2052 s \u00b7 9/25 files verified\n",
    "35.6% verified \u00b7 27.9 MB/s received \u00b7 ETA 2056 s \u00b7 9/25 files verified\n",
    "35.6% verified \u00b7 27.8 MB/s received \u00b7 ETA 2052 s \u00b7 9/25 files verified\n",
    "35.7% verified \u00b7 27.8 MB/s received \u00b7 ETA 2049 s \u00b7 9/25 files verified\n",
    "35.8% verified \u00b7 31.5 MB/s received \u00b7 ETA 2046 s \u00b7 9/25 files verified\n",
    "35.8% verified \u00b7 31.9 MB/s received \u00b7 ETA 2049 s \u00b7 9/25 files verified\n",
    "35.9% verified \u00b7 31.4 MB/s received \u00b7 ETA 2042 s \u00b7 9/25 files verified\n",
    "36.0% verified \u00b7 30.4 MB/s received \u00b7 ETA 2039 s \u00b7 9/25 files verified\n",
    "36.1% verified \u00b7 31.5 MB/s received \u00b7 ETA 2036 s \u00b7 9/25 files verified\n",
    "36.1% verified \u00b7 31.0 MB/s received \u00b7 ETA 2036 s \u00b7 9/25 files verified\n",
    "36.2% verified \u00b7 24.5 MB/s received \u00b7 ETA 2033 s \u00b7 9/25 files verified\n",
    "36.3% verified \u00b7 35.8 MB/s received \u00b7 ETA 2029 s \u00b7 9/25 files verified\n",
    "36.3% verified \u00b7 30.2 MB/s received \u00b7 ETA 2026 s \u00b7 9/25 files verified\n",
    "36.4% verified \u00b7 30.5 MB/s received \u00b7 ETA 2023 s \u00b7 9/25 files verified\n",
    "36.5% verified \u00b7 31.0 MB/s received \u00b7 ETA 2019 s \u00b7 9/25 files verified\n",
    "36.5% verified \u00b7 15.2 MB/s received \u00b7 ETA 2023 s \u00b7 9/25 files verified\n",
    "36.6% verified \u00b7 15.9 MB/s received \u00b7 ETA 2020 s \u00b7 9/25 files verified\n",
    "36.6% verified \u00b7 15.6 MB/s received \u00b7 ETA 2016 s \u00b7 9/25 files verified\n",
    "36.6% verified \u00b7 17.3 MB/s received \u00b7 ETA 2020 s \u00b7 9/25 files verified\n",
    "36.7% verified \u00b7 13.3 MB/s received \u00b7 ETA 2020 s \u00b7 9/25 files verified\n",
    "36.7% verified \u00b7 16.4 MB/s received \u00b7 ETA 2023 s \u00b7 9/25 files verified\n",
    "36.7% verified \u00b7 15.0 MB/s received \u00b7 ETA 2027 s \u00b7 9/25 files verified\n",
    "36.7% verified \u00b7 15.3 MB/s received \u00b7 ETA 2030 s \u00b7 9/25 files verified\n",
    "36.8% verified \u00b7 15.2 MB/s received \u00b7 ETA 2024 s \u00b7 9/25 files verified\n",
    "36.8% verified \u00b7 14.1 MB/s received \u00b7 ETA 2024 s \u00b7 9/25 files verified\n",
    "36.9% verified \u00b7 15.0 MB/s received \u00b7 ETA 2024 s \u00b7 9/25 files verified\n",
    "36.9% verified \u00b7 14.8 MB/s received \u00b7 ETA 2024 s \u00b7 9/25 files verified\n",
    "36.9% verified \u00b7 15.8 MB/s received \u00b7 ETA 2028 s \u00b7 9/25 files verified\n",
    "37.0% verified \u00b7 15.6 MB/s received \u00b7 ETA 2025 s \u00b7 9/25 files verified\n",
    "37.0% verified \u00b7 14.8 MB/s received \u00b7 ETA 2025 s \u00b7 9/25 files verified\n",
    "37.0% verified \u00b7 30.1 MB/s received \u00b7 ETA 2028 s \u00b7 9/25 files verified\n",
    "37.1% verified \u00b7 32.3 MB/s received \u00b7 ETA 2025 s \u00b7 9/25 files verified\n",
    "37.3% verified \u00b7 30.1 MB/s received \u00b7 ETA 2014 s \u00b7 9/25 files verified\n",
    "37.3% verified \u00b7 31.3 MB/s received \u00b7 ETA 2014 s \u00b7 9/25 files verified\n",
    "37.3% verified \u00b7 31.3 MB/s received \u00b7 ETA 2014 s \u00b7 9/25 files verified\n",
    "37.4% verified \u00b7 31.0 MB/s received \u00b7 ETA 2011 s \u00b7 9/25 files verified\n",
    "37.5% verified \u00b7 32.5 MB/s received \u00b7 ETA 2008 s \u00b7 9/25 files verified\n",
    "37.6% verified \u00b7 31.2 MB/s received \u00b7 ETA 2005 s \u00b7 9/25 files verified\n",
    "37.6% verified \u00b7 24.5 MB/s received \u00b7 ETA 2005 s \u00b7 9/25 files verified\n",
    "37.7% verified \u00b7 36.0 MB/s received \u00b7 ETA 1999 s \u00b7 9/25 files verified\n",
    "verified model-00004.safetensors\n",
    "37.8% verified \u00b7 28.9 MB/s received \u00b7 ETA 1996 s \u00b7 10/25 files verified\n",
    "37.8% verified \u00b7 31.4 MB/s received \u00b7 ETA 1996 s \u00b7 10/25 files verified\n",
    "37.9% verified \u00b7 31.2 MB/s received \u00b7 ETA 1993 s \u00b7 10/25 files verified\n",
    "38.0% verified \u00b7 32.1 MB/s received \u00b7 ETA 1986 s \u00b7 10/25 files verified\n",
    "38.1% verified \u00b7 32.1 MB/s received \u00b7 ETA 1983 s \u00b7 10/25 files verified\n",
    "38.1% verified \u00b7 25.0 MB/s received \u00b7 ETA 1983 s \u00b7 10/25 files verified\n",
    "38.1% verified \u00b7 31.2 MB/s received \u00b7 ETA 1986 s \u00b7 10/25 files verified\n",
    "38.2% verified \u00b7 31.3 MB/s received \u00b7 ETA 1980 s \u00b7 10/25 files verified\n",
    "38.3% verified \u00b7 14.4 MB/s received \u00b7 ETA 1977 s \u00b7 10/25 files verified\n",
    "38.4% verified \u00b7 17.7 MB/s received \u00b7 ETA 1975 s \u00b7 10/25 files verified\n",
    "38.4% verified \u00b7 13.8 MB/s received \u00b7 ETA 1975 s \u00b7 10/25 files verified\n",
    "38.4% verified \u00b7 15.3 MB/s received \u00b7 ETA 1978 s \u00b7 10/25 files verified\n",
    "38.4% verified \u00b7 16.0 MB/s received \u00b7 ETA 1980 s \u00b7 10/25 files verified\n",
    "38.5% verified \u00b7 15.4 MB/s received \u00b7 ETA 1980 s \u00b7 10/25 files verified\n",
    "38.5% verified \u00b7 15.2 MB/s received \u00b7 ETA 1983 s \u00b7 10/25 files verified\n",
    "38.5% verified \u00b7 15.0 MB/s received \u00b7 ETA 1986 s \u00b7 10/25 files verified\n",
    "38.6% verified \u00b7 17.3 MB/s received \u00b7 ETA 1980 s \u00b7 10/25 files verified\n",
    "38.6% verified \u00b7 31.5 MB/s received \u00b7 ETA 1980 s \u00b7 10/25 files verified\n",
    "38.7% verified \u00b7 32.2 MB/s received \u00b7 ETA 1974 s \u00b7 10/25 files verified\n",
    "38.8% verified \u00b7 26.4 MB/s received \u00b7 ETA 1971 s \u00b7 10/25 files verified\n",
    "38.9% verified \u00b7 32.0 MB/s received \u00b7 ETA 1967 s \u00b7 10/25 files verified\n",
    "38.9% verified \u00b7 24.4 MB/s received \u00b7 ETA 1970 s \u00b7 10/25 files verified\n",
    "39.0% verified \u00b7 34.4 MB/s received \u00b7 ETA 1967 s \u00b7 10/25 files verified\n",
    "39.0% verified \u00b7 29.6 MB/s received \u00b7 ETA 1964 s \u00b7 10/25 files verified\n",
    "39.1% verified \u00b7 33.7 MB/s received \u00b7 ETA 1961 s \u00b7 10/25 files verified\n",
    "39.2% verified \u00b7 31.7 MB/s received \u00b7 ETA 1958 s \u00b7 10/25 files verified\n",
    "39.3% verified \u00b7 30.2 MB/s received \u00b7 ETA 1955 s \u00b7 10/25 files verified\n",
    "39.4% verified \u00b7 26.9 MB/s received \u00b7 ETA 1951 s \u00b7 10/25 files verified\n",
    "39.4% verified \u00b7 30.6 MB/s received \u00b7 ETA 1948 s \u00b7 10/25 files verified\n",
    "39.4% verified \u00b7 25.0 MB/s received \u00b7 ETA 1951 s \u00b7 10/25 files verified\n",
    "39.4% verified \u00b7 30.7 MB/s received \u00b7 ETA 1954 s \u00b7 10/25 files verified\n",
    "39.6% verified \u00b7 32.5 MB/s received \u00b7 ETA 1943 s \u00b7 10/25 files verified\n",
    "39.7% verified \u00b7 14.7 MB/s received \u00b7 ETA 1940 s \u00b7 10/25 files verified\n",
    "39.7% verified \u00b7 11.4 MB/s received \u00b7 ETA 1943 s \u00b7 10/25 files verified\n",
    "39.7% verified \u00b7 22.5 MB/s received \u00b7 ETA 1946 s \u00b7 10/25 files verified\n",
    "39.7% verified \u00b7 15.7 MB/s received \u00b7 ETA 1944 s \u00b7 10/25 files verified\n",
    "39.8% verified \u00b7 13.4 MB/s received \u00b7 ETA 1942 s \u00b7 10/25 files verified\n",
    "39.8% verified \u00b7 14.8 MB/s received \u00b7 ETA 1945 s \u00b7 10/25 files verified\n",
    "39.8% verified \u00b7 15.1 MB/s received \u00b7 ETA 1948 s \u00b7 10/25 files verified\n",
    "39.9% verified \u00b7 16.0 MB/s received \u00b7 ETA 1945 s \u00b7 10/25 files verified\n",
    "39.9% verified \u00b7 15.6 MB/s received \u00b7 ETA 1948 s \u00b7 10/25 files verified\n",
    "40.0% verified \u00b7 15.5 MB/s received \u00b7 ETA 1942 s \u00b7 10/25 files verified\n",
    "40.0% verified \u00b7 15.2 MB/s received \u00b7 ETA 1942 s \u00b7 10/25 files verified\n",
    "40.0% verified \u00b7 14.8 MB/s received \u00b7 ETA 1945 s \u00b7 10/25 files verified\n",
    "40.1% verified \u00b7 14.3 MB/s received \u00b7 ETA 1945 s \u00b7 10/25 files verified\n",
    "40.1% verified \u00b7 15.3 MB/s received \u00b7 ETA 1948 s \u00b7 10/25 files verified\n",
    "40.1% verified \u00b7 16.0 MB/s received \u00b7 ETA 1951 s \u00b7 10/25 files verified\n",
    "40.2% verified \u00b7 15.2 MB/s received \u00b7 ETA 1945 s \u00b7 10/25 files verified\n",
    "40.2% verified \u00b7 14.4 MB/s received \u00b7 ETA 1943 s \u00b7 10/25 files verified\n",
    "40.3% verified \u00b7 17.5 MB/s received \u00b7 ETA 1943 s \u00b7 10/25 files verified\n",
    "40.3% verified \u00b7 25.4 MB/s received \u00b7 ETA 1940 s \u00b7 10/25 files verified\n",
    "40.3% verified \u00b7 28.5 MB/s received \u00b7 ETA 1943 s \u00b7 10/25 files verified\n",
    "40.4% verified \u00b7 32.0 MB/s received \u00b7 ETA 1943 s \u00b7 10/25 files verified\n",
    "40.5% verified \u00b7 32.2 MB/s received \u00b7 ETA 1937 s \u00b7 10/25 files verified\n",
    "40.6% verified \u00b7 29.8 MB/s received \u00b7 ETA 1929 s \u00b7 10/25 files verified\n",
    "40.6% verified \u00b7 30.3 MB/s received \u00b7 ETA 1932 s \u00b7 10/25 files verified\n",
    "40.6% verified \u00b7 24.4 MB/s received \u00b7 ETA 1935 s \u00b7 10/25 files verified\n",
    "40.7% verified \u00b7 28.1 MB/s received \u00b7 ETA 1930 s \u00b7 10/25 files verified\n",
    "40.8% verified \u00b7 27.6 MB/s received \u00b7 ETA 1927 s \u00b7 10/25 files verified\n",
    "40.9% verified \u00b7 30.2 MB/s received \u00b7 ETA 1919 s \u00b7 10/25 files verified\n",
    "40.9% verified \u00b7 27.5 MB/s received \u00b7 ETA 1922 s \u00b7 10/25 files verified\n",
    "41.0% verified \u00b7 28.6 MB/s received \u00b7 ETA 1922 s \u00b7 10/25 files verified\n",
    "41.1% verified \u00b7 30.6 MB/s received \u00b7 ETA 1916 s \u00b7 10/25 files verified\n",
    "41.2% verified \u00b7 29.4 MB/s received \u00b7 ETA 1910 s \u00b7 10/25 files verified\n",
    "41.2% verified \u00b7 31.5 MB/s received \u00b7 ETA 1911 s \u00b7 10/25 files verified\n",
    "41.3% verified \u00b7 31.2 MB/s received \u00b7 ETA 1909 s \u00b7 10/25 files verified\n",
    "41.3% verified \u00b7 30.2 MB/s received \u00b7 ETA 1911 s \u00b7 10/25 files verified\n",
    "41.4% verified \u00b7 28.7 MB/s received \u00b7 ETA 1903 s \u00b7 10/25 files verified\n",
    "41.5% verified \u00b7 22.7 MB/s received \u00b7 ETA 1897 s \u00b7 10/25 files verified\n",
    "41.5% verified \u00b7 31.5 MB/s received \u00b7 ETA 1899 s \u00b7 10/25 files verified\n",
    "41.6% verified \u00b7 27.2 MB/s received \u00b7 ETA 1895 s \u00b7 10/25 files verified\n",
    "41.7% verified \u00b7 28.5 MB/s received \u00b7 ETA 1889 s \u00b7 10/25 files verified\n",
    "41.8% verified \u00b7 24.2 MB/s received \u00b7 ETA 1889 s \u00b7 10/25 files verified\n",
    "41.8% verified \u00b7 27.3 MB/s received \u00b7 ETA 1892 s \u00b7 10/25 files verified\n",
    "41.8% verified \u00b7 18.0 MB/s received \u00b7 ETA 1895 s \u00b7 10/25 files verified\n",
    "41.8% verified \u00b7 13.9 MB/s received \u00b7 ETA 1898 s \u00b7 10/25 files verified\n",
    "41.9% verified \u00b7 17.4 MB/s received \u00b7 ETA 1895 s \u00b7 10/25 files verified\n",
    "41.9% verified \u00b7 16.0 MB/s received \u00b7 ETA 1892 s \u00b7 10/25 files verified\n",
    "42.0% verified \u00b7 15.0 MB/s received \u00b7 ETA 1892 s \u00b7 10/25 files verified\n",
    "42.0% verified \u00b7 13.9 MB/s received \u00b7 ETA 1889 s \u00b7 10/25 files verified\n",
    "42.1% verified \u00b7 14.9 MB/s received \u00b7 ETA 1888 s \u00b7 10/25 files verified\n",
    "42.1% verified \u00b7 14.9 MB/s received \u00b7 ETA 1891 s \u00b7 10/25 files verified\n",
    "42.1% verified \u00b7 16.0 MB/s received \u00b7 ETA 1892 s \u00b7 10/25 files verified\n",
    "42.1% verified \u00b7 15.0 MB/s received \u00b7 ETA 1895 s \u00b7 10/25 files verified\n",
    "42.2% verified \u00b7 14.0 MB/s received \u00b7 ETA 1889 s \u00b7 10/25 files verified\n",
    "42.2% verified \u00b7 16.0 MB/s received \u00b7 ETA 1892 s \u00b7 10/25 files verified\n",
    "42.3% verified \u00b7 15.9 MB/s received \u00b7 ETA 1892 s \u00b7 10/25 files verified\n",
    "42.3% verified \u00b7 15.2 MB/s received \u00b7 ETA 1894 s \u00b7 10/25 files verified\n",
    "42.3% verified \u00b7 14.7 MB/s received \u00b7 ETA 1894 s \u00b7 10/25 files verified\n",
    "42.3% verified \u00b7 21.4 MB/s received \u00b7 ETA 1894 s \u00b7 10/25 files verified\n",
    "42.4% verified \u00b7 28.0 MB/s received \u00b7 ETA 1888 s \u00b7 10/25 files verified\n",
    "42.5% verified \u00b7 27.9 MB/s received \u00b7 ETA 1885 s \u00b7 10/25 files verified\n",
    "42.5% verified \u00b7 28.6 MB/s received \u00b7 ETA 1885 s \u00b7 10/25 files verified\n",
    "42.6% verified \u00b7 30.4 MB/s received \u00b7 ETA 1881 s \u00b7 10/25 files verified\n",
    "42.7% verified \u00b7 28.7 MB/s received \u00b7 ETA 1878 s \u00b7 10/25 files verified\n",
    "42.7% verified \u00b7 26.7 MB/s received \u00b7 ETA 1878 s \u00b7 10/25 files verified\n",
    "42.8% verified \u00b7 22.4 MB/s received \u00b7 ETA 1878 s \u00b7 10/25 files verified\n",
    "42.9% verified \u00b7 39.8 MB/s received \u00b7 ETA 1875 s \u00b7 10/25 files verified\n",
    "43.0% verified \u00b7 30.0 MB/s received \u00b7 ETA 1869 s \u00b7 10/25 files verified\n",
    "43.1% verified \u00b7 25.9 MB/s received \u00b7 ETA 1861 s \u00b7 10/25 files verified\n",
    "43.1% verified \u00b7 22.0 MB/s received \u00b7 ETA 1861 s \u00b7 10/25 files verified\n",
    "43.2% verified \u00b7 29.1 MB/s received \u00b7 ETA 1863 s \u00b7 10/25 files verified\n",
    "43.2% verified \u00b7 22.4 MB/s received \u00b7 ETA 1861 s \u00b7 10/25 files verified\n",
    "43.3% verified \u00b7 34.6 MB/s received \u00b7 ETA 1860 s \u00b7 10/25 files verified\n",
    "43.3% verified \u00b7 28.6 MB/s received \u00b7 ETA 1857 s \u00b7 10/25 files verified\n",
    "43.4% verified \u00b7 27.3 MB/s received \u00b7 ETA 1857 s \u00b7 10/25 files verified\n",
    "43.4% verified \u00b7 30.2 MB/s received \u00b7 ETA 1857 s \u00b7 10/25 files verified\n",
    "43.5% verified \u00b7 15.8 MB/s received \u00b7 ETA 1849 s \u00b7 10/25 files verified\n",
    "43.6% verified \u00b7 8.1 MB/s received \u00b7 ETA 1848 s \u00b7 10/25 files verified\n",
    "43.6% verified \u00b7 19.2 MB/s received \u00b7 ETA 1851 s \u00b7 10/25 files verified\n",
    "43.6% verified \u00b7 18.3 MB/s received \u00b7 ETA 1852 s \u00b7 10/25 files verified\n",
    "43.6% verified \u00b7 14.7 MB/s received \u00b7 ETA 1855 s \u00b7 10/25 files verified\n",
    "43.6% verified \u00b7 15.9 MB/s received \u00b7 ETA 1857 s \u00b7 10/25 files verified\n",
    "43.7% verified \u00b7 16.6 MB/s received \u00b7 ETA 1854 s \u00b7 10/25 files verified\n",
    "43.7% verified \u00b7 15.1 MB/s received \u00b7 ETA 1854 s \u00b7 10/25 files verified\n",
    "43.7% verified \u00b7 15.3 MB/s received \u00b7 ETA 1854 s \u00b7 10/25 files verified\n",
    "43.8% verified \u00b7 15.0 MB/s received \u00b7 ETA 1851 s \u00b7 10/25 files verified\n",
    "43.9% verified \u00b7 15.9 MB/s received \u00b7 ETA 1851 s \u00b7 10/25 files verified\n",
    "43.9% verified \u00b7 15.3 MB/s received \u00b7 ETA 1854 s \u00b7 10/25 files verified\n",
    "43.9% verified \u00b7 15.1 MB/s received \u00b7 ETA 1854 s \u00b7 10/25 files verified\n",
    "43.9% verified \u00b7 14.3 MB/s received \u00b7 ETA 1853 s \u00b7 10/25 files verified\n",
    "44.0% verified \u00b7 16.0 MB/s received \u00b7 ETA 1852 s \u00b7 10/25 files verified\n",
    "44.0% verified \u00b7 15.0 MB/s received \u00b7 ETA 1851 s \u00b7 10/25 files verified\n",
    "44.1% verified \u00b7 16.1 MB/s received \u00b7 ETA 1848 s \u00b7 10/25 files verified\n",
    "44.1% verified \u00b7 14.0 MB/s received \u00b7 ETA 1850 s \u00b7 10/25 files verified\n",
    "44.1% verified \u00b7 17.6 MB/s received \u00b7 ETA 1853 s \u00b7 10/25 files verified\n",
    "44.1% verified \u00b7 17.1 MB/s received \u00b7 ETA 1853 s \u00b7 10/25 files verified\n",
    "44.2% verified \u00b7 27.7 MB/s received \u00b7 ETA 1853 s \u00b7 10/25 files verified\n",
    "44.3% verified \u00b7 28.5 MB/s received \u00b7 ETA 1847 s \u00b7 10/25 files verified\n",
    "44.4% verified \u00b7 31.5 MB/s received \u00b7 ETA 1841 s \u00b7 10/25 files verified\n",
    "44.5% verified \u00b7 29.5 MB/s received \u00b7 ETA 1838 s \u00b7 10/25 files verified\n",
    "44.5% verified \u00b7 29.9 MB/s received \u00b7 ETA 1839 s \u00b7 10/25 files verified\n",
    "44.5% verified \u00b7 31.7 MB/s received \u00b7 ETA 1842 s \u00b7 10/25 files verified\n",
    "44.6% verified \u00b7 33.0 MB/s received \u00b7 ETA 1834 s \u00b7 10/25 files verified\n",
    "44.7% verified \u00b7 27.8 MB/s received \u00b7 ETA 1831 s \u00b7 10/25 files verified\n",
    "44.8% verified \u00b7 29.5 MB/s received \u00b7 ETA 1828 s \u00b7 10/25 files verified\n",
    "44.8% verified \u00b7 32.4 MB/s received \u00b7 ETA 1827 s \u00b7 10/25 files verified\n",
    "44.9% verified \u00b7 31.8 MB/s received \u00b7 ETA 1823 s \u00b7 10/25 files verified\n",
    "45.0% verified \u00b7 30.6 MB/s received \u00b7 ETA 1820 s \u00b7 10/25 files verified\n",
    "45.1% verified \u00b7 25.4 MB/s received \u00b7 ETA 1817 s \u00b7 10/25 files verified\n",
    "45.1% verified \u00b7 31.7 MB/s received \u00b7 ETA 1819 s \u00b7 10/25 files verified\n",
    "45.2% verified \u00b7 31.2 MB/s received \u00b7 ETA 1814 s \u00b7 10/25 files verified\n",
    "45.3% verified \u00b7 28.6 MB/s received \u00b7 ETA 1808 s \u00b7 10/25 files verified\n",
    "45.3% verified \u00b7 28.5 MB/s received \u00b7 ETA 1805 s \u00b7 10/25 files verified\n",
    "45.3% verified \u00b7 27.4 MB/s received \u00b7 ETA 1808 s \u00b7 10/25 files verified\n",
    "45.4% verified \u00b7 28.1 MB/s received \u00b7 ETA 1806 s \u00b7 10/25 files verified\n",
    "45.5% verified \u00b7 30.6 MB/s received \u00b7 ETA 1803 s \u00b7 10/25 files verified\n",
    "45.5% verified \u00b7 30.3 MB/s received \u00b7 ETA 1800 s \u00b7 10/25 files verified\n",
    "45.7% verified \u00b7 29.0 MB/s received \u00b7 ETA 1795 s \u00b7 10/25 files verified\n",
    "45.7% verified \u00b7 17.5 MB/s received \u00b7 ETA 1794 s \u00b7 10/25 files verified\n",
    "45.7% verified \u00b7 16.3 MB/s received \u00b7 ETA 1797 s \u00b7 10/25 files verified\n",
    "45.8% verified \u00b7 13.8 MB/s received \u00b7 ETA 1794 s \u00b7 10/25 files verified\n",
    "45.8% verified \u00b7 15.6 MB/s received \u00b7 ETA 1796 s \u00b7 10/25 files verified\n",
    "45.8% verified \u00b7 16.2 MB/s received \u00b7 ETA 1795 s \u00b7 10/25 files verified\n",
    "45.8% verified \u00b7 13.8 MB/s received \u00b7 ETA 1797 s \u00b7 10/25 files verified\n",
    "45.9% verified \u00b7 16.0 MB/s received \u00b7 ETA 1791 s \u00b7 10/25 files verified\n",
    "45.9% verified \u00b7 16.4 MB/s received \u00b7 ETA 1794 s \u00b7 10/25 files verified\n",
    "45.9% verified \u00b7 15.5 MB/s received \u00b7 ETA 1796 s \u00b7 10/25 files verified\n",
    "46.0% verified \u00b7 15.7 MB/s received \u00b7 ETA 1791 s \u00b7 10/25 files verified\n",
    "46.0% verified \u00b7 15.7 MB/s received \u00b7 ETA 1793 s \u00b7 10/25 files verified\n",
    "46.0% verified \u00b7 13.4 MB/s received \u00b7 ETA 1795 s \u00b7 10/25 files verified\n",
    "46.1% verified \u00b7 13.1 MB/s received \u00b7 ETA 1795 s \u00b7 10/25 files verified\n",
    "46.1% verified \u00b7 15.8 MB/s received \u00b7 ETA 1795 s \u00b7 10/25 files verified\n",
    "46.1% verified \u00b7 15.6 MB/s received \u00b7 ETA 1797 s \u00b7 10/25 files verified\n",
    "46.2% verified \u00b7 17.5 MB/s received \u00b7 ETA 1792 s \u00b7 10/25 files verified\n",
    "46.3% verified \u00b7 26.8 MB/s received \u00b7 ETA 1791 s \u00b7 10/25 files verified\n",
    "46.4% verified \u00b7 31.6 MB/s received \u00b7 ETA 1784 s \u00b7 10/25 files verified\n",
    "46.4% verified \u00b7 30.3 MB/s received \u00b7 ETA 1787 s \u00b7 10/25 files verified\n",
    "46.4% verified \u00b7 33.2 MB/s received \u00b7 ETA 1789 s \u00b7 10/25 files verified\n",
    "46.5% verified \u00b7 30.2 MB/s received \u00b7 ETA 1781 s \u00b7 10/25 files verified\n",
    "46.7% verified \u00b7 29.6 MB/s received \u00b7 ETA 1773 s \u00b7 10/25 files verified\n",
    "46.7% verified \u00b7 32.2 MB/s received \u00b7 ETA 1775 s \u00b7 10/25 files verified\n",
    "46.8% verified \u00b7 30.2 MB/s received \u00b7 ETA 1771 s \u00b7 10/25 files verified\n",
    "46.9% verified \u00b7 32.4 MB/s received \u00b7 ETA 1765 s \u00b7 10/25 files verified\n",
    "46.9% verified \u00b7 27.1 MB/s received \u00b7 ETA 1768 s \u00b7 10/25 files verified\n",
    "46.9% verified \u00b7 31.1 MB/s received \u00b7 ETA 1770 s \u00b7 10/25 files verified\n",
    "47.1% verified \u00b7 29.4 MB/s received \u00b7 ETA 1759 s \u00b7 10/25 files verified\n",
    "47.1% verified \u00b7 28.5 MB/s received \u00b7 ETA 1761 s \u00b7 10/25 files verified\n",
    "47.1% verified \u00b7 28.7 MB/s received \u00b7 ETA 1758 s \u00b7 10/25 files verified\n",
    "47.3% verified \u00b7 25.9 MB/s received \u00b7 ETA 1751 s \u00b7 10/25 files verified\n",
    "47.4% verified \u00b7 26.0 MB/s received \u00b7 ETA 1745 s \u00b7 10/25 files verified\n",
    "47.4% verified \u00b7 19.6 MB/s received \u00b7 ETA 1747 s \u00b7 10/25 files verified\n",
    "verified model-00005.safetensors\n",
    "47.4% verified \u00b7 36.9 MB/s received \u00b7 ETA 1748 s \u00b7 11/25 files verified\n",
    "47.4% verified \u00b7 14.0 MB/s received \u00b7 ETA 1751 s \u00b7 11/25 files verified\n",
    "47.4% verified \u00b7 15.7 MB/s received \u00b7 ETA 1753 s \u00b7 11/25 files verified\n",
    "47.5% verified \u00b7 9.2 MB/s received \u00b7 ETA 1750 s \u00b7 11/25 files verified\n",
    "47.6% verified \u00b7 19.1 MB/s received \u00b7 ETA 1747 s \u00b7 11/25 files verified\n",
    "47.6% verified \u00b7 11.6 MB/s received \u00b7 ETA 1749 s \u00b7 11/25 files verified\n",
    "47.6% verified \u00b7 16.8 MB/s received \u00b7 ETA 1749 s \u00b7 11/25 files verified\n",
    "47.6% verified \u00b7 12.5 MB/s received \u00b7 ETA 1751 s \u00b7 11/25 files verified\n",
    "47.6% verified \u00b7 13.5 MB/s received \u00b7 ETA 1751 s \u00b7 11/25 files verified\n",
    "47.7% verified \u00b7 14.1 MB/s received \u00b7 ETA 1748 s \u00b7 11/25 files verified\n",
    "47.7% verified \u00b7 15.4 MB/s received \u00b7 ETA 1748 s \u00b7 11/25 files verified\n",
    "47.8% verified \u00b7 13.9 MB/s received \u00b7 ETA 1746 s \u00b7 11/25 files verified\n",
    "download interrupted; rerun to resume verified chunks\n"
  ]
}
```

## Complete resumed public reconstruction

```json
{
  "pass_": true,
  "peakRSSBytes": 1558462464,
  "memory": [
    {
      "seconds": 1.01,
      "rssBytes": 39895040
    },
    {
      "seconds": 2.02,
      "rssBytes": 39895040
    },
    {
      "seconds": 3.02,
      "rssBytes": 39895040
    },
    {
      "seconds": 4.04,
      "rssBytes": 39927808
    },
    {
      "seconds": 5.05,
      "rssBytes": 39927808
    },
    {
      "seconds": 6.05,
      "rssBytes": 39927808
    },
    {
      "seconds": 7.07,
      "rssBytes": 39944192
    },
    {
      "seconds": 8.08,
      "rssBytes": 39944192
    },
    {
      "seconds": 9.09,
      "rssBytes": 39944192
    },
    {
      "seconds": 10.11,
      "rssBytes": 39944192
    },
    {
      "seconds": 11.12,
      "rssBytes": 39960576
    },
    {
      "seconds": 12.12,
      "rssBytes": 39960576
    },
    {
      "seconds": 13.13,
      "rssBytes": 39960576
    },
    {
      "seconds": 14.15,
      "rssBytes": 39960576
    },
    {
      "seconds": 15.16,
      "rssBytes": 39993344
    },
    {
      "seconds": 16.17,
      "rssBytes": 39993344
    },
    {
      "seconds": 17.18,
      "rssBytes": 39993344
    },
    {
      "seconds": 18.19,
      "rssBytes": 49709056
    },
    {
      "seconds": 19.21,
      "rssBytes": 89325568
    },
    {
      "seconds": 20.22,
      "rssBytes": 137854976
    },
    {
      "seconds": 21.23,
      "rssBytes": 227360768
    },
    {
      "seconds": 22.24,
      "rssBytes": 262258688
    },
    {
      "seconds": 23.25,
      "rssBytes": 361152512
    },
    {
      "seconds": 24.26,
      "rssBytes": 502792192
    },
    {
      "seconds": 25.28,
      "rssBytes": 544178176
    },
    {
      "seconds": 26.29,
      "rssBytes": 651673600
    },
    {
      "seconds": 27.3,
      "rssBytes": 685768704
    },
    {
      "seconds": 28.3,
      "rssBytes": 722960384
    },
    {
      "seconds": 29.31,
      "rssBytes": 773947392
    },
    {
      "seconds": 30.32,
      "rssBytes": 801619968
    },
    {
      "seconds": 31.33,
      "rssBytes": 821444608
    },
    {
      "seconds": 32.33,
      "rssBytes": 833372160
    },
    {
      "seconds": 33.34,
      "rssBytes": 896401408
    },
    {
      "seconds": 34.35,
      "rssBytes": 912588800
    },
    {
      "seconds": 35.36,
      "rssBytes": 912998400
    },
    {
      "seconds": 36.38,
      "rssBytes": 913047552
    },
    {
      "seconds": 37.39,
      "rssBytes": 913244160
    },
    {
      "seconds": 38.39,
      "rssBytes": 913342464
    },
    {
      "seconds": 39.41,
      "rssBytes": 913342464
    },
    {
      "seconds": 40.42,
      "rssBytes": 913948672
    },
    {
      "seconds": 41.44,
      "rssBytes": 915505152
    },
    {
      "seconds": 42.44,
      "rssBytes": 917897216
    },
    {
      "seconds": 43.46,
      "rssBytes": 919158784
    },
    {
      "seconds": 44.46,
      "rssBytes": 920731648
    },
    {
      "seconds": 45.47,
      "rssBytes": 931397632
    },
    {
      "seconds": 46.48,
      "rssBytes": 936329216
    },
    {
      "seconds": 47.49,
      "rssBytes": 947142656
    },
    {
      "seconds": 48.51,
      "rssBytes": 956727296
    },
    {
      "seconds": 49.52,
      "rssBytes": 986906624
    },
    {
      "seconds": 50.52,
      "rssBytes": 976027648
    },
    {
      "seconds": 51.54,
      "rssBytes": 1010565120
    },
    {
      "seconds": 52.55,
      "rssBytes": 1039908864
    },
    {
      "seconds": 53.57,
      "rssBytes": 1071710208
    },
    {
      "seconds": 54.59,
      "rssBytes": 1089224704
    },
    {
      "seconds": 55.6,
      "rssBytes": 1140916224
    },
    {
      "seconds": 56.61,
      "rssBytes": 1146388480
    },
    {
      "seconds": 57.63,
      "rssBytes": 1151959040
    },
    {
      "seconds": 58.64,
      "rssBytes": 1158676480
    },
    {
      "seconds": 59.66,
      "rssBytes": 1165312000
    },
    {
      "seconds": 60.67,
      "rssBytes": 1033912320
    },
    {
      "seconds": 61.68,
      "rssBytes": 1043873792
    },
    {
      "seconds": 62.7,
      "rssBytes": 1049575424
    },
    {
      "seconds": 63.7,
      "rssBytes": 1053868032
    },
    {
      "seconds": 64.72,
      "rssBytes": 1100382208
    },
    {
      "seconds": 65.73,
      "rssBytes": 1123074048
    },
    {
      "seconds": 66.75,
      "rssBytes": 1130823680
    },
    {
      "seconds": 67.75,
      "rssBytes": 1166245888
    },
    {
      "seconds": 68.76,
      "rssBytes": 1184350208
    },
    {
      "seconds": 69.78,
      "rssBytes": 1200128000
    },
    {
      "seconds": 70.78,
      "rssBytes": 996507648
    },
    {
      "seconds": 71.79,
      "rssBytes": 1007648768
    },
    {
      "seconds": 72.8,
      "rssBytes": 1020248064
    },
    {
      "seconds": 73.81,
      "rssBytes": 1076674560
    },
    {
      "seconds": 74.82,
      "rssBytes": 1092648960
    },
    {
      "seconds": 75.82,
      "rssBytes": 1125302272
    },
    {
      "seconds": 76.84,
      "rssBytes": 1144078336
    },
    {
      "seconds": 77.85,
      "rssBytes": 1158938624
    },
    {
      "seconds": 78.86,
      "rssBytes": 1221492736
    },
    {
      "seconds": 79.88,
      "rssBytes": 1229209600
    },
    {
      "seconds": 80.89,
      "rssBytes": 1116585984
    },
    {
      "seconds": 81.91,
      "rssBytes": 1123123200
    },
    {
      "seconds": 82.92,
      "rssBytes": 1142816768
    },
    {
      "seconds": 83.93,
      "rssBytes": 1155219456
    },
    {
      "seconds": 84.94,
      "rssBytes": 1175093248
    },
    {
      "seconds": 85.96,
      "rssBytes": 1191395328
    },
    {
      "seconds": 86.97,
      "rssBytes": 1208238080
    },
    {
      "seconds": 87.99,
      "rssBytes": 1224146944
    },
    {
      "seconds": 89.0,
      "rssBytes": 1316552704
    },
    {
      "seconds": 90.01,
      "rssBytes": 1321254912
    },
    {
      "seconds": 91.03,
      "rssBytes": 1332264960
    },
    {
      "seconds": 92.05,
      "rssBytes": 1341997056
    },
    {
      "seconds": 93.05,
      "rssBytes": 1360084992
    },
    {
      "seconds": 94.07,
      "rssBytes": 1369767936
    },
    {
      "seconds": 95.08,
      "rssBytes": 1377124352
    },
    {
      "seconds": 96.1,
      "rssBytes": 1386381312
    },
    {
      "seconds": 97.11,
      "rssBytes": 1394589696
    },
    {
      "seconds": 98.13,
      "rssBytes": 1397981184
    },
    {
      "seconds": 99.14,
      "rssBytes": 1417953280
    },
    {
      "seconds": 100.15,
      "rssBytes": 1422934016
    },
    {
      "seconds": 101.16,
      "rssBytes": 1429192704
    },
    {
      "seconds": 102.17,
      "rssBytes": 1432305664
    },
    {
      "seconds": 103.19,
      "rssBytes": 1292926976
    },
    {
      "seconds": 104.2,
      "rssBytes": 1295564800
    },
    {
      "seconds": 105.22,
      "rssBytes": 1309933568
    },
    {
      "seconds": 106.23,
      "rssBytes": 1313964032
    },
    {
      "seconds": 107.24,
      "rssBytes": 1317322752
    },
    {
      "seconds": 108.25,
      "rssBytes": 1397391360
    },
    {
      "seconds": 109.25,
      "rssBytes": 1404026880
    },
    {
      "seconds": 110.27,
      "rssBytes": 1409728512
    },
    {
      "seconds": 111.28,
      "rssBytes": 1436958720
    },
    {
      "seconds": 112.28,
      "rssBytes": 1443397632
    },
    {
      "seconds": 113.3,
      "rssBytes": 1447313408
    },
    {
      "seconds": 114.3,
      "rssBytes": 1456472064
    },
    {
      "seconds": 115.31,
      "rssBytes": 1461010432
    },
    {
      "seconds": 116.32,
      "rssBytes": 1469038592
    },
    {
      "seconds": 117.33,
      "rssBytes": 1476804608
    },
    {
      "seconds": 118.33,
      "rssBytes": 1484308480
    },
    {
      "seconds": 119.35,
      "rssBytes": 1491550208
    },
    {
      "seconds": 120.36,
      "rssBytes": 1498120192
    },
    {
      "seconds": 121.38,
      "rssBytes": 1501986816
    },
    {
      "seconds": 122.39,
      "rssBytes": 1506607104
    },
    {
      "seconds": 123.4,
      "rssBytes": 1510342656
    },
    {
      "seconds": 124.41,
      "rssBytes": 1515569152
    },
    {
      "seconds": 125.41,
      "rssBytes": 1520713728
    },
    {
      "seconds": 126.43,
      "rssBytes": 1524678656
    },
    {
      "seconds": 127.45,
      "rssBytes": 1525743616
    },
    {
      "seconds": 128.46,
      "rssBytes": 1527988224
    },
    {
      "seconds": 129.48,
      "rssBytes": 1532100608
    },
    {
      "seconds": 130.49,
      "rssBytes": 1526267904
    },
    {
      "seconds": 131.51,
      "rssBytes": 1530576896
    },
    {
      "seconds": 132.52,
      "rssBytes": 1533001728
    },
    {
      "seconds": 133.54,
      "rssBytes": 1535950848
    },
    {
      "seconds": 134.55,
      "rssBytes": 1539899392
    },
    {
      "seconds": 135.56,
      "rssBytes": 1545306112
    },
    {
      "seconds": 136.58,
      "rssBytes": 1549008896
    },
    {
      "seconds": 137.59,
      "rssBytes": 1552138240
    },
    {
      "seconds": 138.61,
      "rssBytes": 1555382272
    },
    {
      "seconds": 139.62,
      "rssBytes": 1558462464
    },
    {
      "seconds": 140.63,
      "rssBytes": 1434206208
    },
    {
      "seconds": 141.64,
      "rssBytes": 1437007872
    },
    {
      "seconds": 142.66,
      "rssBytes": 1439776768
    },
    {
      "seconds": 143.67,
      "rssBytes": 1441808384
    },
    {
      "seconds": 144.68,
      "rssBytes": 1444085760
    },
    {
      "seconds": 145.7,
      "rssBytes": 1446379520
    },
    {
      "seconds": 146.71,
      "rssBytes": 1448296448
    },
    {
      "seconds": 147.72,
      "rssBytes": 1450819584
    },
    {
      "seconds": 148.73,
      "rssBytes": 1452949504
    },
    {
      "seconds": 149.74,
      "rssBytes": 1455259648
    },
    {
      "seconds": 150.75,
      "rssBytes": 1234845696
    },
    {
      "seconds": 151.77,
      "rssBytes": 1237286912
    },
    {
      "seconds": 152.78,
      "rssBytes": 1239252992
    },
    {
      "seconds": 153.8,
      "rssBytes": 1244315648
    },
    {
      "seconds": 154.81,
      "rssBytes": 1250197504
    },
    {
      "seconds": 155.83,
      "rssBytes": 1256210432
    },
    {
      "seconds": 156.83,
      "rssBytes": 1261649920
    },
    {
      "seconds": 157.84,
      "rssBytes": 1266319360
    },
    {
      "seconds": 158.85,
      "rssBytes": 1271660544
    },
    {
      "seconds": 159.86,
      "rssBytes": 1277820928
    },
    {
      "seconds": 160.86,
      "rssBytes": 1116176384
    },
    {
      "seconds": 161.88,
      "rssBytes": 1119371264
    },
    {
      "seconds": 162.9,
      "rssBytes": 1113620480
    },
    {
      "seconds": 163.91,
      "rssBytes": 1116192768
    },
    {
      "seconds": 164.92,
      "rssBytes": 1117569024
    },
    {
      "seconds": 165.93,
      "rssBytes": 1118306304
    },
    {
      "seconds": 166.94,
      "rssBytes": 1118601216
    },
    {
      "seconds": 167.96,
      "rssBytes": 1118617600
    },
    {
      "seconds": 168.98,
      "rssBytes": 1118617600
    },
    {
      "seconds": 169.99,
      "rssBytes": 1118322688
    },
    {
      "seconds": 171.01,
      "rssBytes": 896663552
    },
    {
      "seconds": 172.02,
      "rssBytes": 896663552
    },
    {
      "seconds": 173.03,
      "rssBytes": 897433600
    },
    {
      "seconds": 174.05,
      "rssBytes": 898482176
    },
    {
      "seconds": 175.06,
      "rssBytes": 899825664
    },
    {
      "seconds": 176.07,
      "rssBytes": 901349376
    },
    {
      "seconds": 177.08,
      "rssBytes": 902512640
    },
    {
      "seconds": 178.09,
      "rssBytes": 904413184
    },
    {
      "seconds": 179.1,
      "rssBytes": 913489920
    },
    {
      "seconds": 180.11,
      "rssBytes": 951255040
    },
    {
      "seconds": 181.12,
      "rssBytes": 951156736
    },
    {
      "seconds": 182.13,
      "rssBytes": 960692224
    },
    {
      "seconds": 183.14,
      "rssBytes": 960823296
    },
    {
      "seconds": 184.15,
      "rssBytes": 960823296
    },
    {
      "seconds": 185.16,
      "rssBytes": 960888832
    },
    {
      "seconds": 186.17,
      "rssBytes": 960888832
    },
    {
      "seconds": 187.18,
      "rssBytes": 960888832
    },
    {
      "seconds": 188.19,
      "rssBytes": 960937984
    },
    {
      "seconds": 189.2,
      "rssBytes": 960856064
    },
    {
      "seconds": 190.21,
      "rssBytes": 960741376
    },
    {
      "seconds": 191.21,
      "rssBytes": 960741376
    },
    {
      "seconds": 192.22,
      "rssBytes": 960741376
    },
    {
      "seconds": 193.24,
      "rssBytes": 962527232
    },
    {
      "seconds": 194.25,
      "rssBytes": 954023936
    },
    {
      "seconds": 195.27,
      "rssBytes": 956465152
    },
    {
      "seconds": 196.27,
      "rssBytes": 957661184
    },
    {
      "seconds": 197.28,
      "rssBytes": 958644224
    },
    {
      "seconds": 198.3,
      "rssBytes": 959463424
    },
    {
      "seconds": 199.31,
      "rssBytes": 960069632
    },
    {
      "seconds": 200.32,
      "rssBytes": 960069632
    },
    {
      "seconds": 201.33,
      "rssBytes": 960413696
    },
    {
      "seconds": 202.35,
      "rssBytes": 960413696
    },
    {
      "seconds": 203.37,
      "rssBytes": 960413696
    },
    {
      "seconds": 204.38,
      "rssBytes": 960413696
    },
    {
      "seconds": 205.4,
      "rssBytes": 960413696
    },
    {
      "seconds": 206.42,
      "rssBytes": 960315392
    },
    {
      "seconds": 207.43,
      "rssBytes": 960266240
    },
    {
      "seconds": 208.44,
      "rssBytes": 960266240
    },
    {
      "seconds": 209.45,
      "rssBytes": 960266240
    },
    {
      "seconds": 210.46,
      "rssBytes": 960430080
    },
    {
      "seconds": 211.48,
      "rssBytes": 960626688
    },
    {
      "seconds": 212.49,
      "rssBytes": 960626688
    },
    {
      "seconds": 213.51,
      "rssBytes": 960626688
    },
    {
      "seconds": 214.52,
      "rssBytes": 960626688
    },
    {
      "seconds": 215.53,
      "rssBytes": 960626688
    },
    {
      "seconds": 216.55,
      "rssBytes": 960626688
    },
    {
      "seconds": 217.56,
      "rssBytes": 960626688
    },
    {
      "seconds": 218.57,
      "rssBytes": 960626688
    },
    {
      "seconds": 219.58,
      "rssBytes": 960626688
    },
    {
      "seconds": 220.6,
      "rssBytes": 960626688
    },
    {
      "seconds": 221.61,
      "rssBytes": 960626688
    },
    {
      "seconds": 222.62,
      "rssBytes": 960626688
    },
    {
      "seconds": 223.64,
      "rssBytes": 960577536
    },
    {
      "seconds": 224.64,
      "rssBytes": 960675840
    },
    {
      "seconds": 225.64,
      "rssBytes": 958087168
    },
    {
      "seconds": 226.66,
      "rssBytes": 965623808
    },
    {
      "seconds": 227.67,
      "rssBytes": 968982528
    },
    {
      "seconds": 228.68,
      "rssBytes": 973242368
    },
    {
      "seconds": 229.69,
      "rssBytes": 980434944
    },
    {
      "seconds": 230.7,
      "rssBytes": 984989696
    },
    {
      "seconds": 231.72,
      "rssBytes": 991805440
    },
    {
      "seconds": 232.74,
      "rssBytes": 997244928
    },
    {
      "seconds": 233.75,
      "rssBytes": 1004453888
    },
    {
      "seconds": 234.77,
      "rssBytes": 1011515392
    },
    {
      "seconds": 235.78,
      "rssBytes": 1019281408
    },
    {
      "seconds": 236.8,
      "rssBytes": 1028325376
    },
    {
      "seconds": 237.81,
      "rssBytes": 1042857984
    },
    {
      "seconds": 238.82,
      "rssBytes": 1054654464
    },
    {
      "seconds": 239.83,
      "rssBytes": 1061502976
    },
    {
      "seconds": 240.85,
      "rssBytes": 1069727744
    },
    {
      "seconds": 241.86,
      "rssBytes": 1071759360
    },
    {
      "seconds": 242.88,
      "rssBytes": 1073905664
    },
    {
      "seconds": 243.89,
      "rssBytes": 1075724288
    },
    {
      "seconds": 244.91,
      "rssBytes": 973389824
    },
    {
      "seconds": 245.93,
      "rssBytes": 973455360
    },
    {
      "seconds": 246.94,
      "rssBytes": 973455360
    },
    {
      "seconds": 247.95,
      "rssBytes": 973455360
    },
    {
      "seconds": 248.96,
      "rssBytes": 973455360
    },
    {
      "seconds": 249.98,
      "rssBytes": 973242368
    },
    {
      "seconds": 250.99,
      "rssBytes": 973242368
    },
    {
      "seconds": 252.0,
      "rssBytes": 973242368
    },
    {
      "seconds": 253.01,
      "rssBytes": 973242368
    },
    {
      "seconds": 254.01,
      "rssBytes": 973242368
    },
    {
      "seconds": 255.03,
      "rssBytes": 973242368
    },
    {
      "seconds": 256.04,
      "rssBytes": 973242368
    },
    {
      "seconds": 257.05,
      "rssBytes": 973242368
    },
    {
      "seconds": 258.06,
      "rssBytes": 968818688
    },
    {
      "seconds": 259.07,
      "rssBytes": 969523200
    },
    {
      "seconds": 260.07,
      "rssBytes": 969555968
    },
    {
      "seconds": 261.08,
      "rssBytes": 969555968
    },
    {
      "seconds": 262.1,
      "rssBytes": 969555968
    },
    {
      "seconds": 263.11,
      "rssBytes": 972308480
    },
    {
      "seconds": 264.11,
      "rssBytes": 972537856
    },
    {
      "seconds": 265.13,
      "rssBytes": 972980224
    },
    {
      "seconds": 266.14,
      "rssBytes": 973258752
    },
    {
      "seconds": 267.15,
      "rssBytes": 974159872
    },
    {
      "seconds": 268.17,
      "rssBytes": 974897152
    },
    {
      "seconds": 269.18,
      "rssBytes": 975716352
    },
    {
      "seconds": 270.19,
      "rssBytes": 976519168
    },
    {
      "seconds": 271.2,
      "rssBytes": 977272832
    },
    {
      "seconds": 272.21,
      "rssBytes": 978731008
    },
    {
      "seconds": 273.23,
      "rssBytes": 981532672
    },
    {
      "seconds": 274.25,
      "rssBytes": 982073344
    },
    {
      "seconds": 275.26,
      "rssBytes": 982777856
    },
    {
      "seconds": 276.28,
      "rssBytes": 983498752
    },
    {
      "seconds": 277.29,
      "rssBytes": 984236032
    },
    {
      "seconds": 278.3,
      "rssBytes": 984875008
    },
    {
      "seconds": 279.32,
      "rssBytes": 985612288
    },
    {
      "seconds": 280.33,
      "rssBytes": 986611712
    },
    {
      "seconds": 281.35,
      "rssBytes": 996655104
    },
    {
      "seconds": 282.36,
      "rssBytes": 999456768
    },
    {
      "seconds": 283.38,
      "rssBytes": 1001193472
    },
    {
      "seconds": 284.38,
      "rssBytes": 1002749952
    },
    {
      "seconds": 285.39,
      "rssBytes": 1002749952
    },
    {
      "seconds": 286.41,
      "rssBytes": 1002749952
    },
    {
      "seconds": 287.43,
      "rssBytes": 1002749952
    },
    {
      "seconds": 288.44,
      "rssBytes": 1002749952
    },
    {
      "seconds": 289.46,
      "rssBytes": 991477760
    },
    {
      "seconds": 290.47,
      "rssBytes": 997507072
    },
    {
      "seconds": 291.48,
      "rssBytes": 997998592
    },
    {
      "seconds": 292.5,
      "rssBytes": 998080512
    },
    {
      "seconds": 293.51,
      "rssBytes": 998195200
    },
    {
      "seconds": 294.52,
      "rssBytes": 998195200
    },
    {
      "seconds": 295.54,
      "rssBytes": 998096896
    },
    {
      "seconds": 296.55,
      "rssBytes": 998096896
    },
    {
      "seconds": 297.56,
      "rssBytes": 1003536384
    },
    {
      "seconds": 298.57,
      "rssBytes": 1036943360
    },
    {
      "seconds": 299.58,
      "rssBytes": 1048231936
    },
    {
      "seconds": 300.58,
      "rssBytes": 1060847616
    },
    {
      "seconds": 301.6,
      "rssBytes": 1105739776
    },
    {
      "seconds": 302.61,
      "rssBytes": 1111310336
    },
    {
      "seconds": 303.62,
      "rssBytes": 1118470144
    },
    {
      "seconds": 304.63,
      "rssBytes": 1126989824
    },
    {
      "seconds": 305.65,
      "rssBytes": 1135001600
    },
    {
      "seconds": 306.66,
      "rssBytes": 999587840
    },
    {
      "seconds": 307.68,
      "rssBytes": 1007550464
    },
    {
      "seconds": 308.7,
      "rssBytes": 1015693312
    },
    {
      "seconds": 309.71,
      "rssBytes": 1023328256
    },
    {
      "seconds": 310.72,
      "rssBytes": 1031405568
    },
    {
      "seconds": 311.73,
      "rssBytes": 1039351808
    },
    {
      "seconds": 312.75,
      "rssBytes": 1045168128
    },
    {
      "seconds": 313.77,
      "rssBytes": 1052983296
    },
    {
      "seconds": 314.78,
      "rssBytes": 1060798464
    },
    {
      "seconds": 315.79,
      "rssBytes": 1068187648
    },
    {
      "seconds": 316.81,
      "rssBytes": 875905024
    },
    {
      "seconds": 317.82,
      "rssBytes": 877608960
    },
    {
      "seconds": 318.84,
      "rssBytes": 879198208
    },
    {
      "seconds": 319.84,
      "rssBytes": 880312320
    },
    {
      "seconds": 320.86,
      "rssBytes": 882524160
    },
    {
      "seconds": 321.88,
      "rssBytes": 875544576
    },
    {
      "seconds": 322.89,
      "rssBytes": 879837184
    },
    {
      "seconds": 323.9,
      "rssBytes": 880345088
    },
    {
      "seconds": 324.92,
      "rssBytes": 880689152
    },
    {
      "seconds": 325.93,
      "rssBytes": 881410048
    },
    {
      "seconds": 326.94,
      "rssBytes": 881590272
    },
    {
      "seconds": 327.96,
      "rssBytes": 881721344
    },
    {
      "seconds": 328.97,
      "rssBytes": 881934336
    },
    {
      "seconds": 329.98,
      "rssBytes": 882278400
    },
    {
      "seconds": 331.0,
      "rssBytes": 882278400
    },
    {
      "seconds": 332.0,
      "rssBytes": 882229248
    },
    {
      "seconds": 333.01,
      "rssBytes": 882229248
    },
    {
      "seconds": 334.02,
      "rssBytes": 882229248
    },
    {
      "seconds": 335.02,
      "rssBytes": 882786304
    },
    {
      "seconds": 336.04,
      "rssBytes": 883048448
    },
    {
      "seconds": 337.05,
      "rssBytes": 883048448
    },
    {
      "seconds": 338.06,
      "rssBytes": 883048448
    },
    {
      "seconds": 339.07,
      "rssBytes": 883195904
    },
    {
      "seconds": 340.08,
      "rssBytes": 883195904
    },
    {
      "seconds": 341.09,
      "rssBytes": 883195904
    },
    {
      "seconds": 342.1,
      "rssBytes": 883195904
    },
    {
      "seconds": 343.1,
      "rssBytes": 883195904
    },
    {
      "seconds": 344.11,
      "rssBytes": 883539968
    },
    {
      "seconds": 345.12,
      "rssBytes": 883703808
    },
    {
      "seconds": 346.13,
      "rssBytes": 883884032
    },
    {
      "seconds": 347.15,
      "rssBytes": 884031488
    },
    {
      "seconds": 348.16,
      "rssBytes": 884031488
    },
    {
      "seconds": 349.18,
      "rssBytes": 887521280
    },
    {
      "seconds": 350.18,
      "rssBytes": 893468672
    },
    {
      "seconds": 351.19,
      "rssBytes": 899612672
    },
    {
      "seconds": 352.2,
      "rssBytes": 913375232
    },
    {
      "seconds": 353.21,
      "rssBytes": 914866176
    },
    {
      "seconds": 354.22,
      "rssBytes": 910229504
    },
    {
      "seconds": 355.22,
      "rssBytes": 914604032
    },
    {
      "seconds": 356.23,
      "rssBytes": 916832256
    },
    {
      "seconds": 357.24,
      "rssBytes": 918798336
    },
    {
      "seconds": 358.25,
      "rssBytes": 922337280
    },
    {
      "seconds": 359.27,
      "rssBytes": 925663232
    },
    {
      "seconds": 360.28,
      "rssBytes": 930889728
    },
    {
      "seconds": 361.3,
      "rssBytes": 933855232
    },
    {
      "seconds": 362.31,
      "rssBytes": 933855232
    },
    {
      "seconds": 363.32,
      "rssBytes": 933855232
    },
    {
      "seconds": 364.33,
      "rssBytes": 933855232
    },
    {
      "seconds": 365.35,
      "rssBytes": 933871616
    },
    {
      "seconds": 366.36,
      "rssBytes": 933871616
    },
    {
      "seconds": 367.36,
      "rssBytes": 933871616
    },
    {
      "seconds": 368.38,
      "rssBytes": 933871616
    },
    {
      "seconds": 369.39,
      "rssBytes": 933871616
    },
    {
      "seconds": 370.4,
      "rssBytes": 933871616
    },
    {
      "seconds": 371.41,
      "rssBytes": 934707200
    },
    {
      "seconds": 372.43,
      "rssBytes": 934674432
    },
    {
      "seconds": 373.44,
      "rssBytes": 934674432
    },
    {
      "seconds": 374.45,
      "rssBytes": 934674432
    },
    {
      "seconds": 375.46,
      "rssBytes": 934674432
    },
    {
      "seconds": 376.48,
      "rssBytes": 934674432
    },
    {
      "seconds": 377.49,
      "rssBytes": 934674432
    },
    {
      "seconds": 378.51,
      "rssBytes": 934690816
    },
    {
      "seconds": 379.52,
      "rssBytes": 934690816
    },
    {
      "seconds": 380.53,
      "rssBytes": 934690816
    },
    {
      "seconds": 381.55,
      "rssBytes": 934690816
    },
    {
      "seconds": 382.57,
      "rssBytes": 934690816
    },
    {
      "seconds": 383.59,
      "rssBytes": 934690816
    },
    {
      "seconds": 384.6,
      "rssBytes": 934690816
    },
    {
      "seconds": 385.62,
      "rssBytes": 934690816
    },
    {
      "seconds": 386.63,
      "rssBytes": 930480128
    },
    {
      "seconds": 387.64,
      "rssBytes": 933052416
    },
    {
      "seconds": 388.65,
      "rssBytes": 933232640
    },
    {
      "seconds": 389.66,
      "rssBytes": 933265408
    },
    {
      "seconds": 390.68,
      "rssBytes": 933511168
    },
    {
      "seconds": 391.7,
      "rssBytes": 933511168
    },
    {
      "seconds": 392.72,
      "rssBytes": 933560320
    },
    {
      "seconds": 393.74,
      "rssBytes": 933412864
    },
    {
      "seconds": 394.75,
      "rssBytes": 933412864
    },
    {
      "seconds": 395.77,
      "rssBytes": 933511168
    },
    {
      "seconds": 396.78,
      "rssBytes": 933511168
    },
    {
      "seconds": 397.79,
      "rssBytes": 933511168
    },
    {
      "seconds": 398.8,
      "rssBytes": 933511168
    },
    {
      "seconds": 399.82,
      "rssBytes": 933511168
    },
    {
      "seconds": 400.83,
      "rssBytes": 933412864
    },
    {
      "seconds": 401.86,
      "rssBytes": 1048772608
    },
    {
      "seconds": 402.87,
      "rssBytes": 1052327936
    },
    {
      "seconds": 403.88,
      "rssBytes": 1056538624
    },
    {
      "seconds": 404.9,
      "rssBytes": 1061781504
    },
    {
      "seconds": 405.9,
      "rssBytes": 1066942464
    },
    {
      "seconds": 406.92,
      "rssBytes": 1073479680
    },
    {
      "seconds": 407.93,
      "rssBytes": 1078886400
    },
    {
      "seconds": 408.95,
      "rssBytes": 1117470720
    },
    {
      "seconds": 409.96,
      "rssBytes": 1124466688
    },
    {
      "seconds": 410.97,
      "rssBytes": 1132560384
    },
    {
      "seconds": 411.98,
      "rssBytes": 1141948416
    },
    {
      "seconds": 413.0,
      "rssBytes": 1149779968
    },
    {
      "seconds": 414.01,
      "rssBytes": 1158004736
    },
    {
      "seconds": 415.02,
      "rssBytes": 1166229504
    },
    {
      "seconds": 416.02,
      "rssBytes": 1172946944
    },
    {
      "seconds": 417.03,
      "rssBytes": 1174814720
    },
    {
      "seconds": 418.04,
      "rssBytes": 1173028864
    },
    {
      "seconds": 419.04,
      "rssBytes": 1176944640
    },
    {
      "seconds": 420.06,
      "rssBytes": 1178025984
    },
    {
      "seconds": 421.06,
      "rssBytes": 1177796608
    },
    {
      "seconds": 422.07,
      "rssBytes": 1177796608
    },
    {
      "seconds": 423.08,
      "rssBytes": 1177796608
    },
    {
      "seconds": 424.09,
      "rssBytes": 1178107904
    },
    {
      "seconds": 425.1,
      "rssBytes": 1178107904
    },
    {
      "seconds": 426.11,
      "rssBytes": 1178320896
    },
    {
      "seconds": 427.12,
      "rssBytes": 1179336704
    },
    {
      "seconds": 428.14,
      "rssBytes": 1179385856
    },
    {
      "seconds": 429.15,
      "rssBytes": 1179385856
    },
    {
      "seconds": 430.16,
      "rssBytes": 1179385856
    },
    {
      "seconds": 431.18,
      "rssBytes": 1179385856
    },
    {
      "seconds": 432.2,
      "rssBytes": 1179385856
    },
    {
      "seconds": 433.21,
      "rssBytes": 1179140096
    },
    {
      "seconds": 434.23,
      "rssBytes": 1179140096
    },
    {
      "seconds": 435.24,
      "rssBytes": 1179140096
    },
    {
      "seconds": 436.25,
      "rssBytes": 1179140096
    },
    {
      "seconds": 437.27,
      "rssBytes": 1179140096
    },
    {
      "seconds": 438.28,
      "rssBytes": 1179090944
    },
    {
      "seconds": 439.29,
      "rssBytes": 1179090944
    },
    {
      "seconds": 440.3,
      "rssBytes": 1179090944
    },
    {
      "seconds": 441.32,
      "rssBytes": 1179205632
    },
    {
      "seconds": 442.34,
      "rssBytes": 1179238400
    },
    {
      "seconds": 443.35,
      "rssBytes": 1179238400
    },
    {
      "seconds": 444.37,
      "rssBytes": 1179254784
    },
    {
      "seconds": 445.38,
      "rssBytes": 1020542976
    },
    {
      "seconds": 446.4,
      "rssBytes": 1020542976
    },
    {
      "seconds": 447.41,
      "rssBytes": 1020542976
    },
    {
      "seconds": 448.43,
      "rssBytes": 1020542976
    },
    {
      "seconds": 449.44,
      "rssBytes": 1020542976
    },
    {
      "seconds": 450.45,
      "rssBytes": 1012744192
    },
    {
      "seconds": 451.46,
      "rssBytes": 1013530624
    },
    {
      "seconds": 452.47,
      "rssBytes": 1014546432
    },
    {
      "seconds": 453.48,
      "rssBytes": 1015939072
    },
    {
      "seconds": 454.49,
      "rssBytes": 1024884736
    },
    {
      "seconds": 455.5,
      "rssBytes": 832929792
    },
    {
      "seconds": 456.51,
      "rssBytes": 833060864
    },
    {
      "seconds": 457.52,
      "rssBytes": 833191936
    },
    {
      "seconds": 458.54,
      "rssBytes": 833191936
    },
    {
      "seconds": 459.55,
      "rssBytes": 833191936
    },
    {
      "seconds": 460.57,
      "rssBytes": 833093632
    },
    {
      "seconds": 461.57,
      "rssBytes": 842022912
    },
    {
      "seconds": 462.58,
      "rssBytes": 870793216
    },
    {
      "seconds": 463.6,
      "rssBytes": 870744064
    },
    {
      "seconds": 464.62,
      "rssBytes": 870744064
    },
    {
      "seconds": 465.63,
      "rssBytes": 870744064
    },
    {
      "seconds": 466.64,
      "rssBytes": 870744064
    },
    {
      "seconds": 467.66,
      "rssBytes": 880181248
    },
    {
      "seconds": 468.67,
      "rssBytes": 880181248
    },
    {
      "seconds": 469.7,
      "rssBytes": 880230400
    },
    {
      "seconds": 470.71,
      "rssBytes": 880394240
    },
    {
      "seconds": 471.72,
      "rssBytes": 880885760
    },
    {
      "seconds": 472.73,
      "rssBytes": 881311744
    },
    {
      "seconds": 473.74,
      "rssBytes": 881672192
    },
    {
      "seconds": 474.75,
      "rssBytes": 882049024
    },
    {
      "seconds": 475.77,
      "rssBytes": 882049024
    },
    {
      "seconds": 476.78,
      "rssBytes": 882081792
    },
    {
      "seconds": 477.8,
      "rssBytes": 919830528
    },
    {
      "seconds": 478.81,
      "rssBytes": 919830528
    },
    {
      "seconds": 479.82,
      "rssBytes": 929267712
    },
    {
      "seconds": 480.83,
      "rssBytes": 928972800
    },
    {
      "seconds": 481.85,
      "rssBytes": 928972800
    },
    {
      "seconds": 482.86,
      "rssBytes": 925564928
    },
    {
      "seconds": 483.87,
      "rssBytes": 925564928
    },
    {
      "seconds": 484.88,
      "rssBytes": 926662656
    },
    {
      "seconds": 485.89,
      "rssBytes": 926810112
    },
    {
      "seconds": 486.9,
      "rssBytes": 926826496
    },
    {
      "seconds": 487.91,
      "rssBytes": 927612928
    },
    {
      "seconds": 488.92,
      "rssBytes": 927825920
    },
    {
      "seconds": 489.92,
      "rssBytes": 927825920
    },
    {
      "seconds": 490.93,
      "rssBytes": 927776768
    },
    {
      "seconds": 491.94,
      "rssBytes": 927776768
    },
    {
      "seconds": 492.95,
      "rssBytes": 927776768
    },
    {
      "seconds": 493.96,
      "rssBytes": 927776768
    },
    {
      "seconds": 494.97,
      "rssBytes": 927776768
    },
    {
      "seconds": 495.98,
      "rssBytes": 927793152
    },
    {
      "seconds": 496.99,
      "rssBytes": 927842304
    },
    {
      "seconds": 497.99,
      "rssBytes": 927842304
    },
    {
      "seconds": 499.01,
      "rssBytes": 928038912
    },
    {
      "seconds": 500.02,
      "rssBytes": 966410240
    },
    {
      "seconds": 501.03,
      "rssBytes": 968409088
    },
    {
      "seconds": 502.05,
      "rssBytes": 969506816
    },
    {
      "seconds": 503.06,
      "rssBytes": 971112448
    },
    {
      "seconds": 504.07,
      "rssBytes": 982253568
    },
    {
      "seconds": 505.08,
      "rssBytes": 985808896
    },
    {
      "seconds": 506.1,
      "rssBytes": 989511680
    },
    {
      "seconds": 507.11,
      "rssBytes": 1029357568
    },
    {
      "seconds": 508.12,
      "rssBytes": 1039433728
    },
    {
      "seconds": 509.14,
      "rssBytes": 1040416768
    },
    {
      "seconds": 510.15,
      "rssBytes": 1041104896
    },
    {
      "seconds": 511.16,
      "rssBytes": 1041678336
    },
    {
      "seconds": 512.18,
      "rssBytes": 1041940480
    },
    {
      "seconds": 513.19,
      "rssBytes": 1042530304
    },
    {
      "seconds": 514.21,
      "rssBytes": 1036075008
    },
    {
      "seconds": 515.22,
      "rssBytes": 1039122432
    },
    {
      "seconds": 516.23,
      "rssBytes": 1041203200
    },
    {
      "seconds": 517.24,
      "rssBytes": 1042186240
    },
    {
      "seconds": 518.26,
      "rssBytes": 1042825216
    },
    {
      "seconds": 519.27,
      "rssBytes": 1043447808
    },
    {
      "seconds": 520.28,
      "rssBytes": 1044103168
    },
    {
      "seconds": 521.29,
      "rssBytes": 1044774912
    },
    {
      "seconds": 522.3,
      "rssBytes": 1046478848
    },
    {
      "seconds": 523.32,
      "rssBytes": 1047134208
    },
    {
      "seconds": 524.34,
      "rssBytes": 1047543808
    },
    {
      "seconds": 525.35,
      "rssBytes": 1047724032
    },
    {
      "seconds": 526.36,
      "rssBytes": 1048346624
    },
    {
      "seconds": 527.38,
      "rssBytes": 1049001984
    },
    {
      "seconds": 528.39,
      "rssBytes": 1049821184
    },
    {
      "seconds": 529.4,
      "rssBytes": 1050558464
    },
    {
      "seconds": 530.42,
      "rssBytes": 1051492352
    },
    {
      "seconds": 531.43,
      "rssBytes": 1052426240
    },
    {
      "seconds": 532.44,
      "rssBytes": 1053573120
    },
    {
      "seconds": 533.46,
      "rssBytes": 1054425088
    },
    {
      "seconds": 534.47,
      "rssBytes": 1055997952
    },
    {
      "seconds": 535.49,
      "rssBytes": 1057439744
    },
    {
      "seconds": 536.5,
      "rssBytes": 1058324480
    },
    {
      "seconds": 537.52,
      "rssBytes": 1058324480
    },
    {
      "seconds": 538.54,
      "rssBytes": 1058324480
    },
    {
      "seconds": 539.56,
      "rssBytes": 913620992
    },
    {
      "seconds": 540.57,
      "rssBytes": 913571840
    },
    {
      "seconds": 541.58,
      "rssBytes": 913522688
    },
    {
      "seconds": 542.59,
      "rssBytes": 913522688
    },
    {
      "seconds": 543.6,
      "rssBytes": 913473536
    },
    {
      "seconds": 544.62,
      "rssBytes": 913473536
    },
    {
      "seconds": 545.63,
      "rssBytes": 913473536
    },
    {
      "seconds": 546.64,
      "rssBytes": 910426112
    },
    {
      "seconds": 547.65,
      "rssBytes": 912277504
    },
    {
      "seconds": 548.65,
      "rssBytes": 912277504
    },
    {
      "seconds": 549.66,
      "rssBytes": 912687104
    },
    {
      "seconds": 550.68,
      "rssBytes": 912687104
    },
    {
      "seconds": 551.69,
      "rssBytes": 917225472
    },
    {
      "seconds": 552.7,
      "rssBytes": 917667840
    },
    {
      "seconds": 553.72,
      "rssBytes": 920469504
    },
    {
      "seconds": 554.73,
      "rssBytes": 923058176
    },
    {
      "seconds": 555.74,
      "rssBytes": 925679616
    },
    {
      "seconds": 556.75,
      "rssBytes": 927547392
    },
    {
      "seconds": 557.76,
      "rssBytes": 1005846528
    },
    {
      "seconds": 558.77,
      "rssBytes": 1017151488
    },
    {
      "seconds": 559.78,
      "rssBytes": 1020592128
    },
    {
      "seconds": 560.79,
      "rssBytes": 1023082496
    },
    {
      "seconds": 561.79,
      "rssBytes": 1025327104
    },
    {
      "seconds": 562.8,
      "rssBytes": 1027211264
    },
    {
      "seconds": 563.81,
      "rssBytes": 1030619136
    },
    {
      "seconds": 564.82,
      "rssBytes": 1032880128
    },
    {
      "seconds": 565.83,
      "rssBytes": 1035075584
    },
    {
      "seconds": 566.84,
      "rssBytes": 1036779520
    },
    {
      "seconds": 567.84,
      "rssBytes": 1039728640
    },
    {
      "seconds": 568.85,
      "rssBytes": 1041956864
    },
    {
      "seconds": 569.86,
      "rssBytes": 1044414464
    },
    {
      "seconds": 570.88,
      "rssBytes": 1047150592
    },
    {
      "seconds": 571.89,
      "rssBytes": 1049296896
    },
    {
      "seconds": 572.9,
      "rssBytes": 1049395200
    },
    {
      "seconds": 573.91,
      "rssBytes": 1049395200
    },
    {
      "seconds": 574.91,
      "rssBytes": 1049395200
    },
    {
      "seconds": 575.92,
      "rssBytes": 1049395200
    },
    {
      "seconds": 576.92,
      "rssBytes": 1049395200
    },
    {
      "seconds": 577.93,
      "rssBytes": 1049395200
    },
    {
      "seconds": 578.95,
      "rssBytes": 1047756800
    },
    {
      "seconds": 579.96,
      "rssBytes": 1057193984
    },
    {
      "seconds": 580.97,
      "rssBytes": 1057193984
    },
    {
      "seconds": 581.99,
      "rssBytes": 1057210368
    },
    {
      "seconds": 583.0,
      "rssBytes": 1057521664
    },
    {
      "seconds": 584.01,
      "rssBytes": 1057521664
    },
    {
      "seconds": 585.02,
      "rssBytes": 1057751040
    },
    {
      "seconds": 586.04,
      "rssBytes": 1057783808
    },
    {
      "seconds": 587.05,
      "rssBytes": 1057783808
    },
    {
      "seconds": 588.07,
      "rssBytes": 1057783808
    },
    {
      "seconds": 589.08,
      "rssBytes": 1057783808
    },
    {
      "seconds": 590.09,
      "rssBytes": 1057898496
    },
    {
      "seconds": 591.11,
      "rssBytes": 1057898496
    },
    {
      "seconds": 592.12,
      "rssBytes": 1057947648
    },
    {
      "seconds": 593.13,
      "rssBytes": 1057996800
    },
    {
      "seconds": 594.14,
      "rssBytes": 1057996800
    },
    {
      "seconds": 595.15,
      "rssBytes": 1058144256
    },
    {
      "seconds": 596.17,
      "rssBytes": 1058373632
    },
    {
      "seconds": 597.18,
      "rssBytes": 1058373632
    },
    {
      "seconds": 598.19,
      "rssBytes": 1058373632
    },
    {
      "seconds": 599.19,
      "rssBytes": 1058324480
    },
    {
      "seconds": 600.21,
      "rssBytes": 1058324480
    },
    {
      "seconds": 601.22,
      "rssBytes": 1058324480
    },
    {
      "seconds": 602.23,
      "rssBytes": 1058324480
    },
    {
      "seconds": 603.24,
      "rssBytes": 1058324480
    },
    {
      "seconds": 604.25,
      "rssBytes": 1058324480
    },
    {
      "seconds": 605.27,
      "rssBytes": 1058357248
    },
    {
      "seconds": 606.28,
      "rssBytes": 1058357248
    },
    {
      "seconds": 607.29,
      "rssBytes": 1058357248
    },
    {
      "seconds": 608.3,
      "rssBytes": 1058357248
    },
    {
      "seconds": 609.31,
      "rssBytes": 1058357248
    },
    {
      "seconds": 610.32,
      "rssBytes": 1051066368
    },
    {
      "seconds": 611.33,
      "rssBytes": 1053540352
    },
    {
      "seconds": 612.35,
      "rssBytes": 1055064064
    },
    {
      "seconds": 613.36,
      "rssBytes": 1055490048
    },
    {
      "seconds": 614.38,
      "rssBytes": 881197056
    },
    {
      "seconds": 615.39,
      "rssBytes": 885637120
    },
    {
      "seconds": 616.41,
      "rssBytes": 886161408
    },
    {
      "seconds": 617.43,
      "rssBytes": 886194176
    },
    {
      "seconds": 618.44,
      "rssBytes": 886194176
    },
    {
      "seconds": 619.46,
      "rssBytes": 886194176
    },
    {
      "seconds": 620.47,
      "rssBytes": 886784000
    },
    {
      "seconds": 621.49,
      "rssBytes": 886734848
    },
    {
      "seconds": 622.51,
      "rssBytes": 886734848
    },
    {
      "seconds": 623.52,
      "rssBytes": 886734848
    },
    {
      "seconds": 624.54,
      "rssBytes": 924483584
    },
    {
      "seconds": 625.56,
      "rssBytes": 924483584
    },
    {
      "seconds": 626.57,
      "rssBytes": 924434432
    },
    {
      "seconds": 627.58,
      "rssBytes": 933871616
    },
    {
      "seconds": 628.59,
      "rssBytes": 933871616
    },
    {
      "seconds": 629.6,
      "rssBytes": 934068224
    },
    {
      "seconds": 630.61,
      "rssBytes": 934068224
    },
    {
      "seconds": 631.63,
      "rssBytes": 934100992
    },
    {
      "seconds": 632.64,
      "rssBytes": 934117376
    },
    {
      "seconds": 633.65,
      "rssBytes": 934117376
    },
    {
      "seconds": 634.66,
      "rssBytes": 934019072
    },
    {
      "seconds": 635.68,
      "rssBytes": 952893440
    },
    {
      "seconds": 636.7,
      "rssBytes": 952893440
    },
    {
      "seconds": 637.71,
      "rssBytes": 952844288
    },
    {
      "seconds": 638.71,
      "rssBytes": 953434112
    },
    {
      "seconds": 639.72,
      "rssBytes": 953434112
    },
    {
      "seconds": 640.73,
      "rssBytes": 953483264
    },
    {
      "seconds": 641.74,
      "rssBytes": 951107584
    },
    {
      "seconds": 642.75,
      "rssBytes": 951664640
    },
    {
      "seconds": 643.76,
      "rssBytes": 951894016
    },
    {
      "seconds": 644.77,
      "rssBytes": 956891136
    },
    {
      "seconds": 645.78,
      "rssBytes": 956907520
    },
    {
      "seconds": 646.78,
      "rssBytes": 956907520
    },
    {
      "seconds": 647.79,
      "rssBytes": 956940288
    },
    {
      "seconds": 648.8,
      "rssBytes": 956940288
    },
    {
      "seconds": 649.81,
      "rssBytes": 957759488
    },
    {
      "seconds": 650.82,
      "rssBytes": 957759488
    },
    {
      "seconds": 651.83,
      "rssBytes": 957792256
    },
    {
      "seconds": 652.84,
      "rssBytes": 957792256
    },
    {
      "seconds": 653.85,
      "rssBytes": 958087168
    },
    {
      "seconds": 654.86,
      "rssBytes": 959643648
    },
    {
      "seconds": 655.86,
      "rssBytes": 960987136
    },
    {
      "seconds": 656.87,
      "rssBytes": 963264512
    },
    {
      "seconds": 657.88,
      "rssBytes": 965246976
    },
    {
      "seconds": 658.9,
      "rssBytes": 969523200
    },
    {
      "seconds": 659.91,
      "rssBytes": 970981376
    },
    {
      "seconds": 660.92,
      "rssBytes": 972292096
    },
    {
      "seconds": 661.93,
      "rssBytes": 975208448
    },
    {
      "seconds": 662.95,
      "rssBytes": 985972736
    },
    {
      "seconds": 663.97,
      "rssBytes": 987381760
    },
    {
      "seconds": 664.98,
      "rssBytes": 993591296
    },
    {
      "seconds": 665.99,
      "rssBytes": 994066432
    },
    {
      "seconds": 667.01,
      "rssBytes": 995098624
    },
    {
      "seconds": 668.01,
      "rssBytes": 995966976
    },
    {
      "seconds": 669.03,
      "rssBytes": 996786176
    },
    {
      "seconds": 670.05,
      "rssBytes": 997654528
    },
    {
      "seconds": 671.07,
      "rssBytes": 998490112
    },
    {
      "seconds": 672.07,
      "rssBytes": 999309312
    },
    {
      "seconds": 673.09,
      "rssBytes": 1000226816
    },
    {
      "seconds": 674.11,
      "rssBytes": 995573760
    },
    {
      "seconds": 675.12,
      "rssBytes": 997670912
    },
    {
      "seconds": 676.13,
      "rssBytes": 998834176
    },
    {
      "seconds": 677.15,
      "rssBytes": 1002618880
    },
    {
      "seconds": 678.16,
      "rssBytes": 1003552768
    },
    {
      "seconds": 679.17,
      "rssBytes": 1005109248
    },
    {
      "seconds": 680.19,
      "rssBytes": 1006092288
    },
    {
      "seconds": 681.2,
      "rssBytes": 1007009792
    },
    {
      "seconds": 682.22,
      "rssBytes": 1008025600
    },
    {
      "seconds": 683.23,
      "rssBytes": 1009008640
    },
    {
      "seconds": 684.25,
      "rssBytes": 1009909760
    },
    {
      "seconds": 685.27,
      "rssBytes": 1012924416
    },
    {
      "seconds": 686.27,
      "rssBytes": 1013612544
    },
    {
      "seconds": 687.29,
      "rssBytes": 1013612544
    },
    {
      "seconds": 688.3,
      "rssBytes": 1013612544
    },
    {
      "seconds": 689.31,
      "rssBytes": 1013612544
    },
    {
      "seconds": 690.32,
      "rssBytes": 1013612544
    },
    {
      "seconds": 691.33,
      "rssBytes": 1013612544
    },
    {
      "seconds": 692.34,
      "rssBytes": 1013612544
    },
    {
      "seconds": 693.36,
      "rssBytes": 1013612544
    },
    {
      "seconds": 694.37,
      "rssBytes": 1013612544
    },
    {
      "seconds": 695.38,
      "rssBytes": 1013612544
    },
    {
      "seconds": 696.4,
      "rssBytes": 1013612544
    },
    {
      "seconds": 697.41,
      "rssBytes": 1013612544
    },
    {
      "seconds": 698.42,
      "rssBytes": 886407168
    },
    {
      "seconds": 699.43,
      "rssBytes": 886407168
    },
    {
      "seconds": 700.44,
      "rssBytes": 886407168
    },
    {
      "seconds": 701.46,
      "rssBytes": 886407168
    },
    {
      "seconds": 702.47,
      "rssBytes": 886407168
    },
    {
      "seconds": 703.48,
      "rssBytes": 886472704
    },
    {
      "seconds": 704.49,
      "rssBytes": 886571008
    },
    {
      "seconds": 705.5,
      "rssBytes": 880525312
    },
    {
      "seconds": 706.52,
      "rssBytes": 884948992
    },
    {
      "seconds": 707.53,
      "rssBytes": 887652352
    },
    {
      "seconds": 708.54,
      "rssBytes": 890093568
    },
    {
      "seconds": 709.55,
      "rssBytes": 894009344
    },
    {
      "seconds": 710.57,
      "rssBytes": 938786816
    },
    {
      "seconds": 711.58,
      "rssBytes": 941375488
    },
    {
      "seconds": 712.59,
      "rssBytes": 944308224
    },
    {
      "seconds": 713.61,
      "rssBytes": 964624384
    },
    {
      "seconds": 714.63,
      "rssBytes": 964755456
    },
    {
      "seconds": 715.64,
      "rssBytes": 964755456
    },
    {
      "seconds": 716.65,
      "rssBytes": 964755456
    },
    {
      "seconds": 717.66,
      "rssBytes": 964657152
    },
    {
      "seconds": 718.67,
      "rssBytes": 964509696
    },
    {
      "seconds": 719.68,
      "rssBytes": 964509696
    },
    {
      "seconds": 720.69,
      "rssBytes": 964902912
    },
    {
      "seconds": 721.7,
      "rssBytes": 966230016
    },
    {
      "seconds": 722.7,
      "rssBytes": 966311936
    },
    {
      "seconds": 723.71,
      "rssBytes": 970129408
    },
    {
      "seconds": 724.71,
      "rssBytes": 974323712
    },
    {
      "seconds": 725.73,
      "rssBytes": 985120768
    },
    {
      "seconds": 726.73,
      "rssBytes": 985120768
    },
    {
      "seconds": 727.74,
      "rssBytes": 984973312
    },
    {
      "seconds": 728.75,
      "rssBytes": 985956352
    },
    {
      "seconds": 729.76,
      "rssBytes": 995885056
    },
    {
      "seconds": 730.77,
      "rssBytes": 995786752
    },
    {
      "seconds": 731.78,
      "rssBytes": 996409344
    },
    {
      "seconds": 732.79,
      "rssBytes": 998850560
    },
    {
      "seconds": 733.8,
      "rssBytes": 1003061248
    },
    {
      "seconds": 734.82,
      "rssBytes": 1006059520
    },
    {
      "seconds": 735.83,
      "rssBytes": 1009614848
    },
    {
      "seconds": 736.85,
      "rssBytes": 1012727808
    },
    {
      "seconds": 737.86,
      "rssBytes": 1014431744
    },
    {
      "seconds": 738.88,
      "rssBytes": 1018740736
    },
    {
      "seconds": 739.88,
      "rssBytes": 1022918656
    },
    {
      "seconds": 740.9,
      "rssBytes": 1026752512
    },
    {
      "seconds": 741.91,
      "rssBytes": 1029898240
    },
    {
      "seconds": 742.93,
      "rssBytes": 1033371648
    },
    {
      "seconds": 743.94,
      "rssBytes": 1036615680
    },
    {
      "seconds": 744.96,
      "rssBytes": 1039204352
    },
    {
      "seconds": 745.97,
      "rssBytes": 1042939904
    },
    {
      "seconds": 746.99,
      "rssBytes": 1084014592
    },
    {
      "seconds": 748.0,
      "rssBytes": 1089028096
    },
    {
      "seconds": 749.01,
      "rssBytes": 1103429632
    },
    {
      "seconds": 750.02,
      "rssBytes": 1108885504
    },
    {
      "seconds": 751.02,
      "rssBytes": 1114554368
    },
    {
      "seconds": 752.04,
      "rssBytes": 1120780288
    },
    {
      "seconds": 753.05,
      "rssBytes": 1127366656
    },
    {
      "seconds": 754.06,
      "rssBytes": 1133150208
    },
    {
      "seconds": 755.07,
      "rssBytes": 1138491392
    },
    {
      "seconds": 756.08,
      "rssBytes": 1185529856
    },
    {
      "seconds": 757.1,
      "rssBytes": 1210777600
    },
    {
      "seconds": 758.12,
      "rssBytes": 1227522048
    },
    {
      "seconds": 759.13,
      "rssBytes": 1243774976
    },
    {
      "seconds": 760.15,
      "rssBytes": 1260929024
    },
    {
      "seconds": 761.17,
      "rssBytes": 1278394368
    },
    {
      "seconds": 762.18,
      "rssBytes": 1296760832
    },
    {
      "seconds": 763.19,
      "rssBytes": 1106837504
    },
    {
      "seconds": 764.2,
      "rssBytes": 1123123200
    },
    {
      "seconds": 765.21,
      "rssBytes": 1137065984
    },
    {
      "seconds": 766.23,
      "rssBytes": 1148141568
    },
    {
      "seconds": 767.24,
      "rssBytes": 1162313728
    },
    {
      "seconds": 768.25,
      "rssBytes": 1174306816
    },
    {
      "seconds": 769.26,
      "rssBytes": 1189642240
    },
    {
      "seconds": 770.27,
      "rssBytes": 1198309376
    },
    {
      "seconds": 771.27,
      "rssBytes": 1206435840
    },
    {
      "seconds": 772.29,
      "rssBytes": 1211236352
    },
    {
      "seconds": 773.3,
      "rssBytes": 1218674688
    },
    {
      "seconds": 774.31,
      "rssBytes": 1025261568
    },
    {
      "seconds": 775.32,
      "rssBytes": 1029980160
    },
    {
      "seconds": 776.33,
      "rssBytes": 1033175040
    },
    {
      "seconds": 777.35,
      "rssBytes": 1038073856
    },
    {
      "seconds": 778.37,
      "rssBytes": 1043382272
    },
    {
      "seconds": 779.37,
      "rssBytes": 1046495232
    },
    {
      "seconds": 780.39,
      "rssBytes": 1057292288
    },
    {
      "seconds": 781.4,
      "rssBytes": 1059569664
    },
    {
      "seconds": 782.42,
      "rssBytes": 1062436864
    },
    {
      "seconds": 783.43,
      "rssBytes": 1063354368
    },
    {
      "seconds": 784.44,
      "rssBytes": 1063305216
    },
    {
      "seconds": 785.46,
      "rssBytes": 1063305216
    },
    {
      "seconds": 786.47,
      "rssBytes": 1063256064
    },
    {
      "seconds": 787.48,
      "rssBytes": 1063469056
    },
    {
      "seconds": 788.5,
      "rssBytes": 1063436288
    },
    {
      "seconds": 789.51,
      "rssBytes": 1063436288
    },
    {
      "seconds": 790.53,
      "rssBytes": 1063436288
    },
    {
      "seconds": 791.54,
      "rssBytes": 1063387136
    },
    {
      "seconds": 792.56,
      "rssBytes": 1063387136
    },
    {
      "seconds": 793.56,
      "rssBytes": 1012334592
    },
    {
      "seconds": 794.57,
      "rssBytes": 1012334592
    },
    {
      "seconds": 795.59,
      "rssBytes": 1012334592
    },
    {
      "seconds": 796.6,
      "rssBytes": 1012334592
    },
    {
      "seconds": 797.61,
      "rssBytes": 1012334592
    },
    {
      "seconds": 798.62,
      "rssBytes": 1012367360
    },
    {
      "seconds": 799.62,
      "rssBytes": 1012367360
    },
    {
      "seconds": 800.63,
      "rssBytes": 1012367360
    },
    {
      "seconds": 801.64,
      "rssBytes": 1008549888
    },
    {
      "seconds": 802.64,
      "rssBytes": 1009123328
    },
    {
      "seconds": 803.65,
      "rssBytes": 1009942528
    },
    {
      "seconds": 804.67,
      "rssBytes": 1011154944
    },
    {
      "seconds": 805.68,
      "rssBytes": 1011384320
    },
    {
      "seconds": 806.7,
      "rssBytes": 1012645888
    },
    {
      "seconds": 807.71,
      "rssBytes": 1012645888
    },
    {
      "seconds": 808.71,
      "rssBytes": 1012645888
    },
    {
      "seconds": 809.72,
      "rssBytes": 1013039104
    },
    {
      "seconds": 810.73,
      "rssBytes": 1013612544
    },
    {
      "seconds": 811.74,
      "rssBytes": 1013612544
    },
    {
      "seconds": 812.75,
      "rssBytes": 1013628928
    },
    {
      "seconds": 813.76,
      "rssBytes": 1013628928
    },
    {
      "seconds": 814.78,
      "rssBytes": 1016758272
    },
    {
      "seconds": 815.78,
      "rssBytes": 1016856576
    },
    {
      "seconds": 816.8,
      "rssBytes": 1016872960
    },
    {
      "seconds": 817.81,
      "rssBytes": 1016922112
    },
    {
      "seconds": 818.81,
      "rssBytes": 1016971264
    },
    {
      "seconds": 819.82,
      "rssBytes": 1018101760
    },
    {
      "seconds": 820.83,
      "rssBytes": 1021427712
    },
    {
      "seconds": 821.85,
      "rssBytes": 1025032192
    },
    {
      "seconds": 822.86,
      "rssBytes": 1030209536
    },
    {
      "seconds": 823.88,
      "rssBytes": 1043283968
    },
    {
      "seconds": 824.89,
      "rssBytes": 1044529152
    },
    {
      "seconds": 825.91,
      "rssBytes": 1046282240
    },
    {
      "seconds": 826.92,
      "rssBytes": 1052278784
    },
    {
      "seconds": 827.93,
      "rssBytes": 1054326784
    },
    {
      "seconds": 828.94,
      "rssBytes": 1054867456
    },
    {
      "seconds": 829.96,
      "rssBytes": 1054867456
    },
    {
      "seconds": 830.97,
      "rssBytes": 1054867456
    },
    {
      "seconds": 831.98,
      "rssBytes": 1054883840
    },
    {
      "seconds": 832.99,
      "rssBytes": 1054818304
    },
    {
      "seconds": 834.0,
      "rssBytes": 1048117248
    },
    {
      "seconds": 835.01,
      "rssBytes": 1052360704
    },
    {
      "seconds": 836.02,
      "rssBytes": 1053016064
    },
    {
      "seconds": 837.04,
      "rssBytes": 1054097408
    },
    {
      "seconds": 838.05,
      "rssBytes": 1054097408
    },
    {
      "seconds": 839.06,
      "rssBytes": 1054097408
    },
    {
      "seconds": 840.08,
      "rssBytes": 1053802496
    },
    {
      "seconds": 841.09,
      "rssBytes": 1053802496
    },
    {
      "seconds": 842.1,
      "rssBytes": 1053802496
    },
    {
      "seconds": 843.12,
      "rssBytes": 1053704192
    },
    {
      "seconds": 844.13,
      "rssBytes": 864993280
    },
    {
      "seconds": 845.15,
      "rssBytes": 864993280
    },
    {
      "seconds": 846.15,
      "rssBytes": 864993280
    },
    {
      "seconds": 847.17,
      "rssBytes": 864993280
    },
    {
      "seconds": 848.19,
      "rssBytes": 865026048
    },
    {
      "seconds": 849.2,
      "rssBytes": 865026048
    },
    {
      "seconds": 850.21,
      "rssBytes": 865026048
    },
    {
      "seconds": 851.22,
      "rssBytes": 865026048
    },
    {
      "seconds": 852.23,
      "rssBytes": 865026048
    },
    {
      "seconds": 853.24,
      "rssBytes": 865075200
    },
    {
      "seconds": 854.24,
      "rssBytes": 865370112
    },
    {
      "seconds": 855.26,
      "rssBytes": 865386496
    },
    {
      "seconds": 856.27,
      "rssBytes": 865386496
    },
    {
      "seconds": 857.29,
      "rssBytes": 865779712
    },
    {
      "seconds": 858.3,
      "rssBytes": 865812480
    },
    {
      "seconds": 859.31,
      "rssBytes": 865812480
    },
    {
      "seconds": 860.33,
      "rssBytes": 865828864
    },
    {
      "seconds": 861.35,
      "rssBytes": 865828864
    },
    {
      "seconds": 862.36,
      "rssBytes": 865779712
    },
    {
      "seconds": 863.38,
      "rssBytes": 865779712
    },
    {
      "seconds": 864.39,
      "rssBytes": 865779712
    },
    {
      "seconds": 865.4,
      "rssBytes": 708575232
    },
    {
      "seconds": 866.41,
      "rssBytes": 720142336
    },
    {
      "seconds": 867.42,
      "rssBytes": 722944000
    },
    {
      "seconds": 868.44,
      "rssBytes": 729939968
    },
    {
      "seconds": 869.44,
      "rssBytes": 763871232
    },
    {
      "seconds": 870.45,
      "rssBytes": 765689856
    },
    {
      "seconds": 871.45,
      "rssBytes": 767426560
    },
    {
      "seconds": 872.46,
      "rssBytes": 778436608
    },
    {
      "seconds": 873.47,
      "rssBytes": 781172736
    },
    {
      "seconds": 874.48,
      "rssBytes": 783941632
    },
    {
      "seconds": 875.48,
      "rssBytes": 786612224
    },
    {
      "seconds": 876.5,
      "rssBytes": 790872064
    },
    {
      "seconds": 877.51,
      "rssBytes": 793919488
    },
    {
      "seconds": 878.52,
      "rssBytes": 797605888
    },
    {
      "seconds": 879.53,
      "rssBytes": 800555008
    },
    {
      "seconds": 880.54,
      "rssBytes": 803487744
    },
    {
      "seconds": 881.54,
      "rssBytes": 844513280
    },
    {
      "seconds": 882.55,
      "rssBytes": 846675968
    },
    {
      "seconds": 883.56,
      "rssBytes": 858652672
    },
    {
      "seconds": 884.57,
      "rssBytes": 861913088
    },
    {
      "seconds": 885.58,
      "rssBytes": 864829440
    },
    {
      "seconds": 886.6,
      "rssBytes": 867336192
    },
    {
      "seconds": 887.6,
      "rssBytes": 870170624
    },
    {
      "seconds": 888.61,
      "rssBytes": 873103360
    },
    {
      "seconds": 889.63,
      "rssBytes": 875823104
    },
    {
      "seconds": 890.64,
      "rssBytes": 879214592
    },
    {
      "seconds": 891.65,
      "rssBytes": 882147328
    },
    {
      "seconds": 892.67,
      "rssBytes": 884801536
    },
    {
      "seconds": 893.7,
      "rssBytes": 891092992
    },
    {
      "seconds": 894.71,
      "rssBytes": 894795776
    },
    {
      "seconds": 895.73,
      "rssBytes": 900956160
    },
    {
      "seconds": 896.74,
      "rssBytes": 903921664
    },
    {
      "seconds": 897.75,
      "rssBytes": 900022272
    },
    {
      "seconds": 898.77,
      "rssBytes": 942243840
    },
    {
      "seconds": 899.77,
      "rssBytes": 957956096
    },
    {
      "seconds": 900.79,
      "rssBytes": 960888832
    },
    {
      "seconds": 901.8,
      "rssBytes": 963362816
    },
    {
      "seconds": 902.81,
      "rssBytes": 966950912
    },
    {
      "seconds": 903.83,
      "rssBytes": 969752576
    },
    {
      "seconds": 904.84,
      "rssBytes": 972521472
    },
    {
      "seconds": 905.85,
      "rssBytes": 976896000
    },
    {
      "seconds": 906.86,
      "rssBytes": 980025344
    },
    {
      "seconds": 907.87,
      "rssBytes": 981614592
    },
    {
      "seconds": 908.88,
      "rssBytes": 985513984
    },
    {
      "seconds": 909.9,
      "rssBytes": 987660288
    },
    {
      "seconds": 910.91,
      "rssBytes": 989560832
    },
    {
      "seconds": 911.92,
      "rssBytes": 1029619712
    },
    {
      "seconds": 912.93,
      "rssBytes": 1041154048
    },
    {
      "seconds": 913.94,
      "rssBytes": 1042415616
    },
    {
      "seconds": 914.96,
      "rssBytes": 1081573376
    },
    {
      "seconds": 915.97,
      "rssBytes": 1093320704
    },
    {
      "seconds": 916.98,
      "rssBytes": 1094909952
    },
    {
      "seconds": 917.99,
      "rssBytes": 1096564736
    },
    {
      "seconds": 919.01,
      "rssBytes": 1096564736
    },
    {
      "seconds": 920.02,
      "rssBytes": 1096466432
    },
    {
      "seconds": 921.04,
      "rssBytes": 1096531968
    },
    {
      "seconds": 922.04,
      "rssBytes": 1096531968
    },
    {
      "seconds": 923.06,
      "rssBytes": 1096531968
    },
    {
      "seconds": 924.07,
      "rssBytes": 1096482816
    },
    {
      "seconds": 925.08,
      "rssBytes": 1096482816
    },
    {
      "seconds": 926.09,
      "rssBytes": 1096482816
    },
    {
      "seconds": 927.1,
      "rssBytes": 1096482816
    },
    {
      "seconds": 928.11,
      "rssBytes": 1096482816
    },
    {
      "seconds": 929.13,
      "rssBytes": 1096499200
    },
    {
      "seconds": 930.14,
      "rssBytes": 1090486272
    },
    {
      "seconds": 931.15,
      "rssBytes": 1093877760
    },
    {
      "seconds": 932.16,
      "rssBytes": 929955840
    },
    {
      "seconds": 933.17,
      "rssBytes": 932642816
    },
    {
      "seconds": 934.19,
      "rssBytes": 937738240
    },
    {
      "seconds": 935.2,
      "rssBytes": 939491328
    },
    {
      "seconds": 936.21,
      "rssBytes": 943570944
    },
    {
      "seconds": 937.22,
      "rssBytes": 947126272
    },
    {
      "seconds": 938.23,
      "rssBytes": 950272000
    },
    {
      "seconds": 939.25,
      "rssBytes": 952582144
    },
    {
      "seconds": 940.26,
      "rssBytes": 955170816
    },
    {
      "seconds": 941.28,
      "rssBytes": 814333952
    },
    {
      "seconds": 942.29,
      "rssBytes": 816005120
    },
    {
      "seconds": 943.3,
      "rssBytes": 818626560
    },
    {
      "seconds": 944.32,
      "rssBytes": 820084736
    },
    {
      "seconds": 945.32,
      "rssBytes": 860454912
    },
    {
      "seconds": 946.33,
      "rssBytes": 864272384
    },
    {
      "seconds": 947.34,
      "rssBytes": 876871680
    },
    {
      "seconds": 948.35,
      "rssBytes": 883785728
    },
    {
      "seconds": 949.35,
      "rssBytes": 897384448
    },
    {
      "seconds": 950.36,
      "rssBytes": 900120576
    },
    {
      "seconds": 951.37,
      "rssBytes": 901955584
    },
    {
      "seconds": 952.38,
      "rssBytes": 902594560
    },
    {
      "seconds": 953.4,
      "rssBytes": 903249920
    },
    {
      "seconds": 954.4,
      "rssBytes": 904101888
    },
    {
      "seconds": 955.41,
      "rssBytes": 904773632
    },
    {
      "seconds": 956.42,
      "rssBytes": 906002432
    },
    {
      "seconds": 957.43,
      "rssBytes": 906526720
    },
    {
      "seconds": 958.45,
      "rssBytes": 907214848
    },
    {
      "seconds": 959.45,
      "rssBytes": 908214272
    },
    {
      "seconds": 960.47,
      "rssBytes": 909115392
    },
    {
      "seconds": 961.48,
      "rssBytes": 910344192
    },
    {
      "seconds": 962.48,
      "rssBytes": 908525568
    },
    {
      "seconds": 963.49,
      "rssBytes": 927252480
    },
    {
      "seconds": 964.5,
      "rssBytes": 927711232
    },
    {
      "seconds": 965.5,
      "rssBytes": 928219136
    },
    {
      "seconds": 966.52,
      "rssBytes": 930562048
    },
    {
      "seconds": 967.53,
      "rssBytes": 931774464
    },
    {
      "seconds": 968.54,
      "rssBytes": 935460864
    },
    {
      "seconds": 969.55,
      "rssBytes": 938786816
    },
    {
      "seconds": 970.56,
      "rssBytes": 938803200
    },
    {
      "seconds": 971.57,
      "rssBytes": 938803200
    },
    {
      "seconds": 972.59,
      "rssBytes": 938803200
    },
    {
      "seconds": 973.6,
      "rssBytes": 938803200
    },
    {
      "seconds": 974.61,
      "rssBytes": 938704896
    },
    {
      "seconds": 975.63,
      "rssBytes": 938704896
    },
    {
      "seconds": 976.64,
      "rssBytes": 938704896
    },
    {
      "seconds": 977.65,
      "rssBytes": 938852352
    },
    {
      "seconds": 978.66,
      "rssBytes": 976601088
    },
    {
      "seconds": 979.67,
      "rssBytes": 976601088
    },
    {
      "seconds": 980.68,
      "rssBytes": 976601088
    },
    {
      "seconds": 981.7,
      "rssBytes": 976568320
    },
    {
      "seconds": 982.71,
      "rssBytes": 1024032768
    },
    {
      "seconds": 983.72,
      "rssBytes": 1033601024
    },
    {
      "seconds": 984.73,
      "rssBytes": 1033633792
    },
    {
      "seconds": 985.74,
      "rssBytes": 1033633792
    },
    {
      "seconds": 986.76,
      "rssBytes": 1033699328
    },
    {
      "seconds": 987.77,
      "rssBytes": 1033551872
    },
    {
      "seconds": 988.78,
      "rssBytes": 1033535488
    },
    {
      "seconds": 989.8,
      "rssBytes": 1033535488
    },
    {
      "seconds": 990.81,
      "rssBytes": 1033535488
    },
    {
      "seconds": 991.82,
      "rssBytes": 1033535488
    },
    {
      "seconds": 992.83,
      "rssBytes": 1033502720
    },
    {
      "seconds": 993.83,
      "rssBytes": 1026277376
    },
    {
      "seconds": 994.85,
      "rssBytes": 1031651328
    },
    {
      "seconds": 995.87,
      "rssBytes": 1031700480
    },
    {
      "seconds": 996.88,
      "rssBytes": 1031700480
    },
    {
      "seconds": 997.9,
      "rssBytes": 1031700480
    },
    {
      "seconds": 998.92,
      "rssBytes": 1031700480
    },
    {
      "seconds": 999.93,
      "rssBytes": 1031700480
    },
    {
      "seconds": 1000.94,
      "rssBytes": 1031651328
    },
    {
      "seconds": 1001.96,
      "rssBytes": 1031651328
    },
    {
      "seconds": 1002.97,
      "rssBytes": 1031651328
    },
    {
      "seconds": 1003.98,
      "rssBytes": 1031700480
    },
    {
      "seconds": 1004.99,
      "rssBytes": 1031700480
    },
    {
      "seconds": 1006.01,
      "rssBytes": 1031700480
    },
    {
      "seconds": 1007.01,
      "rssBytes": 1031700480
    },
    {
      "seconds": 1008.02,
      "rssBytes": 919650304
    },
    {
      "seconds": 1009.04,
      "rssBytes": 919650304
    },
    {
      "seconds": 1010.05,
      "rssBytes": 919650304
    },
    {
      "seconds": 1011.07,
      "rssBytes": 919650304
    },
    {
      "seconds": 1012.08,
      "rssBytes": 919552000
    },
    {
      "seconds": 1013.1,
      "rssBytes": 919666688
    },
    {
      "seconds": 1014.12,
      "rssBytes": 919781376
    },
    {
      "seconds": 1015.13,
      "rssBytes": 947535872
    },
    {
      "seconds": 1016.14,
      "rssBytes": 947650560
    },
    {
      "seconds": 1017.15,
      "rssBytes": 948322304
    },
    {
      "seconds": 1018.17,
      "rssBytes": 948535296
    },
    {
      "seconds": 1019.18,
      "rssBytes": 838336512
    },
    {
      "seconds": 1020.2,
      "rssBytes": 839041024
    },
    {
      "seconds": 1021.21,
      "rssBytes": 839761920
    },
    {
      "seconds": 1022.22,
      "rssBytes": 840695808
    },
    {
      "seconds": 1023.24,
      "rssBytes": 841629696
    },
    {
      "seconds": 1024.24,
      "rssBytes": 842661888
    },
    {
      "seconds": 1025.26,
      "rssBytes": 843644928
    },
    {
      "seconds": 1026.28,
      "rssBytes": 842317824
    },
    {
      "seconds": 1027.29,
      "rssBytes": 845135872
    },
    {
      "seconds": 1028.3,
      "rssBytes": 846741504
    },
    {
      "seconds": 1029.31,
      "rssBytes": 848232448
    },
    {
      "seconds": 1030.32,
      "rssBytes": 848936960
    },
    {
      "seconds": 1031.33,
      "rssBytes": 850116608
    },
    {
      "seconds": 1032.33,
      "rssBytes": 851001344
    },
    {
      "seconds": 1033.35,
      "rssBytes": 851951616
    },
    {
      "seconds": 1034.36,
      "rssBytes": 852901888
    },
    {
      "seconds": 1035.36,
      "rssBytes": 853901312
    },
    {
      "seconds": 1036.37,
      "rssBytes": 855212032
    },
    {
      "seconds": 1037.38,
      "rssBytes": 861634560
    },
    {
      "seconds": 1038.39,
      "rssBytes": 863485952
    },
    {
      "seconds": 1039.41,
      "rssBytes": 866353152
    },
    {
      "seconds": 1040.42,
      "rssBytes": 869269504
    },
    {
      "seconds": 1041.43,
      "rssBytes": 871022592
    },
    {
      "seconds": 1042.44,
      "rssBytes": 872660992
    },
    {
      "seconds": 1043.45,
      "rssBytes": 874299392
    },
    {
      "seconds": 1044.47,
      "rssBytes": 875560960
    },
    {
      "seconds": 1045.48,
      "rssBytes": 877379584
    },
    {
      "seconds": 1046.49,
      "rssBytes": 878313472
    },
    {
      "seconds": 1047.5,
      "rssBytes": 878313472
    },
    {
      "seconds": 1048.51,
      "rssBytes": 878313472
    },
    {
      "seconds": 1049.52,
      "rssBytes": 879181824
    },
    {
      "seconds": 1050.54,
      "rssBytes": 879362048
    },
    {
      "seconds": 1051.55,
      "rssBytes": 927039488
    },
    {
      "seconds": 1052.56,
      "rssBytes": 927039488
    },
    {
      "seconds": 1053.58,
      "rssBytes": 927039488
    },
    {
      "seconds": 1054.59,
      "rssBytes": 927039488
    },
    {
      "seconds": 1055.61,
      "rssBytes": 927039488
    },
    {
      "seconds": 1056.62,
      "rssBytes": 926990336
    },
    {
      "seconds": 1057.63,
      "rssBytes": 926990336
    },
    {
      "seconds": 1058.65,
      "rssBytes": 919797760
    },
    {
      "seconds": 1059.66,
      "rssBytes": 924188672
    },
    {
      "seconds": 1060.67,
      "rssBytes": 924205056
    },
    {
      "seconds": 1061.68,
      "rssBytes": 924909568
    },
    {
      "seconds": 1062.69,
      "rssBytes": 925384704
    },
    {
      "seconds": 1063.7,
      "rssBytes": 925908992
    },
    {
      "seconds": 1064.71,
      "rssBytes": 927760384
    },
    {
      "seconds": 1065.73,
      "rssBytes": 933560320
    },
    {
      "seconds": 1066.74,
      "rssBytes": 934707200
    },
    {
      "seconds": 1067.75,
      "rssBytes": 934707200
    },
    {
      "seconds": 1068.76,
      "rssBytes": 935329792
    },
    {
      "seconds": 1069.78,
      "rssBytes": 944816128
    },
    {
      "seconds": 1070.79,
      "rssBytes": 944816128
    },
    {
      "seconds": 1071.8,
      "rssBytes": 944816128
    },
    {
      "seconds": 1072.81,
      "rssBytes": 944816128
    },
    {
      "seconds": 1073.82,
      "rssBytes": 946388992
    },
    {
      "seconds": 1074.84,
      "rssBytes": 946716672
    },
    {
      "seconds": 1075.86,
      "rssBytes": 946847744
    },
    {
      "seconds": 1076.87,
      "rssBytes": 946962432
    },
    {
      "seconds": 1077.88,
      "rssBytes": 947093504
    },
    {
      "seconds": 1078.89,
      "rssBytes": 947699712
    },
    {
      "seconds": 1079.91,
      "rssBytes": 947978240
    },
    {
      "seconds": 1080.92,
      "rssBytes": 948289536
    },
    {
      "seconds": 1081.93,
      "rssBytes": 948436992
    },
    {
      "seconds": 1082.94,
      "rssBytes": 948764672
    },
    {
      "seconds": 1083.95,
      "rssBytes": 949125120
    },
    {
      "seconds": 1084.96,
      "rssBytes": 949436416
    },
    {
      "seconds": 1085.97,
      "rssBytes": 949796864
    },
    {
      "seconds": 1086.99,
      "rssBytes": 950140928
    },
    {
      "seconds": 1088.0,
      "rssBytes": 950484992
    },
    {
      "seconds": 1089.02,
      "rssBytes": 950812672
    },
    {
      "seconds": 1090.03,
      "rssBytes": 944095232
    },
    {
      "seconds": 1091.04,
      "rssBytes": 945274880
    },
    {
      "seconds": 1092.06,
      "rssBytes": 947306496
    },
    {
      "seconds": 1093.07,
      "rssBytes": 950681600
    },
    {
      "seconds": 1094.08,
      "rssBytes": 952287232
    },
    {
      "seconds": 1095.1,
      "rssBytes": 954990592
    },
    {
      "seconds": 1096.12,
      "rssBytes": 993558528
    },
    {
      "seconds": 1097.13,
      "rssBytes": 994017280
    },
    {
      "seconds": 1098.15,
      "rssBytes": 994607104
    },
    {
      "seconds": 1099.16,
      "rssBytes": 995311616
    },
    {
      "seconds": 1100.18,
      "rssBytes": 995688448
    },
    {
      "seconds": 1101.19,
      "rssBytes": 998522880
    },
    {
      "seconds": 1102.2,
      "rssBytes": 999735296
    },
    {
      "seconds": 1103.22,
      "rssBytes": 1001046016
    },
    {
      "seconds": 1104.23,
      "rssBytes": 1002979328
    },
    {
      "seconds": 1105.24,
      "rssBytes": 1005371392
    },
    {
      "seconds": 1106.25,
      "rssBytes": 1046265856
    },
    {
      "seconds": 1107.26,
      "rssBytes": 1051246592
    },
    {
      "seconds": 1108.27,
      "rssBytes": 1056292864
    },
    {
      "seconds": 1109.28,
      "rssBytes": 1070891008
    },
    {
      "seconds": 1110.29,
      "rssBytes": 1076297728
    },
    {
      "seconds": 1111.3,
      "rssBytes": 1081147392
    },
    {
      "seconds": 1112.31,
      "rssBytes": 930840576
    },
    {
      "seconds": 1113.33,
      "rssBytes": 936099840
    },
    {
      "seconds": 1114.34,
      "rssBytes": 941588480
    },
    {
      "seconds": 1115.36,
      "rssBytes": 946372608
    },
    {
      "seconds": 1116.36,
      "rssBytes": 950976512
    },
    {
      "seconds": 1117.37,
      "rssBytes": 956006400
    },
    {
      "seconds": 1118.39,
      "rssBytes": 961691648
    },
    {
      "seconds": 1119.4,
      "rssBytes": 984645632
    },
    {
      "seconds": 1120.41,
      "rssBytes": 988528640
    },
    {
      "seconds": 1121.43,
      "rssBytes": 828440576
    },
    {
      "seconds": 1122.43,
      "rssBytes": 886259712
    },
    {
      "seconds": 1123.44,
      "rssBytes": 888340480
    },
    {
      "seconds": 1124.45,
      "rssBytes": 889995264
    },
    {
      "seconds": 1125.46,
      "rssBytes": 892944384
    },
    {
      "seconds": 1126.47,
      "rssBytes": 893419520
    },
    {
      "seconds": 1127.48,
      "rssBytes": 893419520
    },
    {
      "seconds": 1128.5,
      "rssBytes": 893419520
    },
    {
      "seconds": 1129.51,
      "rssBytes": 893452288
    },
    {
      "seconds": 1130.52,
      "rssBytes": 893501440
    },
    {
      "seconds": 1131.53,
      "rssBytes": 893501440
    },
    {
      "seconds": 1132.54,
      "rssBytes": 893501440
    },
    {
      "seconds": 1133.56,
      "rssBytes": 893501440
    },
    {
      "seconds": 1134.57,
      "rssBytes": 893501440
    },
    {
      "seconds": 1135.58,
      "rssBytes": 898220032
    },
    {
      "seconds": 1136.6,
      "rssBytes": 898220032
    },
    {
      "seconds": 1137.61,
      "rssBytes": 898220032
    },
    {
      "seconds": 1138.62,
      "rssBytes": 898220032
    },
    {
      "seconds": 1139.63,
      "rssBytes": 898220032
    },
    {
      "seconds": 1140.65,
      "rssBytes": 898236416
    },
    {
      "seconds": 1141.66,
      "rssBytes": 898236416
    },
    {
      "seconds": 1142.68,
      "rssBytes": 898236416
    },
    {
      "seconds": 1143.69,
      "rssBytes": 898285568
    },
    {
      "seconds": 1144.71,
      "rssBytes": 898285568
    },
    {
      "seconds": 1145.73,
      "rssBytes": 898285568
    },
    {
      "seconds": 1146.74,
      "rssBytes": 898285568
    },
    {
      "seconds": 1147.75,
      "rssBytes": 898285568
    },
    {
      "seconds": 1148.76,
      "rssBytes": 898285568
    },
    {
      "seconds": 1149.77,
      "rssBytes": 898285568
    },
    {
      "seconds": 1150.78,
      "rssBytes": 898940928
    },
    {
      "seconds": 1151.8,
      "rssBytes": 899039232
    },
    {
      "seconds": 1152.82,
      "rssBytes": 899039232
    },
    {
      "seconds": 1153.82,
      "rssBytes": 899039232
    },
    {
      "seconds": 1154.83,
      "rssBytes": 894828544
    },
    {
      "seconds": 1155.85,
      "rssBytes": 896991232
    },
    {
      "seconds": 1156.86,
      "rssBytes": 897024000
    },
    {
      "seconds": 1157.87,
      "rssBytes": 897040384
    },
    {
      "seconds": 1158.88,
      "rssBytes": 897843200
    },
    {
      "seconds": 1159.88,
      "rssBytes": 898351104
    },
    {
      "seconds": 1160.89,
      "rssBytes": 898351104
    },
    {
      "seconds": 1161.9,
      "rssBytes": 898351104
    },
    {
      "seconds": 1162.91,
      "rssBytes": 898351104
    },
    {
      "seconds": 1163.93,
      "rssBytes": 898351104
    },
    {
      "seconds": 1164.94,
      "rssBytes": 898351104
    },
    {
      "seconds": 1165.96,
      "rssBytes": 898351104
    },
    {
      "seconds": 1166.97,
      "rssBytes": 898351104
    },
    {
      "seconds": 1167.99,
      "rssBytes": 898351104
    },
    {
      "seconds": 1169.01,
      "rssBytes": 898351104
    },
    {
      "seconds": 1170.02,
      "rssBytes": 898351104
    },
    {
      "seconds": 1171.03,
      "rssBytes": 898301952
    },
    {
      "seconds": 1172.04,
      "rssBytes": 898301952
    },
    {
      "seconds": 1173.05,
      "rssBytes": 898301952
    },
    {
      "seconds": 1174.07,
      "rssBytes": 898301952
    },
    {
      "seconds": 1175.08,
      "rssBytes": 898301952
    },
    {
      "seconds": 1176.1,
      "rssBytes": 898301952
    },
    {
      "seconds": 1177.11,
      "rssBytes": 898318336
    },
    {
      "seconds": 1178.12,
      "rssBytes": 898318336
    },
    {
      "seconds": 1179.14,
      "rssBytes": 898318336
    },
    {
      "seconds": 1180.14,
      "rssBytes": 898318336
    },
    {
      "seconds": 1181.16,
      "rssBytes": 898334720
    },
    {
      "seconds": 1182.17,
      "rssBytes": 898334720
    },
    {
      "seconds": 1183.19,
      "rssBytes": 898334720
    },
    {
      "seconds": 1184.2,
      "rssBytes": 898334720
    },
    {
      "seconds": 1185.21,
      "rssBytes": 898433024
    },
    {
      "seconds": 1186.22,
      "rssBytes": 895959040
    },
    {
      "seconds": 1187.24,
      "rssBytes": 897449984
    },
    {
      "seconds": 1188.26,
      "rssBytes": 937639936
    },
    {
      "seconds": 1189.27,
      "rssBytes": 940572672
    },
    {
      "seconds": 1190.28,
      "rssBytes": 953024512
    },
    {
      "seconds": 1191.29,
      "rssBytes": 955400192
    },
    {
      "seconds": 1192.3,
      "rssBytes": 957956096
    },
    {
      "seconds": 1193.31,
      "rssBytes": 960987136
    },
    {
      "seconds": 1194.32,
      "rssBytes": 963117056
    },
    {
      "seconds": 1195.33,
      "rssBytes": 967606272
    },
    {
      "seconds": 1196.34,
      "rssBytes": 972816384
    },
    {
      "seconds": 1197.35,
      "rssBytes": 978075648
    },
    {
      "seconds": 1198.35,
      "rssBytes": 984694784
    },
    {
      "seconds": 1199.37,
      "rssBytes": 991903744
    },
    {
      "seconds": 1200.38,
      "rssBytes": 1002913792
    },
    {
      "seconds": 1201.39,
      "rssBytes": 1004109824
    },
    {
      "seconds": 1202.4,
      "rssBytes": 1005568000
    },
    {
      "seconds": 1203.41,
      "rssBytes": 1006764032
    },
    {
      "seconds": 1204.42,
      "rssBytes": 1009074176
    },
    {
      "seconds": 1205.43,
      "rssBytes": 1009074176
    },
    {
      "seconds": 1206.44,
      "rssBytes": 1009074176
    },
    {
      "seconds": 1207.45,
      "rssBytes": 1009074176
    },
    {
      "seconds": 1208.47,
      "rssBytes": 1008877568
    },
    {
      "seconds": 1209.48,
      "rssBytes": 1008877568
    },
    {
      "seconds": 1210.49,
      "rssBytes": 1008877568
    },
    {
      "seconds": 1211.51,
      "rssBytes": 1008877568
    },
    {
      "seconds": 1212.52,
      "rssBytes": 1008943104
    },
    {
      "seconds": 1213.53,
      "rssBytes": 1009041408
    },
    {
      "seconds": 1214.55,
      "rssBytes": 1009336320
    },
    {
      "seconds": 1215.56,
      "rssBytes": 1009336320
    },
    {
      "seconds": 1216.57,
      "rssBytes": 1009336320
    },
    {
      "seconds": 1217.58,
      "rssBytes": 1009336320
    },
    {
      "seconds": 1218.6,
      "rssBytes": 1003585536
    },
    {
      "seconds": 1219.62,
      "rssBytes": 1007206400
    },
    {
      "seconds": 1220.63,
      "rssBytes": 1007288320
    },
    {
      "seconds": 1221.64,
      "rssBytes": 1007681536
    },
    {
      "seconds": 1222.66,
      "rssBytes": 1008205824
    },
    {
      "seconds": 1223.67,
      "rssBytes": 1008205824
    },
    {
      "seconds": 1224.69,
      "rssBytes": 1008205824
    },
    {
      "seconds": 1225.71,
      "rssBytes": 1008205824
    },
    {
      "seconds": 1226.72,
      "rssBytes": 1008336896
    },
    {
      "seconds": 1227.73,
      "rssBytes": 1008336896
    },
    {
      "seconds": 1228.74,
      "rssBytes": 1008336896
    },
    {
      "seconds": 1229.74,
      "rssBytes": 1008336896
    },
    {
      "seconds": 1230.76,
      "rssBytes": 1008336896
    },
    {
      "seconds": 1231.77,
      "rssBytes": 1008353280
    },
    {
      "seconds": 1232.79,
      "rssBytes": 1008353280
    },
    {
      "seconds": 1233.8,
      "rssBytes": 1008353280
    },
    {
      "seconds": 1234.81,
      "rssBytes": 1008304128
    },
    {
      "seconds": 1235.83,
      "rssBytes": 1008304128
    },
    {
      "seconds": 1236.85,
      "rssBytes": 1008304128
    },
    {
      "seconds": 1237.86,
      "rssBytes": 1008304128
    },
    {
      "seconds": 1238.86,
      "rssBytes": 1008304128
    },
    {
      "seconds": 1239.88,
      "rssBytes": 1008402432
    },
    {
      "seconds": 1240.89,
      "rssBytes": 1008402432
    },
    {
      "seconds": 1241.89,
      "rssBytes": 1008402432
    },
    {
      "seconds": 1242.91,
      "rssBytes": 1008435200
    },
    {
      "seconds": 1243.93,
      "rssBytes": 1008435200
    },
    {
      "seconds": 1244.93,
      "rssBytes": 1008386048
    },
    {
      "seconds": 1245.94,
      "rssBytes": 1008386048
    },
    {
      "seconds": 1246.95,
      "rssBytes": 1008386048
    },
    {
      "seconds": 1247.97,
      "rssBytes": 1008386048
    },
    {
      "seconds": 1248.98,
      "rssBytes": 1008418816
    },
    {
      "seconds": 1250.0,
      "rssBytes": 1008418816
    },
    {
      "seconds": 1251.0,
      "rssBytes": 1003339776
    },
    {
      "seconds": 1252.02,
      "rssBytes": 1004552192
    },
    {
      "seconds": 1253.03,
      "rssBytes": 1007173632
    },
    {
      "seconds": 1254.03,
      "rssBytes": 1007190016
    },
    {
      "seconds": 1255.04,
      "rssBytes": 1008238592
    },
    {
      "seconds": 1256.05,
      "rssBytes": 1008369664
    },
    {
      "seconds": 1257.07,
      "rssBytes": 1008369664
    },
    {
      "seconds": 1258.08,
      "rssBytes": 1008320512
    },
    {
      "seconds": 1259.09,
      "rssBytes": 1008386048
    },
    {
      "seconds": 1260.1,
      "rssBytes": 1008451584
    },
    {
      "seconds": 1261.11,
      "rssBytes": 1008631808
    },
    {
      "seconds": 1262.12,
      "rssBytes": 1008680960
    },
    {
      "seconds": 1263.13,
      "rssBytes": 1008680960
    },
    {
      "seconds": 1264.16,
      "rssBytes": 1008828416
    },
    {
      "seconds": 1265.17,
      "rssBytes": 1008844800
    },
    {
      "seconds": 1266.17,
      "rssBytes": 1008959488
    },
    {
      "seconds": 1267.19,
      "rssBytes": 1008959488
    },
    {
      "seconds": 1268.21,
      "rssBytes": 1008959488
    },
    {
      "seconds": 1269.22,
      "rssBytes": 1008877568
    },
    {
      "seconds": 1270.23,
      "rssBytes": 1008828416
    },
    {
      "seconds": 1271.24,
      "rssBytes": 1008828416
    },
    {
      "seconds": 1272.25,
      "rssBytes": 1008975872
    },
    {
      "seconds": 1273.26,
      "rssBytes": 1008975872
    },
    {
      "seconds": 1274.26,
      "rssBytes": 1008975872
    },
    {
      "seconds": 1275.28,
      "rssBytes": 1008975872
    },
    {
      "seconds": 1276.3,
      "rssBytes": 1009057792
    },
    {
      "seconds": 1277.31,
      "rssBytes": 1009090560
    },
    {
      "seconds": 1278.32,
      "rssBytes": 1009041408
    },
    {
      "seconds": 1279.32,
      "rssBytes": 1009041408
    },
    {
      "seconds": 1280.33,
      "rssBytes": 1009041408
    },
    {
      "seconds": 1281.35,
      "rssBytes": 1009041408
    },
    {
      "seconds": 1282.35,
      "rssBytes": 1004732416
    },
    {
      "seconds": 1283.36,
      "rssBytes": 1008844800
    },
    {
      "seconds": 1284.37,
      "rssBytes": 1046839296
    },
    {
      "seconds": 1285.38,
      "rssBytes": 1056505856
    },
    {
      "seconds": 1286.39,
      "rssBytes": 1056505856
    },
    {
      "seconds": 1287.4,
      "rssBytes": 1056505856
    },
    {
      "seconds": 1288.42,
      "rssBytes": 1056505856
    },
    {
      "seconds": 1289.43,
      "rssBytes": 1056505856
    },
    {
      "seconds": 1290.44,
      "rssBytes": 1056555008
    },
    {
      "seconds": 1291.45,
      "rssBytes": 1056505856
    },
    {
      "seconds": 1292.47,
      "rssBytes": 1056522240
    },
    {
      "seconds": 1293.48,
      "rssBytes": 1056522240
    },
    {
      "seconds": 1294.5,
      "rssBytes": 1056391168
    },
    {
      "seconds": 1295.5,
      "rssBytes": 1056391168
    },
    {
      "seconds": 1296.51,
      "rssBytes": 1057013760
    },
    {
      "seconds": 1297.52,
      "rssBytes": 1057013760
    },
    {
      "seconds": 1298.54,
      "rssBytes": 1057013760
    },
    {
      "seconds": 1299.55,
      "rssBytes": 1057013760
    },
    {
      "seconds": 1300.57,
      "rssBytes": 1056866304
    },
    {
      "seconds": 1301.58,
      "rssBytes": 1056866304
    },
    {
      "seconds": 1302.6,
      "rssBytes": 1056866304
    },
    {
      "seconds": 1303.62,
      "rssBytes": 1056866304
    },
    {
      "seconds": 1304.63,
      "rssBytes": 1056866304
    },
    {
      "seconds": 1305.64,
      "rssBytes": 1056768000
    },
    {
      "seconds": 1306.65,
      "rssBytes": 1056768000
    },
    {
      "seconds": 1307.67,
      "rssBytes": 1056768000
    },
    {
      "seconds": 1308.68,
      "rssBytes": 1056817152
    },
    {
      "seconds": 1309.7,
      "rssBytes": 1057079296
    },
    {
      "seconds": 1310.71,
      "rssBytes": 1057079296
    },
    {
      "seconds": 1311.72,
      "rssBytes": 1057079296
    },
    {
      "seconds": 1312.74,
      "rssBytes": 1057095680
    },
    {
      "seconds": 1313.75,
      "rssBytes": 1052884992
    },
    {
      "seconds": 1314.76,
      "rssBytes": 1053392896
    },
    {
      "seconds": 1315.78,
      "rssBytes": 1054244864
    },
    {
      "seconds": 1316.79,
      "rssBytes": 1054687232
    },
    {
      "seconds": 1317.8,
      "rssBytes": 1054687232
    },
    {
      "seconds": 1318.82,
      "rssBytes": 1054687232
    },
    {
      "seconds": 1319.83,
      "rssBytes": 1055080448
    },
    {
      "seconds": 1320.85,
      "rssBytes": 1055637504
    },
    {
      "seconds": 1321.86,
      "rssBytes": 1055637504
    },
    {
      "seconds": 1322.88,
      "rssBytes": 1056407552
    },
    {
      "seconds": 1323.9,
      "rssBytes": 1056440320
    },
    {
      "seconds": 1324.92,
      "rssBytes": 1056391168
    },
    {
      "seconds": 1325.93,
      "rssBytes": 1056391168
    },
    {
      "seconds": 1326.94,
      "rssBytes": 1056391168
    },
    {
      "seconds": 1327.95,
      "rssBytes": 1056686080
    },
    {
      "seconds": 1328.96,
      "rssBytes": 1058914304
    },
    {
      "seconds": 1329.98,
      "rssBytes": 1058947072
    },
    {
      "seconds": 1330.99,
      "rssBytes": 1058947072
    },
    {
      "seconds": 1332.0,
      "rssBytes": 1058963456
    },
    {
      "seconds": 1333.02,
      "rssBytes": 1058799616
    },
    {
      "seconds": 1334.04,
      "rssBytes": 1058799616
    },
    {
      "seconds": 1335.04,
      "rssBytes": 1058652160
    },
    {
      "seconds": 1336.05,
      "rssBytes": 1058652160
    },
    {
      "seconds": 1337.06,
      "rssBytes": 1058684928
    },
    {
      "seconds": 1338.07,
      "rssBytes": 1058701312
    },
    {
      "seconds": 1339.08,
      "rssBytes": 1059045376
    },
    {
      "seconds": 1340.09,
      "rssBytes": 1059078144
    },
    {
      "seconds": 1341.1,
      "rssBytes": 1059078144
    },
    {
      "seconds": 1342.11,
      "rssBytes": 1059078144
    },
    {
      "seconds": 1343.11,
      "rssBytes": 1059078144
    },
    {
      "seconds": 1344.12,
      "rssBytes": 1058897920
    },
    {
      "seconds": 1345.13,
      "rssBytes": 1058897920
    },
    {
      "seconds": 1346.14,
      "rssBytes": 1054113792
    },
    {
      "seconds": 1347.16,
      "rssBytes": 1054261248
    },
    {
      "seconds": 1348.17,
      "rssBytes": 1054277632
    },
    {
      "seconds": 1349.18,
      "rssBytes": 1054310400
    },
    {
      "seconds": 1350.19,
      "rssBytes": 1054539776
    },
    {
      "seconds": 1351.2,
      "rssBytes": 1055047680
    },
    {
      "seconds": 1352.22,
      "rssBytes": 1055653888
    },
    {
      "seconds": 1353.22,
      "rssBytes": 1055653888
    },
    {
      "seconds": 1354.23,
      "rssBytes": 1055883264
    },
    {
      "seconds": 1355.24,
      "rssBytes": 1055883264
    },
    {
      "seconds": 1356.25,
      "rssBytes": 1057144832
    },
    {
      "seconds": 1357.26,
      "rssBytes": 1057193984
    },
    {
      "seconds": 1358.27,
      "rssBytes": 1057144832
    },
    {
      "seconds": 1359.28,
      "rssBytes": 1057521664
    },
    {
      "seconds": 1360.3,
      "rssBytes": 1059192832
    },
    {
      "seconds": 1361.32,
      "rssBytes": 1061289984
    },
    {
      "seconds": 1362.34,
      "rssBytes": 1061322752
    },
    {
      "seconds": 1363.36,
      "rssBytes": 1072889856
    },
    {
      "seconds": 1364.38,
      "rssBytes": 1104150528
    },
    {
      "seconds": 1365.4,
      "rssBytes": 1106755584
    },
    {
      "seconds": 1366.42,
      "rssBytes": 1108197376
    },
    {
      "seconds": 1367.44,
      "rssBytes": 1119027200
    },
    {
      "seconds": 1368.46,
      "rssBytes": 1120010240
    },
    {
      "seconds": 1369.48,
      "rssBytes": 1120616448
    },
    {
      "seconds": 1370.49,
      "rssBytes": 1122598912
    },
    {
      "seconds": 1371.5,
      "rssBytes": 1124433920
    },
    {
      "seconds": 1372.51,
      "rssBytes": 1126170624
    },
    {
      "seconds": 1373.53,
      "rssBytes": 1128218624
    },
    {
      "seconds": 1374.54,
      "rssBytes": 1130315776
    },
    {
      "seconds": 1375.54,
      "rssBytes": 1132625920
    },
    {
      "seconds": 1376.56,
      "rssBytes": 1134395392
    },
    {
      "seconds": 1377.57,
      "rssBytes": 1126072320
    },
    {
      "seconds": 1378.58,
      "rssBytes": 1129234432
    },
    {
      "seconds": 1379.59,
      "rssBytes": 1135722496
    },
    {
      "seconds": 1380.6,
      "rssBytes": 1137311744
    },
    {
      "seconds": 1381.61,
      "rssBytes": 1139425280
    },
    {
      "seconds": 1382.63,
      "rssBytes": 1141080064
    },
    {
      "seconds": 1383.66,
      "rssBytes": 1142620160
    },
    {
      "seconds": 1384.66,
      "rssBytes": 1144684544
    },
    {
      "seconds": 1385.67,
      "rssBytes": 1146290176
    },
    {
      "seconds": 1386.68,
      "rssBytes": 1009762304
    },
    {
      "seconds": 1387.7,
      "rssBytes": 1011122176
    },
    {
      "seconds": 1388.7,
      "rssBytes": 1012596736
    },
    {
      "seconds": 1389.72,
      "rssBytes": 1016954880
    },
    {
      "seconds": 1390.73,
      "rssBytes": 1018462208
    },
    {
      "seconds": 1391.79,
      "rssBytes": 1018068992
    },
    {
      "seconds": 1392.79,
      "rssBytes": 983515136
    },
    {
      "seconds": 1393.8,
      "rssBytes": 984989696
    },
    {
      "seconds": 1394.81,
      "rssBytes": 986628096
    },
    {
      "seconds": 1395.82,
      "rssBytes": 988266496
    },
    {
      "seconds": 1396.89,
      "rssBytes": 990248960
    },
    {
      "seconds": 1397.9,
      "rssBytes": 991985664
    },
    {
      "seconds": 1398.92,
      "rssBytes": 993280000
    },
    {
      "seconds": 1399.93,
      "rssBytes": 994902016
    },
    {
      "seconds": 1400.94,
      "rssBytes": 996720640
    },
    {
      "seconds": 1401.95,
      "rssBytes": 997703680
    },
    {
      "seconds": 1402.97,
      "rssBytes": 998653952
    },
    {
      "seconds": 1403.98,
      "rssBytes": 999768064
    },
    {
      "seconds": 1404.99,
      "rssBytes": 1000177664
    },
    {
      "seconds": 1406.0,
      "rssBytes": 1000177664
    },
    {
      "seconds": 1407.01,
      "rssBytes": 1002799104
    },
    {
      "seconds": 1408.02,
      "rssBytes": 1011957760
    },
    {
      "seconds": 1409.04,
      "rssBytes": 1011712000
    },
    {
      "seconds": 1410.05,
      "rssBytes": 1007058944
    },
    {
      "seconds": 1411.06,
      "rssBytes": 1007370240
    },
    {
      "seconds": 1412.07,
      "rssBytes": 1007927296
    },
    {
      "seconds": 1413.09,
      "rssBytes": 1009074176
    },
    {
      "seconds": 1414.1,
      "rssBytes": 1009090560
    },
    {
      "seconds": 1415.11,
      "rssBytes": 1009090560
    },
    {
      "seconds": 1416.13,
      "rssBytes": 1009418240
    },
    {
      "seconds": 1417.15,
      "rssBytes": 1009418240
    },
    {
      "seconds": 1418.16,
      "rssBytes": 1009418240
    },
    {
      "seconds": 1419.17,
      "rssBytes": 1009418240
    },
    {
      "seconds": 1420.18,
      "rssBytes": 1009418240
    },
    {
      "seconds": 1421.19,
      "rssBytes": 1009418240
    },
    {
      "seconds": 1422.2,
      "rssBytes": 1009631232
    },
    {
      "seconds": 1423.21,
      "rssBytes": 1009631232
    },
    {
      "seconds": 1424.22,
      "rssBytes": 1009631232
    },
    {
      "seconds": 1425.24,
      "rssBytes": 1009631232
    },
    {
      "seconds": 1426.25,
      "rssBytes": 1009680384
    },
    {
      "seconds": 1427.26,
      "rssBytes": 1057062912
    },
    {
      "seconds": 1428.28,
      "rssBytes": 1058947072
    },
    {
      "seconds": 1429.29,
      "rssBytes": 1062273024
    },
    {
      "seconds": 1430.3,
      "rssBytes": 1065041920
    },
    {
      "seconds": 1431.31,
      "rssBytes": 1067941888
    },
    {
      "seconds": 1432.32,
      "rssBytes": 1071038464
    },
    {
      "seconds": 1433.32,
      "rssBytes": 1074085888
    },
    {
      "seconds": 1434.34,
      "rssBytes": 1078263808
    },
    {
      "seconds": 1435.35,
      "rssBytes": 1081851904
    },
    {
      "seconds": 1436.36,
      "rssBytes": 1085505536
    },
    {
      "seconds": 1437.37,
      "rssBytes": 1089257472
    },
    {
      "seconds": 1438.38,
      "rssBytes": 1090420736
    },
    {
      "seconds": 1439.39,
      "rssBytes": 1090420736
    },
    {
      "seconds": 1440.41,
      "rssBytes": 1090420736
    },
    {
      "seconds": 1441.43,
      "rssBytes": 1090420736
    },
    {
      "seconds": 1442.44,
      "rssBytes": 1086242816
    },
    {
      "seconds": 1443.45,
      "rssBytes": 1088962560
    },
    {
      "seconds": 1444.46,
      "rssBytes": 1089617920
    },
    {
      "seconds": 1445.48,
      "rssBytes": 1090404352
    },
    {
      "seconds": 1446.49,
      "rssBytes": 1090404352
    },
    {
      "seconds": 1447.51,
      "rssBytes": 1090355200
    },
    {
      "seconds": 1448.53,
      "rssBytes": 1090355200
    },
    {
      "seconds": 1449.54,
      "rssBytes": 1090306048
    },
    {
      "seconds": 1450.55,
      "rssBytes": 1090387968
    },
    {
      "seconds": 1451.57,
      "rssBytes": 1090387968
    },
    {
      "seconds": 1452.58,
      "rssBytes": 1090387968
    },
    {
      "seconds": 1453.6,
      "rssBytes": 1090387968
    },
    {
      "seconds": 1454.62,
      "rssBytes": 1090338816
    },
    {
      "seconds": 1455.63,
      "rssBytes": 1090666496
    },
    {
      "seconds": 1456.64,
      "rssBytes": 1090846720
    },
    {
      "seconds": 1457.65,
      "rssBytes": 1090846720
    },
    {
      "seconds": 1458.67,
      "rssBytes": 1090846720
    },
    {
      "seconds": 1459.69,
      "rssBytes": 1090846720
    },
    {
      "seconds": 1460.7,
      "rssBytes": 1092059136
    },
    {
      "seconds": 1461.71,
      "rssBytes": 1093828608
    },
    {
      "seconds": 1462.72,
      "rssBytes": 1095254016
    },
    {
      "seconds": 1463.73,
      "rssBytes": 1096073216
    },
    {
      "seconds": 1464.74,
      "rssBytes": 1097531392
    },
    {
      "seconds": 1465.75,
      "rssBytes": 1098530816
    },
    {
      "seconds": 1466.77,
      "rssBytes": 1099530240
    },
    {
      "seconds": 1467.78,
      "rssBytes": 1100611584
    },
    {
      "seconds": 1468.79,
      "rssBytes": 1101545472
    },
    {
      "seconds": 1469.8,
      "rssBytes": 1102544896
    },
    {
      "seconds": 1470.81,
      "rssBytes": 1103544320
    },
    {
      "seconds": 1471.83,
      "rssBytes": 1104379904
    },
    {
      "seconds": 1472.83,
      "rssBytes": 1139146752
    },
    {
      "seconds": 1473.85,
      "rssBytes": 1133133824
    },
    {
      "seconds": 1474.87,
      "rssBytes": 1136001024
    },
    {
      "seconds": 1475.88,
      "rssBytes": 1137393664
    },
    {
      "seconds": 1476.9,
      "rssBytes": 1137655808
    },
    {
      "seconds": 1477.91,
      "rssBytes": 1138540544
    },
    {
      "seconds": 1478.92,
      "rssBytes": 1138540544
    },
    {
      "seconds": 1479.94,
      "rssBytes": 1139785728
    },
    {
      "seconds": 1480.95,
      "rssBytes": 1139834880
    },
    {
      "seconds": 1481.96,
      "rssBytes": 1140097024
    },
    {
      "seconds": 1482.97,
      "rssBytes": 1140310016
    },
    {
      "seconds": 1483.98,
      "rssBytes": 1140310016
    },
    {
      "seconds": 1484.99,
      "rssBytes": 1140375552
    },
    {
      "seconds": 1486.01,
      "rssBytes": 1141669888
    },
    {
      "seconds": 1487.02,
      "rssBytes": 1142800384
    },
    {
      "seconds": 1488.03,
      "rssBytes": 1142800384
    },
    {
      "seconds": 1489.04,
      "rssBytes": 1142554624
    },
    {
      "seconds": 1490.05,
      "rssBytes": 1142603776
    },
    {
      "seconds": 1491.07,
      "rssBytes": 1142603776
    },
    {
      "seconds": 1492.08,
      "rssBytes": 1142603776
    },
    {
      "seconds": 1493.1,
      "rssBytes": 1142603776
    },
    {
      "seconds": 1494.11,
      "rssBytes": 1142849536
    },
    {
      "seconds": 1495.13,
      "rssBytes": 1142849536
    },
    {
      "seconds": 1496.14,
      "rssBytes": 1143013376
    },
    {
      "seconds": 1497.15,
      "rssBytes": 1143013376
    },
    {
      "seconds": 1498.16,
      "rssBytes": 1143029760
    },
    {
      "seconds": 1499.18,
      "rssBytes": 1143029760
    },
    {
      "seconds": 1500.18,
      "rssBytes": 1143029760
    },
    {
      "seconds": 1501.19,
      "rssBytes": 1143029760
    },
    {
      "seconds": 1502.21,
      "rssBytes": 1143078912
    },
    {
      "seconds": 1503.23,
      "rssBytes": 1143078912
    },
    {
      "seconds": 1504.24,
      "rssBytes": 1143209984
    },
    {
      "seconds": 1505.25,
      "rssBytes": 1143209984
    },
    {
      "seconds": 1506.27,
      "rssBytes": 1135656960
    },
    {
      "seconds": 1507.28,
      "rssBytes": 1137475584
    },
    {
      "seconds": 1508.29,
      "rssBytes": 1137475584
    },
    {
      "seconds": 1509.3,
      "rssBytes": 1138688000
    },
    {
      "seconds": 1510.32,
      "rssBytes": 1138704384
    },
    {
      "seconds": 1511.33,
      "rssBytes": 1139294208
    },
    {
      "seconds": 1512.35,
      "rssBytes": 1139408896
    },
    {
      "seconds": 1513.36,
      "rssBytes": 1139408896
    },
    {
      "seconds": 1514.38,
      "rssBytes": 1139408896
    },
    {
      "seconds": 1515.4,
      "rssBytes": 1139359744
    },
    {
      "seconds": 1516.41,
      "rssBytes": 1139359744
    },
    {
      "seconds": 1517.41,
      "rssBytes": 1139507200
    },
    {
      "seconds": 1518.42,
      "rssBytes": 1140195328
    },
    {
      "seconds": 1519.44,
      "rssBytes": 1140195328
    },
    {
      "seconds": 1520.45,
      "rssBytes": 1140195328
    },
    {
      "seconds": 1521.46,
      "rssBytes": 1140195328
    },
    {
      "seconds": 1522.47,
      "rssBytes": 1140031488
    },
    {
      "seconds": 1523.49,
      "rssBytes": 1140375552
    },
    {
      "seconds": 1524.5,
      "rssBytes": 1140391936
    },
    {
      "seconds": 1525.51,
      "rssBytes": 1140948992
    },
    {
      "seconds": 1526.52,
      "rssBytes": 1141014528
    },
    {
      "seconds": 1527.53,
      "rssBytes": 1143357440
    },
    {
      "seconds": 1528.55,
      "rssBytes": 1143357440
    },
    {
      "seconds": 1529.57,
      "rssBytes": 1143455744
    },
    {
      "seconds": 1530.59,
      "rssBytes": 1143504896
    },
    {
      "seconds": 1531.6,
      "rssBytes": 1143209984
    },
    {
      "seconds": 1532.61,
      "rssBytes": 1143275520
    },
    {
      "seconds": 1533.62,
      "rssBytes": 1143275520
    },
    {
      "seconds": 1534.63,
      "rssBytes": 1143275520
    },
    {
      "seconds": 1535.65,
      "rssBytes": 1143275520
    },
    {
      "seconds": 1536.66,
      "rssBytes": 1143275520
    },
    {
      "seconds": 1537.67,
      "rssBytes": 1137393664
    },
    {
      "seconds": 1538.69,
      "rssBytes": 1142816768
    },
    {
      "seconds": 1539.7,
      "rssBytes": 1143275520
    },
    {
      "seconds": 1540.72,
      "rssBytes": 1143275520
    },
    {
      "seconds": 1541.74,
      "rssBytes": 1143472128
    },
    {
      "seconds": 1542.74,
      "rssBytes": 1143717888
    },
    {
      "seconds": 1543.75,
      "rssBytes": 1143717888
    },
    {
      "seconds": 1544.77,
      "rssBytes": 1143750656
    },
    {
      "seconds": 1545.78,
      "rssBytes": 1143750656
    },
    {
      "seconds": 1546.8,
      "rssBytes": 1143750656
    },
    {
      "seconds": 1547.81,
      "rssBytes": 1143750656
    },
    {
      "seconds": 1548.83,
      "rssBytes": 1143783424
    },
    {
      "seconds": 1549.84,
      "rssBytes": 1143783424
    },
    {
      "seconds": 1550.85,
      "rssBytes": 1144455168
    },
    {
      "seconds": 1551.86,
      "rssBytes": 1144537088
    },
    {
      "seconds": 1552.88,
      "rssBytes": 1144537088
    },
    {
      "seconds": 1553.9,
      "rssBytes": 1144602624
    },
    {
      "seconds": 1554.91,
      "rssBytes": 1144602624
    },
    {
      "seconds": 1555.93,
      "rssBytes": 1144602624
    },
    {
      "seconds": 1556.94,
      "rssBytes": 1144619008
    },
    {
      "seconds": 1557.95,
      "rssBytes": 1144684544
    },
    {
      "seconds": 1558.96,
      "rssBytes": 1144684544
    },
    {
      "seconds": 1559.97,
      "rssBytes": 1144684544
    },
    {
      "seconds": 1560.98,
      "rssBytes": 1144717312
    },
    {
      "seconds": 1561.99,
      "rssBytes": 1144897536
    },
    {
      "seconds": 1563.01,
      "rssBytes": 1185103872
    },
    {
      "seconds": 1564.02,
      "rssBytes": 1189609472
    },
    {
      "seconds": 1565.04,
      "rssBytes": 1193967616
    },
    {
      "seconds": 1566.05,
      "rssBytes": 1198931968
    },
    {
      "seconds": 1567.06,
      "rssBytes": 1201864704
    },
    {
      "seconds": 1568.08,
      "rssBytes": 1202749440
    },
    {
      "seconds": 1569.09,
      "rssBytes": 1205501952
    },
    {
      "seconds": 1570.1,
      "rssBytes": 1199259648
    },
    {
      "seconds": 1571.11,
      "rssBytes": 1199423488
    },
    {
      "seconds": 1572.13,
      "rssBytes": 1206861824
    },
    {
      "seconds": 1573.15,
      "rssBytes": 1208991744
    },
    {
      "seconds": 1574.16,
      "rssBytes": 1210826752
    },
    {
      "seconds": 1575.18,
      "rssBytes": 1212710912
    },
    {
      "seconds": 1576.19,
      "rssBytes": 1214300160
    },
    {
      "seconds": 1577.21,
      "rssBytes": 1215512576
    },
    {
      "seconds": 1578.22,
      "rssBytes": 1217282048
    },
    {
      "seconds": 1579.24,
      "rssBytes": 1219461120
    },
    {
      "seconds": 1580.26,
      "rssBytes": 1220722688
    },
    {
      "seconds": 1581.27,
      "rssBytes": 1222475776
    },
    {
      "seconds": 1582.29,
      "rssBytes": 1225867264
    },
    {
      "seconds": 1583.3,
      "rssBytes": 1228062720
    },
    {
      "seconds": 1584.31,
      "rssBytes": 1229963264
    },
    {
      "seconds": 1585.33,
      "rssBytes": 1231765504
    },
    {
      "seconds": 1586.35,
      "rssBytes": 1233666048
    },
    {
      "seconds": 1587.36,
      "rssBytes": 1235288064
    },
    {
      "seconds": 1588.38,
      "rssBytes": 1237155840
    },
    {
      "seconds": 1589.4,
      "rssBytes": 1238581248
    },
    {
      "seconds": 1590.41,
      "rssBytes": 1240563712
    },
    {
      "seconds": 1591.43,
      "rssBytes": 1242578944
    },
    {
      "seconds": 1592.44,
      "rssBytes": 1243627520
    },
    {
      "seconds": 1593.46,
      "rssBytes": 1244626944
    },
    {
      "seconds": 1594.48,
      "rssBytes": 1245593600
    },
    {
      "seconds": 1595.49,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1596.51,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1597.53,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1598.54,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1599.56,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1600.57,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1601.58,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1602.59,
      "rssBytes": 1245216768
    },
    {
      "seconds": 1603.61,
      "rssBytes": 1245216768
    },
    {
      "seconds": 1604.62,
      "rssBytes": 1245708288
    },
    {
      "seconds": 1605.63,
      "rssBytes": 1246068736
    },
    {
      "seconds": 1606.65,
      "rssBytes": 1246199808
    },
    {
      "seconds": 1607.66,
      "rssBytes": 1246216192
    },
    {
      "seconds": 1608.67,
      "rssBytes": 1246773248
    },
    {
      "seconds": 1609.68,
      "rssBytes": 1246773248
    },
    {
      "seconds": 1610.7,
      "rssBytes": 1246773248
    },
    {
      "seconds": 1611.71,
      "rssBytes": 1246789632
    },
    {
      "seconds": 1612.73,
      "rssBytes": 1246740480
    },
    {
      "seconds": 1613.74,
      "rssBytes": 1246740480
    },
    {
      "seconds": 1614.75,
      "rssBytes": 1247100928
    },
    {
      "seconds": 1615.76,
      "rssBytes": 1247281152
    },
    {
      "seconds": 1616.78,
      "rssBytes": 1252065280
    },
    {
      "seconds": 1617.79,
      "rssBytes": 1252229120
    },
    {
      "seconds": 1618.81,
      "rssBytes": 1255669760
    },
    {
      "seconds": 1619.82,
      "rssBytes": 1256423424
    },
    {
      "seconds": 1620.83,
      "rssBytes": 1259012096
    },
    {
      "seconds": 1621.84,
      "rssBytes": 1259012096
    },
    {
      "seconds": 1622.86,
      "rssBytes": 1259175936
    },
    {
      "seconds": 1623.87,
      "rssBytes": 1261387776
    },
    {
      "seconds": 1624.88,
      "rssBytes": 1261961216
    },
    {
      "seconds": 1625.9,
      "rssBytes": 1261977600
    },
    {
      "seconds": 1626.91,
      "rssBytes": 1261977600
    },
    {
      "seconds": 1627.93,
      "rssBytes": 1261977600
    },
    {
      "seconds": 1628.95,
      "rssBytes": 1261830144
    },
    {
      "seconds": 1629.96,
      "rssBytes": 1261830144
    },
    {
      "seconds": 1630.97,
      "rssBytes": 1261830144
    },
    {
      "seconds": 1631.98,
      "rssBytes": 1261830144
    },
    {
      "seconds": 1632.99,
      "rssBytes": 1261830144
    },
    {
      "seconds": 1634.0,
      "rssBytes": 1254866944
    },
    {
      "seconds": 1635.02,
      "rssBytes": 1256357888
    },
    {
      "seconds": 1636.04,
      "rssBytes": 1257603072
    },
    {
      "seconds": 1637.05,
      "rssBytes": 1257603072
    },
    {
      "seconds": 1638.07,
      "rssBytes": 1258209280
    },
    {
      "seconds": 1639.08,
      "rssBytes": 1258340352
    },
    {
      "seconds": 1640.09,
      "rssBytes": 1258340352
    },
    {
      "seconds": 1641.1,
      "rssBytes": 1258340352
    },
    {
      "seconds": 1642.12,
      "rssBytes": 1258635264
    },
    {
      "seconds": 1643.13,
      "rssBytes": 1258864640
    },
    {
      "seconds": 1644.14,
      "rssBytes": 1258864640
    },
    {
      "seconds": 1645.16,
      "rssBytes": 1258897408
    },
    {
      "seconds": 1646.17,
      "rssBytes": 1259159552
    },
    {
      "seconds": 1647.19,
      "rssBytes": 1259454464
    },
    {
      "seconds": 1648.2,
      "rssBytes": 1259454464
    },
    {
      "seconds": 1649.22,
      "rssBytes": 1259454464
    },
    {
      "seconds": 1650.23,
      "rssBytes": 1259454464
    },
    {
      "seconds": 1651.25,
      "rssBytes": 1259126784
    },
    {
      "seconds": 1652.26,
      "rssBytes": 1259126784
    },
    {
      "seconds": 1653.28,
      "rssBytes": 1259126784
    },
    {
      "seconds": 1654.29,
      "rssBytes": 1259126784
    },
    {
      "seconds": 1655.3,
      "rssBytes": 1259126784
    },
    {
      "seconds": 1656.31,
      "rssBytes": 1259126784
    },
    {
      "seconds": 1657.32,
      "rssBytes": 1259126784
    },
    {
      "seconds": 1658.34,
      "rssBytes": 1259028480
    },
    {
      "seconds": 1659.35,
      "rssBytes": 1259028480
    },
    {
      "seconds": 1660.37,
      "rssBytes": 1259028480
    },
    {
      "seconds": 1661.38,
      "rssBytes": 1259028480
    },
    {
      "seconds": 1662.4,
      "rssBytes": 1259061248
    },
    {
      "seconds": 1663.42,
      "rssBytes": 1259061248
    },
    {
      "seconds": 1664.43,
      "rssBytes": 1259061248
    },
    {
      "seconds": 1665.45,
      "rssBytes": 1259061248
    },
    {
      "seconds": 1666.46,
      "rssBytes": 1253277696
    },
    {
      "seconds": 1667.47,
      "rssBytes": 1254653952
    },
    {
      "seconds": 1668.48,
      "rssBytes": 1257750528
    },
    {
      "seconds": 1669.49,
      "rssBytes": 1258405888
    },
    {
      "seconds": 1670.51,
      "rssBytes": 1258405888
    },
    {
      "seconds": 1671.53,
      "rssBytes": 1258405888
    },
    {
      "seconds": 1672.53,
      "rssBytes": 1258405888
    },
    {
      "seconds": 1673.54,
      "rssBytes": 1258389504
    },
    {
      "seconds": 1674.55,
      "rssBytes": 1258536960
    },
    {
      "seconds": 1675.56,
      "rssBytes": 1258536960
    },
    {
      "seconds": 1676.57,
      "rssBytes": 1258520576
    },
    {
      "seconds": 1677.59,
      "rssBytes": 1258700800
    },
    {
      "seconds": 1678.6,
      "rssBytes": 1258766336
    },
    {
      "seconds": 1679.61,
      "rssBytes": 1258897408
    },
    {
      "seconds": 1680.63,
      "rssBytes": 1259094016
    },
    {
      "seconds": 1681.64,
      "rssBytes": 1259077632
    },
    {
      "seconds": 1682.66,
      "rssBytes": 1259077632
    },
    {
      "seconds": 1683.67,
      "rssBytes": 1259634688
    },
    {
      "seconds": 1684.68,
      "rssBytes": 1259634688
    },
    {
      "seconds": 1685.7,
      "rssBytes": 1259634688
    },
    {
      "seconds": 1686.7,
      "rssBytes": 1259634688
    },
    {
      "seconds": 1687.71,
      "rssBytes": 1259962368
    },
    {
      "seconds": 1688.73,
      "rssBytes": 1259962368
    },
    {
      "seconds": 1689.73,
      "rssBytes": 1259962368
    },
    {
      "seconds": 1690.75,
      "rssBytes": 1259978752
    },
    {
      "seconds": 1691.76,
      "rssBytes": 1260584960
    },
    {
      "seconds": 1692.77,
      "rssBytes": 1260584960
    },
    {
      "seconds": 1693.78,
      "rssBytes": 1260584960
    },
    {
      "seconds": 1694.79,
      "rssBytes": 1260584960
    },
    {
      "seconds": 1695.8,
      "rssBytes": 1260421120
    },
    {
      "seconds": 1696.81,
      "rssBytes": 1260421120
    },
    {
      "seconds": 1697.81,
      "rssBytes": 1260421120
    },
    {
      "seconds": 1698.83,
      "rssBytes": 1257488384
    },
    {
      "seconds": 1699.84,
      "rssBytes": 1257488384
    },
    {
      "seconds": 1700.85,
      "rssBytes": 1257684992
    },
    {
      "seconds": 1701.86,
      "rssBytes": 1257684992
    },
    {
      "seconds": 1702.87,
      "rssBytes": 1258045440
    },
    {
      "seconds": 1703.89,
      "rssBytes": 1258045440
    },
    {
      "seconds": 1704.9,
      "rssBytes": 1260732416
    },
    {
      "seconds": 1705.91,
      "rssBytes": 1260748800
    },
    {
      "seconds": 1706.92,
      "rssBytes": 1260748800
    },
    {
      "seconds": 1707.93,
      "rssBytes": 1260699648
    },
    {
      "seconds": 1708.94,
      "rssBytes": 1260699648
    },
    {
      "seconds": 1709.95,
      "rssBytes": 1261207552
    },
    {
      "seconds": 1710.95,
      "rssBytes": 1261207552
    },
    {
      "seconds": 1711.96,
      "rssBytes": 1261158400
    },
    {
      "seconds": 1712.97,
      "rssBytes": 1261158400
    },
    {
      "seconds": 1713.99,
      "rssBytes": 1263550464
    },
    {
      "seconds": 1715.0,
      "rssBytes": 1266761728
    },
    {
      "seconds": 1716.03,
      "rssBytes": 1266860032
    },
    {
      "seconds": 1717.04,
      "rssBytes": 1266860032
    },
    {
      "seconds": 1718.05,
      "rssBytes": 1266860032
    },
    {
      "seconds": 1719.08,
      "rssBytes": 1266860032
    },
    {
      "seconds": 1720.1,
      "rssBytes": 1266860032
    },
    {
      "seconds": 1721.12,
      "rssBytes": 1266712576
    },
    {
      "seconds": 1722.14,
      "rssBytes": 1266712576
    },
    {
      "seconds": 1723.15,
      "rssBytes": 1267220480
    },
    {
      "seconds": 1724.16,
      "rssBytes": 1267269632
    },
    {
      "seconds": 1725.17,
      "rssBytes": 1267269632
    },
    {
      "seconds": 1726.2,
      "rssBytes": 1267269632
    },
    {
      "seconds": 1727.22,
      "rssBytes": 1267499008
    },
    {
      "seconds": 1728.23,
      "rssBytes": 1267499008
    },
    {
      "seconds": 1729.24,
      "rssBytes": 1114882048
    },
    {
      "seconds": 1730.26,
      "rssBytes": 1106149376
    },
    {
      "seconds": 1731.27,
      "rssBytes": 1107050496
    },
    {
      "seconds": 1732.27,
      "rssBytes": 1109114880
    },
    {
      "seconds": 1733.29,
      "rssBytes": 1110884352
    },
    {
      "seconds": 1734.3,
      "rssBytes": 1112260608
    },
    {
      "seconds": 1735.31,
      "rssBytes": 1112260608
    },
    {
      "seconds": 1736.32,
      "rssBytes": 1112260608
    },
    {
      "seconds": 1737.34,
      "rssBytes": 1112260608
    },
    {
      "seconds": 1738.35,
      "rssBytes": 1112260608
    },
    {
      "seconds": 1739.36,
      "rssBytes": 1112260608
    },
    {
      "seconds": 1740.37,
      "rssBytes": 933085184
    },
    {
      "seconds": 1741.38,
      "rssBytes": 933085184
    },
    {
      "seconds": 1742.39,
      "rssBytes": 933085184
    },
    {
      "seconds": 1743.39,
      "rssBytes": 933085184
    },
    {
      "seconds": 1744.41,
      "rssBytes": 933085184
    },
    {
      "seconds": 1745.42,
      "rssBytes": 933085184
    },
    {
      "seconds": 1746.43,
      "rssBytes": 933249024
    },
    {
      "seconds": 1747.44,
      "rssBytes": 933281792
    },
    {
      "seconds": 1748.45,
      "rssBytes": 933281792
    },
    {
      "seconds": 1749.46,
      "rssBytes": 933281792
    },
    {
      "seconds": 1750.47,
      "rssBytes": 933281792
    },
    {
      "seconds": 1751.49,
      "rssBytes": 933085184
    },
    {
      "seconds": 1752.5,
      "rssBytes": 933085184
    },
    {
      "seconds": 1753.51,
      "rssBytes": 933380096
    },
    {
      "seconds": 1754.52,
      "rssBytes": 933380096
    },
    {
      "seconds": 1755.53,
      "rssBytes": 933412864
    },
    {
      "seconds": 1756.54,
      "rssBytes": 933527552
    },
    {
      "seconds": 1757.55,
      "rssBytes": 933314560
    },
    {
      "seconds": 1758.57,
      "rssBytes": 933789696
    },
    {
      "seconds": 1759.57,
      "rssBytes": 934182912
    },
    {
      "seconds": 1760.58,
      "rssBytes": 751927296
    },
    {
      "seconds": 1761.6,
      "rssBytes": 752746496
    },
    {
      "seconds": 1762.62,
      "rssBytes": 786464768
    },
    {
      "seconds": 1763.63,
      "rssBytes": 789200896
    },
    {
      "seconds": 1764.64,
      "rssBytes": 800129024
    },
    {
      "seconds": 1765.65,
      "rssBytes": 801243136
    },
    {
      "seconds": 1766.67,
      "rssBytes": 840597504
    },
    {
      "seconds": 1767.69,
      "rssBytes": 844087296
    },
    {
      "seconds": 1768.7,
      "rssBytes": 847642624
    },
    {
      "seconds": 1769.72,
      "rssBytes": 850165760
    },
    {
      "seconds": 1770.73,
      "rssBytes": 850968576
    },
    {
      "seconds": 1771.75,
      "rssBytes": 861831168
    },
    {
      "seconds": 1772.77,
      "rssBytes": 864419840
    },
    {
      "seconds": 1773.79,
      "rssBytes": 865746944
    },
    {
      "seconds": 1774.8,
      "rssBytes": 869842944
    },
    {
      "seconds": 1775.82,
      "rssBytes": 871841792
    },
    {
      "seconds": 1776.83,
      "rssBytes": 874315776
    },
    {
      "seconds": 1777.85,
      "rssBytes": 877527040
    },
    {
      "seconds": 1778.86,
      "rssBytes": 879280128
    },
    {
      "seconds": 1779.88,
      "rssBytes": 883720192
    },
    {
      "seconds": 1780.88,
      "rssBytes": 722092032
    },
    {
      "seconds": 1781.9,
      "rssBytes": 725041152
    },
    {
      "seconds": 1782.9,
      "rssBytes": 727023616
    },
    {
      "seconds": 1783.92,
      "rssBytes": 730824704
    },
    {
      "seconds": 1784.94,
      "rssBytes": 732856320
    },
    {
      "seconds": 1785.95,
      "rssBytes": 735936512
    },
    {
      "seconds": 1786.97,
      "rssBytes": 737705984
    },
    {
      "seconds": 1787.98,
      "rssBytes": 738656256
    },
    {
      "seconds": 1788.99,
      "rssBytes": 739442688
    },
    {
      "seconds": 1790.01,
      "rssBytes": 740458496
    },
    {
      "seconds": 1791.02,
      "rssBytes": 741457920
    },
    {
      "seconds": 1792.03,
      "rssBytes": 742129664
    },
    {
      "seconds": 1793.05,
      "rssBytes": 743047168
    },
    {
      "seconds": 1794.06,
      "rssBytes": 744194048
    },
    {
      "seconds": 1795.07,
      "rssBytes": 741654528
    },
    {
      "seconds": 1796.08,
      "rssBytes": 743735296
    },
    {
      "seconds": 1797.1,
      "rssBytes": 744882176
    },
    {
      "seconds": 1798.1,
      "rssBytes": 746078208
    },
    {
      "seconds": 1799.12,
      "rssBytes": 747241472
    },
    {
      "seconds": 1800.13,
      "rssBytes": 748634112
    },
    {
      "seconds": 1801.14,
      "rssBytes": 749912064
    },
    {
      "seconds": 1802.16,
      "rssBytes": 750747648
    },
    {
      "seconds": 1803.17,
      "rssBytes": 751616000
    },
    {
      "seconds": 1804.19,
      "rssBytes": 752091136
    },
    {
      "seconds": 1805.2,
      "rssBytes": 790724608
    },
    {
      "seconds": 1806.21,
      "rssBytes": 791429120
    },
    {
      "seconds": 1807.22,
      "rssBytes": 792035328
    },
    {
      "seconds": 1808.24,
      "rssBytes": 802209792
    },
    {
      "seconds": 1809.25,
      "rssBytes": 802930688
    },
    {
      "seconds": 1810.27,
      "rssBytes": 805404672
    },
    {
      "seconds": 1811.28,
      "rssBytes": 807419904
    },
    {
      "seconds": 1812.28,
      "rssBytes": 809074688
    },
    {
      "seconds": 1813.3,
      "rssBytes": 810844160
    },
    {
      "seconds": 1814.3,
      "rssBytes": 850083840
    },
    {
      "seconds": 1815.32,
      "rssBytes": 889913344
    },
    {
      "seconds": 1816.33,
      "rssBytes": 912146432
    },
    {
      "seconds": 1817.34,
      "rssBytes": 917848064
    },
    {
      "seconds": 1818.36,
      "rssBytes": 961232896
    },
    {
      "seconds": 1819.37,
      "rssBytes": 976928768
    },
    {
      "seconds": 1820.38,
      "rssBytes": 979664896
    },
    {
      "seconds": 1821.39,
      "rssBytes": 988348416
    },
    {
      "seconds": 1822.4,
      "rssBytes": 993591296
    },
    {
      "seconds": 1823.41,
      "rssBytes": 999342080
    },
    {
      "seconds": 1824.42,
      "rssBytes": 1005076480
    },
    {
      "seconds": 1825.42,
      "rssBytes": 1010548736
    },
    {
      "seconds": 1826.43,
      "rssBytes": 1014202368
    },
    {
      "seconds": 1827.44,
      "rssBytes": 1017380864
    },
    {
      "seconds": 1828.46,
      "rssBytes": 1024294912
    },
    {
      "seconds": 1829.46,
      "rssBytes": 1032142848
    },
    {
      "seconds": 1830.48,
      "rssBytes": 1036009472
    },
    {
      "seconds": 1831.48,
      "rssBytes": 1038467072
    },
    {
      "seconds": 1832.5,
      "rssBytes": 1042841600
    },
    {
      "seconds": 1833.51,
      "rssBytes": 1048231936
    },
    {
      "seconds": 1834.52,
      "rssBytes": 1049739264
    },
    {
      "seconds": 1835.53,
      "rssBytes": 1051508736
    },
    {
      "seconds": 1836.55,
      "rssBytes": 1057030144
    },
    {
      "seconds": 1837.55,
      "rssBytes": 1058635776
    },
    {
      "seconds": 1838.56,
      "rssBytes": 1068269568
    },
    {
      "seconds": 1839.58,
      "rssBytes": 1068269568
    },
    {
      "seconds": 1840.59,
      "rssBytes": 1068269568
    },
    {
      "seconds": 1841.6,
      "rssBytes": 1068122112
    },
    {
      "seconds": 1842.61,
      "rssBytes": 1068122112
    },
    {
      "seconds": 1843.63,
      "rssBytes": 1068220416
    },
    {
      "seconds": 1844.63,
      "rssBytes": 1068220416
    },
    {
      "seconds": 1845.64,
      "rssBytes": 1068220416
    },
    {
      "seconds": 1846.65,
      "rssBytes": 1068269568
    },
    {
      "seconds": 1847.67,
      "rssBytes": 1068269568
    },
    {
      "seconds": 1848.68,
      "rssBytes": 1068269568
    },
    {
      "seconds": 1849.7,
      "rssBytes": 1068695552
    },
    {
      "seconds": 1850.71,
      "rssBytes": 1068695552
    },
    {
      "seconds": 1851.72,
      "rssBytes": 1068597248
    },
    {
      "seconds": 1852.73,
      "rssBytes": 1068597248
    },
    {
      "seconds": 1853.74,
      "rssBytes": 1068597248
    },
    {
      "seconds": 1854.76,
      "rssBytes": 1068597248
    },
    {
      "seconds": 1855.77,
      "rssBytes": 1068597248
    },
    {
      "seconds": 1856.78,
      "rssBytes": 1068597248
    },
    {
      "seconds": 1857.79,
      "rssBytes": 1059749888
    },
    {
      "seconds": 1858.8,
      "rssBytes": 1060093952
    },
    {
      "seconds": 1859.8,
      "rssBytes": 1060093952
    },
    {
      "seconds": 1860.82,
      "rssBytes": 1060487168
    },
    {
      "seconds": 1861.83,
      "rssBytes": 1060536320
    },
    {
      "seconds": 1862.84,
      "rssBytes": 1062846464
    },
    {
      "seconds": 1863.86,
      "rssBytes": 1062846464
    },
    {
      "seconds": 1864.87,
      "rssBytes": 1063485440
    },
    {
      "seconds": 1865.88,
      "rssBytes": 1063501824
    },
    {
      "seconds": 1866.89,
      "rssBytes": 1064402944
    },
    {
      "seconds": 1867.91,
      "rssBytes": 1065451520
    },
    {
      "seconds": 1868.93,
      "rssBytes": 1066909696
    },
    {
      "seconds": 1869.94,
      "rssBytes": 1068204032
    },
    {
      "seconds": 1870.95,
      "rssBytes": 1068204032
    },
    {
      "seconds": 1871.96,
      "rssBytes": 1068204032
    },
    {
      "seconds": 1872.97,
      "rssBytes": 1068253184
    },
    {
      "seconds": 1873.99,
      "rssBytes": 1068040192
    },
    {
      "seconds": 1874.99,
      "rssBytes": 1068318720
    },
    {
      "seconds": 1876.0,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1877.01,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1878.02,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1879.03,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1880.05,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1881.06,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1882.07,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1883.09,
      "rssBytes": 1068761088
    },
    {
      "seconds": 1884.1,
      "rssBytes": 1068859392
    },
    {
      "seconds": 1885.11,
      "rssBytes": 1068859392
    },
    {
      "seconds": 1886.12,
      "rssBytes": 1068859392
    },
    {
      "seconds": 1887.13,
      "rssBytes": 1068859392
    },
    {
      "seconds": 1888.15,
      "rssBytes": 1070284800
    },
    {
      "seconds": 1889.16,
      "rssBytes": 1074118656
    },
    {
      "seconds": 1890.17,
      "rssBytes": 1076183040
    },
    {
      "seconds": 1891.18,
      "rssBytes": 1082621952
    },
    {
      "seconds": 1892.19,
      "rssBytes": 1088749568
    },
    {
      "seconds": 1893.19,
      "rssBytes": 1096318976
    },
    {
      "seconds": 1894.2,
      "rssBytes": 1100201984
    },
    {
      "seconds": 1895.22,
      "rssBytes": 1103069184
    },
    {
      "seconds": 1896.23,
      "rssBytes": 1104052224
    },
    {
      "seconds": 1897.24,
      "rssBytes": 1105969152
    },
    {
      "seconds": 1898.26,
      "rssBytes": 1107181568
    },
    {
      "seconds": 1899.27,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1900.28,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1901.29,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1902.3,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1903.32,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1904.33,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1905.33,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1906.35,
      "rssBytes": 1108180992
    },
    {
      "seconds": 1907.36,
      "rssBytes": 1108230144
    },
    {
      "seconds": 1908.37,
      "rssBytes": 1108131840
    },
    {
      "seconds": 1909.38,
      "rssBytes": 1108131840
    },
    {
      "seconds": 1910.39,
      "rssBytes": 1108131840
    },
    {
      "seconds": 1911.39,
      "rssBytes": 1108312064
    },
    {
      "seconds": 1912.41,
      "rssBytes": 1108312064
    },
    {
      "seconds": 1913.41,
      "rssBytes": 1108312064
    },
    {
      "seconds": 1914.42,
      "rssBytes": 1108312064
    },
    {
      "seconds": 1915.44,
      "rssBytes": 1108361216
    },
    {
      "seconds": 1916.44,
      "rssBytes": 1108361216
    },
    {
      "seconds": 1917.45,
      "rssBytes": 1108361216
    },
    {
      "seconds": 1918.46,
      "rssBytes": 1108361216
    },
    {
      "seconds": 1919.47,
      "rssBytes": 1108361216
    },
    {
      "seconds": 1920.48,
      "rssBytes": 1108361216
    },
    {
      "seconds": 1921.49,
      "rssBytes": 1102233600
    },
    {
      "seconds": 1922.5,
      "rssBytes": 1104379904
    },
    {
      "seconds": 1923.51,
      "rssBytes": 1106280448
    },
    {
      "seconds": 1924.52,
      "rssBytes": 1108049920
    },
    {
      "seconds": 1925.54,
      "rssBytes": 1108295680
    },
    {
      "seconds": 1926.55,
      "rssBytes": 1108295680
    },
    {
      "seconds": 1927.56,
      "rssBytes": 1108295680
    },
    {
      "seconds": 1928.58,
      "rssBytes": 1108393984
    },
    {
      "seconds": 1929.59,
      "rssBytes": 1108393984
    },
    {
      "seconds": 1930.6,
      "rssBytes": 1108459520
    },
    {
      "seconds": 1931.61,
      "rssBytes": 1108574208
    },
    {
      "seconds": 1932.62,
      "rssBytes": 1108721664
    },
    {
      "seconds": 1933.63,
      "rssBytes": 1108721664
    },
    {
      "seconds": 1934.63,
      "rssBytes": 1108721664
    },
    {
      "seconds": 1935.65,
      "rssBytes": 1108721664
    },
    {
      "seconds": 1936.66,
      "rssBytes": 1108721664
    },
    {
      "seconds": 1937.68,
      "rssBytes": 1108623360
    },
    {
      "seconds": 1938.7,
      "rssBytes": 930545664
    },
    {
      "seconds": 1939.71,
      "rssBytes": 930545664
    },
    {
      "seconds": 1940.72,
      "rssBytes": 930545664
    },
    {
      "seconds": 1941.73,
      "rssBytes": 930545664
    },
    {
      "seconds": 1942.74,
      "rssBytes": 930545664
    },
    {
      "seconds": 1943.74,
      "rssBytes": 930496512
    },
    {
      "seconds": 1944.76,
      "rssBytes": 930906112
    },
    {
      "seconds": 1945.77,
      "rssBytes": 931971072
    },
    {
      "seconds": 1946.77,
      "rssBytes": 933068800
    },
    {
      "seconds": 1947.79,
      "rssBytes": 934117376
    },
    {
      "seconds": 1948.8,
      "rssBytes": 935280640
    },
    {
      "seconds": 1949.81,
      "rssBytes": 936591360
    },
    {
      "seconds": 1950.82,
      "rssBytes": 937459712
    },
    {
      "seconds": 1951.83,
      "rssBytes": 939048960
    },
    {
      "seconds": 1952.84,
      "rssBytes": 941031424
    },
    {
      "seconds": 1953.85,
      "rssBytes": 938901504
    },
    {
      "seconds": 1954.86,
      "rssBytes": 940834816
    },
    {
      "seconds": 1955.88,
      "rssBytes": 943538176
    },
    {
      "seconds": 1956.89,
      "rssBytes": 947748864
    },
    {
      "seconds": 1957.9,
      "rssBytes": 949698560
    },
    {
      "seconds": 1958.91,
      "rssBytes": 951107584
    },
    {
      "seconds": 1959.92,
      "rssBytes": 953466880
    },
    {
      "seconds": 1960.92,
      "rssBytes": 955006976
    },
    {
      "seconds": 1961.94,
      "rssBytes": 956841984
    },
    {
      "seconds": 1962.95,
      "rssBytes": 958431232
    },
    {
      "seconds": 1963.96,
      "rssBytes": 960757760
    },
    {
      "seconds": 1964.97,
      "rssBytes": 961986560
    },
    {
      "seconds": 1965.99,
      "rssBytes": 962904064
    },
    {
      "seconds": 1966.99,
      "rssBytes": 962904064
    },
    {
      "seconds": 1968.01,
      "rssBytes": 962904064
    },
    {
      "seconds": 1969.03,
      "rssBytes": 783106048
    },
    {
      "seconds": 1970.04,
      "rssBytes": 783138816
    },
    {
      "seconds": 1971.05,
      "rssBytes": 783138816
    },
    {
      "seconds": 1972.07,
      "rssBytes": 783138816
    },
    {
      "seconds": 1973.08,
      "rssBytes": 783204352
    },
    {
      "seconds": 1974.1,
      "rssBytes": 783106048
    },
    {
      "seconds": 1975.11,
      "rssBytes": 783007744
    },
    {
      "seconds": 1976.12,
      "rssBytes": 820920320
    },
    {
      "seconds": 1977.13,
      "rssBytes": 832012288
    },
    {
      "seconds": 1978.14,
      "rssBytes": 833355776
    },
    {
      "seconds": 1979.15,
      "rssBytes": 834715648
    },
    {
      "seconds": 1980.16,
      "rssBytes": 836190208
    },
    {
      "seconds": 1981.18,
      "rssBytes": 836222976
    },
    {
      "seconds": 1982.19,
      "rssBytes": 837828608
    },
    {
      "seconds": 1983.2,
      "rssBytes": 838713344
    },
    {
      "seconds": 1984.22,
      "rssBytes": 840122368
    },
    {
      "seconds": 1985.23,
      "rssBytes": 841629696
    },
    {
      "seconds": 1986.25,
      "rssBytes": 839794688
    },
    {
      "seconds": 1987.26,
      "rssBytes": 840957952
    },
    {
      "seconds": 1988.27,
      "rssBytes": 842743808
    },
    {
      "seconds": 1989.28,
      "rssBytes": 749355008
    },
    {
      "seconds": 1990.29,
      "rssBytes": 752173056
    },
    {
      "seconds": 1991.3,
      "rssBytes": 754319360
    },
    {
      "seconds": 1992.32,
      "rssBytes": 755580928
    },
    {
      "seconds": 1993.33,
      "rssBytes": 766656512
    },
    {
      "seconds": 1994.35,
      "rssBytes": 767901696
    },
    {
      "seconds": 1995.36,
      "rssBytes": 768802816
    },
    {
      "seconds": 1996.38,
      "rssBytes": 770211840
    },
    {
      "seconds": 1997.39,
      "rssBytes": 771506176
    },
    {
      "seconds": 1998.41,
      "rssBytes": 772472832
    },
    {
      "seconds": 1999.42,
      "rssBytes": 773783552
    },
    {
      "seconds": 2000.44,
      "rssBytes": 775045120
    },
    {
      "seconds": 2001.44,
      "rssBytes": 776175616
    },
    {
      "seconds": 2002.46,
      "rssBytes": 777306112
    },
    {
      "seconds": 2003.48,
      "rssBytes": 778223616
    },
    {
      "seconds": 2004.49,
      "rssBytes": 779419648
    },
    {
      "seconds": 2005.51,
      "rssBytes": 780451840
    },
    {
      "seconds": 2006.52,
      "rssBytes": 781434880
    },
    {
      "seconds": 2007.52,
      "rssBytes": 782614528
    },
    {
      "seconds": 2008.53,
      "rssBytes": 830816256
    },
    {
      "seconds": 2009.54,
      "rssBytes": 831340544
    },
    {
      "seconds": 2010.55,
      "rssBytes": 831897600
    },
    {
      "seconds": 2011.56,
      "rssBytes": 832339968
    },
    {
      "seconds": 2012.58,
      "rssBytes": 832864256
    },
    {
      "seconds": 2013.6,
      "rssBytes": 833044480
    },
    {
      "seconds": 2014.61,
      "rssBytes": 834142208
    },
    {
      "seconds": 2015.62,
      "rssBytes": 838467584
    },
    {
      "seconds": 2016.63,
      "rssBytes": 841170944
    },
    {
      "seconds": 2017.64,
      "rssBytes": 842022912
    },
    {
      "seconds": 2018.65,
      "rssBytes": 847249408
    },
    {
      "seconds": 2019.66,
      "rssBytes": 852213760
    },
    {
      "seconds": 2020.68,
      "rssBytes": 854851584
    },
    {
      "seconds": 2021.7,
      "rssBytes": 856784896
    },
    {
      "seconds": 2022.71,
      "rssBytes": 856637440
    },
    {
      "seconds": 2023.72,
      "rssBytes": 856637440
    },
    {
      "seconds": 2024.74,
      "rssBytes": 856637440
    },
    {
      "seconds": 2025.75,
      "rssBytes": 856637440
    },
    {
      "seconds": 2026.77,
      "rssBytes": 856637440
    },
    {
      "seconds": 2027.78,
      "rssBytes": 856637440
    },
    {
      "seconds": 2028.8,
      "rssBytes": 857620480
    },
    {
      "seconds": 2029.81,
      "rssBytes": 858226688
    },
    {
      "seconds": 2030.82,
      "rssBytes": 858275840
    },
    {
      "seconds": 2031.83,
      "rssBytes": 858275840
    },
    {
      "seconds": 2032.84,
      "rssBytes": 858275840
    },
    {
      "seconds": 2033.85,
      "rssBytes": 858275840
    },
    {
      "seconds": 2034.87,
      "rssBytes": 858701824
    },
    {
      "seconds": 2035.88,
      "rssBytes": 858701824
    },
    {
      "seconds": 2036.88,
      "rssBytes": 858701824
    },
    {
      "seconds": 2037.9,
      "rssBytes": 858701824
    },
    {
      "seconds": 2038.91,
      "rssBytes": 858783744
    },
    {
      "seconds": 2039.92,
      "rssBytes": 858783744
    },
    {
      "seconds": 2040.92,
      "rssBytes": 858898432
    },
    {
      "seconds": 2041.93,
      "rssBytes": 858898432
    },
    {
      "seconds": 2042.94,
      "rssBytes": 858898432
    },
    {
      "seconds": 2043.95,
      "rssBytes": 858898432
    },
    {
      "seconds": 2044.97,
      "rssBytes": 858898432
    },
    {
      "seconds": 2045.98,
      "rssBytes": 858849280
    },
    {
      "seconds": 2046.99,
      "rssBytes": 858849280
    },
    {
      "seconds": 2048.0,
      "rssBytes": 858849280
    },
    {
      "seconds": 2049.01,
      "rssBytes": 858849280
    },
    {
      "seconds": 2050.02,
      "rssBytes": 855080960
    },
    {
      "seconds": 2051.03,
      "rssBytes": 855212032
    },
    {
      "seconds": 2052.05,
      "rssBytes": 855212032
    },
    {
      "seconds": 2053.06,
      "rssBytes": 855212032
    },
    {
      "seconds": 2054.07,
      "rssBytes": 855375872
    },
    {
      "seconds": 2055.08,
      "rssBytes": 855801856
    },
    {
      "seconds": 2056.09,
      "rssBytes": 860405760
    },
    {
      "seconds": 2057.11,
      "rssBytes": 860422144
    },
    {
      "seconds": 2058.12,
      "rssBytes": 860962816
    },
    {
      "seconds": 2059.13,
      "rssBytes": 861356032
    },
    {
      "seconds": 2060.15,
      "rssBytes": 862863360
    },
    {
      "seconds": 2061.16,
      "rssBytes": 864731136
    },
    {
      "seconds": 2062.17,
      "rssBytes": 867418112
    },
    {
      "seconds": 2063.18,
      "rssBytes": 908165120
    },
    {
      "seconds": 2064.18,
      "rssBytes": 912277504
    },
    {
      "seconds": 2065.2,
      "rssBytes": 916193280
    },
    {
      "seconds": 2066.21,
      "rssBytes": 958136320
    },
    {
      "seconds": 2067.22,
      "rssBytes": 962002944
    },
    {
      "seconds": 2068.23,
      "rssBytes": 965017600
    },
    {
      "seconds": 2069.25,
      "rssBytes": 978731008
    },
    {
      "seconds": 2070.26,
      "rssBytes": 982941696
    },
    {
      "seconds": 2071.28,
      "rssBytes": 987447296
    },
    {
      "seconds": 2072.29,
      "rssBytes": 992591872
    },
    {
      "seconds": 2073.3,
      "rssBytes": 999243776
    },
    {
      "seconds": 2074.31,
      "rssBytes": 1005748224
    },
    {
      "seconds": 2075.32,
      "rssBytes": 1011204096
    },
    {
      "seconds": 2076.33,
      "rssBytes": 1018920960
    },
    {
      "seconds": 2077.34,
      "rssBytes": 1025343488
    },
    {
      "seconds": 2078.36,
      "rssBytes": 1033142272
    },
    {
      "seconds": 2079.38,
      "rssBytes": 1040203776
    },
    {
      "seconds": 2080.39,
      "rssBytes": 1047101440
    },
    {
      "seconds": 2081.4,
      "rssBytes": 1053261824
    },
    {
      "seconds": 2082.42,
      "rssBytes": 1057062912
    },
    {
      "seconds": 2083.43,
      "rssBytes": 1064288256
    },
    {
      "seconds": 2084.44,
      "rssBytes": 1068679168
    },
    {
      "seconds": 2085.45,
      "rssBytes": 1071628288
    },
    {
      "seconds": 2086.46,
      "rssBytes": 1074790400
    },
    {
      "seconds": 2087.48,
      "rssBytes": 1075576832
    },
    {
      "seconds": 2088.49,
      "rssBytes": 1075609600
    },
    {
      "seconds": 2089.51,
      "rssBytes": 1076264960
    },
    {
      "seconds": 2090.53,
      "rssBytes": 1076396032
    },
    {
      "seconds": 2091.53,
      "rssBytes": 1076330496
    },
    {
      "seconds": 2092.54,
      "rssBytes": 1076232192
    },
    {
      "seconds": 2093.55,
      "rssBytes": 1076445184
    },
    {
      "seconds": 2094.56,
      "rssBytes": 1076477952
    },
    {
      "seconds": 2095.57,
      "rssBytes": 1076543488
    },
    {
      "seconds": 2096.58,
      "rssBytes": 1077641216
    },
    {
      "seconds": 2097.59,
      "rssBytes": 1077395456
    },
    {
      "seconds": 2098.61,
      "rssBytes": 1086849024
    },
    {
      "seconds": 2099.62,
      "rssBytes": 1086849024
    },
    {
      "seconds": 2100.63,
      "rssBytes": 1086849024
    },
    {
      "seconds": 2101.64,
      "rssBytes": 1086849024
    },
    {
      "seconds": 2102.66,
      "rssBytes": 1086849024
    },
    {
      "seconds": 2103.67,
      "rssBytes": 1086799872
    },
    {
      "seconds": 2104.68,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2105.7,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2106.71,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2107.72,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2108.73,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2109.74,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2110.75,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2111.76,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2112.77,
      "rssBytes": 1086750720
    },
    {
      "seconds": 2113.78,
      "rssBytes": 1078411264
    },
    {
      "seconds": 2114.79,
      "rssBytes": 1082294272
    },
    {
      "seconds": 2115.8,
      "rssBytes": 1083080704
    },
    {
      "seconds": 2116.82,
      "rssBytes": 1083686912
    },
    {
      "seconds": 2117.83,
      "rssBytes": 1085833216
    },
    {
      "seconds": 2118.85,
      "rssBytes": 1088847872
    },
    {
      "seconds": 2119.86,
      "rssBytes": 1091649536
    },
    {
      "seconds": 2120.87,
      "rssBytes": 1096171520
    },
    {
      "seconds": 2121.88,
      "rssBytes": 1099038720
    },
    {
      "seconds": 2122.89,
      "rssBytes": 1100972032
    },
    {
      "seconds": 2123.91,
      "rssBytes": 1101234176
    },
    {
      "seconds": 2124.93,
      "rssBytes": 1101234176
    },
    {
      "seconds": 2125.94,
      "rssBytes": 1101234176
    },
    {
      "seconds": 2126.96,
      "rssBytes": 1101135872
    },
    {
      "seconds": 2127.97,
      "rssBytes": 1100922880
    },
    {
      "seconds": 2128.99,
      "rssBytes": 1100922880
    },
    {
      "seconds": 2130.0,
      "rssBytes": 1100922880
    },
    {
      "seconds": 2131.02,
      "rssBytes": 1101496320
    },
    {
      "seconds": 2132.03,
      "rssBytes": 924008448
    },
    {
      "seconds": 2133.04,
      "rssBytes": 924008448
    },
    {
      "seconds": 2134.05,
      "rssBytes": 924008448
    },
    {
      "seconds": 2135.06,
      "rssBytes": 924008448
    },
    {
      "seconds": 2136.07,
      "rssBytes": 924008448
    },
    {
      "seconds": 2137.08,
      "rssBytes": 924008448
    },
    {
      "seconds": 2138.09,
      "rssBytes": 924008448
    },
    {
      "seconds": 2139.1,
      "rssBytes": 924008448
    },
    {
      "seconds": 2140.11,
      "rssBytes": 924008448
    },
    {
      "seconds": 2141.12,
      "rssBytes": 924008448
    },
    {
      "seconds": 2142.13,
      "rssBytes": 924008448
    },
    {
      "seconds": 2143.14,
      "rssBytes": 747929600
    },
    {
      "seconds": 2144.16,
      "rssBytes": 748044288
    },
    {
      "seconds": 2145.18,
      "rssBytes": 748044288
    },
    {
      "seconds": 2146.18,
      "rssBytes": 745652224
    },
    {
      "seconds": 2147.19,
      "rssBytes": 748388352
    },
    {
      "seconds": 2148.21,
      "rssBytes": 749109248
    },
    {
      "seconds": 2149.22,
      "rssBytes": 752631808
    },
    {
      "seconds": 2150.23,
      "rssBytes": 757743616
    },
    {
      "seconds": 2151.25,
      "rssBytes": 762953728
    },
    {
      "seconds": 2152.25,
      "rssBytes": 775159808
    },
    {
      "seconds": 2153.26,
      "rssBytes": 779354112
    },
    {
      "seconds": 2154.27,
      "rssBytes": 842792960
    },
    {
      "seconds": 2155.29,
      "rssBytes": 852230144
    },
    {
      "seconds": 2156.31,
      "rssBytes": 852230144
    },
    {
      "seconds": 2157.32,
      "rssBytes": 852901888
    },
    {
      "seconds": 2158.33,
      "rssBytes": 852934656
    },
    {
      "seconds": 2159.34,
      "rssBytes": 852934656
    },
    {
      "seconds": 2160.35,
      "rssBytes": 852967424
    },
    {
      "seconds": 2161.36,
      "rssBytes": 852967424
    },
    {
      "seconds": 2162.38,
      "rssBytes": 852869120
    },
    {
      "seconds": 2163.39,
      "rssBytes": 852869120
    },
    {
      "seconds": 2164.4,
      "rssBytes": 852869120
    },
    {
      "seconds": 2165.41,
      "rssBytes": 852869120
    },
    {
      "seconds": 2166.43,
      "rssBytes": 852869120
    },
    {
      "seconds": 2167.44,
      "rssBytes": 853131264
    },
    {
      "seconds": 2168.46,
      "rssBytes": 855064576
    },
    {
      "seconds": 2169.47,
      "rssBytes": 875085824
    },
    {
      "seconds": 2170.49,
      "rssBytes": 875085824
    },
    {
      "seconds": 2171.5,
      "rssBytes": 875216896
    },
    {
      "seconds": 2172.51,
      "rssBytes": 875216896
    },
    {
      "seconds": 2173.52,
      "rssBytes": 876707840
    },
    {
      "seconds": 2174.53,
      "rssBytes": 925777920
    },
    {
      "seconds": 2175.55,
      "rssBytes": 927105024
    },
    {
      "seconds": 2176.56,
      "rssBytes": 929267712
    },
    {
      "seconds": 2177.57,
      "rssBytes": 930676736
    },
    {
      "seconds": 2178.57,
      "rssBytes": 930234368
    },
    {
      "seconds": 2179.59,
      "rssBytes": 933986304
    },
    {
      "seconds": 2180.6,
      "rssBytes": 934641664
    },
    {
      "seconds": 2181.61,
      "rssBytes": 936460288
    },
    {
      "seconds": 2182.63,
      "rssBytes": 937508864
    },
    {
      "seconds": 2183.65,
      "rssBytes": 938328064
    },
    {
      "seconds": 2184.66,
      "rssBytes": 944816128
    },
    {
      "seconds": 2185.67,
      "rssBytes": 946110464
    },
    {
      "seconds": 2186.7,
      "rssBytes": 947503104
    },
    {
      "seconds": 2187.72,
      "rssBytes": 948748288
    },
    {
      "seconds": 2188.73,
      "rssBytes": 950042624
    },
    {
      "seconds": 2189.74,
      "rssBytes": 951222272
    },
    {
      "seconds": 2190.76,
      "rssBytes": 952500224
    },
    {
      "seconds": 2191.77,
      "rssBytes": 953384960
    },
    {
      "seconds": 2192.79,
      "rssBytes": 954630144
    },
    {
      "seconds": 2193.8,
      "rssBytes": 831389696
    },
    {
      "seconds": 2194.82,
      "rssBytes": 832634880
    },
    {
      "seconds": 2195.83,
      "rssBytes": 833863680
    },
    {
      "seconds": 2196.84,
      "rssBytes": 834486272
    },
    {
      "seconds": 2197.85,
      "rssBytes": 834486272
    },
    {
      "seconds": 2198.87,
      "rssBytes": 834486272
    },
    {
      "seconds": 2199.88,
      "rssBytes": 834486272
    },
    {
      "seconds": 2200.9,
      "rssBytes": 834486272
    },
    {
      "seconds": 2201.91,
      "rssBytes": 834486272
    },
    {
      "seconds": 2202.92,
      "rssBytes": 834486272
    },
    {
      "seconds": 2203.94,
      "rssBytes": 838926336
    },
    {
      "seconds": 2204.95,
      "rssBytes": 839745536
    },
    {
      "seconds": 2205.97,
      "rssBytes": 845217792
    },
    {
      "seconds": 2206.99,
      "rssBytes": 847527936
    },
    {
      "seconds": 2208.01,
      "rssBytes": 849969152
    },
    {
      "seconds": 2209.01,
      "rssBytes": 852918272
    },
    {
      "seconds": 2210.02,
      "rssBytes": 848707584
    },
    {
      "seconds": 2211.04,
      "rssBytes": 850378752
    },
    {
      "seconds": 2212.05,
      "rssBytes": 850837504
    },
    {
      "seconds": 2213.05,
      "rssBytes": 851230720
    },
    {
      "seconds": 2214.07,
      "rssBytes": 675921920
    }
  ],
  "fresh": false,
  "cli": true,
  "defaultSource": true,
  "clientSummary": [
    "download connection trial: 16 active",
    "download connection trial: 32 active",
    "download connection trial: 16 active",
    "CDN responses: HIT=8, MISS=2270",
    "16 TCP connections observed across the active workers",
    "download verified: 46.07 GB received, 0 raw fallback chunks, 2197.0 s"
  ],
  "kind": "public-cdn",
  "base": "https://weights.sevra.page/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "binarySHA256": "b0137932976aedb191c6d2d3f3631c7ce267b1201055fc5a3cb6ca21d7f27519",
  "sourceSHA256": {
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/Model.swift": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e",
    "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/Slotstream/Layers.swift": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe",
    "Sources/Slotstream/Engine.swift": "ebfad431313597ef2586d9ba57e015fc640d252fb38e6b5888dcadbc96772f6e",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/Version.swift": "b4da48a512dd1e77d401738384bfe40fb0e0f294ca750f353c65341fb08f2508",
    "Sources/Slotstream/MTP.swift": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/DownloadHTTP.swift": "b13c0aa411658cac2327dce94ece7909cd80a0d847b2e862d3b34bd1f68c1844",
    "Sources/Slotstream/Server.swift": "676457a0ecdd1243bea26562723e20c9eb78b2060427916919ceabea6f560fa2",
    "Sources/Slotstream/Context.swift": "208f5b98f054241870b534c56558fb48663c9fce4ad14bbf3c84cda500ad3834",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/Slotstream/Governor.swift": "18c8610e07830737e911027ceb3c95877cfca95ae984065bd30add867557a2fc",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/WeightStore.swift": "39e24b2f71291746a860675d1be21670723369a1bd54aeb13dadb3ad9980e98a",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/ProcessMemory.swift": "5e3151b8bfeee220aad3bab1deb5ae68aec05d68c33bc28e2ac2f098ce69af1c",
    "Sources/Slotstream/Generate.swift": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf",
    "Sources/Slotstream/Plan.swift": "8e690bdba9090204b0b47e0af521ec4ba9113a1039e21ec0ef4d9b912d2905f2",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/ContextCommands.swift": "92b4e55c373f60ccf58540fcfcc32d7751a93fa59a5916f52674b138144849bb",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "021b244d5722e04c9676285cebc56e1e6f6712bbd6a83eda04cb97c955ecfdd3",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1"
  },
  "originalBytes": 105264463248,
  "downloadObjectBytes": 88294086225,
  "server": {
    "requests": 0,
    "bytes": 0
  },
  "files": [
    {
      "path": "LICENSE",
      "size": 3235,
      "sha256": "a0dc422560841fd68e06d974907f8b4c709bca44a67daad2b528437bdf676c08"
    },
    {
      "path": "README.md",
      "size": 6139,
      "sha256": "db1e0d8575543e7a8d324fd22afd2d596a002e9163ed1f971b6b8df0abbe65fd"
    },
    {
      "path": "chat_template.jinja",
      "size": 8952,
      "sha256": "c3cf9e34abf4f9e36c2d72165aa9c132d3e2a725b6c2586aaa3a8af9d7a81041"
    },
    {
      "path": "config.json",
      "size": 33408,
      "sha256": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5"
    },
    {
      "path": "generation_config.json",
      "size": 202,
      "sha256": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e"
    },
    {
      "path": "merges.txt",
      "size": 3353259,
      "sha256": "a9d356d7bdf1ef4949e3e748e95b8e10ad9d4e2e838eddc38a0a7b6b94d1db8d"
    },
    {
      "path": "model-00001.safetensors",
      "size": 10039592993,
      "sha256": "206c2e6ee138c902115f0686a43e0d56097518945bbcd6d3ab10bf916278f86c"
    },
    {
      "path": "model-00002.safetensors",
      "size": 10000066971,
      "sha256": "48f925c8652fd3210bd8593b41b9fbd66f02567e0e1e7abc28b75e2601f8af26"
    },
    {
      "path": "model-00003.safetensors",
      "size": 10000066984,
      "sha256": "cb0a951b9aed16ddad882a75c4c07b2615fa364db7c83cfcf7166dc481def85a"
    },
    {
      "path": "model-00004.safetensors",
      "size": 10170248438,
      "sha256": "f57df447a6acc2d16e69a66c708291d692f0f7476f74ab20aee3d2554c2896c8"
    },
    {
      "path": "model-00005.safetensors",
      "size": 10194989755,
      "sha256": "bc133543936364e026b413f1ab4b30f2847846d5a8cc1d201cadfd9396327320"
    },
    {
      "path": "model-00006.safetensors",
      "size": 10262727991,
      "sha256": "9231085f2723a8a3e26fc00836a789400527320ef8a6e219df6974ea4f8eee95"
    },
    {
      "path": "model-00007.safetensors",
      "size": 10190937668,
      "sha256": "03dffb750368b02fe517f2f1bfd7d5db69c419630801c3ffce88d8a6971046d5"
    },
    {
      "path": "model-00008.safetensors",
      "size": 10231122683,
      "sha256": "910401c0e420a50b901b170895e7a180c5908a45634be9c92903977ecaa14986"
    },
    {
      "path": "model-00009.safetensors",
      "size": 10250305804,
      "sha256": "0c77b22503b8e783cc345cd8afe63e007f9d0d0581cbda3f366250e38e096634"
    },
    {
      "path": "model-00010.safetensors",
      "size": 10237786674,
      "sha256": "115466ffb3e92a8e2a338d72395f7c32a176dadc791d2049ff9a8daadb347ed7"
    },
    {
      "path": "model-00011.safetensors",
      "size": 2192353120,
      "sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0"
    },
    {
      "path": "model.safetensors.index.json",
      "size": 317973,
      "sha256": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d"
    },
    {
      "path": "preprocessor_config.json",
      "size": 390,
      "sha256": "27225450ac9c6529872ee1924fcb0962ff5634834f817040f444118116f4e516"
    },
    {
      "path": "qwen4_exp.py",
      "size": 35046,
      "sha256": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e"
    },
    {
      "path": "tokenizer.json",
      "size": 12809320,
      "sha256": "0997f410c57a1f4e53b09e4be8f4a172d90edd9564368fb0847030937229b9f3"
    },
    {
      "path": "tokenizer_config.json",
      "size": 17928,
      "sha256": "b11349aafa7cdc6a320767cf7ceb29ed82f7eda5d65e8e0819e76f0ce947bf27"
    },
    {
      "path": "video_preprocessor_config.json",
      "size": 385,
      "sha256": "7768af27c1fafa9cc9011c1dc20067e03f8915e03b63504550e11d5066986d13"
    },
    {
      "path": "vocab.json",
      "size": 6722759,
      "sha256": "ce99b4cb2983d118806ce0a8b777a35b093e2000a503ebde25853284c9dfa003"
    },
    {
      "path": "mtp.safetensors",
      "size": 1470955171,
      "sha256": "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744"
    }
  ],
  "secondsDiagnostic": 2214.782802749891
}
```

## Final source and executable identity

```json
{
  "version": "0.2.9",
  "binarySHA256": "d544d53b765d483de3c6ef0e36ca06b74174a1894c8b2b4e1462825f8a2a4c7a",
  "sourceSHA256": {
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/Model.swift": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e",
    "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/Slotstream/Layers.swift": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe",
    "Sources/Slotstream/Engine.swift": "ebfad431313597ef2586d9ba57e015fc640d252fb38e6b5888dcadbc96772f6e",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/Version.swift": "b4da48a512dd1e77d401738384bfe40fb0e0f294ca750f353c65341fb08f2508",
    "Sources/Slotstream/MTP.swift": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
    "Sources/Slotstream/Server.swift": "676457a0ecdd1243bea26562723e20c9eb78b2060427916919ceabea6f560fa2",
    "Sources/Slotstream/Context.swift": "208f5b98f054241870b534c56558fb48663c9fce4ad14bbf3c84cda500ad3834",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/Slotstream/Governor.swift": "18c8610e07830737e911027ceb3c95877cfca95ae984065bd30add867557a2fc",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/ProcessMemory.swift": "5e3151b8bfeee220aad3bab1deb5ae68aec05d68c33bc28e2ac2f098ce69af1c",
    "Sources/Slotstream/Generate.swift": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf",
    "Sources/Slotstream/Plan.swift": "8e690bdba9090204b0b47e0af521ec4ba9113a1039e21ec0ef4d9b912d2905f2",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/ContextCommands.swift": "92b4e55c373f60ccf58540fcfcc32d7751a93fa59a5916f52674b138144849bb",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "0ac521529f2177d301367a9af149ba644c1d378196ddeef27c68fd8c26a5eb96",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1"
  },
  "changesSinceFullPublicRun": [
    "Sources/Slotstream/DownloadHTTP.swift",
    "Sources/Slotstream/WeightStore.swift",
    "Sources/slotstream-cli/main.swift"
  ]
}
```

## Linux final public-API reuse

```json
{
  "pass_": true,
  "binarySHA256": "a138ae34eec2a13df82dc9578d96cf0799aefd85eb0db2717c18e2f245f25fbb",
  "sourceSHA256": {
    "Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
    "Sources/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Sources/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
    "Sources/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
    "CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b"
  },
  "clientOutput": "compressed pull: 0.00 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nverifying 25 files at /model against pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b\n  ok    generation_config.json\n  ok    README.md\n  ok    chat_template.jinja\n  ok    LICENSE\n  ok    preprocessor_config.json\n  ok    video_preprocessor_config.json\n  ok    qwen4_exp.py\n  ok    config.json\n  ok    tokenizer_config.json\n  ok    model.safetensors.index.json\n  ok    merges.txt\n  ok    vocab.json\n  ok    tokenizer.json\n  ok    mtp.safetensors\n  ok    model-00011.safetensors\n  ok    model-00009.safetensors\n  ok    model-00010.safetensors\n  ok    model-00008.safetensors\n  ok    model-00007.safetensors\n  ok    model-00006.safetensors\n  ok    model-00003.safetensors\n  ok    model-00002.safetensors\n  ok    model-00001.safetensors\n  ok    model-00004.safetensors\n  ok    model-00005.safetensors\nVERIFY PASS: all 25 files match the pinned revision by sha256 (105.3 GB)\n",
  "buildOutput": "[0/1] Planning build\n[1/1] Compiling plugin GenerateManual\n[2/2] Compiling plugin GenerateDoccReference\nBuilding for production...\n[2/5] Write sources\n[3/5] Write swift-version-24593BA9C3E375BF.txt\n[5/6] Compiling pullbench DownloadConcurrency.swift\n/src/Sources/WeightDownload.swift:190:17: warning: stored property 'wireBytes' of 'Sendable'-conforming class 'PullJob' is mutable; this is an error in the Swift 6 language mode\n188 |     let log: WeightStore.Log\n189 |     let cancellation: PullCancellation\n190 |     private var wireBytes: Int64 = 0\n    |                 `- warning: stored property 'wireBytes' of 'Sendable'-conforming class 'PullJob' is mutable; this is an error in the Swift 6 language mode\n191 |     private let flushLock = NSLock()\n192 | \n[5/7] Write Objects.LinkFileList\n[6/7] Linking pullbench\nBuild complete! (8.13s)\n"
}
```

## Final CLI source and signal checks

```json
{
  "pass_": true,
  "checks": [
    {
      "name": "default",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.226,
      "requests": 8,
      "output": "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "raw-sources-override",
      "pass_": true,
      "transport": "raw",
      "exitCode": 130,
      "cancelSeconds": 0.086,
      "requests": 8,
      "output": "reference estimate: ~18 min at 100 MB/s; actual progress is measured\npulling pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b: 105.3 GB to go over 8 connections (resumable \u2014 rerun to continue)\nsource: <loopback-fixture>/raw\n  8 connections in use\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "explicit-compressed",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.234,
      "requests": 8,
      "output": "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "explicit-raw",
      "pass_": true,
      "transport": "raw",
      "exitCode": 130,
      "cancelSeconds": 0.088,
      "requests": 8,
      "output": "reference estimate: ~18 min at 100 MB/s; actual progress is measured\npulling pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b: 105.3 GB to go over 8 connections (resumable \u2014 rerun to continue)\nsource: <loopback-fixture>/raw\n  8 connections in use\ndownload interrupted; rerun to resume verified chunks\n"
    }
  ]
}
```

## mac-api-reuse.log

```text
compressed pull: 0.00 GB remaining, 8 connections; verified chunks resume automatically
connection tuning starts at 8, capped at 32; extra connections must improve throughput
download verified: 0.00 GB received, 0 raw fallback chunks, 0.1 s

ready. next:  slotstream serve     (or: slotstream run --prompt "...")
```

## public-log-compatibility-before.log

```text
../public-log-compatibility.swift:4:29: error: passing non-escaping parameter 'log' to function expecting an '@escaping' closure
1 | import Foundation
2 | import Slotstream
3 | func forwardInstance(_ store: WeightStore, log: WeightStore.Log) throws {
  |                                            `- note: parameter 'log' is implicitly non-escaping
4 |     try store.download(log: log)
  |                             `- error: passing non-escaping parameter 'log' to function expecting an '@escaping' closure
5 | }
6 | func forwardStatic(_ directory: URL, log: WeightStore.Log) throws {

../public-log-compatibility.swift:7:50: error: passing non-escaping parameter 'log' to function expecting an '@escaping' closure
4 |     try store.download(log: log)
5 | }
6 | func forwardStatic(_ directory: URL, log: WeightStore.Log) throws {
  |                                      `- note: parameter 'log' is implicitly non-escaping
7 |     try WeightStore.download(to: directory, log: log)
  |                                                  `- error: passing non-escaping parameter 'log' to function expecting an '@escaping' closure
8 | }
9 | 
```

## public-log-compatibility-after.log

```text
Compiler exit 0 with no diagnostics.
```

## consumer-smoke-final.log

```text
consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 9 assertions
```

## model-smoke-final.log

```text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (33.3 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
Error: another Slotstream model process is already running for this user — stop it before starting run, serve, parity, or a heavyweight check
```

## model-smoke-final-v2.log

```text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (33.3 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 17 (~0 s to the first token at this plan)
READY
-- prefill 17 tok in 1.31s (13.0 tok/s)
-- prefill split: io 0.76s + scatter 0.00s + compute 0.54s | 3160 records (8.7 GB, 11.4 GB/s)
-- decode 1 tok in 0.28s (3.56 tok/s)
-- decode split: io 0.11s + scatter 0.00s + compute 0.17s | 414 records
-- expert cache ~20/512 experts per layer, hit rate 0.138 | ngram rows 0h/16m | peak 6.4 GB | total 1.6s

```

## catalogue-t0-final.log

```text
PASS  prefill-schedule (9 assertions)
PASS  context-policy (8 assertions)
PASS  runtime-check (26 assertions)
PASS  governor-check (20 assertions)
PASS  pull-check (14 assertions)
PASS  machine-planning (15 assertions)
PASS  http-framing (11 assertions)
PASS  http-routing (23 assertions)
PASS  vision-check (75 assertions)
PASS  toolcall-check (19 assertions)
PASS  toolcall-stream-check (14 assertions)
PASS  toolcall-coercion (23 assertions)
PASS  gateway-request (37 assertions)
PASS  gateway-prompt (23 assertions)
PASS  gateway-catalog (28 assertions)
PASS  gateway-events (19 assertions)
PASS  chat-splice (10 assertions)
PASS  gateway-null-bridge (10 assertions)
PASS  gateway-anyof-types (13 assertions)
PASS  openai-conversation (40 assertions)
PASS  openai-tool-output (163 assertions)
PASS  openai-context-budget (16 assertions)

22 passed, 0 failed, 0 skipped (616 assertions)
```

## sampler-gates-final.log

```text
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
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (20 branches)
sampler + governor: passed 16, failed 0
```

## transport-coverage-final.log

```text
coverage: 43.07% of 11352 lines across 43 files
  up    Sources/Slotstream/Errors.swift                      0.00% -> 52.17%
  up    Sources/Slotstream/GatewayDialect.swift              84.45% -> 86.36%
  up    Sources/Slotstream/Generate.swift                    17.25% -> 18.88%
  up    Sources/Slotstream/Governor.swift                    26.76% -> 27.80%
  up    Sources/Slotstream/Plan.swift                        76.42% -> 76.97%
  up    Sources/Slotstream/PrefixCache.swift                 80.19% -> 86.79%
  up    Sources/Slotstream/Server.swift                      10.51% -> 12.91%
  up    Sources/Slotstream/Vision.swift                      29.04% -> 43.57%
  up    Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift 90.31% -> 91.09%
```

The first inference attempt was refused by the shared model-process lock while another task built its model binary; no second model was allocated. The successful retry used a 10 GB target after the owner released the lock. The pre-fix callback fixture fails compilation; the final fixture and external consumer compile and run. Ephemeral CLI fixture coordinates are replaced with a label.

## static-gates-final.log (terminal results)

Full local log SHA-256: `0af6375d73eb2c20bb710aff0d9be1bd56fe873dfcdd814288f8f1f8a5acaae7`. The first coverage wrapper run had an argument-forwarding error after its HTTP fixtures passed; the corrected wrapper reran the fixtures and produced the retained profiles. The LCOV union was then corrected to preserve unrelated LLVM LF/LH summaries, and the final ratchet passes without lowering existing floors. Only new transport floors and measured gains in the two download files were registered.

```text
BRAIN GATES PASS
MANIFEST CHECKS PASS
ALL HTTP CHECKS PASS
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 340754432 bytes peak RSS
SLOTPACK GATES PASS
INSTALLER GATES PASS
STATIC GATES PASS
```

## transport-coverage.log (terminal results)

Full local log SHA-256: `ce2337208f5c12aaa90be3463e85c8b969f959ceb778b754393898bfc5031727`. The first coverage wrapper run had an argument-forwarding error after its HTTP fixtures passed; the corrected wrapper reran the fixtures and produced the retained profiles. The LCOV union was then corrected to preserve unrelated LLVM LF/LH summaries, and the final ratchet passes without lowering existing floors. Only new transport floors and measured gains in the two download files were registered.

```text
PASS  prefill-schedule (9 assertions)
PASS  context-policy (8 assertions)
PASS  runtime-check (26 assertions)
PASS  governor-check (20 assertions)
PASS  pull-check (14 assertions)
PASS  machine-planning (15 assertions)
PASS  http-framing (11 assertions)
PASS  http-routing (23 assertions)
PASS  vision-check (75 assertions)
PASS  sampler-behaviour (9 assertions)
PASS  vision-splice (12 assertions)
PASS  toolcall-check (19 assertions)
PASS  toolcall-stream-check (14 assertions)
PASS  toolcall-coercion (23 assertions)
PASS  gateway-request (37 assertions)
PASS  gateway-prompt (23 assertions)
PASS  gateway-catalog (28 assertions)
PASS  gateway-events (19 assertions)
PASS  chat-splice (10 assertions)
PASS  gateway-null-bridge (10 assertions)
PASS  gateway-anyof-types (13 assertions)
PASS  openai-conversation (40 assertions)
PASS  openai-tool-output (163 assertions)
PASS  openai-context-budget (16 assertions)
24 passed, 0 failed, 0 skipped (637 assertions)
ALL HTTP CHECKS PASS
ALL RAW HTTP CHECKS PASS
coverage.py: error: unrecognized arguments: --lcov ../transport-coverage.info
```

## transport-coverage-v2.log (terminal results)

Full local log SHA-256: `ab4f1e3f81a4037625416b89a513bc9b864e67c076b9a003f4dc8823e77dbace`. The first coverage wrapper run had an argument-forwarding error after its HTTP fixtures passed; the corrected wrapper reran the fixtures and produced the retained profiles. The LCOV union was then corrected to preserve unrelated LLVM LF/LH summaries, and the final ratchet passes without lowering existing floors. Only new transport floors and measured gains in the two download files were registered.

```text
ALL HTTP CHECKS PASS
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 331300864 bytes peak RSS
TRANSPORT LINE COVERAGE PASS: real manifest, HTTP, raw and sustained-memory fixtures
```

## Final fixture receipts from the uninstrumented static gate

### manifest-checks.json

```json
{
  "checks": [
    "embedded manifest and original pins agree",
    "new installs have a public compressed source",
    "C encoder accepts Swift data",
    "Swift C roundtrip is exact",
    "manifest hash is mandatory",
    "pinned file identity cannot change",
    "unknown version",
    "empty object list",
    "invalid size=9223372036854775807",
    "invalid rawSize=9223372036854775807",
    "invalid rawSize=0",
    "invalid size=0",
    "overlapping ranges",
    "range escapes file",
    "range references unknown file",
    "path traversal",
    "compressed corruption",
    "reconstruction digest is mandatory",
    "trial starts at 16",
    "plateau rolls back to 8",
    "useful gain trials 32",
    "cap stays at 32",
    "CPU backlog or retries stops expansion",
    "CPU backlog or retries stops expansion",
    "original public API signatures remain available",
    "public synchronous log lifetime closes on cancellation",
    "disk space checked before creating large parts"
  ],
  "pass": true
}
```

### download-checks.json

```json
{
  "pass_": true,
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "9e64194e11946b2ac5e16b3650ef73ae31f2cf8be1a99c0a66900eff855e8ff9"
    },
    "binarySHA256": "21fb0d45084f5454c85db472754584b8b7ef4348e60bc97657823b150ecdad7b"
  },
  "checks": [
    {
      "name": "normal",
      "pass_": true,
      "seconds": 0.249,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "redirect",
      "pass_": true,
      "seconds": 0.034,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nverified biases.bin\nverified scales.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fallback",
      "pass_": true,
      "seconds": 0.032,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "missing-object-raw-fallback",
      "pass_": true,
      "seconds": 0.041,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 18 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.016,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadHTTPError(status: 206, retryAfter: nil)\n"
    },
    {
      "name": "raw-ignored-range-fails",
      "pass_": true,
      "seconds": 0.015,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadHTTPError(status: 200, retryAfter: nil)\n"
    },
    {
      "name": "optional-absent",
      "pass_": true,
      "seconds": 0.033,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified scales.bin\nverified weights.safetensors\nverified config.json\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "optional-corrupt-and-unavailable",
      "pass_": true,
      "seconds": 0.032,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified config.json\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fails",
      "pass_": true,
      "seconds": 0.015,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "compressed object digest mismatch\n"
    },
    {
      "name": "retry-after",
      "pass_": true,
      "seconds": 0.032,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "transient-retry",
      "pass_": true,
      "seconds": 5.357,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified biases.bin\nverified scales.bin\nverified weights.safetensors\nverified mtp.safetensors\nverified config.json\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 5.3 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "wrong-length-fallback",
      "pass_": true,
      "seconds": 11.307,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nverified mtp.safetensors\n100.0% verified \u00b7 2.2 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\nverified config.json\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 11.3 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "short-body-fallback",
      "pass_": true,
      "seconds": 35.854,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.2 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.6 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\n94.1% verified \u00b7 0.9 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified mtp.safetensors\nverified config.json\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 35.8 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "content-encoding-fallback",
      "pass_": true,
      "seconds": 35.866,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified biases.bin\nverified scales.bin\nverified weights.safetensors\n94.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 35.9 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cancel-preserves-progress",
      "pass_": true,
      "seconds": 0.938,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "damaged-resumed-chunk-rejected",
      "pass_": true,
      "seconds": 0.024,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified biases.bin\n",
      "stderr": "PullIntegrityError(file: \"weights.safetensors\")\n"
    },
    {
      "name": "damaged-resumed-chunk-repair",
      "pass_": true,
      "seconds": 0.026,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "resume",
      "pass_": true,
      "seconds": 0.025,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified scales.bin\nverified weights.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "already-installed",
      "pass_": true,
      "seconds": 0.014,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "valid-symlinks-reused",
      "pass_": true,
      "seconds": 0.013,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "corruption-seed",
      "pass_": true,
      "seconds": 0.026,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "same-size-final-repair",
      "pass_": true,
      "seconds": 0.019,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\n1 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "invalid-resume-map",
      "pass_": true,
      "seconds": 0.026,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified biases.bin\nverified scales.bin\nverified weights.safetensors\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "forged-complete-map-without-parts",
      "pass_": true,
      "seconds": 0.027,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "oversized-map-is-discarded",
      "pass_": true,
      "seconds": 0.026,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "part-symlink-rejected",
      "pass_": true,
      "seconds": 0.005,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot create partial file: weights.safetensors\n"
    },
    {
      "name": "part-hardlink-rejected",
      "pass_": true,
      "seconds": 0.005,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot size partial file: weights.safetensors\n"
    },
    {
      "name": "part-fifo-rejected",
      "pass_": true,
      "seconds": 0.005,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot create partial file: weights.safetensors\n"
    },
    {
      "name": "concurrent-writer-rejected",
      "pass_": true,
      "seconds": 0.006,
      "returncode": 1,
      "stdout": "",
      "stderr": "another download is already writing this directory\n"
    }
  ],
  "requests": 634
}
```

### raw-checks.json

```json
{
  "pass_": true,
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "9e64194e11946b2ac5e16b3650ef73ae31f2cf8be1a99c0a66900eff855e8ff9"
    },
    "binarySHA256": "1a3590a40078e7ba1e9363c6f1be47a282093485be7068438c8d86697a3d57e8"
  },
  "checks": [
    {
      "name": "raw-multichunk",
      "pass_": true,
      "seconds": 0.678,
      "returncode": 0,
      "stdout": "verified config.json\n  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-installed-no-http",
      "pass_": true,
      "seconds": 0.268,
      "returncode": 0,
      "stdout": "HARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-missing",
      "pass_": true,
      "seconds": 0.349,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-wrong-range",
      "pass_": true,
      "seconds": 0.357,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-encoding",
      "pass_": true,
      "seconds": 40.764,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\n0.2/0.4 GB verified chunks | 8.4 MB/s received | ETA 20 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 7.8 MB/s received | ETA 22 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.7 MB/s received | ETA 25 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.3 MB/s received | ETA 27 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.0 MB/s received | ETA 28 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.3 MB/s received | ETA 32 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.1 MB/s received | ETA 33 s | 2 file(s) left\nmtp.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-ignore-range",
      "pass_": true,
      "seconds": 0.334,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.024,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "weights.safetensors: download failed from all 1 source(s) (invalid Content-Range) \u2014 rerun `slotstream pull` to resume\n"
    },
    {
      "name": "raw-corrupt-final-rejected",
      "pass_": true,
      "seconds": 0.169,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "PullIntegrityError(file: \"config.json\")\n"
    },
    {
      "name": "raw-optional-inflight-writers",
      "pass_": true,
      "seconds": 0.209,
      "returncode": 0,
      "stdout": "verified config.json\nskip mtp.safetensors: unavailable from every source; optional\n  4 connections in use\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-cancel",
      "pass_": true,
      "seconds": 0.946,
      "returncode": 1,
      "stdout": "verified config.json\n  4 connections in use\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "raw-resume",
      "pass_": true,
      "seconds": 0.32,
      "returncode": 0,
      "stdout": "  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-same-size-repair",
      "pass_": true,
      "seconds": 0.455,
      "returncode": 0,
      "stdout": "  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    }
  ]
}
```

### memory-checks.json

```json
{
  "pass_": true,
  "bytes": 6442450944,
  "objects": 768,
  "peakRSSBytes": 340754432,
  "samples": [
    {
      "seconds": 0.003,
      "rssBytes": 32768
    },
    {
      "seconds": 0.216,
      "rssBytes": 32768
    },
    {
      "seconds": 0.424,
      "rssBytes": 275300352
    },
    {
      "seconds": 0.631,
      "rssBytes": 294076416
    },
    {
      "seconds": 0.845,
      "rssBytes": 336756736
    },
    {
      "seconds": 1.064,
      "rssBytes": 338706432
    },
    {
      "seconds": 1.274,
      "rssBytes": 339230720
    },
    {
      "seconds": 1.483,
      "rssBytes": 339329024
    },
    {
      "seconds": 1.689,
      "rssBytes": 339492864
    },
    {
      "seconds": 1.911,
      "rssBytes": 340246528
    },
    {
      "seconds": 2.121,
      "rssBytes": 340262912
    },
    {
      "seconds": 2.334,
      "rssBytes": 340721664
    },
    {
      "seconds": 2.547,
      "rssBytes": 340754432
    },
    {
      "seconds": 2.758,
      "rssBytes": 340754432
    },
    {
      "seconds": 2.973,
      "rssBytes": 340754432
    },
    {
      "seconds": 3.186,
      "rssBytes": 340754432
    },
    {
      "seconds": 3.398,
      "rssBytes": 340754432
    },
    {
      "seconds": 3.611,
      "rssBytes": 340754432
    },
    {
      "seconds": 3.825,
      "rssBytes": 340754432
    },
    {
      "seconds": 4.032,
      "rssBytes": 340754432
    },
    {
      "seconds": 4.246,
      "rssBytes": 340754432
    },
    {
      "seconds": 4.459,
      "rssBytes": 340754432
    },
    {
      "seconds": 4.672,
      "rssBytes": 340754432
    },
    {
      "seconds": 4.884,
      "rssBytes": 340754432
    },
    {
      "seconds": 5.097,
      "rssBytes": 340754432
    },
    {
      "seconds": 5.31,
      "rssBytes": 340754432
    },
    {
      "seconds": 5.523,
      "rssBytes": 340754432
    },
    {
      "seconds": 5.737,
      "rssBytes": 340754432
    },
    {
      "seconds": 5.95,
      "rssBytes": 340754432
    },
    {
      "seconds": 6.163,
      "rssBytes": 340754432
    },
    {
      "seconds": 6.376,
      "rssBytes": 340754432
    },
    {
      "seconds": 6.589,
      "rssBytes": 340754432
    },
    {
      "seconds": 6.802,
      "rssBytes": 340410368
    }
  ],
  "guard": [],
  "returncode": 0,
  "output": "compressed pull: 6.44 GB remaining, 4 connections; verified chunks resume automatically\n100.0% verified \u00b7 3216.0 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\nverified sustained.bin\n4 TCP connections observed across the active workers\ndownload verified: 6.44 GB received, 0 raw fallback chunks, 4.3 s\nHARNESS PASS\n",
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "9e64194e11946b2ac5e16b3650ef73ae31f2cf8be1a99c0a66900eff855e8ff9"
    },
    "binarySHA256": "aad7d9ed489b9aff2c84d6aed152df285f0f684169437cccfc1c7cfc2505c567"
  }
}
```

Release CI, asset provenance, publication, and installed-binary acceptance are subsequent gates and will be recorded separately.
