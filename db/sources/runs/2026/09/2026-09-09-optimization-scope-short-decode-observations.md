---
type: run
id: 01m22jk1ddxzspdpmk3y8cdn7q
created: 2026-09-09T07:54:46.061317+00:00
updated: 2026-09-09T07:54:46.365088+00:00
summary: 'Scope short-decode observation: identical read work with higher reported I/O time; sustained behavior remains unmeasured'
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-09
command: Read-only analysis of the five original eligible V467 measured pairs
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Scope short-decode observation: identical read work with higher reported I/O time; sustained behavior remains unmeasured'
tool: Slotstream exact native and source qualification capture
---
This preserves an observed-only followup to the completed V467 isolated explicit-scope study. The exact complete source is [[sources/runs/2026/09/2026-09-09-optimization-explicit-scope-complete-startup-inconclusive]]. All five clean pairs have identical decode record counts, bytes and reported expert hit rate; the scope arm reports higher I/O time. No responsible process, cache mechanism or causal explanation is established. The original full study remains startup-unqualified. These sixteen-token observations do not establish sustained throughput, and no new measurement, score change or optimization was introduced.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/scope-decode-attribution-v487/observations.json",
    "bytes": 5872,
    "sha256": "0c28dd61a12977358063fdef8dd87acbf526b0d1557a6add0a7d44191c9ca444"
  }
]
```

## Artifact SHA-256 0c28dd61a12977358063fdef8dd87acbf526b0d1557a6add0a7d44191c9ca444

Encoding: `utf-8`. Original bytes: 5872.

````````````text
{
  "created_utc": "2026-09-09T06:44:32.416559+00:00",
  "results_sha256": "cb6cc7c6101d465a84405b9167bc63c3549ed3e804f3e626172d2df12b8342c3",
  "source": "db/sources/runs/2026/09/2026-09-09-optimization-explicit-scope-complete-startup-inconclusive.md",
  "classification": "Observed-only followup to the isolated scope mechanism; full study remains startup-unqualified. No added measurements, rescore or feature change.",
  "pairs": [
    {
      "round": 1,
      "reference": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0740552180000005,
        "decodeSeconds": 2.427338583,
        "sampleSeconds": 0.004179169,
        "tokenCallbackSeconds": 0.0034909980000000004,
        "physicalFootprintEndBytes": 8076120072,
        "mlxCacheEndBytes": 533646361
      },
      "scope": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0922962489999997,
        "decodeSeconds": 2.451216292,
        "sampleSeconds": 0.0038608320000000002,
        "tokenCallbackSeconds": 0.0033467059999999996,
        "physicalFootprintEndBytes": 7919095792,
        "mlxCacheEndBytes": 402445334
      },
      "reported_read_seconds_change_percent": 1.698332701550087
    },
    {
      "round": 9,
      "reference": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0237976120000007,
        "decodeSeconds": 2.340170125,
        "sampleSeconds": 0.004031707999999999,
        "tokenCallbackSeconds": 0.0032480830000000006,
        "physicalFootprintEndBytes": 8052953072,
        "mlxCacheEndBytes": 542873014
      },
      "scope": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0840312449999996,
        "decodeSeconds": 2.4085875,
        "sampleSeconds": 0.003768041,
        "tokenCallbackSeconds": 0.0032021669999999997,
        "physicalFootprintEndBytes": 7878135744,
        "mlxCacheEndBytes": 402460296
      },
      "reported_read_seconds_change_percent": 5.8833535353078
    },
    {
      "round": 14,
      "reference": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.000788919,
        "decodeSeconds": 2.27080275,
        "sampleSeconds": 0.004095416,
        "tokenCallbackSeconds": 0.003195458,
        "physicalFootprintEndBytes": 8050249760,
        "mlxCacheEndBytes": 539694274
      },
      "scope": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0508757869999992,
        "decodeSeconds": 2.349281041,
        "sampleSeconds": 0.004007504,
        "tokenCallbackSeconds": 0.0032740000000000004,
        "physicalFootprintEndBytes": 7880495136,
        "mlxCacheEndBytes": 402445334
      },
      "reported_read_seconds_change_percent": 5.0047384667334605
    },
    {
      "round": 15,
      "reference": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0098609209999994,
        "decodeSeconds": 2.298366125,
        "sampleSeconds": 0.003848793,
        "tokenCallbackSeconds": 0.003215624,
        "physicalFootprintEndBytes": 8046661616,
        "mlxCacheEndBytes": 543284145
      },
      "scope": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0290362600000003,
        "decodeSeconds": 2.332640208,
        "sampleSeconds": 0.003733754,
        "tokenCallbackSeconds": 0.003233582,
        "physicalFootprintEndBytes": 7888162800,
        "mlxCacheEndBytes": 402445334
      },
      "reported_read_seconds_change_percent": 1.8988098857229518
    },
    {
      "round": 16,
      "reference": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 0.9961250459999983,
        "decodeSeconds": 2.257896791,
        "sampleSeconds": 0.0038991250000000007,
        "tokenCallbackSeconds": 0.0032794990000000004,
        "physicalFootprintEndBytes": 8059441208,
        "mlxCacheEndBytes": 542562890
      },
      "scope": {
        "decodeRecords": 3961,
        "decodeReadBytes": 10951372800,
        "expertHitRate": 0.4498611111111111,
        "ngramRowMisses": 0,
        "decodeIOSeconds": 1.0491217979999996,
        "decodeSeconds": 2.423501708,
        "sampleSeconds": 0.004156208999999999,
        "tokenCallbackSeconds": 0.0033591669999999993,
        "physicalFootprintEndBytes": 7878103000,
        "mlxCacheEndBytes": 402445334
      },
      "reported_read_seconds_change_percent": 5.3202910832142125
    }
  ],
  "observation": "All five clean measured pairs report identical decode record count, read bytes and expert hit rate. The scope arm reports longer decode I/O time in all five. This does not identify the cause or establish sustained-throughput regression.",
  "median_reported_read_seconds_increase_percent": 5.0047384667334605,
  "next_required_check": "Use the original sustained-decode cohorts and their existing emission windows to determine whether the short initial segment persists; do not add untested cache warming or change admission from this observation alone."
}

````````````
