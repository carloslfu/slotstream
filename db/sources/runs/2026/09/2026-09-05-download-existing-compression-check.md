---
type: run
id: 01m1t1wyp5w4vw8p91w6h0xtk1
created: 2026-09-06T00:29:09.701248+00:00
updated: 2026-09-06T00:29:23.246614+00:00
summary: 'Actual file-header checks: raw quantized safetensors, gzip installer, Deflate wheels, and BG4-LZ4 Xet storage chunks'
binary: Python standard library; no inference runtime
captured_at: 2026-09-05
command: .venv31/bin/python .build/download-format-check/http_formats.py; .venv31/bin/python .build/download-format-check/wheel_formats.py; local header inspection as described in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Existing download compression checked from actual file headers
tool: Python struct/json/urllib file-format probes
---
# Actual file formats and existing compression

Captured at 2026-09-06T00:29:09.682488+00:00. Read all pinned local model-file headers and text files, checked HTTP prefixes against local bytes, inspected the released installer gzip signature and compatibility wheels ZIP directories, and read three actual Xet chunk headers. No full network weight/archive download or model launch. Tokens and signed URLs stayed in memory.

## local-formats.json

```json
{
  "files": [
    {
      "file": "LICENSE",
      "bytes": 3235,
      "size_matches": true,
      "first_16_hex": "5177656e20436f6d6d756e697479204c",
      "format": "plain UTF-8 text"
    },
    {
      "file": "README.md",
      "bytes": 6139,
      "size_matches": true,
      "first_16_hex": "2d2d2d0a6c6963656e73653a206f7468",
      "format": "plain UTF-8 text"
    },
    {
      "file": "chat_template.jinja",
      "bytes": 8952,
      "size_matches": true,
      "first_16_hex": "7b252d2073657420696d6167655f636f",
      "format": "plain UTF-8 text"
    },
    {
      "file": "config.json",
      "bytes": 33408,
      "size_matches": true,
      "first_16_hex": "7b0a2020226172636869746563747572",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "generation_config.json",
      "bytes": 202,
      "size_matches": true,
      "first_16_hex": "7b0a2020202022626f735f746f6b656e",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "merges.txt",
      "bytes": 3353259,
      "size_matches": true,
      "first_16_hex": "c4a020c4a00ac4a0c4a020c4a0c4a00a",
      "format": "plain UTF-8 text"
    },
    {
      "file": "model-00001.safetensors",
      "bytes": 10039592993,
      "size_matches": true,
      "first_16_hex": "61000100000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 65633,
      "tensors": 522,
      "raw_tensor_bytes": 10039527352,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00002.safetensors",
      "bytes": 10000066971,
      "size_matches": true,
      "first_16_hex": "134a0000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 18963,
      "tensors": 120,
      "raw_tensor_bytes": 10000048000,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00003.safetensors",
      "bytes": 10000066984,
      "size_matches": true,
      "first_16_hex": "204a0000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 18976,
      "tensors": 120,
      "raw_tensor_bytes": 10000048000,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00004.safetensors",
      "bytes": 10170248438,
      "size_matches": true,
      "first_16_hex": "4e8e0000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 36430,
      "tensors": 249,
      "raw_tensor_bytes": 10170212000,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00005.safetensors",
      "bytes": 10194989755,
      "size_matches": true,
      "first_16_hex": "f3b60000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 46835,
      "tensors": 329,
      "raw_tensor_bytes": 10194942912,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00006.safetensors",
      "bytes": 10262727991,
      "size_matches": true,
      "first_16_hex": "4fdb0000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 56143,
      "tensors": 395,
      "raw_tensor_bytes": 10262671840,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00007.safetensors",
      "bytes": 10190937668,
      "size_matches": true,
      "first_16_hex": "3cbc0000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 48188,
      "tensors": 339,
      "raw_tensor_bytes": 10190889472,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00008.safetensors",
      "bytes": 10231122683,
      "size_matches": true,
      "first_16_hex": "33cd0000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 52531,
      "tensors": 368,
      "raw_tensor_bytes": 10231070144,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00009.safetensors",
      "bytes": 10250305804,
      "size_matches": true,
      "first_16_hex": "e4c30000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 50148,
      "tensors": 354,
      "raw_tensor_bytes": 10250255648,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00010.safetensors",
      "bytes": 10237786674,
      "size_matches": true,
      "first_16_hex": "0ad40000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 54282,
      "tensors": 383,
      "raw_tensor_bytes": 10237732384,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model-00011.safetensors",
      "bytes": 2192353120,
      "size_matches": true,
      "first_16_hex": "58130000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 4952,
      "tensors": 36,
      "raw_tensor_bytes": 2192348160,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "format": "mlx"
      }
    },
    {
      "file": "model.safetensors.index.json",
      "bytes": 317973,
      "size_matches": true,
      "first_16_hex": "7b0a2020226d65746164617461223a20",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "preprocessor_config.json",
      "bytes": 390,
      "size_matches": true,
      "first_16_hex": "7b0a202020202273697a65223a207b0a",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "qwen4_exp.py",
      "bytes": 35046,
      "size_matches": true,
      "first_16_hex": "2320506f7274204d4c58206465205177",
      "format": "plain UTF-8 text"
    },
    {
      "file": "tokenizer.json",
      "bytes": 12809320,
      "size_matches": true,
      "first_16_hex": "7b0a20202276657273696f6e223a2022",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "tokenizer_config.json",
      "bytes": 17928,
      "size_matches": true,
      "first_16_hex": "7b0a20202020226164645f7072656669",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "video_preprocessor_config.json",
      "bytes": 385,
      "size_matches": true,
      "first_16_hex": "7b0a202020202273697a65223a207b0a",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "vocab.json",
      "bytes": 6722759,
      "size_matches": true,
      "first_16_hex": "7b0a202020202221223a20302c0a2020",
      "format": "plain UTF-8 JSON"
    },
    {
      "file": "mtp.safetensors",
      "bytes": 1470955171,
      "size_matches": true,
      "first_16_hex": "9b200000000000007b225f5f6d657461",
      "format": "safetensors: JSON header plus contiguous raw tensor bytes",
      "header_bytes": 8347,
      "tensors": 68,
      "raw_tensor_bytes": 1470946816,
      "shape_dtype_bytes_match": true,
      "whole_file_covered": true,
      "metadata": {
        "recipe": "4-bit group 64 affine, router/gates/norms bf16, centered norms +1-folded (incl. pre_fc norms)",
        "source_repo": "Qwen/Qwen3.8-Flash-Next",
        "source_revision": "de4b8e4d43b917e7706784d8bb445c9af86a3540"
      }
    }
  ],
  "totals": {
    "model_files": 25,
    "safetensors_files": 12,
    "safetensors_bytes": 105241154252,
    "text_bytes": 23308996,
    "dtype_bytes": {
      "BF16": 15515723488,
      "U32": 89724968960,
      "I64": 280
    }
  },
  "quantization_config": {
    "quantization": {
      "group_size": 64,
      "bits": 4,
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_0": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_1": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_2": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_3": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_4": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_5": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_6": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_7": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_8": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_9": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_10": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_11": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_12": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_13": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_14": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_15": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_16": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_17": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_18": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_19": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_20": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_21": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_22": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_23": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_24": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_25": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_26": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_27": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_28": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_29": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_30": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_31": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_32": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_33": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_34": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_35": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_36": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_37": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_38": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_39": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_40": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_41": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_42": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_43": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_44": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_45": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_46": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_47": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_48": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_49": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_50": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_51": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_52": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_53": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_54": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_55": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_56": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_57": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_58": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_59": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_60": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_61": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_62": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_63": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_64": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_65": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_66": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_67": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_68": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_69": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_70": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_71": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_72": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_73": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_74": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_75": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_76": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_77": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_78": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_79": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_80": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_81": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_82": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_83": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_84": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_85": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_86": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_87": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_88": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_89": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_90": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_91": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_92": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_93": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_94": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_95": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_96": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_97": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_98": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_99": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_100": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_101": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_102": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_103": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_104": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_105": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_106": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_107": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_108": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_109": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_110": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_111": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_112": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_113": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_114": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_115": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_116": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_117": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_118": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_119": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_120": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_121": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_122": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_123": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_124": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_125": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_126": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_127": {
        "group_size": 32,
        "bits": 4
      }
    },
    "quantization_config": {
      "group_size": 64,
      "bits": 4,
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_0": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_1": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_2": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_3": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_4": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_5": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_6": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_7": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_8": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_9": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_10": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_11": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_12": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_13": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_14": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_15": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_16": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_17": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_18": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_19": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_20": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_21": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_22": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_23": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_24": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_25": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_26": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_27": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_28": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_29": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_30": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_31": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_32": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_33": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_34": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_35": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_36": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_37": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_38": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_39": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_40": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_41": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_42": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_43": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_44": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_45": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_46": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_47": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_48": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_49": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_50": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_51": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_52": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_53": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_54": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_55": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_56": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_57": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_58": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_59": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_60": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_61": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_62": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_63": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_64": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_65": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_66": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_67": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_68": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_69": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_70": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_71": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_72": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_73": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_74": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_75": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_76": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_77": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_78": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_79": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_80": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_81": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_82": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_83": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_84": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_85": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_86": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_87": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_88": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_89": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_90": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_91": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_92": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_93": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_94": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_95": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_96": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_97": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_98": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_99": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_100": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_101": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_102": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_103": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_104": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_105": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_106": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_107": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_108": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_109": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_110": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_111": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_112": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_113": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_114": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_115": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_116": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_117": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_118": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_119": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_120": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_121": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_122": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_123": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_124": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_125": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_126": {
        "group_size": 32,
        "bits": 4
      },
      "model.layers.1.ple.ple_embedding.ngram_embedding.shard_127": {
        "group_size": 32,
        "bits": 4
      }
    }
  }
}
```

