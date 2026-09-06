---
type: run
id: 01m1sy92jb4ckt8erjvzpb6rb4
created: 2026-09-05T23:25:52.586905+00:00
updated: 2026-09-05T23:26:06.609385+00:00
summary: 'Download audit: current transport probes, complete Xet byte metadata, tensor inventory and lossless compression samples'
binary: Standalone Swift probe with exact source and binary hashes preserved in body; no model runtime loaded
captured_at: 2026-09-05
command: .venv31/bin/python .build/download-audit/xet_metadata_probe.py; .venv31/bin/python .build/download-audit/compression_probe.py; .build/download-audit/network-probe (invocations preserved in body)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Download first-principles audit raw diagnostics
tool: Python metadata and compression probes; standalone Swift URLSession transport probe
---
# Download audit raw diagnostics — 2026-09-05

Captured before synthesis. Public endpoints and model bytes only. Tokens and signed URLs were kept in process memory and are absent from this record. Network probes discarded response bodies after validating HTTP status and Content-Range; they are transport component tests, not complete verified installs or representative population benchmarks.

## audit-facts.json

```json
{
  "captured_at_utc": "2026-09-05T23:25:52.539958+00:00",
  "git_head": "770dba67a298450231d6f2a6f2ead08ffa4aac16",
  "audited_source_sha256": {
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "install.sh": "8fc9b91156e1f92d6ef1efcda72ae339fcdf3987a9f7c2021a2c6d02ac19d8f1"
  },
  "manifest_files": 25,
  "total_bytes": 105264463248,
  "chunks_64_MiB": 1586,
  "tensor_dtype_bytes": {
    "BF16": 15515723488,
    "U32": 89724968960,
    "I64": 280
  },
  "tensor_component_bytes": {
    "other": 3821867232,
    "experts": 67947724800,
    "ngram": 32000153880,
    "mtp": 1470946816
  },
  "network_probe_binary_sha256": "d02e0b87b5bb0897a81bb2491d418760f8e249f0f957d00530243383bf961a08",
  "swift_xet_commit": "0687c5be8182967e68927d28b1ee6fcdfcfe2f40",
  "tcp_autorcvbufmax_bytes": 4194304,
  "compression_sample_bytes": 134217728,
  "network_probe_payload_bytes": 6576668672,
  "production_download_source_modified": false
}
```

## http-probe.json

```json
{
  "resolve_status": 302,
  "redirect_host": "us.aws.cdn.hf.co",
  "xet_hash": "c78ee4625b0ef93829ec3a4038b19a867bb3da5503de9a558eda4a0463e67763",
  "size": "2192353120",
  "rate_limit": "\"resolvers\";r=2999;t=255",
  "signed_range": null,
  "expiry_seconds": 3600,
  "reuse_0": {
    "status": 206,
    "bytes": 1024,
    "content_range": "bytes 0-1023/2192353120",
    "elapsed_s": 0.6287059588357806
  },
  "reuse_67108864": {
    "status": 206,
    "bytes": 1024,
    "content_range": "bytes 67108864-67109887/2192353120",
    "elapsed_s": 0.5523484589066356
  },
  "anonymous_xet_token": {
    "status": 200,
    "cas_host": "cas-server.xethub.hf.co",
    "has_token": true
  },
  "xet_reconstruction": {
    "keys": [
      "offset_into_first_range",
      "terms",
      "xorbs"
    ],
    "terms": 6,
    "hosts": [
      "us.aws.cdn.hf.co"
    ],
    "wire_bytes": 61788273,
    "unpacked_term_bytes": 67137217
  }
}
```

## xet-metadata.json

