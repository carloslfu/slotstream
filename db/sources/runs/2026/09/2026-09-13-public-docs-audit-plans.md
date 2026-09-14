---
type: run
id: 01m2dkqvbchxn69xk0tvetrgvs
created: 2026-09-13T14:46:31.020159+00:00
updated: 2026-09-13T14:46:51.030083+00:00
summary: 'Public documentation audit: default and larger-window planner simulations and published release identity'
binary: 0.2.16 sha256:72841bd02b3ff901abf0b5fc3dbc3c2590c285e6636a3501e3df3608afce86a2
captured_at: 2026-09-13
command: .build/release/slotstream doctor --sim-ram N --max-context W --json; exact invocations in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Public documentation audit planner and release observations
tool: slotstream doctor; GitHub API
---
Planner observations only; no model loaded.

Checkout HEAD: `c0778a8128125a8a58dadb32e68f4d867422df63`.
Binary SHA-256: `72841bd02b3ff901abf0b5fc3dbc3c2590c285e6636a3501e3df3608afce86a2`.

The working tree also contains concurrent source edits; these binary observations do not qualify those edits.

## .build/release/slotstream --version

```text
0.2.16
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 16 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 9742730496,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 188780544,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 640,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 8999496960,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2656972800,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 369985536,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : false,
  "device_available_gb" : 16,
  "device_ram_gb" : 16,
  "device_working_set_gb" : 12,
  "est_prefill_s_at_max_context" : 385.50588235294038,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 4.0041666666666664,
  "expected_peak_gb" : 9,
  "experts_per_layer_cached" : 20,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 0,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 8999496960,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 2656972800,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 369985536,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 2.7000000000000002,
  "pool_slots" : 961,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 13382,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 10,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 18 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 10498239744,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2374963200,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 338798592,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 859,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 10499733760,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 3674419200,
      "prefill_bytes" : 665600000,
      "retained_capacity_bytes" : 519975936,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : false,
  "device_available_gb" : 18,
  "device_ram_gb" : 18,
  "device_working_set_gb" : 13.5,
  "est_prefill_s_at_max_context" : 262.14400000000018,
  "est_prefill_tok_s" : 125,
  "est_warm_tok_s" : 5.5375000000000005,
  "expected_peak_gb" : 10.5,
  "experts_per_layer_cached" : 28,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 0,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 10499733760,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 3674419200,
    "prefill_bytes" : 665600000,
    "retained_capacity_bytes" : 519975936,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 3.7000000000000002,
  "pool_slots" : 1329,
  "prefill_chunk" : 512,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 18807,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 11.5,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 24 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 14998977792,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 5427302400,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 788797440,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 1963,
    "maximum_prefill_chunk" : 1024,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 14999033088,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 7122124800,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : false,
  "device_available_gb" : 24,
  "device_ram_gb" : 24,
  "device_working_set_gb" : 18,
  "est_prefill_s_at_max_context" : 200.57987878787887,
  "est_prefill_tok_s" : 165,
  "est_warm_tok_s" : 7.6139937176257977,
  "expected_peak_gb" : 15,
  "experts_per_layer_cached" : 54,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 0,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 905969664,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 14999033088,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 7122124800,
    "prefill_bytes" : 1331200000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 7.0999999999999996,
  "pool_slots" : 2576,
  "prefill_chunk" : 1024,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 16,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 32 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 20998621440,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 10826956800,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 1388786688,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 3916,
    "maximum_prefill_chunk" : 1024,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 20997678336,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 9798451200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 32,
  "device_ram_gb" : 32,
  "device_working_set_gb" : 24,
  "est_prefill_s_at_max_context" : 183.62673762010354,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 8.6768766779652484,
  "expected_peak_gb" : 21,
  "experts_per_layer_cached" : 74,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 20997678336,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 9798451200,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 9.8000000000000007,
  "pool_slots" : 3544,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 22,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 36 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 23999237376,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 10268467200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1474578432,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 3714,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 23997486336,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 12798259200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 36,
  "device_ram_gb" : 36,
  "device_working_set_gb" : 27,
  "est_prefill_s_at_max_context" : 183.62673762010354,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 9.6800094353678414,
  "expected_peak_gb" : 24,
  "experts_per_layer_cached" : 96,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 23997486336,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 12798259200,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 12.800000000000001,
  "pool_slots" : 4629,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 25,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 48 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 32597820672,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 18529689600,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 6702,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 32598779136,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 21399552000,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 48,
  "device_ram_gb" : 48,
  "device_working_set_gb" : 36,
  "est_prefill_s_at_max_context" : 183.62673762010354,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 11.6,
  "expected_peak_gb" : 32.600000000000001,
  "experts_per_layer_cached" : 161,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 32598779136,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 21399552000,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 21.399999999999999,
  "pool_slots" : 7740,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 33.600000000000001,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 64 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 7119,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 33599534336,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19737907200,
      "prefill_bytes" : 5324800000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 64,
  "device_ram_gb" : 64,
  "device_working_set_gb" : 48,
  "est_prefill_s_at_max_context" : 182.26443163340733,
  "est_prefill_tok_s" : 220,
  "est_warm_tok_s" : 11.559643077201125,
  "expected_peak_gb" : 33.600000000000001,
  "experts_per_layer_cached" : 149,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 33599534336,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 19737907200,
    "prefill_bytes" : 5324800000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "notes" : [
    "auto's default memory ceiling is 34.6 GB for this model, based on diminishing returns in development-Mac tests; other hardware may benefit from more. We revise defaults using real measurements; --memory-gb N selects a larger fixed target"
  ],
  "pool_gb" : 19.699999999999999,
  "pool_slots" : 7139,
  "prefill_chunk" : 4096,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 34.600000000000001,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 96 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 7119,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 33599534336,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19737907200,
      "prefill_bytes" : 5324800000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 96,
  "device_ram_gb" : 96,
  "device_working_set_gb" : 72,
  "est_prefill_s_at_max_context" : 182.26443163340733,
  "est_prefill_tok_s" : 220,
  "est_warm_tok_s" : 11.559643077201125,
  "expected_peak_gb" : 33.600000000000001,
  "experts_per_layer_cached" : 149,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 33599534336,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 19737907200,
    "prefill_bytes" : 5324800000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "notes" : [
    "auto's default memory ceiling is 34.6 GB for this model, based on diminishing returns in development-Mac tests; other hardware may benefit from more. We revise defaults using real measurements; --memory-gb N selects a larger fixed target"
  ],
  "pool_gb" : 19.699999999999999,
  "pool_slots" : 7139,
  "prefill_chunk" : 4096,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 34.600000000000001,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 128 --max-context 32768 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 7119,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 981467136,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 33599534336,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19737907200,
      "prefill_bytes" : 5324800000,
      "retained_capacity_bytes" : 905969664,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 128,
  "device_ram_gb" : 128,
  "device_working_set_gb" : 96,
  "est_prefill_s_at_max_context" : 182.26443163340733,
  "est_prefill_tok_s" : 220,
  "est_warm_tok_s" : 11.559643077201125,
  "expected_peak_gb" : 33.600000000000001,
  "experts_per_layer_cached" : 149,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 32768,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 981467136,
    "additional_active_bytes" : 0,
    "expected_peak_bytes" : 33599534336,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 0,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 19737907200,
    "prefill_bytes" : 5324800000,
    "retained_capacity_bytes" : 905969664,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "notes" : [
    "auto's default memory ceiling is 34.6 GB for this model, based on diminishing returns in development-Mac tests; other hardware may benefit from more. We revise defaults using real measurements; --memory-gb N selects a larger fixed target"
  ],
  "pool_gb" : 19.699999999999999,
  "pool_slots" : 7139,
  "prefill_chunk" : 4096,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 32768,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 34.600000000000001,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 16 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 9742730496,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 188780544,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 640,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 9742730496,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 188780544,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : false,
  "device_available_gb" : 16,
  "device_ram_gb" : 16,
  "device_working_set_gb" : 12,
  "est_prefill_s_at_max_context" : 771.01176470588018,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 2.666666666666667,
  "expected_peak_gb" : 9.6999999999999993,
  "experts_per_layer_cached" : 13,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 0,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1811939328,
    "additional_active_bytes" : 905969664,
    "expected_peak_bytes" : 9742730496,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 905969664,
    "lookahead_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 1769472000,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 188780544,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 1.8,
  "pool_slots" : 640,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 6828,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 10,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 18 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 10498239744,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2374963200,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 338798592,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 859,
    "maximum_prefill_chunk" : 256,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 10498239744,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2374963200,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 338798592,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : false,
  "device_available_gb" : 18,
  "device_ram_gb" : 18,
  "device_working_set_gb" : 13.5,
  "est_prefill_s_at_max_context" : 771.01176470588018,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 3.5791666666666666,
  "expected_peak_gb" : 10.5,
  "experts_per_layer_cached" : 18,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 0,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1811939328,
    "additional_active_bytes" : 905969664,
    "expected_peak_bytes" : 10498239744,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 905969664,
    "lookahead_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 2374963200,
    "prefill_bytes" : 332800000,
    "retained_capacity_bytes" : 338798592,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 2.3999999999999999,
  "pool_slots" : 859,
  "prefill_chunk" : 256,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 12254,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 11.5,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 24 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 14998977792,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 5427302400,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 788797440,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 1963,
    "maximum_prefill_chunk" : 1024,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 14998977792,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 5427302400,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 788797440,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : false,
  "device_available_gb" : 24,
  "device_ram_gb" : 24,
  "device_working_set_gb" : 18,
  "est_prefill_s_at_max_context" : 468.50646702317312,
  "est_prefill_tok_s" : 165,
  "est_warm_tok_s" : 6.811892548495555,
  "expected_peak_gb" : 15,
  "experts_per_layer_cached" : 41,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 0,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1811939328,
    "additional_active_bytes" : 905969664,
    "expected_peak_bytes" : 14998977792,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 905969664,
    "lookahead_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 5427302400,
    "prefill_bytes" : 1331200000,
    "retained_capacity_bytes" : 788797440,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 5.4000000000000004,
  "pool_slots" : 1963,
  "prefill_chunk" : 1024,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 28530,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 16,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 32 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 20998621440,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 10826956800,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 1388786688,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 3916,
    "maximum_prefill_chunk" : 1024,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1811939328,
      "additional_active_bytes" : 905969664,
      "expected_peak_bytes" : 20998621440,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 905969664,
      "lookahead_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 10826956800,
      "prefill_bytes" : 1331200000,
      "retained_capacity_bytes" : 1388786688,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : false,
  "device_available_gb" : 32,
  "device_ram_gb" : 32,
  "device_working_set_gb" : 24,
  "est_prefill_s_at_max_context" : 468.50646702317312,
  "est_prefill_tok_s" : 165,
  "est_warm_tok_s" : 9.0389856720067616,
  "expected_peak_gb" : 21,
  "experts_per_layer_cached" : 82,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 0,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1811939328,
    "additional_active_bytes" : 905969664,
    "expected_peak_bytes" : 20998621440,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 905969664,
    "lookahead_reserve_bytes" : 0,
    "mtp_resident_bytes" : 0,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 10826956800,
    "prefill_bytes" : 1331200000,
    "retained_capacity_bytes" : 1388786688,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : false,
  "mtp_context_limit" : 65536,
  "pool_gb" : 10.800000000000001,
  "pool_slots" : 3916,
  "prefill_chunk" : 1024,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 50231,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 22,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 36 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 23999237376,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 10268467200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1474578432,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 3714,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 23999237376,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 10268467200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1474578432,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 36,
  "device_ram_gb" : 36,
  "device_working_set_gb" : 27,
  "est_prefill_s_at_max_context" : 451.55332585539782,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 8.84500928495547,
  "expected_peak_gb" : 24,
  "experts_per_layer_cached" : 77,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1962934272,
    "additional_active_bytes" : 981467136,
    "expected_peak_bytes" : 23999237376,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 981467136,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 10268467200,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 1474578432,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 10.300000000000001,
  "pool_slots" : 3714,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 53334,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 25,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 48 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 32597820672,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 18529689600,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 6702,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 32597820672,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 18529689600,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 48,
  "device_ram_gb" : 48,
  "device_working_set_gb" : 36,
  "est_prefill_s_at_max_context" : 451.55332585539782,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 11.264386578264094,
  "expected_peak_gb" : 32.600000000000001,
  "experts_per_layer_cached" : 140,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1962934272,
    "additional_active_bytes" : 981467136,
    "expected_peak_bytes" : 32597820672,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 981467136,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 18529689600,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 1811939328,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "pool_gb" : 18.5,
  "pool_slots" : 6702,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 65536,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 33.600000000000001,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 64 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 7119,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 64,
  "device_ram_gb" : 64,
  "device_working_set_gb" : 48,
  "est_prefill_s_at_max_context" : 451.55332585539782,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 11.546367004797672,
  "expected_peak_gb" : 33.799999999999997,
  "experts_per_layer_cached" : 148,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1962934272,
    "additional_active_bytes" : 981467136,
    "expected_peak_bytes" : 33750742272,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 981467136,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 19682611200,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 1811939328,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "notes" : [
    "auto's default memory ceiling is 34.8 GB for this model, based on diminishing returns in development-Mac tests; other hardware may benefit from more. We revise defaults using real measurements; --memory-gb N selects a larger fixed target"
  ],
  "pool_gb" : 19.699999999999999,
  "pool_slots" : 7119,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 65536,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 34.799999999999997,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 96 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 7119,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 96,
  "device_ram_gb" : 96,
  "device_working_set_gb" : 72,
  "est_prefill_s_at_max_context" : 451.55332585539782,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 11.546367004797672,
  "expected_peak_gb" : 33.799999999999997,
  "experts_per_layer_cached" : 148,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1962934272,
    "additional_active_bytes" : 981467136,
    "expected_peak_bytes" : 33750742272,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 981467136,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 19682611200,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 1811939328,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "notes" : [
    "auto's default memory ceiling is 34.8 GB for this model, based on diminishing returns in development-Mac tests; other hardware may benefit from more. We revise defaults using real measurements; --memory-gb N selects a larger fixed target"
  ],
  "pool_gb" : 19.699999999999999,
  "pool_slots" : 7119,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 65536,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 34.799999999999997,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## .build/release/slotstream doctor --sim-ram 128 --max-context 65536 --json

```text
{
  "availability_clamped" : false,
  "context_feasibility" : {
    "limiting_resource" : "implementation_limit",
    "maximum_feasible_window" : 65536,
    "maximum_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "maximum_pool_slots" : 7119,
    "maximum_prefill_chunk" : 2048,
    "refusal" : null,
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 1962934272,
      "additional_active_bytes" : 981467136,
      "expected_peak_bytes" : 33750742272,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 981467136,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 1600000000,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 19682611200,
      "prefill_bytes" : 2662400000,
      "retained_capacity_bytes" : 1811939328,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 65536,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "context_qualification" : false,
  "decode_lookahead" : true,
  "device_available_gb" : 128,
  "device_ram_gb" : 128,
  "device_working_set_gb" : 96,
  "est_prefill_s_at_max_context" : 451.55332585539782,
  "est_prefill_tok_s" : 205,
  "est_warm_tok_s" : 11.546367004797672,
  "expected_peak_gb" : 33.799999999999997,
  "experts_per_layer_cached" : 148,
  "fully_resident" : false,
  "implementation_context_limit" : 65536,
  "lookahead_reserve_bytes" : 391118848,
  "max_context_tokens" : 65536,
  "max_prefill_wait_minutes" : 30,
  "max_ram_percent" : 70,
  "memory_ledger" : {
    "active_capacity_bytes" : 1962934272,
    "additional_active_bytes" : 981467136,
    "expected_peak_bytes" : 33750742272,
    "fixed_bytes" : 5300000000,
    "long_context_reserve_bytes" : 981467136,
    "lookahead_reserve_bytes" : 391118848,
    "mtp_resident_bytes" : 1600000000,
    "planning_margin_bytes" : 1000000000,
    "pool_bytes" : 19682611200,
    "prefill_bytes" : 2662400000,
    "retained_capacity_bytes" : 1811939328,
    "retained_recurrent_bytes" : 339738624,
    "version" : 1,
    "vision_resident_bytes" : 0
  },
  "model_context_limit" : 262144,
  "mtp" : true,
  "mtp_context_limit" : 65536,
  "notes" : [
    "auto's default memory ceiling is 34.8 GB for this model, based on diminishing returns in development-Mac tests; other hardware may benefit from more. We revise defaults using real measurements; --memory-gb N selects a larger fixed target"
  ],
  "pool_gb" : 19.699999999999999,
  "pool_slots" : 7119,
  "prefill_chunk" : 2048,
  "prefill_wait_scope" : "accepted_request_to_first_model_token",
  "prefix_cache_max_tokens" : 65536,
  "runtime_prefix_cache_enabled" : true,
  "source" : "auto",
  "target_gb" : 34.799999999999997,
  "vision" : true,
  "vision_charged_gb" : 0,
  "vision_context_limit" : 65536,
  "vision_resident_gb" : 0.90000000000000002,
  "vision_resident_reserved" : false
}
```

Exit: 0

## Published release identity

Command: `gh api repos/carloslfu/slotstream/releases/latest --jq '{tag_name,published_at,html_url}'`

```json
{"html_url":"https://github.com/carloslfu/slotstream/releases/tag/v0.2.15","published_at":"2026-09-11T17:42:30Z","tag_name":"v0.2.15"}
```
