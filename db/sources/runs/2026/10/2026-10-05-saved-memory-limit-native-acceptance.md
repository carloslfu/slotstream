---
type: run
created: 2026-10-05T05:56:57.776484+00:00
updated: 2026-10-05T05:58:27.759307+00:00
summary: Complete native acceptance and direct visual review of exact saved ceilings, plus completed compiler-mode Engine acceptance
binary: Mac CI at 6b4bc8f14d57cf414ebeec9cd1261d34a6e9f625 and Engine CI at 939ea6ea17880bac52a969761aa91f3ce11396a7
captured_at: 2026-10-05
command: gh run view 37267315310 --json status,conclusion,headSha,jobs,url; gh run view 37263860255 --json status,conclusion,headSha,jobs,url; gh api repos/carloslfu/slotstream/actions/artifacts/11327517493/zip; gh api repos/carloslfu/slotstream/actions/jobs/111626746672/logs --allow-escape-sequences; view_image on the six files in render-files.json
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Exact saved memory limit native acceptance
tool: Native CI receipts and exact saved-ceiling visual review
---

The complete Mac workflow passes at the precision correction commit: Xcode builds the actual app, and the scripted checks cover exact saved-limit text, locale conversion, persistence, unchanged configuration after re-commit and response formatting. All three appearances pass the native rendering checks. The six changed scenes were then inspected directly: the Settings field displays the saved 9.99 GB value, and response details show the full 48.125 GB ceiling beside the approximate 14.5 GB current budget. The response text wraps cleanly without clipping or overlap. System follows the runner's light appearance.

These screenshots use synthetic status and hardware fixtures on hosted macos-26 CI. Their displayed capacities are not measurements on physical Macs; the development-machine link records the capture and inspection workspace. The pinned archive hash matches GitHub's artifact digest. Only the six inspected PNGs were extracted. The complete CI receipts and exact raw passing lines follow; the full local log and every extracted image are identified by size and digest.

The preceding compiler-mode Engine change also now passes its complete workflow, including release safety gates, the diagnostic catalogue, coverage and external library consumer. This closes its earlier pending native validation. It does not establish candidate model quality or throughput. The frozen quality continuation remains active and unanalyzed. No additional local model execution, standalone export, alternative registry admission or default promotion occurred.

## acceptance.json

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/acceptance.json`; bytes: 1365; SHA-256: `1a064ed208a164efc807ab394e6eee344d83519c6bccbeb3192c6b81edf08e64`.

```json
{
  "schema": 1,
  "precision_commit": "6b4bc8f14d57cf414ebeec9cd1261d34a6e9f625",
  "engine_evidence_commit": "939ea6ea17880bac52a969761aa91f3ce11396a7",
  "mac_workflow": "https://github.com/carloslfu/slotstream/actions/runs/37267315310",
  "engine_workflow": "https://github.com/carloslfu/slotstream/actions/runs/37263860255",
  "artifact_id": 11327517493,
  "artifact_name": "sevra-mac-ui-snapshots",
  "artifact_bytes": 14682027,
  "artifact_sha256": "f6fe98cf354921e00b7ecf260cc6fa71a7ed1f9aefc793883e0778b198ecbb5e",
  "extracted_bytes": 798553,
  "checks_log": {
    "path": ".build/quantization-research/saved-memory-limit-precision-v1/precision-checks.log",
    "bytes": 242493,
    "sha256": "da3e1fba2108596de7205bfa7fab07cb53a11f6485aec07c7e39299a82eb1200"
  },
  "direct_visual_inspection": {
    "appearances": [
      "light",
      "dark",
      "system"
    ],
    "saved_fractional_ceiling_visible": true,
    "response_fractional_ceiling_visible": true,
    "observed_clipping": false,
    "observed_control_overlap": false,
    "system_fixture_appearance": "light"
  },
  "scope": "Synthetic offscreen Mac fixtures on hosted CI; inspection on the development Mac. These are not physical RAM or model-performance measurements.",
  "local_model_execution_added": false,
  "quality_analysis_performed": false,
  "alternate_pack_promoted": false
}

```

## native-checks-excerpt.txt

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/native-checks-excerpt.txt`; bytes: 1213; SHA-256: `76e782963b705029fddeebd2367ffe6d3269b1ceca35ec422bea9e38c21a0dea`.

