---
type: decision
id: 01m7fcsd5fdrbqpby393aj1ejw
created: 2026-11-15T10:41:59.983275922+00:00
updated: 2026-11-15T10:41:59.983275922+00:00
summary: Wire MLX buffers up to the plan's total-process target instead of MLX's default of none
decided_on: 2026-11-13
evidence: '[[records/measurements/pr143-wired-limit-swap-ab]]'
reversible_if: A Mac with the target within its RAM shows the wired limit causing a jetsam kill, a refused allocation the planner allowed, or a slower clean comparison than pageable buffers; or MLX changes the wired limit's semantics.
title: Wire MLX buffers up to the memory target
status: standing
---
The engine sets MLX's wired limit to the plan's total-process target (`--memory-gb`, or the automatic target) right after the allocator cache limit. MLX's own default is 0, which keeps no Metal buffer resident.

## Kind of limit and scope

This is an operating default inside the existing safety envelope. It changes how much of the already-planned process budget macOS may compress or page out. It does not raise the target and adds no new allocation: the planner, real-headroom checks and the process ceiling are unchanged. If MLX rejects the limit, the engine prints a warning and continues with pageable buffers, which is the old behavior.

## Evidence

On [[records/machines/mac-mini-m4-32gb-three-copies]] at a 27 GB target, two base runs without the limit lost their server early in a 32736-token prefill after 82292 and 50304 swap-outs. Two runs with the limit completed cold, reuse and disk-restore phases with 0 swap-outs; [[records/measurements/pr143-wired-limit-swap-ab]] has the numbers. The tradeoff is that wired pages cannot be reclaimed by macOS for other applications while the server holds them; the target already reserves that memory for the process, so the displaced cost is the compressor's ability to borrow from an idle pool.

The evidence is one Mac with the target near its RAM. Macs with more headroom were not measured; on them the limit should change little because macOS had no reason to compress the pool.

## Override

There is no separate flag. Lowering `--memory-gb` lowers the wired amount with the target.