## http-formats.json

```json
{
  "http_prefix_checks": [
    {
      "status": 206,
      "content_type": "application/octet-stream",
      "content_encoding": null,
      "content_range": "bytes 0-63/10039592993",
      "response_host": "us.aws.cdn.hf.co",
      "first_8_hex": "6100010000000000",
      "file": "model-00001.safetensors",
      "local_prefix_matches": true
    },
    {
      "status": 206,
      "content_type": "application/octet-stream",
      "content_encoding": null,
      "content_range": "bytes 0-63/1470955171",
      "response_host": "us.aws.cdn.hf.co",
      "first_8_hex": "9b20000000000000",
      "file": "mtp.safetensors",
      "local_prefix_matches": true
    },
    {
      "status": 206,
      "content_type": "application/json",
      "content_encoding": null,
      "content_range": "bytes 0-63/12809320",
      "response_host": "us.aws.cdn.hf.co",
      "first_8_hex": "7b0a202022766572",
      "file": "tokenizer.json",
      "local_prefix_matches": true
    },
    {
      "status": 206,
      "content_type": "text/plain; charset=utf-8",
      "content_encoding": null,
      "content_range": "bytes 0-63/33408",
      "response_host": "huggingface.co",
      "first_8_hex": "7b0a202022617263",
      "file": "config.json",
      "local_prefix_matches": true
    },
    {
      "status": 206,
      "content_type": "application/octet-stream",
      "content_encoding": null,
      "content_range": "bytes 0-63/51359533",
      "response_host": "release-assets.githubusercontent.com",
      "first_8_hex": "1f8b08001a429b6a",
      "file": "slotstream-arm64.tar.gz",
      "release": "v0.2.7",
      "asset_bytes": 51359533,
      "gzip_magic": true
    },
    {
      "status": 206,
      "content_type": "application/octet-stream",
      "content_encoding": null,
      "content_range": "bytes 0-63/38624074",
      "response_host": "files.pythonhosted.org",
      "first_8_hex": "504b030414000000",
      "file": "mlx_metal-0.31.1-py3-none-macosx_14_0_arm64.whl",
      "zip_magic": true
    },
    {
      "status": 206,
      "content_type": "application/octet-stream",
      "content_encoding": null,
      "content_range": "bytes 0-63/38618950",
      "response_host": "files.pythonhosted.org",
      "first_8_hex": "504b030414000000",
      "file": "mlx_metal-0.31.1-py3-none-macosx_15_0_arm64.whl",
      "zip_magic": true
    }
  ],
  "xet_chunk_headers": [
    {
      "group": "experts",
      "dtype": "U32",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight",
      "chunk_version": 0,
      "scheme": 2,
      "scheme_name": "ByteGrouping4LZ4",
      "compressed_payload_bytes": 87671,
      "unpacked_bytes": 92160,
      "content_encoding": null
    },
    {
      "group": "experts",
      "dtype": "BF16",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.biases",
      "chunk_version": 0,
      "scheme": 2,
      "scheme_name": "ByteGrouping4LZ4",
      "compressed_payload_bytes": 110959,
      "unpacked_bytes": 131072,
      "content_encoding": null
    },
    {
      "group": "ngram",
      "dtype": "BF16",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.biases",
      "chunk_version": 0,
      "scheme": 2,
      "scheme_name": "ByteGrouping4LZ4",
      "compressed_payload_bytes": 104443,
      "unpacked_bytes": 131072,
      "content_encoding": null
    }
  ],
  "note": "Bounded prefix reads. No full model/archive downloads. Xet headers describe sampled stored chunks, not the population of all chunks."
}
```

