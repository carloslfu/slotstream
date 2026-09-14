---
type: run
id: 01m28gd73ab4cj24m98y47m6m7
created: 2026-09-11T15:12:04.714805+00:00
updated: 2026-09-11T15:12:05.105154+00:00
summary: 'v0.2.15 candidate API suite: all 31 checks passed with apps open'
binary: 31eefbbb4791beddb0f8674ab1c1875c2eb1c4a034f5cdd0fa1abcba31e373cf
captured_at: 2026-09-11
command: candidate_api_checks.py; exact CI slotstream serve --memory-gb 10 --mtp on --vision off; Tools/e2e_release.sh with BIN set to that candidate
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'v0.2.15 candidate API suite: all 31 checks passed with apps open'
tool: Exact CI candidate release tests with applications left running
---
The exact CI candidate served at a fixed 10 GB target with MTP on and vision off. Tools/e2e_release.sh passed all 31 checks, including CLI/metadata, ordinary/long/Unicode/streamed generation, hostile input handling, sampling, prefix reuse, four concurrent clients and disconnect recovery. This exercised the uninstalled CI candidate through the documented BIN override, not the installed v0.2.14 executable.

A fresh request with no draft-depth override recorded 30 drafted tokens over 15 verification passes, proving the default depth of two. The new lifetime footprint field was present and at least the current footprint. These are functional observations, not a throughput comparison or a zero-swap certification of this API interval. Only the child server environment enabled SLOTSTREAM_BENCH_DETAILS=1. The server stopped in finally; every owned model exited and the native lock was free. Chrome and Wispr Flow remained running; no unrelated app or workload was closed or paused.

[raw checks and source](../../../artifacts/release-v0-2-15-open-apps-testing-2026-09-11/raw-checks-and-source.tar.gz) preserve the original 31-check log, command/identity, probe request/response and final cleanup. The archive has 48 byte-verified members and SHA-256 `605042be465316804487400cf9589ba256e0770b39d7ac9cf918239da277e123`. Build identity and all 150 compiled inputs match candidate commit `ee4d1af5b3d63c2b5670c814b40b25432415eb46`. No product code or native assertion changed.
