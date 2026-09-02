---
type: measurement
id: 01m1hhwm7smhepffj3xct9he81
created: 2026-09-02T17:15:26.329115+00:00
updated: 2026-09-02T17:15:26.329115+00:00
summary: The accept curve — measured, previously unpublished anywhere
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M9
order: '450'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The accept curve — measured, previously unpublished anywhere
status: measured
---

`slotstream mtp-accept` runs plain greedy decode and, at every position,
chains the draft head then rolls it back, scoring drafts against the tokens
the model actually produced. Four prompts (prose, code, list, arithmetic),
96 tokens each, 380 scored positions:

| chain depth | prefix accept | E[tokens/round] | fetch-free ceiling |
|---|---:|---:|---:|
| 1 | **85.8%** | 1.86 | ×1.37 |
| 2 | 71.0% | 2.57 | **×1.48** |
| 3 | 53.8% | 3.11 | ×1.43 |
| 4 | 41.3% | 3.52 | ×1.38 |

The head predicts the model's next-next token at 85.8%. The last column is
the round arithmetic with the pass costs `mtp-passcost` measured (below): a
k-token verify costs about 1 + 0.16k single passes, a rebuild likewise, a
draft step 0.05, so it is the speedup with every expert resident, and no
real cache reaches it. The 0.2.0 version of this table assumed the verify
pass was free and read ×1.52–1.96.
