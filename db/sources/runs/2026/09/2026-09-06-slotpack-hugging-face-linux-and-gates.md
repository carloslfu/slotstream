---
type: run
id: 01m1vq80aqjdfsbdqbkdnj7nep
created: 2026-09-06T16:01:26.359555+00:00
updated: 2026-09-06T16:02:01.933822+00:00
summary: A complete anonymous default download reconstructs every original file from Hugging Face with zero raw fallbacks; independent hashes and release checks pass.
binary: ea1966b06742958553a20da4822eed2248c887a102db76312af3af0a325143e2
captured_at: 2026-09-06
command: pullbench pull --dir /model; independent GNU sha256sum over all reconstructed files; Tools/static_gates.sh
discarded: 'false'
machines: '[[records/machines/linux-host-helsinki-1gbit]]'
title: Hugging Face complete Linux reconstruction and transport gates
tool: Production Swift/C transport, GNU sha256sum, static_gates.sh
---
# Complete Hugging Face reconstruction and transport gates

An empty Linux destination downloaded the complete embedded-default package anonymously. The production Swift/C transport reconstructed every original file, reported zero raw fallbacks, and passed the client whole-file verification. A separate GNU sha256sum pass checked every reconstructed file independently. The command adapter is a Linux bandwidth instrument, not a supported Linux inference runtime. Its production transport source files match the Mac candidate byte-for-byte.

The native download counter is diagnostic: subsequent explicit verify and independent hashing are outside that counter. Representative public probes shared the route briefly. This is not a paired hosting benchmark or a universal installation-time promise.

The first independent-hash wrapper could not read container-owned mode-600 files from the host account, and the Swift image had no Python interpreter. Those setup attempts did not report any hash mismatch. GNU sha256sum then ran with a read-only model mount, preserving both failed setup logs outside the public source.

## Complete public pull

```json
{
  "pass_": true,
  "fresh": true,
  "defaultSource": true,
  "platform": "Linux x86_64; swift:6.1-noble; exact production Swift/C download sources with Swift Crypto compatibility",
  "command": "pullbench pull --dir /model; independent GNU sha256sum over all reconstructed files",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "binarySHA256": "ea1966b06742958553a20da4822eed2248c887a102db76312af3af0a325143e2",
  "sourceSHA256": {
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "linux-harness/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "linux-harness/Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "linux-harness/Package.resolved": "3a3a544a74f1551e3121d0468a1fc0787a220ad4c08730b20739f17078fb11d2"
  },
  "originalBytes": 105264463248,
  "downloadObjectBytes": 88294086225,
  "clientSummary": [
    "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically",
    "download connection trial: 16 active",
    "download connection trial: 32 active",
    "download connection trial: 16 active",
    "download verified: 88.29 GB received, 0 raw fallback chunks, 799.2 s",
    "VERIFY PASS: all 25 files match the pinned revision by sha256 (105.3 GB)"
  ],
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
  "clientLogSHA256": "0e22a599eb4a6f77759761ec884cbe15aff376f3a2dba4ea39a398c54afa4ed7",
  "timingQualification": "Single diagnostic route result; not a paired hosting benchmark. Container memory constrained; process RSS peak not measured."
}
```

## codec-checks

```json
{
  "bf16_predictions": 16711680,
  "centers": 1000000,
  "roundtrips": 60,
  "malformed_inputs": 39583,
  "pass": true
}
```

## manifest-checks

```json
{
  "checks": [
    "embedded manifest and original pins agree",
    "new installs use an exact public Hugging Face commit",
    "Hugging Face reset survives the old one-minute cap",
    "long Retry-After is respected",
    "the later server retry boundary wins",
    "unbounded waits are capped and remain cancellable",
    "invalid throttle headers wait one resolver window",
    "ordinary transient errors retain exponential backoff",
    "HTTP-date retry boundaries are honored",
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
    "dangling resume bits do not report downloaded bytes",
    "resume progress combines original weight and metadata bytes",
    "finalized files are not counted as partial progress",
    "invalid resume bits do not report downloaded bytes",
    "disk space checked before creating large parts"
  ],
  "pass": true
}
```

## download-checks

