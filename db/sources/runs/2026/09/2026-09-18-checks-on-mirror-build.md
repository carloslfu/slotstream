---
type: run
id: 01m2s4vs5hqw82v7g22crjb0e3
created: 2026-09-18T05:55:00.000000+00:00
updated: 2026-09-18T05:55:00.000000+00:00
summary: The check catalogue on the committed mirror build, 46 passed and 0 failed
binary: a debug build of the tree at commit 62454db, not the release binary the timing runs used
captured_at: 2026-09-18
command: make checks
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb]]'
title: Check catalogue on the committed mirror build
tool: make checks
---
The check catalogue on the tree that carries the mirror, run after the
measurement in
[[records/measurements/mirror-reads-across-two-disks-2026-09-18]] so it could
not contend with it for the machine. No check exercises a mirror: the string
does not appear anywhere under `Sources/slotstream-checks/`. What this run
establishes is that routing every weight read through `MirrorRouter`, which
happens on the single-disk path too with one replica, broke nothing that the
catalogue does cover. `make checks` builds and runs its own debug binary, so
this run exercises the same source as the release binary in the timing runs but
not the same artifact.

```text
swift build 
[0/3] Write swift-version-313E99ECCC1710B5.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for debugging...
[3/8] Write swift-version-313E99ECCC1710B5.txt
Build complete! (4.71s)
cp Tools/lib/mlx-0.31.1.metallib .build/debug/mlx.metallib
.build/debug/slotstream-checks --tier t0
PASS  prefill-schedule (22 assertions)
PASS  context-policy (8 assertions)
PASS  automatic-context-window (82 assertions)
PASS  configurable-context (5127 assertions)
PASS  optimization-exact-read (14 assertions)
PASS  optimization-packed-layout (288 assertions)
PASS  optimization-ngram-prefetch-ticket (28 assertions)
PASS  optimization-cache-bookkeeping (20571 assertions)
PASS  optimization-adaptive-policy (75 assertions)
PASS  optimization-runtime-budget (561 assertions)
PASS  optimization-layer-local-victim (226 assertions)
PASS  optimization-pressure-boundary (74 assertions)
PASS  runtime-check (171 assertions)
PASS  optimization-prefix-client-capacity (61 assertions)
PASS  persistent-prefix-policy (98 assertions)
PASS  governor-check (26 assertions)
PASS  pull-check (14 assertions)
PASS  machine-planning (15 assertions)
PASS  http-framing (11 assertions)
PASS  http-routing (23 assertions)
PASS  optimization-bounded-output (38 assertions)
PASS  expert-lookahead-lane-budget (16 assertions)
PASS  expert-lookahead-tickets (61 assertions)
PASS  expert-lookahead-scheduler (26 assertions)
PASS  expert-lookahead-forecast-merge (37 assertions)
PASS  expert-lookahead-forecast-tap (71 assertions)
PASS  decode-lookahead-defaults (39 assertions)
PASS  vision-check (136 assertions)
PASS  toolcall-check (19 assertions)
PASS  toolcall-stream-check (14 assertions)
PASS  toolcall-coercion (23 assertions)
PASS  gateway-request (37 assertions)
PASS  gateway-prompt (23 assertions)
PASS  gateway-catalog (28 assertions)
PASS  gateway-events (19 assertions)
PASS  chat-splice (10 assertions)
PASS  gateway-null-bridge (10 assertions)
PASS  gateway-anyof-types (13 assertions)
PASS  openai-conversation (40 assertions)
PASS  openai-tool-output (163 assertions)
PASS  openai-context-budget (19 assertions)
PASS  responses-request (71 assertions)
PASS  responses-events (54 assertions)
PASS  responses-codex-tools (13 assertions)
PASS  responses-codex-fixture (15 assertions)
PASS  weightstore-cancellable (9 assertions)

46 passed, 0 failed, 0 skipped (28499 assertions)
```
