---
type: run
meta-type: fact
created: 2026-09-21T05:57:16.722844+00:00
updated: 2026-09-21T05:57:16.722844+00:00
summary: Second memory review fixes small-cache recovery, fractional limits and response reporting, with final policy and live gates.
binary: 30542ceec060dee893d5589fafddef5da8437b2c27169ca72eefc26b275a27de
captured_at: 2026-09-21
command: Exact commands and raw outputs below and in the evidence archive
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Adaptive memory second adversarial review
tool: source review, policy contracts, public CLI, native runtime and UI checks
---
# Adaptive memory second review

This extends [[sources/runs/2026/09/2026-09-21-adaptive-memory-adversarial-review]]. The earlier complete live drill used a large enough cache to cross the normal growth band. A smaller cache could donate less than that band and never recover. The same gap affects a cache starting small on a busy Mac.

The final governor lets the cache reach its supported ceiling once availability no longer clamps the fresh plan. Both cooldowns, the complete live feasibility check and the saved ceiling still apply. Continued contention keeps the ordinary growth band. An intermediate fix tracked prior donations; it was replaced because it missed busy startup and added unnecessary mutable state. Final policy tests reproduce busy startup, small recovery, continued contention, cooldowns and lower ceilings. The final live small and full drills prove the actual resize path, exact outputs and bounded memory.

Other corrections retain fractional target precision in JSON and child arguments, explain the reachable hardware/RAM-share bound while busy, log explicitly disabled elasticity, and preserve the saved ceiling separately from a response's current budget. Older stored responses decode without inventing a ceiling. The actual native lifecycle verifies that a pending change does not rewrite the active response's limit.

## Coverage and evidence

[Raw archive](../../../artifacts/adaptive-memory-second-review-2026-09-21/evidence.tar.gz) preserves the path matrix, source snapshots, build outputs, intermediate failures, final reports and all eight UI renders. [Manifest](../../../artifacts/adaptive-memory-second-review-2026-09-21/manifest.json) gives the SHA-256 and byte count for every member; every member was reopened and verified. Model weights, executables and disposable Homes are excluded.

Final release CLI: `.build/memory-review2-complete-igewatq5/slotstream`, SHA-256 `30542ceec060dee893d5589fafddef5da8437b2c27169ca72eefc26b275a27de`. The final native executable is a separate debug build with SHA-256 `f5cdbf775582fe2b7f80a15803eae6030a9efb5078a40bbe8725d75d20b74b6b`. Core policy source hashes match the final proxy. Concurrent unrelated work remains in this checkout; these checks do not certify all unrelated changes.

The review traced CLI inputs, fixed/adaptive conflicts, planner and context selection, plan copies, startup validation, launch forwarding/reuse, server metadata and timer behavior, governor pressure/poll/cooldown/resizing, native preference migration, deferred changes, release/reload, persisted response details and rendered settings. Fixed-profile diagnostics still refuse unsupported adaptive flags. The previous source receipt retains the server context-copy counterexample.

Final results: 420 public CLI cases; 964819 pure assertions, including 582 memory assertions; 56 T0 groups and 29478 assertions, no failures or skips. Native policy accepted 85 feasible cases and refused 215, with deferred changes, sleep, idle and context-refusal checks passing. Response persistence/backward decoding and all eight production renders passed. Harness suites passed 22 status/dispatch, 3 cleanup, 7 planner-harness and 9 context-qualification tests.

The final small drill restored 961 to 640 to 961 slots. The final full drill restored 1576 to 640 to 1576. Both held cooldowns and returned identical token IDs. The final public server retained a 9.99 GB ceiling through the real timer and a completed request; the explicit no-elastic path also completed a request and logged its pinned behavior. Native real work completed cold and warm turns, deferred a 10-to-9 GB change until the response ended, reloaded within the lower ceiling, released on idle and preserved the draft.

Commands from the repository root (exact child invocations also ride in the archive):