```json
{
  "note": "Metadata-only; no xorb bodies fetched. Every reconstructed term total equals pinned file size and HEAD SHA256 matches compiled manifest. Fetch bytes include physical xorb ranges, excluding HTTP/TLS overhead; no cache assumed.",
  "rows": [
    {
      "file": "model-00001.safetensors",
      "original_bytes": 10039592993,
      "sha256": "206c2e6ee138c902115f0686a43e0d56097518945bbcd6d3ab10bf916278f86c",
      "xet_fileid": "125b597e9253fea4b5b3704dea5078de6a9f7b252e86afaf77f3a82f64437f87",
      "terms": 620,
      "xorbs": 166,
      "fetch_bytes": 9616079418,
      "fetch_ratio": 0.9578156629162865,
      "hosts": {
        "us.aws.cdn.hf.co": 166
      }
    },
    {
      "file": "model-00002.safetensors",
      "original_bytes": 10000066971,
      "sha256": "48f925c8652fd3210bd8593b41b9fbd66f02567e0e1e7abc28b75e2601f8af26",
      "xet_fileid": "6688cd840a96bb460bfb58c53856e19d2ed3afe80abb0047b5e77998dc408130",
      "terms": 398,
      "xorbs": 159,
      "fetch_bytes": 9591994860,
      "fetch_ratio": 0.9591930621881433,
      "hosts": {
        "us.aws.cdn.hf.co": 159
      }
    },
    {
      "file": "model-00003.safetensors",
      "original_bytes": 10000066984,
      "sha256": "cb0a951b9aed16ddad882a75c4c07b2615fa364db7c83cfcf7166dc481def85a",
      "xet_fileid": "21b7250b868c7fead95afcaf6ce81d54885600f0ea7b71063343e95f8c004ba3",
      "terms": 387,
      "xorbs": 163,
      "fetch_bytes": 9592666959,
      "fetch_ratio": 0.9592602703910048,
      "hosts": {
        "us.aws.cdn.hf.co": 163
      }
    },
    {
      "file": "model-00004.safetensors",
      "original_bytes": 10170248438,
      "sha256": "f57df447a6acc2d16e69a66c708291d692f0f7476f74ab20aee3d2554c2896c8",
      "xet_fileid": "9586c8f712f437be50e045c4f18a2d8da38b34f0fb6d53596660fb2c6765bc92",
      "terms": 513,
      "xorbs": 212,
      "fetch_bytes": 9872662739,
      "fetch_ratio": 0.9707395841100495,
      "hosts": {
        "us.aws.cdn.hf.co": 212
      }
    },
    {
      "file": "model-00005.safetensors",
      "original_bytes": 10194989755,
      "sha256": "bc133543936364e026b413f1ab4b30f2847846d5a8cc1d201cadfd9396327320",
      "xet_fileid": "4c64902c319f8c6f3f04ec445d6e18c793e8bb6849bae9a3cea53017cbcb2ce4",
      "terms": 558,
      "xorbs": 179,
      "fetch_bytes": 10058843282,
      "fetch_ratio": 0.9866457469529846,
      "hosts": {
        "us.aws.cdn.hf.co": 179
      }
    },
    {
      "file": "model-00006.safetensors",
      "original_bytes": 10262727991,
      "sha256": "9231085f2723a8a3e26fc00836a789400527320ef8a6e219df6974ea4f8eee95",
      "xet_fileid": "3cbad1ca98546914ecc2801e72b35f2060635c9a10b82e00070702ec19139623",
      "terms": 632,
      "xorbs": 174,
      "fetch_bytes": 10123967553,
      "fetch_ratio": 0.9864791858342453,
      "hosts": {
        "us.aws.cdn.hf.co": 174
      }
    },
    {
      "file": "model-00007.safetensors",
      "original_bytes": 10190937668,
      "sha256": "03dffb750368b02fe517f2f1bfd7d5db69c419630801c3ffce88d8a6971046d5",
      "xet_fileid": "b538f77bedb9e0779aa483bf87b3ad3a9352339328ae9bc560702f2ca3a0e307",
      "terms": 560,
      "xorbs": 167,
      "fetch_bytes": 10054806575,
      "fetch_ratio": 0.986641946262957,
      "hosts": {
        "us.aws.cdn.hf.co": 167
      }
    },
    {
      "file": "model-00008.safetensors",
      "original_bytes": 10231122683,
      "sha256": "910401c0e420a50b901b170895e7a180c5908a45634be9c92903977ecaa14986",
      "xet_fileid": "557fb22da1e3504d14a11ada1a8a8e031d7b95b48f05d4a4edaa91264f37d187",
      "terms": 591,
      "xorbs": 169,
      "fetch_bytes": 10066811653,
      "fetch_ratio": 0.9839400782210325,
      "hosts": {
        "us.aws.cdn.hf.co": 169
      }
    },
    {
      "file": "model-00009.safetensors",
      "original_bytes": 10250305804,
      "sha256": "0c77b22503b8e783cc345cd8afe63e007f9d0d0581cbda3f366250e38e096634",
      "xet_fileid": "92f0a3cb25a5c3932934f380354a0e101e6b1d857eb70c21ae26c2caf9b162a6",
      "terms": 608,
      "xorbs": 184,
      "fetch_bytes": 10093504725,
      "fetch_ratio": 0.9847027901412647,
      "hosts": {
        "us.aws.cdn.hf.co": 184
      }
    },
    {
      "file": "model-00010.safetensors",
      "original_bytes": 10237786674,
      "sha256": "115466ffb3e92a8e2a338d72395f7c32a176dadc791d2049ff9a8daadb347ed7",
      "xet_fileid": "f99ff0b03c2ec5339e13a083068514b6462b5288dfc00ba58d2a351dec7adece",
      "terms": 626,
      "xorbs": 197,
      "fetch_bytes": 10074818800,
      "fetch_ratio": 0.9840817278978986,
      "hosts": {
        "us.aws.cdn.hf.co": 197
      }
    },
    {
      "file": "model-00011.safetensors",
      "original_bytes": 2192353120,
      "sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0",
      "xet_fileid": "c78ee4625b0ef93829ec3a4038b19a867bb3da5503de9a558eda4a0463e67763",
      "terms": 87,
      "xorbs": 40,
      "fetch_bytes": 2153815847,
      "fetch_ratio": 0.98242195901361,
      "hosts": {
        "us.aws.cdn.hf.co": 40
      }
    },
    {
      "file": "mtp.safetensors",
      "original_bytes": 1470955171,
      "sha256": "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744",
      "xet_fileid": "dd9377d88649d270b69e16fa682682b911353973a17ae97e7bf3dea0bc0dd101",
      "terms": 91,
      "xorbs": 46,
      "fetch_bytes": 1432514299,
      "fetch_ratio": 0.9738667277168843,
      "hosts": {
        "us.aws.cdn.hf.co": 46
      }
    }
  ],
  "total_original_bytes": 105241154252,
  "total_fetch_bytes_per_file": 102732486710,
  "total_unique_fetch_bytes": 102732486710,
  "ratio_per_file": 0.9761626755252704,
  "ratio_global_dedup": 0.9761626755252704,
  "saved_bytes_per_file": 2508667542
}
```

