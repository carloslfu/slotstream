---
type: run
id: 01m1td10h96h51fm8z6c082dm8
created: 2026-09-06T03:43:37.001613+00:00
updated: 2026-09-06T03:43:47.945257+00:00
summary: A guarded counterexample catches retained completed buffers; the fixed sustained transfer and full original-file reconstruction pass.
binary: source and executable SHA-256 identities in the captured receipts
captured_at: 2026-09-05
command: Tools/slotpack/memory_checks.py; guarded Tools/slotpack/full_pull.py; relevant local kernel termination line
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sustained compressed-download memory failure and repair
tool: native Swift/C and Python qualification tools
---
# Sustained-download memory counterexample and repair

The initial compressed CLI candidate was terminated by macOS during a full loopback reconstruction. This was a new-path implementation defect, not a finding about the previously released raw downloader. The relevant unmodified kernel line was:

```text
2026-09-05 22:27:28.221 Df kernel[0:2398a46] memorystatus: killing largest compressed process slotstream [21071] 61145 MB
```

Pooling only fetch/decode internals was insufficient. Autoreleased NSBlockOperation objects created on each long-lived download worker retained completed operation closures and their payloads. A pool around the entire worker iteration, including operation creation, releases them after ownership passes to the queue.

The regression test moves the same sustained workload with a safety guard, so reproducing the defect does not reproduce the system-pressure event. Its pre-fix executable is stopped at the bound; the fixed executable completes.

## memory-counterexample.json

```json
{
  "pass_": false,
  "bytes": 6442450944,
  "objects": 768,
  "peakRSSBytes": 2207744000,
  "samples": [
    {
      "seconds": 0.002,
      "rssBytes": 2555904
    },
    {
      "seconds": 0.215,
      "rssBytes": 861339648
    },
    {
      "seconds": 0.423,
      "rssBytes": 1465073664
    },
    {
      "seconds": 0.637,
      "rssBytes": 2207744000
    }
  ],
  "guard": [
    "memory or time bound exceeded"
  ],
  "returncode": -15,
  "output": "compressed pull: 6.44 GB remaining, 4 connections; verified chunks resume automatically\n",
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "39e24b2f71291746a860675d1be21670723369a1bd54aeb13dadb3ad9980e98a",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "b13c0aa411658cac2327dce94ece7909cd80a0d847b2e862d3b34bd1f68c1844",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "e469058e22d19a173487045c178c3feea4f94f29a06b121f34bda9fbd3546a4b",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "9e64194e11946b2ac5e16b3650ef73ae31f2cf8be1a99c0a66900eff855e8ff9"
    },
    "binarySHA256": "e0f26bda36d076b2a27b446a05a3bfa02edd63e868c162df3b8f356896b78137"
  }
}
```

## memory-checks.json

