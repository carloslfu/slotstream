---
type: run
id: 01m1tk9y4q911rxxbm9h823v5g
created: 2026-09-06T05:33:20.919664+00:00
updated: 2026-09-06T05:33:21.047429+00:00
summary: CI exposes a fixed-time interruption fixture; state-based cancellation and delayed-start compressed/raw checks pass.
binary: f121e5ca87aea710da3197334d49bf9a8d40512bb3161dc6183c31313b28507c
captured_at: 2026-09-06
command: gh run view --log-failed; python3 Tools/slotpack/checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Lossless-download CI interruption fixture correction
tool: GitHub Actions logs and native Swift/C download fixtures
---
# CI interruption-fixture counterexample and correction

The v0.2.9 release attempt at e9173521d104d69412883aceee715ba146729b23 began with a clean build and passed codec/manifest checks, but its interruption fixture assumed a chunk would be committed within 0.8 seconds. Both public CI runners canceled before that state was reached and failed the partial-progress assertion. No release asset was published. The failed tag is preserved; the corrected candidate is v0.2.10.

The fixture now cancels only after observing durable progress, holds other requests until cancellation, and explicitly waits for the competing directory writer to acquire its lease. Compressed and raw interruption fixtures intentionally delay startup by 1.2 seconds to exceed the old timer. Watchdogs bound failures. This changes test control only; production download, codec, resume, pin, and concurrency code is unchanged from the fully qualified e917352 candidate. The sole subsequent production change is the version string.

Public counterexamples: https://github.com/carloslfu/slotstream/actions/runs/34013070148 and https://github.com/carloslfu/slotstream/actions/runs/34013070801. The raw failing step logs and complete corrected local gate receipts follow. CI, publication, provenance, and installed acceptance of v0.2.10 follow separately.

## main-ci-failed.log

SHA-256: `590c608eb14da412c2c64c10da30d88b8fd4cddcfa7533cee8c626d63c61a8d3`

