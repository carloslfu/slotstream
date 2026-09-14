---
type: run
id: 01m2dvm9q6skx218e4dnxfx92j
created: 2026-09-13T17:04:23.269667+00:00
updated: 2026-09-13T17:04:23.269667+00:00
summary: 'Automatic context window candidate qualified without weights: 38 of 38 T0 checks, 90 of 90 planner gates; doctor plans from 8 to 192 GB in auto and at 32,768 tokens'
binary: 3626ba6795c124fc1a0587eb017b82ff1cd449925efd8808905cc62150aee7db (candidate built from dfc9b36)
captured_at: 2026-09-13
command: 'see body: make build, slotstream-checks --tier t0 --json, Tools/planner_gates.sh, doctor --sim-ram N --json with and without --max-context 32768'
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Automatic context window: checks and plans by Mac memory'
tool: slotstream doctor, slotstream-checks, Tools/planner_gates.sh
---
Weights-free qualification of the candidate that chooses the context window per Mac ([[records/plan/configurable-context-window-2026-09-06]]). The source is commit `dfc9b36` on branch `claude/context-auto-window`, rebased onto `7122ff3`. No model was loaded for these checks.

## Build

    SLOTSTREAM_BUILD_JOBS=2 make build

Binary `3626ba6795c124fc1a0587eb017b82ff1cd449925efd8808905cc62150aee7db`. Its build identity lists 162 source files, and every hash matches the clean checkout. An earlier build of the same source bytes, `e76cf2ff14cc87e286346fe23098bcb836af2595b45c06e2782c0ecc057e7363`, carried the development runs described below. The rebase changed file times but no source bytes, so the candidate was rebuilt for a clean identity.

## Checks

    .build/release/slotstream-checks --tier t0 --json
    SLOTSTREAM_TEST_BINARY=.build/release/slotstream Tools/planner_gates.sh

- T0: 38 of 38 checks passed on `3626ba67`.
- Planner gates: 90 passed, 0 failed on `3626ba67`. The automatic section checks each simulated tier's window, the default automatic choice, a fixed cache keeping 32,768, an explicit window planned as given, a 128 GB plan at 262,144 with a 54.7 GB target, a 128 GB start with 40 GB available lowering the window to 131,072 with the draft head on, a 16 GB explicit 65,536 falling back to the retention share with a note, the JSON candidates at 64 GB, the serve help and a refused non-numeric window.
- On the earlier identical build, the first planner-gate run failed five checks that assumed a fixed 32,768-token window: the max-RAM-percent knee, the monotonic memory sweep, the busy-start text, the wrapped serve help and a prefill-schedule comparison that read a null wait. Those checks now pin `--max-context 32768` or read the report's lowered line. T0 first failed three checks that assumed the 65,536 public ceiling; they now expect the model limit.

## Plans by simulated memory

    slotstream doctor --sim-ram N --json
    slotstream doctor --sim-ram N --max-context 32768 --json

The installed model carries the draft head. Availability equals RAM and the working set is 75% of RAM. Warm decode and full-window waits are the planner's M5 Pro-based estimates.

8 GB is refused: insufficient_memory: allocation exceeds working set or reclaimable memory with safety headroom

| RAM (GB) | Window | Target (GB) | Draft head | Lookahead | Experts per layer | Retained tokens | Warm decode est. (tok/s) | Full-window wait est. | Target at 32,768 (GB) | Experts at 32,768 | Warm at 32,768 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 16 | 32,768 | 10.0 | off | off | 20 | 13,382 | 4.00 | 6.4 min | 10.0 | 20 | 4.00 |
| 18 | 32,768 | 11.5 | off | off | 28 | 18,807 | 5.54 | 4.4 min | 11.5 | 28 | 5.54 |
| 24 | 32,768 | 16.0 | off | off | 54 | 32,768 | 7.61 | 3.3 min | 16.0 | 54 | 7.61 |
| 32 | 32,768 | 22.0 | on | on | 74 | 32,768 | 8.68 | 3.1 min | 22.0 | 74 | 8.68 |
| 36 | 65,536 | 25.0 | on | on | 75 | 65,536 | 8.72 | 7.5 min | 25.0 | 96 | 9.68 |
| 40 | 65,536 | 28.0 | on | on | 97 | 65,536 | 9.72 | 7.5 min | 28.0 | 119 | 10.55 |
| 48 | 65,536 | 33.6 | on | on | 140 | 65,536 | 11.26 | 7.5 min | 33.6 | 161 | 11.60 |
| 56 | 131,072 | 39.2 | on | on | 139 | 131,072 | 11.23 | not calibrated | 34.6 | 149 | 11.56 |
| 64 | 131,072 | 43.2 | on | on | 149 | 131,072 | 11.56 | not calibrated | 34.6 | 149 | 11.56 |
| 72 | 262,144 | 50.4 | on | on | 137 | 262,144 | 11.16 | not calibrated | 34.6 | 149 | 11.56 |
| 80 | 262,144 | 54.7 | on | on | 149 | 262,144 | 11.56 | not calibrated | 34.6 | 149 | 11.56 |
| 96 | 262,144 | 54.7 | on | on | 149 | 262,144 | 11.56 | not calibrated | 34.6 | 149 | 11.56 |
| 128 | 262,144 | 54.7 | on | on | 149 | 262,144 | 11.56 | not calibrated | 34.6 | 149 | 11.56 |
| 192 | 262,144 | 54.7 | on | on | 149 | 262,144 | 11.56 | not calibrated | 34.6 | 149 | 11.56 |

## Candidates

