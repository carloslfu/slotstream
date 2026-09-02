---
type: measurement
id: 01m1hhwm2j1d19b1r2nf2tt71v
created: 2026-09-02T17:15:26.162021+00:00
updated: 2026-09-02T17:15:26.162021+00:00
summary: One more toolchain constraint (found the hard way)
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '380'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: One more toolchain constraint (found the hard way)
status: measured
---

`swift test` is impossible on this machine: neither XCTest nor swift-testing ships
with Command Line Tools — both require Xcode. Acceptance testing therefore lives in
`Tools/verify.sh`, which is strictly stronger anyway: it runs the n-gram-id golden,
the chat-template golden, the bit-exact layer-parity gate, and the full-model
golden-equivalence test against the real checkpoint. Current status: **4/4 PASS.**
