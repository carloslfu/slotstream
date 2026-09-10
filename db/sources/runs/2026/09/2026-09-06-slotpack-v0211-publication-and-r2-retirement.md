---
type: run
id: 01m1wdrx7nqppffezntxsjhyz7
created: 2026-09-06T22:35:08.917159+00:00
updated: 2026-09-06T22:35:08.967008+00:00
summary: Public v0.2.11 provenance, ordinary installation, installed-model acceptance and verified R2 bucket retirement complete the free Hugging Face migration.
binary: 7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8
captured_at: 2026-09-06
command: CI release; gh attestation verify with exact source/ref/workflow; public install.sh; installed CLI checks, reuse and bounded model run; verified model-only R2 retirement
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.11 public release, installed acceptance and R2 retirement
tool: GitHub Actions, signed provenance, ordinary installer, native CLI, independent hashes and Cloudflare readback
---
The public v0.2.11 release is built and published by the existing GitHub Actions release workflow. Its archive digest and signed provenance are verified against the exact source commit, tag, expected workflow and GitHub-hosted runner requirement. The ordinary public installer activates the exact archive contents and preserves the previous release. No release-source or installation-root override is used.

The installed binary passes actual CLI source/transport selection and SIGINT checks, revalidates and reuses the fully reconstructed Mac model without receiving model bytes, independently hashes every original file again, and loads that model at a bounded explicit memory target to answer the short prompt. These are functional acceptance checks, not an inference-speed or capacity benchmark. The temporary duplicate model used for qualification is removed after these checks; the receipts preserve every verified file hash.

The redundant slotstream-weights R2 bucket contained only the qualified immutable package. After complete public Linux reconstruction, complete native Mac reconstruction across a preserved network-failure resume, and old-client compatibility passed, all objects and the bucket were removed. The post-delete read verifies absence; the retained old hostname still redirects and returns a hash-checked package object from Hugging Face. This stops future storage and read usage for that model bucket; deletion does not remove any charges that may already have accrued. No other bucket or paid-plan setting was changed.

The original raw Hugging Face mirror, model files, pinned original hashes, lossless codec and optional draft head are unchanged. No telemetry or counting-only request was added.

## public-release-install-receipt.json

```json
{
  "pass_": true,
  "version": "0.2.11",
  "tag": "v0.2.11",
  "sourceCommit": "f3b5a5405edd8d9419eb6de3be439fcbb2ba4d72",
  "releaseURL": "https://github.com/carloslfu/slotstream/releases/tag/v0.2.11",
  "publishedAt": "2026-09-06T22:21:31Z",
  "archiveSHA256": "08b98dcff047091817469276c44ad5f467b7b3506190558866e171ec1da25244",
  "assetContents": {
    "slotstream": {
      "size": 40338680,
      "sha256": "7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8"
    },
    "mlx.metallib": {
      "size": 131041909,
      "sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "installerURL": "https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh",
  "installerSHA256": "8fc9b91156e1f92d6ef1efcda72ae339fcdf3987a9f7c2021a2c6d02ac19d8f1",
  "ordinaryPublicInstaller": true,
  "releaseSourceOverride": false,
  "installRootOverride": false,
  "provenance": {
    "verified": true,
    "sourceCommit": "f3b5a5405edd8d9419eb6de3be439fcbb2ba4d72",
    "sourceRef": "refs/tags/v0.2.11",
    "workflow": "carloslfu/slotstream/.github/workflows/release.yml",
    "githubHostedRunnerRequired": true
  },
  "installedReleaseKey": "08b98dcff047091817469276c44ad5f467b7b3506190558866e171ec1da25244-macos26",
  "previousReleasePreserved": true,
  "installedAt": "2026-09-06T22:25:01.292094+00:00"
}
```

## installed-cli-checks.json

```json
{
  "pass_": true,
  "checks": [
    {
      "name": "default",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.227,
      "requests": 8,
      "output": "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "raw-sources-override",
      "pass_": true,
      "transport": "raw",
      "exitCode": 130,
      "cancelSeconds": 0.079,
      "requests": 8,
      "output": "reference estimate: ~18 min at 100 MB/s; actual progress is measured\npulling pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b: 105.3 GB to go over 8 connections (resumable \u2014 rerun to continue)\nsource: http://127.0.0.1:53132/raw\n  8 connections in use\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "explicit-compressed",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.236,
      "requests": 8,
      "output": "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "explicit-raw",
      "pass_": true,
      "transport": "raw",
      "exitCode": 130,
      "cancelSeconds": 0.072,
      "requests": 8,
      "output": "reference estimate: ~18 min at 100 MB/s; actual progress is measured\npulling pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b: 105.3 GB to go over 8 connections (resumable \u2014 rerun to continue)\nsource: http://127.0.0.1:53132/raw\n  8 connections in use\ndownload interrupted; rerun to resume verified chunks\n"
    }
  ]
}
```

## installed-model-reuse-receipt.json