Each candidate's cost is the change in the planner's estimated time for 2,000 prompt tokens and a 400-token reply against the 32,768-token plan. A candidate that cannot keep one complete conversation has no cost.

| RAM (GB) | Candidate | Result | Cost | Target (GB) | Experts per layer | Reason |
|---|---|---|---|---|---|---|
| 16 | 32,768 | chosen | +0.0% | 10.0 | 20 | default window |
| 16 | 65,536 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 16 | 131,072 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 16 | 262,144 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 18 | 32,768 | chosen | +0.0% | 11.5 | 28 | default window |
| 18 | 65,536 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 18 | 131,072 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 18 | 262,144 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 24 | 32,768 | chosen | +0.0% | 16.0 | 54 | default window |
| 24 | 65,536 | rejected | +17.7% | 16.0 | 33 | adds 17.7% to a typical request, above the 10% limit |
| 24 | 131,072 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 24 | 262,144 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 32 | 32,768 | chosen | +0.0% | 22.0 | 74 | default window |
| 32 | 65,536 | rejected | +2.2% | 22.0 | 78 | turns speculative decoding off |
| 32 | 131,072 | rejected | +30.7% | 22.0 | 37 | turns speculative decoding off |
| 32 | 262,144 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 36 | 32,768 | accepted | +0.0% | 25.0 | 96 | default window |
| 36 | 65,536 | chosen | +8.9% | 25.0 | 75 | adds 8.9% to a typical request |
| 36 | 131,072 | rejected | +22.0% | 25.0 | 60 | turns speculative decoding off |
| 36 | 262,144 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 40 | 32,768 | accepted | +0.0% | 28.0 | 119 | default window |
| 40 | 65,536 | chosen | +6.8% | 28.0 | 97 | adds 6.8% to a typical request |
| 40 | 131,072 | rejected | +17.8% | 28.0 | 83 | turns speculative decoding off |
| 40 | 262,144 | rejected | n/a | n/a | n/a | does not fit with one complete conversation retained |
| 48 | 32,768 | accepted | +0.0% | 33.6 | 161 | default window |
| 48 | 65,536 | chosen | +2.3% | 33.6 | 140 | adds 2.3% to a typical request |
| 48 | 131,072 | rejected | +15.5% | 33.6 | 96 | adds 15.5% to a typical request, above the 10% limit |
| 48 | 262,144 | rejected | +57.5% | 33.6 | 43 | turns speculative decoding off |
| 56 | 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 56 | 65,536 | accepted | +0.0% | 37.5 | 149 | adds 0.0% to a typical request |
| 56 | 131,072 | chosen | +3.8% | 39.2 | 139 | adds 3.8% to a typical request |
| 56 | 262,144 | rejected | +27.1% | 39.2 | 75 | turns speculative decoding off |
| 64 | 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 64 | 65,536 | accepted | +0.0% | 37.5 | 149 | adds 0.0% to a typical request |
| 64 | 131,072 | chosen | +0.0% | 43.2 | 149 | adds 0.0% to a typical request |
| 64 | 262,144 | rejected | +17.8% | 44.8 | 94 | adds 17.8% to a typical request, above the 10% limit |
| 72 | 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 72 | 65,536 | accepted | +0.0% | 37.5 | 149 | adds 0.0% to a typical request |
| 72 | 131,072 | accepted | +0.0% | 43.2 | 149 | adds 0.0% to a typical request |
| 72 | 262,144 | chosen | +4.4% | 50.4 | 137 | adds 4.4% to a typical request |
| 80 | 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 80 | 65,536 | accepted | +0.0% | 37.5 | 149 | adds 0.0% to a typical request |
| 80 | 131,072 | accepted | +0.0% | 43.2 | 149 | adds 0.0% to a typical request |
| 80 | 262,144 | chosen | +0.0% | 54.7 | 149 | adds 0.0% to a typical request |
| 96 | 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 96 | 65,536 | accepted | +0.0% | 37.5 | 149 | adds 0.0% to a typical request |
| 96 | 131,072 | accepted | +0.0% | 43.2 | 149 | adds 0.0% to a typical request |
| 96 | 262,144 | chosen | +0.0% | 54.7 | 149 | adds 0.0% to a typical request |
| 128 | 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 128 | 65,536 | accepted | +0.0% | 37.5 | 149 | adds 0.0% to a typical request |
| 128 | 131,072 | accepted | +0.0% | 43.2 | 149 | adds 0.0% to a typical request |
| 128 | 262,144 | chosen | +0.0% | 54.7 | 149 | adds 0.0% to a typical request |
| 192 | 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 192 | 65,536 | accepted | +0.0% | 37.5 | 149 | adds 0.0% to a typical request |
| 192 | 131,072 | accepted | +0.0% | 43.2 | 149 | adds 0.0% to a typical request |
| 192 | 262,144 | chosen | +0.0% | 54.7 | 149 | adds 0.0% to a typical request |

## This Mac

    slotstream doctor --sim-ram 51.5 --sim-working-set 40.2 --json

The development Mac reads 51.5 GB of RAM and a 40.2 GB working set. Auto picks 65,536 tokens at a 36.1 GB target with 158 experts per layer.

| Candidate | Result | Cost | Target (GB) | Experts per layer | Reason |
|---|---|---|---|---|---|
| 32,768 | accepted | +0.0% | 34.6 | 149 | default window |
| 65,536 | chosen | +1.2% | 36.0 | 158 | adds 1.2% to a typical request |
| 131,072 | rejected | +10.4% | 36.0 | 115 | adds 10.4% to a typical request, above the 10% limit |
| 262,144 | rejected | +41.5% | 36.0 | 61 | turns speculative decoding off |
