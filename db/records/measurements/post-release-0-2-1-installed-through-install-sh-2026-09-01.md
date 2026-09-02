---
type: measurement
id: 01m1hhwmhaqe98gjq95e4rgpc7
created: 2026-09-02T17:15:26.634426+00:00
updated: 2026-09-02T17:15:26.634426+00:00
summary: 'Post-release: 0.2.1 installed through install.sh (2026-09-01)'
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M10
order: '570'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Post-release: 0.2.1 installed through `install.sh` (2026-09-01)'
status: measured
---

| check | result |
|---|---|
| `install.sh` one-liner | installed 0.2.1 to `~/.slotstream/bin`; asset sha256 matches; `gh attestation verify` exits 0 |
| installed `pull --verify` | VERIFY PASS, 24/24 |
| installed `pull`, default 8 connections, 50 s | 8 flows in `nettop`, 44 to 47 MB/s cumulative on the home link |
| `Tools/e2e_release.sh` against `serve --memory-gb 8.1` | 30 of 31; the one failure, "empty prompt refused", asserted the pre-0.2.1 400 for a chat with no messages, which 0.2.1 answers with `done_reason: "load"` as its changelog and `api_robustness.sh` say — the check is now aligned and passes |

The 0.2.1 report line counted every distinct connection since start, so two
early reconnects made it say "10 connections in use" for eight workers. It now
keeps one entry per session, the connection that session most recently carried
a body on, and reports the distinct count once every session has one: "8
connections in use" with 8 flows in `nettop`.
