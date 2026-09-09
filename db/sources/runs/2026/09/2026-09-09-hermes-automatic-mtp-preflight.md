---
type: run
id: 01m23gb32fqs40pjd2av5xxvxx
created: 2026-09-09T16:34:42.894725+00:00
updated: 2026-09-09T16:34:54.497131+00:00
summary: Hermes automatic MTP guide and preflight verification
binary: Slotstream 0.2.11; Hermes b1f003e18633298d549668b8e186af84cca45b76
captured_at: 2026-09-09
command: slotstream doctor --max-context 65536 --json; synthetic loopback metadata with --expect-mtp on/off and --cli
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hermes automatic MTP guide and preflight verification
tool: slotstream doctor; Tools/hermes_integration_gate.py
---
No model was loaded. This planning output does not establish live Hermes compatibility with MTP enabled. The synthetic metadata checks exercise the integration gate itself and send no inference requests. The guide YAML is byte-identical to its prior version.

```json
{
  "purpose": "Planning and synthetic integration-preflight validation only; no model launched or live Hermes inference performed.",
  "server_version": "0.2.11",
  "server_sha256": "7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8",
  "hermes_commit": "b1f003e18633298d549668b8e186af84cca45b76",
  "planning_command": "slotstream doctor --max-context 65536 --json",
  "planning_stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 39.100000000000001,\n  \"device_ram_gb\" : 51.5,\n  \"device_working_set_gb\" : 40.200000000000003,\n  \"est_prefill_s_at_max_context\" : 451.55332585539782,\n  \"est_prefill_tok_s\" : 205,\n  \"est_warm_tok_s\" : 11.6,\n  \"expected_peak_gb\" : 34.5,\n  \"experts_per_layer_cached\" : 158,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 65536,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : true,\n  \"pool_gb\" : 21,\n  \"pool_slots\" : 7588,\n  \"prefill_chunk\" : 2048,\n  \"prefix_cache_max_tokens\" : 65536,\n  \"source\" : \"auto\",\n  \"target_gb\" : 34.600000000000001,\n  \"vision\" : true,\n  \"vision_resident_gb\" : 0.90000000000000002\n}\n",
  "preflight_cases": [
    {
      "case": "wrong-context",
      "passed": true,
      "error": "Server context differs from the Hermes guide",
      "requests": 1,
      "inference_requests": 0
    },
    {
      "case": "mtp-disabled",
      "passed": true,
      "error": "Expected MTP on: {'max_context_tokens': 65536, 'mtp': False}",
      "requests": 1,
      "inference_requests": 0
    },
    {
      "case": "mtp-enabled",
      "passed": true,
      "error": "Expected MTP off: {'max_context_tokens': 65536, 'mtp': True}",
      "requests": 1,
      "inference_requests": 0
    },
    {
      "case": "missing-mtp",
      "passed": true,
      "error": "Server did not report its MTP state",
      "requests": 1,
      "inference_requests": 0
    }
  ],
  "guide_yaml_unchanged": true,
  "guide_yaml_sha256": "ba683cf7d66b1f219071f03471e70488fcc2057076717619128debcbb870a6c0",
  "gate_sha256": "bd5b6e2e7db2162745fcc6245df501c59f8f688055acc8a012835cd95a45cbf3",
  "live_verification": "pending; another benchmark owns the model-process reservation"
}
```
