---
type: run
id: 01m1wepccd6e47m22zr3ehzna7
created: 2026-09-06T22:51:14.701223+00:00
updated: 2026-09-06T22:51:14.880261+00:00
summary: V198 pure governor matrix exposes physically invalid settled-fixture assumptions
binary: b5ee2cbab9117aeb5178594b72a3cfc8629ad714070365bdf1fd505b4cde1ed4
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: V198 pure governor matrix exposes physically invalid settled-fixture assumptions
tool: Native Swift diagnostics and Python CLI gates
---
# Preserved pure-fixture counterexample

The shared V198 release build passes. Its first T0 run returns32of33groups
and22295assertions, with20failed expectations in the configurable-context
matrix. No CLI or model-bearing case starts after that first failure. All32
new exhaustion/recovery assertions for the production feasibility correction
pass; the older matrix incorrectly assumes every returned startup advisory
is a physically feasible settled plan.

Both this task and the optimization task independently run the public doctor
against the exact frozen candidate. All four original cases at8192/32768,
prefix off/on,51.5GB RAM,40.2GB working set,10GB whole availability and a256-token
prefill override refuse with insufficient_memory and exit2. The exact ledgers
are7,919,289,600bytes without retention and7,921,999,104with it. The original
whole availability minus2.575GB safety slack leaves7,425,000,000bytes. These
fixtures therefore cannot require live admission or a settled plan. This
independent public check constructs no Engine and measures no real capacity.

The prospective diagnostic-only correction keeps the original10/18/44GB
inputs. It classifies each returned startup plan using its exact ledger and
original whole-memory/slack/target budget, requires refusal/floor/still-unavailable
behavior for the four invalid advisories, and checks that all four remain
present. New12GB rows preserve feasible near-floor settlement, cooldown and
recovery coverage. Every existing comparison remains for feasible plans.
The production physical guard, resize deadbands, loaded-component rules,
default allocation goldens and C07 numerical tolerances are unchanged.
The revised fixture is unbuilt at this capture; both native governors still
must pass before C05 closes.

[Complete unchanged T0 output, gzip](../../../artifacts/configurable-context-2026-09-06/shared-v198-t0.json.gz)
is retained, including all passing and failing assertions. The exact public
CLI diagnosis and source archive are preserved below. This fixture failure
is excluded from completed acceptance; it is not a262K measurement, capacity
failure, runtime release or implementation-limit increase.

## Frozen build identity

```json
{
  "binary_sha256": "b5ee2cbab9117aeb5178594b72a3cfc8629ad714070365bdf1fd505b4cde1ed4",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "093a7512b77cc9df972647ae72dbc183953a793a83bac95b15de968248010b6c"
}
```

## shared-v198-public.json

SHA-256 `0ea4032169f5889fbc75daf60f2ae538d172fe6b4c44ec6fee70df863f0fbca4`; 3900 bytes.

