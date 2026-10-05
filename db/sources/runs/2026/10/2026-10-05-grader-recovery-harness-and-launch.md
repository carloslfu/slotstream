---
type: "run"
created: "2026-10-05T07:52:08.303251+00:00"
updated: "2026-10-05T07:52:08.303251+00:00"
title: "Grader recovery launch and static harness fixture correction"
summary: "Recovery continues without answer replacement; static harness registration fixed and future attempt marker sync hardened"
tool: "Exact CI job logs, static harness fixtures and grading-attempt refusal tests"
command: "gh api repos/carloslfu/slotstream/actions/jobs/111663172763/logs --allow-escape-sequences; Python 3.9 and 3.12 Tools/static_gates_binary_test.py and Tools/quantization_grader_continuation_test.py; filtered live coordinator metadata"
binary: "CI source 0d802d53e18827f22d1ddaec66a685abb2708fb0; unchanged frozen local quality image"
machines: "[[records/machines/macbook-pro-m5-pro-48gb]]"
captured_at: "2026-10-05"
discarded: false
---

The frozen recovery started after actual memory and storage admission. Its original completed prefix was imported, and the one saved answer received its first grade without another native generation. The filtered snapshot below contains completion, cost custody and failure status only. No partial pass/fail outcome or aggregate was inspected. The study remains incomplete; final quality analysis is still prohibited.

The main CI weights-free job then failed before building native code because its isolated fixture tree did not contain the two new test suites. The real static script had invoked them outside the shared suite sequence. Registering both in that sequence and in its corresponding fixture list restores the complete order check. All thirty-four entry-point checks pass under each local Python runtime. This is harness integration evidence; the next complete native CI remains pending. The failure does not affect the running study, whose helpers are frozen separately.

Review also found that the initial exclusive grading-attempt marker was closed before the worker, but was not explicitly synchronized. The current source now synchronizes that file and its directory before invoking any worker. Injected failure at either sync preserves an incomplete marker and prevents grading or a replacement attempt. All seven recovery unit groups pass on both local runtimes. This follow-up changes future owner code only. The currently running frozen owner remains unchanged, its already completed recovery receipt is preserved, and no process interruption or power-loss experiment was performed. The earlier preparation's use of “durably” should not be read as evidence of power-loss qualification.

The complete CI log is retained locally at `.build/quantization-research/heldout-grader-recovery-v1/ci-entrypoints-failure.log`; its exact first failure and summary are captured below. Public quality, performance, pack admission and release gates remain open.

## ci-entrypoints-failure-excerpt.txt

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/ci-entrypoints-failure-excerpt.txt`; bytes: 1220; SHA-256: `6af310205385e40b6d38d09a05dab0de22f0b06ef5da34aa38fbba7ad10aaef5`.

```text
2026-10-05T07:43:28.1128350Z FAIL: test_campaign_failure_stops_before_native_checks (__main__.StaticBinarySelection.test_campaign_failure_stops_before_native_checks)
2026-10-05T07:43:28.1130240Z ----------------------------------------------------------------------
2026-10-05T07:43:28.1132520Z Traceback (most recent call last):
2026-10-05T07:43:28.1135440Z   File "/Users/runner/work/slotstream/slotstream/Tools/static_gates_binary_test.py", line 258, in test_campaign_failure_stops_before_native_checks
2026-10-05T07:43:28.1137250Z     self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
2026-10-05T07:43:28.1138340Z     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
2026-10-05T07:43:28.1141720Z AssertionError: 2 != 23 : /opt/homebrew/Cellar/python@3.14/3.14.7/Frameworks/Python.framework/Versions/3.14/Resources/Python.app/Contents/MacOS/Python: can't open file '/private/var/folders/36/tjdph2t965j8snz9_vkdnw0r0000gn/T/slotstream-static-selection-z_gznkg6/Tools/quantization_grader_source_audit_test.py': [Errno 2] No such file or directory
2026-10-05T07:43:28.1145380Z 
2026-10-05T07:43:28.1145390Z 
2026-10-05T07:43:28.1324530Z Ran 34 tests in 20.604s
2026-10-05T07:43:28.1324690Z FAILED (failures=17)

