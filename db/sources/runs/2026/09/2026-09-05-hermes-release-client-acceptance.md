---
type: run
id: 01m1t91pj9mncys97831f43nwb
created: 2026-09-06T02:34:05.257825+00:00
updated: 2026-09-06T02:34:47.688092+00:00
summary: 'Hermes 0.2.8 clean release: real clients and regression acceptance'
binary: 6fc6c3525c8490cb70f6ab95c8769b70ac7b80ea43d1fa6bad63ecf4c83f4b31; c40d7705a978d8c05185861065a6773e0e46c3ffb6293a6e590fe0495451cc48
captured_at: 2026-09-06T02:34:47.683958+00:00
command: python3 /tmp/slotstream-hermes-release-run.py; gh run view 34005877377
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Hermes 0.2.8 clean release: real clients and regression acceptance'
tool: Hermes, OpenAI, Ollama, gateway, vision, API robustness, CI
---
The clean 0.2.8 candidate passed its complete functional release matrix. The source is public commit 2a69ac0be4148a6f351cc18159c8dbff49ba3f7e. The client server used local binary 6fc6c3525c8490cb70f6ab95c8769b70ac7b80ea43d1fa6bad63ecf4c83f4b31; the final ordinary API suite used c40d7705a978d8c05185861065a6773e0e46c3ffb6293a6e590fe0495451cc48. The only engine source difference makes the unchanged OpenAI default validator package-visible for tests; the previous context/gates record preserves that source bridge. No neural, planning, generation, or tensor change occurs between them.

Hermes remains an independently installed client. The helper uses isolated state, a dummy API key and blocked non-loopback connections, and permits only the real terminal dispatcher reading the synthetic diagnostic fixture. The actual CLI attempted its GitHub update check; that nonlocal connection was blocked. All inference was local. These are functional checks, not performance comparisons.

The release client tests use --memory-gb 11 --max-context 65536 --vision on --mtp off. The ordinary API suite uses the existing 13-expert-per-layer test profile. Each launch checks reclaimable memory and the shared model lock, and the owned servers are stopped after use. The full-window text memory qualification is a separate run; combined context/vision functionality does not establish a full-window multimodal memory bound.

The following JSON selects fields directly from the retained raw result and HTTP captures. It omits repeated synthetic prompt text and the fixture's inline image bytes, and retains SHA-256 hashes of the complete local captures. Wire summaries retain request options, status, finish reasons and usage. The fixture and capture implementation are public in Tools/hermes_integration_gate.py. Forced compression passed with a complete summary and exact-code recall; this is not an automatic-threshold stress test.

## Selected raw client and command results

