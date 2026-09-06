---
type: run
id: 01m1tg9x7nh3r6ap2p2xn8srd3
created: 2026-09-06T04:40:54.261127+00:00
updated: 2026-09-06T04:41:04.140964+00:00
summary: Complete fresh Linux CDN pull and independent original-file hashes pass; cache hits, raw/CDN route probes and actual CLI choices are captured.
binary: Exact executable and source SHA-256 identities in the receipts
captured_at: 2026-09-05
command: pullbench pull --dir /model; independent Python original-file hashes; public_probe.py; TransferProbe.swift; cli_checks.py
discarded: 'false'
machines: '[[records/machines/linux-host-helsinki-1gbit]]'
title: Public lossless CDN delivery and complete Linux qualification
tool: Native production Swift/C download harness and independent Python SHA-256
---
# Public CDN route and complete Linux reconstruction

This source preserves correctness evidence and bounded route diagnostics. The Linux pull started from an empty destination and used the compiled public default. Every original file was checked again by an independent Python SHA-256 implementation after the native verifier passed. Docker-owned test files were returned to the test account before that independent read; no model bytes were changed.

The complete Mac public reconstruction and loaded-model acceptance are separate gates. Single-run shared-route timings are diagnostic, not a universal CDN speedup percentage.

## full-cdn-linux-receipt.json

```json
{
  "pass_": true,
  "fresh": true,
  "defaultSource": true,
  "platform": "Linux x86_64; Swift 6.1 in swift:6.1-noble container; production download sources with Swift Crypto compatibility",
  "command": "pullbench pull --dir /model",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "binarySHA256": "ea191cceb5d699a2cab6fba403359b122c5c9bb1fb3b52f9d8c2c598a5ec9830",
  "sourceSHA256": {
    "Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/DownloadHTTP.swift": "b13c0aa411658cac2327dce94ece7909cd80a0d847b2e862d3b34bd1f68c1844",
    "Sources/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Sources/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/WeightStore.swift": "39e24b2f71291746a860675d1be21670723369a1bd54aeb13dadb3ad9980e98a",
    "Sources/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
    "CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b"
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
  "clientSummary": [
    "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically",
    "download connection trial: 16 active",
    "download connection trial: 8 active",
    "CDN responses: HIT=1, MISS=4154",
    "download verified: 88.29 GB received, 0 raw fallback chunks, 840.6 s",
    "VERIFY PASS: all 25 files match the pinned revision by sha256 (105.3 GB)"
  ],
  "clientLogSHA256": "c712825a129cc814d3908225cf50cd128011f4a28a128b91aef94bede461ec86",
  "timingQualification": "Diagnostic public route result; shared service and single run, not a paired hosting benchmark; RSS not sampled for this Linux run"
}
```

## public-cache-probe.json

```json
{
  "pass_": true,
  "base": "https://weights.sevra.page/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "objects": [
    {
      "sha256": "f8d056d40477c485e58be568de748f76f334f548e5ef3f4ea177c32b3f999fe3",
      "bytes": 2230,
      "read": 1,
      "headers": {
        "cache-control": "public, max-age=31536000, immutable",
        "content-type": "application/octet-stream",
        "content-length": "2230",
        "cf-cache-status": "HIT",
        "age": "1846",
        "cf-ray": "a36a9ce4cb3e386f-MIA",
        "etag": "\"b89b215c644922df473da1c8f0d0c113\""
      }
    },
    {
      "sha256": "f8d056d40477c485e58be568de748f76f334f548e5ef3f4ea177c32b3f999fe3",
      "bytes": 2230,
      "read": 2,
      "headers": {
        "cache-control": "public, max-age=31536000, immutable",
        "content-type": "application/octet-stream",
        "content-length": "2230",
        "cf-cache-status": "HIT",
        "age": "1847",
        "cf-ray": "a36a9cf03b43d327-MIA",
        "etag": "\"b89b215c644922df473da1c8f0d0c113\""
      }
    },
    {
      "sha256": "359c1461a8ba63ea6deccf025f6995836b4708fadf2be2ef7022fada040f371b",
      "bytes": 34577548,
      "read": 1,
      "headers": {
        "cache-control": "public, max-age=31536000, immutable",
        "content-type": "application/octet-stream",
        "content-length": "34577548",
        "cf-cache-status": "HIT",
        "age": "1048",
        "cf-ray": "a36a9cf51e1c67db-MIA",
        "etag": "\"fc12a7756e2de074e6a67f28a70d40af\""
      }
    },
    {
      "sha256": "359c1461a8ba63ea6deccf025f6995836b4708fadf2be2ef7022fada040f371b",
      "bytes": 34577548,
      "read": 2,
      "headers": {
        "cache-control": "public, max-age=31536000, immutable",
        "content-type": "application/octet-stream",
        "content-length": "34577548",
        "cf-cache-status": "HIT",
        "age": "1055",
        "cf-ray": "a36a9d1dabc46b0f-MIA",
        "etag": "\"fc12a7756e2de074e6a67f28a70d40af\""
      }
    },
    {
      "sha256": "c2619c3ebf01f6f8a5895c7767e3b96027b6bcd06a4633b7700b1c020315e437",
      "bytes": 34567664,
      "read": 1,
      "headers": {
        "cache-control": "public, max-age=31536000, immutable",
        "content-type": "application/octet-stream",
        "content-length": "34567664",
        "cf-cache-status": "HIT",
        "age": "7304",
        "cf-ray": "a36a9d395b591bc6-MIA",
        "etag": "\"d0cef0faabaa8317daae7b5da8fbd09a\""
      }
    },
    {
      "sha256": "c2619c3ebf01f6f8a5895c7767e3b96027b6bcd06a4633b7700b1c020315e437",
      "bytes": 34567664,
      "read": 2,
      "headers": {
        "cache-control": "public, max-age=31536000, immutable",
        "content-type": "application/octet-stream",
        "content-length": "34567664",
        "cf-cache-status": "HIT",
        "age": "7308",
        "cf-ray": "a36a9d525846eed9-MIA",
        "etag": "\"d0cef0faabaa8317daae7b5da8fbd09a\""
      }
    }
  ]
}
```

