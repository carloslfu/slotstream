---
type: run
id: 01m359g1d7c2wz7h5fz1m57kaw
created: 2026-09-22T19:29:15.687123+00:00
updated: 2026-09-22T19:41:27.029552+00:00
summary: Preserved 27 completed installed-release requests and the prospective idle-load correction; no new qualified speed baseline.
binary: 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89
captured_at: 2026-09-22
command: python3 release_speed_bench.py --protocol protocol.json --out decode22 --phase decode --profiles budget22_auto
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Installed-release full-answer calibration attempt
tool: Frozen native HTTP benchmark, host observations and wire replay
---
Installed release 0.2.23, executable SHA-256 `5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89`, source tag `14fb9aa3c253908cf7705b62780b28039ab42f92`. The verified release build and model identity are in each manifest.

[Raw capture and analysis](../../../artifacts/release-speed-calibration-2026-09-22/), [original frozen protocol](../../../artifacts/release-speed-calibration-2026-09-22/protocol.json), [prospective idle protocol](../../../artifacts/release-speed-calibration-2026-09-22/idle-protocol-v2.json), and [population policy](../../../artifacts/release-speed-calibration-2026-09-22/population-policies.json).

The original protocol hash is `82c39c2b2f8f83f179c423eb811a1c939685570290e22b83b34dd8ed8edb86e8`; the prospective idle protocol hash is `7a152ab7af39fd5e907ba4f787f8758569718fbf14b4fc9b79bf2c113af6dc69`. Original request bytes and automatic eligibility flags are preserved. The later population policy prevents combining the original active-Mac observations with prospective idle calibration.

The 22 GB attempt completed 27 requests: 14 capped warmups and 13 naturally finished answers. It was interrupted during the second of three planned rounds after an active audio/video/browser workload was observed. All completed native metrics exactly replay from their saved response streams. One partial response remains partial evidence. Maximum complete reported lifetime footprint was 18.574897632 GB, within the declared 22 GB target. Both owned servers were reaped.

This run is discarded **for idle-machine timing calibration**, not a claim of inference failure. Nominal thermal state, no host swap-outs and bounded own page-ins did not establish a quiet host. The original automatic flags are not rewritten. Exact load during every earlier request was not measured, so no retrospective per-request causal attribution is made.

The archive also includes a small original functional pilot, read-only actual CLI/Desktop profile preflights, the old 0.2.19 protocol, narrow output-check results, and the frozen 31K extension that has not yet been run. Interpretation: [[records/measurements/release-speed-calibration-2026-09-22]].

## Validation and final attempt status
Both prospective idle pilot attempts ended without loading a model. The first exhausted its 900-second readiness window; its full observations are preserved in `idle-smoke-v2/`. A second attempt was stopped after continued background CPU work was independently identified as OS media-analysis activity. It left no model process. These are measurement-environment refusals, not inference failures.

Validation: 13 analysis tests, 14 host-load parsing/gate tests, and independent replay of all 27 completed response streams pass. The five applicable narrow arithmetic/JSON output checks pass and are never used to select timing observations. The revised live-plan capture still needs its real-model functional pilot before a v2 timing campaign can qualify. Larger actual-default preflights failed the prescribed headroom test; no adaptive server launched.
