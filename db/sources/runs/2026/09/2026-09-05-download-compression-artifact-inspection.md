---
type: run
id: 01m1t4nkbfccf34yhe5jhr5css
created: 2026-09-06T01:17:34.447649+00:00
updated: 2026-09-06T01:17:55.650776+00:00
summary: Both complete shard archives save 16% and restore the pinned hash; 106-window weighted estimate is 105.264 GB to 88.455 GB; no accepted runtime-speed claim
binary: .venv31/bin/python; exact probe and native library hashes in body
captured_at: 2026-09-06
command: .venv31/bin/python .build/download-compression-max/build_evidence.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Independent inspection of lossless compression artifacts
tool: Python hashlib and file inspection
---
# Compression artifact inspection

This read-only inspection verifies current archive byte counts and reconstructed-file SHA-256 independently of the discarded runtime timings. The complete checkpoint estimate is an arithmetic extrapolation from the stated sample design, not a completed 105 GB archive. The original `holdout.json` field named `unique_windows_sampled_bytes` counts all sampled windows including overlaps; this inspection reports both total and distinct covered bytes correctly.

Raw experiments and reproducible source: [[sources/runs/2026/09/2026-09-05-download-aggressive-lossless-experiments]].

```json
{
  "captured_at_utc": "2026-09-06T01:14:02.277237+00:00",
  "purpose": "Deterministic artifact sizes, source closure, and hash identity; no runtime performance claim.",
  "git_head": "770dba67a298450231d6f2a6f2ead08ffa4aac16",
  "pinned_original_sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0",
  "report_data": {
    "holdout_windows": 106,
    "sampled_bytes_including_overlapping_windows": 779206656,
    "distinct_sampled_original_bytes": 764782592,
    "files_covered": [
      "model-00001.safetensors",
      "model-00002.safetensors",
      "model-00003.safetensors",
      "model-00004.safetensors",
      "model-00005.safetensors",
      "model-00006.safetensors",
      "model-00007.safetensors",
      "model-00008.safetensors",
      "model-00009.safetensors",
      "model-00010.safetensors",
      "model-00011.safetensors",
      "mtp.safetensors"
    ],
    "screen_exact_roundtrips": 377,
    "holdout_exact_roundtrips": 654,
    "native_exact_roundtrips": 48,
    "native_synthetic_exact_roundtrips": 12,
    "estimates": {
      "strata": [
        {
          "stratum": [
            "experts",
            "pairs"
          ],
          "population_bytes": 7549747200,
          "samples": 16,
          "sample_bytes": 134217728,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.6385670155286789,
            "shuffle2/zstd19": 0.5424335896968842,
            "pred_shuffle2/zstd3": 0.33698079735040665,
            "pred_shuffle2/zstd9": 0.3256971538066864,
            "pred_shuffle2/zstd19": 0.30521032214164734,
            "pred_ans": 0.29198481142520905
          },
          "best_fixed_method": "pred_ans",
          "fast_adaptive_fraction": 0.3256971538066864,
          "strong_adaptive_fraction": 0.29198481142520905,
          "strong_sample_minmax": [
            0.28736817836761475,
            0.29970312118530273
          ]
        },
        {
          "stratum": [
            "experts",
            "weights"
          ],
          "population_bytes": 60397977600,
          "samples": 16,
          "sample_bytes": 134217728,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.9324445798993111,
            "raw/zstd19": 0.932349719107151,
            "centerpacked/zstd3": 0.9280281588435173,
            "context_nibble_center": 0.9227509200572968,
            "context_byte_center": 0.9230014234781265,
            "context_nibble_scale": 0.9209062531590462,
            "context_byte_scale": 0.9225276485085487
          },
          "best_fixed_method": "context_nibble_scale",
          "fast_adaptive_fraction": 0.9280281588435173,
          "strong_adaptive_fraction": 0.9209062531590462,
          "strong_sample_minmax": [
            0.912087082862854,
            0.9238697290420532
          ]
        },
        {
          "stratum": [
            "mtp",
            "bf16"
          ],
          "population_bytes": 6155776,
          "samples": 6,
          "sample_bytes": 17694720,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.787667579650879,
            "shuffle2/zstd19": 0.6880072021484375,
            "planes/zstd19": 0.7288567733764648,
            "ans": 0.6696768188476563
          },
          "best_fixed_method": "ans",
          "fast_adaptive_fraction": 0.787667579650879,
          "strong_adaptive_fraction": 0.6696768188476563,
          "strong_sample_minmax": [
            0.6683316040039062,
            0.6710220336914062
          ]
        },
        {
          "stratum": [
            "mtp",
            "pairs"
          ],
          "population_bytes": 162754560,
          "samples": 6,
          "sample_bytes": 50331648,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.6400742530822754,
            "shuffle2/zstd19": 0.5395700732866923,
            "pred_shuffle2/zstd3": 0.3607717951138814,
            "pred_shuffle2/zstd9": 0.35074710845947266,
            "pred_shuffle2/zstd19": 0.32884039481480914,
            "pred_ans": 0.30292757352193195
          },
          "best_fixed_method": "pred_ans",
          "fast_adaptive_fraction": 0.35074710845947266,
          "strong_adaptive_fraction": 0.30292757352193195,
          "strong_sample_minmax": [
            0.30029845237731934,
            0.3052821159362793
          ]
        },
        {
          "stratum": [
            "mtp",
            "weights"
          ],
          "population_bytes": 1302036480,
          "samples": 6,
          "sample_bytes": 50331648,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.9290622671445211,
            "raw/zstd19": 0.9290249347686768,
            "centerpacked/zstd3": 0.9228267669677734,
            "context_nibble_center": 0.9174201687177023,
            "context_byte_center": 0.917673389116923,
            "context_nibble_scale": 0.9153161644935608,
            "context_byte_scale": 0.9173246820767721
          },
          "best_fixed_method": "context_nibble_scale",
          "fast_adaptive_fraction": 0.9228267669677734,
          "strong_adaptive_fraction": 0.9153161644935608,
          "strong_sample_minmax": [
            0.9115543365478516,
            0.9188579320907593
          ]
        },
        {
          "stratum": [
            "ngram",
            "pairs"
          ],
          "population_bytes": 6400030720,
          "samples": 16,
          "sample_bytes": 134217728,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.6524548977613449,
            "shuffle2/zstd19": 0.5531725287437439,
            "pred_shuffle2/zstd3": 0.37999624013900757,
            "pred_shuffle2/zstd9": 0.3714911490678787,
            "pred_shuffle2/zstd19": 0.3520580008625984,
            "pred_ans": 0.30658984184265137
          },
          "best_fixed_method": "pred_ans",
          "fast_adaptive_fraction": 0.3714911490678787,
          "strong_adaptive_fraction": 0.30658984184265137,
          "strong_sample_minmax": [
            0.30224013328552246,
            0.3108888864517212
          ]
        },
        {
          "stratum": [
            "ngram",
            "weights"
          ],
          "population_bytes": 25600122880,
          "samples": 16,
          "sample_bytes": 134217728,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.9638893306255341,
            "raw/zstd19": 0.963156059384346,
            "centerpacked/zstd3": 0.9624384641647339,
            "context_nibble_center": 0.9548514634370804,
            "context_byte_center": 0.9550586119294167,
            "context_nibble_scale": 0.9531526267528534,
            "context_byte_scale": 0.9549380540847778
          },
          "best_fixed_method": "context_nibble_scale",
          "fast_adaptive_fraction": 0.9624384641647339,
          "strong_adaptive_fraction": 0.9531526267528534,
          "strong_sample_minmax": [
            0.9524426460266113,
            0.9538792371749878
          ]
        },
        {
          "stratum": [
            "other",
            "bf16"
          ],
          "population_bytes": 1093924320,
          "samples": 8,
          "sample_bytes": 46907392,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.784563566909896,
            "shuffle2/zstd19": 0.6842030825193036,
            "planes/zstd19": 0.7450147099455688,
            "ans": 0.6691472859907542
          },
          "best_fixed_method": "ans",
          "fast_adaptive_fraction": 0.784563566909896,
          "strong_adaptive_fraction": 0.6671453328657543,
          "strong_sample_minmax": [
            0.6552398204803467,
            0.70892333984375
          ]
        },
        {
          "stratum": [
            "other",
            "pairs"
          ],
          "population_bytes": 303104000,
          "samples": 8,
          "sample_bytes": 23986176,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.6796934084097545,
            "shuffle2/zstd19": 0.5780190108219783,
            "pred_shuffle2/zstd3": 0.38107548395792645,
            "pred_shuffle2/zstd9": 0.37115197439988457,
            "pred_shuffle2/zstd19": 0.349781387646993,
            "pred_ans": 0.32624483307202656
          },
          "best_fixed_method": "pred_ans",
          "fast_adaptive_fraction": 0.37115197439988457,
          "strong_adaptive_fraction": 0.32624483307202656,
          "strong_sample_minmax": [
            0.30424726009368896,
            0.3509928385416667
          ]
        },
        {
          "stratum": [
            "other",
            "weights"
          ],
          "population_bytes": 2424832000,
          "samples": 8,
          "sample_bytes": 53084160,
          "mean_fraction_by_method": {
            "raw/zstd3": 0.9138078578313191,
            "raw/zstd19": 0.9144483818610509,
            "centerpacked/zstd3": 0.9019712682565053,
            "context_nibble_center": 0.8958300826946894,
            "context_byte_center": 0.8962648137410482,
            "context_nibble_scale": 0.8959279106060664,
            "context_byte_scale": 0.9013508254289627
          },
          "best_fixed_method": "context_nibble_center",
          "fast_adaptive_fraction": 0.9019712682565053,
          "strong_adaptive_fraction": 0.8945442436138789,
          "strong_sample_minmax": [
            0.8526434326171874,
            0.9200717210769653
          ]
        }
      ],
      "total_model_bytes": 105264463248,
      "population_accounted_bytes": 105240685536,
      "unmodeled_bytes_kept_raw": 23777712,
      "unique_windows_sampled_bytes": 779206656,
      "estimated_total_download_bytes": {
        "plain_zstd3": 94612778960.75803,
        "fast_adaptive": 89971198670.92822,
        "strong_adaptive": 88455085636.14523
      },
      "estimated_total_savings_percent": {
        "plain_zstd3": 10.118974588933128,
        "fast_adaptive": 14.528421183359185,
        "strong_adaptive": 15.968710705580058
      }
    },
    "ideal_network_arithmetic": [
      {
        "nominal_link_Mbps": 50,
        "original_ideal_seconds": 16842.31411968,
        "strong_ideal_transfer_seconds": 14152.813701783238,
        "ideal_transfer_seconds_saved": 2689.500417896763,
        "decode_MBps_to_preserve_all_savings_when_streamed": 7.4377057075750805,
        "decode_MBps_to_break_even_if_entire_download_then_decode": 39.13903955825324
      },
      {
        "nominal_link_Mbps": 100,
        "original_ideal_seconds": 8421.15705984,
        "strong_ideal_transfer_seconds": 7076.406850891619,
        "ideal_transfer_seconds_saved": 1344.7502089483814,
        "decode_MBps_to_preserve_all_savings_when_streamed": 14.875411415150161,
        "decode_MBps_to_break_even_if_entire_download_then_decode": 78.27807911650648
      },
      {
        "nominal_link_Mbps": 500,
        "original_ideal_seconds": 1684.231411968,
        "strong_ideal_transfer_seconds": 1415.2813701783236,
        "ideal_transfer_seconds_saved": 268.9500417896763,
        "decode_MBps_to_preserve_all_savings_when_streamed": 74.37705707575081,
        "decode_MBps_to_break_even_if_entire_download_then_decode": 391.39039558253234
      },
      {
        "nominal_link_Mbps": 1000,
        "original_ideal_seconds": 842.115705984,
        "strong_ideal_transfer_seconds": 707.6406850891618,
        "ideal_transfer_seconds_saved": 134.47502089483814,
        "decode_MBps_to_preserve_all_savings_when_streamed": 148.75411415150162,
        "decode_MBps_to_break_even_if_entire_download_then_decode": 782.7807911650647
      },
      {
        "nominal_link_Mbps": 2500,
        "original_ideal_seconds": 336.8462823936,
        "strong_ideal_transfer_seconds": 283.0562740356647,
        "ideal_transfer_seconds_saved": 53.79000835793526,
        "decode_MBps_to_preserve_all_savings_when_streamed": 371.885285378754,
        "decode_MBps_to_break_even_if_entire_download_then_decode": 1956.9519779126615
      },
      {
        "nominal_link_Mbps": 5000,
        "original_ideal_seconds": 168.4231411968,
        "strong_ideal_transfer_seconds": 141.52813701783236,
        "ideal_transfer_seconds_saved": 26.89500417896763,
        "decode_MBps_to_preserve_all_savings_when_streamed": 743.770570757508,
        "decode_MBps_to_break_even_if_entire_download_then_decode": 3913.903955825323
      },
      {
        "nominal_link_Mbps": 10000,
        "original_ideal_seconds": 84.2115705984,
        "strong_ideal_transfer_seconds": 70.76406850891618,
        "ideal_transfer_seconds_saved": 13.447502089483814,
        "decode_MBps_to_preserve_all_savings_when_streamed": 1487.541141515016,
        "decode_MBps_to_break_even_if_entire_download_then_decode": 7827.807911650646
      }
    ],
    "full_shard": {
      "original_bytes": 2192353120,
      "archive_bytes": 1841470354,
      "savings_percent": 16.004847157103963,
      "archive_sha256": "d6da9ac55afea4d2bb29e8efd31ed819ca5515760a3ed72dca77e3dc9104b74a"
    },
    "native_larger_block_fractions": [
      {
        "group": "experts",
        "method": "baseline",
        "original_bytes": 37748736,
        "compressed_bytes": 32155531,
        "fraction": 0.8518306679195828
      },
      {
        "group": "experts",
        "method": "native",
        "original_bytes": 37748736,
        "compressed_bytes": 32156295,
        "fraction": 0.8518509070078532
      },
      {
        "group": "experts",
        "method": "native_reverse",
        "original_bytes": 37748736,
        "compressed_bytes": 32140079,
        "fraction": 0.8514213297102187
      },
      {
        "group": "experts",
        "method": "fast_zstd",
        "original_bytes": 37748736,
        "compressed_bytes": 32526946,
        "fraction": 0.8616698053148057
      },
      {
        "group": "ngram",
        "method": "baseline",
        "original_bytes": 41943040,
        "compressed_bytes": 34582531,
        "fraction": 0.8245117902755738
      },
      {
        "group": "ngram",
        "method": "native",
        "original_bytes": 41943040,
        "compressed_bytes": 34580948,
        "fraction": 0.8244740486145019
      },
      {
        "group": "ngram",
        "method": "native_reverse",
        "original_bytes": 41943040,
        "compressed_bytes": 34532518,
        "fraction": 0.823319387435913
      },
      {
        "group": "ngram",
        "method": "fast_zstd",
        "original_bytes": 41943040,
        "compressed_bytes": 35446977,
        "fraction": 0.8451217889785767
      },
      {
        "group": "other",
        "method": "baseline",
        "original_bytes": 37748736,
        "compressed_bytes": 31924131,
        "fraction": 0.8457006613413492
      },
      {
        "group": "other",
        "method": "native",
        "original_bytes": 37748736,
        "compressed_bytes": 31923712,
        "fraction": 0.8456895616319444
      },
      {
        "group": "other",
        "method": "native_reverse",
        "original_bytes": 37748736,
        "compressed_bytes": 31906889,
        "fraction": 0.8452439043256972
      },
      {
        "group": "other",
        "method": "fast_zstd",
        "original_bytes": 37748736,
        "compressed_bytes": 32294383,
        "fraction": 0.8555089897579617
      },
      {
        "group": "mtp",
        "method": "baseline",
        "original_bytes": 37748736,
        "compressed_bytes": 32014997,
        "fraction": 0.8481077882978652
      },
      {
        "group": "mtp",
        "method": "native",
        "original_bytes": 37748736,
        "compressed_bytes": 32015171,
        "fraction": 0.8481123977237277
      },
      {
        "group": "mtp",
        "method": "native_reverse",
        "original_bytes": 37748736,
        "compressed_bytes": 32005331,
        "fraction": 0.8478517267439101
      },
      {
        "group": "mtp",
        "method": "fast_zstd",
        "original_bytes": 37748736,
        "compressed_bytes": 32477190,
        "fraction": 0.8603517214457194
      }
    ],
    "versions": {
      "numpy": "2.5.2",
      "zstandard": "0.25.0",
      "lz4": "4.4.5",
      "brotli": "1.2.0",
      "blosc2": "4.12.0",
      "pyppmd": "1.3.1",
      "constriction": "0.5.0"
    },
    "input_inventory_sha256": "464f0628829202e57b36653c621fa0215d0a1b83976896d3c613e1c143c5fbdd",
    "timing_status": "Screen and size-qualification timings are diagnostic only and excluded as production performance evidence; shared machine with concurrent work. Byte counts and exact roundtrip checks are deterministic.",
    "native_full_shard": {
      "original_bytes": 2192353120,
      "archive_bytes": 1841504097,
      "savings_percent": 16.003308034610775,
      "archive_sha256": "d6de1ec7b27c79ff7030301e5bfbd41267e3013ae7d99752c1d85fbc7b9b1836",
      "entropy_codec": "native-rans-v1",
      "pinned_sha256_matches": true
    }
  },
  "artifacts": [
    {
      "path": "model-00011.safetensors.slotcmp",
      "bytes": 1841470354,
      "sha256": "d6da9ac55afea4d2bb29e8efd31ed819ca5515760a3ed72dca77e3dc9104b74a"
    },
    {
      "path": "model-00011.safetensors.restored",
      "bytes": 2192353120,
      "sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0"
    },
    {
      "path": "native-full/model-00011.safetensors.slotcmp",
      "bytes": 1841504097,
      "sha256": "d6de1ec7b27c79ff7030301e5bfbd41267e3013ae7d99752c1d85fbc7b9b1836"
    },
    {
      "path": "native-full/model-00011.safetensors.restored",
      "bytes": 2192353120,
      "sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0"
    }
  ],
  "production_download_source_sha256": {
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2"
  },
  "probe_source_sha256": {
    "probe.py": "61ec0aebb2fd8b08034f92f83e2cfc7a90ee0d9f6ac9248f780cf760a09fb4c9",
    "qualify.py": "65f06f0d068c2efb5744bfe366c48328d86dd99ef1dccd8c0bae29788c9c04f7",
    "full_file_v1.py": "50671838cf2c4518ee105e1546f79a502ca42d57bd7aaa31d761783affafb2d9",
    "full_file.py": "ea5d830f311c7b74a7dd8051e8ef8ff17a37066268f02abd83b756e8220c6891",
    "rans_probe.c": "1ce6e4f9afd5bf559402db7268fc26af16681a5dc3ac45b7abfa53fb7154335e",
    "native_probe.py": "a9c07a0ce3c5b70e7fc6806203fa7462cb694e3c0455697afe8ae9b37533ea54",
    "native_full.py": "305b5fc425ad8b64361d33668ca86c0207fba145a4a3c0c9ffb39ffec39715f6",
    "regenerate_inventory.py": "144a092ef2c924552a4a5df4857118a9b9cc5f85b151ff3f921e57b5f93fba94",
    "report_data.py": "19dfbf410384ffc2c44a6c6b7aa9c26f25d86bbd13a94a1edf2d654576588303",
    "build_evidence.py": "aacb773ec931accf96490ec7db7f549a1ae4bf8e3e3b9acd60e6299f2e566024"
  },
  "native_library_sha256": "d26ff4389c1a87fd5df8bba7a8b7f8186debea5628f8d5dbc0b6b717afbc6657"
}
```
