---
type: "run"
created: "2026-10-05T08:38:51.756120+00:00"
updated: "2026-10-05T08:38:51.756120+00:00"
title: "Complete native CI for instruction grader recovery"
summary: "Corrected full Engine CI, context contracts and docs pass; resumed quality jobs complete without replacement"
tool: "Exact-commit GitHub CI and filtered quality custody receipts"
command: "gh run view 37280230064, 37280229999, 37280229996 and 37279238063 --json status,conclusion,headSha,jobs,url; gh api repos/carloslfu/slotstream/actions/jobs/111666346223/logs --allow-escape-sequences; filtered coordinator and job custody"
binary: "eacc29fe9920a1d24ceb957f4c0120fd79c34258"
machines: "[[records/machines/macbook-pro-m5-pro-48gb]]"
captured_at: "2026-10-05"
discarded: false
---

The corrected commit passes the complete Engine workflow: optimized static/runtime safety, the full native check catalogue, sampler/governor goldens, the independent public-library consumer, instrumented coverage and exact tested/archive byte comparison. Context contracts and documentation also pass at that exact commit. The preceding commit remains a failed workflow because its isolated static-harness fixtures lacked the new registrations; its final workflow receipt is preserved too.

The running quality continuation has completed the recovered paired job and the following untouched paired job. Their output counts and receipt hashes below expose no quality outcome. The recovered job retains its interrupted native session and the already journaled answer; no model answer was regenerated. The complete study remains pending and no final score has been computed. These CI results validate implementation and instrumentation, not model quality, twenty-token performance, standalone distribution or product promotion.

The full weights-free log is retained locally and identified below. The short excerpt is exact raw output from its final passing gates and archive check. No additional local model process was started for this CI capture.

Full log: `.build/quantization-research/heldout-grader-recovery-v1/ci-eacc29f-weights-free.log`; bytes: 165994; SHA-256: `9350e86a5ac24f9c8ad2aaa37ff93d250b9d15fc312775c07792fdc38d842d43`.

## ci-eacc29f-complete.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/ci-eacc29f-complete.json`; bytes: 6089; SHA-256: `d5b59c3179b1821e8ec50635d9760b38993675e134924d0274b0dfe5fab68e2d`.

```json
{"conclusion":"success","headSha":"eacc29fe9920a1d24ceb957f4c0120fd79c34258","jobs":[{"completedAt":"2026-10-05T07:58:45Z","conclusion":"success","databaseId":111666345986,"name":"public-library","startedAt":"2026-10-05T07:53:03Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:53:05Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:53:04Z","status":"completed"},{"completedAt":"2026-10-05T07:53:37Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:53:05Z","status":"completed"},{"completedAt":"2026-10-05T07:53:37Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T07:53:37Z","status":"completed"},{"completedAt":"2026-10-05T07:58:42Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T07:53:37Z","status":"completed"},{"completedAt":"2026-10-05T07:58:43Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T07:58:42Z","status":"completed"},{"completedAt":"2026-10-05T07:58:44Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T07:58:43Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37280230064/job/111666345986"},{"completedAt":"2026-10-05T08:34:19Z","conclusion":"success","databaseId":111666346223,"name":"weights-free","startedAt":"2026-10-05T07:53:04Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:53:06Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:53:05Z","status":"completed"},{"completedAt":"2026-10-05T07:53:32Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:53:06Z","status":"completed"},{"completedAt":"2026-10-05T07:54:29Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T07:53:32Z","status":"completed"},{"completedAt":"2026-10-05T07:54:29Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T07:54:29Z","status":"completed"},{"completedAt":"2026-10-05T07:54:31Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T07:54:29Z","status":"completed"},{"completedAt":"2026-10-05T08:11:31Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T07:54:31Z","status":"completed"},{"completedAt":"2026-10-05T08:11:37Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T08:11:31Z","status":"completed"},{"completedAt":"2026-10-05T08:11:41Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T08:11:37Z","status":"completed"},{"completedAt":"2026-10-05T08:13:24Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T08:11:41Z","status":"completed"},{"completedAt":"2026-10-05T08:13:25Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T08:13:24Z","status":"completed"},{"completedAt":"2026-10-05T08:32:51Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T08:13:25Z","status":"completed"},{"completedAt":"2026-10-05T08:33:07Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T08:32:51Z","status":"completed"},{"completedAt":"2026-10-05T08:34:12Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T08:33:07Z","status":"completed"},{"completedAt":"2026-10-05T08:34:14Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T08:34:12Z","status":"completed"},{"completedAt":"2026-10-05T08:34:14Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T08:34:14Z","status":"completed"},{"completedAt":"2026-10-05T08:34:17Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T08:34:14Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37280230064/job/111666346223"},{"completedAt":"2026-10-05T08:08:23Z","conclusion":"success","databaseId":111666346281,"name":"coverage","startedAt":"2026-10-05T07:53:04Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:53:05Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:53:04Z","status":"completed"},{"completedAt":"2026-10-05T07:53:22Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:53:05Z","status":"completed"},{"completedAt":"2026-10-05T07:53:22Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T07:53:22Z","status":"completed"},{"completedAt":"2026-10-05T07:53:25Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T07:53:22Z","status":"completed"},{"completedAt":"2026-10-05T08:08:14Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T07:53:25Z","status":"completed"},{"completedAt":"2026-10-05T08:08:15Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T08:08:14Z","status":"completed"},{"completedAt":"2026-10-05T08:08:18Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T08:08:15Z","status":"completed"},{"completedAt":"2026-10-05T08:08:19Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T08:08:18Z","status":"completed"},{"completedAt":"2026-10-05T08:08:21Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T08:08:19Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37280230064/job/111666346281"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37280230064"}

```