```text
weights-free	static and runtime safety gates	﻿2026-09-06T05:11:07.5356390Z ##[group]Run Tools/static_gates.sh
weights-free	static and runtime safety gates	2026-09-06T05:11:07.5356920Z ^[[36;1mTools/static_gates.sh^[[0m
weights-free	static and runtime safety gates	2026-09-06T05:11:07.5391820Z shell: /bin/bash -e {0}
weights-free	static and runtime safety gates	2026-09-06T05:11:07.5392150Z ##[endgroup]
weights-free	static and runtime safety gates	2026-09-06T05:11:07.9078700Z coverage ratchet checks pass
weights-free	static and runtime safety gates	2026-09-06T05:11:07.9507530Z llms-full.txt is current
weights-free	static and runtime safety gates	2026-09-06T05:11:08.0833600Z 0 issue(s): 0 error(s), 0 warning(s), 0 info
weights-free	static and runtime safety gates	2026-09-06T05:11:08.1160450Z MEASUREMENTS.md is current
weights-free	static and runtime safety gates	2026-09-06T05:11:08.1183380Z PLAN.md is current
weights-free	static and runtime safety gates	2026-09-06T05:11:08.1541580Z claims gate: 84 needle checks, 0 failures
weights-free	static and runtime safety gates	2026-09-06T05:11:08.1573260Z BRAIN GATES PASS
weights-free	static and runtime safety gates	2026-09-06T05:11:08.2042710Z dequant_row.txt: OK
weights-free	static and runtime safety gates	2026-09-06T05:11:08.2102110Z layer_0.bin: OK
weights-free	static and runtime safety gates	2026-09-06T05:11:08.2102800Z layer_1.bin: OK
weights-free	static and runtime safety gates	2026-09-06T05:11:08.2103140Z layer_2.bin: OK
weights-free	static and runtime safety gates	2026-09-06T05:11:08.2103380Z layer_3.bin: OK
weights-free	static and runtime safety gates	2026-09-06T05:11:08.2103960Z ngram_ids.txt: OK
weights-free	static and runtime safety gates	2026-09-06T05:11:08.2104340Z tokens.txt: OK
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3983730Z PASS  process physical footprint is readable
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3984620Z PASS  process RSS high-water is readable
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3986110Z PASS  prefix cache reaches its four-entry bound
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3987190Z PASS  an identical history replaces instead of duplicating an entry
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3987630Z PASS  a miss evicts before allocating a fifth state
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3987990Z PASS  a smaller live token ceiling evicts immediately
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3988440Z PASS  held GB includes fixed recurrent state
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3988770Z PASS  identical bytes hash alike
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3989060Z PASS  different bytes do not
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3989520Z PASS  the same image at the same offset matches
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3989860Z PASS  a swapped image does not
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3990360Z PASS  an entry ending inside a run still matches that run
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3990810Z PASS  a text-only entry rejects a prompt with an image inside its range
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3991310Z PASS  an image beyond the entry's range is irrelevant to the match
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3991700Z PASS  a vision conversation is held, not discarded
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3992720Z PASS  the same ids with a different picture miss
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3993190Z PASS  the text-only splice never sees a vision entry
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3993620Z PASS  prefix splice chooses the longest retained extension
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3994670Z PASS  prefix splice is strict, not an identical-history match
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3995410Z PASS  prefix splice lookup does not consume the retained state
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3995870Z PASS  a disabled prefix cache offers no splice
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3996220Z PASS  shard listing works through a symlinked model dir
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3996700Z PASS  8.1 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3997030Z PASS  10.0 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3997430Z PASS  16.0 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3997720Z PASS  30.0 GB plan stays inside its target
weights-free	static and runtime safety gates	2026-09-06T05:11:08.3998070Z RUNTIME CHECK PASS
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4247320Z PASS  matching file is accepted
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4248020Z PASS  same-size corruption is rejected
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4248590Z PASS  exact Content-Range is accepted
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4250200Z PASS  wrong range start is rejected
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4250770Z PASS  wrong range total is rejected
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4251190Z PASS  unknown range total is rejected
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4251650Z PASS  every pinned file has a digest
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4252820Z PASS  the draft head is pinned as the one optional file
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4253560Z PASS  an absent optional file is not a repair; an absent required one is
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4254180Z PASS  an empty directory reads as missing
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4254550Z PASS  missing needs the required model
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4255080Z PASS  status carries free disk
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4255460Z PASS  bytesToFetch agrees with required files
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4255900Z PASS  a missing copy is not ready
weights-free	static and runtime safety gates	2026-09-06T05:11:08.4256180Z PULL CHECK PASS
weights-free	static and runtime safety gates	2026-09-06T05:11:17.4967080Z {"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
weights-free	static and runtime safety gates	2026-09-06T05:11:31.0953810Z MANIFEST CHECKS PASS
weights-free	static and runtime safety gates	2026-09-06T05:12:15.9543710Z {"name": "normal", "pass_": true, "seconds": 0.131, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.0301280Z {"name": "redirect", "pass_": true, "seconds": 0.076, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.1029480Z {"name": "bad-object-fallback", "pass_": true, "seconds": 0.073, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.1603530Z {"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.057, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.1792280Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.019, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.2023080Z {"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.023, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.2728790Z {"name": "optional-absent", "pass_": true, "seconds": 0.07, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.3441550Z {"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.071, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.3622940Z {"name": "bad-object-fails", "pass_": true, "seconds": 0.018, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T05:12:16.4335870Z {"name": "retry-after", "pass_": true, "seconds": 0.071, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:21.8702910Z {"name": "transient-retry", "pass_": true, "seconds": 5.434, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:12:33.6166230Z {"name": "wrong-length-fallback", "pass_": true, "seconds": 11.74, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:13:09.7486660Z {"name": "short-body-fallback", "pass_": true, "seconds": 36.114, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:13:45.7962890Z {"name": "content-encoding-fallback", "pass_": true, "seconds": 36.029, "returncode": 0}
weights-free	static and runtime safety gates	2026-09-06T05:13:46.8964080Z {"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.099, "returncode": 1}
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9271140Z Traceback (most recent call last):
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9310410Z   File "/Users/runner/work/slotstream/slotstream/Tools/slotpack/checks.py", line 32, in <module>
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9312710Z     if __name__ == '__main__': main()
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9313760Z                                ~~~~^^
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9323140Z   File "/Users/runner/work/slotstream/slotstream/Tools/slotpack/checks.py", line 26, in main
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9324120Z     download_checks.run()
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9324580Z     ~~~~~~~~~~~~~~~~~~~^^
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9325600Z   File "/Users/runner/work/slotstream/slotstream/Tools/slotpack/download_checks.py", line 150, in run
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9327120Z     state=json.loads((resumed/'.slotpack-state.json').read_text());assert 0<sum(state['done'])<len(state['done'])
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9328550Z                                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9329470Z AssertionError
weights-free	static and runtime safety gates	2026-09-06T05:13:46.9603890Z ##[error]Process completed with exit code 1.
```