## wheel-formats.json

```json
[
  {
    "file": "mlx_metal-0.31.1-py3-none-macosx_14_0_arm64.whl",
    "largest_entries": [
      {
        "name": "mlx/lib/mlx.metallib",
        "zip_compression_method": 8,
        "compressed_bytes": 32199333,
        "uncompressed_bytes": 107392404
      },
      {
        "name": "mlx/lib/libmlx.dylib",
        "zip_compression_method": 8,
        "compressed_bytes": 5804639,
        "uncompressed_bytes": 23448928
      }
    ]
  },
  {
    "file": "mlx_metal-0.31.1-py3-none-macosx_15_0_arm64.whl",
    "largest_entries": [
      {
        "name": "mlx/lib/mlx.metallib",
        "zip_compression_method": 8,
        "compressed_bytes": 32193022,
        "uncompressed_bytes": 107367258
      },
      {
        "name": "mlx/lib/libmlx.dylib",
        "zip_compression_method": 8,
        "compressed_bytes": 5805820,
        "uncompressed_bytes": 23449504
      }
    ]
  }
]
```

## Reproduction http_formats.py

```python
import urllib.request,urllib.error,urllib.parse,json,pathlib,re,struct
HERE=pathlib.Path(__file__).parent
base='https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit/resolve/e9d552f83de4665d243d5c9cf73201a1ca6c16d7/'
root=pathlib.Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'
rows=[]
def prefix(url,byte_range='bytes=0-63'):
 req=urllib.request.Request(url,headers={'Range':byte_range,'Accept-Encoding':'identity'})
 with urllib.request.urlopen(req,timeout=20) as r:
  data=r.read(64)
  return data,dict(status=r.status,content_type=r.headers.get('Content-Type'),content_encoding=r.headers.get('Content-Encoding'),content_range=r.headers.get('Content-Range'),response_host=urllib.parse.urlparse(r.url).hostname,first_8_hex=data[:8].hex())
for name in ['model-00001.safetensors','mtp.safetensors','tokenizer.json','config.json']:
 data,info=prefix(base+name)
 with (root/name).open('rb') as f:assert f.read(len(data))==data
 info.update(file=name,local_prefix_matches=True);rows.append(info)
try:
 with urllib.request.urlopen('https://api.github.com/repos/carloslfu/slotstream/releases/latest',timeout=20) as r:release=json.load(r)
 asset=next(x for x in release['assets'] if x['name']=='slotstream-arm64.tar.gz')
 data,info=prefix(asset['browser_download_url'])
 info.update(file=asset['name'],release=release['tag_name'],asset_bytes=asset['size'],gzip_magic=data[:3]==b'\x1f\x8b\x08');rows.append(info)
except urllib.error.HTTPError as e:rows.append(dict(file='installer release',http_error=e.code))
urls=re.findall(r'WHEEL_URL="(https:[^"]+)"',pathlib.Path('install.sh').read_text())
for url in urls:
 data,info=prefix(url)
 info.update(file=urllib.parse.urlparse(url).path.split('/')[-1],zip_magic=data[:4]==b'PK\x03\x04');rows.append(info)
# Inspect actual Xet chunk headers for three tensor categories. Tokens and signed URLs never leave memory.
with urllib.request.urlopen('https://huggingface.co/api/models/carloslfu/Qwen3.8-Flash-Next-MLX-4bit/xet-read-token/e9d552f83de4665d243d5c9cf73201a1ca6c16d7',timeout=20) as r:token=json.load(r)
tensors=json.loads(pathlib.Path('.build/download-audit/tensors.json').read_text())['tensors']
ids={r['file']:r['xet_fileid'] for r in json.loads(pathlib.Path('.build/download-audit/xet-metadata.json').read_text())['rows']}
xorb=[]
for group,dtype in [('experts','U32'),('experts','BF16'),('ngram','BF16')]:
 t=next(t for t in tensors if t['group']==group and t['dtype']==dtype and t['size']>1048576)
 a=t['offset'];req=urllib.request.Request(token['casUrl']+'/v2/reconstructions/'+ids[t['file']],headers={'Authorization':'Bearer '+token['accessToken'],'Range':f'bytes={a}-{a+65535}'})
 with urllib.request.urlopen(req,timeout=20) as r:recon=json.load(r)
 entry=next(e for e in recon['xorbs'][recon['terms'][0]['hash']] if len(e['ranges'])==1)
 ran=entry['ranges'][0]['bytes'];data,info=prefix(entry['url'],f"bytes={ran['start']}-{ran['end']}")
 assert len(data)>=8
 version=data[0];compressed=int.from_bytes(data[1:4],'little');scheme=data[4];unpacked=int.from_bytes(data[5:8],'little')
 assert version==0 and scheme in (0,1,2)
 xorb.append(dict(group=group,dtype=dtype,file=t['file'],tensor=t['name'],chunk_version=version,scheme=scheme,scheme_name={0:'None',1:'LZ4',2:'ByteGrouping4LZ4'}[scheme],compressed_payload_bytes=compressed,unpacked_bytes=unpacked,content_encoding=info['content_encoding']))
out=dict(http_prefix_checks=rows,xet_chunk_headers=xorb,note='Bounded prefix reads. No full model/archive downloads. Xet headers describe sampled stored chunks, not the population of all chunks.')
(HERE/'http-formats.json').write_text(json.dumps(out,indent=2));print(json.dumps(out,indent=2))

```