## context-eacc29f-complete.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/context-eacc29f-complete.json`; bytes: 1462; SHA-256: `35abd19b47e56cb7c0b9b41db2ba6d2a4f82867c6a7ca7c10a6b35538b62c617`.

```json
{"conclusion":"success","headSha":"eacc29fe9920a1d24ceb957f4c0120fd79c34258","jobs":[{"completedAt":"2026-10-05T07:55:10Z","conclusion":"success","databaseId":111666345774,"name":"software-contracts","startedAt":"2026-10-05T07:53:00Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:53:01Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:53:00Z","status":"completed"},{"completedAt":"2026-10-05T07:53:20Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:53:01Z","status":"completed"},{"completedAt":"2026-10-05T07:55:03Z","conclusion":"success","name":"Context source and transport proxies, without MLX or weights","number":3,"startedAt":"2026-10-05T07:53:20Z","status":"completed"},{"completedAt":"2026-10-05T07:55:04Z","conclusion":"success","name":"Context evidence and deferred native cases","number":4,"startedAt":"2026-10-05T07:55:03Z","status":"completed"},{"completedAt":"2026-10-05T07:55:06Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T07:55:04Z","status":"completed"},{"completedAt":"2026-10-05T07:55:08Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T07:55:06Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37280229999/job/111666345774"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37280229999"}

```

## docs-eacc29f-complete.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/docs-eacc29f-complete.json`; bytes: 1551; SHA-256: `9be7736f7eb778aa205fb83318e2273cb7586c6636f342d0a204a8345c572dd5`.

```json
{"conclusion":"success","headSha":"eacc29fe9920a1d24ceb957f4c0120fd79c34258","jobs":[{"completedAt":"2026-10-05T07:53:21Z","conclusion":"success","databaseId":111666345863,"name":"docs","startedAt":"2026-10-05T07:52:57Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:52:58Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:52:57Z","status":"completed"},{"completedAt":"2026-10-05T07:53:15Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:52:58Z","status":"completed"},{"completedAt":"2026-10-05T07:53:15Z","conclusion":"success","name":"llms-full.txt is regenerated from the docs","number":3,"startedAt":"2026-10-05T07:53:15Z","status":"completed"},{"completedAt":"2026-10-05T07:53:15Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T07:53:15Z","status":"completed"},{"completedAt":"2026-10-05T07:53:19Z","conclusion":"success","name":"brain gates","number":5,"startedAt":"2026-10-05T07:53:15Z","status":"completed"},{"completedAt":"2026-10-05T07:53:20Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T07:53:19Z","status":"completed"},{"completedAt":"2026-10-05T07:53:20Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T07:53:20Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37280229996/job/111666345863"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37280229996"}

```

## ci-0d802d5-complete.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/ci-0d802d5-complete.json`; bytes: 6089; SHA-256: `4e364744c6844295f6d6acb10b61a59b83d17eb6dfe3707729c846083eb23866`.

