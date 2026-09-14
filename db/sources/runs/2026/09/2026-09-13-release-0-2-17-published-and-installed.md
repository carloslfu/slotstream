---
type: run
id: 01m2e5bvxbtrvthqpt9pxpkr20
created: 2026-09-13T19:54:32.747134+00:00
updated: 2026-09-13T19:54:32.747134+00:00
summary: v0.2.17 CI-artifact acceptance 25/25 after an environment-only first run, publication with verified attestation, installation and installed-release acceptance 31/31.
binary: 1d761999c461c19237f4efa84947265c6253890ea57824ca62b7e2892e8f32aa
captured_at: 2026-09-13
command: release_accept.sh (Tools/release_candidate.py, Tools/verify.sh); post_release.sh (gh release download, gh attestation verify, install.sh, Tools/e2e_release.sh)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.17 published, installed and accepted
tool: Tools/verify.sh on the CI artifact, release workflow publication and attestation, install.sh, Tools/e2e_release.sh on the installed binary
---
Five phases ran in order against the exact CI artifact for commit `d25dffff1f3f56e70ddb9f11b82e7dc1b843f041`, with every user application left open: candidate verification, model acceptance on the downloaded CI binary, tag publication and provenance verification, local installation, and installed-release acceptance.

**CI and the candidate.** Main CI run 34775403549 succeeded across its coverage, weights-free and public-library jobs, and the docs (34775403533) and context-proxies (34775403562) workflows on the same commit succeeded. `Tools/release_candidate.py` verified the downloaded `slotstream-ci-candidate` archive: archive SHA-256 `66eb2ae95b325e75280d675fcf2afb3d61ef27db5500dea462faadef457b6042`, binary SHA-256 `1d761999c461c19237f4efa84947265c6253890ea57824ca62b7e2892e8f32aa`, and 162 source files matching the checkout. The binary reports `0.2.17`.

**First acceptance run: an environment skip.** The first `Tools/verify.sh` run started from the release worktree, which did not have the mlx 0.31.1 reference environment `.venv31`. Vision parity printed `SKIP vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)`, which the suite counts as a failure, and the run ended `passed 23, failed 1` after 1,211 seconds. Every other gate passed, including the vision serving suite. With the environment present that section runs two gates, the tower dump and the reference comparison, so the complete suite is twenty-five gates.

**Second acceptance run: 25 of 25.** The same artifact was downloaded again with identical digests, the main checkout's `.venv31` (Python 3.12.9, mlx 0.31.1) was linked into the worktree for the run, and the complete suite ran again: `passed 25, failed 0` after 1,065 seconds, with no FAIL or SKIP line. Its sections cover weights provenance over all 105.3 GB of pinned files, goldens and layer parity, planner gates, sampler and governor gates, streaming golden equivalence, the elastic pool and governor, the conversation prefix cache, the prefill sweep, draft-head parity and speculative decode gates, the memory-target context check, serving robustness, the behavioural quality probe, weights behind a symlink, vision tower parity and the vision serving suite. The link was removed afterwards.

System counters were read shortly after the second run started (2026-09-13T19:30:27Z) and after it ended (19:48:20Z): swap-ins went from 7,830 to 7,890, swap-outs from 26,312 to 26,368, and reclaimable memory from 29,783,048,192 to 31,304,253,440 bytes. Under [[records/decisions/global-paging-is-diagnostic]] these counters are diagnostics; acceptance was decided by the suite's own assertions and headroom guards.

**Publication.** Lightweight tag `v0.2.17` on `d25dffff1f3f56e70ddb9f11b82e7dc1b843f041`, the same tag form as earlier releases. Release workflow run 34778829372 succeeded and published at 2026-09-13T19:49:26Z, neither draft nor prerelease. The public archive was downloaded again: its SHA-256 equals the CI artifact and the published `.sha256` file, and `gh attestation verify` confirmed its provenance for `carloslfu/slotstream`.

**Installation.** `install.sh` exited 0 and replaced 0.2.16 with 0.2.17. The installed binary hashes to `1d761999c461c19237f4efa84947265c6253890ea57824ca62b7e2892e8f32aa`, byte-identical to the CI candidate. The installer keeps each release under `~/.slotstream/releases/` and points the `bin` link at the active one; 0.2.16 remains in `releases/e5acbe687e28a064ac4230bce745edf7ceac28fac3a1c8e15347420f12c4fa39-macos26` and reports `0.2.16`.

**Installed-release acceptance.** The installed binary served on port 11530 with `--memory-gb 10 --mtp on --vision off` and was ready after 10 seconds. Its startup banner shows the automatic window on the public artifact:

```text
context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
window: automatic for this Mac, 32768 tokens: the largest of 32768, 65536, 131072, 262144 that keeps speculative decoding, retains one complete conversation and adds at most 10% to a typical request
```

`Tools/e2e_release.sh` returned `e2e: passed 31, failed 0` after 72 seconds. The script covers install integrity, both API surfaces, short, long, Unicode and streamed generation, inputs that used to crash, live prefix reuse, four concurrent clients and a client vanishing mid-stream; its checks include `/api/version` matching 0.2.17.

**Closure.** The server was stopped, no Slotstream process remained, port 11530 was free, reclaimable memory was 31.4 GB, and the installed binary reports 0.2.17. No user application was closed or paused.

This run qualifies the published artifact functionally. It makes no clean-timing or throughput claim, and it does not exercise a window above 32,768 tokens; the larger windows rest on [[records/measurements/automatic-context-window-131072-read-2026-09-13]], [[records/measurements/automatic-context-window-draft-head-131072-2026-09-13]] and the memory ledger.