```

## entrypoints-python39-corrected.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/entrypoints-python39-corrected.log`; bytes: 134; SHA-256: `6a607b198714fba686d3df0fa7ca1bd383273d536935bf1b54a65e0e878065ee`.

```text
..................................
----------------------------------------------------------------------
Ran 34 tests in 39.163s

OK

```

## entrypoints-python312-corrected.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/entrypoints-python312-corrected.log`; bytes: 134; SHA-256: `63d832d26fb3b18c9d122082ea41ae7bfef4271e978878ecf75cd082cfee4472`.

```text
..................................
----------------------------------------------------------------------
Ran 34 tests in 42.099s

OK

```

## attempt-sync-python39.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/attempt-sync-python39.log`; bytes: 1145; SHA-256: `6193cf780bb60115125585e9bae28b5f4872aa8e2d0cb1800e8fbf64c726a5d6`.

```text
{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
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
Ran 7 tests in 0.313s

OK

```

## attempt-sync-python312.log

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/attempt-sync-python312.log`; bytes: 1145; SHA-256: `3a3b8ccb678cd0fb68813145ad9b05d83aac026c737ff78fd68cb844916d45ff`.

```text
{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
.{"job": 0, "family": "facts", "arm": "candidate", "id": "b", "complete_task": true}
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
Ran 7 tests in 0.248s

OK

```

## launch-preflight.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/launch-preflight.json`; bytes: 2103; SHA-256: `c667113d9d2cdc231e9dccab8b20efde4d200fe4ddd68d307338e78b2edcad8e`.

```json
{
  "headroom": {
    "page_bytes": 16384,
    "reclaimable_bytes": 35473244160,
    "swapins": 20473,
    "swapouts": 156216,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   141850.\nPages active:                                 571624.\nPages inactive:                              1802247.\nPages speculative:                            103223.\nPages throttled:                                   0.\nPages wired down:                             174446.\nPages purgeable:                                7906.\n\"Translation faults\":                     3698596097.\nPages copy-on-write:                       294006167.\nPages zero filled:                       16942856544.\nPages reactivated:                         498193994.\nPages purged:                               16095305.\nFile-backed pages:                           2015359.\nAnonymous pages:                              461735.\nPages stored in compressor:                   845532.\nPages occupied by compressor:                 290286.\nDecompressions:                            156750490.\nCompressions:                              180409269.\nPageins:                                  5183006255.\nPageouts:                                    2649415.\nSwapins:                                       20473.\nSwapouts:                                     156216.\nPages tagged:                                 134768.\nPages tagged resident:                         93552.\nPages tagged compressed:                       41216.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5363.\nPages tag-storage free:                         1428.\nPages tag-storage non-tag pageable:            91505.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6119168.\nTagged compressions:                         1576535.\nTagged decompressions:                       1415773.\n"
  },
  "research_allocated_bytes": 423144124416,
  "free_disk_bytes": 313085677568
}

```

## launch-status.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/launch-status.json`; bytes: 519; SHA-256: `0caec045a9a53ac6ea02f97d80658edb2bc61f6d1518924b8e98e74d78579523`.

```json
{
  "protocol_sha256": "b56822e9a8d89d9d90ad01f67e184b90d44dc9b8301b173133a9ab3a0d129b73",
  "complete": false,
  "completed_jobs": 46,
  "active_job": 46,
  "completed_cases_in_active_job": 14,
  "active_job_failure": null,
  "coordinator_failure": null,
  "saved_answer_recovery": {
    "complete": true,
    "model_runs": 0,
    "failure": null
  },
  "recovery_receipt_sha256": "0eea9700c375deb55f6bc4659cf865b4d4e82de12b204c2646556355819a63ee",
  "partial_scores_inspected": false,
  "final_analysis_run": false
}

```