```text
2026-10-05T05:51:56.1067730Z PASS: light-saved-fractional, rendered controls, current budget, supported range and pending state
2026-10-05T05:51:56.1154950Z PASS: light-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T05:51:56.1157450Z PASS: dark-saved-fractional, rendered controls, current budget, supported range and pending state
2026-10-05T05:51:56.1197410Z PASS: dark-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T05:51:56.1200350Z PASS: system-saved-fractional, rendered controls, current budget, supported range and pending state
2026-10-05T05:51:56.1210650Z PASS: system-response-budget, reduced budget and saved ceiling remain readable
2026-10-05T05:53:24.2474570Z PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
2026-10-05T05:53:24.2485930Z PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows
2026-10-05T05:53:29.8102820Z PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy

```

## render-files.json

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/render-files.json`; bytes: 1437; SHA-256: `a37aed2751c9e69567f7365dc233ab27cb27c5b0d6cfe645d4d5ced427538377`.

```json
[
  {
    "path": ".build/quantization-research/saved-memory-limit-precision-v1/inspected/sevra-memory-ui/light-saved-fractional.png",
    "bytes": 250983,
    "sha256": "35acf93b65eea5983c9f664fbeaeb2741f267a12e29fe5f3ac0d798ecab1b5fa"
  },
  {
    "path": ".build/quantization-research/saved-memory-limit-precision-v1/inspected/sevra-memory-ui/light-response-budget.png",
    "bytes": 12636,
    "sha256": "e3f37d76a154b8e9b976810c9a303d4f03449e8258c244df7fc9fb97f1c8f5e4"
  },
  {
    "path": ".build/quantization-research/saved-memory-limit-precision-v1/inspected/sevra-memory-ui/dark-saved-fractional.png",
    "bytes": 258361,
    "sha256": "26b6f397f14fa901d0b6d13ed19b7a44c960415d28263b251b50f155529f261d"
  },
  {
    "path": ".build/quantization-research/saved-memory-limit-precision-v1/inspected/sevra-memory-ui/dark-response-budget.png",
    "bytes": 12954,
    "sha256": "30f40962372327aab529801979f5f72eae500a7a06693b3f6418f8aaaebf16ad"
  },
  {
    "path": ".build/quantization-research/saved-memory-limit-precision-v1/inspected/sevra-memory-ui/system-saved-fractional.png",
    "bytes": 250983,
    "sha256": "35acf93b65eea5983c9f664fbeaeb2741f267a12e29fe5f3ac0d798ecab1b5fa"
  },
  {
    "path": ".build/quantization-research/saved-memory-limit-precision-v1/inspected/sevra-memory-ui/system-response-budget.png",
    "bytes": 12636,
    "sha256": "e3f37d76a154b8e9b976810c9a303d4f03449e8258c244df7fc9fb97f1c8f5e4"
  }
]

```

## build-evidence-engine-complete.json

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/build-evidence-engine-complete.json`; bytes: 6089; SHA-256: `d5125641b51b600d76329c6fbc5775fba7681e987949b2ae1c473b9c39243b9f`.