```json
{
  "pass_": true,
  "peakRSSBytes": 41025536,
  "memory": [
    {
      "seconds": 1.02,
      "rssBytes": 39714816
    },
    {
      "seconds": 2.03,
      "rssBytes": 39714816
    },
    {
      "seconds": 3.04,
      "rssBytes": 39714816
    },
    {
      "seconds": 4.05,
      "rssBytes": 39763968
    },
    {
      "seconds": 5.07,
      "rssBytes": 39763968
    },
    {
      "seconds": 6.07,
      "rssBytes": 39763968
    },
    {
      "seconds": 7.08,
      "rssBytes": 39763968
    },
    {
      "seconds": 8.1,
      "rssBytes": 39796736
    },
    {
      "seconds": 9.1,
      "rssBytes": 39796736
    },
    {
      "seconds": 10.11,
      "rssBytes": 39796736
    },
    {
      "seconds": 11.12,
      "rssBytes": 39796736
    },
    {
      "seconds": 12.13,
      "rssBytes": 39796736
    },
    {
      "seconds": 13.14,
      "rssBytes": 39796736
    },
    {
      "seconds": 14.15,
      "rssBytes": 39796736
    },
    {
      "seconds": 15.16,
      "rssBytes": 39813120
    },
    {
      "seconds": 16.18,
      "rssBytes": 39813120
    },
    {
      "seconds": 17.19,
      "rssBytes": 39813120
    },
    {
      "seconds": 18.2,
      "rssBytes": 39813120
    },
    {
      "seconds": 19.22,
      "rssBytes": 39845888
    },
    {
      "seconds": 20.23,
      "rssBytes": 39845888
    },
    {
      "seconds": 21.24,
      "rssBytes": 39845888
    },
    {
      "seconds": 22.25,
      "rssBytes": 39976960
    },
    {
      "seconds": 23.26,
      "rssBytes": 39976960
    },
    {
      "seconds": 24.27,
      "rssBytes": 39976960
    },
    {
      "seconds": 25.28,
      "rssBytes": 39976960
    },
    {
      "seconds": 26.3,
      "rssBytes": 39976960
    },
    {
      "seconds": 27.3,
      "rssBytes": 39976960
    },
    {
      "seconds": 28.32,
      "rssBytes": 39976960
    },
    {
      "seconds": 29.33,
      "rssBytes": 39976960
    },
    {
      "seconds": 30.35,
      "rssBytes": 39976960
    },
    {
      "seconds": 31.36,
      "rssBytes": 39976960
    },
    {
      "seconds": 32.37,
      "rssBytes": 39976960
    },
    {
      "seconds": 33.38,
      "rssBytes": 39976960
    },
    {
      "seconds": 34.4,
      "rssBytes": 39993344
    },
    {
      "seconds": 35.41,
      "rssBytes": 39993344
    },
    {
      "seconds": 36.42,
      "rssBytes": 39993344
    },
    {
      "seconds": 37.44,
      "rssBytes": 40206336
    },
    {
      "seconds": 38.45,
      "rssBytes": 41025536
    }
  ],
  "fresh": false,
  "cli": true,
  "defaultSource": true,
  "clientSummary": [
    "download verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s"
  ],
  "kind": "public-cdn",
  "base": "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/13ec15dcebdddc817b57f0f9087c5ef82018f10e/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "binarySHA256": "7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8",
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
  "secondsDiagnostic": 38.63745075,
  "publicServerRequestCountersAvailable": false
}
```

## installed-model-smoke-receipt.json

```json
{
  "pass_": true,
  "version": "0.2.11",
  "binarySHA256": "7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8",
  "model": "fresh anonymously reconstructed Hugging Face package; all original files independently verified",
  "command": [
    "slotstream",
    "run",
    "--model",
    "<fresh-model>",
    "--memory-gb",
    "10",
    "--mtp",
    "off",
    "--vision",
    "off",
    "--prompt",
    "Reply with exactly: READY",
    "--max-tokens",
    "16",
    "--greedy"
  ],
  "defaultEnvironment": true,
  "memoryTargetGB": 10,
  "initialReclaimableGB": 26.6,
  "sampledPeakRSSBytes": 2337144832,
  "maxTokens": 16,
  "mtp": "off",
  "vision": "off",
  "exitCode": 0,
  "stopReason": null,
  "output": "READY\n",
  "diagnosticOutput": "slotstream memory plan (--memory-gb)\n  device: 52 GB RAM (26.6 GB reclaimable now), 40.2 GB Metal working set\n  target: 10.0 GB total for this process\n  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)\n  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)\n  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above \u2014 see docs/HARDWARE.md\n  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)\n  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new\n  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new\nengine ready in 0.9s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]\nprompt tokens: 17 (~0 s to the first token at this plan)\n\n-- prefill 17 tok in 1.50s (11.3 tok/s)\n-- prefill split: io 0.70s + scatter 0.00s + compute 0.80s | 3160 records (8.7 GB, 12.5 GB/s)\n-- decode 1 tok in 0.27s (3.67 tok/s)\n-- decode split: io 0.10s + scatter 0.00s + compute 0.17s | 414 records\n-- expert cache ~20/512 experts per layer, hit rate 0.138 | ngram rows 0h/16m | peak 6.4 GB | total 1.8s\n",
  "secondsDiagnostic": 2.978267584,
  "completedAt": "2026-09-06T22:29:11.365934+00:00"
}
```