```json
{
  "version": "0.2.8",
  "public_source_commit": "2a69ac0be4148a6f351cc18159c8dbff49ba3f7e",
  "client_binary_sha256": "6fc6c3525c8490cb70f6ab95c8769b70ac7b80ea43d1fa6bad63ecf4c83f4b31",
  "api_regression_binary_sha256": "c40d7705a978d8c05185861065a6773e0e46c3ffb6293a6e590fe0495451cc48",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "hermes_release": {
    "tag": "v2026.8.31",
    "commit": "29112bef099274229cadff79cdff7bf7b99c4b77"
  },
  "hermes_main_commit": "9dd6634c5635321cf38840cc30e9b51226689128",
  "commands": [
    {
      "name": "context-65520",
      "command": [
        "/tmp/slotstream-hermes-release-candidate/.build/release/slotstream",
        "context-check",
        "--tokens",
        "65520",
        "--memory-gb",
        "10",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--sample-footprint",
        "--min-free-gb",
        "8",
        "--json"
      ],
      "exit": 0,
      "seconds": 1335.6113110000733
    },
    {
      "name": "hermes-release",
      "command": [
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release/.venv/bin/python",
        "/tmp/slotstream-hermes-release-candidate/Tools/hermes_integration_gate.py",
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release",
        "/tmp/slotstream-hermes-release-evidence/hermes-release",
        "--compress",
        "--image",
        "/tmp/slotstream-hermes-release-candidate/Tools/assets/vision_test/secret1.jpg"
      ],
      "exit": 0,
      "seconds": 757.2765658749267
    },
    {
      "name": "hermes-cli",
      "command": [
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release/.venv/bin/python",
        "/tmp/slotstream-hermes-release-candidate/Tools/hermes_integration_gate.py",
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release",
        "/tmp/slotstream-hermes-release-evidence/hermes-cli",
        "--cli"
      ],
      "exit": 0,
      "seconds": 62.69538712501526
    },
    {
      "name": "hermes-main",
      "command": [
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-agent/.venv/bin/python",
        "/tmp/slotstream-hermes-release-candidate/Tools/hermes_integration_gate.py",
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-agent",
        "/tmp/slotstream-hermes-release-evidence/hermes-main"
      ],
      "exit": 0,
      "seconds": 112.08111762511544
    },
    {
      "name": "openai-tools",
      "command": [
        "/usr/bin/python3",
        "/tmp/slotstream-hermes-release-candidate/Tools/openai_tools_gate.py",
        "--output",
        "/tmp/slotstream-hermes-release-evidence/openai-tools.jsonl",
        "--vision"
      ],
      "exit": 0,
      "seconds": 210.63882341585122
    },
    {
      "name": "vision-serving",
      "command": [
        "/usr/bin/python3",
        "/tmp/slotstream-hermes-release-candidate/Tools/vision_serving.py",
        "11434"
      ],
      "exit": 0,
      "seconds": 193.4083588339854
    },
    {
      "name": "native-gateway",
      "command": [
        "/tmp/slotstream-hermes-assessment.XCdMq0/hermes-release/.venv/bin/python",
        "/tmp/slotstream-hermes-release-evidence/probe_gateway.py"
      ],
      "exit": 0,
      "seconds": 16.20698441611603
    },
    {
      "name": "ollama-image",
      "command": [
        "/opt/homebrew/bin/ollama",
        "run",
        "qwen3.8-flash-next:4bit",
        "Name the animal in this image in one word. /tmp/slotstream-hermes-release-candidate/Tools/assets/vision_test/secret1.jpg"
      ],
      "exit": 0,
      "seconds": 13.588637458859012
    },
    {
      "name": "api-robustness",
      "command": [
        "/bin/bash",
        "/tmp/slotstream-hermes-release-candidate/Tools/api_robustness.sh",
        "11466",
        "13"
      ],
      "exit": 0,
      "seconds": 154.18596349982545
    }
  ],
  "clients": {
    "hermes-release": {
      "context_length": 65536,
      "compression_threshold": 52224,
      "ollama_num_ctx": 65536,
      "title": "Diagnose local Hermes and Slotstream integration",
      "vision_discovered": true,
      "passed": true,
      "main_output_budgets": [
        4096,
        4096,
        4096,
        4096,
        4096
      ],
      "executions": [
        {
          "name": "terminal",
          "args": {
            "command": "cat diagnostic.txt"
          },
          "result": "{\"output\": \"HERMES_SLOTSTREAM_INTEGRATION_42\", \"exit_code\": 0, \"error\": null}"
        }
      ],
      "tool_turn": {
        "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
        "api_calls": 2,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 3152,
        "output_tokens": 37,
        "cache_read_tokens": 3134,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 6286,
        "completion_tokens": 37,
        "total_tokens": 6323,
        "last_prompt_tokens": 3179,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "followup": {
        "final_response": "The file `diagnostic.txt` contained exactly:\n\n```\nHERMES_SLOTSTREAM_INTEGRATION_42\n```",
        "api_calls": 1,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 3183,
        "output_tokens": 62,
        "cache_read_tokens": 6323,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 9506,
        "completion_tokens": 62,
        "total_tokens": 9568,
        "last_prompt_tokens": 3220,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "image_turn": {
        "final_response": "Dog",
        "api_calls": 1,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 6978,
        "output_tokens": 63,
        "cache_read_tokens": 6323,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 13301,
        "completion_tokens": 63,
        "total_tokens": 13364,
        "last_prompt_tokens": 3795,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "after_compression": {
        "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
        "api_calls": 1,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 25221,
        "output_tokens": 73,
        "cache_read_tokens": 6323,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 31544,
        "completion_tokens": 73,
        "total_tokens": 31617,
        "last_prompt_tokens": 18243,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "compression": {
        "before_messages": 39,
        "after_messages": 25,
        "before_chars": 99684,
        "after_chars": 87082,
        "http_requests": 1,
        "telemetry": {
          "event": "compression_attempt",
          "attempt_id": "5a418b1169c147b983184b0048d74136",
          "session_id": "",
          "trigger_source": "unknown",
          "main_provider": "custom",
          "main_model": "qwen3.8-flash-next:4bit",
          "main_context_limit": 65536,
          "current_estimated_tokens": null,
          "effective_threshold": 52224,
          "protected_head_tokens": 672,
          "protected_tail_tokens": 14568,
          "middle_window_tokens": 9676,
          "prellm_skip_count": 0,
          "aux_prompt_tokens": 11285,
          "aux_output_reservation": null,
          "aux_provider": "main",
          "aux_model": "qwen3.8-flash-next:4bit",
          "effective_aux_context": 65536,
          "fit_margin": 54251,
          "chunking": false,
          "chunk_count": 1,
          "total_duration_ms": null,
          "aux_call_duration_ms": 356273,
          "queue_wait_ms": 0,
          "prompt_build_ms": 2,
          "time_to_first_progress_ms": 116852,
          "summary_generation_ms": 356270,
          "commit_ms": null,
          "fallback_used": false,
          "commit_status": "unknown",
          "split_status": "unknown",
          "failure_class": null
        },
        "finish_reasons": [
          "stop"
        ]
      },
      "code_occurrences_after_compression": [
        4
      ],
      "blocked_nonlocal_connection_count": 0,
      "wire": [
        {
          "method": "GET",
          "url": "http://127.0.0.1:11434/api/v1/models",
          "status": 404,
          "request_options": {},
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": [
            "not found: GET /api/v1/models"
          ]
        },
        {
          "method": "GET",
          "url": "http://127.0.0.1:11434/api/tags",
          "status": 200,
          "request_options": {},
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/api/show",
          "status": 200,
          "request_options": {
            "name": "qwen3.8-flash-next:4bit"
          },
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 2,
          "tools": [
            "process",
            "terminal"
          ],
          "finish_reasons": [
            "tool_calls"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 3107,
              "completion_tokens": 27,
              "total_tokens": 3134
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 4,
          "tools": [
            "process",
            "terminal"
          ],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 3134
              },
              "prompt_tokens": 3179,
              "completion_tokens": 10,
              "total_tokens": 3189
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 6,
          "tools": [
            "process",
            "terminal"
          ],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 3189
              },
              "prompt_tokens": 3220,
              "completion_tokens": 25,
              "total_tokens": 3245
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 400,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "temperature": 0.3,
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
          "message_count": 2,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": [
            {
              "type": "invalid_request_error",
              "message": "response_format is not supported for constrained output; only {\"type\": \"text\"} is supported"
            }
          ]
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "temperature": 0.3
          },
          "message_count": 2,
          "tools": [],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 263,
              "completion_tokens": 14,
              "total_tokens": 277
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/api/show",
          "status": 200,
          "request_options": {
            "name": "qwen3.8-flash-next:4bit"
          },
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/api/show",
          "status": 200,
          "request_options": {
            "name": "qwen3.8-flash-next:4bit"
          },
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 2,
          "tools": [
            "process",
            "terminal"
          ],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 3795,
              "completion_tokens": 1,
              "total_tokens": 3796
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "max_tokens": 4096,
            "presence_penalty": 0,
            "temperature": 0.2
          },
          "message_count": 1,
          "tools": [],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 8043,
              "completion_tokens": 859,
              "total_tokens": 8902
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 27,
          "tools": [
            "process",
            "terminal"
          ],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 18243,
              "completion_tokens": 10,
              "total_tokens": 18253
            }
          ],
          "error": []
        }
      ]
    },
    "hermes-main": {
      "context_length": 65536,
      "compression_threshold": 52224,
      "ollama_num_ctx": 65536,
      "title": "Diagnose local Hermes and Slotstream integration",
      "passed": true,
      "main_output_budgets": [
        4096,
        4096,
        4096
      ],
      "executions": [
        {
          "name": "terminal",
          "args": {
            "command": "cat diagnostic.txt"
          },
          "result": "{\"output\": \"HERMES_SLOTSTREAM_INTEGRATION_42\", \"exit_code\": 0, \"error\": null}"
        }
      ],
      "tool_turn": {
        "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
        "api_calls": 2,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 3433,
        "output_tokens": 37,
        "cache_read_tokens": 3415,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 6848,
        "completion_tokens": 37,
        "total_tokens": 6885,
        "last_prompt_tokens": 3460,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "followup": {
        "final_response": "The file `diagnostic.txt` contained exactly:\n\n```\nHERMES_SLOTSTREAM_INTEGRATION_42\n```",
        "api_calls": 1,
        "completed": true,
        "turn_exit_reason": "text_response(finish_reason=stop)",
        "failed": false,
        "partial": false,
        "interrupted": false,
        "response_transformed": false,
        "pre_transform_response": null,
        "response_previewed": false,
        "model": "qwen3.8-flash-next:4bit",
        "provider": "custom",
        "base_url": "http://127.0.0.1:11434/v1",
        "input_tokens": 3464,
        "output_tokens": 62,
        "cache_read_tokens": 6885,
        "cache_write_tokens": 0,
        "reasoning_tokens": 0,
        "prompt_tokens": 10349,
        "completion_tokens": 62,
        "total_tokens": 10411,
        "last_prompt_tokens": 3501,
        "estimated_cost_usd": 0.0,
        "cost_status": "unknown",
        "cost_source": "none",
        "service_tier": null
      },
      "blocked_nonlocal_connection_count": 0,
      "wire": [
        {
          "method": "GET",
          "url": "http://127.0.0.1:11434/api/v1/models",
          "status": 404,
          "request_options": {},
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": [
            "not found: GET /api/v1/models"
          ]
        },
        {
          "method": "GET",
          "url": "http://127.0.0.1:11434/api/tags",
          "status": 200,
          "request_options": {},
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/api/show",
          "status": 200,
          "request_options": {
            "name": "qwen3.8-flash-next:4bit"
          },
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 2,
          "tools": [
            "terminal",
            "tool_search",
            "tool_describe",
            "tool_call"
          ],
          "finish_reasons": [
            "tool_calls"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 3388,
              "completion_tokens": 27,
              "total_tokens": 3415
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 4,
          "tools": [
            "terminal",
            "tool_search",
            "tool_describe",
            "tool_call"
          ],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 3415
              },
              "prompt_tokens": 3460,
              "completion_tokens": 10,
              "total_tokens": 3470
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 6,
          "tools": [
            "terminal",
            "tool_search",
            "tool_describe",
            "tool_call"
          ],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 3470
              },
              "prompt_tokens": 3501,
              "completion_tokens": 25,
              "total_tokens": 3526
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 400,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "temperature": 0.3,
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
          "message_count": 2,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": [
            {
              "type": "invalid_request_error",
              "message": "response_format is not supported for constrained output; only {\"type\": \"text\"} is supported"
            }
          ]
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "temperature": 0.3
          },
          "message_count": 2,
          "tools": [],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 263,
              "completion_tokens": 14,
              "total_tokens": 277
            }
          ],
          "error": []
        }
      ]
    },
    "hermes-cli": {
      "cli_exit": 0,
      "passed": true,
      "cli_answers": [
        "OK"
      ],
      "main_output_budgets": [
        4096
      ],
      "executions": [],
      "blocked_nonlocal_connection_count": 1,
      "wire": [
        {
          "method": "GET",
          "url": "http://127.0.0.1:11434/api/v1/models",
          "status": 404,
          "request_options": {},
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": [
            "not found: GET /api/v1/models"
          ]
        },
        {
          "method": "GET",
          "url": "http://127.0.0.1:11434/api/tags",
          "status": 200,
          "request_options": {},
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/api/show",
          "status": 200,
          "request_options": {
            "name": "qwen3.8-flash-next:4bit"
          },
          "message_count": 0,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 400,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "temperature": 0.3,
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
          "message_count": 2,
          "tools": [],
          "finish_reasons": [],
          "usage": [],
          "error": [
            {
              "message": "response_format is not supported for constrained output; only {\"type\": \"text\"} is supported",
              "type": "invalid_request_error"
            }
          ]
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 4096,
            "reasoning_effort": "none",
            "stream": true,
            "stream_options": {
              "include_usage": true
            },
            "options": {
              "num_ctx": 65536
            },
            "think": false
          },
          "message_count": 2,
          "tools": [
            "process",
            "terminal"
          ],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 3279,
              "completion_tokens": 1,
              "total_tokens": 3280
            }
          ],
          "error": []
        },
        {
          "method": "POST",
          "url": "http://127.0.0.1:11434/v1/chat/completions",
          "status": 200,
          "request_options": {
            "model": "qwen3.8-flash-next:4bit",
            "temperature": 0.3
          },
          "message_count": 2,
          "tools": [],
          "finish_reasons": [
            "stop"
          ],
          "usage": [
            {
              "prompt_tokens_details": {
                "cached_tokens": 0
              },
              "prompt_tokens": 264,
              "completion_tokens": 8,
              "total_tokens": 272
            }
          ],
          "error": []
        }
      ]
    }
  },
  "full_capture_sha256": {
    "hermes-main/result.json": "c41854cdf116bd1d25fecc6453e124b24527de18afa1398ce463618a40474ca0",
    "hermes-cli/result.json": "26a75813fd57508ef3ec788add767e310ae6c4e3b22d9741df2aa2f345a78fb2",
    "hermes-release/result.json": "85f7746b3caf77bbc2487585f56a72dc4739da3e05340ee07a02681a0d5bf275",
    "hermes-main/http.json": "15e35a0a73428a291fef884480afc265eabbb3a84139a5378d1397eadb92fc3a",
    "hermes-cli/http.json": "96ca01e22edc38dcb39ed5d8dd184efb0b8542964c4a16ebfeee25a45280e144",
    "hermes-release/http.json": "2676f9029fd794cc2ab12f69735b1842b0b984d6ae77b7768f8c96022b3da701",
    "openai-tools.jsonl": "d275c5a1fc52055914038e8889175b7571d092d241ed20c7f29b572ce927b7f2",
    "openai-tools.log": "b2e72c9db2778551a827fe6a29ea8c87a2133aad59511e358e4833a9dfab4cc8",
    "vision-serving.log": "c012575412f3e7fed7cd41006dbac530b22ae4c386f20cf30e6409b92d53c427",
    "hermes-main.log": "f8f6e6610731f457337b5d3d0c5d49ada3517d7821a02f0c31e7c40b3fa275bb",
    "hermes-cli.log": "4edbb16784835d89f9f65e05cade8ccff9aacbeb407f8e7b4f32c041dc3662bd",
    "ollama-image.log": "e29360473e5f8a19c273b56e47d087da5b8720a78ea46e7c53d48205a9794cd4",
    "api-robustness.log": "25577e77acaa67a25e0d5ec41ca6d69ec27bf33f89888c0aebe0d4a9ffef672e",
    "native-gateway.log": "500d4811a9fca287c62deb9d79c088a5b904643d9c63f4592e71b28b83618368",
    "context-65520.log": "e0c55dc9f017761c7bd0d9c267b8c35501819b6932e9a760fe7ac3bdac66f7c0",
    "hermes-release.log": "3816e2a5497e0d982de6d8ce5f129f8a7e82104aa83567b673ec0472e974b5f6",
    "server.log": "76c375cdb1f24db514435a34422c9f2bd22b382fb9973932a3aea407c6259d72",
    "results.json": "2e69f8893ea3009a92133f7a97346ce008f91c175e441338ec52a8b39882eddb"
  },
  "ci": {
    "conclusion": "success",
    "databaseId": 34005877377,
    "headSha": "2a69ac0be4148a6f351cc18159c8dbff49ba3f7e",
    "url": "https://github.com/carloslfu/slotstream/actions/runs/34005877377"
  }
}
```

