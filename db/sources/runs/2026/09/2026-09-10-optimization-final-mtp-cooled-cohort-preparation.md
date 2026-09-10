---
type: run
id: 01m25npcrqry8jk04bhjgf096z
created: 2026-09-10T12:46:45.015580+00:00
updated: 2026-09-10T12:46:45.384808+00:00
summary: Fresh full MTP cohort prepared with longer cooling and actual polling-overhead validation
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-10
command: Model-free run/final/thermal/schedule/delivery/startup/cooling checks and exact MTP-on protocol freeze
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fresh full MTP cohort prepared with longer cooling and actual polling-overhead validation
tool: Slotstream exact native and source qualification capture
---
A fresh complete cohort retains the same 16 interleaved pairs, 32 first and 32 measured responses, 512 outputs, 12 GB target, 18 GB startup requirement, fixed depth one, original numerical/work rules, joint-pair timing exclusions, physical/RSS/pressure/swap-out/thermal stops and complete 12,600-second work plus 60-second cleanup allowance. Only prelaunch cooling changes: the original 60-second reserved cooldown is followed by 120 sampled nominal seconds, bounded by the existing 600-second readiness limit. The completed MTP-off cohort is not repeated. Failed prior MTP-on identities remain unqualified and unpooled.

V624 passes 59 model-free checks and freezes without attempting a model. Prelaunch review then catches an overly strict evidence assertion: a real prior 121.36-second stable observation contains 60 samples because polling itself takes time. V627 preserves that unrun freeze, retains exactly the same cooled protocol, and corrects only the evidence minimum to 31 samples, derived from 120 seconds and the unchanged maximum four-second observation gap. A regression case uses the actual saved observation. All 60 model-free checks pass before the fresh freeze. Driver/helper behavior, request eligibility, performance thresholds and inference code remain unchanged. Longer cooling lowers planned duty cycle, but no claim of guaranteed future nominal state is made.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/check-execution.json",
    "bytes": 1429,
    "sha256": "53c121f02c46194f9914f9751d6c08cedcb76c7ba6b927829026bd52f779f5ac"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/cooling-checks.stderr",
    "bytes": 419,
    "sha256": "15e7b9671db55f45fc373fd3721e8440991af24481abbd3cea8ba34498998249"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/cooling-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/cooling-transformation.json",
    "bytes": 6327,
    "sha256": "1640a7b89c7782f41d60e571ed037cbbb7f6f71035f1f13db69ffcece0e0ee7f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/cooling_checks.py",
    "bytes": 3761,
    "sha256": "48230c2088c03ad34cee60e567183d99ceec484c42556941040dff199ca5a2b1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/delivery-checks.stderr",
    "bytes": 575,
    "sha256": "4f351b2bd3d1010a50888b28fe0e177bafe233e6515f1d32d2949365573e2d7e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/delivery-checks.stdout",
    "bytes": 139,
    "sha256": "54bebbd978590c6310e9141a80b5553f23fb594609a8242d6379f89f479aabe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/delivery-profile.json",
    "bytes": 14024,
    "sha256": "4525a388a211027f0197fc255b68b9e799947ad366ec4f47d476ea206e084275"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/delivery_checks.py",
    "bytes": 6022,
    "sha256": "9663417cfdfa7d02c1efb7db6dacf4978bf680c740d462426df6de2980b14200"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/driver/serve_bench.py",
    "bytes": 62137,
    "sha256": "abbea293354fe58ff60dcc33beaa76744d0c59cf9b38d7337bcee9986b73f60d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/driver-transformation.json",
    "bytes": 4193,
    "sha256": "650bc64f2ee78cbb4adda0e381cb1a6fcaffae276c25718eb8c1770d25c8aac6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/final-checks.stderr",
    "bytes": 388,
    "sha256": "a73408530cb00ccc43ef219e791b5b869ed74d7af7a6bfc6a950c234eccebf75"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/final-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/final_checks.py",
    "bytes": 2707,
    "sha256": "4dad4a6a2cd0db5d1737e1c9407348812f36c13705f612d610f792098576dea3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/freeze.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/freeze.stdout",
    "bytes": 136,
    "sha256": "f9413fa64d3fb7808971ec24c3895232985a0826773818c979f8437530ebc2b7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/on/binding.json",
    "bytes": 240462,
    "sha256": "acc07b25ddaa6562633da39195ed236d7c19ad89a16e06af952a3a8a4bec2dca"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/on/protocol.json",
    "bytes": 6901,
    "sha256": "8a03e0206506b9f96a4fe7f262c360ea1151aa615c4ef00fc5079d5579c49324"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/prepare.py",
    "bytes": 7621,
    "sha256": "3b2bcf988c039bb29be08c8fd85a176ef6d3b9d3880a5831c4ffb0dd53c8f4a6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/run-checks.stderr",
    "bytes": 119,
    "sha256": "ee7df502d6f93df1bca6b719ee63392435500bc1018bd23524926b9536eefbed"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/run-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/run.py",
    "bytes": 18649,
    "sha256": "d3bf5638496ef92467edbfc28d57c5e0928e451c4706868bc58fe186b827e286"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/run_test.py",
    "bytes": 16316,
    "sha256": "1f2b9cf5e1bef73f0159959ae5e0375f827e2e2ba66ae7cca46c82f6f35cf12a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/schedule-checks.stderr",
    "bytes": 574,
    "sha256": "aadb160ddeb8537b8c9fd02deb8e6f504f54cead0070c3efcf223cfb5b893ed2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/schedule-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/schedule-transformation.json",
    "bytes": 8787,
    "sha256": "83e88b72375fe2609b50eedd076c2cc79210bc2cac1ec058b90d913260f3a7b4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/schedule_checks.py",
    "bytes": 5713,
    "sha256": "2c983bc404d3b697deffc6f99888129ef8ab8a6762d6077db871f8bbc00bbcd8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/startup-checks.stderr",
    "bytes": 575,
    "sha256": "4654f826bac4817703cb00d6f3b44b678e6c7a4ba93d5f983617b369a0d020cd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/startup-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/startup_checks.py",
    "bytes": 4570,
    "sha256": "1295f2fc379fc0ed95f9c52a7d9c8c2e5b2637003a3de5c721685bb735348afd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/thermal-checks.stderr",
    "bytes": 1274,
    "sha256": "b329b227c69dbb9eab302ae44ff3326429ae2c390fcbfdd226c3feb0dbf90fc7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/thermal-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/thermal_checks.py",
    "bytes": 11107,
    "sha256": "27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-cohort-v624/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/check-execution.json",
    "bytes": 1429,
    "sha256": "42640c2cd6443d78d7217b0577e90a2cff5f50d89034c1af79e7d4a22b4b4611"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/cooling-checks.stderr",
    "bytes": 504,
    "sha256": "d7f01da056acb90d81d9481f2970f49f765be22edc14bc9bf92b95e23daa94a9"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/cooling-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/cooling-transformation.json",
    "bytes": 6327,
    "sha256": "1640a7b89c7782f41d60e571ed037cbbb7f6f71035f1f13db69ffcece0e0ee7f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/cooling_checks.py",
    "bytes": 4240,
    "sha256": "6ab2738729cc62a0fb97819afe36851daadf2d0a487f5620abfe8e5b3a5f5da3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/delivery-checks.stderr",
    "bytes": 575,
    "sha256": "f200a47c3188f9969e3c18817550b58061b4e652827a8faec1d8e619e86d2c1b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/delivery-checks.stdout",
    "bytes": 139,
    "sha256": "54bebbd978590c6310e9141a80b5553f23fb594609a8242d6379f89f479aabe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/delivery-profile.json",
    "bytes": 14024,
    "sha256": "4525a388a211027f0197fc255b68b9e799947ad366ec4f47d476ea206e084275"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/delivery_checks.py",
    "bytes": 6022,
    "sha256": "9663417cfdfa7d02c1efb7db6dacf4978bf680c740d462426df6de2980b14200"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/driver/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/driver/serve_bench.py",
    "bytes": 62137,
    "sha256": "abbea293354fe58ff60dcc33beaa76744d0c59cf9b38d7337bcee9986b73f60d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/driver/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/driver-transformation.json",
    "bytes": 4193,
    "sha256": "650bc64f2ee78cbb4adda0e381cb1a6fcaffae276c25718eb8c1770d25c8aac6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/final-checks.stderr",
    "bytes": 388,
    "sha256": "cb7fdf1f8743ca6eaac910c710c9ec86cb488dac9a2100a14527b594361a6c12"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/final-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/final_checks.py",
    "bytes": 2707,
    "sha256": "4dad4a6a2cd0db5d1737e1c9407348812f36c13705f612d610f792098576dea3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/freeze.stderr",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/freeze.stdout",
    "bytes": 136,
    "sha256": "9ddaf67a963caf11ce020344d2923fb9c20349c93c7cbbe0d4316dc5f6bf4f3a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/on/binding.json",
    "bytes": 240846,
    "sha256": "8b9cd77c30a52a02c7726a649afcc561571f43204aed2f8e3d660eff91d9fe10"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/on/protocol.json",
    "bytes": 6901,
    "sha256": "8a03e0206506b9f96a4fe7f262c360ea1151aa615c4ef00fc5079d5579c49324"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/prepare.py",
    "bytes": 4363,
    "sha256": "1b06d9c115ee57b2b77f26602e032f71bc2428df8efc807aa2949cbc5de06824"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/run-checks.stderr",
    "bytes": 119,
    "sha256": "b93ef8a81af8d286ae75389b2a13c4efd70ddc764d18f2660292fa2e67ab2c58"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/run-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/run.py",
    "bytes": 18776,
    "sha256": "960bab0de275589107218001d6af9b5d59ab5d5c67a4f7d9f51c4de87dfc8edc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/run_test.py",
    "bytes": 16316,
    "sha256": "1f2b9cf5e1bef73f0159959ae5e0375f827e2e2ba66ae7cca46c82f6f35cf12a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/sample-evidence-correction.json",
    "bytes": 1844,
    "sha256": "d20bfd36535fc115cb870e60a4e14482fc815224f0e46b3647af1e5caab7c15e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/schedule-checks.stderr",
    "bytes": 574,
    "sha256": "173c7e139bec9ef4116f1dea625631265b71bf2cf90508be1ff033e6b5ea5c65"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/schedule-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/schedule-transformation.json",
    "bytes": 9528,
    "sha256": "15b00b7e02b8ee795c67a48c463e3d9c77b253c69911a34637beed4b3036ce0d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/schedule_checks.py",
    "bytes": 5713,
    "sha256": "fd4793226be878485bf63db67045630d6d67a1ab29191b9884cabed61761305e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/startup-checks.stderr",
    "bytes": 575,
    "sha256": "0d5b5b263792591343c4baabe1008b9ff16610be2901fb6175d24949c2fbf8a8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/startup-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/startup_checks.py",
    "bytes": 4570,
    "sha256": "1295f2fc379fc0ed95f9c52a7d9c8c2e5b2637003a3de5c721685bb735348afd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/thermal-checks.stderr",
    "bytes": 1274,
    "sha256": "79a7d8246fac380583ffabf0a122501de1aa9875b2e4d9c5b060786d8fbe6471"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/thermal-checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/thermal_checks.py",
    "bytes": 11107,
    "sha256": "27b43360c2e809003cc5ecd0b95701939d85c84cbcba9fbe3d7d09bde7b09085"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-mtp-cooled-evidence-v627/thermal_settle.py",
    "bytes": 6912,
    "sha256": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  }
]
```

## Artifact SHA-256 53c121f02c46194f9914f9751d6c08cedcb76c7ba6b927829026bd52f779f5ac

Encoding: `utf-8`. Original bytes: 1429.

````````````text
[
  {
    "name": "run",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 20 tests in 8.354s",
      "",
      "OK"
    ]
  },
  {
    "name": "final",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 4 tests in 0.732s",
      "",
      "OK"
    ]
  },
  {
    "name": "thermal",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 13 tests in 0.099s",
      "",
      "OK"
    ]
  },
  {
    "name": "schedule",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 6 tests in 2.320s",
      "",
      "OK"
    ]
  },
  {
    "name": "delivery",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 6 tests in 1.106s",
      "",
      "OK"
    ]
  },
  {
    "name": "startup",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 6 tests in 1.104s",
      "",
      "OK"
    ]
  },
  {
    "name": "cooling",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 4 tests in 0.713s",
      "",
      "OK"
    ]
  }
]

````````````

## Artifact SHA-256 15e7b9671db55f45fc373fd3721e8440991af24481abbd3cea8ba34498998249

Encoding: `utf-8`. Original bytes: 419.

````````````text
test_actual_driver_changes_only_exact_protocol_fingerprint (__main__.Checks) ... ok
test_actual_failed_thermal_row_remains_ineligible (__main__.Checks) ... ok
test_full120_seconds_observed_and_fair_resets_them (__main__.Checks) ... ok
test_only_cooling_changes_and_original_work_and_stops_remain (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 4 tests in 0.713s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 1640a7b89c7782f41d60e571ed037cbbb7f6f71035f1f13db69ffcece0e0ee7f

Encoding: `utf-8`. Original bytes: 6327.

````````````text
{
  "classification": "Prepared only. Fresh cohort required; failed V616 remains unqualified and unpooled.",
  "prior": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616",
  "prior_failure": {
    "classification": "Failed partial cohort. Actual stop is a nonnominal thermal observation; missing later warmup in outer assessment is secondary.",
    "elapsed_seconds": 1562.0374826250002,
    "measured_responses": 7,
    "first_responses": 7,
    "outputs_per_response": 512,
    "total_outputs_checked": 7168,
    "all_completed_responses_preserve_full_work_and_sampled_cap": true,
    "all_three_completed_pairs_preserve_first_and_measured_ids_and_text": true,
    "maximum_sampled_request_peak_bytes": 9912832968,
    "minimum_sampled_reclaimable_bytes": 20621852672,
    "maximum_sampled_owned_rss_bytes": 4886134784,
    "new_swapouts": 0,
    "stop_coordinate": [
      4,
      "combined"
    ],
    "stop_thermal_before": {
      "lowPowerModeEnabled": false,
      "thermalState": "nominal"
    },
    "stop_thermal_after": {
      "lowPowerModeEnabled": false,
      "thermalState": "fair"
    },
    "measured_vm_delta_at_stop": {
      "swapins": 0,
      "swapouts": 0
    },
    "cleanup_complete": true,
    "remaining_jobs": [],
    "source_proofs_unchanged": true,
    "qualified": false,
    "performance_comparison_reported": false,
    "activation_performed": false,
    "source_sha256": {
      "/tmp/slotstream-optimization-execution/final-mtp-thermal-stop-v623/audit.py": "d399123e631d0002fb78253006a75695e909aefc28972af2013a8fd3f51451f8",
      "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/on/execution/qualification.json": "17eaa6d2a4f865f60d82d828158ac92101a3561f765f3f335e2df037886289c3",
      "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/on/execution/receipt.json": "bbe757d1c4d6ec36acfa4ee897e21fc9c7177a04d7f5cb62ddcb1d04fa280146",
      "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/on/execution/memory.json": "15d6ffeffe59ae6b92dbf278251d66438596e456a2dbe24997f300781d2a79f3",
      "/Users/carlos/Projects/slotstream/.build/optimization/final-mtp-long-startup-v616/on/completion.json": "e2c0dfc1965a3b564ffe9b3c5b291497c690af4d27f3f1fcfc65b1b04851823e",
      "/Users/carlos/Projects/slotstream/.build/optimization/final-mtp-long-startup-v616/on/results.jsonl": "234514565175a273ffc0d5eb4020cb8d8feeef067c60b576acb2fb4e59ceac20"
    }
  },
  "run_changes": [
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'"
    },
    {
      "old": "result['between_cells_seconds'] = 0",
      "new": "result['between_cells_seconds'] = 60"
    },
    {
      "old": "'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2",
      "new": "'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2"
    },
    {
      "old": "require(row.get('cooldown_seconds') == 0",
      "new": "require(row.get('cooldown_seconds') == 60"
    },
    {
      "old": "and 30 <= stable <= elapsed <= 600",
      "new": "and 120 <= stable <= elapsed <= 600"
    },
    {
      "old": "and type(samples) is int and samples >= 16",
      "new": "and type(samples) is int and samples >= 61"
    },
    {
      "old": "('delivery', 6), ('startup', 6)]",
      "new": "('delivery', 6), ('startup', 6), ('cooling', 4)]"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'cooling_checks.py', HERE / 'cooling-transformation.json',\n              BASE / 'final-mtp-thermal-stop-v623/result.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    }
  ],
  "driver_changes": [
    {
      "old": "c12e2bc21ef1f0590b8e0bef0a32ca526e8276b19a3e874d2507a50ac6167f5e",
      "new": "4da803a69f75c3ed56d980ea231a3c3a6881ee9dd7256ea68262f12f9d9b5e55"
    }
  ],
  "test_changes": [
    {
      "old": "'cooldown_seconds': 0",
      "new": "'cooldown_seconds': 60"
    },
    {
      "old": "'request_acceptance_unchanged': True, 'seconds': 30.1,\n        'sampled_nominal_seconds': 30.1, 'samples': 16",
      "new": "'request_acceptance_unchanged': True, 'seconds': 120.1,\n        'sampled_nominal_seconds': 120.1, 'samples': 61"
    },
    {
      "old": "'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2",
      "new": "'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2"
    },
    {
      "old": "self.assertEqual(current['between_cells_seconds'], 0)",
      "new": "self.assertEqual(current['between_cells_seconds'], 60)"
    },
    {
      "old": "('sampled_nominal_seconds', 29.99)",
      "new": "('sampled_nominal_seconds', 119.99)"
    },
    {
      "old": "('sampled_nominal_seconds', 31), ('samples', 15)",
      "new": "('sampled_nominal_seconds', 121), ('samples', 60)"
    },
    {
      "old": "[{**row, 'cooldown_seconds': 60} for row in rows()]",
      "new": "[{**row, 'cooldown_seconds': 0} for row in rows()]"
    },
    {
      "old": "        self.assertEqual(protocol, runner.c.read(runner.BASE / 'final-long-adaptive-schedule-v581/on/protocol.json'))",
      "new": "        prior = runner.c.read(runner.BASE / 'final-long-adaptive-schedule-v581/on/protocol.json')\n        restored = copy.deepcopy(protocol)\n        restored['between_cells_seconds'] = prior['between_cells_seconds']\n        restored['before_cell_thermal_settle'] = prior['before_cell_thermal_settle']\n        self.assertEqual(restored, prior)"
    }
  ],
  "canonical_protocol_sha256": "4da803a69f75c3ed56d980ea231a3c3a6881ee9dd7256ea68262f12f9d9b5e55",
  "only_protocol_changes": {
    "between_cells_seconds": [
      0,
      60
    ],
    "before_cell_thermal_settle.stable_seconds": [
      30,
      120
    ]
  },
  "minimum_idle_seconds_per_cell": 180,
  "observed_previous_mean_two_request_work_seconds": 165.5708146252857,
  "original_work_seconds": 12600,
  "cleanup_seconds": 60,
  "limits": "Longer cooling lowers planned inference duty. Nominal state is coarse and does not guarantee that a later request remains nominal; original request thermal gates still stop failures.",
  "model_launched": false,
  "activation_performed": false
}

````````````

## Artifact SHA-256 48230c2088c03ad34cee60e567183d99ceec484c42556941040dff199ca5a2b1

Encoding: `utf-8`. Original bytes: 3761.

````````````text
"""Check the actual longer readiness profile without waiting or launching a model."""
import copy
import json
from pathlib import Path
import tempfile
import unittest

import run as runner
import thermal_checks
import thermal_settle

driver = runner.module('cooled_driver', runner.HERE / 'driver/serve_bench.py')


class Checks(unittest.TestCase):
    def test_only_cooling_changes_and_original_work_and_stops_remain(self):
        prior = runner.c.read(runner.BASE / 'final-mtp-long-startup-v616/on/protocol.json')
        current = runner.expected_protocol('on')
        self.assertEqual(current['between_cells_seconds'], 60)
        self.assertEqual(current['before_cell_thermal_settle'], {
            'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2})
        restored = copy.deepcopy(current)
        restored['between_cells_seconds'] = prior['between_cells_seconds']
        restored['before_cell_thermal_settle'] = prior['before_cell_thermal_settle']
        self.assertEqual(restored, prior)
        self.assertTrue(current['abort_on_resource_failure'])
        self.assertTrue(current['require_nominal_power_state'])
        self.assertEqual((runner.SECONDS, runner.CLEANUP_SECONDS), (12600, 60))

    def test_actual_driver_changes_only_exact_protocol_fingerprint(self):
        record = runner.c.read(runner.HERE / 'cooling-transformation.json')
        text = (runner.HERE / 'driver/serve_bench.py').read_text()
        for change in reversed(record['driver_changes']):
            self.assertEqual(text.count(change['new']), 1)
            text = text.replace(change['new'], change['old'])
        self.assertEqual(text, (runner.BASE / 'final-mtp-long-startup-v616/driver/serve_bench.py').read_text())
        self.assertEqual((runner.HERE / 'driver/thermal_settle.py').read_bytes(),
                         (runner.BASE / 'final-mtp-long-startup-v616/driver/thermal_settle.py').read_bytes())
        self.assertTrue(driver.exact_final_mtp_long(runner.expected_protocol('on')))

    def test_full120_seconds_observed_and_fair_resets_them(self):
        requirement = runner.expected_protocol('on')['before_cell_thermal_settle']
        for fair in (False, True):
            with self.subTest(fair=fair), tempfile.TemporaryDirectory() as directory:
                clock = thermal_checks.Clock()
                result = thermal_settle.wait(requirement, 18,
                    observe=lambda: thermal_checks.observation('fair' if fair and clock.value == 10 else 'nominal'),
                    vm=lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 0, 'swapouts': 0},
                    pressure=lambda: {'level': 1}, jobs=lambda: [],
                    now=clock.now, sleep=clock.sleep,
                    lock_path=Path(directory) / 'model.lock', record=lambda value: None)
                self.assertEqual(result['sampled_nominal_seconds'], 120)
                self.assertEqual(result['seconds'], 132 if fair else 120)
                self.assertGreaterEqual(result['samples'], 61)

    def test_actual_failed_thermal_row_remains_ineligible(self):
        raw = runner.ROOT / '.build/optimization/final-mtp-long-startup-v616/on/results.jsonl'
        row = json.loads(raw.read_text().splitlines()[-1])
        reasons = driver.resource_exclusions(row['metrics']['stats'], runner.expected_protocol('on'))
        self.assertIn('generator OS thermal/power state unavailable or non-nominal', reasons)
        failed = runner.c.read(runner.BASE / 'final-mtp-thermal-stop-v623/result.json')
        self.assertFalse(failed['qualified'])
        self.assertFalse(failed['performance_comparison_reported'])
        self.assertTrue(failed['cleanup_complete'])


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 4f351b2bd3d1010a50888b28fe0e177bafe233e6515f1d32d2949365573e2d7e

Encoding: `utf-8`. Original bytes: 575.

````````````text
test_canonical_order_does_not_change_identity_and_extra_fields_do (__main__.Checks) ... ok
test_every_protocol_field_is_bound (__main__.Checks) ... ok
test_exact_original_workload_requires_eighteen_gb (__main__.Checks) ... ok
test_only_admission_and_fixture_delivery_changed_in_driver (__main__.Checks) ... ok
test_ordinary_small_profile_keeps_original_admission (__main__.Checks) ... ok
test_real_driver_reaches_quiet_boundary_before_any_model_launch (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 1.106s

OK

````````````

## Artifact SHA-256 54bebbd978590c6310e9141a80b5553f23fb594609a8242d6379f89f479aabe3

Encoding: `utf-8`. Original bytes: 139.

````````````text
{"requirement": {"stable_seconds": 180, "maximum_wait_seconds": 1800}, "passed": false, "error": "RuntimeError: synthetic prelaunch stop"}

````````````

## Artifact SHA-256 4525a388a211027f0197fc255b68b9e799947ad366ec4f47d476ea206e084275

Encoding: `utf-8`. Original bytes: 14024.

````````````text
{
  "classification": "Prospective exact final MTP startup method: global startup swap-ins invalidate the whole pair under the original assessor while the fixed cohort continues; all physical/pressure/swap-out stops and original work/acceptance remain.",
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
    "between_cells_seconds": 60,
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
      "stable_seconds": 120,
      "maximum_wait_seconds": 600,
      "poll_seconds": 2
    }
  },
  "canonical_protocol_sha256": "4da803a69f75c3ed56d980ea231a3c3a6881ee9dd7256ea68262f12f9d9b5e55",
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
    },
    {
      "old": "def measurement_memory(protocol):\n",
      "new": "def startup_vm_requires_abort(protocol, before, after):\n    # Timing eligibility is deliberately separate from the hard resource stop.\n    # For the exact final MTP cohort, startup swap-ins exclude the complete pair\n    # through unchanged startup_and_warmup_valid and the original raw assessor.\n    # New swap-outs, unavailable counters and resets always require aborting.\n    for key in ('swapins', 'swapouts'):\n        if (type(before.get(key)) is not int or type(after.get(key)) is not int\n                or before[key] < 0 or after[key] < before[key]):\n            return True\n    if exact_final_mtp_long(protocol):\n        return before['swapouts'] != after['swapouts']\n    return any(before[key] != after[key] for key in ('swapins', 'swapouts'))\n\n\ndef measurement_memory(protocol):\n"
    },
    {
      "old": "                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]\n                                   for key in ['swapins', 'swapouts']):\n",
      "new": "                            if startup_vm_requires_abort(protocol, row['before_startup'], row['after_warmup_vm']):\n"
    },
    {
      "old": "c12e2bc21ef1f0590b8e0bef0a32ca526e8276b19a3e874d2507a50ac6167f5e",
      "new": "4da803a69f75c3ed56d980ea231a3c3a6881ee9dd7256ea68262f12f9d9b5e55"
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
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'"
    },
    {
      "old": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']\n",
      "new": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']\n"
    },
    {
      "old": "('schedule', 6), ('delivery', 6)]",
      "new": "('schedule', 6), ('delivery', 6), ('startup', 6)]"
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'"
    },
    {
      "old": "result['between_cells_seconds'] = 0",
      "new": "result['between_cells_seconds'] = 60"
    },
    {
      "old": "'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2",
      "new": "'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2"
    },
    {
      "old": "require(row.get('cooldown_seconds') == 0",
      "new": "require(row.get('cooldown_seconds') == 60"
    },
    {
      "old": "and 30 <= stable <= elapsed <= 600",
      "new": "and 120 <= stable <= elapsed <= 600"
    },
    {
      "old": "and type(samples) is int and samples >= 16",
      "new": "and type(samples) is int and samples >= 61"
    },
    {
      "old": "('delivery', 6), ('startup', 6)]",
      "new": "('delivery', 6), ('startup', 6), ('cooling', 4)]"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'cooling_checks.py', HERE / 'cooling-transformation.json',\n              BASE / 'final-mtp-thermal-stop-v623/result.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    }
  ],
  "model_launched": false,
  "off_result_reused_without_rerun": "/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/off/execution/qualification.json",
  "startup_swapin_abort_unchanged": false,
  "startup_swapin_pair_eligibility_unchanged": true,
  "prior_failed_startup_qualification_sha256": "1ed6df72301d954301fb33879911d2b4cccf81afb2314fbb9aac03da6ad9efa4",
  "cooling_method": "60-second reserved cooldown followed by 120 sampled nominal seconds; maximum sampled readiness wait remains 600 seconds.",
  "prior_failed_thermal_qualification_sha256": "17eaa6d2a4f865f60d82d828158ac92101a3561f765f3f335e2df037886289c3"
}

````````````

## Artifact SHA-256 9663417cfdfa7d02c1efb7db6dacf4978bf680c740d462426df6de2980b14200

Encoding: `utf-8`. Original bytes: 6022.

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
        prior = runner.c.read(runner.BASE / 'final-long-adaptive-schedule-v581/on/protocol.json')
        restored = copy.deepcopy(protocol)
        restored['between_cells_seconds'] = prior['between_cells_seconds']
        restored['before_cell_thermal_settle'] = prior['before_cell_thermal_settle']
        self.assertEqual(restored, prior)
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

## Artifact SHA-256 abbea293354fe58ff60dcc33beaa76744d0c59cf9b38d7337bcee9986b73f60d

Encoding: `utf-8`. Original bytes: 62137.

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
    return hashlib.sha256(canonical.encode()).hexdigest() == '4da803a69f75c3ed56d980ea231a3c3a6881ee9dd7256ea68262f12f9d9b5e55'


def startup_vm_requires_abort(protocol, before, after):
    # Timing eligibility is deliberately separate from the hard resource stop.
    # For the exact final MTP cohort, startup swap-ins exclude the complete pair
    # through unchanged startup_and_warmup_valid and the original raw assessor.
    # New swap-outs, unavailable counters and resets always require aborting.
    for key in ('swapins', 'swapouts'):
        if (type(before.get(key)) is not int or type(after.get(key)) is not int
                or before[key] < 0 or after[key] < before[key]):
            return True
    if exact_final_mtp_long(protocol):
        return before['swapouts'] != after['swapouts']
    return any(before[key] != after[key] for key in ('swapins', 'swapouts'))


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
                            if startup_vm_requires_abort(protocol, row['before_startup'], row['after_warmup_vm']):
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

## Artifact SHA-256 650bc64f2ee78cbb4adda0e381cb1a6fcaffae276c25718eb8c1770d25c8aac6

Encoding: `utf-8`. Original bytes: 4193.

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
    },
    {
      "old": "def measurement_memory(protocol):\n",
      "new": "def startup_vm_requires_abort(protocol, before, after):\n    # Timing eligibility is deliberately separate from the hard resource stop.\n    # For the exact final MTP cohort, startup swap-ins exclude the complete pair\n    # through unchanged startup_and_warmup_valid and the original raw assessor.\n    # New swap-outs, unavailable counters and resets always require aborting.\n    for key in ('swapins', 'swapouts'):\n        if (type(before.get(key)) is not int or type(after.get(key)) is not int\n                or before[key] < 0 or after[key] < before[key]):\n            return True\n    if exact_final_mtp_long(protocol):\n        return before['swapouts'] != after['swapouts']\n    return any(before[key] != after[key] for key in ('swapins', 'swapouts'))\n\n\ndef measurement_memory(protocol):\n"
    },
    {
      "old": "                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]\n                                   for key in ['swapins', 'swapouts']):\n",
      "new": "                            if startup_vm_requires_abort(protocol, row['before_startup'], row['after_warmup_vm']):\n"
    },
    {
      "old": "c12e2bc21ef1f0590b8e0bef0a32ca526e8276b19a3e874d2507a50ac6167f5e",
      "new": "4da803a69f75c3ed56d980ea231a3c3a6881ee9dd7256ea68262f12f9d9b5e55"
    }
  ],
  "original_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "driver_sha256": "e490e49bcd784f293b4e58222e416f6a233e76ba1c15f5fdde717a984116c00c",
  "reverse_restores_original_bytes": true
}

````````````

## Artifact SHA-256 a73408530cb00ccc43ef219e791b5b869ed74d7af7a6bfc6a950c234eccebf75

Encoding: `utf-8`. Original bytes: 388.

````````````text
test_all_seven_native_proofs_are_retained (__main__.Checks) ... ok
test_incomplete_matrix_cannot_qualify_or_freeze (__main__.Checks) ... ok
test_missing_paired_or_consumed_legacy_cannot_hide (__main__.Checks) ... ok
test_original_run_report_and_guards_remain_exact (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 4 tests in 0.732s

OK

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

## Artifact SHA-256 f9413fa64d3fb7808971ec24c3895232985a0826773818c979f8437530ebc2b7

Encoding: `utf-8`. Original bytes: 136.

````````````text
{
  "frozen": "on",
  "binding_sha256": "acc07b25ddaa6562633da39195ed236d7c19ad89a16e06af952a3a8a4bec2dca",
  "model_launched": false
}

````````````

## Artifact SHA-256 acc07b25ddaa6562633da39195ed236d7c19ad89a16e06af952a3a8a4bec2dca

Encoding: `gzip+base64`. Original bytes: 240462.

````````````text
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
````````````

## Artifact SHA-256 8a03e0206506b9f96a4fe7f262c360ea1151aa615c4ef00fc5079d5579c49324

Encoding: `utf-8`. Original bytes: 6901.

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
  "between_cells_seconds": 60,
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
    "stable_seconds": 120,
    "maximum_wait_seconds": 600,
    "poll_seconds": 2
  }
}

````````````

## Artifact SHA-256 3b2bcf988c039bb29be08c8fd85a176ef6d3b9d3880a5831c4ffb0dd53c8f4a6

Encoding: `utf-8`. Original bytes: 7621.

````````````text
"""Prepare a fresh complete MTP cohort with longer cooling; never launch it."""
from pathlib import Path
import hashlib
import json
import shutil

BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
PRIOR = BASE / 'final-mtp-long-startup-v616'
read = lambda path: json.loads(path.read_text())
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
failure = read(BASE / 'final-mtp-thermal-stop-v623/result.json')
assert failure['qualified'] is False and failure['stop_thermal_after']['thermalState'] == 'fair'
assert failure['cleanup_complete'] is True and failure['remaining_jobs'] == []
assert not (HERE / 'run.py').exists() and not (HERE / 'on').exists()
names = ('run.py', 'run_test.py', 'final_checks.py', 'thermal_checks.py',
         'schedule_checks.py', 'delivery_checks.py', 'startup_checks.py',
         'thermal_settle.py', 'driver-transformation.json',
         'schedule-transformation.json', 'delivery-profile.json')
for name in names:
    shutil.copyfile(PRIOR / name, HERE / name)
(HERE / 'driver').mkdir()
for name in ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py'):
    shutil.copyfile(PRIOR / 'driver' / name, HERE / 'driver' / name)


def replace(path, old, new, changes):
    source = path.read_text()
    assert source.count(old) == 1, (path.name, old, source.count(old))
    path.write_text(source.replace(old, new, 1))
    changes.append({'old': old, 'new': new})


run_changes = []
run = HERE / 'run.py'
for old, new in (
    ("OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'",
     "OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'"),
    ("result['between_cells_seconds'] = 0", "result['between_cells_seconds'] = 60"),
    ("'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2",
     "'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2"),
    ("require(row.get('cooldown_seconds') == 0", "require(row.get('cooldown_seconds') == 60"),
    ('and 30 <= stable <= elapsed <= 600', 'and 120 <= stable <= elapsed <= 600'),
    ('and type(samples) is int and samples >= 16', 'and type(samples) is int and samples >= 61'),
    ("('delivery', 6), ('startup', 6)]", "('delivery', 6), ('startup', 6), ('cooling', 4)]"),
    ("    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
     "    paths += [HERE / 'cooling_checks.py', HERE / 'cooling-transformation.json',\n"
     "              BASE / 'final-mtp-thermal-stop-v623/result.json']\n"
     "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"),
):
    replace(run, old, new, run_changes)

record = read(HERE / 'schedule-transformation.json')
record['run_edits'].extend(run_changes)
record['classification'] = 'Fresh full MTP-on cohort after verified thermal stop; original 60-second quiet cooldown followed by 120 sampled nominal seconds before every model launch. Work, timing eligibility and all hard stops stay intact.'
record['previous_schedule'] = str(PRIOR / 'on/protocol.json')
record['previous_failed_qualification_sha256'] = digest(PRIOR / 'on/execution/qualification.json')
record['maximum_ideal_idle_saving_seconds_both_modes'] = None
record['all_requests_acceptance_and_full_allowances_preserved'] = True
(HERE / 'schedule-transformation.json').write_text(json.dumps(record, indent=2) + '\n')

protocol = read(PRIOR / 'on/protocol.json')
protocol['between_cells_seconds'] = 60
protocol['before_cell_thermal_settle']['stable_seconds'] = 120
old_hash = read(HERE / 'delivery-profile.json')['canonical_protocol_sha256']
new_hash = hashlib.sha256(json.dumps(protocol, sort_keys=True, separators=(',', ':'), allow_nan=False).encode()).hexdigest()
driver_changes = []
replace(HERE / 'driver/serve_bench.py', old_hash, new_hash, driver_changes)
record = read(HERE / 'driver-transformation.json')
record['edits'].extend(driver_changes)
(HERE / 'driver-transformation.json').write_text(json.dumps(record, indent=2) + '\n')
profile = read(HERE / 'delivery-profile.json')
profile['approved_protocol'] = protocol
profile['canonical_protocol_sha256'] = new_hash
profile['original_driver_changes'].extend(driver_changes)
profile['executor_changes'].extend(run_changes)
profile['cooling_method'] = '60-second reserved cooldown followed by 120 sampled nominal seconds; maximum sampled readiness wait remains 600 seconds.'
profile['prior_failed_thermal_qualification_sha256'] = digest(PRIOR / 'on/execution/qualification.json')
(HERE / 'delivery-profile.json').write_text(json.dumps(profile, indent=2) + '\n')

test_changes = []
test = HERE / 'schedule_checks.py'
for old, new in (
    ("'cooldown_seconds': 0", "'cooldown_seconds': 60"),
    ("'request_acceptance_unchanged': True, 'seconds': 30.1,\n        'sampled_nominal_seconds': 30.1, 'samples': 16",
     "'request_acceptance_unchanged': True, 'seconds': 120.1,\n        'sampled_nominal_seconds': 120.1, 'samples': 61"),
    ("'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2",
     "'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2"),
    ("self.assertEqual(current['between_cells_seconds'], 0)",
     "self.assertEqual(current['between_cells_seconds'], 60)"),
    ("('sampled_nominal_seconds', 29.99)", "('sampled_nominal_seconds', 119.99)"),
    ("('sampled_nominal_seconds', 31), ('samples', 15)",
     "('sampled_nominal_seconds', 121), ('samples', 60)"),
    ("[{**row, 'cooldown_seconds': 60} for row in rows()]",
     "[{**row, 'cooldown_seconds': 0} for row in rows()]"),
):
    replace(test, old, new, test_changes)
replace(HERE / 'delivery_checks.py',
        "        self.assertEqual(protocol, runner.c.read(runner.BASE / 'final-long-adaptive-schedule-v581/on/protocol.json'))",
        "        prior = runner.c.read(runner.BASE / 'final-long-adaptive-schedule-v581/on/protocol.json')\n"
        "        restored = copy.deepcopy(protocol)\n"
        "        restored['between_cells_seconds'] = prior['between_cells_seconds']\n"
        "        restored['before_cell_thermal_settle'] = prior['before_cell_thermal_settle']\n"
        "        self.assertEqual(restored, prior)", test_changes)

result = {
    'classification': 'Prepared only. Fresh cohort required; failed V616 remains unqualified and unpooled.',
    'prior': str(PRIOR), 'prior_failure': failure,
    'run_changes': run_changes, 'driver_changes': driver_changes, 'test_changes': test_changes,
    'canonical_protocol_sha256': new_hash,
    'only_protocol_changes': {'between_cells_seconds': [0, 60],
                              'before_cell_thermal_settle.stable_seconds': [30, 120]},
    'minimum_idle_seconds_per_cell': 180,
    'observed_previous_mean_two_request_work_seconds': sum(
        json.loads(line)['client_seconds'] + json.loads(line)['first_request']['complete_seconds_from_launch']
        for line in (Path('/Users/carlos/Projects/slotstream/.build/optimization/final-mtp-long-startup-v616/on/results.jsonl')).read_text().splitlines()) / 7,
    'original_work_seconds': 12600, 'cleanup_seconds': 60,
    'limits': 'Longer cooling lowers planned inference duty. Nominal state is coarse and does not guarantee that a later request remains nominal; original request thermal gates still stop failures.',
    'model_launched': False, 'activation_performed': False,
}
(HERE / 'cooling-transformation.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: result[k] for k in ('canonical_protocol_sha256', 'only_protocol_changes',
    'minimum_idle_seconds_per_cell', 'observed_previous_mean_two_request_work_seconds', 'model_launched')}, indent=2))

````````````

## Artifact SHA-256 ee7df502d6f93df1bca6b719ee63392435500bc1018bd23524926b9536eefbed

Encoding: `utf-8`. Original bytes: 119.

````````````text
....................
----------------------------------------------------------------------
Ran 20 tests in 8.354s

OK

````````````

## Artifact SHA-256 d3bf5638496ef92467edbfc28d57c5e0928e451c4706868bc58fe186b827e286

Encoding: `utf-8`. Original bytes: 18649.

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
OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'
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
    result['between_cells_seconds'] = 60
    result['before_cell_thermal_settle'] = {
        'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2}
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
    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']
    paths += [HERE / 'cooling_checks.py', HERE / 'cooling-transformation.json',
              BASE / 'final-mtp-thermal-stop-v623/result.json']
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
    for name, count in [('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6), ('delivery', 6), ('startup', 6), ('cooling', 4)]:
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
        require(row.get('cooldown_seconds') == 60 and all(state.get(key) is True
                for key in ('enabled', 'reserved', 'before_launch_only', 'request_acceptance_unchanged')),
                'sampled readiness missing or bypassed')
        elapsed, stable, samples = (state.get(key) for key in
                                    ('seconds', 'sampled_nominal_seconds', 'samples'))
        require(type(elapsed) in (int, float) and type(stable) in (int, float)
                and 120 <= stable <= elapsed <= 600
                and type(samples) is int and samples >= 61,
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

## Artifact SHA-256 aadb160ddeb8537b8c9fd02deb8e6f504f54cead0070c3efcf223cfb5b893ed2

Encoding: `utf-8`. Original bytes: 574.

````````````text
test_actual_driver_and_helper_bytes_are_checked_and_bound (__main__.Checks) ... ok
test_all_cells_need_full_stable_evidence (__main__.Checks) ... ok
test_only_two_scheduling_fields_differ_from_both_unrun_drafts (__main__.Checks) ... ok
test_original_raw_assessor_is_not_reached_if_readiness_is_missing (__main__.Checks) ... ok
test_original_request_and_cleanup_bodies_restore_exactly (__main__.Checks) ... ok
test_schedule_cannot_drift_or_be_disabled (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 2.320s

OK

````````````

## Artifact SHA-256 83e88b72375fe2609b50eedd076c2cc79210bc2cac1ec058b90d913260f3a7b4

Encoding: `utf-8`. Original bytes: 8787.

````````````text
{
  "classification": "Fresh full MTP-on cohort after verified thermal stop; original 60-second quiet cooldown followed by 120 sampled nominal seconds before every model launch. Work, timing eligibility and all hard stops stay intact.",
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
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'"
    },
    {
      "old": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']\n",
      "new": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']\n"
    },
    {
      "old": "('schedule', 6), ('delivery', 6)]",
      "new": "('schedule', 6), ('delivery', 6), ('startup', 6)]"
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'"
    },
    {
      "old": "result['between_cells_seconds'] = 0",
      "new": "result['between_cells_seconds'] = 60"
    },
    {
      "old": "'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2",
      "new": "'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2"
    },
    {
      "old": "require(row.get('cooldown_seconds') == 0",
      "new": "require(row.get('cooldown_seconds') == 60"
    },
    {
      "old": "and 30 <= stable <= elapsed <= 600",
      "new": "and 120 <= stable <= elapsed <= 600"
    },
    {
      "old": "and type(samples) is int and samples >= 16",
      "new": "and type(samples) is int and samples >= 61"
    },
    {
      "old": "('delivery', 6), ('startup', 6)]",
      "new": "('delivery', 6), ('startup', 6), ('cooling', 4)]"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'cooling_checks.py', HERE / 'cooling-transformation.json',\n              BASE / 'final-mtp-thermal-stop-v623/result.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    }
  ],
  "original_serving_driver_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "original_reporter_sha256": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820",
  "original_startup_swapin_rule_unchanged": false,
  "all_requests_acceptance_and_full_allowances_preserved": true,
  "model_launched": false,
  "maximum_ideal_idle_saving_seconds_both_modes": null,
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
    "legacy_startup_swap_abort_unchanged": false
  },
  "startup_method_correction": {
    "original_reporter_and_pair_exclusions_unchanged": true,
    "startup_swapins": "exclude entire A/B pair while completing the fixed workload",
    "swapouts_pressure_footprint": "abort unchanged",
    "partial_prior_not_reused": true
  },
  "previous_schedule": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/on/protocol.json",
  "previous_failed_qualification_sha256": "17eaa6d2a4f865f60d82d828158ac92101a3561f765f3f335e2df037886289c3"
}

````````````

## Artifact SHA-256 2c983bc404d3b697deffc6f99888129ef8ab8a6762d6077db871f8bbc00bbcd8

Encoding: `utf-8`. Original bytes: 5713.

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
    return [{'cooldown_seconds': 60, 'thermal_settle': {
        'enabled': True, 'reserved': True, 'before_launch_only': True,
        'request_acceptance_unchanged': True, 'seconds': 120.1,
        'sampled_nominal_seconds': 120.1, 'samples': 61}}
        for _ in range(32)]


class Checks(unittest.TestCase):
    def test_only_two_scheduling_fields_differ_from_both_unrun_drafts(self):
        for mode in ('off', 'on'):
            current = m.expected_protocol(mode)
            self.assertEqual(current.pop('before_cell_thermal_settle'), {
                'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2})
            self.assertEqual(current['between_cells_seconds'], 60)
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
                             ('seconds', float('nan')), ('sampled_nominal_seconds', 119.99),
                             ('sampled_nominal_seconds', 121), ('samples', 60), ('samples', True)]:
            bad = rows(); bad[-1]['thermal_settle'][field] = value
            with self.subTest(field=field, value=value), self.assertRaises(ValueError):
                m.validate_schedule_evidence(manifest(), bad)
        for bad in (rows()[:-1], rows() + rows()[:1], [{**row, 'cooldown_seconds': 0} for row in rows()]):
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

## Artifact SHA-256 4654f826bac4817703cb00d6f3b44b678e6c7a4ba93d5f983617b369a0d020cd

Encoding: `utf-8`. Original bytes: 575.

````````````text
test_exact_profile_can_finish_work_but_startup_swapins_remain_ineligible (__main__.Checks) ... ok
test_new_swapouts_still_abort (__main__.Checks) ... ok
test_original_joint_assessor_excludes_the_pair_and_still_checks_its_outputs (__main__.Checks) ... ok
test_original_physical_and_pressure_stops_remain (__main__.Checks) ... ok
test_other_profiles_keep_the_legacy_startup_abort (__main__.Checks) ... ok
test_unavailable_invalid_or_reset_counters_abort (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 1.104s

OK

````````````

## Artifact SHA-256 1295f2fc379fc0ed95f9c52a7d9c8c2e5b2637003a3de5c721685bb735348afd

Encoding: `utf-8`. Original bytes: 4570.

````````````text
"""Synthetic startup exclusions must never admit contaminated timing or unsafe work."""
import copy
import unittest

import run as runner
import run_test
from guard_with_footprint import check_sample

driver = runner.module('startup_method_driver', runner.HERE / 'driver/serve_bench.py')


class Checks(unittest.TestCase):
    def test_exact_profile_can_finish_work_but_startup_swapins_remain_ineligible(self):
        protocol = runner.expected_protocol('on')
        before = {'swapins': 100, 'swapouts': 50}
        after = {'swapins': 108, 'swapouts': 50}
        self.assertFalse(driver.startup_vm_requires_abort(protocol, before, before))
        self.assertFalse(driver.startup_vm_requires_abort(protocol, before, after))
        # This is the unchanged driver condition for startup eligibility.
        self.assertFalse(all(before[k] == after[k] for k in ('swapins', 'swapouts')))

    def test_new_swapouts_still_abort(self):
        protocol = runner.expected_protocol('on')
        before = {'swapins': 100, 'swapouts': 50}
        for after in ({'swapins': 100, 'swapouts': 51}, {'swapins': 108, 'swapouts': 51}):
            self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))

    def test_other_profiles_keep_the_legacy_startup_abort(self):
        before = {'swapins': 100, 'swapouts': 50}
        after = {'swapins': 108, 'swapouts': 50}
        protocol = runner.expected_protocol('on')
        protocol['unqualified_profile'] = True
        self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))
        self.assertTrue(driver.startup_vm_requires_abort(runner.expected_protocol('off'), before, after))

    def test_unavailable_invalid_or_reset_counters_abort(self):
        protocol = runner.expected_protocol('on')
        valid = {'swapins': 100, 'swapouts': 50}
        for key in ('swapins', 'swapouts'):
            for value in (None, True, -1, 1.5, '100'):
                for side in ('before', 'after'):
                    before, after = dict(valid), dict(valid)
                    (before if side == 'before' else after)[key] = value
                    with self.subTest(key=key, value=value, side=side):
                        self.assertTrue(driver.startup_vm_requires_abort(protocol, before, after))
            after = dict(valid); del after[key]
            self.assertTrue(driver.startup_vm_requires_abort(protocol, valid, after))
            after = dict(valid); after[key] -= 1
            self.assertTrue(driver.startup_vm_requires_abort(protocol, valid, after))

    def test_original_joint_assessor_excludes_the_pair_and_still_checks_its_outputs(self):
        rows, warmups, _, completion = run_test.fixture_module.fixture()
        protocol = runner.expected_protocol('on')
        for row in rows + list(warmups.values()):
            row['metrics']['effective_mtp'] = True
            row['metrics']['stats']['requestSeconds'] = row['client_seconds']
        rows[1]['after_warmup_vm']['swapins'] += 8
        rows[1]['startup_and_warmup_valid'] = False
        run_test.complete(rows, protocol, completion)
        result = runner.assess_cohort(protocol, completion, rows, warmups)
        self.assertTrue(result['qualified'])
        self.assertEqual([r['round'] for r in result['measurement']['excluded_rounds']], [1])
        self.assertTrue(all(value['clean_pairs'] == 15 for value in result['measurement']['metrics'].values()))
        self.assertEqual(len(rows), 32)
        bad = copy.deepcopy(rows)
        bad[1]['metrics']['output_ids'][0] += 1
        run_test.complete(bad, protocol, completion)
        with self.assertRaisesRegex(ValueError, 'mismatch'):
            runner.assess_cohort(protocol, completion, bad, warmups)

    def test_original_physical_and_pressure_stops_remain(self):
        policy = runner.policy('on')
        self.assertTrue(policy['stop_on_new_swapouts'])
        self.assertEqual(policy['startup_reclaimable_bytes'], 18_000_000_000)
        cases = [({'reclaimable_bytes': 20_000_000_000, 'swapouts': 1}, 1_000_000_000),
                 ({'reclaimable_bytes': 2_999_999_999, 'swapouts': 0}, 1_000_000_000),
                 ({'reclaimable_bytes': 20_000_000_000, 'swapouts': 0}, 14_000_000_001)]
        for snapshot, rss in cases:
            with self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 0, policy)
        with self.assertRaisesRegex(RuntimeError, 'memory pressure is not normal'):
            runner.core.require_normal({'level': 2})


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 b329b227c69dbb9eab302ae44ff3326429ae2c390fcbfdd226c3feb0dbf90fc7

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
Ran 13 tests in 0.099s

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

## Artifact SHA-256 42640c2cd6443d78d7217b0577e90a2cff5f50d89034c1af79e7d4a22b4b4611

Encoding: `utf-8`. Original bytes: 1429.

````````````text
[
  {
    "name": "run",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 20 tests in 8.378s",
      "",
      "OK"
    ]
  },
  {
    "name": "final",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 4 tests in 0.733s",
      "",
      "OK"
    ]
  },
  {
    "name": "thermal",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 13 tests in 0.089s",
      "",
      "OK"
    ]
  },
  {
    "name": "schedule",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 6 tests in 2.309s",
      "",
      "OK"
    ]
  },
  {
    "name": "delivery",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 6 tests in 1.064s",
      "",
      "OK"
    ]
  },
  {
    "name": "startup",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 6 tests in 1.090s",
      "",
      "OK"
    ]
  },
  {
    "name": "cooling",
    "exit_code": 0,
    "tail": [
      "----------------------------------------------------------------------",
      "Ran 5 tests in 0.723s",
      "",
      "OK"
    ]
  }
]

````````````

## Artifact SHA-256 d7f01da056acb90d81d9481f2970f49f765be22edc14bc9bf92b95e23daa94a9

Encoding: `utf-8`. Original bytes: 504.

````````````text
test_actual_driver_changes_only_exact_protocol_fingerprint (__main__.Checks) ... ok
test_actual_failed_thermal_row_remains_ineligible (__main__.Checks) ... ok
test_full120_seconds_observed_and_fair_resets_them (__main__.Checks) ... ok
test_only_cooling_changes_and_original_work_and_stops_remain (__main__.Checks) ... ok
test_real120_second_observation_with_poll_overhead_is_valid (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 5 tests in 0.723s

OK

````````````

## Artifact SHA-256 6ab2738729cc62a0fb97819afe36851daadf2d0a487f5620abfe8e5b3a5f5da3

Encoding: `utf-8`. Original bytes: 4240.

````````````text
"""Check the actual longer readiness profile without waiting or launching a model."""
import copy
import json
from pathlib import Path
import tempfile
import unittest

import run as runner
import thermal_checks
import thermal_settle

driver = runner.module('cooled_driver', runner.HERE / 'driver/serve_bench.py')


class Checks(unittest.TestCase):
    def test_only_cooling_changes_and_original_work_and_stops_remain(self):
        prior = runner.c.read(runner.BASE / 'final-mtp-long-startup-v616/on/protocol.json')
        current = runner.expected_protocol('on')
        self.assertEqual(current['between_cells_seconds'], 60)
        self.assertEqual(current['before_cell_thermal_settle'], {
            'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2})
        restored = copy.deepcopy(current)
        restored['between_cells_seconds'] = prior['between_cells_seconds']
        restored['before_cell_thermal_settle'] = prior['before_cell_thermal_settle']
        self.assertEqual(restored, prior)
        self.assertTrue(current['abort_on_resource_failure'])
        self.assertTrue(current['require_nominal_power_state'])
        self.assertEqual((runner.SECONDS, runner.CLEANUP_SECONDS), (12600, 60))

    def test_actual_driver_changes_only_exact_protocol_fingerprint(self):
        record = runner.c.read(runner.HERE / 'cooling-transformation.json')
        text = (runner.HERE / 'driver/serve_bench.py').read_text()
        for change in reversed(record['driver_changes']):
            self.assertEqual(text.count(change['new']), 1)
            text = text.replace(change['new'], change['old'])
        self.assertEqual(text, (runner.BASE / 'final-mtp-long-startup-v616/driver/serve_bench.py').read_text())
        self.assertEqual((runner.HERE / 'driver/thermal_settle.py').read_bytes(),
                         (runner.BASE / 'final-mtp-long-startup-v616/driver/thermal_settle.py').read_bytes())
        self.assertTrue(driver.exact_final_mtp_long(runner.expected_protocol('on')))

    def test_full120_seconds_observed_and_fair_resets_them(self):
        requirement = runner.expected_protocol('on')['before_cell_thermal_settle']
        for fair in (False, True):
            with self.subTest(fair=fair), tempfile.TemporaryDirectory() as directory:
                clock = thermal_checks.Clock()
                result = thermal_settle.wait(requirement, 18,
                    observe=lambda: thermal_checks.observation('fair' if fair and clock.value == 10 else 'nominal'),
                    vm=lambda: {'reclaimable_bytes': 30_000_000_000, 'swapins': 0, 'swapouts': 0},
                    pressure=lambda: {'level': 1}, jobs=lambda: [],
                    now=clock.now, sleep=clock.sleep,
                    lock_path=Path(directory) / 'model.lock', record=lambda value: None)
                self.assertEqual(result['sampled_nominal_seconds'], 120)
                self.assertEqual(result['seconds'], 132 if fair else 120)
                self.assertGreaterEqual(result['samples'], 61)

    def test_real120_second_observation_with_poll_overhead_is_valid(self):
        import schedule_checks
        state = runner.c.read(runner.BASE / 'final-mtp-startup-readiness-v618/result.json')
        self.assertGreaterEqual(state['sampled_nominal_seconds'], 120)
        self.assertEqual(state['samples'], 60)
        rows = [{'cooldown_seconds': 60, 'thermal_settle': state} for _ in range(32)]
        runner.validate_schedule_evidence(schedule_checks.manifest(), rows)

    def test_actual_failed_thermal_row_remains_ineligible(self):
        raw = runner.ROOT / '.build/optimization/final-mtp-long-startup-v616/on/results.jsonl'
        row = json.loads(raw.read_text().splitlines()[-1])
        reasons = driver.resource_exclusions(row['metrics']['stats'], runner.expected_protocol('on'))
        self.assertIn('generator OS thermal/power state unavailable or non-nominal', reasons)
        failed = runner.c.read(runner.BASE / 'final-mtp-thermal-stop-v623/result.json')
        self.assertFalse(failed['qualified'])
        self.assertFalse(failed['performance_comparison_reported'])
        self.assertTrue(failed['cleanup_complete'])


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 f200a47c3188f9969e3c18817550b58061b4e652827a8faec1d8e619e86d2c1b

Encoding: `utf-8`. Original bytes: 575.

````````````text
test_canonical_order_does_not_change_identity_and_extra_fields_do (__main__.Checks) ... ok
test_every_protocol_field_is_bound (__main__.Checks) ... ok
test_exact_original_workload_requires_eighteen_gb (__main__.Checks) ... ok
test_only_admission_and_fixture_delivery_changed_in_driver (__main__.Checks) ... ok
test_ordinary_small_profile_keeps_original_admission (__main__.Checks) ... ok
test_real_driver_reaches_quiet_boundary_before_any_model_launch (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 1.064s

OK

````````````

## Artifact SHA-256 cb7fdf1f8743ca6eaac910c710c9ec86cb488dac9a2100a14527b594361a6c12

Encoding: `utf-8`. Original bytes: 388.

````````````text
test_all_seven_native_proofs_are_retained (__main__.Checks) ... ok
test_incomplete_matrix_cannot_qualify_or_freeze (__main__.Checks) ... ok
test_missing_paired_or_consumed_legacy_cannot_hide (__main__.Checks) ... ok
test_original_run_report_and_guards_remain_exact (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 4 tests in 0.733s

OK

````````````

## Artifact SHA-256 9ddaf67a963caf11ce020344d2923fb9c20349c93c7cbbe0d4316dc5f6bf4f3a

Encoding: `utf-8`. Original bytes: 136.

````````````text
{
  "frozen": "on",
  "binding_sha256": "8b9cd77c30a52a02c7726a649afcc561571f43204aed2f8e3d660eff91d9fe10",
  "model_launched": false
}

````````````

## Artifact SHA-256 8b9cd77c30a52a02c7726a649afcc561571f43204aed2f8e3d660eff91d9fe10

Encoding: `gzip+base64`. Original bytes: 240846.

````````````text
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
````````````

## Artifact SHA-256 1b06d9c115ee57b2b77f26602e032f71bc2428df8efc807aa2949cbc5de06824

Encoding: `utf-8`. Original bytes: 4363.

````````````text
"""Correct the unrun readiness evidence bound for real polling overhead."""
from pathlib import Path
import hashlib
import json
import shutil

BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
PRIOR = BASE / 'final-mtp-cooled-cohort-v624'
read = lambda p: json.loads(p.read_text())
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
assert not (PRIOR / 'on/execution').exists()
assert not Path('/Users/carlos/Projects/slotstream/.build/optimization/final-mtp-cooled-cohort-v624').exists()
assert not (HERE / 'run.py').exists()
for name in ('run.py', 'run_test.py', 'final_checks.py', 'thermal_checks.py',
             'schedule_checks.py', 'delivery_checks.py', 'startup_checks.py',
             'thermal_settle.py', 'driver-transformation.json', 'schedule-transformation.json',
             'delivery-profile.json', 'cooling_checks.py', 'cooling-transformation.json'):
    shutil.copyfile(PRIOR / name, HERE / name)
(HERE / 'driver').mkdir()
for name in ('serve_bench.py', 'prefill_bench.py', 'thermal_settle.py'):
    shutil.copyfile(PRIOR / 'driver' / name, HERE / 'driver' / name)
changes = []
path = HERE / 'run.py'
source = path.read_text()
for old, new in (
    ("OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'",
     "OUT = ROOT / '.build/optimization/final-mtp-cooled-evidence-v627'"),
    ('and type(samples) is int and samples >= 61', 'and type(samples) is int and samples >= 31'),
    ("('startup', 6), ('cooling', 4)]", "('startup', 6), ('cooling', 5)]"),
    ("    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
     "    paths += [HERE / 'sample-evidence-correction.json',\n"
     "              BASE / 'final-mtp-startup-readiness-v618/result.json']\n"
     "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"),
):
    assert source.count(old) == 1
    source = source.replace(old, new, 1)
    changes.append({'old': old, 'new': new})
path.write_text(source)
record = read(HERE / 'schedule-transformation.json')
record['run_edits'].extend(changes)
(HERE / 'schedule-transformation.json').write_text(json.dumps(record, indent=2) + '\n')
path = HERE / 'schedule_checks.py'
source = path.read_text()
assert source.count("('samples', 60)") == 1
path.write_text(source.replace("('samples', 60)", "('samples', 30)", 1))
path = HERE / 'cooling_checks.py'
source = path.read_text()
marker = "    def test_actual_failed_thermal_row_remains_ineligible(self):"
assert source.count(marker) == 1
source = source.replace(marker,
    "    def test_real120_second_observation_with_poll_overhead_is_valid(self):\n"
    "        import schedule_checks\n"
    "        state = runner.c.read(runner.BASE / 'final-mtp-startup-readiness-v618/result.json')\n"
    "        self.assertGreaterEqual(state['sampled_nominal_seconds'], 120)\n"
    "        self.assertEqual(state['samples'], 60)\n"
    "        rows = [{'cooldown_seconds': 60, 'thermal_settle': state} for _ in range(32)]\n"
    "        runner.validate_schedule_evidence(schedule_checks.manifest(), rows)\n\n"
    + marker, 1)
path.write_text(source)
record = {
    'classification': 'Prelaunch evidence validation correction only; V624 was frozen but never attempted. The same 60+120-second protocol is preserved.',
    'counterexample': read(BASE / 'final-mtp-startup-readiness-v618/result.json'),
    'reason': 'Two-second sleeps also spend time collecting observations. A valid 121.36-second stable interval had 60 samples. Requiring 61 would falsely reject the completed cohort.',
    'bound': 'The unchanged helper resets stability on a gap greater than twice the two-second poll. A 120-second stable interval therefore requires at least 31 samples, not exactly 61.',
    'stable_seconds': 120, 'maximum_allowed_sample_gap_seconds': 4, 'minimum_samples': 31,
    'run_changes': changes,
    'prior_frozen_binding_sha256': digest(PRIOR / 'on/binding.json'),
    'prior_attempted': False, 'actual_protocol_unchanged': True,
    'model_launched': False, 'activation_performed': False,
}
(HERE / 'sample-evidence-correction.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps({k: record[k] for k in ('classification', 'stable_seconds', 'minimum_samples',
                                      'prior_attempted', 'actual_protocol_unchanged')}, indent=2))

````````````

## Artifact SHA-256 b93ef8a81af8d286ae75389b2a13c4efd70ddc764d18f2660292fa2e67ab2c58

Encoding: `utf-8`. Original bytes: 119.

````````````text
....................
----------------------------------------------------------------------
Ran 20 tests in 8.378s

OK

````````````

## Artifact SHA-256 960bab0de275589107218001d6af9b5d59ab5d5c67a4f7d9f51c4de87dfc8edc

Encoding: `utf-8`. Original bytes: 18776.

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
OUT = ROOT / '.build/optimization/final-mtp-cooled-evidence-v627'
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
    result['between_cells_seconds'] = 60
    result['before_cell_thermal_settle'] = {
        'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2}
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
    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']
    paths += [HERE / 'cooling_checks.py', HERE / 'cooling-transformation.json',
              BASE / 'final-mtp-thermal-stop-v623/result.json']
    paths += [HERE / 'sample-evidence-correction.json',
              BASE / 'final-mtp-startup-readiness-v618/result.json']
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
    for name, count in [('run', 20), ('final', 4), ('thermal', 13), ('schedule', 6), ('delivery', 6), ('startup', 6), ('cooling', 5)]:
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
        require(row.get('cooldown_seconds') == 60 and all(state.get(key) is True
                for key in ('enabled', 'reserved', 'before_launch_only', 'request_acceptance_unchanged')),
                'sampled readiness missing or bypassed')
        elapsed, stable, samples = (state.get(key) for key in
                                    ('seconds', 'sampled_nominal_seconds', 'samples'))
        require(type(elapsed) in (int, float) and type(stable) in (int, float)
                and 120 <= stable <= elapsed <= 600
                and type(samples) is int and samples >= 31,
                'readiness stability or bounded observation evidence is invalid')


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 d20bfd36535fc115cb870e60a4e14482fc815224f0e46b3647af1e5caab7c15e

Encoding: `utf-8`. Original bytes: 1844.

````````````text
{
  "classification": "Prelaunch evidence validation correction only; V624 was frozen but never attempted. The same 60+120-second protocol is preserved.",
  "counterexample": {
    "enabled": true,
    "reserved": true,
    "seconds": 121.386685,
    "sampled_nominal_seconds": 121.357627083,
    "samples": 60,
    "before_launch_only": true,
    "request_acceptance_unchanged": true
  },
  "reason": "Two-second sleeps also spend time collecting observations. A valid 121.36-second stable interval had 60 samples. Requiring 61 would falsely reject the completed cohort.",
  "bound": "The unchanged helper resets stability on a gap greater than twice the two-second poll. A 120-second stable interval therefore requires at least 31 samples, not exactly 61.",
  "stable_seconds": 120,
  "maximum_allowed_sample_gap_seconds": 4,
  "minimum_samples": 31,
  "run_changes": [
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-cooled-evidence-v627'"
    },
    {
      "old": "and type(samples) is int and samples >= 61",
      "new": "and type(samples) is int and samples >= 31"
    },
    {
      "old": "('startup', 6), ('cooling', 4)]",
      "new": "('startup', 6), ('cooling', 5)]"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'sample-evidence-correction.json',\n              BASE / 'final-mtp-startup-readiness-v618/result.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    }
  ],
  "prior_frozen_binding_sha256": "acc07b25ddaa6562633da39195ed236d7c19ad89a16e06af952a3a8a4bec2dca",
  "prior_attempted": false,
  "actual_protocol_unchanged": true,
  "model_launched": false,
  "activation_performed": false
}

````````````

## Artifact SHA-256 173c7e139bec9ef4116f1dea625631265b71bf2cf90508be1ff033e6b5ea5c65

Encoding: `utf-8`. Original bytes: 574.

````````````text
test_actual_driver_and_helper_bytes_are_checked_and_bound (__main__.Checks) ... ok
test_all_cells_need_full_stable_evidence (__main__.Checks) ... ok
test_only_two_scheduling_fields_differ_from_both_unrun_drafts (__main__.Checks) ... ok
test_original_raw_assessor_is_not_reached_if_readiness_is_missing (__main__.Checks) ... ok
test_original_request_and_cleanup_bodies_restore_exactly (__main__.Checks) ... ok
test_schedule_cannot_drift_or_be_disabled (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 2.309s

OK

````````````

## Artifact SHA-256 15b00b7e02b8ee795c67a48c463e3d9c77b253c69911a34637beed4b3036ce0d

Encoding: `utf-8`. Original bytes: 9528.

````````````text
{
  "classification": "Fresh full MTP-on cohort after verified thermal stop; original 60-second quiet cooldown followed by 120 sampled nominal seconds before every model launch. Work, timing eligibility and all hard stops stay intact.",
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
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-delivery-v609'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'"
    },
    {
      "old": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json']\n",
      "new": "    paths += [HERE / 'delivery_checks.py', HERE / 'delivery-profile.json', HERE / 'startup_checks.py']\n"
    },
    {
      "old": "('schedule', 6), ('delivery', 6)]",
      "new": "('schedule', 6), ('delivery', 6), ('startup', 6)]"
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-long-startup-v616'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'"
    },
    {
      "old": "result['between_cells_seconds'] = 0",
      "new": "result['between_cells_seconds'] = 60"
    },
    {
      "old": "'stable_seconds': 30, 'maximum_wait_seconds': 600, 'poll_seconds': 2",
      "new": "'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2"
    },
    {
      "old": "require(row.get('cooldown_seconds') == 0",
      "new": "require(row.get('cooldown_seconds') == 60"
    },
    {
      "old": "and 30 <= stable <= elapsed <= 600",
      "new": "and 120 <= stable <= elapsed <= 600"
    },
    {
      "old": "and type(samples) is int and samples >= 16",
      "new": "and type(samples) is int and samples >= 61"
    },
    {
      "old": "('delivery', 6), ('startup', 6)]",
      "new": "('delivery', 6), ('startup', 6), ('cooling', 4)]"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'cooling_checks.py', HERE / 'cooling-transformation.json',\n              BASE / 'final-mtp-thermal-stop-v623/result.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    },
    {
      "old": "OUT = ROOT / '.build/optimization/final-mtp-cooled-cohort-v624'",
      "new": "OUT = ROOT / '.build/optimization/final-mtp-cooled-evidence-v627'"
    },
    {
      "old": "and type(samples) is int and samples >= 61",
      "new": "and type(samples) is int and samples >= 31"
    },
    {
      "old": "('startup', 6), ('cooling', 4)]",
      "new": "('startup', 6), ('cooling', 5)]"
    },
    {
      "old": "    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n",
      "new": "    paths += [HERE / 'sample-evidence-correction.json',\n              BASE / 'final-mtp-startup-readiness-v618/result.json']\n    return {str(p): digest(p) for p in sorted({p.resolve() for p in paths})}\n"
    }
  ],
  "original_serving_driver_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "original_reporter_sha256": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820",
  "original_startup_swapin_rule_unchanged": false,
  "all_requests_acceptance_and_full_allowances_preserved": true,
  "model_launched": false,
  "maximum_ideal_idle_saving_seconds_both_modes": null,
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
    "legacy_startup_swap_abort_unchanged": false
  },
  "startup_method_correction": {
    "original_reporter_and_pair_exclusions_unchanged": true,
    "startup_swapins": "exclude entire A/B pair while completing the fixed workload",
    "swapouts_pressure_footprint": "abort unchanged",
    "partial_prior_not_reused": true
  },
  "previous_schedule": "/tmp/slotstream-optimization-execution/final-mtp-long-startup-v616/on/protocol.json",
  "previous_failed_qualification_sha256": "17eaa6d2a4f865f60d82d828158ac92101a3561f765f3f335e2df037886289c3"
}

````````````

## Artifact SHA-256 fd4793226be878485bf63db67045630d6d67a1ab29191b9884cabed61761305e

Encoding: `utf-8`. Original bytes: 5713.

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
    return [{'cooldown_seconds': 60, 'thermal_settle': {
        'enabled': True, 'reserved': True, 'before_launch_only': True,
        'request_acceptance_unchanged': True, 'seconds': 120.1,
        'sampled_nominal_seconds': 120.1, 'samples': 61}}
        for _ in range(32)]


class Checks(unittest.TestCase):
    def test_only_two_scheduling_fields_differ_from_both_unrun_drafts(self):
        for mode in ('off', 'on'):
            current = m.expected_protocol(mode)
            self.assertEqual(current.pop('before_cell_thermal_settle'), {
                'stable_seconds': 120, 'maximum_wait_seconds': 600, 'poll_seconds': 2})
            self.assertEqual(current['between_cells_seconds'], 60)
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
                             ('seconds', float('nan')), ('sampled_nominal_seconds', 119.99),
                             ('sampled_nominal_seconds', 121), ('samples', 30), ('samples', True)]:
            bad = rows(); bad[-1]['thermal_settle'][field] = value
            with self.subTest(field=field, value=value), self.assertRaises(ValueError):
                m.validate_schedule_evidence(manifest(), bad)
        for bad in (rows()[:-1], rows() + rows()[:1], [{**row, 'cooldown_seconds': 0} for row in rows()]):
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

## Artifact SHA-256 0d5b5b263792591343c4baabe1008b9ff16610be2901fb6175d24949c2fbf8a8

Encoding: `utf-8`. Original bytes: 575.

````````````text
test_exact_profile_can_finish_work_but_startup_swapins_remain_ineligible (__main__.Checks) ... ok
test_new_swapouts_still_abort (__main__.Checks) ... ok
test_original_joint_assessor_excludes_the_pair_and_still_checks_its_outputs (__main__.Checks) ... ok
test_original_physical_and_pressure_stops_remain (__main__.Checks) ... ok
test_other_profiles_keep_the_legacy_startup_abort (__main__.Checks) ... ok
test_unavailable_invalid_or_reset_counters_abort (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 1.090s

OK

````````````

## Artifact SHA-256 79a7d8246fac380583ffabf0a122501de1aa9875b2e4d9c5b060786d8fbe6471

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
Ran 13 tests in 0.089s

OK

````````````
