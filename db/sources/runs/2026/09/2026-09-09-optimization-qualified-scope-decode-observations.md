---
type: run
id: 01m22s58qyray5gc5txjwcwgzz
created: 2026-09-09T09:49:34.846229+00:00
updated: 2026-09-09T09:49:35.155051+00:00
summary: Qualified scope cohort retains decode work and lowers end memory while short I/O time rises
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-09
command: Read-only comparison of all11 original eligible measured V484 pairs
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Qualified scope cohort retains decode work and lowers end memory while short I/O time rises
tool: Slotstream exact native and source qualification capture
---
Every clean V484 pair has identical decode record counts, read bytes, expert hit rate, n-gram cache rows/payload and embedding cache rows/payload. Scope has lower MLX active and cached bytes and lower physical footprint at request completion in every pair. The median paired end-footprint reduction is2.0757279160788733percent, distinct from its14.971647516642218percent higher transient sampled peak. Reported decode I/O time rises in9of11 pairs, with median paired increase4.129632759282642percent. These observations do not establish a causal mechanism or sustained TPS. Original paired eligibility, acceptance and raw rows remain unchanged; no new inference or score is introduced.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/scope-decode-observations-v502/observations.json",
    "bytes": 16467,
    "sha256": "3870a4dabd372066ae040c1333d2fec69b32bf35ff47a84ae2310098afe886f7"
  }
]
```

## Artifact SHA-256 3870a4dabd372066ae040c1333d2fec69b32bf35ff47a84ae2310098afe886f7

Encoding: `utf-8`. Original bytes: 16467.

````````````text
{
  "classification": "Read-only observations from all11 V484 eligible measured pairs; no new inference, exclusions, rescore or causal claim. Sixteen outputs do not establish sustained TPS.",
  "raw_sha256": "ea116b83ead1fd085f1417107aff79c2a94ce0d25f797d376dc2a45944602468",
  "audit_sha256": "889b0bac1ce94174343fe0d11aa0f9abef5858ccd3510c160be5ac248dbe71b6",
  "clean_pairs": 11,
  "fields": [
    "decodeRecords",
    "decodeReadBytes",
    "decodeIOSeconds",
    "expertHitRate",
    "mlxActiveEndBytes",
    "mlxCacheEndBytes",
    "physicalFootprintEndBytes",
    "ngramCachedRows",
    "ngramCachePayloadBytes",
    "embeddingCachedRows",
    "embeddingCachedPayloadBytes"
  ],
  "summary": {
    "decodeRecords": {
      "reference_median": 3961,
      "scope_median": 3961,
      "median_paired_change_percent": 0.0,
      "equal_pairs": 11,
      "higher_pairs": 0
    },
    "decodeReadBytes": {
      "reference_median": 10951372800,
      "scope_median": 10951372800,
      "median_paired_change_percent": 0.0,
      "equal_pairs": 11,
      "higher_pairs": 0
    },
    "decodeIOSeconds": {
      "reference_median": 1.0048543989999998,
      "scope_median": 1.0427144229999994,
      "median_paired_change_percent": 4.129632759282642,
      "equal_pairs": 0,
      "higher_pairs": 9
    },
    "expertHitRate": {
      "reference_median": 0.4498611111111111,
      "scope_median": 0.4498611111111111,
      "median_paired_change_percent": 0.0,
      "equal_pairs": 11,
      "higher_pairs": 0
    },
    "mlxActiveEndBytes": {
      "reference_median": 6172641980,
      "scope_median": 6172543676,
      "median_paired_change_percent": -0.0015925757612111902,
      "equal_pairs": 0,
      "higher_pairs": 0
    },
    "mlxCacheEndBytes": {
      "reference_median": 541700009,
      "scope_median": 402445334,
      "median_paired_change_percent": -25.706972989915535,
      "equal_pairs": 0,
      "higher_pairs": 0
    },
    "physicalFootprintEndBytes": {
      "reference_median": 8056524880,
      "scope_median": 7887818736,
      "median_paired_change_percent": -2.0757279160788733,
      "equal_pairs": 0,
      "higher_pairs": 0
    },
    "ngramCachedRows": {
      "reference_median": 40278,
      "scope_median": 40278,
      "median_paired_change_percent": 0.0,
      "equal_pairs": 11,
      "higher_pairs": 0
    },
    "ngramCachePayloadBytes": {
      "reference_median": 25777920,
      "scope_median": 25777920,
      "median_paired_change_percent": 0.0,
      "equal_pairs": 11,
      "higher_pairs": 0
    },
    "embeddingCachedRows": {
      "reference_median": 825,
      "scope_median": 825,
      "median_paired_change_percent": 0.0,
      "equal_pairs": 11,
      "higher_pairs": 0
    },
    "embeddingCachedPayloadBytes": {
      "reference_median": 1188000,
      "scope_median": 1188000,
      "median_paired_change_percent": 0.0,
      "equal_pairs": 11,
      "higher_pairs": 0
    }
  },
  "pairs": [
    {
      "round": 3,
      "values": {
        "decodeRecords": {
          "reference": 3961,
          "scope": 3961
        },
        "decodeReadBytes": {
          "reference": 10951372800,
          "scope": 10951372800
        },
        "decodeIOSeconds": {
          "reference": 1.0058010880000003,
          "scope": 1.055640859999999
        },
        "expertHitRate": {
          "reference": 0.4498611111111111,
          "scope": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "reference": 6172642120,
          "scope": 6172543676
        },
        "mlxCacheEndBytes": {
          "reference": 543366102,
          "scope": 402445334
        },
        "physicalFootprintEndBytes": {
          "reference": 8043859904,
          "scope": 7891259424
        },
        "ngramCachedRows": {
          "reference": 40278,
          "scope": 40278
        },
        "ngramCachePayloadBytes": {
          "reference": 25777920,
          "scope": 25777920
        },
        "embeddingCachedRows": {
          "reference": 825,
          "scope": 825
        },
        "embeddingCachedPayloadBytes": {
          "reference": 1188000,
          "scope": 1188000
        }
      }
    },
    {
      "round": 4,
      "values": {
        "decodeRecords": {
          "scope": 3961,
          "reference": 3961
        },
        "decodeReadBytes": {
          "scope": 10951372800,
          "reference": 10951372800
        },
        "decodeIOSeconds": {
          "scope": 1.0416622080000004,
          "reference": 0.9942156529999999
        },
        "expertHitRate": {
          "scope": 0.4498611111111111,
          "reference": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "scope": 6172543676,
          "reference": 6172642120
        },
        "mlxCacheEndBytes": {
          "scope": 402445334,
          "reference": 542537386
        },
        "physicalFootprintEndBytes": {
          "scope": 7878365144,
          "reference": 8046530712
        },
        "ngramCachedRows": {
          "scope": 40278,
          "reference": 40278
        },
        "ngramCachePayloadBytes": {
          "scope": 25777920,
          "reference": 25777920
        },
        "embeddingCachedRows": {
          "scope": 825,
          "reference": 825
        },
        "embeddingCachedPayloadBytes": {
          "scope": 1188000,
          "reference": 1188000
        }
      }
    },
    {
      "round": 5,
      "values": {
        "decodeRecords": {
          "reference": 3961,
          "scope": 3961
        },
        "decodeReadBytes": {
          "reference": 10951372800,
          "scope": 10951372800
        },
        "decodeIOSeconds": {
          "reference": 1.004024416,
          "scope": 1.0427144229999994
        },
        "expertHitRate": {
          "reference": 0.4498611111111111,
          "scope": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "reference": 6172625596,
          "scope": 6172543676
        },
        "mlxCacheEndBytes": {
          "reference": 543793617,
          "scope": 402445334
        },
        "physicalFootprintEndBytes": {
          "reference": 8058982504,
          "scope": 7887818736
        },
        "ngramCachedRows": {
          "reference": 40278,
          "scope": 40278
        },
        "ngramCachePayloadBytes": {
          "reference": 25777920,
          "scope": 25777920
        },
        "embeddingCachedRows": {
          "reference": 825,
          "scope": 825
        },
        "embeddingCachedPayloadBytes": {
          "reference": 1188000,
          "scope": 1188000
        }
      }
    },
    {
      "round": 6,
      "values": {
        "decodeRecords": {
          "scope": 3961,
          "reference": 3961
        },
        "decodeReadBytes": {
          "scope": 10951372800,
          "reference": 10951372800
        },
        "decodeIOSeconds": {
          "scope": 1.0324930829999999,
          "reference": 1.0048543989999998
        },
        "expertHitRate": {
          "scope": 0.4498611111111111,
          "reference": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "scope": 6172543676,
          "reference": 6172641980
        },
        "mlxCacheEndBytes": {
          "scope": 402440774,
          "reference": 534333347
        },
        "physicalFootprintEndBytes": {
          "scope": 7880249304,
          "reference": 8044744736
        },
        "ngramCachedRows": {
          "scope": 40278,
          "reference": 40278
        },
        "ngramCachePayloadBytes": {
          "scope": 25777920,
          "reference": 25777920
        },
        "embeddingCachedRows": {
          "scope": 825,
          "reference": 825
        },
        "embeddingCachedPayloadBytes": {
          "scope": 1188000,
          "reference": 1188000
        }
      }
    },
    {
      "round": 7,
      "values": {
        "decodeRecords": {
          "reference": 3961,
          "scope": 3961
        },
        "decodeReadBytes": {
          "reference": 10951372800,
          "scope": 10951372800
        },
        "decodeIOSeconds": {
          "reference": 1.0262706159999995,
          "scope": 1.043594789
        },
        "expertHitRate": {
          "reference": 0.4498611111111111,
          "scope": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "reference": 6172658364,
          "scope": 6172543676
        },
        "mlxCacheEndBytes": {
          "reference": 531946099,
          "scope": 402445334
        },
        "physicalFootprintEndBytes": {
          "reference": 8062046240,
          "scope": 7907905568
        },
        "ngramCachedRows": {
          "reference": 40278,
          "scope": 40278
        },
        "ngramCachePayloadBytes": {
          "reference": 25777920,
          "scope": 25777920
        },
        "embeddingCachedRows": {
          "reference": 825,
          "scope": 825
        },
        "embeddingCachedPayloadBytes": {
          "reference": 1188000,
          "scope": 1188000
        }
      }
    },
    {
      "round": 9,
      "values": {
        "decodeRecords": {
          "reference": 3961,
          "scope": 3961
        },
        "decodeReadBytes": {
          "reference": 10951372800,
          "scope": 10951372800
        },
        "decodeIOSeconds": {
          "reference": 1.0673899480000009,
          "scope": 1.0435210889999995
        },
        "expertHitRate": {
          "reference": 0.4498611111111111,
          "scope": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "reference": 6172658504,
          "scope": 6172543676
        },
        "mlxCacheEndBytes": {
          "reference": 544605442,
          "scope": 402445334
        },
        "physicalFootprintEndBytes": {
          "reference": 8057491488,
          "scope": 7877906464
        },
        "ngramCachedRows": {
          "reference": 40278,
          "scope": 40278
        },
        "ngramCachePayloadBytes": {
          "reference": 25777920,
          "scope": 25777920
        },
        "embeddingCachedRows": {
          "reference": 825,
          "scope": 825
        },
        "embeddingCachedPayloadBytes": {
          "reference": 1188000,
          "scope": 1188000
        }
      }
    },
    {
      "round": 11,
      "values": {
        "decodeRecords": {
          "reference": 3961,
          "scope": 3961
        },
        "decodeReadBytes": {
          "reference": 10951372800,
          "scope": 10951372800
        },
        "decodeIOSeconds": {
          "reference": 0.9989504590000002,
          "scope": 1.0435469899999998
        },
        "expertHitRate": {
          "reference": 0.4498611111111111,
          "scope": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "reference": 6172625596,
          "scope": 6172543676
        },
        "mlxCacheEndBytes": {
          "reference": 536742150,
          "scope": 402445334
        },
        "physicalFootprintEndBytes": {
          "reference": 8056524880,
          "scope": 7889293344
        },
        "ngramCachedRows": {
          "reference": 40278,
          "scope": 40278
        },
        "ngramCachePayloadBytes": {
          "reference": 25777920,
          "scope": 25777920
        },
        "embeddingCachedRows": {
          "reference": 825,
          "scope": 825
        },
        "embeddingCachedPayloadBytes": {
          "reference": 1188000,
          "scope": 1188000
        }
      }
    },
    {
      "round": 13,
      "values": {
        "decodeRecords": {
          "reference": 3961,
          "scope": 3961
        },
        "decodeReadBytes": {
          "reference": 10951372800,
          "scope": 10951372800
        },
        "decodeIOSeconds": {
          "reference": 0.9978130019999989,
          "scope": 1.0414018050000011
        },
        "expertHitRate": {
          "reference": 0.4498611111111111,
          "scope": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "reference": 6172641980,
          "scope": 6172543676
        },
        "mlxCacheEndBytes": {
          "reference": 541700009,
          "scope": 402445334
        },
        "physicalFootprintEndBytes": {
          "reference": 8067813408,
          "scope": 7878070232
        },
        "ngramCachedRows": {
          "reference": 40278,
          "scope": 40278
        },
        "ngramCachePayloadBytes": {
          "reference": 25777920,
          "scope": 25777920
        },
        "embeddingCachedRows": {
          "reference": 825,
          "scope": 825
        },
        "embeddingCachedPayloadBytes": {
          "reference": 1188000,
          "scope": 1188000
        }
      }
    },
    {
      "round": 14,
      "values": {
        "decodeRecords": {
          "scope": 3961,
          "reference": 3961
        },
        "decodeReadBytes": {
          "scope": 10951372800,
          "reference": 10951372800
        },
        "decodeIOSeconds": {
          "scope": 1.0347574240000015,
          "reference": 0.9937204200000004
        },
        "expertHitRate": {
          "scope": 0.4498611111111111,
          "reference": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "scope": 6172543676,
          "reference": 6172609528
        },
        "mlxCacheEndBytes": {
          "scope": 402445334,
          "reference": 543910909
        },
        "physicalFootprintEndBytes": {
          "scope": 7878119408,
          "reference": 8057573408
        },
        "ngramCachedRows": {
          "scope": 40278,
          "reference": 40278
        },
        "ngramCachePayloadBytes": {
          "scope": 25777920,
          "reference": 25777920
        },
        "embeddingCachedRows": {
          "scope": 825,
          "reference": 825
        },
        "embeddingCachedPayloadBytes": {
          "scope": 1188000,
          "reference": 1188000
        }
      }
    },
    {
      "round": 15,
      "values": {
        "decodeRecords": {
          "reference": 3961,
          "scope": 3961
        },
        "decodeReadBytes": {
          "reference": 10951372800,
          "scope": 10951372800
        },
        "decodeIOSeconds": {
          "reference": 1.0056416720000012,
          "scope": 1.0520677079999998
        },
        "expertHitRate": {
          "reference": 0.4498611111111111,
          "scope": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "reference": 6172642296,
          "scope": 6172543676
        },
        "mlxCacheEndBytes": {
          "reference": 531366366,
          "scope": 402445334
        },
        "physicalFootprintEndBytes": {
          "reference": 8041795616,
          "scope": 7898058832
        },
        "ngramCachedRows": {
          "reference": 40278,
          "scope": 40278
        },
        "ngramCachePayloadBytes": {
          "reference": 25777920,
          "scope": 25777920
        },
        "embeddingCachedRows": {
          "reference": 825,
          "scope": 825
        },
        "embeddingCachedPayloadBytes": {
          "reference": 1188000,
          "scope": 1188000
        }
      }
    },
    {
      "round": 16,
      "values": {
        "decodeRecords": {
          "scope": 3961,
          "reference": 3961
        },
        "decodeReadBytes": {
          "scope": 10951372800,
          "reference": 10951372800
        },
        "decodeIOSeconds": {
          "scope": 1.0172263859999997,
          "reference": 1.0455645479999995
        },
        "expertHitRate": {
          "scope": 0.4498611111111111,
          "reference": 0.4498611111111111
        },
        "mlxActiveEndBytes": {
          "scope": 6172543676,
          "reference": 6172625912
        },
        "mlxCacheEndBytes": {
          "scope": 402445334,
          "reference": 539518074
        },
        "physicalFootprintEndBytes": {
          "scope": 7901483040,
          "reference": 8054755360
        },
        "ngramCachedRows": {
          "scope": 40278,
          "reference": 40278
        },
        "ngramCachePayloadBytes": {
          "scope": 25777920,
          "reference": 25777920
        },
        "embeddingCachedRows": {
          "scope": 825,
          "reference": 825
        },
        "embeddingCachedPayloadBytes": {
          "scope": 1188000,
          "reference": 1188000
        }
      }
    }
  ]
}

````````````
