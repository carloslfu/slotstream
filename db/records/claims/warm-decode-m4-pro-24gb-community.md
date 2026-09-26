---
type: claim
id: 01m3f79jq9cc7hv43m3pasv0v8
created: 2026-09-26T16:03:11.209810+00:00
updated: 2026-09-26T16:03:11.209810+00:00
summary: 'M4 Pro 24 GB community report: 3.57 tok/s'
basis: measured
gate: none
needle: 3.57 tok/s
supported_by: '[[records/measurements/c7-macbook-pro-m4-pro-24gb-community]]'
surfaces: docs/HARDWARE.md
title: 'M4 Pro 24 GB community report: 3.57 tok/s'
status: current
---
The third identical request of the first warm round on 0.2.24 with the auto
plan (a 15.9 GB target with about 53 experts per layer), which at this size
ran without the draft head or the decode lookahead. A later round gave 3.85 to
3.97 tok/s. The linked measurement also supports the row's 93 tok/s for 8,192
prompt tokens at context-check's 18.0 GB target and its 16.6 GB process peak.
The first 24 GB report, below the 24 to less than 48 GB planning range. No
gate: nothing in CI reproduces a community machine.