## clients-preflight.json

```json
{
  "reclaimable_gb": 29.829021696,
  "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   339226.\nPages active:                                 880004.\nPages inactive:                               749552.\nPages speculative:                            143130.\nPages throttled:                                   0.\nPages wired down:                             224958.\nPages purgeable:                                8661.\n\"Translation faults\":                    14347993703.\nPages copy-on-write:                       659765088.\nPages zero filled:                       17877085307.\nPages reactivated:                        3025845231.\nPages purged:                               65782076.\nFile-backed pages:                           1472732.\nAnonymous pages:                              299954.\nPages stored in compressor:                  1932806.\nPages occupied by compressor:                 739169.\nDecompressions:                           1094432637.\nCompressions:                             1392850758.\nPageins:                                  6697277979.\nPageouts:                                   10879030.\nSwapins:                                    41724813.\nSwapouts:                                   69922789.\nPages tagged:                                 170271.\nPages tagged resident:                        116385.\nPages tagged compressed:                       53886.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6824.\nPages tag-storage free:                         9702.\nPages tag-storage non-tag pageable:            81770.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8897600.\nTagged compressions:                        10297164.\nTagged decompressions:                       9500430.\n",
  "model_pids": "",
  "lock": "",
  "builds": ""
}
```

## api-regression-preflight.json