## release-ci-failed.log

SHA-256: `3ad2597974c7c8065ad4010630d41db1b93c528a424b8dac69050c857c7b494c`

```text
build	static gates — planner, brain, installer (no weights needed)	﻿2026-09-06T05:12:45.0342360Z ##[group]Run Tools/static_gates.sh
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.0342770Z ^[[36;1mTools/static_gates.sh^[[0m
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.0386330Z shell: /bin/bash -e {0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.0386700Z ##[endgroup]
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.5717660Z coverage ratchet checks pass
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.6561490Z llms-full.txt is current
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.8815200Z 0 issue(s): 0 error(s), 0 warning(s), 0 info
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.9303870Z MEASUREMENTS.md is current
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:45.9304640Z PLAN.md is current
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.0048830Z claims gate: 84 needle checks, 0 failures
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.0112910Z BRAIN GATES PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1076860Z dequant_row.txt: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1113340Z layer_0.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1149270Z layer_1.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1174650Z layer_2.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1206000Z layer_3.bin: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1209640Z ngram_ids.txt: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1212670Z tokens.txt: OK
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1744080Z PASS  process physical footprint is readable
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1746410Z PASS  process RSS high-water is readable
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1747550Z PASS  prefix cache reaches its four-entry bound
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1748640Z PASS  an identical history replaces instead of duplicating an entry
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1749850Z PASS  a miss evicts before allocating a fifth state
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1750790Z PASS  a smaller live token ceiling evicts immediately
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1751710Z PASS  held GB includes fixed recurrent state
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1752530Z PASS  identical bytes hash alike
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1752950Z PASS  different bytes do not
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1754180Z PASS  the same image at the same offset matches
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1754740Z PASS  a swapped image does not
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1755750Z PASS  an entry ending inside a run still matches that run
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1756860Z PASS  a text-only entry rejects a prompt with an image inside its range
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1757680Z PASS  an image beyond the entry's range is irrelevant to the match
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1758070Z PASS  a vision conversation is held, not discarded
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1758480Z PASS  the same ids with a different picture miss
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1758770Z PASS  the text-only splice never sees a vision entry
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1759220Z PASS  prefix splice chooses the longest retained extension
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1759670Z PASS  prefix splice is strict, not an identical-history match
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1760120Z PASS  prefix splice lookup does not consume the retained state
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1760470Z PASS  a disabled prefix cache offers no splice
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1760810Z PASS  shard listing works through a symlinked model dir
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1761210Z PASS  8.1 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1761530Z PASS  10.0 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1761910Z PASS  16.0 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1762230Z PASS  30.0 GB plan stays inside its target
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.1762520Z RUNTIME CHECK PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2149160Z PASS  matching file is accepted
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2151820Z PASS  same-size corruption is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2152470Z PASS  exact Content-Range is accepted
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2152870Z PASS  wrong range start is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2153220Z PASS  wrong range total is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2153610Z PASS  unknown range total is rejected
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2154080Z PASS  every pinned file has a digest
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2154470Z PASS  the draft head is pinned as the one optional file
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2155370Z PASS  an absent optional file is not a repair; an absent required one is
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2162900Z PASS  an empty directory reads as missing
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2163330Z PASS  missing needs the required model
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2163550Z PASS  status carries free disk
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2163800Z PASS  bytesToFetch agrees with required files
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2164050Z PASS  a missing copy is not ready
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:46.2164330Z PULL CHECK PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:12:58.4091900Z {"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:13:25.5035110Z MANIFEST CHECKS PASS
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:16.6028590Z {"name": "normal", "pass_": true, "seconds": 0.155, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:16.7059630Z {"name": "redirect", "pass_": true, "seconds": 0.103, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:16.8157100Z {"name": "bad-object-fallback", "pass_": true, "seconds": 0.11, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:16.9249540Z {"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.109, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:16.9555770Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.03, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:16.9868200Z {"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.031, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:17.0918940Z {"name": "optional-absent", "pass_": true, "seconds": 0.105, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:17.2125050Z {"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.12, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:17.2408390Z {"name": "bad-object-fails", "pass_": true, "seconds": 0.028, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:17.3587380Z {"name": "retry-after", "pass_": true, "seconds": 0.118, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:22.6195550Z {"name": "transient-retry", "pass_": true, "seconds": 5.261, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:14:34.4058930Z {"name": "wrong-length-fallback", "pass_": true, "seconds": 11.786, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:10.5219220Z {"name": "short-body-fallback", "pass_": true, "seconds": 36.115, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:46.7151520Z {"name": "content-encoding-fallback", "pass_": true, "seconds": 36.193, "returncode": 0}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.5943990Z {"name": "cancel-preserves-progress", "pass_": true, "seconds": 0.879, "returncode": 1}
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6198240Z Traceback (most recent call last):
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6224080Z   File "/Users/runner/work/slotstream/slotstream/Tools/slotpack/checks.py", line 32, in <module>
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6225330Z     if __name__ == '__main__': main()
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6226360Z                                ~~~~^^
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6227490Z   File "/Users/runner/work/slotstream/slotstream/Tools/slotpack/checks.py", line 26, in main
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6228840Z     download_checks.run()
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6229540Z     ~~~~~~~~~~~~~~~~~~~^^
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6230680Z   File "/Users/runner/work/slotstream/slotstream/Tools/slotpack/download_checks.py", line 150, in run
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6233570Z     state=json.loads((resumed/'.slotpack-state.json').read_text());assert 0<sum(state['done'])<len(state['done'])
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6235310Z                                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6236390Z AssertionError
build	static gates — planner, brain, installer (no weights needed)	2026-09-06T05:15:47.6469820Z ##[error]Process completed with exit code 1.
```