## compression-probe.json

```json
{
  "method": "Deterministic stratified sample, up to 4 tensors per component/dtype, 2 MiB at 25% and 75% each; compression ratios only, not speed benchmarks. Decoding compared byte-for-byte for all samples.",
  "sample_bytes": 134217728,
  "rows": [
    {
      "group": "experts",
      "dtype": "BF16",
      "population_bytes": 7549747200,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "model-00001.safetensors",
          "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.biases"
        },
        {
          "file": "model-00006.safetensors",
          "tensor": "language_model.model.layers.22.mlp.switch_mlp.up_proj.scales"
        },
        {
          "file": "model-00008.safetensors",
          "tensor": "language_model.model.layers.37.mlp.switch_mlp.up_proj.scales"
        },
        {
          "file": "model-00011.safetensors",
          "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.scales"
        }
      ],
      "ratios": {
        "zstd3": 0.6254672408103943,
        "lz4": 1.0016949772834778,
        "bg4_lz4": 0.7607582807540894,
        "bg2_zstd3": 0.5488684177398682
      },
      "minmax": {
        "zstd3": [
          0.6006960868835449,
          0.6944561004638672
        ],
        "lz4": [
          1.0004072189331055,
          1.0038933753967285
        ],
        "bg4_lz4": [
          0.7522797584533691,
          0.7860393524169922
        ],
        "bg2_zstd3": [
          0.5239386558532715,
          0.6151638031005859
        ]
      }
    },
    {
      "group": "experts",
      "dtype": "U32",
      "population_bytes": 60397977600,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "model-00001.safetensors",
          "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight"
        },
        {
          "file": "model-00006.safetensors",
          "tensor": "language_model.model.layers.22.mlp.switch_mlp.up_proj.weight"
        },
        {
          "file": "model-00008.safetensors",
          "tensor": "language_model.model.layers.37.mlp.switch_mlp.up_proj.weight"
        },
        {
          "file": "model-00011.safetensors",
          "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight"
        }
      ],
      "ratios": {
        "zstd3": 0.931526243686676,
        "lz4": 1.003922462463379,
        "bg4_lz4": 1.003922462463379,
        "bg2_zstd3": 0.9315540194511414
      },
      "minmax": {
        "zstd3": [
          0.9286403656005859,
          0.9330668449401855
        ],
        "lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg4_lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg2_zstd3": [
          0.928593635559082,
          0.933197021484375
        ]
      }
    },
    {
      "group": "mtp",
      "dtype": "BF16",
      "population_bytes": 168910336,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.layers.0.mlp.gate.weight"
        },
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.layers.0.mlp.switch_mlp.down_proj.scales"
        },
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.layers.0.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.layers.0.self_attn.indexer.index_qk_proj.weight"
        }
      ],
      "ratios": {
        "zstd3": 0.7129197716712952,
        "lz4": 1.0034838318824768,
        "bg4_lz4": 0.8124210238456726,
        "bg2_zstd3": 0.641547441482544
      },
      "minmax": {
        "zstd3": [
          0.6346430778503418,
          0.788515567779541
        ],
        "lz4": [
          1.0029006004333496,
          1.003922462463379
        ],
        "bg4_lz4": [
          0.7602038383483887,
          0.8684878349304199
        ],
        "bg2_zstd3": [
          0.5617876052856445,
          0.7190909385681152
        ]
      }
    },
    {
      "group": "mtp",
      "dtype": "U32",
      "population_bytes": 1302036480,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.fc_embedding.weight"
        },
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.layers.0.mlp.switch_mlp.down_proj.weight"
        },
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.layers.0.mlp.switch_mlp.up_proj.weight"
        },
        {
          "file": "mtp.safetensors",
          "tensor": "mtp.layers.0.self_attn.q_proj.weight"
        }
      ],
      "ratios": {
        "zstd3": 0.9194459915161133,
        "lz4": 1.003922462463379,
        "bg4_lz4": 1.003922462463379,
        "bg2_zstd3": 0.9194969534873962
      },
      "minmax": {
        "zstd3": [
          0.8817768096923828,
          0.9328227043151855
        ],
        "lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg4_lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg2_zstd3": [
          0.8819761276245117,
          0.9328241348266602
        ]
      }
    },
    {
      "group": "ngram",
      "dtype": "BF16",
      "population_bytes": 6400030720,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "model-00001.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.biases"
        },
        {
          "file": "model-00002.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_42.scales"
        },
        {
          "file": "model-00003.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_81.biases"
        },
        {
          "file": "model-00004.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_127.scales"
        }
      ],
      "ratios": {
        "zstd3": 0.6524599194526672,
        "lz4": 1.0033429265022278,
        "bg4_lz4": 0.7692394852638245,
        "bg2_zstd3": 0.5740724205970764
      },
      "minmax": {
        "zstd3": [
          0.6233305931091309,
          0.6856269836425781
        ],
        "lz4": [
          1.0027260780334473,
          1.0038461685180664
        ],
        "bg4_lz4": [
          0.7526965141296387,
          0.7865157127380371
        ],
        "bg2_zstd3": [
          0.5425047874450684,
          0.6073122024536133
        ]
      }
    },
    {
      "group": "ngram",
      "dtype": "U32",
      "population_bytes": 25600122880,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "model-00001.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.weight"
        },
        {
          "file": "model-00002.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_42.weight"
        },
        {
          "file": "model-00003.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_79.weight"
        },
        {
          "file": "model-00004.safetensors",
          "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_127.weight"
        }
      ],
      "ratios": {
        "zstd3": 0.9637728929519653,
        "lz4": 1.003922462463379,
        "bg4_lz4": 1.003922462463379,
        "bg2_zstd3": 0.9638347625732422
      },
      "minmax": {
        "zstd3": [
          0.9635639190673828,
          0.9639654159545898
        ],
        "lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg4_lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg2_zstd3": [
          0.9636135101318359,
          0.9641504287719727
        ]
      }
    },
    {
      "group": "other",
      "dtype": "BF16",
      "population_bytes": 1397035232,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "model-00001.safetensors",
          "tensor": "language_model.model.layers.0.mlp.gate.weight"
        },
        {
          "file": "model-00001.safetensors",
          "tensor": "vision_tower.blocks.21.attn.proj.weight"
        },
        {
          "file": "model-00004.safetensors",
          "tensor": "language_model.model.layers.11.self_attn.indexer.index_qk_proj.weight"
        },
        {
          "file": "model-00011.safetensors",
          "tensor": "language_model.model.layers.9.mlp.gate.weight"
        }
      ],
      "ratios": {
        "zstd3": 0.7818430066108704,
        "lz4": 1.003922462463379,
        "bg4_lz4": 0.8477826118469238,
        "bg2_zstd3": 0.7117136120796204
      },
      "minmax": {
        "zstd3": [
          0.7782988548278809,
          0.7846407890319824
        ],
        "lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg4_lz4": [
          0.837498664855957,
          0.854301929473877
        ],
        "bg2_zstd3": [
          0.7071723937988281,
          0.7147321701049805
        ]
      }
    },
    {
      "group": "other",
      "dtype": "U32",
      "population_bytes": 2424832000,
      "sample_bytes": 16777216,
      "samples": [
        {
          "file": "model-00001.safetensors",
          "tensor": "language_model.model.layers.0.linear_attn.in_proj_qkv.weight"
        },
        {
          "file": "model-00006.safetensors",
          "tensor": "language_model.model.layers.22.linear_attn.in_proj_z.weight"
        },
        {
          "file": "model-00008.safetensors",
          "tensor": "language_model.model.layers.38.linear_attn.in_proj_qkv.weight"
        },
        {
          "file": "model-00011.safetensors",
          "tensor": "language_model.model.embed_tokens.weight"
        }
      ],
      "ratios": {
        "zstd3": 0.9146391153335571,
        "lz4": 1.003922164440155,
        "bg4_lz4": 1.003922462463379,
        "bg2_zstd3": 0.9147977232933044
      },
      "minmax": {
        "zstd3": [
          0.9047493934631348,
          0.9326953887939453
        ],
        "lz4": [
          1.003920078277588,
          1.003922462463379
        ],
        "bg4_lz4": [
          1.003922462463379,
          1.003922462463379
        ],
        "bg2_zstd3": [
          0.9049248695373535,
          0.9327235221862793
        ]
      }
    }
  ],
  "weighted_sample_estimates": {
    "zstd3": 0.8975669651231263,
    "lz4": 1.0037267129926126,
    "bg4_lz4": 0.9698264704583567,
    "bg2_zstd3": 0.8862947047410598
  }
}
```

