---
type: run
id: 01m1xbr0aspycsty8ghk9a0t0j
created: 2026-09-07T07:18:56.600977+00:00
updated: 2026-09-07T07:19:46.020878+00:00
summary: Configurable context software proxies and portable native qualification
binary: Isolated source-policy executable; no MLX or model
captured_at: 2026-09-07
command: make context-test; source handoff extraction; old candidate binding refusal
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Configurable context software proxies and portable native qualification
tool: Isolated Swift policy and Python process/transport fixtures
---
# Configurable-context software delivery and portable qualification

Carlos explicitly instructed that implementation and proxy testing proceed now, with native model/hardware testing deferred to another interval or computer. No memory-availability wait loop or native model launch belongs to this delivery. This source records software evidence; all hardware/release flags remain false.

The only runtime source refactor moves Planner.deviceRAMGB, deviceWorkingSetGB and deviceAvailableGB into PlannerDevice.swift. The methods are byte-identical to the prior implementations. Public signatures, availabilityOverride and planning arithmetic are unchanged. The portable Swift harness compiles production policy with inert observations and exact extracted pure declarations; it never imports MLX or constructs Engine. Optional PlannerCostModel source is included when present.

The context delivery/evidence proxies found malformed/duplicate-terminal tool acceptance and non-integer/out-of-vocabulary token observations. Their original failures and the strict successors are preserved below. Capacity evidence now also requires an MLX peak observation, alongside independent physical-memory evidence. Native launch readiness refuses missing/non-normal OS-pressure readings. The portable campaign preserves all original profiles, their ordering, retained warm-up lengths, independent resource prerequisites, target-plus-slack preflights and first-failure stop behavior. Binding only calls plan-only; a retained profile must explicitly price retention. The final tests include successful inert binding and forged-source rejection.

Command: `make context-test CONTEXT_TEST_OUT=<fresh-output-directory>`.
Final Python unittest count: 79. The compiled source-policy assertion count is recorded in the raw report. These are geometry/controller/predicate checks, not that many independently representative model tasks. No model, GPU or real pressure was used. No full SwiftPM/MLX build, actual API/model/client run, installed binary/release/rollback or expanded-capacity result is claimed. CI workflow was added but has not run remotely in this task.

The source-only handoff was exported, extracted into a fresh directory and matched against its per-file identity. An old V215 candidate failed binding before model access. All applicable native C01-C22 portions remain explicitly listed in the catalogue; no proxy can close them. Default32768/public65536 and separate MTP/vision limits remain unchanged.

## source-packet.json

SHA-256 `4e484297fca3c9ad1cb2d39f6c6e5795b621c4cb4301c59f92b5496983f88534`.

````text
{
  "Sources/Slotstream/Plan.swift": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
  "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
  "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
  "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
  "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
  "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
  "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
  "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
  "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
  "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
  "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
  "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
  "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
  ".github/workflows/context-proxies.yml": "c60f25a11466da9c16db24ae775fc34e75f6acac3a92f6532e0c74ab71ed0975",
  "docs/TESTING.md": "6df93b4f10a1b666b57e232c23ebab79288e6ac2e45203f2df006284e5e9f307"
}

````

## runtime-seam.patch

SHA-256 `305e8eab52fda2cfbf4ac7f17817cd7fd0e32e1e5ac034141341eaa1f1cf86b7`.

````text
--- Plan.before.swift
+++ Sources/Slotstream/Plan.swift
@@ -4,9 +4,7 @@
 // exposed over /api/show — so what the process *does* and what it *says* can
 // never drift apart.
 
-import Darwin
 import Foundation
-import MLX
 
 /// Model geometry the cache math speaks in. The planner needs these before the
 /// checkpoint is opened, so they are constants — `check(against:recordBytes:)`
@@ -546,15 +544,6 @@
             .rounded(.up) / 10
     }
 