## delivery-probes.json

```json
{
  "binarySHA256": "07388ffb4f41e4112ffb15e60362d869ccaf7d4794e5c77676f297439fe13290",
  "rows": [
    {
      "bytes": 550378809,
      "cache": {
        "HIT": 16
      },
      "connections": 8,
      "errors": [],
      "MBps": 29.00509466839452,
      "mode": "compressed",
      "seconds": 18.975246083224192
    },
    {
      "bytes": 534219648,
      "cache": {},
      "connections": 8,
      "errors": [],
      "MBps": 24.304526472392144,
      "mode": "raw",
      "seconds": 21.98025329178199
    },
    {
      "bytes": 534219648,
      "cache": {},
      "connections": 8,
      "errors": [],
      "MBps": 25.01383013866099,
      "mode": "raw",
      "seconds": 21.356971125118434
    },
    {
      "bytes": 550378809,
      "cache": {
        "HIT": 16
      },
      "connections": 8,
      "errors": [],
      "MBps": 25.876848781819607,
      "mode": "compressed",
      "seconds": 21.269158916547894
    },
    {
      "bytes": 1099400747,
      "cache": {
        "HIT": 32
      },
      "connections": 16,
      "errors": [],
      "MBps": 20.54409287224065,
      "mode": "compressed",
      "seconds": 53.51420254167169
    },
    {
      "bytes": 2198805109,
      "cache": {
        "HIT": 64
      },
      "connections": 32,
      "errors": [],
      "MBps": 22.330461794811217,
      "mode": "compressed",
      "seconds": 98.46662058332004
    }
  ]
}
```

## cli-checks.json

```json
{
  "pass_": true,
  "checks": [
    {
      "name": "default",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.22,
      "requests": 8,
      "output": "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "raw-sources-override",
      "pass_": true,
      "transport": "raw",
      "exitCode": 130,
      "cancelSeconds": 0.081,
      "requests": 8,
      "output": "reference estimate: ~18 min at 100 MB/s; actual progress is measured\npulling pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b: 105.3 GB to go over 8 connections (resumable \u2014 rerun to continue)\nsource: <loopback-fixture>/raw\n  8 connections in use\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "explicit-compressed",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.213,
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

The native delivery probe uses the production persistent-session HTTP helper. CDN payloads match object hashes; raw requests validate pinned byte positions and lengths. The ABBA order compares eight workers on the same home route. The separate sixteen- and thirty-two-worker probes transfer larger aggregate samples, so their rates are bounded diagnostics, not a controlled concurrency effect estimate. Public cache probes include small, large, and quantized objects and preserve headers. Ephemeral loopback coordinates in CLI fixture output above are replaced with a label.

## Completed publication receipt (public fields)

```json
{
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "prefix": "slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "uploadedEntries": 4156,
  "uploadedBytes": 88295438048,
  "receiptSHA256": "dc22546a517e44bf43389d4798a04a61b3bab43b6905284b3cc80473fd097273",
  "credentialsAndAccountFieldsOmitted": true
}
```
