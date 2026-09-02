---
type: run
id: 01m1htchag7fngc5m2qy7fnf0w
created: 2026-09-02T19:43:56.240301+00:00
updated: 2026-09-02T19:43:56.240301+00:00
summary: sweep-check transcripts on the final code, dev Mac, 2026-09-02
binary: 'sweep: local release builds (the recycler experiment build, then the shipped code)'
captured_at: 2026-09-02
command: slotstream sweep-check
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: sweep-check transcripts on the final code, dev Mac, 2026-09-02
tool: sweep-check
---
## n2c_sweepcheck.log

```
=== sweep-check n2c 13:53:54 ===
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  sweep on a cold pool, run twice: identical
  sweep vs pool path: 3.320% of logit spread (prefill-rechunk control 5.089%, bound 15.268%), top-1 same
  sweep whole vs sweep in 256-token passes: 3.145% of spread
  sweep on the warm pool (638 experts copied out of it): identical to the cold sweep
  after a generate that admitted the prompt's hot experts (prefill 549 tokens): pool path identical, sweep identical
SWEEP CHECK PASS: deterministic; 3.320% of spread vs the pool path inside the 15.268% prefill-rechunk bound; identical on a cold and a warm pool; admission leaves the pool consistent
rc=0
```

## n2d_sweepcheck.log

```
=== sweep-check final 14:18:03 ===
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  sweep on a cold pool, run twice: identical
  sweep vs pool path: 3.320% of logit spread (prefill-rechunk control 5.089%, bound 15.268%), top-1 same
  sweep whole vs sweep in 256-token passes: 3.145% of spread
  sweep on the warm pool (638 experts copied out of it): identical to the cold sweep
  after a generate that admitted the prompt's hot experts (prefill 549 tokens): pool path identical, sweep identical
SWEEP CHECK PASS: deterministic; 3.320% of spread vs the pool path inside the 15.268% prefill-rechunk bound; identical on a cold and a warm pool; admission leaves the pool consistent
rc=0
```

