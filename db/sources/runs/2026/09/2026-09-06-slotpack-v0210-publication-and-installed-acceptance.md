---
type: run
id: 01m1tpn3ffbmmn6mtzprnwqgfe
created: 2026-09-06T06:31:52.559044+00:00
updated: 2026-09-06T06:34:04.203085+00:00
summary: v0.2.10 release and main CI pass; exact public provenance, ordinary installer, download controls, all original hashes and loaded-model response verify.
binary: a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2
captured_at: 2026-09-06
command: 'gh attestation verify --source-digest ed766babda275a9f05cd7a7aef8ebcea4c875b66 --source-ref refs/tags/v0.2.10; public install.sh; cli_checks.py; full_pull.py --default-source; installed slotstream run --memory-gb 10 --mtp off --vision off --prompt "Reply with exactly: READY" --max-tokens 16 --greedy'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Lossless CDN v0.2.10 publication and installed acceptance
tool: GitHub Actions, gh attestation, public installer, actual native CLI and independent Python hashes
---
# Published and installed lossless CDN download default

Release v0.2.10 is published from the exact source revision below. The release workflow passes, including the corrected state-based interruption fixtures. Main CI passes on the later test-only coverage correction, whose production sources, package definition, dependency pins and installer are identical to the release. The first v0.2.10 main-CI coverage failure and its correction are preserved separately; no coverage floor was lowered. The public archive checksum and GitHub-signed provenance are verified against the repository, release workflow, exact source revision and tag, with a GitHub-hosted runner required.

The ordinary installer was retrieved from public main, checked against the candidate script, and run with its normal latest-release URL and normal home installation destination. It ran in a detached session to leave inference as a separately bounded test. The previous installation remains available for rollback. Both installed files match the public archive exactly.

The actual installed CLI passes default/source/transport selection and SIGINT tests. It revalidates and reuses the entire previously downloaded model with zero transfer; an independent Python SHA-256 pass verifies every original file again. This installed-build check complements the complete fresh public Linux download and fresh-to-interrupted-to-resumed Mac download already preserved in the earlier sources. It is not another fresh network-speed measurement.

The installed CI binary then loads the reconstructed model with a 10 GB target, MTP and vision off, and returns READY to a bounded greedy prompt. The test waited for another task to release the shared model-process lock; it did not bypass the lock or stop another task. This proves a loaded-model response, not an inference performance comparison or unbounded acceptance claim.

## Release identity and installed files

```json
{
  "pass_": true,
  "version": "0.2.10",
  "releaseURL": "https://github.com/carloslfu/slotstream/releases/tag/v0.2.10",
  "sourceCommit": "ed766babda275a9f05cd7a7aef8ebcea4c875b66",
  "archiveSHA256": "d914dbbe362342b32fa23edf6c2192eccf27f8698ad1a7ba7881c0bc6a6d4c74",
  "binarySHA256": "a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2",
  "metallibSHA256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "installerSHA256": "8fc9b91156e1f92d6ef1efcda72ae339fcdf3987a9f7c2021a2c6d02ac19d8f1",
  "installedDirectory": "/Users/carlos/.slotstream/releases/d914dbbe362342b32fa23edf6c2192eccf27f8698ad1a7ba7881c0bc6a6d4c74-macos26",
  "previousDirectory": "/Users/carlos/.slotstream/releases/d1266daed642951cbfba22f75c1bcd7b321c5356738c14a0858d15f2ec4da817-macos26",
  "previousPreserved": true,
  "attestationCommand": "Repository, release workflow, exact source digest and tag enforced; GitHub-hosted runner required."
}
```

## Release workflow

```json
{
  "conclusion": "success",
  "headSha": "ed766babda275a9f05cd7a7aef8ebcea4c875b66",
  "jobs": [
    {
      "completedAt": "2026-09-06T05:45:08Z",
      "conclusion": "success",
      "databaseId": 101435314230,
      "name": "build",
      "startedAt": "2026-09-06T05:33:59Z",
      "status": "completed",
      "steps": [
        {
          "completedAt": "2026-09-06T05:34:01Z",
          "conclusion": "success",
          "name": "Set up job",
          "number": 1,
          "startedAt": "2026-09-06T05:33:59Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:34:04Z",
          "conclusion": "success",
          "name": "Run actions/checkout@v7",
          "number": 2,
          "startedAt": "2026-09-06T05:34:01Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:34:06Z",
          "conclusion": "success",
          "name": "toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)",
          "number": 3,
          "startedAt": "2026-09-06T05:34:04Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:34:08Z",
          "conclusion": "success",
          "name": "metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)",
          "number": 4,
          "startedAt": "2026-09-06T05:34:06Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:39:55Z",
          "conclusion": "success",
          "name": "build",
          "number": 5,
          "startedAt": "2026-09-06T05:34:08Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:39:55Z",
          "conclusion": "success",
          "name": "smoke",
          "number": 6,
          "startedAt": "2026-09-06T05:39:55Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:39:56Z",
          "conclusion": "success",
          "name": "pinned dbmd (the brain gates inside static_gates.sh need it)",
          "number": 7,
          "startedAt": "2026-09-06T05:39:55Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:44:39Z",
          "conclusion": "success",
          "name": "static gates \u2014 planner, brain, installer (no weights needed)",
          "number": 8,
          "startedAt": "2026-09-06T05:39:56Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:44:50Z",
          "conclusion": "success",
          "name": "sampler golden + governor policy (no weights needed)",
          "number": 9,
          "startedAt": "2026-09-06T05:44:39Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:44:53Z",
          "conclusion": "success",
          "name": "package",
          "number": 10,
          "startedAt": "2026-09-06T05:44:50Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:45:00Z",
          "conclusion": "success",
          "name": "attest provenance",
          "number": 11,
          "startedAt": "2026-09-06T05:44:53Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:45:05Z",
          "conclusion": "success",
          "name": "publish",
          "number": 12,
          "startedAt": "2026-09-06T05:45:00Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:45:05Z",
          "conclusion": "success",
          "name": "Post Run actions/checkout@v7",
          "number": 24,
          "startedAt": "2026-09-06T05:45:05Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T05:45:06Z",
          "conclusion": "success",
          "name": "Complete job",
          "number": 25,
          "startedAt": "2026-09-06T05:45:05Z",
          "status": "completed"
        }
      ],
      "url": "https://github.com/carloslfu/slotstream/actions/runs/34014297077/job/101435314230"
    }
  ],
  "status": "completed",
  "url": "https://github.com/carloslfu/slotstream/actions/runs/34014297077"
}
```

## Main CI

```json
{
  "conclusion": "success",
  "headSha": "21758f59d38bef69fe383be83f3a144e0c2350a6",
  "jobs": [
    {
      "completedAt": "2026-09-06T06:29:48Z",
      "conclusion": "success",
      "databaseId": 101438981183,
      "name": "weights-free",
      "startedAt": "2026-09-06T06:08:16Z",
      "status": "completed",
      "steps": [
        {
          "completedAt": "2026-09-06T06:08:16Z",
          "conclusion": "success",
          "name": "Set up job",
          "number": 1,
          "startedAt": "2026-09-06T06:08:15Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:08:18Z",
          "conclusion": "success",
          "name": "Run actions/checkout@v7",
          "number": 2,
          "startedAt": "2026-09-06T06:08:16Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:08:18Z",
          "conclusion": "success",
          "name": "toolchain",
          "number": 3,
          "startedAt": "2026-09-06T06:08:18Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:08:20Z",
          "conclusion": "success",
          "name": "pinned Metal library",
          "number": 4,
          "startedAt": "2026-09-06T06:08:18Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:15:05Z",
          "conclusion": "success",
          "name": "release build",
          "number": 5,
          "startedAt": "2026-09-06T06:08:20Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:15:06Z",
          "conclusion": "success",
          "name": "pinned dbmd (the brain gates inside static_gates.sh need it)",
          "number": 6,
          "startedAt": "2026-09-06T06:15:05Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:20:06Z",
          "conclusion": "success",
          "name": "static and runtime safety gates",
          "number": 7,
          "startedAt": "2026-09-06T06:15:06Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:20:16Z",
          "conclusion": "success",
          "name": "sampler and governor goldens",
          "number": 8,
          "startedAt": "2026-09-06T06:20:06Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:20:21Z",
          "conclusion": "success",
          "name": "check catalogue (every check by name)",
          "number": 9,
          "startedAt": "2026-09-06T06:20:16Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:22:51Z",
          "conclusion": "success",
          "name": "the library is importable from outside the package",
          "number": 10,
          "startedAt": "2026-09-06T06:20:21Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:29:41Z",
          "conclusion": "success",
          "name": "coverage may not go down",
          "number": 11,
          "startedAt": "2026-09-06T06:22:51Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:29:43Z",
          "conclusion": "success",
          "name": "coverage report",
          "number": 12,
          "startedAt": "2026-09-06T06:29:41Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:29:44Z",
          "conclusion": "success",
          "name": "Post Run actions/checkout@v7",
          "number": 24,
          "startedAt": "2026-09-06T06:29:43Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-06T06:29:46Z",
          "conclusion": "success",
          "name": "Complete job",
          "number": 25,
          "startedAt": "2026-09-06T06:29:44Z",
          "status": "completed"
        }
      ],
      "url": "https://github.com/carloslfu/slotstream/actions/runs/34015713057/job/101438981183"
    }
  ],
  "status": "completed",
  "url": "https://github.com/carloslfu/slotstream/actions/runs/34015713057"
}
```

## Verified public attestation

```json
[
  {
    "attestation": {
      "bundle": {
        "mediaType": "application/vnd.dev.sigstore.bundle.v0.3+json",
        "verificationMaterial": {
          "certificate": {
            "rawBytes": "MIIHEzCCBpqgAwIBAgIUdFqiVM25z2xIvVnjVw+NDJK1VJcwCgYIKoZIzj0EAwMwNzEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MR4wHAYDVQQDExVzaWdzdG9yZS1pbnRlcm1lZGlhdGUwHhcNMjYwOTA2MDU0NDU0WhcNMjYwOTA2MDU1NDU0WjAAMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEyb9KEdlDt+UMcDTOX1q6IeeR9tTkbl80UYMVrspBW84IHwb2uAf5ZrlY9Eb0yBfr4Q/ZbLkJGZ0JjPnKWh4ZKqOCBbkwggW1MA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUj9CTIkE83uUtnDKlQGGEZ6YFK08wHwYDVR0jBBgwFoAU39Ppz1YkEZb5qNjpKFWixi4YZD8wZQYDVR0RAQH/BFswWYZXaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdS9zbG90c3RyZWFtLy5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1sQHJlZnMvdGFncy92MC4yLjEwMDkGCisGAQQBg78wAQEEK2h0dHBzOi8vdG9rZW4uYWN0aW9ucy5naXRodWJ1c2VyY29udGVudC5jb20wEgYKKwYBBAGDvzABAgQEcHVzaDA2BgorBgEEAYO/MAEDBChlZDc2NmJhYmRhMjc1YTlmMDVjZDdhN2FlZjhlYmNlYTRjODc1YjY2MBUGCisGAQQBg78wAQQEB3JlbGVhc2UwIgYKKwYBBAGDvzABBQQUY2FybG9zbGZ1L3Nsb3RzdHJlYW0wHwYKKwYBBAGDvzABBgQRcmVmcy90YWdzL3YwLjIuMTAwOwYKKwYBBAGDvzABCAQtDCtodHRwczovL3Rva2VuLmFjdGlvbnMuZ2l0aHVidXNlcmNvbnRlbnQuY29tMGcGCisGAQQBg78wAQkEWQxXaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdS9zbG90c3RyZWFtLy5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1sQHJlZnMvdGFncy92MC4yLjEwMDgGCisGAQQBg78wAQoEKgwoZWQ3NjZiYWJkYTI3NWE5ZjA1Y2Q3YTdhZWY4ZWJjZWE0Yzg3NWI2NjAdBgorBgEEAYO/MAELBA8MDWdpdGh1Yi1ob3N0ZWQwNwYKKwYBBAGDvzABDAQpDCdodHRwczovL2dpdGh1Yi5jb20vY2FybG9zbGZ1L3Nsb3RzdHJlYW0wOAYKKwYBBAGDvzABDQQqDChlZDc2NmJhYmRhMjc1YTlmMDVjZDdhN2FlZjhlYmNlYTRjODc1YjY2MCEGCisGAQQBg78wAQ4EEwwRcmVmcy90YWdzL3YwLjIuMTAwGgYKKwYBBAGDvzABDwQMDAoxMzQ5Mjg1MDU4MCwGCisGAQQBg78wARAEHgwcaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdTAXBgorBgEEAYO/MAERBAkMBzU5OTMxNjgwZwYKKwYBBAGDvzABEgRZDFdodHRwczovL2dpdGh1Yi5jb20vY2FybG9zbGZ1L3Nsb3RzdHJlYW0vLmdpdGh1Yi93b3JrZmxvd3MvcmVsZWFzZS55bWxAcmVmcy90YWdzL3YwLjIuMTAwOAYKKwYBBAGDvzABEwQqDChlZDc2NmJhYmRhMjc1YTlmMDVjZDdhN2FlZjhlYmNlYTRjODc1YjY2MBQGCisGAQQBg78wARQEBgwEcHVzaDBbBgorBgEEAYO/MAEVBE0MS2h0dHBzOi8vZ2l0aHViLmNvbS9jYXJsb3NsZnUvc2xvdHN0cmVhbS9hY3Rpb25zL3J1bnMvMzQwMTQyOTcwNzcvYXR0ZW1wdHMvMTAWBgorBgEEAYO/MAEWBAgMBnB1YmxpYzBSBgorBgEEAYO/MAEYBEQMQnJlcG86Y2FybG9zbGZ1QDU5OTMxNjgvc2xvdHN0cmVhbUAxMzQ5Mjg1MDU4OnJlZjpyZWZzL3RhZ3MvdjAuMi4xMDCBiQYKKwYBBAHWeQIEAgR7BHkAdwB1AN09MGrGxxEyYxkeHJlnNwKiSl643jyt/4eKcoAvKe6OAAABoHU/jbwAAAQDAEYwRAIgR4NnYdx2HSJOhYzpMPsQwGsxZJVdn/XW7g8hEqAlDsoCIHaW5MKaaotkhos3dBm4FW/rZqrLyi2S5RWGKBSoos4zMAoGCCqGSM49BAMDA2cAMGQCMCfPzqjWA6+YdrdTSCjDqgy7EWvvAYuwtHVRlK4axMnWcATzPLwXNtc1RmA7be/chAIwI45ShfsUvkmOHbT9ATT8X862MJttKqSBwCVAZDAPqe89RB9r7wh9FSWTRXiHzo4L"
          },
          "tlogEntries": [
            {
              "logIndex": "2734821981",
              "logId": {
                "keyId": "wNI9atQGlz+VWfO6LRygH4QUfY/8W4RFwiT5i5WRgB0="
              },
              "kindVersion": {
                "kind": "dsse",
                "version": "0.0.1"
              },
              "integratedTime": "1788673496",
              "inclusionPromise": {
                "signedEntryTimestamp": "MEUCIQDDeXQrdLY3q/VSjaG8IbQVW3DbfDr+heMKYY7Z6Jp+MAIgA4jvLXGfOBsZrBwNB8E1KbI3POo3OrC8aeMIpLErXj8="
              },
              "inclusionProof": {
                "logIndex": "2612917719",
                "rootHash": "K51EGiLytCSIGM6GZHcgl9OowaPZvvlfK45WZTPvEAY=",
                "treeSize": "2612918395",
                "hashes": [
                  "onlOhk7kh3i/adJLuIsUyc6MBNRL43THaaKdrTlcrRY=",
                  "r8JRE/RYBACHOODrKleI6CnqvicS7psU26E5FaSsMj8=",
                  "+ghh4i6t6LSgdxrkwPlHnc0uDeEn9EAvOplHzUNHa08=",
                  "dhvZxQk8kRf1PwuLRh5JbQ6w4DZs2e/u7VcgG94dCHU=",
                  "JrI5Jm/AWXg+JFHE/Pq2RmGPkysOwiQDmHRFhg/UT5E=",
                  "NEBB3Ux0rUja5bDOrJNy/KpUGh83lkKQFhyDXJPZ1+w=",
                  "AkuRgv3XsfmqvJPKZDEYhxk70DNWwjVsHHBadiTsyyU=",
                  "8etfTN+dSBPqfWOAaflKk7FpJ6LJuPuMvKdqbPNgYxk=",
                  "obCOcnLI+utfmBr6EpYNLKDAcAG1HkarnsOBuBwmNJI=",
                  "itpziSStxhMjc0Mj0fkBLF4HugKzbvMqqCC3X2OG+vE=",
                  "VTTGKMLmwhYMV/RgV54z8ysYUpnjnxfVVz6H8xoRnpA=",
                  "qu+WMG7K2PeSaiqAPOQVI4VEZceWdpF620uG7LuCV+A=",
                  "eLNG4JqZbUbdD19sE+ve42M58iaw6Y8dAhHVCpx1RGw=",
                  "aEGzNztKDTLMDjOg6PV0fzZ5laVuOOqEpuiicOv6zMI=",
                  "Xn1HPJ8HrZR5eObyxOmo+Ni+5ERerG+5zr9cFLu/Ub4=",
                  "g4QhTm+Q2VJBlTF149F1uPoCoqHXfaYANiFAwYuPYMU=",
                  "QGraPp2pPREzlj+eFZXLoNSD550bA69UozNJWfQuMOc=",
                  "LBNNn0p2c7rNsD04YJ9Zf6KVbmNGn6icmmfHdnYyE6M=",
                  "oSAlAENGv2mxGVd/zwWK8OUeGu8u0i19NGUYXBuoaEY=",
                  "/OnzpTBjFZ8UxSFyL0qzj7/eAf8Zyn11FxOFmr9Iijw=",
                  "z7Z6XhxTA5Hbrcs0Dax48NiFS2LviAf23LmnWFu2rjQ=",
                  "XfEdumtvZ3PQlBsGvlbEY8HV7CKk72mppf+8YsFauUs=",
                  "tbFZZyvHNOBP5E6lGdeIptnp3IZ0fyB6OI7M0lMlZq4=",
                  "fnPrvt7afEuTlIhaMcrGUdu9+heAmk4jOJ3+Br8/B8M=",
                  "eXSLrLqKSxRTixSP/k4YimriB2lufao6trqTrsxxlyg=",
                  "SndbMKVtcTenAkwi2JBfGzD+mhexp1qJbRIY+A1JRIU=",
                  "xH/DCseLHr9eKoYT8qsORZK7zVdEGYWHuVtsVrD95wY="
                ],
                "checkpoint": {
                  "envelope": "rekor.sigstore.dev - 1193050959916656506\n2612918395\nK51EGiLytCSIGM6GZHcgl9OowaPZvvlfK45WZTPvEAY=\n\n\u2014 rekor.sigstore.dev wNI9ajBEAiAirikDlFOFnqSvxZOFZFxoRlqJd/C5lEwIcPvtIEEIewIgSAuFuGZfDBwZJ6X7JPDSR4KyLcesSyrJGf4qRnKBqHo=\n"
                }
              },
              "canonicalizedBody": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiZHNzZSIsInNwZWMiOnsiZW52ZWxvcGVIYXNoIjp7ImFsZ29yaXRobSI6InNoYTI1NiIsInZhbHVlIjoiZTgyNjliNmQxNmFhZGNkY2Y0N2M4YTEzNzFiY2UwMjY3MzI1MmRhZGY3ZWI1MjBlYjk4YzRhM2M3MmQyMjgxOSJ9LCJwYXlsb2FkSGFzaCI6eyJhbGdvcml0aG0iOiJzaGEyNTYiLCJ2YWx1ZSI6ImY2MjkwOTc3OGY4NzJhZmJkNzhmMmQ0ZDM5OGU2YzRmOWE5MDY0MTU1NjI5ZmNhMTM3NWY5YmNjYmVmNjQ0ZWYifSwic2lnbmF0dXJlcyI6W3sic2lnbmF0dXJlIjoiTUVZQ0lRRHZQdy9hd2VZSDJ4R0tzdmo2OUZSYTUwWlQ5NUtLMkwxdUh1YVVqYlRqd3dJaEFOYisvYnJKNE11cEZNZDBVU0EzRC81YTBtMjduekFQdjdmcWZWQmFmbGx4IiwidmVyaWZpZXIiOiJMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VoRmVrTkRRbkJ4WjBGM1NVSkJaMGxWWkVaeGFWWk5NalY2TW5oSmRsWnVhbFozSzA1RVNrc3hWa3BqZDBObldVbExiMXBKZW1vd1JVRjNUWGNLVG5wRlZrMUNUVWRCTVZWRlEyaE5UV015Ykc1ak0xSjJZMjFWZFZwSFZqSk5ValIzU0VGWlJGWlJVVVJGZUZaNllWZGtlbVJIT1hsYVV6RndZbTVTYkFwamJURnNXa2RzYUdSSFZYZElhR05PVFdwWmQwOVVRVEpOUkZVd1RrUlZNRmRvWTA1TmFsbDNUMVJCTWsxRVZURk9SRlV3VjJwQlFVMUdhM2RGZDFsSUNrdHZXa2w2YWpCRFFWRlpTVXR2V2tsNmFqQkVRVkZqUkZGblFVVjVZamxMUldSc1JIUXJWVTFqUkZSUFdERnhOa2xsWlZJNWRGUnJZbXc0TUZWWlRWWUtjbk53UWxjNE5FbElkMkl5ZFVGbU5WcHliRms1UldJd2VVSm1jalJSTDFwaVRHdEtSMW93U21wUWJrdFhhRFJhUzNGUFEwSmlhM2RuWjFjeFRVRTBSd3BCTVZWa1JIZEZRaTkzVVVWQmQwbElaMFJCVkVKblRsWklVMVZGUkVSQlMwSm5aM0pDWjBWR1FsRmpSRUY2UVdSQ1owNVdTRkUwUlVablVWVnFPVU5VQ2tsclJUZ3pkVlYwYmtSTGJGRkhSMFZhTmxsR1N6QTRkMGgzV1VSV1VqQnFRa0puZDBadlFWVXpPVkJ3ZWpGWmEwVmFZalZ4VG1wd1MwWlhhWGhwTkZrS1drUTRkMXBSV1VSV1VqQlNRVkZJTDBKR2MzZFhXVnBZWVVoU01HTklUVFpNZVRsdVlWaFNiMlJYU1hWWk1qbDBUREpPYUdOdGVIWmpNbmh0WkZNNWVncGlSemt3WXpOU2VWcFhSblJNZVRWdVlWaFNiMlJYU1haa01qbDVZVEphYzJJelpIcE1NMHBzWWtkV2FHTXlWWFZsVnpGelVVaEtiRnB1VFhaa1IwWnVDbU41T1RKTlF6UjVUR3BGZDAxRWEwZERhWE5IUVZGUlFtYzNPSGRCVVVWRlN6Sm9NR1JJUW5wUGFUaDJaRWM1Y2xwWE5IVlpWMDR3WVZjNWRXTjVOVzRLWVZoU2IyUlhTakZqTWxaNVdUSTVkV1JIVm5Wa1F6VnFZakl3ZDBWbldVdExkMWxDUWtGSFJIWjZRVUpCWjFGRlkwaFdlbUZFUVRKQ1oyOXlRbWRGUlFwQldVOHZUVUZGUkVKRGFHeGFSR015VG0xS2FGbHRVbWhOYW1NeFdWUnNiVTFFVm1wYVJHUm9UakpHYkZwcWFHeFpiVTVzV1ZSU2FrOUVZekZaYWxreUNrMUNWVWREYVhOSFFWRlJRbWMzT0hkQlVWRkZRak5LYkdKSFZtaGpNbFYzU1dkWlMwdDNXVUpDUVVkRWRucEJRa0pSVVZWWk1rWjVZa2M1ZW1KSFdqRUtURE5PYzJJelVucGtTRXBzV1Zjd2QwaDNXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlNZMjFXYldONU9UQlpWMlI2VEROWmQweHFTWFZOVkVGM1QzZFpTd3BMZDFsQ1FrRkhSSFo2UVVKRFFWRjBSRU4wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyQ21KdVVteGlibEYxV1RJNWRFMUhZMGREYVhOSFFWRlJRbWMzT0hkQlVXdEZWMUY0V0dGSVVqQmpTRTAyVEhrNWJtRllVbTlrVjBsMVdUSTVkRXd5VG1nS1kyMTRkbU15ZUcxa1V6bDZZa2M1TUdNelVubGFWMFowVEhrMWJtRllVbTlrVjBsMlpESTVlV0V5V25OaU0yUjZURE5LYkdKSFZtaGpNbFYxWlZjeGN3cFJTRXBzV201TmRtUkhSbTVqZVRreVRVTTBlVXhxUlhkTlJHZEhRMmx6UjBGUlVVSm5OemgzUVZGdlJVdG5kMjlhVjFFelRtcGFhVmxYU210WlZFa3pDazVYUlRWYWFrRXhXVEpSTTFsVVpHaGFWMWswV2xkS2FscFhSVEJaZW1jelRsZEpNazVxUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZNUWtFNFRVUlhaSEFLWkVkb01WbHBNVzlpTTA0d1dsZFJkMDUzV1V0TGQxbENRa0ZIUkhaNlFVSkVRVkZ3UkVOa2IyUklVbmRqZW05MlRESmtjR1JIYURGWmFUVnFZakl3ZGdwWk1rWjVZa2M1ZW1KSFdqRk1NMDV6WWpOU2VtUklTbXhaVnpCM1QwRlpTMHQzV1VKQ1FVZEVkbnBCUWtSUlVYRkVRMmhzV2tSak1rNXRTbWhaYlZKb0NrMXFZekZaVkd4dFRVUldhbHBFWkdoT01rWnNXbXBvYkZsdFRteFpWRkpxVDBSak1WbHFXVEpOUTBWSFEybHpSMEZSVVVKbk56aDNRVkUwUlVWM2QxSUtZMjFXYldONU9UQlpWMlI2VEROWmQweHFTWFZOVkVGM1IyZFpTMHQzV1VKQ1FVZEVkbnBCUWtSM1VVMUVRVzk0VFhwUk5VMXFaekZOUkZVMFRVTjNSd3BEYVhOSFFWRlJRbWMzT0hkQlVrRkZTR2QzWTJGSVVqQmpTRTAyVEhrNWJtRllVbTlrVjBsMVdUSTVkRXd5VG1oamJYaDJZeko0YldSVVFWaENaMjl5Q2tKblJVVkJXVTh2VFVGRlVrSkJhMDFDZWxVMVQxUk5lRTVxWjNkYWQxbExTM2RaUWtKQlIwUjJla0ZDUldkU1drUkdaRzlrU0ZKM1kzcHZka3d5WkhBS1pFZG9NVmxwTldwaU1qQjJXVEpHZVdKSE9YcGlSMW94VEROT2MySXpVbnBrU0Vwc1dWY3dka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRncGpiVlp6V2xkR2VscFROVFZpVjNoQlkyMVdiV041T1RCWlYyUjZURE5aZDB4cVNYVk5WRUYzVDBGWlMwdDNXVUpDUVVkRWRucEJRa1YzVVhGRVEyaHNDbHBFWXpKT2JVcG9XVzFTYUUxcVl6RlpWR3h0VFVSV2FscEVaR2hPTWtac1dtcG9iRmx0VG14WlZGSnFUMFJqTVZscVdUSk5RbEZIUTJselIwRlJVVUlLWnpjNGQwRlNVVVZDWjNkRlkwaFdlbUZFUW1KQ1oyOXlRbWRGUlVGWlR5OU5RVVZXUWtVd1RWTXlhREJrU0VKNlQyazRkbG95YkRCaFNGWnBURzFPZGdwaVV6bHFXVmhLYzJJelRuTmFibFYyWXpKNGRtUklUakJqYlZab1lsTTVhRmt6VW5CaU1qVjZURE5LTVdKdVRYWk5lbEYzVFZSUmVVOVVZM2RPZW1OMkNsbFlVakJhVnpGM1pFaE5kazFVUVZkQ1oyOXlRbWRGUlVGWlR5OU5RVVZYUWtGblRVSnVRakZaYlhod1dYcENVMEpuYjNKQ1owVkZRVmxQTDAxQlJWa0tRa1ZSVFZGdVNteGpSemcyV1RKR2VXSkhPWHBpUjFveFVVUlZOVTlVVFhoT2FtZDJZeko0ZG1SSVRqQmpiVlpvWWxWQmVFMTZVVFZOYW1jeFRVUlZOQXBQYmtwc1dtcHdlVnBYV25wTU0xSm9Xak5OZG1ScVFYVk5hVFI0VFVSRFFtbFJXVXRMZDFsQ1FrRklWMlZSU1VWQloxSTNRa2hyUVdSM1FqRkJUakE1Q2sxSGNrZDRlRVY1V1hoclpVaEtiRzVPZDB0cFUydzJORE5xZVhRdk5HVkxZMjlCZGt0bE5rOUJRVUZDYjBoVkwycGlkMEZCUVZGRVFVVlpkMUpCU1djS1VqUk9ibGxrZURKSVUwcFBhRmw2Y0UxUWMxRjNSM040V2twV1pHNHZXRmMzWnpob1JYRkJiRVJ6YjBOSlNHRlhOVTFMWVdGdmRHdG9iM016WkVKdE5BcEdWeTl5V25GeVRIbHBNbE0xVWxkSFMwSlRiMjl6TkhwTlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUTJaUWVuRnFWMEUySzFsa2NtUlVDbE5EYWtSeFozazNSVmQyZGtGWmRYZDBTRlpTYkVzMFlYaE5ibGRqUVZSNlVFeDNXRTUwWXpGU2JVRTNZbVV2WTJoQlNYZEpORFZUYUdaelZYWnJiVThLU0dKVU9VRlVWRGhZT0RZeVRVcDBkRXR4VTBKM1ExWkJXa1JCVUhGbE9EbFNRamx5TjNkb09VWlRWMVJTV0dsSWVtODBUQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In1dfX0="
            }
          ],
          "timestampVerificationData": {}
        },
        "dsseEnvelope": {
          "payload": "eyJfdHlwZSI6Imh0dHBzOi8vaW4tdG90by5pby9TdGF0ZW1lbnQvdjEiLCJzdWJqZWN0IjpbeyJuYW1lIjoic2xvdHN0cmVhbS1hcm02NC50YXIuZ3oiLCJkaWdlc3QiOnsic2hhMjU2IjoiZDkxNGRiYmUzNjIzNDJiMzJmYTIzZWRmNmMyMTkyZWNjZjI3Zjg2OThhZDFhN2JhNzg4MWMwYmM2YTZkNGM3NCJ9fV0sInByZWRpY2F0ZVR5cGUiOiJodHRwczovL3Nsc2EuZGV2L3Byb3ZlbmFuY2UvdjEiLCJwcmVkaWNhdGUiOnsiYnVpbGREZWZpbml0aW9uIjp7ImJ1aWxkVHlwZSI6Imh0dHBzOi8vYWN0aW9ucy5naXRodWIuaW8vYnVpbGR0eXBlcy93b3JrZmxvdy92MSIsImV4dGVybmFsUGFyYW1ldGVycyI6eyJ3b3JrZmxvdyI6eyJyZWYiOiJyZWZzL3RhZ3MvdjAuMi4xMCIsInJlcG9zaXRvcnkiOiJodHRwczovL2dpdGh1Yi5jb20vY2FybG9zbGZ1L3Nsb3RzdHJlYW0iLCJwYXRoIjoiLmdpdGh1Yi93b3JrZmxvd3MvcmVsZWFzZS55bWwifX0sImludGVybmFsUGFyYW1ldGVycyI6eyJnaXRodWIiOnsiZXZlbnRfbmFtZSI6InB1c2giLCJyZXBvc2l0b3J5X2lkIjoiMTM0OTI4NTA1OCIsInJlcG9zaXRvcnlfb3duZXJfaWQiOiI1OTkzMTY4IiwicnVubmVyX2Vudmlyb25tZW50IjoiZ2l0aHViLWhvc3RlZCJ9fSwicmVzb2x2ZWREZXBlbmRlbmNpZXMiOlt7InVyaSI6ImdpdCtodHRwczovL2dpdGh1Yi5jb20vY2FybG9zbGZ1L3Nsb3RzdHJlYW1AcmVmcy90YWdzL3YwLjIuMTAiLCJkaWdlc3QiOnsiZ2l0Q29tbWl0IjoiZWQ3NjZiYWJkYTI3NWE5ZjA1Y2Q3YTdhZWY4ZWJjZWE0Yzg3NWI2NiJ9fV19LCJydW5EZXRhaWxzIjp7ImJ1aWxkZXIiOnsiaWQiOiJodHRwczovL2dpdGh1Yi5jb20vY2FybG9zbGZ1L3Nsb3RzdHJlYW0vLmdpdGh1Yi93b3JrZmxvd3MvcmVsZWFzZS55bWxAcmVmcy90YWdzL3YwLjIuMTAifSwibWV0YWRhdGEiOnsiaW52b2NhdGlvbklkIjoiaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdS9zbG90c3RyZWFtL2FjdGlvbnMvcnVucy8zNDAxNDI5NzA3Ny9hdHRlbXB0cy8xIn19fX0=",
          "payloadType": "application/vnd.in-toto+json",
          "signatures": [
            {
              "sig": "MEYCIQDvPw/aweYH2xGKsvj69FRa50ZT95KK2L1uHuaUjbTjwwIhANb+/brJ4MupFMd0USA3D/5a0m27nzAPv7fqfVBafllx"
            }
          ]
        }
      },
      "bundle_url": "",
      "initiator": ""
    },
    "verificationResult": {
      "mediaType": "application/vnd.dev.sigstore.verificationresult+json;version=0.1",
      "signature": {
        "certificate": {
          "certificateIssuer": "CN=sigstore-intermediate,O=sigstore.dev",
          "subjectAlternativeName": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.10",
          "issuer": "https://token.actions.githubusercontent.com",
          "githubWorkflowTrigger": "push",
          "githubWorkflowSHA": "ed766babda275a9f05cd7a7aef8ebcea4c875b66",
          "githubWorkflowName": "release",
          "githubWorkflowRepository": "carloslfu/slotstream",
          "githubWorkflowRef": "refs/tags/v0.2.10",
          "buildSignerURI": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.10",
          "buildSignerDigest": "ed766babda275a9f05cd7a7aef8ebcea4c875b66",
          "runnerEnvironment": "github-hosted",
          "sourceRepositoryURI": "https://github.com/carloslfu/slotstream",
          "sourceRepositoryDigest": "ed766babda275a9f05cd7a7aef8ebcea4c875b66",
          "sourceRepositoryRef": "refs/tags/v0.2.10",
          "sourceRepositoryIdentifier": "1349285058",
          "sourceRepositoryOwnerURI": "https://github.com/carloslfu",
          "sourceRepositoryOwnerIdentifier": "5993168",
          "buildConfigURI": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.10",
          "buildConfigDigest": "ed766babda275a9f05cd7a7aef8ebcea4c875b66",
          "buildTrigger": "push",
          "runInvocationURI": "https://github.com/carloslfu/slotstream/actions/runs/34014297077/attempts/1",
          "sourceRepositoryVisibilityAtSigning": "public"
        }
      },
      "verifiedTimestamps": [
        {
          "type": "Tlog",
          "uri": "https://rekor.sigstore.dev",
          "timestamp": "2026-09-06T00:44:56-05:00"
        }
      ],
      "verifiedIdentity": {
        "subjectAlternativeName": {
          "subjectAlternativeName": "",
          "regexp": "^https://github\\.com/carloslfu/slotstream/\\.github/workflows/release\\.yml"
        },
        "issuer": {
          "issuer": "",
          "regexp": ".*"
        },
        "runnerEnvironment": "github-hosted"
      },
      "statement": {
        "_type": "https://in-toto.io/Statement/v1",
        "subject": [
          {
            "name": "slotstream-arm64.tar.gz",
            "digest": {
              "sha256": "d914dbbe362342b32fa23edf6c2192eccf27f8698ad1a7ba7881c0bc6a6d4c74"
            }
          }
        ],
        "predicateType": "https://slsa.dev/provenance/v1",
        "predicate": {
          "buildDefinition": {
            "buildType": "https://actions.github.io/buildtypes/workflow/v1",
            "externalParameters": {
              "workflow": {
                "path": ".github/workflows/release.yml",
                "ref": "refs/tags/v0.2.10",
                "repository": "https://github.com/carloslfu/slotstream"
              }
            },
            "internalParameters": {
              "github": {
                "event_name": "push",
                "repository_id": "1349285058",
                "repository_owner_id": "5993168",
                "runner_environment": "github-hosted"
              }
            },
            "resolvedDependencies": [
              {
                "digest": {
                  "gitCommit": "ed766babda275a9f05cd7a7aef8ebcea4c875b66"
                },
                "uri": "git+https://github.com/carloslfu/slotstream@refs/tags/v0.2.10"
              }
            ]
          },
          "runDetails": {
            "builder": {
              "id": "https://github.com/carloslfu/slotstream/.github/workflows/release.yml@refs/tags/v0.2.10"
            },
            "metadata": {
              "invocationId": "https://github.com/carloslfu/slotstream/actions/runs/34014297077/attempts/1"
            }
          }
        }
      }
    }
  }
]
```