```json
{
  "reclaimable_gb": 37.206212608,
  "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   438776.\nPages active:                                1172107.\nPages inactive:                               977432.\nPages speculative:                            193480.\nPages throttled:                                   0.\nPages wired down:                             228983.\nPages purgeable:                                1071.\n\"Translation faults\":                    14381065909.\nPages copy-on-write:                       660749694.\nPages zero filled:                       17978432486.\nPages reactivated:                        3111480320.\nPages purged:                               66698181.\nFile-backed pages:                           1831040.\nAnonymous pages:                              511979.\nPages stored in compressor:                  1610637.\nPages occupied by compressor:                  67282.\nDecompressions:                           1113906555.\nCompressions:                             1419100279.\nPageins:                                  6801459437.\nPageouts:                                   10893928.\nSwapins:                                    42621427.\nSwapouts:                                   74262899.\nPages tagged:                                 151703.\nPages tagged resident:                        122456.\nPages tagged compressed:                       29247.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         7776.\nPages tag-storage non-tag pageable:            83721.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5159616.\nTagged compressions:                        10430566.\nTagged decompressions:                       9628699.\n",
  "model_pids": "",
  "lock": "",
  "builds": ""
}
```

## openai-tools.log

```text
PASS runtime context discovery agrees
PASS nonstream returns executable OpenAI function
PASS nonstream preserves function and typed arguments
PASS nonstream includes call identity and usage
PASS nonstream completes tool-result round trip
PASS stream returns executable OpenAI function
PASS stream preserves function and typed arguments
PASS stream includes call identity and usage
PASS stream completes tool-result round trip
PASS parallel false returns one complete call
PASS parallel stream has distinct complete calls
PASS parallel results match by call ID
PASS tool choice none remains text-only
PASS multiple initial instructions survive rendering
PASS reasoning separated from answer
PASS orphan-result rejected before inference
PASS missing-result rejected before inference
PASS context-inflation rejected before inference
PASS reasoning-conflict rejected before inference
PASS unknown-function rejected before inference
PASS unsupported structured output has actionable rejection
PASS truncated required tool is an inference error
PASS streamed inference error cannot masquerade as success
PASS request context limit is enforced before inference
PASS enabled vision is discoverable by clients
PASS OpenAI image and tool templates compose
PASS image tool-result history remains usable
{"passed": 27, "context": 65536, "model": "qwen3.8-flash-next:4bit"}
```

