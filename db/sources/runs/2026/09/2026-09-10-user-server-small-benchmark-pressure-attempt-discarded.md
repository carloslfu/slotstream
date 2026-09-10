---
type: run
id: 01m26h18e6b1079czeyxh5gcwr
created: 2026-09-10T20:44:32.582410+00:00
updated: 2026-09-10T20:44:33.181940+00:00
summary: Discarded small-benchmark request canceled on memory pressure
binary: /Users/carlos/.slotstream/releases/c51435cb3c2a3a107f496cf89ca978f774bef4666fda3d9024ca7005254774e4-macos26/slotstream
captured_at: 2026-09-10
command: 'user-server-small-2026-09-10/run.py: long_summary-repeat; no-inference bounded readiness aftermath'
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Discarded small-benchmark request canceled on memory pressure
tool: Slotstream exact native and source qualification capture
---
The first long-summary exact-repeat attempt is incomplete and discarded from timing comparisons. The request starts with normal pressure and is canceled after a warning-pressure observation, before any successful terminal frame. The subsequent optional bounded quiet-memory wait starts no inference. The original aggregate session source remains byte-for-byte unchanged; this separate discarded source makes the per-attempt classification explicit. No speed or capacity claim follows from its partial observations.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/failure.json",
    "bytes": 133,
    "sha256": "fb64a313fc1539f094ffb8a7c6069dd088c092eff30660ab82d9361b9807fe09"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/long_summary-repeat/after.json",
    "bytes": 324,
    "sha256": "c607e8f16ef4f66f64fd3e1139cbd929fb2413f1efba9a46fcd3f2bc2e177b54"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/long_summary-repeat/before.json",
    "bytes": 323,
    "sha256": "69af8e9b255aff7fb4be85fd2199268d994fe190efb0a8193dbde2c5490c4dd6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/long_summary-repeat/frames.ndjson",
    "bytes": 194,
    "sha256": "78f76976a77ec469139f9ed55c8c6add9683d5ac85f107a06487c8a446ad5975"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/long_summary-repeat/request.json",
    "bytes": 2634,
    "sha256": "80f7908687c52d30c51c1d2c527fb59ad31b9c9d6bd70ab59c9da66e059523d2"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/long_summary-repeat/samples.json",
    "bytes": 1444,
    "sha256": "b263e9dca6a1bdd41dbaa438ac633b116ce1ae93f0a93fa48d6d9e4cdba68eee"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/long_summary-repeat/server-before.json",
    "bytes": 2577,
    "sha256": "7030e3ed877a4ce6171cf4db949eca1bd58c40939279d52cdce318b952664c11"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/benchmarks/user-server-small-2026-09-10/resumed/readiness-stop.json",
    "bytes": 365,
    "sha256": "39bb35fa7dc4ac257486bf39fe8714ed567492ea5ac7c889b8e8c9e2a9b37aaf"
  }
]
```

## Artifact SHA-256 fb64a313fc1539f094ffb8a7c6069dd088c092eff30660ab82d9361b9807fe09

Encoding: `utf-8`. Original bytes: 133.

````````````text
{
  "error": "long_summary-repeat: RuntimeError: memory pressure changed",
  "completed_requests": 7,
  "server_not_stopped": true
}

````````````

## Artifact SHA-256 c607e8f16ef4f66f64fd3e1139cbd929fb2413f1efba9a46fcd3f2bc2e177b54

Encoding: `utf-8`. Original bytes: 324.

````````````text
{
  "memory": {
    "page_bytes": 16384,
    "reclaimable_bytes": 9273147392,
    "swapins": 44363690,
    "swapouts": 77895019
  },
  "pressure": "warning",
  "conditions": {
    "thermalState": "nominal",
    "lowPowerModeEnabled": false
  },
  "load_average": [
    5.34521484375,
    3.857421875,
    2.8330078125
  ]
}

````````````

## Artifact SHA-256 69af8e9b255aff7fb4be85fd2199268d994fe190efb0a8193dbde2c5490c4dd6

Encoding: `utf-8`. Original bytes: 323.

````````````text
{
  "memory": {
    "page_bytes": 16384,
    "reclaimable_bytes": 8800468992,
    "swapins": 44363690,
    "swapouts": 77895019
  },
  "pressure": "normal",
  "conditions": {
    "thermalState": "nominal",
    "lowPowerModeEnabled": false
  },
  "load_average": [
    5.34521484375,
    3.857421875,
    2.8330078125
  ]
}

````````````

## Artifact SHA-256 78f76976a77ec469139f9ed55c8c6add9683d5ac85f107a06487c8a446ad5975

Encoding: `utf-8`. Original bytes: 194.

````````````text
{"seconds": 4.169772999999999, "wire": "{\"done\":false,\"message\":{\"content\":\"*\",\"role\":\"assistant\"},\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-10T20:22:03Z\"}\n"}

````````````

## Artifact SHA-256 80f7908687c52d30c51c1d2c527fb59ad31b9c9d6bd70ab59c9da66e059523d2

Encoding: `utf-8`. Original bytes: 2634.

````````````text
{
  "model": "qwen3.8-flash-next:4bit",
  "messages": [
    {
      "role": "user",
      "content": "Summarize this fictional product incident report in three concise bullets: the cause, the customer impact, and the next steps. Use at most 75 words.\n\nThe team runs an offline note-taking application for students. A recent update introduced a faster search index and a new import screen. The application stores original notes separately from its search index. The index can be regenerated, but users should not have to understand that implementation detail. The release was tested on small accounts and clean installations. It was not tested on an existing library with several thousand notes and a partially completed import.\n\nOn Monday morning, several users reported that newly imported notes could be opened from their notebooks but could not be found through search. Others said that search briefly showed duplicate titles. The notes themselves were intact. The engineering team reproduced the problem using a library with 8,000 notes and an import that was interrupted when the laptop went to sleep. On waking, two index workers resumed the same import batch. One worker committed the current batch while the other overwrote its progress marker with an older value.\n\nCustomer support received 24 reports. Six customers repeated their imports because they believed their notes were missing, producing duplicate notes that then required cleanup. No original content was lost or sent to a remote service. The support team initially advised users to reinstall, but that advice did not consistently help because the original library and stale progress marker were preserved. Support later published a temporary recovery procedure that rebuilt only the search index and left original notes untouched.\n\nThe team paused the rollout. The proposed fix allows only one index writer per library, commits data and progress together, and resumes imports from a verified checkpoint. Tests will cover sleep and wake, cancellation, process restart, duplicate import attempts, large libraries, and failed disk writes. The update will first go to a small group of affected users. The release owner will compare note counts and search results before expanding the rollout. A separate cleanup tool will preview duplicate candidates and require users to confirm deletion. The team will also revise the import screen to distinguish saved notes from indexing progress and explain when search is still catching up."
    }
  ],
  "stream": true,
  "think": false,
  "options": {
    "temperature": 0,
    "seed": 7,
    "num_predict": 128
  }
}

````````````

## Artifact SHA-256 b263e9dca6a1bdd41dbaa438ac633b116ce1ae93f0a93fa48d6d9e4cdba68eee

Encoding: `utf-8`. Original bytes: 1444.

````````````text
[
  {
    "memory": {
      "page_bytes": 16384,
      "reclaimable_bytes": 8660877312,
      "swapins": 44363690,
      "swapouts": 77895019
    },
    "pressure": "normal",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "load_average": [
      5.34521484375,
      3.857421875,
      2.8330078125
    ]
  },
  {
    "memory": {
      "page_bytes": 16384,
      "reclaimable_bytes": 8776384512,
      "swapins": 44363690,
      "swapouts": 77895019
    },
    "pressure": "normal",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "load_average": [
      5.34521484375,
      3.857421875,
      2.8330078125
    ]
  },
  {
    "memory": {
      "page_bytes": 16384,
      "reclaimable_bytes": 8913551360,
      "swapins": 44363690,
      "swapouts": 77895019
    },
    "pressure": "normal",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "load_average": [
      5.34521484375,
      3.857421875,
      2.8330078125
    ]
  },
  {
    "memory": {
      "page_bytes": 16384,
      "reclaimable_bytes": 9194668032,
      "swapins": 44363690,
      "swapouts": 77895019
    },
    "pressure": "warning",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "load_average": [
      5.34521484375,
      3.857421875,
      2.8330078125
    ]
  }
]

````````````

## Artifact SHA-256 7030e3ed877a4ce6171cf4db949eca1bd58c40939279d52cdce318b952664c11

Encoding: `utf-8`. Original bytes: 2577.

````````````text
{
  "models": [
    {
      "digest": "slotstream-qwen38-flash-next-4bit",
      "name": "qwen3.8-flash-next:4bit",
      "model": "qwen3.8-flash-next:4bit",
      "modified_at": "2026-09-10T20:21:59Z",
      "size": 105264463248,
      "details": {
        "experts_per_layer": 512,
        "family": "qwen4_exp",
        "expert_cache_per_layer": 121,
        "memory_plan": {
          "vision_charged_gb": 0,
          "pool_gb": 16.1,
          "mtp": true,
          "max_context_tokens": 32768,
          "source": "auto",
          "vision_resident_reserved": false,
          "vision_resident_gb": 0.9,
          "experts_per_layer_cached": 121,
          "device_ram_gb": 51.5,
          "est_prefill_tok_s": 205,
          "est_warm_tok_s": 10.629533185779435,
          "max_prefill_wait_minutes": 30,
          "vision": true,
          "est_prefill_s_at_max_context": 183.62673762010354,
          "device_working_set_gb": 40.2,
          "memory_ledger": {
            "vision_resident_bytes": 0,
            "long_context_reserve_bytes": 0,
            "expected_peak_bytes": 26890949888,
            "fixed_bytes": 5300000000,
            "active_capacity_bytes": 981467136,
            "planning_margin_bytes": 1000000000,
            "prefill_bytes": 2662400000,
            "retained_capacity_bytes": 905969664,
            "retained_recurrent_bytes": 339738624,
            "additional_active_bytes": 0,
            "version": 1,
            "mtp_resident_bytes": 1600000000,
            "pool_bytes": 16082841600
          },
          "max_ram_percent": 70,
          "prefill_chunk": 2048,
          "runtime_prefix_cache_enabled": true,
          "vision_context_limit": 65536,
          "device_available_gb": 30.5,
          "mtp_context_limit": 65536,
          "notes": [
            "only 30.5 GB of 52 GB RAM is reclaimable right now (other apps hold the rest) \u2014 sized down from the usual 34.6 GB; close apps and restart for full speed, or force a size with --memory-gb"
          ],
          "availability_clamped": true,
          "model_context_limit": 262144,
          "pool_slots": 5817,
          "context_qualification": false,
          "prefill_wait_scope": "accepted_request_to_first_model_token",
          "fully_resident": false,
          "implementation_context_limit": 65536,
          "expected_peak_gb": 26.9,
          "prefix_cache_max_tokens": 32768,
          "target_gb": 27.9
        },
        "format": "safetensors",
        "quantization_level": "4bit",
        "parameter_size": "176B-A6B"
      }
    }
  ]
}

````````````

## Artifact SHA-256 39bb35fa7dc4ac257486bf39fe8714ed567492ea5ac7c889b8e8c9e2a9b37aaf

Encoding: `utf-8`. Original bytes: 365.

````````````text
{
  "inference_requests_started": 0,
  "reason": "Optional 15-second zero-paging interval was not reached within its 60-second bound. This attempt sent no inference request. Continue prospectively under original request safety guards; swap-contaminated timing is flagged and excluded from clean comparisons.",
  "recorded_utc": "2026-09-10T20:25:55.056381+00:00"
}

````````````