-    public static func deviceRAMGB() -> Double {
-        Double(ProcessInfo.processInfo.physicalMemory) / 1e9
-    }
-
-    public static func deviceWorkingSetGB() -> Double {
-        let ws = Double(MLX.GPU.deviceInfo().maxRecommendedWorkingSetSize) / 1e9
-        return ws > 0 ? ws : deviceRAMGB() * 0.75
-    }
-
     /// Memory reclaimable RIGHT NOW without compressing or swapping any other
     /// process's memory: free pages (the raw counter includes speculative) +
     /// purgeable + file-backed cache. Deliberately NOT `kern.memorystatus_level`
@@ -572,21 +561,6 @@
     /// with 7 GB took a real 25 GB pool and drove tens of GB of swap. Anything
     /// using this seam must bound the value by `deviceAvailableGB()`.
     public nonisolated(unsafe) static var availabilityOverride: Double?
-
-    public static func deviceAvailableGB() -> Double? {
-        var count = mach_msg_type_number_t(
-            MemoryLayout<vm_statistics64_data_t>.stride / MemoryLayout<integer_t>.stride)
-        var stats = vm_statistics64_data_t()
-        let kr = withUnsafeMutablePointer(to: &stats) { p in
-            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
-                host_statistics64(mach_host_self(), HOST_VM_INFO64, $0, &count)
-            }
-        }
-        guard kr == KERN_SUCCESS else { return nil }
-        let pages = Double(stats.free_count) + Double(stats.purgeable_count)
-            + Double(stats.external_page_count)
-        return pages * Double(vm_page_size) / 1e9
-    }
 
     /// Headroom kept between our expected peak and what is reclaimable, so
     /// claiming it doesn't leave the machine at zero.

New PlannerDevice.swift:
// Platform observations are separate from the pure planning policy.
// Public Planner entry points remain source-compatible.
import Darwin
import Foundation
import MLX

extension Planner {
    public static func deviceRAMGB() -> Double {
        Double(ProcessInfo.processInfo.physicalMemory) / 1e9
    }

    public static func deviceWorkingSetGB() -> Double {
        let ws = Double(MLX.GPU.deviceInfo().maxRecommendedWorkingSetSize) / 1e9
        return ws > 0 ? ws : deviceRAMGB() * 0.75
    }

    public static func deviceAvailableGB() -> Double? {
        var count = mach_msg_type_number_t(
            MemoryLayout<vm_statistics64_data_t>.stride / MemoryLayout<integer_t>.stride)
        var stats = vm_statistics64_data_t()
        let kr = withUnsafeMutablePointer(to: &stats) { p in
            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics64(mach_host_self(), HOST_VM_INFO64, $0, &count)
            }
        }
        guard kr == KERN_SUCCESS else { return nil }
        let pages = Double(stats.free_count) + Double(stats.purgeable_count)
            + Double(stats.external_page_count)
        return pages * Double(vm_page_size) / 1e9
    }
}

````

## contracts-before.txt

SHA-256 `c586b419a7f7dec3ddca8eb4effc6112f8b8773c565f645d8025ad797dfd451a`.

````text
test_busy_verification_lock_preserves_failure_without_launch (context_qualification_checks.CapacityEvidence) ... ok
test_complete_delivery (context_qualification_checks.CapacityEvidence) ... ok
test_failed_first_rung_never_launches_the_next (context_qualification_checks.CapacityEvidence) ... {"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
ok
test_failed_verification_preflight_retains_failure_without_launch (context_qualification_checks.CapacityEvidence) ... ok
test_full_verification_holds_and_releases_the_model_lock (context_qualification_checks.CapacityEvidence) ... ok
test_incomplete_or_forged_observations_are_rejected (context_qualification_checks.CapacityEvidence) ... ok
test_padding_is_inside_product_bound (context_qualification_checks.CapacityEvidence) ... ok
test_retained_capacity_requires_complete_interleaved_ownership (context_qualification_checks.CapacityEvidence) ... ok
test_swap_and_missing_memory_observations_fail (context_qualification_checks.CapacityEvidence) ... ok
test_counts_must_be_integer_observations (context_contracts_test.ExactCapacityObservations) ... test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) ... test_complete_turn_delivers (context_contracts_test.StrictToolConsumer) ... ok
test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) ... test_non_json_numbers_are_inert (context_contracts_test.StrictToolConsumer) ... FAIL

