---
type: measurement
id: 01m3ae6n907455neqzrfnmh3yj
created: 2026-09-24T19:27:43.392684+00:00
updated: 2026-09-24T19:27:43.392684+00:00
summary: Prefix-cache floor at 2048 and 1024 tokens across a restart (community, 2026-09-16)
date: 2026-09-16
doc: measurements
level: '2'
note: One run per configuration on one machine, reported by the author; the decisive differences are zero against nonzero reuse, not marginal timings.
order: '1664'
title: Prefix-cache floor at 2048 and 1024 tokens across a restart (community, 2026-09-16)
status: measured
---
Reported by `@jasen215` in [issue #17](https://github.com/carloslfu/slotstream/issues/17),
preserved in [[sources/community/2026/09/2026-09-16-prefix-cache-min-tokens-jasen215]].

Slotstream 0.2.18 (`main` at `ad89ecc`) on a 32 GiB Apple Silicon Mac,
`serve --memory-gb 10 --max-context 65536`, one model process at a time. The
prompt was a system prompt of about 1,900 tokens and one question. After the
first turn the server stopped and a new one started over a copy of the state
directory, so any reuse came from disk. The numbers are the server's own
statistics.

| Phase | Floor 2048 (the default) | Floor 1024 |
|---|---|---|
| Write after turn 1, 1,919-token prompt | nothing written | 170 MB |
| Restart, 1,991-token prompt: tokens reused | **0** | **1,966** |
| Restart: prefill | **45.5 s** | **6.0 s** |
| Control: restart above both floors, 2,685-token prompt | 2,662 reused, 6.6 s | 2,662 reused, 6.5 s |
| Disk after the last phase | 307 MB | 479 MB |

The controls agree, so the difference comes from the floor alone. The write
the floor avoids is small next to that re-read: on the 48 GB development Mac
at 10 GB, later turns wrote about 117 MB each, a new head and their new rows,
in 0.05 s, and a 225 MB state restored in 0.04 s
([[records/measurements/persistent-prefix-cache-2026-09-14]]). Pi's opening
prompt, about 1,600 tokens ([[records/design/measured-operating-policies]]),
is also below 2048, so the servers `slotstream launch` starts kept it in memory
but never wrote it to disk.

On this evidence the default fell to 1024 tokens on 2026-09-24. The cost is one
head plus the new rows on each turn of a conversation between 1,024 and 2,048
tokens, within the same disk quota. Nothing below 1,024 was measured.

**Rewinding after a restart.** A separate probe in the same report branched a
three-turn conversation back to turn 1 after a restart and reused 0 tokens at
either floor. The disk tier keeps a conversation's latest state and its parent,
so the last reply can be regenerated, and removes older ones by design. Since
0.2.21 a prompt's system message and the longest head it shares with a kept
state are also saved as shared prefixes when they reach the floor, so such a
branch reuses its system prompt, and a later branch from the same point
resumes from the head the first one saved. That behavior was not measured
again here.

One run per configuration on one machine, with single timings, as the report
states.
