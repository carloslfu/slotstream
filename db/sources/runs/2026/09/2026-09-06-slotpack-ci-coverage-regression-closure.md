---
type: run
id: 01m1tn8amfst0fvdzn2tt3djtm
created: 2026-09-06T06:07:25.327321+00:00
updated: 2026-09-06T06:07:25.522563+00:00
summary: A per-file CI coverage regression is corrected with explicit resumed-byte and CDN-status checks; the unchanged local ratchet passes at 96.87% downloader coverage.
binary: 60d646bfceec390db6c9d4fc402bf3dc8ed45a655875a5e80263670b95b1bff2
captured_at: 2026-09-06
command: gh run view --log-failed; fresh llvm-cov catalogue export; python3 Tools/slotpack/coverage.py --lcov; python3 Tools/coverage_ratchet.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Lossless download coverage regression closure
tool: GitHub Actions log, instrumented native fixtures and LLVM LCOV
---
# Lossless downloader coverage gate and direct behavioral checks

The first v0.2.10 main CI run, https://github.com/carloslfu/slotstream/actions/runs/34014296083, passed its build, static/runtime safety gates, sampler/governor goldens, catalogue, external consumer, and every instrumented HTTP/raw/memory fixture. Its final ratchet rejected 91.22% line coverage in SlotpackDownload.swift against the 91.85% floor. Overall coverage was above its floor. Release CI and actual installed-release acceptance passed independently; this failure does not describe a failed download or model response.

The correction adds direct checks of positive resumed-byte reporting using the real embedded model pin and sparse files: dangling resume bits, aggregation of weight/scale/bias ranges, finalized-file exclusion and invalid bits. HTTP fixtures now verify both HIT and MISS response counters. The coverage artifact is uploaded even on a failed ratchet, so subsequent per-line regressions can be inspected. No production source or coverage floor changes.

The new local instrumented run measures 309 of 319 downloader lines, 96.87%, and passes the unchanged ratchet. Its positive behavioral tests replace incidental reliance on old fixture coverage. The retained line comparison is local: GitHub did not upload its failed LCOV artifact, so its precise missing line numbers are not claimed. Main CI for this test-only correction follows separately.

## main-v0210-ci-failed.log

Local log SHA-256: `f14f1e1394ad9b0473190e50ae7743cc6d1841ec9c3333a8e8fa66f09e9ac6d9`

