---
type: run
meta-type: fact
id: 01m314gdr8f92n7s6rz6z64hhs
created: 2026-09-21T04:45:07.720051+00:00
updated: 2026-09-21T04:45:38.750787+00:00
summary: 'Adaptive memory ceilings: planner and CLI matrices, native controls and real model shrink/recovery pass; limits and earlier fixture failure retained.'
binary: 28e92ae517c9d052c56c6e93fe123ba44c96a5944e08541f7ff2865b35190100
captured_at: 2026-09-20
command: See exact commands and raw outputs in the body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Adaptive memory limits qualification
tool: planner, CLI, native app and governor checks
---
# Adaptive memory limits: implementation qualification

Functional checks on the development M5 Pro with 48 GiB shared RAM. The working tree contains concurrent, unrelated development changes. No release or new hardware-speed claim is made. Simulated machines test planning and refusal logic; they do not qualify allocation on those machines.

## Method and scope

Commands, from the repository root:

```sh
python3 Tools/context_proxy.py --out /tmp/slotstream-adaptive-final-proxy
python3 Tools/memory_override_gate.py --binary .build/adaptive-memory-b62wzo2b/slotstream --out /tmp/slotstream-adaptive-final-cli.json
.build/adaptive-memory-b62wzo2b/sevra-mac-checks --performance
bash Tools/check_sevra_memory_ui.sh
.build/adaptive-memory-b62wzo2b/sevra-mac-checks --performance-real --home <disposable Home>
.build/adaptive-memory-b62wzo2b/diagnostics-final/slotstream elastic-drill --slots 1000 --max-memory-gb 13 --memory-limit-gb 13 --mtp off
.build/adaptive-memory-b62wzo2b/diagnostics-final/slotstream governor-check
```

The CLI matrix completed 399 cases on the frozen release binary. Two additional text-output cases used the later debug binary after correcting the doctor comparison table; the integrated gate now includes them. They simulate 64 GiB RAM, a 48 GiB Metal recommendation, 18 and 60 decimal GB available, a 48 GB adaptive limit, a 32,768-token context, and MTP/vision off. A redundant complete rerun with the debug binary was stopped; it is not counted as a completed gate.

The native check uses a custom 10 GB budget, then changes to 9 GB during a response and verifies deferred application, release/reload and preserved user state. The full governor drill uses the repository-authorized 13 GB diagnostic ceiling with more than 16 GB real reclaimable memory and the ordinary shrink/grow deadbands and cooldown. One real model runs at a time. The model-process guard refused one attempted launch while another task was releasing its engine; no model was loaded by that refused attempt. The next launch used the standard lock after it became available, without bypassing it.

The first adaptive drill incorrectly started from the old manually sized pool. The adaptive planner correctly recovered only to the pool affordable inside its ceiling, so the fixture's full-restoration assertion failed. The corrected fixture starts from the actual adaptive planner result. It verifies shrink, cooldown, full regrowth, exact generated token IDs, preserved ceiling and request deadline, updated current target, and observed process-memory bounds. The original failure is retained below.

Global swap-ins changed during real checks, while swap-outs did not. These are functional and process-memory results, not clean timing benchmarks. No 64 GiB real allocation run was made. The source hashes and binary identities bound this evidence; later concurrent checkout changes are not automatically covered.

## Binary identities

- `slotstream`: `3b928b6f9590f188b808b5c39f04d1eabe8e814f279ee0456d968cc959c23ef8`
- `sevra-mac-checks`: `61325710885502e644ed50b6557ed584dedfbaa892f715dbb010a7aaef322a68`
- `resize/slotstream`: `ebc8603dd4d9e89c12f6c793c9b62cd25adb84fe6694a3869837aed4a4af4a5e`
- `diagnostics-final/slotstream`: `28e92ae517c9d052c56c6e93fe123ba44c96a5944e08541f7ff2865b35190100`

## Planner and context software contracts

Captured stdout/report SHA-256: `a0c15d662a89e7118133446f0746e99dc46745eb606e8af263890d551cb7e307`.