## state-driven-delayed-checks.log

SHA-256: `72f79890418898030d896d1364f5a96e79a1b8fd981c15120bead7d5179e4585`

```text
{"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
MANIFEST CHECKS PASS
{"name": "normal", "pass_": true, "seconds": 0.263, "returncode": 0}
{"name": "redirect", "pass_": true, "seconds": 0.034, "returncode": 0}
{"name": "bad-object-fallback", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.012, "returncode": 1}
{"name": "optional-absent", "pass_": true, "seconds": 0.025, "returncode": 0}
{"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.024, "returncode": 0}
{"name": "bad-object-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "retry-after", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "transient-retry", "pass_": true, "seconds": 5.546, "returncode": 0}
{"name": "wrong-length-fallback", "pass_": true, "seconds": 11.341, "returncode": 0}
{"name": "short-body-fallback", "pass_": true, "seconds": 36.241, "returncode": 0}
{"name": "content-encoding-fallback", "pass_": true, "seconds": 35.98, "returncode": 0}
{"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.471, "returncode": 1}
{"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.025, "returncode": 1}
{"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "resume", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "already-installed", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.013, "returncode": 0}
{"name": "corruption-seed", "pass_": true, "seconds": 0.025, "returncode": 0}
{"name": "same-size-final-repair", "pass_": true, "seconds": 0.018, "returncode": 0}
{"name": "invalid-resume-map", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "part-symlink-rejected", "pass_": true, "seconds": 0.006, "returncode": 1}
{"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-fifo-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
ALL HTTP CHECKS PASS
{"name": "raw-multichunk", "pass_": true, "seconds": 0.702, "returncode": 0}
{"name": "raw-installed-no-http", "pass_": true, "seconds": 0.267, "returncode": 0}
{"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.344, "returncode": 0}
{"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.343, "returncode": 0}
{"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 40.876, "returncode": 0}
{"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.331, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.023, "returncode": 1}
{"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.164, "returncode": 1}
{"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.208, "returncode": 0}
{"name": "raw-cancel", "pass_": true, "seconds": 3.312, "returncode": 1}
{"name": "raw-resume", "pass_": true, "seconds": 0.328, "returncode": 0}
{"name": "raw-same-size-repair", "pass_": true, "seconds": 0.448, "returncode": 0}
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 320405504 bytes peak RSS
SLOTPACK GATES PASS
```

