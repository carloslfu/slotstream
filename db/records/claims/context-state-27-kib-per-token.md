---
type: claim
id: 01m1hhwpaps94sj3hyen5p1r03
created: 2026-09-02T17:15:28.470475+00:00
updated: 2026-09-13T14:48:38.826212+00:00
summary: Main sequence-cache capacity costs about 27 KiB per allocated token
basis: measured
gate: none
needle: 27 KiB
supported_by:
- '[[records/measurements/closing-the-three-deferred-gaps-2026-08-29-0-1-5]]'
surfaces: docs/CLI.md, docs/ENGINEERING.md
title: Main sequence-cache capacity costs about 27 KiB per allocated token
status: current
---

KV plus indexer state per token, measured while closing the QSA indexer gap on 2026-08-29; the N1 design note uses the same figure to charge a held conversation.

## Scope audit, 2026-09-13

The 27 KiB figure covers main sequence capacity per allocated token,
rounded to ContextGeometry allocation steps. It excludes recurrent state,
retained conversations, the draft layer and transient workspace; the complete
ContextMemoryLedger charges them separately. It is not total process memory
per prompt token.