## Installed CLI controls

```json
{
  "pass_": true,
  "checks": [
    {
      "name": "default",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.161,
      "requests": 8,
      "output": "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "raw-sources-override",
      "pass_": true,
      "transport": "raw",
      "exitCode": 130,
      "cancelSeconds": 0.069,
      "requests": 8,
      "output": "reference estimate: ~18 min at 100 MB/s; actual progress is measured\npulling pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b: 105.3 GB to go over 8 connections (resumable \u2014 rerun to continue)\nsource: <loopback-fixture>/raw\n  8 connections in use\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "explicit-compressed",
      "pass_": true,
      "transport": "compressed",
      "exitCode": 130,
      "cancelSeconds": 0.16,
      "requests": 8,
      "output": "compressed pull: 88.29 GB remaining, 8 connections; verified chunks resume automatically\nconnection tuning starts at 8, capped at 32; extra connections must improve throughput\ndownload interrupted; rerun to resume verified chunks\n"
    },
    {
      "name": "explicit-raw",
      "pass_": true,
      "transport": "raw",
      "exitCode": 130,
      "cancelSeconds": 0.069,
      "requests": 8,
      "output": "reference estimate: ~18 min at 100 MB/s; actual progress is measured\npulling pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b: 105.3 GB to go over 8 connections (resumable \u2014 rerun to continue)\nsource: <loopback-fixture>/raw\n  8 connections in use\ndownload interrupted; rerun to resume verified chunks\n"
    }
  ]
}
```

## Installed full-file revalidation

```json
{
  "pass_": true,
  "peakRSSBytes": 40976384,
  "memory": [
    {
      "seconds": 1.01,
      "rssBytes": 39616512
    },
    {
      "seconds": 2.02,
      "rssBytes": 39616512
    },
    {
      "seconds": 3.02,
      "rssBytes": 39616512
    },
    {
      "seconds": 4.03,
      "rssBytes": 39649280
    },
    {
      "seconds": 5.04,
      "rssBytes": 39649280
    },
    {
      "seconds": 6.05,
      "rssBytes": 39649280
    },
    {
      "seconds": 7.05,
      "rssBytes": 39649280
    },
    {
      "seconds": 8.06,
      "rssBytes": 39665664
    },
    {
      "seconds": 9.07,
      "rssBytes": 39665664
    },
    {
      "seconds": 10.08,
      "rssBytes": 39665664
    },
    {
      "seconds": 11.09,
      "rssBytes": 39665664
    },
    {
      "seconds": 12.1,
      "rssBytes": 39665664
    },
    {
      "seconds": 13.1,
      "rssBytes": 39665664
    },
    {
      "seconds": 14.11,
      "rssBytes": 39665664
    },
    {
      "seconds": 15.12,
      "rssBytes": 39714816
    },
    {
      "seconds": 16.13,
      "rssBytes": 39714816
    },
    {
      "seconds": 17.14,
      "rssBytes": 39714816
    },
    {
      "seconds": 18.14,
      "rssBytes": 39747584
    },
    {
      "seconds": 19.15,
      "rssBytes": 39747584
    },
    {
      "seconds": 20.16,
      "rssBytes": 39747584
    },
    {
      "seconds": 21.17,
      "rssBytes": 39747584
    },
    {
      "seconds": 22.18,
      "rssBytes": 39878656
    },
    {
      "seconds": 23.18,
      "rssBytes": 39878656
    },
    {
      "seconds": 24.19,
      "rssBytes": 39878656
    },
    {
      "seconds": 25.2,
      "rssBytes": 39878656
    },
    {
      "seconds": 26.2,
      "rssBytes": 39878656
    },
    {
      "seconds": 27.21,
      "rssBytes": 39878656
    },
    {
      "seconds": 28.22,
      "rssBytes": 39878656
    },
    {
      "seconds": 29.23,
      "rssBytes": 39878656
    },
    {
      "seconds": 30.24,
      "rssBytes": 39878656
    },
    {
      "seconds": 31.25,
      "rssBytes": 39878656
    },
    {
      "seconds": 32.26,
      "rssBytes": 39878656
    },
    {
      "seconds": 33.27,
      "rssBytes": 39895040
    },
    {
      "seconds": 34.28,
      "rssBytes": 39895040
    },
    {
      "seconds": 35.29,
      "rssBytes": 39895040
    },
    {
      "seconds": 36.31,
      "rssBytes": 39895040
    },
    {
      "seconds": 37.31,
      "rssBytes": 40976384
    }
  ],
  "fresh": false,
  "cli": true,
  "defaultSource": true,
  "clientSummary": [
    "download verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s"
  ],
  "kind": "public-cdn",
  "base": "https://weights.sevra.page/slotpack/v1/cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "manifestSHA256": "cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38",
  "binarySHA256": "a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2",
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
    "Sources/Slotstream/Version.swift": "8c7c41044630f1b97a135df88a5094e68ab7e8edb9a56490279549f1d1b59861",
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
  "secondsDiagnostic": 37.711327624999996
}
```

## Installed model response

```json
{
  "pass_": true,
  "command": [
    "/Users/carlos/.slotstream/bin/slotstream",
    "run",
    "--model",
    "/Users/carlos/Projects/slotstream/.build/transport-v1/full-cdn-model",
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
  "binarySHA256": "a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2",
  "exitCode": 0,
  "guard": [],
  "lockWaitSeconds": 3.095,
  "reclaimableBeforeBytes": 34439020544,
  "peakSampledRSSBytes": 3525967872,
  "samples": [
    {
      "seconds": 0.003,
      "rssBytes": 294912
    },
    {
      "seconds": 0.516,
      "rssBytes": 3054059520
    },
    {
      "seconds": 1.03,
      "rssBytes": 3410477056
    },
    {
      "seconds": 1.543,
      "rssBytes": 3484172288
    },
    {
      "seconds": 2.056,
      "rssBytes": 3525967872
    }
  ],
  "outputSHA256": "052b32deee41a078fd110557fc943f67ad4ace119d70a76b71e2b217080fe65c"
}
```

## Local temporary-data cleanup

```json
{
  "completedAt": "2026-09-06T06:08:22.952136+00:00",
  "removed": [
    {
      "path": "full-cdn-model",
      "files": 26,
      "logicalBytes": 105264463248
    },
    {
      "path": "package/objects",
      "files": 4155,
      "logicalBytes": 88294086225
    }
  ],
  "retained": "Canonical user model; public R2 package; manifests, build receipts, source snapshots and all qualification receipts"
}
```

## Linux temporary-data cleanup

```json
{
  "completedAt": "2026-09-06T05:58:03.300268+00:00",
  "removed": [
    {
      "path": "model",
      "files": 26,
      "logicalBytes": 105264489215
    },
    {
      "path": "package/objects",
      "files": 4155,
      "logicalBytes": 88294086225
    }
  ],
  "retained": "Source tools, manifests, build receipts, public download proof and upload receipts"
}
```

## Release CI raw log

Local log SHA-256: `73daaf9d1ad917b297542dcd4e0e76aa1923545832ed42c0fe97926fde17a95c`