## network-results.jsonl

```json
{"body_seconds_sum": 8.365847110748291, "bytes": 134217728, "chunks": 2, "completed": true, "connections": 1, "errors": 0, "final_ttfb_seconds_sum": 0.20115196704864502, "flows": 1, "http_transactions": 4, "MB_s": 14.482386011593833, "mode": "resolve", "prebody_seconds_sum": 0.8970738649368286, "requests": 2, "resolve_setup_seconds": 0, "reused_body_connections": 1, "seconds": 9.267652988433838, "returncode": 0}
{"body_seconds_sum": 154.80499517917633, "bytes": 1073741824, "chunks": 16, "completed": true, "connections": 8, "errors": 0, "final_ttfb_seconds_sum": 1.7935988903045654, "flows": 8, "http_transactions": 32, "MB_s": 47.732232575529096, "mode": "resolve", "prebody_seconds_sum": 6.591440796852112, "requests": 16, "resolve_setup_seconds": 0, "reused_body_connections": 8, "seconds": 22.495110034942627, "returncode": 0}
{"body_seconds_sum": 152.82395017147064, "bytes": 1073741824, "chunks": 16, "completed": true, "connections": 8, "errors": 0, "final_ttfb_seconds_sum": 2.734043836593628, "flows": 8, "http_transactions": 16, "MB_s": 47.82272878131833, "mode": "direct", "prebody_seconds_sum": 4.374949812889099, "requests": 16, "resolve_setup_seconds": 0.47544610500335693, "reused_body_connections": 8, "seconds": 22.452541947364807, "returncode": 0}
{"body_seconds_sum": 364.8846768140793, "bytes": 1073741824, "chunks": 16, "completed": true, "connections": 16, "errors": 0, "final_ttfb_seconds_sum": 1.5582221746444702, "flows": 16, "http_transactions": 32, "MB_s": 35.94245547733702, "mode": "resolve", "prebody_seconds_sum": 8.398075222969055, "requests": 16, "resolve_setup_seconds": 0, "reused_body_connections": 0, "seconds": 29.873914003372192, "returncode": 0}
{"body_seconds_sum": 355.2927598953247, "bytes": 1073741824, "chunks": 16, "completed": true, "connections": 16, "errors": 0, "final_ttfb_seconds_sum": 1.597269892692566, "flows": 16, "http_transactions": 32, "MB_s": 38.98589998900867, "mode": "resolve", "prebody_seconds_sum": 9.186236143112183, "requests": 16, "resolve_setup_seconds": 0, "reused_body_connections": 0, "seconds": 27.541799068450928, "returncode": 0}
{"body_seconds_sum": 239.1503140926361, "bytes": 1073741824, "chunks": 16, "completed": true, "connections": 8, "errors": 0, "final_ttfb_seconds_sum": 2.5190951824188232, "flows": 8, "http_transactions": 16, "MB_s": 31.04145273135786, "mode": "direct", "prebody_seconds_sum": 4.618000149726868, "requests": 16, "resolve_setup_seconds": 0.764428973197937, "reused_body_connections": 8, "seconds": 34.59057903289795, "returncode": 0}
{"body_seconds_sum": 266.304927945137, "bytes": 1073741824, "chunks": 16, "completed": true, "connections": 8, "errors": 0, "final_ttfb_seconds_sum": 1.9802128076553345, "flows": 8, "http_transactions": 32, "MB_s": 27.571711755487016, "mode": "resolve", "prebody_seconds_sum": 8.008674144744873, "requests": 16, "resolve_setup_seconds": 0, "reused_body_connections": 8, "seconds": 38.94360399246216, "returncode": 0}
```

