---
type: run
created: 2026-10-05T07:39:18.831902+00:00
updated: 2026-10-05T07:41:35.729363+00:00
summary: Unchanged held-out answers, diagnosed Python ABI mismatch, synthetic grader checks and frozen unanswered-only recovery
binary: Frozen quality native image unchanged; no native invocation in this preparation
captured_at: 2026-10-05
command: python3 .build/quantization-research/prepare-heldout-grader-recovery-v1.py; Python 3.9 and 3.12 selected unit suites, exact commands below
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Preserved instruction grader ABI failure and prospective recovery
tool: Source custody audit, bounded synthetic workers and Python unit checks
---

The unanswered-only continuation stopped at the first instruction job after one complete answer had been journaled and before its grade existed. All preceding complete jobs remain unchanged. The parent terminated and drained its native process; no model process remained during this preparation. No partial score or aggregate was inspected.

The frozen worker imports NLTK and its regex dependency from a Python 3.12 package bundle. The coordinator invoked that worker under Python 3.9, which cannot load the cp312 extension. A synthetic probe reproduces the import failure. The already installed Python 3.12 interpreter runs the exact unchanged worker successfully on synthetic uppercase success and lowercase refusal fixtures under the original resource bounds. The preparation additionally imports every BFCL fixture class in its native sandbox with an empty synthetic call sequence. No held-out case participates in these probes.

A separate fresh-namespace source audit uses the previous frozen validator, retains the complete prefix and authenticates the one ungraded complete response without scoring it. The new execution-only protocol pins the matching interpreter and unchanged worker source. The generic host now performs the real synthetic preflight before any model load. The recovery creates an exclusive grading-attempt receipt, grades that preserved answer once, then runs only unanswered cases. It preserves prior time, attempted sessions and storage against the original limits and has no automatic retry. Final replay treats observed instruction-worker footprint as bounded custody, preserving both original and replay observations while comparing every outcome field exactly.

The raw preparation and unit receipts below contain no held-out response or aggregate. The actual source-audit closure includes opaque digests of answer files. Grader definitions are checked as unchanged ASTs; native files, task order, settings, margins and statistical method stay fixed. This source records preparation only: the recovery campaign has not started, and candidate qualification and all remaining product gates remain open.

## failure-coordinator.json

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/failure-coordinator.json`; bytes: 6067; SHA-256: `d02e17cc3ae78d2334731c7a692d186dd3f82f79d8ea27a4a8a97fb2a1f7f818`.

```json
{
  "schema": 1,
  "complete": false,
  "qualification": false,
  "protocol_sha256": "217b9c6ee846e401960b63f856bf418696837d29408a92e34996b7127a3362cf",
  "coordinator_sha256": "1d8558378882e9ca22e50451a156976b2570a81e3ee6efdc16cd5aa9d14a368e",
  "completed_jobs": [
    {
      "index": 0,
      "receipt_sha256": "029f708b9067441bb6e928d0359fb3bcdef26ca91c3ddaacc85b661a55742118"
    },
    {
      "index": 1,
      "receipt_sha256": "6cf12409f76cbe32e8a14b8275ca9df8cbc291bce8e8cbb04027a5590023bc83"
    },
    {
      "index": 2,
      "receipt_sha256": "535974a51a68e1c8d35b95c6688578dfbf0d0c8d428a1478175c0a796c6fcc8f"
    },
    {
      "index": 3,
      "receipt_sha256": "09c23e81a607ebcaa784b16fa4aedb42a9a568d2871dcbfe6fe6120f9a1af413"
    },
    {
      "index": 4,
      "receipt_sha256": "769023de05a06add30126db01ae42691714da32e5112f240668aec40533a22b9"
    },
    {
      "index": 5,
      "receipt_sha256": "a4e789c0ab1456e8a9abafc55746c761e22e6eba4cb68ef34d91fd79dee979b1"
    },
    {
      "index": 6,
      "receipt_sha256": "27a2459f54310d3b55b7d328e0e93ef434bbd4a9be39af02275e02ec0d4b751d"
    },
    {
      "index": 7,
      "receipt_sha256": "927a0a9a297771a9b741cacea49936c87872ace07078935153afd2917c8177a5"
    },
    {
      "index": 8,
      "receipt_sha256": "355b9931c6bbd96d71a90cce025d1b179a703ef03c65ea7e275e5c2524178be6"
    },
    {
      "index": 9,
      "receipt_sha256": "e510e4870d588b24c5a39e3a665bd47a4e06a6bb19aad87acdd0c14b5f59db5e"
    },
    {
      "index": 10,
      "receipt_sha256": "083ccc32cb0dfa8800b0899563995a1de1f802e997cd20007215e57b7ac0e7bf"
    },
    {
      "index": 11,
      "receipt_sha256": "4e7a25c2c65e6f4d0665aa7d195b24fa6c1293d05c66998257a0ed2890069577"
    },
    {
      "index": 12,
      "receipt_sha256": "271dfb77ee443a0a31f8491510701583827716793bcbcaa43b044e8b7e627c36"
    },
    {
      "index": 13,
      "receipt_sha256": "ee8eff3febcfc8b5a3ed469809645b8ca796007427a12517110d5ee1a73c3bdd"
    },
    {
      "index": 14,
      "receipt_sha256": "e2eb7a999658b9670df3298aa04555884dc86e87585aa9618ec68dd7c2e5888b"
    },
    {
      "index": 15,
      "receipt_sha256": "85a83b460c55908f8ae9c1be3dca788e304fe72416c4df5d76a03577e08af040"
    },
    {
      "index": 16,
      "receipt_sha256": "eccf25a024e764747cc29ade403bc32a08a5174038920385f7cbbb67f49edae0"
    },
    {
      "index": 17,
      "receipt_sha256": "875565dc55a6d961465cf6580f17a573b7cb80df251105775354310802e2e2dc"
    },
    {
      "index": 18,
      "receipt_sha256": "2e1763fd9d040a7cf4a1a2582640e5b3620966dc48993dc767e75c9a651cd8c5"
    },
    {
      "index": 19,
      "receipt_sha256": "e4eea2735eb5ac398495480a7208c3a5d22e2e05990c657506916e9a6f458a6e"
    },
    {
      "index": 20,
      "receipt_sha256": "f9b20815de5643f7f17e18a2c127f3b417c1623118c57a1ede0e0408690f9561"
    },
    {
      "index": 21,
      "receipt_sha256": "e03127e41adc9ba9e31803696b06be7f9b33d27046d06a9448634ab8267ef0e0"
    },
    {
      "index": 22,
      "receipt_sha256": "470f21fd0fd867e491055b07edf3fdcf71ddc30463a9827f166cce648ff0ebac"
    },
    {
      "index": 23,
      "receipt_sha256": "615e84e321583ed233550221ba1e937a11045b9eb043d0e1eca2ee97b8759371"
    },
    {
      "index": 24,
      "receipt_sha256": "a65f1b6d11c82d601cceb8301bc0b68c2e256cdc4b7ccdc0b59eae7822429a09"
    },
    {
      "index": 25,
      "receipt_sha256": "2a35983d1a04bd4577a141fa3a3c118a953d0d64fedccb7d6ab48dd919162932"
    },
    {
      "index": 26,
      "receipt_sha256": "72eb3436e4b3a3d26d8eb61437dddfb68c45644e130e293ed5bb79d6c576311e"
    },
    {
      "index": 27,
      "receipt_sha256": "d2e9a32af7b2fff034e228229fe082aeb81fe16ac996e499d4941e3b79de4f5d"
    },
    {
      "index": 28,
      "receipt_sha256": "9ffd974dbb773aa4d52cce28ab254363d3f3f181e5d82799c013853aa7b9d865"
    },
    {
      "index": 29,
      "receipt_sha256": "b86408faf0180f4a7dce37e6c8b3885d39df9b1753e8c5e739f0f88f2cce1f7b"
    },
    {
      "index": 30,
      "receipt_sha256": "d0617fa4188ac1f3acded914c670da524b034bb3ad7e6b507cab4fd86889e742"
    },
    {
      "index": 31,
      "receipt_sha256": "10d44ca7d95166ff742571417e582e5aeed594ce8d90e1063234e9edcfcd3527"
    },
    {
      "index": 32,
      "receipt_sha256": "ce887c7a7765f5339b6d1fd9f165861534b9c5a2466fb90c079aa7b4a63d6a6f"
    },
    {
      "index": 33,
      "receipt_sha256": "3fb1793897cfbfff3c5e2729cf420604b08d94d6a7018e4bcffe54c50dec9d3a"
    },
    {
      "index": 34,
      "receipt_sha256": "d3cfc5413da719b6f121917c47347ac3a815d0c81db72c6b68acb2f44696ddd9"
    },
    {
      "index": 35,
      "receipt_sha256": "d09e8577ca118df5faf8c7d659bbd613f0e807c3be566d6a2bc38c9a70aa64ab"
    },
    {
      "index": 36,
      "receipt_sha256": "6d6018a6993e3b3d27ca2362aca044d5feb38aa11feb7d0ca936b43f65843e6e"
    },
    {
      "index": 37,
      "receipt_sha256": "5869e90a6a156ee7af321980ae09c906f6be4d1673105cf79f4687027e05baa4"
    },
    {
      "index": 38,
      "receipt_sha256": "4bca4c1e5efd1eb43f2718796413d9528beac12591e40be1125fd865e1b313ff"
    },
    {
      "index": 39,
      "receipt_sha256": "020532b75ec0ff746450f95c5c8cc743d50bd41907b1bd71ad6c6901f266d4dc"
    },
    {
      "index": 40,
      "receipt_sha256": "0454d2b47ba52a373620921804960eb6704a60ad860be3faebba69a697e9923d"
    },
    {
      "index": 41,
      "receipt_sha256": "251684fffea74935b9090f706d04d4a61a94701df44c82445444fca35b9db1f3"
    },
    {
      "index": 42,
      "receipt_sha256": "80e0b79f2d32e19856d4f7f23bb08e683926ba8f4094487d100ee7bb2ca23f38"
    },
    {
      "index": 43,
      "receipt_sha256": "5c5c0d6c0ee61db0b6eadba5ea519a6bad4ad495719c330d0663041ee951281c"
    },
    {
      "index": 44,
      "receipt_sha256": "926285aabbc42d0fbbaf89b127e7783fc9140a8a7dcad633061e21cce4bb9260"
    },
    {
      "index": 45,
      "receipt_sha256": "859ff71897aacde8da29490a527edacc98f797c5123a7173e1a83ca132368e3b"
    }
  ],
  "seconds": 38579.907225332994,
  "active_job": 46,
  "failure": "RuntimeError: continuation job failed; preserve evidence and do not retry: 46"
}

```

## failure-job-0046-receipt.json

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/failure-job-0046-receipt.json`; bytes: 10306; SHA-256: `39eb70fffb3d47b900885619da776eb0e308f7835e6c4df98ee9a3fd27c71066`.

```json
{
  "schema": 1,
  "complete": false,
  "qualification": false,
  "protocol_sha256": "217b9c6ee846e401960b63f856bf418696837d29408a92e34996b7127a3362cf",
  "driver_sha256": "1cfac32d24de5b7b618cc0c5b15b2da93ea2f443ff291de92d93ea8876a3bca4",
  "job": {
    "index": 46,
    "family": "instruction",
    "ids": [
      "3478",
      "2465",
      "2023",
      "3442",
      "2532",
      "1242",
      "3311",
      "3565",
      "2943",
      "209",
      "349",
      "1466",
      "3743",
      "3329",
      "127",
      "1130",
      "3126",
      "2728",
      "2034",
      "1314"
    ],
    "arms": [
      "original",
      "candidate"
    ]
  },
  "sessions": [
    {
      "arm": "original",
      "complete": false,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 37153947648,
        "swapins": 20378,
        "swapouts": 156216,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   537941.\nPages active:                                 398562.\nPages inactive:                              1645610.\nPages speculative:                              1303.\nPages throttled:                                   0.\nPages wired down:                             169996.\nPages purgeable:                                6079.\n\"Translation faults\":                     3692611458.\nPages copy-on-write:                       293322431.\nPages zero filled:                       16938545323.\nPages reactivated:                         498179779.\nPages purged:                               16071985.\nFile-backed pages:                           1723677.\nAnonymous pages:                              321798.\nPages stored in compressor:                   929647.\nPages occupied by compressor:                 331499.\nDecompressions:                            156668341.\nCompressions:                              180409269.\nPageins:                                  5176376383.\nPageouts:                                    2649346.\nSwapins:                                       20378.\nSwapouts:                                     156216.\nPages tagged:                                 128675.\nPages tagged resident:                         80169.\nPages tagged compressed:                       48506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5354.\nPages tag-storage free:                          628.\nPages tag-storage non-tag pageable:            92314.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7505536.\nTagged compressions:                         1576535.\nTagged decompressions:                       1408648.\n"
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-affine-refit-native-v1/slotstream",
        "quantization-session",
        "--baseline",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--protocol-file",
        "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-outcome-protocol-v1/native.json",
        "--protocol-sha256",
        "c12a6c014eb26ec4ea96cd979c7fcd57060e0f63eacab4b754312d90f3bcf6e0",
        "--output",
        "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/run/job-0046/session-000-original"
      ],
      "pid": 24525,
      "peak_model_bytes": 8683281080,
      "peak_parent_bytes": 48857448,
      "identity": {
        "admission_refusals": 0,
        "baseline_revision": "aa7c790e804bbf9d491ddb109c3d61bc4a555f7c",
        "complete": false,
        "draft_depth": 2,
        "load_seconds": 8.500025958346669,
        "loaded": true,
        "manifest_sha256": "8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082",
        "maximum_requests": 256,
        "maximum_seconds": 1800,
        "model": "qwen3.8-flash-next:4bit",
        "output_limit": 4096,
        "plan": {
          "availability_clamped": false,
          "context_qualification": false,
          "decode_estimate_cache_in_measured_range": true,
          "decode_lookahead": false,
          "device_available_gb": 37.2,
          "device_ram_gb": 51.5,
          "device_working_set_gb": 40.2,
          "est_prefill_s_at_max_context": 200.57987878787887,
          "est_prefill_tok_s": 165,
          "est_warm_tok_s": 6.536702831057676,
          "expected_peak_gb": 13,
          "expected_peak_semantics": "planned_full_workload_envelope_not_measured_usage",
          "experts_per_layer_cached": 37,
          "fully_resident": false,
          "implementation_context_limit": 262144,
          "lookahead_reserve_bytes": 0,
          "max_context_tokens": 32768,
          "max_prefill_wait_minutes": 30,
          "max_ram_percent": 70,
          "memory_ledger": {
            "active_capacity_bytes": 981467136,
            "additional_active_bytes": 0,
            "expected_peak_bytes": 12998572288,
            "expert_workspace_bytes": 0,
            "fixed_bytes": 5300000000,
            "long_context_reserve_bytes": 0,
            "lookahead_reserve_bytes": 0,
            "mtp_resident_bytes": 389017600,
            "pack_resident_reserve_bytes": 0,
            "planning_margin_bytes": 1000000000,
            "pool_bytes": 4907520000,
            "prefill_bytes": 1331200000,
            "resource_identity": "original-affine4-memory-v1",
            "retained_capacity_bytes": 731096064,
            "retained_recurrent_bytes": 339738624,
            "version": 1,
            "vision_resident_bytes": 0
          },
          "memory_target_semantics": "process_budget_not_allocation_goal",
          "model_context_limit": 262144,
          "mtp": true,
          "mtp_context_limit": 262144,
          "mtp_streamed_experts": true,
          "non_cache_allowance_bytes": 8091052288,
          "planned_headroom_gb": 1,
          "pool_gb": 4.9,
          "pool_slots": 1775,
          "prefill_chunk": 1024,
          "prefill_wait_scope": "accepted_request_to_first_model_token",
          "prefix_cache_max_tokens": 26443,
          "resource_profile": "original-affine4-memory-v1",
          "runtime_prefix_cache_enabled": true,
          "source": "--memory-gb",
          "speed_evidence": "baseline_reference_estimate",
          "target_gb": 14,
          "vision": false,
          "vision_charged_gb": 0,
          "vision_context_limit": 65536,
          "vision_resident_gb": 0,
          "vision_resident_reserved": false
        },
        "prefix_cache": true,
        "protocol_kind": "quantization-tool-session-v2",
        "protocol_sha256": "c12a6c014eb26ec4ea96cd979c7fcd57060e0f63eacab4b754312d90f3bcf6e0",
        "qualification": false,
        "requests": 0,
        "resets": 0,
        "resource_identity": "original-affine4-memory-v1",
        "schema": 1,
        "scope": "held-out",
        "seed": 7
      },
      "release_settle_seconds": 1.059952333,
      "exit_code": -15,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 37096849408,
        "swapins": 20378,
        "swapouts": 156216,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   538837.\nPages active:                                 398625.\nPages inactive:                              1627858.\nPages speculative:                             15525.\nPages throttled:                                   0.\nPages wired down:                             172531.\nPages purgeable:                                2915.\n\"Translation faults\":                     3693217763.\nPages copy-on-write:                       293343026.\nPages zero filled:                       16939128249.\nPages reactivated:                         498181411.\nPages purged:                               16076770.\nFile-backed pages:                           1722460.\nAnonymous pages:                              319548.\nPages stored in compressor:                   928692.\nPages occupied by compressor:                 331160.\nDecompressions:                            156669283.\nCompressions:                              180409269.\nPageins:                                  5182841715.\nPageouts:                                    2649415.\nSwapins:                                       20378.\nSwapouts:                                     156216.\nPages tagged:                                 130049.\nPages tagged resident:                         82012.\nPages tagged compressed:                       48037.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5354.\nPages tag-storage free:                          842.\nPages tag-storage non-tag pageable:            92100.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7430784.\nTagged compressions:                         1576535.\nTagged decompressions:                       1409117.\n"
      },
      "seconds": 14.002350167
    }
  ],
  "outcomes": [],
  "seconds": 14.274580333000001,
  "failure": "RuntimeError: instruction grader infrastructure failed: Traceback (most recent call last):\n  File \"/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py\", line 246, in <module>\n    result=grade('instruction',request['case'],response,instruction_source=request['instruction_source'],runtime=request['runtime'])\n  File \"/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py\", line 206, in grade\n    import nltk\n  File \"/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/nltk/__init__.py\", line 139, in <module>\n    from nltk.text import *\n  File \"/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/nltk/text.py\", line 30, in <module>\n    from nltk.tokenize import sent_tokenize\n  File \"/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/nltk/tokenize/__init__.py\""
}

```