```sh
swift build -c release --product slotstream -j 2
python3 Tools/context_proxy.py --out /tmp/memory-review2-complete-proxy
python3 Tools/memory_override_gate.py --binary .build/memory-review2-complete-igewatq5/slotstream --out /tmp/memory-review2-complete-cli.json
swift build -c release --product slotstream-checks --disable-build-manifest-caching -j 2
.build/release/slotstream-checks --tier t0 --json
.build/memory-review2-complete-igewatq5/slotstream elastic-drill --memory-limit-gb 10 --max-memory-gb 10 --mtp off
.build/memory-review2-complete-igewatq5/slotstream elastic-drill --slots 1000 --max-memory-gb 13 --memory-limit-gb 13 --mtp off
python3 Tools/adaptive_memory_e2e.py --binary .build/memory-review2-complete-igewatq5/slotstream --limit-gb 9.99 --out /tmp/memory-review2-complete-fractional-server
python3 Tools/adaptive_memory_e2e.py --binary .build/memory-review2-complete-igewatq5/slotstream --limit-gb 9.99 --no-elastic --out /tmp/memory-review2-complete-pinned-server
swift build --package-path apps/macos --product sevra-mac-checks -j 2
/tmp/memory-review2-native-complete/sevra-mac-checks --performance
/tmp/memory-review2-native-complete/sevra-mac-checks --response-details
/tmp/memory-review2-native-complete/sevra-mac-checks --performance-real --home /tmp/memory-review2-native-home
SEVRA_UI_OUT=/tmp/memory-review2-ui-final bash Tools/check_sevra_memory_ui.sh
python3 Tools/verify_binary_test.py
```

## Intermediate failures and scope

A concurrent diagnostics edit temporarily broke the shared release build; its owner corrected it. New native test variables initially collided with older fixture names and were renamed. The first response screenshot had a transparent background, hiding dark text from OCR; the fixture now supplies the popover background and all final renders were inspected. SwiftPM retained one test-kit object compiled against the intermediate governor initializer; forcing its recompilation yielded the passing T0 result. Two model launches were safely refused because another task held the normal model lock. Their incomplete receipts remain archived, and are not counted as passing drills. The final retries preserve that lock and do not stop the other task's processes.

This is functional and process-memory evidence. Global paging is recorded separately, not attributed to Slotstream and not used to claim clean benchmark speed. Ordinary model runs use bounded small targets with real headroom; the full drill requires at least 16 GB reclaimable and no concurrent heavy build. Every owned model/test driver finishes or reaps its child. No memory hog was used. Larger hardware is simulated, not real allocation qualification on a 64 GiB Mac. The entire release battery was not rerun and no release was published.

## Final small recovery

```text
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
  (machine has 30.0 GB reclaimable; drill capped at a 2.7 GB pool)
  start:  961 slots (~20/layer) -> Nile, Amazon, Yangtze
elastic: memory pressure (warning) — cache ~20 → ~13 experts/layer (2.7 → 1.8 GB pool, cold — refills from SSD)
  squeeze: 640 slots (~13/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 5.5 GB available -> 961 desired slots (0.9 GB growth)
  cooldown: held at 640 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~13 → ~20 experts/layer (1.8 → 2.7 GB pool, contents kept)
  recover: 961 slots (~20/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":10,"complete":true,"lifetime_physical_footprint_peak_bytes":8453967136,"lifetime_rss_peak_bytes":3178856448,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":8094092576,"sampled_peak_bytes":8404716832,"samples":3615,"swap_clean":true,"swapins_after":1544331,"swapins_before":1544331,"swapouts_after":2145072,"swapouts_before":2145072,"target_gb":10}
ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
```

## Final full recovery

