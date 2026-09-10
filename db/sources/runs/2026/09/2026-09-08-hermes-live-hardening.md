---
type: run
id: 01m22300enzhrfzdc984rhqaw8
created: 2026-09-09T03:22:13.845199+00:00
updated: 2026-09-09T03:22:13.911166+00:00
summary: Hermes real-model output budget, tools and compression acceptance
binary: Slotstream 0.2.11 SHA256 7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8; Hermes 4a39a3ff8bea45ab5a6b646ce26ced88a8fed079
captured_at: 2026-09-08
command: Hermes Python Tools/hermes_integration_gate.py hermes-latest agent-v2 --compress --long-output --contaminated
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hermes real-model output budget, tools and compression acceptance
tool: Tools/hermes_integration_gate.py
---
Released Slotstream binary with unmodified latest Hermes, using the revised guide through CLI initialization. Requests and responses came from the real local model. This receipt contains the client results, parsed wire parameters, completion usage and finish reasons; full original captures remain local with their SHA-256 identities. It is functional evidence, not a speed or memory-bound benchmark.

```json
{
  "passed": true,
  "identity": {
    "server_version": "0.2.11",
    "server_sha256": "7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8",
    "hermes_commits": {
      "latest": "4a39a3ff8bea45ab5a6b646ce26ced88a8fed079",
      "reported_version": "b1f003e18633298d549668b8e186af84cca45b76"
    },
    "server_flags": [
      "serve",
      "--max-context",
      "65536",
      "--mtp",
      "off",
      "--memory-gb",
      "10"
    ],
    "preflight_reclaimable_gb": 30.4,
    "test_purpose": "Functional integration; not a throughput or memory-bound benchmark"
  },
  "driver_note": "Live multi-turn run used 127.0.0.1 for the loopback endpoint. The later committed gate retains localhost at the default port and adds timeout capture plus summary-only recall and long-request-cap assertions; those extra assertions are verified against these original captures below. CLI smoke runs use the final gate.",
  "context_length": 65536,
  "compression_threshold": 55705,
  "title": "Diagnose local Hermes and Slotstream integration",
  "tool_executions": [
    {
      "name": "terminal",
      "args": {
        "command": "cat diagnostic.txt"
      },
      "result": "{\"output\": \"HERMES_SLOTSTREAM_INTEGRATION_42\", \"exit_code\": 0, \"error\": null}"
    }
  ],
  "first_reply": "HERMES_SLOTSTREAM_INTEGRATION_42",
  "followup": "HERMES_SLOTSTREAM_INTEGRATION_42",
  "long_output": "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n84\n85\n86\n87\n88\n89\n90\n91\n92\n93\n94\n95\n96\n97\n98\n99\n100\n101\n102\n103\n104\n105\n106\n107\n108\n109\n110\n111\n112\n113\n114\n115\n116\n117\n118\n119\n120\n121\n122\n123\n124\n125\n126\n127\n128\n129\n130\n131\n132\n133\n134\n135\n136\n137\n138\n139\n140\n141\n142\n143\n144\n145\n146\n147\n148\n149\n150\n151\n152\n153\n154\n155\n156\n157\n158\n159\n160\n161\n162\n163\n164\n165\n166\n167\n168\n169\n170\n171\n172\n173\n174\n175\n176\n177\n178\n179\n180\n181\n182\n183\n184\n185\n186\n187\n188\n189\n190\n191\n192\n193\n194\n195\n196\n197\n198\n199\n200\n201\n202\n203\n204\n205\n206\n207\n208\n209\n210\n211\n212\n213\n214\n215\n216\n217\n218\n219\n220\n221\n222\n223\n224\n225\n226\n227\n228\n229\n230\n231\n232\n233\n234\n235\n236\n237\n238\n239\n240\n241\n242\n243\n244\n245\n246\n247\n248\n249\n250\n251\n252\n253\n254\n255\n256\n257\n258\n259\n260\n261\n262\n263\n264\n265\n266\n267\n268\n269\n270\n271\n272\n273\n274\n275\n276\n277\n278\n279\n280\n281\n282\n283\n284\n285\n286\n287\n288\n289\n290\n291\n292\n293\n294\n295\n296\n297\n298\n299\n300\nEND_OF_LIST",
  "long_output_completions": [
    {
      "usage": {
        "prompt_tokens": 734,
        "completion_tokens": 1095,
        "prompt_tokens_details": {
          "cached_tokens": 0
        },
        "total_tokens": 1829
      },
      "finish_reason": "stop"
    }
  ],
  "long_request_max_tokens": 4096,
  "long_list_exact": true,
  "compression": {
    "before_messages": 39,
    "after_messages": 25,
    "before_chars": 99684,
    "after_chars": 86585,
    "http_requests": 1,
    "finish_reasons": [
      "stop"
    ]
  },
  "marker_only_in_summary_at_index": 4,
  "after_compression": "HERMES_SLOTSTREAM_INTEGRATION_42",
  "requests": [
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 400,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "usage": [],
      "finish_reasons": []
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "usage": [
        {
          "prompt_tokens": 3658,
          "total_tokens": 3685,
          "completion_tokens": 27,
          "prompt_tokens_details": {
            "cached_tokens": 0
          }
        }
      ],
      "finish_reasons": [
        "tool_calls"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "usage": [
        {
          "completion_tokens": 10,
          "prompt_tokens_details": {
            "cached_tokens": 0
          },
          "prompt_tokens": 285,
          "total_tokens": 295
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "usage": [
        {
          "prompt_tokens": 3730,
          "completion_tokens": 10,
          "prompt_tokens_details": {
            "cached_tokens": 3685
          },
          "total_tokens": 3740
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "usage": [
        {
          "prompt_tokens": 3771,
          "total_tokens": 3781,
          "completion_tokens": 10,
          "prompt_tokens_details": {
            "cached_tokens": 3740
          }
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 0,
      "usage": [
        {
          "prompt_tokens": 734,
          "completion_tokens": 1095,
          "prompt_tokens_details": {
            "cached_tokens": 0
          },
          "total_tokens": 1829
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 400,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "usage": [],
      "finish_reasons": []
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "usage": [
        {
          "prompt_tokens": 298,
          "total_tokens": 312,
          "completion_tokens": 14,
          "prompt_tokens_details": {
            "cached_tokens": 0
          }
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 400,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "usage": [],
      "finish_reasons": []
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "usage": [
        {
          "prompt_tokens": 263,
          "completion_tokens": 14,
          "prompt_tokens_details": {
            "cached_tokens": 0
          },
          "total_tokens": 277
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "usage": [
        {
          "completion_tokens": 724,
          "prompt_tokens_details": {
            "cached_tokens": 0
          },
          "prompt_tokens": 8043,
          "total_tokens": 8767
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    },
    {
      "url": "http://127.0.0.1:11434/v1/chat/completions",
      "status": 200,
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "usage": [
        {
          "prompt_tokens": 18659,
          "total_tokens": 18669,
          "completion_tokens": 10,
          "prompt_tokens_details": {
            "cached_tokens": 0
          }
        }
      ],
      "finish_reasons": [
        "stop"
      ]
    }
  ],
  "full_captures_sha256": {
    "result.json": "10474616f7fc819fb4d78d12049422fd24e7b20dcafa90500cc60c62d2edd514",
    "http.json": "ff0f485c2176812008a60b423182ddd083f9165d66f491d05554d93770fe8ab9"
  }
}
```