## failure-job-0046-session-000-original-receipt.json

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/failure-job-0046-session-000-original-receipt.json`; bytes: 2529; SHA-256: `307f7ed2a9ca95bf874e463f5809805de7ca1c1f924ab3ec1453002fe5123702`.

```json
{"admission_refusals":0,"baseline_revision":"aa7c790e804bbf9d491ddb109c3d61bc4a555f7c","complete":false,"draft_depth":2,"load_seconds":8.5000259583466686,"loaded":true,"manifest_sha256":"8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082","maximum_requests":256,"maximum_seconds":1800,"model":"qwen3.8-flash-next:4bit","output_limit":4096,"peak_process_bytes":8683281080,"plan":{"availability_clamped":false,"context_qualification":false,"decode_estimate_cache_in_measured_range":true,"decode_lookahead":false,"device_available_gb":37.200000000000003,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":200.57987878787887,"est_prefill_tok_s":165,"est_warm_tok_s":6.536702831057676,"expected_peak_gb":13,"expected_peak_semantics":"planned_full_workload_envelope_not_measured_usage","experts_per_layer_cached":37,"fully_resident":false,"implementation_context_limit":262144,"lookahead_reserve_bytes":0,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":981467136,"additional_active_bytes":0,"expected_peak_bytes":12998572288,"expert_workspace_bytes":0,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"lookahead_reserve_bytes":0,"mtp_resident_bytes":389017600,"pack_resident_reserve_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":4907520000,"prefill_bytes":1331200000,"resource_identity":"original-affine4-memory-v1","retained_capacity_bytes":731096064,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"memory_target_semantics":"process_budget_not_allocation_goal","model_context_limit":262144,"mtp":true,"mtp_context_limit":262144,"mtp_streamed_experts":true,"non_cache_allowance_bytes":8091052288,"planned_headroom_gb":1,"pool_gb":4.9000000000000004,"pool_slots":1775,"prefill_chunk":1024,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":26443,"resource_profile":"original-affine4-memory-v1","runtime_prefix_cache_enabled":true,"source":"--memory-gb","speed_evidence":"baseline_reference_estimate","target_gb":14,"vision":false,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0,"vision_resident_reserved":false},"prefix_cache":true,"protocol_kind":"quantization-tool-session-v2","protocol_sha256":"c12a6c014eb26ec4ea96cd979c7fcd57060e0f63eacab4b754312d90f3bcf6e0","qualification":false,"requests":1,"resets":1,"resource_identity":"original-affine4-memory-v1","schema":1,"scope":"held-out","seed":7}
```

## synthetic-probe.json

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/synthetic-probe.json`; bytes: 1045; SHA-256: `df0abb4e37406015aa6696ec3ba5845948bffbefc9922451cb35038e5b89e58c`.

```json
{
  "command": [
    "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/Resources/Python.app/Contents/MacOS/Python",
    "-I",
    "-S",
    "-B",
    "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py",
    "--instruction-worker"
  ],
  "synthetic_payload": {
    "case": {
      "grader": {}
    },
    "text": "Synthetic infrastructure probe only.",
    "instruction_source": "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1",
    "runtime": "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages"
  },
  "exit_code": 1,
  "seconds": 0.22813983300000001,
  "worker_sha256": "a687b732cb7cddf3008cf5238b6102d4ccbbf7bc419447e2e4c4b4c7f2775326",
  "python_version": "3.9.6 (default, May 22 2026, 11:13:45) \n[Clang 21.0.0 (clang-2100.1.1.101)]",
  "python_executable_sha256": "0b7aad9bf1adf74d3922cf351f7d2e908dae19edd5456299d162810ae083523d"
}

```

## synthetic-probe.stderr

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/synthetic-probe.stderr`; bytes: 1902; SHA-256: `05378053784e57437277dcfcbc4a5c3954dc2e9b2f31b0720b279a769278459b`.

```text
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py", line 246, in <module>
    result=grade('instruction',request['case'],response,instruction_source=request['instruction_source'],runtime=request['runtime'])
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py", line 206, in grade
    import nltk
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/nltk/__init__.py", line 139, in <module>
    from nltk.text import *
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/nltk/text.py", line 30, in <module>
    from nltk.tokenize import sent_tokenize
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/nltk/tokenize/__init__.py", line 66, in <module>
    from nltk.tokenize.casual import TweetTokenizer, casual_tokenize
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/nltk/tokenize/casual.py", line 49, in <module>
    import regex  # https://github.com/nltk/nltk/issues/2409
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/regex/__init__.py", line 1, in <module>
    from .regex import *
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/regex/regex.py", line 417, in <module>
    import regex._regex_core as _regex_core
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages/regex/_regex_core.py", line 21, in <module>
    import regex._regex as _regex
ModuleNotFoundError: No module named 'regex._regex'

```

## python312-synthetic-checks.json

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/python312-synthetic-checks.json`; bytes: 1850; SHA-256: `a6df377a66a4fe2baa4af54035de30cebfb0e6c4cfdeb498f594f7a19ce289da`.

```json
{
  "scope": "Synthetic pass/refusal fixtures only; no held-out response read or graded",
  "python": {
    "version": "3.12.9 (main, Feb 12 2025, 15:09:19) [Clang 19.1.6 ]",
    "executable": "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "executable_sha256": "e878533ce71a6e91b0fae5e8bbe8baebbb6194dad84fead52e9b42f0620ad011",
    "base_prefix": "/Users/carlos/.pyenv/versions/3.12.9",
    "cache_tag": "cpython-312"
  },
  "unchanged_frozen_worker_sha256": "a687b732cb7cddf3008cf5238b6102d4ccbbf7bc419447e2e4c4b4c7f2775326",
  "runs": [
    {
      "fixture": "capital",
      "expected": true,
      "result": {
        "passed": true,
        "instructions": [
          true
        ],
        "method": "upstream-strict-prompt",
        "peak_worker_bytes": 104006208
      },
      "seconds": 0.2539005000144243,
      "command": [
        "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
        "-I",
        "-S",
        "-B",
        "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py",
        "--instruction-worker"
      ]
    },
    {
      "fixture": "lowercase",
      "expected": false,
      "result": {
        "passed": false,
        "instructions": [
          false
        ],
        "method": "upstream-strict-prompt",
        "peak_worker_bytes": 36192760
      },
      "seconds": 0.08634516701567918,
      "command": [
        "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
        "-I",
        "-S",
        "-B",
        "/Users/carlos/Projects/slotstream/.build/quantization-research/heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py",
        "--instruction-worker"
      ]
    }
  ]
}

```

## explicit-worker-preflight.json

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/explicit-worker-preflight.json`; bytes: 896; SHA-256: `906048878a982a4a786665b1ed6dfcc88b44a3f7f8266fd66f508fbb085e4eb6`.

```json
{
  "coordinator_python": "3.9.6 (default, May 22 2026, 11:13:45) \n[Clang 21.0.0 (clang-2100.1.1.101)]",
  "worker_python": {
    "version": "3.12.9 (main, Feb 12 2025, 15:09:19) [Clang 19.1.6 ]",
    "executable": "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "executable_sha256": "e878533ce71a6e91b0fae5e8bbe8baebbb6194dad84fead52e9b42f0620ad011",
    "base_prefix": "/Users/carlos/.pyenv/versions/3.12.9",
    "cache_tag": "cpython-312"
  },
  "synthetic_preflight": [
    {
      "passed": true,
      "instructions": [
        true
      ],
      "method": "upstream-strict-prompt",
      "peak_worker_bytes": 104038976
    },
    {
      "passed": false,
      "instructions": [
        false
      ],
      "method": "upstream-strict-prompt",
      "peak_worker_bytes": 36209144
    }
  ],
  "model_runs": 0,
  "heldout_answers_graded": 0
}

```

## source-audit.json

Local evidence: `.build/quantization-research/heldout-grader-import-diagnosis-v1/source-audit.json`; bytes: 75730; SHA-256: `a4232e0d235721eff1e8e5b47dd243f945e085b7e4a736f26626cdb7b7d0e4ed`.

```json
{
  "schema": 1,
  "kind": "first-instruction-import-custody-v1",
  "complete": true,
  "previous_protocol_sha256": "217b9c6ee846e401960b63f856bf418696837d29408a92e34996b7127a3362cf",
  "source_output": "heldout-unanswered-continuation-v1/run",
  "stop_job": 46,
  "completed_jobs": [
    {
      "index": 0,
      "receipt_sha256": "029f708b9067441bb6e928d0359fb3bcdef26ca91c3ddaacc85b661a55742118"
    },
    {
      "index": 1,
      "receipt_sha256": "6cf12409f76cbe32e8a14b8275ca9df8cbc291bce8e8cbb04027a5590023bc83"
    },
    {
      "index": 2,
      "receipt_sha256": "535974a51a68e1c8d35b95c6688578dfbf0d0c8d428a1478175c0a796c6fcc8f"
    },
    {
      "index": 3,
      "receipt_sha256": "09c23e81a607ebcaa784b16fa4aedb42a9a568d2871dcbfe6fe6120f9a1af413"
    },
    {
      "index": 4,
      "receipt_sha256": "769023de05a06add30126db01ae42691714da32e5112f240668aec40533a22b9"
    },
    {
      "index": 5,
      "receipt_sha256": "a4e789c0ab1456e8a9abafc55746c761e22e6eba4cb68ef34d91fd79dee979b1"
    },
    {
      "index": 6,
      "receipt_sha256": "27a2459f54310d3b55b7d328e0e93ef434bbd4a9be39af02275e02ec0d4b751d"
    },
    {
      "index": 7,
      "receipt_sha256": "927a0a9a297771a9b741cacea49936c87872ace07078935153afd2917c8177a5"
    },
    {
      "index": 8,
      "receipt_sha256": "355b9931c6bbd96d71a90cce025d1b179a703ef03c65ea7e275e5c2524178be6"
    },
    {
      "index": 9,
      "receipt_sha256": "e510e4870d588b24c5a39e3a665bd47a4e06a6bb19aad87acdd0c14b5f59db5e"
    },
    {
      "index": 10,
      "receipt_sha256": "083ccc32cb0dfa8800b0899563995a1de1f802e997cd20007215e57b7ac0e7bf"
    },
    {
      "index": 11,
      "receipt_sha256": "4e7a25c2c65e6f4d0665aa7d195b24fa6c1293d05c66998257a0ed2890069577"
    },
    {
      "index": 12,
      "receipt_sha256": "271dfb77ee443a0a31f8491510701583827716793bcbcaa43b044e8b7e627c36"
    },
    {
      "index": 13,
      "receipt_sha256": "ee8eff3febcfc8b5a3ed469809645b8ca796007427a12517110d5ee1a73c3bdd"
    },
    {
      "index": 14,
      "receipt_sha256": "e2eb7a999658b9670df3298aa04555884dc86e87585aa9618ec68dd7c2e5888b"
    },
    {
      "index": 15,
      "receipt_sha256": "85a83b460c55908f8ae9c1be3dca788e304fe72416c4df5d76a03577e08af040"
    },
    {
      "index": 16,
      "receipt_sha256": "eccf25a024e764747cc29ade403bc32a08a5174038920385f7cbbb67f49edae0"
    },
    {
      "index": 17,
      "receipt_sha256": "875565dc55a6d961465cf6580f17a573b7cb80df251105775354310802e2e2dc"
    },
    {
      "index": 18,
      "receipt_sha256": "2e1763fd9d040a7cf4a1a2582640e5b3620966dc48993dc767e75c9a651cd8c5"
    },
    {
      "index": 19,
      "receipt_sha256": "e4eea2735eb5ac398495480a7208c3a5d22e2e05990c657506916e9a6f458a6e"
    },
    {
      "index": 20,
      "receipt_sha256": "f9b20815de5643f7f17e18a2c127f3b417c1623118c57a1ede0e0408690f9561"
    },
    {
      "index": 21,
      "receipt_sha256": "e03127e41adc9ba9e31803696b06be7f9b33d27046d06a9448634ab8267ef0e0"
    },
    {
      "index": 22,
      "receipt_sha256": "470f21fd0fd867e491055b07edf3fdcf71ddc30463a9827f166cce648ff0ebac"
    },
    {
      "index": 23,
      "receipt_sha256": "615e84e321583ed233550221ba1e937a11045b9eb043d0e1eca2ee97b8759371"
    },
    {
      "index": 24,
      "receipt_sha256": "a65f1b6d11c82d601cceb8301bc0b68c2e256cdc4b7ccdc0b59eae7822429a09"
    },
    {
      "index": 25,
      "receipt_sha256": "2a35983d1a04bd4577a141fa3a3c118a953d0d64fedccb7d6ab48dd919162932"
    },
    {
      "index": 26,
      "receipt_sha256": "72eb3436e4b3a3d26d8eb61437dddfb68c45644e130e293ed5bb79d6c576311e"
    },
    {
      "index": 27,
      "receipt_sha256": "d2e9a32af7b2fff034e228229fe082aeb81fe16ac996e499d4941e3b79de4f5d"
    },
    {
      "index": 28,
      "receipt_sha256": "9ffd974dbb773aa4d52cce28ab254363d3f3f181e5d82799c013853aa7b9d865"
    },
    {
      "index": 29,
      "receipt_sha256": "b86408faf0180f4a7dce37e6c8b3885d39df9b1753e8c5e739f0f88f2cce1f7b"
    },
    {
      "index": 30,
      "receipt_sha256": "d0617fa4188ac1f3acded914c670da524b034bb3ad7e6b507cab4fd86889e742"
    },
    {
      "index": 31,
      "receipt_sha256": "10d44ca7d95166ff742571417e582e5aeed594ce8d90e1063234e9edcfcd3527"
    },
    {
      "index": 32,
      "receipt_sha256": "ce887c7a7765f5339b6d1fd9f165861534b9c5a2466fb90c079aa7b4a63d6a6f"
    },
    {
      "index": 33,
      "receipt_sha256": "3fb1793897cfbfff3c5e2729cf420604b08d94d6a7018e4bcffe54c50dec9d3a"
    },
    {
      "index": 34,
      "receipt_sha256": "d3cfc5413da719b6f121917c47347ac3a815d0c81db72c6b68acb2f44696ddd9"
    },
    {
      "index": 35,
      "receipt_sha256": "d09e8577ca118df5faf8c7d659bbd613f0e807c3be566d6a2bc38c9a70aa64ab"
    },
    {
      "index": 36,
      "receipt_sha256": "6d6018a6993e3b3d27ca2362aca044d5feb38aa11feb7d0ca936b43f65843e6e"
    },
    {
      "index": 37,
      "receipt_sha256": "5869e90a6a156ee7af321980ae09c906f6be4d1673105cf79f4687027e05baa4"
    },
    {
      "index": 38,
      "receipt_sha256": "4bca4c1e5efd1eb43f2718796413d9528beac12591e40be1125fd865e1b313ff"
    },
    {
      "index": 39,
      "receipt_sha256": "020532b75ec0ff746450f95c5c8cc743d50bd41907b1bd71ad6c6901f266d4dc"
    },
    {
      "index": 40,
      "receipt_sha256": "0454d2b47ba52a373620921804960eb6704a60ad860be3faebba69a697e9923d"
    },
    {
      "index": 41,
      "receipt_sha256": "251684fffea74935b9090f706d04d4a61a94701df44c82445444fca35b9db1f3"
    },
    {
      "index": 42,
      "receipt_sha256": "80e0b79f2d32e19856d4f7f23bb08e683926ba8f4094487d100ee7bb2ca23f38"
    },
    {
      "index": 43,
      "receipt_sha256": "5c5c0d6c0ee61db0b6eadba5ea519a6bad4ad495719c330d0663041ee951281c"
    },
    {
      "index": 44,
      "receipt_sha256": "926285aabbc42d0fbbaf89b127e7783fc9140a8a7dcad633061e21cce4bb9260"
    },
    {
      "index": 45,
      "receipt_sha256": "859ff71897aacde8da29490a527edacc98f797c5123a7173e1a83ca132368e3b"
    }
  ],
  "source_files": {
    "heldout-unanswered-continuation-v1/run/campaign.lock": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "heldout-unanswered-continuation-v1/run/coordinator.json": "d02e17cc3ae78d2334731c7a692d186dd3f82f79d8ea27a4a8a97fb2a1f7f818",
    "heldout-unanswered-continuation-v1/run/job-0000/receipt.json": "029f708b9067441bb6e928d0359fb3bcdef26ca91c3ddaacc85b661a55742118",
    "heldout-unanswered-continuation-v1/run/job-0000.driver.log": "9cca36806137741e2bcb4da94075c23350dc241560bc833319545358ee3d9fae",
    "heldout-unanswered-continuation-v1/run/job-0001/receipt.json": "6cf12409f76cbe32e8a14b8275ca9df8cbc291bce8e8cbb04027a5590023bc83",
    "heldout-unanswered-continuation-v1/run/job-0001.driver.log": "5c8b4576ba9835c32953d10458a5b26eb0d79c07504a2747551f731a9d37a40d",
    "heldout-unanswered-continuation-v1/run/job-0002/receipt.json": "535974a51a68e1c8d35b95c6688578dfbf0d0c8d428a1478175c0a796c6fcc8f",
    "heldout-unanswered-continuation-v1/run/job-0002.driver.log": "5fb0a62e4369069c85ba4f08deddc116aea96ea22fea4f9e4820b33ba5376265",
    "heldout-unanswered-continuation-v1/run/job-0003/receipt.json": "09c23e81a607ebcaa784b16fa4aedb42a9a568d2871dcbfe6fe6120f9a1af413",
    "heldout-unanswered-continuation-v1/run/job-0003.driver.log": "642f085889bb08a542c4ec22af9c27f66799a0aeef992cd3fabc67aca16468eb",
    "heldout-unanswered-continuation-v1/run/job-0004/receipt.json": "769023de05a06add30126db01ae42691714da32e5112f240668aec40533a22b9",
    "heldout-unanswered-continuation-v1/run/job-0004.driver.log": "c1d9dc899a85049ca7b6e9cdb1147dfccb430ec597bfd265ad9d1212d7960348",
    "heldout-unanswered-continuation-v1/run/job-0005/receipt.json": "a4e789c0ab1456e8a9abafc55746c761e22e6eba4cb68ef34d91fd79dee979b1",
    "heldout-unanswered-continuation-v1/run/job-0005.driver.log": "c9d0b43a113a9635218296b87680ee57bc3a12fd1b33442c60315ca39d1de0a1",
    "heldout-unanswered-continuation-v1/run/job-0006/receipt.json": "27a2459f54310d3b55b7d328e0e93ef434bbd4a9be39af02275e02ec0d4b751d",
    "heldout-unanswered-continuation-v1/run/job-0006.driver.log": "ad74365b4d55c64e1d1aa785cd55961b90e74cb9125d460e36d6a28999335f9e",
    "heldout-unanswered-continuation-v1/run/job-0007/receipt.json": "927a0a9a297771a9b741cacea49936c87872ace07078935153afd2917c8177a5",
    "heldout-unanswered-continuation-v1/run/job-0007.driver.log": "024015fc9653e3186c860040b9c99d8adf0729a78e935d306703073db55d7c52",
    "heldout-unanswered-continuation-v1/run/job-0008/receipt.json": "355b9931c6bbd96d71a90cce025d1b179a703ef03c65ea7e275e5c2524178be6",
    "heldout-unanswered-continuation-v1/run/job-0008.driver.log": "f09c2094cabc64d8f872434fbd19dd7155e36c2ee752636e85bcd16868303447",
    "heldout-unanswered-continuation-v1/run/job-0009/receipt.json": "e510e4870d588b24c5a39e3a665bd47a4e06a6bb19aad87acdd0c14b5f59db5e",
    "heldout-unanswered-continuation-v1/run/job-0009.driver.log": "0a41b15f677b8bb7712d97beea4e988cdb0dd23f97ae790e16cd22669ebbb9d5",
    "heldout-unanswered-continuation-v1/run/job-0010/receipt.json": "083ccc32cb0dfa8800b0899563995a1de1f802e997cd20007215e57b7ac0e7bf",
    "heldout-unanswered-continuation-v1/run/job-0010.driver.log": "ec74e0f81a2db4067ff1a2d95b8a640c734529e3081ef513c6471a894395af6d",
    "heldout-unanswered-continuation-v1/run/job-0011/receipt.json": "4e7a25c2c65e6f4d0665aa7d195b24fa6c1293d05c66998257a0ed2890069577",
    "heldout-unanswered-continuation-v1/run/job-0011.driver.log": "8b53e673e84a706d075afe694ad673180d7b3a733ada34fe801b2b0b7e7d8365",
    "heldout-unanswered-continuation-v1/run/job-0012/receipt.json": "271dfb77ee443a0a31f8491510701583827716793bcbcaa43b044e8b7e627c36",
    "heldout-unanswered-continuation-v1/run/job-0012.driver.log": "44d07d426a5b680c732bcd96b8448d2eff78b3f8d17f4b37a910e55bc654bfd5",
    "heldout-unanswered-continuation-v1/run/job-0013/receipt.json": "ee8eff3febcfc8b5a3ed469809645b8ca796007427a12517110d5ee1a73c3bdd",
    "heldout-unanswered-continuation-v1/run/job-0013.driver.log": "84d652a3756f8706a36a30a6d8f04d37bfa2af16de5fae336159e8ad81bfa6c1",
    "heldout-unanswered-continuation-v1/run/job-0014/receipt.json": "e2eb7a999658b9670df3298aa04555884dc86e87585aa9618ec68dd7c2e5888b",
    "heldout-unanswered-continuation-v1/run/job-0014.driver.log": "79057a02b3356d055f67753a422f9f350e303c4c1931f7343712bb7126851c96",
    "heldout-unanswered-continuation-v1/run/job-0015/receipt.json": "85a83b460c55908f8ae9c1be3dca788e304fe72416c4df5d76a03577e08af040",
    "heldout-unanswered-continuation-v1/run/job-0015.driver.log": "70299d2dfd7012092154eabdcbcd4a621e4999abfbe3e48a92e18703e90d5e02",
    "heldout-unanswered-continuation-v1/run/job-0016/receipt.json": "eccf25a024e764747cc29ade403bc32a08a5174038920385f7cbbb67f49edae0",
    "heldout-unanswered-continuation-v1/run/job-0016.driver.log": "b6430903ba90b64ccbcb520faf549c1b76927f84f87b6ada9f65acc37edb4a88",
    "heldout-unanswered-continuation-v1/run/job-0017/receipt.json": "875565dc55a6d961465cf6580f17a573b7cb80df251105775354310802e2e2dc",
    "heldout-unanswered-continuation-v1/run/job-0017.driver.log": "a79ec0e03d5117076c7f857c8ff5d01034bde89d582e406e585b467d4d35787e",
    "heldout-unanswered-continuation-v1/run/job-0018/receipt.json": "2e1763fd9d040a7cf4a1a2582640e5b3620966dc48993dc767e75c9a651cd8c5",
    "heldout-unanswered-continuation-v1/run/job-0018/session-003-candidate/conversation.jsonl": "262c55f7e666134aa725bdaff98a999eb3cc03f8528f60f2479e3898306e3361",
    "heldout-unanswered-continuation-v1/run/job-0018/session-003-candidate/receipt.json": "a9558cf82f2d0ab61483c74149a2e80441fc8a65a814d3a9aeb184a6c5472a98",
    "heldout-unanswered-continuation-v1/run/job-0018/session-003-candidate.stderr": "02bd2f957d7b9fbf82f1ba7432c2bb2c3c956e85ddc29ab8ec4c8e9c2f72553c",
    "heldout-unanswered-continuation-v1/run/job-0018/session-003-candidate.stdout": "262c55f7e666134aa725bdaff98a999eb3cc03f8528f60f2479e3898306e3361",
    "heldout-unanswered-continuation-v1/run/job-0018.driver.log": "183add433ff902436b8d1e166703b06d22f949929d3b38771be391e36b845467",
    "heldout-unanswered-continuation-v1/run/job-0019/receipt.json": "e4eea2735eb5ac398495480a7208c3a5d22e2e05990c657506916e9a6f458a6e",
    "heldout-unanswered-continuation-v1/run/job-0019/session-000-candidate/conversation.jsonl": "2bab4767c88c17b7349146e5c24be2f831f1c2cb9e680efcc9a693687b5cd8b8",
    "heldout-unanswered-continuation-v1/run/job-0019/session-000-candidate/receipt.json": "4af13fdef7c68e8bac1ee7cf8ab59bd0578d5cc7084e8820cd41ca8968dccc36",
    "heldout-unanswered-continuation-v1/run/job-0019/session-000-candidate.stderr": "69c2cd485dd1ad93853763d20ef02d8fc270055bc4c63e8dcba2d541e17fb24d",
    "heldout-unanswered-continuation-v1/run/job-0019/session-000-candidate.stdout": "2bab4767c88c17b7349146e5c24be2f831f1c2cb9e680efcc9a693687b5cd8b8",
    "heldout-unanswered-continuation-v1/run/job-0019/session-001-candidate/conversation.jsonl": "dec2e18bf940ff798404ac5bff093bb3c3925ecb123172dc8bed90646154ee36",
    "heldout-unanswered-continuation-v1/run/job-0019/session-001-candidate/receipt.json": "c5659791c9c4b14b0860c46ec840b06f5a203063c58eef10c6b47ef8f7893056",
    "heldout-unanswered-continuation-v1/run/job-0019/session-001-candidate.stderr": "1171209c3ef8ce1af7ba194649bc74cde2a3df21bff13e6c4ae97e0c799671f4",
    "heldout-unanswered-continuation-v1/run/job-0019/session-001-candidate.stdout": "dec2e18bf940ff798404ac5bff093bb3c3925ecb123172dc8bed90646154ee36",
    "heldout-unanswered-continuation-v1/run/job-0019/session-002-original/conversation.jsonl": "1cc0e50b9b7a424dc686d59bf2a48d1d663d19c71387b13c60b03bce9bfe8d41",
    "heldout-unanswered-continuation-v1/run/job-0019/session-002-original/receipt.json": "1fb8d164e59a93475ed98aa6ddbfd653c49d1991605f7eea7ef9c71ad9173787",
    "heldout-unanswered-continuation-v1/run/job-0019/session-002-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0019/session-002-original.stdout": "1cc0e50b9b7a424dc686d59bf2a48d1d663d19c71387b13c60b03bce9bfe8d41",
    "heldout-unanswered-continuation-v1/run/job-0019.driver.log": "be0c3ed5c390ed5cb63c56cf2831cbe7129e432c653a4448e35ce7ff64052ede",
    "heldout-unanswered-continuation-v1/run/job-0020/receipt.json": "f9b20815de5643f7f17e18a2c127f3b417c1623118c57a1ede0e0408690f9561",
    "heldout-unanswered-continuation-v1/run/job-0020/session-000-original/conversation.jsonl": "2d9dcf25426c7260a130801cd8edaca1971102de8b713aae9ad29855d56bd092",
    "heldout-unanswered-continuation-v1/run/job-0020/session-000-original/receipt.json": "a2a0535e51776c0c21f3f9818d43e366e199403afc605653156e5b2c4dda4eee",
    "heldout-unanswered-continuation-v1/run/job-0020/session-000-original.stderr": "26ca4841eb74da8e3e1fea57f6cb2f773a904616110eec2fcbc870d7d680383e",
    "heldout-unanswered-continuation-v1/run/job-0020/session-000-original.stdout": "2d9dcf25426c7260a130801cd8edaca1971102de8b713aae9ad29855d56bd092",
    "heldout-unanswered-continuation-v1/run/job-0020/session-001-original/conversation.jsonl": "87a78281a1a3980119402be1a95dc1a7cc4c14207a0097315bf0a70ee32fe415",
    "heldout-unanswered-continuation-v1/run/job-0020/session-001-original/receipt.json": "b13223ec496bb6005fb7e4467a9062562599397e6daf70f70248a3cf2b607569",
    "heldout-unanswered-continuation-v1/run/job-0020/session-001-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0020/session-001-original.stdout": "87a78281a1a3980119402be1a95dc1a7cc4c14207a0097315bf0a70ee32fe415",
    "heldout-unanswered-continuation-v1/run/job-0020/session-002-original/conversation.jsonl": "d2e82c4afde4ab61fc360f70f3e3cad9f447843022ed84331013b51f9677201b",
    "heldout-unanswered-continuation-v1/run/job-0020/session-002-original/receipt.json": "3a3a68f7b230099986c7435cddeed83fcfda50e64c3a7bb807a70c4f19595021",
    "heldout-unanswered-continuation-v1/run/job-0020/session-002-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0020/session-002-original.stdout": "d2e82c4afde4ab61fc360f70f3e3cad9f447843022ed84331013b51f9677201b",
    "heldout-unanswered-continuation-v1/run/job-0020/session-003-candidate/conversation.jsonl": "2926d3af23dc1493c235e8843a01399d812abfd0663920e4606883cd82906776",
    "heldout-unanswered-continuation-v1/run/job-0020/session-003-candidate/receipt.json": "4ab8ab91ef78bd0c10dd60f23be6c728891b0939f539cb4576371316a9c7fe83",
    "heldout-unanswered-continuation-v1/run/job-0020/session-003-candidate.stderr": "0e1bde4ab6ff41156e9aa92b310169eecbc9eb72578dfba920b64a6c6badfeb1",
    "heldout-unanswered-continuation-v1/run/job-0020/session-003-candidate.stdout": "2926d3af23dc1493c235e8843a01399d812abfd0663920e4606883cd82906776",
    "heldout-unanswered-continuation-v1/run/job-0020/session-004-candidate/conversation.jsonl": "089ce1a1394cac867bcead2b172d30b07b0f817afc72d059a2e7e04eaf29cdec",
    "heldout-unanswered-continuation-v1/run/job-0020/session-004-candidate/receipt.json": "f9ecb4aae30201b6a94e333c86077c36634ef6fb8bcc9e36ae8bb16c0c4d9e25",
    "heldout-unanswered-continuation-v1/run/job-0020/session-004-candidate.stderr": "80db7a8b6f78d35b9b8a353099fcf00504acd3f3a2af86103beec170bbef5eb4",
    "heldout-unanswered-continuation-v1/run/job-0020/session-004-candidate.stdout": "089ce1a1394cac867bcead2b172d30b07b0f817afc72d059a2e7e04eaf29cdec",
    "heldout-unanswered-continuation-v1/run/job-0020.driver.log": "1c4ce700d27e120b4be4c69356276a0847f2ed238b4ab8c8535022e7f9bfe8af",
    "heldout-unanswered-continuation-v1/run/job-0021/receipt.json": "e03127e41adc9ba9e31803696b06be7f9b33d27046d06a9448634ab8267ef0e0",
    "heldout-unanswered-continuation-v1/run/job-0021/session-000-candidate/conversation.jsonl": "1b626bfef65f658e92915365161dbffaa9385f4b185c3420df280ddab38bfb1f",
    "heldout-unanswered-continuation-v1/run/job-0021/session-000-candidate/receipt.json": "864c08afa5cd8ff049a2d72744d19bae9ae9fd08806fd2dc8f8c7da4c07e7070",
    "heldout-unanswered-continuation-v1/run/job-0021/session-000-candidate.stderr": "b68b91c889551ae938048d56eb67aed875c3bc3e590f41fd69cfb31ec707cdd7",
    "heldout-unanswered-continuation-v1/run/job-0021/session-000-candidate.stdout": "1b626bfef65f658e92915365161dbffaa9385f4b185c3420df280ddab38bfb1f",
    "heldout-unanswered-continuation-v1/run/job-0021/session-001-candidate/conversation.jsonl": "e55af3c980554c3451c6116ba39cafef907fda5f03e62bf7e29a318ecde7e049",
    "heldout-unanswered-continuation-v1/run/job-0021/session-001-candidate/receipt.json": "e3ad4ea242c1d02d2bb433ba7368b3ef51a2c393dd13d78b932e650cbcb933e0",
    "heldout-unanswered-continuation-v1/run/job-0021/session-001-candidate.stderr": "4245794128c9254f9f44fe42ca5c34794eaae1aab1d5adb59e158ea9ce50bac1",
    "heldout-unanswered-continuation-v1/run/job-0021/session-001-candidate.stdout": "e55af3c980554c3451c6116ba39cafef907fda5f03e62bf7e29a318ecde7e049",
    "heldout-unanswered-continuation-v1/run/job-0021/session-002-original/conversation.jsonl": "c318cfb9938f8951a7655235e13d7f026bab46f045e159dfbbb58c3741cc13fd",
    "heldout-unanswered-continuation-v1/run/job-0021/session-002-original/receipt.json": "87cdc91dfada8fec48d907166fea0b143bf1c707c73722cd538df4ffe0c56208",
    "heldout-unanswered-continuation-v1/run/job-0021/session-002-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0021/session-002-original.stdout": "c318cfb9938f8951a7655235e13d7f026bab46f045e159dfbbb58c3741cc13fd",
    "heldout-unanswered-continuation-v1/run/job-0021/session-003-original/conversation.jsonl": "708b6dbd25ab5f7fae37954b6dcf04a9bb71ee68e336d26b6b1200306b4a648a",
    "heldout-unanswered-continuation-v1/run/job-0021/session-003-original/receipt.json": "fb012eb84138d5bc77176cb51baac5a9fbddb4d057bc4dad5220314f17113557",
    "heldout-unanswered-continuation-v1/run/job-0021/session-003-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0021/session-003-original.stdout": "708b6dbd25ab5f7fae37954b6dcf04a9bb71ee68e336d26b6b1200306b4a648a",
    "heldout-unanswered-continuation-v1/run/job-0021.driver.log": "d7d8a24aeac806088cbbf39904bd57fadb8cba80d4c2cde8b99b174f1b55b23d",
    "heldout-unanswered-continuation-v1/run/job-0022/receipt.json": "470f21fd0fd867e491055b07edf3fdcf71ddc30463a9827f166cce648ff0ebac",
    "heldout-unanswered-continuation-v1/run/job-0022/session-000-original/conversation.jsonl": "d26768edd7639d8221fe74c7e163df0fef129b925f1d24866fa2377ab61f596e",
    "heldout-unanswered-continuation-v1/run/job-0022/session-000-original/receipt.json": "0efdb1dc9d9c7b4dd34da1f5b44230308c524dc1c4dce5b7fd7f810a47e22c4f",
    "heldout-unanswered-continuation-v1/run/job-0022/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0022/session-000-original.stdout": "d26768edd7639d8221fe74c7e163df0fef129b925f1d24866fa2377ab61f596e",
    "heldout-unanswered-continuation-v1/run/job-0022/session-001-original/conversation.jsonl": "c1537c7cd32c7f8cf37c13afc556ea747988de62d92c83b145fe0bc966932796",
    "heldout-unanswered-continuation-v1/run/job-0022/session-001-original/receipt.json": "04fe107cab415b07407ce4aca736899cec491a84a18c0c0a42470a5fbc3d554a",
    "heldout-unanswered-continuation-v1/run/job-0022/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0022/session-001-original.stdout": "c1537c7cd32c7f8cf37c13afc556ea747988de62d92c83b145fe0bc966932796",
    "heldout-unanswered-continuation-v1/run/job-0022/session-002-original/conversation.jsonl": "29925b7d90b81dc9f0e3bb814d2fa558064eedbc9c9a6447c49e096502b020d4",
    "heldout-unanswered-continuation-v1/run/job-0022/session-002-original/receipt.json": "9a68bd8d1610ffc758c88299a40a563ff3050dc0b65bdeaf6ebedde72c77f8be",
    "heldout-unanswered-continuation-v1/run/job-0022/session-002-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0022/session-002-original.stdout": "29925b7d90b81dc9f0e3bb814d2fa558064eedbc9c9a6447c49e096502b020d4",
    "heldout-unanswered-continuation-v1/run/job-0022/session-003-candidate/conversation.jsonl": "9770e2b9a8555d4eab0217daf468f2b19867e1bf19eb87eda2b292de22391f51",
    "heldout-unanswered-continuation-v1/run/job-0022/session-003-candidate/receipt.json": "0832c09ed25b0d20846765487c10716625a261ca9f953c1d04e19e65d6b66b0b",
    "heldout-unanswered-continuation-v1/run/job-0022/session-003-candidate.stderr": "5a495c04e24111915420f0666c671af38a9e845f7bca08336e0431025457ec3a",
    "heldout-unanswered-continuation-v1/run/job-0022/session-003-candidate.stdout": "9770e2b9a8555d4eab0217daf468f2b19867e1bf19eb87eda2b292de22391f51",
    "heldout-unanswered-continuation-v1/run/job-0022/session-004-candidate/conversation.jsonl": "e09f67e5a69dd2306a175514e87a31c92fbc3a1bbf7d303473f37c6168f26156",
    "heldout-unanswered-continuation-v1/run/job-0022/session-004-candidate/receipt.json": "9f817493698d1cb3f683e3a04a2b2785dfe12054c1333aa03d5af87d24ba20bc",
    "heldout-unanswered-continuation-v1/run/job-0022/session-004-candidate.stderr": "77a8b5b0f4b588d7fba33d2bec95ab89edaeda506e14af327f79dc79dccd9fd8",
    "heldout-unanswered-continuation-v1/run/job-0022/session-004-candidate.stdout": "e09f67e5a69dd2306a175514e87a31c92fbc3a1bbf7d303473f37c6168f26156",
    "heldout-unanswered-continuation-v1/run/job-0022.driver.log": "4337c9d855ab82ed4661f2dc2b4994b9e552155e62bfe36b95be2bf2a49dbafd",
    "heldout-unanswered-continuation-v1/run/job-0023/receipt.json": "615e84e321583ed233550221ba1e937a11045b9eb043d0e1eca2ee97b8759371",
    "heldout-unanswered-continuation-v1/run/job-0023/session-000-candidate/conversation.jsonl": "8b3aa2139ada798faee84eca0669c8ed7ac19470908cd03df1940a577f27a44a",
    "heldout-unanswered-continuation-v1/run/job-0023/session-000-candidate/receipt.json": "a3cb26dfe761e66c3a1a75f81bab77b056c97e6df15ec4eced936f92df5baf69",
    "heldout-unanswered-continuation-v1/run/job-0023/session-000-candidate.stderr": "52367cdf3b24452623a6ee14dcd409f5d2b8fade0cf356c904028f56e1f2a2f4",
    "heldout-unanswered-continuation-v1/run/job-0023/session-000-candidate.stdout": "8b3aa2139ada798faee84eca0669c8ed7ac19470908cd03df1940a577f27a44a",
    "heldout-unanswered-continuation-v1/run/job-0023/session-001-candidate/conversation.jsonl": "e488f94684d18f92ddcda0de65b2823aa98364dcf0755089aa8249c84e652ec3",
    "heldout-unanswered-continuation-v1/run/job-0023/session-001-candidate/receipt.json": "ec287afff505a250357ba7daaaccaa65b6834e0662cf6a0081313647f72c0a2e",
    "heldout-unanswered-continuation-v1/run/job-0023/session-001-candidate.stderr": "77a8b5b0f4b588d7fba33d2bec95ab89edaeda506e14af327f79dc79dccd9fd8",
    "heldout-unanswered-continuation-v1/run/job-0023/session-001-candidate.stdout": "e488f94684d18f92ddcda0de65b2823aa98364dcf0755089aa8249c84e652ec3",
    "heldout-unanswered-continuation-v1/run/job-0023/session-002-candidate/conversation.jsonl": "ca1bfe646ae6f434618d9561c4ef9574c877b9b567259607c778bd0ab96860d0",
    "heldout-unanswered-continuation-v1/run/job-0023/session-002-candidate/receipt.json": "02b0ac077815c6b6b8f2142f0cf20326972d2c2078b99844b03c41ae3c63462c",
    "heldout-unanswered-continuation-v1/run/job-0023/session-002-candidate.stderr": "77a8b5b0f4b588d7fba33d2bec95ab89edaeda506e14af327f79dc79dccd9fd8",
    "heldout-unanswered-continuation-v1/run/job-0023/session-002-candidate.stdout": "ca1bfe646ae6f434618d9561c4ef9574c877b9b567259607c778bd0ab96860d0",
    "heldout-unanswered-continuation-v1/run/job-0023/session-003-original/conversation.jsonl": "01d6a2d16695019a543f37504ca5c2645081446eadbc515e4c53030ae34cfbe7",
    "heldout-unanswered-continuation-v1/run/job-0023/session-003-original/receipt.json": "ce5934da41a0e2e4bea0cb5ce13c1daca480ea3d30866821eaf934c25fc609b4",
    "heldout-unanswered-continuation-v1/run/job-0023/session-003-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0023/session-003-original.stdout": "01d6a2d16695019a543f37504ca5c2645081446eadbc515e4c53030ae34cfbe7",
    "heldout-unanswered-continuation-v1/run/job-0023/session-004-original/conversation.jsonl": "0242840b41d836bf69f14bb4cbe64ae9ec41c36a1beeda48b9879853ecabdc3a",
    "heldout-unanswered-continuation-v1/run/job-0023/session-004-original/receipt.json": "66a9a21e815f5150625ee0abb44f0932a2eb1acdae99c80dda41e8f47bac22cd",
    "heldout-unanswered-continuation-v1/run/job-0023/session-004-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0023/session-004-original.stdout": "0242840b41d836bf69f14bb4cbe64ae9ec41c36a1beeda48b9879853ecabdc3a",
    "heldout-unanswered-continuation-v1/run/job-0023/session-005-original/conversation.jsonl": "61f2be07ee41d96a445f405477a55c4b966fefe46c04f0e7714e95958e7badc9",
    "heldout-unanswered-continuation-v1/run/job-0023/session-005-original/receipt.json": "5ff589cbd0c8816f7bd6d642f3ae93ec9eb44c88607143164c7b1e9d1dd01eb4",
    "heldout-unanswered-continuation-v1/run/job-0023/session-005-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0023/session-005-original.stdout": "61f2be07ee41d96a445f405477a55c4b966fefe46c04f0e7714e95958e7badc9",
    "heldout-unanswered-continuation-v1/run/job-0023.driver.log": "7ac6ea55ba46f709538c9daa0b4fb4d46c6bf15400505d5c2183b979e06688c9",
    "heldout-unanswered-continuation-v1/run/job-0024/receipt.json": "a65f1b6d11c82d601cceb8301bc0b68c2e256cdc4b7ccdc0b59eae7822429a09",
    "heldout-unanswered-continuation-v1/run/job-0024/session-000-original/conversation.jsonl": "04ccd97e9190c88a5e7c529a283abe4dee2d35e93934d3157d7215c85c1c7b62",
    "heldout-unanswered-continuation-v1/run/job-0024/session-000-original/receipt.json": "c8980dc62c8b208f17f699443c7713a445ebc5d3a1aa6e93dc83480f4b6a2a72",
    "heldout-unanswered-continuation-v1/run/job-0024/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0024/session-000-original.stdout": "04ccd97e9190c88a5e7c529a283abe4dee2d35e93934d3157d7215c85c1c7b62",
    "heldout-unanswered-continuation-v1/run/job-0024/session-001-original/conversation.jsonl": "cc13138cd0168fa670c2b790c42bf3322829097ee71518fc17f436b491aa9baf",
    "heldout-unanswered-continuation-v1/run/job-0024/session-001-original/receipt.json": "97e779d4a87b1837435dd0851fa342c70662f101f13c886ea12c364b0fa2f872",
    "heldout-unanswered-continuation-v1/run/job-0024/session-001-original.stderr": "149486a2c3fcb68170503aeeba5133120ad56443718281642cadc69f41b23ef7",
    "heldout-unanswered-continuation-v1/run/job-0024/session-001-original.stdout": "cc13138cd0168fa670c2b790c42bf3322829097ee71518fc17f436b491aa9baf",
    "heldout-unanswered-continuation-v1/run/job-0024/session-002-candidate/conversation.jsonl": "a3d5cbb5f207ba57d5c3ad443444fa58da5894e10b0adb95f5d95e9d4556f17b",
    "heldout-unanswered-continuation-v1/run/job-0024/session-002-candidate/receipt.json": "955e34f53650ca156c225f71809954c38b099d0e9a7506e6900dc60e336f50f2",
    "heldout-unanswered-continuation-v1/run/job-0024/session-002-candidate.stderr": "0e1bde4ab6ff41156e9aa92b310169eecbc9eb72578dfba920b64a6c6badfeb1",
    "heldout-unanswered-continuation-v1/run/job-0024/session-002-candidate.stdout": "a3d5cbb5f207ba57d5c3ad443444fa58da5894e10b0adb95f5d95e9d4556f17b",
    "heldout-unanswered-continuation-v1/run/job-0024/session-003-candidate/conversation.jsonl": "ea9f761b4f10dea731db68ef2fb2d432e2c33a2bd89b8d27afa27455b278c76e",
    "heldout-unanswered-continuation-v1/run/job-0024/session-003-candidate/receipt.json": "5e5716c825aea5d34161b6b22bf3c5277e93dadcee9843f465d16f0bb21734b3",
    "heldout-unanswered-continuation-v1/run/job-0024/session-003-candidate.stderr": "52367cdf3b24452623a6ee14dcd409f5d2b8fade0cf356c904028f56e1f2a2f4",
    "heldout-unanswered-continuation-v1/run/job-0024/session-003-candidate.stdout": "ea9f761b4f10dea731db68ef2fb2d432e2c33a2bd89b8d27afa27455b278c76e",
    "heldout-unanswered-continuation-v1/run/job-0024.driver.log": "1b7fe848a0e21be36f9d10bf55f407c4d5ab260cbbacd772e20bb7bf182e683c",
    "heldout-unanswered-continuation-v1/run/job-0025/receipt.json": "2a35983d1a04bd4577a141fa3a3c118a953d0d64fedccb7d6ab48dd919162932",
    "heldout-unanswered-continuation-v1/run/job-0025/session-000-candidate/conversation.jsonl": "6dea81b19386910f7dfc84869362883e75b793628cef50dcfe52b93e5cf8d10e",
    "heldout-unanswered-continuation-v1/run/job-0025/session-000-candidate/receipt.json": "93f67f861c5aac17843f7819c50e153b32fe9e39bc2ec0d7ab33c0bb3245f29c",
    "heldout-unanswered-continuation-v1/run/job-0025/session-000-candidate.stderr": "0e1bde4ab6ff41156e9aa92b310169eecbc9eb72578dfba920b64a6c6badfeb1",
    "heldout-unanswered-continuation-v1/run/job-0025/session-000-candidate.stdout": "6dea81b19386910f7dfc84869362883e75b793628cef50dcfe52b93e5cf8d10e",
    "heldout-unanswered-continuation-v1/run/job-0025/session-001-candidate/conversation.jsonl": "a58f1e401be0be2d73544a6dd7167da4e2e8b6edc83d5f6667e028c0abc73fa3",
    "heldout-unanswered-continuation-v1/run/job-0025/session-001-candidate/receipt.json": "6e0659e2eba6f3932a65726bb6a1ee1bda8e2ae047510a985c9279ec57f77e86",
    "heldout-unanswered-continuation-v1/run/job-0025/session-001-candidate.stderr": "80db7a8b6f78d35b9b8a353099fcf00504acd3f3a2af86103beec170bbef5eb4",
    "heldout-unanswered-continuation-v1/run/job-0025/session-001-candidate.stdout": "a58f1e401be0be2d73544a6dd7167da4e2e8b6edc83d5f6667e028c0abc73fa3",
    "heldout-unanswered-continuation-v1/run/job-0025/session-002-original/conversation.jsonl": "ae45cf37cba3749c39391fda65f70b0bf8f6820c48fbb6683e2079933751bc84",
    "heldout-unanswered-continuation-v1/run/job-0025/session-002-original/receipt.json": "837178600c7f088bcb59b869a2881e04c3bedad201c7d37ec56a94c6f406cc77",
    "heldout-unanswered-continuation-v1/run/job-0025/session-002-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0025/session-002-original.stdout": "ae45cf37cba3749c39391fda65f70b0bf8f6820c48fbb6683e2079933751bc84",
    "heldout-unanswered-continuation-v1/run/job-0025/session-003-original/conversation.jsonl": "4fd4b41fac37bbb25a0bcedb3233a40c07557355ed795817f1a9b629cfef566e",
    "heldout-unanswered-continuation-v1/run/job-0025/session-003-original/receipt.json": "8a8d6b1adc787a36e61742169f74508ff3c52d3db100d6e6ee8d5f76b8f8b2b1",
    "heldout-unanswered-continuation-v1/run/job-0025/session-003-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0025/session-003-original.stdout": "4fd4b41fac37bbb25a0bcedb3233a40c07557355ed795817f1a9b629cfef566e",
    "heldout-unanswered-continuation-v1/run/job-0025.driver.log": "0119625369c3fb54927498a4de994532814ade29a39190daaf4e83d74759b13f",
    "heldout-unanswered-continuation-v1/run/job-0026/receipt.json": "72eb3436e4b3a3d26d8eb61437dddfb68c45644e130e293ed5bb79d6c576311e",
    "heldout-unanswered-continuation-v1/run/job-0026/session-000-original/conversation.jsonl": "bd7b9c6d3f3e120c09dea7c8e54b7a3e53e97bda58ef3a3801c2544341f6fc48",
    "heldout-unanswered-continuation-v1/run/job-0026/session-000-original/receipt.json": "595321c919205f331ee217b63f1eb9b2cff7778637a82a5fb97c1a5c69b5291f",
    "heldout-unanswered-continuation-v1/run/job-0026/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0026/session-000-original.stdout": "bd7b9c6d3f3e120c09dea7c8e54b7a3e53e97bda58ef3a3801c2544341f6fc48",
    "heldout-unanswered-continuation-v1/run/job-0026/session-001-original/conversation.jsonl": "1b37a03389e3df931d2b21c03f49df5a5bae36e802b7fb1f69a3ff48787ebadf",
    "heldout-unanswered-continuation-v1/run/job-0026/session-001-original/receipt.json": "c14e42632b8d90baef4378b852938f5c1b03ec23c53e01a05d27231b12a342ac",
    "heldout-unanswered-continuation-v1/run/job-0026/session-001-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0026/session-001-original.stdout": "1b37a03389e3df931d2b21c03f49df5a5bae36e802b7fb1f69a3ff48787ebadf",
    "heldout-unanswered-continuation-v1/run/job-0026/session-002-candidate/conversation.jsonl": "688830b7d6e63fbde7434a6f5ba7643eaf68628bb8d02cb70e0e567ab6d02db3",
    "heldout-unanswered-continuation-v1/run/job-0026/session-002-candidate/receipt.json": "db4358787af48c3529ce6a9f5bba1c30a31c6a5d49ebf50058a6725980d3b404",
    "heldout-unanswered-continuation-v1/run/job-0026/session-002-candidate.stderr": "02bd2f957d7b9fbf82f1ba7432c2bb2c3c956e85ddc29ab8ec4c8e9c2f72553c",
    "heldout-unanswered-continuation-v1/run/job-0026/session-002-candidate.stdout": "688830b7d6e63fbde7434a6f5ba7643eaf68628bb8d02cb70e0e567ab6d02db3",
    "heldout-unanswered-continuation-v1/run/job-0026/session-003-candidate/conversation.jsonl": "daeccc8e2b5c928f131bffe49f868bfde7378318a4fc97efeb1bc0cde6e60baa",
    "heldout-unanswered-continuation-v1/run/job-0026/session-003-candidate/receipt.json": "c0887f410ecf945f877533239f3044baa94ccee8d130c5be6c9e6a840a596486",
    "heldout-unanswered-continuation-v1/run/job-0026/session-003-candidate.stderr": "77a8b5b0f4b588d7fba33d2bec95ab89edaeda506e14af327f79dc79dccd9fd8",
    "heldout-unanswered-continuation-v1/run/job-0026/session-003-candidate.stdout": "daeccc8e2b5c928f131bffe49f868bfde7378318a4fc97efeb1bc0cde6e60baa",
    "heldout-unanswered-continuation-v1/run/job-0026.driver.log": "94390fe598216fd9789c694d2ff1728306bee654e174868e7afef9cc256c8928",
    "heldout-unanswered-continuation-v1/run/job-0027/receipt.json": "d2e9a32af7b2fff034e228229fe082aeb81fe16ac996e499d4941e3b79de4f5d",
    "heldout-unanswered-continuation-v1/run/job-0027/session-000-candidate/conversation.jsonl": "3bdb0cc3b802b57b09dd3820c92d270a424f7e3b914bfa1d579d6736f8f99f85",
    "heldout-unanswered-continuation-v1/run/job-0027/session-000-candidate/receipt.json": "1267ee310448446bd28b9ce9bbba0d42fea1f2d30a6a65f86fafe0944762d4df",
    "heldout-unanswered-continuation-v1/run/job-0027/session-000-candidate.stderr": "21626436c53f8295f8536db8c542bcc6bdcc9fcdf2c44167b052f35226f71650",
    "heldout-unanswered-continuation-v1/run/job-0027/session-000-candidate.stdout": "3bdb0cc3b802b57b09dd3820c92d270a424f7e3b914bfa1d579d6736f8f99f85",
    "heldout-unanswered-continuation-v1/run/job-0027/session-001-candidate/conversation.jsonl": "8b39d0617d126d7c81169ae68b8bf1d6756abe88b7201adde54e3f4b53128981",
    "heldout-unanswered-continuation-v1/run/job-0027/session-001-candidate/receipt.json": "17a31ff6de7c0253c1cadda623badd0008da2c2d865400775cfc8a4e21cd7575",
    "heldout-unanswered-continuation-v1/run/job-0027/session-001-candidate.stderr": "77a8b5b0f4b588d7fba33d2bec95ab89edaeda506e14af327f79dc79dccd9fd8",
    "heldout-unanswered-continuation-v1/run/job-0027/session-001-candidate.stdout": "8b39d0617d126d7c81169ae68b8bf1d6756abe88b7201adde54e3f4b53128981",
    "heldout-unanswered-continuation-v1/run/job-0027/session-002-original/conversation.jsonl": "0fa0791cca851911f7bff9ab7ba510209dfe2783f2deaeb04bbb6539c321c8f9",
    "heldout-unanswered-continuation-v1/run/job-0027/session-002-original/receipt.json": "5a4a9d2a1afd8d76f7be7adf406649f86edd4a0dd7c3d952c05f7d79feb42b3d",
    "heldout-unanswered-continuation-v1/run/job-0027/session-002-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0027/session-002-original.stdout": "0fa0791cca851911f7bff9ab7ba510209dfe2783f2deaeb04bbb6539c321c8f9",
    "heldout-unanswered-continuation-v1/run/job-0027/session-003-original/conversation.jsonl": "b148fabb42e74c6b26f5f45cd9b5bb329c78353967097a6f00b28adc193288d4",
    "heldout-unanswered-continuation-v1/run/job-0027/session-003-original/receipt.json": "11da6fea8cb26d75c20c1b058cc15ad5eca6bc3e819757f334169581fff0dc07",
    "heldout-unanswered-continuation-v1/run/job-0027/session-003-original.stderr": "149486a2c3fcb68170503aeeba5133120ad56443718281642cadc69f41b23ef7",
    "heldout-unanswered-continuation-v1/run/job-0027/session-003-original.stdout": "b148fabb42e74c6b26f5f45cd9b5bb329c78353967097a6f00b28adc193288d4",
    "heldout-unanswered-continuation-v1/run/job-0027.driver.log": "2f36c3015a294ee44d69332c179fd66064bc9aeb410b3db8ceff9e582330f4a3",
    "heldout-unanswered-continuation-v1/run/job-0028/receipt.json": "9ffd974dbb773aa4d52cce28ab254363d3f3f181e5d82799c013853aa7b9d865",
    "heldout-unanswered-continuation-v1/run/job-0028/session-000-original/conversation.jsonl": "4f2824986883ddab92abb2d588514634765ccfd14b2979b3458c48da9246ccf8",
    "heldout-unanswered-continuation-v1/run/job-0028/session-000-original/receipt.json": "33302d6b30e7a90be81e3ea0ae243a20c5bcafb53021b4bcf696d23670304170",
    "heldout-unanswered-continuation-v1/run/job-0028/session-000-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0028/session-000-original.stdout": "4f2824986883ddab92abb2d588514634765ccfd14b2979b3458c48da9246ccf8",
    "heldout-unanswered-continuation-v1/run/job-0028/session-001-original/conversation.jsonl": "01347547eea96da7fadc99149054ee80c7acbcca580c4cb884414b543ec382d6",
    "heldout-unanswered-continuation-v1/run/job-0028/session-001-original/receipt.json": "d2b3e86b51267a4b57bd520ac71be986f5ff18897298ba4e2cf95b631bd832ab",
    "heldout-unanswered-continuation-v1/run/job-0028/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0028/session-001-original.stdout": "01347547eea96da7fadc99149054ee80c7acbcca580c4cb884414b543ec382d6",
    "heldout-unanswered-continuation-v1/run/job-0028/session-002-candidate/conversation.jsonl": "553e8acb8a7fc202079d5c5344943b7c5b231c26dc933e0591d97b1c3d8eea4e",
    "heldout-unanswered-continuation-v1/run/job-0028/session-002-candidate/receipt.json": "79a61d4e7f517cabe96adaa9a11914c9b716c6c4ed606bdbefc9c38cb48bd1d6",
    "heldout-unanswered-continuation-v1/run/job-0028/session-002-candidate.stderr": "4245794128c9254f9f44fe42ca5c34794eaae1aab1d5adb59e158ea9ce50bac1",
    "heldout-unanswered-continuation-v1/run/job-0028/session-002-candidate.stdout": "553e8acb8a7fc202079d5c5344943b7c5b231c26dc933e0591d97b1c3d8eea4e",
    "heldout-unanswered-continuation-v1/run/job-0028/session-003-candidate/conversation.jsonl": "5a97652b55d9dfd40d1b944d53c7aa101e1cf57067f3f1fde06d141c1c19a621",
    "heldout-unanswered-continuation-v1/run/job-0028/session-003-candidate/receipt.json": "a50ef5d9cd9739d07d12bee668d81e017a46b29f26d189f9adea224314c3efd9",
    "heldout-unanswered-continuation-v1/run/job-0028/session-003-candidate.stderr": "4245794128c9254f9f44fe42ca5c34794eaae1aab1d5adb59e158ea9ce50bac1",
    "heldout-unanswered-continuation-v1/run/job-0028/session-003-candidate.stdout": "5a97652b55d9dfd40d1b944d53c7aa101e1cf57067f3f1fde06d141c1c19a621",
    "heldout-unanswered-continuation-v1/run/job-0028.driver.log": "30c7d1c4356952649631be2ce3bef0c50a025137544d44ef02d99c549e2b2f6c",
    "heldout-unanswered-continuation-v1/run/job-0029/receipt.json": "b86408faf0180f4a7dce37e6c8b3885d39df9b1753e8c5e739f0f88f2cce1f7b",
    "heldout-unanswered-continuation-v1/run/job-0029/session-000-candidate/conversation.jsonl": "9c1d18f807d5acefba7c31a8c2f832692512e0480142b8d9ae381d027913e866",
    "heldout-unanswered-continuation-v1/run/job-0029/session-000-candidate/receipt.json": "ae078cda5fc488c76fa0783ff96f863aff480e8298d9d9894691827c7bafec53",
    "heldout-unanswered-continuation-v1/run/job-0029/session-000-candidate.stderr": "4245794128c9254f9f44fe42ca5c34794eaae1aab1d5adb59e158ea9ce50bac1",
    "heldout-unanswered-continuation-v1/run/job-0029/session-000-candidate.stdout": "9c1d18f807d5acefba7c31a8c2f832692512e0480142b8d9ae381d027913e866",
    "heldout-unanswered-continuation-v1/run/job-0029/session-001-candidate/conversation.jsonl": "880993f70de11cc103c11fe0869647548fb483038d228d2168d06942265d13af",
    "heldout-unanswered-continuation-v1/run/job-0029/session-001-candidate/receipt.json": "4b38468b02bfeb1c08b203e322346c4f1ec0d0ff0dc7eea2f1a871de07ab4a84",
    "heldout-unanswered-continuation-v1/run/job-0029/session-001-candidate.stderr": "4245794128c9254f9f44fe42ca5c34794eaae1aab1d5adb59e158ea9ce50bac1",
    "heldout-unanswered-continuation-v1/run/job-0029/session-001-candidate.stdout": "880993f70de11cc103c11fe0869647548fb483038d228d2168d06942265d13af",
    "heldout-unanswered-continuation-v1/run/job-0029/session-002-candidate/conversation.jsonl": "cb2f4c7f963b3911d82d7574e6f71ccef3ebd159879ae3bc720b09d3d1fe9c50",
    "heldout-unanswered-continuation-v1/run/job-0029/session-002-candidate/receipt.json": "e9ab4ba1702782c064fa5fa428b5a200add27948c532af31ab8c59d74321094f",
    "heldout-unanswered-continuation-v1/run/job-0029/session-002-candidate.stderr": "5a495c04e24111915420f0666c671af38a9e845f7bca08336e0431025457ec3a",
    "heldout-unanswered-continuation-v1/run/job-0029/session-002-candidate.stdout": "cb2f4c7f963b3911d82d7574e6f71ccef3ebd159879ae3bc720b09d3d1fe9c50",
    "heldout-unanswered-continuation-v1/run/job-0029/session-003-candidate/conversation.jsonl": "9f43874be515374026349cd0ff93960410ac3fbbe4617dae9c2e6a734f2b46eb",
    "heldout-unanswered-continuation-v1/run/job-0029/session-003-candidate/receipt.json": "143179864934fbe3d265abd290fdd2aa1ce46666f31b080aed7d48d2360c7842",
    "heldout-unanswered-continuation-v1/run/job-0029/session-003-candidate.stderr": "02bd2f957d7b9fbf82f1ba7432c2bb2c3c956e85ddc29ab8ec4c8e9c2f72553c",
    "heldout-unanswered-continuation-v1/run/job-0029/session-003-candidate.stdout": "9f43874be515374026349cd0ff93960410ac3fbbe4617dae9c2e6a734f2b46eb",
    "heldout-unanswered-continuation-v1/run/job-0029/session-004-original/conversation.jsonl": "a570e2935ddd435b8ba8db2b6ded0fcdb64de6c3f9fac190d73c1f1ed014ae48",
    "heldout-unanswered-continuation-v1/run/job-0029/session-004-original/receipt.json": "99da9d55d9828b4afa0d7e4d2ab1229b30ab00a628fece660fae2f5e730aa198",
    "heldout-unanswered-continuation-v1/run/job-0029/session-004-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0029/session-004-original.stdout": "a570e2935ddd435b8ba8db2b6ded0fcdb64de6c3f9fac190d73c1f1ed014ae48",
    "heldout-unanswered-continuation-v1/run/job-0029/session-005-original/conversation.jsonl": "817cb1a454aa8ac595f9396f093d3232284d793c6e695f2ebd64a509f7a8f2bd",
    "heldout-unanswered-continuation-v1/run/job-0029/session-005-original/receipt.json": "e959a4c21b8cb58c3205d0e8fac42af1e31e4a583281bfc01f3ea92b6fecc844",
    "heldout-unanswered-continuation-v1/run/job-0029/session-005-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0029/session-005-original.stdout": "817cb1a454aa8ac595f9396f093d3232284d793c6e695f2ebd64a509f7a8f2bd",
    "heldout-unanswered-continuation-v1/run/job-0029/session-006-original/conversation.jsonl": "bbc1a3b36629328bdbae528bbe873d0e260db762e7ef37cd9fcf92399ae2e236",
    "heldout-unanswered-continuation-v1/run/job-0029/session-006-original/receipt.json": "c7008b79d1a8beecbd55b1d27842ac90d292d73c608c8d7ddea3a573e1c6524c",
    "heldout-unanswered-continuation-v1/run/job-0029/session-006-original.stderr": "98e54f156c2d751dafa8b663ded4028169e94f9ab9bed04e9f8e80fab1aa9b37",
    "heldout-unanswered-continuation-v1/run/job-0029/session-006-original.stdout": "bbc1a3b36629328bdbae528bbe873d0e260db762e7ef37cd9fcf92399ae2e236",
    "heldout-unanswered-continuation-v1/run/job-0029/session-007-original/conversation.jsonl": "fe49a4bd857863169bda9a671aa7370199440ec101e8fb1fbd51debbe1b56520",
    "heldout-unanswered-continuation-v1/run/job-0029/session-007-original/receipt.json": "9c8271dec22970a6ce375110199632bd74d8fde44fdde61e6204a2294b26268a",
    "heldout-unanswered-continuation-v1/run/job-0029/session-007-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0029/session-007-original.stdout": "fe49a4bd857863169bda9a671aa7370199440ec101e8fb1fbd51debbe1b56520",
    "heldout-unanswered-continuation-v1/run/job-0029.driver.log": "d8484eb8908730fdd0232c88ebe900d11a389dfe910716db39152a70ef0f68a6",
    "heldout-unanswered-continuation-v1/run/job-0030/receipt.json": "d0617fa4188ac1f3acded914c670da524b034bb3ad7e6b507cab4fd86889e742",
    "heldout-unanswered-continuation-v1/run/job-0030/session-000-original/conversation.jsonl": "371f951eb4588cdb98a51deabcd675478cd2a183fc441275df742879f3f1cc48",
    "heldout-unanswered-continuation-v1/run/job-0030/session-000-original/receipt.json": "141b0042a7466dea214953abac8256c5364ade40464d09b6cc604cb4a5ff740c",
    "heldout-unanswered-continuation-v1/run/job-0030/session-000-original.stderr": "149486a2c3fcb68170503aeeba5133120ad56443718281642cadc69f41b23ef7",
    "heldout-unanswered-continuation-v1/run/job-0030/session-000-original.stdout": "371f951eb4588cdb98a51deabcd675478cd2a183fc441275df742879f3f1cc48",
    "heldout-unanswered-continuation-v1/run/job-0030/session-001-original/conversation.jsonl": "6f26c6f48c2243529d56a94d0bae2beabe8cdd0f37f36516f33572956a13b32a",
    "heldout-unanswered-continuation-v1/run/job-0030/session-001-original/receipt.json": "f3d1bed766c125b32b117c9e58b2d2cc34eec58b89d7e877f787e96c9b6c6b4a",
    "heldout-unanswered-continuation-v1/run/job-0030/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0030/session-001-original.stdout": "6f26c6f48c2243529d56a94d0bae2beabe8cdd0f37f36516f33572956a13b32a",
    "heldout-unanswered-continuation-v1/run/job-0030/session-002-candidate/conversation.jsonl": "d266b0568029ca0acbf07b7f1cf546219731cc1c91a5fa726bde0146c8d6c4a2",
    "heldout-unanswered-continuation-v1/run/job-0030/session-002-candidate/receipt.json": "4974f3fabcd2becdf4b4087ca0ca2511706aa0a0a4c3bb21d8caf1ba7a3583b4",
    "heldout-unanswered-continuation-v1/run/job-0030/session-002-candidate.stderr": "b68b91c889551ae938048d56eb67aed875c3bc3e590f41fd69cfb31ec707cdd7",
    "heldout-unanswered-continuation-v1/run/job-0030/session-002-candidate.stdout": "d266b0568029ca0acbf07b7f1cf546219731cc1c91a5fa726bde0146c8d6c4a2",
    "heldout-unanswered-continuation-v1/run/job-0030/session-003-candidate/conversation.jsonl": "fcc8358629244f9281b316624f738f009120e48453d0118daf033e6edeca7d0b",
    "heldout-unanswered-continuation-v1/run/job-0030/session-003-candidate/receipt.json": "f9cef91540f90e261316fb84b4a61a2d5a89a94c9271a0b0e46ae029a459cda1",
    "heldout-unanswered-continuation-v1/run/job-0030/session-003-candidate.stderr": "5a495c04e24111915420f0666c671af38a9e845f7bca08336e0431025457ec3a",
    "heldout-unanswered-continuation-v1/run/job-0030/session-003-candidate.stdout": "fcc8358629244f9281b316624f738f009120e48453d0118daf033e6edeca7d0b",
    "heldout-unanswered-continuation-v1/run/job-0030.driver.log": "d64dacf618808de9500c7866025e04e4fe4c5c743c3b86319f932ecc5d1185a2",
    "heldout-unanswered-continuation-v1/run/job-0031/receipt.json": "10d44ca7d95166ff742571417e582e5aeed594ce8d90e1063234e9edcfcd3527",
    "heldout-unanswered-continuation-v1/run/job-0031/session-000-candidate/conversation.jsonl": "03b6a480af5e3720c4630b9957706984b959a239e75166e0ebdb2ccaaa01dbf3",
    "heldout-unanswered-continuation-v1/run/job-0031/session-000-candidate/receipt.json": "8c76cd2a67a80924e8604a809e7270a758b95686b0ddf76ab3d21e171a31f98b",
    "heldout-unanswered-continuation-v1/run/job-0031/session-000-candidate.stderr": "5a495c04e24111915420f0666c671af38a9e845f7bca08336e0431025457ec3a",
    "heldout-unanswered-continuation-v1/run/job-0031/session-000-candidate.stdout": "03b6a480af5e3720c4630b9957706984b959a239e75166e0ebdb2ccaaa01dbf3",
    "heldout-unanswered-continuation-v1/run/job-0031/session-001-candidate/conversation.jsonl": "5c3e3476af7a5bdd28033a686b8d3b04a9f8a0f46ad9f1337bcd11cdf97a0606",
    "heldout-unanswered-continuation-v1/run/job-0031/session-001-candidate/receipt.json": "60825571cf82261608fe71f04efced7376fdb3d9c72bca734a8b3dbd1b8932aa",
    "heldout-unanswered-continuation-v1/run/job-0031/session-001-candidate.stderr": "02bd2f957d7b9fbf82f1ba7432c2bb2c3c956e85ddc29ab8ec4c8e9c2f72553c",
    "heldout-unanswered-continuation-v1/run/job-0031/session-001-candidate.stdout": "5c3e3476af7a5bdd28033a686b8d3b04a9f8a0f46ad9f1337bcd11cdf97a0606",
    "heldout-unanswered-continuation-v1/run/job-0031/session-002-original/conversation.jsonl": "dcb544ee407a38c33aca12ca0264172f9bbc47737170850290ea95cd184618dc",
    "heldout-unanswered-continuation-v1/run/job-0031/session-002-original/receipt.json": "b56afc4c3bdca48dfe48297190bfab77ede44b6eeaea510fd173a2255c5f80fb",
    "heldout-unanswered-continuation-v1/run/job-0031/session-002-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0031/session-002-original.stdout": "dcb544ee407a38c33aca12ca0264172f9bbc47737170850290ea95cd184618dc",
    "heldout-unanswered-continuation-v1/run/job-0031/session-003-original/conversation.jsonl": "d42eeab29cd608015d68b6759d330fcc0b27f409f38ad6033453bf540ac97536",
    "heldout-unanswered-continuation-v1/run/job-0031/session-003-original/receipt.json": "6cc6982c2fd4cd123204b074f5010dd43e01f3292d53b6631e81440d3c1ed316",
    "heldout-unanswered-continuation-v1/run/job-0031/session-003-original.stderr": "149486a2c3fcb68170503aeeba5133120ad56443718281642cadc69f41b23ef7",
    "heldout-unanswered-continuation-v1/run/job-0031/session-003-original.stdout": "d42eeab29cd608015d68b6759d330fcc0b27f409f38ad6033453bf540ac97536",
    "heldout-unanswered-continuation-v1/run/job-0031.driver.log": "8560db1a30e6c9cd2a558a674b6ebe0841f30b20347d5692497eaa94240d6fb0",
    "heldout-unanswered-continuation-v1/run/job-0032/receipt.json": "ce887c7a7765f5339b6d1fd9f165861534b9c5a2466fb90c079aa7b4a63d6a6f",
    "heldout-unanswered-continuation-v1/run/job-0032/session-000-original/conversation.jsonl": "7f6cc654fb5550b9544fa37b9c2103aeda01d57f1a5506808ed5d21ed7d49474",
    "heldout-unanswered-continuation-v1/run/job-0032/session-000-original/receipt.json": "8cfa96cda7b9805e2a3912adde2cef8c62a488ad378cebc7a8879cf063562609",
    "heldout-unanswered-continuation-v1/run/job-0032/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0032/session-000-original.stdout": "7f6cc654fb5550b9544fa37b9c2103aeda01d57f1a5506808ed5d21ed7d49474",
    "heldout-unanswered-continuation-v1/run/job-0032/session-001-candidate/conversation.jsonl": "1e347eba8f6cee5969fab114b2079e5017bbc51724d50dfa593a868a916ebf27",
    "heldout-unanswered-continuation-v1/run/job-0032/session-001-candidate/receipt.json": "57464a5de6961063a984ee29ad8a5fdeccde986784870240133e0fb0ae584ccf",
    "heldout-unanswered-continuation-v1/run/job-0032/session-001-candidate.stderr": "8b04b1d68fd10d999c0c7f08f26612a5054df1629eee6877d2ce52e572823d54",
    "heldout-unanswered-continuation-v1/run/job-0032/session-001-candidate.stdout": "1e347eba8f6cee5969fab114b2079e5017bbc51724d50dfa593a868a916ebf27",
    "heldout-unanswered-continuation-v1/run/job-0032.driver.log": "8538f83c049cfab8f6b97950a113026f118fe2cf18aec78fb5f2b547c0e03d0f",
    "heldout-unanswered-continuation-v1/run/job-0033/receipt.json": "3fb1793897cfbfff3c5e2729cf420604b08d94d6a7018e4bcffe54c50dec9d3a",
    "heldout-unanswered-continuation-v1/run/job-0033/session-000-candidate/conversation.jsonl": "9fd6dbf4be72cd7796b954cf010287f494049423d7ccabf032f673790d0c6c6d",
    "heldout-unanswered-continuation-v1/run/job-0033/session-000-candidate/receipt.json": "fe0fe16905da152398995db727cf8def727e55e0ebf7c282fa70db72df505d81",
    "heldout-unanswered-continuation-v1/run/job-0033/session-000-candidate.stderr": "21626436c53f8295f8536db8c542bcc6bdcc9fcdf2c44167b052f35226f71650",
    "heldout-unanswered-continuation-v1/run/job-0033/session-000-candidate.stdout": "9fd6dbf4be72cd7796b954cf010287f494049423d7ccabf032f673790d0c6c6d",
    "heldout-unanswered-continuation-v1/run/job-0033/session-001-original/conversation.jsonl": "e44b9c6f6075d1b6750842cde37ba4783360ea705e7f1fe3f51f114bceae6f15",
    "heldout-unanswered-continuation-v1/run/job-0033/session-001-original/receipt.json": "459925e94391ccf89a2d103d69539b5115ecdb0204ed2078c4952d84f06d6ab1",
    "heldout-unanswered-continuation-v1/run/job-0033/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0033/session-001-original.stdout": "e44b9c6f6075d1b6750842cde37ba4783360ea705e7f1fe3f51f114bceae6f15",
    "heldout-unanswered-continuation-v1/run/job-0033.driver.log": "2daab0750ee446c01e5fce6da732ed0f893acdd7de2d2c383c3ce89545566e40",
    "heldout-unanswered-continuation-v1/run/job-0034/receipt.json": "d3cfc5413da719b6f121917c47347ac3a815d0c81db72c6b68acb2f44696ddd9",
    "heldout-unanswered-continuation-v1/run/job-0034/session-000-original/conversation.jsonl": "6dcbec4ed4d044e95a1c1fa0b2f068109f9d688b2b62546b0191765520ffd5ff",
    "heldout-unanswered-continuation-v1/run/job-0034/session-000-original/receipt.json": "723a09348a8472347b890549c6faf8bbcb94de321c489291bcd3fdeaa2dcb670",
    "heldout-unanswered-continuation-v1/run/job-0034/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0034/session-000-original.stdout": "6dcbec4ed4d044e95a1c1fa0b2f068109f9d688b2b62546b0191765520ffd5ff",
    "heldout-unanswered-continuation-v1/run/job-0034/session-001-candidate/conversation.jsonl": "0d899b1dd9f3f6174283531e79a3d8bcac93bf02c63a7beaaa76c87d20f13e8d",
    "heldout-unanswered-continuation-v1/run/job-0034/session-001-candidate/receipt.json": "641c4e082991f95ab28ea24302dc3b342fc460c3ddc3e50538ba73e84cfdefdc",
    "heldout-unanswered-continuation-v1/run/job-0034/session-001-candidate.stderr": "77a8b5b0f4b588d7fba33d2bec95ab89edaeda506e14af327f79dc79dccd9fd8",
    "heldout-unanswered-continuation-v1/run/job-0034/session-001-candidate.stdout": "0d899b1dd9f3f6174283531e79a3d8bcac93bf02c63a7beaaa76c87d20f13e8d",
    "heldout-unanswered-continuation-v1/run/job-0034.driver.log": "9bf30c8860287c043cf40f3797a3d160d99c8aeb2769144affb97e7c62ba88f7",
    "heldout-unanswered-continuation-v1/run/job-0035/receipt.json": "d09e8577ca118df5faf8c7d659bbd613f0e807c3be566d6a2bc38c9a70aa64ab",
    "heldout-unanswered-continuation-v1/run/job-0035/session-000-candidate/conversation.jsonl": "510946ab416d74e754a7214986218fdc35d5191d3a9c7bbb16e357a1178df420",
    "heldout-unanswered-continuation-v1/run/job-0035/session-000-candidate/receipt.json": "27d04faa22b82d0a8129e9a7633a2715cd230974a569a29e7858282df2f8f2c7",
    "heldout-unanswered-continuation-v1/run/job-0035/session-000-candidate.stderr": "b0f12dc03430732ca86c1182a1dd8960d509bf3ce86b99d6bec35b12f70955eb",
    "heldout-unanswered-continuation-v1/run/job-0035/session-000-candidate.stdout": "510946ab416d74e754a7214986218fdc35d5191d3a9c7bbb16e357a1178df420",
    "heldout-unanswered-continuation-v1/run/job-0035/session-001-original/conversation.jsonl": "8fa9f5a51293a39bb829c0594bea801ad0529e8b641f62ed42f3759b66de5cd2",
    "heldout-unanswered-continuation-v1/run/job-0035/session-001-original/receipt.json": "21d6f7ac26e8c70c5c892de5e16477d0f1b33e6f129502416b747594c60d7ca1",
    "heldout-unanswered-continuation-v1/run/job-0035/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0035/session-001-original.stdout": "8fa9f5a51293a39bb829c0594bea801ad0529e8b641f62ed42f3759b66de5cd2",
    "heldout-unanswered-continuation-v1/run/job-0035.driver.log": "2db59ae53a362c4bc50b9e5b660a3d2bc315afa1d8fb18439c3bb3584d372005",
    "heldout-unanswered-continuation-v1/run/job-0036/receipt.json": "6d6018a6993e3b3d27ca2362aca044d5feb38aa11feb7d0ca936b43f65843e6e",
    "heldout-unanswered-continuation-v1/run/job-0036/session-000-original/conversation.jsonl": "54be0f2fa3d09c4d81ea2a2a296c3fb3d5e8f49c3b57292fb624252ecb229f62",
    "heldout-unanswered-continuation-v1/run/job-0036/session-000-original/receipt.json": "381ce646b17c3d2001f72b28e115bd1cb3f5c65ce33ea221c4d752019e09db38",
    "heldout-unanswered-continuation-v1/run/job-0036/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0036/session-000-original.stdout": "54be0f2fa3d09c4d81ea2a2a296c3fb3d5e8f49c3b57292fb624252ecb229f62",
    "heldout-unanswered-continuation-v1/run/job-0036/session-001-candidate/conversation.jsonl": "99de8a30528bccfe28ede53146c5e87b8893cc0c6b7bccdf4438bd577f3a84a6",
    "heldout-unanswered-continuation-v1/run/job-0036/session-001-candidate/receipt.json": "e5c6712adbd7589248ecc8e87e7172fa4916b6853c0a1aa196eccda2357ec8ec",
    "heldout-unanswered-continuation-v1/run/job-0036/session-001-candidate.stderr": "b68b91c889551ae938048d56eb67aed875c3bc3e590f41fd69cfb31ec707cdd7",
    "heldout-unanswered-continuation-v1/run/job-0036/session-001-candidate.stdout": "99de8a30528bccfe28ede53146c5e87b8893cc0c6b7bccdf4438bd577f3a84a6",
    "heldout-unanswered-continuation-v1/run/job-0036.driver.log": "6a29d9bff0df3386fd74088b81a8418278f06bb773315650455aa42eab15bc0c",
    "heldout-unanswered-continuation-v1/run/job-0037/receipt.json": "5869e90a6a156ee7af321980ae09c906f6be4d1673105cf79f4687027e05baa4",
    "heldout-unanswered-continuation-v1/run/job-0037/session-000-candidate/conversation.jsonl": "b9ed817f4cf623860bb8cf008e1c926aff70aacb9915c48b9a7c03e43c1bf724",
    "heldout-unanswered-continuation-v1/run/job-0037/session-000-candidate/receipt.json": "d6741f1eb62e9ebfc28a94f013193da7b1999cd068e22d8092b116d1860b77c1",
    "heldout-unanswered-continuation-v1/run/job-0037/session-000-candidate.stderr": "a8afc32323cd1d482e515dfa287653faffeb6ee25fbc057835b5a6c4eccaab1f",
    "heldout-unanswered-continuation-v1/run/job-0037/session-000-candidate.stdout": "b9ed817f4cf623860bb8cf008e1c926aff70aacb9915c48b9a7c03e43c1bf724",
    "heldout-unanswered-continuation-v1/run/job-0037/session-001-original/conversation.jsonl": "4060388acb35d68630aec9ec04506378b4dc64486c114eebd5072e9b7fb1ad84",
    "heldout-unanswered-continuation-v1/run/job-0037/session-001-original/receipt.json": "1d73d0c1174e4b55dfd127f951dc814407fd95427bf379645999d23bbb0a8524",
    "heldout-unanswered-continuation-v1/run/job-0037/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0037/session-001-original.stdout": "4060388acb35d68630aec9ec04506378b4dc64486c114eebd5072e9b7fb1ad84",
    "heldout-unanswered-continuation-v1/run/job-0037.driver.log": "2fda2e757624962183b156af91f67465dea53cd46bcebb9348423dea3255e112",
    "heldout-unanswered-continuation-v1/run/job-0038/receipt.json": "4bca4c1e5efd1eb43f2718796413d9528beac12591e40be1125fd865e1b313ff",
    "heldout-unanswered-continuation-v1/run/job-0038/session-000-original/conversation.jsonl": "ee163e25c738a4517369fb7e156cf379aed2652454946af123711c98d5d0fd3e",
    "heldout-unanswered-continuation-v1/run/job-0038/session-000-original/receipt.json": "2d4af762c82cabc2976dd08085f9d91e5b2db302811beb416c9e81a18672b853",
    "heldout-unanswered-continuation-v1/run/job-0038/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0038/session-000-original.stdout": "ee163e25c738a4517369fb7e156cf379aed2652454946af123711c98d5d0fd3e",
    "heldout-unanswered-continuation-v1/run/job-0038/session-001-candidate/conversation.jsonl": "c9f0d30a9cb6835332cd0ca3238856be3078483a5d055fa1a6f78102657607b1",
    "heldout-unanswered-continuation-v1/run/job-0038/session-001-candidate/receipt.json": "023cfbb2e947fdced13586c0ae0eeca4dca587231763aa68c925f65b71e76488",
    "heldout-unanswered-continuation-v1/run/job-0038/session-001-candidate.stderr": "0e1bde4ab6ff41156e9aa92b310169eecbc9eb72578dfba920b64a6c6badfeb1",
    "heldout-unanswered-continuation-v1/run/job-0038/session-001-candidate.stdout": "c9f0d30a9cb6835332cd0ca3238856be3078483a5d055fa1a6f78102657607b1",
    "heldout-unanswered-continuation-v1/run/job-0038.driver.log": "61ee8a500de1756f2048cce4b6bf02ce74bcd443a521ecc9f0877ed66477b4f3",
    "heldout-unanswered-continuation-v1/run/job-0039/receipt.json": "020532b75ec0ff746450f95c5c8cc743d50bd41907b1bd71ad6c6901f266d4dc",
    "heldout-unanswered-continuation-v1/run/job-0039/session-000-candidate/conversation.jsonl": "3958c44a17e533f5e4001f57e98d645797ada180058ddccaa687846c8715d4b1",
    "heldout-unanswered-continuation-v1/run/job-0039/session-000-candidate/receipt.json": "2e299de73f19b4423b001ac2b6a4c76e5691b1a15690fa7fa30bf8554286f837",
    "heldout-unanswered-continuation-v1/run/job-0039/session-000-candidate.stderr": "c0df88ada267edc68f436781bf624535420235059e27f5f18395fbc94312671d",
    "heldout-unanswered-continuation-v1/run/job-0039/session-000-candidate.stdout": "3958c44a17e533f5e4001f57e98d645797ada180058ddccaa687846c8715d4b1",
    "heldout-unanswered-continuation-v1/run/job-0039/session-001-original/conversation.jsonl": "3de8f4fbe97fe42ba37c6118488650ed58396cd3617d773aac868e6d304b01fc",
    "heldout-unanswered-continuation-v1/run/job-0039/session-001-original/receipt.json": "0766cec0543f71c042343145b7a6dab8a80777afbe34da16e079b9b91b7c2e32",
    "heldout-unanswered-continuation-v1/run/job-0039/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0039/session-001-original.stdout": "3de8f4fbe97fe42ba37c6118488650ed58396cd3617d773aac868e6d304b01fc",
    "heldout-unanswered-continuation-v1/run/job-0039.driver.log": "a45a879adf9821e3b9697fbdaf48c8ef2b6a76755e006a30ab1ed9533cf20132",
    "heldout-unanswered-continuation-v1/run/job-0040/receipt.json": "0454d2b47ba52a373620921804960eb6704a60ad860be3faebba69a697e9923d",
    "heldout-unanswered-continuation-v1/run/job-0040/session-000-original/conversation.jsonl": "e7d2283138ae5b2afbd2ea95b5c2aed3100f4c177b4ef0699659fea283c3454e",
    "heldout-unanswered-continuation-v1/run/job-0040/session-000-original/receipt.json": "eccf4697586683b9aa1dbb6c5591e2dde781b93bea2b37bdd50cf91a2308e7aa",
    "heldout-unanswered-continuation-v1/run/job-0040/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0040/session-000-original.stdout": "e7d2283138ae5b2afbd2ea95b5c2aed3100f4c177b4ef0699659fea283c3454e",
    "heldout-unanswered-continuation-v1/run/job-0040/session-001-candidate/conversation.jsonl": "eb3f0345e0025ade964e5f6da8c6410cfbd64358156480b658815b0c683bc34a",
    "heldout-unanswered-continuation-v1/run/job-0040/session-001-candidate/receipt.json": "acf2cccea20e8046be58cc77e0b1bb36d402612bb8a970e3b49d2de8aedae1d1",
    "heldout-unanswered-continuation-v1/run/job-0040/session-001-candidate.stderr": "52367cdf3b24452623a6ee14dcd409f5d2b8fade0cf356c904028f56e1f2a2f4",
    "heldout-unanswered-continuation-v1/run/job-0040/session-001-candidate.stdout": "eb3f0345e0025ade964e5f6da8c6410cfbd64358156480b658815b0c683bc34a",
    "heldout-unanswered-continuation-v1/run/job-0040.driver.log": "df9a76264718f4b73799a6f26eeca57f3c4ca37b79144b6d61ec6ff04ec1261e",
    "heldout-unanswered-continuation-v1/run/job-0041/receipt.json": "251684fffea74935b9090f706d04d4a61a94701df44c82445444fca35b9db1f3",
    "heldout-unanswered-continuation-v1/run/job-0041/session-000-candidate/conversation.jsonl": "20f606415b0679a5b3ac715f88a3c5d06d98cf60abb9a76984763833ab535f3e",
    "heldout-unanswered-continuation-v1/run/job-0041/session-000-candidate/receipt.json": "c3d48430f39edca1777acc023ce98731abb3914b90e91e1f320b8d609d7e1ec5",
    "heldout-unanswered-continuation-v1/run/job-0041/session-000-candidate.stderr": "fd3447f77eaf0469f5104ef6589ef6be2585e923c42be8af751b6f4c4c3bffd8",
    "heldout-unanswered-continuation-v1/run/job-0041/session-000-candidate.stdout": "20f606415b0679a5b3ac715f88a3c5d06d98cf60abb9a76984763833ab535f3e",
    "heldout-unanswered-continuation-v1/run/job-0041/session-001-original/conversation.jsonl": "1b131d54e17ce1f199c3f0a2b29ad00fcb29f842594f3b3fd7bfa15f8a058af6",
    "heldout-unanswered-continuation-v1/run/job-0041/session-001-original/receipt.json": "dc21fec2536318c798816d0502f21a6d5e006a9d2a0335611fc1b323d4c111a8",
    "heldout-unanswered-continuation-v1/run/job-0041/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0041/session-001-original.stdout": "1b131d54e17ce1f199c3f0a2b29ad00fcb29f842594f3b3fd7bfa15f8a058af6",
    "heldout-unanswered-continuation-v1/run/job-0041.driver.log": "e0065b9806273267c4dbbdb4ec085754cb7110660e940abca6b2817cf5b4bf6a",
    "heldout-unanswered-continuation-v1/run/job-0042/receipt.json": "80e0b79f2d32e19856d4f7f23bb08e683926ba8f4094487d100ee7bb2ca23f38",
    "heldout-unanswered-continuation-v1/run/job-0042/session-000-original/conversation.jsonl": "41978d54766e327cecff3965f291587370106f767a80827c66dc9317ea1af33e",
    "heldout-unanswered-continuation-v1/run/job-0042/session-000-original/receipt.json": "bdd5c4d0ac46ccdc2dd2f32065e9e18ef8eea6c4e91aa9168b849f478b93220b",
    "heldout-unanswered-continuation-v1/run/job-0042/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0042/session-000-original.stdout": "41978d54766e327cecff3965f291587370106f767a80827c66dc9317ea1af33e",
    "heldout-unanswered-continuation-v1/run/job-0042/session-001-candidate/conversation.jsonl": "8830e1ce1cf6c2129cc31aa1a6b58600194bb41c0050696a5b34bd475bbf482a",
    "heldout-unanswered-continuation-v1/run/job-0042/session-001-candidate/receipt.json": "b8ed864e489022d78b005dfc70e6e8386a9454d55ba1f40ca49ca8ee9e15ee74",
    "heldout-unanswered-continuation-v1/run/job-0042/session-001-candidate.stderr": "2964bf38ab656ac64d163079d54f5c9e1d2b81862362e4a5378a981fadf70c1a",
    "heldout-unanswered-continuation-v1/run/job-0042/session-001-candidate.stdout": "8830e1ce1cf6c2129cc31aa1a6b58600194bb41c0050696a5b34bd475bbf482a",
    "heldout-unanswered-continuation-v1/run/job-0042.driver.log": "1d3deff5af5899fd998c66f92e83708d18d8cf54631edd14583bc0d52e1be33f",
    "heldout-unanswered-continuation-v1/run/job-0043/receipt.json": "5c5c0d6c0ee61db0b6eadba5ea519a6bad4ad495719c330d0663041ee951281c",
    "heldout-unanswered-continuation-v1/run/job-0043/session-000-candidate/conversation.jsonl": "b305bf303a669f8b2fe4105e8ff341723d2c2d411074034f81590404af42f309",
    "heldout-unanswered-continuation-v1/run/job-0043/session-000-candidate/receipt.json": "30e56cfb4f6d19d15a9e1438dbd6a6ee17fe4c215184bf0940104d7d413c781c",
    "heldout-unanswered-continuation-v1/run/job-0043/session-000-candidate.stderr": "b68b91c889551ae938048d56eb67aed875c3bc3e590f41fd69cfb31ec707cdd7",
    "heldout-unanswered-continuation-v1/run/job-0043/session-000-candidate.stdout": "b305bf303a669f8b2fe4105e8ff341723d2c2d411074034f81590404af42f309",
    "heldout-unanswered-continuation-v1/run/job-0043/session-001-candidate/conversation.jsonl": "757010aa456d1fe8d944bd277b4fe7967c7fe6070d0842821a01fe2910148cf8",
    "heldout-unanswered-continuation-v1/run/job-0043/session-001-candidate/receipt.json": "00d9499a5d4f06681382b3ce97342b99886f55ba8bea12e2126840251d91ee2d",
    "heldout-unanswered-continuation-v1/run/job-0043/session-001-candidate.stderr": "02bd2f957d7b9fbf82f1ba7432c2bb2c3c956e85ddc29ab8ec4c8e9c2f72553c",
    "heldout-unanswered-continuation-v1/run/job-0043/session-001-candidate.stdout": "757010aa456d1fe8d944bd277b4fe7967c7fe6070d0842821a01fe2910148cf8",
    "heldout-unanswered-continuation-v1/run/job-0043/session-002-original/conversation.jsonl": "0927afb3e6da07e9e04b881b754efb44d798c05567d836fdac7fd2bbcf9c9208",
    "heldout-unanswered-continuation-v1/run/job-0043/session-002-original/receipt.json": "60af51c49524c0cae7502b0289748465316e15df5ae678828d3dad1b45f89c5d",
    "heldout-unanswered-continuation-v1/run/job-0043/session-002-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0043/session-002-original.stdout": "0927afb3e6da07e9e04b881b754efb44d798c05567d836fdac7fd2bbcf9c9208",
    "heldout-unanswered-continuation-v1/run/job-0043.driver.log": "b1a1ddcd66e21b58597226afa4df9c6ed3eae17bf8697813e447831ae8aefa41",
    "heldout-unanswered-continuation-v1/run/job-0044/receipt.json": "926285aabbc42d0fbbaf89b127e7783fc9140a8a7dcad633061e21cce4bb9260",
    "heldout-unanswered-continuation-v1/run/job-0044/session-000-original/conversation.jsonl": "f1da543828059ed277970a031e8fca5ef43658a673531efe85cb2a75657ecc62",
    "heldout-unanswered-continuation-v1/run/job-0044/session-000-original/receipt.json": "cbdaf0869eaa7c27b733e15f5bba678b91ee24cb28663310fdcf0b8333aba29b",
    "heldout-unanswered-continuation-v1/run/job-0044/session-000-original.stderr": "149486a2c3fcb68170503aeeba5133120ad56443718281642cadc69f41b23ef7",
    "heldout-unanswered-continuation-v1/run/job-0044/session-000-original.stdout": "f1da543828059ed277970a031e8fca5ef43658a673531efe85cb2a75657ecc62",
    "heldout-unanswered-continuation-v1/run/job-0044/session-001-candidate/conversation.jsonl": "88ebe86fd4a9360cb2a5329a47eaa78b6d7a5e944820a1b2a3b7ed373899b9b5",
    "heldout-unanswered-continuation-v1/run/job-0044/session-001-candidate/receipt.json": "bc6ecf5527118375304d34b6580eaee321323c92d842622fcf3c0da1e0cb6d2f",
    "heldout-unanswered-continuation-v1/run/job-0044/session-001-candidate.stderr": "c0df88ada267edc68f436781bf624535420235059e27f5f18395fbc94312671d",
    "heldout-unanswered-continuation-v1/run/job-0044/session-001-candidate.stdout": "88ebe86fd4a9360cb2a5329a47eaa78b6d7a5e944820a1b2a3b7ed373899b9b5",
    "heldout-unanswered-continuation-v1/run/job-0044.driver.log": "3f98f043380bc0b64adeb71beff307012acacb4012753c36de9f2eacae08c922",
    "heldout-unanswered-continuation-v1/run/job-0045/receipt.json": "859ff71897aacde8da29490a527edacc98f797c5123a7173e1a83ca132368e3b",
    "heldout-unanswered-continuation-v1/run/job-0045/session-000-candidate/conversation.jsonl": "2e137f0a0b03b8cea80f776d3c3d37fcc5e3e7ca660460bb3297381e63902d07",
    "heldout-unanswered-continuation-v1/run/job-0045/session-000-candidate/receipt.json": "7cd56e9f75ce09f0a7d1eb18f4aceac30c15a0e394f7488c82ddb99a62b6530d",
    "heldout-unanswered-continuation-v1/run/job-0045/session-000-candidate.stderr": "fd5cdd4c9984e514ebaa85efdb86df04041ba11cdad43186b981acd096d1b3a9",
    "heldout-unanswered-continuation-v1/run/job-0045/session-000-candidate.stdout": "2e137f0a0b03b8cea80f776d3c3d37fcc5e3e7ca660460bb3297381e63902d07",
    "heldout-unanswered-continuation-v1/run/job-0045/session-001-original/conversation.jsonl": "8e787cbf96cc08996e1e43b956af11cc4b5d06b2629f30f0305300c27c1f26f7",
    "heldout-unanswered-continuation-v1/run/job-0045/session-001-original/receipt.json": "afd75ec4330fa11a393e425753647e110efcda1ef429d46e26e44eaf48e58767",
    "heldout-unanswered-continuation-v1/run/job-0045/session-001-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0045/session-001-original.stdout": "8e787cbf96cc08996e1e43b956af11cc4b5d06b2629f30f0305300c27c1f26f7",
    "heldout-unanswered-continuation-v1/run/job-0045.driver.log": "6898b3be6a221a85da153221b2ff614bba90c6d82f50ebad8d2d91ab08a0e810",
    "heldout-unanswered-continuation-v1/run/job-0046/receipt.json": "39eb70fffb3d47b900885619da776eb0e308f7835e6c4df98ee9a3fd27c71066",
    "heldout-unanswered-continuation-v1/run/job-0046/session-000-original/conversation.jsonl": "3496b9a1d2763770a95ae51cc257fd2c2ab645a65451209e987c3073aad44de5",
    "heldout-unanswered-continuation-v1/run/job-0046/session-000-original/receipt.json": "307f7ed2a9ca95bf874e463f5809805de7ca1c1f924ab3ec1453002fe5123702",
    "heldout-unanswered-continuation-v1/run/job-0046/session-000-original.stderr": "7b266ed678ea465ba6074236227be426dc1ea0d4bf00f2c507ec4b6424b6bf19",
    "heldout-unanswered-continuation-v1/run/job-0046/session-000-original.stdout": "3496b9a1d2763770a95ae51cc257fd2c2ab645a65451209e987c3073aad44de5",
    "heldout-unanswered-continuation-v1/run/job-0046.driver.log": "37307dec87599648aa267d8700046ea3e757f8416b37aadea8f205e1f54d2356"
  },
  "source_allocated_bytes": 13574144,
  "all_prior_allocated_bytes": 25698304,
  "spent_job_seconds": 55866.17972529016,
  "attempted_model_sessions": 137,
  "pending_answer": {
    "arm": "original",
    "id": "3478",
    "event_sha256": "4d7a52bd19460f2b43b64cba4fe6d0b0cc37d40c9e30b13900b11013a6cc6b9d",
    "stdout_path": "heldout-unanswered-continuation-v1/run/job-0046/session-000-original.stdout",
    "receipt_sha256": "39eb70fffb3d47b900885619da776eb0e308f7835e6c4df98ee9a3fd27c71066"
  },
  "partial_scores_computed": false,
  "heldout_answers_regraded": 0,
  "model_runs": 0,
  "audit_process_peak_bytes": 47038776,
  "audit_seconds": 0.700878125
}

```

## protocol.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/protocol.json`; bytes: 2757; SHA-256: `b56822e9a8d89d9d90ad01f67e184b90d44dc9b8301b173133a9ab3a0d129b73`.

```json
{
  "schema": 1,
  "kind": "same-model-instruction-grader-recovery-v1",
  "driver_sha256": "fffca416045f6d47797057a41126cdc556125018042f4636877a59e4ad53a586",
  "helper_sha256": {
    "context_qualification": "ee929fe7433fe6287af2b5591dafc960315f2ed5d31902882cfd7d0c9a9f15e8",
    "memory_gate": "fed53adbbc761457f94e11ded179915d538b515d448dc029ff3f0604f7faf6fc",
    "prefill_bench": "000868d66f82cd1eba5973c0fa9b4259831a6bdbc5bcf7d4c4f858d86c71d472",
    "quantization_bfcl": "df45b7b932fd32817c5b6e3504cbb2bd69ea1eae10ec55014a8c03c58af04a5c",
    "quantization_code_sandbox": "329b0968a3e808e1f6daffaee11a285965474c942844f54ad456d5a9d776cf43",
    "quantization_inventory": "af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb",
    "quantization_outcomes": "28ed136046f837d7adc2a26958a2ea5fad33e62ceee00931047b7d81aac4238e",
    "quantization_paired": "7ff70080bc7448a65f35f61652d587d1b9316fbef69d0f7c2f37959ac32630c0",
    "quantization_tasks": "002b9b45c9a4d4c65e567594f52832ac19938f0f8f7c044c411e9afa06005013",
    "quantization_outcome_campaign": "ca036378fc9e57d62046fea96892925f02ac27c46575b5e3ec4ca2861a1e58e0",
    "quantization_outcome_continuation": "61fda1ca8a81d713125e36bd374f75f1ab8c1713b2b703c142e3f200b7967ff3",
    "quantization_grader_source_audit": "b4aaca495f615919f93d5dc1ac9f870ce4127c3cf77492fa8847fa356c8125e7"
  },
  "python": {
    "version": "3.9.6 (default, May 22 2026, 11:13:45) \n[Clang 21.0.0 (clang-2100.1.1.101)]",
    "executable_sha256": "0b7aad9bf1adf74d3922cf351f7d2e908dae19edd5456299d162810ae083523d"
  },
  "correction": {
    "worker_interpreter_only": true,
    "worker_source_unchanged": true,
    "native_unchanged": true,
    "saved_answer_graded_once": true,
    "unanswered_only": true,
    "instruction_footprint_is_custody": true
  },
  "previous_protocol": "heldout-unanswered-continuation-v1/protocol.json",
  "previous_protocol_sha256": "217b9c6ee846e401960b63f856bf418696837d29408a92e34996b7127a3362cf",
  "source_audit": "heldout-grader-import-diagnosis-v1/source-audit.json",
  "source_audit_sha256": "a4232e0d235721eff1e8e5b47dd243f945e085b7e4a736f26626cdb7b7d0e4ed",
  "stop_job": 46,
  "preparer_sha256": "680962105afe7e3f937c51747b53ea1f4cc0d9fa33eb69cf1b66b970c940527d",
  "instruction_worker": {
    "executable": "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "executable_sha256": "e878533ce71a6e91b0fae5e8bbe8baebbb6194dad84fead52e9b42f0620ad011",
    "version": "3.12.9 (main, Feb 12 2025, 15:09:19) [Clang 19.1.6 ]",
    "cache_tag": "cpython-312",
    "source": "heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py",
    "source_sha256": "a687b732cb7cddf3008cf5238b6102d4ccbbf7bc419447e2e4c4b4c7f2775326"
  }
}

```

## preparation.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/preparation.json`; bytes: 1978; SHA-256: `649c8350aa2011ec6fc4fbbbead6bbacb3153b69e1b05996915ae735a52c08b7`.

```json
{
  "complete": true,
  "protocol_sha256": "b56822e9a8d89d9d90ad01f67e184b90d44dc9b8301b173133a9ab3a0d129b73",
  "worker": {
    "executable": "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "executable_sha256": "e878533ce71a6e91b0fae5e8bbe8baebbb6194dad84fead52e9b42f0620ad011",
    "version": "3.12.9 (main, Feb 12 2025, 15:09:19) [Clang 19.1.6 ]",
    "cache_tag": "cpython-312",
    "source": "heldout-unanswered-continuation-v1/helpers/quantization_outcomes.py",
    "source_sha256": "a687b732cb7cddf3008cf5238b6102d4ccbbf7bc419447e2e4c4b4c7f2775326"
  },
  "instruction_synthetic_preflight": [
    {
      "passed": true,
      "instructions": [
        true
      ],
      "method": "upstream-strict-prompt",
      "peak_worker_bytes": 104235584
    },
    {
      "passed": false,
      "instructions": [
        false
      ],
      "method": "upstream-strict-prompt",
      "peak_worker_bytes": 36192760
    }
  ],
  "bfcl_synthetic_imports": {
    "result": {
      "results": [
        []
      ]
    },
    "trace": [
      {
        "owner": "replay",
        "calls": [],
        "results": []
      }
    ],
    "calls": 0,
    "peak_worker_bytes": 34193696,
    "manifest_sha256": "d684362dd02ae9541651829c6d513b86636f70fa98e9f1c4121f01feaa710850",
    "adapter_sha256": "df45b7b932fd32817c5b6e3504cbb2bd69ea1eae10ec55014a8c03c58af04a5c",
    "sandbox_profile_sha256": "60c04c62799dc1b21ce4049cbcbc3b84b7905248274ae8fa25f5d6715adb0408"
  },
  "unchanged_grader_definitions": [
    "TaskBudgetExceeded",
    "ToolLimits",
    "exact_number",
    "grade",
    "normalize_schema",
    "terminal",
    "tool_case",
    "tools_for"
  ],
  "preserved_complete_jobs": 46,
  "preserved_pending_answers": 1,
  "spent_job_seconds": 55866.17972529016,
  "attempted_model_sessions": 137,
  "remaining_receipt_reservation_bytes": 5974301696,
  "heldout_answers_graded": 0,
  "model_runs": 0,
  "partial_scores_computed": false
}

```

## tests.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/tests.json`; bytes: 3786; SHA-256: `90770de6675647af4674e18c0549490c7b7bea34f771dd5eee4b9fd43e4d2b94`.

```json
{
  "complete": true,
  "model_runs": 0,
  "heldout_answers_graded": 0,
  "suites": [
    {
      "python": "python39",
      "suite": "quantization_outcomes",
      "command": [
        "/Library/Developer/CommandLineTools/usr/bin/python3",
        "Tools/quantization_outcomes_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.051514167,
      "log": "python39-quantization_outcomes.log"
    },
    {
      "python": "python39",
      "suite": "quantization_outcome_campaign",
      "command": [
        "/Library/Developer/CommandLineTools/usr/bin/python3",
        "Tools/quantization_outcome_campaign_test.py"
      ],
      "exit_code": 0,
      "seconds": 7.452971166,
      "log": "python39-quantization_outcome_campaign.log"
    },
    {
      "python": "python39",
      "suite": "quantization_outcome_continuation",
      "command": [
        "/Library/Developer/CommandLineTools/usr/bin/python3",
        "Tools/quantization_outcome_continuation_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.2936772919999999,
      "log": "python39-quantization_outcome_continuation.log"
    },
    {
      "python": "python39",
      "suite": "quantization_grader_source_audit",
      "command": [
        "/Library/Developer/CommandLineTools/usr/bin/python3",
        "Tools/quantization_grader_source_audit_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.06906579199999996,
      "log": "python39-quantization_grader_source_audit.log"
    },
    {
      "python": "python39",
      "suite": "quantization_grader_continuation",
      "command": [
        "/Library/Developer/CommandLineTools/usr/bin/python3",
        "Tools/quantization_grader_continuation_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.27742654099999964,
      "log": "python39-quantization_grader_continuation.log"
    },
    {
      "python": "python312",
      "suite": "quantization_outcomes",
      "command": [
        "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
        "Tools/quantization_outcomes_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.053839333999999184,
      "log": "python312-quantization_outcomes.log"
    },
    {
      "python": "python312",
      "suite": "quantization_outcome_campaign",
      "command": [
        "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
        "Tools/quantization_outcome_campaign_test.py"
      ],
      "exit_code": 0,
      "seconds": 7.4491132910000015,
      "log": "python312-quantization_outcome_campaign.log"
    },
    {
      "python": "python312",
      "suite": "quantization_outcome_continuation",
      "command": [
        "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
        "Tools/quantization_outcome_continuation_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.24692058399999972,
      "log": "python312-quantization_outcome_continuation.log"
    },
    {
      "python": "python312",
      "suite": "quantization_grader_source_audit",
      "command": [
        "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
        "Tools/quantization_grader_source_audit_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.05962304100000004,
      "log": "python312-quantization_grader_source_audit.log"
    },
    {
      "python": "python312",
      "suite": "quantization_grader_continuation",
      "command": [
        "/Users/carlos/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
        "Tools/quantization_grader_continuation_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.22614249999999814,
      "log": "python312-quantization_grader_continuation.log"
    }
  ]
}

```

## python312-quantization_grader_continuation.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python312-quantization_grader_continuation.log`; bytes: 1060; SHA-256: `e0a37fc8e873e5175749558b476b73da5d98474bdabf0b20924eb00bf6b26b63`.

```text
{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "candidate", "id": "d", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "c", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "d", "complete_task": true}
..{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "candidate", "id": "d", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "c", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "d", "complete_task": true}
.
----------------------------------------------------------------------
Ran 6 tests in 0.181s

OK

```

## python312-quantization_grader_source_audit.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python312-quantization_grader_source_audit.log`; bytes: 100; SHA-256: `53b77ed73b881186e0f76e3a51bce55b2d9b1423f4fc18759eb12e7a5b519b65`.

```text
..
----------------------------------------------------------------------
Ran 2 tests in 0.014s

OK

```

## python312-quantization_outcome_campaign.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python312-quantization_outcome_campaign.log`; bytes: 112; SHA-256: `a04f532a9ee4dfeb84661b5ea30f7ba4e95d894a79dabe03456759aecb90dbc5`.

```text
.............
----------------------------------------------------------------------
Ran 13 tests in 7.394s

OK

```

## python312-quantization_outcome_continuation.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python312-quantization_outcome_continuation.log`; bytes: 362; SHA-256: `1f9a4925ba8eb1874a8d65076909ca5c5614a1b96324a892021d99886aad614f`.

```text
....{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
....{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
...{"job": 1, "family": "facts", "arm": "original", "id": "b", "complete_task": true}
.
----------------------------------------------------------------------
Ran 12 tests in 0.182s

OK

```

## python312-quantization_outcomes.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python312-quantization_outcomes.log`; bytes: 112; SHA-256: `1b54e7bd3e4f0557cdf06d1076b6ef63ce21d6c17ecec62d2881ac93eafe1fed`.

```text
.............
----------------------------------------------------------------------
Ran 13 tests in 0.006s

OK

```

## python39-quantization_grader_continuation.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python39-quantization_grader_continuation.log`; bytes: 1060; SHA-256: `5e652f1c11588956a0791bde35ea5588443fca305868f518e192120c7309d083`.

```text
{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "candidate", "id": "d", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "c", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "d", "complete_task": true}
..{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "candidate", "id": "d", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "c", "complete_task": true}
{"job": 1, "family": "instruction", "arm": "original", "id": "d", "complete_task": true}
.
----------------------------------------------------------------------
Ran 6 tests in 0.226s

OK

```

## python39-quantization_grader_source_audit.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python39-quantization_grader_source_audit.log`; bytes: 100; SHA-256: `0cc3c2a48beda5d84492b7a89dc4b15039e5c0925e8850e0904a7ce636a63bb2`.

```text
..
----------------------------------------------------------------------
Ran 2 tests in 0.018s

OK

```

## python39-quantization_outcome_campaign.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python39-quantization_outcome_campaign.log`; bytes: 112; SHA-256: `a04f532a9ee4dfeb84661b5ea30f7ba4e95d894a79dabe03456759aecb90dbc5`.

```text
.............
----------------------------------------------------------------------
Ran 13 tests in 7.394s

OK

```

## python39-quantization_outcome_continuation.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python39-quantization_outcome_continuation.log`; bytes: 362; SHA-256: `1896946c99c41ae1255e0db77b92eb4eccd68790aec9d7fd217a00f2c241be66`.

```text
....{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
....{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
...{"job": 1, "family": "facts", "arm": "original", "id": "b", "complete_task": true}
.
----------------------------------------------------------------------
Ran 12 tests in 0.225s

OK

```

## python39-quantization_outcomes.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/python39-quantization_outcomes.log`; bytes: 112; SHA-256: `eb55bdeb232a5345b812b14974fa3803a4265c20b50cb28f1fb75acf884da36e`.

```text
.............
----------------------------------------------------------------------
Ran 13 tests in 0.009s

OK

```

