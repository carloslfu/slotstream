---
type: measurement
id: 01m1hhwkbaet15e154735p4336
created: 2026-09-02T17:15:25.418635+00:00
updated: 2026-09-02T17:15:25.418635+00:00
summary: '⚠️ Build blocker: mlx-swift''s bundled Metal shaders require Xcode'
date: 2026-08-30
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
note: 'Scope corrected 2026-08-30: this is about building mlx-swift''s bundled shader library, solved by vendoring the metallib; a custom kernel JIT-compiles through MLXFast.metalKernel with no offline toolchain (see Prefill, second pass).'
order: '70'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: '⚠️ Build blocker: mlx-swift''s *bundled* Metal shaders require Xcode'
status: measured
---

**Scope note added 2026-08-30, because this section was later misread as
banning custom kernels.** What follows is about building the shader library
mlx-swift ships with. It says nothing about writing a *new* kernel:
`MLXFast.metalKernel` JIT-compiles Metal source at runtime through the Metal
framework, `GatedDelta.swift` already uses it as the shipped fast path, and a
fresh kernel was verified compiling and running on this CLT-only machine.


mlx-swift's own README states: *"SwiftPM (command line) cannot build the Metal
shaders so the ultimate build has to be done via Xcode."* Confirmed here — a
`swift build -c release` links fine but produces **no metallib**, and every MLX call
dies with `Failed to load the default metallib`. This machine has **Command Line
Tools only, no Xcode**, so `xcodebuild` is unavailable.

**Workaround found and verified**: MLX's loader (`device.cpp:load_colocated_library`)
searches, in order, `mlx.metallib` → `Resources/mlx.metallib` → SwiftPM-bundle
`default.metallib` → `Resources/default.metallib` → `METAL_PATH`, all relative to the
binary's directory. Copying the **prebuilt metallib that ships with the Python `mlx`
wheel** (`.venv/lib/python3.12/site-packages/mlx/lib/mlx.metallib`, 182 MB) next to
the executable **as `mlx.metallib`** makes everything work. Naming it
`default.metallib` does *not* work at that path.

Caveat: the borrowed metallib is from Python mlx 0.32.2 while mlx-swift vendors MLX
0.31.1. It worked for every kernel this probe exercised (quantize, gatherQMM,
scatter, eval), but a version-skewed metallib is not a shipping strategy.

**This is a real, unplanned constraint on M7 packaging** and PLAN.md §4.5's
"`make install` from source" — the release build needs Xcode (~15 GB) on the build
machine, or a vendored metallib built once and shipped as a package resource. Add it
to the risk register and decide before M7.