```json
{
  "pass_": true,
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901"
    },
    "binarySHA256": "25a2abddbddd07b20973d26092331eba5ed35e14e033275ab0b92766321006da"
  },
  "checks": [
    {
      "name": "normal",
      "pass_": true,
      "seconds": 0.352,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified config.json\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cache-miss-reporting",
      "pass_": true,
      "seconds": 0.03,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nverified config.json\nverified mtp.safetensors\nCDN responses: MISS=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "redirect",
      "pass_": true,
      "seconds": 0.03,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified config.json\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fallback",
      "pass_": true,
      "seconds": 0.033,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified config.json\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "missing-object-raw-fallback",
      "pass_": true,
      "seconds": 0.035,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified mtp.safetensors\nCDN responses: HIT=50\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 18 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.015,
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
      "seconds": 0.028,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "optional-corrupt-and-unavailable",
      "pass_": true,
      "seconds": 0.029,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified biases.bin\nverified scales.bin\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fails",
      "pass_": true,
      "seconds": 0.014,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "compressed object digest mismatch\n"
    },
    {
      "name": "retry-after",
      "pass_": true,
      "seconds": 0.031,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "hugging-face-rate-limit",
      "pass_": true,
      "seconds": 5.378,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 5.4 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cancel-during-hugging-face-rate-limit",
      "pass_": true,
      "seconds": 0.34,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "transient-retry",
      "pass_": true,
      "seconds": 5.61,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.1 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified weights.safetensors\nverified biases.bin\nverified scales.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 5.6 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "wrong-length-fallback",
      "pass_": true,
      "seconds": 11.275,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified mtp.safetensors\n100.0% verified \u00b7 2.2 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\nverified config.json\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 11.3 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "short-body-fallback",
      "pass_": true,
      "seconds": 36.102,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 1.1 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 1.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.1 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\n94.1% verified \u00b7 0.9 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 36.1 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "content-encoding-fallback",
      "pass_": true,
      "seconds": 36.51,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n64.7% verified \u00b7 0.4 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\n94.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 36.5 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cancel-preserves-progress",
      "pass_": true,
      "seconds": 1.476,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "damaged-resumed-chunk-rejected",
      "pass_": true,
      "seconds": 0.041,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified biases.bin\nverified mtp.safetensors\n",
      "stderr": "PullIntegrityError(file: \"weights.safetensors\")\n"
    },
    {
      "name": "damaged-resumed-chunk-repair",
      "pass_": true,
      "seconds": 0.03,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nCDN responses: HIT=16\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "resume",
      "pass_": true,
      "seconds": 0.029,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified mtp.safetensors\nCDN responses: HIT=17\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
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
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "same-size-final-repair",
      "pass_": true,
      "seconds": 0.018,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nCDN responses: HIT=1\n1 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "invalid-resume-map",
      "pass_": true,
      "seconds": 0.027,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified config.json\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "forged-complete-map-without-parts",
      "pass_": true,
      "seconds": 0.027,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "oversized-map-is-discarded",
      "pass_": true,
      "seconds": 0.027,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
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
      "seconds": 0.004,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot size partial file: weights.safetensors\n"
    },
    {
      "name": "part-fifo-rejected",
      "pass_": true,
      "seconds": 0.004,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot create partial file: weights.safetensors\n"
    },
    {
      "name": "concurrent-writer-rejected",
      "pass_": true,
      "seconds": 0.007,
      "returncode": 1,
      "stdout": "",
      "stderr": "another download is already writing this directory\n"
    }
  ],
  "requests": 688
}
```

## raw-checks

```json
{
  "pass_": true,
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901"
    },
    "binarySHA256": "bf25951374a6221dd18426cf9fc1dd1dc09c347de3087b9af69b84558b89f402"
  },
  "checks": [
    {
      "name": "raw-multichunk",
      "pass_": true,
      "seconds": 1.606,
      "returncode": 0,
      "stdout": "verified config.json\n  4 connections in use\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-installed-no-http",
      "pass_": true,
      "seconds": 0.253,
      "returncode": 0,
      "stdout": "HARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-missing",
      "pass_": true,
      "seconds": 0.361,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-wrong-range",
      "pass_": true,
      "seconds": 0.335,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-encoding",
      "pass_": true,
      "seconds": 40.789,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\n0.2/0.4 GB verified chunks | 8.4 MB/s received | ETA 20 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 7.2 MB/s received | ETA 23 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.7 MB/s received | ETA 25 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.0 MB/s received | ETA 28 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.6 MB/s received | ETA 30 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.3 MB/s received | ETA 32 s | 2 file(s) left\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-ignore-range",
      "pass_": true,
      "seconds": 0.347,
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
      "seconds": 0.172,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "PullIntegrityError(file: \"config.json\")\n"
    },
    {
      "name": "raw-optional-inflight-writers",
      "pass_": true,
      "seconds": 0.215,
      "returncode": 0,
      "stdout": "verified config.json\nskip mtp.safetensors: unavailable from every source; optional\n  4 connections in use\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-cancel",
      "pass_": true,
      "seconds": 3.314,
      "returncode": 1,
      "stdout": "0.1/0.4 GB verified chunks | 33.5 MB/s received | ETA measuring | 3 file(s) left\n  4 connections in use\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "raw-resume",
      "pass_": true,
      "seconds": 0.343,
      "returncode": 0,
      "stdout": "verified config.json\n  4 connections in use\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-same-size-repair",
      "pass_": true,
      "seconds": 0.458,
      "returncode": 0,
      "stdout": "  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    }
  ]
}
```