======================================================================
ERROR: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}, {'choices': None}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
  File "/Users/carlos/Projects/slotstream/Tools/context_gates.py", line 33, in successful_tools
    for choice in frame.get("choices", []):
TypeError: 'NoneType' object is not iterable

======================================================================
ERROR: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': None}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
  File "/Users/carlos/Projects/slotstream/Tools/context_gates.py", line 46, in successful_tools
    current["arguments"] += function.get("arguments", "")
TypeError: can only concatenate str (not "NoneType") to str

======================================================================
ERROR: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': True}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
  File "/Users/carlos/Projects/slotstream/Tools/context_gates.py", line 46, in successful_tools
    current["arguments"] += function.get("arguments", "")
TypeError: can only concatenate str (not "bool") to str

======================================================================
ERROR: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': 12}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
  File "/Users/carlos/Projects/slotstream/Tools/context_gates.py", line 46, in successful_tools
    current["arguments"] += function.get("arguments", "")
TypeError: can only concatenate str (not "int") to str

======================================================================
ERROR: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': {'bad': 'value'}}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
  File "/Users/carlos/Projects/slotstream/Tools/context_gates.py", line 46, in successful_tools
    current["arguments"] += function.get("arguments", "")
TypeError: can only concatenate str (not "dict") to str

======================================================================
FAIL: test_counts_must_be_integer_observations (context_contracts_test.ExactCapacityObservations) (field='promptTokens')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 59, in test_counts_must_be_integer_observations
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_counts_must_be_integer_observations (context_contracts_test.ExactCapacityObservations) (field='prefillTokens')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 59, in test_counts_must_be_integer_observations
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_counts_must_be_integer_observations (context_contracts_test.ExactCapacityObservations) (field='decodeTokens')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 59, in test_counts_must_be_integer_observations
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='prompt_ids', bad=True)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='prompt_ids', bad=-1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='prompt_ids', bad=248320)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='prompt_ids', bad='1')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='prompt_ids', bad=1.0)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='prompt_ids', bad=None)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='output_ids', bad=True)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='output_ids', bad=-1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='output_ids', bad=248320)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='output_ids', bad='1')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='output_ids', bad=1.0)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) (field='output_ids', bad=None)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 52, in test_token_values_and_types_must_be_observed
    validate_delivery(result, CapacityEvidence.protocol, 16)
AssertionError: ValueError not raised

======================================================================
FAIL: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]', '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
AssertionError: Lists differ: [{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}] != []

First list contains 1 additional elements.
First extra element 0:
{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}

- [{'arguments': {'key': 'a'}, 'id': 'call_a', 'name': 'lookup'}]
+ []

======================================================================
FAIL: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, {'error': {}}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
AssertionError: Lists differ: [{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}] != []

First list contains 1 additional elements.
First extra element 0:
{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}

- [{'arguments': {'key': 'a'}, 'id': 'call_a', 'name': 'lookup'}]
+ []

======================================================================
FAIL: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': None, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
AssertionError: Lists differ: [{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}] != []

First list contains 1 additional elements.
First extra element 0:
{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}

- [{'arguments': {'key': 'a'}, 'id': 'call_a', 'name': 'lookup'}]
+ []

======================================================================
FAIL: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': True, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
AssertionError: Lists differ: [{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}] != []

First list contains 1 additional elements.
First extra element 0:
{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}

- [{'arguments': {'key': 'a'}, 'id': 'call_a', 'name': 'lookup'}]
+ []

======================================================================
FAIL: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': -1, 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
AssertionError: Lists differ: [{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}] != []

First list contains 1 additional elements.
First extra element 0:
{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}

- [{'arguments': {'key': 'a'}, 'id': 'call_a', 'name': 'lookup'}]
+ []

