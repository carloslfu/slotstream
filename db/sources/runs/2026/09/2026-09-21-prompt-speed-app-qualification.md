---
type: run
id: 01m32ezrwrgg741kfqp3ascyzx
created: 2026-09-21T17:07:30.840384+00:00
updated: 2026-09-21T17:09:33.585907+00:00
summary: 'Prompt-speed app qualification: restart reuse, private phases and full regression gates'
binary: App suite and final check executable hashes in archived identities
captured_at: 2026-09-21
command: Exact commands and drivers archived; see body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Prompt-speed app qualification: restart reuse, private phases and full regression gates'
tool: Native Mac checks; static gates; serialized real model harness
---
Raw bytes: [app and gate archive](../../../artifacts/prompt-speed-2026-09-21/app.tar.gz), [verified member hashes](../../../artifacts/prompt-speed-2026-09-21/app-manifest.json). The archive was captured and every member checked before this record was authored. It contains exact app/core source archives, executable identities, logs, drivers, request-level VM receipts and cache-file hashes. It excludes synthetic Home contents, model weights and executables.

Commands: `Tools/check_sevra_mac.sh`; `Tools/static_gates.sh`; then the app check executable's `--real-cache`, `--real-thinking` and `--real-metrics`, each with a separate new disposable Home. Real-model runs are serialized at a 10 GB app setting after a 14 GB reclaimable-memory preflight. A concurrent static matrix ran only verified weights-free `doctor --sim-ram` commands. An initial conservative process-name guard refused to start the app during that matrix; the refusal is preserved, then the guard was narrowed to distinguish simulated planning from real model work. No model or compiler overlapped another model.

The full native app script exits successfully, including composer, presentation, scroll, thinking, app, memory and runtime checks. It emits 176 PASS lines. The full static script ends with `STATIC GATES PASS`. `app-suite-identity.json` binds that suite; the subsequent test-only addition of a physical-memory assertion and cache hash output has its own final app source/identity and successful build log.

All real checks exit zero:

- Restart cache: first request saves 2048 tokens. After unload and reload, the follow-up restores 2048 and reads 168 of 2216 tokens, answering `36`. A private cold request produces the same answer and reads all 2216. Incognito and a direct thinking call leave all persistent-cache file hashes unchanged. The maximum reported physical peak is 8.081281152 GB, below the 10 GB setting. Observed warm/cold prefill times are diagnostic, not a paired performance claim.
- Thinking: forced closure, Answer now, natural/app-budget completion and a later plain turn all complete. The arithmetic fixtures answer correctly. Restart recovers receipts without persisted thought text; synthetic thought probes do not appear in Home files.
- Metrics: first thinking turn, second thinking turn with conversation reuse and plain turn after switching all complete. Saved response metrics equal their exact engine statistics. Read counts are 347, 234 and 391, respectively; the second turn reuses 256 tokens. These totals include the actual work of both phases, not a fictional full second prefill.

Final process inspection finds no owned model or compiler process. These are local development checks on the recorded M5 Pro, not a signed release, universal model-quality evaluation or all-hardware qualification.
