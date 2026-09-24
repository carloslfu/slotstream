---
type: run
id: 01m35m7y78b33y0tns5rnfhqwv
created: 2026-09-22T22:37:04.616466+00:00
updated: 2026-09-22T22:37:17.364305+00:00
summary: Real-model 8.1 GB harness pilot passed; 10 GB timing phase refused sustained background GPU load.
binary: installed Slotstream v0.2.23; sha256 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89
captured_at: 2026-09-22
command: python3 harness-idle-v3/release_speed_bench.py; exact pilot and prefill invocations and frozen protocols in the linked artifact
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Release calibration v3 native pilot and GPU readiness refusal
tool: release_speed_bench.py
---
The smaller 8.1 GB functional pilot passed two capped requests on the installed v0.2.23 binary. Live plans remained stable and agreed with native effective slots; raw wire replay passed, neither request observed global swap activity, and the native lifetime process peak was 6.066900808 GB under the 8.1 GB target. The captured cleanup confirms a clean, reaped exit. This is functional harness evidence, not full-answer quality or a throughput anchor. The pilot is excluded from calibration.

The subsequent prospectively declared 10 GB, three-round 2K code/prose phase did not launch a model. Reclaimable memory stayed above its 13 GB preflight, but the five-minute readiness attempt never met the full background-load screen. Its final two-minute window averaged 16.57% GPU utilization with no model running, above the frozen 5% screen. No timing requests ran. This refusal remains separate from the successful functional pilot and from earlier memory refusals.

Nineteen analysis tests pass, including five new full-prefill calibration tests and an unregistered-population exclusion. The original analysis and benchmark captures remain untouched. The new correction diagnostic is exploratory and has no qualified timing cells from these attempts.

[Preserved artifacts and reproduction instructions](../../../artifacts/release-calibration-native-pilot-v3-2026-09-22/). Prior harness correction: [[sources/runs/2026/09/2026-09-22-release-calibration-load-screen-v3]]. No release, runtime or estimator change; no new speed-gain claim. `discarded: true` denotes exclusion from speed calibration, not a functional failure of the smaller pilot.
