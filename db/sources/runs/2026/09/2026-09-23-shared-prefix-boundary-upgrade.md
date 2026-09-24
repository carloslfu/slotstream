---
type: run
id: 01m370hpjcg12jth0xab69a7hg
created: 2026-09-23T11:31:21.804261+00:00
updated: 2026-09-24T12:18:57.790824+00:00
summary: 'Shared prefix head upgrade: the T1 case that fails without it, and the live session where no shared save reached disk'
binary: '.build/release/slotstream b8053abbd963f5615c0991b0ab07a01fd8c2201ed993e94939b6e86a9faf67c5; .build/release/slotstream-checks a20a27964b6773bb1d925354ac5aeffc74f80326566652be9f84907273148b9f (tree e33b0a8 plus the patch: the build the 110-assertion gate, the seven-failure pre-fix recheck and the 31,919-assertion catalogue ran on); the live session ran the installed v0.2.23 build, whose heads report build id 288056679a90'
captured_at: 2026-09-23
command: swift build -c release --disable-sandbox; cp Tools/lib/mlx-0.32.2.metallib .build/release/mlx.metallib; .build/release/slotstream-checks --tier t1 --filter persistent-prefix-round-trip; .build/release/slotstream-checks --tier t0 --tier t1; .build/release/slotstream optimization-state-check --variant shared-prefix --tokens 2051; .build/release/slotstream optimization-state-check --variant shared-prefix-mtp --tokens 2051; .build/release/slotstream prefix-cache
discarded: 'false'
machines: '[[records/machines/macbook-air-m5-32gb-local]]'
note: Machine attribution corrected 2026-09-24 to the 32 GB MacBook Air the capture was produced on; it had linked the store's 48 GB dev-Mac record. The run's evidence and wording are unchanged.
title: 'Shared prefix head upgrade: the T1 case that fails without it, and the live session where no shared save reached disk'
tool: slotstream-checks (T0/T1 catalogue), slotstream optimization-state-check --variant shared-prefix[-mtp], slotstream prefix-cache, ~/.slotstream/serve.log
---
One redaction when this run was ported from pull request #27: the home
directory in paths reads `/Users/<user>/`.

A working-tree change on top of `main`, not a release: a disk head that already holds the ids of a shared save is upgraded instead of answered as present, and a shared save that is skipped or fails is reported to the prefix-cache event stream. `Sources/Slotstream/PersistentPrefixSave.swift` (the existing-head check and `finish(_:)`) plus a new case in `Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift` (`persistent-prefix-round-trip`, T1).

## The live session that showed the loss