```text
weights-free	coverage may not go down	﻿2026-09-06T05:49:29.5767370Z ##[group]Run Tools/coverage.sh t0 t1 --lcov coverage.info
weights-free	coverage may not go down	2026-09-06T05:49:29.5769590Z ^[[36;1mTools/coverage.sh t0 t1 --lcov coverage.info^[[0m
weights-free	coverage may not go down	2026-09-06T05:49:29.5770080Z ^[[36;1mpython3 Tools/coverage_ratchet.py coverage.info^[[0m
weights-free	coverage may not go down	2026-09-06T05:49:29.6107860Z shell: /bin/bash -e {0}
weights-free	coverage may not go down	2026-09-06T05:49:29.6108840Z ##[endgroup]
weights-free	coverage may not go down	2026-09-06T05:49:29.6811120Z == build (instrumented) ==
weights-free	coverage may not go down	2026-09-06T05:52:42.8668460Z == run ==
weights-free	coverage may not go down	2026-09-06T05:52:49.2868130Z PASS  prefill-schedule (9 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2869880Z PASS  context-policy (8 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2872380Z PASS  runtime-check (26 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2872800Z PASS  governor-check (20 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2873300Z PASS  pull-check (14 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2873730Z PASS  machine-planning (15 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2874290Z PASS  http-framing (11 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2881970Z PASS  http-routing (23 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2883480Z PASS  vision-check (75 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2885890Z PASS  sampler-behaviour (9 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2886330Z PASS  vision-splice (12 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2886710Z PASS  toolcall-check (19 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2887660Z PASS  toolcall-stream-check (14 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2887970Z PASS  toolcall-coercion (23 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2888370Z PASS  gateway-request (37 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2888680Z PASS  gateway-prompt (23 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2889100Z PASS  gateway-catalog (28 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2889530Z PASS  gateway-events (19 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2889930Z PASS  chat-splice (10 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2893120Z PASS  gateway-null-bridge (10 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2902220Z PASS  gateway-anyof-types (13 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2902910Z PASS  openai-conversation (40 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2903970Z PASS  openai-tool-output (163 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2904850Z PASS  openai-context-budget (16 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2906150Z 
weights-free	coverage may not go down	2026-09-06T05:52:49.2907090Z 24 passed, 0 failed, 0 skipped (637 assertions)
weights-free	coverage may not go down	2026-09-06T05:52:49.2935970Z == coverage ==
weights-free	coverage may not go down	2026-09-06T05:52:51.5505890Z Filename                                                                                                Regions    Missed Regions     Cover   Functions  Missed Functions  Executed       Lines      Missed Lines     Cover    Branches   Missed Branches     Cover
weights-free	coverage may not go down	2026-09-06T05:52:51.5508380Z -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
weights-free	coverage may not go down	2026-09-06T05:52:51.5509970Z Sources/Slotstream/Checkpoint.swift                                                                         268               264     1.49%          97                94     3.09%         490               482     1.63%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5511070Z Sources/Slotstream/Context.swift                                                                             49                28    42.86%          10                 5    50.00%          79                36    54.43%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5511960Z Sources/Slotstream/DownloadConcurrency.swift                                                                 20                20     0.00%           6                 6     0.00%          22                22     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5513270Z Sources/Slotstream/DownloadHTTP.swift                                                                       139               137     1.44%          44                43     2.27%         183               179     2.19%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5514260Z Sources/Slotstream/Engine.swift                                                                             258               215    16.67%          75                63    16.00%         683               582    14.79%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5540810Z Sources/Slotstream/Errors.swift                                                                              11                11     0.00%           2                 2     0.00%          23                23     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5541920Z Sources/Slotstream/ExpertStore.swift                                                                        174               174     0.00%          67                67     0.00%         445               445     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5543130Z Sources/Slotstream/GatewayDialect.swift                                                                     188                48    74.47%          47                25    46.81%         418                57    86.36%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5544050Z Sources/Slotstream/Generate.swift                                                                           178               141    20.79%          71                53    25.35%         429               348    18.88%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5544990Z Sources/Slotstream/Governor.swift                                                                            78                47    39.74%          37                27    27.03%         223               161    27.80%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5545940Z Sources/Slotstream/Layers.swift                                                                             173               173     0.00%          71                71     0.00%         620               620     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5546840Z Sources/Slotstream/MTP.swift                                                                                 38                38     0.00%          22                22     0.00%         161               161     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5547920Z Sources/Slotstream/Machine.swift                                                                             13                 1    92.31%          10                 0   100.00%          48                 0   100.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5548860Z Sources/Slotstream/MemTrace.swift                                                                            21                21     0.00%           6                 6     0.00%          39                39     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5549790Z Sources/Slotstream/Model.swift                                                                              163               145    11.04%          58                48    17.24%         278               255     8.27%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5550780Z Sources/Slotstream/NgramStore.swift                                                                         108               107     0.93%          41                40     2.44%         294               288     2.04%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5551750Z Sources/Slotstream/OpenAIDialect.swift                                                                      156                48    69.23%          25                11    56.00%         194                30    84.54%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5552790Z Sources/Slotstream/OpenAIOutput.swift                                                                        41                 3    92.68%          15                 1    93.33%          58                 2    96.55%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5553810Z Sources/Slotstream/PinnedModel.swift                                                                          8                 0   100.00%           8                 0   100.00%          13                 0   100.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5555390Z Sources/Slotstream/PinnedTransport.swift                                                                     10                10     0.00%           4                 4     0.00%          12                12     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5556390Z Sources/Slotstream/Plan.swift                                                                               213                71    66.67%          62                12    80.65%         595               126    78.82%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5557290Z Sources/Slotstream/PrefixCache.swift                                                                         99                21    78.79%          58                15    74.14%         212                28    86.79%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5558340Z Sources/Slotstream/ProcessMemory.swift                                                                       18                12    33.33%           7                 3    57.14%          43                19    55.81%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5559340Z Sources/Slotstream/RouterTrace.swift                                                                         12                12     0.00%           4                 4     0.00%          26                26     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5560240Z Sources/Slotstream/Server.swift                                                                             804               704    12.44%         160               132    17.50%        1719              1497    12.91%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5561400Z Sources/Slotstream/SlotpackDownload.swift                                                                   275               273     0.73%          70                69     1.43%         485               477     1.65%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5562290Z Sources/Slotstream/SlotpackManifest.swift                                                                    54                54     0.00%          16                16     0.00%          95                95     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5563260Z Sources/Slotstream/ToolCallSplitter.swift                                                                   219                21    90.41%          47                 1    97.87%         375                14    96.27%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5689600Z Sources/Slotstream/Vendored/GatedDelta.swift                                                                 46                46     0.00%          12                12     0.00%         264               264     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5692670Z Sources/Slotstream/Vision.swift                                                                             252               126    50.00%          54                25    53.70%         645               364    43.57%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5695200Z Sources/Slotstream/VisionPrompt.swift                                                                        25                 8    68.00%          12                 4    66.67%          54                21    61.11%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5698230Z Sources/Slotstream/WeightDownload.swift                                                                     330               330     0.00%         102               102     0.00%         709               709     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5700790Z Sources/Slotstream/WeightStore.swift                                                                        189               141    25.40%          64                45    29.69%         392               270    31.12%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5704430Z Sources/Slotstream/Weights.swift                                                                             43                43     0.00%          17                17     0.00%          73                73     0.00%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5706800Z Sources/SlotstreamDiagnostics/CheckReport.swift                                                              35                19    45.71%          18                 6    66.67%          54                19    64.81%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5709830Z Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift                                                     42                27    35.71%          30                24    20.00%         175                29    83.43%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5712540Z Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift                                                         27                14    48.15%          15                10    33.33%         125                16    87.20%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5715150Z Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift                                                      23                13    43.48%          14                12    14.29%          64                14    78.12%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5717780Z Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift                                                         24                13    45.83%          18                12    33.33%          84                14    83.33%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5720330Z Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift                                                      25                17    32.00%          18                17     5.56%         136                17    87.50%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5723260Z Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift                                                      102                53    48.04%          69                47    31.88%         561                50    91.09%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5726100Z Sources/SlotstreamDiagnostics/Diagnostics.swift                                                              25                10    60.00%           7                 6    14.29%          79                 8    89.87%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5730140Z Sources/SlotstreamDiagnostics/Goldens.swift                                                                  25                 7    72.00%          10                 4    60.00%          67                 4    94.03%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:52:51.5733610Z -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
weights-free	coverage may not go down	2026-09-06T05:52:51.5736270Z TOTAL                                                                                                      5011              3676    26.64%        1606              1189    25.97%       11774              7926    32.68%           0                 0         -
weights-free	coverage may not go down	2026-09-06T05:53:04.4888560Z {
weights-free	coverage may not go down	2026-09-06T05:53:04.4890080Z   "checks" : [
weights-free	coverage may not go down	2026-09-06T05:53:04.4891120Z     "embedded manifest and original pins agree",
weights-free	coverage may not go down	2026-09-06T05:53:04.4892230Z     "new installs have a public compressed source",
weights-free	coverage may not go down	2026-09-06T05:53:04.4893320Z     "C encoder accepts Swift data",
weights-free	coverage may not go down	2026-09-06T05:53:04.4894160Z     "Swift C roundtrip is exact",
weights-free	coverage may not go down	2026-09-06T05:53:04.4894980Z     "manifest hash is mandatory",
weights-free	coverage may not go down	2026-09-06T05:53:04.4896060Z     "pinned file identity cannot change",
weights-free	coverage may not go down	2026-09-06T05:53:04.4897020Z     "unknown version",
weights-free	coverage may not go down	2026-09-06T05:53:04.4897240Z     "empty object list",
weights-free	coverage may not go down	2026-09-06T05:53:04.4897700Z     "invalid size=9223372036854775807",
weights-free	coverage may not go down	2026-09-06T05:53:04.4897910Z     "invalid rawSize=9223372036854775807",
weights-free	coverage may not go down	2026-09-06T05:53:04.4898200Z     "invalid rawSize=0",
weights-free	coverage may not go down	2026-09-06T05:53:04.4898490Z     "invalid size=0",
weights-free	coverage may not go down	2026-09-06T05:53:04.4898710Z     "overlapping ranges",
weights-free	coverage may not go down	2026-09-06T05:53:04.4898950Z     "range escapes file",
weights-free	coverage may not go down	2026-09-06T05:53:04.4899130Z     "range references unknown file",
weights-free	coverage may not go down	2026-09-06T05:53:04.4899410Z     "path traversal",
weights-free	coverage may not go down	2026-09-06T05:53:04.4899690Z     "compressed corruption",
weights-free	coverage may not go down	2026-09-06T05:53:04.4899890Z     "reconstruction digest is mandatory",
weights-free	coverage may not go down	2026-09-06T05:53:04.4900150Z     "trial starts at 16",
weights-free	coverage may not go down	2026-09-06T05:53:04.4900430Z     "plateau rolls back to 8",
weights-free	coverage may not go down	2026-09-06T05:53:04.4900690Z     "useful gain trials 32",
weights-free	coverage may not go down	2026-09-06T05:53:04.4901000Z     "cap stays at 32",
weights-free	coverage may not go down	2026-09-06T05:53:04.4901320Z     "CPU backlog or retries stops expansion",
weights-free	coverage may not go down	2026-09-06T05:53:04.4901620Z     "CPU backlog or retries stops expansion",
weights-free	coverage may not go down	2026-09-06T05:53:04.4901930Z     "original public API signatures remain available",
weights-free	coverage may not go down	2026-09-06T05:53:04.4902300Z     "public synchronous log lifetime closes on cancellation",
weights-free	coverage may not go down	2026-09-06T05:53:04.4902750Z     "disk space checked before creating large parts"
weights-free	coverage may not go down	2026-09-06T05:53:04.4903030Z   ],
weights-free	coverage may not go down	2026-09-06T05:53:04.4903310Z   "pass" : true
weights-free	coverage may not go down	2026-09-06T05:53:04.4903490Z }
weights-free	coverage may not go down	2026-09-06T05:53:51.8934330Z {"name": "normal", "pass_": true, "seconds": 0.119, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:53:51.9967410Z {"name": "redirect", "pass_": true, "seconds": 0.103, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:53:52.0985970Z {"name": "bad-object-fallback", "pass_": true, "seconds": 0.101, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:53:52.1911850Z {"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.092, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:53:52.2214460Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.03, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:53:52.2532870Z {"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.032, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:53:52.3465550Z {"name": "optional-absent", "pass_": true, "seconds": 0.093, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:53:52.4410570Z {"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.094, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:53:52.4697380Z {"name": "bad-object-fails", "pass_": true, "seconds": 0.029, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:53:52.5703960Z {"name": "retry-after", "pass_": true, "seconds": 0.1, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:53:57.8665130Z {"name": "transient-retry", "pass_": true, "seconds": 5.296, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:54:09.5864240Z {"name": "wrong-length-fallback", "pass_": true, "seconds": 11.718, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:54:45.4051700Z {"name": "short-body-fallback", "pass_": true, "seconds": 35.818, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:21.2904100Z {"name": "content-encoding-fallback", "pass_": true, "seconds": 35.884, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:22.8296520Z {"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.538, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:55:22.9377640Z {"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.09, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:55:23.0122140Z {"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.074, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.0929590Z {"name": "resume", "pass_": true, "seconds": 0.08, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.1176990Z {"name": "already-installed", "pass_": true, "seconds": 0.024, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.1436920Z {"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.025, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.2337270Z {"name": "corruption-seed", "pass_": true, "seconds": 0.09, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.2664680Z {"name": "same-size-final-repair", "pass_": true, "seconds": 0.032, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.3486210Z {"name": "invalid-resume-map", "pass_": true, "seconds": 0.081, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.4412100Z {"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.092, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.5300120Z {"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.088, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:23.5395860Z {"name": "part-symlink-rejected", "pass_": true, "seconds": 0.009, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:55:23.5504090Z {"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.01, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:55:23.5593050Z {"name": "part-fifo-rejected", "pass_": true, "seconds": 0.009, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:55:24.9059460Z {"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.009, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:55:25.3975010Z ALL HTTP CHECKS PASS
weights-free	coverage may not go down	2026-09-06T05:55:38.3097960Z {"name": "raw-multichunk", "pass_": true, "seconds": 1.021, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:38.7436920Z {"name": "raw-installed-no-http", "pass_": true, "seconds": 0.434, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:39.5986640Z {"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.855, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:55:40.5069950Z {"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.908, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:56:22.5116980Z {"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 42.003, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:56:23.6227840Z {"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 1.112, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:56:23.6979580Z {"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.075, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:56:24.1876240Z {"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.49, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:56:24.6266110Z {"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.439, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:56:28.1987970Z {"name": "raw-cancel", "pass_": true, "seconds": 3.572, "returncode": 1}
weights-free	coverage may not go down	2026-09-06T05:56:28.9859440Z {"name": "raw-resume", "pass_": true, "seconds": 0.764, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:56:30.2899320Z {"name": "raw-same-size-repair", "pass_": true, "seconds": 1.302, "returncode": 0}
weights-free	coverage may not go down	2026-09-06T05:56:30.4383300Z ALL RAW HTTP CHECKS PASS
weights-free	coverage may not go down	2026-09-06T05:57:09.7014170Z SUSTAINED MEMORY PASS 128401408 bytes peak RSS
weights-free	coverage may not go down	2026-09-06T05:57:10.4608310Z TRANSPORT LINE COVERAGE PASS: real manifest, HTTP, raw and sustained-memory fixtures
weights-free	coverage may not go down	2026-09-06T05:57:10.5208960Z lcov: coverage.info (10530 line records)
weights-free	coverage may not go down	2026-09-06T05:57:10.6022450Z coverage: 43.15% of 11352 lines across 43 files
weights-free	coverage may not go down	2026-09-06T05:57:10.6026700Z   up    Sources/Slotstream/Errors.swift                      0.00% -> 52.17%
weights-free	coverage may not go down	2026-09-06T05:57:10.6027980Z   up    Sources/Slotstream/GatewayDialect.swift              84.45% -> 86.36%
weights-free	coverage may not go down	2026-09-06T05:57:10.6029710Z   up    Sources/Slotstream/Generate.swift                    17.25% -> 18.88%
weights-free	coverage may not go down	2026-09-06T05:57:10.6031200Z   up    Sources/Slotstream/Governor.swift                    26.76% -> 27.80%
weights-free	coverage may not go down	2026-09-06T05:57:10.6032590Z   up    Sources/Slotstream/Plan.swift                        76.42% -> 78.82%
weights-free	coverage may not go down	2026-09-06T05:57:10.6034250Z   up    Sources/Slotstream/PrefixCache.swift                 80.19% -> 86.79%
weights-free	coverage may not go down	2026-09-06T05:57:10.6036050Z   up    Sources/Slotstream/Server.swift                      10.51% -> 12.91%
weights-free	coverage may not go down	2026-09-06T05:57:10.6037590Z   up    Sources/Slotstream/Vision.swift                      29.04% -> 43.57%
weights-free	coverage may not go down	2026-09-06T05:57:10.6039040Z   up    Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift 90.31% -> 91.09%
weights-free	coverage may not go down	2026-09-06T05:57:10.6040730Z   DOWN  Sources/Slotstream/SlotpackDownload.swift            91.85% -> 91.22%
weights-free	coverage may not go down	2026-09-06T05:57:10.6041700Z 
weights-free	coverage may not go down	2026-09-06T05:57:10.6042100Z 1 file(s) lost coverage.
weights-free	coverage may not go down	2026-09-06T05:57:10.6043190Z Add a check, or run --update if the baseline change is deliberate and explained in the commit.
weights-free	coverage may not go down	2026-09-06T05:57:10.6138260Z ##[error]Process completed with exit code 1.
```

