---
type: run
id: 01m2xjr8t4w0l3nryx6o9i5e2f
created: 2026-09-02T22:21:19+00:00
updated: 2026-09-02T22:21:19+00:00
summary: 'First full verification battery on the tools branch (PR #2 cherry-picked onto main plus fixes), MacBook Pro M3 Max: 275 pass, 1 fail — the pre-existing machine-dependent mtp-parity gate.'
binary: 'local release build of the tools branch (main + cherry-picked 8fe6e65 + validator/ToolStream fixes), built 2026-09-02 on this machine'
captured_at: 2026-09-02T22:00:00+00:00
command: 'Tools/verify.sh (via Tools/run_verify.sh PATH wrapper for launchd python)'
discarded: false
machines:
- '[[records/machines/macbook-pro-m3-max-48gb]]'
title: verify.sh full battery, tools branch, MacBook Pro M3 Max, 2026-09-02
tool: verify.sh
---

The PR author never compiled the branch; this is its first build and first
full battery. Environment notes that shaped the run: launchd-spawned
processes have no ~/Documents access (TCC), so the battery ran from a copy at
~/ss-verify; the launchd PATH lacks Homebrew python, so the run wrapper
exports it (the numpy-referencing gates need it). Runs to completion except
for one gate:

- 275 PASS. Notable for the tools work: streamed deltas reassemble to the
  non-streamed text (10/10), /api/tags size matches the pinned manifest with
  the optional draft head installed, all seven new tool-calling cases pass on
  both endpoints (well-formed arrays accepted, nameless entries refused,
  forced tool_choice refused, tool_choice none renders without schemas, tool
  result roundtrip accepted), sampler vs numpy 16/0, planner 64/0, quality
  probe 15/0, robustness suite 73/0.
- 1 FAIL: `mtp head bit-parity vs Python reference (mtp-parity)`. The 0.2.2
  release binary fails this gate on the same machine with byte-identical
  numbers (max abs 4.06250, rel 0.11285 ...), and after regenerating the
  fixture locally per the documented recipe (mlx 0.31.1, real captured
  inputs) the failure persists with different magnitudes (max abs 7.06,
  rel 0.18). The PR touches no MTP code. Dispositioned as pre-existing,
  machine-dependent mlxbf kernel drift on this GPU (the fixture's own header
  documents how sharp attention logits turn ulp drift into flipped argmax
  keys). Behavioral MTP gates (speculative decode determinism/state/accept,
  quality probes) all pass.

```
passed 275, failed 1
```
