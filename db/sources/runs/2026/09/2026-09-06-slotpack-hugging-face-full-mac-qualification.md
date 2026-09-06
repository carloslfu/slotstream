---
type: run
id: 01m1wc4p3brpbp8cfkn3grwxz6
created: 2026-09-06T22:06:37.674882+00:00
updated: 2026-09-06T22:06:37.733006+00:00
summary: The native default completes an initially empty Mac installation across a network failure and resume; every original hash verifies, while timing measurements are discarded.
binary: 828a896582804292ba7976399100416429b19a94a860ca5df4393b60b106a77d
captured_at: 2026-09-06
command: full_pull.py --binary candidate-v0.2.11 --default-source --base-url pinned-Hugging-Face-prefix --destination empty-model-directory
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete native Mac Hugging Face installation with network-failure resume and main CI
tool: Native slotstream CLI, full_pull.py independent hashes, GitHub Actions CI
---
A new, initially empty Mac destination downloaded the public package anonymously through the native CLI's embedded Hugging Face default. Its first attempt stopped at a hostname-resolution failure after substantial verified progress. The same binary resumed those durable chunks in the same directory, completed the remaining transfer, then independently SHA-256 checked every original file. No existing model files, symlinks or external chunks seeded any attempt; all used automatic transport/concurrency and the embedded public source. Coordinated SIGINT pauses preserved the exact resume map for clean independent hardware-study windows; the same download resumed afterward. This is a complete installation across preserved interrupted attempts, not an uninterrupted fresh timing sample. The final segment reports zero raw fallback chunks; interrupted segments emitted no final fallback counter, so no zero-fallback claim is made for the whole installation. The qualification wrapper sets only the explicit HTTP timeout and observes process RSS once per second, with a cancellation guard.

Timing and capacity measurements from this run are discarded. Bounded local builds/static checks and dependency fetching, independent bounded native correctness checks, and an earlier-client compatibility download overlapped parts of this transfer, and the Mac network route slowed substantially. The original-file integrity result remains valid under these overlaps; no host-speed or capacity claim follows from it. The receipt below preserves the exact client summary, every original-file hash, source identity and sampled peak. The individual RSS samples remain in the locally preserved receipt identified by SHA-256; this capture does not claim an unsampled peak.

The failed attempt and independent route diagnostics are preserved in [[sources/runs/2026/09/2026-09-06-slotpack-hugging-face-mac-network-interruption]].

## Complete public Mac download

```json
{
  "pass_": true,
  "peakRSSBytes": 1267712000,
  "fresh": false,
  "cli": true,
  "defaultSource": true,
  "clientSummary": [
    "download connection trial: 16 active",
    "download connection trial: 8 active",
    "8 TCP connections observed across the active workers",
    "download verified: 16.82 GB received, 0 raw fallback chunks, 12057.8 s"
  ],
  "kind": "public-cdn",
  "base": "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/13ec15dcebdddc817b57f0f9087c5ef82018f10e/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "binarySHA256": "828a896582804292ba7976399100416429b19a94a860ca5df4393b60b106a77d",
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
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Sources/Slotstream/MTP.swift": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/Server.swift": "676457a0ecdd1243bea26562723e20c9eb78b2060427916919ceabea6f560fa2",
    "Sources/Slotstream/Context.swift": "208f5b98f054241870b534c56558fb48663c9fce4ad14bbf3c84cda500ad3834",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
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
  "originalBytes": 105264463248,
  "downloadObjectBytes": 88294086225,
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
  "secondsDiagnostic": 12088.903686917,
  "freshInstallation": true,
  "resumed": true,
  "externallySeededFiles": 0,
  "qualification": "complete original-file reconstruction from an initially empty destination across preserved interrupted attempts and resume",
  "initialAttemptError": "URLSession code -1003: hostname resolution failure",
  "wholeInstallationFallbackCount": null,
  "fallbackScope": "zero in completed final segment; interrupted segments emitted no final fallback count",
  "secondsDiagnosticScope": "completed final segment only; timing and capacity conclusions are discarded",
  "attemptReceipts": [
    {
      "attempt": 1,
      "file": "full-hf-mac-attempt1-failed.json",
      "sha256": "7021fdad1e6828fa89984897edc1ca5bf44fefcf9c9c693468ba73f4b9dc4366",
      "pass_": false,
      "originallyFresh": true,
      "exitCode": 1
    },
    {
      "attempt": 2,
      "file": "full-hf-mac-attempt2-paused.json",
      "sha256": "68b6fd5c1cdf2ab91ea2d999158cc4cc4cdbdcf0dc5760f82034b52b8475a087",
      "pass_": false,
      "originallyFresh": false,
      "exitCode": 130
    },
    {
      "attempt": 3,
      "file": "full-hf-mac-attempt3-paused.json",
      "sha256": "4fcc2e42eacd7ba291834f70dc1d942be839d240ae113762c4e1c84d32efa458",
      "pass_": false,
      "originallyFresh": false,
      "exitCode": 130
    },
    {
      "attempt": 4,
      "file": "full-hf-mac-attempt4.json",
      "sha256": "2cf281e451dab6dd851e25830e76171751ed42bf72a2ab696f588c6fb4255033",
      "pass_": true,
      "originallyFresh": false,
      "exitCode": 0
    }
  ],
  "publicServerRequestCountersAvailable": false,
  "rssSampling": {
    "intervalSeconds": 1,
    "samples": 19405,
    "sampledPeakBytes": 1267712000,
    "guardBytes": 4000000000,
    "fullLocalReceiptSHA256": "348dcc3fc2f5668a10c8d4451974d45c5f905264a07760ef4be1c44f19b249a2"
  }
}
```