## Reproduction: NetworkProbe.swift

```swift
import Foundation
let connections=Int(CommandLine.arguments[1])!
let chunks=Int(CommandLine.arguments[2])!
let direct=CommandLine.arguments[3]=="direct"
let base=URL(string:"https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit/resolve/e9d552f83de4665d243d5c9cf73201a1ca6c16d7/model-00001.safetensors")!
var target=base
var setupSeconds=0.0
if direct {
 let t=Date();let sem=DispatchSemaphore(value:0)
 var req=URLRequest(url:base);req.httpMethod="HEAD";req.timeoutInterval=20
 let sess=URLSession(configuration:.ephemeral)
 sess.dataTask(with:req){_,r,_ in if let r=r as? HTTPURLResponse,r.statusCode==200,let u=r.url{target=u};sem.signal()}.resume()
 _=sem.wait(timeout:.now()+25);sess.invalidateAndCancel();setupSeconds=Date().timeIntervalSince(t)
 if target==base{print("{\"error\":\"resolve failed\"}");exit(2)}
}
final class Probe:NSObject,URLSessionDataDelegate {
 let lock=NSLock(); var next=0;var bytes:Int64=0;var errors=0;var sems:[Int:DispatchSemaphore]=[:]
 var counts:[Int:Int64]=[:];var flows=Set<String>();var txs=0;var requests=0;var ttfb=0.0;var prebody=0.0;var body=0.0;var reused=0
 func get()->Int?{lock.lock();defer{lock.unlock()};if next>=chunks{return nil};let i=next;next+=1;return i}
 func urlSession(_ s:URLSession,dataTask:URLSessionDataTask,didReceive response:URLResponse,completionHandler:@escaping(URLSession.ResponseDisposition)->Void){
  let i=Int(dataTask.taskDescription!)!;let h=response as? HTTPURLResponse
  let expected="bytes \(Int64(i)*(64<<20))-\((Int64(i)+1)*(64<<20)-1)/10039592993"
  if h?.statusCode==206 && h?.value(forHTTPHeaderField:"Content-Range")==expected{completionHandler(.allow)}else{lock.lock();errors+=1;lock.unlock();completionHandler(.cancel)}
 }
 func urlSession(_ s:URLSession,dataTask:URLSessionDataTask,didReceive data:Data){lock.lock();bytes+=Int64(data.count);counts[Int(dataTask.taskDescription!)!,default:0]+=Int64(data.count);lock.unlock()}
 func urlSession(_ s:URLSession,task:URLSessionTask,didCompleteWithError e:Error?){lock.lock();let i=Int(task.taskDescription!)!;if e != nil || counts[i] != Int64(64<<20){errors+=1};let sem=sems[i];lock.unlock();sem?.signal()}
 func urlSession(_ s:URLSession,task:URLSessionTask,didFinishCollecting m:URLSessionTaskMetrics){
  guard let last=m.transactionMetrics.last else{return}
  lock.lock();defer{lock.unlock()};requests+=1;txs+=m.transactionMetrics.count
  flows.insert("\(last.remoteAddress ?? "?"):\(last.localPort ?? 0)")
  if last.isReusedConnection{reused+=1}
  if let a=last.requestStartDate,let b=last.responseStartDate{ttfb+=b.timeIntervalSince(a)}
  if let a=last.responseStartDate,let b=last.responseEndDate{body+=b.timeIntervalSince(a)}
  if let a=m.transactionMetrics.first?.fetchStartDate,let b=last.responseStartDate{prebody+=b.timeIntervalSince(a)}
 }
}
let p=Probe();let group=DispatchGroup();var sessions:[URLSession]=[]
for _ in 0..<connections{let cfg=URLSessionConfiguration.ephemeral;cfg.httpMaximumConnectionsPerHost=1;cfg.timeoutIntervalForRequest=20;cfg.timeoutIntervalForResource=50;sessions.append(URLSession(configuration:cfg,delegate:p,delegateQueue:nil))}
let start=Date()
for session in sessions{
 group.enter();Thread{
  while let i=p.get(){
   let sem=DispatchSemaphore(value:0);p.lock.lock();p.sems[i]=sem;p.lock.unlock()
   var req=URLRequest(url:target);req.setValue("bytes=\(Int64(i)*(64<<20))-\((Int64(i)+1)*(64<<20)-1)",forHTTPHeaderField:"Range");req.setValue("identity",forHTTPHeaderField:"Accept-Encoding")
   let task=session.dataTask(with:req);task.taskDescription=String(i);task.resume();sem.wait()
  };group.leave()
 }.start()
}
let completed=group.wait(timeout:.now()+55)==DispatchTimeoutResult.success
let elapsed=Date().timeIntervalSince(start)
sessions.forEach{$0.invalidateAndCancel()}
p.lock.lock()
let result:[String:Any] = ["connections":connections,"chunks":chunks,"mode":direct ? "direct" : "resolve","bytes":p.bytes,"seconds":elapsed,"MB_s":Double(p.bytes)/elapsed/1e6,"errors":p.errors,"completed":completed,"flows":p.flows.count,"requests":p.requests,"http_transactions":p.txs,"body_seconds_sum":p.body,"prebody_seconds_sum":p.prebody,"final_ttfb_seconds_sum":p.ttfb,"reused_body_connections":p.reused,"resolve_setup_seconds":setupSeconds]
let data=try! JSONSerialization.data(withJSONObject:result,options:[.sortedKeys]);print(String(data:data,encoding:.utf8)!);p.lock.unlock()
exit(completed && p.errors==0 ? 0:1)
```

