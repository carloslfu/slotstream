---
type: run
id: 01m1stsm79bxhc09sqnfbv8ta3
created: 2026-09-05T22:25:00.648918+00:00
updated: 2026-09-05T22:25:00.912593+00:00
summary: Released and current Hermes complete real local tool loops, title fallback and bounded compaction; OpenAI and gateway gates pass
binary: Frozen candidate e7f6d24; exact identity in body
captured_at: 2026-09-05
command: Commands and method in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hermes OpenAI real-client gates
tool: Hermes AIAgent and CLI; OpenAI and gateway HTTP gates
---
# Hermes OpenAI integration: real clients and protocol loops

These checks used a frozen source-built Slotstream candidate with binary SHA-256 `e7f6d24c111c1c96e081a27b88bba67d5d077990ec368d2f4a39a69c46fb51e1`. The installed release was not replaced. The server used `--memory-gb 10 --max-context 65536 --vision off --mtp off`, first on loopback port 18134 and then the default port. One model process ran at a time.

Hermes main was commit `9dd6634c5635321cf38840cc30e9b51226689128`. The released checkout was tag `v2026.8.31`, commit `29112bef099274229cadff79cdff7bf7b99c4b77`; each used its own frozen dependency environment. The actual AIAgent and CLI ran with isolated homes, placeholder local credentials and a Python audit hook refusing non-loopback socket connections. Only `cat diagnostic.txt` was permitted through the actual Hermes tool dispatcher. The CLI's attempted startup GitHub connections were blocked; no hosted inference or external message was sent.

The model discovered 65,536 tokens and Hermes computed a 55,270-token compression trigger with a 512-token main response allowance. The real tool result and follow-up were exact. On the default port, the released client sent reasoning_effort none, think false, and options.num_ctx 65536; all main calls succeeded. The CLI returned OK and exited zero. Titles first received the explicit unsupported response_format rejection, then succeeded through Hermes's own plain-output retry.

The first forced compression check is retained as failed: a short synthetic history grew after the protected recent tail and structured handoff were retained. Its auxiliary call also omitted max_tokens, inheriting the server's ordinary 512-token default. This is not a controlled comparison between compression settings. The corrected test used a longer compressible middle, placed the diagnostic code only there, and gave auxiliary.compression.extra_body a 4096-token limit with temperature 0.2 and presence_penalty 0. That summary finished with stop after 723 output tokens, reduced the transcript, and retained the code only in the assistant handoff. A subsequent real agent turn recovered it. This is bounded compaction/recall evidence, not a general memory-quality score. The final recommended main response allowance is qualified separately.

The native gateway still completed its two-turn file-read loop. The OpenAI wire gate passed both response modes, call IDs and typed arguments, result histories, tool choices, reasoning, discovery, malformed history refusal, request context enforcement, and incomplete-call failure semantics. It did not execute tools. These are compatibility/correctness checks, not throughput measurements or larger-context memory-plan qualification.

## Actual client results (deterministic field selection from the raw result JSON)

