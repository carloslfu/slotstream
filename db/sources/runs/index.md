---
type: index
scope: type-folder
folder: sources/runs
updated: 2026-09-03T06:48:43Z
---

# sources/runs

- [[sources/runs/2026/09/2026-09-03-verify-tools-v1-clean-macbook-pro-m3-max]] — Full verify.sh battery on tools-v1: 190 PASS / 0 FAIL (robustness 75/0), first fully green run on this machine after the mtp-parity regen-at-gate fix and the unseeded-gate determinism fix (b9c712c).
- [[sources/runs/2026/09/2026-09-02-mtp-parity-fix-and-standing-server-macbook-pro-m3-max]] — MTP parity gate fixed (regen-at-gate) and the tools-v1 build installed as the standing LaunchAgent server: bit-exact Swift-vs-Python stage forensics, then full battery 188/0.
- [[sources/runs/2026/09/2026-09-02-live-tool-gates-macbook-pro-m3-max]] — Live tool-calling gates against the tools-branch server on the pinned 4-bit checkpoint: format quality 4/4, full tool loop pass, prefix-cache extend hits across loop turns.
- [[sources/runs/2026/09/2026-09-02-tools-block-cost-macbook-pro-m3-max]] — Tools-block prefill cost on the pinned checkpoint: two tool schemas add 311 prompt tokens (~150 each) versus the same one-turn request without tools.
- [[sources/runs/2026/09/2026-09-02-verify-tools-branch-macbook-pro-m3-max]] — First full verification battery on the tools branch (PR #2 cherry-picked onto main plus fixes), MacBook Pro M3 Max: 275 pass, 1 fail — the pre-existing machine-dependent mtp-parity gate.
- [[sources/runs/2026/09/2026-09-02-prefill-sweep-context-check-8192-16gb]] — context-check --tokens 8192 --memory-gb 16 --json, sweep and 0.2.2 code, dev Mac, 2026-09-02
- [[sources/runs/2026/09/2026-09-02-prefill-sweep-check]] — sweep-check transcripts on the final code, dev Mac, 2026-09-02
- [[sources/runs/2026/09/2026-09-02-prefill-sweep-tuning]] — prefill sweep tuning: group size, read lanes, admission on/off, 8k prompt at 16 GB, dev Mac, 2026-09-02
- [[sources/runs/2026/09/2026-09-02-prefill-sweep-ladder-60-per-layer]] — prefill pass-size ladder at a matched 60-per-layer pool, sweep and 0.2.2 code, plus 4096 at 16 GB, dev Mac, 2026-09-02
- [[sources/runs/2026/09/2026-09-02-prefill-sweep-floor-and-10gb]] — prefill sweep at the 8.1 GB floor and at 10 GB, 7,960-token prompt, dev Mac, 2026-09-02
- [[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-prose-16gb]] — prefill sweep A/B, 10,490-token prose prompt at a 16 GB target, dev Mac, 2026-09-02
- [[sources/runs/2026/09/2026-09-02-prefill-sweep-ab-8k-16gb]] — prefill sweep A/B, 8k acceptance prompt at a 16 GB target, dev Mac, 2026-09-02
- [[sources/runs/2026/09/2026-09-02-doctor-json-macbook-pro-m5-pro-48gb]] — slotstream doctor --json on the dev Mac on 2026-09-02: the auto plan with other apps holding memory (availability clamped), binary 0.2.1, local build.