```text
build	Set up job	﻿2026-09-06T05:33:59.9076640Z Current runner version: '2.337.0'
build	Set up job	2026-09-06T05:33:59.9130590Z ##[group]Runner Image Provisioner
build	Set up job	2026-09-06T05:33:59.9131450Z Hosted Compute Agent
build	Set up job	2026-09-06T05:33:59.9131830Z Version: 20260828.587
build	Set up job	2026-09-06T05:33:59.9132260Z Commit: abac92662cab4cc7352de4f9f9d2e2419aad9c29
build	Set up job	2026-09-06T05:33:59.9132810Z Build Date: 2026-08-28T16:44:25Z
build	Set up job	2026-09-06T05:33:59.9133430Z Worker ID: {d445539f-fb42-47a9-9ad2-d15d3e2f965b}
build	Set up job	2026-09-06T05:33:59.9133920Z Azure Region: westus
build	Set up job	2026-09-06T05:33:59.9134280Z ##[endgroup]
build	Set up job	2026-09-06T05:33:59.9135550Z ##[group]Operating System
build	Set up job	2026-09-06T05:33:59.9135990Z macOS
build	Set up job	2026-09-06T05:33:59.9136310Z 26.6.2
build	Set up job	2026-09-06T05:33:59.9136630Z 25G83
build	Set up job	2026-09-06T05:33:59.9136950Z ##[endgroup]
build	Set up job	2026-09-06T05:33:59.9137310Z ##[group]Runner Image
build	Set up job	2026-09-06T05:33:59.9137730Z Image: macos-26-arm64
build	Set up job	2026-09-06T05:33:59.9138120Z Version: 20260831.0337.3
build	Set up job	2026-09-06T05:33:59.9139090Z Included Software: https://github.com/actions/runner-images/blob/macos-26-arm64/20260831.0337/images/macos/macos-26-arm64-Readme.md
build	Set up job	2026-09-06T05:33:59.9140590Z Image Release: https://github.com/actions/runner-images/releases/tag/macos-26-arm64%2F20260831.0337
build	Set up job	2026-09-06T05:33:59.9141350Z ##[endgroup]
build	Set up job	2026-09-06T05:33:59.9142210Z ##[group]GITHUB_TOKEN Permissions
build	Set up job	2026-09-06T05:33:59.9143910Z Attestations: write
build	Set up job	2026-09-06T05:33:59.9144370Z Contents: write
build	Set up job	2026-09-06T05:33:59.9144760Z Metadata: read
build	Set up job	2026-09-06T05:33:59.9145130Z ##[endgroup]
build	Set up job	2026-09-06T05:33:59.9146640Z Secret source: Actions
build	Set up job	2026-09-06T05:33:59.9147350Z Prepare workflow directory
build	Set up job	2026-09-06T05:33:59.9546990Z Prepare all required actions
build	Set up job	2026-09-06T05:33:59.9593850Z Getting action download info
build	Set up job	2026-09-06T05:34:00.1455490Z Download action repository 'actions/checkout@v7' (SHA:3d3c42e5aac5ba805825da76410c181273ba90b1)
build	Set up job	2026-09-06T05:34:00.4457990Z Download action repository 'actions/attest-build-provenance@v4' (SHA:4d101475d8b20a2381f78447822ac1eab6504dd8)
build	Set up job	2026-09-06T05:34:00.9585360Z Getting action download info
build	Set up job	2026-09-06T05:34:01.0315940Z Download action repository 'actions/attest@508db95dd578ae2727ebd6217d5ba78e4fbda05d' (SHA:508db95dd578ae2727ebd6217d5ba78e4fbda05d)
build	Set up job	2026-09-06T05:34:01.9221980Z Complete job name: build
build	Run actions/checkout@v7	﻿2026-09-06T05:34:01.9751670Z ##[group]Run actions/checkout@v7
build	Run actions/checkout@v7	2026-09-06T05:34:01.9753010Z with:
build	Run actions/checkout@v7	2026-09-06T05:34:01.9753700Z   repository: carloslfu/slotstream
build	Run actions/checkout@v7	2026-09-06T05:34:01.9757110Z   token: ***
build	Run actions/checkout@v7	2026-09-06T05:34:01.9757510Z   ssh-strict: true
build	Run actions/checkout@v7	2026-09-06T05:34:01.9757970Z   ssh-user: git
build	Run actions/checkout@v7	2026-09-06T05:34:01.9758320Z   persist-credentials: true
build	Run actions/checkout@v7	2026-09-06T05:34:01.9758760Z   clean: true
build	Run actions/checkout@v7	2026-09-06T05:34:01.9759170Z   sparse-checkout-cone-mode: true
build	Run actions/checkout@v7	2026-09-06T05:34:01.9759660Z   fetch-depth: 1
build	Run actions/checkout@v7	2026-09-06T05:34:01.9760090Z   fetch-tags: false
build	Run actions/checkout@v7	2026-09-06T05:34:01.9760490Z   show-progress: true
build	Run actions/checkout@v7	2026-09-06T05:34:01.9760880Z   lfs: false
build	Run actions/checkout@v7	2026-09-06T05:34:01.9761210Z   submodules: false
build	Run actions/checkout@v7	2026-09-06T05:34:01.9761590Z   set-safe-directory: true
build	Run actions/checkout@v7	2026-09-06T05:34:01.9762440Z   allow-unsafe-pr-checkout: false
build	Run actions/checkout@v7	2026-09-06T05:34:01.9763640Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:02.2934870Z Syncing repository: carloslfu/slotstream
build	Run actions/checkout@v7	2026-09-06T05:34:02.2937350Z ##[group]Getting Git version info
build	Run actions/checkout@v7	2026-09-06T05:34:02.2938050Z Working directory is '/Users/runner/work/slotstream/slotstream'
build	Run actions/checkout@v7	2026-09-06T05:34:02.2939040Z [command]/opt/homebrew/bin/git version
build	Run actions/checkout@v7	2026-09-06T05:34:02.3190470Z git version 2.55.0
build	Run actions/checkout@v7	2026-09-06T05:34:02.3206310Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:02.3212310Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/1014c8ad-1a9b-4fab-9604-61ff10376386/.gitconfig'
build	Run actions/checkout@v7	2026-09-06T05:34:02.3217560Z Temporarily overriding HOME='/Users/runner/work/_temp/1014c8ad-1a9b-4fab-9604-61ff10376386' before making global git config changes
build	Run actions/checkout@v7	2026-09-06T05:34:02.3218850Z Adding repository directory to the temporary git global config as a safe directory
build	Run actions/checkout@v7	2026-09-06T05:34:02.3222920Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
build	Run actions/checkout@v7	2026-09-06T05:34:02.3325140Z Deleting the contents of '/Users/runner/work/slotstream/slotstream'
build	Run actions/checkout@v7	2026-09-06T05:34:02.3327350Z ##[group]Determining repository object format
build	Run actions/checkout@v7	2026-09-06T05:34:02.3328380Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:02.3329090Z ##[group]Initializing the repository
build	Run actions/checkout@v7	2026-09-06T05:34:02.3332280Z [command]/opt/homebrew/bin/git init /Users/runner/work/slotstream/slotstream
build	Run actions/checkout@v7	2026-09-06T05:34:02.3564470Z hint: Using 'master' as the name for the initial branch. This default branch name
build	Run actions/checkout@v7	2026-09-06T05:34:02.3569150Z hint: will change to "main" in Git 3.0. To configure the initial branch name
build	Run actions/checkout@v7	2026-09-06T05:34:02.3570130Z hint: to use in all of your new repositories, which will suppress this warning,
build	Run actions/checkout@v7	2026-09-06T05:34:02.3570830Z hint: call:
build	Run actions/checkout@v7	2026-09-06T05:34:02.3571270Z hint:
build	Run actions/checkout@v7	2026-09-06T05:34:02.3571850Z hint: 	git config --global init.defaultBranch <name>
build	Run actions/checkout@v7	2026-09-06T05:34:02.3573510Z hint:
build	Run actions/checkout@v7	2026-09-06T05:34:02.3574210Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
build	Run actions/checkout@v7	2026-09-06T05:34:02.3575160Z hint: 'development'. The just-created branch can be renamed via this command:
build	Run actions/checkout@v7	2026-09-06T05:34:02.3575870Z hint:
build	Run actions/checkout@v7	2026-09-06T05:34:02.3576390Z hint: 	git branch -m <name>
build	Run actions/checkout@v7	2026-09-06T05:34:02.3576870Z hint:
build	Run actions/checkout@v7	2026-09-06T05:34:02.3577500Z hint: Disable this message with "git config set advice.defaultBranchName false"
build	Run actions/checkout@v7	2026-09-06T05:34:02.3579390Z Initialized empty Git repository in /Users/runner/work/slotstream/slotstream/.git/
build	Run actions/checkout@v7	2026-09-06T05:34:02.3581410Z [command]/opt/homebrew/bin/git remote add origin https://github.com/carloslfu/slotstream
build	Run actions/checkout@v7	2026-09-06T05:34:02.3652690Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:02.3653560Z ##[group]Disabling automatic garbage collection
build	Run actions/checkout@v7	2026-09-06T05:34:02.3655820Z [command]/opt/homebrew/bin/git config --local gc.auto 0
build	Run actions/checkout@v7	2026-09-06T05:34:02.3739780Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:02.3740670Z ##[group]Setting up auth
build	Run actions/checkout@v7	2026-09-06T05:34:02.3741200Z Removing SSH command configuration
build	Run actions/checkout@v7	2026-09-06T05:34:02.3741860Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
build	Run actions/checkout@v7	2026-09-06T05:34:02.3808830Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
build	Run actions/checkout@v7	2026-09-06T05:34:02.4850660Z Removing HTTP extra header
build	Run actions/checkout@v7	2026-09-06T05:34:02.4854090Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
build	Run actions/checkout@v7	2026-09-06T05:34:02.4918040Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
build	Run actions/checkout@v7	2026-09-06T05:34:02.5707780Z Removing includeIf entries pointing to credentials config files
build	Run actions/checkout@v7	2026-09-06T05:34:02.5715530Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
build	Run actions/checkout@v7	2026-09-06T05:34:02.5779770Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
build	Run actions/checkout@v7	2026-09-06T05:34:02.7306200Z [command]/opt/homebrew/bin/git config --file /Users/runner/work/_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config http.https://github.com/.extraheader AUTHORIZATION: basic ***
build	Run actions/checkout@v7	2026-09-06T05:34:02.7310740Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git.path /Users/runner/work/_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Run actions/checkout@v7	2026-09-06T05:34:02.7314330Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path /Users/runner/work/_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Run actions/checkout@v7	2026-09-06T05:34:02.7319110Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git.path /github/runner_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Run actions/checkout@v7	2026-09-06T05:34:02.7398970Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git/worktrees/*.path /github/runner_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Run actions/checkout@v7	2026-09-06T05:34:02.7531070Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:02.7531930Z ##[group]Fetching the repository
build	Run actions/checkout@v7	2026-09-06T05:34:02.7533630Z [command]/opt/homebrew/bin/git -c protocol.version=2 fetch --no-tags --prune --no-recurse-submodules --depth=1 origin +refs/tags/v0.2.10:refs/tags/v0.2.10
build	Run actions/checkout@v7	2026-09-06T05:34:04.0341350Z From https://github.com/carloslfu/slotstream
build	Run actions/checkout@v7	2026-09-06T05:34:04.0342350Z  * [new tag]         v0.2.10    -> v0.2.10
build	Run actions/checkout@v7	2026-09-06T05:34:04.0346550Z [command]/opt/homebrew/bin/git tag --list v0.2.10
build	Run actions/checkout@v7	2026-09-06T05:34:04.0424840Z v0.2.10
build	Run actions/checkout@v7	2026-09-06T05:34:04.0430110Z [command]/opt/homebrew/bin/git rev-parse refs/tags/v0.2.10^{commit}
build	Run actions/checkout@v7	2026-09-06T05:34:04.0497070Z ed766babda275a9f05cd7a7aef8ebcea4c875b66
build	Run actions/checkout@v7	2026-09-06T05:34:04.0498820Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:04.0499290Z ##[group]Determining the checkout info
build	Run actions/checkout@v7	2026-09-06T05:34:04.0499840Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:04.0503590Z [command]/opt/homebrew/bin/git sparse-checkout disable
build	Run actions/checkout@v7	2026-09-06T05:34:04.0613630Z [command]/opt/homebrew/bin/git config --local --unset-all extensions.worktreeConfig
build	Run actions/checkout@v7	2026-09-06T05:34:04.0670190Z ##[group]Checking out the ref
build	Run actions/checkout@v7	2026-09-06T05:34:04.0671660Z [command]/opt/homebrew/bin/git checkout --progress --force refs/tags/v0.2.10
build	Run actions/checkout@v7	2026-09-06T05:34:04.1346130Z HEAD is now at ed766ba test: synchronize download interruption with durable progress
build	Run actions/checkout@v7	2026-09-06T05:34:04.1360030Z ##[endgroup]
build	Run actions/checkout@v7	2026-09-06T05:34:04.1471120Z [command]/opt/homebrew/bin/git log -1 --format=%H
build	Run actions/checkout@v7	2026-09-06T05:34:04.1560340Z ed766babda275a9f05cd7a7aef8ebcea4c875b66
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	﻿2026-09-06T05:34:04.1725100Z ##[group]Run sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.1725840Z ^[[36;1msudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"^[[0m
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.1726230Z ^[[36;1msw_vers^[[0m
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.1726450Z ^[[36;1mswift --version^[[0m
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.1777360Z shell: /bin/bash -e {0}
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.1777670Z ##[endgroup]
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.2545190Z ProductName:		macOS
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.2545870Z ProductVersion:		26.6.2
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:04.2546620Z BuildVersion:		25G83
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:06.7296890Z Apple Swift version 6.3.3 (swiftlang-6.3.3.1.3 clang-2100.1.1.101)
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:06.7298250Z Target: arm64-apple-macosx26.0
build	toolchain (newest Xcode on the image; mlx-swift needs Swift >= 6.3)	2026-09-06T05:34:06.7361730Z swift-driver version: 1.148.6 
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	﻿2026-09-06T05:34:06.7406450Z ##[group]Run SLOTSTREAM_METALLIB_MACOS=26 Tools/fetch_metallib.sh
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:06.7406960Z ^[[36;1mSLOTSTREAM_METALLIB_MACOS=26 Tools/fetch_metallib.sh^[[0m
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:06.7444280Z shell: /bin/bash -e {0}
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:06.7444550Z ##[endgroup]
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:06.8199590Z downloading mlx_metal-0.31.1-py3-none-macosx_26_0_arm64.whl (about 50 MB)
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:06.9534880Z 
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:07.0532700Z ############                                                              16.9%
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:07.1556530Z ##############################                                            43.0%
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:07.2373840Z ###################################################                       71.5%
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:07.2375680Z ######################################################################## 100.0%
build	metal library (pinned mlx-metal 0.31.1 wheel, macOS 26 build)	2026-09-06T05:34:08.3389820Z ok: Tools/lib/mlx-0.31.1.metallib
build	build	﻿2026-09-06T05:34:08.3632020Z ##[group]Run swift build -c release
build	build	2026-09-06T05:34:08.3632360Z ^[[36;1mswift build -c release^[[0m
build	build	2026-09-06T05:34:08.3632680Z ^[[36;1mcp Tools/lib/mlx-0.31.1.metallib .build/release/mlx.metallib^[[0m
build	build	2026-09-06T05:34:08.3665650Z shell: /bin/bash -e {0}
build	build	2026-09-06T05:34:08.3665940Z ##[endgroup]
build	build	2026-09-06T05:34:16.2508770Z Fetching https://github.com/apple/swift-collections.git
build	build	2026-09-06T05:34:16.2509770Z Fetching https://github.com/apple/swift-asn1.git
build	build	2026-09-06T05:34:16.8990030Z [1/1949] Fetching swift-asn1
build	build	2026-09-06T05:34:17.1822720Z [1697/29085] Fetching swift-asn1, swift-collections
build	build	2026-09-06T05:34:18.2041760Z Fetched https://github.com/apple/swift-asn1.git from cache (1.95s)
build	build	2026-09-06T05:34:18.2067880Z Fetched https://github.com/apple/swift-collections.git from cache (1.96s)
build	build	2026-09-06T05:34:18.2119080Z Fetching https://github.com/huggingface/swift-transformers.git
build	build	2026-09-06T05:34:18.2140410Z Fetching https://github.com/mattt/EventSource.git
build	build	2026-09-06T05:34:18.9107850Z [1/303] Fetching eventsource
build	build	2026-09-06T05:34:18.9784960Z [195/7267] Fetching eventsource, swift-transformers
build	build	2026-09-06T05:34:19.0564910Z Fetched https://github.com/mattt/EventSource.git from cache (0.84s)
build	build	2026-09-06T05:34:19.0574170Z [140/6964] Fetching swift-transformers
build	build	2026-09-06T05:34:19.0638360Z Fetching https://github.com/huggingface/swift-huggingface.git
build	build	2026-09-06T05:34:19.7576210Z [6130/9478] Fetching swift-transformers, swift-huggingface
build	build	2026-09-06T05:34:20.0550240Z Fetched https://github.com/huggingface/swift-huggingface.git from cache (0.99s)
build	build	2026-09-06T05:34:20.0652980Z Fetching https://github.com/apple/swift-argument-parser.git
build	build	2026-09-06T05:34:20.1259660Z [6184/6964] Fetching swift-transformers
build	build	2026-09-06T05:34:20.5936240Z Fetched https://github.com/huggingface/swift-transformers.git from cache (2.38s)
build	build	2026-09-06T05:34:20.6013950Z Fetching https://github.com/huggingface/swift-jinja.git
build	build	2026-09-06T05:34:21.0046920Z [1/18778] Fetching swift-argument-parser
build	build	2026-09-06T05:34:21.3134710Z [3569/20059] Fetching swift-argument-parser, swift-jinja
build	build	2026-09-06T05:34:21.5584090Z Fetched https://github.com/huggingface/swift-jinja.git from cache (0.96s)
build	build	2026-09-06T05:34:21.5685200Z Fetching https://github.com/ml-explore/mlx-swift.git
build	build	2026-09-06T05:34:21.6152290Z Fetched https://github.com/apple/swift-argument-parser.git from cache (1.55s)
build	build	2026-09-06T05:34:21.6237390Z Fetching https://github.com/apple/swift-numerics
build	build	2026-09-06T05:34:22.3695490Z [1/6586] Fetching swift-numerics
build	build	2026-09-06T05:34:22.5499570Z [726/22800] Fetching swift-numerics, mlx-swift
build	build	2026-09-06T05:34:22.7709090Z Fetched https://github.com/apple/swift-numerics from cache (1.15s)
build	build	2026-09-06T05:34:22.7810810Z Fetching https://github.com/ibireme/yyjson.git
build	build	2026-09-06T05:34:22.8067590Z [325/16214] Fetching mlx-swift
build	build	2026-09-06T05:34:23.4441910Z Fetched https://github.com/ml-explore/mlx-swift.git from cache (1.88s)
build	build	2026-09-06T05:34:23.4456730Z Computing version for https://github.com/apple/swift-argument-parser.git
build	build	2026-09-06T05:34:24.3769500Z Fetching https://github.com/apple/swift-crypto.git
build	build	2026-09-06T05:34:24.3770650Z [1/4760] Fetching yyjson
build	build	2026-09-06T05:34:24.3771150Z [4761/23238] Fetching yyjson, swift-crypto
build	build	2026-09-06T05:34:24.3771600Z Fetched https://github.com/ibireme/yyjson.git from cache (1.60s)
build	build	2026-09-06T05:34:24.3835260Z [555/18478] Fetching swift-crypto
build	build	2026-09-06T05:34:25.1571710Z Fetched https://github.com/apple/swift-crypto.git from cache (1.70s)
build	build	2026-09-06T05:34:25.5393330Z Computed https://github.com/apple/swift-argument-parser.git at 1.8.2 (9.30s)
build	build	2026-09-06T05:34:25.5395390Z Computing version for https://github.com/huggingface/swift-transformers.git
build	build	2026-09-06T05:34:25.8701680Z Computed https://github.com/huggingface/swift-transformers.git at 1.3.3 (0.33s)
build	build	2026-09-06T05:34:25.8703540Z Computing version for https://github.com/ml-explore/mlx-swift.git
build	build	2026-09-06T05:34:26.2744280Z Computed https://github.com/ml-explore/mlx-swift.git at 0.31.6 (0.40s)
build	build	2026-09-06T05:34:26.2845330Z Computing version for https://github.com/ibireme/yyjson.git
build	build	2026-09-06T05:34:29.9646250Z Computed https://github.com/ibireme/yyjson.git at 0.12.0 (3.69s)
build	build	2026-09-06T05:34:29.9647980Z Computing version for https://github.com/apple/swift-crypto.git
build	build	2026-09-06T05:34:32.3275200Z Computed https://github.com/apple/swift-crypto.git at 4.5.1 (2.36s)
build	build	2026-09-06T05:34:32.3277430Z Computing version for https://github.com/apple/swift-collections.git
build	build	2026-09-06T05:34:32.7489540Z Computed https://github.com/apple/swift-collections.git at 1.6.0 (0.42s)
build	build	2026-09-06T05:34:32.7490650Z Computing version for https://github.com/huggingface/swift-huggingface.git
build	build	2026-09-06T05:34:33.0373480Z Computed https://github.com/huggingface/swift-huggingface.git at 0.9.0 (0.29s)
build	build	2026-09-06T05:34:33.0374810Z Computing version for https://github.com/huggingface/swift-jinja.git
build	build	2026-09-06T05:34:33.3013790Z Computed https://github.com/huggingface/swift-jinja.git at 2.4.2 (0.26s)
build	build	2026-09-06T05:34:33.3014960Z Computing version for https://github.com/apple/swift-numerics
build	build	2026-09-06T05:34:33.5638140Z Computed https://github.com/apple/swift-numerics at 1.1.1 (0.26s)
build	build	2026-09-06T05:34:33.5640410Z Computing version for https://github.com/apple/swift-asn1.git
build	build	2026-09-06T05:34:33.9534640Z Computed https://github.com/apple/swift-asn1.git at 1.7.1 (0.39s)
build	build	2026-09-06T05:34:33.9536990Z Computing version for https://github.com/mattt/EventSource.git
build	build	2026-09-06T05:34:34.2455910Z Computed https://github.com/mattt/EventSource.git at 1.5.1 (0.29s)
build	build	2026-09-06T05:34:34.5531410Z Creating working copy for https://github.com/apple/swift-asn1.git
build	build	2026-09-06T05:34:34.6527070Z Working copy of https://github.com/apple/swift-asn1.git resolved at 1.7.1
build	build	2026-09-06T05:34:34.6817310Z Creating working copy for https://github.com/apple/swift-numerics
build	build	2026-09-06T05:34:34.7559440Z Working copy of https://github.com/apple/swift-numerics resolved at 1.1.1
build	build	2026-09-06T05:34:34.7841190Z Creating working copy for https://github.com/mattt/EventSource.git
build	build	2026-09-06T05:34:34.9178700Z Working copy of https://github.com/mattt/EventSource.git resolved at 1.5.1
build	build	2026-09-06T05:34:34.9841650Z Creating working copy for https://github.com/huggingface/swift-jinja.git
build	build	2026-09-06T05:34:35.0749360Z Working copy of https://github.com/huggingface/swift-jinja.git resolved at 2.4.2
build	build	2026-09-06T05:34:35.1253650Z Creating working copy for https://github.com/apple/swift-crypto.git
build	build	2026-09-06T05:34:35.5539830Z Working copy of https://github.com/apple/swift-crypto.git resolved at 4.5.1
build	build	2026-09-06T05:34:35.5817230Z Creating working copy for https://github.com/huggingface/swift-transformers.git
build	build	2026-09-06T05:34:35.7324560Z Working copy of https://github.com/huggingface/swift-transformers.git resolved at 1.3.3
build	build	2026-09-06T05:34:35.7790100Z Creating working copy for https://github.com/apple/swift-argument-parser.git
build	build	2026-09-06T05:34:35.9408340Z Working copy of https://github.com/apple/swift-argument-parser.git resolved at 1.8.2
build	build	2026-09-06T05:34:36.0121430Z Creating working copy for https://github.com/apple/swift-collections.git
build	build	2026-09-06T05:34:36.3919590Z Working copy of https://github.com/apple/swift-collections.git resolved at 1.6.0
build	build	2026-09-06T05:34:36.4423980Z Creating working copy for https://github.com/ml-explore/mlx-swift.git
build	build	2026-09-06T05:34:43.6652100Z Working copy of https://github.com/ml-explore/mlx-swift.git resolved at 0.31.6
build	build	2026-09-06T05:34:43.6880790Z Creating working copy for https://github.com/ibireme/yyjson.git
build	build	2026-09-06T05:34:43.8928070Z Working copy of https://github.com/ibireme/yyjson.git resolved at 0.12.0
build	build	2026-09-06T05:34:43.9144390Z Creating working copy for https://github.com/huggingface/swift-huggingface.git
build	build	2026-09-06T05:34:43.9762860Z Working copy of https://github.com/huggingface/swift-huggingface.git resolved at 0.9.0
build	build	2026-09-06T05:34:47.8233860Z [0/6] Write sources
build	build	2026-09-06T05:34:47.9295140Z [3/6] Write swift-version-7974D3F7F03D5E95.txt
build	build	2026-09-06T05:34:49.1365020Z [5/7] Compiling ArgumentParserToolInfo ToolInfo.swift
build	build	2026-09-06T05:35:03.2845900Z [6/8] Compiling ArgumentParser BashCompletionsGenerator.swift
build	build	2026-09-06T05:35:06.0653570Z [7/9] Compiling encuda encuda-compile.swift
build	build	2026-09-06T05:35:06.0678240Z [7/9] Write Objects.LinkFileList
build	build	2026-09-06T05:35:06.5591680Z [8/9] Linking encuda-tool
build	build	2026-09-06T05:35:10.9998440Z [1/1] Compiling plugin GenerateManual
build	build	2026-09-06T05:35:11.6061980Z [2/2] Compiling plugin GenerateDoccReference
build	build	2026-09-06T05:35:11.6067620Z [3/3] Compiling plugin CudaBuild
build	build	2026-09-06T05:35:11.6068200Z Building for production...
build	build	2026-09-06T05:35:11.6412850Z [3/216] Copying t5_tokenizer_config.json
build	build	2026-09-06T05:35:11.6529830Z [3/216] Copying gpt2_tokenizer_config.json
build	build	2026-09-06T05:35:11.6669620Z [3/216] Copying PrivacyInfo.xcprivacy
build	build	2026-09-06T05:35:11.6729660Z [6/216] Write sources
build	build	2026-09-06T05:35:11.8117680Z [8/216] Write swift-version-7974D3F7F03D5E95.txt
build	build	2026-09-06T05:35:11.8125530Z [9/216] Write sources
build	build	2026-09-06T05:35:11.8411700Z [26/216] Compiling _NumericsShims _NumericsShims.c
build	build	2026-09-06T05:35:13.8994960Z [28/218] Compiling InternalCollectionsUtilities Debugging.swift
build	build	2026-09-06T05:35:14.7720270Z [29/219] Compiling RealModule AlgebraicField.swift
build	build	2026-09-06T05:35:16.6586130Z [30/220] Compiling EventSource AsyncEventsSequence.swift
build	build	2026-09-06T05:35:16.6690930Z [30/220] Write sources
build	build	2026-09-06T05:35:17.7179970Z [33/221] Compiling Crypto AES-GCM.swift
build	build	2026-09-06T05:35:18.4266090Z [34/222] Compiling ComplexModule Complex+AdditiveArithmetic.swift
build	build	2026-09-06T05:35:18.9141790Z [34/223] Compiling yyjson.c
build	build	2026-09-06T05:35:19.0516570Z [36/224] Compiling Numerics Numerics.swift
build	build	2026-09-06T05:35:19.0818330Z [36/224] Compiling version.cpp
build	build	2026-09-06T05:35:21.2873420Z [38/224] Compiling OrderedCollections _HashTable+Bucket.swift
build	build	2026-09-06T05:35:22.0883150Z [38/224] Compiling utils.cpp
build	build	2026-09-06T05:35:27.4150340Z [39/225] Compiling transforms.cpp
build	build	2026-09-06T05:35:29.2789020Z [40/225] Compiling scheduler.cpp
build	build	2026-09-06T05:35:31.6531990Z [41/225] Compiling random.cpp
build	build	2026-09-06T05:35:39.7615700Z [42/225] Compiling primitives.cpp
build	build	2026-09-06T05:35:48.7723250Z [44/225] Compiling Jinja AST.swift
build	build	2026-09-06T05:35:48.9915080Z [45/225] Compiling HuggingFace AccessRequest.swift
build	build	2026-09-06T05:35:51.8222460Z [45/225] Compiling linalg.cpp
build	build	2026-09-06T05:35:53.2462520Z [46/226] Compiling safetensors.cpp
build	build	2026-09-06T05:35:54.2699200Z [47/226] Compiling no_gguf.cpp
build	build	2026-09-06T05:35:55.1984800Z [48/226] Compiling ops.cpp
build	build	2026-09-06T05:35:56.1465320Z [49/226] Compiling load.cpp
build	build	2026-09-06T05:35:56.6404450Z [50/226] Compiling graph_utils.cpp
build	build	2026-09-06T05:35:57.5200590Z [51/226] Compiling fft.cpp
build	build	2026-09-06T05:35:59.6587500Z [52/226] Compiling fast.cpp
build	build	2026-09-06T05:36:03.5276320Z [54/226] Compiling Hub BinaryDistinct.swift
build	build	2026-09-06T05:36:03.5560520Z [54/226] Compiling einsum.cpp
build	build	2026-09-06T05:36:04.3508380Z [55/227] Compiling dtype_utils.cpp
build	build	2026-09-06T05:36:05.2994560Z [56/227] Compiling dtype.cpp
build	build	2026-09-06T05:36:06.0906930Z [57/227] Compiling utils.cpp
build	build	2026-09-06T05:36:06.7902310Z [58/227] Compiling no_ring.cpp
build	build	2026-09-06T05:36:07.8895580Z [59/227] Compiling primitives.cpp
build	build	2026-09-06T05:36:09.0918920Z [60/227] Compiling export.cpp
build	build	2026-09-06T05:36:09.0942550Z [61/227] Compiling ops.cpp
build	build	2026-09-06T05:36:09.7129970Z [62/227] Compiling no_nccl.cpp
build	build	2026-09-06T05:36:09.7135300Z [62/227] Compiling no_mpi.cpp
build	build	2026-09-06T05:36:10.3307240Z [64/227] Compiling no_jaccl.cpp
build	build	2026-09-06T05:36:10.5486210Z [65/227] Compiling distributed.cpp
build	build	2026-09-06T05:36:10.8272850Z [66/227] Compiling device.cpp
build	build	2026-09-06T05:36:12.0771840Z [68/227] Compiling Tokenizers BPETokenizer.swift
build	build	2026-09-06T05:36:12.7898580Z [68/227] Compiling utils.cpp
build	build	2026-09-06T05:36:14.1653950Z [69/228] Compiling unary.cpp
build	build	2026-09-06T05:36:14.5922030Z [71/228] Compiling Generation Decoders.swift
build	build	2026-09-06T05:36:14.9193010Z [71/228] Compiling compile.cpp
build	build	2026-09-06T05:36:16.4486130Z [72/229] Compiling ternary.cpp
build	build	2026-09-06T05:36:16.7060220Z [73/229] Compiling sort.cpp
build	build	2026-09-06T05:36:17.0133230Z [75/229] Compiling Models LanguageModel.swift
build	build	2026-09-06T05:36:18.5374250Z [75/229] Compiling softmax.cpp
build	build	2026-09-06T05:36:18.8491350Z [76/229] Compiling slicing.cpp
build	build	2026-09-06T05:36:19.0470800Z [77/229] Compiling scan.cpp
build	build	2026-09-06T05:36:21.5624950Z [78/229] Compiling resident.cpp
build	build	2026-09-06T05:36:22.1488450Z [79/229] Compiling rope.cpp
build	build	2026-09-06T05:36:22.7235080Z [80/229] Compiling scaled_dot_product_attention.cpp
build	build	2026-09-06T05:36:26.0654750Z [81/229] Compiling reduce.cpp
build	build	2026-09-06T05:36:26.3365200Z [82/229] Compiling primitives.cpp
build	build	2026-09-06T05:36:27.0153000Z [83/229] Compiling quantized.cpp
build	build	2026-09-06T05:36:27.6212370Z [84/229] Compiling metal.cpp
build	build	2026-09-06T05:36:27.8639600Z [85/229] Compiling normalization.cpp
build	build	2026-09-06T05:36:29.1195740Z [86/229] Compiling logsumexp.cpp
build	build	2026-09-06T05:36:30.4956250Z [87/229] Compiling matmul.cpp
build	build	2026-09-06T05:36:31.1507060Z [88/229] Compiling jit_kernels.cpp
build	build	2026-09-06T05:36:31.5619640Z [89/229] Compiling indexing.cpp
build	build	2026-09-06T05:36:32.3150860Z [90/229] Compiling hadamard.cpp
build	build	2026-09-06T05:36:33.0268460Z [91/229] Compiling fence.cpp
build	build	2026-09-06T05:36:33.7268230Z [92/229] Compiling event.cpp
build	build	2026-09-06T05:36:34.8095190Z [93/229] Compiling eval.cpp
build	build	2026-09-06T05:36:35.2030220Z [94/229] Compiling distributed.cpp
build	build	2026-09-06T05:36:36.1577940Z [95/229] Compiling device_info.cpp
build	build	2026-09-06T05:36:37.5254640Z [96/229] Compiling fft.cpp
build	build	2026-09-06T05:36:38.5358110Z [97/229] Compiling device.cpp
build	build	2026-09-06T05:36:39.3685290Z [98/229] Compiling copy.cpp
build	build	2026-09-06T05:36:40.1853890Z [99/229] Compiling custom_kernel.cpp
build	build	2026-09-06T05:36:41.4672140Z [100/229] Compiling conv.cpp
build	build	2026-09-06T05:36:41.6040790Z [101/229] Compiling compiled.cpp
build	build	2026-09-06T05:36:42.2657420Z [102/229] Compiling binary.cpp
build	build	2026-09-06T05:36:42.6974950Z [103/229] Compiling slicing.cpp
build	build	2026-09-06T05:36:43.4228070Z [104/229] Compiling allocator.cpp
build	build	2026-09-06T05:36:43.9125740Z [105/229] Compiling primitives.cpp
build	build	2026-09-06T05:36:44.2083540Z [106/229] Compiling copy.cpp
build	build	2026-09-06T05:36:44.3206050Z [107/229] Compiling threefry.cpp
build	build	2026-09-06T05:36:44.3308670Z [108/229] Compiling no_cuda.cpp
build	build	2026-09-06T05:36:47.9855870Z [109/229] Compiling svd.cpp
build	build	2026-09-06T05:36:50.2856240Z [110/229] Compiling softmax.cpp
build	build	2026-09-06T05:36:52.3548390Z [111/229] Compiling unary.cpp
build	build	2026-09-06T05:36:52.6228190Z [112/229] Compiling select.cpp
build	build	2026-09-06T05:36:54.7005610Z [113/229] Compiling sort.cpp
build	build	2026-09-06T05:37:00.8044900Z [114/229] Compiling scan.cpp
build	build	2026-09-06T05:37:01.4513910Z [115/229] Compiling quantized.cpp
build	build	2026-09-06T05:37:01.5653890Z [116/229] Compiling reduce.cpp
build	build	2026-09-06T05:37:02.8625110Z [117/229] Compiling qrf.cpp
build	build	2026-09-06T05:37:03.8459520Z [118/229] Compiling primitives.cpp
build	build	2026-09-06T05:37:04.8582940Z [119/229] Compiling matmul.cpp
build	build	2026-09-06T05:37:06.0267680Z [120/229] Compiling masked_mm.cpp
build	build	2026-09-06T05:37:06.2031610Z [121/229] Compiling luf.cpp
build	build	2026-09-06T05:37:06.7276620Z [122/229] Compiling logsumexp.cpp
build	build	2026-09-06T05:37:06.8792830Z [123/229] Compiling jit_compiler.cpp
build	build	2026-09-06T05:37:08.3064100Z [124/229] Compiling inverse.cpp
build	build	2026-09-06T05:37:08.4292250Z [125/229] Compiling hadamard.cpp
build	build	2026-09-06T05:37:09.8254850Z [126/229] Compiling cblas.cpp
build	build	2026-09-06T05:37:09.9612570Z [127/229] Compiling bnns.cpp
build	build	2026-09-06T05:37:11.4923300Z [128/229] Compiling eval.cpp
build	build	2026-09-06T05:37:12.5378670Z [129/229] Compiling encoder.cpp
build	build	2026-09-06T05:37:14.7794540Z [130/229] Compiling eigh.cpp
build	build	2026-09-06T05:37:15.2284360Z [131/229] Compiling fft.cpp
build	build	2026-09-06T05:37:16.3512190Z [132/229] Compiling distributed.cpp
build	build	2026-09-06T05:37:16.8882260Z [133/229] Compiling device_info.cpp
build	build	2026-09-06T05:37:17.1405410Z [134/229] Compiling eig.cpp
build	build	2026-09-06T05:37:21.8303230Z [135/229] Compiling conv.cpp
build	build	2026-09-06T05:37:24.5149250Z [136/229] Compiling cholesky.cpp
build	build	2026-09-06T05:37:38.2948920Z [137/229] Compiling copy.cpp
build	build	2026-09-06T05:37:40.9690620Z [138/229] Compiling arg_reduce.cpp
build	build	2026-09-06T05:37:42.0574220Z [139/229] Compiling utils.cpp
build	build	2026-09-06T05:37:43.1300800Z [140/229] Compiling slicing.cpp
build	build	2026-09-06T05:37:44.3226400Z [141/229] Compiling reduce.cpp
build	build	2026-09-06T05:37:45.7000210Z [142/229] Compiling indexing.cpp
build	build	2026-09-06T05:37:46.0007860Z [143/229] Compiling load.cpp
build	build	2026-09-06T05:37:47.4467180Z [144/229] Compiling compiled.cpp
build	build	2026-09-06T05:37:47.4969580Z [145/229] Compiling common.cpp
build	build	2026-09-06T05:37:48.2709310Z [146/229] Compiling broadcasting.cpp
build	build	2026-09-06T05:37:48.2977360Z [147/229] Compiling utils.cpp
build	build	2026-09-06T05:37:48.3222410Z [148/229] Compiling unary_ops.cpp
build	build	2026-09-06T05:37:48.3473350Z [149/229] Compiling unary.cpp
build	build	2026-09-06T05:37:48.3691060Z [150/229] Compiling ternary_ops.cpp
build	build	2026-09-06T05:37:48.3914600Z [151/229] Compiling ternary.cpp
build	build	2026-09-06T05:37:48.4143830Z [152/229] Compiling steel_gemm_splitk_nax.cpp
build	build	2026-09-06T05:37:48.4364710Z [153/229] Compiling steel_gemm_splitk.cpp
build	build	2026-09-06T05:37:48.4581750Z [154/229] Compiling steel_gemm_segmented.cpp
build	build	2026-09-06T05:37:48.4798550Z [155/229] Compiling steel_gemm_masked.cpp
build	build	2026-09-06T05:37:48.5007540Z [156/229] Compiling steel_gemm_gather_nax.cpp
build	build	2026-09-06T05:37:48.5225940Z [157/229] Compiling steel_gemm_gather.cpp
build	build	2026-09-06T05:37:48.5435250Z [158/229] Compiling steel_gemm_fused_nax.cpp
build	build	2026-09-06T05:37:48.5645360Z [159/229] Compiling steel_gemm_fused.cpp
build	build	2026-09-06T05:37:48.5859960Z [160/229] Compiling steel_conv_general.cpp
build	build	2026-09-06T05:37:48.6067250Z [161/229] Compiling steel_conv_3d.cpp
build	build	2026-09-06T05:37:48.6269440Z [162/229] Compiling steel_conv.cpp
build	build	2026-09-06T05:37:48.6486780Z [163/229] Compiling steel_attention_nax.cpp
build	build	2026-09-06T05:37:48.6733520Z [164/229] Compiling steel_attention.cpp
build	build	2026-09-06T05:37:48.6952990Z [165/229] Compiling sort.cpp
build	build	2026-09-06T05:37:48.7191670Z [166/229] Compiling softmax.cpp
build	build	2026-09-06T05:37:48.7408520Z [167/229] Compiling scatter_axis.cpp
build	build	2026-09-06T05:37:48.7671910Z [168/229] Compiling scatter.cpp
build	build	2026-09-06T05:37:48.7916250Z [169/229] Compiling scan.cpp
build	build	2026-09-06T05:37:48.8129050Z [170/229] Compiling reduce_utils.cpp
build	build	2026-09-06T05:37:48.8345150Z [171/229] Compiling reduce.cpp
build	build	2026-09-06T05:37:48.8556940Z [172/229] Compiling quantized_utils.cpp
build	build	2026-09-06T05:37:48.8769010Z [173/229] Compiling quantized_nax.cpp
build	build	2026-09-06T05:37:48.8977550Z [174/229] Compiling quantized.cpp
build	build	2026-09-06T05:37:48.9186650Z [175/229] Compiling masked_scatter.cpp
build	build	2026-09-06T05:37:48.9392430Z [176/229] Compiling logsumexp.cpp
build	build	2026-09-06T05:37:48.9595790Z [177/229] Compiling hadamard.cpp
build	build	2026-09-06T05:37:48.9817120Z [178/229] Compiling gemv_masked.cpp
build	build	2026-09-06T05:37:49.0030010Z [179/229] Compiling gemm_nax.cpp
build	build	2026-09-06T05:37:49.0239210Z [180/229] Compiling gemm.cpp
build	build	2026-09-06T05:37:49.0448670Z [181/229] Compiling gather_front.cpp
build	build	2026-09-06T05:37:49.0666080Z [182/229] Compiling gather_axis.cpp
build	build	2026-09-06T05:37:49.0876870Z [183/229] Compiling gather.cpp
build	build	2026-09-06T05:37:49.1091830Z [184/229] Compiling fp_quantized_nax.cpp
build	build	2026-09-06T05:37:49.1306000Z [185/229] Compiling fp_quantized.cpp
build	build	2026-09-06T05:37:49.1518990Z [186/229] Compiling fft.cpp
build	build	2026-09-06T05:37:49.1730250Z [187/229] Compiling copy.cpp
build	build	2026-09-06T05:37:49.1943030Z [188/229] Compiling conv.cpp
build	build	2026-09-06T05:37:49.2154890Z [189/229] Compiling compiled_preamble.cpp
build	build	2026-09-06T05:37:49.2359340Z [190/229] Compiling binary_two.cpp
build	build	2026-09-06T05:37:49.2559760Z [191/229] Compiling binary_ops.cpp
build	build	2026-09-06T05:37:49.2762650Z [192/229] Compiling binary.cpp
build	build	2026-09-06T05:37:49.2962340Z [193/229] Compiling arange.cpp
build	build	2026-09-06T05:37:49.4232520Z [194/229] Compiling array.cpp
build	build	2026-09-06T05:37:50.6889490Z [195/229] Compiling version.cpp
build	build	2026-09-06T05:37:51.7987960Z [196/229] Compiling compiled_conditional.cpp
build	build	2026-09-06T05:37:52.4920230Z [197/229] Compiling vector.cpp
build	build	2026-09-06T05:37:53.1612740Z [198/229] Compiling transforms_impl.cpp
build	build	2026-09-06T05:37:54.0900840Z [199/229] Compiling transforms.cpp
build	build	2026-09-06T05:37:54.8109530Z [200/229] Compiling string.cpp
build	build	2026-09-06T05:37:55.5475480Z [201/229] Compiling stream.cpp
build	build	2026-09-06T05:37:56.4627080Z [202/229] Compiling random.cpp
build	build	2026-09-06T05:37:58.1597480Z [203/229] Compiling metal.cpp
build	build	2026-09-06T05:37:58.8384550Z [204/229] Compiling ops.cpp
build	build	2026-09-06T05:37:59.5634770Z [205/229] Compiling memory.cpp
build	build	2026-09-06T05:38:00.8243990Z [206/229] Compiling map.cpp
build	build	2026-09-06T05:38:01.2771470Z [207/229] Compiling linalg.cpp
build	build	2026-09-06T05:38:02.0768220Z [208/229] Compiling io_types.cpp
build	build	2026-09-06T05:38:02.7117420Z [209/229] Compiling io.cpp
build	build	2026-09-06T05:38:03.4277980Z [210/229] Compiling fft.cpp
build	build	2026-09-06T05:38:04.3124330Z [211/229] Compiling fast.cpp
build	build	2026-09-06T05:38:04.6917680Z [212/229] Compiling export.cpp
build	build	2026-09-06T05:38:04.8023830Z [213/229] Compiling error.cpp
build	build	2026-09-06T05:38:06.0884690Z [214/229] Compiling cuda.cpp
build	build	2026-09-06T05:38:06.2931550Z [215/229] Compiling device.cpp
build	build	2026-09-06T05:38:07.2623220Z [216/229] Compiling compile.cpp
build	build	2026-09-06T05:38:08.0008800Z [217/229] Compiling closure.cpp
build	build	2026-09-06T05:38:09.8102160Z [218/229] Compiling Cmlx.m
build	build	2026-09-06T05:38:11.1450440Z [219/229] Compiling array.cpp
build	build	2026-09-06T05:38:11.5672320Z [220/229] Compiling CSlotpack slotpack.c
build	build	2026-09-06T05:38:11.5700590Z [221/229] Write sources
build	build	2026-09-06T05:38:12.5449360Z [223/230] Compiling format.cc
build	build	2026-09-06T05:38:13.0576520Z [225/230] Compiling ArgumentParserToolInfo ToolInfo.swift
build	build	2026-09-06T05:38:22.1560940Z [225/231] Compiling binary.cpp
build	build	2026-09-06T05:38:27.3155850Z [227/232] Compiling ArgumentParser BashCompletionsGenerator.swift
build	build	2026-09-06T05:38:37.0006610Z [228/232] Compiling MLX ArrayAt.swift
build	build	2026-09-06T05:38:37.2731460Z [229/234] Compiling MLXFast MLXFast.swift
build	build	2026-09-06T05:38:44.8124670Z [230/234] Compiling MLXNN Activations.swift
build	build	2026-09-06T05:39:28.9214990Z [231/235] Compiling Slotstream Checkpoint.swift
build	build	2026-09-06T05:39:28.9277430Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
build	build	2026-09-06T05:39:28.9278930Z 34 |         lock.lock()
build	build	2026-09-06T05:39:28.9279550Z 35 |         defer { lock.unlock() }
build	build	2026-09-06T05:39:28.9282060Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
build	build	2026-09-06T05:39:28.9289910Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
build	build	2026-09-06T05:39:28.9291880Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
build	build	2026-09-06T05:39:28.9318270Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
build	build	2026-09-06T05:39:35.1960700Z [232/236] Compiling SlotstreamDiagnostics CheckReport.swift
build	build	2026-09-06T05:39:44.1490660Z [233/238] Compiling SlotstreamTestKit Catalogue.swift
build	build	2026-09-06T05:39:45.0642710Z [234/239] Compiling slotstream_cli CheckRendering.swift
build	build	2026-09-06T05:39:45.0707300Z [234/239] Write Objects.LinkFileList
build	build	2026-09-06T05:39:45.7670970Z [236/239] Compiling slotstream_checks main.swift
build	build	2026-09-06T05:39:45.7800620Z [236/239] Write Objects.LinkFileList
build	build	2026-09-06T05:39:54.8234080Z [237/239] Linking slotstream-checks
build	build	2026-09-06T05:39:54.9772790Z [238/239] Linking slotstream
build	build	2026-09-06T05:39:55.0017340Z Build complete! (338.77s)
build	smoke	﻿2026-09-06T05:39:55.1783100Z ##[group]Run V=$(.build/release/slotstream --version)
build	smoke	2026-09-06T05:39:55.1783830Z ^[[36;1mV=$(.build/release/slotstream --version)^[[0m
build	smoke	2026-09-06T05:39:55.1784280Z ^[[36;1mecho "binary $V, tag $GITHUB_REF_NAME"^[[0m
build	smoke	2026-09-06T05:39:55.1784620Z ^[[36;1m[ "v$V" = "$GITHUB_REF_NAME" ]^[[0m
build	smoke	2026-09-06T05:39:55.2314070Z shell: /bin/bash -e {0}
build	smoke	2026-09-06T05:39:55.2314430Z ##[endgroup]
build	smoke	2026-09-06T05:39:55.5575400Z binary 0.2.10, tag v0.2.10
build	pinned dbmd (the brain gates inside static_gates.sh need it)	﻿2026-09-06T05:39:55.5768470Z ##[group]Run Tools/dbmd_install.sh
build	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T05:39:55.5776280Z ^[[36;1mTools/dbmd_install.sh^[[0m
build	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T05:39:55.5909840Z shell: /bin/bash -e {0}
build	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T05:39:55.5910310Z ##[endgroup]
build	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T05:39:56.3263130Z installed dbmd 0.13.4 to /Users/runner/.dbmd/bin/dbmd
build	static gates — planner, brain, installer (no weights needed)	﻿2026-09-06T05:39:56.3451010Z ##[group]Run Tools/static_gates.sh
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:56.3451410Z ^[[36;1mTools/static_gates.sh^[[0m
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:56.3501860Z shell: /bin/bash -e {0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:56.3502350Z ##[endgroup]
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:56.9951770Z coverage ratchet checks pass
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.0936640Z llms-full.txt is current
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.3162010Z 0 issue(s): 0 error(s), 0 warning(s), 0 info
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.3604200Z MEASUREMENTS.md is current
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.3604760Z PLAN.md is current
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.4172570Z claims gate: 84 needle checks, 0 failures
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.4205290Z BRAIN GATES PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5088840Z dequant_row.txt: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5139000Z layer_0.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5216980Z layer_1.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5271590Z layer_2.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5316130Z layer_3.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5316890Z ngram_ids.txt: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5318720Z tokens.txt: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5668110Z PASS  process physical footprint is readable
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5670680Z PASS  process RSS high-water is readable
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5672310Z PASS  prefix cache reaches its four-entry bound
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5672750Z PASS  an identical history replaces instead of duplicating an entry
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5673150Z PASS  a miss evicts before allocating a fifth state
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5673510Z PASS  a smaller live token ceiling evicts immediately
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5674480Z PASS  held GB includes fixed recurrent state
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5674750Z PASS  identical bytes hash alike
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5674960Z PASS  different bytes do not
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5675180Z PASS  the same image at the same offset matches
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5675510Z PASS  a swapped image does not
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5675860Z PASS  an entry ending inside a run still matches that run
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5676210Z PASS  a text-only entry rejects a prompt with an image inside its range
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5676580Z PASS  an image beyond the entry's range is irrelevant to the match
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5676910Z PASS  a vision conversation is held, not discarded
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5677180Z PASS  the same ids with a different picture miss
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5677460Z PASS  the text-only splice never sees a vision entry
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5677780Z PASS  prefix splice chooses the longest retained extension
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5678190Z PASS  prefix splice is strict, not an identical-history match
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5678530Z PASS  prefix splice lookup does not consume the retained state
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5678840Z PASS  a disabled prefix cache offers no splice
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5679120Z PASS  shard listing works through a symlinked model dir
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5679420Z PASS  8.1 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5679650Z PASS  10.0 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5679950Z PASS  16.0 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5680180Z PASS  30.0 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.5680390Z RUNTIME CHECK PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6017140Z PASS  matching file is accepted
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6030910Z PASS  same-size corruption is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6037040Z PASS  exact Content-Range is accepted
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6094550Z PASS  wrong range start is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6095600Z PASS  wrong range total is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6096630Z PASS  unknown range total is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6097120Z PASS  every pinned file has a digest
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6097480Z PASS  the draft head is pinned as the one optional file
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6098090Z PASS  an absent optional file is not a repair; an absent required one is
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6098540Z PASS  an empty directory reads as missing
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6098900Z PASS  missing needs the required model
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6099210Z PASS  status carries free disk
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6099590Z PASS  bytesToFetch agrees with required files
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6100000Z PASS  a missing copy is not ready
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:39:57.6100390Z PULL CHECK PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:40:07.6614570Z {"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:40:22.8761690Z MANIFEST CHECKS PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.2060500Z {"name": "normal", "pass_": true, "seconds": 0.11, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.3152350Z {"name": "redirect", "pass_": true, "seconds": 0.111, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.4166880Z {"name": "bad-object-fallback", "pass_": true, "seconds": 0.1, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.5321090Z {"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.116, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.5639150Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.032, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.6022720Z {"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.038, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.7343930Z {"name": "optional-absent", "pass_": true, "seconds": 0.132, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.9028990Z {"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.168, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:08.9460590Z {"name": "bad-object-fails", "pass_": true, "seconds": 0.043, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:09.1111610Z {"name": "retry-after", "pass_": true, "seconds": 0.165, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:14.5087600Z {"name": "transient-retry", "pass_": true, "seconds": 5.397, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:41:26.1368450Z {"name": "wrong-length-fallback", "pass_": true, "seconds": 11.628, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:02.3163220Z {"name": "short-body-fallback", "pass_": true, "seconds": 36.179, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:38.2068650Z {"name": "content-encoding-fallback", "pass_": true, "seconds": 35.89, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:39.7566200Z {"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.549, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:39.8640150Z {"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.088, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:39.9493280Z {"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.085, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.0317730Z {"name": "resume", "pass_": true, "seconds": 0.082, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.0570430Z {"name": "already-installed", "pass_": true, "seconds": 0.025, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.0828080Z {"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.025, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.1679610Z {"name": "corruption-seed", "pass_": true, "seconds": 0.085, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.1967220Z {"name": "same-size-final-repair", "pass_": true, "seconds": 0.028, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.2784190Z {"name": "invalid-resume-map", "pass_": true, "seconds": 0.081, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.3581460Z {"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.079, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.4459920Z {"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.087, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.4568900Z {"name": "part-symlink-rejected", "pass_": true, "seconds": 0.01, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.4656880Z {"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.008, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:40.4742370Z {"name": "part-fifo-rejected", "pass_": true, "seconds": 0.008, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:41.7368550Z {"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.012, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:42.2437190Z ALL HTTP CHECKS PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:54.1402620Z {"name": "raw-multichunk", "pass_": true, "seconds": 1.127, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:54.5922000Z {"name": "raw-installed-no-http", "pass_": true, "seconds": 0.452, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:55.5552050Z {"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.962, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:42:56.8873680Z {"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 1.331, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:38.7778870Z {"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 41.89, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:39.7513690Z {"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.973, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:39.7973240Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.046, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:40.3977870Z {"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.6, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:40.9388150Z {"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.54, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:44.5372960Z {"name": "raw-cancel", "pass_": true, "seconds": 3.598, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:45.3672250Z {"name": "raw-resume", "pass_": true, "seconds": 0.805, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:46.7939570Z {"name": "raw-same-size-repair", "pass_": true, "seconds": 1.425, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:43:47.3632750Z ALL RAW HTTP CHECKS PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:26.8322610Z SUSTAINED MEMORY PASS 109412352 bytes peak RSS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.4933250Z SLOTPACK GATES PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.6906820Z PASS  48GB pristine: 33.0 GB target and starts quiet
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.7346810Z PASS  48GB busy: clamped to 15.4 GB, sized-down note
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.7807620Z PASS  16GB pristine: 9.8 GB target, no notes
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.8345170Z PASS  16GB busy: floor 8.1 GB + heavy-paging warning
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.8966290Z PASS  8GB Mac: floor 8.1 GB + too-small warning
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.9465660Z PASS  128GB auto stops at the knee, not at 70% of RAM
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.9520800Z PASS  128GB explains the memory it left on the table
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:27.9982170Z PASS  128GB: --memory-gb still reaches full residency
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:28.0045740Z PASS  --sim-ram alone plans instead of erroring
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:28.0475750Z PASS  --max-ram-percent lowers the auto target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:28.0905300Z PASS  --max-ram-percent cannot exceed the knee
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:28.1283910Z PASS  --max-ram-percent 0 refused
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:28.1651320Z PASS  --max-ram-percent 150 refused
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:28.2062890Z PASS  --max-ram-percent noted when outranked
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.3402180Z PASS  more memory never plans slower (7-90 GB sweep)
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.3852190Z PASS  explicit 30GB on busy 48: honored + info note
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.4203980Z PASS  --experts-per-layer 0 refused
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.4556170Z PASS  --pool-gb 0 refused
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.4906020Z PASS  --memory-gb below minimum refused
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.5281010Z PASS  --memory-gb inf is a clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.5641340Z PASS  --pool-gb inf is a clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.5995080Z PASS  --pool-gb 1e300 saturates safely instead of trapping
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.6359570Z PASS  --memory-gb 1e300 plans safely instead of trapping
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.7048730Z PASS  huge finite memory plan remains valid JSON
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.7409640Z PASS  --sim-ram inf is a clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.7767070Z PASS  --sim-working-set inf is a clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.8123900Z PASS  --sim-available inf is a clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.8551800Z PASS  tiny pool raised to the floor, consistently
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.8966890Z PASS  knob precedence noted, never silent
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:31.9800870Z PASS  --model with no safetensors: clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.0369990Z PASS  --model with no safetensors: names the fix
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.0837820Z PASS  MTP auto on a big quiet machine: knee + head = 34.6
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.1241070Z PASS  MTP auto stays off on a 16GB machine
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.1646420Z PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.2065100Z PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.2477010Z PASS  --mtp on forces the head onto a small machine
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.2893310Z PASS  --mtp off suppresses it everywhere
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.3256330Z PASS  --mtp on without mtp.safetensors is a clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.3621780Z PASS  --mtp on cannot squeeze under the minimum target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.3987920Z PASS  --mtp gibberish refused
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.4432760Z PASS  MTP charge visible in json peak
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.5095170Z PASS  --model with unparseable config: clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.5730160Z PASS  invalid config arithmetic is rejected before it traps
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.6474340Z PASS  --model with a corrupt safetensors header
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.7378590Z PASS  safetensors dtype/shape byte mismatch rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.8248720Z PASS  safetensors header over 100MB rejected before allocation
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.9165380Z PASS  --model with a different model's tensors
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.9370250Z PASS  serve --max-context 0 refused before load
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.9434930Z PASS  plan announces the context cap and the wait
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:32.9848270Z PASS  doctor --json carries max_context_tokens + wait
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.0062700Z PASS  serve --max-context above the ceiling names the ceiling, not a knob
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.0765040Z PASS  doctor --max-context above the ceiling is the same clean error
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.1200450Z PASS  a lower --max-context caps the reuse ceiling too
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.1531410Z PASS  prefill-schedule: bounded, floored, monotone
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.2467450Z PASS  prefill-schedule agrees with the doctor wait for the same pass
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.2779130Z PASS  prefill-schedule: a prefix hit reads only what is new
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.2970270Z PASS  prefill-schedule --chunk 0 refused
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.3171350Z PASS  context-check --tokens 4 refused before load
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.3362440Z PASS  parity rejects an invalid layer count before model load
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.3557930Z PASS  parity rejects malformed token ids without trapping
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.3758730Z PASS  n-gram golden rejects malformed token ids without trapping
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.3952030Z PASS  dequant golden rejects a negative row before model load
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.4149880Z PASS  sampler golden rejects an empty vocabulary without trapping
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.4332750Z PASS  sampler golden rejects a negative draw count without trapping
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:33.4333410Z planner: passed 64, failed 0
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:36.6600980Z 
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:36.6602340Z ######################################################################## 100.0%
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:37.2782550Z 
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:37.2783300Z ######################################################################## 100.0%
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:38.7271740Z 
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:38.7272730Z ######################################################################## 100.0%
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:39.2846310Z INSTALLER GATES PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:44:39.2941460Z STATIC GATES PASS
build	sampler golden + governor policy (no weights needed)	﻿2026-09-06T05:44:39.3198130Z ##[group]Run python3 -m pip install --quiet --break-system-packages numpy
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:39.3201070Z ^[[36;1mpython3 -m pip install --quiet --break-system-packages numpy^[[0m
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:39.3201460Z ^[[36;1mTools/sampler_gates.sh^[[0m
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:39.3470700Z shell: /bin/bash -e {0}
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:39.3471110Z ##[endgroup]
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:44.7841160Z PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:45.0004660Z PASS  sampler == numpy reference: greedy (temperature 0)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:45.2288290Z PASS  sampler == numpy reference: pure sampling, no filters
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:45.5626090Z PASS  sampler == numpy reference: top-k 1 (degenerate)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:45.8422140Z PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:46.2314950Z PASS  sampler == numpy reference: min-p 0.3
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:46.6842650Z PASS  sampler == numpy reference: presence penalty, accumulating
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:46.9096240Z PASS  sampler == numpy reference: greedy + penalty (API temp-0)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:47.4127560Z PASS  sampler == numpy reference: vocab 4096
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:48.3848730Z PASS  sampler == numpy reference: real vocab (248,320)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:48.6796740Z PASS  sampler == numpy reference: top-p 0 (sanitizer)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:49.0580800Z PASS  sampler == numpy reference: min-p 5 (sanitizer)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:49.3955140Z PASS  sampler == numpy reference: seed 0 (remapped)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:49.7606970Z PASS  sampler == numpy reference: high temp, large vocab
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:50.3971470Z PASS  seeded sampling is reproducible and seed-sensitive
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:50.4179270Z PASS  elastic governor policy (20 branches)
build	sampler golden + governor policy (no weights needed)	2026-09-06T05:44:50.4204030Z sampler + governor: passed 16, failed 0
build	package	﻿2026-09-06T05:44:50.4254670Z ##[group]Run mkdir dist
build	package	2026-09-06T05:44:50.4254920Z ^[[36;1mmkdir dist^[[0m
build	package	2026-09-06T05:44:50.4255420Z ^[[36;1mtar -czf dist/slotstream-arm64.tar.gz -C .build/release slotstream mlx.metallib^[[0m
build	package	2026-09-06T05:44:50.4256000Z ^[[36;1m(cd dist && shasum -a 256 slotstream-arm64.tar.gz > slotstream-arm64.tar.gz.sha256)^[[0m
build	package	2026-09-06T05:44:50.4256390Z ^[[36;1mcat dist/slotstream-arm64.tar.gz.sha256^[[0m
build	package	2026-09-06T05:44:50.4289370Z shell: /bin/bash -e {0}
build	package	2026-09-06T05:44:50.4289580Z ##[endgroup]
build	package	2026-09-06T05:44:53.5101840Z d914dbbe362342b32fa23edf6c2192eccf27f8698ad1a7ba7881c0bc6a6d4c74  slotstream-arm64.tar.gz
build	attest provenance	﻿2026-09-06T05:44:53.5303470Z ##[group]Run actions/attest-build-provenance@v4
build	attest provenance	2026-09-06T05:44:53.5303750Z with:
build	attest provenance	2026-09-06T05:44:53.5303940Z   subject-path: dist/slotstream-arm64.tar.gz
build	attest provenance	2026-09-06T05:44:53.5304190Z   push-to-registry: false
build	attest provenance	2026-09-06T05:44:53.5304430Z   create-storage-record: true
build	attest provenance	2026-09-06T05:44:53.5304640Z   show-summary: true
build	attest provenance	2026-09-06T05:44:53.5306800Z   github-token: ***
build	attest provenance	2026-09-06T05:44:53.5307030Z ##[endgroup]
build	attest provenance	2026-09-06T05:44:53.5410660Z ##[start-action display=Attest;id=__actions_attest-build-provenance.attest]
build	attest provenance	2026-09-06T05:44:53.5475320Z ##[group]Run actions/attest@508db95dd578ae2727ebd6217d5ba78e4fbda05d
build	attest provenance	2026-09-06T05:44:53.5475720Z with:
build	attest provenance	2026-09-06T05:44:53.5475950Z   subject-path: dist/slotstream-arm64.tar.gz
build	attest provenance	2026-09-06T05:44:53.5476280Z   push-to-registry: false
build	attest provenance	2026-09-06T05:44:53.5476470Z   create-storage-record: true
build	attest provenance	2026-09-06T05:44:53.5476710Z   show-summary: true
build	attest provenance	2026-09-06T05:44:53.5479150Z   github-token: ***
build	attest provenance	2026-09-06T05:44:53.5479330Z env:
build	attest provenance	2026-09-06T05:44:53.5479770Z   NODE_OPTIONS: --max-http-header-size=32768
build	attest provenance	2026-09-06T05:44:53.5480370Z ##[endgroup]
build	attest provenance	2026-09-06T05:44:53.9043430Z Attestation type: Build Provenance
build	attest provenance	2026-09-06T05:45:00.4904680Z Attestation created for slotstream-arm64.tar.gz@sha256:d914dbbe362342b32fa23edf6c2192eccf27f8698ad1a7ba7881c0bc6a6d4c74
build	attest provenance	2026-09-06T05:45:00.4925020Z ##[group]^[[36mAttestation signed using certificate from Public Good Sigstore instance^[[39m
build	attest provenance	2026-09-06T05:45:00.4925640Z -----BEGIN CERTIFICATE-----
build	attest provenance	2026-09-06T05:45:00.4926020Z MIIHEzCCBpqgAwIBAgIUdFqiVM25z2xIvVnjVw+NDJK1VJcwCgYIKoZIzj0EAwMw
build	attest provenance	2026-09-06T05:45:00.4926670Z NzEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MR4wHAYDVQQDExVzaWdzdG9yZS1pbnRl
build	attest provenance	2026-09-06T05:45:00.4927230Z cm1lZGlhdGUwHhcNMjYwOTA2MDU0NDU0WhcNMjYwOTA2MDU1NDU0WjAAMFkwEwYH
build	attest provenance	2026-09-06T05:45:00.4927900Z KoZIzj0CAQYIKoZIzj0DAQcDQgAEyb9KEdlDt+UMcDTOX1q6IeeR9tTkbl80UYMV
build	attest provenance	2026-09-06T05:45:00.4928440Z rspBW84IHwb2uAf5ZrlY9Eb0yBfr4Q/ZbLkJGZ0JjPnKWh4ZKqOCBbkwggW1MA4G
build	attest provenance	2026-09-06T05:45:00.4928900Z A1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUj9CT
build	attest provenance	2026-09-06T05:45:00.4929620Z IkE83uUtnDKlQGGEZ6YFK08wHwYDVR0jBBgwFoAU39Ppz1YkEZb5qNjpKFWixi4Y
build	attest provenance	2026-09-06T05:45:00.4930060Z ZD8wZQYDVR0RAQH/BFswWYZXaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdS9z
build	attest provenance	2026-09-06T05:45:00.4930640Z bG90c3RyZWFtLy5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1sQHJlZnMvdGFn
build	attest provenance	2026-09-06T05:45:00.4931130Z cy92MC4yLjEwMDkGCisGAQQBg78wAQEEK2h0dHBzOi8vdG9rZW4uYWN0aW9ucy5n
build	attest provenance	2026-09-06T05:45:00.4931560Z aXRodWJ1c2VyY29udGVudC5jb20wEgYKKwYBBAGDvzABAgQEcHVzaDA2BgorBgEE
build	attest provenance	2026-09-06T05:45:00.4931970Z AYO/MAEDBChlZDc2NmJhYmRhMjc1YTlmMDVjZDdhN2FlZjhlYmNlYTRjODc1YjY2
build	attest provenance	2026-09-06T05:45:00.4933170Z MBUGCisGAQQBg78wAQQEB3JlbGVhc2UwIgYKKwYBBAGDvzABBQQUY2FybG9zbGZ1
build	attest provenance	2026-09-06T05:45:00.4935010Z L3Nsb3RzdHJlYW0wHwYKKwYBBAGDvzABBgQRcmVmcy90YWdzL3YwLjIuMTAwOwYK
build	attest provenance	2026-09-06T05:45:00.4935580Z KwYBBAGDvzABCAQtDCtodHRwczovL3Rva2VuLmFjdGlvbnMuZ2l0aHVidXNlcmNv
build	attest provenance	2026-09-06T05:45:00.4936100Z bnRlbnQuY29tMGcGCisGAQQBg78wAQkEWQxXaHR0cHM6Ly9naXRodWIuY29tL2Nh
build	attest provenance	2026-09-06T05:45:00.4936630Z cmxvc2xmdS9zbG90c3RyZWFtLy5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1s
build	attest provenance	2026-09-06T05:45:00.4937190Z QHJlZnMvdGFncy92MC4yLjEwMDgGCisGAQQBg78wAQoEKgwoZWQ3NjZiYWJkYTI3
build	attest provenance	2026-09-06T05:45:00.4937670Z NWE5ZjA1Y2Q3YTdhZWY4ZWJjZWE0Yzg3NWI2NjAdBgorBgEEAYO/MAELBA8MDWdp
build	attest provenance	2026-09-06T05:45:00.4938180Z dGh1Yi1ob3N0ZWQwNwYKKwYBBAGDvzABDAQpDCdodHRwczovL2dpdGh1Yi5jb20v
build	attest provenance	2026-09-06T05:45:00.4938670Z Y2FybG9zbGZ1L3Nsb3RzdHJlYW0wOAYKKwYBBAGDvzABDQQqDChlZDc2NmJhYmRh
build	attest provenance	2026-09-06T05:45:00.4939090Z Mjc1YTlmMDVjZDdhN2FlZjhlYmNlYTRjODc1YjY2MCEGCisGAQQBg78wAQ4EEwwR
build	attest provenance	2026-09-06T05:45:00.4939670Z cmVmcy90YWdzL3YwLjIuMTAwGgYKKwYBBAGDvzABDwQMDAoxMzQ5Mjg1MDU4MCwG
build	attest provenance	2026-09-06T05:45:00.4940090Z CisGAQQBg78wARAEHgwcaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdTAXBgor
build	attest provenance	2026-09-06T05:45:00.4940590Z BgEEAYO/MAERBAkMBzU5OTMxNjgwZwYKKwYBBAGDvzABEgRZDFdodHRwczovL2dp
build	attest provenance	2026-09-06T05:45:00.4941310Z dGh1Yi5jb20vY2FybG9zbGZ1L3Nsb3RzdHJlYW0vLmdpdGh1Yi93b3JrZmxvd3Mv
build	attest provenance	2026-09-06T05:45:00.4942450Z cmVsZWFzZS55bWxAcmVmcy90YWdzL3YwLjIuMTAwOAYKKwYBBAGDvzABEwQqDChl
build	attest provenance	2026-09-06T05:45:00.4943890Z ZDc2NmJhYmRhMjc1YTlmMDVjZDdhN2FlZjhlYmNlYTRjODc1YjY2MBQGCisGAQQB
build	attest provenance	2026-09-06T05:45:00.4945970Z g78wARQEBgwEcHVzaDBbBgorBgEEAYO/MAEVBE0MS2h0dHBzOi8vZ2l0aHViLmNv
build	attest provenance	2026-09-06T05:45:00.4946380Z bS9jYXJsb3NsZnUvc2xvdHN0cmVhbS9hY3Rpb25zL3J1bnMvMzQwMTQyOTcwNzcv
build	attest provenance	2026-09-06T05:45:00.4946940Z YXR0ZW1wdHMvMTAWBgorBgEEAYO/MAEWBAgMBnB1YmxpYzBSBgorBgEEAYO/MAEY
build	attest provenance	2026-09-06T05:45:00.4948300Z BEQMQnJlcG86Y2FybG9zbGZ1QDU5OTMxNjgvc2xvdHN0cmVhbUAxMzQ5Mjg1MDU4
build	attest provenance	2026-09-06T05:45:00.4949730Z OnJlZjpyZWZzL3RhZ3MvdjAuMi4xMDCBiQYKKwYBBAHWeQIEAgR7BHkAdwB1AN09
build	attest provenance	2026-09-06T05:45:00.4950910Z MGrGxxEyYxkeHJlnNwKiSl643jyt/4eKcoAvKe6OAAABoHU/jbwAAAQDAEYwRAIg
build	attest provenance	2026-09-06T05:45:00.4952800Z R4NnYdx2HSJOhYzpMPsQwGsxZJVdn/XW7g8hEqAlDsoCIHaW5MKaaotkhos3dBm4
build	attest provenance	2026-09-06T05:45:00.4954010Z FW/rZqrLyi2S5RWGKBSoos4zMAoGCCqGSM49BAMDA2cAMGQCMCfPzqjWA6+YdrdT
build	attest provenance	2026-09-06T05:45:00.4955140Z SCjDqgy7EWvvAYuwtHVRlK4axMnWcATzPLwXNtc1RmA7be/chAIwI45ShfsUvkmO
build	attest provenance	2026-09-06T05:45:00.4956160Z HbT9ATT8X862MJttKqSBwCVAZDAPqe89RB9r7wh9FSWTRXiHzo4L
build	attest provenance	2026-09-06T05:45:00.4956920Z -----END CERTIFICATE-----
build	attest provenance	2026-09-06T05:45:00.4957330Z 
build	attest provenance	2026-09-06T05:45:00.4958150Z ##[endgroup]
build	attest provenance	2026-09-06T05:45:00.4958670Z ^[[36mAttestation signature uploaded to Rekor transparency log^[[39m
build	attest provenance	2026-09-06T05:45:00.4959510Z https://search.sigstore.dev?logIndex=2734821981
build	attest provenance	2026-09-06T05:45:00.4960050Z ^[[36mAttestation uploaded to repository^[[39m
build	attest provenance	2026-09-06T05:45:00.4960600Z https://github.com/carloslfu/slotstream/attestations/45533145
build	attest provenance	2026-09-06T05:45:00.5477030Z ##[end-action id=__actions_attest-build-provenance.attest;outcome=success;conclusion=success;duration_ms=7006]
build	publish	﻿2026-09-06T05:45:00.5555850Z ##[group]Run SHA=$(cut -d' ' -f1 < dist/slotstream-arm64.tar.gz.sha256)
build	publish	2026-09-06T05:45:00.5556400Z ^[[36;1mSHA=$(cut -d' ' -f1 < dist/slotstream-arm64.tar.gz.sha256)^[[0m
build	publish	2026-09-06T05:45:00.5556830Z ^[[36;1mgh release create "$GITHUB_REF_NAME" \^[[0m
build	publish	2026-09-06T05:45:00.5557320Z ^[[36;1m  dist/slotstream-arm64.tar.gz dist/slotstream-arm64.tar.gz.sha256 \^[[0m
build	publish	2026-09-06T05:45:00.5557870Z ^[[36;1m  --title "$GITHUB_REF_NAME" \^[[0m
build	publish	2026-09-06T05:45:00.5558480Z ^[[36;1m  --notes "Built by CI from commit $GITHUB_SHA (build log: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID).^[[0m
build	publish	2026-09-06T05:45:00.5559050Z ^[[36;1m^[[0m
build	publish	2026-09-06T05:45:00.5559280Z ^[[36;1msha256: $SHA^[[0m
build	publish	2026-09-06T05:45:00.5559450Z ^[[36;1m^[[0m
build	publish	2026-09-06T05:45:00.5559890Z ^[[36;1mVerify provenance: download slotstream-arm64.tar.gz, then: gh attestation verify slotstream-arm64.tar.gz --repo $GITHUB_REPOSITORY^[[0m
build	publish	2026-09-06T05:45:00.5560470Z ^[[36;1m^[[0m
build	publish	2026-09-06T05:45:00.5560860Z ^[[36;1mInstall or upgrade: curl -fsSL https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/install.sh | sh"^[[0m
build	publish	2026-09-06T05:45:00.5620630Z shell: /bin/bash -e {0}
build	publish	2026-09-06T05:45:00.5620880Z env:
build	publish	2026-09-06T05:45:00.5623610Z   GH_TOKEN: ***
build	publish	2026-09-06T05:45:00.5623870Z ##[endgroup]
build	publish	2026-09-06T05:45:05.0474360Z https://github.com/carloslfu/slotstream/releases/tag/v0.2.10
build	Post Run actions/checkout@v7	﻿2026-09-06T05:45:05.0738810Z Post job cleanup.
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2033800Z [command]/opt/homebrew/bin/git version
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2134790Z git version 2.55.0
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2152240Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/30e738ef-a99d-483f-a16d-126b392a5643/.gitconfig'
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2159840Z Temporarily overriding HOME='/Users/runner/work/_temp/30e738ef-a99d-483f-a16d-126b392a5643' before making global git config changes
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2160980Z Adding repository directory to the temporary git global config as a safe directory
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2164350Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2276900Z Removing SSH command configuration
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2282390Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.2354290Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.3485290Z Removing HTTP extra header
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.3489860Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.3575110Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4583570Z Removing includeIf entries pointing to credentials config files
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4596770Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4660820Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4661540Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4661950Z includeif.gitdir:/github/workspace/.git.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4662350Z includeif.gitdir:/github/workspace/.git/worktrees/*.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4667850Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4738240Z /Users/runner/work/_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4752180Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path \/Users\/runner\/work\/_temp\/git\-credentials\-efdc0a92\-bcfb\-4fbc\-aea5\-09e9541c4d19\.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4831010Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4910650Z /Users/runner/work/_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.4931950Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path \/Users\/runner\/work\/_temp\/git\-credentials\-efdc0a92\-bcfb\-4fbc\-aea5\-09e9541c4d19\.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.5022050Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.5114100Z /github/runner_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.5120920Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git.path \/github\/runner_temp\/git\-credentials\-efdc0a92\-bcfb\-4fbc\-aea5\-09e9541c4d19\.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.5198770Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git/worktrees/*.path
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.5285590Z /github/runner_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.5291460Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git/worktrees/*.path \/github\/runner_temp\/git\-credentials\-efdc0a92\-bcfb\-4fbc\-aea5\-09e9541c4d19\.config
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.5368970Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
build	Post Run actions/checkout@v7	2026-09-06T05:45:05.6300860Z Removing credentials config '/Users/runner/work/_temp/git-credentials-efdc0a92-bcfb-4fbc-aea5-09e9541c4d19.config'
build	Complete job	﻿2026-09-06T05:45:05.6389830Z Cleaning up orphan processes
```

