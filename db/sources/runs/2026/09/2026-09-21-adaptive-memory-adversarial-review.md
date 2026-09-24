---
type: run
meta-type: fact
created: 2026-09-21T05:14:19.413821+00:00
updated: 2026-09-21T05:15:16.495194+00:00
summary: A reproduced server context-copy bug and launch/diagnostic/UI gaps were fixed; planner, CLI, native UI and real server/governor gates pass.
binary: 440020be36756e136dd5e4b91b0f679cd5fc28b6911f275c8f4dade70cac6bdf
captured_at: 2026-09-21
command: Exact commands and raw outputs below and in the evidence archive
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Adaptive memory adversarial review and server regression
tool: adversarial source review, planner contracts, public CLI and native gates
---
# Adaptive memory adversarial review

This follow-up corrects the incomplete coverage in [[sources/runs/2026/09/2026-09-20-adaptive-memory-limits]]. The earlier drill tested direct engine construction but missed the context setter that public `serve` always calls. That setter copied the plan without the saved adaptive ceiling. The before-fix public server reported a null ceiling immediately after a 10 GB limit was supplied; the governor could consequently replan toward the default. The reproduction disabled elasticity to avoid unintended growth. The repaired setter preserves the ceiling and simulation marker. Both the public-server regression and full governor drill now exercise that setter.

The review traced production plan constructors and copies, context selection, startup validation, runtime reservations, vision loading, governor decisions and plan publication, all CLI ModelOptions consumers, launch forwarding/server reuse, native preference migration and rendered settings. Launch now forwards and reports the adaptive ceiling. Fixed-profile diagnostics refuse a flag they cannot honor. Simulated unconstrained availability no longer reads live host availability. Invalid hand-built budget values fail validation. A saved native limit outside the hardware range remains visible with a correction message.

## Reproducible evidence

[Raw archive](../../../artifacts/adaptive-memory-review-2026-09-21/evidence.tar.gz) contains full CLI results, T0 results, proxy contracts, exact core/test source snapshots and hashes, build transcripts, server logs, UI renders and the initial failed fixtures. [Manifest](../../../artifacts/adaptive-memory-review-2026-09-21/manifest.json) gives every member's byte count and SHA-256; all archived members were reopened and verified. No model weights, binaries or user Home are included.

The frozen release CLI is `.build/adversarial-memory-l_w0lv_g/slotstream`, SHA-256 as in frontmatter. CLI execution and live model checks use that same executable. The standalone T0 executable and native app are separate builds; their raw output is retained. Core source hashes still matched the final proxy before recording. Concurrent unrelated changes exist in this checkout; this evidence does not certify every unrelated feature or a published release.

Commands from the repository root:

```sh
swift build -c release --product slotstream -j 2
python3 Tools/context_proxy.py --out /tmp/adversarial-memory-final-proxy
python3 Tools/memory_override_gate.py --binary .build/adversarial-memory-l_w0lv_g/slotstream --out /tmp/adversarial-memory-cli.json
swift build -c release --product slotstream-checks -j 2
.build/release/slotstream-checks --tier t0 --json
python3 Tools/adaptive_memory_e2e.py --binary .build/adversarial-memory-l_w0lv_g/slotstream --out /tmp/adversarial-memory-server-final
.build/adversarial-memory-l_w0lv_g/slotstream elastic-drill --slots 1000 --max-memory-gb 13 --memory-limit-gb 13 --mtp off
swift build --package-path apps/macos --disable-build-manifest-caching --product Sevra -j 2
SEVRA_UI_OUT=/tmp/adversarial-memory-ui-render bash Tools/check_sevra_memory_ui.sh
swift build --package-path apps/macos --disable-build-manifest-caching --product sevra-mac-checks -j 2
apps/macos/.build/debug/sevra-mac-checks --performance
python3 Tools/verify_binary_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/planner_gates_test.py
python3 Tools/process_cleanup_checks.py
```

The pure proxy passed 964805 assertions, including 568 adaptive-memory assertions. The public CLI passed 416 cases. T0 passed 56 groups, 29473 assertions, no failures or skips. Native policy accepted 85 feasible configurations and safely refused 215; state transitions passed. Six production settings renders passed in light and dark mode. The public server retained the 10 GB ceiling and 17-minute request deadline throughout its startup cooldown and a completed OpenAI request. The 13 GB drill shrank, held its cooldown and recovered to the original cache with identical token IDs and a lifetime physical-footprint peak below its explicit ceiling. Harness checks passed 16, 9, 7 and 3 tests respectively.

