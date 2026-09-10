---
type: run
id: 01m25j4vk5c9ga9bsqab7msetm
created: 2026-09-10T11:44:44.645038+00:00
updated: 2026-09-10T11:44:45.029616+00:00
summary: Exact final MTP long-workload delivery correction passes49model-free checks and freezes
binary: 9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673
captured_at: 2026-09-10
command: Model-free delivery qualification and freeze for final-mtp-long-delivery-v609, MTP on only
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Exact final MTP long-workload delivery correction passes49model-free checks and freezes
tool: Slotstream exact native and source qualification capture
---
The original V581 MTP-on attempt remains failed before model launch. This isolated successor preserves the entire original frozen protocol, including both arms, exact build and fixture, chat framing, 512 outputs in each first/measured response, 16 A/B pairs, fixed MTP depth 1, all exclusions and acceptance. Only that exact canonical protocol can use the corrected delivery branch. It requires 18 GB of startup reclaimable memory for the unchanged 12 GB process cap, preserving the stricter large-memory headroom. The fixture remains exactly 2,783 bytes with its original digest. The original request execution, startup-swap abort, resource monitoring, output checks, original reporter and cleanup bodies reconstruct byte-for-byte. All 49 model-free checks pass, including actual driver argument/body/fixture validation through a synthetic quiet-workspace boundary with zero model launches. The complete native/eight-paired prerequisite proof is revalidated during freeze. The MTP-off result is retained without rerun. This is prepared delivery, not an MTP-on performance result, completed program or activation.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/delivery-checks.stderr",
    "bytes": 575,
    "sha256": "1268f7bb6eb6e6ee94b3c6d4ceda1706d58b97b38d168ba18063e1780e82a6b3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/delivery-checks.stdout",
    "bytes": 139,
    "sha256": "54bebbd978590c6310e9141a80b5553f23fb594609a8242d6379f89f479aabe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/delivery-profile.json",
    "bytes": 10267,
    "sha256": "5b4c89c5dd94b800c9b91b00c7edebbd4dc336734af0c169d432e21ca4cd14a4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/delivery_checks.py",
    "bytes": 5797,
    "sha256": "83f482c842b2ddede7a58aabbf587189724bffb84945b810176b96ed4e09cecb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/driver/serve_bench.py",
    "bytes": 61431,
    "sha256": "12a7dd35ce287b483e3dad28b13d845b33e5101896aab4891cbcb465241f013e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/driver-transformation.json",
    "bytes": 2804,
    "sha256": "97652fe7adb45c62646b2cf1b67bd75fbc164cb22cbb9f9bc69256f867a17cb0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/final-checks.stderr",
    "bytes": 388,
    "sha256": "5c6c39b3f923ed5d36a537666eb951ef578afd7f04f391fbcc9f914194244e96"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/final-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/final_checks.py",
    "bytes": 2707,
    "sha256": "4dad4a6a2cd0db5d1737e1c9407348812f36c13705f612d610f792098576dea3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/on/binding.json",
    "bytes": 239783,
    "sha256": "55638f885dcd83d23f0b6c43754d8f7656a6778b55b5efee2acf12c50b121054"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/on/protocol.json",
    "bytes": 6899,
    "sha256": "407f1972b04fa5723f1a8933fcbcec6cd9cb3c96c1afb1c27e3e73cd367805e0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/prepare.py",
    "bytes": 8899,
    "sha256": "9dd060605f04bde36a6e804bd1e3710c2a83c312bdf39f51f5b7e0de14bf3183"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/run-checks.stderr",
    "bytes": 119,
    "sha256": "d280f326b12479467902b727a476dea2863e378448d8efed892c9709ac686bfd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/run-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/run.py",
    "bytes": 18441,
    "sha256": "3fa430723b7d77e03e9b422932e135a2ac1cc71baf22f3dd6642425ebca98b5f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/run_test.py",
    "bytes": 16316,
    "sha256": "1f2b9cf5e1bef73f0159959ae5e0375f827e2e2ba66ae7cca46c82f6f35cf12a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/schedule-checks.stderr",
    "bytes": 574,
    "sha256": "1703f316a5da962e005d80c4b888bbef897dc873b9b842fb2b3dec226e5ed8b3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/schedule-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/schedule-transformation.json",
    "bytes": 6355,
    "sha256": "174d2738bc1bb1ca3ae08eac8e75b45ec82950ba049e2aff07fca6c8ed5e1018"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/schedule_checks.py",
    "bytes": 5707,
    "sha256": "eaed82055d053f5f7449fb0c7a568242589ad078681a26fcc0fff54c471d89cd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/thermal-checks.stderr",
    "bytes": 1274,
    "sha256": "f7c199f9003cf93857a67f2be5992eae584f3bdced8a1ce655279264a31cd177"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/thermal-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/thermal_checks.py",
    "bytes": 11107,
    "sha256": "27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-long-delivery-v609/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  }
]
```

## Artifact SHA-256 1268f7bb6eb6e6ee94b3c6d4ceda1706d58b97b38d168ba18063e1780e82a6b3

Encoding: `utf-8`. Original bytes: 575.

````````````text
test_canonical_order_does_not_change_identity_and_extra_fields_do (__main__.Checks) ... ok
test_every_protocol_field_is_bound (__main__.Checks) ... ok
test_exact_original_workload_requires_eighteen_gb (__main__.Checks) ... ok
test_only_admission_and_fixture_delivery_changed_in_driver (__main__.Checks) ... ok
test_ordinary_small_profile_keeps_original_admission (__main__.Checks) ... ok
test_real_driver_reaches_quiet_boundary_before_any_model_launch (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 1.058s

OK

````````````

## Artifact SHA-256 54bebbd978590c6310e9141a80b5553f23fb594609a8242d6379f89f479aabe3

Encoding: `utf-8`. Original bytes: 139.

````````````text
{"requirement": {"stable_seconds": 180, "maximum_wait_seconds": 1800}, "passed": false, "error": "RuntimeError: synthetic prelaunch stop"}

````````````

## Artifact SHA-256 5b4c89c5dd94b800c9b91b00c7edebbd4dc336734af0c169d432e21ca4cd14a4

Encoding: `utf-8`. Original bytes: 10267.

````````````text
{
  "classification": "Prospective delivery correction for the exact original final MTP-on512-output workload; no changed inference or acceptance. The old attempt remains failed before model launch.",
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
    }
  ],
  "model_launched": false,
  "off_result_reused_without_rerun": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/off/execution/qualification.json"
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

## Artifact SHA-256 12a7dd35ce287b483e3dad28b13d845b33e5101896aab4891cbcb465241f013e

Encoding: `utf-8`. Original bytes: 61431.

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
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
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

## Artifact SHA-256 97652fe7adb45c62646b2cf1b67bd75fbc164cb22cbb9f9bc69256f867a17cb0

Encoding: `utf-8`. Original bytes: 2804.

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
    }
  ],
  "original_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "driver_sha256": "12a7dd35ce287b483e3dad28b13d845b33e5101896aab4891cbcb465241f013e",
  "reverse_restores_original_bytes": true
}

````````````

## Artifact SHA-256 5c6c39b3f923ed5d36a537666eb951ef578afd7f04f391fbcc9f914194244e96

Encoding: `utf-8`. Original bytes: 388.

````````````text
test_all_seven_native_proofs_are_retained (__main__.Checks) ... ok
test_incomplete_matrix_cannot_qualify_or_freeze (__main__.Checks) ... ok
test_missing_paired_or_consumed_legacy_cannot_hide (__main__.Checks) ... ok
test_original_run_report_and_guards_remain_exact (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 4 tests in 0.773s

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

## Artifact SHA-256 55638f885dcd83d23f0b6c43754d8f7656a6778b55b5efee2acf12c50b121054

Encoding: `gzip+base64`. Original bytes: 239783.

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

## Artifact SHA-256 d280f326b12479467902b727a476dea2863e378448d8efed892c9709ac686bfd

Encoding: `utf-8`. Original bytes: 119.

````````````text
....................
----------------------------------------------------------------------
Ran 20 tests in 8.381s

OK

````````````

## Artifact SHA-256 3fa430723b7d77e03e9b422932e135a2ac1cc71baf22f3dd6642425ebca98b5f

Encoding: `utf-8`. Original bytes: 18441.

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
OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'
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
    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']
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
    for name, count in [('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6), ('delivery', 6)]:
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

## Artifact SHA-256 1703f316a5da962e005d80c4b888bbef897dc873b9b842fb2b3dec226e5ed8b3

Encoding: `utf-8`. Original bytes: 574.

````````````text
test_actual_driver_and_helper_bytes_are_checked_and_bound (__main__.Checks) ... ok
test_all_cells_need_full_stable_evidence (__main__.Checks) ... ok
test_only_two_scheduling_fields_differ_from_both_unrun_drafts (__main__.Checks) ... ok
test_original_raw_assessor_is_not_reached_if_readiness_is_missing (__main__.Checks) ... ok
test_original_request_and_cleanup_bodies_restore_exactly (__main__.Checks) ... ok
test_schedule_cannot_drift_or_be_disabled (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 2.303s

OK

````````````

## Artifact SHA-256 174d2738bc1bb1ca3ae08eac8e75b45ec82950ba049e2aff07fca6c8ed5e1018

Encoding: `utf-8`. Original bytes: 6355.

````````````text
{
  "classification": "Prospective long-study scheduling amendment only. The frozen eight-paired campaign and both lifetimes remain unchanged.",
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
    }
  ],
  "original_serving_driver_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "original_reporter_sha256": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820",
  "original_startup_swapin_rule_unchanged": true,
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
    "legacy_startup_swap_abort_unchanged": true
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

## Artifact SHA-256 f7c199f9003cf93857a67f2be5992eae584f3bdced8a1ce655279264a31cd177

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
Ran 13 tests in 0.095s

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
