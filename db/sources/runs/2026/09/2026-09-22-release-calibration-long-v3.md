---
type: run
id: 01m367vgfj9vyzy82e15pbkv2e
created: 2026-09-23T04:19:48.850361+00:00
updated: 2026-09-23T04:19:49.282452+00:00
summary: Eight long-prompt requests completed; cache retention and thermal limits observed, then the next round refused background GPU activity.
binary: Installed Slotstream v0.2.23; SHA256 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89
captured_at: 2026-09-22
command: Frozen v3 long-prompt phase; exact protocol and captures in the linked artifact.
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Incomplete installed-release 8K and 16K prompt calibration
tool: release_speed_bench.py
---
The prospectively split 8K/16K code/prose phase on the installed v0.2.23 release completed eight requests in its first fresh-server round. All eight response captures replay exactly. Six pass the original environment screen; two are excluded for non-nominal thermal state. One otherwise eligible prose repeat is separately excluded because this task performed a documentation worktree checkout while it ran. That manual exclusion was registered before its result was inspected, is applied only to that exact result path in derived analysis, and never rewrites the original capture or automatic verdict. Five observations remain eligible, insufficient for the prescribed three repetitions of any fixture.

The second round never launched a model. Its bounded readiness attempt ended after 301.82 seconds; the final two-minute window averaged 15.90% background GPU utilization against the frozen 5% limit, while temperature had returned to nominal and reclaimable memory was 34.20 GB. The first server exited cleanly and was reaped. No benchmark model or controller remained after termination.

[Complete evidence, original protocols and derived analysis](../../../artifacts/release-calibration-long-v3-2026-09-22/). The raw native peak across completed requests was 8.250117504 GB under the 10 GB target. The source is marked discarded for repeated calibration: functional completions, observed cache refusals and original per-request eligibility remain evidence, but no repeated long-prompt baseline is qualified.