```text
{
  "kind": "context-software-proxy",
  "passed": true,
  "hardware_qualified": false,
  "model_loaded": false,
  "source_sha256": {
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/Context.swift": "627f16b7cccee503e2beb162aa9f9c2df505fadd89cf41087bac21cb6dffb80d",
    "Sources/Slotstream/ContextFeasibility.swift": "3e8d872da6aae5cecf59e82df694d496efb4f8f7fac7172789bcfbfe4014496a",
    "Sources/Slotstream/ContextMemory.swift": "848df7f507cd1cc0d978ea29866f4c5c9635f5091ff236e551cde652cc668d9b",
    "Sources/Slotstream/ContextWindowPolicy.swift": "8d2ef9e6be2c0a6929ae2ce055708c5200bed334dd3d1ebbb760bcb6f550a160",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/Engine.swift": "98a04b2ee94c2068748b9072b44202f1c94df0cdf4d5992c3cdb4f296ee34e26",
    "Sources/Slotstream/Governor.swift": "c1960fc1cf267e096f5f1a7490756a68ed59f050d1df445fc78b4ea31338b935",
    "Sources/Slotstream/Layers.swift": "62a616ce6b356cb2a25fad893de89721babab0e6b623ec7fdc39336b0cc027ad",
    "Sources/Slotstream/Machine.swift": "bca4a53e6e7568433c15f996eed5306acc66a78d44d3ade43450f1bc39695955",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "732fd60fc9814292f230a08cc58b322e3c704ffe0c5e199e84ce4b3a857a2ec6",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefixCache.swift": "d9b015ac5121e52d92ec16c1232ab2cc84f007f6706cfed3fafd410f311225c0",
    "Sources/Slotstream/RequestControl.swift": "2500e0d05a21fd7dca9100bdefbaa18a5e7980e14844a6e99bf31357dba4c772",
    "Sources/Slotstream/ToolCallSplitter.swift": "75dba2c9d509c3f6f27781d6516f7ee95a4c471d1cac672aa698614b81065900",
    "Sources/Slotstream/Version.swift": "828a2207454f1a1b41b468de559dccea3be69b53358fd783d27e65404aea8441",
    "Tools/context_proxy.py": "d9b161bb41d86d485988e2397a4bbad664f175f36b8496cd470658840f0d8fa0",
    "Tools/context_proxy.swift": "73bab5c909e3777df613d5d8f9214638d61212f240b23452fed558418f822511",
    "Tools/fixtures/context-automatic-v1.json": "a7ce19b7e63ec46dea414dca9664c478df3cf561e591370ba92b855aeb8d99af",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/context-default-v2.json": "b4cc95efea11d41f85d6af96db10fecc2297605a3266dfc4da0c07f698c81d81"
  },
  "failures": [],
  "compiler_exit": 0,
  "exit_code": 0,
  "contracts": {
    "assertions": 964473,
    "failures": [],
    "gates": {
      "C01": 12,
      "C02": 4152,
      "C03": 7,
      "C04": 1221,
      "C05": 77,
      "C06": 958624,
      "C08": 5,
      "C09": 11,
      "C10": 19,
      "C13": 13,
      "C14": 12,
      "C15": 16,
      "C23": 68,
      "M01": 236
    },
    "hardware_qualified": false,
    "model_loaded": false,
    "passed": true
  }
}
```

## Public CLI matrix

Captured stdout/report SHA-256: `bac8df03b87fd49425aae25657a790a93118339679d23ebe21d746b3029e9e6e`.

```text
{
  "passed": true,
  "model_loaded": false,
  "hardware_qualified": false,
  "binary_sha256": "3b928b6f9590f188b808b5c39f04d1eabe8e814f279ee0456d968cc959c23ef8",
  "cases": 399,
  "failures": []
}
```

## Human-readable doctor comparisons

Captured stdout/report SHA-256: `b08861c1d237f67bcb9dd61ef141f3e465e5a76b7e60b33bf0ebec338af00a3c`.

```text
{
  "passed": true,
  "cases": 2,
  "model_loaded": false,
  "binary_sha256": "28e92ae517c9d052c56c6e93fe123ba44c96a5944e08541f7ff2865b35190100",
  "results": [
    {
      "available_gb": 18,
      "48_gb_row": "    48.0 GB   more than is reclaimable right now for a 32768-token window",
      "73_gb_row": "    73.0 GB   above this Mac's 51.5 GB Metal working set"
    },
    {
      "available_gb": 60,
      "48_gb_row": "    48.0 GB        265/512      ~12 tok/s    4096   ~3.0 min",
      "73_gb_row": "    73.0 GB   above this Mac's 51.5 GB Metal working set"
    }
  ]
}
```

## Native preference and lifecycle checks

Captured stdout/report SHA-256: `61e71ae9b3fc964f992f396fc13621724f943ceb68c2633d1e23852594143330`.

```text
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
```

## Production UI rendering in both appearances

Captured stdout/report SHA-256: `209a0d3c3891030108bc8c357320a58544090328e3056b719ddaca2a79ff0eda`.