## Public main CI

```json
{
  "conclusion": "success",
  "headSha": "e498b2d0162cefa314ba9931ebd38c3a0c47f371",
  "jobs": [
    {
      "completedAt": "2026-09-06T16:27:28Z",
      "conclusion": "success",
      "databaseId": 101516859229,
      "name": "weights-free",
      "startedAt": "2026-09-06T16:07:33Z",
      "status": "completed",
      "steps": [
        {
          "completedAt": "2026-09-06T16:07:34Z",
          "conclusion": "success",
          "name": "Set up job",
          "number": 1,
          "startedAt": "2026-09-06T16:07:33Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:07:36Z",
          "conclusion": "success",
          "name": "Run actions/checkout@v7",
          "number": 2,
          "startedAt": "2026-09-06T16:07:34Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:07:36Z",
          "conclusion": "success",
          "name": "toolchain",
          "number": 3,
          "startedAt": "2026-09-06T16:07:36Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:07:38Z",
          "conclusion": "success",
          "name": "pinned Metal library",
          "number": 4,
          "startedAt": "2026-09-06T16:07:36Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:13:23Z",
          "conclusion": "success",
          "name": "release build",
          "number": 5,
          "startedAt": "2026-09-06T16:07:38Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:13:23Z",
          "conclusion": "success",
          "name": "pinned dbmd (the brain gates inside static_gates.sh need it)",
          "number": 6,
          "startedAt": "2026-09-06T16:13:23Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:18:03Z",
          "conclusion": "success",
          "name": "static and runtime safety gates",
          "number": 7,
          "startedAt": "2026-09-06T16:13:23Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:18:13Z",
          "conclusion": "success",
          "name": "sampler and governor goldens",
          "number": 8,
          "startedAt": "2026-09-06T16:18:03Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:18:17Z",
          "conclusion": "success",
          "name": "check catalogue (every check by name)",
          "number": 9,
          "startedAt": "2026-09-06T16:18:13Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:20:35Z",
          "conclusion": "success",
          "name": "the library is importable from outside the package",
          "number": 10,
          "startedAt": "2026-09-06T16:18:17Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:27:22Z",
          "conclusion": "success",
          "name": "coverage may not go down",
          "number": 11,
          "startedAt": "2026-09-06T16:20:35Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:27:24Z",
          "conclusion": "success",
          "name": "coverage report",
          "number": 12,
          "startedAt": "2026-09-06T16:27:22Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:27:24Z",
          "conclusion": "success",
          "name": "Post Run actions/checkout@v7",
          "number": 24,
          "startedAt": "2026-09-06T16:27:24Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T16:27:26Z",
          "conclusion": "success",
          "name": "Complete job",
          "number": 25,
          "startedAt": "2026-09-06T16:27:24Z",
          "status": "completed"
        }
      ],
      "url": "https://github.com/carloslfu/slotstream/actions/runs/34044440325/job/101516859229"
    }
  ],
  "startedAt": "2026-09-06T16:07:25Z",
  "status": "completed",
  "updatedAt": "2026-09-06T16:27:29Z",
  "url": "https://github.com/carloslfu/slotstream/actions/runs/34044440325"
}
```

Publication and the installed-release check are subsequent steps. The exact production source files in this Mac candidate match the passing public main commit; documentation can change independently.

## Coordinated pauses with unchanged verified state

```json
[
  {
    "pass_": true,
    "reason": "Coordinated clean bounded GDN study while the network was degraded",
    "expectedExitCode": 130,
    "actualExitCode": 130,
    "workersDrained": true,
    "processExited": true,
    "verifiedChunksBefore": 3160,
    "verifiedChunksAfter": 3160,
    "totalChunks": 4155,
    "verifiedProgressPreserved": true,
    "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
    "beforeStateSHA256": "e5f0cd41e297d2ddc2d2531df48303fb4eba1029fa1cffa8a1860be16a17b080",
    "afterStateSHA256": "e5f0cd41e297d2ddc2d2531df48303fb4eba1029fa1cffa8a1860be16a17b080",
    "completedAt": "2026-09-06T17:20:23.617806+00:00"
  },
  {
    "pass_": true,
    "requestedAt": "2026-09-06T18:27:21.511740+00:00",
    "completedAt": "2026-09-06T18:27:41.101488+00:00",
    "reason": "One coordinated clean bounded V160 seven-cell maximum-image capacity study; maximum 30 minutes including cleanup; preserve resumable model download",
    "exitCode": 130,
    "workersDrained": true,
    "verifiedProgressPreserved": true,
    "verifiedChunksBefore": 3321,
    "verifiedChunksAfter": 3321,
    "stateBeforeSHA256": "337cee18ccc222d85316bfc0321f18ea290afbecc0e8217a8ca309d4c91bfe2c",
    "stateAfterSHA256": "337cee18ccc222d85316bfc0321f18ea290afbecc0e8217a8ca309d4c91bfe2c",
    "attemptReceipt": "full-hf-mac-attempt3-paused.json"
  }
]
```

