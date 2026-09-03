---
type: machine
id: 01m2xjq7r3v9k2mqxw5n8h4d1e
created: 2026-09-02T22:21:19+00:00
updated: 2026-09-03T02:29:18+00:00
summary: 'A second Mac running the pinned model against end users and the tools branch: MacBook Pro, Apple M3 Max, 48 GiB unified memory, macOS 26.6.2.'
chip: Apple M3 Max
kind: mac
os: macOS 26.6.2 (Darwin 25.6.0)
ram_gb: '48'
ssd: internal; expert-streaming reads measured 5.2 GB/s at the engine's own gather depth (2026-09-02)
title: MacBook Pro, Apple M3 Max, 48 GiB (second machine)
---

Second hardware report from real hardware, as the dev-Mac record anticipated:
a MacBook Pro used as an end-user serving machine for the pinned
qwen38-flash-next-mlx-4bit checkpoint, 16 cores, Swift 6.3.3 toolchain.
The mtp-parity gate originally failed here against both the 0.2.2 release binary and the tools build, byte-identically. Stage dumps proved the Swift head and the local Python reference bit-exact (0.00000 across every stage), so the committed fixture, not the port, was the machine-dependent outlier. verify.sh now regenerates the reference locally at gate time (regen-at-gate), and the gate passes. Measured
limits here: standing auto plan 34.6 GB target / ~152 experts/layer, warm
decode 10.83 tok/s with the draft head, prefill ~120-134 tok/s, cold SSD
expert reads 9.7 GB at 5.2 GB/s, MTP net x1.15.
