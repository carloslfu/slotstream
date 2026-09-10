---
type: run
id: 01m25k8kaa0hxqyb2x5tt5acyg
created: 2026-09-10T12:04:15.818282+00:00
updated: 2026-09-10T12:04:16.193612+00:00
summary: Exact final MTP startup method excludes contaminated pairs and preserves resource stops
binary: 9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673
captured_at: 2026-09-10
command: Model-free qualification and freeze of final-mtp-long-startup-v616, MTP on only
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Exact final MTP startup method excludes contaminated pairs and preserves resource stops
tool: Slotstream exact native and source qualification capture
---
This prospective method addresses the preserved V609 stop on eight global startup swap-in pages with ample physical headroom and no swap-outs. Only the exact original frozen 12 GB MTP-on protocol receives the amendment. Startup swap-ins keep startup_and_warmup_valid false and exclude the complete A/B pair under the unchanged original joint assessor; they no longer abort the whole fixed cohort. New swap-outs, missing/invalid/reset VM counters, memory pressure, footprint limits, output/parity failures and cleanup requirements retain stops. Startup admission remains 18 GB. Every first/measured response still requires 512 outputs, every original pair must run, contaminated pairs receive no replacements, and the original minimum-pair and request-nonregression thresholds remain. No partial V609 observation is reused. All 55 model-free checks pass, including a complete synthetic cohort proving whole-pair exclusion and an output mismatch in that excluded pair still failing qualification. The initial new pressure test expected the wrong exception type; its source and failing output are preserved, and only the test expectation was corrected to the original RuntimeError. The original physical guard code is unchanged. This freeze is prospective, not a completed MTP-on measurement, activation or program completion.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/delivery-checks.stderr",
    "bytes": 575,
    "sha256": "139273d5117211817f9dbd169fce0a54654345ec0cb04b4066d6f407db041ec8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/delivery-checks.stdout",
    "bytes": 139,
    "sha256": "54bebbd978590c6310e9141a80b5553f23fb594609a8242d6379f89f479aabe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/delivery-profile.json",
    "bytes": 12272,
    "sha256": "e3e51ccf0c639ea27543db5f470dd222d67f28b7a910f955e2a4b75a14d35e25"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/delivery_checks.py",
    "bytes": 5797,
    "sha256": "83f482c842b2ddede7a58aabbf587189724bffb84945b810176b96ed4e09cecb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/driver/serve_bench.py",
    "bytes": 62137,
    "sha256": "e490e49bcd784f293b4e58222e416f6a233e76ba1c15f5fdde717a984116c00c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/driver-transformation.json",
    "bytes": 4019,
    "sha256": "5f30ef9bd5457ca8b4d6508d083e1301eb323fe89ad7724803e3dac902fd4403"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/final-checks.stderr",
    "bytes": 388,
    "sha256": "87b5012ba59179b28f51aaa113cf8f4ac6badfaabbf888809c75571673cac8a7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/final-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/final_checks.py",
    "bytes": 2707,
    "sha256": "4dad4a6a2cd0db5d1737e1c9407348812f36c13705f612d610f792098576dea3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/on/binding.json",
    "bytes": 239938,
    "sha256": "005a7a837998592512e44f133cbd539c6e079907abc11dc7c41f20bdd16481e7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/on/protocol.json",
    "bytes": 6899,
    "sha256": "407f1972b04fa5723f1a8933fcbcec6cd9cb3c96c1afb1c27e3e73cd367805e0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/prepare.py",
    "bytes": 8899,
    "sha256": "9dd060605f04bde36a6e804bd1e3710c2a83c312bdf39f51f5b7e0de14bf3183"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/run-checks.stderr",
    "bytes": 119,
    "sha256": "af3c613716ccfc393173f0d686e389015aed46b6f388bff1fb3679f33e0b476f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/run-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/run.py",
    "bytes": 18484,
    "sha256": "4519995ade79bebe121580f515a953c2b38d95cf051fc7f21bbd085e429b2ef1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/run_test.py",
    "bytes": 16316,
    "sha256": "1f2b9cf5e1bef73f0159959ae5e0375f827e2e2ba66ae7cca46c82f6f35cf12a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/schedule-checks.stderr",
    "bytes": 574,
    "sha256": "0ddc6fe5295fe5712c6f853405853ed932f0af8b672db6d690c78dd591713844"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/schedule-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/schedule-transformation.json",
    "bytes": 7246,
    "sha256": "c2440f8f1093276455e5717d77f7d57a4306c62af36837b4c443ad1d7af6ec4a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/schedule_checks.py",
    "bytes": 5707,
    "sha256": "eaed82055d053f5f7449fb0c7a568242589ad078681a26fcc0fff54c471d89cd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup-checks.initial.stderr",
    "bytes": 1331,
    "sha256": "f2e9a377263a8b3149a8e5c77e266836dab8a5beddc1d66b8eefbf4c07ada99b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup-checks.initial.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup-checks.stderr",
    "bytes": 575,
    "sha256": "e741a98393073d249a67bebb576802d5e46426c414fe9528ee68dec5b3ab7f4f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup-test-correction.json",
    "bytes": 243,
    "sha256": "48836d02f03834ebbc8d758c10de5691adcc27f66b53d0ac52d1b27535234fc4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup_checks.initial.py",
    "bytes": 4530,
    "sha256": "dd884257776632c8ed2022701b46717e118b52a60ffd76dd0743679dfe1d500c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup_checks.py",
    "bytes": 4570,
    "sha256": "1295f2fc379fc0ed95f9c52a7d9c8c2e5b2637003a3de5c721685bb735348afd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/thermal-checks.stderr",
    "bytes": 1274,
    "sha256": "9219d599735facb8bf3c53896546de7bb9a8d1b6a7eb3e8c911c846a32d631e5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/thermal-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/thermal_checks.py",
    "bytes": 11107,
    "sha256": "27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  }
]
```

## Artifact SHA-256 139273d5117211817f9dbd169fce0a54654345ec0cb04b4066d6f407db041ec8

Encoding: `utf-8`. Original bytes: 575.

````````````text
test_canonical_order_does_not_change_identity_and_extra_fields_do (__main__.Checks) ... ok
test_every_protocol_field_is_bound (__main__.Checks) ... ok
test_exact_original_workload_requires_eighteen_gb (__main__.Checks) ... ok
test_only_admission_and_fixture_delivery_changed_in_driver (__main__.Checks) ... ok
test_ordinary_small_profile_keeps_original_admission (__main__.Checks) ... ok
test_real_driver_reaches_quiet_boundary_before_any_model_launch (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 1.072s

OK

````````````

## Artifact SHA-256 54bebbd978590c6310e9141a80b5553f23fb594609a8242d6379f89f479aabe3

Encoding: `utf-8`. Original bytes: 139.

````````````text
{"requirement": {"stable_seconds": 180, "maximum_wait_seconds": 1800}, "passed": false, "error": "RuntimeError: synthetic prelaunch stop"}

````````````

## Artifact SHA-256 e3e51ccf0c639ea27543db5f470dd222d67f28b7a910f955e2a4b75a14d35e25

Encoding: `utf-8`. Original bytes: 12272.

````````````text
{
  "classification": "Prospective exact final MTP startup method: global startup swap-ins invalidate the whole pair under the original assessor while the fixed cohort continues; all physical/pressure/swap-out stops and original work/acceptance remain.",
  "approved_protocol": {
    "label": "long-decode-on",
    "classification": "Prospective bounded 512-output study; final composition proofs and guarded executor required",
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "frozen_binary_sha256": "9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673",
    "arms": {
      "reference": {
        "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "0",
          "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
          "SLOTSTREAM_OPT_COMPACT_MTP": "0",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
          "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
          "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
          "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
          "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
          "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
          "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
          "SLOTSTREAM_OPT_INDEXER_RAW": "0",
          "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
          "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
          "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
          "SLOTSTREAM_OPT_SWEEP_TILES": "0",
          "SLOTSTREAM_OPT_INDEXER_TILES": "0",
          "SLOTSTREAM_OPT_SHARED_ROPE": "0",
          "SLOTSTREAM_OPT_FUSED_ROPE": "0",
          "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
          "SLOTSTREAM_OPT_GDN_RECORD": "0",
          "SLOTSTREAM_OPT_PLE_TILES": "0",
          "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
          "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
          "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
          "SLOTSTREAM_OPT_MTP_TAIL": "0",
          "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
          "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
          "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
          "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
          "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
          "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
          "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
          "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
          "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
          "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
          "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
          "SLOTSTREAM_OPT_READ_HANDLES": "0",
          "SLOTSTREAM_OPT_COMPILED_NORM": "0",
          "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
          "SLOTSTREAM_OPT_NGRAM_RING": "0",
          "SLOTSTREAM_OPT_EXPERT_MAP": "0",
          "SLOTSTREAM_OPT_POOL_PINS": "0",
          "SLOTSTREAM_OPT_SLOT_SLICES": "0",
          "SLOTSTREAM_OPT_SLOT_WORDS": "0",
          "SLOTSTREAM_OPT_SLOT_CPU": "0",
          "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
          "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
          "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
          "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
          "SLOTSTREAM_OPT_VISION_PADDING": "0",
          "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
          "SLOTSTREAM_OPT_READ_SCOPE": "0",
          "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
          "SLOTSTREAM_EMBEDDING_ROWS": "0",
          "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0",
          "SLOTSTREAM_DRAFT_DEPTH": "1"
        }
      },
      "combined": {
        "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
          "SLOTSTREAM_OPT_COMPACT_MTP": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
          "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
          "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
          "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
          "SLOTSTREAM_OPT_NGRAM_ROWS": "1",
          "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
          "SLOTSTREAM_OPT_INDEXER_RAW": "0",
          "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
          "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
          "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
          "SLOTSTREAM_OPT_SWEEP_TILES": "0",
          "SLOTSTREAM_OPT_INDEXER_TILES": "0",
          "SLOTSTREAM_OPT_SHARED_ROPE": "1",
          "SLOTSTREAM_OPT_FUSED_ROPE": "1",
          "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
          "SLOTSTREAM_OPT_GDN_RECORD": "0",
          "SLOTSTREAM_OPT_PLE_TILES": "0",
          "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
          "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
          "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
          "SLOTSTREAM_OPT_MTP_TAIL": "0",
          "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
          "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
          "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
          "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
          "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
          "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
          "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
          "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
          "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
          "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
          "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
          "SLOTSTREAM_OPT_READ_HANDLES": "0",
          "SLOTSTREAM_OPT_COMPILED_NORM": "0",
          "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
          "SLOTSTREAM_OPT_NGRAM_RING": "0",
          "SLOTSTREAM_OPT_EXPERT_MAP": "0",
          "SLOTSTREAM_OPT_POOL_PINS": "0",
          "SLOTSTREAM_OPT_SLOT_SLICES": "0",
          "SLOTSTREAM_OPT_SLOT_WORDS": "0",
          "SLOTSTREAM_OPT_SLOT_CPU": "0",
          "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
          "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
          "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
          "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
          "SLOTSTREAM_OPT_VISION_PADDING": "0",
          "SLOTSTREAM_OPT_VISION_QUERY_TILE": "256",
          "SLOTSTREAM_OPT_READ_SCOPE": "0",
          "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
          "SLOTSTREAM_EMBEDDING_ROWS": "1",
          "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1",
          "SLOTSTREAM_DRAFT_DEPTH": "1"
        }
      }
    },
    "mtp": "on",
    "memory_gb": 12,
    "raw": false,
    "think": false,
    "seed": 7,
    "rounds": 16,
    "max_tokens": 512,
    "minimum_output_tokens": 512,
    "fixture": "/private/tmp/slotstream-optimization-execution/long-decode-measurement-v340/prompt.txt",
    "fixture_sha256": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2",
    "comparison_basis": "fixed-total-memory",
    "require_nominal_power_state": true,
    "maximum_sampled_footprint_bytes": 12000000000,
    "abort_on_resource_failure": true,
    "stop_on_workspace_contention": true,
    "initial_workspace_quiet": {
      "stable_seconds": 180,
      "maximum_wait_seconds": 1800
    },
    "between_cells_seconds": 0,
    "model_reservation_wait_seconds": 1800,
    "timeout_seconds": 600,
    "acceptance": {
      "minimum_pairs": 8,
      "maximum_median_client_regression": 0.05,
      "minimum_positive_fraction": 0,
      "all_outputs_exact": true,
      "replacement_rounds": 0
    },
    "before_cell_thermal_settle": {
      "stable_seconds": 30,
      "maximum_wait_seconds": 600,
      "poll_seconds": 2
    }
  },
  "canonical_protocol_sha256": "c12e2bc21ef1f0590b8e0bef0a32ca526e8276b19a3e874d2507a50ac6167f5e",
  "original_protocol_sha256": "407f1972b04fa5723f1a8933fcbcec6cd9cb3c96c1afb1c27e3e73cd367805e0",
  "fixture_bytes": 2783,
  "startup_reclaimable_gb": 18,
  "process_cap_gb": 12,
  "prior_failed_qualification_sha256": "51f612f01251a0071f0d6122b7c7d5066e40cc7fc936740ef001d687a2665e09",
  "original_driver_changes": [
    {
      "old": "def measurement_memory(protocol):\n",
      "new": "def exact_final_mtp_long(protocol):\n    # This exception delivers one already frozen 12 GB MTP-on workload.\n    # Its 512-output chat responses do not fit the legacy short raw-text\n    # component profile. Every protocol field is bound, including the build,\n    # fixture digest, both arms, output length, repetitions and all guards.\n    canonical = json.dumps(protocol, sort_keys=True, separators=(',', ':'), allow_nan=False)\n    return hashlib.sha256(canonical.encode()).hexdigest() == 'c12e2bc21ef1f0590b8e0bef0a32ca526e8276b19a3e874d2507a50ac6167f5e'\n\n\ndef measurement_memory(protocol):\n"
    },
    {
      "old": "    memory = protocol['memory_gb']\n",
      "new": "    if exact_final_mtp_long(protocol):\n        return 18  # Exact 12 GB process cap plus 6 GB startup headroom.\n    memory = protocol['memory_gb']\n"
    },
    {
      "old": "        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048\n",
      "new": "        fixture_limit = 2783 if exact_final_mtp_long(protocol) else (32768 if protocol.get('large_scope_measurement') is not None else 2048)\n"
    },
    {
      "old": "def measurement_memory(protocol):\n",
      "new": "def startup_vm_requires_abort(protocol, before, after):\n    # Timing eligibility is deliberately separate from the hard resource stop.\n    # For the exact final MTP cohort, startup swap-ins exclude the complete pair\n    # through unchanged startup_and_warmup_valid and the original raw assessor.\n    # New swap-outs, unavailable counters and resets always require aborting.\n    for key in ('swapins', 'swapouts'):\n        if (type(before.get(key)) is not int or type(after.get(key)) is not int\n                or before[key] < 0 or after[key] < before[key]):\n            return True\n    if exact_final_mtp_long(protocol):\n        return before['swapouts'] != after['swapouts']\n    return any(before[key] != after[key] for key in ('swapins', 'swapouts'))\n\n\ndef measurement_memory(protocol):\n"
    },
    {
      "old": "                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]\n                                   for key in ['swapins', 'swapouts']):\n",
      "new": "                            if startup_vm_requires_abort(protocol, row['before_startup'], row['after_warmup_vm']):\n"
    }
  ],
  "executor_changes": [
    {
      "old": "OUT = ROOT / '.build/optimization/final-long-adaptive-schedule-v581'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'"
    },
    {
      "old": "'startup_reclaimable_bytes': (13 if mode == 'off' else 15) * 10**9",
      "new": "'startup_reclaimable_bytes': (13 if mode == 'off' else 18) * 10**9"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    },
    {
      "old": "[('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6)]",
      "new": "[('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6), ('delivery', 6)]"
    },
    {
      "old": "parser.add_argument('--mode', choices=tuple(MODES), required=True)",
      "new": "parser.add_argument('--mode', choices=('on',), required=True)"
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'"
    },
    {
      "old": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']\n",
      "new": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']\n"
    },
    {
      "old": "('schedule', 6), ('delivery', 6)]",
      "new": "('schedule', 6), ('delivery', 6), ('startup', 6)]"
    }
  ],
  "model_launched": false,
  "off_result_reused_without_rerun": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/off/execution/qualification.json",
  "startup_swapin_abort_unchanged": false,
  "startup_swapin_pair_eligibility_unchanged": true,
  "prior_failed_startup_qualification_sha256": "1ed6df72301d954301fb33879911d2b4cccf81afb2314fbb9aac03da6ad9efa4"
}

````````````

## Artifact SHA-256 83f482c842b2ddede7a58aabbf587189724bffb84945b810176b96ed4e09cecb

Encoding: `utf-8`. Original bytes: 5797.

````````````text
"""Model-free qualification of the exact MTP long-workload delivery correction."""
import copy
import hashlib
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

import run as runner

driver = runner.module('exact_mtp_delivery_driver', runner.HERE / 'driver/serve_bench.py')
profile = json.loads((runner.HERE / 'delivery-profile.json').read_text())


class Checks(unittest.TestCase):
    def test_exact_original_workload_requires_eighteen_gb(self):
        protocol = runner.expected_protocol('on')
        self.assertEqual(protocol, profile['approved_protocol'])
        self.assertEqual(protocol, runner.c.read(runner.BASE / 'final-long-adaptive-schedule-v581/on/protocol.json'))
        self.assertTrue(driver.exact_final_mtp_long(protocol))
        self.assertEqual(driver.measurement_memory(protocol), 18)
        self.assertEqual(runner.policy('on')['startup_reclaimable_bytes'], 18_000_000_000)
        self.assertEqual(protocol['maximum_sampled_footprint_bytes'], 12_000_000_000)
        self.assertEqual((protocol['rounds'], protocol['max_tokens'], protocol['minimum_output_tokens']), (16, 512, 512))

    def test_every_protocol_field_is_bound(self):
        protocol = runner.expected_protocol('on')
        for field in protocol:
            changed = copy.deepcopy(protocol)
            changed[field] = None
            with self.subTest(field=field):
                self.assertFalse(driver.exact_final_mtp_long(changed))
                with self.assertRaises((ValueError, TypeError)):
                    driver.measurement_memory(changed)
        for arm in ('reference', 'combined'):
            changed = copy.deepcopy(protocol)
            changed['arms'][arm]['env']['SLOTSTREAM_DRAFT_DEPTH'] = '2'
            self.assertFalse(driver.exact_final_mtp_long(changed))
            with self.assertRaises(ValueError):
                driver.measurement_memory(changed)

    def test_ordinary_small_profile_keeps_original_admission(self):
        protocol = runner.expected_protocol('off')
        self.assertFalse(driver.exact_final_mtp_long(protocol))
        self.assertEqual(driver.measurement_memory(protocol), 13)
        self.assertEqual(runner.policy('off')['startup_reclaimable_bytes'], 13_000_000_000)

    def test_canonical_order_does_not_change_identity_and_extra_fields_do(self):
        protocol = runner.expected_protocol('on')
        self.assertTrue(driver.exact_final_mtp_long(dict(reversed(list(protocol.items())))))
        changed = dict(protocol, large_pool_measurement={'purpose': 'another experiment'})
        self.assertFalse(driver.exact_final_mtp_long(changed))
        with self.assertRaises(ValueError):
            driver.measurement_memory(changed)

    def test_real_driver_reaches_quiet_boundary_before_any_model_launch(self):
        protocol = runner.expected_protocol('on')
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            path = root / 'protocol.json'
            path.write_text(json.dumps(protocol))
            output = root / 'evidence'
            real_popen = driver.subprocess.Popen
            attempted_model_commands = []

            def prohibit_model(command, *args, **kwargs):
                if isinstance(command, (tuple, list)) and 'serve' in command:
                    attempted_model_commands.append(command)
                    raise AssertionError('model launch forbidden in delivery qualification')
                return real_popen(command, *args, **kwargs)

            with patch.object(sys, 'argv', ['serve_bench.py', '--protocol', str(path), '--out', str(output)]), \
                    patch.object(driver, 'wait_for_quiet_workspace', side_effect=RuntimeError('synthetic prelaunch stop')) as quiet, \
                    patch.object(driver, 'model_identity', return_value={'synthetic': 'model-free delivery only'}), \
                    patch.object(driver.subprocess, 'Popen', side_effect=prohibit_model), \
                    patch.object(driver, 'exchange') as exchange:
                self.assertEqual(driver.main(), 1)
            quiet.assert_called_once_with(protocol['initial_workspace_quiet'])
            exchange.assert_not_called()
            self.assertEqual(attempted_model_commands, [])
            manifest = runner.c.read(output / 'manifest.json')
            completion = runner.c.read(output / 'completion.json')
            self.assertEqual(manifest['protocol'], protocol)
            self.assertEqual(completion['recorded_cells'], 0)
            self.assertEqual(completion['error'], 'RuntimeError: synthetic prelaunch stop')
            self.assertTrue(completion['stopped_early'])
            self.assertTrue((output / 'request.json').exists())
            fixture = Path(protocol['fixture'])
            self.assertEqual(fixture.stat().st_size, profile['fixture_bytes'])
            self.assertEqual(hashlib.sha256(fixture.read_bytes()).hexdigest(), protocol['fixture_sha256'])

    def test_only_admission_and_fixture_delivery_changed_in_driver(self):
        source = (runner.HERE / 'driver/serve_bench.py').read_text()
        for change in reversed(profile['original_driver_changes']):
            self.assertEqual(source.count(change['new']), 1)
            source = source.replace(change['new'], change['old'])
        self.assertEqual(source, (runner.BASE / 'final-long-adaptive-schedule-v581/driver/serve_bench.py').read_text())
        self.assertIn("warm_exclusions.append('swap activity during large-pool startup/warmup')", source)
        self.assertEqual(runner.digest(Path(runner.study.__file__)),
                         '0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820')


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036

Encoding: `utf-8`. Original bytes: 19176.

````````````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()

````````````

## Artifact SHA-256 e490e49bcd784f293b4e58222e416f6a233e76ba1c15f5fdde717a984116c00c

Encoding: `utf-8`. Original bytes: 62137.

````````````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
import sys
sys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')
from thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def exact_final_mtp_long(protocol):
    # This exception delivers one already frozen 12 GB MTP-on workload.
    # Its 512-output chat responses do not fit the legacy short raw-text
    # component profile. Every protocol field is bound, including the build,
    # fixture digest, both arms, output length, repetitions and all guards.
    canonical = json.dumps(protocol, sort_keys=True, separators=(',', ':'), allow_nan=False)
    return hashlib.sha256(canonical.encode()).hexdigest() == 'c12e2bc21ef1f0590b8e0bef0a32ca526e8276b19a3e874d2507a50ac6167f5e'


def startup_vm_requires_abort(protocol, before, after):
    # Timing eligibility is deliberately separate from the hard resource stop.
    # For the exact final MTP cohort, startup swap-ins exclude the complete pair
    # through unchanged startup_and_warmup_valid and the original raw assessor.
    # New swap-outs, unavailable counters and resets always require aborting.
    for key in ('swapins', 'swapouts'):
        if (type(before.get(key)) is not int or type(after.get(key)) is not int
                or before[key] < 0 or after[key] < before[key]):
            return True
    if exact_final_mtp_long(protocol):
        return before['swapouts'] != after['swapouts']
    return any(before[key] != after[key] for key in ('swapins', 'swapouts'))


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    if exact_final_mtp_long(protocol):
        return 18  # Exact 12 GB process cap plus 6 GB startup headroom.
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    thermal_settle = validate_thermal_settle(protocol)
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 2783 if exact_final_mtp_long(protocol) else (32768 if protocol.get('large_scope_measurement') is not None else 2048)
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py'),
                   Path(__file__).with_name('thermal_settle.py'),
                   ROOT / 'Tools/thermal_readiness.py', ROOT / 'Tools/optimization_readiness.py']:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if thermal_settle is not None:
                    try:
                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)
                    except Exception:
                        stop_requested = True
                        raise
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if startup_vm_requires_abort(protocol, row['before_startup'], row['after_warmup_vm']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````````````

## Artifact SHA-256 13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad

Encoding: `utf-8`. Original bytes: 6912.

````````````text
"""Optional sampled thermal readiness before a future benchmark model launch.

No inference, timed request, historical result or acceptance rule is changed.
The model lock is held while waiting and released before ordinary preflight.
Nominal samples do not promise that a subsequent request stays nominal.
"""
import fcntl
import json
import math
import os
from pathlib import Path
import time


def validate(protocol):
    value = protocol.get('before_cell_thermal_settle')
    if value is None:
        return None
    if (type(value) is not dict
        or set(value) != {'stable_seconds', 'maximum_wait_seconds', 'poll_seconds'}
        or type(value['stable_seconds']) is not int or not 30 <= value['stable_seconds'] <= 120
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 600
        or type(value['poll_seconds']) is not int or not 1 <= value['poll_seconds'] <= 5
        or protocol.get('require_nominal_power_state') is not True
        or protocol.get('stop_on_workspace_contention') is not True):
        raise ValueError('thermal settling requires explicit bounded durations and original strict resource/thermal/contention guards')
    return dict(value)


def wait(requirement, required_gb, *, observe=None, vm=None, pressure=None, jobs=None,
         now=time.monotonic, sleep=time.sleep, lock_path=None, record=None):
    if requirement is None:
        return {'enabled': False}
    validate({'before_cell_thermal_settle': requirement, 'require_nominal_power_state': True,
              'stop_on_workspace_contention': True})
    if type(required_gb) not in (int, float) or not math.isfinite(required_gb) or required_gb < 0:
        raise ValueError('invalid original admission requirement')
    if observe is None:
        from thermal_readiness import observe
    if vm is None:
        from prefill_bench import vm_snapshot as vm
    if pressure is None:
        from optimization_readiness import pressure_snapshot as pressure
    if jobs is None:
        from serve_bench import competing_jobs as jobs
    if record is None:
        record = lambda value: print(json.dumps({'thermal_settle': value}), flush=True)
    started = now()
    nominal_since = previous_time = swapouts = previous_swapins = None
    samples = 0
    minimum = required_gb * 1e9
    path = lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock'
    with open(path, 'a') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise RuntimeError('another model owns the lock; no thermal settling or launch') from error
        while True:
            current = now()
            elapsed = current - started
            if elapsed < 0 or (previous_time is not None and current < previous_time):
                raise RuntimeError('monotonic clock moved backwards')
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            state, memory, pressure_state, competing = observe(), vm(), pressure(), jobs()
            after_observation = now()
            if after_observation < current:
                raise RuntimeError('monotonic clock moved backwards')
            current = after_observation
            elapsed = current - started
            if elapsed > requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired during observation; no model launched')
            samples += 1
            record({'seconds': elapsed, 'conditions': state.get('conditions'),
                    'reclaimable_bytes': memory.get('reclaimable_bytes'),
                    'swapins': memory.get('swapins'), 'swapouts': memory.get('swapouts'),
                    'pressure_level': pressure_state.get('level'), 'competing_jobs': competing})
            if competing:
                raise RuntimeError('competing storage/build work during thermal settling')
            if type(pressure_state.get('level')) is not int or pressure_state['level'] != 1:
                raise RuntimeError('memory pressure is not normal during thermal settling')
            if type(memory.get('reclaimable_bytes')) is not int or memory['reclaimable_bytes'] < minimum:
                raise RuntimeError('original startup memory requirement no longer fits')
            for key in ('swapins', 'swapouts'):
                if type(memory.get(key)) is not int or memory[key] < 0:
                    raise RuntimeError('VM counters are unavailable during thermal settling')
            if swapouts is not None and memory['swapouts'] != swapouts:
                raise RuntimeError('swap-out counter changed during thermal settling')
            if previous_swapins is not None and memory['swapins'] < previous_swapins:
                raise RuntimeError('swap-in counter moved backwards during thermal settling')
            swapouts = memory['swapouts']
            previous_swapins = memory['swapins']
            conditions = state.get('conditions')
            if (type(conditions) is not dict or set(conditions) != {'thermalState', 'lowPowerModeEnabled'}
                or conditions['thermalState'] not in ('nominal', 'fair', 'serious', 'critical')
                or type(conditions['lowPowerModeEnabled']) is not bool
                or type(state.get('ready')) is not bool
                or state['ready'] != (conditions['thermalState'] == 'nominal' and not conditions['lowPowerModeEnabled'])):
                raise RuntimeError('thermal/power observation is malformed or unavailable')
            if conditions['lowPowerModeEnabled'] or conditions['thermalState'] in ('serious', 'critical'):
                raise RuntimeError('thermal/power condition requires stopping before a model launch')
            # A scheduling gap cannot supply an unobserved stability interval.
            gap = previous_time is not None and current - previous_time > 2 * requirement['poll_seconds']
            if conditions['thermalState'] != 'nominal' or gap:
                nominal_since = None
            elif nominal_since is None:
                nominal_since = current
            previous_time = current
            stable = 0 if nominal_since is None else current - nominal_since
            if stable >= requirement['stable_seconds']:
                return {'enabled': True, 'reserved': True, 'seconds': elapsed,
                        'sampled_nominal_seconds': stable, 'samples': samples,
                        'before_launch_only': True, 'request_acceptance_unchanged': True}
            if elapsed >= requirement['maximum_wait_seconds']:
                raise TimeoutError('bounded thermal settling expired; no model launched')
            sleep(min(requirement['poll_seconds'], requirement['maximum_wait_seconds'] - elapsed))

````````````

## Artifact SHA-256 5f30ef9bd5457ca8b4d6508d083e1301eb323fe89ad7724803e3dac902fd4403

Encoding: `utf-8`. Original bytes: 4019.

````````````text
{
  "edits": [
    {
      "old": "from prefill_bench import ROOT,",
      "new": "import sys\nsys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')\nfrom thermal_settle import validate as validate_thermal_settle, wait as wait_thermal_settle\nfrom prefill_bench import ROOT,"
    },
    {
      "old": "    validate_arms(protocol.get('arms'))\n",
      "new": "    validate_arms(protocol.get('arms'))\n    thermal_settle = validate_thermal_settle(protocol)\n"
    },
    {
      "old": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n",
      "new": "                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)\n                if thermal_settle is not None:\n                    try:\n                        row['thermal_settle'] = wait_thermal_settle(thermal_settle, required_memory+extra)\n                    except Exception:\n                        stop_requested = True\n                        raise\n"
    },
    {
      "old": "    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:\n",
      "new": "    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py'),\n                   Path(__file__).with_name('thermal_settle.py'),\n                   ROOT / 'Tools/thermal_readiness.py', ROOT / 'Tools/optimization_readiness.py']:\n"
    },
    {
      "old": "def measurement_memory(protocol):\n",
      "new": "def exact_final_mtp_long(protocol):\n    # This exception delivers one already frozen 12 GB MTP-on workload.\n    # Its 512-output chat responses do not fit the legacy short raw-text\n    # component profile. Every protocol field is bound, including the build,\n    # fixture digest, both arms, output length, repetitions and all guards.\n    canonical = json.dumps(protocol, sort_keys=True, separators=(',', ':'), allow_nan=False)\n    return hashlib.sha256(canonical.encode()).hexdigest() == 'c12e2bc21ef1f0590b8e0bef0a32ca526e8276b19a3e874d2507a50ac6167f5e'\n\n\ndef measurement_memory(protocol):\n"
    },
    {
      "old": "    memory = protocol['memory_gb']\n",
      "new": "    if exact_final_mtp_long(protocol):\n        return 18  # Exact 12 GB process cap plus 6 GB startup headroom.\n    memory = protocol['memory_gb']\n"
    },
    {
      "old": "        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048\n",
      "new": "        fixture_limit = 2783 if exact_final_mtp_long(protocol) else (32768 if protocol.get('large_scope_measurement') is not None else 2048)\n"
    },
    {
      "old": "def measurement_memory(protocol):\n",
      "new": "def startup_vm_requires_abort(protocol, before, after):\n    # Timing eligibility is deliberately separate from the hard resource stop.\n    # For the exact final MTP cohort, startup swap-ins exclude the complete pair\n    # through unchanged startup_and_warmup_valid and the original raw assessor.\n    # New swap-outs, unavailable counters and resets always require aborting.\n    for key in ('swapins', 'swapouts'):\n        if (type(before.get(key)) is not int or type(after.get(key)) is not int\n                or before[key] < 0 or after[key] < before[key]):\n            return True\n    if exact_final_mtp_long(protocol):\n        return before['swapouts'] != after['swapouts']\n    return any(before[key] != after[key] for key in ('swapins', 'swapouts'))\n\n\ndef measurement_memory(protocol):\n"
    },
    {
      "old": "                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]\n                                   for key in ['swapins', 'swapouts']):\n",
      "new": "                            if startup_vm_requires_abort(protocol, row['before_startup'], row['after_warmup_vm']):\n"
    }
  ],
  "original_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "driver_sha256": "e490e49bcd784f293b4e58222e416f6a233e76ba1c15f5fdde717a984116c00c",
  "reverse_restores_original_bytes": true
}

````````````

## Artifact SHA-256 87b5012ba59179b28f51aaa113cf8f4ac6badfaabbf888809c75571673cac8a7

Encoding: `utf-8`. Original bytes: 388.

````````````text
test_all_seven_native_proofs_are_retained (__main__.Checks) ... ok
test_incomplete_matrix_cannot_qualify_or_freeze (__main__.Checks) ... ok
test_missing_paired_or_consumed_legacy_cannot_hide (__main__.Checks) ... ok
test_original_run_report_and_guards_remain_exact (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 4 tests in 0.814s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 4dad4a6a2cd0db5d1737e1c9407348812f36c13705f612d610f792098576dea3

Encoding: `utf-8`. Original bytes: 2707.

````````````text
"""Additional final-composition proof checks; original twenty tests stay intact."""
import ast
import inspect
from pathlib import Path
import unittest
from unittest.mock import patch
import run as m

class Checks(unittest.TestCase):
    def test_original_run_report_and_guards_remain_exact(self):
        prior=ast.parse((m.BASE/'fixed-mtp-long-decode-executor-v365/run.py').read_text())
        source=Path(m.__file__).read_text()
        changes=m.c.read(m.HERE/'schedule-transformation.json')['run_edits']
        for item in reversed(changes):
            self.assertEqual(source.count(item['new']),1)
            source=source.replace(item['new'],item['old'])
        self.assertEqual(source,(m.BASE/'final-composition-long-decode-v571/run.py').read_text())
        new=ast.parse(source)
        a={n.name:ast.dump(n,include_attributes=False) for n in prior.body if isinstance(n,ast.FunctionDef)}
        b={n.name:ast.dump(n,include_attributes=False) for n in new.body if isinstance(n,ast.FunctionDef)}
        for name in ['policy','assess_cohort','assess_raw','execute_bound','run']:
            self.assertEqual(a[name],b[name])
        self.assertEqual((m.SECONDS,m.CLEANUP_SECONDS),(12600,60))

    def test_incomplete_matrix_cannot_qualify_or_freeze(self):
        with patch.object(m.adapter, 'status', return_value={'paired_matrix_complete': False, 'stages': []}), self.assertRaises(ValueError):
            m.final_campaign_proof(m.adapter.PACKET)
        for mode in ['off','on']:
            self.assertFalse((m.HERE/mode).exists())
            self.assertFalse((m.OUT/mode).exists())

    def test_all_seven_native_proofs_are_retained(self):
        rows=[{'status':'passed'} for _ in range(11)]+[{'status':'unrun'} for _ in range(2)]
        native={str(i):{'synthetic':'proof binding test only'} for i in range(7)}
        with patch.object(m,'campaign_proof',return_value={}),patch.object(m.adapter,'status',return_value={'paired_matrix_complete':True,'stages':rows}),patch.object(m.adapter,'native_proof',return_value=native):
            self.assertEqual(m.final_campaign_proof(m.adapter.PACKET)['all_seven_native_proofs'],native)

    def test_missing_paired_or_consumed_legacy_cannot_hide(self):
        for bad in [4,11]:
            rows=[{'status':'passed'} for _ in range(11)]+[{'status':'unrun'} for _ in range(2)]
            rows[bad]['status']='unrun' if bad<11 else 'passed'
            with patch.object(m,'campaign_proof',return_value={}),patch.object(m.adapter,'status',return_value={'paired_matrix_complete':True,'stages':rows}),self.assertRaises(ValueError):
                m.final_campaign_proof(m.adapter.PACKET)

if __name__=='__main__':unittest.main(verbosity=2)

````````````

## Artifact SHA-256 005a7a837998592512e44f133cbd539c6e079907abc11dc7c41f20bdd16481e7

Encoding: `gzip+base64`. Original bytes: 239938.

````````````text
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
````````````

## Artifact SHA-256 407f1972b04fa5723f1a8933fcbcec6cd9cb3c96c1afb1c27e3e73cd367805e0

Encoding: `utf-8`. Original bytes: 6899.

````````````text
{
  "label": "long-decode-on",
  "classification": "Prospective bounded 512-output study; final composition proofs and guarded executor required",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "frozen_binary_sha256": "9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673",
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "1",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "256",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    }
  },
  "mtp": "on",
  "memory_gb": 12,
  "raw": false,
  "think": false,
  "seed": 7,
  "rounds": 16,
  "max_tokens": 512,
  "minimum_output_tokens": 512,
  "fixture": "/private/tmp/slotstream-optimization-execution/long-decode-measurement-v340/prompt.txt",
  "fixture_sha256": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2",
  "comparison_basis": "fixed-total-memory",
  "require_nominal_power_state": true,
  "maximum_sampled_footprint_bytes": 12000000000,
  "abort_on_resource_failure": true,
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "between_cells_seconds": 0,
  "model_reservation_wait_seconds": 1800,
  "timeout_seconds": 600,
  "acceptance": {
    "minimum_pairs": 8,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "before_cell_thermal_settle": {
    "stable_seconds": 30,
    "maximum_wait_seconds": 600,
    "poll_seconds": 2
  }
}

````````````

## Artifact SHA-256 9dd060605f04bde36a6e804bd1e3710c2a83c312bdf39f51f5b7e0de14bf3183

Encoding: `utf-8`. Original bytes: 8899.

````````````text
"""Prepare an isolated prospective scheduling amendment; never launch inference."""
from pathlib import Path
import hashlib
import json

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
ROOT = Path('/Users/carlos/Projects/slotstream')
PRIOR = BASE / 'final-composition-long-decode-v571'
THERMAL = BASE / 'thermal-settle-preparation-v388'


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def transform(source, edits):
    revised = source
    for old, new in edits:
        assert revised.count(old) == 1, old
        revised = revised.replace(old, new)
    restored = revised
    for old, new in reversed(edits):
        assert restored.count(new) == 1, new
        restored = restored.replace(new, old)
    assert restored == source
    return revised


def main():
    assert not (HERE / 'run.py').exists()
    assert all(not (PRIOR / mode).exists() for mode in ('off', 'on'))
    assert all(not (ROOT / '.build/optimization/final-composition-long-decode-v571' / mode).exists()
               for mode in ('off', 'on'))
    record = json.loads((THERMAL / 'driver-transformation.json').read_text())
    assert digest(ROOT / 'Tools/serve_bench.py') == record['original_sha256']
    assert digest(THERMAL / 'thermal_settle.py') == '13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad'
    driver_edits = [(item['old'], item['new']) for item in record['edits']]
    driver_edits.append((
        "    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:\n",
        "    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py'),\n"
        "                   Path(__file__).with_name('thermal_settle.py'),\n"
        "                   ROOT / 'Tools/thermal_readiness.py', ROOT / 'Tools/optimization_readiness.py']:\n"))
    driver = HERE / 'driver'
    driver.mkdir()
    (driver / 'serve_bench.py').write_text(transform((ROOT / 'Tools/serve_bench.py').read_text(), driver_edits))
    for source in (ROOT / 'Tools/prefill_bench.py', THERMAL / 'thermal_settle.py'):
        (driver / source.name).write_bytes(source.read_bytes())
    (HERE / 'thermal_settle.py').write_bytes((THERMAL / 'thermal_settle.py').read_bytes())
    (HERE / 'thermal_checks.py').write_bytes((THERMAL / 'checks.py').read_bytes())
    (HERE / 'driver-transformation.json').write_text(json.dumps({
        'edits': [{'old': old, 'new': new} for old, new in driver_edits],
        'original_sha256': digest(ROOT / 'Tools/serve_bench.py'),
        'driver_sha256': digest(driver / 'serve_bench.py'),
        'reverse_restores_original_bytes': True}, indent=2) + '\n')
    run_edits = [
        ("The original V340 reporter, serving driver and ownership guard stay unchanged.",
         "The original V340 reporter and ownership guard stay unchanged. An isolated\n"
         "serving driver adds sampled prelaunch readiness; only the two unfrozen\n"
         "long cohorts replace the fixed sleep. Full work and acceptance remain intact."),
        ("OUT = ROOT / '.build/optimization/final-composition-long-decode-v571'",
         "OUT = ROOT / '.build/optimization/final-long-adaptive-schedule-v581'"),
        ("    return result\n\n\ndef validate_protocol(mode, value):",
         "    result['between_cells_seconds'] = 0\n"
         "    result['before_cell_thermal_settle'] = {\n"
         "        'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2}\n"
         "    return result\n\n\ndef validate_protocol(mode, value):"),
        ("    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
         "    paths += [HERE / name for name in ('prepare.py', 'schedule_checks.py',\n"
         "              'thermal_checks.py', 'driver-transformation.json', 'schedule-transformation.json')]\n"
         "    paths += [HERE / 'driver' / name for name in ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')]\n"
         "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"),
        ("    return assess_cohort(protocol, completion, rows, warmups)\n",
         "    validate_schedule_evidence(manifest, rows)\n"
         "    return assess_cohort(protocol, completion, rows, warmups)\n"),
        ("    command = [sys.executable, str(ROOT / 'Tools/serve_bench.py'), '--protocol',\n",
         "    command = [sys.executable, str(HERE / 'driver/serve_bench.py'), '--protocol',\n"),
        ("    protocol = expected_protocol(mode)\n    proof = final_campaign_proof(campaign)\n",
         "    protocol = expected_protocol(mode)\n    proof = final_campaign_proof(campaign)\n"
         "    for name, count in [('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6)]:\n"
         "        check = (HERE / (name + '-checks.stderr')).read_text()\n"
         "        require(f'Ran {count} tests' in check and check.rstrip().endswith('OK'),\n"
         "                'prospective schedule qualification checks missing')\n"),
        ("if __name__ == '__main__':\n    raise SystemExit(main())\n",
         "def validate_schedule_evidence(manifest, rows):\n"
         "    expected = {name: digest(HERE / 'driver' / name) for name in\n"
         "                ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')}\n"
         "    expected.update({name: digest(ROOT / 'Tools' / name) for name in\n"
         "                     ('thermal_readiness.py', 'optimization_readiness.py')})\n"
         "    require(manifest.get('harness_sources') == expected\n"
         "            and manifest.get('harness_sha256') == expected['serve_bench.py'],\n"
         "            'actual scheduling driver/helper closure differs')\n"
         "    require(len(rows) == 32, 'all original cells must carry readiness evidence')\n"
         "    for row in rows:\n"
         "        state = row.get('thermal_settle') or {}\n"
         "        require(row.get('cooldown_seconds') == 0 and all(state.get(key) is True\n"
         "                for key in ('enabled', 'reserved', 'before_launch_only', 'request_acceptance_unchanged')),\n"
         "                'sampled readiness missing or bypassed')\n"
         "        elapsed, stable, samples = (state.get(key) for key in\n"
         "                                    ('seconds', 'sampled_nominal_seconds', 'samples'))\n"
         "        require(type(elapsed) in (int, float) and type(stable) in (int, float)\n"
         "                and 30 <= stable <= elapsed <= 600\n"
         "                and type(samples) is int and samples >= 16,\n"
         "                'readiness stability or bounded observation evidence is invalid')\n"
         "\n\nif __name__ == '__main__':\n    raise SystemExit(main())\n")]
    revised = transform((PRIOR / 'run.py').read_text(), run_edits)
    (HERE / 'run.py').write_text(revised)
    (HERE / 'run_test.py').write_bytes((PRIOR / 'run_test.py').read_bytes())
    final = (PRIOR / 'final_checks.py').read_text()
    final = final.replace("        new=ast.parse(Path(m.__file__).read_text())",
        "        source=Path(m.__file__).read_text()\n"
        "        changes=m.c.read(m.HERE/'schedule-transformation.json')['run_edits']\n"
        "        for item in reversed(changes):\n"
        "            self.assertEqual(source.count(item['new']),1)\n"
        "            source=source.replace(item['new'],item['old'])\n"
        "        self.assertEqual(source,(m.BASE/'final-composition-long-decode-v571/run.py').read_text())\n"
        "        new=ast.parse(source)")
    (HERE / 'final_checks.py').write_text(final)
    result = {
        'classification': 'Prospective long-study scheduling amendment only. The frozen eight-paired campaign and both lifetimes remain unchanged.',
        'prior': str(PRIOR), 'prior_executor_sha256': digest(PRIOR / 'run.py'),
        'run_edits': [{'old': old, 'new': new} for old, new in run_edits],
        'original_serving_driver_sha256': digest(ROOT / 'Tools/serve_bench.py'),
        'original_reporter_sha256': digest(BASE / 'long-decode-measurement-v340/long_decode.py'),
        'original_startup_swapin_rule_unchanged': True,
        'all_requests_acceptance_and_full_allowances_preserved': True,
        'model_launched': False,
        'maximum_ideal_idle_saving_seconds_both_modes': 32 * 30 * 2,
        'limitations': ['Nominal thermal state does not prove constant GPU clocks or thermal equilibrium.',
                       'Eligibility and all-output checks remain authoritative. No failed study is automatically retried.',
                       'This changes benchmark waiting time, not inference speed.']}
    (HERE / 'schedule-transformation.json').write_text(json.dumps(result, indent=2) + '\n')
    for source in HERE.rglob('*.py'):
        compile(source.read_text(), str(source), 'exec')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()

````````````

## Artifact SHA-256 af3c613716ccfc393173f0d686e389015aed46b6f388bff1fb3679f33e0b476f

Encoding: `utf-8`. Original bytes: 119.

````````````text
....................
----------------------------------------------------------------------
Ran 20 tests in 8.515s

OK

````````````

## Artifact SHA-256 4519995ade79bebe121580f515a953c2b38d95cf051fc7f21bbd085e429b2ef1

Encoding: `utf-8`. Original bytes: 18484.

````````````text
"""Guarded 512-output measurement after exact native/eight-paired qualification.

Check/freeze are model-free. A run needs an explicitly granted full interval.
The original V340 reporter and ownership guard stay unchanged. An isolated
serving driver adds sampled prelaunch readiness; only the two unfrozen
long cohorts replace the fixed sleep. Full work and acceptance remain intact.
V524 binds the exact final controls; V523 checks native output. The final
continuation additionally proves all seven original native cases and revalidates
the explicitly reused short-one cohort. This runner cannot activate or retry.
"""
import argparse
import datetime
import fcntl
import importlib.util
import inspect
import json
from pathlib import Path
import sys

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'
sys.path.insert(0, str(ROOT / 'Tools'))
sys.path.insert(0, str(BASE / 'pressure-footprint-v341'))
import optimization_campaign as c
from prefill_bench import digest
from guard_with_footprint import guarded_run


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


core = module('long_original_executor', BASE / 'optional-current-serving-v330/run.py')
controls = module('long_selected_controls', BASE / 'final-composition-controls-v524/controls.py')
study = module('long_original_reporter', BASE / 'long-decode-measurement-v340/long_decode.py')
native = module('long_native_assertions', BASE / 'final-composition-native-v523/run.py')
adapter = module('long_final_continuation', BASE / 'final-composition-continuation-v569/campaign.py')
require, now, allowance = core.require, core.now, core.allowance
EXECUTE_SOURCE = inspect.getsource(core.execute)
SECONDS, CLEANUP_SECONDS = 12600, 60
MODES = {'off': 'unique-prose', 'on': 'mtp-resource'}


def policy(mode):
    require(mode in MODES, 'unknown decode mode')
    return {'startup_reclaimable_bytes': (13 if mode == 'off' else 18) * 10**9,
            'minimum_live_reclaimable_bytes': 3 * 10**9,
            'maximum_owned_rss_bytes': (12 if mode == 'off' else 14) * 10**9,
            'sample_interval_seconds': .2, 'maximum_build_seconds': SECONDS,
            'stop_on_new_swapouts': True}


def expected_protocol(mode):
    require(mode in MODES, 'unknown decode mode')
    selected = controls.materialize(MODES[mode])
    controls.validate(MODES[mode], selected)
    result = controls.materialize_long(selected, mode)
    # Reconstruct the existing unrun draft exactly; do not weaken or extend it.
    require(result == c.read(BASE / 'final-composition-controls-v524/drafts' / ('long-' + mode + '.json')),
            'long workload, selected controls or resource contract changed')
    result['between_cells_seconds'] = 0
    result['before_cell_thermal_settle'] = {
        'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2}
    return result


def validate_protocol(mode, value):
    require(value == expected_protocol(mode), 'frozen long protocol changed')


def dependencies():
    paths = [Path(__file__), Path(core.__file__), Path(controls.__file__),
             Path(study.__file__), Path(native.__file__),
             BASE / 'final-composition-controls-v524/preparation.json',
             BASE / 'final-composition-native-v523/preparation.json',
             BASE / 'long-decode-measurement-v340/preparation.json',
             BASE / 'long-decode-measurement-v340/prompt.txt',
             BASE / 'pressure-footprint-v341/guard_with_footprint.py',
             BASE / 'pressure-footprint-v341/pressure_footprint.py']
    paths += [ROOT / 'Tools' / n for n in c.DRIVERS + ('thermal_readiness.py', 'optimization_results.py')]
    paths += list((BASE / 'final-composition-controls-v524/drafts').glob('*.json'))
    paths += [Path(adapter.__file__), adapter.HERE / 'preparation.json',
              BASE / 'final-composition-campaign-v525/campaign.py',
              BASE / 'final-composition-campaign-v525/preparation.json',
              HERE / 'run_test.py', HERE / 'final_checks.py']
    paths += [HERE / name for name in ('prepare.py', 'schedule_checks.py',
              'thermal_checks.py', 'driver-transformation.json', 'schedule-transformation.json')]
    paths += [HERE / 'driver' / name for name in ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')]
    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']
    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}


def campaign_proof(directory):
    """Recompute every native and paired result, including new native assertions.

    This reads the campaign format directly because the old load_packet validator
    intentionally requires the original disabled controls. Only V363's exact
    bounded amendment is accepted here. Lifetime, release and activation gates
    remain separate; no receipt boolean can substitute for raw qualification.
    """
    directory = Path(directory).resolve()
    packet = c.read(directory / 'packet.json')
    contract_path = directory / 'qualification-contract.json'
    build = c.bench.verified_build(controls.BINARY)
    require(packet.get('build') == build, 'campaign belongs to another build or source archive')
    require(packet.get('format') == 'slotstream-campaign-v1'
            and packet.get('stages') == list(c.STAGES)
            and packet.get('native_policy') == c.NATIVE_POLICY,
            'campaign scope or original native policy changed')
    require(packet.get('contract_sha256') == digest(contract_path), 'campaign contract changed')
    require(packet.get('drivers') == {n: digest(ROOT / 'Tools' / n) for n in c.DRIVERS}
            and packet.get('templates') == {p.name: digest(p) for p in sorted(c.TEMPLATES.glob('*.json'))},
            'original campaign drivers or templates changed')
    contract = c.read(contract_path)
    expected_native = {name: {'command': [build['binary'], 'optimization-state-check', '--variant', variant,
                                        '--model', controls.MODEL, '--json'], 'environment': {}}
                       for name, variant in c.NATIVE.items()}
    require(contract.get('format') == 'slotstream-qualification-v1'
            and contract.get('build_identity') == {k: build['identity'][k] for k in c.IDENTITY_KEYS}
            and contract.get('native') == expected_native,
            'native commands, controls, or build identity differ')
    expected_paired = {n: controls.materialize(n) for n in c.PAIRED}
    require(contract.get('paired_protocols') == expected_paired,
            'the exact eight final workloads and selected controls are required')
    stages, artifacts = {}, {}
    for stage in tuple('native/' + n for n in c.NATIVE) + tuple('paired/' + n for n in c.PAIRED):
        stages[stage] = c.assess_stage(directory, packet, contract, stage)
        kind, name = stage.split('/')
        if kind == 'native':
            native.assess(name, c.read(directory / stage / 'evidence/stdout.txt'))
        # Capture the complete prerequisite output, not only its green receipt.
        artifacts[stage] = c.artifact_hashes(directory / stage)
    return {'directory': str(directory), 'build': build,
            'packet_sha256': digest(directory / 'packet.json'),
            'contract_sha256': digest(contract_path), 'stages': stages,
            'stage_artifact_sha256': artifacts, 'activation_qualified': False}


def final_campaign_proof(directory):
    # Keep the original eleven-stage raw assessor intact, then require the full
    # final seven-native bridge and exact source of the reused short cohort.
    result = campaign_proof(directory)
    require(Path(directory).resolve() == adapter.PACKET.resolve(),
            'the exact final continuation is required')
    state = adapter.status()
    require(state['paired_matrix_complete'] is True
            and all(row['status'] == 'passed' for row in state['stages'][:11])
            and all(row['status'] == 'unrun' for row in state['stages'][11:]),
            'all eight final paired studies must pass and legacy lifetimes stay unrun')
    result['all_seven_native_proofs'] = adapter.native_proof()
    result['continuation_adapter_sha256'] = digest(adapter.__file__)
    result['continuation_preparation_sha256'] = digest(adapter.HERE / 'preparation.json')
    return result


def freeze(mode, campaign):
    require(mode in MODES, 'unknown decode mode')
    destination = HERE / mode
    require(not destination.exists() and not (OUT / mode).exists(), 'already frozen or attempted')
    protocol = expected_protocol(mode)
    proof = final_campaign_proof(campaign)
    for name, count in [('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6), ('delivery', 6), ('startup', 6)]:
        check = (HERE / (name + '-checks.stderr')).read_text()
        require(f'Ran {count} tests' in check and check.rstrip().endswith('OK'),
                'prospective schedule qualification checks missing')
    value = {'format': 'slotstream-guarded-long-decode-v1', 'frozen_at': now(),
             'mode': mode, 'campaign': str(Path(campaign).resolve()), 'proof': proof,
             'dependencies': dependencies(), 'policy': policy(mode),
             'maximum_work_seconds': SECONDS, 'cleanup_seconds': CLEANUP_SECONDS,
             'classification': 'One original fixed 512-output cohort on exact V519 after native and eight-paired acceptance. No replacement, cross-mode pooling, activation or broader steady-state claim.'}
    destination.mkdir(parents=True, exist_ok=False)
    c.write_new(destination / 'protocol.json', protocol)
    value['protocol_sha256'] = digest(destination / 'protocol.json')
    c.write_new(destination / 'binding.json', value)
    return {'frozen': mode, 'binding_sha256': digest(destination / 'binding.json'), 'model_launched': False}


def load(mode):
    require(mode in MODES, 'unknown decode mode')
    destination = HERE / mode
    value = c.read(destination / 'binding.json')
    require(value.get('format') == 'slotstream-guarded-long-decode-v1' and value.get('mode') == mode,
            'binding mode or format changed')
    require(value.get('dependencies') == dependencies(), 'bound executor, fixture or dependency changed')
    require(value.get('policy') == policy(mode) and value.get('maximum_work_seconds') == SECONDS
            and value.get('cleanup_seconds') == CLEANUP_SECONDS, 'original guard or allowance changed')
    require(value.get('protocol_sha256') == digest(destination / 'protocol.json'), 'protocol bytes changed')
    protocol = c.read(destination / 'protocol.json')
    validate_protocol(mode, protocol)
    require(value.get('proof') == final_campaign_proof(value['campaign']), 'bound native/eight-paired evidence changed')
    return value, protocol


def assess_cohort(protocol, completion, rows, warmups):
    # The original reporter validates full output, all first jobs, both modes,
    # exact IDs/text, 511 emission intervals, resource/power/VM observations,
    # ordering and exclusions, including excluded cells' numerical correctness.
    report = study.analyze(rows, warmups, protocol, completion)
    summary = c.bench.summaries(rows, 'reference', protocol['comparison_basis'])
    acceptance = c.bench.acceptance_results(summary, protocol['acceptance'])
    require(acceptance == completion.get('acceptance')
            and completion.get('startup_acceptance') is None,
            'recorded acceptance differs from raw data or the original contract')
    metrics = report['metrics']
    enough = all(x['measured'] is True and x['clean_pairs'] >= study.MINIMUM_PAIRS for x in metrics.values())
    # Apply the same five-percent request bound to the stricter cohort whose
    # first jobs and measured requests are both eligible for long TPS reporting.
    regression = metrics['client_seconds']['median_improvement_percent']
    within_bound = enough and regression >= -100 * protocol['acceptance']['maximum_median_client_regression']
    passed = bool(acceptance and all(x.get('passed') is True for x in acceptance) and within_bound)
    return {'completed': True, 'passed': passed, 'qualified': passed, 'cells': len(rows),
            'all_metrics_measurable': enough, 'eligible_cohort_request_nonregression': bool(within_bound),
            'acceptance': acceptance, 'summary': summary, 'measurement': report,
            'activation_performed': False}


def assess_raw(raw, protocol, build):
    manifest, completion = c.read(raw / 'manifest.json'), c.read(raw / 'completion.json')
    require(manifest.get('protocol') == protocol
            and manifest.get('arm_builds') == {arm: build for arm in ('reference', 'combined')},
            'executed build, controls or protocol differs from the binding')
    rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
    warmups = {(n, arm): c.read(raw / f'{n}-{arm}/warmup.json')
               for n in range(1, study.ROUNDS + 1) for arm in ('reference', 'combined')}
    validate_schedule_evidence(manifest, rows)
    return assess_cohort(protocol, completion, rows, warmups)


def execute_bound(mode, *args, **kwargs):
    # Keep the exercised ownership, environment restoration, progress, signals,
    # cleanup and receipt implementation exactly; explicitly bind V341 observer.
    namespace = dict(core.__dict__)
    namespace.update(load=lambda: load(mode), guarded_run=guarded_run)
    exec(compile(EXECUTE_SOURCE, str(core.__file__) + '::execute', 'exec'), namespace)
    return namespace['execute'](*args, **kwargs)


def run(mode, deadline):
    require(mode in MODES, 'unknown decode mode')
    allowance(deadline, SECONDS + CLEANUP_SECONDS)
    value, protocol = load(mode)
    destination, raw = HERE / mode / 'execution', OUT / mode
    require(not destination.exists() and not raw.exists(), 'attempted study cannot retry or resume')
    limit, before, thermal = core.readiness(deadline, SECONDS + CLEANUP_SECONDS,
                                           policy(mode)['startup_reclaimable_bytes'] / 10**9)
    command = [sys.executable, str(HERE / 'driver/serve_bench.py'), '--protocol',
               str(HERE / mode / 'protocol.json'), '--out', str(raw)]
    attempt = {'started_at': now(), 'deadline_utc': deadline, 'command': command,
               'environment': {}, 'build': value['proof']['build'], 'before': before,
               'thermal_prelaunch': thermal, 'policy': policy(mode),
               'binding_sha256': digest(HERE / mode / 'binding.json'),
               'classification': value['classification']}
    def assessment(code):
        load(mode)
        require(code in (0, 1), 'serving process did not complete normally')
        result = assess_raw(raw, protocol, value['proof']['build'])
        c.write_new(destination / 'assessment.json', result)
        return {k: v for k, v in result.items() if k not in ('measurement', 'summary')}
    result = execute_bound(mode, command, destination, SECONDS, policy(mode), assessment,
                           limit, attempt, progress_path=raw / 'results.jsonl')
    # Preserve every partial raw artifact too. Interrupted identities stay used.
    c.write_new(destination / 'artifact-sha256.json', c.artifact_hashes(raw))
    result['execution_receipt_sha256'] = digest(destination / 'receipt.json')
    result['artifact_sha256'] = digest(destination / 'artifact-sha256.json')
    result['activation_qualified'] = False
    c.write_new(destination / 'qualification.json', result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('check', 'freeze', 'run'))
    parser.add_argument('--mode', choices=('on',), required=True)
    parser.add_argument('--campaign', type=Path)
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'freeze':
            require(args.campaign is not None, 'qualified campaign path required')
            result = freeze(args.mode, args.campaign)
        elif args.action == 'check':
            if args.campaign is not None:
                proof = final_campaign_proof(args.campaign)
                result = {'native_and_paired_qualified': True, 'stages': len(proof['stages']), 'model_launched': False}
            else:
                load(args.mode)
                result = {'binding_valid': True, 'model_launched': False}
        else:
            require(args.deadline is not None, 'fresh explicitly granted deadline required')
            result = run(args.mode, args.deadline)
    print(json.dumps({k: v for k, v in result.items() if k not in ('before', 'after', 'summary')}, indent=2))
    return 0 if args.action != 'run' or result.get('qualified') else 1


def validate_schedule_evidence(manifest, rows):
    expected = {name: digest(HERE / 'driver' / name) for name in
                ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')}
    expected.update({name: digest(ROOT / 'Tools' / name) for name in
                     ('thermal_readiness.py', 'optimization_readiness.py')})
    require(manifest.get('harness_sources') == expected
            and manifest.get('harness_sha256') == expected['serve_bench.py'],
            'actual scheduling driver/helper closure differs')
    require(len(rows) == 32, 'all original cells must carry readiness evidence')
    for row in rows:
        state = row.get('thermal_settle') or {}
        require(row.get('cooldown_seconds') == 0 and all(state.get(key) is True
                for key in ('enabled', 'reserved', 'before_launch_only', 'request_acceptance_unchanged')),
                'sampled readiness missing or bypassed')
        elapsed, stable, samples = (state.get(key) for key in
                                    ('seconds', 'sampled_nominal_seconds', 'samples'))
        require(type(elapsed) in (int, float) and type(stable) in (int, float)
                and 30 <= stable <= elapsed <= 600
                and type(samples) is int and samples >= 16,
                'readiness stability or bounded observation evidence is invalid')


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 1f2b9cf5e1bef73f0159959ae5e0375f827e2e2ba66ae7cca46c82f6f35cf12a

Encoding: `utf-8`. Original bytes: 16316.

````````````text
"""Model-free runner contract, refusal, raw reporting and cleanup tests.

Synthetic observations below prove the harness only, never inference performance.
"""
import copy
import datetime
import importlib.util
import json
import os
from pathlib import Path
import signal
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

import run as runner

sys.path.insert(0, str(runner.BASE / 'long-decode-measurement-v340'))
fixture_module = runner.module('original_long_fixture', runner.BASE / 'long-decode-measurement-v340/long_decode_test.py')


def complete(rows, protocol, completion):
    completion['acceptance'] = runner.c.bench.acceptance_results(
        runner.c.bench.summaries(rows, 'reference', protocol['comparison_basis']), protocol['acceptance'])
    completion['startup_acceptance'] = None


def cohort():
    rows, warmups, _, completion = fixture_module.fixture()
    protocol = runner.expected_protocol('off')
    for row in rows:
        row['metrics']['stats']['requestSeconds'] = row['client_seconds']
    complete(rows, protocol, completion)
    return protocol, completion, rows, warmups


def campaign_fixture(directory):
    build = runner.c.bench.verified_build(runner.controls.BINARY)
    contract = {'format': 'slotstream-qualification-v1',
                'build_identity': {k: build['identity'][k] for k in runner.c.IDENTITY_KEYS},
                'native': {name: {'command': [build['binary'], 'optimization-state-check', '--variant', variant,
                                              '--model', runner.controls.MODEL, '--json'], 'environment': {}}
                           for name, variant in runner.c.NATIVE.items()},
                'paired_protocols': {n: runner.controls.materialize(n) for n in runner.c.PAIRED}}
    runner.c.write_new(directory / 'qualification-contract.json', contract)
    packet = {'format': 'slotstream-campaign-v1', 'build': build, 'stages': list(runner.c.STAGES),
              'native_policy': runner.c.NATIVE_POLICY,
              'contract_sha256': runner.digest(directory / 'qualification-contract.json'),
              'drivers': {n: runner.digest(runner.ROOT / 'Tools' / n) for n in runner.c.DRIVERS},
              'templates': {p.name: runner.digest(p) for p in sorted(runner.c.TEMPLATES.glob('*.json'))}}
    runner.c.write_new(directory / 'packet.json', packet)
    for name in runner.c.NATIVE:
        path = directory / 'native' / name / 'evidence'
        path.mkdir(parents=True)
        runner.c.write_new(path / 'stdout.txt', {'synthetic': True})
    return packet, contract


class RunnerTests(unittest.TestCase):
    def test_both_original_long_drafts_and_resource_policies_are_exact(self):
        for mode, memory, startup, owned in [('off', 10, 13, 12), ('on', 12, 18, 14)]:
            p = runner.expected_protocol(mode)
            self.assertEqual((p['rounds'], p['max_tokens'], p['minimum_output_tokens']), (16, 512, 512))
            self.assertEqual(p['memory_gb'], memory)
            self.assertEqual(p['maximum_sampled_footprint_bytes'], memory * 10**9)
            self.assertEqual(p['acceptance']['replacement_rounds'], 0)
            self.assertEqual(p['arms']['reference']['env']['SLOTSTREAM_OPT_NGRAM_ROWS'], '0')
            self.assertEqual(p['arms']['combined']['env']['SLOTSTREAM_OPT_NGRAM_ROWS'], '1')
            self.assertEqual(p['arms']['combined']['env']['SLOTSTREAM_OPT_MTP_TAIL'], '0')
            if mode == 'on':
                self.assertTrue(all(a['env']['SLOTSTREAM_DRAFT_DEPTH'] == '1' for a in p['arms'].values()))
            self.assertEqual(runner.policy(mode), {
                'startup_reclaimable_bytes': startup * 10**9, 'minimum_live_reclaimable_bytes': 3 * 10**9,
                'maximum_owned_rss_bytes': owned * 10**9, 'sample_interval_seconds': .2,
                'maximum_build_seconds': 12600, 'stop_on_new_swapouts': True})

    def test_changed_controls_workload_criteria_and_budget_refuse(self):
        for field in ('controls', 'binary', 'minimum', 'replacement', 'budget', 'depth'):
            p = runner.expected_protocol('on')
            if field == 'controls': p['arms']['reference']['env']['SLOTSTREAM_OPT_MTP_TAIL'] = '1'
            elif field == 'binary': p['frozen_binary_sha256'] = '0' * 64
            elif field == 'minimum': p['minimum_output_tokens'] = 16
            elif field == 'replacement': p['acceptance']['replacement_rounds'] = 1
            elif field == 'budget': p['memory_gb'] = 13
            else: p['arms']['combined']['env']['SLOTSTREAM_DRAFT_DEPTH'] = '2'
            with self.subTest(field=field), self.assertRaisesRegex(ValueError, 'protocol changed'):
                runner.validate_protocol('on', p)

    def test_original_drivers_reporter_and_guard_are_explicit_dependencies(self):
        dependencies = runner.dependencies()
        self.assertIn(str(runner.ROOT / 'Tools/serve_bench.py'), dependencies)
        self.assertIn(str(runner.ROOT / 'Tools/optimization_results.py'), dependencies)
        self.assertIn(str((runner.BASE / 'pressure-footprint-v341/guard_with_footprint.py').resolve()), dependencies)
        self.assertEqual(dependencies[str(Path(runner.study.__file__).resolve())],
                         '0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820')

    def test_dependency_identity_is_stable_across_macos_tmp_alias(self):
        before = runner.dependencies()
        with mock.patch.object(runner, '__file__', str(Path(runner.__file__).resolve())):
            self.assertEqual(runner.dependencies(), before)

    def test_prior_real_campaign_cannot_qualify_current_composition(self):
        prior = runner.ROOT / '.build/optimization/joined-state-eval-campaign-v305'
        with mock.patch.object(runner.c, 'assess_stage') as assess, self.assertRaisesRegex(ValueError, 'another build'):
            runner.campaign_proof(prior)
        assess.assert_not_called()

    def test_three_native_and_all_eight_paired_stages_are_recomputed(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary); campaign_fixture(root)
            with mock.patch.object(runner.c, 'assess_stage', return_value={'synthetic': True}) as assess, \
                    mock.patch.object(runner.native, 'assess', return_value={'synthetic': True}) as native:
                proof = runner.campaign_proof(root)
            self.assertEqual(assess.call_count, 11)
            self.assertEqual(native.call_count, 3)
            self.assertEqual(set(proof['stages']), {f'native/{n}' for n in runner.c.NATIVE} |
                             {f'paired/{n}' for n in runner.c.PAIRED})
            self.assertFalse(proof['activation_qualified'])

    def test_failed_raw_stage_and_missing_new_native_assertion_refuse(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary); campaign_fixture(root)
            with mock.patch.object(runner.c, 'assess_stage', side_effect=ValueError('raw failure')), \
                    self.assertRaisesRegex(ValueError, 'raw failure'):
                runner.campaign_proof(root)
            with mock.patch.object(runner.c, 'assess_stage', return_value={'synthetic': True}), \
                    mock.patch.object(runner.native, 'assess', side_effect=ValueError('new assertion missing')), \
                    self.assertRaisesRegex(ValueError, 'new assertion missing'):
                runner.campaign_proof(root)

    def test_changed_matrix_control_cannot_hide_behind_passed_receipts(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary); packet, contract = campaign_fixture(root)
            contract['paired_protocols']['unique-prose']['arms']['combined']['env']['SLOTSTREAM_OPT_MTP_TAIL'] = '1'
            (root / 'qualification-contract.json').write_text(json.dumps(contract))
            packet['contract_sha256'] = runner.digest(root / 'qualification-contract.json')
            (root / 'packet.json').write_text(json.dumps(packet))
            with mock.patch.object(runner.c, 'assess_stage') as assess, self.assertRaisesRegex(ValueError, 'exact eight'):
                runner.campaign_proof(root)
            assess.assert_not_called()

    def test_missing_proof_creates_no_frozen_or_execution_directory(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            with mock.patch.object(runner, 'HERE', root / 'control'), mock.patch.object(runner, 'OUT', root / 'raw'), \
                    mock.patch.object(runner, 'campaign_proof', side_effect=ValueError('incomplete')), \
                    self.assertRaisesRegex(ValueError, 'incomplete'):
                runner.freeze('off', root / 'missing')
            self.assertEqual(list(root.iterdir()), [])

    def test_full_interval_required_before_binding_read_or_attempt(self):
        for deadline in ('2000-01-01T00:00:00Z', '2030-01-01T00:00:00',
                         (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(minutes=10)).isoformat()):
            with mock.patch.object(runner, 'load') as load, mock.patch.object(runner, 'execute_bound') as execute, \
                    self.subTest(deadline=deadline), self.assertRaises(ValueError):
                runner.run('off', deadline)
            load.assert_not_called(); execute.assert_not_called()

    def test_attempted_study_cannot_retry_before_preflight_or_process(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary); (root / 'off/execution').mkdir(parents=True)
            with mock.patch.object(runner, 'HERE', root), mock.patch.object(runner, 'OUT', root / 'raw'), \
                    mock.patch.object(runner, 'load', return_value=({}, {})), \
                    mock.patch.object(runner.core, 'readiness') as readiness, \
                    mock.patch.object(runner, 'execute_bound') as execute, self.assertRaisesRegex(ValueError, 'cannot retry'):
                runner.run('off', '2030-01-01T00:00:00Z')
            readiness.assert_not_called(); execute.assert_not_called()

    def test_resource_refusal_does_not_claim_study(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            with mock.patch.object(runner, 'HERE', root / 'control'), mock.patch.object(runner, 'OUT', root / 'raw'), \
                    mock.patch.object(runner, 'load', return_value=({}, {})), \
                    mock.patch.object(runner.core, 'readiness', side_effect=ValueError('insufficient memory')), \
                    mock.patch.object(runner, 'execute_bound') as execute, self.assertRaisesRegex(ValueError, 'insufficient memory'):
                runner.run('on', '2030-01-01T00:00:00Z')
            execute.assert_not_called(); self.assertEqual(list(root.iterdir()), [])

    def test_complete_original_synthetic_cohort_reports_units_without_activation(self):
        result = runner.assess_cohort(*cohort())
        self.assertTrue(result['qualified'])
        self.assertEqual(result['cells'], 32)
        self.assertAlmostEqual(result['measurement']['metrics']['active_tps']['median_improvement_percent'], 25)
        self.assertAlmostEqual(result['measurement']['metrics']['sampled_process_peak_bytes']['median_improvement_percent'], 12.5)
        self.assertFalse(result['activation_performed'])
        self.assertFalse(result['measurement']['activation_qualified'])

    def test_early_eos_missing_intervals_and_partial_cohorts_refuse(self):
        for mutation in ('eos', 'interval', 'partial', 'warmup'):
            protocol, completion, rows, warmups = cohort()
            if mutation == 'eos': rows[0]['metrics']['stats']['finishReason'] = 'eos'
            elif mutation == 'interval': rows[0]['metrics']['stats']['interTokenSeconds'].pop()
            elif mutation == 'partial': completion['stopped_early'] = True
            else: warmups.pop((1, 'reference'))
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                runner.assess_cohort(protocol, completion, rows, warmups)

    def test_output_mismatch_in_excluded_cell_is_not_a_timing_exclusion(self):
        protocol, completion, rows, warmups = cohort()
        rows[0]['valid'] = False
        rows[0]['metrics']['output_ids'][-1] += 1
        with self.assertRaisesRegex(ValueError, 'mismatch anywhere'):
            runner.assess_cohort(protocol, completion, rows, warmups)

    def test_missing_minimum_clean_pairs_cannot_qualify(self):
        protocol, completion, rows, warmups = cohort()
        for row in rows:
            if row['round'] <= 9:
                row['startup_and_warmup_valid'] = False
        result = runner.assess_cohort(protocol, completion, rows, warmups)
        self.assertFalse(result['qualified'])
        self.assertFalse(result['all_metrics_measurable'])
        self.assertEqual(result['measurement']['metrics']['active_tps']['clean_pairs'], 7)

    def test_first_job_exclusions_cannot_mask_remaining_cohort_regression(self):
        protocol, completion, rows, warmups = cohort()
        for row in rows:
            if row['round'] <= 8:
                row['startup_and_warmup_valid'] = False
            if row['arm'] == 'combined':
                row['client_seconds'] = 30 if row['round'] <= 8 else 63.6
        complete(rows, protocol, completion)
        self.assertTrue(all(x['passed'] for x in completion['acceptance']))
        result = runner.assess_cohort(protocol, completion, rows, warmups)
        self.assertTrue(result['all_metrics_measurable'])
        self.assertFalse(result['eligible_cohort_request_nonregression'])
        self.assertFalse(result['qualified'])

    def test_recorded_acceptance_cannot_be_substituted(self):
        protocol, completion, rows, warmups = cohort()
        completion['acceptance'] = [{'passed': True}]
        with self.assertRaisesRegex(ValueError, 'recorded acceptance differs'):
            runner.assess_cohort(protocol, completion, rows, warmups)

    def test_raw_manifest_must_match_protocol_and_both_exact_builds(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            runner.c.write_new(root / 'manifest.json', {'protocol': {'wrong': True}, 'arm_builds': {}})
            runner.c.write_new(root / 'completion.json', {})
            with self.assertRaisesRegex(ValueError, 'executed build'):
                runner.assess_raw(root, runner.expected_protocol('off'), {'binary': 'synthetic'})

    def test_reused_executor_restores_environment_and_preserves_failure(self):
        with tempfile.TemporaryDirectory() as temporary:
            target = Path(temporary) / 'execution'
            original_handlers = {n: signal.getsignal(n) for n in (signal.SIGINT, signal.SIGTERM)}
            with mock.patch.dict(os.environ, {'SLOTSTREAM_RUNNER_TEST_SENTINEL': 'synthetic-only'}), \
                    mock.patch.object(runner, 'load', return_value=({}, {})), \
                    mock.patch.object(runner.core, 'preflight', return_value={}), \
                    mock.patch.object(runner.core, 'competing_jobs', return_value=[]), \
                    mock.patch.object(runner, 'guarded_run', return_value=SimpleNamespace(returncode=130)) as guard:
                def reject(code):
                    self.assertNotIn('SLOTSTREAM_RUNNER_TEST_SENTINEL', os.environ)
                    raise ValueError('synthetic interrupted child')
                result = runner.execute_bound('off', ['synthetic-not-executed'], target, 12600,
                    runner.policy('off'), reject, 2e10, {'classification': 'MODEL-FREE SYNTHETIC TEST'})
                self.assertEqual(os.environ['SLOTSTREAM_RUNNER_TEST_SENTINEL'], 'synthetic-only')
            self.assertFalse(result['qualified'])
            self.assertTrue(result['cleanup_complete'])
            self.assertIn('synthetic interrupted child', result['error'])
            self.assertEqual(guard.call_args.kwargs['policy'], runner.policy('off'))
            self.assertEqual(original_handlers, {n: signal.getsignal(n) for n in original_handlers})
            self.assertFalse(runner.c.read(target / 'receipt.json')['passed'])


if __name__ == '__main__':
    unittest.main()

````````````

## Artifact SHA-256 0ddc6fe5295fe5712c6f853405853ed932f0af8b672db6d690c78dd591713844

Encoding: `utf-8`. Original bytes: 574.

````````````text
test_actual_driver_and_helper_bytes_are_checked_and_bound (__main__.Checks) ... ok
test_all_cells_need_full_stable_evidence (__main__.Checks) ... ok
test_only_two_scheduling_fields_differ_from_both_unrun_drafts (__main__.Checks) ... ok
test_original_raw_assessor_is_not_reached_if_readiness_is_missing (__main__.Checks) ... ok
test_original_request_and_cleanup_bodies_restore_exactly (__main__.Checks) ... ok
test_schedule_cannot_drift_or_be_disabled (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 2.333s

OK

````````````

## Artifact SHA-256 c2440f8f1093276455e5717d77f7d57a4306c62af36837b4c443ad1d7af6ec4a

Encoding: `utf-8`. Original bytes: 7246.

````````````text
{
  "classification": "Prospective exact MTP-on startup-swap-in exclusion method, retaining complete work and original joint-pair timing eligibility. The already qualified off cohort and both failed on identities remain unchanged.",
  "prior": "/private/tmp/slotstream-optimization-execution/final-composition-long-decode-v571",
  "prior_executor_sha256": "431c456c866fecc976256f95105b8dc12e7893cc2563e90a614274a0aee884de",
  "run_edits": [
    {
      "old": "The original V340 reporter, serving driver and ownership guard stay unchanged.",
      "new": "The original V340 reporter and ownership guard stay unchanged. An isolated\nserving driver adds sampled prelaunch readiness; only the two unfrozen\nlong cohorts replace the fixed sleep. Full work and acceptance remain intact."
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-composition-long-decode-v571'",
      "new": "OUT = ROOT / '.build/optimization/final-long-adaptive-schedule-v581'"
    },
    {
      "old": "    return result\n\n\ndef validate_protocol(mode, value):",
      "new": "    result['between_cells_seconds'] = 0\n    result['before_cell_thermal_settle'] = {\n        'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2}\n    return result\n\n\ndef validate_protocol(mode, value):"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / name for name in ('prepare.py', 'schedule_checks.py',\n              'thermal_checks.py', 'driver-transformation.json', 'schedule-transformation.json')]\n    paths += [HERE / 'driver' / name for name in ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')]\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    },
    {
      "old": "    return assess_cohort(protocol, completion, rows, warmups)\n",
      "new": "    validate_schedule_evidence(manifest, rows)\n    return assess_cohort(protocol, completion, rows, warmups)\n"
    },
    {
      "old": "    command = [sys.executable, str(ROOT / 'Tools/serve_bench.py'), '--protocol',\n",
      "new": "    command = [sys.executable, str(HERE / 'driver/serve_bench.py'), '--protocol',\n"
    },
    {
      "old": "    protocol = expected_protocol(mode)\n    proof = final_campaign_proof(campaign)\n",
      "new": "    protocol = expected_protocol(mode)\n    proof = final_campaign_proof(campaign)\n    for name, count in [('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6)]:\n        check = (HERE / (name + '-checks.stderr')).read_text()\n        require(f'Ran {count} tests' in check and check.rstrip().endswith('OK'),\n                'prospective schedule qualification checks missing')\n"
    },
    {
      "old": "if __name__ == '__main__':\n    raise SystemExit(main())\n",
      "new": "def validate_schedule_evidence(manifest, rows):\n    expected = {name: digest(HERE / 'driver' / name) for name in\n                ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')}\n    expected.update({name: digest(ROOT / 'Tools' / name) for name in\n                     ('thermal_readiness.py', 'optimization_readiness.py')})\n    require(manifest.get('harness_sources') == expected\n            and manifest.get('harness_sha256') == expected['serve_bench.py'],\n            'actual scheduling driver/helper closure differs')\n    require(len(rows) == 32, 'all original cells must carry readiness evidence')\n    for row in rows:\n        state = row.get('thermal_settle') or {}\n        require(row.get('cooldown_seconds') == 0 and all(state.get(key) is True\n                for key in ('enabled', 'reserved', 'before_launch_only', 'request_acceptance_unchanged')),\n                'sampled readiness missing or bypassed')\n        elapsed, stable, samples = (state.get(key) for key in\n                                    ('seconds', 'sampled_nominal_seconds', 'samples'))\n        require(type(elapsed) in (int, float) and type(stable) in (int, float)\n                and 30 <= stable <= elapsed <= 600\n                and type(samples) is int and samples >= 16,\n                'readiness stability or bounded observation evidence is invalid')\n\n\nif __name__ == '__main__':\n    raise SystemExit(main())\n"
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-long-adaptive-schedule-v581'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'"
    },
    {
      "old": "'startup_reclaimable_bytes': (13 if mode == 'off' else 15) * 10**9",
      "new": "'startup_reclaimable_bytes': (13 if mode == 'off' else 18) * 10**9"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    },
    {
      "old": "[('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6)]",
      "new": "[('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6), ('delivery', 6)]"
    },
    {
      "old": "parser.add_argument('--mode', choices=tuple(MODES), required=True)",
      "new": "parser.add_argument('--mode', choices=('on',), required=True)"
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'"
    },
    {
      "old": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']\n",
      "new": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']\n"
    },
    {
      "old": "('schedule', 6), ('delivery', 6)]",
      "new": "('schedule', 6), ('delivery', 6), ('startup', 6)]"
    }
  ],
  "original_serving_driver_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "original_reporter_sha256": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820",
  "original_startup_swapin_rule_unchanged": false,
  "all_requests_acceptance_and_full_allowances_preserved": true,
  "model_launched": false,
  "maximum_ideal_idle_saving_seconds_both_modes": 1920,
  "limitations": [
    "Nominal thermal state does not prove constant GPU clocks or thermal equilibrium.",
    "Eligibility and all-output checks remain authoritative. No failed study is automatically retried.",
    "This changes benchmark waiting time, not inference speed."
  ],
  "initial_check_correction": "Check original prerequisites before reading scheduler qualification receipts, preserving the original refusal precedence. No inference was launched.",
  "delivery_correction": {
    "prior": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581",
    "original_protocol_unchanged": true,
    "mtp_on_startup_gb": 18,
    "fixed_footprint_cap_gb": 12,
    "full_output_work_preserved": true,
    "legacy_startup_swap_abort_unchanged": false
  },
  "startup_method_correction": {
    "original_reporter_and_pair_exclusions_unchanged": true,
    "startup_swapins": "exclude entire A/B pair while completing the fixed workload",
    "swapouts_pressure_footprint": "abort unchanged",
    "partial_prior_not_reused": true
  }
}

````````````

## Artifact SHA-256 eaed82055d053f5f7449fb0c7a568242589ad078681a26fcc0fff54c471d89cd

Encoding: `utf-8`. Original bytes: 5707.

````````````text
"""Prospective scheduling checks; all observations and launches here are synthetic."""
import copy
import inspect
from pathlib import Path
import unittest
from unittest.mock import patch

import run as m


def manifest():
    sources = {name: m.digest(m.HERE / 'driver' / name) for name in
               ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py')}
    sources.update({name: m.digest(m.ROOT / 'Tools' / name) for name in
                    ('thermal_readiness.py', 'optimization_readiness.py')})
    return {'harness_sources': sources, 'harness_sha256': sources['serve_bench.py']}


def rows():
    return [{'cooldown_seconds': 0, 'thermal_settle': {
        'enabled': True, 'reserved': True, 'before_launch_only': True,
        'request_acceptance_unchanged': True, 'seconds': 30.1,
        'sampled_nominal_seconds': 30.1, 'samples': 16}}
        for _ in range(32)]


class Checks(unittest.TestCase):
    def test_only_two_scheduling_fields_differ_from_both_unrun_drafts(self):
        for mode in ('off', 'on'):
            current = m.expected_protocol(mode)
            self.assertEqual(current.pop('before_cell_thermal_settle'), {
                'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2})
            self.assertEqual(current['between_cells_seconds'], 0)
            current['between_cells_seconds'] = 60
            prior = m.c.read(m.controls.HERE / 'drafts' / ('long-' + mode + '.json'))
            self.assertEqual(current, prior)
            self.assertFalse((m.BASE / 'final-composition-long-decode-v571' / mode).exists())

    def test_schedule_cannot_drift_or_be_disabled(self):
        for field in ('duration', 'bound', 'poll', 'sleep', 'missing'):
            value = m.expected_protocol('on')
            if field == 'duration': value['before_cell_thermal_settle']['stable_seconds'] = 29
            elif field == 'bound': value['before_cell_thermal_settle']['maximum_wait_seconds'] = 601
            elif field == 'poll': value['before_cell_thermal_settle']['poll_seconds'] = 10
            elif field == 'sleep': value['between_cells_seconds'] = 30
            else: value.pop('before_cell_thermal_settle')
            with self.subTest(field=field), self.assertRaises(ValueError):
                m.validate_protocol('on', value)

    def test_all_cells_need_full_stable_evidence(self):
        m.validate_schedule_evidence(manifest(), rows())
        for field, value in [('enabled', False), ('reserved', False), ('before_launch_only', False),
                             ('request_acceptance_unchanged', False), ('seconds', 601),
                             ('seconds', float('nan')), ('sampled_nominal_seconds', 29.99),
                             ('sampled_nominal_seconds', 31), ('samples', 15), ('samples', True)]:
            bad = rows(); bad[-1]['thermal_settle'][field] = value
            with self.subTest(field=field, value=value), self.assertRaises(ValueError):
                m.validate_schedule_evidence(manifest(), bad)
        for bad in (rows()[:-1], rows() + rows()[:1], [{**row, 'cooldown_seconds': 60} for row in rows()]):
            with self.assertRaises(ValueError): m.validate_schedule_evidence(manifest(), bad)

    def test_actual_driver_and_helper_bytes_are_checked_and_bound(self):
        source = manifest()
        for key in source['harness_sources']:
            bad = copy.deepcopy(source); bad['harness_sources'][key] = '0' * 64
            with self.subTest(key=key), self.assertRaises(ValueError):
                m.validate_schedule_evidence(bad, rows())
        bad = copy.deepcopy(source); bad['harness_sha256'] = '0' * 64
        with self.assertRaises(ValueError): m.validate_schedule_evidence(bad, rows())
        deps = m.dependencies()
        for name in ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py'):
            path = (m.HERE / 'driver' / name).resolve()
            self.assertEqual(deps[str(path)], m.digest(path))

    def test_original_request_and_cleanup_bodies_restore_exactly(self):
        record = m.c.read(m.HERE / 'driver-transformation.json')
        source = (m.HERE / 'driver/serve_bench.py').read_text()
        for item in reversed(record['edits']):
            self.assertEqual(source.count(item['new']), 1)
            source = source.replace(item['new'], item['old'])
        self.assertEqual(source, (m.ROOT / 'Tools/serve_bench.py').read_text())
        self.assertIn("str(HERE / 'driver/serve_bench.py')", inspect.getsource(m.run))
        self.assertEqual(m.EXECUTE_SOURCE, inspect.getsource(m.core.execute))
        self.assertEqual(m.digest(m.HERE / 'driver/thermal_settle.py'),
                         '13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad')

    def test_original_raw_assessor_is_not_reached_if_readiness_is_missing(self):
        import tempfile
        with tempfile.TemporaryDirectory() as directory:
            raw = Path(directory)
            protocol, build = m.expected_protocol('off'), {'synthetic': True}
            m.c.write_new(raw / 'manifest.json', {
                'protocol': protocol, 'arm_builds': {arm: build for arm in protocol['arms']}})
            m.c.write_new(raw / 'completion.json', {})
            (raw / 'results.jsonl').write_text('')
            for n in range(1, 17):
                for arm in protocol['arms']:
                    cell = raw / f'{n}-{arm}'; cell.mkdir()
                    m.c.write_new(cell / 'warmup.json', {})
            with patch.object(m, 'assess_cohort') as assess, self.assertRaises(ValueError):
                m.assess_raw(raw, protocol, build)
            assess.assert_not_called()


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 f2e9a377263a8b3149a8e5c77e266836dab8a5beddc1d66b8eefbf4c07ada99b

Encoding: `utf-8`. Original bytes: 1331.

````````````text
test_exact_profile_can_finish_work_but_startup_swapins_remain_ineligible (__main__.Checks) ... ok
test_new_swapouts_still_abort (__main__.Checks) ... ok
test_original_joint_assessor_excludes_the_pair_and_still_checks_its_outputs (__main__.Checks) ... ok
test_original_physical_and_pressure_stops_remain (__main__.Checks) ... ERROR
test_other_profiles_keep_the_legacy_startup_abort (__main__.Checks) ... ok
test_unavailable_invalid_or_reset_counters_abort (__main__.Checks) ... ok

======================================================================
ERROR: test_original_physical_and_pressure_stops_remain (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/startup_checks.py", line 82, in test_original_physical_and_pressure_stops_remain
    runner.core.require_normal({'level': 2})
  File "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py", line 20, in require_normal
    raise RuntimeError(f'OS memory pressure is not normal (observed level={level!r}); '
RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible

----------------------------------------------------------------------
Ran 6 tests in 1.099s

FAILED (errors=1)

````````````

## Artifact SHA-256 e741a98393073d249a67bebb576802d5e46426c414fe9528ee68dec5b3ab7f4f

Encoding: `utf-8`. Original bytes: 575.

````````````text
test_exact_profile_can_finish_work_but_startup_swapins_remain_ineligible (__main__.Checks) ... ok
test_new_swapouts_still_abort (__main__.Checks) ... ok
test_original_joint_assessor_excludes_the_pair_and_still_checks_its_outputs (__main__.Checks) ... ok
test_original_physical_and_pressure_stops_remain (__main__.Checks) ... ok
test_other_profiles_keep_the_legacy_startup_abort (__main__.Checks) ... ok
test_unavailable_invalid_or_reset_counters_abort (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 1.133s

OK

````````````

## Artifact SHA-256 48836d02f03834ebbc8d758c10de5691adcc27f66b53d0ac52d1b27535234fc4

Encoding: `utf-8`. Original bytes: 243.

````````````text
{
  "correction": "The original pressure guard correctly raises RuntimeError; the new test incorrectly expected ValueError. Only the test expectation changed.",
  "runtime_unchanged": true,
  "initial_test_source_and_output_preserved": true
}

````````````

## Artifact SHA-256 dd884257776632c8ed2022701b46717e118b52a60ffd76dd0743679dfe1d500c

Encoding: `utf-8`. Original bytes: 4530.

````````````text
"""Synthetic startup exclusions must never admit contaminated timing or unsafe work."""
import copy
import unittest

import run as runner
import run_test
from guard_with_footprint import check_sample

driver = runner.module('startup_method_driver', runner.HERE / 'driver/serve_bench.py')


class Checks(unittest.TestCase):
    def test_exact_profile_can_finish_work_but_startup_swapins_remain_ineligible(self):
        protocol = runner.expected_protocol('on')
        before = {'swapins': 100, 'swapouts': 50}
        after = {'swapins': 108, 'swapouts': 50}
        self.assertFalse(driver.startup_vm_requires_abort(protocol, before, before))
        self.assertFalse(driver.startup_vm_requires_abort(protocol, before, after))
        # This is the unchanged driver condition for startup eligibility.
        self.assertFalse(all(before[k] == after[k] for k in ('swapins', 'swapouts')))

    def test_new_swapouts_still_abort(self):
        protocol = runner.expected_protocol('on')
        before = {'swapins': 100, 'swapouts': 50}
        for after in ({'swapins': 100, 'swapouts': 51}, {'swapins': 108, 'swapouts': 51}):
            self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))

    def test_other_profiles_keep_the_legacy_startup_abort(self):
        before = {'swapins': 100, 'swapouts': 50}
        after = {'swapins': 108, 'swapouts': 50}
        protocol = runner.expected_protocol('on')
        protocol['unqualified_profile'] = True
        self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))
        self.assertTrue(driver.startup_vm_requires_abort(runner.expected_protocol('off'), before, after))

    def test_unavailable_invalid_or_reset_counters_abort(self):
        protocol = runner.expected_protocol('on')
        valid = {'swapins': 100, 'swapouts': 50}
        for key in ('swapins', 'swapouts'):
            for value in (None, True, -1, 1.5, '100'):
                for side in ('before', 'after'):
                    before, after = dict(valid), dict(valid)
                    (before if side == 'before' else after)[key] = value
                    with self.subTest(key=key, value=value, side=side):
                        self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))
            after = dict(valid); del after[key]
            self.assertTrue(driver.startup_vm_requires_abort(protocol, valid, after))
            after = dict(valid); after[key] -= 1
            self.assertTrue(driver.startup_vm_requires_abort(protocol, valid, after))

    def test_original_joint_assessor_excludes_the_pair_and_still_checks_its_outputs(self):
        rows, warmups, _, completion = run_test.fixture_module.fixture()
        protocol = runner.expected_protocol('on')
        for row in rows + list(warmups.values()):
            row['metrics']['effective_mtp'] = True
            row['metrics']['stats']['requestSeconds'] = row['client_seconds']
        rows[1]['after_warmup_vm']['swapins'] += 8
        rows[1]['startup_and_warmup_valid'] = False
        run_test.complete(rows, protocol, completion)
        result = runner.assess_cohort(protocol, completion, rows, warmups)
        self.assertTrue(result['qualified'])
        self.assertEqual([r['round'] for r in result['measurement']['excluded_rounds']], [1])
        self.assertTrue(all(value['clean_pairs'] == 15 for value in result['measurement']['metrics'].values()))
        self.assertEqual(len(rows), 32)
        bad = copy.deepcopy(rows)
        bad[1]['metrics']['output_ids'][0] += 1
        run_test.complete(bad, protocol, completion)
        with self.assertRaisesRegex(ValueError, 'mismatch'):
            runner.assess_cohort(protocol, completion, bad, warmups)

    def test_original_physical_and_pressure_stops_remain(self):
        policy = runner.policy('on')
        self.assertTrue(policy['stop_on_new_swapouts'])
        self.assertEqual(policy['startup_reclaimable_bytes'], 18_000_000_000)
        cases = [({'reclaimable_bytes': 20_000_000_000, 'swapouts': 1}, 1_000_000_000),
                 ({'reclaimable_bytes': 2_999_999_999, 'swapouts': 0}, 1_000_000_000),
                 ({'reclaimable_bytes': 20_000_000_000, 'swapouts': 0}, 14_000_000_001)]
        for snapshot, rss in cases:
            with self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 0, policy)
        with self.assertRaises(ValueError):
            runner.core.require_normal({'level': 2})


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 1295f2fc379fc0ed95f9c52a7d9c8c2e5b2637003a3de5c721685bb735348afd

Encoding: `utf-8`. Original bytes: 4570.

````````````text
"""Synthetic startup exclusions must never admit contaminated timing or unsafe work."""
import copy
import unittest

import run as runner
import run_test
from guard_with_footprint import check_sample

driver = runner.module('startup_method_driver', runner.HERE / 'driver/serve_bench.py')


class Checks(unittest.TestCase):
    def test_exact_profile_can_finish_work_but_startup_swapins_remain_ineligible(self):
        protocol = runner.expected_protocol('on')
        before = {'swapins': 100, 'swapouts': 50}
        after = {'swapins': 108, 'swapouts': 50}
        self.assertFalse(driver.startup_vm_requires_abort(protocol, before, before))
        self.assertFalse(driver.startup_vm_requires_abort(protocol, before, after))
        # This is the unchanged driver condition for startup eligibility.
        self.assertFalse(all(before[k] == after[k] for k in ('swapins', 'swapouts')))

    def test_new_swapouts_still_abort(self):
        protocol = runner.expected_protocol('on')
        before = {'swapins': 100, 'swapouts': 50}
        for after in ({'swapins': 100, 'swapouts': 51}, {'swapins': 108, 'swapouts': 51}):
            self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))

    def test_other_profiles_keep_the_legacy_startup_abort(self):
        before = {'swapins': 100, 'swapouts': 50}
        after = {'swapins': 108, 'swapouts': 50}
        protocol = runner.expected_protocol('on')
        protocol['unqualified_profile'] = True
        self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))
        self.assertTrue(driver.startup_vm_requires_abort(runner.expected_protocol('off'), before, after))

    def test_unavailable_invalid_or_reset_counters_abort(self):
        protocol = runner.expected_protocol('on')
        valid = {'swapins': 100, 'swapouts': 50}
        for key in ('swapins', 'swapouts'):
            for value in (None, True, -1, 1.5, '100'):
                for side in ('before', 'after'):
                    before, after = dict(valid), dict(valid)
                    (before if side == 'before' else after)[key] = value
                    with self.subTest(key=key, value=value, side=side):
                        self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))
            after = dict(valid); del after[key]
            self.assertTrue(driver.startup_vm_requires_abort(protocol, valid, after))
            after = dict(valid); after[key] -= 1
            self.assertTrue(driver.startup_vm_requires_abort(protocol, valid, after))

    def test_original_joint_assessor_excludes_the_pair_and_still_checks_its_outputs(self):
        rows, warmups, _, completion = run_test.fixture_module.fixture()
        protocol = runner.expected_protocol('on')
        for row in rows + list(warmups.values()):
            row['metrics']['effective_mtp'] = True
            row['metrics']['stats']['requestSeconds'] = row['client_seconds']
        rows[1]['after_warmup_vm']['swapins'] += 8
        rows[1]['startup_and_warmup_valid'] = False
        run_test.complete(rows, protocol, completion)
        result = runner.assess_cohort(protocol, completion, rows, warmups)
        self.assertTrue(result['qualified'])
        self.assertEqual([r['round'] for r in result['measurement']['excluded_rounds']], [1])
        self.assertTrue(all(value['clean_pairs'] == 15 for value in result['measurement']['metrics'].values()))
        self.assertEqual(len(rows), 32)
        bad = copy.deepcopy(rows)
        bad[1]['metrics']['output_ids'][0] += 1
        run_test.complete(bad, protocol, completion)
        with self.assertRaisesRegex(ValueError, 'mismatch'):
            runner.assess_cohort(protocol, completion, bad, warmups)

    def test_original_physical_and_pressure_stops_remain(self):
        policy = runner.policy('on')
        self.assertTrue(policy['stop_on_new_swapouts'])
        self.assertEqual(policy['startup_reclaimable_bytes'], 18_000_000_000)
        cases = [({'reclaimable_bytes': 20_000_000_000, 'swapouts': 1}, 1_000_000_000),
                 ({'reclaimable_bytes': 2_999_999_999, 'swapouts': 0}, 1_000_000_000),
                 ({'reclaimable_bytes': 20_000_000_000, 'swapouts': 0}, 14_000_000_001)]
        for snapshot, rss in cases:
            with self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 0, policy)
        with self.assertRaisesRegex(RuntimeError, 'memory pressure is not normal'):
            runner.core.require_normal({'level': 2})


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 9219d599735facb8bf3c53896546de7bb9a8d1b6a7eb3e8c911c846a32d631e5

Encoding: `utf-8`. Original bytes: 1274.

````````````text
test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse (__main__.ThermalChecks) ... ok
test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success (__main__.ThermalChecks) ... ok
test_fair_observation_resets_the_interval (__main__.ThermalChecks) ... ok
test_generated_driver_reconstructs_original_and_packages_actual_helper (__main__.ThermalChecks) ... ok
test_long_observation_gap_does_not_supply_unobserved_stability (__main__.ThermalChecks) ... ok
test_low_power_severe_and_unknown_state_cannot_become_nominal (__main__.ThermalChecks) ... ok
test_no_nominal_reading_times_out_and_releases_lock (__main__.ThermalChecks) ... ok
test_other_model_lock_is_not_waited_out_or_bypassed (__main__.ThermalChecks) ... ok
test_pressure_memory_and_competing_work_stops (__main__.ThermalChecks) ... ok
test_slow_observation_cannot_exceed_deadline_then_pass (__main__.ThermalChecks) ... ok
test_stable_nominal_samples_and_lock_release (__main__.ThermalChecks) ... ok
test_swapins_outside_measurement_do_not_become_a_measured_pass (__main__.ThermalChecks) ... ok
test_swapouts_counter_drift_and_missing_vm_stops (__main__.ThermalChecks) ... ok

----------------------------------------------------------------------
Ran 13 tests in 0.107s

OK

````````````

## Artifact SHA-256 27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085

Encoding: `utf-8`. Original bytes: 11107.

````````````text
import contextlib
import fcntl
import importlib.util
import io
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import thermal_settle as t

POLICY = {'stable_seconds': 30, 'maximum_wait_seconds': 60, 'poll_seconds': 2}


class Clock:
    def __init__(self): self.value = 0
    def now(self): return self.value
    def sleep(self, seconds): self.value += seconds


def observation(thermal='nominal', low=False):
    return {'conditions': {'thermalState': thermal, 'lowPowerModeEnabled': low},
            'ready': thermal == 'nominal' and not low}


class ThermalChecks(unittest.TestCase):
    def execute(self, root, *, clock=None, **overrides):
        clock = clock or Clock()
        calls = {'observe': lambda: observation(),
                 'vm': lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10, 'swapouts': 20},
                 'pressure': lambda: {'level': 1}, 'jobs': lambda: [],
                 'now': clock.now, 'sleep': clock.sleep, 'lock_path': root / 'model.lock',
                 'record': lambda _: None}
        calls.update(overrides)
        return t.wait(POLICY, 20.112, **calls)

    def test_absent_policy_is_noop_and_invalid_types_or_disabled_guards_refuse(self):
        self.assertIsNone(t.validate({}))
        self.assertEqual(t.wait(None, 1, observe=lambda: self.fail('observed disabled policy')), {'enabled': False})
        protocol = {'before_cell_thermal_settle': POLICY, 'require_nominal_power_state': True,
                    'stop_on_workspace_contention': True, 'abort_on_resource_failure': True}
        self.assertEqual(t.validate(protocol), POLICY)
        for key in ('require_nominal_power_state', 'stop_on_workspace_contention'):
            with self.subTest(key=key), self.assertRaises(ValueError):
                t.validate({**protocol, key: False})
        # The new prelaunch wait stops its own failures independently. Existing
        # post-request cohort handling may continue to record excluded cells.
        self.assertEqual(t.validate({**protocol, 'abort_on_resource_failure': False}), POLICY)
        for key, value in [('stable_seconds', True), ('maximum_wait_seconds', 601), ('poll_seconds', 0)]:
            with self.subTest(key=key), self.assertRaises(ValueError):
                t.validate({**protocol, 'before_cell_thermal_settle': {**POLICY, key: value}})

    def test_stable_nominal_samples_and_lock_release(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            result = self.execute(root)
            self.assertEqual(result['sampled_nominal_seconds'], 30)
            self.assertEqual(result['samples'], 16)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_fair_observation_resets_the_interval(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            result = self.execute(Path(directory), clock=clock,
                observe=lambda: observation('fair' if clock.value == 10 else 'nominal'))
            self.assertEqual(result['seconds'], 42)
            self.assertEqual(result['sampled_nominal_seconds'], 30)

    def test_no_nominal_reading_times_out_and_releases_lock(self):
        with tempfile.TemporaryDirectory() as directory:
            root, clock = Path(directory), Clock()
            with self.assertRaises(TimeoutError):
                self.execute(root, clock=clock, observe=lambda: observation('fair'))
            self.assertEqual(clock.value, 60)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_other_model_lock_is_not_waited_out_or_bypassed(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with (root / 'model.lock').open('a') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                with self.assertRaisesRegex(RuntimeError, 'another model'):
                    self.execute(root, observe=lambda: self.fail('observed while another model owns lock'))

    def test_low_power_severe_and_unknown_state_cannot_become_nominal(self):
        for state in [observation(low=True), observation('serious'), observation('critical'),
                      observation('unknown'), {'ready': True, 'conditions': None},
                      {**observation(), 'ready': False}]:
            with self.subTest(state=state), tempfile.TemporaryDirectory() as directory:
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), observe=lambda: state)

    def test_pressure_memory_and_competing_work_stops(self):
        for override in [{'pressure': lambda: {'level': 2}},
                         {'pressure': lambda: {'level': True}},
                         {'vm': lambda: {'reclaimable_bytes': 20_111_999_999, 'swapins': 10, 'swapouts': 20}},
                         {'jobs': lambda: [{'kind': 'Swift build', 'pid': 123}]}]:
            with self.subTest(override=override), tempfile.TemporaryDirectory() as directory:
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), **override)

    def test_swapouts_counter_drift_and_missing_vm_stops(self):
        for make in [lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10, 'swapouts': 20 + n},
                     lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10 - n, 'swapouts': 20},
                     lambda n: {'reclaimable_bytes': 30_000_000_000, 'swapouts': 20}]:
            with self.subTest(make=make), tempfile.TemporaryDirectory() as directory:
                clock = Clock()
                with self.assertRaises(RuntimeError):
                    self.execute(Path(directory), clock=clock, vm=lambda: make(int(clock.value)))

    def test_swapins_outside_measurement_do_not_become_a_measured_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            result = self.execute(Path(directory), clock=clock,
                vm=lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 10 + int(clock.value), 'swapouts': 20})
            self.assertTrue(result['before_launch_only'])
            self.assertTrue(result['request_acceptance_unchanged'])

    def test_long_observation_gap_does_not_supply_unobserved_stability(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            def observe():
                if clock.value == 10: clock.value += 6
                return observation()
            result = self.execute(Path(directory), clock=clock, observe=observe)
            self.assertEqual(result['seconds'], 48)

    def test_slow_observation_cannot_exceed_deadline_then_pass(self):
        with tempfile.TemporaryDirectory() as directory:
            clock = Clock()
            def observe():
                clock.value += 61
                return observation()
            with self.assertRaisesRegex(TimeoutError, 'during observation'):
                self.execute(Path(directory), clock=clock, observe=observe)

    def test_generated_driver_reconstructs_original_and_packages_actual_helper(self):
        record = json.loads((HERE / 'driver-transformation.json').read_text())
        text = (HERE / 'driver/serve_bench.py').read_text()
        for item in reversed(record['edits']):
            self.assertEqual(text.count(item['new']), 1)
            text = text.replace(item['new'], item['old'])
        root = Path('/Users/carlos/Projects/slotstream')
        self.assertEqual(text.encode(), (root / 'Tools/serve_bench.py').read_bytes())
        self.assertEqual((HERE / 'driver/prefill_bench.py').read_bytes(), (root / 'Tools/prefill_bench.py').read_bytes())
        self.assertEqual((HERE / 'driver/thermal_settle.py').read_bytes(), (HERE / 'thermal_settle.py').read_bytes())

    def test_actual_driver_stops_before_model_on_settle_failure_and_launches_only_after_success(self):
        spec = importlib.util.spec_from_file_location('thermal_driver_test', HERE / 'driver/serve_bench.py')
        driver = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(driver)
        protocol = json.loads((HERE.parent / 'scope-serving-resource-resume-v377/protocol.json').read_text())
        protocol['rounds'] = 1  # Synthetic delivery fixture, never an inference measurement.
        protocol['before_cell_thermal_settle'] = POLICY
        build = driver.verified_build(protocol['binary'])
        for fail in (False, True):
            with self.subTest(fail=fail), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                path, out = root / 'protocol.json', root / 'evidence'
                path.write_text(json.dumps(protocol))
                launches, settled = [], []
                def settle(requirement, gb):
                    settled.append((requirement, gb))
                    if fail: raise TimeoutError('SYNTHETIC_SETTLE_TIMEOUT')
                    return {'enabled': True, 'synthetic_test': True}
                def launch(command, **kwargs):
                    self.assertEqual(len(settled), len(launches) + 1)
                    launches.append(command)
                    raise RuntimeError('INTERCEPTED_MODEL_LAUNCH')
                with patch.object(sys, 'argv', ['delivery', '--protocol', str(path), '--out', str(out)]), \
                     patch.object(driver, 'verified_build', return_value=build), \
                     patch.object(driver, 'model_identity', return_value={'model_loaded': False}), \
                     patch.object(driver, 'wait_for_quiet_workspace', return_value={'synthetic': True}), \
                     patch.object(driver, 'competing_jobs', return_value=[]), \
                     patch.object(driver, 'reserved_cooldown', return_value={'synthetic': True}), \
                     patch.object(driver, 'wait_thermal_settle', side_effect=settle), \
                     patch.object(driver, 'wait_for_headroom', return_value=({'swapins': 0, 'swapouts': 0}, {})), \
                     patch.object(driver, 'subprocess', types.SimpleNamespace(Popen=launch)), \
                     contextlib.redirect_stdout(io.StringIO()):
                    code = driver.main()
                self.assertEqual(code, 1)
                self.assertEqual(len(launches), 0 if fail else 2)
                self.assertEqual(len(settled), 1 if fail else 2)
                rows = [json.loads(line) for line in (out / 'results.jsonl').read_text().splitlines()]
                self.assertTrue(all(row['valid'] is False for row in rows))
                self.assertIn('SYNTHETIC_SETTLE_TIMEOUT' if fail else 'INTERCEPTED_MODEL_LAUNCH', rows[0]['error'])
                self.assertFalse(any('metrics' in row for row in rows))


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````