## Failed fixtures and limits

An expanded proxy fixture initially omitted a required `qualification` argument; correcting the fixture yielded the passing final proxy. The first public-server gate completed its metadata checks but sent unsupported `chat_template_kwargs`; it was corrected to the documented `reasoning_effort` field and rerun from a fresh server. A cached SwiftPM build list omitted a concurrently added source file; disabling build-manifest caching regenerated the list and the app compiled. The existing verification-harness fixture expected the old drill arguments; it now checks the adaptive drill arguments and all its status/failure tests pass. These intermediate failures are retained in the archive and not counted as passing checks.

Model runs were sequential, using the normal process lock and real reclaimable-memory preflights. The public server required at least 13 GB available and the full drill at least 16 GB, with internal target-plus-3 GB checks. Owned model processes were stopped/reaped; another task's later server was left alone. Global swap-ins changed during the drill, while swap-outs did not. This is functional and process-memory evidence, not a clean timing benchmark. Larger hardware is simulated only; no real 64 GiB allocation claim or universal zero-bug guarantee is made. No release was performed.

## Before-fix public server reproduction

```text
real_reclaimable_gb 27.871346688
{
  "requested_limit_gb": 10,
  "reported_limit_gb": null,
  "target_gb": 10,
  "source": "auto"
}
CONFIRMED: serve loses the adaptive limit during context assignment
server_reaped 48075 0
```

## Public CLI matrix summary

```text
{
  "passed": true,
  "model_loaded": false,
  "hardware_qualified": false,
  "binary_sha256": "440020be36756e136dd5e4b91b0f679cd5fc28b6911f275c8f4dade70cac6bdf",
  "cases": 416,
  "failures": []
}
```

## Native policy

```text
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
```

## Rendered production UI

```text
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
Building for debugging...
[0/3] Write swift-version--1AB21518FC5DEDBE.txt
Build of product 'Sevra' complete! (6.19s)
PASS: light-automatic, rendered controls, current budget, supported range and pending state
PASS: light-custom, rendered controls, current budget, supported range and pending state
PASS: light-saved-above-range, rendered controls, current budget, supported range and pending state
PASS: dark-automatic, rendered controls, current budget, supported range and pending state
PASS: dark-custom, rendered controls, current budget, supported range and pending state
PASS: dark-saved-above-range, rendered controls, current budget, supported range and pending state
```

## Repaired public server

```text
{
  "passed": true,
  "binary_sha256": "440020be36756e136dd5e4b91b0f679cd5fc28b6911f275c8f4dade70cac6bdf",
  "limit_gb": 10,
  "preflight_available_gb": 32.269647872,
  "command": [
    "slotstream",
    "serve",
    "--memory-limit-gb",
    "10",
    "--max-context",
    "32768",
    "--max-prefill-wait",
    "17",
    "--mtp",
    "off",
    "--vision",
    "off",
    "--port",
    "53841"
  ],
  "completion": {
    "finish_reason": "stop",
    "index": 0,
    "message": {
      "content": "The Nile.",
      "role": "assistant"
    }
  },
  "server_reaped": true
}
```

## Complete bounded governor drill

```text
engine ready in 0.7s: expert cache ~33/512 per layer (1576 global slots = 4.4 GB), eos [248044, 248046]
  (machine has 31.9 GB reclaimable; drill capped at a 4.4 GB pool)
  start:  1576 slots (~33/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~33 → ~13 experts/layer (4.4 → 1.8 GB pool, cold — refills from SSD)
  squeeze: 640 slots (~13/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 7.8 GB available -> 1576 desired slots (2.6 GB growth)
  cooldown: held at 640 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~13 → ~33 experts/layer (1.8 → 4.4 GB pool, contents kept)
  recover: 1576 slots (~33/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":true,"lifetime_physical_footprint_peak_bytes":10092711344,"lifetime_rss_peak_bytes":3194667008,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":9775009248,"sampled_peak_bytes":10041675208,"samples":3528,"swap_clean":false,"swapins_after":1539433,"swapins_before":1539317,"swapouts_after":2145068,"swapouts_before":2145068,"target_gb":13}
ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
```
