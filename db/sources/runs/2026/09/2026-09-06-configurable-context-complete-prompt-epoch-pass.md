---
type: run
id: 01m1w5yefhe5f598wpbyk6jpd6
created: 2026-09-06T20:18:21.809095+00:00
updated: 2026-09-06T20:18:21.984542+00:00
summary: Complete prompt MTP and vision reuse passes with one arithmetic epoch
binary: ee9f87581d78a7df38f18748556ebbf8587224df5b093017b0f8dba629e217ad
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete prompt MTP and vision reuse passes with one arithmetic epoch
tool: Native Swift diagnostics and Python CLI gates
---
# Complete-prompt cache identity and lifecycle

A fresh independent source review found that Generator explicitly created
checkpoint keys with arithmetic epoch1 while other package callers defaulted
to epoch0. This could make a valid ownership/root lookup fail in the existing
complete-prompt fixture. The correction centralizes the current epoch in the
key type and its initializer, removes Generator's duplicate literal and adds
explicit old-epoch rejection in both weight-free and native checks.

The identified build19 native complete-prompt-mtp fixture passes all281
assertions. It covers exact cold/cached output and continued state, repeated
complete hits without prefill, sampled output, output allowance/EOS/caller
cancellation, bounded ownership, wrong model/schedule/draft/arithmetic keys,
small and boundary prompt sizes, and vision prompt reuse/changed-pixel refusal.
The optional complete-prompt optimization remains disabled by default. Its
correctness pass is not activation, a performance claim or long-window
capacity evidence.

Command: slotstream optimization-state-check --variant complete-prompt-mtp --json.
The fixture uses one bounded640-slot model, the real MTP head and vision tower,
a real13GBreclaimable preflight, shared model lock and650-second timeout.
All overlapping timing/capacity is excluded. The complete build/consumer/native
batch exited; nonblocking lock acquisition and a process audit confirmed the
slot free before it was explicitly returned to the other source owner.

## Frozen build identity

```json
{
  "binary_sha256": "ee9f87581d78a7df38f18748556ebbf8587224df5b093017b0f8dba629e217ad",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "d47f3059f298de5e82261882e6b49485ea20ecaf3e2ef6ce41ddc360c9a5bceb"
}
```

## complete-prompt-mtp-19/stdout.txt

SHA-256 `e38cfb2e9e447c9ef460785ec1c071e777ac4ea459f9d9f7ee331f6c7a769858`; 26230 bytes.