## Main CI raw log

Local log SHA-256: `eb7122d584352d4840254caf972df204f8eb08cb595de60c48375512ddb041c2`

```text
weights-free	Set up job	﻿2026-09-06T06:08:15.8846750Z Current runner version: '2.337.0'
weights-free	Set up job	2026-09-06T06:08:15.8865570Z ##[group]Runner Image Provisioner
weights-free	Set up job	2026-09-06T06:08:15.8866130Z Hosted Compute Agent
weights-free	Set up job	2026-09-06T06:08:15.8866490Z Version: 20260828.587
weights-free	Set up job	2026-09-06T06:08:15.8866880Z Commit: abac92662cab4cc7352de4f9f9d2e2419aad9c29
weights-free	Set up job	2026-09-06T06:08:15.8867340Z Build Date: 2026-08-28T16:44:25Z
weights-free	Set up job	2026-09-06T06:08:15.8867760Z Worker ID: {4858427e-db3f-4b79-85b3-1eef81bf5cd8}
weights-free	Set up job	2026-09-06T06:08:15.8868200Z Azure Region: westus
weights-free	Set up job	2026-09-06T06:08:15.8868560Z ##[endgroup]
weights-free	Set up job	2026-09-06T06:08:15.8869430Z ##[group]Operating System
weights-free	Set up job	2026-09-06T06:08:15.8869810Z macOS
weights-free	Set up job	2026-09-06T06:08:15.8870130Z 26.6.2
weights-free	Set up job	2026-09-06T06:08:15.8870450Z 25G83
weights-free	Set up job	2026-09-06T06:08:15.8870770Z ##[endgroup]
weights-free	Set up job	2026-09-06T06:08:15.8871110Z ##[group]Runner Image
weights-free	Set up job	2026-09-06T06:08:15.8871480Z Image: macos-26-arm64
weights-free	Set up job	2026-09-06T06:08:15.8871840Z Version: 20260831.0337.3
weights-free	Set up job	2026-09-06T06:08:15.8872630Z Included Software: https://github.com/actions/runner-images/blob/macos-26-arm64/20260831.0337/images/macos/macos-26-arm64-Readme.md
weights-free	Set up job	2026-09-06T06:08:15.8873840Z Image Release: https://github.com/actions/runner-images/releases/tag/macos-26-arm64%2F20260831.0337
weights-free	Set up job	2026-09-06T06:08:15.8874480Z ##[endgroup]
weights-free	Set up job	2026-09-06T06:08:15.8875200Z ##[group]GITHUB_TOKEN Permissions
weights-free	Set up job	2026-09-06T06:08:15.8876470Z Contents: read
weights-free	Set up job	2026-09-06T06:08:15.8876900Z Metadata: read
weights-free	Set up job	2026-09-06T06:08:15.8877330Z ##[endgroup]
weights-free	Set up job	2026-09-06T06:08:15.8878920Z Secret source: Actions
weights-free	Set up job	2026-09-06T06:08:15.8879570Z Prepare workflow directory
weights-free	Set up job	2026-09-06T06:08:15.9103680Z Prepare all required actions
weights-free	Set up job	2026-09-06T06:08:15.9137300Z Getting action download info
weights-free	Set up job	2026-09-06T06:08:16.2058890Z Download action repository 'actions/checkout@v7' (SHA:3d3c42e5aac5ba805825da76410c181273ba90b1)
weights-free	Set up job	2026-09-06T06:08:16.4411920Z Download action repository 'actions/upload-artifact@v4' (SHA:ea165f8d65b6e75b540449e92b4886f43607fa02)
weights-free	Set up job	2026-09-06T06:08:16.6275360Z Complete job name: weights-free
weights-free	Run actions/checkout@v7	﻿2026-09-06T06:08:16.6716000Z ##[group]Run actions/checkout@v7
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6716630Z with:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6717140Z   repository: carloslfu/slotstream
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6719970Z   token: ***
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6720290Z   ssh-strict: true
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6720670Z   ssh-user: git
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6721040Z   persist-credentials: true
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6721390Z   clean: true
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6721730Z   sparse-checkout-cone-mode: true
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6722120Z   fetch-depth: 1
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6722450Z   fetch-tags: false
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6722770Z   show-progress: true
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6723080Z   lfs: false
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6723430Z   submodules: false
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6723810Z   set-safe-directory: true
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6724190Z   allow-unsafe-pr-checkout: false
weights-free	Run actions/checkout@v7	2026-09-06T06:08:16.6724780Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1365550Z Syncing repository: carloslfu/slotstream
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1367350Z ##[group]Getting Git version info
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1367910Z Working directory is '/Users/runner/work/slotstream/slotstream'
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1370120Z [command]/opt/homebrew/bin/git version
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1689000Z git version 2.55.0
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1704610Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1710390Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/4cb7e288-88e6-40ff-a870-d4e83b063c1a/.gitconfig'
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1716610Z Temporarily overriding HOME='/Users/runner/work/_temp/4cb7e288-88e6-40ff-a870-d4e83b063c1a' before making global git config changes
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1719580Z Adding repository directory to the temporary git global config as a safe directory
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1721960Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1847120Z Deleting the contents of '/Users/runner/work/slotstream/slotstream'
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1851130Z ##[group]Determining repository object format
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1852110Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1852760Z ##[group]Initializing the repository
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.1855360Z [command]/opt/homebrew/bin/git init /Users/runner/work/slotstream/slotstream
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2094340Z hint: Using 'master' as the name for the initial branch. This default branch name
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2095460Z hint: will change to "main" in Git 3.0. To configure the initial branch name
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2096250Z hint: to use in all of your new repositories, which will suppress this warning,
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2097620Z hint: call:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2098030Z hint:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2098500Z hint: 	git config --global init.defaultBranch <name>
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2098990Z hint:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2099430Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2100250Z hint: 'development'. The just-created branch can be renamed via this command:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2101220Z hint:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2101680Z hint: 	git branch -m <name>
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2102050Z hint:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2102520Z hint: Disable this message with "git config set advice.defaultBranchName false"
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2103290Z Initialized empty Git repository in /Users/runner/work/slotstream/slotstream/.git/
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2104750Z [command]/opt/homebrew/bin/git remote add origin https://github.com/carloslfu/slotstream
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2185910Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2186610Z ##[group]Disabling automatic garbage collection
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2189880Z [command]/opt/homebrew/bin/git config --local gc.auto 0
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2262050Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2262870Z ##[group]Setting up auth
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2263320Z Removing SSH command configuration
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2265790Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.2339830Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.3495120Z Removing HTTP extra header
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.3497880Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.3569360Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.4340380Z Removing includeIf entries pointing to credentials config files
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.4344010Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.4408850Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.5924680Z [command]/opt/homebrew/bin/git config --file /Users/runner/work/_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config http.https://github.com/.extraheader AUTHORIZATION: basic ***
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.5928850Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git.path /Users/runner/work/_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.5933870Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path /Users/runner/work/_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.5937200Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git.path /github/runner_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.6000670Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git/worktrees/*.path /github/runner_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.6065040Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.6065760Z ##[group]Fetching the repository
weights-free	Run actions/checkout@v7	2026-09-06T06:08:17.6069560Z [command]/opt/homebrew/bin/git -c protocol.version=2 fetch --no-tags --prune --no-recurse-submodules --depth=1 origin +21758f59d38bef69fe383be83f3a144e0c2350a6:refs/remotes/origin/main
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6521330Z From https://github.com/carloslfu/slotstream
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6522780Z  * [new ref]         21758f59d38bef69fe383be83f3a144e0c2350a6 -> origin/main
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6527920Z [command]/opt/homebrew/bin/git branch --list --remote origin/main
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6602460Z   origin/main
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6608730Z [command]/opt/homebrew/bin/git rev-parse refs/remotes/origin/main
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6661560Z 21758f59d38bef69fe383be83f3a144e0c2350a6
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6664870Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6665690Z ##[group]Determining the checkout info
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6666640Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6667640Z [command]/opt/homebrew/bin/git sparse-checkout disable
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6742210Z [command]/opt/homebrew/bin/git config --local --unset-all extensions.worktreeConfig
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6807040Z ##[group]Checking out the ref
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.6809120Z [command]/opt/homebrew/bin/git checkout --progress --force -B main refs/remotes/origin/main
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.7464500Z Switched to a new branch 'main'
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.7476530Z branch 'main' set up to track 'origin/main'.
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.7481950Z ##[endgroup]
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.7564760Z [command]/opt/homebrew/bin/git log -1 --format=%H
weights-free	Run actions/checkout@v7	2026-09-06T06:08:18.7629660Z 21758f59d38bef69fe383be83f3a144e0c2350a6
weights-free	toolchain	﻿2026-09-06T06:08:18.7819430Z ##[group]Run sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
weights-free	toolchain	2026-09-06T06:08:18.7820540Z ^[[36;1msudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"^[[0m
weights-free	toolchain	2026-09-06T06:08:18.7860300Z shell: /bin/bash -e {0}
weights-free	toolchain	2026-09-06T06:08:18.7861020Z ##[endgroup]
weights-free	pinned Metal library	﻿2026-09-06T06:08:18.8794360Z ##[group]Run SLOTSTREAM_METALLIB_MACOS=26 Tools/fetch_metallib.sh
weights-free	pinned Metal library	2026-09-06T06:08:18.8795550Z ^[[36;1mSLOTSTREAM_METALLIB_MACOS=26 Tools/fetch_metallib.sh^[[0m
weights-free	pinned Metal library	2026-09-06T06:08:18.8829790Z shell: /bin/bash -e {0}
weights-free	pinned Metal library	2026-09-06T06:08:18.8830620Z ##[endgroup]
weights-free	pinned Metal library	2026-09-06T06:08:18.9376690Z downloading mlx_metal-0.31.1-py3-none-macosx_26_0_arm64.whl (about 50 MB)
weights-free	pinned Metal library	2026-09-06T06:08:19.0555240Z 
weights-free	pinned Metal library	2026-09-06T06:08:19.1660810Z #                                                                          1.6%
weights-free	pinned Metal library	2026-09-06T06:08:19.2589630Z #########################                                                 35.6%
weights-free	pinned Metal library	2026-09-06T06:08:19.3421640Z ################################################                          67.2%
weights-free	pinned Metal library	2026-09-06T06:08:19.3423340Z ######################################################################## 100.0%
weights-free	pinned Metal library	2026-09-06T06:08:20.3852560Z ok: Tools/lib/mlx-0.31.1.metallib
weights-free	release build	﻿2026-09-06T06:08:20.4069790Z ##[group]Run make build
weights-free	release build	2026-09-06T06:08:20.4070010Z ^[[36;1mmake build^[[0m
weights-free	release build	2026-09-06T06:08:20.4101340Z shell: /bin/bash -e {0}
weights-free	release build	2026-09-06T06:08:20.4101550Z ##[endgroup]
weights-free	release build	2026-09-06T06:08:21.9178910Z swift build -c release
weights-free	release build	2026-09-06T06:08:31.1219640Z Fetching https://github.com/apple/swift-collections.git
weights-free	release build	2026-09-06T06:08:31.1220390Z Fetching https://github.com/apple/swift-numerics
weights-free	release build	2026-09-06T06:08:31.8210820Z [1/6586] Fetching swift-numerics
weights-free	release build	2026-09-06T06:08:32.0397390Z [2702/33722] Fetching swift-numerics, swift-collections
weights-free	release build	2026-09-06T06:08:32.9149930Z Fetched https://github.com/apple/swift-collections.git from cache (1.79s)
weights-free	release build	2026-09-06T06:08:32.9253140Z Fetched https://github.com/apple/swift-numerics from cache (1.79s)
weights-free	release build	2026-09-06T06:08:32.9361220Z Fetching https://github.com/ml-explore/mlx-swift.git
weights-free	release build	2026-09-06T06:08:32.9464360Z Fetching https://github.com/apple/swift-asn1.git
weights-free	release build	2026-09-06T06:08:33.5131600Z [1/1949] Fetching swift-asn1
weights-free	release build	2026-09-06T06:08:34.0012060Z [1950/18163] Fetching swift-asn1, mlx-swift
weights-free	release build	2026-09-06T06:08:34.7992580Z Fetched https://github.com/ml-explore/mlx-swift.git from cache (1.87s)
weights-free	release build	2026-09-06T06:08:34.8092600Z Fetched https://github.com/apple/swift-asn1.git from cache (1.87s)
weights-free	release build	2026-09-06T06:08:34.8199300Z Fetching https://github.com/huggingface/swift-transformers.git
weights-free	release build	2026-09-06T06:08:34.8300290Z Fetching https://github.com/apple/swift-crypto.git
weights-free	release build	2026-09-06T06:08:35.4833740Z [1/18478] Fetching swift-crypto
weights-free	release build	2026-09-06T06:08:35.5307650Z [2/25442] Fetching swift-crypto, swift-transformers
weights-free	release build	2026-09-06T06:08:36.6479080Z Fetched https://github.com/apple/swift-crypto.git from cache (1.83s)
weights-free	release build	2026-09-06T06:08:36.6610080Z Fetched https://github.com/huggingface/swift-transformers.git from cache (1.83s)
weights-free	release build	2026-09-06T06:08:36.6714550Z Fetching https://github.com/huggingface/swift-huggingface.git
weights-free	release build	2026-09-06T06:08:36.6816530Z Fetching https://github.com/mattt/EventSource.git
weights-free	release build	2026-09-06T06:08:37.2476700Z [1/303] Fetching eventsource
weights-free	release build	2026-09-06T06:08:37.2783110Z [98/2817] Fetching eventsource, swift-huggingface
weights-free	release build	2026-09-06T06:08:37.5781880Z Fetched https://github.com/mattt/EventSource.git from cache (0.92s)
weights-free	release build	2026-09-06T06:08:37.5892580Z Fetched https://github.com/huggingface/swift-huggingface.git from cache (0.93s)
weights-free	release build	2026-09-06T06:08:37.5965680Z Fetching https://github.com/apple/swift-argument-parser.git
weights-free	release build	2026-09-06T06:08:37.6075080Z Fetching https://github.com/ibireme/yyjson.git
weights-free	release build	2026-09-06T06:08:38.4665170Z [1/18778] Fetching swift-argument-parser
weights-free	release build	2026-09-06T06:08:38.5034370Z [2/23538] Fetching swift-argument-parser, yyjson
weights-free	release build	2026-09-06T06:08:39.2603970Z Fetched https://github.com/apple/swift-argument-parser.git from cache (1.67s)
weights-free	release build	2026-09-06T06:08:39.2607370Z Fetched https://github.com/ibireme/yyjson.git from cache (1.67s)
weights-free	release build	2026-09-06T06:08:39.2609610Z Computing version for https://github.com/apple/swift-argument-parser.git
weights-free	release build	2026-09-06T06:08:39.2712750Z Fetching https://github.com/huggingface/swift-jinja.git
weights-free	release build	2026-09-06T06:08:39.9089540Z [1/1281] Fetching swift-jinja
weights-free	release build	2026-09-06T06:08:40.1573970Z Fetched https://github.com/huggingface/swift-jinja.git from cache (0.89s)
weights-free	release build	2026-09-06T06:08:41.5523920Z Computed https://github.com/apple/swift-argument-parser.git at 1.8.2 (10.43s)
weights-free	release build	2026-09-06T06:08:41.5526770Z Computing version for https://github.com/huggingface/swift-transformers.git
weights-free	release build	2026-09-06T06:08:41.8924650Z Computed https://github.com/huggingface/swift-transformers.git at 1.3.3 (0.34s)
weights-free	release build	2026-09-06T06:08:41.8927380Z Computing version for https://github.com/ml-explore/mlx-swift.git
weights-free	release build	2026-09-06T06:08:42.2194590Z Computed https://github.com/ml-explore/mlx-swift.git at 0.31.6 (0.33s)
weights-free	release build	2026-09-06T06:08:42.2195560Z Computing version for https://github.com/ibireme/yyjson.git
weights-free	release build	2026-09-06T06:08:47.1339760Z Computed https://github.com/ibireme/yyjson.git at 0.12.0 (4.91s)
weights-free	release build	2026-09-06T06:08:47.1340870Z Computing version for https://github.com/apple/swift-crypto.git
weights-free	release build	2026-09-06T06:08:49.2689880Z Computed https://github.com/apple/swift-crypto.git at 4.5.1 (2.13s)
weights-free	release build	2026-09-06T06:08:49.2697740Z Computing version for https://github.com/apple/swift-collections.git
weights-free	release build	2026-09-06T06:08:49.6649960Z Computed https://github.com/apple/swift-collections.git at 1.6.0 (0.40s)
weights-free	release build	2026-09-06T06:08:49.6651990Z Computing version for https://github.com/huggingface/swift-huggingface.git
weights-free	release build	2026-09-06T06:08:49.9545310Z Computed https://github.com/huggingface/swift-huggingface.git at 0.9.0 (0.29s)
weights-free	release build	2026-09-06T06:08:49.9547770Z Computing version for https://github.com/huggingface/swift-jinja.git
weights-free	release build	2026-09-06T06:08:50.2119970Z Computed https://github.com/huggingface/swift-jinja.git at 2.4.2 (0.26s)
weights-free	release build	2026-09-06T06:08:50.2122780Z Computing version for https://github.com/apple/swift-numerics
weights-free	release build	2026-09-06T06:08:50.4704000Z Computed https://github.com/apple/swift-numerics at 1.1.1 (0.26s)
weights-free	release build	2026-09-06T06:08:50.4706810Z Computing version for https://github.com/apple/swift-asn1.git
weights-free	release build	2026-09-06T06:08:50.8728810Z Computed https://github.com/apple/swift-asn1.git at 1.7.1 (0.40s)
weights-free	release build	2026-09-06T06:08:50.8731400Z Computing version for https://github.com/mattt/EventSource.git
weights-free	release build	2026-09-06T06:08:51.1514580Z Computed https://github.com/mattt/EventSource.git at 1.5.1 (0.28s)
weights-free	release build	2026-09-06T06:08:51.5172430Z Creating working copy for https://github.com/apple/swift-argument-parser.git
weights-free	release build	2026-09-06T06:08:51.6831850Z Working copy of https://github.com/apple/swift-argument-parser.git resolved at 1.8.2
weights-free	release build	2026-09-06T06:08:51.7144450Z Creating working copy for https://github.com/apple/swift-asn1.git
weights-free	release build	2026-09-06T06:08:51.8229560Z Working copy of https://github.com/apple/swift-asn1.git resolved at 1.7.1
weights-free	release build	2026-09-06T06:08:51.8633610Z Creating working copy for https://github.com/apple/swift-collections.git
weights-free	release build	2026-09-06T06:08:52.2274620Z Working copy of https://github.com/apple/swift-collections.git resolved at 1.6.0
weights-free	release build	2026-09-06T06:08:52.2625890Z Creating working copy for https://github.com/mattt/EventSource.git
weights-free	release build	2026-09-06T06:08:52.3378600Z Working copy of https://github.com/mattt/EventSource.git resolved at 1.5.1
weights-free	release build	2026-09-06T06:08:52.3698720Z Creating working copy for https://github.com/huggingface/swift-huggingface.git
weights-free	release build	2026-09-06T06:08:52.4801130Z Working copy of https://github.com/huggingface/swift-huggingface.git resolved at 0.9.0
weights-free	release build	2026-09-06T06:08:52.5176940Z Creating working copy for https://github.com/apple/swift-numerics
weights-free	release build	2026-09-06T06:08:52.6112310Z Working copy of https://github.com/apple/swift-numerics resolved at 1.1.1
weights-free	release build	2026-09-06T06:08:52.6472320Z Creating working copy for https://github.com/huggingface/swift-transformers.git
weights-free	release build	2026-09-06T06:08:52.7574220Z Working copy of https://github.com/huggingface/swift-transformers.git resolved at 1.3.3
weights-free	release build	2026-09-06T06:08:52.7825330Z Creating working copy for https://github.com/ibireme/yyjson.git
weights-free	release build	2026-09-06T06:08:52.9951290Z Working copy of https://github.com/ibireme/yyjson.git resolved at 0.12.0
weights-free	release build	2026-09-06T06:08:53.0210700Z Creating working copy for https://github.com/ml-explore/mlx-swift.git
weights-free	release build	2026-09-06T06:09:02.2569780Z Working copy of https://github.com/ml-explore/mlx-swift.git resolved at 0.31.6
weights-free	release build	2026-09-06T06:09:02.2865640Z Creating working copy for https://github.com/huggingface/swift-jinja.git
weights-free	release build	2026-09-06T06:09:02.3540900Z Working copy of https://github.com/huggingface/swift-jinja.git resolved at 2.4.2
weights-free	release build	2026-09-06T06:09:02.4067130Z Creating working copy for https://github.com/apple/swift-crypto.git
weights-free	release build	2026-09-06T06:09:02.8659880Z Working copy of https://github.com/apple/swift-crypto.git resolved at 4.5.1
weights-free	release build	2026-09-06T06:09:07.4237730Z [0/6] Write sources
weights-free	release build	2026-09-06T06:09:07.5440460Z [3/6] Write swift-version-7974D3F7F03D5E95.txt
weights-free	release build	2026-09-06T06:09:09.0854660Z [5/7] Compiling ArgumentParserToolInfo ToolInfo.swift
weights-free	release build	2026-09-06T06:09:24.8731460Z [6/8] Compiling ArgumentParser BashCompletionsGenerator.swift
weights-free	release build	2026-09-06T06:09:27.7456550Z [7/9] Compiling encuda encuda-compile.swift
weights-free	release build	2026-09-06T06:09:27.7478840Z [7/9] Write Objects.LinkFileList
weights-free	release build	2026-09-06T06:09:28.3319180Z [8/9] Linking encuda-tool
weights-free	release build	2026-09-06T06:09:33.3159300Z [1/1] Compiling plugin GenerateManual
weights-free	release build	2026-09-06T06:09:34.1044180Z [2/2] Compiling plugin GenerateDoccReference
weights-free	release build	2026-09-06T06:09:34.1050410Z [3/3] Compiling plugin CudaBuild
weights-free	release build	2026-09-06T06:09:34.1051450Z Building for production...
weights-free	release build	2026-09-06T06:09:34.1397780Z [3/216] Write sources
weights-free	release build	2026-09-06T06:09:34.1498450Z [4/216] Copying t5_tokenizer_config.json
weights-free	release build	2026-09-06T06:09:34.1509960Z [5/216] Copying gpt2_tokenizer_config.json
weights-free	release build	2026-09-06T06:09:34.1511270Z [6/216] Copying PrivacyInfo.xcprivacy
weights-free	release build	2026-09-06T06:09:34.1511800Z [7/216] Write sources
weights-free	release build	2026-09-06T06:09:34.3798770Z [8/216] Compiling _NumericsShims _NumericsShims.c
weights-free	release build	2026-09-06T06:09:34.3921080Z [9/216] Write sources
weights-free	release build	2026-09-06T06:09:34.4886860Z [28/216] Compiling version.cpp
weights-free	release build	2026-09-06T06:09:34.4996980Z [29/216] Write swift-version-7974D3F7F03D5E95.txt
weights-free	release build	2026-09-06T06:09:37.2594490Z [30/216] Compiling utils.cpp
weights-free	release build	2026-09-06T06:09:38.2938250Z [32/217] Compiling RealModule AlgebraicField.swift
weights-free	release build	2026-09-06T06:09:40.1754610Z [33/218] Compiling InternalCollectionsUtilities Debugging.swift
weights-free	release build	2026-09-06T06:09:43.7501800Z [33/219] Compiling yyjson.c
weights-free	release build	2026-09-06T06:09:45.0112190Z [34/220] Compiling transforms.cpp
weights-free	release build	2026-09-06T06:09:46.9586040Z [36/221] Compiling Crypto AES-GCM.swift
weights-free	release build	2026-09-06T06:09:47.3529590Z [37/222] Compiling EventSource AsyncEventsSequence.swift
weights-free	release build	2026-09-06T06:09:48.1914570Z [38/222] Compiling ComplexModule Complex+AdditiveArithmetic.swift
weights-free	release build	2026-09-06T06:09:50.3708580Z [38/223] Compiling scheduler.cpp
weights-free	release build	2026-09-06T06:09:50.6001860Z [40/224] Compiling Numerics Numerics.swift
weights-free	release build	2026-09-06T06:09:53.1798920Z [41/224] Compiling OrderedCollections _HashTable+Bucket.swift
weights-free	release build	2026-09-06T06:09:56.4129250Z [41/224] Compiling random.cpp
weights-free	release build	2026-09-06T06:10:10.2770790Z [42/225] Compiling primitives.cpp
weights-free	release build	2026-09-06T06:10:29.3984360Z [43/225] Compiling ops.cpp
weights-free	release build	2026-09-06T06:10:37.0580170Z [44/225] Compiling linalg.cpp
weights-free	release build	2026-09-06T06:10:37.3116570Z [46/225] Compiling Jinja AST.swift
weights-free	release build	2026-09-06T06:10:38.5393060Z [47/225] Compiling HuggingFace AccessRequest.swift
weights-free	release build	2026-09-06T06:10:38.8439950Z [47/225] Compiling no_gguf.cpp
weights-free	release build	2026-09-06T06:10:40.7850190Z [48/226] Compiling load.cpp
weights-free	release build	2026-09-06T06:10:42.2772410Z [49/226] Compiling safetensors.cpp
weights-free	release build	2026-09-06T06:10:42.8068850Z [50/226] Compiling graph_utils.cpp
weights-free	release build	2026-09-06T06:10:43.8993220Z [51/226] Compiling fft.cpp
weights-free	release build	2026-09-06T06:10:46.1095530Z [52/226] Compiling fast.cpp
weights-free	release build	2026-09-06T06:10:50.5744350Z [53/226] Compiling einsum.cpp
weights-free	release build	2026-09-06T06:10:51.9944800Z [54/226] Compiling dtype_utils.cpp
weights-free	release build	2026-09-06T06:10:52.7940490Z [56/226] Compiling Hub BinaryDistinct.swift
weights-free	release build	2026-09-06T06:10:52.8048170Z [56/226] Compiling dtype.cpp
weights-free	release build	2026-09-06T06:10:53.8315360Z [57/227] Compiling utils.cpp
weights-free	release build	2026-09-06T06:10:54.8664130Z [58/227] Compiling no_ring.cpp
weights-free	release build	2026-09-06T06:10:56.0405780Z [59/227] Compiling primitives.cpp
weights-free	release build	2026-09-06T06:10:58.0005520Z [60/227] Compiling ops.cpp
weights-free	release build	2026-09-06T06:10:58.0227590Z [61/227] Compiling export.cpp
weights-free	release build	2026-09-06T06:10:58.6957590Z [62/227] Compiling no_mpi.cpp
weights-free	release build	2026-09-06T06:10:58.6996440Z [63/227] Compiling no_nccl.cpp
weights-free	release build	2026-09-06T06:10:59.4242320Z [64/227] Compiling no_jaccl.cpp
weights-free	release build	2026-09-06T06:10:59.6644990Z [65/227] Compiling distributed.cpp
weights-free	release build	2026-09-06T06:10:59.9556940Z [66/227] Compiling device.cpp
weights-free	release build	2026-09-06T06:11:01.9802140Z [67/227] Compiling utils.cpp
weights-free	release build	2026-09-06T06:11:02.9063200Z [69/227] Compiling Tokenizers BPETokenizer.swift
weights-free	release build	2026-09-06T06:11:03.8546900Z [69/227] Compiling compile.cpp
weights-free	release build	2026-09-06T06:11:03.8748050Z [70/227] Compiling unary.cpp
weights-free	release build	2026-09-06T06:11:04.7691050Z [71/228] Compiling ternary.cpp
weights-free	release build	2026-09-06T06:11:06.2366400Z [73/228] Compiling Generation Decoders.swift
weights-free	release build	2026-09-06T06:11:06.5543290Z [73/228] Compiling sort.cpp
weights-free	release build	2026-09-06T06:11:07.2779030Z [74/229] Compiling softmax.cpp
weights-free	release build	2026-09-06T06:11:08.2454570Z [75/229] Compiling slicing.cpp
weights-free	release build	2026-09-06T06:11:08.6166720Z [77/229] Compiling Models LanguageModel.swift
weights-free	release build	2026-09-06T06:11:09.2516180Z [77/229] Compiling scan.cpp
weights-free	release build	2026-09-06T06:11:10.3110910Z [78/229] Compiling rope.cpp
weights-free	release build	2026-09-06T06:11:10.5208620Z [79/229] Compiling resident.cpp
weights-free	release build	2026-09-06T06:11:10.5570070Z [80/229] Compiling scaled_dot_product_attention.cpp
weights-free	release build	2026-09-06T06:11:12.7878160Z [81/229] Compiling primitives.cpp
weights-free	release build	2026-09-06T06:11:12.8111950Z [82/229] Compiling reduce.cpp
weights-free	release build	2026-09-06T06:11:13.7712850Z [83/229] Compiling quantized.cpp
weights-free	release build	2026-09-06T06:11:14.4343670Z [84/229] Compiling metal.cpp
weights-free	release build	2026-09-06T06:11:15.0073560Z [85/229] Compiling normalization.cpp
weights-free	release build	2026-09-06T06:11:16.3971320Z [86/229] Compiling logsumexp.cpp
weights-free	release build	2026-09-06T06:11:19.5446970Z [87/229] Compiling matmul.cpp
weights-free	release build	2026-09-06T06:11:21.6000530Z [88/229] Compiling jit_kernels.cpp
weights-free	release build	2026-09-06T06:11:22.1672080Z [89/229] Compiling indexing.cpp
weights-free	release build	2026-09-06T06:11:24.0049460Z [90/229] Compiling hadamard.cpp
weights-free	release build	2026-09-06T06:11:24.9926660Z [91/229] Compiling fence.cpp
weights-free	release build	2026-09-06T06:11:25.9232410Z [92/229] Compiling event.cpp
weights-free	release build	2026-09-06T06:11:27.0419210Z [93/229] Compiling eval.cpp
weights-free	release build	2026-09-06T06:11:27.3995920Z [94/229] Compiling distributed.cpp
weights-free	release build	2026-09-06T06:11:28.3266980Z [95/229] Compiling device_info.cpp
weights-free	release build	2026-09-06T06:11:29.7797720Z [96/229] Compiling fft.cpp
weights-free	release build	2026-09-06T06:11:30.6466450Z [97/229] Compiling device.cpp
weights-free	release build	2026-09-06T06:11:32.1465770Z [98/229] Compiling copy.cpp
weights-free	release build	2026-09-06T06:11:32.7360560Z [99/229] Compiling custom_kernel.cpp
weights-free	release build	2026-09-06T06:11:34.3530520Z [100/229] Compiling conv.cpp
weights-free	release build	2026-09-06T06:11:35.0928200Z [101/229] Compiling compiled.cpp
weights-free	release build	2026-09-06T06:11:35.6663850Z [102/229] Compiling binary.cpp
weights-free	release build	2026-09-06T06:11:36.1908350Z [103/229] Compiling slicing.cpp
weights-free	release build	2026-09-06T06:11:36.4413680Z [104/229] Compiling allocator.cpp
weights-free	release build	2026-09-06T06:11:37.0817630Z [105/229] Compiling primitives.cpp
weights-free	release build	2026-09-06T06:11:37.2856780Z [106/229] Compiling no_cuda.cpp
weights-free	release build	2026-09-06T06:11:37.3691420Z [107/229] Compiling threefry.cpp
weights-free	release build	2026-09-06T06:11:37.4916080Z [108/229] Compiling copy.cpp
weights-free	release build	2026-09-06T06:11:40.7581730Z [109/229] Compiling svd.cpp
weights-free	release build	2026-09-06T06:11:43.1963080Z [110/229] Compiling softmax.cpp
weights-free	release build	2026-09-06T06:11:45.2488920Z [111/229] Compiling unary.cpp
weights-free	release build	2026-09-06T06:11:46.1117630Z [112/229] Compiling select.cpp
weights-free	release build	2026-09-06T06:11:48.8965000Z [113/229] Compiling sort.cpp
weights-free	release build	2026-09-06T06:11:56.0083760Z [114/229] Compiling scan.cpp
weights-free	release build	2026-09-06T06:11:56.4995390Z [115/229] Compiling quantized.cpp
weights-free	release build	2026-09-06T06:11:56.9713840Z [116/229] Compiling reduce.cpp
weights-free	release build	2026-09-06T06:11:58.8642590Z [117/229] Compiling qrf.cpp
weights-free	release build	2026-09-06T06:12:00.1761130Z [118/229] Compiling primitives.cpp
weights-free	release build	2026-09-06T06:12:01.4820850Z [119/229] Compiling matmul.cpp
weights-free	release build	2026-09-06T06:12:02.8368680Z [120/229] Compiling masked_mm.cpp
weights-free	release build	2026-09-06T06:12:02.8544000Z [121/229] Compiling luf.cpp
weights-free	release build	2026-09-06T06:12:03.6071290Z [122/229] Compiling logsumexp.cpp
weights-free	release build	2026-09-06T06:12:03.7942500Z [123/229] Compiling jit_compiler.cpp
weights-free	release build	2026-09-06T06:12:05.4245010Z [124/229] Compiling inverse.cpp
weights-free	release build	2026-09-06T06:12:05.6943860Z [125/229] Compiling hadamard.cpp
weights-free	release build	2026-09-06T06:12:07.2123850Z [126/229] Compiling cblas.cpp
weights-free	release build	2026-09-06T06:12:07.3547130Z [127/229] Compiling bnns.cpp
weights-free	release build	2026-09-06T06:12:09.6192880Z [128/229] Compiling eval.cpp
weights-free	release build	2026-09-06T06:12:10.4805120Z [129/229] Compiling encoder.cpp
weights-free	release build	2026-09-06T06:12:12.9846400Z [130/229] Compiling eigh.cpp
weights-free	release build	2026-09-06T06:12:13.2335910Z [131/229] Compiling fft.cpp
weights-free	release build	2026-09-06T06:12:14.4796470Z [132/229] Compiling distributed.cpp
weights-free	release build	2026-09-06T06:12:15.2063770Z [133/229] Compiling device_info.cpp
weights-free	release build	2026-09-06T06:12:15.7920390Z [134/229] Compiling eig.cpp
weights-free	release build	2026-09-06T06:12:21.6151390Z [135/229] Compiling conv.cpp
weights-free	release build	2026-09-06T06:12:24.3185760Z [136/229] Compiling cholesky.cpp
weights-free	release build	2026-09-06T06:12:38.9928740Z [137/229] Compiling copy.cpp
weights-free	release build	2026-09-06T06:12:41.5251180Z [138/229] Compiling arg_reduce.cpp
weights-free	release build	2026-09-06T06:12:42.5720030Z [139/229] Compiling utils.cpp
weights-free	release build	2026-09-06T06:12:43.5289490Z [140/229] Compiling slicing.cpp
weights-free	release build	2026-09-06T06:12:45.0884770Z [141/229] Compiling reduce.cpp
weights-free	release build	2026-09-06T06:12:46.8605360Z [142/229] Compiling load.cpp
weights-free	release build	2026-09-06T06:12:47.1461600Z [143/229] Compiling indexing.cpp
weights-free	release build	2026-09-06T06:12:48.3892780Z [144/229] Compiling compiled.cpp
weights-free	release build	2026-09-06T06:12:48.4953970Z [145/229] Compiling common.cpp
weights-free	release build	2026-09-06T06:12:49.1846680Z [146/229] Compiling broadcasting.cpp
weights-free	release build	2026-09-06T06:12:49.2182320Z [147/229] Compiling utils.cpp
weights-free	release build	2026-09-06T06:12:49.2489890Z [148/229] Compiling unary_ops.cpp
weights-free	release build	2026-09-06T06:12:49.2792610Z [149/229] Compiling unary.cpp
weights-free	release build	2026-09-06T06:12:49.3055610Z [150/229] Compiling ternary_ops.cpp
weights-free	release build	2026-09-06T06:12:49.3327070Z [151/229] Compiling ternary.cpp
weights-free	release build	2026-09-06T06:12:49.3686620Z [152/229] Compiling steel_gemm_splitk_nax.cpp
weights-free	release build	2026-09-06T06:12:49.3929970Z [153/229] Compiling steel_gemm_splitk.cpp
weights-free	release build	2026-09-06T06:12:49.4289770Z [154/229] Compiling steel_gemm_segmented.cpp
weights-free	release build	2026-09-06T06:12:49.4592000Z [155/229] Compiling steel_gemm_masked.cpp
weights-free	release build	2026-09-06T06:12:49.4898730Z [156/229] Compiling steel_gemm_gather_nax.cpp
weights-free	release build	2026-09-06T06:12:49.5118250Z [157/229] Compiling steel_gemm_gather.cpp
weights-free	release build	2026-09-06T06:12:49.5360060Z [158/229] Compiling steel_gemm_fused_nax.cpp
weights-free	release build	2026-09-06T06:12:49.5681500Z [159/229] Compiling steel_gemm_fused.cpp
weights-free	release build	2026-09-06T06:12:49.5967180Z [160/229] Compiling steel_conv_general.cpp
weights-free	release build	2026-09-06T06:12:49.6218270Z [161/229] Compiling steel_conv_3d.cpp
weights-free	release build	2026-09-06T06:12:49.6551850Z [162/229] Compiling steel_conv.cpp
weights-free	release build	2026-09-06T06:12:49.6806480Z [163/229] Compiling steel_attention_nax.cpp
weights-free	release build	2026-09-06T06:12:49.7166570Z [164/229] Compiling steel_attention.cpp
weights-free	release build	2026-09-06T06:12:49.7411640Z [165/229] Compiling sort.cpp
weights-free	release build	2026-09-06T06:12:49.7669150Z [166/229] Compiling softmax.cpp
weights-free	release build	2026-09-06T06:12:49.7971480Z [167/229] Compiling scatter_axis.cpp
weights-free	release build	2026-09-06T06:12:49.8215320Z [168/229] Compiling scatter.cpp
weights-free	release build	2026-09-06T06:12:49.8476700Z [169/229] Compiling scan.cpp
weights-free	release build	2026-09-06T06:12:49.8879260Z [170/229] Compiling reduce_utils.cpp
weights-free	release build	2026-09-06T06:12:49.9163660Z [171/229] Compiling reduce.cpp
weights-free	release build	2026-09-06T06:12:49.9469520Z [172/229] Compiling quantized_utils.cpp
weights-free	release build	2026-09-06T06:12:49.9793110Z [173/229] Compiling quantized_nax.cpp
weights-free	release build	2026-09-06T06:12:50.0034250Z [174/229] Compiling quantized.cpp
weights-free	release build	2026-09-06T06:12:50.0340200Z [175/229] Compiling masked_scatter.cpp
weights-free	release build	2026-09-06T06:12:50.0647620Z [176/229] Compiling logsumexp.cpp
weights-free	release build	2026-09-06T06:12:50.0856680Z [177/229] Compiling hadamard.cpp
weights-free	release build	2026-09-06T06:12:50.1104070Z [178/229] Compiling gemv_masked.cpp
weights-free	release build	2026-09-06T06:12:50.1443990Z [179/229] Compiling gemm_nax.cpp
weights-free	release build	2026-09-06T06:12:50.1764610Z [180/229] Compiling gemm.cpp
weights-free	release build	2026-09-06T06:12:50.2072100Z [181/229] Compiling gather_front.cpp
weights-free	release build	2026-09-06T06:12:50.2375650Z [182/229] Compiling gather_axis.cpp
weights-free	release build	2026-09-06T06:12:50.2578390Z [183/229] Compiling gather.cpp
weights-free	release build	2026-09-06T06:12:50.2914700Z [184/229] Compiling fp_quantized_nax.cpp
weights-free	release build	2026-09-06T06:12:50.3250260Z [185/229] Compiling fp_quantized.cpp
weights-free	release build	2026-09-06T06:12:50.3551180Z [186/229] Compiling fft.cpp
weights-free	release build	2026-09-06T06:12:50.3853040Z [187/229] Compiling copy.cpp
weights-free	release build	2026-09-06T06:12:50.4054870Z [188/229] Compiling conv.cpp
weights-free	release build	2026-09-06T06:12:50.4355950Z [189/229] Compiling compiled_preamble.cpp
weights-free	release build	2026-09-06T06:12:50.4673180Z [190/229] Compiling binary_two.cpp
weights-free	release build	2026-09-06T06:12:50.4976210Z [191/229] Compiling binary_ops.cpp
weights-free	release build	2026-09-06T06:12:50.5200940Z [192/229] Compiling binary.cpp
weights-free	release build	2026-09-06T06:12:50.5503150Z [193/229] Compiling arange.cpp
weights-free	release build	2026-09-06T06:12:50.6034720Z [194/229] Compiling array.cpp
weights-free	release build	2026-09-06T06:12:51.7413610Z [195/229] Compiling version.cpp
weights-free	release build	2026-09-06T06:12:53.2209940Z [196/229] Compiling compiled_conditional.cpp
weights-free	release build	2026-09-06T06:12:53.9473210Z [197/229] Compiling vector.cpp
weights-free	release build	2026-09-06T06:12:55.0231190Z [198/229] Compiling transforms_impl.cpp
weights-free	release build	2026-09-06T06:12:55.9396830Z [199/229] Compiling transforms.cpp
weights-free	release build	2026-09-06T06:12:56.5911730Z [200/229] Compiling string.cpp
weights-free	release build	2026-09-06T06:12:57.3055280Z [201/229] Compiling stream.cpp
weights-free	release build	2026-09-06T06:12:58.2096700Z [202/229] Compiling random.cpp
weights-free	release build	2026-09-06T06:12:59.5838140Z [203/229] Compiling metal.cpp
weights-free	release build	2026-09-06T06:13:00.1806830Z [204/229] Compiling ops.cpp
weights-free	release build	2026-09-06T06:13:01.0149240Z [205/229] Compiling memory.cpp
weights-free	release build	2026-09-06T06:13:01.8074500Z [206/229] Compiling map.cpp
weights-free	release build	2026-09-06T06:13:02.3257220Z [207/229] Compiling linalg.cpp
weights-free	release build	2026-09-06T06:13:02.9915170Z [208/229] Compiling io_types.cpp
weights-free	release build	2026-09-06T06:13:03.7715430Z [209/229] Compiling io.cpp
weights-free	release build	2026-09-06T06:13:04.4147130Z [210/229] Compiling fft.cpp
weights-free	release build	2026-09-06T06:13:05.4480990Z [211/229] Compiling fast.cpp
weights-free	release build	2026-09-06T06:13:05.7573240Z [212/229] Compiling export.cpp
weights-free	release build	2026-09-06T06:13:05.9776330Z [213/229] Compiling error.cpp
weights-free	release build	2026-09-06T06:13:07.5427610Z [214/229] Compiling cuda.cpp
weights-free	release build	2026-09-06T06:13:07.6150490Z [215/229] Compiling device.cpp
weights-free	release build	2026-09-06T06:13:08.6146590Z [216/229] Compiling compile.cpp
weights-free	release build	2026-09-06T06:13:09.3156160Z [217/229] Compiling closure.cpp
weights-free	release build	2026-09-06T06:13:11.1972220Z [218/229] Compiling Cmlx.m
weights-free	release build	2026-09-06T06:13:12.2811210Z [219/229] Compiling array.cpp
weights-free	release build	2026-09-06T06:13:12.6356290Z [220/229] Compiling CSlotpack slotpack.c
weights-free	release build	2026-09-06T06:13:12.6360590Z [221/229] Write sources
weights-free	release build	2026-09-06T06:13:13.6312060Z [223/230] Compiling format.cc
weights-free	release build	2026-09-06T06:13:14.9499100Z [225/230] Compiling ArgumentParserToolInfo ToolInfo.swift
weights-free	release build	2026-09-06T06:13:25.2663330Z [225/231] Compiling binary.cpp
weights-free	release build	2026-09-06T06:13:32.6836530Z [227/232] Compiling ArgumentParser BashCompletionsGenerator.swift
weights-free	release build	2026-09-06T06:13:44.3672390Z [228/232] Compiling MLX ArrayAt.swift
weights-free	release build	2026-09-06T06:13:44.9319580Z [229/234] Compiling MLXFast MLXFast.swift
weights-free	release build	2026-09-06T06:13:50.3834920Z [230/234] Compiling MLXNN Activations.swift
weights-free	release build	2026-09-06T06:14:31.0184870Z [231/235] Compiling Slotstream Checkpoint.swift
weights-free	release build	2026-09-06T06:14:31.0220460Z /Users/runner/work/slotstream/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
weights-free	release build	2026-09-06T06:14:31.0226090Z 34 |         lock.lock()
weights-free	release build	2026-09-06T06:14:31.0226720Z 35 |         defer { lock.unlock() }
weights-free	release build	2026-09-06T06:14:31.0227210Z 36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
weights-free	release build	2026-09-06T06:14:31.0238960Z    |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
weights-free	release build	2026-09-06T06:14:31.0239740Z 37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
weights-free	release build	2026-09-06T06:14:31.0240760Z 38 |         var small = [Int16](repeating: 0, count: ids.count)
weights-free	release build	2026-09-06T06:14:36.8782820Z [232/236] Compiling SlotstreamDiagnostics CheckReport.swift
weights-free	release build	2026-09-06T06:14:47.0147450Z [233/238] Compiling SlotstreamTestKit Catalogue.swift
weights-free	release build	2026-09-06T06:14:48.2183940Z [234/239] Compiling slotstream_cli CheckRendering.swift
weights-free	release build	2026-09-06T06:14:48.2313720Z [234/239] Write Objects.LinkFileList
weights-free	release build	2026-09-06T06:14:49.7393610Z [236/239] Compiling slotstream_checks main.swift
weights-free	release build	2026-09-06T06:14:49.7462700Z [236/239] Write Objects.LinkFileList
weights-free	release build	2026-09-06T06:15:05.0114540Z [237/239] Linking slotstream-checks
weights-free	release build	2026-09-06T06:15:05.0182790Z [238/239] Linking slotstream
weights-free	release build	2026-09-06T06:15:05.0438980Z Build complete! (393.86s)
weights-free	release build	2026-09-06T06:15:05.0728680Z cp Tools/lib/mlx-0.31.1.metallib .build/release/mlx.metallib
weights-free	pinned dbmd (the brain gates inside static_gates.sh need it)	﻿2026-09-06T06:15:05.3822600Z ##[group]Run Tools/dbmd_install.sh
weights-free	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T06:15:05.3823430Z ^[[36;1mTools/dbmd_install.sh^[[0m
weights-free	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T06:15:05.7563740Z shell: /bin/bash -e {0}
weights-free	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T06:15:05.7564030Z ##[endgroup]
weights-free	pinned dbmd (the brain gates inside static_gates.sh need it)	2026-09-06T06:15:06.4413080Z installed dbmd 0.13.4 to /Users/runner/.dbmd/bin/dbmd
weights-free	static and runtime safety gates	﻿2026-09-06T06:15:06.4552100Z ##[group]Run Tools/static_gates.sh
weights-free	static and runtime safety gates	2026-09-06T06:15:06.4552580Z ^[[36;1mTools/static_gates.sh^[[0m
weights-free	static and runtime safety gates	2026-09-06T06:15:06.4592080Z shell: /bin/bash -e {0}
weights-free	static and runtime safety gates	2026-09-06T06:15:06.4592430Z ##[endgroup]
weights-free	static and runtime safety gates	2026-09-06T06:15:06.9058400Z coverage ratchet checks pass
weights-free	static and runtime safety gates	2026-09-06T06:15:06.9792150Z llms-full.txt is current
weights-free	static and runtime safety gates	2026-09-06T06:15:07.1561470Z 0 issue(s): 0 error(s), 0 warning(s), 0 info
weights-free	static and runtime safety gates	2026-09-06T06:15:07.1963020Z MEASUREMENTS.md is current
weights-free	static and runtime safety gates	2026-09-06T06:15:07.1963420Z PLAN.md is current
weights-free	static and runtime safety gates	2026-09-06T06:15:07.2485060Z claims gate: 84 needle checks, 0 failures
weights-free	static and runtime safety gates	2026-09-06T06:15:07.2513600Z BRAIN GATES PASS
weights-free	static and runtime safety gates	2026-09-06T06:15:07.3204340Z dequant_row.txt: OK
weights-free	static and runtime safety gates	2026-09-06T06:15:07.3224300Z layer_0.bin: OK
weights-free	static and runtime safety gates	2026-09-06T06:15:07.3241100Z layer_1.bin: OK
weights-free	static and runtime safety gates	2026-09-06T06:15:07.3256360Z layer_2.bin: OK
weights-free	static and runtime safety gates	2026-09-06T06:15:07.3270880Z layer_3.bin: OK
weights-free	static and runtime safety gates	2026-09-06T06:15:07.3272460Z ngram_ids.txt: OK
weights-free	static and runtime safety gates	2026-09-06T06:15:07.3274090Z tokens.txt: OK
weights-free	static and runtime safety gates	2026-09-06T06:15:07.4905070Z PASS  process physical footprint is readable
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5012340Z PASS  process RSS high-water is readable
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5119710Z PASS  prefix cache reaches its four-entry bound
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5221610Z PASS  an identical history replaces instead of duplicating an entry
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5345730Z PASS  a miss evicts before allocating a fifth state
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5447320Z PASS  a smaller live token ceiling evicts immediately
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5548610Z PASS  held GB includes fixed recurrent state
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5596110Z PASS  identical bytes hash alike
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5597090Z PASS  different bytes do not
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5598640Z PASS  the same image at the same offset matches
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5599750Z PASS  a swapped image does not
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5600200Z PASS  an entry ending inside a run still matches that run
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5620000Z PASS  a text-only entry rejects a prompt with an image inside its range
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5623940Z PASS  an image beyond the entry's range is irrelevant to the match
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5624520Z PASS  a vision conversation is held, not discarded
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5625050Z PASS  the same ids with a different picture miss
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5626140Z PASS  the text-only splice never sees a vision entry
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5626860Z PASS  prefix splice chooses the longest retained extension
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5627430Z PASS  prefix splice is strict, not an identical-history match
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5627880Z PASS  prefix splice lookup does not consume the retained state
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5628310Z PASS  a disabled prefix cache offers no splice
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5628680Z PASS  shard listing works through a symlinked model dir
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5629090Z PASS  8.1 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5630210Z PASS  10.0 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5630560Z PASS  16.0 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5630890Z PASS  30.0 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5631230Z RUNTIME CHECK PASS
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5631460Z PASS  matching file is accepted
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5631790Z PASS  same-size corruption is rejected
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5632070Z PASS  exact Content-Range is accepted
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5632390Z PASS  wrong range start is rejected
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5632660Z PASS  wrong range total is rejected
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5632990Z PASS  unknown range total is rejected
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5633290Z PASS  every pinned file has a digest
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5633730Z PASS  the draft head is pinned as the one optional file
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5634190Z PASS  an absent optional file is not a repair; an absent required one is
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5634690Z PASS  an empty directory reads as missing
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5635090Z PASS  missing needs the required model
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5635440Z PASS  status carries free disk
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5635840Z PASS  bytesToFetch agrees with required files
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5636190Z PASS  a missing copy is not ready
weights-free	static and runtime safety gates	2026-09-06T06:15:07.5636590Z PULL CHECK PASS
weights-free	static and runtime safety gates	2026-09-06T06:15:23.3753980Z {"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
weights-free	static and runtime safety gates	2026-09-06T06:15:46.3546060Z MANIFEST CHECKS PASS
weights-free	static and runtime safety gates	2026-09-06T06:16:35.7286380Z {"name": "normal", "pass_": true, "seconds": 0.101, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:35.8014250Z {"name": "cache-miss-reporting", "pass_": true, "seconds": 0.073, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:35.8797050Z {"name": "redirect", "pass_": true, "seconds": 0.078, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:35.9581170Z {"name": "bad-object-fallback", "pass_": true, "seconds": 0.078, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:36.0228720Z {"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.064, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:36.0435640Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.02, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:16:36.0707680Z {"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.027, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:16:36.1513220Z {"name": "optional-absent", "pass_": true, "seconds": 0.08, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:36.2308680Z {"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.079, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:36.2523900Z {"name": "bad-object-fails", "pass_": true, "seconds": 0.021, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:16:36.3332600Z {"name": "retry-after", "pass_": true, "seconds": 0.081, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:41.6995710Z {"name": "transient-retry", "pass_": true, "seconds": 5.366, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:16:53.5678780Z {"name": "wrong-length-fallback", "pass_": true, "seconds": 11.867, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:17:29.5065310Z {"name": "short-body-fallback", "pass_": true, "seconds": 35.937, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:05.5743280Z {"name": "content-encoding-fallback", "pass_": true, "seconds": 36.067, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.1349990Z {"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.56, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.2345000Z {"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.085, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.3200950Z {"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.085, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.4080920Z {"name": "resume", "pass_": true, "seconds": 0.088, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.4334150Z {"name": "already-installed", "pass_": true, "seconds": 0.025, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.4593940Z {"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.025, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.5523090Z {"name": "corruption-seed", "pass_": true, "seconds": 0.093, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.5868650Z {"name": "same-size-final-repair", "pass_": true, "seconds": 0.034, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.6654480Z {"name": "invalid-resume-map", "pass_": true, "seconds": 0.077, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.7435240Z {"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.078, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.8371480Z {"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.093, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.8473330Z {"name": "part-symlink-rejected", "pass_": true, "seconds": 0.01, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.8579990Z {"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.01, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:18:07.8680030Z {"name": "part-fifo-rejected", "pass_": true, "seconds": 0.01, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:18:09.1817380Z {"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.007, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:18:09.6699030Z ALL HTTP CHECKS PASS
weights-free	static and runtime safety gates	2026-09-06T06:18:22.3950670Z {"name": "raw-multichunk", "pass_": true, "seconds": 1.311, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:22.8878600Z {"name": "raw-installed-no-http", "pass_": true, "seconds": 0.493, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:23.9603810Z {"name": "raw-source-fallback-missing", "pass_": true, "seconds": 1.072, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:18:25.1722940Z {"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 1.21, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:19:07.0431240Z {"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 41.871, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:19:08.1803190Z {"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 1.137, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:19:08.2192690Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.039, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:19:08.6594310Z {"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.44, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:19:09.0581080Z {"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.398, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:19:12.6379110Z {"name": "raw-cancel", "pass_": true, "seconds": 3.579, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T06:19:13.3782200Z {"name": "raw-resume", "pass_": true, "seconds": 0.726, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:19:14.7509720Z {"name": "raw-same-size-repair", "pass_": true, "seconds": 1.37, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T06:19:15.3262480Z ALL RAW HTTP CHECKS PASS
weights-free	static and runtime safety gates	2026-09-06T06:19:55.2035680Z SUSTAINED MEMORY PASS 141197312 bytes peak RSS
weights-free	static and runtime safety gates	2026-09-06T06:19:55.7395560Z SLOTPACK GATES PASS
weights-free	static and runtime safety gates	2026-09-06T06:19:55.9805490Z PASS  48GB pristine: 33.0 GB target and starts quiet
weights-free	static and runtime safety gates	2026-09-06T06:19:56.0222350Z PASS  48GB busy: clamped to 15.4 GB, sized-down note
weights-free	static and runtime safety gates	2026-09-06T06:19:56.0619780Z PASS  16GB pristine: 9.8 GB target, no notes
weights-free	static and runtime safety gates	2026-09-06T06:19:56.1028410Z PASS  16GB busy: floor 8.1 GB + heavy-paging warning
weights-free	static and runtime safety gates	2026-09-06T06:19:56.1446420Z PASS  8GB Mac: floor 8.1 GB + too-small warning
weights-free	static and runtime safety gates	2026-09-06T06:19:56.1827310Z PASS  128GB auto stops at the knee, not at 70% of RAM
weights-free	static and runtime safety gates	2026-09-06T06:19:56.1863060Z PASS  128GB explains the memory it left on the table
weights-free	static and runtime safety gates	2026-09-06T06:19:56.2256360Z PASS  128GB: --memory-gb still reaches full residency
weights-free	static and runtime safety gates	2026-09-06T06:19:56.2289390Z PASS  --sim-ram alone plans instead of erroring
weights-free	static and runtime safety gates	2026-09-06T06:19:56.2674600Z PASS  --max-ram-percent lowers the auto target
weights-free	static and runtime safety gates	2026-09-06T06:19:56.3059300Z PASS  --max-ram-percent cannot exceed the knee
weights-free	static and runtime safety gates	2026-09-06T06:19:56.3417800Z PASS  --max-ram-percent 0 refused
weights-free	static and runtime safety gates	2026-09-06T06:19:56.3768950Z PASS  --max-ram-percent 150 refused
weights-free	static and runtime safety gates	2026-09-06T06:19:56.4158330Z PASS  --max-ram-percent noted when outranked
weights-free	static and runtime safety gates	2026-09-06T06:19:59.4657320Z PASS  more memory never plans slower (7-90 GB sweep)
weights-free	static and runtime safety gates	2026-09-06T06:19:59.5073360Z PASS  explicit 30GB on busy 48: honored + info note
weights-free	static and runtime safety gates	2026-09-06T06:19:59.5412260Z PASS  --experts-per-layer 0 refused
weights-free	static and runtime safety gates	2026-09-06T06:19:59.5748940Z PASS  --pool-gb 0 refused
weights-free	static and runtime safety gates	2026-09-06T06:19:59.6089660Z PASS  --memory-gb below minimum refused
weights-free	static and runtime safety gates	2026-09-06T06:19:59.6459410Z PASS  --memory-gb inf is a clean error
weights-free	static and runtime safety gates	2026-09-06T06:19:59.6825440Z PASS  --pool-gb inf is a clean error
weights-free	static and runtime safety gates	2026-09-06T06:19:59.7179570Z PASS  --pool-gb 1e300 saturates safely instead of trapping
weights-free	static and runtime safety gates	2026-09-06T06:19:59.7531340Z PASS  --memory-gb 1e300 plans safely instead of trapping
weights-free	static and runtime safety gates	2026-09-06T06:19:59.8218570Z PASS  huge finite memory plan remains valid JSON
weights-free	static and runtime safety gates	2026-09-06T06:19:59.8555830Z PASS  --sim-ram inf is a clean error
weights-free	static and runtime safety gates	2026-09-06T06:19:59.8906700Z PASS  --sim-working-set inf is a clean error
weights-free	static and runtime safety gates	2026-09-06T06:19:59.9254280Z PASS  --sim-available inf is a clean error
weights-free	static and runtime safety gates	2026-09-06T06:19:59.9744230Z PASS  tiny pool raised to the floor, consistently
weights-free	static and runtime safety gates	2026-09-06T06:20:00.0155530Z PASS  knob precedence noted, never silent
weights-free	static and runtime safety gates	2026-09-06T06:20:00.0995030Z PASS  --model with no safetensors: clean error
weights-free	static and runtime safety gates	2026-09-06T06:20:00.1503520Z PASS  --model with no safetensors: names the fix
weights-free	static and runtime safety gates	2026-09-06T06:20:00.1902140Z PASS  MTP auto on a big quiet machine: knee + head = 34.6
weights-free	static and runtime safety gates	2026-09-06T06:20:00.2270970Z PASS  MTP auto stays off on a 16GB machine
weights-free	static and runtime safety gates	2026-09-06T06:20:00.2613020Z PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
weights-free	static and runtime safety gates	2026-09-06T06:20:00.2957260Z PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
weights-free	static and runtime safety gates	2026-09-06T06:20:00.3292400Z PASS  --mtp on forces the head onto a small machine
weights-free	static and runtime safety gates	2026-09-06T06:20:00.3661570Z PASS  --mtp off suppresses it everywhere
weights-free	static and runtime safety gates	2026-09-06T06:20:00.3965020Z PASS  --mtp on without mtp.safetensors is a clean error
weights-free	static and runtime safety gates	2026-09-06T06:20:00.4274170Z PASS  --mtp on cannot squeeze under the minimum target
weights-free	static and runtime safety gates	2026-09-06T06:20:00.4578700Z PASS  --mtp gibberish refused
weights-free	static and runtime safety gates	2026-09-06T06:20:00.4927270Z PASS  MTP charge visible in json peak
weights-free	static and runtime safety gates	2026-09-06T06:20:00.5506490Z PASS  --model with unparseable config: clean error
weights-free	static and runtime safety gates	2026-09-06T06:20:00.6092870Z PASS  invalid config arithmetic is rejected before it traps
weights-free	static and runtime safety gates	2026-09-06T06:20:00.6781500Z PASS  --model with a corrupt safetensors header
weights-free	static and runtime safety gates	2026-09-06T06:20:00.7701980Z PASS  safetensors dtype/shape byte mismatch rejected
weights-free	static and runtime safety gates	2026-09-06T06:20:00.8557650Z PASS  safetensors header over 100MB rejected before allocation
weights-free	static and runtime safety gates	2026-09-06T06:20:00.9441290Z PASS  --model with a different model's tensors
weights-free	static and runtime safety gates	2026-09-06T06:20:00.9648960Z PASS  serve --max-context 0 refused before load
weights-free	static and runtime safety gates	2026-09-06T06:20:00.9714320Z PASS  plan announces the context cap and the wait
weights-free	static and runtime safety gates	2026-09-06T06:20:01.0069850Z PASS  doctor --json carries max_context_tokens + wait
weights-free	static and runtime safety gates	2026-09-06T06:20:01.0266400Z PASS  serve --max-context above the ceiling names the ceiling, not a knob
weights-free	static and runtime safety gates	2026-09-06T06:20:01.0961960Z PASS  doctor --max-context above the ceiling is the same clean error
weights-free	static and runtime safety gates	2026-09-06T06:20:01.1418760Z PASS  a lower --max-context caps the reuse ceiling too
weights-free	static and runtime safety gates	2026-09-06T06:20:01.1754630Z PASS  prefill-schedule: bounded, floored, monotone
weights-free	static and runtime safety gates	2026-09-06T06:20:01.2601590Z PASS  prefill-schedule agrees with the doctor wait for the same pass
weights-free	static and runtime safety gates	2026-09-06T06:20:01.2875830Z PASS  prefill-schedule: a prefix hit reads only what is new
weights-free	static and runtime safety gates	2026-09-06T06:20:01.3043670Z PASS  prefill-schedule --chunk 0 refused
weights-free	static and runtime safety gates	2026-09-06T06:20:01.3219580Z PASS  context-check --tokens 4 refused before load
weights-free	static and runtime safety gates	2026-09-06T06:20:01.3389670Z PASS  parity rejects an invalid layer count before model load
weights-free	static and runtime safety gates	2026-09-06T06:20:01.3562520Z PASS  parity rejects malformed token ids without trapping
weights-free	static and runtime safety gates	2026-09-06T06:20:01.3731690Z PASS  n-gram golden rejects malformed token ids without trapping
weights-free	static and runtime safety gates	2026-09-06T06:20:01.3899800Z PASS  dequant golden rejects a negative row before model load
weights-free	static and runtime safety gates	2026-09-06T06:20:01.4081190Z PASS  sampler golden rejects an empty vocabulary without trapping
weights-free	static and runtime safety gates	2026-09-06T06:20:01.4254810Z PASS  sampler golden rejects a negative draw count without trapping
weights-free	static and runtime safety gates	2026-09-06T06:20:01.4255340Z planner: passed 64, failed 0
weights-free	static and runtime safety gates	2026-09-06T06:20:04.6040430Z 
weights-free	static and runtime safety gates	2026-09-06T06:20:04.6042160Z ######################################################################## 100.0%
weights-free	static and runtime safety gates	2026-09-06T06:20:05.2714180Z 
weights-free	static and runtime safety gates	2026-09-06T06:20:05.2714980Z ######################################################################## 100.0%
weights-free	static and runtime safety gates	2026-09-06T06:20:06.4810440Z 
weights-free	static and runtime safety gates	2026-09-06T06:20:06.4811060Z ######################################################################## 100.0%
weights-free	static and runtime safety gates	2026-09-06T06:20:06.9691810Z INSTALLER GATES PASS
weights-free	static and runtime safety gates	2026-09-06T06:20:06.9765530Z STATIC GATES PASS
weights-free	sampler and governor goldens	﻿2026-09-06T06:20:06.9957250Z ##[group]Run python3 -m pip install --quiet --break-system-packages numpy
weights-free	sampler and governor goldens	2026-09-06T06:20:06.9958170Z ^[[36;1mpython3 -m pip install --quiet --break-system-packages numpy^[[0m
weights-free	sampler and governor goldens	2026-09-06T06:20:06.9958600Z ^[[36;1mTools/sampler_gates.sh^[[0m
weights-free	sampler and governor goldens	2026-09-06T06:20:07.0221430Z shell: /bin/bash -e {0}
weights-free	sampler and governor goldens	2026-09-06T06:20:07.0221700Z ##[endgroup]
weights-free	sampler and governor goldens	2026-09-06T06:20:11.8095490Z PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
weights-free	sampler and governor goldens	2026-09-06T06:20:12.0354520Z PASS  sampler == numpy reference: greedy (temperature 0)
weights-free	sampler and governor goldens	2026-09-06T06:20:12.2576730Z PASS  sampler == numpy reference: pure sampling, no filters
weights-free	sampler and governor goldens	2026-09-06T06:20:12.5327040Z PASS  sampler == numpy reference: top-k 1 (degenerate)
weights-free	sampler and governor goldens	2026-09-06T06:20:12.7975270Z PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
weights-free	sampler and governor goldens	2026-09-06T06:20:13.1575300Z PASS  sampler == numpy reference: min-p 0.3
weights-free	sampler and governor goldens	2026-09-06T06:20:13.5632530Z PASS  sampler == numpy reference: presence penalty, accumulating
weights-free	sampler and governor goldens	2026-09-06T06:20:13.7648620Z PASS  sampler == numpy reference: greedy + penalty (API temp-0)
weights-free	sampler and governor goldens	2026-09-06T06:20:14.2143490Z PASS  sampler == numpy reference: vocab 4096
weights-free	sampler and governor goldens	2026-09-06T06:20:15.1832180Z PASS  sampler == numpy reference: real vocab (248,320)
weights-free	sampler and governor goldens	2026-09-06T06:20:15.3973990Z PASS  sampler == numpy reference: top-p 0 (sanitizer)
weights-free	sampler and governor goldens	2026-09-06T06:20:15.6766020Z PASS  sampler == numpy reference: min-p 5 (sanitizer)
weights-free	sampler and governor goldens	2026-09-06T06:20:15.9454060Z PASS  sampler == numpy reference: seed 0 (remapped)
weights-free	sampler and governor goldens	2026-09-06T06:20:16.2718260Z PASS  sampler == numpy reference: high temp, large vocab
weights-free	sampler and governor goldens	2026-09-06T06:20:16.8279510Z PASS  seeded sampling is reproducible and seed-sensitive
weights-free	sampler and governor goldens	2026-09-06T06:20:16.8474710Z PASS  elastic governor policy (20 branches)
weights-free	sampler and governor goldens	2026-09-06T06:20:16.8495880Z sampler + governor: passed 16, failed 0
weights-free	check catalogue (every check by name)	﻿2026-09-06T06:20:16.8529590Z ##[group]Run .build/release/slotstream-checks --tier t0 --tier t1
weights-free	check catalogue (every check by name)	2026-09-06T06:20:16.8529950Z ^[[36;1m.build/release/slotstream-checks --tier t0 --tier t1^[[0m
weights-free	check catalogue (every check by name)	2026-09-06T06:20:16.8560480Z shell: /bin/bash -e {0}
weights-free	check catalogue (every check by name)	2026-09-06T06:20:16.8560650Z ##[endgroup]
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0400690Z PASS  prefill-schedule (9 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0402620Z PASS  context-policy (8 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0403130Z PASS  runtime-check (26 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0403800Z PASS  governor-check (20 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0404200Z PASS  pull-check (14 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0405630Z PASS  machine-planning (15 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0406100Z PASS  http-framing (11 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0406360Z PASS  http-routing (23 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0406680Z PASS  vision-check (75 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0406950Z PASS  sampler-behaviour (9 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0407220Z PASS  vision-splice (12 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0407550Z PASS  toolcall-check (19 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0407930Z PASS  toolcall-stream-check (14 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0408190Z PASS  toolcall-coercion (23 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0408540Z PASS  gateway-request (37 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0409070Z PASS  gateway-prompt (23 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0409460Z PASS  gateway-catalog (28 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0409880Z PASS  gateway-events (19 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0410150Z PASS  chat-splice (10 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0410410Z PASS  gateway-null-bridge (10 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0410830Z PASS  gateway-anyof-types (13 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0411620Z PASS  openai-conversation (40 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0411990Z PASS  openai-tool-output (163 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0412350Z PASS  openai-context-budget (16 assertions)
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0412760Z 
weights-free	check catalogue (every check by name)	2026-09-06T06:20:21.0412920Z 24 passed, 0 failed, 0 skipped (637 assertions)
weights-free	the library is importable from outside the package	﻿2026-09-06T06:20:21.0462440Z ##[group]Run Tools/consumer_smoke.sh
weights-free	the library is importable from outside the package	2026-09-06T06:20:21.0462700Z ^[[36;1mTools/consumer_smoke.sh^[[0m
weights-free	the library is importable from outside the package	2026-09-06T06:20:21.0492850Z shell: /bin/bash -e {0}
weights-free	the library is importable from outside the package	2026-09-06T06:20:21.0493030Z ##[endgroup]
weights-free	the library is importable from outside the package	2026-09-06T06:22:50.1792200Z consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 9 assertions
weights-free	coverage may not go down	﻿2026-09-06T06:22:51.2384640Z ##[group]Run Tools/coverage.sh t0 t1 --lcov coverage.info
weights-free	coverage may not go down	2026-09-06T06:22:51.2388460Z ^[[36;1mTools/coverage.sh t0 t1 --lcov coverage.info^[[0m
weights-free	coverage may not go down	2026-09-06T06:22:51.2388900Z ^[[36;1mpython3 Tools/coverage_ratchet.py coverage.info^[[0m
weights-free	coverage may not go down	2026-09-06T06:22:51.2597710Z shell: /bin/bash -e {0}
weights-free	coverage may not go down	2026-09-06T06:22:51.2597980Z ##[endgroup]
weights-free	coverage may not go down	2026-09-06T06:22:51.3139320Z == build (instrumented) ==
weights-free	coverage may not go down	2026-09-06T06:25:23.5705600Z == run ==
weights-free	coverage may not go down	2026-09-06T06:25:28.9550260Z PASS  prefill-schedule (9 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9554300Z PASS  context-policy (8 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9554910Z PASS  runtime-check (26 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9555400Z PASS  governor-check (20 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9556020Z PASS  pull-check (14 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9556580Z PASS  machine-planning (15 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9557020Z PASS  http-framing (11 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9557590Z PASS  http-routing (23 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9558030Z PASS  vision-check (75 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9559340Z PASS  sampler-behaviour (9 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9560000Z PASS  vision-splice (12 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9560420Z PASS  toolcall-check (19 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9560880Z PASS  toolcall-stream-check (14 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9561380Z PASS  toolcall-coercion (23 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9561930Z PASS  gateway-request (37 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9562480Z PASS  gateway-prompt (23 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9562970Z PASS  gateway-catalog (28 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9563510Z PASS  gateway-events (19 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9563970Z PASS  chat-splice (10 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9564610Z PASS  gateway-null-bridge (10 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9565070Z PASS  gateway-anyof-types (13 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9565670Z PASS  openai-conversation (40 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9566270Z PASS  openai-tool-output (163 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9566760Z PASS  openai-context-budget (16 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9567170Z 
weights-free	coverage may not go down	2026-09-06T06:25:28.9567480Z 24 passed, 0 failed, 0 skipped (637 assertions)
weights-free	coverage may not go down	2026-09-06T06:25:28.9592570Z == coverage ==
weights-free	coverage may not go down	2026-09-06T06:25:30.5793760Z Filename                                                                                                Regions    Missed Regions     Cover   Functions  Missed Functions  Executed       Lines      Missed Lines     Cover    Branches   Missed Branches     Cover
weights-free	coverage may not go down	2026-09-06T06:25:30.5795430Z -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
weights-free	coverage may not go down	2026-09-06T06:25:30.5797440Z Sources/Slotstream/Checkpoint.swift                                                                         268               264     1.49%          97                94     3.09%         490               482     1.63%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5798990Z Sources/Slotstream/Context.swift                                                                             49                28    42.86%          10                 5    50.00%          79                36    54.43%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5800190Z Sources/Slotstream/DownloadConcurrency.swift                                                                 20                20     0.00%           6                 6     0.00%          22                22     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5801690Z Sources/Slotstream/DownloadHTTP.swift                                                                       139               137     1.44%          44                43     2.27%         183               179     2.19%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5808300Z Sources/Slotstream/Engine.swift                                                                             258               215    16.67%          75                63    16.00%         683               582    14.79%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5817220Z Sources/Slotstream/Errors.swift                                                                              11                11     0.00%           2                 2     0.00%          23                23     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5818160Z Sources/Slotstream/ExpertStore.swift                                                                        174               174     0.00%          67                67     0.00%         445               445     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5819260Z Sources/Slotstream/GatewayDialect.swift                                                                     188                48    74.47%          47                25    46.81%         418                57    86.36%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5875970Z Sources/Slotstream/Generate.swift                                                                           178               141    20.79%          71                53    25.35%         429               348    18.88%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5877200Z Sources/Slotstream/Governor.swift                                                                            78                47    39.74%          37                27    27.03%         223               161    27.80%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5882110Z Sources/Slotstream/Layers.swift                                                                             173               173     0.00%          71                71     0.00%         620               620     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5883190Z Sources/Slotstream/MTP.swift                                                                                 38                38     0.00%          22                22     0.00%         161               161     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5884610Z Sources/Slotstream/Machine.swift                                                                             13                 1    92.31%          10                 0   100.00%          48                 0   100.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5885820Z Sources/Slotstream/MemTrace.swift                                                                            21                21     0.00%           6                 6     0.00%          39                39     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5887150Z Sources/Slotstream/Model.swift                                                                              163               145    11.04%          58                48    17.24%         278               255     8.27%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5888340Z Sources/Slotstream/NgramStore.swift                                                                         108               107     0.93%          41                40     2.44%         294               288     2.04%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5889500Z Sources/Slotstream/OpenAIDialect.swift                                                                      156                48    69.23%          25                11    56.00%         194                30    84.54%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5890670Z Sources/Slotstream/OpenAIOutput.swift                                                                        41                 3    92.68%          15                 1    93.33%          58                 2    96.55%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5892570Z Sources/Slotstream/PinnedModel.swift                                                                          8                 0   100.00%           8                 0   100.00%          13                 0   100.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5898030Z Sources/Slotstream/PinnedTransport.swift                                                                     10                10     0.00%           4                 4     0.00%          12                12     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5899570Z Sources/Slotstream/Plan.swift                                                                               213                71    66.67%          62                12    80.65%         595               126    78.82%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5901210Z Sources/Slotstream/PrefixCache.swift                                                                         99                21    78.79%          58                15    74.14%         212                28    86.79%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5903190Z Sources/Slotstream/ProcessMemory.swift                                                                       18                12    33.33%           7                 3    57.14%          43                19    55.81%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5904450Z Sources/Slotstream/RouterTrace.swift                                                                         12                12     0.00%           4                 4     0.00%          26                26     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5906340Z Sources/Slotstream/Server.swift                                                                             804               704    12.44%         160               132    17.50%        1719              1497    12.91%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5907600Z Sources/Slotstream/SlotpackDownload.swift                                                                   275               273     0.73%          70                69     1.43%         485               477     1.65%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5909120Z Sources/Slotstream/SlotpackManifest.swift                                                                    54                54     0.00%          16                16     0.00%          95                95     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5910380Z Sources/Slotstream/ToolCallSplitter.swift                                                                   219                21    90.41%          47                 1    97.87%         375                14    96.27%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5911710Z Sources/Slotstream/Vendored/GatedDelta.swift                                                                 46                46     0.00%          12                12     0.00%         264               264     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5912790Z Sources/Slotstream/Vision.swift                                                                             252               126    50.00%          54                25    53.70%         645               364    43.57%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5916380Z Sources/Slotstream/VisionPrompt.swift                                                                        25                 8    68.00%          12                 4    66.67%          54                21    61.11%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5917770Z Sources/Slotstream/WeightDownload.swift                                                                     330               330     0.00%         102               102     0.00%         709               709     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5919120Z Sources/Slotstream/WeightStore.swift                                                                        189               141    25.40%          64                45    29.69%         392               270    31.12%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5920930Z Sources/Slotstream/Weights.swift                                                                             43                43     0.00%          17                17     0.00%          73                73     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5922800Z Sources/SlotstreamDiagnostics/CheckReport.swift                                                              35                19    45.71%          18                 6    66.67%          54                19    64.81%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5926240Z Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift                                                     42                27    35.71%          30                24    20.00%         175                29    83.43%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5929330Z Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift                                                         27                14    48.15%          15                10    33.33%         125                16    87.20%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5930420Z Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift                                                      23                13    43.48%          14                12    14.29%          64                14    78.12%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5935510Z Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift                                                         24                13    45.83%          18                12    33.33%          84                14    83.33%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5952940Z Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift                                                      25                17    32.00%          18                17     5.56%         136                17    87.50%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5954390Z Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift                                                      102                53    48.04%          69                47    31.88%         561                50    91.09%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5955530Z Sources/SlotstreamDiagnostics/Diagnostics.swift                                                              25                10    60.00%           7                 6    14.29%          79                 8    89.87%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5959190Z Sources/SlotstreamDiagnostics/Goldens.swift                                                                  25                 7    72.00%          10                 4    60.00%          67                 4    94.03%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:30.5961210Z -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
weights-free	coverage may not go down	2026-09-06T06:25:30.5962880Z TOTAL                                                                                                      5011              3676    26.64%        1606              1189    25.97%       11774              7926    32.68%           0                 0         -
weights-free	coverage may not go down	2026-09-06T06:25:42.3941600Z {
weights-free	coverage may not go down	2026-09-06T06:25:42.3942780Z   "checks" : [
weights-free	coverage may not go down	2026-09-06T06:25:42.3943660Z     "embedded manifest and original pins agree",
weights-free	coverage may not go down	2026-09-06T06:25:42.3944110Z     "new installs have a public compressed source",
weights-free	coverage may not go down	2026-09-06T06:25:42.3944950Z     "C encoder accepts Swift data",
weights-free	coverage may not go down	2026-09-06T06:25:42.3945360Z     "Swift C roundtrip is exact",
weights-free	coverage may not go down	2026-09-06T06:25:42.3946200Z     "manifest hash is mandatory",
weights-free	coverage may not go down	2026-09-06T06:25:42.3946510Z     "pinned file identity cannot change",
weights-free	coverage may not go down	2026-09-06T06:25:42.3946840Z     "unknown version",
weights-free	coverage may not go down	2026-09-06T06:25:42.3947060Z     "empty object list",
weights-free	coverage may not go down	2026-09-06T06:25:42.3973170Z     "invalid size=9223372036854775807",
weights-free	coverage may not go down	2026-09-06T06:25:42.3973960Z     "invalid rawSize=9223372036854775807",
weights-free	coverage may not go down	2026-09-06T06:25:42.3974460Z     "invalid rawSize=0",
weights-free	coverage may not go down	2026-09-06T06:25:42.3974680Z     "invalid size=0",
weights-free	coverage may not go down	2026-09-06T06:25:42.3975020Z     "overlapping ranges",
weights-free	coverage may not go down	2026-09-06T06:25:42.3975250Z     "range escapes file",
weights-free	coverage may not go down	2026-09-06T06:25:42.3977810Z     "range references unknown file",
weights-free	coverage may not go down	2026-09-06T06:25:42.3979290Z     "path traversal",
weights-free	coverage may not go down	2026-09-06T06:25:42.3980740Z     "compressed corruption",
weights-free	coverage may not go down	2026-09-06T06:25:42.3983920Z     "reconstruction digest is mandatory",
weights-free	coverage may not go down	2026-09-06T06:25:42.3984260Z     "trial starts at 16",
weights-free	coverage may not go down	2026-09-06T06:25:42.3986940Z     "plateau rolls back to 8",
weights-free	coverage may not go down	2026-09-06T06:25:42.3988830Z     "useful gain trials 32",
weights-free	coverage may not go down	2026-09-06T06:25:42.3989210Z     "cap stays at 32",
weights-free	coverage may not go down	2026-09-06T06:25:42.3989440Z     "CPU backlog or retries stops expansion",
weights-free	coverage may not go down	2026-09-06T06:25:42.3989770Z     "CPU backlog or retries stops expansion",
weights-free	coverage may not go down	2026-09-06T06:25:42.3990150Z     "original public API signatures remain available",
weights-free	coverage may not go down	2026-09-06T06:25:42.3993550Z     "public synchronous log lifetime closes on cancellation",
weights-free	coverage may not go down	2026-09-06T06:25:42.3994870Z     "dangling resume bits do not report downloaded bytes",
weights-free	coverage may not go down	2026-09-06T06:25:42.3995190Z     "resume progress combines original weight and metadata bytes",
weights-free	coverage may not go down	2026-09-06T06:25:42.3995520Z     "finalized files are not counted as partial progress",
weights-free	coverage may not go down	2026-09-06T06:25:42.3995810Z     "invalid resume bits do not report downloaded bytes",
weights-free	coverage may not go down	2026-09-06T06:25:42.3996170Z     "disk space checked before creating large parts"
weights-free	coverage may not go down	2026-09-06T06:25:42.3997740Z   ],
weights-free	coverage may not go down	2026-09-06T06:25:42.3997940Z   "pass" : true
weights-free	coverage may not go down	2026-09-06T06:25:42.3999310Z }
weights-free	coverage may not go down	2026-09-06T06:26:26.8483290Z {"name": "normal", "pass_": true, "seconds": 0.114, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:26.9281480Z {"name": "cache-miss-reporting", "pass_": true, "seconds": 0.08, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:27.0113000Z {"name": "redirect", "pass_": true, "seconds": 0.083, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:27.0955700Z {"name": "bad-object-fallback", "pass_": true, "seconds": 0.084, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:27.1707810Z {"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.075, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:27.1974070Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.026, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:26:27.2233810Z {"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.026, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:26:27.3023890Z {"name": "optional-absent", "pass_": true, "seconds": 0.079, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:27.3835770Z {"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.081, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:27.4055290Z {"name": "bad-object-fails", "pass_": true, "seconds": 0.022, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:26:27.4858060Z {"name": "retry-after", "pass_": true, "seconds": 0.08, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:32.8296250Z {"name": "transient-retry", "pass_": true, "seconds": 5.343, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:26:44.3035210Z {"name": "wrong-length-fallback", "pass_": true, "seconds": 11.474, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:20.1812180Z {"name": "short-body-fallback", "pass_": true, "seconds": 35.877, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:56.3039630Z {"name": "content-encoding-fallback", "pass_": true, "seconds": 36.12, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:57.7594790Z {"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.457, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:27:57.8735190Z {"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.098, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:27:57.9605110Z {"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.087, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.0510970Z {"name": "resume", "pass_": true, "seconds": 0.091, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.0750300Z {"name": "already-installed", "pass_": true, "seconds": 0.024, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.0989390Z {"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.023, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.1952370Z {"name": "corruption-seed", "pass_": true, "seconds": 0.096, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.2322910Z {"name": "same-size-final-repair", "pass_": true, "seconds": 0.036, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.3182090Z {"name": "invalid-resume-map", "pass_": true, "seconds": 0.085, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.3945310Z {"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.076, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.4725850Z {"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.078, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:27:58.4820420Z {"name": "part-symlink-rejected", "pass_": true, "seconds": 0.009, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:27:58.4915700Z {"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.009, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:27:58.5003920Z {"name": "part-fifo-rejected", "pass_": true, "seconds": 0.008, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:27:59.7528130Z {"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.01, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:28:00.2601190Z ALL HTTP CHECKS PASS
weights-free	coverage may not go down	2026-09-06T06:28:11.2400750Z {"name": "raw-multichunk", "pass_": true, "seconds": 0.821, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:28:11.6164680Z {"name": "raw-installed-no-http", "pass_": true, "seconds": 0.376, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:28:12.5013460Z {"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.885, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:28:13.3324760Z {"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.831, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:28:55.1523620Z {"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 41.82, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:28:55.9773940Z {"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.825, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:28:56.0239810Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.046, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:28:56.5314520Z {"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.507, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:28:57.0728050Z {"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.541, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:29:00.5419880Z {"name": "raw-cancel", "pass_": true, "seconds": 3.468, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T06:29:01.3461930Z {"name": "raw-resume", "pass_": true, "seconds": 0.73, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:29:02.4169360Z {"name": "raw-same-size-repair", "pass_": true, "seconds": 1.07, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T06:29:02.7373240Z ALL RAW HTTP CHECKS PASS
weights-free	coverage may not go down	2026-09-06T06:29:41.1452870Z SUSTAINED MEMORY PASS 110870528 bytes peak RSS
weights-free	coverage may not go down	2026-09-06T06:29:41.7572580Z TRANSPORT LINE COVERAGE PASS: real manifest, HTTP, raw and sustained-memory fixtures
weights-free	coverage may not go down	2026-09-06T06:29:41.7941600Z lcov: coverage.info (10530 line records)
weights-free	coverage may not go down	2026-09-06T06:29:41.8580040Z coverage: 43.31% of 11352 lines across 43 files
weights-free	coverage may not go down	2026-09-06T06:29:41.8582150Z   up    Sources/Slotstream/Errors.swift                      0.00% -> 52.17%
weights-free	coverage may not go down	2026-09-06T06:29:41.8582670Z   up    Sources/Slotstream/GatewayDialect.swift              84.45% -> 86.36%
weights-free	coverage may not go down	2026-09-06T06:29:41.8583640Z   up    Sources/Slotstream/Generate.swift                    17.25% -> 18.88%
weights-free	coverage may not go down	2026-09-06T06:29:41.8584480Z   up    Sources/Slotstream/Governor.swift                    26.76% -> 27.80%
weights-free	coverage may not go down	2026-09-06T06:29:41.8585190Z   up    Sources/Slotstream/Plan.swift                        76.42% -> 78.82%
weights-free	coverage may not go down	2026-09-06T06:29:41.8585850Z   up    Sources/Slotstream/PrefixCache.swift                 80.19% -> 86.79%
weights-free	coverage may not go down	2026-09-06T06:29:41.8586350Z   up    Sources/Slotstream/Server.swift                      10.51% -> 12.91%
weights-free	coverage may not go down	2026-09-06T06:29:41.8586950Z   up    Sources/Slotstream/SlotpackDownload.swift            91.85% -> 97.18%
weights-free	coverage may not go down	2026-09-06T06:29:41.8587580Z   up    Sources/Slotstream/Vision.swift                      29.04% -> 43.57%
weights-free	coverage may not go down	2026-09-06T06:29:41.8588180Z   up    Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift 90.31% -> 91.09%
weights-free	coverage report	﻿2026-09-06T06:29:42.2381150Z Node 20 is being deprecated. This workflow is running with Node 24 by default. If you need to temporarily use Node 20, you can set the ACTIONS_ALLOW_USE_UNSECURE_NODE_VERSION=true environment variable. For more information see: https://github.blog/changelog/2025-09-19-deprecation-of-node-20-on-github-actions-runners/
weights-free	coverage report	2026-09-06T06:29:42.2402320Z ##[group]Run actions/upload-artifact@v4
weights-free	coverage report	2026-09-06T06:29:42.2402860Z with:
weights-free	coverage report	2026-09-06T06:29:42.2403180Z   name: coverage-lcov
weights-free	coverage report	2026-09-06T06:29:42.2403540Z   path: coverage.info
weights-free	coverage report	2026-09-06T06:29:42.2403810Z   if-no-files-found: warn
weights-free	coverage report	2026-09-06T06:29:42.2404230Z   compression-level: 6
weights-free	coverage report	2026-09-06T06:29:42.2404520Z   overwrite: false
weights-free	coverage report	2026-09-06T06:29:42.2404920Z   include-hidden-files: false
weights-free	coverage report	2026-09-06T06:29:42.2405240Z ##[endgroup]
weights-free	coverage report	2026-09-06T06:29:42.7026410Z (node:47630) [DEP0040] DeprecationWarning: The `punycode` module is deprecated. Please use a userland alternative instead.
weights-free	coverage report	2026-09-06T06:29:42.7027700Z (Use `node --trace-deprecation ...` to show where the warning was created)
weights-free	coverage report	2026-09-06T06:29:42.7074870Z With the provided path, there will be 1 file uploaded
weights-free	coverage report	2026-09-06T06:29:42.7078910Z Artifact name is valid!
weights-free	coverage report	2026-09-06T06:29:42.7080170Z Root directory input is valid!
weights-free	coverage report	2026-09-06T06:29:43.0228580Z Beginning upload of artifact content to blob storage
weights-free	coverage report	2026-09-06T06:29:43.0518090Z (node:47630) [DEP0169] DeprecationWarning: `url.parse()` behavior is not standardized and prone to errors that have security implications. Use the WHATWG URL API instead. CVEs are not issued for `url.parse()` vulnerabilities.
weights-free	coverage report	2026-09-06T06:29:43.2588900Z Uploaded bytes 51027
weights-free	coverage report	2026-09-06T06:29:43.3011090Z Finished uploading artifact content to blob storage!
weights-free	coverage report	2026-09-06T06:29:43.3011880Z SHA256 digest of uploaded artifact zip is 3e05d4a4b0e0b20fece536ba5d38769b458db1753a546da5b6b49e31c7190c7c
weights-free	coverage report	2026-09-06T06:29:43.3012440Z Finalizing artifact upload
weights-free	coverage report	2026-09-06T06:29:43.5678310Z Artifact coverage-lcov.zip successfully finalized. Artifact ID 9984090013
weights-free	coverage report	2026-09-06T06:29:43.5680590Z Artifact coverage-lcov has been successfully uploaded! Final size is 51027 bytes. Artifact ID is 9984090013
weights-free	coverage report	2026-09-06T06:29:43.5707220Z Artifact download URL: https://github.com/carloslfu/slotstream/actions/runs/34015713057/artifacts/9984090013
weights-free	Post Run actions/checkout@v7	﻿2026-09-06T06:29:43.6170480Z Post job cleanup.
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7450200Z [command]/opt/homebrew/bin/git version
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7674070Z git version 2.55.0
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7691770Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/fae98411-bb99-4679-8663-b2b989ea74ba/.gitconfig'
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7698340Z Temporarily overriding HOME='/Users/runner/work/_temp/fae98411-bb99-4679-8663-b2b989ea74ba' before making global git config changes
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7699250Z Adding repository directory to the temporary git global config as a safe directory
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7702500Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7823870Z Removing SSH command configuration
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7828790Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.7893910Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.8789190Z Removing HTTP extra header
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.8792670Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.8854380Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9550930Z Removing includeIf entries pointing to credentials config files
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9554840Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9606510Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9607190Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9607630Z includeif.gitdir:/github/workspace/.git.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9607950Z includeif.gitdir:/github/workspace/.git/worktrees/*.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9611860Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9662320Z /Users/runner/work/_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9668790Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path \/Users\/runner\/work\/_temp\/git\-credentials\-4be9a072\-4459\-485d\-a840\-1ce40db35080\.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9735260Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9783420Z /Users/runner/work/_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9794180Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path \/Users\/runner\/work\/_temp\/git\-credentials\-4be9a072\-4459\-485d\-a840\-1ce40db35080\.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9850640Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:43.9909310Z /github/runner_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:44.0215150Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git.path \/github\/runner_temp\/git\-credentials\-4be9a072\-4459\-485d\-a840\-1ce40db35080\.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:44.0373630Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git/worktrees/*.path
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:44.0378730Z /github/runner_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:44.0412380Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git/worktrees/*.path \/github\/runner_temp\/git\-credentials\-4be9a072\-4459\-485d\-a840\-1ce40db35080\.config
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:44.0418050Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
weights-free	Post Run actions/checkout@v7	2026-09-06T06:29:44.1093590Z Removing credentials config '/Users/runner/work/_temp/git-credentials-4be9a072-4459-485d-a840-1ce40db35080.config'
weights-free	Complete job	﻿2026-09-06T06:29:44.1198250Z Cleaning up orphan processes
weights-free	Complete job	2026-09-06T06:29:46.0130540Z ##[warning]Node.js 20 is deprecated. The following actions target Node.js 20 but are being forced to run on Node.js 24: actions/upload-artifact@v4. For more information see: https://github.blog/changelog/2025-09-19-deprecation-of-node-20-on-github-actions-runners/
```

