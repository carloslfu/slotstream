---
type: claim
id: 01m49j8r380fd58m2mx2s7vsc8
created: 2026-10-06T21:35:13.512044+00:00
updated: 2026-10-06T21:35:13.512044+00:00
summary: Original four-bit generation spans 20.91–23.69 tok/s across three development-workload medians at 33 GB
basis: measured
gate: Tools/claims_gate.py; semantic review against the pinned run
needle: 20.91–23.69 tok/s
supported_by: '[[records/measurements/quantization-screen-2026-10-02]]'
surfaces: README.md, docs/HARDWARE.md, llms.txt
title: Original four-bit generation spans 20.91–23.69 tok/s across three development-workload medians at 33 GB
status: current
---
The range spans the three workload medians, from short-256 to context-256; it is not a range over individual repetitions or a guaranteed speed interval.

Measured on October 5, 2026 on the owned 48 GB M5 Pro, using the original
four-bit checkpoint, a 33-decimal-GB total ceiling and the Desktop startup
recipe. Source commit 754426d7915d26f007fed2c5ec53d633d0664596 and its exact
CI executable are pinned in [[sources/runs/2026/10/2026-10-05-practical-desktop-ceiling]].

Three repetitions per workload pass the frozen timing and physical checks,
with zero whole-host swap-in/out deltas. Generation rate excludes the first
committed token and uses the complete decode timer. The short and context
workloads have fixed-length output; the coding answer completes naturally.
Filesystem caching is uncontrolled. These short development tests provide no
sustained-session guarantee, universal prompt minimum, release-to-release
speedup, different-Mac result or qualified alternative pack. They do not
replace the older release benchmark at a different budget and protocol.

[[records/measurements/quantization-screen-2026-10-02]] preserves the methods, candidate comparison and limits.