```json
{"conclusion":"failure","headSha":"0d802d53e18827f22d1ddaec66a685abb2708fb0","jobs":[{"completedAt":"2026-10-05T07:49:10Z","conclusion":"success","databaseId":111663172645,"name":"public-library","startedAt":"2026-10-05T07:42:34Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:42:36Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:42:35Z","status":"completed"},{"completedAt":"2026-10-05T07:43:03Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:42:36Z","status":"completed"},{"completedAt":"2026-10-05T07:43:03Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T07:43:03Z","status":"completed"},{"completedAt":"2026-10-05T07:49:05Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T07:43:03Z","status":"completed"},{"completedAt":"2026-10-05T07:49:06Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T07:49:05Z","status":"completed"},{"completedAt":"2026-10-05T07:49:08Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T07:49:07Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37279238063/job/111663172645"},{"completedAt":"2026-10-05T07:43:30Z","conclusion":"failure","databaseId":111663172763,"name":"weights-free","startedAt":"2026-10-05T07:42:34Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:42:36Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:42:35Z","status":"completed"},{"completedAt":"2026-10-05T07:43:06Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:42:36Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"failure","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T07:43:06Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"toolchain","number":4,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"release build","number":6,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:28Z","conclusion":"skipped","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:29Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T07:43:28Z","status":"completed"},{"completedAt":"2026-10-05T07:43:29Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T07:43:29Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37279238063/job/111663172763"},{"completedAt":"2026-10-05T07:56:59Z","conclusion":"success","databaseId":111663172907,"name":"coverage","startedAt":"2026-10-05T07:42:33Z","status":"completed","steps":[{"completedAt":"2026-10-05T07:42:34Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T07:42:34Z","status":"completed"},{"completedAt":"2026-10-05T07:43:06Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T07:42:34Z","status":"completed"},{"completedAt":"2026-10-05T07:43:07Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T07:43:06Z","status":"completed"},{"completedAt":"2026-10-05T07:43:09Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T07:43:07Z","status":"completed"},{"completedAt":"2026-10-05T07:56:53Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T07:43:09Z","status":"completed"},{"completedAt":"2026-10-05T07:56:54Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T07:56:53Z","status":"completed"},{"completedAt":"2026-10-05T07:56:55Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T07:56:54Z","status":"completed"},{"completedAt":"2026-10-05T07:56:56Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T07:56:55Z","status":"completed"},{"completedAt":"2026-10-05T07:56:57Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T07:56:56Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37279238063/job/111663172907"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37279238063"}

```

## ci-eacc29f-final-excerpt.txt

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/ci-eacc29f-final-excerpt.txt`; bytes: 382; SHA-256: `775a9c5efbaf8a9429c903b5f99b4f4c67a2558fa56378e00f175edeb1bcf235`.

```text
2026-10-05T08:32:51.2596480Z STATIC GATES PASS
2026-10-05T08:34:12.0259550Z 104 passed, 0 failed, 0 skipped (40914 assertions)
2026-10-05T08:34:13.4673910Z {"archive_sha256": "a40654222b4e1ace027e52139f6c06872cc8ed2c0c4b49eafb207d5ee90c8a68", "binary_sha256": "19babd9f34d6420faaef524052764ee79c48d2843c9b718996bbbf9fc2a77718", "source_files": 294, "source_matches_checkout": true}

```

## ci-completion-quality-status.json

Local evidence: `.build/quantization-research/heldout-grader-recovery-v1/ci-completion-quality-status.json`; bytes: 847; SHA-256: `742747c30bf857366c0c31668b8e886f46575697fe813b88175ff4b42ce12b2b`.

```json
{
  "complete": false,
  "completed_jobs": 48,
  "active_job": 48,
  "failure": null,
  "resumed_completed_jobs": [
    {
      "index": 46,
      "complete": true,
      "protocol_sha256": "b56822e9a8d89d9d90ad01f67e184b90d44dc9b8301b173133a9ab3a0d129b73",
      "receipt_sha256": "5ab5abb6b1ad79f12f782f5071886d5d7a7031bba766d3957ac727bd40b8c1d1",
      "cases": 40,
      "native_sessions_including_imported": 5,
      "failure": null
    },
    {
      "index": 47,
      "complete": true,
      "protocol_sha256": "b56822e9a8d89d9d90ad01f67e184b90d44dc9b8301b173133a9ab3a0d129b73",
      "receipt_sha256": "ed11242052f9fec1ef42e3eb870115e93cb1d4894fe13926db3c2558512ee5d8",
      "cases": 40,
      "native_sessions_including_imported": 2,
      "failure": null
    }
  ],
  "partial_scores_inspected": false,
  "final_analysis_run": false
}

```

