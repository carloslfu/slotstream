---
type: measurement
id: 01m34sy83yfhn4wvt40xrvpvew
created: 2026-09-22T14:57:24.094183+00:00
updated: 2026-09-22T14:57:24.094183+00:00
summary: 'v0.2.23 published from the exact CI archive, provenance verified, publicly installed and accepted: full native battery 32/32, 16K MTP 13/13, installed serving 31/31.'
date: 2026-09-22
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Functional release acceptance on the M5 Pro Mac; no new clean-host timing claim.
order: '1620'
runs: '[[sources/runs/2026/09/2026-09-22-release-0-2-23-published-and-installed]]'
title: v0.2.23 published, installed and accepted
status: measured
---
**v0.2.23 is published, installed and accepted.** It ships the session's automatic long-prompt prefill policy, MTP phase accounting and bounded expert writes, pinned fused-attention backend integration, exact persistent conversation reuse and live thinking-to-answer continuation, together with the documented serving, memory and Mac app source changes.

Release: [v0.2.23](https://github.com/carloslfu/slotstream/releases/tag/v0.2.23), published 2026-09-22T14:53:23Z from commit `14fb9aa3c253908cf7705b62780b28039ab42f92`. The CI candidate, public archive and installed executable match exactly. Archive SHA-256: `1b499652c33e2eb46af702c64b4ed26f62191b9538804567d057b8914f62ed22`. Executable SHA-256: `5cb612361887c2a317376721dbe5df94810da5230759c47169fc6fa2e9b30b89`.

| Acceptance | Result |
|---|---|
| Exact-commit hosted CI | Main engine, external library consumer, coverage, Mac app build/checks, docs and context contracts passed |
| Engine catalogue | 73 groups, 31,841 assertions; no failures or skips |
| Full native model battery | 32 top-level gates passed; API robustness 74/74, quality 15/15 and vision serving 25/25 |
| Automatic 16K MTP | 13/13 assertions; actual 16,384-token group and bounded writes; exact state/logits/output; 9.401 GB complete peak inside 10 GB |
| Public distribution | Exact CI archive published, checksum and provenance verified; public installer upgraded the standard installation |
| Installed serving | 31/31 with a 10 GB target and MTP on; test server cleaned up |

The earlier shared-machine attempts and the first generation's unexplained exit are preserved in the raw run, including the successful isolated reproduction and the complete passing rerun. No assertion was removed or tolerance widened. The rerun retains stderr that the original harness discarded. Global paging observations remain diagnostics, and this acceptance adds no new performance percentage.

The performance results and their limits remain in [[records/measurements/prompt-speed-qualification-2026-09-21]], [[records/measurements/fused-prefill-integration-2026-09-21]] and [[records/measurements/mtp-prefill-policy-2026-09-21]]. Their percentages describe different comparisons and must not be combined. Separate decode experiments made after this release was frozen are outside the tagged archive.
