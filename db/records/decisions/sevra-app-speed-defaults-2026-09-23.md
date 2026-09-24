---
type: decision
id: 01m37frm1n2sm0grtjgj59xjt6
created: 2026-09-23T15:57:17.237252+00:00
updated: 2026-09-23T16:45:55.803837+00:00
summary: Enable qualified desktop speedups without extra user switches
decided_on: 2026-09-23
evidence: '[[records/measurements/sevra-app-optimizations-2026-09-23]]'
reversible_if: Repeated matched complete workflows or changed OS/backend semantics demonstrate a better tradeoff with unchanged numerical, privacy, process-budget and lifecycle gates.
title: Enable qualified desktop speedups without extra user switches
status: standing
---
Adopt these development-app defaults as one integration policy. Evidence and test limits: [[records/measurements/sevra-app-optimizations-2026-09-23]]. The complete source and rejected trials are in [[sources/runs/2026/09/2026-09-23-sevra-app-optimizations]].

1. Use the engine's existing automatic MTP qualification instead of forcing it off. Price the optional head and configured forecast correction inside the same total budget shown to the user. Desktop Automatic supplies the 33 GB adaptive ceiling explicitly; custom limits retain elasticity. The independent CLI's model-ceiling policy is unchanged. Missing optional weights and small plans use ordinary decoding automatically.
2. Prefer useful short-conversation checkpoints with at most 512-token compute passes below 1,536 prompt tokens, capped by the live plan. These are provisional Desktop operating choices, not model facts, context limits or proven optima. The larger workspace reservation remains charged, including its read-sharing capacity. Fixed 256-token passes cost too much on short reads and longer prompts; fixed 512 passes also tax longer inputs. Keep the throughput schedule at the boundary and above. Numerical provenance always wins over reuse. Apply selection inside the generation gate, with no mid-thought schedule change. The new embedding API defaults disabled, can be disabled again with a zero threshold, and does not alter ordinary CLI clients.
3. Retain a loaded model during foreground reading/composing. Automatic background inactivity, pressure, low-power/serious-thermal conditions and sleep still release it according to their existing policies. The readiness setting and explicit Release memory now remain user controls. No eager allocation, invisible preference migration or background autotuning is introduced.
4. Reuse a successful pinned-weight proof only inside the same LocalInference owner, on APFS with unchanged resolved path, device/inode/generation, size and nanosecond modification/change times. This is a cache of local verification work, separate from private conversation state. Unknown filesystems/signatures hash again. Clear prior proof before re-verifying; mutation during hashing fails closed. A new app process starts without proof.
5. Wait the remainder of a 1.05-second interval after releasing a model before replanning an immediate reload. The one-second part comes from XNU's host-statistics cache; 50 ms is an engineering margin. This applies only to immediate reloads, not ordinary warm turns or later reloads, and retains real admission guards. The need was reproduced after fast verification exposed a stale reading previously hidden by the long hash pass.

The objective is lower complete-conversation waiting with correct tools, exact cache provenance and bounded memory, without asking users to choose engine mechanisms. The measured tradeoff includes a slower checkpoint-creation turn, unchanged long-prompt work, retained foreground memory and the draft head's cost. Timing evidence comes from one M5 Pro/48 GiB machine at a 26 GB comparison budget; a separate 10 GB functional profile and simulated policy matrix do not establish other hardware's speed.

Revisit the pass threshold/size when repeated matched short and long workflows show lower total latency without a long-input regression, or when checkpoint costs/arithmetic change. Revisit MTP through the engine's existing activation qualification, never from an isolated best run. Revisit readiness with real return intervals and reload costs. Revisit the verification cache if supported filesystem identity guarantees or the pinned manifest contract change; uncertainty falls back to hashing. Revisit the reload interval if OS statistics semantics change or a fresh supported observation API removes the stale-reading problem. Keep phased thinking, tools, cancellation, cache/privacy/crossover, same-size corruption, process budgets, idle/sleep and actual build identity in the acceptance gates.


The completed native replay additionally found an unpriced warm-resize transient. Adopt piecewise append with preserved slot indices and physical-memory admission for temporary growth, across both app and CLI. Insufficient or unknown headroom defers growth and retains the warm cache, without another setting. Revisit if a replacement strategy demonstrates better recovery within the same process ceiling and exact-byte/output gates. Evidence: [[sources/runs/2026/09/2026-09-23-sevra-native-replay-growth]].
