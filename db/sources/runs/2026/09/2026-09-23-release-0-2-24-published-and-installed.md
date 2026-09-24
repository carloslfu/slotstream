---
type: run
id: 01m36f8yn4n5jf5q5mekhhnwxc
created: 2026-09-23T06:29:29.380130+00:00
updated: 2026-09-23T06:29:29.972877+00:00
summary: v0.2.24 published, publicly installed and accepted
binary: bbdfcaffa8959ac1ca3e39d1f804cc4491aaa98dd8f649d5f239713a6ba10499
captured_at: 2026-09-23
command: python3 qualify.py; gh release download; gh attestation verify; sh install.sh; Tools/e2e_release.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.24 published, publicly installed and accepted
tool: GitHub Actions, native acceptance, public installer and installed serving
---
[v0.2.24](https://github.com/carloslfu/slotstream/releases/tag/v0.2.24) was published at 2026-09-23T05:24:36Z from commit `814da126894959dfdf3e0a01babc43468ccee5c2`. Main engine CI 35819111606, Mac app CI 35819111654, docs 35819111639 and context proxies 35819111683 passed before publication. Release workflow 35822233276 published the exact tested CI archive without rebuilding it.

Original bytes are preserved in [capture.tar.gz](../../../artifacts/release-0.2.24-2026-09-23/capture.tar.gz), with a [per-file manifest](../../../artifacts/release-0.2.24-2026-09-23/manifest.json) and [verification receipt](../../../artifacts/release-0.2.24-2026-09-23/receipt.json). Capture SHA-256: `17d6c6d9bf0be50473c0fc1db6e4e6d61399fef1971b917f8ff03daaabf4c29d`. All 118 included files were read back from the archive and checked against their recorded SHA-256. Disposable tensor caches and Python bytecode are excluded with their paths and sizes recorded; request, response, wire, process, memory and method evidence remains.

The archive SHA-256 is `2c942b6706febccd4e3fdf1930ba57347a86c21ae47ecc1e6b821323e8c36bde`. The installed executable SHA-256 is `bbdfcaffa8959ac1ca3e39d1f804cc4491aaa98dd8f649d5f239713a6ba10499`. The MLX 0.32.2 metallib SHA-256 is `dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed`. All 199 source inputs match the frozen checkout. CI and public archive/checksum bytes match, GitHub attestation verification passed, and the public installer was checked against source before upgrading the standard installation.

The release and instrumented CI catalogues each passed 73 groups and 31,907 assertions, with zero failures or skips. The exact downloaded candidate passed the full native battery: 33 top-level gates, zero failures, including 24 OpenAI compatibility checks, quality 15/15, API robustness 74/74 and vision serving 25/25. Native qualification used the established bounded profiles and includes the new issue-21 streaming, branch and restart suite, exact prefix/cold logits, MTP parity and memory/governor checks. Historical MLX 0.31 draft-head drift remains diagnostic beside the passing independent current-backend reference; tolerances were not widened.

The publicly installed executable passed all 31 end-to-end checks with a 10 GB target, context 32768, MTP on and vision off. Owned qualification and installed servers were stopped and reaped. Functional acceptance does not turn observed global paging into a clean timing result. The separate comparison is [[sources/runs/2026/09/2026-09-23-release-0-2-24-performance]].
