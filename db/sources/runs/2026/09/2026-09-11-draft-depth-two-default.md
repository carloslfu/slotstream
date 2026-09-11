---
type: run
id: 01m27vvc9xyj3sys1d8wnhvm9m
created: 2026-09-11T09:12:48.701649+00:00
updated: 2026-09-11T09:13:45.693866+00:00
summary: Two-draft default implementation checks
binary: unpublished local build 0.2.14; SHA256 e32e9cd33b569984bc5c15f21b79ae2cb601f99392ffb6ea6e5aedf12f460be7
captured_at: 2026-09-11
command: See archived verification.json and per-attempt before.json/result.json for exact commands
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Two-draft default implementation checks
tool: Slotstream native checks, static gates and serving metrics
---
Two-draft operating-default implementation and bounded verification, after explicit user adoption. This collection contains successful configuration checks and two separately discarded full-MTP attempts. It contains no new performance qualification.

Raw bytes were captured before the derived measurement:

- [Archive manifest, hashes and round-trip verification](../../../artifacts/draft-depth-two-default-2026-09-11/manifest.json).
- [All 27 original evidence files, including the reconstructible build source](../../../artifacts/draft-depth-two-default-2026-09-11/raw-checks-and-source.tar.gz).
- [Commands, check outcomes and exclusions](../../../artifacts/draft-depth-two-default-2026-09-11/verification.json).
- [Compiled identity](../../../artifacts/draft-depth-two-default-2026-09-11/build-identity.json) and [cleanup/installed-artifact audit](../../../artifacts/draft-depth-two-default-2026-09-11/implementation-audit.json).

The source archive is bound to the candidate binary SHA256 `e32e9cd33b569984bc5c15f21b79ae2cb601f99392ffb6ea6e5aedf12f460be7` and all 150 compiled inputs still matched at closure. The candidate retains the source version label 0.2.14 and is an unpublished local build, not the public release asset. The installed public binary remained byte-identical at SHA256 `49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7`.

`discarded: false` applies to the usable configuration evidence: the build, 33 T0 checks, complete static gates, help text, and serving default/override probes. It does not rehabilitate the full MTP diagnostic attempts. Those are retained as [[sources/runs/2026/09/2026-09-11-draft-default-mtp-swap-first]] and [[sources/runs/2026/09/2026-09-11-draft-default-mtp-swap-retry]], both discarded after native swap guards stopped them. All model children stopped and the native model lock was free at closure. Bench-detail instrumentation existed only in the two owned serving children; it was not enabled globally.