## r2-retirement-complete.json

```json
{
  "pass_": true,
  "bucket": "slotstream-weights",
  "bucketDeleted": true,
  "remainingObjects": 0,
  "deletedObjects": 4156,
  "deletedObjectBytes": 88295438048,
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "startedAt": "2026-09-06T22:06:46.129509+00:00",
  "completedAt": "2026-09-06T22:31:44.084599+00:00",
  "qualifiedHFRevision": "13ec15dcebdddc817b57f0f9087c5ef82018f10e",
  "legacyRedirectRetained": true,
  "otherBucketsTouched": false
}
```

## post-retirement-legacy-probe.json

```json
{
  "pass_": true,
  "bucketAbsent": true,
  "legacyHostname": "weights.sevra.page",
  "service": "slotstream-download-redirect",
  "redirectStatus": 302,
  "pinnedDestination": "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/13ec15dcebdddc817b57f0f9087c5ef82018f10e/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38/objects/0c/0cf39d9f7e6653d633daaeaf6242899427637ec0fb8f14f087521581d1203f04.bin",
  "objectSHA256": "0cf39d9f7e6653d633daaeaf6242899427637ec0fb8f14f087521581d1203f04",
  "receivedBytes": 56,
  "finalHost": "us.aws.cdn.hf.co",
  "capturedAt": "2026-09-06T22:33:27.916293+00:00"
}
```

## public-release-ci.json

```json
{
  "conclusion": "success",
  "databaseId": 34063146311,
  "headSha": "f3b5a5405edd8d9419eb6de3be439fcbb2ba4d72",
  "jobs": [
    {
      "completedAt": "2026-09-06T22:21:36Z",
      "conclusion": "success",
      "databaseId": 101567164129,
      "name": "build",
      "startedAt": "2026-09-06T22:08:49Z",
      "status": "completed",
      "steps": [
        {
          "completedAt": "2026-09-06T22:08:51Z",
          "conclusion": "success",
          "name": "Set up job",
          "number": 1,
          "startedAt": "2026-09-06T22:08:50Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:08:54Z",
          "conclusion": "success",
          "name": "Run actions/checkout@v7",
          "number": 2,
          "startedAt": "2026-09-06T22:08:51Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:08:58Z",
          "conclusion": "success",
          "name": "toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)",
          "number": 3,
          "startedAt": "2026-09-06T22:08:54Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:09:01Z",
          "conclusion": "success",
          "name": "metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)",
          "number": 4,
          "startedAt": "2026-09-06T22:08:58Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:15:49Z",
          "conclusion": "success",
          "name": "build",
          "number": 5,
          "startedAt": "2026-09-06T22:09:01Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:15:50Z",
          "conclusion": "success",
          "name": "smoke",
          "number": 6,
          "startedAt": "2026-09-06T22:15:49Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:15:50Z",
          "conclusion": "success",
          "name": "pinned dbmd (the brain gates inside static_gates.sh need it)",
          "number": 7,
          "startedAt": "2026-09-06T22:15:50Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:21:05Z",
          "conclusion": "success",
          "name": "static gates \u2014 planner, brain, installer (no weights needed)",
          "number": 8,
          "startedAt": "2026-09-06T22:15:50Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:21:20Z",
          "conclusion": "success",
          "name": "sampler golden + governor policy (no weights needed)",
          "number": 9,
          "startedAt": "2026-09-06T22:21:05Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:21:25Z",
          "conclusion": "success",
          "name": "package",
          "number": 10,
          "startedAt": "2026-09-06T22:21:20Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:21:27Z",
          "conclusion": "success",
          "name": "attest provenance",
          "number": 11,
          "startedAt": "2026-09-06T22:21:25Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:21:32Z",
          "conclusion": "success",
          "name": "publish",
          "number": 12,
          "startedAt": "2026-09-06T22:21:27Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:21:32Z",
          "conclusion": "success",
          "name": "Post Run actions/checkout@v7",
          "number": 24,
          "startedAt": "2026-09-06T22:21:32Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T22:21:33Z",
          "conclusion": "success",
          "name": "Complete job",
          "number": 25,
          "startedAt": "2026-09-06T22:21:32Z",
          "status": "completed"
        }
      ],
      "url": "https://github.com/carloslfu/slotstream/actions/runs/34063146311/job/101567164129"
    }
  ],
  "status": "completed",
  "url": "https://github.com/carloslfu/slotstream/actions/runs/34063146311"
}
```

## temporary-model-cleanup.json

```json
{
  "pass_": true,
  "temporaryQualificationDirectory": "full-hf-model",
  "originalFiles": 25,
  "originalLogicalBytes": 105264463248,
  "completeReceiptPreserved": true,
  "installedReuseAndLoadedReplyPassed": true,
  "removedAt": "2026-09-06T22:31:01.345871+00:00"
}
```