## Installer

Local log SHA-256: `2bb0e6235a5842b53433252f2bce71b2aa6662a77f56eb5b156e325e16b2c4d0`

```text
downloading slotstream (latest release, about 50 MB)
#=#=#                                                                          
##O#-#                                                                         
##O=#  #                                                                       

                                                                           0.0%
#                                                                          1.7%
######                                                                     9.1%
##########                                                                15.1%
################                                                          22.3%
#######################                                                   32.1%
##############################                                            42.7%
#####################################                                     52.5%
#############################################                             62.8%
####################################################                      72.9%
###########################################################               82.8%
##################################################################        92.2%
######################################################################## 100.0%
installed slotstream 0.2.10 to /Users/carlos/.slotstream/bin
next:  slotstream serve
```

## Model smoke

Local log SHA-256: `052b32deee41a078fd110557fc943f67ad4ace119d70a76b71e2b217080fe65c`

```text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (38.5 GB reclaimable now), 40.2 GB Metal working set
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
-- prefill 17 tok in 1.22s (13.9 tok/s)
-- prefill split: io 0.77s + scatter 0.00s + compute 0.44s | 3160 records (8.7 GB, 11.3 GB/s)
-- decode 1 tok in 0.22s (4.59 tok/s)
-- decode split: io 0.11s + scatter 0.00s + compute 0.10s | 414 records
-- expert cache ~20/512 experts per layer, hit rate 0.138 | ngram rows 0h/16m | peak 6.4 GB | total 1.4s

```

The temporary full-size qualification copies were removed after their complete verification; the canonical local model and the public R2 package remain. The test receipt replaces ephemeral loopback ports with a fixture label. A local evidence helper first used a tar API unavailable in the system Python; it stopped after attestation verification and before installation. The corrected helper extracts only the two explicitly allowlisted regular archive members with bounded sizes, and the retained installer run completed successfully. No product source or published asset changed for this helper correction.

## Downloaded CI coverage artifact

The public artifact was retrieved after a transient connection failure. Its exact LCOV confirms the downloader line totals below; the complete CI log records the unchanged ratchet passing.

```json
{
  "artifact": "coverage-lcov",
  "run": "https://github.com/carloslfu/slotstream/actions/runs/34015713057",
  "sha256": "4d6d3bf8722af32cc9f7f6d48b33a01a3fd29bb9cf49b1868bc15cc5d5ecdc3f",
  "downloaded": true,
  "downloader": {
    "file": "Sources/Slotstream/SlotpackDownload.swift",
    "lines": 319,
    "hit": 310
  }
}
```
