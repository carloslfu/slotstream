---
type: decision
id: 01m7fcsd5fdrbqpby393aj1ejw
created: 2026-11-15T10:41:59.983275922+00:00
updated: 2026-11-17T14:01:33.249126583+00:00
summary: SLOTSTREAM_WIRED_LIMIT=1 wires MLX buffers up to the plan target; off by default until it is measured on a Mac in desktop use
decided_on: 2026-11-15
evidence: '[[records/measurements/pr143-wired-limit-swap-ab]]'
reversible_if: A comparison on a Mac in ordinary desktop use, with other applications open and the automatic target, shows no application killed for memory, no added pressure cancellations and no slower clean run than pageable buffers, which would justify making it the default for the measured configuration; or a Mac shows the limit causing a kill, a refused allocation the planner allowed or a slower clean run, which would remove it; or MLX changes what the wired limit means
title: Wiring MLX buffers to the memory target is opt-in
status: standing
---
Carlos approved shipping the wired limit as opt-in first on November 15, 2026 ("Do it all", answering a proposal to land it that way). This replaces the first version of this record, written with the change in [#143](https://github.com/carloslfu/slotstream/pull/143), which made it an operating default.

## Decision

`SLOTSTREAM_WIRED_LIMIT=1` sets MLX's wired limit to the plan's total-process target (`--memory-gb`, or the automatic target) before the pool and weights are allocated. MLX's own default is 0, which keeps no Metal buffer resident. Without the switch nothing changes.

The switch is its own variable and not one of the `SLOTSTREAM_OPT_` inference options, because those are part of a saved prefix's identity and wiring changes no arithmetic.

`WiredLimit` clamps the limit to the Metal working set, reports a refusal and leaves buffers pageable, moves the limit when a resize moves the target, and puts back the limit that was in force when the engine is released.

## Kind of limit and scope

It changes how much of the already-planned process budget macOS may compress or page out. It does not raise the target and adds no allocation: the planner, real-headroom checks and the process ceiling are unchanged. Wired pages cannot be reclaimed by macOS for other applications while the process holds them, so under pressure the cost moves to whatever else is running.

## Evidence
On [[records/machines/mac-mini-m4-32gb-three-copies]] at a 27 GB target, two base runs without the limit lost their server early in a 32736-token prefill after 82292 and 50304 swap-outs. Two runs with the limit completed cold, reuse and disk-restore phases with 0 swap-outs; [[records/measurements/pr143-wired-limit-swap-ab]] has the numbers. Those runs used a build that set the limit unconditionally, on a Mac with user applications stopped.

The same comparison on `4423adb5` with `SLOTSTREAM_WIRED_LIMIT=1` is in [[records/measurements/pr143-opt-in-wired-limit-rerun]]. Both wired runs completed with 0 swap-outs, compressed about 0.3 to 0.4 million pages and prefilled the 32736-token prompt in about 501 s. One base run swapped 104480 pages and was refused by the harness; the other did not swap, but macOS compressed about 22 million pages during it and its prefill took 786.9 s. Pageable buffers cost time on this Mac even when they do not reach swap.
## Why opt-in
- The evidence is one Mac that mainly serves the model, with other applications stopped and an explicit target near its RAM. The automatic target and a Mac in ordinary desktop use were not measured, and that is where wired memory competes with other applications.
- MLX refuses a limit above the Metal working set, and an unhandled MLX error ends the process. A plan whose expected peak is above the working set loads today with a note to expect paging; setting the limit unconditionally would have ended that process at startup. `wired-limit-process` triggers the refusal and checks that it arrives as an error the engine reports.
- The measured Mac runs with `iogpu.wired_limit_mb` raised to 28700 at boot, and `slotstream doctor` reports a 30.1 GB Metal working set there, which is why MLX accepted a 27 GB limit. A stock 32 GiB Mac reports a smaller working set, where the limit is clamped.
- MLX keeps buffers resident only on macOS 15 and later, so the limit has no effect on macOS 14.

## Override

`SLOTSTREAM_WIRED_LIMIT=1` turns it on; `0` or unset leaves buffers pageable. Lowering `--memory-gb` lowers the wired amount with the target.