```json
{
  "hermes-main": {
    "context_length": 65536,
    "compression_threshold": 55270,
    "ollama_num_ctx": 65536,
    "title": "Diagnose local Hermes and Slotstream integration",
    "passed": false,
    "error_type": "AssertionError",
    "error": "Compression did not reduce the transcript",
    "tool_turn": {
      "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
      "api_calls": 2,
      "completed": true,
      "failed": false,
      "cache_read_tokens": 3418,
      "prompt_tokens": 6854,
      "completion_tokens": 37,
      "last_prompt_tokens": 3463
    },
    "followup": {
      "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
      "api_calls": 1,
      "completed": true,
      "failed": false,
      "cache_read_tokens": 6891,
      "prompt_tokens": 10358,
      "completion_tokens": 47,
      "last_prompt_tokens": 3504
    },
    "executions": [
      {
        "name": "terminal",
        "args": {
          "command": "cat diagnostic.txt"
        },
        "result": "{\"output\": \"HERMES_SLOTSTREAM_INTEGRATION_42\", \"exit_code\": 0, \"error\": null}"
      }
    ],
    "blocked_nonlocal_connection_count": 0,
    "compression": {
      "before_messages": 27,
      "after_messages": 25,
      "before_chars": 67569,
      "after_chars": 71318,
      "http_requests": 1,
      "code_locations": [
        {
          "message_index": 3,
          "role": "user"
        },
        {
          "message_index": 4,
          "role": "assistant"
        },
        {
          "message_index": 5,
          "role": "user"
        },
        {
          "message_index": 6,
          "role": "assistant"
        },
        {
          "message_index": 7,
          "role": "user"
        },
        {
          "message_index": 8,
          "role": "assistant"
        },
        {
          "message_index": 9,
          "role": "user"
        },
        {
          "message_index": 10,
          "role": "assistant"
        },
        {
          "message_index": 11,
          "role": "user"
        },
        {
          "message_index": 12,
          "role": "assistant"
        },
        {
          "message_index": 13,
          "role": "user"
        },
        {
          "message_index": 14,
          "role": "assistant"
        },
        {
          "message_index": 15,
          "role": "user"
        },
        {
          "message_index": 16,
          "role": "assistant"
        },
        {
          "message_index": 17,
          "role": "user"
        },
        {
          "message_index": 18,
          "role": "assistant"
        },
        {
          "message_index": 19,
          "role": "user"
        },
        {
          "message_index": 20,
          "role": "assistant"
        },
        {
          "message_index": 21,
          "role": "user"
        },
        {
          "message_index": 22,
          "role": "assistant"
        },
        {
          "message_index": 23,
          "role": "user"
        },
        {
          "message_index": 24,
          "role": "assistant"
        }
      ]
    }
  },
  "hermes-main-budgeted": {
    "context_length": 65536,
    "compression_threshold": 55270,
    "ollama_num_ctx": 65536,
    "title": "Diagnose local Hermes and Slotstream integration",
    "passed": true,
    "tool_turn": {
      "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
      "api_calls": 2,
      "completed": true,
      "failed": false,
      "cache_read_tokens": 3422,
      "prompt_tokens": 6862,
      "completion_tokens": 37,
      "last_prompt_tokens": 3467
    },
    "followup": {
      "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
      "api_calls": 1,
      "completed": true,
      "failed": false,
      "cache_read_tokens": 6899,
      "prompt_tokens": 10370,
      "completion_tokens": 47,
      "last_prompt_tokens": 3508
    },
    "after_compression": {
      "final_response": "The exact diagnostic code is `HERMES_SLOTSTREAM_INTEGRATION_42`.",
      "api_calls": 1,
      "completed": true,
      "failed": false,
      "cache_read_tokens": 6899,
      "prompt_tokens": 28762,
      "completion_tokens": 64,
      "last_prompt_tokens": 18392
    },
    "executions": [
      {
        "name": "terminal",
        "args": {
          "command": "cat diagnostic.txt"
        },
        "result": "{\"output\": \"HERMES_SLOTSTREAM_INTEGRATION_42\", \"exit_code\": 0, \"error\": null}"
      }
    ],
    "blocked_nonlocal_connection_count": 0,
    "compression": {
      "before_messages": 39,
      "after_messages": 25,
      "before_chars": 99684,
      "after_chars": 86418,
      "http_requests": 1,
      "code_locations": [
        {
          "message_index": 4,
          "role": "assistant"
        }
      ]
    }
  },
  "hermes-release": {
    "context_length": 65536,
    "compression_threshold": 55270,
    "ollama_num_ctx": 65536,
    "title": "Diagnose local Hermes and Slotstream integration",
    "passed": true,
    "tool_turn": {
      "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
      "api_calls": 2,
      "completed": true,
      "failed": false,
      "cache_read_tokens": 3137,
      "prompt_tokens": 6292,
      "completion_tokens": 37,
      "last_prompt_tokens": 3182
    },
    "followup": {
      "final_response": "HERMES_SLOTSTREAM_INTEGRATION_42",
      "api_calls": 1,
      "completed": true,
      "failed": false,
      "cache_read_tokens": 6329,
      "prompt_tokens": 9515,
      "completion_tokens": 47,
      "last_prompt_tokens": 3223
    },
    "executions": [
      {
        "name": "terminal",
        "args": {
          "command": "cat diagnostic.txt"
        },
        "result": "{\"output\": \"HERMES_SLOTSTREAM_INTEGRATION_42\", \"exit_code\": 0, \"error\": null}"
      }
    ],
    "blocked_nonlocal_connection_count": 0
  },
  "hermes-release-cli": {
    "cli_exit": 0,
    "passed": true,
    "executions": [],
    "blocked_nonlocal_connection_count": 2
  }
}
```

