---
type: community-report
id: 01m3ae4nm9g09s1vc232n9ef1b
created: 2026-09-24T19:26:38.216858+00:00
updated: 2026-09-24T19:26:45.781217+00:00
summary: 'Measured: `--prefix-cache-min-tokens 2048` costs a full re-prefill on every restart of a sub-2048 conversation'
captured_at: 2026-09-24
reporter: jasen215
title: 'Measured: `--prefix-cache-min-tokens 2048` costs a full re-prefill on every restart of a sub-2048 conversation'
url: https://github.com/carloslfu/slotstream/issues/17
---
Issue opened 2026-09-16T01:17:22Z; captured 2026-09-24.

The following issue body is preserved verbatim from the GitHub response.
Numbers and interpretations inside it are the author's reports. Nothing is
changed. The issue had no comments when captured.

## Original issue body

# Measured: `--prefix-cache-min-tokens 2048` costs a full re-prefill on every restart of a sub-2048 conversation

## Summary

`--prefix-cache-dir` writes no state for a conversation shorter than
`--prefix-cache-min-tokens` (default 2048, `PersistentPrefixSave.swift:50`). On
0.2.18 a **1919-token** conversation therefore re-read its whole prompt after a
restart (**0 reused tokens, 45.5 s** to first token). Lowering the floor to 1024
on the *same build and same scenario* recovers it: **1966 of 1991 prompt tokens
reused, prefill 6.0 s**.

The default is documented as "provisional default, not a measured optimum"
(`PersistentPrefixFormat.swift:38`); this is a first measurement of what it
costs. The floor is a one-line flag, so the tradeoff can be chosen per workload
today — the question is whether 2048 should stay the default, given that the
state it skips is only ~170 MB (measured: a 1919-token state wrote 170 MB).

A second probe in the same session measured what the retention policy costs when
a conversation is *rewound* rather than extended; it is reported separately
below because it is a policy question, not a floor question.

## Method

- Artifact: `main` @ `ad89ecc`, `slotstream --version` = **0.2.18**, built from
  this tree (`.build/release/slotstream`), 32 GiB Apple Silicon Mac.
- `--memory-gb 10 --max-context 65536`, **one model process at a time**.
- Scenario: a ~1.9k-token prose system prompt + one question. After the first
  turn the server stops, and the next server starts over a **copy of the state
  directory** — a new process, so any reuse can only come from the disk tier.
- Numbers are the server's own statistics (`reusedPrefixTokens`,
  `prefillSeconds`, `persistentPrefix.savedTokens`) with
  `SLOTSTREAM_BENCH_DETAILS=1`.
- Four server starts per configuration (`P1` create, `P2` restart, `P3` grow
  above the floor in-process, `P4` restart control), one run per configuration.

## Floor measurements

| phase | `--prefix-cache-min-tokens 2048` (default) | `--prefix-cache-min-tokens 1024` |
| --- | --- | --- |
| P1 write after turn 1 (prompt 1919) | **0 MB — nothing written** | 170 MB |
| P2 restart: prompt 1991, **reused** | **0** | **1966** |
| P2 restart: prefill | **45.5 s** | **6.0 s** |
| P3 in-process grow (prompt 2627) | reused 2038 | reused 2038 |
| P4 restart above both floors (prompt 2685), control | reused 2662 (restored 2662), 6.6 s | reused 2662, 6.5 s |
| disk after P4 | 307 MB | 479 MB |

Both configurations pass the in-run control (P4), so the harness itself is
sound: the difference is entirely the floor. The reused point is also exact —
1966 tokens is the turn-1 state's real length, whereas a pass-boundary writer
would quantize it.

## Retention: a rewind after a restart re-reads

*(A separate probe run from the floor measurements above.)*

A three-turn conversation whose turns append ~2.5k tokens each (states at 2582,
5062, 7516 tokens) was restarted and then *branched back to turn 1*
(same prefix, different question):

| phase | result |
| --- | --- |
| branch back to turn 1 after a restart | **reused 0**, prefill **45.9 s** |
| control: continue from the tip, same process | reused 7547, prefill 2.9 s |
| disk after each phase | 188 → 372 → 440 → 632 MB |

`PersistentPrefixPolicy.redundantAncestors` (`PersistentPrefixPolicy.swift:156`) keeps only the longest strict prefix
per save, so turn 1's state is gone once the conversation has advanced; the
rewind re-reads. This is independent of the floor: at
`--prefix-cache-min-tokens 1024` the same branch still reused 0.

## Limits of this evidence

- One run per configuration on one machine. Timings are single-run
  (the repo notes 15%+ run-to-run variance); the decisive differences here are
  0 vs non-zero reuse, not marginal values.
- Not tested: conversations longer than the in-memory retention at this window
  (~6828 tokens), concurrent requests, disk-quota eviction, or any floor other
  than 1024/2048.
- Raw per-request JSON and server logs from all runs are available on request.
- Related: **#18** — the same measurement session also found that a shared system
  prompt is not reusable across conversations (a state only ever ends at a
  request's end); that finding has its own issue.