```text
Building for debugging...
[0/4] Write sources
[1/4] Write swift-version--1AB21518FC5DEDBE.txt
[2/5] Write sources
[4/9] Emitting module Slotstream
[5/9] Compiling Slotstream BoundedOutput.swift
[6/9] Compiling Slotstream Context.swift
[7/9] Compiling Slotstream Generate.swift
[8/13] Compiling Slotstream Engine.swift
[9/14] Compiling Slotstream PersistentPrefixGenerator.swift
[10/14] Compiling Slotstream Governor.swift
[11/14] Compiling Slotstream PrefixCache.swift
[12/14] Compiling Slotstream Server.swift
[13/17] Compiling Slotstream CodingToolLaunch.swift
[14/17] Compiling Slotstream ContextMemory.swift
[15/17] Compiling Slotstream Plan.swift
[16/19] Emitting module SevraRuntime
[17/19] Compiling SevraRuntime Inference.swift
[18/22] Emitting module SevraMac
[19/22] Compiling SevraMac AppModel.swift
[20/22] Compiling SevraMac ContentView.swift
[21/25] Compiling SevraMac AppModelWork.swift
[22/25] Compiling SevraMac MiniAppHost.swift
[23/27] Compiling SevraMac ResponseDetails.swift
[24/27] Compiling SevraMac SevraMain.swift
[25/27] Compiling SevraMac WorkViews.swift
[25/28] Write Objects.LinkFileList
[26/28] Linking Sevra
[27/28] Applying Sevra
Build of product 'Sevra' complete! (19.03s)
PASS: light-automatic, rendered controls, current budget, supported range and pending state
PASS: light-custom, rendered controls, current budget, supported range and pending state
PASS: dark-automatic, rendered controls, current budget, supported range and pending state
PASS: dark-custom, rendered controls, current budget, supported range and pending state
```

## Native real-model deferred change and recovery

Captured stdout/report SHA-256: `2430760225f172109586470e8a87ff734f20167054d9eebfbc631e23dd9b8970`.

```text
engine ready in 2.4s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
REAL_TURN cold seconds=15.549182541668415 status=completed
REAL_TURN warm-change seconds=14.990665624965914 status=completed
engine ready in 2.2s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
REAL_TURN reloaded seconds=16.096599916694686 status=completed
REAL_MEMORY peak_sampled_gb=7.62569124 released_gb=1.391184344 maximum_metadata_seconds=0.18185383337549865
GLOBAL_VM before=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 1522606, swapouts: 2145068, reclaimableBytes: 30160470016)) after=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 1522610, swapouts: 2145068, reclaimableBytes: 28015132672))
PASS: real lazy load, warm follow-up, deferred custom change, drained release/reload, lower ceiling, automatic idle release and preserved draft
```

## Corrected adaptive governor drill

Captured stdout/report SHA-256: `26ee93648cfe53ea010051790018fd9e1113fede10ed8b594239a998cc8b34af`.

```text
PREFLIGHT reclaimable_gb=31.411109888
COMMAND .build/adaptive-memory-b62wzo2b/diagnostics-final/slotstream elastic-drill --slots 1000 --max-memory-gb 13 --memory-limit-gb 13 --mtp off
engine ready in 1.7s: expert cache ~33/512 per layer (1576 global slots = 4.4 GB), eos [248044, 248046]
  (machine has 33.8 GB reclaimable; drill capped at a 4.4 GB pool)
  start:  1576 slots (~33/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~33 → ~13 experts/layer (4.4 → 1.8 GB pool, cold — refills from SSD)
  squeeze: 640 slots (~13/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 7.8 GB available -> 1576 desired slots (2.6 GB growth)
  cooldown: held at 640 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~13 → ~33 experts/layer (1.8 → 4.4 GB pool, contents kept)
  recover: 1576 slots (~33/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":true,"lifetime_physical_footprint_peak_bytes":10084650488,"lifetime_rss_peak_bytes":3208265728,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":9935900200,"sampled_peak_bytes":10040954384,"samples":3702,"swap_clean":false,"swapins_after":1535737,"swapins_before":1535617,"swapouts_after":2145068,"swapouts_before":2145068,"target_gb":13}
ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
```

## Governor policy checks

Captured stdout/report SHA-256: `549caf742ddadecee745582188272fb007273fc2c05086ceb4420f9f4808e834`.

```text
PASS  quiet machine at target: hold
PASS  availability collapses: shrinks
PASS    ...and says why
PASS    ...converges in one step (no ratcheting)
PASS  target depends on (available + pool), not on either alone
PASS  small drop inside the shrink dead-band: hold
PASS  small gain inside the grow dead-band: hold
PASS  grow blocked while a resize is recent
PASS  grow blocked while pressure is recent
PASS  grow allowed once calm and cooled
PASS  grow restores the planner's prefill and prefix budgets
PASS    ...and says why
PASS  warning pressure sheds >= max(2 GB, 15%)
PASS    ...ignores the resize cooldown
PASS  critical pressure sheds >= max(4 GB, 50%)
PASS  critical sheds strictly more than warning
PASS  repeated critical pressure converges to the floor
PASS  floor is never breached
PASS  at the floor, more pressure is a no-op
PASS  never asks for more slots than the model has
PASS  governor preserves loaded MTP
PASS  governor preserves vision allowance
PASS  governor preserves vision reservation
PASS  governor preserves explicit context cap
PASS  resident charge is not spent on experts
PASS  unavailable budget cannot silently unload a resident head

governor policy: passed 26, failed 0
```

