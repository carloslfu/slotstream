---
type: run
id: 01m34sy836wdnppewa7ab5dn3n
created: 2026-09-22T14:57:24.070752+00:00
updated: 2026-09-22T14:57:45.124444+00:00
summary: 'v0.2.23 published from the exact CI archive, provenance verified, publicly installed and accepted: full native battery 32/32, 16K MTP 13/13, installed serving 31/31.'
binary: 5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89
captured_at: 2026-09-22
command: Tools/verify.sh with retained golden stderr; optimization-state-check; gh release download; gh attestation verify; install.sh; Tools/e2e_release.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.23 published, installed and accepted
tool: GitHub Actions, native acceptance, public installer and installed serving
---
The exact CI archive for commit `14fb9aa3c253908cf7705b62780b28039ab42f92` was published as [v0.2.23](https://github.com/carloslfu/slotstream/releases/tag/v0.2.23) at 2026-09-22T14:53:23Z, downloaded publicly, verified and installed with the public installer.

Raw command transcripts, per-step exit receipts, model references, memory observations, build identity and reconstructed source, CI and release logs, attestation, installer output and installed serving results are in [capture.tar.gz](../../../artifacts/release-0.2.23-2026-09-22/capture.tar.gz). The [manifest](../../../artifacts/release-0.2.23-2026-09-22/manifest.json) hashes every captured file. Capture SHA-256: `1ec29db762e4c81707f8d5c6403801a774aebef1e7c8a36f9c4a37172c8120ef`.

The published archive SHA-256 is `1b499652c33e2eb46af702c64b4ed26f62191b9538804567d057b8914f62ed22`. The CI, public and installed executable SHA-256 is `5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89`. All 199 build inputs match the frozen release checkout. Public archive and checksum bytes match the CI download exactly; GitHub attestation verification passed.

Main CI 35691771691, Mac app CI 35691771622, docs 35691771689 and context proxies 35691771721 all passed on the exact release commit. The engine catalogue passed 73 groups and 31,841 assertions. Release workflow 35743357303 published the preserved CI archive without rebuilding it.

The complete local native acceptance passed 32 top-level gates, including pinned model-file hashes, independent backend references, exact conversation resume, memory/governor behavior, MTP, quality 15/15, serving robustness 74/74 and original vision serving 25/25. The separate 16,387-token MTP diagnostic passed all 13 assertions, exercised a 16,384-token read group and 4,878 bounded writes, preserved raw logits/state/continuation/output IDs and chronological passes exactly, and measured a complete process peak of 9.400930504 GB inside its 10 GB target.

The public installer upgraded the standard installation from 0.2.22 to 0.2.23. The installed end-to-end suite passed 31/31 with an explicit 10 GB server and MTP on. It covered both API surfaces, short and long prompts, Unicode, streamed equality, sampling inputs, context refusal, prefix reuse, four concurrent clients and disconnect survival. The owned test server was reaped.

Earlier attempts remain visible. Two preflights refused competing model work without starting tests. An earlier full-suite attempt exited 2 at its first golden generation; the original script discarded that command's stderr, so its precise cause is unestablished. The isolated identical command passed. The successful full rerun only redirects the two golden generation stderr streams into a retained file; its commands, profiles, assertions and tested binary are unchanged. Historical MLX 0.31 draft-head differences remain diagnostics alongside the passing independent current-backend comparison. No new clean-host latency or throughput claim is made.