## vision-serving.log

```text
PASS  ollama /api/chat answers an image request
PASS  and it recognises the dog
      -> 'Dog nose close-up' in 13.3s, 725 prompt tokens
PASS  the picture is worth its 702 placeholder tokens, plus the two sentinels
PASS  /v1/chat/completions answers an image_url part
PASS  and it sees the fruit on the tree
      -> '**Green citrus fruits**'
PASS  /api/generate answers an image request
PASS  and it recognises the dog there too
PASS  the fx gateway accepts an image file part
PASS  and answers about the dog
PASS  and still refuses a file part that is not an image
PASS  two pictures in one turn are accepted
PASS  and they arrive in the order they were sent
      -> 'Dog, Pomelo'
PASS  a follow-up turn on the same picture succeeds
PASS  and reuses the state instead of re-running the tower
      -> first 13.6s, follow-up 1.5s
PASS  the same words with a different picture get a different answer
PASS  a file:// image is a 400
PASS  that says URLs are not fetched
PASS  bytes that are not an image are a 400
PASS  a truncated image is a 400, not a blank description

19 passed, 0 failed
VISION SERVING PASS
```

## native-gateway.log

```text
gateway-tool-turn1 200 10.271
[{"input": "{\"path\":\"diagnostic.txt\"}", "toolCallId": "call_e89eea79", "toolName": "read_file", "type": "tool-call"}, {"finishReason": {"raw": "tool_calls", "unified": "tool-calls"}, "type": "finish", "usage": {"inputTokens": {"cacheRead": 0, "cacheWrite": 0, "noCache": 283, "total": 283}, "outputTokens": {"reasoning": 0, "text": 26, "total": 26}}}]
gateway-tool-turn2 200 5.715
[{"finishReason": {"raw": "stop", "unified": "stop"}, "type": "finish", "usage": {"inputTokens": {"cacheRead": 309, "cacheWrite": 0, "noCache": 27, "total": 336}, "outputTokens": {"reasoning": 0, "text": 26, "total": 26}}}]
ANSWER The file `diagnostic.txt` contains exactly this text:

```
HERMES_SLOTSTREAM_PROBE_42
```
```

