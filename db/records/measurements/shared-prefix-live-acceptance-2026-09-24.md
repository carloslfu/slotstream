---
type: measurement
id: 01m39ngcea9yj2j9y8s1rzqsbf
created: 2026-09-24T12:16:07.626763+00:00
updated: 2026-09-24T12:16:07.626763+00:00
summary: 'A live serve process on the fixed build: a shared prefix colliding with a conversation checkpoint is upgraded, reused by another conversation, kept by a deeper save and restored across a restart'
date: 2026-09-24
doc: measurements
level: '2'
machines: '[[records/machines/macbook-air-m5-32gb-local]]'
note: Functional acceptance in a live serve process on a 32 GB MacBook Air shared with other sessions; the collision is constructed and confirmed in the log, one plan and one prompt shape are covered, and no timing is claimed.
order: '1663'
runs: '[[sources/runs/2026/09/2026-09-24-shared-prefix-live-acceptance]]'
title: 'The fixed build in a live server: a colliding shared prefix is upgraded, reused and kept'
status: measured
---
**Outcome: in a live server running the fixed build, a shared prefix whose boundary collides with a conversation's own checkpoint is upgraded with the flag, another conversation starts from it, a deeper state does not remove it, and it survives a restart on disk alone.** This closes, for one machine and one plan, the limit [[records/measurements/shared-prefix-boundary-upgrade-2026-09-23]] stated — *No live server has run the fixed build yet* — and produces the three observables it named: `saved shared N-token prefix` in the log, `"shared": true` in `slotstream prefix-cache`, and the reuse a second conversation then gets.

**The collision through the engine's own save path.** A 3,639-token request whose system block and whose own last resume boundary fall in the same 256-token cell writes its checkpoint at 3,584 without the flag and then the shared save at the same 3,584 boundary, which upgrades the head instead of answering it present:

```
[20:06:19] prefix cache disk: saved 3584 tokens (214.8 MB written) in 0.11 s
[20:06:19] prefix cache disk: saved shared 3584-token prefix (115.7 MB written, 99.1 MB of rows reused) in 0.03 s
```

The rows come through `State.persistedLineage`, so the upgrade writes 115.7 MB against the checkpoint's 214.8 MB and no rows are rewritten. The listing then reports `{'tokens': 3584, 'shared': True}`. The field session that exposed the bug logged no line containing `shared` in 172 lines and ended with four states all `"shared": false`.

**A second conversation starts from it.** A different conversation with the same system block reuses the head, `prefix cache: reusing 3584/3643 tokens from memory`. That is the payoff the 2026-09-23 record could only predict: the head is no longer classed as the first conversation's own, so another conversation is allowed to start from it.

**A deeper save keeps it.** Extending the first conversation to 4,850 prompt tokens writes a 4,608-token state, and the save line carries no `removed` clause — where the field session's equivalent save said `removed 1 older file` and took the 24,576-token head. The directory afterwards holds both: `4608 (shared false, continued)` and `3584 (shared prefix, continued)`.

**It restores across processes.** With the server stopped and restarted on the same directory, a fresh process reads the shared head from disk alone: `restored 3584 tokens (214.7 MB) in 0.04 s`, then `prefix cache: reusing 3584/3643 tokens from disk`.

**Evidence.** The regression gate on the same binaries passes 110 assertions, and the full T0+T1 catalogue passes 73 groups with 31,931 assertions and 0 failed. The live transcript, the plan the server printed, the state listings and the build identity are in [[sources/runs/2026/09/2026-09-24-shared-prefix-live-acceptance]].

**Limits.** Functional acceptance on one 32 GB MacBook Air shared with other sessions, one plan (`--memory-gb 10`, `--max-context 8192`, a 256-token prefill pass) and one prompt shape. The collision was constructed rather than met in the field: the system block and the prompt's last resume boundary were made to fall in the same 256-token cell, and the log confirms both writes at 3,584; the field workload — a 24,576-to-26,624-token agent session — is not re-run here. Elapsed times are incidental observations on a machine in ordinary use and are not a timing claim. The 2026-09-23 record's numbers stand and it is not superseded. The observed behaviour is one machine and one plan; the cross-conversation payoff in a real agent workload remains unobserved.
