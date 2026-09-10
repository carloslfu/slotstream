---
type: run
id: 01m1vn443gq5yp4a7eqhttyx3j
created: 2026-09-06T15:24:22.000499+00:00
updated: 2026-09-06T15:24:55.908669+00:00
summary: Small-pass grouped successor and first-divergence diagnosis
binary: Frozen builds 7 and 9; source archives retained
captured_at: 2026-09-06
command: Exact variant commands and identities below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Small-pass grouped successor and first-divergence diagnosis
tool: Native Swift diagnostics
---
# Grouped small-pass successor and first-divergence diagnosis

The grouped expert path is a partial correction, not a qualified context
implementation. Build 7 keeps the frozen 515 inputs, 256/512 controls,
64/repeated-64 candidate, state/logit band, continuation, and rollback cases.
240 of 1604 assertions still fail. The earlier counterexample remains at
[[sources/runs/2026/09/2026-09-06-configurable-context-small-pass-counterexample]].
No tolerance was changed. The 128 and long-capacity gates have not run.

Build 9 is a separate four-layer mechanistic probe. It preserves the same
515 inputs and compares every observed intermediate tensor; its finite-value
assertions are instrumentation checks, not numerical qualification. Inputs,
attention, and injections in layer zero are exact across the three schedules.
Its expert output is the first differing stage; subsequent layers amplify the
difference. This directs a prospective routing-shape control and separate
shared/routed observations. That successor keeps real attention rows bounded
and does not change the frozen full-model acceptance criteria.

The local transport build overlapped part of the short mechanistic probe.
All observations here are diagnostic correctness evidence only. Timings and
capacity conclusions are excluded regardless of VM counters. Exact original
stdout/stderr bytes and portable process observations are retained below.
The source archives are reconstructible source closures, not release builds.

## small64-swept-7/stdout.txt

SHA-256 `89a810a114513f44a7a4a7560a78a3d8cbbad5beba5c535f5bd422bd25512690`; 239557 bytes.