## gateway-tool-turn1.json

```json
{
  "name": "gateway-tool-turn1",
  "request": {
    "prompt": [
      {
        "role": "system",
        "content": "You are a helpful assistant. Use read_file to read a requested file."
      },
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text": "Read diagnostic.txt and tell me the exact text it contains."
          }
        ]
      }
    ],
    "tools": [
      {
        "type": "function",
        "name": "read_file",
        "description": "Read a file from the workspace.",
        "inputSchema": {
          "type": "object",
          "properties": {
            "path": {
              "type": "string"
            }
          },
          "required": [
            "path"
          ]
        }
      }
    ],
    "toolChoice": {
      "type": "auto"
    },
    "maxOutputTokens": 96,
    "temperature": 0,
    "seed": 1
  },
  "status": 200,
  "seconds": 10.271,
  "body": "data: {\"type\":\"stream-start\",\"warnings\":[]}\n\ndata: {\"id\":\"gen_78761dd8\",\"modelId\":\"slotstream\\/qwen3.8-flash-next:4bit\",\"timestamp\":\"2026-09-06T02:25:28Z\",\"type\":\"response-metadata\"}\n\ndata: {\"id\":\"call_e89eea79\",\"toolName\":\"read_file\",\"type\":\"tool-input-start\"}\n\ndata: {\"delta\":\"{\\\"path\\\":\\\"diagnostic.txt\\\"\",\"id\":\"call_e89eea79\",\"type\":\"tool-input-delta\"}\n\ndata: {\"delta\":\"}\",\"id\":\"call_e89eea79\",\"type\":\"tool-input-delta\"}\n\ndata: {\"id\":\"call_e89eea79\",\"type\":\"tool-input-end\"}\n\ndata: {\"input\":\"{\\\"path\\\":\\\"diagnostic.txt\\\"}\",\"toolCallId\":\"call_e89eea79\",\"toolName\":\"read_file\",\"type\":\"tool-call\"}\n\ndata: {\"finishReason\":{\"raw\":\"tool_calls\",\"unified\":\"tool-calls\"},\"type\":\"finish\",\"usage\":{\"inputTokens\":{\"cacheRead\":0,\"cacheWrite\":0,\"noCache\":283,\"total\":283},\"outputTokens\":{\"reasoning\":0,\"text\":26,\"total\":26}}}\n\ndata: [DONE]\n\n"
}
```

