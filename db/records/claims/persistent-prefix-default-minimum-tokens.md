---
type: claim
id: 01m2g3jmmaftawmrzjmy0hqryj
created: 2026-09-14T14:01:46.378812+00:00
updated: 2026-09-24T19:28:14.428838+00:00
summary: The persistent prefix cache writes states of 1024 tokens or more by default
basis: derived
gate: slotstream-checks --tier t0 --filter persistent-prefix-policy
needle: Shortest state written to `--prefix-cache-dir` (default 1024 tokens)
supported_by:
- '[[records/measurements/persistent-prefix-cache-2026-09-14]]'
- '[[records/measurements/prefix-cache-floor-community-2026-09-16]]'
surfaces: docs/CLI.md
title: The persistent prefix cache writes states of 1024 tokens or more by default
status: current
---
The code-defined opt-in default for `serve --prefix-cache-min-tokens` is 1024 tokens. `PersistentPrefixConfiguration.defaultMinimumTokens` owns the value and the CLI help interpolates it; `persistent-prefix-policy` pins it. The servers `slotstream launch` starts and the development Mac app use the same default. Every write stores the fixed recurrent arrays, and a conversation's first write also stores every cached row, so shorter conversations are not written by default. The same minimum applies to a shared prefix, the head other conversations start with, written inside a prompt; a shorter one is still kept in memory. The default was 2048 until 2026-09-24: [[records/measurements/prefix-cache-floor-community-2026-09-16]] measured a 1,919-token conversation that reused 0 tokens after a restart at 2048 and 1,966 at 1024, with prefill falling from 45.5 s to 6.0 s. 1024 is that measured value, not a break-even: [[records/design/measured-operating-policies]] states the tradeoff and its revision criterion, and [[records/measurements/persistent-prefix-cache-2026-09-14]] records measured save and restore costs at 2051, about 3,900 and about 15,700 tokens.