````text
{
  "items" : [
    {
      "name" : "arm0: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm0: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm0: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "arm1: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm1: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm1: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "arm2: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm2: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm2: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "arm3: requested grouped small-pass dispatch",
      "passed" : true
    },
    {
      "name" : "arm3: correct absolute token count",
      "passed" : true
    },
    {
      "name" : "arm3: no pins survive dispatch",
      "passed" : true
    },
    {
      "name" : "identical small-pass routing on repeat",
      "passed" : true
    },
    {
      "name" : "identical small-pass logits on repeat",
      "passed" : true
    },
    {
      "name" : "prefill.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill: greedy final token",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic field names",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: control fields",
      "passed" : true
    },
    {
      "name" : "prefill: candidate fields",
      "passed" : true
    },
    {
      "name" : "prefill.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.index.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.index.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.key.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill: exact ngram",
      "passed" : true
    },
    {
      "name" : "prefill.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.21: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.44: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill: exact tokens",
      "passed" : true
    },
    {
      "name" : "prefill.value.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.value.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "route keep sets inside existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: control fields",
      "passed" : true
    },
    {
      "name" : "continued-907: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.index.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.index.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.key.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-907.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.16: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.20: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.44: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-907.value.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.value.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: control fields",
      "passed" : true
    },
    {
      "name" : "continued-1337: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.index.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.index.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.key.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.value.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 643, want 367",
      "name" : "continued-2103: greedy final token",
      "passed" : false
    },
    {
      "name" : "continued-2103: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: control fields",
      "passed" : true
    },
    {
      "name" : "continued-2103: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.14: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.index.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.index.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.key.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.44: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.value.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 907, want 31921",
      "name" : "rollback-1: greedy final token",
      "passed" : false
    },
    {
      "name" : "rollback-1: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-1: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.14: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.key.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.14: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.18: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.44: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.value.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2: greedy final token",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-2: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.14: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.17: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.20: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.key.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.18: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.20: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.44: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.value.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3: greedy final token",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-3: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.key.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.2: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.4: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.44: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.5: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.11: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.value.15: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.3: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.39: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.7: existing rechunk band",
      "passed" : false
    }
  ],
  "measurements" : {
    "arm0.allocated_bytes" : 28311552,
    "arm0.chunk" : 256,
    "arm0.read_records" : 17679,
    "arm0.seconds" : 5.788881708,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 28311552,
    "arm1.chunk" : 512,
    "arm1.read_records" : 10438,
    "arm1.seconds" : 3.300318166,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 28311552,
    "arm2.chunk" : 64,
    "arm2.read_records" : 36232,
    "arm2.seconds" : 10.975935541,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 28311552,
    "arm3.chunk" : 64,
    "arm3.read_records" : 36199,
    "arm3.seconds" : 10.96204875,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0.01181592047214508,
    "continued-1337.conv.10.control" : 0,
    "continued-1337.conv.12.candidate" : 0.011312217451632023,
    "continued-1337.conv.12.control" : 0,
    "continued-1337.conv.13.candidate" : 0.014044944196939468,
    "continued-1337.conv.13.control" : 0,
    "continued-1337.conv.14.candidate" : 0.015468750149011612,
    "continued-1337.conv.14.control" : 0.005625000223517418,
    "continued-1337.conv.16.candidate" : 0.014778325334191322,
    "continued-1337.conv.16.control" : 0.01681804098188877,
    "continued-1337.conv.17.candidate" : 0.015046296641230583,
    "continued-1337.conv.17.control" : 0.011574073694646358,
    "continued-1337.conv.18.candidate" : 0.02202984318137169,
    "continued-1337.conv.18.control" : 0.009009009227156639,
    "continued-1337.conv.2.candidate" : 0.010667067021131516,
    "continued-1337.conv.2.control" : 0,
    "continued-1337.conv.20.candidate" : 0.029487179592251778,
    "continued-1337.conv.20.control" : 0.025641025975346565,
    "continued-1337.conv.21.candidate" : 0.02570093423128128,
    "continued-1337.conv.21.control" : 0.014018691144883633,
    "continued-1337.conv.22.candidate" : 0.01227678544819355,
    "continued-1337.conv.22.control" : 0.010714286006987095,
    "continued-1337.conv.24.candidate" : 0.02747252769768238,
    "continued-1337.conv.24.control" : 0.03365384787321091,
    "continued-1337.conv.25.candidate" : 0.02233714796602726,
    "continued-1337.conv.25.control" : 0.028682511299848557,
    "continued-1337.conv.26.candidate" : 0.03468899428844452,
    "continued-1337.conv.26.control" : 0.04904306307435036,
    "continued-1337.conv.28.candidate" : 0.03731343150138855,
    "continued-1337.conv.28.control" : 0.03684701398015022,
    "continued-1337.conv.29.candidate" : 0.0899122804403305,
    "continued-1337.conv.29.control" : 0.05847953259944916,
    "continued-1337.conv.30.candidate" : 0.10076530277729034,
    "continued-1337.conv.30.control" : 0.07780612260103226,
    "continued-1337.conv.32.candidate" : 0.09059697389602661,
    "continued-1337.conv.32.control" : 0.08127802610397339,
    "continued-1337.conv.33.candidate" : 0.083587646484375,
    "continued-1337.conv.33.control" : 0.0654296875,
    "continued-1337.conv.34.candidate" : 0.11181434243917465,
    "continued-1337.conv.34.control" : 0.07489451766014099,
    "continued-1337.conv.36.candidate" : 0.07389162480831146,
    "continued-1337.conv.36.control" : 0.09852216392755508,
    "continued-1337.conv.37.candidate" : 0.06221846863627434,
    "continued-1337.conv.37.control" : 0.05067567527294159,
    "continued-1337.conv.38.candidate" : 0.05744485184550285,
    "continued-1337.conv.38.control" : 0.04117647185921669,
    "continued-1337.conv.4.candidate" : 0.009654471650719643,
    "continued-1337.conv.4.control" : 0,
    "continued-1337.conv.40.candidate" : 0.0803571417927742,
    "continued-1337.conv.40.control" : 0.0714285746216774,
    "continued-1337.conv.41.candidate" : 0.0791015625,
    "continued-1337.conv.41.control" : 0.05059814453125,
    "continued-1337.conv.42.candidate" : 0.06377550959587097,
    "continued-1337.conv.42.control" : 0.05782312899827957,
    "continued-1337.conv.44.candidate" : 0.0711326003074646,
    "continued-1337.conv.44.control" : 0.10220994800329208,
    "continued-1337.conv.45.candidate" : 0.07453547418117523,
    "continued-1337.conv.45.control" : 0.051309119910001755,
    "continued-1337.conv.46.candidate" : 0.0892857164144516,
    "continued-1337.conv.46.control" : 0.1116071417927742,
    "continued-1337.conv.5.candidate" : 0.012820512987673283,
    "continued-1337.conv.5.control" : 0,
    "continued-1337.conv.6.candidate" : 0.011150234378874302,
    "continued-1337.conv.6.control" : 0,
    "continued-1337.conv.8.candidate" : 0.013349514454603195,
    "continued-1337.conv.8.control" : 0,
    "continued-1337.conv.9.candidate" : 0.01662234030663967,
    "continued-1337.conv.9.control" : 0,
    "continued-1337.index.11.candidate" : 0.03375771641731262,
    "continued-1337.index.11.control" : 0,
    "continued-1337.index.15.candidate" : 0.060393258929252625,
    "continued-1337.index.15.control" : 0.01755617931485176,
    "continued-1337.index.19.candidate" : 0.052226025611162186,
    "continued-1337.index.19.control" : 0.027397260069847107,
    "continued-1337.index.23.candidate" : 0.03169642761349678,
    "continued-1337.index.23.control" : 0.02276785671710968,
    "continued-1337.index.27.candidate" : 0.048344679176807404,
    "continued-1337.index.27.control" : 0.037128712981939316,
    "continued-1337.index.3.candidate" : 0.039016272872686386,
    "continued-1337.index.3.control" : 0,
    "continued-1337.index.31.candidate" : 0.16480809450149536,
    "continued-1337.index.31.control" : 0.19605809450149536,
    "continued-1337.index.35.candidate" : 0.15728476643562317,
    "continued-1337.index.35.control" : 0.11423841118812561,
    "continued-1337.index.39.candidate" : 0.3734177350997925,
    "continued-1337.index.39.control" : 0.04628164693713188,
    "continued-1337.index.43.candidate" : 0.20000000298023224,
    "continued-1337.index.43.control" : 0.04707031324505806,
    "continued-1337.index.47.candidate" : 0.14541666209697723,
    "continued-1337.index.47.control" : 0.10187499970197678,
    "continued-1337.index.7.candidate" : 0.0380859375,
    "continued-1337.index.7.control" : 0,
    "continued-1337.key.11.candidate" : 0.09807692468166351,
    "continued-1337.key.11.control" : 0,
    "continued-1337.key.15.candidate" : 0.08211679011583328,
    "continued-1337.key.15.control" : 0.031934306025505066,
    "continued-1337.key.19.candidate" : 0.11603008955717087,
    "continued-1337.key.19.control" : 0.05613425746560097,
    "continued-1337.key.23.candidate" : 0.07281249761581421,
    "continued-1337.key.23.control" : 0.06541666388511658,
    "continued-1337.key.27.candidate" : 0.12828947603702545,
    "continued-1337.key.27.control" : 0.10896381735801697,
    "continued-1337.key.3.candidate" : 0.06392766535282135,
    "continued-1337.key.3.control" : 0,
    "continued-1337.key.31.candidate" : 0.17743287980556488,
    "continued-1337.key.31.control" : 0.14901426434516907,
    "continued-1337.key.35.candidate" : 0.20423229038715363,
    "continued-1337.key.35.control" : 0.16338582336902618,
    "continued-1337.key.39.candidate" : 0.34687501192092896,
    "continued-1337.key.39.control" : 0.08671875298023224,
    "continued-1337.key.43.candidate" : 0.13605442643165588,
    "continued-1337.key.43.control" : 0.07823128998279572,
    "continued-1337.key.47.candidate" : 0.17078189551830292,
    "continued-1337.key.47.control" : 0.09786522388458252,
    "continued-1337.key.7.candidate" : 0.08842329680919647,
    "continued-1337.key.7.control" : 0,
    "continued-1337.logits.candidate" : 0.07884837687015533,
    "continued-1337.logits.control" : 0.10532407462596893,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0.00021958051365800202,
    "continued-1337.ssm.1.control" : 0,
    "continued-1337.ssm.10.candidate" : 0.031225087121129036,
    "continued-1337.ssm.10.control" : 0,
    "continued-1337.ssm.12.candidate" : 0.0028917426243424416,
    "continued-1337.ssm.12.control" : 0,
    "continued-1337.ssm.13.candidate" : 0.01410988811403513,
    "continued-1337.ssm.13.control" : 0.00026312010595574975,
    "continued-1337.ssm.14.candidate" : 0.008541448041796684,
    "continued-1337.ssm.14.control" : 0.0042149461805820465,
    "continued-1337.ssm.16.candidate" : 0.03794652223587036,
    "continued-1337.ssm.16.control" : 0.013277687132358551,
    "continued-1337.ssm.17.candidate" : 0.022290894761681557,
    "continued-1337.ssm.17.control" : 0.012733696959912777,
    "continued-1337.ssm.18.candidate" : 0.017240766435861588,
    "continued-1337.ssm.18.control" : 0.014517116360366344,
    "continued-1337.ssm.2.candidate" : 0.007079394068568945,
    "continued-1337.ssm.2.control" : 0,
    "continued-1337.ssm.20.candidate" : 0.019210167229175568,
    "continued-1337.ssm.20.control" : 0.008949542418122292,
    "continued-1337.ssm.21.candidate" : 0.012440584599971771,
    "continued-1337.ssm.21.control" : 0.008825146593153477,
    "continued-1337.ssm.22.candidate" : 0.01064686942845583,
    "continued-1337.ssm.22.control" : 0.005606972612440586,
    "continued-1337.ssm.24.candidate" : 0.02907588519155979,
    "continued-1337.ssm.24.control" : 0.030068622902035713,
    "continued-1337.ssm.25.candidate" : 0.027527814731001854,
    "continued-1337.ssm.25.control" : 0.03369494900107384,
    "continued-1337.ssm.26.candidate" : 0.06002170965075493,
    "continued-1337.ssm.26.control" : 0.16198740899562836,
    "continued-1337.ssm.28.candidate" : 0.011955301277339458,
    "continued-1337.ssm.28.control" : 0.004970375914126635,
    "continued-1337.ssm.29.candidate" : 0.05323603376746178,
    "continued-1337.ssm.29.control" : 0.04375261068344116,
    "continued-1337.ssm.30.candidate" : 0.05621454492211342,
    "continued-1337.ssm.30.control" : 0.09145420044660568,
    "continued-1337.ssm.32.candidate" : 0.08832743763923645,
    "continued-1337.ssm.32.control" : 0.0503963828086853,
    "continued-1337.ssm.33.candidate" : 0.11017055809497833,
    "continued-1337.ssm.33.control" : 0.1020117849111557,
    "continued-1337.ssm.34.candidate" : 0.08493936061859131,
    "continued-1337.ssm.34.control" : 0.06148255616426468,
    "continued-1337.ssm.36.candidate" : 0.04928958788514137,
    "continued-1337.ssm.36.control" : 0.0531274639070034,
    "continued-1337.ssm.37.candidate" : 0.05259972810745239,
    "continued-1337.ssm.37.control" : 0.04999849572777748,
    "continued-1337.ssm.38.candidate" : 0.036320097744464874,
    "continued-1337.ssm.38.control" : 0.014088941738009453,
    "continued-1337.ssm.4.candidate" : 0.01120811328291893,
    "continued-1337.ssm.4.control" : 0,
    "continued-1337.ssm.40.candidate" : 0.02686166577041149,
    "continued-1337.ssm.40.control" : 0.015454727225005627,
    "continued-1337.ssm.41.candidate" : 0.04223446547985077,
    "continued-1337.ssm.41.control" : 0.016492173075675964,
    "continued-1337.ssm.42.candidate" : 0.03137180209159851,
    "continued-1337.ssm.42.control" : 0.02904917486011982,
    "continued-1337.ssm.44.candidate" : 0.05598854273557663,
    "continued-1337.ssm.44.control" : 0.022203821688890457,
    "continued-1337.ssm.45.candidate" : 0.1631925106048584,
    "continued-1337.ssm.45.control" : 0.16785705089569092,
    "continued-1337.ssm.46.candidate" : 0.1418035477399826,
    "continued-1337.ssm.46.control" : 0.22480647265911102,
    "continued-1337.ssm.5.candidate" : 0.010998101904988289,
    "continued-1337.ssm.5.control" : 0,
    "continued-1337.ssm.6.candidate" : 0.01284958329051733,
    "continued-1337.ssm.6.control" : 0,
    "continued-1337.ssm.8.candidate" : 0.011619274504482746,
    "continued-1337.ssm.8.control" : 0,
    "continued-1337.ssm.9.candidate" : 0.036190953105688095,
    "continued-1337.ssm.9.control" : 0,
    "continued-1337.value.11.candidate" : 0.02675359696149826,
    "continued-1337.value.11.control" : 0,
    "continued-1337.value.15.candidate" : 0.02838645502924919,
    "continued-1337.value.15.control" : 0.009213147684931755,
    "continued-1337.value.19.candidate" : 0.027551019564270973,
    "continued-1337.value.19.control" : 0.012519929558038712,
    "continued-1337.value.23.candidate" : 0.044186048209667206,
    "continued-1337.value.23.control" : 0.0417151153087616,
    "continued-1337.value.27.candidate" : 0.016348885372281075,
    "continued-1337.value.27.control" : 0.014546001330018044,
    "continued-1337.value.3.candidate" : 0.05281690135598183,
    "continued-1337.value.3.control" : 0,
    "continued-1337.value.31.candidate" : 0.07010869681835175,
    "continued-1337.value.31.control" : 0.072826087474823,
    "continued-1337.value.35.candidate" : 0.10009057819843292,
    "continued-1337.value.35.control" : 0.06159420311450958,
    "continued-1337.value.39.candidate" : 0.37142857909202576,
    "continued-1337.value.39.control" : 0.0494791679084301,
    "continued-1337.value.43.candidate" : 0.06839622557163239,
    "continued-1337.value.43.control" : 0.04088050499558449,
    "continued-1337.value.47.candidate" : 0.3460365831851959,
    "continued-1337.value.47.control" : 0.20636433362960815,
    "continued-1337.value.7.candidate" : 0.025542665272951126,
    "continued-1337.value.7.control" : 0,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0.019567757844924927,
    "continued-2103.conv.10.control" : 0,
    "continued-2103.conv.12.candidate" : 0.02666666731238365,
    "continued-2103.conv.12.control" : 0,
    "continued-2103.conv.13.candidate" : 0.03961748629808426,
    "continued-2103.conv.13.control" : 0,
    "continued-2103.conv.14.candidate" : 0.027499999850988388,
    "continued-2103.conv.14.control" : 0.004999999888241291,
    "continued-2103.conv.16.candidate" : 0.03201970458030701,
    "continued-2103.conv.16.control" : 0.01681804098188877,
    "continued-2103.conv.17.candidate" : 0.048076923936605453,
    "continued-2103.conv.17.control" : 0.012019230984151363,
    "continued-2103.conv.18.candidate" : 0.037162162363529205,
    "continued-2103.conv.18.control" : 0.015343468636274338,
    "continued-2103.conv.2.candidate" : 0.010224654339253902,
    "continued-2103.conv.2.control" : 0,
    "continued-2103.conv.20.candidate" : 0.03831658139824867,
    "continued-2103.conv.20.control" : 0.015075377188622952,
    "continued-2103.conv.21.candidate" : 0.03387850522994995,
    "continued-2103.conv.21.control" : 0.014018691144883633,
    "continued-2103.conv.22.candidate" : 0.01584506966173649,
    "continued-2103.conv.22.control" : 0.011003521271049976,
    "continued-2103.conv.24.candidate" : 0.031058933585882187,
    "continued-2103.conv.24.control" : 0.03328804299235344,
    "continued-2103.conv.25.candidate" : 0.03109756112098694,
    "continued-2103.conv.25.control" : 0.029801828786730766,
    "continued-2103.conv.26.candidate" : 0.028761062771081924,
    "continued-2103.conv.26.control" : 0.04535398259758949,
    "continued-2103.conv.28.candidate" : 0.03731343150138855,
    "continued-2103.conv.28.control" : 0.03684701398015022,
    "continued-2103.conv.29.candidate" : 0.080078125,
    "continued-2103.conv.29.control" : 0.0520833320915699,
    "continued-2103.conv.30.candidate" : 0.08418367058038712,
    "continued-2103.conv.30.control" : 0.07397959381341934,
    "continued-2103.conv.32.candidate" : 0.06614349782466888,
    "continued-2103.conv.32.control" : 0.056334082037210464,
    "continued-2103.conv.33.candidate" : 0.055908203125,
    "continued-2103.conv.33.control" : 0.05731201171875,
    "continued-2103.conv.34.candidate" : 0.057587336748838425,
    "continued-2103.conv.34.control" : 0.07751091569662094,
    "continued-2103.conv.36.candidate" : 0.07389162480831146,
    "continued-2103.conv.36.control" : 0.09852216392755508,
    "continued-2103.conv.37.candidate" : 0.06424418836832047,
    "continued-2103.conv.37.control" : 0.05232558026909828,
    "continued-2103.conv.38.candidate" : 0.04518072307109833,
    "continued-2103.conv.38.control" : 0.04216867312788963,
    "continued-2103.conv.4.candidate" : 0.02705792710185051,
    "continued-2103.conv.4.control" : 0,
    "continued-2103.conv.40.candidate" : 0.07867132872343063,
    "continued-2103.conv.40.control" : 0.0699300691485405,
    "continued-2103.conv.41.candidate" : 0.0791015625,
    "continued-2103.conv.41.control" : 0.05059814453125,
    "continued-2103.conv.42.candidate" : 0.0625,
    "continued-2103.conv.42.control" : 0.05666666850447655,
    "continued-2103.conv.44.candidate" : 0.09322033822536469,
    "continued-2103.conv.44.control" : 0.10451977699995041,
    "continued-2103.conv.45.candidate" : 0.07453547418117523,
    "continued-2103.conv.45.control" : 0.051309119910001755,
    "continued-2103.conv.46.candidate" : 0.08620689809322357,
    "continued-2103.conv.46.control" : 0.10775861889123917,
    "continued-2103.conv.5.candidate" : 0.023404255509376526,
    "continued-2103.conv.5.control" : 0,
    "continued-2103.conv.6.candidate" : 0.01811913214623928,
    "continued-2103.conv.6.control" : 0,
    "continued-2103.conv.8.candidate" : 0.02123786322772503,
    "continued-2103.conv.8.control" : 0,
    "continued-2103.conv.9.candidate" : 0.02194148860871792,
    "continued-2103.conv.9.control" : 0,
    "continued-2103.index.11.candidate" : 0.03375771641731262,
    "continued-2103.index.11.control" : 0,
    "continued-2103.index.15.candidate" : 0.060393258929252625,
    "continued-2103.index.15.control" : 0.01755617931485176,
    "continued-2103.index.19.candidate" : 0.052226025611162186,
    "continued-2103.index.19.control" : 0.027397260069847107,
    "continued-2103.index.23.candidate" : 0.03169642761349678,
    "continued-2103.index.23.control" : 0.02276785671710968,
    "continued-2103.index.27.candidate" : 0.048344679176807404,
    "continued-2103.index.27.control" : 0.037128712981939316,
    "continued-2103.index.3.candidate" : 0.039016272872686386,
    "continued-2103.index.3.control" : 0,
    "continued-2103.index.31.candidate" : 0.16480809450149536,
    "continued-2103.index.31.control" : 0.19605809450149536,
    "continued-2103.index.35.candidate" : 0.15728476643562317,
    "continued-2103.index.35.control" : 0.11423841118812561,
    "continued-2103.index.39.candidate" : 0.3734177350997925,
    "continued-2103.index.39.control" : 0.04628164693713188,
    "continued-2103.index.43.candidate" : 0.20000000298023224,
    "continued-2103.index.43.control" : 0.04707031324505806,
    "continued-2103.index.47.candidate" : 0.14541666209697723,
    "continued-2103.index.47.control" : 0.10187499970197678,
    "continued-2103.index.7.candidate" : 0.0380859375,
    "continued-2103.index.7.control" : 0,
    "continued-2103.key.11.candidate" : 0.09807692468166351,
    "continued-2103.key.11.control" : 0,
    "continued-2103.key.15.candidate" : 0.08211679011583328,
    "continued-2103.key.15.control" : 0.031934306025505066,
    "continued-2103.key.19.candidate" : 0.11603008955717087,
    "continued-2103.key.19.control" : 0.05613425746560097,
    "continued-2103.key.23.candidate" : 0.07281249761581421,
    "continued-2103.key.23.control" : 0.06541666388511658,
    "continued-2103.key.27.candidate" : 0.12828947603702545,
    "continued-2103.key.27.control" : 0.10896381735801697,
    "continued-2103.key.3.candidate" : 0.06392766535282135,
    "continued-2103.key.3.control" : 0,
    "continued-2103.key.31.candidate" : 0.17743287980556488,
    "continued-2103.key.31.control" : 0.14901426434516907,
    "continued-2103.key.35.candidate" : 0.20423229038715363,
    "continued-2103.key.35.control" : 0.16338582336902618,
    "continued-2103.key.39.candidate" : 0.34687501192092896,
    "continued-2103.key.39.control" : 0.08671875298023224,
    "continued-2103.key.43.candidate" : 0.13605442643165588,
    "continued-2103.key.43.control" : 0.07823128998279572,
    "continued-2103.key.47.candidate" : 0.17078189551830292,
    "continued-2103.key.47.control" : 0.09786522388458252,
    "continued-2103.key.7.candidate" : 0.08842329680919647,
    "continued-2103.key.7.control" : 0,
    "continued-2103.logits.candidate" : 0.10318396240472794,
    "continued-2103.logits.control" : 0.09433962404727936,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0.0002193853579228744,
    "continued-2103.ssm.1.control" : 0,
    "continued-2103.ssm.10.candidate" : 0.029590656980872154,
    "continued-2103.ssm.10.control" : 0,
    "continued-2103.ssm.12.candidate" : 0.0028754468075931072,
    "continued-2103.ssm.12.control" : 0,
    "continued-2103.ssm.13.candidate" : 0.026600956916809082,
    "continued-2103.ssm.13.control" : 0.00027723138919100165,
    "continued-2103.ssm.14.candidate" : 0.008786622434854507,
    "continued-2103.ssm.14.control" : 0.002875519683584571,
    "continued-2103.ssm.16.candidate" : 0.02969190664589405,
    "continued-2103.ssm.16.control" : 0.01306831929832697,
    "continued-2103.ssm.17.candidate" : 0.08926254510879517,
    "continued-2103.ssm.17.control" : 0.012333724647760391,
    "continued-2103.ssm.18.candidate" : 0.03968982398509979,
    "continued-2103.ssm.18.control" : 0.026666244491934776,
    "continued-2103.ssm.2.candidate" : 0.007400659378618002,
    "continued-2103.ssm.2.control" : 0,
    "continued-2103.ssm.20.candidate" : 0.019073564559221268,
    "continued-2103.ssm.20.control" : 0.010438838973641396,
    "continued-2103.ssm.21.candidate" : 0.017389606684446335,
    "continued-2103.ssm.21.control" : 0.005878801923245192,
    "continued-2103.ssm.22.candidate" : 0.010662786662578583,
    "continued-2103.ssm.22.control" : 0.005343249067664146,
    "continued-2103.ssm.24.candidate" : 0.029102511703968048,
    "continued-2103.ssm.24.control" : 0.02550414949655533,
    "continued-2103.ssm.25.candidate" : 0.04461108148097992,
    "continued-2103.ssm.25.control" : 0.042839165776968,
    "continued-2103.ssm.26.candidate" : 0.035659562796354294,
    "continued-2103.ssm.26.control" : 0.07313300669193268,
    "continued-2103.ssm.28.candidate" : 0.006407948210835457,
    "continued-2103.ssm.28.control" : 0.005258497782051563,
    "continued-2103.ssm.29.candidate" : 0.05544654652476311,
    "continued-2103.ssm.29.control" : 0.04497474431991577,
    "continued-2103.ssm.30.candidate" : 0.039920154958963394,
    "continued-2103.ssm.30.control" : 0.032806556671857834,
    "continued-2103.ssm.32.candidate" : 0.06925957649946213,
    "continued-2103.ssm.32.control" : 0.09136993438005447,
    "continued-2103.ssm.33.candidate" : 0.07674816995859146,
    "continued-2103.ssm.33.control" : 0.06761748343706131,
    "continued-2103.ssm.34.candidate" : 0.08535167574882507,
    "continued-2103.ssm.34.control" : 0.07938974350690842,
    "continued-2103.ssm.36.candidate" : 0.0626455545425415,
    "continued-2103.ssm.36.control" : 0.04179370030760765,
    "continued-2103.ssm.37.candidate" : 0.09890704602003098,
    "continued-2103.ssm.37.control" : 0.04076423868536949,
    "continued-2103.ssm.38.candidate" : 0.03627980127930641,
    "continued-2103.ssm.38.control" : 0.016576921567320824,
    "continued-2103.ssm.4.candidate" : 0.018937911838293076,
    "continued-2103.ssm.4.control" : 0,
    "continued-2103.ssm.40.candidate" : 0.025962969288229942,
    "continued-2103.ssm.40.control" : 0.016824448481202126,
    "continued-2103.ssm.41.candidate" : 0.042584992945194244,
    "continued-2103.ssm.41.control" : 0.018600014969706535,
    "continued-2103.ssm.42.candidate" : 0.04152969643473625,
    "continued-2103.ssm.42.control" : 0.06506846845149994,
    "continued-2103.ssm.44.candidate" : 0.05576932057738304,
    "continued-2103.ssm.44.control" : 0.014560380950570107,
    "continued-2103.ssm.45.candidate" : 0.16763262450695038,
    "continued-2103.ssm.45.control" : 0.0805421993136406,
    "continued-2103.ssm.46.candidate" : 0.1374596506357193,
    "continued-2103.ssm.46.control" : 0.17004629969596863,
    "continued-2103.ssm.5.candidate" : 0.020381461828947067,
    "continued-2103.ssm.5.control" : 0,
    "continued-2103.ssm.6.candidate" : 0.01793927699327469,
    "continued-2103.ssm.6.control" : 0,
    "continued-2103.ssm.8.candidate" : 0.01790595054626465,
    "continued-2103.ssm.8.control" : 0,
    "continued-2103.ssm.9.candidate" : 0.03568213805556297,
    "continued-2103.ssm.9.control" : 0,
    "continued-2103.value.11.candidate" : 0.02675359696149826,
    "continued-2103.value.11.control" : 0,
    "continued-2103.value.15.candidate" : 0.02838645502924919,
    "continued-2103.value.15.control" : 0.009213147684931755,
    "continued-2103.value.19.candidate" : 0.027551019564270973,
    "continued-2103.value.19.control" : 0.012519929558038712,
    "continued-2103.value.23.candidate" : 0.044186048209667206,
    "continued-2103.value.23.control" : 0.0417151153087616,
    "continued-2103.value.27.candidate" : 0.016348885372281075,
    "continued-2103.value.27.control" : 0.014546001330018044,
    "continued-2103.value.3.candidate" : 0.05281690135598183,
    "continued-2103.value.3.control" : 0,
    "continued-2103.value.31.candidate" : 0.07010869681835175,
    "continued-2103.value.31.control" : 0.072826087474823,
    "continued-2103.value.35.candidate" : 0.10009057819843292,
    "continued-2103.value.35.control" : 0.06159420311450958,
    "continued-2103.value.39.candidate" : 0.37142857909202576,
    "continued-2103.value.39.control" : 0.0494791679084301,
    "continued-2103.value.43.candidate" : 0.06839622557163239,
    "continued-2103.value.43.control" : 0.04088050499558449,
    "continued-2103.value.47.candidate" : 0.3460365831851959,
    "continued-2103.value.47.control" : 0.20636433362960815,
    "continued-2103.value.7.candidate" : 0.025542665272951126,
    "continued-2103.value.7.control" : 0,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0.018540669232606888,
    "continued-907.conv.10.control" : 0,
    "continued-907.conv.12.candidate" : 0.014544270932674408,
    "continued-907.conv.12.control" : 0,
    "continued-907.conv.13.candidate" : 0.01825842633843422,
    "continued-907.conv.13.control" : 0,
    "continued-907.conv.14.candidate" : 0.019510582089424133,
    "continued-907.conv.14.control" : 0.006613756529986858,
    "continued-907.conv.16.candidate" : 0.025641025975346565,
    "continued-907.conv.16.control" : 0.015064102597534657,
    "continued-907.conv.17.candidate" : 0.032407406717538834,
    "continued-907.conv.17.control" : 0.016782406717538834,
    "continued-907.conv.18.candidate" : 0.022129524499177933,
    "continued-907.conv.18.control" : 0.009049774147570133,
    "continued-907.conv.2.candidate" : 0.011436855420470238,
    "continued-907.conv.2.control" : 0,
    "continued-907.conv.20.candidate" : 0.029336735606193542,
    "continued-907.conv.20.control" : 0.025510204955935478,
    "continued-907.conv.21.candidate" : 0.02570093423128128,
    "continued-907.conv.21.control" : 0.014018691144883633,
    "continued-907.conv.22.candidate" : 0.01227678544819355,
    "continued-907.conv.22.control" : 0.010714286006987095,
    "continued-907.conv.24.candidate" : 0.02747252769768238,
    "continued-907.conv.24.control" : 0.024038461968302727,
    "continued-907.conv.25.candidate" : 0.035211268812417984,
    "continued-907.conv.25.control" : 0.019366197288036346,
    "continued-907.conv.26.candidate" : 0.034360188990831375,
    "continued-907.conv.26.control" : 0.030805686488747597,
    "continued-907.conv.28.candidate" : 0.04032257944345474,
    "continued-907.conv.28.control" : 0.04838709533214569,
    "continued-907.conv.29.candidate" : 0.06393229216337204,
    "continued-907.conv.29.control" : 0.0625,
    "continued-907.conv.30.candidate" : 0.1028645858168602,
    "continued-907.conv.30.control" : 0.0794270858168602,
    "continued-907.conv.32.candidate" : 0.09100506454706192,
    "continued-907.conv.32.control" : 0.08164414763450623,
    "continued-907.conv.33.candidate" : 0.083587646484375,
    "continued-907.conv.33.control" : 0.0654296875,
    "continued-907.conv.34.candidate" : 0.11181434243917465,
    "continued-907.conv.34.control" : 0.10126582533121109,
    "continued-907.conv.36.candidate" : 0.07352941483259201,
    "continued-907.conv.36.control" : 0.09803921729326248,
    "continued-907.conv.37.candidate" : 0.06221846863627434,
    "continued-907.conv.37.control" : 0.04954954981803894,
    "continued-907.conv.38.candidate" : 0.05744485184550285,
    "continued-907.conv.38.control" : 0.04117647185921669,
    "continued-907.conv.4.candidate" : 0.01981707289814949,
    "continued-907.conv.4.control" : 0,
    "continued-907.conv.40.candidate" : 0.07020547986030579,
    "continued-907.conv.40.control" : 0.07994434982538223,
    "continued-907.conv.41.candidate" : 0.07972440868616104,
    "continued-907.conv.41.control" : 0.06422244012355804,
    "continued-907.conv.42.candidate" : 0.05252659693360329,
    "continued-907.conv.42.control" : 0.060283686965703964,
    "continued-907.conv.44.candidate" : 0.06629834324121475,
    "continued-907.conv.44.control" : 0.11049723625183105,
    "continued-907.conv.45.candidate" : 0.07453547418117523,
    "continued-907.conv.45.control" : 0.051309119910001755,
    "continued-907.conv.46.candidate" : 0.0892857164144516,
    "continued-907.conv.46.control" : 0.061011902987957,
    "continued-907.conv.5.candidate" : 0.02130044810473919,
    "continued-907.conv.5.control" : 0,
    "continued-907.conv.6.candidate" : 0.01863262988626957,
    "continued-907.conv.6.control" : 0,
    "continued-907.conv.8.candidate" : 0.015776699408888817,
    "continued-907.conv.8.control" : 0,
    "continued-907.conv.9.candidate" : 0.020295515656471252,
    "continued-907.conv.9.control" : 0,
    "continued-907.index.11.candidate" : 0.03375771641731262,
    "continued-907.index.11.control" : 0,
    "continued-907.index.15.candidate" : 0.060393258929252625,
    "continued-907.index.15.control" : 0.01755617931485176,
    "continued-907.index.19.candidate" : 0.052226025611162186,
    "continued-907.index.19.control" : 0.027397260069847107,
    "continued-907.index.23.candidate" : 0.03169642761349678,
    "continued-907.index.23.control" : 0.02276785671710968,
    "continued-907.index.27.candidate" : 0.048344679176807404,
    "continued-907.index.27.control" : 0.037128712981939316,
    "continued-907.index.3.candidate" : 0.039016272872686386,
    "continued-907.index.3.control" : 0,
    "continued-907.index.31.candidate" : 0.16480809450149536,
    "continued-907.index.31.control" : 0.19605809450149536,
    "continued-907.index.35.candidate" : 0.15728476643562317,
    "continued-907.index.35.control" : 0.11423841118812561,
    "continued-907.index.39.candidate" : 0.3734177350997925,
    "continued-907.index.39.control" : 0.04628164693713188,
    "continued-907.index.43.candidate" : 0.20000000298023224,
    "continued-907.index.43.control" : 0.04707031324505806,
    "continued-907.index.47.candidate" : 0.14541666209697723,
    "continued-907.index.47.control" : 0.10187499970197678,
    "continued-907.index.7.candidate" : 0.0380859375,
    "continued-907.index.7.control" : 0,
    "continued-907.key.11.candidate" : 0.09807692468166351,
    "continued-907.key.11.control" : 0,
    "continued-907.key.15.candidate" : 0.08211679011583328,
    "continued-907.key.15.control" : 0.031934306025505066,
    "continued-907.key.19.candidate" : 0.11603008955717087,
    "continued-907.key.19.control" : 0.05613425746560097,
    "continued-907.key.23.candidate" : 0.07281249761581421,
    "continued-907.key.23.control" : 0.06541666388511658,
    "continued-907.key.27.candidate" : 0.12828947603702545,
    "continued-907.key.27.control" : 0.10896381735801697,
    "continued-907.key.3.candidate" : 0.06392766535282135,
    "continued-907.key.3.control" : 0,
    "continued-907.key.31.candidate" : 0.17743287980556488,
    "continued-907.key.31.control" : 0.14901426434516907,
    "continued-907.key.35.candidate" : 0.20423229038715363,
    "continued-907.key.35.control" : 0.16338582336902618,
    "continued-907.key.39.candidate" : 0.34687501192092896,
    "continued-907.key.39.control" : 0.08671875298023224,
    "continued-907.key.43.candidate" : 0.13605442643165588,
    "continued-907.key.43.control" : 0.07823128998279572,
    "continued-907.key.47.candidate" : 0.17078189551830292,
    "continued-907.key.47.control" : 0.09786522388458252,
    "continued-907.key.7.candidate" : 0.08842329680919647,
    "continued-907.key.7.control" : 0,
    "continued-907.logits.candidate" : 0.1533280462026596,
    "continued-907.logits.control" : 0.11133121699094772,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0.00021933414973318577,
    "continued-907.ssm.1.control" : 0,
    "continued-907.ssm.10.candidate" : 0.02519541233778,
    "continued-907.ssm.10.control" : 0,
    "continued-907.ssm.12.candidate" : 0.003351648570969701,
    "continued-907.ssm.12.control" : 0,
    "continued-907.ssm.13.candidate" : 0.013387998566031456,
    "continued-907.ssm.13.control" : 0.0002817342756316066,
    "continued-907.ssm.14.candidate" : 0.009802873246371746,
    "continued-907.ssm.14.control" : 0.0037336547393351793,
    "continued-907.ssm.16.candidate" : 0.03638152778148651,
    "continued-907.ssm.16.control" : 0.00977743323892355,
    "continued-907.ssm.17.candidate" : 0.01826527900993824,
    "continued-907.ssm.17.control" : 0.01111855823546648,
    "continued-907.ssm.18.candidate" : 0.03290370851755142,
    "continued-907.ssm.18.control" : 0.014318006113171577,
    "continued-907.ssm.2.candidate" : 0.010520825162529945,
    "continued-907.ssm.2.control" : 0,
    "continued-907.ssm.20.candidate" : 0.03694767877459526,
    "continued-907.ssm.20.control" : 0.011634263209998608,
    "continued-907.ssm.21.candidate" : 0.015045307576656342,
    "continued-907.ssm.21.control" : 0.012398164719343185,
    "continued-907.ssm.22.candidate" : 0.01084093376994133,
    "continued-907.ssm.22.control" : 0.005773540586233139,
    "continued-907.ssm.24.candidate" : 0.027618523687124252,
    "continued-907.ssm.24.control" : 0.018454771488904953,
    "continued-907.ssm.25.candidate" : 0.04337658733129501,
    "continued-907.ssm.25.control" : 0.033577900379896164,
    "continued-907.ssm.26.candidate" : 0.09684452414512634,
    "continued-907.ssm.26.control" : 0.06735121458768845,
    "continued-907.ssm.28.candidate" : 0.005708197597414255,
    "continued-907.ssm.28.control" : 0.0040559470653533936,
    "continued-907.ssm.29.candidate" : 0.0542009137570858,
    "continued-907.ssm.29.control" : 0.05295253545045853,
    "continued-907.ssm.30.candidate" : 0.06841294467449188,
    "continued-907.ssm.30.control" : 0.0886233001947403,
    "continued-907.ssm.32.candidate" : 0.1536751538515091,
    "continued-907.ssm.32.control" : 0.10987891256809235,
    "continued-907.ssm.33.candidate" : 0.13623473048210144,
    "continued-907.ssm.33.control" : 0.08728557825088501,
    "continued-907.ssm.34.candidate" : 0.10943486541509628,
    "continued-907.ssm.34.control" : 0.08165968954563141,
    "continued-907.ssm.36.candidate" : 0.14913901686668396,
    "continued-907.ssm.36.control" : 0.0977427288889885,
    "continued-907.ssm.37.candidate" : 0.042531248182058334,
    "continued-907.ssm.37.control" : 0.056762851774692535,
    "continued-907.ssm.38.candidate" : 0.03647669777274132,
    "continued-907.ssm.38.control" : 0.016137052327394485,
    "continued-907.ssm.4.candidate" : 0.01156683824956417,
    "continued-907.ssm.4.control" : 0,
    "continued-907.ssm.40.candidate" : 0.027233652770519257,
    "continued-907.ssm.40.control" : 0.014509430155158043,
    "continued-907.ssm.41.candidate" : 0.04288148880004883,
    "continued-907.ssm.41.control" : 0.01707575097680092,
    "continued-907.ssm.42.candidate" : 0.0527288056910038,
    "continued-907.ssm.42.control" : 0.03383483365178108,
    "continued-907.ssm.44.candidate" : 0.05593748018145561,
    "continued-907.ssm.44.control" : 0.013975723646581173,
    "continued-907.ssm.45.candidate" : 0.16322998702526093,
    "continued-907.ssm.45.control" : 0.0766148567199707,
    "continued-907.ssm.46.candidate" : 0.15086613595485687,
    "continued-907.ssm.46.control" : 0.1926262527704239,
    "continued-907.ssm.5.candidate" : 0.012788238003849983,
    "continued-907.ssm.5.control" : 0,
    "continued-907.ssm.6.candidate" : 0.012811989523470402,
    "continued-907.ssm.6.control" : 0,
    "continued-907.ssm.8.candidate" : 0.011621672660112381,
    "continued-907.ssm.8.control" : 0,
    "continued-907.ssm.9.candidate" : 0.0435759536921978,
    "continued-907.ssm.9.control" : 0,
    "continued-907.value.11.candidate" : 0.02675359696149826,
    "continued-907.value.11.control" : 0,
    "continued-907.value.15.candidate" : 0.02838645502924919,
    "continued-907.value.15.control" : 0.009213147684931755,
    "continued-907.value.19.candidate" : 0.027551019564270973,
    "continued-907.value.19.control" : 0.012519929558038712,
    "continued-907.value.23.candidate" : 0.044186048209667206,
    "continued-907.value.23.control" : 0.0417151153087616,
    "continued-907.value.27.candidate" : 0.016348885372281075,
    "continued-907.value.27.control" : 0.014546001330018044,
    "continued-907.value.3.candidate" : 0.05281690135598183,
    "continued-907.value.3.control" : 0,
    "continued-907.value.31.candidate" : 0.07010869681835175,
    "continued-907.value.31.control" : 0.072826087474823,
    "continued-907.value.35.candidate" : 0.10009057819843292,
    "continued-907.value.35.control" : 0.06159420311450958,
    "continued-907.value.39.candidate" : 0.37142857909202576,
    "continued-907.value.39.control" : 0.0494791679084301,
    "continued-907.value.43.candidate" : 0.06839622557163239,
    "continued-907.value.43.control" : 0.04088050499558449,
    "continued-907.value.47.candidate" : 0.3460365831851959,
    "continued-907.value.47.control" : 0.20636433362960815,
    "continued-907.value.7.candidate" : 0.025542665272951126,
    "continued-907.value.7.control" : 0,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0.018540669232606888,
    "prefill.conv.10.control" : 0,
    "prefill.conv.12.candidate" : 0.014544270932674408,
    "prefill.conv.12.control" : 0,
    "prefill.conv.13.candidate" : 0.029329609125852585,
    "prefill.conv.13.control" : 0,
    "prefill.conv.14.candidate" : 0.01940789446234703,
    "prefill.conv.14.control" : 0.007894736714661121,
    "prefill.conv.16.candidate" : 0.025641025975346565,
    "prefill.conv.16.control" : 0.02580128237605095,
    "prefill.conv.17.candidate" : 0.032407406717538834,
    "prefill.conv.17.control" : 0.017433449625968933,
    "prefill.conv.18.candidate" : 0.022129524499177933,
    "prefill.conv.18.control" : 0.020644797012209892,
    "prefill.conv.2.candidate" : 0.009302325546741486,
    "prefill.conv.2.control" : 0,
    "prefill.conv.20.candidate" : 0.025510204955935478,
    "prefill.conv.20.control" : 0.025510204955935478,
    "prefill.conv.21.candidate" : 0.026371952146291733,
    "prefill.conv.21.control" : 0.024390242993831635,
    "prefill.conv.22.candidate" : 0.012500000186264515,
    "prefill.conv.22.control" : 0.010714286006987095,
    "prefill.conv.24.candidate" : 0.05319149047136307,
    "prefill.conv.24.control" : 0.037602849304676056,
    "prefill.conv.25.candidate" : 0.035211268812417984,
    "prefill.conv.25.control" : 0.030516432598233223,
    "prefill.conv.26.candidate" : 0.04028436169028282,
    "prefill.conv.26.control" : 0.042061612010002136,
    "prefill.conv.28.candidate" : 0.04334677383303642,
    "prefill.conv.28.control" : 0.04838709533214569,
    "prefill.conv.29.candidate" : 0.07013888657093048,
    "prefill.conv.29.control" : 0.0625,
    "prefill.conv.30.candidate" : 0.11787565052509308,
    "prefill.conv.30.control" : 0.07901554554700851,
    "prefill.conv.32.candidate" : 0.09440712630748749,
    "prefill.conv.32.control" : 0.0849883183836937,
    "prefill.conv.33.candidate" : 0.08391544222831726,
    "prefill.conv.33.control" : 0.08235294371843338,
    "prefill.conv.34.candidate" : 0.11181434243917465,
    "prefill.conv.34.control" : 0.10126582533121109,
    "prefill.conv.36.candidate" : 0.0729166641831398,
    "prefill.conv.36.control" : 0.0784313753247261,
    "prefill.conv.37.candidate" : 0.06081081181764603,
    "prefill.conv.37.control" : 0.04954954981803894,
    "prefill.conv.38.candidate" : 0.05744485184550285,
    "prefill.conv.38.control" : 0.04117647185921669,
    "prefill.conv.4.candidate" : 0.019979508593678474,
    "prefill.conv.4.control" : 0,
    "prefill.conv.40.candidate" : 0.06357020884752274,
    "prefill.conv.40.control" : 0.07994434982538223,
    "prefill.conv.41.candidate" : 0.04921259731054306,
    "prefill.conv.41.control" : 0.06422244012355804,
    "prefill.conv.42.candidate" : 0.04920212924480438,
    "prefill.conv.42.control" : 0.05673758685588837,
    "prefill.conv.44.candidate" : 0.06315789371728897,
    "prefill.conv.44.control" : 0.10526315867900848,
    "prefill.conv.45.candidate" : 0.04447992518544197,
    "prefill.conv.45.control" : 0.043795619159936905,
    "prefill.conv.46.candidate" : 0.07407407462596893,
    "prefill.conv.46.control" : 0.06018518656492233,
    "prefill.conv.5.candidate" : 0.02168949693441391,
    "prefill.conv.5.control" : 0,
    "prefill.conv.6.candidate" : 0.01889880932867527,
    "prefill.conv.6.control" : 0,
    "prefill.conv.8.candidate" : 0.02393617108464241,
    "prefill.conv.8.control" : 0,
    "prefill.conv.9.candidate" : 0.02445652149617672,
    "prefill.conv.9.control" : 0,
    "prefill.index.11.candidate" : 0.03375771641731262,
    "prefill.index.11.control" : 0,
    "prefill.index.15.candidate" : 0.060393258929252625,
    "prefill.index.15.control" : 0.01755617931485176,
    "prefill.index.19.candidate" : 0.052226025611162186,
    "prefill.index.19.control" : 0.027397260069847107,
    "prefill.index.23.candidate" : 0.03169642761349678,
    "prefill.index.23.control" : 0.02276785671710968,
    "prefill.index.27.candidate" : 0.048344679176807404,
    "prefill.index.27.control" : 0.037128712981939316,
    "prefill.index.3.candidate" : 0.039016272872686386,
    "prefill.index.3.control" : 0,
    "prefill.index.31.candidate" : 0.16480809450149536,
    "prefill.index.31.control" : 0.19605809450149536,
    "prefill.index.35.candidate" : 0.15728476643562317,
    "prefill.index.35.control" : 0.11423841118812561,
    "prefill.index.39.candidate" : 0.3734177350997925,
    "prefill.index.39.control" : 0.04628164693713188,
    "prefill.index.43.candidate" : 0.20000000298023224,
    "prefill.index.43.control" : 0.04707031324505806,
    "prefill.index.47.candidate" : 0.14541666209697723,
    "prefill.index.47.control" : 0.10187499970197678,
    "prefill.index.7.candidate" : 0.0380859375,
    "prefill.index.7.control" : 0,
    "prefill.key.11.candidate" : 0.09807692468166351,
    "prefill.key.11.control" : 0,
    "prefill.key.15.candidate" : 0.08211679011583328,
    "prefill.key.15.control" : 0.031934306025505066,
    "prefill.key.19.candidate" : 0.11603008955717087,
    "prefill.key.19.control" : 0.05613425746560097,
    "prefill.key.23.candidate" : 0.07281249761581421,
    "prefill.key.23.control" : 0.06541666388511658,
    "prefill.key.27.candidate" : 0.12828947603702545,
    "prefill.key.27.control" : 0.10896381735801697,
    "prefill.key.3.candidate" : 0.06392766535282135,
    "prefill.key.3.control" : 0,
    "prefill.key.31.candidate" : 0.17743287980556488,
    "prefill.key.31.control" : 0.14901426434516907,
    "prefill.key.35.candidate" : 0.20423229038715363,
    "prefill.key.35.control" : 0.16338582336902618,
    "prefill.key.39.candidate" : 0.34687501192092896,
    "prefill.key.39.control" : 0.08671875298023224,
    "prefill.key.43.candidate" : 0.13605442643165588,
    "prefill.key.43.control" : 0.07823128998279572,
    "prefill.key.47.candidate" : 0.17078189551830292,
    "prefill.key.47.control" : 0.09786522388458252,
    "prefill.key.7.candidate" : 0.08842329680919647,
    "prefill.key.7.control" : 0,
    "prefill.logits.candidate" : 0.09532123059034348,
    "prefill.logits.control" : 0.06354748457670212,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0.00021929823560640216,
    "prefill.ssm.1.control" : 0,
    "prefill.ssm.10.candidate" : 0.041166163980960846,
    "prefill.ssm.10.control" : 0,
    "prefill.ssm.12.candidate" : 0.00288839777931571,
    "prefill.ssm.12.control" : 0,
    "prefill.ssm.13.candidate" : 0.012879841029644012,
    "prefill.ssm.13.control" : 0.0002766742545645684,
    "prefill.ssm.14.candidate" : 0.009380732662975788,
    "prefill.ssm.14.control" : 0.0031120148487389088,
    "prefill.ssm.16.candidate" : 0.039981409907341,
    "prefill.ssm.16.control" : 0.01928410865366459,
    "prefill.ssm.17.candidate" : 0.024004638195037842,
    "prefill.ssm.17.control" : 0.015351982787251472,
    "prefill.ssm.18.candidate" : 0.048324357718229294,
    "prefill.ssm.18.control" : 0.01835530996322632,
    "prefill.ssm.2.candidate" : 0.006574218161404133,
    "prefill.ssm.2.control" : 0,
    "prefill.ssm.20.candidate" : 0.02054731920361519,
    "prefill.ssm.20.control" : 0.010046429932117462,
    "prefill.ssm.21.candidate" : 0.039405182003974915,
    "prefill.ssm.21.control" : 0.010658453218638897,
    "prefill.ssm.22.candidate" : 0.010856094770133495,
    "prefill.ssm.22.control" : 0.005643798969686031,
    "prefill.ssm.24.candidate" : 0.03914077579975128,
    "prefill.ssm.24.control" : 0.02616826258599758,
    "prefill.ssm.25.candidate" : 0.06002502888441086,
    "prefill.ssm.25.control" : 0.05810854583978653,
    "prefill.ssm.26.candidate" : 0.05055060237646103,
    "prefill.ssm.26.control" : 0.034994207322597504,
    "prefill.ssm.28.candidate" : 0.006242921110242605,
    "prefill.ssm.28.control" : 0.004434869159013033,
    "prefill.ssm.29.candidate" : 0.09987062960863113,
    "prefill.ssm.29.control" : 0.057749681174755096,
    "prefill.ssm.30.candidate" : 0.047636158764362335,
    "prefill.ssm.30.control" : 0.03673890605568886,
    "prefill.ssm.32.candidate" : 0.09007420390844345,
    "prefill.ssm.32.control" : 0.15956521034240723,
    "prefill.ssm.33.candidate" : 0.21561402082443237,
    "prefill.ssm.33.control" : 0.13404248654842377,
    "prefill.ssm.34.candidate" : 0.18561282753944397,
    "prefill.ssm.34.control" : 0.09960776567459106,
    "prefill.ssm.36.candidate" : 0.049835484474897385,
    "prefill.ssm.36.control" : 0.07311578094959259,
    "prefill.ssm.37.candidate" : 0.042878419160842896,
    "prefill.ssm.37.control" : 0.1196533739566803,
    "prefill.ssm.38.candidate" : 0.036456357687711716,
    "prefill.ssm.38.control" : 0.022961735725402832,
    "prefill.ssm.4.candidate" : 0.022650152444839478,
    "prefill.ssm.4.control" : 0,
    "prefill.ssm.40.candidate" : 0.027195556089282036,
    "prefill.ssm.40.control" : 0.014941614121198654,
    "prefill.ssm.41.candidate" : 0.042965203523635864,
    "prefill.ssm.41.control" : 0.01651778258383274,
    "prefill.ssm.42.candidate" : 0.0332941859960556,
    "prefill.ssm.42.control" : 0.041674401611089706,
    "prefill.ssm.44.candidate" : 0.055841367691755295,
    "prefill.ssm.44.control" : 0.014857178553938866,
    "prefill.ssm.45.candidate" : 0.16334210336208344,
    "prefill.ssm.45.control" : 0.09404612332582474,
    "prefill.ssm.46.candidate" : 0.1721578687429428,
    "prefill.ssm.46.control" : 0.17168006300926208,
    "prefill.ssm.5.candidate" : 0.014038175344467163,
    "prefill.ssm.5.control" : 0,
    "prefill.ssm.6.candidate" : 0.018911296501755714,
    "prefill.ssm.6.control" : 0,
    "prefill.ssm.8.candidate" : 0.011636994779109955,
    "prefill.ssm.8.control" : 0,
    "prefill.ssm.9.candidate" : 0.036211781203746796,
    "prefill.ssm.9.control" : 0,
    "prefill.value.11.candidate" : 0.02675359696149826,
    "prefill.value.11.control" : 0,
    "prefill.value.15.candidate" : 0.02838645502924919,
    "prefill.value.15.control" : 0.009213147684931755,
    "prefill.value.19.candidate" : 0.027551019564270973,
    "prefill.value.19.control" : 0.012519929558038712,
    "prefill.value.23.candidate" : 0.044186048209667206,
    "prefill.value.23.control" : 0.0417151153087616,
    "prefill.value.27.candidate" : 0.016348885372281075,
    "prefill.value.27.control" : 0.014546001330018044,
    "prefill.value.3.candidate" : 0.05281690135598183,
    "prefill.value.3.control" : 0,
    "prefill.value.31.candidate" : 0.07010869681835175,
    "prefill.value.31.control" : 0.072826087474823,
    "prefill.value.35.candidate" : 0.10009057819843292,
    "prefill.value.35.control" : 0.06159420311450958,
    "prefill.value.39.candidate" : 0.37142857909202576,
    "prefill.value.39.control" : 0.0494791679084301,
    "prefill.value.43.candidate" : 0.06839622557163239,
    "prefill.value.43.control" : 0.04088050499558449,
    "prefill.value.47.candidate" : 0.3460365831851959,
    "prefill.value.47.control" : 0.20636433362960815,
    "prefill.value.7.candidate" : 0.025542665272951126,
    "prefill.value.7.control" : 0,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0.028256425634026527,
    "rollback-1.conv.10.control" : 0,
    "rollback-1.conv.12.candidate" : 0.02666666731238365,
    "rollback-1.conv.12.control" : 0,
    "rollback-1.conv.13.candidate" : 0.03961748629808426,
    "rollback-1.conv.13.control" : 0,
    "rollback-1.conv.14.candidate" : 0.02864583395421505,
    "rollback-1.conv.14.control" : 0.0052083334885537624,
    "rollback-1.conv.16.candidate" : 0.03316326439380646,
    "rollback-1.conv.16.control" : 0.013392857275903225,
    "rollback-1.conv.17.candidate" : 0.05154639109969139,
    "rollback-1.conv.17.control" : 0.01663176529109478,
    "rollback-1.conv.18.candidate" : 0.04176267236471176,
    "rollback-1.conv.18.control" : 0.01569700427353382,
    "rollback-1.conv.2.candidate" : 0.00597638264298439,
    "rollback-1.conv.2.control" : 0,
    "rollback-1.conv.20.candidate" : 0.03831658139824867,
    "rollback-1.conv.20.control" : 0.02010050229728222,
    "rollback-1.conv.21.candidate" : 0.03452381119132042,
    "rollback-1.conv.21.control" : 0.013988095335662365,
    "rollback-1.conv.22.candidate" : 0.01584506966173649,
    "rollback-1.conv.22.control" : 0.011003521271049976,
    "rollback-1.conv.24.candidate" : 0.031058933585882187,
    "rollback-1.conv.24.control" : 0.02038043551146984,
    "rollback-1.conv.25.candidate" : 0.04146919399499893,
    "rollback-1.conv.25.control" : 0.02769549749791622,
    "rollback-1.conv.26.candidate" : 0.03484513238072395,
    "rollback-1.conv.26.control" : 0.04203539714217186,
    "rollback-1.conv.28.candidate" : 0.05526859685778618,
    "rollback-1.conv.28.control" : 0.048553720116615295,
    "rollback-1.conv.29.candidate" : 0.0623372383415699,
    "rollback-1.conv.29.control" : 0.0520833320915699,
    "rollback-1.conv.30.candidate" : 0.08376288414001465,
    "rollback-1.conv.30.control" : 0.05541237071156502,
    "rollback-1.conv.32.candidate" : 0.06798245757818222,
    "rollback-1.conv.32.control" : 0.07456140220165253,
    "rollback-1.conv.33.candidate" : 0.09090909361839294,
    "rollback-1.conv.33.control" : 0.05978260934352875,
    "rollback-1.conv.34.candidate" : 0.07839912176132202,
    "rollback-1.conv.34.control" : 0.06195175275206566,
    "rollback-1.conv.36.candidate" : 0.10654761642217636,
    "rollback-1.conv.36.control" : 0.0833333358168602,
    "rollback-1.conv.37.candidate" : 0.07619047909975052,
    "rollback-1.conv.37.control" : 0.05714285746216774,
    "rollback-1.conv.38.candidate" : 0.053463853895664215,
    "rollback-1.conv.38.control" : 0.05120481923222542,
    "rollback-1.conv.4.candidate" : 0.02705792710185051,
    "rollback-1.conv.4.control" : 0,
    "rollback-1.conv.40.candidate" : 0.09178321808576584,
    "rollback-1.conv.40.control" : 0.09134615212678909,
    "rollback-1.conv.41.candidate" : 0.09879032522439957,
    "rollback-1.conv.41.control" : 0.0698084682226181,
    "rollback-1.conv.42.candidate" : 0.07854166626930237,
    "rollback-1.conv.42.control" : 0.07140625268220901,
    "rollback-1.conv.44.candidate" : 0.09649122506380081,
    "rollback-1.conv.44.control" : 0.0659722238779068,
    "rollback-1.conv.45.candidate" : 0.11734694242477417,
    "rollback-1.conv.45.control" : 0.07525510340929031,
    "rollback-1.conv.46.candidate" : 0.05927309766411781,
    "rollback-1.conv.46.control" : 0.07676630467176437,
    "rollback-1.conv.5.candidate" : 0.023404255509376526,
    "rollback-1.conv.5.control" : 0,
    "rollback-1.conv.6.candidate" : 0.02427184395492077,
    "rollback-1.conv.6.control" : 0,
    "rollback-1.conv.8.candidate" : 0.02450980432331562,
    "rollback-1.conv.8.control" : 0,
    "rollback-1.conv.9.candidate" : 0.02432432398200035,
    "rollback-1.conv.9.control" : 0,
    "rollback-1.index.11.candidate" : 0.03375771641731262,
    "rollback-1.index.11.control" : 0,
    "rollback-1.index.15.candidate" : 0.060393258929252625,
    "rollback-1.index.15.control" : 0.01755617931485176,
    "rollback-1.index.19.candidate" : 0.052226025611162186,
    "rollback-1.index.19.control" : 0.027397260069847107,
    "rollback-1.index.23.candidate" : 0.03169642761349678,
    "rollback-1.index.23.control" : 0.02276785671710968,
    "rollback-1.index.27.candidate" : 0.048344679176807404,
    "rollback-1.index.27.control" : 0.037128712981939316,
    "rollback-1.index.3.candidate" : 0.039016272872686386,
    "rollback-1.index.3.control" : 0,
    "rollback-1.index.31.candidate" : 0.16480809450149536,
    "rollback-1.index.31.control" : 0.19605809450149536,
    "rollback-1.index.35.candidate" : 0.15728476643562317,
    "rollback-1.index.35.control" : 0.11423841118812561,
    "rollback-1.index.39.candidate" : 0.3734177350997925,
    "rollback-1.index.39.control" : 0.04628164693713188,
    "rollback-1.index.43.candidate" : 0.20000000298023224,
    "rollback-1.index.43.control" : 0.04707031324505806,
    "rollback-1.index.47.candidate" : 0.14541666209697723,
    "rollback-1.index.47.control" : 0.10187499970197678,
    "rollback-1.index.7.candidate" : 0.0380859375,
    "rollback-1.index.7.control" : 0,
    "rollback-1.key.11.candidate" : 0.09807692468166351,
    "rollback-1.key.11.control" : 0,
    "rollback-1.key.15.candidate" : 0.08211679011583328,
    "rollback-1.key.15.control" : 0.031934306025505066,
    "rollback-1.key.19.candidate" : 0.11603008955717087,
    "rollback-1.key.19.control" : 0.05613425746560097,
    "rollback-1.key.23.candidate" : 0.07281249761581421,
    "rollback-1.key.23.control" : 0.06541666388511658,
    "rollback-1.key.27.candidate" : 0.12828947603702545,
    "rollback-1.key.27.control" : 0.10896381735801697,
    "rollback-1.key.3.candidate" : 0.06392766535282135,
    "rollback-1.key.3.control" : 0,
    "rollback-1.key.31.candidate" : 0.17743287980556488,
    "rollback-1.key.31.control" : 0.14901426434516907,
    "rollback-1.key.35.candidate" : 0.20423229038715363,
    "rollback-1.key.35.control" : 0.16338582336902618,
    "rollback-1.key.39.candidate" : 0.34687501192092896,
    "rollback-1.key.39.control" : 0.08671875298023224,
    "rollback-1.key.43.candidate" : 0.13605442643165588,
    "rollback-1.key.43.control" : 0.08843537420034409,
    "rollback-1.key.47.candidate" : 0.17078189551830292,
    "rollback-1.key.47.control" : 0.09786522388458252,
    "rollback-1.key.7.candidate" : 0.08842329680919647,
    "rollback-1.key.7.control" : 0,
    "rollback-1.logits.candidate" : 0.100375235080719,
    "rollback-1.logits.control" : 0.12570355832576752,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0.00022240588441491127,
    "rollback-1.ssm.1.control" : 0,
    "rollback-1.ssm.10.candidate" : 0.08409391343593597,
    "rollback-1.ssm.10.control" : 0,
    "rollback-1.ssm.12.candidate" : 0.00435035303235054,
    "rollback-1.ssm.12.control" : 0,
    "rollback-1.ssm.13.candidate" : 0.03300638496875763,
    "rollback-1.ssm.13.control" : 0.0002743733348324895,
    "rollback-1.ssm.14.candidate" : 0.017414897680282593,
    "rollback-1.ssm.14.control" : 0.002468931255862117,
    "rollback-1.ssm.16.candidate" : 0.030894378200173378,
    "rollback-1.ssm.16.control" : 0.013193454593420029,
    "rollback-1.ssm.17.candidate" : 0.05303105339407921,
    "rollback-1.ssm.17.control" : 0.013512276113033295,
    "rollback-1.ssm.18.candidate" : 0.06610777229070663,
    "rollback-1.ssm.18.control" : 0.019590312615036964,
    "rollback-1.ssm.2.candidate" : 0.009579367004334927,
    "rollback-1.ssm.2.control" : 0,
    "rollback-1.ssm.20.candidate" : 0.01891346462070942,
    "rollback-1.ssm.20.control" : 0.009005283936858177,
    "rollback-1.ssm.21.candidate" : 0.03475290909409523,
    "rollback-1.ssm.21.control" : 0.011700308881700039,
    "rollback-1.ssm.22.candidate" : 0.01058220211416483,
    "rollback-1.ssm.22.control" : 0.004206422250717878,
    "rollback-1.ssm.24.candidate" : 0.028885213658213615,
    "rollback-1.ssm.24.control" : 0.017506999894976616,
    "rollback-1.ssm.25.candidate" : 0.07243701070547104,
    "rollback-1.ssm.25.control" : 0.06453016400337219,
    "rollback-1.ssm.26.candidate" : 0.06735013425350189,
    "rollback-1.ssm.26.control" : 0.07511690258979797,
    "rollback-1.ssm.28.candidate" : 0.005718914791941643,
    "rollback-1.ssm.28.control" : 0.003858801908791065,
    "rollback-1.ssm.29.candidate" : 0.0734945684671402,
    "rollback-1.ssm.29.control" : 0.04648992046713829,
    "rollback-1.ssm.30.candidate" : 0.0782640129327774,
    "rollback-1.ssm.30.control" : 0.051631566137075424,
    "rollback-1.ssm.32.candidate" : 0.10934899002313614,
    "rollback-1.ssm.32.control" : 0.08469836413860321,
    "rollback-1.ssm.33.candidate" : 0.11010350286960602,
    "rollback-1.ssm.33.control" : 0.163725346326828,
    "rollback-1.ssm.34.candidate" : 0.11408638209104538,
    "rollback-1.ssm.34.control" : 0.12615029513835907,
    "rollback-1.ssm.36.candidate" : 0.06264747679233551,
    "rollback-1.ssm.36.control" : 0.05243952199816704,
    "rollback-1.ssm.37.candidate" : 0.03877394646406174,
    "rollback-1.ssm.37.control" : 0.03943127393722534,
    "rollback-1.ssm.38.candidate" : 0.036271724849939346,
    "rollback-1.ssm.38.control" : 0.015095353126525879,
    "rollback-1.ssm.4.candidate" : 0.027676237747073174,
    "rollback-1.ssm.4.control" : 0,
    "rollback-1.ssm.40.candidate" : 0.027333775535225868,
    "rollback-1.ssm.40.control" : 0.01798965595662594,
    "rollback-1.ssm.41.candidate" : 0.04318850859999657,
    "rollback-1.ssm.41.control" : 0.022502552717924118,
    "rollback-1.ssm.42.candidate" : 0.053795598447322845,
    "rollback-1.ssm.42.control" : 0.0503694973886013,
    "rollback-1.ssm.44.candidate" : 0.05585697665810585,
    "rollback-1.ssm.44.control" : 0.015842685475945473,
    "rollback-1.ssm.45.candidate" : 0.16735441982746124,
    "rollback-1.ssm.45.control" : 0.12245684117078781,
    "rollback-1.ssm.46.candidate" : 0.1317165046930313,
    "rollback-1.ssm.46.control" : 0.128029465675354,
    "rollback-1.ssm.5.candidate" : 0.02331717498600483,
    "rollback-1.ssm.5.control" : 0,
    "rollback-1.ssm.6.candidate" : 0.022029316052794456,
    "rollback-1.ssm.6.control" : 0,
    "rollback-1.ssm.8.candidate" : 0.011439108289778233,
    "rollback-1.ssm.8.control" : 0,
    "rollback-1.ssm.9.candidate" : 0.03564690798521042,
    "rollback-1.ssm.9.control" : 0,
    "rollback-1.value.11.candidate" : 0.02675359696149826,
    "rollback-1.value.11.control" : 0,
    "rollback-1.value.15.candidate" : 0.02838645502924919,
    "rollback-1.value.15.control" : 0.009213147684931755,
    "rollback-1.value.19.candidate" : 0.027551019564270973,
    "rollback-1.value.19.control" : 0.012519929558038712,
    "rollback-1.value.23.candidate" : 0.044186048209667206,
    "rollback-1.value.23.control" : 0.0417151153087616,
    "rollback-1.value.27.candidate" : 0.016348885372281075,
    "rollback-1.value.27.control" : 0.014546001330018044,
    "rollback-1.value.3.candidate" : 0.05281690135598183,
    "rollback-1.value.3.control" : 0,
    "rollback-1.value.31.candidate" : 0.07010869681835175,
    "rollback-1.value.31.control" : 0.072826087474823,
    "rollback-1.value.35.candidate" : 0.10009057819843292,
    "rollback-1.value.35.control" : 0.06159420311450958,
    "rollback-1.value.39.candidate" : 0.37142857909202576,
    "rollback-1.value.39.control" : 0.0494791679084301,
    "rollback-1.value.43.candidate" : 0.06839622557163239,
    "rollback-1.value.43.control" : 0.04088050499558449,
    "rollback-1.value.47.candidate" : 0.3460365831851959,
    "rollback-1.value.47.control" : 0.20636433362960815,
    "rollback-1.value.7.candidate" : 0.025542665272951126,
    "rollback-1.value.7.control" : 0,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0.02063106745481491,
    "rollback-2.conv.10.control" : 0,
    "rollback-2.conv.12.candidate" : 0.022141335532069206,
    "rollback-2.conv.12.control" : 0,
    "rollback-2.conv.13.candidate" : 0.029985548928380013,
    "rollback-2.conv.13.control" : 0,
    "rollback-2.conv.14.candidate" : 0.033453524112701416,
    "rollback-2.conv.14.control" : 0.010256410576403141,
    "rollback-2.conv.16.candidate" : 0.037128712981939316,
    "rollback-2.conv.16.control" : 0.012995049357414246,
    "rollback-2.conv.17.candidate" : 0.05283505097031593,
    "rollback-2.conv.17.control" : 0.01663176529109478,
    "rollback-2.conv.18.candidate" : 0.03306934982538223,
    "rollback-2.conv.18.control" : 0.01198630128055811,
    "rollback-2.conv.2.candidate" : 0.014492753893136978,
    "rollback-2.conv.2.control" : 0,
    "rollback-2.conv.20.candidate" : 0.0659203976392746,
    "rollback-2.conv.20.control" : 0.019900497049093246,
    "rollback-2.conv.21.candidate" : 0.04047619178891182,
    "rollback-2.conv.21.control" : 0.01904761977493763,
    "rollback-2.conv.22.candidate" : 0.01839539036154747,
    "rollback-2.conv.22.control" : 0.009807180613279343,
    "rollback-2.conv.24.candidate" : 0.03257978707551956,
    "rollback-2.conv.24.control" : 0.019946807995438576,
    "rollback-2.conv.25.candidate" : 0.04146919399499893,
    "rollback-2.conv.25.control" : 0.02769549749791622,
    "rollback-2.conv.26.candidate" : 0.03891509398818016,
    "rollback-2.conv.26.control" : 0.017688678577542305,
    "rollback-2.conv.28.candidate" : 0.04780876636505127,
    "rollback-2.conv.28.control" : 0.03959163278341293,
    "rollback-2.conv.29.candidate" : 0.0730447992682457,
    "rollback-2.conv.29.control" : 0.05319149047136307,
    "rollback-2.conv.30.candidate" : 0.07716836780309677,
    "rollback-2.conv.30.control" : 0.05484693869948387,
    "rollback-2.conv.32.candidate" : 0.07416267693042755,
    "rollback-2.conv.32.control" : 0.08133970946073532,
    "rollback-2.conv.33.candidate" : 0.09090909361839294,
    "rollback-2.conv.33.control" : 0.05978260934352875,
    "rollback-2.conv.34.candidate" : 0.07805676758289337,
    "rollback-2.conv.34.control" : 0.0589519664645195,
    "rollback-2.conv.36.candidate" : 0.10914634168148041,
    "rollback-2.conv.36.control" : 0.1024390235543251,
    "rollback-2.conv.37.candidate" : 0.07685630023479462,
    "rollback-2.conv.37.control" : 0.048277243971824646,
    "rollback-2.conv.38.candidate" : 0.06060606241226196,
    "rollback-2.conv.38.control" : 0.04308712109923363,
    "rollback-2.conv.4.candidate" : 0.017022358253598213,
    "rollback-2.conv.4.control" : 0,
    "rollback-2.conv.40.candidate" : 0.08214285969734192,
    "rollback-2.conv.40.control" : 0.0535714291036129,
    "rollback-2.conv.41.candidate" : 0.08016826957464218,
    "rollback-2.conv.41.control" : 0.057692307978868484,
    "rollback-2.conv.42.candidate" : 0.07906879484653473,
    "rollback-2.conv.42.control" : 0.04739932715892792,
    "rollback-2.conv.44.candidate" : 0.08641975373029709,
    "rollback-2.conv.44.control" : 0.1358024626970291,
    "rollback-2.conv.45.candidate" : 0.11734694242477417,
    "rollback-2.conv.45.control" : 0.06568877398967743,
    "rollback-2.conv.46.candidate" : 0.05710078403353691,
    "rollback-2.conv.46.control" : 0.054973822087049484,
    "rollback-2.conv.5.candidate" : 0.020038167014718056,
    "rollback-2.conv.5.control" : 0,
    "rollback-2.conv.6.candidate" : 0.02415458858013153,
    "rollback-2.conv.6.control" : 0,
    "rollback-2.conv.8.candidate" : 0.02415458858013153,
    "rollback-2.conv.8.control" : 0,
    "rollback-2.conv.9.candidate" : 0.024861877784132957,
    "rollback-2.conv.9.control" : 0,
    "rollback-2.index.11.candidate" : 0.03375771641731262,
    "rollback-2.index.11.control" : 0,
    "rollback-2.index.15.candidate" : 0.060393258929252625,
    "rollback-2.index.15.control" : 0.01755617931485176,
    "rollback-2.index.19.candidate" : 0.052226025611162186,
    "rollback-2.index.19.control" : 0.027397260069847107,
    "rollback-2.index.23.candidate" : 0.03169642761349678,
    "rollback-2.index.23.control" : 0.02276785671710968,
    "rollback-2.index.27.candidate" : 0.048344679176807404,
    "rollback-2.index.27.control" : 0.037128712981939316,
    "rollback-2.index.3.candidate" : 0.039016272872686386,
    "rollback-2.index.3.control" : 0,
    "rollback-2.index.31.candidate" : 0.16480809450149536,
    "rollback-2.index.31.control" : 0.19605809450149536,
    "rollback-2.index.35.candidate" : 0.15728476643562317,
    "rollback-2.index.35.control" : 0.11423841118812561,
    "rollback-2.index.39.candidate" : 0.3734177350997925,
    "rollback-2.index.39.control" : 0.04628164693713188,
    "rollback-2.index.43.candidate" : 0.20000000298023224,
    "rollback-2.index.43.control" : 0.04707031324505806,
    "rollback-2.index.47.candidate" : 0.14541666209697723,
    "rollback-2.index.47.control" : 0.10187499970197678,
    "rollback-2.index.7.candidate" : 0.0380859375,
    "rollback-2.index.7.control" : 0,
    "rollback-2.key.11.candidate" : 0.09807692468166351,
    "rollback-2.key.11.control" : 0,
    "rollback-2.key.15.candidate" : 0.08211679011583328,
    "rollback-2.key.15.control" : 0.031934306025505066,
    "rollback-2.key.19.candidate" : 0.11603008955717087,
    "rollback-2.key.19.control" : 0.05613425746560097,
    "rollback-2.key.23.candidate" : 0.07281249761581421,
    "rollback-2.key.23.control" : 0.06541666388511658,
    "rollback-2.key.27.candidate" : 0.12828947603702545,
    "rollback-2.key.27.control" : 0.10896381735801697,
    "rollback-2.key.3.candidate" : 0.06392766535282135,
    "rollback-2.key.3.control" : 0,
    "rollback-2.key.31.candidate" : 0.17743287980556488,
    "rollback-2.key.31.control" : 0.14901426434516907,
    "rollback-2.key.35.candidate" : 0.20423229038715363,
    "rollback-2.key.35.control" : 0.16338582336902618,
    "rollback-2.key.39.candidate" : 0.34687501192092896,
    "rollback-2.key.39.control" : 0.08671875298023224,
    "rollback-2.key.43.candidate" : 0.13605442643165588,
    "rollback-2.key.43.control" : 0.07823128998279572,
    "rollback-2.key.47.candidate" : 0.17078189551830292,
    "rollback-2.key.47.control" : 0.09786522388458252,
    "rollback-2.key.7.candidate" : 0.08842329680919647,
    "rollback-2.key.7.control" : 0,
    "rollback-2.logits.candidate" : 0.05760038271546364,
    "rollback-2.logits.control" : 0.05688336491584778,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0.00022035467554815114,
    "rollback-2.ssm.1.control" : 0,
    "rollback-2.ssm.10.candidate" : 0.04976879432797432,
    "rollback-2.ssm.10.control" : 0,
    "rollback-2.ssm.12.candidate" : 0.007531893905252218,
    "rollback-2.ssm.12.control" : 0,
    "rollback-2.ssm.13.candidate" : 0.02917228825390339,
    "rollback-2.ssm.13.control" : 0.0002791119331959635,
    "rollback-2.ssm.14.candidate" : 0.011021026410162449,
    "rollback-2.ssm.14.control" : 0.0048773935995996,
    "rollback-2.ssm.16.candidate" : 0.030397653579711914,
    "rollback-2.ssm.16.control" : 0.010922309011220932,
    "rollback-2.ssm.17.candidate" : 0.040083881467580795,
    "rollback-2.ssm.17.control" : 0.013563264161348343,
    "rollback-2.ssm.18.candidate" : 0.06462310254573822,
    "rollback-2.ssm.18.control" : 0.013371502049267292,
    "rollback-2.ssm.2.candidate" : 0.00656009279191494,
    "rollback-2.ssm.2.control" : 0,
    "rollback-2.ssm.20.candidate" : 0.029753675684332848,
    "rollback-2.ssm.20.control" : 0.00973447598516941,
    "rollback-2.ssm.21.candidate" : 0.01114813331514597,
    "rollback-2.ssm.21.control" : 0.012765606865286827,
    "rollback-2.ssm.22.candidate" : 0.010574489831924438,
    "rollback-2.ssm.22.control" : 0.0044365995563566685,
    "rollback-2.ssm.24.candidate" : 0.028513045981526375,
    "rollback-2.ssm.24.control" : 0.014221612364053726,
    "rollback-2.ssm.25.candidate" : 0.05487623065710068,
    "rollback-2.ssm.25.control" : 0.03429656848311424,
    "rollback-2.ssm.26.candidate" : 0.06709060072898865,
    "rollback-2.ssm.26.control" : 0.05921730399131775,
    "rollback-2.ssm.28.candidate" : 0.0057604932226240635,
    "rollback-2.ssm.28.control" : 0.0024056602269411087,
    "rollback-2.ssm.29.candidate" : 0.06991129368543625,
    "rollback-2.ssm.29.control" : 0.04527357220649719,
    "rollback-2.ssm.30.candidate" : 0.05339575186371803,
    "rollback-2.ssm.30.control" : 0.037865109741687775,
    "rollback-2.ssm.32.candidate" : 0.05598707124590874,
    "rollback-2.ssm.32.control" : 0.05244925990700722,
    "rollback-2.ssm.33.candidate" : 0.1648891419172287,
    "rollback-2.ssm.33.control" : 0.09059132635593414,
    "rollback-2.ssm.34.candidate" : 0.12420657277107239,
    "rollback-2.ssm.34.control" : 0.07004349678754807,
    "rollback-2.ssm.36.candidate" : 0.04949170723557472,
    "rollback-2.ssm.36.control" : 0.03718012571334839,
    "rollback-2.ssm.37.candidate" : 0.0911221131682396,
    "rollback-2.ssm.37.control" : 0.0559813566505909,
    "rollback-2.ssm.38.candidate" : 0.03620274364948273,
    "rollback-2.ssm.38.control" : 0.01301589421927929,
    "rollback-2.ssm.4.candidate" : 0.015629971399903297,
    "rollback-2.ssm.4.control" : 0,
    "rollback-2.ssm.40.candidate" : 0.0271285567432642,
    "rollback-2.ssm.40.control" : 0.019173989072442055,
    "rollback-2.ssm.41.candidate" : 0.04357665404677391,
    "rollback-2.ssm.41.control" : 0.021716510877013206,
    "rollback-2.ssm.42.candidate" : 0.03330953046679497,
    "rollback-2.ssm.42.control" : 0.029392121359705925,
    "rollback-2.ssm.44.candidate" : 0.05587245151400566,
    "rollback-2.ssm.44.control" : 0.015560891479253769,
    "rollback-2.ssm.45.candidate" : 0.153389111161232,
    "rollback-2.ssm.45.control" : 0.06941861659288406,
    "rollback-2.ssm.46.candidate" : 0.13396522402763367,
    "rollback-2.ssm.46.control" : 0.13302038609981537,
    "rollback-2.ssm.5.candidate" : 0.011673727072775364,
    "rollback-2.ssm.5.control" : 0,
    "rollback-2.ssm.6.candidate" : 0.013440924696624279,
    "rollback-2.ssm.6.control" : 0,
    "rollback-2.ssm.8.candidate" : 0.011615714058279991,
    "rollback-2.ssm.8.control" : 0,
    "rollback-2.ssm.9.candidate" : 0.022985313087701797,
    "rollback-2.ssm.9.control" : 0,
    "rollback-2.value.11.candidate" : 0.02675359696149826,
    "rollback-2.value.11.control" : 0,
    "rollback-2.value.15.candidate" : 0.02838645502924919,
    "rollback-2.value.15.control" : 0.009213147684931755,
    "rollback-2.value.19.candidate" : 0.027551019564270973,
    "rollback-2.value.19.control" : 0.012519929558038712,
    "rollback-2.value.23.candidate" : 0.044186048209667206,
    "rollback-2.value.23.control" : 0.0417151153087616,
    "rollback-2.value.27.candidate" : 0.016348885372281075,
    "rollback-2.value.27.control" : 0.014546001330018044,
    "rollback-2.value.3.candidate" : 0.05281690135598183,
    "rollback-2.value.3.control" : 0,
    "rollback-2.value.31.candidate" : 0.07010869681835175,
    "rollback-2.value.31.control" : 0.072826087474823,
    "rollback-2.value.35.candidate" : 0.10009057819843292,
    "rollback-2.value.35.control" : 0.06159420311450958,
    "rollback-2.value.39.candidate" : 0.37142857909202576,
    "rollback-2.value.39.control" : 0.0494791679084301,
    "rollback-2.value.43.candidate" : 0.06839622557163239,
    "rollback-2.value.43.control" : 0.04088050499558449,
    "rollback-2.value.47.candidate" : 0.3460365831851959,
    "rollback-2.value.47.control" : 0.20636433362960815,
    "rollback-2.value.7.candidate" : 0.025542665272951126,
    "rollback-2.value.7.control" : 0,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0.02063106745481491,
    "rollback-3.conv.10.control" : 0,
    "rollback-3.conv.12.candidate" : 0.013636363670229912,
    "rollback-3.conv.12.control" : 0,
    "rollback-3.conv.13.candidate" : 0.01990223489701748,
    "rollback-3.conv.13.control" : 0,
    "rollback-3.conv.14.candidate" : 0.020512821152806282,
    "rollback-3.conv.14.control" : 0.010256410576403141,
    "rollback-3.conv.16.candidate" : 0.0269183162599802,
    "rollback-3.conv.16.control" : 0.015470297075808048,
    "rollback-3.conv.17.candidate" : 0.027202071622014046,
    "rollback-3.conv.17.control" : 0.01683937758207321,
    "rollback-3.conv.18.candidate" : 0.02054794505238533,
    "rollback-3.conv.18.control" : 0.021029537543654442,
    "rollback-3.conv.2.candidate" : 0.014492753893136978,
    "rollback-3.conv.2.control" : 0,
    "rollback-3.conv.20.candidate" : 0.03233831003308296,
    "rollback-3.conv.20.control" : 0.04042288661003113,
    "rollback-3.conv.21.candidate" : 0.0316985659301281,
    "rollback-3.conv.21.control" : 0.025119617581367493,
    "rollback-3.conv.22.candidate" : 0.015070921741425991,
    "rollback-3.conv.22.control" : 0.016400709748268127,
    "rollback-3.conv.24.candidate" : 0.03910614550113678,
    "rollback-3.conv.24.control" : 0.03072625771164894,
    "rollback-3.conv.25.candidate" : 0.0513392873108387,
    "rollback-3.conv.25.control" : 0.03928571566939354,
    "rollback-3.conv.26.candidate" : 0.044811319559812546,
    "rollback-3.conv.26.control" : 0.041347287595272064,
    "rollback-3.conv.28.candidate" : 0.04432271048426628,
    "rollback-3.conv.28.control" : 0.03187251091003418,
    "rollback-3.conv.29.candidate" : 0.07377049326896667,
    "rollback-3.conv.29.control" : 0.048497267067432404,
    "rollback-3.conv.30.candidate" : 0.06760203838348389,
    "rollback-3.conv.30.control" : 0.04950574040412903,
    "rollback-3.conv.32.candidate" : 0.07286729663610458,
    "rollback-3.conv.32.control" : 0.0758293867111206,
    "rollback-3.conv.33.candidate" : 0.06875000149011612,
    "rollback-3.conv.33.control" : 0.07890625298023224,
    "rollback-3.conv.34.candidate" : 0.07457983493804932,
    "rollback-3.conv.34.control" : 0.05567226931452751,
    "rollback-3.conv.36.candidate" : 0.08894230425357819,
    "rollback-3.conv.36.control" : 0.10096153616905212,
    "rollback-3.conv.37.candidate" : 0.061965811997652054,
    "rollback-3.conv.37.control" : 0.09401709586381912,
    "rollback-3.conv.38.candidate" : 0.06060606241226196,
    "rollback-3.conv.38.control" : 0.035606060177087784,
    "rollback-3.conv.4.candidate" : 0.018877550959587097,
    "rollback-3.conv.4.control" : 0,
    "rollback-3.conv.40.candidate" : 0.08392857015132904,
    "rollback-3.conv.40.control" : 0.07500000298023224,
    "rollback-3.conv.41.candidate" : 0.11307252198457718,
    "rollback-3.conv.41.control" : 0.05057251825928688,
    "rollback-3.conv.42.candidate" : 0.056679949164390564,
    "rollback-3.conv.42.control" : 0.05180368945002556,
    "rollback-3.conv.44.candidate" : 0.0694444477558136,
    "rollback-3.conv.44.control" : 0.1358024626970291,
    "rollback-3.conv.45.candidate" : 0.0485139861702919,
    "rollback-3.conv.45.control" : 0.03496503457427025,
    "rollback-3.conv.46.candidate" : 0.054973822087049484,
    "rollback-3.conv.46.control" : 0.0445026196539402,
    "rollback-3.conv.5.candidate" : 0.020038167014718056,
    "rollback-3.conv.5.control" : 0,
    "rollback-3.conv.6.candidate" : 0.011961722746491432,
    "rollback-3.conv.6.control" : 0,
    "rollback-3.conv.8.candidate" : 0.015847155824303627,
    "rollback-3.conv.8.control" : 0,
    "rollback-3.conv.9.candidate" : 0.0191256832331419,
    "rollback-3.conv.9.control" : 0,
    "rollback-3.index.11.candidate" : 0.03375771641731262,
    "rollback-3.index.11.control" : 0,
    "rollback-3.index.15.candidate" : 0.060393258929252625,
    "rollback-3.index.15.control" : 0.01755617931485176,
    "rollback-3.index.19.candidate" : 0.052226025611162186,
    "rollback-3.index.19.control" : 0.027397260069847107,
    "rollback-3.index.23.candidate" : 0.03169642761349678,
    "rollback-3.index.23.control" : 0.02276785671710968,
    "rollback-3.index.27.candidate" : 0.048344679176807404,
    "rollback-3.index.27.control" : 0.037128712981939316,
    "rollback-3.index.3.candidate" : 0.039016272872686386,
    "rollback-3.index.3.control" : 0,
    "rollback-3.index.31.candidate" : 0.16480809450149536,
    "rollback-3.index.31.control" : 0.19605809450149536,
    "rollback-3.index.35.candidate" : 0.15728476643562317,
    "rollback-3.index.35.control" : 0.11423841118812561,
    "rollback-3.index.39.candidate" : 0.3734177350997925,
    "rollback-3.index.39.control" : 0.04628164693713188,
    "rollback-3.index.43.candidate" : 0.20000000298023224,
    "rollback-3.index.43.control" : 0.04707031324505806,
    "rollback-3.index.47.candidate" : 0.14541666209697723,
    "rollback-3.index.47.control" : 0.10187499970197678,
    "rollback-3.index.7.candidate" : 0.0380859375,
    "rollback-3.index.7.control" : 0,
    "rollback-3.key.11.candidate" : 0.09807692468166351,
    "rollback-3.key.11.control" : 0,
    "rollback-3.key.15.candidate" : 0.08211679011583328,
    "rollback-3.key.15.control" : 0.031934306025505066,
    "rollback-3.key.19.candidate" : 0.11603008955717087,
    "rollback-3.key.19.control" : 0.05613425746560097,
    "rollback-3.key.23.candidate" : 0.07281249761581421,
    "rollback-3.key.23.control" : 0.06541666388511658,
    "rollback-3.key.27.candidate" : 0.12828947603702545,
    "rollback-3.key.27.control" : 0.10896381735801697,
    "rollback-3.key.3.candidate" : 0.06392766535282135,
    "rollback-3.key.3.control" : 0,
    "rollback-3.key.31.candidate" : 0.17743287980556488,
    "rollback-3.key.31.control" : 0.14901426434516907,
    "rollback-3.key.35.candidate" : 0.20423229038715363,
    "rollback-3.key.35.control" : 0.16338582336902618,
    "rollback-3.key.39.candidate" : 0.34687501192092896,
    "rollback-3.key.39.control" : 0.08671875298023224,
    "rollback-3.key.43.candidate" : 0.13605442643165588,
    "rollback-3.key.43.control" : 0.07823128998279572,
    "rollback-3.key.47.candidate" : 0.17078189551830292,
    "rollback-3.key.47.control" : 0.09786522388458252,
    "rollback-3.key.7.candidate" : 0.08842329680919647,
    "rollback-3.key.7.control" : 0,
    "rollback-3.logits.candidate" : 0.09054326266050339,
    "rollback-3.logits.control" : 0.06941650062799454,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0.00022005180653650314,
    "rollback-3.ssm.1.control" : 0,
    "rollback-3.ssm.10.candidate" : 0.037716273218393326,
    "rollback-3.ssm.10.control" : 0,
    "rollback-3.ssm.12.candidate" : 0.0028503944631665945,
    "rollback-3.ssm.12.control" : 0,
    "rollback-3.ssm.13.candidate" : 0.011382192373275757,
    "rollback-3.ssm.13.control" : 0.0002753961889538914,
    "rollback-3.ssm.14.candidate" : 0.008471187204122543,
    "rollback-3.ssm.14.control" : 0.007244178093969822,
    "rollback-3.ssm.16.candidate" : 0.031020838767290115,
    "rollback-3.ssm.16.control" : 0.013954143971204758,
    "rollback-3.ssm.17.candidate" : 0.02512381412088871,
    "rollback-3.ssm.17.control" : 0.02861716039478779,
    "rollback-3.ssm.18.candidate" : 0.02704412303864956,
    "rollback-3.ssm.18.control" : 0.04236041009426117,
    "rollback-3.ssm.2.candidate" : 0.010552360676229,
    "rollback-3.ssm.2.control" : 0,
    "rollback-3.ssm.20.candidate" : 0.03103449009358883,
    "rollback-3.ssm.20.control" : 0.021035408601164818,
    "rollback-3.ssm.21.candidate" : 0.014405927620828152,
    "rollback-3.ssm.21.control" : 0.012942383997142315,
    "rollback-3.ssm.22.candidate" : 0.01054859347641468,
    "rollback-3.ssm.22.control" : 0.004294726997613907,
    "rollback-3.ssm.24.candidate" : 0.029721833765506744,
    "rollback-3.ssm.24.control" : 0.014817526564002037,
    "rollback-3.ssm.25.candidate" : 0.06488820165395737,
    "rollback-3.ssm.25.control" : 0.06067748740315437,
    "rollback-3.ssm.26.candidate" : 0.16873550415039062,
    "rollback-3.ssm.26.control" : 0.09641925990581512,
    "rollback-3.ssm.28.candidate" : 0.005748011637479067,
    "rollback-3.ssm.28.control" : 0.003989783581346273,
    "rollback-3.ssm.29.candidate" : 0.06450416892766953,
    "rollback-3.ssm.29.control" : 0.061760202050209045,
    "rollback-3.ssm.30.candidate" : 0.052931856364011765,
    "rollback-3.ssm.30.control" : 0.04147869721055031,
    "rollback-3.ssm.32.candidate" : 0.06444850564002991,
    "rollback-3.ssm.32.control" : 0.07607626914978027,
    "rollback-3.ssm.33.candidate" : 0.16585339605808258,
    "rollback-3.ssm.33.control" : 0.15820598602294922,
    "rollback-3.ssm.34.candidate" : 0.17870517075061798,
    "rollback-3.ssm.34.control" : 0.13165420293807983,
    "rollback-3.ssm.36.candidate" : 0.05873214453458786,
    "rollback-3.ssm.36.control" : 0.08035723119974136,
    "rollback-3.ssm.37.candidate" : 0.07160476595163345,
    "rollback-3.ssm.37.control" : 0.07587326318025589,
    "rollback-3.ssm.38.candidate" : 0.03600247576832771,
    "rollback-3.ssm.38.control" : 0.0154428631067276,
    "rollback-3.ssm.4.candidate" : 0.01573658362030983,
    "rollback-3.ssm.4.control" : 0,
    "rollback-3.ssm.40.candidate" : 0.026917122304439545,
    "rollback-3.ssm.40.control" : 0.025110634043812752,
    "rollback-3.ssm.41.candidate" : 0.04336671158671379,
    "rollback-3.ssm.41.control" : 0.02152792364358902,
    "rollback-3.ssm.42.candidate" : 0.07380840927362442,
    "rollback-3.ssm.42.control" : 0.034233737736940384,
    "rollback-3.ssm.44.candidate" : 0.05594931170344353,
    "rollback-3.ssm.44.control" : 0.015147016383707523,
    "rollback-3.ssm.45.candidate" : 0.16317766904830933,
    "rollback-3.ssm.45.control" : 0.092524953186512,
    "rollback-3.ssm.46.candidate" : 0.12480129301548004,
    "rollback-3.ssm.46.control" : 0.13415981829166412,
    "rollback-3.ssm.5.candidate" : 0.014982068911194801,
    "rollback-3.ssm.5.control" : 0,
    "rollback-3.ssm.6.candidate" : 0.013284913264214993,
    "rollback-3.ssm.6.control" : 0,
    "rollback-3.ssm.8.candidate" : 0.011575940065085888,
    "rollback-3.ssm.8.control" : 0,
    "rollback-3.ssm.9.candidate" : 0.023784758523106575,
    "rollback-3.ssm.9.control" : 0,
    "rollback-3.value.11.candidate" : 0.02675359696149826,
    "rollback-3.value.11.control" : 0,
    "rollback-3.value.15.candidate" : 0.02838645502924919,
    "rollback-3.value.15.control" : 0.009213147684931755,
    "rollback-3.value.19.candidate" : 0.027551019564270973,
    "rollback-3.value.19.control" : 0.012519929558038712,
    "rollback-3.value.23.candidate" : 0.044186048209667206,
    "rollback-3.value.23.control" : 0.0417151153087616,
    "rollback-3.value.27.candidate" : 0.016348885372281075,
    "rollback-3.value.27.control" : 0.014546001330018044,
    "rollback-3.value.3.candidate" : 0.05281690135598183,
    "rollback-3.value.3.control" : 0,
    "rollback-3.value.31.candidate" : 0.07010869681835175,
    "rollback-3.value.31.control" : 0.072826087474823,
    "rollback-3.value.35.candidate" : 0.10009057819843292,
    "rollback-3.value.35.control" : 0.06159420311450958,
    "rollback-3.value.39.candidate" : 0.37142857909202576,
    "rollback-3.value.39.control" : 0.0494791679084301,
    "rollback-3.value.43.candidate" : 0.06839622557163239,
    "rollback-3.value.43.control" : 0.04088050499558449,
    "rollback-3.value.47.candidate" : 0.3460365831851959,
    "rollback-3.value.47.control" : 0.20636433362960815,
    "rollback-3.value.7.candidate" : 0.025542665272951126,
    "rollback-3.value.7.control" : 0,
    "routing.candidate" : 0.05406957928802589,
    "routing.control" : 0.022079288025889966,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-64-swept",
  "passed" : false
}

````

## small64-swept-7/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## components-9/stdout.txt

SHA-256 `8d069ba6bb359375ac09d35365bdb71e117af667f6c65a97638d32333a32092e`; 10469 bytes.

````text
{
  "items" : [
    {
      "name" : "256: exact committed count",
      "passed" : true
    },
    {
      "name" : "512: exact committed count",
      "passed" : true
    },
    {
      "name" : "64: exact committed count",
      "passed" : true
    },
    {
      "name" : "0.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "0.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "0.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "1.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "1.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "2.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "2.x2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.attn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.attn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.hAfterAttn.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.hAfterAttn.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.inj1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.inj1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.inj2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.inj2.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.moe.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.moe.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.x1.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.x1.arm2: finite",
      "passed" : true
    },
    {
      "name" : "3.x2.arm1: finite",
      "passed" : true
    },
    {
      "name" : "3.x2.arm2: finite",
      "passed" : true
    }
  ],
  "measurements" : {
    "0.attn.arm1.different" : 0,
    "0.attn.arm1.first_row" : -1,
    "0.attn.arm1.relative" : 0,
    "0.attn.arm2.different" : 0,
    "0.attn.arm2.first_row" : -1,
    "0.attn.arm2.relative" : 0,
    "0.hAfterAttn.arm1.different" : 0,
    "0.hAfterAttn.arm1.first_row" : -1,
    "0.hAfterAttn.arm1.relative" : 0,
    "0.hAfterAttn.arm2.different" : 0,
    "0.hAfterAttn.arm2.first_row" : -1,
    "0.hAfterAttn.arm2.relative" : 0,
    "0.inj1.arm1.different" : 0,
    "0.inj1.arm1.first_row" : -1,
    "0.inj1.arm1.relative" : 0,
    "0.inj1.arm2.different" : 0,
    "0.inj1.arm2.first_row" : -1,
    "0.inj1.arm2.relative" : 0,
    "0.inj2.arm1.different" : 0,
    "0.inj2.arm1.first_row" : -1,
    "0.inj2.arm1.relative" : 0,
    "0.inj2.arm2.different" : 0,
    "0.inj2.arm2.first_row" : -1,
    "0.inj2.arm2.relative" : 0,
    "0.moe.arm1.different" : 0,
    "0.moe.arm1.first_row" : -1,
    "0.moe.arm1.relative" : 0,
    "0.moe.arm2.different" : 181,
    "0.moe.arm2.first_row" : 4,
    "0.moe.arm2.relative" : 0.0004006410308647901,
    "0.x1.arm1.different" : 0,
    "0.x1.arm1.first_row" : -1,
    "0.x1.arm1.relative" : 0,
    "0.x1.arm2.different" : 0,
    "0.x1.arm2.first_row" : -1,
    "0.x1.arm2.relative" : 0,
    "0.x2.arm1.different" : 0,
    "0.x2.arm1.first_row" : -1,
    "0.x2.arm1.relative" : 0,
    "0.x2.arm2.different" : 0,
    "0.x2.arm2.first_row" : -1,
    "0.x2.arm2.relative" : 0,
    "1.attn.arm1.different" : 0,
    "1.attn.arm1.first_row" : -1,
    "1.attn.arm1.relative" : 0,
    "1.attn.arm2.different" : 387559,
    "1.attn.arm2.first_row" : 6,
    "1.attn.arm2.relative" : 0.0035211266949772835,
    "1.hAfterAttn.arm1.different" : 0,
    "1.hAfterAttn.arm1.first_row" : -1,
    "1.hAfterAttn.arm1.relative" : 0,
    "1.hAfterAttn.arm2.different" : 298983,
    "1.hAfterAttn.arm2.first_row" : 5,
    "1.hAfterAttn.arm2.relative" : 0.0015060240402817726,
    "1.inj1.arm1.different" : 0,
    "1.inj1.arm1.first_row" : -1,
    "1.inj1.arm1.relative" : 0,
    "1.inj1.arm2.different" : 0,
    "1.inj1.arm2.first_row" : -1,
    "1.inj1.arm2.relative" : 0,
    "1.inj2.arm1.different" : 0,
    "1.inj2.arm1.first_row" : -1,
    "1.inj2.arm1.relative" : 0,
    "1.inj2.arm2.different" : 114,
    "1.inj2.arm2.first_row" : 9,
    "1.inj2.arm2.relative" : 0.005681818351149559,
    "1.moe.arm1.different" : 0,
    "1.moe.arm1.first_row" : -1,
    "1.moe.arm1.relative" : 0,
    "1.moe.arm2.different" : 851395,
    "1.moe.arm2.first_row" : 1,
    "1.moe.arm2.relative" : 0.05115445703268051,
    "1.x1.arm1.different" : 0,
    "1.x1.arm1.first_row" : -1,
    "1.x1.arm1.relative" : 0,
    "1.x1.arm2.different" : 2277,
    "1.x1.arm2.first_row" : 6,
    "1.x1.arm2.relative" : 0.0027624310459941626,
    "1.x2.arm1.different" : 0,
    "1.x2.arm1.first_row" : -1,
    "1.x2.arm1.relative" : 0,
    "1.x2.arm2.different" : 274577,
    "1.x2.arm2.first_row" : 5,
    "1.x2.arm2.relative" : 0.07772020995616913,
    "2.attn.arm1.different" : 0,
    "2.attn.arm1.first_row" : -1,
    "2.attn.arm1.relative" : 0,
    "2.attn.arm2.different" : 1031841,
    "2.attn.arm2.first_row" : 1,
    "2.attn.arm2.relative" : 0.013681592419743538,
    "2.hAfterAttn.arm1.different" : 0,
    "2.hAfterAttn.arm1.first_row" : -1,
    "2.hAfterAttn.arm1.relative" : 0,
    "2.hAfterAttn.arm2.different" : 1584869,
    "2.hAfterAttn.arm2.first_row" : 1,
    "2.hAfterAttn.arm2.relative" : 0.011106927879154682,
    "2.inj1.arm1.different" : 0,
    "2.inj1.arm1.first_row" : -1,
    "2.inj1.arm1.relative" : 0,
    "2.inj1.arm2.different" : 87,
    "2.inj1.arm2.first_row" : 6,
    "2.inj1.arm2.relative" : 0.010416666977107525,
    "2.inj2.arm1.different" : 0,
    "2.inj2.arm1.first_row" : -1,
    "2.inj2.arm1.relative" : 0,
    "2.inj2.arm2.different" : 327,
    "2.inj2.arm2.first_row" : 2,
    "2.inj2.arm2.relative" : 0.014150943607091904,
    "2.moe.arm1.different" : 0,
    "2.moe.arm1.first_row" : -1,
    "2.moe.arm1.relative" : 0,
    "2.moe.arm2.different" : 980332,
    "2.moe.arm2.first_row" : 1,
    "2.moe.arm2.relative" : 0.06030701845884323,
    "2.x1.arm1.different" : 0,
    "2.x1.arm1.first_row" : -1,
    "2.x1.arm1.relative" : 0,
    "2.x1.arm2.different" : 601889,
    "2.x1.arm2.first_row" : 1,
    "2.x1.arm2.relative" : 0.07922535389661789,
    "2.x2.arm1.different" : 0,
    "2.x2.arm1.first_row" : -1,
    "2.x2.arm1.relative" : 0,
    "2.x2.arm2.different" : 757786,
    "2.x2.arm2.first_row" : 1,
    "2.x2.arm2.relative" : 0.04516806825995445,
    "3.attn.arm1.different" : 0,
    "3.attn.arm1.first_row" : -1,
    "3.attn.arm1.relative" : 0,
    "3.attn.arm2.different" : 1114510,
    "3.attn.arm2.first_row" : 1,
    "3.attn.arm2.relative" : 0.030241934582591057,
    "3.hAfterAttn.arm1.different" : 0,
    "3.hAfterAttn.arm1.first_row" : -1,
    "3.hAfterAttn.arm1.relative" : 0,
    "3.hAfterAttn.arm2.different" : 2467217,
    "3.hAfterAttn.arm2.first_row" : 1,
    "3.hAfterAttn.arm2.relative" : 0.014423076994717121,
    "3.inj1.arm1.different" : 0,
    "3.inj1.arm1.first_row" : -1,
    "3.inj1.arm1.relative" : 0,
    "3.inj1.arm2.different" : 184,
    "3.inj1.arm2.first_row" : 6,
    "3.inj1.arm2.relative" : 0.015075377188622952,
    "3.inj2.arm1.different" : 0,
    "3.inj2.arm1.first_row" : -1,
    "3.inj2.arm1.relative" : 0,
    "3.inj2.arm2.different" : 629,
    "3.inj2.arm2.first_row" : 2,
    "3.inj2.arm2.relative" : 0.020725388079881668,
    "3.moe.arm1.different" : 0,
    "3.moe.arm1.first_row" : -1,
    "3.moe.arm1.relative" : 0,
    "3.moe.arm2.different" : 1122596,
    "3.moe.arm2.first_row" : 1,
    "3.moe.arm2.relative" : 0.2699652910232544,
    "3.x1.arm1.different" : 0,
    "3.x1.arm1.first_row" : -1,
    "3.x1.arm1.relative" : 0,
    "3.x1.arm2.different" : 881078,
    "3.x1.arm2.first_row" : 1,
    "3.x1.arm2.relative" : 0.03185096010565758,
    "3.x2.arm1.different" : 0,
    "3.x2.arm1.first_row" : -1,
    "3.x2.arm1.relative" : 0,
    "3.x2.arm2.different" : 949821,
    "3.x2.arm2.first_row" : 1,
    "3.x2.arm2.relative" : 0.05033557116985321
  },
  "name" : "context-small-components",
  "passed" : true
}

````

## components-9/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## Portable observations and identities

```json
{
  "small64-swept-7": {
    "build": 7,
    "identity": {
      "binary_sha256": "0385a9831f4b1af9d3b7d3817bb9d5397bc7805bf416b84925d4f50733b0257a",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "source_archive_sha256": "d9f68c660002f634080668a3131fa519276d8ff147d25542fc4318145ddf86eb"
    },
    "command": [
      "optimization-state-check",
      "--variant",
      "context-small-swept-64",
      "--json"
    ],
    "before": {
      "page_bytes": 16384,
      "reclaimable_bytes": 31178981376,
      "swapins": 43796746,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   218460.\nPages active:                                1135976.\nPages inactive:                               868147.\nPages speculative:                            277104.\nPages throttled:                                   0.\nPages wired down:                             225327.\nPages purgeable:                                2118.\n\"Translation faults\":                    14773458867.\nPages copy-on-write:                       683183860.\nPages zero filled:                       19964001913.\nPages reactivated:                        3288936982.\nPages purged:                               69307396.\nFile-backed pages:                           1682436.\nAnonymous pages:                              598791.\nPages stored in compressor:                  1652479.\nPages occupied by compressor:                 358627.\nDecompressions:                           1136182960.\nCompressions:                             1447071560.\nPageins:                                  7034598427.\nPageouts:                                   10955092.\nSwapins:                                    43796746.\nSwapouts:                                   77363385.\nPages tagged:                                 155786.\nPages tagged resident:                        123853.\nPages tagged compressed:                       31933.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                         1827.\nPages tag-storage non-tag pageable:            89367.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5566912.\nTagged compressions:                        10751172.\nTagged decompressions:                       9925728.\n"
    },
    "after": {
      "page_bytes": 16384,
      "reclaimable_bytes": 31172100096,
      "swapins": 43796758,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   405546.\nPages active:                                1052938.\nPages inactive:                               848273.\nPages speculative:                            203548.\nPages throttled:                                   0.\nPages wired down:                             224599.\nPages purgeable:                                  21.\n\"Translation faults\":                    14773834655.\nPages copy-on-write:                       683198786.\nPages zero filled:                       19969369618.\nPages reactivated:                        3289504995.\nPages purged:                               69314882.\nFile-backed pages:                           1497027.\nAnonymous pages:                              607732.\nPages stored in compressor:                  1651712.\nPages occupied by compressor:                 349629.\nDecompressions:                           1136186409.\nCompressions:                             1447074271.\nPageins:                                  7035169109.\nPageouts:                                   10955184.\nSwapins:                                    43796758.\nSwapouts:                                   77363385.\nPages tagged:                                 155091.\nPages tagged resident:                        123034.\nPages tagged compressed:                       32057.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                         1245.\nPages tag-storage non-tag pageable:            89949.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5595072.\nTagged compressions:                        10751309.\nTagged decompressions:                       9925738.\n"
    },
    "exit_code": 1,
    "passed": false,
    "assertions": 1604
  },
  "components-9": {
    "build": 9,
    "identity": {
      "binary_sha256": "1aadbec4f5e8e4f492e2c73010d94210dc8c56a521ee34d1b745ff9b62059a72",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "source_archive_sha256": "86d687c234a700a2191be1e1d99ab2debe76aeef55168c3fb8b7ab0553270a5d"
    },
    "command": [
      "optimization-state-check",
      "--variant",
      "context-small-components",
      "--json"
    ],
    "before": {
      "page_bytes": 16384,
      "reclaimable_bytes": 29833281536,
      "swapins": 43796822,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   184322.\nPages active:                                1184472.\nPages inactive:                               887340.\nPages speculative:                            300200.\nPages throttled:                                   0.\nPages wired down:                             224790.\nPages purgeable:                                2204.\n\"Translation faults\":                    14776556706.\nPages copy-on-write:                       683456095.\nPages zero filled:                       19970850092.\nPages reactivated:                        3289510347.\nPages purged:                               69319113.\nFile-backed pages:                           1634353.\nAnonymous pages:                              737659.\nPages stored in compressor:                  1556077.\nPages occupied by compressor:                 303925.\nDecompressions:                           1136281356.\nCompressions:                             1447074271.\nPageins:                                  7035241487.\nPageouts:                                   10955184.\nSwapins:                                    43796822.\nSwapouts:                                   77363385.\nPages tagged:                                 155304.\nPages tagged resident:                        123993.\nPages tagged compressed:                       31311.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                          776.\nPages tag-storage non-tag pageable:            90418.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5467456.\nTagged compressions:                        10751309.\nTagged decompressions:                       9926464.\n"
    },
    "after": {
      "page_bytes": 16384,
      "reclaimable_bytes": 29705666560,
      "swapins": 43796822,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335646.\nPages active:                                1113098.\nPages inactive:                               937410.\nPages speculative:                            173845.\nPages throttled:                                   0.\nPages wired down:                             223406.\nPages purgeable:                               10064.\n\"Translation faults\":                    14776778932.\nPages copy-on-write:                       683456761.\nPages zero filled:                       19971559970.\nPages reactivated:                        3289607598.\nPages purged:                               69321343.\nFile-backed pages:                           1467380.\nAnonymous pages:                              756973.\nPages stored in compressor:                  1556012.\nPages occupied by compressor:                 300382.\nDecompressions:                           1136281421.\nCompressions:                             1447074271.\nPageins:                                  7035267985.\nPageouts:                                   10955208.\nSwapins:                                    43796822.\nSwapouts:                                   77363385.\nPages tagged:                                 156475.\nPages tagged resident:                        125183.\nPages tagged compressed:                       31292.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7102.\nPages tag-storage free:                         1661.\nPages tag-storage non-tag pageable:            89533.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5463680.\nTagged compressions:                        10751309.\nTagged decompressions:                       9926483.\n"
    },
    "exit_code": 0,
    "passed": true,
    "assertions": 59
  }
}
```
