---
type: measurement
id: 01m3gkcd1kqk2r4gmzzk2mwqhs
created: 2026-09-27T04:53:41.043255+00:00
updated: 2026-09-27T04:53:41.043255+00:00
summary: A continued conversation writes one prefix cache state per turn again; the released 0.2.25 rewrote a turn's own state as a shared prefix
date: 2026-09-26
doc: measurements
level: '2'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Functional before-and-after on one 48 GB M5 Pro at the 10 GB plan with one prompt shape; bytes written and the shared flags are the result, timings are incidental.
order: '1665'
runs: '[[sources/runs/2026/09/2026-09-26-prefix-turn-writes-e2e]]'
title: 'A continued conversation writes one state per turn: the end of a reply is not a shared prefix'
status: measured
---
**Outcome: a continued conversation now writes one state per turn; the released 0.2.25 also rewrote the turn's own state as a shared prefix.** In [[sources/runs/2026/09/2026-09-26-prefix-turn-writes-e2e]], one `serve --memory-gb 10` process per build over a fresh cache directory ran a system prompt of 1,615 tokens and three turns with 320-token replies. On 0.2.25 the second turn wrote its 1,792-token state (122.8 MB) and then the same state again as a shared prefix (115.7 MB), and the directory ended with two shared prefixes: the system prompt at 1,536 and that turn's own state. On the fix the second turn wrote only its state, and the system prompt stayed the only shared prefix. Prompt and output ids were identical on every turn, and the three turns wrote 526.4 MB against 642.1 MB.

**Why it happened.** Under aligned resume, the default since 0.2.22, the memory tier keeps each finished turn as a conversation entry holding its prompt and reply, but never continues it; the next turn resumes from the boundary checkpoint. The shared-prefix rule took the longest prefix the prompt had in common with any held state as a target, so the end of the previous reply became one. Once the reply crossed a pass boundary beyond what the turn reused, its save point was a pass end past that checkpoint: a second state when the new message crossed another boundary, otherwise the turn's own checkpoint, which 0.2.25's colliding-boundary upgrade ([[records/measurements/shared-prefix-live-acceptance-2026-09-24]]) rewrote with the shared flag. A shared prefix is never removed as a redundant ancestor, and a childless one is classed with states nobody continued, so each of these stayed until the quota or the age limit removed it, and a turn's latest state, once flagged, was the first candidate for eviction. In this run the second prompt matched the first prompt and all 320 reply tokens; the held entry ends one token earlier, because the last sampled token is never consumed.

**The rule now.** A target counts only where the prompt parts from what another held state read as input. A state it extends outright, or parts from inside the reply that state generated, is its own conversation's earlier turn. The memory tier records where a conversation entry's prompt ended; disk heads under aligned resume hold prompt tokens only. The system prompt boundary is unchanged.

**The existing gate did not reach the case.** `Tools/shared_prefix_e2e.py` passed on both builds with 320-token replies: its later turns ran after a restart, or after another conversation had evicted the entry. `Tools/prefix_turn_writes_e2e.py` keeps three turns in one process and exits 2 unless a later prompt reaches the old save point; on 0.2.25 it fails two of its four checks.

**Limits.** One 48 GB M5 Pro in ordinary use, one plan (`--memory-gb 10`, 256-token passes), one prompt shape and the Ollama chat endpoint. Timings are incidental and not a claim. A client that sends a reply back changed was not exercised live; the rule for it is covered by `optimization-prefix-client-capacity`.