## manifest-checks.json

```json
{
  "checks": [
    "embedded manifest and original pins agree",
    "new installs have a public compressed source",
    "C encoder accepts Swift data",
    "Swift C roundtrip is exact",
    "manifest hash is mandatory",
    "pinned file identity cannot change",
    "unknown version",
    "empty object list",
    "invalid size=9223372036854775807",
    "invalid rawSize=9223372036854775807",
    "invalid rawSize=0",
    "invalid size=0",
    "overlapping ranges",
    "range escapes file",
    "range references unknown file",
    "path traversal",
    "compressed corruption",
    "reconstruction digest is mandatory",
    "trial starts at 16",
    "plateau rolls back to 8",
    "useful gain trials 32",
    "cap stays at 32",
    "CPU backlog or retries stops expansion",
    "CPU backlog or retries stops expansion",
    "original public API signatures remain available",
    "public synchronous log lifetime closes on cancellation",
    "disk space checked before creating large parts"
  ],
  "pass": true
}
```

## download-checks.json

```json
{
  "pass_": true,
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901"
    },
    "binarySHA256": "fe30a2a71c111e5e695b751de14ef6d40dcec6240ca5b5f2d406b390dc18f6d4"
  },
  "checks": [
    {
      "name": "normal",
      "pass_": true,
      "seconds": 0.263,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "redirect",
      "pass_": true,
      "seconds": 0.034,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fallback",
      "pass_": true,
      "seconds": 0.03,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "missing-object-raw-fallback",
      "pass_": true,
      "seconds": 0.029,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 18 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.013,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadHTTPError(status: 206, retryAfter: nil)\n"
    },
    {
      "name": "raw-ignored-range-fails",
      "pass_": true,
      "seconds": 0.012,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadHTTPError(status: 200, retryAfter: nil)\n"
    },
    {
      "name": "optional-absent",
      "pass_": true,
      "seconds": 0.025,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified config.json\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "optional-corrupt-and-unavailable",
      "pass_": true,
      "seconds": 0.024,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fails",
      "pass_": true,
      "seconds": 0.013,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "compressed object digest mismatch\n"
    },
    {
      "name": "retry-after",
      "pass_": true,
      "seconds": 0.027,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "transient-retry",
      "pass_": true,
      "seconds": 5.546,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.1 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 5.5 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "wrong-length-fallback",
      "pass_": true,
      "seconds": 11.341,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified mtp.safetensors\n100.0% verified \u00b7 2.2 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\nverified config.json\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 11.3 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "short-body-fallback",
      "pass_": true,
      "seconds": 36.241,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 1.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\n94.1% verified \u00b7 0.9 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 36.2 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "content-encoding-fallback",
      "pass_": true,
      "seconds": 35.98,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified weights.safetensors\nverified biases.bin\nverified scales.bin\n94.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 36.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cancel-preserves-progress",
      "pass_": true,
      "seconds": 1.471,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "damaged-resumed-chunk-rejected",
      "pass_": true,
      "seconds": 0.025,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified scales.bin\n",
      "stderr": "PullIntegrityError(file: \"weights.safetensors\")\n"
    },
    {
      "name": "damaged-resumed-chunk-repair",
      "pass_": true,
      "seconds": 0.026,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "resume",
      "pass_": true,
      "seconds": 0.026,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified biases.bin\nverified scales.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "already-installed",
      "pass_": true,
      "seconds": 0.014,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "valid-symlinks-reused",
      "pass_": true,
      "seconds": 0.013,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "corruption-seed",
      "pass_": true,
      "seconds": 0.025,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified weights.safetensors\nverified biases.bin\nverified scales.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "same-size-final-repair",
      "pass_": true,
      "seconds": 0.018,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\n1 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "invalid-resume-map",
      "pass_": true,
      "seconds": 0.027,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "forged-complete-map-without-parts",
      "pass_": true,
      "seconds": 0.028,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "oversized-map-is-discarded",
      "pass_": true,
      "seconds": 0.028,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified mtp.safetensors\nverified config.json\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "part-symlink-rejected",
      "pass_": true,
      "seconds": 0.006,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot create partial file: weights.safetensors\n"
    },
    {
      "name": "part-hardlink-rejected",
      "pass_": true,
      "seconds": 0.005,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot size partial file: weights.safetensors\n"
    },
    {
      "name": "part-fifo-rejected",
      "pass_": true,
      "seconds": 0.005,
      "returncode": 1,
      "stdout": "",
      "stderr": "cannot create partial file: weights.safetensors\n"
    },
    {
      "name": "concurrent-writer-rejected",
      "pass_": true,
      "seconds": 0.005,
      "returncode": 1,
      "stdout": "",
      "stderr": "another download is already writing this directory\n"
    }
  ],
  "requests": 630
}
```