## gateway-tool-turn2.json

```json
{
  "name": "gateway-tool-turn2",
  "request": {
    "prompt": [
      {
        "role": "system",
        "content": "You are a helpful assistant. Use read_file to read a requested file."
      },
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text": "Read diagnostic.txt and tell me the exact text it contains."
          }
        ]
      },
      {
        "role": "assistant",
        "content": [
          {
            "type": "tool-call",
            "toolCallId": "call_e89eea79",
            "toolName": "read_file",
            "input": {
              "path": "diagnostic.txt"
            }
          }
        ]
      },
      {
        "role": "tool",
        "content": [
          {
            "type": "tool-result",
            "toolCallId": "call_e89eea79",
            "toolName": "read_file",
            "output": {
              "type": "text",
              "value": "HERMES_SLOTSTREAM_PROBE_42"
            }
          }
        ]
      }
    ],
    "tools": [
      {
        "type": "function",
        "name": "read_file",
        "description": "Read a file from the workspace.",
        "inputSchema": {
          "type": "object",
          "properties": {
            "path": {
              "type": "string"
            }
          },
          "required": [
            "path"
          ]
        }
      }
    ],
    "toolChoice": {
      "type": "auto"
    },
    "maxOutputTokens": 96,
    "temperature": 0,
    "seed": 1
  },
  "status": 200,
  "seconds": 5.715,
  "body": "data: {\"type\":\"stream-start\",\"warnings\":[]}\n\ndata: {\"id\":\"gen_81a65716\",\"modelId\":\"slotstream\\/qwen3.8-flash-next:4bit\",\"timestamp\":\"2026-09-06T02:25:39Z\",\"type\":\"response-metadata\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-start\"}\n\ndata: {\"delta\":\"The\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" file\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" `\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"di\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"agnostic\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\".txt\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"`\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" contains\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" exactly\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" this\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" text\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\":\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"\\n\\n\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"```\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"\\n\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"HER\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"MES\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"_SLOT\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"STREAM\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"_PRO\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"BE\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"_\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"4\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"2\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"\\n\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"```\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-end\"}\n\ndata: {\"finishReason\":{\"raw\":\"stop\",\"unified\":\"stop\"},\"type\":\"finish\",\"usage\":{\"inputTokens\":{\"cacheRead\":309,\"cacheWrite\":0,\"noCache\":27,\"total\":336},\"outputTokens\":{\"reasoning\":0,\"text\":26,\"total\":26}}}\n\ndata: [DONE]\n\n"
}
```

## api-robustness.log