`~/.slotstream/serve.log`, the installed v0.2.23 server started as `slotstream serve --max-context 65536 --memory-limit-gb 22 --prefix-cache-min-tokens 1024 --prefix-cache-dir /Users/<user>/.slotstream/prefix-cache --prefix-cache-disk-gb 16` on port 11434. One agent session, 16:34 to 16:53, 172 log lines. **No line in the file contains `shared`**: a disk shared save prints `saved shared N-token prefix`, so no shared prefix reached disk in the whole session. Lines quoted verbatim (line numbers are the file's):

```
15: prefix cache disk: /Users/<user>/.slotstream/prefix-cache holds 2 states (0.97 GB of 16.00 GB); writes states of 1024 tokens or more; forgets states unused for 30 days
22: prefix cache: miss: no retained state (0 prior evictions)
55: [16:39:34] prefix cache disk: saved 24576 tokens (795.2 MB written) in 0.54 s
64: [16:47:06] prefix cache disk: restored 24576 tokens (795.2 MB) in 0.14 s
71: [16:47:29] prefix cache disk: restored 24576 tokens (795.2 MB) in 0.17 s
73: [16:47:43] prefix cache disk: saved 25600 tokens (144.1 MB written, 679.5 MB of rows reused) in 0.12 s
88: [16:48:51] prefix cache disk: restored 25600 tokens (823.5 MB) in 0.20 s
95: [16:49:14] prefix cache disk: restored 25600 tokens (823.5 MB) in 0.18 s
102: [16:49:39] prefix cache disk: restored 25600 tokens (823.5 MB) in 0.18 s
109: [16:50:05] prefix cache disk: restored 25600 tokens (823.5 MB) in 0.26 s
112: [16:50:20] prefix cache disk: saved 26624 tokens (144.1 MB written, 707.8 MB of rows reused) in 0.16 s, removed 1 older file
127: [16:51:19] prefix cache disk: restored 26624 tokens (851.8 MB) in 0.14 s
135: [16:51:52] prefix cache disk: restored 26624 tokens (851.8 MB) in 0.21 s
142: [16:52:24] prefix cache disk: restored 26624 tokens (851.8 MB) in 0.17 s
147: [16:52:26] prefix cache disk: restored 26624 tokens (851.8 MB) in 0.07 s
156: [16:53:02] prefix cache disk: restored 26624 tokens (851.8 MB) in 0.20 s
```

Line 55 is the request's own checkpoint at 24,576 tokens, written without the shared flag. Line 112 removed one older file, the 24,576 head, as a redundant ancestor once a deeper head existed. Three requests after 16:52 ended `insufficient_memory` at 35,582 tokens (8,958 to read) and saved nothing.

The directory after the session, `slotstream prefix-cache`:

```
/Users/<user>/.slotstream/prefix-cache: 4 states and 7 segments, 1.94 GB
  build         tokens      head  last used
  288056679a90     26624   115.9 MB  2026-09-23 16:53  continued
  288056679a90     25600   115.9 MB  2026-09-23 16:50  continued
  288056679a90     26624   115.9 MB  2026-09-23 13:09  continued
  288056679a90     25600   115.9 MB  2026-09-23 13:07  continued
  rows in 7 segments: 1.47 GB
```

`slotstream prefix-cache --json` reports every one of the four states as `"shared" : false`, `"continued" : true`, `"draft" : false`, `head_bytes` 115908592 and 115897787 (the two 13:07/13:09 states are from an earlier session, 05:07 and 05:09 UTC). The two lineages share 24 tokens of head inside the tool preamble; within one lineage the 25,600-token head is a strict prefix of the 26,624-token state.

## Build and gates

```
swift build -c release --disable-sandbox     # make build fails in this sandbox: SwiftPM's own sandbox-exec cannot nest
cp Tools/lib/mlx-0.32.2.metallib .build/release/mlx.metallib
```

The regression gate, post-fix build:

```
$ .build/release/slotstream-checks --tier t1 --filter persistent-prefix-round-trip
PASS  persistent-prefix-round-trip (110 assertions)

1 passed, 0 failed, 0 skipped (110 assertions)
EXIT=0
```

The same gate with **only** the one-line condition reverted (`existing.hasDraft || !includeDraft, existing.shared || !shared {` back to `existing.hasDraft || !includeDraft {`; the reporting and every assertion kept), rebuilt the same way:

```
$ .build/release/slotstream-checks --tier t1 --filter persistent-prefix-round-trip
FAIL  persistent-prefix-round-trip
        the shared save that follows upgrades the head: got present, want saved
        rewriting the head references its rows instead of writing them again
        the head is shared: got 0, want 1
        two later turns keep it instead of removing it as an ancestor
        its rows still restore exactly: got nil, want Optional([...])
        a reopened directory reads the flag from the head, not from memory
        and restores the upgraded head: got nil, want Optional([...])

0 passed, 1 failed, 0 skipped (110 assertions)
EXIT=1
```

Seven of the same 110 assertions fail; the two `Optional([...])` values are the full 36-entry digest dictionaries of the state, elided here. The paired assertion `and writes less than the checkpoint did` passes even on the no-op path, because a no-op writes 0 bytes: the `rewriting the head references its rows instead of writing them again` assertion above it is the one that pins the upgrade. Restoring the condition and rebuilding returns the gate to 110 assertions, 0 failed.

The CI catalogue, post-fix build, twice:

```
$ .build/release/slotstream-checks --tier t0 --tier t1
73 passed, 0 failed, 0 skipped (31851 assertions)     # before the row-reuse assertions were added
73 passed, 0 failed, 0 skipped (31919 assertions)     # final source, same 73 groups
EXIT=0
```

The assertion total varies between runs of the same source (the 0.2.24 log entry for 2026-09-23 records 31,907); the group count does not.

Real weights, `--tokens 2051` (2,051-token fixture, 640 pool slots), post-fix build, no server running:

```
$ .build/release/slotstream optimization-state-check --variant shared-prefix --tokens 2051
... PASS on every check, ending: PASS  a shared prefix one conversation starts from is a parent for now
                                 PASS  the leaves are conversations
                                 PASS  the reopened tier counts its shared saves
                                 PASS  the listing marks the shared prefixes
                                 PASS  and lists every state
EXIT=0
```

This variant runs with `InferenceOptimizations()` defaults, so `alignedPrefixResume` is nil and `prefixCheckpointTokens` is 0: there is no checkpoint at the shared boundary and the collision does not occur. It is a no-regression check on the disk write path, not evidence of the repair.

The draft-head variant of the same command was killed by the system:

```
$ .build/release/slotstream optimization-state-check --variant shared-prefix-mtp --tokens 2051
[rtk] ...: process terminated by signal 9
EXIT=137
```

Killed before it printed any check. Reclaimable memory was not re-measured immediately before it (20 GB an hour earlier, 15.8 GB before the non-MTP variant; the compressor held 5.93 GB after the kill). It was not retried and is **not** evidence either way. The run's temporary directory (`$TMPDIR/slotstream-shared-prefix-check-87931-…`, 288 MB, its `defer` cleanup does not run under SIGKILL) was removed; `$TMPDIR` holds no `slotstream-*` leftovers, and no `slotstream` process is running.

## The repository's own static gate set

`Tools/static_gates.sh` passes completely — `STATIC GATES PASS`, planner gates 90/0, the memory-override gate's 420 cases, `llms_full.sh --check` and the brain gates included — but only from a shell outside this session's file sandbox. Inside it, four of its gates fail for environmental reasons and, because the script is `set -e`, the twenty gates after them never ran until each was run by hand: `Tools/process_cleanup_checks.py` and `Tools/optimization_serial_build_test.py` call `ps`, which the sandbox answers with `PermissionError: [Errno 1] Operation not permitted` (the same error `rtk ps -p 1` returns), and `Tools/process_memory_gate.py` and `Tools/slotpack/checks.py` let `swiftc` write the default Clang module cache at `/var/folders/.../C/clang/ModuleCache/...`, which the sandbox refuses (`unable to open output file ...: 'Operation not permitted'`, then `could not build Objective-C module 'SwiftShims'`). `make build` fails in the same sandbox for a related reason: SwiftPM wraps its own manifest compilation in `sandbox-exec`, which cannot nest (`sandbox_apply: Operation not permitted`); `swift build -c release --disable-sandbox` plus the Makefile's metallib copy produces the same binaries, and the binary this record names is the one the passed static set reported (`binary_sha256` b8053abb…).

## The change

```
Sources/Slotstream/PersistentPrefixSave.swift      | 21 ++++++++-
Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift | 54 +++++++++++++++++++++-
2 files changed, 73 insertions(+), 2 deletions(-)
```

The existing-head check now requires the shared flag to match as well:

```
-           existing.hasDraft || !includeDraft {
+           existing.hasDraft || !includeDraft, existing.shared || !shared {
```

`finish(_:)` reports a shared save that is skipped or fails: `kept no shared N-token prefix: <why>` and `failed to write the shared N-token prefix: <why>`. A `.present` outcome for an already-shared head stays silent.