````text
{
  "groups": 33,
  "passed_groups": 32,
  "assertions": 22295,
  "failed_assertions": [
    {
      "name": "governor 8192/prefix=false/mode=0/available=10.0: same allocation after ownership credit",
      "passed": false
    },
    {
      "detail": "got resize(slots: 640, reason: \"context plan unavailable\"), want hold",
      "name": "governor 8192/prefix=false/mode=0/available=10.0: settled policy holds",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(256)",
      "name": "governor 8192/prefix=false/mode=0/available=10.0: chunk policy persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(false)",
      "name": "governor 8192/prefix=false/mode=0/available=10.0: mode persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(0)",
      "name": "governor 8192/prefix=false/mode=0/available=10.0: no retention resurrection",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(8192)",
      "name": "governor 8192/prefix=false/mode=0/available=10.0: context survives recovery",
      "passed": false
    },
    {
      "name": "governor 8192/prefix=true/mode=0/available=10.0: same allocation after ownership credit",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(256)",
      "name": "governor 8192/prefix=true/mode=0/available=10.0: chunk policy persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(false)",
      "name": "governor 8192/prefix=true/mode=0/available=10.0: mode persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(8192)",
      "name": "governor 8192/prefix=true/mode=0/available=10.0: context survives recovery",
      "passed": false
    },
    {
      "name": "governor 32768/prefix=false/mode=0/available=10.0: same allocation after ownership credit",
      "passed": false
    },
    {
      "detail": "got resize(slots: 640, reason: \"context plan unavailable\"), want hold",
      "name": "governor 32768/prefix=false/mode=0/available=10.0: settled policy holds",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(256)",
      "name": "governor 32768/prefix=false/mode=0/available=10.0: chunk policy persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(false)",
      "name": "governor 32768/prefix=false/mode=0/available=10.0: mode persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(0)",
      "name": "governor 32768/prefix=false/mode=0/available=10.0: no retention resurrection",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(32768)",
      "name": "governor 32768/prefix=false/mode=0/available=10.0: context survives recovery",
      "passed": false
    },
    {
      "name": "governor 32768/prefix=true/mode=0/available=10.0: same allocation after ownership credit",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(256)",
      "name": "governor 32768/prefix=true/mode=0/available=10.0: chunk policy persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(false)",
      "name": "governor 32768/prefix=true/mode=0/available=10.0: mode persists",
      "passed": false
    },
    {
      "detail": "got nil, want Optional(32768)",
      "name": "governor 32768/prefix=true/mode=0/available=10.0: context survives recovery",
      "passed": false
    }
  ],
  "raw_t0_sha256": "14cb59e283124229c86d50e847a9b814f2c9edacffa280838e7ffdff19b9d380",
  "raw_t0_bytes": 2120036,
  "raw_gzip_sha256": "1df9ea6db2996e70139ae943bd73ea58209d2610038c8d6dc47fb4038493a27c",
  "cli_and_model_cases_launched": false,
  "production_guard_changed_after_this_result": false,
  "projection": "Exact failing assertion objects and complete raw artifact hash; no timing or capacity conclusion."
}

````

## governor-advisory-v198/summary.json

SHA-256 `441d03bb08301c613a947d5e764dac5688c9067a498427648bd5b0e49e04497f`; 3358 bytes.

````text
{
  "binary_sha256": "b5ee2cbab9117aeb5178594b72a3cfc8629ad714070365bdf1fd505b4cde1ed4",
  "rows": [
    {
      "cap": 8192,
      "prefix": false,
      "exit": 2,
      "physical_budget_bytes": 7425000000,
      "ledger": {
        "active_capacity_bytes": 226492416,
        "additional_active_bytes": 0,
        "expected_peak_bytes": 7919289600,
        "fixed_bytes": 5300000000,
        "long_context_reserve_bytes": 0,
        "mtp_resident_bytes": 0,
        "planning_margin_bytes": 1000000000,
        "pool_bytes": 2286489600,
        "prefill_bytes": 332800000,
        "retained_capacity_bytes": 0,
        "retained_recurrent_bytes": 0,
        "version": 1,
        "vision_resident_bytes": 0
      },
      "error": {
        "code": "insufficient_memory",
        "message": "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
      }
    },
    {
      "cap": 8192,
      "prefix": true,
      "exit": 2,
      "physical_budget_bytes": 7425000000,
      "ledger": {
        "active_capacity_bytes": 226492416,
        "additional_active_bytes": 0,
        "expected_peak_bytes": 7921999104,
        "fixed_bytes": 5300000000,
        "long_context_reserve_bytes": 0,
        "mtp_resident_bytes": 0,
        "planning_margin_bytes": 1000000000,
        "pool_bytes": 1769472000,
        "prefill_bytes": 332800000,
        "retained_capacity_bytes": 179988480,
        "retained_recurrent_bytes": 339738624,
        "version": 1,
        "vision_resident_bytes": 0
      },
      "error": {
        "code": "insufficient_memory",
        "message": "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
      }
    },
    {
      "cap": 32768,
      "prefix": false,
      "exit": 2,
      "physical_budget_bytes": 7425000000,
      "ledger": {
        "active_capacity_bytes": 905969664,
        "additional_active_bytes": 0,
        "expected_peak_bytes": 7919289600,
        "fixed_bytes": 5300000000,
        "long_context_reserve_bytes": 0,
        "mtp_resident_bytes": 0,
        "planning_margin_bytes": 1000000000,
        "pool_bytes": 2286489600,
        "prefill_bytes": 332800000,
        "retained_capacity_bytes": 0,
        "retained_recurrent_bytes": 0,
        "version": 1,
        "vision_resident_bytes": 0
      },
      "error": {
        "code": "insufficient_memory",
        "message": "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
      }
    },
    {
      "cap": 32768,
      "prefix": true,
      "exit": 2,
      "physical_budget_bytes": 7425000000,
      "ledger": {
        "active_capacity_bytes": 905969664,
        "additional_active_bytes": 0,
        "expected_peak_bytes": 7921999104,
        "fixed_bytes": 5300000000,
        "long_context_reserve_bytes": 0,
        "mtp_resident_bytes": 0,
        "planning_margin_bytes": 1000000000,
        "pool_bytes": 1769472000,
        "prefill_bytes": 332800000,
        "retained_capacity_bytes": 179988480,
        "retained_recurrent_bytes": 339738624,
        "version": 1,
        "vision_resident_bytes": 0
      },
      "error": {
        "code": "insufficient_memory",
        "message": "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
      }
    }
  ]
}