## Reproduction: compression_probe.py

```python
import sys,pathlib,json,collections,random,time,hashlib
sys.path.insert(0,str(pathlib.Path(__file__).parent/'python'))
import zstandard as zstd, lz4.block
root=pathlib.Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'
meta=json.loads((pathlib.Path(__file__).parent/'tensors.json').read_text())
groups=collections.defaultdict(list)
for t in meta['tensors']:groups[(t['group'],t['dtype'])].append(t)
rows=[]; samplebytes=0
for (group,dtype),ts in sorted(groups.items()):
 eligible=[t for t in ts if t['size']>=2<<20]
 if not eligible:continue
 eligible.sort(key=lambda t:(t['file'],t['name']))
 picks=[eligible[int(i*(len(eligible)-1)/min(3,len(eligible)-1))] for i in range(min(4,len(eligible)))] if len(eligible)>1 else eligible
 vals=collections.defaultdict(list)
 for t in picks:
  for frac in [0.25,0.75]:
   count=2<<20; off=int((t['size']-count)*frac)//4*4
   with (root/t['file']).open('rb') as f:f.seek(t['offset']+off);data=f.read(count)
   samplebytes+=len(data)
   for method in ['zstd3','lz4','bg4_lz4','bg2_zstd3']:
    groupby=4 if method=='bg4_lz4' else 2 if method=='bg2_zstd3' else 1
    src=b''.join(data[i::groupby] for i in range(groupby)) if groupby>1 else data
    if 'zstd' in method:
     enc=zstd.ZstdCompressor(level=3).compress(src);dec=zstd.ZstdDecompressor().decompress(enc)
    else:enc=lz4.block.compress(src,store_size=False);dec=lz4.block.decompress(enc,uncompressed_size=len(src))
    assert dec==src
    if groupby>1:
     restored=bytearray(len(data)); stride=len(data)//groupby
     for i in range(groupby): restored[i::groupby]=dec[i*stride:(i+1)*stride]
     assert bytes(restored)==data
    vals[method].append(len(enc)/len(data))
 rows.append(dict(group=group,dtype=dtype,population_bytes=sum(t['size'] for t in ts),sample_bytes=len(picks)*2*(2<<20),samples=[dict(file=t['file'],tensor=t['name']) for t in picks],ratios={k:sum(v)/len(v) for k,v in vals.items()},minmax={k:[min(v),max(v)] for k,v in vals.items()}))
out=dict(method='Deterministic stratified sample, up to 4 tensors per component/dtype, 2 MiB at 25% and 75% each; compression ratios only, not speed benchmarks. Decoding compared byte-for-byte for all samples.',sample_bytes=samplebytes,rows=rows,weighted_sample_estimates={k:sum(r['population_bytes']*r['ratios'][k] for r in rows)/sum(r['population_bytes'] for r in rows) for k in ['zstd3','lz4','bg4_lz4','bg2_zstd3']})
(pathlib.Path(__file__).parent/'compression-probe.json').write_text(json.dumps(out,indent=2))
print(json.dumps({k:v for k,v in out.items() if k!='rows'},indent=2))
print(json.dumps([{k:v for k,v in r.items() if k not in ['samples','minmax']} for r in rows],indent=2))
```