## Later local network diagnosis

A passive process-byte sample found little competing traffic from other apps. A later read-only macOS wireless report showed a low negotiated transmit link rate. This makes the local wireless link a plausible contributor; it does not identify the only bottleneck or establish end-to-end download capacity. A bounded SSH-route probe also missed its completion deadline, so no SSH throughput is inferred. These observations are diagnostic only. Network names, local addresses and other application identities are omitted. The transmit-link interpretation follows [the network vendor's explanation](https://www.tp-link.com/us/support/faq/2265/).

### passive-network-share.json

```json
{
  "capturedAt": "2026-09-06T17:47:34.877240+00:00",
  "scope": "external-interface process summaries; first cumulative sample discarded; no hostnames or other application identities retained",
  "sampleIntervalSeconds": 1,
  "samples": [
    {
      "slotstreamReceivedBytes": 1513160,
      "otherReceivedBytes": 31876,
      "slotstreamSentBytes": 59610,
      "otherSentBytes": 1189,
      "slotstreamProcesses": 1
    },
    {
      "slotstreamReceivedBytes": 1401664,
      "otherReceivedBytes": 34909,
      "slotstreamSentBytes": 35924,
      "otherSentBytes": 8963,
      "slotstreamProcesses": 1
    }
  ]
}
```

### mac-wireless-link-diagnostic.json

```json
{
  "capturedAt": "2026-09-06T18:10:49.070220+00:00",
  "purpose": "read-only local link diagnosis; network names and addresses omitted",
  "exitCode": 0,
  "linkInformation": [
    {
      "spairport_network_channel": "60 (5GHz, 80MHz)",
      "spairport_network_mcs": 2,
      "spairport_network_rate": 45,
      "spairport_signal_noise": "-68 dBm / -96 dBm"
    },
    {}
  ]
}
```

### mac-wireless-route-correlation.json

```json
{
  "capturedAt": "2026-09-06T19:37:42.362916+00:00",
  "ipv4DefaultRouteUsesWirelessInterface": true,
  "scope": "read-only hardware-port/default-route correlation; no network names or addresses retained"
}
```

### mac-route-settings-diagnostic.json

```json
{
  "capturedAt": "2026-09-06T18:14:34.324135+00:00",
  "defaultRouteInterfaceKind": "physical",
  "systemProxyEnabledFlags": {},
  "proxyEnvironmentVariablesPresent": [],
  "scope": "read-only configuration; no addresses, proxy URLs or network names retained"
}
```

### mac-local-router-probe.json

```json
{
  "capturedAt": "2026-09-06T18:47:49.362670+00:00",
  "purpose": "bounded local-router path diagnosis; router address omitted",
  "protocol": "ICMP",
  "requestedPackets": 8,
  "exitCode": 0,
  "transmitted": 8,
  "received": 8,
  "lossPercent": 0.0,
  "roundTripMinAvgMaxStddevMilliseconds": [
    7.348,
    13.04,
    26.879,
    6.635
  ],
  "scope": "One small sample; ICMP behavior is not an end-to-end download-speed measurement."
}
```

### mac-hetzner-route-probe.json

```json
{
  "capturedAt": "2026-09-06T18:03:50.720872+00:00",
  "purpose": "bounded independent-route diagnosis, not a hosting benchmark",
  "route": "existing Hetzner SSH connection",
  "compressionRequested": false,
  "requestedBytes": 1048576,
  "timedOut": true,
  "timeoutSeconds": 30,
  "bytesReceived": null,
  "conclusion": "Command did not complete within deadline; no throughput estimate is supported."
}
```

### mac-process-background-policy.json

```json
{
  "capturedAt": "2026-09-06T20:11:47.856083+00:00",
  "readOnly": true,
  "processes": [
    {
      "role": "downloader",
      "darwinBackgroundFlag": false,
      "externallyEnforcedBackgroundFlag": false,
      "darwinProcessPriority": 0,
      "priorityQueryErrno": 0
    },
    {
      "role": "qualification wrapper",
      "darwinBackgroundFlag": false,
      "externallyEnforcedBackgroundFlag": false,
      "darwinProcessPriority": 0,
      "priorityQueryErrno": 0
    },
    {
      "role": "parent launcher",
      "darwinBackgroundFlag": false,
      "externallyEnforcedBackgroundFlag": false,
      "darwinProcessPriority": 0,
      "priorityQueryErrno": 0
    }
  ],
  "scope": "Process-level Darwin background policy only; this is not a complete per-thread QoS or network-path diagnosis."
}
```