## Earlier drill with hand-sized fixture, retained failure

Captured stdout/report SHA-256: `2b66bb846872d20f94e0f5807256ee7dc1ec7afc5b23925b20a8db4a88d2b720`.

```text
engine ready in 1.8s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 33.6 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 23.1 GB available -> 1576 desired slots (2.2 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~17 → ~33 experts/layer (2.2 → 4.4 GB pool, contents kept)
  recover: 1576 slots (~33/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_physical_footprint_peak_bytes":10052537920,"lifetime_rss_peak_bytes":3213410304,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":9615036016,"sampled_peak_bytes":10033188416,"samples":3807,"swap_clean":false,"swapins_after":1522774,"swapins_before":1522770,"swapouts_after":2145068,"swapouts_before":2145068,"target_gb":12.554587904}
ELASTIC DRILL FAIL
  - real reclaimable memory cannot reconstruct the bounded starting pool
```

## Model-lock refusal before allocation, retained diagnostic

Captured stdout/report SHA-256: `b58ce217d1a9d818a65d3a88d3021e8481168b399250a333cc3c66da1fe8f751`.

```text
PREFLIGHT reclaimable_gb=25.876578304
COMMAND .build/adaptive-memory-b62wzo2b/diagnostics-final/slotstream elastic-drill --slots 1000 --max-memory-gb 13 --memory-limit-gb 13 --mtp off
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_physical_footprint_peak_bytes":13550240,"lifetime_rss_peak_bytes":52674560,"output_ids":[],"physical_footprint_end_bytes":13550240,"sampled_peak_bytes":13550240,"samples":8,"swap_clean":true,"swapins_after":1535530,"swapins_before":1535530,"swapouts_after":2145068,"swapouts_before":2145068,"target_gb":13}
Error: another Slotstream model process is already running for this user — stop it before starting run, serve, parity, or a heavyweight check. `slotstream stop` stops a server, also one `slotstream launch` keeps in the background.
```

## Implementation and check source hashes

Captured stdout/report SHA-256: `d7e0b24e4111ee7026093b7082b7d0a4bcaedd225c20797d87c4a362c8a1f384`.

```text
{
  "Sources/Slotstream/Machine.swift": "bca4a53e6e7568433c15f996eed5306acc66a78d44d3ade43450f1bc39695955",
  "Sources/Slotstream/Plan.swift": "732fd60fc9814292f230a08cc58b322e3c704ffe0c5e199e84ce4b3a857a2ec6",
  "Sources/Slotstream/ContextFeasibility.swift": "3e8d872da6aae5cecf59e82df694d496efb4f8f7fac7172789bcfbfe4014496a",
  "Sources/Slotstream/ContextWindowPolicy.swift": "8d2ef9e6be2c0a6929ae2ce055708c5200bed334dd3d1ebbb760bcb6f550a160",
  "Sources/Slotstream/Engine.swift": "98a04b2ee94c2068748b9072b44202f1c94df0cdf4d5992c3cdb4f296ee34e26",
  "Sources/Slotstream/Governor.swift": "c1960fc1cf267e096f5f1a7490756a68ed59f050d1df445fc78b4ea31338b935",
  "Sources/slotstream-cli/main.swift": "ab8b62d9da6e2506d896d318456685f9cc58a447bd94a59313d5ff9acf078729",
  "apps/macos/Runtime/Performance.swift": "4bd77b73a631fe916988c630f7d66da8f23ac305567e17dfa1bc8becb9a21836",
  "apps/macos/App/ContentView.swift": "3c837e69c54de363fa636c4a37c9028888e9b9b2ed38fc3ff9202dd2be234cc8",
  "apps/macos/Checks/PerformanceChecks.swift": "cd3289f1c8adba1d33ffc435c49fcae1f1950675ac78797cf2481cbafcfc8a23",
  "apps/macos/NativeChecks/MemoryUIChecks.swift": "e3f8ab22232ebc2b101eaae12ce7ab3d171f2670cca5d46c6713c35c44b57926",
  "Tools/check_sevra_memory_ui.sh": "9f5b34871d25e8444aee241713762b5b83925c8857553ab0beeec03fc56654fb",
  "Tools/memory_override_gate.py": "0a34023eb48e820ce563bfd461ecaae41750d23340b8cc0f1f6d64cb808cc845",
  "Tools/context_proxy.swift": "73bab5c909e3777df613d5d8f9214638d61212f240b23452fed558418f822511"
}
```