## Reproduction wheel_formats.py

```python
import pathlib,re,urllib.request,urllib.parse,struct,json
urls=re.findall(r'WHEEL_URL="(https:[^"]+)"',pathlib.Path('install.sh').read_text())
rows=[]
for url in urls:
 req=urllib.request.Request(url,headers={'Range':'bytes=-65536','Accept-Encoding':'identity'})
 with urllib.request.urlopen(req,timeout=20) as r:
  assert r.status==206;tail=r.read(65537);cr=r.headers['Content-Range']
 assert len(tail)<=65536
 start=int(cr.split()[1].split('-')[0]);eocd=tail.rfind(b'PK\x05\x06');assert eocd>=0
 entries=int.from_bytes(tail[eocd+10:eocd+12],'little');central=int.from_bytes(tail[eocd+16:eocd+20],'little')-start
 assert central>=0
 contents=[];p=central
 for _ in range(entries):
  assert tail[p:p+4]==b'PK\x01\x02'
  method=int.from_bytes(tail[p+10:p+12],'little');compressed=int.from_bytes(tail[p+20:p+24],'little');uncompressed=int.from_bytes(tail[p+24:p+28],'little')
  namelen=int.from_bytes(tail[p+28:p+30],'little');extra=int.from_bytes(tail[p+30:p+32],'little');comment=int.from_bytes(tail[p+32:p+34],'little')
  name=tail[p+46:p+46+namelen].decode();contents.append(dict(name=name,zip_compression_method=method,compressed_bytes=compressed,uncompressed_bytes=uncompressed));p+=46+namelen+extra+comment
 rows.append(dict(file=urllib.parse.urlparse(url).path.split('/')[-1],largest_entries=sorted(contents,key=lambda x:-x['uncompressed_bytes'])[:2]))
pathlib.Path('.build/download-format-check/wheel-formats.json').write_text(json.dumps(rows,indent=2));print(json.dumps(rows,indent=2))

```

The local inspection decoded the first eight bytes of every safetensors file as the little-endian JSON-header length, parsed each tensor dtype/shape/data_offsets, verified every payload length equals shape product times dtype bytes, and required sorted offsets to cover the entire payload without gaps. All 25 sizes matched the pinned manifest. All other model files decoded as UTF-8; JSON files also parsed. The installed checkpoint config reports four-bit quantization, default group_size 64 and n-gram overrides with group_size 32. ZIP compression method 8 is Deflate. Xet sampled scheme 2 is ByteGrouping4LZ4; these few sampled chunk headers do not establish compression proportions across the model. Whole-model Xet byte accounting remains the separate earlier metadata measurement.
