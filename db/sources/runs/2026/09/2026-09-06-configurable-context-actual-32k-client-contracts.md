---
type: run
id: 01m1w4zz87eknad2hhxb515pg4
created: 2026-09-06T20:01:43.174975+00:00
updated: 2026-09-06T20:01:43.420551+00:00
summary: Actual Ollama and AI SDK clients pass at32K; Hermes enforces its64K minimum
binary: 85638bad9c7b1f8e40921e7ac4ac61ac6b2618442521ef35611db40bafef760a
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Actual Ollama and AI SDK clients pass at32K; Hermes enforces its64K minimum
tool: Native Swift diagnostics and Python CLI gates
---
# Actual ordinary-window clients

The installed Ollama CLI completes the exact OK greeting against the identified
32768-token server. Published, unmodified @ai-sdk/gateway4.0.75 and ai7.0.93
also complete the exact greeting and a full SDK-managed tool round trip: one
allowlisted read of diagnostic.txt, then the exact marker as final output.
The catalog reports the served32768 window and a valid smaller output budget.
There is no hosted provider, real credential, or non-loopback network request.
The SDK helper supplies the real published gateway adapter, not a hand-written
replacement wire parser. This is successful-client delivery evidence, not a
claim about receiving-side authority gates for arbitrary tools.

The separately installed Hermes release at commit29112bef099274229cadff79cdff7bf7b99c4b77
refuses initialization because its actual minimum is64000tokens. It performs
discovery and zero inference requests. That is the expected upstream boundary
and confirms the reason for the separately documented65536-token Hermes
configuration; it is not a server regression or successful32K Hermes support.
The batch stops and drains this one10GB/off/off server before continuing.

Commands: ollama run qwen3.8-flash-next:4bit 'Reply with exactly OK.'
--nowordwrap --think=false; node Tools/gateway_client_gate.mjs <sdk-root>
<output>11618 32768; pinned-Hermes-python Tools/hermes_integration_gate.py
<clean-git-archive> <output> --port11618 --context32768. The server uses
--memory-gb10 --mtp off --vision off --max-context32768 --max-prefill-wait0
--no-elastic. Argument whitespace is shown descriptively; raw command arrays
and exact logs remain in the captured local manifest.

The public evidence is a clearly labeled, whitelisted projection of the
captured results with exact raw hashes; private absolute scratch paths in
stack traces are omitted. The build18 source archive remains exact. This
bounded batch overlaps a coordinated download; timing/capacity are excluded.

## Frozen build identity

```json
{
  "binary_sha256": "85638bad9c7b1f8e40921e7ac4ac61ac6b2618442521ef35611db40bafef760a",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "cfad0737b11adb19cf2c3b33d428dbce7c83de67207ef89451737132c4f61ff1"
}
```

## clients-18-32k-public.json

SHA-256 `36d3250562813fc8f8a77a645797759fd8ba139db6e8bdaa7619654b3ce27582`; 3546 bytes.

````text
{
  "candidate": "build18",
  "classification": "actual clients, bounded compatibility only",
  "ollama": {
    "version": "0.32.15",
    "context": 32768,
    "passed": true,
    "output": "OK\n\n"
  },
  "gateway": {
    "dependencies": {
      "@ai-sdk/gateway": "4.0.75",
      "ai": "7.0.93"
    },
    "context": 32768,
    "passed": true,
    "catalog": {
      "tags": [
        "tool-use"
      ],
      "max_tokens": 8192,
      "reasoning_options": [
        {
          "values": [
            "none",
            "low",
            "medium",
            "xhigh"
          ],
          "type": "effort"
        }
      ],
      "context_window": 32768,
      "id": "slotstream/qwen3.8-flash-next:4bit",
      "type": "language",
      "released": 1
    },
    "greeting": "OK",
    "tool_final": "GATEWAY_SLOTSTREAM_INTEGRATION_42",
    "executions": [
      {
        "path": "diagnostic.txt",
        "contents": "GATEWAY_SLOTSTREAM_INTEGRATION_42\n"
      }
    ]
  },
  "hermes": {
    "revision": "29112bef099274229cadff79cdff7bf7b99c4b77",
    "context": 32768,
    "init_completed": false,
    "error_type": "ValueError",
    "error": "Model qwen3.8-flash-next:4bit has a context window of 32,768 tokens, which is below the minimum 64,000 required by Hermes Agent.  Choose a model with at least 64K context.  If your server reports a window smaller than the model's true window, set model.context_length in config.yaml to the real value (this must be at least 64K).",
    "classification": "expected upstream minimum-context refusal; no inference request"
  },
  "raw_sources": {
    "clients-18/32768/hermes/stdout.txt": {
      "sha256": "b44c830d6c4e0cec52aff4ea0e42b76f56d155064d20719a6d7fe42528619060",
      "bytes": 2484
    },
    "clients-18/32768/hermes/stderr.txt": {
      "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "bytes": 0
    },
    "clients-18/32768/hermes/report/result.json": {
      "sha256": "c89b0fc79d2ee6ecae9a3d87791d6f7fc11dd726d9e039a1c088f0182d323996",
      "bytes": 1499
    },
    "clients-18/32768/hermes/report/http.json": {
      "sha256": "df3a59faa0d65a3a39ac6c8f9474fe64ce55e22dfea87be3baed3d7fc5ba433a",
      "bytes": 2084
    },
    "clients-18/32768/ollama/stdout.txt": {
      "sha256": "586cba78dd0cf4b8ef8f078201b85f4a875bc1c419df0a01001810db2f68c841",
      "bytes": 4
    },
    "clients-18/32768/ollama/stderr.txt": {
      "sha256": "d8321bbf48228e436972fffe4eef75f66048afdd6772cad4d3c6cfc35dfe9258",
      "bytes": 1366
    },
    "clients-18/32768/gateway-sdk/stdout.txt": {
      "sha256": "2892efe0552406baff7a5b752ce642fc9d33d2dfc6af27d53d3c50c01798aed0",
      "bytes": 69
    },
    "clients-18/32768/gateway-sdk/stderr.txt": {
      "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "bytes": 0
    },
    "clients-18/32768/gateway-sdk/report/result.json": {
      "sha256": "520082d2c3c4ba8ea572408f8b4a8e4efb3bcb322629c1d65c921b385fa44ace",
      "bytes": 9546
    },
    "clients-18/32768/gateway-sdk/report/http.json": {
      "sha256": "3cf04803e303037677efcfc29156014998d43e9c33a0d0088d79a86a4233b0be",
      "bytes": 7424
    }
  },
  "public_projection": "whitelisted protocol/result fields; private absolute paths in raw stack traces and scratch fixture paths omitted; exact raw digests retained",
  "client_gate_sha256": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
  "dependency_lock_sha256": "4638e9f00a9500bfdc32271ad8483094c032dd1da593ac57cfa0d205dea78a9f"
}

````
