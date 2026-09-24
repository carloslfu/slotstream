---
type: measurement
id: 01m36f8zrakha72xxybtkybc0p
created: 2026-09-23T06:29:30.506307+00:00
updated: 2026-09-23T06:29:30.506307+00:00
summary: v0.2.24 published, installed and accepted
date: 2026-09-23
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Published exact CI bytes; full native and installed acceptance pass. Post-release performance has separate eligibility limits.
order: '1650'
runs: '[[sources/runs/2026/09/2026-09-23-release-0-2-24-published-and-installed]]'
title: v0.2.24 published, installed and accepted
status: measured
---
**v0.2.24 is public, installed and accepted.** It ships nullable-string tool streaming/type preservation, compatible conversation-branch selection and their regression coverage. Both repairs operate automatically. This patch adds no inference kernel or new tuning switch. The separate local decode experiments are outside the release.

Release: [v0.2.24](https://github.com/carloslfu/slotstream/releases/tag/v0.2.24), published 2026-09-23T05:24:36Z from `814da126894959dfdf3e0a01babc43468ccee5c2`. The CI candidate, public archive and installed executable match exactly. Archive SHA-256: `2c942b6706febccd4e3fdf1930ba57347a86c21ae47ecc1e6b821323e8c36bde`. Executable SHA-256: `bbdfcaffa8959ac1ca3e39d1f804cc4491aaa98dd8f649d5f239713a6ba10499`.

| Acceptance | Result |
| --- | --- |
| Exact-commit hosted CI | Engine, instrumented coverage, external library consumer, Mac app, docs and context contracts passed |
| Engine catalogue | 73 groups, 31,907 assertions, no failures or skips, in release and instrumented builds |
| Full native battery | 33 top-level gates passed; includes new issue-21 streaming/branch/restart, OpenAI compatibility 24/24, quality 15/15, robustness 74/74 and vision serving 25/25 |
| Public distribution | Preserved CI archive published, public checksum/provenance verified, public installer upgraded the standard installation |
| Installed serving | 31/31 with a 10 GB target and MTP on; owned server reaped |

[[sources/runs/2026/09/2026-09-23-release-0-2-24-published-and-installed]] retains the commands, source/build identity, native logs and references, workflow output, installer and process-cleanup receipts. The historical backend reference remains visible alongside the passing current-backend reference; no tolerance was widened. These are functional acceptance results, not clean-host speed claims.

Post-release comparison results are in [[records/measurements/release-0-2-24-performance-2026-09-23]]. The original intermittent daemon exits, CPU-busy stall and pressure-related tail slowdown from the issue review remain unreproduced; these two verified repairs do not establish their cause.
