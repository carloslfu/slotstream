---
type: design
meta-type: conclusion
id: 01m1hhwn962swp20jsft2zg4ym
created: 2026-09-02T17:15:27.398437+00:00
updated: 2026-09-02T17:15:27.398437+00:00
summary: 4.5 CLI & install UX
date: 2026-08-28
doc: plan
level: '3'
order: '140'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 4.5 CLI & install UX
---

```
slotstream pull                            # ✅ parallel (8 conns), resumable, sha256-verified download of the pinned revision (`--verify` re-checks)
slotstream doctor [--memory-gb G]          # ✅ device report + the plan any flags produce + target table
slotstream run qwen3.8-flash-next:4bit     # REPL chat
slotstream serve                           # ✅ zero-config: auto-tunes, announces the plan, resizes elastically
slotstream serve --memory-gb 16            # ✅ total-process memory target (cache gets G − 4.4 GB; pinned)
slotstream serve --no-elastic              # ✅ pin an auto size too
slotstream serve --mtp on|off|auto         # ✅ MTP speculative decode (auto: only ≥120 experts/layer after its 1.6 GB)
slotstream elastic-check                   # ✅ byte-identical output across live pool grow/shrink
slotstream mtp-parity                      # ✅ draft head bit-exact vs the Python reference fixture
slotstream mtp-accept                      # ✅ measure the draft accept curve on real greedy continuations
slotstream mtp-check                       # ✅ speculative gates: determinism, state integrity, accept sanity
slotstream install                         # LaunchAgent (com.slotstream.server), starts at login
slotstream bench [--suite full|quick] [--sim-ram 16]
```

Config: `~/.slotstream/config.json` + env overrides; models in `~/.slotstream/models/`;
logs via os_log + `~/.slotstream/logs/`. ✅ Distribution (2026-08-28): public curl
installer (`install.sh` at the repo root → latest `gh release` tarball of binary +
metallib, sha256-checked, installed to `~/.slotstream/bin`, PATH wired, optional
handoff to `serve`); `serve`/`run` offer the model download interactively when weights
are missing. Later: Homebrew tap + notarized binaries + CI-built releases. Disk
requirement enforced by `pull`: ~105 GB for the 4-bit build (+ transient download
staging; `--purge-source` streams the repack to stay under ~130 GB peak), ~84 GB for
the later compact build.

---
