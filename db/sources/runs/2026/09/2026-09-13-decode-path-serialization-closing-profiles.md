---
type: run
id: 01m2daxx09sc2554ma801p6893
created: 2026-09-13T12:12:32.137475+00:00
updated: 2026-09-13T12:12:32.564286+00:00
summary: 'Decode serialization closing profiles: macOS sample of B0 prefetch and the combined candidate on r0206, model thread merged across its dispatch-queue blocks; round 1 profiles re-parsed'
binary: ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db (round 3b build)
captured_at: 2026-09-13
command: 'see body: .build/decode-cpu/run-profiles.sh and profile.sh'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Decode path serialization, closing profiles: model-thread time after the combination'
tool: macOS sample, .build/decode-cpu/profile.sh, a model-thread bucketing parse merged by thread id
---
Closing profiles of the decode-path serialization plan ([[records/plan/decode-path-serialization-2026-09-12]]): where decode time goes on the model thread with B0 prefetch and with the combined candidate, plus a re-parse of round 1's profiles. Artifacts live under `.build/decode-cpu/` (ignored by git). Nothing was installed, published or committed.

## Capture

`.build/decode-cpu/run-profiles.sh`, queued after the attribution sweep, ran `.build/decode-cpu/profile.sh` twice on the round 3b binary (`ed139334a9f7d0b46c5f4894da6c1de8c8fe789e257aa3fcb6eddae3f45ca3db`): the engine's `expert-lookahead-bench` on r0206 with 128 warmup outputs and up to 1,024 measured outputs (the request ends at 151), the protocol environment exported and `--memory-gb 20`, then macOS `sample` for 45 s after a 30 s settle. Environments from `configs-attribution.json`: B0 prefetch (14 keys) at 07:02 and the combined candidate (17 keys) at 07:03. Round 1's `profile-base` (prefetch off) and `profile-pf` (B0 prefetch) used the same shape on the round 1 binary ([[sources/runs/2026/09/2026-09-12-decode-path-serialization-round-1]]).

## Method

Self samples per frame (count minus its children's counts) on the model thread, bucketed by symbol: GPU wait (`iokit_user_client_trap`), file reads (`pread`), host locks and condition variables (`__psynch_cvwait`, `__ulock_wait`, `__psynch_mutexwait`, `semaphore_wait_trap`), allocation, memory copy, and everything else as other host work. `sample` lists a thread once per dispatch queue it ran on, and the model thread appears twice: a cooperative-queue block that runs the layer loop and a user-initiated block where the same thread takes part in its demand reads. Blocks are merged by thread id, and the model thread is the one whose tree contains `runHiddenMulti` with the most IOKit samples.

## Model thread, blocks merged

| bucket | round 1, prefetch off | round 1, B0 prefetch | B0 prefetch, round 3b binary | combined candidate |
| --- | ---: | ---: | ---: | ---: |
| file reads | 45.2% | 40.0% | 36.1% | 39.3% |
| GPU wait | 35.1% | 41.3% | 39.8% | 32.9% |
| other host work | 8.1% | 9.5% | 14.1% | 16.6% |
| locks and condition variables | 9.0% | 5.9% | 6.1% | 6.3% |
| allocation | 2.0% | 2.6% | 2.7% | 3.5% |
| memory copy | 0.6% | 0.7% | 1.1% | 1.3% |
| model-thread samples | 22,208 | 19,798 | 28,264 | 28,201 |

Self samples in the two largest leaves: `iokit_user_client_trap` 11,254 (B0 prefetch) against 9,274 (combined); `pread` 10,212 against 11,097. The largest other-host leaves on the combined model thread are `mach_msg2_trap` 433, AGX instruction encoding 122, `mlx::core::eval_impl` 112, `objc_msgSend` 107 and MLX buffer-cache reuse 90; with B0 prefetch `eval_impl` has 94.

## Round 1 re-parsed by block

| block | samples | GPU wait | file reads | other host | locks | allocation | memory copy |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| prefetch off, cooperative queue | 11,183 | 69.8% | | 15.3% | 9.9% | 4.0% | 1.1% |
| prefetch off, user-initiated queue | 11,022 | | 91.1% | 0.9% | 8.0% | | 0.0% |
| B0 prefetch, cooperative queue | 11,109 | 73.6% | | 16.1% | 4.4% | 4.7% | 1.3% |
| B0 prefetch, user-initiated queue | 8,686 | | 91.1% | 1.0% | 7.9% | | |

The cooperative-queue blocks reproduce the split recorded in round 1 (69.7% and 73.5% GPU wait), which therefore described that block alone.

Engine results of the profiled runs, which sampling perturbs and are not timings: 151 outputs each, decode I/O share 23.9% (B0 prefetch) and 26.5% (combined), 69.3 and 68.9 demand records per output.

## Artifacts (sha256)

Paths relative to `.build/decode-cpu/`:

    df17f994ccf9d103f84b62263a5fa21b1d4cd94b4cf6c3893de325d58257ef3a  profile-final-pf-b0/sample.txt
    aa34f4c4e4e8185930180934a6e2beffe1b772dfa19aaaefcf1cd2d0b3b870a4  profile-final-combined/sample.txt
    854467e15bebe0e253859d5ac49e166f646af124f9ddb01766e10ee41037a44f  profile-final-pf-b0/result.json
    c08c03750fd14bfe932f4b2c510fff00e3fc13abf8ecfee646e7ef44bcb9ef0b  profile-final-combined/result.json
    f30d81938be0ddf8d27a2f8d991c24927525712569d9a4b7390b4572849028ad  run-profiles.sh
    b6e2e394207b6a3c9c28467d9a2521b0353877068ea0f4dd92c05cac0fd28710  profile.sh
    5cfbc0ee7b63acca734de1c5e81d31465741401c8434ad7789e7b31ef7e02546  profile-pf/sample.txt (round 1)
    3b1da0bd5b06babc17f1adaa3c79074b9fdb8d3e9e42e9a068d30e852bf84331  profile-base/sample.txt (round 1)
