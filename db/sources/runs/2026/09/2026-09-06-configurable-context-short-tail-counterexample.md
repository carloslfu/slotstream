---
type: run
id: 01m1vyt0n7qkky38q73e92d3rk
created: 2026-09-06T18:13:36.551399+00:00
updated: 2026-09-06T18:13:36.712549+00:00
summary: One-row terminal subpass fails two unchanged numerical criteria
binary: c5ec46cb1d8c6e0af3140ff906b0c0f168419f4a193d419d17e8ba66a8ca6520
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: One-row terminal subpass fails two unchanged numerical criteria
tool: Native Swift diagnostics and Python CLI gates
---
# One-row-tail numerical counterexample

Build 13's `context-small-projections-shorttail-64` fails 2 of 1605 assertions
on a fixed 449-token witness. The continued-907 greedy token is 8 rather than
the reference's 31921, and rollback-3 ssm32 exceeds the frozen rechunk band.
697 recorded candidate drift values are nonzero. Candidate repeatability
passes; that does not override reference failures. No tolerance changed.

The first differing retained state follows the first sparse-attention layer,
while its incoming keys/indexer state are exact. A one-query terminal subpass
selects the vector attention kernel, unlike the 193-query canonical terminal
reference. Padding only this tiny attention query to a 64-row matrix dispatch
is a prospective correction. Dummy rows must be cropped before state/output
and their physical query count must be reported and priced. That successor
has not run at this capture. The sequence stopped on this failure; the
128-row-tail and sparse-prefix cases were not launched.

Command: `slotstream optimization-state-check --variant context-small-projections-shorttail-64 --json`.
All overlapping-run timing and capacity interpretations are excluded.
P4, P5 and P6 remain open, with public limit65536 and default32768 unchanged.

## Frozen build identity

```json
{
  "binary_sha256": "c5ec46cb1d8c6e0af3140ff906b0c0f168419f4a193d419d17e8ba66a8ca6520",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "20e895babbbc3e39a797dc11d263bd8a4bd34514a0286459fc7df97e98526516"
}
```

## context-small-projections-shorttail-64-13/stdout.txt

