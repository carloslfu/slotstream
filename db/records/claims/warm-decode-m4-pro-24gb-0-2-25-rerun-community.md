---
type: claim
id: 01m3gkzxz3hvbjg8ecxhzx2ykm
created: 2026-09-27T05:04:20.963807+00:00
updated: 2026-09-27T05:04:20.963807+00:00
summary: 'M4 Pro 24 GB community re-run on 0.2.25: 5.41 tok/s'
basis: measured
gate: none
needle: 5.41 tok/s
supported_by: '[[records/measurements/c7-macbook-pro-m4-pro-24gb-community]]'
surfaces: docs/HARDWARE.md
title: 'M4 Pro 24 GB community re-run on 0.2.25: 5.41 tok/s'
status: current
---
The third identical request of the 0.2.25 re-run's warm round, also its
median, with the auto plan (a 17.4 GB target with about 58 experts per layer),
the draft head, the decode lookahead and the corrected decode forecast on. The
same round gave 5.58 and 4.92 tok/s. The linked measurement also supports the
row's 86 tok/s for 8,192 prompt tokens at context-check's 18.0 GB target and
its 16.7 GB process peak. Below the 24 to less than 48 GB planning range's
former ~6 floor, which now rounds down to ~5. No gate: nothing in CI
reproduces a community machine.