````text
{
  "items" : [
    {
      "name" : "complete prompt remains default off",
      "passed" : true
    },
    {
      "name" : "explicit complete prompt option",
      "passed" : true
    },
    {
      "name" : "17\/image=nil: reference completes",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: completes",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: complete hits",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: prefill tokens",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: reused tokens",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: retained prompts",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/0: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: completes",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: complete hits",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: prefill tokens",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: reused tokens",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: retained prompts",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: no prefill records",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: no prefill passes",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: tower skipped",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/1: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: completes",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: complete hits",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: prefill tokens",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: reused tokens",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: retained prompts",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: no prefill records",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: no prefill passes",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: tower skipped",
      "passed" : true
    },
    {
      "name" : "17\/image=nil\/2: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "17\/image=nil: public API remains strictly extend-only",
      "passed" : true
    },
    {
      "name" : "sample false\/7: exact output",
      "passed" : true
    },
    {
      "name" : "sample false\/7: complete hit",
      "passed" : true
    },
    {
      "name" : "sample false\/7046029254386353130: exact output",
      "passed" : true
    },
    {
      "name" : "sample false\/7046029254386353130: complete hit",
      "passed" : true
    },
    {
      "name" : "sample true\/7: exact output",
      "passed" : true
    },
    {
      "name" : "sample true\/7: complete hit",
      "passed" : true
    },
    {
      "name" : "sample true\/7046029254386353130: exact output",
      "passed" : true
    },
    {
      "name" : "sample true\/7046029254386353130: complete hit",
      "passed" : true
    },
    {
      "name" : "limit 1: exact output count",
      "passed" : true
    },
    {
      "name" : "limit 1: complete hit",
      "passed" : true
    },
    {
      "name" : "cancel before first output is empty",
      "passed" : true
    },
    {
      "name" : "zero-emission cancellation reuses complete prompt",
      "passed" : true
    },
    {
      "name" : "EOS stops without output",
      "passed" : true
    },
    {
      "name" : "callback cancellation preserves exact prefix",
      "passed" : true
    },
    {
      "name" : "cancelled request preserves root",
      "passed" : true
    },
    {
      "name" : "retry avoids prefill",
      "passed" : true
    },
    {
      "name" : "wrong model, schedule, draft or arithmetic identity refuses complete hit",
      "passed" : true
    },
    {
      "name" : "wrong model, schedule, draft or arithmetic identity refuses complete hit",
      "passed" : true
    },
    {
      "name" : "wrong model, schedule, draft or arithmetic identity refuses complete hit",
      "passed" : true
    },
    {
      "name" : "wrong model, schedule, draft or arithmetic identity refuses complete hit",
      "passed" : true
    },
    {
      "name" : "logits charged at budget 0",
      "passed" : true
    },
    {
      "name" : "exact charged capacity at budget 0",
      "passed" : true
    },
    {
      "name" : "logits charged at budget 1129",
      "passed" : true
    },
    {
      "name" : "exact charged capacity at budget 1129",
      "passed" : true
    },
    {
      "name" : "logits charged at budget 2257",
      "passed" : true
    },
    {
      "name" : "exact charged capacity at budget 2257",
      "passed" : true
    },
    {
      "name" : "logits charged at budget 2258",
      "passed" : true
    },
    {
      "name" : "exact charged capacity at budget 2258",
      "passed" : true
    },
    {
      "name" : "ownership checkpoint stored",
      "passed" : true
    },
    {
      "name" : "producer logit context cannot mutate retained row",
      "passed" : true
    },
    {
      "name" : "returned logit context cannot mutate retained row",
      "passed" : true
    },
    {
      "name" : "malformed logits rejected",
      "passed" : true
    },
    {
      "name" : "invalid logits preserve existing checkpoint",
      "passed" : true
    },
    {
      "name" : "pressure releases state and logits",
      "passed" : true
    },
    {
      "name" : "pressure preserves borrowed active state",
      "passed" : true
    },
    {
      "name" : "decode read fault fires after complete reuse",
      "passed" : true
    },
    {
      "name" : "failed decode reused the prompt",
      "passed" : true
    },
    {
      "name" : "decode failure preserves exact reusable root",
      "passed" : true
    },
    {
      "name" : "read-failure retry avoids prefill",
      "passed" : true
    },
    {
      "name" : "edited token misses",
      "passed" : true
    },
    {
      "name" : "auxiliary completes",
      "passed" : true
    },
    {
      "name" : "interleaved output remains exact",
      "passed" : true
    },
    {
      "name" : "charged capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "255\/image=nil: reference completes",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: completes",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: complete hits",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: prefill tokens",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: reused tokens",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: retained prompts",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/0: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: completes",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: complete hits",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: prefill tokens",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: reused tokens",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: retained prompts",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: no prefill records",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: no prefill passes",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: tower skipped",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/1: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: completes",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: complete hits",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: prefill tokens",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: reused tokens",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: retained prompts",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: no prefill records",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: no prefill passes",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: tower skipped",
      "passed" : true
    },
    {
      "name" : "255\/image=nil\/2: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "255\/image=nil: public API remains strictly extend-only",
      "passed" : true
    },
    {
      "name" : "256\/image=nil: reference completes",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: completes",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: complete hits",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: prefill tokens",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: reused tokens",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: retained prompts",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/0: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: completes",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: complete hits",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: prefill tokens",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: reused tokens",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: retained prompts",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: no prefill records",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: no prefill passes",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: tower skipped",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/1: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: completes",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: complete hits",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: prefill tokens",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: reused tokens",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: retained prompts",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: no prefill records",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: no prefill passes",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: tower skipped",
      "passed" : true
    },
    {
      "name" : "256\/image=nil\/2: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "256\/image=nil: public API remains strictly extend-only",
      "passed" : true
    },
    {
      "name" : "257\/image=nil: reference completes",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: completes",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: complete hits",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: prefill tokens",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: reused tokens",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: retained prompts",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/0: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: completes",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: complete hits",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: prefill tokens",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: reused tokens",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: retained prompts",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: no prefill records",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: no prefill passes",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: tower skipped",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/1: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: completes",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: complete hits",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: prefill tokens",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: reused tokens",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: retained prompts",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: no prefill records",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: no prefill passes",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: tower skipped",
      "passed" : true
    },
    {
      "name" : "257\/image=nil\/2: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "257\/image=nil: public API remains strictly extend-only",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil: reference completes",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: completes",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: complete hits",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: prefill tokens",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: reused tokens",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: retained prompts",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/0: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: completes",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: complete hits",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: prefill tokens",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: reused tokens",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: retained prompts",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: no prefill records",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: no prefill passes",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: tower skipped",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/1: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: completes",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: complete hits",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: prefill tokens",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: reused tokens",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: retained prompts",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: no prefill records",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: no prefill passes",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: tower skipped",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil\/2: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "1025\/image=nil: public API remains strictly extend-only",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1): reference completes",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: completes",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: complete hits",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: prefill tokens",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: reused tokens",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: retained prompts",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/0: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: completes",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: complete hits",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: prefill tokens",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: reused tokens",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: retained prompts",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: no prefill records",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: no prefill passes",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: tower skipped",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/1: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: completes",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: complete hits",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: prefill tokens",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: reused tokens",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: retained prompts",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: no prefill records",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: no prefill passes",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: tower skipped",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1)\/2: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1): public API remains strictly extend-only",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1): changed pixels refuse reuse",
      "passed" : true
    },
    {
      "name" : "273\/image=Optional(1): changed pixels rebuild prompt",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224): reference completes",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: completes",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: complete hits",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: prefill tokens",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: reused tokens",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: retained prompts",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/0: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: completes",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: complete hits",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: prefill tokens",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: reused tokens",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: retained prompts",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: no prefill records",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: no prefill passes",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: tower skipped",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/1: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: completes",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: complete hits",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: prefill tokens",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: reused tokens",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: retained prompts",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: checkpoint errors",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: no prefill records",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: no prefill passes",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: tower skipped",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224)\/2: all state and continued logits exact",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224): public API remains strictly extend-only",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224): changed pixels refuse reuse",
      "passed" : true
    },
    {
      "name" : "337\/image=Optional(224): changed pixels rebuild prompt",
      "passed" : true
    },
    {
      "name" : "draft transition seed succeeds",
      "passed" : true
    },
    {
      "name" : "plain cached state finishes current request plain",
      "passed" : true
    },
    {
      "name" : "plain-to-draft transition really reused state",
      "passed" : true
    },
    {
      "name" : "complete prompt with missing head is not an MTP hit",
      "passed" : true
    },
    {
      "name" : "missing draft head is rebuilt from the full prompt",
      "passed" : true
    },
    {
      "name" : "rebuilt draft participates",
      "passed" : true
    },
    {
      "name" : "rebuilt draft checkpoint can be reused completely",
      "passed" : true
    },
    {
      "name" : "reused draft output is exact",
      "passed" : true
    }
  ],
  "measurements" : {
    "end_physical_bytes" : 8230917496
  },
  "name" : "optimization-complete-prompt-mtp",
  "passed" : true
}

````

## complete-prompt-mtp-19/stderr.txt

SHA-256 `cf4316e6a476f8f011c0776b6e9f19e560149db722e492ca2e8509086708b767`; 228 bytes.

````text
complete prompt 17/image=nil
complete prompt 255/image=nil
complete prompt 256/image=nil
complete prompt 257/image=nil
complete prompt 1025/image=nil
complete prompt 273/image=Optional(1)
complete prompt 337/image=Optional(224)

````
