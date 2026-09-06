---
type: run
id: 01m1td10gb92r4khss45ty1mps
created: 2026-09-06T03:43:36.970718+00:00
updated: 2026-09-06T03:43:47.785247+00:00
summary: Complete identical Mac/Linux package; codec sanitizers, malformed inputs, manifests, compressed HTTP and raw multi-chunk checks pass.
binary: source and executable SHA-256 identities in the captured receipts
captured_at: 2026-09-05
command: Tools/slotpack/pack.py; Tools/slotpack/checks.py; independent package receipt inspection
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete lossless package and transport regressions
tool: native Swift/C and Python qualification tools
---
# Complete package and transport regression evidence

Byte counts and hashes are deterministic correctness evidence. Runtime durations are diagnostic only; the shared Mac had other work. The public full CLI qualification and release are separate gates.

## Mac package

```json
{
  "objects": 4155,
  "rawBytes": 105264463248,
  "compressedBytes": 88295438048,
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "roundtripVerified": true,
  "allOriginalHashesVerified": true,
  "completeCoverage": true,
  "secondsDiagnostic": 662.9920654590242
}
```

## Independent Linux package

```json
{
  "objects": 4155,
  "rawBytes": 105264463248,
  "compressedBytes": 88295438048,
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "roundtripVerified": true,
  "allOriginalHashesVerified": true,
  "completeCoverage": true,
  "secondsDiagnostic": 345.7207884872332
}
```

## codec-checks-final.json

```json
{
  "bf16_predictions": 16711680,
  "centers": 1000000,
  "roundtrips": 60,
  "malformed_inputs": 39583,
  "pass": true
}
```

## manifest-checks.json

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
    "disk space checked before creating large parts"
  ],
  "pass": true
}
```

## download-checks.json

```json
{
  "pass_": true,
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
  },
  "checks": [
    {
      "name": "normal",
      "pass_": true,
      "seconds": 0.258,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "redirect",
      "pass_": true,
      "seconds": 0.03,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fallback",
      "pass_": true,
      "seconds": 0.031,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "missing-object-raw-fallback",
      "pass_": true,
      "seconds": 0.034,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 18 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
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
      "seconds": 0.014,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadHTTPError(status: 200, retryAfter: nil)\n"
    },
    {
      "name": "optional-absent",
      "pass_": true,
      "seconds": 0.029,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified config.json\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "optional-corrupt-and-unavailable",
      "pass_": true,
      "seconds": 0.033,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
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
      "seconds": 0.029,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "transient-retry",
      "pass_": true,
      "seconds": 5.347,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified biases.bin\nverified scales.bin\nverified weights.safetensors\nverified mtp.safetensors\nverified config.json\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 5.3 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "wrong-length-fallback",
      "pass_": true,
      "seconds": 11.273,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified mtp.safetensors\n100.0% verified \u00b7 2.2 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\nverified config.json\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 11.3 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "short-body-fallback",
      "pass_": true,
      "seconds": 36.142,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 1.1 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 1.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\n94.1% verified \u00b7 0.9 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 36.1 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "content-encoding-fallback",
      "pass_": true,
      "seconds": 36.106,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\n94.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified mtp.safetensors\n100.0% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\nverified config.json\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 36.1 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cancel-preserves-progress",
      "pass_": true,
      "seconds": 1.058,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "damaged-resumed-chunk-rejected",
      "pass_": true,
      "seconds": 0.029,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified scales.bin\n",
      "stderr": "PullIntegrityError(file: \"weights.safetensors\")\n"
    },
    {
      "name": "damaged-resumed-chunk-repair",
      "pass_": true,
      "seconds": 0.028,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "resume",
      "pass_": true,
      "seconds": 0.027,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "already-installed",
      "pass_": true,
      "seconds": 0.015,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "valid-symlinks-reused",
      "pass_": true,
      "seconds": 0.015,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "corruption-seed",
      "pass_": true,
      "seconds": 0.033,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "same-size-final-repair",
      "pass_": true,
      "seconds": 0.02,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\n1 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "invalid-resume-map",
      "pass_": true,
      "seconds": 0.028,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "forged-complete-map-without-parts",
      "pass_": true,
      "seconds": 0.028,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "oversized-map-is-discarded",
      "pass_": true,
      "seconds": 0.028,
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
      "seconds": 0.006,
      "returncode": 1,
      "stdout": "",
      "stderr": "another download is already writing this directory\n"
    }
  ],
  "requests": 634
}
```

## raw-checks.json

```json
{
  "pass_": true,
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
    "binarySHA256": "c293c6cbbbaa583e68049b58f118f1fd72fb66c01776ccd7196f0429eecbc134"
  },
  "checks": [
    {
      "name": "raw-multichunk",
      "pass_": true,
      "seconds": 0.607,
      "returncode": 0,
      "stdout": "verified config.json\n  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-installed-no-http",
      "pass_": true,
      "seconds": 0.266,
      "returncode": 0,
      "stdout": "HARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-missing",
      "pass_": true,
      "seconds": 0.346,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-wrong-range",
      "pass_": true,
      "seconds": 0.351,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-encoding",
      "pass_": true,
      "seconds": 40.833,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\n0.2/0.4 GB verified chunks | 8.4 MB/s received | ETA 20 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 7.8 MB/s received | ETA 22 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.7 MB/s received | ETA 25 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.3 MB/s received | ETA 27 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.6 MB/s received | ETA 30 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.3 MB/s received | ETA 32 s | 2 file(s) left\nmtp.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-ignore-range",
      "pass_": true,
      "seconds": 0.364,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.026,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "weights.safetensors: download failed from all 1 source(s) (invalid Content-Range) \u2014 rerun `slotstream pull` to resume\n"
    },
    {
      "name": "raw-corrupt-final-rejected",
      "pass_": true,
      "seconds": 0.174,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "PullIntegrityError(file: \"config.json\")\n"
    },
    {
      "name": "raw-optional-inflight-writers",
      "pass_": true,
      "seconds": 0.227,
      "returncode": 0,
      "stdout": "verified config.json\nskip mtp.safetensors: unavailable from every source; optional\n  4 connections in use\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-cancel",
      "pass_": true,
      "seconds": 0.924,
      "returncode": 1,
      "stdout": "verified config.json\n  4 connections in use\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "raw-resume",
      "pass_": true,
      "seconds": 0.347,
      "returncode": 0,
      "stdout": "  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-same-size-repair",
      "pass_": true,
      "seconds": 0.499,
      "returncode": 0,
      "stdout": "  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    }
  ]
}
```

## Linux libFuzzer with AddressSanitizer and UndefinedBehaviorSanitizer

Toolchain: clang in the existing Swift 6.1 Linux build container. The complete local log has SHA-256 `df8873ca12aadd2b7f22865700b7decc94f0bb9d98529f418eca8cbf14801d34`. Final raw lines:

```text
#233401	DONE   cov: 263 ft: 809 corp: 114/598Kb lim: 66540 exec/s: 1928 rss: 75Mb
Done 233401 runs in 121 second(s)
```