## ci-coverage-correction.log

Local log SHA-256: `a6c6d7d44572d37ea50d85c57b0cf0a39bbb923990d2b19952dbb86c7baea3a3`

```text
{
  "checks" : [
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
    "dangling resume bits do not report downloaded bytes",
    "resume progress combines original weight and metadata bytes",
    "finalized files are not counted as partial progress",
    "invalid resume bits do not report downloaded bytes",
    "disk space checked before creating large parts"
  ],
  "pass" : true
}
{"name": "normal", "pass_": true, "seconds": 0.287, "returncode": 0}
{"name": "cache-miss-reporting", "pass_": true, "seconds": 0.04, "returncode": 0}
{"name": "redirect", "pass_": true, "seconds": 0.037, "returncode": 0}
{"name": "bad-object-fallback", "pass_": true, "seconds": 0.033, "returncode": 0}
{"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.034, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.014, "returncode": 1}
{"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.014, "returncode": 1}
{"name": "optional-absent", "pass_": true, "seconds": 0.035, "returncode": 0}
{"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.034, "returncode": 0}
{"name": "bad-object-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "retry-after", "pass_": true, "seconds": 0.034, "returncode": 0}
{"name": "transient-retry", "pass_": true, "seconds": 5.563, "returncode": 0}
{"name": "wrong-length-fallback", "pass_": true, "seconds": 11.437, "returncode": 0}
{"name": "short-body-fallback", "pass_": true, "seconds": 36.305, "returncode": 0}
{"name": "content-encoding-fallback", "pass_": true, "seconds": 36.491, "returncode": 0}
{"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.484, "returncode": 1}
{"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.04, "returncode": 1}
{"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.034, "returncode": 0}
{"name": "resume", "pass_": true, "seconds": 0.031, "returncode": 0}
{"name": "already-installed", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.013, "returncode": 0}
{"name": "corruption-seed", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "same-size-final-repair", "pass_": true, "seconds": 0.018, "returncode": 0}
{"name": "invalid-resume-map", "pass_": true, "seconds": 0.054, "returncode": 0}
{"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.039, "returncode": 0}
{"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.033, "returncode": 0}
{"name": "part-symlink-rejected", "pass_": true, "seconds": 0.006, "returncode": 1}
{"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.006, "returncode": 1}
{"name": "part-fifo-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.013, "returncode": 1}
ALL HTTP CHECKS PASS
{"name": "raw-multichunk", "pass_": true, "seconds": 0.693, "returncode": 0}
{"name": "raw-installed-no-http", "pass_": true, "seconds": 0.251, "returncode": 0}
{"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.33, "returncode": 0}
{"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.33, "returncode": 0}
{"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 40.701, "returncode": 0}
{"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.333, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.022, "returncode": 1}
{"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.168, "returncode": 1}
{"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.216, "returncode": 0}
{"name": "raw-cancel", "pass_": true, "seconds": 3.321, "returncode": 1}
{"name": "raw-resume", "pass_": true, "seconds": 0.328, "returncode": 0}
{"name": "raw-same-size-repair", "pass_": true, "seconds": 0.455, "returncode": 0}
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 354025472 bytes peak RSS
TRANSPORT LINE COVERAGE PASS: real manifest, HTTP, raw and sustained-memory fixtures
```

