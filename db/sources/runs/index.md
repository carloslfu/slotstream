---
type: index
scope: type-folder
folder: sources/runs
updated: 2026-09-02T22:21:19Z
---

# sources/runs

- [[sources/runs/2026/09/2026-09-02-live-tool-gates-macbook-pro-m3-max]] — Live tool-calling gates against the tools-branch server on the pinned 4-bit checkpoint: format quality 4/4, full tool loop pass, prefix-cache extend hits across loop turns.
- [[sources/runs/2026/09/2026-09-02-tools-block-cost-macbook-pro-m3-max]] — Tools-block prefill cost on the pinned checkpoint: two tool schemas add 311 prompt tokens (~150 each) versus the same one-turn request without tools.
- [[sources/runs/2026/09/2026-09-02-verify-tools-branch-macbook-pro-m3-max]] — First full verification battery on the tools branch (PR #2 cherry-picked onto main plus fixes), MacBook Pro M3 Max: 275 pass, 1 fail — the pre-existing machine-dependent mtp-parity gate.
- [[sources/runs/2026/09/2026-09-02-doctor-json-macbook-pro-m5-pro-48gb]] — slotstream doctor --json on the dev Mac on 2026-09-02: the auto plan with other apps holding memory (availability clamped), binary 0.2.1, local build.
