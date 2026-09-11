---
type: run
id: 01m28gd6dgdq49y65z2rt8bced
created: 2026-09-11T15:12:04.016452+00:00
updated: 2026-09-11T15:12:04.650874+00:00
summary: 'v0.2.15 MTP retries with apps open: four resource exclusions retained'
binary: 31eefbbb4791beddb0f8674ab1c1875c2eb1c4a034f5cdd0fa1abcba31e373cf
captured_at: 2026-09-11
command: mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg; four bounded native attempts, all original assertions retained
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'v0.2.15 MTP retries with apps open: four resource exclusions retained'
tool: Exact CI candidate release tests with applications left running
---
Carlos required leaving all applications and other work running. Four exact original 12 GB MTP/vision attempts returned exit 1 and memory_validated false. Native swap-in deltas were 4, 12, 4 and 4 pages; all swap-out deltas were zero. Every observed process peak was below 12 GB. The final attempt passed three text determinism/speculation probes, vision determinism/speculation and numerical recording/rollback checks, then stopped before completing the full cross-request state qualification. No complete MTP CHECK PASS is claimed. Global counters do not identify the responsible process.

The first attempt used the optional 120-second stable-swap wrapper preflight. Its next idle wait repeatedly restarted, including while no model was running. During that wait the one candidate API server ran; the wrapper correctly refused to launch another model. The wrapper was then interrupted while idle, with no model live. The remaining three attempts used the original real-headroom preflight, preserving the full native workload, ceilings and strict zero-swap checks. The deliberate wrapper KeyboardInterrupt is lifecycle evidence, not a product failure.

[raw checks and source](../../../artifacts/release-v0-2-15-open-apps-testing-2026-09-11/raw-checks-and-source.tar.gz) preserve every original output, error, memory record, command and readiness observation. The archive has 48 byte-verified members and SHA-256 `605042be465316804487400cf9589ba256e0770b39d7ac9cf918239da277e123`. Build identity and all 150 compiled inputs match candidate commit `ee4d1af5b3d63c2b5670c814b40b25432415eb46`. No product code or native assertion changed.