```text
PASS  non-loopback browser origin is refused
PASS  loopback browser origin is allowed exactly
PASS  wrong model is rejected instead of silently relabeled
PASS  unsupported Ollama tools are rejected explicitly
PASS  unsupported OpenAI response_format is rejected explicitly
PASS  numeric stream is not mistaken for a JSON boolean
PASS  wrongly typed sampling options are rejected
PASS  numbers that overflow the sampler are rejected
PASS  unsupported message semantics are not silently dropped
PASS  OpenAI max_tokens 0 cannot become an unbounded generation
PASS  seed -1 (Ollama's random default) does not kill the server
PASS  num_predict -1 (until EOS) generates instead of trapping
PASS  client disconnecting mid-stream does not kill the server (SIGPIPE)
PASS  streamed deltas reassemble to the non-streamed text (10 cases)
PASS  out-of-range "top_p":0 falls back sanely (got 'OK')
PASS  out-of-range "top_p":-1 falls back sanely (got 'OK')
PASS  out-of-range "min_p":1.5 falls back sanely (got 'OK')
PASS  empty prompt is the load request: acknowledged, never answered from an uninitialized tensor
PASS  OpenAI array-form content is read, not dropped
PASS  stop sequence honored (got '1 2 3')
PASS  over-length prompt is refused with a 400, not a silent stall
PASS  /api/version (0.2.8) matches the binary
PASS  /api/tags size matches the pinned manifest
PASS  /api/show accepts the Ollama CLI request shape and advertises capabilities
PASS  /api/show accepts the deprecated name alias
PASS  /api/show refuses a non-empty system override instead of ignoring it
PASS  /api/show still rejects unknown fields
PASS  /api/chat accepts keep_alive and null options (the CLI's defaults)
PASS  /api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)
PASS  /api/generate refuses a non-empty suffix instead of ignoring it
PASS  /api/generate with an empty prompt is the Ollama load request, acknowledged
PASS  /api/chat with no messages is the Ollama load request, acknowledged
PASS  HEAD returns no body
PASS  malformed JSON returns 400
PASS  metadata endpoints answer during a generation, and the accept loop keeps accepting
PASS  /api/show accepts an empty model with the name in the alias (ollama show)
PASS  an untagged model name resolves to the only model
PASS  a semantic Ollama knob (num_ctx) is still refused, never silently dropped
PASS  /v1 treats "max_tokens":null as unset
PASS  /v1 treats "stop":null as unset
PASS  /v1 treats "temperature":null as unset
PASS  /v1 treats "seed":null as unset
PASS  /v1 treats "stream_options":null as unset
PASS  /v1 accepts the no-op default "n":1
PASS  /v1 accepts the no-op default "frequency_penalty":0
PASS  /v1 accepts the no-op default "user":"u1"
PASS  /v1 accepts the no-op default "logprobs":false
PASS  /v1 accepts the no-op default "logit_bias":{}
PASS  /v1 accepts the no-op default "tools":[]
PASS  /v1 accepts the no-op default "response_format":{"type":"text"}
PASS  /v1 still refuses the real feature "n":2
PASS  /v1 still refuses the real feature "frequency_penalty":0.5
PASS  /v1 still refuses the real feature "logprobs":true
PASS  /v1 still refuses the real feature "tools":[{"type":"function"}]
PASS  /v1 still refuses the real feature "response_format":{"type":"json_object"}
PASS  think:true splits reasoning into message.thinking and leaves the answer clean
16 content deltas for 16 tokens
PASS  a short reply arrives as per-token deltas, not one batched chunk
PASS  unseeded requests vary, as the API documents
PASS  an explicit seed still reproduces exactly
PASS  a query string does not 404 the route
PASS  HEAD on a real path is 200
PASS  HEAD on an unknown path is 404, not a blanket 200
PASS  a chunked body is refused with 411, not read as empty
PASS  an oversized body gets 413, not a bare connection reset
PASS  a malformed Content-Length gets 400
PASS  a file:// image is refused and says URLs are not fetched
PASS  an https:// image is refused on the OpenAI route too
PASS  a non-string images array is a 400, not a silently text-only answer
PASS  an image part with no url is a 400
PASS  bytes that are not an image are a 400 with the reason
PASS  raw generate refuses images instead of dropping them
PASS  /v1/models carries created
PASS  the first SSE delta announces the role
PASS  server still up after every probe

robustness: passed 74, failed 0
```

## Release runner completion

```text
PREFLIGHT context: reclaimable GB=30.660476928
START context-65520
END context-65520 exit=0
WAIT clients: another model/build is active
WAIT clients: another model/build is active
PREFLIGHT clients: reclaimable GB=29.829021696
START combined context/vision client server
START hermes-release
END hermes-release exit=0
START hermes-cli
END hermes-cli exit=0
START hermes-main
END hermes-main exit=0
START openai-tools
END openai-tools exit=0
START vision-serving
END vision-serving exit=0
START native-gateway
END native-gateway exit=0
START ollama-image
END ollama-image exit=0
Owned client server stopped: 85697
WAIT api-regression: another model/build is active
WAIT api-regression: another model/build is active
WAIT api-regression: another model/build is active
WAIT api-regression: another model/build is active
PREFLIGHT api-regression: reclaimable GB=37.206212608
START api-robustness
END api-robustness exit=0
RELEASE FUNCTIONAL SUITE PASS
Release runner cleanup complete
```
