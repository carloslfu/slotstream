---
type: measurement
meta-type: conclusion
id: 01m27vx4yswedswymwcvef4tfc
created: 2026-09-11T09:13:46.713403+00:00
updated: 2026-09-11T09:13:46.713403+00:00
summary: Two-draft default implementation and bounded checks
date: 2026-09-11
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1170'
runs: '[[sources/runs/2026/09/2026-09-11-draft-depth-two-default]]'
title: Two-draft default implementation and bounded checks
status: measured
---
**Two draft tokens are now the source default, explicitly adopted by Carlos after the completed depth study.** This change implements [[records/decisions/draft-depth-defaults-to-two]]; it does not change the performance study's original qualification outcome or establish a universal optimum.

`Generator.defaultDraftDepth` owns the value shared by the Swift library and CLI help. Missing or invalid `SLOTSTREAM_DRAFT_DEPTH` values fall back to two; valid 1...16 overrides remain supported. Existing programmatic overrides, context bounds and the opt-in adaptive policy remain intact. The MTP activation floor, global automatic RAM share, weights, sampling and rollback algorithms did not change. Existing depth-one diagnostics and frozen historical studies retain their explicit settings.

**Verification on the 48 GiB M5 Pro.** A guarded, two-job build passed. The complete T0 suite passed all 33 checks and 25,412 assertion items, including default/fallback and override coverage. All static gates passed, including planner, installer, downloader, generated-document and claim checks. Native CLI help prints two drafts from the shared constant.

The bounded serving probe used a fresh process for each arm, a 10 GB target, MTP on, vision off and one 32-output-token greedy response without warmup. With no depth environment variable, the default arm recorded 28 drafted tokens over 14 verification passes, exactly two per pass. With the explicit depth-one override, the second arm recorded 16 drafts over 16 passes. Both completed without memory-pressure cancellation. These demonstrate configuration behavior; their timings are not a performance comparison or full correctness qualification.

**The full MTP/vision diagnostic remains incomplete.** Both 12 GB attempts stopped on the native global swap guard. The first passed its initial 48-token greedy determinism and speculation-ran checks before stopping. Its observed swap-in delta was four pages; the retry's was eight. Neither observed a swap-out increase within its native measurement window, but both returned `memory_validated: false` and are discarded for qualification. No guard was relaxed and no failed result was replaced.

All 150 compiled source inputs still matched the captured candidate identity at closure. The unpublished candidate SHA256 is `e32e9cd33b569984bc5c15f21b79ae2cb601f99392ffb6ea6e5aedf12f460be7`. The installed public 0.2.14 artifact remains unchanged and retains its former default unless overridden; this task did not publish or install a release. Test-only bench details were confined to child environments. Every owned model process stopped and the native lock was free.

Help, README, CLI/engineering documentation, agent instructions, claims and current plan annotations now refer to two. Prospective Expert Lookahead accounting includes the pending token plus two drafts, three position biases and a conservative three-position storage bound, with a fresh P0 freeze required. Historical one-draft multipliers remain labeled as historical one-draft evidence.

Raw commands, logs, build source, request/response wires, resource failures and cleanup evidence were captured first in [[sources/runs/2026/09/2026-09-11-draft-depth-two-default]]. The prior performance comparison remains [[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]].