## memory-checks

```json
{
  "pass_": true,
  "bytes": 6442450944,
  "objects": 768,
  "peakRSSBytes": 346095616,
  "samples": [
    {
      "seconds": 0.003,
      "rssBytes": 32768
    },
    {
      "seconds": 0.219,
      "rssBytes": 32768
    },
    {
      "seconds": 0.432,
      "rssBytes": 165855232
    },
    {
      "seconds": 0.644,
      "rssBytes": 272711680
    },
    {
      "seconds": 0.852,
      "rssBytes": 295124992
    },
    {
      "seconds": 1.066,
      "rssBytes": 303398912
    },
    {
      "seconds": 1.28,
      "rssBytes": 321273856
    },
    {
      "seconds": 1.491,
      "rssBytes": 323207168
    },
    {
      "seconds": 1.697,
      "rssBytes": 326631424
    },
    {
      "seconds": 1.904,
      "rssBytes": 327106560
    },
    {
      "seconds": 2.111,
      "rssBytes": 345522176
    },
    {
      "seconds": 2.325,
      "rssBytes": 345571328
    },
    {
      "seconds": 2.539,
      "rssBytes": 346095616
    },
    {
      "seconds": 2.743,
      "rssBytes": 346095616
    },
    {
      "seconds": 2.947,
      "rssBytes": 346095616
    },
    {
      "seconds": 3.153,
      "rssBytes": 346095616
    },
    {
      "seconds": 3.366,
      "rssBytes": 346095616
    },
    {
      "seconds": 3.579,
      "rssBytes": 346095616
    },
    {
      "seconds": 3.793,
      "rssBytes": 346095616
    },
    {
      "seconds": 3.998,
      "rssBytes": 346095616
    },
    {
      "seconds": 4.207,
      "rssBytes": 346095616
    },
    {
      "seconds": 4.419,
      "rssBytes": 346095616
    },
    {
      "seconds": 4.628,
      "rssBytes": 346095616
    },
    {
      "seconds": 4.833,
      "rssBytes": 346095616
    },
    {
      "seconds": 5.037,
      "rssBytes": 346095616
    },
    {
      "seconds": 5.242,
      "rssBytes": 346095616
    },
    {
      "seconds": 5.446,
      "rssBytes": 346095616
    },
    {
      "seconds": 5.653,
      "rssBytes": 346095616
    },
    {
      "seconds": 5.867,
      "rssBytes": 346095616
    },
    {
      "seconds": 6.071,
      "rssBytes": 346095616
    },
    {
      "seconds": 6.285,
      "rssBytes": 346095616
    },
    {
      "seconds": 6.491,
      "rssBytes": 346095616
    },
    {
      "seconds": 6.703,
      "rssBytes": 346095616
    },
    {
      "seconds": 6.915,
      "rssBytes": 345948160
    }
  ],
  "guard": [],
  "returncode": 0,
  "output": "compressed pull: 6.44 GB remaining, 4 connections; verified chunks resume automatically\n99.0% verified \u00b7 3194.8 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\n100.0% verified \u00b7 20.7 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\nverified sustained.bin\n4 TCP connections observed across the active workers\ndownload verified: 6.44 GB received, 0 raw fallback chunks, 4.5 s\nHARNESS PASS\n",
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901"
    },
    "binarySHA256": "49ec9370ae3307298cb13f9e58ffb72f0828cb60be50f9ab8ee3afc576c26b69"
  }
}
```

## Release checks

The final Mac candidate build succeeds. Tools/static_gates.sh exits successfully, including seven publisher-integrity unit cases, runtime and pull checks, the complete compressed/raw transport gates, planner checks, installer checks, brain validation, generated documents and public claim needles. The earlier instrumented T0 plus real transport fixtures preserve the changed files above their existing coverage floors; public CI will exercise the complete catalogue. The fresh Mac download is still in progress at this capture.