````

## governor-advisory-v198/8192-prefix-0.stdout.json

SHA-256 `07877c40e759064e6290ed13dcefaed742ed26708c836bfee6d3c88e54cf8f8d`; 1127 bytes.

````text
{
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 0,
    "maximum_memory_ledger" : null,
    "maximum_pool_slots" : null,
    "maximum_prefill_chunk" : null,
    "refusal" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom",
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 226492416,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 7919289600,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2286489600,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 0,
      "retained_recurrent_bytes" : 0,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 8192,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "error" : {
    "code" : "insufficient_memory",
    "message" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
  }
}

````

## governor-advisory-v198/8192-prefix-0.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## governor-advisory-v198/8192-prefix-1.stdout.json

SHA-256 `044718cc5479fd95aa09a1ac2f986e1c2519c21c75958b346630158cb745689e`; 1143 bytes.

````text
{
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 0,
    "maximum_memory_ledger" : null,
    "maximum_pool_slots" : null,
    "maximum_prefill_chunk" : null,
    "refusal" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom",
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 226492416,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 7921999104,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 179988480,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 8192,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "error" : {
    "code" : "insufficient_memory",
    "message" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
  }
}

````

## governor-advisory-v198/8192-prefix-1.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## governor-advisory-v198/32768-prefix-0.stdout.json

SHA-256 `02525d5b9701e83bfcb124a49c8bed9e734bc2f16cbf4393b70ad575854f8575`; 1128 bytes.

````text
{
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 0,
    "maximum_memory_ledger" : null,
    "maximum_pool_slots" : null,
    "maximum_prefill_chunk" : null,
    "refusal" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom",
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 7919289600,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 2286489600,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 0,
      "retained_recurrent_bytes" : 0,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "error" : {
    "code" : "insufficient_memory",
    "message" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
  }
}

````

## governor-advisory-v198/32768-prefix-0.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## governor-advisory-v198/32768-prefix-1.stdout.json

SHA-256 `5ec55edcbf88f225df3a50e45f50b40a3353e6c8655243ae8935770b4bb370fe`; 1144 bytes.

````text
{
  "context_feasibility" : {
    "limiting_resource" : "memory_or_required_components",
    "maximum_feasible_window" : 0,
    "maximum_memory_ledger" : null,
    "maximum_pool_slots" : null,
    "maximum_prefill_chunk" : null,
    "refusal" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom",
    "requested_memory_ledger" : {
      "active_capacity_bytes" : 905969664,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 7921999104,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "mtp_resident_bytes" : 0,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1769472000,
      "prefill_bytes" : 332800000,
      "retained_capacity_bytes" : 179988480,
      "retained_recurrent_bytes" : 339738624,
      "version" : 1,
      "vision_resident_bytes" : 0
    },
    "requested_window" : 32768,
    "scope" : "memory feasibility; independent of prefill deadline"
  },
  "error" : {
    "code" : "insufficient_memory",
    "message" : "insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom"
  }
}

````

## governor-advisory-v198/32768-prefix-1.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