```json
{
  "pass_": true,
  "bytes": 6442450944,
  "objects": 768,
  "peakRSSBytes": 352403456,
  "samples": [
    {
      "seconds": 0.004,
      "rssBytes": 32768
    },
    {
      "seconds": 0.209,
      "rssBytes": 32768
    },
    {
      "seconds": 0.413,
      "rssBytes": 32768
    },
    {
      "seconds": 0.62,
      "rssBytes": 32768
    },
    {
      "seconds": 0.826,
      "rssBytes": 285474816
    },
    {
      "seconds": 1.039,
      "rssBytes": 328826880
    },
    {
      "seconds": 1.253,
      "rssBytes": 328925184
    },
    {
      "seconds": 1.46,
      "rssBytes": 329203712
    },
    {
      "seconds": 1.673,
      "rssBytes": 329596928
    },
    {
      "seconds": 1.88,
      "rssBytes": 330383360
    },
    {
      "seconds": 2.093,
      "rssBytes": 334741504
    },
    {
      "seconds": 2.299,
      "rssBytes": 334823424
    },
    {
      "seconds": 2.504,
      "rssBytes": 334839808
    },
    {
      "seconds": 2.711,
      "rssBytes": 336822272
    },
    {
      "seconds": 2.923,
      "rssBytes": 340934656
    },
    {
      "seconds": 3.134,
      "rssBytes": 341819392
    },
    {
      "seconds": 3.366,
      "rssBytes": 346210304
    },
    {
      "seconds": 3.574,
      "rssBytes": 350273536
    },
    {
      "seconds": 3.779,
      "rssBytes": 350781440
    },
    {
      "seconds": 3.994,
      "rssBytes": 350781440
    },
    {
      "seconds": 4.205,
      "rssBytes": 351780864
    },
    {
      "seconds": 4.414,
      "rssBytes": 351797248
    },
    {
      "seconds": 4.627,
      "rssBytes": 352043008
    },
    {
      "seconds": 4.838,
      "rssBytes": 352403456
    },
    {
      "seconds": 5.046,
      "rssBytes": 352403456
    },
    {
      "seconds": 5.252,
      "rssBytes": 352403456
    },
    {
      "seconds": 5.457,
      "rssBytes": 352403456
    },
    {
      "seconds": 5.665,
      "rssBytes": 352403456
    },
    {
      "seconds": 5.871,
      "rssBytes": 352403456
    },
    {
      "seconds": 6.076,
      "rssBytes": 352403456
    },
    {
      "seconds": 6.282,
      "rssBytes": 352403456
    },
    {
      "seconds": 6.487,
      "rssBytes": 352403456
    },
    {
      "seconds": 6.692,
      "rssBytes": 352403456
    },
    {
      "seconds": 6.898,
      "rssBytes": 352403456
    },
    {
      "seconds": 7.105,
      "rssBytes": 352403456
    },
    {
      "seconds": 7.311,
      "rssBytes": 352403456
    },
    {
      "seconds": 7.521,
      "rssBytes": 352403456
    },
    {
      "seconds": 7.728,
      "rssBytes": 352403456
    },
    {
      "seconds": 7.942,
      "rssBytes": 352403456
    },
    {
      "seconds": 8.148,
      "rssBytes": 352403456
    },
    {
      "seconds": 8.355,
      "rssBytes": 352403456
    },
    {
      "seconds": 8.562,
      "rssBytes": 352403456
    },
    {
      "seconds": 8.77,
      "rssBytes": 352403456
    },
    {
      "seconds": 8.981,
      "rssBytes": 352403456
    },
    {
      "seconds": 9.186,
      "rssBytes": 352174080
    },
    {
      "seconds": 9.393,
      "rssBytes": 351928320
    },
    {
      "seconds": 9.6,
      "rssBytes": 351928320
    },
    {
      "seconds": 9.81,
      "rssBytes": 351928320
    },
    {
      "seconds": 10.017,
      "rssBytes": 351698944
    },
    {
      "seconds": 10.222,
      "rssBytes": 351698944
    },
    {
      "seconds": 10.426,
      "rssBytes": 351698944
    },
    {
      "seconds": 10.638,
      "rssBytes": 351698944
    },
    {
      "seconds": 10.846,
      "rssBytes": 351698944
    },
    {
      "seconds": 11.053,
      "rssBytes": 351698944
    },
    {
      "seconds": 11.26,
      "rssBytes": 351698944
    },
    {
      "seconds": 11.464,
      "rssBytes": 351698944
    },
    {
      "seconds": 11.669,
      "rssBytes": 351698944
    },
    {
      "seconds": 11.876,
      "rssBytes": 351698944
    },
    {
      "seconds": 12.083,
      "rssBytes": 351698944
    }
  ],
  "guard": [],
  "returncode": 0,
  "output": "compressed pull: 6.44 GB remaining, 4 connections; verified chunks resume automatically\n45.7% verified \u00b7 1475.4 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\n100.0% verified \u00b7 1738.7 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA 0 s \u00b7 0/1 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA 0 s \u00b7 0/1 files verified\nverified sustained.bin\n4 TCP connections observed across the active workers\ndownload verified: 6.44 GB received, 0 raw fallback chunks, 8.5 s\nHARNESS PASS\n",
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "39e24b2f71291746a860675d1be21670723369a1bd54aeb13dadb3ad9980e98a",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "b13c0aa411658cac2327dce94ece7909cd80a0d847b2e862d3b34bd1f68c1844",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "9e64194e11946b2ac5e16b3650ef73ae31f2cf8be1a99c0a66900eff855e8ff9"
    },
    "binarySHA256": "0c33d1b1f999c54560e4325535fd3019d2cd2849ec5439d666560e9008147253"
  }
}
```