```text
engine ready in 0.7s: expert cache ~33/512 per layer (1576 global slots = 4.4 GB), eos [248044, 248046]
  (machine has 32.4 GB reclaimable; drill capped at a 4.4 GB pool)
  start:  1576 slots (~33/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~33 → ~13 experts/layer (4.4 → 1.8 GB pool, cold — refills from SSD)
  squeeze: 640 slots (~13/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 7.8 GB available -> 1576 desired slots (2.6 GB growth)
  cooldown: held at 640 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~13 → ~33 experts/layer (1.8 → 4.4 GB pool, contents kept)
  recover: 1576 slots (~33/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":true,"lifetime_physical_footprint_peak_bytes":10110782872,"lifetime_rss_peak_bytes":3180232704,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":9793310152,"sampled_peak_bytes":10028027312,"samples":3534,"swap_clean":false,"swapins_after":1544343,"swapins_before":1544339,"swapouts_after":2145072,"swapouts_before":2145072,"target_gb":13}
ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
```

## Native real lifecycle

```text
engine ready in 1.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
REAL_TURN cold seconds=15.824404708342627 status=completed
REAL_TURN warm-change seconds=11.499174083350226 status=completed
engine ready in 1.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: on — cache auto-resizes with memory availability between requests (--no-elastic to pin)
REAL_TURN reloaded seconds=14.356108833337203 status=completed
REAL_MEMORY peak_sampled_gb=7.552765936 released_gb=1.337428248 maximum_metadata_seconds=0.1364772083470598
GLOBAL_VM before=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 1544101, swapouts: 2145068, reclaimableBytes: 29378887680)) after=Optional(Slotstream.ProcessMemory.VMActivity(swapins: 1544125, swapouts: 2145072, reclaimableBytes: 22905520128))
PASS: real lazy load, warm follow-up, deferred custom change, drained release/reload, lower ceiling, automatic idle release and preserved draft
```

## Native policy

```text
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
```

## Response persistence

```text
PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows
PASS: a thinking job records exact per-round numbers, a refused round counts, thoughts keep one step per round, numbers persist without text, older runs still decode, live speed while thinking and writing, notes for the eight most recent runs
```

## Rendered UI

```text
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
Building for debugging...
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
Build of product 'Sevra' complete! (5.71s)
PASS: light-automatic, rendered controls, current budget, supported range and pending state
PASS: light-custom, rendered controls, current budget, supported range and pending state
PASS: light-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: light-response-budget, reduced budget and saved ceiling remain readable
PASS: dark-automatic, rendered controls, current budget, supported range and pending state
PASS: dark-custom, rendered controls, current budget, supported range and pending state
PASS: dark-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: dark-response-budget, reduced budget and saved ceiling remain readable
```

## Public fractional server

```text
{
  "passed": true,
  "binary_sha256": "30542ceec060dee893d5589fafddef5da8437b2c27169ca72eefc26b275a27de",
  "limit_gb": 9.99,
  "no_elastic": false,
  "preflight_available_gb": 32.569688064,
  "command": [
    "slotstream",
    "serve",
    "--memory-limit-gb",
    "9.99",
    "--max-context",
    "32768",
    "--max-prefill-wait",
    "17",
    "--mtp",
    "off",
    "--vision",
    "off",
    "--port",
    "56112"
  ],
  "completion": {
    "finish_reason": "stop",
    "index": 0,
    "message": {
      "role": "assistant",
      "content": "The Nile."
    }
  },
  "server_reaped": true
}
```

## Public pinned server

```text
{
  "passed": true,
  "binary_sha256": "30542ceec060dee893d5589fafddef5da8437b2c27169ca72eefc26b275a27de",
  "limit_gb": 9.99,
  "no_elastic": true,
  "preflight_available_gb": 32.94388224,
  "command": [
    "slotstream",
    "serve",
    "--memory-limit-gb",
    "9.99",
    "--max-context",
    "32768",
    "--max-prefill-wait",
    "17",
    "--mtp",
    "off",
    "--vision",
    "off",
    "--port",
    "56065",
    "--no-elastic"
  ],
  "completion": {
    "finish_reason": "stop",
    "message": {
      "content": "The Nile.",
      "role": "assistant"
    },
    "index": 0
  },
  "server_reaped": true
}
```