SHA-256 `825cf6ae3f5c742e0b5f645fc44d209c935e4d4f2fb8dc19b14b8989a6460d8a`; 242229 bytes.

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
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
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
      "passed" : true
    },
    {
      "name" : "prefill.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "prefill.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "prefill.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.11: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "prefill.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "prefill.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill: exact tokens",
      "passed" : true
    },
    {
      "name" : "prefill.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "padded small key domains actually execute",
      "passed" : true
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
      "detail" : "got 8, want 31921",
      "name" : "continued-907: greedy final token",
      "passed" : false
    },
    {
      "name" : "continued-907: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
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
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
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
      "passed" : true
    },
    {
      "name" : "continued-907.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-907.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-907.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.11: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.16: existing rechunk band",
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.20: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-907.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
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
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-1337.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.11: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-2103.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
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
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
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
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.2: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-2103.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.11: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-1.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1: greedy final token",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic field names",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
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
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.17: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-1.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.11: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.18: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "name" : "rollback-2: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
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
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
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
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.20: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-2.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.11: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.20: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
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
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-3.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.11: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.13: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : false
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.15: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : true
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
      "passed" : true
    }
  ],
  "measurements" : {
    "arm0.allocated_bytes" : 28311552,
    "arm0.chunk" : 256,
    "arm0.read_records" : 16132,
    "arm0.seconds" : 6.497784583,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 28311552,
    "arm1.chunk" : 512,
    "arm1.read_records" : 9281,
    "arm1.seconds" : 3.472438333,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 28311552,
    "arm2.chunk" : 64,
    "arm2.read_records" : 34268,
    "arm2.seconds" : 11.794799542,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 28311552,
    "arm3.chunk" : 64,
    "arm3.read_records" : 33507,
    "arm3.seconds" : 11.591549792,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0.003759398590773344,
    "continued-1337.conv.10.candidate" : 0.01666666753590107,
    "continued-1337.conv.10.control" : 0.01785714365541935,
    "continued-1337.conv.12.candidate" : 0.009572071954607964,
    "continued-1337.conv.12.control" : 0.01295045018196106,
    "continued-1337.conv.13.candidate" : 0.01463721226900816,
    "continued-1337.conv.13.control" : 0.014367816038429737,
    "continued-1337.conv.14.candidate" : 0.021262886002659798,
    "continued-1337.conv.14.control" : 0.01632973551750183,
    "continued-1337.conv.16.candidate" : 0.039024390280246735,
    "continued-1337.conv.16.control" : 0.039024390280246735,
    "continued-1337.conv.17.candidate" : 0.043478261679410934,
    "continued-1337.conv.17.control" : 0.04891304299235344,
    "continued-1337.conv.18.candidate" : 0.030837005004286766,
    "continued-1337.conv.18.control" : 0.030837005004286766,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0.008713942021131516,
    "continued-1337.conv.20.candidate" : 0.04368932172656059,
    "continued-1337.conv.20.control" : 0.03276699036359787,
    "continued-1337.conv.21.candidate" : 0.030232558026909828,
    "continued-1337.conv.21.control" : 0.03488372266292572,
    "continued-1337.conv.22.candidate" : 0.014705882407724857,
    "continued-1337.conv.22.control" : 0.014705882407724857,
    "continued-1337.conv.24.candidate" : 0.03125,
    "continued-1337.conv.24.control" : 0.0315755195915699,
    "continued-1337.conv.25.candidate" : 0.03588516637682915,
    "continued-1337.conv.25.control" : 0.024671053513884544,
    "continued-1337.conv.26.candidate" : 0.03419811278581619,
    "continued-1337.conv.26.control" : 0.028596697375178337,
    "continued-1337.conv.28.candidate" : 0.05000000074505806,
    "continued-1337.conv.28.control" : 0.048557691276073456,
    "continued-1337.conv.29.candidate" : 0.06936416029930115,
    "continued-1337.conv.29.control" : 0.07947976887226105,
    "continued-1337.conv.30.candidate" : 0.07367149740457535,
    "continued-1337.conv.30.control" : 0.0818236693739891,
    "continued-1337.conv.32.candidate" : 0.08368644118309021,
    "continued-1337.conv.32.control" : 0.08633474260568619,
    "continued-1337.conv.33.candidate" : 0.08846154063940048,
    "continued-1337.conv.33.control" : 0.07307692617177963,
    "continued-1337.conv.34.candidate" : 0.0802401751279831,
    "continued-1337.conv.34.control" : 0.10289300978183746,
    "continued-1337.conv.36.candidate" : 0.08864480257034302,
    "continued-1337.conv.36.control" : 0.09158416092395782,
    "continued-1337.conv.37.candidate" : 0.05667892098426819,
    "continued-1337.conv.37.control" : 0.0833333358168602,
    "continued-1337.conv.38.candidate" : 0.04272151738405228,
    "continued-1337.conv.38.control" : 0.03570015728473663,
    "continued-1337.conv.4.candidate" : 0.002637130906805396,
    "continued-1337.conv.4.control" : 0.012658228166401386,
    "continued-1337.conv.40.candidate" : 0.11205357313156128,
    "continued-1337.conv.40.control" : 0.07857143133878708,
    "continued-1337.conv.41.candidate" : 0.07669322937726974,
    "continued-1337.conv.41.control" : 0.08366534113883972,
    "continued-1337.conv.42.candidate" : 0.053533975034952164,
    "continued-1337.conv.42.control" : 0.052642617374658585,
    "continued-1337.conv.44.candidate" : 0.15410958230495453,
    "continued-1337.conv.44.control" : 0.17123287916183472,
    "continued-1337.conv.45.candidate" : 0.05907534062862396,
    "continued-1337.conv.45.control" : 0.06327589601278305,
    "continued-1337.conv.46.candidate" : 0.06178160756826401,
    "continued-1337.conv.46.control" : 0.07471264153718948,
    "continued-1337.conv.5.candidate" : 0.007692307699471712,
    "continued-1337.conv.5.control" : 0.02500000037252903,
    "continued-1337.conv.6.candidate" : 0.0047846888191998005,
    "continued-1337.conv.6.control" : 0.010765550658106804,
    "continued-1337.conv.8.candidate" : 0.0068807341158390045,
    "continued-1337.conv.8.control" : 0.008600917644798756,
    "continued-1337.conv.9.candidate" : 0.010582010261714458,
    "continued-1337.conv.9.control" : 0.010582010261714458,
    "continued-1337.index.11.candidate" : 0.01022376585751772,
    "continued-1337.index.11.control" : 0.036651235073804855,
    "continued-1337.index.15.candidate" : 0.02247191034257412,
    "continued-1337.index.15.control" : 0.04915730282664299,
    "continued-1337.index.19.candidate" : 0.02454337850213051,
    "continued-1337.index.19.control" : 0.04823059216141701,
    "continued-1337.index.23.candidate" : 0.01529017835855484,
    "continued-1337.index.23.control" : 0.0357142873108387,
    "continued-1337.index.27.candidate" : 0.01887376233935356,
    "continued-1337.index.27.control" : 0.05213490128517151,
    "continued-1337.index.3.candidate" : 0,
    "continued-1337.index.3.control" : 0.04844674468040466,
    "continued-1337.index.31.candidate" : 0.06659836322069168,
    "continued-1337.index.31.control" : 0.16495901346206665,
    "continued-1337.index.35.candidate" : 0.07181291282176971,
    "continued-1337.index.35.control" : 0.16928808391094208,
    "continued-1337.index.39.candidate" : 0.030063292011618614,
    "continued-1337.index.39.control" : 0.06685126572847366,
    "continued-1337.index.43.candidate" : 0.02968749962747097,
    "continued-1337.index.43.control" : 0.08535156399011612,
    "continued-1337.index.47.candidate" : 0.05979166552424431,
    "continued-1337.index.47.control" : 0.17000000178813934,
    "continued-1337.index.7.candidate" : 0.004595588427037001,
    "continued-1337.index.7.control" : 0.03216911852359772,
    "continued-1337.key.11.candidate" : 0.021153846755623817,
    "continued-1337.key.11.control" : 0.09747596085071564,
    "continued-1337.key.15.candidate" : 0.046076640486717224,
    "continued-1337.key.15.control" : 0.08759123831987381,
    "continued-1337.key.19.candidate" : 0.06690140813589096,
    "continued-1337.key.19.control" : 0.13042840361595154,
    "continued-1337.key.23.candidate" : 0.028523489832878113,
    "continued-1337.key.23.control" : 0.10780201107263565,
    "continued-1337.key.27.candidate" : 0.06496710330247879,
    "continued-1337.key.27.control" : 0.13856907188892365,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0.10025380551815033,
    "continued-1337.key.31.candidate" : 0.09458892792463303,
    "continued-1337.key.31.control" : 0.2088926136493683,
    "continued-1337.key.35.candidate" : 0.13385826349258423,
    "continued-1337.key.35.control" : 0.2263779491186142,
    "continued-1337.key.39.candidate" : 0.05781250074505806,
    "continued-1337.key.39.control" : 0.16093750298023224,
    "continued-1337.key.43.candidate" : 0.054421767592430115,
    "continued-1337.key.43.control" : 0.1301020383834839,
    "continued-1337.key.47.candidate" : 0.05864197388291359,
    "continued-1337.key.47.control" : 0.1561214029788971,
    "continued-1337.key.7.candidate" : 0.011261261068284512,
    "continued-1337.key.7.control" : 0.09459459781646729,
    "continued-1337.logits.candidate" : 0.08513189107179642,
    "continued-1337.logits.control" : 0.09172661602497101,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0.002358490601181984,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 0.00243970169685781,
    "continued-1337.ssm.10.candidate" : 0.027100227773189545,
    "continued-1337.ssm.10.control" : 0.03401253744959831,
    "continued-1337.ssm.12.candidate" : 0.0018904327880591154,
    "continued-1337.ssm.12.control" : 0.003188851522281766,
    "continued-1337.ssm.13.candidate" : 0.009872524067759514,
    "continued-1337.ssm.13.control" : 0.023419640958309174,
    "continued-1337.ssm.14.candidate" : 0.008321759290993214,
    "continued-1337.ssm.14.control" : 0.014370560646057129,
    "continued-1337.ssm.16.candidate" : 0.0485522598028183,
    "continued-1337.ssm.16.control" : 0.08776754885911942,
    "continued-1337.ssm.17.candidate" : 0.016791436821222305,
    "continued-1337.ssm.17.control" : 0.023858655244112015,
    "continued-1337.ssm.18.candidate" : 0.023401115089654922,
    "continued-1337.ssm.18.control" : 0.04174370318651199,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0.013054810464382172,
    "continued-1337.ssm.20.candidate" : 0.01942690648138523,
    "continued-1337.ssm.20.control" : 0.04190487414598465,
    "continued-1337.ssm.21.candidate" : 0.01593795232474804,
    "continued-1337.ssm.21.control" : 0.016556456685066223,
    "continued-1337.ssm.22.candidate" : 0.0025272646453231573,
    "continued-1337.ssm.22.control" : 0.008854847401380539,
    "continued-1337.ssm.24.candidate" : 0.023764215409755707,
    "continued-1337.ssm.24.control" : 0.02945796214044094,
    "continued-1337.ssm.25.candidate" : 0.05844603478908539,
    "continued-1337.ssm.25.control" : 0.07499926537275314,
    "continued-1337.ssm.26.candidate" : 0.10334249585866928,
    "continued-1337.ssm.26.control" : 0.086530402302742,
    "continued-1337.ssm.28.candidate" : 0.007429172284901142,
    "continued-1337.ssm.28.control" : 0.013775987550616264,
    "continued-1337.ssm.29.candidate" : 0.05069179832935333,
    "continued-1337.ssm.29.control" : 0.04985706880688667,
    "continued-1337.ssm.30.candidate" : 0.09214859455823898,
    "continued-1337.ssm.30.control" : 0.06472005695104599,
    "continued-1337.ssm.32.candidate" : 0.10517676919698715,
    "continued-1337.ssm.32.control" : 0.124945268034935,
    "continued-1337.ssm.33.candidate" : 0.07977669686079025,
    "continued-1337.ssm.33.control" : 0.09780476987361908,
    "continued-1337.ssm.34.candidate" : 0.11175306141376495,
    "continued-1337.ssm.34.control" : 0.10403416305780411,
    "continued-1337.ssm.36.candidate" : 0.04654562100768089,
    "continued-1337.ssm.36.control" : 0.0989178717136383,
    "continued-1337.ssm.37.candidate" : 0.11808325350284576,
    "continued-1337.ssm.37.control" : 0.04079009220004082,
    "continued-1337.ssm.38.candidate" : 0.02089213952422142,
    "continued-1337.ssm.38.control" : 0.018855925649404526,
    "continued-1337.ssm.4.candidate" : 0.002164775738492608,
    "continued-1337.ssm.4.control" : 0.026957416906952858,
    "continued-1337.ssm.40.candidate" : 0.00640390207991004,
    "continued-1337.ssm.40.control" : 0.017980946227908134,
    "continued-1337.ssm.41.candidate" : 0.00777759775519371,
    "continued-1337.ssm.41.control" : 0.04150834679603577,
    "continued-1337.ssm.42.candidate" : 0.029201777651906013,
    "continued-1337.ssm.42.control" : 0.04060410335659981,
    "continued-1337.ssm.44.candidate" : 0.037856921553611755,
    "continued-1337.ssm.44.control" : 0.06645477563142776,
    "continued-1337.ssm.45.candidate" : 0.14201094210147858,
    "continued-1337.ssm.45.control" : 0.12942716479301453,
    "continued-1337.ssm.46.candidate" : 0.09561654180288315,
    "continued-1337.ssm.46.control" : 0.1594877988100052,
    "continued-1337.ssm.5.candidate" : 0.006418619770556688,
    "continued-1337.ssm.5.control" : 0.04531067982316017,
    "continued-1337.ssm.6.candidate" : 0.004367094952613115,
    "continued-1337.ssm.6.control" : 0.012301095761358738,
    "continued-1337.ssm.8.candidate" : 0.0036228212993592024,
    "continued-1337.ssm.8.control" : 0.010773622430860996,
    "continued-1337.ssm.9.candidate" : 0.01273222267627716,
    "continued-1337.ssm.9.control" : 0.02393987402319908,
    "continued-1337.value.11.candidate" : 0.004636915400624275,
    "continued-1337.value.11.control" : 0.037938401103019714,
    "continued-1337.value.15.candidate" : 0.012026114389300346,
    "continued-1337.value.15.control" : 0.026954680681228638,
    "continued-1337.value.19.candidate" : 0.010841837152838707,
    "continued-1337.value.19.control" : 0.018112244084477425,
    "continued-1337.value.23.candidate" : 0.015188953839242458,
    "continued-1337.value.23.control" : 0.04898255690932274,
    "continued-1337.value.27.candidate" : 0.006009615492075682,
    "continued-1337.value.27.control" : 0.014095279388129711,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0.0514964796602726,
    "continued-1337.value.31.candidate" : 0.03478260710835457,
    "continued-1337.value.31.control" : 0.07581521570682526,
    "continued-1337.value.35.candidate" : 0.030485734343528748,
    "continued-1337.value.35.control" : 0.10303442180156708,
    "continued-1337.value.39.candidate" : 0.02174479141831398,
    "continued-1337.value.39.control" : 0.05788690596818924,
    "continued-1337.value.43.candidate" : 0.02469135820865631,
    "continued-1337.value.43.control" : 0.04938271641731262,
    "continued-1337.value.47.candidate" : 0.10213414579629898,
    "continued-1337.value.47.control" : 0.4176829159259796,
    "continued-1337.value.7.candidate" : 0.003368263365700841,
    "continued-1337.value.7.control" : 0.025449100881814957,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0.0036764706019312143,
    "continued-2103.conv.10.candidate" : 0.013953488320112228,
    "continued-2103.conv.10.control" : 0.015116279013454914,
    "continued-2103.conv.12.candidate" : 0.014527447521686554,
    "continued-2103.conv.12.control" : 0.019358407706022263,
    "continued-2103.conv.13.candidate" : 0.01376689225435257,
    "continued-2103.conv.13.control" : 0.018918918445706367,
    "continued-2103.conv.14.candidate" : 0.021262886002659798,
    "continued-2103.conv.14.control" : 0.018041236326098442,
    "continued-2103.conv.16.candidate" : 0.039024390280246735,
    "continued-2103.conv.16.control" : 0.039024390280246735,
    "continued-2103.conv.17.candidate" : 0.043478261679410934,
    "continued-2103.conv.17.control" : 0.04891304299235344,
    "continued-2103.conv.18.candidate" : 0.031963471323251724,
    "continued-2103.conv.18.control" : 0.031963471323251724,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0.008430232293903828,
    "continued-2103.conv.20.candidate" : 0.04568528011441231,
    "continued-2103.conv.20.control" : 0.034263961017131805,
    "continued-2103.conv.21.candidate" : 0.030232558026909828,
    "continued-2103.conv.21.control" : 0.03488372266292572,
    "continued-2103.conv.22.candidate" : 0.014598540030419827,
    "continued-2103.conv.22.control" : 0.014598540030419827,
    "continued-2103.conv.24.candidate" : 0.03208556026220322,
    "continued-2103.conv.24.control" : 0.03241978585720062,
    "continued-2103.conv.25.candidate" : 0.03588516637682915,
    "continued-2103.conv.25.control" : 0.024671053513884544,
    "continued-2103.conv.26.candidate" : 0.0328054316341877,
    "continued-2103.conv.26.control" : 0.0328054316341877,
    "continued-2103.conv.28.candidate" : 0.05000000074505806,
    "continued-2103.conv.28.control" : 0.048557691276073456,
    "continued-2103.conv.29.candidate" : 0.0648648664355278,
    "continued-2103.conv.29.control" : 0.07432432472705841,
    "continued-2103.conv.30.candidate" : 0.07367149740457535,
    "continued-2103.conv.30.control" : 0.0818236693739891,
    "continued-2103.conv.32.candidate" : 0.08368644118309021,
    "continued-2103.conv.32.control" : 0.08633474260568619,
    "continued-2103.conv.33.candidate" : 0.08846154063940048,
    "continued-2103.conv.33.control" : 0.07307692617177963,
    "continued-2103.conv.34.candidate" : 0.0802401751279831,
    "continued-2103.conv.34.control" : 0.10289300978183746,
    "continued-2103.conv.36.candidate" : 0.0908946692943573,
    "continued-2103.conv.36.control" : 0.07614213228225708,
    "continued-2103.conv.37.candidate" : 0.05667892098426819,
    "continued-2103.conv.37.control" : 0.0833333358168602,
    "continued-2103.conv.38.candidate" : 0.04272151738405228,
    "continued-2103.conv.38.control" : 0.03293117135763168,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0.012658228166401386,
    "continued-2103.conv.40.candidate" : 0.111258864402771,
    "continued-2103.conv.40.control" : 0.07801418751478195,
    "continued-2103.conv.41.candidate" : 0.07669322937726974,
    "continued-2103.conv.41.control" : 0.08366534113883972,
    "continued-2103.conv.42.candidate" : 0.05282491818070412,
    "continued-2103.conv.42.control" : 0.051945365965366364,
    "continued-2103.conv.44.candidate" : 0.1388888955116272,
    "continued-2103.conv.44.control" : 0.15432098507881165,
    "continued-2103.conv.45.candidate" : 0.05907534062862396,
    "continued-2103.conv.45.control" : 0.06327589601278305,
    "continued-2103.conv.46.candidate" : 0.05972222238779068,
    "continued-2103.conv.46.control" : 0.07222222536802292,
    "continued-2103.conv.5.candidate" : 0.007692307699471712,
    "continued-2103.conv.5.control" : 0.02500000037252903,
    "continued-2103.conv.6.candidate" : 0.007177033461630344,
    "continued-2103.conv.6.control" : 0.010765550658106804,
    "continued-2103.conv.8.candidate" : 0.0068807341158390045,
    "continued-2103.conv.8.control" : 0.00917431153357029,
    "continued-2103.conv.9.candidate" : 0.010638297535479069,
    "continued-2103.conv.9.control" : 0.018617020919919014,
    "continued-2103.index.11.candidate" : 0.011574073694646358,
    "continued-2103.index.11.control" : 0.036651235073804855,
    "continued-2103.index.15.candidate" : 0.02247191034257412,
    "continued-2103.index.15.control" : 0.04915730282664299,
    "continued-2103.index.19.candidate" : 0.027397260069847107,
    "continued-2103.index.19.control" : 0.04823059216141701,
    "continued-2103.index.23.candidate" : 0.01529017835855484,
    "continued-2103.index.23.control" : 0.0357142873108387,
    "continued-2103.index.27.candidate" : 0.01887376233935356,
    "continued-2103.index.27.control" : 0.05213490128517151,
    "continued-2103.index.3.candidate" : 0,
    "continued-2103.index.3.control" : 0.04844674468040466,
    "continued-2103.index.31.candidate" : 0.06659836322069168,
    "continued-2103.index.31.control" : 0.16495901346206665,
    "continued-2103.index.35.candidate" : 0.07181291282176971,
    "continued-2103.index.35.control" : 0.16928808391094208,
    "continued-2103.index.39.candidate" : 0.030063292011618614,
    "continued-2103.index.39.control" : 0.06685126572847366,
    "continued-2103.index.43.candidate" : 0.02968749962747097,
    "continued-2103.index.43.control" : 0.08535156399011612,
    "continued-2103.index.47.candidate" : 0.05979166552424431,
    "continued-2103.index.47.control" : 0.17000000178813934,
    "continued-2103.index.7.candidate" : 0.004595588427037001,
    "continued-2103.index.7.control" : 0.03216911852359772,
    "continued-2103.key.11.candidate" : 0.03076923079788685,
    "continued-2103.key.11.control" : 0.09747596085071564,
    "continued-2103.key.15.candidate" : 0.046076640486717224,
    "continued-2103.key.15.control" : 0.08759123831987381,
    "continued-2103.key.19.candidate" : 0.06690140813589096,
    "continued-2103.key.19.control" : 0.13042840361595154,
    "continued-2103.key.23.candidate" : 0.028523489832878113,
    "continued-2103.key.23.control" : 0.10780201107263565,
    "continued-2103.key.27.candidate" : 0.06496710330247879,
    "continued-2103.key.27.control" : 0.13856907188892365,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0.10025380551815033,
    "continued-2103.key.31.candidate" : 0.09458892792463303,
    "continued-2103.key.31.control" : 0.2088926136493683,
    "continued-2103.key.35.candidate" : 0.13385826349258423,
    "continued-2103.key.35.control" : 0.2263779491186142,
    "continued-2103.key.39.candidate" : 0.05781250074505806,
    "continued-2103.key.39.control" : 0.16093750298023224,
    "continued-2103.key.43.candidate" : 0.054421767592430115,
    "continued-2103.key.43.control" : 0.1301020383834839,
    "continued-2103.key.47.candidate" : 0.05864197388291359,
    "continued-2103.key.47.control" : 0.1561214029788971,
    "continued-2103.key.7.candidate" : 0.011261261068284512,
    "continued-2103.key.7.control" : 0.09459459781646729,
    "continued-2103.logits.candidate" : 0.045787546783685684,
    "continued-2103.logits.control" : 0.07326007634401321,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 0.0026787705719470978,
    "continued-2103.ssm.10.candidate" : 0.013622299768030643,
    "continued-2103.ssm.10.control" : 0.031143467873334885,
    "continued-2103.ssm.12.candidate" : 0.0018990935059264302,
    "continued-2103.ssm.12.control" : 0.002614344470202923,
    "continued-2103.ssm.13.candidate" : 0.011106361635029316,
    "continued-2103.ssm.13.control" : 0.023780474439263344,
    "continued-2103.ssm.14.candidate" : 0.0061189825646579266,
    "continued-2103.ssm.14.control" : 0.014368025586009026,
    "continued-2103.ssm.16.candidate" : 0.023119576275348663,
    "continued-2103.ssm.16.control" : 0.028734911233186722,
    "continued-2103.ssm.17.candidate" : 0.02887161821126938,
    "continued-2103.ssm.17.control" : 0.02891785278916359,
    "continued-2103.ssm.18.candidate" : 0.05163061246275902,
    "continued-2103.ssm.18.control" : 0.06193260848522186,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0.013134132139384747,
    "continued-2103.ssm.20.candidate" : 0.01700962334871292,
    "continued-2103.ssm.20.control" : 0.02367684617638588,
    "continued-2103.ssm.21.candidate" : 0.013448906131088734,
    "continued-2103.ssm.21.control" : 0.01623089239001274,
    "continued-2103.ssm.22.candidate" : 0.0023396504111588,
    "continued-2103.ssm.22.control" : 0.008682900108397007,
    "continued-2103.ssm.24.candidate" : 0.01784450188279152,
    "continued-2103.ssm.24.control" : 0.018965991213917732,
    "continued-2103.ssm.25.candidate" : 0.04100552573800087,
    "continued-2103.ssm.25.control" : 0.054733093827962875,
    "continued-2103.ssm.26.candidate" : 0.059760335832834244,
    "continued-2103.ssm.26.control" : 0.05495327338576317,
    "continued-2103.ssm.28.candidate" : 0.0038498654030263424,
    "continued-2103.ssm.28.control" : 0.005612834822386503,
    "continued-2103.ssm.29.candidate" : 0.04708895832300186,
    "continued-2103.ssm.29.control" : 0.05550353601574898,
    "continued-2103.ssm.30.candidate" : 0.043252211064100266,
    "continued-2103.ssm.30.control" : 0.029813267290592194,
    "continued-2103.ssm.32.candidate" : 0.056788962334394455,
    "continued-2103.ssm.32.control" : 0.12327084690332413,
    "continued-2103.ssm.33.candidate" : 0.053955066949129105,
    "continued-2103.ssm.33.control" : 0.13337820768356323,
    "continued-2103.ssm.34.candidate" : 0.09766938537359238,
    "continued-2103.ssm.34.control" : 0.08956097811460495,
    "continued-2103.ssm.36.candidate" : 0.07080813497304916,
    "continued-2103.ssm.36.control" : 0.059749405831098557,
    "continued-2103.ssm.37.candidate" : 0.08103727549314499,
    "continued-2103.ssm.37.control" : 0.07069515436887741,
    "continued-2103.ssm.38.candidate" : 0.011986365541815758,
    "continued-2103.ssm.38.control" : 0.01771271787583828,
    "continued-2103.ssm.4.candidate" : 0.0013927522813901305,
    "continued-2103.ssm.4.control" : 0.02708258666098118,
    "continued-2103.ssm.40.candidate" : 0.0075413137674331665,
    "continued-2103.ssm.40.control" : 0.017384905368089676,
    "continued-2103.ssm.41.candidate" : 0.006407188717275858,
    "continued-2103.ssm.41.control" : 0.04165691137313843,
    "continued-2103.ssm.42.candidate" : 0.027539527043700218,
    "continued-2103.ssm.42.control" : 0.062465935945510864,
    "continued-2103.ssm.44.candidate" : 0.006440748926252127,
    "continued-2103.ssm.44.control" : 0.017161983996629715,
    "continued-2103.ssm.45.candidate" : 0.14110657572746277,
    "continued-2103.ssm.45.control" : 0.08259648829698563,
    "continued-2103.ssm.46.candidate" : 0.09402094036340714,
    "continued-2103.ssm.46.control" : 0.13072989881038666,
    "continued-2103.ssm.5.candidate" : 0.005774183664470911,
    "continued-2103.ssm.5.control" : 0.02513541653752327,
    "continued-2103.ssm.6.candidate" : 0.0031899872701615095,
    "continued-2103.ssm.6.control" : 0.013171319849789143,
    "continued-2103.ssm.8.candidate" : 0.006712459027767181,
    "continued-2103.ssm.8.control" : 0.010763229802250862,
    "continued-2103.ssm.9.candidate" : 0.015804799273610115,
    "continued-2103.ssm.9.control" : 0.026172427460551262,
    "continued-2103.value.11.candidate" : 0.006519784219563007,
    "continued-2103.value.11.control" : 0.037938401103019714,
    "continued-2103.value.15.candidate" : 0.012026114389300346,
    "continued-2103.value.15.control" : 0.026954680681228638,
    "continued-2103.value.19.candidate" : 0.010841837152838707,
    "continued-2103.value.19.control" : 0.018112244084477425,
    "continued-2103.value.23.candidate" : 0.01976744271814823,
    "continued-2103.value.23.control" : 0.04898255690932274,
    "continued-2103.value.27.candidate" : 0.006009615492075682,
    "continued-2103.value.27.control" : 0.014095279388129711,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0.0514964796602726,
    "continued-2103.value.31.candidate" : 0.03478260710835457,
    "continued-2103.value.31.control" : 0.07581521570682526,
    "continued-2103.value.35.candidate" : 0.030485734343528748,
    "continued-2103.value.35.control" : 0.10303442180156708,
    "continued-2103.value.39.candidate" : 0.02174479141831398,
    "continued-2103.value.39.control" : 0.05788690596818924,
    "continued-2103.value.43.candidate" : 0.02469135820865631,
    "continued-2103.value.43.control" : 0.04938271641731262,
    "continued-2103.value.47.candidate" : 0.10213414579629898,
    "continued-2103.value.47.control" : 0.4176829159259796,
    "continued-2103.value.7.candidate" : 0.009730539284646511,
    "continued-2103.value.7.control" : 0.025449100881814957,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0.007462686393409967,
    "continued-907.conv.10.candidate" : 0.01666666753590107,
    "continued-907.conv.10.control" : 0.01785714365541935,
    "continued-907.conv.12.candidate" : 0.00952914822846651,
    "continued-907.conv.12.control" : 0.016255605965852737,
    "continued-907.conv.13.candidate" : 0.01430828683078289,
    "continued-907.conv.13.control" : 0.016678370535373688,
    "continued-907.conv.14.candidate" : 0.022790055721998215,
    "continued-907.conv.14.control" : 0.017502589151263237,
    "continued-907.conv.16.candidate" : 0.0416666679084301,
    "continued-907.conv.16.control" : 0.0416666679084301,
    "continued-907.conv.17.candidate" : 0.043478261679410934,
    "continued-907.conv.17.control" : 0.04891304299235344,
    "continued-907.conv.18.candidate" : 0.030837005004286766,
    "continued-907.conv.18.control" : 0.030837005004286766,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0.004566209856420755,
    "continued-907.conv.20.candidate" : 0.04368932172656059,
    "continued-907.conv.20.control" : 0.03276699036359787,
    "continued-907.conv.21.candidate" : 0.030232558026909828,
    "continued-907.conv.21.control" : 0.029069768264889717,
    "continued-907.conv.22.candidate" : 0.014084506779909134,
    "continued-907.conv.22.control" : 0.014084506779909134,
    "continued-907.conv.24.candidate" : 0.03125,
    "continued-907.conv.24.control" : 0.03125,
    "continued-907.conv.25.candidate" : 0.028846153989434242,
    "continued-907.conv.25.control" : 0.025841346010565758,
    "continued-907.conv.26.candidate" : 0.033018868416547775,
    "continued-907.conv.26.control" : 0.0277122650295496,
    "continued-907.conv.28.candidate" : 0.05078125,
    "continued-907.conv.28.control" : 0.04931640625,
    "continued-907.conv.29.candidate" : 0.06521739065647125,
    "continued-907.conv.29.control" : 0.06521739065647125,
    "continued-907.conv.30.candidate" : 0.07860824465751648,
    "continued-907.conv.30.control" : 0.08730670064687729,
    "continued-907.conv.32.candidate" : 0.07204433530569077,
    "continued-907.conv.32.control" : 0.10036946088075638,
    "continued-907.conv.33.candidate" : 0.08846154063940048,
    "continued-907.conv.33.control" : 0.07307692617177963,
    "continued-907.conv.34.candidate" : 0.0802401751279831,
    "continued-907.conv.34.control" : 0.10289300978183746,
    "continued-907.conv.36.candidate" : 0.08864480257034302,
    "continued-907.conv.36.control" : 0.09158416092395782,
    "continued-907.conv.37.candidate" : 0.05184977501630783,
    "continued-907.conv.37.control" : 0.07623318582773209,
    "continued-907.conv.38.candidate" : 0.03481012582778931,
    "continued-907.conv.38.control" : 0.03570015728473663,
    "continued-907.conv.4.candidate" : 0.0024900399148464203,
    "continued-907.conv.4.control" : 0.004980079829692841,
    "continued-907.conv.40.candidate" : 0.0625,
    "continued-907.conv.40.control" : 0.08626760542392731,
    "continued-907.conv.41.candidate" : 0.07699999958276749,
    "continued-907.conv.41.control" : 0.08399999886751175,
    "continued-907.conv.42.candidate" : 0.04820261523127556,
    "continued-907.conv.42.control" : 0.05126633867621422,
    "continued-907.conv.44.candidate" : 0.140625,
    "continued-907.conv.44.control" : 0.15625,
    "continued-907.conv.45.candidate" : 0.05907534062862396,
    "continued-907.conv.45.control" : 0.06327589601278305,
    "continued-907.conv.46.candidate" : 0.059065934270620346,
    "continued-907.conv.46.control" : 0.0714285746216774,
    "continued-907.conv.5.candidate" : 0.008620689623057842,
    "continued-907.conv.5.control" : 0.02801724150776863,
    "continued-907.conv.6.candidate" : 0.0047846888191998005,
    "continued-907.conv.6.control" : 0.008971291594207287,
    "continued-907.conv.8.candidate" : 0.0068807341158390045,
    "continued-907.conv.8.control" : 0.008600917644798756,
    "continued-907.conv.9.candidate" : 0.010582010261714458,
    "continued-907.conv.9.control" : 0.010582010261714458,
    "continued-907.index.11.candidate" : 0.01022376585751772,
    "continued-907.index.11.control" : 0.036651235073804855,
    "continued-907.index.15.candidate" : 0.02247191034257412,
    "continued-907.index.15.control" : 0.04915730282664299,
    "continued-907.index.19.candidate" : 0.02454337850213051,
    "continued-907.index.19.control" : 0.04823059216141701,
    "continued-907.index.23.candidate" : 0.012500000186264515,
    "continued-907.index.23.control" : 0.0357142873108387,
    "continued-907.index.27.candidate" : 0.01887376233935356,
    "continued-907.index.27.control" : 0.05213490128517151,
    "continued-907.index.3.candidate" : 0,
    "continued-907.index.3.control" : 0.04844674468040466,
    "continued-907.index.31.candidate" : 0.05929815396666527,
    "continued-907.index.31.control" : 0.16495901346206665,
    "continued-907.index.35.candidate" : 0.05298013240098953,
    "continued-907.index.35.control" : 0.16928808391094208,
    "continued-907.index.39.candidate" : 0.019086234271526337,
    "continued-907.index.39.control" : 0.06685126572847366,
    "continued-907.index.43.candidate" : 0.02968749962747097,
    "continued-907.index.43.control" : 0.08535156399011612,
    "continued-907.index.47.candidate" : 0.05979166552424431,
    "continued-907.index.47.control" : 0.17000000178813934,
    "continued-907.index.7.candidate" : 0.004595588427037001,
    "continued-907.index.7.control" : 0.03216911852359772,
    "continued-907.key.11.candidate" : 0.021153846755623817,
    "continued-907.key.11.control" : 0.09747596085071564,
    "continued-907.key.15.candidate" : 0.046076640486717224,
    "continued-907.key.15.control" : 0.08759123831987381,
    "continued-907.key.19.candidate" : 0.06690140813589096,
    "continued-907.key.19.control" : 0.13042840361595154,
    "continued-907.key.23.candidate" : 0.028523489832878113,
    "continued-907.key.23.control" : 0.10780201107263565,
    "continued-907.key.27.candidate" : 0.06496710330247879,
    "continued-907.key.27.control" : 0.13856907188892365,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0.10025380551815033,
    "continued-907.key.31.candidate" : 0.09458892792463303,
    "continued-907.key.31.control" : 0.2088926136493683,
    "continued-907.key.35.candidate" : 0.10629921406507492,
    "continued-907.key.35.control" : 0.2263779491186142,
    "continued-907.key.39.candidate" : 0.05781250074505806,
    "continued-907.key.39.control" : 0.16093750298023224,
    "continued-907.key.43.candidate" : 0.054421767592430115,
    "continued-907.key.43.control" : 0.1301020383834839,
    "continued-907.key.47.candidate" : 0.05864197388291359,
    "continued-907.key.47.control" : 0.1561214029788971,
    "continued-907.key.7.candidate" : 0.010135134682059288,
    "continued-907.key.7.control" : 0.09459459781646729,
    "continued-907.logits.candidate" : 0.0951182171702385,
    "continued-907.logits.control" : 0.10332749783992767,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0.002358490601181984,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 0.0029804306104779243,
    "continued-907.ssm.10.candidate" : 0.018235592171549797,
    "continued-907.ssm.10.control" : 0.023899657651782036,
    "continued-907.ssm.12.candidate" : 0.002263341099023819,
    "continued-907.ssm.12.control" : 0.0027617975138127804,
    "continued-907.ssm.13.candidate" : 0.011999319307506084,
    "continued-907.ssm.13.control" : 0.025602074339985847,
    "continued-907.ssm.14.candidate" : 0.004586406983435154,
    "continued-907.ssm.14.control" : 0.01441024150699377,
    "continued-907.ssm.16.candidate" : 0.036483872681856155,
    "continued-907.ssm.16.control" : 0.030779048800468445,
    "continued-907.ssm.17.candidate" : 0.04099392890930176,
    "continued-907.ssm.17.control" : 0.04661482945084572,
    "continued-907.ssm.18.candidate" : 0.06387484818696976,
    "continued-907.ssm.18.control" : 0.052911557257175446,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0.012658442370593548,
    "continued-907.ssm.20.candidate" : 0.016724968329072,
    "continued-907.ssm.20.control" : 0.018170980736613274,
    "continued-907.ssm.21.candidate" : 0.024016287177801132,
    "continued-907.ssm.21.control" : 0.04367716982960701,
    "continued-907.ssm.22.candidate" : 0.0031848775688558817,
    "continued-907.ssm.22.control" : 0.009105023927986622,
    "continued-907.ssm.24.candidate" : 0.021834824234247208,
    "continued-907.ssm.24.control" : 0.023251205682754517,
    "continued-907.ssm.25.candidate" : 0.035656269639730453,
    "continued-907.ssm.25.control" : 0.03976874426007271,
    "continued-907.ssm.26.candidate" : 0.0703202486038208,
    "continued-907.ssm.26.control" : 0.07139058411121368,
    "continued-907.ssm.28.candidate" : 0.003749832510948181,
    "continued-907.ssm.28.control" : 0.005853470880538225,
    "continued-907.ssm.29.candidate" : 0.04685821756720543,
    "continued-907.ssm.29.control" : 0.04265253245830536,
    "continued-907.ssm.30.candidate" : 0.044280730187892914,
    "continued-907.ssm.30.control" : 0.05644851550459862,
    "continued-907.ssm.32.candidate" : 0.08593717217445374,
    "continued-907.ssm.32.control" : 0.051649149507284164,
    "continued-907.ssm.33.candidate" : 0.21029111742973328,
    "continued-907.ssm.33.control" : 0.11917489022016525,
    "continued-907.ssm.34.candidate" : 0.08617852628231049,
    "continued-907.ssm.34.control" : 0.1024438738822937,
    "continued-907.ssm.36.candidate" : 0.06281489878892899,
    "continued-907.ssm.36.control" : 0.0628051832318306,
    "continued-907.ssm.37.candidate" : 0.03369392454624176,
    "continued-907.ssm.37.control" : 0.035683371126651764,
    "continued-907.ssm.38.candidate" : 0.013093894347548485,
    "continued-907.ssm.38.control" : 0.024183083325624466,
    "continued-907.ssm.4.candidate" : 0.004386445507407188,
    "continued-907.ssm.4.control" : 0.026571525260806084,
    "continued-907.ssm.40.candidate" : 0.0050871241837739944,
    "continued-907.ssm.40.control" : 0.017173657193779945,
    "continued-907.ssm.41.candidate" : 0.005524914711713791,
    "continued-907.ssm.41.control" : 0.041870955377817154,
    "continued-907.ssm.42.candidate" : 0.02376088872551918,
    "continued-907.ssm.42.control" : 0.03485302999615669,
    "continued-907.ssm.44.candidate" : 0.016096873208880424,
    "continued-907.ssm.44.control" : 0.019561486318707466,
    "continued-907.ssm.45.candidate" : 0.07084046304225922,
    "continued-907.ssm.45.control" : 0.09316158294677734,
    "continued-907.ssm.46.candidate" : 0.08027467131614685,
    "continued-907.ssm.46.control" : 0.17210634052753448,
    "continued-907.ssm.5.candidate" : 0.0056568230502307415,
    "continued-907.ssm.5.control" : 0.03633773326873779,
    "continued-907.ssm.6.candidate" : 0.0026495172642171383,
    "continued-907.ssm.6.control" : 0.012331650592386723,
    "continued-907.ssm.8.candidate" : 0.005133851431310177,
    "continued-907.ssm.8.control" : 0.010783889330923557,
    "continued-907.ssm.9.candidate" : 0.018398847430944443,
    "continued-907.ssm.9.control" : 0.02468608319759369,
    "continued-907.value.11.candidate" : 0.004636915400624275,
    "continued-907.value.11.control" : 0.037938401103019714,
    "continued-907.value.15.candidate" : 0.012026114389300346,
    "continued-907.value.15.control" : 0.026954680681228638,
    "continued-907.value.19.candidate" : 0.010841837152838707,
    "continued-907.value.19.control" : 0.018112244084477425,
    "continued-907.value.23.candidate" : 0.012209302745759487,
    "continued-907.value.23.control" : 0.04898255690932274,
    "continued-907.value.27.candidate" : 0.006009615492075682,
    "continued-907.value.27.control" : 0.014095279388129711,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0.0514964796602726,
    "continued-907.value.31.candidate" : 0.033559784293174744,
    "continued-907.value.31.control" : 0.07581521570682526,
    "continued-907.value.35.candidate" : 0.027732959017157555,
    "continued-907.value.35.control" : 0.10303442180156708,
    "continued-907.value.39.candidate" : 0.015476190485060215,
    "continued-907.value.39.control" : 0.05788690596818924,
    "continued-907.value.43.candidate" : 0.02469135820865631,
    "continued-907.value.43.control" : 0.04938271641731262,
    "continued-907.value.47.candidate" : 0.06764481961727142,
    "continued-907.value.47.control" : 0.4176829159259796,
    "continued-907.value.7.candidate" : 0.002994012087583542,
    "continued-907.value.7.control" : 0.025449100881814957,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0.007462686393409967,
    "prefill.conv.10.candidate" : 0.01666666753590107,
    "prefill.conv.10.control" : 0.01785714365541935,
    "prefill.conv.12.candidate" : 0.00952914822846651,
    "prefill.conv.12.control" : 0.018497757613658905,
    "prefill.conv.13.candidate" : 0.012640449218451977,
    "prefill.conv.13.control" : 0.01825842633843422,
    "prefill.conv.14.candidate" : 0.009668508544564247,
    "prefill.conv.14.control" : 0.016067421063780785,
    "prefill.conv.16.candidate" : 0.019900497049093246,
    "prefill.conv.16.control" : 0.016635572537779808,
    "prefill.conv.17.candidate" : 0.021739130839705467,
    "prefill.conv.17.control" : 0.014492753893136978,
    "prefill.conv.18.candidate" : 0.015418502502143383,
    "prefill.conv.18.control" : 0.013491189107298851,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0.00570776266977191,
    "prefill.conv.20.candidate" : 0.018810680136084557,
    "prefill.conv.20.control" : 0.019417475908994675,
    "prefill.conv.21.candidate" : 0.014024389907717705,
    "prefill.conv.21.control" : 0.023170731961727142,
    "prefill.conv.22.candidate" : 0.008085664361715317,
    "prefill.conv.22.control" : 0.012456294149160385,
    "prefill.conv.24.candidate" : 0.013346354477107525,
    "prefill.conv.24.control" : 0.02864583395421505,
    "prefill.conv.25.candidate" : 0.016826923936605453,
    "prefill.conv.25.control" : 0.025841346010565758,
    "prefill.conv.26.candidate" : 0.033018868416547775,
    "prefill.conv.26.control" : 0.021226415410637856,
    "prefill.conv.28.candidate" : 0.0247802734375,
    "prefill.conv.28.control" : 0.03414726257324219,
    "prefill.conv.29.candidate" : 0.028023097664117813,
    "prefill.conv.29.control" : 0.04415760934352875,
    "prefill.conv.30.candidate" : 0.02899484522640705,
    "prefill.conv.30.control" : 0.0670103058218956,
    "prefill.conv.32.candidate" : 0.054999999701976776,
    "prefill.conv.32.control" : 0.054999999701976776,
    "prefill.conv.33.candidate" : 0.051923077553510666,
    "prefill.conv.33.control" : 0.06778845936059952,
    "prefill.conv.34.candidate" : 0.04331140220165253,
    "prefill.conv.34.control" : 0.07236842066049576,
    "prefill.conv.36.candidate" : 0.04739336669445038,
    "prefill.conv.36.control" : 0.0876777246594429,
    "prefill.conv.37.candidate" : 0.04535398259758949,
    "prefill.conv.37.control" : 0.05752212554216385,
    "prefill.conv.38.candidate" : 0.024242423474788666,
    "prefill.conv.38.control" : 0.034185606986284256,
    "prefill.conv.4.candidate" : 0.0024900399148464203,
    "prefill.conv.4.control" : 0.0039840638637542725,
    "prefill.conv.40.candidate" : 0.039612676948308945,
    "prefill.conv.40.control" : 0.08626760542392731,
    "prefill.conv.41.candidate" : 0.04399999976158142,
    "prefill.conv.41.control" : 0.05550000071525574,
    "prefill.conv.42.candidate" : 0.026960784569382668,
    "prefill.conv.42.control" : 0.05106209218502045,
    "prefill.conv.44.candidate" : 0.05000000074505806,
    "prefill.conv.44.control" : 0.11249999701976776,
    "prefill.conv.45.candidate" : 0.02806122414767742,
    "prefill.conv.45.control" : 0.04432398080825806,
    "prefill.conv.46.candidate" : 0.03365384787321091,
    "prefill.conv.46.control" : 0.048076923936605453,
    "prefill.conv.5.candidate" : 0.004587155766785145,
    "prefill.conv.5.control" : 0.01834862306714058,
    "prefill.conv.6.candidate" : 0.004629629664123058,
    "prefill.conv.6.control" : 0.008391203358769417,
    "prefill.conv.8.candidate" : 0.0030940594151616096,
    "prefill.conv.8.control" : 0.007735148537904024,
    "prefill.conv.9.candidate" : 0.005291005130857229,
    "prefill.conv.9.control" : 0.010582010261714458,
    "prefill.index.11.candidate" : 0.01022376585751772,
    "prefill.index.11.control" : 0.036651235073804855,
    "prefill.index.15.candidate" : 0.013342696242034435,
    "prefill.index.15.control" : 0.04915730282664299,
    "prefill.index.19.candidate" : 0.01826483942568302,
    "prefill.index.19.control" : 0.04823059216141701,
    "prefill.index.23.candidate" : 0.0071428571827709675,
    "prefill.index.23.control" : 0.0357142873108387,
    "prefill.index.27.candidate" : 0.012066831812262535,
    "prefill.index.27.control" : 0.05213490128517151,
    "prefill.index.3.candidate" : 0,
    "prefill.index.3.control" : 0.04844674468040466,
    "prefill.index.31.candidate" : 0.05929815396666527,
    "prefill.index.31.control" : 0.16495901346206665,
    "prefill.index.35.candidate" : 0.04677152261137962,
    "prefill.index.35.control" : 0.16928808391094208,
    "prefill.index.39.candidate" : 0.015031646005809307,
    "prefill.index.39.control" : 0.06685126572847366,
    "prefill.index.43.candidate" : 0.01835937425494194,
    "prefill.index.43.control" : 0.08535156399011612,
    "prefill.index.47.candidate" : 0.03791666775941849,
    "prefill.index.47.control" : 0.17000000178813934,
    "prefill.index.7.candidate" : 0.0018382353009656072,
    "prefill.index.7.control" : 0.03216911852359772,
    "prefill.key.11.candidate" : 0.021153846755623817,
    "prefill.key.11.control" : 0.09747596085071564,
    "prefill.key.15.candidate" : 0.016423357650637627,
    "prefill.key.15.control" : 0.08759123831987381,
    "prefill.key.19.candidate" : 0.04694835841655731,
    "prefill.key.19.control" : 0.13042840361595154,
    "prefill.key.23.candidate" : 0.020134227350354195,
    "prefill.key.23.control" : 0.10780201107263565,
    "prefill.key.27.candidate" : 0.03700657933950424,
    "prefill.key.27.control" : 0.13856907188892365,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0.10025380551815033,
    "prefill.key.31.candidate" : 0.05411073938012123,
    "prefill.key.31.control" : 0.2088926136493683,
    "prefill.key.35.candidate" : 0.05708661302924156,
    "prefill.key.35.control" : 0.2263779491186142,
    "prefill.key.39.candidate" : 0.03500976413488388,
    "prefill.key.39.control" : 0.16093750298023224,
    "prefill.key.43.candidate" : 0.024659864604473114,
    "prefill.key.43.control" : 0.1301020383834839,
    "prefill.key.47.candidate" : 0.05864197388291359,
    "prefill.key.47.control" : 0.1561214029788971,
    "prefill.key.7.candidate" : 0.005067567341029644,
    "prefill.key.7.control" : 0.09459459781646729,
    "prefill.logits.candidate" : 0.05941358208656311,
    "prefill.logits.control" : 0.09259258955717087,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0.004716981202363968,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 0.002704237587749958,
    "prefill.ssm.10.candidate" : 0.012128671631217003,
    "prefill.ssm.10.control" : 0.04185683652758598,
    "prefill.ssm.12.candidate" : 0.0012504560872912407,
    "prefill.ssm.12.control" : 0.0041755507700145245,
    "prefill.ssm.13.candidate" : 0.006613600999116898,
    "prefill.ssm.13.control" : 0.025806840509176254,
    "prefill.ssm.14.candidate" : 0.002167490543797612,
    "prefill.ssm.14.control" : 0.014317338354885578,
    "prefill.ssm.16.candidate" : 0.015884652733802795,
    "prefill.ssm.16.control" : 0.030117077752947807,
    "prefill.ssm.17.candidate" : 0.019417110830545425,
    "prefill.ssm.17.control" : 0.015753688290715218,
    "prefill.ssm.18.candidate" : 0.033770300447940826,
    "prefill.ssm.18.control" : 0.030686693266034126,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0.011411177925765514,
    "prefill.ssm.20.candidate" : 0.012151486240327358,
    "prefill.ssm.20.control" : 0.013600090518593788,
    "prefill.ssm.21.candidate" : 0.008970041759312153,
    "prefill.ssm.21.control" : 0.021862631663680077,
    "prefill.ssm.22.candidate" : 0.0014588134363293648,
    "prefill.ssm.22.control" : 0.009415468201041222,
    "prefill.ssm.24.candidate" : 0.010886463336646557,
    "prefill.ssm.24.control" : 0.025286737829446793,
    "prefill.ssm.25.candidate" : 0.015037238597869873,
    "prefill.ssm.25.control" : 0.029029227793216705,
    "prefill.ssm.26.candidate" : 0.04665375500917435,
    "prefill.ssm.26.control" : 0.03773251920938492,
    "prefill.ssm.28.candidate" : 0.0011334401788190007,
    "prefill.ssm.28.control" : 0.00403100810945034,
    "prefill.ssm.29.candidate" : 0.02784275822341442,
    "prefill.ssm.29.control" : 0.050416283309459686,
    "prefill.ssm.30.candidate" : 0.01217693742364645,
    "prefill.ssm.30.control" : 0.031091658398509026,
    "prefill.ssm.32.candidate" : 0.025548163801431656,
    "prefill.ssm.32.control" : 0.06386008113622665,
    "prefill.ssm.33.candidate" : 0.05597710609436035,
    "prefill.ssm.33.control" : 0.07677856087684631,
    "prefill.ssm.34.candidate" : 0.044751182198524475,
    "prefill.ssm.34.control" : 0.06809794902801514,
    "prefill.ssm.36.candidate" : 0.032124049961566925,
    "prefill.ssm.36.control" : 0.0710095539689064,
    "prefill.ssm.37.candidate" : 0.023030960932374,
    "prefill.ssm.37.control" : 0.05589859187602997,
    "prefill.ssm.38.candidate" : 0.009518510662019253,
    "prefill.ssm.38.control" : 0.016206664964556694,
    "prefill.ssm.4.candidate" : 0.002378004603087902,
    "prefill.ssm.4.control" : 0.02719864435493946,
    "prefill.ssm.40.candidate" : 0.0028283121064305305,
    "prefill.ssm.40.control" : 0.017824072390794754,
    "prefill.ssm.41.candidate" : 0.0042404904961586,
    "prefill.ssm.41.control" : 0.04140927270054817,
    "prefill.ssm.42.candidate" : 0.011866152286529541,
    "prefill.ssm.42.control" : 0.03370935842394829,
    "prefill.ssm.44.candidate" : 0.027367817237973213,
    "prefill.ssm.44.control" : 0.019831746816635132,
    "prefill.ssm.45.candidate" : 0.03553340584039688,
    "prefill.ssm.45.control" : 0.06491202861070633,
    "prefill.ssm.46.candidate" : 0.08831606805324554,
    "prefill.ssm.46.control" : 0.18722502887248993,
    "prefill.ssm.5.candidate" : 0.005966594442725182,
    "prefill.ssm.5.control" : 0.025340046733617783,
    "prefill.ssm.6.candidate" : 0.0017736590234562755,
    "prefill.ssm.6.control" : 0.01200084201991558,
    "prefill.ssm.8.candidate" : 0.0023097393568605185,
    "prefill.ssm.8.control" : 0.010806315578520298,
    "prefill.ssm.9.candidate" : 0.008845379576086998,
    "prefill.ssm.9.control" : 0.026259908452630043,
    "prefill.value.11.candidate" : 0.004636915400624275,
    "prefill.value.11.control" : 0.037938401103019714,
    "prefill.value.15.candidate" : 0.006225099787116051,
    "prefill.value.15.control" : 0.026954680681228638,
    "prefill.value.19.candidate" : 0.0076530613005161285,
    "prefill.value.19.control" : 0.018112244084477425,
    "prefill.value.23.candidate" : 0.0087936045601964,
    "prefill.value.23.control" : 0.04898255690932274,
    "prefill.value.27.candidate" : 0.004589160904288292,
    "prefill.value.27.control" : 0.014095279388129711,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0.0514964796602726,
    "prefill.value.31.candidate" : 0.028940217569470406,
    "prefill.value.31.control" : 0.07581521570682526,
    "prefill.value.35.candidate" : 0.023550724610686302,
    "prefill.value.35.control" : 0.10303442180156708,
    "prefill.value.39.candidate" : 0.01465773768723011,
    "prefill.value.39.control" : 0.05788690596818924,
    "prefill.value.43.candidate" : 0.015432098880410194,
    "prefill.value.43.control" : 0.04938271641731262,
    "prefill.value.47.candidate" : 0.05487804859876633,
    "prefill.value.47.control" : 0.4176829159259796,
    "prefill.value.7.candidate" : 0.0013098802883177996,
    "prefill.value.7.control" : 0.025449100881814957,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0.0036764706019312143,
    "rollback-1.conv.10.candidate" : 0.010392441414296627,
    "rollback-1.conv.10.control" : 0.024636628106236458,
    "rollback-1.conv.12.candidate" : 0.017699114978313446,
    "rollback-1.conv.12.control" : 0.024336284026503563,
    "rollback-1.conv.13.candidate" : 0.028378378599882126,
    "rollback-1.conv.13.control" : 0.02432432398200035,
    "rollback-1.conv.14.candidate" : 0.020618556067347527,
    "rollback-1.conv.14.control" : 0.029797740280628204,
    "rollback-1.conv.16.candidate" : 0.02500000037252903,
    "rollback-1.conv.16.control" : 0.04749999940395355,
    "rollback-1.conv.17.candidate" : 0.053299494087696075,
    "rollback-1.conv.17.control" : 0.05885152146220207,
    "rollback-1.conv.18.candidate" : 0.0527522936463356,
    "rollback-1.conv.18.control" : 0.03669724613428116,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0.01991279050707817,
    "rollback-1.conv.20.candidate" : 0.04314720630645752,
    "rollback-1.conv.20.control" : 0.06154822185635567,
    "rollback-1.conv.21.candidate" : 0.040048543363809586,
    "rollback-1.conv.21.control" : 0.04217233136296272,
    "rollback-1.conv.22.candidate" : 0.01773049682378769,
    "rollback-1.conv.22.control" : 0.025487588718533516,
    "rollback-1.conv.24.candidate" : 0.031586021184921265,
    "rollback-1.conv.24.control" : 0.03889448940753937,
    "rollback-1.conv.25.candidate" : 0.02900717779994011,
    "rollback-1.conv.25.control" : 0.04066985473036766,
    "rollback-1.conv.26.candidate" : 0.029235010966658592,
    "rollback-1.conv.26.control" : 0.05882352963089943,
    "rollback-1.conv.28.candidate" : 0.044534411281347275,
    "rollback-1.conv.28.control" : 0.06528340280056,
    "rollback-1.conv.29.candidate" : 0.06281407177448273,
    "rollback-1.conv.29.control" : 0.08165828883647919,
    "rollback-1.conv.30.candidate" : 0.0769856795668602,
    "rollback-1.conv.30.control" : 0.0859375,
    "rollback-1.conv.32.candidate" : 0.08151866495609283,
    "rollback-1.conv.32.control" : 0.0882352963089943,
    "rollback-1.conv.33.candidate" : 0.05604208633303642,
    "rollback-1.conv.33.control" : 0.07459677755832672,
    "rollback-1.conv.34.candidate" : 0.09388888627290726,
    "rollback-1.conv.34.control" : 0.0989583358168602,
    "rollback-1.conv.36.candidate" : 0.0891089141368866,
    "rollback-1.conv.36.control" : 0.11014851182699203,
    "rollback-1.conv.37.candidate" : 0.07199754565954208,
    "rollback-1.conv.37.control" : 0.125,
    "rollback-1.conv.38.candidate" : 0.04296875,
    "rollback-1.conv.38.control" : 0.05429687350988388,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0.013976792804896832,
    "rollback-1.conv.40.candidate" : 0.076241135597229,
    "rollback-1.conv.40.control" : 0.13120567798614502,
    "rollback-1.conv.41.candidate" : 0.10162601619958878,
    "rollback-1.conv.41.control" : 0.09857723861932755,
    "rollback-1.conv.42.candidate" : 0.07388245314359665,
    "rollback-1.conv.42.control" : 0.09250827878713608,
    "rollback-1.conv.44.candidate" : 0.10648148506879807,
    "rollback-1.conv.44.control" : 0.11728394776582718,
    "rollback-1.conv.45.candidate" : 0.07340604066848755,
    "rollback-1.conv.45.control" : 0.07948825508356094,
    "rollback-1.conv.46.candidate" : 0.09090909361839294,
    "rollback-1.conv.46.control" : 0.09031100571155548,
    "rollback-1.conv.5.candidate" : 0.008510638028383255,
    "rollback-1.conv.5.control" : 0.04680851101875305,
    "rollback-1.conv.6.candidate" : 0.007317073177546263,
    "rollback-1.conv.6.control" : 0.031707316637039185,
    "rollback-1.conv.8.candidate" : 0.006072091404348612,
    "rollback-1.conv.8.control" : 0.024752475321292877,
    "rollback-1.conv.9.candidate" : 0.02049180306494236,
    "rollback-1.conv.9.control" : 0.03125,
    "rollback-1.index.11.candidate" : 0.011574073694646358,
    "rollback-1.index.11.control" : 0.036651235073804855,
    "rollback-1.index.15.candidate" : 0.02247191034257412,
    "rollback-1.index.15.control" : 0.04915730282664299,
    "rollback-1.index.19.candidate" : 0.03348851203918457,
    "rollback-1.index.19.control" : 0.04823059216141701,
    "rollback-1.index.23.candidate" : 0.01529017835855484,
    "rollback-1.index.23.control" : 0.0357142873108387,
    "rollback-1.index.27.candidate" : 0.021658414974808693,
    "rollback-1.index.27.control" : 0.05213490128517151,
    "rollback-1.index.3.candidate" : 0,
    "rollback-1.index.3.control" : 0.04844674468040466,
    "rollback-1.index.31.candidate" : 0.06659836322069168,
    "rollback-1.index.31.control" : 0.16495901346206665,
    "rollback-1.index.35.candidate" : 0.08692052960395813,
    "rollback-1.index.35.control" : 0.16928808391094208,
    "rollback-1.index.39.candidate" : 0.03401898592710495,
    "rollback-1.index.39.control" : 0.06685126572847366,
    "rollback-1.index.43.candidate" : 0.03085937537252903,
    "rollback-1.index.43.control" : 0.08535156399011612,
    "rollback-1.index.47.candidate" : 0.05979166552424431,
    "rollback-1.index.47.control" : 0.17000000178813934,
    "rollback-1.index.7.candidate" : 0.005514706019312143,
    "rollback-1.index.7.control" : 0.03216911852359772,
    "rollback-1.key.11.candidate" : 0.03076923079788685,
    "rollback-1.key.11.control" : 0.09747596085071564,
    "rollback-1.key.15.candidate" : 0.046076640486717224,
    "rollback-1.key.15.control" : 0.08759123831987381,
    "rollback-1.key.19.candidate" : 0.08186619728803635,
    "rollback-1.key.19.control" : 0.13042840361595154,
    "rollback-1.key.23.candidate" : 0.033557046204805374,
    "rollback-1.key.23.control" : 0.10780201107263565,
    "rollback-1.key.27.candidate" : 0.06496710330247879,
    "rollback-1.key.27.control" : 0.13856907188892365,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0.10025380551815033,
    "rollback-1.key.31.candidate" : 0.10906039923429489,
    "rollback-1.key.31.control" : 0.2088926136493683,
    "rollback-1.key.35.candidate" : 0.13837967813014984,
    "rollback-1.key.35.control" : 0.2263779491186142,
    "rollback-1.key.39.candidate" : 0.06679687649011612,
    "rollback-1.key.39.control" : 0.16093750298023224,
    "rollback-1.key.43.candidate" : 0.06632652878761292,
    "rollback-1.key.43.control" : 0.1301020383834839,
    "rollback-1.key.47.candidate" : 0.09053497761487961,
    "rollback-1.key.47.control" : 0.1561214029788971,
    "rollback-1.key.7.candidate" : 0.016328828409314156,
    "rollback-1.key.7.control" : 0.09459459781646729,
    "rollback-1.logits.candidate" : 0.09488341957330704,
    "rollback-1.logits.control" : 0.11010362952947617,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 0.0016687766183167696,
    "rollback-1.ssm.10.candidate" : 0.029448967427015305,
    "rollback-1.ssm.10.control" : 0.04546959698200226,
    "rollback-1.ssm.12.candidate" : 0.003312670160084963,
    "rollback-1.ssm.12.control" : 0.004076096229255199,
    "rollback-1.ssm.13.candidate" : 0.019679967314004898,
    "rollback-1.ssm.13.control" : 0.03342162072658539,
    "rollback-1.ssm.14.candidate" : 0.010544984601438046,
    "rollback-1.ssm.14.control" : 0.016810311004519463,
    "rollback-1.ssm.16.candidate" : 0.04074506461620331,
    "rollback-1.ssm.16.control" : 0.04106974974274635,
    "rollback-1.ssm.17.candidate" : 0.03090997226536274,
    "rollback-1.ssm.17.control" : 0.0696505680680275,
    "rollback-1.ssm.18.candidate" : 0.047973088920116425,
    "rollback-1.ssm.18.control" : 0.05894295871257782,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0.012737466022372246,
    "rollback-1.ssm.20.candidate" : 0.02515552006661892,
    "rollback-1.ssm.20.control" : 0.031774140894412994,
    "rollback-1.ssm.21.candidate" : 0.03100029192864895,
    "rollback-1.ssm.21.control" : 0.03705133870244026,
    "rollback-1.ssm.22.candidate" : 0.003596726106479764,
    "rollback-1.ssm.22.control" : 0.008585071191191673,
    "rollback-1.ssm.24.candidate" : 0.04130500927567482,
    "rollback-1.ssm.24.control" : 0.03747611120343208,
    "rollback-1.ssm.25.candidate" : 0.05026884004473686,
    "rollback-1.ssm.25.control" : 0.08679033815860748,
    "rollback-1.ssm.26.candidate" : 0.05241222679615021,
    "rollback-1.ssm.26.control" : 0.08535387367010117,
    "rollback-1.ssm.28.candidate" : 0.003713449463248253,
    "rollback-1.ssm.28.control" : 0.004557494539767504,
    "rollback-1.ssm.29.candidate" : 0.0571877546608448,
    "rollback-1.ssm.29.control" : 0.05519532412290573,
    "rollback-1.ssm.30.candidate" : 0.09431532770395279,
    "rollback-1.ssm.30.control" : 0.10250090807676315,
    "rollback-1.ssm.32.candidate" : 0.08674174547195435,
    "rollback-1.ssm.32.control" : 0.18351422250270844,
    "rollback-1.ssm.33.candidate" : 0.09163542091846466,
    "rollback-1.ssm.33.control" : 0.14023537933826447,
    "rollback-1.ssm.34.candidate" : 0.13225938379764557,
    "rollback-1.ssm.34.control" : 0.15133608877658844,
    "rollback-1.ssm.36.candidate" : 0.051191769540309906,
    "rollback-1.ssm.36.control" : 0.08182356506586075,
    "rollback-1.ssm.37.candidate" : 0.04844030737876892,
    "rollback-1.ssm.37.control" : 0.039026129990816116,
    "rollback-1.ssm.38.candidate" : 0.013761218637228012,
    "rollback-1.ssm.38.control" : 0.019852371886372566,
    "rollback-1.ssm.4.candidate" : 0.0007654725923202932,
    "rollback-1.ssm.4.control" : 0.029741346836090088,
    "rollback-1.ssm.40.candidate" : 0.00973572675138712,
    "rollback-1.ssm.40.control" : 0.021310992538928986,
    "rollback-1.ssm.41.candidate" : 0.009112542495131493,
    "rollback-1.ssm.41.control" : 0.041662778705358505,
    "rollback-1.ssm.42.candidate" : 0.03550821170210838,
    "rollback-1.ssm.42.control" : 0.05865435674786568,
    "rollback-1.ssm.44.candidate" : 0.014056743122637272,
    "rollback-1.ssm.44.control" : 0.017349814996123314,
    "rollback-1.ssm.45.candidate" : 0.1372341811656952,
    "rollback-1.ssm.45.control" : 0.13683666288852692,
    "rollback-1.ssm.46.candidate" : 0.12041296064853668,
    "rollback-1.ssm.46.control" : 0.15382017195224762,
    "rollback-1.ssm.5.candidate" : 0.004931967705488205,
    "rollback-1.ssm.5.control" : 0.046914659440517426,
    "rollback-1.ssm.6.candidate" : 0.003409117693081498,
    "rollback-1.ssm.6.control" : 0.027633061632514,
    "rollback-1.ssm.8.candidate" : 0.004043459426611662,
    "rollback-1.ssm.8.control" : 0.02003251202404499,
    "rollback-1.ssm.9.candidate" : 0.02121175266802311,
    "rollback-1.ssm.9.control" : 0.057640768587589264,
    "rollback-1.value.11.candidate" : 0.006519784219563007,
    "rollback-1.value.11.control" : 0.037938401103019714,
    "rollback-1.value.15.candidate" : 0.012026114389300346,
    "rollback-1.value.15.control" : 0.026954680681228638,
    "rollback-1.value.19.candidate" : 0.010841837152838707,
    "rollback-1.value.19.control" : 0.022448979318141937,
    "rollback-1.value.23.candidate" : 0.02500000037252903,
    "rollback-1.value.23.control" : 0.04898255690932274,
    "rollback-1.value.27.candidate" : 0.0074300700798630714,
    "rollback-1.value.27.control" : 0.014095279388129711,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0.0514964796602726,
    "rollback-1.value.31.candidate" : 0.03478260710835457,
    "rollback-1.value.31.control" : 0.07581521570682526,
    "rollback-1.value.35.candidate" : 0.046875,
    "rollback-1.value.35.control" : 0.10303442180156708,
    "rollback-1.value.39.candidate" : 0.04523809626698494,
    "rollback-1.value.39.control" : 0.05788690596818924,
    "rollback-1.value.43.candidate" : 0.043209876865148544,
    "rollback-1.value.43.control" : 0.04938271641731262,
    "rollback-1.value.47.candidate" : 0.12347561120986938,
    "rollback-1.value.47.control" : 0.4176829159259796,
    "rollback-1.value.7.candidate" : 0.009730539284646511,
    "rollback-1.value.7.control" : 0.025449100881814957,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0.01676829345524311,
    "rollback-2.conv.10.control" : 0.02713414654135704,
    "rollback-2.conv.12.candidate" : 0.030465181916952133,
    "rollback-2.conv.12.control" : 0.0251141544431448,
    "rollback-2.conv.13.candidate" : 0.036288175731897354,
    "rollback-2.conv.13.control" : 0.028409091755747795,
    "rollback-2.conv.14.candidate" : 0.051020409911870956,
    "rollback-2.conv.14.control" : 0.042071908712387085,
    "rollback-2.conv.16.candidate" : 0.03940886631608009,
    "rollback-2.conv.16.control" : 0.04679802805185318,
    "rollback-2.conv.17.candidate" : 0.053299494087696075,
    "rollback-2.conv.17.control" : 0.05885152146220207,
    "rollback-2.conv.18.candidate" : 0.06651376187801361,
    "rollback-2.conv.18.control" : 0.03669724613428116,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0.013414634391665459,
    "rollback-2.conv.20.candidate" : 0.04743589833378792,
    "rollback-2.conv.20.control" : 0.06217948719859123,
    "rollback-2.conv.21.candidate" : 0.040048543363809586,
    "rollback-2.conv.21.control" : 0.04217233136296272,
    "rollback-2.conv.22.candidate" : 0.024280576035380363,
    "rollback-2.conv.22.control" : 0.024364883080124855,
    "rollback-2.conv.24.candidate" : 0.04395604506134987,
    "rollback-2.conv.24.control" : 0.03974931314587593,
    "rollback-2.conv.25.candidate" : 0.0390625,
    "rollback-2.conv.25.control" : 0.04086538404226303,
    "rollback-2.conv.26.candidate" : 0.04326923191547394,
    "rollback-2.conv.26.control" : 0.049879807978868484,
    "rollback-2.conv.28.candidate" : 0.0436507947742939,
    "rollback-2.conv.28.control" : 0.063988097012043,
    "rollback-2.conv.29.candidate" : 0.06532663106918335,
    "rollback-2.conv.29.control" : 0.08165828883647919,
    "rollback-2.conv.30.candidate" : 0.07619201391935349,
    "rollback-2.conv.30.control" : 0.08505154401063919,
    "rollback-2.conv.32.candidate" : 0.08340567350387573,
    "rollback-2.conv.32.control" : 0.0902777761220932,
    "rollback-2.conv.33.candidate" : 0.05604208633303642,
    "rollback-2.conv.33.control" : 0.07459677755832672,
    "rollback-2.conv.34.candidate" : 0.09184782952070236,
    "rollback-2.conv.34.control" : 0.09680706262588501,
    "rollback-2.conv.36.candidate" : 0.08737864345312119,
    "rollback-2.conv.36.control" : 0.10679611563682556,
    "rollback-2.conv.37.candidate" : 0.057065218687057495,
    "rollback-2.conv.37.control" : 0.06086956337094307,
    "rollback-2.conv.38.candidate" : 0.04296875,
    "rollback-2.conv.38.control" : 0.04921875149011612,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0.013976792804896832,
    "rollback-2.conv.40.candidate" : 0.07664233446121216,
    "rollback-2.conv.40.control" : 0.10218977928161621,
    "rollback-2.conv.41.candidate" : 0.0646149143576622,
    "rollback-2.conv.41.control" : 0.0962301567196846,
    "rollback-2.conv.42.candidate" : 0.0565476194024086,
    "rollback-2.conv.42.control" : 0.08702699840068817,
    "rollback-2.conv.44.candidate" : 0.095238097012043,
    "rollback-2.conv.44.control" : 0.1130952388048172,
    "rollback-2.conv.45.candidate" : 0.07340604066848755,
    "rollback-2.conv.45.control" : 0.07550335675477982,
    "rollback-2.conv.46.candidate" : 0.06966817378997803,
    "rollback-2.conv.46.control" : 0.09729381650686264,
    "rollback-2.conv.5.candidate" : 0.007692307699471712,
    "rollback-2.conv.5.control" : 0.04615384712815285,
    "rollback-2.conv.6.candidate" : 0.004830917809158564,
    "rollback-2.conv.6.control" : 0.03140096738934517,
    "rollback-2.conv.8.candidate" : 0.010519801639020443,
    "rollback-2.conv.8.control" : 0.02599009871482849,
    "rollback-2.conv.9.candidate" : 0.012640449218451977,
    "rollback-2.conv.9.control" : 0.03212780877947807,
    "rollback-2.index.11.candidate" : 0.01697530783712864,
    "rollback-2.index.11.control" : 0.036651235073804855,
    "rollback-2.index.15.candidate" : 0.04494382068514824,
    "rollback-2.index.15.control" : 0.04915730282664299,
    "rollback-2.index.19.candidate" : 0.050799086689949036,
    "rollback-2.index.19.control" : 0.04823059216141701,
    "rollback-2.index.23.candidate" : 0.02321428619325161,
    "rollback-2.index.23.control" : 0.0357142873108387,
    "rollback-2.index.27.candidate" : 0.021658414974808693,
    "rollback-2.index.27.control" : 0.05213490128517151,
    "rollback-2.index.3.candidate" : 0,
    "rollback-2.index.3.control" : 0.04844674468040466,
    "rollback-2.index.31.candidate" : 0.07914958894252777,
    "rollback-2.index.31.control" : 0.16495901346206665,
    "rollback-2.index.35.candidate" : 0.08692052960395813,
    "rollback-2.index.35.control" : 0.16928808391094208,
    "rollback-2.index.39.candidate" : 0.03125,
    "rollback-2.index.39.control" : 0.06685126572847366,
    "rollback-2.index.43.candidate" : 0.03398437425494194,
    "rollback-2.index.43.control" : 0.08535156399011612,
    "rollback-2.index.47.candidate" : 0.05979166552424431,
    "rollback-2.index.47.control" : 0.17000000178813934,
    "rollback-2.index.7.candidate" : 0.005514706019312143,
    "rollback-2.index.7.control" : 0.03216911852359772,
    "rollback-2.key.11.candidate" : 0.04429086670279503,
    "rollback-2.key.11.control" : 0.09747596085071564,
    "rollback-2.key.15.candidate" : 0.07652828097343445,
    "rollback-2.key.15.control" : 0.08759123831987381,
    "rollback-2.key.19.candidate" : 0.11531690508127213,
    "rollback-2.key.19.control" : 0.13042840361595154,
    "rollback-2.key.23.candidate" : 0.05033557116985321,
    "rollback-2.key.23.control" : 0.10780201107263565,
    "rollback-2.key.27.candidate" : 0.07072368264198303,
    "rollback-2.key.27.control" : 0.13856907188892365,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0.10025380551815033,
    "rollback-2.key.31.candidate" : 0.10906039923429489,
    "rollback-2.key.31.control" : 0.2088926136493683,
    "rollback-2.key.35.candidate" : 0.13837967813014984,
    "rollback-2.key.35.control" : 0.2263779491186142,
    "rollback-2.key.39.candidate" : 0.06679687649011612,
    "rollback-2.key.39.control" : 0.16093750298023224,
    "rollback-2.key.43.candidate" : 0.05697279050946236,
    "rollback-2.key.43.control" : 0.1301020383834839,
    "rollback-2.key.47.candidate" : 0.09053497761487961,
    "rollback-2.key.47.control" : 0.1561214029788971,
    "rollback-2.key.7.candidate" : 0.016328828409314156,
    "rollback-2.key.7.control" : 0.09459459781646729,
    "rollback-2.logits.candidate" : 0.06936416029930115,
    "rollback-2.logits.control" : 0.11175337433815002,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 0.001579031813889742,
    "rollback-2.ssm.10.candidate" : 0.03946270793676376,
    "rollback-2.ssm.10.control" : 0.05156170204281807,
    "rollback-2.ssm.12.candidate" : 0.004835887812077999,
    "rollback-2.ssm.12.control" : 0.004401271231472492,
    "rollback-2.ssm.13.candidate" : 0.032855529338121414,
    "rollback-2.ssm.13.control" : 0.03369653597474098,
    "rollback-2.ssm.14.candidate" : 0.009280589409172535,
    "rollback-2.ssm.14.control" : 0.013484829105436802,
    "rollback-2.ssm.16.candidate" : 0.03624699264764786,
    "rollback-2.ssm.16.control" : 0.05002614110708237,
    "rollback-2.ssm.17.candidate" : 0.09988351911306381,
    "rollback-2.ssm.17.control" : 0.0453394278883934,
    "rollback-2.ssm.18.candidate" : 0.08149903267621994,
    "rollback-2.ssm.18.control" : 0.07419704645872116,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0.01262714434415102,
    "rollback-2.ssm.20.candidate" : 0.023658938705921173,
    "rollback-2.ssm.20.control" : 0.015683334320783615,
    "rollback-2.ssm.21.candidate" : 0.02773241698741913,
    "rollback-2.ssm.21.control" : 0.015878180041909218,
    "rollback-2.ssm.22.candidate" : 0.0037116096355021,
    "rollback-2.ssm.22.control" : 0.008367989212274551,
    "rollback-2.ssm.24.candidate" : 0.023343661800026894,
    "rollback-2.ssm.24.control" : 0.018955666571855545,
    "rollback-2.ssm.25.candidate" : 0.06476154923439026,
    "rollback-2.ssm.25.control" : 0.06907308846712112,
    "rollback-2.ssm.26.candidate" : 0.14126789569854736,
    "rollback-2.ssm.26.control" : 0.06037506088614464,
    "rollback-2.ssm.28.candidate" : 0.003493575844913721,
    "rollback-2.ssm.28.control" : 0.004087875131517649,
    "rollback-2.ssm.29.candidate" : 0.05243385583162308,
    "rollback-2.ssm.29.control" : 0.039764516055583954,
    "rollback-2.ssm.30.candidate" : 0.059118881821632385,
    "rollback-2.ssm.30.control" : 0.037178512662649155,
    "rollback-2.ssm.32.candidate" : 0.07852453738451004,
    "rollback-2.ssm.32.control" : 0.07559378445148468,
    "rollback-2.ssm.33.candidate" : 0.07570885866880417,
    "rollback-2.ssm.33.control" : 0.07184648513793945,
    "rollback-2.ssm.34.candidate" : 0.08745751529932022,
    "rollback-2.ssm.34.control" : 0.08510051667690277,
    "rollback-2.ssm.36.candidate" : 0.03332041576504707,
    "rollback-2.ssm.36.control" : 0.058085765689611435,
    "rollback-2.ssm.37.candidate" : 0.05860627070069313,
    "rollback-2.ssm.37.control" : 0.05383116379380226,
    "rollback-2.ssm.38.candidate" : 0.01137832086533308,
    "rollback-2.ssm.38.control" : 0.02166302502155304,
    "rollback-2.ssm.4.candidate" : 0.0007059575873427093,
    "rollback-2.ssm.4.control" : 0.027622541412711143,
    "rollback-2.ssm.40.candidate" : 0.010511872358620167,
    "rollback-2.ssm.40.control" : 0.023858141154050827,
    "rollback-2.ssm.41.candidate" : 0.007805404253304005,
    "rollback-2.ssm.41.control" : 0.04141821712255478,
    "rollback-2.ssm.42.candidate" : 0.03883909434080124,
    "rollback-2.ssm.42.control" : 0.04111645743250847,
    "rollback-2.ssm.44.candidate" : 0.011865573935210705,
    "rollback-2.ssm.44.control" : 0.03075091354548931,
    "rollback-2.ssm.45.candidate" : 0.0735393837094307,
    "rollback-2.ssm.45.control" : 0.09502673149108887,
    "rollback-2.ssm.46.candidate" : 0.06526260077953339,
    "rollback-2.ssm.46.control" : 0.13896313309669495,
    "rollback-2.ssm.5.candidate" : 0.005736765451729298,
    "rollback-2.ssm.5.control" : 0.027691280469298363,
    "rollback-2.ssm.6.candidate" : 0.003499746322631836,
    "rollback-2.ssm.6.control" : 0.013277466408908367,
    "rollback-2.ssm.8.candidate" : 0.010428069159388542,
    "rollback-2.ssm.8.control" : 0.014318466186523438,
    "rollback-2.ssm.9.candidate" : 0.013856823556125164,
    "rollback-2.ssm.9.control" : 0.030974194407463074,
    "rollback-2.value.11.candidate" : 0.05193345248699188,
    "rollback-2.value.11.control" : 0.04833633080124855,
    "rollback-2.value.15.candidate" : 0.025149403139948845,
    "rollback-2.value.15.control" : 0.026954680681228638,
    "rollback-2.value.19.candidate" : 0.0167410708963871,
    "rollback-2.value.19.control" : 0.022448979318141937,
    "rollback-2.value.23.candidate" : 0.030232558026909828,
    "rollback-2.value.23.control" : 0.04898255690932274,
    "rollback-2.value.27.candidate" : 0.007539335638284683,
    "rollback-2.value.27.control" : 0.014095279388129711,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0.0514964796602726,
    "rollback-2.value.31.candidate" : 0.03478260710835457,
    "rollback-2.value.31.control" : 0.07581521570682526,
    "rollback-2.value.35.candidate" : 0.046875,
    "rollback-2.value.35.control" : 0.10303442180156708,
    "rollback-2.value.39.candidate" : 0.02433035708963871,
    "rollback-2.value.39.control" : 0.05788690596818924,
    "rollback-2.value.43.candidate" : 0.030478395521640778,
    "rollback-2.value.43.control" : 0.04938271641731262,
    "rollback-2.value.47.candidate" : 0.10213414579629898,
    "rollback-2.value.47.control" : 0.4176829159259796,
    "rollback-2.value.7.candidate" : 0.009730539284646511,
    "rollback-2.value.7.control" : 0.025449100881814957,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0.008536585606634617,
    "rollback-3.conv.10.control" : 0.017378048971295357,
    "rollback-3.conv.12.candidate" : 0.01141552533954382,
    "rollback-3.conv.12.control" : 0.02226027473807335,
    "rollback-3.conv.13.candidate" : 0.028314916417002678,
    "rollback-3.conv.13.control" : 0.027624309062957764,
    "rollback-3.conv.14.candidate" : 0.0167410708963871,
    "rollback-3.conv.14.control" : 0.020408162847161293,
    "rollback-3.conv.16.candidate" : 0.02216748706996441,
    "rollback-3.conv.16.control" : 0.02463054098188877,
    "rollback-3.conv.17.candidate" : 0.020618556067347527,
    "rollback-3.conv.17.control" : 0.03362596780061722,
    "rollback-3.conv.18.candidate" : 0.025229357182979584,
    "rollback-3.conv.18.control" : 0.029816513881087303,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0.013749999925494194,
    "rollback-3.conv.20.candidate" : 0.018589744344353676,
    "rollback-3.conv.20.control" : 0.03974359109997749,
    "rollback-3.conv.21.candidate" : 0.0234375,
    "rollback-3.conv.21.control" : 0.030048076063394547,
    "rollback-3.conv.22.candidate" : 0.012589927762746811,
    "rollback-3.conv.22.control" : 0.019784172996878624,
    "rollback-3.conv.24.candidate" : 0.021362993866205215,
    "rollback-3.conv.24.control" : 0.04237288236618042,
    "rollback-3.conv.25.candidate" : 0.0379146933555603,
    "rollback-3.conv.25.control" : 0.04087677597999573,
    "rollback-3.conv.26.candidate" : 0.03125,
    "rollback-3.conv.26.control" : 0.05048076808452606,
    "rollback-3.conv.28.candidate" : 0.0357142873108387,
    "rollback-3.conv.28.control" : 0.0409226194024086,
    "rollback-3.conv.29.candidate" : 0.0833333358168602,
    "rollback-3.conv.29.control" : 0.08232821524143219,
    "rollback-3.conv.30.candidate" : 0.06443298608064651,
    "rollback-3.conv.30.control" : 0.0670103058218956,
    "rollback-3.conv.32.candidate" : 0.07190265506505966,
    "rollback-3.conv.32.control" : 0.08075220882892609,
    "rollback-3.conv.33.candidate" : 0.05371900647878647,
    "rollback-3.conv.33.control" : 0.09090909361839294,
    "rollback-3.conv.34.candidate" : 0.06611569970846176,
    "rollback-3.conv.34.control" : 0.08264462649822235,
    "rollback-3.conv.36.candidate" : 0.11226851493120193,
    "rollback-3.conv.36.control" : 0.10879629850387573,
    "rollback-3.conv.37.candidate" : 0.05040760710835457,
    "rollback-3.conv.37.control" : 0.050271738320589066,
    "rollback-3.conv.38.candidate" : 0.05974842607975006,
    "rollback-3.conv.38.control" : 0.07783018797636032,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0.009098101407289505,
    "rollback-3.conv.40.candidate" : 0.08531022071838379,
    "rollback-3.conv.40.control" : 0.09489051252603531,
    "rollback-3.conv.41.candidate" : 0.060975611209869385,
    "rollback-3.conv.41.control" : 0.12804877758026123,
    "rollback-3.conv.42.candidate" : 0.051020409911870956,
    "rollback-3.conv.42.control" : 0.0606398805975914,
    "rollback-3.conv.44.candidate" : 0.0773809552192688,
    "rollback-3.conv.44.control" : 0.087425597012043,
    "rollback-3.conv.45.candidate" : 0.04920212924480438,
    "rollback-3.conv.45.control" : 0.053136080503463745,
    "rollback-3.conv.46.candidate" : 0.08505154401063919,
    "rollback-3.conv.46.control" : 0.05025773122906685,
    "rollback-3.conv.5.candidate" : 0.013461538590490818,
    "rollback-3.conv.5.control" : 0.04038461670279503,
    "rollback-3.conv.6.candidate" : 0.007548309396952391,
    "rollback-3.conv.6.control" : 0.014492753893136978,
    "rollback-3.conv.8.candidate" : 0.008333333767950535,
    "rollback-3.conv.8.control" : 0.014285714365541935,
    "rollback-3.conv.9.candidate" : 0.016759777441620827,
    "rollback-3.conv.9.control" : 0.018156424164772034,
    "rollback-3.index.11.candidate" : 0.011574073694646358,
    "rollback-3.index.11.control" : 0.036651235073804855,
    "rollback-3.index.15.candidate" : 0.02247191034257412,
    "rollback-3.index.15.control" : 0.04915730282664299,
    "rollback-3.index.19.candidate" : 0.03348851203918457,
    "rollback-3.index.19.control" : 0.04823059216141701,
    "rollback-3.index.23.candidate" : 0.01529017835855484,
    "rollback-3.index.23.control" : 0.0357142873108387,
    "rollback-3.index.27.candidate" : 0.021658414974808693,
    "rollback-3.index.27.control" : 0.05213490128517151,
    "rollback-3.index.3.candidate" : 0,
    "rollback-3.index.3.control" : 0.04844674468040466,
    "rollback-3.index.31.candidate" : 0.07914958894252777,
    "rollback-3.index.31.control" : 0.16495901346206665,
    "rollback-3.index.35.candidate" : 0.08692052960395813,
    "rollback-3.index.35.control" : 0.16928808391094208,
    "rollback-3.index.39.candidate" : 0.03125,
    "rollback-3.index.39.control" : 0.06685126572847366,
    "rollback-3.index.43.candidate" : 0.03837890550494194,
    "rollback-3.index.43.control" : 0.08535156399011612,
    "rollback-3.index.47.candidate" : 0.05979166552424431,
    "rollback-3.index.47.control" : 0.17000000178813934,
    "rollback-3.index.7.candidate" : 0.010110294446349144,
    "rollback-3.index.7.control" : 0.03216911852359772,
    "rollback-3.key.11.candidate" : 0.03076923079788685,
    "rollback-3.key.11.control" : 0.09747596085071564,
    "rollback-3.key.15.candidate" : 0.046076640486717224,
    "rollback-3.key.15.control" : 0.08759123831987381,
    "rollback-3.key.19.candidate" : 0.08186619728803635,
    "rollback-3.key.19.control" : 0.13042840361595154,
    "rollback-3.key.23.candidate" : 0.033557046204805374,
    "rollback-3.key.23.control" : 0.10780201107263565,
    "rollback-3.key.27.candidate" : 0.07072368264198303,
    "rollback-3.key.27.control" : 0.13856907188892365,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0.10025380551815033,
    "rollback-3.key.31.candidate" : 0.10906039923429489,
    "rollback-3.key.31.control" : 0.2088926136493683,
    "rollback-3.key.35.candidate" : 0.13837967813014984,
    "rollback-3.key.35.control" : 0.2263779491186142,
    "rollback-3.key.39.candidate" : 0.06679687649011612,
    "rollback-3.key.39.control" : 0.16093750298023224,
    "rollback-3.key.43.candidate" : 0.05697279050946236,
    "rollback-3.key.43.control" : 0.1301020383834839,
    "rollback-3.key.47.candidate" : 0.09053497761487961,
    "rollback-3.key.47.control" : 0.1561214029788971,
    "rollback-3.key.7.candidate" : 0.021396396681666374,
    "rollback-3.key.7.control" : 0.09459459781646729,
    "rollback-3.logits.candidate" : 0.07797271013259888,
    "rollback-3.logits.control" : 0.07261208444833755,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 0.0015982597833499312,
    "rollback-3.ssm.10.candidate" : 0.018934674561023712,
    "rollback-3.ssm.10.control" : 0.029586680233478546,
    "rollback-3.ssm.12.candidate" : 0.002536253770813346,
    "rollback-3.ssm.12.control" : 0.004854151513427496,
    "rollback-3.ssm.13.candidate" : 0.016782967373728752,
    "rollback-3.ssm.13.control" : 0.025944620370864868,
    "rollback-3.ssm.14.candidate" : 0.00675595086067915,
    "rollback-3.ssm.14.control" : 0.013452346436679363,
    "rollback-3.ssm.16.candidate" : 0.02943580038845539,
    "rollback-3.ssm.16.control" : 0.02035994827747345,
    "rollback-3.ssm.17.candidate" : 0.036669373512268066,
    "rollback-3.ssm.17.control" : 0.0572931133210659,
    "rollback-3.ssm.18.candidate" : 0.03868653252720833,
    "rollback-3.ssm.18.control" : 0.088945671916008,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0.013729231432080269,
    "rollback-3.ssm.20.candidate" : 0.014777589589357376,
    "rollback-3.ssm.20.control" : 0.020713424310088158,
    "rollback-3.ssm.21.candidate" : 0.014281000941991806,
    "rollback-3.ssm.21.control" : 0.016859257593750954,
    "rollback-3.ssm.22.candidate" : 0.0021911270450800657,
    "rollback-3.ssm.22.control" : 0.008213380351662636,
    "rollback-3.ssm.24.candidate" : 0.016979139298200607,
    "rollback-3.ssm.24.control" : 0.023476973176002502,
    "rollback-3.ssm.25.candidate" : 0.053512927144765854,
    "rollback-3.ssm.25.control" : 0.07173406332731247,
    "rollback-3.ssm.26.candidate" : 0.06883767247200012,
    "rollback-3.ssm.26.control" : 0.08144234865903854,
    "rollback-3.ssm.28.candidate" : 0.005850080866366625,
    "rollback-3.ssm.28.control" : 0.004658431280404329,
    "rollback-3.ssm.29.candidate" : 0.044157661497592926,
    "rollback-3.ssm.29.control" : 0.06612418591976166,
    "rollback-3.ssm.30.candidate" : 0.048494622111320496,
    "rollback-3.ssm.30.control" : 0.03367914259433746,
    "rollback-3.ssm.32.candidate" : 0.15693071484565735,
    "rollback-3.ssm.32.control" : 0.04926076531410217,
    "rollback-3.ssm.33.candidate" : 0.10473282635211945,
    "rollback-3.ssm.33.control" : 0.08814965933561325,
    "rollback-3.ssm.34.candidate" : 0.12307146191596985,
    "rollback-3.ssm.34.control" : 0.18050742149353027,
    "rollback-3.ssm.36.candidate" : 0.0676831528544426,
    "rollback-3.ssm.36.control" : 0.1104763001203537,
    "rollback-3.ssm.37.candidate" : 0.03738757595419884,
    "rollback-3.ssm.37.control" : 0.03146883472800255,
    "rollback-3.ssm.38.candidate" : 0.016972381621599197,
    "rollback-3.ssm.38.control" : 0.01716495305299759,
    "rollback-3.ssm.4.candidate" : 0.0006626663380302489,
    "rollback-3.ssm.4.control" : 0.026491770520806313,
    "rollback-3.ssm.40.candidate" : 0.010628577321767807,
    "rollback-3.ssm.40.control" : 0.02534874901175499,
    "rollback-3.ssm.41.candidate" : 0.008668365888297558,
    "rollback-3.ssm.41.control" : 0.04132749140262604,
    "rollback-3.ssm.42.candidate" : 0.026353437453508377,
    "rollback-3.ssm.42.control" : 0.06392312794923782,
    "rollback-3.ssm.44.candidate" : 0.04340111464262009,
    "rollback-3.ssm.44.control" : 0.051649391651153564,
    "rollback-3.ssm.45.candidate" : 0.057308975607156754,
    "rollback-3.ssm.45.control" : 0.12049714475870132,
    "rollback-3.ssm.46.candidate" : 0.08149773627519608,
    "rollback-3.ssm.46.control" : 0.1374494433403015,
    "rollback-3.ssm.5.candidate" : 0.007288029883056879,
    "rollback-3.ssm.5.control" : 0.05189232900738716,
    "rollback-3.ssm.6.candidate" : 0.006689929403364658,
    "rollback-3.ssm.6.control" : 0.013764054514467716,
    "rollback-3.ssm.8.candidate" : 0.005367303267121315,
    "rollback-3.ssm.8.control" : 0.010599642992019653,
    "rollback-3.ssm.9.candidate" : 0.01629641279578209,
    "rollback-3.ssm.9.control" : 0.029473112896084785,
    "rollback-3.value.11.candidate" : 0.006519784219563007,
    "rollback-3.value.11.control" : 0.037938401103019714,
    "rollback-3.value.15.candidate" : 0.012026114389300346,
    "rollback-3.value.15.control" : 0.026954680681228638,
    "rollback-3.value.19.candidate" : 0.010841837152838707,
    "rollback-3.value.19.control" : 0.022448979318141937,
    "rollback-3.value.23.candidate" : 0.02500000037252903,
    "rollback-3.value.23.control" : 0.04898255690932274,
    "rollback-3.value.27.candidate" : 0.007539335638284683,
    "rollback-3.value.27.control" : 0.014095279388129711,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0.0514964796602726,
    "rollback-3.value.31.candidate" : 0.042391303926706314,
    "rollback-3.value.31.control" : 0.07581521570682526,
    "rollback-3.value.35.candidate" : 0.046875,
    "rollback-3.value.35.control" : 0.10303442180156708,
    "rollback-3.value.39.candidate" : 0.02976190485060215,
    "rollback-3.value.39.control" : 0.05788690596818924,
    "rollback-3.value.43.candidate" : 0.03086419776082039,
    "rollback-3.value.43.control" : 0.04938271641731262,
    "rollback-3.value.47.candidate" : 0.12804877758026123,
    "rollback-3.value.47.control" : 0.4176829159259796,
    "rollback-3.value.7.candidate" : 0.009730539284646511,
    "rollback-3.value.7.control" : 0.025449100881814957,
    "routing.candidate" : 5.103934669636229e-05,
    "routing.control" : 0.03099944320712695,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-64-swept-router-padded-attention-aligned-projections-aligned\/tokens=449\/prefix=0",
  "passed" : false
}

````

## context-small-projections-shorttail-64-13/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
