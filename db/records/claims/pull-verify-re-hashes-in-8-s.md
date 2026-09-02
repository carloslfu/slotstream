---
type: claim
id: 01m1hhwpf3v6hx4h1gcsttnsqz
created: 2026-09-02T17:15:28.611060+00:00
updated: 2026-09-02T17:15:28.611060+00:00
summary: pull --verify re-hashes the whole copy in about 8 s on the dev Mac
basis: measured
gate: Tools/verify.sh
needle: 8 s here
supported_by:
- '[[records/measurements/one-command-install-2026-08-28-v0-1-0-release-installer-proven-end-to]]'
surfaces: README.md
title: pull --verify re-hashes the whole copy in about 8 s on the dev Mac
status: current
---

Re-measured at 7.7 s wall for the full 103.8 GB on 2026-08-28 (an earlier run read 14 s). `pull --verify` is a verify.sh gate; its wall time is not.