## ci-coverage-correction-ratchet.log

Local log SHA-256: `b2a117b0943a6ac320314ed4d44aa235249869c048c9eacaa53a15eebf9246b8`

```text
coverage: 43.21% of 11352 lines across 43 files
  up    Sources/Slotstream/Errors.swift                      0.00% -> 52.17%
  up    Sources/Slotstream/GatewayDialect.swift              84.45% -> 86.36%
  up    Sources/Slotstream/Generate.swift                    17.25% -> 18.88%
  up    Sources/Slotstream/Governor.swift                    26.76% -> 27.80%
  up    Sources/Slotstream/Plan.swift                        76.42% -> 76.97%
  up    Sources/Slotstream/PrefixCache.swift                 80.19% -> 86.79%
  up    Sources/Slotstream/Server.swift                      10.51% -> 12.91%
  up    Sources/Slotstream/SlotpackDownload.swift            91.85% -> 96.87%
  up    Sources/Slotstream/Vision.swift                      29.04% -> 43.57%
  up    Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift 90.31% -> 91.09%
```

## Local line comparison

```json
{
  "previousHitLines": 293,
  "currentHitLines": 309,
  "totalLines": 319,
  "lost": [
    222
  ],
  "gained": [
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    146
  ]
}
```

## Instrumented HTTP receipt

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
    "binarySHA256": "60d646bfceec390db6c9d4fc402bf3dc8ed45a655875a5e80263670b95b1bff2"
  },
  "checks": [
    {
      "name": "normal",
      "pass_": true,
      "seconds": 0.287,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cache-miss-reporting",
      "pass_": true,
      "seconds": 0.04,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nCDN responses: MISS=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "redirect",
      "pass_": true,
      "seconds": 0.037,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "bad-object-fallback",
      "pass_": true,
      "seconds": 0.033,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "missing-object-raw-fallback",
      "pass_": true,
      "seconds": 0.034,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nCDN responses: HIT=50\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 18 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.014,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadHTTPError(status: 206, retryAfter: nil)\n"
    },
    {
      "name": "raw-ignored-range-fails",
      "pass_": true,
      "seconds": 0.014,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadHTTPError(status: 200, retryAfter: nil)\n"
    },
    {
      "name": "optional-absent",
      "pass_": true,
      "seconds": 0.035,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "optional-corrupt-and-unavailable",
      "pass_": true,
      "seconds": 0.034,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\noptional mtp.safetensors unavailable; model runs without it\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
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
      "seconds": 0.034,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "transient-retry",
      "pass_": true,
      "seconds": 5.563,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified weights.safetensors\nverified scales.bin\nverified biases.bin\nverified config.json\nverified mtp.safetensors\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 5.5 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "wrong-length-fallback",
      "pass_": true,
      "seconds": 11.437,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified mtp.safetensors\nverified biases.bin\nverified scales.bin\nverified weights.safetensors\n100.0% verified \u00b7 2.2 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\n100.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 4/5 files verified\nverified config.json\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 11.4 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "short-body-fallback",
      "pass_": true,
      "seconds": 36.305,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 1.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 1.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 1.1 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.3 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified weights.safetensors\nverified biases.bin\nverified scales.bin\n94.1% verified \u00b7 0.9 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.1 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.01 GB received, 0 raw fallback chunks, 36.3 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "content-encoding-fallback",
      "pass_": true,
      "seconds": 36.491,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n0.0% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n23.5% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n47.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\n70.6% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 0/5 files verified\nverified scales.bin\nverified weights.safetensors\nverified biases.bin\n94.1% verified \u00b7 0.5 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\n94.1% verified \u00b7 0.0 MB/s received \u00b7 ETA measuring \u00b7 3/5 files verified\nverified config.json\nverified mtp.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 36.5 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "cancel-preserves-progress",
      "pass_": true,
      "seconds": 1.484,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\n",
      "stderr": "DownloadCancelled()\n"
    },
    {
      "name": "damaged-resumed-chunk-rejected",
      "pass_": true,
      "seconds": 0.04,
      "returncode": 1,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified scales.bin\n",
      "stderr": "PullIntegrityError(file: \"weights.safetensors\")\n"
    },
    {
      "name": "damaged-resumed-chunk-repair",
      "pass_": true,
      "seconds": 0.034,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified weights.safetensors\nCDN responses: HIT=16\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "resume",
      "pass_": true,
      "seconds": 0.031,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nCDN responses: HIT=17\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
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
      "seconds": 0.03,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "same-size-final-repair",
      "pass_": true,
      "seconds": 0.018,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nCDN responses: HIT=1\n1 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "invalid-resume-map",
      "pass_": true,
      "seconds": 0.054,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified mtp.safetensors\nverified config.json\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "forged-complete-map-without-parts",
      "pass_": true,
      "seconds": 0.039,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified biases.bin\nverified weights.safetensors\nverified scales.bin\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "oversized-map-is-discarded",
      "pass_": true,
      "seconds": 0.033,
      "returncode": 0,
      "stdout": "compressed pull: 0.00 GB remaining, 4 connections; verified chunks resume automatically\nverified config.json\nverified mtp.safetensors\nverified scales.bin\nverified biases.bin\nverified weights.safetensors\nCDN responses: HIT=18\n4 TCP connections observed across the active workers\ndownload verified: 0.00 GB received, 0 raw fallback chunks, 0.0 s\nHARNESS PASS\n",
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
      "seconds": 0.006,
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
      "seconds": 0.013,
      "returncode": 1,
      "stdout": "",
      "stderr": "another download is already writing this directory\n"
    }
  ],
  "requests": 648
}
```

## Instrumented raw receipt

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
    "binarySHA256": "3d31a0cfb81c46ba00ea03bc9503e079a718faab92a558aa6740d42bf26051ef"
  },
  "checks": [
    {
      "name": "raw-multichunk",
      "pass_": true,
      "seconds": 0.693,
      "returncode": 0,
      "stdout": "verified config.json\n  4 connections in use\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-installed-no-http",
      "pass_": true,
      "seconds": 0.251,
      "returncode": 0,
      "stdout": "HARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-missing",
      "pass_": true,
      "seconds": 0.33,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-wrong-range",
      "pass_": true,
      "seconds": 0.33,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nconfig.json: source failed \u2014 trying next source\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-encoding",
      "pass_": true,
      "seconds": 40.701,
      "returncode": 0,
      "stdout": "  4 connections in use\nweights.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\n0.2/0.4 GB verified chunks | 9.2 MB/s received | ETA 18 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 8.4 MB/s received | ETA 20 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 7.8 MB/s received | ETA 22 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.7 MB/s received | ETA 25 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.3 MB/s received | ETA 27 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 6.0 MB/s received | ETA 28 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.6 MB/s received | ETA 30 s | 2 file(s) left\n0.2/0.4 GB verified chunks | 5.3 MB/s received | ETA 32 s | 2 file(s) left\nmtp.safetensors: source failed \u2014 trying next source\nconfig.json: source failed \u2014 trying next source\nverified config.json\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-source-fallback-ignore-range",
      "pass_": true,
      "seconds": 0.333,
      "returncode": 0,
      "stdout": "weights.safetensors: source failed \u2014 trying next source\n  4 connections in use\nverified config.json\nmtp.safetensors: source failed \u2014 trying next source\nverified weights.safetensors\nverified mtp.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-wrong-range-fails",
      "pass_": true,
      "seconds": 0.022,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "weights.safetensors: download failed from all 1 source(s) (invalid Content-Range) \u2014 rerun `slotstream pull` to resume\n"
    },
    {
      "name": "raw-corrupt-final-rejected",
      "pass_": true,
      "seconds": 0.168,
      "returncode": 1,
      "stdout": "  4 connections in use\n",
      "stderr": "PullIntegrityError(file: \"config.json\")\n"
    },
    {
      "name": "raw-optional-inflight-writers",
      "pass_": true,
      "seconds": 0.216,
      "returncode": 0,
      "stdout": "verified config.json\nskip mtp.safetensors: unavailable from every source; optional\n  4 connections in use\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    },
    {
      "name": "raw-cancel",
      "pass_": true,
      "seconds": 3.321,
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
      "seconds": 0.455,
      "returncode": 0,
      "stdout": "  4 connections in use\nverified mtp.safetensors\nverified weights.safetensors\nHARNESS PASS\n",
      "stderr": ""
    }
  ]
}
```