## Reproduction: xet_metadata_probe.py

```python
import urllib.request,urllib.error,urllib.parse,json,time,pathlib,re,concurrent.futures,collections
HERE=pathlib.Path(__file__).parent
src=pathlib.Path('Sources/Slotstream/PinnedModel.swift').read_text()
files=[(p,int(n),s) for p,n,s in re.findall(r'File\(path: "([^"]+\.safetensors)", size: (\d+), sha256: "([^"]+)"',src)]
repo='carloslfu/Qwen3.8-Flash-Next-MLX-4bit';rev='e9d552f83de4665d243d5c9cf73201a1ca6c16d7'
with urllib.request.urlopen('https://huggingface.co/api/models/'+repo+'/xet-read-token/'+rev,timeout=20) as r:token=json.load(r)
class NoRedirect(urllib.request.HTTPRedirectHandler):
 def redirect_request(self,*a):return None

def work(item):
 name,size,sha=item; op=urllib.request.build_opener(NoRedirect())
 try:r=op.open(urllib.request.Request('https://huggingface.co/'+repo+'/resolve/'+rev+'/'+name,method='HEAD'),timeout=20)
 except urllib.error.HTTPError as e:r=e
 assert r.code==302
 assert r.headers['X-Linked-Etag'].strip('"')==sha
 assert int(r.headers['X-Linked-Size'])==size
 fileid=r.headers['X-Xet-Hash']
 req=urllib.request.Request(token['casUrl']+'/v2/reconstructions/'+fileid,headers={'Authorization':'Bearer '+token['accessToken']})
 with urllib.request.urlopen(req,timeout=45) as r:rec=json.load(r)
 assert rec['offset_into_first_range']==0
 assert sum(t['unpacked_length'] for t in rec['terms'])==size
 ranges=collections.defaultdict(list); hosts=collections.Counter()
 for xorb,entries in rec['xorbs'].items():
  for entry in entries:
   hosts[urllib.parse.urlparse(entry['url']).hostname]+=1
   for ran in entry['ranges']:ranges[xorb].append((ran['bytes']['start'],ran['bytes']['end']))
 wire=sum(b-a+1 for rs in ranges.values() for a,b in rs)
 return dict(file=name,original_bytes=size,sha256=sha,xet_fileid=fileid,terms=len(rec['terms']),xorbs=len(ranges),fetch_bytes=wire,fetch_ratio=wire/size,hosts=dict(hosts)),dict(ranges)
allranges=collections.defaultdict(list);rows=[]
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as ex:
 for row,ranges in ex.map(work,files):
  rows.append(row)
  for x,rs in ranges.items():allranges[x]+=rs
  print(json.dumps(row),flush=True)
unique=0
for ranges in allranges.values():
 merged=[]
 for a,b in sorted(ranges):
  if merged and a<=merged[-1][1]+1:merged[-1][1]=max(b,merged[-1][1])
  else:merged.append([a,b])
 unique+=sum(b-a+1 for a,b in merged)
original=sum(r['original_bytes'] for r in rows); wire=sum(r['fetch_bytes'] for r in rows)
out=dict(note='Metadata-only; no xorb bodies fetched. Every reconstructed term total equals pinned file size and HEAD SHA256 matches compiled manifest. Fetch bytes include physical xorb ranges, excluding HTTP/TLS overhead; no cache assumed.',rows=rows,total_original_bytes=original,total_fetch_bytes_per_file=wire,total_unique_fetch_bytes=unique,ratio_per_file=wire/original,ratio_global_dedup=unique/original,saved_bytes_per_file=original-wire)
(HERE/'xet-metadata.json').write_text(json.dumps(out,indent=2));print(json.dumps({k:v for k,v in out.items() if k!='rows'},indent=2))
```

## Invocation and limits

Network binary compiled with `swiftc -O -swift-version 5`; sequential calls `(connections, chunks, mode)` were `(1,2,resolve)`, `(8,16,resolve)`, `(8,16,direct)`, `(16,16,resolve)`, `(16,16,resolve)`, `(8,16,direct)`, `(8,16,resolve)`. Each chunk is 64 MiB. The eight-connection cases reuse each connection for a second chunk; sixteen-connection cases are one chunk per connection, so their cold-start fractions differ. Do not derive a steady-state concurrency optimum from these probes. Direct-mode HEAD setup is separately reported and excluded from its MB/s. All seven transfers completed with valid ranges and exact byte counts, with zero request errors. Rates drifted materially over the sequence. No end-to-end Xet download, full compressed archive, fresh gigabit control, or multigigabit test ran.

Compression used zstandard level 3 and lz4.block, loaded only into the isolated scratch directory. Each decompressed sample and inverse byte regrouping was compared byte-for-byte to its original. This is a deterministic stratified sample, not a random population estimate or a compression/decompression speed benchmark. The target filesystem and CPU had other live work; no model process or large disk copy was launched by this audit.
