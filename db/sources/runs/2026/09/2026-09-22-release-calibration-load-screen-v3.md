---
type: run
id: 01m35kj68ge6afx9me1a2d8jaa
created: 2026-09-22T22:25:11.952096+00:00
updated: 2026-09-22T22:25:24.523028+00:00
summary: Prospective windowed host-load correction passes offline checks; real-model pilot refuses insufficient physical headroom.
binary: installed Slotstream v0.2.23; sha256 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89
captured_at: 2026-09-22
command: python3 harness-idle-v3/release_speed_bench.py --protocol load-smoke-protocol-v3.json --out load-smoke-v3 --phase decode --profiles budget10_auto
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Release calibration windowed host-load correction and memory refusal
tool: release_speed_bench.py
---
The prospective v3 harness corrects the overly strict v2 host-load readiness rule. See [the preserved artifacts](../../../artifacts/release-calibration-load-screen-v3-2026-09-22/) for the exact protocol, source, validation, readiness observations and cleanup receipt. The prior evidence at [[sources/runs/2026/09/2026-09-22-release-speed-calibration]] remains unchanged.

The installed binary is v0.2.23 with SHA-256 `5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89`. No runtime or model setting changed. The pilot is explicitly excluded from timing calibration. Its prospective protocol hash is `7b7486a73c6be346e27d44189dc4042305ce1bd2e31cc0c00f54128a3f78c4f6`; the full prospective matrix protocol hash is `53d4cfc4a3f8332901676daf940e35d745ce9b1c91b0631c081701a5c3fe4b6c`.

Validation: 23 host-load tests and 13 analysis tests pass. The old v2 and new v3 frozen source hashes match. A separate loopback fixture tests runtime-plan extraction without loading a model; this is simulated endpoint evidence only.

The five-minute pilot readiness attempt completed without launching a model. All 144 observations were below the required 13 GB reclaimable memory, spanning 8.05 to 10.33 GB. The installed planner independently returned `insufficient_memory`. Background-load screening passed during part of this window but did not override the memory refusal. Zero requests ran; the cleanup receipt confirms that no model process was created. This is a resource-preflight refusal, not an inference failure or measured speed result. The prospective live-plan integration still requires its real-model pilot.
