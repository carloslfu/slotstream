---
type: run
id: 01m39nfaw99jwtmy11n1pxjvg2
created: 2026-09-24T12:15:33.257770+00:00
updated: 2026-09-24T12:16:02.974649+00:00
summary: 'The fixed build in a live serve process: a shared prefix colliding with a conversation checkpoint is upgraded, reused by another conversation, kept by a deeper save and restored across a restart'
binary: .build/release/slotstream 73421a66d657fb320bf4a041b4da1b03eae769a186b30e4ef2d46bcad6a7c5a7; .build/release/slotstream-checks 58789b0f55f721bb9c372376d23ed2c3ade0653ced1852d7cbd512c9b0cb9d6d (tree 889ff1c)
captured_at: 2026-09-24
command: swift build -c release --disable-sandbox; cp Tools/lib/mlx-0.32.2.metallib .build/release/mlx.metallib; .build/release/slotstream-checks --tier t1 --filter persistent-prefix-round-trip; .build/release/slotstream-checks --tier t0 --tier t1; .build/release/slotstream serve --memory-gb 10 --max-context 8192 --prefix-cache-dir <fresh> --prefix-cache-min-tokens 1024 --prefix-cache-disk-gb 8 --port 11500; .build/release/slotstream prefix-cache --dir <fresh> --json
discarded: 'false'
machines: '[[records/machines/macbook-air-m5-32gb-local]]'
title: 'Live server acceptance: a colliding shared prefix is upgraded, reused across conversations and kept by a deeper save'
tool: slotstream-checks (T0/T1), slotstream serve, slotstream prefix-cache
---
The live-server acceptance the 2026-09-23 record asked for: the committed fix
(`889ff1c`) in a real `serve` process, disk tier on, fresh empty cache
directory. That record's gate ran on synthetic states
(`persistent-prefix-round-trip`, T1); this run drives the same collision
through the engine's own save path and looks for the three observables it
named — `saved shared N-token prefix` in the log, `"shared": true` in
`slotstream prefix-cache`, and the reuse a second conversation then gets.

## Build and gates

```
swift build -c release --disable-sandbox   # `make build` fails in the DSH file sandbox: SwiftPM's own
cp Tools/lib/mlx-0.32.2.metallib .build/release/mlx.metallib   # sandbox-exec cannot nest

$ .build/release/slotstream-checks --tier t1 --filter persistent-prefix-round-trip
PASS  persistent-prefix-round-trip (110 assertions)
1 passed, 0 failed, 0 skipped (110 assertions)
EXIT=0

$ .build/release/slotstream-checks --tier t0 --tier t1
73 passed, 0 failed, 0 skipped (31931 assertions)
EXIT=0
```

Binaries: `.build/release/slotstream`
73421a66d657fb320bf4a041b4da1b03eae769a186b30e4ef2d46bcad6a7c5a7;
`.build/release/slotstream-checks`
58789b0f55f721bb9c372376d23ed2c3ade0653ced1852d7cbd512c9b0cb9d6d; metallib
dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed, matching the
build receipt written by `Tools/build_identity.py`.

## The live plan

```
slotstream serve --memory-gb 10 --max-context 8192 \
  --prefix-cache-dir <fresh empty dir> --prefix-cache-min-tokens 1024 \
  --prefix-cache-disk-gb 8 --port 11500
```

```
  cache:  ~21 of 512 experts per layer  (1013 global slots = 2.8 GB pool)
  plan:   ~9.0 GB full-workload envelope, ~4 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 8192 tokens per request (prompt + reply)
engine ready in 1.0s: expert cache ~21/512 per layer (1013 global slots = 2.8 GB), eos [248044, 248046]
prefix cache disk: <dir> holds 0 states (0.00 GB of 8.00 GB); writes states of 1024 tokens or more
```

Requests were sent as raw HTTP over a socket that is **not** half-closed after
the write: the inference path checks peer liveness (`Server.swift`,
`beginRequest` → `peerAlive(fd)`), so a client that shuts its write side down
has its connection closed with no response at all. `/api/show` is unaffected
because it is not an inference path — a 0-byte response there would be a
different bug.

## The collision, through the engine's save path

Conversation A: one system message of about 2,400 words plus a two-token user
turn, 3,639 prompt tokens, `num_predict 6`. The system block's last completed
256-token pass and the prompt's own last resume boundary are the same
position, so the checkpoint write lands first and the shared save follows:

```
prefix cache: miss: no retained state (0 prior evictions)
prefix cache: miss: retained states are not exact prefixes of this prompt
[20:06:19] prefix cache disk: saved 3584 tokens (214.8 MB written) in 0.11 s
[20:06:19] prefix cache disk: saved shared 3584-token prefix (115.7 MB written, 99.1 MB of rows reused) in 0.03 s
```

Same 3,584 boundary, two writes: the checkpoint without the flag, then the
shared save that upgrades it and references 99.1 MB of its rows instead of
writing them again. The directory at that moment:

```
{'tokens': 3584, 'shared': True, 'continued': True, 'draft': False}
```

Conversation B, a different conversation with the same system block, 3,643
prompt tokens:

```
prefix cache: reusing 3584/3643 tokens from memory
```

Conversation C extends A by an assistant turn and a much longer user turn,
4,850 prompt tokens, and writes a deeper state; the save line has no `removed`
clause at all, where the field session's equivalent save removed the head:

```
prefix cache: reusing 3584/4850 tokens from memory
[20:07:23] prefix cache disk: saved 4608 tokens (144.0 MB written, 99.1 MB of rows reused) in 0.09 s
```

```
<dir>: 2 states (1 shared prefix) and 2 segments, 0.36 GB
  build         tokens      head  last used
  c0d169de91e6      4608   115.7 MB  2026-09-24 20:07  continued
  c0d169de91e6      3584   115.7 MB  2026-09-24 20:06  shared prefix, continued
  rows in 2 segments: 0.13 GB
```

Both survive: the deeper 4,608 state and the 3,584 shared prefix.

## Across processes, from disk only

The server was stopped and started again on the same directory, so no
conversation state was in memory. Conversation B then read the shared head
from the disk tier:

```
prefix cache disk: <dir> holds 2 states (0.36 GB of 8.00 GB); writes states of 1024 tokens or more
[20:08:03] prefix cache disk: restored 3584 tokens (214.7 MB) in 0.04 s
prefix cache: reusing 3584/3643 tokens from disk
```

Observed wall times in the same run, incidental and not a claim: A 38.6 s,
B 5.9 s, C 35.5 s, B after the restart 13.9 s.

## Limits

Functional acceptance on one machine shared with other sessions. The collision
was constructed, not met in the field: the system block and the prompt's last
resume boundary were made to fall in the same 256-token cell, and the log
confirms both writes at 3,584. The field workload that exposed the bug was a
24,576-to-26,624-token agent session; nothing here re-runs it. Elapsed times
are incidental observations on a machine in ordinary use, not a timing or
performance measurement.
