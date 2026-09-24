---
type: run
id: 01m32epty3ey5rvqnm37aexwaa
created: 2026-09-21T17:02:38.019694+00:00
updated: 2026-09-21T17:15:03.578504+00:00
summary: Prompt-speed engine implementation and rejected fused-attention candidate
binary: SHA-256 identities and exact source archives in experiments.tar.gz
captured_at: 2026-09-21
command: Archived commands and drivers; see body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Prompt-speed engine implementation and rejected fused-attention candidate
tool: Slotstream native diagnostics and paired Python harness
---
Raw bytes: [experiment archive](../../../artifacts/prompt-speed-2026-09-21/experiments.tar.gz) and [verified member hashes](../../../artifacts/prompt-speed-2026-09-21/experiments-manifest.json). The archive was captured and reopened to check every member before this record was authored. It contains commands, inputs, output, stderr, unsuccessful attempts, build identities and reconstructible source archives; it excludes executables and model weights.

The unchanged MLX 0.31.1 production dependency is tested through archived binaries in `baseline`, `qualified-before-legacy-bin` and `qualified-bin`. The exact source hashes distinguish these revisions. The isolated MLX 0.32.2 candidate uses mlx-swift revision `ab924c82ead3b970caaa1c0ac11171de23f0305a` and a matching Metal library; its source and identity are archived under `mlx032/.build/release`.

- `scope-8192.json`: 817 numerical checks pass, including ordered routing, retained state, continuation and rollback, with explicit 8192 read scopes and unchanged compute passes. Invocation uses `SLOTSTREAM_OPT_WORKSPACE_TILE=1024 SLOTSTREAM_OPT_SCOPE_FRONTIER=1` and `optimization-state-check --variant scope-larger-family --tokens 8192 --json`.
- `fused-family-2051.json`: 807 of 810 checks pass. The candidate changes the final greedy token in continued-907, continued-2103 and rollback-1. State/logit bands passing does not override those failures. Non-interleaved arm timings are diagnostic only. The upgrade remains excluded.
- `qualified-generation-phase.json` and its MTP counterpart: 19 checks each pass, including pending-token ownership, private persistence exclusion, a later cold-equivalent turn, cancellation and caller limits. The ordinary path also matches an independently reconstructed transition bit for bit. Its answer phase reads only three tokens.
- `qualified-prompt-checkpoint.json`: 21 checks pass. Automatic and explicit grouping save the deepest interior checkpoint; a 2051-token follow-up resumes 1792 and reads 259. Disk reopen retains the producing 256-token pass size, rejects a 512-token request at the same token boundary, and restores bit-exact logits when the producing arithmetic matches. A guarded automatic request selects an 8192-token scope with unchanged compute shapes and a physical peak below 10 GB.
- `t0.json`: all 56 groups pass. `t1.json`: all 15 component groups pass, including persistence round trips. `qualified-shared-prefix.json`: all 745 shared-prefix checks pass on the final engine revision.

Unsuccessful intermediate runs remain in the archive. The first phase diagnostic asserted idle pins after its own direct model-reference calls had pinned them; the final check observes cleanup before that reference work and releases its own pins. The initial T0 check still encoded the previous 4096 scope cap; the final check updates that bound while independently reconstructing every ordinary compute pass. The first shared-prefix regression exposed an introduced legacy-mode save refusal; the final implementation preserves legacy saves while retaining strict arithmetic provenance in the aligned production mode. Failed builds also remain visible. No unsuccessful attempt counts as a pass.

The upstream fused work is attributed to [wyanzhao's D256 NAX kernel](https://github.com/ml-explore/mlx/pull/3842), [hojin12312's force_fused API](https://github.com/ml-explore/mlx/pull/4185), and [dwijenpatel's array-mask dispatch](https://github.com/ml-explore/mlx/pull/4416). This task integrated and evaluated that work; it did not originate the upstream kernels.

## Final API compatibility review

The original public diagnostic function type is retained through a forwarding overload; the larger-scope probe adds an overload with an explicit scope argument. The final optimized build, original/new CLI validation dispatch and all 56 T0 groups pass. Byte hashes confirm this final adjustment changes only `SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift`; production engine and app sources are unchanged from the qualified runs. The app does not import SlotstreamDiagnostics. Brain gates pass with zero errors, the same two historical log-order warnings and 303 claim checks; projections and whitespace checks pass. See [final verification](../../../artifacts/prompt-speed-2026-09-21/final-verification.tar.gz) and [verified hashes](../../../artifacts/prompt-speed-2026-09-21/final-verification-manifest.json).