## full-cli-local-memory-v2.json

```json
{
  "pass_": true,
  "peakRSSBytes": 2536407040,
  "memory": [
    {
      "seconds": 1.02,
      "rssBytes": 40009728
    },
    {
      "seconds": 2.02,
      "rssBytes": 40009728
    },
    {
      "seconds": 3.04,
      "rssBytes": 40009728
    },
    {
      "seconds": 4.05,
      "rssBytes": 40009728
    },
    {
      "seconds": 5.07,
      "rssBytes": 40009728
    },
    {
      "seconds": 6.08,
      "rssBytes": 40042496
    },
    {
      "seconds": 7.09,
      "rssBytes": 40042496
    },
    {
      "seconds": 8.1,
      "rssBytes": 40042496
    },
    {
      "seconds": 9.12,
      "rssBytes": 38633472
    },
    {
      "seconds": 10.13,
      "rssBytes": 30801920
    },
    {
      "seconds": 11.14,
      "rssBytes": 32571392
    },
    {
      "seconds": 12.15,
      "rssBytes": 32571392
    },
    {
      "seconds": 13.15,
      "rssBytes": 32571392
    },
    {
      "seconds": 14.16,
      "rssBytes": 32571392
    },
    {
      "seconds": 15.17,
      "rssBytes": 32571392
    },
    {
      "seconds": 16.18,
      "rssBytes": 33472512
    },
    {
      "seconds": 17.19,
      "rssBytes": 32604160
    },
    {
      "seconds": 18.2,
      "rssBytes": 32391168
    },
    {
      "seconds": 19.21,
      "rssBytes": 32391168
    },
    {
      "seconds": 20.22,
      "rssBytes": 32391168
    },
    {
      "seconds": 21.22,
      "rssBytes": 32391168
    },
    {
      "seconds": 22.24,
      "rssBytes": 32899072
    },
    {
      "seconds": 23.25,
      "rssBytes": 32899072
    },
    {
      "seconds": 24.26,
      "rssBytes": 32899072
    },
    {
      "seconds": 25.27,
      "rssBytes": 32899072
    },
    {
      "seconds": 26.27,
      "rssBytes": 32899072
    },
    {
      "seconds": 27.29,
      "rssBytes": 32931840
    },
    {
      "seconds": 28.29,
      "rssBytes": 32931840
    },
    {
      "seconds": 29.3,
      "rssBytes": 32931840
    },
    {
      "seconds": 30.31,
      "rssBytes": 32931840
    },
    {
      "seconds": 31.31,
      "rssBytes": 33177600
    },
    {
      "seconds": 32.32,
      "rssBytes": 33177600
    },
    {
      "seconds": 33.33,
      "rssBytes": 33177600
    },
    {
      "seconds": 34.34,
      "rssBytes": 33177600
    },
    {
      "seconds": 35.35,
      "rssBytes": 33177600
    },
    {
      "seconds": 36.36,
      "rssBytes": 35569664
    },
    {
      "seconds": 37.37,
      "rssBytes": 1126809600
    },
    {
      "seconds": 38.38,
      "rssBytes": 1731805184
    },
    {
      "seconds": 39.38,
      "rssBytes": 2028601344
    },
    {
      "seconds": 40.39,
      "rssBytes": 2063990784
    },
    {
      "seconds": 41.4,
      "rssBytes": 2075197440
    },
    {
      "seconds": 42.41,
      "rssBytes": 2006679552
    },
    {
      "seconds": 43.43,
      "rssBytes": 1913683968
    },
    {
      "seconds": 44.45,
      "rssBytes": 1740390400
    },
    {
      "seconds": 45.46,
      "rssBytes": 1786232832
    },
    {
      "seconds": 46.46,
      "rssBytes": 1846231040
    },
    {
      "seconds": 47.47,
      "rssBytes": 1906999296
    },
    {
      "seconds": 48.48,
      "rssBytes": 2059616256
    },
    {
      "seconds": 49.5,
      "rssBytes": 2075688960
    },
    {
      "seconds": 50.5,
      "rssBytes": 2076311552
    },
    {
      "seconds": 51.51,
      "rssBytes": 2170880000
    },
    {
      "seconds": 52.53,
      "rssBytes": 2171142144
    },
    {
      "seconds": 53.54,
      "rssBytes": 2384625664
    },
    {
      "seconds": 54.55,
      "rssBytes": 2437496832
    },
    {
      "seconds": 55.56,
      "rssBytes": 2536325120
    },
    {
      "seconds": 56.57,
      "rssBytes": 2536407040
    },
    {
      "seconds": 57.58,
      "rssBytes": 2183610368
    },
    {
      "seconds": 58.59,
      "rssBytes": 2061123584
    },
    {
      "seconds": 59.6,
      "rssBytes": 2061123584
    },
    {
      "seconds": 60.61,
      "rssBytes": 2204876800
    },
    {
      "seconds": 61.62,
      "rssBytes": 2290040832
    },
    {
      "seconds": 62.63,
      "rssBytes": 2293776384
    },
    {
      "seconds": 63.65,
      "rssBytes": 2266054656
    },
    {
      "seconds": 64.66,
      "rssBytes": 2268479488
    },
    {
      "seconds": 65.67,
      "rssBytes": 2267348992
    },
    {
      "seconds": 66.68,
      "rssBytes": 2267463680
    },
    {
      "seconds": 67.69,
      "rssBytes": 2267529216
    },
    {
      "seconds": 68.71,
      "rssBytes": 2267529216
    },
    {
      "seconds": 69.72,
      "rssBytes": 2269069312
    },
    {
      "seconds": 70.73,
      "rssBytes": 2282995712
    },
    {
      "seconds": 71.73,
      "rssBytes": 2284077056
    },
    {
      "seconds": 72.74,
      "rssBytes": 2284077056
    },
    {
      "seconds": 73.76,
      "rssBytes": 2284077056
    },
    {
      "seconds": 74.77,
      "rssBytes": 2285125632
    },
    {
      "seconds": 75.79,
      "rssBytes": 2285682688
    },
    {
      "seconds": 76.8,
      "rssBytes": 2285649920
    },
    {
      "seconds": 77.81,
      "rssBytes": 2285649920
    },
    {
      "seconds": 78.82,
      "rssBytes": 2285649920
    },
    {
      "seconds": 79.83,
      "rssBytes": 2191360000
    },
    {
      "seconds": 80.84,
      "rssBytes": 2259156992
    },
    {
      "seconds": 81.86,
      "rssBytes": 2267086848
    },
    {
      "seconds": 82.87,
      "rssBytes": 2267037696
    },
    {
      "seconds": 83.89,
      "rssBytes": 2267037696
    },
    {
      "seconds": 84.89,
      "rssBytes": 2269315072
    },
    {
      "seconds": 85.9,
      "rssBytes": 2269315072
    },
    {
      "seconds": 86.92,
      "rssBytes": 2273460224
    },
    {
      "seconds": 87.92,
      "rssBytes": 2274394112
    },
    {
      "seconds": 88.93,
      "rssBytes": 1896660992
    },
    {
      "seconds": 89.95,
      "rssBytes": 1896562688
    },
    {
      "seconds": 90.95,
      "rssBytes": 1896415232
    },
    {
      "seconds": 91.96,
      "rssBytes": 1895809024
    }
  ],
  "fresh": false,
  "cli": true,
  "defaultSource": false,
  "clientSummary": [
    "8 TCP connections observed across the active workers",
    "download verified: 20.91 GB received, 0 raw fallback chunks, 56.5 s"
  ],
  "kind": "loopback",
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
    "requests": 1035,
    "bytes": 20909116748
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
  "secondsDiagnostic": 92.8642462498974
}
```

The final full loopback receipt is a resumed run, not a fresh network benchmark. Its independent SHA-256 checks cover all original files, including chunks completed before interruption. The fixed sustained test covers more input than its memory guard, and the forthcoming fresh public CLI run independently checks the whole package again.
