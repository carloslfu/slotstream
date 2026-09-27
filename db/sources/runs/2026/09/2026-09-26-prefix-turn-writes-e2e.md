---
type: run
id: 01m3gkbgaxstreefaqf1hx5azr
created: 2026-09-27T04:53:11.643016+00:00
updated: 2026-09-27T04:55:37.545287+00:00
summary: 'Live per-turn prefix cache writes: the released 0.2.25 rewrites a continued turn''s own state as a shared prefix, the fix writes it once with identical ids'
binary: .build/release/slotstream 80ed5960621dae59dddcbcd79a6f69f781ea2297d78a3b896975a5dd89959de0; .build/release/slotstream-checks 6eb2594d5b7a0b7f2e7ee3588f9b80996728c9e34ac7745a1166191a4dbae70a (source archive d63721348afc29337d6bc744d0f3c03371bb9a83f0cd2f4a4c48b22d2859fbbc); released 0.2.25 ~/.slotstream/bin/slotstream d960143c783dda94bd4d43d304e5f9f7c0e195f7d00feacc2934885dd3d3a951
captured_at: 2026-09-26
command: GIT_CONFIG_GLOBAL=/dev/null SLOTSTREAM_BUILD_JOBS=4 make build; .build/release/slotstream-checks --tier t0 --tier t1; Tools/prefix_turn_writes_e2e.py --binary <fixed or 0.2.25> --work <fresh> --out <result>; Tools/shared_prefix_e2e.py --binary <fixed or 0.2.25> --memory-gb 10 --min-tokens 1024 --num-predict 320 [--skip-cold]
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Live per-turn prefix cache writes on 0.2.25 and on the branch-point fix
tool: Tools/prefix_turn_writes_e2e.py, Tools/shared_prefix_e2e.py, slotstream-checks (T0/T1)
---
A live check of what a continued conversation writes to the prefix cache
disk per turn, on the released 0.2.25 and on the fix (branch `review-fixes`;
its build identity's 209 source hashes equal the commit that adds this run).
Found by code review: since 0.2.22
the end of the previous reply counted as a shared-prefix target, and 0.2.25's
colliding-boundary upgrade rewrote the turn's own checkpoint there as shared.
No earlier live run reached the case, because each used replies too short to
cross a 256-token pass or lost the conversation entry to a restart or memory
eviction before the next turn.

## Build and gates

```
GIT_CONFIG_GLOBAL=/dev/null SLOTSTREAM_BUILD_JOBS=4 make build   # the global git config rewrites https to ssh
$ .build/release/slotstream-checks --tier t0 --tier t1
PASS  persistent-prefix-metadata-bounds (49 assertions)
PASS  optimization-prefix-client-capacity (79 assertions)
PASS  persistent-prefix-policy (126 assertions)
PASS  persistent-prefix-clear (18 assertions)
PASS  persistent-prefix-read-failures (36 assertions)
PASS  persistent-prefix-round-trip (110 assertions)
PASS  anthropic-request (87 assertions)
PASS  anthropic-logical-turns (285 assertions)
PASS  anthropic-events (40 assertions)
80 passed, 0 failed, 0 skipped (32468 assertions)
EXIT=0
```

`GIT_CONFIG_GLOBAL=/dev/null` only disables this machine's https-to-ssh
rewrite for the dependency fetch. The build identity's source hashes match
the committed tree.

Binaries: fixed `.build/release/slotstream`
80ed5960621dae59dddcbcd79a6f69f781ea2297d78a3b896975a5dd89959de0,
`.build/release/slotstream-checks`
6eb2594d5b7a0b7f2e7ee3588f9b80996728c9e34ac7745a1166191a4dbae70a; released
0.2.25 `~/.slotstream/bin/slotstream`
d960143c783dda94bd4d43d304e5f9f7c0e195f7d00feacc2934885dd3d3a951.

## Three turns, one server each

`Tools/prefix_turn_writes_e2e.py` (added with the fix): one `serve
--memory-gb 10 --prefix-cache-dir <fresh> --prefix-cache-min-tokens 1024`, a
system prompt of 1,615 tokens and three turns with 320-token replies, one
model process at a time. Reclaimable memory before each server:
35.0 GB (fixed), 36.0 GB (0.2.25); no swap in use.
`<scratch>` replaces the session's scratch directory.

Fixed build, exit 0:

```
$ Tools/prefix_turn_writes_e2e.py --binary .build/release/slotstream --work <scratch>/turn-writes-fixed --out <scratch>/turn-writes-fixed.json
turn 1: prompt 1638, reused 0, decoded 320; saved 1536 tokens (158.1 MB), shared prefix kept at [1536] (115.7 MB)
turn 2: prompt 1984, reused 1536, decoded 320; saved 1792 tokens (122.8 MB), shared prefix kept at nothing (0.0 MB)
turn 3: prompt 2329, reused 1792, decoded 53; saved 2304 tokens (129.8 MB), shared prefix kept at nothing (0.0 MB)
  prefix cache disk: <scratch>/turn-writes-fixed/states holds 0 states (0.00 GB of 20.00 GB); writes states of 1024 tokens or more; forgets states unused for 30 days
  [11:46:34 PM] prefix cache disk: saved 1536 tokens (158.1 MB written) in 0.12 s
  [11:46:34 PM] prefix cache disk: saved shared 1536-token prefix (115.7 MB written, 42.5 MB of rows reused) in 0.09 s
  [11:47:15 PM] prefix cache disk: saved 1792 tokens (122.8 MB written, 42.5 MB of rows reused) in 0.05 s
  [11:47:57 PM] prefix cache disk: saved 2304 tokens (129.8 MB written, 49.5 MB of rows reused) in 0.07 s
PASS  the first turn kept its system prompt as a shared prefix
PASS  each later turn wrote its own state
PASS  no later turn kept a shared prefix
PASS  the directory lists the system prompt as its only shared prefix
exit 0
```

Released 0.2.25, exit 1:

```
$ Tools/prefix_turn_writes_e2e.py --binary ~/.slotstream/bin/slotstream --work <scratch>/turn-writes-0225 --out <scratch>/turn-writes-0225.json
turn 1: prompt 1638, reused 0, decoded 320; saved 1536 tokens (158.1 MB), shared prefix kept at [1536] (115.7 MB)
turn 2: prompt 1984, reused 1536, decoded 320; saved 1792 tokens (122.8 MB), shared prefix kept at [1792] (115.7 MB)
turn 3: prompt 2329, reused 1792, decoded 53; saved 2304 tokens (129.8 MB), shared prefix kept at nothing (0.0 MB)
  prefix cache disk: <scratch>/turn-writes-0225/states holds 0 states (0.00 GB of 20.00 GB); writes states of 1024 tokens or more; forgets states unused for 30 days
  [11:48:30 PM] prefix cache disk: saved 1536 tokens (158.1 MB written) in 0.12 s
  [11:48:30 PM] prefix cache disk: saved shared 1536-token prefix (115.7 MB written, 42.5 MB of rows reused) in 0.05 s
  [11:49:10 PM] prefix cache disk: saved 1792 tokens (122.8 MB written, 42.5 MB of rows reused) in 0.05 s
  [11:49:10 PM] prefix cache disk: saved shared 1792-token prefix (115.7 MB written, 49.5 MB of rows reused) in 0.05 s
  [11:49:53 PM] prefix cache disk: saved 2304 tokens (129.8 MB written, 49.5 MB of rows reused) in 0.09 s
PASS  the first turn kept its system prompt as a shared prefix
PASS  each later turn wrote its own state
FAIL  no later turn kept a shared prefix
FAIL  the directory lists the system prompt as its only shared prefix
exit 1
```

Where the old rule saved, from the result files (`later_turns`): each later
prompt matched the previous prompt and all of its reply, past a pass
boundary beyond what the turn reused.

```
fixed:  [{"matched": 1958, "previous_prompt": 1638, "reused": 1536, "old_rule_saved": true}, {"matched": 2304, "previous_prompt": 1984, "reused": 1792, "old_rule_saved": true}]
0.2.25: [{"matched": 1958, "previous_prompt": 1638, "reused": 1536, "old_rule_saved": true}, {"matched": 2304, "previous_prompt": 1984, "reused": 1792, "old_rule_saved": true}]
```

Prompt and output ids, per turn, fixed against 0.2.25 (SHA-256 of the id
lists from the result files):

```
turn 1: prompt dbfe346343907a74 == dbfe346343907a74, output 891407328c608130 == 891407328c608130
turn 2: prompt e8a6864af38c84d3 == e8a6864af38c84d3, output 3c6d06c2b159aa68 == 3c6d06c2b159aa68
turn 3: prompt 640ca1a0a2d04c5b == 640ca1a0a2d04c5b, output e843d41624a9c5d5 == e843d41624a9c5d5
```

## The shared-prefix gate with long replies

`Tools/shared_prefix_e2e.py --memory-gb 10 --min-tokens 1024 --num-predict
320` on the fixed build (with the cold server) and on 0.2.25 (`--skip-cold`).
Both pass: its later turns run after a restart or after another
conversation evicted the entry, so this gate does not reach the case above.

Fixed build, exit 0:

```
A: prompt 3663 tokens, reused 0 (restored 0 from disk), shared prefix kept at [3584] (hint 3638, common 0), first token 19.03 s, prefill 19.00 s, shared save saved 115.7 MB in 0.06 s
B: prompt 3660 tokens, reused 3584 (restored 0 from disk), shared prefix kept at nothing (hint 3638, common 0), first token 2.24 s, prefill 2.24 s, shared save None 0.0 MB in 0.00 s
A_turn_2: prompt 4005 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3641), first token 6.72 s, prefill 6.69 s, shared save None 0.0 MB in 0.00 s
C: prompt 3660 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3641), first token 2.38 s, prefill 2.32 s, shared save None 0.0 MB in 0.00 s
D: prompt 3640 tokens, reused 0 (restored 0 from disk), shared prefix kept at [2304, 3584] (hint 3619, common 2526), first token 28.63 s, prefill 28.63 s, shared save saved 295.1 MB in 0.18 s
E: prompt 3640 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3619, common 2526), first token 2.03 s, prefill 1.97 s, shared save None 0.0 MB in 0.00 s
C_turn_2: prompt 3709 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3641), first token 3.05 s, prefill 3.02 s, shared save None 0.0 MB in 0.00 s
C_turn_3: prompt 3809 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3641), first token 3.94 s, prefill 3.91 s, shared save None 0.0 MB in 0.00 s
B_cold: prompt 3660 tokens, reused 0 (restored 0 from disk), shared prefix kept at nothing (hint None, common None), first token 19.64 s, prefill 19.62 s, shared save None 0.0 MB in 0.00 s
C_cold: prompt 3660 tokens, reused 0 (restored 0 from disk), shared prefix kept at nothing (hint None, common None), first token 39.20 s, prefill 39.20 s, shared save None 0.0 MB in 0.00 s
PASS  A found its system boundary
PASS  A kept its system prompt at the last pass end at or before the boundary
PASS  A wrote it to disk as a shared prefix
PASS  A's own state reused the shared prefix's rows
PASS  B reused the shared prefix from memory
PASS  B's first token came sooner than A's
PASS  A's second turn kept the shared prefix
PASS  a restarted server restored the shared prefix for C
PASS  D kept the head it shares with S
PASS  D kept its own system prompt too
PASS  another restarted server restored D's system prompt for E
PASS  C's later turns left the shared prefixes in place
PASS  prefix-cache lists them as shared prefixes
PASS  no shared prefix was refused or failed
PASS  the cold server reused nothing
PASS  B's output ids equal the cold server's
PASS  C's output ids equal the cold server's
exit 0
```

Released 0.2.25, exit 0:

```
A: prompt 3663 tokens, reused 0 (restored 0 from disk), shared prefix kept at [3584] (hint 3638, common 0), first token 19.12 s, prefill 19.10 s, shared save saved 115.7 MB in 0.06 s
B: prompt 3660 tokens, reused 3584 (restored 0 from disk), shared prefix kept at nothing (hint 3638, common 3584), first token 2.23 s, prefill 2.23 s, shared save None 0.0 MB in 0.00 s
A_turn_2: prompt 4005 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3641), first token 6.58 s, prefill 6.54 s, shared save None 0.0 MB in 0.00 s
C: prompt 3660 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3641), first token 2.43 s, prefill 2.38 s, shared save None 0.0 MB in 0.00 s
D: prompt 3640 tokens, reused 0 (restored 0 from disk), shared prefix kept at [2304, 3584] (hint 3619, common 2526), first token 28.99 s, prefill 28.99 s, shared save saved 295.1 MB in 0.19 s
E: prompt 3640 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3619, common 3584), first token 2.00 s, prefill 1.95 s, shared save None 0.0 MB in 0.00 s
C_turn_2: prompt 3709 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3641), first token 2.96 s, prefill 2.93 s, shared save None 0.0 MB in 0.00 s
C_turn_3: prompt 3809 tokens, reused 3584 (restored 3584 from disk), shared prefix kept at nothing (hint 3638, common 3709), first token 3.68 s, prefill 3.66 s, shared save None 0.0 MB in 0.00 s
PASS  A found its system boundary
PASS  A kept its system prompt at the last pass end at or before the boundary
PASS  A wrote it to disk as a shared prefix
PASS  A's own state reused the shared prefix's rows
PASS  B reused the shared prefix from memory
PASS  B's first token came sooner than A's
PASS  A's second turn kept the shared prefix
PASS  a restarted server restored the shared prefix for C
PASS  D kept the head it shares with S
PASS  D kept its own system prompt too
PASS  another restarted server restored D's system prompt for E
PASS  C's later turns left the shared prefixes in place
PASS  prefix-cache lists them as shared prefixes
PASS  no shared prefix was refused or failed
exit 0
```