## raw-checks.json

```json
{
  "pass_": true,
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901"
    },
    "binarySHA256": "68f40d9ece9abbe56cb59f0ecb260e90cd3cc59f09ec2ec70ecd1e0ad2778bfe"
  },
  "checks": [
    {
      "name": "raw-multichunk",
      "pass_": true,
      "seconds": 0.702,
      "returncode": 0,
      "stdout": "verified config.json\n  4 connections in use\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-installed-no-http",
      "pass_": true,
      "seconds": 0.267,
      "returncode": 0,
      "stdout": "HARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-missing",
      "pass_": true,
      "seconds": 0.344,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-wrong-range",
      "pass_": true,
      "seconds": 0.343,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-encoding",
      "pass_": true,
      "seconds": 40.876,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\n0.2/0.4 GB verified chunks | 9.2 MB/s received | ETA 18 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 8.4 MB/s received | ETA 20 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 7.2 MB/s received | ETA 23 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.3 MB/s received | ETA 27 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.0 MB/s received | ETA 28 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.6 MB/s received | ETA 30 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.1 MB/s received | ETA 33 s | 2 file(s) left\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-ignore-range",
      "pass_": true,
      "seconds": 0.331,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.023,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "weights.safetensors: download failed from all 1 source(s) (invalid Content-Range) \u2014 rerun `slotstream pull` to resume\n"
    },
    {
      "name": "raw-corrupt-final-rejected",
      "pass_": true,
      "seconds": 0.164,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "PullIntegrityError(file: \"config.json\")\n"
    },
    {
      "name": "raw-optional-inflight-writers",
      "pass_": true,
      "seconds": 0.208,
      "returncode": 0,
      "stdout": "verified config.json\nskip mtp.safetensors: unavailable from every source; optional\n  4 connections in use\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-cancel",
      "pass_": true,
      "seconds": 3.312,
      "returncode": 1,
      "stdout": "0.1/0.4 GB verified chunks | 33.5 MB/s received | ETA measuring | 3 file(s) left\n  4 connections in use\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "raw-resume",
      "pass_": true,
      "seconds": 0.328,
      "returncode": 0,
      "stdout": "verified config.json\n  4 connections in use\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-same-size-repair",
      "pass_": true,
      "seconds": 0.448,
      "returncode": 0,
      "stdout": "  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    }
  ]
}
```

