---
type: claim
id: 01m222qz2m9dhjhhsjacqqkxb7
created: 2026-09-09T03:17:50.291977+00:00
updated: 2026-09-09T03:17:50.291977+00:00
summary: Hermes guide sets explicit auxiliary timeouts
basis: derived
gate: Tools/hermes_config_gate.py
needle: 'timeout: 1800'
supported_by: '[[records/measurements/hermes-configuration-hardening-2026-09-08]]'
surfaces: docs/HERMES.md
title: Hermes guide sets explicit auxiliary timeouts
status: current
---
Both title and compression tasks have an explicit bounded timeout in seconds, checked on the constructed HTTP request. This is independent of the main local stream watchdog and is not a speed guarantee.