```json
{"conclusion":"success","headSha":"939ea6ea17880bac52a969761aa91f3ce11396a7","jobs":[{"completedAt":"2026-10-05T04:47:36Z","conclusion":"success","databaseId":111616446476,"name":"public-library","startedAt":"2026-10-05T04:41:31Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:41:33Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:41:31Z","status":"completed"},{"completedAt":"2026-10-05T04:41:51Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:41:33Z","status":"completed"},{"completedAt":"2026-10-05T04:41:51Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:41:51Z","status":"completed"},{"completedAt":"2026-10-05T04:47:31Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T04:41:51Z","status":"completed"},{"completedAt":"2026-10-05T04:47:33Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T04:47:31Z","status":"completed"},{"completedAt":"2026-10-05T04:47:34Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T04:47:33Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263860255/job/111616446476"},{"completedAt":"2026-10-05T05:27:32Z","conclusion":"success","databaseId":111616446641,"name":"weights-free","startedAt":"2026-10-05T04:44:59Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:45:01Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:45:00Z","status":"completed"},{"completedAt":"2026-10-05T04:45:24Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:45:01Z","status":"completed"},{"completedAt":"2026-10-05T04:46:27Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T04:45:24Z","status":"completed"},{"completedAt":"2026-10-05T04:46:27Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T04:46:27Z","status":"completed"},{"completedAt":"2026-10-05T04:46:30Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T04:46:27Z","status":"completed"},{"completedAt":"2026-10-05T05:05:21Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T04:46:30Z","status":"completed"},{"completedAt":"2026-10-05T05:05:27Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T05:05:21Z","status":"completed"},{"completedAt":"2026-10-05T05:05:31Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T05:05:27Z","status":"completed"},{"completedAt":"2026-10-05T05:07:07Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T05:05:31Z","status":"completed"},{"completedAt":"2026-10-05T05:07:08Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T05:07:07Z","status":"completed"},{"completedAt":"2026-10-05T05:25:50Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T05:07:08Z","status":"completed"},{"completedAt":"2026-10-05T05:26:12Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T05:25:50Z","status":"completed"},{"completedAt":"2026-10-05T05:27:24Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T05:26:12Z","status":"completed"},{"completedAt":"2026-10-05T05:27:26Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T05:27:24Z","status":"completed"},{"completedAt":"2026-10-05T05:27:27Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T05:27:26Z","status":"completed"},{"completedAt":"2026-10-05T05:27:30Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T05:27:27Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263860255/job/111616446641"},{"completedAt":"2026-10-05T04:58:23Z","conclusion":"success","databaseId":111616446645,"name":"coverage","startedAt":"2026-10-05T04:44:01Z","status":"completed","steps":[{"completedAt":"2026-10-05T04:44:03Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T04:44:01Z","status":"completed"},{"completedAt":"2026-10-05T04:44:34Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T04:44:03Z","status":"completed"},{"completedAt":"2026-10-05T04:44:34Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T04:44:34Z","status":"completed"},{"completedAt":"2026-10-05T04:44:37Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T04:44:34Z","status":"completed"},{"completedAt":"2026-10-05T04:58:13Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T04:44:37Z","status":"completed"},{"completedAt":"2026-10-05T04:58:14Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T04:58:13Z","status":"completed"},{"completedAt":"2026-10-05T04:58:16Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T04:58:14Z","status":"completed"},{"completedAt":"2026-10-05T04:58:17Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T04:58:16Z","status":"completed"},{"completedAt":"2026-10-05T04:58:21Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T04:58:17Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37263860255/job/111616446645"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37263860255"}

```

## precision-mac-complete.json

Local evidence: `.build/quantization-research/saved-memory-limit-precision-v1/precision-mac-complete.json`; bytes: 3130; SHA-256: `da970498b4b46aebec3078b8ce20b01b98b4b2353c72335adcaf017ea7fc14e9`.

```json
{"conclusion":"success","headSha":"6b4bc8f14d57cf414ebeec9cd1261d34a6e9f625","jobs":[{"completedAt":"2026-10-05T05:30:08Z","conclusion":"success","databaseId":111626746521,"name":"xcode","startedAt":"2026-10-05T05:20:15Z","status":"completed","steps":[{"completedAt":"2026-10-05T05:20:16Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T05:20:15Z","status":"completed"},{"completedAt":"2026-10-05T05:20:53Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T05:20:16Z","status":"completed"},{"completedAt":"2026-10-05T05:20:53Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T05:20:53Z","status":"completed"},{"completedAt":"2026-10-05T05:20:56Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T05:20:53Z","status":"completed"},{"completedAt":"2026-10-05T05:30:03Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T05:20:56Z","status":"completed"},{"completedAt":"2026-10-05T05:30:04Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T05:30:03Z","status":"completed"},{"completedAt":"2026-10-05T05:30:06Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T05:30:04Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37267315310/job/111626746521"},{"completedAt":"2026-10-05T05:53:36Z","conclusion":"success","databaseId":111626746672,"name":"checks","startedAt":"2026-10-05T05:20:18Z","status":"completed","steps":[{"completedAt":"2026-10-05T05:20:20Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T05:20:19Z","status":"completed"},{"completedAt":"2026-10-05T05:20:43Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T05:20:20Z","status":"completed"},{"completedAt":"2026-10-05T05:20:43Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T05:20:43Z","status":"completed"},{"completedAt":"2026-10-05T05:20:44Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T05:20:43Z","status":"completed"},{"completedAt":"2026-10-05T05:53:29Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T05:20:44Z","status":"completed"},{"completedAt":"2026-10-05T05:53:32Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T05:53:29Z","status":"completed"},{"completedAt":"2026-10-05T05:53:33Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T05:53:32Z","status":"completed"},{"completedAt":"2026-10-05T05:53:34Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T05:53:33Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37267315310/job/111626746672"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37267315310"}

```