## Instrumented memory receipt

```json
{
  "pass_": true,
  "bytes": 6442450944,
  "objects": 768,
  "peakRSSBytes": 354025472,
  "samples": [
    {
      "seconds": 0.003,
      "rssBytes": 32768
    },
    {
      "seconds": 0.22,
      "rssBytes": 32768
    },
    {
      "seconds": 0.434,
      "rssBytes": 195198976
    },
    {
      "seconds": 0.648,
      "rssBytes": 296910848
    },
    {
      "seconds": 0.86,
      "rssBytes": 309690368
    },
    {
      "seconds": 1.074,
      "rssBytes": 311361536
    },
    {
      "seconds": 1.284,
      "rssBytes": 315686912
    },
    {
      "seconds": 1.498,
      "rssBytes": 349995008
    },
    {
      "seconds": 1.711,
      "rssBytes": 350093312
    },
    {
      "seconds": 1.919,
      "rssBytes": 353353728
    },
    {
      "seconds": 2.132,
      "rssBytes": 353599488
    },
    {
      "seconds": 2.345,
      "rssBytes": 353976320
    },
    {
      "seconds": 2.553,
      "rssBytes": 354025472
    },
    {
      "seconds": 2.766,
      "rssBytes": 354025472
    },
    {
      "seconds": 2.975,
      "rssBytes": 354025472
    },
    {
      "seconds": 3.183,
      "rssBytes": 354025472
    },
    {
      "seconds": 3.396,
      "rssBytes": 354025472
    },
    {
      "seconds": 3.609,
      "rssBytes": 354025472
    },
    {
      "seconds": 3.814,
      "rssBytes": 354025472
    },
    {
      "seconds": 4.027,
      "rssBytes": 354025472
    },
    {
      "seconds": 4.234,
      "rssBytes": 354025472
    },
    {
      "seconds": 4.448,
      "rssBytes": 354025472
    },
    {
      "seconds": 4.661,
      "rssBytes": 354025472
    },
    {
      "seconds": 4.874,
      "rssBytes": 354025472
    },
    {
      "seconds": 5.085,
      "rssBytes": 354025472
    },
    {
      "seconds": 5.298,
      "rssBytes": 354025472
    },
    {
      "seconds": 5.512,
      "rssBytes": 354025472
    },
    {
      "seconds": 5.721,
      "rssBytes": 354025472
    },
    {
      "seconds": 5.93,
      "rssBytes": 354025472
    },
    {
      "seconds": 6.144,
      "rssBytes": 354025472
    },
    {
      "seconds": 6.357,
      "rssBytes": 354025472
    }
  ],
  "guard": [],
  "returncode": 0,
  "output": "compressed pull: 6.44 GB remaining, 4 connections; verified chunks resume automatically\n100.0% verified \u00b7 3209.8 MB/s received \u00b7 ETA measuring \u00b7 0/1 files verified\nverified sustained.bin\n4 TCP connections observed across the active workers\ndownload verified: 6.44 GB received, 0 raw fallback chunks, 4.0 s\nHARNESS PASS\n",
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
    "binarySHA256": "b5b9c818f0af5d87c136e49d84e725e7b691bc6ffab332f986ee060c94960403"
  }
}
```

Merged LCOV SHA-256: `d8079ad571681744469c88847a25865cc5c9bce7821396e492300b6a3f79a988`. The LCOV starts from a fresh export of the unchanged catalogue profile and unions the new instrumented transport run; it does not reuse previously measured transport hits.