## Exact OpenAI protocol gate output

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
PASS tool choice none remains text-only
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
{"passed": 21, "context": 65536, "model": "qwen3.8-flash-next:4bit"}
```

## Exact OpenAI requests and wire responses

```jsonl
{"case": "catalog", "path": "/v1/models", "request": null, "status": 200, "response": "{\"object\":\"list\",\"data\":[{\"max_output_tokens\":8192,\"created\":1788645906,\"object\":\"model\",\"context_window\":65536,\"context_length\":65536,\"owned_by\":\"slotstream\",\"id\":\"qwen3.8-flash-next:4bit\"}]}"}
{"case": "show", "path": "/api/show", "request": {"model": "qwen3.8-flash-next:4bit"}, "status": 200, "response": "{\"modelfile\":\"# slotstream: SSD-streamed qwen4_exp\",\"capabilities\":[\"completion\"],\"template\":\"{{ .Prompt }}\",\"details\":{\"prefix_cache\":{\"enabled\":true,\"charged_token_capacity\":7168,\"checkpoint_stores\":0,\"misses\":5,\"held_tokens\":4195,\"reusable_checkpoints\":0,\"held_gb\":0.65000000000000002,\"checkpoint_fork_failures\":0,\"held_images\":0,\"evictions\":1,\"allocated_sequence_bytes\":198180864,\"hits\":3,\"checkpoint_hits\":0,\"max_tokens\":10105,\"conversations\":4,\"max_conversations\":4},\"family\":\"qwen4_exp\",\"quantization_level\":\"4bit\",\"memory_plan\":{\"pool_gb\":1.8,\"vision_resident_reserved\":false,\"est_prefill_tok_s\":125,\"device_ram_gb\":51.5,\"est_prefill_s_at_max_context\":530.07058823529439,\"expected_peak_gb\":9.3000000000000007,\"max_ram_percent\":70,\"est_warm_tok_s\":2.666666666666667,\"prefix_cache_max_tokens\":10105,\"mtp\":false,\"pool_slots\":640,\"vision\":false,\"target_gb\":10,\"fully_resident\":false,\"source\":\"--memory-gb\",\"vision_charged_gb\":0,\"device_available_gb\":31,\"device_working_set_gb\":40.200000000000003,\"prefill_chunk\":512,\"max_context_tokens\":65536,\"experts_per_layer_cached\":13,\"vision_resident_gb\":0,\"availability_clamped\":false},\"expert_cache_per_layer\":13,\"experts_per_layer\":512,\"format\":\"safetensors\",\"parameter_size\":\"176B-A6B\"},\"parameters\":\"num_ctx 65536\",\"model_info\":{\"general.parameter_count\":176000000000,\"general.architecture\":\"qwen4_exp\",\"qwen4_exp.context_length\":65536}}"}
{"case": "nonstream-call", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "stream": false, "tool_choice": {"type": "function", "function": {"name": "read_file"}}}, "status": 200, "response": "{\"id\":\"chatcmpl-93DBA2DB-A978-4F06-8732-F73A5D67EBE9\",\"usage\":{\"prompt_tokens\":292,\"completion_tokens\":38,\"total_tokens\":330,\"prompt_tokens_details\":{\"cached_tokens\":0}},\"object\":\"chat.completion\",\"created\":1788646068,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":\"tool_calls\",\"message\":{\"role\":\"assistant\",\"tool_calls\":[{\"function\":{\"name\":\"read_file\",\"arguments\":\"{\\\"path\\\":\\\"diagnostic.txt\\\",\\\"start_line\\\":1}\"},\"id\":\"call_18608038634741DC802DD13E142FCFEC\",\"type\":\"function\"}],\"content\":null}}]}"}
{"case": "nonstream-result", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}, {"role": "assistant", "tool_calls": [{"function": {"name": "read_file", "arguments": "{\"path\":\"diagnostic.txt\",\"start_line\":1}"}, "id": "call_18608038634741DC802DD13E142FCFEC", "type": "function"}], "content": null}, {"role": "tool", "tool_call_id": "call_18608038634741DC802DD13E142FCFEC", "content": "OPENAI_TOOL_FIXTURE_42"}, {"role": "user", "content": "Reply with only the exact file contents. Do not call a tool."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 48, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "stream": false}, "status": 200, "response": "{\"id\":\"chatcmpl-7207D4E0-48A0-4A80-99CB-4787CBFB2600\",\"choices\":[{\"finish_reason\":\"stop\",\"index\":0,\"message\":{\"role\":\"assistant\",\"content\":\"OPENAI_TOOL_FIXTURE_42\"}}],\"usage\":{\"prompt_tokens\":365,\"total_tokens\":373,\"completion_tokens\":8,\"prompt_tokens_details\":{\"cached_tokens\":0}},\"created\":1788646079,\"model\":\"qwen3.8-flash-next:4bit\",\"object\":\"chat.completion\"}"}
{"case": "stream-call", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "stream": true, "tool_choice": {"type": "function", "function": {"name": "read_file"}}, "stream_options": {"include_usage": true}}, "status": 200, "response": ": keepalive\n\ndata: {\"id\":\"chatcmpl-3B0E5E14-42F0-483B-A09E-957DD64642C7\",\"object\":\"chat.completion.chunk\",\"created\":1788646085,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"tool_calls\":[{\"id\":\"call_D0CD19FA12B1441B930F534AD255D4AC\",\"function\":{\"name\":\"read_file\",\"arguments\":\"{\\\"path\\\":\\\"diagnostic.txt\\\",\\\"start_line\\\":1}\"},\"type\":\"function\",\"index\":0}],\"role\":\"assistant\"}}]}\n\ndata: {\"id\":\"chatcmpl-3B0E5E14-42F0-483B-A09E-957DD64642C7\",\"usage\":{\"prompt_tokens\":292,\"completion_tokens\":38,\"total_tokens\":330,\"prompt_tokens_details\":{\"cached_tokens\":0}},\"object\":\"chat.completion.chunk\",\"created\":1788646085,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":\"tool_calls\",\"delta\":{},\"index\":0}]}\n\ndata: [DONE]\n\n"}
{"case": "stream-result", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}, {"role": "assistant", "content": "", "tool_calls": [{"id": "call_D0CD19FA12B1441B930F534AD255D4AC", "type": "function", "function": {"name": "read_file", "arguments": "{\"path\":\"diagnostic.txt\",\"start_line\":1}"}}]}, {"role": "tool", "tool_call_id": "call_D0CD19FA12B1441B930F534AD255D4AC", "content": "OPENAI_TOOL_FIXTURE_42"}, {"role": "user", "content": "Reply with only the exact file contents. Do not call a tool."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 48, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "stream": true}, "status": 200, "response": "data: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"role\":\"assistant\",\"content\":\"OPEN\"}}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"AI\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"_TOOL\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"_FIX\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"TURE\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"_\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"4\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"object\":\"chat.completion.chunk\",\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"2\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"id\":\"chatcmpl-27F530B6-8024-41EE-921C-43C88C5E0E9E\",\"choices\":[{\"delta\":{},\"finish_reason\":\"stop\",\"index\":0}],\"created\":1788646095,\"model\":\"qwen3.8-flash-next:4bit\",\"object\":\"chat.completion.chunk\"}\n\ndata: [DONE]\n\n"}
{"case": "single-call", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "parallel_tool_calls": false, "tool_choice": "required"}, "status": 200, "response": "{\"id\":\"chatcmpl-289A5785-F651-4AFE-A098-FEAF6A3E771C\",\"usage\":{\"prompt_tokens\":303,\"completion_tokens\":38,\"total_tokens\":341,\"prompt_tokens_details\":{\"cached_tokens\":0}},\"object\":\"chat.completion\",\"created\":1788646101,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":\"tool_calls\",\"message\":{\"tool_calls\":[{\"function\":{\"name\":\"read_file\",\"arguments\":\"{\\\"path\\\":\\\"diagnostic.txt\\\",\\\"start_line\\\":1}\"},\"id\":\"call_73FCA33ACC1E48199EAE167FBFF2231A\",\"type\":\"function\"}],\"role\":\"assistant\",\"content\":null}}]}"}
{"case": "disabled-tools", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Reply with only OK."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 32, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "tool_choice": "none"}, "status": 200, "response": "{\"id\":\"chatcmpl-A519E164-2AEA-4287-9A97-AB180EA933E7\",\"choices\":[{\"index\":0,\"finish_reason\":\"stop\",\"message\":{\"role\":\"assistant\",\"content\":\"OK\"}}],\"usage\":{\"prompt_tokens\":17,\"total_tokens\":18,\"completion_tokens\":1,\"prompt_tokens_details\":{\"cached_tokens\":0}},\"created\":1788646112,\"model\":\"qwen3.8-flash-next:4bit\",\"object\":\"chat.completion\"}"}
{"case": "reasoning-stream", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "stream": true, "reasoning_effort": "low", "messages": [{"role": "user", "content": "What is 2+2? Answer briefly."}], "max_tokens": 384, "temperature": 0}, "status": 200, "response": "data: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"role\":\"assistant\",\"reasoning_content\":\"T\"}}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"he us\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"er\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\" asks a\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\" simple ari\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"thmetic q\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"u\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"esti\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"on. The\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\" an\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"swer is straight\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"delta\":{\"reasoning_content\":\"f\"},\"finish_reason\":null}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"reasoning_content\":\"o\"}}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"reasoning_content\":\"rward.\\n\"}}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"index\":0,\"finish_reason\":null,\"delta\":{\"content\":\"\\n\\n\"}}]}\n\ndata: {\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"object\":\"chat.completion.chunk\",\"created\":1788646113,\"model\":\"qwen3.8-flash-next:4bit\",\"choices\":[{\"delta\":{\"content\":\"4\"},\"finish_reason\":null,\"index\":0}]}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"id\":\"chatcmpl-226CE3AB-FF25-465A-88B6-F1B41CA4C283\",\"created\":1788646113,\"choices\":[{\"index\":0,\"finish_reason\":\"stop\",\"delta\":{}}],\"object\":\"chat.completion.chunk\"}\n\ndata: [DONE]\n\n"}
{"case": "orphan-result", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "tool", "tool_call_id": "orphan", "content": "bad"}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}}, "status": 400, "response": "{\"error\":{\"type\":\"invalid_request_error\",\"message\":\"tool result must reference an outstanding tool_call_id exactly once\"}}"}
{"case": "missing-result", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}, {"tool_calls": [{"function": {"name": "read_file", "arguments": "{\"path\":\"diagnostic.txt\",\"start_line\":1}"}, "id": "call_73FCA33ACC1E48199EAE167FBFF2231A", "type": "function"}], "role": "assistant", "content": null}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}}, "status": 400, "response": "{\"error\":{\"type\":\"invalid_request_error\",\"message\":\"messages are missing tool results\"}}"}
{"case": "context-inflation", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65537}}, "status": 400, "response": "{\"error\":{\"type\":\"invalid_request_error\",\"message\":\"options.num_ctx must be between 1 and the served context limit 65536\"}}"}
{"case": "reasoning-conflict", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": true, "options": {"num_ctx": 65536}}, "status": 400, "response": "{\"error\":{\"type\":\"invalid_request_error\",\"message\":\"think conflicts with reasoning_effort\"}}"}
{"case": "unknown-function", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "tool_choice": {"type": "function", "function": {"name": "absent"}}}, "status": 400, "response": "{\"error\":{\"type\":\"invalid_request_error\",\"message\":\"tool_choice must be auto, none, required, or a declared function\"}}"}
{"case": "structured-output", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "response_format": {"type": "json_schema", "json_schema": {"name": "title", "schema": {"type": "object"}}}}, "status": 400, "response": "{\"error\":{\"type\":\"invalid_request_error\",\"message\":\"response_format is not supported for constrained output; only {\\\"type\\\": \\\"text\\\"} is supported\"}}"}
{"case": "truncated-tool", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 1, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "tool_choice": "required"}, "status": 500, "response": "{\"error\":{\"type\":\"server_error\",\"message\":\"model produced an incomplete or malformed tool call\"}}"}
{"case": "truncated-tool-stream", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 1, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 65536}, "tool_choice": "required", "stream": true}, "status": 200, "response": "data: {\"error\":{\"type\":\"server_error\",\"code\":\"inference_error\",\"message\":\"model produced an incomplete or malformed tool call\"}}\n\n"}
{"case": "smaller-request-context", "path": "/v1/chat/completions", "request": {"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "Call read_file for diagnostic.txt with start_line 1. Wait for its result."}], "tools": [{"type": "function", "function": {"name": "read_file", "description": "Read a named diagnostic file.", "strict": false, "parameters": {"type": "object", "properties": {"path": {"type": "string"}, "start_line": {"type": "integer", "default": null}}, "required": ["path"]}}}], "max_tokens": 192, "temperature": 0, "seed": 42, "reasoning_effort": "none", "think": false, "options": {"num_ctx": 1}}, "status": 400, "response": "{\"error\":{\"type\":\"invalid_request_error\",\"message\":\"prompt is 282 tokens, leaving no reply room in the requested context limit 1\"}}"}
{"case": "survives-errors", "path": "/api/version", "request": null, "status": 200, "response": "{\"version\":\"0.2.7\"}"}
```

## Exact native gateway output

```text
gateway-tool-turn1 200 8.679
[{"input": "{\"path\":\"diagnostic.txt\"}", "toolCallId": "call_0968b0c4", "toolName": "read_file", "type": "tool-call"}, {"finishReason": {"raw": "tool_calls", "unified": "tool-calls"}, "type": "finish", "usage": {"inputTokens": {"cacheRead": 0, "cacheWrite": 0, "noCache": 283, "total": 283}, "outputTokens": {"reasoning": 0, "text": 26, "total": 26}}}]
gateway-tool-turn2 200 5.398
[{"finishReason": {"raw": "stop", "unified": "stop"}, "type": "finish", "usage": {"inputTokens": {"cacheRead": 309, "cacheWrite": 0, "noCache": 27, "total": 336}, "outputTokens": {"reasoning": 0, "text": 24, "total": 24}}}]
ANSWER The file `diagnostic.txt` contains exactly:

```
HERMES_SLOTSTREAM_PROBE_42
```
```

## Frozen build identity

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
    "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "49a2752db501362aa7467a4352c0308bc714da2071976d6b678abe831454ba7c",
    "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
    "Sources/Slotstream/MTP.swift": "82ad69cd4d384f6c6cd5dc56533e322a4855a739ab17d3311597cc0e6f6a74df",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "92beba95294f167c919f5599410a423e16cf3ddc3a6e1cb5d83cab9cee0c0e5a",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "9f638b8d1135b98baeded4a9454238555dc9f17b593f38ba72f6c9b0d24b3f2c",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ef6a628d1ec682fd4d63060d8b2bb49c63db63e872e927649f20bf17389ac35c",
    "Sources/Slotstream/PrefixCache.swift": "5a0dc112dad5d90cb8a648ce2333d0476d8299eb7405b41caf4c647891a8d56b",
    "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "a74754f7105561b24cd148b17f978a08398f754c9a344befd65e31cc905f1405",
    "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
    "Sources/Slotstream/StatePrefixFork.swift": "3e7cdead33d4501b6c949b62f032ac96d1854ce39fc56384f0ca4f7941b33bb1",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "3849854a9d894ae2ba133ed8dcf19ba8d2679adc0a4c97bf107f6f3f5c83dd01",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "3c9597f3661113dc10f274f3d59bca199dfbaa0d262741e31eb079dd225568c1",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "877b40d7faf380be4d7a04a63a3cc78bcea3df1a650fa1ded11a532bdf2c941b",
    "Sources/SlotstreamTestKit/T0Checks.swift": "bfd462ebd02ea4258037ec568e6ba16362a8cd3970e4a3f9555b78d909093fc0",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "287688eb13163a594c5b72fe293fe1ac490f3dca09ee0e7731194c02cbf8de99",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "d5de0a000454b42a2ebd52910348ce6dba0e1b0186bbf3a6de420b5d5cc5ee13",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
    "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "32b5a310c1fac9dec24cdb7ccbb4d1bbf3e3b7b81ade0f15da41c6753aedfa3d",
  "binary_sha256": "e7f6d24c111c1c96e081a27b88bba67d5d077990ec368d2f4a39a69c46fb51e1",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```
