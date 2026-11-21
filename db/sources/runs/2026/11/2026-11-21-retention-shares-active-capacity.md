---
type: run
id: 01m7yx6w2hcpxkm11xvrmdacpc
created: 2026-11-21T11:17:34.929156769+00:00
updated: 2026-11-21T11:17:48.073633569+00:00
summary: 'Retained prefix-cache bytes inside the active capacity and sequential read-scope pricing: main, pr and fix at ctx 138240, --memory-gb 27 to 32, multi-conversation turns and doctor tiers'
binary: d30ee840 f490727171acd7681f64529549ff6e7e75bc9cec01110ad890a9eb169c64b912; 4384abc6 c232112fe063dbdd7fc081213fb69302bdd9db20490f6dd406f06423b8c29872; 58581e69 30fc711bbc7bcc5251a741e77c73752e7523bf4a9d60dbbdf194d0ecee4af6a7
captured_at: 2026-11-21
command: Exact command per arm in archived run/*/command.txt; drivers run_pr.sh and run_multi.sh; launch*.sh and command.txt record every launch
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
title: Retention inside the active capacity and sequential read-scope pricing
tool: speed.py, multi.py and slotstream doctor (archived)
---
[2026-11-21-retention-shares-active-capacity.tar.xz](2026-11-21-retention-shares-active-capacity.tar.xz) preserves 239 evidence files. SHA-256 `1af934301bcfff63da9ea67dfc75969e8aff3b30810b7ceff06bbbad9d82ebe4`. Prefix-cache directories and patch files were left out, and the home directory is written as `~`.

Three release builds ran, each with a benchmark-only switch (`SLOTSTREAM_BENCH_IGNORE_EOS=1`) so a long request decodes all 256 reply tokens:

- `main`: `d30ee840` (SHA-256 `f490727171acd7681f64529549ff6e7e75bc9cec01110ad890a9eb169c64b912`).
- `pr`: `4384abc6`, retained prefix-cache sequence bytes charged inside the active capacity (SHA-256 `c232112fe063dbdd7fc081213fb69302bdd9db20490f6dd406f06423b8c29872`).
- `fix`: `4384abc6` plus `58581e69`, an automatic read scope's attention and expert phases priced as sequential (SHA-256 `30fc711bbc7bcc5251a741e77c73752e7523bf4a9d60dbbdf194d0ecee4af6a7`).

A diagnostic build, `scopelog`, adds a stderr line per read-scope decision and an override of the read-scope limit; it located the cause and is not part of the change.

Every server ran with `SLOTSTREAM_PREFILL_CHUNK=256 SLOTSTREAM_OPT_EXPERT_PREFETCH=0 SLOTSTREAM_WIRED_LIMIT=1`, `--max-context 138240 --mtp on --vision on`, the `--model` copy plus three `--mirror` copies, a 20 GB prefix-cache disk tier in a fresh directory, and `--memory-gb 27` unless the arm name carries `@N`. `run_pr.sh` runs the preflight check, the cleanup script and a 60 s idle wait before each arm, and stops if preflight fails. Each arm directory holds `command.txt` with the exact command, `server.log`, every response and `result.json`.

- `speed.py`: an image request, a 2048-token raw prompt and a 137984-token raw prompt, each generating up to 256 greedy tokens.
- `multi.py`: a 130000-token chat turn, a title request with a different prefix, the chat continued by 4000 tokens, a second title request and the chat continued by 2000 more, as Open WebUI interleaves them.
- `doctor-tiers/`: `slotstream doctor --sim-ram N` output of `main` and `fix` from 8 to 128 GB, and at 128 GB with 40 GB available.
- `checks.log` is `make checks` on `fix`; `static-gates-2.log` is `Tools/static_gates.sh` on `fix` before the planner gates were updated.
