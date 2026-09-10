---
type: run
id: 01m1vgtzn91cm9wppwqc3n8q0a
created: 2026-09-06T14:09:28.233458+00:00
updated: 2026-09-06T14:09:43.894705+00:00
summary: Configurable context default-tier baseline and source ownership freeze
binary: installed 0.2.10; SHA-256 a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2
captured_at: 2026-09-06
command: Four pinned simulated tiers, each repeated twice; exact flags retained
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Configurable context default-tier baseline
tool: slotstream doctor
---
# Configurable-context baseline freeze

Captured before context implementation. Four deterministic default-tier
probes repeat byte-for-byte. The baseline source tree has unrelated in-flight
optimization work; this binary is the installed release and is not attributed
to that newer source tree. No model was loaded.

The stable fields and separately allowed additions are frozen in
`Tools/fixtures/context-default-v1.json`. Exact command results follow; the
executable path is normalized without changing output bytes.

```json
{
  "binary_sha256": "a4f5badd6fcf4c1d6b353dbac1067a83056e1b80e9663647384691fa906126e2",
  "invocation_note": "Executable path normalized to slotstream; exact stdout and stderr retained.",
  "tiers": [
    {
      "tier": 16,
      "command": [
        "slotstream",
        "doctor",
        "--sim-ram",
        "17.2",
        "--sim-working-set",
        "11.8",
        "--sim-available",
        "12.5",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "results": [
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 12.5,\n  \"device_ram_gb\" : 17.199999999999999,\n  \"device_working_set_gb\" : 11.800000000000001,\n  \"est_prefill_s_at_max_context\" : 385.50588235294038,\n  \"est_prefill_tok_s\" : 85,\n  \"est_warm_tok_s\" : 3.7333333333333334,\n  \"expected_peak_gb\" : 8.8000000000000007,\n  \"experts_per_layer_cached\" : 19,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 2.5,\n  \"pool_slots\" : 896,\n  \"prefill_chunk\" : 256,\n  \"prefix_cache_max_tokens\" : 12659,\n  \"source\" : \"auto\",\n  \"target_gb\" : 9.8000000000000007,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        },
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 12.5,\n  \"device_ram_gb\" : 17.199999999999999,\n  \"device_working_set_gb\" : 11.800000000000001,\n  \"est_prefill_s_at_max_context\" : 385.50588235294038,\n  \"est_prefill_tok_s\" : 85,\n  \"est_warm_tok_s\" : 3.7333333333333334,\n  \"expected_peak_gb\" : 8.8000000000000007,\n  \"experts_per_layer_cached\" : 19,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 2.5,\n  \"pool_slots\" : 896,\n  \"prefill_chunk\" : 256,\n  \"prefix_cache_max_tokens\" : 12659,\n  \"source\" : \"auto\",\n  \"target_gb\" : 9.8000000000000007,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        }
      ]
    },
    {
      "tier": 24,
      "command": [
        "slotstream",
        "doctor",
        "--sim-ram",
        "25.8",
        "--sim-working-set",
        "18",
        "--sim-available",
        "21",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "results": [
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 21,\n  \"device_ram_gb\" : 25.800000000000001,\n  \"device_working_set_gb\" : 18,\n  \"est_prefill_s_at_max_context\" : 200.57987878787887,\n  \"est_prefill_tok_s\" : 165,\n  \"est_warm_tok_s\" : 7.6139937176257977,\n  \"expected_peak_gb\" : 15,\n  \"experts_per_layer_cached\" : 54,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 7.0999999999999996,\n  \"pool_slots\" : 2576,\n  \"prefill_chunk\" : 1024,\n  \"prefix_cache_max_tokens\" : 32768,\n  \"source\" : \"auto\",\n  \"target_gb\" : 16,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        },
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 21,\n  \"device_ram_gb\" : 25.800000000000001,\n  \"device_working_set_gb\" : 18,\n  \"est_prefill_s_at_max_context\" : 200.57987878787887,\n  \"est_prefill_tok_s\" : 165,\n  \"est_warm_tok_s\" : 7.6139937176257977,\n  \"expected_peak_gb\" : 15,\n  \"experts_per_layer_cached\" : 54,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 7.0999999999999996,\n  \"pool_slots\" : 2576,\n  \"prefill_chunk\" : 1024,\n  \"prefix_cache_max_tokens\" : 32768,\n  \"source\" : \"auto\",\n  \"target_gb\" : 16,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        }
      ]
    },
    {
      "tier": 32,
      "command": [
        "slotstream",
        "doctor",
        "--sim-ram",
        "34.4",
        "--sim-working-set",
        "25.8",
        "--sim-available",
        "29",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "results": [
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 29,\n  \"device_ram_gb\" : 34.399999999999999,\n  \"device_working_set_gb\" : 25.800000000000001,\n  \"est_prefill_s_at_max_context\" : 183.62673762010354,\n  \"est_prefill_tok_s\" : 205,\n  \"est_warm_tok_s\" : 9.9214872229491249,\n  \"expected_peak_gb\" : 22.800000000000001,\n  \"experts_per_layer_cached\" : 102,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 13.6,\n  \"pool_slots\" : 4916,\n  \"prefill_chunk\" : 2048,\n  \"prefix_cache_max_tokens\" : 32768,\n  \"source\" : \"auto\",\n  \"target_gb\" : 23.800000000000001,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        },
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 29,\n  \"device_ram_gb\" : 34.399999999999999,\n  \"device_working_set_gb\" : 25.800000000000001,\n  \"est_prefill_s_at_max_context\" : 183.62673762010354,\n  \"est_prefill_tok_s\" : 205,\n  \"est_warm_tok_s\" : 9.9214872229491249,\n  \"expected_peak_gb\" : 22.800000000000001,\n  \"experts_per_layer_cached\" : 102,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 13.6,\n  \"pool_slots\" : 4916,\n  \"prefill_chunk\" : 2048,\n  \"prefix_cache_max_tokens\" : 32768,\n  \"source\" : \"auto\",\n  \"target_gb\" : 23.800000000000001,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        }
      ]
    },
    {
      "tier": 48,
      "command": [
        "slotstream",
        "doctor",
        "--sim-ram",
        "51.5",
        "--sim-working-set",
        "40.2",
        "--sim-available",
        "44",
        "--mtp",
        "off",
        "--vision",
        "off",
        "--json"
      ],
      "results": [
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 44,\n  \"device_ram_gb\" : 51.5,\n  \"device_working_set_gb\" : 40.200000000000003,\n  \"est_prefill_s_at_max_context\" : 182.26443163340733,\n  \"est_prefill_tok_s\" : 220,\n  \"est_warm_tok_s\" : 11.6,\n  \"expected_peak_gb\" : 32,\n  \"experts_per_layer_cached\" : 152,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 20.100000000000001,\n  \"pool_slots\" : 7280,\n  \"prefill_chunk\" : 4096,\n  \"prefix_cache_max_tokens\" : 32768,\n  \"source\" : \"auto\",\n  \"target_gb\" : 33,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        },
        {
          "returncode": 0,
          "stdout": "{\n  \"availability_clamped\" : false,\n  \"device_available_gb\" : 44,\n  \"device_ram_gb\" : 51.5,\n  \"device_working_set_gb\" : 40.200000000000003,\n  \"est_prefill_s_at_max_context\" : 182.26443163340733,\n  \"est_prefill_tok_s\" : 220,\n  \"est_warm_tok_s\" : 11.6,\n  \"expected_peak_gb\" : 32,\n  \"experts_per_layer_cached\" : 152,\n  \"fully_resident\" : false,\n  \"max_context_tokens\" : 32768,\n  \"max_ram_percent\" : 70,\n  \"mtp\" : false,\n  \"pool_gb\" : 20.100000000000001,\n  \"pool_slots\" : 7280,\n  \"prefill_chunk\" : 4096,\n  \"prefix_cache_max_tokens\" : 32768,\n  \"source\" : \"auto\",\n  \"target_gb\" : 33,\n  \"vision\" : false,\n  \"vision_resident_gb\" : 0\n}\n",
          "stderr": ""
        }
      ]
    }
  ]
}
```