======================================================================
FAIL: test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) (frames=[{'choices': [{'delta': {'tool_calls': [{'index': '0', 'id': 'call_a', 'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}, {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}, '[DONE]'])
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 36, in test_malformed_or_incomplete_turns_never_deliver_or_throw
    self.assertEqual(successful_tools(frames), [])
AssertionError: Lists differ: [{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}] != []

First list contains 1 additional elements.
First extra element 0:
{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': 'a'}}

- [{'arguments': {'key': 'a'}, 'id': 'call_a', 'name': 'lookup'}]
+ []

======================================================================
FAIL: test_non_json_numbers_are_inert (context_contracts_test.StrictToolConsumer)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/context_contracts_test.py", line 42, in test_non_json_numbers_are_inert
    self.assertEqual(successful_tools([tool, self.finish, '[DONE]']), [])
AssertionError: Lists differ: [{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': nan}}] != []

First list contains 1 additional elements.
First extra element 0:
{'id': 'call_a', 'name': 'lookup', 'arguments': {'key': nan}}

- [{'arguments': {'key': nan}, 'id': 'call_a', 'name': 'lookup'}]
+ []

----------------------------------------------------------------------
Ran 14 tests in 0.011s

FAILED (failures=22, errors=5)

````

## acceptance-final/report.json

SHA-256 `16f418d59166b2e3eb59bb8e44a2bde6eb009490066856ea39a08c6f5b5e8f19`.

````text
{
  "cases": [
    {
      "deferred_native": "Recheck selected final binary with Tools/context_gates.py.",
      "id": "C01",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Real planner against frozen allocation fields, repeated per tier.",
      "proxy_suites": [
        "swift_policy"
      ]
    },
    {
      "deferred_native": "Final candidate configurable-context and planner-gates checks; no synthetic device may allocate.",
      "id": "C02",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Real cap/target/MTP/vision/retention planning matrix with synthetic device values.",
      "proxy_suites": [
        "swift_policy"
      ]
    },
    {
      "deferred_native": "Recheck final candidate solver and forced-mode boundaries.",
      "id": "C03",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Actual discrete solver maximum and next-token refusal.",
      "proxy_suites": [
        "swift_policy"
      ]
    },
    {
      "deferred_native": "Real prefix/checkpoint/image/MTP ownership and retained capacity runs.",
      "id": "C04",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Stepped byte geometry, retained reservation, replacement growth and interleaved evidence validation.",
      "proxy_suites": [
        "swift_policy",
        "context_qualification_checks"
      ]
    },
    {
      "deferred_native": "Full governor shrink/grow/pressure/recovery resource drill.",
      "id": "C05",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Actual governor policy with injected availability and owned-byte inputs.",
      "proxy_suites": [
        "swift_policy"
      ]
    },
    {
      "deferred_native": "Native dispatch observations must agree with geometry and resource limits.",
      "id": "C06",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Actual padded query/key geometry through model limit, arbitrary prefixes and tails; unknown costs stay unknown.",
      "proxy_suites": [
        "swift_policy",
        "context_qualification_checks"
      ]
    },
    {
      "deferred_native": "Sub-256 tensor parity, repeatability, rollback and prefix extension against the frozen numerical control; proxies cannot prove numerical parity.",
      "id": "C07",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Rejects wrong arithmetic epoch, missing padded geometry and unbounded products in evidence.",
      "proxy_suites": [
        "context_qualification_checks"
      ]
    },
    {
      "deferred_native": "Actual CLI invalid-input pre-load refusal and complete diagnostics on final candidate.",
      "id": "C08",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Overflow/count/token validation and fail-closed qualification evidence.",
      "proxy_suites": [
        "swift_policy",
        "context_contracts_test",
        "context_qualification_checks"
      ]
    },
    {
      "deferred_native": "Full SwiftPM external consumer plus direct Engine and mutable legacy-cap guards.",
      "id": "C09",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Real public policy APIs compile; consumer gate cannot accept failed compilation.",
      "proxy_suites": [
        "swift_policy",
        "consumer_smoke_test"
      ]
    },
    {
      "deferred_native": "Actual final templating and image expansion at cap-minus-one/exact-cap/cap-plus-one; each dialect's zero-room rule.",
      "id": "C10",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Reply/draft bounds and strict observed token counts.",
      "proxy_suites": [
        "swift_policy",
        "context_contracts_test"
      ]
    },
    {
      "deferred_native": "Actual Hermes/OpenAI bounded request overrides, concurrent isolation and Ollama/gateway compatibility.",
      "id": "C11",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Successful-response and failed-tool delivery predicates; no claim of server request-override coverage.",
      "proxy_suites": [
        "api_generation_test",
        "context_contracts_test"
      ]
    },
    {
      "deferred_native": "Actual doctor/show/models/gateway discovery after resize and lazy vision loading; text-only expanded limit.",
      "id": "C12",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Real planner policy JSON and metadata-concurrency acceptance predicates.",
      "proxy_suites": [
        "swift_policy",
        "api_generation_test"
      ]
    },
    {
      "deferred_native": "Final serving integration and one bounded live injected interruption.",
      "id": "C13",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Actual fake-clock deadline/estimate/queue/preparation/cancellation controller.",
      "proxy_suites": [
        "swift_policy"
      ]
    },
    {
      "deferred_native": "Verify guards at actual image, prefill, decode and no-elastic dispatch boundaries.",
      "id": "C14",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Actual controller with missing/insufficient memory, injected pressure, zero wait and shared preparation reservations.",
      "proxy_suites": [
        "swift_policy"
      ]
    },
    {
      "deferred_native": "Join real readers/GPU work, release pins/cache, restore allocator limits and complete a fresh request.",
      "id": "C15",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Request reservation lifetime, sticky failure, fresh controller recovery and owned-process cleanup.",
      "proxy_suites": [
        "swift_policy",
        "process_cleanup_checks"
      ]
    },
    {
      "deferred_native": "Actual HTTP/SSE/NDJSON handlers before/after headers across all dialects, disconnect and backpressure.",
      "id": "C16",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Real acceptance scripts against successful/malformed/failed fake transports.",
      "proxy_suites": [
        "api_generation_test",
        "e2e_release_test"
      ]
    },
    {
      "deferred_native": "Engine terminal contract and real clients; receiving-side db.md/Rust authority remains Sevra H2/F2 ownership.",
      "id": "C17",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Strict consumer keeps malformed, failed, incomplete and duplicate-terminal tool turns inert.",
      "proxy_suites": [
        "context_contracts_test"
      ]
    },
    {
      "deferred_native": "Frozen increasing cold capacity ladder with full prompt/reply delivery, sampled physical memory/RSS/MLX/VM evidence.",
      "id": "C18",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Evidence and campaign executors reject partial work, invalid tokens, swapped observations and missing profiles.",
      "proxy_suites": [
        "context_qualification_checks",
        "context_contracts_test",
        "context_acceptance_test"
      ]
    },
    {
      "deferred_native": "All cold/retained/minimum/transition profiles; expanded text only, MTP and vision remain at their qualified limits.",
      "id": "C19",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Retained interleaving and mode-specific evidence validation; profile order and minimum dependencies.",
      "proxy_suites": [
        "context_qualification_checks",
        "vision_capacity_gate_test",
        "context_acceptance_test"
      ]
    },
    {
      "deferred_native": "One actual model process with injected interruption and successful short recovery, real headroom and no memory hog.",
      "id": "C20",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Injected controller interruption and bounded child cleanup without real pressure.",
      "proxy_suites": [
        "swift_policy",
        "process_cleanup_checks"
      ]
    },
    {
      "deferred_native": "Existing complete static/planner/sampler/catalogue/prefix/MTP/vision/HTTP suites, brain claims and generated docs on final identified candidate.",
      "id": "C21",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Identified test source, executable acceptance predicates and handoff integrity.",
      "proxy_suites": [
        "build_identity_test",
        "e2e_release_test",
        "context_acceptance_test"
      ]
    },
    {
      "deferred_native": "Real external Swift consumer, Hermes/Ollama/gateway at existing windows, final CI release/install/version/hash and prior-install rollback.",
      "id": "C22",
      "native_status": "deferred_by_user",
      "proxy_passed": true,
      "proxy_scope": "Consumer compiler and installed-response fixtures; stale candidate binding refusal.",
      "proxy_suites": [
        "consumer_smoke_test",
        "e2e_release_test",
        "context_acceptance_test"
      ]
    }
  ],
  "hardware_qualified": false,
  "kind": "context-software-proxy",
  "model_loaded": false,
  "passed": true,
  "release_qualified": false,
  "source_sha256": {
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
    "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
    "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412"
  },
  "suites": [
    {
      "exit_code": 0,
      "name": "context_contracts_test",
      "passed": true,
      "tests": 6
    },
    {
      "exit_code": 0,
      "name": "context_qualification_checks",
      "passed": true,
      "tests": 9
    },
    {
      "exit_code": 0,
      "name": "context_acceptance_test",
      "passed": true,
      "tests": 11
    },
    {
      "exit_code": 0,
      "name": "api_generation_test",
      "passed": true,
      "tests": 9
    },
    {
      "exit_code": 0,
      "name": "e2e_release_test",
      "passed": true,
      "tests": 28
    },
    {
      "exit_code": 0,
      "name": "consumer_smoke_test",
      "passed": true,
      "tests": 4
    },
    {
      "exit_code": 0,
      "name": "vision_capacity_gate_test",
      "passed": true,
      "tests": 5
    },
    {
      "exit_code": 0,
      "name": "process_cleanup_checks",
      "passed": true,
      "tests": 3
    },
    {
      "exit_code": 0,
      "name": "build_identity_test",
      "passed": true,
      "tests": 4
    },
    {
      "contracts": {
        "assertions": 964167,
        "failures": [],
        "gates": {
          "C01": 12,
          "C02": 4152,
          "C03": 7,
          "C04": 1221,
          "C05": 77,
          "C06": 958624,
          "C08": 5,
          "C09": 9,
          "C10": 19,
          "C13": 13,
          "C14": 12,
          "C15": 16
        },
        "hardware_qualified": false,
        "model_loaded": false,
        "passed": true
      },
      "failures": [],
      "name": "swift_policy",
      "passed": true
    }
  ]
}

````

## handoff-smoke/portable-check.json

SHA-256 `7bdb951c01fceae53785a5d61c546d00ee0e07ea43617e4241cf7a469c9eb073`.

````text
{
  "portable_source_matches": true,
  "captured_files": 337,
  "build_source_files": 149,
  "model_loaded": false
}

````

## final context_contracts_test/stdout.txt

````text

````

## final context_contracts_test/stderr.txt

````text
test_counts_must_be_integer_observations (context_contracts_test.ExactCapacityObservations) ... ok
test_mlx_observation_is_required_but_does_not_replace_physical_memory (context_contracts_test.ExactCapacityObservations) ... ok
test_token_values_and_types_must_be_observed (context_contracts_test.ExactCapacityObservations) ... ok
test_complete_turn_delivers (context_contracts_test.StrictToolConsumer) ... ok
test_malformed_or_incomplete_turns_never_deliver_or_throw (context_contracts_test.StrictToolConsumer) ... ok
test_non_json_numbers_are_inert (context_contracts_test.StrictToolConsumer) ... ok

----------------------------------------------------------------------
Ran 6 tests in 0.000s

OK

````

## final context_qualification_checks/stdout.txt

````text
{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}

````

## final context_qualification_checks/stderr.txt

````text
test_busy_verification_lock_preserves_failure_without_launch (context_qualification_checks.CapacityEvidence) ... ok
test_complete_delivery (context_qualification_checks.CapacityEvidence) ... ok
test_failed_first_rung_never_launches_the_next (context_qualification_checks.CapacityEvidence) ... ok
test_failed_verification_preflight_retains_failure_without_launch (context_qualification_checks.CapacityEvidence) ... ok
test_full_verification_holds_and_releases_the_model_lock (context_qualification_checks.CapacityEvidence) ... ok
test_incomplete_or_forged_observations_are_rejected (context_qualification_checks.CapacityEvidence) ... ok
test_padding_is_inside_product_bound (context_qualification_checks.CapacityEvidence) ... ok
test_retained_capacity_requires_complete_interleaved_ownership (context_qualification_checks.CapacityEvidence) ... ok
test_swap_and_missing_memory_observations_fail (context_qualification_checks.CapacityEvidence) ... ok

----------------------------------------------------------------------
Ran 9 tests in 0.026s

OK

````

## final context_acceptance_test/stdout.txt

````text

````

## final context_acceptance_test/stderr.txt

````text
test_all_cases_profiles_and_original_retention_loads_present (context_acceptance_test.CampaignContracts) ... ok
test_bind_reads_only_plan_metadata_and_prices_real_retention_mode (context_acceptance_test.CampaignContracts) ... ok
test_capacity_success_does_not_certify_release_or_implementation_limit (context_acceptance_test.CampaignContracts) ... ok
test_changed_source_or_candidate_fails_before_plan_only (context_acceptance_test.CampaignContracts) ... ok
test_missing_or_reordered_profile_and_changed_retention_are_rejected (context_acceptance_test.CampaignContracts) ... ok
test_native_execution_is_explicit_and_never_a_proxy_fallback (context_acceptance_test.CampaignContracts) ... ok
test_pressure_unknown_or_non_normal_refuses_before_memory_preflight (context_acceptance_test.CampaignContracts) ... ok
test_proxy_identity_includes_transitive_driver_and_real_shell_dependencies (context_acceptance_test.CampaignContracts) ... ok
test_resource_failure_prevents_capacity_and_first_capacity_failure_stops_ladder (context_acceptance_test.CampaignContracts) ... ok
test_first_resource_failure_stops_next_child (context_acceptance_test.ResourceContracts) ... ok
test_success_requires_real_receipt_fields (context_acceptance_test.ResourceContracts) ... ok

----------------------------------------------------------------------
Ran 11 tests in 0.056s

OK

````

## final api_generation_test/stdout.txt

````text

````

## final api_generation_test/stderr.txt

````text
test_complete_generations_preserve_all_text_predicates (api_generation_test.ActualAPITextPredicates) ... ok
test_error_text_cannot_certify_generation (api_generation_test.ActualAPITextPredicates) ... ok
test_failed_producer_cannot_certify_plausible_content (api_generation_test.ActualAPITextPredicates) ... ok
test_idle_or_failed_generation_cannot_pass_concurrency (api_generation_test.ActualMetadataConcurrencyPredicate) ... ok
test_metadata_is_measured_during_successful_generation (api_generation_test.ActualMetadataConcurrencyPredicate) ... ok
test_complete_streams_keep_both_real_python_predicates (api_generation_test.ActualPythonStreamPredicates) ... ok
test_plausible_text_and_counts_cannot_hide_failed_streams (api_generation_test.ActualPythonStreamPredicates) ... ok
test_complete_shapes_and_scalar_types (api_generation_test.CompletionContracts) ... ok
test_stream_requires_one_successful_final_terminal (api_generation_test.CompletionContracts) ... ok

----------------------------------------------------------------------
Ran 9 tests in 8.853s

OK

````

## final e2e_release_test/stdout.txt

````text

````

## final e2e_release_test/stderr.txt

````text
test_complete_responses_pass (e2e_release_test.InstalledReleaseGate) ... ok
test_completed_counts_with_error_are_not_concurrency_success (e2e_release_test.InstalledReleaseGate) ... ok
test_doctor_refusal_still_requires_exit_two (e2e_release_test.InstalledReleaseGate) ... ok
test_error_finish_does_not_honor_stop (e2e_release_test.InstalledReleaseGate) ... ok
test_failed_empty_response_does_not_honor_stop (e2e_release_test.InstalledReleaseGate) ... ok
test_failed_version_command_cannot_match_server (e2e_release_test.InstalledReleaseGate) ... ok
test_frame_after_terminal_is_not_stream_success (e2e_release_test.InstalledReleaseGate) ... ok
test_identical_text_before_eof_is_not_stream_success (e2e_release_test.InstalledReleaseGate) ... ok
test_identical_text_before_error_is_not_stream_success (e2e_release_test.InstalledReleaseGate) ... ok
test_incomplete_response_does_not_honor_stop (e2e_release_test.InstalledReleaseGate) ... ok
test_matching_empty_failed_responses_are_not_parity (e2e_release_test.InstalledReleaseGate) ... ok
test_matching_short_text_with_failed_curl_does_not_pass (e2e_release_test.InstalledReleaseGate) ... ok
test_message_field_in_error_is_not_sampling_success (e2e_release_test.InstalledReleaseGate) ... ok
test_missing_colocated_metallib_fails (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_boolean_output_count_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_error_field_with_content_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_error_finish_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_matching_content_with_failed_curl_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_matching_content_with_http_error_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_missing_usage_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_null_finish_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_tool_proposal_is_not_the_requested_text_completion (e2e_release_test.InstalledReleaseGate) ... ok
test_openai_zero_output_tokens_is_not_success (e2e_release_test.InstalledReleaseGate) ... ok
test_quoted_installed_binary_path_passes (e2e_release_test.InstalledReleaseGate) ... ok
test_repeated_terminal_is_not_stream_success (e2e_release_test.InstalledReleaseGate) ... ok
test_retention_hit_with_failed_delivery_does_not_pass (e2e_release_test.InstalledReleaseGate) ... ok
test_valid_stop_text_with_failed_curl_does_not_pass (e2e_release_test.InstalledReleaseGate) ... ok
test_zero_generated_tokens_do_not_honor_stop (e2e_release_test.InstalledReleaseGate) ... ok

----------------------------------------------------------------------
Ran 28 tests in 42.877s

OK

````

## final consumer_smoke_test/stdout.txt

````text

````

## final consumer_smoke_test/stderr.txt

````text
test_deprecated_public_api_remains_a_failure (consumer_smoke_test.ConsumerBuildStatus) ... ok
test_failed_build_cannot_pass_via_a_leftover_executable (consumer_smoke_test.ConsumerBuildStatus) ... ok
test_invalid_concurrency_refuses_before_compiler (consumer_smoke_test.ConsumerBuildStatus) ... ok
test_successful_build_runs_consumer_with_explicit_serial_concurrency (consumer_smoke_test.ConsumerBuildStatus) ... ok

----------------------------------------------------------------------
Ran 4 tests in 0.921s

OK

````

## final vision_capacity_gate_test/stdout.txt

````text

````

## final vision_capacity_gate_test/stderr.txt

````text
test_contract_must_be_fixed_explicit_and_single_arm (vision_capacity_gate_test.CapacityGateTests) ... ok
test_five_clean_cells_suffice_without_promoting_excluded_rows (vision_capacity_gate_test.CapacityGateTests) ... ok
test_fixed_count_duplicate_and_stopped_study_are_not_successes (vision_capacity_gate_test.CapacityGateTests) ... ok
test_valid_flag_does_not_replace_resource_or_mechanism_evidence (vision_capacity_gate_test.CapacityGateTests) ... ok
test_wrong_output_cannot_be_excluded_to_make_remaining_cells_pass (vision_capacity_gate_test.CapacityGateTests) ... ok

----------------------------------------------------------------------
Ran 5 tests in 0.002s

OK

````

## final process_cleanup_checks/stdout.txt

````text

````

## final process_cleanup_checks/stderr.txt

````text
test_failed_or_timed_out_enumeration_still_drains_root_and_reports_limit (process_cleanup_checks.ProcessCleanupChecks) ... ok
test_normal_completion_does_not_run_cleanup_or_change_result (process_cleanup_checks.ProcessCleanupChecks) ... ok
test_timeout_drains_separate_session_but_preserves_unrelated_sibling (process_cleanup_checks.ProcessCleanupChecks) ... ok

----------------------------------------------------------------------
Ran 3 tests in 3.164s

OK

````

## final build_identity_test/stdout.txt

````text

````

## final build_identity_test/stderr.txt

````text
test_archive_reconstructs_native_and_swift_inputs (build_identity_test.IdentityTests) ... ok
test_changed_added_deleted_native_source_refuses_and_invalidates_receipt (build_identity_test.IdentityTests) ... ok
test_mutation_during_archive_never_publishes_identity (build_identity_test.IdentityTests) ... ok
test_unarchived_symlink_dependency_refuses (build_identity_test.IdentityTests) ... ok

----------------------------------------------------------------------
Ran 4 tests in 0.036s

OK

````

