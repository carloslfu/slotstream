---
type: run
id: 01m1w0be8wefkxg9b2k45jncrq
created: 2026-09-06T18:40:36.124404+00:00
updated: 2026-09-06T18:40:36.301029+00:00
summary: Tiny-query shape correction passes short-tail and sparse-prefix controls
binary: 11f4c4aad91c8e17631e98c35f9f894eba56a745f95888eb726b1ba9a923c1b8
captured_at: 2026-09-06
command: Exact commands and frozen identity below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Tiny-query shape correction passes short-tail and sparse-prefix controls
tool: Native Swift diagnostics and Python CLI gates
---
# Very short terminal and sparse-prefix witnesses

All four build 15 C07 cases pass their unchanged 1605-assertion criteria:
449-token short-terminal prompts at 64/128 rows and the sparse-indexer prefix
case at both sizes. The earlier 256-row reference, 512-row rechunk control,
repeated candidate, teacher continuations and speculative rollback remain.
The short-tail 64 case records one nonzero candidate measure:
`prefill.logits.candidate = 0.0069444445`, inside the frozen 0.01 minimum band;
all greedy tokens agree. Its other measures, and all candidate measures in
the other three cases, are exactly zero. No tolerance or expected token changed.

The correction pads only a tiny attention query tile (at most eight logical
queries in a larger canonical reference domain) to 64 physical query rows,
then crops before output and recurrent state updates. Repeated masked query
rows preserve the reference matrix-attention family. Physical query rows and
actual key extent are both recorded and charged to the product/workspace
bound. Real terminal reference domains of at most eight queries stay unchanged.

Commands: `slotstream optimization-state-check --variant <case> --json`,
with the exact case names in the raw sections. These bounded runs overlapped
a coordinated anonymous model download; every timing and capacity interpretation
is excluded. Together with build 13's six exact witnesses they close the
predeclared bounded shape matrix for the identified diagnostic family.

Ordinary Generator activation of the family and canonicalization of odd late
chunk requests were edited only after this frozen build and remain unbuilt.
Full long-window, retained-state, actual MTP-head and release/client gates stay
open. The diagnostic result does not raise the public implementation ceiling.

## Frozen build identity

```json
{
  "binary_sha256": "11f4c4aad91c8e17631e98c35f9f894eba56a745f95888eb726b1ba9a923c1b8",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "f7c78686476ad9287ea3f6e995a6ff031824f10463223cadba36d0568223ba63"
}
```

## context-small-projections-shorttail-64-15/stdout.txt

SHA-256 `a8aab83585936c35e75e20f7733aa097fb50c7ee461b967d9bf5ae7214d06e14`; 229647 bytes.

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
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
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
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
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
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
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
      "name" : "continued-907: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.36",
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
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
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
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
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
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
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
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
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
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
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
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.36",
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
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
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
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
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
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
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
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
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
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
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
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.36",
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
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
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
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
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
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
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
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
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
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
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
    "arm0.padded_query_rows" : 0,
    "arm0.read_records" : 16132,
    "arm0.seconds" : 5.476125125,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 28311552,
    "arm1.chunk" : 512,
    "arm1.padded_query_rows" : 0,
    "arm1.read_records" : 9281,
    "arm1.seconds" : 2.85874175,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 28311552,
    "arm2.chunk" : 64,
    "arm2.padded_query_rows" : 756,
    "arm2.read_records" : 34268,
    "arm2.seconds" : 11.521106291,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 28311552,
    "arm3.chunk" : 64,
    "arm3.padded_query_rows" : 756,
    "arm3.read_records" : 33502,
    "arm3.seconds" : 11.114413834,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0.003759398590773344,
    "continued-1337.conv.10.candidate" : 0,
    "continued-1337.conv.10.control" : 0.01785714365541935,
    "continued-1337.conv.12.candidate" : 0,
    "continued-1337.conv.12.control" : 0.01295045018196106,
    "continued-1337.conv.13.candidate" : 0,
    "continued-1337.conv.13.control" : 0.014367816038429737,
    "continued-1337.conv.14.candidate" : 0,
    "continued-1337.conv.14.control" : 0.01632973551750183,
    "continued-1337.conv.16.candidate" : 0,
    "continued-1337.conv.16.control" : 0.039024390280246735,
    "continued-1337.conv.17.candidate" : 0,
    "continued-1337.conv.17.control" : 0.04891304299235344,
    "continued-1337.conv.18.candidate" : 0,
    "continued-1337.conv.18.control" : 0.030837005004286766,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0.008713942021131516,
    "continued-1337.conv.20.candidate" : 0,
    "continued-1337.conv.20.control" : 0.03276699036359787,
    "continued-1337.conv.21.candidate" : 0,
    "continued-1337.conv.21.control" : 0.03488372266292572,
    "continued-1337.conv.22.candidate" : 0,
    "continued-1337.conv.22.control" : 0.014705882407724857,
    "continued-1337.conv.24.candidate" : 0,
    "continued-1337.conv.24.control" : 0.0315755195915699,
    "continued-1337.conv.25.candidate" : 0,
    "continued-1337.conv.25.control" : 0.024671053513884544,
    "continued-1337.conv.26.candidate" : 0,
    "continued-1337.conv.26.control" : 0.028596697375178337,
    "continued-1337.conv.28.candidate" : 0,
    "continued-1337.conv.28.control" : 0.048557691276073456,
    "continued-1337.conv.29.candidate" : 0,
    "continued-1337.conv.29.control" : 0.07947976887226105,
    "continued-1337.conv.30.candidate" : 0,
    "continued-1337.conv.30.control" : 0.0818236693739891,
    "continued-1337.conv.32.candidate" : 0,
    "continued-1337.conv.32.control" : 0.08633474260568619,
    "continued-1337.conv.33.candidate" : 0,
    "continued-1337.conv.33.control" : 0.07307692617177963,
    "continued-1337.conv.34.candidate" : 0,
    "continued-1337.conv.34.control" : 0.10289300978183746,
    "continued-1337.conv.36.candidate" : 0,
    "continued-1337.conv.36.control" : 0.09158416092395782,
    "continued-1337.conv.37.candidate" : 0,
    "continued-1337.conv.37.control" : 0.0833333358168602,
    "continued-1337.conv.38.candidate" : 0,
    "continued-1337.conv.38.control" : 0.03570015728473663,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0.012658228166401386,
    "continued-1337.conv.40.candidate" : 0,
    "continued-1337.conv.40.control" : 0.07857143133878708,
    "continued-1337.conv.41.candidate" : 0,
    "continued-1337.conv.41.control" : 0.08366534113883972,
    "continued-1337.conv.42.candidate" : 0,
    "continued-1337.conv.42.control" : 0.052642617374658585,
    "continued-1337.conv.44.candidate" : 0,
    "continued-1337.conv.44.control" : 0.17123287916183472,
    "continued-1337.conv.45.candidate" : 0,
    "continued-1337.conv.45.control" : 0.06327589601278305,
    "continued-1337.conv.46.candidate" : 0,
    "continued-1337.conv.46.control" : 0.07471264153718948,
    "continued-1337.conv.5.candidate" : 0,
    "continued-1337.conv.5.control" : 0.02500000037252903,
    "continued-1337.conv.6.candidate" : 0,
    "continued-1337.conv.6.control" : 0.010765550658106804,
    "continued-1337.conv.8.candidate" : 0,
    "continued-1337.conv.8.control" : 0.008600917644798756,
    "continued-1337.conv.9.candidate" : 0,
    "continued-1337.conv.9.control" : 0.010582010261714458,
    "continued-1337.index.11.candidate" : 0,
    "continued-1337.index.11.control" : 0.036651235073804855,
    "continued-1337.index.15.candidate" : 0,
    "continued-1337.index.15.control" : 0.04915730282664299,
    "continued-1337.index.19.candidate" : 0,
    "continued-1337.index.19.control" : 0.04823059216141701,
    "continued-1337.index.23.candidate" : 0,
    "continued-1337.index.23.control" : 0.0357142873108387,
    "continued-1337.index.27.candidate" : 0,
    "continued-1337.index.27.control" : 0.05213490128517151,
    "continued-1337.index.3.candidate" : 0,
    "continued-1337.index.3.control" : 0.04844674468040466,
    "continued-1337.index.31.candidate" : 0,
    "continued-1337.index.31.control" : 0.16495901346206665,
    "continued-1337.index.35.candidate" : 0,
    "continued-1337.index.35.control" : 0.16928808391094208,
    "continued-1337.index.39.candidate" : 0,
    "continued-1337.index.39.control" : 0.06685126572847366,
    "continued-1337.index.43.candidate" : 0,
    "continued-1337.index.43.control" : 0.08535156399011612,
    "continued-1337.index.47.candidate" : 0,
    "continued-1337.index.47.control" : 0.17000000178813934,
    "continued-1337.index.7.candidate" : 0,
    "continued-1337.index.7.control" : 0.03216911852359772,
    "continued-1337.key.11.candidate" : 0,
    "continued-1337.key.11.control" : 0.09747596085071564,
    "continued-1337.key.15.candidate" : 0,
    "continued-1337.key.15.control" : 0.08759123831987381,
    "continued-1337.key.19.candidate" : 0,
    "continued-1337.key.19.control" : 0.13042840361595154,
    "continued-1337.key.23.candidate" : 0,
    "continued-1337.key.23.control" : 0.10780201107263565,
    "continued-1337.key.27.candidate" : 0,
    "continued-1337.key.27.control" : 0.13856907188892365,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0.10025380551815033,
    "continued-1337.key.31.candidate" : 0,
    "continued-1337.key.31.control" : 0.2088926136493683,
    "continued-1337.key.35.candidate" : 0,
    "continued-1337.key.35.control" : 0.2263779491186142,
    "continued-1337.key.39.candidate" : 0,
    "continued-1337.key.39.control" : 0.16093750298023224,
    "continued-1337.key.43.candidate" : 0,
    "continued-1337.key.43.control" : 0.1301020383834839,
    "continued-1337.key.47.candidate" : 0,
    "continued-1337.key.47.control" : 0.1561214029788971,
    "continued-1337.key.7.candidate" : 0,
    "continued-1337.key.7.control" : 0.09459459781646729,
    "continued-1337.logits.candidate" : 0,
    "continued-1337.logits.control" : 0.09172661602497101,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0.002358490601181984,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 0.00243970169685781,
    "continued-1337.ssm.10.candidate" : 0,
    "continued-1337.ssm.10.control" : 0.03401253744959831,
    "continued-1337.ssm.12.candidate" : 0,
    "continued-1337.ssm.12.control" : 0.003188851522281766,
    "continued-1337.ssm.13.candidate" : 0,
    "continued-1337.ssm.13.control" : 0.023419640958309174,
    "continued-1337.ssm.14.candidate" : 0,
    "continued-1337.ssm.14.control" : 0.014370560646057129,
    "continued-1337.ssm.16.candidate" : 0,
    "continued-1337.ssm.16.control" : 0.08776754885911942,
    "continued-1337.ssm.17.candidate" : 0,
    "continued-1337.ssm.17.control" : 0.023858655244112015,
    "continued-1337.ssm.18.candidate" : 0,
    "continued-1337.ssm.18.control" : 0.04174370318651199,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0.013054810464382172,
    "continued-1337.ssm.20.candidate" : 0,
    "continued-1337.ssm.20.control" : 0.04190487414598465,
    "continued-1337.ssm.21.candidate" : 0,
    "continued-1337.ssm.21.control" : 0.016556456685066223,
    "continued-1337.ssm.22.candidate" : 0,
    "continued-1337.ssm.22.control" : 0.008854847401380539,
    "continued-1337.ssm.24.candidate" : 0,
    "continued-1337.ssm.24.control" : 0.02945796214044094,
    "continued-1337.ssm.25.candidate" : 0,
    "continued-1337.ssm.25.control" : 0.07499926537275314,
    "continued-1337.ssm.26.candidate" : 0,
    "continued-1337.ssm.26.control" : 0.086530402302742,
    "continued-1337.ssm.28.candidate" : 0,
    "continued-1337.ssm.28.control" : 0.013775987550616264,
    "continued-1337.ssm.29.candidate" : 0,
    "continued-1337.ssm.29.control" : 0.04985706880688667,
    "continued-1337.ssm.30.candidate" : 0,
    "continued-1337.ssm.30.control" : 0.06472005695104599,
    "continued-1337.ssm.32.candidate" : 0,
    "continued-1337.ssm.32.control" : 0.124945268034935,
    "continued-1337.ssm.33.candidate" : 0,
    "continued-1337.ssm.33.control" : 0.09780476987361908,
    "continued-1337.ssm.34.candidate" : 0,
    "continued-1337.ssm.34.control" : 0.10403416305780411,
    "continued-1337.ssm.36.candidate" : 0,
    "continued-1337.ssm.36.control" : 0.0989178717136383,
    "continued-1337.ssm.37.candidate" : 0,
    "continued-1337.ssm.37.control" : 0.04079009220004082,
    "continued-1337.ssm.38.candidate" : 0,
    "continued-1337.ssm.38.control" : 0.018855925649404526,
    "continued-1337.ssm.4.candidate" : 0,
    "continued-1337.ssm.4.control" : 0.026957416906952858,
    "continued-1337.ssm.40.candidate" : 0,
    "continued-1337.ssm.40.control" : 0.017980946227908134,
    "continued-1337.ssm.41.candidate" : 0,
    "continued-1337.ssm.41.control" : 0.04150834679603577,
    "continued-1337.ssm.42.candidate" : 0,
    "continued-1337.ssm.42.control" : 0.04060410335659981,
    "continued-1337.ssm.44.candidate" : 0,
    "continued-1337.ssm.44.control" : 0.06645477563142776,
    "continued-1337.ssm.45.candidate" : 0,
    "continued-1337.ssm.45.control" : 0.12942716479301453,
    "continued-1337.ssm.46.candidate" : 0,
    "continued-1337.ssm.46.control" : 0.1594877988100052,
    "continued-1337.ssm.5.candidate" : 0,
    "continued-1337.ssm.5.control" : 0.04531067982316017,
    "continued-1337.ssm.6.candidate" : 0,
    "continued-1337.ssm.6.control" : 0.012301095761358738,
    "continued-1337.ssm.8.candidate" : 0,
    "continued-1337.ssm.8.control" : 0.010773622430860996,
    "continued-1337.ssm.9.candidate" : 0,
    "continued-1337.ssm.9.control" : 0.02393987402319908,
    "continued-1337.value.11.candidate" : 0,
    "continued-1337.value.11.control" : 0.037938401103019714,
    "continued-1337.value.15.candidate" : 0,
    "continued-1337.value.15.control" : 0.026954680681228638,
    "continued-1337.value.19.candidate" : 0,
    "continued-1337.value.19.control" : 0.018112244084477425,
    "continued-1337.value.23.candidate" : 0,
    "continued-1337.value.23.control" : 0.04898255690932274,
    "continued-1337.value.27.candidate" : 0,
    "continued-1337.value.27.control" : 0.014095279388129711,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0.0514964796602726,
    "continued-1337.value.31.candidate" : 0,
    "continued-1337.value.31.control" : 0.07581521570682526,
    "continued-1337.value.35.candidate" : 0,
    "continued-1337.value.35.control" : 0.10303442180156708,
    "continued-1337.value.39.candidate" : 0,
    "continued-1337.value.39.control" : 0.05788690596818924,
    "continued-1337.value.43.candidate" : 0,
    "continued-1337.value.43.control" : 0.04938271641731262,
    "continued-1337.value.47.candidate" : 0,
    "continued-1337.value.47.control" : 0.4176829159259796,
    "continued-1337.value.7.candidate" : 0,
    "continued-1337.value.7.control" : 0.025449100881814957,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0.0036764706019312143,
    "continued-2103.conv.10.candidate" : 0,
    "continued-2103.conv.10.control" : 0.015116279013454914,
    "continued-2103.conv.12.candidate" : 0,
    "continued-2103.conv.12.control" : 0.019358407706022263,
    "continued-2103.conv.13.candidate" : 0,
    "continued-2103.conv.13.control" : 0.018918918445706367,
    "continued-2103.conv.14.candidate" : 0,
    "continued-2103.conv.14.control" : 0.018041236326098442,
    "continued-2103.conv.16.candidate" : 0,
    "continued-2103.conv.16.control" : 0.039024390280246735,
    "continued-2103.conv.17.candidate" : 0,
    "continued-2103.conv.17.control" : 0.04891304299235344,
    "continued-2103.conv.18.candidate" : 0,
    "continued-2103.conv.18.control" : 0.031963471323251724,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0.008430232293903828,
    "continued-2103.conv.20.candidate" : 0,
    "continued-2103.conv.20.control" : 0.034263961017131805,
    "continued-2103.conv.21.candidate" : 0,
    "continued-2103.conv.21.control" : 0.03488372266292572,
    "continued-2103.conv.22.candidate" : 0,
    "continued-2103.conv.22.control" : 0.014598540030419827,
    "continued-2103.conv.24.candidate" : 0,
    "continued-2103.conv.24.control" : 0.03241978585720062,
    "continued-2103.conv.25.candidate" : 0,
    "continued-2103.conv.25.control" : 0.024671053513884544,
    "continued-2103.conv.26.candidate" : 0,
    "continued-2103.conv.26.control" : 0.0328054316341877,
    "continued-2103.conv.28.candidate" : 0,
    "continued-2103.conv.28.control" : 0.048557691276073456,
    "continued-2103.conv.29.candidate" : 0,
    "continued-2103.conv.29.control" : 0.07432432472705841,
    "continued-2103.conv.30.candidate" : 0,
    "continued-2103.conv.30.control" : 0.0818236693739891,
    "continued-2103.conv.32.candidate" : 0,
    "continued-2103.conv.32.control" : 0.08633474260568619,
    "continued-2103.conv.33.candidate" : 0,
    "continued-2103.conv.33.control" : 0.07307692617177963,
    "continued-2103.conv.34.candidate" : 0,
    "continued-2103.conv.34.control" : 0.10289300978183746,
    "continued-2103.conv.36.candidate" : 0,
    "continued-2103.conv.36.control" : 0.07614213228225708,
    "continued-2103.conv.37.candidate" : 0,
    "continued-2103.conv.37.control" : 0.0833333358168602,
    "continued-2103.conv.38.candidate" : 0,
    "continued-2103.conv.38.control" : 0.03293117135763168,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0.012658228166401386,
    "continued-2103.conv.40.candidate" : 0,
    "continued-2103.conv.40.control" : 0.07801418751478195,
    "continued-2103.conv.41.candidate" : 0,
    "continued-2103.conv.41.control" : 0.08366534113883972,
    "continued-2103.conv.42.candidate" : 0,
    "continued-2103.conv.42.control" : 0.051945365965366364,
    "continued-2103.conv.44.candidate" : 0,
    "continued-2103.conv.44.control" : 0.15432098507881165,
    "continued-2103.conv.45.candidate" : 0,
    "continued-2103.conv.45.control" : 0.06327589601278305,
    "continued-2103.conv.46.candidate" : 0,
    "continued-2103.conv.46.control" : 0.07222222536802292,
    "continued-2103.conv.5.candidate" : 0,
    "continued-2103.conv.5.control" : 0.02500000037252903,
    "continued-2103.conv.6.candidate" : 0,
    "continued-2103.conv.6.control" : 0.010765550658106804,
    "continued-2103.conv.8.candidate" : 0,
    "continued-2103.conv.8.control" : 0.00917431153357029,
    "continued-2103.conv.9.candidate" : 0,
    "continued-2103.conv.9.control" : 0.018617020919919014,
    "continued-2103.index.11.candidate" : 0,
    "continued-2103.index.11.control" : 0.036651235073804855,
    "continued-2103.index.15.candidate" : 0,
    "continued-2103.index.15.control" : 0.04915730282664299,
    "continued-2103.index.19.candidate" : 0,
    "continued-2103.index.19.control" : 0.04823059216141701,
    "continued-2103.index.23.candidate" : 0,
    "continued-2103.index.23.control" : 0.0357142873108387,
    "continued-2103.index.27.candidate" : 0,
    "continued-2103.index.27.control" : 0.05213490128517151,
    "continued-2103.index.3.candidate" : 0,
    "continued-2103.index.3.control" : 0.04844674468040466,
    "continued-2103.index.31.candidate" : 0,
    "continued-2103.index.31.control" : 0.16495901346206665,
    "continued-2103.index.35.candidate" : 0,
    "continued-2103.index.35.control" : 0.16928808391094208,
    "continued-2103.index.39.candidate" : 0,
    "continued-2103.index.39.control" : 0.06685126572847366,
    "continued-2103.index.43.candidate" : 0,
    "continued-2103.index.43.control" : 0.08535156399011612,
    "continued-2103.index.47.candidate" : 0,
    "continued-2103.index.47.control" : 0.17000000178813934,
    "continued-2103.index.7.candidate" : 0,
    "continued-2103.index.7.control" : 0.03216911852359772,
    "continued-2103.key.11.candidate" : 0,
    "continued-2103.key.11.control" : 0.09747596085071564,
    "continued-2103.key.15.candidate" : 0,
    "continued-2103.key.15.control" : 0.08759123831987381,
    "continued-2103.key.19.candidate" : 0,
    "continued-2103.key.19.control" : 0.13042840361595154,
    "continued-2103.key.23.candidate" : 0,
    "continued-2103.key.23.control" : 0.10780201107263565,
    "continued-2103.key.27.candidate" : 0,
    "continued-2103.key.27.control" : 0.13856907188892365,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0.10025380551815033,
    "continued-2103.key.31.candidate" : 0,
    "continued-2103.key.31.control" : 0.2088926136493683,
    "continued-2103.key.35.candidate" : 0,
    "continued-2103.key.35.control" : 0.2263779491186142,
    "continued-2103.key.39.candidate" : 0,
    "continued-2103.key.39.control" : 0.16093750298023224,
    "continued-2103.key.43.candidate" : 0,
    "continued-2103.key.43.control" : 0.1301020383834839,
    "continued-2103.key.47.candidate" : 0,
    "continued-2103.key.47.control" : 0.1561214029788971,
    "continued-2103.key.7.candidate" : 0,
    "continued-2103.key.7.control" : 0.09459459781646729,
    "continued-2103.logits.candidate" : 0,
    "continued-2103.logits.control" : 0.07326007634401321,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 0.0026787705719470978,
    "continued-2103.ssm.10.candidate" : 0,
    "continued-2103.ssm.10.control" : 0.031143467873334885,
    "continued-2103.ssm.12.candidate" : 0,
    "continued-2103.ssm.12.control" : 0.002614344470202923,
    "continued-2103.ssm.13.candidate" : 0,
    "continued-2103.ssm.13.control" : 0.023780474439263344,
    "continued-2103.ssm.14.candidate" : 0,
    "continued-2103.ssm.14.control" : 0.014368025586009026,
    "continued-2103.ssm.16.candidate" : 0,
    "continued-2103.ssm.16.control" : 0.028734911233186722,
    "continued-2103.ssm.17.candidate" : 0,
    "continued-2103.ssm.17.control" : 0.02891785278916359,
    "continued-2103.ssm.18.candidate" : 0,
    "continued-2103.ssm.18.control" : 0.06193260848522186,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0.013134132139384747,
    "continued-2103.ssm.20.candidate" : 0,
    "continued-2103.ssm.20.control" : 0.02367684617638588,
    "continued-2103.ssm.21.candidate" : 0,
    "continued-2103.ssm.21.control" : 0.01623089239001274,
    "continued-2103.ssm.22.candidate" : 0,
    "continued-2103.ssm.22.control" : 0.008682900108397007,
    "continued-2103.ssm.24.candidate" : 0,
    "continued-2103.ssm.24.control" : 0.018965991213917732,
    "continued-2103.ssm.25.candidate" : 0,
    "continued-2103.ssm.25.control" : 0.054733093827962875,
    "continued-2103.ssm.26.candidate" : 0,
    "continued-2103.ssm.26.control" : 0.05495327338576317,
    "continued-2103.ssm.28.candidate" : 0,
    "continued-2103.ssm.28.control" : 0.005612834822386503,
    "continued-2103.ssm.29.candidate" : 0,
    "continued-2103.ssm.29.control" : 0.05550353601574898,
    "continued-2103.ssm.30.candidate" : 0,
    "continued-2103.ssm.30.control" : 0.029813267290592194,
    "continued-2103.ssm.32.candidate" : 0,
    "continued-2103.ssm.32.control" : 0.12327084690332413,
    "continued-2103.ssm.33.candidate" : 0,
    "continued-2103.ssm.33.control" : 0.13337820768356323,
    "continued-2103.ssm.34.candidate" : 0,
    "continued-2103.ssm.34.control" : 0.08956097811460495,
    "continued-2103.ssm.36.candidate" : 0,
    "continued-2103.ssm.36.control" : 0.059749405831098557,
    "continued-2103.ssm.37.candidate" : 0,
    "continued-2103.ssm.37.control" : 0.07069515436887741,
    "continued-2103.ssm.38.candidate" : 0,
    "continued-2103.ssm.38.control" : 0.01771271787583828,
    "continued-2103.ssm.4.candidate" : 0,
    "continued-2103.ssm.4.control" : 0.02708258666098118,
    "continued-2103.ssm.40.candidate" : 0,
    "continued-2103.ssm.40.control" : 0.017384905368089676,
    "continued-2103.ssm.41.candidate" : 0,
    "continued-2103.ssm.41.control" : 0.04165691137313843,
    "continued-2103.ssm.42.candidate" : 0,
    "continued-2103.ssm.42.control" : 0.062465935945510864,
    "continued-2103.ssm.44.candidate" : 0,
    "continued-2103.ssm.44.control" : 0.017161983996629715,
    "continued-2103.ssm.45.candidate" : 0,
    "continued-2103.ssm.45.control" : 0.08259648829698563,
    "continued-2103.ssm.46.candidate" : 0,
    "continued-2103.ssm.46.control" : 0.13072989881038666,
    "continued-2103.ssm.5.candidate" : 0,
    "continued-2103.ssm.5.control" : 0.02513541653752327,
    "continued-2103.ssm.6.candidate" : 0,
    "continued-2103.ssm.6.control" : 0.013171319849789143,
    "continued-2103.ssm.8.candidate" : 0,
    "continued-2103.ssm.8.control" : 0.010763229802250862,
    "continued-2103.ssm.9.candidate" : 0,
    "continued-2103.ssm.9.control" : 0.026172427460551262,
    "continued-2103.value.11.candidate" : 0,
    "continued-2103.value.11.control" : 0.037938401103019714,
    "continued-2103.value.15.candidate" : 0,
    "continued-2103.value.15.control" : 0.026954680681228638,
    "continued-2103.value.19.candidate" : 0,
    "continued-2103.value.19.control" : 0.018112244084477425,
    "continued-2103.value.23.candidate" : 0,
    "continued-2103.value.23.control" : 0.04898255690932274,
    "continued-2103.value.27.candidate" : 0,
    "continued-2103.value.27.control" : 0.014095279388129711,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0.0514964796602726,
    "continued-2103.value.31.candidate" : 0,
    "continued-2103.value.31.control" : 0.07581521570682526,
    "continued-2103.value.35.candidate" : 0,
    "continued-2103.value.35.control" : 0.10303442180156708,
    "continued-2103.value.39.candidate" : 0,
    "continued-2103.value.39.control" : 0.05788690596818924,
    "continued-2103.value.43.candidate" : 0,
    "continued-2103.value.43.control" : 0.04938271641731262,
    "continued-2103.value.47.candidate" : 0,
    "continued-2103.value.47.control" : 0.4176829159259796,
    "continued-2103.value.7.candidate" : 0,
    "continued-2103.value.7.control" : 0.025449100881814957,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0.007462686393409967,
    "continued-907.conv.10.candidate" : 0,
    "continued-907.conv.10.control" : 0.01785714365541935,
    "continued-907.conv.12.candidate" : 0,
    "continued-907.conv.12.control" : 0.016255605965852737,
    "continued-907.conv.13.candidate" : 0,
    "continued-907.conv.13.control" : 0.016678370535373688,
    "continued-907.conv.14.candidate" : 0,
    "continued-907.conv.14.control" : 0.017502589151263237,
    "continued-907.conv.16.candidate" : 0,
    "continued-907.conv.16.control" : 0.0416666679084301,
    "continued-907.conv.17.candidate" : 0,
    "continued-907.conv.17.control" : 0.04891304299235344,
    "continued-907.conv.18.candidate" : 0,
    "continued-907.conv.18.control" : 0.030837005004286766,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0.004566209856420755,
    "continued-907.conv.20.candidate" : 0,
    "continued-907.conv.20.control" : 0.03276699036359787,
    "continued-907.conv.21.candidate" : 0,
    "continued-907.conv.21.control" : 0.029069768264889717,
    "continued-907.conv.22.candidate" : 0,
    "continued-907.conv.22.control" : 0.014084506779909134,
    "continued-907.conv.24.candidate" : 0,
    "continued-907.conv.24.control" : 0.03125,
    "continued-907.conv.25.candidate" : 0,
    "continued-907.conv.25.control" : 0.025841346010565758,
    "continued-907.conv.26.candidate" : 0,
    "continued-907.conv.26.control" : 0.0277122650295496,
    "continued-907.conv.28.candidate" : 0,
    "continued-907.conv.28.control" : 0.04931640625,
    "continued-907.conv.29.candidate" : 0,
    "continued-907.conv.29.control" : 0.06521739065647125,
    "continued-907.conv.30.candidate" : 0,
    "continued-907.conv.30.control" : 0.08730670064687729,
    "continued-907.conv.32.candidate" : 0,
    "continued-907.conv.32.control" : 0.10036946088075638,
    "continued-907.conv.33.candidate" : 0,
    "continued-907.conv.33.control" : 0.07307692617177963,
    "continued-907.conv.34.candidate" : 0,
    "continued-907.conv.34.control" : 0.10289300978183746,
    "continued-907.conv.36.candidate" : 0,
    "continued-907.conv.36.control" : 0.09158416092395782,
    "continued-907.conv.37.candidate" : 0,
    "continued-907.conv.37.control" : 0.07623318582773209,
    "continued-907.conv.38.candidate" : 0,
    "continued-907.conv.38.control" : 0.03570015728473663,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0.004980079829692841,
    "continued-907.conv.40.candidate" : 0,
    "continued-907.conv.40.control" : 0.08626760542392731,
    "continued-907.conv.41.candidate" : 0,
    "continued-907.conv.41.control" : 0.08399999886751175,
    "continued-907.conv.42.candidate" : 0,
    "continued-907.conv.42.control" : 0.05126633867621422,
    "continued-907.conv.44.candidate" : 0,
    "continued-907.conv.44.control" : 0.15625,
    "continued-907.conv.45.candidate" : 0,
    "continued-907.conv.45.control" : 0.06327589601278305,
    "continued-907.conv.46.candidate" : 0,
    "continued-907.conv.46.control" : 0.0714285746216774,
    "continued-907.conv.5.candidate" : 0,
    "continued-907.conv.5.control" : 0.02801724150776863,
    "continued-907.conv.6.candidate" : 0,
    "continued-907.conv.6.control" : 0.008971291594207287,
    "continued-907.conv.8.candidate" : 0,
    "continued-907.conv.8.control" : 0.008600917644798756,
    "continued-907.conv.9.candidate" : 0,
    "continued-907.conv.9.control" : 0.010582010261714458,
    "continued-907.index.11.candidate" : 0,
    "continued-907.index.11.control" : 0.036651235073804855,
    "continued-907.index.15.candidate" : 0,
    "continued-907.index.15.control" : 0.04915730282664299,
    "continued-907.index.19.candidate" : 0,
    "continued-907.index.19.control" : 0.04823059216141701,
    "continued-907.index.23.candidate" : 0,
    "continued-907.index.23.control" : 0.0357142873108387,
    "continued-907.index.27.candidate" : 0,
    "continued-907.index.27.control" : 0.05213490128517151,
    "continued-907.index.3.candidate" : 0,
    "continued-907.index.3.control" : 0.04844674468040466,
    "continued-907.index.31.candidate" : 0,
    "continued-907.index.31.control" : 0.16495901346206665,
    "continued-907.index.35.candidate" : 0,
    "continued-907.index.35.control" : 0.16928808391094208,
    "continued-907.index.39.candidate" : 0,
    "continued-907.index.39.control" : 0.06685126572847366,
    "continued-907.index.43.candidate" : 0,
    "continued-907.index.43.control" : 0.08535156399011612,
    "continued-907.index.47.candidate" : 0,
    "continued-907.index.47.control" : 0.17000000178813934,
    "continued-907.index.7.candidate" : 0,
    "continued-907.index.7.control" : 0.03216911852359772,
    "continued-907.key.11.candidate" : 0,
    "continued-907.key.11.control" : 0.09747596085071564,
    "continued-907.key.15.candidate" : 0,
    "continued-907.key.15.control" : 0.08759123831987381,
    "continued-907.key.19.candidate" : 0,
    "continued-907.key.19.control" : 0.13042840361595154,
    "continued-907.key.23.candidate" : 0,
    "continued-907.key.23.control" : 0.10780201107263565,
    "continued-907.key.27.candidate" : 0,
    "continued-907.key.27.control" : 0.13856907188892365,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0.10025380551815033,
    "continued-907.key.31.candidate" : 0,
    "continued-907.key.31.control" : 0.2088926136493683,
    "continued-907.key.35.candidate" : 0,
    "continued-907.key.35.control" : 0.2263779491186142,
    "continued-907.key.39.candidate" : 0,
    "continued-907.key.39.control" : 0.16093750298023224,
    "continued-907.key.43.candidate" : 0,
    "continued-907.key.43.control" : 0.1301020383834839,
    "continued-907.key.47.candidate" : 0,
    "continued-907.key.47.control" : 0.1561214029788971,
    "continued-907.key.7.candidate" : 0,
    "continued-907.key.7.control" : 0.09459459781646729,
    "continued-907.logits.candidate" : 0,
    "continued-907.logits.control" : 0.10332749783992767,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0.002358490601181984,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 0.0029804306104779243,
    "continued-907.ssm.10.candidate" : 0,
    "continued-907.ssm.10.control" : 0.023899657651782036,
    "continued-907.ssm.12.candidate" : 0,
    "continued-907.ssm.12.control" : 0.0027617975138127804,
    "continued-907.ssm.13.candidate" : 0,
    "continued-907.ssm.13.control" : 0.025602074339985847,
    "continued-907.ssm.14.candidate" : 0,
    "continued-907.ssm.14.control" : 0.01441024150699377,
    "continued-907.ssm.16.candidate" : 0,
    "continued-907.ssm.16.control" : 0.030779048800468445,
    "continued-907.ssm.17.candidate" : 0,
    "continued-907.ssm.17.control" : 0.04661482945084572,
    "continued-907.ssm.18.candidate" : 0,
    "continued-907.ssm.18.control" : 0.052911557257175446,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0.012658442370593548,
    "continued-907.ssm.20.candidate" : 0,
    "continued-907.ssm.20.control" : 0.018170980736613274,
    "continued-907.ssm.21.candidate" : 0,
    "continued-907.ssm.21.control" : 0.04367716982960701,
    "continued-907.ssm.22.candidate" : 0,
    "continued-907.ssm.22.control" : 0.009105023927986622,
    "continued-907.ssm.24.candidate" : 0,
    "continued-907.ssm.24.control" : 0.023251205682754517,
    "continued-907.ssm.25.candidate" : 0,
    "continued-907.ssm.25.control" : 0.03976874426007271,
    "continued-907.ssm.26.candidate" : 0,
    "continued-907.ssm.26.control" : 0.07139058411121368,
    "continued-907.ssm.28.candidate" : 0,
    "continued-907.ssm.28.control" : 0.005853470880538225,
    "continued-907.ssm.29.candidate" : 0,
    "continued-907.ssm.29.control" : 0.04265253245830536,
    "continued-907.ssm.30.candidate" : 0,
    "continued-907.ssm.30.control" : 0.05644851550459862,
    "continued-907.ssm.32.candidate" : 0,
    "continued-907.ssm.32.control" : 0.051649149507284164,
    "continued-907.ssm.33.candidate" : 0,
    "continued-907.ssm.33.control" : 0.11917489022016525,
    "continued-907.ssm.34.candidate" : 0,
    "continued-907.ssm.34.control" : 0.1024438738822937,
    "continued-907.ssm.36.candidate" : 0,
    "continued-907.ssm.36.control" : 0.0628051832318306,
    "continued-907.ssm.37.candidate" : 0,
    "continued-907.ssm.37.control" : 0.035683371126651764,
    "continued-907.ssm.38.candidate" : 0,
    "continued-907.ssm.38.control" : 0.024183083325624466,
    "continued-907.ssm.4.candidate" : 0,
    "continued-907.ssm.4.control" : 0.026571525260806084,
    "continued-907.ssm.40.candidate" : 0,
    "continued-907.ssm.40.control" : 0.017173657193779945,
    "continued-907.ssm.41.candidate" : 0,
    "continued-907.ssm.41.control" : 0.041870955377817154,
    "continued-907.ssm.42.candidate" : 0,
    "continued-907.ssm.42.control" : 0.03485302999615669,
    "continued-907.ssm.44.candidate" : 0,
    "continued-907.ssm.44.control" : 0.019561486318707466,
    "continued-907.ssm.45.candidate" : 0,
    "continued-907.ssm.45.control" : 0.09316158294677734,
    "continued-907.ssm.46.candidate" : 0,
    "continued-907.ssm.46.control" : 0.17210634052753448,
    "continued-907.ssm.5.candidate" : 0,
    "continued-907.ssm.5.control" : 0.03633773326873779,
    "continued-907.ssm.6.candidate" : 0,
    "continued-907.ssm.6.control" : 0.012331650592386723,
    "continued-907.ssm.8.candidate" : 0,
    "continued-907.ssm.8.control" : 0.010783889330923557,
    "continued-907.ssm.9.candidate" : 0,
    "continued-907.ssm.9.control" : 0.02468608319759369,
    "continued-907.value.11.candidate" : 0,
    "continued-907.value.11.control" : 0.037938401103019714,
    "continued-907.value.15.candidate" : 0,
    "continued-907.value.15.control" : 0.026954680681228638,
    "continued-907.value.19.candidate" : 0,
    "continued-907.value.19.control" : 0.018112244084477425,
    "continued-907.value.23.candidate" : 0,
    "continued-907.value.23.control" : 0.04898255690932274,
    "continued-907.value.27.candidate" : 0,
    "continued-907.value.27.control" : 0.014095279388129711,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0.0514964796602726,
    "continued-907.value.31.candidate" : 0,
    "continued-907.value.31.control" : 0.07581521570682526,
    "continued-907.value.35.candidate" : 0,
    "continued-907.value.35.control" : 0.10303442180156708,
    "continued-907.value.39.candidate" : 0,
    "continued-907.value.39.control" : 0.05788690596818924,
    "continued-907.value.43.candidate" : 0,
    "continued-907.value.43.control" : 0.04938271641731262,
    "continued-907.value.47.candidate" : 0,
    "continued-907.value.47.control" : 0.4176829159259796,
    "continued-907.value.7.candidate" : 0,
    "continued-907.value.7.control" : 0.025449100881814957,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0.007462686393409967,
    "prefill.conv.10.candidate" : 0,
    "prefill.conv.10.control" : 0.01785714365541935,
    "prefill.conv.12.candidate" : 0,
    "prefill.conv.12.control" : 0.018497757613658905,
    "prefill.conv.13.candidate" : 0,
    "prefill.conv.13.control" : 0.01825842633843422,
    "prefill.conv.14.candidate" : 0,
    "prefill.conv.14.control" : 0.016067421063780785,
    "prefill.conv.16.candidate" : 0,
    "prefill.conv.16.control" : 0.016635572537779808,
    "prefill.conv.17.candidate" : 0,
    "prefill.conv.17.control" : 0.014492753893136978,
    "prefill.conv.18.candidate" : 0,
    "prefill.conv.18.control" : 0.013491189107298851,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0.00570776266977191,
    "prefill.conv.20.candidate" : 0,
    "prefill.conv.20.control" : 0.019417475908994675,
    "prefill.conv.21.candidate" : 0,
    "prefill.conv.21.control" : 0.023170731961727142,
    "prefill.conv.22.candidate" : 0,
    "prefill.conv.22.control" : 0.012456294149160385,
    "prefill.conv.24.candidate" : 0,
    "prefill.conv.24.control" : 0.02864583395421505,
    "prefill.conv.25.candidate" : 0,
    "prefill.conv.25.control" : 0.025841346010565758,
    "prefill.conv.26.candidate" : 0,
    "prefill.conv.26.control" : 0.021226415410637856,
    "prefill.conv.28.candidate" : 0,
    "prefill.conv.28.control" : 0.03414726257324219,
    "prefill.conv.29.candidate" : 0,
    "prefill.conv.29.control" : 0.04415760934352875,
    "prefill.conv.30.candidate" : 0,
    "prefill.conv.30.control" : 0.0670103058218956,
    "prefill.conv.32.candidate" : 0,
    "prefill.conv.32.control" : 0.054999999701976776,
    "prefill.conv.33.candidate" : 0,
    "prefill.conv.33.control" : 0.06778845936059952,
    "prefill.conv.34.candidate" : 0,
    "prefill.conv.34.control" : 0.07236842066049576,
    "prefill.conv.36.candidate" : 0,
    "prefill.conv.36.control" : 0.0876777246594429,
    "prefill.conv.37.candidate" : 0,
    "prefill.conv.37.control" : 0.05752212554216385,
    "prefill.conv.38.candidate" : 0,
    "prefill.conv.38.control" : 0.034185606986284256,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0.0039840638637542725,
    "prefill.conv.40.candidate" : 0,
    "prefill.conv.40.control" : 0.08626760542392731,
    "prefill.conv.41.candidate" : 0,
    "prefill.conv.41.control" : 0.05550000071525574,
    "prefill.conv.42.candidate" : 0,
    "prefill.conv.42.control" : 0.05106209218502045,
    "prefill.conv.44.candidate" : 0,
    "prefill.conv.44.control" : 0.11249999701976776,
    "prefill.conv.45.candidate" : 0,
    "prefill.conv.45.control" : 0.04432398080825806,
    "prefill.conv.46.candidate" : 0,
    "prefill.conv.46.control" : 0.048076923936605453,
    "prefill.conv.5.candidate" : 0,
    "prefill.conv.5.control" : 0.01834862306714058,
    "prefill.conv.6.candidate" : 0,
    "prefill.conv.6.control" : 0.008391203358769417,
    "prefill.conv.8.candidate" : 0,
    "prefill.conv.8.control" : 0.007735148537904024,
    "prefill.conv.9.candidate" : 0,
    "prefill.conv.9.control" : 0.010582010261714458,
    "prefill.index.11.candidate" : 0,
    "prefill.index.11.control" : 0.036651235073804855,
    "prefill.index.15.candidate" : 0,
    "prefill.index.15.control" : 0.04915730282664299,
    "prefill.index.19.candidate" : 0,
    "prefill.index.19.control" : 0.04823059216141701,
    "prefill.index.23.candidate" : 0,
    "prefill.index.23.control" : 0.0357142873108387,
    "prefill.index.27.candidate" : 0,
    "prefill.index.27.control" : 0.05213490128517151,
    "prefill.index.3.candidate" : 0,
    "prefill.index.3.control" : 0.04844674468040466,
    "prefill.index.31.candidate" : 0,
    "prefill.index.31.control" : 0.16495901346206665,
    "prefill.index.35.candidate" : 0,
    "prefill.index.35.control" : 0.16928808391094208,
    "prefill.index.39.candidate" : 0,
    "prefill.index.39.control" : 0.06685126572847366,
    "prefill.index.43.candidate" : 0,
    "prefill.index.43.control" : 0.08535156399011612,
    "prefill.index.47.candidate" : 0,
    "prefill.index.47.control" : 0.17000000178813934,
    "prefill.index.7.candidate" : 0,
    "prefill.index.7.control" : 0.03216911852359772,
    "prefill.key.11.candidate" : 0,
    "prefill.key.11.control" : 0.09747596085071564,
    "prefill.key.15.candidate" : 0,
    "prefill.key.15.control" : 0.08759123831987381,
    "prefill.key.19.candidate" : 0,
    "prefill.key.19.control" : 0.13042840361595154,
    "prefill.key.23.candidate" : 0,
    "prefill.key.23.control" : 0.10780201107263565,
    "prefill.key.27.candidate" : 0,
    "prefill.key.27.control" : 0.13856907188892365,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0.10025380551815033,
    "prefill.key.31.candidate" : 0,
    "prefill.key.31.control" : 0.2088926136493683,
    "prefill.key.35.candidate" : 0,
    "prefill.key.35.control" : 0.2263779491186142,
    "prefill.key.39.candidate" : 0,
    "prefill.key.39.control" : 0.16093750298023224,
    "prefill.key.43.candidate" : 0,
    "prefill.key.43.control" : 0.1301020383834839,
    "prefill.key.47.candidate" : 0,
    "prefill.key.47.control" : 0.1561214029788971,
    "prefill.key.7.candidate" : 0,
    "prefill.key.7.control" : 0.09459459781646729,
    "prefill.logits.candidate" : 0.0069444444961845875,
    "prefill.logits.control" : 0.09259258955717087,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0.004716981202363968,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 0.002704237587749958,
    "prefill.ssm.10.candidate" : 0,
    "prefill.ssm.10.control" : 0.04185683652758598,
    "prefill.ssm.12.candidate" : 0,
    "prefill.ssm.12.control" : 0.0041755507700145245,
    "prefill.ssm.13.candidate" : 0,
    "prefill.ssm.13.control" : 0.025806840509176254,
    "prefill.ssm.14.candidate" : 0,
    "prefill.ssm.14.control" : 0.014317338354885578,
    "prefill.ssm.16.candidate" : 0,
    "prefill.ssm.16.control" : 0.030117077752947807,
    "prefill.ssm.17.candidate" : 0,
    "prefill.ssm.17.control" : 0.015753688290715218,
    "prefill.ssm.18.candidate" : 0,
    "prefill.ssm.18.control" : 0.030686693266034126,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0.011411177925765514,
    "prefill.ssm.20.candidate" : 0,
    "prefill.ssm.20.control" : 0.013600090518593788,
    "prefill.ssm.21.candidate" : 0,
    "prefill.ssm.21.control" : 0.021862631663680077,
    "prefill.ssm.22.candidate" : 0,
    "prefill.ssm.22.control" : 0.009415468201041222,
    "prefill.ssm.24.candidate" : 0,
    "prefill.ssm.24.control" : 0.025286737829446793,
    "prefill.ssm.25.candidate" : 0,
    "prefill.ssm.25.control" : 0.029029227793216705,
    "prefill.ssm.26.candidate" : 0,
    "prefill.ssm.26.control" : 0.03773251920938492,
    "prefill.ssm.28.candidate" : 0,
    "prefill.ssm.28.control" : 0.00403100810945034,
    "prefill.ssm.29.candidate" : 0,
    "prefill.ssm.29.control" : 0.050416283309459686,
    "prefill.ssm.30.candidate" : 0,
    "prefill.ssm.30.control" : 0.031091658398509026,
    "prefill.ssm.32.candidate" : 0,
    "prefill.ssm.32.control" : 0.06386008113622665,
    "prefill.ssm.33.candidate" : 0,
    "prefill.ssm.33.control" : 0.07677856087684631,
    "prefill.ssm.34.candidate" : 0,
    "prefill.ssm.34.control" : 0.06809794902801514,
    "prefill.ssm.36.candidate" : 0,
    "prefill.ssm.36.control" : 0.0710095539689064,
    "prefill.ssm.37.candidate" : 0,
    "prefill.ssm.37.control" : 0.05589859187602997,
    "prefill.ssm.38.candidate" : 0,
    "prefill.ssm.38.control" : 0.016206664964556694,
    "prefill.ssm.4.candidate" : 0,
    "prefill.ssm.4.control" : 0.02719864435493946,
    "prefill.ssm.40.candidate" : 0,
    "prefill.ssm.40.control" : 0.017824072390794754,
    "prefill.ssm.41.candidate" : 0,
    "prefill.ssm.41.control" : 0.04140927270054817,
    "prefill.ssm.42.candidate" : 0,
    "prefill.ssm.42.control" : 0.03370935842394829,
    "prefill.ssm.44.candidate" : 0,
    "prefill.ssm.44.control" : 0.019831746816635132,
    "prefill.ssm.45.candidate" : 0,
    "prefill.ssm.45.control" : 0.06491202861070633,
    "prefill.ssm.46.candidate" : 0,
    "prefill.ssm.46.control" : 0.18722502887248993,
    "prefill.ssm.5.candidate" : 0,
    "prefill.ssm.5.control" : 0.025340046733617783,
    "prefill.ssm.6.candidate" : 0,
    "prefill.ssm.6.control" : 0.01200084201991558,
    "prefill.ssm.8.candidate" : 0,
    "prefill.ssm.8.control" : 0.010806315578520298,
    "prefill.ssm.9.candidate" : 0,
    "prefill.ssm.9.control" : 0.026259908452630043,
    "prefill.value.11.candidate" : 0,
    "prefill.value.11.control" : 0.037938401103019714,
    "prefill.value.15.candidate" : 0,
    "prefill.value.15.control" : 0.026954680681228638,
    "prefill.value.19.candidate" : 0,
    "prefill.value.19.control" : 0.018112244084477425,
    "prefill.value.23.candidate" : 0,
    "prefill.value.23.control" : 0.04898255690932274,
    "prefill.value.27.candidate" : 0,
    "prefill.value.27.control" : 0.014095279388129711,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0.0514964796602726,
    "prefill.value.31.candidate" : 0,
    "prefill.value.31.control" : 0.07581521570682526,
    "prefill.value.35.candidate" : 0,
    "prefill.value.35.control" : 0.10303442180156708,
    "prefill.value.39.candidate" : 0,
    "prefill.value.39.control" : 0.05788690596818924,
    "prefill.value.43.candidate" : 0,
    "prefill.value.43.control" : 0.04938271641731262,
    "prefill.value.47.candidate" : 0,
    "prefill.value.47.control" : 0.4176829159259796,
    "prefill.value.7.candidate" : 0,
    "prefill.value.7.control" : 0.025449100881814957,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0.0036764706019312143,
    "rollback-1.conv.10.candidate" : 0,
    "rollback-1.conv.10.control" : 0.024636628106236458,
    "rollback-1.conv.12.candidate" : 0,
    "rollback-1.conv.12.control" : 0.024336284026503563,
    "rollback-1.conv.13.candidate" : 0,
    "rollback-1.conv.13.control" : 0.02432432398200035,
    "rollback-1.conv.14.candidate" : 0,
    "rollback-1.conv.14.control" : 0.029797740280628204,
    "rollback-1.conv.16.candidate" : 0,
    "rollback-1.conv.16.control" : 0.04749999940395355,
    "rollback-1.conv.17.candidate" : 0,
    "rollback-1.conv.17.control" : 0.05885152146220207,
    "rollback-1.conv.18.candidate" : 0,
    "rollback-1.conv.18.control" : 0.03669724613428116,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0.01991279050707817,
    "rollback-1.conv.20.candidate" : 0,
    "rollback-1.conv.20.control" : 0.06154822185635567,
    "rollback-1.conv.21.candidate" : 0,
    "rollback-1.conv.21.control" : 0.04217233136296272,
    "rollback-1.conv.22.candidate" : 0,
    "rollback-1.conv.22.control" : 0.025487588718533516,
    "rollback-1.conv.24.candidate" : 0,
    "rollback-1.conv.24.control" : 0.03889448940753937,
    "rollback-1.conv.25.candidate" : 0,
    "rollback-1.conv.25.control" : 0.04066985473036766,
    "rollback-1.conv.26.candidate" : 0,
    "rollback-1.conv.26.control" : 0.05882352963089943,
    "rollback-1.conv.28.candidate" : 0,
    "rollback-1.conv.28.control" : 0.06528340280056,
    "rollback-1.conv.29.candidate" : 0,
    "rollback-1.conv.29.control" : 0.08165828883647919,
    "rollback-1.conv.30.candidate" : 0,
    "rollback-1.conv.30.control" : 0.0859375,
    "rollback-1.conv.32.candidate" : 0,
    "rollback-1.conv.32.control" : 0.0882352963089943,
    "rollback-1.conv.33.candidate" : 0,
    "rollback-1.conv.33.control" : 0.07459677755832672,
    "rollback-1.conv.34.candidate" : 0,
    "rollback-1.conv.34.control" : 0.0989583358168602,
    "rollback-1.conv.36.candidate" : 0,
    "rollback-1.conv.36.control" : 0.11014851182699203,
    "rollback-1.conv.37.candidate" : 0,
    "rollback-1.conv.37.control" : 0.125,
    "rollback-1.conv.38.candidate" : 0,
    "rollback-1.conv.38.control" : 0.05429687350988388,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0.013976792804896832,
    "rollback-1.conv.40.candidate" : 0,
    "rollback-1.conv.40.control" : 0.13120567798614502,
    "rollback-1.conv.41.candidate" : 0,
    "rollback-1.conv.41.control" : 0.09857723861932755,
    "rollback-1.conv.42.candidate" : 0,
    "rollback-1.conv.42.control" : 0.09250827878713608,
    "rollback-1.conv.44.candidate" : 0,
    "rollback-1.conv.44.control" : 0.11728394776582718,
    "rollback-1.conv.45.candidate" : 0,
    "rollback-1.conv.45.control" : 0.07948825508356094,
    "rollback-1.conv.46.candidate" : 0,
    "rollback-1.conv.46.control" : 0.09031100571155548,
    "rollback-1.conv.5.candidate" : 0,
    "rollback-1.conv.5.control" : 0.04680851101875305,
    "rollback-1.conv.6.candidate" : 0,
    "rollback-1.conv.6.control" : 0.031707316637039185,
    "rollback-1.conv.8.candidate" : 0,
    "rollback-1.conv.8.control" : 0.024752475321292877,
    "rollback-1.conv.9.candidate" : 0,
    "rollback-1.conv.9.control" : 0.03125,
    "rollback-1.index.11.candidate" : 0,
    "rollback-1.index.11.control" : 0.036651235073804855,
    "rollback-1.index.15.candidate" : 0,
    "rollback-1.index.15.control" : 0.04915730282664299,
    "rollback-1.index.19.candidate" : 0,
    "rollback-1.index.19.control" : 0.04823059216141701,
    "rollback-1.index.23.candidate" : 0,
    "rollback-1.index.23.control" : 0.0357142873108387,
    "rollback-1.index.27.candidate" : 0,
    "rollback-1.index.27.control" : 0.05213490128517151,
    "rollback-1.index.3.candidate" : 0,
    "rollback-1.index.3.control" : 0.04844674468040466,
    "rollback-1.index.31.candidate" : 0,
    "rollback-1.index.31.control" : 0.16495901346206665,
    "rollback-1.index.35.candidate" : 0,
    "rollback-1.index.35.control" : 0.16928808391094208,
    "rollback-1.index.39.candidate" : 0,
    "rollback-1.index.39.control" : 0.06685126572847366,
    "rollback-1.index.43.candidate" : 0,
    "rollback-1.index.43.control" : 0.08535156399011612,
    "rollback-1.index.47.candidate" : 0,
    "rollback-1.index.47.control" : 0.17000000178813934,
    "rollback-1.index.7.candidate" : 0,
    "rollback-1.index.7.control" : 0.03216911852359772,
    "rollback-1.key.11.candidate" : 0,
    "rollback-1.key.11.control" : 0.09747596085071564,
    "rollback-1.key.15.candidate" : 0,
    "rollback-1.key.15.control" : 0.08759123831987381,
    "rollback-1.key.19.candidate" : 0,
    "rollback-1.key.19.control" : 0.13042840361595154,
    "rollback-1.key.23.candidate" : 0,
    "rollback-1.key.23.control" : 0.10780201107263565,
    "rollback-1.key.27.candidate" : 0,
    "rollback-1.key.27.control" : 0.13856907188892365,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0.10025380551815033,
    "rollback-1.key.31.candidate" : 0,
    "rollback-1.key.31.control" : 0.2088926136493683,
    "rollback-1.key.35.candidate" : 0,
    "rollback-1.key.35.control" : 0.2263779491186142,
    "rollback-1.key.39.candidate" : 0,
    "rollback-1.key.39.control" : 0.16093750298023224,
    "rollback-1.key.43.candidate" : 0,
    "rollback-1.key.43.control" : 0.1301020383834839,
    "rollback-1.key.47.candidate" : 0,
    "rollback-1.key.47.control" : 0.1561214029788971,
    "rollback-1.key.7.candidate" : 0,
    "rollback-1.key.7.control" : 0.09459459781646729,
    "rollback-1.logits.candidate" : 0,
    "rollback-1.logits.control" : 0.11010362952947617,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 0.0016687766183167696,
    "rollback-1.ssm.10.candidate" : 0,
    "rollback-1.ssm.10.control" : 0.04546959698200226,
    "rollback-1.ssm.12.candidate" : 0,
    "rollback-1.ssm.12.control" : 0.004076096229255199,
    "rollback-1.ssm.13.candidate" : 0,
    "rollback-1.ssm.13.control" : 0.03342162072658539,
    "rollback-1.ssm.14.candidate" : 0,
    "rollback-1.ssm.14.control" : 0.016810311004519463,
    "rollback-1.ssm.16.candidate" : 0,
    "rollback-1.ssm.16.control" : 0.04106974974274635,
    "rollback-1.ssm.17.candidate" : 0,
    "rollback-1.ssm.17.control" : 0.0696505680680275,
    "rollback-1.ssm.18.candidate" : 0,
    "rollback-1.ssm.18.control" : 0.05894295871257782,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0.012737466022372246,
    "rollback-1.ssm.20.candidate" : 0,
    "rollback-1.ssm.20.control" : 0.031774140894412994,
    "rollback-1.ssm.21.candidate" : 0,
    "rollback-1.ssm.21.control" : 0.03705133870244026,
    "rollback-1.ssm.22.candidate" : 0,
    "rollback-1.ssm.22.control" : 0.008585071191191673,
    "rollback-1.ssm.24.candidate" : 0,
    "rollback-1.ssm.24.control" : 0.03747611120343208,
    "rollback-1.ssm.25.candidate" : 0,
    "rollback-1.ssm.25.control" : 0.08679033815860748,
    "rollback-1.ssm.26.candidate" : 0,
    "rollback-1.ssm.26.control" : 0.08535387367010117,
    "rollback-1.ssm.28.candidate" : 0,
    "rollback-1.ssm.28.control" : 0.004557494539767504,
    "rollback-1.ssm.29.candidate" : 0,
    "rollback-1.ssm.29.control" : 0.05519532412290573,
    "rollback-1.ssm.30.candidate" : 0,
    "rollback-1.ssm.30.control" : 0.10250090807676315,
    "rollback-1.ssm.32.candidate" : 0,
    "rollback-1.ssm.32.control" : 0.18351422250270844,
    "rollback-1.ssm.33.candidate" : 0,
    "rollback-1.ssm.33.control" : 0.14023537933826447,
    "rollback-1.ssm.34.candidate" : 0,
    "rollback-1.ssm.34.control" : 0.15133608877658844,
    "rollback-1.ssm.36.candidate" : 0,
    "rollback-1.ssm.36.control" : 0.08182356506586075,
    "rollback-1.ssm.37.candidate" : 0,
    "rollback-1.ssm.37.control" : 0.039026129990816116,
    "rollback-1.ssm.38.candidate" : 0,
    "rollback-1.ssm.38.control" : 0.019852371886372566,
    "rollback-1.ssm.4.candidate" : 0,
    "rollback-1.ssm.4.control" : 0.029741346836090088,
    "rollback-1.ssm.40.candidate" : 0,
    "rollback-1.ssm.40.control" : 0.021310992538928986,
    "rollback-1.ssm.41.candidate" : 0,
    "rollback-1.ssm.41.control" : 0.041662778705358505,
    "rollback-1.ssm.42.candidate" : 0,
    "rollback-1.ssm.42.control" : 0.05865435674786568,
    "rollback-1.ssm.44.candidate" : 0,
    "rollback-1.ssm.44.control" : 0.017349814996123314,
    "rollback-1.ssm.45.candidate" : 0,
    "rollback-1.ssm.45.control" : 0.13683666288852692,
    "rollback-1.ssm.46.candidate" : 0,
    "rollback-1.ssm.46.control" : 0.15382017195224762,
    "rollback-1.ssm.5.candidate" : 0,
    "rollback-1.ssm.5.control" : 0.046914659440517426,
    "rollback-1.ssm.6.candidate" : 0,
    "rollback-1.ssm.6.control" : 0.027633061632514,
    "rollback-1.ssm.8.candidate" : 0,
    "rollback-1.ssm.8.control" : 0.02003251202404499,
    "rollback-1.ssm.9.candidate" : 0,
    "rollback-1.ssm.9.control" : 0.057640768587589264,
    "rollback-1.value.11.candidate" : 0,
    "rollback-1.value.11.control" : 0.037938401103019714,
    "rollback-1.value.15.candidate" : 0,
    "rollback-1.value.15.control" : 0.026954680681228638,
    "rollback-1.value.19.candidate" : 0,
    "rollback-1.value.19.control" : 0.022448979318141937,
    "rollback-1.value.23.candidate" : 0,
    "rollback-1.value.23.control" : 0.04898255690932274,
    "rollback-1.value.27.candidate" : 0,
    "rollback-1.value.27.control" : 0.014095279388129711,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0.0514964796602726,
    "rollback-1.value.31.candidate" : 0,
    "rollback-1.value.31.control" : 0.07581521570682526,
    "rollback-1.value.35.candidate" : 0,
    "rollback-1.value.35.control" : 0.10303442180156708,
    "rollback-1.value.39.candidate" : 0,
    "rollback-1.value.39.control" : 0.05788690596818924,
    "rollback-1.value.43.candidate" : 0,
    "rollback-1.value.43.control" : 0.04938271641731262,
    "rollback-1.value.47.candidate" : 0,
    "rollback-1.value.47.control" : 0.4176829159259796,
    "rollback-1.value.7.candidate" : 0,
    "rollback-1.value.7.control" : 0.025449100881814957,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0,
    "rollback-2.conv.10.control" : 0.02713414654135704,
    "rollback-2.conv.12.candidate" : 0,
    "rollback-2.conv.12.control" : 0.0251141544431448,
    "rollback-2.conv.13.candidate" : 0,
    "rollback-2.conv.13.control" : 0.028409091755747795,
    "rollback-2.conv.14.candidate" : 0,
    "rollback-2.conv.14.control" : 0.042071908712387085,
    "rollback-2.conv.16.candidate" : 0,
    "rollback-2.conv.16.control" : 0.04679802805185318,
    "rollback-2.conv.17.candidate" : 0,
    "rollback-2.conv.17.control" : 0.05885152146220207,
    "rollback-2.conv.18.candidate" : 0,
    "rollback-2.conv.18.control" : 0.03669724613428116,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0.013414634391665459,
    "rollback-2.conv.20.candidate" : 0,
    "rollback-2.conv.20.control" : 0.06217948719859123,
    "rollback-2.conv.21.candidate" : 0,
    "rollback-2.conv.21.control" : 0.04217233136296272,
    "rollback-2.conv.22.candidate" : 0,
    "rollback-2.conv.22.control" : 0.024364883080124855,
    "rollback-2.conv.24.candidate" : 0,
    "rollback-2.conv.24.control" : 0.03974931314587593,
    "rollback-2.conv.25.candidate" : 0,
    "rollback-2.conv.25.control" : 0.04086538404226303,
    "rollback-2.conv.26.candidate" : 0,
    "rollback-2.conv.26.control" : 0.049879807978868484,
    "rollback-2.conv.28.candidate" : 0,
    "rollback-2.conv.28.control" : 0.063988097012043,
    "rollback-2.conv.29.candidate" : 0,
    "rollback-2.conv.29.control" : 0.08165828883647919,
    "rollback-2.conv.30.candidate" : 0,
    "rollback-2.conv.30.control" : 0.08505154401063919,
    "rollback-2.conv.32.candidate" : 0,
    "rollback-2.conv.32.control" : 0.0902777761220932,
    "rollback-2.conv.33.candidate" : 0,
    "rollback-2.conv.33.control" : 0.07459677755832672,
    "rollback-2.conv.34.candidate" : 0,
    "rollback-2.conv.34.control" : 0.09680706262588501,
    "rollback-2.conv.36.candidate" : 0,
    "rollback-2.conv.36.control" : 0.10679611563682556,
    "rollback-2.conv.37.candidate" : 0,
    "rollback-2.conv.37.control" : 0.06086956337094307,
    "rollback-2.conv.38.candidate" : 0,
    "rollback-2.conv.38.control" : 0.04921875149011612,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0.013976792804896832,
    "rollback-2.conv.40.candidate" : 0,
    "rollback-2.conv.40.control" : 0.10218977928161621,
    "rollback-2.conv.41.candidate" : 0,
    "rollback-2.conv.41.control" : 0.0962301567196846,
    "rollback-2.conv.42.candidate" : 0,
    "rollback-2.conv.42.control" : 0.08702699840068817,
    "rollback-2.conv.44.candidate" : 0,
    "rollback-2.conv.44.control" : 0.1130952388048172,
    "rollback-2.conv.45.candidate" : 0,
    "rollback-2.conv.45.control" : 0.07550335675477982,
    "rollback-2.conv.46.candidate" : 0,
    "rollback-2.conv.46.control" : 0.09729381650686264,
    "rollback-2.conv.5.candidate" : 0,
    "rollback-2.conv.5.control" : 0.04615384712815285,
    "rollback-2.conv.6.candidate" : 0,
    "rollback-2.conv.6.control" : 0.03140096738934517,
    "rollback-2.conv.8.candidate" : 0,
    "rollback-2.conv.8.control" : 0.02599009871482849,
    "rollback-2.conv.9.candidate" : 0,
    "rollback-2.conv.9.control" : 0.03212780877947807,
    "rollback-2.index.11.candidate" : 0,
    "rollback-2.index.11.control" : 0.036651235073804855,
    "rollback-2.index.15.candidate" : 0,
    "rollback-2.index.15.control" : 0.04915730282664299,
    "rollback-2.index.19.candidate" : 0,
    "rollback-2.index.19.control" : 0.04823059216141701,
    "rollback-2.index.23.candidate" : 0,
    "rollback-2.index.23.control" : 0.0357142873108387,
    "rollback-2.index.27.candidate" : 0,
    "rollback-2.index.27.control" : 0.05213490128517151,
    "rollback-2.index.3.candidate" : 0,
    "rollback-2.index.3.control" : 0.04844674468040466,
    "rollback-2.index.31.candidate" : 0,
    "rollback-2.index.31.control" : 0.16495901346206665,
    "rollback-2.index.35.candidate" : 0,
    "rollback-2.index.35.control" : 0.16928808391094208,
    "rollback-2.index.39.candidate" : 0,
    "rollback-2.index.39.control" : 0.06685126572847366,
    "rollback-2.index.43.candidate" : 0,
    "rollback-2.index.43.control" : 0.08535156399011612,
    "rollback-2.index.47.candidate" : 0,
    "rollback-2.index.47.control" : 0.17000000178813934,
    "rollback-2.index.7.candidate" : 0,
    "rollback-2.index.7.control" : 0.03216911852359772,
    "rollback-2.key.11.candidate" : 0,
    "rollback-2.key.11.control" : 0.09747596085071564,
    "rollback-2.key.15.candidate" : 0,
    "rollback-2.key.15.control" : 0.08759123831987381,
    "rollback-2.key.19.candidate" : 0,
    "rollback-2.key.19.control" : 0.13042840361595154,
    "rollback-2.key.23.candidate" : 0,
    "rollback-2.key.23.control" : 0.10780201107263565,
    "rollback-2.key.27.candidate" : 0,
    "rollback-2.key.27.control" : 0.13856907188892365,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0.10025380551815033,
    "rollback-2.key.31.candidate" : 0,
    "rollback-2.key.31.control" : 0.2088926136493683,
    "rollback-2.key.35.candidate" : 0,
    "rollback-2.key.35.control" : 0.2263779491186142,
    "rollback-2.key.39.candidate" : 0,
    "rollback-2.key.39.control" : 0.16093750298023224,
    "rollback-2.key.43.candidate" : 0,
    "rollback-2.key.43.control" : 0.1301020383834839,
    "rollback-2.key.47.candidate" : 0,
    "rollback-2.key.47.control" : 0.1561214029788971,
    "rollback-2.key.7.candidate" : 0,
    "rollback-2.key.7.control" : 0.09459459781646729,
    "rollback-2.logits.candidate" : 0,
    "rollback-2.logits.control" : 0.11175337433815002,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 0.001579031813889742,
    "rollback-2.ssm.10.candidate" : 0,
    "rollback-2.ssm.10.control" : 0.05156170204281807,
    "rollback-2.ssm.12.candidate" : 0,
    "rollback-2.ssm.12.control" : 0.004401271231472492,
    "rollback-2.ssm.13.candidate" : 0,
    "rollback-2.ssm.13.control" : 0.03369653597474098,
    "rollback-2.ssm.14.candidate" : 0,
    "rollback-2.ssm.14.control" : 0.013484829105436802,
    "rollback-2.ssm.16.candidate" : 0,
    "rollback-2.ssm.16.control" : 0.05002614110708237,
    "rollback-2.ssm.17.candidate" : 0,
    "rollback-2.ssm.17.control" : 0.0453394278883934,
    "rollback-2.ssm.18.candidate" : 0,
    "rollback-2.ssm.18.control" : 0.07419704645872116,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0.01262714434415102,
    "rollback-2.ssm.20.candidate" : 0,
    "rollback-2.ssm.20.control" : 0.015683334320783615,
    "rollback-2.ssm.21.candidate" : 0,
    "rollback-2.ssm.21.control" : 0.015878180041909218,
    "rollback-2.ssm.22.candidate" : 0,
    "rollback-2.ssm.22.control" : 0.008367989212274551,
    "rollback-2.ssm.24.candidate" : 0,
    "rollback-2.ssm.24.control" : 0.018955666571855545,
    "rollback-2.ssm.25.candidate" : 0,
    "rollback-2.ssm.25.control" : 0.06907308846712112,
    "rollback-2.ssm.26.candidate" : 0,
    "rollback-2.ssm.26.control" : 0.06037506088614464,
    "rollback-2.ssm.28.candidate" : 0,
    "rollback-2.ssm.28.control" : 0.004087875131517649,
    "rollback-2.ssm.29.candidate" : 0,
    "rollback-2.ssm.29.control" : 0.039764516055583954,
    "rollback-2.ssm.30.candidate" : 0,
    "rollback-2.ssm.30.control" : 0.037178512662649155,
    "rollback-2.ssm.32.candidate" : 0,
    "rollback-2.ssm.32.control" : 0.07559378445148468,
    "rollback-2.ssm.33.candidate" : 0,
    "rollback-2.ssm.33.control" : 0.07184648513793945,
    "rollback-2.ssm.34.candidate" : 0,
    "rollback-2.ssm.34.control" : 0.08510051667690277,
    "rollback-2.ssm.36.candidate" : 0,
    "rollback-2.ssm.36.control" : 0.058085765689611435,
    "rollback-2.ssm.37.candidate" : 0,
    "rollback-2.ssm.37.control" : 0.05383116379380226,
    "rollback-2.ssm.38.candidate" : 0,
    "rollback-2.ssm.38.control" : 0.02166302502155304,
    "rollback-2.ssm.4.candidate" : 0,
    "rollback-2.ssm.4.control" : 0.027622541412711143,
    "rollback-2.ssm.40.candidate" : 0,
    "rollback-2.ssm.40.control" : 0.023858141154050827,
    "rollback-2.ssm.41.candidate" : 0,
    "rollback-2.ssm.41.control" : 0.04141821712255478,
    "rollback-2.ssm.42.candidate" : 0,
    "rollback-2.ssm.42.control" : 0.04111645743250847,
    "rollback-2.ssm.44.candidate" : 0,
    "rollback-2.ssm.44.control" : 0.03075091354548931,
    "rollback-2.ssm.45.candidate" : 0,
    "rollback-2.ssm.45.control" : 0.09502673149108887,
    "rollback-2.ssm.46.candidate" : 0,
    "rollback-2.ssm.46.control" : 0.13896313309669495,
    "rollback-2.ssm.5.candidate" : 0,
    "rollback-2.ssm.5.control" : 0.027691280469298363,
    "rollback-2.ssm.6.candidate" : 0,
    "rollback-2.ssm.6.control" : 0.013277466408908367,
    "rollback-2.ssm.8.candidate" : 0,
    "rollback-2.ssm.8.control" : 0.014318466186523438,
    "rollback-2.ssm.9.candidate" : 0,
    "rollback-2.ssm.9.control" : 0.030974194407463074,
    "rollback-2.value.11.candidate" : 0,
    "rollback-2.value.11.control" : 0.04833633080124855,
    "rollback-2.value.15.candidate" : 0,
    "rollback-2.value.15.control" : 0.026954680681228638,
    "rollback-2.value.19.candidate" : 0,
    "rollback-2.value.19.control" : 0.022448979318141937,
    "rollback-2.value.23.candidate" : 0,
    "rollback-2.value.23.control" : 0.04898255690932274,
    "rollback-2.value.27.candidate" : 0,
    "rollback-2.value.27.control" : 0.014095279388129711,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0.0514964796602726,
    "rollback-2.value.31.candidate" : 0,
    "rollback-2.value.31.control" : 0.07581521570682526,
    "rollback-2.value.35.candidate" : 0,
    "rollback-2.value.35.control" : 0.10303442180156708,
    "rollback-2.value.39.candidate" : 0,
    "rollback-2.value.39.control" : 0.05788690596818924,
    "rollback-2.value.43.candidate" : 0,
    "rollback-2.value.43.control" : 0.04938271641731262,
    "rollback-2.value.47.candidate" : 0,
    "rollback-2.value.47.control" : 0.4176829159259796,
    "rollback-2.value.7.candidate" : 0,
    "rollback-2.value.7.control" : 0.025449100881814957,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0,
    "rollback-3.conv.10.control" : 0.017378048971295357,
    "rollback-3.conv.12.candidate" : 0,
    "rollback-3.conv.12.control" : 0.02226027473807335,
    "rollback-3.conv.13.candidate" : 0,
    "rollback-3.conv.13.control" : 0.027624309062957764,
    "rollback-3.conv.14.candidate" : 0,
    "rollback-3.conv.14.control" : 0.020408162847161293,
    "rollback-3.conv.16.candidate" : 0,
    "rollback-3.conv.16.control" : 0.02463054098188877,
    "rollback-3.conv.17.candidate" : 0,
    "rollback-3.conv.17.control" : 0.03362596780061722,
    "rollback-3.conv.18.candidate" : 0,
    "rollback-3.conv.18.control" : 0.029816513881087303,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0.013749999925494194,
    "rollback-3.conv.20.candidate" : 0,
    "rollback-3.conv.20.control" : 0.03974359109997749,
    "rollback-3.conv.21.candidate" : 0,
    "rollback-3.conv.21.control" : 0.030048076063394547,
    "rollback-3.conv.22.candidate" : 0,
    "rollback-3.conv.22.control" : 0.019784172996878624,
    "rollback-3.conv.24.candidate" : 0,
    "rollback-3.conv.24.control" : 0.04237288236618042,
    "rollback-3.conv.25.candidate" : 0,
    "rollback-3.conv.25.control" : 0.04087677597999573,
    "rollback-3.conv.26.candidate" : 0,
    "rollback-3.conv.26.control" : 0.05048076808452606,
    "rollback-3.conv.28.candidate" : 0,
    "rollback-3.conv.28.control" : 0.0409226194024086,
    "rollback-3.conv.29.candidate" : 0,
    "rollback-3.conv.29.control" : 0.08232821524143219,
    "rollback-3.conv.30.candidate" : 0,
    "rollback-3.conv.30.control" : 0.0670103058218956,
    "rollback-3.conv.32.candidate" : 0,
    "rollback-3.conv.32.control" : 0.08075220882892609,
    "rollback-3.conv.33.candidate" : 0,
    "rollback-3.conv.33.control" : 0.09090909361839294,
    "rollback-3.conv.34.candidate" : 0,
    "rollback-3.conv.34.control" : 0.08264462649822235,
    "rollback-3.conv.36.candidate" : 0,
    "rollback-3.conv.36.control" : 0.10879629850387573,
    "rollback-3.conv.37.candidate" : 0,
    "rollback-3.conv.37.control" : 0.050271738320589066,
    "rollback-3.conv.38.candidate" : 0,
    "rollback-3.conv.38.control" : 0.07783018797636032,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0.009098101407289505,
    "rollback-3.conv.40.candidate" : 0,
    "rollback-3.conv.40.control" : 0.09489051252603531,
    "rollback-3.conv.41.candidate" : 0,
    "rollback-3.conv.41.control" : 0.12804877758026123,
    "rollback-3.conv.42.candidate" : 0,
    "rollback-3.conv.42.control" : 0.0606398805975914,
    "rollback-3.conv.44.candidate" : 0,
    "rollback-3.conv.44.control" : 0.087425597012043,
    "rollback-3.conv.45.candidate" : 0,
    "rollback-3.conv.45.control" : 0.053136080503463745,
    "rollback-3.conv.46.candidate" : 0,
    "rollback-3.conv.46.control" : 0.05025773122906685,
    "rollback-3.conv.5.candidate" : 0,
    "rollback-3.conv.5.control" : 0.04038461670279503,
    "rollback-3.conv.6.candidate" : 0,
    "rollback-3.conv.6.control" : 0.014492753893136978,
    "rollback-3.conv.8.candidate" : 0,
    "rollback-3.conv.8.control" : 0.014285714365541935,
    "rollback-3.conv.9.candidate" : 0,
    "rollback-3.conv.9.control" : 0.018156424164772034,
    "rollback-3.index.11.candidate" : 0,
    "rollback-3.index.11.control" : 0.036651235073804855,
    "rollback-3.index.15.candidate" : 0,
    "rollback-3.index.15.control" : 0.04915730282664299,
    "rollback-3.index.19.candidate" : 0,
    "rollback-3.index.19.control" : 0.04823059216141701,
    "rollback-3.index.23.candidate" : 0,
    "rollback-3.index.23.control" : 0.0357142873108387,
    "rollback-3.index.27.candidate" : 0,
    "rollback-3.index.27.control" : 0.05213490128517151,
    "rollback-3.index.3.candidate" : 0,
    "rollback-3.index.3.control" : 0.04844674468040466,
    "rollback-3.index.31.candidate" : 0,
    "rollback-3.index.31.control" : 0.16495901346206665,
    "rollback-3.index.35.candidate" : 0,
    "rollback-3.index.35.control" : 0.16928808391094208,
    "rollback-3.index.39.candidate" : 0,
    "rollback-3.index.39.control" : 0.06685126572847366,
    "rollback-3.index.43.candidate" : 0,
    "rollback-3.index.43.control" : 0.08535156399011612,
    "rollback-3.index.47.candidate" : 0,
    "rollback-3.index.47.control" : 0.17000000178813934,
    "rollback-3.index.7.candidate" : 0,
    "rollback-3.index.7.control" : 0.03216911852359772,
    "rollback-3.key.11.candidate" : 0,
    "rollback-3.key.11.control" : 0.09747596085071564,
    "rollback-3.key.15.candidate" : 0,
    "rollback-3.key.15.control" : 0.08759123831987381,
    "rollback-3.key.19.candidate" : 0,
    "rollback-3.key.19.control" : 0.13042840361595154,
    "rollback-3.key.23.candidate" : 0,
    "rollback-3.key.23.control" : 0.10780201107263565,
    "rollback-3.key.27.candidate" : 0,
    "rollback-3.key.27.control" : 0.13856907188892365,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0.10025380551815033,
    "rollback-3.key.31.candidate" : 0,
    "rollback-3.key.31.control" : 0.2088926136493683,
    "rollback-3.key.35.candidate" : 0,
    "rollback-3.key.35.control" : 0.2263779491186142,
    "rollback-3.key.39.candidate" : 0,
    "rollback-3.key.39.control" : 0.16093750298023224,
    "rollback-3.key.43.candidate" : 0,
    "rollback-3.key.43.control" : 0.1301020383834839,
    "rollback-3.key.47.candidate" : 0,
    "rollback-3.key.47.control" : 0.1561214029788971,
    "rollback-3.key.7.candidate" : 0,
    "rollback-3.key.7.control" : 0.09459459781646729,
    "rollback-3.logits.candidate" : 0,
    "rollback-3.logits.control" : 0.07261208444833755,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 0.0015982597833499312,
    "rollback-3.ssm.10.candidate" : 0,
    "rollback-3.ssm.10.control" : 0.029586680233478546,
    "rollback-3.ssm.12.candidate" : 0,
    "rollback-3.ssm.12.control" : 0.004854151513427496,
    "rollback-3.ssm.13.candidate" : 0,
    "rollback-3.ssm.13.control" : 0.025944620370864868,
    "rollback-3.ssm.14.candidate" : 0,
    "rollback-3.ssm.14.control" : 0.013452346436679363,
    "rollback-3.ssm.16.candidate" : 0,
    "rollback-3.ssm.16.control" : 0.02035994827747345,
    "rollback-3.ssm.17.candidate" : 0,
    "rollback-3.ssm.17.control" : 0.0572931133210659,
    "rollback-3.ssm.18.candidate" : 0,
    "rollback-3.ssm.18.control" : 0.088945671916008,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0.013729231432080269,
    "rollback-3.ssm.20.candidate" : 0,
    "rollback-3.ssm.20.control" : 0.020713424310088158,
    "rollback-3.ssm.21.candidate" : 0,
    "rollback-3.ssm.21.control" : 0.016859257593750954,
    "rollback-3.ssm.22.candidate" : 0,
    "rollback-3.ssm.22.control" : 0.008213380351662636,
    "rollback-3.ssm.24.candidate" : 0,
    "rollback-3.ssm.24.control" : 0.023476973176002502,
    "rollback-3.ssm.25.candidate" : 0,
    "rollback-3.ssm.25.control" : 0.07173406332731247,
    "rollback-3.ssm.26.candidate" : 0,
    "rollback-3.ssm.26.control" : 0.08144234865903854,
    "rollback-3.ssm.28.candidate" : 0,
    "rollback-3.ssm.28.control" : 0.004658431280404329,
    "rollback-3.ssm.29.candidate" : 0,
    "rollback-3.ssm.29.control" : 0.06612418591976166,
    "rollback-3.ssm.30.candidate" : 0,
    "rollback-3.ssm.30.control" : 0.03367914259433746,
    "rollback-3.ssm.32.candidate" : 0,
    "rollback-3.ssm.32.control" : 0.04926076531410217,
    "rollback-3.ssm.33.candidate" : 0,
    "rollback-3.ssm.33.control" : 0.08814965933561325,
    "rollback-3.ssm.34.candidate" : 0,
    "rollback-3.ssm.34.control" : 0.18050742149353027,
    "rollback-3.ssm.36.candidate" : 0,
    "rollback-3.ssm.36.control" : 0.1104763001203537,
    "rollback-3.ssm.37.candidate" : 0,
    "rollback-3.ssm.37.control" : 0.03146883472800255,
    "rollback-3.ssm.38.candidate" : 0,
    "rollback-3.ssm.38.control" : 0.01716495305299759,
    "rollback-3.ssm.4.candidate" : 0,
    "rollback-3.ssm.4.control" : 0.026491770520806313,
    "rollback-3.ssm.40.candidate" : 0,
    "rollback-3.ssm.40.control" : 0.02534874901175499,
    "rollback-3.ssm.41.candidate" : 0,
    "rollback-3.ssm.41.control" : 0.04132749140262604,
    "rollback-3.ssm.42.candidate" : 0,
    "rollback-3.ssm.42.control" : 0.06392312794923782,
    "rollback-3.ssm.44.candidate" : 0,
    "rollback-3.ssm.44.control" : 0.051649391651153564,
    "rollback-3.ssm.45.candidate" : 0,
    "rollback-3.ssm.45.control" : 0.12049714475870132,
    "rollback-3.ssm.46.candidate" : 0,
    "rollback-3.ssm.46.control" : 0.1374494433403015,
    "rollback-3.ssm.5.candidate" : 0,
    "rollback-3.ssm.5.control" : 0.05189232900738716,
    "rollback-3.ssm.6.candidate" : 0,
    "rollback-3.ssm.6.control" : 0.013764054514467716,
    "rollback-3.ssm.8.candidate" : 0,
    "rollback-3.ssm.8.control" : 0.010599642992019653,
    "rollback-3.ssm.9.candidate" : 0,
    "rollback-3.ssm.9.control" : 0.029473112896084785,
    "rollback-3.value.11.candidate" : 0,
    "rollback-3.value.11.control" : 0.037938401103019714,
    "rollback-3.value.15.candidate" : 0,
    "rollback-3.value.15.control" : 0.026954680681228638,
    "rollback-3.value.19.candidate" : 0,
    "rollback-3.value.19.control" : 0.022448979318141937,
    "rollback-3.value.23.candidate" : 0,
    "rollback-3.value.23.control" : 0.04898255690932274,
    "rollback-3.value.27.candidate" : 0,
    "rollback-3.value.27.control" : 0.014095279388129711,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0.0514964796602726,
    "rollback-3.value.31.candidate" : 0,
    "rollback-3.value.31.control" : 0.07581521570682526,
    "rollback-3.value.35.candidate" : 0,
    "rollback-3.value.35.control" : 0.10303442180156708,
    "rollback-3.value.39.candidate" : 0,
    "rollback-3.value.39.control" : 0.05788690596818924,
    "rollback-3.value.43.candidate" : 0,
    "rollback-3.value.43.control" : 0.04938271641731262,
    "rollback-3.value.47.candidate" : 0,
    "rollback-3.value.47.control" : 0.4176829159259796,
    "rollback-3.value.7.candidate" : 0,
    "rollback-3.value.7.control" : 0.025449100881814957,
    "routing.candidate" : 0,
    "routing.control" : 0.03099944320712695,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-64-swept-router-padded-attention-aligned-projections-aligned\/tokens=449\/prefix=0",
  "passed" : true
}

````

## context-small-projections-shorttail-64-15/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## context-small-projections-shorttail-128-15/stdout.txt

SHA-256 `e1d5f61195233f5cb0383257426f727fa2521fb4171ae9ea86a6d5198f678f73`; 229622 bytes.

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
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.37",
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
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
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
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
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
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
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
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
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
      "name" : "continued-907: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.37",
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
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.25",
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
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
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
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
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
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.4",
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
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.37",
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
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
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
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
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
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
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
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
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
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.37",
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
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.25",
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
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
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
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
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
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.4",
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
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.37",
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
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
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
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
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
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
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
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
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
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.37",
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
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.25",
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
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
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
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
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
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.4",
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
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.37",
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
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
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
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
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
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
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
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
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
    "arm0.padded_query_rows" : 0,
    "arm0.read_records" : 16132,
    "arm0.seconds" : 5.275876083,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 28311552,
    "arm1.chunk" : 512,
    "arm1.padded_query_rows" : 0,
    "arm1.read_records" : 9281,
    "arm1.seconds" : 2.742447333,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 28311552,
    "arm2.chunk" : 128,
    "arm2.padded_query_rows" : 0,
    "arm2.read_records" : 24086,
    "arm2.seconds" : 7.5466125,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 28311552,
    "arm3.chunk" : 128,
    "arm3.padded_query_rows" : 0,
    "arm3.read_records" : 23930,
    "arm3.seconds" : 7.64271125,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0.003759398590773344,
    "continued-1337.conv.10.candidate" : 0,
    "continued-1337.conv.10.control" : 0.01785714365541935,
    "continued-1337.conv.12.candidate" : 0,
    "continued-1337.conv.12.control" : 0.01295045018196106,
    "continued-1337.conv.13.candidate" : 0,
    "continued-1337.conv.13.control" : 0.014367816038429737,
    "continued-1337.conv.14.candidate" : 0,
    "continued-1337.conv.14.control" : 0.01632973551750183,
    "continued-1337.conv.16.candidate" : 0,
    "continued-1337.conv.16.control" : 0.039024390280246735,
    "continued-1337.conv.17.candidate" : 0,
    "continued-1337.conv.17.control" : 0.04891304299235344,
    "continued-1337.conv.18.candidate" : 0,
    "continued-1337.conv.18.control" : 0.030837005004286766,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0.008713942021131516,
    "continued-1337.conv.20.candidate" : 0,
    "continued-1337.conv.20.control" : 0.03276699036359787,
    "continued-1337.conv.21.candidate" : 0,
    "continued-1337.conv.21.control" : 0.03488372266292572,
    "continued-1337.conv.22.candidate" : 0,
    "continued-1337.conv.22.control" : 0.014705882407724857,
    "continued-1337.conv.24.candidate" : 0,
    "continued-1337.conv.24.control" : 0.0315755195915699,
    "continued-1337.conv.25.candidate" : 0,
    "continued-1337.conv.25.control" : 0.024671053513884544,
    "continued-1337.conv.26.candidate" : 0,
    "continued-1337.conv.26.control" : 0.028596697375178337,
    "continued-1337.conv.28.candidate" : 0,
    "continued-1337.conv.28.control" : 0.048557691276073456,
    "continued-1337.conv.29.candidate" : 0,
    "continued-1337.conv.29.control" : 0.07947976887226105,
    "continued-1337.conv.30.candidate" : 0,
    "continued-1337.conv.30.control" : 0.0818236693739891,
    "continued-1337.conv.32.candidate" : 0,
    "continued-1337.conv.32.control" : 0.08633474260568619,
    "continued-1337.conv.33.candidate" : 0,
    "continued-1337.conv.33.control" : 0.07307692617177963,
    "continued-1337.conv.34.candidate" : 0,
    "continued-1337.conv.34.control" : 0.10289300978183746,
    "continued-1337.conv.36.candidate" : 0,
    "continued-1337.conv.36.control" : 0.09158416092395782,
    "continued-1337.conv.37.candidate" : 0,
    "continued-1337.conv.37.control" : 0.0833333358168602,
    "continued-1337.conv.38.candidate" : 0,
    "continued-1337.conv.38.control" : 0.03570015728473663,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0.012658228166401386,
    "continued-1337.conv.40.candidate" : 0,
    "continued-1337.conv.40.control" : 0.07857143133878708,
    "continued-1337.conv.41.candidate" : 0,
    "continued-1337.conv.41.control" : 0.08366534113883972,
    "continued-1337.conv.42.candidate" : 0,
    "continued-1337.conv.42.control" : 0.052642617374658585,
    "continued-1337.conv.44.candidate" : 0,
    "continued-1337.conv.44.control" : 0.17123287916183472,
    "continued-1337.conv.45.candidate" : 0,
    "continued-1337.conv.45.control" : 0.06327589601278305,
    "continued-1337.conv.46.candidate" : 0,
    "continued-1337.conv.46.control" : 0.07471264153718948,
    "continued-1337.conv.5.candidate" : 0,
    "continued-1337.conv.5.control" : 0.02500000037252903,
    "continued-1337.conv.6.candidate" : 0,
    "continued-1337.conv.6.control" : 0.010765550658106804,
    "continued-1337.conv.8.candidate" : 0,
    "continued-1337.conv.8.control" : 0.008600917644798756,
    "continued-1337.conv.9.candidate" : 0,
    "continued-1337.conv.9.control" : 0.010582010261714458,
    "continued-1337.index.11.candidate" : 0,
    "continued-1337.index.11.control" : 0.036651235073804855,
    "continued-1337.index.15.candidate" : 0,
    "continued-1337.index.15.control" : 0.04915730282664299,
    "continued-1337.index.19.candidate" : 0,
    "continued-1337.index.19.control" : 0.04823059216141701,
    "continued-1337.index.23.candidate" : 0,
    "continued-1337.index.23.control" : 0.0357142873108387,
    "continued-1337.index.27.candidate" : 0,
    "continued-1337.index.27.control" : 0.05213490128517151,
    "continued-1337.index.3.candidate" : 0,
    "continued-1337.index.3.control" : 0.04844674468040466,
    "continued-1337.index.31.candidate" : 0,
    "continued-1337.index.31.control" : 0.16495901346206665,
    "continued-1337.index.35.candidate" : 0,
    "continued-1337.index.35.control" : 0.16928808391094208,
    "continued-1337.index.39.candidate" : 0,
    "continued-1337.index.39.control" : 0.06685126572847366,
    "continued-1337.index.43.candidate" : 0,
    "continued-1337.index.43.control" : 0.08535156399011612,
    "continued-1337.index.47.candidate" : 0,
    "continued-1337.index.47.control" : 0.17000000178813934,
    "continued-1337.index.7.candidate" : 0,
    "continued-1337.index.7.control" : 0.03216911852359772,
    "continued-1337.key.11.candidate" : 0,
    "continued-1337.key.11.control" : 0.09747596085071564,
    "continued-1337.key.15.candidate" : 0,
    "continued-1337.key.15.control" : 0.08759123831987381,
    "continued-1337.key.19.candidate" : 0,
    "continued-1337.key.19.control" : 0.13042840361595154,
    "continued-1337.key.23.candidate" : 0,
    "continued-1337.key.23.control" : 0.10780201107263565,
    "continued-1337.key.27.candidate" : 0,
    "continued-1337.key.27.control" : 0.13856907188892365,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0.10025380551815033,
    "continued-1337.key.31.candidate" : 0,
    "continued-1337.key.31.control" : 0.2088926136493683,
    "continued-1337.key.35.candidate" : 0,
    "continued-1337.key.35.control" : 0.2263779491186142,
    "continued-1337.key.39.candidate" : 0,
    "continued-1337.key.39.control" : 0.16093750298023224,
    "continued-1337.key.43.candidate" : 0,
    "continued-1337.key.43.control" : 0.1301020383834839,
    "continued-1337.key.47.candidate" : 0,
    "continued-1337.key.47.control" : 0.1561214029788971,
    "continued-1337.key.7.candidate" : 0,
    "continued-1337.key.7.control" : 0.09459459781646729,
    "continued-1337.logits.candidate" : 0,
    "continued-1337.logits.control" : 0.09172661602497101,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0.002358490601181984,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 0.00243970169685781,
    "continued-1337.ssm.10.candidate" : 0,
    "continued-1337.ssm.10.control" : 0.03401253744959831,
    "continued-1337.ssm.12.candidate" : 0,
    "continued-1337.ssm.12.control" : 0.003188851522281766,
    "continued-1337.ssm.13.candidate" : 0,
    "continued-1337.ssm.13.control" : 0.023419640958309174,
    "continued-1337.ssm.14.candidate" : 0,
    "continued-1337.ssm.14.control" : 0.014370560646057129,
    "continued-1337.ssm.16.candidate" : 0,
    "continued-1337.ssm.16.control" : 0.08776754885911942,
    "continued-1337.ssm.17.candidate" : 0,
    "continued-1337.ssm.17.control" : 0.023858655244112015,
    "continued-1337.ssm.18.candidate" : 0,
    "continued-1337.ssm.18.control" : 0.04174370318651199,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0.013054810464382172,
    "continued-1337.ssm.20.candidate" : 0,
    "continued-1337.ssm.20.control" : 0.04190487414598465,
    "continued-1337.ssm.21.candidate" : 0,
    "continued-1337.ssm.21.control" : 0.016556456685066223,
    "continued-1337.ssm.22.candidate" : 0,
    "continued-1337.ssm.22.control" : 0.008854847401380539,
    "continued-1337.ssm.24.candidate" : 0,
    "continued-1337.ssm.24.control" : 0.02945796214044094,
    "continued-1337.ssm.25.candidate" : 0,
    "continued-1337.ssm.25.control" : 0.07499926537275314,
    "continued-1337.ssm.26.candidate" : 0,
    "continued-1337.ssm.26.control" : 0.086530402302742,
    "continued-1337.ssm.28.candidate" : 0,
    "continued-1337.ssm.28.control" : 0.013775987550616264,
    "continued-1337.ssm.29.candidate" : 0,
    "continued-1337.ssm.29.control" : 0.04985706880688667,
    "continued-1337.ssm.30.candidate" : 0,
    "continued-1337.ssm.30.control" : 0.06472005695104599,
    "continued-1337.ssm.32.candidate" : 0,
    "continued-1337.ssm.32.control" : 0.124945268034935,
    "continued-1337.ssm.33.candidate" : 0,
    "continued-1337.ssm.33.control" : 0.09780476987361908,
    "continued-1337.ssm.34.candidate" : 0,
    "continued-1337.ssm.34.control" : 0.10403416305780411,
    "continued-1337.ssm.36.candidate" : 0,
    "continued-1337.ssm.36.control" : 0.0989178717136383,
    "continued-1337.ssm.37.candidate" : 0,
    "continued-1337.ssm.37.control" : 0.04079009220004082,
    "continued-1337.ssm.38.candidate" : 0,
    "continued-1337.ssm.38.control" : 0.018855925649404526,
    "continued-1337.ssm.4.candidate" : 0,
    "continued-1337.ssm.4.control" : 0.026957416906952858,
    "continued-1337.ssm.40.candidate" : 0,
    "continued-1337.ssm.40.control" : 0.017980946227908134,
    "continued-1337.ssm.41.candidate" : 0,
    "continued-1337.ssm.41.control" : 0.04150834679603577,
    "continued-1337.ssm.42.candidate" : 0,
    "continued-1337.ssm.42.control" : 0.04060410335659981,
    "continued-1337.ssm.44.candidate" : 0,
    "continued-1337.ssm.44.control" : 0.06645477563142776,
    "continued-1337.ssm.45.candidate" : 0,
    "continued-1337.ssm.45.control" : 0.12942716479301453,
    "continued-1337.ssm.46.candidate" : 0,
    "continued-1337.ssm.46.control" : 0.1594877988100052,
    "continued-1337.ssm.5.candidate" : 0,
    "continued-1337.ssm.5.control" : 0.04531067982316017,
    "continued-1337.ssm.6.candidate" : 0,
    "continued-1337.ssm.6.control" : 0.012301095761358738,
    "continued-1337.ssm.8.candidate" : 0,
    "continued-1337.ssm.8.control" : 0.010773622430860996,
    "continued-1337.ssm.9.candidate" : 0,
    "continued-1337.ssm.9.control" : 0.02393987402319908,
    "continued-1337.value.11.candidate" : 0,
    "continued-1337.value.11.control" : 0.037938401103019714,
    "continued-1337.value.15.candidate" : 0,
    "continued-1337.value.15.control" : 0.026954680681228638,
    "continued-1337.value.19.candidate" : 0,
    "continued-1337.value.19.control" : 0.018112244084477425,
    "continued-1337.value.23.candidate" : 0,
    "continued-1337.value.23.control" : 0.04898255690932274,
    "continued-1337.value.27.candidate" : 0,
    "continued-1337.value.27.control" : 0.014095279388129711,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0.0514964796602726,
    "continued-1337.value.31.candidate" : 0,
    "continued-1337.value.31.control" : 0.07581521570682526,
    "continued-1337.value.35.candidate" : 0,
    "continued-1337.value.35.control" : 0.10303442180156708,
    "continued-1337.value.39.candidate" : 0,
    "continued-1337.value.39.control" : 0.05788690596818924,
    "continued-1337.value.43.candidate" : 0,
    "continued-1337.value.43.control" : 0.04938271641731262,
    "continued-1337.value.47.candidate" : 0,
    "continued-1337.value.47.control" : 0.4176829159259796,
    "continued-1337.value.7.candidate" : 0,
    "continued-1337.value.7.control" : 0.025449100881814957,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0.0036764706019312143,
    "continued-2103.conv.10.candidate" : 0,
    "continued-2103.conv.10.control" : 0.015116279013454914,
    "continued-2103.conv.12.candidate" : 0,
    "continued-2103.conv.12.control" : 0.019358407706022263,
    "continued-2103.conv.13.candidate" : 0,
    "continued-2103.conv.13.control" : 0.018918918445706367,
    "continued-2103.conv.14.candidate" : 0,
    "continued-2103.conv.14.control" : 0.018041236326098442,
    "continued-2103.conv.16.candidate" : 0,
    "continued-2103.conv.16.control" : 0.039024390280246735,
    "continued-2103.conv.17.candidate" : 0,
    "continued-2103.conv.17.control" : 0.04891304299235344,
    "continued-2103.conv.18.candidate" : 0,
    "continued-2103.conv.18.control" : 0.031963471323251724,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0.008430232293903828,
    "continued-2103.conv.20.candidate" : 0,
    "continued-2103.conv.20.control" : 0.034263961017131805,
    "continued-2103.conv.21.candidate" : 0,
    "continued-2103.conv.21.control" : 0.03488372266292572,
    "continued-2103.conv.22.candidate" : 0,
    "continued-2103.conv.22.control" : 0.014598540030419827,
    "continued-2103.conv.24.candidate" : 0,
    "continued-2103.conv.24.control" : 0.03241978585720062,
    "continued-2103.conv.25.candidate" : 0,
    "continued-2103.conv.25.control" : 0.024671053513884544,
    "continued-2103.conv.26.candidate" : 0,
    "continued-2103.conv.26.control" : 0.0328054316341877,
    "continued-2103.conv.28.candidate" : 0,
    "continued-2103.conv.28.control" : 0.048557691276073456,
    "continued-2103.conv.29.candidate" : 0,
    "continued-2103.conv.29.control" : 0.07432432472705841,
    "continued-2103.conv.30.candidate" : 0,
    "continued-2103.conv.30.control" : 0.0818236693739891,
    "continued-2103.conv.32.candidate" : 0,
    "continued-2103.conv.32.control" : 0.08633474260568619,
    "continued-2103.conv.33.candidate" : 0,
    "continued-2103.conv.33.control" : 0.07307692617177963,
    "continued-2103.conv.34.candidate" : 0,
    "continued-2103.conv.34.control" : 0.10289300978183746,
    "continued-2103.conv.36.candidate" : 0,
    "continued-2103.conv.36.control" : 0.07614213228225708,
    "continued-2103.conv.37.candidate" : 0,
    "continued-2103.conv.37.control" : 0.0833333358168602,
    "continued-2103.conv.38.candidate" : 0,
    "continued-2103.conv.38.control" : 0.03293117135763168,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0.012658228166401386,
    "continued-2103.conv.40.candidate" : 0,
    "continued-2103.conv.40.control" : 0.07801418751478195,
    "continued-2103.conv.41.candidate" : 0,
    "continued-2103.conv.41.control" : 0.08366534113883972,
    "continued-2103.conv.42.candidate" : 0,
    "continued-2103.conv.42.control" : 0.051945365965366364,
    "continued-2103.conv.44.candidate" : 0,
    "continued-2103.conv.44.control" : 0.15432098507881165,
    "continued-2103.conv.45.candidate" : 0,
    "continued-2103.conv.45.control" : 0.06327589601278305,
    "continued-2103.conv.46.candidate" : 0,
    "continued-2103.conv.46.control" : 0.07222222536802292,
    "continued-2103.conv.5.candidate" : 0,
    "continued-2103.conv.5.control" : 0.02500000037252903,
    "continued-2103.conv.6.candidate" : 0,
    "continued-2103.conv.6.control" : 0.010765550658106804,
    "continued-2103.conv.8.candidate" : 0,
    "continued-2103.conv.8.control" : 0.00917431153357029,
    "continued-2103.conv.9.candidate" : 0,
    "continued-2103.conv.9.control" : 0.018617020919919014,
    "continued-2103.index.11.candidate" : 0,
    "continued-2103.index.11.control" : 0.036651235073804855,
    "continued-2103.index.15.candidate" : 0,
    "continued-2103.index.15.control" : 0.04915730282664299,
    "continued-2103.index.19.candidate" : 0,
    "continued-2103.index.19.control" : 0.04823059216141701,
    "continued-2103.index.23.candidate" : 0,
    "continued-2103.index.23.control" : 0.0357142873108387,
    "continued-2103.index.27.candidate" : 0,
    "continued-2103.index.27.control" : 0.05213490128517151,
    "continued-2103.index.3.candidate" : 0,
    "continued-2103.index.3.control" : 0.04844674468040466,
    "continued-2103.index.31.candidate" : 0,
    "continued-2103.index.31.control" : 0.16495901346206665,
    "continued-2103.index.35.candidate" : 0,
    "continued-2103.index.35.control" : 0.16928808391094208,
    "continued-2103.index.39.candidate" : 0,
    "continued-2103.index.39.control" : 0.06685126572847366,
    "continued-2103.index.43.candidate" : 0,
    "continued-2103.index.43.control" : 0.08535156399011612,
    "continued-2103.index.47.candidate" : 0,
    "continued-2103.index.47.control" : 0.17000000178813934,
    "continued-2103.index.7.candidate" : 0,
    "continued-2103.index.7.control" : 0.03216911852359772,
    "continued-2103.key.11.candidate" : 0,
    "continued-2103.key.11.control" : 0.09747596085071564,
    "continued-2103.key.15.candidate" : 0,
    "continued-2103.key.15.control" : 0.08759123831987381,
    "continued-2103.key.19.candidate" : 0,
    "continued-2103.key.19.control" : 0.13042840361595154,
    "continued-2103.key.23.candidate" : 0,
    "continued-2103.key.23.control" : 0.10780201107263565,
    "continued-2103.key.27.candidate" : 0,
    "continued-2103.key.27.control" : 0.13856907188892365,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0.10025380551815033,
    "continued-2103.key.31.candidate" : 0,
    "continued-2103.key.31.control" : 0.2088926136493683,
    "continued-2103.key.35.candidate" : 0,
    "continued-2103.key.35.control" : 0.2263779491186142,
    "continued-2103.key.39.candidate" : 0,
    "continued-2103.key.39.control" : 0.16093750298023224,
    "continued-2103.key.43.candidate" : 0,
    "continued-2103.key.43.control" : 0.1301020383834839,
    "continued-2103.key.47.candidate" : 0,
    "continued-2103.key.47.control" : 0.1561214029788971,
    "continued-2103.key.7.candidate" : 0,
    "continued-2103.key.7.control" : 0.09459459781646729,
    "continued-2103.logits.candidate" : 0,
    "continued-2103.logits.control" : 0.07326007634401321,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 0.0026787705719470978,
    "continued-2103.ssm.10.candidate" : 0,
    "continued-2103.ssm.10.control" : 0.031143467873334885,
    "continued-2103.ssm.12.candidate" : 0,
    "continued-2103.ssm.12.control" : 0.002614344470202923,
    "continued-2103.ssm.13.candidate" : 0,
    "continued-2103.ssm.13.control" : 0.023780474439263344,
    "continued-2103.ssm.14.candidate" : 0,
    "continued-2103.ssm.14.control" : 0.014368025586009026,
    "continued-2103.ssm.16.candidate" : 0,
    "continued-2103.ssm.16.control" : 0.028734911233186722,
    "continued-2103.ssm.17.candidate" : 0,
    "continued-2103.ssm.17.control" : 0.02891785278916359,
    "continued-2103.ssm.18.candidate" : 0,
    "continued-2103.ssm.18.control" : 0.06193260848522186,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0.013134132139384747,
    "continued-2103.ssm.20.candidate" : 0,
    "continued-2103.ssm.20.control" : 0.02367684617638588,
    "continued-2103.ssm.21.candidate" : 0,
    "continued-2103.ssm.21.control" : 0.01623089239001274,
    "continued-2103.ssm.22.candidate" : 0,
    "continued-2103.ssm.22.control" : 0.008682900108397007,
    "continued-2103.ssm.24.candidate" : 0,
    "continued-2103.ssm.24.control" : 0.018965991213917732,
    "continued-2103.ssm.25.candidate" : 0,
    "continued-2103.ssm.25.control" : 0.054733093827962875,
    "continued-2103.ssm.26.candidate" : 0,
    "continued-2103.ssm.26.control" : 0.05495327338576317,
    "continued-2103.ssm.28.candidate" : 0,
    "continued-2103.ssm.28.control" : 0.005612834822386503,
    "continued-2103.ssm.29.candidate" : 0,
    "continued-2103.ssm.29.control" : 0.05550353601574898,
    "continued-2103.ssm.30.candidate" : 0,
    "continued-2103.ssm.30.control" : 0.029813267290592194,
    "continued-2103.ssm.32.candidate" : 0,
    "continued-2103.ssm.32.control" : 0.12327084690332413,
    "continued-2103.ssm.33.candidate" : 0,
    "continued-2103.ssm.33.control" : 0.13337820768356323,
    "continued-2103.ssm.34.candidate" : 0,
    "continued-2103.ssm.34.control" : 0.08956097811460495,
    "continued-2103.ssm.36.candidate" : 0,
    "continued-2103.ssm.36.control" : 0.059749405831098557,
    "continued-2103.ssm.37.candidate" : 0,
    "continued-2103.ssm.37.control" : 0.07069515436887741,
    "continued-2103.ssm.38.candidate" : 0,
    "continued-2103.ssm.38.control" : 0.01771271787583828,
    "continued-2103.ssm.4.candidate" : 0,
    "continued-2103.ssm.4.control" : 0.02708258666098118,
    "continued-2103.ssm.40.candidate" : 0,
    "continued-2103.ssm.40.control" : 0.017384905368089676,
    "continued-2103.ssm.41.candidate" : 0,
    "continued-2103.ssm.41.control" : 0.04165691137313843,
    "continued-2103.ssm.42.candidate" : 0,
    "continued-2103.ssm.42.control" : 0.062465935945510864,
    "continued-2103.ssm.44.candidate" : 0,
    "continued-2103.ssm.44.control" : 0.017161983996629715,
    "continued-2103.ssm.45.candidate" : 0,
    "continued-2103.ssm.45.control" : 0.08259648829698563,
    "continued-2103.ssm.46.candidate" : 0,
    "continued-2103.ssm.46.control" : 0.13072989881038666,
    "continued-2103.ssm.5.candidate" : 0,
    "continued-2103.ssm.5.control" : 0.02513541653752327,
    "continued-2103.ssm.6.candidate" : 0,
    "continued-2103.ssm.6.control" : 0.013171319849789143,
    "continued-2103.ssm.8.candidate" : 0,
    "continued-2103.ssm.8.control" : 0.010763229802250862,
    "continued-2103.ssm.9.candidate" : 0,
    "continued-2103.ssm.9.control" : 0.026172427460551262,
    "continued-2103.value.11.candidate" : 0,
    "continued-2103.value.11.control" : 0.037938401103019714,
    "continued-2103.value.15.candidate" : 0,
    "continued-2103.value.15.control" : 0.026954680681228638,
    "continued-2103.value.19.candidate" : 0,
    "continued-2103.value.19.control" : 0.018112244084477425,
    "continued-2103.value.23.candidate" : 0,
    "continued-2103.value.23.control" : 0.04898255690932274,
    "continued-2103.value.27.candidate" : 0,
    "continued-2103.value.27.control" : 0.014095279388129711,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0.0514964796602726,
    "continued-2103.value.31.candidate" : 0,
    "continued-2103.value.31.control" : 0.07581521570682526,
    "continued-2103.value.35.candidate" : 0,
    "continued-2103.value.35.control" : 0.10303442180156708,
    "continued-2103.value.39.candidate" : 0,
    "continued-2103.value.39.control" : 0.05788690596818924,
    "continued-2103.value.43.candidate" : 0,
    "continued-2103.value.43.control" : 0.04938271641731262,
    "continued-2103.value.47.candidate" : 0,
    "continued-2103.value.47.control" : 0.4176829159259796,
    "continued-2103.value.7.candidate" : 0,
    "continued-2103.value.7.control" : 0.025449100881814957,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0.007462686393409967,
    "continued-907.conv.10.candidate" : 0,
    "continued-907.conv.10.control" : 0.01785714365541935,
    "continued-907.conv.12.candidate" : 0,
    "continued-907.conv.12.control" : 0.016255605965852737,
    "continued-907.conv.13.candidate" : 0,
    "continued-907.conv.13.control" : 0.016678370535373688,
    "continued-907.conv.14.candidate" : 0,
    "continued-907.conv.14.control" : 0.017502589151263237,
    "continued-907.conv.16.candidate" : 0,
    "continued-907.conv.16.control" : 0.0416666679084301,
    "continued-907.conv.17.candidate" : 0,
    "continued-907.conv.17.control" : 0.04891304299235344,
    "continued-907.conv.18.candidate" : 0,
    "continued-907.conv.18.control" : 0.030837005004286766,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0.004566209856420755,
    "continued-907.conv.20.candidate" : 0,
    "continued-907.conv.20.control" : 0.03276699036359787,
    "continued-907.conv.21.candidate" : 0,
    "continued-907.conv.21.control" : 0.029069768264889717,
    "continued-907.conv.22.candidate" : 0,
    "continued-907.conv.22.control" : 0.014084506779909134,
    "continued-907.conv.24.candidate" : 0,
    "continued-907.conv.24.control" : 0.03125,
    "continued-907.conv.25.candidate" : 0,
    "continued-907.conv.25.control" : 0.025841346010565758,
    "continued-907.conv.26.candidate" : 0,
    "continued-907.conv.26.control" : 0.0277122650295496,
    "continued-907.conv.28.candidate" : 0,
    "continued-907.conv.28.control" : 0.04931640625,
    "continued-907.conv.29.candidate" : 0,
    "continued-907.conv.29.control" : 0.06521739065647125,
    "continued-907.conv.30.candidate" : 0,
    "continued-907.conv.30.control" : 0.08730670064687729,
    "continued-907.conv.32.candidate" : 0,
    "continued-907.conv.32.control" : 0.10036946088075638,
    "continued-907.conv.33.candidate" : 0,
    "continued-907.conv.33.control" : 0.07307692617177963,
    "continued-907.conv.34.candidate" : 0,
    "continued-907.conv.34.control" : 0.10289300978183746,
    "continued-907.conv.36.candidate" : 0,
    "continued-907.conv.36.control" : 0.09158416092395782,
    "continued-907.conv.37.candidate" : 0,
    "continued-907.conv.37.control" : 0.07623318582773209,
    "continued-907.conv.38.candidate" : 0,
    "continued-907.conv.38.control" : 0.03570015728473663,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0.004980079829692841,
    "continued-907.conv.40.candidate" : 0,
    "continued-907.conv.40.control" : 0.08626760542392731,
    "continued-907.conv.41.candidate" : 0,
    "continued-907.conv.41.control" : 0.08399999886751175,
    "continued-907.conv.42.candidate" : 0,
    "continued-907.conv.42.control" : 0.05126633867621422,
    "continued-907.conv.44.candidate" : 0,
    "continued-907.conv.44.control" : 0.15625,
    "continued-907.conv.45.candidate" : 0,
    "continued-907.conv.45.control" : 0.06327589601278305,
    "continued-907.conv.46.candidate" : 0,
    "continued-907.conv.46.control" : 0.0714285746216774,
    "continued-907.conv.5.candidate" : 0,
    "continued-907.conv.5.control" : 0.02801724150776863,
    "continued-907.conv.6.candidate" : 0,
    "continued-907.conv.6.control" : 0.008971291594207287,
    "continued-907.conv.8.candidate" : 0,
    "continued-907.conv.8.control" : 0.008600917644798756,
    "continued-907.conv.9.candidate" : 0,
    "continued-907.conv.9.control" : 0.010582010261714458,
    "continued-907.index.11.candidate" : 0,
    "continued-907.index.11.control" : 0.036651235073804855,
    "continued-907.index.15.candidate" : 0,
    "continued-907.index.15.control" : 0.04915730282664299,
    "continued-907.index.19.candidate" : 0,
    "continued-907.index.19.control" : 0.04823059216141701,
    "continued-907.index.23.candidate" : 0,
    "continued-907.index.23.control" : 0.0357142873108387,
    "continued-907.index.27.candidate" : 0,
    "continued-907.index.27.control" : 0.05213490128517151,
    "continued-907.index.3.candidate" : 0,
    "continued-907.index.3.control" : 0.04844674468040466,
    "continued-907.index.31.candidate" : 0,
    "continued-907.index.31.control" : 0.16495901346206665,
    "continued-907.index.35.candidate" : 0,
    "continued-907.index.35.control" : 0.16928808391094208,
    "continued-907.index.39.candidate" : 0,
    "continued-907.index.39.control" : 0.06685126572847366,
    "continued-907.index.43.candidate" : 0,
    "continued-907.index.43.control" : 0.08535156399011612,
    "continued-907.index.47.candidate" : 0,
    "continued-907.index.47.control" : 0.17000000178813934,
    "continued-907.index.7.candidate" : 0,
    "continued-907.index.7.control" : 0.03216911852359772,
    "continued-907.key.11.candidate" : 0,
    "continued-907.key.11.control" : 0.09747596085071564,
    "continued-907.key.15.candidate" : 0,
    "continued-907.key.15.control" : 0.08759123831987381,
    "continued-907.key.19.candidate" : 0,
    "continued-907.key.19.control" : 0.13042840361595154,
    "continued-907.key.23.candidate" : 0,
    "continued-907.key.23.control" : 0.10780201107263565,
    "continued-907.key.27.candidate" : 0,
    "continued-907.key.27.control" : 0.13856907188892365,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0.10025380551815033,
    "continued-907.key.31.candidate" : 0,
    "continued-907.key.31.control" : 0.2088926136493683,
    "continued-907.key.35.candidate" : 0,
    "continued-907.key.35.control" : 0.2263779491186142,
    "continued-907.key.39.candidate" : 0,
    "continued-907.key.39.control" : 0.16093750298023224,
    "continued-907.key.43.candidate" : 0,
    "continued-907.key.43.control" : 0.1301020383834839,
    "continued-907.key.47.candidate" : 0,
    "continued-907.key.47.control" : 0.1561214029788971,
    "continued-907.key.7.candidate" : 0,
    "continued-907.key.7.control" : 0.09459459781646729,
    "continued-907.logits.candidate" : 0,
    "continued-907.logits.control" : 0.10332749783992767,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0.002358490601181984,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 0.0029804306104779243,
    "continued-907.ssm.10.candidate" : 0,
    "continued-907.ssm.10.control" : 0.023899657651782036,
    "continued-907.ssm.12.candidate" : 0,
    "continued-907.ssm.12.control" : 0.0027617975138127804,
    "continued-907.ssm.13.candidate" : 0,
    "continued-907.ssm.13.control" : 0.025602074339985847,
    "continued-907.ssm.14.candidate" : 0,
    "continued-907.ssm.14.control" : 0.01441024150699377,
    "continued-907.ssm.16.candidate" : 0,
    "continued-907.ssm.16.control" : 0.030779048800468445,
    "continued-907.ssm.17.candidate" : 0,
    "continued-907.ssm.17.control" : 0.04661482945084572,
    "continued-907.ssm.18.candidate" : 0,
    "continued-907.ssm.18.control" : 0.052911557257175446,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0.012658442370593548,
    "continued-907.ssm.20.candidate" : 0,
    "continued-907.ssm.20.control" : 0.018170980736613274,
    "continued-907.ssm.21.candidate" : 0,
    "continued-907.ssm.21.control" : 0.04367716982960701,
    "continued-907.ssm.22.candidate" : 0,
    "continued-907.ssm.22.control" : 0.009105023927986622,
    "continued-907.ssm.24.candidate" : 0,
    "continued-907.ssm.24.control" : 0.023251205682754517,
    "continued-907.ssm.25.candidate" : 0,
    "continued-907.ssm.25.control" : 0.03976874426007271,
    "continued-907.ssm.26.candidate" : 0,
    "continued-907.ssm.26.control" : 0.07139058411121368,
    "continued-907.ssm.28.candidate" : 0,
    "continued-907.ssm.28.control" : 0.005853470880538225,
    "continued-907.ssm.29.candidate" : 0,
    "continued-907.ssm.29.control" : 0.04265253245830536,
    "continued-907.ssm.30.candidate" : 0,
    "continued-907.ssm.30.control" : 0.05644851550459862,
    "continued-907.ssm.32.candidate" : 0,
    "continued-907.ssm.32.control" : 0.051649149507284164,
    "continued-907.ssm.33.candidate" : 0,
    "continued-907.ssm.33.control" : 0.11917489022016525,
    "continued-907.ssm.34.candidate" : 0,
    "continued-907.ssm.34.control" : 0.1024438738822937,
    "continued-907.ssm.36.candidate" : 0,
    "continued-907.ssm.36.control" : 0.0628051832318306,
    "continued-907.ssm.37.candidate" : 0,
    "continued-907.ssm.37.control" : 0.035683371126651764,
    "continued-907.ssm.38.candidate" : 0,
    "continued-907.ssm.38.control" : 0.024183083325624466,
    "continued-907.ssm.4.candidate" : 0,
    "continued-907.ssm.4.control" : 0.026571525260806084,
    "continued-907.ssm.40.candidate" : 0,
    "continued-907.ssm.40.control" : 0.017173657193779945,
    "continued-907.ssm.41.candidate" : 0,
    "continued-907.ssm.41.control" : 0.041870955377817154,
    "continued-907.ssm.42.candidate" : 0,
    "continued-907.ssm.42.control" : 0.03485302999615669,
    "continued-907.ssm.44.candidate" : 0,
    "continued-907.ssm.44.control" : 0.019561486318707466,
    "continued-907.ssm.45.candidate" : 0,
    "continued-907.ssm.45.control" : 0.09316158294677734,
    "continued-907.ssm.46.candidate" : 0,
    "continued-907.ssm.46.control" : 0.17210634052753448,
    "continued-907.ssm.5.candidate" : 0,
    "continued-907.ssm.5.control" : 0.03633773326873779,
    "continued-907.ssm.6.candidate" : 0,
    "continued-907.ssm.6.control" : 0.012331650592386723,
    "continued-907.ssm.8.candidate" : 0,
    "continued-907.ssm.8.control" : 0.010783889330923557,
    "continued-907.ssm.9.candidate" : 0,
    "continued-907.ssm.9.control" : 0.02468608319759369,
    "continued-907.value.11.candidate" : 0,
    "continued-907.value.11.control" : 0.037938401103019714,
    "continued-907.value.15.candidate" : 0,
    "continued-907.value.15.control" : 0.026954680681228638,
    "continued-907.value.19.candidate" : 0,
    "continued-907.value.19.control" : 0.018112244084477425,
    "continued-907.value.23.candidate" : 0,
    "continued-907.value.23.control" : 0.04898255690932274,
    "continued-907.value.27.candidate" : 0,
    "continued-907.value.27.control" : 0.014095279388129711,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0.0514964796602726,
    "continued-907.value.31.candidate" : 0,
    "continued-907.value.31.control" : 0.07581521570682526,
    "continued-907.value.35.candidate" : 0,
    "continued-907.value.35.control" : 0.10303442180156708,
    "continued-907.value.39.candidate" : 0,
    "continued-907.value.39.control" : 0.05788690596818924,
    "continued-907.value.43.candidate" : 0,
    "continued-907.value.43.control" : 0.04938271641731262,
    "continued-907.value.47.candidate" : 0,
    "continued-907.value.47.control" : 0.4176829159259796,
    "continued-907.value.7.candidate" : 0,
    "continued-907.value.7.control" : 0.025449100881814957,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0.007462686393409967,
    "prefill.conv.10.candidate" : 0,
    "prefill.conv.10.control" : 0.01785714365541935,
    "prefill.conv.12.candidate" : 0,
    "prefill.conv.12.control" : 0.018497757613658905,
    "prefill.conv.13.candidate" : 0,
    "prefill.conv.13.control" : 0.01825842633843422,
    "prefill.conv.14.candidate" : 0,
    "prefill.conv.14.control" : 0.016067421063780785,
    "prefill.conv.16.candidate" : 0,
    "prefill.conv.16.control" : 0.016635572537779808,
    "prefill.conv.17.candidate" : 0,
    "prefill.conv.17.control" : 0.014492753893136978,
    "prefill.conv.18.candidate" : 0,
    "prefill.conv.18.control" : 0.013491189107298851,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0.00570776266977191,
    "prefill.conv.20.candidate" : 0,
    "prefill.conv.20.control" : 0.019417475908994675,
    "prefill.conv.21.candidate" : 0,
    "prefill.conv.21.control" : 0.023170731961727142,
    "prefill.conv.22.candidate" : 0,
    "prefill.conv.22.control" : 0.012456294149160385,
    "prefill.conv.24.candidate" : 0,
    "prefill.conv.24.control" : 0.02864583395421505,
    "prefill.conv.25.candidate" : 0,
    "prefill.conv.25.control" : 0.025841346010565758,
    "prefill.conv.26.candidate" : 0,
    "prefill.conv.26.control" : 0.021226415410637856,
    "prefill.conv.28.candidate" : 0,
    "prefill.conv.28.control" : 0.03414726257324219,
    "prefill.conv.29.candidate" : 0,
    "prefill.conv.29.control" : 0.04415760934352875,
    "prefill.conv.30.candidate" : 0,
    "prefill.conv.30.control" : 0.0670103058218956,
    "prefill.conv.32.candidate" : 0,
    "prefill.conv.32.control" : 0.054999999701976776,
    "prefill.conv.33.candidate" : 0,
    "prefill.conv.33.control" : 0.06778845936059952,
    "prefill.conv.34.candidate" : 0,
    "prefill.conv.34.control" : 0.07236842066049576,
    "prefill.conv.36.candidate" : 0,
    "prefill.conv.36.control" : 0.0876777246594429,
    "prefill.conv.37.candidate" : 0,
    "prefill.conv.37.control" : 0.05752212554216385,
    "prefill.conv.38.candidate" : 0,
    "prefill.conv.38.control" : 0.034185606986284256,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0.0039840638637542725,
    "prefill.conv.40.candidate" : 0,
    "prefill.conv.40.control" : 0.08626760542392731,
    "prefill.conv.41.candidate" : 0,
    "prefill.conv.41.control" : 0.05550000071525574,
    "prefill.conv.42.candidate" : 0,
    "prefill.conv.42.control" : 0.05106209218502045,
    "prefill.conv.44.candidate" : 0,
    "prefill.conv.44.control" : 0.11249999701976776,
    "prefill.conv.45.candidate" : 0,
    "prefill.conv.45.control" : 0.04432398080825806,
    "prefill.conv.46.candidate" : 0,
    "prefill.conv.46.control" : 0.048076923936605453,
    "prefill.conv.5.candidate" : 0,
    "prefill.conv.5.control" : 0.01834862306714058,
    "prefill.conv.6.candidate" : 0,
    "prefill.conv.6.control" : 0.008391203358769417,
    "prefill.conv.8.candidate" : 0,
    "prefill.conv.8.control" : 0.007735148537904024,
    "prefill.conv.9.candidate" : 0,
    "prefill.conv.9.control" : 0.010582010261714458,
    "prefill.index.11.candidate" : 0,
    "prefill.index.11.control" : 0.036651235073804855,
    "prefill.index.15.candidate" : 0,
    "prefill.index.15.control" : 0.04915730282664299,
    "prefill.index.19.candidate" : 0,
    "prefill.index.19.control" : 0.04823059216141701,
    "prefill.index.23.candidate" : 0,
    "prefill.index.23.control" : 0.0357142873108387,
    "prefill.index.27.candidate" : 0,
    "prefill.index.27.control" : 0.05213490128517151,
    "prefill.index.3.candidate" : 0,
    "prefill.index.3.control" : 0.04844674468040466,
    "prefill.index.31.candidate" : 0,
    "prefill.index.31.control" : 0.16495901346206665,
    "prefill.index.35.candidate" : 0,
    "prefill.index.35.control" : 0.16928808391094208,
    "prefill.index.39.candidate" : 0,
    "prefill.index.39.control" : 0.06685126572847366,
    "prefill.index.43.candidate" : 0,
    "prefill.index.43.control" : 0.08535156399011612,
    "prefill.index.47.candidate" : 0,
    "prefill.index.47.control" : 0.17000000178813934,
    "prefill.index.7.candidate" : 0,
    "prefill.index.7.control" : 0.03216911852359772,
    "prefill.key.11.candidate" : 0,
    "prefill.key.11.control" : 0.09747596085071564,
    "prefill.key.15.candidate" : 0,
    "prefill.key.15.control" : 0.08759123831987381,
    "prefill.key.19.candidate" : 0,
    "prefill.key.19.control" : 0.13042840361595154,
    "prefill.key.23.candidate" : 0,
    "prefill.key.23.control" : 0.10780201107263565,
    "prefill.key.27.candidate" : 0,
    "prefill.key.27.control" : 0.13856907188892365,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0.10025380551815033,
    "prefill.key.31.candidate" : 0,
    "prefill.key.31.control" : 0.2088926136493683,
    "prefill.key.35.candidate" : 0,
    "prefill.key.35.control" : 0.2263779491186142,
    "prefill.key.39.candidate" : 0,
    "prefill.key.39.control" : 0.16093750298023224,
    "prefill.key.43.candidate" : 0,
    "prefill.key.43.control" : 0.1301020383834839,
    "prefill.key.47.candidate" : 0,
    "prefill.key.47.control" : 0.1561214029788971,
    "prefill.key.7.candidate" : 0,
    "prefill.key.7.control" : 0.09459459781646729,
    "prefill.logits.candidate" : 0,
    "prefill.logits.control" : 0.09259258955717087,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0.004716981202363968,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 0.002704237587749958,
    "prefill.ssm.10.candidate" : 0,
    "prefill.ssm.10.control" : 0.04185683652758598,
    "prefill.ssm.12.candidate" : 0,
    "prefill.ssm.12.control" : 0.0041755507700145245,
    "prefill.ssm.13.candidate" : 0,
    "prefill.ssm.13.control" : 0.025806840509176254,
    "prefill.ssm.14.candidate" : 0,
    "prefill.ssm.14.control" : 0.014317338354885578,
    "prefill.ssm.16.candidate" : 0,
    "prefill.ssm.16.control" : 0.030117077752947807,
    "prefill.ssm.17.candidate" : 0,
    "prefill.ssm.17.control" : 0.015753688290715218,
    "prefill.ssm.18.candidate" : 0,
    "prefill.ssm.18.control" : 0.030686693266034126,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0.011411177925765514,
    "prefill.ssm.20.candidate" : 0,
    "prefill.ssm.20.control" : 0.013600090518593788,
    "prefill.ssm.21.candidate" : 0,
    "prefill.ssm.21.control" : 0.021862631663680077,
    "prefill.ssm.22.candidate" : 0,
    "prefill.ssm.22.control" : 0.009415468201041222,
    "prefill.ssm.24.candidate" : 0,
    "prefill.ssm.24.control" : 0.025286737829446793,
    "prefill.ssm.25.candidate" : 0,
    "prefill.ssm.25.control" : 0.029029227793216705,
    "prefill.ssm.26.candidate" : 0,
    "prefill.ssm.26.control" : 0.03773251920938492,
    "prefill.ssm.28.candidate" : 0,
    "prefill.ssm.28.control" : 0.00403100810945034,
    "prefill.ssm.29.candidate" : 0,
    "prefill.ssm.29.control" : 0.050416283309459686,
    "prefill.ssm.30.candidate" : 0,
    "prefill.ssm.30.control" : 0.031091658398509026,
    "prefill.ssm.32.candidate" : 0,
    "prefill.ssm.32.control" : 0.06386008113622665,
    "prefill.ssm.33.candidate" : 0,
    "prefill.ssm.33.control" : 0.07677856087684631,
    "prefill.ssm.34.candidate" : 0,
    "prefill.ssm.34.control" : 0.06809794902801514,
    "prefill.ssm.36.candidate" : 0,
    "prefill.ssm.36.control" : 0.0710095539689064,
    "prefill.ssm.37.candidate" : 0,
    "prefill.ssm.37.control" : 0.05589859187602997,
    "prefill.ssm.38.candidate" : 0,
    "prefill.ssm.38.control" : 0.016206664964556694,
    "prefill.ssm.4.candidate" : 0,
    "prefill.ssm.4.control" : 0.02719864435493946,
    "prefill.ssm.40.candidate" : 0,
    "prefill.ssm.40.control" : 0.017824072390794754,
    "prefill.ssm.41.candidate" : 0,
    "prefill.ssm.41.control" : 0.04140927270054817,
    "prefill.ssm.42.candidate" : 0,
    "prefill.ssm.42.control" : 0.03370935842394829,
    "prefill.ssm.44.candidate" : 0,
    "prefill.ssm.44.control" : 0.019831746816635132,
    "prefill.ssm.45.candidate" : 0,
    "prefill.ssm.45.control" : 0.06491202861070633,
    "prefill.ssm.46.candidate" : 0,
    "prefill.ssm.46.control" : 0.18722502887248993,
    "prefill.ssm.5.candidate" : 0,
    "prefill.ssm.5.control" : 0.025340046733617783,
    "prefill.ssm.6.candidate" : 0,
    "prefill.ssm.6.control" : 0.01200084201991558,
    "prefill.ssm.8.candidate" : 0,
    "prefill.ssm.8.control" : 0.010806315578520298,
    "prefill.ssm.9.candidate" : 0,
    "prefill.ssm.9.control" : 0.026259908452630043,
    "prefill.value.11.candidate" : 0,
    "prefill.value.11.control" : 0.037938401103019714,
    "prefill.value.15.candidate" : 0,
    "prefill.value.15.control" : 0.026954680681228638,
    "prefill.value.19.candidate" : 0,
    "prefill.value.19.control" : 0.018112244084477425,
    "prefill.value.23.candidate" : 0,
    "prefill.value.23.control" : 0.04898255690932274,
    "prefill.value.27.candidate" : 0,
    "prefill.value.27.control" : 0.014095279388129711,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0.0514964796602726,
    "prefill.value.31.candidate" : 0,
    "prefill.value.31.control" : 0.07581521570682526,
    "prefill.value.35.candidate" : 0,
    "prefill.value.35.control" : 0.10303442180156708,
    "prefill.value.39.candidate" : 0,
    "prefill.value.39.control" : 0.05788690596818924,
    "prefill.value.43.candidate" : 0,
    "prefill.value.43.control" : 0.04938271641731262,
    "prefill.value.47.candidate" : 0,
    "prefill.value.47.control" : 0.4176829159259796,
    "prefill.value.7.candidate" : 0,
    "prefill.value.7.control" : 0.025449100881814957,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0.0036764706019312143,
    "rollback-1.conv.10.candidate" : 0,
    "rollback-1.conv.10.control" : 0.024636628106236458,
    "rollback-1.conv.12.candidate" : 0,
    "rollback-1.conv.12.control" : 0.024336284026503563,
    "rollback-1.conv.13.candidate" : 0,
    "rollback-1.conv.13.control" : 0.02432432398200035,
    "rollback-1.conv.14.candidate" : 0,
    "rollback-1.conv.14.control" : 0.029797740280628204,
    "rollback-1.conv.16.candidate" : 0,
    "rollback-1.conv.16.control" : 0.04749999940395355,
    "rollback-1.conv.17.candidate" : 0,
    "rollback-1.conv.17.control" : 0.05885152146220207,
    "rollback-1.conv.18.candidate" : 0,
    "rollback-1.conv.18.control" : 0.03669724613428116,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0.01991279050707817,
    "rollback-1.conv.20.candidate" : 0,
    "rollback-1.conv.20.control" : 0.06154822185635567,
    "rollback-1.conv.21.candidate" : 0,
    "rollback-1.conv.21.control" : 0.04217233136296272,
    "rollback-1.conv.22.candidate" : 0,
    "rollback-1.conv.22.control" : 0.025487588718533516,
    "rollback-1.conv.24.candidate" : 0,
    "rollback-1.conv.24.control" : 0.03889448940753937,
    "rollback-1.conv.25.candidate" : 0,
    "rollback-1.conv.25.control" : 0.04066985473036766,
    "rollback-1.conv.26.candidate" : 0,
    "rollback-1.conv.26.control" : 0.05882352963089943,
    "rollback-1.conv.28.candidate" : 0,
    "rollback-1.conv.28.control" : 0.06528340280056,
    "rollback-1.conv.29.candidate" : 0,
    "rollback-1.conv.29.control" : 0.08165828883647919,
    "rollback-1.conv.30.candidate" : 0,
    "rollback-1.conv.30.control" : 0.0859375,
    "rollback-1.conv.32.candidate" : 0,
    "rollback-1.conv.32.control" : 0.0882352963089943,
    "rollback-1.conv.33.candidate" : 0,
    "rollback-1.conv.33.control" : 0.07459677755832672,
    "rollback-1.conv.34.candidate" : 0,
    "rollback-1.conv.34.control" : 0.0989583358168602,
    "rollback-1.conv.36.candidate" : 0,
    "rollback-1.conv.36.control" : 0.11014851182699203,
    "rollback-1.conv.37.candidate" : 0,
    "rollback-1.conv.37.control" : 0.125,
    "rollback-1.conv.38.candidate" : 0,
    "rollback-1.conv.38.control" : 0.05429687350988388,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0.013976792804896832,
    "rollback-1.conv.40.candidate" : 0,
    "rollback-1.conv.40.control" : 0.13120567798614502,
    "rollback-1.conv.41.candidate" : 0,
    "rollback-1.conv.41.control" : 0.09857723861932755,
    "rollback-1.conv.42.candidate" : 0,
    "rollback-1.conv.42.control" : 0.09250827878713608,
    "rollback-1.conv.44.candidate" : 0,
    "rollback-1.conv.44.control" : 0.11728394776582718,
    "rollback-1.conv.45.candidate" : 0,
    "rollback-1.conv.45.control" : 0.07948825508356094,
    "rollback-1.conv.46.candidate" : 0,
    "rollback-1.conv.46.control" : 0.09031100571155548,
    "rollback-1.conv.5.candidate" : 0,
    "rollback-1.conv.5.control" : 0.04680851101875305,
    "rollback-1.conv.6.candidate" : 0,
    "rollback-1.conv.6.control" : 0.031707316637039185,
    "rollback-1.conv.8.candidate" : 0,
    "rollback-1.conv.8.control" : 0.024752475321292877,
    "rollback-1.conv.9.candidate" : 0,
    "rollback-1.conv.9.control" : 0.03125,
    "rollback-1.index.11.candidate" : 0,
    "rollback-1.index.11.control" : 0.036651235073804855,
    "rollback-1.index.15.candidate" : 0,
    "rollback-1.index.15.control" : 0.04915730282664299,
    "rollback-1.index.19.candidate" : 0,
    "rollback-1.index.19.control" : 0.04823059216141701,
    "rollback-1.index.23.candidate" : 0,
    "rollback-1.index.23.control" : 0.0357142873108387,
    "rollback-1.index.27.candidate" : 0,
    "rollback-1.index.27.control" : 0.05213490128517151,
    "rollback-1.index.3.candidate" : 0,
    "rollback-1.index.3.control" : 0.04844674468040466,
    "rollback-1.index.31.candidate" : 0,
    "rollback-1.index.31.control" : 0.16495901346206665,
    "rollback-1.index.35.candidate" : 0,
    "rollback-1.index.35.control" : 0.16928808391094208,
    "rollback-1.index.39.candidate" : 0,
    "rollback-1.index.39.control" : 0.06685126572847366,
    "rollback-1.index.43.candidate" : 0,
    "rollback-1.index.43.control" : 0.08535156399011612,
    "rollback-1.index.47.candidate" : 0,
    "rollback-1.index.47.control" : 0.17000000178813934,
    "rollback-1.index.7.candidate" : 0,
    "rollback-1.index.7.control" : 0.03216911852359772,
    "rollback-1.key.11.candidate" : 0,
    "rollback-1.key.11.control" : 0.09747596085071564,
    "rollback-1.key.15.candidate" : 0,
    "rollback-1.key.15.control" : 0.08759123831987381,
    "rollback-1.key.19.candidate" : 0,
    "rollback-1.key.19.control" : 0.13042840361595154,
    "rollback-1.key.23.candidate" : 0,
    "rollback-1.key.23.control" : 0.10780201107263565,
    "rollback-1.key.27.candidate" : 0,
    "rollback-1.key.27.control" : 0.13856907188892365,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0.10025380551815033,
    "rollback-1.key.31.candidate" : 0,
    "rollback-1.key.31.control" : 0.2088926136493683,
    "rollback-1.key.35.candidate" : 0,
    "rollback-1.key.35.control" : 0.2263779491186142,
    "rollback-1.key.39.candidate" : 0,
    "rollback-1.key.39.control" : 0.16093750298023224,
    "rollback-1.key.43.candidate" : 0,
    "rollback-1.key.43.control" : 0.1301020383834839,
    "rollback-1.key.47.candidate" : 0,
    "rollback-1.key.47.control" : 0.1561214029788971,
    "rollback-1.key.7.candidate" : 0,
    "rollback-1.key.7.control" : 0.09459459781646729,
    "rollback-1.logits.candidate" : 0,
    "rollback-1.logits.control" : 0.11010362952947617,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 0.0016687766183167696,
    "rollback-1.ssm.10.candidate" : 0,
    "rollback-1.ssm.10.control" : 0.04546959698200226,
    "rollback-1.ssm.12.candidate" : 0,
    "rollback-1.ssm.12.control" : 0.004076096229255199,
    "rollback-1.ssm.13.candidate" : 0,
    "rollback-1.ssm.13.control" : 0.03342162072658539,
    "rollback-1.ssm.14.candidate" : 0,
    "rollback-1.ssm.14.control" : 0.016810311004519463,
    "rollback-1.ssm.16.candidate" : 0,
    "rollback-1.ssm.16.control" : 0.04106974974274635,
    "rollback-1.ssm.17.candidate" : 0,
    "rollback-1.ssm.17.control" : 0.0696505680680275,
    "rollback-1.ssm.18.candidate" : 0,
    "rollback-1.ssm.18.control" : 0.05894295871257782,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0.012737466022372246,
    "rollback-1.ssm.20.candidate" : 0,
    "rollback-1.ssm.20.control" : 0.031774140894412994,
    "rollback-1.ssm.21.candidate" : 0,
    "rollback-1.ssm.21.control" : 0.03705133870244026,
    "rollback-1.ssm.22.candidate" : 0,
    "rollback-1.ssm.22.control" : 0.008585071191191673,
    "rollback-1.ssm.24.candidate" : 0,
    "rollback-1.ssm.24.control" : 0.03747611120343208,
    "rollback-1.ssm.25.candidate" : 0,
    "rollback-1.ssm.25.control" : 0.08679033815860748,
    "rollback-1.ssm.26.candidate" : 0,
    "rollback-1.ssm.26.control" : 0.08535387367010117,
    "rollback-1.ssm.28.candidate" : 0,
    "rollback-1.ssm.28.control" : 0.004557494539767504,
    "rollback-1.ssm.29.candidate" : 0,
    "rollback-1.ssm.29.control" : 0.05519532412290573,
    "rollback-1.ssm.30.candidate" : 0,
    "rollback-1.ssm.30.control" : 0.10250090807676315,
    "rollback-1.ssm.32.candidate" : 0,
    "rollback-1.ssm.32.control" : 0.18351422250270844,
    "rollback-1.ssm.33.candidate" : 0,
    "rollback-1.ssm.33.control" : 0.14023537933826447,
    "rollback-1.ssm.34.candidate" : 0,
    "rollback-1.ssm.34.control" : 0.15133608877658844,
    "rollback-1.ssm.36.candidate" : 0,
    "rollback-1.ssm.36.control" : 0.08182356506586075,
    "rollback-1.ssm.37.candidate" : 0,
    "rollback-1.ssm.37.control" : 0.039026129990816116,
    "rollback-1.ssm.38.candidate" : 0,
    "rollback-1.ssm.38.control" : 0.019852371886372566,
    "rollback-1.ssm.4.candidate" : 0,
    "rollback-1.ssm.4.control" : 0.029741346836090088,
    "rollback-1.ssm.40.candidate" : 0,
    "rollback-1.ssm.40.control" : 0.021310992538928986,
    "rollback-1.ssm.41.candidate" : 0,
    "rollback-1.ssm.41.control" : 0.041662778705358505,
    "rollback-1.ssm.42.candidate" : 0,
    "rollback-1.ssm.42.control" : 0.05865435674786568,
    "rollback-1.ssm.44.candidate" : 0,
    "rollback-1.ssm.44.control" : 0.017349814996123314,
    "rollback-1.ssm.45.candidate" : 0,
    "rollback-1.ssm.45.control" : 0.13683666288852692,
    "rollback-1.ssm.46.candidate" : 0,
    "rollback-1.ssm.46.control" : 0.15382017195224762,
    "rollback-1.ssm.5.candidate" : 0,
    "rollback-1.ssm.5.control" : 0.046914659440517426,
    "rollback-1.ssm.6.candidate" : 0,
    "rollback-1.ssm.6.control" : 0.027633061632514,
    "rollback-1.ssm.8.candidate" : 0,
    "rollback-1.ssm.8.control" : 0.02003251202404499,
    "rollback-1.ssm.9.candidate" : 0,
    "rollback-1.ssm.9.control" : 0.057640768587589264,
    "rollback-1.value.11.candidate" : 0,
    "rollback-1.value.11.control" : 0.037938401103019714,
    "rollback-1.value.15.candidate" : 0,
    "rollback-1.value.15.control" : 0.026954680681228638,
    "rollback-1.value.19.candidate" : 0,
    "rollback-1.value.19.control" : 0.022448979318141937,
    "rollback-1.value.23.candidate" : 0,
    "rollback-1.value.23.control" : 0.04898255690932274,
    "rollback-1.value.27.candidate" : 0,
    "rollback-1.value.27.control" : 0.014095279388129711,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0.0514964796602726,
    "rollback-1.value.31.candidate" : 0,
    "rollback-1.value.31.control" : 0.07581521570682526,
    "rollback-1.value.35.candidate" : 0,
    "rollback-1.value.35.control" : 0.10303442180156708,
    "rollback-1.value.39.candidate" : 0,
    "rollback-1.value.39.control" : 0.05788690596818924,
    "rollback-1.value.43.candidate" : 0,
    "rollback-1.value.43.control" : 0.04938271641731262,
    "rollback-1.value.47.candidate" : 0,
    "rollback-1.value.47.control" : 0.4176829159259796,
    "rollback-1.value.7.candidate" : 0,
    "rollback-1.value.7.control" : 0.025449100881814957,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0,
    "rollback-2.conv.10.control" : 0.02713414654135704,
    "rollback-2.conv.12.candidate" : 0,
    "rollback-2.conv.12.control" : 0.0251141544431448,
    "rollback-2.conv.13.candidate" : 0,
    "rollback-2.conv.13.control" : 0.028409091755747795,
    "rollback-2.conv.14.candidate" : 0,
    "rollback-2.conv.14.control" : 0.042071908712387085,
    "rollback-2.conv.16.candidate" : 0,
    "rollback-2.conv.16.control" : 0.04679802805185318,
    "rollback-2.conv.17.candidate" : 0,
    "rollback-2.conv.17.control" : 0.05885152146220207,
    "rollback-2.conv.18.candidate" : 0,
    "rollback-2.conv.18.control" : 0.03669724613428116,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0.013414634391665459,
    "rollback-2.conv.20.candidate" : 0,
    "rollback-2.conv.20.control" : 0.06217948719859123,
    "rollback-2.conv.21.candidate" : 0,
    "rollback-2.conv.21.control" : 0.04217233136296272,
    "rollback-2.conv.22.candidate" : 0,
    "rollback-2.conv.22.control" : 0.024364883080124855,
    "rollback-2.conv.24.candidate" : 0,
    "rollback-2.conv.24.control" : 0.03974931314587593,
    "rollback-2.conv.25.candidate" : 0,
    "rollback-2.conv.25.control" : 0.04086538404226303,
    "rollback-2.conv.26.candidate" : 0,
    "rollback-2.conv.26.control" : 0.049879807978868484,
    "rollback-2.conv.28.candidate" : 0,
    "rollback-2.conv.28.control" : 0.063988097012043,
    "rollback-2.conv.29.candidate" : 0,
    "rollback-2.conv.29.control" : 0.08165828883647919,
    "rollback-2.conv.30.candidate" : 0,
    "rollback-2.conv.30.control" : 0.08505154401063919,
    "rollback-2.conv.32.candidate" : 0,
    "rollback-2.conv.32.control" : 0.0902777761220932,
    "rollback-2.conv.33.candidate" : 0,
    "rollback-2.conv.33.control" : 0.07459677755832672,
    "rollback-2.conv.34.candidate" : 0,
    "rollback-2.conv.34.control" : 0.09680706262588501,
    "rollback-2.conv.36.candidate" : 0,
    "rollback-2.conv.36.control" : 0.10679611563682556,
    "rollback-2.conv.37.candidate" : 0,
    "rollback-2.conv.37.control" : 0.06086956337094307,
    "rollback-2.conv.38.candidate" : 0,
    "rollback-2.conv.38.control" : 0.04921875149011612,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0.013976792804896832,
    "rollback-2.conv.40.candidate" : 0,
    "rollback-2.conv.40.control" : 0.10218977928161621,
    "rollback-2.conv.41.candidate" : 0,
    "rollback-2.conv.41.control" : 0.0962301567196846,
    "rollback-2.conv.42.candidate" : 0,
    "rollback-2.conv.42.control" : 0.08702699840068817,
    "rollback-2.conv.44.candidate" : 0,
    "rollback-2.conv.44.control" : 0.1130952388048172,
    "rollback-2.conv.45.candidate" : 0,
    "rollback-2.conv.45.control" : 0.07550335675477982,
    "rollback-2.conv.46.candidate" : 0,
    "rollback-2.conv.46.control" : 0.09729381650686264,
    "rollback-2.conv.5.candidate" : 0,
    "rollback-2.conv.5.control" : 0.04615384712815285,
    "rollback-2.conv.6.candidate" : 0,
    "rollback-2.conv.6.control" : 0.03140096738934517,
    "rollback-2.conv.8.candidate" : 0,
    "rollback-2.conv.8.control" : 0.02599009871482849,
    "rollback-2.conv.9.candidate" : 0,
    "rollback-2.conv.9.control" : 0.03212780877947807,
    "rollback-2.index.11.candidate" : 0,
    "rollback-2.index.11.control" : 0.036651235073804855,
    "rollback-2.index.15.candidate" : 0,
    "rollback-2.index.15.control" : 0.04915730282664299,
    "rollback-2.index.19.candidate" : 0,
    "rollback-2.index.19.control" : 0.04823059216141701,
    "rollback-2.index.23.candidate" : 0,
    "rollback-2.index.23.control" : 0.0357142873108387,
    "rollback-2.index.27.candidate" : 0,
    "rollback-2.index.27.control" : 0.05213490128517151,
    "rollback-2.index.3.candidate" : 0,
    "rollback-2.index.3.control" : 0.04844674468040466,
    "rollback-2.index.31.candidate" : 0,
    "rollback-2.index.31.control" : 0.16495901346206665,
    "rollback-2.index.35.candidate" : 0,
    "rollback-2.index.35.control" : 0.16928808391094208,
    "rollback-2.index.39.candidate" : 0,
    "rollback-2.index.39.control" : 0.06685126572847366,
    "rollback-2.index.43.candidate" : 0,
    "rollback-2.index.43.control" : 0.08535156399011612,
    "rollback-2.index.47.candidate" : 0,
    "rollback-2.index.47.control" : 0.17000000178813934,
    "rollback-2.index.7.candidate" : 0,
    "rollback-2.index.7.control" : 0.03216911852359772,
    "rollback-2.key.11.candidate" : 0,
    "rollback-2.key.11.control" : 0.09747596085071564,
    "rollback-2.key.15.candidate" : 0,
    "rollback-2.key.15.control" : 0.08759123831987381,
    "rollback-2.key.19.candidate" : 0,
    "rollback-2.key.19.control" : 0.13042840361595154,
    "rollback-2.key.23.candidate" : 0,
    "rollback-2.key.23.control" : 0.10780201107263565,
    "rollback-2.key.27.candidate" : 0,
    "rollback-2.key.27.control" : 0.13856907188892365,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0.10025380551815033,
    "rollback-2.key.31.candidate" : 0,
    "rollback-2.key.31.control" : 0.2088926136493683,
    "rollback-2.key.35.candidate" : 0,
    "rollback-2.key.35.control" : 0.2263779491186142,
    "rollback-2.key.39.candidate" : 0,
    "rollback-2.key.39.control" : 0.16093750298023224,
    "rollback-2.key.43.candidate" : 0,
    "rollback-2.key.43.control" : 0.1301020383834839,
    "rollback-2.key.47.candidate" : 0,
    "rollback-2.key.47.control" : 0.1561214029788971,
    "rollback-2.key.7.candidate" : 0,
    "rollback-2.key.7.control" : 0.09459459781646729,
    "rollback-2.logits.candidate" : 0,
    "rollback-2.logits.control" : 0.11175337433815002,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 0.001579031813889742,
    "rollback-2.ssm.10.candidate" : 0,
    "rollback-2.ssm.10.control" : 0.05156170204281807,
    "rollback-2.ssm.12.candidate" : 0,
    "rollback-2.ssm.12.control" : 0.004401271231472492,
    "rollback-2.ssm.13.candidate" : 0,
    "rollback-2.ssm.13.control" : 0.03369653597474098,
    "rollback-2.ssm.14.candidate" : 0,
    "rollback-2.ssm.14.control" : 0.013484829105436802,
    "rollback-2.ssm.16.candidate" : 0,
    "rollback-2.ssm.16.control" : 0.05002614110708237,
    "rollback-2.ssm.17.candidate" : 0,
    "rollback-2.ssm.17.control" : 0.0453394278883934,
    "rollback-2.ssm.18.candidate" : 0,
    "rollback-2.ssm.18.control" : 0.07419704645872116,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0.01262714434415102,
    "rollback-2.ssm.20.candidate" : 0,
    "rollback-2.ssm.20.control" : 0.015683334320783615,
    "rollback-2.ssm.21.candidate" : 0,
    "rollback-2.ssm.21.control" : 0.015878180041909218,
    "rollback-2.ssm.22.candidate" : 0,
    "rollback-2.ssm.22.control" : 0.008367989212274551,
    "rollback-2.ssm.24.candidate" : 0,
    "rollback-2.ssm.24.control" : 0.018955666571855545,
    "rollback-2.ssm.25.candidate" : 0,
    "rollback-2.ssm.25.control" : 0.06907308846712112,
    "rollback-2.ssm.26.candidate" : 0,
    "rollback-2.ssm.26.control" : 0.06037506088614464,
    "rollback-2.ssm.28.candidate" : 0,
    "rollback-2.ssm.28.control" : 0.004087875131517649,
    "rollback-2.ssm.29.candidate" : 0,
    "rollback-2.ssm.29.control" : 0.039764516055583954,
    "rollback-2.ssm.30.candidate" : 0,
    "rollback-2.ssm.30.control" : 0.037178512662649155,
    "rollback-2.ssm.32.candidate" : 0,
    "rollback-2.ssm.32.control" : 0.07559378445148468,
    "rollback-2.ssm.33.candidate" : 0,
    "rollback-2.ssm.33.control" : 0.07184648513793945,
    "rollback-2.ssm.34.candidate" : 0,
    "rollback-2.ssm.34.control" : 0.08510051667690277,
    "rollback-2.ssm.36.candidate" : 0,
    "rollback-2.ssm.36.control" : 0.058085765689611435,
    "rollback-2.ssm.37.candidate" : 0,
    "rollback-2.ssm.37.control" : 0.05383116379380226,
    "rollback-2.ssm.38.candidate" : 0,
    "rollback-2.ssm.38.control" : 0.02166302502155304,
    "rollback-2.ssm.4.candidate" : 0,
    "rollback-2.ssm.4.control" : 0.027622541412711143,
    "rollback-2.ssm.40.candidate" : 0,
    "rollback-2.ssm.40.control" : 0.023858141154050827,
    "rollback-2.ssm.41.candidate" : 0,
    "rollback-2.ssm.41.control" : 0.04141821712255478,
    "rollback-2.ssm.42.candidate" : 0,
    "rollback-2.ssm.42.control" : 0.04111645743250847,
    "rollback-2.ssm.44.candidate" : 0,
    "rollback-2.ssm.44.control" : 0.03075091354548931,
    "rollback-2.ssm.45.candidate" : 0,
    "rollback-2.ssm.45.control" : 0.09502673149108887,
    "rollback-2.ssm.46.candidate" : 0,
    "rollback-2.ssm.46.control" : 0.13896313309669495,
    "rollback-2.ssm.5.candidate" : 0,
    "rollback-2.ssm.5.control" : 0.027691280469298363,
    "rollback-2.ssm.6.candidate" : 0,
    "rollback-2.ssm.6.control" : 0.013277466408908367,
    "rollback-2.ssm.8.candidate" : 0,
    "rollback-2.ssm.8.control" : 0.014318466186523438,
    "rollback-2.ssm.9.candidate" : 0,
    "rollback-2.ssm.9.control" : 0.030974194407463074,
    "rollback-2.value.11.candidate" : 0,
    "rollback-2.value.11.control" : 0.04833633080124855,
    "rollback-2.value.15.candidate" : 0,
    "rollback-2.value.15.control" : 0.026954680681228638,
    "rollback-2.value.19.candidate" : 0,
    "rollback-2.value.19.control" : 0.022448979318141937,
    "rollback-2.value.23.candidate" : 0,
    "rollback-2.value.23.control" : 0.04898255690932274,
    "rollback-2.value.27.candidate" : 0,
    "rollback-2.value.27.control" : 0.014095279388129711,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0.0514964796602726,
    "rollback-2.value.31.candidate" : 0,
    "rollback-2.value.31.control" : 0.07581521570682526,
    "rollback-2.value.35.candidate" : 0,
    "rollback-2.value.35.control" : 0.10303442180156708,
    "rollback-2.value.39.candidate" : 0,
    "rollback-2.value.39.control" : 0.05788690596818924,
    "rollback-2.value.43.candidate" : 0,
    "rollback-2.value.43.control" : 0.04938271641731262,
    "rollback-2.value.47.candidate" : 0,
    "rollback-2.value.47.control" : 0.4176829159259796,
    "rollback-2.value.7.candidate" : 0,
    "rollback-2.value.7.control" : 0.025449100881814957,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0,
    "rollback-3.conv.10.control" : 0.017378048971295357,
    "rollback-3.conv.12.candidate" : 0,
    "rollback-3.conv.12.control" : 0.02226027473807335,
    "rollback-3.conv.13.candidate" : 0,
    "rollback-3.conv.13.control" : 0.027624309062957764,
    "rollback-3.conv.14.candidate" : 0,
    "rollback-3.conv.14.control" : 0.020408162847161293,
    "rollback-3.conv.16.candidate" : 0,
    "rollback-3.conv.16.control" : 0.02463054098188877,
    "rollback-3.conv.17.candidate" : 0,
    "rollback-3.conv.17.control" : 0.03362596780061722,
    "rollback-3.conv.18.candidate" : 0,
    "rollback-3.conv.18.control" : 0.029816513881087303,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0.013749999925494194,
    "rollback-3.conv.20.candidate" : 0,
    "rollback-3.conv.20.control" : 0.03974359109997749,
    "rollback-3.conv.21.candidate" : 0,
    "rollback-3.conv.21.control" : 0.030048076063394547,
    "rollback-3.conv.22.candidate" : 0,
    "rollback-3.conv.22.control" : 0.019784172996878624,
    "rollback-3.conv.24.candidate" : 0,
    "rollback-3.conv.24.control" : 0.04237288236618042,
    "rollback-3.conv.25.candidate" : 0,
    "rollback-3.conv.25.control" : 0.04087677597999573,
    "rollback-3.conv.26.candidate" : 0,
    "rollback-3.conv.26.control" : 0.05048076808452606,
    "rollback-3.conv.28.candidate" : 0,
    "rollback-3.conv.28.control" : 0.0409226194024086,
    "rollback-3.conv.29.candidate" : 0,
    "rollback-3.conv.29.control" : 0.08232821524143219,
    "rollback-3.conv.30.candidate" : 0,
    "rollback-3.conv.30.control" : 0.0670103058218956,
    "rollback-3.conv.32.candidate" : 0,
    "rollback-3.conv.32.control" : 0.08075220882892609,
    "rollback-3.conv.33.candidate" : 0,
    "rollback-3.conv.33.control" : 0.09090909361839294,
    "rollback-3.conv.34.candidate" : 0,
    "rollback-3.conv.34.control" : 0.08264462649822235,
    "rollback-3.conv.36.candidate" : 0,
    "rollback-3.conv.36.control" : 0.10879629850387573,
    "rollback-3.conv.37.candidate" : 0,
    "rollback-3.conv.37.control" : 0.050271738320589066,
    "rollback-3.conv.38.candidate" : 0,
    "rollback-3.conv.38.control" : 0.07783018797636032,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0.009098101407289505,
    "rollback-3.conv.40.candidate" : 0,
    "rollback-3.conv.40.control" : 0.09489051252603531,
    "rollback-3.conv.41.candidate" : 0,
    "rollback-3.conv.41.control" : 0.12804877758026123,
    "rollback-3.conv.42.candidate" : 0,
    "rollback-3.conv.42.control" : 0.0606398805975914,
    "rollback-3.conv.44.candidate" : 0,
    "rollback-3.conv.44.control" : 0.087425597012043,
    "rollback-3.conv.45.candidate" : 0,
    "rollback-3.conv.45.control" : 0.053136080503463745,
    "rollback-3.conv.46.candidate" : 0,
    "rollback-3.conv.46.control" : 0.05025773122906685,
    "rollback-3.conv.5.candidate" : 0,
    "rollback-3.conv.5.control" : 0.04038461670279503,
    "rollback-3.conv.6.candidate" : 0,
    "rollback-3.conv.6.control" : 0.014492753893136978,
    "rollback-3.conv.8.candidate" : 0,
    "rollback-3.conv.8.control" : 0.014285714365541935,
    "rollback-3.conv.9.candidate" : 0,
    "rollback-3.conv.9.control" : 0.018156424164772034,
    "rollback-3.index.11.candidate" : 0,
    "rollback-3.index.11.control" : 0.036651235073804855,
    "rollback-3.index.15.candidate" : 0,
    "rollback-3.index.15.control" : 0.04915730282664299,
    "rollback-3.index.19.candidate" : 0,
    "rollback-3.index.19.control" : 0.04823059216141701,
    "rollback-3.index.23.candidate" : 0,
    "rollback-3.index.23.control" : 0.0357142873108387,
    "rollback-3.index.27.candidate" : 0,
    "rollback-3.index.27.control" : 0.05213490128517151,
    "rollback-3.index.3.candidate" : 0,
    "rollback-3.index.3.control" : 0.04844674468040466,
    "rollback-3.index.31.candidate" : 0,
    "rollback-3.index.31.control" : 0.16495901346206665,
    "rollback-3.index.35.candidate" : 0,
    "rollback-3.index.35.control" : 0.16928808391094208,
    "rollback-3.index.39.candidate" : 0,
    "rollback-3.index.39.control" : 0.06685126572847366,
    "rollback-3.index.43.candidate" : 0,
    "rollback-3.index.43.control" : 0.08535156399011612,
    "rollback-3.index.47.candidate" : 0,
    "rollback-3.index.47.control" : 0.17000000178813934,
    "rollback-3.index.7.candidate" : 0,
    "rollback-3.index.7.control" : 0.03216911852359772,
    "rollback-3.key.11.candidate" : 0,
    "rollback-3.key.11.control" : 0.09747596085071564,
    "rollback-3.key.15.candidate" : 0,
    "rollback-3.key.15.control" : 0.08759123831987381,
    "rollback-3.key.19.candidate" : 0,
    "rollback-3.key.19.control" : 0.13042840361595154,
    "rollback-3.key.23.candidate" : 0,
    "rollback-3.key.23.control" : 0.10780201107263565,
    "rollback-3.key.27.candidate" : 0,
    "rollback-3.key.27.control" : 0.13856907188892365,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0.10025380551815033,
    "rollback-3.key.31.candidate" : 0,
    "rollback-3.key.31.control" : 0.2088926136493683,
    "rollback-3.key.35.candidate" : 0,
    "rollback-3.key.35.control" : 0.2263779491186142,
    "rollback-3.key.39.candidate" : 0,
    "rollback-3.key.39.control" : 0.16093750298023224,
    "rollback-3.key.43.candidate" : 0,
    "rollback-3.key.43.control" : 0.1301020383834839,
    "rollback-3.key.47.candidate" : 0,
    "rollback-3.key.47.control" : 0.1561214029788971,
    "rollback-3.key.7.candidate" : 0,
    "rollback-3.key.7.control" : 0.09459459781646729,
    "rollback-3.logits.candidate" : 0,
    "rollback-3.logits.control" : 0.07261208444833755,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 0.0015982597833499312,
    "rollback-3.ssm.10.candidate" : 0,
    "rollback-3.ssm.10.control" : 0.029586680233478546,
    "rollback-3.ssm.12.candidate" : 0,
    "rollback-3.ssm.12.control" : 0.004854151513427496,
    "rollback-3.ssm.13.candidate" : 0,
    "rollback-3.ssm.13.control" : 0.025944620370864868,
    "rollback-3.ssm.14.candidate" : 0,
    "rollback-3.ssm.14.control" : 0.013452346436679363,
    "rollback-3.ssm.16.candidate" : 0,
    "rollback-3.ssm.16.control" : 0.02035994827747345,
    "rollback-3.ssm.17.candidate" : 0,
    "rollback-3.ssm.17.control" : 0.0572931133210659,
    "rollback-3.ssm.18.candidate" : 0,
    "rollback-3.ssm.18.control" : 0.088945671916008,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0.013729231432080269,
    "rollback-3.ssm.20.candidate" : 0,
    "rollback-3.ssm.20.control" : 0.020713424310088158,
    "rollback-3.ssm.21.candidate" : 0,
    "rollback-3.ssm.21.control" : 0.016859257593750954,
    "rollback-3.ssm.22.candidate" : 0,
    "rollback-3.ssm.22.control" : 0.008213380351662636,
    "rollback-3.ssm.24.candidate" : 0,
    "rollback-3.ssm.24.control" : 0.023476973176002502,
    "rollback-3.ssm.25.candidate" : 0,
    "rollback-3.ssm.25.control" : 0.07173406332731247,
    "rollback-3.ssm.26.candidate" : 0,
    "rollback-3.ssm.26.control" : 0.08144234865903854,
    "rollback-3.ssm.28.candidate" : 0,
    "rollback-3.ssm.28.control" : 0.004658431280404329,
    "rollback-3.ssm.29.candidate" : 0,
    "rollback-3.ssm.29.control" : 0.06612418591976166,
    "rollback-3.ssm.30.candidate" : 0,
    "rollback-3.ssm.30.control" : 0.03367914259433746,
    "rollback-3.ssm.32.candidate" : 0,
    "rollback-3.ssm.32.control" : 0.04926076531410217,
    "rollback-3.ssm.33.candidate" : 0,
    "rollback-3.ssm.33.control" : 0.08814965933561325,
    "rollback-3.ssm.34.candidate" : 0,
    "rollback-3.ssm.34.control" : 0.18050742149353027,
    "rollback-3.ssm.36.candidate" : 0,
    "rollback-3.ssm.36.control" : 0.1104763001203537,
    "rollback-3.ssm.37.candidate" : 0,
    "rollback-3.ssm.37.control" : 0.03146883472800255,
    "rollback-3.ssm.38.candidate" : 0,
    "rollback-3.ssm.38.control" : 0.01716495305299759,
    "rollback-3.ssm.4.candidate" : 0,
    "rollback-3.ssm.4.control" : 0.026491770520806313,
    "rollback-3.ssm.40.candidate" : 0,
    "rollback-3.ssm.40.control" : 0.02534874901175499,
    "rollback-3.ssm.41.candidate" : 0,
    "rollback-3.ssm.41.control" : 0.04132749140262604,
    "rollback-3.ssm.42.candidate" : 0,
    "rollback-3.ssm.42.control" : 0.06392312794923782,
    "rollback-3.ssm.44.candidate" : 0,
    "rollback-3.ssm.44.control" : 0.051649391651153564,
    "rollback-3.ssm.45.candidate" : 0,
    "rollback-3.ssm.45.control" : 0.12049714475870132,
    "rollback-3.ssm.46.candidate" : 0,
    "rollback-3.ssm.46.control" : 0.1374494433403015,
    "rollback-3.ssm.5.candidate" : 0,
    "rollback-3.ssm.5.control" : 0.05189232900738716,
    "rollback-3.ssm.6.candidate" : 0,
    "rollback-3.ssm.6.control" : 0.013764054514467716,
    "rollback-3.ssm.8.candidate" : 0,
    "rollback-3.ssm.8.control" : 0.010599642992019653,
    "rollback-3.ssm.9.candidate" : 0,
    "rollback-3.ssm.9.control" : 0.029473112896084785,
    "rollback-3.value.11.candidate" : 0,
    "rollback-3.value.11.control" : 0.037938401103019714,
    "rollback-3.value.15.candidate" : 0,
    "rollback-3.value.15.control" : 0.026954680681228638,
    "rollback-3.value.19.candidate" : 0,
    "rollback-3.value.19.control" : 0.022448979318141937,
    "rollback-3.value.23.candidate" : 0,
    "rollback-3.value.23.control" : 0.04898255690932274,
    "rollback-3.value.27.candidate" : 0,
    "rollback-3.value.27.control" : 0.014095279388129711,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0.0514964796602726,
    "rollback-3.value.31.candidate" : 0,
    "rollback-3.value.31.control" : 0.07581521570682526,
    "rollback-3.value.35.candidate" : 0,
    "rollback-3.value.35.control" : 0.10303442180156708,
    "rollback-3.value.39.candidate" : 0,
    "rollback-3.value.39.control" : 0.05788690596818924,
    "rollback-3.value.43.candidate" : 0,
    "rollback-3.value.43.control" : 0.04938271641731262,
    "rollback-3.value.47.candidate" : 0,
    "rollback-3.value.47.control" : 0.4176829159259796,
    "rollback-3.value.7.candidate" : 0,
    "rollback-3.value.7.control" : 0.025449100881814957,
    "routing.candidate" : 0,
    "routing.control" : 0.03099944320712695,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-128-swept-router-padded-attention-aligned-projections-aligned\/tokens=449\/prefix=0",
  "passed" : true
}

````

## context-small-projections-shorttail-128-15/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## context-small-projections-sparse-prefix-64-15/stdout.txt

SHA-256 `86ee4a329346a92252fea4be58a1cb7477fd90af3153b1ea9e1871730f7fa548`; 229540 bytes.

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
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
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
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
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
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
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
      "name" : "continued-907: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
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
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
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
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
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
      "name" : "continued-907: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
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
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.0",
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
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
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
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
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
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
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
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
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
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
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
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
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
      "name" : "continued-2103: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
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
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.0",
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
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
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
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
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
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
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
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
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
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
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
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
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
      "name" : "rollback-2: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
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
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.0",
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
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
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
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
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
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
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
    "arm0.allocated_bytes" : 84934656,
    "arm0.chunk" : 256,
    "arm0.padded_query_rows" : 0,
    "arm0.read_records" : 16032,
    "arm0.seconds" : 5.099584959,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 84934656,
    "arm1.chunk" : 512,
    "arm1.padded_query_rows" : 0,
    "arm1.read_records" : 9803,
    "arm1.seconds" : 3.047578625,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 84934656,
    "arm2.chunk" : 64,
    "arm2.padded_query_rows" : 0,
    "arm2.read_records" : 35837,
    "arm2.seconds" : 11.07008525,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 84934656,
    "arm3.chunk" : 64,
    "arm3.padded_query_rows" : 0,
    "arm3.read_records" : 35823,
    "arm3.seconds" : 11.156434791,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0,
    "continued-1337.conv.10.control" : 0.029789719730615616,
    "continued-1337.conv.12.candidate" : 0,
    "continued-1337.conv.12.control" : 0.024886878207325935,
    "continued-1337.conv.13.candidate" : 0,
    "continued-1337.conv.13.control" : 0.02947443164885044,
    "continued-1337.conv.14.candidate" : 0,
    "continued-1337.conv.14.control" : 0.02213541604578495,
    "continued-1337.conv.16.candidate" : 0,
    "continued-1337.conv.16.control" : 0.03737745061516762,
    "continued-1337.conv.17.candidate" : 0,
    "continued-1337.conv.17.control" : 0.06345177441835403,
    "continued-1337.conv.18.candidate" : 0,
    "continued-1337.conv.18.control" : 0.03619909659028053,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0.009615384973585606,
    "continued-1337.conv.20.candidate" : 0,
    "continued-1337.conv.20.control" : 0.03021327033638954,
    "continued-1337.conv.21.candidate" : 0,
    "continued-1337.conv.21.control" : 0.03286384791135788,
    "continued-1337.conv.22.candidate" : 0,
    "continued-1337.conv.22.control" : 0.02213541604578495,
    "continued-1337.conv.24.candidate" : 0,
    "continued-1337.conv.24.control" : 0.03551912680268288,
    "continued-1337.conv.25.candidate" : 0,
    "continued-1337.conv.25.control" : 0.04055771604180336,
    "continued-1337.conv.26.candidate" : 0,
    "continued-1337.conv.26.control" : 0.044798705726861954,
    "continued-1337.conv.28.candidate" : 0,
    "continued-1337.conv.28.control" : 0.03244274854660034,
    "continued-1337.conv.29.candidate" : 0,
    "continued-1337.conv.29.control" : 0.0625,
    "continued-1337.conv.30.candidate" : 0,
    "continued-1337.conv.30.control" : 0.048076923936605453,
    "continued-1337.conv.32.candidate" : 0,
    "continued-1337.conv.32.control" : 0.06777777522802353,
    "continued-1337.conv.33.candidate" : 0,
    "continued-1337.conv.33.control" : 0.05673076957464218,
    "continued-1337.conv.34.candidate" : 0,
    "continued-1337.conv.34.control" : 0.06244055554270744,
    "continued-1337.conv.36.candidate" : 0,
    "continued-1337.conv.36.control" : 0.05406976863741875,
    "continued-1337.conv.37.candidate" : 0,
    "continued-1337.conv.37.control" : 0.061296653002500534,
    "continued-1337.conv.38.candidate" : 0,
    "continued-1337.conv.38.control" : 0.030279502272605896,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0.008196720853447914,
    "continued-1337.conv.40.candidate" : 0,
    "continued-1337.conv.40.control" : 0.06687062978744507,
    "continued-1337.conv.41.candidate" : 0,
    "continued-1337.conv.41.control" : 0.044921875,
    "continued-1337.conv.42.candidate" : 0,
    "continued-1337.conv.42.control" : 0.047512754797935486,
    "continued-1337.conv.44.candidate" : 0,
    "continued-1337.conv.44.control" : 0.0903954803943634,
    "continued-1337.conv.45.candidate" : 0,
    "continued-1337.conv.45.control" : 0.0607638880610466,
    "continued-1337.conv.46.candidate" : 0,
    "continued-1337.conv.46.control" : 0.04368279501795769,
    "continued-1337.conv.5.candidate" : 0,
    "continued-1337.conv.5.control" : 0.01995798386633396,
    "continued-1337.conv.6.candidate" : 0,
    "continued-1337.conv.6.control" : 0.02500000037252903,
    "continued-1337.conv.8.candidate" : 0,
    "continued-1337.conv.8.control" : 0.021531101316213608,
    "continued-1337.conv.9.candidate" : 0,
    "continued-1337.conv.9.control" : 0.018269231542944908,
    "continued-1337.index.11.candidate" : 0,
    "continued-1337.index.11.control" : 0.037133488804101944,
    "continued-1337.index.15.candidate" : 0,
    "continued-1337.index.15.control" : 0.04318820312619209,
    "continued-1337.index.19.candidate" : 0,
    "continued-1337.index.19.control" : 0.04394977167248726,
    "continued-1337.index.23.candidate" : 0,
    "continued-1337.index.23.control" : 0.03504464402794838,
    "continued-1337.index.27.candidate" : 0,
    "continued-1337.index.27.control" : 0.033478688448667526,
    "continued-1337.index.3.candidate" : 0,
    "continued-1337.index.3.control" : 0.018491124734282494,
    "continued-1337.index.31.candidate" : 0,
    "continued-1337.index.31.control" : 0.15060241520404816,
    "continued-1337.index.35.candidate" : 0,
    "continued-1337.index.35.control" : 0.11589404195547104,
    "continued-1337.index.39.candidate" : 0,
    "continued-1337.index.39.control" : 0.04113924130797386,
    "continued-1337.index.43.candidate" : 0,
    "continued-1337.index.43.control" : 0.04204101487994194,
    "continued-1337.index.47.candidate" : 0,
    "continued-1337.index.47.control" : 0.08500000089406967,
    "continued-1337.index.7.candidate" : 0,
    "continued-1337.index.7.control" : 0.022518381476402283,
    "continued-1337.key.11.candidate" : 0,
    "continued-1337.key.11.control" : 0.07007211446762085,
    "continued-1337.key.15.candidate" : 0,
    "continued-1337.key.15.control" : 0.07892335951328278,
    "continued-1337.key.19.candidate" : 0,
    "continued-1337.key.19.control" : 0.10470085591077805,
    "continued-1337.key.23.candidate" : 0,
    "continued-1337.key.23.control" : 0.07895833253860474,
    "continued-1337.key.27.candidate" : 0,
    "continued-1337.key.27.control" : 0.11711040139198303,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0.0241116750985384,
    "continued-1337.key.31.candidate" : 0,
    "continued-1337.key.31.control" : 0.1626468151807785,
    "continued-1337.key.35.candidate" : 0,
    "continued-1337.key.35.control" : 0.1450381726026535,
    "continued-1337.key.39.candidate" : 0,
    "continued-1337.key.39.control" : 0.09121093899011612,
    "continued-1337.key.43.candidate" : 0,
    "continued-1337.key.43.control" : 0.08588435500860214,
    "continued-1337.key.47.candidate" : 0,
    "continued-1337.key.47.control" : 0.1213991791009903,
    "continued-1337.key.7.candidate" : 0,
    "continued-1337.key.7.control" : 0.05255681648850441,
    "continued-1337.logits.candidate" : 0,
    "continued-1337.logits.control" : 0.07653061300516129,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 4.397510110720759e-06,
    "continued-1337.ssm.10.candidate" : 0,
    "continued-1337.ssm.10.control" : 0.07900995761156082,
    "continued-1337.ssm.12.candidate" : 0,
    "continued-1337.ssm.12.control" : 0.0029877584893256426,
    "continued-1337.ssm.13.candidate" : 0,
    "continued-1337.ssm.13.control" : 0.02690439485013485,
    "continued-1337.ssm.14.candidate" : 0,
    "continued-1337.ssm.14.control" : 0.009916176088154316,
    "continued-1337.ssm.16.candidate" : 0,
    "continued-1337.ssm.16.control" : 0.04610536992549896,
    "continued-1337.ssm.17.candidate" : 0,
    "continued-1337.ssm.17.control" : 0.034973688423633575,
    "continued-1337.ssm.18.candidate" : 0,
    "continued-1337.ssm.18.control" : 0.04583916813135147,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0.002779561560600996,
    "continued-1337.ssm.20.candidate" : 0,
    "continued-1337.ssm.20.control" : 0.04923080652952194,
    "continued-1337.ssm.21.candidate" : 0,
    "continued-1337.ssm.21.control" : 0.0294975396245718,
    "continued-1337.ssm.22.candidate" : 0,
    "continued-1337.ssm.22.control" : 0.003985300660133362,
    "continued-1337.ssm.24.candidate" : 0,
    "continued-1337.ssm.24.control" : 0.03136852756142616,
    "continued-1337.ssm.25.candidate" : 0,
    "continued-1337.ssm.25.control" : 0.07450016587972641,
    "continued-1337.ssm.26.candidate" : 0,
    "continued-1337.ssm.26.control" : 0.1739630103111267,
    "continued-1337.ssm.28.candidate" : 0,
    "continued-1337.ssm.28.control" : 0.00629217317327857,
    "continued-1337.ssm.29.candidate" : 0,
    "continued-1337.ssm.29.control" : 0.07583524286746979,
    "continued-1337.ssm.30.candidate" : 0,
    "continued-1337.ssm.30.control" : 0.039386849850416183,
    "continued-1337.ssm.32.candidate" : 0,
    "continued-1337.ssm.32.control" : 0.10884042084217072,
    "continued-1337.ssm.33.candidate" : 0,
    "continued-1337.ssm.33.control" : 0.05853148177266121,
    "continued-1337.ssm.34.candidate" : 0,
    "continued-1337.ssm.34.control" : 0.09363560378551483,
    "continued-1337.ssm.36.candidate" : 0,
    "continued-1337.ssm.36.control" : 0.03387089818716049,
    "continued-1337.ssm.37.candidate" : 0,
    "continued-1337.ssm.37.control" : 0.029361402615904808,
    "continued-1337.ssm.38.candidate" : 0,
    "continued-1337.ssm.38.control" : 0.023686816915869713,
    "continued-1337.ssm.4.candidate" : 0,
    "continued-1337.ssm.4.control" : 0.004598719999194145,
    "continued-1337.ssm.40.candidate" : 0,
    "continued-1337.ssm.40.control" : 0.015822729095816612,
    "continued-1337.ssm.41.candidate" : 0,
    "continued-1337.ssm.41.control" : 0.010389303788542747,
    "continued-1337.ssm.42.candidate" : 0,
    "continued-1337.ssm.42.control" : 0.04106543958187103,
    "continued-1337.ssm.44.candidate" : 0,
    "continued-1337.ssm.44.control" : 0.014979381114244461,
    "continued-1337.ssm.45.candidate" : 0,
    "continued-1337.ssm.45.control" : 0.11983004212379456,
    "continued-1337.ssm.46.candidate" : 0,
    "continued-1337.ssm.46.control" : 0.11884036660194397,
    "continued-1337.ssm.5.candidate" : 0,
    "continued-1337.ssm.5.control" : 0.04356319084763527,
    "continued-1337.ssm.6.candidate" : 0,
    "continued-1337.ssm.6.control" : 0.019279733300209045,
    "continued-1337.ssm.8.candidate" : 0,
    "continued-1337.ssm.8.control" : 0.019201843068003654,
    "continued-1337.ssm.9.candidate" : 0,
    "continued-1337.ssm.9.control" : 0.03141006454825401,
    "continued-1337.value.11.candidate" : 0,
    "continued-1337.value.11.control" : 0.017535971477627754,
    "continued-1337.value.15.candidate" : 0,
    "continued-1337.value.15.control" : 0.0219123512506485,
    "continued-1337.value.19.candidate" : 0,
    "continued-1337.value.19.control" : 0.019897958263754845,
    "continued-1337.value.23.candidate" : 0,
    "continued-1337.value.23.control" : 0.04127907007932663,
    "continued-1337.value.27.candidate" : 0,
    "continued-1337.value.27.control" : 0.012838724069297314,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0.013548950664699078,
    "continued-1337.value.31.candidate" : 0,
    "continued-1337.value.31.control" : 0.054891303181648254,
    "continued-1337.value.35.candidate" : 0,
    "continued-1337.value.35.control" : 0.07065217196941376,
    "continued-1337.value.39.candidate" : 0,
    "continued-1337.value.39.control" : 0.04196428507566452,
    "continued-1337.value.43.candidate" : 0,
    "continued-1337.value.43.control" : 0.043478261679410934,
    "continued-1337.value.47.candidate" : 0,
    "continued-1337.value.47.control" : 0.20663875341415405,
    "continued-1337.value.7.candidate" : 0,
    "continued-1337.value.7.control" : 0.015344311483204365,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0,
    "continued-2103.conv.10.control" : 0.02992957830429077,
    "continued-2103.conv.12.candidate" : 0,
    "continued-2103.conv.12.control" : 0.024444444105029106,
    "continued-2103.conv.13.candidate" : 0,
    "continued-2103.conv.13.control" : 0.031593408435583115,
    "continued-2103.conv.14.candidate" : 0,
    "continued-2103.conv.14.control" : 0.02213541604578495,
    "continued-2103.conv.16.candidate" : 0,
    "continued-2103.conv.16.control" : 0.03737745061516762,
    "continued-2103.conv.17.candidate" : 0,
    "continued-2103.conv.17.control" : 0.06345177441835403,
    "continued-2103.conv.18.candidate" : 0,
    "continued-2103.conv.18.control" : 0.03619909659028053,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0.004566209856420755,
    "continued-2103.conv.20.candidate" : 0,
    "continued-2103.conv.20.control" : 0.03079710155725479,
    "continued-2103.conv.21.candidate" : 0,
    "continued-2103.conv.21.control" : 0.03286384791135788,
    "continued-2103.conv.22.candidate" : 0,
    "continued-2103.conv.22.control" : 0.0216644499450922,
    "continued-2103.conv.24.candidate" : 0,
    "continued-2103.conv.24.control" : 0.03551912680268288,
    "continued-2103.conv.25.candidate" : 0,
    "continued-2103.conv.25.control" : 0.04055771604180336,
    "continued-2103.conv.26.candidate" : 0,
    "continued-2103.conv.26.control" : 0.04400580748915672,
    "continued-2103.conv.28.candidate" : 0,
    "continued-2103.conv.28.control" : 0.03578244149684906,
    "continued-2103.conv.29.candidate" : 0,
    "continued-2103.conv.29.control" : 0.05422794073820114,
    "continued-2103.conv.30.candidate" : 0,
    "continued-2103.conv.30.control" : 0.07692307978868484,
    "continued-2103.conv.32.candidate" : 0,
    "continued-2103.conv.32.control" : 0.06777777522802353,
    "continued-2103.conv.33.candidate" : 0,
    "continued-2103.conv.33.control" : 0.05961538478732109,
    "continued-2103.conv.34.candidate" : 0,
    "continued-2103.conv.34.control" : 0.06244055554270744,
    "continued-2103.conv.36.candidate" : 0,
    "continued-2103.conv.36.control" : 0.06416869163513184,
    "continued-2103.conv.37.candidate" : 0,
    "continued-2103.conv.37.control" : 0.061296653002500534,
    "continued-2103.conv.38.candidate" : 0,
    "continued-2103.conv.38.control" : 0.03105590119957924,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0.008368200622498989,
    "continued-2103.conv.40.candidate" : 0,
    "continued-2103.conv.40.control" : 0.06687062978744507,
    "continued-2103.conv.41.candidate" : 0,
    "continued-2103.conv.41.control" : 0.044921875,
    "continued-2103.conv.42.candidate" : 0,
    "continued-2103.conv.42.control" : 0.047512754797935486,
    "continued-2103.conv.44.candidate" : 0,
    "continued-2103.conv.44.control" : 0.0903954803943634,
    "continued-2103.conv.45.candidate" : 0,
    "continued-2103.conv.45.control" : 0.06118880957365036,
    "continued-2103.conv.46.candidate" : 0,
    "continued-2103.conv.46.control" : 0.0617559514939785,
    "continued-2103.conv.5.candidate" : 0,
    "continued-2103.conv.5.control" : 0.01995798386633396,
    "continued-2103.conv.6.candidate" : 0,
    "continued-2103.conv.6.control" : 0.02500000037252903,
    "continued-2103.conv.8.candidate" : 0,
    "continued-2103.conv.8.control" : 0.021531101316213608,
    "continued-2103.conv.9.candidate" : 0,
    "continued-2103.conv.9.control" : 0.01875000074505806,
    "continued-2103.index.11.candidate" : 0,
    "continued-2103.index.11.control" : 0.037133488804101944,
    "continued-2103.index.15.candidate" : 0,
    "continued-2103.index.15.control" : 0.04318820312619209,
    "continued-2103.index.19.candidate" : 0,
    "continued-2103.index.19.control" : 0.04394977167248726,
    "continued-2103.index.23.candidate" : 0,
    "continued-2103.index.23.control" : 0.03504464402794838,
    "continued-2103.index.27.candidate" : 0,
    "continued-2103.index.27.control" : 0.033478688448667526,
    "continued-2103.index.3.candidate" : 0,
    "continued-2103.index.3.control" : 0.018491124734282494,
    "continued-2103.index.31.candidate" : 0,
    "continued-2103.index.31.control" : 0.15060241520404816,
    "continued-2103.index.35.candidate" : 0,
    "continued-2103.index.35.control" : 0.11589404195547104,
    "continued-2103.index.39.candidate" : 0,
    "continued-2103.index.39.control" : 0.04113924130797386,
    "continued-2103.index.43.candidate" : 0,
    "continued-2103.index.43.control" : 0.04204101487994194,
    "continued-2103.index.47.candidate" : 0,
    "continued-2103.index.47.control" : 0.08500000089406967,
    "continued-2103.index.7.candidate" : 0,
    "continued-2103.index.7.control" : 0.022518381476402283,
    "continued-2103.key.11.candidate" : 0,
    "continued-2103.key.11.control" : 0.07007211446762085,
    "continued-2103.key.15.candidate" : 0,
    "continued-2103.key.15.control" : 0.07892335951328278,
    "continued-2103.key.19.candidate" : 0,
    "continued-2103.key.19.control" : 0.10470085591077805,
    "continued-2103.key.23.candidate" : 0,
    "continued-2103.key.23.control" : 0.07895833253860474,
    "continued-2103.key.27.candidate" : 0,
    "continued-2103.key.27.control" : 0.11711040139198303,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0.0241116750985384,
    "continued-2103.key.31.candidate" : 0,
    "continued-2103.key.31.control" : 0.1626468151807785,
    "continued-2103.key.35.candidate" : 0,
    "continued-2103.key.35.control" : 0.1450381726026535,
    "continued-2103.key.39.candidate" : 0,
    "continued-2103.key.39.control" : 0.09121093899011612,
    "continued-2103.key.43.candidate" : 0,
    "continued-2103.key.43.control" : 0.08588435500860214,
    "continued-2103.key.47.candidate" : 0,
    "continued-2103.key.47.control" : 0.1213991791009903,
    "continued-2103.key.7.candidate" : 0,
    "continued-2103.key.7.control" : 0.05255681648850441,
    "continued-2103.logits.candidate" : 0,
    "continued-2103.logits.control" : 0.07662338018417358,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 4.417280251800548e-06,
    "continued-2103.ssm.10.candidate" : 0,
    "continued-2103.ssm.10.control" : 0.033353764563798904,
    "continued-2103.ssm.12.candidate" : 0,
    "continued-2103.ssm.12.control" : 0.003347413381561637,
    "continued-2103.ssm.13.candidate" : 0,
    "continued-2103.ssm.13.control" : 0.02338651567697525,
    "continued-2103.ssm.14.candidate" : 0,
    "continued-2103.ssm.14.control" : 0.007826757617294788,
    "continued-2103.ssm.16.candidate" : 0,
    "continued-2103.ssm.16.control" : 0.019286785274744034,
    "continued-2103.ssm.17.candidate" : 0,
    "continued-2103.ssm.17.control" : 0.03164352476596832,
    "continued-2103.ssm.18.candidate" : 0,
    "continued-2103.ssm.18.control" : 0.04216703400015831,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0.0023648554924875498,
    "continued-2103.ssm.20.candidate" : 0,
    "continued-2103.ssm.20.control" : 0.016534719616174698,
    "continued-2103.ssm.21.candidate" : 0,
    "continued-2103.ssm.21.control" : 0.027739794924855232,
    "continued-2103.ssm.22.candidate" : 0,
    "continued-2103.ssm.22.control" : 0.004054700490087271,
    "continued-2103.ssm.24.candidate" : 0,
    "continued-2103.ssm.24.control" : 0.019607193768024445,
    "continued-2103.ssm.25.candidate" : 0,
    "continued-2103.ssm.25.control" : 0.05301045998930931,
    "continued-2103.ssm.26.candidate" : 0,
    "continued-2103.ssm.26.control" : 0.0408402718603611,
    "continued-2103.ssm.28.candidate" : 0,
    "continued-2103.ssm.28.control" : 0.0044181630946695805,
    "continued-2103.ssm.29.candidate" : 0,
    "continued-2103.ssm.29.control" : 0.0804378092288971,
    "continued-2103.ssm.30.candidate" : 0,
    "continued-2103.ssm.30.control" : 0.03291277959942818,
    "continued-2103.ssm.32.candidate" : 0,
    "continued-2103.ssm.32.control" : 0.056803617626428604,
    "continued-2103.ssm.33.candidate" : 0,
    "continued-2103.ssm.33.control" : 0.08929989486932755,
    "continued-2103.ssm.34.candidate" : 0,
    "continued-2103.ssm.34.control" : 0.09182621538639069,
    "continued-2103.ssm.36.candidate" : 0,
    "continued-2103.ssm.36.control" : 0.06473997235298157,
    "continued-2103.ssm.37.candidate" : 0,
    "continued-2103.ssm.37.control" : 0.044665075838565826,
    "continued-2103.ssm.38.candidate" : 0,
    "continued-2103.ssm.38.control" : 0.016059070825576782,
    "continued-2103.ssm.4.candidate" : 0,
    "continued-2103.ssm.4.control" : 0.0038736111018806696,
    "continued-2103.ssm.40.candidate" : 0,
    "continued-2103.ssm.40.control" : 0.015822991728782654,
    "continued-2103.ssm.41.candidate" : 0,
    "continued-2103.ssm.41.control" : 0.010253435000777245,
    "continued-2103.ssm.42.candidate" : 0,
    "continued-2103.ssm.42.control" : 0.031438443809747696,
    "continued-2103.ssm.44.candidate" : 0,
    "continued-2103.ssm.44.control" : 0.014186267741024494,
    "continued-2103.ssm.45.candidate" : 0,
    "continued-2103.ssm.45.control" : 0.05187271907925606,
    "continued-2103.ssm.46.candidate" : 0,
    "continued-2103.ssm.46.control" : 0.05253820866346359,
    "continued-2103.ssm.5.candidate" : 0,
    "continued-2103.ssm.5.control" : 0.024905256927013397,
    "continued-2103.ssm.6.candidate" : 0,
    "continued-2103.ssm.6.control" : 0.01623982936143875,
    "continued-2103.ssm.8.candidate" : 0,
    "continued-2103.ssm.8.control" : 0.013248871080577374,
    "continued-2103.ssm.9.candidate" : 0,
    "continued-2103.ssm.9.control" : 0.04901403561234474,
    "continued-2103.value.11.candidate" : 0,
    "continued-2103.value.11.control" : 0.017535971477627754,
    "continued-2103.value.15.candidate" : 0,
    "continued-2103.value.15.control" : 0.0219123512506485,
    "continued-2103.value.19.candidate" : 0,
    "continued-2103.value.19.control" : 0.019897958263754845,
    "continued-2103.value.23.candidate" : 0,
    "continued-2103.value.23.control" : 0.04127907007932663,
    "continued-2103.value.27.candidate" : 0,
    "continued-2103.value.27.control" : 0.012838724069297314,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0.013548950664699078,
    "continued-2103.value.31.candidate" : 0,
    "continued-2103.value.31.control" : 0.054891303181648254,
    "continued-2103.value.35.candidate" : 0,
    "continued-2103.value.35.control" : 0.07065217196941376,
    "continued-2103.value.39.candidate" : 0,
    "continued-2103.value.39.control" : 0.04196428507566452,
    "continued-2103.value.43.candidate" : 0,
    "continued-2103.value.43.control" : 0.043478261679410934,
    "continued-2103.value.47.candidate" : 0,
    "continued-2103.value.47.control" : 0.20663875341415405,
    "continued-2103.value.7.candidate" : 0,
    "continued-2103.value.7.control" : 0.015344311483204365,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0,
    "continued-907.conv.10.control" : 0.029789719730615616,
    "continued-907.conv.12.candidate" : 0,
    "continued-907.conv.12.control" : 0.02391304261982441,
    "continued-907.conv.13.candidate" : 0,
    "continued-907.conv.13.control" : 0.02947443164885044,
    "continued-907.conv.14.candidate" : 0,
    "continued-907.conv.14.control" : 0.022972973063588142,
    "continued-907.conv.16.candidate" : 0,
    "continued-907.conv.16.control" : 0.03890306130051613,
    "continued-907.conv.17.candidate" : 0,
    "continued-907.conv.17.control" : 0.06345177441835403,
    "continued-907.conv.18.candidate" : 0,
    "continued-907.conv.18.control" : 0.03619909659028053,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0.010362694039940834,
    "continued-907.conv.20.candidate" : 0,
    "continued-907.conv.20.control" : 0.03021327033638954,
    "continued-907.conv.21.candidate" : 0,
    "continued-907.conv.21.control" : 0.03286384791135788,
    "continued-907.conv.22.candidate" : 0,
    "continued-907.conv.22.control" : 0.021511884406208992,
    "continued-907.conv.24.candidate" : 0,
    "continued-907.conv.24.control" : 0.03551912680268288,
    "continued-907.conv.25.candidate" : 0,
    "continued-907.conv.25.control" : 0.04055771604180336,
    "continued-907.conv.26.candidate" : 0,
    "continued-907.conv.26.control" : 0.044798705726861954,
    "continued-907.conv.28.candidate" : 0,
    "continued-907.conv.28.control" : 0.04216867312788963,
    "continued-907.conv.29.candidate" : 0,
    "continued-907.conv.29.control" : 0.07734806835651398,
    "continued-907.conv.30.candidate" : 0,
    "continued-907.conv.30.control" : 0.07172416150569916,
    "continued-907.conv.32.candidate" : 0,
    "continued-907.conv.32.control" : 0.09246575087308884,
    "continued-907.conv.33.candidate" : 0,
    "continued-907.conv.33.control" : 0.0634615421295166,
    "continued-907.conv.34.candidate" : 0,
    "continued-907.conv.34.control" : 0.08472222089767456,
    "continued-907.conv.36.candidate" : 0,
    "continued-907.conv.36.control" : 0.06627906858921051,
    "continued-907.conv.37.candidate" : 0,
    "continued-907.conv.37.control" : 0.07138625532388687,
    "continued-907.conv.38.candidate" : 0,
    "continued-907.conv.38.control" : 0.0394345223903656,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0.008196720853447914,
    "continued-907.conv.40.candidate" : 0,
    "continued-907.conv.40.control" : 0.06929347664117813,
    "continued-907.conv.41.candidate" : 0,
    "continued-907.conv.41.control" : 0.061567164957523346,
    "continued-907.conv.42.candidate" : 0,
    "continued-907.conv.42.control" : 0.051355697214603424,
    "continued-907.conv.44.candidate" : 0,
    "continued-907.conv.44.control" : 0.09876543283462524,
    "continued-907.conv.45.candidate" : 0,
    "continued-907.conv.45.control" : 0.0607638880610466,
    "continued-907.conv.46.candidate" : 0,
    "continued-907.conv.46.control" : 0.04368279501795769,
    "continued-907.conv.5.candidate" : 0,
    "continued-907.conv.5.control" : 0.026209676638245583,
    "continued-907.conv.6.candidate" : 0,
    "continued-907.conv.6.control" : 0.02500000037252903,
    "continued-907.conv.8.candidate" : 0,
    "continued-907.conv.8.control" : 0.021531101316213608,
    "continued-907.conv.9.candidate" : 0,
    "continued-907.conv.9.control" : 0.018269231542944908,
    "continued-907.index.11.candidate" : 0,
    "continued-907.index.11.control" : 0.037133488804101944,
    "continued-907.index.15.candidate" : 0,
    "continued-907.index.15.control" : 0.04318820312619209,
    "continued-907.index.19.candidate" : 0,
    "continued-907.index.19.control" : 0.04394977167248726,
    "continued-907.index.23.candidate" : 0,
    "continued-907.index.23.control" : 0.03504464402794838,
    "continued-907.index.27.candidate" : 0,
    "continued-907.index.27.control" : 0.033478688448667526,
    "continued-907.index.3.candidate" : 0,
    "continued-907.index.3.control" : 0.018491124734282494,
    "continued-907.index.31.candidate" : 0,
    "continued-907.index.31.control" : 0.15060241520404816,
    "continued-907.index.35.candidate" : 0,
    "continued-907.index.35.control" : 0.11589404195547104,
    "continued-907.index.39.candidate" : 0,
    "continued-907.index.39.control" : 0.04113924130797386,
    "continued-907.index.43.candidate" : 0,
    "continued-907.index.43.control" : 0.04204101487994194,
    "continued-907.index.47.candidate" : 0,
    "continued-907.index.47.control" : 0.08500000089406967,
    "continued-907.index.7.candidate" : 0,
    "continued-907.index.7.control" : 0.022518381476402283,
    "continued-907.key.11.candidate" : 0,
    "continued-907.key.11.control" : 0.07007211446762085,
    "continued-907.key.15.candidate" : 0,
    "continued-907.key.15.control" : 0.07892335951328278,
    "continued-907.key.19.candidate" : 0,
    "continued-907.key.19.control" : 0.10470085591077805,
    "continued-907.key.23.candidate" : 0,
    "continued-907.key.23.control" : 0.07895833253860474,
    "continued-907.key.27.candidate" : 0,
    "continued-907.key.27.control" : 0.11711040139198303,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0.0241116750985384,
    "continued-907.key.31.candidate" : 0,
    "continued-907.key.31.control" : 0.1626468151807785,
    "continued-907.key.35.candidate" : 0,
    "continued-907.key.35.control" : 0.1450381726026535,
    "continued-907.key.39.candidate" : 0,
    "continued-907.key.39.control" : 0.09121093899011612,
    "continued-907.key.43.candidate" : 0,
    "continued-907.key.43.control" : 0.08588435500860214,
    "continued-907.key.47.candidate" : 0,
    "continued-907.key.47.control" : 0.1213991791009903,
    "continued-907.key.7.candidate" : 0,
    "continued-907.key.7.control" : 0.05255681648850441,
    "continued-907.logits.candidate" : 0,
    "continued-907.logits.control" : 0.08747779577970505,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 4.455870111996774e-06,
    "continued-907.ssm.10.candidate" : 0,
    "continued-907.ssm.10.control" : 0.0307770948857069,
    "continued-907.ssm.12.candidate" : 0,
    "continued-907.ssm.12.control" : 0.0036982554011046886,
    "continued-907.ssm.13.candidate" : 0,
    "continued-907.ssm.13.control" : 0.02262263000011444,
    "continued-907.ssm.14.candidate" : 0,
    "continued-907.ssm.14.control" : 0.007654080167412758,
    "continued-907.ssm.16.candidate" : 0,
    "continued-907.ssm.16.control" : 0.024267904460430145,
    "continued-907.ssm.17.candidate" : 0,
    "continued-907.ssm.17.control" : 0.0490289032459259,
    "continued-907.ssm.18.candidate" : 0,
    "continued-907.ssm.18.control" : 0.050599321722984314,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0.002372168703004718,
    "continued-907.ssm.20.candidate" : 0,
    "continued-907.ssm.20.control" : 0.01695825718343258,
    "continued-907.ssm.21.candidate" : 0,
    "continued-907.ssm.21.control" : 0.01912170648574829,
    "continued-907.ssm.22.candidate" : 0,
    "continued-907.ssm.22.control" : 0.004077761899679899,
    "continued-907.ssm.24.candidate" : 0,
    "continued-907.ssm.24.control" : 0.031608279794454575,
    "continued-907.ssm.25.candidate" : 0,
    "continued-907.ssm.25.control" : 0.08109430223703384,
    "continued-907.ssm.26.candidate" : 0,
    "continued-907.ssm.26.control" : 0.08810781687498093,
    "continued-907.ssm.28.candidate" : 0,
    "continued-907.ssm.28.control" : 0.003861313220113516,
    "continued-907.ssm.29.candidate" : 0,
    "continued-907.ssm.29.control" : 0.07301811873912811,
    "continued-907.ssm.30.candidate" : 0,
    "continued-907.ssm.30.control" : 0.041991058737039566,
    "continued-907.ssm.32.candidate" : 0,
    "continued-907.ssm.32.control" : 0.055181100964546204,
    "continued-907.ssm.33.candidate" : 0,
    "continued-907.ssm.33.control" : 0.10662690550088882,
    "continued-907.ssm.34.candidate" : 0,
    "continued-907.ssm.34.control" : 0.09105804562568665,
    "continued-907.ssm.36.candidate" : 0,
    "continued-907.ssm.36.control" : 0.0348682627081871,
    "continued-907.ssm.37.candidate" : 0,
    "continued-907.ssm.37.control" : 0.03931138291954994,
    "continued-907.ssm.38.candidate" : 0,
    "continued-907.ssm.38.control" : 0.015864377841353416,
    "continued-907.ssm.4.candidate" : 0,
    "continued-907.ssm.4.control" : 0.004712333902716637,
    "continued-907.ssm.40.candidate" : 0,
    "continued-907.ssm.40.control" : 0.015666183084249496,
    "continued-907.ssm.41.candidate" : 0,
    "continued-907.ssm.41.control" : 0.010922777466475964,
    "continued-907.ssm.42.candidate" : 0,
    "continued-907.ssm.42.control" : 0.03438224270939827,
    "continued-907.ssm.44.candidate" : 0,
    "continued-907.ssm.44.control" : 0.01431201957166195,
    "continued-907.ssm.45.candidate" : 0,
    "continued-907.ssm.45.control" : 0.061963144689798355,
    "continued-907.ssm.46.candidate" : 0,
    "continued-907.ssm.46.control" : 0.07795266807079315,
    "continued-907.ssm.5.candidate" : 0,
    "continued-907.ssm.5.control" : 0.038865990936756134,
    "continued-907.ssm.6.candidate" : 0,
    "continued-907.ssm.6.control" : 0.04563584178686142,
    "continued-907.ssm.8.candidate" : 0,
    "continued-907.ssm.8.control" : 0.01144445687532425,
    "continued-907.ssm.9.candidate" : 0,
    "continued-907.ssm.9.control" : 0.02806168794631958,
    "continued-907.value.11.candidate" : 0,
    "continued-907.value.11.control" : 0.017535971477627754,
    "continued-907.value.15.candidate" : 0,
    "continued-907.value.15.control" : 0.0219123512506485,
    "continued-907.value.19.candidate" : 0,
    "continued-907.value.19.control" : 0.019897958263754845,
    "continued-907.value.23.candidate" : 0,
    "continued-907.value.23.control" : 0.04127907007932663,
    "continued-907.value.27.candidate" : 0,
    "continued-907.value.27.control" : 0.012838724069297314,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0.013548950664699078,
    "continued-907.value.31.candidate" : 0,
    "continued-907.value.31.control" : 0.054891303181648254,
    "continued-907.value.35.candidate" : 0,
    "continued-907.value.35.control" : 0.07065217196941376,
    "continued-907.value.39.candidate" : 0,
    "continued-907.value.39.control" : 0.04196428507566452,
    "continued-907.value.43.candidate" : 0,
    "continued-907.value.43.control" : 0.043478261679410934,
    "continued-907.value.47.candidate" : 0,
    "continued-907.value.47.control" : 0.20663875341415405,
    "continued-907.value.7.candidate" : 0,
    "continued-907.value.7.control" : 0.015344311483204365,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0,
    "prefill.conv.10.control" : 0.02102803811430931,
    "prefill.conv.12.candidate" : 0,
    "prefill.conv.12.control" : 0.01430027186870575,
    "prefill.conv.13.candidate" : 0,
    "prefill.conv.13.control" : 0.01909538358449936,
    "prefill.conv.14.candidate" : 0,
    "prefill.conv.14.control" : 0.02189265564084053,
    "prefill.conv.16.candidate" : 0,
    "prefill.conv.16.control" : 0.03226562589406967,
    "prefill.conv.17.candidate" : 0,
    "prefill.conv.17.control" : 0.03684210404753685,
    "prefill.conv.18.candidate" : 0,
    "prefill.conv.18.control" : 0.027149321511387825,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0.009523809887468815,
    "prefill.conv.20.candidate" : 0,
    "prefill.conv.20.control" : 0.035545025020837784,
    "prefill.conv.21.candidate" : 0,
    "prefill.conv.21.control" : 0.03333333507180214,
    "prefill.conv.22.candidate" : 0,
    "prefill.conv.22.control" : 0.019366197288036346,
    "prefill.conv.24.candidate" : 0,
    "prefill.conv.24.control" : 0.03750000149011612,
    "prefill.conv.25.candidate" : 0,
    "prefill.conv.25.control" : 0.03971962630748749,
    "prefill.conv.26.candidate" : 0,
    "prefill.conv.26.control" : 0.05715090036392212,
    "prefill.conv.28.candidate" : 0,
    "prefill.conv.28.control" : 0.05220883712172508,
    "prefill.conv.29.candidate" : 0,
    "prefill.conv.29.control" : 0.07734806835651398,
    "prefill.conv.30.candidate" : 0,
    "prefill.conv.30.control" : 0.07172416150569916,
    "prefill.conv.32.candidate" : 0,
    "prefill.conv.32.control" : 0.09246575087308884,
    "prefill.conv.33.candidate" : 0,
    "prefill.conv.33.control" : 0.0654296875,
    "prefill.conv.34.candidate" : 0,
    "prefill.conv.34.control" : 0.08472222089767456,
    "prefill.conv.36.candidate" : 0,
    "prefill.conv.36.control" : 0.08837209641933441,
    "prefill.conv.37.candidate" : 0,
    "prefill.conv.37.control" : 0.06784909963607788,
    "prefill.conv.38.candidate" : 0,
    "prefill.conv.38.control" : 0.0394345223903656,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0.03112192638218403,
    "prefill.conv.40.candidate" : 0,
    "prefill.conv.40.control" : 0.061141304671764374,
    "prefill.conv.41.candidate" : 0,
    "prefill.conv.41.control" : 0.061567164957523346,
    "prefill.conv.42.candidate" : 0,
    "prefill.conv.42.control" : 0.044964030385017395,
    "prefill.conv.44.candidate" : 0,
    "prefill.conv.44.control" : 0.04938271641731262,
    "prefill.conv.45.candidate" : 0,
    "prefill.conv.45.control" : 0.0486111119389534,
    "prefill.conv.46.candidate" : 0,
    "prefill.conv.46.control" : 0.04301075264811516,
    "prefill.conv.5.candidate" : 0,
    "prefill.conv.5.control" : 0.036002304404973984,
    "prefill.conv.6.candidate" : 0,
    "prefill.conv.6.control" : 0.021313363686203957,
    "prefill.conv.8.candidate" : 0,
    "prefill.conv.8.control" : 0.019704433158040047,
    "prefill.conv.9.candidate" : 0,
    "prefill.conv.9.control" : 0.03076923079788685,
    "prefill.index.11.candidate" : 0,
    "prefill.index.11.control" : 0.037133488804101944,
    "prefill.index.15.candidate" : 0,
    "prefill.index.15.control" : 0.04318820312619209,
    "prefill.index.19.candidate" : 0,
    "prefill.index.19.control" : 0.04394977167248726,
    "prefill.index.23.candidate" : 0,
    "prefill.index.23.control" : 0.03504464402794838,
    "prefill.index.27.candidate" : 0,
    "prefill.index.27.control" : 0.033478688448667526,
    "prefill.index.3.candidate" : 0,
    "prefill.index.3.control" : 0.018491124734282494,
    "prefill.index.31.candidate" : 0,
    "prefill.index.31.control" : 0.15060241520404816,
    "prefill.index.35.candidate" : 0,
    "prefill.index.35.control" : 0.11589404195547104,
    "prefill.index.39.candidate" : 0,
    "prefill.index.39.control" : 0.04113924130797386,
    "prefill.index.43.candidate" : 0,
    "prefill.index.43.control" : 0.04204101487994194,
    "prefill.index.47.candidate" : 0,
    "prefill.index.47.control" : 0.08500000089406967,
    "prefill.index.7.candidate" : 0,
    "prefill.index.7.control" : 0.022518381476402283,
    "prefill.key.11.candidate" : 0,
    "prefill.key.11.control" : 0.07007211446762085,
    "prefill.key.15.candidate" : 0,
    "prefill.key.15.control" : 0.07892335951328278,
    "prefill.key.19.candidate" : 0,
    "prefill.key.19.control" : 0.10470085591077805,
    "prefill.key.23.candidate" : 0,
    "prefill.key.23.control" : 0.07895833253860474,
    "prefill.key.27.candidate" : 0,
    "prefill.key.27.control" : 0.11711040139198303,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0.0241116750985384,
    "prefill.key.31.candidate" : 0,
    "prefill.key.31.control" : 0.1626468151807785,
    "prefill.key.35.candidate" : 0,
    "prefill.key.35.control" : 0.1450381726026535,
    "prefill.key.39.candidate" : 0,
    "prefill.key.39.control" : 0.09121093899011612,
    "prefill.key.43.candidate" : 0,
    "prefill.key.43.control" : 0.08588435500860214,
    "prefill.key.47.candidate" : 0,
    "prefill.key.47.control" : 0.1213991791009903,
    "prefill.key.7.candidate" : 0,
    "prefill.key.7.control" : 0.05255681648850441,
    "prefill.logits.candidate" : 0,
    "prefill.logits.control" : 0.14112408459186554,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 4.74084981760825e-06,
    "prefill.ssm.10.candidate" : 0,
    "prefill.ssm.10.control" : 0.03759448975324631,
    "prefill.ssm.12.candidate" : 0,
    "prefill.ssm.12.control" : 0.003857339033856988,
    "prefill.ssm.13.candidate" : 0,
    "prefill.ssm.13.control" : 0.01709580607712269,
    "prefill.ssm.14.candidate" : 0,
    "prefill.ssm.14.control" : 0.00830934103578329,
    "prefill.ssm.16.candidate" : 0,
    "prefill.ssm.16.control" : 0.0279969722032547,
    "prefill.ssm.17.candidate" : 0,
    "prefill.ssm.17.control" : 0.011432960629463196,
    "prefill.ssm.18.candidate" : 0,
    "prefill.ssm.18.control" : 0.02383866347372532,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0.001781997736543417,
    "prefill.ssm.20.candidate" : 0,
    "prefill.ssm.20.control" : 0.024013806134462357,
    "prefill.ssm.21.candidate" : 0,
    "prefill.ssm.21.control" : 0.019731270149350166,
    "prefill.ssm.22.candidate" : 0,
    "prefill.ssm.22.control" : 0.004100806079804897,
    "prefill.ssm.24.candidate" : 0,
    "prefill.ssm.24.control" : 0.054881006479263306,
    "prefill.ssm.25.candidate" : 0,
    "prefill.ssm.25.control" : 0.0673423707485199,
    "prefill.ssm.26.candidate" : 0,
    "prefill.ssm.26.control" : 0.047217752784490585,
    "prefill.ssm.28.candidate" : 0,
    "prefill.ssm.28.control" : 0.00406047236174345,
    "prefill.ssm.29.candidate" : 0,
    "prefill.ssm.29.control" : 0.06293836236000061,
    "prefill.ssm.30.candidate" : 0,
    "prefill.ssm.30.control" : 0.09470593184232712,
    "prefill.ssm.32.candidate" : 0,
    "prefill.ssm.32.control" : 0.16841714084148407,
    "prefill.ssm.33.candidate" : 0,
    "prefill.ssm.33.control" : 0.06534859538078308,
    "prefill.ssm.34.candidate" : 0,
    "prefill.ssm.34.control" : 0.06899509578943253,
    "prefill.ssm.36.candidate" : 0,
    "prefill.ssm.36.control" : 0.05446093901991844,
    "prefill.ssm.37.candidate" : 0,
    "prefill.ssm.37.control" : 0.03282606229186058,
    "prefill.ssm.38.candidate" : 0,
    "prefill.ssm.38.control" : 0.02024087868630886,
    "prefill.ssm.4.candidate" : 0,
    "prefill.ssm.4.control" : 0.00866289995610714,
    "prefill.ssm.40.candidate" : 0,
    "prefill.ssm.40.control" : 0.01576247438788414,
    "prefill.ssm.41.candidate" : 0,
    "prefill.ssm.41.control" : 0.010871934704482555,
    "prefill.ssm.42.candidate" : 0,
    "prefill.ssm.42.control" : 0.038815125823020935,
    "prefill.ssm.44.candidate" : 0,
    "prefill.ssm.44.control" : 0.014484899118542671,
    "prefill.ssm.45.candidate" : 0,
    "prefill.ssm.45.control" : 0.061037998646497726,
    "prefill.ssm.46.candidate" : 0,
    "prefill.ssm.46.control" : 0.09365357458591461,
    "prefill.ssm.5.candidate" : 0,
    "prefill.ssm.5.control" : 0.03137284889817238,
    "prefill.ssm.6.candidate" : 0,
    "prefill.ssm.6.control" : 0.018186917528510094,
    "prefill.ssm.8.candidate" : 0,
    "prefill.ssm.8.control" : 0.006346123293042183,
    "prefill.ssm.9.candidate" : 0,
    "prefill.ssm.9.control" : 0.02983652800321579,
    "prefill.value.11.candidate" : 0,
    "prefill.value.11.control" : 0.017535971477627754,
    "prefill.value.15.candidate" : 0,
    "prefill.value.15.control" : 0.0219123512506485,
    "prefill.value.19.candidate" : 0,
    "prefill.value.19.control" : 0.019897958263754845,
    "prefill.value.23.candidate" : 0,
    "prefill.value.23.control" : 0.04127907007932663,
    "prefill.value.27.candidate" : 0,
    "prefill.value.27.control" : 0.012838724069297314,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0.013548950664699078,
    "prefill.value.31.candidate" : 0,
    "prefill.value.31.control" : 0.054891303181648254,
    "prefill.value.35.candidate" : 0,
    "prefill.value.35.control" : 0.07065217196941376,
    "prefill.value.39.candidate" : 0,
    "prefill.value.39.control" : 0.04196428507566452,
    "prefill.value.43.candidate" : 0,
    "prefill.value.43.control" : 0.043478261679410934,
    "prefill.value.47.candidate" : 0,
    "prefill.value.47.control" : 0.20663875341415405,
    "prefill.value.7.candidate" : 0,
    "prefill.value.7.control" : 0.015344311483204365,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0,
    "rollback-1.conv.10.control" : 0.024501172825694084,
    "rollback-1.conv.12.candidate" : 0,
    "rollback-1.conv.12.control" : 0.023333333432674408,
    "rollback-1.conv.13.candidate" : 0,
    "rollback-1.conv.13.control" : 0.031593408435583115,
    "rollback-1.conv.14.candidate" : 0,
    "rollback-1.conv.14.control" : 0.027631578966975212,
    "rollback-1.conv.16.candidate" : 0,
    "rollback-1.conv.16.control" : 0.032499998807907104,
    "rollback-1.conv.17.candidate" : 0,
    "rollback-1.conv.17.control" : 0.03723404183983803,
    "rollback-1.conv.18.candidate" : 0,
    "rollback-1.conv.18.control" : 0.028409091755747795,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0.004566209856420755,
    "rollback-1.conv.20.candidate" : 0,
    "rollback-1.conv.20.control" : 0.03502415493130684,
    "rollback-1.conv.21.candidate" : 0,
    "rollback-1.conv.21.control" : 0.032630812376737595,
    "rollback-1.conv.22.candidate" : 0,
    "rollback-1.conv.22.control" : 0.028368793427944183,
    "rollback-1.conv.24.candidate" : 0,
    "rollback-1.conv.24.control" : 0.05833333358168602,
    "rollback-1.conv.25.candidate" : 0,
    "rollback-1.conv.25.control" : 0.0550239235162735,
    "rollback-1.conv.26.candidate" : 0,
    "rollback-1.conv.26.control" : 0.05088495463132858,
    "rollback-1.conv.28.candidate" : 0,
    "rollback-1.conv.28.control" : 0.048155736178159714,
    "rollback-1.conv.29.candidate" : 0,
    "rollback-1.conv.29.control" : 0.04993872717022896,
    "rollback-1.conv.30.candidate" : 0,
    "rollback-1.conv.30.control" : 0.08290155231952667,
    "rollback-1.conv.32.candidate" : 0,
    "rollback-1.conv.32.control" : 0.06648936122655869,
    "rollback-1.conv.33.candidate" : 0,
    "rollback-1.conv.33.control" : 0.060546875,
    "rollback-1.conv.34.candidate" : 0,
    "rollback-1.conv.34.control" : 0.06991525739431381,
    "rollback-1.conv.36.candidate" : 0,
    "rollback-1.conv.36.control" : 0.07635468244552612,
    "rollback-1.conv.37.candidate" : 0,
    "rollback-1.conv.37.control" : 0.0746445506811142,
    "rollback-1.conv.38.candidate" : 0,
    "rollback-1.conv.38.control" : 0.046310242265462875,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0.005635245703160763,
    "rollback-1.conv.40.candidate" : 0,
    "rollback-1.conv.40.control" : 0.07890070974826813,
    "rollback-1.conv.41.candidate" : 0,
    "rollback-1.conv.41.control" : 0.08235294371843338,
    "rollback-1.conv.42.candidate" : 0,
    "rollback-1.conv.42.control" : 0.05517241358757019,
    "rollback-1.conv.44.candidate" : 0,
    "rollback-1.conv.44.control" : 0.0602409653365612,
    "rollback-1.conv.45.candidate" : 0,
    "rollback-1.conv.45.control" : 0.0491071417927742,
    "rollback-1.conv.46.candidate" : 0,
    "rollback-1.conv.46.control" : 0.05740131437778473,
    "rollback-1.conv.5.candidate" : 0,
    "rollback-1.conv.5.control" : 0.015917055308818817,
    "rollback-1.conv.6.candidate" : 0,
    "rollback-1.conv.6.control" : 0.00845410581678152,
    "rollback-1.conv.8.candidate" : 0,
    "rollback-1.conv.8.control" : 0.015318627469241619,
    "rollback-1.conv.9.candidate" : 0,
    "rollback-1.conv.9.control" : 0.02822580561041832,
    "rollback-1.index.11.candidate" : 0,
    "rollback-1.index.11.control" : 0.037133488804101944,
    "rollback-1.index.15.candidate" : 0,
    "rollback-1.index.15.control" : 0.04318820312619209,
    "rollback-1.index.19.candidate" : 0,
    "rollback-1.index.19.control" : 0.04394977167248726,
    "rollback-1.index.23.candidate" : 0,
    "rollback-1.index.23.control" : 0.03504464402794838,
    "rollback-1.index.27.candidate" : 0,
    "rollback-1.index.27.control" : 0.033478688448667526,
    "rollback-1.index.3.candidate" : 0,
    "rollback-1.index.3.control" : 0.018491124734282494,
    "rollback-1.index.31.candidate" : 0,
    "rollback-1.index.31.control" : 0.15060241520404816,
    "rollback-1.index.35.candidate" : 0,
    "rollback-1.index.35.control" : 0.11589404195547104,
    "rollback-1.index.39.candidate" : 0,
    "rollback-1.index.39.control" : 0.04113924130797386,
    "rollback-1.index.43.candidate" : 0,
    "rollback-1.index.43.control" : 0.04204101487994194,
    "rollback-1.index.47.candidate" : 0,
    "rollback-1.index.47.control" : 0.08500000089406967,
    "rollback-1.index.7.candidate" : 0,
    "rollback-1.index.7.control" : 0.022518381476402283,
    "rollback-1.key.11.candidate" : 0,
    "rollback-1.key.11.control" : 0.07007211446762085,
    "rollback-1.key.15.candidate" : 0,
    "rollback-1.key.15.control" : 0.07892335951328278,
    "rollback-1.key.19.candidate" : 0,
    "rollback-1.key.19.control" : 0.10470085591077805,
    "rollback-1.key.23.candidate" : 0,
    "rollback-1.key.23.control" : 0.07895833253860474,
    "rollback-1.key.27.candidate" : 0,
    "rollback-1.key.27.control" : 0.11711040139198303,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0.0241116750985384,
    "rollback-1.key.31.candidate" : 0,
    "rollback-1.key.31.control" : 0.1626468151807785,
    "rollback-1.key.35.candidate" : 0,
    "rollback-1.key.35.control" : 0.1450381726026535,
    "rollback-1.key.39.candidate" : 0,
    "rollback-1.key.39.control" : 0.09121093899011612,
    "rollback-1.key.43.candidate" : 0,
    "rollback-1.key.43.control" : 0.08588435500860214,
    "rollback-1.key.47.candidate" : 0,
    "rollback-1.key.47.control" : 0.1213991791009903,
    "rollback-1.key.7.candidate" : 0,
    "rollback-1.key.7.control" : 0.05255681648850441,
    "rollback-1.logits.candidate" : 0,
    "rollback-1.logits.control" : 0.07965008914470673,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 3.935479981009848e-06,
    "rollback-1.ssm.10.candidate" : 0,
    "rollback-1.ssm.10.control" : 0.0344783253967762,
    "rollback-1.ssm.12.candidate" : 0,
    "rollback-1.ssm.12.control" : 0.005330992396920919,
    "rollback-1.ssm.13.candidate" : 0,
    "rollback-1.ssm.13.control" : 0.022218629717826843,
    "rollback-1.ssm.14.candidate" : 0,
    "rollback-1.ssm.14.control" : 0.010135672055184841,
    "rollback-1.ssm.16.candidate" : 0,
    "rollback-1.ssm.16.control" : 0.030662208795547485,
    "rollback-1.ssm.17.candidate" : 0,
    "rollback-1.ssm.17.control" : 0.040015462785959244,
    "rollback-1.ssm.18.candidate" : 0,
    "rollback-1.ssm.18.control" : 0.03490535169839859,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0.0023009181022644043,
    "rollback-1.ssm.20.candidate" : 0,
    "rollback-1.ssm.20.control" : 0.021612130105495453,
    "rollback-1.ssm.21.candidate" : 0,
    "rollback-1.ssm.21.control" : 0.020330410450696945,
    "rollback-1.ssm.22.candidate" : 0,
    "rollback-1.ssm.22.control" : 0.006753056775778532,
    "rollback-1.ssm.24.candidate" : 0,
    "rollback-1.ssm.24.control" : 0.03824663907289505,
    "rollback-1.ssm.25.candidate" : 0,
    "rollback-1.ssm.25.control" : 0.05765566974878311,
    "rollback-1.ssm.26.candidate" : 0,
    "rollback-1.ssm.26.control" : 0.09496699273586273,
    "rollback-1.ssm.28.candidate" : 0,
    "rollback-1.ssm.28.control" : 0.004367211367934942,
    "rollback-1.ssm.29.candidate" : 0,
    "rollback-1.ssm.29.control" : 0.07781665772199631,
    "rollback-1.ssm.30.candidate" : 0,
    "rollback-1.ssm.30.control" : 0.031036222353577614,
    "rollback-1.ssm.32.candidate" : 0,
    "rollback-1.ssm.32.control" : 0.1460849791765213,
    "rollback-1.ssm.33.candidate" : 0,
    "rollback-1.ssm.33.control" : 0.10402413457632065,
    "rollback-1.ssm.34.candidate" : 0,
    "rollback-1.ssm.34.control" : 0.08971881121397018,
    "rollback-1.ssm.36.candidate" : 0,
    "rollback-1.ssm.36.control" : 0.0664653554558754,
    "rollback-1.ssm.37.candidate" : 0,
    "rollback-1.ssm.37.control" : 0.04842289909720421,
    "rollback-1.ssm.38.candidate" : 0,
    "rollback-1.ssm.38.control" : 0.020191079005599022,
    "rollback-1.ssm.4.candidate" : 0,
    "rollback-1.ssm.4.control" : 0.007861420512199402,
    "rollback-1.ssm.40.candidate" : 0,
    "rollback-1.ssm.40.control" : 0.01511641126126051,
    "rollback-1.ssm.41.candidate" : 0,
    "rollback-1.ssm.41.control" : 0.010043313726782799,
    "rollback-1.ssm.42.candidate" : 0,
    "rollback-1.ssm.42.control" : 0.06658878922462463,
    "rollback-1.ssm.44.candidate" : 0,
    "rollback-1.ssm.44.control" : 0.019495664164423943,
    "rollback-1.ssm.45.candidate" : 0,
    "rollback-1.ssm.45.control" : 0.06541872769594193,
    "rollback-1.ssm.46.candidate" : 0,
    "rollback-1.ssm.46.control" : 0.10107998549938202,
    "rollback-1.ssm.5.candidate" : 0,
    "rollback-1.ssm.5.control" : 0.021658699959516525,
    "rollback-1.ssm.6.candidate" : 0,
    "rollback-1.ssm.6.control" : 0.01367704477161169,
    "rollback-1.ssm.8.candidate" : 0,
    "rollback-1.ssm.8.control" : 0.01272396370768547,
    "rollback-1.ssm.9.candidate" : 0,
    "rollback-1.ssm.9.control" : 0.040513474494218826,
    "rollback-1.value.11.candidate" : 0,
    "rollback-1.value.11.control" : 0.017535971477627754,
    "rollback-1.value.15.candidate" : 0,
    "rollback-1.value.15.control" : 0.0219123512506485,
    "rollback-1.value.19.candidate" : 0,
    "rollback-1.value.19.control" : 0.019897958263754845,
    "rollback-1.value.23.candidate" : 0,
    "rollback-1.value.23.control" : 0.04127907007932663,
    "rollback-1.value.27.candidate" : 0,
    "rollback-1.value.27.control" : 0.012838724069297314,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0.013548950664699078,
    "rollback-1.value.31.candidate" : 0,
    "rollback-1.value.31.control" : 0.054891303181648254,
    "rollback-1.value.35.candidate" : 0,
    "rollback-1.value.35.control" : 0.07065217196941376,
    "rollback-1.value.39.candidate" : 0,
    "rollback-1.value.39.control" : 0.04196428507566452,
    "rollback-1.value.43.candidate" : 0,
    "rollback-1.value.43.control" : 0.043478261679410934,
    "rollback-1.value.47.candidate" : 0,
    "rollback-1.value.47.control" : 0.20663875341415405,
    "rollback-1.value.7.candidate" : 0,
    "rollback-1.value.7.control" : 0.015344311483204365,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0,
    "rollback-2.conv.10.control" : 0.018780048936605453,
    "rollback-2.conv.12.candidate" : 0,
    "rollback-2.conv.12.control" : 0.02364864945411682,
    "rollback-2.conv.13.candidate" : 0,
    "rollback-2.conv.13.control" : 0.03195224702358246,
    "rollback-2.conv.14.candidate" : 0,
    "rollback-2.conv.14.control" : 0.02575306035578251,
    "rollback-2.conv.16.candidate" : 0,
    "rollback-2.conv.16.control" : 0.047029703855514526,
    "rollback-2.conv.17.candidate" : 0,
    "rollback-2.conv.17.control" : 0.042553190141916275,
    "rollback-2.conv.18.candidate" : 0,
    "rollback-2.conv.18.control" : 0.03847222402691841,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0.004926108289510012,
    "rollback-2.conv.20.candidate" : 0,
    "rollback-2.conv.20.control" : 0.036249998956918716,
    "rollback-2.conv.21.candidate" : 0,
    "rollback-2.conv.21.control" : 0.0325581394135952,
    "rollback-2.conv.22.candidate" : 0,
    "rollback-2.conv.22.control" : 0.02857142873108387,
    "rollback-2.conv.24.candidate" : 0,
    "rollback-2.conv.24.control" : 0.030194256454706192,
    "rollback-2.conv.25.candidate" : 0,
    "rollback-2.conv.25.control" : 0.043062202632427216,
    "rollback-2.conv.26.candidate" : 0,
    "rollback-2.conv.26.control" : 0.04146634787321091,
    "rollback-2.conv.28.candidate" : 0,
    "rollback-2.conv.28.control" : 0.038065843284130096,
    "rollback-2.conv.29.candidate" : 0,
    "rollback-2.conv.29.control" : 0.08155079931020737,
    "rollback-2.conv.30.candidate" : 0,
    "rollback-2.conv.30.control" : 0.05699481815099716,
    "rollback-2.conv.32.candidate" : 0,
    "rollback-2.conv.32.control" : 0.07127659767866135,
    "rollback-2.conv.33.candidate" : 0,
    "rollback-2.conv.33.control" : 0.0556640625,
    "rollback-2.conv.34.candidate" : 0,
    "rollback-2.conv.34.control" : 0.07081545144319534,
    "rollback-2.conv.36.candidate" : 0,
    "rollback-2.conv.36.control" : 0.06721697747707367,
    "rollback-2.conv.37.candidate" : 0,
    "rollback-2.conv.37.control" : 0.057041484862565994,
    "rollback-2.conv.38.candidate" : 0,
    "rollback-2.conv.38.control" : 0.032738097012043,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0.0060728746466338634,
    "rollback-2.conv.40.candidate" : 0,
    "rollback-2.conv.40.control" : 0.06560283899307251,
    "rollback-2.conv.41.candidate" : 0,
    "rollback-2.conv.41.control" : 0.06298449635505676,
    "rollback-2.conv.42.candidate" : 0,
    "rollback-2.conv.42.control" : 0.0564236119389534,
    "rollback-2.conv.44.candidate" : 0,
    "rollback-2.conv.44.control" : 0.07970727980136871,
    "rollback-2.conv.45.candidate" : 0,
    "rollback-2.conv.45.control" : 0.04494724050164223,
    "rollback-2.conv.46.candidate" : 0,
    "rollback-2.conv.46.control" : 0.06025552377104759,
    "rollback-2.conv.5.candidate" : 0,
    "rollback-2.conv.5.control" : 0.01606425642967224,
    "rollback-2.conv.6.candidate" : 0,
    "rollback-2.conv.6.control" : 0.011453276500105858,
    "rollback-2.conv.8.candidate" : 0,
    "rollback-2.conv.8.control" : 0.012266002595424652,
    "rollback-2.conv.9.candidate" : 0,
    "rollback-2.conv.9.control" : 0.02401129901409149,
    "rollback-2.index.11.candidate" : 0,
    "rollback-2.index.11.control" : 0.037133488804101944,
    "rollback-2.index.15.candidate" : 0,
    "rollback-2.index.15.control" : 0.04318820312619209,
    "rollback-2.index.19.candidate" : 0,
    "rollback-2.index.19.control" : 0.04394977167248726,
    "rollback-2.index.23.candidate" : 0,
    "rollback-2.index.23.control" : 0.03504464402794838,
    "rollback-2.index.27.candidate" : 0,
    "rollback-2.index.27.control" : 0.033478688448667526,
    "rollback-2.index.3.candidate" : 0,
    "rollback-2.index.3.control" : 0.018491124734282494,
    "rollback-2.index.31.candidate" : 0,
    "rollback-2.index.31.control" : 0.15060241520404816,
    "rollback-2.index.35.candidate" : 0,
    "rollback-2.index.35.control" : 0.11589404195547104,
    "rollback-2.index.39.candidate" : 0,
    "rollback-2.index.39.control" : 0.04113924130797386,
    "rollback-2.index.43.candidate" : 0,
    "rollback-2.index.43.control" : 0.04204101487994194,
    "rollback-2.index.47.candidate" : 0,
    "rollback-2.index.47.control" : 0.08500000089406967,
    "rollback-2.index.7.candidate" : 0,
    "rollback-2.index.7.control" : 0.022518381476402283,
    "rollback-2.key.11.candidate" : 0,
    "rollback-2.key.11.control" : 0.07007211446762085,
    "rollback-2.key.15.candidate" : 0,
    "rollback-2.key.15.control" : 0.07892335951328278,
    "rollback-2.key.19.candidate" : 0,
    "rollback-2.key.19.control" : 0.10470085591077805,
    "rollback-2.key.23.candidate" : 0,
    "rollback-2.key.23.control" : 0.07895833253860474,
    "rollback-2.key.27.candidate" : 0,
    "rollback-2.key.27.control" : 0.11711040139198303,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0.0241116750985384,
    "rollback-2.key.31.candidate" : 0,
    "rollback-2.key.31.control" : 0.1626468151807785,
    "rollback-2.key.35.candidate" : 0,
    "rollback-2.key.35.control" : 0.1450381726026535,
    "rollback-2.key.39.candidate" : 0,
    "rollback-2.key.39.control" : 0.09121093899011612,
    "rollback-2.key.43.candidate" : 0,
    "rollback-2.key.43.control" : 0.08588435500860214,
    "rollback-2.key.47.candidate" : 0,
    "rollback-2.key.47.control" : 0.1213991791009903,
    "rollback-2.key.7.candidate" : 0,
    "rollback-2.key.7.control" : 0.05255681648850441,
    "rollback-2.logits.candidate" : 0,
    "rollback-2.logits.control" : 0.06046845018863678,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 3.898606337315869e-06,
    "rollback-2.ssm.10.candidate" : 0,
    "rollback-2.ssm.10.control" : 0.027197707444429398,
    "rollback-2.ssm.12.candidate" : 0,
    "rollback-2.ssm.12.control" : 0.0027424569707363844,
    "rollback-2.ssm.13.candidate" : 0,
    "rollback-2.ssm.13.control" : 0.029744626954197884,
    "rollback-2.ssm.14.candidate" : 0,
    "rollback-2.ssm.14.control" : 0.017583021894097328,
    "rollback-2.ssm.16.candidate" : 0,
    "rollback-2.ssm.16.control" : 0.029481807723641396,
    "rollback-2.ssm.17.candidate" : 0,
    "rollback-2.ssm.17.control" : 0.034991491585969925,
    "rollback-2.ssm.18.candidate" : 0,
    "rollback-2.ssm.18.control" : 0.06068258732557297,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0.0032669417560100555,
    "rollback-2.ssm.20.candidate" : 0,
    "rollback-2.ssm.20.control" : 0.028981661424040794,
    "rollback-2.ssm.21.candidate" : 0,
    "rollback-2.ssm.21.control" : 0.02416502870619297,
    "rollback-2.ssm.22.candidate" : 0,
    "rollback-2.ssm.22.control" : 0.005942186806350946,
    "rollback-2.ssm.24.candidate" : 0,
    "rollback-2.ssm.24.control" : 0.02878120169043541,
    "rollback-2.ssm.25.candidate" : 0,
    "rollback-2.ssm.25.control" : 0.07765409350395203,
    "rollback-2.ssm.26.candidate" : 0,
    "rollback-2.ssm.26.control" : 0.10078050941228867,
    "rollback-2.ssm.28.candidate" : 0,
    "rollback-2.ssm.28.control" : 0.0029128342866897583,
    "rollback-2.ssm.29.candidate" : 0,
    "rollback-2.ssm.29.control" : 0.07817088067531586,
    "rollback-2.ssm.30.candidate" : 0,
    "rollback-2.ssm.30.control" : 0.0488688126206398,
    "rollback-2.ssm.32.candidate" : 0,
    "rollback-2.ssm.32.control" : 0.05398571863770485,
    "rollback-2.ssm.33.candidate" : 0,
    "rollback-2.ssm.33.control" : 0.07367910444736481,
    "rollback-2.ssm.34.candidate" : 0,
    "rollback-2.ssm.34.control" : 0.09510359168052673,
    "rollback-2.ssm.36.candidate" : 0,
    "rollback-2.ssm.36.control" : 0.04206043854355812,
    "rollback-2.ssm.37.candidate" : 0,
    "rollback-2.ssm.37.control" : 0.05008988082408905,
    "rollback-2.ssm.38.candidate" : 0,
    "rollback-2.ssm.38.control" : 0.016424203291535378,
    "rollback-2.ssm.4.candidate" : 0,
    "rollback-2.ssm.4.control" : 0.0037793403025716543,
    "rollback-2.ssm.40.candidate" : 0,
    "rollback-2.ssm.40.control" : 0.01536477543413639,
    "rollback-2.ssm.41.candidate" : 0,
    "rollback-2.ssm.41.control" : 0.010485962964594364,
    "rollback-2.ssm.42.candidate" : 0,
    "rollback-2.ssm.42.control" : 0.040443647652864456,
    "rollback-2.ssm.44.candidate" : 0,
    "rollback-2.ssm.44.control" : 0.013787983916699886,
    "rollback-2.ssm.45.candidate" : 0,
    "rollback-2.ssm.45.control" : 0.05169033631682396,
    "rollback-2.ssm.46.candidate" : 0,
    "rollback-2.ssm.46.control" : 0.09058184921741486,
    "rollback-2.ssm.5.candidate" : 0,
    "rollback-2.ssm.5.control" : 0.024250732734799385,
    "rollback-2.ssm.6.candidate" : 0,
    "rollback-2.ssm.6.control" : 0.014236142858862877,
    "rollback-2.ssm.8.candidate" : 0,
    "rollback-2.ssm.8.control" : 0.005613996181637049,
    "rollback-2.ssm.9.candidate" : 0,
    "rollback-2.ssm.9.control" : 0.04656233638525009,
    "rollback-2.value.11.candidate" : 0,
    "rollback-2.value.11.control" : 0.017535971477627754,
    "rollback-2.value.15.candidate" : 0,
    "rollback-2.value.15.control" : 0.0219123512506485,
    "rollback-2.value.19.candidate" : 0,
    "rollback-2.value.19.control" : 0.019897958263754845,
    "rollback-2.value.23.candidate" : 0,
    "rollback-2.value.23.control" : 0.04127907007932663,
    "rollback-2.value.27.candidate" : 0,
    "rollback-2.value.27.control" : 0.012838724069297314,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0.013548950664699078,
    "rollback-2.value.31.candidate" : 0,
    "rollback-2.value.31.control" : 0.054891303181648254,
    "rollback-2.value.35.candidate" : 0,
    "rollback-2.value.35.control" : 0.07065217196941376,
    "rollback-2.value.39.candidate" : 0,
    "rollback-2.value.39.control" : 0.04196428507566452,
    "rollback-2.value.43.candidate" : 0,
    "rollback-2.value.43.control" : 0.043478261679410934,
    "rollback-2.value.47.candidate" : 0,
    "rollback-2.value.47.control" : 0.20663875341415405,
    "rollback-2.value.7.candidate" : 0,
    "rollback-2.value.7.control" : 0.015344311483204365,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0,
    "rollback-3.conv.10.control" : 0.02167217619717121,
    "rollback-3.conv.12.candidate" : 0,
    "rollback-3.conv.12.control" : 0.02984234318137169,
    "rollback-3.conv.13.candidate" : 0,
    "rollback-3.conv.13.control" : 0.04775280877947807,
    "rollback-3.conv.14.candidate" : 0,
    "rollback-3.conv.14.control" : 0.03221649304032326,
    "rollback-3.conv.16.candidate" : 0,
    "rollback-3.conv.16.control" : 0.041532911360263824,
    "rollback-3.conv.17.candidate" : 0,
    "rollback-3.conv.17.control" : 0.04104729741811752,
    "rollback-3.conv.18.candidate" : 0,
    "rollback-3.conv.18.control" : 0.04888888821005821,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0.004926108289510012,
    "rollback-3.conv.20.candidate" : 0,
    "rollback-3.conv.20.control" : 0.05624999850988388,
    "rollback-3.conv.21.candidate" : 0,
    "rollback-3.conv.21.control" : 0.045764219015836716,
    "rollback-3.conv.22.candidate" : 0,
    "rollback-3.conv.22.control" : 0.02500000037252903,
    "rollback-3.conv.24.candidate" : 0,
    "rollback-3.conv.24.control" : 0.05110497400164604,
    "rollback-3.conv.25.candidate" : 0,
    "rollback-3.conv.25.control" : 0.04940476268529892,
    "rollback-3.conv.26.candidate" : 0,
    "rollback-3.conv.26.control" : 0.06009615212678909,
    "rollback-3.conv.28.candidate" : 0,
    "rollback-3.conv.28.control" : 0.04835391044616699,
    "rollback-3.conv.29.candidate" : 0,
    "rollback-3.conv.29.control" : 0.08288043737411499,
    "rollback-3.conv.30.candidate" : 0,
    "rollback-3.conv.30.control" : 0.06152849644422531,
    "rollback-3.conv.32.candidate" : 0,
    "rollback-3.conv.32.control" : 0.05898268520832062,
    "rollback-3.conv.33.candidate" : 0,
    "rollback-3.conv.33.control" : 0.07065217196941376,
    "rollback-3.conv.34.candidate" : 0,
    "rollback-3.conv.34.control" : 0.08474576473236084,
    "rollback-3.conv.36.candidate" : 0,
    "rollback-3.conv.36.control" : 0.09459459781646729,
    "rollback-3.conv.37.candidate" : 0,
    "rollback-3.conv.37.control" : 0.10917030274868011,
    "rollback-3.conv.38.candidate" : 0,
    "rollback-3.conv.38.control" : 0.0565476194024086,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0.013663968071341515,
    "rollback-3.conv.40.candidate" : 0,
    "rollback-3.conv.40.control" : 0.08776595443487167,
    "rollback-3.conv.41.candidate" : 0,
    "rollback-3.conv.41.control" : 0.0729166641831398,
    "rollback-3.conv.42.candidate" : 0,
    "rollback-3.conv.42.control" : 0.0805121511220932,
    "rollback-3.conv.44.candidate" : 0,
    "rollback-3.conv.44.control" : 0.10138081759214401,
    "rollback-3.conv.45.candidate" : 0,
    "rollback-3.conv.45.control" : 0.04789402335882187,
    "rollback-3.conv.46.candidate" : 0,
    "rollback-3.conv.46.control" : 0.05939226597547531,
    "rollback-3.conv.5.candidate" : 0,
    "rollback-3.conv.5.control" : 0.13052208721637726,
    "rollback-3.conv.6.candidate" : 0,
    "rollback-3.conv.6.control" : 0.021844660863280296,
    "rollback-3.conv.8.candidate" : 0,
    "rollback-3.conv.8.control" : 0.02205023355782032,
    "rollback-3.conv.9.candidate" : 0,
    "rollback-3.conv.9.control" : 0.023949794471263885,
    "rollback-3.index.11.candidate" : 0,
    "rollback-3.index.11.control" : 0.037133488804101944,
    "rollback-3.index.15.candidate" : 0,
    "rollback-3.index.15.control" : 0.0456460677087307,
    "rollback-3.index.19.candidate" : 0,
    "rollback-3.index.19.control" : 0.04394977167248726,
    "rollback-3.index.23.candidate" : 0,
    "rollback-3.index.23.control" : 0.03504464402794838,
    "rollback-3.index.27.candidate" : 0,
    "rollback-3.index.27.control" : 0.033478688448667526,
    "rollback-3.index.3.candidate" : 0,
    "rollback-3.index.3.control" : 0.018491124734282494,
    "rollback-3.index.31.candidate" : 0,
    "rollback-3.index.31.control" : 0.15060241520404816,
    "rollback-3.index.35.candidate" : 0,
    "rollback-3.index.35.control" : 0.11589404195547104,
    "rollback-3.index.39.candidate" : 0,
    "rollback-3.index.39.control" : 0.04113924130797386,
    "rollback-3.index.43.candidate" : 0,
    "rollback-3.index.43.control" : 0.04204101487994194,
    "rollback-3.index.47.candidate" : 0,
    "rollback-3.index.47.control" : 0.08500000089406967,
    "rollback-3.index.7.candidate" : 0,
    "rollback-3.index.7.control" : 0.022518381476402283,
    "rollback-3.key.11.candidate" : 0,
    "rollback-3.key.11.control" : 0.07007211446762085,
    "rollback-3.key.15.candidate" : 0,
    "rollback-3.key.15.control" : 0.07892335951328278,
    "rollback-3.key.19.candidate" : 0,
    "rollback-3.key.19.control" : 0.10470085591077805,
    "rollback-3.key.23.candidate" : 0,
    "rollback-3.key.23.control" : 0.07895833253860474,
    "rollback-3.key.27.candidate" : 0,
    "rollback-3.key.27.control" : 0.11711040139198303,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0.030456852167844772,
    "rollback-3.key.31.candidate" : 0,
    "rollback-3.key.31.control" : 0.1626468151807785,
    "rollback-3.key.35.candidate" : 0,
    "rollback-3.key.35.control" : 0.1450381726026535,
    "rollback-3.key.39.candidate" : 0,
    "rollback-3.key.39.control" : 0.09121093899011612,
    "rollback-3.key.43.candidate" : 0,
    "rollback-3.key.43.control" : 0.08588435500860214,
    "rollback-3.key.47.candidate" : 0,
    "rollback-3.key.47.control" : 0.1213991791009903,
    "rollback-3.key.7.candidate" : 0,
    "rollback-3.key.7.control" : 0.05255681648850441,
    "rollback-3.logits.candidate" : 0,
    "rollback-3.logits.control" : 0.07105809450149536,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 3.864367499772925e-06,
    "rollback-3.ssm.10.candidate" : 0,
    "rollback-3.ssm.10.control" : 0.08204251527786255,
    "rollback-3.ssm.12.candidate" : 0,
    "rollback-3.ssm.12.control" : 0.00397211080417037,
    "rollback-3.ssm.13.candidate" : 0,
    "rollback-3.ssm.13.control" : 0.05075720325112343,
    "rollback-3.ssm.14.candidate" : 0,
    "rollback-3.ssm.14.control" : 0.019048359245061874,
    "rollback-3.ssm.16.candidate" : 0,
    "rollback-3.ssm.16.control" : 0.04501592367887497,
    "rollback-3.ssm.17.candidate" : 0,
    "rollback-3.ssm.17.control" : 0.05534174293279648,
    "rollback-3.ssm.18.candidate" : 0,
    "rollback-3.ssm.18.control" : 0.06360547989606857,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0.0023771370761096478,
    "rollback-3.ssm.20.candidate" : 0,
    "rollback-3.ssm.20.control" : 0.024704163894057274,
    "rollback-3.ssm.21.candidate" : 0,
    "rollback-3.ssm.21.control" : 0.02034204825758934,
    "rollback-3.ssm.22.candidate" : 0,
    "rollback-3.ssm.22.control" : 0.005552635062485933,
    "rollback-3.ssm.24.candidate" : 0,
    "rollback-3.ssm.24.control" : 0.026679223403334618,
    "rollback-3.ssm.25.candidate" : 0,
    "rollback-3.ssm.25.control" : 0.10834430158138275,
    "rollback-3.ssm.26.candidate" : 0,
    "rollback-3.ssm.26.control" : 0.11693833768367767,
    "rollback-3.ssm.28.candidate" : 0,
    "rollback-3.ssm.28.control" : 0.003422223264351487,
    "rollback-3.ssm.29.candidate" : 0,
    "rollback-3.ssm.29.control" : 0.068805031478405,
    "rollback-3.ssm.30.candidate" : 0,
    "rollback-3.ssm.30.control" : 0.03390698879957199,
    "rollback-3.ssm.32.candidate" : 0,
    "rollback-3.ssm.32.control" : 0.03363864868879318,
    "rollback-3.ssm.33.candidate" : 0,
    "rollback-3.ssm.33.control" : 0.07301340252161026,
    "rollback-3.ssm.34.candidate" : 0,
    "rollback-3.ssm.34.control" : 0.12887689471244812,
    "rollback-3.ssm.36.candidate" : 0,
    "rollback-3.ssm.36.control" : 0.10671717673540115,
    "rollback-3.ssm.37.candidate" : 0,
    "rollback-3.ssm.37.control" : 0.059275683015584946,
    "rollback-3.ssm.38.candidate" : 0,
    "rollback-3.ssm.38.control" : 0.01777983270585537,
    "rollback-3.ssm.4.candidate" : 0,
    "rollback-3.ssm.4.control" : 0.007726731244474649,
    "rollback-3.ssm.40.candidate" : 0,
    "rollback-3.ssm.40.control" : 0.03229324892163277,
    "rollback-3.ssm.41.candidate" : 0,
    "rollback-3.ssm.41.control" : 0.011441385373473167,
    "rollback-3.ssm.42.candidate" : 0,
    "rollback-3.ssm.42.control" : 0.04029831290245056,
    "rollback-3.ssm.44.candidate" : 0,
    "rollback-3.ssm.44.control" : 0.07188679277896881,
    "rollback-3.ssm.45.candidate" : 0,
    "rollback-3.ssm.45.control" : 0.1052388995885849,
    "rollback-3.ssm.46.candidate" : 0,
    "rollback-3.ssm.46.control" : 0.06474634259939194,
    "rollback-3.ssm.5.candidate" : 0,
    "rollback-3.ssm.5.control" : 0.0781237855553627,
    "rollback-3.ssm.6.candidate" : 0,
    "rollback-3.ssm.6.control" : 0.03248649090528488,
    "rollback-3.ssm.8.candidate" : 0,
    "rollback-3.ssm.8.control" : 0.010762968100607395,
    "rollback-3.ssm.9.candidate" : 0,
    "rollback-3.ssm.9.control" : 0.05442351475358009,
    "rollback-3.value.11.candidate" : 0,
    "rollback-3.value.11.control" : 0.017535971477627754,
    "rollback-3.value.15.candidate" : 0,
    "rollback-3.value.15.control" : 0.0219123512506485,
    "rollback-3.value.19.candidate" : 0,
    "rollback-3.value.19.control" : 0.019897958263754845,
    "rollback-3.value.23.candidate" : 0,
    "rollback-3.value.23.control" : 0.04127907007932663,
    "rollback-3.value.27.candidate" : 0,
    "rollback-3.value.27.control" : 0.012838724069297314,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0.02097902074456215,
    "rollback-3.value.31.candidate" : 0,
    "rollback-3.value.31.control" : 0.054891303181648254,
    "rollback-3.value.35.candidate" : 0,
    "rollback-3.value.35.control" : 0.07065217196941376,
    "rollback-3.value.39.candidate" : 0,
    "rollback-3.value.39.control" : 0.04196428507566452,
    "rollback-3.value.43.candidate" : 0,
    "rollback-3.value.43.control" : 0.043478261679410934,
    "rollback-3.value.47.candidate" : 0,
    "rollback-3.value.47.control" : 0.20663875341415405,
    "rollback-3.value.7.candidate" : 0,
    "rollback-3.value.7.control" : 0.015344311483204365,
    "routing.candidate" : 0,
    "routing.control" : 0.037665857605177995,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-64-swept-router-padded-attention-aligned-projections-aligned\/tokens=2564\/prefix=2049",
  "passed" : true
}

````

## context-small-projections-sparse-prefix-64-15/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## context-small-projections-sparse-prefix-128-15/stdout.txt

SHA-256 `1d6e4366ed19cb19f02eddf43d8c89f917c821fea90d0899ced16c0e5fff2f57`; 229540 bytes.

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
      "name" : "prefill: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.11",
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
      "name" : "prefill: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: deterministic repeated index.47",
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
      "name" : "continued-907: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic field names",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.39",
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
      "name" : "continued-907: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.11",
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
      "name" : "continued-907: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.20",
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
      "name" : "continued-907: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-907: deterministic repeated index.47",
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
      "name" : "continued-1337: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.11",
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
      "name" : "continued-1337: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-1337: deterministic repeated index.47",
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
      "name" : "continued-2103: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.39",
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
      "name" : "continued-2103: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.11",
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
      "name" : "continued-2103: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.20",
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
      "name" : "continued-2103: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "continued-2103: deterministic repeated index.47",
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
      "name" : "rollback-1: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.11",
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
      "name" : "rollback-1: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-1: deterministic repeated index.47",
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
      "name" : "rollback-2: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.39",
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
      "name" : "rollback-2: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.11",
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
      "name" : "rollback-2: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.20",
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
      "name" : "rollback-2: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-2: deterministic repeated index.47",
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
      "name" : "rollback-3: deterministic repeated index.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.37",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.22",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.24",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.29",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.7",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.11",
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
      "name" : "rollback-3: deterministic repeated ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.3",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.15",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.40",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.14",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.0",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.30",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.25",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.39",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ple.1",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.11",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.35",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.31",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.9",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.28",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.45",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.23",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.27",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.42",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.43",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.18",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.41",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated key.47",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.44",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.17",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated value.19",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated conv.46",
      "passed" : true
    },
    {
      "name" : "rollback-3: deterministic repeated index.47",
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
    "arm0.allocated_bytes" : 84934656,
    "arm0.chunk" : 256,
    "arm0.padded_query_rows" : 0,
    "arm0.read_records" : 16032,
    "arm0.seconds" : 4.6935545,
    "arm0.workspace_piece_writes" : 0,
    "arm1.allocated_bytes" : 84934656,
    "arm1.chunk" : 512,
    "arm1.padded_query_rows" : 0,
    "arm1.read_records" : 9803,
    "arm1.seconds" : 2.908273875,
    "arm1.workspace_piece_writes" : 0,
    "arm2.allocated_bytes" : 84934656,
    "arm2.chunk" : 128,
    "arm2.padded_query_rows" : 0,
    "arm2.read_records" : 24296,
    "arm2.seconds" : 9.359722541,
    "arm2.workspace_piece_writes" : 0,
    "arm3.allocated_bytes" : 84934656,
    "arm3.chunk" : 128,
    "arm3.padded_query_rows" : 0,
    "arm3.read_records" : 24295,
    "arm3.seconds" : 11.25506575,
    "arm3.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0,
    "continued-1337.conv.10.control" : 0.029789719730615616,
    "continued-1337.conv.12.candidate" : 0,
    "continued-1337.conv.12.control" : 0.024886878207325935,
    "continued-1337.conv.13.candidate" : 0,
    "continued-1337.conv.13.control" : 0.02947443164885044,
    "continued-1337.conv.14.candidate" : 0,
    "continued-1337.conv.14.control" : 0.02213541604578495,
    "continued-1337.conv.16.candidate" : 0,
    "continued-1337.conv.16.control" : 0.03737745061516762,
    "continued-1337.conv.17.candidate" : 0,
    "continued-1337.conv.17.control" : 0.06345177441835403,
    "continued-1337.conv.18.candidate" : 0,
    "continued-1337.conv.18.control" : 0.03619909659028053,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0.009615384973585606,
    "continued-1337.conv.20.candidate" : 0,
    "continued-1337.conv.20.control" : 0.03021327033638954,
    "continued-1337.conv.21.candidate" : 0,
    "continued-1337.conv.21.control" : 0.03286384791135788,
    "continued-1337.conv.22.candidate" : 0,
    "continued-1337.conv.22.control" : 0.02213541604578495,
    "continued-1337.conv.24.candidate" : 0,
    "continued-1337.conv.24.control" : 0.03551912680268288,
    "continued-1337.conv.25.candidate" : 0,
    "continued-1337.conv.25.control" : 0.04055771604180336,
    "continued-1337.conv.26.candidate" : 0,
    "continued-1337.conv.26.control" : 0.044798705726861954,
    "continued-1337.conv.28.candidate" : 0,
    "continued-1337.conv.28.control" : 0.03244274854660034,
    "continued-1337.conv.29.candidate" : 0,
    "continued-1337.conv.29.control" : 0.0625,
    "continued-1337.conv.30.candidate" : 0,
    "continued-1337.conv.30.control" : 0.048076923936605453,
    "continued-1337.conv.32.candidate" : 0,
    "continued-1337.conv.32.control" : 0.06777777522802353,
    "continued-1337.conv.33.candidate" : 0,
    "continued-1337.conv.33.control" : 0.05673076957464218,
    "continued-1337.conv.34.candidate" : 0,
    "continued-1337.conv.34.control" : 0.06244055554270744,
    "continued-1337.conv.36.candidate" : 0,
    "continued-1337.conv.36.control" : 0.05406976863741875,
    "continued-1337.conv.37.candidate" : 0,
    "continued-1337.conv.37.control" : 0.061296653002500534,
    "continued-1337.conv.38.candidate" : 0,
    "continued-1337.conv.38.control" : 0.030279502272605896,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0.008196720853447914,
    "continued-1337.conv.40.candidate" : 0,
    "continued-1337.conv.40.control" : 0.06687062978744507,
    "continued-1337.conv.41.candidate" : 0,
    "continued-1337.conv.41.control" : 0.044921875,
    "continued-1337.conv.42.candidate" : 0,
    "continued-1337.conv.42.control" : 0.047512754797935486,
    "continued-1337.conv.44.candidate" : 0,
    "continued-1337.conv.44.control" : 0.0903954803943634,
    "continued-1337.conv.45.candidate" : 0,
    "continued-1337.conv.45.control" : 0.0607638880610466,
    "continued-1337.conv.46.candidate" : 0,
    "continued-1337.conv.46.control" : 0.04368279501795769,
    "continued-1337.conv.5.candidate" : 0,
    "continued-1337.conv.5.control" : 0.01995798386633396,
    "continued-1337.conv.6.candidate" : 0,
    "continued-1337.conv.6.control" : 0.02500000037252903,
    "continued-1337.conv.8.candidate" : 0,
    "continued-1337.conv.8.control" : 0.021531101316213608,
    "continued-1337.conv.9.candidate" : 0,
    "continued-1337.conv.9.control" : 0.018269231542944908,
    "continued-1337.index.11.candidate" : 0,
    "continued-1337.index.11.control" : 0.037133488804101944,
    "continued-1337.index.15.candidate" : 0,
    "continued-1337.index.15.control" : 0.04318820312619209,
    "continued-1337.index.19.candidate" : 0,
    "continued-1337.index.19.control" : 0.04394977167248726,
    "continued-1337.index.23.candidate" : 0,
    "continued-1337.index.23.control" : 0.03504464402794838,
    "continued-1337.index.27.candidate" : 0,
    "continued-1337.index.27.control" : 0.033478688448667526,
    "continued-1337.index.3.candidate" : 0,
    "continued-1337.index.3.control" : 0.018491124734282494,
    "continued-1337.index.31.candidate" : 0,
    "continued-1337.index.31.control" : 0.15060241520404816,
    "continued-1337.index.35.candidate" : 0,
    "continued-1337.index.35.control" : 0.11589404195547104,
    "continued-1337.index.39.candidate" : 0,
    "continued-1337.index.39.control" : 0.04113924130797386,
    "continued-1337.index.43.candidate" : 0,
    "continued-1337.index.43.control" : 0.04204101487994194,
    "continued-1337.index.47.candidate" : 0,
    "continued-1337.index.47.control" : 0.08500000089406967,
    "continued-1337.index.7.candidate" : 0,
    "continued-1337.index.7.control" : 0.022518381476402283,
    "continued-1337.key.11.candidate" : 0,
    "continued-1337.key.11.control" : 0.07007211446762085,
    "continued-1337.key.15.candidate" : 0,
    "continued-1337.key.15.control" : 0.07892335951328278,
    "continued-1337.key.19.candidate" : 0,
    "continued-1337.key.19.control" : 0.10470085591077805,
    "continued-1337.key.23.candidate" : 0,
    "continued-1337.key.23.control" : 0.07895833253860474,
    "continued-1337.key.27.candidate" : 0,
    "continued-1337.key.27.control" : 0.11711040139198303,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0.0241116750985384,
    "continued-1337.key.31.candidate" : 0,
    "continued-1337.key.31.control" : 0.1626468151807785,
    "continued-1337.key.35.candidate" : 0,
    "continued-1337.key.35.control" : 0.1450381726026535,
    "continued-1337.key.39.candidate" : 0,
    "continued-1337.key.39.control" : 0.09121093899011612,
    "continued-1337.key.43.candidate" : 0,
    "continued-1337.key.43.control" : 0.08588435500860214,
    "continued-1337.key.47.candidate" : 0,
    "continued-1337.key.47.control" : 0.1213991791009903,
    "continued-1337.key.7.candidate" : 0,
    "continued-1337.key.7.control" : 0.05255681648850441,
    "continued-1337.logits.candidate" : 0,
    "continued-1337.logits.control" : 0.07653061300516129,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 4.397510110720759e-06,
    "continued-1337.ssm.10.candidate" : 0,
    "continued-1337.ssm.10.control" : 0.07900995761156082,
    "continued-1337.ssm.12.candidate" : 0,
    "continued-1337.ssm.12.control" : 0.0029877584893256426,
    "continued-1337.ssm.13.candidate" : 0,
    "continued-1337.ssm.13.control" : 0.02690439485013485,
    "continued-1337.ssm.14.candidate" : 0,
    "continued-1337.ssm.14.control" : 0.009916176088154316,
    "continued-1337.ssm.16.candidate" : 0,
    "continued-1337.ssm.16.control" : 0.04610536992549896,
    "continued-1337.ssm.17.candidate" : 0,
    "continued-1337.ssm.17.control" : 0.034973688423633575,
    "continued-1337.ssm.18.candidate" : 0,
    "continued-1337.ssm.18.control" : 0.04583916813135147,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0.002779561560600996,
    "continued-1337.ssm.20.candidate" : 0,
    "continued-1337.ssm.20.control" : 0.04923080652952194,
    "continued-1337.ssm.21.candidate" : 0,
    "continued-1337.ssm.21.control" : 0.0294975396245718,
    "continued-1337.ssm.22.candidate" : 0,
    "continued-1337.ssm.22.control" : 0.003985300660133362,
    "continued-1337.ssm.24.candidate" : 0,
    "continued-1337.ssm.24.control" : 0.03136852756142616,
    "continued-1337.ssm.25.candidate" : 0,
    "continued-1337.ssm.25.control" : 0.07450016587972641,
    "continued-1337.ssm.26.candidate" : 0,
    "continued-1337.ssm.26.control" : 0.1739630103111267,
    "continued-1337.ssm.28.candidate" : 0,
    "continued-1337.ssm.28.control" : 0.00629217317327857,
    "continued-1337.ssm.29.candidate" : 0,
    "continued-1337.ssm.29.control" : 0.07583524286746979,
    "continued-1337.ssm.30.candidate" : 0,
    "continued-1337.ssm.30.control" : 0.039386849850416183,
    "continued-1337.ssm.32.candidate" : 0,
    "continued-1337.ssm.32.control" : 0.10884042084217072,
    "continued-1337.ssm.33.candidate" : 0,
    "continued-1337.ssm.33.control" : 0.05853148177266121,
    "continued-1337.ssm.34.candidate" : 0,
    "continued-1337.ssm.34.control" : 0.09363560378551483,
    "continued-1337.ssm.36.candidate" : 0,
    "continued-1337.ssm.36.control" : 0.03387089818716049,
    "continued-1337.ssm.37.candidate" : 0,
    "continued-1337.ssm.37.control" : 0.029361402615904808,
    "continued-1337.ssm.38.candidate" : 0,
    "continued-1337.ssm.38.control" : 0.023686816915869713,
    "continued-1337.ssm.4.candidate" : 0,
    "continued-1337.ssm.4.control" : 0.004598719999194145,
    "continued-1337.ssm.40.candidate" : 0,
    "continued-1337.ssm.40.control" : 0.015822729095816612,
    "continued-1337.ssm.41.candidate" : 0,
    "continued-1337.ssm.41.control" : 0.010389303788542747,
    "continued-1337.ssm.42.candidate" : 0,
    "continued-1337.ssm.42.control" : 0.04106543958187103,
    "continued-1337.ssm.44.candidate" : 0,
    "continued-1337.ssm.44.control" : 0.014979381114244461,
    "continued-1337.ssm.45.candidate" : 0,
    "continued-1337.ssm.45.control" : 0.11983004212379456,
    "continued-1337.ssm.46.candidate" : 0,
    "continued-1337.ssm.46.control" : 0.11884036660194397,
    "continued-1337.ssm.5.candidate" : 0,
    "continued-1337.ssm.5.control" : 0.04356319084763527,
    "continued-1337.ssm.6.candidate" : 0,
    "continued-1337.ssm.6.control" : 0.019279733300209045,
    "continued-1337.ssm.8.candidate" : 0,
    "continued-1337.ssm.8.control" : 0.019201843068003654,
    "continued-1337.ssm.9.candidate" : 0,
    "continued-1337.ssm.9.control" : 0.03141006454825401,
    "continued-1337.value.11.candidate" : 0,
    "continued-1337.value.11.control" : 0.017535971477627754,
    "continued-1337.value.15.candidate" : 0,
    "continued-1337.value.15.control" : 0.0219123512506485,
    "continued-1337.value.19.candidate" : 0,
    "continued-1337.value.19.control" : 0.019897958263754845,
    "continued-1337.value.23.candidate" : 0,
    "continued-1337.value.23.control" : 0.04127907007932663,
    "continued-1337.value.27.candidate" : 0,
    "continued-1337.value.27.control" : 0.012838724069297314,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0.013548950664699078,
    "continued-1337.value.31.candidate" : 0,
    "continued-1337.value.31.control" : 0.054891303181648254,
    "continued-1337.value.35.candidate" : 0,
    "continued-1337.value.35.control" : 0.07065217196941376,
    "continued-1337.value.39.candidate" : 0,
    "continued-1337.value.39.control" : 0.04196428507566452,
    "continued-1337.value.43.candidate" : 0,
    "continued-1337.value.43.control" : 0.043478261679410934,
    "continued-1337.value.47.candidate" : 0,
    "continued-1337.value.47.control" : 0.20663875341415405,
    "continued-1337.value.7.candidate" : 0,
    "continued-1337.value.7.control" : 0.015344311483204365,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0,
    "continued-2103.conv.10.control" : 0.02992957830429077,
    "continued-2103.conv.12.candidate" : 0,
    "continued-2103.conv.12.control" : 0.024444444105029106,
    "continued-2103.conv.13.candidate" : 0,
    "continued-2103.conv.13.control" : 0.031593408435583115,
    "continued-2103.conv.14.candidate" : 0,
    "continued-2103.conv.14.control" : 0.02213541604578495,
    "continued-2103.conv.16.candidate" : 0,
    "continued-2103.conv.16.control" : 0.03737745061516762,
    "continued-2103.conv.17.candidate" : 0,
    "continued-2103.conv.17.control" : 0.06345177441835403,
    "continued-2103.conv.18.candidate" : 0,
    "continued-2103.conv.18.control" : 0.03619909659028053,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0.004566209856420755,
    "continued-2103.conv.20.candidate" : 0,
    "continued-2103.conv.20.control" : 0.03079710155725479,
    "continued-2103.conv.21.candidate" : 0,
    "continued-2103.conv.21.control" : 0.03286384791135788,
    "continued-2103.conv.22.candidate" : 0,
    "continued-2103.conv.22.control" : 0.0216644499450922,
    "continued-2103.conv.24.candidate" : 0,
    "continued-2103.conv.24.control" : 0.03551912680268288,
    "continued-2103.conv.25.candidate" : 0,
    "continued-2103.conv.25.control" : 0.04055771604180336,
    "continued-2103.conv.26.candidate" : 0,
    "continued-2103.conv.26.control" : 0.04400580748915672,
    "continued-2103.conv.28.candidate" : 0,
    "continued-2103.conv.28.control" : 0.03578244149684906,
    "continued-2103.conv.29.candidate" : 0,
    "continued-2103.conv.29.control" : 0.05422794073820114,
    "continued-2103.conv.30.candidate" : 0,
    "continued-2103.conv.30.control" : 0.07692307978868484,
    "continued-2103.conv.32.candidate" : 0,
    "continued-2103.conv.32.control" : 0.06777777522802353,
    "continued-2103.conv.33.candidate" : 0,
    "continued-2103.conv.33.control" : 0.05961538478732109,
    "continued-2103.conv.34.candidate" : 0,
    "continued-2103.conv.34.control" : 0.06244055554270744,
    "continued-2103.conv.36.candidate" : 0,
    "continued-2103.conv.36.control" : 0.06416869163513184,
    "continued-2103.conv.37.candidate" : 0,
    "continued-2103.conv.37.control" : 0.061296653002500534,
    "continued-2103.conv.38.candidate" : 0,
    "continued-2103.conv.38.control" : 0.03105590119957924,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0.008368200622498989,
    "continued-2103.conv.40.candidate" : 0,
    "continued-2103.conv.40.control" : 0.06687062978744507,
    "continued-2103.conv.41.candidate" : 0,
    "continued-2103.conv.41.control" : 0.044921875,
    "continued-2103.conv.42.candidate" : 0,
    "continued-2103.conv.42.control" : 0.047512754797935486,
    "continued-2103.conv.44.candidate" : 0,
    "continued-2103.conv.44.control" : 0.0903954803943634,
    "continued-2103.conv.45.candidate" : 0,
    "continued-2103.conv.45.control" : 0.06118880957365036,
    "continued-2103.conv.46.candidate" : 0,
    "continued-2103.conv.46.control" : 0.0617559514939785,
    "continued-2103.conv.5.candidate" : 0,
    "continued-2103.conv.5.control" : 0.01995798386633396,
    "continued-2103.conv.6.candidate" : 0,
    "continued-2103.conv.6.control" : 0.02500000037252903,
    "continued-2103.conv.8.candidate" : 0,
    "continued-2103.conv.8.control" : 0.021531101316213608,
    "continued-2103.conv.9.candidate" : 0,
    "continued-2103.conv.9.control" : 0.01875000074505806,
    "continued-2103.index.11.candidate" : 0,
    "continued-2103.index.11.control" : 0.037133488804101944,
    "continued-2103.index.15.candidate" : 0,
    "continued-2103.index.15.control" : 0.04318820312619209,
    "continued-2103.index.19.candidate" : 0,
    "continued-2103.index.19.control" : 0.04394977167248726,
    "continued-2103.index.23.candidate" : 0,
    "continued-2103.index.23.control" : 0.03504464402794838,
    "continued-2103.index.27.candidate" : 0,
    "continued-2103.index.27.control" : 0.033478688448667526,
    "continued-2103.index.3.candidate" : 0,
    "continued-2103.index.3.control" : 0.018491124734282494,
    "continued-2103.index.31.candidate" : 0,
    "continued-2103.index.31.control" : 0.15060241520404816,
    "continued-2103.index.35.candidate" : 0,
    "continued-2103.index.35.control" : 0.11589404195547104,
    "continued-2103.index.39.candidate" : 0,
    "continued-2103.index.39.control" : 0.04113924130797386,
    "continued-2103.index.43.candidate" : 0,
    "continued-2103.index.43.control" : 0.04204101487994194,
    "continued-2103.index.47.candidate" : 0,
    "continued-2103.index.47.control" : 0.08500000089406967,
    "continued-2103.index.7.candidate" : 0,
    "continued-2103.index.7.control" : 0.022518381476402283,
    "continued-2103.key.11.candidate" : 0,
    "continued-2103.key.11.control" : 0.07007211446762085,
    "continued-2103.key.15.candidate" : 0,
    "continued-2103.key.15.control" : 0.07892335951328278,
    "continued-2103.key.19.candidate" : 0,
    "continued-2103.key.19.control" : 0.10470085591077805,
    "continued-2103.key.23.candidate" : 0,
    "continued-2103.key.23.control" : 0.07895833253860474,
    "continued-2103.key.27.candidate" : 0,
    "continued-2103.key.27.control" : 0.11711040139198303,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0.0241116750985384,
    "continued-2103.key.31.candidate" : 0,
    "continued-2103.key.31.control" : 0.1626468151807785,
    "continued-2103.key.35.candidate" : 0,
    "continued-2103.key.35.control" : 0.1450381726026535,
    "continued-2103.key.39.candidate" : 0,
    "continued-2103.key.39.control" : 0.09121093899011612,
    "continued-2103.key.43.candidate" : 0,
    "continued-2103.key.43.control" : 0.08588435500860214,
    "continued-2103.key.47.candidate" : 0,
    "continued-2103.key.47.control" : 0.1213991791009903,
    "continued-2103.key.7.candidate" : 0,
    "continued-2103.key.7.control" : 0.05255681648850441,
    "continued-2103.logits.candidate" : 0,
    "continued-2103.logits.control" : 0.07662338018417358,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 4.417280251800548e-06,
    "continued-2103.ssm.10.candidate" : 0,
    "continued-2103.ssm.10.control" : 0.033353764563798904,
    "continued-2103.ssm.12.candidate" : 0,
    "continued-2103.ssm.12.control" : 0.003347413381561637,
    "continued-2103.ssm.13.candidate" : 0,
    "continued-2103.ssm.13.control" : 0.02338651567697525,
    "continued-2103.ssm.14.candidate" : 0,
    "continued-2103.ssm.14.control" : 0.007826757617294788,
    "continued-2103.ssm.16.candidate" : 0,
    "continued-2103.ssm.16.control" : 0.019286785274744034,
    "continued-2103.ssm.17.candidate" : 0,
    "continued-2103.ssm.17.control" : 0.03164352476596832,
    "continued-2103.ssm.18.candidate" : 0,
    "continued-2103.ssm.18.control" : 0.04216703400015831,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0.0023648554924875498,
    "continued-2103.ssm.20.candidate" : 0,
    "continued-2103.ssm.20.control" : 0.016534719616174698,
    "continued-2103.ssm.21.candidate" : 0,
    "continued-2103.ssm.21.control" : 0.027739794924855232,
    "continued-2103.ssm.22.candidate" : 0,
    "continued-2103.ssm.22.control" : 0.004054700490087271,
    "continued-2103.ssm.24.candidate" : 0,
    "continued-2103.ssm.24.control" : 0.019607193768024445,
    "continued-2103.ssm.25.candidate" : 0,
    "continued-2103.ssm.25.control" : 0.05301045998930931,
    "continued-2103.ssm.26.candidate" : 0,
    "continued-2103.ssm.26.control" : 0.0408402718603611,
    "continued-2103.ssm.28.candidate" : 0,
    "continued-2103.ssm.28.control" : 0.0044181630946695805,
    "continued-2103.ssm.29.candidate" : 0,
    "continued-2103.ssm.29.control" : 0.0804378092288971,
    "continued-2103.ssm.30.candidate" : 0,
    "continued-2103.ssm.30.control" : 0.03291277959942818,
    "continued-2103.ssm.32.candidate" : 0,
    "continued-2103.ssm.32.control" : 0.056803617626428604,
    "continued-2103.ssm.33.candidate" : 0,
    "continued-2103.ssm.33.control" : 0.08929989486932755,
    "continued-2103.ssm.34.candidate" : 0,
    "continued-2103.ssm.34.control" : 0.09182621538639069,
    "continued-2103.ssm.36.candidate" : 0,
    "continued-2103.ssm.36.control" : 0.06473997235298157,
    "continued-2103.ssm.37.candidate" : 0,
    "continued-2103.ssm.37.control" : 0.044665075838565826,
    "continued-2103.ssm.38.candidate" : 0,
    "continued-2103.ssm.38.control" : 0.016059070825576782,
    "continued-2103.ssm.4.candidate" : 0,
    "continued-2103.ssm.4.control" : 0.0038736111018806696,
    "continued-2103.ssm.40.candidate" : 0,
    "continued-2103.ssm.40.control" : 0.015822991728782654,
    "continued-2103.ssm.41.candidate" : 0,
    "continued-2103.ssm.41.control" : 0.010253435000777245,
    "continued-2103.ssm.42.candidate" : 0,
    "continued-2103.ssm.42.control" : 0.031438443809747696,
    "continued-2103.ssm.44.candidate" : 0,
    "continued-2103.ssm.44.control" : 0.014186267741024494,
    "continued-2103.ssm.45.candidate" : 0,
    "continued-2103.ssm.45.control" : 0.05187271907925606,
    "continued-2103.ssm.46.candidate" : 0,
    "continued-2103.ssm.46.control" : 0.05253820866346359,
    "continued-2103.ssm.5.candidate" : 0,
    "continued-2103.ssm.5.control" : 0.024905256927013397,
    "continued-2103.ssm.6.candidate" : 0,
    "continued-2103.ssm.6.control" : 0.01623982936143875,
    "continued-2103.ssm.8.candidate" : 0,
    "continued-2103.ssm.8.control" : 0.013248871080577374,
    "continued-2103.ssm.9.candidate" : 0,
    "continued-2103.ssm.9.control" : 0.04901403561234474,
    "continued-2103.value.11.candidate" : 0,
    "continued-2103.value.11.control" : 0.017535971477627754,
    "continued-2103.value.15.candidate" : 0,
    "continued-2103.value.15.control" : 0.0219123512506485,
    "continued-2103.value.19.candidate" : 0,
    "continued-2103.value.19.control" : 0.019897958263754845,
    "continued-2103.value.23.candidate" : 0,
    "continued-2103.value.23.control" : 0.04127907007932663,
    "continued-2103.value.27.candidate" : 0,
    "continued-2103.value.27.control" : 0.012838724069297314,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0.013548950664699078,
    "continued-2103.value.31.candidate" : 0,
    "continued-2103.value.31.control" : 0.054891303181648254,
    "continued-2103.value.35.candidate" : 0,
    "continued-2103.value.35.control" : 0.07065217196941376,
    "continued-2103.value.39.candidate" : 0,
    "continued-2103.value.39.control" : 0.04196428507566452,
    "continued-2103.value.43.candidate" : 0,
    "continued-2103.value.43.control" : 0.043478261679410934,
    "continued-2103.value.47.candidate" : 0,
    "continued-2103.value.47.control" : 0.20663875341415405,
    "continued-2103.value.7.candidate" : 0,
    "continued-2103.value.7.control" : 0.015344311483204365,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0,
    "continued-907.conv.10.control" : 0.029789719730615616,
    "continued-907.conv.12.candidate" : 0,
    "continued-907.conv.12.control" : 0.02391304261982441,
    "continued-907.conv.13.candidate" : 0,
    "continued-907.conv.13.control" : 0.02947443164885044,
    "continued-907.conv.14.candidate" : 0,
    "continued-907.conv.14.control" : 0.022972973063588142,
    "continued-907.conv.16.candidate" : 0,
    "continued-907.conv.16.control" : 0.03890306130051613,
    "continued-907.conv.17.candidate" : 0,
    "continued-907.conv.17.control" : 0.06345177441835403,
    "continued-907.conv.18.candidate" : 0,
    "continued-907.conv.18.control" : 0.03619909659028053,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0.010362694039940834,
    "continued-907.conv.20.candidate" : 0,
    "continued-907.conv.20.control" : 0.03021327033638954,
    "continued-907.conv.21.candidate" : 0,
    "continued-907.conv.21.control" : 0.03286384791135788,
    "continued-907.conv.22.candidate" : 0,
    "continued-907.conv.22.control" : 0.021511884406208992,
    "continued-907.conv.24.candidate" : 0,
    "continued-907.conv.24.control" : 0.03551912680268288,
    "continued-907.conv.25.candidate" : 0,
    "continued-907.conv.25.control" : 0.04055771604180336,
    "continued-907.conv.26.candidate" : 0,
    "continued-907.conv.26.control" : 0.044798705726861954,
    "continued-907.conv.28.candidate" : 0,
    "continued-907.conv.28.control" : 0.04216867312788963,
    "continued-907.conv.29.candidate" : 0,
    "continued-907.conv.29.control" : 0.07734806835651398,
    "continued-907.conv.30.candidate" : 0,
    "continued-907.conv.30.control" : 0.07172416150569916,
    "continued-907.conv.32.candidate" : 0,
    "continued-907.conv.32.control" : 0.09246575087308884,
    "continued-907.conv.33.candidate" : 0,
    "continued-907.conv.33.control" : 0.0634615421295166,
    "continued-907.conv.34.candidate" : 0,
    "continued-907.conv.34.control" : 0.08472222089767456,
    "continued-907.conv.36.candidate" : 0,
    "continued-907.conv.36.control" : 0.06627906858921051,
    "continued-907.conv.37.candidate" : 0,
    "continued-907.conv.37.control" : 0.07138625532388687,
    "continued-907.conv.38.candidate" : 0,
    "continued-907.conv.38.control" : 0.0394345223903656,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0.008196720853447914,
    "continued-907.conv.40.candidate" : 0,
    "continued-907.conv.40.control" : 0.06929347664117813,
    "continued-907.conv.41.candidate" : 0,
    "continued-907.conv.41.control" : 0.061567164957523346,
    "continued-907.conv.42.candidate" : 0,
    "continued-907.conv.42.control" : 0.051355697214603424,
    "continued-907.conv.44.candidate" : 0,
    "continued-907.conv.44.control" : 0.09876543283462524,
    "continued-907.conv.45.candidate" : 0,
    "continued-907.conv.45.control" : 0.0607638880610466,
    "continued-907.conv.46.candidate" : 0,
    "continued-907.conv.46.control" : 0.04368279501795769,
    "continued-907.conv.5.candidate" : 0,
    "continued-907.conv.5.control" : 0.026209676638245583,
    "continued-907.conv.6.candidate" : 0,
    "continued-907.conv.6.control" : 0.02500000037252903,
    "continued-907.conv.8.candidate" : 0,
    "continued-907.conv.8.control" : 0.021531101316213608,
    "continued-907.conv.9.candidate" : 0,
    "continued-907.conv.9.control" : 0.018269231542944908,
    "continued-907.index.11.candidate" : 0,
    "continued-907.index.11.control" : 0.037133488804101944,
    "continued-907.index.15.candidate" : 0,
    "continued-907.index.15.control" : 0.04318820312619209,
    "continued-907.index.19.candidate" : 0,
    "continued-907.index.19.control" : 0.04394977167248726,
    "continued-907.index.23.candidate" : 0,
    "continued-907.index.23.control" : 0.03504464402794838,
    "continued-907.index.27.candidate" : 0,
    "continued-907.index.27.control" : 0.033478688448667526,
    "continued-907.index.3.candidate" : 0,
    "continued-907.index.3.control" : 0.018491124734282494,
    "continued-907.index.31.candidate" : 0,
    "continued-907.index.31.control" : 0.15060241520404816,
    "continued-907.index.35.candidate" : 0,
    "continued-907.index.35.control" : 0.11589404195547104,
    "continued-907.index.39.candidate" : 0,
    "continued-907.index.39.control" : 0.04113924130797386,
    "continued-907.index.43.candidate" : 0,
    "continued-907.index.43.control" : 0.04204101487994194,
    "continued-907.index.47.candidate" : 0,
    "continued-907.index.47.control" : 0.08500000089406967,
    "continued-907.index.7.candidate" : 0,
    "continued-907.index.7.control" : 0.022518381476402283,
    "continued-907.key.11.candidate" : 0,
    "continued-907.key.11.control" : 0.07007211446762085,
    "continued-907.key.15.candidate" : 0,
    "continued-907.key.15.control" : 0.07892335951328278,
    "continued-907.key.19.candidate" : 0,
    "continued-907.key.19.control" : 0.10470085591077805,
    "continued-907.key.23.candidate" : 0,
    "continued-907.key.23.control" : 0.07895833253860474,
    "continued-907.key.27.candidate" : 0,
    "continued-907.key.27.control" : 0.11711040139198303,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0.0241116750985384,
    "continued-907.key.31.candidate" : 0,
    "continued-907.key.31.control" : 0.1626468151807785,
    "continued-907.key.35.candidate" : 0,
    "continued-907.key.35.control" : 0.1450381726026535,
    "continued-907.key.39.candidate" : 0,
    "continued-907.key.39.control" : 0.09121093899011612,
    "continued-907.key.43.candidate" : 0,
    "continued-907.key.43.control" : 0.08588435500860214,
    "continued-907.key.47.candidate" : 0,
    "continued-907.key.47.control" : 0.1213991791009903,
    "continued-907.key.7.candidate" : 0,
    "continued-907.key.7.control" : 0.05255681648850441,
    "continued-907.logits.candidate" : 0,
    "continued-907.logits.control" : 0.08747779577970505,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 4.455870111996774e-06,
    "continued-907.ssm.10.candidate" : 0,
    "continued-907.ssm.10.control" : 0.0307770948857069,
    "continued-907.ssm.12.candidate" : 0,
    "continued-907.ssm.12.control" : 0.0036982554011046886,
    "continued-907.ssm.13.candidate" : 0,
    "continued-907.ssm.13.control" : 0.02262263000011444,
    "continued-907.ssm.14.candidate" : 0,
    "continued-907.ssm.14.control" : 0.007654080167412758,
    "continued-907.ssm.16.candidate" : 0,
    "continued-907.ssm.16.control" : 0.024267904460430145,
    "continued-907.ssm.17.candidate" : 0,
    "continued-907.ssm.17.control" : 0.0490289032459259,
    "continued-907.ssm.18.candidate" : 0,
    "continued-907.ssm.18.control" : 0.050599321722984314,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0.002372168703004718,
    "continued-907.ssm.20.candidate" : 0,
    "continued-907.ssm.20.control" : 0.01695825718343258,
    "continued-907.ssm.21.candidate" : 0,
    "continued-907.ssm.21.control" : 0.01912170648574829,
    "continued-907.ssm.22.candidate" : 0,
    "continued-907.ssm.22.control" : 0.004077761899679899,
    "continued-907.ssm.24.candidate" : 0,
    "continued-907.ssm.24.control" : 0.031608279794454575,
    "continued-907.ssm.25.candidate" : 0,
    "continued-907.ssm.25.control" : 0.08109430223703384,
    "continued-907.ssm.26.candidate" : 0,
    "continued-907.ssm.26.control" : 0.08810781687498093,
    "continued-907.ssm.28.candidate" : 0,
    "continued-907.ssm.28.control" : 0.003861313220113516,
    "continued-907.ssm.29.candidate" : 0,
    "continued-907.ssm.29.control" : 0.07301811873912811,
    "continued-907.ssm.30.candidate" : 0,
    "continued-907.ssm.30.control" : 0.041991058737039566,
    "continued-907.ssm.32.candidate" : 0,
    "continued-907.ssm.32.control" : 0.055181100964546204,
    "continued-907.ssm.33.candidate" : 0,
    "continued-907.ssm.33.control" : 0.10662690550088882,
    "continued-907.ssm.34.candidate" : 0,
    "continued-907.ssm.34.control" : 0.09105804562568665,
    "continued-907.ssm.36.candidate" : 0,
    "continued-907.ssm.36.control" : 0.0348682627081871,
    "continued-907.ssm.37.candidate" : 0,
    "continued-907.ssm.37.control" : 0.03931138291954994,
    "continued-907.ssm.38.candidate" : 0,
    "continued-907.ssm.38.control" : 0.015864377841353416,
    "continued-907.ssm.4.candidate" : 0,
    "continued-907.ssm.4.control" : 0.004712333902716637,
    "continued-907.ssm.40.candidate" : 0,
    "continued-907.ssm.40.control" : 0.015666183084249496,
    "continued-907.ssm.41.candidate" : 0,
    "continued-907.ssm.41.control" : 0.010922777466475964,
    "continued-907.ssm.42.candidate" : 0,
    "continued-907.ssm.42.control" : 0.03438224270939827,
    "continued-907.ssm.44.candidate" : 0,
    "continued-907.ssm.44.control" : 0.01431201957166195,
    "continued-907.ssm.45.candidate" : 0,
    "continued-907.ssm.45.control" : 0.061963144689798355,
    "continued-907.ssm.46.candidate" : 0,
    "continued-907.ssm.46.control" : 0.07795266807079315,
    "continued-907.ssm.5.candidate" : 0,
    "continued-907.ssm.5.control" : 0.038865990936756134,
    "continued-907.ssm.6.candidate" : 0,
    "continued-907.ssm.6.control" : 0.04563584178686142,
    "continued-907.ssm.8.candidate" : 0,
    "continued-907.ssm.8.control" : 0.01144445687532425,
    "continued-907.ssm.9.candidate" : 0,
    "continued-907.ssm.9.control" : 0.02806168794631958,
    "continued-907.value.11.candidate" : 0,
    "continued-907.value.11.control" : 0.017535971477627754,
    "continued-907.value.15.candidate" : 0,
    "continued-907.value.15.control" : 0.0219123512506485,
    "continued-907.value.19.candidate" : 0,
    "continued-907.value.19.control" : 0.019897958263754845,
    "continued-907.value.23.candidate" : 0,
    "continued-907.value.23.control" : 0.04127907007932663,
    "continued-907.value.27.candidate" : 0,
    "continued-907.value.27.control" : 0.012838724069297314,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0.013548950664699078,
    "continued-907.value.31.candidate" : 0,
    "continued-907.value.31.control" : 0.054891303181648254,
    "continued-907.value.35.candidate" : 0,
    "continued-907.value.35.control" : 0.07065217196941376,
    "continued-907.value.39.candidate" : 0,
    "continued-907.value.39.control" : 0.04196428507566452,
    "continued-907.value.43.candidate" : 0,
    "continued-907.value.43.control" : 0.043478261679410934,
    "continued-907.value.47.candidate" : 0,
    "continued-907.value.47.control" : 0.20663875341415405,
    "continued-907.value.7.candidate" : 0,
    "continued-907.value.7.control" : 0.015344311483204365,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0,
    "prefill.conv.10.control" : 0.02102803811430931,
    "prefill.conv.12.candidate" : 0,
    "prefill.conv.12.control" : 0.01430027186870575,
    "prefill.conv.13.candidate" : 0,
    "prefill.conv.13.control" : 0.01909538358449936,
    "prefill.conv.14.candidate" : 0,
    "prefill.conv.14.control" : 0.02189265564084053,
    "prefill.conv.16.candidate" : 0,
    "prefill.conv.16.control" : 0.03226562589406967,
    "prefill.conv.17.candidate" : 0,
    "prefill.conv.17.control" : 0.03684210404753685,
    "prefill.conv.18.candidate" : 0,
    "prefill.conv.18.control" : 0.027149321511387825,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0.009523809887468815,
    "prefill.conv.20.candidate" : 0,
    "prefill.conv.20.control" : 0.035545025020837784,
    "prefill.conv.21.candidate" : 0,
    "prefill.conv.21.control" : 0.03333333507180214,
    "prefill.conv.22.candidate" : 0,
    "prefill.conv.22.control" : 0.019366197288036346,
    "prefill.conv.24.candidate" : 0,
    "prefill.conv.24.control" : 0.03750000149011612,
    "prefill.conv.25.candidate" : 0,
    "prefill.conv.25.control" : 0.03971962630748749,
    "prefill.conv.26.candidate" : 0,
    "prefill.conv.26.control" : 0.05715090036392212,
    "prefill.conv.28.candidate" : 0,
    "prefill.conv.28.control" : 0.05220883712172508,
    "prefill.conv.29.candidate" : 0,
    "prefill.conv.29.control" : 0.07734806835651398,
    "prefill.conv.30.candidate" : 0,
    "prefill.conv.30.control" : 0.07172416150569916,
    "prefill.conv.32.candidate" : 0,
    "prefill.conv.32.control" : 0.09246575087308884,
    "prefill.conv.33.candidate" : 0,
    "prefill.conv.33.control" : 0.0654296875,
    "prefill.conv.34.candidate" : 0,
    "prefill.conv.34.control" : 0.08472222089767456,
    "prefill.conv.36.candidate" : 0,
    "prefill.conv.36.control" : 0.08837209641933441,
    "prefill.conv.37.candidate" : 0,
    "prefill.conv.37.control" : 0.06784909963607788,
    "prefill.conv.38.candidate" : 0,
    "prefill.conv.38.control" : 0.0394345223903656,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0.03112192638218403,
    "prefill.conv.40.candidate" : 0,
    "prefill.conv.40.control" : 0.061141304671764374,
    "prefill.conv.41.candidate" : 0,
    "prefill.conv.41.control" : 0.061567164957523346,
    "prefill.conv.42.candidate" : 0,
    "prefill.conv.42.control" : 0.044964030385017395,
    "prefill.conv.44.candidate" : 0,
    "prefill.conv.44.control" : 0.04938271641731262,
    "prefill.conv.45.candidate" : 0,
    "prefill.conv.45.control" : 0.0486111119389534,
    "prefill.conv.46.candidate" : 0,
    "prefill.conv.46.control" : 0.04301075264811516,
    "prefill.conv.5.candidate" : 0,
    "prefill.conv.5.control" : 0.036002304404973984,
    "prefill.conv.6.candidate" : 0,
    "prefill.conv.6.control" : 0.021313363686203957,
    "prefill.conv.8.candidate" : 0,
    "prefill.conv.8.control" : 0.019704433158040047,
    "prefill.conv.9.candidate" : 0,
    "prefill.conv.9.control" : 0.03076923079788685,
    "prefill.index.11.candidate" : 0,
    "prefill.index.11.control" : 0.037133488804101944,
    "prefill.index.15.candidate" : 0,
    "prefill.index.15.control" : 0.04318820312619209,
    "prefill.index.19.candidate" : 0,
    "prefill.index.19.control" : 0.04394977167248726,
    "prefill.index.23.candidate" : 0,
    "prefill.index.23.control" : 0.03504464402794838,
    "prefill.index.27.candidate" : 0,
    "prefill.index.27.control" : 0.033478688448667526,
    "prefill.index.3.candidate" : 0,
    "prefill.index.3.control" : 0.018491124734282494,
    "prefill.index.31.candidate" : 0,
    "prefill.index.31.control" : 0.15060241520404816,
    "prefill.index.35.candidate" : 0,
    "prefill.index.35.control" : 0.11589404195547104,
    "prefill.index.39.candidate" : 0,
    "prefill.index.39.control" : 0.04113924130797386,
    "prefill.index.43.candidate" : 0,
    "prefill.index.43.control" : 0.04204101487994194,
    "prefill.index.47.candidate" : 0,
    "prefill.index.47.control" : 0.08500000089406967,
    "prefill.index.7.candidate" : 0,
    "prefill.index.7.control" : 0.022518381476402283,
    "prefill.key.11.candidate" : 0,
    "prefill.key.11.control" : 0.07007211446762085,
    "prefill.key.15.candidate" : 0,
    "prefill.key.15.control" : 0.07892335951328278,
    "prefill.key.19.candidate" : 0,
    "prefill.key.19.control" : 0.10470085591077805,
    "prefill.key.23.candidate" : 0,
    "prefill.key.23.control" : 0.07895833253860474,
    "prefill.key.27.candidate" : 0,
    "prefill.key.27.control" : 0.11711040139198303,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0.0241116750985384,
    "prefill.key.31.candidate" : 0,
    "prefill.key.31.control" : 0.1626468151807785,
    "prefill.key.35.candidate" : 0,
    "prefill.key.35.control" : 0.1450381726026535,
    "prefill.key.39.candidate" : 0,
    "prefill.key.39.control" : 0.09121093899011612,
    "prefill.key.43.candidate" : 0,
    "prefill.key.43.control" : 0.08588435500860214,
    "prefill.key.47.candidate" : 0,
    "prefill.key.47.control" : 0.1213991791009903,
    "prefill.key.7.candidate" : 0,
    "prefill.key.7.control" : 0.05255681648850441,
    "prefill.logits.candidate" : 0,
    "prefill.logits.control" : 0.14112408459186554,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 4.74084981760825e-06,
    "prefill.ssm.10.candidate" : 0,
    "prefill.ssm.10.control" : 0.03759448975324631,
    "prefill.ssm.12.candidate" : 0,
    "prefill.ssm.12.control" : 0.003857339033856988,
    "prefill.ssm.13.candidate" : 0,
    "prefill.ssm.13.control" : 0.01709580607712269,
    "prefill.ssm.14.candidate" : 0,
    "prefill.ssm.14.control" : 0.00830934103578329,
    "prefill.ssm.16.candidate" : 0,
    "prefill.ssm.16.control" : 0.0279969722032547,
    "prefill.ssm.17.candidate" : 0,
    "prefill.ssm.17.control" : 0.011432960629463196,
    "prefill.ssm.18.candidate" : 0,
    "prefill.ssm.18.control" : 0.02383866347372532,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0.001781997736543417,
    "prefill.ssm.20.candidate" : 0,
    "prefill.ssm.20.control" : 0.024013806134462357,
    "prefill.ssm.21.candidate" : 0,
    "prefill.ssm.21.control" : 0.019731270149350166,
    "prefill.ssm.22.candidate" : 0,
    "prefill.ssm.22.control" : 0.004100806079804897,
    "prefill.ssm.24.candidate" : 0,
    "prefill.ssm.24.control" : 0.054881006479263306,
    "prefill.ssm.25.candidate" : 0,
    "prefill.ssm.25.control" : 0.0673423707485199,
    "prefill.ssm.26.candidate" : 0,
    "prefill.ssm.26.control" : 0.047217752784490585,
    "prefill.ssm.28.candidate" : 0,
    "prefill.ssm.28.control" : 0.00406047236174345,
    "prefill.ssm.29.candidate" : 0,
    "prefill.ssm.29.control" : 0.06293836236000061,
    "prefill.ssm.30.candidate" : 0,
    "prefill.ssm.30.control" : 0.09470593184232712,
    "prefill.ssm.32.candidate" : 0,
    "prefill.ssm.32.control" : 0.16841714084148407,
    "prefill.ssm.33.candidate" : 0,
    "prefill.ssm.33.control" : 0.06534859538078308,
    "prefill.ssm.34.candidate" : 0,
    "prefill.ssm.34.control" : 0.06899509578943253,
    "prefill.ssm.36.candidate" : 0,
    "prefill.ssm.36.control" : 0.05446093901991844,
    "prefill.ssm.37.candidate" : 0,
    "prefill.ssm.37.control" : 0.03282606229186058,
    "prefill.ssm.38.candidate" : 0,
    "prefill.ssm.38.control" : 0.02024087868630886,
    "prefill.ssm.4.candidate" : 0,
    "prefill.ssm.4.control" : 0.00866289995610714,
    "prefill.ssm.40.candidate" : 0,
    "prefill.ssm.40.control" : 0.01576247438788414,
    "prefill.ssm.41.candidate" : 0,
    "prefill.ssm.41.control" : 0.010871934704482555,
    "prefill.ssm.42.candidate" : 0,
    "prefill.ssm.42.control" : 0.038815125823020935,
    "prefill.ssm.44.candidate" : 0,
    "prefill.ssm.44.control" : 0.014484899118542671,
    "prefill.ssm.45.candidate" : 0,
    "prefill.ssm.45.control" : 0.061037998646497726,
    "prefill.ssm.46.candidate" : 0,
    "prefill.ssm.46.control" : 0.09365357458591461,
    "prefill.ssm.5.candidate" : 0,
    "prefill.ssm.5.control" : 0.03137284889817238,
    "prefill.ssm.6.candidate" : 0,
    "prefill.ssm.6.control" : 0.018186917528510094,
    "prefill.ssm.8.candidate" : 0,
    "prefill.ssm.8.control" : 0.006346123293042183,
    "prefill.ssm.9.candidate" : 0,
    "prefill.ssm.9.control" : 0.02983652800321579,
    "prefill.value.11.candidate" : 0,
    "prefill.value.11.control" : 0.017535971477627754,
    "prefill.value.15.candidate" : 0,
    "prefill.value.15.control" : 0.0219123512506485,
    "prefill.value.19.candidate" : 0,
    "prefill.value.19.control" : 0.019897958263754845,
    "prefill.value.23.candidate" : 0,
    "prefill.value.23.control" : 0.04127907007932663,
    "prefill.value.27.candidate" : 0,
    "prefill.value.27.control" : 0.012838724069297314,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0.013548950664699078,
    "prefill.value.31.candidate" : 0,
    "prefill.value.31.control" : 0.054891303181648254,
    "prefill.value.35.candidate" : 0,
    "prefill.value.35.control" : 0.07065217196941376,
    "prefill.value.39.candidate" : 0,
    "prefill.value.39.control" : 0.04196428507566452,
    "prefill.value.43.candidate" : 0,
    "prefill.value.43.control" : 0.043478261679410934,
    "prefill.value.47.candidate" : 0,
    "prefill.value.47.control" : 0.20663875341415405,
    "prefill.value.7.candidate" : 0,
    "prefill.value.7.control" : 0.015344311483204365,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0,
    "rollback-1.conv.10.control" : 0.024501172825694084,
    "rollback-1.conv.12.candidate" : 0,
    "rollback-1.conv.12.control" : 0.023333333432674408,
    "rollback-1.conv.13.candidate" : 0,
    "rollback-1.conv.13.control" : 0.031593408435583115,
    "rollback-1.conv.14.candidate" : 0,
    "rollback-1.conv.14.control" : 0.027631578966975212,
    "rollback-1.conv.16.candidate" : 0,
    "rollback-1.conv.16.control" : 0.032499998807907104,
    "rollback-1.conv.17.candidate" : 0,
    "rollback-1.conv.17.control" : 0.03723404183983803,
    "rollback-1.conv.18.candidate" : 0,
    "rollback-1.conv.18.control" : 0.028409091755747795,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0.004566209856420755,
    "rollback-1.conv.20.candidate" : 0,
    "rollback-1.conv.20.control" : 0.03502415493130684,
    "rollback-1.conv.21.candidate" : 0,
    "rollback-1.conv.21.control" : 0.032630812376737595,
    "rollback-1.conv.22.candidate" : 0,
    "rollback-1.conv.22.control" : 0.028368793427944183,
    "rollback-1.conv.24.candidate" : 0,
    "rollback-1.conv.24.control" : 0.05833333358168602,
    "rollback-1.conv.25.candidate" : 0,
    "rollback-1.conv.25.control" : 0.0550239235162735,
    "rollback-1.conv.26.candidate" : 0,
    "rollback-1.conv.26.control" : 0.05088495463132858,
    "rollback-1.conv.28.candidate" : 0,
    "rollback-1.conv.28.control" : 0.048155736178159714,
    "rollback-1.conv.29.candidate" : 0,
    "rollback-1.conv.29.control" : 0.04993872717022896,
    "rollback-1.conv.30.candidate" : 0,
    "rollback-1.conv.30.control" : 0.08290155231952667,
    "rollback-1.conv.32.candidate" : 0,
    "rollback-1.conv.32.control" : 0.06648936122655869,
    "rollback-1.conv.33.candidate" : 0,
    "rollback-1.conv.33.control" : 0.060546875,
    "rollback-1.conv.34.candidate" : 0,
    "rollback-1.conv.34.control" : 0.06991525739431381,
    "rollback-1.conv.36.candidate" : 0,
    "rollback-1.conv.36.control" : 0.07635468244552612,
    "rollback-1.conv.37.candidate" : 0,
    "rollback-1.conv.37.control" : 0.0746445506811142,
    "rollback-1.conv.38.candidate" : 0,
    "rollback-1.conv.38.control" : 0.046310242265462875,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0.005635245703160763,
    "rollback-1.conv.40.candidate" : 0,
    "rollback-1.conv.40.control" : 0.07890070974826813,
    "rollback-1.conv.41.candidate" : 0,
    "rollback-1.conv.41.control" : 0.08235294371843338,
    "rollback-1.conv.42.candidate" : 0,
    "rollback-1.conv.42.control" : 0.05517241358757019,
    "rollback-1.conv.44.candidate" : 0,
    "rollback-1.conv.44.control" : 0.0602409653365612,
    "rollback-1.conv.45.candidate" : 0,
    "rollback-1.conv.45.control" : 0.0491071417927742,
    "rollback-1.conv.46.candidate" : 0,
    "rollback-1.conv.46.control" : 0.05740131437778473,
    "rollback-1.conv.5.candidate" : 0,
    "rollback-1.conv.5.control" : 0.015917055308818817,
    "rollback-1.conv.6.candidate" : 0,
    "rollback-1.conv.6.control" : 0.00845410581678152,
    "rollback-1.conv.8.candidate" : 0,
    "rollback-1.conv.8.control" : 0.015318627469241619,
    "rollback-1.conv.9.candidate" : 0,
    "rollback-1.conv.9.control" : 0.02822580561041832,
    "rollback-1.index.11.candidate" : 0,
    "rollback-1.index.11.control" : 0.037133488804101944,
    "rollback-1.index.15.candidate" : 0,
    "rollback-1.index.15.control" : 0.04318820312619209,
    "rollback-1.index.19.candidate" : 0,
    "rollback-1.index.19.control" : 0.04394977167248726,
    "rollback-1.index.23.candidate" : 0,
    "rollback-1.index.23.control" : 0.03504464402794838,
    "rollback-1.index.27.candidate" : 0,
    "rollback-1.index.27.control" : 0.033478688448667526,
    "rollback-1.index.3.candidate" : 0,
    "rollback-1.index.3.control" : 0.018491124734282494,
    "rollback-1.index.31.candidate" : 0,
    "rollback-1.index.31.control" : 0.15060241520404816,
    "rollback-1.index.35.candidate" : 0,
    "rollback-1.index.35.control" : 0.11589404195547104,
    "rollback-1.index.39.candidate" : 0,
    "rollback-1.index.39.control" : 0.04113924130797386,
    "rollback-1.index.43.candidate" : 0,
    "rollback-1.index.43.control" : 0.04204101487994194,
    "rollback-1.index.47.candidate" : 0,
    "rollback-1.index.47.control" : 0.08500000089406967,
    "rollback-1.index.7.candidate" : 0,
    "rollback-1.index.7.control" : 0.022518381476402283,
    "rollback-1.key.11.candidate" : 0,
    "rollback-1.key.11.control" : 0.07007211446762085,
    "rollback-1.key.15.candidate" : 0,
    "rollback-1.key.15.control" : 0.07892335951328278,
    "rollback-1.key.19.candidate" : 0,
    "rollback-1.key.19.control" : 0.10470085591077805,
    "rollback-1.key.23.candidate" : 0,
    "rollback-1.key.23.control" : 0.07895833253860474,
    "rollback-1.key.27.candidate" : 0,
    "rollback-1.key.27.control" : 0.11711040139198303,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0.0241116750985384,
    "rollback-1.key.31.candidate" : 0,
    "rollback-1.key.31.control" : 0.1626468151807785,
    "rollback-1.key.35.candidate" : 0,
    "rollback-1.key.35.control" : 0.1450381726026535,
    "rollback-1.key.39.candidate" : 0,
    "rollback-1.key.39.control" : 0.09121093899011612,
    "rollback-1.key.43.candidate" : 0,
    "rollback-1.key.43.control" : 0.08588435500860214,
    "rollback-1.key.47.candidate" : 0,
    "rollback-1.key.47.control" : 0.1213991791009903,
    "rollback-1.key.7.candidate" : 0,
    "rollback-1.key.7.control" : 0.05255681648850441,
    "rollback-1.logits.candidate" : 0,
    "rollback-1.logits.control" : 0.07965008914470673,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 3.935479981009848e-06,
    "rollback-1.ssm.10.candidate" : 0,
    "rollback-1.ssm.10.control" : 0.0344783253967762,
    "rollback-1.ssm.12.candidate" : 0,
    "rollback-1.ssm.12.control" : 0.005330992396920919,
    "rollback-1.ssm.13.candidate" : 0,
    "rollback-1.ssm.13.control" : 0.022218629717826843,
    "rollback-1.ssm.14.candidate" : 0,
    "rollback-1.ssm.14.control" : 0.010135672055184841,
    "rollback-1.ssm.16.candidate" : 0,
    "rollback-1.ssm.16.control" : 0.030662208795547485,
    "rollback-1.ssm.17.candidate" : 0,
    "rollback-1.ssm.17.control" : 0.040015462785959244,
    "rollback-1.ssm.18.candidate" : 0,
    "rollback-1.ssm.18.control" : 0.03490535169839859,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0.0023009181022644043,
    "rollback-1.ssm.20.candidate" : 0,
    "rollback-1.ssm.20.control" : 0.021612130105495453,
    "rollback-1.ssm.21.candidate" : 0,
    "rollback-1.ssm.21.control" : 0.020330410450696945,
    "rollback-1.ssm.22.candidate" : 0,
    "rollback-1.ssm.22.control" : 0.006753056775778532,
    "rollback-1.ssm.24.candidate" : 0,
    "rollback-1.ssm.24.control" : 0.03824663907289505,
    "rollback-1.ssm.25.candidate" : 0,
    "rollback-1.ssm.25.control" : 0.05765566974878311,
    "rollback-1.ssm.26.candidate" : 0,
    "rollback-1.ssm.26.control" : 0.09496699273586273,
    "rollback-1.ssm.28.candidate" : 0,
    "rollback-1.ssm.28.control" : 0.004367211367934942,
    "rollback-1.ssm.29.candidate" : 0,
    "rollback-1.ssm.29.control" : 0.07781665772199631,
    "rollback-1.ssm.30.candidate" : 0,
    "rollback-1.ssm.30.control" : 0.031036222353577614,
    "rollback-1.ssm.32.candidate" : 0,
    "rollback-1.ssm.32.control" : 0.1460849791765213,
    "rollback-1.ssm.33.candidate" : 0,
    "rollback-1.ssm.33.control" : 0.10402413457632065,
    "rollback-1.ssm.34.candidate" : 0,
    "rollback-1.ssm.34.control" : 0.08971881121397018,
    "rollback-1.ssm.36.candidate" : 0,
    "rollback-1.ssm.36.control" : 0.0664653554558754,
    "rollback-1.ssm.37.candidate" : 0,
    "rollback-1.ssm.37.control" : 0.04842289909720421,
    "rollback-1.ssm.38.candidate" : 0,
    "rollback-1.ssm.38.control" : 0.020191079005599022,
    "rollback-1.ssm.4.candidate" : 0,
    "rollback-1.ssm.4.control" : 0.007861420512199402,
    "rollback-1.ssm.40.candidate" : 0,
    "rollback-1.ssm.40.control" : 0.01511641126126051,
    "rollback-1.ssm.41.candidate" : 0,
    "rollback-1.ssm.41.control" : 0.010043313726782799,
    "rollback-1.ssm.42.candidate" : 0,
    "rollback-1.ssm.42.control" : 0.06658878922462463,
    "rollback-1.ssm.44.candidate" : 0,
    "rollback-1.ssm.44.control" : 0.019495664164423943,
    "rollback-1.ssm.45.candidate" : 0,
    "rollback-1.ssm.45.control" : 0.06541872769594193,
    "rollback-1.ssm.46.candidate" : 0,
    "rollback-1.ssm.46.control" : 0.10107998549938202,
    "rollback-1.ssm.5.candidate" : 0,
    "rollback-1.ssm.5.control" : 0.021658699959516525,
    "rollback-1.ssm.6.candidate" : 0,
    "rollback-1.ssm.6.control" : 0.01367704477161169,
    "rollback-1.ssm.8.candidate" : 0,
    "rollback-1.ssm.8.control" : 0.01272396370768547,
    "rollback-1.ssm.9.candidate" : 0,
    "rollback-1.ssm.9.control" : 0.040513474494218826,
    "rollback-1.value.11.candidate" : 0,
    "rollback-1.value.11.control" : 0.017535971477627754,
    "rollback-1.value.15.candidate" : 0,
    "rollback-1.value.15.control" : 0.0219123512506485,
    "rollback-1.value.19.candidate" : 0,
    "rollback-1.value.19.control" : 0.019897958263754845,
    "rollback-1.value.23.candidate" : 0,
    "rollback-1.value.23.control" : 0.04127907007932663,
    "rollback-1.value.27.candidate" : 0,
    "rollback-1.value.27.control" : 0.012838724069297314,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0.013548950664699078,
    "rollback-1.value.31.candidate" : 0,
    "rollback-1.value.31.control" : 0.054891303181648254,
    "rollback-1.value.35.candidate" : 0,
    "rollback-1.value.35.control" : 0.07065217196941376,
    "rollback-1.value.39.candidate" : 0,
    "rollback-1.value.39.control" : 0.04196428507566452,
    "rollback-1.value.43.candidate" : 0,
    "rollback-1.value.43.control" : 0.043478261679410934,
    "rollback-1.value.47.candidate" : 0,
    "rollback-1.value.47.control" : 0.20663875341415405,
    "rollback-1.value.7.candidate" : 0,
    "rollback-1.value.7.control" : 0.015344311483204365,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0,
    "rollback-2.conv.10.control" : 0.018780048936605453,
    "rollback-2.conv.12.candidate" : 0,
    "rollback-2.conv.12.control" : 0.02364864945411682,
    "rollback-2.conv.13.candidate" : 0,
    "rollback-2.conv.13.control" : 0.03195224702358246,
    "rollback-2.conv.14.candidate" : 0,
    "rollback-2.conv.14.control" : 0.02575306035578251,
    "rollback-2.conv.16.candidate" : 0,
    "rollback-2.conv.16.control" : 0.047029703855514526,
    "rollback-2.conv.17.candidate" : 0,
    "rollback-2.conv.17.control" : 0.042553190141916275,
    "rollback-2.conv.18.candidate" : 0,
    "rollback-2.conv.18.control" : 0.03847222402691841,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0.004926108289510012,
    "rollback-2.conv.20.candidate" : 0,
    "rollback-2.conv.20.control" : 0.036249998956918716,
    "rollback-2.conv.21.candidate" : 0,
    "rollback-2.conv.21.control" : 0.0325581394135952,
    "rollback-2.conv.22.candidate" : 0,
    "rollback-2.conv.22.control" : 0.02857142873108387,
    "rollback-2.conv.24.candidate" : 0,
    "rollback-2.conv.24.control" : 0.030194256454706192,
    "rollback-2.conv.25.candidate" : 0,
    "rollback-2.conv.25.control" : 0.043062202632427216,
    "rollback-2.conv.26.candidate" : 0,
    "rollback-2.conv.26.control" : 0.04146634787321091,
    "rollback-2.conv.28.candidate" : 0,
    "rollback-2.conv.28.control" : 0.038065843284130096,
    "rollback-2.conv.29.candidate" : 0,
    "rollback-2.conv.29.control" : 0.08155079931020737,
    "rollback-2.conv.30.candidate" : 0,
    "rollback-2.conv.30.control" : 0.05699481815099716,
    "rollback-2.conv.32.candidate" : 0,
    "rollback-2.conv.32.control" : 0.07127659767866135,
    "rollback-2.conv.33.candidate" : 0,
    "rollback-2.conv.33.control" : 0.0556640625,
    "rollback-2.conv.34.candidate" : 0,
    "rollback-2.conv.34.control" : 0.07081545144319534,
    "rollback-2.conv.36.candidate" : 0,
    "rollback-2.conv.36.control" : 0.06721697747707367,
    "rollback-2.conv.37.candidate" : 0,
    "rollback-2.conv.37.control" : 0.057041484862565994,
    "rollback-2.conv.38.candidate" : 0,
    "rollback-2.conv.38.control" : 0.032738097012043,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0.0060728746466338634,
    "rollback-2.conv.40.candidate" : 0,
    "rollback-2.conv.40.control" : 0.06560283899307251,
    "rollback-2.conv.41.candidate" : 0,
    "rollback-2.conv.41.control" : 0.06298449635505676,
    "rollback-2.conv.42.candidate" : 0,
    "rollback-2.conv.42.control" : 0.0564236119389534,
    "rollback-2.conv.44.candidate" : 0,
    "rollback-2.conv.44.control" : 0.07970727980136871,
    "rollback-2.conv.45.candidate" : 0,
    "rollback-2.conv.45.control" : 0.04494724050164223,
    "rollback-2.conv.46.candidate" : 0,
    "rollback-2.conv.46.control" : 0.06025552377104759,
    "rollback-2.conv.5.candidate" : 0,
    "rollback-2.conv.5.control" : 0.01606425642967224,
    "rollback-2.conv.6.candidate" : 0,
    "rollback-2.conv.6.control" : 0.011453276500105858,
    "rollback-2.conv.8.candidate" : 0,
    "rollback-2.conv.8.control" : 0.012266002595424652,
    "rollback-2.conv.9.candidate" : 0,
    "rollback-2.conv.9.control" : 0.02401129901409149,
    "rollback-2.index.11.candidate" : 0,
    "rollback-2.index.11.control" : 0.037133488804101944,
    "rollback-2.index.15.candidate" : 0,
    "rollback-2.index.15.control" : 0.04318820312619209,
    "rollback-2.index.19.candidate" : 0,
    "rollback-2.index.19.control" : 0.04394977167248726,
    "rollback-2.index.23.candidate" : 0,
    "rollback-2.index.23.control" : 0.03504464402794838,
    "rollback-2.index.27.candidate" : 0,
    "rollback-2.index.27.control" : 0.033478688448667526,
    "rollback-2.index.3.candidate" : 0,
    "rollback-2.index.3.control" : 0.018491124734282494,
    "rollback-2.index.31.candidate" : 0,
    "rollback-2.index.31.control" : 0.15060241520404816,
    "rollback-2.index.35.candidate" : 0,
    "rollback-2.index.35.control" : 0.11589404195547104,
    "rollback-2.index.39.candidate" : 0,
    "rollback-2.index.39.control" : 0.04113924130797386,
    "rollback-2.index.43.candidate" : 0,
    "rollback-2.index.43.control" : 0.04204101487994194,
    "rollback-2.index.47.candidate" : 0,
    "rollback-2.index.47.control" : 0.08500000089406967,
    "rollback-2.index.7.candidate" : 0,
    "rollback-2.index.7.control" : 0.022518381476402283,
    "rollback-2.key.11.candidate" : 0,
    "rollback-2.key.11.control" : 0.07007211446762085,
    "rollback-2.key.15.candidate" : 0,
    "rollback-2.key.15.control" : 0.07892335951328278,
    "rollback-2.key.19.candidate" : 0,
    "rollback-2.key.19.control" : 0.10470085591077805,
    "rollback-2.key.23.candidate" : 0,
    "rollback-2.key.23.control" : 0.07895833253860474,
    "rollback-2.key.27.candidate" : 0,
    "rollback-2.key.27.control" : 0.11711040139198303,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0.0241116750985384,
    "rollback-2.key.31.candidate" : 0,
    "rollback-2.key.31.control" : 0.1626468151807785,
    "rollback-2.key.35.candidate" : 0,
    "rollback-2.key.35.control" : 0.1450381726026535,
    "rollback-2.key.39.candidate" : 0,
    "rollback-2.key.39.control" : 0.09121093899011612,
    "rollback-2.key.43.candidate" : 0,
    "rollback-2.key.43.control" : 0.08588435500860214,
    "rollback-2.key.47.candidate" : 0,
    "rollback-2.key.47.control" : 0.1213991791009903,
    "rollback-2.key.7.candidate" : 0,
    "rollback-2.key.7.control" : 0.05255681648850441,
    "rollback-2.logits.candidate" : 0,
    "rollback-2.logits.control" : 0.06046845018863678,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 3.898606337315869e-06,
    "rollback-2.ssm.10.candidate" : 0,
    "rollback-2.ssm.10.control" : 0.027197707444429398,
    "rollback-2.ssm.12.candidate" : 0,
    "rollback-2.ssm.12.control" : 0.0027424569707363844,
    "rollback-2.ssm.13.candidate" : 0,
    "rollback-2.ssm.13.control" : 0.029744626954197884,
    "rollback-2.ssm.14.candidate" : 0,
    "rollback-2.ssm.14.control" : 0.017583021894097328,
    "rollback-2.ssm.16.candidate" : 0,
    "rollback-2.ssm.16.control" : 0.029481807723641396,
    "rollback-2.ssm.17.candidate" : 0,
    "rollback-2.ssm.17.control" : 0.034991491585969925,
    "rollback-2.ssm.18.candidate" : 0,
    "rollback-2.ssm.18.control" : 0.06068258732557297,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0.0032669417560100555,
    "rollback-2.ssm.20.candidate" : 0,
    "rollback-2.ssm.20.control" : 0.028981661424040794,
    "rollback-2.ssm.21.candidate" : 0,
    "rollback-2.ssm.21.control" : 0.02416502870619297,
    "rollback-2.ssm.22.candidate" : 0,
    "rollback-2.ssm.22.control" : 0.005942186806350946,
    "rollback-2.ssm.24.candidate" : 0,
    "rollback-2.ssm.24.control" : 0.02878120169043541,
    "rollback-2.ssm.25.candidate" : 0,
    "rollback-2.ssm.25.control" : 0.07765409350395203,
    "rollback-2.ssm.26.candidate" : 0,
    "rollback-2.ssm.26.control" : 0.10078050941228867,
    "rollback-2.ssm.28.candidate" : 0,
    "rollback-2.ssm.28.control" : 0.0029128342866897583,
    "rollback-2.ssm.29.candidate" : 0,
    "rollback-2.ssm.29.control" : 0.07817088067531586,
    "rollback-2.ssm.30.candidate" : 0,
    "rollback-2.ssm.30.control" : 0.0488688126206398,
    "rollback-2.ssm.32.candidate" : 0,
    "rollback-2.ssm.32.control" : 0.05398571863770485,
    "rollback-2.ssm.33.candidate" : 0,
    "rollback-2.ssm.33.control" : 0.07367910444736481,
    "rollback-2.ssm.34.candidate" : 0,
    "rollback-2.ssm.34.control" : 0.09510359168052673,
    "rollback-2.ssm.36.candidate" : 0,
    "rollback-2.ssm.36.control" : 0.04206043854355812,
    "rollback-2.ssm.37.candidate" : 0,
    "rollback-2.ssm.37.control" : 0.05008988082408905,
    "rollback-2.ssm.38.candidate" : 0,
    "rollback-2.ssm.38.control" : 0.016424203291535378,
    "rollback-2.ssm.4.candidate" : 0,
    "rollback-2.ssm.4.control" : 0.0037793403025716543,
    "rollback-2.ssm.40.candidate" : 0,
    "rollback-2.ssm.40.control" : 0.01536477543413639,
    "rollback-2.ssm.41.candidate" : 0,
    "rollback-2.ssm.41.control" : 0.010485962964594364,
    "rollback-2.ssm.42.candidate" : 0,
    "rollback-2.ssm.42.control" : 0.040443647652864456,
    "rollback-2.ssm.44.candidate" : 0,
    "rollback-2.ssm.44.control" : 0.013787983916699886,
    "rollback-2.ssm.45.candidate" : 0,
    "rollback-2.ssm.45.control" : 0.05169033631682396,
    "rollback-2.ssm.46.candidate" : 0,
    "rollback-2.ssm.46.control" : 0.09058184921741486,
    "rollback-2.ssm.5.candidate" : 0,
    "rollback-2.ssm.5.control" : 0.024250732734799385,
    "rollback-2.ssm.6.candidate" : 0,
    "rollback-2.ssm.6.control" : 0.014236142858862877,
    "rollback-2.ssm.8.candidate" : 0,
    "rollback-2.ssm.8.control" : 0.005613996181637049,
    "rollback-2.ssm.9.candidate" : 0,
    "rollback-2.ssm.9.control" : 0.04656233638525009,
    "rollback-2.value.11.candidate" : 0,
    "rollback-2.value.11.control" : 0.017535971477627754,
    "rollback-2.value.15.candidate" : 0,
    "rollback-2.value.15.control" : 0.0219123512506485,
    "rollback-2.value.19.candidate" : 0,
    "rollback-2.value.19.control" : 0.019897958263754845,
    "rollback-2.value.23.candidate" : 0,
    "rollback-2.value.23.control" : 0.04127907007932663,
    "rollback-2.value.27.candidate" : 0,
    "rollback-2.value.27.control" : 0.012838724069297314,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0.013548950664699078,
    "rollback-2.value.31.candidate" : 0,
    "rollback-2.value.31.control" : 0.054891303181648254,
    "rollback-2.value.35.candidate" : 0,
    "rollback-2.value.35.control" : 0.07065217196941376,
    "rollback-2.value.39.candidate" : 0,
    "rollback-2.value.39.control" : 0.04196428507566452,
    "rollback-2.value.43.candidate" : 0,
    "rollback-2.value.43.control" : 0.043478261679410934,
    "rollback-2.value.47.candidate" : 0,
    "rollback-2.value.47.control" : 0.20663875341415405,
    "rollback-2.value.7.candidate" : 0,
    "rollback-2.value.7.control" : 0.015344311483204365,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0,
    "rollback-3.conv.10.control" : 0.02167217619717121,
    "rollback-3.conv.12.candidate" : 0,
    "rollback-3.conv.12.control" : 0.02984234318137169,
    "rollback-3.conv.13.candidate" : 0,
    "rollback-3.conv.13.control" : 0.04775280877947807,
    "rollback-3.conv.14.candidate" : 0,
    "rollback-3.conv.14.control" : 0.03221649304032326,
    "rollback-3.conv.16.candidate" : 0,
    "rollback-3.conv.16.control" : 0.041532911360263824,
    "rollback-3.conv.17.candidate" : 0,
    "rollback-3.conv.17.control" : 0.04104729741811752,
    "rollback-3.conv.18.candidate" : 0,
    "rollback-3.conv.18.control" : 0.04888888821005821,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0.004926108289510012,
    "rollback-3.conv.20.candidate" : 0,
    "rollback-3.conv.20.control" : 0.05624999850988388,
    "rollback-3.conv.21.candidate" : 0,
    "rollback-3.conv.21.control" : 0.045764219015836716,
    "rollback-3.conv.22.candidate" : 0,
    "rollback-3.conv.22.control" : 0.02500000037252903,
    "rollback-3.conv.24.candidate" : 0,
    "rollback-3.conv.24.control" : 0.05110497400164604,
    "rollback-3.conv.25.candidate" : 0,
    "rollback-3.conv.25.control" : 0.04940476268529892,
    "rollback-3.conv.26.candidate" : 0,
    "rollback-3.conv.26.control" : 0.06009615212678909,
    "rollback-3.conv.28.candidate" : 0,
    "rollback-3.conv.28.control" : 0.04835391044616699,
    "rollback-3.conv.29.candidate" : 0,
    "rollback-3.conv.29.control" : 0.08288043737411499,
    "rollback-3.conv.30.candidate" : 0,
    "rollback-3.conv.30.control" : 0.06152849644422531,
    "rollback-3.conv.32.candidate" : 0,
    "rollback-3.conv.32.control" : 0.05898268520832062,
    "rollback-3.conv.33.candidate" : 0,
    "rollback-3.conv.33.control" : 0.07065217196941376,
    "rollback-3.conv.34.candidate" : 0,
    "rollback-3.conv.34.control" : 0.08474576473236084,
    "rollback-3.conv.36.candidate" : 0,
    "rollback-3.conv.36.control" : 0.09459459781646729,
    "rollback-3.conv.37.candidate" : 0,
    "rollback-3.conv.37.control" : 0.10917030274868011,
    "rollback-3.conv.38.candidate" : 0,
    "rollback-3.conv.38.control" : 0.0565476194024086,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0.013663968071341515,
    "rollback-3.conv.40.candidate" : 0,
    "rollback-3.conv.40.control" : 0.08776595443487167,
    "rollback-3.conv.41.candidate" : 0,
    "rollback-3.conv.41.control" : 0.0729166641831398,
    "rollback-3.conv.42.candidate" : 0,
    "rollback-3.conv.42.control" : 0.0805121511220932,
    "rollback-3.conv.44.candidate" : 0,
    "rollback-3.conv.44.control" : 0.10138081759214401,
    "rollback-3.conv.45.candidate" : 0,
    "rollback-3.conv.45.control" : 0.04789402335882187,
    "rollback-3.conv.46.candidate" : 0,
    "rollback-3.conv.46.control" : 0.05939226597547531,
    "rollback-3.conv.5.candidate" : 0,
    "rollback-3.conv.5.control" : 0.13052208721637726,
    "rollback-3.conv.6.candidate" : 0,
    "rollback-3.conv.6.control" : 0.021844660863280296,
    "rollback-3.conv.8.candidate" : 0,
    "rollback-3.conv.8.control" : 0.02205023355782032,
    "rollback-3.conv.9.candidate" : 0,
    "rollback-3.conv.9.control" : 0.023949794471263885,
    "rollback-3.index.11.candidate" : 0,
    "rollback-3.index.11.control" : 0.037133488804101944,
    "rollback-3.index.15.candidate" : 0,
    "rollback-3.index.15.control" : 0.0456460677087307,
    "rollback-3.index.19.candidate" : 0,
    "rollback-3.index.19.control" : 0.04394977167248726,
    "rollback-3.index.23.candidate" : 0,
    "rollback-3.index.23.control" : 0.03504464402794838,
    "rollback-3.index.27.candidate" : 0,
    "rollback-3.index.27.control" : 0.033478688448667526,
    "rollback-3.index.3.candidate" : 0,
    "rollback-3.index.3.control" : 0.018491124734282494,
    "rollback-3.index.31.candidate" : 0,
    "rollback-3.index.31.control" : 0.15060241520404816,
    "rollback-3.index.35.candidate" : 0,
    "rollback-3.index.35.control" : 0.11589404195547104,
    "rollback-3.index.39.candidate" : 0,
    "rollback-3.index.39.control" : 0.04113924130797386,
    "rollback-3.index.43.candidate" : 0,
    "rollback-3.index.43.control" : 0.04204101487994194,
    "rollback-3.index.47.candidate" : 0,
    "rollback-3.index.47.control" : 0.08500000089406967,
    "rollback-3.index.7.candidate" : 0,
    "rollback-3.index.7.control" : 0.022518381476402283,
    "rollback-3.key.11.candidate" : 0,
    "rollback-3.key.11.control" : 0.07007211446762085,
    "rollback-3.key.15.candidate" : 0,
    "rollback-3.key.15.control" : 0.07892335951328278,
    "rollback-3.key.19.candidate" : 0,
    "rollback-3.key.19.control" : 0.10470085591077805,
    "rollback-3.key.23.candidate" : 0,
    "rollback-3.key.23.control" : 0.07895833253860474,
    "rollback-3.key.27.candidate" : 0,
    "rollback-3.key.27.control" : 0.11711040139198303,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0.030456852167844772,
    "rollback-3.key.31.candidate" : 0,
    "rollback-3.key.31.control" : 0.1626468151807785,
    "rollback-3.key.35.candidate" : 0,
    "rollback-3.key.35.control" : 0.1450381726026535,
    "rollback-3.key.39.candidate" : 0,
    "rollback-3.key.39.control" : 0.09121093899011612,
    "rollback-3.key.43.candidate" : 0,
    "rollback-3.key.43.control" : 0.08588435500860214,
    "rollback-3.key.47.candidate" : 0,
    "rollback-3.key.47.control" : 0.1213991791009903,
    "rollback-3.key.7.candidate" : 0,
    "rollback-3.key.7.control" : 0.05255681648850441,
    "rollback-3.logits.candidate" : 0,
    "rollback-3.logits.control" : 0.07105809450149536,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 3.864367499772925e-06,
    "rollback-3.ssm.10.candidate" : 0,
    "rollback-3.ssm.10.control" : 0.08204251527786255,
    "rollback-3.ssm.12.candidate" : 0,
    "rollback-3.ssm.12.control" : 0.00397211080417037,
    "rollback-3.ssm.13.candidate" : 0,
    "rollback-3.ssm.13.control" : 0.05075720325112343,
    "rollback-3.ssm.14.candidate" : 0,
    "rollback-3.ssm.14.control" : 0.019048359245061874,
    "rollback-3.ssm.16.candidate" : 0,
    "rollback-3.ssm.16.control" : 0.04501592367887497,
    "rollback-3.ssm.17.candidate" : 0,
    "rollback-3.ssm.17.control" : 0.05534174293279648,
    "rollback-3.ssm.18.candidate" : 0,
    "rollback-3.ssm.18.control" : 0.06360547989606857,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0.0023771370761096478,
    "rollback-3.ssm.20.candidate" : 0,
    "rollback-3.ssm.20.control" : 0.024704163894057274,
    "rollback-3.ssm.21.candidate" : 0,
    "rollback-3.ssm.21.control" : 0.02034204825758934,
    "rollback-3.ssm.22.candidate" : 0,
    "rollback-3.ssm.22.control" : 0.005552635062485933,
    "rollback-3.ssm.24.candidate" : 0,
    "rollback-3.ssm.24.control" : 0.026679223403334618,
    "rollback-3.ssm.25.candidate" : 0,
    "rollback-3.ssm.25.control" : 0.10834430158138275,
    "rollback-3.ssm.26.candidate" : 0,
    "rollback-3.ssm.26.control" : 0.11693833768367767,
    "rollback-3.ssm.28.candidate" : 0,
    "rollback-3.ssm.28.control" : 0.003422223264351487,
    "rollback-3.ssm.29.candidate" : 0,
    "rollback-3.ssm.29.control" : 0.068805031478405,
    "rollback-3.ssm.30.candidate" : 0,
    "rollback-3.ssm.30.control" : 0.03390698879957199,
    "rollback-3.ssm.32.candidate" : 0,
    "rollback-3.ssm.32.control" : 0.03363864868879318,
    "rollback-3.ssm.33.candidate" : 0,
    "rollback-3.ssm.33.control" : 0.07301340252161026,
    "rollback-3.ssm.34.candidate" : 0,
    "rollback-3.ssm.34.control" : 0.12887689471244812,
    "rollback-3.ssm.36.candidate" : 0,
    "rollback-3.ssm.36.control" : 0.10671717673540115,
    "rollback-3.ssm.37.candidate" : 0,
    "rollback-3.ssm.37.control" : 0.059275683015584946,
    "rollback-3.ssm.38.candidate" : 0,
    "rollback-3.ssm.38.control" : 0.01777983270585537,
    "rollback-3.ssm.4.candidate" : 0,
    "rollback-3.ssm.4.control" : 0.007726731244474649,
    "rollback-3.ssm.40.candidate" : 0,
    "rollback-3.ssm.40.control" : 0.03229324892163277,
    "rollback-3.ssm.41.candidate" : 0,
    "rollback-3.ssm.41.control" : 0.011441385373473167,
    "rollback-3.ssm.42.candidate" : 0,
    "rollback-3.ssm.42.control" : 0.04029831290245056,
    "rollback-3.ssm.44.candidate" : 0,
    "rollback-3.ssm.44.control" : 0.07188679277896881,
    "rollback-3.ssm.45.candidate" : 0,
    "rollback-3.ssm.45.control" : 0.1052388995885849,
    "rollback-3.ssm.46.candidate" : 0,
    "rollback-3.ssm.46.control" : 0.06474634259939194,
    "rollback-3.ssm.5.candidate" : 0,
    "rollback-3.ssm.5.control" : 0.0781237855553627,
    "rollback-3.ssm.6.candidate" : 0,
    "rollback-3.ssm.6.control" : 0.03248649090528488,
    "rollback-3.ssm.8.candidate" : 0,
    "rollback-3.ssm.8.control" : 0.010762968100607395,
    "rollback-3.ssm.9.candidate" : 0,
    "rollback-3.ssm.9.control" : 0.05442351475358009,
    "rollback-3.value.11.candidate" : 0,
    "rollback-3.value.11.control" : 0.017535971477627754,
    "rollback-3.value.15.candidate" : 0,
    "rollback-3.value.15.control" : 0.0219123512506485,
    "rollback-3.value.19.candidate" : 0,
    "rollback-3.value.19.control" : 0.019897958263754845,
    "rollback-3.value.23.candidate" : 0,
    "rollback-3.value.23.control" : 0.04127907007932663,
    "rollback-3.value.27.candidate" : 0,
    "rollback-3.value.27.control" : 0.012838724069297314,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0.02097902074456215,
    "rollback-3.value.31.candidate" : 0,
    "rollback-3.value.31.control" : 0.054891303181648254,
    "rollback-3.value.35.candidate" : 0,
    "rollback-3.value.35.control" : 0.07065217196941376,
    "rollback-3.value.39.candidate" : 0,
    "rollback-3.value.39.control" : 0.04196428507566452,
    "rollback-3.value.43.candidate" : 0,
    "rollback-3.value.43.control" : 0.043478261679410934,
    "rollback-3.value.47.candidate" : 0,
    "rollback-3.value.47.control" : 0.20663875341415405,
    "rollback-3.value.7.candidate" : 0,
    "rollback-3.value.7.control" : 0.015344311483204365,
    "routing.candidate" : 0,
    "routing.control" : 0.037665857605177995,
    "workspace_token_tile" : 256
  },
  "name" : "context-small-pass-128-swept-router-padded-attention-aligned-projections-aligned\/tokens=2564\/prefix=2049",
  "passed" : true
}

````

## context-small-projections-sparse-prefix-128-15/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
