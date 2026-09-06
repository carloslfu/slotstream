---
type: run
id: 01m1vtwcm843rag8t8zrqhttqd
created: 2026-09-06T17:05:00.040532+00:00
updated: 2026-09-06T17:05:00.103108+00:00
summary: Preserve the native Mac DNS-failure attempt, resumable verified progress and cross-client network diagnostics; its timing measurements are discarded.
binary: 828a896582804292ba7976399100416429b19a94a860ca5df4393b60b106a77d
captured_at: 2026-09-06
command: full_pull.py --binary candidate-v0.2.11 --default-source; bounded independent network probes
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Mac network interruption during Hugging Face qualification
tool: Native CLI, process sample, bounded curl ranges and hostname resolution
---
The first native Mac attempt began in an empty directory with no source, transport or connection override. Its transfer slowed substantially late in the run and stopped with URLSession code -1003 (hostname resolution). It emitted no successful final transfer/fallback summary, so this source does not claim a complete pull or zero raw fallbacks. The memory guard did not fire. Verified output and the resume map remain in the original destination; no external model chunks were introduced before the subsequent resume.

Timing/capacity figures are discarded: bounded builds/static tests, one independent bounded native correctness run, and an earlier-client compatibility transfer overlapped parts of the attempt, and the connection degraded. This record preserves fault isolation and progress, not a host-performance comparison.

A process sample during the slowdown found active download workers waiting inside DownloadHTTP.once; a fresh curl connection to a compressed object was also slow. A raw Hugging Face range was slow too, and a GitHub release range reached its deadline after only a partial body. The resolver headers still advertised available quota. These probes indicate a receiving/network-path problem rather than a compression throughput measurement, but they do not identify an ISP, router or provider cause. Hostname-resolution probes after the exit succeeded, permitting a normal resume.

## Failed native attempt

```json
{
  "pass_": false,
  "fresh": true,
  "binarySHA256": "828a896582804292ba7976399100416429b19a94a860ca5df4393b60b106a77d",
  "exitCode": 1,
  "guardFailure": [],
  "lastClientOutput": [
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1179 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1180 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1180 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1181 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1182 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1182 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1183 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1184 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1184 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1185 s \u00b7 13/25 files verified\n",
    "75.5% verified \u00b7 0.0 MB/s received \u00b7 ETA 1186 s \u00b7 13/25 files verified\n",
    "Error: network transfer failed (URLSession code -1003); rerun to resume\n"
  ],
  "sampledPeakRSSBytes": 1267712000,
  "receiptSHA256": "7021fdad1e6828fa89984897edc1ca5bf44fefcf9c9c693468ba73f4b9dc4366"
}
```

## Hugging Face resolver headers

```json
{
  "capturedAt": "2026-09-06T16:42:06.417811+00:00",
  "requests": [
    {
      "path": "manifest.json",
      "status": 307,
      "headers": {
        "Content-Length": "502",
        "Date": "Sun, 06 Sep 2026 16:42:04 GMT",
        "RateLimit": "\"resolvers\";r=2922;t=8",
        "RateLimit-Policy": "\"fixed window\";\"resolvers\";q=3000;w=300"
      }
    },
    {
      "path": "objects/f8/f8d056d40477c485e58be568de748f76f334f548e5ef3f4ea177c32b3f999fe3.bin",
      "status": 302,
      "headers": {
        "Content-Length": "1337",
        "Date": "Sun, 06 Sep 2026 16:42:06 GMT",
        "RateLimit": "\"resolvers\";r=2920;t=6",
        "RateLimit-Policy": "\"fixed window\";\"resolvers\";q=3000;w=300"
      }
    }
  ]
}
```

## Fresh compressed connection

```json
{
  "capturedAt": "2026-09-06T16:44:49.359621+00:00",
  "exitCode": 0,
  "objectSHA256": "359c1461a8ba63ea6deccf025f6995836b4708fadf2be2ef7022fada040f371b",
  "range": "bytes=0-4194303",
  "diagnosticOnly": true,
  "curl": {
    "httpStatus": 206,
    "bytes": 4194304,
    "bytesPerSecond": 260440,
    "firstByteSeconds": 1.098178,
    "seconds": 16.104635,
    "connections": 2
  }
}
```

## Other routes during the slowdown

```json
{
  "capturedAt": "2026-09-06T16:46:48.722792+00:00",
  "diagnosticOnly": true,
  "range": "bytes=0-4194303",
  "probes": [
    {
      "label": "raw-hf",
      "exitCode": 0,
      "curl": {
        "httpStatus": 206,
        "bytes": 4194304,
        "bytesPerSecond": 269557,
        "firstByteSeconds": 1.910425,
        "seconds": 15.559966,
        "connections": 2
      }
    },
    {
      "label": "github-release",
      "exitCode": 28,
      "curl": {
        "httpStatus": 206,
        "bytes": 2564540,
        "bytesPerSecond": 85439,
        "firstByteSeconds": 2.023603,
        "seconds": 30.015819,
        "connections": 2
      }
    }
  ]
}
```

## Hostname resolution after the failure

```json
{
  "capturedAt": "2026-09-06T16:58:16.263535+00:00",
  "checks": [
    {
      "host": "huggingface.co",
      "resolved": true,
      "seconds": 0.156152125
    },
    {
      "host": "us.aws.cdn.hf.co",
      "resolved": true,
      "seconds": 0.14984895899999998
    },
    {
      "host": "github.com",
      "resolved": true,
      "seconds": 0.040116666999999995
    }
  ]
}
```