## memory-checks.json

```json
{
  "pass_": true,
  "bytes": 6442450944,
  "objects": 768,
  "peakRSSBytes": 320405504,
  "samples": [
    {
      "seconds": 0.003,
      "rssBytes": 32768
    },
    {
      "seconds": 0.221,
      "rssBytes": 32768
    },
    {
      "seconds": 0.429,
      "rssBytes": 177324032
    },
    {
      "seconds": 0.643,
      "rssBytes": 196902912
    },
    {
      "seconds": 0.857,
      "rssBytes": 202391552
    },
    {
      "seconds": 1.062,
      "rssBytes": 206815232
    },
    {
      "seconds": 1.28,
      "rssBytes": 217579520
    },
    {
      "seconds": 1.491,
      "rssBytes": 217694208
    },
    {
      "seconds": 1.698,
      "rssBytes": 319930368
    },
    {
      "seconds": 1.911,
      "rssBytes": 320372736
    },
    {
      "seconds": 2.123,
      "rssBytes": 320372736
    },
    {
      "seconds": 2.33,
      "rssBytes": 320372736
    },
    {
      "seconds": 2.544,
      "rssBytes": 320405504
    },
    {
      "seconds": 2.758,
      "rssBytes": 320405504
    },
    {
      "seconds": 2.964,
      "rssBytes": 320405504
    },
    {
      "seconds": 3.178,
      "rssBytes": 320405504
    },
    {
      "seconds": 3.391,
      "rssBytes": 320405504
    },
    {
      "seconds": 3.604,
      "rssBytes": 320405504
    },
    {
      "seconds": 3.817,
      "rssBytes": 320405504
    },
    {
      "seconds": 4.026,
      "rssBytes": 320405504
    },
    {
      "seconds": 4.239,
      "rssBytes": 320405504
    },
    {
      "seconds": 4.452,
      "rssBytes": 320405504
    },
    {
      "seconds": 4.665,
      "rssBytes": 320405504
    },
    {
      "seconds": 4.878,
      "rssBytes": 320405504
    },
    {
      "seconds": 5.091,
      "rssBytes": 320405504
    },
    {
      "seconds": 5.305,
      "rssBytes": 320405504
    },
    {
      "seconds": 5.518,
      "rssBytes": 320405504
    },
    {
      "seconds": 5.731,
      "rssBytes": 320405504
    },
    {
      "seconds": 5.944,
      "rssBytes": 320405504
    },
    {
      "seconds": 6.157,
      "rssBytes": 320405504
    }
  ],
  "guard": [],
  "returncode": 0,
  "output": "compressed pull: 6.44 GB remaining, 4 connections; verified chunks resume automatically\n100.0% verified \u00b7 3214.7 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\nverified sustained.bin\n4 TCP connections observed across the active workers\ndownload verified: 6.44 GB received, 0 raw fallback chunks, 3.9 s\nHARNESS PASS\n",
  "build": {
    "sourceSHA256": {
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901"
    },
    "binarySHA256": "4f97bf0886d89c6705b00d7e3857ae4af1028220a767b5849033edc3973ee6a5"
  }
}
```

## Corrected candidate identity

```json
{
  "baseCommit": "e9173521d104d69412883aceee715ba146729b23",
  "version": "0.2.10",
  "binarySHA256": "f121e5ca87aea710da3197334d49bf9a8d40512bb3161dc6183c31313b28507c",
  "testSourceSHA256": {
    "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901",
    "Tools/slotpack/download_checks.py": "fd27bdb7366929bf3069c4a6939336cbe0fb72b61249ab79e815a7ff6609ce06",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94"
  }
}
```
